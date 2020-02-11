from boxcars_py import parse_replay

def test_parse_replay():
    with open("tests/REPLAY.replay", "rb") as f:
        buf = f.read()
    replay = parse_replay(buf)
    assert type(replay) == type({})
