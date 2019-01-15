INSERT INTO State VALUES(0,FALSE,1),(1,FALSE,2); 
INSERT INTO Symbol VALUES(0,'0'),(1,'1'),(2,'2');
INSERT INTO Transition VALUES
(0,2,0,1,-1),
(0,1,0,2,-1),
(0,0,1,1, 1),
(1,2,0,0, 1),
(1,1,1,2, 1),
(1,0,0,2,-1)

INSERT INTO Tape VALUES(0,0);
