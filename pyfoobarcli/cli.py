import argparse
import sys


def parse_args(args):
    parser = argparse.ArgumentParser(description="Hello, world!")
    parser.add_argument("echo")
    return parser.parse_args(args)


def main():
    result = parse_args(sys.argv[1:])
    print(result.echo)
