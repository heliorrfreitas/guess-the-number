(defparameter *tips* nil)
(defun play-guess-number-game () 
	(print "It is your turn to guess the number. The computer will generate a random  number between 0 and 100. Use the best method for your guesses. to guess use the command (my-guess 10) the number 10 is a example of value you can enter. The game starts with tips off by default. If you want to turn on the tips in the game use (tips-on) .")
	
	(defparameter *number* (random 100) ))

(defun my-guess (user-guess)
	(if (eq *number* user-guess)
		'victory
		(if *tips* 
			(if (> user-guess *number*)
				'smaller
				'bigger )
			'try-again )))

(defun tips-on ()
	(print "tips turned on")
	(setf *tips* 1))

(defun tips-off ()
	(print "tips turned off")
	(setf *tips* nil))
	



