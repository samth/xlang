#lang racket

(require syntax/parse/define)
(provide (rename-out [app #%app] [mb #%module-begin]
                     [q #%datum] [ti #%top-interaction])
         K S X I)
(define-syntax app
  (syntax-rules ()
    [(app a b) (#%app a b)]
    [(app a b c ...) (app (app a b) c ...)]))
(define-syntax-rule (mb e ...) (#%module-begin e ...))
(define-syntax-rule (ti . e) (#%top-interaction . e))
(define-simple-macro (q . (~or x:number x:id)) (quote x))
(define ((K x) y) x)
(define (((S x) y) z) ((x z) (x z)))
(define (X x) ((x S) K))
(define (I x) x)

(module reader syntax/module-reader xlang)