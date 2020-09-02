(defun play-guess-number-game () 
	(print "It is your turn to guess the number. The computer will generate a random  number between 0 and 100. Use the best method for your guesses. to guess use the command (my-guess 10) the number 10 is a example of value you can enter.")
	(defparameter *number* (random 100) ))

(defun my-guess (user-guess)
	(if (eq *number* user-guess)
		'victory
		'try-again  ))


