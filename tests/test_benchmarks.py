import os
import subprocess
import json
from boxcars_py import parse_replay

def parse_via_boxcars(replay_path):
    with open(replay_path, "rb") as f:
        replay = f.read()
        return parse_replay(replay)

def parse_via_rattletrap(replay_path):
    from sys import platform

    path = os.path.dirname(os.path.realpath(__file__)) + '/rattletrap/'

    if platform == "linux" or platform == "linux2":
        path += 'rattletrap-linux'
    elif platform == "darwin":
        path += 'rattletrap-osx'
    elif platform == "win32":
        path += 'rattletrap-windows.exe'

    command = [path, '--compact', '-i', replay_path]
    proc = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    output, error = proc.communicate()

    if proc.returncode != 0:
        raise Exception("rattletrap exited unsuccessfully.")
    elif len(error):
        raise Exception("errors: {}".format(error))

    if output:
        output = output.decode('utf8')
    return json.loads(output)

def test_rattletrap_speed(benchmark):
    path = os.path.dirname(os.path.realpath(__file__)) + '/replays/SKYBOT_DRIBBLE_INFO.replay'
    benchmark(parse_via_rattletrap, path)

def test_boxcars_speed(benchmark):
    path = os.path.dirname(os.path.realpath(__file__)) + '/replays/SKYBOT_DRIBBLE_INFO.replay'
    benchmark(parse_via_boxcars, path)
