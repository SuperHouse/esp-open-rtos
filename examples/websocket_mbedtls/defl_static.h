struct Outbuf {
    unsigned char *outbuf;
    int outlen, outsize;
    unsigned long outbits;
    int noutbits;
    int comp_disabled;
};

void outbits(struct Outbuf *out, unsigned long bits, int nbits);
void zlib_start_block(struct Outbuf *ctx);
void zlib_finish_block(struct Outbuf *ctx);
void zlib_literal(struct Outbuf *ectx, unsigned char c);
void zlib_match(struct Outbuf *ectx, int distance, int len);
void zlib_free_block(struct Outbuf *out);
