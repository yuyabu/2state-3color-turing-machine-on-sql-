CREATE TABLE State(    -- TM states
  sid INTEGER PRIMARY KEY,    -- 0 is always the initial state
  isFinal BOOLEAN NOT NULL,
  sname TEXT UNIQUE NOT NULL -- just for show
);

CREATE TABLE Symbol( -- TM symbols
  cid INTEGER PRIMARY KEY,  -- 0 is always the blank symbol
  cname TEXT UNIQUE NOT NULL
);

CREATE TABLE Transition( -- TM transition function
  sid INTEGER NOT NULL REFERENCES State,     -- initial state
  symbol INTEGER NOT NULL REFERENCES Symbol, -- & symbol
  UNIQUE(sid, symbol),
  new_state INTEGER NOT NULL REFERENCES State,
  new_symbol INTEGER NOT NULL REFERENCES Symbol,
  move INTEGER NOT NULL CHECK(move=-1 OR move=1)
);

CREATE TABLE Tape( -- TM initial tape contents
  tid INTEGER PRIMARY KEY,
  symbol INTEGER REFERENCES Symbol
);
