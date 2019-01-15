WITH RECURSIVE running(rid, sid, tape, pos) AS (
  -- first store initial tape contents
  SELECT 0, 0, ARRAY(SELECT symbol FROM Tape ORDER BY tid), 1
  UNION
  -- then proceed to compute iterations
  SELECT p.rid+1, t.new_state,
         -- build updated tape as an array
         p.tape[1:p.pos-1] ||                      -- prefix
           t.new_symbol ||                         -- updated cell
           p.tape[p.pos+1:array_length(p.tape,1)], -- suffix
         -- move cursor position
         p.pos+t.move
  FROM running AS p
  -- get state details, to know whether to stop
  JOIN State AS s ON (p.sid=s.sid)
  -- get corresponding state transition
  JOIN Transition AS t ON (t.sid=p.sid AND
                           -- coalesce defaults to blank
                           t.symbol=COALESCE(p.tape[p.pos],0))
  WHERE -- stop on a final state
        --NOT s.isFinal -- There is no halt state.
        NOT p.rid = 100 -- By changing this number 
                        -- you can set the number of generations of cellular automata on tape.
)
-- just store the computed table
INSERT INTO Run
  SELECT * FROM running;
