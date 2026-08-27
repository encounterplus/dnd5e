#!/usr/bin/env python3
#
# Report localization keys referenced by the system that are missing from
# lang/en.json.
#
# Usage:
#   ./scripts/extract-strings.py             # this system (repository root)
#   ./scripts/extract-strings.py ../morkborg # some other system directory

import argparse
import glob
import re
import os
import pathlib
import json

# Repository root: the parent of the scripts/ directory holding this file.
SYSTEM_ROOT = pathlib.Path(__file__).resolve().parent.parent

def load_lang(directory):
    # Opening JSON file
    with open(f"{directory}/lang/en.json") as json_file:
        data = json.load(json_file)

        return data

def relative(path, directory):
    """Path as shown to the user: relative to the system root."""
    return os.path.relpath(path, directory)

def search(directory):
    try:
        title_regex = re.compile(r'"title": ?"([\w\.]+)"')
        placeholder_regex = re.compile(r'"placeholder": ?"([\w\.]+)"')
        template_regex = re.compile(r'\{\{["\']([\w\d\.]+)["\']\|(l|localize)\}\}')
        type_regex = re.compile(r'"[\w\d]+": ?"([A-Z][\w\.\-]+)"')
    except Exception as e:
        print('Regex does not compile')

    # regex search in all json files
    for f in glob.glob(f"{directory}/**/*.json", recursive=True):
        # if "character" in f:
        #     continue

        name = relative(f, directory)
        with open(f) as _file:
            for i, line in enumerate(_file.readlines()):
                
                for match in title_regex.finditer(line):
                    print(f"{name}:{i}: {line.strip()}")
                    yield match.group(1).strip()

                for match in placeholder_regex.finditer(line):
                    print(f"{name}:{i}: {line.strip()}")
                    yield match.group(1).strip()

                for match in template_regex.finditer(line):
                    print(f"{name}:{i}: {line.strip()}")
                    yield match.group(1).strip()

    # regex search in markdown json files
    for f in glob.glob(f"{directory}/**/*.md", recursive=True):
        # if "character" in f:
        #     continue

        name = relative(f, directory)
        with open(f) as _file:
            for i, line in enumerate(_file.readlines()):
                for match in template_regex.finditer(line):
                    print(f"{name}:{i}: {line.strip()}")
                    yield match.group(1).strip()

    # special regex serach in types.json
    types_file = pathlib.Path(directory) / "types.json"
    if types_file.is_file():
        with open(types_file) as _file:
            for i, line in enumerate(_file.readlines()):

                for match in type_regex.finditer(line):
                    print(f"{relative(types_file, directory)}:{i}: {line.strip()}")
                    yield match.group(1).strip()

def parse_args():
    parser = argparse.ArgumentParser(
        usage='%(prog)s [options] [directory]',
        description=f'Defaults to the system root: {SYSTEM_ROOT}',
        formatter_class=argparse.RawDescriptionHelpFormatter
    )
    parser.add_argument('directory', type=str, nargs='?', default=str(SYSTEM_ROOT))
    args = parser.parse_args()

    directory = pathlib.Path(args.directory).resolve()
    if not os.path.isdir(directory):
        parser.error('Directory is not valid')
    return directory

if __name__ == '__main__':
    directory = parse_args()
    strings = set()
    lang = set()

    lang = load_lang(directory).keys()

    for match in search(directory):
        if "." in match and match not in lang:
            strings.add(match)

    print("--missing keys--")
    for string in sorted(strings):
        # print(string)
        value = string.split(".", 1)[1]
        # value = ''.join(map(lambda x: x if x.islower() else " "+x, value))
        value = re.sub(r'((?<=[a-z])[A-Z]|(?<!\A)[A-Z](?=[a-z]))', r' \1', value)
        print(f'"{string}": "{value}",')


    # print(sorted(strings))