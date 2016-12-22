#!/usr/bin/env python

import os
import jinja2
from argparse import ArgumentParser

# Pathes for Jinja2
path_main = os.path.dirname(os.path.abspath(__file__))
path_templates = os.path.join(path_main, 'jinja2')
j2_env = jinja2.Environment(loader=jinja2.FileSystemLoader(path_templates))

# Command line parsing
def is_valid_file(parser, arg):
    full_path = os.path.join(path_main, arg)
    if not os.path.exists(full_path):
        parser.error("The file %s does not exist!" % full_path)
    else:
        return full_path

parser = ArgumentParser(description='Render remarkjs files')
parser.add_argument('filepath',
                    help='full, or relative, path to jinja2 template',
                    metavar='FILE',
                    type=lambda x: is_valid_file(parser, x)
                    )

if __name__ == '__main__':
    args = parser.parse_args()
    path_file_relative = args.filepath.replace(path_templates, '')[1:]  # no /
    template = j2_env.get_template(path_file_relative)
    print(template.render())
