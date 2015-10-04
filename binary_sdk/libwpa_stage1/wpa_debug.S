
            .section     .irom0.text, "ax", @progbits

# Function @ .irom0.text+0x0
            .balign      4
            .literal_position
            .global      eloop_cancel_timeout
            .type        eloop_cancel_timeout, @function
eloop_cancel_timeout:
            movi         a2, 0 /* 0x00000000 */                #    0: 0c02
            ret           /* 0x00000000 */                     #    2: 0df0

# Function @ .irom0.text+0x4
            .balign      4
            .global      eloop_register_timeout
            .type        eloop_register_timeout, @function
eloop_register_timeout:
            movi         a2, 0 /* 0x00000000 */                #    4: 0c02
            ret           /* 0x00000000 */                     #    6: 0df0
