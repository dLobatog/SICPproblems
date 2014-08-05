; As a large system with generic operations evolves, new types of data objects or
; new operations may be needed.
; For each of the three strategies — generic operations with explicit dispatch,
; data-directed style, and message-passing-style
; Describe the changes that must be made to a system in order to add new types
; or new operations

; generic operations with explicit dispatch
;
; to add new types, add the implementation to the generic operations, etc..
; to add new operations, build them by using previous operations as a blueprint
; not very modular
;
; data-directed
;
; to add new types, add the new type and handler to the table
; to add new operations, make the operation handler and link it to all types in the
; table
;
; message-passing
;
; to add new types, just send messages with a different type
; to add new operations, just add a new handler to the dispatcher
;
; Which organization would be most appropriate for a system in which new types
; must often be added?
;
; data-directed is the easiest, types are very uncoupled fom the operation
;
; Which would be most appropriate for a system in which new operations must
; often be added?
;
; message-passing is appropriate if all procedures in the dispatcher will only use the
; same fixed amount of arguments
