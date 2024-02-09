  ::  /app/sunrise
::::
::
/-  *sunrise
/+  dbug,
    default-agent,
    *sunrise,
    verb
|%
+$  versioned-state
  $%  state-0
  ==
+$  state-0
  $:  %0
      values=(list @)
  ==
+$  card  card:agent:gall
--
%+  verb  &
%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
=<
|_  =bowl:gall
+*  this     .
    default  ~(. (default-agent this %|) bowl)
    aux      ~(. +> bowl)
++  on-init
  ^-  [(list card) _this]
  ~&  >  "%sunrise initialized successfully."
  :-  :~  [%pass /eyre/connect %arvo %e %connect [~ /apps/[dap.bowl]] dap.bowl]
      ==
  this
++  on-save   !>(state)
++  on-load
  |=  old=vase
  ^-  [(list card) _this]
  :-  ^-  (list card)
      ~
  %=  this
    state  !<(state-0 old)
  ==
++  on-poke
  |=  [=mark =vase]
  ^-  [(list card) _this]
  =^  cards  state
    ?+    mark  (on-poke:default mark vase)
        %sunrise-action
      (take-action !<(action vase))
    ==
  [cards this]
::
++  on-peek
  |=  path=(pole knot)
  ^-  (unit (unit cage))
  ?+    path  (on-peek:default path)
    [%x %value idx=@ ~]  [~ ~ [%noun !>((snag idx.path values))]]
    [%x %values ~]  [~ ~ [%noun !>(values)]]
  ==
++  on-watch
  |=  path=(pole knot)
  ^-  [(list card) _this]
  =^  cards  state
    ?+    path  (on-watch:default path)
        [%values ~]
      (send-update %values)
    ==
  [cards this]
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  ?+    sign-arvo  (on-arvo:default [wire sign-arvo])
      [%eyre %bound *]
    ?:  accepted.sign-arvo
      %-  (slog leaf+"/apps/{(trip dap.bowl)} bound successfully!" ~)
      [~ this]
    %-  (slog leaf+"Binding /apps/{(trip dap.bowl)} failed!" ~)
    [~ this]
  ==
++  on-leave  on-leave:default
++  on-agent  on-agent:default
++  on-fail   on-fail:default
--
::
::  Helper Core
::
|_  =bowl:gall
+*  this     .
    default  ~(. (default-agent this %|) bowl)
++  take-action
  |=  act=action
  ^-  [(list card) _state]
  [~ state]
++  send-update
  |=  =term
  ^-  [(list card) _state]
  :-  :~  [%give %fact ~ %sunrise-update !>(`update`[%risen values])]
      ==
  state
--
