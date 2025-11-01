
build/flex/bin/app.elf:     file format elf32-littlearm


Disassembly of section .text:

c0de0000 <main>:
c0de0000:	b510      	push	{r4, lr}
c0de0002:	4604      	mov	r4, r0
c0de0004:	b662      	cpsie	i
c0de0006:	f00a fcdb 	bl	c0dea9c0 <os_boot>
c0de000a:	b90c      	cbnz	r4, c0de0010 <main+0x10>
c0de000c:	f00a faa2 	bl	c0dea554 <standalone_app_main>
c0de0010:	2000      	movs	r0, #0
c0de0012:	bd10      	pop	{r4, pc}

c0de0014 <address_from_pubkey>:
c0de0014:	b570      	push	{r4, r5, r6, lr}
c0de0016:	b08a      	sub	sp, #40	@ 0x28
c0de0018:	460c      	mov	r4, r1
c0de001a:	4605      	mov	r5, r0
c0de001c:	4668      	mov	r0, sp
c0de001e:	2120      	movs	r1, #32
c0de0020:	4616      	mov	r6, r2
c0de0022:	f00b f88b 	bl	c0deb13c <__aeabi_memclr>
c0de0026:	b914      	cbnz	r4, c0de002e <address_from_pubkey+0x1a>
c0de0028:	2001      	movs	r0, #1
c0de002a:	f00a fc45 	bl	c0dea8b8 <assert_exit>
c0de002e:	2e14      	cmp	r6, #20
c0de0030:	d30a      	bcc.n	c0de0048 <address_from_pubkey+0x34>
c0de0032:	2040      	movs	r0, #64	@ 0x40
c0de0034:	2101      	movs	r1, #1
c0de0036:	9009      	str	r0, [sp, #36]	@ 0x24
c0de0038:	1c68      	adds	r0, r5, #1
c0de003a:	466d      	mov	r5, sp
c0de003c:	9008      	str	r0, [sp, #32]
c0de003e:	a808      	add	r0, sp, #32
c0de0040:	462a      	mov	r2, r5
c0de0042:	f00a fc01 	bl	c0dea848 <cx_keccak_256_hash_iovec>
c0de0046:	b108      	cbz	r0, c0de004c <address_from_pubkey+0x38>
c0de0048:	2000      	movs	r0, #0
c0de004a:	e006      	b.n	c0de005a <address_from_pubkey+0x46>
c0de004c:	f105 010c 	add.w	r1, r5, #12
c0de0050:	4620      	mov	r0, r4
c0de0052:	2214      	movs	r2, #20
c0de0054:	f00b f868 	bl	c0deb128 <__aeabi_memcpy>
c0de0058:	2001      	movs	r0, #1
c0de005a:	b00a      	add	sp, #40	@ 0x28
c0de005c:	bd70      	pop	{r4, r5, r6, pc}

c0de005e <apdu_dispatcher>:
c0de005e:	b51f      	push	{r0, r1, r2, r3, r4, lr}
c0de0060:	4604      	mov	r4, r0
c0de0062:	b910      	cbnz	r0, c0de006a <apdu_dispatcher+0xc>
c0de0064:	2001      	movs	r0, #1
c0de0066:	f00a fc27 	bl	c0dea8b8 <assert_exit>
c0de006a:	7820      	ldrb	r0, [r4, #0]
c0de006c:	28e0      	cmp	r0, #224	@ 0xe0
c0de006e:	d131      	bne.n	c0de00d4 <apdu_dispatcher+0x76>
c0de0070:	2000      	movs	r0, #0
c0de0072:	9003      	str	r0, [sp, #12]
c0de0074:	e9cd 0001 	strd	r0, r0, [sp, #4]
c0de0078:	7860      	ldrb	r0, [r4, #1]
c0de007a:	2813      	cmp	r0, #19
c0de007c:	d02d      	beq.n	c0de00da <apdu_dispatcher+0x7c>
c0de007e:	2804      	cmp	r0, #4
c0de0080:	d034      	beq.n	c0de00ec <apdu_dispatcher+0x8e>
c0de0082:	2805      	cmp	r0, #5
c0de0084:	d03e      	beq.n	c0de0104 <apdu_dispatcher+0xa6>
c0de0086:	2806      	cmp	r0, #6
c0de0088:	d052      	beq.n	c0de0130 <apdu_dispatcher+0xd2>
c0de008a:	2807      	cmp	r0, #7
c0de008c:	d05c      	beq.n	c0de0148 <apdu_dispatcher+0xea>
c0de008e:	2809      	cmp	r0, #9
c0de0090:	d063      	beq.n	c0de015a <apdu_dispatcher+0xfc>
c0de0092:	280a      	cmp	r0, #10
c0de0094:	d070      	beq.n	c0de0178 <apdu_dispatcher+0x11a>
c0de0096:	280b      	cmp	r0, #11
c0de0098:	d077      	beq.n	c0de018a <apdu_dispatcher+0x12c>
c0de009a:	280c      	cmp	r0, #12
c0de009c:	d07e      	beq.n	c0de019c <apdu_dispatcher+0x13e>
c0de009e:	280f      	cmp	r0, #15
c0de00a0:	f000 8089 	beq.w	c0de01b6 <apdu_dispatcher+0x158>
c0de00a4:	2810      	cmp	r0, #16
c0de00a6:	f000 8093 	beq.w	c0de01d0 <apdu_dispatcher+0x172>
c0de00aa:	2811      	cmp	r0, #17
c0de00ac:	f000 809b 	beq.w	c0de01e6 <apdu_dispatcher+0x188>
c0de00b0:	2812      	cmp	r0, #18
c0de00b2:	f000 80a3 	beq.w	c0de01fc <apdu_dispatcher+0x19e>
c0de00b6:	2803      	cmp	r0, #3
c0de00b8:	f040 80aa 	bne.w	c0de0210 <apdu_dispatcher+0x1b2>
c0de00bc:	78a0      	ldrb	r0, [r4, #2]
c0de00be:	2800      	cmp	r0, #0
c0de00c0:	f040 80bf 	bne.w	c0de0242 <apdu_dispatcher+0x1e4>
c0de00c4:	78e0      	ldrb	r0, [r4, #3]
c0de00c6:	2800      	cmp	r0, #0
c0de00c8:	f040 80bb 	bne.w	c0de0242 <apdu_dispatcher+0x1e4>
c0de00cc:	e8bd 401f 	ldmia.w	sp!, {r0, r1, r2, r3, r4, lr}
c0de00d0:	f000 b975 	b.w	c0de03be <handler_get_version>
c0de00d4:	f44f 40dc 	mov.w	r0, #28160	@ 0x6e00
c0de00d8:	e0b5      	b.n	c0de0246 <apdu_dispatcher+0x1e8>
c0de00da:	68a0      	ldr	r0, [r4, #8]
c0de00dc:	78a1      	ldrb	r1, [r4, #2]
c0de00de:	78e2      	ldrb	r2, [r4, #3]
c0de00e0:	f000 f8bd 	bl	c0de025e <OUTLINED_FUNCTION_0>
c0de00e4:	a801      	add	r0, sp, #4
c0de00e6:	f000 fb57 	bl	c0de0798 <handler_cmd_get_pk_chunk>
c0de00ea:	e08f      	b.n	c0de020c <apdu_dispatcher+0x1ae>
c0de00ec:	78a0      	ldrb	r0, [r4, #2]
c0de00ee:	2800      	cmp	r0, #0
c0de00f0:	f040 80a7 	bne.w	c0de0242 <apdu_dispatcher+0x1e4>
c0de00f4:	78e0      	ldrb	r0, [r4, #3]
c0de00f6:	2800      	cmp	r0, #0
c0de00f8:	f040 80a3 	bne.w	c0de0242 <apdu_dispatcher+0x1e4>
c0de00fc:	e8bd 401f 	ldmia.w	sp!, {r0, r1, r2, r3, r4, lr}
c0de0100:	f000 b8f6 	b.w	c0de02f0 <handler_get_app_name>
c0de0104:	78a1      	ldrb	r1, [r4, #2]
c0de0106:	2901      	cmp	r1, #1
c0de0108:	f200 809b 	bhi.w	c0de0242 <apdu_dispatcher+0x1e4>
c0de010c:	78e0      	ldrb	r0, [r4, #3]
c0de010e:	2800      	cmp	r0, #0
c0de0110:	f040 8097 	bne.w	c0de0242 <apdu_dispatcher+0x1e4>
c0de0114:	68a0      	ldr	r0, [r4, #8]
c0de0116:	2800      	cmp	r0, #0
c0de0118:	f000 808b 	beq.w	c0de0232 <apdu_dispatcher+0x1d4>
c0de011c:	9001      	str	r0, [sp, #4]
c0de011e:	7920      	ldrb	r0, [r4, #4]
c0de0120:	2900      	cmp	r1, #0
c0de0122:	9002      	str	r0, [sp, #8]
c0de0124:	bf18      	it	ne
c0de0126:	2101      	movne	r1, #1
c0de0128:	a801      	add	r0, sp, #4
c0de012a:	f000 f8f5 	bl	c0de0318 <handler_get_public_key>
c0de012e:	e06d      	b.n	c0de020c <apdu_dispatcher+0x1ae>
c0de0130:	78a1      	ldrb	r1, [r4, #2]
c0de0132:	2900      	cmp	r1, #0
c0de0134:	d06f      	beq.n	c0de0216 <apdu_dispatcher+0x1b8>
c0de0136:	2903      	cmp	r1, #3
c0de0138:	f200 8083 	bhi.w	c0de0242 <apdu_dispatcher+0x1e4>
c0de013c:	78e0      	ldrb	r0, [r4, #3]
c0de013e:	f040 0280 	orr.w	r2, r0, #128	@ 0x80
c0de0142:	2a80      	cmp	r2, #128	@ 0x80
c0de0144:	d06b      	beq.n	c0de021e <apdu_dispatcher+0x1c0>
c0de0146:	e07c      	b.n	c0de0242 <apdu_dispatcher+0x1e4>
c0de0148:	68a0      	ldr	r0, [r4, #8]
c0de014a:	2800      	cmp	r0, #0
c0de014c:	d071      	beq.n	c0de0232 <apdu_dispatcher+0x1d4>
c0de014e:	f000 f886 	bl	c0de025e <OUTLINED_FUNCTION_0>
c0de0152:	a801      	add	r0, sp, #4
c0de0154:	f000 f9ff 	bl	c0de0556 <handler_cmd_keccakH>
c0de0158:	e058      	b.n	c0de020c <apdu_dispatcher+0x1ae>
c0de015a:	78e0      	ldrb	r0, [r4, #3]
c0de015c:	2800      	cmp	r0, #0
c0de015e:	d170      	bne.n	c0de0242 <apdu_dispatcher+0x1e4>
c0de0160:	78a1      	ldrb	r1, [r4, #2]
c0de0162:	2902      	cmp	r1, #2
c0de0164:	d301      	bcc.n	c0de016a <apdu_dispatcher+0x10c>
c0de0166:	2980      	cmp	r1, #128	@ 0x80
c0de0168:	d16b      	bne.n	c0de0242 <apdu_dispatcher+0x1e4>
c0de016a:	68a0      	ldr	r0, [r4, #8]
c0de016c:	f000 f877 	bl	c0de025e <OUTLINED_FUNCTION_0>
c0de0170:	a801      	add	r0, sp, #4
c0de0172:	f000 fa09 	bl	c0de0588 <handler_cmd_keccak_prng>
c0de0176:	e049      	b.n	c0de020c <apdu_dispatcher+0x1ae>
c0de0178:	68a0      	ldr	r0, [r4, #8]
c0de017a:	2800      	cmp	r0, #0
c0de017c:	d059      	beq.n	c0de0232 <apdu_dispatcher+0x1d4>
c0de017e:	f000 f86e 	bl	c0de025e <OUTLINED_FUNCTION_0>
c0de0182:	a801      	add	r0, sp, #4
c0de0184:	f000 f9cd 	bl	c0de0522 <handler_cmd_dummy>
c0de0188:	e040      	b.n	c0de020c <apdu_dispatcher+0x1ae>
c0de018a:	68a0      	ldr	r0, [r4, #8]
c0de018c:	2800      	cmp	r0, #0
c0de018e:	d050      	beq.n	c0de0232 <apdu_dispatcher+0x1d4>
c0de0190:	f000 f865 	bl	c0de025e <OUTLINED_FUNCTION_0>
c0de0194:	a801      	add	r0, sp, #4
c0de0196:	f000 fa2f 	bl	c0de05f8 <handler_cmd_sample_in_ball>
c0de019a:	e037      	b.n	c0de020c <apdu_dispatcher+0x1ae>
c0de019c:	78a0      	ldrb	r0, [r4, #2]
c0de019e:	2800      	cmp	r0, #0
c0de01a0:	d14f      	bne.n	c0de0242 <apdu_dispatcher+0x1e4>
c0de01a2:	78e0      	ldrb	r0, [r4, #3]
c0de01a4:	2800      	cmp	r0, #0
c0de01a6:	d14c      	bne.n	c0de0242 <apdu_dispatcher+0x1e4>
c0de01a8:	68a0      	ldr	r0, [r4, #8]
c0de01aa:	f000 f858 	bl	c0de025e <OUTLINED_FUNCTION_0>
c0de01ae:	a801      	add	r0, sp, #4
c0de01b0:	f000 fa31 	bl	c0de0616 <handler_cmd_keygen_core_dilithium>
c0de01b4:	e02a      	b.n	c0de020c <apdu_dispatcher+0x1ae>
c0de01b6:	78e0      	ldrb	r0, [r4, #3]
c0de01b8:	2800      	cmp	r0, #0
c0de01ba:	d142      	bne.n	c0de0242 <apdu_dispatcher+0x1e4>
c0de01bc:	78a1      	ldrb	r1, [r4, #2]
c0de01be:	2902      	cmp	r1, #2
c0de01c0:	d23a      	bcs.n	c0de0238 <apdu_dispatcher+0x1da>
c0de01c2:	68a0      	ldr	r0, [r4, #8]
c0de01c4:	f000 f84b 	bl	c0de025e <OUTLINED_FUNCTION_0>
c0de01c8:	a801      	add	r0, sp, #4
c0de01ca:	f000 fa4b 	bl	c0de0664 <handler_cmd_sign_dilithium>
c0de01ce:	e01d      	b.n	c0de020c <apdu_dispatcher+0x1ae>
c0de01d0:	78a0      	ldrb	r0, [r4, #2]
c0de01d2:	bbb0      	cbnz	r0, c0de0242 <apdu_dispatcher+0x1e4>
c0de01d4:	78e0      	ldrb	r0, [r4, #3]
c0de01d6:	bba0      	cbnz	r0, c0de0242 <apdu_dispatcher+0x1e4>
c0de01d8:	68a0      	ldr	r0, [r4, #8]
c0de01da:	f000 f840 	bl	c0de025e <OUTLINED_FUNCTION_0>
c0de01de:	a801      	add	r0, sp, #4
c0de01e0:	f000 faa8 	bl	c0de0734 <handler_cmd_verify_dilithium>
c0de01e4:	e012      	b.n	c0de020c <apdu_dispatcher+0x1ae>
c0de01e6:	78a0      	ldrb	r0, [r4, #2]
c0de01e8:	bb58      	cbnz	r0, c0de0242 <apdu_dispatcher+0x1e4>
c0de01ea:	78e0      	ldrb	r0, [r4, #3]
c0de01ec:	bb48      	cbnz	r0, c0de0242 <apdu_dispatcher+0x1e4>
c0de01ee:	68a0      	ldr	r0, [r4, #8]
c0de01f0:	f000 f835 	bl	c0de025e <OUTLINED_FUNCTION_0>
c0de01f4:	a801      	add	r0, sp, #4
c0de01f6:	f000 fa22 	bl	c0de063e <handler_cmd_keygen_dilithium>
c0de01fa:	e007      	b.n	c0de020c <apdu_dispatcher+0x1ae>
c0de01fc:	68a0      	ldr	r0, [r4, #8]
c0de01fe:	78a1      	ldrb	r1, [r4, #2]
c0de0200:	78e2      	ldrb	r2, [r4, #3]
c0de0202:	f000 f82c 	bl	c0de025e <OUTLINED_FUNCTION_0>
c0de0206:	a801      	add	r0, sp, #4
c0de0208:	f000 fab6 	bl	c0de0778 <handler_cmd_get_sig_chunk>
c0de020c:	b004      	add	sp, #16
c0de020e:	bd10      	pop	{r4, pc}
c0de0210:	f44f 40da 	mov.w	r0, #27904	@ 0x6d00
c0de0214:	e017      	b.n	c0de0246 <apdu_dispatcher+0x1e8>
c0de0216:	78e0      	ldrb	r0, [r4, #3]
c0de0218:	2880      	cmp	r0, #128	@ 0x80
c0de021a:	d112      	bne.n	c0de0242 <apdu_dispatcher+0x1e4>
c0de021c:	2080      	movs	r0, #128	@ 0x80
c0de021e:	68a2      	ldr	r2, [r4, #8]
c0de0220:	b13a      	cbz	r2, c0de0232 <apdu_dispatcher+0x1d4>
c0de0222:	9201      	str	r2, [sp, #4]
c0de0224:	7922      	ldrb	r2, [r4, #4]
c0de0226:	9202      	str	r2, [sp, #8]
c0de0228:	09c2      	lsrs	r2, r0, #7
c0de022a:	a801      	add	r0, sp, #4
c0de022c:	f000 f8de 	bl	c0de03ec <handler_sign_tx>
c0de0230:	e7ec      	b.n	c0de020c <apdu_dispatcher+0x1ae>
c0de0232:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de0236:	e006      	b.n	c0de0246 <apdu_dispatcher+0x1e8>
c0de0238:	2980      	cmp	r1, #128	@ 0x80
c0de023a:	d102      	bne.n	c0de0242 <apdu_dispatcher+0x1e4>
c0de023c:	7920      	ldrb	r0, [r4, #4]
c0de023e:	2802      	cmp	r0, #2
c0de0240:	d0bf      	beq.n	c0de01c2 <apdu_dispatcher+0x164>
c0de0242:	f646 2086 	movw	r0, #27270	@ 0x6a86
c0de0246:	b004      	add	sp, #16
c0de0248:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de024c:	f000 b800 	b.w	c0de0250 <io_send_sw>

c0de0250 <io_send_sw>:
c0de0250:	b580      	push	{r7, lr}
c0de0252:	4602      	mov	r2, r0
c0de0254:	2000      	movs	r0, #0
c0de0256:	2100      	movs	r1, #0
c0de0258:	f00a f93c 	bl	c0dea4d4 <io_send_response_buffers>
c0de025c:	bd80      	pop	{r7, pc}

c0de025e <OUTLINED_FUNCTION_0>:
c0de025e:	9001      	str	r0, [sp, #4]
c0de0260:	7920      	ldrb	r0, [r4, #4]
c0de0262:	9002      	str	r0, [sp, #8]
c0de0264:	4770      	bx	lr
	...

c0de0268 <app_main>:
c0de0268:	b5bf      	push	{r0, r1, r2, r3, r4, r5, r7, lr}
c0de026a:	f00a f915 	bl	c0dea498 <io_init>
c0de026e:	f000 fbdf 	bl	c0de0a30 <ui_menu_main>
c0de0272:	481b      	ldr	r0, [pc, #108]	@ (c0de02e0 <app_main+0x78>)
c0de0274:	f44f 7136 	mov.w	r1, #728	@ 0x2d8
c0de0278:	4448      	add	r0, r9
c0de027a:	f00a ff6d 	bl	c0deb158 <explicit_bzero>
c0de027e:	481a      	ldr	r0, [pc, #104]	@ (c0de02e8 <app_main+0x80>)
c0de0280:	4478      	add	r0, pc
c0de0282:	f00a fd39 	bl	c0deacf8 <pic>
c0de0286:	7880      	ldrb	r0, [r0, #2]
c0de0288:	2801      	cmp	r0, #1
c0de028a:	d00d      	beq.n	c0de02a8 <app_main+0x40>
c0de028c:	2001      	movs	r0, #1
c0de028e:	f88d 0002 	strb.w	r0, [sp, #2]
c0de0292:	2000      	movs	r0, #0
c0de0294:	f8ad 0000 	strh.w	r0, [sp]
c0de0298:	4814      	ldr	r0, [pc, #80]	@ (c0de02ec <app_main+0x84>)
c0de029a:	4478      	add	r0, pc
c0de029c:	f00a fd2c 	bl	c0deacf8 <pic>
c0de02a0:	4669      	mov	r1, sp
c0de02a2:	2203      	movs	r2, #3
c0de02a4:	f00a fd62 	bl	c0dead6c <nvm_write>
c0de02a8:	4d0e      	ldr	r5, [pc, #56]	@ (c0de02e4 <app_main+0x7c>)
c0de02aa:	ac01      	add	r4, sp, #4
c0de02ac:	f00a f8fc 	bl	c0dea4a8 <io_recv_command>
c0de02b0:	2800      	cmp	r0, #0
c0de02b2:	d414      	bmi.n	c0de02de <app_main+0x76>
c0de02b4:	4602      	mov	r2, r0
c0de02b6:	eb09 0105 	add.w	r1, r9, r5
c0de02ba:	4620      	mov	r0, r4
c0de02bc:	f00a f971 	bl	c0dea5a2 <apdu_parser>
c0de02c0:	b130      	cbz	r0, c0de02d0 <app_main+0x68>
c0de02c2:	4620      	mov	r0, r4
c0de02c4:	f7ff fecb 	bl	c0de005e <apdu_dispatcher>
c0de02c8:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0de02cc:	dcee      	bgt.n	c0de02ac <app_main+0x44>
c0de02ce:	e006      	b.n	c0de02de <app_main+0x76>
c0de02d0:	2000      	movs	r0, #0
c0de02d2:	2100      	movs	r1, #0
c0de02d4:	f646 2287 	movw	r2, #27271	@ 0x6a87
c0de02d8:	f00a f8fc 	bl	c0dea4d4 <io_send_response_buffers>
c0de02dc:	e7e6      	b.n	c0de02ac <app_main+0x44>
c0de02de:	bdbf      	pop	{r0, r1, r2, r3, r4, r5, r7, pc}
c0de02e0:	00000000 	.word	0x00000000
c0de02e4:	000014f7 	.word	0x000014f7
c0de02e8:	0000e37c 	.word	0x0000e37c
c0de02ec:	0000e362 	.word	0x0000e362

c0de02f0 <handler_get_app_name>:
c0de02f0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de02f2:	4808      	ldr	r0, [pc, #32]	@ (c0de0314 <handler_get_app_name+0x24>)
c0de02f4:	4478      	add	r0, pc
c0de02f6:	f00a fcff 	bl	c0deacf8 <pic>
c0de02fa:	2100      	movs	r1, #0
c0de02fc:	f44f 4210 	mov.w	r2, #36864	@ 0x9000
c0de0300:	9103      	str	r1, [sp, #12]
c0de0302:	2108      	movs	r1, #8
c0de0304:	e9cd 0101 	strd	r0, r1, [sp, #4]
c0de0308:	a801      	add	r0, sp, #4
c0de030a:	2101      	movs	r1, #1
c0de030c:	f00a f8e2 	bl	c0dea4d4 <io_send_response_buffers>
c0de0310:	b004      	add	sp, #16
c0de0312:	bd80      	pop	{r7, pc}
c0de0314:	0000cb5f 	.word	0x0000cb5f

c0de0318 <handler_get_public_key>:
c0de0318:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de031a:	b085      	sub	sp, #20
c0de031c:	4f23      	ldr	r7, [pc, #140]	@ (c0de03ac <handler_get_public_key+0x94>)
c0de031e:	460c      	mov	r4, r1
c0de0320:	4605      	mov	r5, r0
c0de0322:	f44f 7136 	mov.w	r1, #728	@ 0x2d8
c0de0326:	eb09 0607 	add.w	r6, r9, r7
c0de032a:	4630      	mov	r0, r6
c0de032c:	f00a ff14 	bl	c0deb158 <explicit_bzero>
c0de0330:	2000      	movs	r0, #0
c0de0332:	f506 7135 	add.w	r1, r6, #724	@ 0x2d4
c0de0336:	f809 0007 	strb.w	r0, [r9, r7]
c0de033a:	f886 02a8 	strb.w	r0, [r6, #680]	@ 0x2a8
c0de033e:	4628      	mov	r0, r5
c0de0340:	f009 fe74 	bl	c0dea02c <buffer_read_u8>
c0de0344:	b308      	cbz	r0, c0de038a <handler_get_public_key+0x72>
c0de0346:	eb09 0007 	add.w	r0, r9, r7
c0de034a:	f890 22d4 	ldrb.w	r2, [r0, #724]	@ 0x2d4
c0de034e:	f500 712b 	add.w	r1, r0, #684	@ 0x2ac
c0de0352:	4628      	mov	r0, r5
c0de0354:	f009 febd 	bl	c0dea0d2 <buffer_read_bip32_path>
c0de0358:	b1b8      	cbz	r0, c0de038a <handler_get_public_key+0x72>
c0de035a:	eb09 0007 	add.w	r0, r9, r7
c0de035e:	2100      	movs	r1, #0
c0de0360:	2205      	movs	r2, #5
c0de0362:	f890 32d4 	ldrb.w	r3, [r0, #724]	@ 0x2d4
c0de0366:	e9cd 2102 	strd	r2, r1, [sp, #8]
c0de036a:	9104      	str	r1, [sp, #16]
c0de036c:	f100 0549 	add.w	r5, r0, #73	@ 0x49
c0de0370:	f100 0608 	add.w	r6, r0, #8
c0de0374:	f500 722b 	add.w	r2, r0, #684	@ 0x2ac
c0de0378:	2000      	movs	r0, #0
c0de037a:	2121      	movs	r1, #33	@ 0x21
c0de037c:	e9cd 6500 	strd	r6, r5, [sp]
c0de0380:	f009 ff68 	bl	c0dea254 <bip32_derive_with_seed_get_pubkey_256>
c0de0384:	b140      	cbz	r0, c0de0398 <handler_get_public_key+0x80>
c0de0386:	b280      	uxth	r0, r0
c0de0388:	e001      	b.n	c0de038e <handler_get_public_key+0x76>
c0de038a:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de038e:	b005      	add	sp, #20
c0de0390:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de0394:	f000 b80c 	b.w	c0de03b0 <io_send_sw>
c0de0398:	2c00      	cmp	r4, #0
c0de039a:	b005      	add	sp, #20
c0de039c:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de03a0:	bf08      	it	eq
c0de03a2:	f000 ba15 	beq.w	c0de07d0 <helper_send_response_pubkey>
c0de03a6:	f000 bc2b 	b.w	c0de0c00 <ui_display_address>
c0de03aa:	bf00      	nop
c0de03ac:	00000000 	.word	0x00000000

c0de03b0 <io_send_sw>:
c0de03b0:	b580      	push	{r7, lr}
c0de03b2:	4602      	mov	r2, r0
c0de03b4:	2000      	movs	r0, #0
c0de03b6:	2100      	movs	r1, #0
c0de03b8:	f00a f88c 	bl	c0dea4d4 <io_send_response_buffers>
c0de03bc:	bd80      	pop	{r7, pc}

c0de03be <handler_get_version>:
c0de03be:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de03c0:	2000      	movs	r0, #0
c0de03c2:	2101      	movs	r1, #1
c0de03c4:	f44f 4210 	mov.w	r2, #36864	@ 0x9000
c0de03c8:	f88d 0002 	strb.w	r0, [sp, #2]
c0de03cc:	f88d 0001 	strb.w	r0, [sp, #1]
c0de03d0:	9003      	str	r0, [sp, #12]
c0de03d2:	2003      	movs	r0, #3
c0de03d4:	f88d 1003 	strb.w	r1, [sp, #3]
c0de03d8:	2101      	movs	r1, #1
c0de03da:	9002      	str	r0, [sp, #8]
c0de03dc:	f10d 0001 	add.w	r0, sp, #1
c0de03e0:	9001      	str	r0, [sp, #4]
c0de03e2:	a801      	add	r0, sp, #4
c0de03e4:	f00a f876 	bl	c0dea4d4 <io_send_response_buffers>
c0de03e8:	b004      	add	sp, #16
c0de03ea:	bd80      	pop	{r7, pc}

c0de03ec <handler_sign_tx>:
c0de03ec:	b570      	push	{r4, r5, r6, lr}
c0de03ee:	b086      	sub	sp, #24
c0de03f0:	4e46      	ldr	r6, [pc, #280]	@ (c0de050c <handler_sign_tx+0x120>)
c0de03f2:	4604      	mov	r4, r0
c0de03f4:	b191      	cbz	r1, c0de041c <handler_sign_tx+0x30>
c0de03f6:	eb09 0006 	add.w	r0, r9, r6
c0de03fa:	f890 02a8 	ldrb.w	r0, [r0, #680]	@ 0x2a8
c0de03fe:	2801      	cmp	r0, #1
c0de0400:	d12c      	bne.n	c0de045c <handler_sign_tx+0x70>
c0de0402:	eb09 0006 	add.w	r0, r9, r6
c0de0406:	4615      	mov	r5, r2
c0de0408:	6862      	ldr	r2, [r4, #4]
c0de040a:	f8d0 0208 	ldr.w	r0, [r0, #520]	@ 0x208
c0de040e:	1811      	adds	r1, r2, r0
c0de0410:	f5b1 7fff 	cmp.w	r1, #510	@ 0x1fe
c0de0414:	d925      	bls.n	c0de0462 <handler_sign_tx+0x76>
c0de0416:	f24b 0004 	movw	r0, #45060	@ 0xb004
c0de041a:	e039      	b.n	c0de0490 <handler_sign_tx+0xa4>
c0de041c:	eb09 0506 	add.w	r5, r9, r6
c0de0420:	f44f 7136 	mov.w	r1, #728	@ 0x2d8
c0de0424:	4628      	mov	r0, r5
c0de0426:	f00a fe97 	bl	c0deb158 <explicit_bzero>
c0de042a:	2000      	movs	r0, #0
c0de042c:	f505 7135 	add.w	r1, r5, #724	@ 0x2d4
c0de0430:	f809 0006 	strb.w	r0, [r9, r6]
c0de0434:	2001      	movs	r0, #1
c0de0436:	f885 02a8 	strb.w	r0, [r5, #680]	@ 0x2a8
c0de043a:	4620      	mov	r0, r4
c0de043c:	f009 fdf6 	bl	c0dea02c <buffer_read_u8>
c0de0440:	b148      	cbz	r0, c0de0456 <handler_sign_tx+0x6a>
c0de0442:	eb09 0006 	add.w	r0, r9, r6
c0de0446:	f890 22d4 	ldrb.w	r2, [r0, #724]	@ 0x2d4
c0de044a:	f500 712b 	add.w	r1, r0, #684	@ 0x2ac
c0de044e:	4620      	mov	r0, r4
c0de0450:	f009 fe3f 	bl	c0dea0d2 <buffer_read_bip32_path>
c0de0454:	b9b8      	cbnz	r0, c0de0486 <handler_sign_tx+0x9a>
c0de0456:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de045a:	e019      	b.n	c0de0490 <handler_sign_tx+0xa4>
c0de045c:	f24b 0007 	movw	r0, #45063	@ 0xb007
c0de0460:	e016      	b.n	c0de0490 <handler_sign_tx+0xa4>
c0de0462:	eb09 0106 	add.w	r1, r9, r6
c0de0466:	4408      	add	r0, r1
c0de0468:	f100 0108 	add.w	r1, r0, #8
c0de046c:	4620      	mov	r0, r4
c0de046e:	f009 fe5a 	bl	c0dea126 <buffer_move>
c0de0472:	b158      	cbz	r0, c0de048c <handler_sign_tx+0xa0>
c0de0474:	eb09 0106 	add.w	r1, r9, r6
c0de0478:	6862      	ldr	r2, [r4, #4]
c0de047a:	f8d1 0208 	ldr.w	r0, [r1, #520]	@ 0x208
c0de047e:	4410      	add	r0, r2
c0de0480:	f8c1 0208 	str.w	r0, [r1, #520]	@ 0x208
c0de0484:	b14d      	cbz	r5, c0de049a <handler_sign_tx+0xae>
c0de0486:	f44f 4010 	mov.w	r0, #36864	@ 0x9000
c0de048a:	e001      	b.n	c0de0490 <handler_sign_tx+0xa4>
c0de048c:	f24b 0005 	movw	r0, #45061	@ 0xb005
c0de0490:	b006      	add	sp, #24
c0de0492:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de0496:	f000 b83d 	b.w	c0de0514 <io_send_sw>
c0de049a:	2100      	movs	r1, #0
c0de049c:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de04a0:	eb09 0006 	add.w	r0, r9, r6
c0de04a4:	f100 0108 	add.w	r1, r0, #8
c0de04a8:	9101      	str	r1, [sp, #4]
c0de04aa:	f500 7104 	add.w	r1, r0, #528	@ 0x210
c0de04ae:	a801      	add	r0, sp, #4
c0de04b0:	f000 f9de 	bl	c0de0870 <transaction_deserialize>
c0de04b4:	2801      	cmp	r0, #1
c0de04b6:	d114      	bne.n	c0de04e2 <handler_sign_tx+0xf6>
c0de04b8:	2001      	movs	r0, #1
c0de04ba:	f809 0006 	strb.w	r0, [r9, r6]
c0de04be:	eb09 0006 	add.w	r0, r9, r6
c0de04c2:	f8d0 1208 	ldr.w	r1, [r0, #520]	@ 0x208
c0de04c6:	f500 720e 	add.w	r2, r0, #568	@ 0x238
c0de04ca:	9105      	str	r1, [sp, #20]
c0de04cc:	f100 0108 	add.w	r1, r0, #8
c0de04d0:	9104      	str	r1, [sp, #16]
c0de04d2:	a804      	add	r0, sp, #16
c0de04d4:	2101      	movs	r1, #1
c0de04d6:	f00a f9b7 	bl	c0dea848 <cx_keccak_256_hash_iovec>
c0de04da:	b140      	cbz	r0, c0de04ee <handler_sign_tx+0x102>
c0de04dc:	f24b 0006 	movw	r0, #45062	@ 0xb006
c0de04e0:	e001      	b.n	c0de04e6 <handler_sign_tx+0xfa>
c0de04e2:	f24b 0005 	movw	r0, #45061	@ 0xb005
c0de04e6:	f000 f815 	bl	c0de0514 <io_send_sw>
c0de04ea:	b006      	add	sp, #24
c0de04ec:	bd70      	pop	{r4, r5, r6, pc}
c0de04ee:	eb09 0006 	add.w	r0, r9, r6
c0de04f2:	f8d0 022c 	ldr.w	r0, [r0, #556]	@ 0x22c
c0de04f6:	4906      	ldr	r1, [pc, #24]	@ (c0de0510 <handler_sign_tx+0x124>)
c0de04f8:	4479      	add	r1, pc
c0de04fa:	f00a fe81 	bl	c0deb200 <strcmp>
c0de04fe:	b110      	cbz	r0, c0de0506 <handler_sign_tx+0x11a>
c0de0500:	f000 fca3 	bl	c0de0e4a <ui_display_transaction>
c0de0504:	e7f1      	b.n	c0de04ea <handler_sign_tx+0xfe>
c0de0506:	f000 fc9d 	bl	c0de0e44 <ui_display_blind_signed_transaction>
c0de050a:	e7ee      	b.n	c0de04ea <handler_sign_tx+0xfe>
c0de050c:	00000000 	.word	0x00000000
c0de0510:	0000c1b3 	.word	0x0000c1b3

c0de0514 <io_send_sw>:
c0de0514:	b580      	push	{r7, lr}
c0de0516:	4602      	mov	r2, r0
c0de0518:	2000      	movs	r0, #0
c0de051a:	2100      	movs	r1, #0
c0de051c:	f009 ffda 	bl	c0dea4d4 <io_send_response_buffers>
c0de0520:	bd80      	pop	{r7, pc}

c0de0522 <handler_cmd_dummy>:
c0de0522:	b580      	push	{r7, lr}
c0de0524:	e9d0 2100 	ldrd	r2, r1, [r0]
c0de0528:	4610      	mov	r0, r2
c0de052a:	f000 f802 	bl	c0de0532 <io_send_response_pointer>
c0de052e:	2000      	movs	r0, #0
c0de0530:	bd80      	pop	{r7, pc}

c0de0532 <io_send_response_pointer>:
c0de0532:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de0534:	2200      	movs	r2, #0
c0de0536:	ab01      	add	r3, sp, #4
c0de0538:	c307      	stmia	r3!, {r0, r1, r2}
c0de053a:	a801      	add	r0, sp, #4
c0de053c:	2101      	movs	r1, #1
c0de053e:	f44f 4210 	mov.w	r2, #36864	@ 0x9000
c0de0542:	f009 ffc7 	bl	c0dea4d4 <io_send_response_buffers>
c0de0546:	bd8f      	pop	{r0, r1, r2, r3, r7, pc}

c0de0548 <io_send_sw>:
c0de0548:	b580      	push	{r7, lr}
c0de054a:	4602      	mov	r2, r0
c0de054c:	2000      	movs	r0, #0
c0de054e:	2100      	movs	r1, #0
c0de0550:	f009 ffc0 	bl	c0dea4d4 <io_send_response_buffers>
c0de0554:	bd80      	pop	{r7, pc}

c0de0556 <handler_cmd_keccakH>:
c0de0556:	b5b0      	push	{r4, r5, r7, lr}
c0de0558:	b0f2      	sub	sp, #456	@ 0x1c8
c0de055a:	466d      	mov	r5, sp
c0de055c:	4604      	mov	r4, r0
c0de055e:	4628      	mov	r0, r5
c0de0560:	f000 fc76 	bl	c0de0e50 <keccak_init>
c0de0564:	88a2      	ldrh	r2, [r4, #4]
c0de0566:	6821      	ldr	r1, [r4, #0]
c0de0568:	4628      	mov	r0, r5
c0de056a:	f000 fc75 	bl	c0de0e58 <keccak_update>
c0de056e:	ac6a      	add	r4, sp, #424	@ 0x1a8
c0de0570:	4628      	mov	r0, r5
c0de0572:	4621      	mov	r1, r4
c0de0574:	f000 fc72 	bl	c0de0e5c <keccak_final>
c0de0578:	4620      	mov	r0, r4
c0de057a:	2120      	movs	r1, #32
c0de057c:	f7ff ffd9 	bl	c0de0532 <io_send_response_pointer>
c0de0580:	2000      	movs	r0, #0
c0de0582:	b072      	add	sp, #456	@ 0x1c8
c0de0584:	bdb0      	pop	{r4, r5, r7, pc}
	...

c0de0588 <handler_cmd_keccak_prng>:
c0de0588:	b510      	push	{r4, lr}
c0de058a:	b090      	sub	sp, #64	@ 0x40
c0de058c:	2980      	cmp	r1, #128	@ 0x80
c0de058e:	d007      	beq.n	c0de05a0 <handler_cmd_keccak_prng+0x18>
c0de0590:	2901      	cmp	r1, #1
c0de0592:	d017      	beq.n	c0de05c4 <handler_cmd_keccak_prng+0x3c>
c0de0594:	bb11      	cbnz	r1, c0de05dc <handler_cmd_keccak_prng+0x54>
c0de0596:	4817      	ldr	r0, [pc, #92]	@ (c0de05f4 <handler_cmd_keccak_prng+0x6c>)
c0de0598:	4448      	add	r0, r9
c0de059a:	f000 fc61 	bl	c0de0e60 <inner_keccak256_init>
c0de059e:	e019      	b.n	c0de05d4 <handler_cmd_keccak_prng+0x4c>
c0de05a0:	4c14      	ldr	r4, [pc, #80]	@ (c0de05f4 <handler_cmd_keccak_prng+0x6c>)
c0de05a2:	eb09 0004 	add.w	r0, r9, r4
c0de05a6:	f000 fc7e 	bl	c0de0ea6 <inner_keccak256_flip>
c0de05aa:	b9a0      	cbnz	r0, c0de05d6 <handler_cmd_keccak_prng+0x4e>
c0de05ac:	eb09 0004 	add.w	r0, r9, r4
c0de05b0:	4669      	mov	r1, sp
c0de05b2:	2240      	movs	r2, #64	@ 0x40
c0de05b4:	f000 fc8d 	bl	c0de0ed2 <inner_keccak256_extract>
c0de05b8:	b968      	cbnz	r0, c0de05d6 <handler_cmd_keccak_prng+0x4e>
c0de05ba:	4668      	mov	r0, sp
c0de05bc:	2140      	movs	r1, #64	@ 0x40
c0de05be:	f7ff ffb8 	bl	c0de0532 <io_send_response_pointer>
c0de05c2:	e014      	b.n	c0de05ee <handler_cmd_keccak_prng+0x66>
c0de05c4:	490b      	ldr	r1, [pc, #44]	@ (c0de05f4 <handler_cmd_keccak_prng+0x6c>)
c0de05c6:	eb09 0301 	add.w	r3, r9, r1
c0de05ca:	e9d0 1200 	ldrd	r1, r2, [r0]
c0de05ce:	4618      	mov	r0, r3
c0de05d0:	f000 fc57 	bl	c0de0e82 <inner_keccak256_inject>
c0de05d4:	b148      	cbz	r0, c0de05ea <handler_cmd_keccak_prng+0x62>
c0de05d6:	f000 f8ef 	bl	c0de07b8 <OUTLINED_FUNCTION_0>
c0de05da:	e009      	b.n	c0de05f0 <handler_cmd_keccak_prng+0x68>
c0de05dc:	f646 2086 	movw	r0, #27270	@ 0x6a86
c0de05e0:	b010      	add	sp, #64	@ 0x40
c0de05e2:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de05e6:	f7ff bfaf 	b.w	c0de0548 <io_send_sw>
c0de05ea:	f000 f8ed 	bl	c0de07c8 <OUTLINED_FUNCTION_2>
c0de05ee:	2000      	movs	r0, #0
c0de05f0:	b010      	add	sp, #64	@ 0x40
c0de05f2:	bd10      	pop	{r4, pc}
c0de05f4:	000002d8 	.word	0x000002d8

c0de05f8 <handler_cmd_sample_in_ball>:
c0de05f8:	b510      	push	{r4, lr}
c0de05fa:	f5ad 6d80 	sub.w	sp, sp, #1024	@ 0x400
c0de05fe:	6801      	ldr	r1, [r0, #0]
c0de0600:	466c      	mov	r4, sp
c0de0602:	4620      	mov	r0, r4
c0de0604:	f001 fbc9 	bl	c0de1d9a <pqcrystals_dilithium2_lowram_poly_challenge_eth>
c0de0608:	4620      	mov	r0, r4
c0de060a:	f000 f8d9 	bl	c0de07c0 <OUTLINED_FUNCTION_1>
c0de060e:	2000      	movs	r0, #0
c0de0610:	f50d 6d80 	add.w	sp, sp, #1024	@ 0x400
c0de0614:	bd10      	pop	{r4, pc}

c0de0616 <handler_cmd_keygen_core_dilithium>:
c0de0616:	b580      	push	{r7, lr}
c0de0618:	f5ad 6d72 	sub.w	sp, sp, #3872	@ 0xf20
c0de061c:	6802      	ldr	r2, [r0, #0]
c0de061e:	f50d 6020 	add.w	r0, sp, #2560	@ 0xa00
c0de0622:	4669      	mov	r1, sp
c0de0624:	f001 fd6c 	bl	c0de2100 <crypto_sign_keypair_core>
c0de0628:	b110      	cbz	r0, c0de0630 <handler_cmd_keygen_core_dilithium+0x1a>
c0de062a:	f000 f8c5 	bl	c0de07b8 <OUTLINED_FUNCTION_0>
c0de062e:	e003      	b.n	c0de0638 <handler_cmd_keygen_core_dilithium+0x22>
c0de0630:	4668      	mov	r0, sp
c0de0632:	f000 f8c5 	bl	c0de07c0 <OUTLINED_FUNCTION_1>
c0de0636:	2000      	movs	r0, #0
c0de0638:	f50d 6d72 	add.w	sp, sp, #3872	@ 0xf20
c0de063c:	bd80      	pop	{r7, pc}

c0de063e <handler_cmd_keygen_dilithium>:
c0de063e:	b580      	push	{r7, lr}
c0de0640:	f5ad 6d72 	sub.w	sp, sp, #3872	@ 0xf20
c0de0644:	f50d 6020 	add.w	r0, sp, #2560	@ 0xa00
c0de0648:	4669      	mov	r1, sp
c0de064a:	f001 fd48 	bl	c0de20de <pqcrystals_dilithium2_lowram_keypair>
c0de064e:	b110      	cbz	r0, c0de0656 <handler_cmd_keygen_dilithium+0x18>
c0de0650:	f000 f8b2 	bl	c0de07b8 <OUTLINED_FUNCTION_0>
c0de0654:	e003      	b.n	c0de065e <handler_cmd_keygen_dilithium+0x20>
c0de0656:	4668      	mov	r0, sp
c0de0658:	f000 f8b2 	bl	c0de07c0 <OUTLINED_FUNCTION_1>
c0de065c:	2000      	movs	r0, #0
c0de065e:	f50d 6d72 	add.w	sp, sp, #3872	@ 0xf20
c0de0662:	bd80      	pop	{r7, pc}

c0de0664 <handler_cmd_sign_dilithium>:
c0de0664:	b5b0      	push	{r4, r5, r7, lr}
c0de0666:	f6ad 7d48 	subw	sp, sp, #3912	@ 0xf48
c0de066a:	460d      	mov	r5, r1
c0de066c:	4930      	ldr	r1, [pc, #192]	@ (c0de0730 <handler_cmd_sign_dilithium+0xcc>)
c0de066e:	4604      	mov	r4, r0
c0de0670:	f60d 7028 	addw	r0, sp, #3880	@ 0xf28
c0de0674:	2220      	movs	r2, #32
c0de0676:	4479      	add	r1, pc
c0de0678:	f00a fd56 	bl	c0deb128 <__aeabi_memcpy>
c0de067c:	2d80      	cmp	r5, #128	@ 0x80
c0de067e:	d013      	beq.n	c0de06a8 <handler_cmd_sign_dilithium+0x44>
c0de0680:	2d01      	cmp	r5, #1
c0de0682:	d01f      	beq.n	c0de06c4 <handler_cmd_sign_dilithium+0x60>
c0de0684:	bb35      	cbnz	r5, c0de06d4 <handler_cmd_sign_dilithium+0x70>
c0de0686:	f60d 2008 	addw	r0, sp, #2568	@ 0xa08
c0de068a:	a902      	add	r1, sp, #8
c0de068c:	f60d 7228 	addw	r2, sp, #3880	@ 0xf28
c0de0690:	f001 fd36 	bl	c0de2100 <crypto_sign_keypair_core>
c0de0694:	4604      	mov	r4, r0
c0de0696:	2800      	cmp	r0, #0
c0de0698:	d13e      	bne.n	c0de0718 <handler_cmd_sign_dilithium+0xb4>
c0de069a:	2000      	movs	r0, #0
c0de069c:	2100      	movs	r1, #0
c0de069e:	f001 fe0d 	bl	c0de22bc <crypto_sign_signature_init>
c0de06a2:	f000 f891 	bl	c0de07c8 <OUTLINED_FUNCTION_2>
c0de06a6:	e037      	b.n	c0de0718 <handler_cmd_sign_dilithium+0xb4>
c0de06a8:	f60d 2008 	addw	r0, sp, #2568	@ 0xa08
c0de06ac:	a902      	add	r1, sp, #8
c0de06ae:	f60d 7228 	addw	r2, sp, #3880	@ 0xf28
c0de06b2:	f001 fd25 	bl	c0de2100 <crypto_sign_keypair_core>
c0de06b6:	bb80      	cbnz	r0, c0de071a <handler_cmd_sign_dilithium+0xb6>
c0de06b8:	6860      	ldr	r0, [r4, #4]
c0de06ba:	2801      	cmp	r0, #1
c0de06bc:	d812      	bhi.n	c0de06e4 <handler_cmd_sign_dilithium+0x80>
c0de06be:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de06c2:	e02c      	b.n	c0de071e <handler_cmd_sign_dilithium+0xba>
c0de06c4:	e9d4 0100 	ldrd	r0, r1, [r4]
c0de06c8:	f001 fe24 	bl	c0de2314 <crypto_sign_signature_absorb>
c0de06cc:	bb28      	cbnz	r0, c0de071a <handler_cmd_sign_dilithium+0xb6>
c0de06ce:	f000 f87b 	bl	c0de07c8 <OUTLINED_FUNCTION_2>
c0de06d2:	e027      	b.n	c0de0724 <handler_cmd_sign_dilithium+0xc0>
c0de06d4:	f646 2086 	movw	r0, #27270	@ 0x6a86
c0de06d8:	f60d 7d48 	addw	sp, sp, #3912	@ 0xf48
c0de06dc:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
c0de06e0:	f7ff bf32 	b.w	c0de0548 <io_send_sw>
c0de06e4:	3802      	subs	r0, #2
c0de06e6:	4d11      	ldr	r5, [pc, #68]	@ (c0de072c <handler_cmd_sign_dilithium+0xc8>)
c0de06e8:	6060      	str	r0, [r4, #4]
c0de06ea:	6820      	ldr	r0, [r4, #0]
c0de06ec:	3002      	adds	r0, #2
c0de06ee:	6020      	str	r0, [r4, #0]
c0de06f0:	2000      	movs	r0, #0
c0de06f2:	9001      	str	r0, [sp, #4]
c0de06f4:	eb09 0005 	add.w	r0, r9, r5
c0de06f8:	a901      	add	r1, sp, #4
c0de06fa:	aa02      	add	r2, sp, #8
c0de06fc:	f500 60fc 	add.w	r0, r0, #2016	@ 0x7e0
c0de0700:	f001 fe10 	bl	c0de2324 <crypto_sign_signature_core>
c0de0704:	4604      	mov	r4, r0
c0de0706:	b938      	cbnz	r0, c0de0718 <handler_cmd_sign_dilithium+0xb4>
c0de0708:	eb09 0005 	add.w	r0, r9, r5
c0de070c:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de0710:	f500 60fc 	add.w	r0, r0, #2016	@ 0x7e0
c0de0714:	f7ff ff0d 	bl	c0de0532 <io_send_response_pointer>
c0de0718:	b124      	cbz	r4, c0de0724 <handler_cmd_sign_dilithium+0xc0>
c0de071a:	f24b 0005 	movw	r0, #45061	@ 0xb005
c0de071e:	f7ff ff13 	bl	c0de0548 <io_send_sw>
c0de0722:	e000      	b.n	c0de0726 <handler_cmd_sign_dilithium+0xc2>
c0de0724:	2000      	movs	r0, #0
c0de0726:	f60d 7d48 	addw	sp, sp, #3912	@ 0xf48
c0de072a:	bdb0      	pop	{r4, r5, r7, pc}
c0de072c:	000002d8 	.word	0x000002d8
c0de0730:	0000c946 	.word	0x0000c946

c0de0734 <handler_cmd_verify_dilithium>:
c0de0734:	b580      	push	{r7, lr}
c0de0736:	b08e      	sub	sp, #56	@ 0x38
c0de0738:	480d      	ldr	r0, [pc, #52]	@ (c0de0770 <handler_cmd_verify_dilithium+0x3c>)
c0de073a:	2100      	movs	r1, #0
c0de073c:	f640 1395 	movw	r3, #2453	@ 0x995
c0de0740:	e9cd 1100 	strd	r1, r1, [sp]
c0de0744:	4478      	add	r0, pc
c0de0746:	9002      	str	r0, [sp, #8]
c0de0748:	a904      	add	r1, sp, #16
c0de074a:	4a0a      	ldr	r2, [pc, #40]	@ (c0de0774 <handler_cmd_verify_dilithium+0x40>)
c0de074c:	f10d 0017 	add.w	r0, sp, #23
c0de0750:	447a      	add	r2, pc
c0de0752:	f002 f88d 	bl	c0de2870 <pqcrystals_dilithium2_lowram_open>
c0de0756:	b110      	cbz	r0, c0de075e <handler_cmd_verify_dilithium+0x2a>
c0de0758:	f000 f82e 	bl	c0de07b8 <OUTLINED_FUNCTION_0>
c0de075c:	e005      	b.n	c0de076a <handler_cmd_verify_dilithium+0x36>
c0de075e:	9904      	ldr	r1, [sp, #16]
c0de0760:	f10d 0017 	add.w	r0, sp, #23
c0de0764:	f7ff fee5 	bl	c0de0532 <io_send_response_pointer>
c0de0768:	2000      	movs	r0, #0
c0de076a:	b00e      	add	sp, #56	@ 0x38
c0de076c:	bd80      	pop	{r7, pc}
c0de076e:	bf00      	nop
c0de0770:	0000d22d 	.word	0x0000d22d
c0de0774:	0000c88c 	.word	0x0000c88c

c0de0778 <handler_cmd_get_sig_chunk>:
c0de0778:	b580      	push	{r7, lr}
c0de077a:	4806      	ldr	r0, [pc, #24]	@ (c0de0794 <handler_cmd_get_sig_chunk+0x1c>)
c0de077c:	ebc1 2101 	rsb	r1, r1, r1, lsl #8
c0de0780:	4448      	add	r0, r9
c0de0782:	4408      	add	r0, r1
c0de0784:	4611      	mov	r1, r2
c0de0786:	f500 60fc 	add.w	r0, r0, #2016	@ 0x7e0
c0de078a:	f7ff fed2 	bl	c0de0532 <io_send_response_pointer>
c0de078e:	2000      	movs	r0, #0
c0de0790:	bd80      	pop	{r7, pc}
c0de0792:	bf00      	nop
c0de0794:	000002d8 	.word	0x000002d8

c0de0798 <handler_cmd_get_pk_chunk>:
c0de0798:	b580      	push	{r7, lr}
c0de079a:	4806      	ldr	r0, [pc, #24]	@ (c0de07b4 <handler_cmd_get_pk_chunk+0x1c>)
c0de079c:	ebc1 2101 	rsb	r1, r1, r1, lsl #8
c0de07a0:	4448      	add	r0, r9
c0de07a2:	4408      	add	r0, r1
c0de07a4:	4611      	mov	r1, r2
c0de07a6:	f500 7030 	add.w	r0, r0, #704	@ 0x2c0
c0de07aa:	f7ff fec2 	bl	c0de0532 <io_send_response_pointer>
c0de07ae:	2000      	movs	r0, #0
c0de07b0:	bd80      	pop	{r7, pc}
c0de07b2:	bf00      	nop
c0de07b4:	000002d8 	.word	0x000002d8

c0de07b8 <OUTLINED_FUNCTION_0>:
c0de07b8:	f24b 0005 	movw	r0, #45061	@ 0xb005
c0de07bc:	f7ff bec4 	b.w	c0de0548 <io_send_sw>

c0de07c0 <OUTLINED_FUNCTION_1>:
c0de07c0:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de07c4:	f7ff beb5 	b.w	c0de0532 <io_send_response_pointer>

c0de07c8 <OUTLINED_FUNCTION_2>:
c0de07c8:	f44f 4010 	mov.w	r0, #36864	@ 0x9000
c0de07cc:	f7ff bebc 	b.w	c0de0548 <io_send_sw>

c0de07d0 <helper_send_response_pubkey>:
c0de07d0:	b5b0      	push	{r4, r5, r7, lr}
c0de07d2:	b09a      	sub	sp, #104	@ 0x68
c0de07d4:	2041      	movs	r0, #65	@ 0x41
c0de07d6:	f10d 0405 	add.w	r4, sp, #5
c0de07da:	2241      	movs	r2, #65	@ 0x41
c0de07dc:	f88d 0005 	strb.w	r0, [sp, #5]
c0de07e0:	480b      	ldr	r0, [pc, #44]	@ (c0de0810 <helper_send_response_pubkey+0x40>)
c0de07e2:	eb09 0500 	add.w	r5, r9, r0
c0de07e6:	1c60      	adds	r0, r4, #1
c0de07e8:	f105 0108 	add.w	r1, r5, #8
c0de07ec:	f00a fc9c 	bl	c0deb128 <__aeabi_memcpy>
c0de07f0:	2020      	movs	r0, #32
c0de07f2:	f105 0149 	add.w	r1, r5, #73	@ 0x49
c0de07f6:	2220      	movs	r2, #32
c0de07f8:	f88d 0047 	strb.w	r0, [sp, #71]	@ 0x47
c0de07fc:	f104 0043 	add.w	r0, r4, #67	@ 0x43
c0de0800:	f00a fc92 	bl	c0deb128 <__aeabi_memcpy>
c0de0804:	4620      	mov	r0, r4
c0de0806:	2163      	movs	r1, #99	@ 0x63
c0de0808:	f000 f804 	bl	c0de0814 <io_send_response_pointer>
c0de080c:	b01a      	add	sp, #104	@ 0x68
c0de080e:	bdb0      	pop	{r4, r5, r7, pc}
c0de0810:	00000000 	.word	0x00000000

c0de0814 <io_send_response_pointer>:
c0de0814:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de0816:	2200      	movs	r2, #0
c0de0818:	ab01      	add	r3, sp, #4
c0de081a:	c307      	stmia	r3!, {r0, r1, r2}
c0de081c:	a801      	add	r0, sp, #4
c0de081e:	2101      	movs	r1, #1
c0de0820:	f44f 4210 	mov.w	r2, #36864	@ 0x9000
c0de0824:	f009 fe56 	bl	c0dea4d4 <io_send_response_buffers>
c0de0828:	b004      	add	sp, #16
c0de082a:	bd80      	pop	{r7, pc}

c0de082c <helper_send_response_sig>:
c0de082c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de082e:	b093      	sub	sp, #76	@ 0x4c
c0de0830:	f10d 0402 	add.w	r4, sp, #2
c0de0834:	2149      	movs	r1, #73	@ 0x49
c0de0836:	1c65      	adds	r5, r4, #1
c0de0838:	4628      	mov	r0, r5
c0de083a:	f00a fc7f 	bl	c0deb13c <__aeabi_memclr>
c0de083e:	480b      	ldr	r0, [pc, #44]	@ (c0de086c <helper_send_response_sig+0x40>)
c0de0840:	eb09 0700 	add.w	r7, r9, r0
c0de0844:	4628      	mov	r0, r5
c0de0846:	f897 62a0 	ldrb.w	r6, [r7, #672]	@ 0x2a0
c0de084a:	f507 7116 	add.w	r1, r7, #600	@ 0x258
c0de084e:	4632      	mov	r2, r6
c0de0850:	f88d 6002 	strb.w	r6, [sp, #2]
c0de0854:	f00a fc68 	bl	c0deb128 <__aeabi_memcpy>
c0de0858:	f897 12a1 	ldrb.w	r1, [r7, #673]	@ 0x2a1
c0de085c:	1930      	adds	r0, r6, r4
c0de085e:	7041      	strb	r1, [r0, #1]
c0de0860:	1cb1      	adds	r1, r6, #2
c0de0862:	4620      	mov	r0, r4
c0de0864:	f7ff ffd6 	bl	c0de0814 <io_send_response_pointer>
c0de0868:	b013      	add	sp, #76	@ 0x4c
c0de086a:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de086c:	00000000 	.word	0x00000000

c0de0870 <transaction_deserialize>:
c0de0870:	b570      	push	{r4, r5, r6, lr}
c0de0872:	460d      	mov	r5, r1
c0de0874:	4604      	mov	r4, r0
c0de0876:	b910      	cbnz	r0, c0de087e <transaction_deserialize+0xe>
c0de0878:	2001      	movs	r0, #1
c0de087a:	f00a f81d 	bl	c0dea8b8 <assert_exit>
c0de087e:	b915      	cbnz	r5, c0de0886 <transaction_deserialize+0x16>
c0de0880:	2001      	movs	r0, #1
c0de0882:	f00a f819 	bl	c0dea8b8 <assert_exit>
c0de0886:	6860      	ldr	r0, [r4, #4]
c0de0888:	f5b0 7fff 	cmp.w	r0, #510	@ 0x1fe
c0de088c:	d901      	bls.n	c0de0892 <transaction_deserialize+0x22>
c0de088e:	20f9      	movs	r0, #249	@ 0xf9
c0de0890:	e04b      	b.n	c0de092a <transaction_deserialize+0xba>
c0de0892:	4620      	mov	r0, r4
c0de0894:	4629      	mov	r1, r5
c0de0896:	2200      	movs	r2, #0
c0de0898:	f009 fbde 	bl	c0dea058 <buffer_read_u64>
c0de089c:	b330      	cbz	r0, c0de08ec <transaction_deserialize+0x7c>
c0de089e:	6820      	ldr	r0, [r4, #0]
c0de08a0:	68a1      	ldr	r1, [r4, #8]
c0de08a2:	4408      	add	r0, r1
c0de08a4:	2114      	movs	r1, #20
c0de08a6:	61a8      	str	r0, [r5, #24]
c0de08a8:	4620      	mov	r0, r4
c0de08aa:	f009 fbb4 	bl	c0dea016 <buffer_seek_cur>
c0de08ae:	b1f8      	cbz	r0, c0de08f0 <transaction_deserialize+0x80>
c0de08b0:	f105 0108 	add.w	r1, r5, #8
c0de08b4:	4620      	mov	r0, r4
c0de08b6:	2200      	movs	r2, #0
c0de08b8:	2600      	movs	r6, #0
c0de08ba:	f009 fbcd 	bl	c0dea058 <buffer_read_u64>
c0de08be:	b1c8      	cbz	r0, c0de08f4 <transaction_deserialize+0x84>
c0de08c0:	f105 0120 	add.w	r1, r5, #32
c0de08c4:	4620      	mov	r0, r4
c0de08c6:	e9c5 6604 	strd	r6, r6, [r5, #16]
c0de08ca:	f009 fbe5 	bl	c0dea098 <buffer_read_varint>
c0de08ce:	6a29      	ldr	r1, [r5, #32]
c0de08d0:	b990      	cbnz	r0, c0de08f8 <transaction_deserialize+0x88>
c0de08d2:	6a68      	ldr	r0, [r5, #36]	@ 0x24
c0de08d4:	ea5f 0050 	movs.w	r0, r0, lsr #1
c0de08d8:	ea4f 0231 	mov.w	r2, r1, rrx
c0de08dc:	2300      	movs	r3, #0
c0de08de:	f1d2 02e8 	rsbs	r2, r2, #232	@ 0xe8
c0de08e2:	eb73 0000 	sbcs.w	r0, r3, r0
c0de08e6:	d207      	bcs.n	c0de08f8 <transaction_deserialize+0x88>
c0de08e8:	20fc      	movs	r0, #252	@ 0xfc
c0de08ea:	e01e      	b.n	c0de092a <transaction_deserialize+0xba>
c0de08ec:	20ff      	movs	r0, #255	@ 0xff
c0de08ee:	e01c      	b.n	c0de092a <transaction_deserialize+0xba>
c0de08f0:	20fe      	movs	r0, #254	@ 0xfe
c0de08f2:	e01a      	b.n	c0de092a <transaction_deserialize+0xba>
c0de08f4:	20fd      	movs	r0, #253	@ 0xfd
c0de08f6:	e018      	b.n	c0de092a <transaction_deserialize+0xba>
c0de08f8:	6820      	ldr	r0, [r4, #0]
c0de08fa:	68a2      	ldr	r2, [r4, #8]
c0de08fc:	4410      	add	r0, r2
c0de08fe:	61e8      	str	r0, [r5, #28]
c0de0900:	4620      	mov	r0, r4
c0de0902:	f009 fb88 	bl	c0dea016 <buffer_seek_cur>
c0de0906:	b168      	cbz	r0, c0de0924 <transaction_deserialize+0xb4>
c0de0908:	f105 031c 	add.w	r3, r5, #28
c0de090c:	cb0d      	ldmia	r3, {r0, r2, r3}
c0de090e:	f000 f80e 	bl	c0de092e <transaction_utils_check_encoding>
c0de0912:	b148      	cbz	r0, c0de0928 <transaction_deserialize+0xb8>
c0de0914:	e9d4 1201 	ldrd	r1, r2, [r4, #4]
c0de0918:	f06f 0006 	mvn.w	r0, #6
c0de091c:	428a      	cmp	r2, r1
c0de091e:	bf08      	it	eq
c0de0920:	2001      	moveq	r0, #1
c0de0922:	e002      	b.n	c0de092a <transaction_deserialize+0xba>
c0de0924:	20fb      	movs	r0, #251	@ 0xfb
c0de0926:	e000      	b.n	c0de092a <transaction_deserialize+0xba>
c0de0928:	20fa      	movs	r0, #250	@ 0xfa
c0de092a:	b240      	sxtb	r0, r0
c0de092c:	bd70      	pop	{r4, r5, r6, pc}

c0de092e <transaction_utils_check_encoding>:
c0de092e:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de0930:	461c      	mov	r4, r3
c0de0932:	4615      	mov	r5, r2
c0de0934:	4606      	mov	r6, r0
c0de0936:	b910      	cbnz	r0, c0de093e <transaction_utils_check_encoding+0x10>
c0de0938:	2001      	movs	r0, #1
c0de093a:	f009 ffbd 	bl	c0dea8b8 <assert_exit>
c0de093e:	2000      	movs	r0, #0
c0de0940:	2300      	movs	r3, #0
c0de0942:	4602      	mov	r2, r0
c0de0944:	1b40      	subs	r0, r0, r5
c0de0946:	4619      	mov	r1, r3
c0de0948:	eb73 0004 	sbcs.w	r0, r3, r4
c0de094c:	d206      	bcs.n	c0de095c <transaction_utils_check_encoding+0x2e>
c0de094e:	56b7      	ldrsb	r7, [r6, r2]
c0de0950:	1c50      	adds	r0, r2, #1
c0de0952:	f141 0300 	adc.w	r3, r1, #0
c0de0956:	f1b7 3fff 	cmp.w	r7, #4294967295	@ 0xffffffff
c0de095a:	dcf2      	bgt.n	c0de0942 <transaction_utils_check_encoding+0x14>
c0de095c:	2000      	movs	r0, #0
c0de095e:	1b52      	subs	r2, r2, r5
c0de0960:	41a1      	sbcs	r1, r4
c0de0962:	bf28      	it	cs
c0de0964:	2001      	movcs	r0, #1
c0de0966:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0de0968 <validate_pubkey>:
c0de0968:	b108      	cbz	r0, c0de096e <validate_pubkey+0x6>
c0de096a:	f7ff bf31 	b.w	c0de07d0 <helper_send_response_pubkey>
c0de096e:	f646 1085 	movw	r0, #27013	@ 0x6985
c0de0972:	f000 b800 	b.w	c0de0976 <io_send_sw>

c0de0976 <io_send_sw>:
c0de0976:	b580      	push	{r7, lr}
c0de0978:	4602      	mov	r2, r0
c0de097a:	2000      	movs	r0, #0
c0de097c:	2100      	movs	r1, #0
c0de097e:	f009 fda9 	bl	c0dea4d4 <io_send_response_buffers>
c0de0982:	bd80      	pop	{r7, pc}

c0de0984 <validate_transaction>:
c0de0984:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de0988:	b08c      	sub	sp, #48	@ 0x30
c0de098a:	b378      	cbz	r0, c0de09ec <validate_transaction+0x68>
c0de098c:	f8df 8094 	ldr.w	r8, [pc, #148]	@ c0de0a24 <validate_transaction+0xa0>
c0de0990:	2002      	movs	r0, #2
c0de0992:	2500      	movs	r5, #0
c0de0994:	2720      	movs	r7, #32
c0de0996:	2203      	movs	r2, #3
c0de0998:	f240 6401 	movw	r4, #1537	@ 0x601
c0de099c:	f10d 0c2c 	add.w	ip, sp, #44	@ 0x2c
c0de09a0:	f10d 0e28 	add.w	lr, sp, #40	@ 0x28
c0de09a4:	950b      	str	r5, [sp, #44]	@ 0x2c
c0de09a6:	f809 0008 	strb.w	r0, [r9, r8]
c0de09aa:	2048      	movs	r0, #72	@ 0x48
c0de09ac:	900a      	str	r0, [sp, #40]	@ 0x28
c0de09ae:	eb09 0008 	add.w	r0, r9, r8
c0de09b2:	f890 32d4 	ldrb.w	r3, [r0, #724]	@ 0x2d4
c0de09b6:	f500 710e 	add.w	r1, r0, #568	@ 0x238
c0de09ba:	f500 7616 	add.w	r6, r0, #600	@ 0x258
c0de09be:	e9cd 4200 	strd	r4, r2, [sp]
c0de09c2:	f500 722b 	add.w	r2, r0, #684	@ 0x2ac
c0de09c6:	2000      	movs	r0, #0
c0de09c8:	9508      	str	r5, [sp, #32]
c0de09ca:	e9cd c506 	strd	ip, r5, [sp, #24]
c0de09ce:	e9cd 1702 	strd	r1, r7, [sp, #8]
c0de09d2:	2121      	movs	r1, #33	@ 0x21
c0de09d4:	e9cd 6e04 	strd	r6, lr, [sp, #16]
c0de09d8:	f009 fc70 	bl	c0dea2bc <bip32_derive_with_seed_ecdsa_sign_hash_256>
c0de09dc:	b188      	cbz	r0, c0de0a02 <validate_transaction+0x7e>
c0de09de:	f24b 0008 	movw	r0, #45064	@ 0xb008
c0de09e2:	f809 5008 	strb.w	r5, [r9, r8]
c0de09e6:	f7ff ffc6 	bl	c0de0976 <io_send_sw>
c0de09ea:	e017      	b.n	c0de0a1c <validate_transaction+0x98>
c0de09ec:	480d      	ldr	r0, [pc, #52]	@ (c0de0a24 <validate_transaction+0xa0>)
c0de09ee:	2100      	movs	r1, #0
c0de09f0:	f809 1000 	strb.w	r1, [r9, r0]
c0de09f4:	f646 1085 	movw	r0, #27013	@ 0x6985
c0de09f8:	b00c      	add	sp, #48	@ 0x30
c0de09fa:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de09fe:	f7ff bfba 	b.w	c0de0976 <io_send_sw>
c0de0a02:	990a      	ldr	r1, [sp, #40]	@ 0x28
c0de0a04:	eb09 0008 	add.w	r0, r9, r8
c0de0a08:	f880 12a0 	strb.w	r1, [r0, #672]	@ 0x2a0
c0de0a0c:	f89d 102c 	ldrb.w	r1, [sp, #44]	@ 0x2c
c0de0a10:	f001 0101 	and.w	r1, r1, #1
c0de0a14:	f880 12a1 	strb.w	r1, [r0, #673]	@ 0x2a1
c0de0a18:	f7ff ff08 	bl	c0de082c <helper_send_response_sig>
c0de0a1c:	b00c      	add	sp, #48	@ 0x30
c0de0a1e:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de0a22:	bf00      	nop
c0de0a24:	00000000 	.word	0x00000000

c0de0a28 <app_quit>:
c0de0a28:	20ff      	movs	r0, #255	@ 0xff
c0de0a2a:	f00a fa13 	bl	c0deae54 <os_sched_exit>
	...

c0de0a30 <ui_menu_main>:
c0de0a30:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
c0de0a32:	4c1b      	ldr	r4, [pc, #108]	@ (c0de0aa0 <ui_menu_main+0x70>)
c0de0a34:	4819      	ldr	r0, [pc, #100]	@ (c0de0a9c <ui_menu_main+0x6c>)
c0de0a36:	447c      	add	r4, pc
c0de0a38:	eb09 0500 	add.w	r5, r9, r0
c0de0a3c:	f000 f8dc 	bl	c0de0bf8 <OUTLINED_FUNCTION_0>
c0de0a40:	2609      	movs	r6, #9
c0de0a42:	2114      	movs	r1, #20
c0de0a44:	73ae      	strb	r6, [r5, #14]
c0de0a46:	7369      	strb	r1, [r5, #13]
c0de0a48:	4916      	ldr	r1, [pc, #88]	@ (c0de0aa4 <ui_menu_main+0x74>)
c0de0a4a:	4a17      	ldr	r2, [pc, #92]	@ (c0de0aa8 <ui_menu_main+0x78>)
c0de0a4c:	4479      	add	r1, pc
c0de0a4e:	447a      	add	r2, pc
c0de0a50:	e9c5 2101 	strd	r2, r1, [r5, #4]
c0de0a54:	7800      	ldrb	r0, [r0, #0]
c0de0a56:	7328      	strb	r0, [r5, #12]
c0de0a58:	f000 f8ce 	bl	c0de0bf8 <OUTLINED_FUNCTION_0>
c0de0a5c:	2115      	movs	r1, #21
c0de0a5e:	76ae      	strb	r6, [r5, #26]
c0de0a60:	7669      	strb	r1, [r5, #25]
c0de0a62:	4912      	ldr	r1, [pc, #72]	@ (c0de0aac <ui_menu_main+0x7c>)
c0de0a64:	4a12      	ldr	r2, [pc, #72]	@ (c0de0ab0 <ui_menu_main+0x80>)
c0de0a66:	4479      	add	r1, pc
c0de0a68:	447a      	add	r2, pc
c0de0a6a:	e9c5 2104 	strd	r2, r1, [r5, #16]
c0de0a6e:	2100      	movs	r1, #0
c0de0a70:	7840      	ldrb	r0, [r0, #1]
c0de0a72:	7628      	strb	r0, [r5, #24]
c0de0a74:	480f      	ldr	r0, [pc, #60]	@ (c0de0ab4 <ui_menu_main+0x84>)
c0de0a76:	4a10      	ldr	r2, [pc, #64]	@ (c0de0ab8 <ui_menu_main+0x88>)
c0de0a78:	4b10      	ldr	r3, [pc, #64]	@ (c0de0abc <ui_menu_main+0x8c>)
c0de0a7a:	4478      	add	r0, pc
c0de0a7c:	447a      	add	r2, pc
c0de0a7e:	447b      	add	r3, pc
c0de0a80:	e9cd 3200 	strd	r3, r2, [sp]
c0de0a84:	e9cd 1002 	strd	r1, r0, [sp, #8]
c0de0a88:	2200      	movs	r2, #0
c0de0a8a:	23ff      	movs	r3, #255	@ 0xff
c0de0a8c:	480c      	ldr	r0, [pc, #48]	@ (c0de0ac0 <ui_menu_main+0x90>)
c0de0a8e:	490d      	ldr	r1, [pc, #52]	@ (c0de0ac4 <ui_menu_main+0x94>)
c0de0a90:	4478      	add	r0, pc
c0de0a92:	4479      	add	r1, pc
c0de0a94:	f007 fc0a 	bl	c0de82ac <nbgl_useCaseHomeAndSettings>
c0de0a98:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}
c0de0a9a:	bf00      	nop
c0de0a9c:	00001430 	.word	0x00001430
c0de0aa0:	0000dbc6 	.word	0x0000dbc6
c0de0aa4:	0000be13 	.word	0x0000be13
c0de0aa8:	0000c384 	.word	0x0000c384
c0de0aac:	0000bf8a 	.word	0x0000bf8a
c0de0ab0:	0000bbbb 	.word	0x0000bbbb
c0de0ab4:	ffffffab 	.word	0xffffffab
c0de0ab8:	0000d424 	.word	0x0000d424
c0de0abc:	0000d416 	.word	0x0000d416
c0de0ac0:	0000c3c3 	.word	0x0000c3c3
c0de0ac4:	0000aa45 	.word	0x0000aa45

c0de0ac8 <controls_callback>:
c0de0ac8:	b5bf      	push	{r0, r1, r2, r3, r4, r5, r7, lr}
c0de0aca:	4c22      	ldr	r4, [pc, #136]	@ (c0de0b54 <controls_callback+0x8c>)
c0de0acc:	2815      	cmp	r0, #21
c0de0ace:	f809 2004 	strb.w	r2, [r9, r4]
c0de0ad2:	d011      	beq.n	c0de0af8 <controls_callback+0x30>
c0de0ad4:	2814      	cmp	r0, #20
c0de0ad6:	d12a      	bne.n	c0de0b2e <controls_callback+0x66>
c0de0ad8:	eb09 0504 	add.w	r5, r9, r4
c0de0adc:	4c1e      	ldr	r4, [pc, #120]	@ (c0de0b58 <controls_callback+0x90>)
c0de0ade:	447c      	add	r4, pc
c0de0ae0:	f000 f88a 	bl	c0de0bf8 <OUTLINED_FUNCTION_0>
c0de0ae4:	7800      	ldrb	r0, [r0, #0]
c0de0ae6:	fab0 f080 	clz	r0, r0
c0de0aea:	0940      	lsrs	r0, r0, #5
c0de0aec:	7328      	strb	r0, [r5, #12]
c0de0aee:	f88d 000f 	strb.w	r0, [sp, #15]
c0de0af2:	f000 f881 	bl	c0de0bf8 <OUTLINED_FUNCTION_0>
c0de0af6:	e015      	b.n	c0de0b24 <controls_callback+0x5c>
c0de0af8:	4818      	ldr	r0, [pc, #96]	@ (c0de0b5c <controls_callback+0x94>)
c0de0afa:	4478      	add	r0, pc
c0de0afc:	f00a f8fc 	bl	c0deacf8 <pic>
c0de0b00:	7840      	ldrb	r0, [r0, #1]
c0de0b02:	b1a8      	cbz	r0, c0de0b30 <controls_callback+0x68>
c0de0b04:	eb09 0504 	add.w	r5, r9, r4
c0de0b08:	4c15      	ldr	r4, [pc, #84]	@ (c0de0b60 <controls_callback+0x98>)
c0de0b0a:	447c      	add	r4, pc
c0de0b0c:	f000 f874 	bl	c0de0bf8 <OUTLINED_FUNCTION_0>
c0de0b10:	7840      	ldrb	r0, [r0, #1]
c0de0b12:	fab0 f080 	clz	r0, r0
c0de0b16:	0940      	lsrs	r0, r0, #5
c0de0b18:	7628      	strb	r0, [r5, #24]
c0de0b1a:	f88d 000f 	strb.w	r0, [sp, #15]
c0de0b1e:	f000 f86b 	bl	c0de0bf8 <OUTLINED_FUNCTION_0>
c0de0b22:	3001      	adds	r0, #1
c0de0b24:	f10d 010f 	add.w	r1, sp, #15
c0de0b28:	2201      	movs	r2, #1
c0de0b2a:	f00a f91f 	bl	c0dead6c <nvm_write>
c0de0b2e:	bdbf      	pop	{r0, r1, r2, r3, r4, r5, r7, pc}
c0de0b30:	480c      	ldr	r0, [pc, #48]	@ (c0de0b64 <controls_callback+0x9c>)
c0de0b32:	490d      	ldr	r1, [pc, #52]	@ (c0de0b68 <controls_callback+0xa0>)
c0de0b34:	4478      	add	r0, pc
c0de0b36:	4479      	add	r1, pc
c0de0b38:	e9cd 1000 	strd	r1, r0, [sp]
c0de0b3c:	480b      	ldr	r0, [pc, #44]	@ (c0de0b6c <controls_callback+0xa4>)
c0de0b3e:	490c      	ldr	r1, [pc, #48]	@ (c0de0b70 <controls_callback+0xa8>)
c0de0b40:	4a0c      	ldr	r2, [pc, #48]	@ (c0de0b74 <controls_callback+0xac>)
c0de0b42:	4b0d      	ldr	r3, [pc, #52]	@ (c0de0b78 <controls_callback+0xb0>)
c0de0b44:	4478      	add	r0, pc
c0de0b46:	4479      	add	r1, pc
c0de0b48:	447a      	add	r2, pc
c0de0b4a:	447b      	add	r3, pc
c0de0b4c:	f007 fe90 	bl	c0de8870 <nbgl_useCaseChoice>
c0de0b50:	bdbf      	pop	{r0, r1, r2, r3, r4, r5, r7, pc}
c0de0b52:	bf00      	nop
c0de0b54:	00001430 	.word	0x00001430
c0de0b58:	0000db1e 	.word	0x0000db1e
c0de0b5c:	0000db02 	.word	0x0000db02
c0de0b60:	0000daf2 	.word	0x0000daf2
c0de0b64:	00000045 	.word	0x00000045
c0de0b68:	0000bf19 	.word	0x0000bf19
c0de0b6c:	0000b197 	.word	0x0000b197
c0de0b70:	0000badd 	.word	0x0000badd
c0de0b74:	0000bc88 	.word	0x0000bc88
c0de0b78:	0000c290 	.word	0x0000c290

c0de0b7c <review_warning_choice>:
c0de0b7c:	b5b0      	push	{r4, r5, r7, lr}
c0de0b7e:	b086      	sub	sp, #24
c0de0b80:	b1a8      	cbz	r0, c0de0bae <review_warning_choice+0x32>
c0de0b82:	4c17      	ldr	r4, [pc, #92]	@ (c0de0be0 <review_warning_choice+0x64>)
c0de0b84:	4815      	ldr	r0, [pc, #84]	@ (c0de0bdc <review_warning_choice+0x60>)
c0de0b86:	447c      	add	r4, pc
c0de0b88:	eb09 0500 	add.w	r5, r9, r0
c0de0b8c:	f000 f834 	bl	c0de0bf8 <OUTLINED_FUNCTION_0>
c0de0b90:	7840      	ldrb	r0, [r0, #1]
c0de0b92:	fab0 f080 	clz	r0, r0
c0de0b96:	0940      	lsrs	r0, r0, #5
c0de0b98:	7628      	strb	r0, [r5, #24]
c0de0b9a:	f88d 0017 	strb.w	r0, [sp, #23]
c0de0b9e:	f000 f82b 	bl	c0de0bf8 <OUTLINED_FUNCTION_0>
c0de0ba2:	3001      	adds	r0, #1
c0de0ba4:	f10d 0117 	add.w	r1, sp, #23
c0de0ba8:	2201      	movs	r2, #1
c0de0baa:	f00a f8df 	bl	c0dead6c <nvm_write>
c0de0bae:	480b      	ldr	r0, [pc, #44]	@ (c0de0bdc <review_warning_choice+0x60>)
c0de0bb0:	2100      	movs	r1, #0
c0de0bb2:	f819 3000 	ldrb.w	r3, [r9, r0]
c0de0bb6:	480b      	ldr	r0, [pc, #44]	@ (c0de0be4 <review_warning_choice+0x68>)
c0de0bb8:	4a0b      	ldr	r2, [pc, #44]	@ (c0de0be8 <review_warning_choice+0x6c>)
c0de0bba:	4c0c      	ldr	r4, [pc, #48]	@ (c0de0bec <review_warning_choice+0x70>)
c0de0bbc:	4478      	add	r0, pc
c0de0bbe:	447a      	add	r2, pc
c0de0bc0:	447c      	add	r4, pc
c0de0bc2:	e9cd 4200 	strd	r4, r2, [sp]
c0de0bc6:	e9cd 1002 	strd	r1, r0, [sp, #8]
c0de0bca:	2200      	movs	r2, #0
c0de0bcc:	4808      	ldr	r0, [pc, #32]	@ (c0de0bf0 <review_warning_choice+0x74>)
c0de0bce:	4909      	ldr	r1, [pc, #36]	@ (c0de0bf4 <review_warning_choice+0x78>)
c0de0bd0:	4478      	add	r0, pc
c0de0bd2:	4479      	add	r1, pc
c0de0bd4:	f007 fb6a 	bl	c0de82ac <nbgl_useCaseHomeAndSettings>
c0de0bd8:	b006      	add	sp, #24
c0de0bda:	bdb0      	pop	{r4, r5, r7, pc}
c0de0bdc:	00001430 	.word	0x00001430
c0de0be0:	0000da76 	.word	0x0000da76
c0de0be4:	fffffe69 	.word	0xfffffe69
c0de0be8:	0000d2e2 	.word	0x0000d2e2
c0de0bec:	0000d2d4 	.word	0x0000d2d4
c0de0bf0:	0000c283 	.word	0x0000c283
c0de0bf4:	0000a905 	.word	0x0000a905

c0de0bf8 <OUTLINED_FUNCTION_0>:
c0de0bf8:	4620      	mov	r0, r4
c0de0bfa:	f00a b87d 	b.w	c0deacf8 <pic>
	...

c0de0c00 <ui_display_address>:
c0de0c00:	b570      	push	{r4, r5, r6, lr}
c0de0c02:	b088      	sub	sp, #32
c0de0c04:	4e22      	ldr	r6, [pc, #136]	@ (c0de0c90 <ui_display_address+0x90>)
c0de0c06:	eb09 0106 	add.w	r1, r9, r6
c0de0c0a:	f819 0006 	ldrb.w	r0, [r9, r6]
c0de0c0e:	f891 12a8 	ldrb.w	r1, [r1, #680]	@ 0x2a8
c0de0c12:	4308      	orrs	r0, r1
c0de0c14:	d12a      	bne.n	c0de0c6c <ui_display_address+0x6c>
c0de0c16:	4d1f      	ldr	r5, [pc, #124]	@ (c0de0c94 <ui_display_address+0x94>)
c0de0c18:	212b      	movs	r1, #43	@ 0x2b
c0de0c1a:	eb09 0005 	add.w	r0, r9, r5
c0de0c1e:	f00a fa8d 	bl	c0deb13c <__aeabi_memclr>
c0de0c22:	ac03      	add	r4, sp, #12
c0de0c24:	2114      	movs	r1, #20
c0de0c26:	4620      	mov	r0, r4
c0de0c28:	f00a fa88 	bl	c0deb13c <__aeabi_memclr>
c0de0c2c:	eb09 0006 	add.w	r0, r9, r6
c0de0c30:	4621      	mov	r1, r4
c0de0c32:	2214      	movs	r2, #20
c0de0c34:	3008      	adds	r0, #8
c0de0c36:	f7ff f9ed 	bl	c0de0014 <address_from_pubkey>
c0de0c3a:	b308      	cbz	r0, c0de0c80 <ui_display_address+0x80>
c0de0c3c:	eb09 0205 	add.w	r2, r9, r5
c0de0c40:	a803      	add	r0, sp, #12
c0de0c42:	2114      	movs	r1, #20
c0de0c44:	232b      	movs	r3, #43	@ 0x2b
c0de0c46:	f009 fbe3 	bl	c0dea410 <format_hex>
c0de0c4a:	3001      	adds	r0, #1
c0de0c4c:	d018      	beq.n	c0de0c80 <ui_display_address+0x80>
c0de0c4e:	4812      	ldr	r0, [pc, #72]	@ (c0de0c98 <ui_display_address+0x98>)
c0de0c50:	2400      	movs	r4, #0
c0de0c52:	2100      	movs	r1, #0
c0de0c54:	4478      	add	r0, pc
c0de0c56:	e9cd 4000 	strd	r4, r0, [sp]
c0de0c5a:	eb09 0005 	add.w	r0, r9, r5
c0de0c5e:	4a0f      	ldr	r2, [pc, #60]	@ (c0de0c9c <ui_display_address+0x9c>)
c0de0c60:	4b0f      	ldr	r3, [pc, #60]	@ (c0de0ca0 <ui_display_address+0xa0>)
c0de0c62:	447a      	add	r2, pc
c0de0c64:	447b      	add	r3, pc
c0de0c66:	f008 fa7d 	bl	c0de9164 <nbgl_useCaseAddressReview>
c0de0c6a:	e00e      	b.n	c0de0c8a <ui_display_address+0x8a>
c0de0c6c:	2000      	movs	r0, #0
c0de0c6e:	f809 0006 	strb.w	r0, [r9, r6]
c0de0c72:	f24b 0007 	movw	r0, #45063	@ 0xb007
c0de0c76:	b008      	add	sp, #32
c0de0c78:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de0c7c:	f000 b812 	b.w	c0de0ca4 <io_send_sw>
c0de0c80:	f24b 0002 	movw	r0, #45058	@ 0xb002
c0de0c84:	f000 f80e 	bl	c0de0ca4 <io_send_sw>
c0de0c88:	4604      	mov	r4, r0
c0de0c8a:	4620      	mov	r0, r4
c0de0c8c:	b008      	add	sp, #32
c0de0c8e:	bd70      	pop	{r4, r5, r6, pc}
c0de0c90:	00000000 	.word	0x00000000
c0de0c94:	0000144c 	.word	0x0000144c
c0de0c98:	0000005d 	.word	0x0000005d
c0de0c9c:	0000a875 	.word	0x0000a875
c0de0ca0:	0000c279 	.word	0x0000c279

c0de0ca4 <io_send_sw>:
c0de0ca4:	b580      	push	{r7, lr}
c0de0ca6:	4602      	mov	r2, r0
c0de0ca8:	2000      	movs	r0, #0
c0de0caa:	2100      	movs	r1, #0
c0de0cac:	f009 fc12 	bl	c0dea4d4 <io_send_response_buffers>
c0de0cb0:	bd80      	pop	{r7, pc}
	...

c0de0cb4 <review_choice>:
c0de0cb4:	b510      	push	{r4, lr}
c0de0cb6:	4604      	mov	r4, r0
c0de0cb8:	f7ff fe56 	bl	c0de0968 <validate_pubkey>
c0de0cbc:	2007      	movs	r0, #7
c0de0cbe:	2c00      	cmp	r4, #0
c0de0cc0:	bf18      	it	ne
c0de0cc2:	2006      	movne	r0, #6
c0de0cc4:	4902      	ldr	r1, [pc, #8]	@ (c0de0cd0 <review_choice+0x1c>)
c0de0cc6:	4479      	add	r1, pc
c0de0cc8:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de0ccc:	f007 bd86 	b.w	c0de87dc <nbgl_useCaseReviewStatus>
c0de0cd0:	fffffd67 	.word	0xfffffd67

c0de0cd4 <ui_display_transaction_bs_choice>:
c0de0cd4:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de0cd6:	b08d      	sub	sp, #52	@ 0x34
c0de0cd8:	4f44      	ldr	r7, [pc, #272]	@ (c0de0dec <ui_display_transaction_bs_choice+0x118>)
c0de0cda:	4604      	mov	r4, r0
c0de0cdc:	eb09 0007 	add.w	r0, r9, r7
c0de0ce0:	f890 02a8 	ldrb.w	r0, [r0, #680]	@ 0x2a8
c0de0ce4:	2801      	cmp	r0, #1
c0de0ce6:	d15f      	bne.n	c0de0da8 <ui_display_transaction_bs_choice+0xd4>
c0de0ce8:	f819 0007 	ldrb.w	r0, [r9, r7]
c0de0cec:	2801      	cmp	r0, #1
c0de0cee:	d15b      	bne.n	c0de0da8 <ui_display_transaction_bs_choice+0xd4>
c0de0cf0:	4e3f      	ldr	r6, [pc, #252]	@ (c0de0df0 <ui_display_transaction_bs_choice+0x11c>)
c0de0cf2:	211e      	movs	r1, #30
c0de0cf4:	eb09 0006 	add.w	r0, r9, r6
c0de0cf8:	3014      	adds	r0, #20
c0de0cfa:	f00a fa1f 	bl	c0deb13c <__aeabi_memclr>
c0de0cfe:	ad05      	add	r5, sp, #20
c0de0d00:	211e      	movs	r1, #30
c0de0d02:	4628      	mov	r0, r5
c0de0d04:	f00a fa1a 	bl	c0deb13c <__aeabi_memclr>
c0de0d08:	eb09 0007 	add.w	r0, r9, r7
c0de0d0c:	211e      	movs	r1, #30
c0de0d0e:	e9d0 2386 	ldrd	r2, r3, [r0, #536]	@ 0x218
c0de0d12:	2003      	movs	r0, #3
c0de0d14:	9000      	str	r0, [sp, #0]
c0de0d16:	4628      	mov	r0, r5
c0de0d18:	f009 fb33 	bl	c0dea382 <format_fpu64>
c0de0d1c:	2800      	cmp	r0, #0
c0de0d1e:	d04d      	beq.n	c0de0dbc <ui_display_transaction_bs_choice+0xe8>
c0de0d20:	9500      	str	r5, [sp, #0]
c0de0d22:	eb09 0506 	add.w	r5, r9, r6
c0de0d26:	211e      	movs	r1, #30
c0de0d28:	231e      	movs	r3, #30
c0de0d2a:	4a32      	ldr	r2, [pc, #200]	@ (c0de0df4 <ui_display_transaction_bs_choice+0x120>)
c0de0d2c:	f105 0014 	add.w	r0, r5, #20
c0de0d30:	447a      	add	r2, pc
c0de0d32:	f009 fe4f 	bl	c0dea9d4 <snprintf>
c0de0d36:	3554      	adds	r5, #84	@ 0x54
c0de0d38:	212b      	movs	r1, #43	@ 0x2b
c0de0d3a:	4628      	mov	r0, r5
c0de0d3c:	f00a f9fe 	bl	c0deb13c <__aeabi_memclr>
c0de0d40:	eb09 0007 	add.w	r0, r9, r7
c0de0d44:	2114      	movs	r1, #20
c0de0d46:	462a      	mov	r2, r5
c0de0d48:	232b      	movs	r3, #43	@ 0x2b
c0de0d4a:	f8d0 0228 	ldr.w	r0, [r0, #552]	@ 0x228
c0de0d4e:	f009 fb5f 	bl	c0dea410 <format_hex>
c0de0d52:	3001      	adds	r0, #1
c0de0d54:	d035      	beq.n	c0de0dc2 <ui_display_transaction_bs_choice+0xee>
c0de0d56:	4928      	ldr	r1, [pc, #160]	@ (c0de0df8 <ui_display_transaction_bs_choice+0x124>)
c0de0d58:	eb09 0006 	add.w	r0, r9, r6
c0de0d5c:	2500      	movs	r5, #0
c0de0d5e:	4602      	mov	r2, r0
c0de0d60:	4479      	add	r1, pc
c0de0d62:	f842 1f34 	str.w	r1, [r2, #52]!
c0de0d66:	f849 2006 	str.w	r2, [r9, r6]
c0de0d6a:	2202      	movs	r2, #2
c0de0d6c:	4923      	ldr	r1, [pc, #140]	@ (c0de0dfc <ui_display_transaction_bs_choice+0x128>)
c0de0d6e:	7202      	strb	r2, [r0, #8]
c0de0d70:	f100 0254 	add.w	r2, r0, #84	@ 0x54
c0de0d74:	7285      	strb	r5, [r0, #10]
c0de0d76:	4479      	add	r1, pc
c0de0d78:	e9c0 1211 	strd	r1, r2, [r0, #68]	@ 0x44
c0de0d7c:	f100 0114 	add.w	r1, r0, #20
c0de0d80:	6381      	str	r1, [r0, #56]	@ 0x38
c0de0d82:	481f      	ldr	r0, [pc, #124]	@ (c0de0e00 <ui_display_transaction_bs_choice+0x12c>)
c0de0d84:	491f      	ldr	r1, [pc, #124]	@ (c0de0e04 <ui_display_transaction_bs_choice+0x130>)
c0de0d86:	4478      	add	r0, pc
c0de0d88:	4479      	add	r1, pc
c0de0d8a:	b314      	cbz	r4, c0de0dd2 <ui_display_transaction_bs_choice+0xfe>
c0de0d8c:	e9cd 5100 	strd	r5, r1, [sp]
c0de0d90:	e9cd 5002 	strd	r5, r0, [sp, #8]
c0de0d94:	eb09 0106 	add.w	r1, r9, r6
c0de0d98:	2000      	movs	r0, #0
c0de0d9a:	4a1b      	ldr	r2, [pc, #108]	@ (c0de0e08 <ui_display_transaction_bs_choice+0x134>)
c0de0d9c:	4b1b      	ldr	r3, [pc, #108]	@ (c0de0e0c <ui_display_transaction_bs_choice+0x138>)
c0de0d9e:	447a      	add	r2, pc
c0de0da0:	447b      	add	r3, pc
c0de0da2:	f007 ff3f 	bl	c0de8c24 <nbgl_useCaseReviewBlindSigning>
c0de0da6:	e011      	b.n	c0de0dcc <ui_display_transaction_bs_choice+0xf8>
c0de0da8:	2000      	movs	r0, #0
c0de0daa:	f809 0007 	strb.w	r0, [r9, r7]
c0de0dae:	f24b 0007 	movw	r0, #45063	@ 0xb007
c0de0db2:	b00d      	add	sp, #52	@ 0x34
c0de0db4:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de0db8:	f000 b82e 	b.w	c0de0e18 <io_send_sw>
c0de0dbc:	f24b 0003 	movw	r0, #45059	@ 0xb003
c0de0dc0:	e001      	b.n	c0de0dc6 <ui_display_transaction_bs_choice+0xf2>
c0de0dc2:	f24b 0002 	movw	r0, #45058	@ 0xb002
c0de0dc6:	f000 f827 	bl	c0de0e18 <io_send_sw>
c0de0dca:	4605      	mov	r5, r0
c0de0dcc:	4628      	mov	r0, r5
c0de0dce:	b00d      	add	sp, #52	@ 0x34
c0de0dd0:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de0dd2:	e9cd 5100 	strd	r5, r1, [sp]
c0de0dd6:	9002      	str	r0, [sp, #8]
c0de0dd8:	eb09 0106 	add.w	r1, r9, r6
c0de0ddc:	2000      	movs	r0, #0
c0de0dde:	4a0c      	ldr	r2, [pc, #48]	@ (c0de0e10 <ui_display_transaction_bs_choice+0x13c>)
c0de0de0:	4b0c      	ldr	r3, [pc, #48]	@ (c0de0e14 <ui_display_transaction_bs_choice+0x140>)
c0de0de2:	447a      	add	r2, pc
c0de0de4:	447b      	add	r3, pc
c0de0de6:	f007 fe6f 	bl	c0de8ac8 <nbgl_useCaseReview>
c0de0dea:	e7ef      	b.n	c0de0dcc <ui_display_transaction_bs_choice+0xf8>
c0de0dec:	00000000 	.word	0x00000000
c0de0df0:	00001478 	.word	0x00001478
c0de0df4:	0000bf5a 	.word	0x0000bf5a
c0de0df8:	0000b9e6 	.word	0x0000b9e6
c0de0dfc:	0000bf1d 	.word	0x0000bf1d
c0de0e00:	0000009f 	.word	0x0000009f
c0de0e04:	0000baf5 	.word	0x0000baf5
c0de0e08:	0000a739 	.word	0x0000a739
c0de0e0c:	0000b88b 	.word	0x0000b88b
c0de0e10:	0000a6f5 	.word	0x0000a6f5
c0de0e14:	0000b847 	.word	0x0000b847

c0de0e18 <io_send_sw>:
c0de0e18:	b580      	push	{r7, lr}
c0de0e1a:	4602      	mov	r2, r0
c0de0e1c:	2000      	movs	r0, #0
c0de0e1e:	2100      	movs	r1, #0
c0de0e20:	f009 fb58 	bl	c0dea4d4 <io_send_response_buffers>
c0de0e24:	bd80      	pop	{r7, pc}
	...

c0de0e28 <review_choice>:
c0de0e28:	b510      	push	{r4, lr}
c0de0e2a:	4604      	mov	r4, r0
c0de0e2c:	f7ff fdaa 	bl	c0de0984 <validate_transaction>
c0de0e30:	4903      	ldr	r1, [pc, #12]	@ (c0de0e40 <review_choice+0x18>)
c0de0e32:	f084 0001 	eor.w	r0, r4, #1
c0de0e36:	4479      	add	r1, pc
c0de0e38:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de0e3c:	f007 bcce 	b.w	c0de87dc <nbgl_useCaseReviewStatus>
c0de0e40:	fffffbf7 	.word	0xfffffbf7

c0de0e44 <ui_display_blind_signed_transaction>:
c0de0e44:	2001      	movs	r0, #1
c0de0e46:	f7ff bf45 	b.w	c0de0cd4 <ui_display_transaction_bs_choice>

c0de0e4a <ui_display_transaction>:
c0de0e4a:	2000      	movs	r0, #0
c0de0e4c:	f7ff bf42 	b.w	c0de0cd4 <ui_display_transaction_bs_choice>

c0de0e50 <keccak_init>:
c0de0e50:	2106      	movs	r1, #6
c0de0e52:	2220      	movs	r2, #32
c0de0e54:	f009 bd19 	b.w	c0dea88a <cx_hash_init_ex>

c0de0e58 <keccak_update>:
c0de0e58:	f009 bd1c 	b.w	c0dea894 <cx_hash_update>

c0de0e5c <keccak_final>:
c0de0e5c:	f009 bd10 	b.w	c0dea880 <cx_hash_final>

c0de0e60 <inner_keccak256_init>:
c0de0e60:	b160      	cbz	r0, c0de0e7c <inner_keccak256_init+0x1c>
c0de0e62:	b510      	push	{r4, lr}
c0de0e64:	212c      	movs	r1, #44	@ 0x2c
c0de0e66:	4604      	mov	r4, r0
c0de0e68:	f00a f968 	bl	c0deb13c <__aeabi_memclr>
c0de0e6c:	f104 0030 	add.w	r0, r4, #48	@ 0x30
c0de0e70:	f7ff ffee 	bl	c0de0e50 <keccak_init>
c0de0e74:	2000      	movs	r0, #0
c0de0e76:	e9c4 007e 	strd	r0, r0, [r4, #504]	@ 0x1f8
c0de0e7a:	bd10      	pop	{r4, pc}
c0de0e7c:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de0e80:	4770      	bx	lr

c0de0e82 <inner_keccak256_inject>:
c0de0e82:	b580      	push	{r7, lr}
c0de0e84:	4603      	mov	r3, r0
c0de0e86:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de0e8a:	b15b      	cbz	r3, c0de0ea4 <inner_keccak256_inject+0x22>
c0de0e8c:	b151      	cbz	r1, c0de0ea4 <inner_keccak256_inject+0x22>
c0de0e8e:	6a98      	ldr	r0, [r3, #40]	@ 0x28
c0de0e90:	b110      	cbz	r0, c0de0e98 <inner_keccak256_inject+0x16>
c0de0e92:	f06f 0001 	mvn.w	r0, #1
c0de0e96:	bd80      	pop	{r7, pc}
c0de0e98:	f103 0030 	add.w	r0, r3, #48	@ 0x30
c0de0e9c:	b292      	uxth	r2, r2
c0de0e9e:	f7ff ffdb 	bl	c0de0e58 <keccak_update>
c0de0ea2:	2000      	movs	r0, #0
c0de0ea4:	bd80      	pop	{r7, pc}

c0de0ea6 <inner_keccak256_flip>:
c0de0ea6:	b510      	push	{r4, lr}
c0de0ea8:	b128      	cbz	r0, c0de0eb6 <inner_keccak256_flip+0x10>
c0de0eaa:	4604      	mov	r4, r0
c0de0eac:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0de0eae:	b128      	cbz	r0, c0de0ebc <inner_keccak256_flip+0x16>
c0de0eb0:	f06f 0001 	mvn.w	r0, #1
c0de0eb4:	bd10      	pop	{r4, pc}
c0de0eb6:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de0eba:	bd10      	pop	{r4, pc}
c0de0ebc:	f104 0030 	add.w	r0, r4, #48	@ 0x30
c0de0ec0:	4621      	mov	r1, r4
c0de0ec2:	f7ff ffcb 	bl	c0de0e5c <keccak_final>
c0de0ec6:	2000      	movs	r0, #0
c0de0ec8:	2101      	movs	r1, #1
c0de0eca:	e9c4 007e 	strd	r0, r0, [r4, #504]	@ 0x1f8
c0de0ece:	62a1      	str	r1, [r4, #40]	@ 0x28
c0de0ed0:	bd10      	pop	{r4, pc}

c0de0ed2 <inner_keccak256_extract>:
c0de0ed2:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de0ed6:	b0f8      	sub	sp, #480	@ 0x1e0
c0de0ed8:	4682      	mov	sl, r0
c0de0eda:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de0ede:	f1ba 0f00 	cmp.w	sl, #0
c0de0ee2:	d020      	beq.n	c0de0f26 <inner_keccak256_extract+0x54>
c0de0ee4:	460e      	mov	r6, r1
c0de0ee6:	b1f1      	cbz	r1, c0de0f26 <inner_keccak256_extract+0x54>
c0de0ee8:	f8da 0028 	ldr.w	r0, [sl, #40]	@ 0x28
c0de0eec:	b1c8      	cbz	r0, c0de0f22 <inner_keccak256_extract+0x50>
c0de0eee:	e9da 017e 	ldrd	r0, r1, [sl, #504]	@ 0x1f8
c0de0ef2:	4615      	mov	r5, r2
c0de0ef4:	4281      	cmp	r1, r0
c0de0ef6:	d919      	bls.n	c0de0f2c <inner_keccak256_extract+0x5a>
c0de0ef8:	1a0c      	subs	r4, r1, r0
c0de0efa:	4450      	add	r0, sl
c0de0efc:	46a3      	mov	fp, r4
c0de0efe:	42ac      	cmp	r4, r5
c0de0f00:	f500 71ec 	add.w	r1, r0, #472	@ 0x1d8
c0de0f04:	4630      	mov	r0, r6
c0de0f06:	bf88      	it	hi
c0de0f08:	46ab      	movhi	fp, r5
c0de0f0a:	465a      	mov	r2, fp
c0de0f0c:	f00a f90c 	bl	c0deb128 <__aeabi_memcpy>
c0de0f10:	f8da 01f8 	ldr.w	r0, [sl, #504]	@ 0x1f8
c0de0f14:	42ac      	cmp	r4, r5
c0de0f16:	4458      	add	r0, fp
c0de0f18:	f8ca 01f8 	str.w	r0, [sl, #504]	@ 0x1f8
c0de0f1c:	d308      	bcc.n	c0de0f30 <inner_keccak256_extract+0x5e>
c0de0f1e:	2000      	movs	r0, #0
c0de0f20:	e001      	b.n	c0de0f26 <inner_keccak256_extract+0x54>
c0de0f22:	f06f 0001 	mvn.w	r0, #1
c0de0f26:	b078      	add	sp, #480	@ 0x1e0
c0de0f28:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de0f2c:	f04f 0b00 	mov.w	fp, #0
c0de0f30:	ac6e      	add	r4, sp, #440	@ 0x1b8
c0de0f32:	9503      	str	r5, [sp, #12]
c0de0f34:	f104 0020 	add.w	r0, r4, #32
c0de0f38:	9002      	str	r0, [sp, #8]
c0de0f3a:	f50a 70ec 	add.w	r0, sl, #472	@ 0x1d8
c0de0f3e:	e9cd 0600 	strd	r0, r6, [sp]
c0de0f42:	45ab      	cmp	fp, r5
c0de0f44:	d2eb      	bcs.n	c0de0f1e <inner_keccak256_extract+0x4c>
c0de0f46:	4620      	mov	r0, r4
c0de0f48:	4651      	mov	r1, sl
c0de0f4a:	2220      	movs	r2, #32
c0de0f4c:	46a0      	mov	r8, r4
c0de0f4e:	f00a f8eb 	bl	c0deb128 <__aeabi_memcpy>
c0de0f52:	e9da 5408 	ldrd	r5, r4, [sl, #32]
c0de0f56:	9f02      	ldr	r7, [sp, #8]
c0de0f58:	2638      	movs	r6, #56	@ 0x38
c0de0f5a:	f116 0008 	adds.w	r0, r6, #8
c0de0f5e:	d008      	beq.n	c0de0f72 <inner_keccak256_extract+0xa0>
c0de0f60:	4628      	mov	r0, r5
c0de0f62:	4621      	mov	r1, r4
c0de0f64:	4632      	mov	r2, r6
c0de0f66:	f009 ffe9 	bl	c0deaf3c <__aeabi_llsr>
c0de0f6a:	f807 0b01 	strb.w	r0, [r7], #1
c0de0f6e:	3e08      	subs	r6, #8
c0de0f70:	e7f3      	b.n	c0de0f5a <inner_keccak256_extract+0x88>
c0de0f72:	af04      	add	r7, sp, #16
c0de0f74:	4638      	mov	r0, r7
c0de0f76:	f7ff ff6b 	bl	c0de0e50 <keccak_init>
c0de0f7a:	4638      	mov	r0, r7
c0de0f7c:	4641      	mov	r1, r8
c0de0f7e:	2228      	movs	r2, #40	@ 0x28
c0de0f80:	4644      	mov	r4, r8
c0de0f82:	f7ff ff69 	bl	c0de0e58 <keccak_update>
c0de0f86:	9d03      	ldr	r5, [sp, #12]
c0de0f88:	eba5 080b 	sub.w	r8, r5, fp
c0de0f8c:	f1b8 0f1f 	cmp.w	r8, #31
c0de0f90:	d90b      	bls.n	c0de0faa <inner_keccak256_extract+0xd8>
c0de0f92:	9e01      	ldr	r6, [sp, #4]
c0de0f94:	4638      	mov	r0, r7
c0de0f96:	eb06 010b 	add.w	r1, r6, fp
c0de0f9a:	f7ff ff5f 	bl	c0de0e5c <keccak_final>
c0de0f9e:	f10b 0b20 	add.w	fp, fp, #32
c0de0fa2:	f04f 0800 	mov.w	r8, #0
c0de0fa6:	2000      	movs	r0, #0
c0de0fa8:	e00d      	b.n	c0de0fc6 <inner_keccak256_extract+0xf4>
c0de0faa:	4638      	mov	r0, r7
c0de0fac:	9f00      	ldr	r7, [sp, #0]
c0de0fae:	4639      	mov	r1, r7
c0de0fb0:	f7ff ff54 	bl	c0de0e5c <keccak_final>
c0de0fb4:	9e01      	ldr	r6, [sp, #4]
c0de0fb6:	4639      	mov	r1, r7
c0de0fb8:	4642      	mov	r2, r8
c0de0fba:	eb06 000b 	add.w	r0, r6, fp
c0de0fbe:	f00a f8b3 	bl	c0deb128 <__aeabi_memcpy>
c0de0fc2:	2020      	movs	r0, #32
c0de0fc4:	46ab      	mov	fp, r5
c0de0fc6:	e9ca 807e 	strd	r8, r0, [sl, #504]	@ 0x1f8
c0de0fca:	e9da 0108 	ldrd	r0, r1, [sl, #32]
c0de0fce:	3001      	adds	r0, #1
c0de0fd0:	f141 0100 	adc.w	r1, r1, #0
c0de0fd4:	e9ca 0108 	strd	r0, r1, [sl, #32]
c0de0fd8:	e7b3      	b.n	c0de0f42 <inner_keccak256_extract+0x70>

c0de0fda <pqcrystals_dilithium2_lowram_pack_sig_h>:
c0de0fda:	b5b0      	push	{r4, r5, r7, lr}
c0de0fdc:	f500 6012 	add.w	r0, r0, #2336	@ 0x920
c0de0fe0:	2400      	movs	r4, #0
c0de0fe2:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de0fe6:	d009      	beq.n	c0de0ffc <pqcrystals_dilithium2_lowram_pack_sig_h+0x22>
c0de0fe8:	f851 5024 	ldr.w	r5, [r1, r4, lsl #2]
c0de0fec:	b125      	cbz	r5, c0de0ff8 <pqcrystals_dilithium2_lowram_pack_sig_h+0x1e>
c0de0fee:	681d      	ldr	r5, [r3, #0]
c0de0ff0:	5544      	strb	r4, [r0, r5]
c0de0ff2:	681d      	ldr	r5, [r3, #0]
c0de0ff4:	3501      	adds	r5, #1
c0de0ff6:	601d      	str	r5, [r3, #0]
c0de0ff8:	3401      	adds	r4, #1
c0de0ffa:	e7f2      	b.n	c0de0fe2 <pqcrystals_dilithium2_lowram_pack_sig_h+0x8>
c0de0ffc:	6819      	ldr	r1, [r3, #0]
c0de0ffe:	4410      	add	r0, r2
c0de1000:	f880 1050 	strb.w	r1, [r0, #80]	@ 0x50
c0de1004:	bdb0      	pop	{r4, r5, r7, pc}

c0de1006 <pqcrystals_dilithium2_lowram_pack_sig_h_zero>:
c0de1006:	680a      	ldr	r2, [r1, #0]
c0de1008:	f500 6012 	add.w	r0, r0, #2336	@ 0x920
c0de100c:	2300      	movs	r3, #0
c0de100e:	2a4f      	cmp	r2, #79	@ 0x4f
c0de1010:	bf88      	it	hi
c0de1012:	4770      	bxhi	lr
c0de1014:	5483      	strb	r3, [r0, r2]
c0de1016:	680a      	ldr	r2, [r1, #0]
c0de1018:	3201      	adds	r2, #1
c0de101a:	600a      	str	r2, [r1, #0]
c0de101c:	e7f7      	b.n	c0de100e <pqcrystals_dilithium2_lowram_pack_sig_h_zero+0x8>

c0de101e <poly_challenge_compress>:
c0de101e:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de1022:	2200      	movs	r2, #0
c0de1024:	2300      	movs	r3, #0
c0de1026:	2b44      	cmp	r3, #68	@ 0x44
c0de1028:	d002      	beq.n	c0de1030 <poly_challenge_compress+0x12>
c0de102a:	54c2      	strb	r2, [r0, r3]
c0de102c:	3301      	adds	r3, #1
c0de102e:	e7fa      	b.n	c0de1026 <poly_challenge_compress+0x8>
c0de1030:	2200      	movs	r2, #0
c0de1032:	2301      	movs	r3, #1
c0de1034:	2600      	movs	r6, #0
c0de1036:	f04f 0800 	mov.w	r8, #0
c0de103a:	2500      	movs	r5, #0
c0de103c:	2700      	movs	r7, #0
c0de103e:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de1042:	d011      	beq.n	c0de1068 <poly_challenge_compress+0x4a>
c0de1044:	f851 4022 	ldr.w	r4, [r1, r2, lsl #2]
c0de1048:	b164      	cbz	r4, c0de1064 <poly_challenge_compress+0x46>
c0de104a:	5582      	strb	r2, [r0, r6]
c0de104c:	f851 4022 	ldr.w	r4, [r1, r2, lsl #2]
c0de1050:	3401      	adds	r4, #1
c0de1052:	bf04      	itt	eq
c0de1054:	433d      	orreq	r5, r7
c0de1056:	ea48 0803 	orreq.w	r8, r8, r3
c0de105a:	007c      	lsls	r4, r7, #1
c0de105c:	3601      	adds	r6, #1
c0de105e:	ea44 77d3 	orr.w	r7, r4, r3, lsr #31
c0de1062:	005b      	lsls	r3, r3, #1
c0de1064:	3201      	adds	r2, #1
c0de1066:	e7ea      	b.n	c0de103e <poly_challenge_compress+0x20>
c0de1068:	f100 073c 	add.w	r7, r0, #60	@ 0x3c
c0de106c:	2600      	movs	r6, #0
c0de106e:	2e40      	cmp	r6, #64	@ 0x40
c0de1070:	bf08      	it	eq
c0de1072:	e8bd 81f0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de1076:	4640      	mov	r0, r8
c0de1078:	4629      	mov	r1, r5
c0de107a:	4632      	mov	r2, r6
c0de107c:	f009 ff5e 	bl	c0deaf3c <__aeabi_llsr>
c0de1080:	f807 0b01 	strb.w	r0, [r7], #1
c0de1084:	3608      	adds	r6, #8
c0de1086:	e7f2      	b.n	c0de106e <poly_challenge_compress+0x50>

c0de1088 <poly_challenge_decompress>:
c0de1088:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de108c:	4688      	mov	r8, r1
c0de108e:	4682      	mov	sl, r0
c0de1090:	2000      	movs	r0, #0
c0de1092:	2100      	movs	r1, #0
c0de1094:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de1098:	d003      	beq.n	c0de10a2 <poly_challenge_decompress+0x1a>
c0de109a:	f84a 0021 	str.w	r0, [sl, r1, lsl #2]
c0de109e:	3101      	adds	r1, #1
c0de10a0:	e7f8      	b.n	c0de1094 <poly_challenge_decompress+0xc>
c0de10a2:	f108 053c 	add.w	r5, r8, #60	@ 0x3c
c0de10a6:	2600      	movs	r6, #0
c0de10a8:	2700      	movs	r7, #0
c0de10aa:	2400      	movs	r4, #0
c0de10ac:	2e40      	cmp	r6, #64	@ 0x40
c0de10ae:	d009      	beq.n	c0de10c4 <poly_challenge_decompress+0x3c>
c0de10b0:	f815 0b01 	ldrb.w	r0, [r5], #1
c0de10b4:	2100      	movs	r1, #0
c0de10b6:	4632      	mov	r2, r6
c0de10b8:	f009 ff2e 	bl	c0deaf18 <__aeabi_llsl>
c0de10bc:	430c      	orrs	r4, r1
c0de10be:	4307      	orrs	r7, r0
c0de10c0:	3608      	adds	r6, #8
c0de10c2:	e7f3      	b.n	c0de10ac <poly_challenge_decompress+0x24>
c0de10c4:	2000      	movs	r0, #0
c0de10c6:	2827      	cmp	r0, #39	@ 0x27
c0de10c8:	bf08      	it	eq
c0de10ca:	e8bd 85f8 	ldmiaeq.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0de10ce:	07fa      	lsls	r2, r7, #31
c0de10d0:	f818 1000 	ldrb.w	r1, [r8, r0]
c0de10d4:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
c0de10d8:	bf08      	it	eq
c0de10da:	2201      	moveq	r2, #1
c0de10dc:	ea5f 0454 	movs.w	r4, r4, lsr #1
c0de10e0:	f84a 2021 	str.w	r2, [sl, r1, lsl #2]
c0de10e4:	ea4f 0737 	mov.w	r7, r7, rrx
c0de10e8:	3001      	adds	r0, #1
c0de10ea:	e7ec      	b.n	c0de10c6 <poly_challenge_decompress+0x3e>

c0de10ec <poly_schoolbook>:
c0de10ec:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de10f0:	4614      	mov	r4, r2
c0de10f2:	468a      	mov	sl, r1
c0de10f4:	2200      	movs	r2, #0
c0de10f6:	2100      	movs	r1, #0
c0de10f8:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de10fc:	d003      	beq.n	c0de1106 <poly_schoolbook+0x1a>
c0de10fe:	f840 2021 	str.w	r2, [r0, r1, lsl #2]
c0de1102:	3101      	adds	r1, #1
c0de1104:	e7f8      	b.n	c0de10f8 <poly_schoolbook+0xc>
c0de1106:	f10a 053c 	add.w	r5, sl, #60	@ 0x3c
c0de110a:	2700      	movs	r7, #0
c0de110c:	f04f 0b00 	mov.w	fp, #0
c0de1110:	2600      	movs	r6, #0
c0de1112:	9003      	str	r0, [sp, #12]
c0de1114:	2f40      	cmp	r7, #64	@ 0x40
c0de1116:	d006      	beq.n	c0de1126 <poly_schoolbook+0x3a>
c0de1118:	f000 fbf0 	bl	c0de18fc <OUTLINED_FUNCTION_2>
c0de111c:	430e      	orrs	r6, r1
c0de111e:	ea4b 0b00 	orr.w	fp, fp, r0
c0de1122:	3708      	adds	r7, #8
c0de1124:	e7f6      	b.n	c0de1114 <poly_schoolbook+0x28>
c0de1126:	f04f 0800 	mov.w	r8, #0
c0de112a:	f8cd a004 	str.w	sl, [sp, #4]
c0de112e:	f1b8 0f27 	cmp.w	r8, #39	@ 0x27
c0de1132:	bf08      	it	eq
c0de1134:	e8bd 8dff 	ldmiaeq.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de1138:	f81a 0008 	ldrb.w	r0, [sl, r8]
c0de113c:	ea5f 71cb 	movs.w	r1, fp, lsl #31
c0de1140:	f5c0 7780 	rsb	r7, r0, #256	@ 0x100
c0de1144:	d111      	bne.n	c0de116a <poly_schoolbook+0x7e>
c0de1146:	9903      	ldr	r1, [sp, #12]
c0de1148:	9602      	str	r6, [sp, #8]
c0de114a:	2500      	movs	r5, #0
c0de114c:	eb01 0680 	add.w	r6, r1, r0, lsl #2
c0de1150:	42af      	cmp	r7, r5
c0de1152:	d01b      	beq.n	c0de118c <poly_schoolbook+0xa0>
c0de1154:	4620      	mov	r0, r4
c0de1156:	4629      	mov	r1, r5
c0de1158:	f000 f842 	bl	c0de11e0 <polyt0_unpack_idx>
c0de115c:	f856 1025 	ldr.w	r1, [r6, r5, lsl #2]
c0de1160:	4408      	add	r0, r1
c0de1162:	f846 0025 	str.w	r0, [r6, r5, lsl #2]
c0de1166:	3501      	adds	r5, #1
c0de1168:	e7f2      	b.n	c0de1150 <poly_schoolbook+0x64>
c0de116a:	9903      	ldr	r1, [sp, #12]
c0de116c:	2500      	movs	r5, #0
c0de116e:	eb01 0a80 	add.w	sl, r1, r0, lsl #2
c0de1172:	42af      	cmp	r7, r5
c0de1174:	d01b      	beq.n	c0de11ae <poly_schoolbook+0xc2>
c0de1176:	4620      	mov	r0, r4
c0de1178:	4629      	mov	r1, r5
c0de117a:	f000 f831 	bl	c0de11e0 <polyt0_unpack_idx>
c0de117e:	f85a 1025 	ldr.w	r1, [sl, r5, lsl #2]
c0de1182:	1a08      	subs	r0, r1, r0
c0de1184:	f84a 0025 	str.w	r0, [sl, r5, lsl #2]
c0de1188:	3501      	adds	r5, #1
c0de118a:	e7f2      	b.n	c0de1172 <poly_schoolbook+0x86>
c0de118c:	f5a6 6580 	sub.w	r5, r6, #1024	@ 0x400
c0de1190:	9e02      	ldr	r6, [sp, #8]
c0de1192:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de1196:	d01c      	beq.n	c0de11d2 <poly_schoolbook+0xe6>
c0de1198:	4620      	mov	r0, r4
c0de119a:	4639      	mov	r1, r7
c0de119c:	f000 f820 	bl	c0de11e0 <polyt0_unpack_idx>
c0de11a0:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de11a4:	1a08      	subs	r0, r1, r0
c0de11a6:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de11aa:	3701      	adds	r7, #1
c0de11ac:	e7f1      	b.n	c0de1192 <poly_schoolbook+0xa6>
c0de11ae:	f5aa 6580 	sub.w	r5, sl, #1024	@ 0x400
c0de11b2:	f8dd a004 	ldr.w	sl, [sp, #4]
c0de11b6:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de11ba:	d00a      	beq.n	c0de11d2 <poly_schoolbook+0xe6>
c0de11bc:	4620      	mov	r0, r4
c0de11be:	4639      	mov	r1, r7
c0de11c0:	f000 f80e 	bl	c0de11e0 <polyt0_unpack_idx>
c0de11c4:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de11c8:	4408      	add	r0, r1
c0de11ca:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de11ce:	3701      	adds	r7, #1
c0de11d0:	e7f1      	b.n	c0de11b6 <poly_schoolbook+0xca>
c0de11d2:	ea5f 0656 	movs.w	r6, r6, lsr #1
c0de11d6:	f108 0801 	add.w	r8, r8, #1
c0de11da:	ea4f 0b3b 	mov.w	fp, fp, rrx
c0de11de:	e7a6      	b.n	c0de112e <poly_schoolbook+0x42>

c0de11e0 <polyt0_unpack_idx>:
c0de11e0:	08ca      	lsrs	r2, r1, #3
c0de11e2:	230d      	movs	r3, #13
c0de11e4:	f001 0107 	and.w	r1, r1, #7
c0de11e8:	fb02 0003 	mla	r0, r2, r3, r0
c0de11ec:	2906      	cmp	r1, #6
c0de11ee:	d00e      	beq.n	c0de120e <polyt0_unpack_idx+0x2e>
c0de11f0:	2901      	cmp	r1, #1
c0de11f2:	d014      	beq.n	c0de121e <polyt0_unpack_idx+0x3e>
c0de11f4:	2902      	cmp	r1, #2
c0de11f6:	d01a      	beq.n	c0de122e <polyt0_unpack_idx+0x4e>
c0de11f8:	2903      	cmp	r1, #3
c0de11fa:	d01d      	beq.n	c0de1238 <polyt0_unpack_idx+0x58>
c0de11fc:	2904      	cmp	r1, #4
c0de11fe:	d023      	beq.n	c0de1248 <polyt0_unpack_idx+0x68>
c0de1200:	2905      	cmp	r1, #5
c0de1202:	d029      	beq.n	c0de1258 <polyt0_unpack_idx+0x78>
c0de1204:	bb69      	cbnz	r1, c0de1262 <polyt0_unpack_idx+0x82>
c0de1206:	7801      	ldrb	r1, [r0, #0]
c0de1208:	7840      	ldrb	r0, [r0, #1]
c0de120a:	0200      	lsls	r0, r0, #8
c0de120c:	e02d      	b.n	c0de126a <polyt0_unpack_idx+0x8a>
c0de120e:	7a82      	ldrb	r2, [r0, #10]
c0de1210:	7a41      	ldrb	r1, [r0, #9]
c0de1212:	7ac3      	ldrb	r3, [r0, #11]
c0de1214:	0090      	lsls	r0, r2, #2
c0de1216:	ea40 1091 	orr.w	r0, r0, r1, lsr #6
c0de121a:	0299      	lsls	r1, r3, #10
c0de121c:	e025      	b.n	c0de126a <polyt0_unpack_idx+0x8a>
c0de121e:	7882      	ldrb	r2, [r0, #2]
c0de1220:	7841      	ldrb	r1, [r0, #1]
c0de1222:	78c3      	ldrb	r3, [r0, #3]
c0de1224:	00d0      	lsls	r0, r2, #3
c0de1226:	ea40 1051 	orr.w	r0, r0, r1, lsr #5
c0de122a:	02d9      	lsls	r1, r3, #11
c0de122c:	e01d      	b.n	c0de126a <polyt0_unpack_idx+0x8a>
c0de122e:	78c1      	ldrb	r1, [r0, #3]
c0de1230:	7900      	ldrb	r0, [r0, #4]
c0de1232:	0180      	lsls	r0, r0, #6
c0de1234:	0889      	lsrs	r1, r1, #2
c0de1236:	e018      	b.n	c0de126a <polyt0_unpack_idx+0x8a>
c0de1238:	7942      	ldrb	r2, [r0, #5]
c0de123a:	7901      	ldrb	r1, [r0, #4]
c0de123c:	7983      	ldrb	r3, [r0, #6]
c0de123e:	0050      	lsls	r0, r2, #1
c0de1240:	ea40 10d1 	orr.w	r0, r0, r1, lsr #7
c0de1244:	0259      	lsls	r1, r3, #9
c0de1246:	e010      	b.n	c0de126a <polyt0_unpack_idx+0x8a>
c0de1248:	79c2      	ldrb	r2, [r0, #7]
c0de124a:	7981      	ldrb	r1, [r0, #6]
c0de124c:	7a03      	ldrb	r3, [r0, #8]
c0de124e:	0110      	lsls	r0, r2, #4
c0de1250:	ea40 1011 	orr.w	r0, r0, r1, lsr #4
c0de1254:	0319      	lsls	r1, r3, #12
c0de1256:	e008      	b.n	c0de126a <polyt0_unpack_idx+0x8a>
c0de1258:	7a01      	ldrb	r1, [r0, #8]
c0de125a:	7a40      	ldrb	r0, [r0, #9]
c0de125c:	01c0      	lsls	r0, r0, #7
c0de125e:	0849      	lsrs	r1, r1, #1
c0de1260:	e003      	b.n	c0de126a <polyt0_unpack_idx+0x8a>
c0de1262:	7ac1      	ldrb	r1, [r0, #11]
c0de1264:	7b00      	ldrb	r0, [r0, #12]
c0de1266:	0140      	lsls	r0, r0, #5
c0de1268:	08c9      	lsrs	r1, r1, #3
c0de126a:	4308      	orrs	r0, r1
c0de126c:	f36f 305f 	bfc	r0, #13, #19
c0de1270:	f5c0 5080 	rsb	r0, r0, #4096	@ 0x1000
c0de1274:	4770      	bx	lr
	...

c0de1278 <poly_schoolbook_t1>:
c0de1278:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de127c:	4614      	mov	r4, r2
c0de127e:	468b      	mov	fp, r1
c0de1280:	2200      	movs	r2, #0
c0de1282:	2100      	movs	r1, #0
c0de1284:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de1288:	d003      	beq.n	c0de1292 <poly_schoolbook_t1+0x1a>
c0de128a:	f840 2021 	str.w	r2, [r0, r1, lsl #2]
c0de128e:	3101      	adds	r1, #1
c0de1290:	e7f8      	b.n	c0de1284 <poly_schoolbook_t1+0xc>
c0de1292:	f10b 053c 	add.w	r5, fp, #60	@ 0x3c
c0de1296:	2700      	movs	r7, #0
c0de1298:	f04f 0a00 	mov.w	sl, #0
c0de129c:	2600      	movs	r6, #0
c0de129e:	9002      	str	r0, [sp, #8]
c0de12a0:	2f40      	cmp	r7, #64	@ 0x40
c0de12a2:	d006      	beq.n	c0de12b2 <poly_schoolbook_t1+0x3a>
c0de12a4:	f000 fb2a 	bl	c0de18fc <OUTLINED_FUNCTION_2>
c0de12a8:	430e      	orrs	r6, r1
c0de12aa:	ea4a 0a00 	orr.w	sl, sl, r0
c0de12ae:	3708      	adds	r7, #8
c0de12b0:	e7f6      	b.n	c0de12a0 <poly_schoolbook_t1+0x28>
c0de12b2:	4832      	ldr	r0, [pc, #200]	@ (c0de137c <poly_schoolbook_t1+0x104>)
c0de12b4:	2200      	movs	r2, #0
c0de12b6:	f8cd b000 	str.w	fp, [sp]
c0de12ba:	4680      	mov	r8, r0
c0de12bc:	2a27      	cmp	r2, #39	@ 0x27
c0de12be:	bf08      	it	eq
c0de12c0:	e8bd 8dff 	ldmiaeq.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de12c4:	f81b 0002 	ldrb.w	r0, [fp, r2]
c0de12c8:	ea5f 71ca 	movs.w	r1, sl, lsl #31
c0de12cc:	9203      	str	r2, [sp, #12]
c0de12ce:	f5c0 7780 	rsb	r7, r0, #256	@ 0x100
c0de12d2:	d112      	bne.n	c0de12fa <poly_schoolbook_t1+0x82>
c0de12d4:	9902      	ldr	r1, [sp, #8]
c0de12d6:	9601      	str	r6, [sp, #4]
c0de12d8:	2500      	movs	r5, #0
c0de12da:	eb01 0680 	add.w	r6, r1, r0, lsl #2
c0de12de:	42af      	cmp	r7, r5
c0de12e0:	d01e      	beq.n	c0de1320 <poly_schoolbook_t1+0xa8>
c0de12e2:	4620      	mov	r0, r4
c0de12e4:	4629      	mov	r1, r5
c0de12e6:	f000 f84b 	bl	c0de1380 <polyt1_unpack_idx>
c0de12ea:	f856 1025 	ldr.w	r1, [r6, r5, lsl #2]
c0de12ee:	eb01 3040 	add.w	r0, r1, r0, lsl #13
c0de12f2:	f846 0025 	str.w	r0, [r6, r5, lsl #2]
c0de12f6:	3501      	adds	r5, #1
c0de12f8:	e7f1      	b.n	c0de12de <poly_schoolbook_t1+0x66>
c0de12fa:	9902      	ldr	r1, [sp, #8]
c0de12fc:	2500      	movs	r5, #0
c0de12fe:	eb01 0b80 	add.w	fp, r1, r0, lsl #2
c0de1302:	42af      	cmp	r7, r5
c0de1304:	d01f      	beq.n	c0de1346 <poly_schoolbook_t1+0xce>
c0de1306:	4620      	mov	r0, r4
c0de1308:	4629      	mov	r1, r5
c0de130a:	f000 f839 	bl	c0de1380 <polyt1_unpack_idx>
c0de130e:	f85b 1025 	ldr.w	r1, [fp, r5, lsl #2]
c0de1312:	4642      	mov	r2, r8
c0de1314:	fb00 1008 	mla	r0, r0, r8, r1
c0de1318:	f84b 0025 	str.w	r0, [fp, r5, lsl #2]
c0de131c:	3501      	adds	r5, #1
c0de131e:	e7f0      	b.n	c0de1302 <poly_schoolbook_t1+0x8a>
c0de1320:	f5a6 6580 	sub.w	r5, r6, #1024	@ 0x400
c0de1324:	9e01      	ldr	r6, [sp, #4]
c0de1326:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de132a:	d01f      	beq.n	c0de136c <poly_schoolbook_t1+0xf4>
c0de132c:	4620      	mov	r0, r4
c0de132e:	4639      	mov	r1, r7
c0de1330:	f000 f826 	bl	c0de1380 <polyt1_unpack_idx>
c0de1334:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de1338:	4642      	mov	r2, r8
c0de133a:	fb00 1008 	mla	r0, r0, r8, r1
c0de133e:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de1342:	3701      	adds	r7, #1
c0de1344:	e7ef      	b.n	c0de1326 <poly_schoolbook_t1+0xae>
c0de1346:	f5ab 6580 	sub.w	r5, fp, #1024	@ 0x400
c0de134a:	f8dd b000 	ldr.w	fp, [sp]
c0de134e:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de1352:	d00b      	beq.n	c0de136c <poly_schoolbook_t1+0xf4>
c0de1354:	4620      	mov	r0, r4
c0de1356:	4639      	mov	r1, r7
c0de1358:	f000 f812 	bl	c0de1380 <polyt1_unpack_idx>
c0de135c:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de1360:	eb01 3040 	add.w	r0, r1, r0, lsl #13
c0de1364:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de1368:	3701      	adds	r7, #1
c0de136a:	e7f0      	b.n	c0de134e <poly_schoolbook_t1+0xd6>
c0de136c:	9a03      	ldr	r2, [sp, #12]
c0de136e:	ea5f 0656 	movs.w	r6, r6, lsr #1
c0de1372:	ea4f 0a3a 	mov.w	sl, sl, rrx
c0de1376:	3201      	adds	r2, #1
c0de1378:	e7a0      	b.n	c0de12bc <poly_schoolbook_t1+0x44>
c0de137a:	bf00      	nop
c0de137c:	ffffe000 	.word	0xffffe000

c0de1380 <polyt1_unpack_idx>:
c0de1380:	088a      	lsrs	r2, r1, #2
c0de1382:	f001 0103 	and.w	r1, r1, #3
c0de1386:	eb02 0282 	add.w	r2, r2, r2, lsl #2
c0de138a:	2902      	cmp	r1, #2
c0de138c:	4410      	add	r0, r2
c0de138e:	d006      	beq.n	c0de139e <polyt1_unpack_idx+0x1e>
c0de1390:	2901      	cmp	r1, #1
c0de1392:	d009      	beq.n	c0de13a8 <polyt1_unpack_idx+0x28>
c0de1394:	b969      	cbnz	r1, c0de13b2 <polyt1_unpack_idx+0x32>
c0de1396:	7801      	ldrb	r1, [r0, #0]
c0de1398:	2208      	movs	r2, #8
c0de139a:	2301      	movs	r3, #1
c0de139c:	e00d      	b.n	c0de13ba <polyt1_unpack_idx+0x3a>
c0de139e:	7881      	ldrb	r1, [r0, #2]
c0de13a0:	2204      	movs	r2, #4
c0de13a2:	2303      	movs	r3, #3
c0de13a4:	0909      	lsrs	r1, r1, #4
c0de13a6:	e008      	b.n	c0de13ba <polyt1_unpack_idx+0x3a>
c0de13a8:	7841      	ldrb	r1, [r0, #1]
c0de13aa:	2206      	movs	r2, #6
c0de13ac:	2302      	movs	r3, #2
c0de13ae:	0889      	lsrs	r1, r1, #2
c0de13b0:	e003      	b.n	c0de13ba <polyt1_unpack_idx+0x3a>
c0de13b2:	78c1      	ldrb	r1, [r0, #3]
c0de13b4:	2202      	movs	r2, #2
c0de13b6:	2304      	movs	r3, #4
c0de13b8:	0989      	lsrs	r1, r1, #6
c0de13ba:	5cc0      	ldrb	r0, [r0, r3]
c0de13bc:	4090      	lsls	r0, r2
c0de13be:	f400 707f 	and.w	r0, r0, #1020	@ 0x3fc
c0de13c2:	4308      	orrs	r0, r1
c0de13c4:	4770      	bx	lr

c0de13c6 <polyw_pack>:
c0de13c6:	b5b0      	push	{r4, r5, r7, lr}
c0de13c8:	4605      	mov	r5, r0
c0de13ca:	4608      	mov	r0, r1
c0de13cc:	460c      	mov	r4, r1
c0de13ce:	f000 fb23 	bl	c0de1a18 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de13d2:	4620      	mov	r0, r4
c0de13d4:	f000 fb2f 	bl	c0de1a36 <pqcrystals_dilithium2_lowram_poly_caddq>
c0de13d8:	2000      	movs	r0, #0
c0de13da:	f5b0 7f80 	cmp.w	r0, #256	@ 0x100
c0de13de:	bf08      	it	eq
c0de13e0:	bdb0      	popeq	{r4, r5, r7, pc}
c0de13e2:	f854 1020 	ldr.w	r1, [r4, r0, lsl #2]
c0de13e6:	eb00 0240 	add.w	r2, r0, r0, lsl #1
c0de13ea:	54a9      	strb	r1, [r5, r2]
c0de13ec:	18a9      	adds	r1, r5, r2
c0de13ee:	f854 2020 	ldr.w	r2, [r4, r0, lsl #2]
c0de13f2:	0a12      	lsrs	r2, r2, #8
c0de13f4:	704a      	strb	r2, [r1, #1]
c0de13f6:	eb04 0280 	add.w	r2, r4, r0, lsl #2
c0de13fa:	3001      	adds	r0, #1
c0de13fc:	8852      	ldrh	r2, [r2, #2]
c0de13fe:	708a      	strb	r2, [r1, #2]
c0de1400:	e7eb      	b.n	c0de13da <polyw_pack+0x14>

c0de1402 <polyw_unpack>:
c0de1402:	b5b0      	push	{r4, r5, r7, lr}
c0de1404:	2200      	movs	r2, #0
c0de1406:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de140a:	bf08      	it	eq
c0de140c:	bdb0      	popeq	{r4, r5, r7, pc}
c0de140e:	eb02 0342 	add.w	r3, r2, r2, lsl #1
c0de1412:	5ccc      	ldrb	r4, [r1, r3]
c0de1414:	440b      	add	r3, r1
c0de1416:	f840 4022 	str.w	r4, [r0, r2, lsl #2]
c0de141a:	785d      	ldrb	r5, [r3, #1]
c0de141c:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de1420:	f840 4022 	str.w	r4, [r0, r2, lsl #2]
c0de1424:	789b      	ldrb	r3, [r3, #2]
c0de1426:	ea44 4303 	orr.w	r3, r4, r3, lsl #16
c0de142a:	f840 3022 	str.w	r3, [r0, r2, lsl #2]
c0de142e:	3201      	adds	r2, #1
c0de1430:	e7e9      	b.n	c0de1406 <polyw_unpack+0x4>

c0de1432 <polyw_sub>:
c0de1432:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de1434:	3102      	adds	r1, #2
c0de1436:	2300      	movs	r3, #0
c0de1438:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
c0de143c:	bf08      	it	eq
c0de143e:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de1440:	f811 5c02 	ldrb.w	r5, [r1, #-2]
c0de1444:	f811 6c01 	ldrb.w	r6, [r1, #-1]
c0de1448:	f811 7b03 	ldrb.w	r7, [r1], #3
c0de144c:	f852 4023 	ldr.w	r4, [r2, r3, lsl #2]
c0de1450:	ea45 2506 	orr.w	r5, r5, r6, lsl #8
c0de1454:	ea45 4507 	orr.w	r5, r5, r7, lsl #16
c0de1458:	1b2c      	subs	r4, r5, r4
c0de145a:	f840 4023 	str.w	r4, [r0, r3, lsl #2]
c0de145e:	3301      	adds	r3, #1
c0de1460:	e7ea      	b.n	c0de1438 <polyw_sub+0x6>

c0de1462 <poly_highbits>:
c0de1462:	b5b0      	push	{r4, r5, r7, lr}
c0de1464:	2200      	movs	r2, #0
c0de1466:	f642 430b 	movw	r3, #11275	@ 0x2c0b
c0de146a:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de146e:	bf08      	it	eq
c0de1470:	bdb0      	popeq	{r4, r5, r7, pc}
c0de1472:	f851 4022 	ldr.w	r4, [r1, r2, lsl #2]
c0de1476:	347f      	adds	r4, #127	@ 0x7f
c0de1478:	11e4      	asrs	r4, r4, #7
c0de147a:	435c      	muls	r4, r3
c0de147c:	f504 0500 	add.w	r5, r4, #8388608	@ 0x800000
c0de1480:	162d      	asrs	r5, r5, #24
c0de1482:	f1b4 5f2e 	cmp.w	r4, #729808896	@ 0x2b800000
c0de1486:	bfa8      	it	ge
c0de1488:	2500      	movge	r5, #0
c0de148a:	f840 5022 	str.w	r5, [r0, r2, lsl #2]
c0de148e:	3201      	adds	r2, #1
c0de1490:	e7eb      	b.n	c0de146a <poly_highbits+0x8>
	...

c0de1494 <poly_lowbits>:
c0de1494:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de1498:	4e13      	ldr	r6, [pc, #76]	@ (c0de14e8 <poly_lowbits+0x54>)
c0de149a:	4f15      	ldr	r7, [pc, #84]	@ (c0de14f0 <poly_lowbits+0x5c>)
c0de149c:	2200      	movs	r2, #0
c0de149e:	f642 4c0b 	movw	ip, #11275	@ 0x2c0b
c0de14a2:	f06f 0e01 	mvn.w	lr, #1
c0de14a6:	46b0      	mov	r8, r6
c0de14a8:	4e10      	ldr	r6, [pc, #64]	@ (c0de14ec <poly_lowbits+0x58>)
c0de14aa:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de14ae:	bf08      	it	eq
c0de14b0:	e8bd 81f0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de14b4:	f851 3022 	ldr.w	r3, [r1, r2, lsl #2]
c0de14b8:	f103 047f 	add.w	r4, r3, #127	@ 0x7f
c0de14bc:	11e4      	asrs	r4, r4, #7
c0de14be:	fb04 f40c 	mul.w	r4, r4, ip
c0de14c2:	f504 0500 	add.w	r5, r4, #8388608	@ 0x800000
c0de14c6:	f1b4 5f2e 	cmp.w	r4, #729808896	@ 0x2b800000
c0de14ca:	4644      	mov	r4, r8
c0de14cc:	ea0e 55e5 	and.w	r5, lr, r5, asr #23
c0de14d0:	bfb8      	it	lt
c0de14d2:	fb05 3308 	mlalt	r3, r5, r8, r3
c0de14d6:	42bb      	cmp	r3, r7
c0de14d8:	4634      	mov	r4, r6
c0de14da:	bfc8      	it	gt
c0de14dc:	4433      	addgt	r3, r6
c0de14de:	f840 3022 	str.w	r3, [r0, r2, lsl #2]
c0de14e2:	3201      	adds	r2, #1
c0de14e4:	e7e1      	b.n	c0de14aa <poly_lowbits+0x16>
c0de14e6:	bf00      	nop
c0de14e8:	fffe8c00 	.word	0xfffe8c00
c0de14ec:	ff801fff 	.word	0xff801fff
c0de14f0:	003ff000 	.word	0x003ff000

c0de14f4 <unpack_sk_s1>:
c0de14f4:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de14f8:	eb01 1142 	add.w	r1, r1, r2, lsl #5
c0de14fc:	3180      	adds	r1, #128	@ 0x80
c0de14fe:	f001 bb1e 	b.w	c0de2b3e <small_polyeta_unpack>

c0de1502 <unpack_sk_s2>:
c0de1502:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de1506:	eb01 1142 	add.w	r1, r1, r2, lsl #5
c0de150a:	f501 7100 	add.w	r1, r1, #512	@ 0x200
c0de150e:	f001 bb16 	b.w	c0de2b3e <small_polyeta_unpack>

c0de1512 <polyw_add_idx>:
c0de1512:	b570      	push	{r4, r5, r6, lr}
c0de1514:	4604      	mov	r4, r0
c0de1516:	eb02 0542 	add.w	r5, r2, r2, lsl #1
c0de151a:	1966      	adds	r6, r4, r5
c0de151c:	5d40      	ldrb	r0, [r0, r5]
c0de151e:	7872      	ldrb	r2, [r6, #1]
c0de1520:	78b3      	ldrb	r3, [r6, #2]
c0de1522:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de1526:	ea40 4003 	orr.w	r0, r0, r3, lsl #16
c0de152a:	4408      	add	r0, r1
c0de152c:	f000 fd88 	bl	c0de2040 <pqcrystals_dilithium2_lowram_freeze>
c0de1530:	0c01      	lsrs	r1, r0, #16
c0de1532:	5560      	strb	r0, [r4, r5]
c0de1534:	0a00      	lsrs	r0, r0, #8
c0de1536:	70b1      	strb	r1, [r6, #2]
c0de1538:	7070      	strb	r0, [r6, #1]
c0de153a:	bd70      	pop	{r4, r5, r6, pc}

c0de153c <poly_uniform_pointwise_montgomery_polywadd_lowram_eth>:
c0de153c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1540:	f5ad 7d06 	sub.w	sp, sp, #536	@ 0x218
c0de1544:	f10d 0808 	add.w	r8, sp, #8
c0de1548:	4683      	mov	fp, r0
c0de154a:	461e      	mov	r6, r3
c0de154c:	4617      	mov	r7, r2
c0de154e:	468a      	mov	sl, r1
c0de1550:	4640      	mov	r0, r8
c0de1552:	f7ff fc85 	bl	c0de0e60 <inner_keccak256_init>
c0de1556:	4640      	mov	r0, r8
c0de1558:	4639      	mov	r1, r7
c0de155a:	2220      	movs	r2, #32
c0de155c:	f7ff fc91 	bl	c0de0e82 <inner_keccak256_inject>
c0de1560:	0a30      	lsrs	r0, r6, #8
c0de1562:	f10d 0106 	add.w	r1, sp, #6
c0de1566:	2202      	movs	r2, #2
c0de1568:	f88d 6006 	strb.w	r6, [sp, #6]
c0de156c:	f88d 0007 	strb.w	r0, [sp, #7]
c0de1570:	4640      	mov	r0, r8
c0de1572:	f7ff fc86 	bl	c0de0e82 <inner_keccak256_inject>
c0de1576:	4640      	mov	r0, r8
c0de1578:	f7ff fc95 	bl	c0de0ea6 <inner_keccak256_flip>
c0de157c:	4c10      	ldr	r4, [pc, #64]	@ (c0de15c0 <poly_uniform_pointwise_montgomery_polywadd_lowram_eth+0x84>)
c0de157e:	2700      	movs	r7, #0
c0de1580:	f20d 260f 	addw	r6, sp, #527	@ 0x20f
c0de1584:	4640      	mov	r0, r8
c0de1586:	4631      	mov	r1, r6
c0de1588:	2209      	movs	r2, #9
c0de158a:	f7ff fca2 	bl	c0de0ed2 <inner_keccak256_extract>
c0de158e:	2500      	movs	r5, #0
c0de1590:	2d06      	cmp	r5, #6
c0de1592:	bf98      	it	ls
c0de1594:	f5b7 7f80 	cmpls.w	r7, #256	@ 0x100
c0de1598:	d20b      	bcs.n	c0de15b2 <poly_uniform_pointwise_montgomery_polywadd_lowram_eth+0x76>
c0de159a:	f000 f99a 	bl	c0de18d2 <OUTLINED_FUNCTION_0>
c0de159e:	d806      	bhi.n	c0de15ae <poly_uniform_pointwise_montgomery_polywadd_lowram_eth+0x72>
c0de15a0:	f85a 1027 	ldr.w	r1, [sl, r7, lsl #2]
c0de15a4:	f000 f9b0 	bl	c0de1908 <OUTLINED_FUNCTION_3>
c0de15a8:	f000 f9b2 	bl	c0de1910 <OUTLINED_FUNCTION_4>
c0de15ac:	3701      	adds	r7, #1
c0de15ae:	3503      	adds	r5, #3
c0de15b0:	e7ee      	b.n	c0de1590 <poly_uniform_pointwise_montgomery_polywadd_lowram_eth+0x54>
c0de15b2:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de15b6:	d3e5      	bcc.n	c0de1584 <poly_uniform_pointwise_montgomery_polywadd_lowram_eth+0x48>
c0de15b8:	f50d 7d06 	add.w	sp, sp, #536	@ 0x218
c0de15bc:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de15c0:	007fe000 	.word	0x007fe000

c0de15c4 <polyz_unpack_inplace>:
c0de15c4:	b5b0      	push	{r4, r5, r7, lr}
c0de15c6:	7801      	ldrb	r1, [r0, #0]
c0de15c8:	7883      	ldrb	r3, [r0, #2]
c0de15ca:	7842      	ldrb	r2, [r0, #1]
c0de15cc:	78c4      	ldrb	r4, [r0, #3]
c0de15ce:	7a05      	ldrb	r5, [r0, #8]
c0de15d0:	f363 4111 	bfi	r1, r3, #16, #2
c0de15d4:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de15d8:	79c2      	ldrb	r2, [r0, #7]
c0de15da:	f5c1 3100 	rsb	r1, r1, #131072	@ 0x20000
c0de15de:	6001      	str	r1, [r0, #0]
c0de15e0:	7981      	ldrb	r1, [r0, #6]
c0de15e2:	0092      	lsls	r2, r2, #2
c0de15e4:	ea42 1291 	orr.w	r2, r2, r1, lsr #6
c0de15e8:	f001 013f 	and.w	r1, r1, #63	@ 0x3f
c0de15ec:	ea42 2285 	orr.w	r2, r2, r5, lsl #10
c0de15f0:	7945      	ldrb	r5, [r0, #5]
c0de15f2:	f5c2 3200 	rsb	r2, r2, #131072	@ 0x20000
c0de15f6:	60c2      	str	r2, [r0, #12]
c0de15f8:	7902      	ldrb	r2, [r0, #4]
c0de15fa:	012d      	lsls	r5, r5, #4
c0de15fc:	ea45 1512 	orr.w	r5, r5, r2, lsr #4
c0de1600:	ea45 3101 	orr.w	r1, r5, r1, lsl #12
c0de1604:	f5c1 3100 	rsb	r1, r1, #131072	@ 0x20000
c0de1608:	6081      	str	r1, [r0, #8]
c0de160a:	0899      	lsrs	r1, r3, #2
c0de160c:	f362 3191 	bfi	r1, r2, #14, #4
c0de1610:	ea41 1184 	orr.w	r1, r1, r4, lsl #6
c0de1614:	f5c1 3100 	rsb	r1, r1, #131072	@ 0x20000
c0de1618:	6041      	str	r1, [r0, #4]
c0de161a:	bdb0      	pop	{r4, r5, r7, pc}

c0de161c <poly_uniform_gamma1_lowram_eth>:
c0de161c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de161e:	b085      	sub	sp, #20
c0de1620:	4605      	mov	r5, r0
c0de1622:	4618      	mov	r0, r3
c0de1624:	461c      	mov	r4, r3
c0de1626:	4616      	mov	r6, r2
c0de1628:	460f      	mov	r7, r1
c0de162a:	f7ff fc19 	bl	c0de0e60 <inner_keccak256_init>
c0de162e:	4620      	mov	r0, r4
c0de1630:	4639      	mov	r1, r7
c0de1632:	2240      	movs	r2, #64	@ 0x40
c0de1634:	f7ff fc25 	bl	c0de0e82 <inner_keccak256_inject>
c0de1638:	0a30      	lsrs	r0, r6, #8
c0de163a:	f10d 0102 	add.w	r1, sp, #2
c0de163e:	2202      	movs	r2, #2
c0de1640:	f88d 6002 	strb.w	r6, [sp, #2]
c0de1644:	f88d 0003 	strb.w	r0, [sp, #3]
c0de1648:	4620      	mov	r0, r4
c0de164a:	f7ff fc1a 	bl	c0de0e82 <inner_keccak256_inject>
c0de164e:	4620      	mov	r0, r4
c0de1650:	f7ff fc29 	bl	c0de0ea6 <inner_keccak256_flip>
c0de1654:	2700      	movs	r7, #0
c0de1656:	ae01      	add	r6, sp, #4
c0de1658:	2f40      	cmp	r7, #64	@ 0x40
c0de165a:	bf04      	itt	eq
c0de165c:	b005      	addeq	sp, #20
c0de165e:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de1660:	4620      	mov	r0, r4
c0de1662:	4631      	mov	r1, r6
c0de1664:	2209      	movs	r2, #9
c0de1666:	f7ff fc34 	bl	c0de0ed2 <inner_keccak256_extract>
c0de166a:	4630      	mov	r0, r6
c0de166c:	f7ff ffaa 	bl	c0de15c4 <polyz_unpack_inplace>
c0de1670:	2000      	movs	r0, #0
c0de1672:	2804      	cmp	r0, #4
c0de1674:	d005      	beq.n	c0de1682 <poly_uniform_gamma1_lowram_eth+0x66>
c0de1676:	f856 1020 	ldr.w	r1, [r6, r0, lsl #2]
c0de167a:	f845 1020 	str.w	r1, [r5, r0, lsl #2]
c0de167e:	3001      	adds	r0, #1
c0de1680:	e7f7      	b.n	c0de1672 <poly_uniform_gamma1_lowram_eth+0x56>
c0de1682:	3510      	adds	r5, #16
c0de1684:	3701      	adds	r7, #1
c0de1686:	e7e7      	b.n	c0de1658 <poly_uniform_gamma1_lowram_eth+0x3c>

c0de1688 <poly_uniform_gamma1_add_lowram_eth>:
c0de1688:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de168c:	b085      	sub	sp, #20
c0de168e:	f8dd a030 	ldr.w	sl, [sp, #48]	@ 0x30
c0de1692:	4605      	mov	r5, r0
c0de1694:	461f      	mov	r7, r3
c0de1696:	4690      	mov	r8, r2
c0de1698:	460c      	mov	r4, r1
c0de169a:	4650      	mov	r0, sl
c0de169c:	f7ff fbe0 	bl	c0de0e60 <inner_keccak256_init>
c0de16a0:	4650      	mov	r0, sl
c0de16a2:	4641      	mov	r1, r8
c0de16a4:	2240      	movs	r2, #64	@ 0x40
c0de16a6:	f7ff fbec 	bl	c0de0e82 <inner_keccak256_inject>
c0de16aa:	0a38      	lsrs	r0, r7, #8
c0de16ac:	f10d 0102 	add.w	r1, sp, #2
c0de16b0:	2202      	movs	r2, #2
c0de16b2:	f88d 7002 	strb.w	r7, [sp, #2]
c0de16b6:	f88d 0003 	strb.w	r0, [sp, #3]
c0de16ba:	4650      	mov	r0, sl
c0de16bc:	f7ff fbe1 	bl	c0de0e82 <inner_keccak256_inject>
c0de16c0:	4650      	mov	r0, sl
c0de16c2:	f7ff fbf0 	bl	c0de0ea6 <inner_keccak256_flip>
c0de16c6:	2600      	movs	r6, #0
c0de16c8:	af01      	add	r7, sp, #4
c0de16ca:	2e40      	cmp	r6, #64	@ 0x40
c0de16cc:	d011      	beq.n	c0de16f2 <poly_uniform_gamma1_add_lowram_eth+0x6a>
c0de16ce:	4650      	mov	r0, sl
c0de16d0:	4639      	mov	r1, r7
c0de16d2:	2209      	movs	r2, #9
c0de16d4:	f7ff fbfd 	bl	c0de0ed2 <inner_keccak256_extract>
c0de16d8:	4638      	mov	r0, r7
c0de16da:	f7ff ff73 	bl	c0de15c4 <polyz_unpack_inplace>
c0de16de:	2000      	movs	r0, #0
c0de16e0:	2804      	cmp	r0, #4
c0de16e2:	d002      	beq.n	c0de16ea <poly_uniform_gamma1_add_lowram_eth+0x62>
c0de16e4:	f000 f901 	bl	c0de18ea <OUTLINED_FUNCTION_1>
c0de16e8:	e7fa      	b.n	c0de16e0 <poly_uniform_gamma1_add_lowram_eth+0x58>
c0de16ea:	3410      	adds	r4, #16
c0de16ec:	3510      	adds	r5, #16
c0de16ee:	3601      	adds	r6, #1
c0de16f0:	e7eb      	b.n	c0de16ca <poly_uniform_gamma1_add_lowram_eth+0x42>
c0de16f2:	b005      	add	sp, #20
c0de16f4:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}

c0de16f8 <poly_make_hint_lowram>:
c0de16f8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de16fc:	4686      	mov	lr, r0
c0de16fe:	481a      	ldr	r0, [pc, #104]	@ (c0de1768 <poly_make_hint_lowram+0x70>)
c0de1700:	1c93      	adds	r3, r2, #2
c0de1702:	468c      	mov	ip, r1
c0de1704:	2200      	movs	r2, #0
c0de1706:	f642 450b 	movw	r5, #11275	@ 0x2c0b
c0de170a:	2600      	movs	r6, #0
c0de170c:	4680      	mov	r8, r0
c0de170e:	f5b6 7f80 	cmp.w	r6, #256	@ 0x100
c0de1712:	d026      	beq.n	c0de1762 <poly_make_hint_lowram+0x6a>
c0de1714:	f813 4c02 	ldrb.w	r4, [r3, #-2]
c0de1718:	f813 1c01 	ldrb.w	r1, [r3, #-1]
c0de171c:	f813 0b03 	ldrb.w	r0, [r3], #3
c0de1720:	f85c 7026 	ldr.w	r7, [ip, r6, lsl #2]
c0de1724:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
c0de1728:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de172c:	307f      	adds	r0, #127	@ 0x7f
c0de172e:	19c1      	adds	r1, r0, r7
c0de1730:	4647      	mov	r7, r8
c0de1732:	11c9      	asrs	r1, r1, #7
c0de1734:	4369      	muls	r1, r5
c0de1736:	f501 0400 	add.w	r4, r1, #8388608	@ 0x800000
c0de173a:	1624      	asrs	r4, r4, #24
c0de173c:	4541      	cmp	r1, r8
c0de173e:	bfc8      	it	gt
c0de1740:	2400      	movgt	r4, #0
c0de1742:	09c0      	lsrs	r0, r0, #7
c0de1744:	4368      	muls	r0, r5
c0de1746:	f500 0100 	add.w	r1, r0, #8388608	@ 0x800000
c0de174a:	0e09      	lsrs	r1, r1, #24
c0de174c:	4540      	cmp	r0, r8
c0de174e:	bf88      	it	hi
c0de1750:	2100      	movhi	r1, #0
c0de1752:	1a60      	subs	r0, r4, r1
c0de1754:	bf18      	it	ne
c0de1756:	2001      	movne	r0, #1
c0de1758:	f84e 0026 	str.w	r0, [lr, r6, lsl #2]
c0de175c:	4402      	add	r2, r0
c0de175e:	3601      	adds	r6, #1
c0de1760:	e7d5      	b.n	c0de170e <poly_make_hint_lowram+0x16>
c0de1762:	4610      	mov	r0, r2
c0de1764:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de1768:	2b7fffff 	.word	0x2b7fffff

c0de176c <unpack_sig_h_indices>:
c0de176c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de1770:	f503 6c12 	add.w	ip, r3, #2336	@ 0x920
c0de1774:	b142      	cbz	r2, c0de1788 <unpack_sig_h_indices+0x1c>
c0de1776:	eb02 0e0c 	add.w	lr, r2, ip
c0de177a:	f81e 6f50 	ldrb.w	r6, [lr, #80]!
c0de177e:	f81e 5c01 	ldrb.w	r5, [lr, #-1]
c0de1782:	42b5      	cmp	r5, r6
c0de1784:	d905      	bls.n	c0de1792 <unpack_sig_h_indices+0x26>
c0de1786:	e006      	b.n	c0de1796 <unpack_sig_h_indices+0x2a>
c0de1788:	f893 6970 	ldrb.w	r6, [r3, #2416]	@ 0x970
c0de178c:	f503 6e17 	add.w	lr, r3, #2416	@ 0x970
c0de1790:	2500      	movs	r5, #0
c0de1792:	2e50      	cmp	r6, #80	@ 0x50
c0de1794:	d902      	bls.n	c0de179c <unpack_sig_h_indices+0x30>
c0de1796:	2001      	movs	r0, #1
c0de1798:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de179c:	eb03 0805 	add.w	r8, r3, r5
c0de17a0:	2700      	movs	r7, #0
c0de17a2:	19ea      	adds	r2, r5, r7
c0de17a4:	42b2      	cmp	r2, r6
c0de17a6:	d20e      	bcs.n	c0de17c6 <unpack_sig_h_indices+0x5a>
c0de17a8:	eb08 0407 	add.w	r4, r8, r7
c0de17ac:	42aa      	cmp	r2, r5
c0de17ae:	f894 6920 	ldrb.w	r6, [r4, #2336]	@ 0x920
c0de17b2:	d903      	bls.n	c0de17bc <unpack_sig_h_indices+0x50>
c0de17b4:	f894 291f 	ldrb.w	r2, [r4, #2335]	@ 0x91f
c0de17b8:	4296      	cmp	r6, r2
c0de17ba:	d9ec      	bls.n	c0de1796 <unpack_sig_h_indices+0x2a>
c0de17bc:	55c6      	strb	r6, [r0, r7]
c0de17be:	3701      	adds	r7, #1
c0de17c0:	f89e 6000 	ldrb.w	r6, [lr]
c0de17c4:	e7ed      	b.n	c0de17a2 <unpack_sig_h_indices+0x36>
c0de17c6:	600f      	str	r7, [r1, #0]
c0de17c8:	f893 0973 	ldrb.w	r0, [r3, #2419]	@ 0x973
c0de17cc:	4601      	mov	r1, r0
c0de17ce:	284f      	cmp	r0, #79	@ 0x4f
c0de17d0:	d804      	bhi.n	c0de17dc <unpack_sig_h_indices+0x70>
c0de17d2:	f81c 2001 	ldrb.w	r2, [ip, r1]
c0de17d6:	1c48      	adds	r0, r1, #1
c0de17d8:	2a00      	cmp	r2, #0
c0de17da:	d0f7      	beq.n	c0de17cc <unpack_sig_h_indices+0x60>
c0de17dc:	2000      	movs	r0, #0
c0de17de:	2950      	cmp	r1, #80	@ 0x50
c0de17e0:	bf38      	it	cc
c0de17e2:	2001      	movcc	r0, #1
c0de17e4:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0de17e8 <poly_use_hint_lowram>:
c0de17e8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de17ec:	4698      	mov	r8, r3
c0de17ee:	4615      	mov	r5, r2
c0de17f0:	460e      	mov	r6, r1
c0de17f2:	4607      	mov	r7, r0
c0de17f4:	2400      	movs	r4, #0
c0de17f6:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de17fa:	bf08      	it	eq
c0de17fc:	e8bd 81f0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de1800:	4628      	mov	r0, r5
c0de1802:	4641      	mov	r1, r8
c0de1804:	b131      	cbz	r1, c0de1814 <poly_use_hint_lowram+0x2c>
c0de1806:	f810 2b01 	ldrb.w	r2, [r0], #1
c0de180a:	3901      	subs	r1, #1
c0de180c:	4294      	cmp	r4, r2
c0de180e:	d1f9      	bne.n	c0de1804 <poly_use_hint_lowram+0x1c>
c0de1810:	2101      	movs	r1, #1
c0de1812:	e000      	b.n	c0de1816 <poly_use_hint_lowram+0x2e>
c0de1814:	2100      	movs	r1, #0
c0de1816:	f856 0024 	ldr.w	r0, [r6, r4, lsl #2]
c0de181a:	f000 fc4b 	bl	c0de20b4 <pqcrystals_dilithium2_lowram_use_hint>
c0de181e:	f847 0024 	str.w	r0, [r7, r4, lsl #2]
c0de1822:	3401      	adds	r4, #1
c0de1824:	e7e7      	b.n	c0de17f6 <poly_use_hint_lowram+0xe>

c0de1826 <pack_pk_rho>:
c0de1826:	2200      	movs	r2, #0
c0de1828:	2a20      	cmp	r2, #32
c0de182a:	bf08      	it	eq
c0de182c:	4770      	bxeq	lr
c0de182e:	5c8b      	ldrb	r3, [r1, r2]
c0de1830:	5483      	strb	r3, [r0, r2]
c0de1832:	3201      	adds	r2, #1
c0de1834:	e7f8      	b.n	c0de1828 <pack_pk_rho+0x2>

c0de1836 <pack_pk_t1>:
c0de1836:	eb02 0282 	add.w	r2, r2, r2, lsl #2
c0de183a:	eb00 1082 	add.w	r0, r0, r2, lsl #6
c0de183e:	3020      	adds	r0, #32
c0de1840:	f000 bb06 	b.w	c0de1e50 <pqcrystals_dilithium2_lowram_polyt1_pack>

c0de1844 <pack_sk_s1>:
c0de1844:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de1848:	eb00 1042 	add.w	r0, r0, r2, lsl #5
c0de184c:	3080      	adds	r0, #128	@ 0x80
c0de184e:	f000 ba66 	b.w	c0de1d1e <pqcrystals_dilithium2_lowram_polyeta_pack>

c0de1852 <pack_sk_s2>:
c0de1852:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de1856:	eb00 1042 	add.w	r0, r0, r2, lsl #5
c0de185a:	f500 7000 	add.w	r0, r0, #512	@ 0x200
c0de185e:	f000 ba5e 	b.w	c0de1d1e <pqcrystals_dilithium2_lowram_polyeta_pack>

c0de1862 <pack_sk_t0>:
c0de1862:	f44f 73d0 	mov.w	r3, #416	@ 0x1a0
c0de1866:	fb02 0003 	mla	r0, r2, r3, r0
c0de186a:	f500 7060 	add.w	r0, r0, #896	@ 0x380
c0de186e:	f000 bb13 	b.w	c0de1e98 <pqcrystals_dilithium2_lowram_polyt0_pack>

c0de1872 <pack_sk_rho>:
c0de1872:	2200      	movs	r2, #0
c0de1874:	2a20      	cmp	r2, #32
c0de1876:	bf08      	it	eq
c0de1878:	4770      	bxeq	lr
c0de187a:	5c8b      	ldrb	r3, [r1, r2]
c0de187c:	5483      	strb	r3, [r0, r2]
c0de187e:	3201      	adds	r2, #1
c0de1880:	e7f8      	b.n	c0de1874 <pack_sk_rho+0x2>

c0de1882 <pack_sk_key>:
c0de1882:	3020      	adds	r0, #32
c0de1884:	2200      	movs	r2, #0
c0de1886:	2a20      	cmp	r2, #32
c0de1888:	bf08      	it	eq
c0de188a:	4770      	bxeq	lr
c0de188c:	5c8b      	ldrb	r3, [r1, r2]
c0de188e:	5483      	strb	r3, [r0, r2]
c0de1890:	3201      	adds	r2, #1
c0de1892:	e7f8      	b.n	c0de1886 <pack_sk_key+0x4>

c0de1894 <pack_sk_tr>:
c0de1894:	3040      	adds	r0, #64	@ 0x40
c0de1896:	2200      	movs	r2, #0
c0de1898:	2a40      	cmp	r2, #64	@ 0x40
c0de189a:	bf08      	it	eq
c0de189c:	4770      	bxeq	lr
c0de189e:	5c8b      	ldrb	r3, [r1, r2]
c0de18a0:	5483      	strb	r3, [r0, r2]
c0de18a2:	3201      	adds	r2, #1
c0de18a4:	e7f8      	b.n	c0de1898 <pack_sk_tr+0x4>

c0de18a6 <pqcrystals_dilithium2_lowram_poly_pointwise_acc_montgomery>:
c0de18a6:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de18a8:	4614      	mov	r4, r2
c0de18aa:	460d      	mov	r5, r1
c0de18ac:	4606      	mov	r6, r0
c0de18ae:	2700      	movs	r7, #0
c0de18b0:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de18b4:	bf08      	it	eq
c0de18b6:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de18b8:	f855 0027 	ldr.w	r0, [r5, r7, lsl #2]
c0de18bc:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
c0de18c0:	f000 f822 	bl	c0de1908 <OUTLINED_FUNCTION_3>
c0de18c4:	f856 1027 	ldr.w	r1, [r6, r7, lsl #2]
c0de18c8:	4408      	add	r0, r1
c0de18ca:	f846 0027 	str.w	r0, [r6, r7, lsl #2]
c0de18ce:	3701      	adds	r7, #1
c0de18d0:	e7ee      	b.n	c0de18b0 <pqcrystals_dilithium2_lowram_poly_pointwise_acc_montgomery+0xa>

c0de18d2 <OUTLINED_FUNCTION_0>:
c0de18d2:	1971      	adds	r1, r6, r5
c0de18d4:	5d70      	ldrb	r0, [r6, r5]
c0de18d6:	784a      	ldrb	r2, [r1, #1]
c0de18d8:	7889      	ldrb	r1, [r1, #2]
c0de18da:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de18de:	f001 017f 	and.w	r1, r1, #127	@ 0x7f
c0de18e2:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de18e6:	42a0      	cmp	r0, r4
c0de18e8:	4770      	bx	lr

c0de18ea <OUTLINED_FUNCTION_1>:
c0de18ea:	f857 1020 	ldr.w	r1, [r7, r0, lsl #2]
c0de18ee:	f854 2020 	ldr.w	r2, [r4, r0, lsl #2]
c0de18f2:	4411      	add	r1, r2
c0de18f4:	f845 1020 	str.w	r1, [r5, r0, lsl #2]
c0de18f8:	3001      	adds	r0, #1
c0de18fa:	4770      	bx	lr

c0de18fc <OUTLINED_FUNCTION_2>:
c0de18fc:	f815 0b01 	ldrb.w	r0, [r5], #1
c0de1900:	2100      	movs	r1, #0
c0de1902:	463a      	mov	r2, r7
c0de1904:	f009 bb08 	b.w	c0deaf18 <__aeabi_llsl>

c0de1908 <OUTLINED_FUNCTION_3>:
c0de1908:	fb81 0100 	smull	r0, r1, r1, r0
c0de190c:	f000 bb7a 	b.w	c0de2004 <pqcrystals_dilithium2_lowram_montgomery_reduce>

c0de1910 <OUTLINED_FUNCTION_4>:
c0de1910:	4601      	mov	r1, r0
c0de1912:	4658      	mov	r0, fp
c0de1914:	463a      	mov	r2, r7
c0de1916:	f7ff bdfc 	b.w	c0de1512 <polyw_add_idx>
	...

c0de191c <pqcrystals_dilithium2_lowram_ntt>:
c0de191c:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de1920:	4604      	mov	r4, r0
c0de1922:	4817      	ldr	r0, [pc, #92]	@ (c0de1980 <pqcrystals_dilithium2_lowram_ntt+0x64>)
c0de1924:	f04f 0880 	mov.w	r8, #128	@ 0x80
c0de1928:	f04f 0a00 	mov.w	sl, #0
c0de192c:	4478      	add	r0, pc
c0de192e:	9001      	str	r0, [sp, #4]
c0de1930:	f1b8 0f00 	cmp.w	r8, #0
c0de1934:	bf08      	it	eq
c0de1936:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de193a:	2700      	movs	r7, #0
c0de193c:	2fff      	cmp	r7, #255	@ 0xff
c0de193e:	d81c      	bhi.n	c0de197a <pqcrystals_dilithium2_lowram_ntt+0x5e>
c0de1940:	9801      	ldr	r0, [sp, #4]
c0de1942:	f10a 0a01 	add.w	sl, sl, #1
c0de1946:	eb07 0608 	add.w	r6, r7, r8
c0de194a:	4635      	mov	r5, r6
c0de194c:	f850 b02a 	ldr.w	fp, [r0, sl, lsl #2]
c0de1950:	42b7      	cmp	r7, r6
c0de1952:	d210      	bcs.n	c0de1976 <pqcrystals_dilithium2_lowram_ntt+0x5a>
c0de1954:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de1958:	fb80 010b 	smull	r0, r1, r0, fp
c0de195c:	f000 fb52 	bl	c0de2004 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de1960:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
c0de1964:	180a      	adds	r2, r1, r0
c0de1966:	1a08      	subs	r0, r1, r0
c0de1968:	f844 2027 	str.w	r2, [r4, r7, lsl #2]
c0de196c:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de1970:	3501      	adds	r5, #1
c0de1972:	3701      	adds	r7, #1
c0de1974:	e7ec      	b.n	c0de1950 <pqcrystals_dilithium2_lowram_ntt+0x34>
c0de1976:	462f      	mov	r7, r5
c0de1978:	e7e0      	b.n	c0de193c <pqcrystals_dilithium2_lowram_ntt+0x20>
c0de197a:	ea4f 0858 	mov.w	r8, r8, lsr #1
c0de197e:	e7d7      	b.n	c0de1930 <pqcrystals_dilithium2_lowram_ntt+0x14>
c0de1980:	0000c5cc 	.word	0x0000c5cc

c0de1984 <pqcrystals_dilithium2_lowram_invntt_tomont>:
c0de1984:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de1988:	4604      	mov	r4, r0
c0de198a:	4822      	ldr	r0, [pc, #136]	@ (c0de1a14 <pqcrystals_dilithium2_lowram_invntt_tomont+0x90>)
c0de198c:	f04f 0801 	mov.w	r8, #1
c0de1990:	f44f 7a80 	mov.w	sl, #256	@ 0x100
c0de1994:	4478      	add	r0, pc
c0de1996:	9001      	str	r0, [sp, #4]
c0de1998:	f1b8 0fff 	cmp.w	r8, #255	@ 0xff
c0de199c:	d828      	bhi.n	c0de19f0 <pqcrystals_dilithium2_lowram_invntt_tomont+0x6c>
c0de199e:	2700      	movs	r7, #0
c0de19a0:	2fff      	cmp	r7, #255	@ 0xff
c0de19a2:	d822      	bhi.n	c0de19ea <pqcrystals_dilithium2_lowram_invntt_tomont+0x66>
c0de19a4:	9801      	ldr	r0, [sp, #4]
c0de19a6:	f1aa 0a01 	sub.w	sl, sl, #1
c0de19aa:	eb07 0608 	add.w	r6, r7, r8
c0de19ae:	4635      	mov	r5, r6
c0de19b0:	f850 002a 	ldr.w	r0, [r0, sl, lsl #2]
c0de19b4:	f1c0 0b00 	rsb	fp, r0, #0
c0de19b8:	42b7      	cmp	r7, r6
c0de19ba:	d214      	bcs.n	c0de19e6 <pqcrystals_dilithium2_lowram_invntt_tomont+0x62>
c0de19bc:	f854 0027 	ldr.w	r0, [r4, r7, lsl #2]
c0de19c0:	f854 1025 	ldr.w	r1, [r4, r5, lsl #2]
c0de19c4:	4401      	add	r1, r0
c0de19c6:	f844 1027 	str.w	r1, [r4, r7, lsl #2]
c0de19ca:	f854 1025 	ldr.w	r1, [r4, r5, lsl #2]
c0de19ce:	1a40      	subs	r0, r0, r1
c0de19d0:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de19d4:	fb80 010b 	smull	r0, r1, r0, fp
c0de19d8:	f000 fb14 	bl	c0de2004 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de19dc:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de19e0:	3501      	adds	r5, #1
c0de19e2:	3701      	adds	r7, #1
c0de19e4:	e7e8      	b.n	c0de19b8 <pqcrystals_dilithium2_lowram_invntt_tomont+0x34>
c0de19e6:	462f      	mov	r7, r5
c0de19e8:	e7da      	b.n	c0de19a0 <pqcrystals_dilithium2_lowram_invntt_tomont+0x1c>
c0de19ea:	ea4f 0848 	mov.w	r8, r8, lsl #1
c0de19ee:	e7d3      	b.n	c0de1998 <pqcrystals_dilithium2_lowram_invntt_tomont+0x14>
c0de19f0:	2500      	movs	r5, #0
c0de19f2:	f24a 36fa 	movw	r6, #41978	@ 0xa3fa
c0de19f6:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
c0de19fa:	bf08      	it	eq
c0de19fc:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de1a00:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de1a04:	fb80 0106 	smull	r0, r1, r0, r6
c0de1a08:	f000 fafc 	bl	c0de2004 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de1a0c:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de1a10:	3501      	adds	r5, #1
c0de1a12:	e7f0      	b.n	c0de19f6 <pqcrystals_dilithium2_lowram_invntt_tomont+0x72>
c0de1a14:	0000c564 	.word	0x0000c564

c0de1a18 <pqcrystals_dilithium2_lowram_poly_reduce>:
c0de1a18:	b5b0      	push	{r4, r5, r7, lr}
c0de1a1a:	4604      	mov	r4, r0
c0de1a1c:	2500      	movs	r5, #0
c0de1a1e:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
c0de1a22:	bf08      	it	eq
c0de1a24:	bdb0      	popeq	{r4, r5, r7, pc}
c0de1a26:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de1a2a:	f000 faf7 	bl	c0de201c <pqcrystals_dilithium2_lowram_reduce32>
c0de1a2e:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de1a32:	3501      	adds	r5, #1
c0de1a34:	e7f3      	b.n	c0de1a1e <pqcrystals_dilithium2_lowram_poly_reduce+0x6>

c0de1a36 <pqcrystals_dilithium2_lowram_poly_caddq>:
c0de1a36:	b5b0      	push	{r4, r5, r7, lr}
c0de1a38:	4604      	mov	r4, r0
c0de1a3a:	2500      	movs	r5, #0
c0de1a3c:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
c0de1a40:	bf08      	it	eq
c0de1a42:	bdb0      	popeq	{r4, r5, r7, pc}
c0de1a44:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de1a48:	f000 faf2 	bl	c0de2030 <pqcrystals_dilithium2_lowram_caddq>
c0de1a4c:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de1a50:	3501      	adds	r5, #1
c0de1a52:	e7f3      	b.n	c0de1a3c <pqcrystals_dilithium2_lowram_poly_caddq+0x6>

c0de1a54 <pqcrystals_dilithium2_lowram_poly_add>:
c0de1a54:	b5b0      	push	{r4, r5, r7, lr}
c0de1a56:	2300      	movs	r3, #0
c0de1a58:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
c0de1a5c:	bf08      	it	eq
c0de1a5e:	bdb0      	popeq	{r4, r5, r7, pc}
c0de1a60:	f851 4023 	ldr.w	r4, [r1, r3, lsl #2]
c0de1a64:	f852 5023 	ldr.w	r5, [r2, r3, lsl #2]
c0de1a68:	442c      	add	r4, r5
c0de1a6a:	f840 4023 	str.w	r4, [r0, r3, lsl #2]
c0de1a6e:	3301      	adds	r3, #1
c0de1a70:	e7f2      	b.n	c0de1a58 <pqcrystals_dilithium2_lowram_poly_add+0x4>

c0de1a72 <pqcrystals_dilithium2_lowram_poly_ntt>:
c0de1a72:	f7ff bf53 	b.w	c0de191c <pqcrystals_dilithium2_lowram_ntt>

c0de1a76 <pqcrystals_dilithium2_lowram_poly_invntt_tomont>:
c0de1a76:	f7ff bf85 	b.w	c0de1984 <pqcrystals_dilithium2_lowram_invntt_tomont>

c0de1a7a <pqcrystals_dilithium2_lowram_poly_pointwise_montgomery>:
c0de1a7a:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de1a7c:	f000 fab5 	bl	c0de1fea <OUTLINED_FUNCTION_0>
c0de1a80:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de1a84:	bf08      	it	eq
c0de1a86:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de1a88:	f855 0027 	ldr.w	r0, [r5, r7, lsl #2]
c0de1a8c:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
c0de1a90:	fb81 0100 	smull	r0, r1, r1, r0
c0de1a94:	f000 fab6 	bl	c0de2004 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de1a98:	f846 0027 	str.w	r0, [r6, r7, lsl #2]
c0de1a9c:	3701      	adds	r7, #1
c0de1a9e:	e7ef      	b.n	c0de1a80 <pqcrystals_dilithium2_lowram_poly_pointwise_montgomery+0x6>

c0de1aa0 <pqcrystals_dilithium2_lowram_poly_power2round>:
c0de1aa0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de1aa2:	f000 faa2 	bl	c0de1fea <OUTLINED_FUNCTION_0>
c0de1aa6:	f5b7 6f80 	cmp.w	r7, #1024	@ 0x400
c0de1aaa:	bf08      	it	eq
c0de1aac:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de1aae:	59e1      	ldr	r1, [r4, r7]
c0de1ab0:	19e8      	adds	r0, r5, r7
c0de1ab2:	f000 fad5 	bl	c0de2060 <pqcrystals_dilithium2_lowram_power2round>
c0de1ab6:	51f0      	str	r0, [r6, r7]
c0de1ab8:	3704      	adds	r7, #4
c0de1aba:	e7f4      	b.n	c0de1aa6 <pqcrystals_dilithium2_lowram_poly_power2round+0x6>

c0de1abc <pqcrystals_dilithium2_lowram_poly_chknorm>:
c0de1abc:	4a09      	ldr	r2, [pc, #36]	@ (c0de1ae4 <pqcrystals_dilithium2_lowram_poly_chknorm+0x28>)
c0de1abe:	4291      	cmp	r1, r2
c0de1ac0:	dc0e      	bgt.n	c0de1ae0 <pqcrystals_dilithium2_lowram_poly_chknorm+0x24>
c0de1ac2:	2200      	movs	r2, #0
c0de1ac4:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de1ac8:	bf04      	itt	eq
c0de1aca:	2000      	moveq	r0, #0
c0de1acc:	4770      	bxeq	lr
c0de1ace:	f850 3022 	ldr.w	r3, [r0, r2, lsl #2]
c0de1ad2:	2b00      	cmp	r3, #0
c0de1ad4:	bf48      	it	mi
c0de1ad6:	eba3 0343 	submi.w	r3, r3, r3, lsl #1
c0de1ada:	3201      	adds	r2, #1
c0de1adc:	428b      	cmp	r3, r1
c0de1ade:	dbf1      	blt.n	c0de1ac4 <pqcrystals_dilithium2_lowram_poly_chknorm+0x8>
c0de1ae0:	2001      	movs	r0, #1
c0de1ae2:	4770      	bx	lr
c0de1ae4:	000ffc00 	.word	0x000ffc00

c0de1ae8 <pqcrystals_dilithium2_lowram_poly_uniform>:
c0de1ae8:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1aec:	f5ad 6daa 	sub.w	sp, sp, #1360	@ 0x550
c0de1af0:	46e8      	mov	r8, sp
c0de1af2:	4683      	mov	fp, r0
c0de1af4:	460d      	mov	r5, r1
c0de1af6:	f8ad 254e 	strh.w	r2, [sp, #1358]	@ 0x54e
c0de1afa:	4640      	mov	r0, r8
c0de1afc:	f7ff f9b0 	bl	c0de0e60 <inner_keccak256_init>
c0de1b00:	4640      	mov	r0, r8
c0de1b02:	4629      	mov	r1, r5
c0de1b04:	2220      	movs	r2, #32
c0de1b06:	f7ff f9bc 	bl	c0de0e82 <inner_keccak256_inject>
c0de1b0a:	f20d 514e 	addw	r1, sp, #1358	@ 0x54e
c0de1b0e:	4640      	mov	r0, r8
c0de1b10:	2202      	movs	r2, #2
c0de1b12:	f7ff f9b6 	bl	c0de0e82 <inner_keccak256_inject>
c0de1b16:	4640      	mov	r0, r8
c0de1b18:	f7ff f9c5 	bl	c0de0ea6 <inner_keccak256_flip>
c0de1b1c:	ae81      	add	r6, sp, #516	@ 0x204
c0de1b1e:	4640      	mov	r0, r8
c0de1b20:	f44f 7252 	mov.w	r2, #840	@ 0x348
c0de1b24:	f44f 7752 	mov.w	r7, #840	@ 0x348
c0de1b28:	4631      	mov	r1, r6
c0de1b2a:	f7ff f9d2 	bl	c0de0ed2 <inner_keccak256_extract>
c0de1b2e:	4658      	mov	r0, fp
c0de1b30:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de1b34:	4632      	mov	r2, r6
c0de1b36:	f44f 7352 	mov.w	r3, #840	@ 0x348
c0de1b3a:	f000 f827 	bl	c0de1b8c <rej_uniform>
c0de1b3e:	4605      	mov	r5, r0
c0de1b40:	f04f 0a03 	mov.w	sl, #3
c0de1b44:	2dff      	cmp	r5, #255	@ 0xff
c0de1b46:	d81d      	bhi.n	c0de1b84 <pqcrystals_dilithium2_lowram_poly_uniform+0x9c>
c0de1b48:	fbb7 f0fa 	udiv	r0, r7, sl
c0de1b4c:	4631      	mov	r1, r6
c0de1b4e:	eb00 0040 	add.w	r0, r0, r0, lsl #1
c0de1b52:	1a3c      	subs	r4, r7, r0
c0de1b54:	42b8      	cmp	r0, r7
c0de1b56:	d004      	beq.n	c0de1b62 <pqcrystals_dilithium2_lowram_poly_uniform+0x7a>
c0de1b58:	5c0a      	ldrb	r2, [r1, r0]
c0de1b5a:	3f01      	subs	r7, #1
c0de1b5c:	700a      	strb	r2, [r1, #0]
c0de1b5e:	3101      	adds	r1, #1
c0de1b60:	e7f8      	b.n	c0de1b54 <pqcrystals_dilithium2_lowram_poly_uniform+0x6c>
c0de1b62:	1931      	adds	r1, r6, r4
c0de1b64:	4640      	mov	r0, r8
c0de1b66:	22a8      	movs	r2, #168	@ 0xa8
c0de1b68:	f7ff f9b3 	bl	c0de0ed2 <inner_keccak256_extract>
c0de1b6c:	f044 07a8 	orr.w	r7, r4, #168	@ 0xa8
c0de1b70:	eb0b 0085 	add.w	r0, fp, r5, lsl #2
c0de1b74:	f5c5 7180 	rsb	r1, r5, #256	@ 0x100
c0de1b78:	4632      	mov	r2, r6
c0de1b7a:	463b      	mov	r3, r7
c0de1b7c:	f000 f806 	bl	c0de1b8c <rej_uniform>
c0de1b80:	4405      	add	r5, r0
c0de1b82:	e7df      	b.n	c0de1b44 <pqcrystals_dilithium2_lowram_poly_uniform+0x5c>
c0de1b84:	f50d 6daa 	add.w	sp, sp, #1360	@ 0x550
c0de1b88:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de1b8c <rej_uniform>:
c0de1b8c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de1b8e:	4c0f      	ldr	r4, [pc, #60]	@ (c0de1bcc <rej_uniform+0x40>)
c0de1b90:	4684      	mov	ip, r0
c0de1b92:	2000      	movs	r0, #0
c0de1b94:	2700      	movs	r7, #0
c0de1b96:	46a6      	mov	lr, r4
c0de1b98:	4288      	cmp	r0, r1
c0de1b9a:	d215      	bcs.n	c0de1bc8 <rej_uniform+0x3c>
c0de1b9c:	1cfe      	adds	r6, r7, #3
c0de1b9e:	429e      	cmp	r6, r3
c0de1ba0:	d812      	bhi.n	c0de1bc8 <rej_uniform+0x3c>
c0de1ba2:	5dd4      	ldrb	r4, [r2, r7]
c0de1ba4:	4417      	add	r7, r2
c0de1ba6:	787d      	ldrb	r5, [r7, #1]
c0de1ba8:	78bf      	ldrb	r7, [r7, #2]
c0de1baa:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de1bae:	f007 057f 	and.w	r5, r7, #127	@ 0x7f
c0de1bb2:	4637      	mov	r7, r6
c0de1bb4:	ea44 4405 	orr.w	r4, r4, r5, lsl #16
c0de1bb8:	4675      	mov	r5, lr
c0de1bba:	4574      	cmp	r4, lr
c0de1bbc:	d8ec      	bhi.n	c0de1b98 <rej_uniform+0xc>
c0de1bbe:	f84c 4020 	str.w	r4, [ip, r0, lsl #2]
c0de1bc2:	3001      	adds	r0, #1
c0de1bc4:	4637      	mov	r7, r6
c0de1bc6:	e7e7      	b.n	c0de1b98 <rej_uniform+0xc>
c0de1bc8:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de1bca:	bf00      	nop
c0de1bcc:	007fe000 	.word	0x007fe000

c0de1bd0 <pqcrystals_dilithium2_lowram_poly_uniform_eta>:
c0de1bd0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1bd4:	f5ad 7d0a 	sub.w	sp, sp, #552	@ 0x228
c0de1bd8:	f8ad 2226 	strh.w	r2, [sp, #550]	@ 0x226
c0de1bdc:	ac08      	add	r4, sp, #32
c0de1bde:	4682      	mov	sl, r0
c0de1be0:	460e      	mov	r6, r1
c0de1be2:	4620      	mov	r0, r4
c0de1be4:	f7ff f93c 	bl	c0de0e60 <inner_keccak256_init>
c0de1be8:	4620      	mov	r0, r4
c0de1bea:	4631      	mov	r1, r6
c0de1bec:	2240      	movs	r2, #64	@ 0x40
c0de1bee:	f7ff f948 	bl	c0de0e82 <inner_keccak256_inject>
c0de1bf2:	f20d 2126 	addw	r1, sp, #550	@ 0x226
c0de1bf6:	4620      	mov	r0, r4
c0de1bf8:	2202      	movs	r2, #2
c0de1bfa:	f7ff f942 	bl	c0de0e82 <inner_keccak256_inject>
c0de1bfe:	4620      	mov	r0, r4
c0de1c00:	f7ff f951 	bl	c0de0ea6 <inner_keccak256_flip>
c0de1c04:	f04f 0b00 	mov.w	fp, #0
c0de1c08:	466e      	mov	r6, sp
c0de1c0a:	f04f 08cd 	mov.w	r8, #205	@ 0xcd
c0de1c0e:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de1c12:	d830      	bhi.n	c0de1c76 <pqcrystals_dilithium2_lowram_poly_uniform_eta+0xa6>
c0de1c14:	a808      	add	r0, sp, #32
c0de1c16:	4631      	mov	r1, r6
c0de1c18:	2220      	movs	r2, #32
c0de1c1a:	f7ff f95a 	bl	c0de0ed2 <inner_keccak256_extract>
c0de1c1e:	eb0a 008b 	add.w	r0, sl, fp, lsl #2
c0de1c22:	f5cb 7280 	rsb	r2, fp, #256	@ 0x100
c0de1c26:	2100      	movs	r1, #0
c0de1c28:	2300      	movs	r3, #0
c0de1c2a:	4291      	cmp	r1, r2
c0de1c2c:	d221      	bcs.n	c0de1c72 <pqcrystals_dilithium2_lowram_poly_uniform_eta+0xa2>
c0de1c2e:	2b1f      	cmp	r3, #31
c0de1c30:	d81f      	bhi.n	c0de1c72 <pqcrystals_dilithium2_lowram_poly_uniform_eta+0xa2>
c0de1c32:	5cf4      	ldrb	r4, [r6, r3]
c0de1c34:	f004 070f 	and.w	r7, r4, #15
c0de1c38:	2f0f      	cmp	r7, #15
c0de1c3a:	d009      	beq.n	c0de1c50 <pqcrystals_dilithium2_lowram_poly_uniform_eta+0x80>
c0de1c3c:	fb07 f508 	mul.w	r5, r7, r8
c0de1c40:	0aad      	lsrs	r5, r5, #10
c0de1c42:	eb05 0585 	add.w	r5, r5, r5, lsl #2
c0de1c46:	1bed      	subs	r5, r5, r7
c0de1c48:	3502      	adds	r5, #2
c0de1c4a:	f840 5021 	str.w	r5, [r0, r1, lsl #2]
c0de1c4e:	3101      	adds	r1, #1
c0de1c50:	0924      	lsrs	r4, r4, #4
c0de1c52:	2c0f      	cmp	r4, #15
c0de1c54:	d00b      	beq.n	c0de1c6e <pqcrystals_dilithium2_lowram_poly_uniform_eta+0x9e>
c0de1c56:	4291      	cmp	r1, r2
c0de1c58:	d209      	bcs.n	c0de1c6e <pqcrystals_dilithium2_lowram_poly_uniform_eta+0x9e>
c0de1c5a:	fb04 f508 	mul.w	r5, r4, r8
c0de1c5e:	0aad      	lsrs	r5, r5, #10
c0de1c60:	eb05 0585 	add.w	r5, r5, r5, lsl #2
c0de1c64:	1b2c      	subs	r4, r5, r4
c0de1c66:	3402      	adds	r4, #2
c0de1c68:	f840 4021 	str.w	r4, [r0, r1, lsl #2]
c0de1c6c:	3101      	adds	r1, #1
c0de1c6e:	3301      	adds	r3, #1
c0de1c70:	e7db      	b.n	c0de1c2a <pqcrystals_dilithium2_lowram_poly_uniform_eta+0x5a>
c0de1c72:	448b      	add	fp, r1
c0de1c74:	e7cb      	b.n	c0de1c0e <pqcrystals_dilithium2_lowram_poly_uniform_eta+0x3e>
c0de1c76:	f50d 7d0a 	add.w	sp, sp, #552	@ 0x228
c0de1c7a:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de1c7e <pqcrystals_dilithium2_lowram_polyz_unpack>:
c0de1c7e:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de1c80:	3008      	adds	r0, #8
c0de1c82:	f04f 0c00 	mov.w	ip, #0
c0de1c86:	f5bc 7f10 	cmp.w	ip, #576	@ 0x240
c0de1c8a:	bf08      	it	eq
c0de1c8c:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de1c8e:	f811 300c 	ldrb.w	r3, [r1, ip]
c0de1c92:	eb01 040c 	add.w	r4, r1, ip
c0de1c96:	f10c 0c09 	add.w	ip, ip, #9
c0de1c9a:	f840 3c08 	str.w	r3, [r0, #-8]
c0de1c9e:	7865      	ldrb	r5, [r4, #1]
c0de1ca0:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0de1ca4:	f840 3c08 	str.w	r3, [r0, #-8]
c0de1ca8:	78a5      	ldrb	r5, [r4, #2]
c0de1caa:	f365 4311 	bfi	r3, r5, #16, #2
c0de1cae:	f840 3c08 	str.w	r3, [r0, #-8]
c0de1cb2:	f5c3 3300 	rsb	r3, r3, #131072	@ 0x20000
c0de1cb6:	78a5      	ldrb	r5, [r4, #2]
c0de1cb8:	08ae      	lsrs	r6, r5, #2
c0de1cba:	f840 6c04 	str.w	r6, [r0, #-4]
c0de1cbe:	78e6      	ldrb	r6, [r4, #3]
c0de1cc0:	01b6      	lsls	r6, r6, #6
c0de1cc2:	ea46 0595 	orr.w	r5, r6, r5, lsr #2
c0de1cc6:	f840 5c04 	str.w	r5, [r0, #-4]
c0de1cca:	7926      	ldrb	r6, [r4, #4]
c0de1ccc:	f366 3591 	bfi	r5, r6, #14, #4
c0de1cd0:	f840 5c04 	str.w	r5, [r0, #-4]
c0de1cd4:	f5c5 3500 	rsb	r5, r5, #131072	@ 0x20000
c0de1cd8:	7926      	ldrb	r6, [r4, #4]
c0de1cda:	0937      	lsrs	r7, r6, #4
c0de1cdc:	6007      	str	r7, [r0, #0]
c0de1cde:	7967      	ldrb	r7, [r4, #5]
c0de1ce0:	013f      	lsls	r7, r7, #4
c0de1ce2:	ea47 1616 	orr.w	r6, r7, r6, lsr #4
c0de1ce6:	6006      	str	r6, [r0, #0]
c0de1ce8:	79a7      	ldrb	r7, [r4, #6]
c0de1cea:	f367 3611 	bfi	r6, r7, #12, #6
c0de1cee:	6006      	str	r6, [r0, #0]
c0de1cf0:	f5c6 3600 	rsb	r6, r6, #131072	@ 0x20000
c0de1cf4:	79a7      	ldrb	r7, [r4, #6]
c0de1cf6:	09ba      	lsrs	r2, r7, #6
c0de1cf8:	6042      	str	r2, [r0, #4]
c0de1cfa:	79e2      	ldrb	r2, [r4, #7]
c0de1cfc:	0092      	lsls	r2, r2, #2
c0de1cfe:	ea42 1297 	orr.w	r2, r2, r7, lsr #6
c0de1d02:	6042      	str	r2, [r0, #4]
c0de1d04:	7a24      	ldrb	r4, [r4, #8]
c0de1d06:	6006      	str	r6, [r0, #0]
c0de1d08:	f840 5c04 	str.w	r5, [r0, #-4]
c0de1d0c:	f840 3c08 	str.w	r3, [r0, #-8]
c0de1d10:	ea42 2284 	orr.w	r2, r2, r4, lsl #10
c0de1d14:	f5c2 3200 	rsb	r2, r2, #131072	@ 0x20000
c0de1d18:	6042      	str	r2, [r0, #4]
c0de1d1a:	3010      	adds	r0, #16
c0de1d1c:	e7b3      	b.n	c0de1c86 <pqcrystals_dilithium2_lowram_polyz_unpack+0x8>

c0de1d1e <pqcrystals_dilithium2_lowram_polyeta_pack>:
c0de1d1e:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1d22:	3001      	adds	r0, #1
c0de1d24:	2200      	movs	r2, #0
c0de1d26:	2640      	movs	r6, #64	@ 0x40
c0de1d28:	f5b2 6f80 	cmp.w	r2, #1024	@ 0x400
c0de1d2c:	bf08      	it	eq
c0de1d2e:	e8bd 8df0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de1d32:	188b      	adds	r3, r1, r2
c0de1d34:	f851 8002 	ldr.w	r8, [r1, r2]
c0de1d38:	2710      	movs	r7, #16
c0de1d3a:	3220      	adds	r2, #32
c0de1d3c:	f103 0b04 	add.w	fp, r3, #4
c0de1d40:	f103 0e10 	add.w	lr, r3, #16
c0de1d44:	69db      	ldr	r3, [r3, #28]
c0de1d46:	e89b 0830 	ldmia.w	fp, {r4, r5, fp}
c0de1d4a:	e89e 5400 	ldmia.w	lr, {sl, ip, lr}
c0de1d4e:	f1c5 0502 	rsb	r5, r5, #2
c0de1d52:	eba6 1343 	sub.w	r3, r6, r3, lsl #5
c0de1d56:	eba7 04c4 	sub.w	r4, r7, r4, lsl #3
c0de1d5a:	f1c8 0702 	rsb	r7, r8, #2
c0de1d5e:	b2ed      	uxtb	r5, r5
c0de1d60:	433c      	orrs	r4, r7
c0de1d62:	f1cc 0702 	rsb	r7, ip, #2
c0de1d66:	ea44 1485 	orr.w	r4, r4, r5, lsl #6
c0de1d6a:	b2ff      	uxtb	r7, r7
c0de1d6c:	f800 4c01 	strb.w	r4, [r0, #-1]
c0de1d70:	2408      	movs	r4, #8
c0de1d72:	eba4 048e 	sub.w	r4, r4, lr, lsl #2
c0de1d76:	ea44 0457 	orr.w	r4, r4, r7, lsr #1
c0de1d7a:	4323      	orrs	r3, r4
c0de1d7c:	2420      	movs	r4, #32
c0de1d7e:	7043      	strb	r3, [r0, #1]
c0de1d80:	2304      	movs	r3, #4
c0de1d82:	eba4 140a 	sub.w	r4, r4, sl, lsl #4
c0de1d86:	eba3 034b 	sub.w	r3, r3, fp, lsl #1
c0de1d8a:	ea43 0395 	orr.w	r3, r3, r5, lsr #2
c0de1d8e:	4323      	orrs	r3, r4
c0de1d90:	ea43 13c7 	orr.w	r3, r3, r7, lsl #7
c0de1d94:	f800 3b03 	strb.w	r3, [r0], #3
c0de1d98:	e7c6      	b.n	c0de1d28 <pqcrystals_dilithium2_lowram_polyeta_pack+0xa>

c0de1d9a <pqcrystals_dilithium2_lowram_poly_challenge_eth>:
c0de1d9a:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1d9e:	f5ad 7d10 	sub.w	sp, sp, #576	@ 0x240
c0de1da2:	466e      	mov	r6, sp
c0de1da4:	4680      	mov	r8, r0
c0de1da6:	460d      	mov	r5, r1
c0de1da8:	4630      	mov	r0, r6
c0de1daa:	f7ff f859 	bl	c0de0e60 <inner_keccak256_init>
c0de1dae:	4630      	mov	r0, r6
c0de1db0:	4629      	mov	r1, r5
c0de1db2:	2220      	movs	r2, #32
c0de1db4:	f7ff f865 	bl	c0de0e82 <inner_keccak256_inject>
c0de1db8:	4630      	mov	r0, r6
c0de1dba:	f7ff f874 	bl	c0de0ea6 <inner_keccak256_flip>
c0de1dbe:	ad80      	add	r5, sp, #512	@ 0x200
c0de1dc0:	4630      	mov	r0, r6
c0de1dc2:	2208      	movs	r2, #8
c0de1dc4:	4629      	mov	r1, r5
c0de1dc6:	f7ff f884 	bl	c0de0ed2 <inner_keccak256_extract>
c0de1dca:	2600      	movs	r6, #0
c0de1dcc:	462c      	mov	r4, r5
c0de1dce:	f04f 0b00 	mov.w	fp, #0
c0de1dd2:	f04f 0a00 	mov.w	sl, #0
c0de1dd6:	2e40      	cmp	r6, #64	@ 0x40
c0de1dd8:	d007      	beq.n	c0de1dea <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x50>
c0de1dda:	f000 f90b 	bl	c0de1ff4 <OUTLINED_FUNCTION_1>
c0de1dde:	ea4a 0a01 	orr.w	sl, sl, r1
c0de1de2:	ea4b 0b00 	orr.w	fp, fp, r0
c0de1de6:	3608      	adds	r6, #8
c0de1de8:	e7f5      	b.n	c0de1dd6 <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x3c>
c0de1dea:	2000      	movs	r0, #0
c0de1dec:	2100      	movs	r1, #0
c0de1dee:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de1df2:	d003      	beq.n	c0de1dfc <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x62>
c0de1df4:	f848 0021 	str.w	r0, [r8, r1, lsl #2]
c0de1df8:	3101      	adds	r1, #1
c0de1dfa:	e7f8      	b.n	c0de1dee <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x54>
c0de1dfc:	2000      	movs	r0, #0
c0de1dfe:	24d9      	movs	r4, #217	@ 0xd9
c0de1e00:	466e      	mov	r6, sp
c0de1e02:	2700      	movs	r7, #0
c0de1e04:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de1e08:	d01e      	beq.n	c0de1e48 <pqcrystals_dilithium2_lowram_poly_challenge_eth+0xae>
c0de1e0a:	42b8      	cmp	r0, r7
c0de1e0c:	d306      	bcc.n	c0de1e1c <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x82>
c0de1e0e:	4630      	mov	r0, r6
c0de1e10:	4629      	mov	r1, r5
c0de1e12:	2240      	movs	r2, #64	@ 0x40
c0de1e14:	2740      	movs	r7, #64	@ 0x40
c0de1e16:	f7ff f85c 	bl	c0de0ed2 <inner_keccak256_extract>
c0de1e1a:	2000      	movs	r0, #0
c0de1e1c:	5c29      	ldrb	r1, [r5, r0]
c0de1e1e:	3001      	adds	r0, #1
c0de1e20:	428c      	cmp	r4, r1
c0de1e22:	d3f2      	bcc.n	c0de1e0a <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x70>
c0de1e24:	f858 2021 	ldr.w	r2, [r8, r1, lsl #2]
c0de1e28:	f848 2024 	str.w	r2, [r8, r4, lsl #2]
c0de1e2c:	ea5f 72cb 	movs.w	r2, fp, lsl #31
c0de1e30:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
c0de1e34:	bf08      	it	eq
c0de1e36:	2201      	moveq	r2, #1
c0de1e38:	ea5f 0a5a 	movs.w	sl, sl, lsr #1
c0de1e3c:	f848 2021 	str.w	r2, [r8, r1, lsl #2]
c0de1e40:	ea4f 0b3b 	mov.w	fp, fp, rrx
c0de1e44:	3401      	adds	r4, #1
c0de1e46:	e7dd      	b.n	c0de1e04 <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x6a>
c0de1e48:	f50d 7d10 	add.w	sp, sp, #576	@ 0x240
c0de1e4c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de1e50 <pqcrystals_dilithium2_lowram_polyt1_pack>:
c0de1e50:	b5b0      	push	{r4, r5, r7, lr}
c0de1e52:	3108      	adds	r1, #8
c0de1e54:	2200      	movs	r2, #0
c0de1e56:	f5b2 7fa0 	cmp.w	r2, #320	@ 0x140
c0de1e5a:	bf08      	it	eq
c0de1e5c:	bdb0      	popeq	{r4, r5, r7, pc}
c0de1e5e:	f851 3c08 	ldr.w	r3, [r1, #-8]
c0de1e62:	5483      	strb	r3, [r0, r2]
c0de1e64:	1883      	adds	r3, r0, r2
c0de1e66:	3205      	adds	r2, #5
c0de1e68:	e951 4502 	ldrd	r4, r5, [r1, #-8]
c0de1e6c:	00ad      	lsls	r5, r5, #2
c0de1e6e:	ea45 2414 	orr.w	r4, r5, r4, lsr #8
c0de1e72:	705c      	strb	r4, [r3, #1]
c0de1e74:	680d      	ldr	r5, [r1, #0]
c0de1e76:	f851 4c04 	ldr.w	r4, [r1, #-4]
c0de1e7a:	012d      	lsls	r5, r5, #4
c0de1e7c:	ea45 1494 	orr.w	r4, r5, r4, lsr #6
c0de1e80:	709c      	strb	r4, [r3, #2]
c0de1e82:	e9d1 4500 	ldrd	r4, r5, [r1]
c0de1e86:	01ad      	lsls	r5, r5, #6
c0de1e88:	ea45 1414 	orr.w	r4, r5, r4, lsr #4
c0de1e8c:	70dc      	strb	r4, [r3, #3]
c0de1e8e:	684c      	ldr	r4, [r1, #4]
c0de1e90:	3110      	adds	r1, #16
c0de1e92:	08a4      	lsrs	r4, r4, #2
c0de1e94:	711c      	strb	r4, [r3, #4]
c0de1e96:	e7de      	b.n	c0de1e56 <pqcrystals_dilithium2_lowram_polyt1_pack+0x6>

c0de1e98 <pqcrystals_dilithium2_lowram_polyt0_pack>:
c0de1e98:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de1e9c:	311c      	adds	r1, #28
c0de1e9e:	f04f 0c00 	mov.w	ip, #0
c0de1ea2:	9000      	str	r0, [sp, #0]
c0de1ea4:	f5bc 7fd0 	cmp.w	ip, #416	@ 0x1a0
c0de1ea8:	bf08      	it	eq
c0de1eaa:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de1eae:	f851 0c14 	ldr.w	r0, [r1, #-20]
c0de1eb2:	e951 a504 	ldrd	sl, r5, [r1, #-16]
c0de1eb6:	e951 3807 	ldrd	r3, r8, [r1, #-28]
c0de1eba:	e951 e602 	ldrd	lr, r6, [r1, #-8]
c0de1ebe:	f851 7b20 	ldr.w	r7, [r1], #32
c0de1ec2:	9001      	str	r0, [sp, #4]
c0de1ec4:	9800      	ldr	r0, [sp, #0]
c0de1ec6:	f5c7 5780 	rsb	r7, r7, #4096	@ 0x1000
c0de1eca:	f5c3 5b80 	rsb	fp, r3, #4096	@ 0x1000
c0de1ece:	f5c5 5580 	rsb	r5, r5, #4096	@ 0x1000
c0de1ed2:	097b      	lsrs	r3, r7, #5
c0de1ed4:	eb00 040c 	add.w	r4, r0, ip
c0de1ed8:	f800 b00c 	strb.w	fp, [r0, ip]
c0de1edc:	f10c 0c0d 	add.w	ip, ip, #13
c0de1ee0:	7323      	strb	r3, [r4, #12]
c0de1ee2:	f5c6 5380 	rsb	r3, r6, #4096	@ 0x1000
c0de1ee6:	089e      	lsrs	r6, r3, #2
c0de1ee8:	72a6      	strb	r6, [r4, #10]
c0de1eea:	092e      	lsrs	r6, r5, #4
c0de1eec:	71e6      	strb	r6, [r4, #7]
c0de1eee:	f5ca 5680 	rsb	r6, sl, #4096	@ 0x1000
c0de1ef2:	0872      	lsrs	r2, r6, #1
c0de1ef4:	7162      	strb	r2, [r4, #5]
c0de1ef6:	f5c8 5280 	rsb	r2, r8, #4096	@ 0x1000
c0de1efa:	08d0      	lsrs	r0, r2, #3
c0de1efc:	70a0      	strb	r0, [r4, #2]
c0de1efe:	00f8      	lsls	r0, r7, #3
c0de1f00:	ea40 2093 	orr.w	r0, r0, r3, lsr #10
c0de1f04:	019b      	lsls	r3, r3, #6
c0de1f06:	72e0      	strb	r0, [r4, #11]
c0de1f08:	f5ce 5080 	rsb	r0, lr, #4096	@ 0x1000
c0de1f0c:	ea43 13d0 	orr.w	r3, r3, r0, lsr #7
c0de1f10:	0040      	lsls	r0, r0, #1
c0de1f12:	ea40 3015 	orr.w	r0, r0, r5, lsr #12
c0de1f16:	7263      	strb	r3, [r4, #9]
c0de1f18:	01f3      	lsls	r3, r6, #7
c0de1f1a:	7220      	strb	r0, [r4, #8]
c0de1f1c:	0128      	lsls	r0, r5, #4
c0de1f1e:	ea40 2056 	orr.w	r0, r0, r6, lsr #9
c0de1f22:	71a0      	strb	r0, [r4, #6]
c0de1f24:	9801      	ldr	r0, [sp, #4]
c0de1f26:	f5c0 5080 	rsb	r0, r0, #4096	@ 0x1000
c0de1f2a:	ea43 1390 	orr.w	r3, r3, r0, lsr #6
c0de1f2e:	0080      	lsls	r0, r0, #2
c0de1f30:	ea40 20d2 	orr.w	r0, r0, r2, lsr #11
c0de1f34:	7123      	strb	r3, [r4, #4]
c0de1f36:	70e0      	strb	r0, [r4, #3]
c0de1f38:	0150      	lsls	r0, r2, #5
c0de1f3a:	ea40 201b 	orr.w	r0, r0, fp, lsr #8
c0de1f3e:	7060      	strb	r0, [r4, #1]
c0de1f40:	e7b0      	b.n	c0de1ea4 <pqcrystals_dilithium2_lowram_polyt0_pack+0xc>

c0de1f42 <pqcrystals_dilithium2_lowram_polyz_pack>:
c0de1f42:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de1f44:	3108      	adds	r1, #8
c0de1f46:	f04f 0e00 	mov.w	lr, #0
c0de1f4a:	f5be 7f10 	cmp.w	lr, #576	@ 0x240
c0de1f4e:	bf08      	it	eq
c0de1f50:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de1f52:	e951 3c02 	ldrd	r3, ip, [r1, #-8]
c0de1f56:	e8f1 5604 	ldrd	r5, r6, [r1], #16
c0de1f5a:	eb00 070e 	add.w	r7, r0, lr
c0de1f5e:	f5c6 3600 	rsb	r6, r6, #131072	@ 0x20000
c0de1f62:	f5c3 3300 	rsb	r3, r3, #131072	@ 0x20000
c0de1f66:	0ab4      	lsrs	r4, r6, #10
c0de1f68:	f800 300e 	strb.w	r3, [r0, lr]
c0de1f6c:	f10e 0e09 	add.w	lr, lr, #9
c0de1f70:	723c      	strb	r4, [r7, #8]
c0de1f72:	08b4      	lsrs	r4, r6, #2
c0de1f74:	71fc      	strb	r4, [r7, #7]
c0de1f76:	f5c5 3400 	rsb	r4, r5, #131072	@ 0x20000
c0de1f7a:	0925      	lsrs	r5, r4, #4
c0de1f7c:	717d      	strb	r5, [r7, #5]
c0de1f7e:	f5cc 3500 	rsb	r5, ip, #131072	@ 0x20000
c0de1f82:	09aa      	lsrs	r2, r5, #6
c0de1f84:	70fa      	strb	r2, [r7, #3]
c0de1f86:	0a1a      	lsrs	r2, r3, #8
c0de1f88:	707a      	strb	r2, [r7, #1]
c0de1f8a:	01b2      	lsls	r2, r6, #6
c0de1f8c:	ea42 3214 	orr.w	r2, r2, r4, lsr #12
c0de1f90:	71ba      	strb	r2, [r7, #6]
c0de1f92:	0122      	lsls	r2, r4, #4
c0de1f94:	ea42 3295 	orr.w	r2, r2, r5, lsr #14
c0de1f98:	713a      	strb	r2, [r7, #4]
c0de1f9a:	00aa      	lsls	r2, r5, #2
c0de1f9c:	ea42 4213 	orr.w	r2, r2, r3, lsr #16
c0de1fa0:	70ba      	strb	r2, [r7, #2]
c0de1fa2:	e7d2      	b.n	c0de1f4a <pqcrystals_dilithium2_lowram_polyz_pack+0x8>

c0de1fa4 <pqcrystals_dilithium2_lowram_polyw1_pack>:
c0de1fa4:	b5b0      	push	{r4, r5, r7, lr}
c0de1fa6:	3001      	adds	r0, #1
c0de1fa8:	2200      	movs	r2, #0
c0de1faa:	f5b2 6f80 	cmp.w	r2, #1024	@ 0x400
c0de1fae:	bf08      	it	eq
c0de1fb0:	bdb0      	popeq	{r4, r5, r7, pc}
c0de1fb2:	588b      	ldr	r3, [r1, r2]
c0de1fb4:	188c      	adds	r4, r1, r2
c0de1fb6:	3210      	adds	r2, #16
c0de1fb8:	f800 3c01 	strb.w	r3, [r0, #-1]
c0de1fbc:	6865      	ldr	r5, [r4, #4]
c0de1fbe:	ea43 1385 	orr.w	r3, r3, r5, lsl #6
c0de1fc2:	f800 3c01 	strb.w	r3, [r0, #-1]
c0de1fc6:	6863      	ldr	r3, [r4, #4]
c0de1fc8:	089d      	lsrs	r5, r3, #2
c0de1fca:	7005      	strb	r5, [r0, #0]
c0de1fcc:	68a5      	ldr	r5, [r4, #8]
c0de1fce:	012d      	lsls	r5, r5, #4
c0de1fd0:	ea45 0393 	orr.w	r3, r5, r3, lsr #2
c0de1fd4:	7003      	strb	r3, [r0, #0]
c0de1fd6:	68a3      	ldr	r3, [r4, #8]
c0de1fd8:	091d      	lsrs	r5, r3, #4
c0de1fda:	7045      	strb	r5, [r0, #1]
c0de1fdc:	68e4      	ldr	r4, [r4, #12]
c0de1fde:	00a4      	lsls	r4, r4, #2
c0de1fe0:	ea44 1313 	orr.w	r3, r4, r3, lsr #4
c0de1fe4:	7043      	strb	r3, [r0, #1]
c0de1fe6:	3003      	adds	r0, #3
c0de1fe8:	e7df      	b.n	c0de1faa <pqcrystals_dilithium2_lowram_polyw1_pack+0x6>

c0de1fea <OUTLINED_FUNCTION_0>:
c0de1fea:	4614      	mov	r4, r2
c0de1fec:	460d      	mov	r5, r1
c0de1fee:	4606      	mov	r6, r0
c0de1ff0:	2700      	movs	r7, #0
c0de1ff2:	4770      	bx	lr

c0de1ff4 <OUTLINED_FUNCTION_1>:
c0de1ff4:	f814 0b01 	ldrb.w	r0, [r4], #1
c0de1ff8:	2100      	movs	r1, #0
c0de1ffa:	4632      	mov	r2, r6
c0de1ffc:	f008 bf8c 	b.w	c0deaf18 <__aeabi_llsl>

c0de2000 <randombytes>:
c0de2000:	f008 bc4d 	b.w	c0dea89e <cx_rng_no_throw>

c0de2004 <pqcrystals_dilithium2_lowram_montgomery_reduce>:
c0de2004:	4a03      	ldr	r2, [pc, #12]	@ (c0de2014 <pqcrystals_dilithium2_lowram_montgomery_reduce+0x10>)
c0de2006:	4b04      	ldr	r3, [pc, #16]	@ (c0de2018 <pqcrystals_dilithium2_lowram_montgomery_reduce+0x14>)
c0de2008:	4342      	muls	r2, r0
c0de200a:	fbc2 0103 	smlal	r0, r1, r2, r3
c0de200e:	4608      	mov	r0, r1
c0de2010:	4770      	bx	lr
c0de2012:	bf00      	nop
c0de2014:	03802001 	.word	0x03802001
c0de2018:	ff801fff 	.word	0xff801fff

c0de201c <pqcrystals_dilithium2_lowram_reduce32>:
c0de201c:	f500 0180 	add.w	r1, r0, #4194304	@ 0x400000
c0de2020:	4a02      	ldr	r2, [pc, #8]	@ (c0de202c <pqcrystals_dilithium2_lowram_reduce32+0x10>)
c0de2022:	15c9      	asrs	r1, r1, #23
c0de2024:	fb01 0002 	mla	r0, r1, r2, r0
c0de2028:	4770      	bx	lr
c0de202a:	bf00      	nop
c0de202c:	ff801fff 	.word	0xff801fff

c0de2030 <pqcrystals_dilithium2_lowram_caddq>:
c0de2030:	4902      	ldr	r1, [pc, #8]	@ (c0de203c <pqcrystals_dilithium2_lowram_caddq+0xc>)
c0de2032:	2800      	cmp	r0, #0
c0de2034:	bf48      	it	mi
c0de2036:	4408      	addmi	r0, r1
c0de2038:	4770      	bx	lr
c0de203a:	bf00      	nop
c0de203c:	007fe001 	.word	0x007fe001

c0de2040 <pqcrystals_dilithium2_lowram_freeze>:
c0de2040:	f500 0180 	add.w	r1, r0, #4194304	@ 0x400000
c0de2044:	4a04      	ldr	r2, [pc, #16]	@ (c0de2058 <pqcrystals_dilithium2_lowram_freeze+0x18>)
c0de2046:	15c9      	asrs	r1, r1, #23
c0de2048:	fb01 0002 	mla	r0, r1, r2, r0
c0de204c:	4903      	ldr	r1, [pc, #12]	@ (c0de205c <pqcrystals_dilithium2_lowram_freeze+0x1c>)
c0de204e:	2800      	cmp	r0, #0
c0de2050:	bf48      	it	mi
c0de2052:	4408      	addmi	r0, r1
c0de2054:	4770      	bx	lr
c0de2056:	bf00      	nop
c0de2058:	ff801fff 	.word	0xff801fff
c0de205c:	007fe001 	.word	0x007fe001

c0de2060 <pqcrystals_dilithium2_lowram_power2round>:
c0de2060:	f601 72ff 	addw	r2, r1, #4095	@ 0xfff
c0de2064:	f641 73ff 	movw	r3, #8191	@ 0x1fff
c0de2068:	ea22 0303 	bic.w	r3, r2, r3
c0de206c:	1ac9      	subs	r1, r1, r3
c0de206e:	6001      	str	r1, [r0, #0]
c0de2070:	1350      	asrs	r0, r2, #13
c0de2072:	4770      	bx	lr

c0de2074 <pqcrystals_dilithium2_lowram_decompose>:
c0de2074:	b510      	push	{r4, lr}
c0de2076:	f101 027f 	add.w	r2, r1, #127	@ 0x7f
c0de207a:	f642 430b 	movw	r3, #11275	@ 0x2c0b
c0de207e:	4c0c      	ldr	r4, [pc, #48]	@ (c0de20b0 <pqcrystals_dilithium2_lowram_decompose+0x3c>)
c0de2080:	11d2      	asrs	r2, r2, #7
c0de2082:	4353      	muls	r3, r2
c0de2084:	f503 0200 	add.w	r2, r3, #8388608	@ 0x800000
c0de2088:	1612      	asrs	r2, r2, #24
c0de208a:	f1b3 5f2e 	cmp.w	r3, #729808896	@ 0x2b800000
c0de208e:	4b06      	ldr	r3, [pc, #24]	@ (c0de20a8 <pqcrystals_dilithium2_lowram_decompose+0x34>)
c0de2090:	bfa8      	it	ge
c0de2092:	2200      	movge	r2, #0
c0de2094:	fb02 1103 	mla	r1, r2, r3, r1
c0de2098:	4b04      	ldr	r3, [pc, #16]	@ (c0de20ac <pqcrystals_dilithium2_lowram_decompose+0x38>)
c0de209a:	42a1      	cmp	r1, r4
c0de209c:	bfc8      	it	gt
c0de209e:	4419      	addgt	r1, r3
c0de20a0:	6001      	str	r1, [r0, #0]
c0de20a2:	4610      	mov	r0, r2
c0de20a4:	bd10      	pop	{r4, pc}
c0de20a6:	bf00      	nop
c0de20a8:	fffd1800 	.word	0xfffd1800
c0de20ac:	ff801fff 	.word	0xff801fff
c0de20b0:	003ff000 	.word	0x003ff000

c0de20b4 <pqcrystals_dilithium2_lowram_use_hint>:
c0de20b4:	b51c      	push	{r2, r3, r4, lr}
c0de20b6:	460c      	mov	r4, r1
c0de20b8:	4601      	mov	r1, r0
c0de20ba:	a801      	add	r0, sp, #4
c0de20bc:	f7ff ffda 	bl	c0de2074 <pqcrystals_dilithium2_lowram_decompose>
c0de20c0:	b164      	cbz	r4, c0de20dc <pqcrystals_dilithium2_lowram_use_hint+0x28>
c0de20c2:	9901      	ldr	r1, [sp, #4]
c0de20c4:	2901      	cmp	r1, #1
c0de20c6:	db04      	blt.n	c0de20d2 <pqcrystals_dilithium2_lowram_use_hint+0x1e>
c0de20c8:	f1b0 012b 	subs.w	r1, r0, #43	@ 0x2b
c0de20cc:	bf18      	it	ne
c0de20ce:	1c41      	addne	r1, r0, #1
c0de20d0:	e003      	b.n	c0de20da <pqcrystals_dilithium2_lowram_use_hint+0x26>
c0de20d2:	1e41      	subs	r1, r0, #1
c0de20d4:	2800      	cmp	r0, #0
c0de20d6:	bf08      	it	eq
c0de20d8:	212b      	moveq	r1, #43	@ 0x2b
c0de20da:	4608      	mov	r0, r1
c0de20dc:	bd1c      	pop	{r2, r3, r4, pc}

c0de20de <pqcrystals_dilithium2_lowram_keypair>:
c0de20de:	b570      	push	{r4, r5, r6, lr}
c0de20e0:	b088      	sub	sp, #32
c0de20e2:	466e      	mov	r6, sp
c0de20e4:	460c      	mov	r4, r1
c0de20e6:	4605      	mov	r5, r0
c0de20e8:	2120      	movs	r1, #32
c0de20ea:	4630      	mov	r0, r6
c0de20ec:	f7ff ff88 	bl	c0de2000 <randombytes>
c0de20f0:	4628      	mov	r0, r5
c0de20f2:	4621      	mov	r1, r4
c0de20f4:	4632      	mov	r2, r6
c0de20f6:	f000 f803 	bl	c0de2100 <crypto_sign_keypair_core>
c0de20fa:	2000      	movs	r0, #0
c0de20fc:	b008      	add	sp, #32
c0de20fe:	bd70      	pop	{r4, r5, r6, pc}

c0de2100 <crypto_sign_keypair_core>:
c0de2100:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2104:	f6ad 6d88 	subw	sp, sp, #3720	@ 0xe88
c0de2108:	f60d 6708 	addw	r7, sp, #3592	@ 0xe08
c0de210c:	460d      	mov	r5, r1
c0de210e:	4606      	mov	r6, r0
c0de2110:	4611      	mov	r1, r2
c0de2112:	2220      	movs	r2, #32
c0de2114:	4638      	mov	r0, r7
c0de2116:	f009 f807 	bl	c0deb128 <__aeabi_memcpy>
c0de211a:	f240 4004 	movw	r0, #1028	@ 0x404
c0de211e:	f8ad 0e28 	strh.w	r0, [sp, #3624]	@ 0xe28
c0de2122:	ac02      	add	r4, sp, #8
c0de2124:	4620      	mov	r0, r4
c0de2126:	f7fe fe9b 	bl	c0de0e60 <inner_keccak256_init>
c0de212a:	4620      	mov	r0, r4
c0de212c:	4639      	mov	r1, r7
c0de212e:	2222      	movs	r2, #34	@ 0x22
c0de2130:	f7fe fea7 	bl	c0de0e82 <inner_keccak256_inject>
c0de2134:	f000 fbca 	bl	c0de28cc <OUTLINED_FUNCTION_0>
c0de2138:	4620      	mov	r0, r4
c0de213a:	4639      	mov	r1, r7
c0de213c:	2280      	movs	r2, #128	@ 0x80
c0de213e:	f7fe fec8 	bl	c0de0ed2 <inner_keccak256_extract>
c0de2142:	4628      	mov	r0, r5
c0de2144:	4639      	mov	r1, r7
c0de2146:	f7ff fb94 	bl	c0de1872 <pack_sk_rho>
c0de214a:	f107 0160 	add.w	r1, r7, #96	@ 0x60
c0de214e:	4628      	mov	r0, r5
c0de2150:	9501      	str	r5, [sp, #4]
c0de2152:	f7ff fb96 	bl	c0de1882 <pack_sk_key>
c0de2156:	4630      	mov	r0, r6
c0de2158:	4639      	mov	r1, r7
c0de215a:	9600      	str	r6, [sp, #0]
c0de215c:	f7ff fb63 	bl	c0de1826 <pack_pk_rho>
c0de2160:	3720      	adds	r7, #32
c0de2162:	f04f 0b00 	mov.w	fp, #0
c0de2166:	ad82      	add	r5, sp, #520	@ 0x208
c0de2168:	f50d 64c1 	add.w	r4, sp, #1544	@ 0x608
c0de216c:	f60d 2608 	addw	r6, sp, #2568	@ 0xa08
c0de2170:	f04f 0800 	mov.w	r8, #0
c0de2174:	f1b8 0f04 	cmp.w	r8, #4
c0de2178:	d072      	beq.n	c0de2260 <crypto_sign_keypair_core+0x160>
c0de217a:	4628      	mov	r0, r5
c0de217c:	4639      	mov	r1, r7
c0de217e:	2200      	movs	r2, #0
c0de2180:	f7ff fd26 	bl	c0de1bd0 <pqcrystals_dilithium2_lowram_poly_uniform_eta>
c0de2184:	f1b8 0f00 	cmp.w	r8, #0
c0de2188:	d104      	bne.n	c0de2194 <crypto_sign_keypair_core+0x94>
c0de218a:	9801      	ldr	r0, [sp, #4]
c0de218c:	4629      	mov	r1, r5
c0de218e:	2200      	movs	r2, #0
c0de2190:	f7ff fb58 	bl	c0de1844 <pack_sk_s1>
c0de2194:	4628      	mov	r0, r5
c0de2196:	f7ff fc6c 	bl	c0de1a72 <pqcrystals_dilithium2_lowram_poly_ntt>
c0de219a:	ea4f 2008 	mov.w	r0, r8, lsl #8
c0de219e:	f60d 6108 	addw	r1, sp, #3592	@ 0xe08
c0de21a2:	b282      	uxth	r2, r0
c0de21a4:	4620      	mov	r0, r4
c0de21a6:	f7ff fc9f 	bl	c0de1ae8 <pqcrystals_dilithium2_lowram_poly_uniform>
c0de21aa:	4630      	mov	r0, r6
c0de21ac:	4621      	mov	r1, r4
c0de21ae:	462a      	mov	r2, r5
c0de21b0:	f7ff fc63 	bl	c0de1a7a <pqcrystals_dilithium2_lowram_poly_pointwise_montgomery>
c0de21b4:	f04f 0a01 	mov.w	sl, #1
c0de21b8:	f1ba 0f04 	cmp.w	sl, #4
c0de21bc:	d020      	beq.n	c0de2200 <crypto_sign_keypair_core+0x100>
c0de21be:	fa1f f28a 	uxth.w	r2, sl
c0de21c2:	4628      	mov	r0, r5
c0de21c4:	4639      	mov	r1, r7
c0de21c6:	f7ff fd03 	bl	c0de1bd0 <pqcrystals_dilithium2_lowram_poly_uniform_eta>
c0de21ca:	f1b8 0f00 	cmp.w	r8, #0
c0de21ce:	d104      	bne.n	c0de21da <crypto_sign_keypair_core+0xda>
c0de21d0:	9801      	ldr	r0, [sp, #4]
c0de21d2:	4629      	mov	r1, r5
c0de21d4:	4652      	mov	r2, sl
c0de21d6:	f7ff fb35 	bl	c0de1844 <pack_sk_s1>
c0de21da:	4628      	mov	r0, r5
c0de21dc:	f7ff fc49 	bl	c0de1a72 <pqcrystals_dilithium2_lowram_poly_ntt>
c0de21e0:	eb0b 000a 	add.w	r0, fp, sl
c0de21e4:	f60d 6108 	addw	r1, sp, #3592	@ 0xe08
c0de21e8:	b282      	uxth	r2, r0
c0de21ea:	4620      	mov	r0, r4
c0de21ec:	f7ff fc7c 	bl	c0de1ae8 <pqcrystals_dilithium2_lowram_poly_uniform>
c0de21f0:	4630      	mov	r0, r6
c0de21f2:	4621      	mov	r1, r4
c0de21f4:	462a      	mov	r2, r5
c0de21f6:	f7ff fb56 	bl	c0de18a6 <pqcrystals_dilithium2_lowram_poly_pointwise_acc_montgomery>
c0de21fa:	f10a 0a01 	add.w	sl, sl, #1
c0de21fe:	e7db      	b.n	c0de21b8 <crypto_sign_keypair_core+0xb8>
c0de2200:	4630      	mov	r0, r6
c0de2202:	f7ff fc09 	bl	c0de1a18 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de2206:	4630      	mov	r0, r6
c0de2208:	f7ff fc35 	bl	c0de1a76 <pqcrystals_dilithium2_lowram_poly_invntt_tomont>
c0de220c:	f108 0004 	add.w	r0, r8, #4
c0de2210:	4639      	mov	r1, r7
c0de2212:	b282      	uxth	r2, r0
c0de2214:	4620      	mov	r0, r4
c0de2216:	f7ff fcdb 	bl	c0de1bd0 <pqcrystals_dilithium2_lowram_poly_uniform_eta>
c0de221a:	f8dd a004 	ldr.w	sl, [sp, #4]
c0de221e:	4621      	mov	r1, r4
c0de2220:	4642      	mov	r2, r8
c0de2222:	4650      	mov	r0, sl
c0de2224:	f7ff fb15 	bl	c0de1852 <pack_sk_s2>
c0de2228:	4630      	mov	r0, r6
c0de222a:	4631      	mov	r1, r6
c0de222c:	4622      	mov	r2, r4
c0de222e:	f7ff fc11 	bl	c0de1a54 <pqcrystals_dilithium2_lowram_poly_add>
c0de2232:	4630      	mov	r0, r6
c0de2234:	f7ff fbff 	bl	c0de1a36 <pqcrystals_dilithium2_lowram_poly_caddq>
c0de2238:	4628      	mov	r0, r5
c0de223a:	4621      	mov	r1, r4
c0de223c:	4632      	mov	r2, r6
c0de223e:	f7ff fc2f 	bl	c0de1aa0 <pqcrystals_dilithium2_lowram_poly_power2round>
c0de2242:	4650      	mov	r0, sl
c0de2244:	4621      	mov	r1, r4
c0de2246:	4642      	mov	r2, r8
c0de2248:	f7ff fb0b 	bl	c0de1862 <pack_sk_t0>
c0de224c:	9800      	ldr	r0, [sp, #0]
c0de224e:	4629      	mov	r1, r5
c0de2250:	4642      	mov	r2, r8
c0de2252:	f7ff faf0 	bl	c0de1836 <pack_pk_t1>
c0de2256:	f50b 7b80 	add.w	fp, fp, #256	@ 0x100
c0de225a:	f108 0801 	add.w	r8, r8, #1
c0de225e:	e789      	b.n	c0de2174 <crypto_sign_keypair_core+0x74>
c0de2260:	ac02      	add	r4, sp, #8
c0de2262:	4620      	mov	r0, r4
c0de2264:	f7fe fdfc 	bl	c0de0e60 <inner_keccak256_init>
c0de2268:	9e00      	ldr	r6, [sp, #0]
c0de226a:	4620      	mov	r0, r4
c0de226c:	f44f 62a4 	mov.w	r2, #1312	@ 0x520
c0de2270:	4631      	mov	r1, r6
c0de2272:	f7fe fe06 	bl	c0de0e82 <inner_keccak256_inject>
c0de2276:	f000 fb29 	bl	c0de28cc <OUTLINED_FUNCTION_0>
c0de227a:	ad82      	add	r5, sp, #520	@ 0x208
c0de227c:	4620      	mov	r0, r4
c0de227e:	2240      	movs	r2, #64	@ 0x40
c0de2280:	4629      	mov	r1, r5
c0de2282:	f7fe fe26 	bl	c0de0ed2 <inner_keccak256_extract>
c0de2286:	480c      	ldr	r0, [pc, #48]	@ (c0de22b8 <crypto_sign_keypair_core+0x1b8>)
c0de2288:	4629      	mov	r1, r5
c0de228a:	2240      	movs	r2, #64	@ 0x40
c0de228c:	eb09 0400 	add.w	r4, r9, r0
c0de2290:	f504 7020 	add.w	r0, r4, #640	@ 0x280
c0de2294:	f008 ff48 	bl	c0deb128 <__aeabi_memcpy>
c0de2298:	f504 7030 	add.w	r0, r4, #704	@ 0x2c0
c0de229c:	4631      	mov	r1, r6
c0de229e:	f44f 62a4 	mov.w	r2, #1312	@ 0x520
c0de22a2:	f008 ff41 	bl	c0deb128 <__aeabi_memcpy>
c0de22a6:	9801      	ldr	r0, [sp, #4]
c0de22a8:	4629      	mov	r1, r5
c0de22aa:	f7ff faf3 	bl	c0de1894 <pack_sk_tr>
c0de22ae:	2000      	movs	r0, #0
c0de22b0:	f60d 6d88 	addw	sp, sp, #3720	@ 0xe88
c0de22b4:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de22b8:	000002d8 	.word	0x000002d8

c0de22bc <crypto_sign_signature_init>:
c0de22bc:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de22c0:	29ff      	cmp	r1, #255	@ 0xff
c0de22c2:	d902      	bls.n	c0de22ca <crypto_sign_signature_init+0xe>
c0de22c4:	f04f 34ff 	mov.w	r4, #4294967295	@ 0xffffffff
c0de22c8:	e01c      	b.n	c0de2304 <crypto_sign_signature_init+0x48>
c0de22ca:	4680      	mov	r8, r0
c0de22cc:	480f      	ldr	r0, [pc, #60]	@ (c0de230c <crypto_sign_signature_init+0x50>)
c0de22ce:	2400      	movs	r4, #0
c0de22d0:	460d      	mov	r5, r1
c0de22d2:	eb09 0700 	add.w	r7, r9, r0
c0de22d6:	4638      	mov	r0, r7
c0de22d8:	f887 1201 	strb.w	r1, [r7, #513]	@ 0x201
c0de22dc:	f887 4200 	strb.w	r4, [r7, #512]	@ 0x200
c0de22e0:	f7fe fdbe 	bl	c0de0e60 <inner_keccak256_init>
c0de22e4:	4e0a      	ldr	r6, [pc, #40]	@ (c0de2310 <crypto_sign_signature_init+0x54>)
c0de22e6:	f507 7120 	add.w	r1, r7, #640	@ 0x280
c0de22ea:	4638      	mov	r0, r7
c0de22ec:	2240      	movs	r2, #64	@ 0x40
c0de22ee:	447e      	add	r6, pc
c0de22f0:	47b0      	blx	r6
c0de22f2:	f507 7100 	add.w	r1, r7, #512	@ 0x200
c0de22f6:	4638      	mov	r0, r7
c0de22f8:	2202      	movs	r2, #2
c0de22fa:	47b0      	blx	r6
c0de22fc:	4638      	mov	r0, r7
c0de22fe:	4641      	mov	r1, r8
c0de2300:	462a      	mov	r2, r5
c0de2302:	47b0      	blx	r6
c0de2304:	4620      	mov	r0, r4
c0de2306:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de230a:	bf00      	nop
c0de230c:	000002d8 	.word	0x000002d8
c0de2310:	ffffeb91 	.word	0xffffeb91

c0de2314 <crypto_sign_signature_absorb>:
c0de2314:	460a      	mov	r2, r1
c0de2316:	4601      	mov	r1, r0
c0de2318:	4801      	ldr	r0, [pc, #4]	@ (c0de2320 <crypto_sign_signature_absorb+0xc>)
c0de231a:	4448      	add	r0, r9
c0de231c:	f7fe bdb1 	b.w	c0de0e82 <inner_keccak256_inject>
c0de2320:	000002d8 	.word	0x000002d8

c0de2324 <crypto_sign_signature_core>:
c0de2324:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2328:	f5ad 5d83 	sub.w	sp, sp, #4192	@ 0x1060
c0de232c:	b086      	sub	sp, #24
c0de232e:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de2330:	48bf      	ldr	r0, [pc, #764]	@ (c0de2630 <crypto_sign_signature_core+0x30c>)
c0de2332:	4616      	mov	r6, r2
c0de2334:	9103      	str	r1, [sp, #12]
c0de2336:	eb09 0400 	add.w	r4, r9, r0
c0de233a:	f000 fac7 	bl	c0de28cc <OUTLINED_FUNCTION_0>
c0de233e:	f504 7100 	add.w	r1, r4, #512	@ 0x200
c0de2342:	4620      	mov	r0, r4
c0de2344:	2240      	movs	r2, #64	@ 0x40
c0de2346:	f7fe fdc4 	bl	c0de0ed2 <inner_keccak256_extract>
c0de234a:	a80d      	add	r0, sp, #52	@ 0x34
c0de234c:	2100      	movs	r1, #0
c0de234e:	f500 7000 	add.w	r0, r0, #512	@ 0x200
c0de2352:	900a      	str	r0, [sp, #40]	@ 0x28
c0de2354:	2000      	movs	r0, #0
c0de2356:	2920      	cmp	r1, #32
c0de2358:	d006      	beq.n	c0de2368 <crypto_sign_signature_core+0x44>
c0de235a:	4ab5      	ldr	r2, [pc, #724]	@ (c0de2630 <crypto_sign_signature_core+0x30c>)
c0de235c:	444a      	add	r2, r9
c0de235e:	440a      	add	r2, r1
c0de2360:	3101      	adds	r1, #1
c0de2362:	f882 0240 	strb.w	r0, [r2, #576]	@ 0x240
c0de2366:	e7f6      	b.n	c0de2356 <crypto_sign_signature_core+0x32>
c0de2368:	48b1      	ldr	r0, [pc, #708]	@ (c0de2630 <crypto_sign_signature_core+0x30c>)
c0de236a:	eb09 0400 	add.w	r4, r9, r0
c0de236e:	4620      	mov	r0, r4
c0de2370:	f7fe fd76 	bl	c0de0e60 <inner_keccak256_init>
c0de2374:	4fb0      	ldr	r7, [pc, #704]	@ (c0de2638 <crypto_sign_signature_core+0x314>)
c0de2376:	f106 0120 	add.w	r1, r6, #32
c0de237a:	4620      	mov	r0, r4
c0de237c:	2220      	movs	r2, #32
c0de237e:	447f      	add	r7, pc
c0de2380:	47b8      	blx	r7
c0de2382:	f504 7510 	add.w	r5, r4, #576	@ 0x240
c0de2386:	4620      	mov	r0, r4
c0de2388:	2220      	movs	r2, #32
c0de238a:	4629      	mov	r1, r5
c0de238c:	47b8      	blx	r7
c0de238e:	f504 7100 	add.w	r1, r4, #512	@ 0x200
c0de2392:	4620      	mov	r0, r4
c0de2394:	2240      	movs	r2, #64	@ 0x40
c0de2396:	47b8      	blx	r7
c0de2398:	f000 fa98 	bl	c0de28cc <OUTLINED_FUNCTION_0>
c0de239c:	4620      	mov	r0, r4
c0de239e:	4629      	mov	r1, r5
c0de23a0:	2240      	movs	r2, #64	@ 0x40
c0de23a2:	f7fe fd96 	bl	c0de0ed2 <inner_keccak256_extract>
c0de23a6:	f506 7060 	add.w	r0, r6, #896	@ 0x380
c0de23aa:	2100      	movs	r1, #0
c0de23ac:	f04f 0800 	mov.w	r8, #0
c0de23b0:	9004      	str	r0, [sp, #16]
c0de23b2:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de23b4:	3020      	adds	r0, #32
c0de23b6:	9005      	str	r0, [sp, #20]
c0de23b8:	ac0d      	add	r4, sp, #52	@ 0x34
c0de23ba:	2001      	movs	r0, #1
c0de23bc:	9107      	str	r1, [sp, #28]
c0de23be:	9006      	str	r0, [sp, #24]
c0de23c0:	b280      	uxth	r0, r0
c0de23c2:	f64f 71fc 	movw	r1, #65532	@ 0xfffc
c0de23c6:	eb01 0380 	add.w	r3, r1, r0, lsl #2
c0de23ca:	2000      	movs	r0, #0
c0de23cc:	f50d 618f 	add.w	r1, sp, #1144	@ 0x478
c0de23d0:	2804      	cmp	r0, #4
c0de23d2:	d00b      	beq.n	c0de23ec <crypto_sign_signature_core+0xc8>
c0de23d4:	2200      	movs	r2, #0
c0de23d6:	f5b2 7f40 	cmp.w	r2, #768	@ 0x300
c0de23da:	d003      	beq.n	c0de23e4 <crypto_sign_signature_core+0xc0>
c0de23dc:	f801 8002 	strb.w	r8, [r1, r2]
c0de23e0:	3201      	adds	r2, #1
c0de23e2:	e7f8      	b.n	c0de23d6 <crypto_sign_signature_core+0xb2>
c0de23e4:	f501 7140 	add.w	r1, r1, #768	@ 0x300
c0de23e8:	3001      	adds	r0, #1
c0de23ea:	e7f1      	b.n	c0de23d0 <crypto_sign_signature_core+0xac>
c0de23ec:	9807      	ldr	r0, [sp, #28]
c0de23ee:	2700      	movs	r7, #0
c0de23f0:	9309      	str	r3, [sp, #36]	@ 0x24
c0de23f2:	b280      	uxth	r0, r0
c0de23f4:	ea4f 0b80 	mov.w	fp, r0, lsl #2
c0de23f8:	2f04      	cmp	r7, #4
c0de23fa:	d023      	beq.n	c0de2444 <crypto_sign_signature_core+0x120>
c0de23fc:	488c      	ldr	r0, [pc, #560]	@ (c0de2630 <crypto_sign_signature_core+0x30c>)
c0de23fe:	eb09 0300 	add.w	r3, r9, r0
c0de2402:	eb07 000b 	add.w	r0, r7, fp
c0de2406:	b282      	uxth	r2, r0
c0de2408:	f503 7110 	add.w	r1, r3, #576	@ 0x240
c0de240c:	4620      	mov	r0, r4
c0de240e:	f7ff f905 	bl	c0de161c <poly_uniform_gamma1_lowram_eth>
c0de2412:	4620      	mov	r0, r4
c0de2414:	f7ff fb2d 	bl	c0de1a72 <pqcrystals_dilithium2_lowram_poly_ntt>
c0de2418:	f04f 0a00 	mov.w	sl, #0
c0de241c:	f50d 658f 	add.w	r5, sp, #1144	@ 0x478
c0de2420:	f5ba 6f80 	cmp.w	sl, #1024	@ 0x400
c0de2424:	d00c      	beq.n	c0de2440 <crypto_sign_signature_core+0x11c>
c0de2426:	eb07 000a 	add.w	r0, r7, sl
c0de242a:	4621      	mov	r1, r4
c0de242c:	4632      	mov	r2, r6
c0de242e:	b283      	uxth	r3, r0
c0de2430:	4628      	mov	r0, r5
c0de2432:	f7ff f883 	bl	c0de153c <poly_uniform_pointwise_montgomery_polywadd_lowram_eth>
c0de2436:	f505 7540 	add.w	r5, r5, #768	@ 0x300
c0de243a:	f50a 7a80 	add.w	sl, sl, #256	@ 0x100
c0de243e:	e7ef      	b.n	c0de2420 <crypto_sign_signature_core+0xfc>
c0de2440:	3701      	adds	r7, #1
c0de2442:	e7d9      	b.n	c0de23f8 <crypto_sign_signature_core+0xd4>
c0de2444:	f8dd b024 	ldr.w	fp, [sp, #36]	@ 0x24
c0de2448:	2700      	movs	r7, #0
c0de244a:	f50d 658f 	add.w	r5, sp, #1144	@ 0x478
c0de244e:	f5b7 7f40 	cmp.w	r7, #768	@ 0x300
c0de2452:	d01a      	beq.n	c0de248a <crypto_sign_signature_core+0x166>
c0de2454:	4620      	mov	r0, r4
c0de2456:	4629      	mov	r1, r5
c0de2458:	f7fe ffd3 	bl	c0de1402 <polyw_unpack>
c0de245c:	4620      	mov	r0, r4
c0de245e:	f7ff fb0a 	bl	c0de1a76 <pqcrystals_dilithium2_lowram_poly_invntt_tomont>
c0de2462:	4620      	mov	r0, r4
c0de2464:	f7ff fae7 	bl	c0de1a36 <pqcrystals_dilithium2_lowram_poly_caddq>
c0de2468:	4628      	mov	r0, r5
c0de246a:	4621      	mov	r1, r4
c0de246c:	f7fe ffab 	bl	c0de13c6 <polyw_pack>
c0de2470:	4620      	mov	r0, r4
c0de2472:	4621      	mov	r1, r4
c0de2474:	f7fe fff5 	bl	c0de1462 <poly_highbits>
c0de2478:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de247a:	4621      	mov	r1, r4
c0de247c:	4438      	add	r0, r7
c0de247e:	f7ff fd91 	bl	c0de1fa4 <pqcrystals_dilithium2_lowram_polyw1_pack>
c0de2482:	f505 7540 	add.w	r5, r5, #768	@ 0x300
c0de2486:	37c0      	adds	r7, #192	@ 0xc0
c0de2488:	e7e1      	b.n	c0de244e <crypto_sign_signature_core+0x12a>
c0de248a:	4869      	ldr	r0, [pc, #420]	@ (c0de2630 <crypto_sign_signature_core+0x30c>)
c0de248c:	eb09 0500 	add.w	r5, r9, r0
c0de2490:	4628      	mov	r0, r5
c0de2492:	f7fe fce5 	bl	c0de0e60 <inner_keccak256_init>
c0de2496:	f505 7100 	add.w	r1, r5, #512	@ 0x200
c0de249a:	4628      	mov	r0, r5
c0de249c:	2240      	movs	r2, #64	@ 0x40
c0de249e:	f7fe fcf0 	bl	c0de0e82 <inner_keccak256_inject>
c0de24a2:	9f0b      	ldr	r7, [sp, #44]	@ 0x2c
c0de24a4:	4628      	mov	r0, r5
c0de24a6:	f44f 7240 	mov.w	r2, #768	@ 0x300
c0de24aa:	4639      	mov	r1, r7
c0de24ac:	f7fe fce9 	bl	c0de0e82 <inner_keccak256_inject>
c0de24b0:	4628      	mov	r0, r5
c0de24b2:	f7fe fcf8 	bl	c0de0ea6 <inner_keccak256_flip>
c0de24b6:	4628      	mov	r0, r5
c0de24b8:	4639      	mov	r1, r7
c0de24ba:	2220      	movs	r2, #32
c0de24bc:	f7fe fd09 	bl	c0de0ed2 <inner_keccak256_extract>
c0de24c0:	4620      	mov	r0, r4
c0de24c2:	4639      	mov	r1, r7
c0de24c4:	f7ff fc69 	bl	c0de1d9a <pqcrystals_dilithium2_lowram_poly_challenge_eth>
c0de24c8:	f20d 4034 	addw	r0, sp, #1076	@ 0x434
c0de24cc:	4621      	mov	r1, r4
c0de24ce:	f7fe fda6 	bl	c0de101e <poly_challenge_compress>
c0de24d2:	9807      	ldr	r0, [sp, #28]
c0de24d4:	f8dd a014 	ldr.w	sl, [sp, #20]
c0de24d8:	2500      	movs	r5, #0
c0de24da:	3001      	adds	r0, #1
c0de24dc:	9007      	str	r0, [sp, #28]
c0de24de:	b135      	cbz	r5, c0de24ee <crypto_sign_signature_core+0x1ca>
c0de24e0:	2d04      	cmp	r5, #4
c0de24e2:	d035      	beq.n	c0de2550 <crypto_sign_signature_core+0x22c>
c0de24e4:	4620      	mov	r0, r4
c0de24e6:	f20d 4134 	addw	r1, sp, #1076	@ 0x434
c0de24ea:	f7fe fdcd 	bl	c0de1088 <poly_challenge_decompress>
c0de24ee:	9f0a      	ldr	r7, [sp, #40]	@ 0x28
c0de24f0:	4621      	mov	r1, r4
c0de24f2:	4638      	mov	r0, r7
c0de24f4:	f000 fada 	bl	c0de2aac <poly_small_ntt_copy>
c0de24f8:	4620      	mov	r0, r4
c0de24fa:	4631      	mov	r1, r6
c0de24fc:	462a      	mov	r2, r5
c0de24fe:	f7fe fff9 	bl	c0de14f4 <unpack_sk_s1>
c0de2502:	4620      	mov	r0, r4
c0de2504:	f000 f9e6 	bl	c0de28d4 <small_ntt>
c0de2508:	4620      	mov	r0, r4
c0de250a:	4639      	mov	r1, r7
c0de250c:	4622      	mov	r2, r4
c0de250e:	f000 fb05 	bl	c0de2b1c <poly_small_basemul_invntt>
c0de2512:	4847      	ldr	r0, [pc, #284]	@ (c0de2630 <crypto_sign_signature_core+0x30c>)
c0de2514:	4621      	mov	r1, r4
c0de2516:	4448      	add	r0, r9
c0de2518:	9000      	str	r0, [sp, #0]
c0de251a:	f500 7210 	add.w	r2, r0, #576	@ 0x240
c0de251e:	eb0b 0005 	add.w	r0, fp, r5
c0de2522:	b283      	uxth	r3, r0
c0de2524:	4620      	mov	r0, r4
c0de2526:	f7ff f8af 	bl	c0de1688 <poly_uniform_gamma1_add_lowram_eth>
c0de252a:	4620      	mov	r0, r4
c0de252c:	f7ff fa74 	bl	c0de1a18 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de2530:	4840      	ldr	r0, [pc, #256]	@ (c0de2634 <crypto_sign_signature_core+0x310>)
c0de2532:	f500 410c 	add.w	r1, r0, #35840	@ 0x8c00
c0de2536:	4620      	mov	r0, r4
c0de2538:	f7ff fac0 	bl	c0de1abc <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de253c:	2800      	cmp	r0, #0
c0de253e:	d166      	bne.n	c0de260e <crypto_sign_signature_core+0x2ea>
c0de2540:	4650      	mov	r0, sl
c0de2542:	4621      	mov	r1, r4
c0de2544:	f7ff fcfd 	bl	c0de1f42 <pqcrystals_dilithium2_lowram_polyz_pack>
c0de2548:	f50a 7a10 	add.w	sl, sl, #576	@ 0x240
c0de254c:	3501      	adds	r5, #1
c0de254e:	e7c6      	b.n	c0de24de <crypto_sign_signature_core+0x1ba>
c0de2550:	9d04      	ldr	r5, [sp, #16]
c0de2552:	2100      	movs	r1, #0
c0de2554:	2000      	movs	r0, #0
c0de2556:	f50d 6a8f 	add.w	sl, sp, #1144	@ 0x478
c0de255a:	2700      	movs	r7, #0
c0de255c:	9009      	str	r0, [sp, #36]	@ 0x24
c0de255e:	910c      	str	r1, [sp, #48]	@ 0x30
c0de2560:	2f04      	cmp	r7, #4
c0de2562:	d057      	beq.n	c0de2614 <crypto_sign_signature_core+0x2f0>
c0de2564:	4620      	mov	r0, r4
c0de2566:	f20d 4134 	addw	r1, sp, #1076	@ 0x434
c0de256a:	f7fe fd8d 	bl	c0de1088 <poly_challenge_decompress>
c0de256e:	46ab      	mov	fp, r5
c0de2570:	9d0a      	ldr	r5, [sp, #40]	@ 0x28
c0de2572:	4621      	mov	r1, r4
c0de2574:	4628      	mov	r0, r5
c0de2576:	f000 fa99 	bl	c0de2aac <poly_small_ntt_copy>
c0de257a:	4620      	mov	r0, r4
c0de257c:	4631      	mov	r1, r6
c0de257e:	463a      	mov	r2, r7
c0de2580:	9708      	str	r7, [sp, #32]
c0de2582:	f7fe ffbe 	bl	c0de1502 <unpack_sk_s2>
c0de2586:	4620      	mov	r0, r4
c0de2588:	f000 f9a4 	bl	c0de28d4 <small_ntt>
c0de258c:	4629      	mov	r1, r5
c0de258e:	4620      	mov	r0, r4
c0de2590:	4622      	mov	r2, r4
c0de2592:	465d      	mov	r5, fp
c0de2594:	f000 fac2 	bl	c0de2b1c <poly_small_basemul_invntt>
c0de2598:	4620      	mov	r0, r4
c0de259a:	4651      	mov	r1, sl
c0de259c:	4622      	mov	r2, r4
c0de259e:	f7fe ff48 	bl	c0de1432 <polyw_sub>
c0de25a2:	4620      	mov	r0, r4
c0de25a4:	f7ff fa38 	bl	c0de1a18 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de25a8:	4650      	mov	r0, sl
c0de25aa:	4621      	mov	r1, r4
c0de25ac:	f7fe ff0b 	bl	c0de13c6 <polyw_pack>
c0de25b0:	4620      	mov	r0, r4
c0de25b2:	4621      	mov	r1, r4
c0de25b4:	f7fe ff6e 	bl	c0de1494 <poly_lowbits>
c0de25b8:	4620      	mov	r0, r4
c0de25ba:	f7ff fa2d 	bl	c0de1a18 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de25be:	491d      	ldr	r1, [pc, #116]	@ (c0de2634 <crypto_sign_signature_core+0x310>)
c0de25c0:	4620      	mov	r0, r4
c0de25c2:	f7ff fa7b 	bl	c0de1abc <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de25c6:	bb10      	cbnz	r0, c0de260e <crypto_sign_signature_core+0x2ea>
c0de25c8:	4620      	mov	r0, r4
c0de25ca:	f20d 4134 	addw	r1, sp, #1076	@ 0x434
c0de25ce:	462a      	mov	r2, r5
c0de25d0:	f7fe fd8c 	bl	c0de10ec <poly_schoolbook>
c0de25d4:	4620      	mov	r0, r4
c0de25d6:	f44f 31ba 	mov.w	r1, #95232	@ 0x17400
c0de25da:	f7ff fa6f 	bl	c0de1abc <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de25de:	b9b0      	cbnz	r0, c0de260e <crypto_sign_signature_core+0x2ea>
c0de25e0:	4620      	mov	r0, r4
c0de25e2:	4621      	mov	r1, r4
c0de25e4:	4652      	mov	r2, sl
c0de25e6:	f7ff f887 	bl	c0de16f8 <poly_make_hint_lowram>
c0de25ea:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0de25ec:	4401      	add	r1, r0
c0de25ee:	2950      	cmp	r1, #80	@ 0x50
c0de25f0:	9109      	str	r1, [sp, #36]	@ 0x24
c0de25f2:	d80c      	bhi.n	c0de260e <crypto_sign_signature_core+0x2ea>
c0de25f4:	9f08      	ldr	r7, [sp, #32]
c0de25f6:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de25f8:	4621      	mov	r1, r4
c0de25fa:	ab0c      	add	r3, sp, #48	@ 0x30
c0de25fc:	463a      	mov	r2, r7
c0de25fe:	f7fe fcec 	bl	c0de0fda <pqcrystals_dilithium2_lowram_pack_sig_h>
c0de2602:	f505 75d0 	add.w	r5, r5, #416	@ 0x1a0
c0de2606:	f50a 7a40 	add.w	sl, sl, #768	@ 0x300
c0de260a:	3701      	adds	r7, #1
c0de260c:	e7a8      	b.n	c0de2560 <crypto_sign_signature_core+0x23c>
c0de260e:	9806      	ldr	r0, [sp, #24]
c0de2610:	3001      	adds	r0, #1
c0de2612:	e6d4      	b.n	c0de23be <crypto_sign_signature_core+0x9a>
c0de2614:	a90c      	add	r1, sp, #48	@ 0x30
c0de2616:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de2618:	f7fe fcf5 	bl	c0de1006 <pqcrystals_dilithium2_lowram_pack_sig_h_zero>
c0de261c:	9903      	ldr	r1, [sp, #12]
c0de261e:	f640 1074 	movw	r0, #2420	@ 0x974
c0de2622:	6008      	str	r0, [r1, #0]
c0de2624:	2000      	movs	r0, #0
c0de2626:	f50d 5d83 	add.w	sp, sp, #4192	@ 0x1060
c0de262a:	b006      	add	sp, #24
c0de262c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de2630:	000002d8 	.word	0x000002d8
c0de2634:	000173b2 	.word	0x000173b2
c0de2638:	ffffeb01 	.word	0xffffeb01

c0de263c <pqcrystals_dilithium2_lowram_verify>:
c0de263c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2640:	f6ad 3d58 	subw	sp, sp, #2904	@ 0xb58
c0de2644:	4692      	mov	sl, r2
c0de2646:	f640 1274 	movw	r2, #2420	@ 0x974
c0de264a:	4604      	mov	r4, r0
c0de264c:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de2650:	4291      	cmp	r1, r2
c0de2652:	f040 80eb 	bne.w	c0de282c <pqcrystals_dilithium2_lowram_verify+0x1f0>
c0de2656:	f8dd 1b7c 	ldr.w	r1, [sp, #2940]	@ 0xb7c
c0de265a:	29ff      	cmp	r1, #255	@ 0xff
c0de265c:	f200 80e6 	bhi.w	c0de282c <pqcrystals_dilithium2_lowram_verify+0x1f0>
c0de2660:	ad84      	add	r5, sp, #528	@ 0x210
c0de2662:	4e81      	ldr	r6, [pc, #516]	@ (c0de2868 <pqcrystals_dilithium2_lowram_verify+0x22c>)
c0de2664:	f8dd 8b80 	ldr.w	r8, [sp, #2944]	@ 0xb80
c0de2668:	9303      	str	r3, [sp, #12]
c0de266a:	4628      	mov	r0, r5
c0de266c:	447e      	add	r6, pc
c0de266e:	47b0      	blx	r6
c0de2670:	4f7e      	ldr	r7, [pc, #504]	@ (c0de286c <pqcrystals_dilithium2_lowram_verify+0x230>)
c0de2672:	4628      	mov	r0, r5
c0de2674:	4641      	mov	r1, r8
c0de2676:	f44f 62a4 	mov.w	r2, #1312	@ 0x520
c0de267a:	447f      	add	r7, pc
c0de267c:	47b8      	blx	r7
c0de267e:	4628      	mov	r0, r5
c0de2680:	f7fe fc11 	bl	c0de0ea6 <inner_keccak256_flip>
c0de2684:	f50d 6b82 	add.w	fp, sp, #1040	@ 0x410
c0de2688:	4628      	mov	r0, r5
c0de268a:	2240      	movs	r2, #64	@ 0x40
c0de268c:	4659      	mov	r1, fp
c0de268e:	f7fe fc20 	bl	c0de0ed2 <inner_keccak256_extract>
c0de2692:	4628      	mov	r0, r5
c0de2694:	47b0      	blx	r6
c0de2696:	4628      	mov	r0, r5
c0de2698:	4659      	mov	r1, fp
c0de269a:	2240      	movs	r2, #64	@ 0x40
c0de269c:	47b8      	blx	r7
c0de269e:	f8dd 0b7c 	ldr.w	r0, [sp, #2940]	@ 0xb7c
c0de26a2:	f04f 0800 	mov.w	r8, #0
c0de26a6:	4659      	mov	r1, fp
c0de26a8:	2202      	movs	r2, #2
c0de26aa:	f88d 8410 	strb.w	r8, [sp, #1040]	@ 0x410
c0de26ae:	f88d 0411 	strb.w	r0, [sp, #1041]	@ 0x411
c0de26b2:	4628      	mov	r0, r5
c0de26b4:	47b8      	blx	r7
c0de26b6:	f8dd 1b78 	ldr.w	r1, [sp, #2936]	@ 0xb78
c0de26ba:	f8dd 2b7c 	ldr.w	r2, [sp, #2940]	@ 0xb7c
c0de26be:	4628      	mov	r0, r5
c0de26c0:	47b8      	blx	r7
c0de26c2:	9a03      	ldr	r2, [sp, #12]
c0de26c4:	4628      	mov	r0, r5
c0de26c6:	4651      	mov	r1, sl
c0de26c8:	47b8      	blx	r7
c0de26ca:	4628      	mov	r0, r5
c0de26cc:	f7fe fbeb 	bl	c0de0ea6 <inner_keccak256_flip>
c0de26d0:	4628      	mov	r0, r5
c0de26d2:	4659      	mov	r1, fp
c0de26d4:	2240      	movs	r2, #64	@ 0x40
c0de26d6:	f7fe fbfc 	bl	c0de0ed2 <inner_keccak256_extract>
c0de26da:	4628      	mov	r0, r5
c0de26dc:	47b0      	blx	r6
c0de26de:	4628      	mov	r0, r5
c0de26e0:	4659      	mov	r1, fp
c0de26e2:	2240      	movs	r2, #64	@ 0x40
c0de26e4:	47b8      	blx	r7
c0de26e6:	f20d 7754 	addw	r7, sp, #1876	@ 0x754
c0de26ea:	4621      	mov	r1, r4
c0de26ec:	4638      	mov	r0, r7
c0de26ee:	f7ff fb54 	bl	c0de1d9a <pqcrystals_dilithium2_lowram_poly_challenge_eth>
c0de26f2:	4658      	mov	r0, fp
c0de26f4:	4639      	mov	r1, r7
c0de26f6:	f7fe fc92 	bl	c0de101e <poly_challenge_compress>
c0de26fa:	f8dd 0b80 	ldr.w	r0, [sp, #2944]	@ 0xb80
c0de26fe:	4e59      	ldr	r6, [pc, #356]	@ (c0de2864 <pqcrystals_dilithium2_lowram_verify+0x228>)
c0de2700:	f104 0520 	add.w	r5, r4, #32
c0de2704:	f20d 4b54 	addw	fp, sp, #1108	@ 0x454
c0de2708:	f04f 0a00 	mov.w	sl, #0
c0de270c:	9500      	str	r5, [sp, #0]
c0de270e:	3020      	adds	r0, #32
c0de2710:	9001      	str	r0, [sp, #4]
c0de2712:	2001      	movs	r0, #1
c0de2714:	9003      	str	r0, [sp, #12]
c0de2716:	f1ba 0f04 	cmp.w	sl, #4
c0de271a:	f000 808b 	beq.w	c0de2834 <pqcrystals_dilithium2_lowram_verify+0x1f8>
c0de271e:	2000      	movs	r0, #0
c0de2720:	f5b0 7f40 	cmp.w	r0, #768	@ 0x300
c0de2724:	d003      	beq.n	c0de272e <pqcrystals_dilithium2_lowram_verify+0xf2>
c0de2726:	f80b 8000 	strb.w	r8, [fp, r0]
c0de272a:	3001      	adds	r0, #1
c0de272c:	e7f8      	b.n	c0de2720 <pqcrystals_dilithium2_lowram_verify+0xe4>
c0de272e:	4638      	mov	r0, r7
c0de2730:	4629      	mov	r1, r5
c0de2732:	f8cd a008 	str.w	sl, [sp, #8]
c0de2736:	f7ff faa2 	bl	c0de1c7e <pqcrystals_dilithium2_lowram_polyz_unpack>
c0de273a:	4638      	mov	r0, r7
c0de273c:	4631      	mov	r1, r6
c0de273e:	f7ff f9bd 	bl	c0de1abc <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de2742:	2800      	cmp	r0, #0
c0de2744:	d170      	bne.n	c0de2828 <pqcrystals_dilithium2_lowram_verify+0x1ec>
c0de2746:	4638      	mov	r0, r7
c0de2748:	f7ff f993 	bl	c0de1a72 <pqcrystals_dilithium2_lowram_poly_ntt>
c0de274c:	9802      	ldr	r0, [sp, #8]
c0de274e:	f8dd 2b80 	ldr.w	r2, [sp, #2944]	@ 0xb80
c0de2752:	4639      	mov	r1, r7
c0de2754:	0200      	lsls	r0, r0, #8
c0de2756:	b283      	uxth	r3, r0
c0de2758:	4658      	mov	r0, fp
c0de275a:	f7fe feef 	bl	c0de153c <poly_uniform_pointwise_montgomery_polywadd_lowram_eth>
c0de275e:	9d03      	ldr	r5, [sp, #12]
c0de2760:	f44f 7a18 	mov.w	sl, #608	@ 0x260
c0de2764:	f5ba 6f12 	cmp.w	sl, #2336	@ 0x920
c0de2768:	d018      	beq.n	c0de279c <pqcrystals_dilithium2_lowram_verify+0x160>
c0de276a:	eb04 010a 	add.w	r1, r4, sl
c0de276e:	4638      	mov	r0, r7
c0de2770:	f7ff fa85 	bl	c0de1c7e <pqcrystals_dilithium2_lowram_polyz_unpack>
c0de2774:	4638      	mov	r0, r7
c0de2776:	4631      	mov	r1, r6
c0de2778:	f7ff f9a0 	bl	c0de1abc <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de277c:	2800      	cmp	r0, #0
c0de277e:	d153      	bne.n	c0de2828 <pqcrystals_dilithium2_lowram_verify+0x1ec>
c0de2780:	4638      	mov	r0, r7
c0de2782:	f7ff f976 	bl	c0de1a72 <pqcrystals_dilithium2_lowram_poly_ntt>
c0de2786:	f8dd 2b80 	ldr.w	r2, [sp, #2944]	@ 0xb80
c0de278a:	b2ab      	uxth	r3, r5
c0de278c:	4658      	mov	r0, fp
c0de278e:	4639      	mov	r1, r7
c0de2790:	f7fe fed4 	bl	c0de153c <poly_uniform_pointwise_montgomery_polywadd_lowram_eth>
c0de2794:	3501      	adds	r5, #1
c0de2796:	f50a 7a10 	add.w	sl, sl, #576	@ 0x240
c0de279a:	e7e3      	b.n	c0de2764 <pqcrystals_dilithium2_lowram_verify+0x128>
c0de279c:	4638      	mov	r0, r7
c0de279e:	4659      	mov	r1, fp
c0de27a0:	f7fe fe2f 	bl	c0de1402 <polyw_unpack>
c0de27a4:	4638      	mov	r0, r7
c0de27a6:	f7ff f937 	bl	c0de1a18 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de27aa:	4638      	mov	r0, r7
c0de27ac:	f7ff f963 	bl	c0de1a76 <pqcrystals_dilithium2_lowram_poly_invntt_tomont>
c0de27b0:	4658      	mov	r0, fp
c0de27b2:	4639      	mov	r1, r7
c0de27b4:	f7fe fe07 	bl	c0de13c6 <polyw_pack>
c0de27b8:	f8dd a008 	ldr.w	sl, [sp, #8]
c0de27bc:	9901      	ldr	r1, [sp, #4]
c0de27be:	eb0a 008a 	add.w	r0, sl, sl, lsl #2
c0de27c2:	eb01 1280 	add.w	r2, r1, r0, lsl #6
c0de27c6:	4638      	mov	r0, r7
c0de27c8:	f50d 6182 	add.w	r1, sp, #1040	@ 0x410
c0de27cc:	f7fe fd54 	bl	c0de1278 <poly_schoolbook_t1>
c0de27d0:	4638      	mov	r0, r7
c0de27d2:	4659      	mov	r1, fp
c0de27d4:	463a      	mov	r2, r7
c0de27d6:	f7fe fe2c 	bl	c0de1432 <polyw_sub>
c0de27da:	4638      	mov	r0, r7
c0de27dc:	f7ff f91c 	bl	c0de1a18 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de27e0:	4638      	mov	r0, r7
c0de27e2:	f7ff f928 	bl	c0de1a36 <pqcrystals_dilithium2_lowram_poly_caddq>
c0de27e6:	ad04      	add	r5, sp, #16
c0de27e8:	f60d 3154 	addw	r1, sp, #2900	@ 0xb54
c0de27ec:	4652      	mov	r2, sl
c0de27ee:	4623      	mov	r3, r4
c0de27f0:	4628      	mov	r0, r5
c0de27f2:	f7fe ffbb 	bl	c0de176c <unpack_sig_h_indices>
c0de27f6:	b9b8      	cbnz	r0, c0de2828 <pqcrystals_dilithium2_lowram_verify+0x1ec>
c0de27f8:	f8dd 3b54 	ldr.w	r3, [sp, #2900]	@ 0xb54
c0de27fc:	4638      	mov	r0, r7
c0de27fe:	4639      	mov	r1, r7
c0de2800:	462a      	mov	r2, r5
c0de2802:	f7fe fff1 	bl	c0de17e8 <poly_use_hint_lowram>
c0de2806:	4658      	mov	r0, fp
c0de2808:	4639      	mov	r1, r7
c0de280a:	f7ff fbcb 	bl	c0de1fa4 <pqcrystals_dilithium2_lowram_polyw1_pack>
c0de280e:	a884      	add	r0, sp, #528	@ 0x210
c0de2810:	4659      	mov	r1, fp
c0de2812:	22c0      	movs	r2, #192	@ 0xc0
c0de2814:	f7fe fb35 	bl	c0de0e82 <inner_keccak256_inject>
c0de2818:	9803      	ldr	r0, [sp, #12]
c0de281a:	9d00      	ldr	r5, [sp, #0]
c0de281c:	f10a 0a01 	add.w	sl, sl, #1
c0de2820:	f500 7080 	add.w	r0, r0, #256	@ 0x100
c0de2824:	9003      	str	r0, [sp, #12]
c0de2826:	e776      	b.n	c0de2716 <pqcrystals_dilithium2_lowram_verify+0xda>
c0de2828:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de282c:	f60d 3d58 	addw	sp, sp, #2904	@ 0xb58
c0de2830:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de2834:	ae84      	add	r6, sp, #528	@ 0x210
c0de2836:	4630      	mov	r0, r6
c0de2838:	f7fe fb35 	bl	c0de0ea6 <inner_keccak256_flip>
c0de283c:	ad04      	add	r5, sp, #16
c0de283e:	4630      	mov	r0, r6
c0de2840:	2220      	movs	r2, #32
c0de2842:	4629      	mov	r1, r5
c0de2844:	f7fe fb45 	bl	c0de0ed2 <inner_keccak256_extract>
c0de2848:	2100      	movs	r1, #0
c0de284a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de284e:	2920      	cmp	r1, #32
c0de2850:	d005      	beq.n	c0de285e <pqcrystals_dilithium2_lowram_verify+0x222>
c0de2852:	5c6a      	ldrb	r2, [r5, r1]
c0de2854:	5c63      	ldrb	r3, [r4, r1]
c0de2856:	3101      	adds	r1, #1
c0de2858:	4293      	cmp	r3, r2
c0de285a:	d0f8      	beq.n	c0de284e <pqcrystals_dilithium2_lowram_verify+0x212>
c0de285c:	e7e6      	b.n	c0de282c <pqcrystals_dilithium2_lowram_verify+0x1f0>
c0de285e:	2000      	movs	r0, #0
c0de2860:	e7e4      	b.n	c0de282c <pqcrystals_dilithium2_lowram_verify+0x1f0>
c0de2862:	bf00      	nop
c0de2864:	0001ffb2 	.word	0x0001ffb2
c0de2868:	ffffe7f1 	.word	0xffffe7f1
c0de286c:	ffffe805 	.word	0xffffe805

c0de2870 <pqcrystals_dilithium2_lowram_open>:
c0de2870:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de2872:	4604      	mov	r4, r0
c0de2874:	f640 1074 	movw	r0, #2420	@ 0x974
c0de2878:	461d      	mov	r5, r3
c0de287a:	460e      	mov	r6, r1
c0de287c:	4283      	cmp	r3, r0
c0de287e:	d311      	bcc.n	c0de28a4 <pqcrystals_dilithium2_lowram_open+0x34>
c0de2880:	e9dd 7108 	ldrd	r7, r1, [sp, #32]
c0de2884:	f6a5 1374 	subw	r3, r5, #2420	@ 0x974
c0de2888:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de288a:	6033      	str	r3, [r6, #0]
c0de288c:	e9cd 7100 	strd	r7, r1, [sp]
c0de2890:	f602 1774 	addw	r7, r2, #2420	@ 0x974
c0de2894:	9002      	str	r0, [sp, #8]
c0de2896:	4610      	mov	r0, r2
c0de2898:	f640 1174 	movw	r1, #2420	@ 0x974
c0de289c:	463a      	mov	r2, r7
c0de289e:	f7ff fecd 	bl	c0de263c <pqcrystals_dilithium2_lowram_verify>
c0de28a2:	b148      	cbz	r0, c0de28b8 <pqcrystals_dilithium2_lowram_open+0x48>
c0de28a4:	2000      	movs	r0, #0
c0de28a6:	6030      	str	r0, [r6, #0]
c0de28a8:	b11d      	cbz	r5, c0de28b2 <pqcrystals_dilithium2_lowram_open+0x42>
c0de28aa:	f804 0b01 	strb.w	r0, [r4], #1
c0de28ae:	3d01      	subs	r5, #1
c0de28b0:	e7fa      	b.n	c0de28a8 <pqcrystals_dilithium2_lowram_open+0x38>
c0de28b2:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de28b6:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
c0de28b8:	2000      	movs	r0, #0
c0de28ba:	6831      	ldr	r1, [r6, #0]
c0de28bc:	4288      	cmp	r0, r1
c0de28be:	bf24      	itt	cs
c0de28c0:	2000      	movcs	r0, #0
c0de28c2:	bdfe      	popcs	{r1, r2, r3, r4, r5, r6, r7, pc}
c0de28c4:	5c39      	ldrb	r1, [r7, r0]
c0de28c6:	5421      	strb	r1, [r4, r0]
c0de28c8:	3001      	adds	r0, #1
c0de28ca:	e7f6      	b.n	c0de28ba <pqcrystals_dilithium2_lowram_open+0x4a>

c0de28cc <OUTLINED_FUNCTION_0>:
c0de28cc:	4620      	mov	r0, r4
c0de28ce:	f7fe baea 	b.w	c0de0ea6 <inner_keccak256_flip>
	...

c0de28d4 <small_ntt>:
c0de28d4:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de28d8:	491c      	ldr	r1, [pc, #112]	@ (c0de294c <small_ntt+0x78>)
c0de28da:	f04f 0c80 	mov.w	ip, #128	@ 0x80
c0de28de:	f04f 0e01 	mov.w	lr, #1
c0de28e2:	f46f 6850 	mvn.w	r8, #3328	@ 0xd00
c0de28e6:	4479      	add	r1, pc
c0de28e8:	468a      	mov	sl, r1
c0de28ea:	4917      	ldr	r1, [pc, #92]	@ (c0de2948 <small_ntt+0x74>)
c0de28ec:	468b      	mov	fp, r1
c0de28ee:	f1bc 0f02 	cmp.w	ip, #2
c0de28f2:	bf38      	it	cc
c0de28f4:	e8bd 8df0 	ldmiacc.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de28f8:	2600      	movs	r6, #0
c0de28fa:	2eff      	cmp	r6, #255	@ 0xff
c0de28fc:	d821      	bhi.n	c0de2942 <small_ntt+0x6e>
c0de28fe:	4651      	mov	r1, sl
c0de2900:	f93a 301e 	ldrsh.w	r3, [sl, lr, lsl #1]
c0de2904:	eb06 010c 	add.w	r1, r6, ip
c0de2908:	460f      	mov	r7, r1
c0de290a:	428e      	cmp	r6, r1
c0de290c:	d215      	bcs.n	c0de293a <small_ntt+0x66>
c0de290e:	f930 2017 	ldrsh.w	r2, [r0, r7, lsl #1]
c0de2912:	465c      	mov	r4, fp
c0de2914:	435a      	muls	r2, r3
c0de2916:	fb02 f40b 	mul.w	r4, r2, fp
c0de291a:	1424      	asrs	r4, r4, #16
c0de291c:	fb04 2208 	mla	r2, r4, r8, r2
c0de2920:	f830 4016 	ldrh.w	r4, [r0, r6, lsl #1]
c0de2924:	eba4 4512 	sub.w	r5, r4, r2, lsr #16
c0de2928:	eb04 4212 	add.w	r2, r4, r2, lsr #16
c0de292c:	f820 5017 	strh.w	r5, [r0, r7, lsl #1]
c0de2930:	f820 2016 	strh.w	r2, [r0, r6, lsl #1]
c0de2934:	3701      	adds	r7, #1
c0de2936:	3601      	adds	r6, #1
c0de2938:	e7e7      	b.n	c0de290a <small_ntt+0x36>
c0de293a:	f10e 0e01 	add.w	lr, lr, #1
c0de293e:	463e      	mov	r6, r7
c0de2940:	e7db      	b.n	c0de28fa <small_ntt+0x26>
c0de2942:	ea4f 0c5c 	mov.w	ip, ip, lsr #1
c0de2946:	e7d2      	b.n	c0de28ee <small_ntt+0x1a>
c0de2948:	f3010000 	.word	0xf3010000
c0de294c:	0000ba12 	.word	0x0000ba12

c0de2950 <small_invntt_tomont>:
c0de2950:	e92d 4dfe 	stmdb	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de2954:	4934      	ldr	r1, [pc, #208]	@ (c0de2a28 <small_invntt_tomont+0xd8>)
c0de2956:	4b36      	ldr	r3, [pc, #216]	@ (c0de2a30 <small_invntt_tomont+0xe0>)
c0de2958:	2202      	movs	r2, #2
c0de295a:	247f      	movs	r4, #127	@ 0x7f
c0de295c:	f644 68bf 	movw	r8, #20159	@ 0x4ebf
c0de2960:	f46f 6a50 	mvn.w	sl, #3328	@ 0xd00
c0de2964:	468e      	mov	lr, r1
c0de2966:	4931      	ldr	r1, [pc, #196]	@ (c0de2a2c <small_invntt_tomont+0xdc>)
c0de2968:	447b      	add	r3, pc
c0de296a:	9300      	str	r3, [sp, #0]
c0de296c:	f101 5bd3 	add.w	fp, r1, #442499072	@ 0x1a600000
c0de2970:	2a80      	cmp	r2, #128	@ 0x80
c0de2972:	d834      	bhi.n	c0de29de <small_invntt_tomont+0x8e>
c0de2974:	2300      	movs	r3, #0
c0de2976:	9201      	str	r2, [sp, #4]
c0de2978:	2bff      	cmp	r3, #255	@ 0xff
c0de297a:	d82e      	bhi.n	c0de29da <small_invntt_tomont+0x8a>
c0de297c:	9900      	ldr	r1, [sp, #0]
c0de297e:	9402      	str	r4, [sp, #8]
c0de2980:	f931 4014 	ldrsh.w	r4, [r1, r4, lsl #1]
c0de2984:	1899      	adds	r1, r3, r2
c0de2986:	460d      	mov	r5, r1
c0de2988:	428b      	cmp	r3, r1
c0de298a:	d221      	bcs.n	c0de29d0 <small_invntt_tomont+0x80>
c0de298c:	f830 6013 	ldrh.w	r6, [r0, r3, lsl #1]
c0de2990:	f830 2015 	ldrh.w	r2, [r0, r5, lsl #1]
c0de2994:	46f4      	mov	ip, lr
c0de2996:	4432      	add	r2, r6
c0de2998:	b217      	sxth	r7, r2
c0de299a:	fb07 f708 	mul.w	r7, r7, r8
c0de299e:	f107 7700 	add.w	r7, r7, #33554432	@ 0x2000000
c0de29a2:	16bf      	asrs	r7, r7, #26
c0de29a4:	fb07 f70e 	mul.w	r7, r7, lr
c0de29a8:	eba2 4217 	sub.w	r2, r2, r7, lsr #16
c0de29ac:	f820 2013 	strh.w	r2, [r0, r3, lsl #1]
c0de29b0:	3301      	adds	r3, #1
c0de29b2:	f830 2015 	ldrh.w	r2, [r0, r5, lsl #1]
c0de29b6:	1b92      	subs	r2, r2, r6
c0de29b8:	b212      	sxth	r2, r2
c0de29ba:	4362      	muls	r2, r4
c0de29bc:	fb02 f60b 	mul.w	r6, r2, fp
c0de29c0:	1436      	asrs	r6, r6, #16
c0de29c2:	fb06 220a 	mla	r2, r6, sl, r2
c0de29c6:	0c12      	lsrs	r2, r2, #16
c0de29c8:	f820 2015 	strh.w	r2, [r0, r5, lsl #1]
c0de29cc:	3501      	adds	r5, #1
c0de29ce:	e7db      	b.n	c0de2988 <small_invntt_tomont+0x38>
c0de29d0:	9c02      	ldr	r4, [sp, #8]
c0de29d2:	9a01      	ldr	r2, [sp, #4]
c0de29d4:	462b      	mov	r3, r5
c0de29d6:	3c01      	subs	r4, #1
c0de29d8:	e7ce      	b.n	c0de2978 <small_invntt_tomont+0x28>
c0de29da:	0052      	lsls	r2, r2, #1
c0de29dc:	e7c8      	b.n	c0de2970 <small_invntt_tomont+0x20>
c0de29de:	2100      	movs	r1, #0
c0de29e0:	f240 52a1 	movw	r2, #1441	@ 0x5a1
c0de29e4:	f46f 6350 	mvn.w	r3, #3328	@ 0xd00
c0de29e8:	f644 64bf 	movw	r4, #20159	@ 0x4ebf
c0de29ec:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de29f0:	bf08      	it	eq
c0de29f2:	e8bd 8dfe 	ldmiaeq.w	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de29f6:	f930 5011 	ldrsh.w	r5, [r0, r1, lsl #1]
c0de29fa:	4f0c      	ldr	r7, [pc, #48]	@ (c0de2a2c <small_invntt_tomont+0xdc>)
c0de29fc:	fb05 f602 	mul.w	r6, r5, r2
c0de2a00:	437d      	muls	r5, r7
c0de2a02:	4677      	mov	r7, lr
c0de2a04:	142d      	asrs	r5, r5, #16
c0de2a06:	fb05 6503 	mla	r5, r5, r3, r6
c0de2a0a:	142e      	asrs	r6, r5, #16
c0de2a0c:	0c2d      	lsrs	r5, r5, #16
c0de2a0e:	4366      	muls	r6, r4
c0de2a10:	f106 7600 	add.w	r6, r6, #33554432	@ 0x2000000
c0de2a14:	16b6      	asrs	r6, r6, #26
c0de2a16:	fb06 f60e 	mul.w	r6, r6, lr
c0de2a1a:	eba5 4516 	sub.w	r5, r5, r6, lsr #16
c0de2a1e:	f820 5011 	strh.w	r5, [r0, r1, lsl #1]
c0de2a22:	3101      	adds	r1, #1
c0de2a24:	e7e2      	b.n	c0de29ec <small_invntt_tomont+0x9c>
c0de2a26:	bf00      	nop
c0de2a28:	0d010000 	.word	0x0d010000
c0de2a2c:	d8a10000 	.word	0xd8a10000
c0de2a30:	0000b990 	.word	0x0000b990

c0de2a34 <small_basemul>:
c0de2a34:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2a36:	f9b1 c000 	ldrsh.w	ip, [r1]
c0de2a3a:	f9b1 5002 	ldrsh.w	r5, [r1, #2]
c0de2a3e:	f9b2 1002 	ldrsh.w	r1, [r2, #2]
c0de2a42:	f46f 6e50 	mvn.w	lr, #3328	@ 0xd00
c0de2a46:	f9b2 6000 	ldrsh.w	r6, [r2]
c0de2a4a:	fb01 f705 	mul.w	r7, r1, r5
c0de2a4e:	4916      	ldr	r1, [pc, #88]	@ (c0de2aa8 <small_basemul+0x74>)
c0de2a50:	fb07 f401 	mul.w	r4, r7, r1
c0de2a54:	1424      	asrs	r4, r4, #16
c0de2a56:	fb04 740e 	mla	r4, r4, lr, r7
c0de2a5a:	1424      	asrs	r4, r4, #16
c0de2a5c:	4363      	muls	r3, r4
c0de2a5e:	fb03 f401 	mul.w	r4, r3, r1
c0de2a62:	1424      	asrs	r4, r4, #16
c0de2a64:	fb04 330e 	mla	r3, r4, lr, r3
c0de2a68:	fb06 f40c 	mul.w	r4, r6, ip
c0de2a6c:	fb04 f701 	mul.w	r7, r4, r1
c0de2a70:	143f      	asrs	r7, r7, #16
c0de2a72:	0c1b      	lsrs	r3, r3, #16
c0de2a74:	fb07 440e 	mla	r4, r7, lr, r4
c0de2a78:	eb03 4314 	add.w	r3, r3, r4, lsr #16
c0de2a7c:	8003      	strh	r3, [r0, #0]
c0de2a7e:	fb06 f305 	mul.w	r3, r6, r5
c0de2a82:	f9b2 2002 	ldrsh.w	r2, [r2, #2]
c0de2a86:	fb03 f401 	mul.w	r4, r3, r1
c0de2a8a:	1424      	asrs	r4, r4, #16
c0de2a8c:	fb02 f20c 	mul.w	r2, r2, ip
c0de2a90:	fb04 330e 	mla	r3, r4, lr, r3
c0de2a94:	4351      	muls	r1, r2
c0de2a96:	1409      	asrs	r1, r1, #16
c0de2a98:	fb01 210e 	mla	r1, r1, lr, r2
c0de2a9c:	0c09      	lsrs	r1, r1, #16
c0de2a9e:	eb01 4113 	add.w	r1, r1, r3, lsr #16
c0de2aa2:	8041      	strh	r1, [r0, #2]
c0de2aa4:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de2aa6:	bf00      	nop
c0de2aa8:	f3010000 	.word	0xf3010000

c0de2aac <poly_small_ntt_copy>:
c0de2aac:	22ff      	movs	r2, #255	@ 0xff
c0de2aae:	f1b2 3fff 	cmp.w	r2, #4294967295	@ 0xffffffff
c0de2ab2:	bfd8      	it	le
c0de2ab4:	f7ff bf0e 	ble.w	c0de28d4 <small_ntt>
c0de2ab8:	f851 3022 	ldr.w	r3, [r1, r2, lsl #2]
c0de2abc:	f820 3012 	strh.w	r3, [r0, r2, lsl #1]
c0de2ac0:	3a01      	subs	r2, #1
c0de2ac2:	e7f4      	b.n	c0de2aae <poly_small_ntt_copy+0x2>

c0de2ac4 <poly_small_basemul>:
c0de2ac4:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de2ac8:	e9cd 1200 	strd	r1, r2, [sp]
c0de2acc:	4683      	mov	fp, r0
c0de2ace:	f04f 0a00 	mov.w	sl, #0
c0de2ad2:	4811      	ldr	r0, [pc, #68]	@ (c0de2b18 <poly_small_basemul+0x54>)
c0de2ad4:	4478      	add	r0, pc
c0de2ad6:	f100 0880 	add.w	r8, r0, #128	@ 0x80
c0de2ada:	f5ba 7f00 	cmp.w	sl, #512	@ 0x200
c0de2ade:	bf08      	it	eq
c0de2ae0:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de2ae4:	9800      	ldr	r0, [sp, #0]
c0de2ae6:	f938 6b02 	ldrsh.w	r6, [r8], #2
c0de2aea:	eb0b 070a 	add.w	r7, fp, sl
c0de2aee:	eb00 040a 	add.w	r4, r0, sl
c0de2af2:	9801      	ldr	r0, [sp, #4]
c0de2af4:	4633      	mov	r3, r6
c0de2af6:	4621      	mov	r1, r4
c0de2af8:	eb00 050a 	add.w	r5, r0, sl
c0de2afc:	4638      	mov	r0, r7
c0de2afe:	462a      	mov	r2, r5
c0de2b00:	f7ff ff98 	bl	c0de2a34 <small_basemul>
c0de2b04:	4273      	negs	r3, r6
c0de2b06:	1d38      	adds	r0, r7, #4
c0de2b08:	1d21      	adds	r1, r4, #4
c0de2b0a:	1d2a      	adds	r2, r5, #4
c0de2b0c:	b21b      	sxth	r3, r3
c0de2b0e:	f7ff ff91 	bl	c0de2a34 <small_basemul>
c0de2b12:	f10a 0a08 	add.w	sl, sl, #8
c0de2b16:	e7e0      	b.n	c0de2ada <poly_small_basemul+0x16>
c0de2b18:	0000b824 	.word	0x0000b824

c0de2b1c <poly_small_basemul_invntt>:
c0de2b1c:	b510      	push	{r4, lr}
c0de2b1e:	4604      	mov	r4, r0
c0de2b20:	f7ff ffd0 	bl	c0de2ac4 <poly_small_basemul>
c0de2b24:	4620      	mov	r0, r4
c0de2b26:	f7ff ff13 	bl	c0de2950 <small_invntt_tomont>
c0de2b2a:	20ff      	movs	r0, #255	@ 0xff
c0de2b2c:	2800      	cmp	r0, #0
c0de2b2e:	d405      	bmi.n	c0de2b3c <poly_small_basemul_invntt+0x20>
c0de2b30:	f934 1010 	ldrsh.w	r1, [r4, r0, lsl #1]
c0de2b34:	f844 1020 	str.w	r1, [r4, r0, lsl #2]
c0de2b38:	3801      	subs	r0, #1
c0de2b3a:	e7f7      	b.n	c0de2b2c <poly_small_basemul_invntt+0x10>
c0de2b3c:	bd10      	pop	{r4, pc}

c0de2b3e <small_polyeta_unpack>:
c0de2b3e:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2b42:	3101      	adds	r1, #1
c0de2b44:	f04f 0c00 	mov.w	ip, #0
c0de2b48:	f5bc 7f00 	cmp.w	ip, #512	@ 0x200
c0de2b4c:	bf08      	it	eq
c0de2b4e:	e8bd 8df0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de2b52:	f811 4c01 	ldrb.w	r4, [r1, #-1]
c0de2b56:	f004 0807 	and.w	r8, r4, #7
c0de2b5a:	eb00 040c 	add.w	r4, r0, ip
c0de2b5e:	f820 800c 	strh.w	r8, [r0, ip]
c0de2b62:	f1c8 0202 	rsb	r2, r8, #2
c0de2b66:	f811 5c01 	ldrb.w	r5, [r1, #-1]
c0de2b6a:	f3c5 0ec2 	ubfx	lr, r5, #3, #3
c0de2b6e:	f8a4 e002 	strh.w	lr, [r4, #2]
c0de2b72:	f811 6c01 	ldrb.w	r6, [r1, #-1]
c0de2b76:	780b      	ldrb	r3, [r1, #0]
c0de2b78:	09b6      	lsrs	r6, r6, #6
c0de2b7a:	f363 0682 	bfi	r6, r3, #2, #1
c0de2b7e:	80a6      	strh	r6, [r4, #4]
c0de2b80:	780b      	ldrb	r3, [r1, #0]
c0de2b82:	f3c3 0a42 	ubfx	sl, r3, #1, #3
c0de2b86:	f8a4 a006 	strh.w	sl, [r4, #6]
c0de2b8a:	780d      	ldrb	r5, [r1, #0]
c0de2b8c:	f3c5 1502 	ubfx	r5, r5, #4, #3
c0de2b90:	8125      	strh	r5, [r4, #8]
c0de2b92:	780f      	ldrb	r7, [r1, #0]
c0de2b94:	784b      	ldrb	r3, [r1, #1]
c0de2b96:	09ff      	lsrs	r7, r7, #7
c0de2b98:	f363 0742 	bfi	r7, r3, #1, #2
c0de2b9c:	8167      	strh	r7, [r4, #10]
c0de2b9e:	784b      	ldrb	r3, [r1, #1]
c0de2ba0:	f3c3 0382 	ubfx	r3, r3, #2, #3
c0de2ba4:	81a3      	strh	r3, [r4, #12]
c0de2ba6:	f891 b001 	ldrb.w	fp, [r1, #1]
c0de2baa:	f820 200c 	strh.w	r2, [r0, ip]
c0de2bae:	f1c3 0202 	rsb	r2, r3, #2
c0de2bb2:	3103      	adds	r1, #3
c0de2bb4:	f10c 0c10 	add.w	ip, ip, #16
c0de2bb8:	81a2      	strh	r2, [r4, #12]
c0de2bba:	f1c7 0202 	rsb	r2, r7, #2
c0de2bbe:	8162      	strh	r2, [r4, #10]
c0de2bc0:	f1c5 0202 	rsb	r2, r5, #2
c0de2bc4:	8122      	strh	r2, [r4, #8]
c0de2bc6:	f1ca 0202 	rsb	r2, sl, #2
c0de2bca:	80e2      	strh	r2, [r4, #6]
c0de2bcc:	f1c6 0202 	rsb	r2, r6, #2
c0de2bd0:	80a2      	strh	r2, [r4, #4]
c0de2bd2:	f1ce 0202 	rsb	r2, lr, #2
c0de2bd6:	8062      	strh	r2, [r4, #2]
c0de2bd8:	2202      	movs	r2, #2
c0de2bda:	eba2 125b 	sub.w	r2, r2, fp, lsr #5
c0de2bde:	81e2      	strh	r2, [r4, #14]
c0de2be0:	e7b2      	b.n	c0de2b48 <small_polyeta_unpack+0xa>

c0de2be2 <os_io_handle_default_apdu>:
c0de2be2:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2be4:	b09d      	sub	sp, #116	@ 0x74
c0de2be6:	4615      	mov	r5, r2
c0de2be8:	9a22      	ldr	r2, [sp, #136]	@ 0x88
c0de2bea:	b3c8      	cbz	r0, c0de2c60 <os_io_handle_default_apdu+0x7e>
c0de2bec:	b3c1      	cbz	r1, c0de2c60 <os_io_handle_default_apdu+0x7e>
c0de2bee:	b3bd      	cbz	r5, c0de2c60 <os_io_handle_default_apdu+0x7e>
c0de2bf0:	461c      	mov	r4, r3
c0de2bf2:	b3ab      	cbz	r3, c0de2c60 <os_io_handle_default_apdu+0x7e>
c0de2bf4:	b10a      	cbz	r2, c0de2bfa <os_io_handle_default_apdu+0x18>
c0de2bf6:	2100      	movs	r1, #0
c0de2bf8:	7011      	strb	r1, [r2, #0]
c0de2bfa:	7801      	ldrb	r1, [r0, #0]
c0de2bfc:	29b0      	cmp	r1, #176	@ 0xb0
c0de2bfe:	d131      	bne.n	c0de2c64 <os_io_handle_default_apdu+0x82>
c0de2c00:	7841      	ldrb	r1, [r0, #1]
c0de2c02:	29a7      	cmp	r1, #167	@ 0xa7
c0de2c04:	d031      	beq.n	c0de2c6a <os_io_handle_default_apdu+0x88>
c0de2c06:	2906      	cmp	r1, #6
c0de2c08:	d036      	beq.n	c0de2c78 <os_io_handle_default_apdu+0x96>
c0de2c0a:	2901      	cmp	r1, #1
c0de2c0c:	d131      	bne.n	c0de2c72 <os_io_handle_default_apdu+0x90>
c0de2c0e:	7881      	ldrb	r1, [r0, #2]
c0de2c10:	bb79      	cbnz	r1, c0de2c72 <os_io_handle_default_apdu+0x90>
c0de2c12:	78c0      	ldrb	r0, [r0, #3]
c0de2c14:	bb68      	cbnz	r0, c0de2c72 <os_io_handle_default_apdu+0x90>
c0de2c16:	6820      	ldr	r0, [r4, #0]
c0de2c18:	2100      	movs	r1, #0
c0de2c1a:	6021      	str	r1, [r4, #0]
c0de2c1c:	2803      	cmp	r0, #3
c0de2c1e:	d321      	bcc.n	c0de2c64 <os_io_handle_default_apdu+0x82>
c0de2c20:	2601      	movs	r6, #1
c0de2c22:	1ec7      	subs	r7, r0, #3
c0de2c24:	6026      	str	r6, [r4, #0]
c0de2c26:	702e      	strb	r6, [r5, #0]
c0de2c28:	6820      	ldr	r0, [r4, #0]
c0de2c2a:	1a3a      	subs	r2, r7, r0
c0de2c2c:	4428      	add	r0, r5
c0de2c2e:	1c41      	adds	r1, r0, #1
c0de2c30:	2001      	movs	r0, #1
c0de2c32:	f008 f903 	bl	c0deae3c <os_registry_get_current_app_tag>
c0de2c36:	f000 f83f 	bl	c0de2cb8 <OUTLINED_FUNCTION_0>
c0de2c3a:	6020      	str	r0, [r4, #0]
c0de2c3c:	1a3a      	subs	r2, r7, r0
c0de2c3e:	4428      	add	r0, r5
c0de2c40:	1c41      	adds	r1, r0, #1
c0de2c42:	2002      	movs	r0, #2
c0de2c44:	f008 f8fa 	bl	c0deae3c <os_registry_get_current_app_tag>
c0de2c48:	f000 f836 	bl	c0de2cb8 <OUTLINED_FUNCTION_0>
c0de2c4c:	1c41      	adds	r1, r0, #1
c0de2c4e:	6021      	str	r1, [r4, #0]
c0de2c50:	542e      	strb	r6, [r5, r0]
c0de2c52:	f008 f8df 	bl	c0deae14 <os_flags>
c0de2c56:	6821      	ldr	r1, [r4, #0]
c0de2c58:	1c4a      	adds	r2, r1, #1
c0de2c5a:	6022      	str	r2, [r4, #0]
c0de2c5c:	5468      	strb	r0, [r5, r1]
c0de2c5e:	e028      	b.n	c0de2cb2 <os_io_handle_default_apdu+0xd0>
c0de2c60:	7814      	ldrb	r4, [r2, #0]
c0de2c62:	e01e      	b.n	c0de2ca2 <os_io_handle_default_apdu+0xc0>
c0de2c64:	f646 1485 	movw	r4, #27013	@ 0x6985
c0de2c68:	e01b      	b.n	c0de2ca2 <os_io_handle_default_apdu+0xc0>
c0de2c6a:	7881      	ldrb	r1, [r0, #2]
c0de2c6c:	b909      	cbnz	r1, c0de2c72 <os_io_handle_default_apdu+0x90>
c0de2c6e:	78c0      	ldrb	r0, [r0, #3]
c0de2c70:	b1d0      	cbz	r0, c0de2ca8 <os_io_handle_default_apdu+0xc6>
c0de2c72:	f44f 44dc 	mov.w	r4, #28160	@ 0x6e00
c0de2c76:	e014      	b.n	c0de2ca2 <os_io_handle_default_apdu+0xc0>
c0de2c78:	2100      	movs	r1, #0
c0de2c7a:	6021      	str	r1, [r4, #0]
c0de2c7c:	7883      	ldrb	r3, [r0, #2]
c0de2c7e:	7902      	ldrb	r2, [r0, #4]
c0de2c80:	ad02      	add	r5, sp, #8
c0de2c82:	e9cd 1500 	strd	r1, r5, [sp]
c0de2c86:	1d41      	adds	r1, r0, #5
c0de2c88:	4618      	mov	r0, r3
c0de2c8a:	2300      	movs	r3, #0
c0de2c8c:	f008 f896 	bl	c0deadbc <os_pki_load_certificate>
c0de2c90:	4604      	mov	r4, r0
c0de2c92:	4628      	mov	r0, r5
c0de2c94:	216c      	movs	r1, #108	@ 0x6c
c0de2c96:	f008 fa5f 	bl	c0deb158 <explicit_bzero>
c0de2c9a:	2c00      	cmp	r4, #0
c0de2c9c:	bf08      	it	eq
c0de2c9e:	f44f 4410 	moveq.w	r4, #36864	@ 0x9000
c0de2ca2:	4620      	mov	r0, r4
c0de2ca4:	b01d      	add	sp, #116	@ 0x74
c0de2ca6:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de2ca8:	2000      	movs	r0, #0
c0de2caa:	6020      	str	r0, [r4, #0]
c0de2cac:	b10a      	cbz	r2, c0de2cb2 <os_io_handle_default_apdu+0xd0>
c0de2cae:	2001      	movs	r0, #1
c0de2cb0:	7010      	strb	r0, [r2, #0]
c0de2cb2:	f44f 4410 	mov.w	r4, #36864	@ 0x9000
c0de2cb6:	e7f4      	b.n	c0de2ca2 <os_io_handle_default_apdu+0xc0>

c0de2cb8 <OUTLINED_FUNCTION_0>:
c0de2cb8:	6821      	ldr	r1, [r4, #0]
c0de2cba:	1c4a      	adds	r2, r1, #1
c0de2cbc:	6022      	str	r2, [r4, #0]
c0de2cbe:	5468      	strb	r0, [r5, r1]
c0de2cc0:	6821      	ldr	r1, [r4, #0]
c0de2cc2:	4408      	add	r0, r1
c0de2cc4:	4770      	bx	lr

c0de2cc6 <os_io_seph_cmd_piezo_play_tune>:
c0de2cc6:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0de2cc8:	280b      	cmp	r0, #11
c0de2cca:	d902      	bls.n	c0de2cd2 <os_io_seph_cmd_piezo_play_tune+0xc>
c0de2ccc:	f06f 0415 	mvn.w	r4, #21
c0de2cd0:	e021      	b.n	c0de2d16 <os_io_seph_cmd_piezo_play_tune+0x50>
c0de2cd2:	4605      	mov	r5, r0
c0de2cd4:	2009      	movs	r0, #9
c0de2cd6:	2100      	movs	r1, #0
c0de2cd8:	2200      	movs	r2, #0
c0de2cda:	2400      	movs	r4, #0
c0de2cdc:	f008 f8a2 	bl	c0deae24 <os_setting_get>
c0de2ce0:	2d08      	cmp	r5, #8
c0de2ce2:	d802      	bhi.n	c0de2cea <os_io_seph_cmd_piezo_play_tune+0x24>
c0de2ce4:	f010 0102 	ands.w	r1, r0, #2
c0de2ce8:	d115      	bne.n	c0de2d16 <os_io_seph_cmd_piezo_play_tune+0x50>
c0de2cea:	2400      	movs	r4, #0
c0de2cec:	2d09      	cmp	r5, #9
c0de2cee:	d302      	bcc.n	c0de2cf6 <os_io_seph_cmd_piezo_play_tune+0x30>
c0de2cf0:	f010 0001 	ands.w	r0, r0, #1
c0de2cf4:	d10f      	bne.n	c0de2d16 <os_io_seph_cmd_piezo_play_tune+0x50>
c0de2cf6:	2056      	movs	r0, #86	@ 0x56
c0de2cf8:	f88d 5007 	strb.w	r5, [sp, #7]
c0de2cfc:	f88d 4005 	strb.w	r4, [sp, #5]
c0de2d00:	2204      	movs	r2, #4
c0de2d02:	2300      	movs	r3, #0
c0de2d04:	f88d 0004 	strb.w	r0, [sp, #4]
c0de2d08:	2001      	movs	r0, #1
c0de2d0a:	f88d 0006 	strb.w	r0, [sp, #6]
c0de2d0e:	a901      	add	r1, sp, #4
c0de2d10:	f000 f803 	bl	c0de2d1a <OUTLINED_FUNCTION_1>
c0de2d14:	4604      	mov	r4, r0
c0de2d16:	4620      	mov	r0, r4
c0de2d18:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0de2d1a <OUTLINED_FUNCTION_1>:
c0de2d1a:	2001      	movs	r0, #1
c0de2d1c:	f008 b8b8 	b.w	c0deae90 <os_io_tx_cmd>

c0de2d20 <io_process_itc_ux_event>:
c0de2d20:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de2d22:	4605      	mov	r5, r0
c0de2d24:	78c0      	ldrb	r0, [r0, #3]
c0de2d26:	2820      	cmp	r0, #32
c0de2d28:	d023      	beq.n	c0de2d72 <io_process_itc_ux_event+0x52>
c0de2d2a:	2823      	cmp	r0, #35	@ 0x23
c0de2d2c:	d029      	beq.n	c0de2d82 <io_process_itc_ux_event+0x62>
c0de2d2e:	460c      	mov	r4, r1
c0de2d30:	2822      	cmp	r0, #34	@ 0x22
c0de2d32:	d132      	bne.n	c0de2d9a <io_process_itc_ux_event+0x7a>
c0de2d34:	4e1f      	ldr	r6, [pc, #124]	@ (c0de2db4 <io_process_itc_ux_event+0x94>)
c0de2d36:	2006      	movs	r0, #6
c0de2d38:	2118      	movs	r1, #24
c0de2d3a:	f809 0006 	strb.w	r0, [r9, r6]
c0de2d3e:	eb09 0706 	add.w	r7, r9, r6
c0de2d42:	2018      	movs	r0, #24
c0de2d44:	6078      	str	r0, [r7, #4]
c0de2d46:	f107 0008 	add.w	r0, r7, #8
c0de2d4a:	f008 f9f7 	bl	c0deb13c <__aeabi_memclr>
c0de2d4e:	7928      	ldrb	r0, [r5, #4]
c0de2d50:	7238      	strb	r0, [r7, #8]
c0de2d52:	7868      	ldrb	r0, [r5, #1]
c0de2d54:	78a9      	ldrb	r1, [r5, #2]
c0de2d56:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de2d5a:	3802      	subs	r0, #2
c0de2d5c:	0401      	lsls	r1, r0, #16
c0de2d5e:	d005      	beq.n	c0de2d6c <io_process_itc_ux_event+0x4c>
c0de2d60:	b282      	uxth	r2, r0
c0de2d62:	2a10      	cmp	r2, #16
c0de2d64:	d802      	bhi.n	c0de2d6c <io_process_itc_ux_event+0x4c>
c0de2d66:	1f60      	subs	r0, r4, #5
c0de2d68:	4290      	cmp	r0, r2
c0de2d6a:	d218      	bcs.n	c0de2d9e <io_process_itc_ux_event+0x7e>
c0de2d6c:	f06f 0415 	mvn.w	r4, #21
c0de2d70:	e013      	b.n	c0de2d9a <io_process_itc_ux_event+0x7a>
c0de2d72:	2001      	movs	r0, #1
c0de2d74:	f007 fdbc 	bl	c0dea8f0 <nbgl_objAllowDrawing>
c0de2d78:	f007 fdc9 	bl	c0dea90e <nbgl_screenRedraw>
c0de2d7c:	f007 fd9f 	bl	c0dea8be <nbgl_refresh>
c0de2d80:	e00a      	b.n	c0de2d98 <io_process_itc_ux_event+0x78>
c0de2d82:	480c      	ldr	r0, [pc, #48]	@ (c0de2db4 <io_process_itc_ux_event+0x94>)
c0de2d84:	2107      	movs	r1, #7
c0de2d86:	f809 1000 	strb.w	r1, [r9, r0]
c0de2d8a:	4448      	add	r0, r9
c0de2d8c:	2101      	movs	r1, #1
c0de2d8e:	6041      	str	r1, [r0, #4]
c0de2d90:	7929      	ldrb	r1, [r5, #4]
c0de2d92:	7201      	strb	r1, [r0, #8]
c0de2d94:	f008 f834 	bl	c0deae00 <os_ux>
c0de2d98:	2400      	movs	r4, #0
c0de2d9a:	4620      	mov	r0, r4
c0de2d9c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de2d9e:	eb09 0406 	add.w	r4, r9, r6
c0de2da2:	1d69      	adds	r1, r5, #5
c0de2da4:	f104 0010 	add.w	r0, r4, #16
c0de2da8:	60e2      	str	r2, [r4, #12]
c0de2daa:	f008 f9bd 	bl	c0deb128 <__aeabi_memcpy>
c0de2dae:	4620      	mov	r0, r4
c0de2db0:	e7f0      	b.n	c0de2d94 <io_process_itc_ux_event+0x74>
c0de2db2:	bf00      	nop
c0de2db4:	00001e00 	.word	0x00001e00

c0de2db8 <io_legacy_apdu_tx>:
c0de2db8:	b5b0      	push	{r4, r5, r7, lr}
c0de2dba:	460a      	mov	r2, r1
c0de2dbc:	4601      	mov	r1, r0
c0de2dbe:	4808      	ldr	r0, [pc, #32]	@ (c0de2de0 <io_legacy_apdu_tx+0x28>)
c0de2dc0:	2300      	movs	r3, #0
c0de2dc2:	2500      	movs	r5, #0
c0de2dc4:	eb09 0400 	add.w	r4, r9, r0
c0de2dc8:	7860      	ldrb	r0, [r4, #1]
c0de2dca:	f008 f861 	bl	c0deae90 <os_io_tx_cmd>
c0de2dce:	4905      	ldr	r1, [pc, #20]	@ (c0de2de4 <io_legacy_apdu_tx+0x2c>)
c0de2dd0:	7065      	strb	r5, [r4, #1]
c0de2dd2:	f809 5001 	strb.w	r5, [r9, r1]
c0de2dd6:	4904      	ldr	r1, [pc, #16]	@ (c0de2de8 <io_legacy_apdu_tx+0x30>)
c0de2dd8:	4449      	add	r1, r9
c0de2dda:	718d      	strb	r5, [r1, #6]
c0de2ddc:	bdb0      	pop	{r4, r5, r7, pc}
c0de2dde:	bf00      	nop
c0de2de0:	00001728 	.word	0x00001728
c0de2de4:	00001e20 	.word	0x00001e20
c0de2de8:	0000171c 	.word	0x0000171c

c0de2dec <io_legacy_apdu_rx>:
c0de2dec:	e92d 41ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
c0de2df0:	4e8c      	ldr	r6, [pc, #560]	@ (c0de3024 <io_legacy_apdu_rx+0x238>)
c0de2df2:	2100      	movs	r1, #0
c0de2df4:	4605      	mov	r5, r0
c0de2df6:	2200      	movs	r2, #0
c0de2df8:	2301      	movs	r3, #1
c0de2dfa:	f88d 100f 	strb.w	r1, [sp, #15]
c0de2dfe:	f240 1111 	movw	r1, #273	@ 0x111
c0de2e02:	eb09 0006 	add.w	r0, r9, r6
c0de2e06:	f008 f84f 	bl	c0deaea8 <os_io_rx_evt>
c0de2e0a:	4604      	mov	r4, r0
c0de2e0c:	2801      	cmp	r0, #1
c0de2e0e:	f2c0 8100 	blt.w	c0de3012 <io_legacy_apdu_rx+0x226>
c0de2e12:	f819 0006 	ldrb.w	r0, [r9, r6]
c0de2e16:	f1a0 0110 	sub.w	r1, r0, #16
c0de2e1a:	2916      	cmp	r1, #22
c0de2e1c:	d844      	bhi.n	c0de2ea8 <io_legacy_apdu_rx+0xbc>
c0de2e1e:	2201      	movs	r2, #1
c0de2e20:	fa02 f101 	lsl.w	r1, r2, r1
c0de2e24:	4a80      	ldr	r2, [pc, #512]	@ (c0de3028 <io_legacy_apdu_rx+0x23c>)
c0de2e26:	4211      	tst	r1, r2
c0de2e28:	d03e      	beq.n	c0de2ea8 <io_legacy_apdu_rx+0xbc>
c0de2e2a:	4f80      	ldr	r7, [pc, #512]	@ (c0de302c <io_legacy_apdu_rx+0x240>)
c0de2e2c:	eb09 0107 	add.w	r1, r9, r7
c0de2e30:	7048      	strb	r0, [r1, #1]
c0de2e32:	f007 ffd3 	bl	c0deaddc <os_perso_is_pin_set>
c0de2e36:	28aa      	cmp	r0, #170	@ 0xaa
c0de2e38:	d103      	bne.n	c0de2e42 <io_legacy_apdu_rx+0x56>
c0de2e3a:	f007 ffd8 	bl	c0deadee <os_global_pin_is_validated>
c0de2e3e:	28aa      	cmp	r0, #170	@ 0xaa
c0de2e40:	d161      	bne.n	c0de2f06 <io_legacy_apdu_rx+0x11a>
c0de2e42:	eb09 0006 	add.w	r0, r9, r6
c0de2e46:	7840      	ldrb	r0, [r0, #1]
c0de2e48:	28b0      	cmp	r0, #176	@ 0xb0
c0de2e4a:	d135      	bne.n	c0de2eb8 <io_legacy_apdu_rx+0xcc>
c0de2e4c:	f240 1011 	movw	r0, #273	@ 0x111
c0de2e50:	1e61      	subs	r1, r4, #1
c0de2e52:	9002      	str	r0, [sp, #8]
c0de2e54:	f10d 000f 	add.w	r0, sp, #15
c0de2e58:	9000      	str	r0, [sp, #0]
c0de2e5a:	4875      	ldr	r0, [pc, #468]	@ (c0de3030 <io_legacy_apdu_rx+0x244>)
c0de2e5c:	ab02      	add	r3, sp, #8
c0de2e5e:	eb09 0500 	add.w	r5, r9, r0
c0de2e62:	eb09 0006 	add.w	r0, r9, r6
c0de2e66:	3001      	adds	r0, #1
c0de2e68:	462a      	mov	r2, r5
c0de2e6a:	f7ff feba 	bl	c0de2be2 <os_io_handle_default_apdu>
c0de2e6e:	2400      	movs	r4, #0
c0de2e70:	9902      	ldr	r1, [sp, #8]
c0de2e72:	eb09 0607 	add.w	r6, r9, r7
c0de2e76:	f5b0 4f10 	cmp.w	r0, #36864	@ 0x9000
c0de2e7a:	bf18      	it	ne
c0de2e7c:	4621      	movne	r1, r4
c0de2e7e:	0a02      	lsrs	r2, r0, #8
c0de2e80:	2300      	movs	r3, #0
c0de2e82:	546a      	strb	r2, [r5, r1]
c0de2e84:	186a      	adds	r2, r5, r1
c0de2e86:	7050      	strb	r0, [r2, #1]
c0de2e88:	1c88      	adds	r0, r1, #2
c0de2e8a:	4629      	mov	r1, r5
c0de2e8c:	9002      	str	r0, [sp, #8]
c0de2e8e:	b282      	uxth	r2, r0
c0de2e90:	7870      	ldrb	r0, [r6, #1]
c0de2e92:	f007 fffd 	bl	c0deae90 <os_io_tx_cmd>
c0de2e96:	f89d 100f 	ldrb.w	r1, [sp, #15]
c0de2e9a:	7074      	strb	r4, [r6, #1]
c0de2e9c:	2901      	cmp	r1, #1
c0de2e9e:	f000 80bd 	beq.w	c0de301c <io_legacy_apdu_rx+0x230>
c0de2ea2:	ea00 75e0 	and.w	r5, r0, r0, asr #31
c0de2ea6:	e0b5      	b.n	c0de3014 <io_legacy_apdu_rx+0x228>
c0de2ea8:	1e41      	subs	r1, r0, #1
c0de2eaa:	2902      	cmp	r1, #2
c0de2eac:	d33d      	bcc.n	c0de2f2a <io_legacy_apdu_rx+0x13e>
c0de2eae:	2830      	cmp	r0, #48	@ 0x30
c0de2eb0:	d0bb      	beq.n	c0de2e2a <io_legacy_apdu_rx+0x3e>
c0de2eb2:	2840      	cmp	r0, #64	@ 0x40
c0de2eb4:	d0b9      	beq.n	c0de2e2a <io_legacy_apdu_rx+0x3e>
c0de2eb6:	e0a3      	b.n	c0de3000 <io_legacy_apdu_rx+0x214>
c0de2eb8:	eb09 0007 	add.w	r0, r9, r7
c0de2ebc:	7847      	ldrb	r7, [r0, #1]
c0de2ebe:	2f10      	cmp	r7, #16
c0de2ec0:	d05f      	beq.n	c0de2f82 <io_legacy_apdu_rx+0x196>
c0de2ec2:	2f40      	cmp	r7, #64	@ 0x40
c0de2ec4:	d05f      	beq.n	c0de2f86 <io_legacy_apdu_rx+0x19a>
c0de2ec6:	2f21      	cmp	r7, #33	@ 0x21
c0de2ec8:	d06f      	beq.n	c0de2faa <io_legacy_apdu_rx+0x1be>
c0de2eca:	2f22      	cmp	r7, #34	@ 0x22
c0de2ecc:	d048      	beq.n	c0de2f60 <io_legacy_apdu_rx+0x174>
c0de2ece:	2f23      	cmp	r7, #35	@ 0x23
c0de2ed0:	d048      	beq.n	c0de2f64 <io_legacy_apdu_rx+0x178>
c0de2ed2:	2f30      	cmp	r7, #48	@ 0x30
c0de2ed4:	d053      	beq.n	c0de2f7e <io_legacy_apdu_rx+0x192>
c0de2ed6:	f8df 815c 	ldr.w	r8, [pc, #348]	@ c0de3034 <io_legacy_apdu_rx+0x248>
c0de2eda:	2f20      	cmp	r7, #32
c0de2edc:	eb09 0008 	add.w	r0, r9, r8
c0de2ee0:	d16d      	bne.n	c0de2fbe <io_legacy_apdu_rx+0x1d2>
c0de2ee2:	2701      	movs	r7, #1
c0de2ee4:	eb09 0106 	add.w	r1, r9, r6
c0de2ee8:	1e65      	subs	r5, r4, #1
c0de2eea:	7187      	strb	r7, [r0, #6]
c0de2eec:	4850      	ldr	r0, [pc, #320]	@ (c0de3030 <io_legacy_apdu_rx+0x244>)
c0de2eee:	3101      	adds	r1, #1
c0de2ef0:	462a      	mov	r2, r5
c0de2ef2:	4448      	add	r0, r9
c0de2ef4:	f008 f918 	bl	c0deb128 <__aeabi_memcpy>
c0de2ef8:	484f      	ldr	r0, [pc, #316]	@ (c0de3038 <io_legacy_apdu_rx+0x24c>)
c0de2efa:	f809 7000 	strb.w	r7, [r9, r0]
c0de2efe:	2008      	movs	r0, #8
c0de2f00:	f809 0008 	strb.w	r0, [r9, r8]
c0de2f04:	e086      	b.n	c0de3014 <io_legacy_apdu_rx+0x228>
c0de2f06:	484a      	ldr	r0, [pc, #296]	@ (c0de3030 <io_legacy_apdu_rx+0x244>)
c0de2f08:	2155      	movs	r1, #85	@ 0x55
c0de2f0a:	2202      	movs	r2, #2
c0de2f0c:	2300      	movs	r3, #0
c0de2f0e:	f809 1000 	strb.w	r1, [r9, r0]
c0de2f12:	eb09 0100 	add.w	r1, r9, r0
c0de2f16:	2015      	movs	r0, #21
c0de2f18:	7048      	strb	r0, [r1, #1]
c0de2f1a:	eb09 0007 	add.w	r0, r9, r7
c0de2f1e:	7840      	ldrb	r0, [r0, #1]
c0de2f20:	b004      	add	sp, #16
c0de2f22:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de2f26:	f007 bfb3 	b.w	c0deae90 <os_io_tx_cmd>
c0de2f2a:	4f44      	ldr	r7, [pc, #272]	@ (c0de303c <io_legacy_apdu_rx+0x250>)
c0de2f2c:	444e      	add	r6, r9
c0de2f2e:	3c01      	subs	r4, #1
c0de2f30:	1c71      	adds	r1, r6, #1
c0de2f32:	4622      	mov	r2, r4
c0de2f34:	eb09 0007 	add.w	r0, r9, r7
c0de2f38:	f008 f8f6 	bl	c0deb128 <__aeabi_memcpy>
c0de2f3c:	7870      	ldrb	r0, [r6, #1]
c0de2f3e:	281a      	cmp	r0, #26
c0de2f40:	d107      	bne.n	c0de2f52 <io_legacy_apdu_rx+0x166>
c0de2f42:	eb09 0007 	add.w	r0, r9, r7
c0de2f46:	4621      	mov	r1, r4
c0de2f48:	b004      	add	sp, #16
c0de2f4a:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de2f4e:	f7ff bee7 	b.w	c0de2d20 <io_process_itc_ux_event>
c0de2f52:	2d00      	cmp	r5, #0
c0de2f54:	d04a      	beq.n	c0de2fec <io_legacy_apdu_rx+0x200>
c0de2f56:	2000      	movs	r0, #0
c0de2f58:	2500      	movs	r5, #0
c0de2f5a:	f007 fa83 	bl	c0dea464 <io_event>
c0de2f5e:	e059      	b.n	c0de3014 <io_legacy_apdu_rx+0x228>
c0de2f60:	2004      	movs	r0, #4
c0de2f62:	e023      	b.n	c0de2fac <io_legacy_apdu_rx+0x1c0>
c0de2f64:	4f33      	ldr	r7, [pc, #204]	@ (c0de3034 <io_legacy_apdu_rx+0x248>)
c0de2f66:	2107      	movs	r1, #7
c0de2f68:	1e65      	subs	r5, r4, #1
c0de2f6a:	462a      	mov	r2, r5
c0de2f6c:	eb09 0007 	add.w	r0, r9, r7
c0de2f70:	7181      	strb	r1, [r0, #6]
c0de2f72:	482f      	ldr	r0, [pc, #188]	@ (c0de3030 <io_legacy_apdu_rx+0x244>)
c0de2f74:	f000 f886 	bl	c0de3084 <OUTLINED_FUNCTION_0>
c0de2f78:	482f      	ldr	r0, [pc, #188]	@ (c0de3038 <io_legacy_apdu_rx+0x24c>)
c0de2f7a:	2101      	movs	r1, #1
c0de2f7c:	e00f      	b.n	c0de2f9e <io_legacy_apdu_rx+0x1b2>
c0de2f7e:	2002      	movs	r0, #2
c0de2f80:	e014      	b.n	c0de2fac <io_legacy_apdu_rx+0x1c0>
c0de2f82:	2006      	movs	r0, #6
c0de2f84:	e012      	b.n	c0de2fac <io_legacy_apdu_rx+0x1c0>
c0de2f86:	4f2b      	ldr	r7, [pc, #172]	@ (c0de3034 <io_legacy_apdu_rx+0x248>)
c0de2f88:	2103      	movs	r1, #3
c0de2f8a:	1e65      	subs	r5, r4, #1
c0de2f8c:	462a      	mov	r2, r5
c0de2f8e:	eb09 0007 	add.w	r0, r9, r7
c0de2f92:	7181      	strb	r1, [r0, #6]
c0de2f94:	4826      	ldr	r0, [pc, #152]	@ (c0de3030 <io_legacy_apdu_rx+0x244>)
c0de2f96:	f000 f875 	bl	c0de3084 <OUTLINED_FUNCTION_0>
c0de2f9a:	4827      	ldr	r0, [pc, #156]	@ (c0de3038 <io_legacy_apdu_rx+0x24c>)
c0de2f9c:	2102      	movs	r1, #2
c0de2f9e:	f809 1000 	strb.w	r1, [r9, r0]
c0de2fa2:	200a      	movs	r0, #10
c0de2fa4:	f809 0007 	strb.w	r0, [r9, r7]
c0de2fa8:	e034      	b.n	c0de3014 <io_legacy_apdu_rx+0x228>
c0de2faa:	2005      	movs	r0, #5
c0de2fac:	4921      	ldr	r1, [pc, #132]	@ (c0de3034 <io_legacy_apdu_rx+0x248>)
c0de2fae:	1e65      	subs	r5, r4, #1
c0de2fb0:	462a      	mov	r2, r5
c0de2fb2:	4449      	add	r1, r9
c0de2fb4:	7188      	strb	r0, [r1, #6]
c0de2fb6:	481e      	ldr	r0, [pc, #120]	@ (c0de3030 <io_legacy_apdu_rx+0x244>)
c0de2fb8:	f000 f864 	bl	c0de3084 <OUTLINED_FUNCTION_0>
c0de2fbc:	e02a      	b.n	c0de3014 <io_legacy_apdu_rx+0x228>
c0de2fbe:	2100      	movs	r1, #0
c0de2fc0:	1e65      	subs	r5, r4, #1
c0de2fc2:	7181      	strb	r1, [r0, #6]
c0de2fc4:	481a      	ldr	r0, [pc, #104]	@ (c0de3030 <io_legacy_apdu_rx+0x244>)
c0de2fc6:	eb09 0106 	add.w	r1, r9, r6
c0de2fca:	462a      	mov	r2, r5
c0de2fcc:	3101      	adds	r1, #1
c0de2fce:	4448      	add	r0, r9
c0de2fd0:	f008 f8aa 	bl	c0deb128 <__aeabi_memcpy>
c0de2fd4:	2f25      	cmp	r7, #37	@ 0x25
c0de2fd6:	d015      	beq.n	c0de3004 <io_legacy_apdu_rx+0x218>
c0de2fd8:	2f24      	cmp	r7, #36	@ 0x24
c0de2fda:	d11b      	bne.n	c0de3014 <io_legacy_apdu_rx+0x228>
c0de2fdc:	200b      	movs	r0, #11
c0de2fde:	2101      	movs	r1, #1
c0de2fe0:	f809 0008 	strb.w	r0, [r9, r8]
c0de2fe4:	4814      	ldr	r0, [pc, #80]	@ (c0de3038 <io_legacy_apdu_rx+0x24c>)
c0de2fe6:	f809 1000 	strb.w	r1, [r9, r0]
c0de2fea:	e013      	b.n	c0de3014 <io_legacy_apdu_rx+0x228>
c0de2fec:	f819 0007 	ldrb.w	r0, [r9, r7]
c0de2ff0:	2815      	cmp	r0, #21
c0de2ff2:	d8b0      	bhi.n	c0de2f56 <io_legacy_apdu_rx+0x16a>
c0de2ff4:	2101      	movs	r1, #1
c0de2ff6:	fa01 f000 	lsl.w	r0, r1, r0
c0de2ffa:	4911      	ldr	r1, [pc, #68]	@ (c0de3040 <io_legacy_apdu_rx+0x254>)
c0de2ffc:	4208      	tst	r0, r1
c0de2ffe:	d0aa      	beq.n	c0de2f56 <io_legacy_apdu_rx+0x16a>
c0de3000:	2500      	movs	r5, #0
c0de3002:	e007      	b.n	c0de3014 <io_legacy_apdu_rx+0x228>
c0de3004:	200c      	movs	r0, #12
c0de3006:	2101      	movs	r1, #1
c0de3008:	f809 0008 	strb.w	r0, [r9, r8]
c0de300c:	480a      	ldr	r0, [pc, #40]	@ (c0de3038 <io_legacy_apdu_rx+0x24c>)
c0de300e:	f809 1000 	strb.w	r1, [r9, r0]
c0de3012:	4625      	mov	r5, r4
c0de3014:	4628      	mov	r0, r5
c0de3016:	b004      	add	sp, #16
c0de3018:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de301c:	20ff      	movs	r0, #255	@ 0xff
c0de301e:	f007 ff19 	bl	c0deae54 <os_sched_exit>
c0de3022:	bf00      	nop
c0de3024:	00001608 	.word	0x00001608
c0de3028:	007f0001 	.word	0x007f0001
c0de302c:	00001728 	.word	0x00001728
c0de3030:	000014f7 	.word	0x000014f7
c0de3034:	0000171c 	.word	0x0000171c
c0de3038:	00001e20 	.word	0x00001e20
c0de303c:	00001cec 	.word	0x00001cec
c0de3040:	00205020 	.word	0x00205020

c0de3044 <io_seproxyhal_init>:
c0de3044:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de3046:	b089      	sub	sp, #36	@ 0x24
c0de3048:	4d0c      	ldr	r5, [pc, #48]	@ (c0de307c <io_seproxyhal_init+0x38>)
c0de304a:	2600      	movs	r6, #0
c0de304c:	466c      	mov	r4, sp
c0de304e:	2118      	movs	r1, #24
c0de3050:	eb09 0005 	add.w	r0, r9, r5
c0de3054:	7046      	strb	r6, [r0, #1]
c0de3056:	4620      	mov	r0, r4
c0de3058:	f008 f870 	bl	c0deb13c <__aeabi_memclr>
c0de305c:	4808      	ldr	r0, [pc, #32]	@ (c0de3080 <io_seproxyhal_init+0x3c>)
c0de305e:	2701      	movs	r7, #1
c0de3060:	f88d 601e 	strb.w	r6, [sp, #30]
c0de3064:	f8ad 7020 	strh.w	r7, [sp, #32]
c0de3068:	f8ad 701c 	strh.w	r7, [sp, #28]
c0de306c:	9006      	str	r0, [sp, #24]
c0de306e:	4620      	mov	r0, r4
c0de3070:	f007 fefa 	bl	c0deae68 <os_io_init>
c0de3074:	f809 7005 	strb.w	r7, [r9, r5]
c0de3078:	b009      	add	sp, #36	@ 0x24
c0de307a:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de307c:	00001728 	.word	0x00001728
c0de3080:	00020015 	.word	0x00020015

c0de3084 <OUTLINED_FUNCTION_0>:
c0de3084:	eb09 0106 	add.w	r1, r9, r6
c0de3088:	3101      	adds	r1, #1
c0de308a:	4448      	add	r0, r9
c0de308c:	f008 b84c 	b.w	c0deb128 <__aeabi_memcpy>

c0de3090 <layoutAddCallbackObj>:
c0de3090:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de3092:	f890 40ad 	ldrb.w	r4, [r0, #173]	@ 0xad
c0de3096:	f890 50ae 	ldrb.w	r5, [r0, #174]	@ 0xae
c0de309a:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de309e:	f3c4 2505 	ubfx	r5, r4, #8, #6
c0de30a2:	2d0e      	cmp	r5, #14
c0de30a4:	bf84      	itt	hi
c0de30a6:	2000      	movhi	r0, #0
c0de30a8:	bdf0      	pophi	{r4, r5, r6, r7, pc}
c0de30aa:	0a26      	lsrs	r6, r4, #8
c0de30ac:	f404 4740 	and.w	r7, r4, #49152	@ 0xc000
c0de30b0:	f880 40ad 	strb.w	r4, [r0, #173]	@ 0xad
c0de30b4:	3601      	adds	r6, #1
c0de30b6:	f006 063f 	and.w	r6, r6, #63	@ 0x3f
c0de30ba:	ea47 2606 	orr.w	r6, r7, r6, lsl #8
c0de30be:	0a36      	lsrs	r6, r6, #8
c0de30c0:	f880 60ae 	strb.w	r6, [r0, #174]	@ 0xae
c0de30c4:	eb00 00c5 	add.w	r0, r0, r5, lsl #3
c0de30c8:	f840 1f20 	str.w	r1, [r0, #32]!
c0de30cc:	7102      	strb	r2, [r0, #4]
c0de30ce:	7183      	strb	r3, [r0, #6]
c0de30d0:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

c0de30d4 <nbgl_layoutGet>:
c0de30d4:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de30d8:	b085      	sub	sp, #20
c0de30da:	4604      	mov	r4, r0
c0de30dc:	7800      	ldrb	r0, [r0, #0]
c0de30de:	b190      	cbz	r0, c0de3106 <nbgl_layoutGet+0x32>
c0de30e0:	486c      	ldr	r0, [pc, #432]	@ (c0de3294 <nbgl_layoutGet+0x1c0>)
c0de30e2:	496d      	ldr	r1, [pc, #436]	@ (c0de3298 <nbgl_layoutGet+0x1c4>)
c0de30e4:	2500      	movs	r5, #0
c0de30e6:	b158      	cbz	r0, c0de3100 <nbgl_layoutGet+0x2c>
c0de30e8:	eb09 0201 	add.w	r2, r9, r1
c0de30ec:	4402      	add	r2, r0
c0de30ee:	f892 32ca 	ldrb.w	r3, [r2, #714]	@ 0x2ca
c0de30f2:	021b      	lsls	r3, r3, #8
c0de30f4:	045b      	lsls	r3, r3, #17
c0de30f6:	bf58      	it	pl
c0de30f8:	f502 7507 	addpl.w	r5, r2, #540	@ 0x21c
c0de30fc:	30b4      	adds	r0, #180	@ 0xb4
c0de30fe:	e7f2      	b.n	c0de30e6 <nbgl_layoutGet+0x12>
c0de3100:	b975      	cbnz	r5, c0de3120 <nbgl_layoutGet+0x4c>
c0de3102:	2500      	movs	r5, #0
c0de3104:	e0c1      	b.n	c0de328a <nbgl_layoutGet+0x1b6>
c0de3106:	4965      	ldr	r1, [pc, #404]	@ (c0de329c <nbgl_layoutGet+0x1c8>)
c0de3108:	4863      	ldr	r0, [pc, #396]	@ (c0de3298 <nbgl_layoutGet+0x1c4>)
c0de310a:	eb09 0201 	add.w	r2, r9, r1
c0de310e:	6852      	ldr	r2, [r2, #4]
c0de3110:	b112      	cbz	r2, c0de3118 <nbgl_layoutGet+0x44>
c0de3112:	eb09 0500 	add.w	r5, r9, r0
c0de3116:	e003      	b.n	c0de3120 <nbgl_layoutGet+0x4c>
c0de3118:	eb09 0500 	add.w	r5, r9, r0
c0de311c:	4449      	add	r1, r9
c0de311e:	604d      	str	r5, [r1, #4]
c0de3120:	4e5d      	ldr	r6, [pc, #372]	@ (c0de3298 <nbgl_layoutGet+0x1c4>)
c0de3122:	4628      	mov	r0, r5
c0de3124:	21b4      	movs	r1, #180	@ 0xb4
c0de3126:	f859 7006 	ldr.w	r7, [r9, r6]
c0de312a:	f008 f807 	bl	c0deb13c <__aeabi_memclr>
c0de312e:	7820      	ldrb	r0, [r4, #0]
c0de3130:	b150      	cbz	r0, c0de3148 <nbgl_layoutGet+0x74>
c0de3132:	485a      	ldr	r0, [pc, #360]	@ (c0de329c <nbgl_layoutGet+0x1c8>)
c0de3134:	4448      	add	r0, r9
c0de3136:	6841      	ldr	r1, [r0, #4]
c0de3138:	2900      	cmp	r1, #0
c0de313a:	bf08      	it	eq
c0de313c:	eb09 0106 	addeq.w	r1, r9, r6
c0de3140:	600d      	str	r5, [r1, #0]
c0de3142:	6069      	str	r1, [r5, #4]
c0de3144:	6045      	str	r5, [r0, #4]
c0de3146:	e001      	b.n	c0de314c <nbgl_layoutGet+0x78>
c0de3148:	f849 7006 	str.w	r7, [r9, r6]
c0de314c:	4853      	ldr	r0, [pc, #332]	@ (c0de329c <nbgl_layoutGet+0x1c8>)
c0de314e:	2100      	movs	r1, #0
c0de3150:	f809 1000 	strb.w	r1, [r9, r0]
c0de3154:	68e0      	ldr	r0, [r4, #12]
c0de3156:	f007 fdcf 	bl	c0deacf8 <pic>
c0de315a:	4629      	mov	r1, r5
c0de315c:	7826      	ldrb	r6, [r4, #0]
c0de315e:	f811 2fad 	ldrb.w	r2, [r1, #173]!
c0de3162:	784b      	ldrb	r3, [r1, #1]
c0de3164:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de3168:	f022 0201 	bic.w	r2, r2, #1
c0de316c:	4332      	orrs	r2, r6
c0de316e:	700a      	strb	r2, [r1, #0]
c0de3170:	f002 02fd 	and.w	r2, r2, #253	@ 0xfd
c0de3174:	7866      	ldrb	r6, [r4, #1]
c0de3176:	f841 0c91 	str.w	r0, [r1, #-145]
c0de317a:	704b      	strb	r3, [r1, #1]
c0de317c:	f1a1 00a5 	sub.w	r0, r1, #165	@ 0xa5
c0de3180:	ea42 0246 	orr.w	r2, r2, r6, lsl #1
c0de3184:	700a      	strb	r2, [r1, #0]
c0de3186:	f104 0210 	add.w	r2, r4, #16
c0de318a:	7821      	ldrb	r1, [r4, #0]
c0de318c:	4b44      	ldr	r3, [pc, #272]	@ (c0de32a0 <nbgl_layoutGet+0x1cc>)
c0de318e:	447b      	add	r3, pc
c0de3190:	b159      	cbz	r1, c0de31aa <nbgl_layoutGet+0xd6>
c0de3192:	2106      	movs	r1, #6
c0de3194:	f007 fbb6 	bl	c0dea904 <nbgl_screenPush>
c0de3198:	f895 10ad 	ldrb.w	r1, [r5, #173]	@ 0xad
c0de319c:	f895 20ae 	ldrb.w	r2, [r5, #174]	@ 0xae
c0de31a0:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de31a4:	f360 01c7 	bfi	r1, r0, #3, #5
c0de31a8:	e00a      	b.n	c0de31c0 <nbgl_layoutGet+0xec>
c0de31aa:	2106      	movs	r1, #6
c0de31ac:	f007 fba5 	bl	c0dea8fa <nbgl_screenSet>
c0de31b0:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de31b4:	f895 10ae 	ldrb.w	r1, [r5, #174]	@ 0xae
c0de31b8:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de31bc:	f020 01f8 	bic.w	r1, r0, #248	@ 0xf8
c0de31c0:	462f      	mov	r7, r5
c0de31c2:	0a08      	lsrs	r0, r1, #8
c0de31c4:	f04f 0a01 	mov.w	sl, #1
c0de31c8:	f807 1fad 	strb.w	r1, [r7, #173]!
c0de31cc:	7078      	strb	r0, [r7, #1]
c0de31ce:	b2c8      	uxtb	r0, r1
c0de31d0:	f003 fb69 	bl	c0de68a6 <OUTLINED_FUNCTION_16>
c0de31d4:	2102      	movs	r1, #2
c0de31d6:	f04f 0800 	mov.w	r8, #0
c0de31da:	f880 a005 	strb.w	sl, [r0, #5]
c0de31de:	71c1      	strb	r1, [r0, #7]
c0de31e0:	2158      	movs	r1, #88	@ 0x58
c0de31e2:	f880 801f 	strb.w	r8, [r0, #31]
c0de31e6:	7181      	strb	r1, [r0, #6]
c0de31e8:	21e0      	movs	r1, #224	@ 0xe0
c0de31ea:	7101      	strb	r1, [r0, #4]
c0de31ec:	f847 0c0d 	str.w	r0, [r7, #-13]
c0de31f0:	7838      	ldrb	r0, [r7, #0]
c0de31f2:	08c1      	lsrs	r1, r0, #3
c0de31f4:	2014      	movs	r0, #20
c0de31f6:	f007 fba3 	bl	c0dea940 <nbgl_containerPoolGet>
c0de31fa:	f857 2c0d 	ldr.w	r2, [r7, #-13]
c0de31fe:	0a03      	lsrs	r3, r0, #8
c0de3200:	f857 1ca5 	ldr.w	r1, [r7, #-165]
c0de3204:	0e06      	lsrs	r6, r0, #24
c0de3206:	f882 3023 	strb.w	r3, [r2, #35]	@ 0x23
c0de320a:	4613      	mov	r3, r2
c0de320c:	f882 a016 	strb.w	sl, [r2, #22]
c0de3210:	f803 0f22 	strb.w	r0, [r3, #34]!
c0de3214:	0c00      	lsrs	r0, r0, #16
c0de3216:	70de      	strb	r6, [r3, #3]
c0de3218:	7098      	strb	r0, [r3, #2]
c0de321a:	604a      	str	r2, [r1, #4]
c0de321c:	7838      	ldrb	r0, [r7, #0]
c0de321e:	7879      	ldrb	r1, [r7, #1]
c0de3220:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de3224:	f440 4180 	orr.w	r1, r0, #16384	@ 0x4000
c0de3228:	0a0a      	lsrs	r2, r1, #8
c0de322a:	707a      	strb	r2, [r7, #1]
c0de322c:	6862      	ldr	r2, [r4, #4]
c0de322e:	b362      	cbz	r2, c0de328a <nbgl_layoutGet+0x1b6>
c0de3230:	eb0a 2210 	add.w	r2, sl, r0, lsr #8
c0de3234:	f885 10ad 	strb.w	r1, [r5, #173]	@ 0xad
c0de3238:	f401 4140 	and.w	r1, r1, #49152	@ 0xc000
c0de323c:	f3c0 2005 	ubfx	r0, r0, #8, #6
c0de3240:	f002 023f 	and.w	r2, r2, #63	@ 0x3f
c0de3244:	eb05 00c0 	add.w	r0, r5, r0, lsl #3
c0de3248:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de324c:	2204      	movs	r2, #4
c0de324e:	0a09      	lsrs	r1, r1, #8
c0de3250:	f885 10ae 	strb.w	r1, [r5, #174]	@ 0xae
c0de3254:	f8d5 10a0 	ldr.w	r1, [r5, #160]	@ 0xa0
c0de3258:	6201      	str	r1, [r0, #32]
c0de325a:	f881 801d 	strb.w	r8, [r1, #29]
c0de325e:	f881 a01c 	strb.w	sl, [r1, #28]
c0de3262:	778a      	strb	r2, [r1, #30]
c0de3264:	7a21      	ldrb	r1, [r4, #8]
c0de3266:	7a63      	ldrb	r3, [r4, #9]
c0de3268:	f880 3026 	strb.w	r3, [r0, #38]	@ 0x26
c0de326c:	f880 1024 	strb.w	r1, [r0, #36]	@ 0x24
c0de3270:	f88d 2000 	strb.w	r2, [sp]
c0de3274:	6860      	ldr	r0, [r4, #4]
c0de3276:	f007 fd3f 	bl	c0deacf8 <pic>
c0de327a:	9001      	str	r0, [sp, #4]
c0de327c:	8920      	ldrh	r0, [r4, #8]
c0de327e:	4669      	mov	r1, sp
c0de3280:	f8ad 0008 	strh.w	r0, [sp, #8]
c0de3284:	4628      	mov	r0, r5
c0de3286:	f000 f981 	bl	c0de358c <nbgl_layoutAddUpFooter>
c0de328a:	4628      	mov	r0, r5
c0de328c:	b005      	add	sp, #20
c0de328e:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de3292:	bf00      	nop
c0de3294:	fffffe98 	.word	0xfffffe98
c0de3298:	0000172c 	.word	0x0000172c
c0de329c:	00001948 	.word	0x00001948
c0de32a0:	00000113 	.word	0x00000113

c0de32a4 <touchCallback>:
c0de32a4:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de32a8:	2800      	cmp	r0, #0
c0de32aa:	f000 816d 	beq.w	c0de3588 <touchCallback+0x2e4>
c0de32ae:	460d      	mov	r5, r1
c0de32b0:	a901      	add	r1, sp, #4
c0de32b2:	466a      	mov	r2, sp
c0de32b4:	4604      	mov	r4, r0
c0de32b6:	f003 f965 	bl	c0de6584 <getLayoutAndLayoutObj>
c0de32ba:	b968      	cbnz	r0, c0de32d8 <touchCallback+0x34>
c0de32bc:	4620      	mov	r0, r4
c0de32be:	f810 1f0e 	ldrb.w	r1, [r0, #14]!
c0de32c2:	f003 fad1 	bl	c0de6868 <OUTLINED_FUNCTION_14>
c0de32c6:	466a      	mov	r2, sp
c0de32c8:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de32cc:	a901      	add	r1, sp, #4
c0de32ce:	f003 f959 	bl	c0de6584 <getLayoutAndLayoutObj>
c0de32d2:	2800      	cmp	r0, #0
c0de32d4:	f000 8158 	beq.w	c0de3588 <touchCallback+0x2e4>
c0de32d8:	1fe8      	subs	r0, r5, #7
c0de32da:	b2c0      	uxtb	r0, r0
c0de32dc:	2803      	cmp	r0, #3
c0de32de:	d833      	bhi.n	c0de3348 <touchCallback+0xa4>
c0de32e0:	7ee0      	ldrb	r0, [r4, #27]
c0de32e2:	2801      	cmp	r0, #1
c0de32e4:	d130      	bne.n	c0de3348 <touchCallback+0xa4>
c0de32e6:	9901      	ldr	r1, [sp, #4]
c0de32e8:	4628      	mov	r0, r5
c0de32ea:	f891 20b0 	ldrb.w	r2, [r1, #176]	@ 0xb0
c0de32ee:	2a01      	cmp	r2, #1
c0de32f0:	d028      	beq.n	c0de3344 <touchCallback+0xa0>
c0de32f2:	bb4a      	cbnz	r2, c0de3348 <touchCallback+0xa4>
c0de32f4:	f8d1 00a0 	ldr.w	r0, [r1, #160]	@ 0xa0
c0de32f8:	42a0      	cmp	r0, r4
c0de32fa:	d125      	bne.n	c0de3348 <touchCallback+0xa4>
c0de32fc:	f891 00ab 	ldrb.w	r0, [r1, #171]	@ 0xab
c0de3300:	2803      	cmp	r0, #3
c0de3302:	d005      	beq.n	c0de3310 <touchCallback+0x6c>
c0de3304:	2804      	cmp	r0, #4
c0de3306:	f040 813f 	bne.w	c0de3588 <touchCallback+0x2e4>
c0de330a:	f101 0010 	add.w	r0, r1, #16
c0de330e:	e00c      	b.n	c0de332a <touchCallback+0x86>
c0de3310:	6908      	ldr	r0, [r1, #16]
c0de3312:	f810 2f22 	ldrb.w	r2, [r0, #34]!
c0de3316:	7843      	ldrb	r3, [r0, #1]
c0de3318:	7886      	ldrb	r6, [r0, #2]
c0de331a:	78c0      	ldrb	r0, [r0, #3]
c0de331c:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de3320:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de3324:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de3328:	3004      	adds	r0, #4
c0de332a:	f101 06a9 	add.w	r6, r1, #169	@ 0xa9
c0de332e:	f891 20a8 	ldrb.w	r2, [r1, #168]	@ 0xa8
c0de3332:	6800      	ldr	r0, [r0, #0]
c0de3334:	4629      	mov	r1, r5
c0de3336:	4633      	mov	r3, r6
c0de3338:	f003 fccc 	bl	c0de6cd4 <layoutNavigationCallback>
c0de333c:	2800      	cmp	r0, #0
c0de333e:	f000 8123 	beq.w	c0de3588 <touchCallback+0x2e4>
c0de3342:	7830      	ldrb	r0, [r6, #0]
c0de3344:	9900      	ldr	r1, [sp, #0]
c0de3346:	7148      	strb	r0, [r1, #5]
c0de3348:	4620      	mov	r0, r4
c0de334a:	9f01      	ldr	r7, [sp, #4]
c0de334c:	f810 1f0e 	ldrb.w	r1, [r0, #14]!
c0de3350:	f003 fc15 	bl	c0de6b7e <OUTLINED_FUNCTION_53>
c0de3354:	6938      	ldr	r0, [r7, #16]
c0de3356:	4281      	cmp	r1, r0
c0de3358:	d103      	bne.n	c0de3362 <touchCallback+0xbe>
c0de335a:	f897 20ab 	ldrb.w	r2, [r7, #171]	@ 0xab
c0de335e:	2a04      	cmp	r2, #4
c0de3360:	d00c      	beq.n	c0de337c <touchCallback+0xd8>
c0de3362:	7eca      	ldrb	r2, [r1, #27]
c0de3364:	2a01      	cmp	r2, #1
c0de3366:	d118      	bne.n	c0de339a <touchCallback+0xf6>
c0de3368:	f811 2f0e 	ldrb.w	r2, [r1, #14]!
c0de336c:	f003 fa53 	bl	c0de6816 <OUTLINED_FUNCTION_11>
c0de3370:	4281      	cmp	r1, r0
c0de3372:	d112      	bne.n	c0de339a <touchCallback+0xf6>
c0de3374:	f897 00ab 	ldrb.w	r0, [r7, #171]	@ 0xab
c0de3378:	2803      	cmp	r0, #3
c0de337a:	d10e      	bne.n	c0de339a <touchCallback+0xf6>
c0de337c:	f107 06a9 	add.w	r6, r7, #169	@ 0xa9
c0de3380:	f897 20a8 	ldrb.w	r2, [r7, #168]	@ 0xa8
c0de3384:	4620      	mov	r0, r4
c0de3386:	4629      	mov	r1, r5
c0de3388:	4633      	mov	r3, r6
c0de338a:	f003 fca3 	bl	c0de6cd4 <layoutNavigationCallback>
c0de338e:	2800      	cmp	r0, #0
c0de3390:	f000 80fa 	beq.w	c0de3588 <touchCallback+0x2e4>
c0de3394:	7830      	ldrb	r0, [r6, #0]
c0de3396:	9900      	ldr	r1, [sp, #0]
c0de3398:	7148      	strb	r0, [r1, #5]
c0de339a:	7ee0      	ldrb	r0, [r4, #27]
c0de339c:	2801      	cmp	r0, #1
c0de339e:	f040 809b 	bne.w	c0de34d8 <touchCallback+0x234>
c0de33a2:	f894 0020 	ldrb.w	r0, [r4, #32]
c0de33a6:	2802      	cmp	r0, #2
c0de33a8:	f0c0 8096 	bcc.w	c0de34d8 <touchCallback+0x234>
c0de33ac:	4621      	mov	r1, r4
c0de33ae:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de33b2:	f003 fa30 	bl	c0de6816 <OUTLINED_FUNCTION_11>
c0de33b6:	684e      	ldr	r6, [r1, #4]
c0de33b8:	b196      	cbz	r6, c0de33e0 <touchCallback+0x13c>
c0de33ba:	7ef1      	ldrb	r1, [r6, #27]
c0de33bc:	2906      	cmp	r1, #6
c0de33be:	d10f      	bne.n	c0de33e0 <touchCallback+0x13c>
c0de33c0:	f896 0021 	ldrb.w	r0, [r6, #33]	@ 0x21
c0de33c4:	3801      	subs	r0, #1
c0de33c6:	bf18      	it	ne
c0de33c8:	2001      	movne	r0, #1
c0de33ca:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de33ce:	4630      	mov	r0, r6
c0de33d0:	f007 fa89 	bl	c0dea8e6 <nbgl_objDraw>
c0de33d4:	f896 0021 	ldrb.w	r0, [r6, #33]	@ 0x21
c0de33d8:	9900      	ldr	r1, [sp, #0]
c0de33da:	2401      	movs	r4, #1
c0de33dc:	7148      	strb	r0, [r1, #5]
c0de33de:	e07c      	b.n	c0de34da <touchCallback+0x236>
c0de33e0:	2804      	cmp	r0, #4
c0de33e2:	d060      	beq.n	c0de34a6 <touchCallback+0x202>
c0de33e4:	2802      	cmp	r0, #2
c0de33e6:	d177      	bne.n	c0de34d8 <touchCallback+0x234>
c0de33e8:	f003 fb68 	bl	c0de6abc <OUTLINED_FUNCTION_40>
c0de33ec:	6840      	ldr	r0, [r0, #4]
c0de33ee:	2800      	cmp	r0, #0
c0de33f0:	d072      	beq.n	c0de34d8 <touchCallback+0x234>
c0de33f2:	7ec0      	ldrb	r0, [r0, #27]
c0de33f4:	2809      	cmp	r0, #9
c0de33f6:	d16f      	bne.n	c0de34d8 <touchCallback+0x234>
c0de33f8:	2d00      	cmp	r5, #0
c0de33fa:	f040 80c5 	bne.w	c0de3588 <touchCallback+0x2e4>
c0de33fe:	f04f 0aff 	mov.w	sl, #255	@ 0xff
c0de3402:	2500      	movs	r5, #0
c0de3404:	f04f 0800 	mov.w	r8, #0
c0de3408:	f897 10ae 	ldrb.w	r1, [r7, #174]	@ 0xae
c0de340c:	fa5f f088 	uxtb.w	r0, r8
c0de3410:	f001 013f 	and.w	r1, r1, #63	@ 0x3f
c0de3414:	4281      	cmp	r1, r0
c0de3416:	d977      	bls.n	c0de3508 <touchCallback+0x264>
c0de3418:	eb07 00c0 	add.w	r0, r7, r0, lsl #3
c0de341c:	6a00      	ldr	r0, [r0, #32]
c0de341e:	42a0      	cmp	r0, r4
c0de3420:	d117      	bne.n	c0de3452 <touchCallback+0x1ae>
c0de3422:	7ee1      	ldrb	r1, [r4, #27]
c0de3424:	2901      	cmp	r1, #1
c0de3426:	d114      	bne.n	c0de3452 <touchCallback+0x1ae>
c0de3428:	4620      	mov	r0, r4
c0de342a:	46ab      	mov	fp, r5
c0de342c:	46c2      	mov	sl, r8
c0de342e:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de3432:	f003 fa19 	bl	c0de6868 <OUTLINED_FUNCTION_14>
c0de3436:	220c      	movs	r2, #12
c0de3438:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de343c:	e9d0 1000 	ldrd	r1, r0, [r0]
c0de3440:	f881 2022 	strb.w	r2, [r1, #34]	@ 0x22
c0de3444:	2200      	movs	r2, #0
c0de3446:	77ca      	strb	r2, [r1, #31]
c0de3448:	2101      	movs	r1, #1
c0de344a:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de344e:	4620      	mov	r0, r4
c0de3450:	e024      	b.n	c0de349c <touchCallback+0x1f8>
c0de3452:	7ec1      	ldrb	r1, [r0, #27]
c0de3454:	2901      	cmp	r1, #1
c0de3456:	d123      	bne.n	c0de34a0 <touchCallback+0x1fc>
c0de3458:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de345c:	2902      	cmp	r1, #2
c0de345e:	d11f      	bne.n	c0de34a0 <touchCallback+0x1fc>
c0de3460:	4601      	mov	r1, r0
c0de3462:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de3466:	784b      	ldrb	r3, [r1, #1]
c0de3468:	788e      	ldrb	r6, [r1, #2]
c0de346a:	78c9      	ldrb	r1, [r1, #3]
c0de346c:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de3470:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de3474:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
c0de3478:	6851      	ldr	r1, [r2, #4]
c0de347a:	7ecb      	ldrb	r3, [r1, #27]
c0de347c:	2b09      	cmp	r3, #9
c0de347e:	d10f      	bne.n	c0de34a0 <touchCallback+0x1fc>
c0de3480:	f891 3021 	ldrb.w	r3, [r1, #33]	@ 0x21
c0de3484:	3501      	adds	r5, #1
c0de3486:	2b01      	cmp	r3, #1
c0de3488:	d10a      	bne.n	c0de34a0 <touchCallback+0x1fc>
c0de348a:	6812      	ldr	r2, [r2, #0]
c0de348c:	230b      	movs	r3, #11
c0de348e:	f882 3022 	strb.w	r3, [r2, #34]	@ 0x22
c0de3492:	2301      	movs	r3, #1
c0de3494:	77d3      	strb	r3, [r2, #31]
c0de3496:	2200      	movs	r2, #0
c0de3498:	f881 2021 	strb.w	r2, [r1, #33]	@ 0x21
c0de349c:	f007 fa23 	bl	c0dea8e6 <nbgl_objDraw>
c0de34a0:	f108 0801 	add.w	r8, r8, #1
c0de34a4:	e7b0      	b.n	c0de3408 <touchCallback+0x164>
c0de34a6:	f003 fb09 	bl	c0de6abc <OUTLINED_FUNCTION_40>
c0de34aa:	68c6      	ldr	r6, [r0, #12]
c0de34ac:	b1a6      	cbz	r6, c0de34d8 <touchCallback+0x234>
c0de34ae:	7ef0      	ldrb	r0, [r6, #27]
c0de34b0:	2808      	cmp	r0, #8
c0de34b2:	d111      	bne.n	c0de34d8 <touchCallback+0x234>
c0de34b4:	2d0a      	cmp	r5, #10
c0de34b6:	d867      	bhi.n	c0de3588 <touchCallback+0x2e4>
c0de34b8:	2001      	movs	r0, #1
c0de34ba:	40a8      	lsls	r0, r5
c0de34bc:	f410 6fc5 	tst.w	r0, #1576	@ 0x628
c0de34c0:	d039      	beq.n	c0de3536 <touchCallback+0x292>
c0de34c2:	f007 fc49 	bl	c0dead58 <nbgl_wait_pipeline>
c0de34c6:	2000      	movs	r0, #0
c0de34c8:	f003 faed 	bl	c0de6aa6 <OUTLINED_FUNCTION_39>
c0de34cc:	2003      	movs	r0, #3
c0de34ce:	2100      	movs	r1, #0
c0de34d0:	e8bd 4dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de34d4:	f007 b9fd 	b.w	c0dea8d2 <nbgl_refreshSpecialWithPostRefresh>
c0de34d8:	2400      	movs	r4, #0
c0de34da:	69f8      	ldr	r0, [r7, #28]
c0de34dc:	2800      	cmp	r0, #0
c0de34de:	d053      	beq.n	c0de3588 <touchCallback+0x2e4>
c0de34e0:	9d00      	ldr	r5, [sp, #0]
c0de34e2:	7928      	ldrb	r0, [r5, #4]
c0de34e4:	28ff      	cmp	r0, #255	@ 0xff
c0de34e6:	d04f      	beq.n	c0de3588 <touchCallback+0x2e4>
c0de34e8:	79a8      	ldrb	r0, [r5, #6]
c0de34ea:	280b      	cmp	r0, #11
c0de34ec:	bf98      	it	ls
c0de34ee:	f7ff fbea 	blls	c0de2cc6 <os_io_seph_cmd_piezo_play_tune>
c0de34f2:	b114      	cbz	r4, c0de34fa <touchCallback+0x256>
c0de34f4:	2001      	movs	r0, #1
c0de34f6:	f007 f9e7 	bl	c0dea8c8 <nbgl_refreshSpecial>
c0de34fa:	7928      	ldrb	r0, [r5, #4]
c0de34fc:	7969      	ldrb	r1, [r5, #5]
c0de34fe:	69fa      	ldr	r2, [r7, #28]
c0de3500:	b002      	add	sp, #8
c0de3502:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3506:	4710      	bx	r2
c0de3508:	fa5f f08a 	uxtb.w	r0, sl
c0de350c:	28ff      	cmp	r0, #255	@ 0xff
c0de350e:	d03b      	beq.n	c0de3588 <touchCallback+0x2e4>
c0de3510:	69f9      	ldr	r1, [r7, #28]
c0de3512:	b3c9      	cbz	r1, c0de3588 <touchCallback+0x2e4>
c0de3514:	eb07 04c0 	add.w	r4, r7, r0, lsl #3
c0de3518:	f894 0026 	ldrb.w	r0, [r4, #38]	@ 0x26
c0de351c:	280b      	cmp	r0, #11
c0de351e:	bf98      	it	ls
c0de3520:	f7ff fbd1 	blls	c0de2cc6 <os_io_seph_cmd_piezo_play_tune>
c0de3524:	2001      	movs	r0, #1
c0de3526:	f007 f9cf 	bl	c0dea8c8 <nbgl_refreshSpecial>
c0de352a:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de352e:	69fa      	ldr	r2, [r7, #28]
c0de3530:	fa5f f18b 	uxtb.w	r1, fp
c0de3534:	e7e4      	b.n	c0de3500 <touchCallback+0x25c>
c0de3536:	2d02      	cmp	r5, #2
c0de3538:	d126      	bne.n	c0de3588 <touchCallback+0x2e4>
c0de353a:	9d00      	ldr	r5, [sp, #0]
c0de353c:	4620      	mov	r0, r4
c0de353e:	f007 fa31 	bl	c0dea9a4 <nbgl_touchGetTouchDuration>
c0de3542:	f896 1021 	ldrb.w	r1, [r6, #33]	@ 0x21
c0de3546:	2200      	movs	r2, #0
c0de3548:	2300      	movs	r3, #0
c0de354a:	2964      	cmp	r1, #100	@ 0x64
c0de354c:	bf38      	it	cc
c0de354e:	2301      	movcc	r3, #1
c0de3550:	2464      	movs	r4, #100	@ 0x64
c0de3552:	fbb0 f0f4 	udiv	r0, r0, r4
c0de3556:	ebc0 00c0 	rsb	r0, r0, r0, lsl #3
c0de355a:	b2c4      	uxtb	r4, r0
c0de355c:	2c63      	cmp	r4, #99	@ 0x63
c0de355e:	bf88      	it	hi
c0de3560:	2201      	movhi	r2, #1
c0de3562:	ea02 0403 	and.w	r4, r2, r3
c0de3566:	bf88      	it	hi
c0de3568:	2064      	movhi	r0, #100	@ 0x64
c0de356a:	b2c2      	uxtb	r2, r0
c0de356c:	428a      	cmp	r2, r1
c0de356e:	d005      	beq.n	c0de357c <touchCallback+0x2d8>
c0de3570:	f003 fa99 	bl	c0de6aa6 <OUTLINED_FUNCTION_39>
c0de3574:	2004      	movs	r0, #4
c0de3576:	2102      	movs	r1, #2
c0de3578:	f007 f9ab 	bl	c0dea8d2 <nbgl_refreshSpecialWithPostRefresh>
c0de357c:	b124      	cbz	r4, c0de3588 <touchCallback+0x2e4>
c0de357e:	69fa      	ldr	r2, [r7, #28]
c0de3580:	b112      	cbz	r2, c0de3588 <touchCallback+0x2e4>
c0de3582:	7928      	ldrb	r0, [r5, #4]
c0de3584:	7969      	ldrb	r1, [r5, #5]
c0de3586:	e7bb      	b.n	c0de3500 <touchCallback+0x25c>
c0de3588:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de358c <nbgl_layoutAddUpFooter>:
c0de358c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3590:	2800      	cmp	r0, #0
c0de3592:	f000 827e 	beq.w	c0de3a92 <nbgl_layoutAddUpFooter+0x506>
c0de3596:	460d      	mov	r5, r1
c0de3598:	b119      	cbz	r1, c0de35a2 <nbgl_layoutAddUpFooter+0x16>
c0de359a:	4604      	mov	r4, r0
c0de359c:	7828      	ldrb	r0, [r5, #0]
c0de359e:	2804      	cmp	r0, #4
c0de35a0:	d903      	bls.n	c0de35aa <nbgl_layoutAddUpFooter+0x1e>
c0de35a2:	f06f 0001 	mvn.w	r0, #1
c0de35a6:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de35aa:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de35ae:	2601      	movs	r6, #1
c0de35b0:	f003 f979 	bl	c0de68a6 <OUTLINED_FUNCTION_16>
c0de35b4:	2100      	movs	r1, #0
c0de35b6:	7146      	strb	r6, [r0, #5]
c0de35b8:	77c1      	strb	r1, [r0, #31]
c0de35ba:	21e0      	movs	r1, #224	@ 0xe0
c0de35bc:	7101      	strb	r1, [r0, #4]
c0de35be:	6160      	str	r0, [r4, #20]
c0de35c0:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de35c4:	f003 fb1a 	bl	c0de6bfc <OUTLINED_FUNCTION_62>
c0de35c8:	6961      	ldr	r1, [r4, #20]
c0de35ca:	0a02      	lsrs	r2, r0, #8
c0de35cc:	f8d4 30a0 	ldr.w	r3, [r4, #160]	@ 0xa0
c0de35d0:	0e06      	lsrs	r6, r0, #24
c0de35d2:	f881 2023 	strb.w	r2, [r1, #35]	@ 0x23
c0de35d6:	2208      	movs	r2, #8
c0de35d8:	f003 fb3c 	bl	c0de6c54 <OUTLINED_FUNCTION_70>
c0de35dc:	4608      	mov	r0, r1
c0de35de:	70d6      	strb	r6, [r2, #3]
c0de35e0:	0e1a      	lsrs	r2, r3, #24
c0de35e2:	f800 3f12 	strb.w	r3, [r0, #18]!
c0de35e6:	70c2      	strb	r2, [r0, #3]
c0de35e8:	0c1a      	lsrs	r2, r3, #16
c0de35ea:	7082      	strb	r2, [r0, #2]
c0de35ec:	0a18      	lsrs	r0, r3, #8
c0de35ee:	74c8      	strb	r0, [r1, #19]
c0de35f0:	7828      	ldrb	r0, [r5, #0]
c0de35f2:	2804      	cmp	r0, #4
c0de35f4:	f000 80c6 	beq.w	c0de3784 <nbgl_layoutAddUpFooter+0x1f8>
c0de35f8:	2801      	cmp	r0, #1
c0de35fa:	f000 80f1 	beq.w	c0de37e0 <nbgl_layoutAddUpFooter+0x254>
c0de35fe:	2802      	cmp	r0, #2
c0de3600:	f000 8153 	beq.w	c0de38aa <nbgl_layoutAddUpFooter+0x31e>
c0de3604:	2803      	cmp	r0, #3
c0de3606:	f000 81df 	beq.w	c0de39c8 <nbgl_layoutAddUpFooter+0x43c>
c0de360a:	2800      	cmp	r0, #0
c0de360c:	d1c9      	bne.n	c0de35a2 <nbgl_layoutAddUpFooter+0x16>
c0de360e:	f003 fb13 	bl	c0de6c38 <OUTLINED_FUNCTION_67>
c0de3612:	2800      	cmp	r0, #0
c0de3614:	f000 823d 	beq.w	c0de3a92 <nbgl_layoutAddUpFooter+0x506>
c0de3618:	6960      	ldr	r0, [r4, #20]
c0de361a:	2104      	movs	r1, #4
c0de361c:	2700      	movs	r7, #0
c0de361e:	f04f 0806 	mov.w	r8, #6
c0de3622:	f880 1020 	strb.w	r1, [r0, #32]
c0de3626:	2112      	movs	r1, #18
c0de3628:	71c7      	strb	r7, [r0, #7]
c0de362a:	f880 801d 	strb.w	r8, [r0, #29]
c0de362e:	7781      	strb	r1, [r0, #30]
c0de3630:	2198      	movs	r1, #152	@ 0x98
c0de3632:	7181      	strb	r1, [r0, #6]
c0de3634:	212c      	movs	r1, #44	@ 0x2c
c0de3636:	7701      	strb	r1, [r0, #28]
c0de3638:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de363c:	4ee0      	ldr	r6, [pc, #896]	@ (c0de39c0 <nbgl_layoutAddUpFooter+0x434>)
c0de363e:	08c1      	lsrs	r1, r0, #3
c0de3640:	447e      	add	r6, pc
c0de3642:	2005      	movs	r0, #5
c0de3644:	47b0      	blx	r6
c0de3646:	46b2      	mov	sl, r6
c0de3648:	4606      	mov	r6, r0
c0de364a:	7607      	strb	r7, [r0, #24]
c0de364c:	2020      	movs	r0, #32
c0de364e:	2103      	movs	r1, #3
c0de3650:	75f0      	strb	r0, [r6, #23]
c0de3652:	2058      	movs	r0, #88	@ 0x58
c0de3654:	f886 8016 	strb.w	r8, [r6, #22]
c0de3658:	46b0      	mov	r8, r6
c0de365a:	71f7      	strb	r7, [r6, #7]
c0de365c:	f886 1021 	strb.w	r1, [r6, #33]	@ 0x21
c0de3660:	77f7      	strb	r7, [r6, #31]
c0de3662:	f886 7020 	strb.w	r7, [r6, #32]
c0de3666:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de366a:	f808 0f04 	strb.w	r0, [r8, #4]!
c0de366e:	71b0      	strb	r0, [r6, #6]
c0de3670:	f888 7001 	strb.w	r7, [r8, #1]
c0de3674:	48d3      	ldr	r0, [pc, #844]	@ (c0de39c4 <nbgl_layoutAddUpFooter+0x438>)
c0de3676:	4478      	add	r0, pc
c0de3678:	f007 fb3e 	bl	c0deacf8 <pic>
c0de367c:	4631      	mov	r1, r6
c0de367e:	0e02      	lsrs	r2, r0, #24
c0de3680:	f003 f9b3 	bl	c0de69ea <OUTLINED_FUNCTION_31>
c0de3684:	6960      	ldr	r0, [r4, #20]
c0de3686:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de368a:	7842      	ldrb	r2, [r0, #1]
c0de368c:	7883      	ldrb	r3, [r0, #2]
c0de368e:	78c0      	ldrb	r0, [r0, #3]
c0de3690:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de3694:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de3698:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de369c:	6006      	str	r6, [r0, #0]
c0de369e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de36a2:	08c1      	lsrs	r1, r0, #3
c0de36a4:	2004      	movs	r0, #4
c0de36a6:	47d0      	blx	sl
c0de36a8:	77c7      	strb	r7, [r0, #31]
c0de36aa:	4606      	mov	r6, r0
c0de36ac:	f003 f944 	bl	c0de6938 <OUTLINED_FUNCTION_23>
c0de36b0:	4601      	mov	r1, r0
c0de36b2:	2001      	movs	r0, #1
c0de36b4:	f04f 0b04 	mov.w	fp, #4
c0de36b8:	2301      	movs	r3, #1
c0de36ba:	f886 0024 	strb.w	r0, [r6, #36]	@ 0x24
c0de36be:	200d      	movs	r0, #13
c0de36c0:	0e0a      	lsrs	r2, r1, #24
c0de36c2:	f886 b020 	strb.w	fp, [r6, #32]
c0de36c6:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de36ca:	f003 fa40 	bl	c0de6b4e <OUTLINED_FUNCTION_50>
c0de36ce:	f898 0000 	ldrb.w	r0, [r8]
c0de36d2:	f898 2001 	ldrb.w	r2, [r8, #1]
c0de36d6:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de36da:	f5c0 70c0 	rsb	r0, r0, #384	@ 0x180
c0de36de:	0a02      	lsrs	r2, r0, #8
c0de36e0:	7130      	strb	r0, [r6, #4]
c0de36e2:	7172      	strb	r2, [r6, #5]
c0de36e4:	b282      	uxth	r2, r0
c0de36e6:	f003 fae2 	bl	c0de6cae <OUTLINED_FUNCTION_78>
c0de36ea:	2120      	movs	r1, #32
c0de36ec:	71b0      	strb	r0, [r6, #6]
c0de36ee:	0a00      	lsrs	r0, r0, #8
c0de36f0:	f886 b016 	strb.w	fp, [r6, #22]
c0de36f4:	f886 7021 	strb.w	r7, [r6, #33]	@ 0x21
c0de36f8:	7637      	strb	r7, [r6, #24]
c0de36fa:	f04f 0b04 	mov.w	fp, #4
c0de36fe:	75f1      	strb	r1, [r6, #23]
c0de3700:	71f0      	strb	r0, [r6, #7]
c0de3702:	6960      	ldr	r0, [r4, #20]
c0de3704:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de3708:	7842      	ldrb	r2, [r0, #1]
c0de370a:	7883      	ldrb	r3, [r0, #2]
c0de370c:	78c0      	ldrb	r0, [r0, #3]
c0de370e:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de3712:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de3716:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de371a:	6046      	str	r6, [r0, #4]
c0de371c:	f003 f91f 	bl	c0de695e <OUTLINED_FUNCTION_25>
c0de3720:	2103      	movs	r1, #3
c0de3722:	f04f 0802 	mov.w	r8, #2
c0de3726:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de372a:	6961      	ldr	r1, [r4, #20]
c0de372c:	f880 8016 	strb.w	r8, [r0, #22]
c0de3730:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de3734:	784b      	ldrb	r3, [r1, #1]
c0de3736:	788e      	ldrb	r6, [r1, #2]
c0de3738:	78c9      	ldrb	r1, [r1, #3]
c0de373a:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de373e:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de3742:	2608      	movs	r6, #8
c0de3744:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de3748:	6088      	str	r0, [r1, #8]
c0de374a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de374e:	08c1      	lsrs	r1, r0, #3
c0de3750:	2008      	movs	r0, #8
c0de3752:	47d0      	blx	sl
c0de3754:	f890 1022 	ldrb.w	r1, [r0, #34]	@ 0x22
c0de3758:	f880 b019 	strb.w	fp, [r0, #25]
c0de375c:	7186      	strb	r6, [r0, #6]
c0de375e:	7687      	strb	r7, [r0, #26]
c0de3760:	71c7      	strb	r7, [r0, #7]
c0de3762:	f880 8016 	strb.w	r8, [r0, #22]
c0de3766:	f041 0104 	orr.w	r1, r1, #4
c0de376a:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de376e:	2101      	movs	r1, #1
c0de3770:	7141      	strb	r1, [r0, #5]
c0de3772:	21e0      	movs	r1, #224	@ 0xe0
c0de3774:	7101      	strb	r1, [r0, #4]
c0de3776:	6961      	ldr	r1, [r4, #20]
c0de3778:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de377c:	f003 f84b 	bl	c0de6816 <OUTLINED_FUNCTION_11>
c0de3780:	60c8      	str	r0, [r1, #12]
c0de3782:	e1f9      	b.n	c0de3b78 <nbgl_layoutAddUpFooter+0x5ec>
c0de3784:	f003 fa58 	bl	c0de6c38 <OUTLINED_FUNCTION_67>
c0de3788:	2800      	cmp	r0, #0
c0de378a:	f000 8182 	beq.w	c0de3a92 <nbgl_layoutAddUpFooter+0x506>
c0de378e:	6960      	ldr	r0, [r4, #20]
c0de3790:	2104      	movs	r1, #4
c0de3792:	2701      	movs	r7, #1
c0de3794:	2260      	movs	r2, #96	@ 0x60
c0de3796:	7781      	strb	r1, [r0, #30]
c0de3798:	2100      	movs	r1, #0
c0de379a:	f880 7020 	strb.w	r7, [r0, #32]
c0de379e:	7182      	strb	r2, [r0, #6]
c0de37a0:	7707      	strb	r7, [r0, #28]
c0de37a2:	71c1      	strb	r1, [r0, #7]
c0de37a4:	7741      	strb	r1, [r0, #29]
c0de37a6:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de37aa:	f002 ff93 	bl	c0de66d4 <OUTLINED_FUNCTION_0>
c0de37ae:	77c7      	strb	r7, [r0, #31]
c0de37b0:	4606      	mov	r6, r0
c0de37b2:	f003 f8c1 	bl	c0de6938 <OUTLINED_FUNCTION_23>
c0de37b6:	4601      	mov	r1, r0
c0de37b8:	20a0      	movs	r0, #160	@ 0xa0
c0de37ba:	7177      	strb	r7, [r6, #5]
c0de37bc:	f886 7024 	strb.w	r7, [r6, #36]	@ 0x24
c0de37c0:	2705      	movs	r7, #5
c0de37c2:	2301      	movs	r3, #1
c0de37c4:	7130      	strb	r0, [r6, #4]
c0de37c6:	200b      	movs	r0, #11
c0de37c8:	0e0a      	lsrs	r2, r1, #24
c0de37ca:	f886 7020 	strb.w	r7, [r6, #32]
c0de37ce:	f003 f8fd 	bl	c0de69cc <OUTLINED_FUNCTION_30>
c0de37d2:	f007 f8c9 	bl	c0dea968 <nbgl_getTextHeightInWidth>
c0de37d6:	71b0      	strb	r0, [r6, #6]
c0de37d8:	0a00      	lsrs	r0, r0, #8
c0de37da:	75b7      	strb	r7, [r6, #22]
c0de37dc:	71f0      	strb	r0, [r6, #7]
c0de37de:	e056      	b.n	c0de388e <nbgl_layoutAddUpFooter+0x302>
c0de37e0:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de37e4:	2705      	movs	r7, #5
c0de37e6:	f003 f862 	bl	c0de68ae <OUTLINED_FUNCTION_17>
c0de37ea:	4606      	mov	r6, r0
c0de37ec:	7b2a      	ldrb	r2, [r5, #12]
c0de37ee:	7c2b      	ldrb	r3, [r5, #16]
c0de37f0:	f002 ffbe 	bl	c0de6770 <OUTLINED_FUNCTION_6>
c0de37f4:	2800      	cmp	r0, #0
c0de37f6:	f000 814c 	beq.w	c0de3a92 <nbgl_layoutAddUpFooter+0x506>
c0de37fa:	6960      	ldr	r0, [r4, #20]
c0de37fc:	75b7      	strb	r7, [r6, #22]
c0de37fe:	f04f 0801 	mov.w	r8, #1
c0de3802:	2700      	movs	r7, #0
c0de3804:	2188      	movs	r1, #136	@ 0x88
c0de3806:	f880 8020 	strb.w	r8, [r0, #32]
c0de380a:	71c7      	strb	r7, [r0, #7]
c0de380c:	7181      	strb	r1, [r0, #6]
c0de380e:	7b68      	ldrb	r0, [r5, #13]
c0de3810:	2800      	cmp	r0, #0
c0de3812:	bf18      	it	ne
c0de3814:	2003      	movne	r0, #3
c0de3816:	77f0      	strb	r0, [r6, #31]
c0de3818:	f04f 0000 	mov.w	r0, #0
c0de381c:	bf08      	it	eq
c0de381e:	2003      	moveq	r0, #3
c0de3820:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de3824:	7b68      	ldrb	r0, [r5, #13]
c0de3826:	4601      	mov	r1, r0
c0de3828:	2800      	cmp	r0, #0
c0de382a:	bf18      	it	ne
c0de382c:	2101      	movne	r1, #1
c0de382e:	0049      	lsls	r1, r1, #1
c0de3830:	2802      	cmp	r0, #2
c0de3832:	bf08      	it	eq
c0de3834:	2103      	moveq	r1, #3
c0de3836:	f886 1020 	strb.w	r1, [r6, #32]
c0de383a:	f003 f87d 	bl	c0de6938 <OUTLINED_FUNCTION_23>
c0de383e:	210c      	movs	r1, #12
c0de3840:	0e02      	lsrs	r2, r0, #24
c0de3842:	f886 1023 	strb.w	r1, [r6, #35]	@ 0x23
c0de3846:	4631      	mov	r1, r6
c0de3848:	f003 f8ae 	bl	c0de69a8 <OUTLINED_FUNCTION_28>
c0de384c:	f003 f97c 	bl	c0de6b48 <OUTLINED_FUNCTION_49>
c0de3850:	4631      	mov	r1, r6
c0de3852:	0e02      	lsrs	r2, r0, #24
c0de3854:	74f7      	strb	r7, [r6, #19]
c0de3856:	71f7      	strb	r7, [r6, #7]
c0de3858:	f886 8005 	strb.w	r8, [r6, #5]
c0de385c:	7777      	strb	r7, [r6, #29]
c0de385e:	f886 801c 	strb.w	r8, [r6, #28]
c0de3862:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de3866:	70ca      	strb	r2, [r1, #3]
c0de3868:	0c02      	lsrs	r2, r0, #16
c0de386a:	0a00      	lsrs	r0, r0, #8
c0de386c:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de3870:	4630      	mov	r0, r6
c0de3872:	708a      	strb	r2, [r1, #2]
c0de3874:	f800 7f12 	strb.w	r7, [r0, #18]!
c0de3878:	70c7      	strb	r7, [r0, #3]
c0de387a:	7087      	strb	r7, [r0, #2]
c0de387c:	2058      	movs	r0, #88	@ 0x58
c0de387e:	71b0      	strb	r0, [r6, #6]
c0de3880:	20a0      	movs	r0, #160	@ 0xa0
c0de3882:	7130      	strb	r0, [r6, #4]
c0de3884:	2003      	movs	r0, #3
c0de3886:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de388a:	2007      	movs	r0, #7
c0de388c:	77b0      	strb	r0, [r6, #30]
c0de388e:	6960      	ldr	r0, [r4, #20]
c0de3890:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de3894:	7842      	ldrb	r2, [r0, #1]
c0de3896:	7883      	ldrb	r3, [r0, #2]
c0de3898:	78c0      	ldrb	r0, [r0, #3]
c0de389a:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de389e:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de38a2:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de38a6:	6006      	str	r6, [r0, #0]
c0de38a8:	e166      	b.n	c0de3b78 <nbgl_layoutAddUpFooter+0x5ec>
c0de38aa:	6868      	ldr	r0, [r5, #4]
c0de38ac:	2800      	cmp	r0, #0
c0de38ae:	f000 80f0 	beq.w	c0de3a92 <nbgl_layoutAddUpFooter+0x506>
c0de38b2:	68a8      	ldr	r0, [r5, #8]
c0de38b4:	2800      	cmp	r0, #0
c0de38b6:	f000 80ec 	beq.w	c0de3a92 <nbgl_layoutAddUpFooter+0x506>
c0de38ba:	f04f 0b00 	mov.w	fp, #0
c0de38be:	2088      	movs	r0, #136	@ 0x88
c0de38c0:	2702      	movs	r7, #2
c0de38c2:	f881 b007 	strb.w	fp, [r1, #7]
c0de38c6:	7188      	strb	r0, [r1, #6]
c0de38c8:	f881 7020 	strb.w	r7, [r1, #32]
c0de38cc:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de38d0:	f002 ffed 	bl	c0de68ae <OUTLINED_FUNCTION_17>
c0de38d4:	4606      	mov	r6, r0
c0de38d6:	7b2a      	ldrb	r2, [r5, #12]
c0de38d8:	7bab      	ldrb	r3, [r5, #14]
c0de38da:	f002 ff49 	bl	c0de6770 <OUTLINED_FUNCTION_6>
c0de38de:	2800      	cmp	r0, #0
c0de38e0:	f000 80d7 	beq.w	c0de3a92 <nbgl_layoutAddUpFooter+0x506>
c0de38e4:	2120      	movs	r1, #32
c0de38e6:	f04f 0a03 	mov.w	sl, #3
c0de38ea:	f04f 0858 	mov.w	r8, #88	@ 0x58
c0de38ee:	f886 7020 	strb.w	r7, [r6, #32]
c0de38f2:	f886 b018 	strb.w	fp, [r6, #24]
c0de38f6:	f886 b021 	strb.w	fp, [r6, #33]	@ 0x21
c0de38fa:	f886 b007 	strb.w	fp, [r6, #7]
c0de38fe:	f886 b005 	strb.w	fp, [r6, #5]
c0de3902:	75f1      	strb	r1, [r6, #23]
c0de3904:	2104      	movs	r1, #4
c0de3906:	f886 a01f 	strb.w	sl, [r6, #31]
c0de390a:	f886 a022 	strb.w	sl, [r6, #34]	@ 0x22
c0de390e:	75b1      	strb	r1, [r6, #22]
c0de3910:	2101      	movs	r1, #1
c0de3912:	7141      	strb	r1, [r0, #5]
c0de3914:	f886 8006 	strb.w	r8, [r6, #6]
c0de3918:	f886 8004 	strb.w	r8, [r6, #4]
c0de391c:	f003 f80c 	bl	c0de6938 <OUTLINED_FUNCTION_23>
c0de3920:	4631      	mov	r1, r6
c0de3922:	0e02      	lsrs	r2, r0, #24
c0de3924:	f886 b01d 	strb.w	fp, [r6, #29]
c0de3928:	f04f 0b01 	mov.w	fp, #1
c0de392c:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de3930:	f886 b01c 	strb.w	fp, [r6, #28]
c0de3934:	70ca      	strb	r2, [r1, #3]
c0de3936:	0c02      	lsrs	r2, r0, #16
c0de3938:	0a00      	lsrs	r0, r0, #8
c0de393a:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de393e:	200c      	movs	r0, #12
c0de3940:	708a      	strb	r2, [r1, #2]
c0de3942:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de3946:	200a      	movs	r0, #10
c0de3948:	f003 f883 	bl	c0de6a52 <OUTLINED_FUNCTION_36>
c0de394c:	6006      	str	r6, [r0, #0]
c0de394e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3952:	f002 ffac 	bl	c0de68ae <OUTLINED_FUNCTION_17>
c0de3956:	4606      	mov	r6, r0
c0de3958:	7b6a      	ldrb	r2, [r5, #13]
c0de395a:	7bab      	ldrb	r3, [r5, #14]
c0de395c:	f002 ff08 	bl	c0de6770 <OUTLINED_FUNCTION_6>
c0de3960:	2800      	cmp	r0, #0
c0de3962:	f000 8096 	beq.w	c0de3a92 <nbgl_layoutAddUpFooter+0x506>
c0de3966:	2700      	movs	r7, #0
c0de3968:	2120      	movs	r1, #32
c0de396a:	f886 a021 	strb.w	sl, [r6, #33]	@ 0x21
c0de396e:	f886 a022 	strb.w	sl, [r6, #34]	@ 0x22
c0de3972:	f886 b005 	strb.w	fp, [r6, #5]
c0de3976:	75f1      	strb	r1, [r6, #23]
c0de3978:	7147      	strb	r7, [r0, #5]
c0de397a:	2106      	movs	r1, #6
c0de397c:	2038      	movs	r0, #56	@ 0x38
c0de397e:	f886 7020 	strb.w	r7, [r6, #32]
c0de3982:	77f7      	strb	r7, [r6, #31]
c0de3984:	7637      	strb	r7, [r6, #24]
c0de3986:	71f7      	strb	r7, [r6, #7]
c0de3988:	f886 8006 	strb.w	r8, [r6, #6]
c0de398c:	75b1      	strb	r1, [r6, #22]
c0de398e:	7130      	strb	r0, [r6, #4]
c0de3990:	f003 f8da 	bl	c0de6b48 <OUTLINED_FUNCTION_49>
c0de3994:	4631      	mov	r1, r6
c0de3996:	0e02      	lsrs	r2, r0, #24
c0de3998:	f886 b01c 	strb.w	fp, [r6, #28]
c0de399c:	7777      	strb	r7, [r6, #29]
c0de399e:	f801 0f25 	strb.w	r0, [r1, #37]!
c0de39a2:	70ca      	strb	r2, [r1, #3]
c0de39a4:	0c02      	lsrs	r2, r0, #16
c0de39a6:	0a00      	lsrs	r0, r0, #8
c0de39a8:	f886 0026 	strb.w	r0, [r6, #38]	@ 0x26
c0de39ac:	200c      	movs	r0, #12
c0de39ae:	708a      	strb	r2, [r1, #2]
c0de39b0:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de39b4:	2009      	movs	r0, #9
c0de39b6:	f003 f84c 	bl	c0de6a52 <OUTLINED_FUNCTION_36>
c0de39ba:	6046      	str	r6, [r0, #4]
c0de39bc:	e0dc      	b.n	c0de3b78 <nbgl_layoutAddUpFooter+0x5ec>
c0de39be:	bf00      	nop
c0de39c0:	000072f3 	.word	0x000072f3
c0de39c4:	00008769 	.word	0x00008769
c0de39c8:	6868      	ldr	r0, [r5, #4]
c0de39ca:	2800      	cmp	r0, #0
c0de39cc:	d061      	beq.n	c0de3a92 <nbgl_layoutAddUpFooter+0x506>
c0de39ce:	7b2a      	ldrb	r2, [r5, #12]
c0de39d0:	7b6b      	ldrb	r3, [r5, #13]
c0de39d2:	4620      	mov	r0, r4
c0de39d4:	f7ff fb5c 	bl	c0de3090 <layoutAddCallbackObj>
c0de39d8:	2800      	cmp	r0, #0
c0de39da:	d05a      	beq.n	c0de3a92 <nbgl_layoutAddUpFooter+0x506>
c0de39dc:	6960      	ldr	r0, [r4, #20]
c0de39de:	f04f 0803 	mov.w	r8, #3
c0de39e2:	2113      	movs	r1, #19
c0de39e4:	f04f 0a00 	mov.w	sl, #0
c0de39e8:	2701      	movs	r7, #1
c0de39ea:	f04f 0b04 	mov.w	fp, #4
c0de39ee:	f880 8020 	strb.w	r8, [r0, #32]
c0de39f2:	7781      	strb	r1, [r0, #30]
c0de39f4:	f880 a01d 	strb.w	sl, [r0, #29]
c0de39f8:	7707      	strb	r7, [r0, #28]
c0de39fa:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de39fe:	f002 fe69 	bl	c0de66d4 <OUTLINED_FUNCTION_0>
c0de3a02:	f880 a01f 	strb.w	sl, [r0, #31]
c0de3a06:	4606      	mov	r6, r0
c0de3a08:	f002 ff96 	bl	c0de6938 <OUTLINED_FUNCTION_23>
c0de3a0c:	22a0      	movs	r2, #160	@ 0xa0
c0de3a0e:	4601      	mov	r1, r0
c0de3a10:	200b      	movs	r0, #11
c0de3a12:	f886 7024 	strb.w	r7, [r6, #36]	@ 0x24
c0de3a16:	f886 b020 	strb.w	fp, [r6, #32]
c0de3a1a:	7177      	strb	r7, [r6, #5]
c0de3a1c:	7132      	strb	r2, [r6, #4]
c0de3a1e:	4632      	mov	r2, r6
c0de3a20:	0e0b      	lsrs	r3, r1, #24
c0de3a22:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de3a26:	f802 1f26 	strb.w	r1, [r2, #38]!
c0de3a2a:	70d3      	strb	r3, [r2, #3]
c0de3a2c:	0c0b      	lsrs	r3, r1, #16
c0de3a2e:	7093      	strb	r3, [r2, #2]
c0de3a30:	0a0a      	lsrs	r2, r1, #8
c0de3a32:	f886 2027 	strb.w	r2, [r6, #39]	@ 0x27
c0de3a36:	68aa      	ldr	r2, [r5, #8]
c0de3a38:	b37a      	cbz	r2, c0de3a9a <nbgl_layoutAddUpFooter+0x50e>
c0de3a3a:	4610      	mov	r0, r2
c0de3a3c:	f007 f95c 	bl	c0deacf8 <pic>
c0de3a40:	4633      	mov	r3, r6
c0de3a42:	4601      	mov	r1, r0
c0de3a44:	f813 cf26 	ldrb.w	ip, [r3, #38]!
c0de3a48:	f813 ed22 	ldrb.w	lr, [r3, #-34]!
c0de3a4c:	785a      	ldrb	r2, [r3, #1]
c0de3a4e:	7f98      	ldrb	r0, [r3, #30]
c0de3a50:	f893 7020 	ldrb.w	r7, [r3, #32]
c0de3a54:	f893 8023 	ldrb.w	r8, [r3, #35]	@ 0x23
c0de3a58:	ea4e 2e02 	orr.w	lr, lr, r2, lsl #8
c0de3a5c:	780a      	ldrb	r2, [r1, #0]
c0de3a5e:	7849      	ldrb	r1, [r1, #1]
c0de3a60:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de3a64:	ebae 0101 	sub.w	r1, lr, r1
c0de3a68:	f1a1 0220 	sub.w	r2, r1, #32
c0de3a6c:	0a11      	lsrs	r1, r2, #8
c0de3a6e:	701a      	strb	r2, [r3, #0]
c0de3a70:	7059      	strb	r1, [r3, #1]
c0de3a72:	f893 1025 	ldrb.w	r1, [r3, #37]	@ 0x25
c0de3a76:	f893 3024 	ldrb.w	r3, [r3, #36]	@ 0x24
c0de3a7a:	2f00      	cmp	r7, #0
c0de3a7c:	bf18      	it	ne
c0de3a7e:	2701      	movne	r7, #1
c0de3a80:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de3a84:	ea4c 2308 	orr.w	r3, ip, r8, lsl #8
c0de3a88:	f04f 0803 	mov.w	r8, #3
c0de3a8c:	ea43 4101 	orr.w	r1, r3, r1, lsl #16
c0de3a90:	e005      	b.n	c0de3a9e <nbgl_layoutAddUpFooter+0x512>
c0de3a92:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de3a96:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de3a9a:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de3a9e:	b292      	uxth	r2, r2
c0de3aa0:	463b      	mov	r3, r7
c0de3aa2:	f006 ff61 	bl	c0dea968 <nbgl_getTextHeightInWidth>
c0de3aa6:	6961      	ldr	r1, [r4, #20]
c0de3aa8:	f886 a018 	strb.w	sl, [r6, #24]
c0de3aac:	f886 b016 	strb.w	fp, [r6, #22]
c0de3ab0:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de3ab4:	784b      	ldrb	r3, [r1, #1]
c0de3ab6:	788f      	ldrb	r7, [r1, #2]
c0de3ab8:	78c9      	ldrb	r1, [r1, #3]
c0de3aba:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de3abe:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de3ac2:	2720      	movs	r7, #32
c0de3ac4:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de3ac8:	600e      	str	r6, [r1, #0]
c0de3aca:	75f7      	strb	r7, [r6, #23]
c0de3acc:	71b0      	strb	r0, [r6, #6]
c0de3ace:	0a01      	lsrs	r1, r0, #8
c0de3ad0:	6962      	ldr	r2, [r4, #20]
c0de3ad2:	71f1      	strb	r1, [r6, #7]
c0de3ad4:	71d1      	strb	r1, [r2, #7]
c0de3ad6:	7190      	strb	r0, [r2, #6]
c0de3ad8:	f002 ff41 	bl	c0de695e <OUTLINED_FUNCTION_25>
c0de3adc:	2102      	movs	r1, #2
c0de3ade:	f880 8022 	strb.w	r8, [r0, #34]	@ 0x22
c0de3ae2:	7581      	strb	r1, [r0, #22]
c0de3ae4:	6961      	ldr	r1, [r4, #20]
c0de3ae6:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de3aea:	f002 fe94 	bl	c0de6816 <OUTLINED_FUNCTION_11>
c0de3aee:	6048      	str	r0, [r1, #4]
c0de3af0:	68a8      	ldr	r0, [r5, #8]
c0de3af2:	b3c0      	cbz	r0, c0de3b66 <nbgl_layoutAddUpFooter+0x5da>
c0de3af4:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3af8:	f002 ff08 	bl	c0de690c <OUTLINED_FUNCTION_21>
c0de3afc:	4606      	mov	r6, r0
c0de3afe:	2000      	movs	r0, #0
c0de3b00:	7630      	strb	r0, [r6, #24]
c0de3b02:	77f0      	strb	r0, [r6, #31]
c0de3b04:	2006      	movs	r0, #6
c0de3b06:	75f7      	strb	r7, [r6, #23]
c0de3b08:	75b0      	strb	r0, [r6, #22]
c0de3b0a:	f003 f81d 	bl	c0de6b48 <OUTLINED_FUNCTION_49>
c0de3b0e:	4631      	mov	r1, r6
c0de3b10:	0e02      	lsrs	r2, r0, #24
c0de3b12:	f003 f84b 	bl	c0de6bac <OUTLINED_FUNCTION_56>
c0de3b16:	6960      	ldr	r0, [r4, #20]
c0de3b18:	f810 2f22 	ldrb.w	r2, [r0, #34]!
c0de3b1c:	7843      	ldrb	r3, [r0, #1]
c0de3b1e:	7887      	ldrb	r7, [r0, #2]
c0de3b20:	78c0      	ldrb	r0, [r0, #3]
c0de3b22:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de3b26:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de3b2a:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de3b2e:	6086      	str	r6, [r0, #8]
c0de3b30:	f896 0022 	ldrb.w	r0, [r6, #34]	@ 0x22
c0de3b34:	780a      	ldrb	r2, [r1, #0]
c0de3b36:	788b      	ldrb	r3, [r1, #2]
c0de3b38:	78c9      	ldrb	r1, [r1, #3]
c0de3b3a:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de3b3e:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de3b42:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de3b46:	7881      	ldrb	r1, [r0, #2]
c0de3b48:	78c0      	ldrb	r0, [r0, #3]
c0de3b4a:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
c0de3b4e:	6960      	ldr	r0, [r4, #20]
c0de3b50:	7982      	ldrb	r2, [r0, #6]
c0de3b52:	79c3      	ldrb	r3, [r0, #7]
c0de3b54:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de3b58:	428a      	cmp	r2, r1
c0de3b5a:	bf2f      	iteee	cs
c0de3b5c:	4611      	movcs	r1, r2
c0de3b5e:	7181      	strbcc	r1, [r0, #6]
c0de3b60:	0a0a      	lsrcc	r2, r1, #8
c0de3b62:	71c2      	strbcc	r2, [r0, #7]
c0de3b64:	e004      	b.n	c0de3b70 <nbgl_layoutAddUpFooter+0x5e4>
c0de3b66:	6960      	ldr	r0, [r4, #20]
c0de3b68:	7981      	ldrb	r1, [r0, #6]
c0de3b6a:	79c2      	ldrb	r2, [r0, #7]
c0de3b6c:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de3b70:	3130      	adds	r1, #48	@ 0x30
c0de3b72:	7181      	strb	r1, [r0, #6]
c0de3b74:	0a09      	lsrs	r1, r1, #8
c0de3b76:	71c1      	strb	r1, [r0, #7]
c0de3b78:	f8d4 20a0 	ldr.w	r2, [r4, #160]	@ 0xa0
c0de3b7c:	6961      	ldr	r1, [r4, #20]
c0de3b7e:	68a0      	ldr	r0, [r4, #8]
c0de3b80:	f812 3f06 	ldrb.w	r3, [r2, #6]!
c0de3b84:	79cf      	ldrb	r7, [r1, #7]
c0de3b86:	7856      	ldrb	r6, [r2, #1]
c0de3b88:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de3b8c:	798e      	ldrb	r6, [r1, #6]
c0de3b8e:	ea46 2607 	orr.w	r6, r6, r7, lsl #8
c0de3b92:	1b9b      	subs	r3, r3, r6
c0de3b94:	7013      	strb	r3, [r2, #0]
c0de3b96:	6101      	str	r1, [r0, #16]
c0de3b98:	0a1b      	lsrs	r3, r3, #8
c0de3b9a:	6960      	ldr	r0, [r4, #20]
c0de3b9c:	7053      	strb	r3, [r2, #1]
c0de3b9e:	782a      	ldrb	r2, [r5, #0]
c0de3ba0:	7981      	ldrb	r1, [r0, #6]
c0de3ba2:	79c0      	ldrb	r0, [r0, #7]
c0de3ba4:	f884 20ac 	strb.w	r2, [r4, #172]	@ 0xac
c0de3ba8:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de3bac:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de3bb0 <nbgl_layoutAddSwipe>:
c0de3bb0:	b3d8      	cbz	r0, c0de3c2a <nbgl_layoutAddSwipe+0x7a>
c0de3bb2:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de3bb6:	f8dd 8020 	ldr.w	r8, [sp, #32]
c0de3bba:	461c      	mov	r4, r3
c0de3bbc:	4617      	mov	r7, r2
c0de3bbe:	460d      	mov	r5, r1
c0de3bc0:	4606      	mov	r6, r0
c0de3bc2:	b342      	cbz	r2, c0de3c16 <nbgl_layoutAddSwipe+0x66>
c0de3bc4:	2004      	movs	r0, #4
c0de3bc6:	2100      	movs	r1, #0
c0de3bc8:	f04f 0a00 	mov.w	sl, #0
c0de3bcc:	f006 feb3 	bl	c0dea936 <nbgl_objPoolGet>
c0de3bd0:	61b0      	str	r0, [r6, #24]
c0de3bd2:	4638      	mov	r0, r7
c0de3bd4:	f007 f890 	bl	c0deacf8 <pic>
c0de3bd8:	69b1      	ldr	r1, [r6, #24]
c0de3bda:	f002 ff7c 	bl	c0de6ad6 <OUTLINED_FUNCTION_41>
c0de3bde:	7048      	strb	r0, [r1, #1]
c0de3be0:	2001      	movs	r0, #1
c0de3be2:	22a0      	movs	r2, #160	@ 0xa0
c0de3be4:	f801 2c22 	strb.w	r2, [r1, #-34]
c0de3be8:	220b      	movs	r2, #11
c0de3bea:	f801 0c21 	strb.w	r0, [r1, #-33]
c0de3bee:	f801 0c07 	strb.w	r0, [r1, #-7]
c0de3bf2:	200b      	movs	r0, #11
c0de3bf4:	f801 2c04 	strb.w	r2, [r1, #-4]
c0de3bf8:	f006 feb1 	bl	c0dea95e <nbgl_getFontLineHeight>
c0de3bfc:	69b1      	ldr	r1, [r6, #24]
c0de3bfe:	7188      	strb	r0, [r1, #6]
c0de3c00:	201e      	movs	r0, #30
c0de3c02:	f881 a007 	strb.w	sl, [r1, #7]
c0de3c06:	f881 a01a 	strb.w	sl, [r1, #26]
c0de3c0a:	7648      	strb	r0, [r1, #25]
c0de3c0c:	2005      	movs	r0, #5
c0de3c0e:	f881 0020 	strb.w	r0, [r1, #32]
c0de3c12:	2008      	movs	r0, #8
c0de3c14:	7588      	strb	r0, [r1, #22]
c0de3c16:	4630      	mov	r0, r6
c0de3c18:	4629      	mov	r1, r5
c0de3c1a:	2201      	movs	r2, #1
c0de3c1c:	4623      	mov	r3, r4
c0de3c1e:	f8cd 8000 	str.w	r8, [sp]
c0de3c22:	f000 f804 	bl	c0de3c2e <addSwipeInternal>
c0de3c26:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0de3c2a:	f002 bf0f 	b.w	c0de6a4c <OUTLINED_FUNCTION_35>

c0de3c2e <addSwipeInternal>:
c0de3c2e:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de3c30:	f411 6ff0 	tst.w	r1, #1920	@ 0x780
c0de3c34:	d013      	beq.n	c0de3c5e <addSwipeInternal+0x30>
c0de3c36:	9f06      	ldr	r7, [sp, #24]
c0de3c38:	460c      	mov	r4, r1
c0de3c3a:	f8d0 10a0 	ldr.w	r1, [r0, #160]	@ 0xa0
c0de3c3e:	4615      	mov	r5, r2
c0de3c40:	461a      	mov	r2, r3
c0de3c42:	4606      	mov	r6, r0
c0de3c44:	463b      	mov	r3, r7
c0de3c46:	f7ff fa23 	bl	c0de3090 <layoutAddCallbackObj>
c0de3c4a:	b140      	cbz	r0, c0de3c5e <addSwipeInternal+0x30>
c0de3c4c:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de3c50:	0a21      	lsrs	r1, r4, #8
c0de3c52:	f886 50b0 	strb.w	r5, [r6, #176]	@ 0xb0
c0de3c56:	7741      	strb	r1, [r0, #29]
c0de3c58:	7704      	strb	r4, [r0, #28]
c0de3c5a:	2000      	movs	r0, #0
c0de3c5c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de3c5e:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de3c62:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0de3c64 <nbgl_layoutAddTopRightButton>:
c0de3c64:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de3c68:	b398      	cbz	r0, c0de3cd2 <nbgl_layoutAddTopRightButton+0x6e>
c0de3c6a:	f003 f823 	bl	c0de6cb4 <OUTLINED_FUNCTION_79>
c0de3c6e:	4688      	mov	r8, r1
c0de3c70:	461f      	mov	r7, r3
c0de3c72:	4615      	mov	r5, r2
c0de3c74:	f04f 0a05 	mov.w	sl, #5
c0de3c78:	f002 fe19 	bl	c0de68ae <OUTLINED_FUNCTION_17>
c0de3c7c:	4606      	mov	r6, r0
c0de3c7e:	4620      	mov	r0, r4
c0de3c80:	462a      	mov	r2, r5
c0de3c82:	463b      	mov	r3, r7
c0de3c84:	f002 fe3f 	bl	c0de6906 <OUTLINED_FUNCTION_20>
c0de3c88:	b318      	cbz	r0, c0de3cd2 <nbgl_layoutAddTopRightButton+0x6e>
c0de3c8a:	2058      	movs	r0, #88	@ 0x58
c0de3c8c:	2700      	movs	r7, #0
c0de3c8e:	2503      	movs	r5, #3
c0de3c90:	f886 a01e 	strb.w	sl, [r6, #30]
c0de3c94:	71b0      	strb	r0, [r6, #6]
c0de3c96:	7130      	strb	r0, [r6, #4]
c0de3c98:	2020      	movs	r0, #32
c0de3c9a:	71f7      	strb	r7, [r6, #7]
c0de3c9c:	7177      	strb	r7, [r6, #5]
c0de3c9e:	76b7      	strb	r7, [r6, #26]
c0de3ca0:	7637      	strb	r7, [r6, #24]
c0de3ca2:	7777      	strb	r7, [r6, #29]
c0de3ca4:	f886 5022 	strb.w	r5, [r6, #34]	@ 0x22
c0de3ca8:	f886 7021 	strb.w	r7, [r6, #33]	@ 0x21
c0de3cac:	77f5      	strb	r5, [r6, #31]
c0de3cae:	7670      	strb	r0, [r6, #25]
c0de3cb0:	75f0      	strb	r0, [r6, #23]
c0de3cb2:	2001      	movs	r0, #1
c0de3cb4:	7730      	strb	r0, [r6, #28]
c0de3cb6:	2002      	movs	r0, #2
c0de3cb8:	f886 0020 	strb.w	r0, [r6, #32]
c0de3cbc:	4640      	mov	r0, r8
c0de3cbe:	f007 f81b 	bl	c0deacf8 <pic>
c0de3cc2:	4631      	mov	r1, r6
c0de3cc4:	0e02      	lsrs	r2, r0, #24
c0de3cc6:	75b5      	strb	r5, [r6, #22]
c0de3cc8:	f002 fe8f 	bl	c0de69ea <OUTLINED_FUNCTION_31>
c0de3ccc:	68a0      	ldr	r0, [r4, #8]
c0de3cce:	6086      	str	r6, [r0, #8]
c0de3cd0:	e001      	b.n	c0de3cd6 <nbgl_layoutAddTopRightButton+0x72>
c0de3cd2:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de3cd6:	4638      	mov	r0, r7
c0de3cd8:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}

c0de3cdc <nbgl_layoutAddExtendedFooter>:
c0de3cdc:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de3ce0:	2800      	cmp	r0, #0
c0de3ce2:	f000 834b 	beq.w	c0de437c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de3ce6:	460d      	mov	r5, r1
c0de3ce8:	b119      	cbz	r1, c0de3cf2 <nbgl_layoutAddExtendedFooter+0x16>
c0de3cea:	4604      	mov	r4, r0
c0de3cec:	7828      	ldrb	r0, [r5, #0]
c0de3cee:	2806      	cmp	r0, #6
c0de3cf0:	d902      	bls.n	c0de3cf8 <nbgl_layoutAddExtendedFooter+0x1c>
c0de3cf2:	f06f 0701 	mvn.w	r7, #1
c0de3cf6:	e343      	b.n	c0de4380 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de3cf8:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3cfc:	2601      	movs	r6, #1
c0de3cfe:	f002 fdd2 	bl	c0de68a6 <OUTLINED_FUNCTION_16>
c0de3d02:	2100      	movs	r1, #0
c0de3d04:	7146      	strb	r6, [r0, #5]
c0de3d06:	77c1      	strb	r1, [r0, #31]
c0de3d08:	21a0      	movs	r1, #160	@ 0xa0
c0de3d0a:	7101      	strb	r1, [r0, #4]
c0de3d0c:	6120      	str	r0, [r4, #16]
c0de3d0e:	f002 ff7d 	bl	c0de6c0c <OUTLINED_FUNCTION_64>
c0de3d12:	4601      	mov	r1, r0
c0de3d14:	0a02      	lsrs	r2, r0, #8
c0de3d16:	6920      	ldr	r0, [r4, #16]
c0de3d18:	0e0b      	lsrs	r3, r1, #24
c0de3d1a:	f880 2023 	strb.w	r2, [r0, #35]	@ 0x23
c0de3d1e:	2208      	movs	r2, #8
c0de3d20:	7582      	strb	r2, [r0, #22]
c0de3d22:	4602      	mov	r2, r0
c0de3d24:	f802 1f22 	strb.w	r1, [r2, #34]!
c0de3d28:	0c09      	lsrs	r1, r1, #16
c0de3d2a:	7091      	strb	r1, [r2, #2]
c0de3d2c:	70d3      	strb	r3, [r2, #3]
c0de3d2e:	7829      	ldrb	r1, [r5, #0]
c0de3d30:	2906      	cmp	r1, #6
c0de3d32:	d017      	beq.n	c0de3d64 <nbgl_layoutAddExtendedFooter+0x88>
c0de3d34:	2901      	cmp	r1, #1
c0de3d36:	f000 80be 	beq.w	c0de3eb6 <nbgl_layoutAddExtendedFooter+0x1da>
c0de3d3a:	2902      	cmp	r1, #2
c0de3d3c:	f000 80f7 	beq.w	c0de3f2e <nbgl_layoutAddExtendedFooter+0x252>
c0de3d40:	2903      	cmp	r1, #3
c0de3d42:	f000 8184 	beq.w	c0de404e <nbgl_layoutAddExtendedFooter+0x372>
c0de3d46:	2904      	cmp	r1, #4
c0de3d48:	f000 8249 	beq.w	c0de41de <nbgl_layoutAddExtendedFooter+0x502>
c0de3d4c:	2905      	cmp	r1, #5
c0de3d4e:	f000 8269 	beq.w	c0de4224 <nbgl_layoutAddExtendedFooter+0x548>
c0de3d52:	2900      	cmp	r1, #0
c0de3d54:	d1cd      	bne.n	c0de3cf2 <nbgl_layoutAddExtendedFooter+0x16>
c0de3d56:	88a9      	ldrh	r1, [r5, #4]
c0de3d58:	f04f 0800 	mov.w	r8, #0
c0de3d5c:	7181      	strb	r1, [r0, #6]
c0de3d5e:	0a09      	lsrs	r1, r1, #8
c0de3d60:	71c1      	strb	r1, [r0, #7]
c0de3d62:	e2db      	b.n	c0de431c <nbgl_layoutAddExtendedFooter+0x640>
c0de3d64:	68a8      	ldr	r0, [r5, #8]
c0de3d66:	2800      	cmp	r0, #0
c0de3d68:	f000 8308 	beq.w	c0de437c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de3d6c:	6868      	ldr	r0, [r5, #4]
c0de3d6e:	2800      	cmp	r0, #0
c0de3d70:	f000 8304 	beq.w	c0de437c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de3d74:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3d78:	f002 fd99 	bl	c0de68ae <OUTLINED_FUNCTION_17>
c0de3d7c:	4606      	mov	r6, r0
c0de3d7e:	7c2a      	ldrb	r2, [r5, #16]
c0de3d80:	7cab      	ldrb	r3, [r5, #18]
c0de3d82:	f002 fcf5 	bl	c0de6770 <OUTLINED_FUNCTION_6>
c0de3d86:	2800      	cmp	r0, #0
c0de3d88:	f000 82f8 	beq.w	c0de437c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de3d8c:	2103      	movs	r1, #3
c0de3d8e:	2208      	movs	r2, #8
c0de3d90:	f04f 0801 	mov.w	r8, #1
c0de3d94:	f04f 0a00 	mov.w	sl, #0
c0de3d98:	75b2      	strb	r2, [r6, #22]
c0de3d9a:	77f1      	strb	r1, [r6, #31]
c0de3d9c:	f880 8005 	strb.w	r8, [r0, #5]
c0de3da0:	2258      	movs	r2, #88	@ 0x58
c0de3da2:	7c68      	ldrb	r0, [r5, #17]
c0de3da4:	71b2      	strb	r2, [r6, #6]
c0de3da6:	22a0      	movs	r2, #160	@ 0xa0
c0de3da8:	f886 a021 	strb.w	sl, [r6, #33]	@ 0x21
c0de3dac:	f886 a01a 	strb.w	sl, [r6, #26]
c0de3db0:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de3db4:	f886 a007 	strb.w	sl, [r6, #7]
c0de3db8:	f886 8005 	strb.w	r8, [r6, #5]
c0de3dbc:	7132      	strb	r2, [r6, #4]
c0de3dbe:	2803      	cmp	r0, #3
c0de3dc0:	f04f 0004 	mov.w	r0, #4
c0de3dc4:	bf08      	it	eq
c0de3dc6:	2102      	moveq	r1, #2
c0de3dc8:	f886 1020 	strb.w	r1, [r6, #32]
c0de3dcc:	bf08      	it	eq
c0de3dce:	2018      	moveq	r0, #24
c0de3dd0:	7670      	strb	r0, [r6, #25]
c0de3dd2:	f002 feb9 	bl	c0de6b48 <OUTLINED_FUNCTION_49>
c0de3dd6:	f002 fefb 	bl	c0de6bd0 <OUTLINED_FUNCTION_58>
c0de3dda:	f002 fde5 	bl	c0de69a8 <OUTLINED_FUNCTION_28>
c0de3dde:	f002 fd6a 	bl	c0de68b6 <OUTLINED_FUNCTION_18>
c0de3de2:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de3de6:	200a      	movs	r0, #10
c0de3de8:	77b0      	strb	r0, [r6, #30]
c0de3dea:	6920      	ldr	r0, [r4, #16]
c0de3dec:	f002 fc76 	bl	c0de66dc <OUTLINED_FUNCTION_1>
c0de3df0:	7c68      	ldrb	r0, [r5, #17]
c0de3df2:	b1c0      	cbz	r0, c0de3e26 <nbgl_layoutAddExtendedFooter+0x14a>
c0de3df4:	2803      	cmp	r0, #3
c0de3df6:	d016      	beq.n	c0de3e26 <nbgl_layoutAddExtendedFooter+0x14a>
c0de3df8:	f002 fdb1 	bl	c0de695e <OUTLINED_FUNCTION_25>
c0de3dfc:	0a31      	lsrs	r1, r6, #8
c0de3dfe:	0e32      	lsrs	r2, r6, #24
c0de3e00:	74c1      	strb	r1, [r0, #19]
c0de3e02:	4601      	mov	r1, r0
c0de3e04:	f801 6f12 	strb.w	r6, [r1, #18]!
c0de3e08:	70ca      	strb	r2, [r1, #3]
c0de3e0a:	0c32      	lsrs	r2, r6, #16
c0de3e0c:	708a      	strb	r2, [r1, #2]
c0de3e0e:	6921      	ldr	r1, [r4, #16]
c0de3e10:	f002 fc91 	bl	c0de6736 <OUTLINED_FUNCTION_4>
c0de3e14:	2100      	movs	r1, #0
c0de3e16:	7681      	strb	r1, [r0, #26]
c0de3e18:	2104      	movs	r1, #4
c0de3e1a:	7641      	strb	r1, [r0, #25]
c0de3e1c:	2102      	movs	r1, #2
c0de3e1e:	7581      	strb	r1, [r0, #22]
c0de3e20:	6920      	ldr	r0, [r4, #16]
c0de3e22:	f002 fc5b 	bl	c0de66dc <OUTLINED_FUNCTION_1>
c0de3e26:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3e2a:	f002 fd40 	bl	c0de68ae <OUTLINED_FUNCTION_17>
c0de3e2e:	4606      	mov	r6, r0
c0de3e30:	7c2a      	ldrb	r2, [r5, #16]
c0de3e32:	7cab      	ldrb	r3, [r5, #18]
c0de3e34:	f002 fc9c 	bl	c0de6770 <OUTLINED_FUNCTION_6>
c0de3e38:	2800      	cmp	r0, #0
c0de3e3a:	f000 829f 	beq.w	c0de437c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de3e3e:	2118      	movs	r1, #24
c0de3e40:	f04f 0a00 	mov.w	sl, #0
c0de3e44:	f04f 0801 	mov.w	r8, #1
c0de3e48:	7671      	strb	r1, [r6, #25]
c0de3e4a:	2102      	movs	r1, #2
c0de3e4c:	f886 a01a 	strb.w	sl, [r6, #26]
c0de3e50:	f880 a005 	strb.w	sl, [r0, #5]
c0de3e54:	75b1      	strb	r1, [r6, #22]
c0de3e56:	2103      	movs	r1, #3
c0de3e58:	7c68      	ldrb	r0, [r5, #17]
c0de3e5a:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de3e5e:	2158      	movs	r1, #88	@ 0x58
c0de3e60:	f886 8005 	strb.w	r8, [r6, #5]
c0de3e64:	f886 a007 	strb.w	sl, [r6, #7]
c0de3e68:	71b1      	strb	r1, [r6, #6]
c0de3e6a:	21a0      	movs	r1, #160	@ 0xa0
c0de3e6c:	7131      	strb	r1, [r6, #4]
c0de3e6e:	2100      	movs	r1, #0
c0de3e70:	2802      	cmp	r0, #2
c0de3e72:	bf08      	it	eq
c0de3e74:	2103      	moveq	r1, #3
c0de3e76:	77f1      	strb	r1, [r6, #31]
c0de3e78:	1e81      	subs	r1, r0, #2
c0de3e7a:	bf18      	it	ne
c0de3e7c:	2103      	movne	r1, #3
c0de3e7e:	3802      	subs	r0, #2
c0de3e80:	f886 1021 	strb.w	r1, [r6, #33]	@ 0x21
c0de3e84:	fab0 f080 	clz	r0, r0
c0de3e88:	0940      	lsrs	r0, r0, #5
c0de3e8a:	0040      	lsls	r0, r0, #1
c0de3e8c:	f886 0020 	strb.w	r0, [r6, #32]
c0de3e90:	f002 fd52 	bl	c0de6938 <OUTLINED_FUNCTION_23>
c0de3e94:	4631      	mov	r1, r6
c0de3e96:	0e02      	lsrs	r2, r0, #24
c0de3e98:	f801 0f25 	strb.w	r0, [r1, #37]!
c0de3e9c:	70ca      	strb	r2, [r1, #3]
c0de3e9e:	0c02      	lsrs	r2, r0, #16
c0de3ea0:	0a00      	lsrs	r0, r0, #8
c0de3ea2:	708a      	strb	r2, [r1, #2]
c0de3ea4:	7048      	strb	r0, [r1, #1]
c0de3ea6:	7c68      	ldrb	r0, [r5, #17]
c0de3ea8:	2800      	cmp	r0, #0
c0de3eaa:	f000 8288 	beq.w	c0de43be <nbgl_layoutAddExtendedFooter+0x6e2>
c0de3eae:	68e8      	ldr	r0, [r5, #12]
c0de3eb0:	f006 ff22 	bl	c0deacf8 <pic>
c0de3eb4:	e284      	b.n	c0de43c0 <nbgl_layoutAddExtendedFooter+0x6e4>
c0de3eb6:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3eba:	f002 fc0b 	bl	c0de66d4 <OUTLINED_FUNCTION_0>
c0de3ebe:	4606      	mov	r6, r0
c0de3ec0:	7a6a      	ldrb	r2, [r5, #9]
c0de3ec2:	7aab      	ldrb	r3, [r5, #10]
c0de3ec4:	f002 fc54 	bl	c0de6770 <OUTLINED_FUNCTION_6>
c0de3ec8:	2800      	cmp	r0, #0
c0de3eca:	f000 8257 	beq.w	c0de437c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de3ece:	2008      	movs	r0, #8
c0de3ed0:	4637      	mov	r7, r6
c0de3ed2:	f04f 0a01 	mov.w	sl, #1
c0de3ed6:	21a0      	movs	r1, #160	@ 0xa0
c0de3ed8:	f04f 0800 	mov.w	r8, #0
c0de3edc:	75b0      	strb	r0, [r6, #22]
c0de3ede:	7a28      	ldrb	r0, [r5, #8]
c0de3ee0:	f886 a005 	strb.w	sl, [r6, #5]
c0de3ee4:	7131      	strb	r1, [r6, #4]
c0de3ee6:	77f0      	strb	r0, [r6, #31]
c0de3ee8:	2060      	movs	r0, #96	@ 0x60
c0de3eea:	f807 0f06 	strb.w	r0, [r7, #6]!
c0de3eee:	f887 8001 	strb.w	r8, [r7, #1]
c0de3ef2:	f002 fd21 	bl	c0de6938 <OUTLINED_FUNCTION_23>
c0de3ef6:	4631      	mov	r1, r6
c0de3ef8:	0e02      	lsrs	r2, r0, #24
c0de3efa:	f002 fcbd 	bl	c0de6878 <OUTLINED_FUNCTION_15>
c0de3efe:	7a29      	ldrb	r1, [r5, #8]
c0de3f00:	f886 801d 	strb.w	r8, [r6, #29]
c0de3f04:	f886 a01e 	strb.w	sl, [r6, #30]
c0de3f08:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de3f0c:	2005      	movs	r0, #5
c0de3f0e:	f886 a01c 	strb.w	sl, [r6, #28]
c0de3f12:	f886 0020 	strb.w	r0, [r6, #32]
c0de3f16:	200b      	movs	r0, #11
c0de3f18:	2900      	cmp	r1, #0
c0de3f1a:	bf08      	it	eq
c0de3f1c:	200c      	moveq	r0, #12
c0de3f1e:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de3f22:	6922      	ldr	r2, [r4, #16]
c0de3f24:	7879      	ldrb	r1, [r7, #1]
c0de3f26:	7838      	ldrb	r0, [r7, #0]
c0de3f28:	f002 fe76 	bl	c0de6c18 <OUTLINED_FUNCTION_65>
c0de3f2c:	e1f6      	b.n	c0de431c <nbgl_layoutAddExtendedFooter+0x640>
c0de3f2e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3f32:	f002 fbcf 	bl	c0de66d4 <OUTLINED_FUNCTION_0>
c0de3f36:	4606      	mov	r6, r0
c0de3f38:	7b2a      	ldrb	r2, [r5, #12]
c0de3f3a:	7bab      	ldrb	r3, [r5, #14]
c0de3f3c:	f002 fc18 	bl	c0de6770 <OUTLINED_FUNCTION_6>
c0de3f40:	2800      	cmp	r0, #0
c0de3f42:	f000 821b 	beq.w	c0de437c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de3f46:	2007      	movs	r0, #7
c0de3f48:	f04f 0a00 	mov.w	sl, #0
c0de3f4c:	f04f 08d0 	mov.w	r8, #208	@ 0xd0
c0de3f50:	75b0      	strb	r0, [r6, #22]
c0de3f52:	2060      	movs	r0, #96	@ 0x60
c0de3f54:	f886 a01f 	strb.w	sl, [r6, #31]
c0de3f58:	f886 a007 	strb.w	sl, [r6, #7]
c0de3f5c:	f886 a005 	strb.w	sl, [r6, #5]
c0de3f60:	f886 8004 	strb.w	r8, [r6, #4]
c0de3f64:	71b0      	strb	r0, [r6, #6]
c0de3f66:	f002 fce7 	bl	c0de6938 <OUTLINED_FUNCTION_23>
c0de3f6a:	4631      	mov	r1, r6
c0de3f6c:	0e02      	lsrs	r2, r0, #24
c0de3f6e:	f04f 0b01 	mov.w	fp, #1
c0de3f72:	f886 a01d 	strb.w	sl, [r6, #29]
c0de3f76:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de3f7a:	f886 b01e 	strb.w	fp, [r6, #30]
c0de3f7e:	f002 fc54 	bl	c0de682a <OUTLINED_FUNCTION_12>
c0de3f82:	f002 fe2a 	bl	c0de6bda <OUTLINED_FUNCTION_59>
c0de3f86:	f886 0020 	strb.w	r0, [r6, #32]
c0de3f8a:	6920      	ldr	r0, [r4, #16]
c0de3f8c:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de3f90:	3101      	adds	r1, #1
c0de3f92:	f880 1020 	strb.w	r1, [r0, #32]
c0de3f96:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3f9a:	f002 fb9b 	bl	c0de66d4 <OUTLINED_FUNCTION_0>
c0de3f9e:	4606      	mov	r6, r0
c0de3fa0:	7b6a      	ldrb	r2, [r5, #13]
c0de3fa2:	7bab      	ldrb	r3, [r5, #14]
c0de3fa4:	f002 fbe4 	bl	c0de6770 <OUTLINED_FUNCTION_6>
c0de3fa8:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de3fac:	2800      	cmp	r0, #0
c0de3fae:	f000 81e7 	beq.w	c0de4380 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de3fb2:	2009      	movs	r0, #9
c0de3fb4:	f886 8004 	strb.w	r8, [r6, #4]
c0de3fb8:	46b0      	mov	r8, r6
c0de3fba:	f886 a01f 	strb.w	sl, [r6, #31]
c0de3fbe:	f886 a005 	strb.w	sl, [r6, #5]
c0de3fc2:	75b0      	strb	r0, [r6, #22]
c0de3fc4:	2060      	movs	r0, #96	@ 0x60
c0de3fc6:	f808 0f06 	strb.w	r0, [r8, #6]!
c0de3fca:	f888 a001 	strb.w	sl, [r8, #1]
c0de3fce:	f002 fdbb 	bl	c0de6b48 <OUTLINED_FUNCTION_49>
c0de3fd2:	f002 fdfd 	bl	c0de6bd0 <OUTLINED_FUNCTION_58>
c0de3fd6:	f002 fc4f 	bl	c0de6878 <OUTLINED_FUNCTION_15>
c0de3fda:	f898 1001 	ldrb.w	r1, [r8, #1]
c0de3fde:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de3fe2:	200c      	movs	r0, #12
c0de3fe4:	f002 fdf9 	bl	c0de6bda <OUTLINED_FUNCTION_59>
c0de3fe8:	6922      	ldr	r2, [r4, #16]
c0de3fea:	f886 0020 	strb.w	r0, [r6, #32]
c0de3fee:	2003      	movs	r0, #3
c0de3ff0:	77b0      	strb	r0, [r6, #30]
c0de3ff2:	f898 0000 	ldrb.w	r0, [r8]
c0de3ff6:	f002 fe0f 	bl	c0de6c18 <OUTLINED_FUNCTION_65>
c0de3ffa:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3ffe:	f002 fe01 	bl	c0de6c04 <OUTLINED_FUNCTION_63>
c0de4002:	4680      	mov	r8, r0
c0de4004:	f880 a005 	strb.w	sl, [r0, #5]
c0de4008:	f880 b004 	strb.w	fp, [r0, #4]
c0de400c:	20ff      	movs	r0, #255	@ 0xff
c0de400e:	0e31      	lsrs	r1, r6, #24
c0de4010:	f888 0018 	strb.w	r0, [r8, #24]
c0de4014:	0a30      	lsrs	r0, r6, #8
c0de4016:	f888 7017 	strb.w	r7, [r8, #23]
c0de401a:	f888 b021 	strb.w	fp, [r8, #33]	@ 0x21
c0de401e:	f888 a01f 	strb.w	sl, [r8, #31]
c0de4022:	f888 0013 	strb.w	r0, [r8, #19]
c0de4026:	2002      	movs	r0, #2
c0de4028:	f888 0020 	strb.w	r0, [r8, #32]
c0de402c:	2004      	movs	r0, #4
c0de402e:	f888 0016 	strb.w	r0, [r8, #22]
c0de4032:	4640      	mov	r0, r8
c0de4034:	f800 6f12 	strb.w	r6, [r0, #18]!
c0de4038:	70c1      	strb	r1, [r0, #3]
c0de403a:	0c31      	lsrs	r1, r6, #16
c0de403c:	7081      	strb	r1, [r0, #2]
c0de403e:	6920      	ldr	r0, [r4, #16]
c0de4040:	7981      	ldrb	r1, [r0, #6]
c0de4042:	79c0      	ldrb	r0, [r0, #7]
c0de4044:	f888 0007 	strb.w	r0, [r8, #7]
c0de4048:	f888 1006 	strb.w	r1, [r8, #6]
c0de404c:	e166      	b.n	c0de431c <nbgl_layoutAddExtendedFooter+0x640>
c0de404e:	f04f 0b00 	mov.w	fp, #0
c0de4052:	2760      	movs	r7, #96	@ 0x60
c0de4054:	f04f 0a01 	mov.w	sl, #1
c0de4058:	21e0      	movs	r1, #224	@ 0xe0
c0de405a:	f880 b007 	strb.w	fp, [r0, #7]
c0de405e:	7187      	strb	r7, [r0, #6]
c0de4060:	f880 a005 	strb.w	sl, [r0, #5]
c0de4064:	7101      	strb	r1, [r0, #4]
c0de4066:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de406a:	f002 fb33 	bl	c0de66d4 <OUTLINED_FUNCTION_0>
c0de406e:	4606      	mov	r6, r0
c0de4070:	7d2a      	ldrb	r2, [r5, #20]
c0de4072:	7d6b      	ldrb	r3, [r5, #21]
c0de4074:	f002 fb7c 	bl	c0de6770 <OUTLINED_FUNCTION_6>
c0de4078:	2800      	cmp	r0, #0
c0de407a:	f000 817f 	beq.w	c0de437c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de407e:	1d28      	adds	r0, r5, #4
c0de4080:	46b0      	mov	r8, r6
c0de4082:	f886 b01f 	strb.w	fp, [r6, #31]
c0de4086:	f886 b007 	strb.w	fp, [r6, #7]
c0de408a:	71b7      	strb	r7, [r6, #6]
c0de408c:	9001      	str	r0, [sp, #4]
c0de408e:	2007      	movs	r0, #7
c0de4090:	75b0      	strb	r0, [r6, #22]
c0de4092:	20c0      	movs	r0, #192	@ 0xc0
c0de4094:	f808 0f04 	strb.w	r0, [r8, #4]!
c0de4098:	f888 b001 	strb.w	fp, [r8, #1]
c0de409c:	6928      	ldr	r0, [r5, #16]
c0de409e:	f006 fe2b 	bl	c0deacf8 <pic>
c0de40a2:	4631      	mov	r1, r6
c0de40a4:	0e02      	lsrs	r2, r0, #24
c0de40a6:	f886 a01e 	strb.w	sl, [r6, #30]
c0de40aa:	f886 b01d 	strb.w	fp, [r6, #29]
c0de40ae:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de40b2:	f002 fbba 	bl	c0de682a <OUTLINED_FUNCTION_12>
c0de40b6:	f886 a01c 	strb.w	sl, [r6, #28]
c0de40ba:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de40be:	2005      	movs	r0, #5
c0de40c0:	f886 0020 	strb.w	r0, [r6, #32]
c0de40c4:	6920      	ldr	r0, [r4, #16]
c0de40c6:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de40ca:	3101      	adds	r1, #1
c0de40cc:	f880 1020 	strb.w	r1, [r0, #32]
c0de40d0:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de40d4:	f002 fbe7 	bl	c0de68a6 <OUTLINED_FUNCTION_16>
c0de40d8:	4682      	mov	sl, r0
c0de40da:	2004      	movs	r0, #4
c0de40dc:	2101      	movs	r1, #1
c0de40de:	f88a 0020 	strb.w	r0, [sl, #32]
c0de40e2:	20a0      	movs	r0, #160	@ 0xa0
c0de40e4:	4656      	mov	r6, sl
c0de40e6:	f88a b01f 	strb.w	fp, [sl, #31]
c0de40ea:	f806 0f04 	strb.w	r0, [r6, #4]!
c0de40ee:	7071      	strb	r1, [r6, #1]
c0de40f0:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de40f4:	f002 fd82 	bl	c0de6bfc <OUTLINED_FUNCTION_62>
c0de40f8:	2109      	movs	r1, #9
c0de40fa:	0e02      	lsrs	r2, r0, #24
c0de40fc:	f88a b007 	strb.w	fp, [sl, #7]
c0de4100:	f88a 1016 	strb.w	r1, [sl, #22]
c0de4104:	2160      	movs	r1, #96	@ 0x60
c0de4106:	f88a 1006 	strb.w	r1, [sl, #6]
c0de410a:	4651      	mov	r1, sl
c0de410c:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de4110:	f002 fd0e 	bl	c0de6b30 <OUTLINED_FUNCTION_47>
c0de4114:	f88a 0023 	strb.w	r0, [sl, #35]	@ 0x23
c0de4118:	f898 0000 	ldrb.w	r0, [r8]
c0de411c:	f898 1001 	ldrb.w	r1, [r8, #1]
c0de4120:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de4124:	9901      	ldr	r1, [sp, #4]
c0de4126:	f5c0 70f0 	rsb	r0, r0, #480	@ 0x1e0
c0de412a:	7030      	strb	r0, [r6, #0]
c0de412c:	0a00      	lsrs	r0, r0, #8
c0de412e:	7070      	strb	r0, [r6, #1]
c0de4130:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4134:	08c2      	lsrs	r2, r0, #3
c0de4136:	4650      	mov	r0, sl
c0de4138:	f002 fe40 	bl	c0de6dbc <layoutNavigationPopulate>
c0de413c:	792a      	ldrb	r2, [r5, #4]
c0de413e:	7b2b      	ldrb	r3, [r5, #12]
c0de4140:	4620      	mov	r0, r4
c0de4142:	4651      	mov	r1, sl
c0de4144:	f7fe ffa4 	bl	c0de3090 <layoutAddCallbackObj>
c0de4148:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de414c:	2800      	cmp	r0, #0
c0de414e:	f000 8117 	beq.w	c0de4380 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de4152:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4156:	f002 fd55 	bl	c0de6c04 <OUTLINED_FUNCTION_63>
c0de415a:	4680      	mov	r8, r0
c0de415c:	2002      	movs	r0, #2
c0de415e:	2101      	movs	r1, #1
c0de4160:	f888 0020 	strb.w	r0, [r8, #32]
c0de4164:	2000      	movs	r0, #0
c0de4166:	f888 1004 	strb.w	r1, [r8, #4]
c0de416a:	f888 1021 	strb.w	r1, [r8, #33]	@ 0x21
c0de416e:	ea4f 611a 	mov.w	r1, sl, lsr #24
c0de4172:	f888 7017 	strb.w	r7, [r8, #23]
c0de4176:	f888 0005 	strb.w	r0, [r8, #5]
c0de417a:	f888 001f 	strb.w	r0, [r8, #31]
c0de417e:	2004      	movs	r0, #4
c0de4180:	f888 0016 	strb.w	r0, [r8, #22]
c0de4184:	20ff      	movs	r0, #255	@ 0xff
c0de4186:	f888 0018 	strb.w	r0, [r8, #24]
c0de418a:	ea4f 201a 	mov.w	r0, sl, lsr #8
c0de418e:	f888 0013 	strb.w	r0, [r8, #19]
c0de4192:	4640      	mov	r0, r8
c0de4194:	f800 af12 	strb.w	sl, [r0, #18]!
c0de4198:	70c1      	strb	r1, [r0, #3]
c0de419a:	ea4f 411a 	mov.w	r1, sl, lsr #16
c0de419e:	7081      	strb	r1, [r0, #2]
c0de41a0:	6920      	ldr	r0, [r4, #16]
c0de41a2:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de41a6:	f810 3c1b 	ldrb.w	r3, [r0, #-27]
c0de41aa:	f810 2c1c 	ldrb.w	r2, [r0, #-28]
c0de41ae:	7847      	ldrb	r7, [r0, #1]
c0de41b0:	f810 6c02 	ldrb.w	r6, [r0, #-2]
c0de41b4:	f888 3007 	strb.w	r3, [r8, #7]
c0de41b8:	f888 2006 	strb.w	r2, [r8, #6]
c0de41bc:	ea41 2107 	orr.w	r1, r1, r7, lsl #8
c0de41c0:	79aa      	ldrb	r2, [r5, #6]
c0de41c2:	f884 20a9 	strb.w	r2, [r4, #169]	@ 0xa9
c0de41c6:	78c2      	ldrb	r2, [r0, #3]
c0de41c8:	7880      	ldrb	r0, [r0, #2]
c0de41ca:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de41ce:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de41d2:	7969      	ldrb	r1, [r5, #5]
c0de41d4:	f840 a026 	str.w	sl, [r0, r6, lsl #2]
c0de41d8:	f884 10a8 	strb.w	r1, [r4, #168]	@ 0xa8
c0de41dc:	e09b      	b.n	c0de4316 <nbgl_layoutAddExtendedFooter+0x63a>
c0de41de:	2100      	movs	r1, #0
c0de41e0:	71c1      	strb	r1, [r0, #7]
c0de41e2:	2160      	movs	r1, #96	@ 0x60
c0de41e4:	7181      	strb	r1, [r0, #6]
c0de41e6:	2101      	movs	r1, #1
c0de41e8:	7141      	strb	r1, [r0, #5]
c0de41ea:	21e0      	movs	r1, #224	@ 0xe0
c0de41ec:	7101      	strb	r1, [r0, #4]
c0de41ee:	1d29      	adds	r1, r5, #4
c0de41f0:	f894 20ad 	ldrb.w	r2, [r4, #173]	@ 0xad
c0de41f4:	08d2      	lsrs	r2, r2, #3
c0de41f6:	f002 fde1 	bl	c0de6dbc <layoutNavigationPopulate>
c0de41fa:	6921      	ldr	r1, [r4, #16]
c0de41fc:	2004      	movs	r0, #4
c0de41fe:	f881 0020 	strb.w	r0, [r1, #32]
c0de4202:	4620      	mov	r0, r4
c0de4204:	792a      	ldrb	r2, [r5, #4]
c0de4206:	7b2b      	ldrb	r3, [r5, #12]
c0de4208:	f7fe ff42 	bl	c0de3090 <layoutAddCallbackObj>
c0de420c:	2800      	cmp	r0, #0
c0de420e:	f000 80b5 	beq.w	c0de437c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de4212:	79a8      	ldrb	r0, [r5, #6]
c0de4214:	f04f 0800 	mov.w	r8, #0
c0de4218:	f884 00a9 	strb.w	r0, [r4, #169]	@ 0xa9
c0de421c:	7968      	ldrb	r0, [r5, #5]
c0de421e:	f884 00a8 	strb.w	r0, [r4, #168]	@ 0xa8
c0de4222:	e07b      	b.n	c0de431c <nbgl_layoutAddExtendedFooter+0x640>
c0de4224:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4228:	2605      	movs	r6, #5
c0de422a:	f002 fb40 	bl	c0de68ae <OUTLINED_FUNCTION_17>
c0de422e:	4607      	mov	r7, r0
c0de4230:	7b2a      	ldrb	r2, [r5, #12]
c0de4232:	7c2b      	ldrb	r3, [r5, #16]
c0de4234:	4620      	mov	r0, r4
c0de4236:	4639      	mov	r1, r7
c0de4238:	f7fe ff2a 	bl	c0de3090 <layoutAddCallbackObj>
c0de423c:	2800      	cmp	r0, #0
c0de423e:	f000 809d 	beq.w	c0de437c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de4242:	75be      	strb	r6, [r7, #22]
c0de4244:	2100      	movs	r1, #0
c0de4246:	f04f 0800 	mov.w	r8, #0
c0de424a:	7b68      	ldrb	r0, [r5, #13]
c0de424c:	2800      	cmp	r0, #0
c0de424e:	bf08      	it	eq
c0de4250:	2103      	moveq	r1, #3
c0de4252:	f887 1021 	strb.w	r1, [r7, #33]	@ 0x21
c0de4256:	bf18      	it	ne
c0de4258:	2003      	movne	r0, #3
c0de425a:	77f8      	strb	r0, [r7, #31]
c0de425c:	7b68      	ldrb	r0, [r5, #13]
c0de425e:	4601      	mov	r1, r0
c0de4260:	2800      	cmp	r0, #0
c0de4262:	bf18      	it	ne
c0de4264:	2101      	movne	r1, #1
c0de4266:	0049      	lsls	r1, r1, #1
c0de4268:	2802      	cmp	r0, #2
c0de426a:	bf08      	it	eq
c0de426c:	2103      	moveq	r1, #3
c0de426e:	f887 1020 	strb.w	r1, [r7, #32]
c0de4272:	f002 fb61 	bl	c0de6938 <OUTLINED_FUNCTION_23>
c0de4276:	463e      	mov	r6, r7
c0de4278:	210c      	movs	r1, #12
c0de427a:	f887 1023 	strb.w	r1, [r7, #35]	@ 0x23
c0de427e:	f806 0f25 	strb.w	r0, [r6, #37]!
c0de4282:	0e01      	lsrs	r1, r0, #24
c0de4284:	f002 fcaf 	bl	c0de6be6 <OUTLINED_FUNCTION_60>
c0de4288:	f887 0026 	strb.w	r0, [r7, #38]	@ 0x26
c0de428c:	f002 fc5c 	bl	c0de6b48 <OUTLINED_FUNCTION_49>
c0de4290:	2103      	movs	r1, #3
c0de4292:	0e02      	lsrs	r2, r0, #24
c0de4294:	f887 8007 	strb.w	r8, [r7, #7]
c0de4298:	f887 1022 	strb.w	r1, [r7, #34]	@ 0x22
c0de429c:	2158      	movs	r1, #88	@ 0x58
c0de429e:	71b9      	strb	r1, [r7, #6]
c0de42a0:	4639      	mov	r1, r7
c0de42a2:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de42a6:	f002 fc43 	bl	c0de6b30 <OUTLINED_FUNCTION_47>
c0de42aa:	f887 002f 	strb.w	r0, [r7, #47]	@ 0x2f
c0de42ae:	2188      	movs	r1, #136	@ 0x88
c0de42b0:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de42b4:	6920      	ldr	r0, [r4, #16]
c0de42b6:	f880 8007 	strb.w	r8, [r0, #7]
c0de42ba:	7181      	strb	r1, [r0, #6]
c0de42bc:	6869      	ldr	r1, [r5, #4]
c0de42be:	2900      	cmp	r1, #0
c0de42c0:	bf08      	it	eq
c0de42c2:	2258      	moveq	r2, #88	@ 0x58
c0de42c4:	713a      	strb	r2, [r7, #4]
c0de42c6:	f896 c000 	ldrb.w	ip, [r6]
c0de42ca:	f896 e002 	ldrb.w	lr, [r6, #2]
c0de42ce:	f896 a003 	ldrb.w	sl, [r6, #3]
c0de42d2:	f887 801d 	strb.w	r8, [r7, #29]
c0de42d6:	0a11      	lsrs	r1, r2, #8
c0de42d8:	7179      	strb	r1, [r7, #5]
c0de42da:	f810 6f22 	ldrb.w	r6, [r0, #34]!
c0de42de:	7842      	ldrb	r2, [r0, #1]
c0de42e0:	f810 1c02 	ldrb.w	r1, [r0, #-2]
c0de42e4:	7883      	ldrb	r3, [r0, #2]
c0de42e6:	78c0      	ldrb	r0, [r0, #3]
c0de42e8:	ea46 2202 	orr.w	r2, r6, r2, lsl #8
c0de42ec:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de42f0:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de42f4:	f897 2026 	ldrb.w	r2, [r7, #38]	@ 0x26
c0de42f8:	f840 7021 	str.w	r7, [r0, r1, lsl #2]
c0de42fc:	2001      	movs	r0, #1
c0de42fe:	ea4e 210a 	orr.w	r1, lr, sl, lsl #8
c0de4302:	7738      	strb	r0, [r7, #28]
c0de4304:	ea4c 2002 	orr.w	r0, ip, r2, lsl #8
c0de4308:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de430c:	2107      	movs	r1, #7
c0de430e:	2800      	cmp	r0, #0
c0de4310:	bf08      	it	eq
c0de4312:	2101      	moveq	r1, #1
c0de4314:	77b9      	strb	r1, [r7, #30]
c0de4316:	6920      	ldr	r0, [r4, #16]
c0de4318:	f002 f9e0 	bl	c0de66dc <OUTLINED_FUNCTION_1>
c0de431c:	7828      	ldrb	r0, [r5, #0]
c0de431e:	3803      	subs	r0, #3
c0de4320:	2801      	cmp	r0, #1
c0de4322:	d808      	bhi.n	c0de4336 <nbgl_layoutAddExtendedFooter+0x65a>
c0de4324:	7b28      	ldrb	r0, [r5, #12]
c0de4326:	792b      	ldrb	r3, [r5, #4]
c0de4328:	f44f 61c0 	mov.w	r1, #1536	@ 0x600
c0de432c:	2200      	movs	r2, #0
c0de432e:	9000      	str	r0, [sp, #0]
c0de4330:	4620      	mov	r0, r4
c0de4332:	f7ff fc7c 	bl	c0de3c2e <addSwipeInternal>
c0de4336:	7868      	ldrb	r0, [r5, #1]
c0de4338:	b148      	cbz	r0, c0de434e <nbgl_layoutAddExtendedFooter+0x672>
c0de433a:	f002 fb10 	bl	c0de695e <OUTLINED_FUNCTION_25>
c0de433e:	6921      	ldr	r1, [r4, #16]
c0de4340:	f002 f9f9 	bl	c0de6736 <OUTLINED_FUNCTION_4>
c0de4344:	2102      	movs	r1, #2
c0de4346:	7581      	strb	r1, [r0, #22]
c0de4348:	6920      	ldr	r0, [r4, #16]
c0de434a:	f002 f9c7 	bl	c0de66dc <OUTLINED_FUNCTION_1>
c0de434e:	f1b8 0f00 	cmp.w	r8, #0
c0de4352:	d018      	beq.n	c0de4386 <nbgl_layoutAddExtendedFooter+0x6aa>
c0de4354:	6920      	ldr	r0, [r4, #16]
c0de4356:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de435a:	7843      	ldrb	r3, [r0, #1]
c0de435c:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de4360:	7886      	ldrb	r6, [r0, #2]
c0de4362:	78c0      	ldrb	r0, [r0, #3]
c0de4364:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de4368:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de436c:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de4370:	f840 8022 	str.w	r8, [r0, r2, lsl #2]
c0de4374:	6920      	ldr	r0, [r4, #16]
c0de4376:	f002 f9b1 	bl	c0de66dc <OUTLINED_FUNCTION_1>
c0de437a:	e005      	b.n	c0de4388 <nbgl_layoutAddExtendedFooter+0x6ac>
c0de437c:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de4380:	4638      	mov	r0, r7
c0de4382:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de4386:	6920      	ldr	r0, [r4, #16]
c0de4388:	68a1      	ldr	r1, [r4, #8]
c0de438a:	60c8      	str	r0, [r1, #12]
c0de438c:	6920      	ldr	r0, [r4, #16]
c0de438e:	f8d4 10a0 	ldr.w	r1, [r4, #160]	@ 0xa0
c0de4392:	f810 2f06 	ldrb.w	r2, [r0, #6]!
c0de4396:	7843      	ldrb	r3, [r0, #1]
c0de4398:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de439c:	f811 3f06 	ldrb.w	r3, [r1, #6]!
c0de43a0:	784e      	ldrb	r6, [r1, #1]
c0de43a2:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de43a6:	1a9a      	subs	r2, r3, r2
c0de43a8:	700a      	strb	r2, [r1, #0]
c0de43aa:	0a12      	lsrs	r2, r2, #8
c0de43ac:	704a      	strb	r2, [r1, #1]
c0de43ae:	7829      	ldrb	r1, [r5, #0]
c0de43b0:	f884 10ab 	strb.w	r1, [r4, #171]	@ 0xab
c0de43b4:	7801      	ldrb	r1, [r0, #0]
c0de43b6:	7840      	ldrb	r0, [r0, #1]
c0de43b8:	ea41 2700 	orr.w	r7, r1, r0, lsl #8
c0de43bc:	e7e0      	b.n	c0de4380 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de43be:	2000      	movs	r0, #0
c0de43c0:	f002 fc06 	bl	c0de6bd0 <OUTLINED_FUNCTION_58>
c0de43c4:	f002 fb11 	bl	c0de69ea <OUTLINED_FUNCTION_31>
c0de43c8:	f002 fa75 	bl	c0de68b6 <OUTLINED_FUNCTION_18>
c0de43cc:	f04f 0800 	mov.w	r8, #0
c0de43d0:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de43d4:	2009      	movs	r0, #9
c0de43d6:	77b0      	strb	r0, [r6, #30]
c0de43d8:	6920      	ldr	r0, [r4, #16]
c0de43da:	f002 f97f 	bl	c0de66dc <OUTLINED_FUNCTION_1>
c0de43de:	7c69      	ldrb	r1, [r5, #17]
c0de43e0:	f880 8007 	strb.w	r8, [r0, #7]
c0de43e4:	2900      	cmp	r1, #0
c0de43e6:	bf0c      	ite	eq
c0de43e8:	21d0      	moveq	r1, #208	@ 0xd0
c0de43ea:	21e8      	movne	r1, #232	@ 0xe8
c0de43ec:	7181      	strb	r1, [r0, #6]
c0de43ee:	e795      	b.n	c0de431c <nbgl_layoutAddExtendedFooter+0x640>

c0de43f0 <nbgl_layoutAddBottomButton>:
c0de43f0:	b570      	push	{r4, r5, r6, lr}
c0de43f2:	b086      	sub	sp, #24
c0de43f4:	4605      	mov	r5, r0
c0de43f6:	2005      	movs	r0, #5
c0de43f8:	2600      	movs	r6, #0
c0de43fa:	4614      	mov	r4, r2
c0de43fc:	f88d 3001 	strb.w	r3, [sp, #1]
c0de4400:	f88d 0000 	strb.w	r0, [sp]
c0de4404:	4608      	mov	r0, r1
c0de4406:	f88d 600e 	strb.w	r6, [sp, #14]
c0de440a:	f006 fc75 	bl	c0deacf8 <pic>
c0de440e:	9002      	str	r0, [sp, #8]
c0de4410:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de4412:	4669      	mov	r1, sp
c0de4414:	f88d 400c 	strb.w	r4, [sp, #12]
c0de4418:	9601      	str	r6, [sp, #4]
c0de441a:	f88d 0010 	strb.w	r0, [sp, #16]
c0de441e:	2001      	movs	r0, #1
c0de4420:	f88d 000d 	strb.w	r0, [sp, #13]
c0de4424:	4628      	mov	r0, r5
c0de4426:	f7ff fc59 	bl	c0de3cdc <nbgl_layoutAddExtendedFooter>
c0de442a:	b006      	add	sp, #24
c0de442c:	bd70      	pop	{r4, r5, r6, pc}

c0de442e <nbgl_layoutAddTouchableBar>:
c0de442e:	b5b0      	push	{r4, r5, r7, lr}
c0de4430:	b086      	sub	sp, #24
c0de4432:	b1e8      	cbz	r0, c0de4470 <nbgl_layoutAddTouchableBar+0x42>
c0de4434:	2200      	movs	r2, #0
c0de4436:	f88d 2000 	strb.w	r2, [sp]
c0de443a:	e891 003c 	ldmia.w	r1, {r2, r3, r4, r5}
c0de443e:	e9cd 3503 	strd	r3, r5, [sp, #12]
c0de4442:	e9cd 2401 	strd	r2, r4, [sp, #4]
c0de4446:	7c4a      	ldrb	r2, [r1, #17]
c0de4448:	f88d 2014 	strb.w	r2, [sp, #20]
c0de444c:	7d0a      	ldrb	r2, [r1, #20]
c0de444e:	f88d 2017 	strb.w	r2, [sp, #23]
c0de4452:	7c0a      	ldrb	r2, [r1, #16]
c0de4454:	7c89      	ldrb	r1, [r1, #18]
c0de4456:	f081 0101 	eor.w	r1, r1, #1
c0de445a:	f88d 2016 	strb.w	r2, [sp, #22]
c0de445e:	f88d 1015 	strb.w	r1, [sp, #21]
c0de4462:	4669      	mov	r1, sp
c0de4464:	f000 f808 	bl	c0de4478 <addListItem>
c0de4468:	b110      	cbz	r0, c0de4470 <nbgl_layoutAddTouchableBar+0x42>
c0de446a:	f002 fb9a 	bl	c0de6ba2 <OUTLINED_FUNCTION_55>
c0de446e:	e001      	b.n	c0de4474 <nbgl_layoutAddTouchableBar+0x46>
c0de4470:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de4474:	b006      	add	sp, #24
c0de4476:	bdb0      	pop	{r4, r5, r7, pc}

c0de4478 <addListItem>:
c0de4478:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de447c:	4682      	mov	sl, r0
c0de447e:	7808      	ldrb	r0, [r1, #0]
c0de4480:	4688      	mov	r8, r1
c0de4482:	b110      	cbz	r0, c0de448a <addListItem+0x12>
c0de4484:	f04f 0b00 	mov.w	fp, #0
c0de4488:	e006      	b.n	c0de4498 <addListItem+0x20>
c0de448a:	f898 0015 	ldrb.w	r0, [r8, #21]
c0de448e:	fab0 f080 	clz	r0, r0
c0de4492:	0940      	lsrs	r0, r0, #5
c0de4494:	ea4f 0b40 	mov.w	fp, r0, lsl #1
c0de4498:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de449c:	2401      	movs	r4, #1
c0de449e:	f002 fa02 	bl	c0de68a6 <OUTLINED_FUNCTION_16>
c0de44a2:	4606      	mov	r6, r0
c0de44a4:	f898 2014 	ldrb.w	r2, [r8, #20]
c0de44a8:	f898 3017 	ldrb.w	r3, [r8, #23]
c0de44ac:	4650      	mov	r0, sl
c0de44ae:	f002 fa2a 	bl	c0de6906 <OUTLINED_FUNCTION_20>
c0de44b2:	2500      	movs	r5, #0
c0de44b4:	2800      	cmp	r0, #0
c0de44b6:	d075      	beq.n	c0de45a4 <addListItem+0x12c>
c0de44b8:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de44bc:	f002 fb9e 	bl	c0de6bfc <OUTLINED_FUNCTION_62>
c0de44c0:	4631      	mov	r1, r6
c0de44c2:	0e02      	lsrs	r2, r0, #24
c0de44c4:	2364      	movs	r3, #100	@ 0x64
c0de44c6:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de44ca:	f801 5d10 	strb.w	r5, [r1, #-16]!
c0de44ce:	74ca      	strb	r2, [r1, #19]
c0de44d0:	0c02      	lsrs	r2, r0, #16
c0de44d2:	0a00      	lsrs	r0, r0, #8
c0de44d4:	f801 4c0d 	strb.w	r4, [r1, #-13]
c0de44d8:	f801 5c0b 	strb.w	r5, [r1, #-11]
c0de44dc:	7448      	strb	r0, [r1, #17]
c0de44de:	20a0      	movs	r0, #160	@ 0xa0
c0de44e0:	748a      	strb	r2, [r1, #18]
c0de44e2:	f801 0c0e 	strb.w	r0, [r1, #-14]
c0de44e6:	f898 2016 	ldrb.w	r2, [r8, #22]
c0de44ea:	f898 0000 	ldrb.w	r0, [r8]
c0de44ee:	2a00      	cmp	r2, #0
c0de44f0:	bf08      	it	eq
c0de44f2:	235c      	moveq	r3, #92	@ 0x5c
c0de44f4:	f801 3c0c 	strb.w	r3, [r1, #-12]
c0de44f8:	718d      	strb	r5, [r1, #6]
c0de44fa:	70cd      	strb	r5, [r1, #3]
c0de44fc:	708d      	strb	r5, [r1, #2]
c0de44fe:	704d      	strb	r5, [r1, #1]
c0de4500:	738d      	strb	r5, [r1, #14]
c0de4502:	734c      	strb	r4, [r1, #13]
c0de4504:	710d      	strb	r5, [r1, #4]
c0de4506:	2220      	movs	r2, #32
c0de4508:	2801      	cmp	r0, #1
c0de450a:	714a      	strb	r2, [r1, #5]
c0de450c:	d004      	beq.n	c0de4518 <addListItem+0xa0>
c0de450e:	b980      	cbnz	r0, c0de4532 <addListItem+0xba>
c0de4510:	f898 0015 	ldrb.w	r0, [r8, #21]
c0de4514:	2801      	cmp	r0, #1
c0de4516:	d10c      	bne.n	c0de4532 <addListItem+0xba>
c0de4518:	48c4      	ldr	r0, [pc, #784]	@ (c0de482c <addListItem+0x3b4>)
c0de451a:	f819 1000 	ldrb.w	r1, [r9, r0]
c0de451e:	1c4a      	adds	r2, r1, #1
c0de4520:	f809 2000 	strb.w	r2, [r9, r0]
c0de4524:	2000      	movs	r0, #0
c0de4526:	7770      	strb	r0, [r6, #29]
c0de4528:	2001      	movs	r0, #1
c0de452a:	7730      	strb	r0, [r6, #28]
c0de452c:	f101 0014 	add.w	r0, r1, #20
c0de4530:	77b0      	strb	r0, [r6, #30]
c0de4532:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de4536:	f002 f8cd 	bl	c0de66d4 <OUTLINED_FUNCTION_0>
c0de453a:	4607      	mov	r7, r0
c0de453c:	f880 b01f 	strb.w	fp, [r0, #31]
c0de4540:	f8d8 000c 	ldr.w	r0, [r8, #12]
c0de4544:	f006 fbd8 	bl	c0deacf8 <pic>
c0de4548:	2201      	movs	r2, #1
c0de454a:	2100      	movs	r1, #0
c0de454c:	f64f 74f0 	movw	r4, #65520	@ 0xfff0
c0de4550:	f887 2024 	strb.w	r2, [r7, #36]	@ 0x24
c0de4554:	220c      	movs	r2, #12
c0de4556:	f887 102d 	strb.w	r1, [r7, #45]	@ 0x2d
c0de455a:	f887 2022 	strb.w	r2, [r7, #34]	@ 0x22
c0de455e:	463a      	mov	r2, r7
c0de4560:	f802 1f2c 	strb.w	r1, [r2, #44]!
c0de4564:	70d1      	strb	r1, [r2, #3]
c0de4566:	7091      	strb	r1, [r2, #2]
c0de4568:	4639      	mov	r1, r7
c0de456a:	f002 fab4 	bl	c0de6ad6 <OUTLINED_FUNCTION_41>
c0de456e:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de4572:	7931      	ldrb	r1, [r6, #4]
c0de4574:	7972      	ldrb	r2, [r6, #5]
c0de4576:	7139      	strb	r1, [r7, #4]
c0de4578:	717a      	strb	r2, [r7, #5]
c0de457a:	f8d8 0004 	ldr.w	r0, [r8, #4]
c0de457e:	b198      	cbz	r0, c0de45a8 <addListItem+0x130>
c0de4580:	f006 fbba 	bl	c0deacf8 <pic>
c0de4584:	4639      	mov	r1, r7
c0de4586:	f811 2f04 	ldrb.w	r2, [r1, #4]!
c0de458a:	784b      	ldrb	r3, [r1, #1]
c0de458c:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de4590:	7803      	ldrb	r3, [r0, #0]
c0de4592:	7840      	ldrb	r0, [r0, #1]
c0de4594:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de4598:	1a20      	subs	r0, r4, r0
c0de459a:	4402      	add	r2, r0
c0de459c:	0a10      	lsrs	r0, r2, #8
c0de459e:	700a      	strb	r2, [r1, #0]
c0de45a0:	7048      	strb	r0, [r1, #1]
c0de45a2:	e003      	b.n	c0de45ac <addListItem+0x134>
c0de45a4:	2000      	movs	r0, #0
c0de45a6:	e13e      	b.n	c0de4826 <addListItem+0x3ae>
c0de45a8:	ea41 2202 	orr.w	r2, r1, r2, lsl #8
c0de45ac:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de45b0:	f8cd b00c 	str.w	fp, [sp, #12]
c0de45b4:	b160      	cbz	r0, c0de45d0 <addListItem+0x158>
c0de45b6:	f006 fb9f 	bl	c0deacf8 <pic>
c0de45ba:	7801      	ldrb	r1, [r0, #0]
c0de45bc:	7840      	ldrb	r0, [r0, #1]
c0de45be:	797a      	ldrb	r2, [r7, #5]
c0de45c0:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de45c4:	7939      	ldrb	r1, [r7, #4]
c0de45c6:	1a20      	subs	r0, r4, r0
c0de45c8:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de45cc:	1842      	adds	r2, r0, r1
c0de45ce:	e004      	b.n	c0de45da <addListItem+0x162>
c0de45d0:	f898 0000 	ldrb.w	r0, [r8]
c0de45d4:	2801      	cmp	r0, #1
c0de45d6:	d103      	bne.n	c0de45e0 <addListItem+0x168>
c0de45d8:	3a4c      	subs	r2, #76	@ 0x4c
c0de45da:	0a10      	lsrs	r0, r2, #8
c0de45dc:	713a      	strb	r2, [r7, #4]
c0de45de:	7178      	strb	r0, [r7, #5]
c0de45e0:	463c      	mov	r4, r7
c0de45e2:	f897 1027 	ldrb.w	r1, [r7, #39]	@ 0x27
c0de45e6:	f897 0022 	ldrb.w	r0, [r7, #34]	@ 0x22
c0de45ea:	f897 3024 	ldrb.w	r3, [r7, #36]	@ 0x24
c0de45ee:	b292      	uxth	r2, r2
c0de45f0:	f814 5f26 	ldrb.w	r5, [r4, #38]!
c0de45f4:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de45f8:	78a5      	ldrb	r5, [r4, #2]
c0de45fa:	78e4      	ldrb	r4, [r4, #3]
c0de45fc:	ea45 2404 	orr.w	r4, r5, r4, lsl #8
c0de4600:	ea41 4104 	orr.w	r1, r1, r4, lsl #16
c0de4604:	f006 f9b0 	bl	c0dea968 <nbgl_getTextHeightInWidth>
c0de4608:	4683      	mov	fp, r0
c0de460a:	4630      	mov	r0, r6
c0de460c:	4634      	mov	r4, r6
c0de460e:	f002 fa3c 	bl	c0de6a8a <OUTLINED_FUNCTION_38>
c0de4612:	f841 7022 	str.w	r7, [r1, r2, lsl #2]
c0de4616:	2100      	movs	r1, #0
c0de4618:	f887 b006 	strb.w	fp, [r7, #6]
c0de461c:	f887 1021 	strb.w	r1, [r7, #33]	@ 0x21
c0de4620:	2104      	movs	r1, #4
c0de4622:	f887 1020 	strb.w	r1, [r7, #32]
c0de4626:	75b9      	strb	r1, [r7, #22]
c0de4628:	ea4f 211b 	mov.w	r1, fp, lsr #8
c0de462c:	71f9      	strb	r1, [r7, #7]
c0de462e:	1c51      	adds	r1, r2, #1
c0de4630:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de4634:	f1bb 0f28 	cmp.w	fp, #40	@ 0x28
c0de4638:	bf98      	it	ls
c0de463a:	f04f 0b28 	movls.w	fp, #40	@ 0x28
c0de463e:	f8d8 0004 	ldr.w	r0, [r8, #4]
c0de4642:	9402      	str	r4, [sp, #8]
c0de4644:	b358      	cbz	r0, c0de469e <addListItem+0x226>
c0de4646:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de464a:	f002 f95f 	bl	c0de690c <OUTLINED_FUNCTION_21>
c0de464e:	4605      	mov	r5, r0
c0de4650:	9803      	ldr	r0, [sp, #12]
c0de4652:	77e8      	strb	r0, [r5, #31]
c0de4654:	f8d8 0004 	ldr.w	r0, [r8, #4]
c0de4658:	f006 fb4e 	bl	c0deacf8 <pic>
c0de465c:	f002 f93f 	bl	c0de68de <OUTLINED_FUNCTION_19>
c0de4660:	4620      	mov	r0, r4
c0de4662:	f810 cf22 	ldrb.w	ip, [r0, #34]!
c0de4666:	7846      	ldrb	r6, [r0, #1]
c0de4668:	7884      	ldrb	r4, [r0, #2]
c0de466a:	78c2      	ldrb	r2, [r0, #3]
c0de466c:	f810 3c02 	ldrb.w	r3, [r0, #-2]
c0de4670:	ea4c 2606 	orr.w	r6, ip, r6, lsl #8
c0de4674:	ea44 2202 	orr.w	r2, r4, r2, lsl #8
c0de4678:	ea46 4202 	orr.w	r2, r6, r2, lsl #16
c0de467c:	f002 faf8 	bl	c0de6c70 <OUTLINED_FUNCTION_72>
c0de4680:	2204      	movs	r2, #4
c0de4682:	f002 f971 	bl	c0de6968 <OUTLINED_FUNCTION_26>
c0de4686:	7801      	ldrb	r1, [r0, #0]
c0de4688:	f002 f8ee 	bl	c0de6868 <OUTLINED_FUNCTION_14>
c0de468c:	3110      	adds	r1, #16
c0de468e:	75f9      	strb	r1, [r7, #23]
c0de4690:	0a09      	lsrs	r1, r1, #8
c0de4692:	7639      	strb	r1, [r7, #24]
c0de4694:	fa0f f18b 	sxth.w	r1, fp
c0de4698:	4281      	cmp	r1, r0
c0de469a:	bfd8      	it	le
c0de469c:	4683      	movle	fp, r0
c0de469e:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de46a2:	f8cd a004 	str.w	sl, [sp, #4]
c0de46a6:	b348      	cbz	r0, c0de46fc <addListItem+0x284>
c0de46a8:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de46ac:	f002 f92e 	bl	c0de690c <OUTLINED_FUNCTION_21>
c0de46b0:	4605      	mov	r5, r0
c0de46b2:	9803      	ldr	r0, [sp, #12]
c0de46b4:	77e8      	strb	r0, [r5, #31]
c0de46b6:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de46ba:	f006 fb1d 	bl	c0deacf8 <pic>
c0de46be:	f002 f90e 	bl	c0de68de <OUTLINED_FUNCTION_19>
c0de46c2:	9802      	ldr	r0, [sp, #8]
c0de46c4:	f810 cf22 	ldrb.w	ip, [r0, #34]!
c0de46c8:	7844      	ldrb	r4, [r0, #1]
c0de46ca:	7886      	ldrb	r6, [r0, #2]
c0de46cc:	78c2      	ldrb	r2, [r0, #3]
c0de46ce:	f810 3c02 	ldrb.w	r3, [r0, #-2]
c0de46d2:	ea4c 2404 	orr.w	r4, ip, r4, lsl #8
c0de46d6:	ea46 2202 	orr.w	r2, r6, r2, lsl #8
c0de46da:	ea44 4202 	orr.w	r2, r4, r2, lsl #16
c0de46de:	f002 fac7 	bl	c0de6c70 <OUTLINED_FUNCTION_72>
c0de46e2:	2206      	movs	r2, #6
c0de46e4:	f002 f940 	bl	c0de6968 <OUTLINED_FUNCTION_26>
c0de46e8:	7881      	ldrb	r1, [r0, #2]
c0de46ea:	78c0      	ldrb	r0, [r0, #3]
c0de46ec:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
c0de46f0:	fa0f f08b 	sxth.w	r0, fp
c0de46f4:	4288      	cmp	r0, r1
c0de46f6:	bfc8      	it	gt
c0de46f8:	4659      	movgt	r1, fp
c0de46fa:	e028      	b.n	c0de474e <addListItem+0x2d6>
c0de46fc:	f898 0000 	ldrb.w	r0, [r8]
c0de4700:	2801      	cmp	r0, #1
c0de4702:	d123      	bne.n	c0de474c <addListItem+0x2d4>
c0de4704:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de4708:	f04f 0a06 	mov.w	sl, #6
c0de470c:	08c1      	lsrs	r1, r0, #3
c0de470e:	2006      	movs	r0, #6
c0de4710:	f006 f911 	bl	c0dea936 <nbgl_objPoolGet>
c0de4714:	0a39      	lsrs	r1, r7, #8
c0de4716:	0e3a      	lsrs	r2, r7, #24
c0de4718:	f880 a016 	strb.w	sl, [r0, #22]
c0de471c:	74c1      	strb	r1, [r0, #19]
c0de471e:	4601      	mov	r1, r0
c0de4720:	f002 fa92 	bl	c0de6c48 <OUTLINED_FUNCTION_69>
c0de4724:	9902      	ldr	r1, [sp, #8]
c0de4726:	f002 f977 	bl	c0de6a18 <OUTLINED_FUNCTION_33>
c0de472a:	2410      	movs	r4, #16
c0de472c:	f842 0023 	str.w	r0, [r2, r3, lsl #2]
c0de4730:	2200      	movs	r2, #0
c0de4732:	75c4      	strb	r4, [r0, #23]
c0de4734:	2402      	movs	r4, #2
c0de4736:	7602      	strb	r2, [r0, #24]
c0de4738:	77c2      	strb	r2, [r0, #31]
c0de473a:	f898 2015 	ldrb.w	r2, [r8, #21]
c0de473e:	f880 4020 	strb.w	r4, [r0, #32]
c0de4742:	f880 2021 	strb.w	r2, [r0, #33]	@ 0x21
c0de4746:	1c58      	adds	r0, r3, #1
c0de4748:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de474c:	4659      	mov	r1, fp
c0de474e:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de4752:	e9dd 5a01 	ldrd	r5, sl, [sp, #4]
c0de4756:	2800      	cmp	r0, #0
c0de4758:	d05c      	beq.n	c0de4814 <addListItem+0x39c>
c0de475a:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de475e:	9100      	str	r1, [sp, #0]
c0de4760:	2604      	movs	r6, #4
c0de4762:	f001 ffb7 	bl	c0de66d4 <OUTLINED_FUNCTION_0>
c0de4766:	4604      	mov	r4, r0
c0de4768:	9803      	ldr	r0, [sp, #12]
c0de476a:	77e0      	strb	r0, [r4, #31]
c0de476c:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de4770:	f006 fac2 	bl	c0deacf8 <pic>
c0de4774:	4601      	mov	r1, r0
c0de4776:	200b      	movs	r0, #11
c0de4778:	2301      	movs	r3, #1
c0de477a:	f884 6020 	strb.w	r6, [r4, #32]
c0de477e:	75a6      	strb	r6, [r4, #22]
c0de4780:	f884 0022 	strb.w	r0, [r4, #34]	@ 0x22
c0de4784:	2001      	movs	r0, #1
c0de4786:	0e0a      	lsrs	r2, r1, #24
c0de4788:	f884 0024 	strb.w	r0, [r4, #36]	@ 0x24
c0de478c:	2000      	movs	r0, #0
c0de478e:	f884 0021 	strb.w	r0, [r4, #33]	@ 0x21
c0de4792:	4620      	mov	r0, r4
c0de4794:	f002 f861 	bl	c0de685a <OUTLINED_FUNCTION_13>
c0de4798:	f884 0027 	strb.w	r0, [r4, #39]	@ 0x27
c0de479c:	f89a 2005 	ldrb.w	r2, [sl, #5]
c0de47a0:	f89a 0004 	ldrb.w	r0, [sl, #4]
c0de47a4:	7162      	strb	r2, [r4, #5]
c0de47a6:	7120      	strb	r0, [r4, #4]
c0de47a8:	ea40 2202 	orr.w	r2, r0, r2, lsl #8
c0de47ac:	f002 f9a3 	bl	c0de6af6 <OUTLINED_FUNCTION_43>
c0de47b0:	4651      	mov	r1, sl
c0de47b2:	46ac      	mov	ip, r5
c0de47b4:	f811 bf22 	ldrb.w	fp, [r1, #34]!
c0de47b8:	f811 8d1c 	ldrb.w	r8, [r1, #-28]!
c0de47bc:	7f4d      	ldrb	r5, [r1, #29]
c0de47be:	7fce      	ldrb	r6, [r1, #31]
c0de47c0:	7f8b      	ldrb	r3, [r1, #30]
c0de47c2:	7e8a      	ldrb	r2, [r1, #26]
c0de47c4:	f891 e001 	ldrb.w	lr, [r1, #1]
c0de47c8:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de47cc:	ea4b 2505 	orr.w	r5, fp, r5, lsl #8
c0de47d0:	ea45 4303 	orr.w	r3, r5, r3, lsl #16
c0de47d4:	2500      	movs	r5, #0
c0de47d6:	f843 4022 	str.w	r4, [r3, r2, lsl #2]
c0de47da:	f100 030c 	add.w	r3, r0, #12
c0de47de:	3201      	adds	r2, #1
c0de47e0:	eba5 0353 	sub.w	r3, r5, r3, lsr #1
c0de47e4:	2502      	movs	r5, #2
c0de47e6:	767b      	strb	r3, [r7, #25]
c0de47e8:	0a1b      	lsrs	r3, r3, #8
c0de47ea:	76bb      	strb	r3, [r7, #26]
c0de47ec:	0a03      	lsrs	r3, r0, #8
c0de47ee:	71a0      	strb	r0, [r4, #6]
c0de47f0:	71e3      	strb	r3, [r4, #7]
c0de47f2:	9b00      	ldr	r3, [sp, #0]
c0de47f4:	b21b      	sxth	r3, r3
c0de47f6:	330c      	adds	r3, #12
c0de47f8:	fb93 f3f5 	sdiv	r3, r3, r5
c0de47fc:	7663      	strb	r3, [r4, #25]
c0de47fe:	768a      	strb	r2, [r1, #26]
c0de4800:	ea48 220e 	orr.w	r2, r8, lr, lsl #8
c0de4804:	0a1d      	lsrs	r5, r3, #8
c0de4806:	4410      	add	r0, r2
c0de4808:	76a5      	strb	r5, [r4, #26]
c0de480a:	4665      	mov	r5, ip
c0de480c:	300c      	adds	r0, #12
c0de480e:	7008      	strb	r0, [r1, #0]
c0de4810:	0a00      	lsrs	r0, r0, #8
c0de4812:	7048      	strb	r0, [r1, #1]
c0de4814:	f8d5 00a0 	ldr.w	r0, [r5, #160]	@ 0xa0
c0de4818:	f002 f8b6 	bl	c0de6988 <OUTLINED_FUNCTION_27>
c0de481c:	f8d5 00a0 	ldr.w	r0, [r5, #160]	@ 0xa0
c0de4820:	f001 ff5c 	bl	c0de66dc <OUTLINED_FUNCTION_1>
c0de4824:	4650      	mov	r0, sl
c0de4826:	b004      	add	sp, #16
c0de4828:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de482c:	00001948 	.word	0x00001948

c0de4830 <nbgl_layoutAddSwitch>:
c0de4830:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de4832:	b1d8      	cbz	r0, c0de486c <nbgl_layoutAddSwitch+0x3c>
c0de4834:	2200      	movs	r2, #0
c0de4836:	e9cd 2201 	strd	r2, r2, [sp, #4]
c0de483a:	f88d 2016 	strb.w	r2, [sp, #22]
c0de483e:	2201      	movs	r2, #1
c0de4840:	f88d 2000 	strb.w	r2, [sp]
c0de4844:	e9d1 2300 	ldrd	r2, r3, [r1]
c0de4848:	e9cd 2303 	strd	r2, r3, [sp, #12]
c0de484c:	7a4a      	ldrb	r2, [r1, #9]
c0de484e:	f88d 2014 	strb.w	r2, [sp, #20]
c0de4852:	7a8a      	ldrb	r2, [r1, #10]
c0de4854:	7a09      	ldrb	r1, [r1, #8]
c0de4856:	f88d 1015 	strb.w	r1, [sp, #21]
c0de485a:	4669      	mov	r1, sp
c0de485c:	f88d 2017 	strb.w	r2, [sp, #23]
c0de4860:	f7ff fe0a 	bl	c0de4478 <addListItem>
c0de4864:	b110      	cbz	r0, c0de486c <nbgl_layoutAddSwitch+0x3c>
c0de4866:	f002 f99c 	bl	c0de6ba2 <OUTLINED_FUNCTION_55>
c0de486a:	e001      	b.n	c0de4870 <nbgl_layoutAddSwitch+0x40>
c0de486c:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de4870:	b006      	add	sp, #24
c0de4872:	bd80      	pop	{r7, pc}

c0de4874 <nbgl_layoutAddText>:
c0de4874:	b5e0      	push	{r5, r6, r7, lr}
c0de4876:	2300      	movs	r3, #0
c0de4878:	e9cd 3300 	strd	r3, r3, [sp]
c0de487c:	2300      	movs	r3, #0
c0de487e:	f000 f801 	bl	c0de4884 <addText>
c0de4882:	bd8c      	pop	{r2, r3, r7, pc}

c0de4884 <addText>:
c0de4884:	2800      	cmp	r0, #0
c0de4886:	f000 8115 	beq.w	c0de4ab4 <addText+0x230>
c0de488a:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de488e:	4683      	mov	fp, r0
c0de4890:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de4894:	460c      	mov	r4, r1
c0de4896:	9e0d      	ldr	r6, [sp, #52]	@ 0x34
c0de4898:	461f      	mov	r7, r3
c0de489a:	9203      	str	r2, [sp, #12]
c0de489c:	f04f 0a01 	mov.w	sl, #1
c0de48a0:	f002 f801 	bl	c0de68a6 <OUTLINED_FUNCTION_16>
c0de48a4:	4605      	mov	r5, r0
c0de48a6:	2002      	movs	r0, #2
c0de48a8:	2e00      	cmp	r6, #0
c0de48aa:	bf18      	it	ne
c0de48ac:	2003      	movne	r0, #3
c0de48ae:	f89b 10ad 	ldrb.w	r1, [fp, #173]	@ 0xad
c0de48b2:	f002 f9eb 	bl	c0de6c8c <OUTLINED_FUNCTION_74>
c0de48b6:	21a0      	movs	r1, #160	@ 0xa0
c0de48b8:	0e02      	lsrs	r2, r0, #24
c0de48ba:	f04f 0800 	mov.w	r8, #0
c0de48be:	f885 a005 	strb.w	sl, [r5, #5]
c0de48c2:	7129      	strb	r1, [r5, #4]
c0de48c4:	4629      	mov	r1, r5
c0de48c6:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de48ca:	70ca      	strb	r2, [r1, #3]
c0de48cc:	0c02      	lsrs	r2, r0, #16
c0de48ce:	0a00      	lsrs	r0, r0, #8
c0de48d0:	2c00      	cmp	r4, #0
c0de48d2:	708a      	strb	r2, [r1, #2]
c0de48d4:	f885 0023 	strb.w	r0, [r5, #35]	@ 0x23
c0de48d8:	f000 809f 	beq.w	c0de4a1a <addText+0x196>
c0de48dc:	f89b 00ad 	ldrb.w	r0, [fp, #173]	@ 0xad
c0de48e0:	9701      	str	r7, [sp, #4]
c0de48e2:	2604      	movs	r6, #4
c0de48e4:	f001 fef6 	bl	c0de66d4 <OUTLINED_FUNCTION_0>
c0de48e8:	4607      	mov	r7, r0
c0de48ea:	f880 801f 	strb.w	r8, [r0, #31]
c0de48ee:	4620      	mov	r0, r4
c0de48f0:	9402      	str	r4, [sp, #8]
c0de48f2:	f006 fa01 	bl	c0deacf8 <pic>
c0de48f6:	4601      	mov	r1, r0
c0de48f8:	201c      	movs	r0, #28
c0de48fa:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
c0de48fc:	f887 a024 	strb.w	sl, [r7, #36]	@ 0x24
c0de4900:	f887 801a 	strb.w	r8, [r7, #26]
c0de4904:	f887 6020 	strb.w	r6, [r7, #32]
c0de4908:	f887 8021 	strb.w	r8, [r7, #33]	@ 0x21
c0de490c:	f887 8016 	strb.w	r8, [r7, #22]
c0de4910:	7678      	strb	r0, [r7, #25]
c0de4912:	200c      	movs	r0, #12
c0de4914:	0e0a      	lsrs	r2, r1, #24
c0de4916:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de491a:	4638      	mov	r0, r7
c0de491c:	469a      	mov	sl, r3
c0de491e:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de4922:	f002 f8f7 	bl	c0de6b14 <OUTLINED_FUNCTION_45>
c0de4926:	796a      	ldrb	r2, [r5, #5]
c0de4928:	7928      	ldrb	r0, [r5, #4]
c0de492a:	7138      	strb	r0, [r7, #4]
c0de492c:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de4930:	717a      	strb	r2, [r7, #5]
c0de4932:	b153      	cbz	r3, c0de494a <addText+0xc6>
c0de4934:	4a71      	ldr	r2, [pc, #452]	@ (c0de4afc <addText+0x278>)
c0de4936:	447a      	add	r2, pc
c0de4938:	7813      	ldrb	r3, [r2, #0]
c0de493a:	7852      	ldrb	r2, [r2, #1]
c0de493c:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de4940:	1a80      	subs	r0, r0, r2
c0de4942:	380c      	subs	r0, #12
c0de4944:	0a02      	lsrs	r2, r0, #8
c0de4946:	7138      	strb	r0, [r7, #4]
c0de4948:	717a      	strb	r2, [r7, #5]
c0de494a:	b282      	uxth	r2, r0
c0de494c:	200c      	movs	r0, #12
c0de494e:	2301      	movs	r3, #1
c0de4950:	f006 f80a 	bl	c0dea968 <nbgl_getTextHeightInWidth>
c0de4954:	4629      	mov	r1, r5
c0de4956:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de495a:	784e      	ldrb	r6, [r1, #1]
c0de495c:	788c      	ldrb	r4, [r1, #2]
c0de495e:	78ca      	ldrb	r2, [r1, #3]
c0de4960:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de4964:	ea4c 2606 	orr.w	r6, ip, r6, lsl #8
c0de4968:	ea44 2202 	orr.w	r2, r4, r2, lsl #8
c0de496c:	ea46 4202 	orr.w	r2, r6, r2, lsl #16
c0de4970:	f842 7023 	str.w	r7, [r2, r3, lsl #2]
c0de4974:	0a02      	lsrs	r2, r0, #8
c0de4976:	71b8      	strb	r0, [r7, #6]
c0de4978:	71fa      	strb	r2, [r7, #7]
c0de497a:	1c5a      	adds	r2, r3, #1
c0de497c:	f801 2c02 	strb.w	r2, [r1, #-2]
c0de4980:	7e79      	ldrb	r1, [r7, #25]
c0de4982:	7eba      	ldrb	r2, [r7, #26]
c0de4984:	f1ba 0f00 	cmp.w	sl, #0
c0de4988:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de498c:	eb01 0800 	add.w	r8, r1, r0
c0de4990:	d042      	beq.n	c0de4a18 <addText+0x194>
c0de4992:	f89b 00ad 	ldrb.w	r0, [fp, #173]	@ 0xad
c0de4996:	f8dd a030 	ldr.w	sl, [sp, #48]	@ 0x30
c0de499a:	f001 ffb7 	bl	c0de690c <OUTLINED_FUNCTION_21>
c0de499e:	9a01      	ldr	r2, [sp, #4]
c0de49a0:	4606      	mov	r6, r0
c0de49a2:	4658      	mov	r0, fp
c0de49a4:	4629      	mov	r1, r5
c0de49a6:	2309      	movs	r3, #9
c0de49a8:	f7fe fb72 	bl	c0de3090 <layoutAddCallbackObj>
c0de49ac:	4954      	ldr	r1, [pc, #336]	@ (c0de4b00 <addText+0x27c>)
c0de49ae:	4479      	add	r1, pc
c0de49b0:	0a0a      	lsrs	r2, r1, #8
c0de49b2:	0e0b      	lsrs	r3, r1, #24
c0de49b4:	f886 2022 	strb.w	r2, [r6, #34]	@ 0x22
c0de49b8:	0a3a      	lsrs	r2, r7, #8
c0de49ba:	74f2      	strb	r2, [r6, #19]
c0de49bc:	4632      	mov	r2, r6
c0de49be:	f802 1f21 	strb.w	r1, [r2, #33]!
c0de49c2:	0c09      	lsrs	r1, r1, #16
c0de49c4:	7091      	strb	r1, [r2, #2]
c0de49c6:	4631      	mov	r1, r6
c0de49c8:	70d3      	strb	r3, [r2, #3]
c0de49ca:	0e3a      	lsrs	r2, r7, #24
c0de49cc:	f002 f93c 	bl	c0de6c48 <OUTLINED_FUNCTION_69>
c0de49d0:	4629      	mov	r1, r5
c0de49d2:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de49d6:	784c      	ldrb	r4, [r1, #1]
c0de49d8:	788f      	ldrb	r7, [r1, #2]
c0de49da:	78ca      	ldrb	r2, [r1, #3]
c0de49dc:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de49e0:	ea4c 2404 	orr.w	r4, ip, r4, lsl #8
c0de49e4:	ea47 2202 	orr.w	r2, r7, r2, lsl #8
c0de49e8:	ea44 4202 	orr.w	r2, r4, r2, lsl #16
c0de49ec:	240c      	movs	r4, #12
c0de49ee:	f842 6023 	str.w	r6, [r2, r3, lsl #2]
c0de49f2:	2200      	movs	r2, #0
c0de49f4:	75f4      	strb	r4, [r6, #23]
c0de49f6:	f880 a005 	strb.w	sl, [r0, #5]
c0de49fa:	2001      	movs	r0, #1
c0de49fc:	75b4      	strb	r4, [r6, #22]
c0de49fe:	7632      	strb	r2, [r6, #24]
c0de4a00:	77f2      	strb	r2, [r6, #31]
c0de4a02:	f801 0c06 	strb.w	r0, [r1, #-6]
c0de4a06:	f10a 000f 	add.w	r0, sl, #15
c0de4a0a:	f801 2c05 	strb.w	r2, [r1, #-5]
c0de4a0e:	f801 0c04 	strb.w	r0, [r1, #-4]
c0de4a12:	1c58      	adds	r0, r3, #1
c0de4a14:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de4a18:	9c02      	ldr	r4, [sp, #8]
c0de4a1a:	9e03      	ldr	r6, [sp, #12]
c0de4a1c:	2e00      	cmp	r6, #0
c0de4a1e:	d04b      	beq.n	c0de4ab8 <addText+0x234>
c0de4a20:	f89b 00ad 	ldrb.w	r0, [fp, #173]	@ 0xad
c0de4a24:	f001 fe56 	bl	c0de66d4 <OUTLINED_FUNCTION_0>
c0de4a28:	f04f 0a00 	mov.w	sl, #0
c0de4a2c:	4607      	mov	r7, r0
c0de4a2e:	f880 a01f 	strb.w	sl, [r0, #31]
c0de4a32:	f002 f906 	bl	c0de6c42 <OUTLINED_FUNCTION_68>
c0de4a36:	4601      	mov	r1, r0
c0de4a38:	200b      	movs	r0, #11
c0de4a3a:	2301      	movs	r3, #1
c0de4a3c:	f887 a021 	strb.w	sl, [r7, #33]	@ 0x21
c0de4a40:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de4a44:	2001      	movs	r0, #1
c0de4a46:	0e0a      	lsrs	r2, r1, #24
c0de4a48:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de4a4c:	4638      	mov	r0, r7
c0de4a4e:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de4a52:	f002 f85f 	bl	c0de6b14 <OUTLINED_FUNCTION_45>
c0de4a56:	796a      	ldrb	r2, [r5, #5]
c0de4a58:	7928      	ldrb	r0, [r5, #4]
c0de4a5a:	717a      	strb	r2, [r7, #5]
c0de4a5c:	7138      	strb	r0, [r7, #4]
c0de4a5e:	ea40 2202 	orr.w	r2, r0, r2, lsl #8
c0de4a62:	f002 f848 	bl	c0de6af6 <OUTLINED_FUNCTION_43>
c0de4a66:	210e      	movs	r1, #14
c0de4a68:	f887 a01a 	strb.w	sl, [r7, #26]
c0de4a6c:	462a      	mov	r2, r5
c0de4a6e:	2c00      	cmp	r4, #0
c0de4a70:	bf08      	it	eq
c0de4a72:	211a      	moveq	r1, #26
c0de4a74:	7679      	strb	r1, [r7, #25]
c0de4a76:	f887 a016 	strb.w	sl, [r7, #22]
c0de4a7a:	f812 cf22 	ldrb.w	ip, [r2, #34]!
c0de4a7e:	7856      	ldrb	r6, [r2, #1]
c0de4a80:	f892 e002 	ldrb.w	lr, [r2, #2]
c0de4a84:	78d3      	ldrb	r3, [r2, #3]
c0de4a86:	f812 4c02 	ldrb.w	r4, [r2, #-2]
c0de4a8a:	ea4c 2606 	orr.w	r6, ip, r6, lsl #8
c0de4a8e:	ea4e 2303 	orr.w	r3, lr, r3, lsl #8
c0de4a92:	ea46 4303 	orr.w	r3, r6, r3, lsl #16
c0de4a96:	f843 7024 	str.w	r7, [r3, r4, lsl #2]
c0de4a9a:	2304      	movs	r3, #4
c0de4a9c:	71b8      	strb	r0, [r7, #6]
c0de4a9e:	f887 3020 	strb.w	r3, [r7, #32]
c0de4aa2:	0a03      	lsrs	r3, r0, #8
c0de4aa4:	4440      	add	r0, r8
c0de4aa6:	4408      	add	r0, r1
c0de4aa8:	71fb      	strb	r3, [r7, #7]
c0de4aaa:	1c63      	adds	r3, r4, #1
c0de4aac:	f802 3c02 	strb.w	r3, [r2, #-2]
c0de4ab0:	301a      	adds	r0, #26
c0de4ab2:	e003      	b.n	c0de4abc <addText+0x238>
c0de4ab4:	f001 bfca 	b.w	c0de6a4c <OUTLINED_FUNCTION_35>
c0de4ab8:	f108 001c 	add.w	r0, r8, #28
c0de4abc:	f8db 10a0 	ldr.w	r1, [fp, #160]	@ 0xa0
c0de4ac0:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de4ac4:	784c      	ldrb	r4, [r1, #1]
c0de4ac6:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de4aca:	788e      	ldrb	r6, [r1, #2]
c0de4acc:	78c9      	ldrb	r1, [r1, #3]
c0de4ace:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de4ad2:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de4ad6:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de4ada:	2220      	movs	r2, #32
c0de4adc:	f841 5023 	str.w	r5, [r1, r3, lsl #2]
c0de4ae0:	2100      	movs	r1, #0
c0de4ae2:	71a8      	strb	r0, [r5, #6]
c0de4ae4:	75ea      	strb	r2, [r5, #23]
c0de4ae6:	7629      	strb	r1, [r5, #24]
c0de4ae8:	77e9      	strb	r1, [r5, #31]
c0de4aea:	75a9      	strb	r1, [r5, #22]
c0de4aec:	0a01      	lsrs	r1, r0, #8
c0de4aee:	b280      	uxth	r0, r0
c0de4af0:	71e9      	strb	r1, [r5, #7]
c0de4af2:	f8db 10a0 	ldr.w	r1, [fp, #160]	@ 0xa0
c0de4af6:	f002 b84c 	b.w	c0de6b92 <OUTLINED_FUNCTION_54>
c0de4afa:	bf00      	nop
c0de4afc:	000077dc 	.word	0x000077dc
c0de4b00:	0000749f 	.word	0x0000749f

c0de4b04 <nbgl_layoutAddTextWithAlias>:
c0de4b04:	b51c      	push	{r2, r3, r4, lr}
c0de4b06:	2401      	movs	r4, #1
c0de4b08:	9401      	str	r4, [sp, #4]
c0de4b0a:	9c04      	ldr	r4, [sp, #16]
c0de4b0c:	9400      	str	r4, [sp, #0]
c0de4b0e:	f7ff feb9 	bl	c0de4884 <addText>
c0de4b12:	bd1c      	pop	{r2, r3, r4, pc}

c0de4b14 <nbgl_layoutAddTextContent>:
c0de4b14:	2800      	cmp	r0, #0
c0de4b16:	f000 80b5 	beq.w	c0de4c84 <nbgl_layoutAddTextContent+0x170>
c0de4b1a:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de4b1e:	4682      	mov	sl, r0
c0de4b20:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de4b24:	4e58      	ldr	r6, [pc, #352]	@ (c0de4c88 <nbgl_layoutAddTextContent+0x174>)
c0de4b26:	460d      	mov	r5, r1
c0de4b28:	e9cd 2302 	strd	r2, r3, [sp, #8]
c0de4b2c:	08c1      	lsrs	r1, r0, #3
c0de4b2e:	447e      	add	r6, pc
c0de4b30:	2004      	movs	r0, #4
c0de4b32:	47b0      	blx	r6
c0de4b34:	f04f 0b00 	mov.w	fp, #0
c0de4b38:	4607      	mov	r7, r0
c0de4b3a:	f880 b01f 	strb.w	fp, [r0, #31]
c0de4b3e:	4628      	mov	r0, r5
c0de4b40:	4c52      	ldr	r4, [pc, #328]	@ (c0de4c8c <nbgl_layoutAddTextContent+0x178>)
c0de4b42:	447c      	add	r4, pc
c0de4b44:	47a0      	blx	r4
c0de4b46:	4601      	mov	r1, r0
c0de4b48:	2010      	movs	r0, #16
c0de4b4a:	2201      	movs	r2, #1
c0de4b4c:	9401      	str	r4, [sp, #4]
c0de4b4e:	f887 b01a 	strb.w	fp, [r7, #26]
c0de4b52:	f887 b018 	strb.w	fp, [r7, #24]
c0de4b56:	f887 b021 	strb.w	fp, [r7, #33]	@ 0x21
c0de4b5a:	f887 b016 	strb.w	fp, [r7, #22]
c0de4b5e:	2301      	movs	r3, #1
c0de4b60:	46a0      	mov	r8, r4
c0de4b62:	7678      	strb	r0, [r7, #25]
c0de4b64:	2020      	movs	r0, #32
c0de4b66:	717a      	strb	r2, [r7, #5]
c0de4b68:	f887 2024 	strb.w	r2, [r7, #36]	@ 0x24
c0de4b6c:	0e0a      	lsrs	r2, r1, #24
c0de4b6e:	75f8      	strb	r0, [r7, #23]
c0de4b70:	20a0      	movs	r0, #160	@ 0xa0
c0de4b72:	7138      	strb	r0, [r7, #4]
c0de4b74:	200d      	movs	r0, #13
c0de4b76:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de4b7a:	2004      	movs	r0, #4
c0de4b7c:	f887 0020 	strb.w	r0, [r7, #32]
c0de4b80:	4638      	mov	r0, r7
c0de4b82:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de4b86:	70c2      	strb	r2, [r0, #3]
c0de4b88:	0c0a      	lsrs	r2, r1, #16
c0de4b8a:	7082      	strb	r2, [r0, #2]
c0de4b8c:	0a08      	lsrs	r0, r1, #8
c0de4b8e:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de4b92:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de4b96:	200d      	movs	r0, #13
c0de4b98:	4d3d      	ldr	r5, [pc, #244]	@ (c0de4c90 <nbgl_layoutAddTextContent+0x17c>)
c0de4b9a:	447d      	add	r5, pc
c0de4b9c:	47a8      	blx	r5
c0de4b9e:	f8da 10a0 	ldr.w	r1, [sl, #160]	@ 0xa0
c0de4ba2:	f001 fecc 	bl	c0de693e <OUTLINED_FUNCTION_24>
c0de4ba6:	71b8      	strb	r0, [r7, #6]
c0de4ba8:	0a00      	lsrs	r0, r0, #8
c0de4baa:	71f8      	strb	r0, [r7, #7]
c0de4bac:	f001 ff42 	bl	c0de6a34 <OUTLINED_FUNCTION_34>
c0de4bb0:	4607      	mov	r7, r0
c0de4bb2:	f880 b01f 	strb.w	fp, [r0, #31]
c0de4bb6:	9802      	ldr	r0, [sp, #8]
c0de4bb8:	47c0      	blx	r8
c0de4bba:	4601      	mov	r1, r0
c0de4bbc:	2001      	movs	r0, #1
c0de4bbe:	22a0      	movs	r2, #160	@ 0xa0
c0de4bc0:	2301      	movs	r3, #1
c0de4bc2:	f04f 0801 	mov.w	r8, #1
c0de4bc6:	f887 b021 	strb.w	fp, [r7, #33]	@ 0x21
c0de4bca:	713a      	strb	r2, [r7, #4]
c0de4bcc:	220b      	movs	r2, #11
c0de4bce:	7178      	strb	r0, [r7, #5]
c0de4bd0:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de4bd4:	4638      	mov	r0, r7
c0de4bd6:	f887 2022 	strb.w	r2, [r7, #34]	@ 0x22
c0de4bda:	f001 ffc6 	bl	c0de6b6a <OUTLINED_FUNCTION_52>
c0de4bde:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de4be2:	200b      	movs	r0, #11
c0de4be4:	47a8      	blx	r5
c0de4be6:	f8da 10a0 	ldr.w	r1, [sl, #160]	@ 0xa0
c0de4bea:	f887 b01a 	strb.w	fp, [r7, #26]
c0de4bee:	f887 b018 	strb.w	fp, [r7, #24]
c0de4bf2:	f887 b016 	strb.w	fp, [r7, #22]
c0de4bf6:	f001 fea2 	bl	c0de693e <OUTLINED_FUNCTION_24>
c0de4bfa:	2104      	movs	r1, #4
c0de4bfc:	71b8      	strb	r0, [r7, #6]
c0de4bfe:	0a00      	lsrs	r0, r0, #8
c0de4c00:	f887 1020 	strb.w	r1, [r7, #32]
c0de4c04:	2118      	movs	r1, #24
c0de4c06:	71f8      	strb	r0, [r7, #7]
c0de4c08:	7679      	strb	r1, [r7, #25]
c0de4c0a:	2120      	movs	r1, #32
c0de4c0c:	75f9      	strb	r1, [r7, #23]
c0de4c0e:	f001 ff11 	bl	c0de6a34 <OUTLINED_FUNCTION_34>
c0de4c12:	4606      	mov	r6, r0
c0de4c14:	f880 801f 	strb.w	r8, [r0, #31]
c0de4c18:	9803      	ldr	r0, [sp, #12]
c0de4c1a:	9901      	ldr	r1, [sp, #4]
c0de4c1c:	4788      	blx	r1
c0de4c1e:	4601      	mov	r1, r0
c0de4c20:	20a0      	movs	r0, #160	@ 0xa0
c0de4c22:	2301      	movs	r3, #1
c0de4c24:	f886 8005 	strb.w	r8, [r6, #5]
c0de4c28:	f886 8024 	strb.w	r8, [r6, #36]	@ 0x24
c0de4c2c:	f886 b021 	strb.w	fp, [r6, #33]	@ 0x21
c0de4c30:	7130      	strb	r0, [r6, #4]
c0de4c32:	200b      	movs	r0, #11
c0de4c34:	0e0a      	lsrs	r2, r1, #24
c0de4c36:	f001 fec9 	bl	c0de69cc <OUTLINED_FUNCTION_30>
c0de4c3a:	47a8      	blx	r5
c0de4c3c:	f8da 10a0 	ldr.w	r1, [sl, #160]	@ 0xa0
c0de4c40:	f886 b01a 	strb.w	fp, [r6, #26]
c0de4c44:	f886 b018 	strb.w	fp, [r6, #24]
c0de4c48:	f001 fdb0 	bl	c0de67ac <OUTLINED_FUNCTION_8>
c0de4c4c:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
c0de4c50:	2128      	movs	r1, #40	@ 0x28
c0de4c52:	71b0      	strb	r0, [r6, #6]
c0de4c54:	0a00      	lsrs	r0, r0, #8
c0de4c56:	7671      	strb	r1, [r6, #25]
c0de4c58:	2120      	movs	r1, #32
c0de4c5a:	71f0      	strb	r0, [r6, #7]
c0de4c5c:	75f1      	strb	r1, [r6, #23]
c0de4c5e:	2104      	movs	r1, #4
c0de4c60:	f8da 00a0 	ldr.w	r0, [sl, #160]	@ 0xa0
c0de4c64:	f886 1020 	strb.w	r1, [r6, #32]
c0de4c68:	2107      	movs	r1, #7
c0de4c6a:	75b1      	strb	r1, [r6, #22]
c0de4c6c:	f890 3020 	ldrb.w	r3, [r0, #32]
c0de4c70:	7981      	ldrb	r1, [r0, #6]
c0de4c72:	79c2      	ldrb	r2, [r0, #7]
c0de4c74:	3301      	adds	r3, #1
c0de4c76:	f880 3020 	strb.w	r3, [r0, #32]
c0de4c7a:	ea41 2002 	orr.w	r0, r1, r2, lsl #8
c0de4c7e:	b004      	add	sp, #16
c0de4c80:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de4c84:	f001 bee2 	b.w	c0de6a4c <OUTLINED_FUNCTION_35>
c0de4c88:	00005e05 	.word	0x00005e05
c0de4c8c:	000061b3 	.word	0x000061b3
c0de4c90:	00005dcb 	.word	0x00005dcb

c0de4c94 <nbgl_layoutAddRadioChoice>:
c0de4c94:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de4c98:	2800      	cmp	r0, #0
c0de4c9a:	f000 8102 	beq.w	c0de4ea2 <nbgl_layoutAddRadioChoice+0x20e>
c0de4c9e:	4605      	mov	r5, r0
c0de4ca0:	4884      	ldr	r0, [pc, #528]	@ (c0de4eb4 <nbgl_layoutAddRadioChoice+0x220>)
c0de4ca2:	468a      	mov	sl, r1
c0de4ca4:	f04f 0800 	mov.w	r8, #0
c0de4ca8:	e9cd 1501 	strd	r1, r5, [sp, #4]
c0de4cac:	4478      	add	r0, pc
c0de4cae:	9003      	str	r0, [sp, #12]
c0de4cb0:	f89a 0005 	ldrb.w	r0, [sl, #5]
c0de4cb4:	4580      	cmp	r8, r0
c0de4cb6:	f080 80f7 	bcs.w	c0de4ea8 <nbgl_layoutAddRadioChoice+0x214>
c0de4cba:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de4cbe:	9c03      	ldr	r4, [sp, #12]
c0de4cc0:	08c1      	lsrs	r1, r0, #3
c0de4cc2:	2001      	movs	r0, #1
c0de4cc4:	47a0      	blx	r4
c0de4cc6:	4606      	mov	r6, r0
c0de4cc8:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de4ccc:	08c1      	lsrs	r1, r0, #3
c0de4cce:	2004      	movs	r0, #4
c0de4cd0:	47a0      	blx	r4
c0de4cd2:	4607      	mov	r7, r0
c0de4cd4:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de4cd8:	08c1      	lsrs	r1, r0, #3
c0de4cda:	2009      	movs	r0, #9
c0de4cdc:	47a0      	blx	r4
c0de4cde:	f89a 2007 	ldrb.w	r2, [sl, #7]
c0de4ce2:	f89a 3008 	ldrb.w	r3, [sl, #8]
c0de4ce6:	4604      	mov	r4, r0
c0de4ce8:	4628      	mov	r0, r5
c0de4cea:	f001 fe0c 	bl	c0de6906 <OUTLINED_FUNCTION_20>
c0de4cee:	2800      	cmp	r0, #0
c0de4cf0:	f000 80d7 	beq.w	c0de4ea2 <nbgl_layoutAddRadioChoice+0x20e>
c0de4cf4:	2002      	movs	r0, #2
c0de4cf6:	f886 0020 	strb.w	r0, [r6, #32]
c0de4cfa:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de4cfe:	08c1      	lsrs	r1, r0, #3
c0de4d00:	2002      	movs	r0, #2
c0de4d02:	f005 fe1d 	bl	c0dea940 <nbgl_containerPoolGet>
c0de4d06:	2300      	movs	r3, #0
c0de4d08:	ea4f 2c16 	mov.w	ip, r6, lsr #8
c0de4d0c:	4631      	mov	r1, r6
c0de4d0e:	0e02      	lsrs	r2, r0, #24
c0de4d10:	4655      	mov	r5, sl
c0de4d12:	ea4f 6a16 	mov.w	sl, r6, lsr #24
c0de4d16:	ea4f 4b16 	mov.w	fp, r6, lsr #16
c0de4d1a:	74f3      	strb	r3, [r6, #19]
c0de4d1c:	f884 c013 	strb.w	ip, [r4, #19]
c0de4d20:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de4d24:	70ca      	strb	r2, [r1, #3]
c0de4d26:	0c02      	lsrs	r2, r0, #16
c0de4d28:	708a      	strb	r2, [r1, #2]
c0de4d2a:	0a01      	lsrs	r1, r0, #8
c0de4d2c:	f886 1023 	strb.w	r1, [r6, #35]	@ 0x23
c0de4d30:	4631      	mov	r1, r6
c0de4d32:	f801 3f12 	strb.w	r3, [r1, #18]!
c0de4d36:	70cb      	strb	r3, [r1, #3]
c0de4d38:	708b      	strb	r3, [r1, #2]
c0de4d3a:	4621      	mov	r1, r4
c0de4d3c:	f801 6f12 	strb.w	r6, [r1, #18]!
c0de4d40:	f881 b002 	strb.w	fp, [r1, #2]
c0de4d44:	f881 a003 	strb.w	sl, [r1, #3]
c0de4d48:	2120      	movs	r1, #32
c0de4d4a:	7633      	strb	r3, [r6, #24]
c0de4d4c:	71f3      	strb	r3, [r6, #7]
c0de4d4e:	75b3      	strb	r3, [r6, #22]
c0de4d50:	75f1      	strb	r1, [r6, #23]
c0de4d52:	215c      	movs	r1, #92	@ 0x5c
c0de4d54:	71b1      	strb	r1, [r6, #6]
c0de4d56:	2101      	movs	r1, #1
c0de4d58:	7171      	strb	r1, [r6, #5]
c0de4d5a:	21a0      	movs	r1, #160	@ 0xa0
c0de4d5c:	7131      	strb	r1, [r6, #4]
c0de4d5e:	2102      	movs	r1, #2
c0de4d60:	6044      	str	r4, [r0, #4]
c0de4d62:	77e3      	strb	r3, [r4, #31]
c0de4d64:	f884 3021 	strb.w	r3, [r4, #33]	@ 0x21
c0de4d68:	7928      	ldrb	r0, [r5, #4]
c0de4d6a:	f884 1020 	strb.w	r1, [r4, #32]
c0de4d6e:	2106      	movs	r1, #6
c0de4d70:	75a1      	strb	r1, [r4, #22]
c0de4d72:	b110      	cbz	r0, c0de4d7a <nbgl_layoutAddRadioChoice+0xe6>
c0de4d74:	f44f 70d0 	mov.w	r0, #416	@ 0x1a0
c0de4d78:	e014      	b.n	c0de4da4 <nbgl_layoutAddRadioChoice+0x110>
c0de4d7a:	6828      	ldr	r0, [r5, #0]
c0de4d7c:	4665      	mov	r5, ip
c0de4d7e:	f850 0028 	ldr.w	r0, [r0, r8, lsl #2]
c0de4d82:	f005 ffb9 	bl	c0deacf8 <pic>
c0de4d86:	4639      	mov	r1, r7
c0de4d88:	0e02      	lsrs	r2, r0, #24
c0de4d8a:	46ac      	mov	ip, r5
c0de4d8c:	9d01      	ldr	r5, [sp, #4]
c0de4d8e:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de4d92:	70ca      	strb	r2, [r1, #3]
c0de4d94:	0c02      	lsrs	r2, r0, #16
c0de4d96:	0a00      	lsrs	r0, r0, #8
c0de4d98:	708a      	strb	r2, [r1, #2]
c0de4d9a:	7048      	strb	r0, [r1, #1]
c0de4d9c:	7930      	ldrb	r0, [r6, #4]
c0de4d9e:	7971      	ldrb	r1, [r6, #5]
c0de4da0:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de4da4:	4639      	mov	r1, r7
c0de4da6:	f887 c013 	strb.w	ip, [r7, #19]
c0de4daa:	4632      	mov	r2, r6
c0de4dac:	3828      	subs	r0, #40	@ 0x28
c0de4dae:	f801 6f12 	strb.w	r6, [r1, #18]!
c0de4db2:	f881 b002 	strb.w	fp, [r1, #2]
c0de4db6:	f881 a003 	strb.w	sl, [r1, #3]
c0de4dba:	f04f 0b00 	mov.w	fp, #0
c0de4dbe:	46aa      	mov	sl, r5
c0de4dc0:	f896 1023 	ldrb.w	r1, [r6, #35]	@ 0x23
c0de4dc4:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de4dc8:	f886 b01d 	strb.w	fp, [r6, #29]
c0de4dcc:	f001 ff61 	bl	c0de6c92 <OUTLINED_FUNCTION_75>
c0de4dd0:	4b37      	ldr	r3, [pc, #220]	@ (c0de4eb0 <nbgl_layoutAddRadioChoice+0x21c>)
c0de4dd2:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de4dd6:	600f      	str	r7, [r1, #0]
c0de4dd8:	f819 1003 	ldrb.w	r1, [r9, r3]
c0de4ddc:	1c4a      	adds	r2, r1, #1
c0de4dde:	3114      	adds	r1, #20
c0de4de0:	f809 2003 	strb.w	r2, [r9, r3]
c0de4de4:	2201      	movs	r2, #1
c0de4de6:	77b1      	strb	r1, [r6, #30]
c0de4de8:	2104      	movs	r1, #4
c0de4dea:	7732      	strb	r2, [r6, #28]
c0de4dec:	f887 b021 	strb.w	fp, [r7, #33]	@ 0x21
c0de4df0:	f887 1020 	strb.w	r1, [r7, #32]
c0de4df4:	75b9      	strb	r1, [r7, #22]
c0de4df6:	79aa      	ldrb	r2, [r5, #6]
c0de4df8:	eba8 0302 	sub.w	r3, r8, r2
c0de4dfc:	fab3 f383 	clz	r3, r3
c0de4e00:	095b      	lsrs	r3, r3, #5
c0de4e02:	f884 3021 	strb.w	r3, [r4, #33]	@ 0x21
c0de4e06:	7138      	strb	r0, [r7, #4]
c0de4e08:	0a00      	lsrs	r0, r0, #8
c0de4e0a:	7178      	strb	r0, [r7, #5]
c0de4e0c:	ebb8 0002 	subs.w	r0, r8, r2
c0de4e10:	bf18      	it	ne
c0de4e12:	2001      	movne	r0, #1
c0de4e14:	77f8      	strb	r0, [r7, #31]
c0de4e16:	4590      	cmp	r8, r2
c0de4e18:	f04f 000b 	mov.w	r0, #11
c0de4e1c:	bf08      	it	eq
c0de4e1e:	200c      	moveq	r0, #12
c0de4e20:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de4e24:	f005 fd96 	bl	c0dea954 <nbgl_getFontHeight>
c0de4e28:	9d02      	ldr	r5, [sp, #8]
c0de4e2a:	f887 b007 	strb.w	fp, [r7, #7]
c0de4e2e:	71b8      	strb	r0, [r7, #6]
c0de4e30:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de4e34:	08c0      	lsrs	r0, r0, #3
c0de4e36:	f000 f83f 	bl	c0de4eb8 <createHorizontalLine>
c0de4e3a:	f8d5 10a0 	ldr.w	r1, [r5, #160]	@ 0xa0
c0de4e3e:	f108 0801 	add.w	r8, r8, #1
c0de4e42:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de4e46:	784c      	ldrb	r4, [r1, #1]
c0de4e48:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de4e4c:	788f      	ldrb	r7, [r1, #2]
c0de4e4e:	78c9      	ldrb	r1, [r1, #3]
c0de4e50:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de4e54:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de4e58:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de4e5c:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
c0de4e60:	f8d5 10a0 	ldr.w	r1, [r5, #160]	@ 0xa0
c0de4e64:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de4e68:	784b      	ldrb	r3, [r1, #1]
c0de4e6a:	788c      	ldrb	r4, [r1, #2]
c0de4e6c:	78ce      	ldrb	r6, [r1, #3]
c0de4e6e:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de4e72:	ea44 2306 	orr.w	r3, r4, r6, lsl #8
c0de4e76:	ea42 4203 	orr.w	r2, r2, r3, lsl #16
c0de4e7a:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de4e7e:	3301      	adds	r3, #1
c0de4e80:	f801 3c02 	strb.w	r3, [r1, #-2]
c0de4e84:	21ff      	movs	r1, #255	@ 0xff
c0de4e86:	b2dc      	uxtb	r4, r3
c0de4e88:	7681      	strb	r1, [r0, #26]
c0de4e8a:	21fc      	movs	r1, #252	@ 0xfc
c0de4e8c:	f842 0024 	str.w	r0, [r2, r4, lsl #2]
c0de4e90:	7641      	strb	r1, [r0, #25]
c0de4e92:	2103      	movs	r1, #3
c0de4e94:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de4e98:	f8d5 00a0 	ldr.w	r0, [r5, #160]	@ 0xa0
c0de4e9c:	f001 fc1e 	bl	c0de66dc <OUTLINED_FUNCTION_1>
c0de4ea0:	e706      	b.n	c0de4cb0 <nbgl_layoutAddRadioChoice+0x1c>
c0de4ea2:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de4ea6:	e000      	b.n	c0de4eaa <nbgl_layoutAddRadioChoice+0x216>
c0de4ea8:	2000      	movs	r0, #0
c0de4eaa:	b004      	add	sp, #16
c0de4eac:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de4eb0:	00001948 	.word	0x00001948
c0de4eb4:	00005c87 	.word	0x00005c87

c0de4eb8 <createHorizontalLine>:
c0de4eb8:	b580      	push	{r7, lr}
c0de4eba:	4601      	mov	r1, r0
c0de4ebc:	2003      	movs	r0, #3
c0de4ebe:	f005 fd3a 	bl	c0dea936 <nbgl_objPoolGet>
c0de4ec2:	2100      	movs	r1, #0
c0de4ec4:	22e0      	movs	r2, #224	@ 0xe0
c0de4ec6:	71c1      	strb	r1, [r0, #7]
c0de4ec8:	2104      	movs	r1, #4
c0de4eca:	7102      	strb	r2, [r0, #4]
c0de4ecc:	2202      	movs	r2, #2
c0de4ece:	7181      	strb	r1, [r0, #6]
c0de4ed0:	2101      	movs	r1, #1
c0de4ed2:	f880 2020 	strb.w	r2, [r0, #32]
c0de4ed6:	7141      	strb	r1, [r0, #5]
c0de4ed8:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de4edc:	77c1      	strb	r1, [r0, #31]
c0de4ede:	bd80      	pop	{r7, pc}

c0de4ee0 <nbgl_layoutAddCenteredInfo>:
c0de4ee0:	b570      	push	{r4, r5, r6, lr}
c0de4ee2:	b08a      	sub	sp, #40	@ 0x28
c0de4ee4:	ae01      	add	r6, sp, #4
c0de4ee6:	460c      	mov	r4, r1
c0de4ee8:	4605      	mov	r5, r0
c0de4eea:	2124      	movs	r1, #36	@ 0x24
c0de4eec:	4630      	mov	r0, r6
c0de4eee:	f006 f925 	bl	c0deb13c <__aeabi_memclr>
c0de4ef2:	b33d      	cbz	r5, c0de4f44 <nbgl_layoutAddCenteredInfo+0x64>
c0de4ef4:	6820      	ldr	r0, [r4, #0]
c0de4ef6:	68e1      	ldr	r1, [r4, #12]
c0de4ef8:	9102      	str	r1, [sp, #8]
c0de4efa:	b128      	cbz	r0, c0de4f08 <nbgl_layoutAddCenteredInfo+0x28>
c0de4efc:	7c61      	ldrb	r1, [r4, #17]
c0de4efe:	2210      	movs	r2, #16
c0de4f00:	2903      	cmp	r1, #3
c0de4f02:	bf08      	it	eq
c0de4f04:	2214      	moveq	r2, #20
c0de4f06:	50b0      	str	r0, [r6, r2]
c0de4f08:	6860      	ldr	r0, [r4, #4]
c0de4f0a:	b128      	cbz	r0, c0de4f18 <nbgl_layoutAddCenteredInfo+0x38>
c0de4f0c:	7c61      	ldrb	r1, [r4, #17]
c0de4f0e:	2218      	movs	r2, #24
c0de4f10:	2901      	cmp	r1, #1
c0de4f12:	bf08      	it	eq
c0de4f14:	2214      	moveq	r2, #20
c0de4f16:	50b0      	str	r0, [r6, r2]
c0de4f18:	68a0      	ldr	r0, [r4, #8]
c0de4f1a:	b128      	cbz	r0, c0de4f28 <nbgl_layoutAddCenteredInfo+0x48>
c0de4f1c:	7c61      	ldrb	r1, [r4, #17]
c0de4f1e:	2218      	movs	r2, #24
c0de4f20:	2902      	cmp	r1, #2
c0de4f22:	bf08      	it	eq
c0de4f24:	221c      	moveq	r2, #28
c0de4f26:	50b0      	str	r0, [r6, r2]
c0de4f28:	a901      	add	r1, sp, #4
c0de4f2a:	4628      	mov	r0, r5
c0de4f2c:	f000 f816 	bl	c0de4f5c <addContentCenter>
c0de4f30:	7c21      	ldrb	r1, [r4, #16]
c0de4f32:	b151      	cbz	r1, c0de4f4a <nbgl_layoutAddCenteredInfo+0x6a>
c0de4f34:	2100      	movs	r1, #0
c0de4f36:	2220      	movs	r2, #32
c0de4f38:	7601      	strb	r1, [r0, #24]
c0de4f3a:	75c2      	strb	r2, [r0, #23]
c0de4f3c:	7581      	strb	r1, [r0, #22]
c0de4f3e:	8a61      	ldrh	r1, [r4, #18]
c0de4f40:	3120      	adds	r1, #32
c0de4f42:	e003      	b.n	c0de4f4c <nbgl_layoutAddCenteredInfo+0x6c>
c0de4f44:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de4f48:	e005      	b.n	c0de4f56 <nbgl_layoutAddCenteredInfo+0x76>
c0de4f4a:	8a61      	ldrh	r1, [r4, #18]
c0de4f4c:	7641      	strb	r1, [r0, #25]
c0de4f4e:	0a09      	lsrs	r1, r1, #8
c0de4f50:	7681      	strb	r1, [r0, #26]
c0de4f52:	f001 fe26 	bl	c0de6ba2 <OUTLINED_FUNCTION_55>
c0de4f56:	b00a      	add	sp, #40	@ 0x28
c0de4f58:	bd70      	pop	{r4, r5, r6, pc}
	...

c0de4f5c <addContentCenter>:
c0de4f5c:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de4f60:	4606      	mov	r6, r0
c0de4f62:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de4f66:	468b      	mov	fp, r1
c0de4f68:	f001 fc9d 	bl	c0de68a6 <OUTLINED_FUNCTION_16>
c0de4f6c:	2400      	movs	r4, #0
c0de4f6e:	4680      	mov	r8, r0
c0de4f70:	f880 4020 	strb.w	r4, [r0, #32]
c0de4f74:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de4f78:	08c1      	lsrs	r1, r0, #3
c0de4f7a:	2006      	movs	r0, #6
c0de4f7c:	f005 fce0 	bl	c0dea940 <nbgl_containerPoolGet>
c0de4f80:	4641      	mov	r1, r8
c0de4f82:	0e02      	lsrs	r2, r0, #24
c0de4f84:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de4f88:	f001 fdd2 	bl	c0de6b30 <OUTLINED_FUNCTION_47>
c0de4f8c:	f888 0023 	strb.w	r0, [r8, #35]	@ 0x23
c0de4f90:	f8db 0004 	ldr.w	r0, [fp, #4]
c0de4f94:	2800      	cmp	r0, #0
c0de4f96:	d079      	beq.n	c0de508c <addContentCenter+0x130>
c0de4f98:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de4f9c:	f001 fcb6 	bl	c0de690c <OUTLINED_FUNCTION_21>
c0de4fa0:	4607      	mov	r7, r0
c0de4fa2:	77c4      	strb	r4, [r0, #31]
c0de4fa4:	f8db 0004 	ldr.w	r0, [fp, #4]
c0de4fa8:	f005 fea6 	bl	c0deacf8 <pic>
c0de4fac:	4639      	mov	r1, r7
c0de4fae:	0e02      	lsrs	r2, r0, #24
c0de4fb0:	46b2      	mov	sl, r6
c0de4fb2:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de4fb6:	70ca      	strb	r2, [r1, #3]
c0de4fb8:	0c02      	lsrs	r2, r0, #16
c0de4fba:	708a      	strb	r2, [r1, #2]
c0de4fbc:	0a01      	lsrs	r1, r0, #8
c0de4fbe:	f887 1022 	strb.w	r1, [r7, #34]	@ 0x22
c0de4fc2:	4641      	mov	r1, r8
c0de4fc4:	f001 fd28 	bl	c0de6a18 <OUTLINED_FUNCTION_33>
c0de4fc8:	f842 7023 	str.w	r7, [r2, r3, lsl #2]
c0de4fcc:	2202      	movs	r2, #2
c0de4fce:	3301      	adds	r3, #1
c0de4fd0:	75ba      	strb	r2, [r7, #22]
c0de4fd2:	f8bb 2020 	ldrh.w	r2, [fp, #32]
c0de4fd6:	767a      	strb	r2, [r7, #25]
c0de4fd8:	f801 3c02 	strb.w	r3, [r1, #-2]
c0de4fdc:	0a14      	lsrs	r4, r2, #8
c0de4fde:	7881      	ldrb	r1, [r0, #2]
c0de4fe0:	78c0      	ldrb	r0, [r0, #3]
c0de4fe2:	76bc      	strb	r4, [r7, #26]
c0de4fe4:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de4fe8:	4410      	add	r0, r2
c0de4fea:	9000      	str	r0, [sp, #0]
c0de4fec:	f89b 0000 	ldrb.w	r0, [fp]
c0de4ff0:	2801      	cmp	r0, #1
c0de4ff2:	d146      	bne.n	c0de5082 <addContentCenter+0x126>
c0de4ff4:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de4ff8:	f001 fc88 	bl	c0de690c <OUTLINED_FUNCTION_21>
c0de4ffc:	4604      	mov	r4, r0
c0de4ffe:	2000      	movs	r0, #0
c0de5000:	77e0      	strb	r0, [r4, #31]
c0de5002:	f8db 0008 	ldr.w	r0, [fp, #8]
c0de5006:	6800      	ldr	r0, [r0, #0]
c0de5008:	6800      	ldr	r0, [r0, #0]
c0de500a:	f005 fe75 	bl	c0deacf8 <pic>
c0de500e:	4621      	mov	r1, r4
c0de5010:	0e02      	lsrs	r2, r0, #24
c0de5012:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de5016:	70ca      	strb	r2, [r1, #3]
c0de5018:	0c02      	lsrs	r2, r0, #16
c0de501a:	0a00      	lsrs	r0, r0, #8
c0de501c:	f884 0022 	strb.w	r0, [r4, #34]	@ 0x22
c0de5020:	708a      	strb	r2, [r1, #2]
c0de5022:	4640      	mov	r0, r8
c0de5024:	f001 fd31 	bl	c0de6a8a <OUTLINED_FUNCTION_38>
c0de5028:	f841 4022 	str.w	r4, [r1, r2, lsl #2]
c0de502c:	2102      	movs	r1, #2
c0de502e:	75a1      	strb	r1, [r4, #22]
c0de5030:	f8bb 100c 	ldrh.w	r1, [fp, #12]
c0de5034:	75e1      	strb	r1, [r4, #23]
c0de5036:	0a09      	lsrs	r1, r1, #8
c0de5038:	f8bb 3020 	ldrh.w	r3, [fp, #32]
c0de503c:	f8bb 500e 	ldrh.w	r5, [fp, #14]
c0de5040:	7621      	strb	r1, [r4, #24]
c0de5042:	1c51      	adds	r1, r2, #1
c0de5044:	442b      	add	r3, r5
c0de5046:	7663      	strb	r3, [r4, #25]
c0de5048:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de504c:	0a18      	lsrs	r0, r3, #8
c0de504e:	76a0      	strb	r0, [r4, #26]
c0de5050:	2000      	movs	r0, #0
c0de5052:	f88a 00af 	strb.w	r0, [sl, #175]	@ 0xaf
c0de5056:	f8db 0008 	ldr.w	r0, [fp, #8]
c0de505a:	f8ca 00a4 	str.w	r0, [sl, #164]	@ 0xa4
c0de505e:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de5062:	f040 0104 	orr.w	r1, r0, #4
c0de5066:	08c0      	lsrs	r0, r0, #3
c0de5068:	f88a 10ad 	strb.w	r1, [sl, #173]	@ 0xad
c0de506c:	49b2      	ldr	r1, [pc, #712]	@ (c0de5338 <addContentCenter+0x3dc>)
c0de506e:	4479      	add	r1, pc
c0de5070:	9101      	str	r1, [sp, #4]
c0de5072:	f8db 1008 	ldr.w	r1, [fp, #8]
c0de5076:	88c9      	ldrh	r1, [r1, #6]
c0de5078:	e9cd 1102 	strd	r1, r1, [sp, #8]
c0de507c:	a901      	add	r1, sp, #4
c0de507e:	f005 fc50 	bl	c0dea922 <nbgl_screenUpdateTicker>
c0de5082:	4656      	mov	r6, sl
c0de5084:	f8dd a000 	ldr.w	sl, [sp]
c0de5088:	463c      	mov	r4, r7
c0de508a:	e001      	b.n	c0de5090 <addContentCenter+0x134>
c0de508c:	f04f 0a00 	mov.w	sl, #0
c0de5090:	f8db 0010 	ldr.w	r0, [fp, #16]
c0de5094:	9600      	str	r6, [sp, #0]
c0de5096:	2800      	cmp	r0, #0
c0de5098:	d046      	beq.n	c0de5128 <addContentCenter+0x1cc>
c0de509a:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de509e:	f001 fb19 	bl	c0de66d4 <OUTLINED_FUNCTION_0>
c0de50a2:	4607      	mov	r7, r0
c0de50a4:	2000      	movs	r0, #0
c0de50a6:	77f8      	strb	r0, [r7, #31]
c0de50a8:	f8db 0010 	ldr.w	r0, [fp, #16]
c0de50ac:	f005 fe24 	bl	c0deacf8 <pic>
c0de50b0:	f001 fd19 	bl	c0de6ae6 <OUTLINED_FUNCTION_42>
c0de50b4:	200d      	movs	r0, #13
c0de50b6:	f001 fb2b 	bl	c0de6710 <OUTLINED_FUNCTION_3>
c0de50ba:	f001 fdf8 	bl	c0de6cae <OUTLINED_FUNCTION_78>
c0de50be:	71b8      	strb	r0, [r7, #6]
c0de50c0:	0a01      	lsrs	r1, r0, #8
c0de50c2:	f898 c020 	ldrb.w	ip, [r8, #32]
c0de50c6:	71f9      	strb	r1, [r7, #7]
c0de50c8:	f1bc 0f00 	cmp.w	ip, #0
c0de50cc:	d010      	beq.n	c0de50f0 <addContentCenter+0x194>
c0de50ce:	463b      	mov	r3, r7
c0de50d0:	0e22      	lsrs	r2, r4, #24
c0de50d2:	f803 4f12 	strb.w	r4, [r3, #18]!
c0de50d6:	70da      	strb	r2, [r3, #3]
c0de50d8:	0c22      	lsrs	r2, r4, #16
c0de50da:	709a      	strb	r2, [r3, #2]
c0de50dc:	0a22      	lsrs	r2, r4, #8
c0de50de:	705a      	strb	r2, [r3, #1]
c0de50e0:	f8bb 2020 	ldrh.w	r2, [fp, #32]
c0de50e4:	3218      	adds	r2, #24
c0de50e6:	0a14      	lsrs	r4, r2, #8
c0de50e8:	71da      	strb	r2, [r3, #7]
c0de50ea:	721c      	strb	r4, [r3, #8]
c0de50ec:	2308      	movs	r3, #8
c0de50ee:	e004      	b.n	c0de50fa <addContentCenter+0x19e>
c0de50f0:	7e7a      	ldrb	r2, [r7, #25]
c0de50f2:	7ebb      	ldrb	r3, [r7, #26]
c0de50f4:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de50f8:	2302      	movs	r3, #2
c0de50fa:	75bb      	strb	r3, [r7, #22]
c0de50fc:	4643      	mov	r3, r8
c0de50fe:	4450      	add	r0, sl
c0de5100:	f813 4f22 	ldrb.w	r4, [r3, #34]!
c0de5104:	eb00 0a02 	add.w	sl, r0, r2
c0de5108:	785d      	ldrb	r5, [r3, #1]
c0de510a:	789e      	ldrb	r6, [r3, #2]
c0de510c:	78d9      	ldrb	r1, [r3, #3]
c0de510e:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de5112:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de5116:	9e00      	ldr	r6, [sp, #0]
c0de5118:	ea44 4101 	orr.w	r1, r4, r1, lsl #16
c0de511c:	f841 702c 	str.w	r7, [r1, ip, lsl #2]
c0de5120:	f10c 0101 	add.w	r1, ip, #1
c0de5124:	f803 1c02 	strb.w	r1, [r3, #-2]
c0de5128:	f8db 0014 	ldr.w	r0, [fp, #20]
c0de512c:	2800      	cmp	r0, #0
c0de512e:	d049      	beq.n	c0de51c4 <addContentCenter+0x268>
c0de5130:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de5134:	f001 face 	bl	c0de66d4 <OUTLINED_FUNCTION_0>
c0de5138:	4607      	mov	r7, r0
c0de513a:	2000      	movs	r0, #0
c0de513c:	77f8      	strb	r0, [r7, #31]
c0de513e:	f8db 0014 	ldr.w	r0, [fp, #20]
c0de5142:	f005 fdd9 	bl	c0deacf8 <pic>
c0de5146:	f001 fcce 	bl	c0de6ae6 <OUTLINED_FUNCTION_42>
c0de514a:	200c      	movs	r0, #12
c0de514c:	f001 fae0 	bl	c0de6710 <OUTLINED_FUNCTION_3>
c0de5150:	200c      	movs	r0, #12
c0de5152:	f005 fc09 	bl	c0dea968 <nbgl_getTextHeightInWidth>
c0de5156:	f001 fce4 	bl	c0de6b22 <OUTLINED_FUNCTION_46>
c0de515a:	d028      	beq.n	c0de51ae <addContentCenter+0x252>
c0de515c:	4642      	mov	r2, r8
c0de515e:	f04f 0c00 	mov.w	ip, #0
c0de5162:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de5166:	7855      	ldrb	r5, [r2, #1]
c0de5168:	7896      	ldrb	r6, [r2, #2]
c0de516a:	78d2      	ldrb	r2, [r2, #3]
c0de516c:	ea46 2202 	orr.w	r2, r6, r2, lsl #8
c0de5170:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0de5174:	463e      	mov	r6, r7
c0de5176:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de517a:	eb02 0381 	add.w	r3, r2, r1, lsl #2
c0de517e:	f853 5c04 	ldr.w	r5, [r3, #-4]
c0de5182:	f806 5f12 	strb.w	r5, [r6, #18]!
c0de5186:	0e2c      	lsrs	r4, r5, #24
c0de5188:	70f4      	strb	r4, [r6, #3]
c0de518a:	0c2c      	lsrs	r4, r5, #16
c0de518c:	f886 c008 	strb.w	ip, [r6, #8]
c0de5190:	70b4      	strb	r4, [r6, #2]
c0de5192:	0a2c      	lsrs	r4, r5, #8
c0de5194:	7074      	strb	r4, [r6, #1]
c0de5196:	2418      	movs	r4, #24
c0de5198:	71f4      	strb	r4, [r6, #7]
c0de519a:	2408      	movs	r4, #8
c0de519c:	f853 3c04 	ldr.w	r3, [r3, #-4]
c0de51a0:	7134      	strb	r4, [r6, #4]
c0de51a2:	7edb      	ldrb	r3, [r3, #27]
c0de51a4:	2b02      	cmp	r3, #2
c0de51a6:	d105      	bne.n	c0de51b4 <addContentCenter+0x258>
c0de51a8:	f001 fd5b 	bl	c0de6c62 <OUTLINED_FUNCTION_71>
c0de51ac:	e006      	b.n	c0de51bc <addContentCenter+0x260>
c0de51ae:	f001 fa9b 	bl	c0de66e8 <OUTLINED_FUNCTION_2>
c0de51b2:	e005      	b.n	c0de51c0 <addContentCenter+0x264>
c0de51b4:	2300      	movs	r3, #0
c0de51b6:	76bb      	strb	r3, [r7, #26]
c0de51b8:	2310      	movs	r3, #16
c0de51ba:	767b      	strb	r3, [r7, #25]
c0de51bc:	9e00      	ldr	r6, [sp, #0]
c0de51be:	460c      	mov	r4, r1
c0de51c0:	f001 fbfb 	bl	c0de69ba <OUTLINED_FUNCTION_29>
c0de51c4:	f8db 0018 	ldr.w	r0, [fp, #24]
c0de51c8:	b3b8      	cbz	r0, c0de523a <addContentCenter+0x2de>
c0de51ca:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de51ce:	f001 fa81 	bl	c0de66d4 <OUTLINED_FUNCTION_0>
c0de51d2:	4607      	mov	r7, r0
c0de51d4:	2000      	movs	r0, #0
c0de51d6:	77f8      	strb	r0, [r7, #31]
c0de51d8:	f8db 0018 	ldr.w	r0, [fp, #24]
c0de51dc:	f005 fd8c 	bl	c0deacf8 <pic>
c0de51e0:	f001 fc81 	bl	c0de6ae6 <OUTLINED_FUNCTION_42>
c0de51e4:	200b      	movs	r0, #11
c0de51e6:	f001 fa93 	bl	c0de6710 <OUTLINED_FUNCTION_3>
c0de51ea:	f001 fc84 	bl	c0de6af6 <OUTLINED_FUNCTION_43>
c0de51ee:	f001 fc98 	bl	c0de6b22 <OUTLINED_FUNCTION_46>
c0de51f2:	d019      	beq.n	c0de5228 <addContentCenter+0x2cc>
c0de51f4:	f001 fc3b 	bl	c0de6a6e <OUTLINED_FUNCTION_37>
c0de51f8:	eb02 0381 	add.w	r3, r2, r1, lsl #2
c0de51fc:	f853 4c04 	ldr.w	r4, [r3, #-4]
c0de5200:	f805 4f12 	strb.w	r4, [r5, #18]!
c0de5204:	0e26      	lsrs	r6, r4, #24
c0de5206:	70ee      	strb	r6, [r5, #3]
c0de5208:	0c26      	lsrs	r6, r4, #16
c0de520a:	0a24      	lsrs	r4, r4, #8
c0de520c:	706c      	strb	r4, [r5, #1]
c0de520e:	70ae      	strb	r6, [r5, #2]
c0de5210:	2408      	movs	r4, #8
c0de5212:	f853 3c04 	ldr.w	r3, [r3, #-4]
c0de5216:	712c      	strb	r4, [r5, #4]
c0de5218:	7edb      	ldrb	r3, [r3, #27]
c0de521a:	2b04      	cmp	r3, #4
c0de521c:	d107      	bne.n	c0de522e <addContentCenter+0x2d2>
c0de521e:	2300      	movs	r3, #0
c0de5220:	76bb      	strb	r3, [r7, #26]
c0de5222:	2310      	movs	r3, #16
c0de5224:	767b      	strb	r3, [r7, #25]
c0de5226:	e004      	b.n	c0de5232 <addContentCenter+0x2d6>
c0de5228:	f001 fa5e 	bl	c0de66e8 <OUTLINED_FUNCTION_2>
c0de522c:	e003      	b.n	c0de5236 <addContentCenter+0x2da>
c0de522e:	f001 fd18 	bl	c0de6c62 <OUTLINED_FUNCTION_71>
c0de5232:	9e00      	ldr	r6, [sp, #0]
c0de5234:	460c      	mov	r4, r1
c0de5236:	f001 fbc0 	bl	c0de69ba <OUTLINED_FUNCTION_29>
c0de523a:	f8db 001c 	ldr.w	r0, [fp, #28]
c0de523e:	2800      	cmp	r0, #0
c0de5240:	d04f      	beq.n	c0de52e2 <addContentCenter+0x386>
c0de5242:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de5246:	f001 fa45 	bl	c0de66d4 <OUTLINED_FUNCTION_0>
c0de524a:	2401      	movs	r4, #1
c0de524c:	4607      	mov	r7, r0
c0de524e:	77c4      	strb	r4, [r0, #31]
c0de5250:	f8db 001c 	ldr.w	r0, [fp, #28]
c0de5254:	f005 fd50 	bl	c0deacf8 <pic>
c0de5258:	4601      	mov	r1, r0
c0de525a:	20a0      	movs	r0, #160	@ 0xa0
c0de525c:	2301      	movs	r3, #1
c0de525e:	717c      	strb	r4, [r7, #5]
c0de5260:	f887 4024 	strb.w	r4, [r7, #36]	@ 0x24
c0de5264:	7138      	strb	r0, [r7, #4]
c0de5266:	200b      	movs	r0, #11
c0de5268:	0e0a      	lsrs	r2, r1, #24
c0de526a:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de526e:	2005      	movs	r0, #5
c0de5270:	f887 0020 	strb.w	r0, [r7, #32]
c0de5274:	4638      	mov	r0, r7
c0de5276:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de527a:	70c2      	strb	r2, [r0, #3]
c0de527c:	0c0a      	lsrs	r2, r1, #16
c0de527e:	7082      	strb	r2, [r0, #2]
c0de5280:	0a08      	lsrs	r0, r1, #8
c0de5282:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de5286:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de528a:	f001 fc34 	bl	c0de6af6 <OUTLINED_FUNCTION_43>
c0de528e:	3010      	adds	r0, #16
c0de5290:	f001 fc47 	bl	c0de6b22 <OUTLINED_FUNCTION_46>
c0de5294:	d021      	beq.n	c0de52da <addContentCenter+0x37e>
c0de5296:	f001 fbea 	bl	c0de6a6e <OUTLINED_FUNCTION_37>
c0de529a:	eb02 0481 	add.w	r4, r2, r1, lsl #2
c0de529e:	f854 3c04 	ldr.w	r3, [r4, #-4]
c0de52a2:	f805 3f12 	strb.w	r3, [r5, #18]!
c0de52a6:	0e1e      	lsrs	r6, r3, #24
c0de52a8:	70ee      	strb	r6, [r5, #3]
c0de52aa:	0c1e      	lsrs	r6, r3, #16
c0de52ac:	0a1b      	lsrs	r3, r3, #8
c0de52ae:	706b      	strb	r3, [r5, #1]
c0de52b0:	2300      	movs	r3, #0
c0de52b2:	70ae      	strb	r6, [r5, #2]
c0de52b4:	2608      	movs	r6, #8
c0de52b6:	722b      	strb	r3, [r5, #8]
c0de52b8:	2310      	movs	r3, #16
c0de52ba:	712e      	strb	r6, [r5, #4]
c0de52bc:	71eb      	strb	r3, [r5, #7]
c0de52be:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de52c2:	7ee4      	ldrb	r4, [r4, #27]
c0de52c4:	2c02      	cmp	r4, #2
c0de52c6:	d105      	bne.n	c0de52d4 <addContentCenter+0x378>
c0de52c8:	f8bb 3020 	ldrh.w	r3, [fp, #32]
c0de52cc:	3310      	adds	r3, #16
c0de52ce:	0a1c      	lsrs	r4, r3, #8
c0de52d0:	767b      	strb	r3, [r7, #25]
c0de52d2:	76bc      	strb	r4, [r7, #26]
c0de52d4:	9e00      	ldr	r6, [sp, #0]
c0de52d6:	460c      	mov	r4, r1
c0de52d8:	e001      	b.n	c0de52de <addContentCenter+0x382>
c0de52da:	f001 fa05 	bl	c0de66e8 <OUTLINED_FUNCTION_2>
c0de52de:	f001 fb6c 	bl	c0de69ba <OUTLINED_FUNCTION_29>
c0de52e2:	2001      	movs	r0, #1
c0de52e4:	f888 a006 	strb.w	sl, [r8, #6]
c0de52e8:	f888 0005 	strb.w	r0, [r8, #5]
c0de52ec:	20a0      	movs	r0, #160	@ 0xa0
c0de52ee:	f888 0004 	strb.w	r0, [r8, #4]
c0de52f2:	2005      	movs	r0, #5
c0de52f4:	f888 0016 	strb.w	r0, [r8, #22]
c0de52f8:	2000      	movs	r0, #0
c0de52fa:	f888 001f 	strb.w	r0, [r8, #31]
c0de52fe:	ea4f 201a 	mov.w	r0, sl, lsr #8
c0de5302:	f888 0007 	strb.w	r0, [r8, #7]
c0de5306:	f89b 0022 	ldrb.w	r0, [fp, #34]	@ 0x22
c0de530a:	b130      	cbz	r0, c0de531a <addContentCenter+0x3be>
c0de530c:	f10a 0028 	add.w	r0, sl, #40	@ 0x28
c0de5310:	f888 0006 	strb.w	r0, [r8, #6]
c0de5314:	0a00      	lsrs	r0, r0, #8
c0de5316:	f888 0007 	strb.w	r0, [r8, #7]
c0de531a:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de531e:	f001 fa6c 	bl	c0de67fa <OUTLINED_FUNCTION_10>
c0de5322:	f840 8022 	str.w	r8, [r0, r2, lsl #2]
c0de5326:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de532a:	f001 f9d7 	bl	c0de66dc <OUTLINED_FUNCTION_1>
c0de532e:	4640      	mov	r0, r8
c0de5330:	b004      	add	sp, #16
c0de5332:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de5336:	bf00      	nop
c0de5338:	0000155f 	.word	0x0000155f

c0de533c <nbgl_layoutAddContentCenter>:
c0de533c:	b128      	cbz	r0, c0de534a <nbgl_layoutAddContentCenter+0xe>
c0de533e:	b580      	push	{r7, lr}
c0de5340:	f7ff fe0c 	bl	c0de4f5c <addContentCenter>
c0de5344:	f001 fc2d 	bl	c0de6ba2 <OUTLINED_FUNCTION_55>
c0de5348:	bd80      	pop	{r7, pc}
c0de534a:	f001 bb7f 	b.w	c0de6a4c <OUTLINED_FUNCTION_35>

c0de534e <nbgl_layoutAddQRCode>:
c0de534e:	2800      	cmp	r0, #0
c0de5350:	f000 8116 	beq.w	c0de5580 <nbgl_layoutAddQRCode+0x232>
c0de5354:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de5358:	4606      	mov	r6, r0
c0de535a:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de535e:	460f      	mov	r7, r1
c0de5360:	f001 faa1 	bl	c0de68a6 <OUTLINED_FUNCTION_16>
c0de5364:	4682      	mov	sl, r0
c0de5366:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de536a:	08c1      	lsrs	r1, r0, #3
c0de536c:	2003      	movs	r0, #3
c0de536e:	f005 fae7 	bl	c0dea940 <nbgl_containerPoolGet>
c0de5372:	4654      	mov	r4, sl
c0de5374:	0e01      	lsrs	r1, r0, #24
c0de5376:	f04f 0b00 	mov.w	fp, #0
c0de537a:	f804 0f22 	strb.w	r0, [r4, #34]!
c0de537e:	f88a b020 	strb.w	fp, [sl, #32]
c0de5382:	70e1      	strb	r1, [r4, #3]
c0de5384:	0c01      	lsrs	r1, r0, #16
c0de5386:	0a00      	lsrs	r0, r0, #8
c0de5388:	70a1      	strb	r1, [r4, #2]
c0de538a:	f88a 0023 	strb.w	r0, [sl, #35]	@ 0x23
c0de538e:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de5392:	08c1      	lsrs	r1, r0, #3
c0de5394:	200a      	movs	r0, #10
c0de5396:	f005 face 	bl	c0dea936 <nbgl_objPoolGet>
c0de539a:	4680      	mov	r8, r0
c0de539c:	6838      	ldr	r0, [r7, #0]
c0de539e:	f005 fcab 	bl	c0deacf8 <pic>
c0de53a2:	f005 ff37 	bl	c0deb214 <strlen>
c0de53a6:	283e      	cmp	r0, #62	@ 0x3e
c0de53a8:	f04f 0000 	mov.w	r0, #0
c0de53ac:	4645      	mov	r5, r8
c0de53ae:	bf88      	it	hi
c0de53b0:	2001      	movhi	r0, #1
c0de53b2:	f888 0020 	strb.w	r0, [r8, #32]
c0de53b6:	f888 b01f 	strb.w	fp, [r8, #31]
c0de53ba:	f44f 7084 	mov.w	r0, #264	@ 0x108
c0de53be:	bf88      	it	hi
c0de53c0:	20e4      	movhi	r0, #228	@ 0xe4
c0de53c2:	f888 0004 	strb.w	r0, [r8, #4]
c0de53c6:	f805 0f06 	strb.w	r0, [r5, #6]!
c0de53ca:	0a00      	lsrs	r0, r0, #8
c0de53cc:	7068      	strb	r0, [r5, #1]
c0de53ce:	f888 0005 	strb.w	r0, [r8, #5]
c0de53d2:	6838      	ldr	r0, [r7, #0]
c0de53d4:	f005 fc90 	bl	c0deacf8 <pic>
c0de53d8:	4641      	mov	r1, r8
c0de53da:	0e02      	lsrs	r2, r0, #24
c0de53dc:	f888 b009 	strb.w	fp, [r8, #9]
c0de53e0:	9601      	str	r6, [sp, #4]
c0de53e2:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de53e6:	f001 fba3 	bl	c0de6b30 <OUTLINED_FUNCTION_47>
c0de53ea:	f888 0022 	strb.w	r0, [r8, #34]	@ 0x22
c0de53ee:	7820      	ldrb	r0, [r4, #0]
c0de53f0:	78a1      	ldrb	r1, [r4, #2]
c0de53f2:	78e2      	ldrb	r2, [r4, #3]
c0de53f4:	f89a 4023 	ldrb.w	r4, [sl, #35]	@ 0x23
c0de53f8:	f89a 3020 	ldrb.w	r3, [sl, #32]
c0de53fc:	ea40 2004 	orr.w	r0, r0, r4, lsl #8
c0de5400:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de5404:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de5408:	7869      	ldrb	r1, [r5, #1]
c0de540a:	f840 8023 	str.w	r8, [r0, r3, lsl #2]
c0de540e:	2002      	movs	r0, #2
c0de5410:	f888 0016 	strb.w	r0, [r8, #22]
c0de5414:	1c58      	adds	r0, r3, #1
c0de5416:	f88a 0020 	strb.w	r0, [sl, #32]
c0de541a:	7828      	ldrb	r0, [r5, #0]
c0de541c:	ea40 2b01 	orr.w	fp, r0, r1, lsl #8
c0de5420:	6878      	ldr	r0, [r7, #4]
c0de5422:	2800      	cmp	r0, #0
c0de5424:	d053      	beq.n	c0de54ce <nbgl_layoutAddQRCode+0x180>
c0de5426:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de542a:	f001 f953 	bl	c0de66d4 <OUTLINED_FUNCTION_0>
c0de542e:	4605      	mov	r5, r0
c0de5430:	2000      	movs	r0, #0
c0de5432:	77e8      	strb	r0, [r5, #31]
c0de5434:	6878      	ldr	r0, [r7, #4]
c0de5436:	f005 fc5f 	bl	c0deacf8 <pic>
c0de543a:	4601      	mov	r1, r0
c0de543c:	20a0      	movs	r0, #160	@ 0xa0
c0de543e:	2201      	movs	r2, #1
c0de5440:	7128      	strb	r0, [r5, #4]
c0de5442:	2005      	movs	r0, #5
c0de5444:	716a      	strb	r2, [r5, #5]
c0de5446:	f885 2024 	strb.w	r2, [r5, #36]	@ 0x24
c0de544a:	0e0a      	lsrs	r2, r1, #24
c0de544c:	f885 0020 	strb.w	r0, [r5, #32]
c0de5450:	4628      	mov	r0, r5
c0de5452:	f001 fa02 	bl	c0de685a <OUTLINED_FUNCTION_13>
c0de5456:	f885 0027 	strb.w	r0, [r5, #39]	@ 0x27
c0de545a:	200d      	movs	r0, #13
c0de545c:	7bfa      	ldrb	r2, [r7, #15]
c0de545e:	2a00      	cmp	r2, #0
c0de5460:	bf08      	it	eq
c0de5462:	200b      	moveq	r0, #11
c0de5464:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de5468:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de546c:	2301      	movs	r3, #1
c0de546e:	f005 fa7b 	bl	c0dea968 <nbgl_getTextHeightInWidth>
c0de5472:	4651      	mov	r1, sl
c0de5474:	46be      	mov	lr, r7
c0de5476:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de547a:	784c      	ldrb	r4, [r1, #1]
c0de547c:	788a      	ldrb	r2, [r1, #2]
c0de547e:	78cf      	ldrb	r7, [r1, #3]
c0de5480:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de5484:	ea42 2207 	orr.w	r2, r2, r7, lsl #8
c0de5488:	ea4c 2404 	orr.w	r4, ip, r4, lsl #8
c0de548c:	462f      	mov	r7, r5
c0de548e:	ea44 4202 	orr.w	r2, r4, r2, lsl #16
c0de5492:	eb02 0483 	add.w	r4, r2, r3, lsl #2
c0de5496:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de549a:	f807 4f12 	strb.w	r4, [r7, #18]!
c0de549e:	0e26      	lsrs	r6, r4, #24
c0de54a0:	70fe      	strb	r6, [r7, #3]
c0de54a2:	0c26      	lsrs	r6, r4, #16
c0de54a4:	0a24      	lsrs	r4, r4, #8
c0de54a6:	70be      	strb	r6, [r7, #2]
c0de54a8:	74ec      	strb	r4, [r5, #19]
c0de54aa:	f842 5023 	str.w	r5, [r2, r3, lsl #2]
c0de54ae:	2200      	movs	r2, #0
c0de54b0:	71a8      	strb	r0, [r5, #6]
c0de54b2:	4677      	mov	r7, lr
c0de54b4:	76aa      	strb	r2, [r5, #26]
c0de54b6:	2218      	movs	r2, #24
c0de54b8:	766a      	strb	r2, [r5, #25]
c0de54ba:	2208      	movs	r2, #8
c0de54bc:	75aa      	strb	r2, [r5, #22]
c0de54be:	0a02      	lsrs	r2, r0, #8
c0de54c0:	4458      	add	r0, fp
c0de54c2:	71ea      	strb	r2, [r5, #7]
c0de54c4:	1c5a      	adds	r2, r3, #1
c0de54c6:	f100 0b18 	add.w	fp, r0, #24
c0de54ca:	f801 2c02 	strb.w	r2, [r1, #-2]
c0de54ce:	68b8      	ldr	r0, [r7, #8]
c0de54d0:	9700      	str	r7, [sp, #0]
c0de54d2:	2800      	cmp	r0, #0
c0de54d4:	d056      	beq.n	c0de5584 <nbgl_layoutAddQRCode+0x236>
c0de54d6:	9801      	ldr	r0, [sp, #4]
c0de54d8:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de54dc:	f001 f8fa 	bl	c0de66d4 <OUTLINED_FUNCTION_0>
c0de54e0:	2401      	movs	r4, #1
c0de54e2:	4605      	mov	r5, r0
c0de54e4:	77c4      	strb	r4, [r0, #31]
c0de54e6:	68b8      	ldr	r0, [r7, #8]
c0de54e8:	f005 fc06 	bl	c0deacf8 <pic>
c0de54ec:	4601      	mov	r1, r0
c0de54ee:	20a0      	movs	r0, #160	@ 0xa0
c0de54f0:	2301      	movs	r3, #1
c0de54f2:	716c      	strb	r4, [r5, #5]
c0de54f4:	f885 4024 	strb.w	r4, [r5, #36]	@ 0x24
c0de54f8:	7128      	strb	r0, [r5, #4]
c0de54fa:	200b      	movs	r0, #11
c0de54fc:	0e0a      	lsrs	r2, r1, #24
c0de54fe:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de5502:	2005      	movs	r0, #5
c0de5504:	f885 0020 	strb.w	r0, [r5, #32]
c0de5508:	4628      	mov	r0, r5
c0de550a:	f001 f924 	bl	c0de6756 <OUTLINED_FUNCTION_5>
c0de550e:	4651      	mov	r1, sl
c0de5510:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de5514:	784b      	ldrb	r3, [r1, #1]
c0de5516:	788e      	ldrb	r6, [r1, #2]
c0de5518:	78cc      	ldrb	r4, [r1, #3]
c0de551a:	f811 2c02 	ldrb.w	r2, [r1, #-2]
c0de551e:	ea4c 2303 	orr.w	r3, ip, r3, lsl #8
c0de5522:	ea46 2404 	orr.w	r4, r6, r4, lsl #8
c0de5526:	f8d7 c004 	ldr.w	ip, [r7, #4]
c0de552a:	2700      	movs	r7, #0
c0de552c:	462e      	mov	r6, r5
c0de552e:	ea43 4e04 	orr.w	lr, r3, r4, lsl #16
c0de5532:	eb0e 0482 	add.w	r4, lr, r2, lsl #2
c0de5536:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de553a:	76af      	strb	r7, [r5, #26]
c0de553c:	271c      	movs	r7, #28
c0de553e:	f1bc 0f00 	cmp.w	ip, #0
c0de5542:	bf08      	it	eq
c0de5544:	2720      	moveq	r7, #32
c0de5546:	766f      	strb	r7, [r5, #25]
c0de5548:	f806 4f12 	strb.w	r4, [r6, #18]!
c0de554c:	0e23      	lsrs	r3, r4, #24
c0de554e:	70f3      	strb	r3, [r6, #3]
c0de5550:	0c23      	lsrs	r3, r4, #16
c0de5552:	70b3      	strb	r3, [r6, #2]
c0de5554:	0a23      	lsrs	r3, r4, #8
c0de5556:	9e01      	ldr	r6, [sp, #4]
c0de5558:	74eb      	strb	r3, [r5, #19]
c0de555a:	2308      	movs	r3, #8
c0de555c:	f84e 5022 	str.w	r5, [lr, r2, lsl #2]
c0de5560:	3201      	adds	r2, #1
c0de5562:	71a8      	strb	r0, [r5, #6]
c0de5564:	75ab      	strb	r3, [r5, #22]
c0de5566:	0a03      	lsrs	r3, r0, #8
c0de5568:	f801 2c02 	strb.w	r2, [r1, #-2]
c0de556c:	71eb      	strb	r3, [r5, #7]
c0de556e:	f1bc 0f00 	cmp.w	ip, #0
c0de5572:	bf08      	it	eq
c0de5574:	f10b 0b08 	addeq.w	fp, fp, #8
c0de5578:	4458      	add	r0, fp
c0de557a:	eb00 0b07 	add.w	fp, r0, r7
c0de557e:	e002      	b.n	c0de5586 <nbgl_layoutAddQRCode+0x238>
c0de5580:	f001 ba64 	b.w	c0de6a4c <OUTLINED_FUNCTION_35>
c0de5584:	9e01      	ldr	r6, [sp, #4]
c0de5586:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de558a:	fa1f f18b 	uxth.w	r1, fp
c0de558e:	7982      	ldrb	r2, [r0, #6]
c0de5590:	79c3      	ldrb	r3, [r0, #7]
c0de5592:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5596:	3a10      	subs	r2, #16
c0de5598:	428a      	cmp	r2, r1
c0de559a:	dd01      	ble.n	c0de55a0 <nbgl_layoutAddQRCode+0x252>
c0de559c:	9d00      	ldr	r5, [sp, #0]
c0de559e:	e012      	b.n	c0de55c6 <nbgl_layoutAddQRCode+0x278>
c0de55a0:	f898 1020 	ldrb.w	r1, [r8, #32]
c0de55a4:	9d00      	ldr	r5, [sp, #0]
c0de55a6:	b971      	cbnz	r1, c0de55c6 <nbgl_layoutAddQRCode+0x278>
c0de55a8:	2100      	movs	r1, #0
c0de55aa:	2284      	movs	r2, #132	@ 0x84
c0de55ac:	f1ab 0b84 	sub.w	fp, fp, #132	@ 0x84
c0de55b0:	f888 1007 	strb.w	r1, [r8, #7]
c0de55b4:	f888 1005 	strb.w	r1, [r8, #5]
c0de55b8:	2102      	movs	r1, #2
c0de55ba:	f888 2006 	strb.w	r2, [r8, #6]
c0de55be:	f888 2004 	strb.w	r2, [r8, #4]
c0de55c2:	f888 1020 	strb.w	r1, [r8, #32]
c0de55c6:	2100      	movs	r1, #0
c0de55c8:	f88a b006 	strb.w	fp, [sl, #6]
c0de55cc:	f88a 101f 	strb.w	r1, [sl, #31]
c0de55d0:	ea4f 211b 	mov.w	r1, fp, lsr #8
c0de55d4:	f88a 1007 	strb.w	r1, [sl, #7]
c0de55d8:	7ba9      	ldrb	r1, [r5, #14]
c0de55da:	b109      	cbz	r1, c0de55e0 <nbgl_layoutAddQRCode+0x292>
c0de55dc:	2005      	movs	r0, #5
c0de55de:	e00f      	b.n	c0de5600 <nbgl_layoutAddQRCode+0x2b2>
c0de55e0:	f001 f90b 	bl	c0de67fa <OUTLINED_FUNCTION_10>
c0de55e4:	4651      	mov	r1, sl
c0de55e6:	eb00 0082 	add.w	r0, r0, r2, lsl #2
c0de55ea:	f850 0c04 	ldr.w	r0, [r0, #-4]
c0de55ee:	f801 0f12 	strb.w	r0, [r1, #18]!
c0de55f2:	0e02      	lsrs	r2, r0, #24
c0de55f4:	70ca      	strb	r2, [r1, #3]
c0de55f6:	0c02      	lsrs	r2, r0, #16
c0de55f8:	0a00      	lsrs	r0, r0, #8
c0de55fa:	7048      	strb	r0, [r1, #1]
c0de55fc:	2008      	movs	r0, #8
c0de55fe:	708a      	strb	r2, [r1, #2]
c0de5600:	f88a 0016 	strb.w	r0, [sl, #22]
c0de5604:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de5608:	f001 f9be 	bl	c0de6988 <OUTLINED_FUNCTION_27>
c0de560c:	2001      	movs	r0, #1
c0de560e:	f88a 0005 	strb.w	r0, [sl, #5]
c0de5612:	20a0      	movs	r0, #160	@ 0xa0
c0de5614:	f88a 0004 	strb.w	r0, [sl, #4]
c0de5618:	89a8      	ldrh	r0, [r5, #12]
c0de561a:	f88a 0019 	strb.w	r0, [sl, #25]
c0de561e:	0a00      	lsrs	r0, r0, #8
c0de5620:	f88a 001a 	strb.w	r0, [sl, #26]
c0de5624:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de5628:	f001 f858 	bl	c0de66dc <OUTLINED_FUNCTION_1>
c0de562c:	fa1f f08b 	uxth.w	r0, fp
c0de5630:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de5634 <nbgl_layoutAddChoiceButtons>:
c0de5634:	b510      	push	{r4, lr}
c0de5636:	b086      	sub	sp, #24
c0de5638:	2206      	movs	r2, #6
c0de563a:	f10d 0c04 	add.w	ip, sp, #4
c0de563e:	f8ad 2000 	strh.w	r2, [sp]
c0de5642:	e891 001c 	ldmia.w	r1, {r2, r3, r4}
c0de5646:	e8ac 001c 	stmia.w	ip!, {r2, r3, r4}
c0de564a:	898a      	ldrh	r2, [r1, #12]
c0de564c:	7b89      	ldrb	r1, [r1, #14]
c0de564e:	f88d 1012 	strb.w	r1, [sp, #18]
c0de5652:	4669      	mov	r1, sp
c0de5654:	f8ad 2010 	strh.w	r2, [sp, #16]
c0de5658:	f7fe fb40 	bl	c0de3cdc <nbgl_layoutAddExtendedFooter>
c0de565c:	b006      	add	sp, #24
c0de565e:	bd10      	pop	{r4, pc}

c0de5660 <nbgl_layoutAddHorizontalButtons>:
c0de5660:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de5662:	2202      	movs	r2, #2
c0de5664:	f88d 2004 	strb.w	r2, [sp, #4]
c0de5668:	e9d1 2300 	ldrd	r2, r3, [r1]
c0de566c:	e9cd 2302 	strd	r2, r3, [sp, #8]
c0de5670:	890a      	ldrh	r2, [r1, #8]
c0de5672:	7a89      	ldrb	r1, [r1, #10]
c0de5674:	f8ad 2010 	strh.w	r2, [sp, #16]
c0de5678:	f88d 1012 	strb.w	r1, [sp, #18]
c0de567c:	a901      	add	r1, sp, #4
c0de567e:	f7fd ff85 	bl	c0de358c <nbgl_layoutAddUpFooter>
c0de5682:	b006      	add	sp, #24
c0de5684:	bd80      	pop	{r7, pc}
	...

c0de5688 <nbgl_layoutAddTagValueList>:
c0de5688:	2800      	cmp	r0, #0
c0de568a:	f000 818a 	beq.w	c0de59a2 <nbgl_layoutAddTagValueList+0x31a>
c0de568e:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de5692:	b088      	sub	sp, #32
c0de5694:	4680      	mov	r8, r0
c0de5696:	48c4      	ldr	r0, [pc, #784]	@ (c0de59a8 <nbgl_layoutAddTagValueList+0x320>)
c0de5698:	460c      	mov	r4, r1
c0de569a:	2100      	movs	r1, #0
c0de569c:	f04f 0b00 	mov.w	fp, #0
c0de56a0:	f8cd 8004 	str.w	r8, [sp, #4]
c0de56a4:	9406      	str	r4, [sp, #24]
c0de56a6:	4478      	add	r0, pc
c0de56a8:	9000      	str	r0, [sp, #0]
c0de56aa:	7a20      	ldrb	r0, [r4, #8]
c0de56ac:	4583      	cmp	fp, r0
c0de56ae:	f080 8174 	bcs.w	c0de599a <nbgl_layoutAddTagValueList+0x312>
c0de56b2:	6820      	ldr	r0, [r4, #0]
c0de56b4:	e9cd b104 	strd	fp, r1, [sp, #16]
c0de56b8:	b110      	cbz	r0, c0de56c0 <nbgl_layoutAddTagValueList+0x38>
c0de56ba:	eb00 0b01 	add.w	fp, r0, r1
c0de56be:	e005      	b.n	c0de56cc <nbgl_layoutAddTagValueList+0x44>
c0de56c0:	7a60      	ldrb	r0, [r4, #9]
c0de56c2:	6861      	ldr	r1, [r4, #4]
c0de56c4:	4458      	add	r0, fp
c0de56c6:	b2c0      	uxtb	r0, r0
c0de56c8:	4788      	blx	r1
c0de56ca:	4683      	mov	fp, r0
c0de56cc:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de56d0:	9c00      	ldr	r4, [sp, #0]
c0de56d2:	08c1      	lsrs	r1, r0, #3
c0de56d4:	2001      	movs	r0, #1
c0de56d6:	47a0      	blx	r4
c0de56d8:	4682      	mov	sl, r0
c0de56da:	f8db 0008 	ldr.w	r0, [fp, #8]
c0de56de:	2800      	cmp	r0, #0
c0de56e0:	f04f 0003 	mov.w	r0, #3
c0de56e4:	bf08      	it	eq
c0de56e6:	2002      	moveq	r0, #2
c0de56e8:	f898 10ad 	ldrb.w	r1, [r8, #173]	@ 0xad
c0de56ec:	f001 face 	bl	c0de6c8c <OUTLINED_FUNCTION_74>
c0de56f0:	4656      	mov	r6, sl
c0de56f2:	0e01      	lsrs	r1, r0, #24
c0de56f4:	f806 0f22 	strb.w	r0, [r6, #34]!
c0de56f8:	f001 fa75 	bl	c0de6be6 <OUTLINED_FUNCTION_60>
c0de56fc:	f88a 0023 	strb.w	r0, [sl, #35]	@ 0x23
c0de5700:	f001 fadc 	bl	c0de6cbc <OUTLINED_FUNCTION_80>
c0de5704:	4605      	mov	r5, r0
c0de5706:	f001 fad9 	bl	c0de6cbc <OUTLINED_FUNCTION_80>
c0de570a:	4607      	mov	r7, r0
c0de570c:	f8db 0000 	ldr.w	r0, [fp]
c0de5710:	2401      	movs	r4, #1
c0de5712:	77ec      	strb	r4, [r5, #31]
c0de5714:	f005 faf0 	bl	c0deacf8 <pic>
c0de5718:	4601      	mov	r1, r0
c0de571a:	20a0      	movs	r0, #160	@ 0xa0
c0de571c:	716c      	strb	r4, [r5, #5]
c0de571e:	f885 4024 	strb.w	r4, [r5, #36]	@ 0x24
c0de5722:	2404      	movs	r4, #4
c0de5724:	2301      	movs	r3, #1
c0de5726:	7128      	strb	r0, [r5, #4]
c0de5728:	200b      	movs	r0, #11
c0de572a:	0e0a      	lsrs	r2, r1, #24
c0de572c:	f885 4020 	strb.w	r4, [r5, #32]
c0de5730:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de5734:	4628      	mov	r0, r5
c0de5736:	f001 f80e 	bl	c0de6756 <OUTLINED_FUNCTION_5>
c0de573a:	71a8      	strb	r0, [r5, #6]
c0de573c:	9003      	str	r0, [sp, #12]
c0de573e:	0a00      	lsrs	r0, r0, #8
c0de5740:	f04f 0800 	mov.w	r8, #0
c0de5744:	2109      	movs	r1, #9
c0de5746:	71e8      	strb	r0, [r5, #7]
c0de5748:	f105 0012 	add.w	r0, r5, #18
c0de574c:	f885 8021 	strb.w	r8, [r5, #33]	@ 0x21
c0de5750:	f005 fcf4 	bl	c0deb13c <__aeabi_memclr>
c0de5754:	f89a 1023 	ldrb.w	r1, [sl, #35]	@ 0x23
c0de5758:	7832      	ldrb	r2, [r6, #0]
c0de575a:	78b3      	ldrb	r3, [r6, #2]
c0de575c:	78f6      	ldrb	r6, [r6, #3]
c0de575e:	f89a 0020 	ldrb.w	r0, [sl, #32]
c0de5762:	f887 801f 	strb.w	r8, [r7, #31]
c0de5766:	f001 fa9b 	bl	c0de6ca0 <OUTLINED_FUNCTION_76>
c0de576a:	f841 5020 	str.w	r5, [r1, r0, lsl #2]
c0de576e:	3001      	adds	r0, #1
c0de5770:	f88a 0020 	strb.w	r0, [sl, #32]
c0de5774:	f8db 0004 	ldr.w	r0, [fp, #4]
c0de5778:	f005 fabe 	bl	c0deacf8 <pic>
c0de577c:	4601      	mov	r1, r0
c0de577e:	4638      	mov	r0, r7
c0de5780:	f887 4020 	strb.w	r4, [r7, #32]
c0de5784:	9c06      	ldr	r4, [sp, #24]
c0de5786:	260c      	movs	r6, #12
c0de5788:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de578c:	0e0a      	lsrs	r2, r1, #24
c0de578e:	f001 f9c1 	bl	c0de6b14 <OUTLINED_FUNCTION_45>
c0de5792:	7b20      	ldrb	r0, [r4, #12]
c0de5794:	2800      	cmp	r0, #0
c0de5796:	bf08      	it	eq
c0de5798:	260d      	moveq	r6, #13
c0de579a:	f887 6022 	strb.w	r6, [r7, #34]	@ 0x22
c0de579e:	f89b 200c 	ldrb.w	r2, [fp, #12]
c0de57a2:	0752      	lsls	r2, r2, #29
c0de57a4:	d417      	bmi.n	c0de57d6 <nbgl_layoutAddTagValueList+0x14e>
c0de57a6:	f8db 2008 	ldr.w	r2, [fp, #8]
c0de57aa:	2a00      	cmp	r2, #0
c0de57ac:	f000 80f0 	beq.w	c0de5990 <nbgl_layoutAddTagValueList+0x308>
c0de57b0:	4610      	mov	r0, r2
c0de57b2:	f005 faa1 	bl	c0deacf8 <pic>
c0de57b6:	4639      	mov	r1, r7
c0de57b8:	f811 2f26 	ldrb.w	r2, [r1, #38]!
c0de57bc:	784b      	ldrb	r3, [r1, #1]
c0de57be:	f811 6c04 	ldrb.w	r6, [r1, #-4]
c0de57c2:	f891 c002 	ldrb.w	ip, [r1, #2]
c0de57c6:	78c9      	ldrb	r1, [r1, #3]
c0de57c8:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de57cc:	ea4c 2101 	orr.w	r1, ip, r1, lsl #8
c0de57d0:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de57d4:	e001      	b.n	c0de57da <nbgl_layoutAddTagValueList+0x152>
c0de57d6:	4875      	ldr	r0, [pc, #468]	@ (c0de59ac <nbgl_layoutAddTagValueList+0x324>)
c0de57d8:	4478      	add	r0, pc
c0de57da:	7802      	ldrb	r2, [r0, #0]
c0de57dc:	7843      	ldrb	r3, [r0, #1]
c0de57de:	4680      	mov	r8, r0
c0de57e0:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de57e4:	f5c2 72ca 	rsb	r2, r2, #404	@ 0x194
c0de57e8:	0a13      	lsrs	r3, r2, #8
c0de57ea:	713a      	strb	r2, [r7, #4]
c0de57ec:	b292      	uxth	r2, r2
c0de57ee:	4630      	mov	r0, r6
c0de57f0:	717b      	strb	r3, [r7, #5]
c0de57f2:	7b63      	ldrb	r3, [r4, #13]
c0de57f4:	f005 f8bd 	bl	c0dea972 <nbgl_getTextNbLinesInWidth>
c0de57f8:	7aa1      	ldrb	r1, [r4, #10]
c0de57fa:	46a3      	mov	fp, r4
c0de57fc:	b121      	cbz	r1, c0de5808 <nbgl_layoutAddTagValueList+0x180>
c0de57fe:	4288      	cmp	r0, r1
c0de5800:	bf84      	itt	hi
c0de5802:	f887 1025 	strbhi.w	r1, [r7, #37]	@ 0x25
c0de5806:	4608      	movhi	r0, r1
c0de5808:	9007      	str	r0, [sp, #28]
c0de580a:	f897 0022 	ldrb.w	r0, [r7, #34]	@ 0x22
c0de580e:	f005 f89c 	bl	c0dea94a <nbgl_getFont>
c0de5812:	0a29      	lsrs	r1, r5, #8
c0de5814:	0e2a      	lsrs	r2, r5, #24
c0de5816:	46dc      	mov	ip, fp
c0de5818:	f04f 0e01 	mov.w	lr, #1
c0de581c:	74f9      	strb	r1, [r7, #19]
c0de581e:	4639      	mov	r1, r7
c0de5820:	f801 5f12 	strb.w	r5, [r1, #18]!
c0de5824:	70ca      	strb	r2, [r1, #3]
c0de5826:	0c2a      	lsrs	r2, r5, #16
c0de5828:	708a      	strb	r2, [r1, #2]
c0de582a:	4651      	mov	r1, sl
c0de582c:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de5830:	784d      	ldrb	r5, [r1, #1]
c0de5832:	788e      	ldrb	r6, [r1, #2]
c0de5834:	78cc      	ldrb	r4, [r1, #3]
c0de5836:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de583a:	ea46 2404 	orr.w	r4, r6, r4, lsl #8
c0de583e:	ea42 2205 	orr.w	r2, r2, r5, lsl #8
c0de5842:	2600      	movs	r6, #0
c0de5844:	ea42 4204 	orr.w	r2, r2, r4, lsl #16
c0de5848:	4644      	mov	r4, r8
c0de584a:	76be      	strb	r6, [r7, #26]
c0de584c:	f887 6021 	strb.w	r6, [r7, #33]	@ 0x21
c0de5850:	f842 7023 	str.w	r7, [r2, r3, lsl #2]
c0de5854:	2204      	movs	r2, #4
c0de5856:	767a      	strb	r2, [r7, #25]
c0de5858:	2207      	movs	r2, #7
c0de585a:	75ba      	strb	r2, [r7, #22]
c0de585c:	f89b 200d 	ldrb.w	r2, [fp, #13]
c0de5860:	79c5      	ldrb	r5, [r0, #7]
c0de5862:	f8dd b010 	ldr.w	fp, [sp, #16]
c0de5866:	f887 2024 	strb.w	r2, [r7, #36]	@ 0x24
c0de586a:	9a07      	ldr	r2, [sp, #28]
c0de586c:	fb02 f005 	mul.w	r0, r2, r5
c0de5870:	71b8      	strb	r0, [r7, #6]
c0de5872:	0a00      	lsrs	r0, r0, #8
c0de5874:	71f8      	strb	r0, [r7, #7]
c0de5876:	1c58      	adds	r0, r3, #1
c0de5878:	f1b8 0f00 	cmp.w	r8, #0
c0de587c:	f8dd 8004 	ldr.w	r8, [sp, #4]
c0de5880:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de5884:	d048      	beq.n	c0de5918 <nbgl_layoutAddTagValueList+0x290>
c0de5886:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de588a:	f001 f83f 	bl	c0de690c <OUTLINED_FUNCTION_21>
c0de588e:	9502      	str	r5, [sp, #8]
c0de5890:	4605      	mov	r5, r0
c0de5892:	9806      	ldr	r0, [sp, #24]
c0de5894:	4651      	mov	r1, sl
c0de5896:	2309      	movs	r3, #9
c0de5898:	7ac2      	ldrb	r2, [r0, #11]
c0de589a:	4640      	mov	r0, r8
c0de589c:	f7fd fbf8 	bl	c0de3090 <layoutAddCallbackObj>
c0de58a0:	0a21      	lsrs	r1, r4, #8
c0de58a2:	0e22      	lsrs	r2, r4, #24
c0de58a4:	2600      	movs	r6, #0
c0de58a6:	f04f 0e01 	mov.w	lr, #1
c0de58aa:	f885 1022 	strb.w	r1, [r5, #34]	@ 0x22
c0de58ae:	0a39      	lsrs	r1, r7, #8
c0de58b0:	762e      	strb	r6, [r5, #24]
c0de58b2:	77ee      	strb	r6, [r5, #31]
c0de58b4:	74e9      	strb	r1, [r5, #19]
c0de58b6:	4629      	mov	r1, r5
c0de58b8:	f801 4f21 	strb.w	r4, [r1, #33]!
c0de58bc:	70ca      	strb	r2, [r1, #3]
c0de58be:	0c22      	lsrs	r2, r4, #16
c0de58c0:	708a      	strb	r2, [r1, #2]
c0de58c2:	4629      	mov	r1, r5
c0de58c4:	0e3a      	lsrs	r2, r7, #24
c0de58c6:	4673      	mov	r3, lr
c0de58c8:	f001 f9be 	bl	c0de6c48 <OUTLINED_FUNCTION_69>
c0de58cc:	469e      	mov	lr, r3
c0de58ce:	4651      	mov	r1, sl
c0de58d0:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de58d4:	784c      	ldrb	r4, [r1, #1]
c0de58d6:	788f      	ldrb	r7, [r1, #2]
c0de58d8:	78cb      	ldrb	r3, [r1, #3]
c0de58da:	f811 cc02 	ldrb.w	ip, [r1, #-2]
c0de58de:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de58e2:	ea47 2403 	orr.w	r4, r7, r3, lsl #8
c0de58e6:	ea42 4204 	orr.w	r2, r2, r4, lsl #16
c0de58ea:	f842 502c 	str.w	r5, [r2, ip, lsl #2]
c0de58ee:	220c      	movs	r2, #12
c0de58f0:	75ea      	strb	r2, [r5, #23]
c0de58f2:	f880 b005 	strb.w	fp, [r0, #5]
c0de58f6:	f10b 000f 	add.w	r0, fp, #15
c0de58fa:	75aa      	strb	r2, [r5, #22]
c0de58fc:	9d02      	ldr	r5, [sp, #8]
c0de58fe:	9a07      	ldr	r2, [sp, #28]
c0de5900:	f801 6c05 	strb.w	r6, [r1, #-5]
c0de5904:	f801 ec06 	strb.w	lr, [r1, #-6]
c0de5908:	f801 0c04 	strb.w	r0, [r1, #-4]
c0de590c:	f10c 0001 	add.w	r0, ip, #1
c0de5910:	f8dd c018 	ldr.w	ip, [sp, #24]
c0de5914:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de5918:	9803      	ldr	r0, [sp, #12]
c0de591a:	4659      	mov	r1, fp
c0de591c:	fb02 0005 	mla	r0, r2, r5, r0
c0de5920:	3004      	adds	r0, #4
c0de5922:	f1bb 0f00 	cmp.w	fp, #0
c0de5926:	bf18      	it	ne
c0de5928:	2118      	movne	r1, #24
c0de592a:	f88a 1019 	strb.w	r1, [sl, #25]
c0de592e:	f88a e005 	strb.w	lr, [sl, #5]
c0de5932:	f88a 6018 	strb.w	r6, [sl, #24]
c0de5936:	f88a 601f 	strb.w	r6, [sl, #31]
c0de593a:	f88a 6016 	strb.w	r6, [sl, #22]
c0de593e:	f10b 0b01 	add.w	fp, fp, #1
c0de5942:	0a09      	lsrs	r1, r1, #8
c0de5944:	f88a 101a 	strb.w	r1, [sl, #26]
c0de5948:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de594c:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de5950:	784c      	ldrb	r4, [r1, #1]
c0de5952:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de5956:	788d      	ldrb	r5, [r1, #2]
c0de5958:	78c9      	ldrb	r1, [r1, #3]
c0de595a:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de595e:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de5962:	4664      	mov	r4, ip
c0de5964:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de5968:	f841 a023 	str.w	sl, [r1, r3, lsl #2]
c0de596c:	21a0      	movs	r1, #160	@ 0xa0
c0de596e:	f88a 0006 	strb.w	r0, [sl, #6]
c0de5972:	0a00      	lsrs	r0, r0, #8
c0de5974:	f88a 1004 	strb.w	r1, [sl, #4]
c0de5978:	2120      	movs	r1, #32
c0de597a:	f88a 0007 	strb.w	r0, [sl, #7]
c0de597e:	f88a 1017 	strb.w	r1, [sl, #23]
c0de5982:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de5986:	f000 fea9 	bl	c0de66dc <OUTLINED_FUNCTION_1>
c0de598a:	9905      	ldr	r1, [sp, #20]
c0de598c:	3110      	adds	r1, #16
c0de598e:	e68c      	b.n	c0de56aa <nbgl_layoutAddTagValueList+0x22>
c0de5990:	f04f 0800 	mov.w	r8, #0
c0de5994:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de5998:	e726      	b.n	c0de57e8 <nbgl_layoutAddTagValueList+0x160>
c0de599a:	2000      	movs	r0, #0
c0de599c:	b008      	add	sp, #32
c0de599e:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de59a2:	f001 b853 	b.w	c0de6a4c <OUTLINED_FUNCTION_35>
c0de59a6:	bf00      	nop
c0de59a8:	0000528d 	.word	0x0000528d
c0de59ac:	0000693a 	.word	0x0000693a

c0de59b0 <nbgl_layoutAddSeparationLine>:
c0de59b0:	b570      	push	{r4, r5, r6, lr}
c0de59b2:	f001 f97f 	bl	c0de6cb4 <OUTLINED_FUNCTION_79>
c0de59b6:	08c0      	lsrs	r0, r0, #3
c0de59b8:	f7ff fa7e 	bl	c0de4eb8 <createHorizontalLine>
c0de59bc:	f000 ffaa 	bl	c0de6914 <OUTLINED_FUNCTION_22>
c0de59c0:	21ff      	movs	r1, #255	@ 0xff
c0de59c2:	7681      	strb	r1, [r0, #26]
c0de59c4:	21fc      	movs	r1, #252	@ 0xfc
c0de59c6:	7641      	strb	r1, [r0, #25]
c0de59c8:	2103      	movs	r1, #3
c0de59ca:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de59ce:	f001 f8f6 	bl	c0de6bbe <OUTLINED_FUNCTION_57>
c0de59d2:	bd70      	pop	{r4, r5, r6, pc}

c0de59d4 <nbgl_layoutAddButton>:
c0de59d4:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de59d8:	b086      	sub	sp, #24
c0de59da:	b310      	cbz	r0, c0de5a22 <nbgl_layoutAddButton+0x4e>
c0de59dc:	4680      	mov	r8, r0
c0de59de:	7ac8      	ldrb	r0, [r1, #11]
c0de59e0:	460d      	mov	r5, r1
c0de59e2:	b108      	cbz	r0, c0de59e8 <nbgl_layoutAddButton+0x14>
c0de59e4:	7aa8      	ldrb	r0, [r5, #10]
c0de59e6:	b1f8      	cbz	r0, c0de5a28 <nbgl_layoutAddButton+0x54>
c0de59e8:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de59ec:	f000 ff5f 	bl	c0de68ae <OUTLINED_FUNCTION_17>
c0de59f0:	4606      	mov	r6, r0
c0de59f2:	7a2a      	ldrb	r2, [r5, #8]
c0de59f4:	7b2b      	ldrb	r3, [r5, #12]
c0de59f6:	4640      	mov	r0, r8
c0de59f8:	f000 ff85 	bl	c0de6906 <OUTLINED_FUNCTION_20>
c0de59fc:	b188      	cbz	r0, c0de5a22 <nbgl_layoutAddButton+0x4e>
c0de59fe:	210c      	movs	r1, #12
c0de5a00:	2000      	movs	r0, #0
c0de5a02:	7671      	strb	r1, [r6, #25]
c0de5a04:	2120      	movs	r1, #32
c0de5a06:	76b0      	strb	r0, [r6, #26]
c0de5a08:	7630      	strb	r0, [r6, #24]
c0de5a0a:	75b0      	strb	r0, [r6, #22]
c0de5a0c:	75f1      	strb	r1, [r6, #23]
c0de5a0e:	7a69      	ldrb	r1, [r5, #9]
c0de5a10:	b1e9      	cbz	r1, c0de5a4e <nbgl_layoutAddButton+0x7a>
c0de5a12:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de5a16:	2003      	movs	r0, #3
c0de5a18:	77f0      	strb	r0, [r6, #31]
c0de5a1a:	2902      	cmp	r1, #2
c0de5a1c:	bf18      	it	ne
c0de5a1e:	2002      	movne	r0, #2
c0de5a20:	e019      	b.n	c0de5a56 <nbgl_layoutAddButton+0x82>
c0de5a22:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de5a26:	e0a3      	b.n	c0de5b70 <nbgl_layoutAddButton+0x19c>
c0de5a28:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de5a2c:	2800      	cmp	r0, #0
c0de5a2e:	f000 80a2 	beq.w	c0de5b76 <nbgl_layoutAddButton+0x1a2>
c0de5a32:	2001      	movs	r0, #1
c0de5a34:	f88d 0000 	strb.w	r0, [sp]
c0de5a38:	e9d5 0100 	ldrd	r0, r1, [r5]
c0de5a3c:	9001      	str	r0, [sp, #4]
c0de5a3e:	7b28      	ldrb	r0, [r5, #12]
c0de5a40:	9102      	str	r1, [sp, #8]
c0de5a42:	4669      	mov	r1, sp
c0de5a44:	f001 f91b 	bl	c0de6c7e <OUTLINED_FUNCTION_73>
c0de5a48:	f7fd fda0 	bl	c0de358c <nbgl_layoutAddUpFooter>
c0de5a4c:	e090      	b.n	c0de5b70 <nbgl_layoutAddButton+0x19c>
c0de5a4e:	2103      	movs	r1, #3
c0de5a50:	77f0      	strb	r0, [r6, #31]
c0de5a52:	f886 1021 	strb.w	r1, [r6, #33]	@ 0x21
c0de5a56:	f886 0020 	strb.w	r0, [r6, #32]
c0de5a5a:	6828      	ldr	r0, [r5, #0]
c0de5a5c:	f005 f94c 	bl	c0deacf8 <pic>
c0de5a60:	210c      	movs	r1, #12
c0de5a62:	0e02      	lsrs	r2, r0, #24
c0de5a64:	f886 1023 	strb.w	r1, [r6, #35]	@ 0x23
c0de5a68:	4631      	mov	r1, r6
c0de5a6a:	f000 ff9d 	bl	c0de69a8 <OUTLINED_FUNCTION_28>
c0de5a6e:	f000 ff63 	bl	c0de6938 <OUTLINED_FUNCTION_23>
c0de5a72:	4631      	mov	r1, r6
c0de5a74:	0e02      	lsrs	r2, r0, #24
c0de5a76:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de5a7a:	70ca      	strb	r2, [r1, #3]
c0de5a7c:	0c02      	lsrs	r2, r0, #16
c0de5a7e:	0a00      	lsrs	r0, r0, #8
c0de5a80:	708a      	strb	r2, [r1, #2]
c0de5a82:	7048      	strb	r0, [r1, #1]
c0de5a84:	7aa8      	ldrb	r0, [r5, #10]
c0de5a86:	b308      	cbz	r0, c0de5acc <nbgl_layoutAddButton+0xf8>
c0de5a88:	4632      	mov	r2, r6
c0de5a8a:	f896 1026 	ldrb.w	r1, [r6, #38]	@ 0x26
c0de5a8e:	f896 0023 	ldrb.w	r0, [r6, #35]	@ 0x23
c0de5a92:	f812 3f25 	ldrb.w	r3, [r2, #37]!
c0de5a96:	f001 f8fc 	bl	c0de6c92 <OUTLINED_FUNCTION_75>
c0de5a9a:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de5a9e:	f004 ff6d 	bl	c0dea97c <nbgl_getTextWidth>
c0de5aa2:	4631      	mov	r1, r6
c0de5aa4:	3040      	adds	r0, #64	@ 0x40
c0de5aa6:	f811 2f2e 	ldrb.w	r2, [r1, #46]!
c0de5aaa:	784b      	ldrb	r3, [r1, #1]
c0de5aac:	788f      	ldrb	r7, [r1, #2]
c0de5aae:	78c9      	ldrb	r1, [r1, #3]
c0de5ab0:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5ab4:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de5ab8:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
c0de5abc:	2100      	movs	r1, #0
c0de5abe:	b18a      	cbz	r2, c0de5ae4 <nbgl_layoutAddButton+0x110>
c0de5ac0:	7813      	ldrb	r3, [r2, #0]
c0de5ac2:	7852      	ldrb	r2, [r2, #1]
c0de5ac4:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de5ac8:	320c      	adds	r2, #12
c0de5aca:	e00c      	b.n	c0de5ae6 <nbgl_layoutAddButton+0x112>
c0de5acc:	2000      	movs	r0, #0
c0de5ace:	71f0      	strb	r0, [r6, #7]
c0de5ad0:	2058      	movs	r0, #88	@ 0x58
c0de5ad2:	71b0      	strb	r0, [r6, #6]
c0de5ad4:	2001      	movs	r0, #1
c0de5ad6:	7170      	strb	r0, [r6, #5]
c0de5ad8:	20a0      	movs	r0, #160	@ 0xa0
c0de5ada:	7130      	strb	r0, [r6, #4]
c0de5adc:	2003      	movs	r0, #3
c0de5ade:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de5ae2:	e01d      	b.n	c0de5b20 <nbgl_layoutAddButton+0x14c>
c0de5ae4:	2200      	movs	r2, #0
c0de5ae6:	71f1      	strb	r1, [r6, #7]
c0de5ae8:	2140      	movs	r1, #64	@ 0x40
c0de5aea:	4410      	add	r0, r2
c0de5aec:	71b1      	strb	r1, [r6, #6]
c0de5aee:	2101      	movs	r1, #1
c0de5af0:	7130      	strb	r0, [r6, #4]
c0de5af2:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de5af6:	0a01      	lsrs	r1, r0, #8
c0de5af8:	7171      	strb	r1, [r6, #5]
c0de5afa:	7ae9      	ldrb	r1, [r5, #11]
c0de5afc:	2901      	cmp	r1, #1
c0de5afe:	d00f      	beq.n	c0de5b20 <nbgl_layoutAddButton+0x14c>
c0de5b00:	b280      	uxth	r0, r0
c0de5b02:	2102      	movs	r1, #2
c0de5b04:	f5c0 70d0 	rsb	r0, r0, #416	@ 0x1a0
c0de5b08:	fb90 f0f1 	sdiv	r0, r0, r1
c0de5b0c:	4631      	mov	r1, r6
c0de5b0e:	f811 2f17 	ldrb.w	r2, [r1, #23]!
c0de5b12:	784b      	ldrb	r3, [r1, #1]
c0de5b14:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5b18:	4410      	add	r0, r2
c0de5b1a:	7008      	strb	r0, [r1, #0]
c0de5b1c:	0a00      	lsrs	r0, r0, #8
c0de5b1e:	7048      	strb	r0, [r1, #1]
c0de5b20:	2000      	movs	r0, #0
c0de5b22:	4631      	mov	r1, r6
c0de5b24:	f801 0f12 	strb.w	r0, [r1, #18]!
c0de5b28:	74f0      	strb	r0, [r6, #19]
c0de5b2a:	70c8      	strb	r0, [r1, #3]
c0de5b2c:	7088      	strb	r0, [r1, #2]
c0de5b2e:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de5b32:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de5b36:	784f      	ldrb	r7, [r1, #1]
c0de5b38:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de5b3c:	788c      	ldrb	r4, [r1, #2]
c0de5b3e:	78c9      	ldrb	r1, [r1, #3]
c0de5b40:	ea42 2207 	orr.w	r2, r2, r7, lsl #8
c0de5b44:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
c0de5b48:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de5b4c:	2208      	movs	r2, #8
c0de5b4e:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
c0de5b52:	2101      	movs	r1, #1
c0de5b54:	7770      	strb	r0, [r6, #29]
c0de5b56:	7731      	strb	r1, [r6, #28]
c0de5b58:	7aa9      	ldrb	r1, [r5, #10]
c0de5b5a:	2900      	cmp	r1, #0
c0de5b5c:	bf08      	it	eq
c0de5b5e:	2207      	moveq	r2, #7
c0de5b60:	77b2      	strb	r2, [r6, #30]
c0de5b62:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de5b66:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de5b6a:	3201      	adds	r2, #1
c0de5b6c:	f881 2020 	strb.w	r2, [r1, #32]
c0de5b70:	b006      	add	sp, #24
c0de5b72:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de5b76:	2005      	movs	r0, #5
c0de5b78:	f8ad 0000 	strh.w	r0, [sp]
c0de5b7c:	e9d5 0100 	ldrd	r0, r1, [r5]
c0de5b80:	9001      	str	r0, [sp, #4]
c0de5b82:	7b28      	ldrb	r0, [r5, #12]
c0de5b84:	9102      	str	r1, [sp, #8]
c0de5b86:	4669      	mov	r1, sp
c0de5b88:	f001 f879 	bl	c0de6c7e <OUTLINED_FUNCTION_73>
c0de5b8c:	f7fe f8a6 	bl	c0de3cdc <nbgl_layoutAddExtendedFooter>
c0de5b90:	e7ee      	b.n	c0de5b70 <nbgl_layoutAddButton+0x19c>

c0de5b92 <nbgl_layoutAddLongPressButton>:
c0de5b92:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de5b94:	9102      	str	r1, [sp, #8]
c0de5b96:	2100      	movs	r1, #0
c0de5b98:	f88d 300d 	strb.w	r3, [sp, #13]
c0de5b9c:	f88d 200c 	strb.w	r2, [sp, #12]
c0de5ba0:	f88d 1004 	strb.w	r1, [sp, #4]
c0de5ba4:	b118      	cbz	r0, c0de5bae <nbgl_layoutAddLongPressButton+0x1c>
c0de5ba6:	a901      	add	r1, sp, #4
c0de5ba8:	f7fd fcf0 	bl	c0de358c <nbgl_layoutAddUpFooter>
c0de5bac:	e001      	b.n	c0de5bb2 <nbgl_layoutAddLongPressButton+0x20>
c0de5bae:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de5bb2:	b006      	add	sp, #24
c0de5bb4:	bd80      	pop	{r7, pc}

c0de5bb6 <nbgl_layoutAddFooter>:
c0de5bb6:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de5bb8:	9101      	str	r1, [sp, #4]
c0de5bba:	f240 1101 	movw	r1, #257	@ 0x101
c0de5bbe:	f88d 2009 	strb.w	r2, [sp, #9]
c0de5bc2:	2200      	movs	r2, #0
c0de5bc4:	f88d 300a 	strb.w	r3, [sp, #10]
c0de5bc8:	f8ad 1000 	strh.w	r1, [sp]
c0de5bcc:	4669      	mov	r1, sp
c0de5bce:	f88d 2008 	strb.w	r2, [sp, #8]
c0de5bd2:	f7fe f883 	bl	c0de3cdc <nbgl_layoutAddExtendedFooter>
c0de5bd6:	b006      	add	sp, #24
c0de5bd8:	bd80      	pop	{r7, pc}

c0de5bda <nbgl_layoutAddSplitFooter>:
c0de5bda:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de5bdc:	9101      	str	r1, [sp, #4]
c0de5bde:	f44f 7181 	mov.w	r1, #258	@ 0x102
c0de5be2:	f88d 200c 	strb.w	r2, [sp, #12]
c0de5be6:	9302      	str	r3, [sp, #8]
c0de5be8:	f8ad 1000 	strh.w	r1, [sp]
c0de5bec:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0de5bee:	f88d 100e 	strb.w	r1, [sp, #14]
c0de5bf2:	9908      	ldr	r1, [sp, #32]
c0de5bf4:	f88d 100d 	strb.w	r1, [sp, #13]
c0de5bf8:	4669      	mov	r1, sp
c0de5bfa:	f7fe f86f 	bl	c0de3cdc <nbgl_layoutAddExtendedFooter>
c0de5bfe:	b006      	add	sp, #24
c0de5c00:	bd80      	pop	{r7, pc}
	...

c0de5c04 <nbgl_layoutAddHeader>:
c0de5c04:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de5c08:	2800      	cmp	r0, #0
c0de5c0a:	f000 8239 	beq.w	c0de6080 <nbgl_layoutAddHeader+0x47c>
c0de5c0e:	460d      	mov	r5, r1
c0de5c10:	b119      	cbz	r1, c0de5c1a <nbgl_layoutAddHeader+0x16>
c0de5c12:	4604      	mov	r4, r0
c0de5c14:	7828      	ldrb	r0, [r5, #0]
c0de5c16:	2806      	cmp	r0, #6
c0de5c18:	d903      	bls.n	c0de5c22 <nbgl_layoutAddHeader+0x1e>
c0de5c1a:	f06f 0001 	mvn.w	r0, #1
c0de5c1e:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de5c22:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5c26:	2601      	movs	r6, #1
c0de5c28:	f000 fe3d 	bl	c0de68a6 <OUTLINED_FUNCTION_16>
c0de5c2c:	2100      	movs	r1, #0
c0de5c2e:	7146      	strb	r6, [r0, #5]
c0de5c30:	77c1      	strb	r1, [r0, #31]
c0de5c32:	21e0      	movs	r1, #224	@ 0xe0
c0de5c34:	7101      	strb	r1, [r0, #4]
c0de5c36:	60e0      	str	r0, [r4, #12]
c0de5c38:	f000 ffe8 	bl	c0de6c0c <OUTLINED_FUNCTION_64>
c0de5c3c:	68e1      	ldr	r1, [r4, #12]
c0de5c3e:	0a02      	lsrs	r2, r0, #8
c0de5c40:	0e03      	lsrs	r3, r0, #24
c0de5c42:	f881 2023 	strb.w	r2, [r1, #35]	@ 0x23
c0de5c46:	2202      	movs	r2, #2
c0de5c48:	f001 f804 	bl	c0de6c54 <OUTLINED_FUNCTION_70>
c0de5c4c:	70d3      	strb	r3, [r2, #3]
c0de5c4e:	7828      	ldrb	r0, [r5, #0]
c0de5c50:	1e42      	subs	r2, r0, #1
c0de5c52:	2a02      	cmp	r2, #2
c0de5c54:	d311      	bcc.n	c0de5c7a <nbgl_layoutAddHeader+0x76>
c0de5c56:	2806      	cmp	r0, #6
c0de5c58:	f000 80ab 	beq.w	c0de5db2 <nbgl_layoutAddHeader+0x1ae>
c0de5c5c:	2803      	cmp	r0, #3
c0de5c5e:	f000 81d9 	beq.w	c0de6014 <nbgl_layoutAddHeader+0x410>
c0de5c62:	2804      	cmp	r0, #4
c0de5c64:	f000 80d5 	beq.w	c0de5e12 <nbgl_layoutAddHeader+0x20e>
c0de5c68:	2805      	cmp	r0, #5
c0de5c6a:	d006      	beq.n	c0de5c7a <nbgl_layoutAddHeader+0x76>
c0de5c6c:	2800      	cmp	r0, #0
c0de5c6e:	d1d4      	bne.n	c0de5c1a <nbgl_layoutAddHeader+0x16>
c0de5c70:	88a8      	ldrh	r0, [r5, #4]
c0de5c72:	7188      	strb	r0, [r1, #6]
c0de5c74:	0a00      	lsrs	r0, r0, #8
c0de5c76:	71c8      	strb	r0, [r1, #7]
c0de5c78:	e1cc      	b.n	c0de6014 <nbgl_layoutAddHeader+0x410>
c0de5c7a:	f000 ff65 	bl	c0de6b48 <OUTLINED_FUNCTION_49>
c0de5c7e:	9001      	str	r0, [sp, #4]
c0de5c80:	7828      	ldrb	r0, [r5, #0]
c0de5c82:	210c      	movs	r1, #12
c0de5c84:	2805      	cmp	r0, #5
c0de5c86:	bf08      	it	eq
c0de5c88:	210d      	moveq	r1, #13
c0de5c8a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5c8e:	f815 b001 	ldrb.w	fp, [r5, r1]
c0de5c92:	f000 fe0c 	bl	c0de68ae <OUTLINED_FUNCTION_17>
c0de5c96:	4606      	mov	r6, r0
c0de5c98:	f04f 0a03 	mov.w	sl, #3
c0de5c9c:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de5ca0:	d00d      	beq.n	c0de5cbe <nbgl_layoutAddHeader+0xba>
c0de5ca2:	7828      	ldrb	r0, [r5, #0]
c0de5ca4:	210d      	movs	r1, #13
c0de5ca6:	465a      	mov	r2, fp
c0de5ca8:	2805      	cmp	r0, #5
c0de5caa:	bf08      	it	eq
c0de5cac:	210f      	moveq	r1, #15
c0de5cae:	5c6b      	ldrb	r3, [r5, r1]
c0de5cb0:	f000 fd5e 	bl	c0de6770 <OUTLINED_FUNCTION_6>
c0de5cb4:	2800      	cmp	r0, #0
c0de5cb6:	f000 81e3 	beq.w	c0de6080 <nbgl_layoutAddHeader+0x47c>
c0de5cba:	2000      	movs	r0, #0
c0de5cbc:	e000      	b.n	c0de5cc0 <nbgl_layoutAddHeader+0xbc>
c0de5cbe:	2003      	movs	r0, #3
c0de5cc0:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de5cc4:	2004      	movs	r0, #4
c0de5cc6:	f04f 0800 	mov.w	r8, #0
c0de5cca:	2160      	movs	r1, #96	@ 0x60
c0de5ccc:	f886 a01f 	strb.w	sl, [r6, #31]
c0de5cd0:	f886 a020 	strb.w	sl, [r6, #32]
c0de5cd4:	75b0      	strb	r0, [r6, #22]
c0de5cd6:	4630      	mov	r0, r6
c0de5cd8:	71b1      	strb	r1, [r6, #6]
c0de5cda:	2168      	movs	r1, #104	@ 0x68
c0de5cdc:	f886 8026 	strb.w	r8, [r6, #38]	@ 0x26
c0de5ce0:	f886 8007 	strb.w	r8, [r6, #7]
c0de5ce4:	f886 8005 	strb.w	r8, [r6, #5]
c0de5ce8:	f800 8f25 	strb.w	r8, [r0, #37]!
c0de5cec:	7131      	strb	r1, [r6, #4]
c0de5cee:	f880 8003 	strb.w	r8, [r0, #3]
c0de5cf2:	f880 8002 	strb.w	r8, [r0, #2]
c0de5cf6:	48e4      	ldr	r0, [pc, #912]	@ (c0de6088 <nbgl_layoutAddHeader+0x484>)
c0de5cf8:	4478      	add	r0, pc
c0de5cfa:	f004 fffd 	bl	c0deacf8 <pic>
c0de5cfe:	4631      	mov	r1, r6
c0de5d00:	0e02      	lsrs	r2, r0, #24
c0de5d02:	f886 801d 	strb.w	r8, [r6, #29]
c0de5d06:	f000 fd5f 	bl	c0de67c8 <OUTLINED_FUNCTION_9>
c0de5d0a:	f1bb 00ff 	subs.w	r0, fp, #255	@ 0xff
c0de5d0e:	bf18      	it	ne
c0de5d10:	2001      	movne	r0, #1
c0de5d12:	7730      	strb	r0, [r6, #28]
c0de5d14:	9f01      	ldr	r7, [sp, #4]
c0de5d16:	68e1      	ldr	r1, [r4, #12]
c0de5d18:	2006      	movs	r0, #6
c0de5d1a:	77b0      	strb	r0, [r6, #30]
c0de5d1c:	f891 0020 	ldrb.w	r0, [r1, #32]
c0de5d20:	3001      	adds	r0, #1
c0de5d22:	2f00      	cmp	r7, #0
c0de5d24:	f881 0020 	strb.w	r0, [r1, #32]
c0de5d28:	f000 809a 	beq.w	c0de5e60 <nbgl_layoutAddHeader+0x25c>
c0de5d2c:	7828      	ldrb	r0, [r5, #0]
c0de5d2e:	f04f 0a00 	mov.w	sl, #0
c0de5d32:	2802      	cmp	r0, #2
c0de5d34:	d122      	bne.n	c0de5d7c <nbgl_layoutAddHeader+0x178>
c0de5d36:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5d3a:	f000 fde7 	bl	c0de690c <OUTLINED_FUNCTION_21>
c0de5d3e:	4606      	mov	r6, r0
c0de5d40:	f000 fdfa 	bl	c0de6938 <OUTLINED_FUNCTION_23>
c0de5d44:	4631      	mov	r1, r6
c0de5d46:	0e02      	lsrs	r2, r0, #24
c0de5d48:	f886 a01f 	strb.w	sl, [r6, #31]
c0de5d4c:	46b2      	mov	sl, r6
c0de5d4e:	f000 ff2d 	bl	c0de6bac <OUTLINED_FUNCTION_56>
c0de5d52:	68e0      	ldr	r0, [r4, #12]
c0de5d54:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de5d58:	7843      	ldrb	r3, [r0, #1]
c0de5d5a:	f810 cc02 	ldrb.w	ip, [r0, #-2]
c0de5d5e:	7882      	ldrb	r2, [r0, #2]
c0de5d60:	78c0      	ldrb	r0, [r0, #3]
c0de5d62:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de5d66:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de5d6a:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de5d6e:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de5d72:	2005      	movs	r0, #5
c0de5d74:	75b0      	strb	r0, [r6, #22]
c0de5d76:	68e0      	ldr	r0, [r4, #12]
c0de5d78:	f000 fcb0 	bl	c0de66dc <OUTLINED_FUNCTION_1>
c0de5d7c:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5d80:	f000 fca8 	bl	c0de66d4 <OUTLINED_FUNCTION_0>
c0de5d84:	782b      	ldrb	r3, [r5, #0]
c0de5d86:	4680      	mov	r8, r0
c0de5d88:	2b05      	cmp	r3, #5
c0de5d8a:	d16c      	bne.n	c0de5e66 <nbgl_layoutAddHeader+0x262>
c0de5d8c:	7b2a      	ldrb	r2, [r5, #12]
c0de5d8e:	2aff      	cmp	r2, #255	@ 0xff
c0de5d90:	d068      	beq.n	c0de5e64 <nbgl_layoutAddHeader+0x260>
c0de5d92:	7beb      	ldrb	r3, [r5, #15]
c0de5d94:	4620      	mov	r0, r4
c0de5d96:	4641      	mov	r1, r8
c0de5d98:	f7fd f97a 	bl	c0de3090 <layoutAddCallbackObj>
c0de5d9c:	2800      	cmp	r0, #0
c0de5d9e:	f000 816f 	beq.w	c0de6080 <nbgl_layoutAddHeader+0x47c>
c0de5da2:	2000      	movs	r0, #0
c0de5da4:	f888 001d 	strb.w	r0, [r8, #29]
c0de5da8:	2001      	movs	r0, #1
c0de5daa:	f888 001c 	strb.w	r0, [r8, #28]
c0de5dae:	782b      	ldrb	r3, [r5, #0]
c0de5db0:	e059      	b.n	c0de5e66 <nbgl_layoutAddHeader+0x262>
c0de5db2:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5db6:	f000 fc8d 	bl	c0de66d4 <OUTLINED_FUNCTION_0>
c0de5dba:	4606      	mov	r6, r0
c0de5dbc:	7a2a      	ldrb	r2, [r5, #8]
c0de5dbe:	7a6b      	ldrb	r3, [r5, #9]
c0de5dc0:	f000 fcd6 	bl	c0de6770 <OUTLINED_FUNCTION_6>
c0de5dc4:	2800      	cmp	r0, #0
c0de5dc6:	f000 815b 	beq.w	c0de6080 <nbgl_layoutAddHeader+0x47c>
c0de5dca:	2020      	movs	r0, #32
c0de5dcc:	4637      	mov	r7, r6
c0de5dce:	f04f 0a00 	mov.w	sl, #0
c0de5dd2:	f04f 0806 	mov.w	r8, #6
c0de5dd6:	f04f 0b01 	mov.w	fp, #1
c0de5dda:	75f0      	strb	r0, [r6, #23]
c0de5ddc:	20a0      	movs	r0, #160	@ 0xa0
c0de5dde:	f886 a01f 	strb.w	sl, [r6, #31]
c0de5de2:	f886 a018 	strb.w	sl, [r6, #24]
c0de5de6:	f886 8016 	strb.w	r8, [r6, #22]
c0de5dea:	f886 b005 	strb.w	fp, [r6, #5]
c0de5dee:	7130      	strb	r0, [r6, #4]
c0de5df0:	2060      	movs	r0, #96	@ 0x60
c0de5df2:	f807 0f06 	strb.w	r0, [r7, #6]!
c0de5df6:	f887 a001 	strb.w	sl, [r7, #1]
c0de5dfa:	f000 fd9d 	bl	c0de6938 <OUTLINED_FUNCTION_23>
c0de5dfe:	f000 fee7 	bl	c0de6bd0 <OUTLINED_FUNCTION_58>
c0de5e02:	f886 8020 	strb.w	r8, [r6, #32]
c0de5e06:	f000 fcb7 	bl	c0de6778 <OUTLINED_FUNCTION_7>
c0de5e0a:	f000 fee6 	bl	c0de6bda <OUTLINED_FUNCTION_59>
c0de5e0e:	77b0      	strb	r0, [r6, #30]
c0de5e10:	e01e      	b.n	c0de5e50 <nbgl_layoutAddHeader+0x24c>
c0de5e12:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5e16:	f000 fc5d 	bl	c0de66d4 <OUTLINED_FUNCTION_0>
c0de5e1a:	4606      	mov	r6, r0
c0de5e1c:	21a0      	movs	r1, #160	@ 0xa0
c0de5e1e:	2000      	movs	r0, #0
c0de5e20:	f04f 0801 	mov.w	r8, #1
c0de5e24:	7131      	strb	r1, [r6, #4]
c0de5e26:	2160      	movs	r1, #96	@ 0x60
c0de5e28:	4637      	mov	r7, r6
c0de5e2a:	77f0      	strb	r0, [r6, #31]
c0de5e2c:	f886 8005 	strb.w	r8, [r6, #5]
c0de5e30:	f807 1f06 	strb.w	r1, [r7, #6]!
c0de5e34:	7078      	strb	r0, [r7, #1]
c0de5e36:	f000 fd7f 	bl	c0de6938 <OUTLINED_FUNCTION_23>
c0de5e3a:	4631      	mov	r1, r6
c0de5e3c:	0e02      	lsrs	r2, r0, #24
c0de5e3e:	f886 8024 	strb.w	r8, [r6, #36]	@ 0x24
c0de5e42:	f000 fc99 	bl	c0de6778 <OUTLINED_FUNCTION_7>
c0de5e46:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de5e4a:	2005      	movs	r0, #5
c0de5e4c:	f886 0020 	strb.w	r0, [r6, #32]
c0de5e50:	68e1      	ldr	r1, [r4, #12]
c0de5e52:	787a      	ldrb	r2, [r7, #1]
c0de5e54:	7838      	ldrb	r0, [r7, #0]
c0de5e56:	71ca      	strb	r2, [r1, #7]
c0de5e58:	7188      	strb	r0, [r1, #6]
c0de5e5a:	f000 fec9 	bl	c0de6bf0 <OUTLINED_FUNCTION_61>
c0de5e5e:	e0d9      	b.n	c0de6014 <nbgl_layoutAddHeader+0x410>
c0de5e60:	7828      	ldrb	r0, [r5, #0]
c0de5e62:	e096      	b.n	c0de5f92 <nbgl_layoutAddHeader+0x38e>
c0de5e64:	2305      	movs	r3, #5
c0de5e66:	68e2      	ldr	r2, [r4, #12]
c0de5e68:	f04f 0e00 	mov.w	lr, #0
c0de5e6c:	f04f 0c05 	mov.w	ip, #5
c0de5e70:	f888 e01f 	strb.w	lr, [r8, #31]
c0de5e74:	f888 c016 	strb.w	ip, [r8, #22]
c0de5e78:	7916      	ldrb	r6, [r2, #4]
c0de5e7a:	7952      	ldrb	r2, [r2, #5]
c0de5e7c:	ea46 2602 	orr.w	r6, r6, r2, lsl #8
c0de5e80:	f1a6 02d0 	sub.w	r2, r6, #208	@ 0xd0
c0de5e84:	0a10      	lsrs	r0, r2, #8
c0de5e86:	f888 2004 	strb.w	r2, [r8, #4]
c0de5e8a:	2b02      	cmp	r3, #2
c0de5e8c:	f888 0005 	strb.w	r0, [r8, #5]
c0de5e90:	d117      	bne.n	c0de5ec2 <nbgl_layoutAddHeader+0x2be>
c0de5e92:	4650      	mov	r0, sl
c0de5e94:	f810 2f21 	ldrb.w	r2, [r0, #33]!
c0de5e98:	7843      	ldrb	r3, [r0, #1]
c0de5e9a:	7881      	ldrb	r1, [r0, #2]
c0de5e9c:	78c0      	ldrb	r0, [r0, #3]
c0de5e9e:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5ea2:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de5ea6:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de5eaa:	7801      	ldrb	r1, [r0, #0]
c0de5eac:	7840      	ldrb	r0, [r0, #1]
c0de5eae:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de5eb2:	1a30      	subs	r0, r6, r0
c0de5eb4:	f1a0 02e0 	sub.w	r2, r0, #224	@ 0xe0
c0de5eb8:	0a10      	lsrs	r0, r2, #8
c0de5eba:	f888 2004 	strb.w	r2, [r8, #4]
c0de5ebe:	f888 0005 	strb.w	r0, [r8, #5]
c0de5ec2:	4640      	mov	r0, r8
c0de5ec4:	0e39      	lsrs	r1, r7, #24
c0de5ec6:	b292      	uxth	r2, r2
c0de5ec8:	2301      	movs	r3, #1
c0de5eca:	f800 7f26 	strb.w	r7, [r0, #38]!
c0de5ece:	70c1      	strb	r1, [r0, #3]
c0de5ed0:	0c39      	lsrs	r1, r7, #16
c0de5ed2:	f800 ec1f 	strb.w	lr, [r0, #-31]
c0de5ed6:	f800 cc06 	strb.w	ip, [r0, #-6]
c0de5eda:	7081      	strb	r1, [r0, #2]
c0de5edc:	0a39      	lsrs	r1, r7, #8
c0de5ede:	7041      	strb	r1, [r0, #1]
c0de5ee0:	2160      	movs	r1, #96	@ 0x60
c0de5ee2:	f800 1c20 	strb.w	r1, [r0, #-32]
c0de5ee6:	210c      	movs	r1, #12
c0de5ee8:	f800 1c04 	strb.w	r1, [r0, #-4]
c0de5eec:	2101      	movs	r1, #1
c0de5eee:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de5ef2:	200c      	movs	r0, #12
c0de5ef4:	4639      	mov	r1, r7
c0de5ef6:	f004 fd3c 	bl	c0dea972 <nbgl_getTextNbLinesInWidth>
c0de5efa:	7828      	ldrb	r0, [r5, #0]
c0de5efc:	2802      	cmp	r0, #2
c0de5efe:	d115      	bne.n	c0de5f2c <nbgl_layoutAddHeader+0x328>
c0de5f00:	4646      	mov	r6, r8
c0de5f02:	f816 cf26 	ldrb.w	ip, [r6, #38]!
c0de5f06:	7872      	ldrb	r2, [r6, #1]
c0de5f08:	78b3      	ldrb	r3, [r6, #2]
c0de5f0a:	78f1      	ldrb	r1, [r6, #3]
c0de5f0c:	f816 0c04 	ldrb.w	r0, [r6, #-4]
c0de5f10:	ea4c 2202 	orr.w	r2, ip, r2, lsl #8
c0de5f14:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de5f18:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de5f1c:	f004 fd2e 	bl	c0dea97c <nbgl_getTextWidth>
c0de5f20:	f806 0c22 	strb.w	r0, [r6, #-34]
c0de5f24:	0a00      	lsrs	r0, r0, #8
c0de5f26:	f806 0c21 	strb.w	r0, [r6, #-33]
c0de5f2a:	7828      	ldrb	r0, [r5, #0]
c0de5f2c:	68e1      	ldr	r1, [r4, #12]
c0de5f2e:	f000 fd65 	bl	c0de69fc <OUTLINED_FUNCTION_32>
c0de5f32:	f841 8023 	str.w	r8, [r1, r3, lsl #2]
c0de5f36:	68e1      	ldr	r1, [r4, #12]
c0de5f38:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de5f3c:	3201      	adds	r2, #1
c0de5f3e:	2802      	cmp	r0, #2
c0de5f40:	f881 2020 	strb.w	r2, [r1, #32]
c0de5f44:	d125      	bne.n	c0de5f92 <nbgl_layoutAddHeader+0x38e>
c0de5f46:	f898 0004 	ldrb.w	r0, [r8, #4]
c0de5f4a:	f898 2005 	ldrb.w	r2, [r8, #5]
c0de5f4e:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de5f52:	f06f 0207 	mvn.w	r2, #7
c0de5f56:	eba2 0050 	sub.w	r0, r2, r0, lsr #1
c0de5f5a:	f81a 2f21 	ldrb.w	r2, [sl, #33]!
c0de5f5e:	f80a 0c0a 	strb.w	r0, [sl, #-10]
c0de5f62:	0a00      	lsrs	r0, r0, #8
c0de5f64:	f89a 3002 	ldrb.w	r3, [sl, #2]
c0de5f68:	f89a 6003 	ldrb.w	r6, [sl, #3]
c0de5f6c:	f80a 0c09 	strb.w	r0, [sl, #-9]
c0de5f70:	f89a 0001 	ldrb.w	r0, [sl, #1]
c0de5f74:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de5f78:	ea43 2206 	orr.w	r2, r3, r6, lsl #8
c0de5f7c:	f000 fea3 	bl	c0de6cc6 <OUTLINED_FUNCTION_81>
c0de5f80:	2208      	movs	r2, #8
c0de5f82:	eb02 0050 	add.w	r0, r2, r0, lsr #1
c0de5f86:	f888 0017 	strb.w	r0, [r8, #23]
c0de5f8a:	0a00      	lsrs	r0, r0, #8
c0de5f8c:	f888 0018 	strb.w	r0, [r8, #24]
c0de5f90:	e03c      	b.n	c0de600c <nbgl_layoutAddHeader+0x408>
c0de5f92:	2805      	cmp	r0, #5
c0de5f94:	d13a      	bne.n	c0de600c <nbgl_layoutAddHeader+0x408>
c0de5f96:	6868      	ldr	r0, [r5, #4]
c0de5f98:	b3c0      	cbz	r0, c0de600c <nbgl_layoutAddHeader+0x408>
c0de5f9a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5f9e:	f000 fc86 	bl	c0de68ae <OUTLINED_FUNCTION_17>
c0de5fa2:	7baa      	ldrb	r2, [r5, #14]
c0de5fa4:	4606      	mov	r6, r0
c0de5fa6:	2aff      	cmp	r2, #255	@ 0xff
c0de5fa8:	d008      	beq.n	c0de5fbc <nbgl_layoutAddHeader+0x3b8>
c0de5faa:	7beb      	ldrb	r3, [r5, #15]
c0de5fac:	f000 fbe0 	bl	c0de6770 <OUTLINED_FUNCTION_6>
c0de5fb0:	2800      	cmp	r0, #0
c0de5fb2:	d065      	beq.n	c0de6080 <nbgl_layoutAddHeader+0x47c>
c0de5fb4:	2000      	movs	r0, #0
c0de5fb6:	7770      	strb	r0, [r6, #29]
c0de5fb8:	2001      	movs	r0, #1
c0de5fba:	7730      	strb	r0, [r6, #28]
c0de5fbc:	2003      	movs	r0, #3
c0de5fbe:	2106      	movs	r1, #6
c0de5fc0:	2260      	movs	r2, #96	@ 0x60
c0de5fc2:	77f0      	strb	r0, [r6, #31]
c0de5fc4:	75b1      	strb	r1, [r6, #22]
c0de5fc6:	7ba9      	ldrb	r1, [r5, #14]
c0de5fc8:	71b2      	strb	r2, [r6, #6]
c0de5fca:	2268      	movs	r2, #104	@ 0x68
c0de5fcc:	f886 0020 	strb.w	r0, [r6, #32]
c0de5fd0:	2000      	movs	r0, #0
c0de5fd2:	7132      	strb	r2, [r6, #4]
c0de5fd4:	4632      	mov	r2, r6
c0de5fd6:	f886 0026 	strb.w	r0, [r6, #38]	@ 0x26
c0de5fda:	71f0      	strb	r0, [r6, #7]
c0de5fdc:	7170      	strb	r0, [r6, #5]
c0de5fde:	f802 0f25 	strb.w	r0, [r2, #37]!
c0de5fe2:	70d0      	strb	r0, [r2, #3]
c0de5fe4:	7090      	strb	r0, [r2, #2]
c0de5fe6:	f1a1 00ff 	sub.w	r0, r1, #255	@ 0xff
c0de5fea:	fab0 f080 	clz	r0, r0
c0de5fee:	0940      	lsrs	r0, r0, #5
c0de5ff0:	0040      	lsls	r0, r0, #1
c0de5ff2:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de5ff6:	f000 fc9f 	bl	c0de6938 <OUTLINED_FUNCTION_23>
c0de5ffa:	4631      	mov	r1, r6
c0de5ffc:	0e02      	lsrs	r2, r0, #24
c0de5ffe:	f000 fbe3 	bl	c0de67c8 <OUTLINED_FUNCTION_9>
c0de6002:	2008      	movs	r0, #8
c0de6004:	68e1      	ldr	r1, [r4, #12]
c0de6006:	77b0      	strb	r0, [r6, #30]
c0de6008:	f000 fdf2 	bl	c0de6bf0 <OUTLINED_FUNCTION_61>
c0de600c:	2000      	movs	r0, #0
c0de600e:	71c8      	strb	r0, [r1, #7]
c0de6010:	2060      	movs	r0, #96	@ 0x60
c0de6012:	7188      	strb	r0, [r1, #6]
c0de6014:	7868      	ldrb	r0, [r5, #1]
c0de6016:	b160      	cbz	r0, c0de6032 <nbgl_layoutAddHeader+0x42e>
c0de6018:	f000 fca1 	bl	c0de695e <OUTLINED_FUNCTION_25>
c0de601c:	68e1      	ldr	r1, [r4, #12]
c0de601e:	f000 fb8a 	bl	c0de6736 <OUTLINED_FUNCTION_4>
c0de6022:	2103      	movs	r1, #3
c0de6024:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de6028:	2108      	movs	r1, #8
c0de602a:	7581      	strb	r1, [r0, #22]
c0de602c:	68e1      	ldr	r1, [r4, #12]
c0de602e:	f000 fddf 	bl	c0de6bf0 <OUTLINED_FUNCTION_61>
c0de6032:	68a0      	ldr	r0, [r4, #8]
c0de6034:	6001      	str	r1, [r0, #0]
c0de6036:	68e0      	ldr	r0, [r4, #12]
c0de6038:	f8d4 10a0 	ldr.w	r1, [r4, #160]	@ 0xa0
c0de603c:	4602      	mov	r2, r0
c0de603e:	f812 3f06 	ldrb.w	r3, [r2, #6]!
c0de6042:	7856      	ldrb	r6, [r2, #1]
c0de6044:	f801 0f12 	strb.w	r0, [r1, #18]!
c0de6048:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de604c:	f811 6d0c 	ldrb.w	r6, [r1, #-12]!
c0de6050:	784f      	ldrb	r7, [r1, #1]
c0de6052:	ea46 2607 	orr.w	r6, r6, r7, lsl #8
c0de6056:	1af3      	subs	r3, r6, r3
c0de6058:	700b      	strb	r3, [r1, #0]
c0de605a:	0a1b      	lsrs	r3, r3, #8
c0de605c:	704b      	strb	r3, [r1, #1]
c0de605e:	782b      	ldrb	r3, [r5, #0]
c0de6060:	f884 30aa 	strb.w	r3, [r4, #170]	@ 0xaa
c0de6064:	0e03      	lsrs	r3, r0, #24
c0de6066:	73cb      	strb	r3, [r1, #15]
c0de6068:	0c03      	lsrs	r3, r0, #16
c0de606a:	0a00      	lsrs	r0, r0, #8
c0de606c:	7348      	strb	r0, [r1, #13]
c0de606e:	2007      	movs	r0, #7
c0de6070:	738b      	strb	r3, [r1, #14]
c0de6072:	7408      	strb	r0, [r1, #16]
c0de6074:	7810      	ldrb	r0, [r2, #0]
c0de6076:	7851      	ldrb	r1, [r2, #1]
c0de6078:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de607c:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de6080:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de6084:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de6088:	00006081 	.word	0x00006081

c0de608c <nbgl_layoutAddProgressIndicator>:
c0de608c:	b51f      	push	{r0, r1, r2, r3, r4, lr}
c0de608e:	9c07      	ldr	r4, [sp, #28]
c0de6090:	f88d 1008 	strb.w	r1, [sp, #8]
c0de6094:	2100      	movs	r1, #0
c0de6096:	f88d 300a 	strb.w	r3, [sp, #10]
c0de609a:	f88d 2009 	strb.w	r2, [sp, #9]
c0de609e:	9101      	str	r1, [sp, #4]
c0de60a0:	2103      	movs	r1, #3
c0de60a2:	f88d 400d 	strb.w	r4, [sp, #13]
c0de60a6:	24ff      	movs	r4, #255	@ 0xff
c0de60a8:	f8ad 1000 	strh.w	r1, [sp]
c0de60ac:	4669      	mov	r1, sp
c0de60ae:	f88d 400c 	strb.w	r4, [sp, #12]
c0de60b2:	9c06      	ldr	r4, [sp, #24]
c0de60b4:	f88d 400b 	strb.w	r4, [sp, #11]
c0de60b8:	f7ff fda4 	bl	c0de5c04 <nbgl_layoutAddHeader>
c0de60bc:	b004      	add	sp, #16
c0de60be:	bd10      	pop	{r4, pc}

c0de60c0 <nbgl_layoutAddSpinner>:
c0de60c0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de60c4:	b088      	sub	sp, #32
c0de60c6:	2800      	cmp	r0, #0
c0de60c8:	f000 811a 	beq.w	c0de6300 <nbgl_layoutAddSpinner+0x240>
c0de60cc:	9101      	str	r1, [sp, #4]
c0de60ce:	f000 fdf1 	bl	c0de6cb4 <OUTLINED_FUNCTION_79>
c0de60d2:	469a      	mov	sl, r3
c0de60d4:	2601      	movs	r6, #1
c0de60d6:	4f8d      	ldr	r7, [pc, #564]	@ (c0de630c <nbgl_layoutAddSpinner+0x24c>)
c0de60d8:	9203      	str	r2, [sp, #12]
c0de60da:	08c1      	lsrs	r1, r0, #3
c0de60dc:	2001      	movs	r0, #1
c0de60de:	447f      	add	r7, pc
c0de60e0:	47b8      	blx	r7
c0de60e2:	4683      	mov	fp, r0
c0de60e4:	2003      	movs	r0, #3
c0de60e6:	463d      	mov	r5, r7
c0de60e8:	f88b 0020 	strb.w	r0, [fp, #32]
c0de60ec:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de60f0:	08c1      	lsrs	r1, r0, #3
c0de60f2:	2003      	movs	r0, #3
c0de60f4:	f004 fc24 	bl	c0dea940 <nbgl_containerPoolGet>
c0de60f8:	2100      	movs	r1, #0
c0de60fa:	f88b 6005 	strb.w	r6, [fp, #5]
c0de60fe:	465e      	mov	r6, fp
c0de6100:	270d      	movs	r7, #13
c0de6102:	f88b 101f 	strb.w	r1, [fp, #31]
c0de6106:	21a0      	movs	r1, #160	@ 0xa0
c0de6108:	f806 0f22 	strb.w	r0, [r6, #34]!
c0de610c:	f88b 1004 	strb.w	r1, [fp, #4]
c0de6110:	2105      	movs	r1, #5
c0de6112:	f88b 1016 	strb.w	r1, [fp, #22]
c0de6116:	0e01      	lsrs	r1, r0, #24
c0de6118:	f000 fd65 	bl	c0de6be6 <OUTLINED_FUNCTION_60>
c0de611c:	f88b 0023 	strb.w	r0, [fp, #35]	@ 0x23
c0de6120:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de6124:	08c1      	lsrs	r1, r0, #3
c0de6126:	200d      	movs	r0, #13
c0de6128:	47a8      	blx	r5
c0de612a:	4680      	mov	r8, r0
c0de612c:	f880 a01f 	strb.w	sl, [r0, #31]
c0de6130:	2002      	movs	r0, #2
c0de6132:	7831      	ldrb	r1, [r6, #0]
c0de6134:	78b2      	ldrb	r2, [r6, #2]
c0de6136:	78f3      	ldrb	r3, [r6, #3]
c0de6138:	f8cd a008 	str.w	sl, [sp, #8]
c0de613c:	46da      	mov	sl, fp
c0de613e:	9404      	str	r4, [sp, #16]
c0de6140:	f888 0016 	strb.w	r0, [r8, #22]
c0de6144:	f89b 0023 	ldrb.w	r0, [fp, #35]	@ 0x23
c0de6148:	f000 fcf7 	bl	c0de6b3a <OUTLINED_FUNCTION_48>
c0de614c:	f8c0 8000 	str.w	r8, [r0]
c0de6150:	f81a 0f06 	ldrb.w	r0, [sl, #6]!
c0de6154:	f89a 1001 	ldrb.w	r1, [sl, #1]
c0de6158:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de615c:	3030      	adds	r0, #48	@ 0x30
c0de615e:	f88a 0000 	strb.w	r0, [sl]
c0de6162:	0a00      	lsrs	r0, r0, #8
c0de6164:	f88a 0001 	strb.w	r0, [sl, #1]
c0de6168:	9804      	ldr	r0, [sp, #16]
c0de616a:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de616e:	08c1      	lsrs	r1, r0, #3
c0de6170:	2004      	movs	r0, #4
c0de6172:	47a8      	blx	r5
c0de6174:	4605      	mov	r5, r0
c0de6176:	2000      	movs	r0, #0
c0de6178:	ea4f 2418 	mov.w	r4, r8, lsr #8
c0de617c:	77e8      	strb	r0, [r5, #31]
c0de617e:	9801      	ldr	r0, [sp, #4]
c0de6180:	f004 fdba 	bl	c0deacf8 <pic>
c0de6184:	4601      	mov	r1, r0
c0de6186:	2001      	movs	r0, #1
c0de6188:	22a0      	movs	r2, #160	@ 0xa0
c0de618a:	74ec      	strb	r4, [r5, #19]
c0de618c:	462c      	mov	r4, r5
c0de618e:	7168      	strb	r0, [r5, #5]
c0de6190:	f885 0024 	strb.w	r0, [r5, #36]	@ 0x24
c0de6194:	9803      	ldr	r0, [sp, #12]
c0de6196:	712a      	strb	r2, [r5, #4]
c0de6198:	2800      	cmp	r0, #0
c0de619a:	bf08      	it	eq
c0de619c:	270b      	moveq	r7, #11
c0de619e:	f885 7022 	strb.w	r7, [r5, #34]	@ 0x22
c0de61a2:	2005      	movs	r0, #5
c0de61a4:	0e0a      	lsrs	r2, r1, #24
c0de61a6:	2301      	movs	r3, #1
c0de61a8:	f885 0020 	strb.w	r0, [r5, #32]
c0de61ac:	2008      	movs	r0, #8
c0de61ae:	75a8      	strb	r0, [r5, #22]
c0de61b0:	4628      	mov	r0, r5
c0de61b2:	f000 fb52 	bl	c0de685a <OUTLINED_FUNCTION_13>
c0de61b6:	ea4f 6218 	mov.w	r2, r8, lsr #24
c0de61ba:	f885 0027 	strb.w	r0, [r5, #39]	@ 0x27
c0de61be:	2018      	movs	r0, #24
c0de61c0:	f804 0f19 	strb.w	r0, [r4, #25]!
c0de61c4:	2000      	movs	r0, #0
c0de61c6:	7060      	strb	r0, [r4, #1]
c0de61c8:	4628      	mov	r0, r5
c0de61ca:	f800 8f12 	strb.w	r8, [r0, #18]!
c0de61ce:	70c2      	strb	r2, [r0, #3]
c0de61d0:	ea4f 4218 	mov.w	r2, r8, lsr #16
c0de61d4:	f8dd 8010 	ldr.w	r8, [sp, #16]
c0de61d8:	7082      	strb	r2, [r0, #2]
c0de61da:	4638      	mov	r0, r7
c0de61dc:	f000 fcc1 	bl	c0de6b62 <OUTLINED_FUNCTION_51>
c0de61e0:	2100      	movs	r1, #0
c0de61e2:	71a8      	strb	r0, [r5, #6]
c0de61e4:	f885 1021 	strb.w	r1, [r5, #33]	@ 0x21
c0de61e8:	0a01      	lsrs	r1, r0, #8
c0de61ea:	7832      	ldrb	r2, [r6, #0]
c0de61ec:	78b3      	ldrb	r3, [r6, #2]
c0de61ee:	78f6      	ldrb	r6, [r6, #3]
c0de61f0:	71e9      	strb	r1, [r5, #7]
c0de61f2:	f89b 1023 	ldrb.w	r1, [fp, #35]	@ 0x23
c0de61f6:	f000 fd53 	bl	c0de6ca0 <OUTLINED_FUNCTION_76>
c0de61fa:	7862      	ldrb	r2, [r4, #1]
c0de61fc:	604d      	str	r5, [r1, #4]
c0de61fe:	7821      	ldrb	r1, [r4, #0]
c0de6200:	9c03      	ldr	r4, [sp, #12]
c0de6202:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de6206:	f89a 2001 	ldrb.w	r2, [sl, #1]
c0de620a:	4408      	add	r0, r1
c0de620c:	f89a 1000 	ldrb.w	r1, [sl]
c0de6210:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de6214:	4408      	add	r0, r1
c0de6216:	f88a 0000 	strb.w	r0, [sl]
c0de621a:	0a00      	lsrs	r0, r0, #8
c0de621c:	2c00      	cmp	r4, #0
c0de621e:	f88a 0001 	strb.w	r0, [sl, #1]
c0de6222:	d051      	beq.n	c0de62c8 <nbgl_layoutAddSpinner+0x208>
c0de6224:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de6228:	f000 fa54 	bl	c0de66d4 <OUTLINED_FUNCTION_0>
c0de622c:	2600      	movs	r6, #0
c0de622e:	4607      	mov	r7, r0
c0de6230:	77c6      	strb	r6, [r0, #31]
c0de6232:	4620      	mov	r0, r4
c0de6234:	f004 fd60 	bl	c0deacf8 <pic>
c0de6238:	4601      	mov	r1, r0
c0de623a:	0a28      	lsrs	r0, r5, #8
c0de623c:	22a0      	movs	r2, #160	@ 0xa0
c0de623e:	463c      	mov	r4, r7
c0de6240:	2301      	movs	r3, #1
c0de6242:	74f8      	strb	r0, [r7, #19]
c0de6244:	2001      	movs	r0, #1
c0de6246:	713a      	strb	r2, [r7, #4]
c0de6248:	0e0a      	lsrs	r2, r1, #24
c0de624a:	7178      	strb	r0, [r7, #5]
c0de624c:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de6250:	200b      	movs	r0, #11
c0de6252:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de6256:	2005      	movs	r0, #5
c0de6258:	f887 0020 	strb.w	r0, [r7, #32]
c0de625c:	2008      	movs	r0, #8
c0de625e:	75b8      	strb	r0, [r7, #22]
c0de6260:	4638      	mov	r0, r7
c0de6262:	f000 fafa 	bl	c0de685a <OUTLINED_FUNCTION_13>
c0de6266:	0e2a      	lsrs	r2, r5, #24
c0de6268:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de626c:	2010      	movs	r0, #16
c0de626e:	f804 0f19 	strb.w	r0, [r4, #25]!
c0de6272:	4638      	mov	r0, r7
c0de6274:	f800 5f12 	strb.w	r5, [r0, #18]!
c0de6278:	7066      	strb	r6, [r4, #1]
c0de627a:	70c2      	strb	r2, [r0, #3]
c0de627c:	0c2a      	lsrs	r2, r5, #16
c0de627e:	7082      	strb	r2, [r0, #2]
c0de6280:	200b      	movs	r0, #11
c0de6282:	f000 fc6e 	bl	c0de6b62 <OUTLINED_FUNCTION_51>
c0de6286:	0a01      	lsrs	r1, r0, #8
c0de6288:	7862      	ldrb	r2, [r4, #1]
c0de628a:	71b8      	strb	r0, [r7, #6]
c0de628c:	f887 6021 	strb.w	r6, [r7, #33]	@ 0x21
c0de6290:	71f9      	strb	r1, [r7, #7]
c0de6292:	7821      	ldrb	r1, [r4, #0]
c0de6294:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de6298:	eb01 0c00 	add.w	ip, r1, r0
c0de629c:	4659      	mov	r1, fp
c0de629e:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de62a2:	f811 3d1c 	ldrb.w	r3, [r1, #-28]!
c0de62a6:	784c      	ldrb	r4, [r1, #1]
c0de62a8:	7f4d      	ldrb	r5, [r1, #29]
c0de62aa:	7f8e      	ldrb	r6, [r1, #30]
c0de62ac:	7fc8      	ldrb	r0, [r1, #31]
c0de62ae:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de62b2:	ea42 2205 	orr.w	r2, r2, r5, lsl #8
c0de62b6:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de62ba:	4463      	add	r3, ip
c0de62bc:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de62c0:	700b      	strb	r3, [r1, #0]
c0de62c2:	6087      	str	r7, [r0, #8]
c0de62c4:	0a18      	lsrs	r0, r3, #8
c0de62c6:	7048      	strb	r0, [r1, #1]
c0de62c8:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de62cc:	f000 fa95 	bl	c0de67fa <OUTLINED_FUNCTION_10>
c0de62d0:	f840 b022 	str.w	fp, [r0, r2, lsl #2]
c0de62d4:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de62d8:	f000 fa00 	bl	c0de66dc <OUTLINED_FUNCTION_1>
c0de62dc:	9802      	ldr	r0, [sp, #8]
c0de62de:	28ff      	cmp	r0, #255	@ 0xff
c0de62e0:	d00c      	beq.n	c0de62fc <nbgl_layoutAddSpinner+0x23c>
c0de62e2:	f44f 70c8 	mov.w	r0, #400	@ 0x190
c0de62e6:	e9cd 0006 	strd	r0, r0, [sp, #24]
c0de62ea:	4809      	ldr	r0, [pc, #36]	@ (c0de6310 <nbgl_layoutAddSpinner+0x250>)
c0de62ec:	4478      	add	r0, pc
c0de62ee:	9005      	str	r0, [sp, #20]
c0de62f0:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de62f4:	a905      	add	r1, sp, #20
c0de62f6:	08c0      	lsrs	r0, r0, #3
c0de62f8:	f004 fb13 	bl	c0dea922 <nbgl_screenUpdateTicker>
c0de62fc:	2000      	movs	r0, #0
c0de62fe:	e001      	b.n	c0de6304 <nbgl_layoutAddSpinner+0x244>
c0de6300:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de6304:	b008      	add	sp, #32
c0de6306:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de630a:	bf00      	nop
c0de630c:	00004855 	.word	0x00004855
c0de6310:	00000025 	.word	0x00000025

c0de6314 <spinnerTickerCallback>:
c0de6314:	b570      	push	{r4, r5, r6, lr}
c0de6316:	4819      	ldr	r0, [pc, #100]	@ (c0de637c <spinnerTickerCallback+0x68>)
c0de6318:	4448      	add	r0, r9
c0de631a:	6840      	ldr	r0, [r0, #4]
c0de631c:	b120      	cbz	r0, c0de6328 <spinnerTickerCallback+0x14>
c0de631e:	f890 10ae 	ldrb.w	r1, [r0, #174]	@ 0xae
c0de6322:	0209      	lsls	r1, r1, #8
c0de6324:	0449      	lsls	r1, r1, #17
c0de6326:	d400      	bmi.n	c0de632a <spinnerTickerCallback+0x16>
c0de6328:	bd70      	pop	{r4, r5, r6, pc}
c0de632a:	f8d0 10a0 	ldr.w	r1, [r0, #160]	@ 0xa0
c0de632e:	2300      	movs	r3, #0
c0de6330:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de6334:	429a      	cmp	r2, r3
c0de6336:	d0f7      	beq.n	c0de6328 <spinnerTickerCallback+0x14>
c0de6338:	4608      	mov	r0, r1
c0de633a:	f000 fbdf 	bl	c0de6afc <OUTLINED_FUNCTION_44>
c0de633e:	f850 0023 	ldr.w	r0, [r0, r3, lsl #2]
c0de6342:	7ec4      	ldrb	r4, [r0, #27]
c0de6344:	2c01      	cmp	r4, #1
c0de6346:	d108      	bne.n	c0de635a <spinnerTickerCallback+0x46>
c0de6348:	f890 4020 	ldrb.w	r4, [r0, #32]
c0de634c:	b12c      	cbz	r4, c0de635a <spinnerTickerCallback+0x46>
c0de634e:	f000 fbd5 	bl	c0de6afc <OUTLINED_FUNCTION_44>
c0de6352:	6800      	ldr	r0, [r0, #0]
c0de6354:	7ec4      	ldrb	r4, [r0, #27]
c0de6356:	2c0d      	cmp	r4, #13
c0de6358:	d001      	beq.n	c0de635e <spinnerTickerCallback+0x4a>
c0de635a:	3301      	adds	r3, #1
c0de635c:	e7ea      	b.n	c0de6334 <spinnerTickerCallback+0x20>
c0de635e:	7fc1      	ldrb	r1, [r0, #31]
c0de6360:	3101      	adds	r1, #1
c0de6362:	b2ca      	uxtb	r2, r1
c0de6364:	3a04      	subs	r2, #4
c0de6366:	bf18      	it	ne
c0de6368:	460a      	movne	r2, r1
c0de636a:	77c2      	strb	r2, [r0, #31]
c0de636c:	f004 fabb 	bl	c0dea8e6 <nbgl_objDraw>
c0de6370:	2004      	movs	r0, #4
c0de6372:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de6376:	f004 baa7 	b.w	c0dea8c8 <nbgl_refreshSpecial>
c0de637a:	bf00      	nop
c0de637c:	00001948 	.word	0x00001948

c0de6380 <nbgl_layoutUpdateSpinner>:
c0de6380:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de6384:	2800      	cmp	r0, #0
c0de6386:	f000 809a 	beq.w	c0de64be <nbgl_layoutUpdateSpinner+0x13e>
c0de638a:	f8d0 00a0 	ldr.w	r0, [r0, #160]	@ 0xa0
c0de638e:	460e      	mov	r6, r1
c0de6390:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de6394:	2900      	cmp	r1, #0
c0de6396:	f000 8092 	beq.w	c0de64be <nbgl_layoutUpdateSpinner+0x13e>
c0de639a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de639e:	4615      	mov	r5, r2
c0de63a0:	f000 fc42 	bl	c0de6c28 <OUTLINED_FUNCTION_66>
c0de63a4:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de63a8:	6807      	ldr	r7, [r0, #0]
c0de63aa:	7ef8      	ldrb	r0, [r7, #27]
c0de63ac:	2801      	cmp	r0, #1
c0de63ae:	f040 8086 	bne.w	c0de64be <nbgl_layoutUpdateSpinner+0x13e>
c0de63b2:	f897 0020 	ldrb.w	r0, [r7, #32]
c0de63b6:	2802      	cmp	r0, #2
c0de63b8:	f0c0 8081 	bcc.w	c0de64be <nbgl_layoutUpdateSpinner+0x13e>
c0de63bc:	4638      	mov	r0, r7
c0de63be:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de63c2:	f000 fc31 	bl	c0de6c28 <OUTLINED_FUNCTION_66>
c0de63c6:	ea41 4100 	orr.w	r1, r1, r0, lsl #16
c0de63ca:	6808      	ldr	r0, [r1, #0]
c0de63cc:	7ec2      	ldrb	r2, [r0, #27]
c0de63ce:	2a0d      	cmp	r2, #13
c0de63d0:	d175      	bne.n	c0de64be <nbgl_layoutUpdateSpinner+0x13e>
c0de63d2:	7fc2      	ldrb	r2, [r0, #31]
c0de63d4:	429a      	cmp	r2, r3
c0de63d6:	d101      	bne.n	c0de63dc <nbgl_layoutUpdateSpinner+0x5c>
c0de63d8:	2400      	movs	r4, #0
c0de63da:	e008      	b.n	c0de63ee <nbgl_layoutUpdateSpinner+0x6e>
c0de63dc:	77c3      	strb	r3, [r0, #31]
c0de63de:	f004 fa82 	bl	c0dea8e6 <nbgl_objDraw>
c0de63e2:	4638      	mov	r0, r7
c0de63e4:	2401      	movs	r4, #1
c0de63e6:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de63ea:	f000 fbc8 	bl	c0de6b7e <OUTLINED_FUNCTION_53>
c0de63ee:	f8d1 b004 	ldr.w	fp, [r1, #4]
c0de63f2:	f89b 001b 	ldrb.w	r0, [fp, #27]
c0de63f6:	2804      	cmp	r0, #4
c0de63f8:	d161      	bne.n	c0de64be <nbgl_layoutUpdateSpinner+0x13e>
c0de63fa:	f000 fc22 	bl	c0de6c42 <OUTLINED_FUNCTION_68>
c0de63fe:	4606      	mov	r6, r0
c0de6400:	f004 ff08 	bl	c0deb214 <strlen>
c0de6404:	4680      	mov	r8, r0
c0de6406:	4658      	mov	r0, fp
c0de6408:	f810 1f26 	ldrb.w	r1, [r0, #38]!
c0de640c:	f000 fa2c 	bl	c0de6868 <OUTLINED_FUNCTION_14>
c0de6410:	ea41 4a00 	orr.w	sl, r1, r0, lsl #16
c0de6414:	4650      	mov	r0, sl
c0de6416:	f004 fefd 	bl	c0deb214 <strlen>
c0de641a:	4580      	cmp	r8, r0
c0de641c:	d105      	bne.n	c0de642a <nbgl_layoutUpdateSpinner+0xaa>
c0de641e:	4650      	mov	r0, sl
c0de6420:	4631      	mov	r1, r6
c0de6422:	4642      	mov	r2, r8
c0de6424:	f004 fe9e 	bl	c0deb164 <memcmp>
c0de6428:	b168      	cbz	r0, c0de6446 <nbgl_layoutUpdateSpinner+0xc6>
c0de642a:	4658      	mov	r0, fp
c0de642c:	0e31      	lsrs	r1, r6, #24
c0de642e:	f800 6f26 	strb.w	r6, [r0, #38]!
c0de6432:	70c1      	strb	r1, [r0, #3]
c0de6434:	0c31      	lsrs	r1, r6, #16
c0de6436:	7081      	strb	r1, [r0, #2]
c0de6438:	0a30      	lsrs	r0, r6, #8
c0de643a:	f88b 0027 	strb.w	r0, [fp, #39]	@ 0x27
c0de643e:	4658      	mov	r0, fp
c0de6440:	f004 fa51 	bl	c0dea8e6 <nbgl_objDraw>
c0de6444:	2402      	movs	r4, #2
c0de6446:	b3e5      	cbz	r5, c0de64c2 <nbgl_layoutUpdateSpinner+0x142>
c0de6448:	f897 0020 	ldrb.w	r0, [r7, #32]
c0de644c:	2803      	cmp	r0, #3
c0de644e:	d136      	bne.n	c0de64be <nbgl_layoutUpdateSpinner+0x13e>
c0de6450:	f817 0f22 	ldrb.w	r0, [r7, #34]!
c0de6454:	7879      	ldrb	r1, [r7, #1]
c0de6456:	78ba      	ldrb	r2, [r7, #2]
c0de6458:	78fb      	ldrb	r3, [r7, #3]
c0de645a:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de645e:	ea42 2103 	orr.w	r1, r2, r3, lsl #8
c0de6462:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de6466:	6886      	ldr	r6, [r0, #8]
c0de6468:	7ef0      	ldrb	r0, [r6, #27]
c0de646a:	2804      	cmp	r0, #4
c0de646c:	d127      	bne.n	c0de64be <nbgl_layoutUpdateSpinner+0x13e>
c0de646e:	4628      	mov	r0, r5
c0de6470:	f004 fc42 	bl	c0deacf8 <pic>
c0de6474:	4605      	mov	r5, r0
c0de6476:	f004 fecd 	bl	c0deb214 <strlen>
c0de647a:	4680      	mov	r8, r0
c0de647c:	4630      	mov	r0, r6
c0de647e:	f810 1f26 	ldrb.w	r1, [r0, #38]!
c0de6482:	f000 f9f1 	bl	c0de6868 <OUTLINED_FUNCTION_14>
c0de6486:	ea41 4700 	orr.w	r7, r1, r0, lsl #16
c0de648a:	4638      	mov	r0, r7
c0de648c:	f004 fec2 	bl	c0deb214 <strlen>
c0de6490:	4580      	cmp	r8, r0
c0de6492:	d105      	bne.n	c0de64a0 <nbgl_layoutUpdateSpinner+0x120>
c0de6494:	4638      	mov	r0, r7
c0de6496:	4629      	mov	r1, r5
c0de6498:	4642      	mov	r2, r8
c0de649a:	f004 fe63 	bl	c0deb164 <memcmp>
c0de649e:	b180      	cbz	r0, c0de64c2 <nbgl_layoutUpdateSpinner+0x142>
c0de64a0:	4630      	mov	r0, r6
c0de64a2:	0e29      	lsrs	r1, r5, #24
c0de64a4:	f800 5f26 	strb.w	r5, [r0, #38]!
c0de64a8:	70c1      	strb	r1, [r0, #3]
c0de64aa:	0c29      	lsrs	r1, r5, #16
c0de64ac:	7081      	strb	r1, [r0, #2]
c0de64ae:	0a28      	lsrs	r0, r5, #8
c0de64b0:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de64b4:	4630      	mov	r0, r6
c0de64b6:	f004 fa16 	bl	c0dea8e6 <nbgl_objDraw>
c0de64ba:	2402      	movs	r4, #2
c0de64bc:	e001      	b.n	c0de64c2 <nbgl_layoutUpdateSpinner+0x142>
c0de64be:	f04f 34ff 	mov.w	r4, #4294967295	@ 0xffffffff
c0de64c2:	4620      	mov	r0, r4
c0de64c4:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de64c8 <nbgl_layoutDraw>:
c0de64c8:	b348      	cbz	r0, c0de651e <nbgl_layoutDraw+0x56>
c0de64ca:	b570      	push	{r4, r5, r6, lr}
c0de64cc:	4604      	mov	r4, r0
c0de64ce:	6980      	ldr	r0, [r0, #24]
c0de64d0:	b128      	cbz	r0, c0de64de <nbgl_layoutDraw+0x16>
c0de64d2:	f000 fa1f 	bl	c0de6914 <OUTLINED_FUNCTION_22>
c0de64d6:	f8d4 00a0 	ldr.w	r0, [r4, #160]	@ 0xa0
c0de64da:	f000 f8ff 	bl	c0de66dc <OUTLINED_FUNCTION_1>
c0de64de:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de64e2:	f894 10ae 	ldrb.w	r1, [r4, #174]	@ 0xae
c0de64e6:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de64ea:	0781      	lsls	r1, r0, #30
c0de64ec:	d513      	bpl.n	c0de6516 <nbgl_layoutDraw+0x4e>
c0de64ee:	b2c0      	uxtb	r0, r0
c0de64f0:	f000 fb88 	bl	c0de6c04 <OUTLINED_FUNCTION_63>
c0de64f4:	2102      	movs	r1, #2
c0de64f6:	2301      	movs	r3, #1
c0de64f8:	2258      	movs	r2, #88	@ 0x58
c0de64fa:	7182      	strb	r2, [r0, #6]
c0de64fc:	71c1      	strb	r1, [r0, #7]
c0de64fe:	f880 1020 	strb.w	r1, [r0, #32]
c0de6502:	2104      	movs	r1, #4
c0de6504:	7103      	strb	r3, [r0, #4]
c0de6506:	2200      	movs	r2, #0
c0de6508:	f880 3021 	strb.w	r3, [r0, #33]	@ 0x21
c0de650c:	7581      	strb	r1, [r0, #22]
c0de650e:	68a1      	ldr	r1, [r4, #8]
c0de6510:	7142      	strb	r2, [r0, #5]
c0de6512:	77c2      	strb	r2, [r0, #31]
c0de6514:	6148      	str	r0, [r1, #20]
c0de6516:	f004 f9fa 	bl	c0dea90e <nbgl_screenRedraw>
c0de651a:	2000      	movs	r0, #0
c0de651c:	bd70      	pop	{r4, r5, r6, pc}
c0de651e:	f000 ba95 	b.w	c0de6a4c <OUTLINED_FUNCTION_35>
	...

c0de6524 <nbgl_layoutRelease>:
c0de6524:	b510      	push	{r4, lr}
c0de6526:	b138      	cbz	r0, c0de6538 <nbgl_layoutRelease+0x14>
c0de6528:	f000 fbc4 	bl	c0de6cb4 <OUTLINED_FUNCTION_79>
c0de652c:	f894 10ae 	ldrb.w	r1, [r4, #174]	@ 0xae
c0de6530:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de6534:	0441      	lsls	r1, r0, #17
c0de6536:	d402      	bmi.n	c0de653e <nbgl_layoutRelease+0x1a>
c0de6538:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de653c:	bd10      	pop	{r4, pc}
c0de653e:	07c1      	lsls	r1, r0, #31
c0de6540:	d014      	beq.n	c0de656c <nbgl_layoutRelease+0x48>
c0de6542:	b2c0      	uxtb	r0, r0
c0de6544:	08c0      	lsrs	r0, r0, #3
c0de6546:	f004 f9e7 	bl	c0dea918 <nbgl_screenPop>
c0de654a:	480d      	ldr	r0, [pc, #52]	@ (c0de6580 <nbgl_layoutRelease+0x5c>)
c0de654c:	eb09 0100 	add.w	r1, r9, r0
c0de6550:	6849      	ldr	r1, [r1, #4]
c0de6552:	42a1      	cmp	r1, r4
c0de6554:	d005      	beq.n	c0de6562 <nbgl_layoutRelease+0x3e>
c0de6556:	e9d4 0100 	ldrd	r0, r1, [r4]
c0de655a:	6008      	str	r0, [r1, #0]
c0de655c:	6820      	ldr	r0, [r4, #0]
c0de655e:	6041      	str	r1, [r0, #4]
c0de6560:	e004      	b.n	c0de656c <nbgl_layoutRelease+0x48>
c0de6562:	6861      	ldr	r1, [r4, #4]
c0de6564:	4448      	add	r0, r9
c0de6566:	6041      	str	r1, [r0, #4]
c0de6568:	2000      	movs	r0, #0
c0de656a:	6008      	str	r0, [r1, #0]
c0de656c:	f814 0fad 	ldrb.w	r0, [r4, #173]!
c0de6570:	7861      	ldrb	r1, [r4, #1]
c0de6572:	7020      	strb	r0, [r4, #0]
c0de6574:	2000      	movs	r0, #0
c0de6576:	f001 01bf 	and.w	r1, r1, #191	@ 0xbf
c0de657a:	7061      	strb	r1, [r4, #1]
c0de657c:	bd10      	pop	{r4, pc}
c0de657e:	bf00      	nop
c0de6580:	00001948 	.word	0x00001948

c0de6584 <getLayoutAndLayoutObj>:
c0de6584:	b570      	push	{r4, r5, r6, lr}
c0de6586:	4c11      	ldr	r4, [pc, #68]	@ (c0de65cc <getLayoutAndLayoutObj+0x48>)
c0de6588:	2300      	movs	r3, #0
c0de658a:	600b      	str	r3, [r1, #0]
c0de658c:	444c      	add	r4, r9
c0de658e:	6864      	ldr	r4, [r4, #4]
c0de6590:	b1d4      	cbz	r4, c0de65c8 <getLayoutAndLayoutObj+0x44>
c0de6592:	f894 30ad 	ldrb.w	r3, [r4, #173]	@ 0xad
c0de6596:	f894 50ae 	ldrb.w	r5, [r4, #174]	@ 0xae
c0de659a:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0de659e:	045d      	lsls	r5, r3, #17
c0de65a0:	d401      	bmi.n	c0de65a6 <getLayoutAndLayoutObj+0x22>
c0de65a2:	2300      	movs	r3, #0
c0de65a4:	e010      	b.n	c0de65c8 <getLayoutAndLayoutObj+0x44>
c0de65a6:	f44f 75fc 	mov.w	r5, #504	@ 0x1f8
c0de65aa:	ea05 1553 	and.w	r5, r5, r3, lsr #5
c0de65ae:	2300      	movs	r3, #0
c0de65b0:	429d      	cmp	r5, r3
c0de65b2:	d0f6      	beq.n	c0de65a2 <getLayoutAndLayoutObj+0x1e>
c0de65b4:	18e6      	adds	r6, r4, r3
c0de65b6:	3308      	adds	r3, #8
c0de65b8:	6a36      	ldr	r6, [r6, #32]
c0de65ba:	4286      	cmp	r6, r0
c0de65bc:	d1f8      	bne.n	c0de65b0 <getLayoutAndLayoutObj+0x2c>
c0de65be:	18e0      	adds	r0, r4, r3
c0de65c0:	2301      	movs	r3, #1
c0de65c2:	600c      	str	r4, [r1, #0]
c0de65c4:	3018      	adds	r0, #24
c0de65c6:	6010      	str	r0, [r2, #0]
c0de65c8:	4618      	mov	r0, r3
c0de65ca:	bd70      	pop	{r4, r5, r6, pc}
c0de65cc:	00001948 	.word	0x00001948

c0de65d0 <animTickerCallback>:
c0de65d0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de65d2:	483f      	ldr	r0, [pc, #252]	@ (c0de66d0 <animTickerCallback+0x100>)
c0de65d4:	4448      	add	r0, r9
c0de65d6:	6842      	ldr	r2, [r0, #4]
c0de65d8:	b3b2      	cbz	r2, c0de6648 <animTickerCallback+0x78>
c0de65da:	f892 00ad 	ldrb.w	r0, [r2, #173]	@ 0xad
c0de65de:	f892 10ae 	ldrb.w	r1, [r2, #174]	@ 0xae
c0de65e2:	ea40 2e01 	orr.w	lr, r0, r1, lsl #8
c0de65e6:	ea5f 404e 	movs.w	r0, lr, lsl #17
c0de65ea:	d52d      	bpl.n	c0de6648 <animTickerCallback+0x78>
c0de65ec:	f8d2 c0a4 	ldr.w	ip, [r2, #164]	@ 0xa4
c0de65f0:	f1bc 0f00 	cmp.w	ip, #0
c0de65f4:	d028      	beq.n	c0de6648 <animTickerCallback+0x78>
c0de65f6:	f8d2 40a0 	ldr.w	r4, [r2, #160]	@ 0xa0
c0de65fa:	2600      	movs	r6, #0
c0de65fc:	f894 5020 	ldrb.w	r5, [r4, #32]
c0de6600:	42b5      	cmp	r5, r6
c0de6602:	d021      	beq.n	c0de6648 <animTickerCallback+0x78>
c0de6604:	4620      	mov	r0, r4
c0de6606:	f810 7f22 	ldrb.w	r7, [r0, #34]!
c0de660a:	7841      	ldrb	r1, [r0, #1]
c0de660c:	7883      	ldrb	r3, [r0, #2]
c0de660e:	78c0      	ldrb	r0, [r0, #3]
c0de6610:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de6614:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de6618:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de661c:	f850 0026 	ldr.w	r0, [r0, r6, lsl #2]
c0de6620:	7ec1      	ldrb	r1, [r0, #27]
c0de6622:	2901      	cmp	r1, #1
c0de6624:	d10e      	bne.n	c0de6644 <animTickerCallback+0x74>
c0de6626:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de662a:	7843      	ldrb	r3, [r0, #1]
c0de662c:	7887      	ldrb	r7, [r0, #2]
c0de662e:	78c0      	ldrb	r0, [r0, #3]
c0de6630:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de6634:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de6638:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de663c:	6840      	ldr	r0, [r0, #4]
c0de663e:	7ec1      	ldrb	r1, [r0, #27]
c0de6640:	2902      	cmp	r1, #2
c0de6642:	d002      	beq.n	c0de664a <animTickerCallback+0x7a>
c0de6644:	3601      	adds	r6, #1
c0de6646:	e7db      	b.n	c0de6600 <animTickerCallback+0x30>
c0de6648:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de664a:	f89c 1005 	ldrb.w	r1, [ip, #5]
c0de664e:	b171      	cbz	r1, c0de666e <animTickerCallback+0x9e>
c0de6650:	f892 40af 	ldrb.w	r4, [r2, #175]	@ 0xaf
c0de6654:	ea5f 714e 	movs.w	r1, lr, lsl #29
c0de6658:	d504      	bpl.n	c0de6664 <animTickerCallback+0x94>
c0de665a:	f89c 1004 	ldrb.w	r1, [ip, #4]
c0de665e:	3901      	subs	r1, #1
c0de6660:	42a1      	cmp	r1, r4
c0de6662:	dd0e      	ble.n	c0de6682 <animTickerCallback+0xb2>
c0de6664:	b9ac      	cbnz	r4, c0de6692 <animTickerCallback+0xc2>
c0de6666:	f04e 0e04 	orr.w	lr, lr, #4
c0de666a:	2400      	movs	r4, #0
c0de666c:	e00b      	b.n	c0de6686 <animTickerCallback+0xb6>
c0de666e:	f89c 1004 	ldrb.w	r1, [ip, #4]
c0de6672:	f892 30af 	ldrb.w	r3, [r2, #175]	@ 0xaf
c0de6676:	3901      	subs	r1, #1
c0de6678:	4299      	cmp	r1, r3
c0de667a:	bf14      	ite	ne
c0de667c:	3301      	addne	r3, #1
c0de667e:	2300      	moveq	r3, #0
c0de6680:	e00c      	b.n	c0de669c <animTickerCallback+0xcc>
c0de6682:	f02e 0e04 	bic.w	lr, lr, #4
c0de6686:	ea4f 211e 	mov.w	r1, lr, lsr #8
c0de668a:	f882 e0ad 	strb.w	lr, [r2, #173]	@ 0xad
c0de668e:	f882 10ae 	strb.w	r1, [r2, #174]	@ 0xae
c0de6692:	ea5f 714e 	movs.w	r1, lr, lsl #29
c0de6696:	bf54      	ite	pl
c0de6698:	1e63      	subpl	r3, r4, #1
c0de669a:	1c63      	addmi	r3, r4, #1
c0de669c:	f882 30af 	strb.w	r3, [r2, #175]	@ 0xaf
c0de66a0:	f8dc 2000 	ldr.w	r2, [ip]
c0de66a4:	b2d9      	uxtb	r1, r3
c0de66a6:	f852 1021 	ldr.w	r1, [r2, r1, lsl #2]
c0de66aa:	4602      	mov	r2, r0
c0de66ac:	f802 1f21 	strb.w	r1, [r2, #33]!
c0de66b0:	0e0b      	lsrs	r3, r1, #24
c0de66b2:	70d3      	strb	r3, [r2, #3]
c0de66b4:	0c0b      	lsrs	r3, r1, #16
c0de66b6:	0a09      	lsrs	r1, r1, #8
c0de66b8:	7093      	strb	r3, [r2, #2]
c0de66ba:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de66be:	f004 f912 	bl	c0dea8e6 <nbgl_objDraw>
c0de66c2:	2004      	movs	r0, #4
c0de66c4:	2101      	movs	r1, #1
c0de66c6:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de66ca:	f004 b902 	b.w	c0dea8d2 <nbgl_refreshSpecialWithPostRefresh>
c0de66ce:	bf00      	nop
c0de66d0:	00001948 	.word	0x00001948

c0de66d4 <OUTLINED_FUNCTION_0>:
c0de66d4:	08c1      	lsrs	r1, r0, #3
c0de66d6:	2004      	movs	r0, #4
c0de66d8:	f004 b92d 	b.w	c0dea936 <nbgl_objPoolGet>

c0de66dc <OUTLINED_FUNCTION_1>:
c0de66dc:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de66e0:	3101      	adds	r1, #1
c0de66e2:	f880 1020 	strb.w	r1, [r0, #32]
c0de66e6:	4770      	bx	lr

c0de66e8 <OUTLINED_FUNCTION_2>:
c0de66e8:	2202      	movs	r2, #2
c0de66ea:	75ba      	strb	r2, [r7, #22]
c0de66ec:	4642      	mov	r2, r8
c0de66ee:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de66f2:	7854      	ldrb	r4, [r2, #1]
c0de66f4:	7895      	ldrb	r5, [r2, #2]
c0de66f6:	78d2      	ldrb	r2, [r2, #3]
c0de66f8:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de66fc:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0de6700:	7ebc      	ldrb	r4, [r7, #26]
c0de6702:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de6706:	7e7b      	ldrb	r3, [r7, #25]
c0de6708:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de670c:	2400      	movs	r4, #0
c0de670e:	4770      	bx	lr

c0de6710 <OUTLINED_FUNCTION_3>:
c0de6710:	713a      	strb	r2, [r7, #4]
c0de6712:	0e0a      	lsrs	r2, r1, #24
c0de6714:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de6718:	2005      	movs	r0, #5
c0de671a:	f887 0020 	strb.w	r0, [r7, #32]
c0de671e:	4638      	mov	r0, r7
c0de6720:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de6724:	70c2      	strb	r2, [r0, #3]
c0de6726:	0c0a      	lsrs	r2, r1, #16
c0de6728:	7082      	strb	r2, [r0, #2]
c0de672a:	0a08      	lsrs	r0, r1, #8
c0de672c:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de6730:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de6734:	4770      	bx	lr

c0de6736 <OUTLINED_FUNCTION_4>:
c0de6736:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de673a:	784e      	ldrb	r6, [r1, #1]
c0de673c:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de6740:	788f      	ldrb	r7, [r1, #2]
c0de6742:	78c9      	ldrb	r1, [r1, #3]
c0de6744:	ea42 2206 	orr.w	r2, r2, r6, lsl #8
c0de6748:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de674c:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6750:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
c0de6754:	4770      	bx	lr

c0de6756 <OUTLINED_FUNCTION_5>:
c0de6756:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de675a:	70c2      	strb	r2, [r0, #3]
c0de675c:	0c0a      	lsrs	r2, r1, #16
c0de675e:	7082      	strb	r2, [r0, #2]
c0de6760:	0a08      	lsrs	r0, r1, #8
c0de6762:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de6766:	f885 0027 	strb.w	r0, [r5, #39]	@ 0x27
c0de676a:	200b      	movs	r0, #11
c0de676c:	f004 b8fc 	b.w	c0dea968 <nbgl_getTextHeightInWidth>

c0de6770 <OUTLINED_FUNCTION_6>:
c0de6770:	4620      	mov	r0, r4
c0de6772:	4631      	mov	r1, r6
c0de6774:	f7fc bc8c 	b.w	c0de3090 <layoutAddCallbackObj>

c0de6778 <OUTLINED_FUNCTION_7>:
c0de6778:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de677c:	70ca      	strb	r2, [r1, #3]
c0de677e:	0c02      	lsrs	r2, r0, #16
c0de6780:	0a00      	lsrs	r0, r0, #8
c0de6782:	708a      	strb	r2, [r1, #2]
c0de6784:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de6788:	68e0      	ldr	r0, [r4, #12]
c0de678a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de678e:	7843      	ldrb	r3, [r0, #1]
c0de6790:	f810 cc02 	ldrb.w	ip, [r0, #-2]
c0de6794:	7882      	ldrb	r2, [r0, #2]
c0de6796:	78c0      	ldrb	r0, [r0, #3]
c0de6798:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de679c:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de67a0:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de67a4:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de67a8:	200c      	movs	r0, #12
c0de67aa:	4770      	bx	lr

c0de67ac <OUTLINED_FUNCTION_8>:
c0de67ac:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de67b0:	784c      	ldrb	r4, [r1, #1]
c0de67b2:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de67b6:	788d      	ldrb	r5, [r1, #2]
c0de67b8:	78c9      	ldrb	r1, [r1, #3]
c0de67ba:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de67be:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de67c2:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de67c6:	4770      	bx	lr

c0de67c8 <OUTLINED_FUNCTION_9>:
c0de67c8:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de67cc:	70ca      	strb	r2, [r1, #3]
c0de67ce:	0c02      	lsrs	r2, r0, #16
c0de67d0:	0a00      	lsrs	r0, r0, #8
c0de67d2:	708a      	strb	r2, [r1, #2]
c0de67d4:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de67d8:	68e0      	ldr	r0, [r4, #12]
c0de67da:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de67de:	7843      	ldrb	r3, [r0, #1]
c0de67e0:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de67e4:	7887      	ldrb	r7, [r0, #2]
c0de67e6:	78c0      	ldrb	r0, [r0, #3]
c0de67e8:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de67ec:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de67f0:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de67f4:	f840 6022 	str.w	r6, [r0, r2, lsl #2]
c0de67f8:	4770      	bx	lr

c0de67fa <OUTLINED_FUNCTION_10>:
c0de67fa:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de67fe:	7843      	ldrb	r3, [r0, #1]
c0de6800:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de6804:	7884      	ldrb	r4, [r0, #2]
c0de6806:	78c0      	ldrb	r0, [r0, #3]
c0de6808:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de680c:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de6810:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de6814:	4770      	bx	lr

c0de6816 <OUTLINED_FUNCTION_11>:
c0de6816:	784b      	ldrb	r3, [r1, #1]
c0de6818:	788e      	ldrb	r6, [r1, #2]
c0de681a:	78c9      	ldrb	r1, [r1, #3]
c0de681c:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6820:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de6824:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6828:	4770      	bx	lr

c0de682a <OUTLINED_FUNCTION_12>:
c0de682a:	70ca      	strb	r2, [r1, #3]
c0de682c:	0c02      	lsrs	r2, r0, #16
c0de682e:	0a00      	lsrs	r0, r0, #8
c0de6830:	708a      	strb	r2, [r1, #2]
c0de6832:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de6836:	6920      	ldr	r0, [r4, #16]
c0de6838:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de683c:	7843      	ldrb	r3, [r0, #1]
c0de683e:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de6842:	7887      	ldrb	r7, [r0, #2]
c0de6844:	78c0      	ldrb	r0, [r0, #3]
c0de6846:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de684a:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de684e:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de6852:	f840 6022 	str.w	r6, [r0, r2, lsl #2]
c0de6856:	200c      	movs	r0, #12
c0de6858:	4770      	bx	lr

c0de685a <OUTLINED_FUNCTION_13>:
c0de685a:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de685e:	70c2      	strb	r2, [r0, #3]
c0de6860:	0c0a      	lsrs	r2, r1, #16
c0de6862:	7082      	strb	r2, [r0, #2]
c0de6864:	0a08      	lsrs	r0, r1, #8
c0de6866:	4770      	bx	lr

c0de6868 <OUTLINED_FUNCTION_14>:
c0de6868:	7842      	ldrb	r2, [r0, #1]
c0de686a:	7883      	ldrb	r3, [r0, #2]
c0de686c:	78c0      	ldrb	r0, [r0, #3]
c0de686e:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de6872:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de6876:	4770      	bx	lr

c0de6878 <OUTLINED_FUNCTION_15>:
c0de6878:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de687c:	70ca      	strb	r2, [r1, #3]
c0de687e:	0c02      	lsrs	r2, r0, #16
c0de6880:	0a00      	lsrs	r0, r0, #8
c0de6882:	708a      	strb	r2, [r1, #2]
c0de6884:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de6888:	6920      	ldr	r0, [r4, #16]
c0de688a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de688e:	7843      	ldrb	r3, [r0, #1]
c0de6890:	f810 cc02 	ldrb.w	ip, [r0, #-2]
c0de6894:	7882      	ldrb	r2, [r0, #2]
c0de6896:	78c0      	ldrb	r0, [r0, #3]
c0de6898:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de689c:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de68a0:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de68a4:	4770      	bx	lr

c0de68a6 <OUTLINED_FUNCTION_16>:
c0de68a6:	08c1      	lsrs	r1, r0, #3
c0de68a8:	2001      	movs	r0, #1
c0de68aa:	f004 b844 	b.w	c0dea936 <nbgl_objPoolGet>

c0de68ae <OUTLINED_FUNCTION_17>:
c0de68ae:	08c1      	lsrs	r1, r0, #3
c0de68b0:	2005      	movs	r0, #5
c0de68b2:	f004 b840 	b.w	c0dea936 <nbgl_objPoolGet>

c0de68b6 <OUTLINED_FUNCTION_18>:
c0de68b6:	6920      	ldr	r0, [r4, #16]
c0de68b8:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de68bc:	7843      	ldrb	r3, [r0, #1]
c0de68be:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de68c2:	7887      	ldrb	r7, [r0, #2]
c0de68c4:	78c0      	ldrb	r0, [r0, #3]
c0de68c6:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de68ca:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de68ce:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de68d2:	f840 6022 	str.w	r6, [r0, r2, lsl #2]
c0de68d6:	200c      	movs	r0, #12
c0de68d8:	f886 801c 	strb.w	r8, [r6, #28]
c0de68dc:	4770      	bx	lr

c0de68de <OUTLINED_FUNCTION_19>:
c0de68de:	0a39      	lsrs	r1, r7, #8
c0de68e0:	0e02      	lsrs	r2, r0, #24
c0de68e2:	74e9      	strb	r1, [r5, #19]
c0de68e4:	4629      	mov	r1, r5
c0de68e6:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de68ea:	70ca      	strb	r2, [r1, #3]
c0de68ec:	0c02      	lsrs	r2, r0, #16
c0de68ee:	0a00      	lsrs	r0, r0, #8
c0de68f0:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de68f4:	4628      	mov	r0, r5
c0de68f6:	708a      	strb	r2, [r1, #2]
c0de68f8:	0e3a      	lsrs	r2, r7, #24
c0de68fa:	f800 7f12 	strb.w	r7, [r0, #18]!
c0de68fe:	70c2      	strb	r2, [r0, #3]
c0de6900:	0c3a      	lsrs	r2, r7, #16
c0de6902:	7082      	strb	r2, [r0, #2]
c0de6904:	4770      	bx	lr

c0de6906 <OUTLINED_FUNCTION_20>:
c0de6906:	4631      	mov	r1, r6
c0de6908:	f7fc bbc2 	b.w	c0de3090 <layoutAddCallbackObj>

c0de690c <OUTLINED_FUNCTION_21>:
c0de690c:	08c1      	lsrs	r1, r0, #3
c0de690e:	2002      	movs	r0, #2
c0de6910:	f004 b811 	b.w	c0dea936 <nbgl_objPoolGet>

c0de6914 <OUTLINED_FUNCTION_22>:
c0de6914:	f8d4 10a0 	ldr.w	r1, [r4, #160]	@ 0xa0
c0de6918:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de691c:	784d      	ldrb	r5, [r1, #1]
c0de691e:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de6922:	788e      	ldrb	r6, [r1, #2]
c0de6924:	78c9      	ldrb	r1, [r1, #3]
c0de6926:	ea42 2205 	orr.w	r2, r2, r5, lsl #8
c0de692a:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de692e:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6932:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
c0de6936:	4770      	bx	lr

c0de6938 <OUTLINED_FUNCTION_23>:
c0de6938:	6868      	ldr	r0, [r5, #4]
c0de693a:	f004 b9dd 	b.w	c0deacf8 <pic>

c0de693e <OUTLINED_FUNCTION_24>:
c0de693e:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6942:	784c      	ldrb	r4, [r1, #1]
c0de6944:	f811 cc02 	ldrb.w	ip, [r1, #-2]
c0de6948:	788b      	ldrb	r3, [r1, #2]
c0de694a:	78c9      	ldrb	r1, [r1, #3]
c0de694c:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de6950:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de6954:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6958:	f841 702c 	str.w	r7, [r1, ip, lsl #2]
c0de695c:	4770      	bx	lr

c0de695e <OUTLINED_FUNCTION_25>:
c0de695e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de6962:	08c0      	lsrs	r0, r0, #3
c0de6964:	f7fe baa8 	b.w	c0de4eb8 <createHorizontalLine>

c0de6968 <OUTLINED_FUNCTION_26>:
c0de6968:	75aa      	strb	r2, [r5, #22]
c0de696a:	1c5a      	adds	r2, r3, #1
c0de696c:	788b      	ldrb	r3, [r1, #2]
c0de696e:	f800 2c02 	strb.w	r2, [r0, #-2]
c0de6972:	780a      	ldrb	r2, [r1, #0]
c0de6974:	f895 0022 	ldrb.w	r0, [r5, #34]	@ 0x22
c0de6978:	78c9      	ldrb	r1, [r1, #3]
c0de697a:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de697e:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de6982:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de6986:	4770      	bx	lr

c0de6988 <OUTLINED_FUNCTION_27>:
c0de6988:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de698c:	7843      	ldrb	r3, [r0, #1]
c0de698e:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de6992:	7884      	ldrb	r4, [r0, #2]
c0de6994:	78c0      	ldrb	r0, [r0, #3]
c0de6996:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de699a:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de699e:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de69a2:	f840 a022 	str.w	sl, [r0, r2, lsl #2]
c0de69a6:	4770      	bx	lr

c0de69a8 <OUTLINED_FUNCTION_28>:
c0de69a8:	f801 0f25 	strb.w	r0, [r1, #37]!
c0de69ac:	70ca      	strb	r2, [r1, #3]
c0de69ae:	0c02      	lsrs	r2, r0, #16
c0de69b0:	0a00      	lsrs	r0, r0, #8
c0de69b2:	708a      	strb	r2, [r1, #2]
c0de69b4:	f886 0026 	strb.w	r0, [r6, #38]	@ 0x26
c0de69b8:	4770      	bx	lr

c0de69ba <OUTLINED_FUNCTION_29>:
c0de69ba:	4450      	add	r0, sl
c0de69bc:	3101      	adds	r1, #1
c0de69be:	f842 7024 	str.w	r7, [r2, r4, lsl #2]
c0de69c2:	eb00 0a03 	add.w	sl, r0, r3
c0de69c6:	f888 1020 	strb.w	r1, [r8, #32]
c0de69ca:	4770      	bx	lr

c0de69cc <OUTLINED_FUNCTION_30>:
c0de69cc:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de69d0:	4630      	mov	r0, r6
c0de69d2:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de69d6:	70c2      	strb	r2, [r0, #3]
c0de69d8:	0c0a      	lsrs	r2, r1, #16
c0de69da:	7082      	strb	r2, [r0, #2]
c0de69dc:	0a08      	lsrs	r0, r1, #8
c0de69de:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de69e2:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de69e6:	200b      	movs	r0, #11
c0de69e8:	4770      	bx	lr

c0de69ea <OUTLINED_FUNCTION_31>:
c0de69ea:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de69ee:	70ca      	strb	r2, [r1, #3]
c0de69f0:	0c02      	lsrs	r2, r0, #16
c0de69f2:	0a00      	lsrs	r0, r0, #8
c0de69f4:	708a      	strb	r2, [r1, #2]
c0de69f6:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de69fa:	4770      	bx	lr

c0de69fc <OUTLINED_FUNCTION_32>:
c0de69fc:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6a00:	784e      	ldrb	r6, [r1, #1]
c0de6a02:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de6a06:	788f      	ldrb	r7, [r1, #2]
c0de6a08:	78c9      	ldrb	r1, [r1, #3]
c0de6a0a:	ea42 2206 	orr.w	r2, r2, r6, lsl #8
c0de6a0e:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de6a12:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6a16:	4770      	bx	lr

c0de6a18 <OUTLINED_FUNCTION_33>:
c0de6a18:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6a1c:	784c      	ldrb	r4, [r1, #1]
c0de6a1e:	788e      	ldrb	r6, [r1, #2]
c0de6a20:	78cd      	ldrb	r5, [r1, #3]
c0de6a22:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de6a26:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de6a2a:	ea46 2405 	orr.w	r4, r6, r5, lsl #8
c0de6a2e:	ea42 4204 	orr.w	r2, r2, r4, lsl #16
c0de6a32:	4770      	bx	lr

c0de6a34 <OUTLINED_FUNCTION_34>:
c0de6a34:	f8da 00a0 	ldr.w	r0, [sl, #160]	@ 0xa0
c0de6a38:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de6a3c:	3101      	adds	r1, #1
c0de6a3e:	f880 1020 	strb.w	r1, [r0, #32]
c0de6a42:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de6a46:	08c1      	lsrs	r1, r0, #3
c0de6a48:	2004      	movs	r0, #4
c0de6a4a:	4730      	bx	r6

c0de6a4c <OUTLINED_FUNCTION_35>:
c0de6a4c:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de6a50:	4770      	bx	lr

c0de6a52 <OUTLINED_FUNCTION_36>:
c0de6a52:	77b0      	strb	r0, [r6, #30]
c0de6a54:	6960      	ldr	r0, [r4, #20]
c0de6a56:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6a5a:	7842      	ldrb	r2, [r0, #1]
c0de6a5c:	7883      	ldrb	r3, [r0, #2]
c0de6a5e:	78c0      	ldrb	r0, [r0, #3]
c0de6a60:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de6a64:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de6a68:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de6a6c:	4770      	bx	lr

c0de6a6e <OUTLINED_FUNCTION_37>:
c0de6a6e:	4642      	mov	r2, r8
c0de6a70:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de6a74:	7854      	ldrb	r4, [r2, #1]
c0de6a76:	7895      	ldrb	r5, [r2, #2]
c0de6a78:	78d2      	ldrb	r2, [r2, #3]
c0de6a7a:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0de6a7e:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de6a82:	463d      	mov	r5, r7
c0de6a84:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de6a88:	4770      	bx	lr

c0de6a8a <OUTLINED_FUNCTION_38>:
c0de6a8a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6a8e:	7843      	ldrb	r3, [r0, #1]
c0de6a90:	7885      	ldrb	r5, [r0, #2]
c0de6a92:	78c6      	ldrb	r6, [r0, #3]
c0de6a94:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de6a98:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de6a9c:	ea45 2306 	orr.w	r3, r5, r6, lsl #8
c0de6aa0:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
c0de6aa4:	4770      	bx	lr

c0de6aa6 <OUTLINED_FUNCTION_39>:
c0de6aa6:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de6aaa:	f896 0022 	ldrb.w	r0, [r6, #34]	@ 0x22
c0de6aae:	f040 0001 	orr.w	r0, r0, #1
c0de6ab2:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de6ab6:	4630      	mov	r0, r6
c0de6ab8:	f003 bf15 	b.w	c0dea8e6 <nbgl_objDraw>

c0de6abc <OUTLINED_FUNCTION_40>:
c0de6abc:	4620      	mov	r0, r4
c0de6abe:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6ac2:	7842      	ldrb	r2, [r0, #1]
c0de6ac4:	7883      	ldrb	r3, [r0, #2]
c0de6ac6:	78c0      	ldrb	r0, [r0, #3]
c0de6ac8:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de6acc:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de6ad0:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de6ad4:	4770      	bx	lr

c0de6ad6 <OUTLINED_FUNCTION_41>:
c0de6ad6:	0e02      	lsrs	r2, r0, #24
c0de6ad8:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de6adc:	70ca      	strb	r2, [r1, #3]
c0de6ade:	0c02      	lsrs	r2, r0, #16
c0de6ae0:	0a00      	lsrs	r0, r0, #8
c0de6ae2:	708a      	strb	r2, [r1, #2]
c0de6ae4:	4770      	bx	lr

c0de6ae6 <OUTLINED_FUNCTION_42>:
c0de6ae6:	4601      	mov	r1, r0
c0de6ae8:	2001      	movs	r0, #1
c0de6aea:	22a0      	movs	r2, #160	@ 0xa0
c0de6aec:	2301      	movs	r3, #1
c0de6aee:	7178      	strb	r0, [r7, #5]
c0de6af0:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de6af4:	4770      	bx	lr

c0de6af6 <OUTLINED_FUNCTION_43>:
c0de6af6:	200b      	movs	r0, #11
c0de6af8:	f003 bf36 	b.w	c0dea968 <nbgl_getTextHeightInWidth>

c0de6afc <OUTLINED_FUNCTION_44>:
c0de6afc:	f810 4f22 	ldrb.w	r4, [r0, #34]!
c0de6b00:	7845      	ldrb	r5, [r0, #1]
c0de6b02:	7886      	ldrb	r6, [r0, #2]
c0de6b04:	78c0      	ldrb	r0, [r0, #3]
c0de6b06:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de6b0a:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de6b0e:	ea44 4000 	orr.w	r0, r4, r0, lsl #16
c0de6b12:	4770      	bx	lr

c0de6b14 <OUTLINED_FUNCTION_45>:
c0de6b14:	70c2      	strb	r2, [r0, #3]
c0de6b16:	0c0a      	lsrs	r2, r1, #16
c0de6b18:	7082      	strb	r2, [r0, #2]
c0de6b1a:	0a08      	lsrs	r0, r1, #8
c0de6b1c:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de6b20:	4770      	bx	lr

c0de6b22 <OUTLINED_FUNCTION_46>:
c0de6b22:	0a01      	lsrs	r1, r0, #8
c0de6b24:	71b8      	strb	r0, [r7, #6]
c0de6b26:	71f9      	strb	r1, [r7, #7]
c0de6b28:	f898 1020 	ldrb.w	r1, [r8, #32]
c0de6b2c:	2900      	cmp	r1, #0
c0de6b2e:	4770      	bx	lr

c0de6b30 <OUTLINED_FUNCTION_47>:
c0de6b30:	70ca      	strb	r2, [r1, #3]
c0de6b32:	0c02      	lsrs	r2, r0, #16
c0de6b34:	0a00      	lsrs	r0, r0, #8
c0de6b36:	708a      	strb	r2, [r1, #2]
c0de6b38:	4770      	bx	lr

c0de6b3a <OUTLINED_FUNCTION_48>:
c0de6b3a:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de6b3e:	ea42 2103 	orr.w	r1, r2, r3, lsl #8
c0de6b42:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de6b46:	4770      	bx	lr

c0de6b48 <OUTLINED_FUNCTION_49>:
c0de6b48:	68a8      	ldr	r0, [r5, #8]
c0de6b4a:	f004 b8d5 	b.w	c0deacf8 <pic>

c0de6b4e <OUTLINED_FUNCTION_50>:
c0de6b4e:	4630      	mov	r0, r6
c0de6b50:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de6b54:	70c2      	strb	r2, [r0, #3]
c0de6b56:	0c0a      	lsrs	r2, r1, #16
c0de6b58:	7082      	strb	r2, [r0, #2]
c0de6b5a:	0a08      	lsrs	r0, r1, #8
c0de6b5c:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de6b60:	4770      	bx	lr

c0de6b62 <OUTLINED_FUNCTION_51>:
c0de6b62:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de6b66:	f003 beff 	b.w	c0dea968 <nbgl_getTextHeightInWidth>

c0de6b6a <OUTLINED_FUNCTION_52>:
c0de6b6a:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de6b6e:	0e0a      	lsrs	r2, r1, #24
c0de6b70:	70c2      	strb	r2, [r0, #3]
c0de6b72:	0c0a      	lsrs	r2, r1, #16
c0de6b74:	7082      	strb	r2, [r0, #2]
c0de6b76:	0a08      	lsrs	r0, r1, #8
c0de6b78:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de6b7c:	4770      	bx	lr

c0de6b7e <OUTLINED_FUNCTION_53>:
c0de6b7e:	7842      	ldrb	r2, [r0, #1]
c0de6b80:	7883      	ldrb	r3, [r0, #2]
c0de6b82:	78c0      	ldrb	r0, [r0, #3]
c0de6b84:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de6b88:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de6b8c:	ea41 4100 	orr.w	r1, r1, r0, lsl #16
c0de6b90:	4770      	bx	lr

c0de6b92 <OUTLINED_FUNCTION_54>:
c0de6b92:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de6b96:	3201      	adds	r2, #1
c0de6b98:	f881 2020 	strb.w	r2, [r1, #32]
c0de6b9c:	b004      	add	sp, #16
c0de6b9e:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de6ba2 <OUTLINED_FUNCTION_55>:
c0de6ba2:	7981      	ldrb	r1, [r0, #6]
c0de6ba4:	79c0      	ldrb	r0, [r0, #7]
c0de6ba6:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de6baa:	4770      	bx	lr

c0de6bac <OUTLINED_FUNCTION_56>:
c0de6bac:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de6bb0:	70ca      	strb	r2, [r1, #3]
c0de6bb2:	0c02      	lsrs	r2, r0, #16
c0de6bb4:	0a00      	lsrs	r0, r0, #8
c0de6bb6:	708a      	strb	r2, [r1, #2]
c0de6bb8:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de6bbc:	4770      	bx	lr

c0de6bbe <OUTLINED_FUNCTION_57>:
c0de6bbe:	f8d4 00a0 	ldr.w	r0, [r4, #160]	@ 0xa0
c0de6bc2:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de6bc6:	3101      	adds	r1, #1
c0de6bc8:	f880 1020 	strb.w	r1, [r0, #32]
c0de6bcc:	2000      	movs	r0, #0
c0de6bce:	4770      	bx	lr

c0de6bd0 <OUTLINED_FUNCTION_58>:
c0de6bd0:	4631      	mov	r1, r6
c0de6bd2:	0e02      	lsrs	r2, r0, #24
c0de6bd4:	f886 a01d 	strb.w	sl, [r6, #29]
c0de6bd8:	4770      	bx	lr

c0de6bda <OUTLINED_FUNCTION_59>:
c0de6bda:	f886 b01c 	strb.w	fp, [r6, #28]
c0de6bde:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de6be2:	2005      	movs	r0, #5
c0de6be4:	4770      	bx	lr

c0de6be6 <OUTLINED_FUNCTION_60>:
c0de6be6:	70f1      	strb	r1, [r6, #3]
c0de6be8:	0c01      	lsrs	r1, r0, #16
c0de6bea:	0a00      	lsrs	r0, r0, #8
c0de6bec:	70b1      	strb	r1, [r6, #2]
c0de6bee:	4770      	bx	lr

c0de6bf0 <OUTLINED_FUNCTION_61>:
c0de6bf0:	f891 0020 	ldrb.w	r0, [r1, #32]
c0de6bf4:	3001      	adds	r0, #1
c0de6bf6:	f881 0020 	strb.w	r0, [r1, #32]
c0de6bfa:	4770      	bx	lr

c0de6bfc <OUTLINED_FUNCTION_62>:
c0de6bfc:	08c1      	lsrs	r1, r0, #3
c0de6bfe:	2004      	movs	r0, #4
c0de6c00:	f003 be9e 	b.w	c0dea940 <nbgl_containerPoolGet>

c0de6c04 <OUTLINED_FUNCTION_63>:
c0de6c04:	08c1      	lsrs	r1, r0, #3
c0de6c06:	2003      	movs	r0, #3
c0de6c08:	f003 be95 	b.w	c0dea936 <nbgl_objPoolGet>

c0de6c0c <OUTLINED_FUNCTION_64>:
c0de6c0c:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de6c10:	08c1      	lsrs	r1, r0, #3
c0de6c12:	2005      	movs	r0, #5
c0de6c14:	f003 be94 	b.w	c0dea940 <nbgl_containerPoolGet>

c0de6c18 <OUTLINED_FUNCTION_65>:
c0de6c18:	71d1      	strb	r1, [r2, #7]
c0de6c1a:	7190      	strb	r0, [r2, #6]
c0de6c1c:	f892 0020 	ldrb.w	r0, [r2, #32]
c0de6c20:	3001      	adds	r0, #1
c0de6c22:	f882 0020 	strb.w	r0, [r2, #32]
c0de6c26:	4770      	bx	lr

c0de6c28 <OUTLINED_FUNCTION_66>:
c0de6c28:	7842      	ldrb	r2, [r0, #1]
c0de6c2a:	7884      	ldrb	r4, [r0, #2]
c0de6c2c:	78c0      	ldrb	r0, [r0, #3]
c0de6c2e:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de6c32:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de6c36:	4770      	bx	lr

c0de6c38 <OUTLINED_FUNCTION_67>:
c0de6c38:	7a2a      	ldrb	r2, [r5, #8]
c0de6c3a:	7a6b      	ldrb	r3, [r5, #9]
c0de6c3c:	4620      	mov	r0, r4
c0de6c3e:	f7fc ba27 	b.w	c0de3090 <layoutAddCallbackObj>

c0de6c42 <OUTLINED_FUNCTION_68>:
c0de6c42:	4630      	mov	r0, r6
c0de6c44:	f004 b858 	b.w	c0deacf8 <pic>

c0de6c48 <OUTLINED_FUNCTION_69>:
c0de6c48:	f801 7f12 	strb.w	r7, [r1, #18]!
c0de6c4c:	70ca      	strb	r2, [r1, #3]
c0de6c4e:	0c3a      	lsrs	r2, r7, #16
c0de6c50:	708a      	strb	r2, [r1, #2]
c0de6c52:	4770      	bx	lr

c0de6c54 <OUTLINED_FUNCTION_70>:
c0de6c54:	758a      	strb	r2, [r1, #22]
c0de6c56:	460a      	mov	r2, r1
c0de6c58:	f802 0f22 	strb.w	r0, [r2, #34]!
c0de6c5c:	0c00      	lsrs	r0, r0, #16
c0de6c5e:	7090      	strb	r0, [r2, #2]
c0de6c60:	4770      	bx	lr

c0de6c62 <OUTLINED_FUNCTION_71>:
c0de6c62:	f8bb 3020 	ldrh.w	r3, [fp, #32]
c0de6c66:	3318      	adds	r3, #24
c0de6c68:	0a1c      	lsrs	r4, r3, #8
c0de6c6a:	767b      	strb	r3, [r7, #25]
c0de6c6c:	76bc      	strb	r4, [r7, #26]
c0de6c6e:	4770      	bx	lr

c0de6c70 <OUTLINED_FUNCTION_72>:
c0de6c70:	f842 5023 	str.w	r5, [r2, r3, lsl #2]
c0de6c74:	2200      	movs	r2, #0
c0de6c76:	762a      	strb	r2, [r5, #24]
c0de6c78:	2210      	movs	r2, #16
c0de6c7a:	75ea      	strb	r2, [r5, #23]
c0de6c7c:	4770      	bx	lr

c0de6c7e <OUTLINED_FUNCTION_73>:
c0de6c7e:	f88d 0010 	strb.w	r0, [sp, #16]
c0de6c82:	8928      	ldrh	r0, [r5, #8]
c0de6c84:	f8ad 000c 	strh.w	r0, [sp, #12]
c0de6c88:	4640      	mov	r0, r8
c0de6c8a:	4770      	bx	lr

c0de6c8c <OUTLINED_FUNCTION_74>:
c0de6c8c:	08c9      	lsrs	r1, r1, #3
c0de6c8e:	f003 be57 	b.w	c0dea940 <nbgl_containerPoolGet>

c0de6c92 <OUTLINED_FUNCTION_75>:
c0de6c92:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de6c96:	7893      	ldrb	r3, [r2, #2]
c0de6c98:	78d2      	ldrb	r2, [r2, #3]
c0de6c9a:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de6c9e:	4770      	bx	lr

c0de6ca0 <OUTLINED_FUNCTION_76>:
c0de6ca0:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de6ca4:	ea43 2206 	orr.w	r2, r3, r6, lsl #8
c0de6ca8:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de6cac:	4770      	bx	lr

c0de6cae <OUTLINED_FUNCTION_78>:
c0de6cae:	200d      	movs	r0, #13
c0de6cb0:	f003 be5a 	b.w	c0dea968 <nbgl_getTextHeightInWidth>

c0de6cb4 <OUTLINED_FUNCTION_79>:
c0de6cb4:	4604      	mov	r4, r0
c0de6cb6:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de6cba:	4770      	bx	lr

c0de6cbc <OUTLINED_FUNCTION_80>:
c0de6cbc:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de6cc0:	08c1      	lsrs	r1, r0, #3
c0de6cc2:	2004      	movs	r0, #4
c0de6cc4:	4720      	bx	r4

c0de6cc6 <OUTLINED_FUNCTION_81>:
c0de6cc6:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
c0de6cca:	7802      	ldrb	r2, [r0, #0]
c0de6ccc:	7840      	ldrb	r0, [r0, #1]
c0de6cce:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de6cd2:	4770      	bx	lr

c0de6cd4 <layoutNavigationCallback>:
c0de6cd4:	b570      	push	{r4, r5, r6, lr}
c0de6cd6:	290a      	cmp	r1, #10
c0de6cd8:	d029      	beq.n	c0de6d2e <layoutNavigationCallback+0x5a>
c0de6cda:	2909      	cmp	r1, #9
c0de6cdc:	d02b      	beq.n	c0de6d36 <layoutNavigationCallback+0x62>
c0de6cde:	2900      	cmp	r1, #0
c0de6ce0:	d14a      	bne.n	c0de6d78 <layoutNavigationCallback+0xa4>
c0de6ce2:	4604      	mov	r4, r0
c0de6ce4:	7bc1      	ldrb	r1, [r0, #15]
c0de6ce6:	f814 5f0e 	ldrb.w	r5, [r4, #14]!
c0de6cea:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de6cee:	78a5      	ldrb	r5, [r4, #2]
c0de6cf0:	78e4      	ldrb	r4, [r4, #3]
c0de6cf2:	ea45 2404 	orr.w	r4, r5, r4, lsl #8
c0de6cf6:	ea41 4104 	orr.w	r1, r1, r4, lsl #16
c0de6cfa:	460d      	mov	r5, r1
c0de6cfc:	f891 4023 	ldrb.w	r4, [r1, #35]	@ 0x23
c0de6d00:	f815 6f22 	ldrb.w	r6, [r5, #34]!
c0de6d04:	ea46 2404 	orr.w	r4, r6, r4, lsl #8
c0de6d08:	78ae      	ldrb	r6, [r5, #2]
c0de6d0a:	78ed      	ldrb	r5, [r5, #3]
c0de6d0c:	ea46 2505 	orr.w	r5, r6, r5, lsl #8
c0de6d10:	ea44 4405 	orr.w	r4, r4, r5, lsl #16
c0de6d14:	6825      	ldr	r5, [r4, #0]
c0de6d16:	4285      	cmp	r5, r0
c0de6d18:	d01e      	beq.n	c0de6d58 <layoutNavigationCallback+0x84>
c0de6d1a:	6865      	ldr	r5, [r4, #4]
c0de6d1c:	4285      	cmp	r5, r0
c0de6d1e:	d01e      	beq.n	c0de6d5e <layoutNavigationCallback+0x8a>
c0de6d20:	68a4      	ldr	r4, [r4, #8]
c0de6d22:	4284      	cmp	r4, r0
c0de6d24:	d128      	bne.n	c0de6d78 <layoutNavigationCallback+0xa4>
c0de6d26:	2a01      	cmp	r2, #1
c0de6d28:	d81d      	bhi.n	c0de6d66 <layoutNavigationCallback+0x92>
c0de6d2a:	7818      	ldrb	r0, [r3, #0]
c0de6d2c:	e01f      	b.n	c0de6d6e <layoutNavigationCallback+0x9a>
c0de6d2e:	2a01      	cmp	r2, #1
c0de6d30:	d805      	bhi.n	c0de6d3e <layoutNavigationCallback+0x6a>
c0de6d32:	7819      	ldrb	r1, [r3, #0]
c0de6d34:	e007      	b.n	c0de6d46 <layoutNavigationCallback+0x72>
c0de6d36:	7819      	ldrb	r1, [r3, #0]
c0de6d38:	b1f1      	cbz	r1, c0de6d78 <layoutNavigationCallback+0xa4>
c0de6d3a:	3901      	subs	r1, #1
c0de6d3c:	e004      	b.n	c0de6d48 <layoutNavigationCallback+0x74>
c0de6d3e:	7819      	ldrb	r1, [r3, #0]
c0de6d40:	1e54      	subs	r4, r2, #1
c0de6d42:	428c      	cmp	r4, r1
c0de6d44:	d918      	bls.n	c0de6d78 <layoutNavigationCallback+0xa4>
c0de6d46:	3101      	adds	r1, #1
c0de6d48:	7019      	strb	r1, [r3, #0]
c0de6d4a:	b2cb      	uxtb	r3, r1
c0de6d4c:	4611      	mov	r1, r2
c0de6d4e:	461a      	mov	r2, r3
c0de6d50:	f000 f814 	bl	c0de6d7c <configButtons>
c0de6d54:	2001      	movs	r0, #1
c0de6d56:	bd70      	pop	{r4, r5, r6, pc}
c0de6d58:	20ff      	movs	r0, #255	@ 0xff
c0de6d5a:	7018      	strb	r0, [r3, #0]
c0de6d5c:	e7fa      	b.n	c0de6d54 <layoutNavigationCallback+0x80>
c0de6d5e:	7818      	ldrb	r0, [r3, #0]
c0de6d60:	b150      	cbz	r0, c0de6d78 <layoutNavigationCallback+0xa4>
c0de6d62:	3801      	subs	r0, #1
c0de6d64:	e004      	b.n	c0de6d70 <layoutNavigationCallback+0x9c>
c0de6d66:	7818      	ldrb	r0, [r3, #0]
c0de6d68:	1e54      	subs	r4, r2, #1
c0de6d6a:	4284      	cmp	r4, r0
c0de6d6c:	d904      	bls.n	c0de6d78 <layoutNavigationCallback+0xa4>
c0de6d6e:	3001      	adds	r0, #1
c0de6d70:	7018      	strb	r0, [r3, #0]
c0de6d72:	b2c3      	uxtb	r3, r0
c0de6d74:	4608      	mov	r0, r1
c0de6d76:	e7e9      	b.n	c0de6d4c <layoutNavigationCallback+0x78>
c0de6d78:	2000      	movs	r0, #0
c0de6d7a:	bd70      	pop	{r4, r5, r6, pc}

c0de6d7c <configButtons>:
c0de6d7c:	b5b0      	push	{r4, r5, r7, lr}
c0de6d7e:	f810 3f22 	ldrb.w	r3, [r0, #34]!
c0de6d82:	7844      	ldrb	r4, [r0, #1]
c0de6d84:	7885      	ldrb	r5, [r0, #2]
c0de6d86:	78c0      	ldrb	r0, [r0, #3]
c0de6d88:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de6d8c:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
c0de6d90:	ea43 4000 	orr.w	r0, r3, r0, lsl #16
c0de6d94:	e9d0 3001 	ldrd	r3, r0, [r0, #4]
c0de6d98:	b12b      	cbz	r3, c0de6da6 <configButtons+0x2a>
c0de6d9a:	fab2 f482 	clz	r4, r2
c0de6d9e:	0964      	lsrs	r4, r4, #5
c0de6da0:	0064      	lsls	r4, r4, #1
c0de6da2:	f883 4021 	strb.w	r4, [r3, #33]	@ 0x21
c0de6da6:	2902      	cmp	r1, #2
c0de6da8:	d307      	bcc.n	c0de6dba <configButtons+0x3e>
c0de6daa:	43d2      	mvns	r2, r2
c0de6dac:	4411      	add	r1, r2
c0de6dae:	fab1 f181 	clz	r1, r1
c0de6db2:	0949      	lsrs	r1, r1, #5
c0de6db4:	0049      	lsls	r1, r1, #1
c0de6db6:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de6dba:	bdb0      	pop	{r4, r5, r7, pc}

c0de6dbc <layoutNavigationPopulate>:
c0de6dbc:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de6dc0:	4680      	mov	r8, r0
c0de6dc2:	78c8      	ldrb	r0, [r1, #3]
c0de6dc4:	4616      	mov	r6, r2
c0de6dc6:	460d      	mov	r5, r1
c0de6dc8:	b338      	cbz	r0, c0de6e1a <layoutNavigationPopulate+0x5e>
c0de6dca:	2005      	movs	r0, #5
c0de6dcc:	4631      	mov	r1, r6
c0de6dce:	2405      	movs	r4, #5
c0de6dd0:	f003 fdb1 	bl	c0dea936 <nbgl_objPoolGet>
c0de6dd4:	4976      	ldr	r1, [pc, #472]	@ (c0de6fb0 <layoutNavigationPopulate+0x1f4>)
c0de6dd6:	4479      	add	r1, pc
c0de6dd8:	f000 f8ff 	bl	c0de6fda <OUTLINED_FUNCTION_1>
c0de6ddc:	70d3      	strb	r3, [r2, #3]
c0de6dde:	7091      	strb	r1, [r2, #2]
c0de6de0:	2258      	movs	r2, #88	@ 0x58
c0de6de2:	2100      	movs	r1, #0
c0de6de4:	2303      	movs	r3, #3
c0de6de6:	7182      	strb	r2, [r0, #6]
c0de6de8:	7102      	strb	r2, [r0, #4]
c0de6dea:	2201      	movs	r2, #1
c0de6dec:	71c1      	strb	r1, [r0, #7]
c0de6dee:	7141      	strb	r1, [r0, #5]
c0de6df0:	7601      	strb	r1, [r0, #24]
c0de6df2:	7741      	strb	r1, [r0, #29]
c0de6df4:	f880 3020 	strb.w	r3, [r0, #32]
c0de6df8:	77c3      	strb	r3, [r0, #31]
c0de6dfa:	f880 3022 	strb.w	r3, [r0, #34]	@ 0x22
c0de6dfe:	7702      	strb	r2, [r0, #28]
c0de6e00:	7782      	strb	r2, [r0, #30]
c0de6e02:	786a      	ldrb	r2, [r5, #1]
c0de6e04:	2a01      	cmp	r2, #1
c0de6e06:	bf88      	it	hi
c0de6e08:	2404      	movhi	r4, #4
c0de6e0a:	7584      	strb	r4, [r0, #22]
c0de6e0c:	bf88      	it	hi
c0de6e0e:	2101      	movhi	r1, #1
c0de6e10:	00c9      	lsls	r1, r1, #3
c0de6e12:	75c1      	strb	r1, [r0, #23]
c0de6e14:	f000 f8d4 	bl	c0de6fc0 <OUTLINED_FUNCTION_0>
c0de6e18:	6008      	str	r0, [r1, #0]
c0de6e1a:	7928      	ldrb	r0, [r5, #4]
c0de6e1c:	b310      	cbz	r0, c0de6e64 <layoutNavigationPopulate+0xa8>
c0de6e1e:	2005      	movs	r0, #5
c0de6e20:	4631      	mov	r1, r6
c0de6e22:	f003 fd88 	bl	c0dea936 <nbgl_objPoolGet>
c0de6e26:	4963      	ldr	r1, [pc, #396]	@ (c0de6fb4 <layoutNavigationPopulate+0x1f8>)
c0de6e28:	4479      	add	r1, pc
c0de6e2a:	f000 f8d6 	bl	c0de6fda <OUTLINED_FUNCTION_1>
c0de6e2e:	7091      	strb	r1, [r2, #2]
c0de6e30:	2100      	movs	r1, #0
c0de6e32:	70d3      	strb	r3, [r2, #3]
c0de6e34:	2260      	movs	r2, #96	@ 0x60
c0de6e36:	2301      	movs	r3, #1
c0de6e38:	71c1      	strb	r1, [r0, #7]
c0de6e3a:	7141      	strb	r1, [r0, #5]
c0de6e3c:	7741      	strb	r1, [r0, #29]
c0de6e3e:	7601      	strb	r1, [r0, #24]
c0de6e40:	2103      	movs	r1, #3
c0de6e42:	7182      	strb	r2, [r0, #6]
c0de6e44:	2268      	movs	r2, #104	@ 0x68
c0de6e46:	7703      	strb	r3, [r0, #28]
c0de6e48:	f880 1020 	strb.w	r1, [r0, #32]
c0de6e4c:	77c1      	strb	r1, [r0, #31]
c0de6e4e:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de6e52:	2102      	movs	r1, #2
c0de6e54:	7102      	strb	r2, [r0, #4]
c0de6e56:	75c2      	strb	r2, [r0, #23]
c0de6e58:	7781      	strb	r1, [r0, #30]
c0de6e5a:	2106      	movs	r1, #6
c0de6e5c:	7581      	strb	r1, [r0, #22]
c0de6e5e:	f000 f8af 	bl	c0de6fc0 <OUTLINED_FUNCTION_0>
c0de6e62:	6048      	str	r0, [r1, #4]
c0de6e64:	2005      	movs	r0, #5
c0de6e66:	4631      	mov	r1, r6
c0de6e68:	f003 fd65 	bl	c0dea936 <nbgl_objPoolGet>
c0de6e6c:	4c52      	ldr	r4, [pc, #328]	@ (c0de6fb8 <layoutNavigationPopulate+0x1fc>)
c0de6e6e:	447c      	add	r4, pc
c0de6e70:	0a21      	lsrs	r1, r4, #8
c0de6e72:	0e22      	lsrs	r2, r4, #24
c0de6e74:	f880 102f 	strb.w	r1, [r0, #47]	@ 0x2f
c0de6e78:	4601      	mov	r1, r0
c0de6e7a:	f801 4f2e 	strb.w	r4, [r1, #46]!
c0de6e7e:	70ca      	strb	r2, [r1, #3]
c0de6e80:	0c22      	lsrs	r2, r4, #16
c0de6e82:	708a      	strb	r2, [r1, #2]
c0de6e84:	2100      	movs	r1, #0
c0de6e86:	2260      	movs	r2, #96	@ 0x60
c0de6e88:	7182      	strb	r2, [r0, #6]
c0de6e8a:	2268      	movs	r2, #104	@ 0x68
c0de6e8c:	71c1      	strb	r1, [r0, #7]
c0de6e8e:	7141      	strb	r1, [r0, #5]
c0de6e90:	7741      	strb	r1, [r0, #29]
c0de6e92:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de6e96:	2103      	movs	r1, #3
c0de6e98:	7102      	strb	r2, [r0, #4]
c0de6e9a:	2201      	movs	r2, #1
c0de6e9c:	f880 1020 	strb.w	r1, [r0, #32]
c0de6ea0:	77c1      	strb	r1, [r0, #31]
c0de6ea2:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de6ea6:	7781      	strb	r1, [r0, #30]
c0de6ea8:	2106      	movs	r1, #6
c0de6eaa:	7581      	strb	r1, [r0, #22]
c0de6eac:	7702      	strb	r2, [r0, #28]
c0de6eae:	4641      	mov	r1, r8
c0de6eb0:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6eb4:	784b      	ldrb	r3, [r1, #1]
c0de6eb6:	788f      	ldrb	r7, [r1, #2]
c0de6eb8:	78c9      	ldrb	r1, [r1, #3]
c0de6eba:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6ebe:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de6ec2:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6ec6:	6088      	str	r0, [r1, #8]
c0de6ec8:	79a8      	ldrb	r0, [r5, #6]
c0de6eca:	2800      	cmp	r0, #0
c0de6ecc:	d067      	beq.n	c0de6f9e <layoutNavigationPopulate+0x1e2>
c0de6ece:	79e8      	ldrb	r0, [r5, #7]
c0de6ed0:	2800      	cmp	r0, #0
c0de6ed2:	d04c      	beq.n	c0de6f6e <layoutNavigationPopulate+0x1b2>
c0de6ed4:	2004      	movs	r0, #4
c0de6ed6:	4631      	mov	r1, r6
c0de6ed8:	f003 fd2d 	bl	c0dea936 <nbgl_objPoolGet>
c0de6edc:	4606      	mov	r6, r0
c0de6ede:	7868      	ldrb	r0, [r5, #1]
c0de6ee0:	78a9      	ldrb	r1, [r5, #2]
c0de6ee2:	f04f 0a0b 	mov.w	sl, #11
c0de6ee6:	9000      	str	r0, [sp, #0]
c0de6ee8:	4830      	ldr	r0, [pc, #192]	@ (c0de6fac <layoutNavigationPopulate+0x1f0>)
c0de6eea:	1c4b      	adds	r3, r1, #1
c0de6eec:	210b      	movs	r1, #11
c0de6eee:	4a33      	ldr	r2, [pc, #204]	@ (c0de6fbc <layoutNavigationPopulate+0x200>)
c0de6ef0:	eb09 0700 	add.w	r7, r9, r0
c0de6ef4:	447a      	add	r2, pc
c0de6ef6:	4638      	mov	r0, r7
c0de6ef8:	f003 fd6c 	bl	c0dea9d4 <snprintf>
c0de6efc:	0a38      	lsrs	r0, r7, #8
c0de6efe:	0e39      	lsrs	r1, r7, #24
c0de6f00:	f06f 0201 	mvn.w	r2, #1
c0de6f04:	f886 a022 	strb.w	sl, [r6, #34]	@ 0x22
c0de6f08:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de6f0c:	4630      	mov	r0, r6
c0de6f0e:	f800 7f26 	strb.w	r7, [r0, #38]!
c0de6f12:	70c1      	strb	r1, [r0, #3]
c0de6f14:	0c39      	lsrs	r1, r7, #16
c0de6f16:	7081      	strb	r1, [r0, #2]
c0de6f18:	2000      	movs	r0, #0
c0de6f1a:	7861      	ldrb	r1, [r4, #1]
c0de6f1c:	71f0      	strb	r0, [r6, #7]
c0de6f1e:	2060      	movs	r0, #96	@ 0x60
c0de6f20:	71b0      	strb	r0, [r6, #6]
c0de6f22:	2001      	movs	r0, #1
c0de6f24:	77f0      	strb	r0, [r6, #31]
c0de6f26:	2005      	movs	r0, #5
c0de6f28:	f886 0020 	strb.w	r0, [r6, #32]
c0de6f2c:	75b0      	strb	r0, [r6, #22]
c0de6f2e:	7820      	ldrb	r0, [r4, #0]
c0de6f30:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de6f34:	f1c0 0168 	rsb	r1, r0, #104	@ 0x68
c0de6f38:	fb91 f1f2 	sdiv	r1, r1, r2
c0de6f3c:	1a08      	subs	r0, r1, r0
c0de6f3e:	4641      	mov	r1, r8
c0de6f40:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de6f44:	f811 3c1e 	ldrb.w	r3, [r1, #-30]
c0de6f48:	f811 4c1d 	ldrb.w	r4, [r1, #-29]
c0de6f4c:	784f      	ldrb	r7, [r1, #1]
c0de6f4e:	788a      	ldrb	r2, [r1, #2]
c0de6f50:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de6f54:	eb03 0040 	add.w	r0, r3, r0, lsl #1
c0de6f58:	7130      	strb	r0, [r6, #4]
c0de6f5a:	0a00      	lsrs	r0, r0, #8
c0de6f5c:	78c9      	ldrb	r1, [r1, #3]
c0de6f5e:	7170      	strb	r0, [r6, #5]
c0de6f60:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de6f64:	ea4c 2207 	orr.w	r2, ip, r7, lsl #8
c0de6f68:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6f6c:	60ce      	str	r6, [r1, #12]
c0de6f6e:	7928      	ldrb	r0, [r5, #4]
c0de6f70:	b1a8      	cbz	r0, c0de6f9e <layoutNavigationPopulate+0x1e2>
c0de6f72:	4640      	mov	r0, r8
c0de6f74:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6f78:	7842      	ldrb	r2, [r0, #1]
c0de6f7a:	7883      	ldrb	r3, [r0, #2]
c0de6f7c:	78c0      	ldrb	r0, [r0, #3]
c0de6f7e:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de6f82:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de6f86:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de6f8a:	6840      	ldr	r0, [r0, #4]
c0de6f8c:	f810 1f17 	ldrb.w	r1, [r0, #23]!
c0de6f90:	7842      	ldrb	r2, [r0, #1]
c0de6f92:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de6f96:	314f      	adds	r1, #79	@ 0x4f
c0de6f98:	7001      	strb	r1, [r0, #0]
c0de6f9a:	0a09      	lsrs	r1, r1, #8
c0de6f9c:	7041      	strb	r1, [r0, #1]
c0de6f9e:	7869      	ldrb	r1, [r5, #1]
c0de6fa0:	78aa      	ldrb	r2, [r5, #2]
c0de6fa2:	4640      	mov	r0, r8
c0de6fa4:	e8bd 45f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de6fa8:	f7ff bee8 	b.w	c0de6d7c <configButtons>
c0de6fac:	00001950 	.word	0x00001950
c0de6fb0:	00005219 	.word	0x00005219
c0de6fb4:	000050ad 	.word	0x000050ad
c0de6fb8:	000050ea 	.word	0x000050ea
c0de6fbc:	00005b9c 	.word	0x00005b9c

c0de6fc0 <OUTLINED_FUNCTION_0>:
c0de6fc0:	4641      	mov	r1, r8
c0de6fc2:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6fc6:	784b      	ldrb	r3, [r1, #1]
c0de6fc8:	788c      	ldrb	r4, [r1, #2]
c0de6fca:	78c9      	ldrb	r1, [r1, #3]
c0de6fcc:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6fd0:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
c0de6fd4:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6fd8:	4770      	bx	lr

c0de6fda <OUTLINED_FUNCTION_1>:
c0de6fda:	0a0a      	lsrs	r2, r1, #8
c0de6fdc:	0e0b      	lsrs	r3, r1, #24
c0de6fde:	f880 202f 	strb.w	r2, [r0, #47]	@ 0x2f
c0de6fe2:	4602      	mov	r2, r0
c0de6fe4:	f802 1f2e 	strb.w	r1, [r2, #46]!
c0de6fe8:	0c09      	lsrs	r1, r1, #16
c0de6fea:	4770      	bx	lr

c0de6fec <nbgl_pageDrawLedgerInfo>:
c0de6fec:	b510      	push	{r4, lr}
c0de6fee:	b08c      	sub	sp, #48	@ 0x30
c0de6ff0:	9008      	str	r0, [sp, #32]
c0de6ff2:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0de6ff6:	f88d 301c 	strb.w	r3, [sp, #28]
c0de6ffa:	f8ad 0014 	strh.w	r0, [sp, #20]
c0de6ffe:	2009      	movs	r0, #9
c0de7000:	f88d 001d 	strb.w	r0, [sp, #29]
c0de7004:	481c      	ldr	r0, [pc, #112]	@ (c0de7078 <nbgl_pageDrawLedgerInfo+0x8c>)
c0de7006:	4478      	add	r0, pc
c0de7008:	9006      	str	r0, [sp, #24]
c0de700a:	2000      	movs	r0, #0
c0de700c:	9004      	str	r0, [sp, #16]
c0de700e:	4b1b      	ldr	r3, [pc, #108]	@ (c0de707c <nbgl_pageDrawLedgerInfo+0x90>)
c0de7010:	e9cd 2000 	strd	r2, r0, [sp]
c0de7014:	784a      	ldrb	r2, [r1, #1]
c0de7016:	78cc      	ldrb	r4, [r1, #3]
c0de7018:	447b      	add	r3, pc
c0de701a:	e9cd 0302 	strd	r0, r3, [sp, #8]
c0de701e:	7808      	ldrb	r0, [r1, #0]
c0de7020:	788b      	ldrb	r3, [r1, #2]
c0de7022:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de7026:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de702a:	460a      	mov	r2, r1
c0de702c:	ea40 4003 	orr.w	r0, r0, r3, lsl #16
c0de7030:	f812 3f08 	ldrb.w	r3, [r2, #8]!
c0de7034:	9009      	str	r0, [sp, #36]	@ 0x24
c0de7036:	7a48      	ldrb	r0, [r1, #9]
c0de7038:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de703c:	7893      	ldrb	r3, [r2, #2]
c0de703e:	78d2      	ldrb	r2, [r2, #3]
c0de7040:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de7044:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
c0de7048:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de704a:	7948      	ldrb	r0, [r1, #5]
c0de704c:	f811 2f04 	ldrb.w	r2, [r1, #4]!
c0de7050:	f000 fb79 	bl	c0de7746 <OUTLINED_FUNCTION_1>
c0de7054:	900a      	str	r0, [sp, #40]	@ 0x28
c0de7056:	a805      	add	r0, sp, #20
c0de7058:	f7fc f83c 	bl	c0de30d4 <nbgl_layoutGet>
c0de705c:	2160      	movs	r1, #96	@ 0x60
c0de705e:	4604      	mov	r4, r0
c0de7060:	f000 f80e 	bl	c0de7080 <addEmptyHeader>
c0de7064:	4669      	mov	r1, sp
c0de7066:	4620      	mov	r0, r4
c0de7068:	f7fd ff3a 	bl	c0de4ee0 <nbgl_layoutAddCenteredInfo>
c0de706c:	4620      	mov	r0, r4
c0de706e:	f7ff fa2b 	bl	c0de64c8 <nbgl_layoutDraw>
c0de7072:	4620      	mov	r0, r4
c0de7074:	b00c      	add	sp, #48	@ 0x30
c0de7076:	bd10      	pop	{r4, pc}
c0de7078:	00005e65 	.word	0x00005e65
c0de707c:	00004704 	.word	0x00004704

c0de7080 <addEmptyHeader>:
c0de7080:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de7082:	f8ad 1004 	strh.w	r1, [sp, #4]
c0de7086:	2100      	movs	r1, #0
c0de7088:	f8ad 1000 	strh.w	r1, [sp]
c0de708c:	4669      	mov	r1, sp
c0de708e:	f7fe fdb9 	bl	c0de5c04 <nbgl_layoutAddHeader>
c0de7092:	bd8f      	pop	{r0, r1, r2, r3, r7, pc}

c0de7094 <nbgl_pageDrawInfo>:
c0de7094:	b570      	push	{r4, r5, r6, lr}
c0de7096:	b08c      	sub	sp, #48	@ 0x30
c0de7098:	460d      	mov	r5, r1
c0de709a:	4606      	mov	r6, r0
c0de709c:	a805      	add	r0, sp, #20
c0de709e:	211c      	movs	r1, #28
c0de70a0:	4614      	mov	r4, r2
c0de70a2:	f004 f84b 	bl	c0deb13c <__aeabi_memclr>
c0de70a6:	2001      	movs	r0, #1
c0de70a8:	9608      	str	r6, [sp, #32]
c0de70aa:	f88d 0015 	strb.w	r0, [sp, #21]
c0de70ae:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de70b2:	b948      	cbnz	r0, c0de70c8 <nbgl_pageDrawInfo+0x34>
c0de70b4:	6a20      	ldr	r0, [r4, #32]
c0de70b6:	9006      	str	r0, [sp, #24]
c0de70b8:	f894 0025 	ldrb.w	r0, [r4, #37]	@ 0x25
c0de70bc:	f88d 001c 	strb.w	r0, [sp, #28]
c0de70c0:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de70c4:	f88d 001d 	strb.w	r0, [sp, #29]
c0de70c8:	b1f5      	cbz	r5, c0de7108 <nbgl_pageDrawInfo+0x74>
c0de70ca:	4629      	mov	r1, r5
c0de70cc:	7a68      	ldrb	r0, [r5, #9]
c0de70ce:	78eb      	ldrb	r3, [r5, #3]
c0de70d0:	f811 2f08 	ldrb.w	r2, [r1, #8]!
c0de70d4:	f000 fb37 	bl	c0de7746 <OUTLINED_FUNCTION_1>
c0de70d8:	4629      	mov	r1, r5
c0de70da:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de70dc:	7968      	ldrb	r0, [r5, #5]
c0de70de:	f811 2f04 	ldrb.w	r2, [r1, #4]!
c0de70e2:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de70e6:	788a      	ldrb	r2, [r1, #2]
c0de70e8:	78c9      	ldrb	r1, [r1, #3]
c0de70ea:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de70ee:	78aa      	ldrb	r2, [r5, #2]
c0de70f0:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de70f4:	7869      	ldrb	r1, [r5, #1]
c0de70f6:	900a      	str	r0, [sp, #40]	@ 0x28
c0de70f8:	7828      	ldrb	r0, [r5, #0]
c0de70fa:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de70fe:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de7102:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
c0de7106:	e000      	b.n	c0de710a <nbgl_pageDrawInfo+0x76>
c0de7108:	2000      	movs	r0, #0
c0de710a:	9009      	str	r0, [sp, #36]	@ 0x24
c0de710c:	a805      	add	r0, sp, #20
c0de710e:	f7fb ffe1 	bl	c0de30d4 <nbgl_layoutGet>
c0de7112:	4605      	mov	r5, r0
c0de7114:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de7118:	b150      	cbz	r0, c0de7130 <nbgl_pageDrawInfo+0x9c>
c0de711a:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de711e:	f894 3025 	ldrb.w	r3, [r4, #37]	@ 0x25
c0de7122:	6a22      	ldr	r2, [r4, #32]
c0de7124:	f44f 61c0 	mov.w	r1, #1536	@ 0x600
c0de7128:	9000      	str	r0, [sp, #0]
c0de712a:	4628      	mov	r0, r5
c0de712c:	f7fc fd40 	bl	c0de3bb0 <nbgl_layoutAddSwipe>
c0de7130:	7d20      	ldrb	r0, [r4, #20]
c0de7132:	b118      	cbz	r0, c0de713c <nbgl_pageDrawInfo+0xa8>
c0de7134:	4628      	mov	r0, r5
c0de7136:	2128      	movs	r1, #40	@ 0x28
c0de7138:	f7ff ffa2 	bl	c0de7080 <addEmptyHeader>
c0de713c:	4628      	mov	r0, r5
c0de713e:	4621      	mov	r1, r4
c0de7140:	f7fd fece 	bl	c0de4ee0 <nbgl_layoutAddCenteredInfo>
c0de7144:	6aa0      	ldr	r0, [r4, #40]	@ 0x28
c0de7146:	b1b8      	cbz	r0, c0de7178 <nbgl_pageDrawInfo+0xe4>
c0de7148:	7d61      	ldrb	r1, [r4, #21]
c0de714a:	2904      	cmp	r1, #4
c0de714c:	d014      	beq.n	c0de7178 <nbgl_pageDrawInfo+0xe4>
c0de714e:	9001      	str	r0, [sp, #4]
c0de7150:	2001      	movs	r0, #1
c0de7152:	f8ad 000e 	strh.w	r0, [sp, #14]
c0de7156:	6ae0      	ldr	r0, [r4, #44]	@ 0x2c
c0de7158:	9002      	str	r0, [sp, #8]
c0de715a:	7de0      	ldrb	r0, [r4, #23]
c0de715c:	f88d 000c 	strb.w	r0, [sp, #12]
c0de7160:	f894 0030 	ldrb.w	r0, [r4, #48]	@ 0x30
c0de7164:	f88d 000d 	strb.w	r0, [sp, #13]
c0de7168:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de716c:	f88d 0010 	strb.w	r0, [sp, #16]
c0de7170:	a901      	add	r1, sp, #4
c0de7172:	4628      	mov	r0, r5
c0de7174:	f7fe fc2e 	bl	c0de59d4 <nbgl_layoutAddButton>
c0de7178:	69a0      	ldr	r0, [r4, #24]
c0de717a:	b140      	cbz	r0, c0de718e <nbgl_pageDrawInfo+0xfa>
c0de717c:	f003 fdbc 	bl	c0deacf8 <pic>
c0de7180:	7f22      	ldrb	r2, [r4, #28]
c0de7182:	f894 3031 	ldrb.w	r3, [r4, #49]	@ 0x31
c0de7186:	4601      	mov	r1, r0
c0de7188:	4628      	mov	r0, r5
c0de718a:	f7fe fd14 	bl	c0de5bb6 <nbgl_layoutAddFooter>
c0de718e:	7d20      	ldrb	r0, [r4, #20]
c0de7190:	b1b0      	cbz	r0, c0de71c0 <nbgl_pageDrawInfo+0x12c>
c0de7192:	2801      	cmp	r0, #1
c0de7194:	d006      	beq.n	c0de71a4 <nbgl_pageDrawInfo+0x110>
c0de7196:	2802      	cmp	r0, #2
c0de7198:	d007      	beq.n	c0de71aa <nbgl_pageDrawInfo+0x116>
c0de719a:	2803      	cmp	r0, #3
c0de719c:	d136      	bne.n	c0de720c <nbgl_pageDrawInfo+0x178>
c0de719e:	482e      	ldr	r0, [pc, #184]	@ (c0de7258 <nbgl_pageDrawInfo+0x1c4>)
c0de71a0:	4478      	add	r0, pc
c0de71a2:	e004      	b.n	c0de71ae <nbgl_pageDrawInfo+0x11a>
c0de71a4:	482b      	ldr	r0, [pc, #172]	@ (c0de7254 <nbgl_pageDrawInfo+0x1c0>)
c0de71a6:	4478      	add	r0, pc
c0de71a8:	e001      	b.n	c0de71ae <nbgl_pageDrawInfo+0x11a>
c0de71aa:	482c      	ldr	r0, [pc, #176]	@ (c0de725c <nbgl_pageDrawInfo+0x1c8>)
c0de71ac:	4478      	add	r0, pc
c0de71ae:	f003 fda3 	bl	c0deacf8 <pic>
c0de71b2:	7da2      	ldrb	r2, [r4, #22]
c0de71b4:	f894 3031 	ldrb.w	r3, [r4, #49]	@ 0x31
c0de71b8:	4601      	mov	r1, r0
c0de71ba:	4628      	mov	r0, r5
c0de71bc:	f7fc fd52 	bl	c0de3c64 <nbgl_layoutAddTopRightButton>
c0de71c0:	7d60      	ldrb	r0, [r4, #21]
c0de71c2:	b3c0      	cbz	r0, c0de7236 <nbgl_pageDrawInfo+0x1a2>
c0de71c4:	2801      	cmp	r0, #1
c0de71c6:	d023      	beq.n	c0de7210 <nbgl_pageDrawInfo+0x17c>
c0de71c8:	2802      	cmp	r0, #2
c0de71ca:	d024      	beq.n	c0de7216 <nbgl_pageDrawInfo+0x182>
c0de71cc:	2803      	cmp	r0, #3
c0de71ce:	d025      	beq.n	c0de721c <nbgl_pageDrawInfo+0x188>
c0de71d0:	2804      	cmp	r0, #4
c0de71d2:	d11b      	bne.n	c0de720c <nbgl_pageDrawInfo+0x178>
c0de71d4:	6aa0      	ldr	r0, [r4, #40]	@ 0x28
c0de71d6:	b3a0      	cbz	r0, c0de7242 <nbgl_pageDrawInfo+0x1ae>
c0de71d8:	4922      	ldr	r1, [pc, #136]	@ (c0de7264 <nbgl_pageDrawInfo+0x1d0>)
c0de71da:	4479      	add	r1, pc
c0de71dc:	e9cd 0101 	strd	r0, r1, [sp, #4]
c0de71e0:	6ae0      	ldr	r0, [r4, #44]	@ 0x2c
c0de71e2:	2102      	movs	r1, #2
c0de71e4:	9003      	str	r0, [sp, #12]
c0de71e6:	7de0      	ldrb	r0, [r4, #23]
c0de71e8:	f88d 0010 	strb.w	r0, [sp, #16]
c0de71ec:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de71f0:	f88d 0012 	strb.w	r0, [sp, #18]
c0de71f4:	f894 0030 	ldrb.w	r0, [r4, #48]	@ 0x30
c0de71f8:	2800      	cmp	r0, #0
c0de71fa:	bf08      	it	eq
c0de71fc:	2101      	moveq	r1, #1
c0de71fe:	f88d 1011 	strb.w	r1, [sp, #17]
c0de7202:	4628      	mov	r0, r5
c0de7204:	a901      	add	r1, sp, #4
c0de7206:	f7fe fa15 	bl	c0de5634 <nbgl_layoutAddChoiceButtons>
c0de720a:	e014      	b.n	c0de7236 <nbgl_pageDrawInfo+0x1a2>
c0de720c:	2500      	movs	r5, #0
c0de720e:	e015      	b.n	c0de723c <nbgl_pageDrawInfo+0x1a8>
c0de7210:	4813      	ldr	r0, [pc, #76]	@ (c0de7260 <nbgl_pageDrawInfo+0x1cc>)
c0de7212:	4478      	add	r0, pc
c0de7214:	e004      	b.n	c0de7220 <nbgl_pageDrawInfo+0x18c>
c0de7216:	4816      	ldr	r0, [pc, #88]	@ (c0de7270 <nbgl_pageDrawInfo+0x1dc>)
c0de7218:	4478      	add	r0, pc
c0de721a:	e001      	b.n	c0de7220 <nbgl_pageDrawInfo+0x18c>
c0de721c:	4813      	ldr	r0, [pc, #76]	@ (c0de726c <nbgl_pageDrawInfo+0x1d8>)
c0de721e:	4478      	add	r0, pc
c0de7220:	f003 fd6a 	bl	c0deacf8 <pic>
c0de7224:	4601      	mov	r1, r0
c0de7226:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de722a:	7de2      	ldrb	r2, [r4, #23]
c0de722c:	2300      	movs	r3, #0
c0de722e:	9000      	str	r0, [sp, #0]
c0de7230:	4628      	mov	r0, r5
c0de7232:	f7fd f8dd 	bl	c0de43f0 <nbgl_layoutAddBottomButton>
c0de7236:	4628      	mov	r0, r5
c0de7238:	f7ff f946 	bl	c0de64c8 <nbgl_layoutDraw>
c0de723c:	4628      	mov	r0, r5
c0de723e:	b00c      	add	sp, #48	@ 0x30
c0de7240:	bd70      	pop	{r4, r5, r6, pc}
c0de7242:	7de2      	ldrb	r2, [r4, #23]
c0de7244:	f894 3031 	ldrb.w	r3, [r4, #49]	@ 0x31
c0de7248:	4907      	ldr	r1, [pc, #28]	@ (c0de7268 <nbgl_pageDrawInfo+0x1d4>)
c0de724a:	4628      	mov	r0, r5
c0de724c:	4479      	add	r1, pc
c0de724e:	f7fe fcb2 	bl	c0de5bb6 <nbgl_layoutAddFooter>
c0de7252:	e7f0      	b.n	c0de7236 <nbgl_pageDrawInfo+0x1a2>
c0de7254:	0000537a 	.word	0x0000537a
c0de7258:	00004e92 	.word	0x00004e92
c0de725c:	00004e43 	.word	0x00004e43
c0de7260:	0000530e 	.word	0x0000530e
c0de7264:	00005d26 	.word	0x00005d26
c0de7268:	00005cb4 	.word	0x00005cb4
c0de726c:	00004e14 	.word	0x00004e14
c0de7270:	00004dd7 	.word	0x00004dd7

c0de7274 <nbgl_pageDrawConfirmation>:
c0de7274:	b5b0      	push	{r4, r5, r7, lr}
c0de7276:	b08c      	sub	sp, #48	@ 0x30
c0de7278:	4605      	mov	r5, r0
c0de727a:	6948      	ldr	r0, [r1, #20]
c0de727c:	460c      	mov	r4, r1
c0de727e:	f003 fd3b 	bl	c0deacf8 <pic>
c0de7282:	9001      	str	r0, [sp, #4]
c0de7284:	69a0      	ldr	r0, [r4, #24]
c0de7286:	b110      	cbz	r0, c0de728e <nbgl_pageDrawConfirmation+0x1a>
c0de7288:	f003 fd36 	bl	c0deacf8 <pic>
c0de728c:	e001      	b.n	c0de7292 <nbgl_pageDrawConfirmation+0x1e>
c0de728e:	4815      	ldr	r0, [pc, #84]	@ (c0de72e4 <nbgl_pageDrawConfirmation+0x70>)
c0de7290:	4478      	add	r0, pc
c0de7292:	2100      	movs	r1, #0
c0de7294:	7fe2      	ldrb	r2, [r4, #31]
c0de7296:	9508      	str	r5, [sp, #32]
c0de7298:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de729c:	2001      	movs	r0, #1
c0de729e:	f88d 1011 	strb.w	r1, [sp, #17]
c0de72a2:	9109      	str	r1, [sp, #36]	@ 0x24
c0de72a4:	9106      	str	r1, [sp, #24]
c0de72a6:	7fa1      	ldrb	r1, [r4, #30]
c0de72a8:	f88d 0015 	strb.w	r0, [sp, #21]
c0de72ac:	7f20      	ldrb	r0, [r4, #28]
c0de72ae:	f88d 2014 	strb.w	r2, [sp, #20]
c0de72b2:	f88d 1012 	strb.w	r1, [sp, #18]
c0de72b6:	f88d 0010 	strb.w	r0, [sp, #16]
c0de72ba:	a805      	add	r0, sp, #20
c0de72bc:	f7fb ff0a 	bl	c0de30d4 <nbgl_layoutGet>
c0de72c0:	2140      	movs	r1, #64	@ 0x40
c0de72c2:	4605      	mov	r5, r0
c0de72c4:	f7ff fedc 	bl	c0de7080 <addEmptyHeader>
c0de72c8:	a901      	add	r1, sp, #4
c0de72ca:	4628      	mov	r0, r5
c0de72cc:	f7fe f9b2 	bl	c0de5634 <nbgl_layoutAddChoiceButtons>
c0de72d0:	4628      	mov	r0, r5
c0de72d2:	4621      	mov	r1, r4
c0de72d4:	f7fd fe04 	bl	c0de4ee0 <nbgl_layoutAddCenteredInfo>
c0de72d8:	4628      	mov	r0, r5
c0de72da:	f7ff f8f5 	bl	c0de64c8 <nbgl_layoutDraw>
c0de72de:	4628      	mov	r0, r5
c0de72e0:	b00c      	add	sp, #48	@ 0x30
c0de72e2:	bdb0      	pop	{r4, r5, r7, pc}
c0de72e4:	000057bf 	.word	0x000057bf

c0de72e8 <nbgl_pageDrawGenericContentExt>:
c0de72e8:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de72ec:	b096      	sub	sp, #88	@ 0x58
c0de72ee:	460e      	mov	r6, r1
c0de72f0:	2100      	movs	r1, #0
c0de72f2:	4615      	mov	r5, r2
c0de72f4:	f88d 3008 	strb.w	r3, [sp, #8]
c0de72f8:	e9cd 0105 	strd	r0, r1, [sp, #20]
c0de72fc:	2001      	movs	r0, #1
c0de72fe:	f88d 0009 	strb.w	r0, [sp, #9]
c0de7302:	b10e      	cbz	r6, c0de7308 <nbgl_pageDrawGenericContentExt+0x20>
c0de7304:	78f0      	ldrb	r0, [r6, #3]
c0de7306:	b108      	cbz	r0, c0de730c <nbgl_pageDrawGenericContentExt+0x24>
c0de7308:	9103      	str	r1, [sp, #12]
c0de730a:	e007      	b.n	c0de731c <nbgl_pageDrawGenericContentExt+0x34>
c0de730c:	6970      	ldr	r0, [r6, #20]
c0de730e:	7cb1      	ldrb	r1, [r6, #18]
c0de7310:	9003      	str	r0, [sp, #12]
c0de7312:	7970      	ldrb	r0, [r6, #5]
c0de7314:	f88d 1010 	strb.w	r1, [sp, #16]
c0de7318:	f88d 0011 	strb.w	r0, [sp, #17]
c0de731c:	a802      	add	r0, sp, #8
c0de731e:	f7fb fed9 	bl	c0de30d4 <nbgl_layoutGet>
c0de7322:	4682      	mov	sl, r0
c0de7324:	b17e      	cbz	r6, c0de7346 <nbgl_pageDrawGenericContentExt+0x5e>
c0de7326:	78f0      	ldrb	r0, [r6, #3]
c0de7328:	2801      	cmp	r0, #1
c0de732a:	d011      	beq.n	c0de7350 <nbgl_pageDrawGenericContentExt+0x68>
c0de732c:	b958      	cbnz	r0, c0de7346 <nbgl_pageDrawGenericContentExt+0x5e>
c0de732e:	68b3      	ldr	r3, [r6, #8]
c0de7330:	78b2      	ldrb	r2, [r6, #2]
c0de7332:	69b1      	ldr	r1, [r6, #24]
c0de7334:	b323      	cbz	r3, c0de7380 <nbgl_pageDrawGenericContentExt+0x98>
c0de7336:	7970      	ldrb	r0, [r6, #5]
c0de7338:	7b34      	ldrb	r4, [r6, #12]
c0de733a:	e9cd 4000 	strd	r4, r0, [sp]
c0de733e:	4650      	mov	r0, sl
c0de7340:	f7fe fc4b 	bl	c0de5bda <nbgl_layoutAddSplitFooter>
c0de7344:	e020      	b.n	c0de7388 <nbgl_pageDrawGenericContentExt+0xa0>
c0de7346:	f04f 0800 	mov.w	r8, #0
c0de734a:	f44f 7716 	mov.w	r7, #600	@ 0x258
c0de734e:	e07e      	b.n	c0de744e <nbgl_pageDrawGenericContentExt+0x166>
c0de7350:	68b0      	ldr	r0, [r6, #8]
c0de7352:	2800      	cmp	r0, #0
c0de7354:	4680      	mov	r8, r0
c0de7356:	bf18      	it	ne
c0de7358:	f04f 0801 	movne.w	r8, #1
c0de735c:	d027      	beq.n	c0de73ae <nbgl_pageDrawGenericContentExt+0xc6>
c0de735e:	900e      	str	r0, [sp, #56]	@ 0x38
c0de7360:	2006      	movs	r0, #6
c0de7362:	7b31      	ldrb	r1, [r6, #12]
c0de7364:	f8ad 0034 	strh.w	r0, [sp, #52]	@ 0x34
c0de7368:	7970      	ldrb	r0, [r6, #5]
c0de736a:	f88d 103c 	strb.w	r1, [sp, #60]	@ 0x3c
c0de736e:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de7372:	a90d      	add	r1, sp, #52	@ 0x34
c0de7374:	4650      	mov	r0, sl
c0de7376:	f7fe fc45 	bl	c0de5c04 <nbgl_layoutAddHeader>
c0de737a:	f5c0 7716 	rsb	r7, r0, #600	@ 0x258
c0de737e:	e018      	b.n	c0de73b2 <nbgl_pageDrawGenericContentExt+0xca>
c0de7380:	7973      	ldrb	r3, [r6, #5]
c0de7382:	4650      	mov	r0, sl
c0de7384:	f7fe fc17 	bl	c0de5bb6 <nbgl_layoutAddFooter>
c0de7388:	f5c0 7716 	rsb	r7, r0, #600	@ 0x258
c0de738c:	7930      	ldrb	r0, [r6, #4]
c0de738e:	2800      	cmp	r0, #0
c0de7390:	d042      	beq.n	c0de7418 <nbgl_pageDrawGenericContentExt+0x130>
c0de7392:	7c70      	ldrb	r0, [r6, #17]
c0de7394:	7974      	ldrb	r4, [r6, #5]
c0de7396:	7831      	ldrb	r1, [r6, #0]
c0de7398:	7872      	ldrb	r2, [r6, #1]
c0de739a:	7c33      	ldrb	r3, [r6, #16]
c0de739c:	e9cd 0400 	strd	r0, r4, [sp]
c0de73a0:	4650      	mov	r0, sl
c0de73a2:	f7fe fe73 	bl	c0de608c <nbgl_layoutAddProgressIndicator>
c0de73a6:	1a3f      	subs	r7, r7, r0
c0de73a8:	f04f 0801 	mov.w	r8, #1
c0de73ac:	e04f      	b.n	c0de744e <nbgl_pageDrawGenericContentExt+0x166>
c0de73ae:	f44f 7716 	mov.w	r7, #600	@ 0x258
c0de73b2:	2001      	movs	r0, #1
c0de73b4:	f88d 0035 	strb.w	r0, [sp, #53]	@ 0x35
c0de73b8:	7870      	ldrb	r0, [r6, #1]
c0de73ba:	2802      	cmp	r0, #2
c0de73bc:	d31c      	bcc.n	c0de73f8 <nbgl_pageDrawGenericContentExt+0x110>
c0de73be:	6971      	ldr	r1, [r6, #20]
c0de73c0:	b369      	cbz	r1, c0de741e <nbgl_pageDrawGenericContentExt+0x136>
c0de73c2:	f88d 0039 	strb.w	r0, [sp, #57]	@ 0x39
c0de73c6:	2001      	movs	r0, #1
c0de73c8:	9111      	str	r1, [sp, #68]	@ 0x44
c0de73ca:	2103      	movs	r1, #3
c0de73cc:	7972      	ldrb	r2, [r6, #5]
c0de73ce:	f000 f9c9 	bl	c0de7764 <OUTLINED_FUNCTION_3>
c0de73d2:	2100      	movs	r1, #0
c0de73d4:	f88d 103b 	strb.w	r1, [sp, #59]	@ 0x3b
c0de73d8:	78b1      	ldrb	r1, [r6, #2]
c0de73da:	f88d 2049 	strb.w	r2, [sp, #73]	@ 0x49
c0de73de:	f88d 303c 	strb.w	r3, [sp, #60]	@ 0x3c
c0de73e2:	f88d 2040 	strb.w	r2, [sp, #64]	@ 0x40
c0de73e6:	f88d 003a 	strb.w	r0, [sp, #58]	@ 0x3a
c0de73ea:	7cb0      	ldrb	r0, [r6, #18]
c0de73ec:	f88d 1048 	strb.w	r1, [sp, #72]	@ 0x48
c0de73f0:	f88d 003f 	strb.w	r0, [sp, #63]	@ 0x3f
c0de73f4:	7cf0      	ldrb	r0, [r6, #19]
c0de73f6:	e023      	b.n	c0de7440 <nbgl_pageDrawGenericContentExt+0x158>
c0de73f8:	6970      	ldr	r0, [r6, #20]
c0de73fa:	b340      	cbz	r0, c0de744e <nbgl_pageDrawGenericContentExt+0x166>
c0de73fc:	2100      	movs	r1, #0
c0de73fe:	900e      	str	r0, [sp, #56]	@ 0x38
c0de7400:	2001      	movs	r0, #1
c0de7402:	f88d 103c 	strb.w	r1, [sp, #60]	@ 0x3c
c0de7406:	f88d 0034 	strb.w	r0, [sp, #52]	@ 0x34
c0de740a:	78b0      	ldrb	r0, [r6, #2]
c0de740c:	7971      	ldrb	r1, [r6, #5]
c0de740e:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de7412:	f88d 103e 	strb.w	r1, [sp, #62]	@ 0x3e
c0de7416:	e015      	b.n	c0de7444 <nbgl_pageDrawGenericContentExt+0x15c>
c0de7418:	f04f 0800 	mov.w	r8, #0
c0de741c:	e017      	b.n	c0de744e <nbgl_pageDrawGenericContentExt+0x166>
c0de741e:	f88d 0039 	strb.w	r0, [sp, #57]	@ 0x39
c0de7422:	2000      	movs	r0, #0
c0de7424:	2104      	movs	r1, #4
c0de7426:	7c32      	ldrb	r2, [r6, #16]
c0de7428:	f000 f99c 	bl	c0de7764 <OUTLINED_FUNCTION_3>
c0de742c:	7971      	ldrb	r1, [r6, #5]
c0de742e:	f88d 203b 	strb.w	r2, [sp, #59]	@ 0x3b
c0de7432:	f88d 303c 	strb.w	r3, [sp, #60]	@ 0x3c
c0de7436:	f88d 003a 	strb.w	r0, [sp, #58]	@ 0x3a
c0de743a:	7cf0      	ldrb	r0, [r6, #19]
c0de743c:	f88d 1040 	strb.w	r1, [sp, #64]	@ 0x40
c0de7440:	f88d 0038 	strb.w	r0, [sp, #56]	@ 0x38
c0de7444:	a90d      	add	r1, sp, #52	@ 0x34
c0de7446:	4650      	mov	r0, sl
c0de7448:	f7fc fc48 	bl	c0de3cdc <nbgl_layoutAddExtendedFooter>
c0de744c:	1a3f      	subs	r7, r7, r0
c0de744e:	6828      	ldr	r0, [r5, #0]
c0de7450:	b190      	cbz	r0, c0de7478 <nbgl_pageDrawGenericContentExt+0x190>
c0de7452:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de7454:	2000      	movs	r0, #0
c0de7456:	79a9      	ldrb	r1, [r5, #6]
c0de7458:	900e      	str	r0, [sp, #56]	@ 0x38
c0de745a:	f240 1001 	movw	r0, #257	@ 0x101
c0de745e:	f8ad 0034 	strh.w	r0, [sp, #52]	@ 0x34
c0de7462:	7968      	ldrb	r0, [r5, #5]
c0de7464:	f88d 1041 	strb.w	r1, [sp, #65]	@ 0x41
c0de7468:	f88d 0040 	strb.w	r0, [sp, #64]	@ 0x40
c0de746c:	a90d      	add	r1, sp, #52	@ 0x34
c0de746e:	4650      	mov	r0, sl
c0de7470:	f7fe fbc8 	bl	c0de5c04 <nbgl_layoutAddHeader>
c0de7474:	f04f 0801 	mov.w	r8, #1
c0de7478:	68a9      	ldr	r1, [r5, #8]
c0de747a:	b121      	cbz	r1, c0de7486 <nbgl_pageDrawGenericContentExt+0x19e>
c0de747c:	79ab      	ldrb	r3, [r5, #6]
c0de747e:	79ea      	ldrb	r2, [r5, #7]
c0de7480:	4650      	mov	r0, sl
c0de7482:	f7fc fbef 	bl	c0de3c64 <nbgl_layoutAddTopRightButton>
c0de7486:	7b28      	ldrb	r0, [r5, #12]
c0de7488:	2800      	cmp	r0, #0
c0de748a:	d044      	beq.n	c0de7516 <nbgl_pageDrawGenericContentExt+0x22e>
c0de748c:	2801      	cmp	r0, #1
c0de748e:	d04d      	beq.n	c0de752c <nbgl_pageDrawGenericContentExt+0x244>
c0de7490:	2802      	cmp	r0, #2
c0de7492:	d067      	beq.n	c0de7564 <nbgl_pageDrawGenericContentExt+0x27c>
c0de7494:	2803      	cmp	r0, #3
c0de7496:	d075      	beq.n	c0de7584 <nbgl_pageDrawGenericContentExt+0x29c>
c0de7498:	2804      	cmp	r0, #4
c0de749a:	f000 8090 	beq.w	c0de75be <nbgl_pageDrawGenericContentExt+0x2d6>
c0de749e:	2805      	cmp	r0, #5
c0de74a0:	f000 8095 	beq.w	c0de75ce <nbgl_pageDrawGenericContentExt+0x2e6>
c0de74a4:	2806      	cmp	r0, #6
c0de74a6:	f000 80ab 	beq.w	c0de7600 <nbgl_pageDrawGenericContentExt+0x318>
c0de74aa:	2807      	cmp	r0, #7
c0de74ac:	f000 80db 	beq.w	c0de7666 <nbgl_pageDrawGenericContentExt+0x37e>
c0de74b0:	2808      	cmp	r0, #8
c0de74b2:	f000 80ec 	beq.w	c0de768e <nbgl_pageDrawGenericContentExt+0x3a6>
c0de74b6:	2809      	cmp	r0, #9
c0de74b8:	f000 8114 	beq.w	c0de76e4 <nbgl_pageDrawGenericContentExt+0x3fc>
c0de74bc:	280a      	cmp	r0, #10
c0de74be:	f040 8116 	bne.w	c0de76ee <nbgl_pageDrawGenericContentExt+0x406>
c0de74c2:	489b      	ldr	r0, [pc, #620]	@ (c0de7730 <nbgl_pageDrawGenericContentExt+0x448>)
c0de74c4:	2400      	movs	r4, #0
c0de74c6:	f10d 0834 	add.w	r8, sp, #52	@ 0x34
c0de74ca:	2600      	movs	r6, #0
c0de74cc:	4478      	add	r0, pc
c0de74ce:	4683      	mov	fp, r0
c0de74d0:	7e28      	ldrb	r0, [r5, #24]
c0de74d2:	4286      	cmp	r6, r0
c0de74d4:	f080 810b 	bcs.w	c0de76ee <nbgl_pageDrawGenericContentExt+0x406>
c0de74d8:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de74dc:	f850 0026 	ldr.w	r0, [r0, r6, lsl #2]
c0de74e0:	e9cd b40f 	strd	fp, r4, [sp, #60]	@ 0x3c
c0de74e4:	e9cd 400d 	strd	r4, r0, [sp, #52]	@ 0x34
c0de74e8:	5d88      	ldrb	r0, [r1, r6]
c0de74ea:	4641      	mov	r1, r8
c0de74ec:	f88d 4046 	strb.w	r4, [sp, #70]	@ 0x46
c0de74f0:	f88d 4044 	strb.w	r4, [sp, #68]	@ 0x44
c0de74f4:	f88d 0045 	strb.w	r0, [sp, #69]	@ 0x45
c0de74f8:	7e68      	ldrb	r0, [r5, #25]
c0de74fa:	f88d 0048 	strb.w	r0, [sp, #72]	@ 0x48
c0de74fe:	4650      	mov	r0, sl
c0de7500:	f7fc ff95 	bl	c0de442e <nbgl_layoutAddTouchableBar>
c0de7504:	1a3f      	subs	r7, r7, r0
c0de7506:	b2b8      	uxth	r0, r7
c0de7508:	280b      	cmp	r0, #11
c0de750a:	d302      	bcc.n	c0de7512 <nbgl_pageDrawGenericContentExt+0x22a>
c0de750c:	4650      	mov	r0, sl
c0de750e:	f7fe fa4f 	bl	c0de59b0 <nbgl_layoutAddSeparationLine>
c0de7512:	3601      	adds	r6, #1
c0de7514:	e7dc      	b.n	c0de74d0 <nbgl_pageDrawGenericContentExt+0x1e8>
c0de7516:	f1b8 0f00 	cmp.w	r8, #0
c0de751a:	d101      	bne.n	c0de7520 <nbgl_pageDrawGenericContentExt+0x238>
c0de751c:	f000 f90f 	bl	c0de773e <OUTLINED_FUNCTION_0>
c0de7520:	f105 0110 	add.w	r1, r5, #16
c0de7524:	4650      	mov	r0, sl
c0de7526:	f7fd fcdb 	bl	c0de4ee0 <nbgl_layoutAddCenteredInfo>
c0de752a:	e0e0      	b.n	c0de76ee <nbgl_pageDrawGenericContentExt+0x406>
c0de752c:	f1b8 0f00 	cmp.w	r8, #0
c0de7530:	d101      	bne.n	c0de7536 <nbgl_pageDrawGenericContentExt+0x24e>
c0de7532:	f000 f904 	bl	c0de773e <OUTLINED_FUNCTION_0>
c0de7536:	f105 0110 	add.w	r1, r5, #16
c0de753a:	4650      	mov	r0, sl
c0de753c:	f7fd fefe 	bl	c0de533c <nbgl_layoutAddContentCenter>
c0de7540:	6b68      	ldr	r0, [r5, #52]	@ 0x34
c0de7542:	2800      	cmp	r0, #0
c0de7544:	f000 80d3 	beq.w	c0de76ee <nbgl_pageDrawGenericContentExt+0x406>
c0de7548:	900e      	str	r0, [sp, #56]	@ 0x38
c0de754a:	2003      	movs	r0, #3
c0de754c:	f88d 0034 	strb.w	r0, [sp, #52]	@ 0x34
c0de7550:	6ba8      	ldr	r0, [r5, #56]	@ 0x38
c0de7552:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de7554:	8fa8      	ldrh	r0, [r5, #60]	@ 0x3c
c0de7556:	f8ad 0040 	strh.w	r0, [sp, #64]	@ 0x40
c0de755a:	a90d      	add	r1, sp, #52	@ 0x34
c0de755c:	4650      	mov	r0, sl
c0de755e:	f7fc f815 	bl	c0de358c <nbgl_layoutAddUpFooter>
c0de7562:	e0c4      	b.n	c0de76ee <nbgl_pageDrawGenericContentExt+0x406>
c0de7564:	ae0d      	add	r6, sp, #52	@ 0x34
c0de7566:	2124      	movs	r1, #36	@ 0x24
c0de7568:	4630      	mov	r0, r6
c0de756a:	f003 fde7 	bl	c0deb13c <__aeabi_memclr>
c0de756e:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de7572:	f000 f8f1 	bl	c0de7758 <OUTLINED_FUNCTION_2>
c0de7576:	69a9      	ldr	r1, [r5, #24]
c0de7578:	7f6b      	ldrb	r3, [r5, #29]
c0de757a:	7f2a      	ldrb	r2, [r5, #28]
c0de757c:	4650      	mov	r0, sl
c0de757e:	f7fe fb08 	bl	c0de5b92 <nbgl_layoutAddLongPressButton>
c0de7582:	e0b4      	b.n	c0de76ee <nbgl_pageDrawGenericContentExt+0x406>
c0de7584:	ae0d      	add	r6, sp, #52	@ 0x34
c0de7586:	2124      	movs	r1, #36	@ 0x24
c0de7588:	4630      	mov	r0, r6
c0de758a:	f003 fdd7 	bl	c0deb13c <__aeabi_memclr>
c0de758e:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de7592:	2400      	movs	r4, #0
c0de7594:	f88d 4034 	strb.w	r4, [sp, #52]	@ 0x34
c0de7598:	f000 f8de 	bl	c0de7758 <OUTLINED_FUNCTION_2>
c0de759c:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0de75a0:	940a      	str	r4, [sp, #40]	@ 0x28
c0de75a2:	f88d 402d 	strb.w	r4, [sp, #45]	@ 0x2d
c0de75a6:	f8ad 002e 	strh.w	r0, [sp, #46]	@ 0x2e
c0de75aa:	69a8      	ldr	r0, [r5, #24]
c0de75ac:	9009      	str	r0, [sp, #36]	@ 0x24
c0de75ae:	7f28      	ldrb	r0, [r5, #28]
c0de75b0:	f88d 002c 	strb.w	r0, [sp, #44]	@ 0x2c
c0de75b4:	7f68      	ldrb	r0, [r5, #29]
c0de75b6:	f88d 0030 	strb.w	r0, [sp, #48]	@ 0x30
c0de75ba:	a909      	add	r1, sp, #36	@ 0x24
c0de75bc:	e04f      	b.n	c0de765e <nbgl_pageDrawGenericContentExt+0x376>
c0de75be:	f1b8 0f00 	cmp.w	r8, #0
c0de75c2:	d101      	bne.n	c0de75c8 <nbgl_pageDrawGenericContentExt+0x2e0>
c0de75c4:	f000 f8bb 	bl	c0de773e <OUTLINED_FUNCTION_0>
c0de75c8:	f000 f8da 	bl	c0de7780 <OUTLINED_FUNCTION_5>
c0de75cc:	e08f      	b.n	c0de76ee <nbgl_pageDrawGenericContentExt+0x406>
c0de75ce:	f1b8 0f00 	cmp.w	r8, #0
c0de75d2:	d101      	bne.n	c0de75d8 <nbgl_pageDrawGenericContentExt+0x2f0>
c0de75d4:	f000 f8b3 	bl	c0de773e <OUTLINED_FUNCTION_0>
c0de75d8:	7ea8      	ldrb	r0, [r5, #26]
c0de75da:	f105 0110 	add.w	r1, r5, #16
c0de75de:	3803      	subs	r0, #3
c0de75e0:	76a8      	strb	r0, [r5, #26]
c0de75e2:	4650      	mov	r0, sl
c0de75e4:	f7fe f850 	bl	c0de5688 <nbgl_layoutAddTagValueList>
c0de75e8:	2001      	movs	r0, #1
c0de75ea:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de75ee:	f8ad 003e 	strh.w	r0, [sp, #62]	@ 0x3e
c0de75f2:	e9d5 0109 	ldrd	r0, r1, [r5, #36]	@ 0x24
c0de75f6:	e9cd 100d 	strd	r1, r0, [sp, #52]	@ 0x34
c0de75fa:	f000 f8ba 	bl	c0de7772 <OUTLINED_FUNCTION_4>
c0de75fe:	e02b      	b.n	c0de7658 <nbgl_pageDrawGenericContentExt+0x370>
c0de7600:	f1b8 0f00 	cmp.w	r8, #0
c0de7604:	d101      	bne.n	c0de760a <nbgl_pageDrawGenericContentExt+0x322>
c0de7606:	f000 f89a 	bl	c0de773e <OUTLINED_FUNCTION_0>
c0de760a:	f000 f8b9 	bl	c0de7780 <OUTLINED_FUNCTION_5>
c0de760e:	6aa8      	ldr	r0, [r5, #40]	@ 0x28
c0de7610:	2800      	cmp	r0, #0
c0de7612:	d073      	beq.n	c0de76fc <nbgl_pageDrawGenericContentExt+0x414>
c0de7614:	900d      	str	r0, [sp, #52]	@ 0x34
c0de7616:	6a68      	ldr	r0, [r5, #36]	@ 0x24
c0de7618:	2101      	movs	r1, #1
c0de761a:	f8ad 103e 	strh.w	r1, [sp, #62]	@ 0x3e
c0de761e:	f88d 103d 	strb.w	r1, [sp, #61]	@ 0x3d
c0de7622:	900e      	str	r0, [sp, #56]	@ 0x38
c0de7624:	f000 f8a5 	bl	c0de7772 <OUTLINED_FUNCTION_4>
c0de7628:	f88d 0040 	strb.w	r0, [sp, #64]	@ 0x40
c0de762c:	a90d      	add	r1, sp, #52	@ 0x34
c0de762e:	4650      	mov	r0, sl
c0de7630:	f7fe f9d0 	bl	c0de59d4 <nbgl_layoutAddButton>
c0de7634:	6b28      	ldr	r0, [r5, #48]	@ 0x30
c0de7636:	2800      	cmp	r0, #0
c0de7638:	d059      	beq.n	c0de76ee <nbgl_pageDrawGenericContentExt+0x406>
c0de763a:	2100      	movs	r1, #0
c0de763c:	900d      	str	r0, [sp, #52]	@ 0x34
c0de763e:	f895 002d 	ldrb.w	r0, [r5, #45]	@ 0x2d
c0de7642:	f88d 103d 	strb.w	r1, [sp, #61]	@ 0x3d
c0de7646:	910e      	str	r1, [sp, #56]	@ 0x38
c0de7648:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de764c:	f8ad 103e 	strh.w	r1, [sp, #62]	@ 0x3e
c0de7650:	f895 1038 	ldrb.w	r1, [r5, #56]	@ 0x38
c0de7654:	f88d 103c 	strb.w	r1, [sp, #60]	@ 0x3c
c0de7658:	f88d 0040 	strb.w	r0, [sp, #64]	@ 0x40
c0de765c:	a90d      	add	r1, sp, #52	@ 0x34
c0de765e:	4650      	mov	r0, sl
c0de7660:	f7fe f9b8 	bl	c0de59d4 <nbgl_layoutAddButton>
c0de7664:	e043      	b.n	c0de76ee <nbgl_pageDrawGenericContentExt+0x406>
c0de7666:	2400      	movs	r4, #0
c0de7668:	2600      	movs	r6, #0
c0de766a:	7d28      	ldrb	r0, [r5, #20]
c0de766c:	4286      	cmp	r6, r0
c0de766e:	d23e      	bcs.n	c0de76ee <nbgl_pageDrawGenericContentExt+0x406>
c0de7670:	6928      	ldr	r0, [r5, #16]
c0de7672:	1901      	adds	r1, r0, r4
c0de7674:	4650      	mov	r0, sl
c0de7676:	f7fd f8db 	bl	c0de4830 <nbgl_layoutAddSwitch>
c0de767a:	1a3f      	subs	r7, r7, r0
c0de767c:	b2b8      	uxth	r0, r7
c0de767e:	280b      	cmp	r0, #11
c0de7680:	d302      	bcc.n	c0de7688 <nbgl_pageDrawGenericContentExt+0x3a0>
c0de7682:	4650      	mov	r0, sl
c0de7684:	f7fe f994 	bl	c0de59b0 <nbgl_layoutAddSeparationLine>
c0de7688:	340c      	adds	r4, #12
c0de768a:	3601      	adds	r6, #1
c0de768c:	e7ed      	b.n	c0de766a <nbgl_pageDrawGenericContentExt+0x382>
c0de768e:	2600      	movs	r6, #0
c0de7690:	2400      	movs	r4, #0
c0de7692:	7f28      	ldrb	r0, [r5, #28]
c0de7694:	4284      	cmp	r4, r0
c0de7696:	d22a      	bcs.n	c0de76ee <nbgl_pageDrawGenericContentExt+0x406>
c0de7698:	7fa8      	ldrb	r0, [r5, #30]
c0de769a:	b180      	cbz	r0, c0de76be <nbgl_pageDrawGenericContentExt+0x3d6>
c0de769c:	69a8      	ldr	r0, [r5, #24]
c0de769e:	b170      	cbz	r0, c0de76be <nbgl_pageDrawGenericContentExt+0x3d6>
c0de76a0:	5980      	ldr	r0, [r0, r6]
c0de76a2:	b160      	cbz	r0, c0de76be <nbgl_pageDrawGenericContentExt+0x3d6>
c0de76a4:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de76a8:	7f6b      	ldrb	r3, [r5, #29]
c0de76aa:	f851 2024 	ldr.w	r2, [r1, r4, lsl #2]
c0de76ae:	f850 1024 	ldr.w	r1, [r0, r4, lsl #2]
c0de76b2:	b2e0      	uxtb	r0, r4
c0de76b4:	9000      	str	r0, [sp, #0]
c0de76b6:	4650      	mov	r0, sl
c0de76b8:	f7fd fa24 	bl	c0de4b04 <nbgl_layoutAddTextWithAlias>
c0de76bc:	e008      	b.n	c0de76d0 <nbgl_pageDrawGenericContentExt+0x3e8>
c0de76be:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de76c2:	f851 2024 	ldr.w	r2, [r1, r4, lsl #2]
c0de76c6:	f850 1024 	ldr.w	r1, [r0, r4, lsl #2]
c0de76ca:	4650      	mov	r0, sl
c0de76cc:	f7fd f8d2 	bl	c0de4874 <nbgl_layoutAddText>
c0de76d0:	1a3f      	subs	r7, r7, r0
c0de76d2:	b2b8      	uxth	r0, r7
c0de76d4:	280b      	cmp	r0, #11
c0de76d6:	d302      	bcc.n	c0de76de <nbgl_pageDrawGenericContentExt+0x3f6>
c0de76d8:	4650      	mov	r0, sl
c0de76da:	f7fe f969 	bl	c0de59b0 <nbgl_layoutAddSeparationLine>
c0de76de:	3618      	adds	r6, #24
c0de76e0:	3401      	adds	r4, #1
c0de76e2:	e7d6      	b.n	c0de7692 <nbgl_pageDrawGenericContentExt+0x3aa>
c0de76e4:	f105 0110 	add.w	r1, r5, #16
c0de76e8:	4650      	mov	r0, sl
c0de76ea:	f7fd fad3 	bl	c0de4c94 <nbgl_layoutAddRadioChoice>
c0de76ee:	4650      	mov	r0, sl
c0de76f0:	f7fe feea 	bl	c0de64c8 <nbgl_layoutDraw>
c0de76f4:	4650      	mov	r0, sl
c0de76f6:	b016      	add	sp, #88	@ 0x58
c0de76f8:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de76fc:	6a68      	ldr	r0, [r5, #36]	@ 0x24
c0de76fe:	2800      	cmp	r0, #0
c0de7700:	d098      	beq.n	c0de7634 <nbgl_pageDrawGenericContentExt+0x34c>
c0de7702:	6b29      	ldr	r1, [r5, #48]	@ 0x30
c0de7704:	2900      	cmp	r1, #0
c0de7706:	d095      	beq.n	c0de7634 <nbgl_pageDrawGenericContentExt+0x34c>
c0de7708:	e9cd 010d 	strd	r0, r1, [sp, #52]	@ 0x34
c0de770c:	f895 002c 	ldrb.w	r0, [r5, #44]	@ 0x2c
c0de7710:	f895 102d 	ldrb.w	r1, [r5, #45]	@ 0x2d
c0de7714:	f895 2038 	ldrb.w	r2, [r5, #56]	@ 0x38
c0de7718:	f88d 003c 	strb.w	r0, [sp, #60]	@ 0x3c
c0de771c:	f88d 203d 	strb.w	r2, [sp, #61]	@ 0x3d
c0de7720:	f88d 103e 	strb.w	r1, [sp, #62]	@ 0x3e
c0de7724:	a90d      	add	r1, sp, #52	@ 0x34
c0de7726:	4650      	mov	r0, sl
c0de7728:	f7fd ff9a 	bl	c0de5660 <nbgl_layoutAddHorizontalButtons>
c0de772c:	e7df      	b.n	c0de76ee <nbgl_pageDrawGenericContentExt+0x406>
c0de772e:	bf00      	nop
c0de7730:	00004981 	.word	0x00004981

c0de7734 <nbgl_pageDrawGenericContent>:
c0de7734:	2300      	movs	r3, #0
c0de7736:	f7ff bdd7 	b.w	c0de72e8 <nbgl_pageDrawGenericContentExt>

c0de773a <nbgl_pageRelease>:
c0de773a:	f7fe bef3 	b.w	c0de6524 <nbgl_layoutRelease>

c0de773e <OUTLINED_FUNCTION_0>:
c0de773e:	4650      	mov	r0, sl
c0de7740:	2128      	movs	r1, #40	@ 0x28
c0de7742:	f7ff bc9d 	b.w	c0de7080 <addEmptyHeader>

c0de7746 <OUTLINED_FUNCTION_1>:
c0de7746:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de774a:	788a      	ldrb	r2, [r1, #2]
c0de774c:	78c9      	ldrb	r1, [r1, #3]
c0de774e:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de7752:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de7756:	4770      	bx	lr

c0de7758 <OUTLINED_FUNCTION_2>:
c0de7758:	910e      	str	r1, [sp, #56]	@ 0x38
c0de775a:	9011      	str	r0, [sp, #68]	@ 0x44
c0de775c:	4650      	mov	r0, sl
c0de775e:	4631      	mov	r1, r6
c0de7760:	f7fd bdec 	b.w	c0de533c <nbgl_layoutAddContentCenter>

c0de7764 <OUTLINED_FUNCTION_3>:
c0de7764:	7c73      	ldrb	r3, [r6, #17]
c0de7766:	f88d 003e 	strb.w	r0, [sp, #62]	@ 0x3e
c0de776a:	7830      	ldrb	r0, [r6, #0]
c0de776c:	f88d 1034 	strb.w	r1, [sp, #52]	@ 0x34
c0de7770:	4770      	bx	lr

c0de7772 <OUTLINED_FUNCTION_4>:
c0de7772:	f895 002c 	ldrb.w	r0, [r5, #44]	@ 0x2c
c0de7776:	f88d 003c 	strb.w	r0, [sp, #60]	@ 0x3c
c0de777a:	f895 002d 	ldrb.w	r0, [r5, #45]	@ 0x2d
c0de777e:	4770      	bx	lr

c0de7780 <OUTLINED_FUNCTION_5>:
c0de7780:	f105 0110 	add.w	r1, r5, #16
c0de7784:	4650      	mov	r0, sl
c0de7786:	f7fd bf7f 	b.w	c0de5688 <nbgl_layoutAddTagValueList>

c0de778a <getNbTagValuesInPage>:
c0de778a:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de778e:	4604      	mov	r4, r0
c0de7790:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de7792:	f04f 0800 	mov.w	r8, #0
c0de7796:	2b00      	cmp	r3, #0
c0de7798:	460e      	mov	r6, r1
c0de779a:	f04f 0b00 	mov.w	fp, #0
c0de779e:	f880 8000 	strb.w	r8, [r0]
c0de77a2:	f44f 70e8 	mov.w	r0, #464	@ 0x1d0
c0de77a6:	bf18      	it	ne
c0de77a8:	f44f 70cc 	movne.w	r0, #408	@ 0x198
c0de77ac:	0111      	lsls	r1, r2, #4
c0de77ae:	e9cd 2001 	strd	r2, r0, [sp, #4]
c0de77b2:	4544      	cmp	r4, r8
c0de77b4:	d052      	beq.n	c0de785c <getNbTagValuesInPage+0xd2>
c0de77b6:	465d      	mov	r5, fp
c0de77b8:	f10b 0a18 	add.w	sl, fp, #24
c0de77bc:	f1b8 0f00 	cmp.w	r8, #0
c0de77c0:	bf18      	it	ne
c0de77c2:	4655      	movne	r5, sl
c0de77c4:	6830      	ldr	r0, [r6, #0]
c0de77c6:	9103      	str	r1, [sp, #12]
c0de77c8:	b108      	cbz	r0, c0de77ce <getNbTagValuesInPage+0x44>
c0de77ca:	4408      	add	r0, r1
c0de77cc:	e004      	b.n	c0de77d8 <getNbTagValuesInPage+0x4e>
c0de77ce:	9801      	ldr	r0, [sp, #4]
c0de77d0:	6871      	ldr	r1, [r6, #4]
c0de77d2:	4440      	add	r0, r8
c0de77d4:	b2c0      	uxtb	r0, r0
c0de77d6:	4788      	blx	r1
c0de77d8:	f003 fa8e 	bl	c0deacf8 <pic>
c0de77dc:	4607      	mov	r7, r0
c0de77de:	7b00      	ldrb	r0, [r0, #12]
c0de77e0:	07c1      	lsls	r1, r0, #31
c0de77e2:	bf18      	it	ne
c0de77e4:	f1b8 0f00 	cmpne.w	r8, #0
c0de77e8:	d13b      	bne.n	c0de7862 <getNbTagValuesInPage+0xd8>
c0de77ea:	0780      	lsls	r0, r0, #30
c0de77ec:	d45d      	bmi.n	c0de78aa <getNbTagValuesInPage+0x120>
c0de77ee:	7b73      	ldrb	r3, [r6, #13]
c0de77f0:	6839      	ldr	r1, [r7, #0]
c0de77f2:	200b      	movs	r0, #11
c0de77f4:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de77f8:	46a2      	mov	sl, r4
c0de77fa:	f003 f8b5 	bl	c0dea968 <nbgl_getTextHeightInWidth>
c0de77fe:	182c      	adds	r4, r5, r0
c0de7800:	7b30      	ldrb	r0, [r6, #12]
c0de7802:	250b      	movs	r5, #11
c0de7804:	7b73      	ldrb	r3, [r6, #13]
c0de7806:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de780a:	2800      	cmp	r0, #0
c0de780c:	bf08      	it	eq
c0de780e:	250d      	moveq	r5, #13
c0de7810:	6879      	ldr	r1, [r7, #4]
c0de7812:	4628      	mov	r0, r5
c0de7814:	f003 f8a8 	bl	c0dea968 <nbgl_getTextHeightInWidth>
c0de7818:	4420      	add	r0, r4
c0de781a:	6879      	ldr	r1, [r7, #4]
c0de781c:	7b73      	ldrb	r3, [r6, #13]
c0de781e:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de7822:	f100 0b04 	add.w	fp, r0, #4
c0de7826:	4628      	mov	r0, r5
c0de7828:	fa1f f48b 	uxth.w	r4, fp
c0de782c:	f003 f8a1 	bl	c0dea972 <nbgl_getTextNbLinesInWidth>
c0de7830:	9902      	ldr	r1, [sp, #8]
c0de7832:	428c      	cmp	r4, r1
c0de7834:	bf38      	it	cc
c0de7836:	280a      	cmpcc	r0, #10
c0de7838:	d205      	bcs.n	c0de7846 <getNbTagValuesInPage+0xbc>
c0de783a:	9903      	ldr	r1, [sp, #12]
c0de783c:	f108 0801 	add.w	r8, r8, #1
c0de7840:	4654      	mov	r4, sl
c0de7842:	3110      	adds	r1, #16
c0de7844:	e7b5      	b.n	c0de77b2 <getNbTagValuesInPage+0x28>
c0de7846:	ea5f 6008 	movs.w	r0, r8, lsl #24
c0de784a:	d104      	bne.n	c0de7856 <getNbTagValuesInPage+0xcc>
c0de784c:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de784e:	f04f 0801 	mov.w	r8, #1
c0de7852:	f880 8000 	strb.w	r8, [r0]
c0de7856:	4654      	mov	r4, sl
c0de7858:	46da      	mov	sl, fp
c0de785a:	e003      	b.n	c0de7864 <getNbTagValuesInPage+0xda>
c0de785c:	46da      	mov	sl, fp
c0de785e:	46a0      	mov	r8, r4
c0de7860:	e000      	b.n	c0de7864 <getNbTagValuesInPage+0xda>
c0de7862:	46aa      	mov	sl, r5
c0de7864:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de7866:	b170      	cbz	r0, c0de7886 <getNbTagValuesInPage+0xfc>
c0de7868:	fa5f f088 	uxtb.w	r0, r8
c0de786c:	42a0      	cmp	r0, r4
c0de786e:	d10a      	bne.n	c0de7886 <getNbTagValuesInPage+0xfc>
c0de7870:	9902      	ldr	r1, [sp, #8]
c0de7872:	fa1f f08a 	uxth.w	r0, sl
c0de7876:	f501 71bc 	add.w	r1, r1, #376	@ 0x178
c0de787a:	f401 71ac 	and.w	r1, r1, #344	@ 0x158
c0de787e:	4281      	cmp	r1, r0
c0de7880:	bf38      	it	cc
c0de7882:	3c01      	subcc	r4, #1
c0de7884:	e00d      	b.n	c0de78a2 <getNbTagValuesInPage+0x118>
c0de7886:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de7888:	b150      	cbz	r0, c0de78a0 <getNbTagValuesInPage+0x116>
c0de788a:	9902      	ldr	r1, [sp, #8]
c0de788c:	fa1f f08a 	uxth.w	r0, sl
c0de7890:	f501 71e0 	add.w	r1, r1, #448	@ 0x1c0
c0de7894:	f401 71ec 	and.w	r1, r1, #472	@ 0x1d8
c0de7898:	4281      	cmp	r1, r0
c0de789a:	bf38      	it	cc
c0de789c:	f1a8 0801 	subcc.w	r8, r8, #1
c0de78a0:	4644      	mov	r4, r8
c0de78a2:	b2e0      	uxtb	r0, r4
c0de78a4:	b004      	add	sp, #16
c0de78a6:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de78aa:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de78ac:	f1b8 0f00 	cmp.w	r8, #0
c0de78b0:	d1d9      	bne.n	c0de7866 <getNbTagValuesInPage+0xdc>
c0de78b2:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de78b4:	f04f 0801 	mov.w	r8, #1
c0de78b8:	46da      	mov	sl, fp
c0de78ba:	f881 8000 	strb.w	r8, [r1]
c0de78be:	e7d2      	b.n	c0de7866 <getNbTagValuesInPage+0xdc>

c0de78c0 <nbgl_useCaseGetNbInfosInPage>:
c0de78c0:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de78c4:	f44f 74fc 	mov.w	r4, #504	@ 0x1f8
c0de78c8:	9001      	str	r0, [sp, #4]
c0de78ca:	9300      	str	r3, [sp, #0]
c0de78cc:	2b00      	cmp	r3, #0
c0de78ce:	4616      	mov	r6, r2
c0de78d0:	460f      	mov	r7, r1
c0de78d2:	bf18      	it	ne
c0de78d4:	f44f 74cc 	movne.w	r4, #408	@ 0x198
c0de78d8:	6808      	ldr	r0, [r1, #0]
c0de78da:	f003 fa0d 	bl	c0deacf8 <pic>
c0de78de:	eb00 0b86 	add.w	fp, r0, r6, lsl #2
c0de78e2:	6878      	ldr	r0, [r7, #4]
c0de78e4:	f003 fa08 	bl	c0deacf8 <pic>
c0de78e8:	eb00 0586 	add.w	r5, r0, r6, lsl #2
c0de78ec:	2700      	movs	r7, #0
c0de78ee:	f04f 0800 	mov.w	r8, #0
c0de78f2:	f04f 0a00 	mov.w	sl, #0
c0de78f6:	9801      	ldr	r0, [sp, #4]
c0de78f8:	42b8      	cmp	r0, r7
c0de78fa:	d01e      	beq.n	c0de793a <nbgl_useCaseGetNbInfosInPage+0x7a>
c0de78fc:	f85b 0027 	ldr.w	r0, [fp, r7, lsl #2]
c0de7900:	f003 f9fa 	bl	c0deacf8 <pic>
c0de7904:	4601      	mov	r1, r0
c0de7906:	200c      	movs	r0, #12
c0de7908:	f002 fb2b 	bl	c0de9f62 <OUTLINED_FUNCTION_2>
c0de790c:	4606      	mov	r6, r0
c0de790e:	f855 0027 	ldr.w	r0, [r5, r7, lsl #2]
c0de7912:	f003 f9f1 	bl	c0deacf8 <pic>
c0de7916:	4601      	mov	r1, r0
c0de7918:	200b      	movs	r0, #11
c0de791a:	f002 fb22 	bl	c0de9f62 <OUTLINED_FUNCTION_2>
c0de791e:	eb0a 0106 	add.w	r1, sl, r6
c0de7922:	4408      	add	r0, r1
c0de7924:	302a      	adds	r0, #42	@ 0x2a
c0de7926:	b280      	uxth	r0, r0
c0de7928:	f100 0a1a 	add.w	sl, r0, #26
c0de792c:	fa1f f08a 	uxth.w	r0, sl
c0de7930:	42a0      	cmp	r0, r4
c0de7932:	d204      	bcs.n	c0de793e <nbgl_useCaseGetNbInfosInPage+0x7e>
c0de7934:	3701      	adds	r7, #1
c0de7936:	4680      	mov	r8, r0
c0de7938:	e7dd      	b.n	c0de78f6 <nbgl_useCaseGetNbInfosInPage+0x36>
c0de793a:	9f01      	ldr	r7, [sp, #4]
c0de793c:	e006      	b.n	c0de794c <nbgl_useCaseGetNbInfosInPage+0x8c>
c0de793e:	9800      	ldr	r0, [sp, #0]
c0de7940:	b920      	cbnz	r0, c0de794c <nbgl_useCaseGetNbInfosInPage+0x8c>
c0de7942:	ea4f 00d8 	mov.w	r0, r8, lsr #3
c0de7946:	2832      	cmp	r0, #50	@ 0x32
c0de7948:	bf88      	it	hi
c0de794a:	3f01      	subhi	r7, #1
c0de794c:	b2f8      	uxtb	r0, r7
c0de794e:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de7952 <nbgl_useCaseGetNbSwitchesInPage>:
c0de7952:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de7956:	f44f 77fc 	mov.w	r7, #504	@ 0x1f8
c0de795a:	2b00      	cmp	r3, #0
c0de795c:	4682      	mov	sl, r0
c0de795e:	4698      	mov	r8, r3
c0de7960:	4616      	mov	r6, r2
c0de7962:	bf18      	it	ne
c0de7964:	f44f 77cc 	movne.w	r7, #408	@ 0x198
c0de7968:	6808      	ldr	r0, [r1, #0]
c0de796a:	f003 f9c5 	bl	c0deacf8 <pic>
c0de796e:	eb06 0146 	add.w	r1, r6, r6, lsl #1
c0de7972:	2600      	movs	r6, #0
c0de7974:	eb00 0081 	add.w	r0, r0, r1, lsl #2
c0de7978:	1d04      	adds	r4, r0, #4
c0de797a:	2000      	movs	r0, #0
c0de797c:	4605      	mov	r5, r0
c0de797e:	45b2      	cmp	sl, r6
c0de7980:	d010      	beq.n	c0de79a4 <nbgl_useCaseGetNbSwitchesInPage+0x52>
c0de7982:	6821      	ldr	r1, [r4, #0]
c0de7984:	b129      	cbz	r1, c0de7992 <nbgl_useCaseGetNbSwitchesInPage+0x40>
c0de7986:	200b      	movs	r0, #11
c0de7988:	f002 faeb 	bl	c0de9f62 <OUTLINED_FUNCTION_2>
c0de798c:	4428      	add	r0, r5
c0de798e:	3068      	adds	r0, #104	@ 0x68
c0de7990:	e001      	b.n	c0de7996 <nbgl_useCaseGetNbSwitchesInPage+0x44>
c0de7992:	f105 005c 	add.w	r0, r5, #92	@ 0x5c
c0de7996:	340c      	adds	r4, #12
c0de7998:	3601      	adds	r6, #1
c0de799a:	b281      	uxth	r1, r0
c0de799c:	428f      	cmp	r7, r1
c0de799e:	d8ed      	bhi.n	c0de797c <nbgl_useCaseGetNbSwitchesInPage+0x2a>
c0de79a0:	f1a6 0a01 	sub.w	sl, r6, #1
c0de79a4:	b2a8      	uxth	r0, r5
c0de79a6:	2100      	movs	r1, #0
c0de79a8:	08c0      	lsrs	r0, r0, #3
c0de79aa:	2832      	cmp	r0, #50	@ 0x32
c0de79ac:	bf88      	it	hi
c0de79ae:	2101      	movhi	r1, #1
c0de79b0:	ea21 0008 	bic.w	r0, r1, r8
c0de79b4:	ebaa 0000 	sub.w	r0, sl, r0
c0de79b8:	b2c0      	uxtb	r0, r0
c0de79ba:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}

c0de79be <nbgl_useCaseGetNbBarsInPage>:
c0de79be:	b570      	push	{r4, r5, r6, lr}
c0de79c0:	f44f 71fc 	mov.w	r1, #504	@ 0x1f8
c0de79c4:	2b00      	cmp	r3, #0
c0de79c6:	bf18      	it	ne
c0de79c8:	f44f 71cc 	movne.w	r1, #408	@ 0x198
c0de79cc:	2200      	movs	r2, #0
c0de79ce:	2400      	movs	r4, #0
c0de79d0:	2500      	movs	r5, #0
c0de79d2:	b2ee      	uxtb	r6, r5
c0de79d4:	4286      	cmp	r6, r0
c0de79d6:	d208      	bcs.n	c0de79ea <nbgl_useCaseGetNbBarsInPage+0x2c>
c0de79d8:	b292      	uxth	r2, r2
c0de79da:	325c      	adds	r2, #92	@ 0x5c
c0de79dc:	b296      	uxth	r6, r2
c0de79de:	428e      	cmp	r6, r1
c0de79e0:	d202      	bcs.n	c0de79e8 <nbgl_useCaseGetNbBarsInPage+0x2a>
c0de79e2:	3501      	adds	r5, #1
c0de79e4:	4634      	mov	r4, r6
c0de79e6:	e7f4      	b.n	c0de79d2 <nbgl_useCaseGetNbBarsInPage+0x14>
c0de79e8:	4628      	mov	r0, r5
c0de79ea:	08e1      	lsrs	r1, r4, #3
c0de79ec:	2200      	movs	r2, #0
c0de79ee:	2932      	cmp	r1, #50	@ 0x32
c0de79f0:	bf88      	it	hi
c0de79f2:	2201      	movhi	r2, #1
c0de79f4:	ea22 0103 	bic.w	r1, r2, r3
c0de79f8:	1a40      	subs	r0, r0, r1
c0de79fa:	b2c0      	uxtb	r0, r0
c0de79fc:	bd70      	pop	{r4, r5, r6, pc}

c0de79fe <nbgl_useCaseGetNbChoicesInPage>:
c0de79fe:	b570      	push	{r4, r5, r6, lr}
c0de7a00:	f44f 72fc 	mov.w	r2, #504	@ 0x1f8
c0de7a04:	2b00      	cmp	r3, #0
c0de7a06:	bf18      	it	ne
c0de7a08:	f44f 72cc 	movne.w	r2, #408	@ 0x198
c0de7a0c:	2400      	movs	r4, #0
c0de7a0e:	2500      	movs	r5, #0
c0de7a10:	2100      	movs	r1, #0
c0de7a12:	b2ce      	uxtb	r6, r1
c0de7a14:	4286      	cmp	r6, r0
c0de7a16:	d207      	bcs.n	c0de7a28 <nbgl_useCaseGetNbChoicesInPage+0x2a>
c0de7a18:	b2a4      	uxth	r4, r4
c0de7a1a:	345c      	adds	r4, #92	@ 0x5c
c0de7a1c:	b2a6      	uxth	r6, r4
c0de7a1e:	4296      	cmp	r6, r2
c0de7a20:	d204      	bcs.n	c0de7a2c <nbgl_useCaseGetNbChoicesInPage+0x2e>
c0de7a22:	3101      	adds	r1, #1
c0de7a24:	4635      	mov	r5, r6
c0de7a26:	e7f4      	b.n	c0de7a12 <nbgl_useCaseGetNbChoicesInPage+0x14>
c0de7a28:	4601      	mov	r1, r0
c0de7a2a:	e004      	b.n	c0de7a36 <nbgl_useCaseGetNbChoicesInPage+0x38>
c0de7a2c:	b91b      	cbnz	r3, c0de7a36 <nbgl_useCaseGetNbChoicesInPage+0x38>
c0de7a2e:	08e8      	lsrs	r0, r5, #3
c0de7a30:	2832      	cmp	r0, #50	@ 0x32
c0de7a32:	bf88      	it	hi
c0de7a34:	3901      	subhi	r1, #1
c0de7a36:	b2c8      	uxtb	r0, r1
c0de7a38:	bd70      	pop	{r4, r5, r6, pc}
	...

c0de7a3c <useCaseHomeExt>:
c0de7a3c:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de7a40:	b08f      	sub	sp, #60	@ 0x3c
c0de7a42:	4604      	mov	r4, r0
c0de7a44:	a802      	add	r0, sp, #8
c0de7a46:	460f      	mov	r7, r1
c0de7a48:	2130      	movs	r1, #48	@ 0x30
c0de7a4a:	461e      	mov	r6, r3
c0de7a4c:	4615      	mov	r5, r2
c0de7a4e:	3004      	adds	r0, #4
c0de7a50:	f003 fb74 	bl	c0deb13c <__aeabi_memclr>
c0de7a54:	2009      	movs	r0, #9
c0de7a56:	f88d 0039 	strb.w	r0, [sp, #57]	@ 0x39
c0de7a5a:	2006      	movs	r0, #6
c0de7a5c:	f88d 001e 	strb.w	r0, [sp, #30]
c0de7a60:	2004      	movs	r0, #4
c0de7a62:	f88d 001d 	strb.w	r0, [sp, #29]
c0de7a66:	2003      	movs	r0, #3
c0de7a68:	2e00      	cmp	r6, #0
c0de7a6a:	bf18      	it	ne
c0de7a6c:	2001      	movne	r0, #1
c0de7a6e:	f88d 001c 	strb.w	r0, [sp, #28]
c0de7a72:	9705      	str	r7, [sp, #20]
c0de7a74:	9402      	str	r4, [sp, #8]
c0de7a76:	f000 f87b 	bl	c0de7b70 <reset_callbacks_and_context>
c0de7a7a:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de7a7c:	e9d0 1200 	ldrd	r1, r2, [r0]
c0de7a80:	b951      	cbnz	r1, c0de7a98 <useCaseHomeExt+0x5c>
c0de7a82:	b94a      	cbnz	r2, c0de7a98 <useCaseHomeExt+0x5c>
c0de7a84:	4831      	ldr	r0, [pc, #196]	@ (c0de7b4c <useCaseHomeExt+0x110>)
c0de7a86:	2100      	movs	r1, #0
c0de7a88:	e9cd 110c 	strd	r1, r1, [sp, #48]	@ 0x30
c0de7a8c:	4448      	add	r0, r9
c0de7a8e:	6241      	str	r1, [r0, #36]	@ 0x24
c0de7a90:	2002      	movs	r0, #2
c0de7a92:	f88d 001f 	strb.w	r0, [sp, #31]
c0de7a96:	e00e      	b.n	c0de7ab6 <useCaseHomeExt+0x7a>
c0de7a98:	4b2c      	ldr	r3, [pc, #176]	@ (c0de7b4c <useCaseHomeExt+0x110>)
c0de7a9a:	6886      	ldr	r6, [r0, #8]
c0de7a9c:	e9cd 120c 	strd	r1, r2, [sp, #48]	@ 0x30
c0de7aa0:	444b      	add	r3, r9
c0de7aa2:	625e      	str	r6, [r3, #36]	@ 0x24
c0de7aa4:	2308      	movs	r3, #8
c0de7aa6:	7b00      	ldrb	r0, [r0, #12]
c0de7aa8:	f88d 301f 	strb.w	r3, [sp, #31]
c0de7aac:	2800      	cmp	r0, #0
c0de7aae:	bf18      	it	ne
c0de7ab0:	2001      	movne	r0, #1
c0de7ab2:	f88d 0038 	strb.w	r0, [sp, #56]	@ 0x38
c0de7ab6:	e9dd a817 	ldrd	sl, r8, [sp, #92]	@ 0x5c
c0de7aba:	bb8d      	cbnz	r5, c0de7b20 <useCaseHomeExt+0xe4>
c0de7abc:	4620      	mov	r0, r4
c0de7abe:	f003 fba9 	bl	c0deb214 <strlen>
c0de7ac2:	4e24      	ldr	r6, [pc, #144]	@ (c0de7b54 <useCaseHomeExt+0x118>)
c0de7ac4:	2814      	cmp	r0, #20
c0de7ac6:	447e      	add	r6, pc
c0de7ac8:	d307      	bcc.n	c0de7ada <useCaseHomeExt+0x9e>
c0de7aca:	4821      	ldr	r0, [pc, #132]	@ (c0de7b50 <useCaseHomeExt+0x114>)
c0de7acc:	4922      	ldr	r1, [pc, #136]	@ (c0de7b58 <useCaseHomeExt+0x11c>)
c0de7ace:	2236      	movs	r2, #54	@ 0x36
c0de7ad0:	4448      	add	r0, r9
c0de7ad2:	4479      	add	r1, pc
c0de7ad4:	f003 fb28 	bl	c0deb128 <__aeabi_memcpy>
c0de7ad8:	e00a      	b.n	c0de7af0 <useCaseHomeExt+0xb4>
c0de7ada:	e9cd 4600 	strd	r4, r6, [sp]
c0de7ade:	481c      	ldr	r0, [pc, #112]	@ (c0de7b50 <useCaseHomeExt+0x114>)
c0de7ae0:	214a      	movs	r1, #74	@ 0x4a
c0de7ae2:	4a1e      	ldr	r2, [pc, #120]	@ (c0de7b5c <useCaseHomeExt+0x120>)
c0de7ae4:	4b1e      	ldr	r3, [pc, #120]	@ (c0de7b60 <useCaseHomeExt+0x124>)
c0de7ae6:	4448      	add	r0, r9
c0de7ae8:	447a      	add	r2, pc
c0de7aea:	447b      	add	r3, pc
c0de7aec:	f002 ff72 	bl	c0dea9d4 <snprintf>
c0de7af0:	4f17      	ldr	r7, [pc, #92]	@ (c0de7b50 <useCaseHomeExt+0x114>)
c0de7af2:	200b      	movs	r0, #11
c0de7af4:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de7af8:	2300      	movs	r3, #0
c0de7afa:	eb09 0507 	add.w	r5, r9, r7
c0de7afe:	4629      	mov	r1, r5
c0de7b00:	f002 ff37 	bl	c0dea972 <nbgl_getTextNbLinesInWidth>
c0de7b04:	2804      	cmp	r0, #4
c0de7b06:	d30b      	bcc.n	c0de7b20 <useCaseHomeExt+0xe4>
c0de7b08:	e9cd 4600 	strd	r4, r6, [sp]
c0de7b0c:	eb09 0507 	add.w	r5, r9, r7
c0de7b10:	214a      	movs	r1, #74	@ 0x4a
c0de7b12:	4a14      	ldr	r2, [pc, #80]	@ (c0de7b64 <useCaseHomeExt+0x128>)
c0de7b14:	4b14      	ldr	r3, [pc, #80]	@ (c0de7b68 <useCaseHomeExt+0x12c>)
c0de7b16:	4628      	mov	r0, r5
c0de7b18:	447a      	add	r2, pc
c0de7b1a:	447b      	add	r3, pc
c0de7b1c:	f002 ff5a 	bl	c0dea9d4 <snprintf>
c0de7b20:	480a      	ldr	r0, [pc, #40]	@ (c0de7b4c <useCaseHomeExt+0x110>)
c0de7b22:	9503      	str	r5, [sp, #12]
c0de7b24:	2100      	movs	r1, #0
c0de7b26:	eb09 0400 	add.w	r4, r9, r0
c0de7b2a:	f8c4 a028 	str.w	sl, [r4, #40]	@ 0x28
c0de7b2e:	f8c4 8004 	str.w	r8, [r4, #4]
c0de7b32:	480e      	ldr	r0, [pc, #56]	@ (c0de7b6c <useCaseHomeExt+0x130>)
c0de7b34:	aa02      	add	r2, sp, #8
c0de7b36:	4478      	add	r0, pc
c0de7b38:	f7ff faac 	bl	c0de7094 <nbgl_pageDrawInfo>
c0de7b3c:	6160      	str	r0, [r4, #20]
c0de7b3e:	2002      	movs	r0, #2
c0de7b40:	f002 fec2 	bl	c0dea8c8 <nbgl_refreshSpecial>
c0de7b44:	b00f      	add	sp, #60	@ 0x3c
c0de7b46:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de7b4a:	bf00      	nop
c0de7b4c:	00001c28 	.word	0x00001c28
c0de7b50:	00001aa8 	.word	0x00001aa8
c0de7b54:	000051bb 	.word	0x000051bb
c0de7b58:	0000695a 	.word	0x0000695a
c0de7b5c:	00004cd4 	.word	0x00004cd4
c0de7b60:	0000542f 	.word	0x0000542f
c0de7b64:	00004d3e 	.word	0x00004d3e
c0de7b68:	000053ff 	.word	0x000053ff
c0de7b6c:	000008fb 	.word	0x000008fb

c0de7b70 <reset_callbacks_and_context>:
c0de7b70:	b580      	push	{r7, lr}
c0de7b72:	4808      	ldr	r0, [pc, #32]	@ (c0de7b94 <reset_callbacks_and_context+0x24>)
c0de7b74:	2100      	movs	r1, #0
c0de7b76:	4448      	add	r0, r9
c0de7b78:	e9c0 1109 	strd	r1, r1, [r0, #36]	@ 0x24
c0de7b7c:	62c1      	str	r1, [r0, #44]	@ 0x2c
c0de7b7e:	e9c0 1101 	strd	r1, r1, [r0, #4]
c0de7b82:	60c1      	str	r1, [r0, #12]
c0de7b84:	6181      	str	r1, [r0, #24]
c0de7b86:	4804      	ldr	r0, [pc, #16]	@ (c0de7b98 <reset_callbacks_and_context+0x28>)
c0de7b88:	216c      	movs	r1, #108	@ 0x6c
c0de7b8a:	4448      	add	r0, r9
c0de7b8c:	f003 fad6 	bl	c0deb13c <__aeabi_memclr>
c0de7b90:	bd80      	pop	{r7, pc}
c0de7b92:	bf00      	nop
c0de7b94:	00001c28 	.word	0x00001c28
c0de7b98:	0000195c 	.word	0x0000195c

c0de7b9c <prepareNavInfo>:
c0de7b9c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de7ba0:	4f1b      	ldr	r7, [pc, #108]	@ (c0de7c10 <prepareNavInfo+0x74>)
c0de7ba2:	460c      	mov	r4, r1
c0de7ba4:	4606      	mov	r6, r0
c0de7ba6:	211c      	movs	r1, #28
c0de7ba8:	4690      	mov	r8, r2
c0de7baa:	eb09 0507 	add.w	r5, r9, r7
c0de7bae:	f105 0060 	add.w	r0, r5, #96	@ 0x60
c0de7bb2:	f003 fac3 	bl	c0deb13c <__aeabi_memclr>
c0de7bb6:	2009      	movs	r0, #9
c0de7bb8:	f885 4061 	strb.w	r4, [r5, #97]	@ 0x61
c0de7bbc:	f885 0065 	strb.w	r0, [r5, #101]	@ 0x65
c0de7bc0:	2001      	movs	r0, #1
c0de7bc2:	f885 0063 	strb.w	r0, [r5, #99]	@ 0x63
c0de7bc6:	b1ce      	cbz	r6, c0de7bfc <prepareNavInfo+0x60>
c0de7bc8:	eb09 0007 	add.w	r0, r9, r7
c0de7bcc:	210c      	movs	r1, #12
c0de7bce:	f880 1062 	strb.w	r1, [r0, #98]	@ 0x62
c0de7bd2:	2103      	movs	r1, #3
c0de7bd4:	f8c0 8074 	str.w	r8, [r0, #116]	@ 0x74
c0de7bd8:	f880 1073 	strb.w	r1, [r0, #115]	@ 0x73
c0de7bdc:	f819 1007 	ldrb.w	r1, [r9, r7]
c0de7be0:	3903      	subs	r1, #3
c0de7be2:	bf18      	it	ne
c0de7be4:	2101      	movne	r1, #1
c0de7be6:	2200      	movs	r2, #0
c0de7be8:	f880 1072 	strb.w	r1, [r0, #114]	@ 0x72
c0de7bec:	2c01      	cmp	r4, #1
c0de7bee:	bf88      	it	hi
c0de7bf0:	2201      	movhi	r2, #1
c0de7bf2:	4311      	orrs	r1, r2
c0de7bf4:	f880 1071 	strb.w	r1, [r0, #113]	@ 0x71
c0de7bf8:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de7bfc:	eb09 0107 	add.w	r1, r9, r7
c0de7c00:	f881 0071 	strb.w	r0, [r1, #113]	@ 0x71
c0de7c04:	2003      	movs	r0, #3
c0de7c06:	f881 0073 	strb.w	r0, [r1, #115]	@ 0x73
c0de7c0a:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de7c0e:	bf00      	nop
c0de7c10:	00001c28 	.word	0x00001c28

c0de7c14 <displaySettingsPage>:
c0de7c14:	b570      	push	{r4, r5, r6, lr}
c0de7c16:	b090      	sub	sp, #64	@ 0x40
c0de7c18:	460c      	mov	r4, r1
c0de7c1a:	4605      	mov	r5, r0
c0de7c1c:	4668      	mov	r0, sp
c0de7c1e:	2140      	movs	r1, #64	@ 0x40
c0de7c20:	f003 fa8c 	bl	c0deb13c <__aeabi_memclr>
c0de7c24:	4e12      	ldr	r6, [pc, #72]	@ (c0de7c70 <displaySettingsPage+0x5c>)
c0de7c26:	eb09 0006 	add.w	r0, r9, r6
c0de7c2a:	6882      	ldr	r2, [r0, #8]
c0de7c2c:	b1f2      	cbz	r2, c0de7c6c <displaySettingsPage+0x58>
c0de7c2e:	4669      	mov	r1, sp
c0de7c30:	4628      	mov	r0, r5
c0de7c32:	4790      	blx	r2
c0de7c34:	b1d0      	cbz	r0, c0de7c6c <displaySettingsPage+0x58>
c0de7c36:	444e      	add	r6, r9
c0de7c38:	2009      	movs	r0, #9
c0de7c3a:	466a      	mov	r2, sp
c0de7c3c:	f88d 0006 	strb.w	r0, [sp, #6]
c0de7c40:	f240 2001 	movw	r0, #513	@ 0x201
c0de7c44:	f806 5f60 	strb.w	r5, [r6, #96]!
c0de7c48:	f8ad 0004 	strh.w	r0, [sp, #4]
c0de7c4c:	f856 0c50 	ldr.w	r0, [r6, #-80]
c0de7c50:	4631      	mov	r1, r6
c0de7c52:	9000      	str	r0, [sp, #0]
c0de7c54:	4807      	ldr	r0, [pc, #28]	@ (c0de7c74 <displaySettingsPage+0x60>)
c0de7c56:	4478      	add	r0, pc
c0de7c58:	f7ff fd6c 	bl	c0de7734 <nbgl_pageDrawGenericContent>
c0de7c5c:	f846 0c4c 	str.w	r0, [r6, #-76]
c0de7c60:	2001      	movs	r0, #1
c0de7c62:	2c00      	cmp	r4, #0
c0de7c64:	bf18      	it	ne
c0de7c66:	2002      	movne	r0, #2
c0de7c68:	f002 fe2e 	bl	c0dea8c8 <nbgl_refreshSpecial>
c0de7c6c:	b010      	add	sp, #64	@ 0x40
c0de7c6e:	bd70      	pop	{r4, r5, r6, pc}
c0de7c70:	00001c28 	.word	0x00001c28
c0de7c74:	000007db 	.word	0x000007db

c0de7c78 <nbgl_useCaseGenericSettings>:
c0de7c78:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de7c7c:	461d      	mov	r5, r3
c0de7c7e:	4616      	mov	r6, r2
c0de7c80:	4688      	mov	r8, r1
c0de7c82:	4607      	mov	r7, r0
c0de7c84:	f7ff ff74 	bl	c0de7b70 <reset_callbacks_and_context>
c0de7c88:	4c25      	ldr	r4, [pc, #148]	@ (c0de7d20 <nbgl_useCaseGenericSettings+0xa8>)
c0de7c8a:	2002      	movs	r0, #2
c0de7c8c:	f809 0004 	strb.w	r0, [r9, r4]
c0de7c90:	eb09 0004 	add.w	r0, r9, r4
c0de7c94:	6107      	str	r7, [r0, #16]
c0de7c96:	9906      	ldr	r1, [sp, #24]
c0de7c98:	6041      	str	r1, [r0, #4]
c0de7c9a:	b12e      	cbz	r6, c0de7ca8 <nbgl_useCaseGenericSettings+0x30>
c0de7c9c:	4821      	ldr	r0, [pc, #132]	@ (c0de7d24 <nbgl_useCaseGenericSettings+0xac>)
c0de7c9e:	e896 000e 	ldmia.w	r6, {r1, r2, r3}
c0de7ca2:	4448      	add	r0, r9
c0de7ca4:	3004      	adds	r0, #4
c0de7ca6:	c00e      	stmia	r0!, {r1, r2, r3}
c0de7ca8:	b1a5      	cbz	r5, c0de7cd4 <nbgl_useCaseGenericSettings+0x5c>
c0de7caa:	481e      	ldr	r0, [pc, #120]	@ (c0de7d24 <nbgl_useCaseGenericSettings+0xac>)
c0de7cac:	2101      	movs	r1, #1
c0de7cae:	4448      	add	r0, r9
c0de7cb0:	7501      	strb	r1, [r0, #20]
c0de7cb2:	481d      	ldr	r0, [pc, #116]	@ (c0de7d28 <nbgl_useCaseGenericSettings+0xb0>)
c0de7cb4:	2138      	movs	r1, #56	@ 0x38
c0de7cb6:	eb09 0600 	add.w	r6, r9, r0
c0de7cba:	f106 0038 	add.w	r0, r6, #56	@ 0x38
c0de7cbe:	f003 fa3d 	bl	c0deb13c <__aeabi_memclr>
c0de7cc2:	2008      	movs	r0, #8
c0de7cc4:	4629      	mov	r1, r5
c0de7cc6:	2230      	movs	r2, #48	@ 0x30
c0de7cc8:	f886 0038 	strb.w	r0, [r6, #56]	@ 0x38
c0de7ccc:	f106 003c 	add.w	r0, r6, #60	@ 0x3c
c0de7cd0:	f003 fa2a 	bl	c0deb128 <__aeabi_memcpy>
c0de7cd4:	f002 f956 	bl	c0de9f84 <OUTLINED_FUNCTION_5>
c0de7cd8:	4606      	mov	r6, r0
c0de7cda:	b145      	cbz	r5, c0de7cee <nbgl_useCaseGenericSettings+0x76>
c0de7cdc:	4812      	ldr	r0, [pc, #72]	@ (c0de7d28 <nbgl_useCaseGenericSettings+0xb0>)
c0de7cde:	4631      	mov	r1, r6
c0de7ce0:	2201      	movs	r2, #1
c0de7ce2:	2300      	movs	r3, #0
c0de7ce4:	4448      	add	r0, r9
c0de7ce6:	3038      	adds	r0, #56	@ 0x38
c0de7ce8:	f000 f848 	bl	c0de7d7c <getNbPagesForContent>
c0de7cec:	4406      	add	r6, r0
c0de7cee:	444c      	add	r4, r9
c0de7cf0:	211c      	movs	r1, #28
c0de7cf2:	f104 0060 	add.w	r0, r4, #96	@ 0x60
c0de7cf6:	f003 fa21 	bl	c0deb13c <__aeabi_memclr>
c0de7cfa:	2009      	movs	r0, #9
c0de7cfc:	f884 6061 	strb.w	r6, [r4, #97]	@ 0x61
c0de7d00:	2101      	movs	r1, #1
c0de7d02:	f884 0065 	strb.w	r0, [r4, #101]	@ 0x65
c0de7d06:	2003      	movs	r0, #3
c0de7d08:	f884 0073 	strb.w	r0, [r4, #115]	@ 0x73
c0de7d0c:	2001      	movs	r0, #1
c0de7d0e:	f884 0063 	strb.w	r0, [r4, #99]	@ 0x63
c0de7d12:	f884 0071 	strb.w	r0, [r4, #113]	@ 0x71
c0de7d16:	4640      	mov	r0, r8
c0de7d18:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de7d1c:	f000 b8c0 	b.w	c0de7ea0 <displayGenericContextPage>
c0de7d20:	00001c28 	.word	0x00001c28
c0de7d24:	0000195c 	.word	0x0000195c
c0de7d28:	000019c8 	.word	0x000019c8

c0de7d2c <getNbPagesForGenericContents>:
c0de7d2c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de7d30:	b08e      	sub	sp, #56	@ 0x38
c0de7d32:	4f11      	ldr	r7, [pc, #68]	@ (c0de7d78 <getNbPagesForGenericContents+0x4c>)
c0de7d34:	4604      	mov	r4, r0
c0de7d36:	2600      	movs	r6, #0
c0de7d38:	46e8      	mov	r8, sp
c0de7d3a:	2500      	movs	r5, #0
c0de7d3c:	eb09 0007 	add.w	r0, r9, r7
c0de7d40:	7b00      	ldrb	r0, [r0, #12]
c0de7d42:	4285      	cmp	r5, r0
c0de7d44:	d214      	bcs.n	c0de7d70 <getNbPagesForGenericContents+0x44>
c0de7d46:	b268      	sxtb	r0, r5
c0de7d48:	4641      	mov	r1, r8
c0de7d4a:	f001 fabb 	bl	c0de92c4 <getContentAtIdx>
c0de7d4e:	b170      	cbz	r0, c0de7d6e <getNbPagesForGenericContents+0x42>
c0de7d50:	eb09 0107 	add.w	r1, r9, r7
c0de7d54:	4623      	mov	r3, r4
c0de7d56:	7b09      	ldrb	r1, [r1, #12]
c0de7d58:	1a69      	subs	r1, r5, r1
c0de7d5a:	3101      	adds	r1, #1
c0de7d5c:	fab1 f181 	clz	r1, r1
c0de7d60:	094a      	lsrs	r2, r1, #5
c0de7d62:	b2f1      	uxtb	r1, r6
c0de7d64:	f000 f80a 	bl	c0de7d7c <getNbPagesForContent>
c0de7d68:	4406      	add	r6, r0
c0de7d6a:	3501      	adds	r5, #1
c0de7d6c:	e7e6      	b.n	c0de7d3c <getNbPagesForGenericContents+0x10>
c0de7d6e:	2600      	movs	r6, #0
c0de7d70:	b2f0      	uxtb	r0, r6
c0de7d72:	b00e      	add	sp, #56	@ 0x38
c0de7d74:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de7d78:	0000195c 	.word	0x0000195c

c0de7d7c <getNbPagesForContent>:
c0de7d7c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de7d80:	b08c      	sub	sp, #48	@ 0x30
c0de7d82:	4606      	mov	r6, r0
c0de7d84:	fab1 f081 	clz	r0, r1
c0de7d88:	9306      	str	r3, [sp, #24]
c0de7d8a:	4614      	mov	r4, r2
c0de7d8c:	9109      	str	r1, [sp, #36]	@ 0x24
c0de7d8e:	0940      	lsrs	r0, r0, #5
c0de7d90:	4010      	ands	r0, r2
c0de7d92:	900a      	str	r0, [sp, #40]	@ 0x28
c0de7d94:	4630      	mov	r0, r6
c0de7d96:	f001 fabf 	bl	c0de9318 <getContentNbElement>
c0de7d9a:	4605      	mov	r5, r0
c0de7d9c:	f084 0001 	eor.w	r0, r4, #1
c0de7da0:	f04f 0800 	mov.w	r8, #0
c0de7da4:	f04f 0a00 	mov.w	sl, #0
c0de7da8:	f04f 0b00 	mov.w	fp, #0
c0de7dac:	270f      	movs	r7, #15
c0de7dae:	9405      	str	r4, [sp, #20]
c0de7db0:	9608      	str	r6, [sp, #32]
c0de7db2:	9004      	str	r0, [sp, #16]
c0de7db4:	1d30      	adds	r0, r6, #4
c0de7db6:	9007      	str	r0, [sp, #28]
c0de7db8:	0628      	lsls	r0, r5, #24
c0de7dba:	d068      	beq.n	c0de7e8e <getNbPagesForContent+0x112>
c0de7dbc:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de7dbe:	f88d 802f 	strb.w	r8, [sp, #47]	@ 0x2f
c0de7dc2:	b128      	cbz	r0, c0de7dd0 <getNbPagesForContent+0x54>
c0de7dc4:	fa5f f38b 	uxtb.w	r3, fp
c0de7dc8:	2b00      	cmp	r3, #0
c0de7dca:	bf18      	it	ne
c0de7dcc:	2301      	movne	r3, #1
c0de7dce:	e000      	b.n	c0de7dd2 <getNbPagesForContent+0x56>
c0de7dd0:	2301      	movs	r3, #1
c0de7dd2:	9808      	ldr	r0, [sp, #32]
c0de7dd4:	7800      	ldrb	r0, [r0, #0]
c0de7dd6:	280a      	cmp	r0, #10
c0de7dd8:	d00e      	beq.n	c0de7df8 <getNbPagesForContent+0x7c>
c0de7dda:	2806      	cmp	r0, #6
c0de7ddc:	d011      	beq.n	c0de7e02 <getNbPagesForContent+0x86>
c0de7dde:	2807      	cmp	r0, #7
c0de7de0:	d01e      	beq.n	c0de7e20 <getNbPagesForContent+0xa4>
c0de7de2:	2808      	cmp	r0, #8
c0de7de4:	d023      	beq.n	c0de7e2e <getNbPagesForContent+0xb2>
c0de7de6:	2809      	cmp	r0, #9
c0de7de8:	d028      	beq.n	c0de7e3c <getNbPagesForContent+0xc0>
c0de7dea:	2804      	cmp	r0, #4
c0de7dec:	d12b      	bne.n	c0de7e46 <getNbPagesForContent+0xca>
c0de7dee:	2000      	movs	r0, #0
c0de7df0:	f04f 0800 	mov.w	r8, #0
c0de7df4:	9000      	str	r0, [sp, #0]
c0de7df6:	e007      	b.n	c0de7e08 <getNbPagesForContent+0x8c>
c0de7df8:	b2e8      	uxtb	r0, r5
c0de7dfa:	2200      	movs	r2, #0
c0de7dfc:	f7ff fddf 	bl	c0de79be <nbgl_useCaseGetNbBarsInPage>
c0de7e00:	e028      	b.n	c0de7e54 <getNbPagesForContent+0xd8>
c0de7e02:	9805      	ldr	r0, [sp, #20]
c0de7e04:	9000      	str	r0, [sp, #0]
c0de7e06:	9804      	ldr	r0, [sp, #16]
c0de7e08:	9001      	str	r0, [sp, #4]
c0de7e0a:	f10d 002f 	add.w	r0, sp, #47	@ 0x2f
c0de7e0e:	e9dd 3106 	ldrd	r3, r1, [sp, #24]
c0de7e12:	fa5f f28b 	uxtb.w	r2, fp
c0de7e16:	9002      	str	r0, [sp, #8]
c0de7e18:	b2e8      	uxtb	r0, r5
c0de7e1a:	f7ff fcb6 	bl	c0de778a <getNbTagValuesInPage>
c0de7e1e:	e019      	b.n	c0de7e54 <getNbPagesForContent+0xd8>
c0de7e20:	9907      	ldr	r1, [sp, #28]
c0de7e22:	b2e8      	uxtb	r0, r5
c0de7e24:	fa5f f28b 	uxtb.w	r2, fp
c0de7e28:	f7ff fd93 	bl	c0de7952 <nbgl_useCaseGetNbSwitchesInPage>
c0de7e2c:	e012      	b.n	c0de7e54 <getNbPagesForContent+0xd8>
c0de7e2e:	9907      	ldr	r1, [sp, #28]
c0de7e30:	b2e8      	uxtb	r0, r5
c0de7e32:	fa5f f28b 	uxtb.w	r2, fp
c0de7e36:	f7ff fd43 	bl	c0de78c0 <nbgl_useCaseGetNbInfosInPage>
c0de7e3a:	e00b      	b.n	c0de7e54 <getNbPagesForContent+0xd8>
c0de7e3c:	b2e8      	uxtb	r0, r5
c0de7e3e:	2200      	movs	r2, #0
c0de7e40:	f7ff fddd 	bl	c0de79fe <nbgl_useCaseGetNbChoicesInPage>
c0de7e44:	e006      	b.n	c0de7e54 <getNbPagesForContent+0xd8>
c0de7e46:	4915      	ldr	r1, [pc, #84]	@ (c0de7e9c <getNbPagesForContent+0x120>)
c0de7e48:	4479      	add	r1, pc
c0de7e4a:	5c08      	ldrb	r0, [r1, r0]
c0de7e4c:	b2e9      	uxtb	r1, r5
c0de7e4e:	4288      	cmp	r0, r1
c0de7e50:	bf28      	it	cs
c0de7e52:	4628      	movcs	r0, r5
c0de7e54:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0de7e56:	f89d 402f 	ldrb.w	r4, [sp, #47]	@ 0x2f
c0de7e5a:	f000 0307 	and.w	r3, r0, #7
c0de7e5e:	2204      	movs	r2, #4
c0de7e60:	1a2d      	subs	r5, r5, r0
c0de7e62:	4483      	add	fp, r0
c0de7e64:	4451      	add	r1, sl
c0de7e66:	ea43 03c4 	orr.w	r3, r3, r4, lsl #3
c0de7e6a:	4c0b      	ldr	r4, [pc, #44]	@ (c0de7e98 <getNbPagesForContent+0x11c>)
c0de7e6c:	f10a 0a01 	add.w	sl, sl, #1
c0de7e70:	b2c9      	uxtb	r1, r1
c0de7e72:	b2db      	uxtb	r3, r3
c0de7e74:	ea02 0281 	and.w	r2, r2, r1, lsl #2
c0de7e78:	444c      	add	r4, r9
c0de7e7a:	0849      	lsrs	r1, r1, #1
c0de7e7c:	5c66      	ldrb	r6, [r4, r1]
c0de7e7e:	4093      	lsls	r3, r2
c0de7e80:	fa07 f202 	lsl.w	r2, r7, r2
c0de7e84:	ea26 0202 	bic.w	r2, r6, r2
c0de7e88:	431a      	orrs	r2, r3
c0de7e8a:	5462      	strb	r2, [r4, r1]
c0de7e8c:	e794      	b.n	c0de7db8 <getNbPagesForContent+0x3c>
c0de7e8e:	fa5f f08a 	uxtb.w	r0, sl
c0de7e92:	b00c      	add	sp, #48	@ 0x30
c0de7e94:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de7e98:	00001b28 	.word	0x00001b28
c0de7e9c:	0000661a 	.word	0x0000661a

c0de7ea0 <displayGenericContextPage>:
c0de7ea0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de7ea4:	b0a0      	sub	sp, #128	@ 0x80
c0de7ea6:	f8df 23e0 	ldr.w	r2, [pc, #992]	@ c0de8288 <displayGenericContextPage+0x3e8>
c0de7eaa:	4683      	mov	fp, r0
c0de7eac:	f819 0002 	ldrb.w	r0, [r9, r2]
c0de7eb0:	2803      	cmp	r0, #3
c0de7eb2:	d10f      	bne.n	c0de7ed4 <displayGenericContextPage+0x34>
c0de7eb4:	f8df 03d4 	ldr.w	r0, [pc, #980]	@ c0de828c <displayGenericContextPage+0x3ec>
c0de7eb8:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de7ebc:	4448      	add	r0, r9
c0de7ebe:	d05f      	beq.n	c0de7f80 <displayGenericContextPage+0xe0>
c0de7ec0:	f890 0030 	ldrb.w	r0, [r0, #48]	@ 0x30
c0de7ec4:	4558      	cmp	r0, fp
c0de7ec6:	d80e      	bhi.n	c0de7ee6 <displayGenericContextPage+0x46>
c0de7ec8:	2001      	movs	r0, #1
c0de7eca:	b020      	add	sp, #128	@ 0x80
c0de7ecc:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de7ed0:	f001 b854 	b.w	c0de8f7c <bundleNavReviewStreamingChoice>
c0de7ed4:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de7ed8:	d105      	bne.n	c0de7ee6 <displayGenericContextPage+0x46>
c0de7eda:	eb09 0002 	add.w	r0, r9, r2
c0de7ede:	f890 0061 	ldrb.w	r0, [r0, #97]	@ 0x61
c0de7ee2:	f1a0 0b01 	sub.w	fp, r0, #1
c0de7ee6:	eb09 0002 	add.w	r0, r9, r2
c0de7eea:	fa5f f78b 	uxtb.w	r7, fp
c0de7eee:	9100      	str	r1, [sp, #0]
c0de7ef0:	f890 8060 	ldrb.w	r8, [r0, #96]	@ 0x60
c0de7ef4:	4547      	cmp	r7, r8
c0de7ef6:	d12e      	bne.n	c0de7f56 <displayGenericContextPage+0xb6>
c0de7ef8:	a912      	add	r1, sp, #72	@ 0x48
c0de7efa:	f10d 0247 	add.w	r2, sp, #71	@ 0x47
c0de7efe:	f10d 0346 	add.w	r3, sp, #70	@ 0x46
c0de7f02:	4638      	mov	r0, r7
c0de7f04:	f001 fa20 	bl	c0de9348 <genericContextComputeNextPageParams>
c0de7f08:	4682      	mov	sl, r0
c0de7f0a:	f1ba 0f00 	cmp.w	sl, #0
c0de7f0e:	f000 8147 	beq.w	c0de81a0 <displayGenericContextPage+0x300>
c0de7f12:	f8df 8374 	ldr.w	r8, [pc, #884]	@ c0de8288 <displayGenericContextPage+0x3e8>
c0de7f16:	f819 0008 	ldrb.w	r0, [r9, r8]
c0de7f1a:	2803      	cmp	r0, #3
c0de7f1c:	d041      	beq.n	c0de7fa2 <displayGenericContextPage+0x102>
c0de7f1e:	48db      	ldr	r0, [pc, #876]	@ (c0de828c <displayGenericContextPage+0x3ec>)
c0de7f20:	4448      	add	r0, r9
c0de7f22:	f890 0020 	ldrb.w	r0, [r0, #32]
c0de7f26:	06c0      	lsls	r0, r0, #27
c0de7f28:	d53b      	bpl.n	c0de7fa2 <displayGenericContextPage+0x102>
c0de7f2a:	ea5f 600b 	movs.w	r0, fp, lsl #24
c0de7f2e:	d034      	beq.n	c0de7f9a <displayGenericContextPage+0xfa>
c0de7f30:	eb09 0008 	add.w	r0, r9, r8
c0de7f34:	f890 0061 	ldrb.w	r0, [r0, #97]	@ 0x61
c0de7f38:	3801      	subs	r0, #1
c0de7f3a:	42b8      	cmp	r0, r7
c0de7f3c:	dd2d      	ble.n	c0de7f9a <displayGenericContextPage+0xfa>
c0de7f3e:	eb09 0008 	add.w	r0, r9, r8
c0de7f42:	2105      	movs	r1, #5
c0de7f44:	f880 106c 	strb.w	r1, [r0, #108]	@ 0x6c
c0de7f48:	49d2      	ldr	r1, [pc, #840]	@ (c0de8294 <displayGenericContextPage+0x3f4>)
c0de7f4a:	4479      	add	r1, pc
c0de7f4c:	6681      	str	r1, [r0, #104]	@ 0x68
c0de7f4e:	2100      	movs	r1, #0
c0de7f50:	f880 1064 	strb.w	r1, [r0, #100]	@ 0x64
c0de7f54:	e025      	b.n	c0de7fa2 <displayGenericContextPage+0x102>
c0de7f56:	d91b      	bls.n	c0de7f90 <displayGenericContextPage+0xf0>
c0de7f58:	f04f 0a00 	mov.w	sl, #0
c0de7f5c:	ac12      	add	r4, sp, #72	@ 0x48
c0de7f5e:	f10d 0547 	add.w	r5, sp, #71	@ 0x47
c0de7f62:	f10d 0646 	add.w	r6, sp, #70	@ 0x46
c0de7f66:	4547      	cmp	r7, r8
c0de7f68:	d0cf      	beq.n	c0de7f0a <displayGenericContextPage+0x6a>
c0de7f6a:	f108 0801 	add.w	r8, r8, #1
c0de7f6e:	4621      	mov	r1, r4
c0de7f70:	462a      	mov	r2, r5
c0de7f72:	4633      	mov	r3, r6
c0de7f74:	fa5f f088 	uxtb.w	r0, r8
c0de7f78:	f001 f9e6 	bl	c0de9348 <genericContextComputeNextPageParams>
c0de7f7c:	4682      	mov	sl, r0
c0de7f7e:	e7f2      	b.n	c0de7f66 <displayGenericContextPage+0xc6>
c0de7f80:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0de7f82:	2800      	cmp	r0, #0
c0de7f84:	f000 810c 	beq.w	c0de81a0 <displayGenericContextPage+0x300>
c0de7f88:	b020      	add	sp, #128	@ 0x80
c0de7f8a:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de7f8e:	4700      	bx	r0
c0de7f90:	eba7 0008 	sub.w	r0, r7, r8
c0de7f94:	2801      	cmp	r0, #1
c0de7f96:	ddaf      	ble.n	c0de7ef8 <displayGenericContextPage+0x58>
c0de7f98:	e102      	b.n	c0de81a0 <displayGenericContextPage+0x300>
c0de7f9a:	eb09 0008 	add.w	r0, r9, r8
c0de7f9e:	2100      	movs	r1, #0
c0de7fa0:	6681      	str	r1, [r0, #104]	@ 0x68
c0de7fa2:	af01      	add	r7, sp, #4
c0de7fa4:	213c      	movs	r1, #60	@ 0x3c
c0de7fa6:	1d38      	adds	r0, r7, #4
c0de7fa8:	f003 f8c8 	bl	c0deb13c <__aeabi_memclr>
c0de7fac:	2009      	movs	r0, #9
c0de7fae:	f8df b2e0 	ldr.w	fp, [pc, #736]	@ c0de8290 <displayGenericContextPage+0x3f0>
c0de7fb2:	f89d 5047 	ldrb.w	r5, [sp, #71]	@ 0x47
c0de7fb6:	f88d 000a 	strb.w	r0, [sp, #10]
c0de7fba:	2002      	movs	r0, #2
c0de7fbc:	f88d 0009 	strb.w	r0, [sp, #9]
c0de7fc0:	eb09 0008 	add.w	r0, r9, r8
c0de7fc4:	eb09 010b 	add.w	r1, r9, fp
c0de7fc8:	6900      	ldr	r0, [r0, #16]
c0de7fca:	7c8e      	ldrb	r6, [r1, #18]
c0de7fcc:	9001      	str	r0, [sp, #4]
c0de7fce:	f89a 0000 	ldrb.w	r0, [sl]
c0de7fd2:	280a      	cmp	r0, #10
c0de7fd4:	f88d 0010 	strb.w	r0, [sp, #16]
c0de7fd8:	d01e      	beq.n	c0de8018 <displayGenericContextPage+0x178>
c0de7fda:	2801      	cmp	r0, #1
c0de7fdc:	d02c      	beq.n	c0de8038 <displayGenericContextPage+0x198>
c0de7fde:	2802      	cmp	r0, #2
c0de7fe0:	d014      	beq.n	c0de800c <displayGenericContextPage+0x16c>
c0de7fe2:	2803      	cmp	r0, #3
c0de7fe4:	d012      	beq.n	c0de800c <displayGenericContextPage+0x16c>
c0de7fe6:	2804      	cmp	r0, #4
c0de7fe8:	d02e      	beq.n	c0de8048 <displayGenericContextPage+0x1a8>
c0de7fea:	2806      	cmp	r0, #6
c0de7fec:	d042      	beq.n	c0de8074 <displayGenericContextPage+0x1d4>
c0de7fee:	2807      	cmp	r0, #7
c0de7ff0:	d04e      	beq.n	c0de8090 <displayGenericContextPage+0x1f0>
c0de7ff2:	2808      	cmp	r0, #8
c0de7ff4:	d058      	beq.n	c0de80a8 <displayGenericContextPage+0x208>
c0de7ff6:	2809      	cmp	r0, #9
c0de7ff8:	d063      	beq.n	c0de80c2 <displayGenericContextPage+0x222>
c0de7ffa:	2800      	cmp	r0, #0
c0de7ffc:	f040 80d0 	bne.w	c0de81a0 <displayGenericContextPage+0x300>
c0de8000:	f001 ffdd 	bl	c0de9fbe <OUTLINED_FUNCTION_14>
c0de8004:	e890 007c 	ldmia.w	r0, {r2, r3, r4, r5, r6}
c0de8008:	c17c      	stmia	r1!, {r2, r3, r4, r5, r6}
c0de800a:	e092      	b.n	c0de8132 <displayGenericContextPage+0x292>
c0de800c:	f001 ffd7 	bl	c0de9fbe <OUTLINED_FUNCTION_14>
c0de8010:	e890 003c 	ldmia.w	r0, {r2, r3, r4, r5}
c0de8014:	c13c      	stmia	r1!, {r2, r3, r4, r5}
c0de8016:	e08c      	b.n	c0de8132 <displayGenericContextPage+0x292>
c0de8018:	f88d 501c 	strb.w	r5, [sp, #28]
c0de801c:	f001 ff9b 	bl	c0de9f56 <OUTLINED_FUNCTION_1>
c0de8020:	9005      	str	r0, [sp, #20]
c0de8022:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de8026:	4430      	add	r0, r6
c0de8028:	f002 fe66 	bl	c0deacf8 <pic>
c0de802c:	9006      	str	r0, [sp, #24]
c0de802e:	f89a 000d 	ldrb.w	r0, [sl, #13]
c0de8032:	f88d 001d 	strb.w	r0, [sp, #29]
c0de8036:	e07c      	b.n	c0de8132 <displayGenericContextPage+0x292>
c0de8038:	f107 0010 	add.w	r0, r7, #16
c0de803c:	f10a 0104 	add.w	r1, sl, #4
c0de8040:	2230      	movs	r2, #48	@ 0x30
c0de8042:	f003 f871 	bl	c0deb128 <__aeabi_memcpy>
c0de8046:	e074      	b.n	c0de8132 <displayGenericContextPage+0x292>
c0de8048:	f8da 2004 	ldr.w	r2, [sl, #4]
c0de804c:	eb09 010b 	add.w	r1, r9, fp
c0de8050:	f89d 0046 	ldrb.w	r0, [sp, #70]	@ 0x46
c0de8054:	9f00      	ldr	r7, [sp, #0]
c0de8056:	624a      	str	r2, [r1, #36]	@ 0x24
c0de8058:	2800      	cmp	r0, #0
c0de805a:	f8da 2008 	ldr.w	r2, [sl, #8]
c0de805e:	628a      	str	r2, [r1, #40]	@ 0x28
c0de8060:	f000 80bf 	beq.w	c0de81e2 <displayGenericContextPage+0x342>
c0de8064:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de8068:	2800      	cmp	r0, #0
c0de806a:	f000 809c 	beq.w	c0de81a6 <displayGenericContextPage+0x306>
c0de806e:	eb00 1006 	add.w	r0, r0, r6, lsl #4
c0de8072:	e09c      	b.n	c0de81ae <displayGenericContextPage+0x30e>
c0de8074:	f89a 100c 	ldrb.w	r1, [sl, #12]
c0de8078:	1970      	adds	r0, r6, r5
c0de807a:	f10a 0404 	add.w	r4, sl, #4
c0de807e:	4288      	cmp	r0, r1
c0de8080:	d134      	bne.n	c0de80ec <displayGenericContextPage+0x24c>
c0de8082:	3710      	adds	r7, #16
c0de8084:	4621      	mov	r1, r4
c0de8086:	222c      	movs	r2, #44	@ 0x2c
c0de8088:	4638      	mov	r0, r7
c0de808a:	f003 f84d 	bl	c0deb128 <__aeabi_memcpy>
c0de808e:	e031      	b.n	c0de80f4 <displayGenericContextPage+0x254>
c0de8090:	f88d 5018 	strb.w	r5, [sp, #24]
c0de8094:	eb06 0046 	add.w	r0, r6, r6, lsl #1
c0de8098:	f8da 1004 	ldr.w	r1, [sl, #4]
c0de809c:	eb01 0080 	add.w	r0, r1, r0, lsl #2
c0de80a0:	f002 fe2a 	bl	c0deacf8 <pic>
c0de80a4:	9005      	str	r0, [sp, #20]
c0de80a6:	e044      	b.n	c0de8132 <displayGenericContextPage+0x292>
c0de80a8:	f88d 5020 	strb.w	r5, [sp, #32]
c0de80ac:	f001 ff53 	bl	c0de9f56 <OUTLINED_FUNCTION_1>
c0de80b0:	9005      	str	r0, [sp, #20]
c0de80b2:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de80b6:	eb00 0086 	add.w	r0, r0, r6, lsl #2
c0de80ba:	f002 fe1d 	bl	c0deacf8 <pic>
c0de80be:	9006      	str	r0, [sp, #24]
c0de80c0:	e037      	b.n	c0de8132 <displayGenericContextPage+0x292>
c0de80c2:	f001 ff7c 	bl	c0de9fbe <OUTLINED_FUNCTION_14>
c0de80c6:	e890 001c 	ldmia.w	r0, {r2, r3, r4}
c0de80ca:	c11c      	stmia	r1!, {r2, r3, r4}
c0de80cc:	f88d 5019 	strb.w	r5, [sp, #25]
c0de80d0:	f001 ff41 	bl	c0de9f56 <OUTLINED_FUNCTION_1>
c0de80d4:	9005      	str	r0, [sp, #20]
c0de80d6:	f89a 000a 	ldrb.w	r0, [sl, #10]
c0de80da:	42b0      	cmp	r0, r6
c0de80dc:	d327      	bcc.n	c0de812e <displayGenericContextPage+0x28e>
c0de80de:	1971      	adds	r1, r6, r5
c0de80e0:	4281      	cmp	r1, r0
c0de80e2:	d924      	bls.n	c0de812e <displayGenericContextPage+0x28e>
c0de80e4:	1b80      	subs	r0, r0, r6
c0de80e6:	f88d 001a 	strb.w	r0, [sp, #26]
c0de80ea:	e022      	b.n	c0de8132 <displayGenericContextPage+0x292>
c0de80ec:	2004      	movs	r0, #4
c0de80ee:	3710      	adds	r7, #16
c0de80f0:	f88d 0010 	strb.w	r0, [sp, #16]
c0de80f4:	f88d 501c 	strb.w	r5, [sp, #28]
c0de80f8:	6820      	ldr	r0, [r4, #0]
c0de80fa:	eb00 1006 	add.w	r0, r0, r6, lsl #4
c0de80fe:	f002 fdfb 	bl	c0deacf8 <pic>
c0de8102:	2110      	movs	r1, #16
c0de8104:	2200      	movs	r2, #0
c0de8106:	6038      	str	r0, [r7, #0]
c0de8108:	eb01 1105 	add.w	r1, r1, r5, lsl #4
c0de810c:	f102 0310 	add.w	r3, r2, #16
c0de8110:	4299      	cmp	r1, r3
c0de8112:	d006      	beq.n	c0de8122 <displayGenericContextPage+0x282>
c0de8114:	4402      	add	r2, r0
c0de8116:	7b12      	ldrb	r2, [r2, #12]
c0de8118:	0752      	lsls	r2, r2, #29
c0de811a:	461a      	mov	r2, r3
c0de811c:	d5f6      	bpl.n	c0de810c <displayGenericContextPage+0x26c>
c0de811e:	210d      	movs	r1, #13
c0de8120:	72f9      	strb	r1, [r7, #11]
c0de8122:	9a06      	ldr	r2, [sp, #24]
c0de8124:	eb09 010b 	add.w	r1, r9, fp
c0de8128:	e9c1 0209 	strd	r0, r2, [r1, #36]	@ 0x24
c0de812c:	e001      	b.n	c0de8132 <displayGenericContextPage+0x292>
c0de812e:	f88d 501a 	strb.w	r5, [sp, #26]
c0de8132:	9f00      	ldr	r7, [sp, #0]
c0de8134:	f819 0008 	ldrb.w	r0, [r9, r8]
c0de8138:	f000 01fe 	and.w	r1, r0, #254	@ 0xfe
c0de813c:	4853      	ldr	r0, [pc, #332]	@ (c0de828c <displayGenericContextPage+0x3ec>)
c0de813e:	2902      	cmp	r1, #2
c0de8140:	4448      	add	r0, r9
c0de8142:	6a00      	ldr	r0, [r0, #32]
c0de8144:	bf18      	it	ne
c0de8146:	2000      	movne	r0, #0
c0de8148:	f89a 1000 	ldrb.w	r1, [sl]
c0de814c:	2902      	cmp	r1, #2
c0de814e:	d817      	bhi.n	c0de8180 <displayGenericContextPage+0x2e0>
c0de8150:	f010 0fe0 	tst.w	r0, #224	@ 0xe0
c0de8154:	d014      	beq.n	c0de8180 <displayGenericContextPage+0x2e0>
c0de8156:	0601      	lsls	r1, r0, #24
c0de8158:	d508      	bpl.n	c0de816c <displayGenericContextPage+0x2cc>
c0de815a:	eb09 010b 	add.w	r1, r9, fp
c0de815e:	6d89      	ldr	r1, [r1, #88]	@ 0x58
c0de8160:	7809      	ldrb	r1, [r1, #0]
c0de8162:	06c9      	lsls	r1, r1, #27
c0de8164:	d402      	bmi.n	c0de816c <displayGenericContextPage+0x2cc>
c0de8166:	494d      	ldr	r1, [pc, #308]	@ (c0de829c <displayGenericContextPage+0x3fc>)
c0de8168:	4479      	add	r1, pc
c0de816a:	e001      	b.n	c0de8170 <displayGenericContextPage+0x2d0>
c0de816c:	494c      	ldr	r1, [pc, #304]	@ (c0de82a0 <displayGenericContextPage+0x400>)
c0de816e:	4479      	add	r1, pc
c0de8170:	0680      	lsls	r0, r0, #26
c0de8172:	9103      	str	r1, [sp, #12]
c0de8174:	f04f 0010 	mov.w	r0, #16
c0de8178:	bf58      	it	pl
c0de817a:	2011      	movpl	r0, #17
c0de817c:	f88d 000b 	strb.w	r0, [sp, #11]
c0de8180:	4848      	ldr	r0, [pc, #288]	@ (c0de82a4 <displayGenericContextPage+0x404>)
c0de8182:	eb09 0408 	add.w	r4, r9, r8
c0de8186:	aa01      	add	r2, sp, #4
c0de8188:	f104 0160 	add.w	r1, r4, #96	@ 0x60
c0de818c:	4478      	add	r0, pc
c0de818e:	f7ff fad1 	bl	c0de7734 <nbgl_pageDrawGenericContent>
c0de8192:	6160      	str	r0, [r4, #20]
c0de8194:	2001      	movs	r0, #1
c0de8196:	2f00      	cmp	r7, #0
c0de8198:	bf18      	it	ne
c0de819a:	2002      	movne	r0, #2
c0de819c:	f002 fb94 	bl	c0dea8c8 <nbgl_refreshSpecial>
c0de81a0:	b020      	add	sp, #128	@ 0x80
c0de81a2:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de81a6:	f8da 1008 	ldr.w	r1, [sl, #8]
c0de81aa:	4630      	mov	r0, r6
c0de81ac:	4788      	blx	r1
c0de81ae:	f002 fda3 	bl	c0deacf8 <pic>
c0de81b2:	7b01      	ldrb	r1, [r0, #12]
c0de81b4:	0789      	lsls	r1, r1, #30
c0de81b6:	d42e      	bmi.n	c0de8216 <displayGenericContextPage+0x376>
c0de81b8:	4937      	ldr	r1, [pc, #220]	@ (c0de8298 <displayGenericContextPage+0x3f8>)
c0de81ba:	4479      	add	r1, pc
c0de81bc:	910b      	str	r1, [sp, #44]	@ 0x2c
c0de81be:	210a      	movs	r1, #10
c0de81c0:	f88d 1030 	strb.w	r1, [sp, #48]	@ 0x30
c0de81c4:	2100      	movs	r1, #0
c0de81c6:	910a      	str	r1, [sp, #40]	@ 0x28
c0de81c8:	eb09 010b 	add.w	r1, r9, fp
c0de81cc:	e9d0 2000 	ldrd	r2, r0, [r0]
c0de81d0:	e9c1 2006 	strd	r2, r0, [r1, #24]
c0de81d4:	f89a 0011 	ldrb.w	r0, [sl, #17]
c0de81d8:	f881 0020 	strb.w	r0, [r1, #32]
c0de81dc:	2005      	movs	r0, #5
c0de81de:	f88d 0010 	strb.w	r0, [sp, #16]
c0de81e2:	f88d 501c 	strb.w	r5, [sp, #28]
c0de81e6:	f89a 000f 	ldrb.w	r0, [sl, #15]
c0de81ea:	f88d 001f 	strb.w	r0, [sp, #31]
c0de81ee:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de81f2:	b328      	cbz	r0, c0de8240 <displayGenericContextPage+0x3a0>
c0de81f4:	eb00 1006 	add.w	r0, r0, r6, lsl #4
c0de81f8:	f002 fd7e 	bl	c0deacf8 <pic>
c0de81fc:	9005      	str	r0, [sp, #20]
c0de81fe:	f100 010c 	add.w	r1, r0, #12
c0de8202:	1c68      	adds	r0, r5, #1
c0de8204:	3801      	subs	r0, #1
c0de8206:	d033      	beq.n	c0de8270 <displayGenericContextPage+0x3d0>
c0de8208:	f101 0210 	add.w	r2, r1, #16
c0de820c:	7809      	ldrb	r1, [r1, #0]
c0de820e:	0749      	lsls	r1, r1, #29
c0de8210:	4611      	mov	r1, r2
c0de8212:	d5f7      	bpl.n	c0de8204 <displayGenericContextPage+0x364>
c0de8214:	e029      	b.n	c0de826a <displayGenericContextPage+0x3ca>
c0de8216:	2101      	movs	r1, #1
c0de8218:	f88d 1010 	strb.w	r1, [sp, #16]
c0de821c:	6881      	ldr	r1, [r0, #8]
c0de821e:	4a22      	ldr	r2, [pc, #136]	@ (c0de82a8 <displayGenericContextPage+0x408>)
c0de8220:	447a      	add	r2, pc
c0de8222:	920c      	str	r2, [sp, #48]	@ 0x30
c0de8224:	e9d0 2000 	ldrd	r2, r0, [r0]
c0de8228:	9106      	str	r1, [sp, #24]
c0de822a:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de822c:	2000      	movs	r0, #0
c0de822e:	9209      	str	r2, [sp, #36]	@ 0x24
c0de8230:	f88d 0036 	strb.w	r0, [sp, #54]	@ 0x36
c0de8234:	f8ad 0034 	strh.w	r0, [sp, #52]	@ 0x34
c0de8238:	900a      	str	r0, [sp, #40]	@ 0x28
c0de823a:	f88d 0014 	strb.w	r0, [sp, #20]
c0de823e:	e779      	b.n	c0de8134 <displayGenericContextPage+0x294>
c0de8240:	2400      	movs	r4, #0
c0de8242:	9405      	str	r4, [sp, #20]
c0de8244:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de8248:	f88d 601d 	strb.w	r6, [sp, #29]
c0de824c:	9006      	str	r0, [sp, #24]
c0de824e:	b2e0      	uxtb	r0, r4
c0de8250:	42a8      	cmp	r0, r5
c0de8252:	d20d      	bcs.n	c0de8270 <displayGenericContextPage+0x3d0>
c0de8254:	19a0      	adds	r0, r4, r6
c0de8256:	f8da 1008 	ldr.w	r1, [sl, #8]
c0de825a:	b2c0      	uxtb	r0, r0
c0de825c:	4788      	blx	r1
c0de825e:	f002 fd4b 	bl	c0deacf8 <pic>
c0de8262:	7b00      	ldrb	r0, [r0, #12]
c0de8264:	3401      	adds	r4, #1
c0de8266:	0740      	lsls	r0, r0, #29
c0de8268:	d5f1      	bpl.n	c0de824e <displayGenericContextPage+0x3ae>
c0de826a:	200d      	movs	r0, #13
c0de826c:	f88d 001f 	strb.w	r0, [sp, #31]
c0de8270:	2009      	movs	r0, #9
c0de8272:	f88d 001e 	strb.w	r0, [sp, #30]
c0de8276:	2000      	movs	r0, #0
c0de8278:	f88d 0020 	strb.w	r0, [sp, #32]
c0de827c:	f89a 0011 	ldrb.w	r0, [sl, #17]
c0de8280:	f88d 0021 	strb.w	r0, [sp, #33]	@ 0x21
c0de8284:	e756      	b.n	c0de8134 <displayGenericContextPage+0x294>
c0de8286:	bf00      	nop
c0de8288:	00001c28 	.word	0x00001c28
c0de828c:	00001ca4 	.word	0x00001ca4
c0de8290:	0000195c 	.word	0x0000195c
c0de8294:	00004f22 	.word	0x00004f22
c0de8298:	0000485c 	.word	0x0000485c
c0de829c:	00004168 	.word	0x00004168
c0de82a0:	000044ab 	.word	0x000044ab
c0de82a4:	000002a5 	.word	0x000002a5
c0de82a8:	00004ce9 	.word	0x00004ce9

c0de82ac <nbgl_useCaseHomeAndSettings>:
c0de82ac:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de82b0:	f8df 8060 	ldr.w	r8, [pc, #96]	@ c0de8314 <nbgl_useCaseHomeAndSettings+0x68>
c0de82b4:	469a      	mov	sl, r3
c0de82b6:	4615      	mov	r5, r2
c0de82b8:	460e      	mov	r6, r1
c0de82ba:	4607      	mov	r7, r0
c0de82bc:	eb09 0408 	add.w	r4, r9, r8
c0de82c0:	f7ff fc56 	bl	c0de7b70 <reset_callbacks_and_context>
c0de82c4:	9809      	ldr	r0, [sp, #36]	@ 0x24
c0de82c6:	6320      	str	r0, [r4, #48]	@ 0x30
c0de82c8:	9808      	ldr	r0, [sp, #32]
c0de82ca:	e9c4 7608 	strd	r7, r6, [r4, #32]
c0de82ce:	e9c4 500a 	strd	r5, r0, [r4, #40]	@ 0x28
c0de82d2:	e9dd 100a 	ldrd	r1, r0, [sp, #40]	@ 0x28
c0de82d6:	b131      	cbz	r1, c0de82e6 <nbgl_useCaseHomeAndSettings+0x3a>
c0de82d8:	eb09 0208 	add.w	r2, r9, r8
c0de82dc:	e891 0078 	ldmia.w	r1, {r3, r4, r5, r6}
c0de82e0:	3234      	adds	r2, #52	@ 0x34
c0de82e2:	c278      	stmia	r2!, {r3, r4, r5, r6}
c0de82e4:	e006      	b.n	c0de82f4 <nbgl_useCaseHomeAndSettings+0x48>
c0de82e6:	eb09 0108 	add.w	r1, r9, r8
c0de82ea:	2200      	movs	r2, #0
c0de82ec:	e9c1 220d 	strd	r2, r2, [r1, #52]	@ 0x34
c0de82f0:	e9c1 220f 	strd	r2, r2, [r1, #60]	@ 0x3c
c0de82f4:	eb09 0108 	add.w	r1, r9, r8
c0de82f8:	f1ba 0fff 	cmp.w	sl, #255	@ 0xff
c0de82fc:	6448      	str	r0, [r1, #68]	@ 0x44
c0de82fe:	d004      	beq.n	c0de830a <nbgl_useCaseHomeAndSettings+0x5e>
c0de8300:	4650      	mov	r0, sl
c0de8302:	e8bd 45f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de8306:	f000 b807 	b.w	c0de8318 <bundleNavStartSettingsAtPage>
c0de830a:	e8bd 45f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de830e:	f000 b815 	b.w	c0de833c <bundleNavStartHome>
c0de8312:	bf00      	nop
c0de8314:	00001ca4 	.word	0x00001ca4

c0de8318 <bundleNavStartSettingsAtPage>:
c0de8318:	b51c      	push	{r2, r3, r4, lr}
c0de831a:	4601      	mov	r1, r0
c0de831c:	4805      	ldr	r0, [pc, #20]	@ (c0de8334 <bundleNavStartSettingsAtPage+0x1c>)
c0de831e:	eb09 0300 	add.w	r3, r9, r0
c0de8322:	6a18      	ldr	r0, [r3, #32]
c0de8324:	e9d3 230b 	ldrd	r2, r3, [r3, #44]	@ 0x2c
c0de8328:	4c03      	ldr	r4, [pc, #12]	@ (c0de8338 <bundleNavStartSettingsAtPage+0x20>)
c0de832a:	447c      	add	r4, pc
c0de832c:	9400      	str	r4, [sp, #0]
c0de832e:	f7ff fca3 	bl	c0de7c78 <nbgl_useCaseGenericSettings>
c0de8332:	bd1c      	pop	{r2, r3, r4, pc}
c0de8334:	00001ca4 	.word	0x00001ca4
c0de8338:	0000000f 	.word	0x0000000f

c0de833c <bundleNavStartHome>:
c0de833c:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
c0de833e:	4809      	ldr	r0, [pc, #36]	@ (c0de8364 <bundleNavStartHome+0x28>)
c0de8340:	eb09 0400 	add.w	r4, r9, r0
c0de8344:	f104 0320 	add.w	r3, r4, #32
c0de8348:	6c65      	ldr	r5, [r4, #68]	@ 0x44
c0de834a:	3434      	adds	r4, #52	@ 0x34
c0de834c:	cb0f      	ldmia	r3, {r0, r1, r2, r3}
c0de834e:	4e06      	ldr	r6, [pc, #24]	@ (c0de8368 <bundleNavStartHome+0x2c>)
c0de8350:	2b00      	cmp	r3, #0
c0de8352:	9502      	str	r5, [sp, #8]
c0de8354:	447e      	add	r6, pc
c0de8356:	e9cd 4600 	strd	r4, r6, [sp]
c0de835a:	bf18      	it	ne
c0de835c:	2301      	movne	r3, #1
c0de835e:	f7ff fb6d 	bl	c0de7a3c <useCaseHomeExt>
c0de8362:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}
c0de8364:	00001ca4 	.word	0x00001ca4
c0de8368:	0000113d 	.word	0x0000113d

c0de836c <nbgl_useCaseStatus>:
c0de836c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de8370:	b090      	sub	sp, #64	@ 0x40
c0de8372:	4604      	mov	r4, r0
c0de8374:	4822      	ldr	r0, [pc, #136]	@ (c0de8400 <nbgl_useCaseStatus+0x94>)
c0de8376:	460e      	mov	r6, r1
c0de8378:	4615      	mov	r5, r2
c0de837a:	a90d      	add	r1, sp, #52	@ 0x34
c0de837c:	f8df 807c 	ldr.w	r8, [pc, #124]	@ c0de83fc <nbgl_useCaseStatus+0x90>
c0de8380:	4478      	add	r0, pc
c0de8382:	e890 008c 	ldmia.w	r0, {r2, r3, r7}
c0de8386:	c18c      	stmia	r1!, {r2, r3, r7}
c0de8388:	eb09 0708 	add.w	r7, r9, r8
c0de838c:	f7ff fbf0 	bl	c0de7b70 <reset_callbacks_and_context>
c0de8390:	607d      	str	r5, [r7, #4]
c0de8392:	b156      	cbz	r6, c0de83aa <nbgl_useCaseStatus+0x3e>
c0de8394:	2003      	movs	r0, #3
c0de8396:	f7fa fc96 	bl	c0de2cc6 <os_io_seph_cmd_piezo_play_tune>
c0de839a:	481a      	ldr	r0, [pc, #104]	@ (c0de8404 <nbgl_useCaseStatus+0x98>)
c0de839c:	a90d      	add	r1, sp, #52	@ 0x34
c0de839e:	4622      	mov	r2, r4
c0de83a0:	2302      	movs	r3, #2
c0de83a2:	4478      	add	r0, pc
c0de83a4:	f7fe fe22 	bl	c0de6fec <nbgl_pageDrawLedgerInfo>
c0de83a8:	e020      	b.n	c0de83ec <nbgl_useCaseStatus+0x80>
c0de83aa:	2000      	movs	r0, #0
c0de83ac:	f44f 1140 	mov.w	r1, #3145728	@ 0x300000
c0de83b0:	466a      	mov	r2, sp
c0de83b2:	9005      	str	r0, [sp, #20]
c0de83b4:	9104      	str	r1, [sp, #16]
c0de83b6:	4914      	ldr	r1, [pc, #80]	@ (c0de8408 <nbgl_useCaseStatus+0x9c>)
c0de83b8:	e9cd 4000 	strd	r4, r0, [sp]
c0de83bc:	9006      	str	r0, [sp, #24]
c0de83be:	f88d 001c 	strb.w	r0, [sp, #28]
c0de83c2:	e9cd 000a 	strd	r0, r0, [sp, #40]	@ 0x28
c0de83c6:	4479      	add	r1, pc
c0de83c8:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de83cc:	f44f 6110 	mov.w	r1, #2304	@ 0x900
c0de83d0:	f44f 7000 	mov.w	r0, #512	@ 0x200
c0de83d4:	f8ad 1030 	strh.w	r1, [sp, #48]	@ 0x30
c0de83d8:	f8ad 0024 	strh.w	r0, [sp, #36]	@ 0x24
c0de83dc:	480b      	ldr	r0, [pc, #44]	@ (c0de840c <nbgl_useCaseStatus+0xa0>)
c0de83de:	4478      	add	r0, pc
c0de83e0:	9008      	str	r0, [sp, #32]
c0de83e2:	480b      	ldr	r0, [pc, #44]	@ (c0de8410 <nbgl_useCaseStatus+0xa4>)
c0de83e4:	a90d      	add	r1, sp, #52	@ 0x34
c0de83e6:	4478      	add	r0, pc
c0de83e8:	f7fe fe54 	bl	c0de7094 <nbgl_pageDrawInfo>
c0de83ec:	eb09 0108 	add.w	r1, r9, r8
c0de83f0:	6148      	str	r0, [r1, #20]
c0de83f2:	f001 fdbb 	bl	c0de9f6c <OUTLINED_FUNCTION_3>
c0de83f6:	b010      	add	sp, #64	@ 0x40
c0de83f8:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de83fc:	00001c28 	.word	0x00001c28
c0de8400:	00006078 	.word	0x00006078
c0de8404:	0000008f 	.word	0x0000008f
c0de8408:	00003598 	.word	0x00003598
c0de840c:	00004a8d 	.word	0x00004a8d
c0de8410:	0000004b 	.word	0x0000004b

c0de8414 <tickerCallback>:
c0de8414:	b510      	push	{r4, lr}
c0de8416:	4806      	ldr	r0, [pc, #24]	@ (c0de8430 <tickerCallback+0x1c>)
c0de8418:	eb09 0400 	add.w	r4, r9, r0
c0de841c:	6960      	ldr	r0, [r4, #20]
c0de841e:	f7ff f98c 	bl	c0de773a <nbgl_pageRelease>
c0de8422:	6860      	ldr	r0, [r4, #4]
c0de8424:	b110      	cbz	r0, c0de842c <tickerCallback+0x18>
c0de8426:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de842a:	4700      	bx	r0
c0de842c:	bd10      	pop	{r4, pc}
c0de842e:	bf00      	nop
c0de8430:	00001c28 	.word	0x00001c28

c0de8434 <pageCallback>:
c0de8434:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8438:	b092      	sub	sp, #72	@ 0x48
c0de843a:	b350      	cbz	r0, c0de8492 <pageCallback+0x5e>
c0de843c:	4605      	mov	r5, r0
c0de843e:	2801      	cmp	r0, #1
c0de8440:	d034      	beq.n	c0de84ac <pageCallback+0x78>
c0de8442:	2d12      	cmp	r5, #18
c0de8444:	d043      	beq.n	c0de84ce <pageCallback+0x9a>
c0de8446:	460c      	mov	r4, r1
c0de8448:	2d03      	cmp	r5, #3
c0de844a:	d055      	beq.n	c0de84f8 <pageCallback+0xc4>
c0de844c:	2d05      	cmp	r5, #5
c0de844e:	d05f      	beq.n	c0de8510 <pageCallback+0xdc>
c0de8450:	2d06      	cmp	r5, #6
c0de8452:	d075      	beq.n	c0de8540 <pageCallback+0x10c>
c0de8454:	2d07      	cmp	r5, #7
c0de8456:	d077      	beq.n	c0de8548 <pageCallback+0x114>
c0de8458:	2d08      	cmp	r5, #8
c0de845a:	f000 809e 	beq.w	c0de859a <pageCallback+0x166>
c0de845e:	2d09      	cmp	r5, #9
c0de8460:	f000 80a9 	beq.w	c0de85b6 <pageCallback+0x182>
c0de8464:	2d0a      	cmp	r5, #10
c0de8466:	f000 80b0 	beq.w	c0de85ca <pageCallback+0x196>
c0de846a:	2d0b      	cmp	r5, #11
c0de846c:	f000 80fa 	beq.w	c0de8664 <pageCallback+0x230>
c0de8470:	2d0c      	cmp	r5, #12
c0de8472:	f000 80fe 	beq.w	c0de8672 <pageCallback+0x23e>
c0de8476:	2d0d      	cmp	r5, #13
c0de8478:	f000 8105 	beq.w	c0de8686 <pageCallback+0x252>
c0de847c:	2d10      	cmp	r5, #16
c0de847e:	f000 810e 	beq.w	c0de869e <pageCallback+0x26a>
c0de8482:	2d11      	cmp	r5, #17
c0de8484:	f000 8113 	beq.w	c0de86ae <pageCallback+0x27a>
c0de8488:	2d02      	cmp	r5, #2
c0de848a:	f040 8119 	bne.w	c0de86c0 <pageCallback+0x28c>
c0de848e:	48cb      	ldr	r0, [pc, #812]	@ (c0de87bc <pageCallback+0x388>)
c0de8490:	e161      	b.n	c0de8756 <pageCallback+0x322>
c0de8492:	48ca      	ldr	r0, [pc, #808]	@ (c0de87bc <pageCallback+0x388>)
c0de8494:	eb09 0100 	add.w	r1, r9, r0
c0de8498:	f891 0060 	ldrb.w	r0, [r1, #96]	@ 0x60
c0de849c:	6889      	ldr	r1, [r1, #8]
c0de849e:	3801      	subs	r0, #1
c0de84a0:	2900      	cmp	r1, #0
c0de84a2:	f000 8124 	beq.w	c0de86ee <pageCallback+0x2ba>
c0de84a6:	b2c0      	uxtb	r0, r0
c0de84a8:	2101      	movs	r1, #1
c0de84aa:	e00b      	b.n	c0de84c4 <pageCallback+0x90>
c0de84ac:	48c3      	ldr	r0, [pc, #780]	@ (c0de87bc <pageCallback+0x388>)
c0de84ae:	eb09 0100 	add.w	r1, r9, r0
c0de84b2:	f891 0060 	ldrb.w	r0, [r1, #96]	@ 0x60
c0de84b6:	6889      	ldr	r1, [r1, #8]
c0de84b8:	3001      	adds	r0, #1
c0de84ba:	2900      	cmp	r1, #0
c0de84bc:	f000 8117 	beq.w	c0de86ee <pageCallback+0x2ba>
c0de84c0:	b2c0      	uxtb	r0, r0
c0de84c2:	2100      	movs	r1, #0
c0de84c4:	b012      	add	sp, #72	@ 0x48
c0de84c6:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de84ca:	f000 baa7 	b.w	c0de8a1c <displayReviewPage>
c0de84ce:	48b9      	ldr	r0, [pc, #740]	@ (c0de87b4 <pageCallback+0x380>)
c0de84d0:	eb09 0100 	add.w	r1, r9, r0
c0de84d4:	f891 1021 	ldrb.w	r1, [r1, #33]	@ 0x21
c0de84d8:	2900      	cmp	r1, #0
c0de84da:	f000 810f 	beq.w	c0de86fc <pageCallback+0x2c8>
c0de84de:	eb09 0100 	add.w	r1, r9, r0
c0de84e2:	6d89      	ldr	r1, [r1, #88]	@ 0x58
c0de84e4:	680a      	ldr	r2, [r1, #0]
c0de84e6:	2a00      	cmp	r2, #0
c0de84e8:	f000 8108 	beq.w	c0de86fc <pageCallback+0x2c8>
c0de84ec:	4448      	add	r0, r9
c0de84ee:	2201      	movs	r2, #1
c0de84f0:	f880 2068 	strb.w	r2, [r0, #104]	@ 0x68
c0de84f4:	6808      	ldr	r0, [r1, #0]
c0de84f6:	e0de      	b.n	c0de86b6 <pageCallback+0x282>
c0de84f8:	48b0      	ldr	r0, [pc, #704]	@ (c0de87bc <pageCallback+0x388>)
c0de84fa:	2cff      	cmp	r4, #255	@ 0xff
c0de84fc:	f000 812b 	beq.w	c0de8756 <pageCallback+0x322>
c0de8500:	f819 0000 	ldrb.w	r0, [r9, r0]
c0de8504:	1e81      	subs	r1, r0, #2
c0de8506:	2902      	cmp	r1, #2
c0de8508:	f080 8144 	bcs.w	c0de8794 <pageCallback+0x360>
c0de850c:	4620      	mov	r0, r4
c0de850e:	e0ef      	b.n	c0de86f0 <pageCallback+0x2bc>
c0de8510:	a80a      	add	r0, sp, #40	@ 0x28
c0de8512:	49b0      	ldr	r1, [pc, #704]	@ (c0de87d4 <pageCallback+0x3a0>)
c0de8514:	2220      	movs	r2, #32
c0de8516:	4479      	add	r1, pc
c0de8518:	f002 fe06 	bl	c0deb128 <__aeabi_memcpy>
c0de851c:	4ca7      	ldr	r4, [pc, #668]	@ (c0de87bc <pageCallback+0x388>)
c0de851e:	eb09 0004 	add.w	r0, r9, r4
c0de8522:	6a00      	ldr	r0, [r0, #32]
c0de8524:	b108      	cbz	r0, c0de852a <pageCallback+0xf6>
c0de8526:	f7ff f908 	bl	c0de773a <nbgl_pageRelease>
c0de852a:	48ab      	ldr	r0, [pc, #684]	@ (c0de87d8 <pageCallback+0x3a4>)
c0de852c:	a90a      	add	r1, sp, #40	@ 0x28
c0de852e:	4478      	add	r0, pc
c0de8530:	f7fe fea0 	bl	c0de7274 <nbgl_pageDrawConfirmation>
c0de8534:	eb09 0104 	add.w	r1, r9, r4
c0de8538:	6208      	str	r0, [r1, #32]
c0de853a:	f001 fd17 	bl	c0de9f6c <OUTLINED_FUNCTION_3>
c0de853e:	e111      	b.n	c0de8764 <pageCallback+0x330>
c0de8540:	489e      	ldr	r0, [pc, #632]	@ (c0de87bc <pageCallback+0x388>)
c0de8542:	4448      	add	r0, r9
c0de8544:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0de8546:	e108      	b.n	c0de875a <pageCallback+0x326>
c0de8548:	ac0a      	add	r4, sp, #40	@ 0x28
c0de854a:	499f      	ldr	r1, [pc, #636]	@ (c0de87c8 <pageCallback+0x394>)
c0de854c:	221c      	movs	r2, #28
c0de854e:	4620      	mov	r0, r4
c0de8550:	4479      	add	r1, pc
c0de8552:	f002 fde9 	bl	c0deb128 <__aeabi_memcpy>
c0de8556:	489d      	ldr	r0, [pc, #628]	@ (c0de87cc <pageCallback+0x398>)
c0de8558:	ad06      	add	r5, sp, #24
c0de855a:	4629      	mov	r1, r5
c0de855c:	4478      	add	r0, pc
c0de855e:	e890 00cc 	ldmia.w	r0, {r2, r3, r6, r7}
c0de8562:	f44f 3080 	mov.w	r0, #65536	@ 0x10000
c0de8566:	c1cc      	stmia	r1!, {r2, r3, r6, r7}
c0de8568:	4e95      	ldr	r6, [pc, #596]	@ (c0de87c0 <pageCallback+0x38c>)
c0de856a:	9005      	str	r0, [sp, #20]
c0de856c:	eb09 0706 	add.w	r7, r9, r6
c0de8570:	6878      	ldr	r0, [r7, #4]
c0de8572:	9002      	str	r0, [sp, #8]
c0de8574:	2000      	movs	r0, #0
c0de8576:	9003      	str	r0, [sp, #12]
c0de8578:	4620      	mov	r0, r4
c0de857a:	f7fa fdab 	bl	c0de30d4 <nbgl_layoutGet>
c0de857e:	4629      	mov	r1, r5
c0de8580:	6338      	str	r0, [r7, #48]	@ 0x30
c0de8582:	f7fd fb3f 	bl	c0de5c04 <nbgl_layoutAddHeader>
c0de8586:	6879      	ldr	r1, [r7, #4]
c0de8588:	200b      	movs	r0, #11
c0de858a:	f001 fd0b 	bl	c0de9fa4 <OUTLINED_FUNCTION_11>
c0de858e:	6879      	ldr	r1, [r7, #4]
c0de8590:	2804      	cmp	r0, #4
c0de8592:	f080 80be 	bcs.w	c0de8712 <pageCallback+0x2de>
c0de8596:	460c      	mov	r4, r1
c0de8598:	e0c7      	b.n	c0de872a <pageCallback+0x2f6>
c0de859a:	4888      	ldr	r0, [pc, #544]	@ (c0de87bc <pageCallback+0x388>)
c0de859c:	2c00      	cmp	r4, #0
c0de859e:	f040 80d8 	bne.w	c0de8752 <pageCallback+0x31e>
c0de85a2:	eb09 0100 	add.w	r1, r9, r0
c0de85a6:	6a49      	ldr	r1, [r1, #36]	@ 0x24
c0de85a8:	2900      	cmp	r1, #0
c0de85aa:	f000 80d2 	beq.w	c0de8752 <pageCallback+0x31e>
c0de85ae:	b012      	add	sp, #72	@ 0x48
c0de85b0:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de85b4:	4708      	bx	r1
c0de85b6:	4881      	ldr	r0, [pc, #516]	@ (c0de87bc <pageCallback+0x388>)
c0de85b8:	4448      	add	r0, r9
c0de85ba:	6981      	ldr	r1, [r0, #24]
c0de85bc:	2900      	cmp	r1, #0
c0de85be:	f000 80d1 	beq.w	c0de8764 <pageCallback+0x330>
c0de85c2:	fab4 f084 	clz	r0, r4
c0de85c6:	0940      	lsrs	r0, r0, #5
c0de85c8:	e059      	b.n	c0de867e <pageCallback+0x24a>
c0de85ca:	487a      	ldr	r0, [pc, #488]	@ (c0de87b4 <pageCallback+0x380>)
c0de85cc:	f8df 81ec 	ldr.w	r8, [pc, #492]	@ c0de87bc <pageCallback+0x388>
c0de85d0:	2700      	movs	r7, #0
c0de85d2:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de85d6:	f04f 0a0b 	mov.w	sl, #11
c0de85da:	4448      	add	r0, r9
c0de85dc:	eb09 0608 	add.w	r6, r9, r8
c0de85e0:	f890 4020 	ldrb.w	r4, [r0, #32]
c0de85e4:	e9d0 b506 	ldrd	fp, r5, [r0, #24]
c0de85e8:	200b      	movs	r0, #11
c0de85ea:	e9c6 770c 	strd	r7, r7, [r6, #48]	@ 0x30
c0de85ee:	e9c6 770e 	strd	r7, r7, [r6, #56]	@ 0x38
c0de85f2:	4629      	mov	r1, r5
c0de85f4:	4623      	mov	r3, r4
c0de85f6:	f002 f9bc 	bl	c0dea972 <nbgl_getTextNbLinesInWidth>
c0de85fa:	f100 010a 	add.w	r1, r0, #10
c0de85fe:	e9c6 b50d 	strd	fp, r5, [r6, #52]	@ 0x34
c0de8602:	f886 4033 	strb.w	r4, [r6, #51]	@ 0x33
c0de8606:	f886 7031 	strb.w	r7, [r6, #49]	@ 0x31
c0de860a:	fbb1 f1fa 	udiv	r1, r1, sl
c0de860e:	b2ca      	uxtb	r2, r1
c0de8610:	f886 1030 	strb.w	r1, [r6, #48]	@ 0x30
c0de8614:	2a02      	cmp	r2, #2
c0de8616:	d31e      	bcc.n	c0de8656 <pageCallback+0x222>
c0de8618:	3a01      	subs	r2, #1
c0de861a:	241a      	movs	r4, #26
c0de861c:	eb02 0342 	add.w	r3, r2, r2, lsl #1
c0de8620:	3319      	adds	r3, #25
c0de8622:	b29b      	uxth	r3, r3
c0de8624:	fbb3 f4f4 	udiv	r4, r3, r4
c0de8628:	b2e4      	uxtb	r4, r4
c0de862a:	fbb4 f5fa 	udiv	r5, r4, sl
c0de862e:	fb05 441a 	mls	r4, r5, sl, r4
c0de8632:	f06f 050a 	mvn.w	r5, #10
c0de8636:	fb02 0005 	mla	r0, r2, r5, r0
c0de863a:	f44f 728f 	mov.w	r2, #286	@ 0x11e
c0de863e:	fbb3 f2f2 	udiv	r2, r3, r2
c0de8642:	b2c0      	uxtb	r0, r0
c0de8644:	4420      	add	r0, r4
c0de8646:	4411      	add	r1, r2
c0de8648:	280b      	cmp	r0, #11
c0de864a:	eb09 0008 	add.w	r0, r9, r8
c0de864e:	bf88      	it	hi
c0de8650:	3101      	addhi	r1, #1
c0de8652:	f880 1030 	strb.w	r1, [r0, #48]	@ 0x30
c0de8656:	2000      	movs	r0, #0
c0de8658:	2101      	movs	r1, #1
c0de865a:	b012      	add	sp, #72	@ 0x48
c0de865c:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8660:	f001 ba30 	b.w	c0de9ac4 <displayDetailsPage>
c0de8664:	4855      	ldr	r0, [pc, #340]	@ (c0de87bc <pageCallback+0x388>)
c0de8666:	4448      	add	r0, r9
c0de8668:	6981      	ldr	r1, [r0, #24]
c0de866a:	2900      	cmp	r1, #0
c0de866c:	d07a      	beq.n	c0de8764 <pageCallback+0x330>
c0de866e:	2001      	movs	r0, #1
c0de8670:	e005      	b.n	c0de867e <pageCallback+0x24a>
c0de8672:	4852      	ldr	r0, [pc, #328]	@ (c0de87bc <pageCallback+0x388>)
c0de8674:	4448      	add	r0, r9
c0de8676:	6981      	ldr	r1, [r0, #24]
c0de8678:	2900      	cmp	r1, #0
c0de867a:	d073      	beq.n	c0de8764 <pageCallback+0x330>
c0de867c:	2000      	movs	r0, #0
c0de867e:	b012      	add	sp, #72	@ 0x48
c0de8680:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8684:	4708      	bx	r1
c0de8686:	484b      	ldr	r0, [pc, #300]	@ (c0de87b4 <pageCallback+0x380>)
c0de8688:	eb09 0100 	add.w	r1, r9, r0
c0de868c:	4448      	add	r0, r9
c0de868e:	6a49      	ldr	r1, [r1, #36]	@ 0x24
c0de8690:	2900      	cmp	r1, #0
c0de8692:	d06a      	beq.n	c0de876a <pageCallback+0x336>
c0de8694:	7c80      	ldrb	r0, [r0, #18]
c0de8696:	4420      	add	r0, r4
c0de8698:	eb01 1000 	add.w	r0, r1, r0, lsl #4
c0de869c:	e06a      	b.n	c0de8774 <pageCallback+0x340>
c0de869e:	4845      	ldr	r0, [pc, #276]	@ (c0de87b4 <pageCallback+0x380>)
c0de86a0:	2100      	movs	r1, #0
c0de86a2:	4448      	add	r0, r9
c0de86a4:	6581      	str	r1, [r0, #88]	@ 0x58
c0de86a6:	f880 1069 	strb.w	r1, [r0, #105]	@ 0x69
c0de86aa:	2010      	movs	r0, #16
c0de86ac:	e003      	b.n	c0de86b6 <pageCallback+0x282>
c0de86ae:	4a41      	ldr	r2, [pc, #260]	@ (c0de87b4 <pageCallback+0x380>)
c0de86b0:	f001 fc5f 	bl	c0de9f72 <OUTLINED_FUNCTION_4>
c0de86b4:	d067      	beq.n	c0de8786 <pageCallback+0x352>
c0de86b6:	b012      	add	sp, #72	@ 0x48
c0de86b8:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de86bc:	f000 bfcc 	b.w	c0de9658 <displaySecurityReport>
c0de86c0:	4e3e      	ldr	r6, [pc, #248]	@ (c0de87bc <pageCallback+0x388>)
c0de86c2:	eb09 0006 	add.w	r0, r9, r6
c0de86c6:	6ac3      	ldr	r3, [r0, #44]	@ 0x2c
c0de86c8:	b133      	cbz	r3, c0de86d8 <pageCallback+0x2a4>
c0de86ca:	eb09 0006 	add.w	r0, r9, r6
c0de86ce:	4621      	mov	r1, r4
c0de86d0:	f890 2060 	ldrb.w	r2, [r0, #96]	@ 0x60
c0de86d4:	4628      	mov	r0, r5
c0de86d6:	4798      	blx	r3
c0de86d8:	eb09 0006 	add.w	r0, r9, r6
c0de86dc:	68c2      	ldr	r2, [r0, #12]
c0de86de:	2a00      	cmp	r2, #0
c0de86e0:	d040      	beq.n	c0de8764 <pageCallback+0x330>
c0de86e2:	4628      	mov	r0, r5
c0de86e4:	4621      	mov	r1, r4
c0de86e6:	b012      	add	sp, #72	@ 0x48
c0de86e8:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de86ec:	4710      	bx	r2
c0de86ee:	b2c0      	uxtb	r0, r0
c0de86f0:	2100      	movs	r1, #0
c0de86f2:	b012      	add	sp, #72	@ 0x48
c0de86f4:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de86f8:	f7ff bbd2 	b.w	c0de7ea0 <displayGenericContextPage>
c0de86fc:	482e      	ldr	r0, [pc, #184]	@ (c0de87b8 <pageCallback+0x384>)
c0de86fe:	2200      	movs	r2, #0
c0de8700:	eb09 0100 	add.w	r1, r9, r0
c0de8704:	6888      	ldr	r0, [r1, #8]
c0de8706:	3110      	adds	r1, #16
c0de8708:	b012      	add	sp, #72	@ 0x48
c0de870a:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de870e:	f001 b929 	b.w	c0de9964 <displayInfosListModal>
c0de8712:	2080      	movs	r0, #128	@ 0x80
c0de8714:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de8718:	2303      	movs	r3, #3
c0de871a:	9001      	str	r0, [sp, #4]
c0de871c:	4829      	ldr	r0, [pc, #164]	@ (c0de87c4 <pageCallback+0x390>)
c0de871e:	eb09 0400 	add.w	r4, r9, r0
c0de8722:	200b      	movs	r0, #11
c0de8724:	9400      	str	r4, [sp, #0]
c0de8726:	f002 f933 	bl	c0dea990 <nbgl_textReduceOnNbLines>
c0de872a:	9404      	str	r4, [sp, #16]
c0de872c:	eb09 0406 	add.w	r4, r9, r6
c0de8730:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0de8732:	a902      	add	r1, sp, #8
c0de8734:	f7fc fe0b 	bl	c0de534e <nbgl_layoutAddQRCode>
c0de8738:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0de873a:	4925      	ldr	r1, [pc, #148]	@ (c0de87d0 <pageCallback+0x39c>)
c0de873c:	2215      	movs	r2, #21
c0de873e:	2309      	movs	r3, #9
c0de8740:	4479      	add	r1, pc
c0de8742:	f7fd fa38 	bl	c0de5bb6 <nbgl_layoutAddFooter>
c0de8746:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0de8748:	f7fd febe 	bl	c0de64c8 <nbgl_layoutDraw>
c0de874c:	f002 f8b7 	bl	c0dea8be <nbgl_refresh>
c0de8750:	e008      	b.n	c0de8764 <pageCallback+0x330>
c0de8752:	2c01      	cmp	r4, #1
c0de8754:	d106      	bne.n	c0de8764 <pageCallback+0x330>
c0de8756:	4448      	add	r0, r9
c0de8758:	6840      	ldr	r0, [r0, #4]
c0de875a:	b118      	cbz	r0, c0de8764 <pageCallback+0x330>
c0de875c:	b012      	add	sp, #72	@ 0x48
c0de875e:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8762:	4700      	bx	r0
c0de8764:	b012      	add	sp, #72	@ 0x48
c0de8766:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de876a:	6a81      	ldr	r1, [r0, #40]	@ 0x28
c0de876c:	7c80      	ldrb	r0, [r0, #18]
c0de876e:	4420      	add	r0, r4
c0de8770:	b2c0      	uxtb	r0, r0
c0de8772:	4788      	blx	r1
c0de8774:	e9d0 3100 	ldrd	r3, r1, [r0]
c0de8778:	6882      	ldr	r2, [r0, #8]
c0de877a:	4618      	mov	r0, r3
c0de877c:	b012      	add	sp, #72	@ 0x48
c0de877e:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8782:	f000 be8b 	b.w	c0de949c <displayFullValuePage>
c0de8786:	eb09 0002 	add.w	r0, r9, r2
c0de878a:	f890 0069 	ldrb.w	r0, [r0, #105]	@ 0x69
c0de878e:	b120      	cbz	r0, c0de879a <pageCallback+0x366>
c0de8790:	6948      	ldr	r0, [r1, #20]
c0de8792:	e003      	b.n	c0de879c <pageCallback+0x368>
c0de8794:	b938      	cbnz	r0, c0de87a6 <pageCallback+0x372>
c0de8796:	4620      	mov	r0, r4
c0de8798:	e693      	b.n	c0de84c2 <pageCallback+0x8e>
c0de879a:	6988      	ldr	r0, [r1, #24]
c0de879c:	b012      	add	sp, #72	@ 0x48
c0de879e:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de87a2:	f001 b863 	b.w	c0de986c <displayCustomizedSecurityReport>
c0de87a6:	4620      	mov	r0, r4
c0de87a8:	2100      	movs	r1, #0
c0de87aa:	b012      	add	sp, #72	@ 0x48
c0de87ac:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de87b0:	f7ff ba30 	b.w	c0de7c14 <displaySettingsPage>
c0de87b4:	0000195c 	.word	0x0000195c
c0de87b8:	00001ca4 	.word	0x00001ca4
c0de87bc:	00001c28 	.word	0x00001c28
c0de87c0:	00001a70 	.word	0x00001a70
c0de87c4:	00001ba8 	.word	0x00001ba8
c0de87c8:	00005fcc 	.word	0x00005fcc
c0de87cc:	00005f44 	.word	0x00005f44
c0de87d0:	000041b0 	.word	0x000041b0
c0de87d4:	00005faa 	.word	0x00005faa
c0de87d8:	00000407 	.word	0x00000407

c0de87dc <nbgl_useCaseReviewStatus>:
c0de87dc:	460a      	mov	r2, r1
c0de87de:	b198      	cbz	r0, c0de8808 <nbgl_useCaseReviewStatus+0x2c>
c0de87e0:	2801      	cmp	r0, #1
c0de87e2:	d016      	beq.n	c0de8812 <nbgl_useCaseReviewStatus+0x36>
c0de87e4:	2802      	cmp	r0, #2
c0de87e6:	d019      	beq.n	c0de881c <nbgl_useCaseReviewStatus+0x40>
c0de87e8:	2803      	cmp	r0, #3
c0de87ea:	d01c      	beq.n	c0de8826 <nbgl_useCaseReviewStatus+0x4a>
c0de87ec:	2804      	cmp	r0, #4
c0de87ee:	d01f      	beq.n	c0de8830 <nbgl_useCaseReviewStatus+0x54>
c0de87f0:	2807      	cmp	r0, #7
c0de87f2:	d022      	beq.n	c0de883a <nbgl_useCaseReviewStatus+0x5e>
c0de87f4:	2806      	cmp	r0, #6
c0de87f6:	d025      	beq.n	c0de8844 <nbgl_useCaseReviewStatus+0x68>
c0de87f8:	2805      	cmp	r0, #5
c0de87fa:	bf18      	it	ne
c0de87fc:	4770      	bxne	lr
c0de87fe:	4815      	ldr	r0, [pc, #84]	@ (c0de8854 <nbgl_useCaseReviewStatus+0x78>)
c0de8800:	2100      	movs	r1, #0
c0de8802:	4478      	add	r0, pc
c0de8804:	f7ff bdb2 	b.w	c0de836c <nbgl_useCaseStatus>
c0de8808:	4813      	ldr	r0, [pc, #76]	@ (c0de8858 <nbgl_useCaseReviewStatus+0x7c>)
c0de880a:	2101      	movs	r1, #1
c0de880c:	4478      	add	r0, pc
c0de880e:	f7ff bdad 	b.w	c0de836c <nbgl_useCaseStatus>
c0de8812:	4812      	ldr	r0, [pc, #72]	@ (c0de885c <nbgl_useCaseReviewStatus+0x80>)
c0de8814:	2100      	movs	r1, #0
c0de8816:	4478      	add	r0, pc
c0de8818:	f7ff bda8 	b.w	c0de836c <nbgl_useCaseStatus>
c0de881c:	4810      	ldr	r0, [pc, #64]	@ (c0de8860 <nbgl_useCaseReviewStatus+0x84>)
c0de881e:	2101      	movs	r1, #1
c0de8820:	4478      	add	r0, pc
c0de8822:	f7ff bda3 	b.w	c0de836c <nbgl_useCaseStatus>
c0de8826:	480f      	ldr	r0, [pc, #60]	@ (c0de8864 <nbgl_useCaseReviewStatus+0x88>)
c0de8828:	2100      	movs	r1, #0
c0de882a:	4478      	add	r0, pc
c0de882c:	f7ff bd9e 	b.w	c0de836c <nbgl_useCaseStatus>
c0de8830:	4807      	ldr	r0, [pc, #28]	@ (c0de8850 <nbgl_useCaseReviewStatus+0x74>)
c0de8832:	2101      	movs	r1, #1
c0de8834:	4478      	add	r0, pc
c0de8836:	f7ff bd99 	b.w	c0de836c <nbgl_useCaseStatus>
c0de883a:	480c      	ldr	r0, [pc, #48]	@ (c0de886c <nbgl_useCaseReviewStatus+0x90>)
c0de883c:	2100      	movs	r1, #0
c0de883e:	4478      	add	r0, pc
c0de8840:	f7ff bd94 	b.w	c0de836c <nbgl_useCaseStatus>
c0de8844:	4808      	ldr	r0, [pc, #32]	@ (c0de8868 <nbgl_useCaseReviewStatus+0x8c>)
c0de8846:	2101      	movs	r1, #1
c0de8848:	4478      	add	r0, pc
c0de884a:	f7ff bd8f 	b.w	c0de836c <nbgl_useCaseStatus>
c0de884e:	bf00      	nop
c0de8850:	00003e16 	.word	0x00003e16
c0de8854:	00003ec7 	.word	0x00003ec7
c0de8858:	00003ff3 	.word	0x00003ff3
c0de885c:	000045ed 	.word	0x000045ed
c0de8860:	000040c1 	.word	0x000040c1
c0de8864:	00004423 	.word	0x00004423
c0de8868:	00003f51 	.word	0x00003f51
c0de886c:	00003e1d 	.word	0x00003e1d

c0de8870 <nbgl_useCaseChoice>:
c0de8870:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8874:	b088      	sub	sp, #32
c0de8876:	4683      	mov	fp, r0
c0de8878:	4668      	mov	r0, sp
c0de887a:	460e      	mov	r6, r1
c0de887c:	2118      	movs	r1, #24
c0de887e:	461c      	mov	r4, r3
c0de8880:	4617      	mov	r7, r2
c0de8882:	3008      	adds	r0, #8
c0de8884:	f002 fc5a 	bl	c0deb13c <__aeabi_memclr>
c0de8888:	b324      	cbz	r4, c0de88d4 <nbgl_useCaseChoice+0x64>
c0de888a:	f8dd 8040 	ldr.w	r8, [sp, #64]	@ 0x40
c0de888e:	f1b8 0f00 	cmp.w	r8, #0
c0de8892:	d01f      	beq.n	c0de88d4 <nbgl_useCaseChoice+0x64>
c0de8894:	4811      	ldr	r0, [pc, #68]	@ (c0de88dc <nbgl_useCaseChoice+0x6c>)
c0de8896:	f8dd a044 	ldr.w	sl, [sp, #68]	@ 0x44
c0de889a:	eb09 0500 	add.w	r5, r9, r0
c0de889e:	f7ff f967 	bl	c0de7b70 <reset_callbacks_and_context>
c0de88a2:	2000      	movs	r0, #0
c0de88a4:	f8c5 a018 	str.w	sl, [r5, #24]
c0de88a8:	e9cd 6700 	strd	r6, r7, [sp]
c0de88ac:	f8cd 8018 	str.w	r8, [sp, #24]
c0de88b0:	9405      	str	r4, [sp, #20]
c0de88b2:	f8cd b00c 	str.w	fp, [sp, #12]
c0de88b6:	4669      	mov	r1, sp
c0de88b8:	f88d 0011 	strb.w	r0, [sp, #17]
c0de88bc:	2009      	movs	r0, #9
c0de88be:	f88d 001e 	strb.w	r0, [sp, #30]
c0de88c2:	f88d 001c 	strb.w	r0, [sp, #28]
c0de88c6:	4806      	ldr	r0, [pc, #24]	@ (c0de88e0 <nbgl_useCaseChoice+0x70>)
c0de88c8:	4478      	add	r0, pc
c0de88ca:	f7fe fcd3 	bl	c0de7274 <nbgl_pageDrawConfirmation>
c0de88ce:	6168      	str	r0, [r5, #20]
c0de88d0:	f001 fb4c 	bl	c0de9f6c <OUTLINED_FUNCTION_3>
c0de88d4:	b008      	add	sp, #32
c0de88d6:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de88da:	bf00      	nop
c0de88dc:	00001c28 	.word	0x00001c28
c0de88e0:	fffffb69 	.word	0xfffffb69

c0de88e4 <nbgl_useCaseConfirm>:
c0de88e4:	b570      	push	{r4, r5, r6, lr}
c0de88e6:	b088      	sub	sp, #32
c0de88e8:	4c0f      	ldr	r4, [pc, #60]	@ (c0de8928 <nbgl_useCaseConfirm+0x44>)
c0de88ea:	9e0c      	ldr	r6, [sp, #48]	@ 0x30
c0de88ec:	f10d 0c14 	add.w	ip, sp, #20
c0de88f0:	eb09 0504 	add.w	r5, r9, r4
c0de88f4:	61ee      	str	r6, [r5, #28]
c0de88f6:	4e0d      	ldr	r6, [pc, #52]	@ (c0de892c <nbgl_useCaseConfirm+0x48>)
c0de88f8:	e8ac 004c 	stmia.w	ip!, {r2, r3, r6}
c0de88fc:	2200      	movs	r2, #0
c0de88fe:	9204      	str	r2, [sp, #16]
c0de8900:	4b0b      	ldr	r3, [pc, #44]	@ (c0de8930 <nbgl_useCaseConfirm+0x4c>)
c0de8902:	447b      	add	r3, pc
c0de8904:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0de8908:	6a28      	ldr	r0, [r5, #32]
c0de890a:	b108      	cbz	r0, c0de8910 <nbgl_useCaseConfirm+0x2c>
c0de890c:	f7fe ff15 	bl	c0de773a <nbgl_pageRelease>
c0de8910:	4808      	ldr	r0, [pc, #32]	@ (c0de8934 <nbgl_useCaseConfirm+0x50>)
c0de8912:	4669      	mov	r1, sp
c0de8914:	4478      	add	r0, pc
c0de8916:	f7fe fcad 	bl	c0de7274 <nbgl_pageDrawConfirmation>
c0de891a:	eb09 0104 	add.w	r1, r9, r4
c0de891e:	6208      	str	r0, [r1, #32]
c0de8920:	f001 fb24 	bl	c0de9f6c <OUTLINED_FUNCTION_3>
c0de8924:	b008      	add	sp, #32
c0de8926:	bd70      	pop	{r4, r5, r6, pc}
c0de8928:	00001c28 	.word	0x00001c28
c0de892c:	01090009 	.word	0x01090009
c0de8930:	00003268 	.word	0x00003268
c0de8934:	00000021 	.word	0x00000021

c0de8938 <pageModalCallback>:
c0de8938:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de893a:	460c      	mov	r4, r1
c0de893c:	280e      	cmp	r0, #14
c0de893e:	d008      	beq.n	c0de8952 <pageModalCallback+0x1a>
c0de8940:	4605      	mov	r5, r0
c0de8942:	280f      	cmp	r0, #15
c0de8944:	d117      	bne.n	c0de8976 <pageModalCallback+0x3e>
c0de8946:	4833      	ldr	r0, [pc, #204]	@ (c0de8a14 <pageModalCallback+0xdc>)
c0de8948:	4448      	add	r0, r9
c0de894a:	e9d0 2104 	ldrd	r2, r1, [r0, #16]
c0de894e:	6983      	ldr	r3, [r0, #24]
c0de8950:	e005      	b.n	c0de895e <pageModalCallback+0x26>
c0de8952:	482f      	ldr	r0, [pc, #188]	@ (c0de8a10 <pageModalCallback+0xd8>)
c0de8954:	4448      	add	r0, r9
c0de8956:	6b40      	ldr	r0, [r0, #52]	@ 0x34
c0de8958:	e9d0 2100 	ldrd	r2, r1, [r0]
c0de895c:	6883      	ldr	r3, [r0, #8]
c0de895e:	f852 0024 	ldr.w	r0, [r2, r4, lsl #2]
c0de8962:	eb04 0244 	add.w	r2, r4, r4, lsl #1
c0de8966:	f851 1024 	ldr.w	r1, [r1, r4, lsl #2]
c0de896a:	eb03 02c2 	add.w	r2, r3, r2, lsl #3
c0de896e:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de8972:	f000 bd93 	b.w	c0de949c <displayFullValuePage>
c0de8976:	4e28      	ldr	r6, [pc, #160]	@ (c0de8a18 <pageModalCallback+0xe0>)
c0de8978:	eb09 0706 	add.w	r7, r9, r6
c0de897c:	6a38      	ldr	r0, [r7, #32]
c0de897e:	f7fe fedc 	bl	c0de773a <nbgl_pageRelease>
c0de8982:	2000      	movs	r0, #0
c0de8984:	2d02      	cmp	r5, #2
c0de8986:	6238      	str	r0, [r7, #32]
c0de8988:	d032      	beq.n	c0de89f0 <pageModalCallback+0xb8>
c0de898a:	2d13      	cmp	r5, #19
c0de898c:	d00f      	beq.n	c0de89ae <pageModalCallback+0x76>
c0de898e:	2d04      	cmp	r5, #4
c0de8990:	d01e      	beq.n	c0de89d0 <pageModalCallback+0x98>
c0de8992:	2d05      	cmp	r5, #5
c0de8994:	d024      	beq.n	c0de89e0 <pageModalCallback+0xa8>
c0de8996:	2d09      	cmp	r5, #9
c0de8998:	d029      	beq.n	c0de89ee <pageModalCallback+0xb6>
c0de899a:	2d03      	cmp	r5, #3
c0de899c:	d137      	bne.n	c0de8a0e <pageModalCallback+0xd6>
c0de899e:	2cff      	cmp	r4, #255	@ 0xff
c0de89a0:	d026      	beq.n	c0de89f0 <pageModalCallback+0xb8>
c0de89a2:	4620      	mov	r0, r4
c0de89a4:	2100      	movs	r1, #0
c0de89a6:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de89aa:	f001 b88b 	b.w	c0de9ac4 <displayDetailsPage>
c0de89ae:	4818      	ldr	r0, [pc, #96]	@ (c0de8a10 <pageModalCallback+0xd8>)
c0de89b0:	eb09 0100 	add.w	r1, r9, r0
c0de89b4:	f891 1068 	ldrb.w	r1, [r1, #104]	@ 0x68
c0de89b8:	2902      	cmp	r1, #2
c0de89ba:	d119      	bne.n	c0de89f0 <pageModalCallback+0xb8>
c0de89bc:	4448      	add	r0, r9
c0de89be:	2101      	movs	r1, #1
c0de89c0:	f880 1068 	strb.w	r1, [r0, #104]	@ 0x68
c0de89c4:	6d80      	ldr	r0, [r0, #88]	@ 0x58
c0de89c6:	6800      	ldr	r0, [r0, #0]
c0de89c8:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de89cc:	f000 be44 	b.w	c0de9658 <displaySecurityReport>
c0de89d0:	2cff      	cmp	r4, #255	@ 0xff
c0de89d2:	d00d      	beq.n	c0de89f0 <pageModalCallback+0xb8>
c0de89d4:	4620      	mov	r0, r4
c0de89d6:	2100      	movs	r1, #0
c0de89d8:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de89dc:	f001 b92c 	b.w	c0de9c38 <displayTagValueListModalPage>
c0de89e0:	b934      	cbnz	r4, c0de89f0 <pageModalCallback+0xb8>
c0de89e2:	20ff      	movs	r0, #255	@ 0xff
c0de89e4:	2101      	movs	r1, #1
c0de89e6:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de89ea:	f7ff ba59 	b.w	c0de7ea0 <displayGenericContextPage>
c0de89ee:	b12c      	cbz	r4, c0de89fc <pageModalCallback+0xc4>
c0de89f0:	f001 ff8d 	bl	c0dea90e <nbgl_screenRedraw>
c0de89f4:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de89f8:	f001 bf61 	b.w	c0dea8be <nbgl_refresh>
c0de89fc:	eb09 0006 	add.w	r0, r9, r6
c0de8a00:	69c0      	ldr	r0, [r0, #28]
c0de8a02:	b120      	cbz	r0, c0de8a0e <pageModalCallback+0xd6>
c0de8a04:	4780      	blx	r0
c0de8a06:	eb09 0006 	add.w	r0, r9, r6
c0de8a0a:	2100      	movs	r1, #0
c0de8a0c:	61c1      	str	r1, [r0, #28]
c0de8a0e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de8a10:	0000195c 	.word	0x0000195c
c0de8a14:	00001ca4 	.word	0x00001ca4
c0de8a18:	00001c28 	.word	0x00001c28

c0de8a1c <displayReviewPage>:
c0de8a1c:	b570      	push	{r4, r5, r6, lr}
c0de8a1e:	b090      	sub	sp, #64	@ 0x40
c0de8a20:	460c      	mov	r4, r1
c0de8a22:	4605      	mov	r5, r0
c0de8a24:	4668      	mov	r0, sp
c0de8a26:	2140      	movs	r1, #64	@ 0x40
c0de8a28:	f002 fb88 	bl	c0deb13c <__aeabi_memclr>
c0de8a2c:	4e24      	ldr	r6, [pc, #144]	@ (c0de8ac0 <displayReviewPage+0xa4>)
c0de8a2e:	eb09 0006 	add.w	r0, r9, r6
c0de8a32:	f890 0061 	ldrb.w	r0, [r0, #97]	@ 0x61
c0de8a36:	b108      	cbz	r0, c0de8a3c <displayReviewPage+0x20>
c0de8a38:	42a8      	cmp	r0, r5
c0de8a3a:	d93f      	bls.n	c0de8abc <displayReviewPage+0xa0>
c0de8a3c:	eb09 0006 	add.w	r0, r9, r6
c0de8a40:	6882      	ldr	r2, [r0, #8]
c0de8a42:	f880 5060 	strb.w	r5, [r0, #96]	@ 0x60
c0de8a46:	b3ca      	cbz	r2, c0de8abc <displayReviewPage+0xa0>
c0de8a48:	4669      	mov	r1, sp
c0de8a4a:	4628      	mov	r0, r5
c0de8a4c:	4790      	blx	r2
c0de8a4e:	b3a8      	cbz	r0, c0de8abc <displayReviewPage+0xa0>
c0de8a50:	2009      	movs	r0, #9
c0de8a52:	2100      	movs	r1, #0
c0de8a54:	f88d 0006 	strb.w	r0, [sp, #6]
c0de8a58:	f89d 000c 	ldrb.w	r0, [sp, #12]
c0de8a5c:	f88d 1004 	strb.w	r1, [sp, #4]
c0de8a60:	9100      	str	r1, [sp, #0]
c0de8a62:	2806      	cmp	r0, #6
c0de8a64:	d00e      	beq.n	c0de8a84 <displayReviewPage+0x68>
c0de8a66:	2804      	cmp	r0, #4
c0de8a68:	d015      	beq.n	c0de8a96 <displayReviewPage+0x7a>
c0de8a6a:	2805      	cmp	r0, #5
c0de8a6c:	d010      	beq.n	c0de8a90 <displayReviewPage+0x74>
c0de8a6e:	2802      	cmp	r0, #2
c0de8a70:	d114      	bne.n	c0de8a9c <displayReviewPage+0x80>
c0de8a72:	eb09 0006 	add.w	r0, r9, r6
c0de8a76:	f890 1060 	ldrb.w	r1, [r0, #96]	@ 0x60
c0de8a7a:	3101      	adds	r1, #1
c0de8a7c:	f880 1061 	strb.w	r1, [r0, #97]	@ 0x61
c0de8a80:	200b      	movs	r0, #11
c0de8a82:	e009      	b.n	c0de8a98 <displayReviewPage+0x7c>
c0de8a84:	200b      	movs	r0, #11
c0de8a86:	f88d 101c 	strb.w	r1, [sp, #28]
c0de8a8a:	f88d 0038 	strb.w	r0, [sp, #56]	@ 0x38
c0de8a8e:	e005      	b.n	c0de8a9c <displayReviewPage+0x80>
c0de8a90:	2009      	movs	r0, #9
c0de8a92:	f88d 001a 	strb.w	r0, [sp, #26]
c0de8a96:	2000      	movs	r0, #0
c0de8a98:	f88d 001c 	strb.w	r0, [sp, #28]
c0de8a9c:	4809      	ldr	r0, [pc, #36]	@ (c0de8ac4 <displayReviewPage+0xa8>)
c0de8a9e:	eb09 0506 	add.w	r5, r9, r6
c0de8aa2:	466a      	mov	r2, sp
c0de8aa4:	f105 0160 	add.w	r1, r5, #96	@ 0x60
c0de8aa8:	4478      	add	r0, pc
c0de8aaa:	f7fe fe43 	bl	c0de7734 <nbgl_pageDrawGenericContent>
c0de8aae:	6168      	str	r0, [r5, #20]
c0de8ab0:	2001      	movs	r0, #1
c0de8ab2:	2c00      	cmp	r4, #0
c0de8ab4:	bf18      	it	ne
c0de8ab6:	2002      	movne	r0, #2
c0de8ab8:	f001 ff06 	bl	c0dea8c8 <nbgl_refreshSpecial>
c0de8abc:	b010      	add	sp, #64	@ 0x40
c0de8abe:	bd70      	pop	{r4, r5, r6, pc}
c0de8ac0:	00001c28 	.word	0x00001c28
c0de8ac4:	fffff989 	.word	0xfffff989

c0de8ac8 <nbgl_useCaseReview>:
c0de8ac8:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de8aca:	b087      	sub	sp, #28
c0de8acc:	461c      	mov	r4, r3
c0de8ace:	f001 fa3d 	bl	c0de9f4c <OUTLINED_FUNCTION_0>
c0de8ad2:	2001      	movs	r0, #1
c0de8ad4:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de8ad6:	462a      	mov	r2, r5
c0de8ad8:	4623      	mov	r3, r4
c0de8ada:	9005      	str	r0, [sp, #20]
c0de8adc:	2000      	movs	r0, #0
c0de8ade:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de8ae2:	9004      	str	r0, [sp, #16]
c0de8ae4:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de8ae6:	4631      	mov	r1, r6
c0de8ae8:	f001 fa52 	bl	c0de9f90 <OUTLINED_FUNCTION_7>
c0de8aec:	b007      	add	sp, #28
c0de8aee:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de8af0 <useCaseReview>:
c0de8af0:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de8af4:	4682      	mov	sl, r0
c0de8af6:	4840      	ldr	r0, [pc, #256]	@ (c0de8bf8 <useCaseReview+0x108>)
c0de8af8:	4688      	mov	r8, r1
c0de8afa:	2102      	movs	r1, #2
c0de8afc:	4614      	mov	r4, r2
c0de8afe:	f04f 0b00 	mov.w	fp, #0
c0de8b02:	4e40      	ldr	r6, [pc, #256]	@ (c0de8c04 <useCaseReview+0x114>)
c0de8b04:	461f      	mov	r7, r3
c0de8b06:	f809 1000 	strb.w	r1, [r9, r0]
c0de8b0a:	493c      	ldr	r1, [pc, #240]	@ (c0de8bfc <useCaseReview+0x10c>)
c0de8b0c:	4448      	add	r0, r9
c0de8b0e:	eb09 0506 	add.w	r5, r9, r6
c0de8b12:	9a0d      	ldr	r2, [sp, #52]	@ 0x34
c0de8b14:	4449      	add	r1, r9
c0de8b16:	e9c1 a208 	strd	sl, r2, [r1, #32]
c0de8b1a:	493b      	ldr	r1, [pc, #236]	@ (c0de8c08 <useCaseReview+0x118>)
c0de8b1c:	f8c0 b010 	str.w	fp, [r0, #16]
c0de8b20:	4479      	add	r1, pc
c0de8b22:	6181      	str	r1, [r0, #24]
c0de8b24:	4836      	ldr	r0, [pc, #216]	@ (c0de8c00 <useCaseReview+0x110>)
c0de8b26:	2103      	movs	r1, #3
c0de8b28:	4448      	add	r0, r9
c0de8b2a:	7301      	strb	r1, [r0, #12]
c0de8b2c:	6085      	str	r5, [r0, #8]
c0de8b2e:	4628      	mov	r0, r5
c0de8b30:	21a8      	movs	r1, #168	@ 0xa8
c0de8b32:	f002 fb03 	bl	c0deb13c <__aeabi_memclr>
c0de8b36:	2001      	movs	r0, #1
c0de8b38:	f8a5 b024 	strh.w	fp, [r5, #36]	@ 0x24
c0de8b3c:	f809 0006 	strb.w	r0, [r9, r6]
c0de8b40:	4832      	ldr	r0, [pc, #200]	@ (c0de8c0c <useCaseReview+0x11c>)
c0de8b42:	4478      	add	r0, pc
c0de8b44:	6228      	str	r0, [r5, #32]
c0de8b46:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de8b48:	616f      	str	r7, [r5, #20]
c0de8b4a:	9401      	str	r4, [sp, #4]
c0de8b4c:	60ac      	str	r4, [r5, #8]
c0de8b4e:	f885 b004 	strb.w	fp, [r5, #4]
c0de8b52:	61e8      	str	r0, [r5, #28]
c0de8b54:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de8b56:	f001 f915 	bl	c0de9d84 <initWarningTipBox>
c0de8b5a:	2004      	movs	r0, #4
c0de8b5c:	4641      	mov	r1, r8
c0de8b5e:	f885 0038 	strb.w	r0, [r5, #56]	@ 0x38
c0de8b62:	f105 003c 	add.w	r0, r5, #60	@ 0x3c
c0de8b66:	e891 00dc 	ldmia.w	r1, {r2, r3, r4, r6, r7}
c0de8b6a:	c0dc      	stmia	r0!, {r2, r3, r4, r6, r7}
c0de8b6c:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de8b70:	66e8      	str	r0, [r5, #108]	@ 0x6c
c0de8b72:	e9dd 050e 	ldrd	r0, r5, [sp, #56]	@ 0x38
c0de8b76:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
c0de8b78:	b190      	cbz	r0, c0de8ba0 <useCaseReview+0xb0>
c0de8b7a:	4922      	ldr	r1, [pc, #136]	@ (c0de8c04 <useCaseReview+0x114>)
c0de8b7c:	2203      	movs	r2, #3
c0de8b7e:	eb09 0001 	add.w	r0, r9, r1
c0de8b82:	f880 2070 	strb.w	r2, [r0, #112]	@ 0x70
c0de8b86:	9a01      	ldr	r2, [sp, #4]
c0de8b88:	b343      	cbz	r3, c0de8bdc <useCaseReview+0xec>
c0de8b8a:	eb09 0001 	add.w	r0, r9, r1
c0de8b8e:	210b      	movs	r1, #11
c0de8b90:	f880 1080 	strb.w	r1, [r0, #128]	@ 0x80
c0de8b94:	4921      	ldr	r1, [pc, #132]	@ (c0de8c1c <useCaseReview+0x12c>)
c0de8b96:	e9c0 321d 	strd	r3, r2, [r0, #116]	@ 0x74
c0de8b9a:	4479      	add	r1, pc
c0de8b9c:	67c1      	str	r1, [r0, #124]	@ 0x7c
c0de8b9e:	e00a      	b.n	c0de8bb6 <useCaseReview+0xc6>
c0de8ba0:	4818      	ldr	r0, [pc, #96]	@ (c0de8c04 <useCaseReview+0x114>)
c0de8ba2:	2102      	movs	r1, #2
c0de8ba4:	9a01      	ldr	r2, [sp, #4]
c0de8ba6:	4448      	add	r0, r9
c0de8ba8:	f880 1070 	strb.w	r1, [r0, #112]	@ 0x70
c0de8bac:	f100 0174 	add.w	r1, r0, #116	@ 0x74
c0de8bb0:	4650      	mov	r0, sl
c0de8bb2:	f000 fa07 	bl	c0de8fc4 <prepareReviewLastPage>
c0de8bb6:	f3ca 1000 	ubfx	r0, sl, #4, #1
c0de8bba:	f7ff f8b7 	bl	c0de7d2c <getNbPagesForGenericContents>
c0de8bbe:	4a18      	ldr	r2, [pc, #96]	@ (c0de8c20 <useCaseReview+0x130>)
c0de8bc0:	4601      	mov	r1, r0
c0de8bc2:	2001      	movs	r0, #1
c0de8bc4:	447a      	add	r2, pc
c0de8bc6:	f7fe ffe9 	bl	c0de7b9c <prepareNavInfo>
c0de8bca:	b10d      	cbz	r5, c0de8bd0 <useCaseReview+0xe0>
c0de8bcc:	f001 f9dd 	bl	c0de9f8a <OUTLINED_FUNCTION_6>
c0de8bd0:	2000      	movs	r0, #0
c0de8bd2:	2101      	movs	r1, #1
c0de8bd4:	e8bd 4dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de8bd8:	f7ff b962 	b.w	c0de7ea0 <displayGenericContextPage>
c0de8bdc:	f01a 0007 	ands.w	r0, sl, #7
c0de8be0:	d004      	beq.n	c0de8bec <useCaseReview+0xfc>
c0de8be2:	2801      	cmp	r0, #1
c0de8be4:	d105      	bne.n	c0de8bf2 <useCaseReview+0x102>
c0de8be6:	4b0b      	ldr	r3, [pc, #44]	@ (c0de8c14 <useCaseReview+0x124>)
c0de8be8:	447b      	add	r3, pc
c0de8bea:	e7ce      	b.n	c0de8b8a <useCaseReview+0x9a>
c0de8bec:	4b08      	ldr	r3, [pc, #32]	@ (c0de8c10 <useCaseReview+0x120>)
c0de8bee:	447b      	add	r3, pc
c0de8bf0:	e7cb      	b.n	c0de8b8a <useCaseReview+0x9a>
c0de8bf2:	4b09      	ldr	r3, [pc, #36]	@ (c0de8c18 <useCaseReview+0x128>)
c0de8bf4:	447b      	add	r3, pc
c0de8bf6:	e7c8      	b.n	c0de8b8a <useCaseReview+0x9a>
c0de8bf8:	00001c28 	.word	0x00001c28
c0de8bfc:	00001ca4 	.word	0x00001ca4
c0de8c00:	0000195c 	.word	0x0000195c
c0de8c04:	000019c8 	.word	0x000019c8
c0de8c08:	0000123d 	.word	0x0000123d
c0de8c0c:	000043c7 	.word	0x000043c7
c0de8c10:	00003d08 	.word	0x00003d08
c0de8c14:	00003cdd 	.word	0x00003cdd
c0de8c18:	00004250 	.word	0x00004250
c0de8c1c:	00003afe 	.word	0x00003afe
c0de8c20:	00003b18 	.word	0x00003b18

c0de8c24 <nbgl_useCaseReviewBlindSigning>:
c0de8c24:	b510      	push	{r4, lr}
c0de8c26:	b086      	sub	sp, #24
c0de8c28:	9c0b      	ldr	r4, [sp, #44]	@ 0x2c
c0de8c2a:	9404      	str	r4, [sp, #16]
c0de8c2c:	4c06      	ldr	r4, [pc, #24]	@ (c0de8c48 <nbgl_useCaseReviewBlindSigning+0x24>)
c0de8c2e:	447c      	add	r4, pc
c0de8c30:	9403      	str	r4, [sp, #12]
c0de8c32:	9c0a      	ldr	r4, [sp, #40]	@ 0x28
c0de8c34:	9402      	str	r4, [sp, #8]
c0de8c36:	9c09      	ldr	r4, [sp, #36]	@ 0x24
c0de8c38:	9401      	str	r4, [sp, #4]
c0de8c3a:	9c08      	ldr	r4, [sp, #32]
c0de8c3c:	9400      	str	r4, [sp, #0]
c0de8c3e:	f000 f805 	bl	c0de8c4c <nbgl_useCaseAdvancedReview>
c0de8c42:	b006      	add	sp, #24
c0de8c44:	bd10      	pop	{r4, pc}
c0de8c46:	bf00      	nop
c0de8c48:	000057d6 	.word	0x000057d6

c0de8c4c <nbgl_useCaseAdvancedReview>:
c0de8c4c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8c50:	b088      	sub	sp, #32
c0de8c52:	e9cd 2306 	strd	r2, r3, [sp, #24]
c0de8c56:	460e      	mov	r6, r1
c0de8c58:	4605      	mov	r5, r0
c0de8c5a:	f7fe ff89 	bl	c0de7b70 <reset_callbacks_and_context>
c0de8c5e:	f10d 0b48 	add.w	fp, sp, #72	@ 0x48
c0de8c62:	482b      	ldr	r0, [pc, #172]	@ (c0de8d10 <nbgl_useCaseAdvancedReview+0xc4>)
c0de8c64:	e9dd 4810 	ldrd	r4, r8, [sp, #64]	@ 0x40
c0de8c68:	e89b 0c80 	ldmia.w	fp, {r7, sl, fp}
c0de8c6c:	4448      	add	r0, r9
c0de8c6e:	b127      	cbz	r7, c0de8c7a <nbgl_useCaseAdvancedReview+0x2e>
c0de8c70:	4639      	mov	r1, r7
c0de8c72:	2220      	movs	r2, #32
c0de8c74:	f002 fa58 	bl	c0deb128 <__aeabi_memcpy>
c0de8c78:	e002      	b.n	c0de8c80 <nbgl_useCaseAdvancedReview+0x34>
c0de8c7a:	2120      	movs	r1, #32
c0de8c7c:	f002 fa5e 	bl	c0deb13c <__aeabi_memclr>
c0de8c80:	f1ba 0f00 	cmp.w	sl, #0
c0de8c84:	d028      	beq.n	c0de8cd8 <nbgl_useCaseAdvancedReview+0x8c>
c0de8c86:	f8da 0000 	ldr.w	r0, [sl]
c0de8c8a:	b928      	cbnz	r0, c0de8c98 <nbgl_useCaseAdvancedReview+0x4c>
c0de8c8c:	f8da 1014 	ldr.w	r1, [sl, #20]
c0de8c90:	b911      	cbnz	r1, c0de8c98 <nbgl_useCaseAdvancedReview+0x4c>
c0de8c92:	f8da 1018 	ldr.w	r1, [sl, #24]
c0de8c96:	b1f9      	cbz	r1, c0de8cd8 <nbgl_useCaseAdvancedReview+0x8c>
c0de8c98:	491e      	ldr	r1, [pc, #120]	@ (c0de8d14 <nbgl_useCaseAdvancedReview+0xc8>)
c0de8c9a:	2200      	movs	r2, #0
c0de8c9c:	4449      	add	r1, r9
c0de8c9e:	f881 203c 	strb.w	r2, [r1, #60]	@ 0x3c
c0de8ca2:	2240      	movs	r2, #64	@ 0x40
c0de8ca4:	2808      	cmp	r0, #8
c0de8ca6:	bf08      	it	eq
c0de8ca8:	2280      	moveq	r2, #128	@ 0x80
c0de8caa:	ea42 0005 	orr.w	r0, r2, r5
c0de8cae:	9d06      	ldr	r5, [sp, #24]
c0de8cb0:	9b07      	ldr	r3, [sp, #28]
c0de8cb2:	e9c1 0610 	strd	r0, r6, [r1, #64]	@ 0x40
c0de8cb6:	648d      	str	r5, [r1, #72]	@ 0x48
c0de8cb8:	314c      	adds	r1, #76	@ 0x4c
c0de8cba:	e881 0d18 	stmia.w	r1, {r3, r4, r8, sl, fp}
c0de8cbe:	f89a 1000 	ldrb.w	r1, [sl]
c0de8cc2:	f011 0f16 	tst.w	r1, #22
c0de8cc6:	d102      	bne.n	c0de8cce <nbgl_useCaseAdvancedReview+0x82>
c0de8cc8:	f8da 1014 	ldr.w	r1, [sl, #20]
c0de8ccc:	b1a9      	cbz	r1, c0de8cfa <nbgl_useCaseAdvancedReview+0xae>
c0de8cce:	b008      	add	sp, #32
c0de8cd0:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8cd4:	f000 b820 	b.w	c0de8d18 <displayInitialWarning>
c0de8cd8:	2001      	movs	r0, #1
c0de8cda:	2100      	movs	r1, #0
c0de8cdc:	e9cd 4800 	strd	r4, r8, [sp]
c0de8ce0:	e9cd 7b02 	strd	r7, fp, [sp, #8]
c0de8ce4:	e9cd 1004 	strd	r1, r0, [sp, #16]
c0de8ce8:	4628      	mov	r0, r5
c0de8cea:	4631      	mov	r1, r6
c0de8cec:	e9dd 2306 	ldrd	r2, r3, [sp, #24]
c0de8cf0:	f7ff fefe 	bl	c0de8af0 <useCaseReview>
c0de8cf4:	b008      	add	sp, #32
c0de8cf6:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de8cfa:	2101      	movs	r1, #1
c0de8cfc:	2200      	movs	r2, #0
c0de8cfe:	e9cd 4800 	strd	r4, r8, [sp]
c0de8d02:	e9cd 7b02 	strd	r7, fp, [sp, #8]
c0de8d06:	e9cd 2104 	strd	r2, r1, [sp, #16]
c0de8d0a:	4631      	mov	r1, r6
c0de8d0c:	462a      	mov	r2, r5
c0de8d0e:	e7ef      	b.n	c0de8cf0 <nbgl_useCaseAdvancedReview+0xa4>
c0de8d10:	00001ca4 	.word	0x00001ca4
c0de8d14:	0000195c 	.word	0x0000195c

c0de8d18 <displayInitialWarning>:
c0de8d18:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de8d1a:	b099      	sub	sp, #100	@ 0x64
c0de8d1c:	4857      	ldr	r0, [pc, #348]	@ (c0de8e7c <displayInitialWarning+0x164>)
c0de8d1e:	a90e      	add	r1, sp, #56	@ 0x38
c0de8d20:	4478      	add	r0, pc
c0de8d22:	e890 003c 	ldmia.w	r0, {r2, r3, r4, r5}
c0de8d26:	c13c      	stmia	r1!, {r2, r3, r4, r5}
c0de8d28:	4855      	ldr	r0, [pc, #340]	@ (c0de8e80 <displayInitialWarning+0x168>)
c0de8d2a:	ac0a      	add	r4, sp, #40	@ 0x28
c0de8d2c:	4621      	mov	r1, r4
c0de8d2e:	4478      	add	r0, pc
c0de8d30:	e890 006c 	ldmia.w	r0, {r2, r3, r5, r6}
c0de8d34:	c16c      	stmia	r1!, {r2, r3, r5, r6}
c0de8d36:	4d4f      	ldr	r5, [pc, #316]	@ (c0de8e74 <displayInitialWarning+0x15c>)
c0de8d38:	eb09 0705 	add.w	r7, r9, r5
c0de8d3c:	6db8      	ldr	r0, [r7, #88]	@ 0x58
c0de8d3e:	6806      	ldr	r6, [r0, #0]
c0de8d40:	2001      	movs	r0, #1
c0de8d42:	f887 0069 	strb.w	r0, [r7, #105]	@ 0x69
c0de8d46:	484f      	ldr	r0, [pc, #316]	@ (c0de8e84 <displayInitialWarning+0x16c>)
c0de8d48:	4478      	add	r0, pc
c0de8d4a:	9015      	str	r0, [sp, #84]	@ 0x54
c0de8d4c:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0de8d50:	f8ad 0048 	strh.w	r0, [sp, #72]	@ 0x48
c0de8d54:	2000      	movs	r0, #0
c0de8d56:	9016      	str	r0, [sp, #88]	@ 0x58
c0de8d58:	9013      	str	r0, [sp, #76]	@ 0x4c
c0de8d5a:	a812      	add	r0, sp, #72	@ 0x48
c0de8d5c:	f7fa f9ba 	bl	c0de30d4 <nbgl_layoutGet>
c0de8d60:	4621      	mov	r1, r4
c0de8d62:	6638      	str	r0, [r7, #96]	@ 0x60
c0de8d64:	f7fc ff4e 	bl	c0de5c04 <nbgl_layoutAddHeader>
c0de8d68:	6db8      	ldr	r0, [r7, #88]	@ 0x58
c0de8d6a:	f026 0409 	bic.w	r4, r6, #9
c0de8d6e:	6801      	ldr	r1, [r0, #0]
c0de8d70:	b139      	cbz	r1, c0de8d82 <displayInitialWarning+0x6a>
c0de8d72:	4845      	ldr	r0, [pc, #276]	@ (c0de8e88 <displayInitialWarning+0x170>)
c0de8d74:	4945      	ldr	r1, [pc, #276]	@ (c0de8e8c <displayInitialWarning+0x174>)
c0de8d76:	2c10      	cmp	r4, #16
c0de8d78:	4479      	add	r1, pc
c0de8d7a:	4478      	add	r0, pc
c0de8d7c:	bf08      	it	eq
c0de8d7e:	4601      	moveq	r1, r0
c0de8d80:	e001      	b.n	c0de8d86 <displayInitialWarning+0x6e>
c0de8d82:	6a01      	ldr	r1, [r0, #32]
c0de8d84:	b131      	cbz	r1, c0de8d94 <displayInitialWarning+0x7c>
c0de8d86:	eb09 0005 	add.w	r0, r9, r5
c0de8d8a:	2211      	movs	r2, #17
c0de8d8c:	2309      	movs	r3, #9
c0de8d8e:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0de8d90:	f7fa ff68 	bl	c0de3c64 <nbgl_layoutAddTopRightButton>
c0de8d94:	eb09 0005 	add.w	r0, r9, r5
c0de8d98:	6d87      	ldr	r7, [r0, #88]	@ 0x58
c0de8d9a:	6838      	ldr	r0, [r7, #0]
c0de8d9c:	b188      	cbz	r0, c0de8dc2 <displayInitialWarning+0xaa>
c0de8d9e:	a801      	add	r0, sp, #4
c0de8da0:	2124      	movs	r1, #36	@ 0x24
c0de8da2:	f002 f9cb 	bl	c0deb13c <__aeabi_memclr>
c0de8da6:	483a      	ldr	r0, [pc, #232]	@ (c0de8e90 <displayInitialWarning+0x178>)
c0de8da8:	2c10      	cmp	r4, #16
c0de8daa:	4478      	add	r0, pc
c0de8dac:	9002      	str	r0, [sp, #8]
c0de8dae:	d111      	bne.n	c0de8dd4 <displayInitialWarning+0xbc>
c0de8db0:	4840      	ldr	r0, [pc, #256]	@ (c0de8eb4 <displayInitialWarning+0x19c>)
c0de8db2:	2405      	movs	r4, #5
c0de8db4:	4478      	add	r0, pc
c0de8db6:	9005      	str	r0, [sp, #20]
c0de8db8:	493f      	ldr	r1, [pc, #252]	@ (c0de8eb8 <displayInitialWarning+0x1a0>)
c0de8dba:	4840      	ldr	r0, [pc, #256]	@ (c0de8ebc <displayInitialWarning+0x1a4>)
c0de8dbc:	4479      	add	r1, pc
c0de8dbe:	4478      	add	r0, pc
c0de8dc0:	e03d      	b.n	c0de8e3e <displayInitialWarning+0x126>
c0de8dc2:	69f9      	ldr	r1, [r7, #28]
c0de8dc4:	b351      	cbz	r1, c0de8e1c <displayInitialWarning+0x104>
c0de8dc6:	eb09 0005 	add.w	r0, r9, r5
c0de8dca:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0de8dcc:	f7fc fab6 	bl	c0de533c <nbgl_layoutAddContentCenter>
c0de8dd0:	2408      	movs	r4, #8
c0de8dd2:	e03c      	b.n	c0de8e4e <displayInitialWarning+0x136>
c0de8dd4:	4828      	ldr	r0, [pc, #160]	@ (c0de8e78 <displayInitialWarning+0x160>)
c0de8dd6:	4448      	add	r0, r9
c0de8dd8:	9006      	str	r0, [sp, #24]
c0de8dda:	68f9      	ldr	r1, [r7, #12]
c0de8ddc:	4b2d      	ldr	r3, [pc, #180]	@ (c0de8e94 <displayInitialWarning+0x17c>)
c0de8dde:	447b      	add	r3, pc
c0de8de0:	2900      	cmp	r1, #0
c0de8de2:	bf18      	it	ne
c0de8de4:	460b      	movne	r3, r1
c0de8de6:	4a2c      	ldr	r2, [pc, #176]	@ (c0de8e98 <displayInitialWarning+0x180>)
c0de8de8:	2180      	movs	r1, #128	@ 0x80
c0de8dea:	447a      	add	r2, pc
c0de8dec:	f001 fdf2 	bl	c0dea9d4 <snprintf>
c0de8df0:	07b0      	lsls	r0, r6, #30
c0de8df2:	d403      	bmi.n	c0de8dfc <displayInitialWarning+0xe4>
c0de8df4:	0770      	lsls	r0, r6, #29
c0de8df6:	d413      	bmi.n	c0de8e20 <displayInitialWarning+0x108>
c0de8df8:	2400      	movs	r4, #0
c0de8dfa:	e022      	b.n	c0de8e42 <displayInitialWarning+0x12a>
c0de8dfc:	4827      	ldr	r0, [pc, #156]	@ (c0de8e9c <displayInitialWarning+0x184>)
c0de8dfe:	4478      	add	r0, pc
c0de8e00:	9005      	str	r0, [sp, #20]
c0de8e02:	eb09 0005 	add.w	r0, r9, r5
c0de8e06:	6d80      	ldr	r0, [r0, #88]	@ 0x58
c0de8e08:	6901      	ldr	r1, [r0, #16]
c0de8e0a:	4825      	ldr	r0, [pc, #148]	@ (c0de8ea0 <displayInitialWarning+0x188>)
c0de8e0c:	4478      	add	r0, pc
c0de8e0e:	2900      	cmp	r1, #0
c0de8e10:	bf18      	it	ne
c0de8e12:	4608      	movne	r0, r1
c0de8e14:	4923      	ldr	r1, [pc, #140]	@ (c0de8ea4 <displayInitialWarning+0x18c>)
c0de8e16:	2405      	movs	r4, #5
c0de8e18:	4479      	add	r1, pc
c0de8e1a:	e010      	b.n	c0de8e3e <displayInitialWarning+0x126>
c0de8e1c:	2400      	movs	r4, #0
c0de8e1e:	e016      	b.n	c0de8e4e <displayInitialWarning+0x136>
c0de8e20:	4821      	ldr	r0, [pc, #132]	@ (c0de8ea8 <displayInitialWarning+0x190>)
c0de8e22:	4478      	add	r0, pc
c0de8e24:	9005      	str	r0, [sp, #20]
c0de8e26:	eb09 0005 	add.w	r0, r9, r5
c0de8e2a:	6d80      	ldr	r0, [r0, #88]	@ 0x58
c0de8e2c:	6901      	ldr	r1, [r0, #16]
c0de8e2e:	481f      	ldr	r0, [pc, #124]	@ (c0de8eac <displayInitialWarning+0x194>)
c0de8e30:	4478      	add	r0, pc
c0de8e32:	2900      	cmp	r1, #0
c0de8e34:	bf18      	it	ne
c0de8e36:	4608      	movne	r0, r1
c0de8e38:	491d      	ldr	r1, [pc, #116]	@ (c0de8eb0 <displayInitialWarning+0x198>)
c0de8e3a:	2404      	movs	r4, #4
c0de8e3c:	4479      	add	r1, pc
c0de8e3e:	910f      	str	r1, [sp, #60]	@ 0x3c
c0de8e40:	9007      	str	r0, [sp, #28]
c0de8e42:	eb09 0005 	add.w	r0, r9, r5
c0de8e46:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0de8e48:	a901      	add	r1, sp, #4
c0de8e4a:	f7fc fa77 	bl	c0de533c <nbgl_layoutAddContentCenter>
c0de8e4e:	eb09 0005 	add.w	r0, r9, r5
c0de8e52:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0de8e54:	a90e      	add	r1, sp, #56	@ 0x38
c0de8e56:	f7fc fbed 	bl	c0de5634 <nbgl_layoutAddChoiceButtons>
c0de8e5a:	b114      	cbz	r4, c0de8e62 <displayInitialWarning+0x14a>
c0de8e5c:	4620      	mov	r0, r4
c0de8e5e:	f7f9 ff32 	bl	c0de2cc6 <os_io_seph_cmd_piezo_play_tune>
c0de8e62:	eb09 0005 	add.w	r0, r9, r5
c0de8e66:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0de8e68:	f7fd fb2e 	bl	c0de64c8 <nbgl_layoutDraw>
c0de8e6c:	f001 fd27 	bl	c0dea8be <nbgl_refresh>
c0de8e70:	b019      	add	sp, #100	@ 0x64
c0de8e72:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de8e74:	0000195c 	.word	0x0000195c
c0de8e78:	00001aa8 	.word	0x00001aa8
c0de8e7c:	00005834 	.word	0x00005834
c0de8e80:	00005752 	.word	0x00005752
c0de8e84:	00001155 	.word	0x00001155
c0de8e88:	000032b8 	.word	0x000032b8
c0de8e8c:	00003603 	.word	0x00003603
c0de8e90:	00002f31 	.word	0x00002f31
c0de8e94:	00003cdf 	.word	0x00003cdf
c0de8e98:	00004072 	.word	0x00004072
c0de8e9c:	000040d0 	.word	0x000040d0
c0de8ea0:	0000391d 	.word	0x0000391d
c0de8ea4:	00003d39 	.word	0x00003d39
c0de8ea8:	00003d1f 	.word	0x00003d1f
c0de8eac:	00003cbd 	.word	0x00003cbd
c0de8eb0:	00003b99 	.word	0x00003b99
c0de8eb4:	00003e85 	.word	0x00003e85
c0de8eb8:	00004134 	.word	0x00004134
c0de8ebc:	00003dac 	.word	0x00003dac

c0de8ec0 <useCaseReviewStreamingStart>:
c0de8ec0:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de8ec4:	4604      	mov	r4, r0
c0de8ec6:	4826      	ldr	r0, [pc, #152]	@ (c0de8f60 <useCaseReviewStreamingStart+0xa0>)
c0de8ec8:	460d      	mov	r5, r1
c0de8eca:	2103      	movs	r1, #3
c0de8ecc:	e9cd 3200 	strd	r3, r2, [sp]
c0de8ed0:	f8df b098 	ldr.w	fp, [pc, #152]	@ c0de8f6c <useCaseReviewStreamingStart+0xac>
c0de8ed4:	f04f 0a01 	mov.w	sl, #1
c0de8ed8:	f809 1000 	strb.w	r1, [r9, r0]
c0de8edc:	4921      	ldr	r1, [pc, #132]	@ (c0de8f64 <useCaseReviewStreamingStart+0xa4>)
c0de8ede:	eb09 0700 	add.w	r7, r9, r0
c0de8ee2:	eb09 060b 	add.w	r6, r9, fp
c0de8ee6:	eb09 0801 	add.w	r8, r9, r1
c0de8eea:	f8c8 502c 	str.w	r5, [r8, #44]	@ 0x2c
c0de8eee:	990a      	ldr	r1, [sp, #40]	@ 0x28
c0de8ef0:	e9c8 4108 	strd	r4, r1, [r8, #32]
c0de8ef4:	2138      	movs	r1, #56	@ 0x38
c0de8ef6:	481e      	ldr	r0, [pc, #120]	@ (c0de8f70 <useCaseReviewStreamingStart+0xb0>)
c0de8ef8:	4478      	add	r0, pc
c0de8efa:	61b8      	str	r0, [r7, #24]
c0de8efc:	2000      	movs	r0, #0
c0de8efe:	6138      	str	r0, [r7, #16]
c0de8f00:	4819      	ldr	r0, [pc, #100]	@ (c0de8f68 <useCaseReviewStreamingStart+0xa8>)
c0de8f02:	4448      	add	r0, r9
c0de8f04:	f880 a00c 	strb.w	sl, [r0, #12]
c0de8f08:	6086      	str	r6, [r0, #8]
c0de8f0a:	f001 f855 	bl	c0de9fb8 <OUTLINED_FUNCTION_13>
c0de8f0e:	2100      	movs	r1, #0
c0de8f10:	f809 a00b 	strb.w	sl, [r9, fp]
c0de8f14:	84b1      	strh	r1, [r6, #36]	@ 0x24
c0de8f16:	4817      	ldr	r0, [pc, #92]	@ (c0de8f74 <useCaseReviewStreamingStart+0xb4>)
c0de8f18:	9a00      	ldr	r2, [sp, #0]
c0de8f1a:	60b5      	str	r5, [r6, #8]
c0de8f1c:	7131      	strb	r1, [r6, #4]
c0de8f1e:	2500      	movs	r5, #0
c0de8f20:	4478      	add	r0, pc
c0de8f22:	e9c6 2007 	strd	r2, r0, [r6, #28]
c0de8f26:	9801      	ldr	r0, [sp, #4]
c0de8f28:	6170      	str	r0, [r6, #20]
c0de8f2a:	2000      	movs	r0, #0
c0de8f2c:	f000 ff2a 	bl	c0de9d84 <initWarningTipBox>
c0de8f30:	f3c4 1000 	ubfx	r0, r4, #4, #1
c0de8f34:	f7fe fefa 	bl	c0de7d2c <getNbPagesForGenericContents>
c0de8f38:	f888 0030 	strb.w	r0, [r8, #48]	@ 0x30
c0de8f3c:	2001      	movs	r0, #1
c0de8f3e:	21ff      	movs	r1, #255	@ 0xff
c0de8f40:	4a0d      	ldr	r2, [pc, #52]	@ (c0de8f78 <useCaseReviewStreamingStart+0xb8>)
c0de8f42:	447a      	add	r2, pc
c0de8f44:	f7fe fe2a 	bl	c0de7b9c <prepareNavInfo>
c0de8f48:	f887 5071 	strb.w	r5, [r7, #113]	@ 0x71
c0de8f4c:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de8f4e:	b108      	cbz	r0, c0de8f54 <useCaseReviewStreamingStart+0x94>
c0de8f50:	f001 f81b 	bl	c0de9f8a <OUTLINED_FUNCTION_6>
c0de8f54:	2000      	movs	r0, #0
c0de8f56:	2101      	movs	r1, #1
c0de8f58:	e8bd 4dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de8f5c:	f7fe bfa0 	b.w	c0de7ea0 <displayGenericContextPage>
c0de8f60:	00001c28 	.word	0x00001c28
c0de8f64:	00001ca4 	.word	0x00001ca4
c0de8f68:	0000195c 	.word	0x0000195c
c0de8f6c:	000019c8 	.word	0x000019c8
c0de8f70:	00000081 	.word	0x00000081
c0de8f74:	00003fe9 	.word	0x00003fe9
c0de8f78:	0000379a 	.word	0x0000379a

c0de8f7c <bundleNavReviewStreamingChoice>:
c0de8f7c:	b580      	push	{r7, lr}
c0de8f7e:	b178      	cbz	r0, c0de8fa0 <bundleNavReviewStreamingChoice+0x24>
c0de8f80:	480d      	ldr	r0, [pc, #52]	@ (c0de8fb8 <bundleNavReviewStreamingChoice+0x3c>)
c0de8f82:	f819 0000 	ldrb.w	r0, [r9, r0]
c0de8f86:	2802      	cmp	r0, #2
c0de8f88:	d003      	beq.n	c0de8f92 <bundleNavReviewStreamingChoice+0x16>
c0de8f8a:	480c      	ldr	r0, [pc, #48]	@ (c0de8fbc <bundleNavReviewStreamingChoice+0x40>)
c0de8f8c:	4478      	add	r0, pc
c0de8f8e:	f000 f955 	bl	c0de923c <nbgl_useCaseSpinner>
c0de8f92:	4808      	ldr	r0, [pc, #32]	@ (c0de8fb4 <bundleNavReviewStreamingChoice+0x38>)
c0de8f94:	4448      	add	r0, r9
c0de8f96:	6a41      	ldr	r1, [r0, #36]	@ 0x24
c0de8f98:	2001      	movs	r0, #1
c0de8f9a:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de8f9e:	4708      	bx	r1
c0de8fa0:	4804      	ldr	r0, [pc, #16]	@ (c0de8fb4 <bundleNavReviewStreamingChoice+0x38>)
c0de8fa2:	4448      	add	r0, r9
c0de8fa4:	6a00      	ldr	r0, [r0, #32]
c0de8fa6:	4906      	ldr	r1, [pc, #24]	@ (c0de8fc0 <bundleNavReviewStreamingChoice+0x44>)
c0de8fa8:	4479      	add	r1, pc
c0de8faa:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de8fae:	f000 bf47 	b.w	c0de9e40 <bundleNavReviewAskRejectionConfirmation>
c0de8fb2:	bf00      	nop
c0de8fb4:	00001ca4 	.word	0x00001ca4
c0de8fb8:	000019c8 	.word	0x000019c8
c0de8fbc:	00003714 	.word	0x00003714
c0de8fc0:	00000f95 	.word	0x00000f95

c0de8fc4 <prepareReviewLastPage>:
c0de8fc4:	b13b      	cbz	r3, c0de8fd6 <prepareReviewLastPage+0x12>
c0de8fc6:	200b      	movs	r0, #11
c0de8fc8:	7308      	strb	r0, [r1, #12]
c0de8fca:	480d      	ldr	r0, [pc, #52]	@ (c0de9000 <prepareReviewLastPage+0x3c>)
c0de8fcc:	e9c1 3200 	strd	r3, r2, [r1]
c0de8fd0:	4478      	add	r0, pc
c0de8fd2:	6088      	str	r0, [r1, #8]
c0de8fd4:	4770      	bx	lr
c0de8fd6:	f010 0007 	ands.w	r0, r0, #7
c0de8fda:	d004      	beq.n	c0de8fe6 <prepareReviewLastPage+0x22>
c0de8fdc:	2801      	cmp	r0, #1
c0de8fde:	d105      	bne.n	c0de8fec <prepareReviewLastPage+0x28>
c0de8fe0:	4b05      	ldr	r3, [pc, #20]	@ (c0de8ff8 <prepareReviewLastPage+0x34>)
c0de8fe2:	447b      	add	r3, pc
c0de8fe4:	e7ef      	b.n	c0de8fc6 <prepareReviewLastPage+0x2>
c0de8fe6:	4b03      	ldr	r3, [pc, #12]	@ (c0de8ff4 <prepareReviewLastPage+0x30>)
c0de8fe8:	447b      	add	r3, pc
c0de8fea:	e7ec      	b.n	c0de8fc6 <prepareReviewLastPage+0x2>
c0de8fec:	4b03      	ldr	r3, [pc, #12]	@ (c0de8ffc <prepareReviewLastPage+0x38>)
c0de8fee:	447b      	add	r3, pc
c0de8ff0:	e7e9      	b.n	c0de8fc6 <prepareReviewLastPage+0x2>
c0de8ff2:	bf00      	nop
c0de8ff4:	0000390e 	.word	0x0000390e
c0de8ff8:	000038e3 	.word	0x000038e3
c0de8ffc:	00003e56 	.word	0x00003e56
c0de9000:	000036ec 	.word	0x000036ec

c0de9004 <prepareAddressConfirmationPages>:
c0de9004:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9008:	b08a      	sub	sp, #40	@ 0x28
c0de900a:	4688      	mov	r8, r1
c0de900c:	4950      	ldr	r1, [pc, #320]	@ (c0de9150 <prepareAddressConfirmationPages+0x14c>)
c0de900e:	f8df a13c 	ldr.w	sl, [pc, #316]	@ c0de914c <prepareAddressConfirmationPages+0x148>
c0de9012:	4693      	mov	fp, r2
c0de9014:	4479      	add	r1, pc
c0de9016:	f849 100a 	str.w	r1, [r9, sl]
c0de901a:	494e      	ldr	r1, [pc, #312]	@ (c0de9154 <prepareAddressConfirmationPages+0x150>)
c0de901c:	4479      	add	r1, pc
c0de901e:	6191      	str	r1, [r2, #24]
c0de9020:	2106      	movs	r1, #6
c0de9022:	7011      	strb	r1, [r2, #0]
c0de9024:	2201      	movs	r2, #1
c0de9026:	eb09 010a 	add.w	r1, r9, sl
c0de902a:	f1b8 0f00 	cmp.w	r8, #0
c0de902e:	f881 2034 	strb.w	r2, [r1, #52]	@ 0x34
c0de9032:	6048      	str	r0, [r1, #4]
c0de9034:	d01f      	beq.n	c0de9076 <prepareAddressConfirmationPages+0x72>
c0de9036:	f898 2008 	ldrb.w	r2, [r8, #8]
c0de903a:	2a02      	cmp	r2, #2
c0de903c:	d81b      	bhi.n	c0de9076 <prepareAddressConfirmationPages+0x72>
c0de903e:	2001      	movs	r0, #1
c0de9040:	2100      	movs	r1, #0
c0de9042:	f04f 0c00 	mov.w	ip, #0
c0de9046:	9303      	str	r3, [sp, #12]
c0de9048:	4594      	cmp	ip, r2
c0de904a:	d219      	bcs.n	c0de9080 <prepareAddressConfirmationPages+0x7c>
c0de904c:	f8d8 0000 	ldr.w	r0, [r8]
c0de9050:	eb09 030a 	add.w	r3, r9, sl
c0de9054:	f10c 0c01 	add.w	ip, ip, #1
c0de9058:	185c      	adds	r4, r3, r1
c0de905a:	4408      	add	r0, r1
c0de905c:	3410      	adds	r4, #16
c0de905e:	3110      	adds	r1, #16
c0de9060:	e890 00e4 	ldmia.w	r0, {r2, r5, r6, r7}
c0de9064:	c4e4      	stmia	r4!, {r2, r5, r6, r7}
c0de9066:	f893 0034 	ldrb.w	r0, [r3, #52]	@ 0x34
c0de906a:	3001      	adds	r0, #1
c0de906c:	f883 0034 	strb.w	r0, [r3, #52]	@ 0x34
c0de9070:	f898 2008 	ldrb.w	r2, [r8, #8]
c0de9074:	e7e8      	b.n	c0de9048 <prepareAddressConfirmationPages+0x44>
c0de9076:	2000      	movs	r0, #0
c0de9078:	f8cb 001c 	str.w	r0, [fp, #28]
c0de907c:	2001      	movs	r0, #1
c0de907e:	e01c      	b.n	c0de90ba <prepareAddressConfirmationPages+0xb6>
c0de9080:	46c4      	mov	ip, r8
c0de9082:	a905      	add	r1, sp, #20
c0de9084:	e89c 00f4 	ldmia.w	ip, {r2, r4, r5, r6, r7}
c0de9088:	460b      	mov	r3, r1
c0de908a:	c3f4      	stmia	r3!, {r2, r4, r5, r6, r7}
c0de908c:	f10d 0213 	add.w	r2, sp, #19
c0de9090:	b2c7      	uxtb	r7, r0
c0de9092:	eb09 040a 	add.w	r4, r9, sl
c0de9096:	f88d 001c 	strb.w	r0, [sp, #28]
c0de909a:	2301      	movs	r3, #1
c0de909c:	9202      	str	r2, [sp, #8]
c0de909e:	4638      	mov	r0, r7
c0de90a0:	2200      	movs	r2, #0
c0de90a2:	9405      	str	r4, [sp, #20]
c0de90a4:	e9cd 3300 	strd	r3, r3, [sp]
c0de90a8:	2300      	movs	r3, #0
c0de90aa:	f7fe fb6e 	bl	c0de778a <getNbTagValuesInPage>
c0de90ae:	4287      	cmp	r7, r0
c0de90b0:	bf88      	it	hi
c0de90b2:	2001      	movhi	r0, #1
c0de90b4:	9b03      	ldr	r3, [sp, #12]
c0de90b6:	f884 0034 	strb.w	r0, [r4, #52]	@ 0x34
c0de90ba:	f640 1107 	movw	r1, #2311	@ 0x907
c0de90be:	f88b 000c 	strb.w	r0, [fp, #12]
c0de90c2:	f8ab 1020 	strh.w	r1, [fp, #32]
c0de90c6:	2100      	movs	r1, #0
c0de90c8:	f1b8 0f00 	cmp.w	r8, #0
c0de90cc:	f8ab 1010 	strh.w	r1, [fp, #16]
c0de90d0:	f88b 100e 	strb.w	r1, [fp, #14]
c0de90d4:	eb09 010a 	add.w	r1, r9, sl
c0de90d8:	f8cb 1004 	str.w	r1, [fp, #4]
c0de90dc:	d003      	beq.n	c0de90e6 <prepareAddressConfirmationPages+0xe2>
c0de90de:	f898 1008 	ldrb.w	r1, [r8, #8]
c0de90e2:	4288      	cmp	r0, r1
c0de90e4:	d907      	bls.n	c0de90f6 <prepareAddressConfirmationPages+0xf2>
c0de90e6:	200b      	movs	r0, #11
c0de90e8:	f88b 002c 	strb.w	r0, [fp, #44]	@ 0x2c
c0de90ec:	481c      	ldr	r0, [pc, #112]	@ (c0de9160 <prepareAddressConfirmationPages+0x15c>)
c0de90ee:	4478      	add	r0, pc
c0de90f0:	f8cb 0024 	str.w	r0, [fp, #36]	@ 0x24
c0de90f4:	e027      	b.n	c0de9146 <prepareAddressConfirmationPages+0x142>
c0de90f6:	2000      	movs	r0, #0
c0de90f8:	f8cb 0024 	str.w	r0, [fp, #36]	@ 0x24
c0de90fc:	4916      	ldr	r1, [pc, #88]	@ (c0de9158 <prepareAddressConfirmationPages+0x154>)
c0de90fe:	4479      	add	r1, pc
c0de9100:	f8cb 101c 	str.w	r1, [fp, #28]
c0de9104:	210b      	movs	r1, #11
c0de9106:	f883 102c 	strb.w	r1, [r3, #44]	@ 0x2c
c0de910a:	2106      	movs	r1, #6
c0de910c:	7019      	strb	r1, [r3, #0]
c0de910e:	2109      	movs	r1, #9
c0de9110:	f883 1021 	strb.w	r1, [r3, #33]	@ 0x21
c0de9114:	4911      	ldr	r1, [pc, #68]	@ (c0de915c <prepareAddressConfirmationPages+0x158>)
c0de9116:	e9c3 0006 	strd	r0, r0, [r3, #24]
c0de911a:	1d18      	adds	r0, r3, #4
c0de911c:	4479      	add	r1, pc
c0de911e:	6259      	str	r1, [r3, #36]	@ 0x24
c0de9120:	4641      	mov	r1, r8
c0de9122:	e891 00f4 	ldmia.w	r1, {r2, r4, r5, r6, r7}
c0de9126:	c0f4      	stmia	r0!, {r2, r4, r5, r6, r7}
c0de9128:	eb09 000a 	add.w	r0, r9, sl
c0de912c:	f898 1008 	ldrb.w	r1, [r8, #8]
c0de9130:	f890 0034 	ldrb.w	r0, [r0, #52]	@ 0x34
c0de9134:	1a09      	subs	r1, r1, r0
c0de9136:	3101      	adds	r1, #1
c0de9138:	7319      	strb	r1, [r3, #12]
c0de913a:	f8d8 1000 	ldr.w	r1, [r8]
c0de913e:	eb01 1000 	add.w	r0, r1, r0, lsl #4
c0de9142:	3810      	subs	r0, #16
c0de9144:	6058      	str	r0, [r3, #4]
c0de9146:	b00a      	add	sp, #40	@ 0x28
c0de9148:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de914c:	00001a70 	.word	0x00001a70
c0de9150:	00003c7f 	.word	0x00003c7f
c0de9154:	0000335f 	.word	0x0000335f
c0de9158:	0000363d 	.word	0x0000363d
c0de915c:	00003e85 	.word	0x00003e85
c0de9160:	00003eb3 	.word	0x00003eb3

c0de9164 <nbgl_useCaseAddressReview>:
c0de9164:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de9168:	4e2d      	ldr	r6, [pc, #180]	@ (c0de9220 <nbgl_useCaseAddressReview+0xbc>)
c0de916a:	9301      	str	r3, [sp, #4]
c0de916c:	4617      	mov	r7, r2
c0de916e:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de9172:	eb09 0406 	add.w	r4, r9, r6
c0de9176:	f7fe fcfb 	bl	c0de7b70 <reset_callbacks_and_context>
c0de917a:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0de917c:	e9dd 540c 	ldrd	r5, r4, [sp, #48]	@ 0x30
c0de9180:	b108      	cbz	r0, c0de9186 <nbgl_useCaseAddressReview+0x22>
c0de9182:	f7fd f9cf 	bl	c0de6524 <nbgl_layoutRelease>
c0de9186:	eb09 0006 	add.w	r0, r9, r6
c0de918a:	2138      	movs	r1, #56	@ 0x38
c0de918c:	f001 ffd6 	bl	c0deb13c <__aeabi_memclr>
c0de9190:	4824      	ldr	r0, [pc, #144]	@ (c0de9224 <nbgl_useCaseAddressReview+0xc0>)
c0de9192:	2602      	movs	r6, #2
c0de9194:	f04f 0a00 	mov.w	sl, #0
c0de9198:	f8df b094 	ldr.w	fp, [pc, #148]	@ c0de9230 <nbgl_useCaseAddressReview+0xcc>
c0de919c:	21a8      	movs	r1, #168	@ 0xa8
c0de919e:	f809 6000 	strb.w	r6, [r9, r0]
c0de91a2:	4448      	add	r0, r9
c0de91a4:	6184      	str	r4, [r0, #24]
c0de91a6:	f8c0 a010 	str.w	sl, [r0, #16]
c0de91aa:	481f      	ldr	r0, [pc, #124]	@ (c0de9228 <nbgl_useCaseAddressReview+0xc4>)
c0de91ac:	eb09 040b 	add.w	r4, r9, fp
c0de91b0:	4448      	add	r0, r9
c0de91b2:	6206      	str	r6, [r0, #32]
c0de91b4:	481d      	ldr	r0, [pc, #116]	@ (c0de922c <nbgl_useCaseAddressReview+0xc8>)
c0de91b6:	eb09 0800 	add.w	r8, r9, r0
c0de91ba:	4620      	mov	r0, r4
c0de91bc:	f8c8 4008 	str.w	r4, [r8, #8]
c0de91c0:	f001 ffbc 	bl	c0deb13c <__aeabi_memclr>
c0de91c4:	2001      	movs	r0, #1
c0de91c6:	60a7      	str	r7, [r4, #8]
c0de91c8:	f884 a026 	strb.w	sl, [r4, #38]	@ 0x26
c0de91cc:	f104 0238 	add.w	r2, r4, #56	@ 0x38
c0de91d0:	f104 0370 	add.w	r3, r4, #112	@ 0x70
c0de91d4:	f809 000b 	strb.w	r0, [r9, fp]
c0de91d8:	4816      	ldr	r0, [pc, #88]	@ (c0de9234 <nbgl_useCaseAddressReview+0xd0>)
c0de91da:	9901      	ldr	r1, [sp, #4]
c0de91dc:	4478      	add	r0, pc
c0de91de:	e9c4 1a05 	strd	r1, sl, [r4, #20]
c0de91e2:	e9c4 5007 	strd	r5, r0, [r4, #28]
c0de91e6:	e9dd 0102 	ldrd	r0, r1, [sp, #8]
c0de91ea:	f7ff ff0b 	bl	c0de9004 <prepareAddressConfirmationPages>
c0de91ee:	f894 0070 	ldrb.w	r0, [r4, #112]	@ 0x70
c0de91f2:	2806      	cmp	r0, #6
c0de91f4:	bf08      	it	eq
c0de91f6:	2603      	moveq	r6, #3
c0de91f8:	f888 600c 	strb.w	r6, [r8, #12]
c0de91fc:	f000 fec2 	bl	c0de9f84 <OUTLINED_FUNCTION_5>
c0de9200:	4a0d      	ldr	r2, [pc, #52]	@ (c0de9238 <nbgl_useCaseAddressReview+0xd4>)
c0de9202:	4601      	mov	r1, r0
c0de9204:	2001      	movs	r0, #1
c0de9206:	447a      	add	r2, pc
c0de9208:	f7fe fcc8 	bl	c0de7b9c <prepareNavInfo>
c0de920c:	f000 febd 	bl	c0de9f8a <OUTLINED_FUNCTION_6>
c0de9210:	2000      	movs	r0, #0
c0de9212:	2101      	movs	r1, #1
c0de9214:	b004      	add	sp, #16
c0de9216:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de921a:	f7fe be41 	b.w	c0de7ea0 <displayGenericContextPage>
c0de921e:	bf00      	nop
c0de9220:	00001a70 	.word	0x00001a70
c0de9224:	00001c28 	.word	0x00001c28
c0de9228:	00001ca4 	.word	0x00001ca4
c0de922c:	0000195c 	.word	0x0000195c
c0de9230:	000019c8 	.word	0x000019c8
c0de9234:	000035ce 	.word	0x000035ce
c0de9238:	00003849 	.word	0x00003849

c0de923c <nbgl_useCaseSpinner>:
c0de923c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de923e:	b087      	sub	sp, #28
c0de9240:	4e1f      	ldr	r6, [pc, #124]	@ (c0de92c0 <nbgl_useCaseSpinner+0x84>)
c0de9242:	4604      	mov	r4, r0
c0de9244:	f819 0006 	ldrb.w	r0, [r9, r6]
c0de9248:	2801      	cmp	r0, #1
c0de924a:	d114      	bne.n	c0de9276 <nbgl_useCaseSpinner+0x3a>
c0de924c:	eb09 0006 	add.w	r0, r9, r6
c0de9250:	7841      	ldrb	r1, [r0, #1]
c0de9252:	3101      	adds	r1, #1
c0de9254:	b2ca      	uxtb	r2, r1
c0de9256:	3a04      	subs	r2, #4
c0de9258:	bf18      	it	ne
c0de925a:	460a      	movne	r2, r1
c0de925c:	7042      	strb	r2, [r0, #1]
c0de925e:	6b00      	ldr	r0, [r0, #48]	@ 0x30
c0de9260:	b2d3      	uxtb	r3, r2
c0de9262:	4621      	mov	r1, r4
c0de9264:	2200      	movs	r2, #0
c0de9266:	f7fd f88b 	bl	c0de6380 <nbgl_layoutUpdateSpinner>
c0de926a:	2802      	cmp	r0, #2
c0de926c:	d022      	beq.n	c0de92b4 <nbgl_useCaseSpinner+0x78>
c0de926e:	2801      	cmp	r0, #1
c0de9270:	d11e      	bne.n	c0de92b0 <nbgl_useCaseSpinner+0x74>
c0de9272:	2004      	movs	r0, #4
c0de9274:	e01f      	b.n	c0de92b6 <nbgl_useCaseSpinner+0x7a>
c0de9276:	eb09 0506 	add.w	r5, r9, r6
c0de927a:	216c      	movs	r1, #108	@ 0x6c
c0de927c:	4628      	mov	r0, r5
c0de927e:	f001 ff5d 	bl	c0deb13c <__aeabi_memclr>
c0de9282:	2701      	movs	r7, #1
c0de9284:	211c      	movs	r1, #28
c0de9286:	f809 7006 	strb.w	r7, [r9, r6]
c0de928a:	466e      	mov	r6, sp
c0de928c:	f000 fe94 	bl	c0de9fb8 <OUTLINED_FUNCTION_13>
c0de9290:	4630      	mov	r0, r6
c0de9292:	f88d 7001 	strb.w	r7, [sp, #1]
c0de9296:	f7f9 ff1d 	bl	c0de30d4 <nbgl_layoutGet>
c0de929a:	786b      	ldrb	r3, [r5, #1]
c0de929c:	4621      	mov	r1, r4
c0de929e:	2200      	movs	r2, #0
c0de92a0:	6328      	str	r0, [r5, #48]	@ 0x30
c0de92a2:	f7fc ff0d 	bl	c0de60c0 <nbgl_layoutAddSpinner>
c0de92a6:	6b28      	ldr	r0, [r5, #48]	@ 0x30
c0de92a8:	f7fd f90e 	bl	c0de64c8 <nbgl_layoutDraw>
c0de92ac:	f000 fe5e 	bl	c0de9f6c <OUTLINED_FUNCTION_3>
c0de92b0:	b007      	add	sp, #28
c0de92b2:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de92b4:	2001      	movs	r0, #1
c0de92b6:	b007      	add	sp, #28
c0de92b8:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de92bc:	f001 bb04 	b.w	c0dea8c8 <nbgl_refreshSpecial>
c0de92c0:	0000195c 	.word	0x0000195c

c0de92c4 <getContentAtIdx>:
c0de92c4:	b570      	push	{r4, r5, r6, lr}
c0de92c6:	4605      	mov	r5, r0
c0de92c8:	2000      	movs	r0, #0
c0de92ca:	2d00      	cmp	r5, #0
c0de92cc:	d415      	bmi.n	c0de92fa <getContentAtIdx+0x36>
c0de92ce:	4e11      	ldr	r6, [pc, #68]	@ (c0de9314 <getContentAtIdx+0x50>)
c0de92d0:	460c      	mov	r4, r1
c0de92d2:	eb09 0106 	add.w	r1, r9, r6
c0de92d6:	7b09      	ldrb	r1, [r1, #12]
c0de92d8:	428d      	cmp	r5, r1
c0de92da:	da0e      	bge.n	c0de92fa <getContentAtIdx+0x36>
c0de92dc:	eb09 0006 	add.w	r0, r9, r6
c0de92e0:	7900      	ldrb	r0, [r0, #4]
c0de92e2:	b158      	cbz	r0, c0de92fc <getContentAtIdx+0x38>
c0de92e4:	4620      	mov	r0, r4
c0de92e6:	2138      	movs	r1, #56	@ 0x38
c0de92e8:	f001 ff28 	bl	c0deb13c <__aeabi_memclr>
c0de92ec:	eb09 0006 	add.w	r0, r9, r6
c0de92f0:	4621      	mov	r1, r4
c0de92f2:	6882      	ldr	r2, [r0, #8]
c0de92f4:	b2e8      	uxtb	r0, r5
c0de92f6:	4790      	blx	r2
c0de92f8:	4620      	mov	r0, r4
c0de92fa:	bd70      	pop	{r4, r5, r6, pc}
c0de92fc:	eb09 0006 	add.w	r0, r9, r6
c0de9300:	ebc5 01c5 	rsb	r1, r5, r5, lsl #3
c0de9304:	6880      	ldr	r0, [r0, #8]
c0de9306:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
c0de930a:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de930e:	f001 bcf3 	b.w	c0deacf8 <pic>
c0de9312:	bf00      	nop
c0de9314:	0000195c 	.word	0x0000195c

c0de9318 <getContentNbElement>:
c0de9318:	7801      	ldrb	r1, [r0, #0]
c0de931a:	290a      	cmp	r1, #10
c0de931c:	d00b      	beq.n	c0de9336 <getContentNbElement+0x1e>
c0de931e:	2906      	cmp	r1, #6
c0de9320:	d009      	beq.n	c0de9336 <getContentNbElement+0x1e>
c0de9322:	2907      	cmp	r1, #7
c0de9324:	d009      	beq.n	c0de933a <getContentNbElement+0x22>
c0de9326:	2908      	cmp	r1, #8
c0de9328:	d009      	beq.n	c0de933e <getContentNbElement+0x26>
c0de932a:	2909      	cmp	r1, #9
c0de932c:	d009      	beq.n	c0de9342 <getContentNbElement+0x2a>
c0de932e:	2904      	cmp	r1, #4
c0de9330:	bf1c      	itt	ne
c0de9332:	2001      	movne	r0, #1
c0de9334:	4770      	bxne	lr
c0de9336:	7b00      	ldrb	r0, [r0, #12]
c0de9338:	4770      	bx	lr
c0de933a:	7a00      	ldrb	r0, [r0, #8]
c0de933c:	4770      	bx	lr
c0de933e:	7c00      	ldrb	r0, [r0, #16]
c0de9340:	4770      	bx	lr
c0de9342:	7a40      	ldrb	r0, [r0, #9]
c0de9344:	4770      	bx	lr
	...

c0de9348 <genericContextComputeNextPageParams>:
c0de9348:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de934c:	f8df 810c 	ldr.w	r8, [pc, #268]	@ c0de945c <genericContextComputeNextPageParams+0x114>
c0de9350:	4682      	mov	sl, r0
c0de9352:	4616      	mov	r6, r2
c0de9354:	460d      	mov	r5, r1
c0de9356:	f10d 0107 	add.w	r1, sp, #7
c0de935a:	461a      	mov	r2, r3
c0de935c:	eb09 0008 	add.w	r0, r9, r8
c0de9360:	7c04      	ldrb	r4, [r0, #16]
c0de9362:	7c87      	ldrb	r7, [r0, #18]
c0de9364:	4650      	mov	r0, sl
c0de9366:	f000 f881 	bl	c0de946c <genericContextGetPageInfo>
c0de936a:	f89d 0007 	ldrb.w	r0, [sp, #7]
c0de936e:	f8df b0f0 	ldr.w	fp, [pc, #240]	@ c0de9460 <genericContextComputeNextPageParams+0x118>
c0de9372:	7030      	strb	r0, [r6, #0]
c0de9374:	eb09 010b 	add.w	r1, r9, fp
c0de9378:	f891 1060 	ldrb.w	r1, [r1, #96]	@ 0x60
c0de937c:	4551      	cmp	r1, sl
c0de937e:	d219      	bcs.n	c0de93b4 <genericContextComputeNextPageParams+0x6c>
c0de9380:	4b38      	ldr	r3, [pc, #224]	@ (c0de9464 <genericContextComputeNextPageParams+0x11c>)
c0de9382:	084e      	lsrs	r6, r1, #1
c0de9384:	2204      	movs	r2, #4
c0de9386:	ea02 0281 	and.w	r2, r2, r1, lsl #2
c0de938a:	444b      	add	r3, r9
c0de938c:	5d9b      	ldrb	r3, [r3, r6]
c0de938e:	fa23 f202 	lsr.w	r2, r3, r2
c0de9392:	2300      	movs	r3, #0
c0de9394:	f002 0207 	and.w	r2, r2, #7
c0de9398:	4417      	add	r7, r2
c0de939a:	eb09 0208 	add.w	r2, r9, r8
c0de939e:	7c52      	ldrb	r2, [r2, #17]
c0de93a0:	4297      	cmp	r7, r2
c0de93a2:	bf28      	it	cs
c0de93a4:	2301      	movcs	r3, #1
c0de93a6:	2a00      	cmp	r2, #0
c0de93a8:	bf18      	it	ne
c0de93aa:	2201      	movne	r2, #1
c0de93ac:	401a      	ands	r2, r3
c0de93ae:	bf18      	it	ne
c0de93b0:	2700      	movne	r7, #0
c0de93b2:	4414      	add	r4, r2
c0de93b4:	4551      	cmp	r1, sl
c0de93b6:	d905      	bls.n	c0de93c4 <genericContextComputeNextPageParams+0x7c>
c0de93b8:	1a3f      	subs	r7, r7, r0
c0de93ba:	f1b7 3fff 	cmp.w	r7, #4294967295	@ 0xffffffff
c0de93be:	bfdc      	itt	le
c0de93c0:	4247      	negle	r7, r0
c0de93c2:	3c01      	suble	r4, #1
c0de93c4:	b2e6      	uxtb	r6, r4
c0de93c6:	2eff      	cmp	r6, #255	@ 0xff
c0de93c8:	d014      	beq.n	c0de93f4 <genericContextComputeNextPageParams+0xac>
c0de93ca:	eb09 0108 	add.w	r1, r9, r8
c0de93ce:	b260      	sxtb	r0, r4
c0de93d0:	7b09      	ldrb	r1, [r1, #12]
c0de93d2:	4288      	cmp	r0, r1
c0de93d4:	d108      	bne.n	c0de93e8 <genericContextComputeNextPageParams+0xa0>
c0de93d6:	eb09 0108 	add.w	r1, r9, r8
c0de93da:	7d09      	ldrb	r1, [r1, #20]
c0de93dc:	b121      	cbz	r1, c0de93e8 <genericContextComputeNextPageParams+0xa0>
c0de93de:	4822      	ldr	r0, [pc, #136]	@ (c0de9468 <genericContextComputeNextPageParams+0x120>)
c0de93e0:	4448      	add	r0, r9
c0de93e2:	f100 0538 	add.w	r5, r0, #56	@ 0x38
c0de93e6:	e00d      	b.n	c0de9404 <genericContextComputeNextPageParams+0xbc>
c0de93e8:	4629      	mov	r1, r5
c0de93ea:	f7ff ff6b 	bl	c0de92c4 <getContentAtIdx>
c0de93ee:	4605      	mov	r5, r0
c0de93f0:	b940      	cbnz	r0, c0de9404 <genericContextComputeNextPageParams+0xbc>
c0de93f2:	e02e      	b.n	c0de9452 <genericContextComputeNextPageParams+0x10a>
c0de93f4:	eb09 0008 	add.w	r0, r9, r8
c0de93f8:	7cc0      	ldrb	r0, [r0, #19]
c0de93fa:	2800      	cmp	r0, #0
c0de93fc:	d0e5      	beq.n	c0de93ca <genericContextComputeNextPageParams+0x82>
c0de93fe:	481a      	ldr	r0, [pc, #104]	@ (c0de9468 <genericContextComputeNextPageParams+0x120>)
c0de9400:	eb09 0500 	add.w	r5, r9, r0
c0de9404:	eb09 0008 	add.w	r0, r9, r8
c0de9408:	7c00      	ldrb	r0, [r0, #16]
c0de940a:	4286      	cmp	r6, r0
c0de940c:	d103      	bne.n	c0de9416 <genericContextComputeNextPageParams+0xce>
c0de940e:	eb09 0008 	add.w	r0, r9, r8
c0de9412:	7c40      	ldrb	r0, [r0, #17]
c0de9414:	b988      	cbnz	r0, c0de943a <genericContextComputeNextPageParams+0xf2>
c0de9416:	eb09 0608 	add.w	r6, r9, r8
c0de941a:	4628      	mov	r0, r5
c0de941c:	7434      	strb	r4, [r6, #16]
c0de941e:	f7ff ff7b 	bl	c0de9318 <getContentNbElement>
c0de9422:	7470      	strb	r0, [r6, #17]
c0de9424:	6b68      	ldr	r0, [r5, #52]	@ 0x34
c0de9426:	eb09 040b 	add.w	r4, r9, fp
c0de942a:	f001 fc65 	bl	c0deacf8 <pic>
c0de942e:	62e0      	str	r0, [r4, #44]	@ 0x2c
c0de9430:	7c70      	ldrb	r0, [r6, #17]
c0de9432:	f1b7 3fff 	cmp.w	r7, #4294967295	@ 0xffffffff
c0de9436:	dc02      	bgt.n	c0de943e <genericContextComputeNextPageParams+0xf6>
c0de9438:	4407      	add	r7, r0
c0de943a:	2f00      	cmp	r7, #0
c0de943c:	d409      	bmi.n	c0de9452 <genericContextComputeNextPageParams+0x10a>
c0de943e:	4287      	cmp	r7, r0
c0de9440:	d207      	bcs.n	c0de9452 <genericContextComputeNextPageParams+0x10a>
c0de9442:	eb09 000b 	add.w	r0, r9, fp
c0de9446:	f880 a060 	strb.w	sl, [r0, #96]	@ 0x60
c0de944a:	eb09 0008 	add.w	r0, r9, r8
c0de944e:	7487      	strb	r7, [r0, #18]
c0de9450:	e000      	b.n	c0de9454 <genericContextComputeNextPageParams+0x10c>
c0de9452:	2500      	movs	r5, #0
c0de9454:	4628      	mov	r0, r5
c0de9456:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de945a:	bf00      	nop
c0de945c:	0000195c 	.word	0x0000195c
c0de9460:	00001c28 	.word	0x00001c28
c0de9464:	00001b28 	.word	0x00001b28
c0de9468:	000019c8 	.word	0x000019c8

c0de946c <genericContextGetPageInfo>:
c0de946c:	b510      	push	{r4, lr}
c0de946e:	4c08      	ldr	r4, [pc, #32]	@ (c0de9490 <genericContextGetPageInfo+0x24>)
c0de9470:	2304      	movs	r3, #4
c0de9472:	ea03 0380 	and.w	r3, r3, r0, lsl #2
c0de9476:	0840      	lsrs	r0, r0, #1
c0de9478:	444c      	add	r4, r9
c0de947a:	5c20      	ldrb	r0, [r4, r0]
c0de947c:	40d8      	lsrs	r0, r3
c0de947e:	b111      	cbz	r1, c0de9486 <genericContextGetPageInfo+0x1a>
c0de9480:	f000 0307 	and.w	r3, r0, #7
c0de9484:	700b      	strb	r3, [r1, #0]
c0de9486:	b112      	cbz	r2, c0de948e <genericContextGetPageInfo+0x22>
c0de9488:	f3c0 00c0 	ubfx	r0, r0, #3, #1
c0de948c:	7010      	strb	r0, [r2, #0]
c0de948e:	bd10      	pop	{r4, pc}
c0de9490:	00001b28 	.word	0x00001b28

c0de9494 <bundleNavStartSettings>:
c0de9494:	2000      	movs	r0, #0
c0de9496:	f7fe bf3f 	b.w	c0de8318 <bundleNavStartSettingsAtPage>
	...

c0de949c <displayFullValuePage>:
c0de949c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de94a0:	b092      	sub	sp, #72	@ 0x48
c0de94a2:	460d      	mov	r5, r1
c0de94a4:	68d1      	ldr	r1, [r2, #12]
c0de94a6:	4614      	mov	r4, r2
c0de94a8:	b101      	cbz	r1, c0de94ac <displayFullValuePage+0x10>
c0de94aa:	4608      	mov	r0, r1
c0de94ac:	f001 fc24 	bl	c0deacf8 <pic>
c0de94b0:	4606      	mov	r6, r0
c0de94b2:	7d20      	ldrb	r0, [r4, #20]
c0de94b4:	2805      	cmp	r0, #5
c0de94b6:	d00d      	beq.n	c0de94d4 <displayFullValuePage+0x38>
c0de94b8:	2804      	cmp	r0, #4
c0de94ba:	d170      	bne.n	c0de959e <displayFullValuePage+0x102>
c0de94bc:	4861      	ldr	r0, [pc, #388]	@ (c0de9644 <displayFullValuePage+0x1a8>)
c0de94be:	6921      	ldr	r1, [r4, #16]
c0de94c0:	2201      	movs	r2, #1
c0de94c2:	4448      	add	r0, r9
c0de94c4:	6341      	str	r1, [r0, #52]	@ 0x34
c0de94c6:	4630      	mov	r0, r6
c0de94c8:	6921      	ldr	r1, [r4, #16]
c0de94ca:	b012      	add	sp, #72	@ 0x48
c0de94cc:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de94d0:	f000 ba48 	b.w	c0de9964 <displayInfosListModal>
c0de94d4:	485b      	ldr	r0, [pc, #364]	@ (c0de9644 <displayFullValuePage+0x1a8>)
c0de94d6:	6921      	ldr	r1, [r4, #16]
c0de94d8:	2200      	movs	r2, #0
c0de94da:	4448      	add	r0, r9
c0de94dc:	6381      	str	r1, [r0, #56]	@ 0x38
c0de94de:	485a      	ldr	r0, [pc, #360]	@ (c0de9648 <displayFullValuePage+0x1ac>)
c0de94e0:	2100      	movs	r1, #0
c0de94e2:	6927      	ldr	r7, [r4, #16]
c0de94e4:	9102      	str	r1, [sp, #8]
c0de94e6:	4448      	add	r0, r9
c0de94e8:	e9c0 220c 	strd	r2, r2, [r0, #48]	@ 0x30
c0de94ec:	6382      	str	r2, [r0, #56]	@ 0x38
c0de94ee:	63c2      	str	r2, [r0, #60]	@ 0x3c
c0de94f0:	7a3d      	ldrb	r5, [r7, #8]
c0de94f2:	0628      	lsls	r0, r5, #24
c0de94f4:	f000 8087 	beq.w	c0de9606 <displayFullValuePage+0x16a>
c0de94f8:	9501      	str	r5, [sp, #4]
c0de94fa:	fa5f fb85 	uxtb.w	fp, r5
c0de94fe:	f04f 0800 	mov.w	r8, #0
c0de9502:	2600      	movs	r6, #0
c0de9504:	9802      	ldr	r0, [sp, #8]
c0de9506:	b2c0      	uxtb	r0, r0
c0de9508:	ea4f 1a00 	mov.w	sl, r0, lsl #4
c0de950c:	45c3      	cmp	fp, r8
c0de950e:	d027      	beq.n	c0de9560 <displayFullValuePage+0xc4>
c0de9510:	f1b8 0f00 	cmp.w	r8, #0
c0de9514:	bf18      	it	ne
c0de9516:	3618      	addne	r6, #24
c0de9518:	6838      	ldr	r0, [r7, #0]
c0de951a:	b108      	cbz	r0, c0de9520 <displayFullValuePage+0x84>
c0de951c:	4450      	add	r0, sl
c0de951e:	e004      	b.n	c0de952a <displayFullValuePage+0x8e>
c0de9520:	9802      	ldr	r0, [sp, #8]
c0de9522:	6879      	ldr	r1, [r7, #4]
c0de9524:	4440      	add	r0, r8
c0de9526:	b2c0      	uxtb	r0, r0
c0de9528:	4788      	blx	r1
c0de952a:	f001 fbe5 	bl	c0deacf8 <pic>
c0de952e:	7b7b      	ldrb	r3, [r7, #13]
c0de9530:	6801      	ldr	r1, [r0, #0]
c0de9532:	4604      	mov	r4, r0
c0de9534:	f000 fd3b 	bl	c0de9fae <OUTLINED_FUNCTION_12>
c0de9538:	6861      	ldr	r1, [r4, #4]
c0de953a:	7b7b      	ldrb	r3, [r7, #13]
c0de953c:	4605      	mov	r5, r0
c0de953e:	f000 fd36 	bl	c0de9fae <OUTLINED_FUNCTION_12>
c0de9542:	1971      	adds	r1, r6, r5
c0de9544:	f10a 0a10 	add.w	sl, sl, #16
c0de9548:	f108 0801 	add.w	r8, r8, #1
c0de954c:	4408      	add	r0, r1
c0de954e:	1d06      	adds	r6, r0, #4
c0de9550:	b2b0      	uxth	r0, r6
c0de9552:	f5b0 7fe8 	cmp.w	r0, #464	@ 0x1d0
c0de9556:	d3d9      	bcc.n	c0de950c <displayFullValuePage+0x70>
c0de9558:	9d01      	ldr	r5, [sp, #4]
c0de955a:	f1a8 0001 	sub.w	r0, r8, #1
c0de955e:	e001      	b.n	c0de9564 <displayFullValuePage+0xc8>
c0de9560:	9d01      	ldr	r5, [sp, #4]
c0de9562:	4628      	mov	r0, r5
c0de9564:	4938      	ldr	r1, [pc, #224]	@ (c0de9648 <displayFullValuePage+0x1ac>)
c0de9566:	2404      	movs	r4, #4
c0de9568:	1a2d      	subs	r5, r5, r0
c0de956a:	4449      	add	r1, r9
c0de956c:	f891 2030 	ldrb.w	r2, [r1, #48]	@ 0x30
c0de9570:	1c53      	adds	r3, r2, #1
c0de9572:	f881 3030 	strb.w	r3, [r1, #48]	@ 0x30
c0de9576:	eb01 0152 	add.w	r1, r1, r2, lsr #1
c0de957a:	ea04 0282 	and.w	r2, r4, r2, lsl #2
c0de957e:	240f      	movs	r4, #15
c0de9580:	f891 3050 	ldrb.w	r3, [r1, #80]	@ 0x50
c0de9584:	4094      	lsls	r4, r2
c0de9586:	43a3      	bics	r3, r4
c0de9588:	f000 0407 	and.w	r4, r0, #7
c0de958c:	fa04 f202 	lsl.w	r2, r4, r2
c0de9590:	431a      	orrs	r2, r3
c0de9592:	f881 2050 	strb.w	r2, [r1, #80]	@ 0x50
c0de9596:	9902      	ldr	r1, [sp, #8]
c0de9598:	4401      	add	r1, r0
c0de959a:	9102      	str	r1, [sp, #8]
c0de959c:	e7a9      	b.n	c0de94f2 <displayFullValuePage+0x56>
c0de959e:	af0b      	add	r7, sp, #44	@ 0x2c
c0de95a0:	492a      	ldr	r1, [pc, #168]	@ (c0de964c <displayFullValuePage+0x1b0>)
c0de95a2:	221c      	movs	r2, #28
c0de95a4:	4638      	mov	r0, r7
c0de95a6:	4479      	add	r1, pc
c0de95a8:	f001 fdbe 	bl	c0deb128 <__aeabi_memcpy>
c0de95ac:	f44f 6010 	mov.w	r0, #2304	@ 0x900
c0de95b0:	f8df 8090 	ldr.w	r8, [pc, #144]	@ c0de9644 <displayFullValuePage+0x1a8>
c0de95b4:	9609      	str	r6, [sp, #36]	@ 0x24
c0de95b6:	f8ad 0028 	strh.w	r0, [sp, #40]	@ 0x28
c0de95ba:	2000      	movs	r0, #0
c0de95bc:	9008      	str	r0, [sp, #32]
c0de95be:	2001      	movs	r0, #1
c0de95c0:	eb09 0608 	add.w	r6, r9, r8
c0de95c4:	f8ad 001c 	strh.w	r0, [sp, #28]
c0de95c8:	4638      	mov	r0, r7
c0de95ca:	f7f9 fd83 	bl	c0de30d4 <nbgl_layoutGet>
c0de95ce:	62f0      	str	r0, [r6, #44]	@ 0x2c
c0de95d0:	a907      	add	r1, sp, #28
c0de95d2:	f7fc fb17 	bl	c0de5c04 <nbgl_layoutAddHeader>
c0de95d6:	7d20      	ldrb	r0, [r4, #20]
c0de95d8:	2801      	cmp	r0, #1
c0de95da:	d01b      	beq.n	c0de9614 <displayFullValuePage+0x178>
c0de95dc:	2802      	cmp	r0, #2
c0de95de:	d01c      	beq.n	c0de961a <displayFullValuePage+0x17e>
c0de95e0:	2803      	cmp	r0, #3
c0de95e2:	d11d      	bne.n	c0de9620 <displayFullValuePage+0x184>
c0de95e4:	f44f 3080 	mov.w	r0, #65536	@ 0x10000
c0de95e8:	9006      	str	r0, [sp, #24]
c0de95ea:	cc07      	ldmia	r4!, {r0, r1, r2}
c0de95ec:	9105      	str	r1, [sp, #20]
c0de95ee:	2a00      	cmp	r2, #0
c0de95f0:	9003      	str	r0, [sp, #12]
c0de95f2:	bf08      	it	eq
c0de95f4:	4602      	moveq	r2, r0
c0de95f6:	eb09 0008 	add.w	r0, r9, r8
c0de95fa:	9204      	str	r2, [sp, #16]
c0de95fc:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0de95fe:	a903      	add	r1, sp, #12
c0de9600:	f7fb fea5 	bl	c0de534e <nbgl_layoutAddQRCode>
c0de9604:	e014      	b.n	c0de9630 <displayFullValuePage+0x194>
c0de9606:	2000      	movs	r0, #0
c0de9608:	2101      	movs	r1, #1
c0de960a:	b012      	add	sp, #72	@ 0x48
c0de960c:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9610:	f000 bb12 	b.w	c0de9c38 <displayTagValueListModalPage>
c0de9614:	4b0e      	ldr	r3, [pc, #56]	@ (c0de9650 <displayFullValuePage+0x1b4>)
c0de9616:	447b      	add	r3, pc
c0de9618:	e003      	b.n	c0de9622 <displayFullValuePage+0x186>
c0de961a:	4b0e      	ldr	r3, [pc, #56]	@ (c0de9654 <displayFullValuePage+0x1b8>)
c0de961c:	447b      	add	r3, pc
c0de961e:	e000      	b.n	c0de9622 <displayFullValuePage+0x186>
c0de9620:	6863      	ldr	r3, [r4, #4]
c0de9622:	eb09 0008 	add.w	r0, r9, r8
c0de9626:	6822      	ldr	r2, [r4, #0]
c0de9628:	4629      	mov	r1, r5
c0de962a:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0de962c:	f7fb fa72 	bl	c0de4b14 <nbgl_layoutAddTextContent>
c0de9630:	eb09 0008 	add.w	r0, r9, r8
c0de9634:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0de9636:	f7fc ff47 	bl	c0de64c8 <nbgl_layoutDraw>
c0de963a:	f001 f940 	bl	c0dea8be <nbgl_refresh>
c0de963e:	b012      	add	sp, #72	@ 0x48
c0de9640:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de9644:	0000195c 	.word	0x0000195c
c0de9648:	00001c28 	.word	0x00001c28
c0de964c:	00004f76 	.word	0x00004f76
c0de9650:	000031fc 	.word	0x000031fc
c0de9654:	000034e5 	.word	0x000034e5

c0de9658 <displaySecurityReport>:
c0de9658:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de965c:	b09a      	sub	sp, #104	@ 0x68
c0de965e:	ac13      	add	r4, sp, #76	@ 0x4c
c0de9660:	4974      	ldr	r1, [pc, #464]	@ (c0de9834 <displaySecurityReport+0x1dc>)
c0de9662:	4605      	mov	r5, r0
c0de9664:	221c      	movs	r2, #28
c0de9666:	4620      	mov	r0, r4
c0de9668:	4479      	add	r1, pc
c0de966a:	f001 fd5d 	bl	c0deb128 <__aeabi_memcpy>
c0de966e:	4872      	ldr	r0, [pc, #456]	@ (c0de9838 <displaySecurityReport+0x1e0>)
c0de9670:	a90f      	add	r1, sp, #60	@ 0x3c
c0de9672:	4478      	add	r0, pc
c0de9674:	e890 00cc 	ldmia.w	r0, {r2, r3, r6, r7}
c0de9678:	c1cc      	stmia	r1!, {r2, r3, r6, r7}
c0de967a:	a809      	add	r0, sp, #36	@ 0x24
c0de967c:	2118      	movs	r1, #24
c0de967e:	f001 fd5d 	bl	c0deb13c <__aeabi_memclr>
c0de9682:	f8df b1a8 	ldr.w	fp, [pc, #424]	@ c0de982c <displaySecurityReport+0x1d4>
c0de9686:	4620      	mov	r0, r4
c0de9688:	eb09 060b 	add.w	r6, r9, fp
c0de968c:	f7f9 fd22 	bl	c0de30d4 <nbgl_layoutGet>
c0de9690:	4604      	mov	r4, r0
c0de9692:	6670      	str	r0, [r6, #100]	@ 0x64
c0de9694:	f896 0068 	ldrb.w	r0, [r6, #104]	@ 0x68
c0de9698:	2801      	cmp	r0, #1
c0de969a:	d14b      	bne.n	c0de9734 <displaySecurityReport+0xdc>
c0de969c:	f896 0069 	ldrb.w	r0, [r6, #105]	@ 0x69
c0de96a0:	2800      	cmp	r0, #0
c0de96a2:	d147      	bne.n	c0de9734 <displaySecurityReport+0xdc>
c0de96a4:	4865      	ldr	r0, [pc, #404]	@ (c0de983c <displaySecurityReport+0x1e4>)
c0de96a6:	2600      	movs	r6, #0
c0de96a8:	466c      	mov	r4, sp
c0de96aa:	f04f 0800 	mov.w	r8, #0
c0de96ae:	4478      	add	r0, pc
c0de96b0:	1d05      	adds	r5, r0, #4
c0de96b2:	2e05      	cmp	r6, #5
c0de96b4:	d075      	beq.n	c0de97a2 <displaySecurityReport+0x14a>
c0de96b6:	eb09 000b 	add.w	r0, r9, fp
c0de96ba:	f8d0 a058 	ldr.w	sl, [r0, #88]	@ 0x58
c0de96be:	f8da 0000 	ldr.w	r0, [sl]
c0de96c2:	40f0      	lsrs	r0, r6
c0de96c4:	07c0      	lsls	r0, r0, #31
c0de96c6:	d02b      	beq.n	c0de9720 <displaySecurityReport+0xc8>
c0de96c8:	4620      	mov	r0, r4
c0de96ca:	2118      	movs	r1, #24
c0de96cc:	f001 fd36 	bl	c0deb13c <__aeabi_memclr>
c0de96d0:	f008 007f 	and.w	r0, r8, #127	@ 0x7f
c0de96d4:	2804      	cmp	r0, #4
c0de96d6:	d828      	bhi.n	c0de972a <displaySecurityReport+0xd2>
c0de96d8:	2101      	movs	r1, #1
c0de96da:	fa01 f000 	lsl.w	r0, r1, r0
c0de96de:	f010 0f19 	tst.w	r0, #25
c0de96e2:	d022      	beq.n	c0de972a <displaySecurityReport+0xd2>
c0de96e4:	6868      	ldr	r0, [r5, #4]
c0de96e6:	9003      	str	r0, [sp, #12]
c0de96e8:	6828      	ldr	r0, [r5, #0]
c0de96ea:	2e03      	cmp	r6, #3
c0de96ec:	9001      	str	r0, [sp, #4]
c0de96ee:	d101      	bne.n	c0de96f4 <displaySecurityReport+0x9c>
c0de96f0:	20ff      	movs	r0, #255	@ 0xff
c0de96f2:	e007      	b.n	c0de9704 <displaySecurityReport+0xac>
c0de96f4:	2009      	movs	r0, #9
c0de96f6:	f88d 0014 	strb.w	r0, [sp, #20]
c0de96fa:	4851      	ldr	r0, [pc, #324]	@ (c0de9840 <displaySecurityReport+0x1e8>)
c0de96fc:	4478      	add	r0, pc
c0de96fe:	9002      	str	r0, [sp, #8]
c0de9700:	f106 0017 	add.w	r0, r6, #23
c0de9704:	f88d 0011 	strb.w	r0, [sp, #17]
c0de9708:	f855 0c04 	ldr.w	r0, [r5, #-4]
c0de970c:	eb09 070b 	add.w	r7, r9, fp
c0de9710:	4621      	mov	r1, r4
c0de9712:	9000      	str	r0, [sp, #0]
c0de9714:	6e78      	ldr	r0, [r7, #100]	@ 0x64
c0de9716:	f7fa fe8a 	bl	c0de442e <nbgl_layoutAddTouchableBar>
c0de971a:	6e78      	ldr	r0, [r7, #100]	@ 0x64
c0de971c:	f7fc f948 	bl	c0de59b0 <nbgl_layoutAddSeparationLine>
c0de9720:	350c      	adds	r5, #12
c0de9722:	f108 0801 	add.w	r8, r8, #1
c0de9726:	3601      	adds	r6, #1
c0de9728:	e7c3      	b.n	c0de96b2 <displaySecurityReport+0x5a>
c0de972a:	f8da 0010 	ldr.w	r0, [sl, #16]
c0de972e:	2800      	cmp	r0, #0
c0de9730:	d1d9      	bne.n	c0de96e6 <displaySecurityReport+0x8e>
c0de9732:	e7d7      	b.n	c0de96e4 <displaySecurityReport+0x8c>
c0de9734:	eb09 000b 	add.w	r0, r9, fp
c0de9738:	6d80      	ldr	r0, [r0, #88]	@ 0x58
c0de973a:	b108      	cbz	r0, c0de9740 <displaySecurityReport+0xe8>
c0de973c:	68c6      	ldr	r6, [r0, #12]
c0de973e:	b90e      	cbnz	r6, c0de9744 <displaySecurityReport+0xec>
c0de9740:	4e40      	ldr	r6, [pc, #256]	@ (c0de9844 <displaySecurityReport+0x1ec>)
c0de9742:	447e      	add	r6, pc
c0de9744:	f015 0f06 	tst.w	r5, #6
c0de9748:	d035      	beq.n	c0de97b6 <displaySecurityReport+0x15e>
c0de974a:	f44f 3180 	mov.w	r1, #65536	@ 0x10000
c0de974e:	9103      	str	r1, [sp, #12]
c0de9750:	493d      	ldr	r1, [pc, #244]	@ (c0de9848 <displaySecurityReport+0x1f0>)
c0de9752:	4479      	add	r1, pc
c0de9754:	9102      	str	r1, [sp, #8]
c0de9756:	2140      	movs	r1, #64	@ 0x40
c0de9758:	6883      	ldr	r3, [r0, #8]
c0de975a:	4835      	ldr	r0, [pc, #212]	@ (c0de9830 <displaySecurityReport+0x1d8>)
c0de975c:	4448      	add	r0, r9
c0de975e:	9301      	str	r3, [sp, #4]
c0de9760:	f100 0440 	add.w	r4, r0, #64	@ 0x40
c0de9764:	9400      	str	r4, [sp, #0]
c0de9766:	4620      	mov	r0, r4
c0de9768:	4a38      	ldr	r2, [pc, #224]	@ (c0de984c <displaySecurityReport+0x1f4>)
c0de976a:	447a      	add	r2, pc
c0de976c:	f001 f932 	bl	c0dea9d4 <snprintf>
c0de9770:	4620      	mov	r0, r4
c0de9772:	f001 fd4f 	bl	c0deb214 <strlen>
c0de9776:	4605      	mov	r5, r0
c0de9778:	eb09 000b 	add.w	r0, r9, fp
c0de977c:	4669      	mov	r1, sp
c0de977e:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0de9780:	f7fb fde5 	bl	c0de534e <nbgl_layoutAddQRCode>
c0de9784:	2018      	movs	r0, #24
c0de9786:	f1c5 013f 	rsb	r1, r5, #63	@ 0x3f
c0de978a:	4633      	mov	r3, r6
c0de978c:	f8ad 0028 	strh.w	r0, [sp, #40]	@ 0x28
c0de9790:	1928      	adds	r0, r5, r4
c0de9792:	4a2f      	ldr	r2, [pc, #188]	@ (c0de9850 <displaySecurityReport+0x1f8>)
c0de9794:	1c44      	adds	r4, r0, #1
c0de9796:	4620      	mov	r0, r4
c0de9798:	447a      	add	r2, pc
c0de979a:	f001 f91b 	bl	c0dea9d4 <snprintf>
c0de979e:	9411      	str	r4, [sp, #68]	@ 0x44
c0de97a0:	e030      	b.n	c0de9804 <displaySecurityReport+0x1ac>
c0de97a2:	4831      	ldr	r0, [pc, #196]	@ (c0de9868 <displaySecurityReport+0x210>)
c0de97a4:	4478      	add	r0, pc
c0de97a6:	9011      	str	r0, [sp, #68]	@ 0x44
c0de97a8:	eb09 000b 	add.w	r0, r9, fp
c0de97ac:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0de97ae:	a90f      	add	r1, sp, #60	@ 0x3c
c0de97b0:	f7fc fa28 	bl	c0de5c04 <nbgl_layoutAddHeader>
c0de97b4:	e030      	b.n	c0de9818 <displaySecurityReport+0x1c0>
c0de97b6:	06e8      	lsls	r0, r5, #27
c0de97b8:	d40c      	bmi.n	c0de97d4 <displaySecurityReport+0x17c>
c0de97ba:	07e8      	lsls	r0, r5, #31
c0de97bc:	d0f4      	beq.n	c0de97a8 <displaySecurityReport+0x150>
c0de97be:	466d      	mov	r5, sp
c0de97c0:	2124      	movs	r1, #36	@ 0x24
c0de97c2:	4628      	mov	r0, r5
c0de97c4:	f001 fcba 	bl	c0deb13c <__aeabi_memclr>
c0de97c8:	4825      	ldr	r0, [pc, #148]	@ (c0de9860 <displaySecurityReport+0x208>)
c0de97ca:	4478      	add	r0, pc
c0de97cc:	9006      	str	r0, [sp, #24]
c0de97ce:	4825      	ldr	r0, [pc, #148]	@ (c0de9864 <displaySecurityReport+0x20c>)
c0de97d0:	4478      	add	r0, pc
c0de97d2:	e009      	b.n	c0de97e8 <displaySecurityReport+0x190>
c0de97d4:	466d      	mov	r5, sp
c0de97d6:	2124      	movs	r1, #36	@ 0x24
c0de97d8:	4628      	mov	r0, r5
c0de97da:	f001 fcaf 	bl	c0deb13c <__aeabi_memclr>
c0de97de:	481d      	ldr	r0, [pc, #116]	@ (c0de9854 <displaySecurityReport+0x1fc>)
c0de97e0:	4478      	add	r0, pc
c0de97e2:	9006      	str	r0, [sp, #24]
c0de97e4:	481c      	ldr	r0, [pc, #112]	@ (c0de9858 <displaySecurityReport+0x200>)
c0de97e6:	4478      	add	r0, pc
c0de97e8:	9004      	str	r0, [sp, #16]
c0de97ea:	4629      	mov	r1, r5
c0de97ec:	481b      	ldr	r0, [pc, #108]	@ (c0de985c <displaySecurityReport+0x204>)
c0de97ee:	4478      	add	r0, pc
c0de97f0:	9001      	str	r0, [sp, #4]
c0de97f2:	4620      	mov	r0, r4
c0de97f4:	f7fb fda2 	bl	c0de533c <nbgl_layoutAddContentCenter>
c0de97f8:	2040      	movs	r0, #64	@ 0x40
c0de97fa:	f8ad 0028 	strh.w	r0, [sp, #40]	@ 0x28
c0de97fe:	2000      	movs	r0, #0
c0de9800:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de9804:	eb09 040b 	add.w	r4, r9, fp
c0de9808:	6e60      	ldr	r0, [r4, #100]	@ 0x64
c0de980a:	a90f      	add	r1, sp, #60	@ 0x3c
c0de980c:	f7fc f9fa 	bl	c0de5c04 <nbgl_layoutAddHeader>
c0de9810:	6e60      	ldr	r0, [r4, #100]	@ 0x64
c0de9812:	a909      	add	r1, sp, #36	@ 0x24
c0de9814:	f7fa fa62 	bl	c0de3cdc <nbgl_layoutAddExtendedFooter>
c0de9818:	eb09 000b 	add.w	r0, r9, fp
c0de981c:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0de981e:	f7fc fe53 	bl	c0de64c8 <nbgl_layoutDraw>
c0de9822:	f001 f84c 	bl	c0dea8be <nbgl_refresh>
c0de9826:	b01a      	add	sp, #104	@ 0x68
c0de9828:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de982c:	0000195c 	.word	0x0000195c
c0de9830:	00001aa8 	.word	0x00001aa8
c0de9834:	00004eb4 	.word	0x00004eb4
c0de9838:	00004e1e 	.word	0x00004e1e
c0de983c:	00004e32 	.word	0x00004e32
c0de9840:	00002751 	.word	0x00002751
c0de9844:	0000337b 	.word	0x0000337b
c0de9848:	000031bc 	.word	0x000031bc
c0de984c:	0000305b 	.word	0x0000305b
c0de9850:	0000310c 	.word	0x0000310c
c0de9854:	00003147 	.word	0x00003147
c0de9858:	00003235 	.word	0x00003235
c0de985c:	000024ed 	.word	0x000024ed
c0de9860:	00003527 	.word	0x00003527
c0de9864:	00002eaa 	.word	0x00002eaa
c0de9868:	00003098 	.word	0x00003098

c0de986c <displayCustomizedSecurityReport>:
c0de986c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9870:	b092      	sub	sp, #72	@ 0x48
c0de9872:	4939      	ldr	r1, [pc, #228]	@ (c0de9958 <displayCustomizedSecurityReport+0xec>)
c0de9874:	f10d 0a2c 	add.w	sl, sp, #44	@ 0x2c
c0de9878:	4604      	mov	r4, r0
c0de987a:	221c      	movs	r2, #28
c0de987c:	4650      	mov	r0, sl
c0de987e:	4479      	add	r1, pc
c0de9880:	f001 fc52 	bl	c0deb128 <__aeabi_memcpy>
c0de9884:	4835      	ldr	r0, [pc, #212]	@ (c0de995c <displayCustomizedSecurityReport+0xf0>)
c0de9886:	ae07      	add	r6, sp, #28
c0de9888:	4631      	mov	r1, r6
c0de988a:	4478      	add	r0, pc
c0de988c:	e890 00ac 	ldmia.w	r0, {r2, r3, r5, r7}
c0de9890:	4830      	ldr	r0, [pc, #192]	@ (c0de9954 <displayCustomizedSecurityReport+0xe8>)
c0de9892:	c1ac      	stmia	r1!, {r2, r3, r5, r7}
c0de9894:	eb09 0500 	add.w	r5, r9, r0
c0de9898:	4650      	mov	r0, sl
c0de989a:	f7f9 fc1b 	bl	c0de30d4 <nbgl_layoutGet>
c0de989e:	6668      	str	r0, [r5, #100]	@ 0x64
c0de98a0:	6821      	ldr	r1, [r4, #0]
c0de98a2:	9109      	str	r1, [sp, #36]	@ 0x24
c0de98a4:	4631      	mov	r1, r6
c0de98a6:	f7fc f9ad 	bl	c0de5c04 <nbgl_layoutAddHeader>
c0de98aa:	7920      	ldrb	r0, [r4, #4]
c0de98ac:	b398      	cbz	r0, c0de9916 <displayCustomizedSecurityReport+0xaa>
c0de98ae:	2801      	cmp	r0, #1
c0de98b0:	d03c      	beq.n	c0de992c <displayCustomizedSecurityReport+0xc0>
c0de98b2:	2802      	cmp	r0, #2
c0de98b4:	d143      	bne.n	c0de993e <displayCustomizedSecurityReport+0xd2>
c0de98b6:	4f2a      	ldr	r7, [pc, #168]	@ (c0de9960 <displayCustomizedSecurityReport+0xf4>)
c0de98b8:	2600      	movs	r6, #0
c0de98ba:	f04f 0a09 	mov.w	sl, #9
c0de98be:	f10d 0b04 	add.w	fp, sp, #4
c0de98c2:	2500      	movs	r5, #0
c0de98c4:	447f      	add	r7, pc
c0de98c6:	7a20      	ldrb	r0, [r4, #8]
c0de98c8:	4285      	cmp	r5, r0
c0de98ca:	d238      	bcs.n	c0de993e <displayCustomizedSecurityReport+0xd2>
c0de98cc:	f104 020c 	add.w	r2, r4, #12
c0de98d0:	ca07      	ldmia	r2, {r0, r1, r2}
c0de98d2:	f850 0025 	ldr.w	r0, [r0, r5, lsl #2]
c0de98d6:	9002      	str	r0, [sp, #8]
c0de98d8:	f851 0025 	ldr.w	r0, [r1, r5, lsl #2]
c0de98dc:	f88d a018 	strb.w	sl, [sp, #24]
c0de98e0:	f88d 6016 	strb.w	r6, [sp, #22]
c0de98e4:	f88d 6014 	strb.w	r6, [sp, #20]
c0de98e8:	4659      	mov	r1, fp
c0de98ea:	e9cd 7003 	strd	r7, r0, [sp, #12]
c0de98ee:	f105 0017 	add.w	r0, r5, #23
c0de98f2:	f88d 0015 	strb.w	r0, [sp, #21]
c0de98f6:	f852 0025 	ldr.w	r0, [r2, r5, lsl #2]
c0de98fa:	9001      	str	r0, [sp, #4]
c0de98fc:	4815      	ldr	r0, [pc, #84]	@ (c0de9954 <displayCustomizedSecurityReport+0xe8>)
c0de98fe:	eb09 0800 	add.w	r8, r9, r0
c0de9902:	f8d8 0064 	ldr.w	r0, [r8, #100]	@ 0x64
c0de9906:	f7fa fd92 	bl	c0de442e <nbgl_layoutAddTouchableBar>
c0de990a:	f8d8 0064 	ldr.w	r0, [r8, #100]	@ 0x64
c0de990e:	f7fc f84f 	bl	c0de59b0 <nbgl_layoutAddSeparationLine>
c0de9912:	3501      	adds	r5, #1
c0de9914:	e7d7      	b.n	c0de98c6 <displayCustomizedSecurityReport+0x5a>
c0de9916:	480f      	ldr	r0, [pc, #60]	@ (c0de9954 <displayCustomizedSecurityReport+0xe8>)
c0de9918:	f104 0108 	add.w	r1, r4, #8
c0de991c:	4448      	add	r0, r9
c0de991e:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0de9920:	f7fb fd0c 	bl	c0de533c <nbgl_layoutAddContentCenter>
c0de9924:	2000      	movs	r0, #0
c0de9926:	f88d 001d 	strb.w	r0, [sp, #29]
c0de992a:	e008      	b.n	c0de993e <displayCustomizedSecurityReport+0xd2>
c0de992c:	4809      	ldr	r0, [pc, #36]	@ (c0de9954 <displayCustomizedSecurityReport+0xe8>)
c0de992e:	f104 0108 	add.w	r1, r4, #8
c0de9932:	4448      	add	r0, r9
c0de9934:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0de9936:	f7fb fd0a 	bl	c0de534e <nbgl_layoutAddQRCode>
c0de993a:	6820      	ldr	r0, [r4, #0]
c0de993c:	9009      	str	r0, [sp, #36]	@ 0x24
c0de993e:	4805      	ldr	r0, [pc, #20]	@ (c0de9954 <displayCustomizedSecurityReport+0xe8>)
c0de9940:	4448      	add	r0, r9
c0de9942:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0de9944:	f7fc fdc0 	bl	c0de64c8 <nbgl_layoutDraw>
c0de9948:	f000 ffb9 	bl	c0dea8be <nbgl_refresh>
c0de994c:	b012      	add	sp, #72	@ 0x48
c0de994e:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de9952:	bf00      	nop
c0de9954:	0000195c 	.word	0x0000195c
c0de9958:	00004c9e 	.word	0x00004c9e
c0de995c:	00004c06 	.word	0x00004c06
c0de9960:	00002589 	.word	0x00002589

c0de9964 <displayInfosListModal>:
c0de9964:	b570      	push	{r4, r5, r6, lr}
c0de9966:	b098      	sub	sp, #96	@ 0x60
c0de9968:	4606      	mov	r6, r0
c0de996a:	460c      	mov	r4, r1
c0de996c:	a811      	add	r0, sp, #68	@ 0x44
c0de996e:	491c      	ldr	r1, [pc, #112]	@ (c0de99e0 <displayInfosListModal+0x7c>)
c0de9970:	4615      	mov	r5, r2
c0de9972:	221c      	movs	r2, #28
c0de9974:	4479      	add	r1, pc
c0de9976:	f001 fbd7 	bl	c0deb128 <__aeabi_memcpy>
c0de997a:	2008      	movs	r0, #8
c0de997c:	f88d 0010 	strb.w	r0, [sp, #16]
c0de9980:	2000      	movs	r0, #0
c0de9982:	9003      	str	r0, [sp, #12]
c0de9984:	4814      	ldr	r0, [pc, #80]	@ (c0de99d8 <displayInfosListModal+0x74>)
c0de9986:	e9cd 6001 	strd	r6, r0, [sp, #4]
c0de998a:	200f      	movs	r0, #15
c0de998c:	2d00      	cmp	r5, #0
c0de998e:	bf18      	it	ne
c0de9990:	200e      	movne	r0, #14
c0de9992:	f88d 0021 	strb.w	r0, [sp, #33]	@ 0x21
c0de9996:	e894 0007 	ldmia.w	r4, {r0, r1, r2}
c0de999a:	ab05      	add	r3, sp, #20
c0de999c:	c307      	stmia	r3!, {r0, r1, r2}
c0de999e:	7b20      	ldrb	r0, [r4, #12]
c0de99a0:	f88d 0020 	strb.w	r0, [sp, #32]
c0de99a4:	7ba0      	ldrb	r0, [r4, #14]
c0de99a6:	4c0d      	ldr	r4, [pc, #52]	@ (c0de99dc <displayInfosListModal+0x78>)
c0de99a8:	f88d 0022 	strb.w	r0, [sp, #34]	@ 0x22
c0de99ac:	eb09 0004 	add.w	r0, r9, r4
c0de99b0:	6a00      	ldr	r0, [r0, #32]
c0de99b2:	b108      	cbz	r0, c0de99b8 <displayInfosListModal+0x54>
c0de99b4:	f7fd fec1 	bl	c0de773a <nbgl_pageRelease>
c0de99b8:	480a      	ldr	r0, [pc, #40]	@ (c0de99e4 <displayInfosListModal+0x80>)
c0de99ba:	a911      	add	r1, sp, #68	@ 0x44
c0de99bc:	aa01      	add	r2, sp, #4
c0de99be:	2301      	movs	r3, #1
c0de99c0:	4478      	add	r0, pc
c0de99c2:	f7fd fc91 	bl	c0de72e8 <nbgl_pageDrawGenericContentExt>
c0de99c6:	eb09 0104 	add.w	r1, r9, r4
c0de99ca:	6208      	str	r0, [r1, #32]
c0de99cc:	2002      	movs	r0, #2
c0de99ce:	f000 ff7b 	bl	c0dea8c8 <nbgl_refreshSpecial>
c0de99d2:	b018      	add	sp, #96	@ 0x60
c0de99d4:	bd70      	pop	{r4, r5, r6, pc}
c0de99d6:	bf00      	nop
c0de99d8:	00091300 	.word	0x00091300
c0de99dc:	00001c28 	.word	0x00001c28
c0de99e0:	00004bc4 	.word	0x00004bc4
c0de99e4:	ffffef75 	.word	0xffffef75

c0de99e8 <modalLayoutTouchCallback>:
c0de99e8:	b570      	push	{r4, r5, r6, lr}
c0de99ea:	2816      	cmp	r0, #22
c0de99ec:	d00a      	beq.n	c0de9a04 <modalLayoutTouchCallback+0x1c>
c0de99ee:	2815      	cmp	r0, #21
c0de99f0:	d117      	bne.n	c0de9a22 <modalLayoutTouchCallback+0x3a>
c0de99f2:	4833      	ldr	r0, [pc, #204]	@ (c0de9ac0 <modalLayoutTouchCallback+0xd8>)
c0de99f4:	eb09 0400 	add.w	r4, r9, r0
c0de99f8:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0de99fa:	f7fc fd93 	bl	c0de6524 <nbgl_layoutRelease>
c0de99fe:	2000      	movs	r0, #0
c0de9a00:	6320      	str	r0, [r4, #48]	@ 0x30
c0de9a02:	e035      	b.n	c0de9a70 <modalLayoutTouchCallback+0x88>
c0de9a04:	4c2d      	ldr	r4, [pc, #180]	@ (c0de9abc <modalLayoutTouchCallback+0xd4>)
c0de9a06:	eb09 0504 	add.w	r5, r9, r4
c0de9a0a:	6e68      	ldr	r0, [r5, #100]	@ 0x64
c0de9a0c:	f7fc fd8a 	bl	c0de6524 <nbgl_layoutRelease>
c0de9a10:	f895 0068 	ldrb.w	r0, [r5, #104]	@ 0x68
c0de9a14:	2801      	cmp	r0, #1
c0de9a16:	d817      	bhi.n	c0de9a48 <modalLayoutTouchCallback+0x60>
c0de9a18:	eb09 0004 	add.w	r0, r9, r4
c0de9a1c:	2100      	movs	r1, #0
c0de9a1e:	6641      	str	r1, [r0, #100]	@ 0x64
c0de9a20:	e026      	b.n	c0de9a70 <modalLayoutTouchCallback+0x88>
c0de9a22:	f1a0 0417 	sub.w	r4, r0, #23
c0de9a26:	2c04      	cmp	r4, #4
c0de9a28:	d81a      	bhi.n	c0de9a60 <modalLayoutTouchCallback+0x78>
c0de9a2a:	4d24      	ldr	r5, [pc, #144]	@ (c0de9abc <modalLayoutTouchCallback+0xd4>)
c0de9a2c:	eb09 0605 	add.w	r6, r9, r5
c0de9a30:	6e70      	ldr	r0, [r6, #100]	@ 0x64
c0de9a32:	f7fc fd77 	bl	c0de6524 <nbgl_layoutRelease>
c0de9a36:	2002      	movs	r0, #2
c0de9a38:	f886 0068 	strb.w	r0, [r6, #104]	@ 0x68
c0de9a3c:	6db0      	ldr	r0, [r6, #88]	@ 0x58
c0de9a3e:	6801      	ldr	r1, [r0, #0]
c0de9a40:	b331      	cbz	r1, c0de9a90 <modalLayoutTouchCallback+0xa8>
c0de9a42:	2001      	movs	r0, #1
c0de9a44:	40a0      	lsls	r0, r4
c0de9a46:	e007      	b.n	c0de9a58 <modalLayoutTouchCallback+0x70>
c0de9a48:	eb09 0004 	add.w	r0, r9, r4
c0de9a4c:	2101      	movs	r1, #1
c0de9a4e:	f880 1068 	strb.w	r1, [r0, #104]	@ 0x68
c0de9a52:	6d81      	ldr	r1, [r0, #88]	@ 0x58
c0de9a54:	6808      	ldr	r0, [r1, #0]
c0de9a56:	b188      	cbz	r0, c0de9a7c <modalLayoutTouchCallback+0x94>
c0de9a58:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de9a5c:	f7ff bdfc 	b.w	c0de9658 <displaySecurityReport>
c0de9a60:	4816      	ldr	r0, [pc, #88]	@ (c0de9abc <modalLayoutTouchCallback+0xd4>)
c0de9a62:	eb09 0400 	add.w	r4, r9, r0
c0de9a66:	6ae0      	ldr	r0, [r4, #44]	@ 0x2c
c0de9a68:	f7fc fd5c 	bl	c0de6524 <nbgl_layoutRelease>
c0de9a6c:	2000      	movs	r0, #0
c0de9a6e:	62e0      	str	r0, [r4, #44]	@ 0x2c
c0de9a70:	f000 ff4d 	bl	c0dea90e <nbgl_screenRedraw>
c0de9a74:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de9a78:	f000 bf21 	b.w	c0dea8be <nbgl_refresh>
c0de9a7c:	eb09 0004 	add.w	r0, r9, r4
c0de9a80:	2214      	movs	r2, #20
c0de9a82:	f890 0069 	ldrb.w	r0, [r0, #105]	@ 0x69
c0de9a86:	2800      	cmp	r0, #0
c0de9a88:	bf08      	it	eq
c0de9a8a:	2218      	moveq	r2, #24
c0de9a8c:	5888      	ldr	r0, [r1, r2]
c0de9a8e:	e010      	b.n	c0de9ab2 <modalLayoutTouchCallback+0xca>
c0de9a90:	eb09 0105 	add.w	r1, r9, r5
c0de9a94:	2214      	movs	r2, #20
c0de9a96:	f891 1069 	ldrb.w	r1, [r1, #105]	@ 0x69
c0de9a9a:	2900      	cmp	r1, #0
c0de9a9c:	bf08      	it	eq
c0de9a9e:	2218      	moveq	r2, #24
c0de9aa0:	5880      	ldr	r0, [r0, r2]
c0de9aa2:	7901      	ldrb	r1, [r0, #4]
c0de9aa4:	2902      	cmp	r1, #2
c0de9aa6:	bf18      	it	ne
c0de9aa8:	bd70      	popne	{r4, r5, r6, pc}
c0de9aaa:	6980      	ldr	r0, [r0, #24]
c0de9aac:	212c      	movs	r1, #44	@ 0x2c
c0de9aae:	fb04 0001 	mla	r0, r4, r1, r0
c0de9ab2:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de9ab6:	f7ff bed9 	b.w	c0de986c <displayCustomizedSecurityReport>
c0de9aba:	bf00      	nop
c0de9abc:	0000195c 	.word	0x0000195c
c0de9ac0:	00001a70 	.word	0x00001a70

c0de9ac4 <displayDetailsPage>:
c0de9ac4:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de9ac8:	b09b      	sub	sp, #108	@ 0x6c
c0de9aca:	f8df a160 	ldr.w	sl, [pc, #352]	@ c0de9c2c <displayDetailsPage+0x168>
c0de9ace:	4604      	mov	r4, r0
c0de9ad0:	f88d 004c 	strb.w	r0, [sp, #76]	@ 0x4c
c0de9ad4:	2000      	movs	r0, #0
c0de9ad6:	460e      	mov	r6, r1
c0de9ad8:	4953      	ldr	r1, [pc, #332]	@ (c0de9c28 <displayDetailsPage+0x164>)
c0de9ada:	9018      	str	r0, [sp, #96]	@ 0x60
c0de9adc:	f88d 0058 	strb.w	r0, [sp, #88]	@ 0x58
c0de9ae0:	9015      	str	r0, [sp, #84]	@ 0x54
c0de9ae2:	f44f 6010 	mov.w	r0, #2304	@ 0x900
c0de9ae6:	eb09 050a 	add.w	r5, r9, sl
c0de9aea:	f8ad 0050 	strh.w	r0, [sp, #80]	@ 0x50
c0de9aee:	f44f 7081 	mov.w	r0, #258	@ 0x102
c0de9af2:	9117      	str	r1, [sp, #92]	@ 0x5c
c0de9af4:	2140      	movs	r1, #64	@ 0x40
c0de9af6:	f895 8030 	ldrb.w	r8, [r5, #48]	@ 0x30
c0de9afa:	f8ad 004e 	strh.w	r0, [sp, #78]	@ 0x4e
c0de9afe:	f88d 804d 	strb.w	r8, [sp, #77]	@ 0x4d
c0de9b02:	a803      	add	r0, sp, #12
c0de9b04:	f001 fb1a 	bl	c0deb13c <__aeabi_memclr>
c0de9b08:	2001      	movs	r0, #1
c0de9b0a:	f88d 0028 	strb.w	r0, [sp, #40]	@ 0x28
c0de9b0e:	f88d 0024 	strb.w	r0, [sp, #36]	@ 0x24
c0de9b12:	f105 0040 	add.w	r0, r5, #64	@ 0x40
c0de9b16:	9007      	str	r0, [sp, #28]
c0de9b18:	2004      	movs	r0, #4
c0de9b1a:	f88d 0018 	strb.w	r0, [sp, #24]
c0de9b1e:	f895 0033 	ldrb.w	r0, [r5, #51]	@ 0x33
c0de9b22:	f88d 0029 	strb.w	r0, [sp, #41]	@ 0x29
c0de9b26:	6a28      	ldr	r0, [r5, #32]
c0de9b28:	b108      	cbz	r0, c0de9b2e <displayDetailsPage+0x6a>
c0de9b2a:	f7fd fe06 	bl	c0de773a <nbgl_pageRelease>
c0de9b2e:	eb09 000a 	add.w	r0, r9, sl
c0de9b32:	6b41      	ldr	r1, [r0, #52]	@ 0x34
c0de9b34:	6401      	str	r1, [r0, #64]	@ 0x40
c0de9b36:	f890 0031 	ldrb.w	r0, [r0, #49]	@ 0x31
c0de9b3a:	42a0      	cmp	r0, r4
c0de9b3c:	d207      	bcs.n	c0de9b4e <displayDetailsPage+0x8a>
c0de9b3e:	2501      	movs	r5, #1
c0de9b40:	eb09 000a 	add.w	r0, r9, sl
c0de9b44:	2e00      	cmp	r6, #0
c0de9b46:	bf18      	it	ne
c0de9b48:	2502      	movne	r5, #2
c0de9b4a:	6bc6      	ldr	r6, [r0, #60]	@ 0x3c
c0de9b4c:	e022      	b.n	c0de9b94 <displayDetailsPage+0xd0>
c0de9b4e:	eb09 000a 	add.w	r0, r9, sl
c0de9b52:	2500      	movs	r5, #0
c0de9b54:	f10d 076a 	add.w	r7, sp, #106	@ 0x6a
c0de9b58:	6b86      	ldr	r6, [r0, #56]	@ 0x38
c0de9b5a:	42a5      	cmp	r5, r4
c0de9b5c:	d219      	bcs.n	c0de9b92 <displayDetailsPage+0xce>
c0de9b5e:	200c      	movs	r0, #12
c0de9b60:	4631      	mov	r1, r6
c0de9b62:	f000 fa1f 	bl	c0de9fa4 <OUTLINED_FUNCTION_11>
c0de9b66:	280c      	cmp	r0, #12
c0de9b68:	d311      	bcc.n	c0de9b8e <displayDetailsPage+0xca>
c0de9b6a:	eb09 000a 	add.w	r0, r9, sl
c0de9b6e:	4631      	mov	r1, r6
c0de9b70:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de9b74:	230b      	movs	r3, #11
c0de9b76:	f890 0033 	ldrb.w	r0, [r0, #51]	@ 0x33
c0de9b7a:	e9cd 7000 	strd	r7, r0, [sp]
c0de9b7e:	200c      	movs	r0, #12
c0de9b80:	f000 ff01 	bl	c0dea986 <nbgl_getTextMaxLenInNbLines>
c0de9b84:	f8bd 006a 	ldrh.w	r0, [sp, #106]	@ 0x6a
c0de9b88:	3803      	subs	r0, #3
c0de9b8a:	b280      	uxth	r0, r0
c0de9b8c:	4406      	add	r6, r0
c0de9b8e:	3501      	adds	r5, #1
c0de9b90:	e7e3      	b.n	c0de9b5a <displayDetailsPage+0x96>
c0de9b92:	2502      	movs	r5, #2
c0de9b94:	eb09 000a 	add.w	r0, r9, sl
c0de9b98:	4631      	mov	r1, r6
c0de9b9a:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de9b9e:	f890 3033 	ldrb.w	r3, [r0, #51]	@ 0x33
c0de9ba2:	f880 4031 	strb.w	r4, [r0, #49]	@ 0x31
c0de9ba6:	6446      	str	r6, [r0, #68]	@ 0x44
c0de9ba8:	200c      	movs	r0, #12
c0de9baa:	f000 fee2 	bl	c0dea972 <nbgl_getTextNbLinesInWidth>
c0de9bae:	280c      	cmp	r0, #12
c0de9bb0:	d31e      	bcc.n	c0de9bf0 <displayDetailsPage+0x12c>
c0de9bb2:	eb09 040a 	add.w	r4, r9, sl
c0de9bb6:	f10d 026a 	add.w	r2, sp, #106	@ 0x6a
c0de9bba:	230b      	movs	r3, #11
c0de9bbc:	260b      	movs	r6, #11
c0de9bbe:	f894 0033 	ldrb.w	r0, [r4, #51]	@ 0x33
c0de9bc2:	6c61      	ldr	r1, [r4, #68]	@ 0x44
c0de9bc4:	e9cd 2000 	strd	r2, r0, [sp]
c0de9bc8:	200c      	movs	r0, #12
c0de9bca:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de9bce:	f000 feda 	bl	c0dea986 <nbgl_getTextMaxLenInNbLines>
c0de9bd2:	f8bd 106a 	ldrh.w	r1, [sp, #106]	@ 0x6a
c0de9bd6:	6c60      	ldr	r0, [r4, #68]	@ 0x44
c0de9bd8:	1eca      	subs	r2, r1, #3
c0de9bda:	4401      	add	r1, r0
c0de9bdc:	f811 3b01 	ldrb.w	r3, [r1], #1
c0de9be0:	b292      	uxth	r2, r2
c0de9be2:	2b0a      	cmp	r3, #10
c0de9be4:	bf18      	it	ne
c0de9be6:	1881      	addne	r1, r0, r2
c0de9be8:	63e1      	str	r1, [r4, #60]	@ 0x3c
c0de9bea:	f88d 6026 	strb.w	r6, [sp, #38]	@ 0x26
c0de9bee:	e005      	b.n	c0de9bfc <displayDetailsPage+0x138>
c0de9bf0:	2100      	movs	r1, #0
c0de9bf2:	eb09 000a 	add.w	r0, r9, sl
c0de9bf6:	63c1      	str	r1, [r0, #60]	@ 0x3c
c0de9bf8:	f88d 1026 	strb.w	r1, [sp, #38]	@ 0x26
c0de9bfc:	f1b8 0f01 	cmp.w	r8, #1
c0de9c00:	d102      	bne.n	c0de9c08 <displayDetailsPage+0x144>
c0de9c02:	480b      	ldr	r0, [pc, #44]	@ (c0de9c30 <displayDetailsPage+0x16c>)
c0de9c04:	4478      	add	r0, pc
c0de9c06:	9018      	str	r0, [sp, #96]	@ 0x60
c0de9c08:	480a      	ldr	r0, [pc, #40]	@ (c0de9c34 <displayDetailsPage+0x170>)
c0de9c0a:	a913      	add	r1, sp, #76	@ 0x4c
c0de9c0c:	aa03      	add	r2, sp, #12
c0de9c0e:	2301      	movs	r3, #1
c0de9c10:	4478      	add	r0, pc
c0de9c12:	f7fd fb69 	bl	c0de72e8 <nbgl_pageDrawGenericContentExt>
c0de9c16:	eb09 010a 	add.w	r1, r9, sl
c0de9c1a:	6208      	str	r0, [r1, #32]
c0de9c1c:	4628      	mov	r0, r5
c0de9c1e:	f000 fe53 	bl	c0dea8c8 <nbgl_refreshSpecial>
c0de9c22:	b01b      	add	sp, #108	@ 0x6c
c0de9c24:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de9c28:	03000101 	.word	0x03000101
c0de9c2c:	00001c28 	.word	0x00001c28
c0de9c30:	00002cec 	.word	0x00002cec
c0de9c34:	ffffed25 	.word	0xffffed25

c0de9c38 <displayTagValueListModalPage>:
c0de9c38:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de9c3c:	b098      	sub	sp, #96	@ 0x60
c0de9c3e:	4e44      	ldr	r6, [pc, #272]	@ (c0de9d50 <displayTagValueListModalPage+0x118>)
c0de9c40:	4605      	mov	r5, r0
c0de9c42:	f88d 0044 	strb.w	r0, [sp, #68]	@ 0x44
c0de9c46:	2000      	movs	r0, #0
c0de9c48:	4688      	mov	r8, r1
c0de9c4a:	4940      	ldr	r1, [pc, #256]	@ (c0de9d4c <displayTagValueListModalPage+0x114>)
c0de9c4c:	9016      	str	r0, [sp, #88]	@ 0x58
c0de9c4e:	f88d 0050 	strb.w	r0, [sp, #80]	@ 0x50
c0de9c52:	9013      	str	r0, [sp, #76]	@ 0x4c
c0de9c54:	f44f 6010 	mov.w	r0, #2304	@ 0x900
c0de9c58:	eb09 0406 	add.w	r4, r9, r6
c0de9c5c:	f8ad 0048 	strh.w	r0, [sp, #72]	@ 0x48
c0de9c60:	f44f 7081 	mov.w	r0, #258	@ 0x102
c0de9c64:	9115      	str	r1, [sp, #84]	@ 0x54
c0de9c66:	2140      	movs	r1, #64	@ 0x40
c0de9c68:	f894 7030 	ldrb.w	r7, [r4, #48]	@ 0x30
c0de9c6c:	f8ad 0046 	strh.w	r0, [sp, #70]	@ 0x46
c0de9c70:	f88d 7045 	strb.w	r7, [sp, #69]	@ 0x45
c0de9c74:	a801      	add	r0, sp, #4
c0de9c76:	f001 fa61 	bl	c0deb13c <__aeabi_memclr>
c0de9c7a:	2001      	movs	r0, #1
c0de9c7c:	f894 1031 	ldrb.w	r1, [r4, #49]	@ 0x31
c0de9c80:	f894 2033 	ldrb.w	r2, [r4, #51]	@ 0x33
c0de9c84:	f88d 0020 	strb.w	r0, [sp, #32]
c0de9c88:	2004      	movs	r0, #4
c0de9c8a:	42a9      	cmp	r1, r5
c0de9c8c:	f88d 0010 	strb.w	r0, [sp, #16]
c0de9c90:	f88d 2021 	strb.w	r2, [sp, #33]	@ 0x21
c0de9c94:	d91b      	bls.n	c0de9cce <displayTagValueListModalPage+0x96>
c0de9c96:	1c69      	adds	r1, r5, #1
c0de9c98:	eb09 0306 	add.w	r3, r9, r6
c0de9c9c:	ea00 0281 	and.w	r2, r0, r1, lsl #2
c0de9ca0:	b2c9      	uxtb	r1, r1
c0de9ca2:	f103 0450 	add.w	r4, r3, #80	@ 0x50
c0de9ca6:	ea00 0085 	and.w	r0, r0, r5, lsl #2
c0de9caa:	0849      	lsrs	r1, r1, #1
c0de9cac:	5c61      	ldrb	r1, [r4, r1]
c0de9cae:	40d1      	lsrs	r1, r2
c0de9cb0:	f893 2032 	ldrb.w	r2, [r3, #50]	@ 0x32
c0de9cb4:	f001 0107 	and.w	r1, r1, #7
c0de9cb8:	1a52      	subs	r2, r2, r1
c0de9cba:	0869      	lsrs	r1, r5, #1
c0de9cbc:	5c61      	ldrb	r1, [r4, r1]
c0de9cbe:	f883 2032 	strb.w	r2, [r3, #50]	@ 0x32
c0de9cc2:	fa21 f000 	lsr.w	r0, r1, r0
c0de9cc6:	f000 0107 	and.w	r1, r0, #7
c0de9cca:	1a50      	subs	r0, r2, r1
c0de9ccc:	e00d      	b.n	c0de9cea <displayTagValueListModalPage+0xb2>
c0de9cce:	eb09 0206 	add.w	r2, r9, r6
c0de9cd2:	ea00 0085 	and.w	r0, r0, r5, lsl #2
c0de9cd6:	eb02 0155 	add.w	r1, r2, r5, lsr #1
c0de9cda:	f891 1050 	ldrb.w	r1, [r1, #80]	@ 0x50
c0de9cde:	fa21 f000 	lsr.w	r0, r1, r0
c0de9ce2:	f000 0107 	and.w	r1, r0, #7
c0de9ce6:	f892 0032 	ldrb.w	r0, [r2, #50]	@ 0x32
c0de9cea:	4b1a      	ldr	r3, [pc, #104]	@ (c0de9d54 <displayTagValueListModalPage+0x11c>)
c0de9cec:	eb09 0206 	add.w	r2, r9, r6
c0de9cf0:	2f01      	cmp	r7, #1
c0de9cf2:	f882 5031 	strb.w	r5, [r2, #49]	@ 0x31
c0de9cf6:	444b      	add	r3, r9
c0de9cf8:	6b9b      	ldr	r3, [r3, #56]	@ 0x38
c0de9cfa:	681b      	ldr	r3, [r3, #0]
c0de9cfc:	f88d 101c 	strb.w	r1, [sp, #28]
c0de9d00:	4401      	add	r1, r0
c0de9d02:	b2c0      	uxtb	r0, r0
c0de9d04:	f882 1032 	strb.w	r1, [r2, #50]	@ 0x32
c0de9d08:	eb03 1000 	add.w	r0, r3, r0, lsl #4
c0de9d0c:	9005      	str	r0, [sp, #20]
c0de9d0e:	d102      	bne.n	c0de9d16 <displayTagValueListModalPage+0xde>
c0de9d10:	4811      	ldr	r0, [pc, #68]	@ (c0de9d58 <displayTagValueListModalPage+0x120>)
c0de9d12:	4478      	add	r0, pc
c0de9d14:	9016      	str	r0, [sp, #88]	@ 0x58
c0de9d16:	eb09 0006 	add.w	r0, r9, r6
c0de9d1a:	6a00      	ldr	r0, [r0, #32]
c0de9d1c:	b108      	cbz	r0, c0de9d22 <displayTagValueListModalPage+0xea>
c0de9d1e:	f7fd fd0c 	bl	c0de773a <nbgl_pageRelease>
c0de9d22:	480e      	ldr	r0, [pc, #56]	@ (c0de9d5c <displayTagValueListModalPage+0x124>)
c0de9d24:	a911      	add	r1, sp, #68	@ 0x44
c0de9d26:	aa01      	add	r2, sp, #4
c0de9d28:	2301      	movs	r3, #1
c0de9d2a:	2501      	movs	r5, #1
c0de9d2c:	4478      	add	r0, pc
c0de9d2e:	f7fd fadb 	bl	c0de72e8 <nbgl_pageDrawGenericContentExt>
c0de9d32:	eb09 0106 	add.w	r1, r9, r6
c0de9d36:	f1b8 0f00 	cmp.w	r8, #0
c0de9d3a:	6208      	str	r0, [r1, #32]
c0de9d3c:	bf18      	it	ne
c0de9d3e:	2502      	movne	r5, #2
c0de9d40:	4628      	mov	r0, r5
c0de9d42:	f000 fdc1 	bl	c0dea8c8 <nbgl_refreshSpecial>
c0de9d46:	b018      	add	sp, #96	@ 0x60
c0de9d48:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de9d4c:	04000101 	.word	0x04000101
c0de9d50:	00001c28 	.word	0x00001c28
c0de9d54:	0000195c 	.word	0x0000195c
c0de9d58:	00002bde 	.word	0x00002bde
c0de9d5c:	ffffec09 	.word	0xffffec09

c0de9d60 <bundleNavReviewChoice>:
c0de9d60:	b120      	cbz	r0, c0de9d6c <bundleNavReviewChoice+0xc>
c0de9d62:	4806      	ldr	r0, [pc, #24]	@ (c0de9d7c <bundleNavReviewChoice+0x1c>)
c0de9d64:	4448      	add	r0, r9
c0de9d66:	6a41      	ldr	r1, [r0, #36]	@ 0x24
c0de9d68:	2001      	movs	r0, #1
c0de9d6a:	4708      	bx	r1
c0de9d6c:	4803      	ldr	r0, [pc, #12]	@ (c0de9d7c <bundleNavReviewChoice+0x1c>)
c0de9d6e:	4448      	add	r0, r9
c0de9d70:	6a00      	ldr	r0, [r0, #32]
c0de9d72:	4903      	ldr	r1, [pc, #12]	@ (c0de9d80 <bundleNavReviewChoice+0x20>)
c0de9d74:	4479      	add	r1, pc
c0de9d76:	f000 b863 	b.w	c0de9e40 <bundleNavReviewAskRejectionConfirmation>
c0de9d7a:	bf00      	nop
c0de9d7c:	00001ca4 	.word	0x00001ca4
c0de9d80:	0000011d 	.word	0x0000011d

c0de9d84 <initWarningTipBox>:
c0de9d84:	4923      	ldr	r1, [pc, #140]	@ (c0de9e14 <initWarningTipBox+0x90>)
c0de9d86:	eb09 0201 	add.w	r2, r9, r1
c0de9d8a:	6d92      	ldr	r2, [r2, #88]	@ 0x58
c0de9d8c:	b15a      	cbz	r2, c0de9da6 <initWarningTipBox+0x22>
c0de9d8e:	6812      	ldr	r2, [r2, #0]
c0de9d90:	07d3      	lsls	r3, r2, #31
c0de9d92:	d111      	bne.n	c0de9db8 <initWarningTipBox+0x34>
c0de9d94:	0753      	lsls	r3, r2, #29
c0de9d96:	d415      	bmi.n	c0de9dc4 <initWarningTipBox+0x40>
c0de9d98:	0793      	lsls	r3, r2, #30
c0de9d9a:	d419      	bmi.n	c0de9dd0 <initWarningTipBox+0x4c>
c0de9d9c:	f002 0310 	and.w	r3, r2, #16
c0de9da0:	0712      	lsls	r2, r2, #28
c0de9da2:	d42c      	bmi.n	c0de9dfe <initWarningTipBox+0x7a>
c0de9da4:	bb9b      	cbnz	r3, c0de9e0e <initWarningTipBox+0x8a>
c0de9da6:	b348      	cbz	r0, c0de9dfc <initWarningTipBox+0x78>
c0de9da8:	491b      	ldr	r1, [pc, #108]	@ (c0de9e18 <initWarningTipBox+0x94>)
c0de9daa:	2200      	movs	r2, #0
c0de9dac:	4449      	add	r1, r9
c0de9dae:	620a      	str	r2, [r1, #32]
c0de9db0:	6842      	ldr	r2, [r0, #4]
c0de9db2:	62ca      	str	r2, [r1, #44]	@ 0x2c
c0de9db4:	6800      	ldr	r0, [r0, #0]
c0de9db6:	e01b      	b.n	c0de9df0 <initWarningTipBox+0x6c>
c0de9db8:	06d0      	lsls	r0, r2, #27
c0de9dba:	4a18      	ldr	r2, [pc, #96]	@ (c0de9e1c <initWarningTipBox+0x98>)
c0de9dbc:	4818      	ldr	r0, [pc, #96]	@ (c0de9e20 <initWarningTipBox+0x9c>)
c0de9dbe:	447a      	add	r2, pc
c0de9dc0:	4478      	add	r0, pc
c0de9dc2:	e00a      	b.n	c0de9dda <initWarningTipBox+0x56>
c0de9dc4:	06d0      	lsls	r0, r2, #27
c0de9dc6:	4a17      	ldr	r2, [pc, #92]	@ (c0de9e24 <initWarningTipBox+0xa0>)
c0de9dc8:	4817      	ldr	r0, [pc, #92]	@ (c0de9e28 <initWarningTipBox+0xa4>)
c0de9dca:	447a      	add	r2, pc
c0de9dcc:	4478      	add	r0, pc
c0de9dce:	e004      	b.n	c0de9dda <initWarningTipBox+0x56>
c0de9dd0:	06d0      	lsls	r0, r2, #27
c0de9dd2:	4a16      	ldr	r2, [pc, #88]	@ (c0de9e2c <initWarningTipBox+0xa8>)
c0de9dd4:	4816      	ldr	r0, [pc, #88]	@ (c0de9e30 <initWarningTipBox+0xac>)
c0de9dd6:	447a      	add	r2, pc
c0de9dd8:	4478      	add	r0, pc
c0de9dda:	bf58      	it	pl
c0de9ddc:	4610      	movpl	r0, r2
c0de9dde:	4449      	add	r1, r9
c0de9de0:	2201      	movs	r2, #1
c0de9de2:	f881 2021 	strb.w	r2, [r1, #33]	@ 0x21
c0de9de6:	490c      	ldr	r1, [pc, #48]	@ (c0de9e18 <initWarningTipBox+0x94>)
c0de9de8:	2200      	movs	r2, #0
c0de9dea:	4449      	add	r1, r9
c0de9dec:	620a      	str	r2, [r1, #32]
c0de9dee:	62ca      	str	r2, [r1, #44]	@ 0x2c
c0de9df0:	4909      	ldr	r1, [pc, #36]	@ (c0de9e18 <initWarningTipBox+0x94>)
c0de9df2:	f640 1212 	movw	r2, #2322	@ 0x912
c0de9df6:	4449      	add	r1, r9
c0de9df8:	860a      	strh	r2, [r1, #48]	@ 0x30
c0de9dfa:	6288      	str	r0, [r1, #40]	@ 0x28
c0de9dfc:	4770      	bx	lr
c0de9dfe:	4a0d      	ldr	r2, [pc, #52]	@ (c0de9e34 <initWarningTipBox+0xb0>)
c0de9e00:	480d      	ldr	r0, [pc, #52]	@ (c0de9e38 <initWarningTipBox+0xb4>)
c0de9e02:	2b00      	cmp	r3, #0
c0de9e04:	4478      	add	r0, pc
c0de9e06:	447a      	add	r2, pc
c0de9e08:	bf08      	it	eq
c0de9e0a:	4610      	moveq	r0, r2
c0de9e0c:	e7e7      	b.n	c0de9dde <initWarningTipBox+0x5a>
c0de9e0e:	480b      	ldr	r0, [pc, #44]	@ (c0de9e3c <initWarningTipBox+0xb8>)
c0de9e10:	4478      	add	r0, pc
c0de9e12:	e7e4      	b.n	c0de9dde <initWarningTipBox+0x5a>
c0de9e14:	0000195c 	.word	0x0000195c
c0de9e18:	000019c8 	.word	0x000019c8
c0de9e1c:	000028bc 	.word	0x000028bc
c0de9e20:	000029a2 	.word	0x000029a2
c0de9e24:	00003060 	.word	0x00003060
c0de9e28:	0000292b 	.word	0x0000292b
c0de9e2c:	0000309b 	.word	0x0000309b
c0de9e30:	00002e07 	.word	0x00002e07
c0de9e34:	00002e0a 	.word	0x00002e0a
c0de9e38:	00003086 	.word	0x00003086
c0de9e3c:	00002cc5 	.word	0x00002cc5

c0de9e40 <bundleNavReviewAskRejectionConfirmation>:
c0de9e40:	f020 00f0 	bic.w	r0, r0, #240	@ 0xf0
c0de9e44:	b130      	cbz	r0, c0de9e54 <bundleNavReviewAskRejectionConfirmation+0x14>
c0de9e46:	2801      	cmp	r0, #1
c0de9e48:	d109      	bne.n	c0de9e5e <bundleNavReviewAskRejectionConfirmation+0x1e>
c0de9e4a:	4b0d      	ldr	r3, [pc, #52]	@ (c0de9e80 <bundleNavReviewAskRejectionConfirmation+0x40>)
c0de9e4c:	480d      	ldr	r0, [pc, #52]	@ (c0de9e84 <bundleNavReviewAskRejectionConfirmation+0x44>)
c0de9e4e:	447b      	add	r3, pc
c0de9e50:	4478      	add	r0, pc
c0de9e52:	e008      	b.n	c0de9e66 <bundleNavReviewAskRejectionConfirmation+0x26>
c0de9e54:	4b08      	ldr	r3, [pc, #32]	@ (c0de9e78 <bundleNavReviewAskRejectionConfirmation+0x38>)
c0de9e56:	4809      	ldr	r0, [pc, #36]	@ (c0de9e7c <bundleNavReviewAskRejectionConfirmation+0x3c>)
c0de9e58:	447b      	add	r3, pc
c0de9e5a:	4478      	add	r0, pc
c0de9e5c:	e003      	b.n	c0de9e66 <bundleNavReviewAskRejectionConfirmation+0x26>
c0de9e5e:	4b0a      	ldr	r3, [pc, #40]	@ (c0de9e88 <bundleNavReviewAskRejectionConfirmation+0x48>)
c0de9e60:	480a      	ldr	r0, [pc, #40]	@ (c0de9e8c <bundleNavReviewAskRejectionConfirmation+0x4c>)
c0de9e62:	447b      	add	r3, pc
c0de9e64:	4478      	add	r0, pc
c0de9e66:	b5e0      	push	{r5, r6, r7, lr}
c0de9e68:	9100      	str	r1, [sp, #0]
c0de9e6a:	2100      	movs	r1, #0
c0de9e6c:	4a08      	ldr	r2, [pc, #32]	@ (c0de9e90 <bundleNavReviewAskRejectionConfirmation+0x50>)
c0de9e6e:	447a      	add	r2, pc
c0de9e70:	f7fe fd38 	bl	c0de88e4 <nbgl_useCaseConfirm>
c0de9e74:	bd8c      	pop	{r2, r3, r7, pc}
c0de9e76:	bf00      	nop
c0de9e78:	00002a56 	.word	0x00002a56
c0de9e7c:	00002889 	.word	0x00002889
c0de9e80:	00002d7e 	.word	0x00002d7e
c0de9e84:	00003159 	.word	0x00003159
c0de9e88:	000028eb 	.word	0x000028eb
c0de9e8c:	00002dfa 	.word	0x00002dfa
c0de9e90:	00002bd5 	.word	0x00002bd5

c0de9e94 <bundleNavReviewConfirmRejection>:
c0de9e94:	4801      	ldr	r0, [pc, #4]	@ (c0de9e9c <bundleNavReviewConfirmRejection+0x8>)
c0de9e96:	f000 b881 	b.w	c0de9f9c <OUTLINED_FUNCTION_9>
c0de9e9a:	bf00      	nop
c0de9e9c:	00001ca4 	.word	0x00001ca4

c0de9ea0 <layoutTouchCallback>:
c0de9ea0:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de9ea2:	b087      	sub	sp, #28
c0de9ea4:	2811      	cmp	r0, #17
c0de9ea6:	d017      	beq.n	c0de9ed8 <layoutTouchCallback+0x38>
c0de9ea8:	2814      	cmp	r0, #20
c0de9eaa:	d142      	bne.n	c0de9f32 <layoutTouchCallback+0x92>
c0de9eac:	b1e9      	cbz	r1, c0de9eea <layoutTouchCallback+0x4a>
c0de9eae:	4922      	ldr	r1, [pc, #136]	@ (c0de9f38 <layoutTouchCallback+0x98>)
c0de9eb0:	2400      	movs	r4, #0
c0de9eb2:	eb09 0201 	add.w	r2, r9, r1
c0de9eb6:	eb09 0501 	add.w	r5, r9, r1
c0de9eba:	f882 4069 	strb.w	r4, [r2, #105]	@ 0x69
c0de9ebe:	6c10      	ldr	r0, [r2, #64]	@ 0x40
c0de9ec0:	f892 203c 	ldrb.w	r2, [r2, #60]	@ 0x3c
c0de9ec4:	b33a      	cbz	r2, c0de9f16 <layoutTouchCallback+0x76>
c0de9ec6:	f105 0348 	add.w	r3, r5, #72	@ 0x48
c0de9eca:	6ded      	ldr	r5, [r5, #92]	@ 0x5c
c0de9ecc:	cb0e      	ldmia	r3, {r1, r2, r3}
c0de9ece:	e9cd 5400 	strd	r5, r4, [sp]
c0de9ed2:	f7fe fff5 	bl	c0de8ec0 <useCaseReviewStreamingStart>
c0de9ed6:	e02c      	b.n	c0de9f32 <layoutTouchCallback+0x92>
c0de9ed8:	4a17      	ldr	r2, [pc, #92]	@ (c0de9f38 <layoutTouchCallback+0x98>)
c0de9eda:	f000 f84a 	bl	c0de9f72 <OUTLINED_FUNCTION_4>
c0de9ede:	d00c      	beq.n	c0de9efa <layoutTouchCallback+0x5a>
c0de9ee0:	b007      	add	sp, #28
c0de9ee2:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de9ee6:	f7ff bbb7 	b.w	c0de9658 <displaySecurityReport>
c0de9eea:	4813      	ldr	r0, [pc, #76]	@ (c0de9f38 <layoutTouchCallback+0x98>)
c0de9eec:	4448      	add	r0, r9
c0de9eee:	6dc1      	ldr	r1, [r0, #92]	@ 0x5c
c0de9ef0:	2000      	movs	r0, #0
c0de9ef2:	b007      	add	sp, #28
c0de9ef4:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de9ef8:	4708      	bx	r1
c0de9efa:	eb09 0002 	add.w	r0, r9, r2
c0de9efe:	2214      	movs	r2, #20
c0de9f00:	f890 0069 	ldrb.w	r0, [r0, #105]	@ 0x69
c0de9f04:	2800      	cmp	r0, #0
c0de9f06:	bf08      	it	eq
c0de9f08:	2218      	moveq	r2, #24
c0de9f0a:	5888      	ldr	r0, [r1, r2]
c0de9f0c:	b007      	add	sp, #28
c0de9f0e:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de9f12:	f7ff bcab 	b.w	c0de986c <displayCustomizedSecurityReport>
c0de9f16:	f105 0744 	add.w	r7, r5, #68	@ 0x44
c0de9f1a:	6ded      	ldr	r5, [r5, #92]	@ 0x5c
c0de9f1c:	cfce      	ldmia	r7, {r1, r2, r3, r6, r7}
c0de9f1e:	9405      	str	r4, [sp, #20]
c0de9f20:	e9cd 6700 	strd	r6, r7, [sp]
c0de9f24:	e9cd 5403 	strd	r5, r4, [sp, #12]
c0de9f28:	4c04      	ldr	r4, [pc, #16]	@ (c0de9f3c <layoutTouchCallback+0x9c>)
c0de9f2a:	444c      	add	r4, r9
c0de9f2c:	9402      	str	r4, [sp, #8]
c0de9f2e:	f7fe fddf 	bl	c0de8af0 <useCaseReview>
c0de9f32:	b007      	add	sp, #28
c0de9f34:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de9f36:	bf00      	nop
c0de9f38:	0000195c 	.word	0x0000195c
c0de9f3c:	00001ca4 	.word	0x00001ca4

c0de9f40 <bundleNavReviewStreamingConfirmRejection>:
c0de9f40:	4801      	ldr	r0, [pc, #4]	@ (c0de9f48 <bundleNavReviewStreamingConfirmRejection+0x8>)
c0de9f42:	f000 b82b 	b.w	c0de9f9c <OUTLINED_FUNCTION_9>
c0de9f46:	bf00      	nop
c0de9f48:	00001ca4 	.word	0x00001ca4

c0de9f4c <OUTLINED_FUNCTION_0>:
c0de9f4c:	4615      	mov	r5, r2
c0de9f4e:	460e      	mov	r6, r1
c0de9f50:	4607      	mov	r7, r0
c0de9f52:	f7fd be0d 	b.w	c0de7b70 <reset_callbacks_and_context>

c0de9f56 <OUTLINED_FUNCTION_1>:
c0de9f56:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de9f5a:	eb00 0086 	add.w	r0, r0, r6, lsl #2
c0de9f5e:	f000 becb 	b.w	c0deacf8 <pic>

c0de9f62 <OUTLINED_FUNCTION_2>:
c0de9f62:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de9f66:	2301      	movs	r3, #1
c0de9f68:	f000 bcfe 	b.w	c0dea968 <nbgl_getTextHeightInWidth>

c0de9f6c <OUTLINED_FUNCTION_3>:
c0de9f6c:	2001      	movs	r0, #1
c0de9f6e:	f000 bcab 	b.w	c0dea8c8 <nbgl_refreshSpecial>

c0de9f72 <OUTLINED_FUNCTION_4>:
c0de9f72:	2101      	movs	r1, #1
c0de9f74:	eb09 0002 	add.w	r0, r9, r2
c0de9f78:	f880 1068 	strb.w	r1, [r0, #104]	@ 0x68
c0de9f7c:	6d81      	ldr	r1, [r0, #88]	@ 0x58
c0de9f7e:	6808      	ldr	r0, [r1, #0]
c0de9f80:	2800      	cmp	r0, #0
c0de9f82:	4770      	bx	lr

c0de9f84 <OUTLINED_FUNCTION_5>:
c0de9f84:	2000      	movs	r0, #0
c0de9f86:	f7fd bed1 	b.w	c0de7d2c <getNbPagesForGenericContents>

c0de9f8a <OUTLINED_FUNCTION_6>:
c0de9f8a:	2008      	movs	r0, #8
c0de9f8c:	f7f8 be9b 	b.w	c0de2cc6 <os_io_seph_cmd_piezo_play_tune>

c0de9f90 <OUTLINED_FUNCTION_7>:
c0de9f90:	9001      	str	r0, [sp, #4]
c0de9f92:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de9f94:	9000      	str	r0, [sp, #0]
c0de9f96:	4638      	mov	r0, r7
c0de9f98:	f7fe bdaa 	b.w	c0de8af0 <useCaseReview>

c0de9f9c <OUTLINED_FUNCTION_9>:
c0de9f9c:	4448      	add	r0, r9
c0de9f9e:	6a41      	ldr	r1, [r0, #36]	@ 0x24
c0de9fa0:	2000      	movs	r0, #0
c0de9fa2:	4708      	bx	r1

c0de9fa4 <OUTLINED_FUNCTION_11>:
c0de9fa4:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de9fa8:	2300      	movs	r3, #0
c0de9faa:	f000 bce2 	b.w	c0dea972 <nbgl_getTextNbLinesInWidth>

c0de9fae <OUTLINED_FUNCTION_12>:
c0de9fae:	200b      	movs	r0, #11
c0de9fb0:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de9fb4:	f000 bcd8 	b.w	c0dea968 <nbgl_getTextHeightInWidth>

c0de9fb8 <OUTLINED_FUNCTION_13>:
c0de9fb8:	4630      	mov	r0, r6
c0de9fba:	f001 b8bf 	b.w	c0deb13c <__aeabi_memclr>

c0de9fbe <OUTLINED_FUNCTION_14>:
c0de9fbe:	f10a 0004 	add.w	r0, sl, #4
c0de9fc2:	f107 0110 	add.w	r1, r7, #16
c0de9fc6:	4770      	bx	lr

c0de9fc8 <bip32_path_read>:
c0de9fc8:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de9fcc:	b10b      	cbz	r3, c0de9fd2 <bip32_path_read+0xa>
c0de9fce:	2b0a      	cmp	r3, #10
c0de9fd0:	d902      	bls.n	c0de9fd8 <bip32_path_read+0x10>
c0de9fd2:	2000      	movs	r0, #0
c0de9fd4:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de9fd8:	4692      	mov	sl, r2
c0de9fda:	460e      	mov	r6, r1
c0de9fdc:	4683      	mov	fp, r0
c0de9fde:	425f      	negs	r7, r3
c0de9fe0:	2500      	movs	r5, #0
c0de9fe2:	f04f 0800 	mov.w	r8, #0
c0de9fe6:	9301      	str	r3, [sp, #4]
c0de9fe8:	42af      	cmp	r7, r5
c0de9fea:	d00c      	beq.n	c0dea006 <bip32_path_read+0x3e>
c0de9fec:	f108 0404 	add.w	r4, r8, #4
c0de9ff0:	42b4      	cmp	r4, r6
c0de9ff2:	d808      	bhi.n	c0dea006 <bip32_path_read+0x3e>
c0de9ff4:	4658      	mov	r0, fp
c0de9ff6:	4641      	mov	r1, r8
c0de9ff8:	f000 faee 	bl	c0dea5d8 <read_u32_be>
c0de9ffc:	f84a 0008 	str.w	r0, [sl, r8]
c0dea000:	3d01      	subs	r5, #1
c0dea002:	46a0      	mov	r8, r4
c0dea004:	e7f0      	b.n	c0de9fe8 <bip32_path_read+0x20>
c0dea006:	9a01      	ldr	r2, [sp, #4]
c0dea008:	4269      	negs	r1, r5
c0dea00a:	2000      	movs	r0, #0
c0dea00c:	4291      	cmp	r1, r2
c0dea00e:	bf28      	it	cs
c0dea010:	2001      	movcs	r0, #1
c0dea012:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0dea016 <buffer_seek_cur>:
c0dea016:	6882      	ldr	r2, [r0, #8]
c0dea018:	1889      	adds	r1, r1, r2
c0dea01a:	d205      	bcs.n	c0dea028 <buffer_seek_cur+0x12>
c0dea01c:	6842      	ldr	r2, [r0, #4]
c0dea01e:	4291      	cmp	r1, r2
c0dea020:	bf9e      	ittt	ls
c0dea022:	6081      	strls	r1, [r0, #8]
c0dea024:	2001      	movls	r0, #1
c0dea026:	4770      	bxls	lr
c0dea028:	2000      	movs	r0, #0
c0dea02a:	4770      	bx	lr

c0dea02c <buffer_read_u8>:
c0dea02c:	b510      	push	{r4, lr}
c0dea02e:	e9d0 2301 	ldrd	r2, r3, [r0, #4]
c0dea032:	429a      	cmp	r2, r3
c0dea034:	d00a      	beq.n	c0dea04c <buffer_read_u8+0x20>
c0dea036:	6804      	ldr	r4, [r0, #0]
c0dea038:	5ce4      	ldrb	r4, [r4, r3]
c0dea03a:	700c      	strb	r4, [r1, #0]
c0dea03c:	6881      	ldr	r1, [r0, #8]
c0dea03e:	3101      	adds	r1, #1
c0dea040:	d206      	bcs.n	c0dea050 <buffer_read_u8+0x24>
c0dea042:	6844      	ldr	r4, [r0, #4]
c0dea044:	42a1      	cmp	r1, r4
c0dea046:	bf98      	it	ls
c0dea048:	6081      	strls	r1, [r0, #8]
c0dea04a:	e001      	b.n	c0dea050 <buffer_read_u8+0x24>
c0dea04c:	2000      	movs	r0, #0
c0dea04e:	7008      	strb	r0, [r1, #0]
c0dea050:	1ad0      	subs	r0, r2, r3
c0dea052:	bf18      	it	ne
c0dea054:	2001      	movne	r0, #1
c0dea056:	bd10      	pop	{r4, pc}

c0dea058 <buffer_read_u64>:
c0dea058:	b570      	push	{r4, r5, r6, lr}
c0dea05a:	f000 f87d 	bl	c0dea158 <OUTLINED_FUNCTION_0>
c0dea05e:	2e07      	cmp	r6, #7
c0dea060:	d904      	bls.n	c0dea06c <buffer_read_u64+0x14>
c0dea062:	6820      	ldr	r0, [r4, #0]
c0dea064:	b132      	cbz	r2, c0dea074 <buffer_read_u64+0x1c>
c0dea066:	f000 faee 	bl	c0dea646 <read_u64_le>
c0dea06a:	e005      	b.n	c0dea078 <buffer_read_u64+0x20>
c0dea06c:	2000      	movs	r0, #0
c0dea06e:	e9c5 0000 	strd	r0, r0, [r5]
c0dea072:	e00c      	b.n	c0dea08e <buffer_read_u64+0x36>
c0dea074:	f000 fabc 	bl	c0dea5f0 <read_u64_be>
c0dea078:	e9c5 0100 	strd	r0, r1, [r5]
c0dea07c:	68a0      	ldr	r0, [r4, #8]
c0dea07e:	f110 0f09 	cmn.w	r0, #9
c0dea082:	d804      	bhi.n	c0dea08e <buffer_read_u64+0x36>
c0dea084:	6861      	ldr	r1, [r4, #4]
c0dea086:	3008      	adds	r0, #8
c0dea088:	4288      	cmp	r0, r1
c0dea08a:	bf98      	it	ls
c0dea08c:	60a0      	strls	r0, [r4, #8]
c0dea08e:	2000      	movs	r0, #0
c0dea090:	2e07      	cmp	r6, #7
c0dea092:	bf88      	it	hi
c0dea094:	2001      	movhi	r0, #1
c0dea096:	bd70      	pop	{r4, r5, r6, pc}

c0dea098 <buffer_read_varint>:
c0dea098:	b5b0      	push	{r4, r5, r7, lr}
c0dea09a:	4604      	mov	r4, r0
c0dea09c:	460d      	mov	r5, r1
c0dea09e:	6800      	ldr	r0, [r0, #0]
c0dea0a0:	e9d4 1201 	ldrd	r1, r2, [r4, #4]
c0dea0a4:	4410      	add	r0, r2
c0dea0a6:	1a89      	subs	r1, r1, r2
c0dea0a8:	462a      	mov	r2, r5
c0dea0aa:	f000 fae3 	bl	c0dea674 <varint_read>
c0dea0ae:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0dea0b2:	dd0a      	ble.n	c0dea0ca <buffer_read_varint+0x32>
c0dea0b4:	68a1      	ldr	r1, [r4, #8]
c0dea0b6:	1840      	adds	r0, r0, r1
c0dea0b8:	d205      	bcs.n	c0dea0c6 <buffer_read_varint+0x2e>
c0dea0ba:	6861      	ldr	r1, [r4, #4]
c0dea0bc:	4288      	cmp	r0, r1
c0dea0be:	bf9e      	ittt	ls
c0dea0c0:	60a0      	strls	r0, [r4, #8]
c0dea0c2:	2001      	movls	r0, #1
c0dea0c4:	bdb0      	popls	{r4, r5, r7, pc}
c0dea0c6:	2000      	movs	r0, #0
c0dea0c8:	bdb0      	pop	{r4, r5, r7, pc}
c0dea0ca:	2000      	movs	r0, #0
c0dea0cc:	e9c5 0000 	strd	r0, r0, [r5]
c0dea0d0:	bdb0      	pop	{r4, r5, r7, pc}

c0dea0d2 <buffer_read_bip32_path>:
c0dea0d2:	b5b0      	push	{r4, r5, r7, lr}
c0dea0d4:	4604      	mov	r4, r0
c0dea0d6:	4615      	mov	r5, r2
c0dea0d8:	460a      	mov	r2, r1
c0dea0da:	6800      	ldr	r0, [r0, #0]
c0dea0dc:	e9d4 1301 	ldrd	r1, r3, [r4, #4]
c0dea0e0:	4418      	add	r0, r3
c0dea0e2:	1ac9      	subs	r1, r1, r3
c0dea0e4:	462b      	mov	r3, r5
c0dea0e6:	f7ff ff6f 	bl	c0de9fc8 <bip32_path_read>
c0dea0ea:	b140      	cbz	r0, c0dea0fe <buffer_read_bip32_path+0x2c>
c0dea0ec:	68a2      	ldr	r2, [r4, #8]
c0dea0ee:	eb02 0185 	add.w	r1, r2, r5, lsl #2
c0dea0f2:	4291      	cmp	r1, r2
c0dea0f4:	d303      	bcc.n	c0dea0fe <buffer_read_bip32_path+0x2c>
c0dea0f6:	6862      	ldr	r2, [r4, #4]
c0dea0f8:	4291      	cmp	r1, r2
c0dea0fa:	bf98      	it	ls
c0dea0fc:	60a1      	strls	r1, [r4, #8]
c0dea0fe:	bdb0      	pop	{r4, r5, r7, pc}

c0dea100 <buffer_copy>:
c0dea100:	b5b0      	push	{r4, r5, r7, lr}
c0dea102:	4614      	mov	r4, r2
c0dea104:	e9d0 3201 	ldrd	r3, r2, [r0, #4]
c0dea108:	1a9d      	subs	r5, r3, r2
c0dea10a:	42a5      	cmp	r5, r4
c0dea10c:	d806      	bhi.n	c0dea11c <buffer_copy+0x1c>
c0dea10e:	6800      	ldr	r0, [r0, #0]
c0dea110:	4402      	add	r2, r0
c0dea112:	4608      	mov	r0, r1
c0dea114:	4611      	mov	r1, r2
c0dea116:	462a      	mov	r2, r5
c0dea118:	f001 f808 	bl	c0deb12c <__aeabi_memmove>
c0dea11c:	2000      	movs	r0, #0
c0dea11e:	42a5      	cmp	r5, r4
c0dea120:	bf98      	it	ls
c0dea122:	2001      	movls	r0, #1
c0dea124:	bdb0      	pop	{r4, r5, r7, pc}

c0dea126 <buffer_move>:
c0dea126:	b5b0      	push	{r4, r5, r7, lr}
c0dea128:	4615      	mov	r5, r2
c0dea12a:	4604      	mov	r4, r0
c0dea12c:	e9d0 2001 	ldrd	r2, r0, [r0, #4]
c0dea130:	1a12      	subs	r2, r2, r0
c0dea132:	42aa      	cmp	r2, r5
c0dea134:	bf84      	itt	hi
c0dea136:	2000      	movhi	r0, #0
c0dea138:	bdb0      	pophi	{r4, r5, r7, pc}
c0dea13a:	6823      	ldr	r3, [r4, #0]
c0dea13c:	4403      	add	r3, r0
c0dea13e:	4608      	mov	r0, r1
c0dea140:	4619      	mov	r1, r3
c0dea142:	f000 fff3 	bl	c0deb12c <__aeabi_memmove>
c0dea146:	68a0      	ldr	r0, [r4, #8]
c0dea148:	1940      	adds	r0, r0, r5
c0dea14a:	d203      	bcs.n	c0dea154 <buffer_move+0x2e>
c0dea14c:	6861      	ldr	r1, [r4, #4]
c0dea14e:	4288      	cmp	r0, r1
c0dea150:	bf98      	it	ls
c0dea152:	60a0      	strls	r0, [r4, #8]
c0dea154:	2001      	movs	r0, #1
c0dea156:	bdb0      	pop	{r4, r5, r7, pc}

c0dea158 <OUTLINED_FUNCTION_0>:
c0dea158:	4604      	mov	r4, r0
c0dea15a:	460d      	mov	r5, r1
c0dea15c:	6840      	ldr	r0, [r0, #4]
c0dea15e:	68a1      	ldr	r1, [r4, #8]
c0dea160:	1a46      	subs	r6, r0, r1
c0dea162:	4770      	bx	lr

c0dea164 <bip32_derive_with_seed_init_privkey_256>:
c0dea164:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0dea168:	b095      	sub	sp, #84	@ 0x54
c0dea16a:	460d      	mov	r5, r1
c0dea16c:	4607      	mov	r7, r0
c0dea16e:	a904      	add	r1, sp, #16
c0dea170:	469a      	mov	sl, r3
c0dea172:	4614      	mov	r4, r2
c0dea174:	4628      	mov	r0, r5
c0dea176:	f000 fe03 	bl	c0dead80 <cx_ecdomain_parameters_length>
c0dea17a:	f8dd 8070 	ldr.w	r8, [sp, #112]	@ 0x70
c0dea17e:	4606      	mov	r6, r0
c0dea180:	b9e0      	cbnz	r0, c0dea1bc <bip32_derive_with_seed_init_privkey_256+0x58>
c0dea182:	9804      	ldr	r0, [sp, #16]
c0dea184:	2820      	cmp	r0, #32
c0dea186:	d117      	bne.n	c0dea1b8 <bip32_derive_with_seed_init_privkey_256+0x54>
c0dea188:	981f      	ldr	r0, [sp, #124]	@ 0x7c
c0dea18a:	e9dd 211d 	ldrd	r2, r1, [sp, #116]	@ 0x74
c0dea18e:	ab05      	add	r3, sp, #20
c0dea190:	e9cd 3200 	strd	r3, r2, [sp]
c0dea194:	e9cd 1002 	strd	r1, r0, [sp, #8]
c0dea198:	4638      	mov	r0, r7
c0dea19a:	4629      	mov	r1, r5
c0dea19c:	4622      	mov	r2, r4
c0dea19e:	4653      	mov	r3, sl
c0dea1a0:	f000 f818 	bl	c0dea1d4 <os_derive_bip32_with_seed_no_throw>
c0dea1a4:	4606      	mov	r6, r0
c0dea1a6:	b948      	cbnz	r0, c0dea1bc <bip32_derive_with_seed_init_privkey_256+0x58>
c0dea1a8:	9a04      	ldr	r2, [sp, #16]
c0dea1aa:	a905      	add	r1, sp, #20
c0dea1ac:	4628      	mov	r0, r5
c0dea1ae:	4643      	mov	r3, r8
c0dea1b0:	f000 fb61 	bl	c0dea876 <cx_ecfp_init_private_key_no_throw>
c0dea1b4:	4606      	mov	r6, r0
c0dea1b6:	e001      	b.n	c0dea1bc <bip32_derive_with_seed_init_privkey_256+0x58>
c0dea1b8:	f06f 065c 	mvn.w	r6, #92	@ 0x5c
c0dea1bc:	a805      	add	r0, sp, #20
c0dea1be:	2140      	movs	r1, #64	@ 0x40
c0dea1c0:	f000 ffca 	bl	c0deb158 <explicit_bzero>
c0dea1c4:	b116      	cbz	r6, c0dea1cc <bip32_derive_with_seed_init_privkey_256+0x68>
c0dea1c6:	4640      	mov	r0, r8
c0dea1c8:	f000 f89f 	bl	c0dea30a <OUTLINED_FUNCTION_0>
c0dea1cc:	4630      	mov	r0, r6
c0dea1ce:	b015      	add	sp, #84	@ 0x54
c0dea1d0:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}

c0dea1d4 <os_derive_bip32_with_seed_no_throw>:
c0dea1d4:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea1d8:	b090      	sub	sp, #64	@ 0x40
c0dea1da:	f10d 0810 	add.w	r8, sp, #16
c0dea1de:	4607      	mov	r7, r0
c0dea1e0:	469b      	mov	fp, r3
c0dea1e2:	4616      	mov	r6, r2
c0dea1e4:	460c      	mov	r4, r1
c0dea1e6:	4640      	mov	r0, r8
c0dea1e8:	f000 fffc 	bl	c0deb1e4 <setjmp>
c0dea1ec:	b285      	uxth	r5, r0
c0dea1ee:	f8dd a060 	ldr.w	sl, [sp, #96]	@ 0x60
c0dea1f2:	f8ad 003c 	strh.w	r0, [sp, #60]	@ 0x3c
c0dea1f6:	b155      	cbz	r5, c0dea20e <os_derive_bip32_with_seed_no_throw+0x3a>
c0dea1f8:	2000      	movs	r0, #0
c0dea1fa:	f8ad 003c 	strh.w	r0, [sp, #60]	@ 0x3c
c0dea1fe:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0dea200:	f000 fe66 	bl	c0deaed0 <try_context_set>
c0dea204:	2140      	movs	r1, #64	@ 0x40
c0dea206:	4650      	mov	r0, sl
c0dea208:	f000 ffa6 	bl	c0deb158 <explicit_bzero>
c0dea20c:	e012      	b.n	c0dea234 <os_derive_bip32_with_seed_no_throw+0x60>
c0dea20e:	a804      	add	r0, sp, #16
c0dea210:	f000 fe5e 	bl	c0deaed0 <try_context_set>
c0dea214:	9919      	ldr	r1, [sp, #100]	@ 0x64
c0dea216:	900e      	str	r0, [sp, #56]	@ 0x38
c0dea218:	4668      	mov	r0, sp
c0dea21a:	4632      	mov	r2, r6
c0dea21c:	465b      	mov	r3, fp
c0dea21e:	f8c0 a000 	str.w	sl, [r0]
c0dea222:	6041      	str	r1, [r0, #4]
c0dea224:	991a      	ldr	r1, [sp, #104]	@ 0x68
c0dea226:	6081      	str	r1, [r0, #8]
c0dea228:	991b      	ldr	r1, [sp, #108]	@ 0x6c
c0dea22a:	60c1      	str	r1, [r0, #12]
c0dea22c:	4638      	mov	r0, r7
c0dea22e:	4621      	mov	r1, r4
c0dea230:	f000 fdb0 	bl	c0dead94 <os_perso_derive_node_with_seed_key>
c0dea234:	f000 fe44 	bl	c0deaec0 <try_context_get>
c0dea238:	4540      	cmp	r0, r8
c0dea23a:	d102      	bne.n	c0dea242 <os_derive_bip32_with_seed_no_throw+0x6e>
c0dea23c:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0dea23e:	f000 fe47 	bl	c0deaed0 <try_context_set>
c0dea242:	f8bd 003c 	ldrh.w	r0, [sp, #60]	@ 0x3c
c0dea246:	b918      	cbnz	r0, c0dea250 <os_derive_bip32_with_seed_no_throw+0x7c>
c0dea248:	4628      	mov	r0, r5
c0dea24a:	b010      	add	sp, #64	@ 0x40
c0dea24c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0dea250:	f000 fbb9 	bl	c0dea9c6 <os_longjmp>

c0dea254 <bip32_derive_with_seed_get_pubkey_256>:
c0dea254:	b5f0      	push	{r4, r5, r6, r7, lr}
c0dea256:	b0a1      	sub	sp, #132	@ 0x84
c0dea258:	460e      	mov	r6, r1
c0dea25a:	992a      	ldr	r1, [sp, #168]	@ 0xa8
c0dea25c:	9103      	str	r1, [sp, #12]
c0dea25e:	9929      	ldr	r1, [sp, #164]	@ 0xa4
c0dea260:	9102      	str	r1, [sp, #8]
c0dea262:	9927      	ldr	r1, [sp, #156]	@ 0x9c
c0dea264:	9101      	str	r1, [sp, #4]
c0dea266:	a917      	add	r1, sp, #92	@ 0x5c
c0dea268:	9100      	str	r1, [sp, #0]
c0dea26a:	4631      	mov	r1, r6
c0dea26c:	f7ff ff7a 	bl	c0dea164 <bip32_derive_with_seed_init_privkey_256>
c0dea270:	9c26      	ldr	r4, [sp, #152]	@ 0x98
c0dea272:	4605      	mov	r5, r0
c0dea274:	b9b8      	cbnz	r0, c0dea2a6 <bip32_derive_with_seed_get_pubkey_256+0x52>
c0dea276:	9828      	ldr	r0, [sp, #160]	@ 0xa0
c0dea278:	2301      	movs	r3, #1
c0dea27a:	9000      	str	r0, [sp, #0]
c0dea27c:	af04      	add	r7, sp, #16
c0dea27e:	aa17      	add	r2, sp, #92	@ 0x5c
c0dea280:	4630      	mov	r0, r6
c0dea282:	4639      	mov	r1, r7
c0dea284:	f000 faf2 	bl	c0dea86c <cx_ecfp_generate_pair2_no_throw>
c0dea288:	4605      	mov	r5, r0
c0dea28a:	b960      	cbnz	r0, c0dea2a6 <bip32_derive_with_seed_get_pubkey_256+0x52>
c0dea28c:	9805      	ldr	r0, [sp, #20]
c0dea28e:	2841      	cmp	r0, #65	@ 0x41
c0dea290:	d107      	bne.n	c0dea2a2 <bip32_derive_with_seed_get_pubkey_256+0x4e>
c0dea292:	f107 0108 	add.w	r1, r7, #8
c0dea296:	4620      	mov	r0, r4
c0dea298:	2241      	movs	r2, #65	@ 0x41
c0dea29a:	f000 ff45 	bl	c0deb128 <__aeabi_memcpy>
c0dea29e:	2500      	movs	r5, #0
c0dea2a0:	e001      	b.n	c0dea2a6 <bip32_derive_with_seed_get_pubkey_256+0x52>
c0dea2a2:	f06f 055c 	mvn.w	r5, #92	@ 0x5c
c0dea2a6:	a817      	add	r0, sp, #92	@ 0x5c
c0dea2a8:	f000 f82f 	bl	c0dea30a <OUTLINED_FUNCTION_0>
c0dea2ac:	b11d      	cbz	r5, c0dea2b6 <bip32_derive_with_seed_get_pubkey_256+0x62>
c0dea2ae:	4620      	mov	r0, r4
c0dea2b0:	2141      	movs	r1, #65	@ 0x41
c0dea2b2:	f000 ff51 	bl	c0deb158 <explicit_bzero>
c0dea2b6:	4628      	mov	r0, r5
c0dea2b8:	b021      	add	sp, #132	@ 0x84
c0dea2ba:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0dea2bc <bip32_derive_with_seed_ecdsa_sign_hash_256>:
c0dea2bc:	b5f0      	push	{r4, r5, r6, r7, lr}
c0dea2be:	b08f      	sub	sp, #60	@ 0x3c
c0dea2c0:	9f19      	ldr	r7, [sp, #100]	@ 0x64
c0dea2c2:	9d1c      	ldr	r5, [sp, #112]	@ 0x70
c0dea2c4:	683c      	ldr	r4, [r7, #0]
c0dea2c6:	9503      	str	r5, [sp, #12]
c0dea2c8:	9d1b      	ldr	r5, [sp, #108]	@ 0x6c
c0dea2ca:	9502      	str	r5, [sp, #8]
c0dea2cc:	2500      	movs	r5, #0
c0dea2ce:	9501      	str	r5, [sp, #4]
c0dea2d0:	ad05      	add	r5, sp, #20
c0dea2d2:	9500      	str	r5, [sp, #0]
c0dea2d4:	f7ff ff46 	bl	c0dea164 <bip32_derive_with_seed_init_privkey_256>
c0dea2d8:	9d18      	ldr	r5, [sp, #96]	@ 0x60
c0dea2da:	4606      	mov	r6, r0
c0dea2dc:	b950      	cbnz	r0, c0dea2f4 <bip32_derive_with_seed_ecdsa_sign_hash_256+0x38>
c0dea2de:	ae14      	add	r6, sp, #80	@ 0x50
c0dea2e0:	981a      	ldr	r0, [sp, #104]	@ 0x68
c0dea2e2:	ce4e      	ldmia	r6, {r1, r2, r3, r6}
c0dea2e4:	e9cd 6500 	strd	r6, r5, [sp]
c0dea2e8:	e9cd 7002 	strd	r7, r0, [sp, #8]
c0dea2ec:	a805      	add	r0, sp, #20
c0dea2ee:	f000 fab8 	bl	c0dea862 <cx_ecdsa_sign_no_throw>
c0dea2f2:	4606      	mov	r6, r0
c0dea2f4:	a805      	add	r0, sp, #20
c0dea2f6:	f000 f808 	bl	c0dea30a <OUTLINED_FUNCTION_0>
c0dea2fa:	b11e      	cbz	r6, c0dea304 <bip32_derive_with_seed_ecdsa_sign_hash_256+0x48>
c0dea2fc:	4628      	mov	r0, r5
c0dea2fe:	4621      	mov	r1, r4
c0dea300:	f000 ff2a 	bl	c0deb158 <explicit_bzero>
c0dea304:	4630      	mov	r0, r6
c0dea306:	b00f      	add	sp, #60	@ 0x3c
c0dea308:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0dea30a <OUTLINED_FUNCTION_0>:
c0dea30a:	2128      	movs	r1, #40	@ 0x28
c0dea30c:	f000 bf24 	b.w	c0deb158 <explicit_bzero>

c0dea310 <format_u64>:
c0dea310:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0dea314:	b1f9      	cbz	r1, c0dea356 <format_u64+0x46>
c0dea316:	4615      	mov	r5, r2
c0dea318:	4604      	mov	r4, r0
c0dea31a:	f1a1 0801 	sub.w	r8, r1, #1
c0dea31e:	2700      	movs	r7, #0
c0dea320:	2600      	movs	r6, #0
c0dea322:	f1b5 000a 	subs.w	r0, r5, #10
c0dea326:	f173 0000 	sbcs.w	r0, r3, #0
c0dea32a:	d316      	bcc.n	c0dea35a <format_u64+0x4a>
c0dea32c:	4619      	mov	r1, r3
c0dea32e:	4628      	mov	r0, r5
c0dea330:	220a      	movs	r2, #10
c0dea332:	2300      	movs	r3, #0
c0dea334:	f000 ff06 	bl	c0deb144 <__aeabi_uldivmod>
c0dea338:	460b      	mov	r3, r1
c0dea33a:	eb00 0180 	add.w	r1, r0, r0, lsl #2
c0dea33e:	1cba      	adds	r2, r7, #2
c0dea340:	eba5 0141 	sub.w	r1, r5, r1, lsl #1
c0dea344:	4605      	mov	r5, r0
c0dea346:	f041 0130 	orr.w	r1, r1, #48	@ 0x30
c0dea34a:	55e1      	strb	r1, [r4, r7]
c0dea34c:	1c79      	adds	r1, r7, #1
c0dea34e:	4542      	cmp	r2, r8
c0dea350:	460f      	mov	r7, r1
c0dea352:	d9e6      	bls.n	c0dea322 <format_u64+0x12>
c0dea354:	e012      	b.n	c0dea37c <format_u64+0x6c>
c0dea356:	2600      	movs	r6, #0
c0dea358:	e010      	b.n	c0dea37c <format_u64+0x6c>
c0dea35a:	f105 0030 	add.w	r0, r5, #48	@ 0x30
c0dea35e:	19e1      	adds	r1, r4, r7
c0dea360:	55e0      	strb	r0, [r4, r7]
c0dea362:	2000      	movs	r0, #0
c0dea364:	7048      	strb	r0, [r1, #1]
c0dea366:	b2c1      	uxtb	r1, r0
c0dea368:	428f      	cmp	r7, r1
c0dea36a:	d906      	bls.n	c0dea37a <format_u64+0x6a>
c0dea36c:	5c62      	ldrb	r2, [r4, r1]
c0dea36e:	5de3      	ldrb	r3, [r4, r7]
c0dea370:	3001      	adds	r0, #1
c0dea372:	5463      	strb	r3, [r4, r1]
c0dea374:	55e2      	strb	r2, [r4, r7]
c0dea376:	3f01      	subs	r7, #1
c0dea378:	e7f5      	b.n	c0dea366 <format_u64+0x56>
c0dea37a:	2601      	movs	r6, #1
c0dea37c:	4630      	mov	r0, r6
c0dea37e:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0dea382 <format_fpu64>:
c0dea382:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0dea386:	b086      	sub	sp, #24
c0dea388:	466c      	mov	r4, sp
c0dea38a:	4688      	mov	r8, r1
c0dea38c:	4605      	mov	r5, r0
c0dea38e:	2115      	movs	r1, #21
c0dea390:	461e      	mov	r6, r3
c0dea392:	4617      	mov	r7, r2
c0dea394:	4620      	mov	r0, r4
c0dea396:	f000 fed1 	bl	c0deb13c <__aeabi_memclr>
c0dea39a:	4620      	mov	r0, r4
c0dea39c:	2115      	movs	r1, #21
c0dea39e:	463a      	mov	r2, r7
c0dea3a0:	4633      	mov	r3, r6
c0dea3a2:	f7ff ffb5 	bl	c0dea310 <format_u64>
c0dea3a6:	b340      	cbz	r0, c0dea3fa <format_fpu64+0x78>
c0dea3a8:	466f      	mov	r7, sp
c0dea3aa:	9e0c      	ldr	r6, [sp, #48]	@ 0x30
c0dea3ac:	4638      	mov	r0, r7
c0dea3ae:	f000 ff31 	bl	c0deb214 <strlen>
c0dea3b2:	42b0      	cmp	r0, r6
c0dea3b4:	d910      	bls.n	c0dea3d8 <format_fpu64+0x56>
c0dea3b6:	1831      	adds	r1, r6, r0
c0dea3b8:	3101      	adds	r1, #1
c0dea3ba:	4541      	cmp	r1, r8
c0dea3bc:	d21d      	bcs.n	c0dea3fa <format_fpu64+0x78>
c0dea3be:	1b84      	subs	r4, r0, r6
c0dea3c0:	4628      	mov	r0, r5
c0dea3c2:	4639      	mov	r1, r7
c0dea3c4:	4622      	mov	r2, r4
c0dea3c6:	f000 feaf 	bl	c0deb128 <__aeabi_memcpy>
c0dea3ca:	1928      	adds	r0, r5, r4
c0dea3cc:	212e      	movs	r1, #46	@ 0x2e
c0dea3ce:	4632      	mov	r2, r6
c0dea3d0:	f800 1b01 	strb.w	r1, [r0], #1
c0dea3d4:	1939      	adds	r1, r7, r4
c0dea3d6:	e015      	b.n	c0dea404 <format_fpu64+0x82>
c0dea3d8:	1a32      	subs	r2, r6, r0
c0dea3da:	1c91      	adds	r1, r2, #2
c0dea3dc:	4541      	cmp	r1, r8
c0dea3de:	d20c      	bcs.n	c0dea3fa <format_fpu64+0x78>
c0dea3e0:	202e      	movs	r0, #46	@ 0x2e
c0dea3e2:	2330      	movs	r3, #48	@ 0x30
c0dea3e4:	2400      	movs	r4, #0
c0dea3e6:	7068      	strb	r0, [r5, #1]
c0dea3e8:	1ca8      	adds	r0, r5, #2
c0dea3ea:	702b      	strb	r3, [r5, #0]
c0dea3ec:	b2a5      	uxth	r5, r4
c0dea3ee:	42aa      	cmp	r2, r5
c0dea3f0:	d905      	bls.n	c0dea3fe <format_fpu64+0x7c>
c0dea3f2:	f800 3b01 	strb.w	r3, [r0], #1
c0dea3f6:	3401      	adds	r4, #1
c0dea3f8:	e7f8      	b.n	c0dea3ec <format_fpu64+0x6a>
c0dea3fa:	2000      	movs	r0, #0
c0dea3fc:	e005      	b.n	c0dea40a <format_fpu64+0x88>
c0dea3fe:	eba8 0201 	sub.w	r2, r8, r1
c0dea402:	4669      	mov	r1, sp
c0dea404:	f000 ff0e 	bl	c0deb224 <strncpy>
c0dea408:	2001      	movs	r0, #1
c0dea40a:	b006      	add	sp, #24
c0dea40c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0dea410 <format_hex>:
c0dea410:	b5f0      	push	{r4, r5, r6, r7, lr}
c0dea412:	4604      	mov	r4, r0
c0dea414:	0048      	lsls	r0, r1, #1
c0dea416:	f100 0c01 	add.w	ip, r0, #1
c0dea41a:	459c      	cmp	ip, r3
c0dea41c:	d902      	bls.n	c0dea424 <format_hex+0x14>
c0dea41e:	f04f 3cff 	mov.w	ip, #4294967295	@ 0xffffffff
c0dea422:	e018      	b.n	c0dea456 <format_hex+0x46>
c0dea424:	480d      	ldr	r0, [pc, #52]	@ (c0dea45c <format_hex+0x4c>)
c0dea426:	2500      	movs	r5, #0
c0dea428:	4478      	add	r0, pc
c0dea42a:	b191      	cbz	r1, c0dea452 <format_hex+0x42>
c0dea42c:	1cef      	adds	r7, r5, #3
c0dea42e:	429f      	cmp	r7, r3
c0dea430:	d80d      	bhi.n	c0dea44e <format_hex+0x3e>
c0dea432:	7827      	ldrb	r7, [r4, #0]
c0dea434:	3901      	subs	r1, #1
c0dea436:	093f      	lsrs	r7, r7, #4
c0dea438:	5dc7      	ldrb	r7, [r0, r7]
c0dea43a:	5557      	strb	r7, [r2, r5]
c0dea43c:	1957      	adds	r7, r2, r5
c0dea43e:	3502      	adds	r5, #2
c0dea440:	f814 6b01 	ldrb.w	r6, [r4], #1
c0dea444:	f006 060f 	and.w	r6, r6, #15
c0dea448:	5d86      	ldrb	r6, [r0, r6]
c0dea44a:	707e      	strb	r6, [r7, #1]
c0dea44c:	e7ed      	b.n	c0dea42a <format_hex+0x1a>
c0dea44e:	f105 0c01 	add.w	ip, r5, #1
c0dea452:	2000      	movs	r0, #0
c0dea454:	5550      	strb	r0, [r2, r5]
c0dea456:	4660      	mov	r0, ip
c0dea458:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0dea45a:	bf00      	nop
c0dea45c:	00002848 	.word	0x00002848

c0dea460 <app_ticker_event_callback>:
c0dea460:	4770      	bx	lr
	...

c0dea464 <io_event>:
c0dea464:	b580      	push	{r7, lr}
c0dea466:	480b      	ldr	r0, [pc, #44]	@ (c0dea494 <io_event+0x30>)
c0dea468:	f819 1000 	ldrb.w	r1, [r9, r0]
c0dea46c:	2905      	cmp	r1, #5
c0dea46e:	d00e      	beq.n	c0dea48e <io_event+0x2a>
c0dea470:	290e      	cmp	r1, #14
c0dea472:	d005      	beq.n	c0dea480 <io_event+0x1c>
c0dea474:	290c      	cmp	r1, #12
c0dea476:	d108      	bne.n	c0dea48a <io_event+0x26>
c0dea478:	4448      	add	r0, r9
c0dea47a:	f000 f92f 	bl	c0dea6dc <ux_process_finger_event>
c0dea47e:	e006      	b.n	c0dea48e <io_event+0x2a>
c0dea480:	f7ff ffee 	bl	c0dea460 <app_ticker_event_callback>
c0dea484:	f000 f980 	bl	c0dea788 <ux_process_ticker_event>
c0dea488:	e001      	b.n	c0dea48e <io_event+0x2a>
c0dea48a:	f000 f9b3 	bl	c0dea7f4 <ux_process_default_event>
c0dea48e:	2001      	movs	r0, #1
c0dea490:	bd80      	pop	{r7, pc}
c0dea492:	bf00      	nop
c0dea494:	00001cec 	.word	0x00001cec

c0dea498 <io_init>:
c0dea498:	4802      	ldr	r0, [pc, #8]	@ (c0dea4a4 <io_init+0xc>)
c0dea49a:	2101      	movs	r1, #1
c0dea49c:	f809 1000 	strb.w	r1, [r9, r0]
c0dea4a0:	4770      	bx	lr
c0dea4a2:	bf00      	nop
c0dea4a4:	00001dfc 	.word	0x00001dfc

c0dea4a8 <io_recv_command>:
c0dea4a8:	b510      	push	{r4, lr}
c0dea4aa:	4c09      	ldr	r4, [pc, #36]	@ (c0dea4d0 <io_recv_command+0x28>)
c0dea4ac:	f819 0004 	ldrb.w	r0, [r9, r4]
c0dea4b0:	2801      	cmp	r0, #1
c0dea4b2:	d104      	bne.n	c0dea4be <io_recv_command+0x16>
c0dea4b4:	f000 fce2 	bl	c0deae7c <os_io_start>
c0dea4b8:	2000      	movs	r0, #0
c0dea4ba:	f809 0004 	strb.w	r0, [r9, r4]
c0dea4be:	2000      	movs	r0, #0
c0dea4c0:	2800      	cmp	r0, #0
c0dea4c2:	dc03      	bgt.n	c0dea4cc <io_recv_command+0x24>
c0dea4c4:	2001      	movs	r0, #1
c0dea4c6:	f7f8 fc91 	bl	c0de2dec <io_legacy_apdu_rx>
c0dea4ca:	e7f9      	b.n	c0dea4c0 <io_recv_command+0x18>
c0dea4cc:	bd10      	pop	{r4, pc}
c0dea4ce:	bf00      	nop
c0dea4d0:	00001dfc 	.word	0x00001dfc

c0dea4d4 <io_send_response_buffers>:
c0dea4d4:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0dea4d8:	f8df a060 	ldr.w	sl, [pc, #96]	@ c0dea53c <io_send_response_buffers+0x68>
c0dea4dc:	4690      	mov	r8, r2
c0dea4de:	460f      	mov	r7, r1
c0dea4e0:	4605      	mov	r5, r0
c0dea4e2:	f240 140f 	movw	r4, #271	@ 0x10f
c0dea4e6:	2600      	movs	r6, #0
c0dea4e8:	b1b5      	cbz	r5, c0dea518 <io_send_response_buffers+0x44>
c0dea4ea:	b1af      	cbz	r7, c0dea518 <io_send_response_buffers+0x44>
c0dea4ec:	2600      	movs	r6, #0
c0dea4ee:	b19f      	cbz	r7, c0dea518 <io_send_response_buffers+0x44>
c0dea4f0:	eb09 000a 	add.w	r0, r9, sl
c0dea4f4:	1ba2      	subs	r2, r4, r6
c0dea4f6:	1981      	adds	r1, r0, r6
c0dea4f8:	4628      	mov	r0, r5
c0dea4fa:	f7ff fe01 	bl	c0dea100 <buffer_copy>
c0dea4fe:	b130      	cbz	r0, c0dea50e <io_send_response_buffers+0x3a>
c0dea500:	e9d5 0101 	ldrd	r0, r1, [r5, #4]
c0dea504:	350c      	adds	r5, #12
c0dea506:	3f01      	subs	r7, #1
c0dea508:	4430      	add	r0, r6
c0dea50a:	1a46      	subs	r6, r0, r1
c0dea50c:	e7ef      	b.n	c0dea4ee <io_send_response_buffers+0x1a>
c0dea50e:	f44f 4830 	mov.w	r8, #45056	@ 0xb000
c0dea512:	2500      	movs	r5, #0
c0dea514:	2700      	movs	r7, #0
c0dea516:	e7e6      	b.n	c0dea4e6 <io_send_response_buffers+0x12>
c0dea518:	eb09 050a 	add.w	r5, r9, sl
c0dea51c:	fa1f f288 	uxth.w	r2, r8
c0dea520:	4631      	mov	r1, r6
c0dea522:	4628      	mov	r0, r5
c0dea524:	f000 f8d4 	bl	c0dea6d0 <write_u16_be>
c0dea528:	1cb0      	adds	r0, r6, #2
c0dea52a:	b281      	uxth	r1, r0
c0dea52c:	4628      	mov	r0, r5
c0dea52e:	f7f8 fc43 	bl	c0de2db8 <io_legacy_apdu_tx>
c0dea532:	ea40 70e0 	orr.w	r0, r0, r0, asr #31
c0dea536:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0dea53a:	bf00      	nop
c0dea53c:	000014f7 	.word	0x000014f7

c0dea540 <app_exit>:
c0dea540:	20ff      	movs	r0, #255	@ 0xff
c0dea542:	f000 fc87 	bl	c0deae54 <os_sched_exit>

c0dea546 <common_app_init>:
c0dea546:	b580      	push	{r7, lr}
c0dea548:	f000 f9c8 	bl	c0dea8dc <nbgl_objInit>
c0dea54c:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0dea550:	f7f8 bd78 	b.w	c0de3044 <io_seproxyhal_init>

c0dea554 <standalone_app_main>:
c0dea554:	b510      	push	{r4, lr}
c0dea556:	b08c      	sub	sp, #48	@ 0x30
c0dea558:	466c      	mov	r4, sp
c0dea55a:	4620      	mov	r0, r4
c0dea55c:	f000 fe42 	bl	c0deb1e4 <setjmp>
c0dea560:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0dea564:	0400      	lsls	r0, r0, #16
c0dea566:	d108      	bne.n	c0dea57a <standalone_app_main+0x26>
c0dea568:	4668      	mov	r0, sp
c0dea56a:	f000 fcb1 	bl	c0deaed0 <try_context_set>
c0dea56e:	900a      	str	r0, [sp, #40]	@ 0x28
c0dea570:	f7ff ffe9 	bl	c0dea546 <common_app_init>
c0dea574:	f7f5 fe78 	bl	c0de0268 <app_main>
c0dea578:	e005      	b.n	c0dea586 <standalone_app_main+0x32>
c0dea57a:	2000      	movs	r0, #0
c0dea57c:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0dea580:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0dea582:	f000 fca5 	bl	c0deaed0 <try_context_set>
c0dea586:	f000 fc9b 	bl	c0deaec0 <try_context_get>
c0dea58a:	42a0      	cmp	r0, r4
c0dea58c:	d102      	bne.n	c0dea594 <standalone_app_main+0x40>
c0dea58e:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0dea590:	f000 fc9e 	bl	c0deaed0 <try_context_set>
c0dea594:	f8bd 002c 	ldrh.w	r0, [sp, #44]	@ 0x2c
c0dea598:	b908      	cbnz	r0, c0dea59e <standalone_app_main+0x4a>
c0dea59a:	f7ff ffd1 	bl	c0dea540 <app_exit>
c0dea59e:	f000 fa12 	bl	c0dea9c6 <os_longjmp>

c0dea5a2 <apdu_parser>:
c0dea5a2:	2a04      	cmp	r2, #4
c0dea5a4:	d316      	bcc.n	c0dea5d4 <apdu_parser+0x32>
c0dea5a6:	d102      	bne.n	c0dea5ae <apdu_parser+0xc>
c0dea5a8:	2300      	movs	r3, #0
c0dea5aa:	7103      	strb	r3, [r0, #4]
c0dea5ac:	e004      	b.n	c0dea5b8 <apdu_parser+0x16>
c0dea5ae:	790b      	ldrb	r3, [r1, #4]
c0dea5b0:	3a05      	subs	r2, #5
c0dea5b2:	429a      	cmp	r2, r3
c0dea5b4:	7103      	strb	r3, [r0, #4]
c0dea5b6:	d10d      	bne.n	c0dea5d4 <apdu_parser+0x32>
c0dea5b8:	780a      	ldrb	r2, [r1, #0]
c0dea5ba:	2b00      	cmp	r3, #0
c0dea5bc:	7002      	strb	r2, [r0, #0]
c0dea5be:	784a      	ldrb	r2, [r1, #1]
c0dea5c0:	7042      	strb	r2, [r0, #1]
c0dea5c2:	788a      	ldrb	r2, [r1, #2]
c0dea5c4:	7082      	strb	r2, [r0, #2]
c0dea5c6:	bf18      	it	ne
c0dea5c8:	1d4b      	addne	r3, r1, #5
c0dea5ca:	78c9      	ldrb	r1, [r1, #3]
c0dea5cc:	6083      	str	r3, [r0, #8]
c0dea5ce:	70c1      	strb	r1, [r0, #3]
c0dea5d0:	2001      	movs	r0, #1
c0dea5d2:	4770      	bx	lr
c0dea5d4:	2000      	movs	r0, #0
c0dea5d6:	4770      	bx	lr

c0dea5d8 <read_u32_be>:
c0dea5d8:	5c42      	ldrb	r2, [r0, r1]
c0dea5da:	4408      	add	r0, r1
c0dea5dc:	7841      	ldrb	r1, [r0, #1]
c0dea5de:	7883      	ldrb	r3, [r0, #2]
c0dea5e0:	78c0      	ldrb	r0, [r0, #3]
c0dea5e2:	0409      	lsls	r1, r1, #16
c0dea5e4:	ea41 6102 	orr.w	r1, r1, r2, lsl #24
c0dea5e8:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0dea5ec:	4408      	add	r0, r1
c0dea5ee:	4770      	bx	lr

c0dea5f0 <read_u64_be>:
c0dea5f0:	b5f0      	push	{r4, r5, r6, r7, lr}
c0dea5f2:	1842      	adds	r2, r0, r1
c0dea5f4:	5c40      	ldrb	r0, [r0, r1]
c0dea5f6:	7917      	ldrb	r7, [r2, #4]
c0dea5f8:	7953      	ldrb	r3, [r2, #5]
c0dea5fa:	7854      	ldrb	r4, [r2, #1]
c0dea5fc:	7895      	ldrb	r5, [r2, #2]
c0dea5fe:	78d6      	ldrb	r6, [r2, #3]
c0dea600:	063f      	lsls	r7, r7, #24
c0dea602:	0421      	lsls	r1, r4, #16
c0dea604:	ea47 4303 	orr.w	r3, r7, r3, lsl #16
c0dea608:	7997      	ldrb	r7, [r2, #6]
c0dea60a:	79d2      	ldrb	r2, [r2, #7]
c0dea60c:	ea41 6000 	orr.w	r0, r1, r0, lsl #24
c0dea610:	ea40 2005 	orr.w	r0, r0, r5, lsl #8
c0dea614:	ea43 2307 	orr.w	r3, r3, r7, lsl #8
c0dea618:	1981      	adds	r1, r0, r6
c0dea61a:	441a      	add	r2, r3
c0dea61c:	4610      	mov	r0, r2
c0dea61e:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0dea620 <read_u16_le>:
c0dea620:	5c42      	ldrb	r2, [r0, r1]
c0dea622:	4408      	add	r0, r1
c0dea624:	7840      	ldrb	r0, [r0, #1]
c0dea626:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0dea62a:	b280      	uxth	r0, r0
c0dea62c:	4770      	bx	lr

c0dea62e <read_u32_le>:
c0dea62e:	5c42      	ldrb	r2, [r0, r1]
c0dea630:	4408      	add	r0, r1
c0dea632:	7841      	ldrb	r1, [r0, #1]
c0dea634:	7883      	ldrb	r3, [r0, #2]
c0dea636:	78c0      	ldrb	r0, [r0, #3]
c0dea638:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0dea63c:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
c0dea640:	ea41 6000 	orr.w	r0, r1, r0, lsl #24
c0dea644:	4770      	bx	lr

c0dea646 <read_u64_le>:
c0dea646:	b5b0      	push	{r4, r5, r7, lr}
c0dea648:	5c42      	ldrb	r2, [r0, r1]
c0dea64a:	4401      	add	r1, r0
c0dea64c:	7848      	ldrb	r0, [r1, #1]
c0dea64e:	788b      	ldrb	r3, [r1, #2]
c0dea650:	790d      	ldrb	r5, [r1, #4]
c0dea652:	78cc      	ldrb	r4, [r1, #3]
c0dea654:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0dea658:	794a      	ldrb	r2, [r1, #5]
c0dea65a:	ea40 4003 	orr.w	r0, r0, r3, lsl #16
c0dea65e:	798b      	ldrb	r3, [r1, #6]
c0dea660:	79c9      	ldrb	r1, [r1, #7]
c0dea662:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0dea666:	ea40 6004 	orr.w	r0, r0, r4, lsl #24
c0dea66a:	ea42 4203 	orr.w	r2, r2, r3, lsl #16
c0dea66e:	ea42 6101 	orr.w	r1, r2, r1, lsl #24
c0dea672:	bdb0      	pop	{r4, r5, r7, pc}

c0dea674 <varint_read>:
c0dea674:	b510      	push	{r4, lr}
c0dea676:	b1d9      	cbz	r1, c0dea6b0 <varint_read+0x3c>
c0dea678:	4614      	mov	r4, r2
c0dea67a:	4602      	mov	r2, r0
c0dea67c:	7800      	ldrb	r0, [r0, #0]
c0dea67e:	28ff      	cmp	r0, #255	@ 0xff
c0dea680:	d00c      	beq.n	c0dea69c <varint_read+0x28>
c0dea682:	28fe      	cmp	r0, #254	@ 0xfe
c0dea684:	d012      	beq.n	c0dea6ac <varint_read+0x38>
c0dea686:	28fd      	cmp	r0, #253	@ 0xfd
c0dea688:	d115      	bne.n	c0dea6b6 <varint_read+0x42>
c0dea68a:	2903      	cmp	r1, #3
c0dea68c:	d310      	bcc.n	c0dea6b0 <varint_read+0x3c>
c0dea68e:	4610      	mov	r0, r2
c0dea690:	2101      	movs	r1, #1
c0dea692:	f7ff ffc5 	bl	c0dea620 <read_u16_le>
c0dea696:	2100      	movs	r1, #0
c0dea698:	2203      	movs	r2, #3
c0dea69a:	e015      	b.n	c0dea6c8 <varint_read+0x54>
c0dea69c:	2909      	cmp	r1, #9
c0dea69e:	d307      	bcc.n	c0dea6b0 <varint_read+0x3c>
c0dea6a0:	4610      	mov	r0, r2
c0dea6a2:	2101      	movs	r1, #1
c0dea6a4:	f7ff ffcf 	bl	c0dea646 <read_u64_le>
c0dea6a8:	2209      	movs	r2, #9
c0dea6aa:	e00d      	b.n	c0dea6c8 <varint_read+0x54>
c0dea6ac:	2905      	cmp	r1, #5
c0dea6ae:	d205      	bcs.n	c0dea6bc <varint_read+0x48>
c0dea6b0:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
c0dea6b4:	e00a      	b.n	c0dea6cc <varint_read+0x58>
c0dea6b6:	2100      	movs	r1, #0
c0dea6b8:	2201      	movs	r2, #1
c0dea6ba:	e005      	b.n	c0dea6c8 <varint_read+0x54>
c0dea6bc:	4610      	mov	r0, r2
c0dea6be:	2101      	movs	r1, #1
c0dea6c0:	f7ff ffb5 	bl	c0dea62e <read_u32_le>
c0dea6c4:	2100      	movs	r1, #0
c0dea6c6:	2205      	movs	r2, #5
c0dea6c8:	e9c4 0100 	strd	r0, r1, [r4]
c0dea6cc:	4610      	mov	r0, r2
c0dea6ce:	bd10      	pop	{r4, pc}

c0dea6d0 <write_u16_be>:
c0dea6d0:	0a13      	lsrs	r3, r2, #8
c0dea6d2:	5443      	strb	r3, [r0, r1]
c0dea6d4:	4408      	add	r0, r1
c0dea6d6:	7042      	strb	r2, [r0, #1]
c0dea6d8:	4770      	bx	lr
	...

c0dea6dc <ux_process_finger_event>:
c0dea6dc:	b5b0      	push	{r4, r5, r7, lr}
c0dea6de:	4604      	mov	r4, r0
c0dea6e0:	2001      	movs	r0, #1
c0dea6e2:	f000 f827 	bl	c0dea734 <ux_forward_event>
c0dea6e6:	4605      	mov	r5, r0
c0dea6e8:	f000 f902 	bl	c0dea8f0 <nbgl_objAllowDrawing>
c0dea6ec:	b1fd      	cbz	r5, c0dea72e <ux_process_finger_event+0x52>
c0dea6ee:	78e1      	ldrb	r1, [r4, #3]
c0dea6f0:	480f      	ldr	r0, [pc, #60]	@ (c0dea730 <ux_process_finger_event+0x54>)
c0dea6f2:	7963      	ldrb	r3, [r4, #5]
c0dea6f4:	3901      	subs	r1, #1
c0dea6f6:	eb09 0200 	add.w	r2, r9, r0
c0dea6fa:	f859 0000 	ldr.w	r0, [r9, r0]
c0dea6fe:	fab1 f181 	clz	r1, r1
c0dea702:	094d      	lsrs	r5, r1, #5
c0dea704:	4611      	mov	r1, r2
c0dea706:	f801 5f04 	strb.w	r5, [r1, #4]!
c0dea70a:	7925      	ldrb	r5, [r4, #4]
c0dea70c:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0dea710:	80d3      	strh	r3, [r2, #6]
c0dea712:	79a3      	ldrb	r3, [r4, #6]
c0dea714:	79e4      	ldrb	r4, [r4, #7]
c0dea716:	ea44 2303 	orr.w	r3, r4, r3, lsl #8
c0dea71a:	8113      	strh	r3, [r2, #8]
c0dea71c:	2264      	movs	r2, #100	@ 0x64
c0dea71e:	4342      	muls	r2, r0
c0dea720:	2000      	movs	r0, #0
c0dea722:	f000 f93a 	bl	c0dea99a <nbgl_touchHandler>
c0dea726:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
c0dea72a:	f000 b8c8 	b.w	c0dea8be <nbgl_refresh>
c0dea72e:	bdb0      	pop	{r4, r5, r7, pc}
c0dea730:	00001e24 	.word	0x00001e24

c0dea734 <ux_forward_event>:
c0dea734:	b5b0      	push	{r4, r5, r7, lr}
c0dea736:	4604      	mov	r4, r0
c0dea738:	4812      	ldr	r0, [pc, #72]	@ (c0dea784 <ux_forward_event+0x50>)
c0dea73a:	2101      	movs	r1, #1
c0dea73c:	f809 1000 	strb.w	r1, [r9, r0]
c0dea740:	eb09 0500 	add.w	r5, r9, r0
c0dea744:	2000      	movs	r0, #0
c0dea746:	6068      	str	r0, [r5, #4]
c0dea748:	4628      	mov	r0, r5
c0dea74a:	f000 fb59 	bl	c0deae00 <os_ux>
c0dea74e:	2004      	movs	r0, #4
c0dea750:	f000 fbc8 	bl	c0deaee4 <os_sched_last_status>
c0dea754:	2869      	cmp	r0, #105	@ 0x69
c0dea756:	6068      	str	r0, [r5, #4]
c0dea758:	d108      	bne.n	c0dea76c <ux_forward_event+0x38>
c0dea75a:	2001      	movs	r0, #1
c0dea75c:	f000 f8c8 	bl	c0dea8f0 <nbgl_objAllowDrawing>
c0dea760:	f000 f8d5 	bl	c0dea90e <nbgl_screenRedraw>
c0dea764:	f000 f8ab 	bl	c0dea8be <nbgl_refresh>
c0dea768:	2000      	movs	r0, #0
c0dea76a:	bdb0      	pop	{r4, r5, r7, pc}
c0dea76c:	b144      	cbz	r4, c0dea780 <ux_forward_event+0x4c>
c0dea76e:	f1b0 0197 	subs.w	r1, r0, #151	@ 0x97
c0dea772:	bf18      	it	ne
c0dea774:	2101      	movne	r1, #1
c0dea776:	2800      	cmp	r0, #0
c0dea778:	bf18      	it	ne
c0dea77a:	2001      	movne	r0, #1
c0dea77c:	4008      	ands	r0, r1
c0dea77e:	bdb0      	pop	{r4, r5, r7, pc}
c0dea780:	2001      	movs	r0, #1
c0dea782:	bdb0      	pop	{r4, r5, r7, pc}
c0dea784:	00001e00 	.word	0x00001e00

c0dea788 <ux_process_ticker_event>:
c0dea788:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0dea78a:	4d19      	ldr	r5, [pc, #100]	@ (c0dea7f0 <ux_process_ticker_event+0x68>)
c0dea78c:	f859 0005 	ldr.w	r0, [r9, r5]
c0dea790:	3001      	adds	r0, #1
c0dea792:	f849 0005 	str.w	r0, [r9, r5]
c0dea796:	2001      	movs	r0, #1
c0dea798:	f7ff ffcc 	bl	c0dea734 <ux_forward_event>
c0dea79c:	4604      	mov	r4, r0
c0dea79e:	f000 f8a7 	bl	c0dea8f0 <nbgl_objAllowDrawing>
c0dea7a2:	b324      	cbz	r4, c0dea7ee <ux_process_ticker_event+0x66>
c0dea7a4:	2064      	movs	r0, #100	@ 0x64
c0dea7a6:	2464      	movs	r4, #100	@ 0x64
c0dea7a8:	f000 f8c0 	bl	c0dea92c <nbgl_screenHandler>
c0dea7ac:	eb09 0005 	add.w	r0, r9, r5
c0dea7b0:	7900      	ldrb	r0, [r0, #4]
c0dea7b2:	2801      	cmp	r0, #1
c0dea7b4:	d119      	bne.n	c0dea7ea <ux_process_ticker_event+0x62>
c0dea7b6:	4668      	mov	r0, sp
c0dea7b8:	f000 fba0 	bl	c0deaefc <touch_get_last_info>
c0dea7bc:	f8bd 0000 	ldrh.w	r0, [sp]
c0dea7c0:	eb09 0105 	add.w	r1, r9, r5
c0dea7c4:	80c8      	strh	r0, [r1, #6]
c0dea7c6:	f8bd 0002 	ldrh.w	r0, [sp, #2]
c0dea7ca:	8108      	strh	r0, [r1, #8]
c0dea7cc:	f89d 0004 	ldrb.w	r0, [sp, #4]
c0dea7d0:	3801      	subs	r0, #1
c0dea7d2:	fab0 f080 	clz	r0, r0
c0dea7d6:	0940      	lsrs	r0, r0, #5
c0dea7d8:	f801 0f04 	strb.w	r0, [r1, #4]!
c0dea7dc:	f859 0005 	ldr.w	r0, [r9, r5]
c0dea7e0:	fb00 f204 	mul.w	r2, r0, r4
c0dea7e4:	2000      	movs	r0, #0
c0dea7e6:	f000 f8d8 	bl	c0dea99a <nbgl_touchHandler>
c0dea7ea:	f000 f868 	bl	c0dea8be <nbgl_refresh>
c0dea7ee:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}
c0dea7f0:	00001e24 	.word	0x00001e24

c0dea7f4 <ux_process_default_event>:
c0dea7f4:	2000      	movs	r0, #0
c0dea7f6:	f7ff bf9d 	b.w	c0dea734 <ux_forward_event>

c0dea7fa <hash_iovec_ex>:
c0dea7fa:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0dea7fe:	468a      	mov	sl, r1
c0dea800:	4611      	mov	r1, r2
c0dea802:	461a      	mov	r2, r3
c0dea804:	4605      	mov	r5, r0
c0dea806:	f000 f840 	bl	c0dea88a <cx_hash_init_ex>
c0dea80a:	4607      	mov	r7, r0
c0dea80c:	b9a8      	cbnz	r0, c0dea83a <hash_iovec_ex+0x40>
c0dea80e:	f10d 0820 	add.w	r8, sp, #32
c0dea812:	e898 0141 	ldmia.w	r8, {r0, r6, r8}
c0dea816:	1d04      	adds	r4, r0, #4
c0dea818:	b156      	cbz	r6, c0dea830 <hash_iovec_ex+0x36>
c0dea81a:	f854 1c04 	ldr.w	r1, [r4, #-4]
c0dea81e:	f854 2b08 	ldr.w	r2, [r4], #8
c0dea822:	4628      	mov	r0, r5
c0dea824:	f000 f836 	bl	c0dea894 <cx_hash_update>
c0dea828:	3e01      	subs	r6, #1
c0dea82a:	2800      	cmp	r0, #0
c0dea82c:	d0f4      	beq.n	c0dea818 <hash_iovec_ex+0x1e>
c0dea82e:	e003      	b.n	c0dea838 <hash_iovec_ex+0x3e>
c0dea830:	4628      	mov	r0, r5
c0dea832:	4641      	mov	r1, r8
c0dea834:	f000 f824 	bl	c0dea880 <cx_hash_final>
c0dea838:	4607      	mov	r7, r0
c0dea83a:	4628      	mov	r0, r5
c0dea83c:	4651      	mov	r1, sl
c0dea83e:	f000 fc8b 	bl	c0deb158 <explicit_bzero>
c0dea842:	4638      	mov	r0, r7
c0dea844:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}

c0dea848 <cx_keccak_256_hash_iovec>:
c0dea848:	b580      	push	{r7, lr}
c0dea84a:	b0ee      	sub	sp, #440	@ 0x1b8
c0dea84c:	e88d 0007 	stmia.w	sp, {r0, r1, r2}
c0dea850:	a804      	add	r0, sp, #16
c0dea852:	f44f 71d4 	mov.w	r1, #424	@ 0x1a8
c0dea856:	2206      	movs	r2, #6
c0dea858:	2320      	movs	r3, #32
c0dea85a:	f7ff ffce 	bl	c0dea7fa <hash_iovec_ex>
c0dea85e:	b06e      	add	sp, #440	@ 0x1b8
c0dea860:	bd80      	pop	{r7, pc}

c0dea862 <cx_ecdsa_sign_no_throw>:
c0dea862:	b403      	push	{r0, r1}
c0dea864:	f04f 002c 	mov.w	r0, #44	@ 0x2c
c0dea868:	f000 b822 	b.w	c0dea8b0 <cx_trampoline_helper>

c0dea86c <cx_ecfp_generate_pair2_no_throw>:
c0dea86c:	b403      	push	{r0, r1}
c0dea86e:	f04f 0031 	mov.w	r0, #49	@ 0x31
c0dea872:	f000 b81d 	b.w	c0dea8b0 <cx_trampoline_helper>

c0dea876 <cx_ecfp_init_private_key_no_throw>:
c0dea876:	b403      	push	{r0, r1}
c0dea878:	f04f 0033 	mov.w	r0, #51	@ 0x33
c0dea87c:	f000 b818 	b.w	c0dea8b0 <cx_trampoline_helper>

c0dea880 <cx_hash_final>:
c0dea880:	b403      	push	{r0, r1}
c0dea882:	f04f 003f 	mov.w	r0, #63	@ 0x3f
c0dea886:	f000 b813 	b.w	c0dea8b0 <cx_trampoline_helper>

c0dea88a <cx_hash_init_ex>:
c0dea88a:	b403      	push	{r0, r1}
c0dea88c:	f04f 0043 	mov.w	r0, #67	@ 0x43
c0dea890:	f000 b80e 	b.w	c0dea8b0 <cx_trampoline_helper>

c0dea894 <cx_hash_update>:
c0dea894:	b403      	push	{r0, r1}
c0dea896:	f04f 0048 	mov.w	r0, #72	@ 0x48
c0dea89a:	f000 b809 	b.w	c0dea8b0 <cx_trampoline_helper>

c0dea89e <cx_rng_no_throw>:
c0dea89e:	b403      	push	{r0, r1}
c0dea8a0:	f04f 006a 	mov.w	r0, #106	@ 0x6a
c0dea8a4:	f000 b804 	b.w	c0dea8b0 <cx_trampoline_helper>

c0dea8a8 <cx_aes_siv_reset>:
c0dea8a8:	b403      	push	{r0, r1}
c0dea8aa:	f04f 0090 	mov.w	r0, #144	@ 0x90
c0dea8ae:	e7ff      	b.n	c0dea8b0 <cx_trampoline_helper>

c0dea8b0 <cx_trampoline_helper>:
c0dea8b0:	4900      	ldr	r1, [pc, #0]	@ (c0dea8b4 <cx_trampoline_helper+0x4>)
c0dea8b2:	4708      	bx	r1
c0dea8b4:	00808001 	.word	0x00808001

c0dea8b8 <assert_exit>:
c0dea8b8:	20ff      	movs	r0, #255	@ 0xff
c0dea8ba:	f000 facb 	bl	c0deae54 <os_sched_exit>

c0dea8be <nbgl_refresh>:
c0dea8be:	b403      	push	{r0, r1}
c0dea8c0:	f04f 0091 	mov.w	r0, #145	@ 0x91
c0dea8c4:	f000 b878 	b.w	c0dea9b8 <nbgl_trampoline_helper>

c0dea8c8 <nbgl_refreshSpecial>:
c0dea8c8:	b403      	push	{r0, r1}
c0dea8ca:	f04f 0092 	mov.w	r0, #146	@ 0x92
c0dea8ce:	f000 b873 	b.w	c0dea9b8 <nbgl_trampoline_helper>

c0dea8d2 <nbgl_refreshSpecialWithPostRefresh>:
c0dea8d2:	b403      	push	{r0, r1}
c0dea8d4:	f04f 0093 	mov.w	r0, #147	@ 0x93
c0dea8d8:	f000 b86e 	b.w	c0dea9b8 <nbgl_trampoline_helper>

c0dea8dc <nbgl_objInit>:
c0dea8dc:	b403      	push	{r0, r1}
c0dea8de:	f04f 0096 	mov.w	r0, #150	@ 0x96
c0dea8e2:	f000 b869 	b.w	c0dea9b8 <nbgl_trampoline_helper>

c0dea8e6 <nbgl_objDraw>:
c0dea8e6:	b403      	push	{r0, r1}
c0dea8e8:	f04f 0097 	mov.w	r0, #151	@ 0x97
c0dea8ec:	f000 b864 	b.w	c0dea9b8 <nbgl_trampoline_helper>

c0dea8f0 <nbgl_objAllowDrawing>:
c0dea8f0:	b403      	push	{r0, r1}
c0dea8f2:	f04f 0098 	mov.w	r0, #152	@ 0x98
c0dea8f6:	f000 b85f 	b.w	c0dea9b8 <nbgl_trampoline_helper>

c0dea8fa <nbgl_screenSet>:
c0dea8fa:	b403      	push	{r0, r1}
c0dea8fc:	f04f 009b 	mov.w	r0, #155	@ 0x9b
c0dea900:	f000 b85a 	b.w	c0dea9b8 <nbgl_trampoline_helper>

c0dea904 <nbgl_screenPush>:
c0dea904:	b403      	push	{r0, r1}
c0dea906:	f04f 009c 	mov.w	r0, #156	@ 0x9c
c0dea90a:	f000 b855 	b.w	c0dea9b8 <nbgl_trampoline_helper>

c0dea90e <nbgl_screenRedraw>:
c0dea90e:	b403      	push	{r0, r1}
c0dea910:	f04f 009d 	mov.w	r0, #157	@ 0x9d
c0dea914:	f000 b850 	b.w	c0dea9b8 <nbgl_trampoline_helper>

c0dea918 <nbgl_screenPop>:
c0dea918:	b403      	push	{r0, r1}
c0dea91a:	f04f 009e 	mov.w	r0, #158	@ 0x9e
c0dea91e:	f000 b84b 	b.w	c0dea9b8 <nbgl_trampoline_helper>

c0dea922 <nbgl_screenUpdateTicker>:
c0dea922:	b403      	push	{r0, r1}
c0dea924:	f04f 00a4 	mov.w	r0, #164	@ 0xa4
c0dea928:	f000 b846 	b.w	c0dea9b8 <nbgl_trampoline_helper>

c0dea92c <nbgl_screenHandler>:
c0dea92c:	b403      	push	{r0, r1}
c0dea92e:	f04f 00a7 	mov.w	r0, #167	@ 0xa7
c0dea932:	f000 b841 	b.w	c0dea9b8 <nbgl_trampoline_helper>

c0dea936 <nbgl_objPoolGet>:
c0dea936:	b403      	push	{r0, r1}
c0dea938:	f04f 00a8 	mov.w	r0, #168	@ 0xa8
c0dea93c:	f000 b83c 	b.w	c0dea9b8 <nbgl_trampoline_helper>

c0dea940 <nbgl_containerPoolGet>:
c0dea940:	b403      	push	{r0, r1}
c0dea942:	f04f 00aa 	mov.w	r0, #170	@ 0xaa
c0dea946:	f000 b837 	b.w	c0dea9b8 <nbgl_trampoline_helper>

c0dea94a <nbgl_getFont>:
c0dea94a:	b403      	push	{r0, r1}
c0dea94c:	f04f 00ac 	mov.w	r0, #172	@ 0xac
c0dea950:	f000 b832 	b.w	c0dea9b8 <nbgl_trampoline_helper>

c0dea954 <nbgl_getFontHeight>:
c0dea954:	b403      	push	{r0, r1}
c0dea956:	f04f 00ad 	mov.w	r0, #173	@ 0xad
c0dea95a:	f000 b82d 	b.w	c0dea9b8 <nbgl_trampoline_helper>

c0dea95e <nbgl_getFontLineHeight>:
c0dea95e:	b403      	push	{r0, r1}
c0dea960:	f04f 00ae 	mov.w	r0, #174	@ 0xae
c0dea964:	f000 b828 	b.w	c0dea9b8 <nbgl_trampoline_helper>

c0dea968 <nbgl_getTextHeightInWidth>:
c0dea968:	b403      	push	{r0, r1}
c0dea96a:	f04f 00b2 	mov.w	r0, #178	@ 0xb2
c0dea96e:	f000 b823 	b.w	c0dea9b8 <nbgl_trampoline_helper>

c0dea972 <nbgl_getTextNbLinesInWidth>:
c0dea972:	b403      	push	{r0, r1}
c0dea974:	f04f 00b4 	mov.w	r0, #180	@ 0xb4
c0dea978:	f000 b81e 	b.w	c0dea9b8 <nbgl_trampoline_helper>

c0dea97c <nbgl_getTextWidth>:
c0dea97c:	b403      	push	{r0, r1}
c0dea97e:	f04f 00b6 	mov.w	r0, #182	@ 0xb6
c0dea982:	f000 b819 	b.w	c0dea9b8 <nbgl_trampoline_helper>

c0dea986 <nbgl_getTextMaxLenInNbLines>:
c0dea986:	b403      	push	{r0, r1}
c0dea988:	f04f 00b7 	mov.w	r0, #183	@ 0xb7
c0dea98c:	f000 b814 	b.w	c0dea9b8 <nbgl_trampoline_helper>

c0dea990 <nbgl_textReduceOnNbLines>:
c0dea990:	b403      	push	{r0, r1}
c0dea992:	f04f 00b8 	mov.w	r0, #184	@ 0xb8
c0dea996:	f000 b80f 	b.w	c0dea9b8 <nbgl_trampoline_helper>

c0dea99a <nbgl_touchHandler>:
c0dea99a:	b403      	push	{r0, r1}
c0dea99c:	f04f 00bb 	mov.w	r0, #187	@ 0xbb
c0dea9a0:	f000 b80a 	b.w	c0dea9b8 <nbgl_trampoline_helper>

c0dea9a4 <nbgl_touchGetTouchDuration>:
c0dea9a4:	b403      	push	{r0, r1}
c0dea9a6:	f04f 00bc 	mov.w	r0, #188	@ 0xbc
c0dea9aa:	f000 b805 	b.w	c0dea9b8 <nbgl_trampoline_helper>
	...

c0dea9b0 <pic_init>:
c0dea9b0:	b403      	push	{r0, r1}
c0dea9b2:	f04f 00c4 	mov.w	r0, #196	@ 0xc4
c0dea9b6:	e7ff      	b.n	c0dea9b8 <nbgl_trampoline_helper>

c0dea9b8 <nbgl_trampoline_helper>:
c0dea9b8:	4900      	ldr	r1, [pc, #0]	@ (c0dea9bc <nbgl_trampoline_helper+0x4>)
c0dea9ba:	4708      	bx	r1
c0dea9bc:	00808001 	.word	0x00808001

c0dea9c0 <os_boot>:
c0dea9c0:	2000      	movs	r0, #0
c0dea9c2:	f000 ba85 	b.w	c0deaed0 <try_context_set>

c0dea9c6 <os_longjmp>:
c0dea9c6:	4604      	mov	r4, r0
c0dea9c8:	f000 fa7a 	bl	c0deaec0 <try_context_get>
c0dea9cc:	4621      	mov	r1, r4
c0dea9ce:	f000 fc0f 	bl	c0deb1f0 <longjmp>
	...

c0dea9d4 <snprintf>:
c0dea9d4:	b081      	sub	sp, #4
c0dea9d6:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea9da:	b087      	sub	sp, #28
c0dea9dc:	2800      	cmp	r0, #0
c0dea9de:	930f      	str	r3, [sp, #60]	@ 0x3c
c0dea9e0:	f000 817a 	beq.w	c0deacd8 <snprintf+0x304>
c0dea9e4:	460d      	mov	r5, r1
c0dea9e6:	2900      	cmp	r1, #0
c0dea9e8:	f000 8176 	beq.w	c0deacd8 <snprintf+0x304>
c0dea9ec:	4629      	mov	r1, r5
c0dea9ee:	4616      	mov	r6, r2
c0dea9f0:	4604      	mov	r4, r0
c0dea9f2:	f000 fba3 	bl	c0deb13c <__aeabi_memclr>
c0dea9f6:	f1b5 0801 	subs.w	r8, r5, #1
c0dea9fa:	f000 816d 	beq.w	c0deacd8 <snprintf+0x304>
c0dea9fe:	a80f      	add	r0, sp, #60	@ 0x3c
c0deaa00:	9002      	str	r0, [sp, #8]
c0deaa02:	7830      	ldrb	r0, [r6, #0]
c0deaa04:	2800      	cmp	r0, #0
c0deaa06:	f000 8167 	beq.w	c0deacd8 <snprintf+0x304>
c0deaa0a:	2700      	movs	r7, #0
c0deaa0c:	b128      	cbz	r0, c0deaa1a <snprintf+0x46>
c0deaa0e:	2825      	cmp	r0, #37	@ 0x25
c0deaa10:	d003      	beq.n	c0deaa1a <snprintf+0x46>
c0deaa12:	19f0      	adds	r0, r6, r7
c0deaa14:	3701      	adds	r7, #1
c0deaa16:	7840      	ldrb	r0, [r0, #1]
c0deaa18:	e7f8      	b.n	c0deaa0c <snprintf+0x38>
c0deaa1a:	4547      	cmp	r7, r8
c0deaa1c:	bf28      	it	cs
c0deaa1e:	4647      	movcs	r7, r8
c0deaa20:	4620      	mov	r0, r4
c0deaa22:	4631      	mov	r1, r6
c0deaa24:	463a      	mov	r2, r7
c0deaa26:	f000 fb81 	bl	c0deb12c <__aeabi_memmove>
c0deaa2a:	ebb8 0807 	subs.w	r8, r8, r7
c0deaa2e:	f000 8153 	beq.w	c0deacd8 <snprintf+0x304>
c0deaa32:	5df1      	ldrb	r1, [r6, r7]
c0deaa34:	19f0      	adds	r0, r6, r7
c0deaa36:	443c      	add	r4, r7
c0deaa38:	4606      	mov	r6, r0
c0deaa3a:	2925      	cmp	r1, #37	@ 0x25
c0deaa3c:	d1e1      	bne.n	c0deaa02 <snprintf+0x2e>
c0deaa3e:	1c41      	adds	r1, r0, #1
c0deaa40:	f04f 0b00 	mov.w	fp, #0
c0deaa44:	f04f 0e20 	mov.w	lr, #32
c0deaa48:	2500      	movs	r5, #0
c0deaa4a:	2600      	movs	r6, #0
c0deaa4c:	3101      	adds	r1, #1
c0deaa4e:	f811 3c01 	ldrb.w	r3, [r1, #-1]
c0deaa52:	4632      	mov	r2, r6
c0deaa54:	3101      	adds	r1, #1
c0deaa56:	2600      	movs	r6, #0
c0deaa58:	2b2d      	cmp	r3, #45	@ 0x2d
c0deaa5a:	d0f8      	beq.n	c0deaa4e <snprintf+0x7a>
c0deaa5c:	f1a3 0630 	sub.w	r6, r3, #48	@ 0x30
c0deaa60:	2e0a      	cmp	r6, #10
c0deaa62:	d313      	bcc.n	c0deaa8c <snprintf+0xb8>
c0deaa64:	2b25      	cmp	r3, #37	@ 0x25
c0deaa66:	d046      	beq.n	c0deaaf6 <snprintf+0x122>
c0deaa68:	2b2a      	cmp	r3, #42	@ 0x2a
c0deaa6a:	d01f      	beq.n	c0deaaac <snprintf+0xd8>
c0deaa6c:	2b2e      	cmp	r3, #46	@ 0x2e
c0deaa6e:	d129      	bne.n	c0deaac4 <snprintf+0xf0>
c0deaa70:	f811 2c01 	ldrb.w	r2, [r1, #-1]
c0deaa74:	2a2a      	cmp	r2, #42	@ 0x2a
c0deaa76:	d13c      	bne.n	c0deaaf2 <snprintf+0x11e>
c0deaa78:	780a      	ldrb	r2, [r1, #0]
c0deaa7a:	2a48      	cmp	r2, #72	@ 0x48
c0deaa7c:	d003      	beq.n	c0deaa86 <snprintf+0xb2>
c0deaa7e:	2a73      	cmp	r2, #115	@ 0x73
c0deaa80:	d001      	beq.n	c0deaa86 <snprintf+0xb2>
c0deaa82:	2a68      	cmp	r2, #104	@ 0x68
c0deaa84:	d135      	bne.n	c0deaaf2 <snprintf+0x11e>
c0deaa86:	9a02      	ldr	r2, [sp, #8]
c0deaa88:	2601      	movs	r6, #1
c0deaa8a:	e017      	b.n	c0deaabc <snprintf+0xe8>
c0deaa8c:	f083 0630 	eor.w	r6, r3, #48	@ 0x30
c0deaa90:	ea56 060b 	orrs.w	r6, r6, fp
c0deaa94:	bf08      	it	eq
c0deaa96:	f04f 0e30 	moveq.w	lr, #48	@ 0x30
c0deaa9a:	eb0b 068b 	add.w	r6, fp, fp, lsl #2
c0deaa9e:	3901      	subs	r1, #1
c0deaaa0:	eb03 0346 	add.w	r3, r3, r6, lsl #1
c0deaaa4:	4616      	mov	r6, r2
c0deaaa6:	f1a3 0b30 	sub.w	fp, r3, #48	@ 0x30
c0deaaaa:	e7cf      	b.n	c0deaa4c <snprintf+0x78>
c0deaaac:	460b      	mov	r3, r1
c0deaaae:	f813 2d01 	ldrb.w	r2, [r3, #-1]!
c0deaab2:	2a73      	cmp	r2, #115	@ 0x73
c0deaab4:	d11d      	bne.n	c0deaaf2 <snprintf+0x11e>
c0deaab6:	9a02      	ldr	r2, [sp, #8]
c0deaab8:	2602      	movs	r6, #2
c0deaaba:	4619      	mov	r1, r3
c0deaabc:	1d13      	adds	r3, r2, #4
c0deaabe:	9302      	str	r3, [sp, #8]
c0deaac0:	6815      	ldr	r5, [r2, #0]
c0deaac2:	e7c3      	b.n	c0deaa4c <snprintf+0x78>
c0deaac4:	2b48      	cmp	r3, #72	@ 0x48
c0deaac6:	d018      	beq.n	c0deaafa <snprintf+0x126>
c0deaac8:	2b58      	cmp	r3, #88	@ 0x58
c0deaaca:	d019      	beq.n	c0deab00 <snprintf+0x12c>
c0deaacc:	2b63      	cmp	r3, #99	@ 0x63
c0deaace:	d020      	beq.n	c0deab12 <snprintf+0x13e>
c0deaad0:	2b64      	cmp	r3, #100	@ 0x64
c0deaad2:	d02a      	beq.n	c0deab2a <snprintf+0x156>
c0deaad4:	2b68      	cmp	r3, #104	@ 0x68
c0deaad6:	d036      	beq.n	c0deab46 <snprintf+0x172>
c0deaad8:	2b70      	cmp	r3, #112	@ 0x70
c0deaada:	d006      	beq.n	c0deaaea <snprintf+0x116>
c0deaadc:	2b73      	cmp	r3, #115	@ 0x73
c0deaade:	d037      	beq.n	c0deab50 <snprintf+0x17c>
c0deaae0:	2b75      	cmp	r3, #117	@ 0x75
c0deaae2:	f000 8081 	beq.w	c0deabe8 <snprintf+0x214>
c0deaae6:	2b78      	cmp	r3, #120	@ 0x78
c0deaae8:	d103      	bne.n	c0deaaf2 <snprintf+0x11e>
c0deaaea:	9400      	str	r4, [sp, #0]
c0deaaec:	f04f 0c00 	mov.w	ip, #0
c0deaaf0:	e009      	b.n	c0deab06 <snprintf+0x132>
c0deaaf2:	1e4e      	subs	r6, r1, #1
c0deaaf4:	e785      	b.n	c0deaa02 <snprintf+0x2e>
c0deaaf6:	2025      	movs	r0, #37	@ 0x25
c0deaaf8:	e00f      	b.n	c0deab1a <snprintf+0x146>
c0deaafa:	487b      	ldr	r0, [pc, #492]	@ (c0deace8 <snprintf+0x314>)
c0deaafc:	4478      	add	r0, pc
c0deaafe:	e024      	b.n	c0deab4a <snprintf+0x176>
c0deab00:	f04f 0c01 	mov.w	ip, #1
c0deab04:	9400      	str	r4, [sp, #0]
c0deab06:	9a02      	ldr	r2, [sp, #8]
c0deab08:	2400      	movs	r4, #0
c0deab0a:	1d13      	adds	r3, r2, #4
c0deab0c:	9302      	str	r3, [sp, #8]
c0deab0e:	2310      	movs	r3, #16
c0deab10:	e072      	b.n	c0deabf8 <snprintf+0x224>
c0deab12:	9802      	ldr	r0, [sp, #8]
c0deab14:	1d02      	adds	r2, r0, #4
c0deab16:	9202      	str	r2, [sp, #8]
c0deab18:	6800      	ldr	r0, [r0, #0]
c0deab1a:	1e4e      	subs	r6, r1, #1
c0deab1c:	f804 0b01 	strb.w	r0, [r4], #1
c0deab20:	f1b8 0801 	subs.w	r8, r8, #1
c0deab24:	f47f af6d 	bne.w	c0deaa02 <snprintf+0x2e>
c0deab28:	e0d6      	b.n	c0deacd8 <snprintf+0x304>
c0deab2a:	9a02      	ldr	r2, [sp, #8]
c0deab2c:	9400      	str	r4, [sp, #0]
c0deab2e:	1d13      	adds	r3, r2, #4
c0deab30:	9302      	str	r3, [sp, #8]
c0deab32:	6813      	ldr	r3, [r2, #0]
c0deab34:	2b00      	cmp	r3, #0
c0deab36:	461a      	mov	r2, r3
c0deab38:	d500      	bpl.n	c0deab3c <snprintf+0x168>
c0deab3a:	425a      	negs	r2, r3
c0deab3c:	0fdc      	lsrs	r4, r3, #31
c0deab3e:	f04f 0c00 	mov.w	ip, #0
c0deab42:	230a      	movs	r3, #10
c0deab44:	e059      	b.n	c0deabfa <snprintf+0x226>
c0deab46:	4869      	ldr	r0, [pc, #420]	@ (c0deacec <snprintf+0x318>)
c0deab48:	4478      	add	r0, pc
c0deab4a:	f04f 0c01 	mov.w	ip, #1
c0deab4e:	e003      	b.n	c0deab58 <snprintf+0x184>
c0deab50:	4864      	ldr	r0, [pc, #400]	@ (c0deace4 <snprintf+0x310>)
c0deab52:	f04f 0c00 	mov.w	ip, #0
c0deab56:	4478      	add	r0, pc
c0deab58:	9b02      	ldr	r3, [sp, #8]
c0deab5a:	b2d2      	uxtb	r2, r2
c0deab5c:	1d1e      	adds	r6, r3, #4
c0deab5e:	9602      	str	r6, [sp, #8]
c0deab60:	1e4e      	subs	r6, r1, #1
c0deab62:	6819      	ldr	r1, [r3, #0]
c0deab64:	2a02      	cmp	r2, #2
c0deab66:	f000 80a7 	beq.w	c0deacb8 <snprintf+0x2e4>
c0deab6a:	2a01      	cmp	r2, #1
c0deab6c:	d007      	beq.n	c0deab7e <snprintf+0x1aa>
c0deab6e:	463d      	mov	r5, r7
c0deab70:	b92a      	cbnz	r2, c0deab7e <snprintf+0x1aa>
c0deab72:	2200      	movs	r2, #0
c0deab74:	5c8b      	ldrb	r3, [r1, r2]
c0deab76:	3201      	adds	r2, #1
c0deab78:	2b00      	cmp	r3, #0
c0deab7a:	d1fb      	bne.n	c0deab74 <snprintf+0x1a0>
c0deab7c:	1e55      	subs	r5, r2, #1
c0deab7e:	f1bc 0f00 	cmp.w	ip, #0
c0deab82:	d016      	beq.n	c0deabb2 <snprintf+0x1de>
c0deab84:	2d00      	cmp	r5, #0
c0deab86:	f43f af3c 	beq.w	c0deaa02 <snprintf+0x2e>
c0deab8a:	f1b8 0f02 	cmp.w	r8, #2
c0deab8e:	f0c0 80a3 	bcc.w	c0deacd8 <snprintf+0x304>
c0deab92:	780a      	ldrb	r2, [r1, #0]
c0deab94:	0913      	lsrs	r3, r2, #4
c0deab96:	f002 020f 	and.w	r2, r2, #15
c0deab9a:	5cc3      	ldrb	r3, [r0, r3]
c0deab9c:	f1b8 0802 	subs.w	r8, r8, #2
c0deaba0:	7023      	strb	r3, [r4, #0]
c0deaba2:	5c82      	ldrb	r2, [r0, r2]
c0deaba4:	7062      	strb	r2, [r4, #1]
c0deaba6:	f000 8097 	beq.w	c0deacd8 <snprintf+0x304>
c0deabaa:	3101      	adds	r1, #1
c0deabac:	3d01      	subs	r5, #1
c0deabae:	3402      	adds	r4, #2
c0deabb0:	e7e8      	b.n	c0deab84 <snprintf+0x1b0>
c0deabb2:	4545      	cmp	r5, r8
c0deabb4:	bf28      	it	cs
c0deabb6:	4645      	movcs	r5, r8
c0deabb8:	4620      	mov	r0, r4
c0deabba:	462a      	mov	r2, r5
c0deabbc:	f000 fab6 	bl	c0deb12c <__aeabi_memmove>
c0deabc0:	ebb8 0805 	subs.w	r8, r8, r5
c0deabc4:	f000 8088 	beq.w	c0deacd8 <snprintf+0x304>
c0deabc8:	462f      	mov	r7, r5
c0deabca:	442c      	add	r4, r5
c0deabcc:	45bb      	cmp	fp, r7
c0deabce:	f67f af18 	bls.w	c0deaa02 <snprintf+0x2e>
c0deabd2:	ebab 0507 	sub.w	r5, fp, r7
c0deabd6:	4620      	mov	r0, r4
c0deabd8:	4545      	cmp	r5, r8
c0deabda:	bf28      	it	cs
c0deabdc:	4645      	movcs	r5, r8
c0deabde:	4629      	mov	r1, r5
c0deabe0:	2220      	movs	r2, #32
c0deabe2:	f000 faa5 	bl	c0deb130 <__aeabi_memset>
c0deabe6:	e061      	b.n	c0deacac <snprintf+0x2d8>
c0deabe8:	9a02      	ldr	r2, [sp, #8]
c0deabea:	9400      	str	r4, [sp, #0]
c0deabec:	2400      	movs	r4, #0
c0deabee:	f04f 0c00 	mov.w	ip, #0
c0deabf2:	1d13      	adds	r3, r2, #4
c0deabf4:	9302      	str	r3, [sp, #8]
c0deabf6:	230a      	movs	r3, #10
c0deabf8:	6812      	ldr	r2, [r2, #0]
c0deabfa:	483d      	ldr	r0, [pc, #244]	@ (c0deacf0 <snprintf+0x31c>)
c0deabfc:	1e4e      	subs	r6, r1, #1
c0deabfe:	f04f 0a01 	mov.w	sl, #1
c0deac02:	4478      	add	r0, pc
c0deac04:	9001      	str	r0, [sp, #4]
c0deac06:	fba3 570a 	umull	r5, r7, r3, sl
c0deac0a:	2f00      	cmp	r7, #0
c0deac0c:	bf18      	it	ne
c0deac0e:	2701      	movne	r7, #1
c0deac10:	4295      	cmp	r5, r2
c0deac12:	d804      	bhi.n	c0deac1e <snprintf+0x24a>
c0deac14:	b91f      	cbnz	r7, c0deac1e <snprintf+0x24a>
c0deac16:	f1ab 0b01 	sub.w	fp, fp, #1
c0deac1a:	46aa      	mov	sl, r5
c0deac1c:	e7f3      	b.n	c0deac06 <snprintf+0x232>
c0deac1e:	2c00      	cmp	r4, #0
c0deac20:	4627      	mov	r7, r4
c0deac22:	f04f 0500 	mov.w	r5, #0
c0deac26:	bf18      	it	ne
c0deac28:	f04f 37ff 	movne.w	r7, #4294967295	@ 0xffffffff
c0deac2c:	d00d      	beq.n	c0deac4a <snprintf+0x276>
c0deac2e:	4660      	mov	r0, ip
c0deac30:	fa5f fc8e 	uxtb.w	ip, lr
c0deac34:	a903      	add	r1, sp, #12
c0deac36:	f1bc 0f30 	cmp.w	ip, #48	@ 0x30
c0deac3a:	4684      	mov	ip, r0
c0deac3c:	d106      	bne.n	c0deac4c <snprintf+0x278>
c0deac3e:	202d      	movs	r0, #45	@ 0x2d
c0deac40:	2400      	movs	r4, #0
c0deac42:	2501      	movs	r5, #1
c0deac44:	f88d 000c 	strb.w	r0, [sp, #12]
c0deac48:	e000      	b.n	c0deac4c <snprintf+0x278>
c0deac4a:	a903      	add	r1, sp, #12
c0deac4c:	eb07 000b 	add.w	r0, r7, fp
c0deac50:	3802      	subs	r0, #2
c0deac52:	280d      	cmp	r0, #13
c0deac54:	d808      	bhi.n	c0deac68 <snprintf+0x294>
c0deac56:	f1c7 0701 	rsb	r7, r7, #1
c0deac5a:	45bb      	cmp	fp, r7
c0deac5c:	d004      	beq.n	c0deac68 <snprintf+0x294>
c0deac5e:	f801 e005 	strb.w	lr, [r1, r5]
c0deac62:	3701      	adds	r7, #1
c0deac64:	3501      	adds	r5, #1
c0deac66:	e7f8      	b.n	c0deac5a <snprintf+0x286>
c0deac68:	9f01      	ldr	r7, [sp, #4]
c0deac6a:	b114      	cbz	r4, c0deac72 <snprintf+0x29e>
c0deac6c:	202d      	movs	r0, #45	@ 0x2d
c0deac6e:	5548      	strb	r0, [r1, r5]
c0deac70:	3501      	adds	r5, #1
c0deac72:	4820      	ldr	r0, [pc, #128]	@ (c0deacf4 <snprintf+0x320>)
c0deac74:	f1bc 0f00 	cmp.w	ip, #0
c0deac78:	4478      	add	r0, pc
c0deac7a:	bf08      	it	eq
c0deac7c:	4638      	moveq	r0, r7
c0deac7e:	f1ba 0f00 	cmp.w	sl, #0
c0deac82:	d00b      	beq.n	c0deac9c <snprintf+0x2c8>
c0deac84:	fbb2 f7fa 	udiv	r7, r2, sl
c0deac88:	fbba faf3 	udiv	sl, sl, r3
c0deac8c:	fbb7 f4f3 	udiv	r4, r7, r3
c0deac90:	fb04 7413 	mls	r4, r4, r3, r7
c0deac94:	5d04      	ldrb	r4, [r0, r4]
c0deac96:	554c      	strb	r4, [r1, r5]
c0deac98:	3501      	adds	r5, #1
c0deac9a:	e7f0      	b.n	c0deac7e <snprintf+0x2aa>
c0deac9c:	4545      	cmp	r5, r8
c0deac9e:	bf28      	it	cs
c0deaca0:	4645      	movcs	r5, r8
c0deaca2:	9c00      	ldr	r4, [sp, #0]
c0deaca4:	462a      	mov	r2, r5
c0deaca6:	4620      	mov	r0, r4
c0deaca8:	f000 fa40 	bl	c0deb12c <__aeabi_memmove>
c0deacac:	ebb8 0805 	subs.w	r8, r8, r5
c0deacb0:	442c      	add	r4, r5
c0deacb2:	f47f aea6 	bne.w	c0deaa02 <snprintf+0x2e>
c0deacb6:	e00f      	b.n	c0deacd8 <snprintf+0x304>
c0deacb8:	7808      	ldrb	r0, [r1, #0]
c0deacba:	2800      	cmp	r0, #0
c0deacbc:	f47f aea1 	bne.w	c0deaa02 <snprintf+0x2e>
c0deacc0:	4545      	cmp	r5, r8
c0deacc2:	bf28      	it	cs
c0deacc4:	4645      	movcs	r5, r8
c0deacc6:	4620      	mov	r0, r4
c0deacc8:	4629      	mov	r1, r5
c0deacca:	2220      	movs	r2, #32
c0deaccc:	f000 fa30 	bl	c0deb130 <__aeabi_memset>
c0deacd0:	ebb8 0805 	subs.w	r8, r8, r5
c0deacd4:	f47f af79 	bne.w	c0deabca <snprintf+0x1f6>
c0deacd8:	2000      	movs	r0, #0
c0deacda:	b007      	add	sp, #28
c0deacdc:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0deace0:	b001      	add	sp, #4
c0deace2:	4770      	bx	lr
c0deace4:	0000391a 	.word	0x0000391a
c0deace8:	000039b4 	.word	0x000039b4
c0deacec:	00003928 	.word	0x00003928
c0deacf0:	0000386e 	.word	0x0000386e
c0deacf4:	00003838 	.word	0x00003838

c0deacf8 <pic>:
c0deacf8:	4a0a      	ldr	r2, [pc, #40]	@ (c0dead24 <pic+0x2c>)
c0deacfa:	4282      	cmp	r2, r0
c0deacfc:	490a      	ldr	r1, [pc, #40]	@ (c0dead28 <pic+0x30>)
c0deacfe:	d806      	bhi.n	c0dead0e <pic+0x16>
c0dead00:	4281      	cmp	r1, r0
c0dead02:	d304      	bcc.n	c0dead0e <pic+0x16>
c0dead04:	b580      	push	{r7, lr}
c0dead06:	f000 f815 	bl	c0dead34 <pic_internal>
c0dead0a:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0dead0e:	4907      	ldr	r1, [pc, #28]	@ (c0dead2c <pic+0x34>)
c0dead10:	4288      	cmp	r0, r1
c0dead12:	4a07      	ldr	r2, [pc, #28]	@ (c0dead30 <pic+0x38>)
c0dead14:	d304      	bcc.n	c0dead20 <pic+0x28>
c0dead16:	4290      	cmp	r0, r2
c0dead18:	d802      	bhi.n	c0dead20 <pic+0x28>
c0dead1a:	1a40      	subs	r0, r0, r1
c0dead1c:	4649      	mov	r1, r9
c0dead1e:	4408      	add	r0, r1
c0dead20:	4770      	bx	lr
c0dead22:	0000      	movs	r0, r0
c0dead24:	c0de0000 	.word	0xc0de0000
c0dead28:	c0dee96b 	.word	0xc0dee96b
c0dead2c:	da7a0000 	.word	0xda7a0000
c0dead30:	da7a9000 	.word	0xda7a9000

c0dead34 <pic_internal>:
c0dead34:	467a      	mov	r2, pc
c0dead36:	4902      	ldr	r1, [pc, #8]	@ (c0dead40 <pic_internal+0xc>)
c0dead38:	1cc9      	adds	r1, r1, #3
c0dead3a:	1a89      	subs	r1, r1, r2
c0dead3c:	1a40      	subs	r0, r0, r1
c0dead3e:	4770      	bx	lr
c0dead40:	c0dead35 	.word	0xc0dead35

c0dead44 <SVC_Call>:
c0dead44:	df01      	svc	1
c0dead46:	2900      	cmp	r1, #0
c0dead48:	d100      	bne.n	c0dead4c <exception>
c0dead4a:	4770      	bx	lr

c0dead4c <exception>:
c0dead4c:	4608      	mov	r0, r1
c0dead4e:	f7ff fe3a 	bl	c0dea9c6 <os_longjmp>
	...

c0dead54 <SVC_cx_call>:
c0dead54:	df01      	svc	1
c0dead56:	4770      	bx	lr

c0dead58 <nbgl_wait_pipeline>:
c0dead58:	b5e0      	push	{r5, r6, r7, lr}
c0dead5a:	2000      	movs	r0, #0
c0dead5c:	9001      	str	r0, [sp, #4]
c0dead5e:	4802      	ldr	r0, [pc, #8]	@ (c0dead68 <nbgl_wait_pipeline+0x10>)
c0dead60:	a901      	add	r1, sp, #4
c0dead62:	f7ff ffef 	bl	c0dead44 <SVC_Call>
c0dead66:	bd8c      	pop	{r2, r3, r7, pc}
c0dead68:	00fa0011 	.word	0x00fa0011

c0dead6c <nvm_write>:
c0dead6c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0dead6e:	ab01      	add	r3, sp, #4
c0dead70:	c307      	stmia	r3!, {r0, r1, r2}
c0dead72:	4802      	ldr	r0, [pc, #8]	@ (c0dead7c <nvm_write+0x10>)
c0dead74:	a901      	add	r1, sp, #4
c0dead76:	f7ff ffe5 	bl	c0dead44 <SVC_Call>
c0dead7a:	bd8f      	pop	{r0, r1, r2, r3, r7, pc}
c0dead7c:	03000003 	.word	0x03000003

c0dead80 <cx_ecdomain_parameters_length>:
c0dead80:	b5e0      	push	{r5, r6, r7, lr}
c0dead82:	e9cd 0100 	strd	r0, r1, [sp]
c0dead86:	4802      	ldr	r0, [pc, #8]	@ (c0dead90 <cx_ecdomain_parameters_length+0x10>)
c0dead88:	4669      	mov	r1, sp
c0dead8a:	f7ff ffe3 	bl	c0dead54 <SVC_cx_call>
c0dead8e:	bd8c      	pop	{r2, r3, r7, pc}
c0dead90:	0200012f 	.word	0x0200012f

c0dead94 <os_perso_derive_node_with_seed_key>:
c0dead94:	b510      	push	{r4, lr}
c0dead96:	b088      	sub	sp, #32
c0dead98:	9c0d      	ldr	r4, [sp, #52]	@ 0x34
c0dead9a:	9407      	str	r4, [sp, #28]
c0dead9c:	9c0c      	ldr	r4, [sp, #48]	@ 0x30
c0dead9e:	9406      	str	r4, [sp, #24]
c0deada0:	9c0b      	ldr	r4, [sp, #44]	@ 0x2c
c0deada2:	9405      	str	r4, [sp, #20]
c0deada4:	9c0a      	ldr	r4, [sp, #40]	@ 0x28
c0deada6:	e88d 001f 	stmia.w	sp, {r0, r1, r2, r3, r4}
c0deadaa:	4803      	ldr	r0, [pc, #12]	@ (c0deadb8 <os_perso_derive_node_with_seed_key+0x24>)
c0deadac:	4669      	mov	r1, sp
c0deadae:	f7ff ffc9 	bl	c0dead44 <SVC_Call>
c0deadb2:	b008      	add	sp, #32
c0deadb4:	bd10      	pop	{r4, pc}
c0deadb6:	bf00      	nop
c0deadb8:	080000a6 	.word	0x080000a6

c0deadbc <os_pki_load_certificate>:
c0deadbc:	b510      	push	{r4, lr}
c0deadbe:	b086      	sub	sp, #24
c0deadc0:	9c09      	ldr	r4, [sp, #36]	@ 0x24
c0deadc2:	9405      	str	r4, [sp, #20]
c0deadc4:	9c08      	ldr	r4, [sp, #32]
c0deadc6:	e88d 001f 	stmia.w	sp, {r0, r1, r2, r3, r4}
c0deadca:	4803      	ldr	r0, [pc, #12]	@ (c0deadd8 <os_pki_load_certificate+0x1c>)
c0deadcc:	4669      	mov	r1, sp
c0deadce:	f7ff ffb9 	bl	c0dead44 <SVC_Call>
c0deadd2:	b006      	add	sp, #24
c0deadd4:	bd10      	pop	{r4, pc}
c0deadd6:	bf00      	nop
c0deadd8:	060000aa 	.word	0x060000aa

c0deaddc <os_perso_is_pin_set>:
c0deaddc:	b5e0      	push	{r5, r6, r7, lr}
c0deadde:	2000      	movs	r0, #0
c0deade0:	4669      	mov	r1, sp
c0deade2:	9001      	str	r0, [sp, #4]
c0deade4:	209e      	movs	r0, #158	@ 0x9e
c0deade6:	f7ff ffad 	bl	c0dead44 <SVC_Call>
c0deadea:	b2c0      	uxtb	r0, r0
c0deadec:	bd8c      	pop	{r2, r3, r7, pc}

c0deadee <os_global_pin_is_validated>:
c0deadee:	b5e0      	push	{r5, r6, r7, lr}
c0deadf0:	2000      	movs	r0, #0
c0deadf2:	4669      	mov	r1, sp
c0deadf4:	9001      	str	r0, [sp, #4]
c0deadf6:	20a0      	movs	r0, #160	@ 0xa0
c0deadf8:	f7ff ffa4 	bl	c0dead44 <SVC_Call>
c0deadfc:	b2c0      	uxtb	r0, r0
c0deadfe:	bd8c      	pop	{r2, r3, r7, pc}

c0deae00 <os_ux>:
c0deae00:	b5e0      	push	{r5, r6, r7, lr}
c0deae02:	f000 f885 	bl	c0deaf10 <OUTLINED_FUNCTION_0>
c0deae06:	4802      	ldr	r0, [pc, #8]	@ (c0deae10 <os_ux+0x10>)
c0deae08:	4669      	mov	r1, sp
c0deae0a:	f7ff ff9b 	bl	c0dead44 <SVC_Call>
c0deae0e:	bd8c      	pop	{r2, r3, r7, pc}
c0deae10:	01000064 	.word	0x01000064

c0deae14 <os_flags>:
c0deae14:	b5e0      	push	{r5, r6, r7, lr}
c0deae16:	2000      	movs	r0, #0
c0deae18:	4669      	mov	r1, sp
c0deae1a:	9001      	str	r0, [sp, #4]
c0deae1c:	206a      	movs	r0, #106	@ 0x6a
c0deae1e:	f7ff ff91 	bl	c0dead44 <SVC_Call>
c0deae22:	bd8c      	pop	{r2, r3, r7, pc}

c0deae24 <os_setting_get>:
c0deae24:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deae26:	ab01      	add	r3, sp, #4
c0deae28:	c307      	stmia	r3!, {r0, r1, r2}
c0deae2a:	4803      	ldr	r0, [pc, #12]	@ (c0deae38 <os_setting_get+0x14>)
c0deae2c:	a901      	add	r1, sp, #4
c0deae2e:	f7ff ff89 	bl	c0dead44 <SVC_Call>
c0deae32:	b004      	add	sp, #16
c0deae34:	bd80      	pop	{r7, pc}
c0deae36:	bf00      	nop
c0deae38:	03000070 	.word	0x03000070

c0deae3c <os_registry_get_current_app_tag>:
c0deae3c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deae3e:	ab01      	add	r3, sp, #4
c0deae40:	c307      	stmia	r3!, {r0, r1, r2}
c0deae42:	4803      	ldr	r0, [pc, #12]	@ (c0deae50 <os_registry_get_current_app_tag+0x14>)
c0deae44:	a901      	add	r1, sp, #4
c0deae46:	f7ff ff7d 	bl	c0dead44 <SVC_Call>
c0deae4a:	b004      	add	sp, #16
c0deae4c:	bd80      	pop	{r7, pc}
c0deae4e:	bf00      	nop
c0deae50:	03000074 	.word	0x03000074

c0deae54 <os_sched_exit>:
c0deae54:	b082      	sub	sp, #8
c0deae56:	f000 f85b 	bl	c0deaf10 <OUTLINED_FUNCTION_0>
c0deae5a:	4802      	ldr	r0, [pc, #8]	@ (c0deae64 <os_sched_exit+0x10>)
c0deae5c:	4669      	mov	r1, sp
c0deae5e:	f7ff ff71 	bl	c0dead44 <SVC_Call>
c0deae62:	deff      	udf	#255	@ 0xff
c0deae64:	0100009a 	.word	0x0100009a

c0deae68 <os_io_init>:
c0deae68:	b5e0      	push	{r5, r6, r7, lr}
c0deae6a:	9001      	str	r0, [sp, #4]
c0deae6c:	4802      	ldr	r0, [pc, #8]	@ (c0deae78 <os_io_init+0x10>)
c0deae6e:	a901      	add	r1, sp, #4
c0deae70:	f7ff ff68 	bl	c0dead44 <SVC_Call>
c0deae74:	bd8c      	pop	{r2, r3, r7, pc}
c0deae76:	bf00      	nop
c0deae78:	01000084 	.word	0x01000084

c0deae7c <os_io_start>:
c0deae7c:	b5e0      	push	{r5, r6, r7, lr}
c0deae7e:	2000      	movs	r0, #0
c0deae80:	4669      	mov	r1, sp
c0deae82:	9001      	str	r0, [sp, #4]
c0deae84:	4801      	ldr	r0, [pc, #4]	@ (c0deae8c <os_io_start+0x10>)
c0deae86:	f7ff ff5d 	bl	c0dead44 <SVC_Call>
c0deae8a:	bd8c      	pop	{r2, r3, r7, pc}
c0deae8c:	01000085 	.word	0x01000085

c0deae90 <os_io_tx_cmd>:
c0deae90:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deae92:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0deae96:	4803      	ldr	r0, [pc, #12]	@ (c0deaea4 <os_io_tx_cmd+0x14>)
c0deae98:	4669      	mov	r1, sp
c0deae9a:	f7ff ff53 	bl	c0dead44 <SVC_Call>
c0deae9e:	b004      	add	sp, #16
c0deaea0:	bd80      	pop	{r7, pc}
c0deaea2:	bf00      	nop
c0deaea4:	04000088 	.word	0x04000088

c0deaea8 <os_io_rx_evt>:
c0deaea8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deaeaa:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0deaeae:	4803      	ldr	r0, [pc, #12]	@ (c0deaebc <os_io_rx_evt+0x14>)
c0deaeb0:	4669      	mov	r1, sp
c0deaeb2:	f7ff ff47 	bl	c0dead44 <SVC_Call>
c0deaeb6:	b004      	add	sp, #16
c0deaeb8:	bd80      	pop	{r7, pc}
c0deaeba:	bf00      	nop
c0deaebc:	03000089 	.word	0x03000089

c0deaec0 <try_context_get>:
c0deaec0:	b5e0      	push	{r5, r6, r7, lr}
c0deaec2:	2000      	movs	r0, #0
c0deaec4:	4669      	mov	r1, sp
c0deaec6:	9001      	str	r0, [sp, #4]
c0deaec8:	2087      	movs	r0, #135	@ 0x87
c0deaeca:	f7ff ff3b 	bl	c0dead44 <SVC_Call>
c0deaece:	bd8c      	pop	{r2, r3, r7, pc}

c0deaed0 <try_context_set>:
c0deaed0:	b5e0      	push	{r5, r6, r7, lr}
c0deaed2:	f000 f81d 	bl	c0deaf10 <OUTLINED_FUNCTION_0>
c0deaed6:	4802      	ldr	r0, [pc, #8]	@ (c0deaee0 <try_context_set+0x10>)
c0deaed8:	4669      	mov	r1, sp
c0deaeda:	f7ff ff33 	bl	c0dead44 <SVC_Call>
c0deaede:	bd8c      	pop	{r2, r3, r7, pc}
c0deaee0:	0100010b 	.word	0x0100010b

c0deaee4 <os_sched_last_status>:
c0deaee4:	b5e0      	push	{r5, r6, r7, lr}
c0deaee6:	f000 f813 	bl	c0deaf10 <OUTLINED_FUNCTION_0>
c0deaeea:	4803      	ldr	r0, [pc, #12]	@ (c0deaef8 <os_sched_last_status+0x14>)
c0deaeec:	4669      	mov	r1, sp
c0deaeee:	f7ff ff29 	bl	c0dead44 <SVC_Call>
c0deaef2:	b2c0      	uxtb	r0, r0
c0deaef4:	bd8c      	pop	{r2, r3, r7, pc}
c0deaef6:	bf00      	nop
c0deaef8:	0100009c 	.word	0x0100009c

c0deaefc <touch_get_last_info>:
c0deaefc:	b5e0      	push	{r5, r6, r7, lr}
c0deaefe:	9001      	str	r0, [sp, #4]
c0deaf00:	4802      	ldr	r0, [pc, #8]	@ (c0deaf0c <touch_get_last_info+0x10>)
c0deaf02:	a901      	add	r1, sp, #4
c0deaf04:	f7ff ff1e 	bl	c0dead44 <SVC_Call>
c0deaf08:	bd8c      	pop	{r2, r3, r7, pc}
c0deaf0a:	bf00      	nop
c0deaf0c:	01fa000b 	.word	0x01fa000b

c0deaf10 <OUTLINED_FUNCTION_0>:
c0deaf10:	2100      	movs	r1, #0
c0deaf12:	e9cd 0100 	strd	r0, r1, [sp]
c0deaf16:	4770      	bx	lr

c0deaf18 <__aeabi_llsl>:
c0deaf18:	0693      	lsls	r3, r2, #26
c0deaf1a:	d408      	bmi.n	c0deaf2e <__aeabi_llsl+0x16>
c0deaf1c:	b132      	cbz	r2, c0deaf2c <__aeabi_llsl+0x14>
c0deaf1e:	f1c2 0320 	rsb	r3, r2, #32
c0deaf22:	4091      	lsls	r1, r2
c0deaf24:	fa20 f303 	lsr.w	r3, r0, r3
c0deaf28:	4090      	lsls	r0, r2
c0deaf2a:	4319      	orrs	r1, r3
c0deaf2c:	4770      	bx	lr
c0deaf2e:	f1a2 0120 	sub.w	r1, r2, #32
c0deaf32:	fa00 f101 	lsl.w	r1, r0, r1
c0deaf36:	2000      	movs	r0, #0
c0deaf38:	4770      	bx	lr
	...

c0deaf3c <__aeabi_llsr>:
c0deaf3c:	0693      	lsls	r3, r2, #26
c0deaf3e:	d408      	bmi.n	c0deaf52 <__aeabi_llsr+0x16>
c0deaf40:	b132      	cbz	r2, c0deaf50 <__aeabi_llsr+0x14>
c0deaf42:	f1c2 0320 	rsb	r3, r2, #32
c0deaf46:	40d0      	lsrs	r0, r2
c0deaf48:	fa01 f303 	lsl.w	r3, r1, r3
c0deaf4c:	40d1      	lsrs	r1, r2
c0deaf4e:	4318      	orrs	r0, r3
c0deaf50:	4770      	bx	lr
c0deaf52:	f1a2 0020 	sub.w	r0, r2, #32
c0deaf56:	fa21 f000 	lsr.w	r0, r1, r0
c0deaf5a:	2100      	movs	r1, #0
c0deaf5c:	4770      	bx	lr
	...

c0deaf60 <__udivmoddi4>:
c0deaf60:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0deaf64:	f8dd c020 	ldr.w	ip, [sp, #32]
c0deaf68:	4604      	mov	r4, r0
c0deaf6a:	b179      	cbz	r1, c0deaf8c <__udivmoddi4+0x2c>
c0deaf6c:	b1ba      	cbz	r2, c0deaf9e <__udivmoddi4+0x3e>
c0deaf6e:	b35b      	cbz	r3, c0deafc8 <__udivmoddi4+0x68>
c0deaf70:	fab1 f581 	clz	r5, r1
c0deaf74:	fab3 f683 	clz	r6, r3
c0deaf78:	1b75      	subs	r5, r6, r5
c0deaf7a:	2d20      	cmp	r5, #32
c0deaf7c:	d34a      	bcc.n	c0deb014 <__udivmoddi4+0xb4>
c0deaf7e:	f1bc 0f00 	cmp.w	ip, #0
c0deaf82:	bf18      	it	ne
c0deaf84:	e9cc 4100 	strdne	r4, r1, [ip]
c0deaf88:	2400      	movs	r4, #0
c0deaf8a:	e066      	b.n	c0deb05a <__udivmoddi4+0xfa>
c0deaf8c:	b3cb      	cbz	r3, c0deb002 <__udivmoddi4+0xa2>
c0deaf8e:	2100      	movs	r1, #0
c0deaf90:	f1bc 0f00 	cmp.w	ip, #0
c0deaf94:	bf18      	it	ne
c0deaf96:	e9cc 4100 	strdne	r4, r1, [ip]
c0deaf9a:	2400      	movs	r4, #0
c0deaf9c:	e0a6      	b.n	c0deb0ec <__udivmoddi4+0x18c>
c0deaf9e:	2b00      	cmp	r3, #0
c0deafa0:	d03e      	beq.n	c0deb020 <__udivmoddi4+0xc0>
c0deafa2:	2800      	cmp	r0, #0
c0deafa4:	d04f      	beq.n	c0deb046 <__udivmoddi4+0xe6>
c0deafa6:	1e5d      	subs	r5, r3, #1
c0deafa8:	422b      	tst	r3, r5
c0deafaa:	d158      	bne.n	c0deb05e <__udivmoddi4+0xfe>
c0deafac:	f1bc 0f00 	cmp.w	ip, #0
c0deafb0:	bf1c      	itt	ne
c0deafb2:	ea05 0001 	andne.w	r0, r5, r1
c0deafb6:	e9cc 4000 	strdne	r4, r0, [ip]
c0deafba:	fa93 f0a3 	rbit	r0, r3
c0deafbe:	fab0 f080 	clz	r0, r0
c0deafc2:	fa21 f400 	lsr.w	r4, r1, r0
c0deafc6:	e048      	b.n	c0deb05a <__udivmoddi4+0xfa>
c0deafc8:	1e55      	subs	r5, r2, #1
c0deafca:	422a      	tst	r2, r5
c0deafcc:	d129      	bne.n	c0deb022 <__udivmoddi4+0xc2>
c0deafce:	f1bc 0f00 	cmp.w	ip, #0
c0deafd2:	bf1e      	ittt	ne
c0deafd4:	2300      	movne	r3, #0
c0deafd6:	4005      	andne	r5, r0
c0deafd8:	e9cc 5300 	strdne	r5, r3, [ip]
c0deafdc:	2a01      	cmp	r2, #1
c0deafde:	f000 8085 	beq.w	c0deb0ec <__udivmoddi4+0x18c>
c0deafe2:	fa92 f2a2 	rbit	r2, r2
c0deafe6:	004c      	lsls	r4, r1, #1
c0deafe8:	fab2 f282 	clz	r2, r2
c0deafec:	f002 031f 	and.w	r3, r2, #31
c0deaff0:	40d1      	lsrs	r1, r2
c0deaff2:	40d8      	lsrs	r0, r3
c0deaff4:	231f      	movs	r3, #31
c0deaff6:	4393      	bics	r3, r2
c0deaff8:	fa04 f303 	lsl.w	r3, r4, r3
c0deaffc:	ea43 0400 	orr.w	r4, r3, r0
c0deb000:	e074      	b.n	c0deb0ec <__udivmoddi4+0x18c>
c0deb002:	fbb0 f4f2 	udiv	r4, r0, r2
c0deb006:	f1bc 0f00 	cmp.w	ip, #0
c0deb00a:	d026      	beq.n	c0deb05a <__udivmoddi4+0xfa>
c0deb00c:	fb04 0012 	mls	r0, r4, r2, r0
c0deb010:	2100      	movs	r1, #0
c0deb012:	e020      	b.n	c0deb056 <__udivmoddi4+0xf6>
c0deb014:	f105 0e01 	add.w	lr, r5, #1
c0deb018:	f1be 0f20 	cmp.w	lr, #32
c0deb01c:	d00b      	beq.n	c0deb036 <__udivmoddi4+0xd6>
c0deb01e:	e028      	b.n	c0deb072 <__udivmoddi4+0x112>
c0deb020:	e064      	b.n	c0deb0ec <__udivmoddi4+0x18c>
c0deb022:	fab1 f481 	clz	r4, r1
c0deb026:	fab2 f582 	clz	r5, r2
c0deb02a:	1b2c      	subs	r4, r5, r4
c0deb02c:	f104 0e21 	add.w	lr, r4, #33	@ 0x21
c0deb030:	f1be 0f20 	cmp.w	lr, #32
c0deb034:	d15d      	bne.n	c0deb0f2 <__udivmoddi4+0x192>
c0deb036:	f04f 0e20 	mov.w	lr, #32
c0deb03a:	f04f 0a00 	mov.w	sl, #0
c0deb03e:	f04f 0b00 	mov.w	fp, #0
c0deb042:	460e      	mov	r6, r1
c0deb044:	e021      	b.n	c0deb08a <__udivmoddi4+0x12a>
c0deb046:	fbb1 f4f3 	udiv	r4, r1, r3
c0deb04a:	f1bc 0f00 	cmp.w	ip, #0
c0deb04e:	d004      	beq.n	c0deb05a <__udivmoddi4+0xfa>
c0deb050:	2000      	movs	r0, #0
c0deb052:	fb04 1113 	mls	r1, r4, r3, r1
c0deb056:	e9cc 0100 	strd	r0, r1, [ip]
c0deb05a:	2100      	movs	r1, #0
c0deb05c:	e046      	b.n	c0deb0ec <__udivmoddi4+0x18c>
c0deb05e:	fab1 f581 	clz	r5, r1
c0deb062:	fab3 f683 	clz	r6, r3
c0deb066:	1b75      	subs	r5, r6, r5
c0deb068:	2d1f      	cmp	r5, #31
c0deb06a:	f4bf af88 	bcs.w	c0deaf7e <__udivmoddi4+0x1e>
c0deb06e:	f105 0e01 	add.w	lr, r5, #1
c0deb072:	fa20 f40e 	lsr.w	r4, r0, lr
c0deb076:	f1c5 051f 	rsb	r5, r5, #31
c0deb07a:	fa01 f605 	lsl.w	r6, r1, r5
c0deb07e:	fa21 fb0e 	lsr.w	fp, r1, lr
c0deb082:	40a8      	lsls	r0, r5
c0deb084:	f04f 0a00 	mov.w	sl, #0
c0deb088:	4326      	orrs	r6, r4
c0deb08a:	f04f 0800 	mov.w	r8, #0
c0deb08e:	f1be 0f00 	cmp.w	lr, #0
c0deb092:	d01c      	beq.n	c0deb0ce <__udivmoddi4+0x16e>
c0deb094:	ea4f 014b 	mov.w	r1, fp, lsl #1
c0deb098:	f1ae 0e01 	sub.w	lr, lr, #1
c0deb09c:	ea41 71d6 	orr.w	r1, r1, r6, lsr #31
c0deb0a0:	0076      	lsls	r6, r6, #1
c0deb0a2:	ea46 75d0 	orr.w	r5, r6, r0, lsr #31
c0deb0a6:	1aae      	subs	r6, r5, r2
c0deb0a8:	eb61 0b03 	sbc.w	fp, r1, r3
c0deb0ac:	43cf      	mvns	r7, r1
c0deb0ae:	43ec      	mvns	r4, r5
c0deb0b0:	18a4      	adds	r4, r4, r2
c0deb0b2:	eb57 0403 	adcs.w	r4, r7, r3
c0deb0b6:	bf5c      	itt	pl
c0deb0b8:	468b      	movpl	fp, r1
c0deb0ba:	462e      	movpl	r6, r5
c0deb0bc:	0040      	lsls	r0, r0, #1
c0deb0be:	0fe1      	lsrs	r1, r4, #31
c0deb0c0:	ea48 044a 	orr.w	r4, r8, sl, lsl #1
c0deb0c4:	ea40 70da 	orr.w	r0, r0, sl, lsr #31
c0deb0c8:	46a2      	mov	sl, r4
c0deb0ca:	4688      	mov	r8, r1
c0deb0cc:	e7df      	b.n	c0deb08e <__udivmoddi4+0x12e>
c0deb0ce:	ea4f 71da 	mov.w	r1, sl, lsr #31
c0deb0d2:	f1bc 0f00 	cmp.w	ip, #0
c0deb0d6:	bf18      	it	ne
c0deb0d8:	e9cc 6b00 	strdne	r6, fp, [ip]
c0deb0dc:	ea41 0140 	orr.w	r1, r1, r0, lsl #1
c0deb0e0:	ea4f 004a 	mov.w	r0, sl, lsl #1
c0deb0e4:	f020 0001 	bic.w	r0, r0, #1
c0deb0e8:	ea40 0408 	orr.w	r4, r0, r8
c0deb0ec:	4620      	mov	r0, r4
c0deb0ee:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0deb0f2:	f1be 0f1f 	cmp.w	lr, #31
c0deb0f6:	d804      	bhi.n	c0deb102 <__udivmoddi4+0x1a2>
c0deb0f8:	fa20 f40e 	lsr.w	r4, r0, lr
c0deb0fc:	f1ce 0520 	rsb	r5, lr, #32
c0deb100:	e7bb      	b.n	c0deb07a <__udivmoddi4+0x11a>
c0deb102:	f1ce 0740 	rsb	r7, lr, #64	@ 0x40
c0deb106:	f1ae 0420 	sub.w	r4, lr, #32
c0deb10a:	f04f 0b00 	mov.w	fp, #0
c0deb10e:	fa20 f504 	lsr.w	r5, r0, r4
c0deb112:	fa01 f607 	lsl.w	r6, r1, r7
c0deb116:	fa00 fa07 	lsl.w	sl, r0, r7
c0deb11a:	ea46 0805 	orr.w	r8, r6, r5
c0deb11e:	fa21 f604 	lsr.w	r6, r1, r4
c0deb122:	4640      	mov	r0, r8
c0deb124:	e7b1      	b.n	c0deb08a <__udivmoddi4+0x12a>
	...

c0deb128 <__aeabi_memcpy>:
c0deb128:	f000 b82c 	b.w	c0deb184 <memcpy>

c0deb12c <__aeabi_memmove>:
c0deb12c:	f000 b838 	b.w	c0deb1a0 <memmove>

c0deb130 <__aeabi_memset>:
c0deb130:	460b      	mov	r3, r1
c0deb132:	4611      	mov	r1, r2
c0deb134:	461a      	mov	r2, r3
c0deb136:	f000 b84d 	b.w	c0deb1d4 <memset>
c0deb13a:	bf00      	nop

c0deb13c <__aeabi_memclr>:
c0deb13c:	460a      	mov	r2, r1
c0deb13e:	2100      	movs	r1, #0
c0deb140:	f000 b848 	b.w	c0deb1d4 <memset>

c0deb144 <__aeabi_uldivmod>:
c0deb144:	b540      	push	{r6, lr}
c0deb146:	b084      	sub	sp, #16
c0deb148:	ae02      	add	r6, sp, #8
c0deb14a:	9600      	str	r6, [sp, #0]
c0deb14c:	f7ff ff08 	bl	c0deaf60 <__udivmoddi4>
c0deb150:	9a02      	ldr	r2, [sp, #8]
c0deb152:	9b03      	ldr	r3, [sp, #12]
c0deb154:	b004      	add	sp, #16
c0deb156:	bd40      	pop	{r6, pc}

c0deb158 <explicit_bzero>:
c0deb158:	f000 b800 	b.w	c0deb15c <bzero>

c0deb15c <bzero>:
c0deb15c:	460a      	mov	r2, r1
c0deb15e:	2100      	movs	r1, #0
c0deb160:	f000 b838 	b.w	c0deb1d4 <memset>

c0deb164 <memcmp>:
c0deb164:	b510      	push	{r4, lr}
c0deb166:	3901      	subs	r1, #1
c0deb168:	4402      	add	r2, r0
c0deb16a:	4290      	cmp	r0, r2
c0deb16c:	d101      	bne.n	c0deb172 <memcmp+0xe>
c0deb16e:	2000      	movs	r0, #0
c0deb170:	e005      	b.n	c0deb17e <memcmp+0x1a>
c0deb172:	7803      	ldrb	r3, [r0, #0]
c0deb174:	f811 4f01 	ldrb.w	r4, [r1, #1]!
c0deb178:	42a3      	cmp	r3, r4
c0deb17a:	d001      	beq.n	c0deb180 <memcmp+0x1c>
c0deb17c:	1b18      	subs	r0, r3, r4
c0deb17e:	bd10      	pop	{r4, pc}
c0deb180:	3001      	adds	r0, #1
c0deb182:	e7f2      	b.n	c0deb16a <memcmp+0x6>

c0deb184 <memcpy>:
c0deb184:	440a      	add	r2, r1
c0deb186:	4291      	cmp	r1, r2
c0deb188:	f100 33ff 	add.w	r3, r0, #4294967295	@ 0xffffffff
c0deb18c:	d100      	bne.n	c0deb190 <memcpy+0xc>
c0deb18e:	4770      	bx	lr
c0deb190:	b510      	push	{r4, lr}
c0deb192:	f811 4b01 	ldrb.w	r4, [r1], #1
c0deb196:	4291      	cmp	r1, r2
c0deb198:	f803 4f01 	strb.w	r4, [r3, #1]!
c0deb19c:	d1f9      	bne.n	c0deb192 <memcpy+0xe>
c0deb19e:	bd10      	pop	{r4, pc}

c0deb1a0 <memmove>:
c0deb1a0:	4288      	cmp	r0, r1
c0deb1a2:	b510      	push	{r4, lr}
c0deb1a4:	eb01 0402 	add.w	r4, r1, r2
c0deb1a8:	d902      	bls.n	c0deb1b0 <memmove+0x10>
c0deb1aa:	4284      	cmp	r4, r0
c0deb1ac:	4623      	mov	r3, r4
c0deb1ae:	d807      	bhi.n	c0deb1c0 <memmove+0x20>
c0deb1b0:	1e43      	subs	r3, r0, #1
c0deb1b2:	42a1      	cmp	r1, r4
c0deb1b4:	d008      	beq.n	c0deb1c8 <memmove+0x28>
c0deb1b6:	f811 2b01 	ldrb.w	r2, [r1], #1
c0deb1ba:	f803 2f01 	strb.w	r2, [r3, #1]!
c0deb1be:	e7f8      	b.n	c0deb1b2 <memmove+0x12>
c0deb1c0:	4601      	mov	r1, r0
c0deb1c2:	4402      	add	r2, r0
c0deb1c4:	428a      	cmp	r2, r1
c0deb1c6:	d100      	bne.n	c0deb1ca <memmove+0x2a>
c0deb1c8:	bd10      	pop	{r4, pc}
c0deb1ca:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
c0deb1ce:	f802 4d01 	strb.w	r4, [r2, #-1]!
c0deb1d2:	e7f7      	b.n	c0deb1c4 <memmove+0x24>

c0deb1d4 <memset>:
c0deb1d4:	4603      	mov	r3, r0
c0deb1d6:	4402      	add	r2, r0
c0deb1d8:	4293      	cmp	r3, r2
c0deb1da:	d100      	bne.n	c0deb1de <memset+0xa>
c0deb1dc:	4770      	bx	lr
c0deb1de:	f803 1b01 	strb.w	r1, [r3], #1
c0deb1e2:	e7f9      	b.n	c0deb1d8 <memset+0x4>

c0deb1e4 <setjmp>:
c0deb1e4:	46ec      	mov	ip, sp
c0deb1e6:	e8a0 5ff0 	stmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
c0deb1ea:	f04f 0000 	mov.w	r0, #0
c0deb1ee:	4770      	bx	lr

c0deb1f0 <longjmp>:
c0deb1f0:	e8b0 5ff0 	ldmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
c0deb1f4:	46e5      	mov	sp, ip
c0deb1f6:	0008      	movs	r0, r1
c0deb1f8:	bf08      	it	eq
c0deb1fa:	2001      	moveq	r0, #1
c0deb1fc:	4770      	bx	lr
c0deb1fe:	bf00      	nop

c0deb200 <strcmp>:
c0deb200:	f810 2b01 	ldrb.w	r2, [r0], #1
c0deb204:	f811 3b01 	ldrb.w	r3, [r1], #1
c0deb208:	2a01      	cmp	r2, #1
c0deb20a:	bf28      	it	cs
c0deb20c:	429a      	cmpcs	r2, r3
c0deb20e:	d0f7      	beq.n	c0deb200 <strcmp>
c0deb210:	1ad0      	subs	r0, r2, r3
c0deb212:	4770      	bx	lr

c0deb214 <strlen>:
c0deb214:	4603      	mov	r3, r0
c0deb216:	f813 2b01 	ldrb.w	r2, [r3], #1
c0deb21a:	2a00      	cmp	r2, #0
c0deb21c:	d1fb      	bne.n	c0deb216 <strlen+0x2>
c0deb21e:	1a18      	subs	r0, r3, r0
c0deb220:	3801      	subs	r0, #1
c0deb222:	4770      	bx	lr

c0deb224 <strncpy>:
c0deb224:	4603      	mov	r3, r0
c0deb226:	b510      	push	{r4, lr}
c0deb228:	3901      	subs	r1, #1
c0deb22a:	b132      	cbz	r2, c0deb23a <strncpy+0x16>
c0deb22c:	f811 4f01 	ldrb.w	r4, [r1, #1]!
c0deb230:	3a01      	subs	r2, #1
c0deb232:	f803 4b01 	strb.w	r4, [r3], #1
c0deb236:	2c00      	cmp	r4, #0
c0deb238:	d1f7      	bne.n	c0deb22a <strncpy+0x6>
c0deb23a:	2100      	movs	r1, #0
c0deb23c:	441a      	add	r2, r3
c0deb23e:	4293      	cmp	r3, r2
c0deb240:	d100      	bne.n	c0deb244 <strncpy+0x20>
c0deb242:	bd10      	pop	{r4, pc}
c0deb244:	f803 1b01 	strb.w	r1, [r3], #1
c0deb248:	e7f9      	b.n	c0deb23e <strncpy+0x1a>

c0deb24a <C_app_zknox_64px_bitmap>:
c0deb24a:	0040 0040 8922 0002 ffff ffff ffff ffff     @.@."...........
c0deb25a:	ffff ffff 0ed7 f55d a39d 3010 8311 f0ad     ......]....0....
c0deb26a:	030b 0110 0070 4c81 0dec 2005 0001 7031     ....p..L... ..1p
c0deb27a:	0d04 0be9 7231 5011 0a01 99e7 2001 7223     ....1r.P..... #r
c0deb28a:	1102 8140 e47e 1287 4315 2162 0450 e20e     ..@.~....Cb!P...
c0deb29a:	13b8 4065 5263 4031 e106 13ab 1485 0373     ..e@cR1@......s.
c0deb2aa:	2142 0750 addf 6513 5364 2142 0b50 96de     B!P....edSB!P...
c0deb2ba:	6027 0474 5243 4021 0d01 9bdc 8015 5325     '`t.CR!@......%S
c0deb2ca:	4304 3152 0640 b6dc 6549 b530 a989 0680     .CR1@...Ie0.....
c0deb2da:	4312 3142 0140 da0d 010c 8417 c57c c79e     .CB1@.......|...
c0deb2ea:	3310 4142 0540 a8da 4b48 8ec9 33a4 4132     .3BA@...HK...32A
c0deb2fa:	0140 c60e cd4e 7691 ccc0 330b 1122 3182     @...N..v...3"..1
c0deb30a:	0b60 0bc5 0231 9dcc c026 09ce 1302 0422     `...1...&.....".
c0deb31a:	1c0a 728b 0540 0bc5 0130 8bcc c748 c51e     ...r@...0...H...
c0deb32a:	060e 1213 0d04 ad1e a2ed 1440 c10d 030e     ..........@.....
c0deb33a:	0130 88cc c55d 68bc b075 09c4 1302 ce92     0...]..hu.......
c0deb34a:	13a0 ed9a 1090 1a08 6489 0617 0140 cb0c     .........d..@...
c0deb35a:	c515 080d 9d1e d0c6 0dc3 8623 31ed dc8c     ..........#..1..
c0deb36a:	0a15 0c1d 150b 8364 ca2d 0a02 06c5 c20e     ......d.-.......
c0deb37a:	b68e 0ec3 1305 ca88 0931 4d1e 3b6c 319a     ........1..Ml;.1
c0deb38a:	c9b0 0d04 0ec4 c407 040c 08c4 0113 0210     ................
c0deb39a:	0821 7d2e 6c0d 0308 07ca c40d 060e 0cc4     !..}.l..........
c0deb3aa:	c405 23ba 705a 0931 2d2e 1d0e 2d4c a39c     ...#Zp1..-..L-..
c0deb3ba:	cad0 0c08 08c5 c30c 0b09 bcc4 4e23 b5d0     ............#N..
c0deb3ca:	3d01 0ce0 b220 d66e ab70 9858 0419 cb0d     .=.. .n.p.X.....
c0deb3da:	c01a c30e 5a8e 081d c509 060e 8912 1afd     .....Z..........
c0deb3ea:	edad 1061 39aa c183 49be 30b7 cc07 7f8c     ..a..9...I.0....
c0deb3fa:	c22e a8ae c79c 220b 3e09 818d 8710 1dc4     .......".>......
c0deb40a:	c20e 6b87 ce18 5e02 0eca 8ec1 1281 1a06     ...k...^........
c0deb41a:	4189 0610 190c b7c4 b516 ceb0 cf86 8f3e     .A............>.
c0deb42a:	1eef 3ec4 d89f 5120 a810 6ddc bbc4 a19c     ...>.. Q...m....
c0deb43a:	cec0 6f8a 7e7e 8b4e 2062 6c81 0b1d c505     ...o~~N.b .l....
c0deb44a:	8abb d091 01cf 7e0d 5e7e 0c0d 3d2a 6b8c     .......~~^..*=.k
c0deb45a:	0dc5 d039 7f8a 7e7e 2e7e 0a2d dd05 0c01     ..9...~~~.-.....
c0deb46a:	7e7e 0e7e 8c3d dd5d 040b 7e7e 0e7e 8c2d     ~~~.=.]...~~~.-.
c0deb47a:	df7a 0807 7e7e 3d6e 0609 8ee0 7e39 5e7e     z...~~n=....9~~^
c0deb48a:	0a2d e206 398e 7e7e 2d3e 0609 8ee4 7e38     -....9~~>-....8~
c0deb49a:	0e7e 083d e607 76be e0cf 7e0d 0e0d 9e2d     ~.=....v...~..-.
c0deb4aa:	90b5 aae9 df29 7d1e 0c1e 0e17 beeb 6b80     ....)..}.......k
c0deb4ba:	0ed0 4ec0 a5ad f03c 72ab 1836 52b7 d039     ...N..<..r6..R9.
c0deb4ca:	1df5 1a0b 0e0d ffff ffff ffff ffff ffff     ................
c0deb4da:	                                             .

c0deb4db <C_app_zknox_64px>:
c0deb4db:	0040 0040 0102 b24a c0de                    @.@...J...

c0deb4e5 <C_Check_Circle_64px_bitmap>:
c0deb4e5:	0040 0040 3321 0002 0231 8b1f 0008 0000     @.@.!3..1.......
c0deb4f5:	0000 0302 55ad 4e39 3103 fd14 6124 4b5f     .....U9N.1..$a_K
c0deb505:	8028 a091 2401 b888 4640 2054 4121 3949     (....$..@FT !AI9
c0deb515:	152d 00dc a090 1166 05a2 0171 1710 0a48     -.....f...q...H.
c0deb525:	026a 6017 41ab 8961 2404 9f21 65ef be66     j..`.Aa..$!..ef.
c0deb535:	0e3d c48b 9914 9fb1 fcfd fcfc 8cf3 7ff8     =...............
c0deb545:	f54f 1a60 7460 d8a9 de00 fd04 95cc 681c     O.`.`t.........h
c0deb555:	87cd c9e8 bf14 0185 7952 ae0b 301b 8b40     ........Ry...0@.
c0deb565:	c4b5 9cae 7cb5 f88d e070 ef89 0371 137e     .....|..p...q.~.
c0deb575:	fd5d 4e7a 4f7d d6b4 9e38 8ea5 b8f9 4c79     ].zN}O..8.....yL
c0deb585:	34cd e15b da9e 7c13 18bc 1930 a38b 5b15     .4[....|..0....[
c0deb595:	b94d a901 5a89 34af d0fa fbd4 5d41 b0b9     M....Z.4....A]..
c0deb5a5:	0ab1 6830 71fb 5315 0056 6e9a fc6c 2fb3     ..0h.q.SV..nl../
c0deb5b5:	24e2 dd75 bf49 012f d486 1057 ac8e 0a5a     .$u.I./...W...Z.
c0deb5c5:	aa32 dc97 5d54 3947 803e c954 7a63 b709     2...T]G9>.T.cz..
c0deb5d5:	815a c734 7fa9 bc41 000b 6a27 db3a e292     Z.4...A...'j:...
c0deb5e5:	12ed 3f6f 8274 64b6 f810 4052 a01d de23     ..o?t..d..R@..#.
c0deb5f5:	2712 6220 73a5 9d0a cf04 db00 e588 5bd8     .' b.s.........[
c0deb605:	e08b 0a5d 027c a128 8093 ee56 ab15 0ca4     ..].|.(...V.....
c0deb615:	1953 0781 889d a1eb 493b 0082 11da c517     S.......;I......
c0deb625:	9b8f 4760 f54c 0b95 822e f14b 41ed 360f     ..`GL.....K..A.6
c0deb635:	b820 d215 48a4 c137 3093 c2c8 8139 e70b      ....H7..0..9...
c0deb645:	4e04 105c 30ac d4dc 08a7 9856 acbe 7c5d     .N\..0....V...]|
c0deb655:	5e31 0710 701c 347f 5aff 4fe8 36b3 adc9     1^...p.4.Z.O.6..
c0deb665:	802f c436 7653 d63e 3cfe 2d61 5f3f ba73     /.6.Sv>..<a-?_s.
c0deb675:	df3a acb2 d712 0ff4 1f59 2554 6ec3 5f7b     :.......Y.T%.n{_
c0deb685:	6554 3b01 e340 8e78 cad4 febe e91f 4c92     Te.;@.x........L
c0deb695:	f2b3 e8c9 ce32 92b3 a68c 3457 3971 702e     ....2.....W4q9.p
c0deb6a5:	b6aa 0f34 d91d e35f f2e1 639e a7d5 fd79     ..4..._....c..y.
c0deb6b5:	ba44 dde8 6369 1aef c3e5 3464 9dd2 272f     D...ic....d4../'
c0deb6c5:	cbbf 1fa7 8df3 b09c 9b03 5328 2325 8d5f     ..........(S%#_.
c0deb6d5:	3ec0 f233 eb15 7359 39c0 5158 f322 2c7d     .>3...Ys.9XQ".},
c0deb6e5:	f7cc 448d cbbe a6c0 e1fb f102 dd51 030f     ...D........Q...
c0deb6f5:	0898 fe6c ec64 ac2b 19ea f170 f7af 2d1b     ..l.d.+...p....-
c0deb705:	1fb1 b3c2 2e0d dad0 0cd6 c8c0 fe72 af1f     ............r...
c0deb715:	fc6c 2402 5a14 00c5 0008                     l..$.Z.....

c0deb720 <C_Check_Circle_64px>:
c0deb720:	0040 0040 0102 b4e5 c0de                    @.@.......

c0deb72a <C_Denied_Circle_64px_bitmap>:
c0deb72a:	0040 0040 3021 0002 022e 8b1f 0008 0000     @.@.!0..........
c0deb73a:	0000 0302 55ad 2f4b 4104 2e10 bd6b 479f     .....UK/.A..k..G
c0deb74a:	d80e 4884 ac90 3f8d e260 2244 e8e1 71b8     ...H...?`.D"...q
c0deb75a:	e273 201f ece1 7111 fe25 f100 d607 d9c1     s.. ...q%.......
c0deb76a:	07f2 e63c d64c e363 a6b9 f554 a663 67a7     ..<.L.c...T.c..g
c0deb77a:	9766 1f44 b676 babb beaa eafe 6aeb ffc4     f.D.v........j..
c0deb78a:	5f1b 13fb 4300 c50b f304 a806 5331 b18a     ._...C......1S..
c0deb79a:	1c56 47f0 58ba 0cd5 2a90 6658 642f 6806     V..G.X...*Xf/d.h
c0deb7aa:	52b4 08ec a5af c46b fdfb ff0c 0d1f df99     .R....k.........
c0deb7ba:	a978 f947 bb78 5b3c ed35 5a39 0d98 47a6     x.G.x.<[5.9Z...G
c0deb7ca:	ad34 3237 34b8 331f f3f7 6c86 8e00 3632     4.72.4.3...l..26
c0deb7da:	e185 09e6 3f8d a17b 07dd bc61 b41f a934     .....?{...a...4.
c0deb7ea:	2b27 7d00 1f36 4157 4fc8 ba80 db1b ddfe     '+.}6.WA.O......
c0deb7fa:	c7ed 7424 511d 2fbe fa01 bfe5 247c 42bb     ..$t.Q./....|$.B
c0deb80a:	9690 2555 e336 49ca 44a8 9e99 a3cd 831a     ..U%6..I.D......
c0deb81a:	e7d6 7bf8 7006 0f2c a96d a005 bf9d 668e     ...{.p,.m......f
c0deb82a:	5162 3ff3 bf2c 008e 01e0 8ab4 abe9 e34e     bQ.?,.........N.
c0deb83a:	32c2 c0aa e712 3ab8 aa46 d8a4 7896 009f     .2.....:F....x..
c0deb84a:	10b6 facb 1974 9385 90e8 df1b c005 8047     ....t.........G.
c0deb85a:	1a12 9eeb c7de bb99 4b38 a82a d662 e770     ........8K*.b.p.
c0deb86a:	6d88 6b88 3b3e 12c2 33b8 16a2 79c4 09fe     .m.k>;...3...y..
c0deb87a:	1802 b8ee aecd 648e 0741 dc30 44a9 9cf5     .......dA.0..D..
c0deb88a:	d3a4 91d4 8ee1 0cb7 804d 7434 1468 91e3     ........M.4th...
c0deb89a:	3209 1ced 7020 bbff 2e3d 2d7e b97c 7c40     .2.. p..=.~-|.@|
c0deb8aa:	f9f6 b8ce f9c0 fc6a 2834 9292 6df8 3c46     ......j.4(...mF<
c0deb8ba:	56a9 f69f f5da 0b2d 1895 aeeb 9abe 421f     .V....-........B
c0deb8ca:	a41f 8192 7d78 4b3d 2965 4719 79f5 3328     ....x}=Ke).G.y(3
c0deb8da:	ea3b 451e 9df4 0691 b192 cdd5 fa4a 8b5a     ;..E........J.Z.
c0deb8ea:	65c0 702d b86b bd6a 3762 9f17 151d 49d7     .e-pk.j.b7.....I
c0deb8fa:	dfba d88a a4bb 90fe 77f5 f7c6 e397 f5df     .........w......
c0deb90a:	9aa7 8dfd a6af b0d5 4257 7442 86ed 1a7d     ........WBBt..}.
c0deb91a:	21d2 b97a 86f0 ee73 91cf 3efe f9a2 8f5f     .!z...s....>.._.
c0deb92a:	77f4 b0d1 7de9 40b8 907c 43ef 462f b61a     .w...}.@|..C/F..
c0deb93a:	d239 13f6 95f6 9909 7f8b df7d c528 369e     9.........}.(..6
c0deb94a:	274f a03c cd95 8029 a5c1 3fc2 d93e 03f8     O'<...)....?>...
c0deb95a:	a770 8485 0800 0000                         p.......

c0deb962 <C_Denied_Circle_64px>:
c0deb962:	0040 0040 0102 b72a c0de                    @.@...*...

c0deb96c <C_Important_Circle_64px_bitmap>:
c0deb96c:	0040 0040 fa21 0001 01f8 8b1f 0008 0000     @.@.!...........
c0deb97c:	0000 0302 55b5 4ecd 40c2 1e10 fea1 cfe3     .....U.N.@......
c0deb98c:	0f51 892a d45e 8904 602f 49e3 1313 7a3c     Q.*.^.../`.I..<z
c0deb99c:	cae4 37cd 1350 a33d 70c6 f8d5 1802 005f     ...7P.=..p...._.
c0deb9ac:	9e0f 5f05 1fc0 1ace 4910 c054 b38e b6ed     ..._.....IT.....
c0deb9bc:	db74 d059 e704 76d0 dbf6 7cee 76fd 2dfa     t.Y....v...|.v.-
c0deb9cc:	ef62 99a2 055b d858 6a29 43e0 b190 6159     b...[.X.)j.C..Ya
c0deb9dc:	96d0 5e09 c518 308e a440 8010 052d 1806     ...^...0@...-...
c0deb9ec:	9408 b138 cadf 203c e4be e2e2 4979 3f81     ..8...< ....yI.?
c0deb9fc:	d0c4 7c94 3ac7 d915 1f9e d24f 56c0 bd3b     ...|.:....O..V;.
c0deba0c:	34a4 abea a650 d97c 5f3f 484c c9b4 c551     .4..P.|.?_LH..Q.
c0deba1c:	9541 9a6e 78d8 3bd9 3ecd f957 d17e 9ad0     A.n..x.;.>W.~...
c0deba2c:	ec9b cc02 f504 6fb8 d92f e800 0c7b dfe2     .......o/...{...
c0deba3c:	de93 c49a 2c6e 77ac 6009 79d6 874a 4baa     ....n,.w.`.yJ..K
c0deba4c:	8606 abb3 26a4 9db7 cac4 a6de ff9a 7d53     .....&........S}
c0deba5c:	e341 7129 01bf b3c8 02dd 1310 d377 84a7     A.)q........w...
c0deba6c:	a612 c04d 1802 71e1 d85a b9e1 e3c2 006f     ..M....qZ.....o.
c0deba7c:	c459 fb3a 2275 6d3e 5582 0a80 538f 09e5     Y.:.u">m.U...S..
c0deba8c:	2551 eba2 38f7 228c f3ee 38ea 0ec2 6e23     Q%...8."...8..#n
c0deba9c:	0b8b c71f 55e2 51d3 8b81 4412 9145 3b71     .....U.Q...DE.q;
c0debaac:	f769 20b6 159e 4f43 9a82 924d abc7 a042     i.. ..CO..M...B.
c0debabc:	c6ff f1bb 724b e7cd a06e 4521 e9d2 2fd3     ....Kr..n.!E.../
c0debacc:	d245 3be9 7884 69d5 627f f7dd 2eb7 b2c9     E..;.x.i.b......
c0debadc:	407f eeca 3992 af1e 9d39 ba05 bc0d 2a70     .@...9..9.....p*
c0debaec:	f29b 623f 19e8 8db2 1c0b 90dc d70b 0d35     ..?b..........5.
c0debafc:	965e ade3 b9a0 ea78 75c8 dd4d 2dff 7d85     ^.....x..uM..-.}
c0debb0c:	f9d6 c243 c99b 4bfb 77fe d4fe dfd5 8948     ..C....K.w....H.
c0debb1c:	61a0 92d3 8a91 afe2 618a 2b5f 8afe 5256     .a.......a_+..VR
c0debb2c:	709d fc2b e439 8bef bfae 841f ddfc 6c36     .p+.9.........6l
c0debb3c:	1f3a 10ee 9d5f 61f3 431a ed86 230f 53d8     :..._..a.C...#.S
c0debb4c:	b8cd 1702 7aff 51be 3389 de17 f4d0 eb73     .....z.Q.3....s.
c0debb5c:	1d68 3e60 e853 91e1 3f8d c10e e439 0800     h.`>S....?..9...
	...

c0debb6e <C_Important_Circle_64px>:
c0debb6e:	0040 0040 0102 b96c c0de                    @.@...l...

c0debb78 <C_Warning_64px_bitmap>:
c0debb78:	0040 0040 5f21 0001 015d 8b1f 0008 0000     @.@.!_..].......
c0debb88:	0000 0302 d585 4e31 40c3 0510 8dd0 0885     ......1N.@......
c0debb98:	454a 9149 25c2 52b2 08e4 4039 19c4 8272     JEI..%.R..9@..r.
c0debba8:	815c 0384 b880 c441 7205 0a04 e7d2 6908     \.....A..r.....i
c0debbb8:	a202 a50b a113 ec1d 5d99 f6b3 1fee fb6f     .........]....o.
c0debbc8:	96c6 febc 4333 4f84 27b9 5ced ebf2 c293     ....3C.O.'.\....
c0debbd8:	53bf 2663 cf0a 318c 9d23 5bb1 e866 5176     .Sc&...1#..[f.vQ
c0debbe8:	60e1 7d06 3f5d b8fc ce41 24bc cce4 4273     .`.}]?..A..$..sB
c0debbf8:	eafe f818 e79b efb4 966a 4b7b 7339 c841     ........j.{K9sA.
c0debc08:	ef99 f908 e431 bfd8 1c5a 7979 f15b 9090     ....1...Z.yy[...
c0debc18:	8733 6891 f33b 1855 96a9 239f f96e 8f25     3..h;.U....#n.%.
c0debc28:	7438 4b8e c9d6 bfeb 6f0b 3809 e0f3 8085     8t.K.....o.8....
c0debc38:	34db 977b c5b0 5dec 46c2 5dc8 90d8 9baf     .4{....].F.]....
c0debc48:	94b8 9fc6 fa1b 4631 36dc 7d8c ba4e 3d17     ......1F.6.}N..=
c0debc58:	bdae e25f c4bc 9f6e eff4 eb93 164b f784     .._...n.....K...
c0debc68:	2a9b fe68 5d4f 3d90 7743 5b05 7de8 70f9     .*h.O].=Cw.[.}.p
c0debc78:	ebf1 4416 ccf9 a1de 00bb a01f 39d3 b4ef     ...D.........9..
c0debc88:	b74f bebf fef5 ed72 141b fba4 787b 2e82     O.....r.....{x..
c0debc98:	f705 e9d8 1833 c93f f4f9 cfa1 9727 0297     ....3.?.....'...
c0debca8:	14bb b04c c14b 7603 89f2 6e43 fa57 f77c     ..L.K..v..CnW.|.
c0debcb8:	db89 fbe8 4cc5 fd95 50b4 93f7 605f 6523     .....L...P.._`#e
c0debcc8:	e63f 73ba c6a0 fb3d f499 5e05 cbcd e43f     ?..s..=....^..?.
c0debcd8:	7b2a 0024 0008                               *{$....

c0debcdf <C_Warning_64px>:
c0debcdf:	0040 0040 0102 bb78 c0de                    @.@...x...

c0debce9 <C_Back_40px_bitmap>:
c0debce9:	0028 0028 8c21 0000 008a 8b1f 0008 0000     (.(.!...........
c0debcf9:	0000 0302 d3ed 09cd 20c0 800c d0d1 0e53     ......... ....S.
c0debd09:	a21d 39a3 364a 9570 d26e c46d c143 c7e6     ...9J6p.n.m.C...
c0debd19:	a8d6 73d0 f50f e110 81e3 b010 9794 f843     ...s..........C.
c0debd29:	efb7 c3b6 53b7 4667 28df dcca b621 6196     .....SgF.(..!..a
c0debd39:	2b95 b601 0646 d04a 5b5b fa86 4192 376d     .+..F.J.[[...Am7
c0debd49:	50ab c3da 942a 98d6 6e41 198e e6e4 4299     .P..*...An.....B
c0debd59:	8ec2 2429 99ec 6dc0 6181 0933 c4f8 5561     ..)$...m.a3...aU
c0debd69:	6001 605a 199a 7c43 01fb 02e5 04e6 e43a     .`Z`..C|......:.
c0debd79:	0320 0000                                    ...

c0debd7d <C_Back_40px>:
c0debd7d:	0028 0028 0102 bce9 c0de                    (.(.......

c0debd87 <C_Check_40px_bitmap>:
c0debd87:	0028 0028 5401 0000 0052 8b1f 0008 0000     (.(..T..R.......
c0debd97:	0000 0302 6063 05c0 4078 1c84 9088 1307     ....c`..x@......
c0debda7:	400d ff82 9000 7f60 2400 3f98 0900 1fc6     .@....`..$.?....
c0debdb7:	9920 203f 0ea2 d844 57e3 2608 602a b02c      .? ..D..W.&*`,.
c0debdc7:	5818 ac16 ac0e ac03 1ed7 5e6e 5c0d 0183     .X........n^.\..
c0debdd7:	0103 0000 8363 77dc 00c8 0000               ....c..w....

c0debde3 <C_Check_40px>:
c0debde3:	0028 0028 0100 bd87 c0de                    (.(.......

c0debded <C_Chevron_40px_bitmap>:
c0debded:	0028 0028 5c22 0000 ffff ffff ffff ffff     (.(."\..........
c0debdfd:	1cda 03e4 0310 03e2 0330 03e0 0350 03de     ........0...P...
c0debe0d:	1820 0320 03dc 0820 08c1 0320 03da 0820      . ... ... ... .
c0debe1d:	08c3 0320 03d8 0820 08c5 0320 03d6 0820     .. ... ... ... .
c0debe2d:	08c7 0320 05d4 0820 08c9 0520 9ed3 8020     .. ... ... ... .
c0debe3d:	98cb e002 0ed4 cd09 0e09 ffff ffff ffff     ................
c0debe4d:	ffff e2ff                                   ....

c0debe51 <C_Chevron_40px>:
c0debe51:	0028 0028 0102 bded c0de                    (.(.......

c0debe5b <C_Chevron_Back_40px_bitmap>:
c0debe5b:	0028 0028 7621 0000 0074 8b1f 0008 0000     (.(.!v..t.......
c0debe6b:	0000 0302 d2ed 0dc1 3080 0508 8e50 383d     .........0..P.=8
c0debe7b:	a3a4 41b0 7157 6e93 3863 d498 1042 eb7e     ...AWq.nc8..B.~.
c0debe8b:	4606 340e bfe5 0b84 ffbd aa35 e7e1 2eb2     .F.4......5.....
c0debe9b:	6705 b55c 541f 2473 e9b4 1273 7640 27b0     .g\..Ts$..s.@v.'
c0debeab:	2794 c807 0711 4c94 3203 73ac b828 21cd     .'.....L.2.s(..!
c0debebb:	8732 7313 3338 0b83 b833 8532 532b 62f8     2..s83..3.2.+S.b
c0debecb:	9603 1dcf 0dc6 8ef2 7343 0320 0000          ........Cs ...

c0debed9 <C_Chevron_Back_40px>:
c0debed9:	0028 0028 0102 be5b c0de                    (.(...[...

c0debee3 <C_Chevron_Next_40px_bitmap>:
c0debee3:	0028 0028 7121 0000 006f 8b1f 0008 0000     (.(.!q..o.......
c0debef3:	0000 0302 ceed 0dbb 3080 450c 5751 0a51     .........0.EQWQ.
c0debf03:	cc86 ac06 0d90 0918 42a6 1448 c48f 8e44     .........BH...D.
c0debf13:	1b3f 6e20 74f9 1964 58f8 8735 22e9 02da     ?. n.td..X5.."..
c0debf23:	ca23 a581 61e2 f5a5 b074 c031 c6c1 0b00     #....a..t.1.....
c0debf33:	3999 ccc8 c1c2 1c0c 434c 0a61 9b0a 3150     .9......LCa...P1
c0debf43:	c781 1d64 ec2e fe92 bcbe 7707 ddbd ebf8     ..d........w....
c0debf53:	383d be09 209b 0003                          =8... ...

c0debf5c <C_Chevron_Next_40px>:
c0debf5c:	0028 0028 0102 bee3 c0de                    (.(.......

c0debf66 <C_Close_40px_bitmap>:
c0debf66:	0028 0028 8521 0000 0083 8b1f 0008 0000     (.(.!...........
c0debf76:	0000 0302 fffb c07f bfc0 08f9 cff6 10f7     ................
c0debf86:	11fa 4207 41ac 420f 604f 87e8 fd09 e060     ...B.A.BO`....`.
c0debf96:	3184 0ae0 e01b 70d2 9216 9c2c 5089 6706     .1.....p..,..P.g
c0debfa6:	2923 7383 9590 7941 ca28 5ca0 6554 3e60     #).s..Ay(..\Te`>
c0debfb6:	329a 42b0 6574 8520 cae8 0a40 9431 1561     .2.Bte ...@.1.a.
c0debfc6:	a2c3 9b17 581d 82dc cdcd fc58 2d86 b00c     .....X....X..-..
c0debfd6:	1584 30b6 12c5 d8f6 08e2 5c5b 8b62 6c73     ...0......[\b.sl
c0debfe6:	6369 0040 b400 b40b 2014 0003                ic@...... ...

c0debff3 <C_Close_40px>:
c0debff3:	0028 0028 0102 bf66 c0de                    (.(...f...

c0debffd <C_Info_40px_bitmap>:
c0debffd:	0028 0028 3121 0000 002f 8b1f 0008 0000     (.(.!1../.......
c0dec00d:	0000 0302 fffb 147f 0bd0 f030 67ff 0180     ..........0..g..
c0dec01d:	2a7e 7189 5a60 80d3 ec45 cf57 f068 0593     ~*.q`Z..E.W.h...
c0dec02d:	d900 c99e 2019 0003                          ..... ...

c0dec036 <C_Info_40px>:
c0dec036:	0028 0028 0102 bffd c0de                    (.(.......

c0dec040 <C_Mini_Push_40px_bitmap>:
c0dec040:	0028 0028 ce21 0000 00cc 8b1f 0008 0000     (.(.!...........
c0dec050:	0000 0302 936d 0dcd 30c2 460c 2123 4ea4     ....m....0.F#!.N
c0dec060:	ba83 2b01 5230 6037 4604 0762 b006 5c0f     ...+0R7`.Fb....\
c0dec070:	4240 4936 2f9c f6bf c9a5 b3d3 3913 aaae     @B6I./.......9..
c0dec080:	1085 0eb1 4911 1e0a 7710 829f 6ab0 5a90     .....I...w...j.Z
c0dec090:	9606 3ac2 08a7 a7f5 a2d1 4761 b5e3 d168     ...:......aG..h.
c0dec0a0:	2f6c 053a a92f f019 a4cc fb95 6b3d cac1     l/:./.......=k..
c0dec0b0:	53f6 6563 0ef5 8ae1 c043 10f6 3220 db41     .Sce....C... 2A.
c0dec0c0:	880e d044 1fee 8588 4d45 6215 5161 8553     ..D.....EM.baQS.
c0dec0d0:	2c68 556b 7634 5a4b cf12 e599 bcbb ab36     h,kU4vKZ......6.
c0dec0e0:	5c7e fdda 61e4 cbec d6c6 b81e ebcc db95     ~\...a..........
c0dec0f0:	af53 def7 791b e96f f9be 9628 eac9 b147     S....yo...(...G.
c0dec100:	3926 e6b3 a4ce bb37 8cee ff4f 1fc2 8764     &9....7...O...d.
c0dec110:	9d98 0320 0000                              .. ...

c0dec116 <C_Mini_Push_40px>:
c0dec116:	0028 0028 0102 c040 c0de                    (.(...@...

c0dec120 <C_Privacy_40px_bitmap>:
c0dec120:	0028 0028 ac21 0001 01aa 8b1f 0008 0000     (.(.!...........
c0dec130:	0000 0302 927d 4bbf 50c3 c710 e9af 8b4f     ....}..K.P....O.
c0dec140:	1768 0741 b335 fe88 6609 1d28 2c44 1fe2     h.A.5....f(.D,..
c0dec150:	2ea0 cdd2 2e0a 6082 a45c b4b8 0ff8 4418     .......`\......D
c0dec160:	1c50 b3b4 dd28 60a5 8777 38a2 10e9 b56b     P...(..`w..8..k.
c0dec170:	dac6 bce6 97bb 2da6 378a 25e4 f79f f7de     .......-.7.%....
c0dec180:	77be c439 a3bf ba75 ca9e f75c 26a1 8448     .w9...u...\..&H.
c0dec190:	7a2e 23d8 b178 1f40 5e4e 6ad8 7320 7b7e     .z.#x.@.N^.j s~{
c0dec1a0:	4cb6 1a70 8cd1 7231 2e21 cf5b 8c06 03a3     .Lp...1r!.[.....
c0dec1b0:	1ac2 a730 dc34 2ab5 4166 beee c941 6e97     ..0.4..*fA..A..n
c0dec1c0:	63a8 6968 74dd d859 d595 fb88 81c8 5288     .chi.tY........R
c0dec1d0:	2181 90c9 a1bb 74a4 16cc 69c7 9e7a 9390     .!.....t...iz...
c0dec1e0:	4e29 1eda d913 c423 f127 53ac 07d2 22a8     )N....#.'..S..."
c0dec1f0:	e1d6 5d0e 461d 4b72 49c0 30eb f88b 880a     ...].FrK.I.0....
c0dec200:	10ef 6125 8d93 09ba a8da c904 5c0e 328a     ..%a.........\.2
c0dec210:	283b 1004 218b 5d44 cd39 2bd2 c9dd 15a3     ;(...!D]9..+....
c0dec220:	36c1 084c 01ab 6919 24c1 e237 561b 7d84     .6L....i.$7..V.}
c0dec230:	8488 c031 51cc 7b85 216b 9bf4 c259 fe9a     ..1..Q.{k!..Y...
c0dec240:	92dd 9faa b872 cb24 3521 a8b4 62fe b698     ....r.$.!5...b..
c0dec250:	c2a2 4d4c 6cbc 4560 f7eb 916c 5521 cc5b     ..LM.l`E..l.!U[.
c0dec260:	86e6 8752 3d5c adc2 7bf7 d9a0 a6dc be99     ..R.\=...{......
c0dec270:	2d5e 26b2 a8cb 1e9e 9a13 8b17 3a52 f30c     ^-.&........R:..
c0dec280:	3ef3 a327 ca61 ae09 8fcf 084f 5aca f908     .>'.a.....O..Z..
c0dec290:	35c8 ffbc a35f 5ec4 41ec f3b8 d353 3a1e     .5.._..^.A..S..:
c0dec2a0:	f604 9120 5418 b993 8329 5e85 db99 f2e5     .. ..T..)..^....
c0dec2b0:	56d5 6002 57d4 75ae b266 f08b 114b a76d     .V.`.W.uf...K.m.
c0dec2c0:	a077 f65f c993 81d4 ff8d 0fc5 af18 4ccb     w._............L
c0dec2d0:	0320 0000                                    ...

c0dec2d4 <C_Privacy_40px>:
c0dec2d4:	0028 0028 0102 c120 c0de                    (.(... ...

c0dec2de <C_QRCode_40px_bitmap>:
c0dec2de:	0028 0028 9921 0000 0097 8b1f 0008 0000     (.(.!...........
c0dec2ee:	0000 0302 fffb da9f 11e0 0803 bd30 00ff     ............0...
c0dec2fe:	fea2 607f 8900 8029 18c5 91f4 20c5 0c42     ...`..)...... B.
c0dec30e:	28fc fc62 1230 c2c2 f62d a3a7 4307 07ec     .(b.0...-....C..
c0dec31e:	0703 ff84 6101 b11e 1062 c0f3 903c 9073     .....a..b...<.s.
c0dec32e:	25ec 8628 07f0 cc3f 4839 85fe 218b 0b85     .%(...?.9H...!..
c0dec33e:	923f 49b3 d30a 107f f583 ed90 04f8 99a1     ?..I............
c0dec34e:	c230 9b14 d19b 19c2 0c55 061e 3a27 a3ce     0.......U...':..
c0dec35e:	1586 d790 d0c0 aa4f 3618 88f3 0b74 7f16     ......O..6..t...
c0dec36e:	f360 b62f a170 002e 5b00 1eb2 20fb 0003     `./.p....[... ..
	...

c0dec37f <C_QRCode_40px>:
c0dec37f:	0028 0028 0102 c2de c0de                    (.(.......

c0dec389 <C_Settings_40px_bitmap>:
c0dec389:	0028 0028 9321 0001 0191 8b1f 0008 0000     (.(.!...........
c0dec399:	0000 0302 5275 52b1 40c2 7d10 88c9 9841     ....uR.R.@.}..A.
c0dec3a9:	8c91 8e56 10ce 5e87 3e46 ec40 93b0 4e8e     ..V....^F>@....N
c0dec3b9:	03fd 4053 850d 1695 9d62 4a42 b03b 8a93     ..S@....b.BJ;...
c0dec3c9:	0bf1 04fc 1c1c 40eb a202 3920 2f77 1738     .......@.. 9w/8.
c0dec3d9:	d818 6f62 e5ef eef2 bbed 6215 8c7d ad4d     ..bo.......b}.M.
c0dec3e9:	8cba 81d5 25ad 8028 6b61 45dd 87ac 8fac     .....%(.ak.E....
c0dec3f9:	daac 764f 4e0b 7751 3303 aed6 761c ac42     ..Ov.NQw.3...vB.
c0dec409:	8a01 1084 f9ad 314a 12e5 74f7 2cb5 8c9a     ......J1...t.,..
c0dec419:	300d 976b 5c73 4ae5 8b8e 5734 5c1e 3dc5     .0k.s\.J..4W.\.=
c0dec429:	9e43 1197 0a3a e29b 765c 4780 fd85 1aa0     C...:...\v.G....
c0dec439:	9e59 5cee 6075 4b8a 57ca 26c0 c381 6890     Y..\u`.K.W.&...h
c0dec449:	fac4 2c7b 48e3 1f08 7c17 4593 0557 0a16     ..{,.H...|.EW...
c0dec459:	d037 8459 a74e 601f f108 0385 9e21 2d71     7.Y.N..`....!.q-
c0dec469:	8d44 19ec 2343 7786 f9a6 8a45 b79a 1d50     D...C#.w..E...P.
c0dec479:	84e0 5a08 cc1b 9a7c 0e90 fba5 ef06 716a     ...Z..|.......jq
c0dec489:	76ce 5398 2c73 25fa 6035 a205 fe11 a49b     .v.Ss,.%5`......
c0dec499:	81f4 18f4 b93a c7d3 8b1b a6df 5264 755b     ....:.......dR[u
c0dec4a9:	59c4 becb af10 c5ac 9ec6 b960 87d4 b385     .Y........`.....
c0dec4b9:	cb32 a1f5 4bf3 b27d ff65 79bd f9b2 b2d0     2....K}.e..y....
c0dec4c9:	3d80 6650 5e86 2f05 11b7 5733 3a79 f45c     .=Pf.^./..3Wy:\.
c0dec4d9:	f25e e8f9 6746 1b24 65be aed0 b864 14ca     ^...Fg$..e..d...
c0dec4e9:	6e9c 96f8 f913 44d4 2df3 8e8b 8d9a 9aa4     .n.....D.-......
c0dec4f9:	c911 53bb 8a72 1b9a b158 f976 a9b8 3db8     ...Sr...X.v....=
c0dec509:	3de4 50e9 6624 61a6 6747 dd64 aeec f19c     .=.P$f.aGgd.....
c0dec519:	fc68 4701 f51a 207f 0003                     h..G... ...

c0dec524 <C_Settings_40px>:
c0dec524:	0028 0028 0102 c389 c0de                    (.(.......

c0dec52e <C_Warning_40px_bitmap>:
c0dec52e:	0028 0028 e721 0000 00e5 8b1f 0008 0000     (.(.!...........
c0dec53e:	0000 0302 d36d 0db1 40c2 850c 47e1 2284     ....m....@...G."
c0dec54e:	283a d511 88d5 1182 0032 8662 904c 0815     :(......2.b.L...
c0dec55e:	3013 2c03 0ec0 9e88 1025 526d 8450 9d10     .0.,....%.mRP...
c0dec56e:	73b9 8842 b87d aafc 675f 911f 4b1c 34c1     .sB.}..._g...K.4
c0dec57e:	0b26 c128 5b44 c08a c0f6 d95a d811 d2e6     &.(.D[....Z.....
c0dec58e:	c0ae a486 81dd 4905 80ab 4939 66ab 4988     .......I..9I.f.I
c0dec59e:	635a be30 7349 11ad c0d3 8c52 240e b5cd     Zc0.Is....R..$..
c0dec5ae:	d476 6f9b 6925 2adc 6dad d615 0eb5 c5ed     v..o%i.*.m......
c0dec5be:	25ad 4cfc b04b b93d b035 db42 20db 942e     .%.LK.=.5.B.. ..
c0dec5ce:	43d1 773e e2db a970 2e8d 4ac0 9d1b 4c80     .C>w..p....J...L
c0dec5de:	e51b ec3f a6cd ce88 c8ca 5f26 bc1c 6d7d     ..?.......&_..}m
c0dec5ee:	5db8 a8ee 76e6 cbb5 5dae bcee 576d c1b7     .]...v...]..mW..
c0dec5fe:	caed 5db8 6f9b da37 9fec f49b 81ed ccb9     ...].o7.........
c0dec60e:	785d fef8 7c2f 1300 b8d8 2006 0003           ]x../|..... ...

c0dec61d <C_Warning_40px>:
c0dec61d:	0028 0028 0102 c52e c0de 7544 6d6d 2079     (.(.......Dummy 
c0dec62d:	0032 6552 6976 7765 7420 6172 736e 6361     2.Review transac
c0dec63d:	6974 6e6f 740a 206f 6573 646e 4220 4c4f     tion.to send BOL
c0dec64d:	4f00 6570 6172 6974 6e6f 7320 6769 656e     .Operation signe
c0dec65d:	0064 6441 7264 7365 2073 6576 6972 6966     d.Address verifi
c0dec66d:	6163 6974 6e6f 630a 6e61 6563 6c6c 6465     cation.cancelled
c0dec67d:	5400 6172 736e 6361 6974 6e6f 4320 6568     .Transaction Che
c0dec68d:	6b63 7520 616e 6176 6c69 6261 656c 4100     ck unavailable.A
c0dec69d:	7070 6f72 6576 5000 6f72 6563 7373 6e69     pprove.Processin
c0dec6ad:	0067 6c42 6e69 2d64 6973 6e67 3000 302e     g.Blind-sign.0.0
c0dec6bd:	312e 4800 6c6f 2064 6f74 7320 6769 006e     .1.Hold to sign.
c0dec6cd:	704f 7265 7461 6f69 206e 6572 656a 7463     Operation reject
c0dec6dd:	6465 5200 6a65 6365 0074 6552 656a 7463     ed.Reject.Reject
c0dec6ed:	7420 6172 736e 6361 6974 6e6f 003f 7243      transaction?.Cr
c0dec6fd:	7469 6369 6c61 7420 7268 6165 2074 6564     itical threat de
c0dec70d:	6574 7463 6465 0a2e 6c42 6e69 2064 6973     tected..Blind si
c0dec71d:	6e67 6e69 2067 6572 7571 7269 6465 002e     gning required..
c0dec72d:	6e55 6469 6e65 6974 6966 6465 7220 7369     Unidentified ris
c0dec73d:	006b 6853 776f 6120 2073 5251 4100 6f6d     k.Show as QR.Amo
c0dec74d:	6e75 0074 6f47 6220 6361 206b 6f74 6f20     unt.Go back to o
c0dec75d:	6570 6172 6974 6e6f 5400 6172 736e 6361     peration.Transac
c0dec76d:	6974 6e6f 4320 6568 6b63 7520 616e 6176     tion Check unava
c0dec77d:	6c69 6261 656c 0a2e 6c42 6e69 2064 6973     ilable..Blind si
c0dec78d:	6e67 6e69 2067 6572 7571 7269 6465 002e     gning required..
c0dec79d:	6441 7264 7365 2073 6576 6972 6966 6465     Address verified
c0dec7ad:	5300 6977 6570 7420 206f 6f63 746e 6e69     .Swipe to contin
c0dec7bd:	6575 2500 2073 7325 250a 0073 7468 7074     ue.%s %s.%s.http
c0dec7cd:	3a73 2f2f 7325 4100 6572 7920 756f 7320     s://%s.Are you s
c0dec7dd:	7275 2065 6f74 610a 6c6c 776f 6420 6d75     ure to.allow dum
c0dec7ed:	796d 3220 690a 206e 7274 6e61 6173 7463     my 2.in transact
c0dec7fd:	6f69 736e 003f 7254 6e61 6173 7463 6f69     ions?.Transactio
c0dec80d:	206e 6973 6e67 6465 4500 534e 6e20 6d61     n signed.ENS nam
c0dec81d:	7365 6120 6572 7220 7365 6c6f 6576 2064     es are resolved 
c0dec82d:	7962 4c20 6465 6567 2072 6162 6b63 6e65     by Ledger backen
c0dec83d:	2e64 5300 6365 7275 7469 2079 6572 6f70     d..Security repo
c0dec84d:	7472 4400 7665 6c65 706f 7265 2500 0a73     rt.Developer.%s.
c0dec85d:	7325 2520 0073 6c41 6f6c 2077 7564 6d6d     %s %s.Allow dumm
c0dec86d:	2079 0a31 6e69 7420 6172 736e 6361 6974     y 1.in transacti
c0dec87d:	6e6f 0073 6953 6e67 7420 6172 736e 6361     ons.Sign transac
c0dec88d:	6974 6e6f 740a 206f 6573 646e 4220 4c4f     tion.to send BOL
c0dec89d:	5900 7365 202c 6b73 7069 2500 2073 6572     .Yes, skip.%s re
c0dec8ad:	6f70 7472 4700 206f 6162 6b63 7420 206f     port.Go back to 
c0dec8bd:	7274 6e61 6173 7463 6f69 006e 6953 6e67     transaction.Sign
c0dec8cd:	6d20 7365 6173 6567 4200 6361 206b 6f74      message.Back to
c0dec8dd:	7320 6661 7465 0079 654d 7373 6761 2065      safety.Message 
c0dec8ed:	6973 6e67 6465 4300 6f6c 6573 5300 6769     signed.Close.Sig
c0dec8fd:	206e 7274 6e61 6173 7463 6f69 006e 654c     n transaction.Le
c0dec90d:	6764 7265 5300 6163 206e 6f74 7620 6569     dger.Scan to vie
c0dec91d:	2077 7566 6c6c 7220 7065 726f 0074 6854     w full report.Th
c0dec92d:	7369 7420 6172 736e 6361 6974 6e6f 6f20     is transaction o
c0dec93d:	2072 656d 7373 6761 2065 6163 6e6e 746f     r message cannot
c0dec94d:	6220 2065 6564 6f63 6564 2064 7566 6c6c      be decoded full
c0dec95d:	2e79 4920 2066 6f79 2075 6863 6f6f 6573     y. If you choose
c0dec96d:	7420 206f 6973 6e67 202c 6f79 2075 6f63      to sign, you co
c0dec97d:	6c75 2064 6562 6120 7475 6f68 6972 697a     uld be authorizi
c0dec98d:	676e 6d20 6c61 6369 6f69 7375 6120 7463     ng malicious act
c0dec99d:	6f69 736e 7420 6168 2074 6163 206e 7264     ions that can dr
c0dec9ad:	6961 206e 6f79 7275 7720 6c61 656c 2e74     ain your wallet.
c0dec9bd:	0a0a 654c 7261 206e 6f6d 6572 203a 656c     ..Learn more: le
c0dec9cd:	6764 7265 632e 6d6f 652f 0038 6341 6563     dger.com/e8.Acce
c0dec9dd:	7470 7420 7268 6165 2074 6e61 2064 6f63     pt threat and co
c0dec9ed:	746e 6e69 6575 4100 6c6c 776f 6420 6d75     ntinue.Allow dum
c0dec9fd:	796d 3220 690a 206e 7274 6e61 6173 7463     my 2.in transact
c0deca0d:	6f69 736e 5600 7265 6973 6e6f 4d00 726f     ions.Version.Mor
c0deca1d:	0065 6854 7369 7420 6172 736e 6361 6974     e.This transacti
c0deca2d:	6e6f 6320 6e61 6f6e 2074 6562 4320 656c     on cannot be Cle
c0deca3d:	7261 5320 6769 656e 0064 6559 2c73 7220     ar Signed.Yes, r
c0deca4d:	6a65 6365 0074 6143 636e 6c65 5400 6968     eject.Cancel.Thi
c0deca5d:	2073 7274 6e61 6173 7463 6f69 206e 6177     s transaction wa
c0deca6d:	2073 6373 6e61 656e 2064 7361 6d20 6c61     s scanned as mal
c0deca7d:	6369 6f69 7375 6220 2079 6557 3362 4320     icious by Web3 C
c0deca8d:	6568 6b63 2e73 2500 2064 666f 2520 0064     hecks..%d of %d.
c0deca9d:	6b53 7069 7220 7665 6569 3f77 4200 696c     Skip review?.Bli
c0decaad:	646e 7320 6769 696e 676e 7220 7165 6975     nd signing requi
c0decabd:	6572 0064 755b 6b6e 6f6e 6e77 005d 6952     red.[unknown].Ri
c0decacd:	6b73 6420 7465 6365 6574 0064 6c42 6e69     sk detected.Blin
c0decadd:	2064 6973 6e67 6e69 2067 6572 7571 7269     d signing requir
c0decaed:	6465 002e 6e55 6469 6e65 6974 6966 6465     ed..Unidentified
c0decafd:	7420 7268 6165 0074 6854 7369 6120 6363      threat.This acc
c0decb0d:	756f 746e 6c20 6261 6c65 6320 6d6f 7365     ount label comes
c0decb1d:	6620 6f72 206d 6f79 7275 4120 6464 6572      from your Addre
c0decb2d:	7373 4220 6f6f 206b 6e69 4c20 6465 6567     ss Book in Ledge
c0decb3d:	2072 694c 6576 002e 7243 7469 6369 6c61     r Live..Critical
c0decb4d:	7420 7268 6165 0074 6341 6563 7470 7220      threat.Accept r
c0decb5d:	7369 206b 6e61 2064 6f63 746e 6e69 6575     isk and continue
c0decb6d:	5400 6968 2073 7274 6e61 6173 7463 6f69     .This transactio
c0decb7d:	276e 2073 6564 6174 6c69 2073 7261 2065     n's details are 
c0decb8d:	6f6e 2074 7566 6c6c 2079 6576 6972 6966     not fully verifi
c0decb9d:	6261 656c 202e 6649 7920 756f 7320 6769     able. If you sig
c0decbad:	2c6e 7920 756f 6320 756f 646c 6c20 736f     n, you could los
c0decbbd:	2065 6c61 206c 6f79 7275 6120 7373 7465     e all your asset
c0decbcd:	2e73 4700 206f 6162 6b63 7420 206f 656d     s..Go back to me
c0decbdd:	7373 6761 0065 6f50 6574 746e 6169 206c     ssage.Potential 
c0decbed:	6972 6b73 6420 7465 6365 6574 2e64 420a     risk detected..B
c0decbfd:	696c 646e 7320 6769 696e 676e 7220 7165     lind signing req
c0decc0d:	6975 6572 2e64 4e00 206f 6874 6572 7461     uired..No threat
c0decc1d:	6420 7465 6365 6574 2064 7962 5420 6172      detected by Tra
c0decc2d:	736e 6361 6974 6e6f 4320 6568 6b63 002e     nsaction Check..
c0decc3d:	6c42 6e69 2064 6973 6e67 6e69 2067 6861     Blind signing ah
c0decc4d:	6165 0064 654d 7373 6761 2065 6572 656a     ead.Message reje
c0decc5d:	7463 6465 5200 6a65 6365 2074 706f 7265     cted.Reject oper
c0decc6d:	7461 6f69 3f6e 3000 3231 3433 3635 3837     ation?.012345678
c0decc7d:	4139 4342 4544 0046 656e 7774 726f 2e6b     9ABCDEF.network.
c0decc8d:	4200 4c4f 2520 2a2e 0073 6441 7264 7365     .BOL %.*s.Addres
c0decc9d:	0073 6649 7920 756f 7227 2065 7573 6572     s.If you're sure
c0deccad:	7920 756f 6420 6e6f 7427 6e20 6565 2064      you don't need 
c0deccbd:	6f74 7220 7665 6569 2077 6c61 206c 6966     to review all fi
c0decccd:	6c65 7364 202c 6f79 2075 6163 206e 6b73     elds, you can sk
c0deccdd:	7069 7320 7274 6961 6867 2074 6f74 7320     ip straight to s
c0decced:	6769 696e 676e 002e 6649 7920 756f 7227     igning..If you'r
c0deccfd:	2065 6f6e 2074 7375 6e69 2067 6874 0a65     e not using the.
c0decd0d:	654c 6764 7265 4c20 7669 2065 7061 2c70     Ledger Live app,
c0decd1d:	5420 6172 736e 6361 6974 6e6f 4320 6568      Transaction Che
c0decd2d:	6b63 6d20 6769 7468 6e20 746f 7720 726f     ck might not wor
c0decd3d:	2e6b 4920 2066 6f79 2075 7261 2065 7375     k. If you are us
c0decd4d:	6e69 2067 654c 6764 7265 4c20 7669 2c65     ing Ledger Live,
c0decd5d:	7220 6a65 6365 2074 6874 2065 7274 6e61      reject the tran
c0decd6d:	6173 7463 6f69 206e 6e61 2064 7274 2079     saction and try 
c0decd7d:	6761 6961 2e6e 0a0a 6547 2074 6568 706c     again...Get help
c0decd8d:	6120 2074 656c 6764 7265 632e 6d6f 652f      at ledger.com/e
c0decd9d:	3131 5400 6968 2073 7274 6e61 6173 7463     11.This transact
c0decdad:	6f69 206e 6177 2073 6373 6e61 656e 2064     ion was scanned 
c0decdbd:	7361 7220 7369 796b 6220 2079 6557 3362     as risky by Web3
c0decdcd:	4320 6568 6b63 2e73 4400 6d75 796d 3120      Checks..Dummy 1
c0decddd:	4900 7520 646e 7265 7473 6e61 2c64 6320     .I understand, c
c0decded:	6e6f 6966 6d72 4e00 206f 6874 6572 7461     onfirm.No threat
c0decdfd:	6420 7465 6365 6574 0064 7254 6e61 6173      detected.Transa
c0dece0d:	7463 6f69 206e 6572 656a 7463 6465 4700     ction rejected.G
c0dece1d:	206f 6162 6b63 7420 206f 6572 6976 7765     o back to review
c0dece2d:	4300 6972 6974 6163 206c 6874 6572 7461     .Critical threat
c0dece3d:	6420 7465 6365 6574 2e64 5300 6769 206e      detected..Sign 
c0dece4d:	706f 7265 7461 6f69 006e 4c4d 5344 4541     operation.MLDSAE
c0dece5d:	4854 4400 7465 6365 6574 2064 7962 2520     TH.Detected by %
c0dece6d:	0073 5300 696b 0070 6f50 6574 746e 6169     s..Skip.Potentia
c0dece7d:	206c 6972 6b73 6420 7465 6365 6574 2e64     l risk detected.
c0dece8d:	4e00 206f 6874 6572 7461 6420 7465 6365     .No threat detec
c0dece9d:	6574 2064 7962 5420 6172 736e 6361 6974     ted by Transacti
c0decead:	6e6f 4320 6568 6b63 6220 7475 6220 696c     on Check but bli
c0decebd:	646e 7320 6769 696e 676e 7220 7165 6975     nd signing requi
c0dececd:	6572 2e64 5000 746f 6e65 6974 6c61 7220     red..Potential r
c0decedd:	7369 006b 6556 6972 7966 4220 4c4f 6120     isk.Verify BOL a
c0deceed:	6464 6572 7373 4300 6e6f 6974 756e 2065     ddress.Continue 
c0decefd:	6e61 7779 7961 5100 6975 2074 7061 0070     anyway.Quit app.
c0decf0d:	7753 7069 2065 6f74 7220 7665 6569 0077     Swipe to review.
c0decf1d:	6854 7369 6120 7070 6520 616e 6c62 7365     This app enables
c0decf2d:	7320 6769 696e 676e 740a 6172 736e 6361      signing.transac
c0decf3d:	6974 6e6f 2073 6e6f 7420 6568 5400 6172     tions on the.Tra
c0decf4d:	736e 6361 6974 6e6f 4320 6568 6b63 6420     nsaction Check d
c0decf5d:	6469 276e 2074 6966 646e 6120 796e 7420     idn't find any t
c0decf6d:	7268 6165 2c74 6220 7475 6120 776c 7961     hreat, but alway
c0decf7d:	2073 6572 6976 7765 7420 6172 736e 6361     s review transac
c0decf8d:	6974 6e6f 6420 7465 6961 736c 6320 7261     tion details car
c0decf9d:	6665 6c75 796c 002e 6f43 666e 7269 006d     efully..Confirm.
c0decfad:	6552 656a 7463 6d20 7365 6173 6567 003f     Reject message?.
c0decfbd:	0000 a300 c03b a0a7 138c d4c0 17c1 dd4d     ....;.........M.
c0decfcd:	6a88 4cac 6656 f4e1 1f83 6c00 1995 6bd3     .j.LVf.....l...k
c0decfdd:	e82c                                         ,..

c0decfe0 <handler_cmd_verify_dilithium.sig>:
c0decfe0:	6193 b128 b2a6 c9f2 9a4b 7ee4 4896 d274     .a(.....K..~.Ht.
c0decff0:	9592 59da 1be5 29ef 8b95 55f8 26d9 af6d     ...Y...)...U.&m.
c0ded000:	2425 e843 c1a1 f5cd badc 27aa a1db bf64     %$C........'..d.
c0ded010:	6d79 a5ac 1d33 009a 18e5 4002 3ecb b67a     ym..3......@.>z.
c0ded020:	2569 3e5c 2fe1 81dd 868f a3fd 6914 e0e8     i%\>./.......i..
c0ded030:	df2d 0573 dc39 ddd3 1fc5 6442 1648 ef86     -.s.9.....BdH...
c0ded040:	f283 c300 077b 1f7b 4610 28ed 694b 6818     ....{.{..F.(Ki.h
c0ded050:	c39e 454e ea20 db7d 4315 fe5c b291 a47f     ..NE .}..C\.....
c0ded060:	fb91 5e8f 2c01 3a19 364f fedd 4558 a9db     ...^.,.:O6..XE..
c0ded070:	3f4b dd84 e2da ea56 2d53 0e29 5d8f 3823     K?....V.S-)..]#8
c0ded080:	e6a8 371c 0f4f 90aa 4fe6 cca9 7d0a b976     ...7O....O...}v.
c0ded090:	ed6c 46be 2679 7d6b 7d53 07e3 2b95 e42c     l..Fy&k}S}...+,.
c0ded0a0:	7061 60cf ab4c 2add 2046 af90 2803 32dd     ap.`L..*F ...(.2
c0ded0b0:	f998 f506 5bc4 0a97 961f f2d7 bbc5 5aa0     .....[.........Z
c0ded0c0:	d546 d49d f992 5905 749b e49b 7a8b 6fbd     F......Y.t...z.o
c0ded0d0:	34cc bae3 74ac 7391 4ff7 1a93 59d8 5b23     .4...t.s.O...Y#[
c0ded0e0:	4e01 bc5f 5030 3d13 8cfb 8486 ee78 5116     .N_.0P.=....x..Q
c0ded0f0:	55f2 1291 fc05 eead 5f18 3653 6f1d e98b     .U......._S6.o..
c0ded100:	31ae cf90 313d 252e 8d8f 6235 b8e3 cb93     .1..=1.%..5b....
c0ded110:	19f9 48e4 69e7 f329 85c7 3a96 57b0 002f     ...H.i)....:.W/.
c0ded120:	e050 f38b ab81 1c21 cb78 43ec 811a b1e6     P.....!.x..C....
c0ded130:	9f07 07ca f452 6d94 1448 e297 3f00 9507     ....R..mH....?..
c0ded140:	1a47 98f9 2cb0 f817 d14f 5d5f 9873 aa15     G....,..O._]s...
c0ded150:	5dfb ae6d 3b65 c833 835b 2ca8 98b5 7906     .]m.e;3.[..,...y
c0ded160:	b571 b358 12bb 5f9b b015 4180 e145 2b65     q.X...._...AE.e+
c0ded170:	ea61 ea65 37e8 ab75 fec1 a358 6b36 f83e     a.e..7u...X.6k>.
c0ded180:	f8db bbb4 f57d 0fe6 745d a532 dcdf 8690     ....}...]t2.....
c0ded190:	b217 71fa 7848 146e 85bb 341e 7d95 4190     ...qHxn....4.}.A
c0ded1a0:	e2be faac 55b4 8892 9936 64d0 58cc 0383     .....U..6..d.X..
c0ded1b0:	9204 291e 0304 1f30 fad8 f66e d5f2 7f6f     ...)..0...n...o.
c0ded1c0:	3b52 ca90 41b9 f55e ef0c aa1e 3e75 98bc     R;...A^.....u>..
c0ded1d0:	749f 8391 0c9f 9dbe 0ff3 8cfc b65f e18e     .t.........._...
c0ded1e0:	4a62 6072 d27f 9af9 a434 c6c6 eb02 0042     bJr`....4.....B.
c0ded1f0:	403c 83a6 36c3 fbf8 b30d bd78 01b6 2d67     <@...6....x...g-
c0ded200:	0ee9 2092 2cd8 4817 5a26 e648 8d9a a192     ... .,.H&ZH.....
c0ded210:	5bc4 f31d 2cee deeb ef1c cfe7 2566 7e7f     .[...,......f%.~
c0ded220:	ad82 d4ff 4b6a 9e9f 4856 6301 4aa6 9ea6     ....jK..VH.c.J..
c0ded230:	7ca0 93e7 08be f9ac 0ba4 59a9 cb9f 19df     .|.........Y....
c0ded240:	6c1c d1a7 c1b0 0a10 fc11 a572 948d e0f7     .l........r.....
c0ded250:	0bd4 dfcd c753 3105 701e d8b5 d9a8 951a     ....S..1.p......
c0ded260:	154f 6fcb 2787 ee3a eadc 4175 49ad db69     O..o.':...uA.Ii.
c0ded270:	df94 d71c 827f 9b84 eabb 064d 85ad 5461     ..........M...aT
c0ded280:	057d 6271 a419 fccf 755c 819c d1ed 04cc     }.qb....\u......
c0ded290:	5439 3156 a2c1 074d b296 29d9 16b9 d5f4     9TV1..M....)....
c0ded2a0:	a443 38ff 6670 38e9 208b 7127 aa41 a76f     C..8pf.8. 'qA.o.
c0ded2b0:	f413 9f5d 8897 edf5 9722 0e01 f915 468d     ..]....."......F
c0ded2c0:	6e66 d1ef d73e be07 debe 9347 9d23 52df     fn..>.....G.#..R
c0ded2d0:	37be 6705 db1d 47cd a661 4864 847e 593c     .7.g...Ga.dH~.<Y
c0ded2e0:	99ac 7676 1d66 78ae ee05 85fd 12b8 d181     ..vvf..x........
c0ded2f0:	11ed f771 8111 fa3b 9931 6e0d cd4d a811     ..q...;.1..nM...
c0ded300:	0f92 81e6 e0ff c365 b563 b4bf 4616 c54a     ......e.c....FJ.
c0ded310:	5822 8994 8dd7 eff4 95f0 66e8 c9a9 12b7     "X.........f....
c0ded320:	a7d4 495d 15c8 93e9 db31 35ca 33b7 d019     ..]I....1..5.3..
c0ded330:	1bc3 ce8c 913d 4c9e d2b5 280f 1618 8f32     ....=..L...(..2.
c0ded340:	7715 1dd3 6e18 75f5 cfe6 ec0a 5502 c85c     .w...n.u.....U\.
c0ded350:	b370 2d30 a23f 03df 0c3b 60f6 b1dd 5ecf     p.0-?...;..`...^
c0ded360:	38da 89b4 30ed 89fc 26c9 3494 4ab6 de0b     .8...0...&.4.J..
c0ded370:	590b 1c65 94f6 12ac 1165 da50 420e 018d     .Ye.....e.P..B..
c0ded380:	5ef4 d262 3b80 bbd6 d7ef 8066 c599 c4f8     .^b..;....f.....
c0ded390:	65aa 20c0 cf86 fc24 91c9 07e4 3a1a 6cec     .e. ..$......:.l
c0ded3a0:	8787 aa6f 033f ee54 7645 96b6 08bc eecf     ..o.?.T.Ev......
c0ded3b0:	29ef 2607 2e6c 0590 2b97 0fff 49f2 2d87     .).&l....+...I.-
c0ded3c0:	606b a11d ff02 e4c8 927b e3a0 ac84 f695     k`......{.......
c0ded3d0:	4ec5 aba6 960a c26b 51a6 a5ac e920 fbba     .N....k..Q.. ...
c0ded3e0:	b66b 8502 3c1c 0c50 66c0 0062 8d53 5c61     k....<P..fb.S.a\
c0ded3f0:	2de7 a8ef 2202 ebd6 25bf fe39 6bbd a978     .-..."...%9..kx.
c0ded400:	f4d1 7bbf cf6a 9233 55e5 2f1d d976 c956     ...{j.3..U./v.V.
c0ded410:	1445 18ae c006 a110 b11f 82f6 de41 24f4     E...........A..$
c0ded420:	33e6 ae85 46b1 703d 81f6 b34f ab6d e013     .3...F=p..O.m...
c0ded430:	fb77 84b2 927d d346 e751 f7b6 63b1 5e8e     w...}.F.Q....c.^
c0ded440:	8605 3e12 a1e7 ac74 ab29 eb69 f033 c2a7     ...>..t.).i.3...
c0ded450:	208a 48f1 76b1 5513 b1f1 53be 9f78 bf46     . .H.v.U...Sx.F.
c0ded460:	62f6 8901 ff95 9fad 8e87 7c56 318d 02f2     .b........V|.1..
c0ded470:	265a 4f39 eae9 f1ad bd9e 30b6 1712 931f     Z&9O.......0....
c0ded480:	d19c 897e 85ee 1370 7ed5 9b91 6d0d 4a77     ..~...p..~...mwJ
c0ded490:	2542 9544 8796 344b ff23 3c22 fdc5 1912     B%D...K4#."<....
c0ded4a0:	b7f9 8228 15aa 7bc8 7b9f 1dbf e790 93e9     ..(....{.{......
c0ded4b0:	e263 8083 7602 630c 86bd 8997 073b 62b7     c....v.c....;..b
c0ded4c0:	3107 2633 10f5 6133 0987 ce50 f71f 4af3     .13&..3a..P....J
c0ded4d0:	2922 e325 96d0 64a2 3503 3669 8f95 1bce     ")%....d.5i6....
c0ded4e0:	6ede a80d d0fa 9d41 80c5 4680 bc47 1ff7     .n....A....FG...
c0ded4f0:	01e9 5c8f 48e3 0417 5ca4 479f 7fae cc19     ...\.H...\.G....
c0ded500:	3205 43a5 f783 dc00 e1ef a83a ccd7 f47f     .2.C......:.....
c0ded510:	5d58 18a3 8c32 e723 7e29 2ded 0a60 7a8a     X]..2.#.)~.-`..z
c0ded520:	9fef 5134 4caa 1853 6aeb 4531 0af7 0d1b     ..4Q.LS..j1E....
c0ded530:	6391 63c7 d3af 462e 4887 d0ca 5e2e 7a1c     .c.c...F.H...^.z
c0ded540:	2675 fd69 29ed 5dd3 06fb d43f d2db 0502     u&i..).]..?.....
c0ded550:	ad21 1cbb 1a20 238a c229 28ac 973d 0a15     !... ..#)..(=...
c0ded560:	96c2 fe60 7268 0e64 96d7 56eb be4b 2aa1     ..`.hrd....VK..*
c0ded570:	a6f5 756f 4f64 e0cf 1632 1145 2eac 7d6d     ..oudO..2.E...m}
c0ded580:	b724 dbef e1b1 09c2 961e 439f 73df 9763     $..........C.sc.
c0ded590:	3dbd 2198 3583 c086 3859 bea6 2141 c4f2     .=.!.5..Y8..A!..
c0ded5a0:	aff8 98ae 7e86 caee 09a5 840a 3ea1 890b     .....~.......>..
c0ded5b0:	f904 5fe9 9cc6 b0f2 ea77 3111 7d1f d5f1     ..._....w..1.}..
c0ded5c0:	d3a3 96ae ef16 5f94 1e3c e269 f00c 1a4b     ......._<.i...K.
c0ded5d0:	7e9a 2aab d1b5 b4f1 0604 314d 0774 6639     .~.*......M1t.9f
c0ded5e0:	2e43 d646 21db ef98 d8d0 6dbf dbd9 39c5     C.F..!.....m...9
c0ded5f0:	4531 1d25 8f41 78f8 d3af 673d ed94 20ed     1E%.A..x..=g... 
c0ded600:	50ed 3e00 972d 600b 2d5a 63bf e5d3 e3be     .P.>-..`Z-.c....
c0ded610:	7d5c 65bc 9421 2756 ee83 3343 4fff d3c0     \}.e!.V'..C3.O..
c0ded620:	c382 841c 608a f196 fbd4 1f78 9720 676f     .....`....x. .og
c0ded630:	6b7c d2db e092 4dfd 16d7 de8d cb5e 375f     |k.....M....^._7
c0ded640:	e98f 9cf4 99f7 ba6d 747a 004b 03e7 d21b     ......m.ztK.....
c0ded650:	4290 5df8 f84d f3cd b9f7 f727 fd31 51c9     .B.]M.....'.1..Q
c0ded660:	da82 aa7f 23f4 60d7 e619 527e cca3 e96f     .....#.`..~R..o.
c0ded670:	3bdb ce43 46b3 2328 04a0 43e9 8f63 2ec1     .;C..F(#...Cc...
c0ded680:	e5db 3eba 5f7f 994b 16c2 ae8d edfc 7060     ...>._K.......`p
c0ded690:	8dd9 a673 75e1 b64d 0cf3 658e 7672 2dac     ..s..uM....erv.-
c0ded6a0:	e95f 54f7 3097 9119 5ee6 8d6f 2fb9 696e     _..T.0...^o../ni
c0ded6b0:	ca01 bc42 ad99 fab0 3a15 80a1 5d0c 3741     ..B......:...]A7
c0ded6c0:	13db 1855 0849 dc1d 9305 e7b1 9ab0 26fd     ..U.I..........&
c0ded6d0:	345b b19b c16f b905 8358 a609 de0a e699     [4..o...X.......
c0ded6e0:	a16e d490 5bc3 7a1f ddc2 dc8c 4210 a442     n....[.z.....BB.
c0ded6f0:	0b0b a3d1 297d 4c35 0274 a399 4a18 1cd0     ....})5Lt....J..
c0ded700:	50e9 1744 26b8 7d3e e8a8 ee32 8828 d05e     .PD..&>}..2.(.^.
c0ded710:	8185 44d9 13b8 9ff1 1d9e add2 3b40 b24e     ...D........@;N.
c0ded720:	10ec dce9 8119 19f2 beb8 e1bf fdc3 034e     ..............N.
c0ded730:	2afa aab9 36a6 fa54 d005 654c 0426 cd95     .*...6T...Le&...
c0ded740:	685a 2141 59ee e89f dbf3 d401 4f37 d820     ZhA!.Y......7O .
c0ded750:	f7a9 5322 5f4e b0a4 b8dc 99a7 d7a1 85b8     .."SN_..........
c0ded760:	079e 67f9 bc1d 86e1 60a5 fbff 1074 91b2     ...g.....`..t...
c0ded770:	e203 850f 6c23 99ff ae43 6054 0f59 c585     ....#l..C.T`Y...
c0ded780:	f196 d72b 0e54 6ac0 3105 9dc3 9b21 e89d     ..+.T..j.1..!...
c0ded790:	5383 5f8e 6860 a3d0 7132 433c b19f 3722     .S._`h..2q<C.."7
c0ded7a0:	2177 e9ae 8584 0985 4d83 bfc1 461f c991     w!.......M...F..
c0ded7b0:	3d7f 26b7 60ff 2eb2 142b cf17 02a9 2cd9     .=.&.`..+......,
c0ded7c0:	3120 f1a7 d4bb b1bc 6fec eaaa 3722 a36f      1.......o.."7o.
c0ded7d0:	da49 009f 1682 1154 5020 5855 6044 2c4a     I.....T. PUXD`J,
c0ded7e0:	0d53 8ec7 cc40 366e f143 88cf d075 c778     S...@.n6C...u.x.
c0ded7f0:	faac 028f 8b0e ad24 cf5e 04a0 f0b7 4a5a     ......$.^.....ZJ
c0ded800:	34d5 6ffc 40cd e590 4ad1 9348 2f64 5395     .4.o.@...JH.d/.S
c0ded810:	207c d634 966a 2571 1bbb 9e52 0a9a 29eb     | 4.j.q%..R....)
c0ded820:	bbf2 06a8 a498 68e3 4195 b6ce a78e 7a1c     .......h.A.....z
c0ded830:	226e a567 9168 9825 defd ece9 d3b8 3585     n"g.h.%........5
c0ded840:	0c74 8edd 873d ad66 5cdb 5ce9 4c24 74e4     t...=.f..\.\$L.t
c0ded850:	e76c b702 26e6 cea2 d100 25ad 8de4 6ae3     l....&.....%...j
c0ded860:	a50e cb49 8758 b01e f9bb ddd7 15ab 8503     ..I.X...........
c0ded870:	d36d 45be 19ba c1d6 f082 0adb 5ace 350c     m..E.........Z.5
c0ded880:	6955 ab0a 5737 5260 9a64 6565 f739 99cd     Ui..7W`Rd.ee9...
c0ded890:	0c61 fa68 436d ed67 f2d4 3b7c df96 9fcd     a.h.mCg...|;....
c0ded8a0:	471f 5ca4 e60d e7a7 a991 8e13 d019 9318     .G.\............
c0ded8b0:	54ee 86b9 92cc 6fb0 319c f9c9 aac9 e2bb     .T.....o.1......
c0ded8c0:	49a7 4aa4 ad39 a666 472a f872 ab21 689b     .I.J9.f.*Gr.!..h
c0ded8d0:	48c1 bd53 2f19 f4c7 5739 9c10 30d9 d354     .HS../..9W...0T.
c0ded8e0:	cf67 c1e4 4e3a 8715 9b55 c2cd 7050 41fa     g...:N..U...Pp.A
c0ded8f0:	2f71 7207 3072 2c5e ec40 f9cc 7de9 ff02     q/.rr0^,@....}..
c0ded900:	300d 5740 7570 807d 9f90 c7a8 d6ce eae8     .0@Wpu}.........
c0ded910:	fcf0 1e18 3929 3f3e 7244 8783 9488 e5c6     ....)9>?Dr......
c0ded920:	e9e6 f8f3 1c07 1e1d 5326 5b54 7e72 8e86     ........&ST[r~..
c0ded930:	ae97 c3c2 d7c7 e5dc f0ee 1508 211c 6924     .............!$i
c0ded940:	857c aea2 c1c0 f4cd 0000 0000 0000 0000     |...............
c0ded950:	2412 483a 1cd8 8d4d 4f73 fbcb deea 3f3d     .$:H..M.sO....=?
c0ded960:	038a aa9f 2c2a 5799 35e8 55ad 2eb2 bf75     ....*,.W.5.U..u.
c0ded970:	bb57 6a55                                    W.Uj.

c0ded975 <handler_cmd_verify_dilithium.pk>:
c0ded975:	327a 5741 a941 7c35 07db 85a5 803f 8ad1     z2AWA.5|....?...
c0ded985:	2a7a bcaa 44de 441b 3aa0 3f0e 4d84 194a     z*...D.D.:.?.MJ.
c0ded995:	d32a 5df5 437d ad53 4cba 3b91 9cdd 55a7     *..]}CS..L.;...U
c0ded9a5:	9a70 9b10 4592 c2f9 c6cb b1ae bdde 6661     p....E........af
c0ded9b5:	3851 912d 01c8 ad7c 13aa 7db3 cc14 4ca2     Q8-...|....}...L
c0ded9c5:	7cb3 e01f 08d1 69e5 1d94 cde9 f744 4948     .|.....i....D.HI
c0ded9d5:	9241 9af1 8421 a34e 4a74 75af d752 d710     A...!.N.tJ.uR...
c0ded9e5:	865c 4baa e604 72b1 61e9 108b ffef 08e7     \..K...r.a......
c0ded9f5:	4b0e aca6 f1de f372 22cd 2d04 aa53 134d     .K....r..".-S.M.
c0deda05:	4545 e081 21fa 30d9 deae 7b8d 59ff 38ca     EE...!.0...{.Y.8
c0deda15:	4870 de91 19f7 e87e f00a f7dd c702 6ea3     pH....~........n
c0deda25:	2095 a999 5aca aaef 51c9 3a78 7fa1 7244     . ...Z...Qx:..Dr
c0deda35:	046e ec79 19fd a0c9 013a fdfe 0399 0fd4     n.y.....:.......
c0deda45:	04d1 afae 1316 9f4b efef ef96 7dae 679d     ......K......}.g
c0deda55:	9f84 0bac 3f2c 03a1 7020 849e 5bac 5859     ....,?.. p...[YX
c0deda65:	5da1 8c97 6a5a 764a 9339 e684 c356 634b     .]..ZjJv9...V.Kc
c0deda75:	78af 25ba ec71 a999 3adc 1e0c b932 79f2     .x.%q....:..2..y
c0deda85:	5552 9a5f 2428 8dd4 ac6e a97a 03d9 6a71     RU_.($..n.z...qj
c0deda95:	347c b956 4264 d69d a454 d917 a9b1 5df1     |4V.dB..T......]
c0dedaa5:	ad2a c3cf f802 726b d86f d60a 0295 7a48     *.....kro.....Hz
c0dedab5:	b72a eb2f b497 6e3b fb57 b5a0 be54 4a08     *./...;nW...T..J
c0dedac5:	4e64 511e 66e2 239d da96 aad4 6d1c add2     dN.Q.f.#.....m..
c0dedad5:	4e23 0891 c269 9a65 ea74 4559 52b4 39a1     #N..i.e.t.YE.R.9
c0dedae5:	3d14 aed7 2371 576b 2840 952d 9280 e187     .=..q#kW@(-.....
c0dedaf5:	a52e 4e47 f12e 3aa9 315e 5e10 2826 2640     ..GN...:^1.^&(@&
c0dedb05:	18a0 71a4 6a75 1650 3904 53b7 f134 099e     ...qujP..9.S4...
c0dedb15:	30ec f718 800d cbb6 2c00 d883 5d0b c153     .0.......,...]S.
c0dedb25:	5169 396e f1e3 5585 c7dc 55b5 5fdb 18a4     iQn9...U...U._..
c0dedb35:	8ab3 78cb 11d0 1f02 dcea 43bf 5af3 6917     ...x.......C.Z.i
c0dedb45:	d8d2 bf9d d264 6ca6 1aef 4a41 8170 de2e     ....d..l..AJp...
c0dedb55:	7e3f 503a 969a c149 9b0c 5140 1364 54d5     ?~:P..I...@Qd..T
c0dedb65:	2261 b31f 7f51 38aa c47c 3160 bf0e d6e0     a"..Q..8|.`1....
c0dedb75:	caf9 6619 0453 7cdd 7dfa 80f9 9c3d 8dc8     ...fS..|.}..=...
c0dedb85:	03dc fba1 9396 d980 90d8 c488 2b31 b6ef     ............1+..
c0dedb95:	3fa6 7e45 cf83 53e0 f344 5461 e621 ba01     .?E~...SD.aT!...
c0dedba5:	c295 a899 2c84 150b 7423 2dfe 0251 2f9e     .....,..#t.-Q../
c0dedbb5:	97d2 97a6 b961 e363 ee3a bf98 3bef 810d     ....a.c.:....;..
c0dedbc5:	377f a25a 7cf4 ac35 c4aa f11a 52e8 1367     .7Z..|5......Rg.
c0dedbd5:	ca57 1a82 abe8 f901 85b4 6f3b 3869 ecbe     W.........;oi8..
c0dedbe5:	9acd cf7a 4f61 67eb 6944 9164 d202 c923     ..z.aO.gDid...#.
c0dedbf5:	f887 9e24 2924 d833 55ea f328 1c8f 89d5     ..$.$)3..U(.....
c0dedc05:	8367 8969 e721 0bd9 d97e ecac 3043 d9c4     g.i.!...~...C0..
c0dedc15:	12d9 17f5 5bf8 2462 690e 5358 0de6 114b     .....[b$.iXS..K.
c0dedc25:	4efa a889 522f 9396 982c 05a1 0c60 7912     .N../R..,...`..y
c0dedc35:	0178 1617 b82e e983 2282 90c0 d80f e32f     x........"..../.
c0dedc45:	0906 0bc3 03f1 a465 3814 6857 7870 db4d     ......e..8WhpxM.
c0dedc55:	f4cb 442c 630c d79e 15e0 675b 679c 7c98     ..,D.c....[g.g.|
c0dedc65:	9e42 f7ac 1b33 3e5a 0ff1 1e1e 2ab1 aa1f     B...3.Z>.....*..
c0dedc75:	94b4 0eb5 5d2a 9da6 29f4 4d0f 8b76 fb6f     ....*]...).Mv.o.
c0dedc85:	8c3f 3046 1ab7 5215 ede8 b5fe 42e1 1fc5     ?.F0...R.....B..
c0dedc95:	0cf1 13b8 cdf3 394e 9f97 fef5 2700 bb42     ......N9.....'B.
c0dedca5:	e96e 10c4 18c8 a829 b82c deb5 e6de e7a4     n.....).,.......
c0dedcb5:	4c6b ab84 c102 1466 d85e 59fc f4f7 16b4     kL....f.^..Y....
c0dedcc5:	39be ab0e fc8b 49dc 6f8d 3148 cf38 15a0     .9.....I.oH18...
c0dedcd5:	0b2f c988 75de 901d 1107 6d59 d064 c3c6     /....u....Ymd...
c0dedce5:	a2bd c2d1 5545 fc1f 1bb8 3b5d b1bd 38a7     ....EU....];...8
c0dedcf5:	622c dfd0 a24c dd3b 28d2 999a ff78 bc31     ,b..L.;..(..x.1.
c0dedd05:	995f ef25 d2f1 7984 8396 408c f4d2 0547     _.%....y...@..G.
c0dedd15:	37d7 aa35 d6ac a7c6 f196 1388 69f0 1534     .75..........i4.
c0dedd25:	5055 72df a339 2a6a 9200 8500 cceb ff37     UP.r9.j*......7.
c0dedd35:	1230 34bc 030a 4724 9529 9c3b 8dc1 bd2d     0..4..$G).;...-.
c0dedd45:	fd9b 36e8 7f6d 88f6 6c2c 99cf b40b d3da     ...6m...,l......
c0dedd55:	32ae 38b1 f347 475b 612e 7417 9df6 1c73     .2.8G.[G.a.t..s.
c0dedd65:	fd79 27f7 4aab 2140 daf4 9cc5 ff2e 57bc     y..'.J@!.......W
c0dedd75:	669c 08f2 2601 6d00 4a81 43d8 8831 1dde     .f...&.m.J.C1...
c0dedd85:	53b0 aafb f44d 52f7 a54f e800 dc9c 8a58     .S..M..RO.....X.
c0dedd95:	76e8 c12a 4c72 449a 0fac 9773 32f7 87c3     .v*.rL.D..s..2..
c0dedda5:	4b2f 40dc 2875 4d14 373b 49ac 2653 48a8     /K.@u(.M;7.IS&.H
c0deddb5:	1045 dff6 8480 ea9b e8d5 5bf8 1f11 c9ff     E..........[....
c0deddc5:	f401 be47 f9b6 f974 1438 356f d0b5 9bed     ..G...t.8.o5....
c0deddd5:	9ec3 9b60 2cfb 3791 9646 8f80 701e 8bae     ..`..,.7F....p..
c0dedde5:	673b b56a d4ce 44ec bf67 4c90 18bd ca70     ;gj....Dg..L..p.
c0deddf5:	a9ab fbc5 923e f712 b4c3 2836 7e5a 276e     ....>.....6(Z~n'
c0dede05:	c32a f960 7e13 52bc 7352 8535 2a21 db91     *.`..~.RRs5.!*..
c0dede15:	9e4b de86 de4c f52a 1699 a8e6 5904 45f1     K...L.*......Y.E
c0dede25:	6b0e acad 14ee ea83 b1c5 295b 79d7 5554     .k........[).yTU
c0dede35:	547e eafb d73a a98f eba3 0b05 fb68 9695     ~T..:.......h...
c0dede45:	7369 4cb1 c91a aa56 4845 b981 d16a 92f4     is.L..V.EH..j...
c0dede55:	83e1 1c09 ff31 41a2 f10b 842b 43bf 5a21     ....1..A..+..C!Z
c0dede65:	3f07 c916 41ef e919 6101 de5d 41b1 67de     .?...A...a]..A.g
c0dede75:	919f 451e b0a3 89f1 2aa9 0f95 e22e 9d62     ...E.....*....b.
c0dede85:	014c 1dd4 1da3 081d 4712 6382 183f ee68     L........G.c?.h.
c0dede95:	0000                                         ...

c0dede98 <settingContents>:
c0dede98:	0000 0000 deb4 c0de 0001 0000               ............

c0dedea4 <infoList>:
c0dedea4:	deec c0de def4 c0de 0000 0000 0002 0000     ................

c0dedeb4 <contents>:
c0dedeb4:	0007 0000 1434 da7a 0002 0000 0000 0000     ....4.z.........
	...
c0dedee8:	0ac9 c0de                                   ....

c0dedeec <INFO_TYPES>:
c0dedeec:	ca12 c0de c850 c0de                         ....P...

c0dedef4 <INFO_CONTENTS>:
c0dedef4:	c6ba c0de c90b c0de                         ........

c0dedefc <zetas>:
c0dedefc:	0000 0000 64f7 0000 3102 ffd8 1503 fff8     .....d...1......
c0dedf0c:	9e44 0003 2118 fff4 a128 fff2 1e24 0007     D....!..(...$...
c0dedf1c:	de2b 001b e92b 0023 84ad fffa 147f ffe0     +...+.#.........
c0dedf2c:	9a75 002f fb09 ffd3 7a49 002f e527 0028     u./.....Iz/.'.(.
c0dedf3c:	9658 0029 a070 000f 85a4 ffef b788 0036     X.).p.........6.
c0dedf4c:	9d90 fff7 eaa0 ffee f968 0027 d37b ffdf     ........h.'.{...
c0dedf5c:	add6 ffdf 1ae7 ffc5 a4f7 ffea fc98 ffcd     ................
c0dedf6c:	d035 001a b422 ffff 3201 003d 45c5 0004     5..."....2=..E..
c0dedf7c:	4a67 0029 7620 0001 f4cd 002e dec5 0035     gJ). v........5.
c0dedf8c:	a503 ffe6 302c ffc9 47d4 ffd9 beaf 003b     ....,0...G....;.
c0dedf9c:	1585 ffc5 8e7c ffd1 8a96 0036 3e41 ffd4     ....|.....6.A>..
c0dedfac:	0400 0036 6a4d fffb d69c 0023 c55d fff7     ..6.Mj....#.]...
c0dedfbc:	123d ffe6 ead6 ffe6 7e1e 0035 af59 ffc5     =........~5.Y...
c0dedfcc:	843f 0035 5617 ffdf 945c ffe7 738c 0038     ?.5..V..\....s8.
c0dedfdc:	63a8 000c 1b9a 0008 8f76 000e 3853 003b     .c......v...S8;.
c0dedfec:	8534 003b fc30 ffd8 9d54 001f 4f2d ffd5     4.;.0...T...-O..
c0dedffc:	06e5 ffc4 ac81 ffe8 e1cf ffc7 9819 ffd1     ................
c0dee00c:	d65d ffe9 09ee 0035 35c7 0021 cfbb ffe7     ].....5..5!.....
c0dee01c:	cf75 ffec 9772 001d b072 ffc1 bcf6 fff0     u...r...r.......
c0dee02c:	5280 ffcf d2ae ffcf 90e0 ffc8 efca 0001     .R..............
c0dee03c:	10f2 0034 fe85 fff0 c638 0020 6e9f 0029     ..4.....8. ..n).
c0dee04c:	b7a3 ffd2 a44b ffc7 ba6d fff9 3409 ffda     ....K...m....4..
c0dee05c:	c282 fff5 4113 ffed a63b ffff 09f7 ffec     .....A..;.......
c0dee06c:	2bdd fffa 95d4 0014 4563 001c 2c62 ffea     .+......cE..b,..
c0dee07c:	fbe9 ffcc 0af0 0004 c417 0007 4588 002f     .............E/.
c0dee08c:	ad00 0000 36be ffef cd44 000d 675a 003c     .....6..D...Zg<.
c0dee09c:	2bca ffc7 de7e ffff 3948 0019 69c0 ffce     .+..~...H9...i..
c0dee0ac:	756c 0024 c7df fffc 98a1 000b e808 ffeb     lu$.............
c0dee0bc:	e46c 0002 c808 ffc9 36c2 0030 bff6 ffe3     l........60.....
c0dee0cc:	3c93 ffdb 4ae0 fffd 1305 0014 7792 0014     .<...J.......w..
c0dee0dc:	9e25 0013 d0e0 ffe7 9944 fff3 0802 ffea     %.......D.......
c0dee0ec:	eea2 ffd1 c79c ffc4 a057 ffc8 97d9 003a     ........W.....:.
c0dee0fc:	ea93 001f ff5a 0033 58d4 0023 41f8 003a     ....Z.3..X#..A:.
c0dee10c:	ff72 ffcc 3dfb 0022 ab9f ffda a422 ffc9     r....="....."...
c0dee11c:	12f5 0004 2587 0025 24f0 ffed 9b5d 0035     .....%%..$..].5.
c0dee12c:	48a0 ffca a2fc ffc6 bb56 ffed 45de ffcf     .H......V....E..
c0dee13c:	be5e 000d 5e1a 001c e0e6 000d 7f5a 000c     ^....^......Z...
c0dee14c:	8f83 0007 628a ffe7 5704 ffff 06fc fff8     .....b...W......
c0dee15c:	0021 fff6 5af6 ffd0 0084 001f ef86 0030     !....Z........0.
c0dee16c:	b97d ffc9 fcd6 fff7 4592 fff4 21c2 ffc9     }........E...!..
c0dee17c:	3919 0005 610c 0004 cd41 ffda b01b 003e     .9...a..A.....>.
c0dee18c:	72e7 0034 003b ffcd 7cc7 001a 1924 0003     .r4.;....|..$...
c0dee19c:	5ee5 002b 1199 0029 7a3a ffd8 4d71 0013     .^+...).:z..qM..
c0dee1ac:	e11c 003d 0984 0013 f051 0025 5a46 0018     ..=.....Q.%.FZ..
c0dee1bc:	8518 ffc6 14be 0013 3891 0028 db90 ffc9     .........8(.....
c0dee1cc:	5089 ffd2 853f 001c 0b4b 001d f6a6 ffef     .P..?...K.......
c0dee1dc:	a8be ffeb e11b 0012 5e3e ffcd 2d2f ffea     ........>^../-..
c0dee1ec:	1de4 fff9 06c7 0014 7283 0032 0d6e ffe2     .........r2.n...
c0dee1fc:	7953 ffec 4099 001d 2578 ffd9 05ad ffeb     Sy...@..x%......
c0dee20c:	e405 0016 dbe7 000b 1de8 0022 f8cf 0033     .........."...3.
c0dee21c:	b934 fff7 ca0c ffd4 7ff8 ffe6 d157 ffe3     4...........W...
c0dee22c:	911b ffd8 2c12 ffc7 10d8 0009 5e1f ffc6     .....,.......^..
c0dee23c:	4658 ffe1 1d8b 0025 73b7 0025 7c8f fffd     XF....%..s%..|..
c0dee24c:	dd98 001d 6898 0033 d4bb 0002 93a7 ffed     .....h3.........
c0dee25c:	6cbe ffcf 7c1c 0002 aa08 0018 fd71 002d     .l...|......q.-.
c0dee26c:	5ca5 000c 379a 0019 a167 ffc7 8c3d ffe4     .\...7..g...=...
c0dee27c:	a13c ffd1 c539 0035 0115 003b 1dc0 0004     <...9.5...;.....
c0dee28c:	c4f7 0021 1bf4 fff1 35e7 001a 340e 0007     ..!......5...4..
c0dee29c:	7d45 fff9 4cd0 001a 7cae ffe4 2668 001d     E}...L...|..h&..
c0dee2ac:	8e98 ffe6 2633 ffef 05da fffc 7fdb ffc5     ....3&..........
c0dee2bc:	2764 ffd3 e1af ffdd 93dd fff9 1d09 ffdd     d'..............
c0dee2cc:	cc93 0002 1805 fff1 9c2a 0018 e5a9 ffc9     ........*.......
c0dee2dc:	8a50 fff7 cf2c 003b 434e ffff 36df ffeb     P...,.;.NC...6..
c0dee2ec:	15ca 003c 5e68 0015 16b6 fff3 29ce 001e     ..<.h^.......)..

c0dee2fc <small_zetas>:
c0dee2fc:	fbec fd0a fe99 fa13 05d5 058e 011f 00ca     ................
c0dee30c:	ff55 026e 0629 00b6 03c2 fb4e fa3e 05bc     U.n.).....N.>...
c0dee31c:	023d fad3 0108 017f fcc3 05b2 f9be ff7e     =.............~.
c0dee32c:	fd57 03f9 02dc 0260 f9fa 019b ff33 f9dd     W.....`.....3...
c0dee33c:	04c7 028c fdd8 03f7 faf3 05d3 fee6 f9f8     ................
c0dee34c:	0204 fff8 fec0 fd66 f9ae fb76 007e 05bd     ......f...v.~...
c0dee35c:	fcab ffa6 fef1 033e 006b fa73 ff09 fc49     ......>.k.s...I.
c0dee36c:	fe72 03c1 fa1c fd2b 01c0 fbd7 02a5 fb05     r.....+.........
c0dee37c:	fbb1 01ae 022b 034b fb1d 0367 060e 0069     ....+.K...g...i.
c0dee38c:	01a6 024b 00b1 ff15 fedd fe34 0626 0675     ..K.......4.&.u.
c0dee39c:	ff0a 030a 0487 ff6d fcf7 05cb fda6 045f     ......m......._.
c0dee3ac:	f9ca 0284 fc98 015d 01a2 0149 ff64 ffb5     ......]...I.d...
c0dee3bc:	0331 0449 025b 0262 052a fafb fa47 0180     1.I.[.b.*...G...
c0dee3cc:	fb41 ff78 04c2 fac9 fc96 00dc fb5d f985     A.x.........]...
c0dee3dc:	fb5f fa06 fb02 031a fa1a fcaa fc9a 01de     _...............
c0dee3ec:	ff94 fecc 03e4 03df 03be fa4c 05f2 065c     ..........L...\.

c0dee3fc <.L__const.nbgl_useCaseStatus.ticker>:
c0dee3fc:	8415 c0de 0bb8 0000 0000 0000               ............

c0dee408 <blindSigningWarning>:
c0dee408:	0010 0000 0000 0000 0000 0000 0000 0000     ................
	...
c0dee430:	6854 7369 6120 7070 6520 616e 6c62 7365     This app enables
c0dee440:	7320 6769 696e 676e 740a 6172 736e 6361      signing.transac
c0dee450:	6974 6e6f 2073 6e6f 6920 7374 6e20 7465     tions on its net
c0dee460:	6f77 6b72 002e                              work..

c0dee466 <nbMaxElementsPerContentType>:
c0dee466:	0101 0101 0101 0301 0503 0005 0000          ..............

c0dee474 <g_pcHex>:
c0dee474:	3130 3332 3534 3736 3938 6261 6463 6665     0123456789abcdef
c0dee484:	0000 0000 0040 0000 0000 0000 0000 0000     ....@...........
c0dee494:	0101 0000 0000 0000 0000 0000 0916 0000     ................
c0dee4a4:	0000 0000 0028 0000 0000 0000 0000 0000     ....(...........

c0dee4b4 <g_pcHex_cap>:
c0dee4b4:	3130 3332 3534 3736 3938 4241 4443 4645     0123456789ABCDEF

c0dee4c4 <.L__const.displaySkipWarning.info>:
c0dee4c4:	ca9d c0de cc9f c0de 0000 0000 bb6e c0de     ............n...
c0dee4d4:	0000 0000 c89e c0de ce1c c0de 0005 0109     ................

c0dee4e4 <securityReportItems>:
c0dee4e4:	c61d c0de c67e c0de 0000 0000 c61d c0de     ....~...........
c0dee4f4:	cacb c0de cda0 c0de c61d c0de cb45 c0de     ............E...
c0dee504:	ca5a c0de 0000 0000 cdf4 c0de cf4a c0de     Z...........J...
c0dee514:	c61d c0de caaa c0de cb6e c0de               ........n...

c0dee520 <.L__const.displayCustomizedSecurityReport.layoutDescription>:
c0dee520:	0101 0000 0000 0000 0000 0000 99e9 c0de     ................
	...

c0dee53c <.L__const.displayInfosListModal.info>:
c0dee53c:	0100 0113 0900 0000 0000 0000 0000 0000     ................
c0dee54c:	0100 0300 0000 0000 0000 0000               ............

c0dee558 <.L__const.displayInitialWarning.buttonsInfo>:
c0dee558:	c8d6 c0de cef4 c0de 0000 0000 0014 0009     ................

c0dee568 <_etext>:
	...

c0dee600 <N_storage_real>:
	...

c0dee800 <install_parameters>:
c0dee800:	0801 4c4d 5344 4541 4854 0502 2e30 2e30     ..MLDSAETH..0.0.
c0dee810:	0331 0182 284a 2800 2200 0142 ff00 ffff     1...J(.(."B.....
c0dee820:	ffff 8ccc 1082 5a91 dce0 020b 1110 8130     .......Z......0.
c0dee830:	d98e 0107 1152 0320 d70c 3485 3233 3001     ....R. ....432.0
c0dee840:	d50a 5696 4340 2122 0c20 89d3 3446 2233     ...V@C"! ...F43"
c0dee850:	2011 0d01 9dd1 5037 1314 1314 1132 0520     . ....7P....2. .
c0dee860:	08d1 1607 1c0a 080b 2233 3011 cf0c 479e     ........3".0...G
c0dee870:	c5b0 050d 2213 3011 c406 c72e 6c8b 8dc7     .....".0.....l..
c0dee880:	2253 9588 0e30 0bc2 0310 08c7 c309 ce8e     S"..0...........
c0dee890:	0bc2 1302 dcbc 00d9 2691 c180 1005 c702     .........&......
c0dee8a0:	0d05 acc2 9cbd bec1 9d43 a130 67bd 091c     ........C.0..g..
c0dee8b0:	2314 0b02 05c6 0ac3 0ec1 c208 0306 9218     .#..............
c0dee8c0:	e017 2c3d 8a2b c53c c209 0a0e 08c2 09c2     ..=,+.<.........
c0dee8d0:	1703 8811 1ced 1b1d 0a2c c609 c308 dfaa     ........,.......
c0dee8e0:	c2cb 27bc 70e8 b31d a906 adb0 787a 0ac7     ...'.p......zx..
c0dee8f0:	af2e adec 9ec3 9072 bd1e 5a60 0ec0 86c1     ......r...`Z....
c0dee900:	c8a7 0b0d c02e c50e d6be 3012 06a1 c2c8     ...........0....
c0dee910:	8b9e c950 7e07 ba5e 7b64 0bd0 c20a 070e     ..P..~^.d{......
c0dee920:	c918 0c0b 7e7e 1d0e d208 7e07 0e7e ac8d     ....~~.....~~...
c0dee930:	0dd2 7e09 8d6e d4b9 0a0b 4e7e c98d 0bd6     ...~n.....~N....
c0dee940:	7e09 1d1e 090b 8dd8 3e7c 1e1d 8d8c 9cdb     .~......|>......
c0dee950:	b089 9b1c b0a8 9de0 d0cb ffff ffff 04c4     ................
c0dee960:	010a 8002 0000 802c 0000                     ......,....
