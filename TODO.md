

modifiers:



- train jetbrains shortcuts
- and maybe at some point in time vim motions?  -> try for two weeks



## working layer 3 and 4 
```

        layer_Layer__3 {
            bindings = <
&trans           &trans         &trans                  &trans                  &trans           &trans            &trans                                                  &trans                &trans                   &trans                 &trans            &trans         &trans  &trans
&trans            &three_dots   &kp QUESTION  &kp RA(NUMBER_8)  &kp RA(NUMBER_9)               &zirkumflex      &trans           &trans                   &kp EXCLAMATION               &kp NON_US_BACKSLASH                &kp PIPE2  &kp RIGHT_PARENTHESIS         &kp CARET           &trans
&trans           &kp RA(MINUS)  &kp AMPERSAND                  &kp RA(NUMBER_7)               &kp RA(NUMBER_0)          &kp RIGHT_BRACE            &trans  &trans  &trans                  &trans  &trans  &trans       &kp UNDER  &kp STAR     &kp LEFT_PARENTHESIS              &kp SLASH  &kp GREATER_THAN         &kp RA(Q)
&trans  &kp NON_US_HASH     &kp DOLLAR                  &kp RA(NON_US_BACKSLASH)              &kp RA(RIGHT_BRACKET)     &backtick                            &trans                  &trans                     &kp RIGHT_BRACKET  &kp LS(NUMBER_5)               &kp AT_SIGN          &kp PIPE  &kp LESS_THAN  &trans
&trans           &trans         &trans                  &kp LEFT  &kp RIGHT                             &trans  &trans  &trans                  &trans  &trans  &trans                                         &kp UP      &kp DOWN            &trans         &trans  &trans
>;
};
```



```

                layer__4 {
                    bindings = <
          &none         &none          &none        &none       &none          &none                 &none                                                                          &trans   &none       &none       &none   &none   &none   &none
          &none         &kp PG_UP         &kp BSPC          &kp UP         &kp DEL         &kp PG_DN            &none                                                                     &none   &none       &kp N7     &kp N8    &kp N9   &none   &none
          &none          &kp HOME         &kp LEFT         &kp DOWN          &kp RIGHT         &kp END                  &none   &none   &none                  &none       &none  &none   &none               &kp N4    &kp N5    &kp N6   &none   &none
          &kp LSHFT         &none         &none         &none   &kp ENTER         &none                                  &none                       &none                                       &none       &kp N1    &kp N2    &kp N3   &none   &kp RSHFT
          &kp LCTRL         &none         &none         &kp LEFT  &kp RIGHT                                &none   &none   &none                      &kp N0  &none         &none         &kp UP      &kp DOWN   &none   &none   &kp RCTRL
                    >;
                };
 
```



//65->backspace thumb left
//46->lshift

0 -> left top 
1 -> N1
5 -> N5
8 -> N6
13 -> right top
14 -> tab
18 ->R
19 ->T 
20 -> i guess undefinded
21 -> three-symbol(right hand)
22 -> ...???not working..
25 -> O
27 -> rechts außen,zweite reihe von oben

28 -> 3. reihe ganz links: esc
29 -> aydyj..,


#define KEYS_LEFT 0 1 2 3 4 5 6 \
14 15 16 17 18 19 20 \
28 29 30 31 32 33 34 \
46 47 48 49 50 51 \
66 67 68 69 70

#define KEYS_RIGHT 7 8 9 10 11 12 13 \
21 22 23 24 25 26 27 \
39 40 41 42 43 44 45 \
60 61 62 63 64 65 \
77 78 79 80 81

#define THUMBS_LEFT 35 36 54 71 72 73

#define THUMBS_RIGHT 37 38 57 74 75 76

#define THUMBS THUMBS_LEFT THUMBS_RIGHT


https://github.com/urob/zmk-helpers/blob/main/keypos_def/keypos_adv360.h
https://github.com/manna-harbour/miryoku_zmk?tab=readme-ov-file#caps-word

https://github.com/danieldk/Adv360-Pro-ZMK-old/blob/22c2166071a3ef06781d33f7141ca01420af95f1/config/adv360.keymap#L22  -> falsch..??


-> geht wohl nur bei buchstaben??