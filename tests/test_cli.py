import pytest

from pyfoobarcli.cli import parse_args


def test_cli():
    result = parse_args(["hello, world!"])
    assert result.echo == "hello, world!"


def test_cli_help(capsys):
    with pytest.raises(SystemExit):
        parse_args(["-h"])
    capture = capsys.readouterr()
    assert "Hello, world!" in capture.out
