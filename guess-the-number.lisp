(defparameter *tips* 1)
(defun play ()
	(defparameter *number* (random 100) ) 
	'(It is your turn to guess the number. The computer will generate a random  number between 0 and 100. Guess the number.))

(defun guess (user-guess)
	(if (eq *number* user-guess)
		'(victory. you got it right.)
		(if *tips* 
			(if (> user-guess *number*)
				'(guess a smaller number.)
				'(guess a higher number.) )
			'(try again.) )))

(defun tips-on ()
	(setf *tips* 1)
	'(tips turned on))

(defun tips-off ()
	(setf *tips* nil)
	'(tips turned off))
	
(defun tips (value)
	(cond 	((string-equal value 'off) (tips-off))
		(t (tips-on))))

(defun help ()
	'(this is the help menu = play -> starts a new game. guess any-int-number -> attempts to guess the number. tips on -> give you tips. tips off -> does not give you tips. quit -> quit the game. help-> open the help menu.))

(defun game-repl () 
	(let ((cmd (game-read)))
		(unless (eq (car cmd) 'quit)
			(game-print (game-eval cmd))
			(game-repl))))

(defun game-read () 
	(let ((cmd (read-from-string
			(concatenate 'string "(" (read-line) ")"))))
		(flet ((quote-it (x)
			(list 'quote x)))
		(cons (car cmd) (mapcar #'quote-it (cdr cmd))))))

(defparameter *allowed-commands* '(play guess tips help))

(defun game-eval (sexp)
	(if (member (car sexp) *allowed-commands*)
		(eval sexp)
		'(i do not know that command.)))


(defun tweak-text (lst caps lit)
	(when lst
	(let ((item (car lst))
		(rest (cdr lst)))
	(cond ((eql item #\space) (cons item (tweak-text rest caps lit)))
		((member item '(#\! #\? #\.)) (cons item (tweak-text rest t lit)))
		((eql item #\") (tweak-text rest caps (not lit)))
		(lit (cons item (tweak-text rest nil lit)))
		(caps (cons (char-upcase item) (tweak-text rest nil lit)))
		(t (cons (char-downcase item) (tweak-text rest nil nil)))))))

(defun game-print (lst)
	(princ "=>")
	(princ (coerce (tweak-text (coerce (string-trim "() "
							(prin1-to-string lst))
					   'list)
				   t
				   nil)
			'string))
	(fresh-line))



