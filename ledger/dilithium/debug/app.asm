
build/flex/bin/app.elf:     file format elf32-littlearm


Disassembly of section .text:

c0de0000 <main>:
c0de0000:	b510      	push	{r4, lr}
c0de0002:	4604      	mov	r4, r0
c0de0004:	b662      	cpsie	i
c0de0006:	f00b fe19 	bl	c0debc3c <os_boot>
c0de000a:	b90c      	cbnz	r4, c0de0010 <main+0x10>
c0de000c:	f00b fbe0 	bl	c0deb7d0 <standalone_app_main>
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
c0de0022:	f00c f9c9 	bl	c0dec3b8 <__aeabi_memclr>
c0de0026:	b914      	cbnz	r4, c0de002e <address_from_pubkey+0x1a>
c0de0028:	2001      	movs	r0, #1
c0de002a:	f00b fd83 	bl	c0debb34 <assert_exit>
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
c0de0042:	f00b fd3f 	bl	c0debac4 <cx_keccak_256_hash_iovec>
c0de0046:	b108      	cbz	r0, c0de004c <address_from_pubkey+0x38>
c0de0048:	2000      	movs	r0, #0
c0de004a:	e006      	b.n	c0de005a <address_from_pubkey+0x46>
c0de004c:	f105 010c 	add.w	r1, r5, #12
c0de0050:	4620      	mov	r0, r4
c0de0052:	2214      	movs	r2, #20
c0de0054:	f00c f9a6 	bl	c0dec3a4 <__aeabi_memcpy>
c0de0058:	2001      	movs	r0, #1
c0de005a:	b00a      	add	sp, #40	@ 0x28
c0de005c:	bd70      	pop	{r4, r5, r6, pc}

c0de005e <apdu_dispatcher>:
c0de005e:	b51f      	push	{r0, r1, r2, r3, r4, lr}
c0de0060:	4604      	mov	r4, r0
c0de0062:	b910      	cbnz	r0, c0de006a <apdu_dispatcher+0xc>
c0de0064:	2001      	movs	r0, #1
c0de0066:	f00b fd65 	bl	c0debb34 <assert_exit>
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
c0de0258:	f00b fa7a 	bl	c0deb750 <io_send_response_buffers>
c0de025c:	bd80      	pop	{r7, pc}

c0de025e <OUTLINED_FUNCTION_0>:
c0de025e:	9001      	str	r0, [sp, #4]
c0de0260:	7920      	ldrb	r0, [r4, #4]
c0de0262:	9002      	str	r0, [sp, #8]
c0de0264:	4770      	bx	lr
	...

c0de0268 <app_main>:
c0de0268:	b5bf      	push	{r0, r1, r2, r3, r4, r5, r7, lr}
c0de026a:	f00b fa53 	bl	c0deb714 <io_init>
c0de026e:	f000 fbdf 	bl	c0de0a30 <ui_menu_main>
c0de0272:	481b      	ldr	r0, [pc, #108]	@ (c0de02e0 <app_main+0x78>)
c0de0274:	f44f 7136 	mov.w	r1, #728	@ 0x2d8
c0de0278:	4448      	add	r0, r9
c0de027a:	f00c f8ab 	bl	c0dec3d4 <explicit_bzero>
c0de027e:	481a      	ldr	r0, [pc, #104]	@ (c0de02e8 <app_main+0x80>)
c0de0280:	4478      	add	r0, pc
c0de0282:	f00b fe77 	bl	c0debf74 <pic>
c0de0286:	7880      	ldrb	r0, [r0, #2]
c0de0288:	2801      	cmp	r0, #1
c0de028a:	d00d      	beq.n	c0de02a8 <app_main+0x40>
c0de028c:	2001      	movs	r0, #1
c0de028e:	f88d 0002 	strb.w	r0, [sp, #2]
c0de0292:	2000      	movs	r0, #0
c0de0294:	f8ad 0000 	strh.w	r0, [sp]
c0de0298:	4814      	ldr	r0, [pc, #80]	@ (c0de02ec <app_main+0x84>)
c0de029a:	4478      	add	r0, pc
c0de029c:	f00b fe6a 	bl	c0debf74 <pic>
c0de02a0:	4669      	mov	r1, sp
c0de02a2:	2203      	movs	r2, #3
c0de02a4:	f00b fea0 	bl	c0debfe8 <nvm_write>
c0de02a8:	4d0e      	ldr	r5, [pc, #56]	@ (c0de02e4 <app_main+0x7c>)
c0de02aa:	ac01      	add	r4, sp, #4
c0de02ac:	f00b fa3a 	bl	c0deb724 <io_recv_command>
c0de02b0:	2800      	cmp	r0, #0
c0de02b2:	d414      	bmi.n	c0de02de <app_main+0x76>
c0de02b4:	4602      	mov	r2, r0
c0de02b6:	eb09 0105 	add.w	r1, r9, r5
c0de02ba:	4620      	mov	r0, r4
c0de02bc:	f00b faaf 	bl	c0deb81e <apdu_parser>
c0de02c0:	b130      	cbz	r0, c0de02d0 <app_main+0x68>
c0de02c2:	4620      	mov	r0, r4
c0de02c4:	f7ff fecb 	bl	c0de005e <apdu_dispatcher>
c0de02c8:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0de02cc:	dcee      	bgt.n	c0de02ac <app_main+0x44>
c0de02ce:	e006      	b.n	c0de02de <app_main+0x76>
c0de02d0:	2000      	movs	r0, #0
c0de02d2:	2100      	movs	r1, #0
c0de02d4:	f646 2287 	movw	r2, #27271	@ 0x6a87
c0de02d8:	f00b fa3a 	bl	c0deb750 <io_send_response_buffers>
c0de02dc:	e7e6      	b.n	c0de02ac <app_main+0x44>
c0de02de:	bdbf      	pop	{r0, r1, r2, r3, r4, r5, r7, pc}
c0de02e0:	00000000 	.word	0x00000000
c0de02e4:	00001497 	.word	0x00001497
c0de02e8:	0000f77c 	.word	0x0000f77c
c0de02ec:	0000f762 	.word	0x0000f762

c0de02f0 <handler_get_app_name>:
c0de02f0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de02f2:	4808      	ldr	r0, [pc, #32]	@ (c0de0314 <handler_get_app_name+0x24>)
c0de02f4:	4478      	add	r0, pc
c0de02f6:	f00b fe3d 	bl	c0debf74 <pic>
c0de02fa:	2100      	movs	r1, #0
c0de02fc:	f44f 4210 	mov.w	r2, #36864	@ 0x9000
c0de0300:	9103      	str	r1, [sp, #12]
c0de0302:	2105      	movs	r1, #5
c0de0304:	e9cd 0101 	strd	r0, r1, [sp, #4]
c0de0308:	a801      	add	r0, sp, #4
c0de030a:	2101      	movs	r1, #1
c0de030c:	f00b fa20 	bl	c0deb750 <io_send_response_buffers>
c0de0310:	b004      	add	sp, #16
c0de0312:	bd80      	pop	{r7, pc}
c0de0314:	0000db98 	.word	0x0000db98

c0de0318 <handler_get_public_key>:
c0de0318:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de031a:	b085      	sub	sp, #20
c0de031c:	4f23      	ldr	r7, [pc, #140]	@ (c0de03ac <handler_get_public_key+0x94>)
c0de031e:	460c      	mov	r4, r1
c0de0320:	4605      	mov	r5, r0
c0de0322:	f44f 7136 	mov.w	r1, #728	@ 0x2d8
c0de0326:	eb09 0607 	add.w	r6, r9, r7
c0de032a:	4630      	mov	r0, r6
c0de032c:	f00c f852 	bl	c0dec3d4 <explicit_bzero>
c0de0330:	2000      	movs	r0, #0
c0de0332:	f506 7135 	add.w	r1, r6, #724	@ 0x2d4
c0de0336:	f809 0007 	strb.w	r0, [r9, r7]
c0de033a:	f886 02a8 	strb.w	r0, [r6, #680]	@ 0x2a8
c0de033e:	4628      	mov	r0, r5
c0de0340:	f00a ffb2 	bl	c0deb2a8 <buffer_read_u8>
c0de0344:	b308      	cbz	r0, c0de038a <handler_get_public_key+0x72>
c0de0346:	eb09 0007 	add.w	r0, r9, r7
c0de034a:	f890 22d4 	ldrb.w	r2, [r0, #724]	@ 0x2d4
c0de034e:	f500 712b 	add.w	r1, r0, #684	@ 0x2ac
c0de0352:	4628      	mov	r0, r5
c0de0354:	f00a fffb 	bl	c0deb34e <buffer_read_bip32_path>
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
c0de0380:	f00b f8a6 	bl	c0deb4d0 <bip32_derive_with_seed_get_pubkey_256>
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
c0de03b8:	f00b f9ca 	bl	c0deb750 <io_send_response_buffers>
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
c0de03e4:	f00b f9b4 	bl	c0deb750 <io_send_response_buffers>
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
c0de0426:	f00b ffd5 	bl	c0dec3d4 <explicit_bzero>
c0de042a:	2000      	movs	r0, #0
c0de042c:	f505 7135 	add.w	r1, r5, #724	@ 0x2d4
c0de0430:	f809 0006 	strb.w	r0, [r9, r6]
c0de0434:	2001      	movs	r0, #1
c0de0436:	f885 02a8 	strb.w	r0, [r5, #680]	@ 0x2a8
c0de043a:	4620      	mov	r0, r4
c0de043c:	f00a ff34 	bl	c0deb2a8 <buffer_read_u8>
c0de0440:	b148      	cbz	r0, c0de0456 <handler_sign_tx+0x6a>
c0de0442:	eb09 0006 	add.w	r0, r9, r6
c0de0446:	f890 22d4 	ldrb.w	r2, [r0, #724]	@ 0x2d4
c0de044a:	f500 712b 	add.w	r1, r0, #684	@ 0x2ac
c0de044e:	4620      	mov	r0, r4
c0de0450:	f00a ff7d 	bl	c0deb34e <buffer_read_bip32_path>
c0de0454:	b9b8      	cbnz	r0, c0de0486 <handler_sign_tx+0x9a>
c0de0456:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de045a:	e019      	b.n	c0de0490 <handler_sign_tx+0xa4>
c0de045c:	f24b 0007 	movw	r0, #45063	@ 0xb007
c0de0460:	e016      	b.n	c0de0490 <handler_sign_tx+0xa4>
c0de0462:	eb09 0106 	add.w	r1, r9, r6
c0de0466:	4408      	add	r0, r1
c0de0468:	f100 0108 	add.w	r1, r0, #8
c0de046c:	4620      	mov	r0, r4
c0de046e:	f00a ff98 	bl	c0deb3a2 <buffer_move>
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
c0de04d6:	f00b faf5 	bl	c0debac4 <cx_keccak_256_hash_iovec>
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
c0de04fa:	f00b ffbf 	bl	c0dec47c <strcmp>
c0de04fe:	b110      	cbz	r0, c0de0506 <handler_sign_tx+0x11a>
c0de0500:	f000 fca3 	bl	c0de0e4a <ui_display_transaction>
c0de0504:	e7f1      	b.n	c0de04ea <handler_sign_tx+0xfe>
c0de0506:	f000 fc9d 	bl	c0de0e44 <ui_display_blind_signed_transaction>
c0de050a:	e7ee      	b.n	c0de04ea <handler_sign_tx+0xfe>
c0de050c:	00000000 	.word	0x00000000
c0de0510:	0000d42f 	.word	0x0000d42f

c0de0514 <io_send_sw>:
c0de0514:	b580      	push	{r7, lr}
c0de0516:	4602      	mov	r2, r0
c0de0518:	2000      	movs	r0, #0
c0de051a:	2100      	movs	r1, #0
c0de051c:	f00b f918 	bl	c0deb750 <io_send_response_buffers>
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
c0de0542:	f00b f905 	bl	c0deb750 <io_send_response_buffers>
c0de0546:	bd8f      	pop	{r0, r1, r2, r3, r7, pc}

c0de0548 <io_send_sw>:
c0de0548:	b580      	push	{r7, lr}
c0de054a:	4602      	mov	r2, r0
c0de054c:	2000      	movs	r0, #0
c0de054e:	2100      	movs	r1, #0
c0de0550:	f00b f8fe 	bl	c0deb750 <io_send_response_buffers>
c0de0554:	bd80      	pop	{r7, pc}

c0de0556 <handler_cmd_keccakH>:
c0de0556:	b5b0      	push	{r4, r5, r7, lr}
c0de0558:	b0f2      	sub	sp, #456	@ 0x1c8
c0de055a:	466d      	mov	r5, sp
c0de055c:	4604      	mov	r4, r0
c0de055e:	4628      	mov	r0, r5
c0de0560:	f001 fd89 	bl	c0de2076 <keccak_init>
c0de0564:	88a2      	ldrh	r2, [r4, #4]
c0de0566:	6821      	ldr	r1, [r4, #0]
c0de0568:	4628      	mov	r0, r5
c0de056a:	f001 fd88 	bl	c0de207e <keccak_update>
c0de056e:	ac6a      	add	r4, sp, #424	@ 0x1a8
c0de0570:	4628      	mov	r0, r5
c0de0572:	4621      	mov	r1, r4
c0de0574:	f001 fd85 	bl	c0de2082 <keccak_final>
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
c0de059a:	f001 fd74 	bl	c0de2086 <inner_keccak256_init>
c0de059e:	e019      	b.n	c0de05d4 <handler_cmd_keccak_prng+0x4c>
c0de05a0:	4c14      	ldr	r4, [pc, #80]	@ (c0de05f4 <handler_cmd_keccak_prng+0x6c>)
c0de05a2:	eb09 0004 	add.w	r0, r9, r4
c0de05a6:	f001 fd91 	bl	c0de20cc <inner_keccak256_flip>
c0de05aa:	b9a0      	cbnz	r0, c0de05d6 <handler_cmd_keccak_prng+0x4e>
c0de05ac:	eb09 0004 	add.w	r0, r9, r4
c0de05b0:	4669      	mov	r1, sp
c0de05b2:	2240      	movs	r2, #64	@ 0x40
c0de05b4:	f001 fda0 	bl	c0de20f8 <inner_keccak256_extract>
c0de05b8:	b968      	cbnz	r0, c0de05d6 <handler_cmd_keccak_prng+0x4e>
c0de05ba:	4668      	mov	r0, sp
c0de05bc:	2140      	movs	r1, #64	@ 0x40
c0de05be:	f7ff ffb8 	bl	c0de0532 <io_send_response_pointer>
c0de05c2:	e014      	b.n	c0de05ee <handler_cmd_keccak_prng+0x66>
c0de05c4:	490b      	ldr	r1, [pc, #44]	@ (c0de05f4 <handler_cmd_keccak_prng+0x6c>)
c0de05c6:	eb09 0301 	add.w	r3, r9, r1
c0de05ca:	e9d0 1200 	ldrd	r1, r2, [r0]
c0de05ce:	4618      	mov	r0, r3
c0de05d0:	f001 fd6a 	bl	c0de20a8 <inner_keccak256_inject>
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
c0de0604:	f002 fca1 	bl	c0de2f4a <pqcrystals_dilithium2_lowram_poly_challenge>
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
c0de0624:	f002 fe7c 	bl	c0de3320 <crypto_sign_keypair_core>
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
c0de064a:	f002 fe58 	bl	c0de32fe <pqcrystals_dilithium2_lowram_keypair>
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
c0de0678:	f00b fe94 	bl	c0dec3a4 <__aeabi_memcpy>
c0de067c:	2d80      	cmp	r5, #128	@ 0x80
c0de067e:	d013      	beq.n	c0de06a8 <handler_cmd_sign_dilithium+0x44>
c0de0680:	2d01      	cmp	r5, #1
c0de0682:	d01f      	beq.n	c0de06c4 <handler_cmd_sign_dilithium+0x60>
c0de0684:	bb35      	cbnz	r5, c0de06d4 <handler_cmd_sign_dilithium+0x70>
c0de0686:	f60d 2008 	addw	r0, sp, #2568	@ 0xa08
c0de068a:	a902      	add	r1, sp, #8
c0de068c:	f60d 7228 	addw	r2, sp, #3880	@ 0xf28
c0de0690:	f002 fe46 	bl	c0de3320 <crypto_sign_keypair_core>
c0de0694:	4604      	mov	r4, r0
c0de0696:	2800      	cmp	r0, #0
c0de0698:	d13e      	bne.n	c0de0718 <handler_cmd_sign_dilithium+0xb4>
c0de069a:	2000      	movs	r0, #0
c0de069c:	2100      	movs	r1, #0
c0de069e:	f002 ff15 	bl	c0de34cc <crypto_sign_signature_init>
c0de06a2:	f000 f891 	bl	c0de07c8 <OUTLINED_FUNCTION_2>
c0de06a6:	e037      	b.n	c0de0718 <handler_cmd_sign_dilithium+0xb4>
c0de06a8:	f60d 2008 	addw	r0, sp, #2568	@ 0xa08
c0de06ac:	a902      	add	r1, sp, #8
c0de06ae:	f60d 7228 	addw	r2, sp, #3880	@ 0xf28
c0de06b2:	f002 fe35 	bl	c0de3320 <crypto_sign_keypair_core>
c0de06b6:	bb80      	cbnz	r0, c0de071a <handler_cmd_sign_dilithium+0xb6>
c0de06b8:	6860      	ldr	r0, [r4, #4]
c0de06ba:	2801      	cmp	r0, #1
c0de06bc:	d812      	bhi.n	c0de06e4 <handler_cmd_sign_dilithium+0x80>
c0de06be:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de06c2:	e02c      	b.n	c0de071e <handler_cmd_sign_dilithium+0xba>
c0de06c4:	e9d4 0100 	ldrd	r0, r1, [r4]
c0de06c8:	f002 ff2c 	bl	c0de3524 <crypto_sign_signature_absorb>
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
c0de06fc:	f500 60f0 	add.w	r0, r0, #1920	@ 0x780
c0de0700:	f002 ff1c 	bl	c0de353c <crypto_sign_signature_core>
c0de0704:	4604      	mov	r4, r0
c0de0706:	b938      	cbnz	r0, c0de0718 <handler_cmd_sign_dilithium+0xb4>
c0de0708:	eb09 0005 	add.w	r0, r9, r5
c0de070c:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de0710:	f500 60f0 	add.w	r0, r0, #1920	@ 0x780
c0de0714:	f7ff ff0d 	bl	c0de0532 <io_send_response_pointer>
c0de0718:	b124      	cbz	r4, c0de0724 <handler_cmd_sign_dilithium+0xc0>
c0de071a:	f24b 0005 	movw	r0, #45061	@ 0xb005
c0de071e:	f7ff ff13 	bl	c0de0548 <io_send_sw>
c0de0722:	e000      	b.n	c0de0726 <handler_cmd_sign_dilithium+0xc2>
c0de0724:	2000      	movs	r0, #0
c0de0726:	f60d 7d48 	addw	sp, sp, #3912	@ 0xf48
c0de072a:	bdb0      	pop	{r4, r5, r7, pc}
c0de072c:	000002d8 	.word	0x000002d8
c0de0730:	0000dbbe 	.word	0x0000dbbe

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
c0de0752:	f003 f997 	bl	c0de3a84 <pqcrystals_dilithium2_lowram_open>
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
c0de0770:	0000e4a5 	.word	0x0000e4a5
c0de0774:	0000db04 	.word	0x0000db04

c0de0778 <handler_cmd_get_sig_chunk>:
c0de0778:	b580      	push	{r7, lr}
c0de077a:	4806      	ldr	r0, [pc, #24]	@ (c0de0794 <handler_cmd_get_sig_chunk+0x1c>)
c0de077c:	ebc1 2101 	rsb	r1, r1, r1, lsl #8
c0de0780:	4448      	add	r0, r9
c0de0782:	4408      	add	r0, r1
c0de0784:	4611      	mov	r1, r2
c0de0786:	f500 60f0 	add.w	r0, r0, #1920	@ 0x780
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
c0de07a6:	f500 7018 	add.w	r0, r0, #608	@ 0x260
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
c0de07ec:	f00b fdda 	bl	c0dec3a4 <__aeabi_memcpy>
c0de07f0:	2020      	movs	r0, #32
c0de07f2:	f105 0149 	add.w	r1, r5, #73	@ 0x49
c0de07f6:	2220      	movs	r2, #32
c0de07f8:	f88d 0047 	strb.w	r0, [sp, #71]	@ 0x47
c0de07fc:	f104 0043 	add.w	r0, r4, #67	@ 0x43
c0de0800:	f00b fdd0 	bl	c0dec3a4 <__aeabi_memcpy>
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
c0de0824:	f00a ff94 	bl	c0deb750 <io_send_response_buffers>
c0de0828:	b004      	add	sp, #16
c0de082a:	bd80      	pop	{r7, pc}

c0de082c <helper_send_response_sig>:
c0de082c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de082e:	b093      	sub	sp, #76	@ 0x4c
c0de0830:	f10d 0402 	add.w	r4, sp, #2
c0de0834:	2149      	movs	r1, #73	@ 0x49
c0de0836:	1c65      	adds	r5, r4, #1
c0de0838:	4628      	mov	r0, r5
c0de083a:	f00b fdbd 	bl	c0dec3b8 <__aeabi_memclr>
c0de083e:	480b      	ldr	r0, [pc, #44]	@ (c0de086c <helper_send_response_sig+0x40>)
c0de0840:	eb09 0700 	add.w	r7, r9, r0
c0de0844:	4628      	mov	r0, r5
c0de0846:	f897 62a0 	ldrb.w	r6, [r7, #672]	@ 0x2a0
c0de084a:	f507 7116 	add.w	r1, r7, #600	@ 0x258
c0de084e:	4632      	mov	r2, r6
c0de0850:	f88d 6002 	strb.w	r6, [sp, #2]
c0de0854:	f00b fda6 	bl	c0dec3a4 <__aeabi_memcpy>
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
c0de087a:	f00b f95b 	bl	c0debb34 <assert_exit>
c0de087e:	b915      	cbnz	r5, c0de0886 <transaction_deserialize+0x16>
c0de0880:	2001      	movs	r0, #1
c0de0882:	f00b f957 	bl	c0debb34 <assert_exit>
c0de0886:	6860      	ldr	r0, [r4, #4]
c0de0888:	f5b0 7fff 	cmp.w	r0, #510	@ 0x1fe
c0de088c:	d901      	bls.n	c0de0892 <transaction_deserialize+0x22>
c0de088e:	20f9      	movs	r0, #249	@ 0xf9
c0de0890:	e04b      	b.n	c0de092a <transaction_deserialize+0xba>
c0de0892:	4620      	mov	r0, r4
c0de0894:	4629      	mov	r1, r5
c0de0896:	2200      	movs	r2, #0
c0de0898:	f00a fd1c 	bl	c0deb2d4 <buffer_read_u64>
c0de089c:	b330      	cbz	r0, c0de08ec <transaction_deserialize+0x7c>
c0de089e:	6820      	ldr	r0, [r4, #0]
c0de08a0:	68a1      	ldr	r1, [r4, #8]
c0de08a2:	4408      	add	r0, r1
c0de08a4:	2114      	movs	r1, #20
c0de08a6:	61a8      	str	r0, [r5, #24]
c0de08a8:	4620      	mov	r0, r4
c0de08aa:	f00a fcf2 	bl	c0deb292 <buffer_seek_cur>
c0de08ae:	b1f8      	cbz	r0, c0de08f0 <transaction_deserialize+0x80>
c0de08b0:	f105 0108 	add.w	r1, r5, #8
c0de08b4:	4620      	mov	r0, r4
c0de08b6:	2200      	movs	r2, #0
c0de08b8:	2600      	movs	r6, #0
c0de08ba:	f00a fd0b 	bl	c0deb2d4 <buffer_read_u64>
c0de08be:	b1c8      	cbz	r0, c0de08f4 <transaction_deserialize+0x84>
c0de08c0:	f105 0120 	add.w	r1, r5, #32
c0de08c4:	4620      	mov	r0, r4
c0de08c6:	e9c5 6604 	strd	r6, r6, [r5, #16]
c0de08ca:	f00a fd23 	bl	c0deb314 <buffer_read_varint>
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
c0de0902:	f00a fcc6 	bl	c0deb292 <buffer_seek_cur>
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
c0de093a:	f00b f8fb 	bl	c0debb34 <assert_exit>
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
c0de097e:	f00a fee7 	bl	c0deb750 <io_send_response_buffers>
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
c0de09d8:	f00a fdae 	bl	c0deb538 <bip32_derive_with_seed_ecdsa_sign_hash_256>
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
c0de0a2a:	f00b fb51 	bl	c0dec0d0 <os_sched_exit>
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
c0de0a94:	f008 fd48 	bl	c0de9528 <nbgl_useCaseHomeAndSettings>
c0de0a98:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}
c0de0a9a:	bf00      	nop
c0de0a9c:	000013d0 	.word	0x000013d0
c0de0aa0:	0000efc6 	.word	0x0000efc6
c0de0aa4:	0000d08f 	.word	0x0000d08f
c0de0aa8:	0000d606 	.word	0x0000d606
c0de0aac:	0000d206 	.word	0x0000d206
c0de0ab0:	0000ce37 	.word	0x0000ce37
c0de0ab4:	ffffffab 	.word	0xffffffab
c0de0ab8:	0000e69c 	.word	0x0000e69c
c0de0abc:	0000e68e 	.word	0x0000e68e
c0de0ac0:	0000d3fc 	.word	0x0000d3fc
c0de0ac4:	0000bcc1 	.word	0x0000bcc1

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
c0de0afc:	f00b fa3a 	bl	c0debf74 <pic>
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
c0de0b2a:	f00b fa5d 	bl	c0debfe8 <nvm_write>
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
c0de0b4c:	f008 ffce 	bl	c0de9aec <nbgl_useCaseChoice>
c0de0b50:	bdbf      	pop	{r0, r1, r2, r3, r4, r5, r7, pc}
c0de0b52:	bf00      	nop
c0de0b54:	000013d0 	.word	0x000013d0
c0de0b58:	0000ef1e 	.word	0x0000ef1e
c0de0b5c:	0000ef02 	.word	0x0000ef02
c0de0b60:	0000eef2 	.word	0x0000eef2
c0de0b64:	00000045 	.word	0x00000045
c0de0b68:	0000d195 	.word	0x0000d195
c0de0b6c:	0000c413 	.word	0x0000c413
c0de0b70:	0000cd59 	.word	0x0000cd59
c0de0b74:	0000cf04 	.word	0x0000cf04
c0de0b78:	0000d512 	.word	0x0000d512

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
c0de0baa:	f00b fa1d 	bl	c0debfe8 <nvm_write>
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
c0de0bd4:	f008 fca8 	bl	c0de9528 <nbgl_useCaseHomeAndSettings>
c0de0bd8:	b006      	add	sp, #24
c0de0bda:	bdb0      	pop	{r4, r5, r7, pc}
c0de0bdc:	000013d0 	.word	0x000013d0
c0de0be0:	0000ee76 	.word	0x0000ee76
c0de0be4:	fffffe69 	.word	0xfffffe69
c0de0be8:	0000e55a 	.word	0x0000e55a
c0de0bec:	0000e54c 	.word	0x0000e54c
c0de0bf0:	0000d2bc 	.word	0x0000d2bc
c0de0bf4:	0000bb81 	.word	0x0000bb81

c0de0bf8 <OUTLINED_FUNCTION_0>:
c0de0bf8:	4620      	mov	r0, r4
c0de0bfa:	f00b b9bb 	b.w	c0debf74 <pic>
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
c0de0c1e:	f00b fbcb 	bl	c0dec3b8 <__aeabi_memclr>
c0de0c22:	ac03      	add	r4, sp, #12
c0de0c24:	2114      	movs	r1, #20
c0de0c26:	4620      	mov	r0, r4
c0de0c28:	f00b fbc6 	bl	c0dec3b8 <__aeabi_memclr>
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
c0de0c46:	f00a fd21 	bl	c0deb68c <format_hex>
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
c0de0c66:	f009 fbbb 	bl	c0dea3e0 <nbgl_useCaseAddressReview>
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
c0de0c94:	000013ec 	.word	0x000013ec
c0de0c98:	0000005d 	.word	0x0000005d
c0de0c9c:	0000baf1 	.word	0x0000baf1
c0de0ca0:	0000d4f2 	.word	0x0000d4f2

c0de0ca4 <io_send_sw>:
c0de0ca4:	b580      	push	{r7, lr}
c0de0ca6:	4602      	mov	r2, r0
c0de0ca8:	2000      	movs	r0, #0
c0de0caa:	2100      	movs	r1, #0
c0de0cac:	f00a fd50 	bl	c0deb750 <io_send_response_buffers>
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
c0de0ccc:	f008 bec4 	b.w	c0de9a58 <nbgl_useCaseReviewStatus>
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
c0de0cfa:	f00b fb5d 	bl	c0dec3b8 <__aeabi_memclr>
c0de0cfe:	ad05      	add	r5, sp, #20
c0de0d00:	211e      	movs	r1, #30
c0de0d02:	4628      	mov	r0, r5
c0de0d04:	f00b fb58 	bl	c0dec3b8 <__aeabi_memclr>
c0de0d08:	eb09 0007 	add.w	r0, r9, r7
c0de0d0c:	211e      	movs	r1, #30
c0de0d0e:	e9d0 2386 	ldrd	r2, r3, [r0, #536]	@ 0x218
c0de0d12:	2003      	movs	r0, #3
c0de0d14:	9000      	str	r0, [sp, #0]
c0de0d16:	4628      	mov	r0, r5
c0de0d18:	f00a fc71 	bl	c0deb5fe <format_fpu64>
c0de0d1c:	2800      	cmp	r0, #0
c0de0d1e:	d04d      	beq.n	c0de0dbc <ui_display_transaction_bs_choice+0xe8>
c0de0d20:	9500      	str	r5, [sp, #0]
c0de0d22:	eb09 0506 	add.w	r5, r9, r6
c0de0d26:	211e      	movs	r1, #30
c0de0d28:	231e      	movs	r3, #30
c0de0d2a:	4a32      	ldr	r2, [pc, #200]	@ (c0de0df4 <ui_display_transaction_bs_choice+0x120>)
c0de0d2c:	f105 0014 	add.w	r0, r5, #20
c0de0d30:	447a      	add	r2, pc
c0de0d32:	f00a ff8d 	bl	c0debc50 <snprintf>
c0de0d36:	3554      	adds	r5, #84	@ 0x54
c0de0d38:	212b      	movs	r1, #43	@ 0x2b
c0de0d3a:	4628      	mov	r0, r5
c0de0d3c:	f00b fb3c 	bl	c0dec3b8 <__aeabi_memclr>
c0de0d40:	eb09 0007 	add.w	r0, r9, r7
c0de0d44:	2114      	movs	r1, #20
c0de0d46:	462a      	mov	r2, r5
c0de0d48:	232b      	movs	r3, #43	@ 0x2b
c0de0d4a:	f8d0 0228 	ldr.w	r0, [r0, #552]	@ 0x228
c0de0d4e:	f00a fc9d 	bl	c0deb68c <format_hex>
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
c0de0da2:	f009 f87d 	bl	c0de9ea0 <nbgl_useCaseReviewBlindSigning>
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
c0de0de6:	f008 ffad 	bl	c0de9d44 <nbgl_useCaseReview>
c0de0dea:	e7ef      	b.n	c0de0dcc <ui_display_transaction_bs_choice+0xf8>
c0de0dec:	00000000 	.word	0x00000000
c0de0df0:	00001418 	.word	0x00001418
c0de0df4:	0000d1dc 	.word	0x0000d1dc
c0de0df8:	0000cc62 	.word	0x0000cc62
c0de0dfc:	0000d19f 	.word	0x0000d19f
c0de0e00:	0000009f 	.word	0x0000009f
c0de0e04:	0000cd71 	.word	0x0000cd71
c0de0e08:	0000b9b5 	.word	0x0000b9b5
c0de0e0c:	0000cb07 	.word	0x0000cb07
c0de0e10:	0000b971 	.word	0x0000b971
c0de0e14:	0000cac3 	.word	0x0000cac3

c0de0e18 <io_send_sw>:
c0de0e18:	b580      	push	{r7, lr}
c0de0e1a:	4602      	mov	r2, r0
c0de0e1c:	2000      	movs	r0, #0
c0de0e1e:	2100      	movs	r1, #0
c0de0e20:	f00a fc96 	bl	c0deb750 <io_send_response_buffers>
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
c0de0e3c:	f008 be0c 	b.w	c0de9a58 <nbgl_useCaseReviewStatus>
c0de0e40:	fffffbf7 	.word	0xfffffbf7

c0de0e44 <ui_display_blind_signed_transaction>:
c0de0e44:	2001      	movs	r0, #1
c0de0e46:	f7ff bf45 	b.w	c0de0cd4 <ui_display_transaction_bs_choice>

c0de0e4a <ui_display_transaction>:
c0de0e4a:	2000      	movs	r0, #0
c0de0e4c:	f7ff bf42 	b.w	c0de0cd4 <ui_display_transaction_bs_choice>

c0de0e50 <pqcrystals_dilithium_fips202_ref_shake128_init>:
c0de0e50:	b510      	push	{r4, lr}
c0de0e52:	4604      	mov	r4, r0
c0de0e54:	f000 f804 	bl	c0de0e60 <keccak_init>
c0de0e58:	2000      	movs	r0, #0
c0de0e5a:	f8c4 00c8 	str.w	r0, [r4, #200]	@ 0xc8
c0de0e5e:	bd10      	pop	{r4, pc}

c0de0e60 <keccak_init>:
c0de0e60:	2100      	movs	r1, #0
c0de0e62:	2200      	movs	r2, #0
c0de0e64:	2ac8      	cmp	r2, #200	@ 0xc8
c0de0e66:	bf08      	it	eq
c0de0e68:	4770      	bxeq	lr
c0de0e6a:	1883      	adds	r3, r0, r2
c0de0e6c:	5081      	str	r1, [r0, r2]
c0de0e6e:	3208      	adds	r2, #8
c0de0e70:	6059      	str	r1, [r3, #4]
c0de0e72:	e7f7      	b.n	c0de0e64 <keccak_init+0x4>

c0de0e74 <pqcrystals_dilithium_fips202_ref_shake128_absorb>:
c0de0e74:	b51c      	push	{r2, r3, r4, lr}
c0de0e76:	460b      	mov	r3, r1
c0de0e78:	f8d0 10c8 	ldr.w	r1, [r0, #200]	@ 0xc8
c0de0e7c:	9200      	str	r2, [sp, #0]
c0de0e7e:	22a8      	movs	r2, #168	@ 0xa8
c0de0e80:	4604      	mov	r4, r0
c0de0e82:	f000 f802 	bl	c0de0e8a <keccak_absorb>
c0de0e86:	f001 b8f3 	b.w	c0de2070 <OUTLINED_FUNCTION_3>

c0de0e8a <keccak_absorb>:
c0de0e8a:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de0e8e:	f8dd 8020 	ldr.w	r8, [sp, #32]
c0de0e92:	461c      	mov	r4, r3
c0de0e94:	4693      	mov	fp, r2
c0de0e96:	468a      	mov	sl, r1
c0de0e98:	4606      	mov	r6, r0
c0de0e9a:	eb08 050a 	add.w	r5, r8, sl
c0de0e9e:	455d      	cmp	r5, fp
c0de0ea0:	d31b      	bcc.n	c0de0eda <keccak_absorb+0x50>
c0de0ea2:	ea4f 05ca 	mov.w	r5, sl, lsl #3
c0de0ea6:	4657      	mov	r7, sl
c0de0ea8:	455f      	cmp	r7, fp
c0de0eaa:	d20d      	bcs.n	c0de0ec8 <keccak_absorb+0x3e>
c0de0eac:	f814 0b01 	ldrb.w	r0, [r4], #1
c0de0eb0:	f005 0238 	and.w	r2, r5, #56	@ 0x38
c0de0eb4:	2100      	movs	r1, #0
c0de0eb6:	f00b f96d 	bl	c0dec194 <__aeabi_llsl>
c0de0eba:	f027 0207 	bic.w	r2, r7, #7
c0de0ebe:	3508      	adds	r5, #8
c0de0ec0:	3701      	adds	r7, #1
c0de0ec2:	f001 f8c5 	bl	c0de2050 <OUTLINED_FUNCTION_0>
c0de0ec6:	e7ef      	b.n	c0de0ea8 <keccak_absorb+0x1e>
c0de0ec8:	4630      	mov	r0, r6
c0de0eca:	f000 f963 	bl	c0de1194 <KeccakF1600_StatePermute>
c0de0ece:	ebaa 000b 	sub.w	r0, sl, fp
c0de0ed2:	f04f 0a00 	mov.w	sl, #0
c0de0ed6:	4480      	add	r8, r0
c0de0ed8:	e7df      	b.n	c0de0e9a <keccak_absorb+0x10>
c0de0eda:	ea4f 07ca 	mov.w	r7, sl, lsl #3
c0de0ede:	45aa      	cmp	sl, r5
c0de0ee0:	d20e      	bcs.n	c0de0f00 <keccak_absorb+0x76>
c0de0ee2:	f814 0b01 	ldrb.w	r0, [r4], #1
c0de0ee6:	f007 0238 	and.w	r2, r7, #56	@ 0x38
c0de0eea:	2100      	movs	r1, #0
c0de0eec:	f00b f952 	bl	c0dec194 <__aeabi_llsl>
c0de0ef0:	f02a 0207 	bic.w	r2, sl, #7
c0de0ef4:	3708      	adds	r7, #8
c0de0ef6:	f10a 0a01 	add.w	sl, sl, #1
c0de0efa:	f001 f8a9 	bl	c0de2050 <OUTLINED_FUNCTION_0>
c0de0efe:	e7ee      	b.n	c0de0ede <keccak_absorb+0x54>
c0de0f00:	4650      	mov	r0, sl
c0de0f02:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de0f06 <pqcrystals_dilithium_fips202_ref_shake128_finalize>:
c0de0f06:	b5b0      	push	{r4, r5, r7, lr}
c0de0f08:	f8d0 10c8 	ldr.w	r1, [r0, #200]	@ 0xc8
c0de0f0c:	22a8      	movs	r2, #168	@ 0xa8
c0de0f0e:	4604      	mov	r4, r0
c0de0f10:	25a8      	movs	r5, #168	@ 0xa8
c0de0f12:	f000 f803 	bl	c0de0f1c <keccak_finalize>
c0de0f16:	f8c4 50c8 	str.w	r5, [r4, #200]	@ 0xc8
c0de0f1a:	bdb0      	pop	{r4, r5, r7, pc}

c0de0f1c <keccak_finalize>:
c0de0f1c:	b570      	push	{r4, r5, r6, lr}
c0de0f1e:	4606      	mov	r6, r0
c0de0f20:	2038      	movs	r0, #56	@ 0x38
c0de0f22:	4614      	mov	r4, r2
c0de0f24:	460d      	mov	r5, r1
c0de0f26:	ea00 02c1 	and.w	r2, r0, r1, lsl #3
c0de0f2a:	201f      	movs	r0, #31
c0de0f2c:	2100      	movs	r1, #0
c0de0f2e:	f00b f931 	bl	c0dec194 <__aeabi_llsl>
c0de0f32:	f025 0207 	bic.w	r2, r5, #7
c0de0f36:	f001 f88b 	bl	c0de2050 <OUTLINED_FUNCTION_0>
c0de0f3a:	f024 0007 	bic.w	r0, r4, #7
c0de0f3e:	4430      	add	r0, r6
c0de0f40:	f850 1c04 	ldr.w	r1, [r0, #-4]
c0de0f44:	f081 4100 	eor.w	r1, r1, #2147483648	@ 0x80000000
c0de0f48:	f840 1c04 	str.w	r1, [r0, #-4]
c0de0f4c:	bd70      	pop	{r4, r5, r6, pc}

c0de0f4e <pqcrystals_dilithium_fips202_ref_shake128_squeeze>:
c0de0f4e:	b51c      	push	{r2, r3, r4, lr}
c0de0f50:	4614      	mov	r4, r2
c0de0f52:	f8d2 30c8 	ldr.w	r3, [r2, #200]	@ 0xc8
c0de0f56:	22a8      	movs	r2, #168	@ 0xa8
c0de0f58:	9200      	str	r2, [sp, #0]
c0de0f5a:	4622      	mov	r2, r4
c0de0f5c:	f000 f802 	bl	c0de0f64 <keccak_squeeze>
c0de0f60:	f001 b886 	b.w	c0de2070 <OUTLINED_FUNCTION_3>

c0de0f64 <keccak_squeeze>:
c0de0f64:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de0f68:	f8dd 8020 	ldr.w	r8, [sp, #32]
c0de0f6c:	461f      	mov	r7, r3
c0de0f6e:	4693      	mov	fp, r2
c0de0f70:	460d      	mov	r5, r1
c0de0f72:	4606      	mov	r6, r0
c0de0f74:	b1e5      	cbz	r5, c0de0fb0 <keccak_squeeze+0x4c>
c0de0f76:	4547      	cmp	r7, r8
c0de0f78:	d103      	bne.n	c0de0f82 <keccak_squeeze+0x1e>
c0de0f7a:	4658      	mov	r0, fp
c0de0f7c:	f000 f90a 	bl	c0de1194 <KeccakF1600_StatePermute>
c0de0f80:	2700      	movs	r7, #0
c0de0f82:	eb07 0a05 	add.w	sl, r7, r5
c0de0f86:	00fc      	lsls	r4, r7, #3
c0de0f88:	4547      	cmp	r7, r8
c0de0f8a:	d2f3      	bcs.n	c0de0f74 <keccak_squeeze+0x10>
c0de0f8c:	45ba      	cmp	sl, r7
c0de0f8e:	d9f1      	bls.n	c0de0f74 <keccak_squeeze+0x10>
c0de0f90:	f027 0107 	bic.w	r1, r7, #7
c0de0f94:	f004 0238 	and.w	r2, r4, #56	@ 0x38
c0de0f98:	f85b 0001 	ldr.w	r0, [fp, r1]
c0de0f9c:	4459      	add	r1, fp
c0de0f9e:	6849      	ldr	r1, [r1, #4]
c0de0fa0:	f00b f90a 	bl	c0dec1b8 <__aeabi_llsr>
c0de0fa4:	f806 0b01 	strb.w	r0, [r6], #1
c0de0fa8:	3408      	adds	r4, #8
c0de0faa:	3d01      	subs	r5, #1
c0de0fac:	3701      	adds	r7, #1
c0de0fae:	e7eb      	b.n	c0de0f88 <keccak_squeeze+0x24>
c0de0fb0:	4638      	mov	r0, r7
c0de0fb2:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de0fb6 <keccak_absorb_once>:
c0de0fb6:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de0fba:	4688      	mov	r8, r1
c0de0fbc:	4604      	mov	r4, r0
c0de0fbe:	461f      	mov	r7, r3
c0de0fc0:	2000      	movs	r0, #0
c0de0fc2:	2100      	movs	r1, #0
c0de0fc4:	9202      	str	r2, [sp, #8]
c0de0fc6:	29c8      	cmp	r1, #200	@ 0xc8
c0de0fc8:	d004      	beq.n	c0de0fd4 <keccak_absorb_once+0x1e>
c0de0fca:	1862      	adds	r2, r4, r1
c0de0fcc:	5060      	str	r0, [r4, r1]
c0de0fce:	3108      	adds	r1, #8
c0de0fd0:	6050      	str	r0, [r2, #4]
c0de0fd2:	e7f8      	b.n	c0de0fc6 <keccak_absorb_once+0x10>
c0de0fd4:	ea4f 00d8 	mov.w	r0, r8, lsr #3
c0de0fd8:	f8cd 8000 	str.w	r8, [sp]
c0de0fdc:	9003      	str	r0, [sp, #12]
c0de0fde:	4547      	cmp	r7, r8
c0de0fe0:	d335      	bcc.n	c0de104e <keccak_absorb_once+0x98>
c0de0fe2:	9e02      	ldr	r6, [sp, #8]
c0de0fe4:	f04f 0800 	mov.w	r8, #0
c0de0fe8:	9701      	str	r7, [sp, #4]
c0de0fea:	9803      	ldr	r0, [sp, #12]
c0de0fec:	4580      	cmp	r8, r0
c0de0fee:	d023      	beq.n	c0de1038 <keccak_absorb_once+0x82>
c0de0ff0:	2500      	movs	r5, #0
c0de0ff2:	4637      	mov	r7, r6
c0de0ff4:	f04f 0a00 	mov.w	sl, #0
c0de0ff8:	f04f 0b00 	mov.w	fp, #0
c0de0ffc:	2d40      	cmp	r5, #64	@ 0x40
c0de0ffe:	d00b      	beq.n	c0de1018 <keccak_absorb_once+0x62>
c0de1000:	f817 0b01 	ldrb.w	r0, [r7], #1
c0de1004:	2100      	movs	r1, #0
c0de1006:	462a      	mov	r2, r5
c0de1008:	f00b f8c4 	bl	c0dec194 <__aeabi_llsl>
c0de100c:	ea4b 0b01 	orr.w	fp, fp, r1
c0de1010:	ea4a 0a00 	orr.w	sl, sl, r0
c0de1014:	3508      	adds	r5, #8
c0de1016:	e7f1      	b.n	c0de0ffc <keccak_absorb_once+0x46>
c0de1018:	f854 0038 	ldr.w	r0, [r4, r8, lsl #3]
c0de101c:	3608      	adds	r6, #8
c0de101e:	ea80 000a 	eor.w	r0, r0, sl
c0de1022:	f844 0038 	str.w	r0, [r4, r8, lsl #3]
c0de1026:	eb04 00c8 	add.w	r0, r4, r8, lsl #3
c0de102a:	f108 0801 	add.w	r8, r8, #1
c0de102e:	6841      	ldr	r1, [r0, #4]
c0de1030:	ea81 010b 	eor.w	r1, r1, fp
c0de1034:	6041      	str	r1, [r0, #4]
c0de1036:	e7d8      	b.n	c0de0fea <keccak_absorb_once+0x34>
c0de1038:	4620      	mov	r0, r4
c0de103a:	f000 f8ab 	bl	c0de1194 <KeccakF1600_StatePermute>
c0de103e:	e9dd 8700 	ldrd	r8, r7, [sp]
c0de1042:	9802      	ldr	r0, [sp, #8]
c0de1044:	4440      	add	r0, r8
c0de1046:	eba7 0708 	sub.w	r7, r7, r8
c0de104a:	9002      	str	r0, [sp, #8]
c0de104c:	e7c7      	b.n	c0de0fde <keccak_absorb_once+0x28>
c0de104e:	2500      	movs	r5, #0
c0de1050:	2600      	movs	r6, #0
c0de1052:	42b7      	cmp	r7, r6
c0de1054:	d00d      	beq.n	c0de1072 <keccak_absorb_once+0xbc>
c0de1056:	9802      	ldr	r0, [sp, #8]
c0de1058:	f005 0238 	and.w	r2, r5, #56	@ 0x38
c0de105c:	2100      	movs	r1, #0
c0de105e:	5d80      	ldrb	r0, [r0, r6]
c0de1060:	f00b f898 	bl	c0dec194 <__aeabi_llsl>
c0de1064:	f026 0207 	bic.w	r2, r6, #7
c0de1068:	3508      	adds	r5, #8
c0de106a:	3601      	adds	r6, #1
c0de106c:	f000 fff8 	bl	c0de2060 <OUTLINED_FUNCTION_2>
c0de1070:	e7ef      	b.n	c0de1052 <keccak_absorb_once+0x9c>
c0de1072:	2038      	movs	r0, #56	@ 0x38
c0de1074:	2100      	movs	r1, #0
c0de1076:	ea00 02c7 	and.w	r2, r0, r7, lsl #3
c0de107a:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de107c:	f00b f88a 	bl	c0dec194 <__aeabi_llsl>
c0de1080:	f027 0207 	bic.w	r2, r7, #7
c0de1084:	f000 ffec 	bl	c0de2060 <OUTLINED_FUNCTION_2>
c0de1088:	f1a8 0001 	sub.w	r0, r8, #1
c0de108c:	f020 0007 	bic.w	r0, r0, #7
c0de1090:	4420      	add	r0, r4
c0de1092:	6841      	ldr	r1, [r0, #4]
c0de1094:	f081 4100 	eor.w	r1, r1, #2147483648	@ 0x80000000
c0de1098:	6041      	str	r1, [r0, #4]
c0de109a:	e8bd 8dff 	ldmia.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de109e <pqcrystals_dilithium_fips202_ref_shake128_squeezeblocks>:
c0de109e:	23a8      	movs	r3, #168	@ 0xa8
c0de10a0:	f000 b800 	b.w	c0de10a4 <keccak_squeezeblocks>

c0de10a4 <keccak_squeezeblocks>:
c0de10a4:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de10a8:	4698      	mov	r8, r3
c0de10aa:	4615      	mov	r5, r2
c0de10ac:	468b      	mov	fp, r1
c0de10ae:	4607      	mov	r7, r0
c0de10b0:	ea4f 0ad3 	mov.w	sl, r3, lsr #3
c0de10b4:	f1bb 0f00 	cmp.w	fp, #0
c0de10b8:	bf08      	it	eq
c0de10ba:	e8bd 8df0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de10be:	4628      	mov	r0, r5
c0de10c0:	f000 f868 	bl	c0de1194 <KeccakF1600_StatePermute>
c0de10c4:	2400      	movs	r4, #0
c0de10c6:	4656      	mov	r6, sl
c0de10c8:	b146      	cbz	r6, c0de10dc <keccak_squeezeblocks+0x38>
c0de10ca:	1929      	adds	r1, r5, r4
c0de10cc:	592a      	ldr	r2, [r5, r4]
c0de10ce:	1938      	adds	r0, r7, r4
c0de10d0:	684b      	ldr	r3, [r1, #4]
c0de10d2:	f000 ffac 	bl	c0de202e <store64>
c0de10d6:	3408      	adds	r4, #8
c0de10d8:	3e01      	subs	r6, #1
c0de10da:	e7f5      	b.n	c0de10c8 <keccak_squeezeblocks+0x24>
c0de10dc:	4447      	add	r7, r8
c0de10de:	f1ab 0b01 	sub.w	fp, fp, #1
c0de10e2:	e7e7      	b.n	c0de10b4 <keccak_squeezeblocks+0x10>

c0de10e4 <pqcrystals_dilithium_fips202_ref_shake256_init>:
c0de10e4:	b510      	push	{r4, lr}
c0de10e6:	4604      	mov	r4, r0
c0de10e8:	f7ff feba 	bl	c0de0e60 <keccak_init>
c0de10ec:	2000      	movs	r0, #0
c0de10ee:	f8c4 00c8 	str.w	r0, [r4, #200]	@ 0xc8
c0de10f2:	bd10      	pop	{r4, pc}

c0de10f4 <pqcrystals_dilithium_fips202_ref_shake256_absorb>:
c0de10f4:	b51c      	push	{r2, r3, r4, lr}
c0de10f6:	460b      	mov	r3, r1
c0de10f8:	f8d0 10c8 	ldr.w	r1, [r0, #200]	@ 0xc8
c0de10fc:	9200      	str	r2, [sp, #0]
c0de10fe:	2288      	movs	r2, #136	@ 0x88
c0de1100:	4604      	mov	r4, r0
c0de1102:	f7ff fec2 	bl	c0de0e8a <keccak_absorb>
c0de1106:	f000 bfb3 	b.w	c0de2070 <OUTLINED_FUNCTION_3>

c0de110a <pqcrystals_dilithium_fips202_ref_shake256_finalize>:
c0de110a:	b5b0      	push	{r4, r5, r7, lr}
c0de110c:	f8d0 10c8 	ldr.w	r1, [r0, #200]	@ 0xc8
c0de1110:	2288      	movs	r2, #136	@ 0x88
c0de1112:	4604      	mov	r4, r0
c0de1114:	2588      	movs	r5, #136	@ 0x88
c0de1116:	f7ff ff01 	bl	c0de0f1c <keccak_finalize>
c0de111a:	f8c4 50c8 	str.w	r5, [r4, #200]	@ 0xc8
c0de111e:	bdb0      	pop	{r4, r5, r7, pc}

c0de1120 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>:
c0de1120:	b51c      	push	{r2, r3, r4, lr}
c0de1122:	4614      	mov	r4, r2
c0de1124:	f8d2 30c8 	ldr.w	r3, [r2, #200]	@ 0xc8
c0de1128:	2288      	movs	r2, #136	@ 0x88
c0de112a:	9200      	str	r2, [sp, #0]
c0de112c:	4622      	mov	r2, r4
c0de112e:	f7ff ff19 	bl	c0de0f64 <keccak_squeeze>
c0de1132:	f000 bf9d 	b.w	c0de2070 <OUTLINED_FUNCTION_3>

c0de1136 <pqcrystals_dilithium_fips202_ref_shake256_absorb_once>:
c0de1136:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0de1138:	4604      	mov	r4, r0
c0de113a:	201f      	movs	r0, #31
c0de113c:	4613      	mov	r3, r2
c0de113e:	460a      	mov	r2, r1
c0de1140:	2188      	movs	r1, #136	@ 0x88
c0de1142:	2588      	movs	r5, #136	@ 0x88
c0de1144:	9000      	str	r0, [sp, #0]
c0de1146:	4620      	mov	r0, r4
c0de1148:	f7ff ff35 	bl	c0de0fb6 <keccak_absorb_once>
c0de114c:	f8c4 50c8 	str.w	r5, [r4, #200]	@ 0xc8
c0de1150:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0de1152 <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>:
c0de1152:	2388      	movs	r3, #136	@ 0x88
c0de1154:	f7ff bfa6 	b.w	c0de10a4 <keccak_squeezeblocks>

c0de1158 <pqcrystals_dilithium_fips202_ref_shake256>:
c0de1158:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de115a:	b0b5      	sub	sp, #212	@ 0xd4
c0de115c:	466e      	mov	r6, sp
c0de115e:	460c      	mov	r4, r1
c0de1160:	4605      	mov	r5, r0
c0de1162:	4611      	mov	r1, r2
c0de1164:	461a      	mov	r2, r3
c0de1166:	4630      	mov	r0, r6
c0de1168:	f7ff ffe5 	bl	c0de1136 <pqcrystals_dilithium_fips202_ref_shake256_absorb_once>
c0de116c:	2088      	movs	r0, #136	@ 0x88
c0de116e:	4632      	mov	r2, r6
c0de1170:	fbb4 f7f0 	udiv	r7, r4, r0
c0de1174:	4628      	mov	r0, r5
c0de1176:	4639      	mov	r1, r7
c0de1178:	f7ff ffeb 	bl	c0de1152 <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>
c0de117c:	eb07 1107 	add.w	r1, r7, r7, lsl #4
c0de1180:	4632      	mov	r2, r6
c0de1182:	eb05 00c1 	add.w	r0, r5, r1, lsl #3
c0de1186:	eba4 01c1 	sub.w	r1, r4, r1, lsl #3
c0de118a:	f7ff ffc9 	bl	c0de1120 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de118e:	b035      	add	sp, #212	@ 0xd4
c0de1190:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

c0de1194 <KeccakF1600_StatePermute>:
c0de1194:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1198:	b0de      	sub	sp, #376	@ 0x178
c0de119a:	e9d0 2130 	ldrd	r2, r1, [r0, #192]	@ 0xc0
c0de119e:	9000      	str	r0, [sp, #0]
c0de11a0:	9156      	str	r1, [sp, #344]	@ 0x158
c0de11a2:	f8d0 10a0 	ldr.w	r1, [r0, #160]	@ 0xa0
c0de11a6:	9253      	str	r2, [sp, #332]	@ 0x14c
c0de11a8:	e9d0 2302 	ldrd	r2, r3, [r0, #8]
c0de11ac:	912a      	str	r1, [sp, #168]	@ 0xa8
c0de11ae:	f8d0 10a4 	ldr.w	r1, [r0, #164]	@ 0xa4
c0de11b2:	912c      	str	r1, [sp, #176]	@ 0xb0
c0de11b4:	f8d0 10a8 	ldr.w	r1, [r0, #168]	@ 0xa8
c0de11b8:	9148      	str	r1, [sp, #288]	@ 0x120
c0de11ba:	f8d0 10ac 	ldr.w	r1, [r0, #172]	@ 0xac
c0de11be:	914f      	str	r1, [sp, #316]	@ 0x13c
c0de11c0:	f8d0 10b0 	ldr.w	r1, [r0, #176]	@ 0xb0
c0de11c4:	9143      	str	r1, [sp, #268]	@ 0x10c
c0de11c6:	f8d0 10b4 	ldr.w	r1, [r0, #180]	@ 0xb4
c0de11ca:	914d      	str	r1, [sp, #308]	@ 0x134
c0de11cc:	f8d0 10b8 	ldr.w	r1, [r0, #184]	@ 0xb8
c0de11d0:	9151      	str	r1, [sp, #324]	@ 0x144
c0de11d2:	f8d0 10bc 	ldr.w	r1, [r0, #188]	@ 0xbc
c0de11d6:	9154      	str	r1, [sp, #336]	@ 0x150
c0de11d8:	f8d0 1080 	ldr.w	r1, [r0, #128]	@ 0x80
c0de11dc:	9136      	str	r1, [sp, #216]	@ 0xd8
c0de11de:	f8d0 1084 	ldr.w	r1, [r0, #132]	@ 0x84
c0de11e2:	913e      	str	r1, [sp, #248]	@ 0xf8
c0de11e4:	f8d0 1088 	ldr.w	r1, [r0, #136]	@ 0x88
c0de11e8:	9142      	str	r1, [sp, #264]	@ 0x108
c0de11ea:	f8d0 108c 	ldr.w	r1, [r0, #140]	@ 0x8c
c0de11ee:	914a      	str	r1, [sp, #296]	@ 0x128
c0de11f0:	f8d0 1090 	ldr.w	r1, [r0, #144]	@ 0x90
c0de11f4:	913f      	str	r1, [sp, #252]	@ 0xfc
c0de11f6:	f8d0 1094 	ldr.w	r1, [r0, #148]	@ 0x94
c0de11fa:	9147      	str	r1, [sp, #284]	@ 0x11c
c0de11fc:	f8d0 1098 	ldr.w	r1, [r0, #152]	@ 0x98
c0de1200:	9134      	str	r1, [sp, #208]	@ 0xd0
c0de1202:	f8d0 109c 	ldr.w	r1, [r0, #156]	@ 0x9c
c0de1206:	913a      	str	r1, [sp, #232]	@ 0xe8
c0de1208:	6e01      	ldr	r1, [r0, #96]	@ 0x60
c0de120a:	9141      	str	r1, [sp, #260]	@ 0x104
c0de120c:	6e41      	ldr	r1, [r0, #100]	@ 0x64
c0de120e:	9149      	str	r1, [sp, #292]	@ 0x124
c0de1210:	6e81      	ldr	r1, [r0, #104]	@ 0x68
c0de1212:	914e      	str	r1, [sp, #312]	@ 0x138
c0de1214:	6ec1      	ldr	r1, [r0, #108]	@ 0x6c
c0de1216:	9152      	str	r1, [sp, #328]	@ 0x148
c0de1218:	6f01      	ldr	r1, [r0, #112]	@ 0x70
c0de121a:	9150      	str	r1, [sp, #320]	@ 0x140
c0de121c:	6f41      	ldr	r1, [r0, #116]	@ 0x74
c0de121e:	9155      	str	r1, [sp, #340]	@ 0x154
c0de1220:	6f81      	ldr	r1, [r0, #120]	@ 0x78
c0de1222:	9135      	str	r1, [sp, #212]	@ 0xd4
c0de1224:	6fc1      	ldr	r1, [r0, #124]	@ 0x7c
c0de1226:	913c      	str	r1, [sp, #240]	@ 0xf0
c0de1228:	6c01      	ldr	r1, [r0, #64]	@ 0x40
c0de122a:	9145      	str	r1, [sp, #276]	@ 0x114
c0de122c:	6c41      	ldr	r1, [r0, #68]	@ 0x44
c0de122e:	914c      	str	r1, [sp, #304]	@ 0x130
c0de1230:	6c81      	ldr	r1, [r0, #72]	@ 0x48
c0de1232:	9139      	str	r1, [sp, #228]	@ 0xe4
c0de1234:	6cc1      	ldr	r1, [r0, #76]	@ 0x4c
c0de1236:	913b      	str	r1, [sp, #236]	@ 0xec
c0de1238:	6d01      	ldr	r1, [r0, #80]	@ 0x50
c0de123a:	9140      	str	r1, [sp, #256]	@ 0x100
c0de123c:	6d41      	ldr	r1, [r0, #84]	@ 0x54
c0de123e:	9146      	str	r1, [sp, #280]	@ 0x118
c0de1240:	6d81      	ldr	r1, [r0, #88]	@ 0x58
c0de1242:	9144      	str	r1, [sp, #272]	@ 0x110
c0de1244:	6dc1      	ldr	r1, [r0, #92]	@ 0x5c
c0de1246:	914b      	str	r1, [sp, #300]	@ 0x12c
c0de1248:	6a01      	ldr	r1, [r0, #32]
c0de124a:	9158      	str	r1, [sp, #352]	@ 0x160
c0de124c:	e9d0 e109 	ldrd	lr, r1, [r0, #36]	@ 0x24
c0de1250:	9133      	str	r1, [sp, #204]	@ 0xcc
c0de1252:	6ac1      	ldr	r1, [r0, #44]	@ 0x2c
c0de1254:	913d      	str	r1, [sp, #244]	@ 0xf4
c0de1256:	6b01      	ldr	r1, [r0, #48]	@ 0x30
c0de1258:	9131      	str	r1, [sp, #196]	@ 0xc4
c0de125a:	6b41      	ldr	r1, [r0, #52]	@ 0x34
c0de125c:	9132      	str	r1, [sp, #200]	@ 0xc8
c0de125e:	6b81      	ldr	r1, [r0, #56]	@ 0x38
c0de1260:	9137      	str	r1, [sp, #220]	@ 0xdc
c0de1262:	6bc1      	ldr	r1, [r0, #60]	@ 0x3c
c0de1264:	9138      	str	r1, [sp, #224]	@ 0xe0
c0de1266:	6801      	ldr	r1, [r0, #0]
c0de1268:	915a      	str	r1, [sp, #360]	@ 0x168
c0de126a:	6841      	ldr	r1, [r0, #4]
c0de126c:	915b      	str	r1, [sp, #364]	@ 0x16c
c0de126e:	6901      	ldr	r1, [r0, #16]
c0de1270:	9159      	str	r1, [sp, #356]	@ 0x164
c0de1272:	6941      	ldr	r1, [r0, #20]
c0de1274:	915c      	str	r1, [sp, #368]	@ 0x170
c0de1276:	6981      	ldr	r1, [r0, #24]
c0de1278:	69c0      	ldr	r0, [r0, #28]
c0de127a:	912e      	str	r1, [sp, #184]	@ 0xb8
c0de127c:	9030      	str	r0, [sp, #192]	@ 0xc0
c0de127e:	4803      	ldr	r0, [pc, #12]	@ (c0de128c <KeccakF1600_StatePermute+0xf8>)
c0de1280:	4478      	add	r0, pc
c0de1282:	3008      	adds	r0, #8
c0de1284:	905d      	str	r0, [sp, #372]	@ 0x174
c0de1286:	2000      	movs	r0, #0
c0de1288:	e002      	b.n	c0de1290 <KeccakF1600_StatePermute+0xfc>
c0de128a:	bf00      	nop
c0de128c:	0000def4 	.word	0x0000def4
c0de1290:	2817      	cmp	r0, #23
c0de1292:	f200 8654 	bhi.w	c0de1f3e <KeccakF1600_StatePermute+0xdaa>
c0de1296:	9027      	str	r0, [sp, #156]	@ 0x9c
c0de1298:	9848      	ldr	r0, [sp, #288]	@ 0x120
c0de129a:	9936      	ldr	r1, [sp, #216]	@ 0xd8
c0de129c:	469a      	mov	sl, r3
c0de129e:	9257      	str	r2, [sp, #348]	@ 0x15c
c0de12a0:	f8cd e098 	str.w	lr, [sp, #152]	@ 0x98
c0de12a4:	4048      	eors	r0, r1
c0de12a6:	9944      	ldr	r1, [sp, #272]	@ 0x110
c0de12a8:	4048      	eors	r0, r1
c0de12aa:	9931      	ldr	r1, [sp, #196]	@ 0xc4
c0de12ac:	4048      	eors	r0, r1
c0de12ae:	993e      	ldr	r1, [sp, #248]	@ 0xf8
c0de12b0:	ea80 0402 	eor.w	r4, r0, r2
c0de12b4:	984f      	ldr	r0, [sp, #316]	@ 0x13c
c0de12b6:	9423      	str	r4, [sp, #140]	@ 0x8c
c0de12b8:	4048      	eors	r0, r1
c0de12ba:	994b      	ldr	r1, [sp, #300]	@ 0x12c
c0de12bc:	4048      	eors	r0, r1
c0de12be:	9932      	ldr	r1, [sp, #200]	@ 0xc8
c0de12c0:	4048      	eors	r0, r1
c0de12c2:	993a      	ldr	r1, [sp, #232]	@ 0xe8
c0de12c4:	4058      	eors	r0, r3
c0de12c6:	0043      	lsls	r3, r0, #1
c0de12c8:	4606      	mov	r6, r0
c0de12ca:	9028      	str	r0, [sp, #160]	@ 0xa0
c0de12cc:	9856      	ldr	r0, [sp, #344]	@ 0x158
c0de12ce:	ea43 75d4 	orr.w	r5, r3, r4, lsr #31
c0de12d2:	ea81 0300 	eor.w	r3, r1, r0
c0de12d6:	9855      	ldr	r0, [sp, #340]	@ 0x154
c0de12d8:	4043      	eors	r3, r0
c0de12da:	983b      	ldr	r0, [sp, #236]	@ 0xec
c0de12dc:	4043      	eors	r3, r0
c0de12de:	982c      	ldr	r0, [sp, #176]	@ 0xb0
c0de12e0:	ea83 0b0e 	eor.w	fp, r3, lr
c0de12e4:	9b34      	ldr	r3, [sp, #208]	@ 0xd0
c0de12e6:	ea85 010b 	eor.w	r1, r5, fp
c0de12ea:	0065      	lsls	r5, r4, #1
c0de12ec:	ea81 0200 	eor.w	r2, r1, r0
c0de12f0:	912f      	str	r1, [sp, #188]	@ 0xbc
c0de12f2:	9953      	ldr	r1, [sp, #332]	@ 0x14c
c0de12f4:	ea45 76d6 	orr.w	r6, r5, r6, lsr #31
c0de12f8:	9222      	str	r2, [sp, #136]	@ 0x88
c0de12fa:	ea83 0501 	eor.w	r5, r3, r1
c0de12fe:	9950      	ldr	r1, [sp, #320]	@ 0x140
c0de1300:	9b2a      	ldr	r3, [sp, #168]	@ 0xa8
c0de1302:	404d      	eors	r5, r1
c0de1304:	9939      	ldr	r1, [sp, #228]	@ 0xe4
c0de1306:	404d      	eors	r5, r1
c0de1308:	9958      	ldr	r1, [sp, #352]	@ 0x160
c0de130a:	ea85 0801 	eor.w	r8, r5, r1
c0de130e:	ea86 0108 	eor.w	r1, r6, r8
c0de1312:	ea81 0403 	eor.w	r4, r1, r3
c0de1316:	912b      	str	r1, [sp, #172]	@ 0xac
c0de1318:	04a6      	lsls	r6, r4, #18
c0de131a:	9425      	str	r4, [sp, #148]	@ 0x94
c0de131c:	ea46 3c92 	orr.w	ip, r6, r2, lsr #14
c0de1320:	e9dd 1242 	ldrd	r1, r2, [sp, #264]	@ 0x108
c0de1324:	f8cd c070 	str.w	ip, [sp, #112]	@ 0x70
c0de1328:	ea81 0602 	eor.w	r6, r1, r2
c0de132c:	9941      	ldr	r1, [sp, #260]	@ 0x104
c0de132e:	9a4d      	ldr	r2, [sp, #308]	@ 0x134
c0de1330:	404e      	eors	r6, r1
c0de1332:	9937      	ldr	r1, [sp, #220]	@ 0xdc
c0de1334:	404e      	eors	r6, r1
c0de1336:	9959      	ldr	r1, [sp, #356]	@ 0x164
c0de1338:	ea86 0e01 	eor.w	lr, r6, r1
c0de133c:	994a      	ldr	r1, [sp, #296]	@ 0x128
c0de133e:	9e30      	ldr	r6, [sp, #192]	@ 0xc0
c0de1340:	ea81 0702 	eor.w	r7, r1, r2
c0de1344:	9949      	ldr	r1, [sp, #292]	@ 0x124
c0de1346:	404f      	eors	r7, r1
c0de1348:	9938      	ldr	r1, [sp, #224]	@ 0xe0
c0de134a:	404f      	eors	r7, r1
c0de134c:	995c      	ldr	r1, [sp, #368]	@ 0x170
c0de134e:	404f      	eors	r7, r1
c0de1350:	993c      	ldr	r1, [sp, #240]	@ 0xf0
c0de1352:	007c      	lsls	r4, r7, #1
c0de1354:	ea81 0200 	eor.w	r2, r1, r0
c0de1358:	9846      	ldr	r0, [sp, #280]	@ 0x118
c0de135a:	ea44 74de 	orr.w	r4, r4, lr, lsr #31
c0de135e:	4042      	eors	r2, r0
c0de1360:	983d      	ldr	r0, [sp, #244]	@ 0xf4
c0de1362:	4042      	eors	r2, r0
c0de1364:	985b      	ldr	r0, [sp, #364]	@ 0x16c
c0de1366:	ea82 0100 	eor.w	r1, r2, r0
c0de136a:	ea4f 024e 	mov.w	r2, lr, lsl #1
c0de136e:	ea81 0004 	eor.w	r0, r1, r4
c0de1372:	ea42 72d7 	orr.w	r2, r2, r7, lsr #31
c0de1376:	ea80 050a 	eor.w	r5, r0, sl
c0de137a:	902d      	str	r0, [sp, #180]	@ 0xb4
c0de137c:	9835      	ldr	r0, [sp, #212]	@ 0xd4
c0de137e:	9520      	str	r5, [sp, #128]	@ 0x80
c0de1380:	ea80 0403 	eor.w	r4, r0, r3
c0de1384:	9840      	ldr	r0, [sp, #256]	@ 0x100
c0de1386:	4044      	eors	r4, r0
c0de1388:	9833      	ldr	r0, [sp, #204]	@ 0xcc
c0de138a:	4044      	eors	r4, r0
c0de138c:	985a      	ldr	r0, [sp, #360]	@ 0x168
c0de138e:	4044      	eors	r4, r0
c0de1390:	9857      	ldr	r0, [sp, #348]	@ 0x15c
c0de1392:	ea84 0a02 	eor.w	sl, r4, r2
c0de1396:	ea80 000a 	eor.w	r0, r0, sl
c0de139a:	f8cd a064 	str.w	sl, [sp, #100]	@ 0x64
c0de139e:	0042      	lsls	r2, r0, #1
c0de13a0:	9021      	str	r0, [sp, #132]	@ 0x84
c0de13a2:	9854      	ldr	r0, [sp, #336]	@ 0x150
c0de13a4:	ea42 72d5 	orr.w	r2, r2, r5, lsr #31
c0de13a8:	9257      	str	r2, [sp, #348]	@ 0x15c
c0de13aa:	ea22 0c0c 	bic.w	ip, r2, ip
c0de13ae:	004a      	lsls	r2, r1, #1
c0de13b0:	ea42 73d4 	orr.w	r3, r2, r4, lsr #31
c0de13b4:	9a47      	ldr	r2, [sp, #284]	@ 0x11c
c0de13b6:	4042      	eors	r2, r0
c0de13b8:	9852      	ldr	r0, [sp, #328]	@ 0x148
c0de13ba:	4042      	eors	r2, r0
c0de13bc:	984c      	ldr	r0, [sp, #304]	@ 0x130
c0de13be:	4042      	eors	r2, r0
c0de13c0:	ea82 0506 	eor.w	r5, r2, r6
c0de13c4:	9a3a      	ldr	r2, [sp, #232]	@ 0xe8
c0de13c6:	ea83 0005 	eor.w	r0, r3, r5
c0de13ca:	0063      	lsls	r3, r4, #1
c0de13cc:	9c2e      	ldr	r4, [sp, #184]	@ 0xb8
c0de13ce:	4042      	eors	r2, r0
c0de13d0:	902a      	str	r0, [sp, #168]	@ 0xa8
c0de13d2:	ea43 70d1 	orr.w	r0, r3, r1, lsr #31
c0de13d6:	9951      	ldr	r1, [sp, #324]	@ 0x144
c0de13d8:	9b3f      	ldr	r3, [sp, #252]	@ 0xfc
c0de13da:	9212      	str	r2, [sp, #72]	@ 0x48
c0de13dc:	404b      	eors	r3, r1
c0de13de:	994e      	ldr	r1, [sp, #312]	@ 0x138
c0de13e0:	404b      	eors	r3, r1
c0de13e2:	9945      	ldr	r1, [sp, #276]	@ 0x114
c0de13e4:	404b      	eors	r3, r1
c0de13e6:	4063      	eors	r3, r4
c0de13e8:	ea80 0103 	eor.w	r1, r0, r3
c0de13ec:	9834      	ldr	r0, [sp, #208]	@ 0xd0
c0de13ee:	9129      	str	r1, [sp, #164]	@ 0xa4
c0de13f0:	4048      	eors	r0, r1
c0de13f2:	901d      	str	r0, [sp, #116]	@ 0x74
c0de13f4:	0200      	lsls	r0, r0, #8
c0de13f6:	ea40 6012 	orr.w	r0, r0, r2, lsr #24
c0de13fa:	ea8c 0c00 	eor.w	ip, ip, r0
c0de13fe:	9034      	str	r0, [sp, #208]	@ 0xd0
c0de1400:	ea4f 004b 	mov.w	r0, fp, lsl #1
c0de1404:	ea40 70d8 	orr.w	r0, r0, r8, lsr #31
c0de1408:	f8cd c090 	str.w	ip, [sp, #144]	@ 0x90
c0de140c:	4078      	eors	r0, r7
c0de140e:	ea80 0106 	eor.w	r1, r0, r6
c0de1412:	902c      	str	r0, [sp, #176]	@ 0xb0
c0de1414:	ea4f 0048 	mov.w	r0, r8, lsl #1
c0de1418:	ea40 70db 	orr.w	r0, r0, fp, lsr #31
c0de141c:	9130      	str	r1, [sp, #192]	@ 0xc0
c0de141e:	ea80 000e 	eor.w	r0, r0, lr
c0de1422:	ea80 0204 	eor.w	r2, r0, r4
c0de1426:	4604      	mov	r4, r0
c0de1428:	0710      	lsls	r0, r2, #28
c0de142a:	922e      	str	r2, [sp, #184]	@ 0xb8
c0de142c:	9a23      	ldr	r2, [sp, #140]	@ 0x8c
c0de142e:	9413      	str	r4, [sp, #76]	@ 0x4c
c0de1430:	ea40 1111 	orr.w	r1, r0, r1, lsr #4
c0de1434:	0058      	lsls	r0, r3, #1
c0de1436:	ea40 70d5 	orr.w	r0, r0, r5, lsr #31
c0de143a:	913a      	str	r1, [sp, #232]	@ 0xe8
c0de143c:	ea82 0800 	eor.w	r8, r2, r0
c0de1440:	9a43      	ldr	r2, [sp, #268]	@ 0x10c
c0de1442:	0068      	lsls	r0, r5, #1
c0de1444:	ea40 70d3 	orr.w	r0, r0, r3, lsr #31
c0de1448:	9b2b      	ldr	r3, [sp, #172]	@ 0xac
c0de144a:	f8cd 802c 	str.w	r8, [sp, #44]	@ 0x2c
c0de144e:	ea88 0602 	eor.w	r6, r8, r2
c0de1452:	9a28      	ldr	r2, [sp, #160]	@ 0xa0
c0de1454:	9616      	str	r6, [sp, #88]	@ 0x58
c0de1456:	ea82 0e00 	eor.w	lr, r2, r0
c0de145a:	9a4d      	ldr	r2, [sp, #308]	@ 0x134
c0de145c:	f8cd e0a0 	str.w	lr, [sp, #160]	@ 0xa0
c0de1460:	ea82 020e 	eor.w	r2, r2, lr
c0de1464:	0750      	lsls	r0, r2, #29
c0de1466:	9214      	str	r2, [sp, #80]	@ 0x50
c0de1468:	9a2d      	ldr	r2, [sp, #180]	@ 0xb4
c0de146a:	ea40 00d6 	orr.w	r0, r0, r6, lsr #3
c0de146e:	901a      	str	r0, [sp, #104]	@ 0x68
c0de1470:	ea21 0000 	bic.w	r0, r1, r0
c0de1474:	9936      	ldr	r1, [sp, #216]	@ 0xd8
c0de1476:	ea8a 0501 	eor.w	r5, sl, r1
c0de147a:	993e      	ldr	r1, [sp, #248]	@ 0xf8
c0de147c:	950d      	str	r5, [sp, #52]	@ 0x34
c0de147e:	4051      	eors	r1, r2
c0de1480:	9117      	str	r1, [sp, #92]	@ 0x5c
c0de1482:	0349      	lsls	r1, r1, #13
c0de1484:	ea41 41d5 	orr.w	r1, r1, r5, lsr #19
c0de1488:	4048      	eors	r0, r1
c0de148a:	9143      	str	r1, [sp, #268]	@ 0x10c
c0de148c:	994f      	ldr	r1, [sp, #316]	@ 0x13c
c0de148e:	901b      	str	r0, [sp, #108]	@ 0x6c
c0de1490:	ea80 000c 	eor.w	r0, r0, ip
c0de1494:	404a      	eors	r2, r1
c0de1496:	9948      	ldr	r1, [sp, #288]	@ 0x120
c0de1498:	9211      	str	r2, [sp, #68]	@ 0x44
c0de149a:	ea81 010a 	eor.w	r1, r1, sl
c0de149e:	9148      	str	r1, [sp, #288]	@ 0x120
c0de14a0:	0089      	lsls	r1, r1, #2
c0de14a2:	ea41 7292 	orr.w	r2, r1, r2, lsr #30
c0de14a6:	9959      	ldr	r1, [sp, #356]	@ 0x164
c0de14a8:	923e      	str	r2, [sp, #248]	@ 0xf8
c0de14aa:	ea88 0501 	eor.w	r5, r8, r1
c0de14ae:	995c      	ldr	r1, [sp, #368]	@ 0x170
c0de14b0:	9510      	str	r5, [sp, #64]	@ 0x40
c0de14b2:	ea81 010e 	eor.w	r1, r1, lr
c0de14b6:	915c      	str	r1, [sp, #368]	@ 0x170
c0de14b8:	0789      	lsls	r1, r1, #30
c0de14ba:	ea41 0195 	orr.w	r1, r1, r5, lsr #2
c0de14be:	9d3c      	ldr	r5, [sp, #240]	@ 0xf0
c0de14c0:	914f      	str	r1, [sp, #316]	@ 0x13c
c0de14c2:	4391      	bics	r1, r2
c0de14c4:	9a35      	ldr	r2, [sp, #212]	@ 0xd4
c0de14c6:	ea83 0602 	eor.w	r6, r3, r2
c0de14ca:	9a2f      	ldr	r2, [sp, #188]	@ 0xbc
c0de14cc:	960f      	str	r6, [sp, #60]	@ 0x3c
c0de14ce:	406a      	eors	r2, r5
c0de14d0:	920e      	str	r2, [sp, #56]	@ 0x38
c0de14d2:	0252      	lsls	r2, r2, #9
c0de14d4:	ea42 52d6 	orr.w	r2, r2, r6, lsr #23
c0de14d8:	9e2c      	ldr	r6, [sp, #176]	@ 0xb0
c0de14da:	4051      	eors	r1, r2
c0de14dc:	9236      	str	r2, [sp, #216]	@ 0xd8
c0de14de:	ea80 0c01 	eor.w	ip, r0, r1
c0de14e2:	911f      	str	r1, [sp, #124]	@ 0x7c
c0de14e4:	993f      	ldr	r1, [sp, #252]	@ 0xfc
c0de14e6:	9847      	ldr	r0, [sp, #284]	@ 0x11c
c0de14e8:	4061      	eors	r1, r4
c0de14ea:	ea86 0200 	eor.w	r2, r6, r0
c0de14ee:	4620      	mov	r0, r4
c0de14f0:	9c29      	ldr	r4, [sp, #164]	@ 0xa4
c0de14f2:	910c      	str	r1, [sp, #48]	@ 0x30
c0de14f4:	0549      	lsls	r1, r1, #21
c0de14f6:	9247      	str	r2, [sp, #284]	@ 0x11c
c0de14f8:	ea41 25d2 	orr.w	r5, r1, r2, lsr #11
c0de14fc:	9a2a      	ldr	r2, [sp, #168]	@ 0xa8
c0de14fe:	9956      	ldr	r1, [sp, #344]	@ 0x158
c0de1500:	9518      	str	r5, [sp, #96]	@ 0x60
c0de1502:	ea82 0b01 	eor.w	fp, r2, r1
c0de1506:	9953      	ldr	r1, [sp, #332]	@ 0x14c
c0de1508:	4061      	eors	r1, r4
c0de150a:	910a      	str	r1, [sp, #40]	@ 0x28
c0de150c:	0389      	lsls	r1, r1, #14
c0de150e:	ea41 479b 	orr.w	r7, r1, fp, lsr #18
c0de1512:	995a      	ldr	r1, [sp, #360]	@ 0x168
c0de1514:	971e      	str	r7, [sp, #120]	@ 0x78
c0de1516:	4059      	eors	r1, r3
c0de1518:	9156      	str	r1, [sp, #344]	@ 0x158
c0de151a:	43b9      	bics	r1, r7
c0de151c:	9f21      	ldr	r7, [sp, #132]	@ 0x84
c0de151e:	4069      	eors	r1, r5
c0de1520:	9123      	str	r1, [sp, #140]	@ 0x8c
c0de1522:	ea8c 0301 	eor.w	r3, ip, r1
c0de1526:	9926      	ldr	r1, [sp, #152]	@ 0x98
c0de1528:	ea82 0a01 	eor.w	sl, r2, r1
c0de152c:	9958      	ldr	r1, [sp, #352]	@ 0x160
c0de152e:	4061      	eors	r1, r4
c0de1530:	915a      	str	r1, [sp, #360]	@ 0x168
c0de1532:	06c9      	lsls	r1, r1, #27
c0de1534:	ea41 155a 	orr.w	r5, r1, sl, lsr #5
c0de1538:	9951      	ldr	r1, [sp, #324]	@ 0x144
c0de153a:	9535      	str	r5, [sp, #212]	@ 0xd4
c0de153c:	ea80 0401 	eor.w	r4, r0, r1
c0de1540:	9854      	ldr	r0, [sp, #336]	@ 0x150
c0de1542:	ea86 0100 	eor.w	r1, r6, r0
c0de1546:	9e2e      	ldr	r6, [sp, #184]	@ 0xb8
c0de1548:	060a      	lsls	r2, r1, #24
c0de154a:	ea42 2014 	orr.w	r0, r2, r4, lsr #8
c0de154e:	9a4a      	ldr	r2, [sp, #296]	@ 0x128
c0de1550:	9015      	str	r0, [sp, #84]	@ 0x54
c0de1552:	ea25 0000 	bic.w	r0, r5, r0
c0de1556:	9d42      	ldr	r5, [sp, #264]	@ 0x108
c0de1558:	ea82 020e 	eor.w	r2, r2, lr
c0de155c:	f8dd e0a4 	ldr.w	lr, [sp, #164]	@ 0xa4
c0de1560:	ea85 0508 	eor.w	r5, r5, r8
c0de1564:	ea4f 3cc5 	mov.w	ip, r5, lsl #15
c0de1568:	ea4c 4c52 	orr.w	ip, ip, r2, lsr #17
c0de156c:	03d2      	lsls	r2, r2, #15
c0de156e:	ea80 000c 	eor.w	r0, r0, ip
c0de1572:	f8cd c164 	str.w	ip, [sp, #356]	@ 0x164
c0de1576:	ea42 4255 	orr.w	r2, r2, r5, lsr #17
c0de157a:	9d19      	ldr	r5, [sp, #100]	@ 0x64
c0de157c:	ea83 0c00 	eor.w	ip, r3, r0
c0de1580:	9026      	str	r0, [sp, #152]	@ 0x98
c0de1582:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de1584:	9b14      	ldr	r3, [sp, #80]	@ 0x50
c0de1586:	f8cd c134 	str.w	ip, [sp, #308]	@ 0x134
c0de158a:	0740      	lsls	r0, r0, #29
c0de158c:	ea40 03d3 	orr.w	r3, r0, r3, lsr #3
c0de1590:	9830      	ldr	r0, [sp, #192]	@ 0xc0
c0de1592:	9316      	str	r3, [sp, #88]	@ 0x58
c0de1594:	0700      	lsls	r0, r0, #28
c0de1596:	ea40 1016 	orr.w	r0, r0, r6, lsr #4
c0de159a:	9e17      	ldr	r6, [sp, #92]	@ 0x5c
c0de159c:	9058      	str	r0, [sp, #352]	@ 0x160
c0de159e:	4398      	bics	r0, r3
c0de15a0:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
c0de15a2:	035b      	lsls	r3, r3, #13
c0de15a4:	ea43 43d6 	orr.w	r3, r3, r6, lsr #19
c0de15a8:	ea83 0600 	eor.w	r6, r3, r0
c0de15ac:	9822      	ldr	r0, [sp, #136]	@ 0x88
c0de15ae:	933c      	str	r3, [sp, #240]	@ 0xf0
c0de15b0:	9b25      	ldr	r3, [sp, #148]	@ 0x94
c0de15b2:	9617      	str	r6, [sp, #92]	@ 0x5c
c0de15b4:	0480      	lsls	r0, r0, #18
c0de15b6:	ea40 3393 	orr.w	r3, r0, r3, lsr #14
c0de15ba:	9820      	ldr	r0, [sp, #128]	@ 0x80
c0de15bc:	9314      	str	r3, [sp, #80]	@ 0x50
c0de15be:	0040      	lsls	r0, r0, #1
c0de15c0:	ea40 70d7 	orr.w	r0, r0, r7, lsr #31
c0de15c4:	9f1d      	ldr	r7, [sp, #116]	@ 0x74
c0de15c6:	9054      	str	r0, [sp, #336]	@ 0x150
c0de15c8:	4398      	bics	r0, r3
c0de15ca:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de15cc:	021b      	lsls	r3, r3, #8
c0de15ce:	ea43 6317 	orr.w	r3, r3, r7, lsr #24
c0de15d2:	4058      	eors	r0, r3
c0de15d4:	933f      	str	r3, [sp, #252]	@ 0xfc
c0de15d6:	9021      	str	r0, [sp, #132]	@ 0x84
c0de15d8:	ea80 0806 	eor.w	r8, r0, r6
c0de15dc:	9810      	ldr	r0, [sp, #64]	@ 0x40
c0de15de:	0783      	lsls	r3, r0, #30
c0de15e0:	985c      	ldr	r0, [sp, #368]	@ 0x170
c0de15e2:	ea43 0690 	orr.w	r6, r3, r0, lsr #2
c0de15e6:	9811      	ldr	r0, [sp, #68]	@ 0x44
c0de15e8:	9653      	str	r6, [sp, #332]	@ 0x14c
c0de15ea:	0083      	lsls	r3, r0, #2
c0de15ec:	9848      	ldr	r0, [sp, #288]	@ 0x120
c0de15ee:	ea43 7090 	orr.w	r0, r3, r0, lsr #30
c0de15f2:	9012      	str	r0, [sp, #72]	@ 0x48
c0de15f4:	ea26 0300 	bic.w	r3, r6, r0
c0de15f8:	980f      	ldr	r0, [sp, #60]	@ 0x3c
c0de15fa:	0246      	lsls	r6, r0, #9
c0de15fc:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de15fe:	920e      	str	r2, [sp, #56]	@ 0x38
c0de1600:	ea46 50d0 	orr.w	r0, r6, r0, lsr #23
c0de1604:	9e0c      	ldr	r6, [sp, #48]	@ 0x30
c0de1606:	4043      	eors	r3, r0
c0de1608:	9030      	str	r0, [sp, #192]	@ 0xc0
c0de160a:	ea88 0003 	eor.w	r0, r8, r3
c0de160e:	931d      	str	r3, [sp, #116]	@ 0x74
c0de1610:	9b47      	ldr	r3, [sp, #284]	@ 0x11c
c0de1612:	f8dd 80bc 	ldr.w	r8, [sp, #188]	@ 0xbc
c0de1616:	055b      	lsls	r3, r3, #21
c0de1618:	ea43 27d6 	orr.w	r7, r3, r6, lsr #11
c0de161c:	9e0a      	ldr	r6, [sp, #40]	@ 0x28
c0de161e:	ea4f 338b 	mov.w	r3, fp, lsl #14
c0de1622:	4693      	mov	fp, r2
c0de1624:	970d      	str	r7, [sp, #52]	@ 0x34
c0de1626:	ea43 4696 	orr.w	r6, r3, r6, lsr #18
c0de162a:	9b5b      	ldr	r3, [sp, #364]	@ 0x16c
c0de162c:	962e      	str	r6, [sp, #184]	@ 0xb8
c0de162e:	ea83 0308 	eor.w	r3, r3, r8
c0de1632:	9351      	str	r3, [sp, #324]	@ 0x144
c0de1634:	43b3      	bics	r3, r6
c0de1636:	407b      	eors	r3, r7
c0de1638:	9320      	str	r3, [sp, #128]	@ 0x80
c0de163a:	4058      	eors	r0, r3
c0de163c:	0623      	lsls	r3, r4, #24
c0de163e:	9c5a      	ldr	r4, [sp, #360]	@ 0x168
c0de1640:	ea43 2311 	orr.w	r3, r3, r1, lsr #8
c0de1644:	ea4f 61ca 	mov.w	r1, sl, lsl #27
c0de1648:	f8dd a02c 	ldr.w	sl, [sp, #44]	@ 0x2c
c0de164c:	ea41 1154 	orr.w	r1, r1, r4, lsr #5
c0de1650:	935b      	str	r3, [sp, #364]	@ 0x16c
c0de1652:	9c2b      	ldr	r4, [sp, #172]	@ 0xac
c0de1654:	9148      	str	r1, [sp, #288]	@ 0x120
c0de1656:	4399      	bics	r1, r3
c0de1658:	4051      	eors	r1, r2
c0de165a:	4048      	eors	r0, r1
c0de165c:	9125      	str	r1, [sp, #148]	@ 0x94
c0de165e:	9928      	ldr	r1, [sp, #160]	@ 0xa0
c0de1660:	904a      	str	r0, [sp, #296]	@ 0x128
c0de1662:	0040      	lsls	r0, r0, #1
c0de1664:	ea40 70dc 	orr.w	r0, r0, ip, lsr #31
c0de1668:	f8dd c0a8 	ldr.w	ip, [sp, #168]	@ 0xa8
c0de166c:	905c      	str	r0, [sp, #368]	@ 0x170
c0de166e:	9849      	ldr	r0, [sp, #292]	@ 0x124
c0de1670:	4041      	eors	r1, r0
c0de1672:	9841      	ldr	r0, [sp, #260]	@ 0x104
c0de1674:	915a      	str	r1, [sp, #360]	@ 0x168
c0de1676:	ea80 000a 	eor.w	r0, r0, sl
c0de167a:	9011      	str	r0, [sp, #68]	@ 0x44
c0de167c:	02c0      	lsls	r0, r0, #11
c0de167e:	ea40 5051 	orr.w	r0, r0, r1, lsr #21
c0de1682:	9932      	ldr	r1, [sp, #200]	@ 0xc8
c0de1684:	9049      	str	r0, [sp, #292]	@ 0x124
c0de1686:	ea27 0000 	bic.w	r0, r7, r0
c0de168a:	9f2d      	ldr	r7, [sp, #180]	@ 0xb4
c0de168c:	ea87 0201 	eor.w	r2, r7, r1
c0de1690:	9931      	ldr	r1, [sp, #196]	@ 0xc4
c0de1692:	9232      	str	r2, [sp, #200]	@ 0xc8
c0de1694:	4069      	eors	r1, r5
c0de1696:	9110      	str	r1, [sp, #64]	@ 0x40
c0de1698:	0309      	lsls	r1, r1, #12
c0de169a:	ea41 5112 	orr.w	r1, r1, r2, lsr #20
c0de169e:	ea81 0300 	eor.w	r3, r1, r0
c0de16a2:	9840      	ldr	r0, [sp, #256]	@ 0x100
c0de16a4:	9147      	str	r1, [sp, #284]	@ 0x11c
c0de16a6:	9341      	str	r3, [sp, #260]	@ 0x104
c0de16a8:	ea84 0100 	eor.w	r1, r4, r0
c0de16ac:	9846      	ldr	r0, [sp, #280]	@ 0x118
c0de16ae:	910f      	str	r1, [sp, #60]	@ 0x3c
c0de16b0:	ea80 0008 	eor.w	r0, r0, r8
c0de16b4:	900c      	str	r0, [sp, #48]	@ 0x30
c0de16b6:	00c0      	lsls	r0, r0, #3
c0de16b8:	ea40 7051 	orr.w	r0, r0, r1, lsr #29
c0de16bc:	993c      	ldr	r1, [sp, #240]	@ 0xf0
c0de16be:	9046      	str	r0, [sp, #280]	@ 0x118
c0de16c0:	ea21 0600 	bic.w	r6, r1, r0
c0de16c4:	9939      	ldr	r1, [sp, #228]	@ 0xe4
c0de16c6:	ea8e 0201 	eor.w	r2, lr, r1
c0de16ca:	993b      	ldr	r1, [sp, #236]	@ 0xec
c0de16cc:	9239      	str	r2, [sp, #228]	@ 0xe4
c0de16ce:	ea8c 0001 	eor.w	r0, ip, r1
c0de16d2:	0501      	lsls	r1, r0, #20
c0de16d4:	903b      	str	r0, [sp, #236]	@ 0xec
c0de16d6:	ea41 3112 	orr.w	r1, r1, r2, lsr #12
c0de16da:	ea81 0006 	eor.w	r0, r1, r6
c0de16de:	9142      	str	r1, [sp, #264]	@ 0x108
c0de16e0:	9944      	ldr	r1, [sp, #272]	@ 0x110
c0de16e2:	9e49      	ldr	r6, [sp, #292]	@ 0x124
c0de16e4:	9022      	str	r0, [sp, #136]	@ 0x88
c0de16e6:	4058      	eors	r0, r3
c0de16e8:	ea85 0201 	eor.w	r2, r5, r1
c0de16ec:	994b      	ldr	r1, [sp, #300]	@ 0x12c
c0de16ee:	9219      	str	r2, [sp, #100]	@ 0x64
c0de16f0:	4079      	eors	r1, r7
c0de16f2:	9f2c      	ldr	r7, [sp, #176]	@ 0xb0
c0de16f4:	9109      	str	r1, [sp, #36]	@ 0x24
c0de16f6:	0289      	lsls	r1, r1, #10
c0de16f8:	ea41 5192 	orr.w	r1, r1, r2, lsr #22
c0de16fc:	9a3d      	ldr	r2, [sp, #244]	@ 0xf4
c0de16fe:	914b      	str	r1, [sp, #300]	@ 0x12c
c0de1700:	ea2b 0101 	bic.w	r1, fp, r1
c0de1704:	ea88 0302 	eor.w	r3, r8, r2
c0de1708:	9a33      	ldr	r2, [sp, #204]	@ 0xcc
c0de170a:	9308      	str	r3, [sp, #32]
c0de170c:	4062      	eors	r2, r4
c0de170e:	9c28      	ldr	r4, [sp, #160]	@ 0xa0
c0de1710:	9233      	str	r2, [sp, #204]	@ 0xcc
c0de1712:	0112      	lsls	r2, r2, #4
c0de1714:	ea42 7213 	orr.w	r2, r2, r3, lsr #28
c0de1718:	9b13      	ldr	r3, [sp, #76]	@ 0x4c
c0de171a:	4051      	eors	r1, r2
c0de171c:	9244      	str	r2, [sp, #272]	@ 0x110
c0de171e:	913d      	str	r1, [sp, #244]	@ 0xf4
c0de1720:	4048      	eors	r0, r1
c0de1722:	994e      	ldr	r1, [sp, #312]	@ 0x138
c0de1724:	ea83 0201 	eor.w	r2, r3, r1
c0de1728:	9952      	ldr	r1, [sp, #328]	@ 0x148
c0de172a:	9206      	str	r2, [sp, #24]
c0de172c:	4079      	eors	r1, r7
c0de172e:	9105      	str	r1, [sp, #20]
c0de1730:	0649      	lsls	r1, r1, #25
c0de1732:	ea41 12d2 	orr.w	r2, r1, r2, lsr #7
c0de1736:	993f      	ldr	r1, [sp, #252]	@ 0xfc
c0de1738:	924e      	str	r2, [sp, #312]	@ 0x138
c0de173a:	4391      	bics	r1, r2
c0de173c:	9a37      	ldr	r2, [sp, #220]	@ 0xdc
c0de173e:	ea8a 0502 	eor.w	r5, sl, r2
c0de1742:	9a38      	ldr	r2, [sp, #224]	@ 0xe0
c0de1744:	9537      	str	r5, [sp, #220]	@ 0xdc
c0de1746:	4062      	eors	r2, r4
c0de1748:	9228      	str	r2, [sp, #160]	@ 0xa0
c0de174a:	0192      	lsls	r2, r2, #6
c0de174c:	ea42 6295 	orr.w	r2, r2, r5, lsr #26
c0de1750:	9d28      	ldr	r5, [sp, #160]	@ 0xa0
c0de1752:	4051      	eors	r1, r2
c0de1754:	9252      	str	r2, [sp, #328]	@ 0x148
c0de1756:	ea80 0201 	eor.w	r2, r0, r1
c0de175a:	9855      	ldr	r0, [sp, #340]	@ 0x154
c0de175c:	9140      	str	r1, [sp, #256]	@ 0x100
c0de175e:	ea8c 0400 	eor.w	r4, ip, r0
c0de1762:	9850      	ldr	r0, [sp, #320]	@ 0x140
c0de1764:	940b      	str	r4, [sp, #44]	@ 0x2c
c0de1766:	ea80 000e 	eor.w	r0, r0, lr
c0de176a:	01c1      	lsls	r1, r0, #7
c0de176c:	902a      	str	r0, [sp, #168]	@ 0xa8
c0de176e:	9830      	ldr	r0, [sp, #192]	@ 0xc0
c0de1770:	ea41 6154 	orr.w	r1, r1, r4, lsr #25
c0de1774:	9c10      	ldr	r4, [sp, #64]	@ 0x40
c0de1776:	9155      	str	r1, [sp, #340]	@ 0x154
c0de1778:	4388      	bics	r0, r1
c0de177a:	994c      	ldr	r1, [sp, #304]	@ 0x130
c0de177c:	ea87 0e01 	eor.w	lr, r7, r1
c0de1780:	9945      	ldr	r1, [sp, #276]	@ 0x114
c0de1782:	9f33      	ldr	r7, [sp, #204]	@ 0xcc
c0de1784:	ea83 0b01 	eor.w	fp, r3, r1
c0de1788:	ea4f 5acb 	mov.w	sl, fp, lsl #23
c0de178c:	ea4a 215e 	orr.w	r1, sl, lr, lsr #9
c0de1790:	4048      	eors	r0, r1
c0de1792:	9150      	str	r1, [sp, #320]	@ 0x140
c0de1794:	995c      	ldr	r1, [sp, #368]	@ 0x170
c0de1796:	902c      	str	r0, [sp, #176]	@ 0xb0
c0de1798:	4050      	eors	r0, r2
c0de179a:	ea81 0200 	eor.w	r2, r1, r0
c0de179e:	902d      	str	r0, [sp, #180]	@ 0xb4
c0de17a0:	982e      	ldr	r0, [sp, #184]	@ 0xb8
c0de17a2:	990d      	ldr	r1, [sp, #52]	@ 0x34
c0de17a4:	925c      	str	r2, [sp, #368]	@ 0x170
c0de17a6:	4388      	bics	r0, r1
c0de17a8:	9911      	ldr	r1, [sp, #68]	@ 0x44
c0de17aa:	4070      	eors	r0, r6
c0de17ac:	9e09      	ldr	r6, [sp, #36]	@ 0x24
c0de17ae:	ea82 0a00 	eor.w	sl, r2, r0
c0de17b2:	9031      	str	r0, [sp, #196]	@ 0xc4
c0de17b4:	984d      	ldr	r0, [sp, #308]	@ 0x134
c0de17b6:	9a4a      	ldr	r2, [sp, #296]	@ 0x128
c0de17b8:	f8cd a034 	str.w	sl, [sp, #52]	@ 0x34
c0de17bc:	0040      	lsls	r0, r0, #1
c0de17be:	ea40 70d2 	orr.w	r0, r0, r2, lsr #31
c0de17c2:	9a32      	ldr	r2, [sp, #200]	@ 0xc8
c0de17c4:	904c      	str	r0, [sp, #304]	@ 0x130
c0de17c6:	985a      	ldr	r0, [sp, #360]	@ 0x168
c0de17c8:	0312      	lsls	r2, r2, #12
c0de17ca:	02c0      	lsls	r0, r0, #11
c0de17cc:	ea42 5c14 	orr.w	ip, r2, r4, lsr #20
c0de17d0:	9a0c      	ldr	r2, [sp, #48]	@ 0x30
c0de17d2:	9c3b      	ldr	r4, [sp, #236]	@ 0xec
c0de17d4:	ea40 5351 	orr.w	r3, r0, r1, lsr #21
c0de17d8:	9918      	ldr	r1, [sp, #96]	@ 0x60
c0de17da:	f8cd c01c 	str.w	ip, [sp, #28]
c0de17de:	930a      	str	r3, [sp, #40]	@ 0x28
c0de17e0:	ea21 0003 	bic.w	r0, r1, r3
c0de17e4:	ea8c 0800 	eor.w	r8, ip, r0
c0de17e8:	980f      	ldr	r0, [sp, #60]	@ 0x3c
c0de17ea:	f8cd 80e0 	str.w	r8, [sp, #224]	@ 0xe0
c0de17ee:	00c0      	lsls	r0, r0, #3
c0de17f0:	ea40 7252 	orr.w	r2, r0, r2, lsr #29
c0de17f4:	9843      	ldr	r0, [sp, #268]	@ 0x10c
c0de17f6:	922f      	str	r2, [sp, #188]	@ 0xbc
c0de17f8:	4390      	bics	r0, r2
c0de17fa:	9a39      	ldr	r2, [sp, #228]	@ 0xe4
c0de17fc:	0512      	lsls	r2, r2, #20
c0de17fe:	ea42 3414 	orr.w	r4, r2, r4, lsr #12
c0de1802:	9a19      	ldr	r2, [sp, #100]	@ 0x64
c0de1804:	4060      	eors	r0, r4
c0de1806:	9404      	str	r4, [sp, #16]
c0de1808:	0292      	lsls	r2, r2, #10
c0de180a:	902b      	str	r0, [sp, #172]	@ 0xac
c0de180c:	ea80 0008 	eor.w	r0, r0, r8
c0de1810:	ea42 5696 	orr.w	r6, r2, r6, lsr #22
c0de1814:	9a59      	ldr	r2, [sp, #356]	@ 0x164
c0de1816:	9609      	str	r6, [sp, #36]	@ 0x24
c0de1818:	43b2      	bics	r2, r6
c0de181a:	9e08      	ldr	r6, [sp, #32]
c0de181c:	0136      	lsls	r6, r6, #4
c0de181e:	ea46 7717 	orr.w	r7, r6, r7, lsr #28
c0de1822:	9e05      	ldr	r6, [sp, #20]
c0de1824:	407a      	eors	r2, r7
c0de1826:	9701      	str	r7, [sp, #4]
c0de1828:	9245      	str	r2, [sp, #276]	@ 0x114
c0de182a:	4050      	eors	r0, r2
c0de182c:	9a06      	ldr	r2, [sp, #24]
c0de182e:	0652      	lsls	r2, r2, #25
c0de1830:	ea42 16d6 	orr.w	r6, r2, r6, lsr #7
c0de1834:	9a34      	ldr	r2, [sp, #208]	@ 0xd0
c0de1836:	9633      	str	r6, [sp, #204]	@ 0xcc
c0de1838:	43b2      	bics	r2, r6
c0de183a:	9e37      	ldr	r6, [sp, #220]	@ 0xdc
c0de183c:	01b6      	lsls	r6, r6, #6
c0de183e:	ea46 6695 	orr.w	r6, r6, r5, lsr #26
c0de1842:	4072      	eors	r2, r6
c0de1844:	9603      	str	r6, [sp, #12]
c0de1846:	ea80 0802 	eor.w	r8, r0, r2
c0de184a:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de184c:	9219      	str	r2, [sp, #100]	@ 0x64
c0de184e:	9a2a      	ldr	r2, [sp, #168]	@ 0xa8
c0de1850:	01c0      	lsls	r0, r0, #7
c0de1852:	ea40 6252 	orr.w	r2, r0, r2, lsr #25
c0de1856:	9836      	ldr	r0, [sp, #216]	@ 0xd8
c0de1858:	9208      	str	r2, [sp, #32]
c0de185a:	ea20 0502 	bic.w	r5, r0, r2
c0de185e:	ea4f 50ce 	mov.w	r0, lr, lsl #23
c0de1862:	ea40 225b 	orr.w	r2, r0, fp, lsr #9
c0de1866:	f8dd b070 	ldr.w	fp, [sp, #112]	@ 0x70
c0de186a:	ea85 0002 	eor.w	r0, r5, r2
c0de186e:	9d1e      	ldr	r5, [sp, #120]	@ 0x78
c0de1870:	4696      	mov	lr, r2
c0de1872:	e9cd 200b 	strd	r2, r0, [sp, #44]	@ 0x2c
c0de1876:	9a4c      	ldr	r2, [sp, #304]	@ 0x130
c0de1878:	ea80 0008 	eor.w	r0, r0, r8
c0de187c:	f8dd 8054 	ldr.w	r8, [sp, #84]	@ 0x54
c0de1880:	ea25 0101 	bic.w	r1, r5, r1
c0de1884:	9010      	str	r0, [sp, #64]	@ 0x40
c0de1886:	4050      	eors	r0, r2
c0de1888:	4059      	eors	r1, r3
c0de188a:	905a      	str	r0, [sp, #360]	@ 0x168
c0de188c:	4048      	eors	r0, r1
c0de188e:	9105      	str	r1, [sp, #20]
c0de1890:	9912      	ldr	r1, [sp, #72]	@ 0x48
c0de1892:	0782      	lsls	r2, r0, #30
c0de1894:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de1896:	ea42 009a 	orr.w	r0, r2, sl, lsr #2
c0de189a:	9a4f      	ldr	r2, [sp, #316]	@ 0x13c
c0de189c:	f8dd a068 	ldr.w	sl, [sp, #104]	@ 0x68
c0de18a0:	904c      	str	r0, [sp, #304]	@ 0x130
c0de18a2:	983e      	ldr	r0, [sp, #248]	@ 0xf8
c0de18a4:	ea2e 0202 	bic.w	r2, lr, r2
c0de18a8:	ea80 0302 	eor.w	r3, r0, r2
c0de18ac:	9a56      	ldr	r2, [sp, #344]	@ 0x158
c0de18ae:	9329      	str	r3, [sp, #164]	@ 0xa4
c0de18b0:	ea2c 0202 	bic.w	r2, ip, r2
c0de18b4:	ea85 0002 	eor.w	r0, r5, r2
c0de18b8:	9d47      	ldr	r5, [sp, #284]	@ 0x11c
c0de18ba:	ea80 0203 	eor.w	r2, r0, r3
c0de18be:	9b57      	ldr	r3, [sp, #348]	@ 0x15c
c0de18c0:	9013      	str	r0, [sp, #76]	@ 0x4c
c0de18c2:	ea26 0303 	bic.w	r3, r6, r3
c0de18c6:	9e44      	ldr	r6, [sp, #272]	@ 0x110
c0de18c8:	ea83 000b 	eor.w	r0, r3, fp
c0de18cc:	9b3a      	ldr	r3, [sp, #232]	@ 0xe8
c0de18ce:	902a      	str	r0, [sp, #168]	@ 0xa8
c0de18d0:	4042      	eors	r2, r0
c0de18d2:	9835      	ldr	r0, [sp, #212]	@ 0xd4
c0de18d4:	ea24 0303 	bic.w	r3, r4, r3
c0de18d8:	9c14      	ldr	r4, [sp, #80]	@ 0x50
c0de18da:	ea83 030a 	eor.w	r3, r3, sl
c0de18de:	933b      	str	r3, [sp, #236]	@ 0xec
c0de18e0:	405a      	eors	r2, r3
c0de18e2:	ea27 0300 	bic.w	r3, r7, r0
c0de18e6:	9850      	ldr	r0, [sp, #320]	@ 0x140
c0de18e8:	ea83 0308 	eor.w	r3, r3, r8
c0de18ec:	ea82 0c03 	eor.w	ip, r2, r3
c0de18f0:	9a53      	ldr	r2, [sp, #332]	@ 0x14c
c0de18f2:	9332      	str	r3, [sp, #200]	@ 0xc8
c0de18f4:	4667      	mov	r7, ip
c0de18f6:	f8cd c018 	str.w	ip, [sp, #24]
c0de18fa:	ea20 0202 	bic.w	r2, r0, r2
c0de18fe:	982e      	ldr	r0, [sp, #184]	@ 0xb8
c0de1900:	ea81 0302 	eor.w	r3, r1, r2
c0de1904:	9a51      	ldr	r2, [sp, #324]	@ 0x144
c0de1906:	931e      	str	r3, [sp, #120]	@ 0x78
c0de1908:	ea25 0202 	bic.w	r2, r5, r2
c0de190c:	9d42      	ldr	r5, [sp, #264]	@ 0x108
c0de190e:	4050      	eors	r0, r2
c0de1910:	ea80 0203 	eor.w	r2, r0, r3
c0de1914:	9011      	str	r0, [sp, #68]	@ 0x44
c0de1916:	9b54      	ldr	r3, [sp, #336]	@ 0x150
c0de1918:	9852      	ldr	r0, [sp, #328]	@ 0x148
c0de191a:	ea20 0303 	bic.w	r3, r0, r3
c0de191e:	4063      	eors	r3, r4
c0de1920:	932e      	str	r3, [sp, #184]	@ 0xb8
c0de1922:	405a      	eors	r2, r3
c0de1924:	9b58      	ldr	r3, [sp, #352]	@ 0x160
c0de1926:	ea25 0303 	bic.w	r3, r5, r3
c0de192a:	9d16      	ldr	r5, [sp, #88]	@ 0x58
c0de192c:	406b      	eors	r3, r5
c0de192e:	9339      	str	r3, [sp, #228]	@ 0xe4
c0de1930:	405a      	eors	r2, r3
c0de1932:	9b48      	ldr	r3, [sp, #288]	@ 0x120
c0de1934:	ea26 0303 	bic.w	r3, r6, r3
c0de1938:	9e5b      	ldr	r6, [sp, #364]	@ 0x16c
c0de193a:	4073      	eors	r3, r6
c0de193c:	ea82 0003 	eor.w	r0, r2, r3
c0de1940:	9318      	str	r3, [sp, #96]	@ 0x60
c0de1942:	9b3c      	ldr	r3, [sp, #240]	@ 0xf0
c0de1944:	0042      	lsls	r2, r0, #1
c0de1946:	9002      	str	r0, [sp, #8]
c0de1948:	ea25 0303 	bic.w	r3, r5, r3
c0de194c:	9d46      	ldr	r5, [sp, #280]	@ 0x118
c0de194e:	ea42 72dc 	orr.w	r2, r2, ip, lsr #31
c0de1952:	f8dd c12c 	ldr.w	ip, [sp, #300]	@ 0x12c
c0de1956:	405d      	eors	r5, r3
c0de1958:	9b0e      	ldr	r3, [sp, #56]	@ 0x38
c0de195a:	9516      	str	r5, [sp, #88]	@ 0x58
c0de195c:	ea26 0303 	bic.w	r3, r6, r3
c0de1960:	9e09      	ldr	r6, [sp, #36]	@ 0x24
c0de1962:	ea83 030c 	eor.w	r3, r3, ip
c0de1966:	933c      	str	r3, [sp, #240]	@ 0xf0
c0de1968:	406b      	eors	r3, r5
c0de196a:	9d30      	ldr	r5, [sp, #192]	@ 0xc0
c0de196c:	ea21 0505 	bic.w	r5, r1, r5
c0de1970:	9955      	ldr	r1, [sp, #340]	@ 0x154
c0de1972:	404d      	eors	r5, r1
c0de1974:	9931      	ldr	r1, [sp, #196]	@ 0xc4
c0de1976:	406b      	eors	r3, r5
c0de1978:	9537      	str	r5, [sp, #220]	@ 0xdc
c0de197a:	9d3f      	ldr	r5, [sp, #252]	@ 0xfc
c0de197c:	404b      	eors	r3, r1
c0de197e:	994e      	ldr	r1, [sp, #312]	@ 0x138
c0de1980:	ea24 0505 	bic.w	r5, r4, r5
c0de1984:	9c08      	ldr	r4, [sp, #32]
c0de1986:	404d      	eors	r5, r1
c0de1988:	ea83 0e05 	eor.w	lr, r3, r5
c0de198c:	9b17      	ldr	r3, [sp, #92]	@ 0x5c
c0de198e:	9528      	str	r5, [sp, #160]	@ 0xa0
c0de1990:	9d2f      	ldr	r5, [sp, #188]	@ 0xbc
c0de1992:	ea82 020e 	eor.w	r2, r2, lr
c0de1996:	ea82 0c03 	eor.w	ip, r2, r3
c0de199a:	9b59      	ldr	r3, [sp, #356]	@ 0x164
c0de199c:	925b      	str	r2, [sp, #364]	@ 0x16c
c0de199e:	007a      	lsls	r2, r7, #1
c0de19a0:	ea42 72d0 	orr.w	r2, r2, r0, lsr #31
c0de19a4:	ea28 0303 	bic.w	r3, r8, r3
c0de19a8:	ea86 0103 	eor.w	r1, r6, r3
c0de19ac:	9b43      	ldr	r3, [sp, #268]	@ 0x10c
c0de19ae:	913f      	str	r1, [sp, #252]	@ 0xfc
c0de19b0:	ea2a 0303 	bic.w	r3, sl, r3
c0de19b4:	f8dd a130 	ldr.w	sl, [sp, #304]	@ 0x130
c0de19b8:	ea83 0005 	eor.w	r0, r3, r5
c0de19bc:	ea80 0301 	eor.w	r3, r0, r1
c0de19c0:	9015      	str	r0, [sp, #84]	@ 0x54
c0de19c2:	9836      	ldr	r0, [sp, #216]	@ 0xd8
c0de19c4:	993e      	ldr	r1, [sp, #248]	@ 0xf8
c0de19c6:	ea21 0700 	bic.w	r7, r1, r0
c0de19ca:	9805      	ldr	r0, [sp, #20]
c0de19cc:	ea84 0107 	eor.w	r1, r4, r7
c0de19d0:	9f33      	ldr	r7, [sp, #204]	@ 0xcc
c0de19d2:	404b      	eors	r3, r1
c0de19d4:	9131      	str	r1, [sp, #196]	@ 0xc4
c0de19d6:	ea83 0100 	eor.w	r1, r3, r0
c0de19da:	9b34      	ldr	r3, [sp, #208]	@ 0xd0
c0de19dc:	ea2b 0303 	bic.w	r3, fp, r3
c0de19e0:	407b      	eors	r3, r7
c0de19e2:	ea81 0b03 	eor.w	fp, r1, r3
c0de19e6:	931c      	str	r3, [sp, #112]	@ 0x70
c0de19e8:	9957      	ldr	r1, [sp, #348]	@ 0x15c
c0de19ea:	ea82 000b 	eor.w	r0, r2, fp
c0de19ee:	9a1b      	ldr	r2, [sp, #108]	@ 0x6c
c0de19f0:	9059      	str	r0, [sp, #356]	@ 0x164
c0de19f2:	ea80 0802 	eor.w	r8, r0, r2
c0de19f6:	ea4f 52c8 	mov.w	r2, r8, lsl #23
c0de19fa:	ea42 205c 	orr.w	r0, r2, ip, lsr #9
c0de19fe:	ea4f 024b 	mov.w	r2, fp, lsl #1
c0de1a02:	9036      	str	r0, [sp, #216]	@ 0xd8
c0de1a04:	ea20 000a 	bic.w	r0, r0, sl
c0de1a08:	ea42 72de 	orr.w	r2, r2, lr, lsr #31
c0de1a0c:	9034      	str	r0, [sp, #208]	@ 0xd0
c0de1a0e:	9803      	ldr	r0, [sp, #12]
c0de1a10:	ea27 0300 	bic.w	r3, r7, r0
c0de1a14:	9801      	ldr	r0, [sp, #4]
c0de1a16:	4059      	eors	r1, r3
c0de1a18:	ea26 0300 	bic.w	r3, r6, r0
c0de1a1c:	9835      	ldr	r0, [sp, #212]	@ 0xd4
c0de1a1e:	9133      	str	r1, [sp, #204]	@ 0xcc
c0de1a20:	4058      	eors	r0, r3
c0de1a22:	9b07      	ldr	r3, [sp, #28]
c0de1a24:	ea80 0601 	eor.w	r6, r0, r1
c0de1a28:	9043      	str	r0, [sp, #268]	@ 0x10c
c0de1a2a:	9804      	ldr	r0, [sp, #16]
c0de1a2c:	993a      	ldr	r1, [sp, #232]	@ 0xe8
c0de1a2e:	ea25 0700 	bic.w	r7, r5, r0
c0de1a32:	ea87 0001 	eor.w	r0, r7, r1
c0de1a36:	994f      	ldr	r1, [sp, #316]	@ 0x13c
c0de1a38:	903e      	str	r0, [sp, #248]	@ 0xf8
c0de1a3a:	4046      	eors	r6, r0
c0de1a3c:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de1a3e:	ea24 0000 	bic.w	r0, r4, r0
c0de1a42:	4048      	eors	r0, r1
c0de1a44:	990a      	ldr	r1, [sp, #40]	@ 0x28
c0de1a46:	9014      	str	r0, [sp, #80]	@ 0x50
c0de1a48:	4070      	eors	r0, r6
c0de1a4a:	ea21 0403 	bic.w	r4, r1, r3
c0de1a4e:	9956      	ldr	r1, [sp, #344]	@ 0x158
c0de1a50:	9b44      	ldr	r3, [sp, #272]	@ 0x110
c0de1a52:	404c      	eors	r4, r1
c0de1a54:	995d      	ldr	r1, [sp, #372]	@ 0x174
c0de1a56:	e951 6702 	ldrd	r6, r7, [r1, #-8]
c0de1a5a:	ea84 0106 	eor.w	r1, r4, r6
c0de1a5e:	9e10      	ldr	r6, [sp, #64]	@ 0x40
c0de1a60:	4048      	eors	r0, r1
c0de1a62:	911b      	str	r1, [sp, #108]	@ 0x6c
c0de1a64:	990c      	ldr	r1, [sp, #48]	@ 0x30
c0de1a66:	904f      	str	r0, [sp, #316]	@ 0x13c
c0de1a68:	4050      	eors	r0, r2
c0de1a6a:	ea4f 024e 	mov.w	r2, lr, lsl #1
c0de1a6e:	f8dd e0b4 	ldr.w	lr, [sp, #180]	@ 0xb4
c0de1a72:	ea42 74db 	orr.w	r4, r2, fp, lsr #31
c0de1a76:	902f      	str	r0, [sp, #188]	@ 0xbc
c0de1a78:	4041      	eors	r1, r0
c0de1a7a:	9852      	ldr	r0, [sp, #328]	@ 0x148
c0de1a7c:	9a4e      	ldr	r2, [sp, #312]	@ 0x138
c0de1a7e:	4382      	bics	r2, r0
c0de1a80:	9854      	ldr	r0, [sp, #336]	@ 0x150
c0de1a82:	4050      	eors	r0, r2
c0de1a84:	9a4b      	ldr	r2, [sp, #300]	@ 0x12c
c0de1a86:	9017      	str	r0, [sp, #92]	@ 0x5c
c0de1a88:	439a      	bics	r2, r3
c0de1a8a:	9b48      	ldr	r3, [sp, #288]	@ 0x120
c0de1a8c:	ea83 0b02 	eor.w	fp, r3, r2
c0de1a90:	9b42      	ldr	r3, [sp, #264]	@ 0x108
c0de1a92:	ea8b 0200 	eor.w	r2, fp, r0
c0de1a96:	9846      	ldr	r0, [sp, #280]	@ 0x118
c0de1a98:	ea20 0503 	bic.w	r5, r0, r3
c0de1a9c:	9858      	ldr	r0, [sp, #352]	@ 0x160
c0de1a9e:	9b50      	ldr	r3, [sp, #320]	@ 0x140
c0de1aa0:	4068      	eors	r0, r5
c0de1aa2:	9052      	str	r0, [sp, #328]	@ 0x148
c0de1aa4:	4042      	eors	r2, r0
c0de1aa6:	9855      	ldr	r0, [sp, #340]	@ 0x154
c0de1aa8:	ea20 0503 	bic.w	r5, r0, r3
c0de1aac:	9853      	ldr	r0, [sp, #332]	@ 0x14c
c0de1aae:	9b47      	ldr	r3, [sp, #284]	@ 0x11c
c0de1ab0:	4068      	eors	r0, r5
c0de1ab2:	9055      	str	r0, [sp, #340]	@ 0x154
c0de1ab4:	4042      	eors	r2, r0
c0de1ab6:	9849      	ldr	r0, [sp, #292]	@ 0x124
c0de1ab8:	ea20 0503 	bic.w	r5, r0, r3
c0de1abc:	9851      	ldr	r0, [sp, #324]	@ 0x144
c0de1abe:	9b2c      	ldr	r3, [sp, #176]	@ 0xb0
c0de1ac0:	4045      	eors	r5, r0
c0de1ac2:	ea85 0007 	eor.w	r0, r5, r7
c0de1ac6:	4042      	eors	r2, r0
c0de1ac8:	901a      	str	r0, [sp, #104]	@ 0x68
c0de1aca:	ea82 0004 	eor.w	r0, r2, r4
c0de1ace:	ea80 0703 	eor.w	r7, r0, r3
c0de1ad2:	9b34      	ldr	r3, [sp, #208]	@ 0xd0
c0de1ad4:	9057      	str	r0, [sp, #348]	@ 0x15c
c0de1ad6:	00bc      	lsls	r4, r7, #2
c0de1ad8:	ea44 7091 	orr.w	r0, r4, r1, lsr #30
c0de1adc:	ea4f 54cc 	mov.w	r4, ip, lsl #23
c0de1ae0:	0089      	lsls	r1, r1, #2
c0de1ae2:	4043      	eors	r3, r0
c0de1ae4:	ea44 2858 	orr.w	r8, r4, r8, lsr #9
c0de1ae8:	ea41 7797 	orr.w	r7, r1, r7, lsr #30
c0de1aec:	9356      	str	r3, [sp, #344]	@ 0x158
c0de1aee:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
c0de1af0:	079d      	lsls	r5, r3, #30
c0de1af2:	9b0f      	ldr	r3, [sp, #60]	@ 0x3c
c0de1af4:	ea45 0c93 	orr.w	ip, r5, r3, lsr #2
c0de1af8:	9b02      	ldr	r3, [sp, #8]
c0de1afa:	9d06      	ldr	r5, [sp, #24]
c0de1afc:	ea28 040c 	bic.w	r4, r8, ip
c0de1b00:	ea87 0104 	eor.w	r1, r7, r4
c0de1b04:	ea4f 044e 	mov.w	r4, lr, lsl #1
c0de1b08:	ea44 74d6 	orr.w	r4, r4, r6, lsr #31
c0de1b0c:	9153      	str	r1, [sp, #332]	@ 0x14c
c0de1b0e:	ea2a 0100 	bic.w	r1, sl, r0
c0de1b12:	ea83 0a04 	eor.w	sl, r3, r4
c0de1b16:	0073      	lsls	r3, r6, #1
c0de1b18:	ea43 73de 	orr.w	r3, r3, lr, lsr #31
c0de1b1c:	ea8a 040b 	eor.w	r4, sl, fp
c0de1b20:	f8cd a0c0 	str.w	sl, [sp, #192]	@ 0xc0
c0de1b24:	ea85 0b03 	eor.w	fp, r5, r3
c0de1b28:	9b43      	ldr	r3, [sp, #268]	@ 0x10c
c0de1b2a:	9d4f      	ldr	r5, [sp, #316]	@ 0x13c
c0de1b2c:	f8cd b160 	str.w	fp, [sp, #352]	@ 0x160
c0de1b30:	ea83 030b 	eor.w	r3, r3, fp
c0de1b34:	025e      	lsls	r6, r3, #9
c0de1b36:	ea46 56d4 	orr.w	r6, r6, r4, lsr #23
c0de1b3a:	0264      	lsls	r4, r4, #9
c0de1b3c:	4071      	eors	r1, r6
c0de1b3e:	ea44 53d3 	orr.w	r3, r4, r3, lsr #23
c0de1b42:	ea20 0406 	bic.w	r4, r0, r6
c0de1b46:	0050      	lsls	r0, r2, #1
c0de1b48:	9154      	str	r1, [sp, #336]	@ 0x150
c0de1b4a:	ea2c 0107 	bic.w	r1, ip, r7
c0de1b4e:	ea40 70d5 	orr.w	r0, r0, r5, lsr #31
c0de1b52:	4059      	eors	r1, r3
c0de1b54:	9151      	str	r1, [sp, #324]	@ 0x144
c0de1b56:	994a      	ldr	r1, [sp, #296]	@ 0x128
c0de1b58:	ea80 0e01 	eor.w	lr, r0, r1
c0de1b5c:	0068      	lsls	r0, r5, #1
c0de1b5e:	992e      	ldr	r1, [sp, #184]	@ 0xb8
c0de1b60:	ea40 70d2 	orr.w	r0, r0, r2, lsr #31
c0de1b64:	9a4d      	ldr	r2, [sp, #308]	@ 0x134
c0de1b66:	f8cd e0b4 	str.w	lr, [sp, #180]	@ 0xb4
c0de1b6a:	ea81 010e 	eor.w	r1, r1, lr
c0de1b6e:	4050      	eors	r0, r2
c0de1b70:	9a2a      	ldr	r2, [sp, #168]	@ 0xa8
c0de1b72:	4605      	mov	r5, r0
c0de1b74:	902e      	str	r0, [sp, #184]	@ 0xb8
c0de1b76:	4042      	eors	r2, r0
c0de1b78:	01d0      	lsls	r0, r2, #7
c0de1b7a:	ea40 6051 	orr.w	r0, r0, r1, lsr #25
c0de1b7e:	01c9      	lsls	r1, r1, #7
c0de1b80:	4044      	eors	r4, r0
c0de1b82:	ea41 6152 	orr.w	r1, r1, r2, lsr #25
c0de1b86:	944d      	str	r4, [sp, #308]	@ 0x134
c0de1b88:	ea27 0403 	bic.w	r4, r7, r3
c0de1b8c:	ea81 0204 	eor.w	r2, r1, r4
c0de1b90:	9c36      	ldr	r4, [sp, #216]	@ 0xd8
c0de1b92:	9243      	str	r2, [sp, #268]	@ 0x10c
c0de1b94:	ea26 0200 	bic.w	r2, r6, r0
c0de1b98:	4062      	eors	r2, r4
c0de1b9a:	43a0      	bics	r0, r4
c0de1b9c:	9c5b      	ldr	r4, [sp, #364]	@ 0x16c
c0de1b9e:	924f      	str	r2, [sp, #316]	@ 0x13c
c0de1ba0:	ea23 0201 	bic.w	r2, r3, r1
c0de1ba4:	ea82 0208 	eor.w	r2, r2, r8
c0de1ba8:	9248      	str	r2, [sp, #288]	@ 0x120
c0de1baa:	9a4c      	ldr	r2, [sp, #304]	@ 0x130
c0de1bac:	4050      	eors	r0, r2
c0de1bae:	902c      	str	r0, [sp, #176]	@ 0xb0
c0de1bb0:	ea21 0008 	bic.w	r0, r1, r8
c0de1bb4:	9911      	ldr	r1, [sp, #68]	@ 0x44
c0de1bb6:	f8dd 8170 	ldr.w	r8, [sp, #368]	@ 0x170
c0de1bba:	ea80 000c 	eor.w	r0, r0, ip
c0de1bbe:	902a      	str	r0, [sp, #168]	@ 0xa8
c0de1bc0:	9813      	ldr	r0, [sp, #76]	@ 0x4c
c0de1bc2:	ea8e 0c01 	eor.w	ip, lr, r1
c0de1bc6:	f8dd e168 	ldr.w	lr, [sp, #360]	@ 0x168
c0de1bca:	ea4f 62cc 	mov.w	r2, ip, lsl #27
c0de1bce:	4068      	eors	r0, r5
c0de1bd0:	ea42 1350 	orr.w	r3, r2, r0, lsr #5
c0de1bd4:	9a52      	ldr	r2, [sp, #328]	@ 0x148
c0de1bd6:	06c0      	lsls	r0, r0, #27
c0de1bd8:	461d      	mov	r5, r3
c0de1bda:	9350      	str	r3, [sp, #320]	@ 0x140
c0de1bdc:	ea8a 0102 	eor.w	r1, sl, r2
c0de1be0:	9a3e      	ldr	r2, [sp, #248]	@ 0xf8
c0de1be2:	ea40 1a5c 	orr.w	sl, r0, ip, lsr #5
c0de1be6:	0108      	lsls	r0, r1, #4
c0de1be8:	ea8b 0602 	eor.w	r6, fp, r2
c0de1bec:	0132      	lsls	r2, r6, #4
c0de1bee:	ea40 7c16 	orr.w	ip, r0, r6, lsr #28
c0de1bf2:	ea42 7211 	orr.w	r2, r2, r1, lsr #28
c0de1bf6:	ea2c 000a 	bic.w	r0, ip, sl
c0de1bfa:	9252      	str	r2, [sp, #328]	@ 0x148
c0de1bfc:	439a      	bics	r2, r3
c0de1bfe:	9b1d      	ldr	r3, [sp, #116]	@ 0x74
c0de1c00:	ea84 0703 	eor.w	r7, r4, r3
c0de1c04:	9b1f      	ldr	r3, [sp, #124]	@ 0x7c
c0de1c06:	9c59      	ldr	r4, [sp, #356]	@ 0x164
c0de1c08:	0639      	lsls	r1, r7, #24
c0de1c0a:	405c      	eors	r4, r3
c0de1c0c:	0623      	lsls	r3, r4, #24
c0de1c0e:	ea41 2114 	orr.w	r1, r1, r4, lsr #8
c0de1c12:	ea43 2317 	orr.w	r3, r3, r7, lsr #8
c0de1c16:	4048      	eors	r0, r1
c0de1c18:	405a      	eors	r2, r3
c0de1c1a:	9034      	str	r0, [sp, #208]	@ 0xd0
c0de1c1c:	ea25 0003 	bic.w	r0, r5, r3
c0de1c20:	9d2f      	ldr	r5, [sp, #188]	@ 0xbc
c0de1c22:	923a      	str	r2, [sp, #232]	@ 0xe8
c0de1c24:	9a3f      	ldr	r2, [sp, #252]	@ 0xfc
c0de1c26:	ea8e 0402 	eor.w	r4, lr, r2
c0de1c2a:	9a3c      	ldr	r2, [sp, #240]	@ 0xf0
c0de1c2c:	ea88 0602 	eor.w	r6, r8, r2
c0de1c30:	9a19      	ldr	r2, [sp, #100]	@ 0x64
c0de1c32:	03f7      	lsls	r7, r6, #15
c0de1c34:	ea47 4754 	orr.w	r7, r7, r4, lsr #17
c0de1c38:	03e4      	lsls	r4, r4, #15
c0de1c3a:	4078      	eors	r0, r7
c0de1c3c:	ea44 4456 	orr.w	r4, r4, r6, lsr #17
c0de1c40:	9e40      	ldr	r6, [sp, #256]	@ 0x100
c0de1c42:	9047      	str	r0, [sp, #284]	@ 0x11c
c0de1c44:	ea2a 0001 	bic.w	r0, sl, r1
c0de1c48:	4060      	eors	r0, r4
c0de1c4a:	903f      	str	r0, [sp, #252]	@ 0xfc
c0de1c4c:	ea23 0007 	bic.w	r0, r3, r7
c0de1c50:	ea85 0302 	eor.w	r3, r5, r2
c0de1c54:	9a57      	ldr	r2, [sp, #348]	@ 0x15c
c0de1c56:	4056      	eors	r6, r2
c0de1c58:	ea4f 2b86 	mov.w	fp, r6, lsl #10
c0de1c5c:	ea4b 5b93 	orr.w	fp, fp, r3, lsr #22
c0de1c60:	ea80 000b 	eor.w	r0, r0, fp
c0de1c64:	904a      	str	r0, [sp, #296]	@ 0x128
c0de1c66:	ea21 0004 	bic.w	r0, r1, r4
c0de1c6a:	0299      	lsls	r1, r3, #10
c0de1c6c:	9b52      	ldr	r3, [sp, #328]	@ 0x148
c0de1c6e:	ea41 5196 	orr.w	r1, r1, r6, lsr #22
c0de1c72:	4048      	eors	r0, r1
c0de1c74:	9042      	str	r0, [sp, #264]	@ 0x108
c0de1c76:	ea27 000b 	bic.w	r0, r7, fp
c0de1c7a:	4058      	eors	r0, r3
c0de1c7c:	903e      	str	r0, [sp, #248]	@ 0xf8
c0de1c7e:	ea24 0001 	bic.w	r0, r4, r1
c0de1c82:	9c14      	ldr	r4, [sp, #80]	@ 0x50
c0de1c84:	ea80 000c 	eor.w	r0, r0, ip
c0de1c88:	9036      	str	r0, [sp, #216]	@ 0xd8
c0de1c8a:	ea2b 0003 	bic.w	r0, fp, r3
c0de1c8e:	9b50      	ldr	r3, [sp, #320]	@ 0x140
c0de1c90:	f8dd b16c 	ldr.w	fp, [sp, #364]	@ 0x16c
c0de1c94:	4058      	eors	r0, r3
c0de1c96:	9b58      	ldr	r3, [sp, #352]	@ 0x160
c0de1c98:	903c      	str	r0, [sp, #240]	@ 0xf0
c0de1c9a:	ea21 000c 	bic.w	r0, r1, ip
c0de1c9e:	9941      	ldr	r1, [sp, #260]	@ 0x104
c0de1ca0:	ea80 000a 	eor.w	r0, r0, sl
c0de1ca4:	ea83 0704 	eor.w	r7, r3, r4
c0de1ca8:	9b30      	ldr	r3, [sp, #192]	@ 0xc0
c0de1caa:	9c55      	ldr	r4, [sp, #340]	@ 0x154
c0de1cac:	9035      	str	r0, [sp, #212]	@ 0xd4
c0de1cae:	9838      	ldr	r0, [sp, #224]	@ 0xe0
c0de1cb0:	ea82 0c01 	eor.w	ip, r2, r1
c0de1cb4:	ea4f 024c 	mov.w	r2, ip, lsl #1
c0de1cb8:	4063      	eors	r3, r4
c0de1cba:	4068      	eors	r0, r5
c0de1cbc:	049c      	lsls	r4, r3, #18
c0de1cbe:	ea42 75d0 	orr.w	r5, r2, r0, lsr #31
c0de1cc2:	9a15      	ldr	r2, [sp, #84]	@ 0x54
c0de1cc4:	ea44 3497 	orr.w	r4, r4, r7, lsr #14
c0de1cc8:	0040      	lsls	r0, r0, #1
c0de1cca:	ea40 7adc 	orr.w	sl, r0, ip, lsr #31
c0de1cce:	f8dd c0b8 	ldr.w	ip, [sp, #184]	@ 0xb8
c0de1cd2:	9546      	str	r5, [sp, #280]	@ 0x118
c0de1cd4:	ea8e 0102 	eor.w	r1, lr, r2
c0de1cd8:	9a16      	ldr	r2, [sp, #88]	@ 0x58
c0de1cda:	0188      	lsls	r0, r1, #6
c0de1cdc:	ea88 0602 	eor.w	r6, r8, r2
c0de1ce0:	f8dd 80b4 	ldr.w	r8, [sp, #180]	@ 0xb4
c0de1ce4:	01b2      	lsls	r2, r6, #6
c0de1ce6:	ea40 6e96 	orr.w	lr, r0, r6, lsr #26
c0de1cea:	ea42 6291 	orr.w	r2, r2, r1, lsr #26
c0de1cee:	04b9      	lsls	r1, r7, #18
c0de1cf0:	ea2e 000a 	bic.w	r0, lr, sl
c0de1cf4:	924c      	str	r2, [sp, #304]	@ 0x130
c0de1cf6:	43aa      	bics	r2, r5
c0de1cf8:	ea41 3193 	orr.w	r1, r1, r3, lsr #14
c0de1cfc:	4062      	eors	r2, r4
c0de1cfe:	4048      	eors	r0, r1
c0de1d00:	9255      	str	r2, [sp, #340]	@ 0x154
c0de1d02:	9a32      	ldr	r2, [sp, #200]	@ 0xc8
c0de1d04:	9050      	str	r0, [sp, #320]	@ 0x140
c0de1d06:	ea25 0004 	bic.w	r0, r5, r4
c0de1d0a:	9d59      	ldr	r5, [sp, #356]	@ 0x164
c0de1d0c:	ea8c 0302 	eor.w	r3, ip, r2
c0de1d10:	9a18      	ldr	r2, [sp, #96]	@ 0x60
c0de1d12:	ea88 0602 	eor.w	r6, r8, r2
c0de1d16:	0237      	lsls	r7, r6, #8
c0de1d18:	ea47 6713 	orr.w	r7, r7, r3, lsr #24
c0de1d1c:	021b      	lsls	r3, r3, #8
c0de1d1e:	4078      	eors	r0, r7
c0de1d20:	ea43 6316 	orr.w	r3, r3, r6, lsr #24
c0de1d24:	ea24 0207 	bic.w	r2, r4, r7
c0de1d28:	9052      	str	r0, [sp, #328]	@ 0x148
c0de1d2a:	ea2a 0001 	bic.w	r0, sl, r1
c0de1d2e:	4399      	bics	r1, r3
c0de1d30:	4058      	eors	r0, r3
c0de1d32:	904e      	str	r0, [sp, #312]	@ 0x138
c0de1d34:	9824      	ldr	r0, [sp, #144]	@ 0x90
c0de1d36:	ea85 0400 	eor.w	r4, r5, r0
c0de1d3a:	9821      	ldr	r0, [sp, #132]	@ 0x84
c0de1d3c:	ea8b 0600 	eor.w	r6, fp, r0
c0de1d40:	0670      	lsls	r0, r6, #25
c0de1d42:	ea40 10d4 	orr.w	r0, r0, r4, lsr #7
c0de1d46:	0664      	lsls	r4, r4, #25
c0de1d48:	4042      	eors	r2, r0
c0de1d4a:	ea44 14d6 	orr.w	r4, r4, r6, lsr #7
c0de1d4e:	9249      	str	r2, [sp, #292]	@ 0x124
c0de1d50:	4061      	eors	r1, r4
c0de1d52:	9a4c      	ldr	r2, [sp, #304]	@ 0x130
c0de1d54:	9141      	str	r1, [sp, #260]	@ 0x104
c0de1d56:	ea27 0100 	bic.w	r1, r7, r0
c0de1d5a:	4051      	eors	r1, r2
c0de1d5c:	4390      	bics	r0, r2
c0de1d5e:	914b      	str	r1, [sp, #300]	@ 0x12c
c0de1d60:	ea23 0104 	bic.w	r1, r3, r4
c0de1d64:	9b37      	ldr	r3, [sp, #220]	@ 0xdc
c0de1d66:	ea81 010e 	eor.w	r1, r1, lr
c0de1d6a:	9144      	str	r1, [sp, #272]	@ 0x110
c0de1d6c:	9946      	ldr	r1, [sp, #280]	@ 0x118
c0de1d6e:	4048      	eors	r0, r1
c0de1d70:	9920      	ldr	r1, [sp, #128]	@ 0x80
c0de1d72:	9046      	str	r0, [sp, #280]	@ 0x118
c0de1d74:	ea24 000e 	bic.w	r0, r4, lr
c0de1d78:	9c5c      	ldr	r4, [sp, #368]	@ 0x170
c0de1d7a:	ea80 000a 	eor.w	r0, r0, sl
c0de1d7e:	ea8b 0e01 	eor.w	lr, fp, r1
c0de1d82:	9040      	str	r0, [sp, #256]	@ 0x100
c0de1d84:	9823      	ldr	r0, [sp, #140]	@ 0x8c
c0de1d86:	ea4f 720e 	mov.w	r2, lr, lsl #28
c0de1d8a:	ea84 0703 	eor.w	r7, r4, r3
c0de1d8e:	9b31      	ldr	r3, [sp, #196]	@ 0xc4
c0de1d90:	9c5a      	ldr	r4, [sp, #360]	@ 0x168
c0de1d92:	4068      	eors	r0, r5
c0de1d94:	4063      	eors	r3, r4
c0de1d96:	ea42 1610 	orr.w	r6, r2, r0, lsr #4
c0de1d9a:	9a3b      	ldr	r2, [sp, #236]	@ 0xec
c0de1d9c:	075c      	lsls	r4, r3, #29
c0de1d9e:	0700      	lsls	r0, r0, #28
c0de1da0:	ea44 04d7 	orr.w	r4, r4, r7, lsr #3
c0de1da4:	ea40 1e1e 	orr.w	lr, r0, lr, lsr #4
c0de1da8:	9624      	str	r6, [sp, #144]	@ 0x90
c0de1daa:	ea8c 0502 	eor.w	r5, ip, r2
c0de1dae:	9a39      	ldr	r2, [sp, #228]	@ 0xe4
c0de1db0:	f8dd c0c0 	ldr.w	ip, [sp, #192]	@ 0xc0
c0de1db4:	0528      	lsls	r0, r5, #20
c0de1db6:	ea88 0102 	eor.w	r1, r8, r2
c0de1dba:	f8dd 80bc 	ldr.w	r8, [sp, #188]	@ 0xbc
c0de1dbe:	050a      	lsls	r2, r1, #20
c0de1dc0:	ea42 3a15 	orr.w	sl, r2, r5, lsr #12
c0de1dc4:	ea40 3511 	orr.w	r5, r0, r1, lsr #12
c0de1dc8:	0779      	lsls	r1, r7, #29
c0de1dca:	ea2a 0206 	bic.w	r2, sl, r6
c0de1dce:	ea41 01d3 	orr.w	r1, r1, r3, lsr #3
c0de1dd2:	9b57      	ldr	r3, [sp, #348]	@ 0x15c
c0de1dd4:	ea25 000e 	bic.w	r0, r5, lr
c0de1dd8:	4062      	eors	r2, r4
c0de1dda:	4048      	eors	r0, r1
c0de1ddc:	923b      	str	r2, [sp, #236]	@ 0xec
c0de1dde:	9a3d      	ldr	r2, [sp, #244]	@ 0xf4
c0de1de0:	9039      	str	r0, [sp, #228]	@ 0xe4
c0de1de2:	ea26 0004 	bic.w	r0, r6, r4
c0de1de6:	4053      	eors	r3, r2
c0de1de8:	9a45      	ldr	r2, [sp, #276]	@ 0x114
c0de1dea:	ea88 0602 	eor.w	r6, r8, r2
c0de1dee:	9a58      	ldr	r2, [sp, #352]	@ 0x160
c0de1df0:	0377      	lsls	r7, r6, #13
c0de1df2:	ea47 47d3 	orr.w	r7, r7, r3, lsr #19
c0de1df6:	035b      	lsls	r3, r3, #13
c0de1df8:	4078      	eors	r0, r7
c0de1dfa:	ea43 43d6 	orr.w	r3, r3, r6, lsr #19
c0de1dfe:	ea24 0b07 	bic.w	fp, r4, r7
c0de1e02:	904c      	str	r0, [sp, #304]	@ 0x130
c0de1e04:	ea2e 0001 	bic.w	r0, lr, r1
c0de1e08:	4399      	bics	r1, r3
c0de1e0a:	4058      	eors	r0, r3
c0de1e0c:	9045      	str	r0, [sp, #276]	@ 0x114
c0de1e0e:	9833      	ldr	r0, [sp, #204]	@ 0xcc
c0de1e10:	ea82 0400 	eor.w	r4, r2, r0
c0de1e14:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de1e16:	ea8c 0600 	eor.w	r6, ip, r0
c0de1e1a:	00f0      	lsls	r0, r6, #3
c0de1e1c:	ea40 7054 	orr.w	r0, r0, r4, lsr #29
c0de1e20:	00e4      	lsls	r4, r4, #3
c0de1e22:	ea44 7456 	orr.w	r4, r4, r6, lsr #29
c0de1e26:	ea8b 0200 	eor.w	r2, fp, r0
c0de1e2a:	4061      	eors	r1, r4
c0de1e2c:	9238      	str	r2, [sp, #224]	@ 0xe0
c0de1e2e:	9137      	str	r1, [sp, #220]	@ 0xdc
c0de1e30:	ea27 0100 	bic.w	r1, r7, r0
c0de1e34:	ea20 000a 	bic.w	r0, r0, sl
c0de1e38:	ea81 010a 	eor.w	r1, r1, sl
c0de1e3c:	9132      	str	r1, [sp, #200]	@ 0xc8
c0de1e3e:	ea23 0104 	bic.w	r1, r3, r4
c0de1e42:	4069      	eors	r1, r5
c0de1e44:	9131      	str	r1, [sp, #196]	@ 0xc4
c0de1e46:	9924      	ldr	r1, [sp, #144]	@ 0x90
c0de1e48:	4048      	eors	r0, r1
c0de1e4a:	992e      	ldr	r1, [sp, #184]	@ 0xb8
c0de1e4c:	903d      	str	r0, [sp, #244]	@ 0xf4
c0de1e4e:	ea24 0005 	bic.w	r0, r4, r5
c0de1e52:	ea80 000e 	eor.w	r0, r0, lr
c0de1e56:	9033      	str	r0, [sp, #204]	@ 0xcc
c0de1e58:	9829      	ldr	r0, [sp, #164]	@ 0xa4
c0de1e5a:	ea81 0200 	eor.w	r2, r1, r0
c0de1e5e:	981e      	ldr	r0, [sp, #120]	@ 0x78
c0de1e60:	992d      	ldr	r1, [sp, #180]	@ 0xb4
c0de1e62:	ea81 0300 	eor.w	r3, r1, r0
c0de1e66:	9957      	ldr	r1, [sp, #348]	@ 0x15c
c0de1e68:	0398      	lsls	r0, r3, #14
c0de1e6a:	ea40 4492 	orr.w	r4, r0, r2, lsr #18
c0de1e6e:	9822      	ldr	r0, [sp, #136]	@ 0x88
c0de1e70:	0392      	lsls	r2, r2, #14
c0de1e72:	ea42 4293 	orr.w	r2, r2, r3, lsr #18
c0de1e76:	ea81 0500 	eor.w	r5, r1, r0
c0de1e7a:	982b      	ldr	r0, [sp, #172]	@ 0xac
c0de1e7c:	9958      	ldr	r1, [sp, #352]	@ 0x160
c0de1e7e:	032b      	lsls	r3, r5, #12
c0de1e80:	ea88 0600 	eor.w	r6, r8, r0
c0de1e84:	0330      	lsls	r0, r6, #12
c0de1e86:	ea40 5a15 	orr.w	sl, r0, r5, lsr #20
c0de1e8a:	981a      	ldr	r0, [sp, #104]	@ 0x68
c0de1e8c:	ea43 5516 	orr.w	r5, r3, r6, lsr #20
c0de1e90:	ea80 080c 	eor.w	r8, r0, ip
c0de1e94:	981b      	ldr	r0, [sp, #108]	@ 0x6c
c0de1e96:	ea2a 0708 	bic.w	r7, sl, r8
c0de1e9a:	ea80 0b01 	eor.w	fp, r0, r1
c0de1e9e:	9959      	ldr	r1, [sp, #356]	@ 0x164
c0de1ea0:	ea84 0e07 	eor.w	lr, r4, r7
c0de1ea4:	ea25 060b 	bic.w	r6, r5, fp
c0de1ea8:	ea82 0006 	eor.w	r0, r2, r6
c0de1eac:	9058      	str	r0, [sp, #352]	@ 0x160
c0de1eae:	9826      	ldr	r0, [sp, #152]	@ 0x98
c0de1eb0:	ea81 0600 	eor.w	r6, r1, r0
c0de1eb4:	9825      	ldr	r0, [sp, #148]	@ 0x94
c0de1eb6:	995b      	ldr	r1, [sp, #364]	@ 0x16c
c0de1eb8:	ea81 0700 	eor.w	r7, r1, r0
c0de1ebc:	ea28 0104 	bic.w	r1, r8, r4
c0de1ec0:	0578      	lsls	r0, r7, #21
c0de1ec2:	ea40 20d6 	orr.w	r0, r0, r6, lsr #11
c0de1ec6:	4041      	eors	r1, r0
c0de1ec8:	ea24 0c00 	bic.w	ip, r4, r0
c0de1ecc:	9c5c      	ldr	r4, [sp, #368]	@ 0x170
c0de1ece:	9130      	str	r1, [sp, #192]	@ 0xc0
c0de1ed0:	0571      	lsls	r1, r6, #21
c0de1ed2:	ea2b 0602 	bic.w	r6, fp, r2
c0de1ed6:	ea41 21d7 	orr.w	r1, r1, r7, lsr #11
c0de1eda:	ea86 0301 	eor.w	r3, r6, r1
c0de1ede:	438a      	bics	r2, r1
c0de1ee0:	932e      	str	r3, [sp, #184]	@ 0xb8
c0de1ee2:	9b28      	ldr	r3, [sp, #160]	@ 0xa0
c0de1ee4:	ea84 0603 	eor.w	r6, r4, r3
c0de1ee8:	9b1c      	ldr	r3, [sp, #112]	@ 0x70
c0de1eea:	9c5a      	ldr	r4, [sp, #360]	@ 0x168
c0de1eec:	ea84 0703 	eor.w	r7, r4, r3
c0de1ef0:	02fc      	lsls	r4, r7, #11
c0de1ef2:	ea44 5456 	orr.w	r4, r4, r6, lsr #21
c0de1ef6:	02f6      	lsls	r6, r6, #11
c0de1ef8:	ea8c 0304 	eor.w	r3, ip, r4
c0de1efc:	ea46 5657 	orr.w	r6, r6, r7, lsr #21
c0de1f00:	43a0      	bics	r0, r4
c0de1f02:	935c      	str	r3, [sp, #368]	@ 0x170
c0de1f04:	4072      	eors	r2, r6
c0de1f06:	ea8a 0300 	eor.w	r3, sl, r0
c0de1f0a:	ea21 0006 	bic.w	r0, r1, r6
c0de1f0e:	9259      	str	r2, [sp, #356]	@ 0x164
c0de1f10:	ea85 0200 	eor.w	r2, r5, r0
c0de1f14:	ea24 000a 	bic.w	r0, r4, sl
c0de1f18:	9c5d      	ldr	r4, [sp, #372]	@ 0x174
c0de1f1a:	6861      	ldr	r1, [r4, #4]
c0de1f1c:	ea81 0108 	eor.w	r1, r1, r8
c0de1f20:	4048      	eors	r0, r1
c0de1f22:	f854 1b10 	ldr.w	r1, [r4], #16
c0de1f26:	905b      	str	r0, [sp, #364]	@ 0x16c
c0de1f28:	ea26 0005 	bic.w	r0, r6, r5
c0de1f2c:	ea81 010b 	eor.w	r1, r1, fp
c0de1f30:	945d      	str	r4, [sp, #372]	@ 0x174
c0de1f32:	4048      	eors	r0, r1
c0de1f34:	905a      	str	r0, [sp, #360]	@ 0x168
c0de1f36:	9827      	ldr	r0, [sp, #156]	@ 0x9c
c0de1f38:	3002      	adds	r0, #2
c0de1f3a:	f7ff b9a9 	b.w	c0de1290 <KeccakF1600_StatePermute+0xfc>
c0de1f3e:	9800      	ldr	r0, [sp, #0]
c0de1f40:	9953      	ldr	r1, [sp, #332]	@ 0x14c
c0de1f42:	f8c0 10c0 	str.w	r1, [r0, #192]	@ 0xc0
c0de1f46:	9951      	ldr	r1, [sp, #324]	@ 0x144
c0de1f48:	6082      	str	r2, [r0, #8]
c0de1f4a:	f8c0 e024 	str.w	lr, [r0, #36]	@ 0x24
c0de1f4e:	60c3      	str	r3, [r0, #12]
c0de1f50:	f8c0 10b8 	str.w	r1, [r0, #184]	@ 0xb8
c0de1f54:	9943      	ldr	r1, [sp, #268]	@ 0x10c
c0de1f56:	f8c0 10b0 	str.w	r1, [r0, #176]	@ 0xb0
c0de1f5a:	9948      	ldr	r1, [sp, #288]	@ 0x120
c0de1f5c:	f8c0 10a8 	str.w	r1, [r0, #168]	@ 0xa8
c0de1f60:	992a      	ldr	r1, [sp, #168]	@ 0xa8
c0de1f62:	f8c0 10a0 	str.w	r1, [r0, #160]	@ 0xa0
c0de1f66:	9934      	ldr	r1, [sp, #208]	@ 0xd0
c0de1f68:	f8c0 1098 	str.w	r1, [r0, #152]	@ 0x98
c0de1f6c:	993f      	ldr	r1, [sp, #252]	@ 0xfc
c0de1f6e:	f8c0 1090 	str.w	r1, [r0, #144]	@ 0x90
c0de1f72:	9942      	ldr	r1, [sp, #264]	@ 0x108
c0de1f74:	f8c0 1088 	str.w	r1, [r0, #136]	@ 0x88
c0de1f78:	9936      	ldr	r1, [sp, #216]	@ 0xd8
c0de1f7a:	f8c0 1080 	str.w	r1, [r0, #128]	@ 0x80
c0de1f7e:	9935      	ldr	r1, [sp, #212]	@ 0xd4
c0de1f80:	6781      	str	r1, [r0, #120]	@ 0x78
c0de1f82:	9950      	ldr	r1, [sp, #320]	@ 0x140
c0de1f84:	6701      	str	r1, [r0, #112]	@ 0x70
c0de1f86:	994e      	ldr	r1, [sp, #312]	@ 0x138
c0de1f88:	6681      	str	r1, [r0, #104]	@ 0x68
c0de1f8a:	9941      	ldr	r1, [sp, #260]	@ 0x104
c0de1f8c:	6601      	str	r1, [r0, #96]	@ 0x60
c0de1f8e:	9944      	ldr	r1, [sp, #272]	@ 0x110
c0de1f90:	6581      	str	r1, [r0, #88]	@ 0x58
c0de1f92:	9940      	ldr	r1, [sp, #256]	@ 0x100
c0de1f94:	6501      	str	r1, [r0, #80]	@ 0x50
c0de1f96:	9939      	ldr	r1, [sp, #228]	@ 0xe4
c0de1f98:	6481      	str	r1, [r0, #72]	@ 0x48
c0de1f9a:	9945      	ldr	r1, [sp, #276]	@ 0x114
c0de1f9c:	6401      	str	r1, [r0, #64]	@ 0x40
c0de1f9e:	9937      	ldr	r1, [sp, #220]	@ 0xdc
c0de1fa0:	6381      	str	r1, [r0, #56]	@ 0x38
c0de1fa2:	9931      	ldr	r1, [sp, #196]	@ 0xc4
c0de1fa4:	6301      	str	r1, [r0, #48]	@ 0x30
c0de1fa6:	9933      	ldr	r1, [sp, #204]	@ 0xcc
c0de1fa8:	6281      	str	r1, [r0, #40]	@ 0x28
c0de1faa:	9958      	ldr	r1, [sp, #352]	@ 0x160
c0de1fac:	6201      	str	r1, [r0, #32]
c0de1fae:	992e      	ldr	r1, [sp, #184]	@ 0xb8
c0de1fb0:	6181      	str	r1, [r0, #24]
c0de1fb2:	9959      	ldr	r1, [sp, #356]	@ 0x164
c0de1fb4:	6101      	str	r1, [r0, #16]
c0de1fb6:	995a      	ldr	r1, [sp, #360]	@ 0x168
c0de1fb8:	6001      	str	r1, [r0, #0]
c0de1fba:	9956      	ldr	r1, [sp, #344]	@ 0x158
c0de1fbc:	f8c0 10c4 	str.w	r1, [r0, #196]	@ 0xc4
c0de1fc0:	9954      	ldr	r1, [sp, #336]	@ 0x150
c0de1fc2:	f8c0 10bc 	str.w	r1, [r0, #188]	@ 0xbc
c0de1fc6:	994d      	ldr	r1, [sp, #308]	@ 0x134
c0de1fc8:	f8c0 10b4 	str.w	r1, [r0, #180]	@ 0xb4
c0de1fcc:	994f      	ldr	r1, [sp, #316]	@ 0x13c
c0de1fce:	f8c0 10ac 	str.w	r1, [r0, #172]	@ 0xac
c0de1fd2:	992c      	ldr	r1, [sp, #176]	@ 0xb0
c0de1fd4:	f8c0 10a4 	str.w	r1, [r0, #164]	@ 0xa4
c0de1fd8:	993a      	ldr	r1, [sp, #232]	@ 0xe8
c0de1fda:	f8c0 109c 	str.w	r1, [r0, #156]	@ 0x9c
c0de1fde:	9947      	ldr	r1, [sp, #284]	@ 0x11c
c0de1fe0:	f8c0 1094 	str.w	r1, [r0, #148]	@ 0x94
c0de1fe4:	994a      	ldr	r1, [sp, #296]	@ 0x128
c0de1fe6:	f8c0 108c 	str.w	r1, [r0, #140]	@ 0x8c
c0de1fea:	993e      	ldr	r1, [sp, #248]	@ 0xf8
c0de1fec:	f8c0 1084 	str.w	r1, [r0, #132]	@ 0x84
c0de1ff0:	993c      	ldr	r1, [sp, #240]	@ 0xf0
c0de1ff2:	67c1      	str	r1, [r0, #124]	@ 0x7c
c0de1ff4:	9955      	ldr	r1, [sp, #340]	@ 0x154
c0de1ff6:	6741      	str	r1, [r0, #116]	@ 0x74
c0de1ff8:	9952      	ldr	r1, [sp, #328]	@ 0x148
c0de1ffa:	66c1      	str	r1, [r0, #108]	@ 0x6c
c0de1ffc:	9949      	ldr	r1, [sp, #292]	@ 0x124
c0de1ffe:	6641      	str	r1, [r0, #100]	@ 0x64
c0de2000:	994b      	ldr	r1, [sp, #300]	@ 0x12c
c0de2002:	65c1      	str	r1, [r0, #92]	@ 0x5c
c0de2004:	9946      	ldr	r1, [sp, #280]	@ 0x118
c0de2006:	6541      	str	r1, [r0, #84]	@ 0x54
c0de2008:	993b      	ldr	r1, [sp, #236]	@ 0xec
c0de200a:	64c1      	str	r1, [r0, #76]	@ 0x4c
c0de200c:	994c      	ldr	r1, [sp, #304]	@ 0x130
c0de200e:	6441      	str	r1, [r0, #68]	@ 0x44
c0de2010:	9938      	ldr	r1, [sp, #224]	@ 0xe0
c0de2012:	63c1      	str	r1, [r0, #60]	@ 0x3c
c0de2014:	9932      	ldr	r1, [sp, #200]	@ 0xc8
c0de2016:	6341      	str	r1, [r0, #52]	@ 0x34
c0de2018:	993d      	ldr	r1, [sp, #244]	@ 0xf4
c0de201a:	62c1      	str	r1, [r0, #44]	@ 0x2c
c0de201c:	9930      	ldr	r1, [sp, #192]	@ 0xc0
c0de201e:	61c1      	str	r1, [r0, #28]
c0de2020:	995c      	ldr	r1, [sp, #368]	@ 0x170
c0de2022:	6141      	str	r1, [r0, #20]
c0de2024:	995b      	ldr	r1, [sp, #364]	@ 0x16c
c0de2026:	6041      	str	r1, [r0, #4]
c0de2028:	b05e      	add	sp, #376	@ 0x178
c0de202a:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de202e <store64>:
c0de202e:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de2030:	461c      	mov	r4, r3
c0de2032:	4615      	mov	r5, r2
c0de2034:	4606      	mov	r6, r0
c0de2036:	2700      	movs	r7, #0
c0de2038:	2f40      	cmp	r7, #64	@ 0x40
c0de203a:	bf08      	it	eq
c0de203c:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de203e:	4628      	mov	r0, r5
c0de2040:	4621      	mov	r1, r4
c0de2042:	463a      	mov	r2, r7
c0de2044:	f00a f8b8 	bl	c0dec1b8 <__aeabi_llsr>
c0de2048:	f806 0b01 	strb.w	r0, [r6], #1
c0de204c:	3708      	adds	r7, #8
c0de204e:	e7f3      	b.n	c0de2038 <store64+0xa>

c0de2050 <OUTLINED_FUNCTION_0>:
c0de2050:	58b3      	ldr	r3, [r6, r2]
c0de2052:	4058      	eors	r0, r3
c0de2054:	50b0      	str	r0, [r6, r2]
c0de2056:	18b0      	adds	r0, r6, r2
c0de2058:	6842      	ldr	r2, [r0, #4]
c0de205a:	4051      	eors	r1, r2
c0de205c:	6041      	str	r1, [r0, #4]
c0de205e:	4770      	bx	lr

c0de2060 <OUTLINED_FUNCTION_2>:
c0de2060:	58a3      	ldr	r3, [r4, r2]
c0de2062:	4058      	eors	r0, r3
c0de2064:	50a0      	str	r0, [r4, r2]
c0de2066:	18a0      	adds	r0, r4, r2
c0de2068:	6842      	ldr	r2, [r0, #4]
c0de206a:	4051      	eors	r1, r2
c0de206c:	6041      	str	r1, [r0, #4]
c0de206e:	4770      	bx	lr

c0de2070 <OUTLINED_FUNCTION_3>:
c0de2070:	f8c4 00c8 	str.w	r0, [r4, #200]	@ 0xc8
c0de2074:	bd1c      	pop	{r2, r3, r4, pc}

c0de2076 <keccak_init>:
c0de2076:	2106      	movs	r1, #6
c0de2078:	2220      	movs	r2, #32
c0de207a:	f009 bd44 	b.w	c0debb06 <cx_hash_init_ex>

c0de207e <keccak_update>:
c0de207e:	f009 bd47 	b.w	c0debb10 <cx_hash_update>

c0de2082 <keccak_final>:
c0de2082:	f009 bd3b 	b.w	c0debafc <cx_hash_final>

c0de2086 <inner_keccak256_init>:
c0de2086:	b160      	cbz	r0, c0de20a2 <inner_keccak256_init+0x1c>
c0de2088:	b510      	push	{r4, lr}
c0de208a:	212c      	movs	r1, #44	@ 0x2c
c0de208c:	4604      	mov	r4, r0
c0de208e:	f00a f993 	bl	c0dec3b8 <__aeabi_memclr>
c0de2092:	f104 0030 	add.w	r0, r4, #48	@ 0x30
c0de2096:	f7ff ffee 	bl	c0de2076 <keccak_init>
c0de209a:	2000      	movs	r0, #0
c0de209c:	e9c4 007e 	strd	r0, r0, [r4, #504]	@ 0x1f8
c0de20a0:	bd10      	pop	{r4, pc}
c0de20a2:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de20a6:	4770      	bx	lr

c0de20a8 <inner_keccak256_inject>:
c0de20a8:	b580      	push	{r7, lr}
c0de20aa:	4603      	mov	r3, r0
c0de20ac:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de20b0:	b15b      	cbz	r3, c0de20ca <inner_keccak256_inject+0x22>
c0de20b2:	b151      	cbz	r1, c0de20ca <inner_keccak256_inject+0x22>
c0de20b4:	6a98      	ldr	r0, [r3, #40]	@ 0x28
c0de20b6:	b110      	cbz	r0, c0de20be <inner_keccak256_inject+0x16>
c0de20b8:	f06f 0001 	mvn.w	r0, #1
c0de20bc:	bd80      	pop	{r7, pc}
c0de20be:	f103 0030 	add.w	r0, r3, #48	@ 0x30
c0de20c2:	b292      	uxth	r2, r2
c0de20c4:	f7ff ffdb 	bl	c0de207e <keccak_update>
c0de20c8:	2000      	movs	r0, #0
c0de20ca:	bd80      	pop	{r7, pc}

c0de20cc <inner_keccak256_flip>:
c0de20cc:	b510      	push	{r4, lr}
c0de20ce:	b128      	cbz	r0, c0de20dc <inner_keccak256_flip+0x10>
c0de20d0:	4604      	mov	r4, r0
c0de20d2:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0de20d4:	b128      	cbz	r0, c0de20e2 <inner_keccak256_flip+0x16>
c0de20d6:	f06f 0001 	mvn.w	r0, #1
c0de20da:	bd10      	pop	{r4, pc}
c0de20dc:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de20e0:	bd10      	pop	{r4, pc}
c0de20e2:	f104 0030 	add.w	r0, r4, #48	@ 0x30
c0de20e6:	4621      	mov	r1, r4
c0de20e8:	f7ff ffcb 	bl	c0de2082 <keccak_final>
c0de20ec:	2000      	movs	r0, #0
c0de20ee:	2101      	movs	r1, #1
c0de20f0:	e9c4 007e 	strd	r0, r0, [r4, #504]	@ 0x1f8
c0de20f4:	62a1      	str	r1, [r4, #40]	@ 0x28
c0de20f6:	bd10      	pop	{r4, pc}

c0de20f8 <inner_keccak256_extract>:
c0de20f8:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de20fc:	b0f8      	sub	sp, #480	@ 0x1e0
c0de20fe:	4682      	mov	sl, r0
c0de2100:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de2104:	f1ba 0f00 	cmp.w	sl, #0
c0de2108:	d020      	beq.n	c0de214c <inner_keccak256_extract+0x54>
c0de210a:	460e      	mov	r6, r1
c0de210c:	b1f1      	cbz	r1, c0de214c <inner_keccak256_extract+0x54>
c0de210e:	f8da 0028 	ldr.w	r0, [sl, #40]	@ 0x28
c0de2112:	b1c8      	cbz	r0, c0de2148 <inner_keccak256_extract+0x50>
c0de2114:	e9da 017e 	ldrd	r0, r1, [sl, #504]	@ 0x1f8
c0de2118:	4615      	mov	r5, r2
c0de211a:	4281      	cmp	r1, r0
c0de211c:	d919      	bls.n	c0de2152 <inner_keccak256_extract+0x5a>
c0de211e:	1a0c      	subs	r4, r1, r0
c0de2120:	4450      	add	r0, sl
c0de2122:	46a3      	mov	fp, r4
c0de2124:	42ac      	cmp	r4, r5
c0de2126:	f500 71ec 	add.w	r1, r0, #472	@ 0x1d8
c0de212a:	4630      	mov	r0, r6
c0de212c:	bf88      	it	hi
c0de212e:	46ab      	movhi	fp, r5
c0de2130:	465a      	mov	r2, fp
c0de2132:	f00a f937 	bl	c0dec3a4 <__aeabi_memcpy>
c0de2136:	f8da 01f8 	ldr.w	r0, [sl, #504]	@ 0x1f8
c0de213a:	42ac      	cmp	r4, r5
c0de213c:	4458      	add	r0, fp
c0de213e:	f8ca 01f8 	str.w	r0, [sl, #504]	@ 0x1f8
c0de2142:	d308      	bcc.n	c0de2156 <inner_keccak256_extract+0x5e>
c0de2144:	2000      	movs	r0, #0
c0de2146:	e001      	b.n	c0de214c <inner_keccak256_extract+0x54>
c0de2148:	f06f 0001 	mvn.w	r0, #1
c0de214c:	b078      	add	sp, #480	@ 0x1e0
c0de214e:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de2152:	f04f 0b00 	mov.w	fp, #0
c0de2156:	ac6e      	add	r4, sp, #440	@ 0x1b8
c0de2158:	9503      	str	r5, [sp, #12]
c0de215a:	f104 0020 	add.w	r0, r4, #32
c0de215e:	9002      	str	r0, [sp, #8]
c0de2160:	f50a 70ec 	add.w	r0, sl, #472	@ 0x1d8
c0de2164:	e9cd 0600 	strd	r0, r6, [sp]
c0de2168:	45ab      	cmp	fp, r5
c0de216a:	d2eb      	bcs.n	c0de2144 <inner_keccak256_extract+0x4c>
c0de216c:	4620      	mov	r0, r4
c0de216e:	4651      	mov	r1, sl
c0de2170:	2220      	movs	r2, #32
c0de2172:	46a0      	mov	r8, r4
c0de2174:	f00a f916 	bl	c0dec3a4 <__aeabi_memcpy>
c0de2178:	e9da 5408 	ldrd	r5, r4, [sl, #32]
c0de217c:	9f02      	ldr	r7, [sp, #8]
c0de217e:	2638      	movs	r6, #56	@ 0x38
c0de2180:	f116 0008 	adds.w	r0, r6, #8
c0de2184:	d008      	beq.n	c0de2198 <inner_keccak256_extract+0xa0>
c0de2186:	4628      	mov	r0, r5
c0de2188:	4621      	mov	r1, r4
c0de218a:	4632      	mov	r2, r6
c0de218c:	f00a f814 	bl	c0dec1b8 <__aeabi_llsr>
c0de2190:	f807 0b01 	strb.w	r0, [r7], #1
c0de2194:	3e08      	subs	r6, #8
c0de2196:	e7f3      	b.n	c0de2180 <inner_keccak256_extract+0x88>
c0de2198:	af04      	add	r7, sp, #16
c0de219a:	4638      	mov	r0, r7
c0de219c:	f7ff ff6b 	bl	c0de2076 <keccak_init>
c0de21a0:	4638      	mov	r0, r7
c0de21a2:	4641      	mov	r1, r8
c0de21a4:	2228      	movs	r2, #40	@ 0x28
c0de21a6:	4644      	mov	r4, r8
c0de21a8:	f7ff ff69 	bl	c0de207e <keccak_update>
c0de21ac:	9d03      	ldr	r5, [sp, #12]
c0de21ae:	eba5 080b 	sub.w	r8, r5, fp
c0de21b2:	f1b8 0f1f 	cmp.w	r8, #31
c0de21b6:	d90b      	bls.n	c0de21d0 <inner_keccak256_extract+0xd8>
c0de21b8:	9e01      	ldr	r6, [sp, #4]
c0de21ba:	4638      	mov	r0, r7
c0de21bc:	eb06 010b 	add.w	r1, r6, fp
c0de21c0:	f7ff ff5f 	bl	c0de2082 <keccak_final>
c0de21c4:	f10b 0b20 	add.w	fp, fp, #32
c0de21c8:	f04f 0800 	mov.w	r8, #0
c0de21cc:	2000      	movs	r0, #0
c0de21ce:	e00d      	b.n	c0de21ec <inner_keccak256_extract+0xf4>
c0de21d0:	4638      	mov	r0, r7
c0de21d2:	9f00      	ldr	r7, [sp, #0]
c0de21d4:	4639      	mov	r1, r7
c0de21d6:	f7ff ff54 	bl	c0de2082 <keccak_final>
c0de21da:	9e01      	ldr	r6, [sp, #4]
c0de21dc:	4639      	mov	r1, r7
c0de21de:	4642      	mov	r2, r8
c0de21e0:	eb06 000b 	add.w	r0, r6, fp
c0de21e4:	f00a f8de 	bl	c0dec3a4 <__aeabi_memcpy>
c0de21e8:	2020      	movs	r0, #32
c0de21ea:	46ab      	mov	fp, r5
c0de21ec:	e9ca 807e 	strd	r8, r0, [sl, #504]	@ 0x1f8
c0de21f0:	e9da 0108 	ldrd	r0, r1, [sl, #32]
c0de21f4:	3001      	adds	r0, #1
c0de21f6:	f141 0100 	adc.w	r1, r1, #0
c0de21fa:	e9ca 0108 	strd	r0, r1, [sl, #32]
c0de21fe:	e7b3      	b.n	c0de2168 <inner_keccak256_extract+0x70>

c0de2200 <pqcrystals_dilithium2_lowram_pack_sig_h>:
c0de2200:	b5b0      	push	{r4, r5, r7, lr}
c0de2202:	f500 6012 	add.w	r0, r0, #2336	@ 0x920
c0de2206:	2400      	movs	r4, #0
c0de2208:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de220c:	d009      	beq.n	c0de2222 <pqcrystals_dilithium2_lowram_pack_sig_h+0x22>
c0de220e:	f851 5024 	ldr.w	r5, [r1, r4, lsl #2]
c0de2212:	b125      	cbz	r5, c0de221e <pqcrystals_dilithium2_lowram_pack_sig_h+0x1e>
c0de2214:	681d      	ldr	r5, [r3, #0]
c0de2216:	5544      	strb	r4, [r0, r5]
c0de2218:	681d      	ldr	r5, [r3, #0]
c0de221a:	3501      	adds	r5, #1
c0de221c:	601d      	str	r5, [r3, #0]
c0de221e:	3401      	adds	r4, #1
c0de2220:	e7f2      	b.n	c0de2208 <pqcrystals_dilithium2_lowram_pack_sig_h+0x8>
c0de2222:	6819      	ldr	r1, [r3, #0]
c0de2224:	4410      	add	r0, r2
c0de2226:	f880 1050 	strb.w	r1, [r0, #80]	@ 0x50
c0de222a:	bdb0      	pop	{r4, r5, r7, pc}

c0de222c <pqcrystals_dilithium2_lowram_pack_sig_h_zero>:
c0de222c:	680a      	ldr	r2, [r1, #0]
c0de222e:	f500 6012 	add.w	r0, r0, #2336	@ 0x920
c0de2232:	2300      	movs	r3, #0
c0de2234:	2a4f      	cmp	r2, #79	@ 0x4f
c0de2236:	bf88      	it	hi
c0de2238:	4770      	bxhi	lr
c0de223a:	5483      	strb	r3, [r0, r2]
c0de223c:	680a      	ldr	r2, [r1, #0]
c0de223e:	3201      	adds	r2, #1
c0de2240:	600a      	str	r2, [r1, #0]
c0de2242:	e7f7      	b.n	c0de2234 <pqcrystals_dilithium2_lowram_pack_sig_h_zero+0x8>

c0de2244 <poly_challenge_compress>:
c0de2244:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de2248:	2200      	movs	r2, #0
c0de224a:	2300      	movs	r3, #0
c0de224c:	2b44      	cmp	r3, #68	@ 0x44
c0de224e:	d002      	beq.n	c0de2256 <poly_challenge_compress+0x12>
c0de2250:	54c2      	strb	r2, [r0, r3]
c0de2252:	3301      	adds	r3, #1
c0de2254:	e7fa      	b.n	c0de224c <poly_challenge_compress+0x8>
c0de2256:	2200      	movs	r2, #0
c0de2258:	2301      	movs	r3, #1
c0de225a:	2600      	movs	r6, #0
c0de225c:	f04f 0800 	mov.w	r8, #0
c0de2260:	2500      	movs	r5, #0
c0de2262:	2700      	movs	r7, #0
c0de2264:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de2268:	d011      	beq.n	c0de228e <poly_challenge_compress+0x4a>
c0de226a:	f851 4022 	ldr.w	r4, [r1, r2, lsl #2]
c0de226e:	b164      	cbz	r4, c0de228a <poly_challenge_compress+0x46>
c0de2270:	5582      	strb	r2, [r0, r6]
c0de2272:	f851 4022 	ldr.w	r4, [r1, r2, lsl #2]
c0de2276:	3401      	adds	r4, #1
c0de2278:	bf04      	itt	eq
c0de227a:	433d      	orreq	r5, r7
c0de227c:	ea48 0803 	orreq.w	r8, r8, r3
c0de2280:	007c      	lsls	r4, r7, #1
c0de2282:	3601      	adds	r6, #1
c0de2284:	ea44 77d3 	orr.w	r7, r4, r3, lsr #31
c0de2288:	005b      	lsls	r3, r3, #1
c0de228a:	3201      	adds	r2, #1
c0de228c:	e7ea      	b.n	c0de2264 <poly_challenge_compress+0x20>
c0de228e:	f100 073c 	add.w	r7, r0, #60	@ 0x3c
c0de2292:	2600      	movs	r6, #0
c0de2294:	2e40      	cmp	r6, #64	@ 0x40
c0de2296:	bf08      	it	eq
c0de2298:	e8bd 81f0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de229c:	4640      	mov	r0, r8
c0de229e:	4629      	mov	r1, r5
c0de22a0:	4632      	mov	r2, r6
c0de22a2:	f009 ff89 	bl	c0dec1b8 <__aeabi_llsr>
c0de22a6:	f807 0b01 	strb.w	r0, [r7], #1
c0de22aa:	3608      	adds	r6, #8
c0de22ac:	e7f2      	b.n	c0de2294 <poly_challenge_compress+0x50>

c0de22ae <poly_challenge_decompress>:
c0de22ae:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de22b2:	4688      	mov	r8, r1
c0de22b4:	4682      	mov	sl, r0
c0de22b6:	2000      	movs	r0, #0
c0de22b8:	2100      	movs	r1, #0
c0de22ba:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de22be:	d003      	beq.n	c0de22c8 <poly_challenge_decompress+0x1a>
c0de22c0:	f84a 0021 	str.w	r0, [sl, r1, lsl #2]
c0de22c4:	3101      	adds	r1, #1
c0de22c6:	e7f8      	b.n	c0de22ba <poly_challenge_decompress+0xc>
c0de22c8:	f108 053c 	add.w	r5, r8, #60	@ 0x3c
c0de22cc:	2600      	movs	r6, #0
c0de22ce:	2700      	movs	r7, #0
c0de22d0:	2400      	movs	r4, #0
c0de22d2:	2e40      	cmp	r6, #64	@ 0x40
c0de22d4:	d009      	beq.n	c0de22ea <poly_challenge_decompress+0x3c>
c0de22d6:	f815 0b01 	ldrb.w	r0, [r5], #1
c0de22da:	2100      	movs	r1, #0
c0de22dc:	4632      	mov	r2, r6
c0de22de:	f009 ff59 	bl	c0dec194 <__aeabi_llsl>
c0de22e2:	430c      	orrs	r4, r1
c0de22e4:	4307      	orrs	r7, r0
c0de22e6:	3608      	adds	r6, #8
c0de22e8:	e7f3      	b.n	c0de22d2 <poly_challenge_decompress+0x24>
c0de22ea:	2000      	movs	r0, #0
c0de22ec:	2827      	cmp	r0, #39	@ 0x27
c0de22ee:	bf08      	it	eq
c0de22f0:	e8bd 85f8 	ldmiaeq.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0de22f4:	07fa      	lsls	r2, r7, #31
c0de22f6:	f818 1000 	ldrb.w	r1, [r8, r0]
c0de22fa:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
c0de22fe:	bf08      	it	eq
c0de2300:	2201      	moveq	r2, #1
c0de2302:	ea5f 0454 	movs.w	r4, r4, lsr #1
c0de2306:	f84a 2021 	str.w	r2, [sl, r1, lsl #2]
c0de230a:	ea4f 0737 	mov.w	r7, r7, rrx
c0de230e:	3001      	adds	r0, #1
c0de2310:	e7ec      	b.n	c0de22ec <poly_challenge_decompress+0x3e>

c0de2312 <poly_schoolbook>:
c0de2312:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de2316:	4614      	mov	r4, r2
c0de2318:	468a      	mov	sl, r1
c0de231a:	2200      	movs	r2, #0
c0de231c:	2100      	movs	r1, #0
c0de231e:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de2322:	d003      	beq.n	c0de232c <poly_schoolbook+0x1a>
c0de2324:	f840 2021 	str.w	r2, [r0, r1, lsl #2]
c0de2328:	3101      	adds	r1, #1
c0de232a:	e7f8      	b.n	c0de231e <poly_schoolbook+0xc>
c0de232c:	f10a 053c 	add.w	r5, sl, #60	@ 0x3c
c0de2330:	2700      	movs	r7, #0
c0de2332:	f04f 0b00 	mov.w	fp, #0
c0de2336:	2600      	movs	r6, #0
c0de2338:	9003      	str	r0, [sp, #12]
c0de233a:	2f40      	cmp	r7, #64	@ 0x40
c0de233c:	d006      	beq.n	c0de234c <poly_schoolbook+0x3a>
c0de233e:	f000 fc0a 	bl	c0de2b56 <OUTLINED_FUNCTION_2>
c0de2342:	430e      	orrs	r6, r1
c0de2344:	ea4b 0b00 	orr.w	fp, fp, r0
c0de2348:	3708      	adds	r7, #8
c0de234a:	e7f6      	b.n	c0de233a <poly_schoolbook+0x28>
c0de234c:	f04f 0800 	mov.w	r8, #0
c0de2350:	f8cd a004 	str.w	sl, [sp, #4]
c0de2354:	f1b8 0f27 	cmp.w	r8, #39	@ 0x27
c0de2358:	bf08      	it	eq
c0de235a:	e8bd 8dff 	ldmiaeq.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de235e:	f81a 0008 	ldrb.w	r0, [sl, r8]
c0de2362:	ea5f 71cb 	movs.w	r1, fp, lsl #31
c0de2366:	f5c0 7780 	rsb	r7, r0, #256	@ 0x100
c0de236a:	d111      	bne.n	c0de2390 <poly_schoolbook+0x7e>
c0de236c:	9903      	ldr	r1, [sp, #12]
c0de236e:	9602      	str	r6, [sp, #8]
c0de2370:	2500      	movs	r5, #0
c0de2372:	eb01 0680 	add.w	r6, r1, r0, lsl #2
c0de2376:	42af      	cmp	r7, r5
c0de2378:	d01b      	beq.n	c0de23b2 <poly_schoolbook+0xa0>
c0de237a:	4620      	mov	r0, r4
c0de237c:	4629      	mov	r1, r5
c0de237e:	f000 f842 	bl	c0de2406 <polyt0_unpack_idx>
c0de2382:	f856 1025 	ldr.w	r1, [r6, r5, lsl #2]
c0de2386:	4408      	add	r0, r1
c0de2388:	f846 0025 	str.w	r0, [r6, r5, lsl #2]
c0de238c:	3501      	adds	r5, #1
c0de238e:	e7f2      	b.n	c0de2376 <poly_schoolbook+0x64>
c0de2390:	9903      	ldr	r1, [sp, #12]
c0de2392:	2500      	movs	r5, #0
c0de2394:	eb01 0a80 	add.w	sl, r1, r0, lsl #2
c0de2398:	42af      	cmp	r7, r5
c0de239a:	d01b      	beq.n	c0de23d4 <poly_schoolbook+0xc2>
c0de239c:	4620      	mov	r0, r4
c0de239e:	4629      	mov	r1, r5
c0de23a0:	f000 f831 	bl	c0de2406 <polyt0_unpack_idx>
c0de23a4:	f85a 1025 	ldr.w	r1, [sl, r5, lsl #2]
c0de23a8:	1a08      	subs	r0, r1, r0
c0de23aa:	f84a 0025 	str.w	r0, [sl, r5, lsl #2]
c0de23ae:	3501      	adds	r5, #1
c0de23b0:	e7f2      	b.n	c0de2398 <poly_schoolbook+0x86>
c0de23b2:	f5a6 6580 	sub.w	r5, r6, #1024	@ 0x400
c0de23b6:	9e02      	ldr	r6, [sp, #8]
c0de23b8:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de23bc:	d01c      	beq.n	c0de23f8 <poly_schoolbook+0xe6>
c0de23be:	4620      	mov	r0, r4
c0de23c0:	4639      	mov	r1, r7
c0de23c2:	f000 f820 	bl	c0de2406 <polyt0_unpack_idx>
c0de23c6:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de23ca:	1a08      	subs	r0, r1, r0
c0de23cc:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de23d0:	3701      	adds	r7, #1
c0de23d2:	e7f1      	b.n	c0de23b8 <poly_schoolbook+0xa6>
c0de23d4:	f5aa 6580 	sub.w	r5, sl, #1024	@ 0x400
c0de23d8:	f8dd a004 	ldr.w	sl, [sp, #4]
c0de23dc:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de23e0:	d00a      	beq.n	c0de23f8 <poly_schoolbook+0xe6>
c0de23e2:	4620      	mov	r0, r4
c0de23e4:	4639      	mov	r1, r7
c0de23e6:	f000 f80e 	bl	c0de2406 <polyt0_unpack_idx>
c0de23ea:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de23ee:	4408      	add	r0, r1
c0de23f0:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de23f4:	3701      	adds	r7, #1
c0de23f6:	e7f1      	b.n	c0de23dc <poly_schoolbook+0xca>
c0de23f8:	ea5f 0656 	movs.w	r6, r6, lsr #1
c0de23fc:	f108 0801 	add.w	r8, r8, #1
c0de2400:	ea4f 0b3b 	mov.w	fp, fp, rrx
c0de2404:	e7a6      	b.n	c0de2354 <poly_schoolbook+0x42>

c0de2406 <polyt0_unpack_idx>:
c0de2406:	08ca      	lsrs	r2, r1, #3
c0de2408:	230d      	movs	r3, #13
c0de240a:	f001 0107 	and.w	r1, r1, #7
c0de240e:	fb02 0003 	mla	r0, r2, r3, r0
c0de2412:	2906      	cmp	r1, #6
c0de2414:	d00e      	beq.n	c0de2434 <polyt0_unpack_idx+0x2e>
c0de2416:	2901      	cmp	r1, #1
c0de2418:	d014      	beq.n	c0de2444 <polyt0_unpack_idx+0x3e>
c0de241a:	2902      	cmp	r1, #2
c0de241c:	d01a      	beq.n	c0de2454 <polyt0_unpack_idx+0x4e>
c0de241e:	2903      	cmp	r1, #3
c0de2420:	d01d      	beq.n	c0de245e <polyt0_unpack_idx+0x58>
c0de2422:	2904      	cmp	r1, #4
c0de2424:	d023      	beq.n	c0de246e <polyt0_unpack_idx+0x68>
c0de2426:	2905      	cmp	r1, #5
c0de2428:	d029      	beq.n	c0de247e <polyt0_unpack_idx+0x78>
c0de242a:	bb69      	cbnz	r1, c0de2488 <polyt0_unpack_idx+0x82>
c0de242c:	7801      	ldrb	r1, [r0, #0]
c0de242e:	7840      	ldrb	r0, [r0, #1]
c0de2430:	0200      	lsls	r0, r0, #8
c0de2432:	e02d      	b.n	c0de2490 <polyt0_unpack_idx+0x8a>
c0de2434:	7a82      	ldrb	r2, [r0, #10]
c0de2436:	7a41      	ldrb	r1, [r0, #9]
c0de2438:	7ac3      	ldrb	r3, [r0, #11]
c0de243a:	0090      	lsls	r0, r2, #2
c0de243c:	ea40 1091 	orr.w	r0, r0, r1, lsr #6
c0de2440:	0299      	lsls	r1, r3, #10
c0de2442:	e025      	b.n	c0de2490 <polyt0_unpack_idx+0x8a>
c0de2444:	7882      	ldrb	r2, [r0, #2]
c0de2446:	7841      	ldrb	r1, [r0, #1]
c0de2448:	78c3      	ldrb	r3, [r0, #3]
c0de244a:	00d0      	lsls	r0, r2, #3
c0de244c:	ea40 1051 	orr.w	r0, r0, r1, lsr #5
c0de2450:	02d9      	lsls	r1, r3, #11
c0de2452:	e01d      	b.n	c0de2490 <polyt0_unpack_idx+0x8a>
c0de2454:	78c1      	ldrb	r1, [r0, #3]
c0de2456:	7900      	ldrb	r0, [r0, #4]
c0de2458:	0180      	lsls	r0, r0, #6
c0de245a:	0889      	lsrs	r1, r1, #2
c0de245c:	e018      	b.n	c0de2490 <polyt0_unpack_idx+0x8a>
c0de245e:	7942      	ldrb	r2, [r0, #5]
c0de2460:	7901      	ldrb	r1, [r0, #4]
c0de2462:	7983      	ldrb	r3, [r0, #6]
c0de2464:	0050      	lsls	r0, r2, #1
c0de2466:	ea40 10d1 	orr.w	r0, r0, r1, lsr #7
c0de246a:	0259      	lsls	r1, r3, #9
c0de246c:	e010      	b.n	c0de2490 <polyt0_unpack_idx+0x8a>
c0de246e:	79c2      	ldrb	r2, [r0, #7]
c0de2470:	7981      	ldrb	r1, [r0, #6]
c0de2472:	7a03      	ldrb	r3, [r0, #8]
c0de2474:	0110      	lsls	r0, r2, #4
c0de2476:	ea40 1011 	orr.w	r0, r0, r1, lsr #4
c0de247a:	0319      	lsls	r1, r3, #12
c0de247c:	e008      	b.n	c0de2490 <polyt0_unpack_idx+0x8a>
c0de247e:	7a01      	ldrb	r1, [r0, #8]
c0de2480:	7a40      	ldrb	r0, [r0, #9]
c0de2482:	01c0      	lsls	r0, r0, #7
c0de2484:	0849      	lsrs	r1, r1, #1
c0de2486:	e003      	b.n	c0de2490 <polyt0_unpack_idx+0x8a>
c0de2488:	7ac1      	ldrb	r1, [r0, #11]
c0de248a:	7b00      	ldrb	r0, [r0, #12]
c0de248c:	0140      	lsls	r0, r0, #5
c0de248e:	08c9      	lsrs	r1, r1, #3
c0de2490:	4308      	orrs	r0, r1
c0de2492:	f36f 305f 	bfc	r0, #13, #19
c0de2496:	f5c0 5080 	rsb	r0, r0, #4096	@ 0x1000
c0de249a:	4770      	bx	lr

c0de249c <poly_schoolbook_t1>:
c0de249c:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de24a0:	4614      	mov	r4, r2
c0de24a2:	468b      	mov	fp, r1
c0de24a4:	2200      	movs	r2, #0
c0de24a6:	2100      	movs	r1, #0
c0de24a8:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de24ac:	d003      	beq.n	c0de24b6 <poly_schoolbook_t1+0x1a>
c0de24ae:	f840 2021 	str.w	r2, [r0, r1, lsl #2]
c0de24b2:	3101      	adds	r1, #1
c0de24b4:	e7f8      	b.n	c0de24a8 <poly_schoolbook_t1+0xc>
c0de24b6:	f10b 053c 	add.w	r5, fp, #60	@ 0x3c
c0de24ba:	2700      	movs	r7, #0
c0de24bc:	f04f 0a00 	mov.w	sl, #0
c0de24c0:	2600      	movs	r6, #0
c0de24c2:	9002      	str	r0, [sp, #8]
c0de24c4:	2f40      	cmp	r7, #64	@ 0x40
c0de24c6:	d006      	beq.n	c0de24d6 <poly_schoolbook_t1+0x3a>
c0de24c8:	f000 fb45 	bl	c0de2b56 <OUTLINED_FUNCTION_2>
c0de24cc:	430e      	orrs	r6, r1
c0de24ce:	ea4a 0a00 	orr.w	sl, sl, r0
c0de24d2:	3708      	adds	r7, #8
c0de24d4:	e7f6      	b.n	c0de24c4 <poly_schoolbook_t1+0x28>
c0de24d6:	4832      	ldr	r0, [pc, #200]	@ (c0de25a0 <poly_schoolbook_t1+0x104>)
c0de24d8:	2200      	movs	r2, #0
c0de24da:	f8cd b000 	str.w	fp, [sp]
c0de24de:	4680      	mov	r8, r0
c0de24e0:	2a27      	cmp	r2, #39	@ 0x27
c0de24e2:	bf08      	it	eq
c0de24e4:	e8bd 8dff 	ldmiaeq.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de24e8:	f81b 0002 	ldrb.w	r0, [fp, r2]
c0de24ec:	ea5f 71ca 	movs.w	r1, sl, lsl #31
c0de24f0:	9203      	str	r2, [sp, #12]
c0de24f2:	f5c0 7780 	rsb	r7, r0, #256	@ 0x100
c0de24f6:	d112      	bne.n	c0de251e <poly_schoolbook_t1+0x82>
c0de24f8:	9902      	ldr	r1, [sp, #8]
c0de24fa:	9601      	str	r6, [sp, #4]
c0de24fc:	2500      	movs	r5, #0
c0de24fe:	eb01 0680 	add.w	r6, r1, r0, lsl #2
c0de2502:	42af      	cmp	r7, r5
c0de2504:	d01e      	beq.n	c0de2544 <poly_schoolbook_t1+0xa8>
c0de2506:	4620      	mov	r0, r4
c0de2508:	4629      	mov	r1, r5
c0de250a:	f000 f84b 	bl	c0de25a4 <polyt1_unpack_idx>
c0de250e:	f856 1025 	ldr.w	r1, [r6, r5, lsl #2]
c0de2512:	eb01 3040 	add.w	r0, r1, r0, lsl #13
c0de2516:	f846 0025 	str.w	r0, [r6, r5, lsl #2]
c0de251a:	3501      	adds	r5, #1
c0de251c:	e7f1      	b.n	c0de2502 <poly_schoolbook_t1+0x66>
c0de251e:	9902      	ldr	r1, [sp, #8]
c0de2520:	2500      	movs	r5, #0
c0de2522:	eb01 0b80 	add.w	fp, r1, r0, lsl #2
c0de2526:	42af      	cmp	r7, r5
c0de2528:	d01f      	beq.n	c0de256a <poly_schoolbook_t1+0xce>
c0de252a:	4620      	mov	r0, r4
c0de252c:	4629      	mov	r1, r5
c0de252e:	f000 f839 	bl	c0de25a4 <polyt1_unpack_idx>
c0de2532:	f85b 1025 	ldr.w	r1, [fp, r5, lsl #2]
c0de2536:	4642      	mov	r2, r8
c0de2538:	fb00 1008 	mla	r0, r0, r8, r1
c0de253c:	f84b 0025 	str.w	r0, [fp, r5, lsl #2]
c0de2540:	3501      	adds	r5, #1
c0de2542:	e7f0      	b.n	c0de2526 <poly_schoolbook_t1+0x8a>
c0de2544:	f5a6 6580 	sub.w	r5, r6, #1024	@ 0x400
c0de2548:	9e01      	ldr	r6, [sp, #4]
c0de254a:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de254e:	d01f      	beq.n	c0de2590 <poly_schoolbook_t1+0xf4>
c0de2550:	4620      	mov	r0, r4
c0de2552:	4639      	mov	r1, r7
c0de2554:	f000 f826 	bl	c0de25a4 <polyt1_unpack_idx>
c0de2558:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de255c:	4642      	mov	r2, r8
c0de255e:	fb00 1008 	mla	r0, r0, r8, r1
c0de2562:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de2566:	3701      	adds	r7, #1
c0de2568:	e7ef      	b.n	c0de254a <poly_schoolbook_t1+0xae>
c0de256a:	f5ab 6580 	sub.w	r5, fp, #1024	@ 0x400
c0de256e:	f8dd b000 	ldr.w	fp, [sp]
c0de2572:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de2576:	d00b      	beq.n	c0de2590 <poly_schoolbook_t1+0xf4>
c0de2578:	4620      	mov	r0, r4
c0de257a:	4639      	mov	r1, r7
c0de257c:	f000 f812 	bl	c0de25a4 <polyt1_unpack_idx>
c0de2580:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de2584:	eb01 3040 	add.w	r0, r1, r0, lsl #13
c0de2588:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de258c:	3701      	adds	r7, #1
c0de258e:	e7f0      	b.n	c0de2572 <poly_schoolbook_t1+0xd6>
c0de2590:	9a03      	ldr	r2, [sp, #12]
c0de2592:	ea5f 0656 	movs.w	r6, r6, lsr #1
c0de2596:	ea4f 0a3a 	mov.w	sl, sl, rrx
c0de259a:	3201      	adds	r2, #1
c0de259c:	e7a0      	b.n	c0de24e0 <poly_schoolbook_t1+0x44>
c0de259e:	bf00      	nop
c0de25a0:	ffffe000 	.word	0xffffe000

c0de25a4 <polyt1_unpack_idx>:
c0de25a4:	088a      	lsrs	r2, r1, #2
c0de25a6:	f001 0103 	and.w	r1, r1, #3
c0de25aa:	eb02 0282 	add.w	r2, r2, r2, lsl #2
c0de25ae:	2902      	cmp	r1, #2
c0de25b0:	4410      	add	r0, r2
c0de25b2:	d006      	beq.n	c0de25c2 <polyt1_unpack_idx+0x1e>
c0de25b4:	2901      	cmp	r1, #1
c0de25b6:	d009      	beq.n	c0de25cc <polyt1_unpack_idx+0x28>
c0de25b8:	b969      	cbnz	r1, c0de25d6 <polyt1_unpack_idx+0x32>
c0de25ba:	7801      	ldrb	r1, [r0, #0]
c0de25bc:	2208      	movs	r2, #8
c0de25be:	2301      	movs	r3, #1
c0de25c0:	e00d      	b.n	c0de25de <polyt1_unpack_idx+0x3a>
c0de25c2:	7881      	ldrb	r1, [r0, #2]
c0de25c4:	2204      	movs	r2, #4
c0de25c6:	2303      	movs	r3, #3
c0de25c8:	0909      	lsrs	r1, r1, #4
c0de25ca:	e008      	b.n	c0de25de <polyt1_unpack_idx+0x3a>
c0de25cc:	7841      	ldrb	r1, [r0, #1]
c0de25ce:	2206      	movs	r2, #6
c0de25d0:	2302      	movs	r3, #2
c0de25d2:	0889      	lsrs	r1, r1, #2
c0de25d4:	e003      	b.n	c0de25de <polyt1_unpack_idx+0x3a>
c0de25d6:	78c1      	ldrb	r1, [r0, #3]
c0de25d8:	2202      	movs	r2, #2
c0de25da:	2304      	movs	r3, #4
c0de25dc:	0989      	lsrs	r1, r1, #6
c0de25de:	5cc0      	ldrb	r0, [r0, r3]
c0de25e0:	4090      	lsls	r0, r2
c0de25e2:	f400 707f 	and.w	r0, r0, #1020	@ 0x3fc
c0de25e6:	4308      	orrs	r0, r1
c0de25e8:	4770      	bx	lr

c0de25ea <polyw_pack>:
c0de25ea:	b5b0      	push	{r4, r5, r7, lr}
c0de25ec:	4605      	mov	r5, r0
c0de25ee:	4608      	mov	r0, r1
c0de25f0:	460c      	mov	r4, r1
c0de25f2:	f000 fb3d 	bl	c0de2c70 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de25f6:	4620      	mov	r0, r4
c0de25f8:	f000 fb49 	bl	c0de2c8e <pqcrystals_dilithium2_lowram_poly_caddq>
c0de25fc:	2000      	movs	r0, #0
c0de25fe:	f5b0 7f80 	cmp.w	r0, #256	@ 0x100
c0de2602:	bf08      	it	eq
c0de2604:	bdb0      	popeq	{r4, r5, r7, pc}
c0de2606:	f854 1020 	ldr.w	r1, [r4, r0, lsl #2]
c0de260a:	eb00 0240 	add.w	r2, r0, r0, lsl #1
c0de260e:	54a9      	strb	r1, [r5, r2]
c0de2610:	18a9      	adds	r1, r5, r2
c0de2612:	f854 2020 	ldr.w	r2, [r4, r0, lsl #2]
c0de2616:	0a12      	lsrs	r2, r2, #8
c0de2618:	704a      	strb	r2, [r1, #1]
c0de261a:	eb04 0280 	add.w	r2, r4, r0, lsl #2
c0de261e:	3001      	adds	r0, #1
c0de2620:	8852      	ldrh	r2, [r2, #2]
c0de2622:	708a      	strb	r2, [r1, #2]
c0de2624:	e7eb      	b.n	c0de25fe <polyw_pack+0x14>

c0de2626 <polyw_unpack>:
c0de2626:	b5b0      	push	{r4, r5, r7, lr}
c0de2628:	2200      	movs	r2, #0
c0de262a:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de262e:	bf08      	it	eq
c0de2630:	bdb0      	popeq	{r4, r5, r7, pc}
c0de2632:	eb02 0342 	add.w	r3, r2, r2, lsl #1
c0de2636:	5ccc      	ldrb	r4, [r1, r3]
c0de2638:	440b      	add	r3, r1
c0de263a:	f840 4022 	str.w	r4, [r0, r2, lsl #2]
c0de263e:	785d      	ldrb	r5, [r3, #1]
c0de2640:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de2644:	f840 4022 	str.w	r4, [r0, r2, lsl #2]
c0de2648:	789b      	ldrb	r3, [r3, #2]
c0de264a:	ea44 4303 	orr.w	r3, r4, r3, lsl #16
c0de264e:	f840 3022 	str.w	r3, [r0, r2, lsl #2]
c0de2652:	3201      	adds	r2, #1
c0de2654:	e7e9      	b.n	c0de262a <polyw_unpack+0x4>

c0de2656 <polyw_sub>:
c0de2656:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2658:	3102      	adds	r1, #2
c0de265a:	2300      	movs	r3, #0
c0de265c:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
c0de2660:	bf08      	it	eq
c0de2662:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de2664:	f811 5c02 	ldrb.w	r5, [r1, #-2]
c0de2668:	f811 6c01 	ldrb.w	r6, [r1, #-1]
c0de266c:	f811 7b03 	ldrb.w	r7, [r1], #3
c0de2670:	f852 4023 	ldr.w	r4, [r2, r3, lsl #2]
c0de2674:	ea45 2506 	orr.w	r5, r5, r6, lsl #8
c0de2678:	ea45 4507 	orr.w	r5, r5, r7, lsl #16
c0de267c:	1b2c      	subs	r4, r5, r4
c0de267e:	f840 4023 	str.w	r4, [r0, r3, lsl #2]
c0de2682:	3301      	adds	r3, #1
c0de2684:	e7ea      	b.n	c0de265c <polyw_sub+0x6>

c0de2686 <poly_highbits>:
c0de2686:	b5b0      	push	{r4, r5, r7, lr}
c0de2688:	2200      	movs	r2, #0
c0de268a:	f642 430b 	movw	r3, #11275	@ 0x2c0b
c0de268e:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de2692:	bf08      	it	eq
c0de2694:	bdb0      	popeq	{r4, r5, r7, pc}
c0de2696:	f851 4022 	ldr.w	r4, [r1, r2, lsl #2]
c0de269a:	347f      	adds	r4, #127	@ 0x7f
c0de269c:	11e4      	asrs	r4, r4, #7
c0de269e:	435c      	muls	r4, r3
c0de26a0:	f504 0500 	add.w	r5, r4, #8388608	@ 0x800000
c0de26a4:	162d      	asrs	r5, r5, #24
c0de26a6:	f1b4 5f2e 	cmp.w	r4, #729808896	@ 0x2b800000
c0de26aa:	bfa8      	it	ge
c0de26ac:	2500      	movge	r5, #0
c0de26ae:	f840 5022 	str.w	r5, [r0, r2, lsl #2]
c0de26b2:	3201      	adds	r2, #1
c0de26b4:	e7eb      	b.n	c0de268e <poly_highbits+0x8>
	...

c0de26b8 <poly_lowbits>:
c0de26b8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de26bc:	4e13      	ldr	r6, [pc, #76]	@ (c0de270c <poly_lowbits+0x54>)
c0de26be:	4f15      	ldr	r7, [pc, #84]	@ (c0de2714 <poly_lowbits+0x5c>)
c0de26c0:	2200      	movs	r2, #0
c0de26c2:	f642 4c0b 	movw	ip, #11275	@ 0x2c0b
c0de26c6:	f06f 0e01 	mvn.w	lr, #1
c0de26ca:	46b0      	mov	r8, r6
c0de26cc:	4e10      	ldr	r6, [pc, #64]	@ (c0de2710 <poly_lowbits+0x58>)
c0de26ce:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de26d2:	bf08      	it	eq
c0de26d4:	e8bd 81f0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de26d8:	f851 3022 	ldr.w	r3, [r1, r2, lsl #2]
c0de26dc:	f103 047f 	add.w	r4, r3, #127	@ 0x7f
c0de26e0:	11e4      	asrs	r4, r4, #7
c0de26e2:	fb04 f40c 	mul.w	r4, r4, ip
c0de26e6:	f504 0500 	add.w	r5, r4, #8388608	@ 0x800000
c0de26ea:	f1b4 5f2e 	cmp.w	r4, #729808896	@ 0x2b800000
c0de26ee:	4644      	mov	r4, r8
c0de26f0:	ea0e 55e5 	and.w	r5, lr, r5, asr #23
c0de26f4:	bfb8      	it	lt
c0de26f6:	fb05 3308 	mlalt	r3, r5, r8, r3
c0de26fa:	42bb      	cmp	r3, r7
c0de26fc:	4634      	mov	r4, r6
c0de26fe:	bfc8      	it	gt
c0de2700:	4433      	addgt	r3, r6
c0de2702:	f840 3022 	str.w	r3, [r0, r2, lsl #2]
c0de2706:	3201      	adds	r2, #1
c0de2708:	e7e1      	b.n	c0de26ce <poly_lowbits+0x16>
c0de270a:	bf00      	nop
c0de270c:	fffe8c00 	.word	0xfffe8c00
c0de2710:	ff801fff 	.word	0xff801fff
c0de2714:	003ff000 	.word	0x003ff000

c0de2718 <unpack_sk_s1>:
c0de2718:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de271c:	eb01 1142 	add.w	r1, r1, r2, lsl #5
c0de2720:	3180      	adds	r1, #128	@ 0x80
c0de2722:	f001 bb18 	b.w	c0de3d56 <small_polyeta_unpack>

c0de2726 <unpack_sk_s2>:
c0de2726:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de272a:	eb01 1142 	add.w	r1, r1, r2, lsl #5
c0de272e:	f501 7100 	add.w	r1, r1, #512	@ 0x200
c0de2732:	f001 bb10 	b.w	c0de3d56 <small_polyeta_unpack>
	...

c0de2738 <poly_uniform_pointwise_montgomery_polywadd_lowram>:
c0de2738:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de273c:	f8dd 8030 	ldr.w	r8, [sp, #48]	@ 0x30
c0de2740:	468a      	mov	sl, r1
c0de2742:	4683      	mov	fp, r0
c0de2744:	4611      	mov	r1, r2
c0de2746:	461a      	mov	r2, r3
c0de2748:	4640      	mov	r0, r8
c0de274a:	f001 fb56 	bl	c0de3dfa <pqcrystals_dilithium2_lowram_dilithium_shake128_stream_init>
c0de274e:	4c10      	ldr	r4, [pc, #64]	@ (c0de2790 <poly_uniform_pointwise_montgomery_polywadd_lowram+0x58>)
c0de2750:	2700      	movs	r7, #0
c0de2752:	f10d 0607 	add.w	r6, sp, #7
c0de2756:	4630      	mov	r0, r6
c0de2758:	2109      	movs	r1, #9
c0de275a:	4642      	mov	r2, r8
c0de275c:	f7fe fbf7 	bl	c0de0f4e <pqcrystals_dilithium_fips202_ref_shake128_squeeze>
c0de2760:	2500      	movs	r5, #0
c0de2762:	2d08      	cmp	r5, #8
c0de2764:	bf98      	it	ls
c0de2766:	f5b7 7f80 	cmpls.w	r7, #256	@ 0x100
c0de276a:	d20b      	bcs.n	c0de2784 <poly_uniform_pointwise_montgomery_polywadd_lowram+0x4c>
c0de276c:	f000 f9de 	bl	c0de2b2c <OUTLINED_FUNCTION_0>
c0de2770:	d806      	bhi.n	c0de2780 <poly_uniform_pointwise_montgomery_polywadd_lowram+0x48>
c0de2772:	f85a 1027 	ldr.w	r1, [sl, r7, lsl #2]
c0de2776:	f000 f9f4 	bl	c0de2b62 <OUTLINED_FUNCTION_3>
c0de277a:	f000 f9f6 	bl	c0de2b6a <OUTLINED_FUNCTION_4>
c0de277e:	3701      	adds	r7, #1
c0de2780:	3503      	adds	r5, #3
c0de2782:	e7ee      	b.n	c0de2762 <poly_uniform_pointwise_montgomery_polywadd_lowram+0x2a>
c0de2784:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de2788:	bf28      	it	cs
c0de278a:	e8bd 8dff 	ldmiacs.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de278e:	e7e2      	b.n	c0de2756 <poly_uniform_pointwise_montgomery_polywadd_lowram+0x1e>
c0de2790:	007fe000 	.word	0x007fe000

c0de2794 <polyw_add_idx>:
c0de2794:	b570      	push	{r4, r5, r6, lr}
c0de2796:	4604      	mov	r4, r0
c0de2798:	eb02 0542 	add.w	r5, r2, r2, lsl #1
c0de279c:	1966      	adds	r6, r4, r5
c0de279e:	5d40      	ldrb	r0, [r0, r5]
c0de27a0:	7872      	ldrb	r2, [r6, #1]
c0de27a2:	78b3      	ldrb	r3, [r6, #2]
c0de27a4:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de27a8:	ea40 4003 	orr.w	r0, r0, r3, lsl #16
c0de27ac:	4408      	add	r0, r1
c0de27ae:	f000 fd57 	bl	c0de3260 <pqcrystals_dilithium2_lowram_freeze>
c0de27b2:	0c01      	lsrs	r1, r0, #16
c0de27b4:	5560      	strb	r0, [r4, r5]
c0de27b6:	0a00      	lsrs	r0, r0, #8
c0de27b8:	70b1      	strb	r1, [r6, #2]
c0de27ba:	7070      	strb	r0, [r6, #1]
c0de27bc:	bd70      	pop	{r4, r5, r6, pc}

c0de27be <poly_uniform_gamma1_lowram>:
c0de27be:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de27c0:	b085      	sub	sp, #20
c0de27c2:	4605      	mov	r5, r0
c0de27c4:	4618      	mov	r0, r3
c0de27c6:	461c      	mov	r4, r3
c0de27c8:	f001 fb2b 	bl	c0de3e22 <pqcrystals_dilithium2_lowram_dilithium_shake256_stream_init>
c0de27cc:	2700      	movs	r7, #0
c0de27ce:	ae01      	add	r6, sp, #4
c0de27d0:	2f40      	cmp	r7, #64	@ 0x40
c0de27d2:	bf04      	itt	eq
c0de27d4:	b005      	addeq	sp, #20
c0de27d6:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de27d8:	4630      	mov	r0, r6
c0de27da:	2109      	movs	r1, #9
c0de27dc:	4622      	mov	r2, r4
c0de27de:	f7fe fc9f 	bl	c0de1120 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de27e2:	4630      	mov	r0, r6
c0de27e4:	f000 f80c 	bl	c0de2800 <polyz_unpack_inplace>
c0de27e8:	2000      	movs	r0, #0
c0de27ea:	2804      	cmp	r0, #4
c0de27ec:	d005      	beq.n	c0de27fa <poly_uniform_gamma1_lowram+0x3c>
c0de27ee:	f856 1020 	ldr.w	r1, [r6, r0, lsl #2]
c0de27f2:	f845 1020 	str.w	r1, [r5, r0, lsl #2]
c0de27f6:	3001      	adds	r0, #1
c0de27f8:	e7f7      	b.n	c0de27ea <poly_uniform_gamma1_lowram+0x2c>
c0de27fa:	3510      	adds	r5, #16
c0de27fc:	3701      	adds	r7, #1
c0de27fe:	e7e7      	b.n	c0de27d0 <poly_uniform_gamma1_lowram+0x12>

c0de2800 <polyz_unpack_inplace>:
c0de2800:	b5b0      	push	{r4, r5, r7, lr}
c0de2802:	7801      	ldrb	r1, [r0, #0]
c0de2804:	7883      	ldrb	r3, [r0, #2]
c0de2806:	7842      	ldrb	r2, [r0, #1]
c0de2808:	78c4      	ldrb	r4, [r0, #3]
c0de280a:	7a05      	ldrb	r5, [r0, #8]
c0de280c:	f363 4111 	bfi	r1, r3, #16, #2
c0de2810:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de2814:	79c2      	ldrb	r2, [r0, #7]
c0de2816:	f5c1 3100 	rsb	r1, r1, #131072	@ 0x20000
c0de281a:	6001      	str	r1, [r0, #0]
c0de281c:	7981      	ldrb	r1, [r0, #6]
c0de281e:	0092      	lsls	r2, r2, #2
c0de2820:	ea42 1291 	orr.w	r2, r2, r1, lsr #6
c0de2824:	f001 013f 	and.w	r1, r1, #63	@ 0x3f
c0de2828:	ea42 2285 	orr.w	r2, r2, r5, lsl #10
c0de282c:	7945      	ldrb	r5, [r0, #5]
c0de282e:	f5c2 3200 	rsb	r2, r2, #131072	@ 0x20000
c0de2832:	60c2      	str	r2, [r0, #12]
c0de2834:	7902      	ldrb	r2, [r0, #4]
c0de2836:	012d      	lsls	r5, r5, #4
c0de2838:	ea45 1512 	orr.w	r5, r5, r2, lsr #4
c0de283c:	ea45 3101 	orr.w	r1, r5, r1, lsl #12
c0de2840:	f5c1 3100 	rsb	r1, r1, #131072	@ 0x20000
c0de2844:	6081      	str	r1, [r0, #8]
c0de2846:	0899      	lsrs	r1, r3, #2
c0de2848:	f362 3191 	bfi	r1, r2, #14, #4
c0de284c:	ea41 1184 	orr.w	r1, r1, r4, lsl #6
c0de2850:	f5c1 3100 	rsb	r1, r1, #131072	@ 0x20000
c0de2854:	6041      	str	r1, [r0, #4]
c0de2856:	bdb0      	pop	{r4, r5, r7, pc}

c0de2858 <poly_uniform_gamma1_add_lowram>:
c0de2858:	e92d 41ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
c0de285c:	f8dd 8028 	ldr.w	r8, [sp, #40]	@ 0x28
c0de2860:	460c      	mov	r4, r1
c0de2862:	4605      	mov	r5, r0
c0de2864:	4611      	mov	r1, r2
c0de2866:	461a      	mov	r2, r3
c0de2868:	4640      	mov	r0, r8
c0de286a:	f001 fada 	bl	c0de3e22 <pqcrystals_dilithium2_lowram_dilithium_shake256_stream_init>
c0de286e:	2600      	movs	r6, #0
c0de2870:	466f      	mov	r7, sp
c0de2872:	2e40      	cmp	r6, #64	@ 0x40
c0de2874:	bf08      	it	eq
c0de2876:	e8bd 81ff 	ldmiaeq.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, pc}
c0de287a:	4638      	mov	r0, r7
c0de287c:	2109      	movs	r1, #9
c0de287e:	4642      	mov	r2, r8
c0de2880:	f7fe fc4e 	bl	c0de1120 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de2884:	4638      	mov	r0, r7
c0de2886:	f7ff ffbb 	bl	c0de2800 <polyz_unpack_inplace>
c0de288a:	2000      	movs	r0, #0
c0de288c:	2804      	cmp	r0, #4
c0de288e:	d002      	beq.n	c0de2896 <poly_uniform_gamma1_add_lowram+0x3e>
c0de2890:	f000 f958 	bl	c0de2b44 <OUTLINED_FUNCTION_1>
c0de2894:	e7fa      	b.n	c0de288c <poly_uniform_gamma1_add_lowram+0x34>
c0de2896:	3410      	adds	r4, #16
c0de2898:	3510      	adds	r5, #16
c0de289a:	3601      	adds	r6, #1
c0de289c:	e7e9      	b.n	c0de2872 <poly_uniform_gamma1_add_lowram+0x1a>
	...

c0de28a0 <poly_make_hint_lowram>:
c0de28a0:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de28a4:	4686      	mov	lr, r0
c0de28a6:	481a      	ldr	r0, [pc, #104]	@ (c0de2910 <poly_make_hint_lowram+0x70>)
c0de28a8:	1c93      	adds	r3, r2, #2
c0de28aa:	468c      	mov	ip, r1
c0de28ac:	2200      	movs	r2, #0
c0de28ae:	f642 450b 	movw	r5, #11275	@ 0x2c0b
c0de28b2:	2600      	movs	r6, #0
c0de28b4:	4680      	mov	r8, r0
c0de28b6:	f5b6 7f80 	cmp.w	r6, #256	@ 0x100
c0de28ba:	d026      	beq.n	c0de290a <poly_make_hint_lowram+0x6a>
c0de28bc:	f813 4c02 	ldrb.w	r4, [r3, #-2]
c0de28c0:	f813 1c01 	ldrb.w	r1, [r3, #-1]
c0de28c4:	f813 0b03 	ldrb.w	r0, [r3], #3
c0de28c8:	f85c 7026 	ldr.w	r7, [ip, r6, lsl #2]
c0de28cc:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
c0de28d0:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de28d4:	307f      	adds	r0, #127	@ 0x7f
c0de28d6:	19c1      	adds	r1, r0, r7
c0de28d8:	4647      	mov	r7, r8
c0de28da:	11c9      	asrs	r1, r1, #7
c0de28dc:	4369      	muls	r1, r5
c0de28de:	f501 0400 	add.w	r4, r1, #8388608	@ 0x800000
c0de28e2:	1624      	asrs	r4, r4, #24
c0de28e4:	4541      	cmp	r1, r8
c0de28e6:	bfc8      	it	gt
c0de28e8:	2400      	movgt	r4, #0
c0de28ea:	09c0      	lsrs	r0, r0, #7
c0de28ec:	4368      	muls	r0, r5
c0de28ee:	f500 0100 	add.w	r1, r0, #8388608	@ 0x800000
c0de28f2:	0e09      	lsrs	r1, r1, #24
c0de28f4:	4540      	cmp	r0, r8
c0de28f6:	bf88      	it	hi
c0de28f8:	2100      	movhi	r1, #0
c0de28fa:	1a60      	subs	r0, r4, r1
c0de28fc:	bf18      	it	ne
c0de28fe:	2001      	movne	r0, #1
c0de2900:	f84e 0026 	str.w	r0, [lr, r6, lsl #2]
c0de2904:	4402      	add	r2, r0
c0de2906:	3601      	adds	r6, #1
c0de2908:	e7d5      	b.n	c0de28b6 <poly_make_hint_lowram+0x16>
c0de290a:	4610      	mov	r0, r2
c0de290c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de2910:	2b7fffff 	.word	0x2b7fffff

c0de2914 <unpack_sig_h_indices>:
c0de2914:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de2918:	f503 6c12 	add.w	ip, r3, #2336	@ 0x920
c0de291c:	b142      	cbz	r2, c0de2930 <unpack_sig_h_indices+0x1c>
c0de291e:	eb02 0e0c 	add.w	lr, r2, ip
c0de2922:	f81e 6f50 	ldrb.w	r6, [lr, #80]!
c0de2926:	f81e 5c01 	ldrb.w	r5, [lr, #-1]
c0de292a:	42b5      	cmp	r5, r6
c0de292c:	d905      	bls.n	c0de293a <unpack_sig_h_indices+0x26>
c0de292e:	e006      	b.n	c0de293e <unpack_sig_h_indices+0x2a>
c0de2930:	f893 6970 	ldrb.w	r6, [r3, #2416]	@ 0x970
c0de2934:	f503 6e17 	add.w	lr, r3, #2416	@ 0x970
c0de2938:	2500      	movs	r5, #0
c0de293a:	2e50      	cmp	r6, #80	@ 0x50
c0de293c:	d902      	bls.n	c0de2944 <unpack_sig_h_indices+0x30>
c0de293e:	2001      	movs	r0, #1
c0de2940:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de2944:	eb03 0805 	add.w	r8, r3, r5
c0de2948:	2700      	movs	r7, #0
c0de294a:	19ea      	adds	r2, r5, r7
c0de294c:	42b2      	cmp	r2, r6
c0de294e:	d20e      	bcs.n	c0de296e <unpack_sig_h_indices+0x5a>
c0de2950:	eb08 0407 	add.w	r4, r8, r7
c0de2954:	42aa      	cmp	r2, r5
c0de2956:	f894 6920 	ldrb.w	r6, [r4, #2336]	@ 0x920
c0de295a:	d903      	bls.n	c0de2964 <unpack_sig_h_indices+0x50>
c0de295c:	f894 291f 	ldrb.w	r2, [r4, #2335]	@ 0x91f
c0de2960:	4296      	cmp	r6, r2
c0de2962:	d9ec      	bls.n	c0de293e <unpack_sig_h_indices+0x2a>
c0de2964:	55c6      	strb	r6, [r0, r7]
c0de2966:	3701      	adds	r7, #1
c0de2968:	f89e 6000 	ldrb.w	r6, [lr]
c0de296c:	e7ed      	b.n	c0de294a <unpack_sig_h_indices+0x36>
c0de296e:	600f      	str	r7, [r1, #0]
c0de2970:	f893 0973 	ldrb.w	r0, [r3, #2419]	@ 0x973
c0de2974:	4601      	mov	r1, r0
c0de2976:	284f      	cmp	r0, #79	@ 0x4f
c0de2978:	d804      	bhi.n	c0de2984 <unpack_sig_h_indices+0x70>
c0de297a:	f81c 2001 	ldrb.w	r2, [ip, r1]
c0de297e:	1c48      	adds	r0, r1, #1
c0de2980:	2a00      	cmp	r2, #0
c0de2982:	d0f7      	beq.n	c0de2974 <unpack_sig_h_indices+0x60>
c0de2984:	2000      	movs	r0, #0
c0de2986:	2950      	cmp	r1, #80	@ 0x50
c0de2988:	bf38      	it	cc
c0de298a:	2001      	movcc	r0, #1
c0de298c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0de2990 <poly_use_hint_lowram>:
c0de2990:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de2994:	4698      	mov	r8, r3
c0de2996:	4615      	mov	r5, r2
c0de2998:	460e      	mov	r6, r1
c0de299a:	4607      	mov	r7, r0
c0de299c:	2400      	movs	r4, #0
c0de299e:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de29a2:	bf08      	it	eq
c0de29a4:	e8bd 81f0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de29a8:	4628      	mov	r0, r5
c0de29aa:	4641      	mov	r1, r8
c0de29ac:	b131      	cbz	r1, c0de29bc <poly_use_hint_lowram+0x2c>
c0de29ae:	f810 2b01 	ldrb.w	r2, [r0], #1
c0de29b2:	3901      	subs	r1, #1
c0de29b4:	4294      	cmp	r4, r2
c0de29b6:	d1f9      	bne.n	c0de29ac <poly_use_hint_lowram+0x1c>
c0de29b8:	2101      	movs	r1, #1
c0de29ba:	e000      	b.n	c0de29be <poly_use_hint_lowram+0x2e>
c0de29bc:	2100      	movs	r1, #0
c0de29be:	f856 0024 	ldr.w	r0, [r6, r4, lsl #2]
c0de29c2:	f000 fc87 	bl	c0de32d4 <pqcrystals_dilithium2_lowram_use_hint>
c0de29c6:	f847 0024 	str.w	r0, [r7, r4, lsl #2]
c0de29ca:	3401      	adds	r4, #1
c0de29cc:	e7e7      	b.n	c0de299e <poly_use_hint_lowram+0xe>

c0de29ce <pack_pk_rho>:
c0de29ce:	2200      	movs	r2, #0
c0de29d0:	2a20      	cmp	r2, #32
c0de29d2:	bf08      	it	eq
c0de29d4:	4770      	bxeq	lr
c0de29d6:	5c8b      	ldrb	r3, [r1, r2]
c0de29d8:	5483      	strb	r3, [r0, r2]
c0de29da:	3201      	adds	r2, #1
c0de29dc:	e7f8      	b.n	c0de29d0 <pack_pk_rho+0x2>

c0de29de <pack_pk_t1>:
c0de29de:	eb02 0282 	add.w	r2, r2, r2, lsl #2
c0de29e2:	eb00 1082 	add.w	r0, r0, r2, lsl #6
c0de29e6:	3020      	adds	r0, #32
c0de29e8:	f000 bb42 	b.w	c0de3070 <pqcrystals_dilithium2_lowram_polyt1_pack>

c0de29ec <pack_sk_s1>:
c0de29ec:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de29f0:	eb00 1042 	add.w	r0, r0, r2, lsl #5
c0de29f4:	3080      	adds	r0, #128	@ 0x80
c0de29f6:	f000 bafd 	b.w	c0de2ff4 <pqcrystals_dilithium2_lowram_polyeta_pack>

c0de29fa <pack_sk_s2>:
c0de29fa:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de29fe:	eb00 1042 	add.w	r0, r0, r2, lsl #5
c0de2a02:	f500 7000 	add.w	r0, r0, #512	@ 0x200
c0de2a06:	f000 baf5 	b.w	c0de2ff4 <pqcrystals_dilithium2_lowram_polyeta_pack>

c0de2a0a <pack_sk_t0>:
c0de2a0a:	f44f 73d0 	mov.w	r3, #416	@ 0x1a0
c0de2a0e:	fb02 0003 	mla	r0, r2, r3, r0
c0de2a12:	f500 7060 	add.w	r0, r0, #896	@ 0x380
c0de2a16:	f000 bb4f 	b.w	c0de30b8 <pqcrystals_dilithium2_lowram_polyt0_pack>

c0de2a1a <pack_sk_rho>:
c0de2a1a:	2200      	movs	r2, #0
c0de2a1c:	2a20      	cmp	r2, #32
c0de2a1e:	bf08      	it	eq
c0de2a20:	4770      	bxeq	lr
c0de2a22:	5c8b      	ldrb	r3, [r1, r2]
c0de2a24:	5483      	strb	r3, [r0, r2]
c0de2a26:	3201      	adds	r2, #1
c0de2a28:	e7f8      	b.n	c0de2a1c <pack_sk_rho+0x2>

c0de2a2a <pack_sk_key>:
c0de2a2a:	3020      	adds	r0, #32
c0de2a2c:	2200      	movs	r2, #0
c0de2a2e:	2a20      	cmp	r2, #32
c0de2a30:	bf08      	it	eq
c0de2a32:	4770      	bxeq	lr
c0de2a34:	5c8b      	ldrb	r3, [r1, r2]
c0de2a36:	5483      	strb	r3, [r0, r2]
c0de2a38:	3201      	adds	r2, #1
c0de2a3a:	e7f8      	b.n	c0de2a2e <pack_sk_key+0x4>

c0de2a3c <pack_sk_tr>:
c0de2a3c:	3040      	adds	r0, #64	@ 0x40
c0de2a3e:	2200      	movs	r2, #0
c0de2a40:	2a40      	cmp	r2, #64	@ 0x40
c0de2a42:	bf08      	it	eq
c0de2a44:	4770      	bxeq	lr
c0de2a46:	5c8b      	ldrb	r3, [r1, r2]
c0de2a48:	5483      	strb	r3, [r0, r2]
c0de2a4a:	3201      	adds	r2, #1
c0de2a4c:	e7f8      	b.n	c0de2a40 <pack_sk_tr+0x4>

c0de2a4e <poly_challenge_lowram>:
c0de2a4e:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2a52:	b0b6      	sub	sp, #216	@ 0xd8
c0de2a54:	466e      	mov	r6, sp
c0de2a56:	4680      	mov	r8, r0
c0de2a58:	460d      	mov	r5, r1
c0de2a5a:	4630      	mov	r0, r6
c0de2a5c:	f7fe fb42 	bl	c0de10e4 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de2a60:	4630      	mov	r0, r6
c0de2a62:	4629      	mov	r1, r5
c0de2a64:	2220      	movs	r2, #32
c0de2a66:	f7fe fb45 	bl	c0de10f4 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de2a6a:	4630      	mov	r0, r6
c0de2a6c:	f7fe fb4d 	bl	c0de110a <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de2a70:	ad34      	add	r5, sp, #208	@ 0xd0
c0de2a72:	2108      	movs	r1, #8
c0de2a74:	4632      	mov	r2, r6
c0de2a76:	4628      	mov	r0, r5
c0de2a78:	f7fe fb52 	bl	c0de1120 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de2a7c:	2600      	movs	r6, #0
c0de2a7e:	462c      	mov	r4, r5
c0de2a80:	2700      	movs	r7, #0
c0de2a82:	f04f 0a00 	mov.w	sl, #0
c0de2a86:	2e40      	cmp	r6, #64	@ 0x40
c0de2a88:	d00a      	beq.n	c0de2aa0 <poly_challenge_lowram+0x52>
c0de2a8a:	f814 0b01 	ldrb.w	r0, [r4], #1
c0de2a8e:	2100      	movs	r1, #0
c0de2a90:	4632      	mov	r2, r6
c0de2a92:	f009 fb7f 	bl	c0dec194 <__aeabi_llsl>
c0de2a96:	ea4a 0a01 	orr.w	sl, sl, r1
c0de2a9a:	4307      	orrs	r7, r0
c0de2a9c:	3608      	adds	r6, #8
c0de2a9e:	e7f2      	b.n	c0de2a86 <poly_challenge_lowram+0x38>
c0de2aa0:	2000      	movs	r0, #0
c0de2aa2:	2100      	movs	r1, #0
c0de2aa4:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de2aa8:	d003      	beq.n	c0de2ab2 <poly_challenge_lowram+0x64>
c0de2aaa:	f848 0021 	str.w	r0, [r8, r1, lsl #2]
c0de2aae:	3101      	adds	r1, #1
c0de2ab0:	e7f8      	b.n	c0de2aa4 <poly_challenge_lowram+0x56>
c0de2ab2:	2008      	movs	r0, #8
c0de2ab4:	24d9      	movs	r4, #217	@ 0xd9
c0de2ab6:	466e      	mov	r6, sp
c0de2ab8:	f04f 0b02 	mov.w	fp, #2
c0de2abc:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de2ac0:	d01b      	beq.n	c0de2afa <poly_challenge_lowram+0xac>
c0de2ac2:	2808      	cmp	r0, #8
c0de2ac4:	d305      	bcc.n	c0de2ad2 <poly_challenge_lowram+0x84>
c0de2ac6:	4628      	mov	r0, r5
c0de2ac8:	2108      	movs	r1, #8
c0de2aca:	4632      	mov	r2, r6
c0de2acc:	f7fe fb28 	bl	c0de1120 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de2ad0:	2000      	movs	r0, #0
c0de2ad2:	5c29      	ldrb	r1, [r5, r0]
c0de2ad4:	3001      	adds	r0, #1
c0de2ad6:	428c      	cmp	r4, r1
c0de2ad8:	d3f3      	bcc.n	c0de2ac2 <poly_challenge_lowram+0x74>
c0de2ada:	f858 2021 	ldr.w	r2, [r8, r1, lsl #2]
c0de2ade:	ea5f 0a5a 	movs.w	sl, sl, lsr #1
c0de2ae2:	f848 2024 	str.w	r2, [r8, r4, lsl #2]
c0de2ae6:	ea0b 0247 	and.w	r2, fp, r7, lsl #1
c0de2aea:	ea4f 0737 	mov.w	r7, r7, rrx
c0de2aee:	3401      	adds	r4, #1
c0de2af0:	f1c2 0201 	rsb	r2, r2, #1
c0de2af4:	f848 2021 	str.w	r2, [r8, r1, lsl #2]
c0de2af8:	e7e0      	b.n	c0de2abc <poly_challenge_lowram+0x6e>
c0de2afa:	b036      	add	sp, #216	@ 0xd8
c0de2afc:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de2b00 <pqcrystals_dilithium2_lowram_poly_pointwise_acc_montgomery>:
c0de2b00:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de2b02:	4614      	mov	r4, r2
c0de2b04:	460d      	mov	r5, r1
c0de2b06:	4606      	mov	r6, r0
c0de2b08:	2700      	movs	r7, #0
c0de2b0a:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de2b0e:	bf08      	it	eq
c0de2b10:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de2b12:	f855 0027 	ldr.w	r0, [r5, r7, lsl #2]
c0de2b16:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
c0de2b1a:	f000 f822 	bl	c0de2b62 <OUTLINED_FUNCTION_3>
c0de2b1e:	f856 1027 	ldr.w	r1, [r6, r7, lsl #2]
c0de2b22:	4408      	add	r0, r1
c0de2b24:	f846 0027 	str.w	r0, [r6, r7, lsl #2]
c0de2b28:	3701      	adds	r7, #1
c0de2b2a:	e7ee      	b.n	c0de2b0a <pqcrystals_dilithium2_lowram_poly_pointwise_acc_montgomery+0xa>

c0de2b2c <OUTLINED_FUNCTION_0>:
c0de2b2c:	1971      	adds	r1, r6, r5
c0de2b2e:	5d70      	ldrb	r0, [r6, r5]
c0de2b30:	784a      	ldrb	r2, [r1, #1]
c0de2b32:	7889      	ldrb	r1, [r1, #2]
c0de2b34:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de2b38:	f001 017f 	and.w	r1, r1, #127	@ 0x7f
c0de2b3c:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de2b40:	42a0      	cmp	r0, r4
c0de2b42:	4770      	bx	lr

c0de2b44 <OUTLINED_FUNCTION_1>:
c0de2b44:	f857 1020 	ldr.w	r1, [r7, r0, lsl #2]
c0de2b48:	f854 2020 	ldr.w	r2, [r4, r0, lsl #2]
c0de2b4c:	4411      	add	r1, r2
c0de2b4e:	f845 1020 	str.w	r1, [r5, r0, lsl #2]
c0de2b52:	3001      	adds	r0, #1
c0de2b54:	4770      	bx	lr

c0de2b56 <OUTLINED_FUNCTION_2>:
c0de2b56:	f815 0b01 	ldrb.w	r0, [r5], #1
c0de2b5a:	2100      	movs	r1, #0
c0de2b5c:	463a      	mov	r2, r7
c0de2b5e:	f009 bb19 	b.w	c0dec194 <__aeabi_llsl>

c0de2b62 <OUTLINED_FUNCTION_3>:
c0de2b62:	fb81 0100 	smull	r0, r1, r1, r0
c0de2b66:	f000 bb5d 	b.w	c0de3224 <pqcrystals_dilithium2_lowram_montgomery_reduce>

c0de2b6a <OUTLINED_FUNCTION_4>:
c0de2b6a:	4601      	mov	r1, r0
c0de2b6c:	4658      	mov	r0, fp
c0de2b6e:	463a      	mov	r2, r7
c0de2b70:	f7ff be10 	b.w	c0de2794 <polyw_add_idx>

c0de2b74 <pqcrystals_dilithium2_lowram_ntt>:
c0de2b74:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de2b78:	4604      	mov	r4, r0
c0de2b7a:	4817      	ldr	r0, [pc, #92]	@ (c0de2bd8 <pqcrystals_dilithium2_lowram_ntt+0x64>)
c0de2b7c:	f04f 0880 	mov.w	r8, #128	@ 0x80
c0de2b80:	f04f 0a00 	mov.w	sl, #0
c0de2b84:	4478      	add	r0, pc
c0de2b86:	9001      	str	r0, [sp, #4]
c0de2b88:	f1b8 0f00 	cmp.w	r8, #0
c0de2b8c:	bf08      	it	eq
c0de2b8e:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de2b92:	2700      	movs	r7, #0
c0de2b94:	2fff      	cmp	r7, #255	@ 0xff
c0de2b96:	d81c      	bhi.n	c0de2bd2 <pqcrystals_dilithium2_lowram_ntt+0x5e>
c0de2b98:	9801      	ldr	r0, [sp, #4]
c0de2b9a:	f10a 0a01 	add.w	sl, sl, #1
c0de2b9e:	eb07 0608 	add.w	r6, r7, r8
c0de2ba2:	4635      	mov	r5, r6
c0de2ba4:	f850 b02a 	ldr.w	fp, [r0, sl, lsl #2]
c0de2ba8:	42b7      	cmp	r7, r6
c0de2baa:	d210      	bcs.n	c0de2bce <pqcrystals_dilithium2_lowram_ntt+0x5a>
c0de2bac:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de2bb0:	fb80 010b 	smull	r0, r1, r0, fp
c0de2bb4:	f000 fb36 	bl	c0de3224 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de2bb8:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
c0de2bbc:	180a      	adds	r2, r1, r0
c0de2bbe:	1a08      	subs	r0, r1, r0
c0de2bc0:	f844 2027 	str.w	r2, [r4, r7, lsl #2]
c0de2bc4:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de2bc8:	3501      	adds	r5, #1
c0de2bca:	3701      	adds	r7, #1
c0de2bcc:	e7ec      	b.n	c0de2ba8 <pqcrystals_dilithium2_lowram_ntt+0x34>
c0de2bce:	462f      	mov	r7, r5
c0de2bd0:	e7e0      	b.n	c0de2b94 <pqcrystals_dilithium2_lowram_ntt+0x20>
c0de2bd2:	ea4f 0858 	mov.w	r8, r8, lsr #1
c0de2bd6:	e7d7      	b.n	c0de2b88 <pqcrystals_dilithium2_lowram_ntt+0x14>
c0de2bd8:	0000c6b0 	.word	0x0000c6b0

c0de2bdc <pqcrystals_dilithium2_lowram_invntt_tomont>:
c0de2bdc:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de2be0:	4604      	mov	r4, r0
c0de2be2:	4822      	ldr	r0, [pc, #136]	@ (c0de2c6c <pqcrystals_dilithium2_lowram_invntt_tomont+0x90>)
c0de2be4:	f04f 0801 	mov.w	r8, #1
c0de2be8:	f44f 7a80 	mov.w	sl, #256	@ 0x100
c0de2bec:	4478      	add	r0, pc
c0de2bee:	9001      	str	r0, [sp, #4]
c0de2bf0:	f1b8 0fff 	cmp.w	r8, #255	@ 0xff
c0de2bf4:	d828      	bhi.n	c0de2c48 <pqcrystals_dilithium2_lowram_invntt_tomont+0x6c>
c0de2bf6:	2700      	movs	r7, #0
c0de2bf8:	2fff      	cmp	r7, #255	@ 0xff
c0de2bfa:	d822      	bhi.n	c0de2c42 <pqcrystals_dilithium2_lowram_invntt_tomont+0x66>
c0de2bfc:	9801      	ldr	r0, [sp, #4]
c0de2bfe:	f1aa 0a01 	sub.w	sl, sl, #1
c0de2c02:	eb07 0608 	add.w	r6, r7, r8
c0de2c06:	4635      	mov	r5, r6
c0de2c08:	f850 002a 	ldr.w	r0, [r0, sl, lsl #2]
c0de2c0c:	f1c0 0b00 	rsb	fp, r0, #0
c0de2c10:	42b7      	cmp	r7, r6
c0de2c12:	d214      	bcs.n	c0de2c3e <pqcrystals_dilithium2_lowram_invntt_tomont+0x62>
c0de2c14:	f854 0027 	ldr.w	r0, [r4, r7, lsl #2]
c0de2c18:	f854 1025 	ldr.w	r1, [r4, r5, lsl #2]
c0de2c1c:	4401      	add	r1, r0
c0de2c1e:	f844 1027 	str.w	r1, [r4, r7, lsl #2]
c0de2c22:	f854 1025 	ldr.w	r1, [r4, r5, lsl #2]
c0de2c26:	1a40      	subs	r0, r0, r1
c0de2c28:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de2c2c:	fb80 010b 	smull	r0, r1, r0, fp
c0de2c30:	f000 faf8 	bl	c0de3224 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de2c34:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de2c38:	3501      	adds	r5, #1
c0de2c3a:	3701      	adds	r7, #1
c0de2c3c:	e7e8      	b.n	c0de2c10 <pqcrystals_dilithium2_lowram_invntt_tomont+0x34>
c0de2c3e:	462f      	mov	r7, r5
c0de2c40:	e7da      	b.n	c0de2bf8 <pqcrystals_dilithium2_lowram_invntt_tomont+0x1c>
c0de2c42:	ea4f 0848 	mov.w	r8, r8, lsl #1
c0de2c46:	e7d3      	b.n	c0de2bf0 <pqcrystals_dilithium2_lowram_invntt_tomont+0x14>
c0de2c48:	2500      	movs	r5, #0
c0de2c4a:	f24a 36fa 	movw	r6, #41978	@ 0xa3fa
c0de2c4e:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
c0de2c52:	bf08      	it	eq
c0de2c54:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de2c58:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de2c5c:	fb80 0106 	smull	r0, r1, r0, r6
c0de2c60:	f000 fae0 	bl	c0de3224 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de2c64:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de2c68:	3501      	adds	r5, #1
c0de2c6a:	e7f0      	b.n	c0de2c4e <pqcrystals_dilithium2_lowram_invntt_tomont+0x72>
c0de2c6c:	0000c648 	.word	0x0000c648

c0de2c70 <pqcrystals_dilithium2_lowram_poly_reduce>:
c0de2c70:	b5b0      	push	{r4, r5, r7, lr}
c0de2c72:	4604      	mov	r4, r0
c0de2c74:	2500      	movs	r5, #0
c0de2c76:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
c0de2c7a:	bf08      	it	eq
c0de2c7c:	bdb0      	popeq	{r4, r5, r7, pc}
c0de2c7e:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de2c82:	f000 fadb 	bl	c0de323c <pqcrystals_dilithium2_lowram_reduce32>
c0de2c86:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de2c8a:	3501      	adds	r5, #1
c0de2c8c:	e7f3      	b.n	c0de2c76 <pqcrystals_dilithium2_lowram_poly_reduce+0x6>

c0de2c8e <pqcrystals_dilithium2_lowram_poly_caddq>:
c0de2c8e:	b5b0      	push	{r4, r5, r7, lr}
c0de2c90:	4604      	mov	r4, r0
c0de2c92:	2500      	movs	r5, #0
c0de2c94:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
c0de2c98:	bf08      	it	eq
c0de2c9a:	bdb0      	popeq	{r4, r5, r7, pc}
c0de2c9c:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de2ca0:	f000 fad6 	bl	c0de3250 <pqcrystals_dilithium2_lowram_caddq>
c0de2ca4:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de2ca8:	3501      	adds	r5, #1
c0de2caa:	e7f3      	b.n	c0de2c94 <pqcrystals_dilithium2_lowram_poly_caddq+0x6>

c0de2cac <pqcrystals_dilithium2_lowram_poly_add>:
c0de2cac:	b5b0      	push	{r4, r5, r7, lr}
c0de2cae:	2300      	movs	r3, #0
c0de2cb0:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
c0de2cb4:	bf08      	it	eq
c0de2cb6:	bdb0      	popeq	{r4, r5, r7, pc}
c0de2cb8:	f851 4023 	ldr.w	r4, [r1, r3, lsl #2]
c0de2cbc:	f852 5023 	ldr.w	r5, [r2, r3, lsl #2]
c0de2cc0:	442c      	add	r4, r5
c0de2cc2:	f840 4023 	str.w	r4, [r0, r3, lsl #2]
c0de2cc6:	3301      	adds	r3, #1
c0de2cc8:	e7f2      	b.n	c0de2cb0 <pqcrystals_dilithium2_lowram_poly_add+0x4>

c0de2cca <pqcrystals_dilithium2_lowram_poly_ntt>:
c0de2cca:	f7ff bf53 	b.w	c0de2b74 <pqcrystals_dilithium2_lowram_ntt>

c0de2cce <pqcrystals_dilithium2_lowram_poly_invntt_tomont>:
c0de2cce:	f7ff bf85 	b.w	c0de2bdc <pqcrystals_dilithium2_lowram_invntt_tomont>

c0de2cd2 <pqcrystals_dilithium2_lowram_poly_pointwise_montgomery>:
c0de2cd2:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de2cd4:	f000 fa99 	bl	c0de320a <OUTLINED_FUNCTION_0>
c0de2cd8:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de2cdc:	bf08      	it	eq
c0de2cde:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de2ce0:	f855 0027 	ldr.w	r0, [r5, r7, lsl #2]
c0de2ce4:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
c0de2ce8:	fb81 0100 	smull	r0, r1, r1, r0
c0de2cec:	f000 fa9a 	bl	c0de3224 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de2cf0:	f846 0027 	str.w	r0, [r6, r7, lsl #2]
c0de2cf4:	3701      	adds	r7, #1
c0de2cf6:	e7ef      	b.n	c0de2cd8 <pqcrystals_dilithium2_lowram_poly_pointwise_montgomery+0x6>

c0de2cf8 <pqcrystals_dilithium2_lowram_poly_power2round>:
c0de2cf8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de2cfa:	f000 fa86 	bl	c0de320a <OUTLINED_FUNCTION_0>
c0de2cfe:	f5b7 6f80 	cmp.w	r7, #1024	@ 0x400
c0de2d02:	bf08      	it	eq
c0de2d04:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de2d06:	59e1      	ldr	r1, [r4, r7]
c0de2d08:	19e8      	adds	r0, r5, r7
c0de2d0a:	f000 fab9 	bl	c0de3280 <pqcrystals_dilithium2_lowram_power2round>
c0de2d0e:	51f0      	str	r0, [r6, r7]
c0de2d10:	3704      	adds	r7, #4
c0de2d12:	e7f4      	b.n	c0de2cfe <pqcrystals_dilithium2_lowram_poly_power2round+0x6>

c0de2d14 <pqcrystals_dilithium2_lowram_poly_chknorm>:
c0de2d14:	4a09      	ldr	r2, [pc, #36]	@ (c0de2d3c <pqcrystals_dilithium2_lowram_poly_chknorm+0x28>)
c0de2d16:	4291      	cmp	r1, r2
c0de2d18:	dc0e      	bgt.n	c0de2d38 <pqcrystals_dilithium2_lowram_poly_chknorm+0x24>
c0de2d1a:	2200      	movs	r2, #0
c0de2d1c:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de2d20:	bf04      	itt	eq
c0de2d22:	2000      	moveq	r0, #0
c0de2d24:	4770      	bxeq	lr
c0de2d26:	f850 3022 	ldr.w	r3, [r0, r2, lsl #2]
c0de2d2a:	2b00      	cmp	r3, #0
c0de2d2c:	bf48      	it	mi
c0de2d2e:	eba3 0343 	submi.w	r3, r3, r3, lsl #1
c0de2d32:	3201      	adds	r2, #1
c0de2d34:	428b      	cmp	r3, r1
c0de2d36:	dbf1      	blt.n	c0de2d1c <pqcrystals_dilithium2_lowram_poly_chknorm+0x8>
c0de2d38:	2001      	movs	r0, #1
c0de2d3a:	4770      	bx	lr
c0de2d3c:	000ffc00 	.word	0x000ffc00

c0de2d40 <pqcrystals_dilithium2_lowram_poly_uniform>:
c0de2d40:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2d44:	f5ad 6d84 	sub.w	sp, sp, #1056	@ 0x420
c0de2d48:	46e8      	mov	r8, sp
c0de2d4a:	4683      	mov	fp, r0
c0de2d4c:	4640      	mov	r0, r8
c0de2d4e:	f001 f854 	bl	c0de3dfa <pqcrystals_dilithium2_lowram_dilithium_shake128_stream_init>
c0de2d52:	f10d 06d6 	add.w	r6, sp, #214	@ 0xd6
c0de2d56:	2105      	movs	r1, #5
c0de2d58:	4642      	mov	r2, r8
c0de2d5a:	4630      	mov	r0, r6
c0de2d5c:	f7fe f99f 	bl	c0de109e <pqcrystals_dilithium_fips202_ref_shake128_squeezeblocks>
c0de2d60:	4658      	mov	r0, fp
c0de2d62:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de2d66:	4632      	mov	r2, r6
c0de2d68:	f44f 7352 	mov.w	r3, #840	@ 0x348
c0de2d6c:	f44f 7552 	mov.w	r5, #840	@ 0x348
c0de2d70:	f000 f828 	bl	c0de2dc4 <rej_uniform>
c0de2d74:	4607      	mov	r7, r0
c0de2d76:	f04f 0a03 	mov.w	sl, #3
c0de2d7a:	2fff      	cmp	r7, #255	@ 0xff
c0de2d7c:	d81d      	bhi.n	c0de2dba <pqcrystals_dilithium2_lowram_poly_uniform+0x7a>
c0de2d7e:	fbb5 f0fa 	udiv	r0, r5, sl
c0de2d82:	4631      	mov	r1, r6
c0de2d84:	eb00 0040 	add.w	r0, r0, r0, lsl #1
c0de2d88:	1a2c      	subs	r4, r5, r0
c0de2d8a:	42a8      	cmp	r0, r5
c0de2d8c:	d004      	beq.n	c0de2d98 <pqcrystals_dilithium2_lowram_poly_uniform+0x58>
c0de2d8e:	5c0a      	ldrb	r2, [r1, r0]
c0de2d90:	3d01      	subs	r5, #1
c0de2d92:	700a      	strb	r2, [r1, #0]
c0de2d94:	3101      	adds	r1, #1
c0de2d96:	e7f8      	b.n	c0de2d8a <pqcrystals_dilithium2_lowram_poly_uniform+0x4a>
c0de2d98:	1930      	adds	r0, r6, r4
c0de2d9a:	2101      	movs	r1, #1
c0de2d9c:	4642      	mov	r2, r8
c0de2d9e:	f7fe f97e 	bl	c0de109e <pqcrystals_dilithium_fips202_ref_shake128_squeezeblocks>
c0de2da2:	f044 05a8 	orr.w	r5, r4, #168	@ 0xa8
c0de2da6:	eb0b 0087 	add.w	r0, fp, r7, lsl #2
c0de2daa:	f5c7 7180 	rsb	r1, r7, #256	@ 0x100
c0de2dae:	4632      	mov	r2, r6
c0de2db0:	462b      	mov	r3, r5
c0de2db2:	f000 f807 	bl	c0de2dc4 <rej_uniform>
c0de2db6:	4407      	add	r7, r0
c0de2db8:	e7df      	b.n	c0de2d7a <pqcrystals_dilithium2_lowram_poly_uniform+0x3a>
c0de2dba:	f50d 6d84 	add.w	sp, sp, #1056	@ 0x420
c0de2dbe:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
	...

c0de2dc4 <rej_uniform>:
c0de2dc4:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2dc6:	4c0f      	ldr	r4, [pc, #60]	@ (c0de2e04 <rej_uniform+0x40>)
c0de2dc8:	4684      	mov	ip, r0
c0de2dca:	2000      	movs	r0, #0
c0de2dcc:	2700      	movs	r7, #0
c0de2dce:	46a6      	mov	lr, r4
c0de2dd0:	4288      	cmp	r0, r1
c0de2dd2:	d215      	bcs.n	c0de2e00 <rej_uniform+0x3c>
c0de2dd4:	1cfe      	adds	r6, r7, #3
c0de2dd6:	429e      	cmp	r6, r3
c0de2dd8:	d812      	bhi.n	c0de2e00 <rej_uniform+0x3c>
c0de2dda:	5dd4      	ldrb	r4, [r2, r7]
c0de2ddc:	4417      	add	r7, r2
c0de2dde:	787d      	ldrb	r5, [r7, #1]
c0de2de0:	78bf      	ldrb	r7, [r7, #2]
c0de2de2:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de2de6:	f007 057f 	and.w	r5, r7, #127	@ 0x7f
c0de2dea:	4637      	mov	r7, r6
c0de2dec:	ea44 4405 	orr.w	r4, r4, r5, lsl #16
c0de2df0:	4675      	mov	r5, lr
c0de2df2:	4574      	cmp	r4, lr
c0de2df4:	d8ec      	bhi.n	c0de2dd0 <rej_uniform+0xc>
c0de2df6:	f84c 4020 	str.w	r4, [ip, r0, lsl #2]
c0de2dfa:	3001      	adds	r0, #1
c0de2dfc:	4637      	mov	r7, r6
c0de2dfe:	e7e7      	b.n	c0de2dd0 <rej_uniform+0xc>
c0de2e00:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de2e02:	bf00      	nop
c0de2e04:	007fe000 	.word	0x007fe000

c0de2e08 <pqcrystals_dilithium2_lowram_poly_uniform_eta>:
c0de2e08:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2e0a:	b0d7      	sub	sp, #348	@ 0x15c
c0de2e0c:	466d      	mov	r5, sp
c0de2e0e:	4604      	mov	r4, r0
c0de2e10:	4628      	mov	r0, r5
c0de2e12:	f001 f806 	bl	c0de3e22 <pqcrystals_dilithium2_lowram_dilithium_shake256_stream_init>
c0de2e16:	ae35      	add	r6, sp, #212	@ 0xd4
c0de2e18:	2101      	movs	r1, #1
c0de2e1a:	462a      	mov	r2, r5
c0de2e1c:	4630      	mov	r0, r6
c0de2e1e:	f7fe f998 	bl	c0de1152 <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>
c0de2e22:	4620      	mov	r0, r4
c0de2e24:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de2e28:	4632      	mov	r2, r6
c0de2e2a:	f000 f813 	bl	c0de2e54 <rej_eta>
c0de2e2e:	4607      	mov	r7, r0
c0de2e30:	2fff      	cmp	r7, #255	@ 0xff
c0de2e32:	bf84      	itt	hi
c0de2e34:	b057      	addhi	sp, #348	@ 0x15c
c0de2e36:	bdf0      	pophi	{r4, r5, r6, r7, pc}
c0de2e38:	4630      	mov	r0, r6
c0de2e3a:	2101      	movs	r1, #1
c0de2e3c:	462a      	mov	r2, r5
c0de2e3e:	f7fe f988 	bl	c0de1152 <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>
c0de2e42:	eb04 0087 	add.w	r0, r4, r7, lsl #2
c0de2e46:	f5c7 7180 	rsb	r1, r7, #256	@ 0x100
c0de2e4a:	4632      	mov	r2, r6
c0de2e4c:	f000 f802 	bl	c0de2e54 <rej_eta>
c0de2e50:	4407      	add	r7, r0
c0de2e52:	e7ed      	b.n	c0de2e30 <pqcrystals_dilithium2_lowram_poly_uniform_eta+0x28>

c0de2e54 <rej_eta>:
c0de2e54:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2e56:	4603      	mov	r3, r0
c0de2e58:	2000      	movs	r0, #0
c0de2e5a:	f04f 0ccd 	mov.w	ip, #205	@ 0xcd
c0de2e5e:	2500      	movs	r5, #0
c0de2e60:	4288      	cmp	r0, r1
c0de2e62:	d221      	bcs.n	c0de2ea8 <rej_eta+0x54>
c0de2e64:	2d87      	cmp	r5, #135	@ 0x87
c0de2e66:	d81f      	bhi.n	c0de2ea8 <rej_eta+0x54>
c0de2e68:	5d56      	ldrb	r6, [r2, r5]
c0de2e6a:	f006 070f 	and.w	r7, r6, #15
c0de2e6e:	2f0f      	cmp	r7, #15
c0de2e70:	d009      	beq.n	c0de2e86 <rej_eta+0x32>
c0de2e72:	fb07 f40c 	mul.w	r4, r7, ip
c0de2e76:	0aa4      	lsrs	r4, r4, #10
c0de2e78:	eb04 0484 	add.w	r4, r4, r4, lsl #2
c0de2e7c:	1be4      	subs	r4, r4, r7
c0de2e7e:	3402      	adds	r4, #2
c0de2e80:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
c0de2e84:	3001      	adds	r0, #1
c0de2e86:	0936      	lsrs	r6, r6, #4
c0de2e88:	2e0f      	cmp	r6, #15
c0de2e8a:	d00b      	beq.n	c0de2ea4 <rej_eta+0x50>
c0de2e8c:	4288      	cmp	r0, r1
c0de2e8e:	d209      	bcs.n	c0de2ea4 <rej_eta+0x50>
c0de2e90:	fb06 f40c 	mul.w	r4, r6, ip
c0de2e94:	0aa4      	lsrs	r4, r4, #10
c0de2e96:	eb04 0484 	add.w	r4, r4, r4, lsl #2
c0de2e9a:	1ba4      	subs	r4, r4, r6
c0de2e9c:	3402      	adds	r4, #2
c0de2e9e:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
c0de2ea2:	3001      	adds	r0, #1
c0de2ea4:	3501      	adds	r5, #1
c0de2ea6:	e7db      	b.n	c0de2e60 <rej_eta+0xc>
c0de2ea8:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de2eaa <pqcrystals_dilithium2_lowram_polyz_unpack>:
c0de2eaa:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2eac:	3008      	adds	r0, #8
c0de2eae:	f04f 0c00 	mov.w	ip, #0
c0de2eb2:	f5bc 7f10 	cmp.w	ip, #576	@ 0x240
c0de2eb6:	bf08      	it	eq
c0de2eb8:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de2eba:	f811 300c 	ldrb.w	r3, [r1, ip]
c0de2ebe:	eb01 040c 	add.w	r4, r1, ip
c0de2ec2:	f10c 0c09 	add.w	ip, ip, #9
c0de2ec6:	f840 3c08 	str.w	r3, [r0, #-8]
c0de2eca:	7865      	ldrb	r5, [r4, #1]
c0de2ecc:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0de2ed0:	f840 3c08 	str.w	r3, [r0, #-8]
c0de2ed4:	78a5      	ldrb	r5, [r4, #2]
c0de2ed6:	f365 4311 	bfi	r3, r5, #16, #2
c0de2eda:	f840 3c08 	str.w	r3, [r0, #-8]
c0de2ede:	f5c3 3300 	rsb	r3, r3, #131072	@ 0x20000
c0de2ee2:	78a5      	ldrb	r5, [r4, #2]
c0de2ee4:	08ae      	lsrs	r6, r5, #2
c0de2ee6:	f840 6c04 	str.w	r6, [r0, #-4]
c0de2eea:	78e6      	ldrb	r6, [r4, #3]
c0de2eec:	01b6      	lsls	r6, r6, #6
c0de2eee:	ea46 0595 	orr.w	r5, r6, r5, lsr #2
c0de2ef2:	f840 5c04 	str.w	r5, [r0, #-4]
c0de2ef6:	7926      	ldrb	r6, [r4, #4]
c0de2ef8:	f366 3591 	bfi	r5, r6, #14, #4
c0de2efc:	f840 5c04 	str.w	r5, [r0, #-4]
c0de2f00:	f5c5 3500 	rsb	r5, r5, #131072	@ 0x20000
c0de2f04:	7926      	ldrb	r6, [r4, #4]
c0de2f06:	0937      	lsrs	r7, r6, #4
c0de2f08:	6007      	str	r7, [r0, #0]
c0de2f0a:	7967      	ldrb	r7, [r4, #5]
c0de2f0c:	013f      	lsls	r7, r7, #4
c0de2f0e:	ea47 1616 	orr.w	r6, r7, r6, lsr #4
c0de2f12:	6006      	str	r6, [r0, #0]
c0de2f14:	79a7      	ldrb	r7, [r4, #6]
c0de2f16:	f367 3611 	bfi	r6, r7, #12, #6
c0de2f1a:	6006      	str	r6, [r0, #0]
c0de2f1c:	f5c6 3600 	rsb	r6, r6, #131072	@ 0x20000
c0de2f20:	79a7      	ldrb	r7, [r4, #6]
c0de2f22:	09ba      	lsrs	r2, r7, #6
c0de2f24:	6042      	str	r2, [r0, #4]
c0de2f26:	79e2      	ldrb	r2, [r4, #7]
c0de2f28:	0092      	lsls	r2, r2, #2
c0de2f2a:	ea42 1297 	orr.w	r2, r2, r7, lsr #6
c0de2f2e:	6042      	str	r2, [r0, #4]
c0de2f30:	7a24      	ldrb	r4, [r4, #8]
c0de2f32:	6006      	str	r6, [r0, #0]
c0de2f34:	f840 5c04 	str.w	r5, [r0, #-4]
c0de2f38:	f840 3c08 	str.w	r3, [r0, #-8]
c0de2f3c:	ea42 2284 	orr.w	r2, r2, r4, lsl #10
c0de2f40:	f5c2 3200 	rsb	r2, r2, #131072	@ 0x20000
c0de2f44:	6042      	str	r2, [r0, #4]
c0de2f46:	3010      	adds	r0, #16
c0de2f48:	e7b3      	b.n	c0de2eb2 <pqcrystals_dilithium2_lowram_polyz_unpack+0x8>

c0de2f4a <pqcrystals_dilithium2_lowram_poly_challenge>:
c0de2f4a:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2f4e:	b0d6      	sub	sp, #344	@ 0x158
c0de2f50:	466e      	mov	r6, sp
c0de2f52:	4680      	mov	r8, r0
c0de2f54:	460d      	mov	r5, r1
c0de2f56:	4630      	mov	r0, r6
c0de2f58:	f7fe f8c4 	bl	c0de10e4 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de2f5c:	4630      	mov	r0, r6
c0de2f5e:	4629      	mov	r1, r5
c0de2f60:	2220      	movs	r2, #32
c0de2f62:	f7fe f8c7 	bl	c0de10f4 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de2f66:	4630      	mov	r0, r6
c0de2f68:	f7fe f8cf 	bl	c0de110a <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de2f6c:	ad34      	add	r5, sp, #208	@ 0xd0
c0de2f6e:	2101      	movs	r1, #1
c0de2f70:	4632      	mov	r2, r6
c0de2f72:	4628      	mov	r0, r5
c0de2f74:	f7fe f8ed 	bl	c0de1152 <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>
c0de2f78:	2600      	movs	r6, #0
c0de2f7a:	462c      	mov	r4, r5
c0de2f7c:	2700      	movs	r7, #0
c0de2f7e:	f04f 0a00 	mov.w	sl, #0
c0de2f82:	2e40      	cmp	r6, #64	@ 0x40
c0de2f84:	d006      	beq.n	c0de2f94 <pqcrystals_dilithium2_lowram_poly_challenge+0x4a>
c0de2f86:	f000 f945 	bl	c0de3214 <OUTLINED_FUNCTION_1>
c0de2f8a:	ea4a 0a01 	orr.w	sl, sl, r1
c0de2f8e:	4307      	orrs	r7, r0
c0de2f90:	3608      	adds	r6, #8
c0de2f92:	e7f6      	b.n	c0de2f82 <pqcrystals_dilithium2_lowram_poly_challenge+0x38>
c0de2f94:	2000      	movs	r0, #0
c0de2f96:	2100      	movs	r1, #0
c0de2f98:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de2f9c:	d003      	beq.n	c0de2fa6 <pqcrystals_dilithium2_lowram_poly_challenge+0x5c>
c0de2f9e:	f848 0021 	str.w	r0, [r8, r1, lsl #2]
c0de2fa2:	3101      	adds	r1, #1
c0de2fa4:	e7f8      	b.n	c0de2f98 <pqcrystals_dilithium2_lowram_poly_challenge+0x4e>
c0de2fa6:	2008      	movs	r0, #8
c0de2fa8:	24d9      	movs	r4, #217	@ 0xd9
c0de2faa:	466e      	mov	r6, sp
c0de2fac:	f04f 0b02 	mov.w	fp, #2
c0de2fb0:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de2fb4:	d01b      	beq.n	c0de2fee <pqcrystals_dilithium2_lowram_poly_challenge+0xa4>
c0de2fb6:	2888      	cmp	r0, #136	@ 0x88
c0de2fb8:	d305      	bcc.n	c0de2fc6 <pqcrystals_dilithium2_lowram_poly_challenge+0x7c>
c0de2fba:	4628      	mov	r0, r5
c0de2fbc:	2101      	movs	r1, #1
c0de2fbe:	4632      	mov	r2, r6
c0de2fc0:	f7fe f8c7 	bl	c0de1152 <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>
c0de2fc4:	2000      	movs	r0, #0
c0de2fc6:	5c29      	ldrb	r1, [r5, r0]
c0de2fc8:	3001      	adds	r0, #1
c0de2fca:	428c      	cmp	r4, r1
c0de2fcc:	d3f3      	bcc.n	c0de2fb6 <pqcrystals_dilithium2_lowram_poly_challenge+0x6c>
c0de2fce:	f858 2021 	ldr.w	r2, [r8, r1, lsl #2]
c0de2fd2:	ea5f 0a5a 	movs.w	sl, sl, lsr #1
c0de2fd6:	f848 2024 	str.w	r2, [r8, r4, lsl #2]
c0de2fda:	ea0b 0247 	and.w	r2, fp, r7, lsl #1
c0de2fde:	ea4f 0737 	mov.w	r7, r7, rrx
c0de2fe2:	3401      	adds	r4, #1
c0de2fe4:	f1c2 0201 	rsb	r2, r2, #1
c0de2fe8:	f848 2021 	str.w	r2, [r8, r1, lsl #2]
c0de2fec:	e7e0      	b.n	c0de2fb0 <pqcrystals_dilithium2_lowram_poly_challenge+0x66>
c0de2fee:	b056      	add	sp, #344	@ 0x158
c0de2ff0:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de2ff4 <pqcrystals_dilithium2_lowram_polyeta_pack>:
c0de2ff4:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2ff8:	3001      	adds	r0, #1
c0de2ffa:	2200      	movs	r2, #0
c0de2ffc:	2640      	movs	r6, #64	@ 0x40
c0de2ffe:	f5b2 6f80 	cmp.w	r2, #1024	@ 0x400
c0de3002:	bf08      	it	eq
c0de3004:	e8bd 8df0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de3008:	188b      	adds	r3, r1, r2
c0de300a:	f851 8002 	ldr.w	r8, [r1, r2]
c0de300e:	2710      	movs	r7, #16
c0de3010:	3220      	adds	r2, #32
c0de3012:	f103 0b04 	add.w	fp, r3, #4
c0de3016:	f103 0e10 	add.w	lr, r3, #16
c0de301a:	69db      	ldr	r3, [r3, #28]
c0de301c:	e89b 0830 	ldmia.w	fp, {r4, r5, fp}
c0de3020:	e89e 5400 	ldmia.w	lr, {sl, ip, lr}
c0de3024:	f1c5 0502 	rsb	r5, r5, #2
c0de3028:	eba6 1343 	sub.w	r3, r6, r3, lsl #5
c0de302c:	eba7 04c4 	sub.w	r4, r7, r4, lsl #3
c0de3030:	f1c8 0702 	rsb	r7, r8, #2
c0de3034:	b2ed      	uxtb	r5, r5
c0de3036:	433c      	orrs	r4, r7
c0de3038:	f1cc 0702 	rsb	r7, ip, #2
c0de303c:	ea44 1485 	orr.w	r4, r4, r5, lsl #6
c0de3040:	b2ff      	uxtb	r7, r7
c0de3042:	f800 4c01 	strb.w	r4, [r0, #-1]
c0de3046:	2408      	movs	r4, #8
c0de3048:	eba4 048e 	sub.w	r4, r4, lr, lsl #2
c0de304c:	ea44 0457 	orr.w	r4, r4, r7, lsr #1
c0de3050:	4323      	orrs	r3, r4
c0de3052:	2420      	movs	r4, #32
c0de3054:	7043      	strb	r3, [r0, #1]
c0de3056:	2304      	movs	r3, #4
c0de3058:	eba4 140a 	sub.w	r4, r4, sl, lsl #4
c0de305c:	eba3 034b 	sub.w	r3, r3, fp, lsl #1
c0de3060:	ea43 0395 	orr.w	r3, r3, r5, lsr #2
c0de3064:	4323      	orrs	r3, r4
c0de3066:	ea43 13c7 	orr.w	r3, r3, r7, lsl #7
c0de306a:	f800 3b03 	strb.w	r3, [r0], #3
c0de306e:	e7c6      	b.n	c0de2ffe <pqcrystals_dilithium2_lowram_polyeta_pack+0xa>

c0de3070 <pqcrystals_dilithium2_lowram_polyt1_pack>:
c0de3070:	b5b0      	push	{r4, r5, r7, lr}
c0de3072:	3108      	adds	r1, #8
c0de3074:	2200      	movs	r2, #0
c0de3076:	f5b2 7fa0 	cmp.w	r2, #320	@ 0x140
c0de307a:	bf08      	it	eq
c0de307c:	bdb0      	popeq	{r4, r5, r7, pc}
c0de307e:	f851 3c08 	ldr.w	r3, [r1, #-8]
c0de3082:	5483      	strb	r3, [r0, r2]
c0de3084:	1883      	adds	r3, r0, r2
c0de3086:	3205      	adds	r2, #5
c0de3088:	e951 4502 	ldrd	r4, r5, [r1, #-8]
c0de308c:	00ad      	lsls	r5, r5, #2
c0de308e:	ea45 2414 	orr.w	r4, r5, r4, lsr #8
c0de3092:	705c      	strb	r4, [r3, #1]
c0de3094:	680d      	ldr	r5, [r1, #0]
c0de3096:	f851 4c04 	ldr.w	r4, [r1, #-4]
c0de309a:	012d      	lsls	r5, r5, #4
c0de309c:	ea45 1494 	orr.w	r4, r5, r4, lsr #6
c0de30a0:	709c      	strb	r4, [r3, #2]
c0de30a2:	e9d1 4500 	ldrd	r4, r5, [r1]
c0de30a6:	01ad      	lsls	r5, r5, #6
c0de30a8:	ea45 1414 	orr.w	r4, r5, r4, lsr #4
c0de30ac:	70dc      	strb	r4, [r3, #3]
c0de30ae:	684c      	ldr	r4, [r1, #4]
c0de30b0:	3110      	adds	r1, #16
c0de30b2:	08a4      	lsrs	r4, r4, #2
c0de30b4:	711c      	strb	r4, [r3, #4]
c0de30b6:	e7de      	b.n	c0de3076 <pqcrystals_dilithium2_lowram_polyt1_pack+0x6>

c0de30b8 <pqcrystals_dilithium2_lowram_polyt0_pack>:
c0de30b8:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de30bc:	311c      	adds	r1, #28
c0de30be:	f04f 0c00 	mov.w	ip, #0
c0de30c2:	9000      	str	r0, [sp, #0]
c0de30c4:	f5bc 7fd0 	cmp.w	ip, #416	@ 0x1a0
c0de30c8:	bf08      	it	eq
c0de30ca:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de30ce:	f851 0c14 	ldr.w	r0, [r1, #-20]
c0de30d2:	e951 a504 	ldrd	sl, r5, [r1, #-16]
c0de30d6:	e951 3807 	ldrd	r3, r8, [r1, #-28]
c0de30da:	e951 e602 	ldrd	lr, r6, [r1, #-8]
c0de30de:	f851 7b20 	ldr.w	r7, [r1], #32
c0de30e2:	9001      	str	r0, [sp, #4]
c0de30e4:	9800      	ldr	r0, [sp, #0]
c0de30e6:	f5c7 5780 	rsb	r7, r7, #4096	@ 0x1000
c0de30ea:	f5c3 5b80 	rsb	fp, r3, #4096	@ 0x1000
c0de30ee:	f5c5 5580 	rsb	r5, r5, #4096	@ 0x1000
c0de30f2:	097b      	lsrs	r3, r7, #5
c0de30f4:	eb00 040c 	add.w	r4, r0, ip
c0de30f8:	f800 b00c 	strb.w	fp, [r0, ip]
c0de30fc:	f10c 0c0d 	add.w	ip, ip, #13
c0de3100:	7323      	strb	r3, [r4, #12]
c0de3102:	f5c6 5380 	rsb	r3, r6, #4096	@ 0x1000
c0de3106:	089e      	lsrs	r6, r3, #2
c0de3108:	72a6      	strb	r6, [r4, #10]
c0de310a:	092e      	lsrs	r6, r5, #4
c0de310c:	71e6      	strb	r6, [r4, #7]
c0de310e:	f5ca 5680 	rsb	r6, sl, #4096	@ 0x1000
c0de3112:	0872      	lsrs	r2, r6, #1
c0de3114:	7162      	strb	r2, [r4, #5]
c0de3116:	f5c8 5280 	rsb	r2, r8, #4096	@ 0x1000
c0de311a:	08d0      	lsrs	r0, r2, #3
c0de311c:	70a0      	strb	r0, [r4, #2]
c0de311e:	00f8      	lsls	r0, r7, #3
c0de3120:	ea40 2093 	orr.w	r0, r0, r3, lsr #10
c0de3124:	019b      	lsls	r3, r3, #6
c0de3126:	72e0      	strb	r0, [r4, #11]
c0de3128:	f5ce 5080 	rsb	r0, lr, #4096	@ 0x1000
c0de312c:	ea43 13d0 	orr.w	r3, r3, r0, lsr #7
c0de3130:	0040      	lsls	r0, r0, #1
c0de3132:	ea40 3015 	orr.w	r0, r0, r5, lsr #12
c0de3136:	7263      	strb	r3, [r4, #9]
c0de3138:	01f3      	lsls	r3, r6, #7
c0de313a:	7220      	strb	r0, [r4, #8]
c0de313c:	0128      	lsls	r0, r5, #4
c0de313e:	ea40 2056 	orr.w	r0, r0, r6, lsr #9
c0de3142:	71a0      	strb	r0, [r4, #6]
c0de3144:	9801      	ldr	r0, [sp, #4]
c0de3146:	f5c0 5080 	rsb	r0, r0, #4096	@ 0x1000
c0de314a:	ea43 1390 	orr.w	r3, r3, r0, lsr #6
c0de314e:	0080      	lsls	r0, r0, #2
c0de3150:	ea40 20d2 	orr.w	r0, r0, r2, lsr #11
c0de3154:	7123      	strb	r3, [r4, #4]
c0de3156:	70e0      	strb	r0, [r4, #3]
c0de3158:	0150      	lsls	r0, r2, #5
c0de315a:	ea40 201b 	orr.w	r0, r0, fp, lsr #8
c0de315e:	7060      	strb	r0, [r4, #1]
c0de3160:	e7b0      	b.n	c0de30c4 <pqcrystals_dilithium2_lowram_polyt0_pack+0xc>

c0de3162 <pqcrystals_dilithium2_lowram_polyz_pack>:
c0de3162:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de3164:	3108      	adds	r1, #8
c0de3166:	f04f 0e00 	mov.w	lr, #0
c0de316a:	f5be 7f10 	cmp.w	lr, #576	@ 0x240
c0de316e:	bf08      	it	eq
c0de3170:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de3172:	e951 3c02 	ldrd	r3, ip, [r1, #-8]
c0de3176:	e8f1 5604 	ldrd	r5, r6, [r1], #16
c0de317a:	eb00 070e 	add.w	r7, r0, lr
c0de317e:	f5c6 3600 	rsb	r6, r6, #131072	@ 0x20000
c0de3182:	f5c3 3300 	rsb	r3, r3, #131072	@ 0x20000
c0de3186:	0ab4      	lsrs	r4, r6, #10
c0de3188:	f800 300e 	strb.w	r3, [r0, lr]
c0de318c:	f10e 0e09 	add.w	lr, lr, #9
c0de3190:	723c      	strb	r4, [r7, #8]
c0de3192:	08b4      	lsrs	r4, r6, #2
c0de3194:	71fc      	strb	r4, [r7, #7]
c0de3196:	f5c5 3400 	rsb	r4, r5, #131072	@ 0x20000
c0de319a:	0925      	lsrs	r5, r4, #4
c0de319c:	717d      	strb	r5, [r7, #5]
c0de319e:	f5cc 3500 	rsb	r5, ip, #131072	@ 0x20000
c0de31a2:	09aa      	lsrs	r2, r5, #6
c0de31a4:	70fa      	strb	r2, [r7, #3]
c0de31a6:	0a1a      	lsrs	r2, r3, #8
c0de31a8:	707a      	strb	r2, [r7, #1]
c0de31aa:	01b2      	lsls	r2, r6, #6
c0de31ac:	ea42 3214 	orr.w	r2, r2, r4, lsr #12
c0de31b0:	71ba      	strb	r2, [r7, #6]
c0de31b2:	0122      	lsls	r2, r4, #4
c0de31b4:	ea42 3295 	orr.w	r2, r2, r5, lsr #14
c0de31b8:	713a      	strb	r2, [r7, #4]
c0de31ba:	00aa      	lsls	r2, r5, #2
c0de31bc:	ea42 4213 	orr.w	r2, r2, r3, lsr #16
c0de31c0:	70ba      	strb	r2, [r7, #2]
c0de31c2:	e7d2      	b.n	c0de316a <pqcrystals_dilithium2_lowram_polyz_pack+0x8>

c0de31c4 <pqcrystals_dilithium2_lowram_polyw1_pack>:
c0de31c4:	b5b0      	push	{r4, r5, r7, lr}
c0de31c6:	3001      	adds	r0, #1
c0de31c8:	2200      	movs	r2, #0
c0de31ca:	f5b2 6f80 	cmp.w	r2, #1024	@ 0x400
c0de31ce:	bf08      	it	eq
c0de31d0:	bdb0      	popeq	{r4, r5, r7, pc}
c0de31d2:	588b      	ldr	r3, [r1, r2]
c0de31d4:	188c      	adds	r4, r1, r2
c0de31d6:	3210      	adds	r2, #16
c0de31d8:	f800 3c01 	strb.w	r3, [r0, #-1]
c0de31dc:	6865      	ldr	r5, [r4, #4]
c0de31de:	ea43 1385 	orr.w	r3, r3, r5, lsl #6
c0de31e2:	f800 3c01 	strb.w	r3, [r0, #-1]
c0de31e6:	6863      	ldr	r3, [r4, #4]
c0de31e8:	089d      	lsrs	r5, r3, #2
c0de31ea:	7005      	strb	r5, [r0, #0]
c0de31ec:	68a5      	ldr	r5, [r4, #8]
c0de31ee:	012d      	lsls	r5, r5, #4
c0de31f0:	ea45 0393 	orr.w	r3, r5, r3, lsr #2
c0de31f4:	7003      	strb	r3, [r0, #0]
c0de31f6:	68a3      	ldr	r3, [r4, #8]
c0de31f8:	091d      	lsrs	r5, r3, #4
c0de31fa:	7045      	strb	r5, [r0, #1]
c0de31fc:	68e4      	ldr	r4, [r4, #12]
c0de31fe:	00a4      	lsls	r4, r4, #2
c0de3200:	ea44 1313 	orr.w	r3, r4, r3, lsr #4
c0de3204:	7043      	strb	r3, [r0, #1]
c0de3206:	3003      	adds	r0, #3
c0de3208:	e7df      	b.n	c0de31ca <pqcrystals_dilithium2_lowram_polyw1_pack+0x6>

c0de320a <OUTLINED_FUNCTION_0>:
c0de320a:	4614      	mov	r4, r2
c0de320c:	460d      	mov	r5, r1
c0de320e:	4606      	mov	r6, r0
c0de3210:	2700      	movs	r7, #0
c0de3212:	4770      	bx	lr

c0de3214 <OUTLINED_FUNCTION_1>:
c0de3214:	f814 0b01 	ldrb.w	r0, [r4], #1
c0de3218:	2100      	movs	r1, #0
c0de321a:	4632      	mov	r2, r6
c0de321c:	f008 bfba 	b.w	c0dec194 <__aeabi_llsl>

c0de3220 <randombytes>:
c0de3220:	f008 bc7b 	b.w	c0debb1a <cx_rng_no_throw>

c0de3224 <pqcrystals_dilithium2_lowram_montgomery_reduce>:
c0de3224:	4a03      	ldr	r2, [pc, #12]	@ (c0de3234 <pqcrystals_dilithium2_lowram_montgomery_reduce+0x10>)
c0de3226:	4b04      	ldr	r3, [pc, #16]	@ (c0de3238 <pqcrystals_dilithium2_lowram_montgomery_reduce+0x14>)
c0de3228:	4342      	muls	r2, r0
c0de322a:	fbc2 0103 	smlal	r0, r1, r2, r3
c0de322e:	4608      	mov	r0, r1
c0de3230:	4770      	bx	lr
c0de3232:	bf00      	nop
c0de3234:	03802001 	.word	0x03802001
c0de3238:	ff801fff 	.word	0xff801fff

c0de323c <pqcrystals_dilithium2_lowram_reduce32>:
c0de323c:	f500 0180 	add.w	r1, r0, #4194304	@ 0x400000
c0de3240:	4a02      	ldr	r2, [pc, #8]	@ (c0de324c <pqcrystals_dilithium2_lowram_reduce32+0x10>)
c0de3242:	15c9      	asrs	r1, r1, #23
c0de3244:	fb01 0002 	mla	r0, r1, r2, r0
c0de3248:	4770      	bx	lr
c0de324a:	bf00      	nop
c0de324c:	ff801fff 	.word	0xff801fff

c0de3250 <pqcrystals_dilithium2_lowram_caddq>:
c0de3250:	4902      	ldr	r1, [pc, #8]	@ (c0de325c <pqcrystals_dilithium2_lowram_caddq+0xc>)
c0de3252:	2800      	cmp	r0, #0
c0de3254:	bf48      	it	mi
c0de3256:	4408      	addmi	r0, r1
c0de3258:	4770      	bx	lr
c0de325a:	bf00      	nop
c0de325c:	007fe001 	.word	0x007fe001

c0de3260 <pqcrystals_dilithium2_lowram_freeze>:
c0de3260:	f500 0180 	add.w	r1, r0, #4194304	@ 0x400000
c0de3264:	4a04      	ldr	r2, [pc, #16]	@ (c0de3278 <pqcrystals_dilithium2_lowram_freeze+0x18>)
c0de3266:	15c9      	asrs	r1, r1, #23
c0de3268:	fb01 0002 	mla	r0, r1, r2, r0
c0de326c:	4903      	ldr	r1, [pc, #12]	@ (c0de327c <pqcrystals_dilithium2_lowram_freeze+0x1c>)
c0de326e:	2800      	cmp	r0, #0
c0de3270:	bf48      	it	mi
c0de3272:	4408      	addmi	r0, r1
c0de3274:	4770      	bx	lr
c0de3276:	bf00      	nop
c0de3278:	ff801fff 	.word	0xff801fff
c0de327c:	007fe001 	.word	0x007fe001

c0de3280 <pqcrystals_dilithium2_lowram_power2round>:
c0de3280:	f601 72ff 	addw	r2, r1, #4095	@ 0xfff
c0de3284:	f641 73ff 	movw	r3, #8191	@ 0x1fff
c0de3288:	ea22 0303 	bic.w	r3, r2, r3
c0de328c:	1ac9      	subs	r1, r1, r3
c0de328e:	6001      	str	r1, [r0, #0]
c0de3290:	1350      	asrs	r0, r2, #13
c0de3292:	4770      	bx	lr

c0de3294 <pqcrystals_dilithium2_lowram_decompose>:
c0de3294:	b510      	push	{r4, lr}
c0de3296:	f101 027f 	add.w	r2, r1, #127	@ 0x7f
c0de329a:	f642 430b 	movw	r3, #11275	@ 0x2c0b
c0de329e:	4c0c      	ldr	r4, [pc, #48]	@ (c0de32d0 <pqcrystals_dilithium2_lowram_decompose+0x3c>)
c0de32a0:	11d2      	asrs	r2, r2, #7
c0de32a2:	4353      	muls	r3, r2
c0de32a4:	f503 0200 	add.w	r2, r3, #8388608	@ 0x800000
c0de32a8:	1612      	asrs	r2, r2, #24
c0de32aa:	f1b3 5f2e 	cmp.w	r3, #729808896	@ 0x2b800000
c0de32ae:	4b06      	ldr	r3, [pc, #24]	@ (c0de32c8 <pqcrystals_dilithium2_lowram_decompose+0x34>)
c0de32b0:	bfa8      	it	ge
c0de32b2:	2200      	movge	r2, #0
c0de32b4:	fb02 1103 	mla	r1, r2, r3, r1
c0de32b8:	4b04      	ldr	r3, [pc, #16]	@ (c0de32cc <pqcrystals_dilithium2_lowram_decompose+0x38>)
c0de32ba:	42a1      	cmp	r1, r4
c0de32bc:	bfc8      	it	gt
c0de32be:	4419      	addgt	r1, r3
c0de32c0:	6001      	str	r1, [r0, #0]
c0de32c2:	4610      	mov	r0, r2
c0de32c4:	bd10      	pop	{r4, pc}
c0de32c6:	bf00      	nop
c0de32c8:	fffd1800 	.word	0xfffd1800
c0de32cc:	ff801fff 	.word	0xff801fff
c0de32d0:	003ff000 	.word	0x003ff000

c0de32d4 <pqcrystals_dilithium2_lowram_use_hint>:
c0de32d4:	b51c      	push	{r2, r3, r4, lr}
c0de32d6:	460c      	mov	r4, r1
c0de32d8:	4601      	mov	r1, r0
c0de32da:	a801      	add	r0, sp, #4
c0de32dc:	f7ff ffda 	bl	c0de3294 <pqcrystals_dilithium2_lowram_decompose>
c0de32e0:	b164      	cbz	r4, c0de32fc <pqcrystals_dilithium2_lowram_use_hint+0x28>
c0de32e2:	9901      	ldr	r1, [sp, #4]
c0de32e4:	2901      	cmp	r1, #1
c0de32e6:	db04      	blt.n	c0de32f2 <pqcrystals_dilithium2_lowram_use_hint+0x1e>
c0de32e8:	f1b0 012b 	subs.w	r1, r0, #43	@ 0x2b
c0de32ec:	bf18      	it	ne
c0de32ee:	1c41      	addne	r1, r0, #1
c0de32f0:	e003      	b.n	c0de32fa <pqcrystals_dilithium2_lowram_use_hint+0x26>
c0de32f2:	1e41      	subs	r1, r0, #1
c0de32f4:	2800      	cmp	r0, #0
c0de32f6:	bf08      	it	eq
c0de32f8:	212b      	moveq	r1, #43	@ 0x2b
c0de32fa:	4608      	mov	r0, r1
c0de32fc:	bd1c      	pop	{r2, r3, r4, pc}

c0de32fe <pqcrystals_dilithium2_lowram_keypair>:
c0de32fe:	b570      	push	{r4, r5, r6, lr}
c0de3300:	b088      	sub	sp, #32
c0de3302:	466e      	mov	r6, sp
c0de3304:	460c      	mov	r4, r1
c0de3306:	4605      	mov	r5, r0
c0de3308:	2120      	movs	r1, #32
c0de330a:	4630      	mov	r0, r6
c0de330c:	f7ff ff88 	bl	c0de3220 <randombytes>
c0de3310:	4628      	mov	r0, r5
c0de3312:	4621      	mov	r1, r4
c0de3314:	4632      	mov	r2, r6
c0de3316:	f000 f803 	bl	c0de3320 <crypto_sign_keypair_core>
c0de331a:	2000      	movs	r0, #0
c0de331c:	b008      	add	sp, #32
c0de331e:	bd70      	pop	{r4, r5, r6, pc}

c0de3320 <crypto_sign_keypair_core>:
c0de3320:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3324:	f6ad 4d88 	subw	sp, sp, #3208	@ 0xc88
c0de3328:	f60d 4608 	addw	r6, sp, #3080	@ 0xc08
c0de332c:	460c      	mov	r4, r1
c0de332e:	4605      	mov	r5, r0
c0de3330:	4611      	mov	r1, r2
c0de3332:	2220      	movs	r2, #32
c0de3334:	4630      	mov	r0, r6
c0de3336:	f009 f835 	bl	c0dec3a4 <__aeabi_memcpy>
c0de333a:	f240 4004 	movw	r0, #1028	@ 0x404
c0de333e:	f8ad 0c28 	strh.w	r0, [sp, #3112]	@ 0xc28
c0de3342:	af02      	add	r7, sp, #8
c0de3344:	4638      	mov	r0, r7
c0de3346:	f7fd fecd 	bl	c0de10e4 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de334a:	4638      	mov	r0, r7
c0de334c:	4631      	mov	r1, r6
c0de334e:	2222      	movs	r2, #34	@ 0x22
c0de3350:	f7fd fed0 	bl	c0de10f4 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de3354:	4638      	mov	r0, r7
c0de3356:	f7fd fed8 	bl	c0de110a <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de335a:	4630      	mov	r0, r6
c0de335c:	2180      	movs	r1, #128	@ 0x80
c0de335e:	463a      	mov	r2, r7
c0de3360:	f7fd fede 	bl	c0de1120 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de3364:	4620      	mov	r0, r4
c0de3366:	4631      	mov	r1, r6
c0de3368:	f7ff fb57 	bl	c0de2a1a <pack_sk_rho>
c0de336c:	f106 0160 	add.w	r1, r6, #96	@ 0x60
c0de3370:	4620      	mov	r0, r4
c0de3372:	9401      	str	r4, [sp, #4]
c0de3374:	f7ff fb59 	bl	c0de2a2a <pack_sk_key>
c0de3378:	4628      	mov	r0, r5
c0de337a:	4631      	mov	r1, r6
c0de337c:	9500      	str	r5, [sp, #0]
c0de337e:	f7ff fb26 	bl	c0de29ce <pack_pk_rho>
c0de3382:	f106 0520 	add.w	r5, r6, #32
c0de3386:	f04f 0b00 	mov.w	fp, #0
c0de338a:	f50d 6481 	add.w	r4, sp, #1032	@ 0x408
c0de338e:	f60d 0608 	addw	r6, sp, #2056	@ 0x808
c0de3392:	f04f 0800 	mov.w	r8, #0
c0de3396:	f1b8 0f04 	cmp.w	r8, #4
c0de339a:	d072      	beq.n	c0de3482 <crypto_sign_keypair_core+0x162>
c0de339c:	4638      	mov	r0, r7
c0de339e:	4629      	mov	r1, r5
c0de33a0:	2200      	movs	r2, #0
c0de33a2:	f7ff fd31 	bl	c0de2e08 <pqcrystals_dilithium2_lowram_poly_uniform_eta>
c0de33a6:	f1b8 0f00 	cmp.w	r8, #0
c0de33aa:	d104      	bne.n	c0de33b6 <crypto_sign_keypair_core+0x96>
c0de33ac:	9801      	ldr	r0, [sp, #4]
c0de33ae:	4639      	mov	r1, r7
c0de33b0:	2200      	movs	r2, #0
c0de33b2:	f7ff fb1b 	bl	c0de29ec <pack_sk_s1>
c0de33b6:	4638      	mov	r0, r7
c0de33b8:	f7ff fc87 	bl	c0de2cca <pqcrystals_dilithium2_lowram_poly_ntt>
c0de33bc:	ea4f 2008 	mov.w	r0, r8, lsl #8
c0de33c0:	f60d 4108 	addw	r1, sp, #3080	@ 0xc08
c0de33c4:	b282      	uxth	r2, r0
c0de33c6:	4620      	mov	r0, r4
c0de33c8:	f7ff fcba 	bl	c0de2d40 <pqcrystals_dilithium2_lowram_poly_uniform>
c0de33cc:	4630      	mov	r0, r6
c0de33ce:	4621      	mov	r1, r4
c0de33d0:	463a      	mov	r2, r7
c0de33d2:	f7ff fc7e 	bl	c0de2cd2 <pqcrystals_dilithium2_lowram_poly_pointwise_montgomery>
c0de33d6:	f04f 0a01 	mov.w	sl, #1
c0de33da:	f1ba 0f04 	cmp.w	sl, #4
c0de33de:	d020      	beq.n	c0de3422 <crypto_sign_keypair_core+0x102>
c0de33e0:	fa1f f28a 	uxth.w	r2, sl
c0de33e4:	4638      	mov	r0, r7
c0de33e6:	4629      	mov	r1, r5
c0de33e8:	f7ff fd0e 	bl	c0de2e08 <pqcrystals_dilithium2_lowram_poly_uniform_eta>
c0de33ec:	f1b8 0f00 	cmp.w	r8, #0
c0de33f0:	d104      	bne.n	c0de33fc <crypto_sign_keypair_core+0xdc>
c0de33f2:	9801      	ldr	r0, [sp, #4]
c0de33f4:	4639      	mov	r1, r7
c0de33f6:	4652      	mov	r2, sl
c0de33f8:	f7ff faf8 	bl	c0de29ec <pack_sk_s1>
c0de33fc:	4638      	mov	r0, r7
c0de33fe:	f7ff fc64 	bl	c0de2cca <pqcrystals_dilithium2_lowram_poly_ntt>
c0de3402:	eb0b 000a 	add.w	r0, fp, sl
c0de3406:	f60d 4108 	addw	r1, sp, #3080	@ 0xc08
c0de340a:	b282      	uxth	r2, r0
c0de340c:	4620      	mov	r0, r4
c0de340e:	f7ff fc97 	bl	c0de2d40 <pqcrystals_dilithium2_lowram_poly_uniform>
c0de3412:	4630      	mov	r0, r6
c0de3414:	4621      	mov	r1, r4
c0de3416:	463a      	mov	r2, r7
c0de3418:	f7ff fb72 	bl	c0de2b00 <pqcrystals_dilithium2_lowram_poly_pointwise_acc_montgomery>
c0de341c:	f10a 0a01 	add.w	sl, sl, #1
c0de3420:	e7db      	b.n	c0de33da <crypto_sign_keypair_core+0xba>
c0de3422:	4630      	mov	r0, r6
c0de3424:	f7ff fc24 	bl	c0de2c70 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de3428:	4630      	mov	r0, r6
c0de342a:	f7ff fc50 	bl	c0de2cce <pqcrystals_dilithium2_lowram_poly_invntt_tomont>
c0de342e:	f108 0004 	add.w	r0, r8, #4
c0de3432:	4629      	mov	r1, r5
c0de3434:	b282      	uxth	r2, r0
c0de3436:	4620      	mov	r0, r4
c0de3438:	f7ff fce6 	bl	c0de2e08 <pqcrystals_dilithium2_lowram_poly_uniform_eta>
c0de343c:	f8dd a004 	ldr.w	sl, [sp, #4]
c0de3440:	4621      	mov	r1, r4
c0de3442:	4642      	mov	r2, r8
c0de3444:	4650      	mov	r0, sl
c0de3446:	f7ff fad8 	bl	c0de29fa <pack_sk_s2>
c0de344a:	4630      	mov	r0, r6
c0de344c:	4631      	mov	r1, r6
c0de344e:	4622      	mov	r2, r4
c0de3450:	f7ff fc2c 	bl	c0de2cac <pqcrystals_dilithium2_lowram_poly_add>
c0de3454:	4630      	mov	r0, r6
c0de3456:	f7ff fc1a 	bl	c0de2c8e <pqcrystals_dilithium2_lowram_poly_caddq>
c0de345a:	4638      	mov	r0, r7
c0de345c:	4621      	mov	r1, r4
c0de345e:	4632      	mov	r2, r6
c0de3460:	f7ff fc4a 	bl	c0de2cf8 <pqcrystals_dilithium2_lowram_poly_power2round>
c0de3464:	4650      	mov	r0, sl
c0de3466:	4621      	mov	r1, r4
c0de3468:	4642      	mov	r2, r8
c0de346a:	f7ff face 	bl	c0de2a0a <pack_sk_t0>
c0de346e:	9800      	ldr	r0, [sp, #0]
c0de3470:	4639      	mov	r1, r7
c0de3472:	4642      	mov	r2, r8
c0de3474:	f7ff fab3 	bl	c0de29de <pack_pk_t1>
c0de3478:	f50b 7b80 	add.w	fp, fp, #256	@ 0x100
c0de347c:	f108 0801 	add.w	r8, r8, #1
c0de3480:	e789      	b.n	c0de3396 <crypto_sign_keypair_core+0x76>
c0de3482:	ac02      	add	r4, sp, #8
c0de3484:	9e00      	ldr	r6, [sp, #0]
c0de3486:	2140      	movs	r1, #64	@ 0x40
c0de3488:	f44f 63a4 	mov.w	r3, #1312	@ 0x520
c0de348c:	4620      	mov	r0, r4
c0de348e:	4632      	mov	r2, r6
c0de3490:	f7fd fe62 	bl	c0de1158 <pqcrystals_dilithium_fips202_ref_shake256>
c0de3494:	480c      	ldr	r0, [pc, #48]	@ (c0de34c8 <crypto_sign_keypair_core+0x1a8>)
c0de3496:	4621      	mov	r1, r4
c0de3498:	2240      	movs	r2, #64	@ 0x40
c0de349a:	eb09 0500 	add.w	r5, r9, r0
c0de349e:	f505 7008 	add.w	r0, r5, #544	@ 0x220
c0de34a2:	f008 ff7f 	bl	c0dec3a4 <__aeabi_memcpy>
c0de34a6:	f505 7018 	add.w	r0, r5, #608	@ 0x260
c0de34aa:	4631      	mov	r1, r6
c0de34ac:	f44f 62a4 	mov.w	r2, #1312	@ 0x520
c0de34b0:	f008 ff78 	bl	c0dec3a4 <__aeabi_memcpy>
c0de34b4:	9801      	ldr	r0, [sp, #4]
c0de34b6:	4621      	mov	r1, r4
c0de34b8:	f7ff fac0 	bl	c0de2a3c <pack_sk_tr>
c0de34bc:	2000      	movs	r0, #0
c0de34be:	f60d 4d88 	addw	sp, sp, #3208	@ 0xc88
c0de34c2:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de34c6:	bf00      	nop
c0de34c8:	000002d8 	.word	0x000002d8

c0de34cc <crypto_sign_signature_init>:
c0de34cc:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de34d0:	29ff      	cmp	r1, #255	@ 0xff
c0de34d2:	d902      	bls.n	c0de34da <crypto_sign_signature_init+0xe>
c0de34d4:	f04f 34ff 	mov.w	r4, #4294967295	@ 0xffffffff
c0de34d8:	e01c      	b.n	c0de3514 <crypto_sign_signature_init+0x48>
c0de34da:	4680      	mov	r8, r0
c0de34dc:	480f      	ldr	r0, [pc, #60]	@ (c0de351c <crypto_sign_signature_init+0x50>)
c0de34de:	2400      	movs	r4, #0
c0de34e0:	460d      	mov	r5, r1
c0de34e2:	eb09 0700 	add.w	r7, r9, r0
c0de34e6:	4638      	mov	r0, r7
c0de34e8:	f887 11a1 	strb.w	r1, [r7, #417]	@ 0x1a1
c0de34ec:	f887 41a0 	strb.w	r4, [r7, #416]	@ 0x1a0
c0de34f0:	f7fd fdf8 	bl	c0de10e4 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de34f4:	4e0a      	ldr	r6, [pc, #40]	@ (c0de3520 <crypto_sign_signature_init+0x54>)
c0de34f6:	f507 7108 	add.w	r1, r7, #544	@ 0x220
c0de34fa:	4638      	mov	r0, r7
c0de34fc:	2240      	movs	r2, #64	@ 0x40
c0de34fe:	447e      	add	r6, pc
c0de3500:	47b0      	blx	r6
c0de3502:	f507 71d0 	add.w	r1, r7, #416	@ 0x1a0
c0de3506:	4638      	mov	r0, r7
c0de3508:	2202      	movs	r2, #2
c0de350a:	47b0      	blx	r6
c0de350c:	4638      	mov	r0, r7
c0de350e:	4641      	mov	r1, r8
c0de3510:	462a      	mov	r2, r5
c0de3512:	47b0      	blx	r6
c0de3514:	4620      	mov	r0, r4
c0de3516:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de351a:	bf00      	nop
c0de351c:	000002d8 	.word	0x000002d8
c0de3520:	ffffdbf3 	.word	0xffffdbf3

c0de3524 <crypto_sign_signature_absorb>:
c0de3524:	b580      	push	{r7, lr}
c0de3526:	460a      	mov	r2, r1
c0de3528:	4601      	mov	r1, r0
c0de352a:	4803      	ldr	r0, [pc, #12]	@ (c0de3538 <crypto_sign_signature_absorb+0x14>)
c0de352c:	4448      	add	r0, r9
c0de352e:	f7fd fde1 	bl	c0de10f4 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de3532:	2000      	movs	r0, #0
c0de3534:	bd80      	pop	{r7, pc}
c0de3536:	bf00      	nop
c0de3538:	000002d8 	.word	0x000002d8

c0de353c <crypto_sign_signature_core>:
c0de353c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3540:	f5ad 5d83 	sub.w	sp, sp, #4192	@ 0x1060
c0de3544:	b086      	sub	sp, #24
c0de3546:	f8df 8300 	ldr.w	r8, [pc, #768]	@ c0de3848 <crypto_sign_signature_core+0x30c>
c0de354a:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de354c:	4616      	mov	r6, r2
c0de354e:	9102      	str	r1, [sp, #8]
c0de3550:	eb09 0408 	add.w	r4, r9, r8
c0de3554:	4620      	mov	r0, r4
c0de3556:	f7fd fdd8 	bl	c0de110a <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de355a:	f504 70d0 	add.w	r0, r4, #416	@ 0x1a0
c0de355e:	2140      	movs	r1, #64	@ 0x40
c0de3560:	4622      	mov	r2, r4
c0de3562:	f7fd fddd 	bl	c0de1120 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de3566:	a80d      	add	r0, sp, #52	@ 0x34
c0de3568:	2100      	movs	r1, #0
c0de356a:	f500 7000 	add.w	r0, r0, #512	@ 0x200
c0de356e:	9009      	str	r0, [sp, #36]	@ 0x24
c0de3570:	2000      	movs	r0, #0
c0de3572:	2920      	cmp	r1, #32
c0de3574:	d006      	beq.n	c0de3584 <crypto_sign_signature_core+0x48>
c0de3576:	eb09 0208 	add.w	r2, r9, r8
c0de357a:	440a      	add	r2, r1
c0de357c:	3101      	adds	r1, #1
c0de357e:	f882 01e0 	strb.w	r0, [r2, #480]	@ 0x1e0
c0de3582:	e7f6      	b.n	c0de3572 <crypto_sign_signature_core+0x36>
c0de3584:	eb09 0408 	add.w	r4, r9, r8
c0de3588:	4620      	mov	r0, r4
c0de358a:	f7fd fdab 	bl	c0de10e4 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de358e:	4fb0      	ldr	r7, [pc, #704]	@ (c0de3850 <crypto_sign_signature_core+0x314>)
c0de3590:	f106 0120 	add.w	r1, r6, #32
c0de3594:	4620      	mov	r0, r4
c0de3596:	2220      	movs	r2, #32
c0de3598:	447f      	add	r7, pc
c0de359a:	47b8      	blx	r7
c0de359c:	f504 75f0 	add.w	r5, r4, #480	@ 0x1e0
c0de35a0:	4620      	mov	r0, r4
c0de35a2:	2220      	movs	r2, #32
c0de35a4:	4629      	mov	r1, r5
c0de35a6:	47b8      	blx	r7
c0de35a8:	f504 71d0 	add.w	r1, r4, #416	@ 0x1a0
c0de35ac:	4620      	mov	r0, r4
c0de35ae:	2240      	movs	r2, #64	@ 0x40
c0de35b0:	47b8      	blx	r7
c0de35b2:	4620      	mov	r0, r4
c0de35b4:	f7fd fda9 	bl	c0de110a <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de35b8:	4628      	mov	r0, r5
c0de35ba:	2140      	movs	r1, #64	@ 0x40
c0de35bc:	4622      	mov	r2, r4
c0de35be:	f7fd fdaf 	bl	c0de1120 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de35c2:	f506 7060 	add.w	r0, r6, #896	@ 0x380
c0de35c6:	2100      	movs	r1, #0
c0de35c8:	f04f 0b00 	mov.w	fp, #0
c0de35cc:	9003      	str	r0, [sp, #12]
c0de35ce:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de35d0:	3020      	adds	r0, #32
c0de35d2:	9004      	str	r0, [sp, #16]
c0de35d4:	ac0d      	add	r4, sp, #52	@ 0x34
c0de35d6:	2001      	movs	r0, #1
c0de35d8:	9106      	str	r1, [sp, #24]
c0de35da:	9005      	str	r0, [sp, #20]
c0de35dc:	b280      	uxth	r0, r0
c0de35de:	f64f 71fc 	movw	r1, #65532	@ 0xfffc
c0de35e2:	eb01 0080 	add.w	r0, r1, r0, lsl #2
c0de35e6:	f50d 618f 	add.w	r1, sp, #1144	@ 0x478
c0de35ea:	9008      	str	r0, [sp, #32]
c0de35ec:	2000      	movs	r0, #0
c0de35ee:	2804      	cmp	r0, #4
c0de35f0:	d00b      	beq.n	c0de360a <crypto_sign_signature_core+0xce>
c0de35f2:	2200      	movs	r2, #0
c0de35f4:	f5b2 7f40 	cmp.w	r2, #768	@ 0x300
c0de35f8:	d003      	beq.n	c0de3602 <crypto_sign_signature_core+0xc6>
c0de35fa:	f801 b002 	strb.w	fp, [r1, r2]
c0de35fe:	3201      	adds	r2, #1
c0de3600:	e7f8      	b.n	c0de35f4 <crypto_sign_signature_core+0xb8>
c0de3602:	f501 7140 	add.w	r1, r1, #768	@ 0x300
c0de3606:	3001      	adds	r0, #1
c0de3608:	e7f1      	b.n	c0de35ee <crypto_sign_signature_core+0xb2>
c0de360a:	9806      	ldr	r0, [sp, #24]
c0de360c:	f04f 0a00 	mov.w	sl, #0
c0de3610:	b280      	uxth	r0, r0
c0de3612:	0080      	lsls	r0, r0, #2
c0de3614:	900a      	str	r0, [sp, #40]	@ 0x28
c0de3616:	f1ba 0f04 	cmp.w	sl, #4
c0de361a:	d026      	beq.n	c0de366a <crypto_sign_signature_core+0x12e>
c0de361c:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de361e:	eb09 0308 	add.w	r3, r9, r8
c0de3622:	f503 71f0 	add.w	r1, r3, #480	@ 0x1e0
c0de3626:	4450      	add	r0, sl
c0de3628:	b282      	uxth	r2, r0
c0de362a:	4620      	mov	r0, r4
c0de362c:	f7ff f8c7 	bl	c0de27be <poly_uniform_gamma1_lowram>
c0de3630:	4620      	mov	r0, r4
c0de3632:	f7ff fb4a 	bl	c0de2cca <pqcrystals_dilithium2_lowram_poly_ntt>
c0de3636:	2700      	movs	r7, #0
c0de3638:	f50d 658f 	add.w	r5, sp, #1144	@ 0x478
c0de363c:	f5b7 6f80 	cmp.w	r7, #1024	@ 0x400
c0de3640:	d010      	beq.n	c0de3664 <crypto_sign_signature_core+0x128>
c0de3642:	eb09 0008 	add.w	r0, r9, r8
c0de3646:	4621      	mov	r1, r4
c0de3648:	4632      	mov	r2, r6
c0de364a:	30d0      	adds	r0, #208	@ 0xd0
c0de364c:	9000      	str	r0, [sp, #0]
c0de364e:	eb0a 0007 	add.w	r0, sl, r7
c0de3652:	b283      	uxth	r3, r0
c0de3654:	4628      	mov	r0, r5
c0de3656:	f7ff f86f 	bl	c0de2738 <poly_uniform_pointwise_montgomery_polywadd_lowram>
c0de365a:	f505 7540 	add.w	r5, r5, #768	@ 0x300
c0de365e:	f507 7780 	add.w	r7, r7, #256	@ 0x100
c0de3662:	e7eb      	b.n	c0de363c <crypto_sign_signature_core+0x100>
c0de3664:	f10a 0a01 	add.w	sl, sl, #1
c0de3668:	e7d5      	b.n	c0de3616 <crypto_sign_signature_core+0xda>
c0de366a:	2700      	movs	r7, #0
c0de366c:	f50d 658f 	add.w	r5, sp, #1144	@ 0x478
c0de3670:	f5b7 7f40 	cmp.w	r7, #768	@ 0x300
c0de3674:	d01a      	beq.n	c0de36ac <crypto_sign_signature_core+0x170>
c0de3676:	4620      	mov	r0, r4
c0de3678:	4629      	mov	r1, r5
c0de367a:	f7fe ffd4 	bl	c0de2626 <polyw_unpack>
c0de367e:	4620      	mov	r0, r4
c0de3680:	f7ff fb25 	bl	c0de2cce <pqcrystals_dilithium2_lowram_poly_invntt_tomont>
c0de3684:	4620      	mov	r0, r4
c0de3686:	f7ff fb02 	bl	c0de2c8e <pqcrystals_dilithium2_lowram_poly_caddq>
c0de368a:	4628      	mov	r0, r5
c0de368c:	4621      	mov	r1, r4
c0de368e:	f7fe ffac 	bl	c0de25ea <polyw_pack>
c0de3692:	4620      	mov	r0, r4
c0de3694:	4621      	mov	r1, r4
c0de3696:	f7fe fff6 	bl	c0de2686 <poly_highbits>
c0de369a:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de369c:	4621      	mov	r1, r4
c0de369e:	4438      	add	r0, r7
c0de36a0:	f7ff fd90 	bl	c0de31c4 <pqcrystals_dilithium2_lowram_polyw1_pack>
c0de36a4:	f505 7540 	add.w	r5, r5, #768	@ 0x300
c0de36a8:	37c0      	adds	r7, #192	@ 0xc0
c0de36aa:	e7e1      	b.n	c0de3670 <crypto_sign_signature_core+0x134>
c0de36ac:	eb09 0508 	add.w	r5, r9, r8
c0de36b0:	4628      	mov	r0, r5
c0de36b2:	f7fd fd17 	bl	c0de10e4 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de36b6:	f505 71d0 	add.w	r1, r5, #416	@ 0x1a0
c0de36ba:	4628      	mov	r0, r5
c0de36bc:	2240      	movs	r2, #64	@ 0x40
c0de36be:	f7fd fd19 	bl	c0de10f4 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de36c2:	9f0b      	ldr	r7, [sp, #44]	@ 0x2c
c0de36c4:	4628      	mov	r0, r5
c0de36c6:	f44f 7240 	mov.w	r2, #768	@ 0x300
c0de36ca:	4639      	mov	r1, r7
c0de36cc:	f7fd fd12 	bl	c0de10f4 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de36d0:	4628      	mov	r0, r5
c0de36d2:	f7fd fd1a 	bl	c0de110a <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de36d6:	4638      	mov	r0, r7
c0de36d8:	2120      	movs	r1, #32
c0de36da:	462a      	mov	r2, r5
c0de36dc:	f7fd fd20 	bl	c0de1120 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de36e0:	4620      	mov	r0, r4
c0de36e2:	4639      	mov	r1, r7
c0de36e4:	f7ff fc31 	bl	c0de2f4a <pqcrystals_dilithium2_lowram_poly_challenge>
c0de36e8:	f20d 4034 	addw	r0, sp, #1076	@ 0x434
c0de36ec:	4621      	mov	r1, r4
c0de36ee:	f7fe fda9 	bl	c0de2244 <poly_challenge_compress>
c0de36f2:	9806      	ldr	r0, [sp, #24]
c0de36f4:	f8dd a010 	ldr.w	sl, [sp, #16]
c0de36f8:	2500      	movs	r5, #0
c0de36fa:	3001      	adds	r0, #1
c0de36fc:	9006      	str	r0, [sp, #24]
c0de36fe:	b135      	cbz	r5, c0de370e <crypto_sign_signature_core+0x1d2>
c0de3700:	2d04      	cmp	r5, #4
c0de3702:	d032      	beq.n	c0de376a <crypto_sign_signature_core+0x22e>
c0de3704:	4620      	mov	r0, r4
c0de3706:	f20d 4134 	addw	r1, sp, #1076	@ 0x434
c0de370a:	f7fe fdd0 	bl	c0de22ae <poly_challenge_decompress>
c0de370e:	f000 f9e7 	bl	c0de3ae0 <OUTLINED_FUNCTION_0>
c0de3712:	4620      	mov	r0, r4
c0de3714:	4631      	mov	r1, r6
c0de3716:	462a      	mov	r2, r5
c0de3718:	f7fe fffe 	bl	c0de2718 <unpack_sk_s1>
c0de371c:	4620      	mov	r0, r4
c0de371e:	f000 f9e5 	bl	c0de3aec <small_ntt>
c0de3722:	4620      	mov	r0, r4
c0de3724:	4639      	mov	r1, r7
c0de3726:	4622      	mov	r2, r4
c0de3728:	f000 fb04 	bl	c0de3d34 <poly_small_basemul_invntt>
c0de372c:	eb09 0008 	add.w	r0, r9, r8
c0de3730:	4621      	mov	r1, r4
c0de3732:	9000      	str	r0, [sp, #0]
c0de3734:	f500 72f0 	add.w	r2, r0, #480	@ 0x1e0
c0de3738:	9808      	ldr	r0, [sp, #32]
c0de373a:	4428      	add	r0, r5
c0de373c:	b283      	uxth	r3, r0
c0de373e:	4620      	mov	r0, r4
c0de3740:	f7ff f88a 	bl	c0de2858 <poly_uniform_gamma1_add_lowram>
c0de3744:	4620      	mov	r0, r4
c0de3746:	f7ff fa93 	bl	c0de2c70 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de374a:	4840      	ldr	r0, [pc, #256]	@ (c0de384c <crypto_sign_signature_core+0x310>)
c0de374c:	f500 410c 	add.w	r1, r0, #35840	@ 0x8c00
c0de3750:	4620      	mov	r0, r4
c0de3752:	f7ff fadf 	bl	c0de2d14 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de3756:	2800      	cmp	r0, #0
c0de3758:	d165      	bne.n	c0de3826 <crypto_sign_signature_core+0x2ea>
c0de375a:	4650      	mov	r0, sl
c0de375c:	4621      	mov	r1, r4
c0de375e:	f7ff fd00 	bl	c0de3162 <pqcrystals_dilithium2_lowram_polyz_pack>
c0de3762:	f50a 7a10 	add.w	sl, sl, #576	@ 0x240
c0de3766:	3501      	adds	r5, #1
c0de3768:	e7c9      	b.n	c0de36fe <crypto_sign_signature_core+0x1c2>
c0de376a:	f8dd a00c 	ldr.w	sl, [sp, #12]
c0de376e:	2100      	movs	r1, #0
c0de3770:	2000      	movs	r0, #0
c0de3772:	f50d 658f 	add.w	r5, sp, #1144	@ 0x478
c0de3776:	2700      	movs	r7, #0
c0de3778:	9008      	str	r0, [sp, #32]
c0de377a:	910c      	str	r1, [sp, #48]	@ 0x30
c0de377c:	2f04      	cmp	r7, #4
c0de377e:	d055      	beq.n	c0de382c <crypto_sign_signature_core+0x2f0>
c0de3780:	4620      	mov	r0, r4
c0de3782:	f20d 4134 	addw	r1, sp, #1076	@ 0x434
c0de3786:	f7fe fd92 	bl	c0de22ae <poly_challenge_decompress>
c0de378a:	950a      	str	r5, [sp, #40]	@ 0x28
c0de378c:	463d      	mov	r5, r7
c0de378e:	f000 f9a7 	bl	c0de3ae0 <OUTLINED_FUNCTION_0>
c0de3792:	4620      	mov	r0, r4
c0de3794:	4631      	mov	r1, r6
c0de3796:	462a      	mov	r2, r5
c0de3798:	9507      	str	r5, [sp, #28]
c0de379a:	f7fe ffc4 	bl	c0de2726 <unpack_sk_s2>
c0de379e:	4620      	mov	r0, r4
c0de37a0:	f000 f9a4 	bl	c0de3aec <small_ntt>
c0de37a4:	4620      	mov	r0, r4
c0de37a6:	4639      	mov	r1, r7
c0de37a8:	9d0a      	ldr	r5, [sp, #40]	@ 0x28
c0de37aa:	4622      	mov	r2, r4
c0de37ac:	f000 fac2 	bl	c0de3d34 <poly_small_basemul_invntt>
c0de37b0:	4620      	mov	r0, r4
c0de37b2:	4629      	mov	r1, r5
c0de37b4:	4622      	mov	r2, r4
c0de37b6:	f7fe ff4e 	bl	c0de2656 <polyw_sub>
c0de37ba:	4620      	mov	r0, r4
c0de37bc:	f7ff fa58 	bl	c0de2c70 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de37c0:	4628      	mov	r0, r5
c0de37c2:	4621      	mov	r1, r4
c0de37c4:	f7fe ff11 	bl	c0de25ea <polyw_pack>
c0de37c8:	4620      	mov	r0, r4
c0de37ca:	4621      	mov	r1, r4
c0de37cc:	f7fe ff74 	bl	c0de26b8 <poly_lowbits>
c0de37d0:	4620      	mov	r0, r4
c0de37d2:	f7ff fa4d 	bl	c0de2c70 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de37d6:	491d      	ldr	r1, [pc, #116]	@ (c0de384c <crypto_sign_signature_core+0x310>)
c0de37d8:	4620      	mov	r0, r4
c0de37da:	f7ff fa9b 	bl	c0de2d14 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de37de:	bb10      	cbnz	r0, c0de3826 <crypto_sign_signature_core+0x2ea>
c0de37e0:	4620      	mov	r0, r4
c0de37e2:	f20d 4134 	addw	r1, sp, #1076	@ 0x434
c0de37e6:	4652      	mov	r2, sl
c0de37e8:	f7fe fd93 	bl	c0de2312 <poly_schoolbook>
c0de37ec:	4620      	mov	r0, r4
c0de37ee:	f44f 31ba 	mov.w	r1, #95232	@ 0x17400
c0de37f2:	f7ff fa8f 	bl	c0de2d14 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de37f6:	b9b0      	cbnz	r0, c0de3826 <crypto_sign_signature_core+0x2ea>
c0de37f8:	4620      	mov	r0, r4
c0de37fa:	4621      	mov	r1, r4
c0de37fc:	462a      	mov	r2, r5
c0de37fe:	f7ff f84f 	bl	c0de28a0 <poly_make_hint_lowram>
c0de3802:	9908      	ldr	r1, [sp, #32]
c0de3804:	4401      	add	r1, r0
c0de3806:	2950      	cmp	r1, #80	@ 0x50
c0de3808:	9108      	str	r1, [sp, #32]
c0de380a:	d80c      	bhi.n	c0de3826 <crypto_sign_signature_core+0x2ea>
c0de380c:	9f07      	ldr	r7, [sp, #28]
c0de380e:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de3810:	4621      	mov	r1, r4
c0de3812:	ab0c      	add	r3, sp, #48	@ 0x30
c0de3814:	463a      	mov	r2, r7
c0de3816:	f7fe fcf3 	bl	c0de2200 <pqcrystals_dilithium2_lowram_pack_sig_h>
c0de381a:	f50a 7ad0 	add.w	sl, sl, #416	@ 0x1a0
c0de381e:	f505 7540 	add.w	r5, r5, #768	@ 0x300
c0de3822:	3701      	adds	r7, #1
c0de3824:	e7aa      	b.n	c0de377c <crypto_sign_signature_core+0x240>
c0de3826:	9805      	ldr	r0, [sp, #20]
c0de3828:	3001      	adds	r0, #1
c0de382a:	e6d6      	b.n	c0de35da <crypto_sign_signature_core+0x9e>
c0de382c:	a90c      	add	r1, sp, #48	@ 0x30
c0de382e:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de3830:	f7fe fcfc 	bl	c0de222c <pqcrystals_dilithium2_lowram_pack_sig_h_zero>
c0de3834:	9902      	ldr	r1, [sp, #8]
c0de3836:	f640 1074 	movw	r0, #2420	@ 0x974
c0de383a:	6008      	str	r0, [r1, #0]
c0de383c:	2000      	movs	r0, #0
c0de383e:	f50d 5d83 	add.w	sp, sp, #4192	@ 0x1060
c0de3842:	b006      	add	sp, #24
c0de3844:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de3848:	000002d8 	.word	0x000002d8
c0de384c:	000173b2 	.word	0x000173b2
c0de3850:	ffffdb59 	.word	0xffffdb59

c0de3854 <pqcrystals_dilithium2_lowram_verify>:
c0de3854:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3858:	f5ad 6d10 	sub.w	sp, sp, #2304	@ 0x900
c0de385c:	4615      	mov	r5, r2
c0de385e:	f640 1274 	movw	r2, #2420	@ 0x974
c0de3862:	4604      	mov	r4, r0
c0de3864:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de3868:	4291      	cmp	r1, r2
c0de386a:	f040 80ea 	bne.w	c0de3a42 <pqcrystals_dilithium2_lowram_verify+0x1ee>
c0de386e:	f8dd a924 	ldr.w	sl, [sp, #2340]	@ 0x924
c0de3872:	f1ba 0fff 	cmp.w	sl, #255	@ 0xff
c0de3876:	f200 80e4 	bhi.w	c0de3a42 <pqcrystals_dilithium2_lowram_verify+0x1ee>
c0de387a:	4f80      	ldr	r7, [pc, #512]	@ (c0de3a7c <pqcrystals_dilithium2_lowram_verify+0x228>)
c0de387c:	f10d 0be8 	add.w	fp, sp, #232	@ 0xe8
c0de3880:	f8dd 6928 	ldr.w	r6, [sp, #2344]	@ 0x928
c0de3884:	9305      	str	r3, [sp, #20]
c0de3886:	4658      	mov	r0, fp
c0de3888:	447f      	add	r7, pc
c0de388a:	47b8      	blx	r7
c0de388c:	9504      	str	r5, [sp, #16]
c0de388e:	4658      	mov	r0, fp
c0de3890:	4631      	mov	r1, r6
c0de3892:	f44f 62a4 	mov.w	r2, #1312	@ 0x520
c0de3896:	4d7a      	ldr	r5, [pc, #488]	@ (c0de3a80 <pqcrystals_dilithium2_lowram_verify+0x22c>)
c0de3898:	447d      	add	r5, pc
c0de389a:	47a8      	blx	r5
c0de389c:	4658      	mov	r0, fp
c0de389e:	f7fd fc34 	bl	c0de110a <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de38a2:	f50d 78dc 	add.w	r8, sp, #440	@ 0x1b8
c0de38a6:	2140      	movs	r1, #64	@ 0x40
c0de38a8:	465a      	mov	r2, fp
c0de38aa:	4640      	mov	r0, r8
c0de38ac:	f7fd fc38 	bl	c0de1120 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de38b0:	4658      	mov	r0, fp
c0de38b2:	47b8      	blx	r7
c0de38b4:	4658      	mov	r0, fp
c0de38b6:	4641      	mov	r1, r8
c0de38b8:	2240      	movs	r2, #64	@ 0x40
c0de38ba:	47a8      	blx	r5
c0de38bc:	f88d a1b9 	strb.w	sl, [sp, #441]	@ 0x1b9
c0de38c0:	4656      	mov	r6, sl
c0de38c2:	f04f 0a00 	mov.w	sl, #0
c0de38c6:	4658      	mov	r0, fp
c0de38c8:	4641      	mov	r1, r8
c0de38ca:	2202      	movs	r2, #2
c0de38cc:	f88d a1b8 	strb.w	sl, [sp, #440]	@ 0x1b8
c0de38d0:	47a8      	blx	r5
c0de38d2:	f8dd 1920 	ldr.w	r1, [sp, #2336]	@ 0x920
c0de38d6:	4658      	mov	r0, fp
c0de38d8:	4632      	mov	r2, r6
c0de38da:	47a8      	blx	r5
c0de38dc:	e9dd 1204 	ldrd	r1, r2, [sp, #16]
c0de38e0:	4658      	mov	r0, fp
c0de38e2:	47a8      	blx	r5
c0de38e4:	4658      	mov	r0, fp
c0de38e6:	f7fd fc10 	bl	c0de110a <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de38ea:	4640      	mov	r0, r8
c0de38ec:	2140      	movs	r1, #64	@ 0x40
c0de38ee:	465a      	mov	r2, fp
c0de38f0:	f7fd fc16 	bl	c0de1120 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de38f4:	4658      	mov	r0, fp
c0de38f6:	47b8      	blx	r7
c0de38f8:	4658      	mov	r0, fp
c0de38fa:	4641      	mov	r1, r8
c0de38fc:	2240      	movs	r2, #64	@ 0x40
c0de38fe:	47a8      	blx	r5
c0de3900:	f20d 46fc 	addw	r6, sp, #1276	@ 0x4fc
c0de3904:	4621      	mov	r1, r4
c0de3906:	4630      	mov	r0, r6
c0de3908:	f7ff f8a1 	bl	c0de2a4e <poly_challenge_lowram>
c0de390c:	4640      	mov	r0, r8
c0de390e:	4631      	mov	r1, r6
c0de3910:	f7fe fc98 	bl	c0de2244 <poly_challenge_compress>
c0de3914:	f8dd 0928 	ldr.w	r0, [sp, #2344]	@ 0x928
c0de3918:	f104 0520 	add.w	r5, r4, #32
c0de391c:	f10d 0b18 	add.w	fp, sp, #24
c0de3920:	f50d 78fe 	add.w	r8, sp, #508	@ 0x1fc
c0de3924:	2700      	movs	r7, #0
c0de3926:	9502      	str	r5, [sp, #8]
c0de3928:	3020      	adds	r0, #32
c0de392a:	9003      	str	r0, [sp, #12]
c0de392c:	2001      	movs	r0, #1
c0de392e:	9005      	str	r0, [sp, #20]
c0de3930:	2f04      	cmp	r7, #4
c0de3932:	f000 808a 	beq.w	c0de3a4a <pqcrystals_dilithium2_lowram_verify+0x1f6>
c0de3936:	2000      	movs	r0, #0
c0de3938:	f5b0 7f40 	cmp.w	r0, #768	@ 0x300
c0de393c:	d003      	beq.n	c0de3946 <pqcrystals_dilithium2_lowram_verify+0xf2>
c0de393e:	f808 a000 	strb.w	sl, [r8, r0]
c0de3942:	3001      	adds	r0, #1
c0de3944:	e7f8      	b.n	c0de3938 <pqcrystals_dilithium2_lowram_verify+0xe4>
c0de3946:	4630      	mov	r0, r6
c0de3948:	4629      	mov	r1, r5
c0de394a:	f7ff faae 	bl	c0de2eaa <pqcrystals_dilithium2_lowram_polyz_unpack>
c0de394e:	494a      	ldr	r1, [pc, #296]	@ (c0de3a78 <pqcrystals_dilithium2_lowram_verify+0x224>)
c0de3950:	4630      	mov	r0, r6
c0de3952:	f7ff f9df 	bl	c0de2d14 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de3956:	2800      	cmp	r0, #0
c0de3958:	d171      	bne.n	c0de3a3e <pqcrystals_dilithium2_lowram_verify+0x1ea>
c0de395a:	4630      	mov	r0, r6
c0de395c:	f7ff f9b5 	bl	c0de2cca <pqcrystals_dilithium2_lowram_poly_ntt>
c0de3960:	0238      	lsls	r0, r7, #8
c0de3962:	f8dd 2928 	ldr.w	r2, [sp, #2344]	@ 0x928
c0de3966:	4631      	mov	r1, r6
c0de3968:	465d      	mov	r5, fp
c0de396a:	f8cd b000 	str.w	fp, [sp]
c0de396e:	9704      	str	r7, [sp, #16]
c0de3970:	b283      	uxth	r3, r0
c0de3972:	4640      	mov	r0, r8
c0de3974:	f7fe fee0 	bl	c0de2738 <poly_uniform_pointwise_montgomery_polywadd_lowram>
c0de3978:	9f05      	ldr	r7, [sp, #20]
c0de397a:	f44f 7b18 	mov.w	fp, #608	@ 0x260
c0de397e:	f5bb 6f12 	cmp.w	fp, #2336	@ 0x920
c0de3982:	d019      	beq.n	c0de39b8 <pqcrystals_dilithium2_lowram_verify+0x164>
c0de3984:	eb04 010b 	add.w	r1, r4, fp
c0de3988:	4630      	mov	r0, r6
c0de398a:	f7ff fa8e 	bl	c0de2eaa <pqcrystals_dilithium2_lowram_polyz_unpack>
c0de398e:	493a      	ldr	r1, [pc, #232]	@ (c0de3a78 <pqcrystals_dilithium2_lowram_verify+0x224>)
c0de3990:	4630      	mov	r0, r6
c0de3992:	f7ff f9bf 	bl	c0de2d14 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de3996:	2800      	cmp	r0, #0
c0de3998:	d151      	bne.n	c0de3a3e <pqcrystals_dilithium2_lowram_verify+0x1ea>
c0de399a:	4630      	mov	r0, r6
c0de399c:	f7ff f995 	bl	c0de2cca <pqcrystals_dilithium2_lowram_poly_ntt>
c0de39a0:	f8dd 2928 	ldr.w	r2, [sp, #2344]	@ 0x928
c0de39a4:	b2bb      	uxth	r3, r7
c0de39a6:	4640      	mov	r0, r8
c0de39a8:	4631      	mov	r1, r6
c0de39aa:	9500      	str	r5, [sp, #0]
c0de39ac:	f7fe fec4 	bl	c0de2738 <poly_uniform_pointwise_montgomery_polywadd_lowram>
c0de39b0:	3701      	adds	r7, #1
c0de39b2:	f50b 7b10 	add.w	fp, fp, #576	@ 0x240
c0de39b6:	e7e2      	b.n	c0de397e <pqcrystals_dilithium2_lowram_verify+0x12a>
c0de39b8:	4630      	mov	r0, r6
c0de39ba:	4641      	mov	r1, r8
c0de39bc:	f7fe fe33 	bl	c0de2626 <polyw_unpack>
c0de39c0:	4630      	mov	r0, r6
c0de39c2:	f7ff f955 	bl	c0de2c70 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de39c6:	4630      	mov	r0, r6
c0de39c8:	f7ff f981 	bl	c0de2cce <pqcrystals_dilithium2_lowram_poly_invntt_tomont>
c0de39cc:	4640      	mov	r0, r8
c0de39ce:	4631      	mov	r1, r6
c0de39d0:	f7fe fe0b 	bl	c0de25ea <polyw_pack>
c0de39d4:	9f04      	ldr	r7, [sp, #16]
c0de39d6:	9903      	ldr	r1, [sp, #12]
c0de39d8:	eb07 0087 	add.w	r0, r7, r7, lsl #2
c0de39dc:	eb01 1280 	add.w	r2, r1, r0, lsl #6
c0de39e0:	4630      	mov	r0, r6
c0de39e2:	a96e      	add	r1, sp, #440	@ 0x1b8
c0de39e4:	f7fe fd5a 	bl	c0de249c <poly_schoolbook_t1>
c0de39e8:	4630      	mov	r0, r6
c0de39ea:	4641      	mov	r1, r8
c0de39ec:	4632      	mov	r2, r6
c0de39ee:	f7fe fe32 	bl	c0de2656 <polyw_sub>
c0de39f2:	4630      	mov	r0, r6
c0de39f4:	f7ff f93c 	bl	c0de2c70 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de39f8:	4630      	mov	r0, r6
c0de39fa:	f7ff f948 	bl	c0de2c8e <pqcrystals_dilithium2_lowram_poly_caddq>
c0de39fe:	4628      	mov	r0, r5
c0de3a00:	f60d 01fc 	addw	r1, sp, #2300	@ 0x8fc
c0de3a04:	463a      	mov	r2, r7
c0de3a06:	4623      	mov	r3, r4
c0de3a08:	46ab      	mov	fp, r5
c0de3a0a:	f7fe ff83 	bl	c0de2914 <unpack_sig_h_indices>
c0de3a0e:	b9b0      	cbnz	r0, c0de3a3e <pqcrystals_dilithium2_lowram_verify+0x1ea>
c0de3a10:	f8dd 38fc 	ldr.w	r3, [sp, #2300]	@ 0x8fc
c0de3a14:	4630      	mov	r0, r6
c0de3a16:	4631      	mov	r1, r6
c0de3a18:	465a      	mov	r2, fp
c0de3a1a:	f7fe ffb9 	bl	c0de2990 <poly_use_hint_lowram>
c0de3a1e:	4640      	mov	r0, r8
c0de3a20:	4631      	mov	r1, r6
c0de3a22:	f7ff fbcf 	bl	c0de31c4 <pqcrystals_dilithium2_lowram_polyw1_pack>
c0de3a26:	a83a      	add	r0, sp, #232	@ 0xe8
c0de3a28:	4641      	mov	r1, r8
c0de3a2a:	22c0      	movs	r2, #192	@ 0xc0
c0de3a2c:	f7fd fb62 	bl	c0de10f4 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de3a30:	9805      	ldr	r0, [sp, #20]
c0de3a32:	9d02      	ldr	r5, [sp, #8]
c0de3a34:	3701      	adds	r7, #1
c0de3a36:	f500 7080 	add.w	r0, r0, #256	@ 0x100
c0de3a3a:	9005      	str	r0, [sp, #20]
c0de3a3c:	e778      	b.n	c0de3930 <pqcrystals_dilithium2_lowram_verify+0xdc>
c0de3a3e:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de3a42:	f50d 6d10 	add.w	sp, sp, #2304	@ 0x900
c0de3a46:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de3a4a:	ad3a      	add	r5, sp, #232	@ 0xe8
c0de3a4c:	4628      	mov	r0, r5
c0de3a4e:	f7fd fb5c 	bl	c0de110a <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de3a52:	4658      	mov	r0, fp
c0de3a54:	2120      	movs	r1, #32
c0de3a56:	462a      	mov	r2, r5
c0de3a58:	f7fd fb62 	bl	c0de1120 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de3a5c:	2100      	movs	r1, #0
c0de3a5e:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de3a62:	2920      	cmp	r1, #32
c0de3a64:	d006      	beq.n	c0de3a74 <pqcrystals_dilithium2_lowram_verify+0x220>
c0de3a66:	f81b 2001 	ldrb.w	r2, [fp, r1]
c0de3a6a:	5c63      	ldrb	r3, [r4, r1]
c0de3a6c:	3101      	adds	r1, #1
c0de3a6e:	4293      	cmp	r3, r2
c0de3a70:	d0f7      	beq.n	c0de3a62 <pqcrystals_dilithium2_lowram_verify+0x20e>
c0de3a72:	e7e6      	b.n	c0de3a42 <pqcrystals_dilithium2_lowram_verify+0x1ee>
c0de3a74:	2000      	movs	r0, #0
c0de3a76:	e7e4      	b.n	c0de3a42 <pqcrystals_dilithium2_lowram_verify+0x1ee>
c0de3a78:	0001ffb2 	.word	0x0001ffb2
c0de3a7c:	ffffd859 	.word	0xffffd859
c0de3a80:	ffffd859 	.word	0xffffd859

c0de3a84 <pqcrystals_dilithium2_lowram_open>:
c0de3a84:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de3a86:	4604      	mov	r4, r0
c0de3a88:	f640 1074 	movw	r0, #2420	@ 0x974
c0de3a8c:	461d      	mov	r5, r3
c0de3a8e:	460e      	mov	r6, r1
c0de3a90:	4283      	cmp	r3, r0
c0de3a92:	d311      	bcc.n	c0de3ab8 <pqcrystals_dilithium2_lowram_open+0x34>
c0de3a94:	e9dd 7108 	ldrd	r7, r1, [sp, #32]
c0de3a98:	f6a5 1374 	subw	r3, r5, #2420	@ 0x974
c0de3a9c:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de3a9e:	6033      	str	r3, [r6, #0]
c0de3aa0:	e9cd 7100 	strd	r7, r1, [sp]
c0de3aa4:	f602 1774 	addw	r7, r2, #2420	@ 0x974
c0de3aa8:	9002      	str	r0, [sp, #8]
c0de3aaa:	4610      	mov	r0, r2
c0de3aac:	f640 1174 	movw	r1, #2420	@ 0x974
c0de3ab0:	463a      	mov	r2, r7
c0de3ab2:	f7ff fecf 	bl	c0de3854 <pqcrystals_dilithium2_lowram_verify>
c0de3ab6:	b148      	cbz	r0, c0de3acc <pqcrystals_dilithium2_lowram_open+0x48>
c0de3ab8:	2000      	movs	r0, #0
c0de3aba:	6030      	str	r0, [r6, #0]
c0de3abc:	b11d      	cbz	r5, c0de3ac6 <pqcrystals_dilithium2_lowram_open+0x42>
c0de3abe:	f804 0b01 	strb.w	r0, [r4], #1
c0de3ac2:	3d01      	subs	r5, #1
c0de3ac4:	e7fa      	b.n	c0de3abc <pqcrystals_dilithium2_lowram_open+0x38>
c0de3ac6:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de3aca:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
c0de3acc:	2000      	movs	r0, #0
c0de3ace:	6831      	ldr	r1, [r6, #0]
c0de3ad0:	4288      	cmp	r0, r1
c0de3ad2:	bf24      	itt	cs
c0de3ad4:	2000      	movcs	r0, #0
c0de3ad6:	bdfe      	popcs	{r1, r2, r3, r4, r5, r6, r7, pc}
c0de3ad8:	5c39      	ldrb	r1, [r7, r0]
c0de3ada:	5421      	strb	r1, [r4, r0]
c0de3adc:	3001      	adds	r0, #1
c0de3ade:	e7f6      	b.n	c0de3ace <pqcrystals_dilithium2_lowram_open+0x4a>

c0de3ae0 <OUTLINED_FUNCTION_0>:
c0de3ae0:	9f09      	ldr	r7, [sp, #36]	@ 0x24
c0de3ae2:	4621      	mov	r1, r4
c0de3ae4:	4638      	mov	r0, r7
c0de3ae6:	f000 b8ed 	b.w	c0de3cc4 <poly_small_ntt_copy>
	...

c0de3aec <small_ntt>:
c0de3aec:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3af0:	491c      	ldr	r1, [pc, #112]	@ (c0de3b64 <small_ntt+0x78>)
c0de3af2:	f04f 0c80 	mov.w	ip, #128	@ 0x80
c0de3af6:	f04f 0e01 	mov.w	lr, #1
c0de3afa:	f46f 6850 	mvn.w	r8, #3328	@ 0xd00
c0de3afe:	4479      	add	r1, pc
c0de3b00:	468a      	mov	sl, r1
c0de3b02:	4917      	ldr	r1, [pc, #92]	@ (c0de3b60 <small_ntt+0x74>)
c0de3b04:	468b      	mov	fp, r1
c0de3b06:	f1bc 0f02 	cmp.w	ip, #2
c0de3b0a:	bf38      	it	cc
c0de3b0c:	e8bd 8df0 	ldmiacc.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de3b10:	2600      	movs	r6, #0
c0de3b12:	2eff      	cmp	r6, #255	@ 0xff
c0de3b14:	d821      	bhi.n	c0de3b5a <small_ntt+0x6e>
c0de3b16:	4651      	mov	r1, sl
c0de3b18:	f93a 301e 	ldrsh.w	r3, [sl, lr, lsl #1]
c0de3b1c:	eb06 010c 	add.w	r1, r6, ip
c0de3b20:	460f      	mov	r7, r1
c0de3b22:	428e      	cmp	r6, r1
c0de3b24:	d215      	bcs.n	c0de3b52 <small_ntt+0x66>
c0de3b26:	f930 2017 	ldrsh.w	r2, [r0, r7, lsl #1]
c0de3b2a:	465c      	mov	r4, fp
c0de3b2c:	435a      	muls	r2, r3
c0de3b2e:	fb02 f40b 	mul.w	r4, r2, fp
c0de3b32:	1424      	asrs	r4, r4, #16
c0de3b34:	fb04 2208 	mla	r2, r4, r8, r2
c0de3b38:	f830 4016 	ldrh.w	r4, [r0, r6, lsl #1]
c0de3b3c:	eba4 4512 	sub.w	r5, r4, r2, lsr #16
c0de3b40:	eb04 4212 	add.w	r2, r4, r2, lsr #16
c0de3b44:	f820 5017 	strh.w	r5, [r0, r7, lsl #1]
c0de3b48:	f820 2016 	strh.w	r2, [r0, r6, lsl #1]
c0de3b4c:	3701      	adds	r7, #1
c0de3b4e:	3601      	adds	r6, #1
c0de3b50:	e7e7      	b.n	c0de3b22 <small_ntt+0x36>
c0de3b52:	f10e 0e01 	add.w	lr, lr, #1
c0de3b56:	463e      	mov	r6, r7
c0de3b58:	e7db      	b.n	c0de3b12 <small_ntt+0x26>
c0de3b5a:	ea4f 0c5c 	mov.w	ip, ip, lsr #1
c0de3b5e:	e7d2      	b.n	c0de3b06 <small_ntt+0x1a>
c0de3b60:	f3010000 	.word	0xf3010000
c0de3b64:	0000bb36 	.word	0x0000bb36

c0de3b68 <small_invntt_tomont>:
c0de3b68:	e92d 4dfe 	stmdb	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de3b6c:	4934      	ldr	r1, [pc, #208]	@ (c0de3c40 <small_invntt_tomont+0xd8>)
c0de3b6e:	4b36      	ldr	r3, [pc, #216]	@ (c0de3c48 <small_invntt_tomont+0xe0>)
c0de3b70:	2202      	movs	r2, #2
c0de3b72:	247f      	movs	r4, #127	@ 0x7f
c0de3b74:	f644 68bf 	movw	r8, #20159	@ 0x4ebf
c0de3b78:	f46f 6a50 	mvn.w	sl, #3328	@ 0xd00
c0de3b7c:	468e      	mov	lr, r1
c0de3b7e:	4931      	ldr	r1, [pc, #196]	@ (c0de3c44 <small_invntt_tomont+0xdc>)
c0de3b80:	447b      	add	r3, pc
c0de3b82:	9300      	str	r3, [sp, #0]
c0de3b84:	f101 5bd3 	add.w	fp, r1, #442499072	@ 0x1a600000
c0de3b88:	2a80      	cmp	r2, #128	@ 0x80
c0de3b8a:	d834      	bhi.n	c0de3bf6 <small_invntt_tomont+0x8e>
c0de3b8c:	2300      	movs	r3, #0
c0de3b8e:	9201      	str	r2, [sp, #4]
c0de3b90:	2bff      	cmp	r3, #255	@ 0xff
c0de3b92:	d82e      	bhi.n	c0de3bf2 <small_invntt_tomont+0x8a>
c0de3b94:	9900      	ldr	r1, [sp, #0]
c0de3b96:	9402      	str	r4, [sp, #8]
c0de3b98:	f931 4014 	ldrsh.w	r4, [r1, r4, lsl #1]
c0de3b9c:	1899      	adds	r1, r3, r2
c0de3b9e:	460d      	mov	r5, r1
c0de3ba0:	428b      	cmp	r3, r1
c0de3ba2:	d221      	bcs.n	c0de3be8 <small_invntt_tomont+0x80>
c0de3ba4:	f830 6013 	ldrh.w	r6, [r0, r3, lsl #1]
c0de3ba8:	f830 2015 	ldrh.w	r2, [r0, r5, lsl #1]
c0de3bac:	46f4      	mov	ip, lr
c0de3bae:	4432      	add	r2, r6
c0de3bb0:	b217      	sxth	r7, r2
c0de3bb2:	fb07 f708 	mul.w	r7, r7, r8
c0de3bb6:	f107 7700 	add.w	r7, r7, #33554432	@ 0x2000000
c0de3bba:	16bf      	asrs	r7, r7, #26
c0de3bbc:	fb07 f70e 	mul.w	r7, r7, lr
c0de3bc0:	eba2 4217 	sub.w	r2, r2, r7, lsr #16
c0de3bc4:	f820 2013 	strh.w	r2, [r0, r3, lsl #1]
c0de3bc8:	3301      	adds	r3, #1
c0de3bca:	f830 2015 	ldrh.w	r2, [r0, r5, lsl #1]
c0de3bce:	1b92      	subs	r2, r2, r6
c0de3bd0:	b212      	sxth	r2, r2
c0de3bd2:	4362      	muls	r2, r4
c0de3bd4:	fb02 f60b 	mul.w	r6, r2, fp
c0de3bd8:	1436      	asrs	r6, r6, #16
c0de3bda:	fb06 220a 	mla	r2, r6, sl, r2
c0de3bde:	0c12      	lsrs	r2, r2, #16
c0de3be0:	f820 2015 	strh.w	r2, [r0, r5, lsl #1]
c0de3be4:	3501      	adds	r5, #1
c0de3be6:	e7db      	b.n	c0de3ba0 <small_invntt_tomont+0x38>
c0de3be8:	9c02      	ldr	r4, [sp, #8]
c0de3bea:	9a01      	ldr	r2, [sp, #4]
c0de3bec:	462b      	mov	r3, r5
c0de3bee:	3c01      	subs	r4, #1
c0de3bf0:	e7ce      	b.n	c0de3b90 <small_invntt_tomont+0x28>
c0de3bf2:	0052      	lsls	r2, r2, #1
c0de3bf4:	e7c8      	b.n	c0de3b88 <small_invntt_tomont+0x20>
c0de3bf6:	2100      	movs	r1, #0
c0de3bf8:	f240 52a1 	movw	r2, #1441	@ 0x5a1
c0de3bfc:	f46f 6350 	mvn.w	r3, #3328	@ 0xd00
c0de3c00:	f644 64bf 	movw	r4, #20159	@ 0x4ebf
c0de3c04:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de3c08:	bf08      	it	eq
c0de3c0a:	e8bd 8dfe 	ldmiaeq.w	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de3c0e:	f930 5011 	ldrsh.w	r5, [r0, r1, lsl #1]
c0de3c12:	4f0c      	ldr	r7, [pc, #48]	@ (c0de3c44 <small_invntt_tomont+0xdc>)
c0de3c14:	fb05 f602 	mul.w	r6, r5, r2
c0de3c18:	437d      	muls	r5, r7
c0de3c1a:	4677      	mov	r7, lr
c0de3c1c:	142d      	asrs	r5, r5, #16
c0de3c1e:	fb05 6503 	mla	r5, r5, r3, r6
c0de3c22:	142e      	asrs	r6, r5, #16
c0de3c24:	0c2d      	lsrs	r5, r5, #16
c0de3c26:	4366      	muls	r6, r4
c0de3c28:	f106 7600 	add.w	r6, r6, #33554432	@ 0x2000000
c0de3c2c:	16b6      	asrs	r6, r6, #26
c0de3c2e:	fb06 f60e 	mul.w	r6, r6, lr
c0de3c32:	eba5 4516 	sub.w	r5, r5, r6, lsr #16
c0de3c36:	f820 5011 	strh.w	r5, [r0, r1, lsl #1]
c0de3c3a:	3101      	adds	r1, #1
c0de3c3c:	e7e2      	b.n	c0de3c04 <small_invntt_tomont+0x9c>
c0de3c3e:	bf00      	nop
c0de3c40:	0d010000 	.word	0x0d010000
c0de3c44:	d8a10000 	.word	0xd8a10000
c0de3c48:	0000bab4 	.word	0x0000bab4

c0de3c4c <small_basemul>:
c0de3c4c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de3c4e:	f9b1 c000 	ldrsh.w	ip, [r1]
c0de3c52:	f9b1 5002 	ldrsh.w	r5, [r1, #2]
c0de3c56:	f9b2 1002 	ldrsh.w	r1, [r2, #2]
c0de3c5a:	f46f 6e50 	mvn.w	lr, #3328	@ 0xd00
c0de3c5e:	f9b2 6000 	ldrsh.w	r6, [r2]
c0de3c62:	fb01 f705 	mul.w	r7, r1, r5
c0de3c66:	4916      	ldr	r1, [pc, #88]	@ (c0de3cc0 <small_basemul+0x74>)
c0de3c68:	fb07 f401 	mul.w	r4, r7, r1
c0de3c6c:	1424      	asrs	r4, r4, #16
c0de3c6e:	fb04 740e 	mla	r4, r4, lr, r7
c0de3c72:	1424      	asrs	r4, r4, #16
c0de3c74:	4363      	muls	r3, r4
c0de3c76:	fb03 f401 	mul.w	r4, r3, r1
c0de3c7a:	1424      	asrs	r4, r4, #16
c0de3c7c:	fb04 330e 	mla	r3, r4, lr, r3
c0de3c80:	fb06 f40c 	mul.w	r4, r6, ip
c0de3c84:	fb04 f701 	mul.w	r7, r4, r1
c0de3c88:	143f      	asrs	r7, r7, #16
c0de3c8a:	0c1b      	lsrs	r3, r3, #16
c0de3c8c:	fb07 440e 	mla	r4, r7, lr, r4
c0de3c90:	eb03 4314 	add.w	r3, r3, r4, lsr #16
c0de3c94:	8003      	strh	r3, [r0, #0]
c0de3c96:	fb06 f305 	mul.w	r3, r6, r5
c0de3c9a:	f9b2 2002 	ldrsh.w	r2, [r2, #2]
c0de3c9e:	fb03 f401 	mul.w	r4, r3, r1
c0de3ca2:	1424      	asrs	r4, r4, #16
c0de3ca4:	fb02 f20c 	mul.w	r2, r2, ip
c0de3ca8:	fb04 330e 	mla	r3, r4, lr, r3
c0de3cac:	4351      	muls	r1, r2
c0de3cae:	1409      	asrs	r1, r1, #16
c0de3cb0:	fb01 210e 	mla	r1, r1, lr, r2
c0de3cb4:	0c09      	lsrs	r1, r1, #16
c0de3cb6:	eb01 4113 	add.w	r1, r1, r3, lsr #16
c0de3cba:	8041      	strh	r1, [r0, #2]
c0de3cbc:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de3cbe:	bf00      	nop
c0de3cc0:	f3010000 	.word	0xf3010000

c0de3cc4 <poly_small_ntt_copy>:
c0de3cc4:	22ff      	movs	r2, #255	@ 0xff
c0de3cc6:	f1b2 3fff 	cmp.w	r2, #4294967295	@ 0xffffffff
c0de3cca:	bfd8      	it	le
c0de3ccc:	f7ff bf0e 	ble.w	c0de3aec <small_ntt>
c0de3cd0:	f851 3022 	ldr.w	r3, [r1, r2, lsl #2]
c0de3cd4:	f820 3012 	strh.w	r3, [r0, r2, lsl #1]
c0de3cd8:	3a01      	subs	r2, #1
c0de3cda:	e7f4      	b.n	c0de3cc6 <poly_small_ntt_copy+0x2>

c0de3cdc <poly_small_basemul>:
c0de3cdc:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de3ce0:	e9cd 1200 	strd	r1, r2, [sp]
c0de3ce4:	4683      	mov	fp, r0
c0de3ce6:	f04f 0a00 	mov.w	sl, #0
c0de3cea:	4811      	ldr	r0, [pc, #68]	@ (c0de3d30 <poly_small_basemul+0x54>)
c0de3cec:	4478      	add	r0, pc
c0de3cee:	f100 0880 	add.w	r8, r0, #128	@ 0x80
c0de3cf2:	f5ba 7f00 	cmp.w	sl, #512	@ 0x200
c0de3cf6:	bf08      	it	eq
c0de3cf8:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de3cfc:	9800      	ldr	r0, [sp, #0]
c0de3cfe:	f938 6b02 	ldrsh.w	r6, [r8], #2
c0de3d02:	eb0b 070a 	add.w	r7, fp, sl
c0de3d06:	eb00 040a 	add.w	r4, r0, sl
c0de3d0a:	9801      	ldr	r0, [sp, #4]
c0de3d0c:	4633      	mov	r3, r6
c0de3d0e:	4621      	mov	r1, r4
c0de3d10:	eb00 050a 	add.w	r5, r0, sl
c0de3d14:	4638      	mov	r0, r7
c0de3d16:	462a      	mov	r2, r5
c0de3d18:	f7ff ff98 	bl	c0de3c4c <small_basemul>
c0de3d1c:	4273      	negs	r3, r6
c0de3d1e:	1d38      	adds	r0, r7, #4
c0de3d20:	1d21      	adds	r1, r4, #4
c0de3d22:	1d2a      	adds	r2, r5, #4
c0de3d24:	b21b      	sxth	r3, r3
c0de3d26:	f7ff ff91 	bl	c0de3c4c <small_basemul>
c0de3d2a:	f10a 0a08 	add.w	sl, sl, #8
c0de3d2e:	e7e0      	b.n	c0de3cf2 <poly_small_basemul+0x16>
c0de3d30:	0000b948 	.word	0x0000b948

c0de3d34 <poly_small_basemul_invntt>:
c0de3d34:	b510      	push	{r4, lr}
c0de3d36:	4604      	mov	r4, r0
c0de3d38:	f7ff ffd0 	bl	c0de3cdc <poly_small_basemul>
c0de3d3c:	4620      	mov	r0, r4
c0de3d3e:	f7ff ff13 	bl	c0de3b68 <small_invntt_tomont>
c0de3d42:	20ff      	movs	r0, #255	@ 0xff
c0de3d44:	2800      	cmp	r0, #0
c0de3d46:	d405      	bmi.n	c0de3d54 <poly_small_basemul_invntt+0x20>
c0de3d48:	f934 1010 	ldrsh.w	r1, [r4, r0, lsl #1]
c0de3d4c:	f844 1020 	str.w	r1, [r4, r0, lsl #2]
c0de3d50:	3801      	subs	r0, #1
c0de3d52:	e7f7      	b.n	c0de3d44 <poly_small_basemul_invntt+0x10>
c0de3d54:	bd10      	pop	{r4, pc}

c0de3d56 <small_polyeta_unpack>:
c0de3d56:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3d5a:	3101      	adds	r1, #1
c0de3d5c:	f04f 0c00 	mov.w	ip, #0
c0de3d60:	f5bc 7f00 	cmp.w	ip, #512	@ 0x200
c0de3d64:	bf08      	it	eq
c0de3d66:	e8bd 8df0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de3d6a:	f811 4c01 	ldrb.w	r4, [r1, #-1]
c0de3d6e:	f004 0807 	and.w	r8, r4, #7
c0de3d72:	eb00 040c 	add.w	r4, r0, ip
c0de3d76:	f820 800c 	strh.w	r8, [r0, ip]
c0de3d7a:	f1c8 0202 	rsb	r2, r8, #2
c0de3d7e:	f811 5c01 	ldrb.w	r5, [r1, #-1]
c0de3d82:	f3c5 0ec2 	ubfx	lr, r5, #3, #3
c0de3d86:	f8a4 e002 	strh.w	lr, [r4, #2]
c0de3d8a:	f811 6c01 	ldrb.w	r6, [r1, #-1]
c0de3d8e:	780b      	ldrb	r3, [r1, #0]
c0de3d90:	09b6      	lsrs	r6, r6, #6
c0de3d92:	f363 0682 	bfi	r6, r3, #2, #1
c0de3d96:	80a6      	strh	r6, [r4, #4]
c0de3d98:	780b      	ldrb	r3, [r1, #0]
c0de3d9a:	f3c3 0a42 	ubfx	sl, r3, #1, #3
c0de3d9e:	f8a4 a006 	strh.w	sl, [r4, #6]
c0de3da2:	780d      	ldrb	r5, [r1, #0]
c0de3da4:	f3c5 1502 	ubfx	r5, r5, #4, #3
c0de3da8:	8125      	strh	r5, [r4, #8]
c0de3daa:	780f      	ldrb	r7, [r1, #0]
c0de3dac:	784b      	ldrb	r3, [r1, #1]
c0de3dae:	09ff      	lsrs	r7, r7, #7
c0de3db0:	f363 0742 	bfi	r7, r3, #1, #2
c0de3db4:	8167      	strh	r7, [r4, #10]
c0de3db6:	784b      	ldrb	r3, [r1, #1]
c0de3db8:	f3c3 0382 	ubfx	r3, r3, #2, #3
c0de3dbc:	81a3      	strh	r3, [r4, #12]
c0de3dbe:	f891 b001 	ldrb.w	fp, [r1, #1]
c0de3dc2:	f820 200c 	strh.w	r2, [r0, ip]
c0de3dc6:	f1c3 0202 	rsb	r2, r3, #2
c0de3dca:	3103      	adds	r1, #3
c0de3dcc:	f10c 0c10 	add.w	ip, ip, #16
c0de3dd0:	81a2      	strh	r2, [r4, #12]
c0de3dd2:	f1c7 0202 	rsb	r2, r7, #2
c0de3dd6:	8162      	strh	r2, [r4, #10]
c0de3dd8:	f1c5 0202 	rsb	r2, r5, #2
c0de3ddc:	8122      	strh	r2, [r4, #8]
c0de3dde:	f1ca 0202 	rsb	r2, sl, #2
c0de3de2:	80e2      	strh	r2, [r4, #6]
c0de3de4:	f1c6 0202 	rsb	r2, r6, #2
c0de3de8:	80a2      	strh	r2, [r4, #4]
c0de3dea:	f1ce 0202 	rsb	r2, lr, #2
c0de3dee:	8062      	strh	r2, [r4, #2]
c0de3df0:	2202      	movs	r2, #2
c0de3df2:	eba2 125b 	sub.w	r2, r2, fp, lsr #5
c0de3df6:	81e2      	strh	r2, [r4, #14]
c0de3df8:	e7b2      	b.n	c0de3d60 <small_polyeta_unpack+0xa>

c0de3dfa <pqcrystals_dilithium2_lowram_dilithium_shake128_stream_init>:
c0de3dfa:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0de3dfc:	f000 f825 	bl	c0de3e4a <OUTLINED_FUNCTION_0>
c0de3e00:	f7fd f826 	bl	c0de0e50 <pqcrystals_dilithium_fips202_ref_shake128_init>
c0de3e04:	4628      	mov	r0, r5
c0de3e06:	4621      	mov	r1, r4
c0de3e08:	2220      	movs	r2, #32
c0de3e0a:	f7fd f833 	bl	c0de0e74 <pqcrystals_dilithium_fips202_ref_shake128_absorb>
c0de3e0e:	f10d 0106 	add.w	r1, sp, #6
c0de3e12:	4628      	mov	r0, r5
c0de3e14:	2202      	movs	r2, #2
c0de3e16:	f7fd f82d 	bl	c0de0e74 <pqcrystals_dilithium_fips202_ref_shake128_absorb>
c0de3e1a:	4628      	mov	r0, r5
c0de3e1c:	f7fd f873 	bl	c0de0f06 <pqcrystals_dilithium_fips202_ref_shake128_finalize>
c0de3e20:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0de3e22 <pqcrystals_dilithium2_lowram_dilithium_shake256_stream_init>:
c0de3e22:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0de3e24:	f000 f811 	bl	c0de3e4a <OUTLINED_FUNCTION_0>
c0de3e28:	f7fd f95c 	bl	c0de10e4 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de3e2c:	4628      	mov	r0, r5
c0de3e2e:	4621      	mov	r1, r4
c0de3e30:	2240      	movs	r2, #64	@ 0x40
c0de3e32:	f7fd f95f 	bl	c0de10f4 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de3e36:	f10d 0106 	add.w	r1, sp, #6
c0de3e3a:	4628      	mov	r0, r5
c0de3e3c:	2202      	movs	r2, #2
c0de3e3e:	f7fd f959 	bl	c0de10f4 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de3e42:	4628      	mov	r0, r5
c0de3e44:	f7fd f961 	bl	c0de110a <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de3e48:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0de3e4a <OUTLINED_FUNCTION_0>:
c0de3e4a:	4605      	mov	r5, r0
c0de3e4c:	0a10      	lsrs	r0, r2, #8
c0de3e4e:	460c      	mov	r4, r1
c0de3e50:	f88d 2006 	strb.w	r2, [sp, #6]
c0de3e54:	f88d 0007 	strb.w	r0, [sp, #7]
c0de3e58:	4628      	mov	r0, r5
c0de3e5a:	4770      	bx	lr

c0de3e5c <os_io_handle_default_apdu>:
c0de3e5c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de3e5e:	b09d      	sub	sp, #116	@ 0x74
c0de3e60:	4615      	mov	r5, r2
c0de3e62:	9a22      	ldr	r2, [sp, #136]	@ 0x88
c0de3e64:	b3c8      	cbz	r0, c0de3eda <os_io_handle_default_apdu+0x7e>
c0de3e66:	b3c1      	cbz	r1, c0de3eda <os_io_handle_default_apdu+0x7e>
c0de3e68:	b3bd      	cbz	r5, c0de3eda <os_io_handle_default_apdu+0x7e>
c0de3e6a:	461c      	mov	r4, r3
c0de3e6c:	b3ab      	cbz	r3, c0de3eda <os_io_handle_default_apdu+0x7e>
c0de3e6e:	b10a      	cbz	r2, c0de3e74 <os_io_handle_default_apdu+0x18>
c0de3e70:	2100      	movs	r1, #0
c0de3e72:	7011      	strb	r1, [r2, #0]
c0de3e74:	7801      	ldrb	r1, [r0, #0]
c0de3e76:	29b0      	cmp	r1, #176	@ 0xb0
c0de3e78:	d131      	bne.n	c0de3ede <os_io_handle_default_apdu+0x82>
c0de3e7a:	7841      	ldrb	r1, [r0, #1]
c0de3e7c:	29a7      	cmp	r1, #167	@ 0xa7
c0de3e7e:	d031      	beq.n	c0de3ee4 <os_io_handle_default_apdu+0x88>
c0de3e80:	2906      	cmp	r1, #6
c0de3e82:	d036      	beq.n	c0de3ef2 <os_io_handle_default_apdu+0x96>
c0de3e84:	2901      	cmp	r1, #1
c0de3e86:	d131      	bne.n	c0de3eec <os_io_handle_default_apdu+0x90>
c0de3e88:	7881      	ldrb	r1, [r0, #2]
c0de3e8a:	bb79      	cbnz	r1, c0de3eec <os_io_handle_default_apdu+0x90>
c0de3e8c:	78c0      	ldrb	r0, [r0, #3]
c0de3e8e:	bb68      	cbnz	r0, c0de3eec <os_io_handle_default_apdu+0x90>
c0de3e90:	6820      	ldr	r0, [r4, #0]
c0de3e92:	2100      	movs	r1, #0
c0de3e94:	6021      	str	r1, [r4, #0]
c0de3e96:	2803      	cmp	r0, #3
c0de3e98:	d321      	bcc.n	c0de3ede <os_io_handle_default_apdu+0x82>
c0de3e9a:	2601      	movs	r6, #1
c0de3e9c:	1ec7      	subs	r7, r0, #3
c0de3e9e:	6026      	str	r6, [r4, #0]
c0de3ea0:	702e      	strb	r6, [r5, #0]
c0de3ea2:	6820      	ldr	r0, [r4, #0]
c0de3ea4:	1a3a      	subs	r2, r7, r0
c0de3ea6:	4428      	add	r0, r5
c0de3ea8:	1c41      	adds	r1, r0, #1
c0de3eaa:	2001      	movs	r0, #1
c0de3eac:	f008 f904 	bl	c0dec0b8 <os_registry_get_current_app_tag>
c0de3eb0:	f000 f83f 	bl	c0de3f32 <OUTLINED_FUNCTION_0>
c0de3eb4:	6020      	str	r0, [r4, #0]
c0de3eb6:	1a3a      	subs	r2, r7, r0
c0de3eb8:	4428      	add	r0, r5
c0de3eba:	1c41      	adds	r1, r0, #1
c0de3ebc:	2002      	movs	r0, #2
c0de3ebe:	f008 f8fb 	bl	c0dec0b8 <os_registry_get_current_app_tag>
c0de3ec2:	f000 f836 	bl	c0de3f32 <OUTLINED_FUNCTION_0>
c0de3ec6:	1c41      	adds	r1, r0, #1
c0de3ec8:	6021      	str	r1, [r4, #0]
c0de3eca:	542e      	strb	r6, [r5, r0]
c0de3ecc:	f008 f8e0 	bl	c0dec090 <os_flags>
c0de3ed0:	6821      	ldr	r1, [r4, #0]
c0de3ed2:	1c4a      	adds	r2, r1, #1
c0de3ed4:	6022      	str	r2, [r4, #0]
c0de3ed6:	5468      	strb	r0, [r5, r1]
c0de3ed8:	e028      	b.n	c0de3f2c <os_io_handle_default_apdu+0xd0>
c0de3eda:	7814      	ldrb	r4, [r2, #0]
c0de3edc:	e01e      	b.n	c0de3f1c <os_io_handle_default_apdu+0xc0>
c0de3ede:	f646 1485 	movw	r4, #27013	@ 0x6985
c0de3ee2:	e01b      	b.n	c0de3f1c <os_io_handle_default_apdu+0xc0>
c0de3ee4:	7881      	ldrb	r1, [r0, #2]
c0de3ee6:	b909      	cbnz	r1, c0de3eec <os_io_handle_default_apdu+0x90>
c0de3ee8:	78c0      	ldrb	r0, [r0, #3]
c0de3eea:	b1d0      	cbz	r0, c0de3f22 <os_io_handle_default_apdu+0xc6>
c0de3eec:	f44f 44dc 	mov.w	r4, #28160	@ 0x6e00
c0de3ef0:	e014      	b.n	c0de3f1c <os_io_handle_default_apdu+0xc0>
c0de3ef2:	2100      	movs	r1, #0
c0de3ef4:	6021      	str	r1, [r4, #0]
c0de3ef6:	7883      	ldrb	r3, [r0, #2]
c0de3ef8:	7902      	ldrb	r2, [r0, #4]
c0de3efa:	ad02      	add	r5, sp, #8
c0de3efc:	e9cd 1500 	strd	r1, r5, [sp]
c0de3f00:	1d41      	adds	r1, r0, #5
c0de3f02:	4618      	mov	r0, r3
c0de3f04:	2300      	movs	r3, #0
c0de3f06:	f008 f897 	bl	c0dec038 <os_pki_load_certificate>
c0de3f0a:	4604      	mov	r4, r0
c0de3f0c:	4628      	mov	r0, r5
c0de3f0e:	216c      	movs	r1, #108	@ 0x6c
c0de3f10:	f008 fa60 	bl	c0dec3d4 <explicit_bzero>
c0de3f14:	2c00      	cmp	r4, #0
c0de3f16:	bf08      	it	eq
c0de3f18:	f44f 4410 	moveq.w	r4, #36864	@ 0x9000
c0de3f1c:	4620      	mov	r0, r4
c0de3f1e:	b01d      	add	sp, #116	@ 0x74
c0de3f20:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de3f22:	2000      	movs	r0, #0
c0de3f24:	6020      	str	r0, [r4, #0]
c0de3f26:	b10a      	cbz	r2, c0de3f2c <os_io_handle_default_apdu+0xd0>
c0de3f28:	2001      	movs	r0, #1
c0de3f2a:	7010      	strb	r0, [r2, #0]
c0de3f2c:	f44f 4410 	mov.w	r4, #36864	@ 0x9000
c0de3f30:	e7f4      	b.n	c0de3f1c <os_io_handle_default_apdu+0xc0>

c0de3f32 <OUTLINED_FUNCTION_0>:
c0de3f32:	6821      	ldr	r1, [r4, #0]
c0de3f34:	1c4a      	adds	r2, r1, #1
c0de3f36:	6022      	str	r2, [r4, #0]
c0de3f38:	5468      	strb	r0, [r5, r1]
c0de3f3a:	6821      	ldr	r1, [r4, #0]
c0de3f3c:	4408      	add	r0, r1
c0de3f3e:	4770      	bx	lr

c0de3f40 <os_io_seph_cmd_piezo_play_tune>:
c0de3f40:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0de3f42:	280b      	cmp	r0, #11
c0de3f44:	d902      	bls.n	c0de3f4c <os_io_seph_cmd_piezo_play_tune+0xc>
c0de3f46:	f06f 0415 	mvn.w	r4, #21
c0de3f4a:	e021      	b.n	c0de3f90 <os_io_seph_cmd_piezo_play_tune+0x50>
c0de3f4c:	4605      	mov	r5, r0
c0de3f4e:	2009      	movs	r0, #9
c0de3f50:	2100      	movs	r1, #0
c0de3f52:	2200      	movs	r2, #0
c0de3f54:	2400      	movs	r4, #0
c0de3f56:	f008 f8a3 	bl	c0dec0a0 <os_setting_get>
c0de3f5a:	2d08      	cmp	r5, #8
c0de3f5c:	d802      	bhi.n	c0de3f64 <os_io_seph_cmd_piezo_play_tune+0x24>
c0de3f5e:	f010 0102 	ands.w	r1, r0, #2
c0de3f62:	d115      	bne.n	c0de3f90 <os_io_seph_cmd_piezo_play_tune+0x50>
c0de3f64:	2400      	movs	r4, #0
c0de3f66:	2d09      	cmp	r5, #9
c0de3f68:	d302      	bcc.n	c0de3f70 <os_io_seph_cmd_piezo_play_tune+0x30>
c0de3f6a:	f010 0001 	ands.w	r0, r0, #1
c0de3f6e:	d10f      	bne.n	c0de3f90 <os_io_seph_cmd_piezo_play_tune+0x50>
c0de3f70:	2056      	movs	r0, #86	@ 0x56
c0de3f72:	f88d 5007 	strb.w	r5, [sp, #7]
c0de3f76:	f88d 4005 	strb.w	r4, [sp, #5]
c0de3f7a:	2204      	movs	r2, #4
c0de3f7c:	2300      	movs	r3, #0
c0de3f7e:	f88d 0004 	strb.w	r0, [sp, #4]
c0de3f82:	2001      	movs	r0, #1
c0de3f84:	f88d 0006 	strb.w	r0, [sp, #6]
c0de3f88:	a901      	add	r1, sp, #4
c0de3f8a:	f000 f803 	bl	c0de3f94 <OUTLINED_FUNCTION_1>
c0de3f8e:	4604      	mov	r4, r0
c0de3f90:	4620      	mov	r0, r4
c0de3f92:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0de3f94 <OUTLINED_FUNCTION_1>:
c0de3f94:	2001      	movs	r0, #1
c0de3f96:	f008 b8b9 	b.w	c0dec10c <os_io_tx_cmd>
	...

c0de3f9c <io_process_itc_ux_event>:
c0de3f9c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de3f9e:	4605      	mov	r5, r0
c0de3fa0:	78c0      	ldrb	r0, [r0, #3]
c0de3fa2:	2820      	cmp	r0, #32
c0de3fa4:	d023      	beq.n	c0de3fee <io_process_itc_ux_event+0x52>
c0de3fa6:	2823      	cmp	r0, #35	@ 0x23
c0de3fa8:	d029      	beq.n	c0de3ffe <io_process_itc_ux_event+0x62>
c0de3faa:	460c      	mov	r4, r1
c0de3fac:	2822      	cmp	r0, #34	@ 0x22
c0de3fae:	d132      	bne.n	c0de4016 <io_process_itc_ux_event+0x7a>
c0de3fb0:	4e1f      	ldr	r6, [pc, #124]	@ (c0de4030 <io_process_itc_ux_event+0x94>)
c0de3fb2:	2006      	movs	r0, #6
c0de3fb4:	2118      	movs	r1, #24
c0de3fb6:	f809 0006 	strb.w	r0, [r9, r6]
c0de3fba:	eb09 0706 	add.w	r7, r9, r6
c0de3fbe:	2018      	movs	r0, #24
c0de3fc0:	6078      	str	r0, [r7, #4]
c0de3fc2:	f107 0008 	add.w	r0, r7, #8
c0de3fc6:	f008 f9f7 	bl	c0dec3b8 <__aeabi_memclr>
c0de3fca:	7928      	ldrb	r0, [r5, #4]
c0de3fcc:	7238      	strb	r0, [r7, #8]
c0de3fce:	7868      	ldrb	r0, [r5, #1]
c0de3fd0:	78a9      	ldrb	r1, [r5, #2]
c0de3fd2:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de3fd6:	3802      	subs	r0, #2
c0de3fd8:	0401      	lsls	r1, r0, #16
c0de3fda:	d005      	beq.n	c0de3fe8 <io_process_itc_ux_event+0x4c>
c0de3fdc:	b282      	uxth	r2, r0
c0de3fde:	2a10      	cmp	r2, #16
c0de3fe0:	d802      	bhi.n	c0de3fe8 <io_process_itc_ux_event+0x4c>
c0de3fe2:	1f60      	subs	r0, r4, #5
c0de3fe4:	4290      	cmp	r0, r2
c0de3fe6:	d218      	bcs.n	c0de401a <io_process_itc_ux_event+0x7e>
c0de3fe8:	f06f 0415 	mvn.w	r4, #21
c0de3fec:	e013      	b.n	c0de4016 <io_process_itc_ux_event+0x7a>
c0de3fee:	2001      	movs	r0, #1
c0de3ff0:	f007 fdbc 	bl	c0debb6c <nbgl_objAllowDrawing>
c0de3ff4:	f007 fdc9 	bl	c0debb8a <nbgl_screenRedraw>
c0de3ff8:	f007 fd9f 	bl	c0debb3a <nbgl_refresh>
c0de3ffc:	e00a      	b.n	c0de4014 <io_process_itc_ux_event+0x78>
c0de3ffe:	480c      	ldr	r0, [pc, #48]	@ (c0de4030 <io_process_itc_ux_event+0x94>)
c0de4000:	2107      	movs	r1, #7
c0de4002:	f809 1000 	strb.w	r1, [r9, r0]
c0de4006:	4448      	add	r0, r9
c0de4008:	2101      	movs	r1, #1
c0de400a:	6041      	str	r1, [r0, #4]
c0de400c:	7929      	ldrb	r1, [r5, #4]
c0de400e:	7201      	strb	r1, [r0, #8]
c0de4010:	f008 f834 	bl	c0dec07c <os_ux>
c0de4014:	2400      	movs	r4, #0
c0de4016:	4620      	mov	r0, r4
c0de4018:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de401a:	eb09 0406 	add.w	r4, r9, r6
c0de401e:	1d69      	adds	r1, r5, #5
c0de4020:	f104 0010 	add.w	r0, r4, #16
c0de4024:	60e2      	str	r2, [r4, #12]
c0de4026:	f008 f9bd 	bl	c0dec3a4 <__aeabi_memcpy>
c0de402a:	4620      	mov	r0, r4
c0de402c:	e7f0      	b.n	c0de4010 <io_process_itc_ux_event+0x74>
c0de402e:	bf00      	nop
c0de4030:	00001da0 	.word	0x00001da0

c0de4034 <io_legacy_apdu_tx>:
c0de4034:	b5b0      	push	{r4, r5, r7, lr}
c0de4036:	460a      	mov	r2, r1
c0de4038:	4601      	mov	r1, r0
c0de403a:	4808      	ldr	r0, [pc, #32]	@ (c0de405c <io_legacy_apdu_tx+0x28>)
c0de403c:	2300      	movs	r3, #0
c0de403e:	2500      	movs	r5, #0
c0de4040:	eb09 0400 	add.w	r4, r9, r0
c0de4044:	7860      	ldrb	r0, [r4, #1]
c0de4046:	f008 f861 	bl	c0dec10c <os_io_tx_cmd>
c0de404a:	4905      	ldr	r1, [pc, #20]	@ (c0de4060 <io_legacy_apdu_tx+0x2c>)
c0de404c:	7065      	strb	r5, [r4, #1]
c0de404e:	f809 5001 	strb.w	r5, [r9, r1]
c0de4052:	4904      	ldr	r1, [pc, #16]	@ (c0de4064 <io_legacy_apdu_tx+0x30>)
c0de4054:	4449      	add	r1, r9
c0de4056:	718d      	strb	r5, [r1, #6]
c0de4058:	bdb0      	pop	{r4, r5, r7, pc}
c0de405a:	bf00      	nop
c0de405c:	000016c8 	.word	0x000016c8
c0de4060:	00001dc0 	.word	0x00001dc0
c0de4064:	000016bc 	.word	0x000016bc

c0de4068 <io_legacy_apdu_rx>:
c0de4068:	e92d 41ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
c0de406c:	4e8c      	ldr	r6, [pc, #560]	@ (c0de42a0 <io_legacy_apdu_rx+0x238>)
c0de406e:	2100      	movs	r1, #0
c0de4070:	4605      	mov	r5, r0
c0de4072:	2200      	movs	r2, #0
c0de4074:	2301      	movs	r3, #1
c0de4076:	f88d 100f 	strb.w	r1, [sp, #15]
c0de407a:	f240 1111 	movw	r1, #273	@ 0x111
c0de407e:	eb09 0006 	add.w	r0, r9, r6
c0de4082:	f008 f84f 	bl	c0dec124 <os_io_rx_evt>
c0de4086:	4604      	mov	r4, r0
c0de4088:	2801      	cmp	r0, #1
c0de408a:	f2c0 8100 	blt.w	c0de428e <io_legacy_apdu_rx+0x226>
c0de408e:	f819 0006 	ldrb.w	r0, [r9, r6]
c0de4092:	f1a0 0110 	sub.w	r1, r0, #16
c0de4096:	2916      	cmp	r1, #22
c0de4098:	d844      	bhi.n	c0de4124 <io_legacy_apdu_rx+0xbc>
c0de409a:	2201      	movs	r2, #1
c0de409c:	fa02 f101 	lsl.w	r1, r2, r1
c0de40a0:	4a80      	ldr	r2, [pc, #512]	@ (c0de42a4 <io_legacy_apdu_rx+0x23c>)
c0de40a2:	4211      	tst	r1, r2
c0de40a4:	d03e      	beq.n	c0de4124 <io_legacy_apdu_rx+0xbc>
c0de40a6:	4f80      	ldr	r7, [pc, #512]	@ (c0de42a8 <io_legacy_apdu_rx+0x240>)
c0de40a8:	eb09 0107 	add.w	r1, r9, r7
c0de40ac:	7048      	strb	r0, [r1, #1]
c0de40ae:	f007 ffd3 	bl	c0dec058 <os_perso_is_pin_set>
c0de40b2:	28aa      	cmp	r0, #170	@ 0xaa
c0de40b4:	d103      	bne.n	c0de40be <io_legacy_apdu_rx+0x56>
c0de40b6:	f007 ffd8 	bl	c0dec06a <os_global_pin_is_validated>
c0de40ba:	28aa      	cmp	r0, #170	@ 0xaa
c0de40bc:	d161      	bne.n	c0de4182 <io_legacy_apdu_rx+0x11a>
c0de40be:	eb09 0006 	add.w	r0, r9, r6
c0de40c2:	7840      	ldrb	r0, [r0, #1]
c0de40c4:	28b0      	cmp	r0, #176	@ 0xb0
c0de40c6:	d135      	bne.n	c0de4134 <io_legacy_apdu_rx+0xcc>
c0de40c8:	f240 1011 	movw	r0, #273	@ 0x111
c0de40cc:	1e61      	subs	r1, r4, #1
c0de40ce:	9002      	str	r0, [sp, #8]
c0de40d0:	f10d 000f 	add.w	r0, sp, #15
c0de40d4:	9000      	str	r0, [sp, #0]
c0de40d6:	4875      	ldr	r0, [pc, #468]	@ (c0de42ac <io_legacy_apdu_rx+0x244>)
c0de40d8:	ab02      	add	r3, sp, #8
c0de40da:	eb09 0500 	add.w	r5, r9, r0
c0de40de:	eb09 0006 	add.w	r0, r9, r6
c0de40e2:	3001      	adds	r0, #1
c0de40e4:	462a      	mov	r2, r5
c0de40e6:	f7ff feb9 	bl	c0de3e5c <os_io_handle_default_apdu>
c0de40ea:	2400      	movs	r4, #0
c0de40ec:	9902      	ldr	r1, [sp, #8]
c0de40ee:	eb09 0607 	add.w	r6, r9, r7
c0de40f2:	f5b0 4f10 	cmp.w	r0, #36864	@ 0x9000
c0de40f6:	bf18      	it	ne
c0de40f8:	4621      	movne	r1, r4
c0de40fa:	0a02      	lsrs	r2, r0, #8
c0de40fc:	2300      	movs	r3, #0
c0de40fe:	546a      	strb	r2, [r5, r1]
c0de4100:	186a      	adds	r2, r5, r1
c0de4102:	7050      	strb	r0, [r2, #1]
c0de4104:	1c88      	adds	r0, r1, #2
c0de4106:	4629      	mov	r1, r5
c0de4108:	9002      	str	r0, [sp, #8]
c0de410a:	b282      	uxth	r2, r0
c0de410c:	7870      	ldrb	r0, [r6, #1]
c0de410e:	f007 fffd 	bl	c0dec10c <os_io_tx_cmd>
c0de4112:	f89d 100f 	ldrb.w	r1, [sp, #15]
c0de4116:	7074      	strb	r4, [r6, #1]
c0de4118:	2901      	cmp	r1, #1
c0de411a:	f000 80bd 	beq.w	c0de4298 <io_legacy_apdu_rx+0x230>
c0de411e:	ea00 75e0 	and.w	r5, r0, r0, asr #31
c0de4122:	e0b5      	b.n	c0de4290 <io_legacy_apdu_rx+0x228>
c0de4124:	1e41      	subs	r1, r0, #1
c0de4126:	2902      	cmp	r1, #2
c0de4128:	d33d      	bcc.n	c0de41a6 <io_legacy_apdu_rx+0x13e>
c0de412a:	2830      	cmp	r0, #48	@ 0x30
c0de412c:	d0bb      	beq.n	c0de40a6 <io_legacy_apdu_rx+0x3e>
c0de412e:	2840      	cmp	r0, #64	@ 0x40
c0de4130:	d0b9      	beq.n	c0de40a6 <io_legacy_apdu_rx+0x3e>
c0de4132:	e0a3      	b.n	c0de427c <io_legacy_apdu_rx+0x214>
c0de4134:	eb09 0007 	add.w	r0, r9, r7
c0de4138:	7847      	ldrb	r7, [r0, #1]
c0de413a:	2f10      	cmp	r7, #16
c0de413c:	d05f      	beq.n	c0de41fe <io_legacy_apdu_rx+0x196>
c0de413e:	2f40      	cmp	r7, #64	@ 0x40
c0de4140:	d05f      	beq.n	c0de4202 <io_legacy_apdu_rx+0x19a>
c0de4142:	2f21      	cmp	r7, #33	@ 0x21
c0de4144:	d06f      	beq.n	c0de4226 <io_legacy_apdu_rx+0x1be>
c0de4146:	2f22      	cmp	r7, #34	@ 0x22
c0de4148:	d048      	beq.n	c0de41dc <io_legacy_apdu_rx+0x174>
c0de414a:	2f23      	cmp	r7, #35	@ 0x23
c0de414c:	d048      	beq.n	c0de41e0 <io_legacy_apdu_rx+0x178>
c0de414e:	2f30      	cmp	r7, #48	@ 0x30
c0de4150:	d053      	beq.n	c0de41fa <io_legacy_apdu_rx+0x192>
c0de4152:	f8df 815c 	ldr.w	r8, [pc, #348]	@ c0de42b0 <io_legacy_apdu_rx+0x248>
c0de4156:	2f20      	cmp	r7, #32
c0de4158:	eb09 0008 	add.w	r0, r9, r8
c0de415c:	d16d      	bne.n	c0de423a <io_legacy_apdu_rx+0x1d2>
c0de415e:	2701      	movs	r7, #1
c0de4160:	eb09 0106 	add.w	r1, r9, r6
c0de4164:	1e65      	subs	r5, r4, #1
c0de4166:	7187      	strb	r7, [r0, #6]
c0de4168:	4850      	ldr	r0, [pc, #320]	@ (c0de42ac <io_legacy_apdu_rx+0x244>)
c0de416a:	3101      	adds	r1, #1
c0de416c:	462a      	mov	r2, r5
c0de416e:	4448      	add	r0, r9
c0de4170:	f008 f918 	bl	c0dec3a4 <__aeabi_memcpy>
c0de4174:	484f      	ldr	r0, [pc, #316]	@ (c0de42b4 <io_legacy_apdu_rx+0x24c>)
c0de4176:	f809 7000 	strb.w	r7, [r9, r0]
c0de417a:	2008      	movs	r0, #8
c0de417c:	f809 0008 	strb.w	r0, [r9, r8]
c0de4180:	e086      	b.n	c0de4290 <io_legacy_apdu_rx+0x228>
c0de4182:	484a      	ldr	r0, [pc, #296]	@ (c0de42ac <io_legacy_apdu_rx+0x244>)
c0de4184:	2155      	movs	r1, #85	@ 0x55
c0de4186:	2202      	movs	r2, #2
c0de4188:	2300      	movs	r3, #0
c0de418a:	f809 1000 	strb.w	r1, [r9, r0]
c0de418e:	eb09 0100 	add.w	r1, r9, r0
c0de4192:	2015      	movs	r0, #21
c0de4194:	7048      	strb	r0, [r1, #1]
c0de4196:	eb09 0007 	add.w	r0, r9, r7
c0de419a:	7840      	ldrb	r0, [r0, #1]
c0de419c:	b004      	add	sp, #16
c0de419e:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de41a2:	f007 bfb3 	b.w	c0dec10c <os_io_tx_cmd>
c0de41a6:	4f44      	ldr	r7, [pc, #272]	@ (c0de42b8 <io_legacy_apdu_rx+0x250>)
c0de41a8:	444e      	add	r6, r9
c0de41aa:	3c01      	subs	r4, #1
c0de41ac:	1c71      	adds	r1, r6, #1
c0de41ae:	4622      	mov	r2, r4
c0de41b0:	eb09 0007 	add.w	r0, r9, r7
c0de41b4:	f008 f8f6 	bl	c0dec3a4 <__aeabi_memcpy>
c0de41b8:	7870      	ldrb	r0, [r6, #1]
c0de41ba:	281a      	cmp	r0, #26
c0de41bc:	d107      	bne.n	c0de41ce <io_legacy_apdu_rx+0x166>
c0de41be:	eb09 0007 	add.w	r0, r9, r7
c0de41c2:	4621      	mov	r1, r4
c0de41c4:	b004      	add	sp, #16
c0de41c6:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de41ca:	f7ff bee7 	b.w	c0de3f9c <io_process_itc_ux_event>
c0de41ce:	2d00      	cmp	r5, #0
c0de41d0:	d04a      	beq.n	c0de4268 <io_legacy_apdu_rx+0x200>
c0de41d2:	2000      	movs	r0, #0
c0de41d4:	2500      	movs	r5, #0
c0de41d6:	f007 fa83 	bl	c0deb6e0 <io_event>
c0de41da:	e059      	b.n	c0de4290 <io_legacy_apdu_rx+0x228>
c0de41dc:	2004      	movs	r0, #4
c0de41de:	e023      	b.n	c0de4228 <io_legacy_apdu_rx+0x1c0>
c0de41e0:	4f33      	ldr	r7, [pc, #204]	@ (c0de42b0 <io_legacy_apdu_rx+0x248>)
c0de41e2:	2107      	movs	r1, #7
c0de41e4:	1e65      	subs	r5, r4, #1
c0de41e6:	462a      	mov	r2, r5
c0de41e8:	eb09 0007 	add.w	r0, r9, r7
c0de41ec:	7181      	strb	r1, [r0, #6]
c0de41ee:	482f      	ldr	r0, [pc, #188]	@ (c0de42ac <io_legacy_apdu_rx+0x244>)
c0de41f0:	f000 f886 	bl	c0de4300 <OUTLINED_FUNCTION_0>
c0de41f4:	482f      	ldr	r0, [pc, #188]	@ (c0de42b4 <io_legacy_apdu_rx+0x24c>)
c0de41f6:	2101      	movs	r1, #1
c0de41f8:	e00f      	b.n	c0de421a <io_legacy_apdu_rx+0x1b2>
c0de41fa:	2002      	movs	r0, #2
c0de41fc:	e014      	b.n	c0de4228 <io_legacy_apdu_rx+0x1c0>
c0de41fe:	2006      	movs	r0, #6
c0de4200:	e012      	b.n	c0de4228 <io_legacy_apdu_rx+0x1c0>
c0de4202:	4f2b      	ldr	r7, [pc, #172]	@ (c0de42b0 <io_legacy_apdu_rx+0x248>)
c0de4204:	2103      	movs	r1, #3
c0de4206:	1e65      	subs	r5, r4, #1
c0de4208:	462a      	mov	r2, r5
c0de420a:	eb09 0007 	add.w	r0, r9, r7
c0de420e:	7181      	strb	r1, [r0, #6]
c0de4210:	4826      	ldr	r0, [pc, #152]	@ (c0de42ac <io_legacy_apdu_rx+0x244>)
c0de4212:	f000 f875 	bl	c0de4300 <OUTLINED_FUNCTION_0>
c0de4216:	4827      	ldr	r0, [pc, #156]	@ (c0de42b4 <io_legacy_apdu_rx+0x24c>)
c0de4218:	2102      	movs	r1, #2
c0de421a:	f809 1000 	strb.w	r1, [r9, r0]
c0de421e:	200a      	movs	r0, #10
c0de4220:	f809 0007 	strb.w	r0, [r9, r7]
c0de4224:	e034      	b.n	c0de4290 <io_legacy_apdu_rx+0x228>
c0de4226:	2005      	movs	r0, #5
c0de4228:	4921      	ldr	r1, [pc, #132]	@ (c0de42b0 <io_legacy_apdu_rx+0x248>)
c0de422a:	1e65      	subs	r5, r4, #1
c0de422c:	462a      	mov	r2, r5
c0de422e:	4449      	add	r1, r9
c0de4230:	7188      	strb	r0, [r1, #6]
c0de4232:	481e      	ldr	r0, [pc, #120]	@ (c0de42ac <io_legacy_apdu_rx+0x244>)
c0de4234:	f000 f864 	bl	c0de4300 <OUTLINED_FUNCTION_0>
c0de4238:	e02a      	b.n	c0de4290 <io_legacy_apdu_rx+0x228>
c0de423a:	2100      	movs	r1, #0
c0de423c:	1e65      	subs	r5, r4, #1
c0de423e:	7181      	strb	r1, [r0, #6]
c0de4240:	481a      	ldr	r0, [pc, #104]	@ (c0de42ac <io_legacy_apdu_rx+0x244>)
c0de4242:	eb09 0106 	add.w	r1, r9, r6
c0de4246:	462a      	mov	r2, r5
c0de4248:	3101      	adds	r1, #1
c0de424a:	4448      	add	r0, r9
c0de424c:	f008 f8aa 	bl	c0dec3a4 <__aeabi_memcpy>
c0de4250:	2f25      	cmp	r7, #37	@ 0x25
c0de4252:	d015      	beq.n	c0de4280 <io_legacy_apdu_rx+0x218>
c0de4254:	2f24      	cmp	r7, #36	@ 0x24
c0de4256:	d11b      	bne.n	c0de4290 <io_legacy_apdu_rx+0x228>
c0de4258:	200b      	movs	r0, #11
c0de425a:	2101      	movs	r1, #1
c0de425c:	f809 0008 	strb.w	r0, [r9, r8]
c0de4260:	4814      	ldr	r0, [pc, #80]	@ (c0de42b4 <io_legacy_apdu_rx+0x24c>)
c0de4262:	f809 1000 	strb.w	r1, [r9, r0]
c0de4266:	e013      	b.n	c0de4290 <io_legacy_apdu_rx+0x228>
c0de4268:	f819 0007 	ldrb.w	r0, [r9, r7]
c0de426c:	2815      	cmp	r0, #21
c0de426e:	d8b0      	bhi.n	c0de41d2 <io_legacy_apdu_rx+0x16a>
c0de4270:	2101      	movs	r1, #1
c0de4272:	fa01 f000 	lsl.w	r0, r1, r0
c0de4276:	4911      	ldr	r1, [pc, #68]	@ (c0de42bc <io_legacy_apdu_rx+0x254>)
c0de4278:	4208      	tst	r0, r1
c0de427a:	d0aa      	beq.n	c0de41d2 <io_legacy_apdu_rx+0x16a>
c0de427c:	2500      	movs	r5, #0
c0de427e:	e007      	b.n	c0de4290 <io_legacy_apdu_rx+0x228>
c0de4280:	200c      	movs	r0, #12
c0de4282:	2101      	movs	r1, #1
c0de4284:	f809 0008 	strb.w	r0, [r9, r8]
c0de4288:	480a      	ldr	r0, [pc, #40]	@ (c0de42b4 <io_legacy_apdu_rx+0x24c>)
c0de428a:	f809 1000 	strb.w	r1, [r9, r0]
c0de428e:	4625      	mov	r5, r4
c0de4290:	4628      	mov	r0, r5
c0de4292:	b004      	add	sp, #16
c0de4294:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de4298:	20ff      	movs	r0, #255	@ 0xff
c0de429a:	f007 ff19 	bl	c0dec0d0 <os_sched_exit>
c0de429e:	bf00      	nop
c0de42a0:	000015a8 	.word	0x000015a8
c0de42a4:	007f0001 	.word	0x007f0001
c0de42a8:	000016c8 	.word	0x000016c8
c0de42ac:	00001497 	.word	0x00001497
c0de42b0:	000016bc 	.word	0x000016bc
c0de42b4:	00001dc0 	.word	0x00001dc0
c0de42b8:	00001c8c 	.word	0x00001c8c
c0de42bc:	00205020 	.word	0x00205020

c0de42c0 <io_seproxyhal_init>:
c0de42c0:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de42c2:	b089      	sub	sp, #36	@ 0x24
c0de42c4:	4d0c      	ldr	r5, [pc, #48]	@ (c0de42f8 <io_seproxyhal_init+0x38>)
c0de42c6:	2600      	movs	r6, #0
c0de42c8:	466c      	mov	r4, sp
c0de42ca:	2118      	movs	r1, #24
c0de42cc:	eb09 0005 	add.w	r0, r9, r5
c0de42d0:	7046      	strb	r6, [r0, #1]
c0de42d2:	4620      	mov	r0, r4
c0de42d4:	f008 f870 	bl	c0dec3b8 <__aeabi_memclr>
c0de42d8:	4808      	ldr	r0, [pc, #32]	@ (c0de42fc <io_seproxyhal_init+0x3c>)
c0de42da:	2701      	movs	r7, #1
c0de42dc:	f88d 601e 	strb.w	r6, [sp, #30]
c0de42e0:	f8ad 7020 	strh.w	r7, [sp, #32]
c0de42e4:	f8ad 701c 	strh.w	r7, [sp, #28]
c0de42e8:	9006      	str	r0, [sp, #24]
c0de42ea:	4620      	mov	r0, r4
c0de42ec:	f007 fefa 	bl	c0dec0e4 <os_io_init>
c0de42f0:	f809 7005 	strb.w	r7, [r9, r5]
c0de42f4:	b009      	add	sp, #36	@ 0x24
c0de42f6:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de42f8:	000016c8 	.word	0x000016c8
c0de42fc:	00020015 	.word	0x00020015

c0de4300 <OUTLINED_FUNCTION_0>:
c0de4300:	eb09 0106 	add.w	r1, r9, r6
c0de4304:	3101      	adds	r1, #1
c0de4306:	4448      	add	r0, r9
c0de4308:	f008 b84c 	b.w	c0dec3a4 <__aeabi_memcpy>

c0de430c <layoutAddCallbackObj>:
c0de430c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de430e:	f890 40ad 	ldrb.w	r4, [r0, #173]	@ 0xad
c0de4312:	f890 50ae 	ldrb.w	r5, [r0, #174]	@ 0xae
c0de4316:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de431a:	f3c4 2505 	ubfx	r5, r4, #8, #6
c0de431e:	2d0e      	cmp	r5, #14
c0de4320:	bf84      	itt	hi
c0de4322:	2000      	movhi	r0, #0
c0de4324:	bdf0      	pophi	{r4, r5, r6, r7, pc}
c0de4326:	0a26      	lsrs	r6, r4, #8
c0de4328:	f404 4740 	and.w	r7, r4, #49152	@ 0xc000
c0de432c:	f880 40ad 	strb.w	r4, [r0, #173]	@ 0xad
c0de4330:	3601      	adds	r6, #1
c0de4332:	f006 063f 	and.w	r6, r6, #63	@ 0x3f
c0de4336:	ea47 2606 	orr.w	r6, r7, r6, lsl #8
c0de433a:	0a36      	lsrs	r6, r6, #8
c0de433c:	f880 60ae 	strb.w	r6, [r0, #174]	@ 0xae
c0de4340:	eb00 00c5 	add.w	r0, r0, r5, lsl #3
c0de4344:	f840 1f20 	str.w	r1, [r0, #32]!
c0de4348:	7102      	strb	r2, [r0, #4]
c0de434a:	7183      	strb	r3, [r0, #6]
c0de434c:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

c0de4350 <nbgl_layoutGet>:
c0de4350:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de4354:	b085      	sub	sp, #20
c0de4356:	4604      	mov	r4, r0
c0de4358:	7800      	ldrb	r0, [r0, #0]
c0de435a:	b190      	cbz	r0, c0de4382 <nbgl_layoutGet+0x32>
c0de435c:	486c      	ldr	r0, [pc, #432]	@ (c0de4510 <nbgl_layoutGet+0x1c0>)
c0de435e:	496d      	ldr	r1, [pc, #436]	@ (c0de4514 <nbgl_layoutGet+0x1c4>)
c0de4360:	2500      	movs	r5, #0
c0de4362:	b158      	cbz	r0, c0de437c <nbgl_layoutGet+0x2c>
c0de4364:	eb09 0201 	add.w	r2, r9, r1
c0de4368:	4402      	add	r2, r0
c0de436a:	f892 32ca 	ldrb.w	r3, [r2, #714]	@ 0x2ca
c0de436e:	021b      	lsls	r3, r3, #8
c0de4370:	045b      	lsls	r3, r3, #17
c0de4372:	bf58      	it	pl
c0de4374:	f502 7507 	addpl.w	r5, r2, #540	@ 0x21c
c0de4378:	30b4      	adds	r0, #180	@ 0xb4
c0de437a:	e7f2      	b.n	c0de4362 <nbgl_layoutGet+0x12>
c0de437c:	b975      	cbnz	r5, c0de439c <nbgl_layoutGet+0x4c>
c0de437e:	2500      	movs	r5, #0
c0de4380:	e0c1      	b.n	c0de4506 <nbgl_layoutGet+0x1b6>
c0de4382:	4965      	ldr	r1, [pc, #404]	@ (c0de4518 <nbgl_layoutGet+0x1c8>)
c0de4384:	4863      	ldr	r0, [pc, #396]	@ (c0de4514 <nbgl_layoutGet+0x1c4>)
c0de4386:	eb09 0201 	add.w	r2, r9, r1
c0de438a:	6852      	ldr	r2, [r2, #4]
c0de438c:	b112      	cbz	r2, c0de4394 <nbgl_layoutGet+0x44>
c0de438e:	eb09 0500 	add.w	r5, r9, r0
c0de4392:	e003      	b.n	c0de439c <nbgl_layoutGet+0x4c>
c0de4394:	eb09 0500 	add.w	r5, r9, r0
c0de4398:	4449      	add	r1, r9
c0de439a:	604d      	str	r5, [r1, #4]
c0de439c:	4e5d      	ldr	r6, [pc, #372]	@ (c0de4514 <nbgl_layoutGet+0x1c4>)
c0de439e:	4628      	mov	r0, r5
c0de43a0:	21b4      	movs	r1, #180	@ 0xb4
c0de43a2:	f859 7006 	ldr.w	r7, [r9, r6]
c0de43a6:	f008 f807 	bl	c0dec3b8 <__aeabi_memclr>
c0de43aa:	7820      	ldrb	r0, [r4, #0]
c0de43ac:	b150      	cbz	r0, c0de43c4 <nbgl_layoutGet+0x74>
c0de43ae:	485a      	ldr	r0, [pc, #360]	@ (c0de4518 <nbgl_layoutGet+0x1c8>)
c0de43b0:	4448      	add	r0, r9
c0de43b2:	6841      	ldr	r1, [r0, #4]
c0de43b4:	2900      	cmp	r1, #0
c0de43b6:	bf08      	it	eq
c0de43b8:	eb09 0106 	addeq.w	r1, r9, r6
c0de43bc:	600d      	str	r5, [r1, #0]
c0de43be:	6069      	str	r1, [r5, #4]
c0de43c0:	6045      	str	r5, [r0, #4]
c0de43c2:	e001      	b.n	c0de43c8 <nbgl_layoutGet+0x78>
c0de43c4:	f849 7006 	str.w	r7, [r9, r6]
c0de43c8:	4853      	ldr	r0, [pc, #332]	@ (c0de4518 <nbgl_layoutGet+0x1c8>)
c0de43ca:	2100      	movs	r1, #0
c0de43cc:	f809 1000 	strb.w	r1, [r9, r0]
c0de43d0:	68e0      	ldr	r0, [r4, #12]
c0de43d2:	f007 fdcf 	bl	c0debf74 <pic>
c0de43d6:	4629      	mov	r1, r5
c0de43d8:	7826      	ldrb	r6, [r4, #0]
c0de43da:	f811 2fad 	ldrb.w	r2, [r1, #173]!
c0de43de:	784b      	ldrb	r3, [r1, #1]
c0de43e0:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de43e4:	f022 0201 	bic.w	r2, r2, #1
c0de43e8:	4332      	orrs	r2, r6
c0de43ea:	700a      	strb	r2, [r1, #0]
c0de43ec:	f002 02fd 	and.w	r2, r2, #253	@ 0xfd
c0de43f0:	7866      	ldrb	r6, [r4, #1]
c0de43f2:	f841 0c91 	str.w	r0, [r1, #-145]
c0de43f6:	704b      	strb	r3, [r1, #1]
c0de43f8:	f1a1 00a5 	sub.w	r0, r1, #165	@ 0xa5
c0de43fc:	ea42 0246 	orr.w	r2, r2, r6, lsl #1
c0de4400:	700a      	strb	r2, [r1, #0]
c0de4402:	f104 0210 	add.w	r2, r4, #16
c0de4406:	7821      	ldrb	r1, [r4, #0]
c0de4408:	4b44      	ldr	r3, [pc, #272]	@ (c0de451c <nbgl_layoutGet+0x1cc>)
c0de440a:	447b      	add	r3, pc
c0de440c:	b159      	cbz	r1, c0de4426 <nbgl_layoutGet+0xd6>
c0de440e:	2106      	movs	r1, #6
c0de4410:	f007 fbb6 	bl	c0debb80 <nbgl_screenPush>
c0de4414:	f895 10ad 	ldrb.w	r1, [r5, #173]	@ 0xad
c0de4418:	f895 20ae 	ldrb.w	r2, [r5, #174]	@ 0xae
c0de441c:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de4420:	f360 01c7 	bfi	r1, r0, #3, #5
c0de4424:	e00a      	b.n	c0de443c <nbgl_layoutGet+0xec>
c0de4426:	2106      	movs	r1, #6
c0de4428:	f007 fba5 	bl	c0debb76 <nbgl_screenSet>
c0de442c:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de4430:	f895 10ae 	ldrb.w	r1, [r5, #174]	@ 0xae
c0de4434:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de4438:	f020 01f8 	bic.w	r1, r0, #248	@ 0xf8
c0de443c:	462f      	mov	r7, r5
c0de443e:	0a08      	lsrs	r0, r1, #8
c0de4440:	f04f 0a01 	mov.w	sl, #1
c0de4444:	f807 1fad 	strb.w	r1, [r7, #173]!
c0de4448:	7078      	strb	r0, [r7, #1]
c0de444a:	b2c8      	uxtb	r0, r1
c0de444c:	f003 fb69 	bl	c0de7b22 <OUTLINED_FUNCTION_16>
c0de4450:	2102      	movs	r1, #2
c0de4452:	f04f 0800 	mov.w	r8, #0
c0de4456:	f880 a005 	strb.w	sl, [r0, #5]
c0de445a:	71c1      	strb	r1, [r0, #7]
c0de445c:	2158      	movs	r1, #88	@ 0x58
c0de445e:	f880 801f 	strb.w	r8, [r0, #31]
c0de4462:	7181      	strb	r1, [r0, #6]
c0de4464:	21e0      	movs	r1, #224	@ 0xe0
c0de4466:	7101      	strb	r1, [r0, #4]
c0de4468:	f847 0c0d 	str.w	r0, [r7, #-13]
c0de446c:	7838      	ldrb	r0, [r7, #0]
c0de446e:	08c1      	lsrs	r1, r0, #3
c0de4470:	2014      	movs	r0, #20
c0de4472:	f007 fba3 	bl	c0debbbc <nbgl_containerPoolGet>
c0de4476:	f857 2c0d 	ldr.w	r2, [r7, #-13]
c0de447a:	0a03      	lsrs	r3, r0, #8
c0de447c:	f857 1ca5 	ldr.w	r1, [r7, #-165]
c0de4480:	0e06      	lsrs	r6, r0, #24
c0de4482:	f882 3023 	strb.w	r3, [r2, #35]	@ 0x23
c0de4486:	4613      	mov	r3, r2
c0de4488:	f882 a016 	strb.w	sl, [r2, #22]
c0de448c:	f803 0f22 	strb.w	r0, [r3, #34]!
c0de4490:	0c00      	lsrs	r0, r0, #16
c0de4492:	70de      	strb	r6, [r3, #3]
c0de4494:	7098      	strb	r0, [r3, #2]
c0de4496:	604a      	str	r2, [r1, #4]
c0de4498:	7838      	ldrb	r0, [r7, #0]
c0de449a:	7879      	ldrb	r1, [r7, #1]
c0de449c:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de44a0:	f440 4180 	orr.w	r1, r0, #16384	@ 0x4000
c0de44a4:	0a0a      	lsrs	r2, r1, #8
c0de44a6:	707a      	strb	r2, [r7, #1]
c0de44a8:	6862      	ldr	r2, [r4, #4]
c0de44aa:	b362      	cbz	r2, c0de4506 <nbgl_layoutGet+0x1b6>
c0de44ac:	eb0a 2210 	add.w	r2, sl, r0, lsr #8
c0de44b0:	f885 10ad 	strb.w	r1, [r5, #173]	@ 0xad
c0de44b4:	f401 4140 	and.w	r1, r1, #49152	@ 0xc000
c0de44b8:	f3c0 2005 	ubfx	r0, r0, #8, #6
c0de44bc:	f002 023f 	and.w	r2, r2, #63	@ 0x3f
c0de44c0:	eb05 00c0 	add.w	r0, r5, r0, lsl #3
c0de44c4:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de44c8:	2204      	movs	r2, #4
c0de44ca:	0a09      	lsrs	r1, r1, #8
c0de44cc:	f885 10ae 	strb.w	r1, [r5, #174]	@ 0xae
c0de44d0:	f8d5 10a0 	ldr.w	r1, [r5, #160]	@ 0xa0
c0de44d4:	6201      	str	r1, [r0, #32]
c0de44d6:	f881 801d 	strb.w	r8, [r1, #29]
c0de44da:	f881 a01c 	strb.w	sl, [r1, #28]
c0de44de:	778a      	strb	r2, [r1, #30]
c0de44e0:	7a21      	ldrb	r1, [r4, #8]
c0de44e2:	7a63      	ldrb	r3, [r4, #9]
c0de44e4:	f880 3026 	strb.w	r3, [r0, #38]	@ 0x26
c0de44e8:	f880 1024 	strb.w	r1, [r0, #36]	@ 0x24
c0de44ec:	f88d 2000 	strb.w	r2, [sp]
c0de44f0:	6860      	ldr	r0, [r4, #4]
c0de44f2:	f007 fd3f 	bl	c0debf74 <pic>
c0de44f6:	9001      	str	r0, [sp, #4]
c0de44f8:	8920      	ldrh	r0, [r4, #8]
c0de44fa:	4669      	mov	r1, sp
c0de44fc:	f8ad 0008 	strh.w	r0, [sp, #8]
c0de4500:	4628      	mov	r0, r5
c0de4502:	f000 f981 	bl	c0de4808 <nbgl_layoutAddUpFooter>
c0de4506:	4628      	mov	r0, r5
c0de4508:	b005      	add	sp, #20
c0de450a:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de450e:	bf00      	nop
c0de4510:	fffffe98 	.word	0xfffffe98
c0de4514:	000016cc 	.word	0x000016cc
c0de4518:	000018e8 	.word	0x000018e8
c0de451c:	00000113 	.word	0x00000113

c0de4520 <touchCallback>:
c0de4520:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de4524:	2800      	cmp	r0, #0
c0de4526:	f000 816d 	beq.w	c0de4804 <touchCallback+0x2e4>
c0de452a:	460d      	mov	r5, r1
c0de452c:	a901      	add	r1, sp, #4
c0de452e:	466a      	mov	r2, sp
c0de4530:	4604      	mov	r4, r0
c0de4532:	f003 f965 	bl	c0de7800 <getLayoutAndLayoutObj>
c0de4536:	b968      	cbnz	r0, c0de4554 <touchCallback+0x34>
c0de4538:	4620      	mov	r0, r4
c0de453a:	f810 1f0e 	ldrb.w	r1, [r0, #14]!
c0de453e:	f003 fad1 	bl	c0de7ae4 <OUTLINED_FUNCTION_14>
c0de4542:	466a      	mov	r2, sp
c0de4544:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de4548:	a901      	add	r1, sp, #4
c0de454a:	f003 f959 	bl	c0de7800 <getLayoutAndLayoutObj>
c0de454e:	2800      	cmp	r0, #0
c0de4550:	f000 8158 	beq.w	c0de4804 <touchCallback+0x2e4>
c0de4554:	1fe8      	subs	r0, r5, #7
c0de4556:	b2c0      	uxtb	r0, r0
c0de4558:	2803      	cmp	r0, #3
c0de455a:	d833      	bhi.n	c0de45c4 <touchCallback+0xa4>
c0de455c:	7ee0      	ldrb	r0, [r4, #27]
c0de455e:	2801      	cmp	r0, #1
c0de4560:	d130      	bne.n	c0de45c4 <touchCallback+0xa4>
c0de4562:	9901      	ldr	r1, [sp, #4]
c0de4564:	4628      	mov	r0, r5
c0de4566:	f891 20b0 	ldrb.w	r2, [r1, #176]	@ 0xb0
c0de456a:	2a01      	cmp	r2, #1
c0de456c:	d028      	beq.n	c0de45c0 <touchCallback+0xa0>
c0de456e:	bb4a      	cbnz	r2, c0de45c4 <touchCallback+0xa4>
c0de4570:	f8d1 00a0 	ldr.w	r0, [r1, #160]	@ 0xa0
c0de4574:	42a0      	cmp	r0, r4
c0de4576:	d125      	bne.n	c0de45c4 <touchCallback+0xa4>
c0de4578:	f891 00ab 	ldrb.w	r0, [r1, #171]	@ 0xab
c0de457c:	2803      	cmp	r0, #3
c0de457e:	d005      	beq.n	c0de458c <touchCallback+0x6c>
c0de4580:	2804      	cmp	r0, #4
c0de4582:	f040 813f 	bne.w	c0de4804 <touchCallback+0x2e4>
c0de4586:	f101 0010 	add.w	r0, r1, #16
c0de458a:	e00c      	b.n	c0de45a6 <touchCallback+0x86>
c0de458c:	6908      	ldr	r0, [r1, #16]
c0de458e:	f810 2f22 	ldrb.w	r2, [r0, #34]!
c0de4592:	7843      	ldrb	r3, [r0, #1]
c0de4594:	7886      	ldrb	r6, [r0, #2]
c0de4596:	78c0      	ldrb	r0, [r0, #3]
c0de4598:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de459c:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de45a0:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de45a4:	3004      	adds	r0, #4
c0de45a6:	f101 06a9 	add.w	r6, r1, #169	@ 0xa9
c0de45aa:	f891 20a8 	ldrb.w	r2, [r1, #168]	@ 0xa8
c0de45ae:	6800      	ldr	r0, [r0, #0]
c0de45b0:	4629      	mov	r1, r5
c0de45b2:	4633      	mov	r3, r6
c0de45b4:	f003 fccc 	bl	c0de7f50 <layoutNavigationCallback>
c0de45b8:	2800      	cmp	r0, #0
c0de45ba:	f000 8123 	beq.w	c0de4804 <touchCallback+0x2e4>
c0de45be:	7830      	ldrb	r0, [r6, #0]
c0de45c0:	9900      	ldr	r1, [sp, #0]
c0de45c2:	7148      	strb	r0, [r1, #5]
c0de45c4:	4620      	mov	r0, r4
c0de45c6:	9f01      	ldr	r7, [sp, #4]
c0de45c8:	f810 1f0e 	ldrb.w	r1, [r0, #14]!
c0de45cc:	f003 fc15 	bl	c0de7dfa <OUTLINED_FUNCTION_53>
c0de45d0:	6938      	ldr	r0, [r7, #16]
c0de45d2:	4281      	cmp	r1, r0
c0de45d4:	d103      	bne.n	c0de45de <touchCallback+0xbe>
c0de45d6:	f897 20ab 	ldrb.w	r2, [r7, #171]	@ 0xab
c0de45da:	2a04      	cmp	r2, #4
c0de45dc:	d00c      	beq.n	c0de45f8 <touchCallback+0xd8>
c0de45de:	7eca      	ldrb	r2, [r1, #27]
c0de45e0:	2a01      	cmp	r2, #1
c0de45e2:	d118      	bne.n	c0de4616 <touchCallback+0xf6>
c0de45e4:	f811 2f0e 	ldrb.w	r2, [r1, #14]!
c0de45e8:	f003 fa53 	bl	c0de7a92 <OUTLINED_FUNCTION_11>
c0de45ec:	4281      	cmp	r1, r0
c0de45ee:	d112      	bne.n	c0de4616 <touchCallback+0xf6>
c0de45f0:	f897 00ab 	ldrb.w	r0, [r7, #171]	@ 0xab
c0de45f4:	2803      	cmp	r0, #3
c0de45f6:	d10e      	bne.n	c0de4616 <touchCallback+0xf6>
c0de45f8:	f107 06a9 	add.w	r6, r7, #169	@ 0xa9
c0de45fc:	f897 20a8 	ldrb.w	r2, [r7, #168]	@ 0xa8
c0de4600:	4620      	mov	r0, r4
c0de4602:	4629      	mov	r1, r5
c0de4604:	4633      	mov	r3, r6
c0de4606:	f003 fca3 	bl	c0de7f50 <layoutNavigationCallback>
c0de460a:	2800      	cmp	r0, #0
c0de460c:	f000 80fa 	beq.w	c0de4804 <touchCallback+0x2e4>
c0de4610:	7830      	ldrb	r0, [r6, #0]
c0de4612:	9900      	ldr	r1, [sp, #0]
c0de4614:	7148      	strb	r0, [r1, #5]
c0de4616:	7ee0      	ldrb	r0, [r4, #27]
c0de4618:	2801      	cmp	r0, #1
c0de461a:	f040 809b 	bne.w	c0de4754 <touchCallback+0x234>
c0de461e:	f894 0020 	ldrb.w	r0, [r4, #32]
c0de4622:	2802      	cmp	r0, #2
c0de4624:	f0c0 8096 	bcc.w	c0de4754 <touchCallback+0x234>
c0de4628:	4621      	mov	r1, r4
c0de462a:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de462e:	f003 fa30 	bl	c0de7a92 <OUTLINED_FUNCTION_11>
c0de4632:	684e      	ldr	r6, [r1, #4]
c0de4634:	b196      	cbz	r6, c0de465c <touchCallback+0x13c>
c0de4636:	7ef1      	ldrb	r1, [r6, #27]
c0de4638:	2906      	cmp	r1, #6
c0de463a:	d10f      	bne.n	c0de465c <touchCallback+0x13c>
c0de463c:	f896 0021 	ldrb.w	r0, [r6, #33]	@ 0x21
c0de4640:	3801      	subs	r0, #1
c0de4642:	bf18      	it	ne
c0de4644:	2001      	movne	r0, #1
c0de4646:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de464a:	4630      	mov	r0, r6
c0de464c:	f007 fa89 	bl	c0debb62 <nbgl_objDraw>
c0de4650:	f896 0021 	ldrb.w	r0, [r6, #33]	@ 0x21
c0de4654:	9900      	ldr	r1, [sp, #0]
c0de4656:	2401      	movs	r4, #1
c0de4658:	7148      	strb	r0, [r1, #5]
c0de465a:	e07c      	b.n	c0de4756 <touchCallback+0x236>
c0de465c:	2804      	cmp	r0, #4
c0de465e:	d060      	beq.n	c0de4722 <touchCallback+0x202>
c0de4660:	2802      	cmp	r0, #2
c0de4662:	d177      	bne.n	c0de4754 <touchCallback+0x234>
c0de4664:	f003 fb68 	bl	c0de7d38 <OUTLINED_FUNCTION_40>
c0de4668:	6840      	ldr	r0, [r0, #4]
c0de466a:	2800      	cmp	r0, #0
c0de466c:	d072      	beq.n	c0de4754 <touchCallback+0x234>
c0de466e:	7ec0      	ldrb	r0, [r0, #27]
c0de4670:	2809      	cmp	r0, #9
c0de4672:	d16f      	bne.n	c0de4754 <touchCallback+0x234>
c0de4674:	2d00      	cmp	r5, #0
c0de4676:	f040 80c5 	bne.w	c0de4804 <touchCallback+0x2e4>
c0de467a:	f04f 0aff 	mov.w	sl, #255	@ 0xff
c0de467e:	2500      	movs	r5, #0
c0de4680:	f04f 0800 	mov.w	r8, #0
c0de4684:	f897 10ae 	ldrb.w	r1, [r7, #174]	@ 0xae
c0de4688:	fa5f f088 	uxtb.w	r0, r8
c0de468c:	f001 013f 	and.w	r1, r1, #63	@ 0x3f
c0de4690:	4281      	cmp	r1, r0
c0de4692:	d977      	bls.n	c0de4784 <touchCallback+0x264>
c0de4694:	eb07 00c0 	add.w	r0, r7, r0, lsl #3
c0de4698:	6a00      	ldr	r0, [r0, #32]
c0de469a:	42a0      	cmp	r0, r4
c0de469c:	d117      	bne.n	c0de46ce <touchCallback+0x1ae>
c0de469e:	7ee1      	ldrb	r1, [r4, #27]
c0de46a0:	2901      	cmp	r1, #1
c0de46a2:	d114      	bne.n	c0de46ce <touchCallback+0x1ae>
c0de46a4:	4620      	mov	r0, r4
c0de46a6:	46ab      	mov	fp, r5
c0de46a8:	46c2      	mov	sl, r8
c0de46aa:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de46ae:	f003 fa19 	bl	c0de7ae4 <OUTLINED_FUNCTION_14>
c0de46b2:	220c      	movs	r2, #12
c0de46b4:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de46b8:	e9d0 1000 	ldrd	r1, r0, [r0]
c0de46bc:	f881 2022 	strb.w	r2, [r1, #34]	@ 0x22
c0de46c0:	2200      	movs	r2, #0
c0de46c2:	77ca      	strb	r2, [r1, #31]
c0de46c4:	2101      	movs	r1, #1
c0de46c6:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de46ca:	4620      	mov	r0, r4
c0de46cc:	e024      	b.n	c0de4718 <touchCallback+0x1f8>
c0de46ce:	7ec1      	ldrb	r1, [r0, #27]
c0de46d0:	2901      	cmp	r1, #1
c0de46d2:	d123      	bne.n	c0de471c <touchCallback+0x1fc>
c0de46d4:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de46d8:	2902      	cmp	r1, #2
c0de46da:	d11f      	bne.n	c0de471c <touchCallback+0x1fc>
c0de46dc:	4601      	mov	r1, r0
c0de46de:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de46e2:	784b      	ldrb	r3, [r1, #1]
c0de46e4:	788e      	ldrb	r6, [r1, #2]
c0de46e6:	78c9      	ldrb	r1, [r1, #3]
c0de46e8:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de46ec:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de46f0:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
c0de46f4:	6851      	ldr	r1, [r2, #4]
c0de46f6:	7ecb      	ldrb	r3, [r1, #27]
c0de46f8:	2b09      	cmp	r3, #9
c0de46fa:	d10f      	bne.n	c0de471c <touchCallback+0x1fc>
c0de46fc:	f891 3021 	ldrb.w	r3, [r1, #33]	@ 0x21
c0de4700:	3501      	adds	r5, #1
c0de4702:	2b01      	cmp	r3, #1
c0de4704:	d10a      	bne.n	c0de471c <touchCallback+0x1fc>
c0de4706:	6812      	ldr	r2, [r2, #0]
c0de4708:	230b      	movs	r3, #11
c0de470a:	f882 3022 	strb.w	r3, [r2, #34]	@ 0x22
c0de470e:	2301      	movs	r3, #1
c0de4710:	77d3      	strb	r3, [r2, #31]
c0de4712:	2200      	movs	r2, #0
c0de4714:	f881 2021 	strb.w	r2, [r1, #33]	@ 0x21
c0de4718:	f007 fa23 	bl	c0debb62 <nbgl_objDraw>
c0de471c:	f108 0801 	add.w	r8, r8, #1
c0de4720:	e7b0      	b.n	c0de4684 <touchCallback+0x164>
c0de4722:	f003 fb09 	bl	c0de7d38 <OUTLINED_FUNCTION_40>
c0de4726:	68c6      	ldr	r6, [r0, #12]
c0de4728:	b1a6      	cbz	r6, c0de4754 <touchCallback+0x234>
c0de472a:	7ef0      	ldrb	r0, [r6, #27]
c0de472c:	2808      	cmp	r0, #8
c0de472e:	d111      	bne.n	c0de4754 <touchCallback+0x234>
c0de4730:	2d0a      	cmp	r5, #10
c0de4732:	d867      	bhi.n	c0de4804 <touchCallback+0x2e4>
c0de4734:	2001      	movs	r0, #1
c0de4736:	40a8      	lsls	r0, r5
c0de4738:	f410 6fc5 	tst.w	r0, #1576	@ 0x628
c0de473c:	d039      	beq.n	c0de47b2 <touchCallback+0x292>
c0de473e:	f007 fc49 	bl	c0debfd4 <nbgl_wait_pipeline>
c0de4742:	2000      	movs	r0, #0
c0de4744:	f003 faed 	bl	c0de7d22 <OUTLINED_FUNCTION_39>
c0de4748:	2003      	movs	r0, #3
c0de474a:	2100      	movs	r1, #0
c0de474c:	e8bd 4dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de4750:	f007 b9fd 	b.w	c0debb4e <nbgl_refreshSpecialWithPostRefresh>
c0de4754:	2400      	movs	r4, #0
c0de4756:	69f8      	ldr	r0, [r7, #28]
c0de4758:	2800      	cmp	r0, #0
c0de475a:	d053      	beq.n	c0de4804 <touchCallback+0x2e4>
c0de475c:	9d00      	ldr	r5, [sp, #0]
c0de475e:	7928      	ldrb	r0, [r5, #4]
c0de4760:	28ff      	cmp	r0, #255	@ 0xff
c0de4762:	d04f      	beq.n	c0de4804 <touchCallback+0x2e4>
c0de4764:	79a8      	ldrb	r0, [r5, #6]
c0de4766:	280b      	cmp	r0, #11
c0de4768:	bf98      	it	ls
c0de476a:	f7ff fbe9 	blls	c0de3f40 <os_io_seph_cmd_piezo_play_tune>
c0de476e:	b114      	cbz	r4, c0de4776 <touchCallback+0x256>
c0de4770:	2001      	movs	r0, #1
c0de4772:	f007 f9e7 	bl	c0debb44 <nbgl_refreshSpecial>
c0de4776:	7928      	ldrb	r0, [r5, #4]
c0de4778:	7969      	ldrb	r1, [r5, #5]
c0de477a:	69fa      	ldr	r2, [r7, #28]
c0de477c:	b002      	add	sp, #8
c0de477e:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de4782:	4710      	bx	r2
c0de4784:	fa5f f08a 	uxtb.w	r0, sl
c0de4788:	28ff      	cmp	r0, #255	@ 0xff
c0de478a:	d03b      	beq.n	c0de4804 <touchCallback+0x2e4>
c0de478c:	69f9      	ldr	r1, [r7, #28]
c0de478e:	b3c9      	cbz	r1, c0de4804 <touchCallback+0x2e4>
c0de4790:	eb07 04c0 	add.w	r4, r7, r0, lsl #3
c0de4794:	f894 0026 	ldrb.w	r0, [r4, #38]	@ 0x26
c0de4798:	280b      	cmp	r0, #11
c0de479a:	bf98      	it	ls
c0de479c:	f7ff fbd0 	blls	c0de3f40 <os_io_seph_cmd_piezo_play_tune>
c0de47a0:	2001      	movs	r0, #1
c0de47a2:	f007 f9cf 	bl	c0debb44 <nbgl_refreshSpecial>
c0de47a6:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de47aa:	69fa      	ldr	r2, [r7, #28]
c0de47ac:	fa5f f18b 	uxtb.w	r1, fp
c0de47b0:	e7e4      	b.n	c0de477c <touchCallback+0x25c>
c0de47b2:	2d02      	cmp	r5, #2
c0de47b4:	d126      	bne.n	c0de4804 <touchCallback+0x2e4>
c0de47b6:	9d00      	ldr	r5, [sp, #0]
c0de47b8:	4620      	mov	r0, r4
c0de47ba:	f007 fa31 	bl	c0debc20 <nbgl_touchGetTouchDuration>
c0de47be:	f896 1021 	ldrb.w	r1, [r6, #33]	@ 0x21
c0de47c2:	2200      	movs	r2, #0
c0de47c4:	2300      	movs	r3, #0
c0de47c6:	2964      	cmp	r1, #100	@ 0x64
c0de47c8:	bf38      	it	cc
c0de47ca:	2301      	movcc	r3, #1
c0de47cc:	2464      	movs	r4, #100	@ 0x64
c0de47ce:	fbb0 f0f4 	udiv	r0, r0, r4
c0de47d2:	ebc0 00c0 	rsb	r0, r0, r0, lsl #3
c0de47d6:	b2c4      	uxtb	r4, r0
c0de47d8:	2c63      	cmp	r4, #99	@ 0x63
c0de47da:	bf88      	it	hi
c0de47dc:	2201      	movhi	r2, #1
c0de47de:	ea02 0403 	and.w	r4, r2, r3
c0de47e2:	bf88      	it	hi
c0de47e4:	2064      	movhi	r0, #100	@ 0x64
c0de47e6:	b2c2      	uxtb	r2, r0
c0de47e8:	428a      	cmp	r2, r1
c0de47ea:	d005      	beq.n	c0de47f8 <touchCallback+0x2d8>
c0de47ec:	f003 fa99 	bl	c0de7d22 <OUTLINED_FUNCTION_39>
c0de47f0:	2004      	movs	r0, #4
c0de47f2:	2102      	movs	r1, #2
c0de47f4:	f007 f9ab 	bl	c0debb4e <nbgl_refreshSpecialWithPostRefresh>
c0de47f8:	b124      	cbz	r4, c0de4804 <touchCallback+0x2e4>
c0de47fa:	69fa      	ldr	r2, [r7, #28]
c0de47fc:	b112      	cbz	r2, c0de4804 <touchCallback+0x2e4>
c0de47fe:	7928      	ldrb	r0, [r5, #4]
c0de4800:	7969      	ldrb	r1, [r5, #5]
c0de4802:	e7bb      	b.n	c0de477c <touchCallback+0x25c>
c0de4804:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de4808 <nbgl_layoutAddUpFooter>:
c0de4808:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de480c:	2800      	cmp	r0, #0
c0de480e:	f000 827e 	beq.w	c0de4d0e <nbgl_layoutAddUpFooter+0x506>
c0de4812:	460d      	mov	r5, r1
c0de4814:	b119      	cbz	r1, c0de481e <nbgl_layoutAddUpFooter+0x16>
c0de4816:	4604      	mov	r4, r0
c0de4818:	7828      	ldrb	r0, [r5, #0]
c0de481a:	2804      	cmp	r0, #4
c0de481c:	d903      	bls.n	c0de4826 <nbgl_layoutAddUpFooter+0x1e>
c0de481e:	f06f 0001 	mvn.w	r0, #1
c0de4822:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de4826:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de482a:	2601      	movs	r6, #1
c0de482c:	f003 f979 	bl	c0de7b22 <OUTLINED_FUNCTION_16>
c0de4830:	2100      	movs	r1, #0
c0de4832:	7146      	strb	r6, [r0, #5]
c0de4834:	77c1      	strb	r1, [r0, #31]
c0de4836:	21e0      	movs	r1, #224	@ 0xe0
c0de4838:	7101      	strb	r1, [r0, #4]
c0de483a:	6160      	str	r0, [r4, #20]
c0de483c:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4840:	f003 fb1a 	bl	c0de7e78 <OUTLINED_FUNCTION_62>
c0de4844:	6961      	ldr	r1, [r4, #20]
c0de4846:	0a02      	lsrs	r2, r0, #8
c0de4848:	f8d4 30a0 	ldr.w	r3, [r4, #160]	@ 0xa0
c0de484c:	0e06      	lsrs	r6, r0, #24
c0de484e:	f881 2023 	strb.w	r2, [r1, #35]	@ 0x23
c0de4852:	2208      	movs	r2, #8
c0de4854:	f003 fb3c 	bl	c0de7ed0 <OUTLINED_FUNCTION_70>
c0de4858:	4608      	mov	r0, r1
c0de485a:	70d6      	strb	r6, [r2, #3]
c0de485c:	0e1a      	lsrs	r2, r3, #24
c0de485e:	f800 3f12 	strb.w	r3, [r0, #18]!
c0de4862:	70c2      	strb	r2, [r0, #3]
c0de4864:	0c1a      	lsrs	r2, r3, #16
c0de4866:	7082      	strb	r2, [r0, #2]
c0de4868:	0a18      	lsrs	r0, r3, #8
c0de486a:	74c8      	strb	r0, [r1, #19]
c0de486c:	7828      	ldrb	r0, [r5, #0]
c0de486e:	2804      	cmp	r0, #4
c0de4870:	f000 80c6 	beq.w	c0de4a00 <nbgl_layoutAddUpFooter+0x1f8>
c0de4874:	2801      	cmp	r0, #1
c0de4876:	f000 80f1 	beq.w	c0de4a5c <nbgl_layoutAddUpFooter+0x254>
c0de487a:	2802      	cmp	r0, #2
c0de487c:	f000 8153 	beq.w	c0de4b26 <nbgl_layoutAddUpFooter+0x31e>
c0de4880:	2803      	cmp	r0, #3
c0de4882:	f000 81df 	beq.w	c0de4c44 <nbgl_layoutAddUpFooter+0x43c>
c0de4886:	2800      	cmp	r0, #0
c0de4888:	d1c9      	bne.n	c0de481e <nbgl_layoutAddUpFooter+0x16>
c0de488a:	f003 fb13 	bl	c0de7eb4 <OUTLINED_FUNCTION_67>
c0de488e:	2800      	cmp	r0, #0
c0de4890:	f000 823d 	beq.w	c0de4d0e <nbgl_layoutAddUpFooter+0x506>
c0de4894:	6960      	ldr	r0, [r4, #20]
c0de4896:	2104      	movs	r1, #4
c0de4898:	2700      	movs	r7, #0
c0de489a:	f04f 0806 	mov.w	r8, #6
c0de489e:	f880 1020 	strb.w	r1, [r0, #32]
c0de48a2:	2112      	movs	r1, #18
c0de48a4:	71c7      	strb	r7, [r0, #7]
c0de48a6:	f880 801d 	strb.w	r8, [r0, #29]
c0de48aa:	7781      	strb	r1, [r0, #30]
c0de48ac:	2198      	movs	r1, #152	@ 0x98
c0de48ae:	7181      	strb	r1, [r0, #6]
c0de48b0:	212c      	movs	r1, #44	@ 0x2c
c0de48b2:	7701      	strb	r1, [r0, #28]
c0de48b4:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de48b8:	4ee0      	ldr	r6, [pc, #896]	@ (c0de4c3c <nbgl_layoutAddUpFooter+0x434>)
c0de48ba:	08c1      	lsrs	r1, r0, #3
c0de48bc:	447e      	add	r6, pc
c0de48be:	2005      	movs	r0, #5
c0de48c0:	47b0      	blx	r6
c0de48c2:	46b2      	mov	sl, r6
c0de48c4:	4606      	mov	r6, r0
c0de48c6:	7607      	strb	r7, [r0, #24]
c0de48c8:	2020      	movs	r0, #32
c0de48ca:	2103      	movs	r1, #3
c0de48cc:	75f0      	strb	r0, [r6, #23]
c0de48ce:	2058      	movs	r0, #88	@ 0x58
c0de48d0:	f886 8016 	strb.w	r8, [r6, #22]
c0de48d4:	46b0      	mov	r8, r6
c0de48d6:	71f7      	strb	r7, [r6, #7]
c0de48d8:	f886 1021 	strb.w	r1, [r6, #33]	@ 0x21
c0de48dc:	77f7      	strb	r7, [r6, #31]
c0de48de:	f886 7020 	strb.w	r7, [r6, #32]
c0de48e2:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de48e6:	f808 0f04 	strb.w	r0, [r8, #4]!
c0de48ea:	71b0      	strb	r0, [r6, #6]
c0de48ec:	f888 7001 	strb.w	r7, [r8, #1]
c0de48f0:	48d3      	ldr	r0, [pc, #844]	@ (c0de4c40 <nbgl_layoutAddUpFooter+0x438>)
c0de48f2:	4478      	add	r0, pc
c0de48f4:	f007 fb3e 	bl	c0debf74 <pic>
c0de48f8:	4631      	mov	r1, r6
c0de48fa:	0e02      	lsrs	r2, r0, #24
c0de48fc:	f003 f9b3 	bl	c0de7c66 <OUTLINED_FUNCTION_31>
c0de4900:	6960      	ldr	r0, [r4, #20]
c0de4902:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de4906:	7842      	ldrb	r2, [r0, #1]
c0de4908:	7883      	ldrb	r3, [r0, #2]
c0de490a:	78c0      	ldrb	r0, [r0, #3]
c0de490c:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de4910:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de4914:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de4918:	6006      	str	r6, [r0, #0]
c0de491a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de491e:	08c1      	lsrs	r1, r0, #3
c0de4920:	2004      	movs	r0, #4
c0de4922:	47d0      	blx	sl
c0de4924:	77c7      	strb	r7, [r0, #31]
c0de4926:	4606      	mov	r6, r0
c0de4928:	f003 f944 	bl	c0de7bb4 <OUTLINED_FUNCTION_23>
c0de492c:	4601      	mov	r1, r0
c0de492e:	2001      	movs	r0, #1
c0de4930:	f04f 0b04 	mov.w	fp, #4
c0de4934:	2301      	movs	r3, #1
c0de4936:	f886 0024 	strb.w	r0, [r6, #36]	@ 0x24
c0de493a:	200d      	movs	r0, #13
c0de493c:	0e0a      	lsrs	r2, r1, #24
c0de493e:	f886 b020 	strb.w	fp, [r6, #32]
c0de4942:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de4946:	f003 fa40 	bl	c0de7dca <OUTLINED_FUNCTION_50>
c0de494a:	f898 0000 	ldrb.w	r0, [r8]
c0de494e:	f898 2001 	ldrb.w	r2, [r8, #1]
c0de4952:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de4956:	f5c0 70c0 	rsb	r0, r0, #384	@ 0x180
c0de495a:	0a02      	lsrs	r2, r0, #8
c0de495c:	7130      	strb	r0, [r6, #4]
c0de495e:	7172      	strb	r2, [r6, #5]
c0de4960:	b282      	uxth	r2, r0
c0de4962:	f003 fae2 	bl	c0de7f2a <OUTLINED_FUNCTION_78>
c0de4966:	2120      	movs	r1, #32
c0de4968:	71b0      	strb	r0, [r6, #6]
c0de496a:	0a00      	lsrs	r0, r0, #8
c0de496c:	f886 b016 	strb.w	fp, [r6, #22]
c0de4970:	f886 7021 	strb.w	r7, [r6, #33]	@ 0x21
c0de4974:	7637      	strb	r7, [r6, #24]
c0de4976:	f04f 0b04 	mov.w	fp, #4
c0de497a:	75f1      	strb	r1, [r6, #23]
c0de497c:	71f0      	strb	r0, [r6, #7]
c0de497e:	6960      	ldr	r0, [r4, #20]
c0de4980:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de4984:	7842      	ldrb	r2, [r0, #1]
c0de4986:	7883      	ldrb	r3, [r0, #2]
c0de4988:	78c0      	ldrb	r0, [r0, #3]
c0de498a:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de498e:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de4992:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de4996:	6046      	str	r6, [r0, #4]
c0de4998:	f003 f91f 	bl	c0de7bda <OUTLINED_FUNCTION_25>
c0de499c:	2103      	movs	r1, #3
c0de499e:	f04f 0802 	mov.w	r8, #2
c0de49a2:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de49a6:	6961      	ldr	r1, [r4, #20]
c0de49a8:	f880 8016 	strb.w	r8, [r0, #22]
c0de49ac:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de49b0:	784b      	ldrb	r3, [r1, #1]
c0de49b2:	788e      	ldrb	r6, [r1, #2]
c0de49b4:	78c9      	ldrb	r1, [r1, #3]
c0de49b6:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de49ba:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de49be:	2608      	movs	r6, #8
c0de49c0:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de49c4:	6088      	str	r0, [r1, #8]
c0de49c6:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de49ca:	08c1      	lsrs	r1, r0, #3
c0de49cc:	2008      	movs	r0, #8
c0de49ce:	47d0      	blx	sl
c0de49d0:	f890 1022 	ldrb.w	r1, [r0, #34]	@ 0x22
c0de49d4:	f880 b019 	strb.w	fp, [r0, #25]
c0de49d8:	7186      	strb	r6, [r0, #6]
c0de49da:	7687      	strb	r7, [r0, #26]
c0de49dc:	71c7      	strb	r7, [r0, #7]
c0de49de:	f880 8016 	strb.w	r8, [r0, #22]
c0de49e2:	f041 0104 	orr.w	r1, r1, #4
c0de49e6:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de49ea:	2101      	movs	r1, #1
c0de49ec:	7141      	strb	r1, [r0, #5]
c0de49ee:	21e0      	movs	r1, #224	@ 0xe0
c0de49f0:	7101      	strb	r1, [r0, #4]
c0de49f2:	6961      	ldr	r1, [r4, #20]
c0de49f4:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de49f8:	f003 f84b 	bl	c0de7a92 <OUTLINED_FUNCTION_11>
c0de49fc:	60c8      	str	r0, [r1, #12]
c0de49fe:	e1f9      	b.n	c0de4df4 <nbgl_layoutAddUpFooter+0x5ec>
c0de4a00:	f003 fa58 	bl	c0de7eb4 <OUTLINED_FUNCTION_67>
c0de4a04:	2800      	cmp	r0, #0
c0de4a06:	f000 8182 	beq.w	c0de4d0e <nbgl_layoutAddUpFooter+0x506>
c0de4a0a:	6960      	ldr	r0, [r4, #20]
c0de4a0c:	2104      	movs	r1, #4
c0de4a0e:	2701      	movs	r7, #1
c0de4a10:	2260      	movs	r2, #96	@ 0x60
c0de4a12:	7781      	strb	r1, [r0, #30]
c0de4a14:	2100      	movs	r1, #0
c0de4a16:	f880 7020 	strb.w	r7, [r0, #32]
c0de4a1a:	7182      	strb	r2, [r0, #6]
c0de4a1c:	7707      	strb	r7, [r0, #28]
c0de4a1e:	71c1      	strb	r1, [r0, #7]
c0de4a20:	7741      	strb	r1, [r0, #29]
c0de4a22:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4a26:	f002 ff93 	bl	c0de7950 <OUTLINED_FUNCTION_0>
c0de4a2a:	77c7      	strb	r7, [r0, #31]
c0de4a2c:	4606      	mov	r6, r0
c0de4a2e:	f003 f8c1 	bl	c0de7bb4 <OUTLINED_FUNCTION_23>
c0de4a32:	4601      	mov	r1, r0
c0de4a34:	20a0      	movs	r0, #160	@ 0xa0
c0de4a36:	7177      	strb	r7, [r6, #5]
c0de4a38:	f886 7024 	strb.w	r7, [r6, #36]	@ 0x24
c0de4a3c:	2705      	movs	r7, #5
c0de4a3e:	2301      	movs	r3, #1
c0de4a40:	7130      	strb	r0, [r6, #4]
c0de4a42:	200b      	movs	r0, #11
c0de4a44:	0e0a      	lsrs	r2, r1, #24
c0de4a46:	f886 7020 	strb.w	r7, [r6, #32]
c0de4a4a:	f003 f8fd 	bl	c0de7c48 <OUTLINED_FUNCTION_30>
c0de4a4e:	f007 f8c9 	bl	c0debbe4 <nbgl_getTextHeightInWidth>
c0de4a52:	71b0      	strb	r0, [r6, #6]
c0de4a54:	0a00      	lsrs	r0, r0, #8
c0de4a56:	75b7      	strb	r7, [r6, #22]
c0de4a58:	71f0      	strb	r0, [r6, #7]
c0de4a5a:	e056      	b.n	c0de4b0a <nbgl_layoutAddUpFooter+0x302>
c0de4a5c:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4a60:	2705      	movs	r7, #5
c0de4a62:	f003 f862 	bl	c0de7b2a <OUTLINED_FUNCTION_17>
c0de4a66:	4606      	mov	r6, r0
c0de4a68:	7b2a      	ldrb	r2, [r5, #12]
c0de4a6a:	7c2b      	ldrb	r3, [r5, #16]
c0de4a6c:	f002 ffbe 	bl	c0de79ec <OUTLINED_FUNCTION_6>
c0de4a70:	2800      	cmp	r0, #0
c0de4a72:	f000 814c 	beq.w	c0de4d0e <nbgl_layoutAddUpFooter+0x506>
c0de4a76:	6960      	ldr	r0, [r4, #20]
c0de4a78:	75b7      	strb	r7, [r6, #22]
c0de4a7a:	f04f 0801 	mov.w	r8, #1
c0de4a7e:	2700      	movs	r7, #0
c0de4a80:	2188      	movs	r1, #136	@ 0x88
c0de4a82:	f880 8020 	strb.w	r8, [r0, #32]
c0de4a86:	71c7      	strb	r7, [r0, #7]
c0de4a88:	7181      	strb	r1, [r0, #6]
c0de4a8a:	7b68      	ldrb	r0, [r5, #13]
c0de4a8c:	2800      	cmp	r0, #0
c0de4a8e:	bf18      	it	ne
c0de4a90:	2003      	movne	r0, #3
c0de4a92:	77f0      	strb	r0, [r6, #31]
c0de4a94:	f04f 0000 	mov.w	r0, #0
c0de4a98:	bf08      	it	eq
c0de4a9a:	2003      	moveq	r0, #3
c0de4a9c:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de4aa0:	7b68      	ldrb	r0, [r5, #13]
c0de4aa2:	4601      	mov	r1, r0
c0de4aa4:	2800      	cmp	r0, #0
c0de4aa6:	bf18      	it	ne
c0de4aa8:	2101      	movne	r1, #1
c0de4aaa:	0049      	lsls	r1, r1, #1
c0de4aac:	2802      	cmp	r0, #2
c0de4aae:	bf08      	it	eq
c0de4ab0:	2103      	moveq	r1, #3
c0de4ab2:	f886 1020 	strb.w	r1, [r6, #32]
c0de4ab6:	f003 f87d 	bl	c0de7bb4 <OUTLINED_FUNCTION_23>
c0de4aba:	210c      	movs	r1, #12
c0de4abc:	0e02      	lsrs	r2, r0, #24
c0de4abe:	f886 1023 	strb.w	r1, [r6, #35]	@ 0x23
c0de4ac2:	4631      	mov	r1, r6
c0de4ac4:	f003 f8ae 	bl	c0de7c24 <OUTLINED_FUNCTION_28>
c0de4ac8:	f003 f97c 	bl	c0de7dc4 <OUTLINED_FUNCTION_49>
c0de4acc:	4631      	mov	r1, r6
c0de4ace:	0e02      	lsrs	r2, r0, #24
c0de4ad0:	74f7      	strb	r7, [r6, #19]
c0de4ad2:	71f7      	strb	r7, [r6, #7]
c0de4ad4:	f886 8005 	strb.w	r8, [r6, #5]
c0de4ad8:	7777      	strb	r7, [r6, #29]
c0de4ada:	f886 801c 	strb.w	r8, [r6, #28]
c0de4ade:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de4ae2:	70ca      	strb	r2, [r1, #3]
c0de4ae4:	0c02      	lsrs	r2, r0, #16
c0de4ae6:	0a00      	lsrs	r0, r0, #8
c0de4ae8:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de4aec:	4630      	mov	r0, r6
c0de4aee:	708a      	strb	r2, [r1, #2]
c0de4af0:	f800 7f12 	strb.w	r7, [r0, #18]!
c0de4af4:	70c7      	strb	r7, [r0, #3]
c0de4af6:	7087      	strb	r7, [r0, #2]
c0de4af8:	2058      	movs	r0, #88	@ 0x58
c0de4afa:	71b0      	strb	r0, [r6, #6]
c0de4afc:	20a0      	movs	r0, #160	@ 0xa0
c0de4afe:	7130      	strb	r0, [r6, #4]
c0de4b00:	2003      	movs	r0, #3
c0de4b02:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de4b06:	2007      	movs	r0, #7
c0de4b08:	77b0      	strb	r0, [r6, #30]
c0de4b0a:	6960      	ldr	r0, [r4, #20]
c0de4b0c:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de4b10:	7842      	ldrb	r2, [r0, #1]
c0de4b12:	7883      	ldrb	r3, [r0, #2]
c0de4b14:	78c0      	ldrb	r0, [r0, #3]
c0de4b16:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de4b1a:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de4b1e:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de4b22:	6006      	str	r6, [r0, #0]
c0de4b24:	e166      	b.n	c0de4df4 <nbgl_layoutAddUpFooter+0x5ec>
c0de4b26:	6868      	ldr	r0, [r5, #4]
c0de4b28:	2800      	cmp	r0, #0
c0de4b2a:	f000 80f0 	beq.w	c0de4d0e <nbgl_layoutAddUpFooter+0x506>
c0de4b2e:	68a8      	ldr	r0, [r5, #8]
c0de4b30:	2800      	cmp	r0, #0
c0de4b32:	f000 80ec 	beq.w	c0de4d0e <nbgl_layoutAddUpFooter+0x506>
c0de4b36:	f04f 0b00 	mov.w	fp, #0
c0de4b3a:	2088      	movs	r0, #136	@ 0x88
c0de4b3c:	2702      	movs	r7, #2
c0de4b3e:	f881 b007 	strb.w	fp, [r1, #7]
c0de4b42:	7188      	strb	r0, [r1, #6]
c0de4b44:	f881 7020 	strb.w	r7, [r1, #32]
c0de4b48:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4b4c:	f002 ffed 	bl	c0de7b2a <OUTLINED_FUNCTION_17>
c0de4b50:	4606      	mov	r6, r0
c0de4b52:	7b2a      	ldrb	r2, [r5, #12]
c0de4b54:	7bab      	ldrb	r3, [r5, #14]
c0de4b56:	f002 ff49 	bl	c0de79ec <OUTLINED_FUNCTION_6>
c0de4b5a:	2800      	cmp	r0, #0
c0de4b5c:	f000 80d7 	beq.w	c0de4d0e <nbgl_layoutAddUpFooter+0x506>
c0de4b60:	2120      	movs	r1, #32
c0de4b62:	f04f 0a03 	mov.w	sl, #3
c0de4b66:	f04f 0858 	mov.w	r8, #88	@ 0x58
c0de4b6a:	f886 7020 	strb.w	r7, [r6, #32]
c0de4b6e:	f886 b018 	strb.w	fp, [r6, #24]
c0de4b72:	f886 b021 	strb.w	fp, [r6, #33]	@ 0x21
c0de4b76:	f886 b007 	strb.w	fp, [r6, #7]
c0de4b7a:	f886 b005 	strb.w	fp, [r6, #5]
c0de4b7e:	75f1      	strb	r1, [r6, #23]
c0de4b80:	2104      	movs	r1, #4
c0de4b82:	f886 a01f 	strb.w	sl, [r6, #31]
c0de4b86:	f886 a022 	strb.w	sl, [r6, #34]	@ 0x22
c0de4b8a:	75b1      	strb	r1, [r6, #22]
c0de4b8c:	2101      	movs	r1, #1
c0de4b8e:	7141      	strb	r1, [r0, #5]
c0de4b90:	f886 8006 	strb.w	r8, [r6, #6]
c0de4b94:	f886 8004 	strb.w	r8, [r6, #4]
c0de4b98:	f003 f80c 	bl	c0de7bb4 <OUTLINED_FUNCTION_23>
c0de4b9c:	4631      	mov	r1, r6
c0de4b9e:	0e02      	lsrs	r2, r0, #24
c0de4ba0:	f886 b01d 	strb.w	fp, [r6, #29]
c0de4ba4:	f04f 0b01 	mov.w	fp, #1
c0de4ba8:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de4bac:	f886 b01c 	strb.w	fp, [r6, #28]
c0de4bb0:	70ca      	strb	r2, [r1, #3]
c0de4bb2:	0c02      	lsrs	r2, r0, #16
c0de4bb4:	0a00      	lsrs	r0, r0, #8
c0de4bb6:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de4bba:	200c      	movs	r0, #12
c0de4bbc:	708a      	strb	r2, [r1, #2]
c0de4bbe:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de4bc2:	200a      	movs	r0, #10
c0de4bc4:	f003 f883 	bl	c0de7cce <OUTLINED_FUNCTION_36>
c0de4bc8:	6006      	str	r6, [r0, #0]
c0de4bca:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4bce:	f002 ffac 	bl	c0de7b2a <OUTLINED_FUNCTION_17>
c0de4bd2:	4606      	mov	r6, r0
c0de4bd4:	7b6a      	ldrb	r2, [r5, #13]
c0de4bd6:	7bab      	ldrb	r3, [r5, #14]
c0de4bd8:	f002 ff08 	bl	c0de79ec <OUTLINED_FUNCTION_6>
c0de4bdc:	2800      	cmp	r0, #0
c0de4bde:	f000 8096 	beq.w	c0de4d0e <nbgl_layoutAddUpFooter+0x506>
c0de4be2:	2700      	movs	r7, #0
c0de4be4:	2120      	movs	r1, #32
c0de4be6:	f886 a021 	strb.w	sl, [r6, #33]	@ 0x21
c0de4bea:	f886 a022 	strb.w	sl, [r6, #34]	@ 0x22
c0de4bee:	f886 b005 	strb.w	fp, [r6, #5]
c0de4bf2:	75f1      	strb	r1, [r6, #23]
c0de4bf4:	7147      	strb	r7, [r0, #5]
c0de4bf6:	2106      	movs	r1, #6
c0de4bf8:	2038      	movs	r0, #56	@ 0x38
c0de4bfa:	f886 7020 	strb.w	r7, [r6, #32]
c0de4bfe:	77f7      	strb	r7, [r6, #31]
c0de4c00:	7637      	strb	r7, [r6, #24]
c0de4c02:	71f7      	strb	r7, [r6, #7]
c0de4c04:	f886 8006 	strb.w	r8, [r6, #6]
c0de4c08:	75b1      	strb	r1, [r6, #22]
c0de4c0a:	7130      	strb	r0, [r6, #4]
c0de4c0c:	f003 f8da 	bl	c0de7dc4 <OUTLINED_FUNCTION_49>
c0de4c10:	4631      	mov	r1, r6
c0de4c12:	0e02      	lsrs	r2, r0, #24
c0de4c14:	f886 b01c 	strb.w	fp, [r6, #28]
c0de4c18:	7777      	strb	r7, [r6, #29]
c0de4c1a:	f801 0f25 	strb.w	r0, [r1, #37]!
c0de4c1e:	70ca      	strb	r2, [r1, #3]
c0de4c20:	0c02      	lsrs	r2, r0, #16
c0de4c22:	0a00      	lsrs	r0, r0, #8
c0de4c24:	f886 0026 	strb.w	r0, [r6, #38]	@ 0x26
c0de4c28:	200c      	movs	r0, #12
c0de4c2a:	708a      	strb	r2, [r1, #2]
c0de4c2c:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de4c30:	2009      	movs	r0, #9
c0de4c32:	f003 f84c 	bl	c0de7cce <OUTLINED_FUNCTION_36>
c0de4c36:	6046      	str	r6, [r0, #4]
c0de4c38:	e0dc      	b.n	c0de4df4 <nbgl_layoutAddUpFooter+0x5ec>
c0de4c3a:	bf00      	nop
c0de4c3c:	000072f3 	.word	0x000072f3
c0de4c40:	00008769 	.word	0x00008769
c0de4c44:	6868      	ldr	r0, [r5, #4]
c0de4c46:	2800      	cmp	r0, #0
c0de4c48:	d061      	beq.n	c0de4d0e <nbgl_layoutAddUpFooter+0x506>
c0de4c4a:	7b2a      	ldrb	r2, [r5, #12]
c0de4c4c:	7b6b      	ldrb	r3, [r5, #13]
c0de4c4e:	4620      	mov	r0, r4
c0de4c50:	f7ff fb5c 	bl	c0de430c <layoutAddCallbackObj>
c0de4c54:	2800      	cmp	r0, #0
c0de4c56:	d05a      	beq.n	c0de4d0e <nbgl_layoutAddUpFooter+0x506>
c0de4c58:	6960      	ldr	r0, [r4, #20]
c0de4c5a:	f04f 0803 	mov.w	r8, #3
c0de4c5e:	2113      	movs	r1, #19
c0de4c60:	f04f 0a00 	mov.w	sl, #0
c0de4c64:	2701      	movs	r7, #1
c0de4c66:	f04f 0b04 	mov.w	fp, #4
c0de4c6a:	f880 8020 	strb.w	r8, [r0, #32]
c0de4c6e:	7781      	strb	r1, [r0, #30]
c0de4c70:	f880 a01d 	strb.w	sl, [r0, #29]
c0de4c74:	7707      	strb	r7, [r0, #28]
c0de4c76:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4c7a:	f002 fe69 	bl	c0de7950 <OUTLINED_FUNCTION_0>
c0de4c7e:	f880 a01f 	strb.w	sl, [r0, #31]
c0de4c82:	4606      	mov	r6, r0
c0de4c84:	f002 ff96 	bl	c0de7bb4 <OUTLINED_FUNCTION_23>
c0de4c88:	22a0      	movs	r2, #160	@ 0xa0
c0de4c8a:	4601      	mov	r1, r0
c0de4c8c:	200b      	movs	r0, #11
c0de4c8e:	f886 7024 	strb.w	r7, [r6, #36]	@ 0x24
c0de4c92:	f886 b020 	strb.w	fp, [r6, #32]
c0de4c96:	7177      	strb	r7, [r6, #5]
c0de4c98:	7132      	strb	r2, [r6, #4]
c0de4c9a:	4632      	mov	r2, r6
c0de4c9c:	0e0b      	lsrs	r3, r1, #24
c0de4c9e:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de4ca2:	f802 1f26 	strb.w	r1, [r2, #38]!
c0de4ca6:	70d3      	strb	r3, [r2, #3]
c0de4ca8:	0c0b      	lsrs	r3, r1, #16
c0de4caa:	7093      	strb	r3, [r2, #2]
c0de4cac:	0a0a      	lsrs	r2, r1, #8
c0de4cae:	f886 2027 	strb.w	r2, [r6, #39]	@ 0x27
c0de4cb2:	68aa      	ldr	r2, [r5, #8]
c0de4cb4:	b37a      	cbz	r2, c0de4d16 <nbgl_layoutAddUpFooter+0x50e>
c0de4cb6:	4610      	mov	r0, r2
c0de4cb8:	f007 f95c 	bl	c0debf74 <pic>
c0de4cbc:	4633      	mov	r3, r6
c0de4cbe:	4601      	mov	r1, r0
c0de4cc0:	f813 cf26 	ldrb.w	ip, [r3, #38]!
c0de4cc4:	f813 ed22 	ldrb.w	lr, [r3, #-34]!
c0de4cc8:	785a      	ldrb	r2, [r3, #1]
c0de4cca:	7f98      	ldrb	r0, [r3, #30]
c0de4ccc:	f893 7020 	ldrb.w	r7, [r3, #32]
c0de4cd0:	f893 8023 	ldrb.w	r8, [r3, #35]	@ 0x23
c0de4cd4:	ea4e 2e02 	orr.w	lr, lr, r2, lsl #8
c0de4cd8:	780a      	ldrb	r2, [r1, #0]
c0de4cda:	7849      	ldrb	r1, [r1, #1]
c0de4cdc:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de4ce0:	ebae 0101 	sub.w	r1, lr, r1
c0de4ce4:	f1a1 0220 	sub.w	r2, r1, #32
c0de4ce8:	0a11      	lsrs	r1, r2, #8
c0de4cea:	701a      	strb	r2, [r3, #0]
c0de4cec:	7059      	strb	r1, [r3, #1]
c0de4cee:	f893 1025 	ldrb.w	r1, [r3, #37]	@ 0x25
c0de4cf2:	f893 3024 	ldrb.w	r3, [r3, #36]	@ 0x24
c0de4cf6:	2f00      	cmp	r7, #0
c0de4cf8:	bf18      	it	ne
c0de4cfa:	2701      	movne	r7, #1
c0de4cfc:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de4d00:	ea4c 2308 	orr.w	r3, ip, r8, lsl #8
c0de4d04:	f04f 0803 	mov.w	r8, #3
c0de4d08:	ea43 4101 	orr.w	r1, r3, r1, lsl #16
c0de4d0c:	e005      	b.n	c0de4d1a <nbgl_layoutAddUpFooter+0x512>
c0de4d0e:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de4d12:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de4d16:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de4d1a:	b292      	uxth	r2, r2
c0de4d1c:	463b      	mov	r3, r7
c0de4d1e:	f006 ff61 	bl	c0debbe4 <nbgl_getTextHeightInWidth>
c0de4d22:	6961      	ldr	r1, [r4, #20]
c0de4d24:	f886 a018 	strb.w	sl, [r6, #24]
c0de4d28:	f886 b016 	strb.w	fp, [r6, #22]
c0de4d2c:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de4d30:	784b      	ldrb	r3, [r1, #1]
c0de4d32:	788f      	ldrb	r7, [r1, #2]
c0de4d34:	78c9      	ldrb	r1, [r1, #3]
c0de4d36:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de4d3a:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de4d3e:	2720      	movs	r7, #32
c0de4d40:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de4d44:	600e      	str	r6, [r1, #0]
c0de4d46:	75f7      	strb	r7, [r6, #23]
c0de4d48:	71b0      	strb	r0, [r6, #6]
c0de4d4a:	0a01      	lsrs	r1, r0, #8
c0de4d4c:	6962      	ldr	r2, [r4, #20]
c0de4d4e:	71f1      	strb	r1, [r6, #7]
c0de4d50:	71d1      	strb	r1, [r2, #7]
c0de4d52:	7190      	strb	r0, [r2, #6]
c0de4d54:	f002 ff41 	bl	c0de7bda <OUTLINED_FUNCTION_25>
c0de4d58:	2102      	movs	r1, #2
c0de4d5a:	f880 8022 	strb.w	r8, [r0, #34]	@ 0x22
c0de4d5e:	7581      	strb	r1, [r0, #22]
c0de4d60:	6961      	ldr	r1, [r4, #20]
c0de4d62:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de4d66:	f002 fe94 	bl	c0de7a92 <OUTLINED_FUNCTION_11>
c0de4d6a:	6048      	str	r0, [r1, #4]
c0de4d6c:	68a8      	ldr	r0, [r5, #8]
c0de4d6e:	b3c0      	cbz	r0, c0de4de2 <nbgl_layoutAddUpFooter+0x5da>
c0de4d70:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4d74:	f002 ff08 	bl	c0de7b88 <OUTLINED_FUNCTION_21>
c0de4d78:	4606      	mov	r6, r0
c0de4d7a:	2000      	movs	r0, #0
c0de4d7c:	7630      	strb	r0, [r6, #24]
c0de4d7e:	77f0      	strb	r0, [r6, #31]
c0de4d80:	2006      	movs	r0, #6
c0de4d82:	75f7      	strb	r7, [r6, #23]
c0de4d84:	75b0      	strb	r0, [r6, #22]
c0de4d86:	f003 f81d 	bl	c0de7dc4 <OUTLINED_FUNCTION_49>
c0de4d8a:	4631      	mov	r1, r6
c0de4d8c:	0e02      	lsrs	r2, r0, #24
c0de4d8e:	f003 f84b 	bl	c0de7e28 <OUTLINED_FUNCTION_56>
c0de4d92:	6960      	ldr	r0, [r4, #20]
c0de4d94:	f810 2f22 	ldrb.w	r2, [r0, #34]!
c0de4d98:	7843      	ldrb	r3, [r0, #1]
c0de4d9a:	7887      	ldrb	r7, [r0, #2]
c0de4d9c:	78c0      	ldrb	r0, [r0, #3]
c0de4d9e:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de4da2:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de4da6:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de4daa:	6086      	str	r6, [r0, #8]
c0de4dac:	f896 0022 	ldrb.w	r0, [r6, #34]	@ 0x22
c0de4db0:	780a      	ldrb	r2, [r1, #0]
c0de4db2:	788b      	ldrb	r3, [r1, #2]
c0de4db4:	78c9      	ldrb	r1, [r1, #3]
c0de4db6:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de4dba:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de4dbe:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de4dc2:	7881      	ldrb	r1, [r0, #2]
c0de4dc4:	78c0      	ldrb	r0, [r0, #3]
c0de4dc6:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
c0de4dca:	6960      	ldr	r0, [r4, #20]
c0de4dcc:	7982      	ldrb	r2, [r0, #6]
c0de4dce:	79c3      	ldrb	r3, [r0, #7]
c0de4dd0:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de4dd4:	428a      	cmp	r2, r1
c0de4dd6:	bf2f      	iteee	cs
c0de4dd8:	4611      	movcs	r1, r2
c0de4dda:	7181      	strbcc	r1, [r0, #6]
c0de4ddc:	0a0a      	lsrcc	r2, r1, #8
c0de4dde:	71c2      	strbcc	r2, [r0, #7]
c0de4de0:	e004      	b.n	c0de4dec <nbgl_layoutAddUpFooter+0x5e4>
c0de4de2:	6960      	ldr	r0, [r4, #20]
c0de4de4:	7981      	ldrb	r1, [r0, #6]
c0de4de6:	79c2      	ldrb	r2, [r0, #7]
c0de4de8:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de4dec:	3130      	adds	r1, #48	@ 0x30
c0de4dee:	7181      	strb	r1, [r0, #6]
c0de4df0:	0a09      	lsrs	r1, r1, #8
c0de4df2:	71c1      	strb	r1, [r0, #7]
c0de4df4:	f8d4 20a0 	ldr.w	r2, [r4, #160]	@ 0xa0
c0de4df8:	6961      	ldr	r1, [r4, #20]
c0de4dfa:	68a0      	ldr	r0, [r4, #8]
c0de4dfc:	f812 3f06 	ldrb.w	r3, [r2, #6]!
c0de4e00:	79cf      	ldrb	r7, [r1, #7]
c0de4e02:	7856      	ldrb	r6, [r2, #1]
c0de4e04:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de4e08:	798e      	ldrb	r6, [r1, #6]
c0de4e0a:	ea46 2607 	orr.w	r6, r6, r7, lsl #8
c0de4e0e:	1b9b      	subs	r3, r3, r6
c0de4e10:	7013      	strb	r3, [r2, #0]
c0de4e12:	6101      	str	r1, [r0, #16]
c0de4e14:	0a1b      	lsrs	r3, r3, #8
c0de4e16:	6960      	ldr	r0, [r4, #20]
c0de4e18:	7053      	strb	r3, [r2, #1]
c0de4e1a:	782a      	ldrb	r2, [r5, #0]
c0de4e1c:	7981      	ldrb	r1, [r0, #6]
c0de4e1e:	79c0      	ldrb	r0, [r0, #7]
c0de4e20:	f884 20ac 	strb.w	r2, [r4, #172]	@ 0xac
c0de4e24:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de4e28:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de4e2c <nbgl_layoutAddSwipe>:
c0de4e2c:	b3d8      	cbz	r0, c0de4ea6 <nbgl_layoutAddSwipe+0x7a>
c0de4e2e:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de4e32:	f8dd 8020 	ldr.w	r8, [sp, #32]
c0de4e36:	461c      	mov	r4, r3
c0de4e38:	4617      	mov	r7, r2
c0de4e3a:	460d      	mov	r5, r1
c0de4e3c:	4606      	mov	r6, r0
c0de4e3e:	b342      	cbz	r2, c0de4e92 <nbgl_layoutAddSwipe+0x66>
c0de4e40:	2004      	movs	r0, #4
c0de4e42:	2100      	movs	r1, #0
c0de4e44:	f04f 0a00 	mov.w	sl, #0
c0de4e48:	f006 feb3 	bl	c0debbb2 <nbgl_objPoolGet>
c0de4e4c:	61b0      	str	r0, [r6, #24]
c0de4e4e:	4638      	mov	r0, r7
c0de4e50:	f007 f890 	bl	c0debf74 <pic>
c0de4e54:	69b1      	ldr	r1, [r6, #24]
c0de4e56:	f002 ff7c 	bl	c0de7d52 <OUTLINED_FUNCTION_41>
c0de4e5a:	7048      	strb	r0, [r1, #1]
c0de4e5c:	2001      	movs	r0, #1
c0de4e5e:	22a0      	movs	r2, #160	@ 0xa0
c0de4e60:	f801 2c22 	strb.w	r2, [r1, #-34]
c0de4e64:	220b      	movs	r2, #11
c0de4e66:	f801 0c21 	strb.w	r0, [r1, #-33]
c0de4e6a:	f801 0c07 	strb.w	r0, [r1, #-7]
c0de4e6e:	200b      	movs	r0, #11
c0de4e70:	f801 2c04 	strb.w	r2, [r1, #-4]
c0de4e74:	f006 feb1 	bl	c0debbda <nbgl_getFontLineHeight>
c0de4e78:	69b1      	ldr	r1, [r6, #24]
c0de4e7a:	7188      	strb	r0, [r1, #6]
c0de4e7c:	201e      	movs	r0, #30
c0de4e7e:	f881 a007 	strb.w	sl, [r1, #7]
c0de4e82:	f881 a01a 	strb.w	sl, [r1, #26]
c0de4e86:	7648      	strb	r0, [r1, #25]
c0de4e88:	2005      	movs	r0, #5
c0de4e8a:	f881 0020 	strb.w	r0, [r1, #32]
c0de4e8e:	2008      	movs	r0, #8
c0de4e90:	7588      	strb	r0, [r1, #22]
c0de4e92:	4630      	mov	r0, r6
c0de4e94:	4629      	mov	r1, r5
c0de4e96:	2201      	movs	r2, #1
c0de4e98:	4623      	mov	r3, r4
c0de4e9a:	f8cd 8000 	str.w	r8, [sp]
c0de4e9e:	f000 f804 	bl	c0de4eaa <addSwipeInternal>
c0de4ea2:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0de4ea6:	f002 bf0f 	b.w	c0de7cc8 <OUTLINED_FUNCTION_35>

c0de4eaa <addSwipeInternal>:
c0de4eaa:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de4eac:	f411 6ff0 	tst.w	r1, #1920	@ 0x780
c0de4eb0:	d013      	beq.n	c0de4eda <addSwipeInternal+0x30>
c0de4eb2:	9f06      	ldr	r7, [sp, #24]
c0de4eb4:	460c      	mov	r4, r1
c0de4eb6:	f8d0 10a0 	ldr.w	r1, [r0, #160]	@ 0xa0
c0de4eba:	4615      	mov	r5, r2
c0de4ebc:	461a      	mov	r2, r3
c0de4ebe:	4606      	mov	r6, r0
c0de4ec0:	463b      	mov	r3, r7
c0de4ec2:	f7ff fa23 	bl	c0de430c <layoutAddCallbackObj>
c0de4ec6:	b140      	cbz	r0, c0de4eda <addSwipeInternal+0x30>
c0de4ec8:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de4ecc:	0a21      	lsrs	r1, r4, #8
c0de4ece:	f886 50b0 	strb.w	r5, [r6, #176]	@ 0xb0
c0de4ed2:	7741      	strb	r1, [r0, #29]
c0de4ed4:	7704      	strb	r4, [r0, #28]
c0de4ed6:	2000      	movs	r0, #0
c0de4ed8:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de4eda:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de4ede:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0de4ee0 <nbgl_layoutAddTopRightButton>:
c0de4ee0:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de4ee4:	b398      	cbz	r0, c0de4f4e <nbgl_layoutAddTopRightButton+0x6e>
c0de4ee6:	f003 f823 	bl	c0de7f30 <OUTLINED_FUNCTION_79>
c0de4eea:	4688      	mov	r8, r1
c0de4eec:	461f      	mov	r7, r3
c0de4eee:	4615      	mov	r5, r2
c0de4ef0:	f04f 0a05 	mov.w	sl, #5
c0de4ef4:	f002 fe19 	bl	c0de7b2a <OUTLINED_FUNCTION_17>
c0de4ef8:	4606      	mov	r6, r0
c0de4efa:	4620      	mov	r0, r4
c0de4efc:	462a      	mov	r2, r5
c0de4efe:	463b      	mov	r3, r7
c0de4f00:	f002 fe3f 	bl	c0de7b82 <OUTLINED_FUNCTION_20>
c0de4f04:	b318      	cbz	r0, c0de4f4e <nbgl_layoutAddTopRightButton+0x6e>
c0de4f06:	2058      	movs	r0, #88	@ 0x58
c0de4f08:	2700      	movs	r7, #0
c0de4f0a:	2503      	movs	r5, #3
c0de4f0c:	f886 a01e 	strb.w	sl, [r6, #30]
c0de4f10:	71b0      	strb	r0, [r6, #6]
c0de4f12:	7130      	strb	r0, [r6, #4]
c0de4f14:	2020      	movs	r0, #32
c0de4f16:	71f7      	strb	r7, [r6, #7]
c0de4f18:	7177      	strb	r7, [r6, #5]
c0de4f1a:	76b7      	strb	r7, [r6, #26]
c0de4f1c:	7637      	strb	r7, [r6, #24]
c0de4f1e:	7777      	strb	r7, [r6, #29]
c0de4f20:	f886 5022 	strb.w	r5, [r6, #34]	@ 0x22
c0de4f24:	f886 7021 	strb.w	r7, [r6, #33]	@ 0x21
c0de4f28:	77f5      	strb	r5, [r6, #31]
c0de4f2a:	7670      	strb	r0, [r6, #25]
c0de4f2c:	75f0      	strb	r0, [r6, #23]
c0de4f2e:	2001      	movs	r0, #1
c0de4f30:	7730      	strb	r0, [r6, #28]
c0de4f32:	2002      	movs	r0, #2
c0de4f34:	f886 0020 	strb.w	r0, [r6, #32]
c0de4f38:	4640      	mov	r0, r8
c0de4f3a:	f007 f81b 	bl	c0debf74 <pic>
c0de4f3e:	4631      	mov	r1, r6
c0de4f40:	0e02      	lsrs	r2, r0, #24
c0de4f42:	75b5      	strb	r5, [r6, #22]
c0de4f44:	f002 fe8f 	bl	c0de7c66 <OUTLINED_FUNCTION_31>
c0de4f48:	68a0      	ldr	r0, [r4, #8]
c0de4f4a:	6086      	str	r6, [r0, #8]
c0de4f4c:	e001      	b.n	c0de4f52 <nbgl_layoutAddTopRightButton+0x72>
c0de4f4e:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de4f52:	4638      	mov	r0, r7
c0de4f54:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}

c0de4f58 <nbgl_layoutAddExtendedFooter>:
c0de4f58:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de4f5c:	2800      	cmp	r0, #0
c0de4f5e:	f000 834b 	beq.w	c0de55f8 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de4f62:	460d      	mov	r5, r1
c0de4f64:	b119      	cbz	r1, c0de4f6e <nbgl_layoutAddExtendedFooter+0x16>
c0de4f66:	4604      	mov	r4, r0
c0de4f68:	7828      	ldrb	r0, [r5, #0]
c0de4f6a:	2806      	cmp	r0, #6
c0de4f6c:	d902      	bls.n	c0de4f74 <nbgl_layoutAddExtendedFooter+0x1c>
c0de4f6e:	f06f 0701 	mvn.w	r7, #1
c0de4f72:	e343      	b.n	c0de55fc <nbgl_layoutAddExtendedFooter+0x6a4>
c0de4f74:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4f78:	2601      	movs	r6, #1
c0de4f7a:	f002 fdd2 	bl	c0de7b22 <OUTLINED_FUNCTION_16>
c0de4f7e:	2100      	movs	r1, #0
c0de4f80:	7146      	strb	r6, [r0, #5]
c0de4f82:	77c1      	strb	r1, [r0, #31]
c0de4f84:	21a0      	movs	r1, #160	@ 0xa0
c0de4f86:	7101      	strb	r1, [r0, #4]
c0de4f88:	6120      	str	r0, [r4, #16]
c0de4f8a:	f002 ff7d 	bl	c0de7e88 <OUTLINED_FUNCTION_64>
c0de4f8e:	4601      	mov	r1, r0
c0de4f90:	0a02      	lsrs	r2, r0, #8
c0de4f92:	6920      	ldr	r0, [r4, #16]
c0de4f94:	0e0b      	lsrs	r3, r1, #24
c0de4f96:	f880 2023 	strb.w	r2, [r0, #35]	@ 0x23
c0de4f9a:	2208      	movs	r2, #8
c0de4f9c:	7582      	strb	r2, [r0, #22]
c0de4f9e:	4602      	mov	r2, r0
c0de4fa0:	f802 1f22 	strb.w	r1, [r2, #34]!
c0de4fa4:	0c09      	lsrs	r1, r1, #16
c0de4fa6:	7091      	strb	r1, [r2, #2]
c0de4fa8:	70d3      	strb	r3, [r2, #3]
c0de4faa:	7829      	ldrb	r1, [r5, #0]
c0de4fac:	2906      	cmp	r1, #6
c0de4fae:	d017      	beq.n	c0de4fe0 <nbgl_layoutAddExtendedFooter+0x88>
c0de4fb0:	2901      	cmp	r1, #1
c0de4fb2:	f000 80be 	beq.w	c0de5132 <nbgl_layoutAddExtendedFooter+0x1da>
c0de4fb6:	2902      	cmp	r1, #2
c0de4fb8:	f000 80f7 	beq.w	c0de51aa <nbgl_layoutAddExtendedFooter+0x252>
c0de4fbc:	2903      	cmp	r1, #3
c0de4fbe:	f000 8184 	beq.w	c0de52ca <nbgl_layoutAddExtendedFooter+0x372>
c0de4fc2:	2904      	cmp	r1, #4
c0de4fc4:	f000 8249 	beq.w	c0de545a <nbgl_layoutAddExtendedFooter+0x502>
c0de4fc8:	2905      	cmp	r1, #5
c0de4fca:	f000 8269 	beq.w	c0de54a0 <nbgl_layoutAddExtendedFooter+0x548>
c0de4fce:	2900      	cmp	r1, #0
c0de4fd0:	d1cd      	bne.n	c0de4f6e <nbgl_layoutAddExtendedFooter+0x16>
c0de4fd2:	88a9      	ldrh	r1, [r5, #4]
c0de4fd4:	f04f 0800 	mov.w	r8, #0
c0de4fd8:	7181      	strb	r1, [r0, #6]
c0de4fda:	0a09      	lsrs	r1, r1, #8
c0de4fdc:	71c1      	strb	r1, [r0, #7]
c0de4fde:	e2db      	b.n	c0de5598 <nbgl_layoutAddExtendedFooter+0x640>
c0de4fe0:	68a8      	ldr	r0, [r5, #8]
c0de4fe2:	2800      	cmp	r0, #0
c0de4fe4:	f000 8308 	beq.w	c0de55f8 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de4fe8:	6868      	ldr	r0, [r5, #4]
c0de4fea:	2800      	cmp	r0, #0
c0de4fec:	f000 8304 	beq.w	c0de55f8 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de4ff0:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4ff4:	f002 fd99 	bl	c0de7b2a <OUTLINED_FUNCTION_17>
c0de4ff8:	4606      	mov	r6, r0
c0de4ffa:	7c2a      	ldrb	r2, [r5, #16]
c0de4ffc:	7cab      	ldrb	r3, [r5, #18]
c0de4ffe:	f002 fcf5 	bl	c0de79ec <OUTLINED_FUNCTION_6>
c0de5002:	2800      	cmp	r0, #0
c0de5004:	f000 82f8 	beq.w	c0de55f8 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de5008:	2103      	movs	r1, #3
c0de500a:	2208      	movs	r2, #8
c0de500c:	f04f 0801 	mov.w	r8, #1
c0de5010:	f04f 0a00 	mov.w	sl, #0
c0de5014:	75b2      	strb	r2, [r6, #22]
c0de5016:	77f1      	strb	r1, [r6, #31]
c0de5018:	f880 8005 	strb.w	r8, [r0, #5]
c0de501c:	2258      	movs	r2, #88	@ 0x58
c0de501e:	7c68      	ldrb	r0, [r5, #17]
c0de5020:	71b2      	strb	r2, [r6, #6]
c0de5022:	22a0      	movs	r2, #160	@ 0xa0
c0de5024:	f886 a021 	strb.w	sl, [r6, #33]	@ 0x21
c0de5028:	f886 a01a 	strb.w	sl, [r6, #26]
c0de502c:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de5030:	f886 a007 	strb.w	sl, [r6, #7]
c0de5034:	f886 8005 	strb.w	r8, [r6, #5]
c0de5038:	7132      	strb	r2, [r6, #4]
c0de503a:	2803      	cmp	r0, #3
c0de503c:	f04f 0004 	mov.w	r0, #4
c0de5040:	bf08      	it	eq
c0de5042:	2102      	moveq	r1, #2
c0de5044:	f886 1020 	strb.w	r1, [r6, #32]
c0de5048:	bf08      	it	eq
c0de504a:	2018      	moveq	r0, #24
c0de504c:	7670      	strb	r0, [r6, #25]
c0de504e:	f002 feb9 	bl	c0de7dc4 <OUTLINED_FUNCTION_49>
c0de5052:	f002 fefb 	bl	c0de7e4c <OUTLINED_FUNCTION_58>
c0de5056:	f002 fde5 	bl	c0de7c24 <OUTLINED_FUNCTION_28>
c0de505a:	f002 fd6a 	bl	c0de7b32 <OUTLINED_FUNCTION_18>
c0de505e:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de5062:	200a      	movs	r0, #10
c0de5064:	77b0      	strb	r0, [r6, #30]
c0de5066:	6920      	ldr	r0, [r4, #16]
c0de5068:	f002 fc76 	bl	c0de7958 <OUTLINED_FUNCTION_1>
c0de506c:	7c68      	ldrb	r0, [r5, #17]
c0de506e:	b1c0      	cbz	r0, c0de50a2 <nbgl_layoutAddExtendedFooter+0x14a>
c0de5070:	2803      	cmp	r0, #3
c0de5072:	d016      	beq.n	c0de50a2 <nbgl_layoutAddExtendedFooter+0x14a>
c0de5074:	f002 fdb1 	bl	c0de7bda <OUTLINED_FUNCTION_25>
c0de5078:	0a31      	lsrs	r1, r6, #8
c0de507a:	0e32      	lsrs	r2, r6, #24
c0de507c:	74c1      	strb	r1, [r0, #19]
c0de507e:	4601      	mov	r1, r0
c0de5080:	f801 6f12 	strb.w	r6, [r1, #18]!
c0de5084:	70ca      	strb	r2, [r1, #3]
c0de5086:	0c32      	lsrs	r2, r6, #16
c0de5088:	708a      	strb	r2, [r1, #2]
c0de508a:	6921      	ldr	r1, [r4, #16]
c0de508c:	f002 fc91 	bl	c0de79b2 <OUTLINED_FUNCTION_4>
c0de5090:	2100      	movs	r1, #0
c0de5092:	7681      	strb	r1, [r0, #26]
c0de5094:	2104      	movs	r1, #4
c0de5096:	7641      	strb	r1, [r0, #25]
c0de5098:	2102      	movs	r1, #2
c0de509a:	7581      	strb	r1, [r0, #22]
c0de509c:	6920      	ldr	r0, [r4, #16]
c0de509e:	f002 fc5b 	bl	c0de7958 <OUTLINED_FUNCTION_1>
c0de50a2:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de50a6:	f002 fd40 	bl	c0de7b2a <OUTLINED_FUNCTION_17>
c0de50aa:	4606      	mov	r6, r0
c0de50ac:	7c2a      	ldrb	r2, [r5, #16]
c0de50ae:	7cab      	ldrb	r3, [r5, #18]
c0de50b0:	f002 fc9c 	bl	c0de79ec <OUTLINED_FUNCTION_6>
c0de50b4:	2800      	cmp	r0, #0
c0de50b6:	f000 829f 	beq.w	c0de55f8 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de50ba:	2118      	movs	r1, #24
c0de50bc:	f04f 0a00 	mov.w	sl, #0
c0de50c0:	f04f 0801 	mov.w	r8, #1
c0de50c4:	7671      	strb	r1, [r6, #25]
c0de50c6:	2102      	movs	r1, #2
c0de50c8:	f886 a01a 	strb.w	sl, [r6, #26]
c0de50cc:	f880 a005 	strb.w	sl, [r0, #5]
c0de50d0:	75b1      	strb	r1, [r6, #22]
c0de50d2:	2103      	movs	r1, #3
c0de50d4:	7c68      	ldrb	r0, [r5, #17]
c0de50d6:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de50da:	2158      	movs	r1, #88	@ 0x58
c0de50dc:	f886 8005 	strb.w	r8, [r6, #5]
c0de50e0:	f886 a007 	strb.w	sl, [r6, #7]
c0de50e4:	71b1      	strb	r1, [r6, #6]
c0de50e6:	21a0      	movs	r1, #160	@ 0xa0
c0de50e8:	7131      	strb	r1, [r6, #4]
c0de50ea:	2100      	movs	r1, #0
c0de50ec:	2802      	cmp	r0, #2
c0de50ee:	bf08      	it	eq
c0de50f0:	2103      	moveq	r1, #3
c0de50f2:	77f1      	strb	r1, [r6, #31]
c0de50f4:	1e81      	subs	r1, r0, #2
c0de50f6:	bf18      	it	ne
c0de50f8:	2103      	movne	r1, #3
c0de50fa:	3802      	subs	r0, #2
c0de50fc:	f886 1021 	strb.w	r1, [r6, #33]	@ 0x21
c0de5100:	fab0 f080 	clz	r0, r0
c0de5104:	0940      	lsrs	r0, r0, #5
c0de5106:	0040      	lsls	r0, r0, #1
c0de5108:	f886 0020 	strb.w	r0, [r6, #32]
c0de510c:	f002 fd52 	bl	c0de7bb4 <OUTLINED_FUNCTION_23>
c0de5110:	4631      	mov	r1, r6
c0de5112:	0e02      	lsrs	r2, r0, #24
c0de5114:	f801 0f25 	strb.w	r0, [r1, #37]!
c0de5118:	70ca      	strb	r2, [r1, #3]
c0de511a:	0c02      	lsrs	r2, r0, #16
c0de511c:	0a00      	lsrs	r0, r0, #8
c0de511e:	708a      	strb	r2, [r1, #2]
c0de5120:	7048      	strb	r0, [r1, #1]
c0de5122:	7c68      	ldrb	r0, [r5, #17]
c0de5124:	2800      	cmp	r0, #0
c0de5126:	f000 8288 	beq.w	c0de563a <nbgl_layoutAddExtendedFooter+0x6e2>
c0de512a:	68e8      	ldr	r0, [r5, #12]
c0de512c:	f006 ff22 	bl	c0debf74 <pic>
c0de5130:	e284      	b.n	c0de563c <nbgl_layoutAddExtendedFooter+0x6e4>
c0de5132:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5136:	f002 fc0b 	bl	c0de7950 <OUTLINED_FUNCTION_0>
c0de513a:	4606      	mov	r6, r0
c0de513c:	7a6a      	ldrb	r2, [r5, #9]
c0de513e:	7aab      	ldrb	r3, [r5, #10]
c0de5140:	f002 fc54 	bl	c0de79ec <OUTLINED_FUNCTION_6>
c0de5144:	2800      	cmp	r0, #0
c0de5146:	f000 8257 	beq.w	c0de55f8 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de514a:	2008      	movs	r0, #8
c0de514c:	4637      	mov	r7, r6
c0de514e:	f04f 0a01 	mov.w	sl, #1
c0de5152:	21a0      	movs	r1, #160	@ 0xa0
c0de5154:	f04f 0800 	mov.w	r8, #0
c0de5158:	75b0      	strb	r0, [r6, #22]
c0de515a:	7a28      	ldrb	r0, [r5, #8]
c0de515c:	f886 a005 	strb.w	sl, [r6, #5]
c0de5160:	7131      	strb	r1, [r6, #4]
c0de5162:	77f0      	strb	r0, [r6, #31]
c0de5164:	2060      	movs	r0, #96	@ 0x60
c0de5166:	f807 0f06 	strb.w	r0, [r7, #6]!
c0de516a:	f887 8001 	strb.w	r8, [r7, #1]
c0de516e:	f002 fd21 	bl	c0de7bb4 <OUTLINED_FUNCTION_23>
c0de5172:	4631      	mov	r1, r6
c0de5174:	0e02      	lsrs	r2, r0, #24
c0de5176:	f002 fcbd 	bl	c0de7af4 <OUTLINED_FUNCTION_15>
c0de517a:	7a29      	ldrb	r1, [r5, #8]
c0de517c:	f886 801d 	strb.w	r8, [r6, #29]
c0de5180:	f886 a01e 	strb.w	sl, [r6, #30]
c0de5184:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de5188:	2005      	movs	r0, #5
c0de518a:	f886 a01c 	strb.w	sl, [r6, #28]
c0de518e:	f886 0020 	strb.w	r0, [r6, #32]
c0de5192:	200b      	movs	r0, #11
c0de5194:	2900      	cmp	r1, #0
c0de5196:	bf08      	it	eq
c0de5198:	200c      	moveq	r0, #12
c0de519a:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de519e:	6922      	ldr	r2, [r4, #16]
c0de51a0:	7879      	ldrb	r1, [r7, #1]
c0de51a2:	7838      	ldrb	r0, [r7, #0]
c0de51a4:	f002 fe76 	bl	c0de7e94 <OUTLINED_FUNCTION_65>
c0de51a8:	e1f6      	b.n	c0de5598 <nbgl_layoutAddExtendedFooter+0x640>
c0de51aa:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de51ae:	f002 fbcf 	bl	c0de7950 <OUTLINED_FUNCTION_0>
c0de51b2:	4606      	mov	r6, r0
c0de51b4:	7b2a      	ldrb	r2, [r5, #12]
c0de51b6:	7bab      	ldrb	r3, [r5, #14]
c0de51b8:	f002 fc18 	bl	c0de79ec <OUTLINED_FUNCTION_6>
c0de51bc:	2800      	cmp	r0, #0
c0de51be:	f000 821b 	beq.w	c0de55f8 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de51c2:	2007      	movs	r0, #7
c0de51c4:	f04f 0a00 	mov.w	sl, #0
c0de51c8:	f04f 08d0 	mov.w	r8, #208	@ 0xd0
c0de51cc:	75b0      	strb	r0, [r6, #22]
c0de51ce:	2060      	movs	r0, #96	@ 0x60
c0de51d0:	f886 a01f 	strb.w	sl, [r6, #31]
c0de51d4:	f886 a007 	strb.w	sl, [r6, #7]
c0de51d8:	f886 a005 	strb.w	sl, [r6, #5]
c0de51dc:	f886 8004 	strb.w	r8, [r6, #4]
c0de51e0:	71b0      	strb	r0, [r6, #6]
c0de51e2:	f002 fce7 	bl	c0de7bb4 <OUTLINED_FUNCTION_23>
c0de51e6:	4631      	mov	r1, r6
c0de51e8:	0e02      	lsrs	r2, r0, #24
c0de51ea:	f04f 0b01 	mov.w	fp, #1
c0de51ee:	f886 a01d 	strb.w	sl, [r6, #29]
c0de51f2:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de51f6:	f886 b01e 	strb.w	fp, [r6, #30]
c0de51fa:	f002 fc54 	bl	c0de7aa6 <OUTLINED_FUNCTION_12>
c0de51fe:	f002 fe2a 	bl	c0de7e56 <OUTLINED_FUNCTION_59>
c0de5202:	f886 0020 	strb.w	r0, [r6, #32]
c0de5206:	6920      	ldr	r0, [r4, #16]
c0de5208:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de520c:	3101      	adds	r1, #1
c0de520e:	f880 1020 	strb.w	r1, [r0, #32]
c0de5212:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5216:	f002 fb9b 	bl	c0de7950 <OUTLINED_FUNCTION_0>
c0de521a:	4606      	mov	r6, r0
c0de521c:	7b6a      	ldrb	r2, [r5, #13]
c0de521e:	7bab      	ldrb	r3, [r5, #14]
c0de5220:	f002 fbe4 	bl	c0de79ec <OUTLINED_FUNCTION_6>
c0de5224:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de5228:	2800      	cmp	r0, #0
c0de522a:	f000 81e7 	beq.w	c0de55fc <nbgl_layoutAddExtendedFooter+0x6a4>
c0de522e:	2009      	movs	r0, #9
c0de5230:	f886 8004 	strb.w	r8, [r6, #4]
c0de5234:	46b0      	mov	r8, r6
c0de5236:	f886 a01f 	strb.w	sl, [r6, #31]
c0de523a:	f886 a005 	strb.w	sl, [r6, #5]
c0de523e:	75b0      	strb	r0, [r6, #22]
c0de5240:	2060      	movs	r0, #96	@ 0x60
c0de5242:	f808 0f06 	strb.w	r0, [r8, #6]!
c0de5246:	f888 a001 	strb.w	sl, [r8, #1]
c0de524a:	f002 fdbb 	bl	c0de7dc4 <OUTLINED_FUNCTION_49>
c0de524e:	f002 fdfd 	bl	c0de7e4c <OUTLINED_FUNCTION_58>
c0de5252:	f002 fc4f 	bl	c0de7af4 <OUTLINED_FUNCTION_15>
c0de5256:	f898 1001 	ldrb.w	r1, [r8, #1]
c0de525a:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de525e:	200c      	movs	r0, #12
c0de5260:	f002 fdf9 	bl	c0de7e56 <OUTLINED_FUNCTION_59>
c0de5264:	6922      	ldr	r2, [r4, #16]
c0de5266:	f886 0020 	strb.w	r0, [r6, #32]
c0de526a:	2003      	movs	r0, #3
c0de526c:	77b0      	strb	r0, [r6, #30]
c0de526e:	f898 0000 	ldrb.w	r0, [r8]
c0de5272:	f002 fe0f 	bl	c0de7e94 <OUTLINED_FUNCTION_65>
c0de5276:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de527a:	f002 fe01 	bl	c0de7e80 <OUTLINED_FUNCTION_63>
c0de527e:	4680      	mov	r8, r0
c0de5280:	f880 a005 	strb.w	sl, [r0, #5]
c0de5284:	f880 b004 	strb.w	fp, [r0, #4]
c0de5288:	20ff      	movs	r0, #255	@ 0xff
c0de528a:	0e31      	lsrs	r1, r6, #24
c0de528c:	f888 0018 	strb.w	r0, [r8, #24]
c0de5290:	0a30      	lsrs	r0, r6, #8
c0de5292:	f888 7017 	strb.w	r7, [r8, #23]
c0de5296:	f888 b021 	strb.w	fp, [r8, #33]	@ 0x21
c0de529a:	f888 a01f 	strb.w	sl, [r8, #31]
c0de529e:	f888 0013 	strb.w	r0, [r8, #19]
c0de52a2:	2002      	movs	r0, #2
c0de52a4:	f888 0020 	strb.w	r0, [r8, #32]
c0de52a8:	2004      	movs	r0, #4
c0de52aa:	f888 0016 	strb.w	r0, [r8, #22]
c0de52ae:	4640      	mov	r0, r8
c0de52b0:	f800 6f12 	strb.w	r6, [r0, #18]!
c0de52b4:	70c1      	strb	r1, [r0, #3]
c0de52b6:	0c31      	lsrs	r1, r6, #16
c0de52b8:	7081      	strb	r1, [r0, #2]
c0de52ba:	6920      	ldr	r0, [r4, #16]
c0de52bc:	7981      	ldrb	r1, [r0, #6]
c0de52be:	79c0      	ldrb	r0, [r0, #7]
c0de52c0:	f888 0007 	strb.w	r0, [r8, #7]
c0de52c4:	f888 1006 	strb.w	r1, [r8, #6]
c0de52c8:	e166      	b.n	c0de5598 <nbgl_layoutAddExtendedFooter+0x640>
c0de52ca:	f04f 0b00 	mov.w	fp, #0
c0de52ce:	2760      	movs	r7, #96	@ 0x60
c0de52d0:	f04f 0a01 	mov.w	sl, #1
c0de52d4:	21e0      	movs	r1, #224	@ 0xe0
c0de52d6:	f880 b007 	strb.w	fp, [r0, #7]
c0de52da:	7187      	strb	r7, [r0, #6]
c0de52dc:	f880 a005 	strb.w	sl, [r0, #5]
c0de52e0:	7101      	strb	r1, [r0, #4]
c0de52e2:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de52e6:	f002 fb33 	bl	c0de7950 <OUTLINED_FUNCTION_0>
c0de52ea:	4606      	mov	r6, r0
c0de52ec:	7d2a      	ldrb	r2, [r5, #20]
c0de52ee:	7d6b      	ldrb	r3, [r5, #21]
c0de52f0:	f002 fb7c 	bl	c0de79ec <OUTLINED_FUNCTION_6>
c0de52f4:	2800      	cmp	r0, #0
c0de52f6:	f000 817f 	beq.w	c0de55f8 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de52fa:	1d28      	adds	r0, r5, #4
c0de52fc:	46b0      	mov	r8, r6
c0de52fe:	f886 b01f 	strb.w	fp, [r6, #31]
c0de5302:	f886 b007 	strb.w	fp, [r6, #7]
c0de5306:	71b7      	strb	r7, [r6, #6]
c0de5308:	9001      	str	r0, [sp, #4]
c0de530a:	2007      	movs	r0, #7
c0de530c:	75b0      	strb	r0, [r6, #22]
c0de530e:	20c0      	movs	r0, #192	@ 0xc0
c0de5310:	f808 0f04 	strb.w	r0, [r8, #4]!
c0de5314:	f888 b001 	strb.w	fp, [r8, #1]
c0de5318:	6928      	ldr	r0, [r5, #16]
c0de531a:	f006 fe2b 	bl	c0debf74 <pic>
c0de531e:	4631      	mov	r1, r6
c0de5320:	0e02      	lsrs	r2, r0, #24
c0de5322:	f886 a01e 	strb.w	sl, [r6, #30]
c0de5326:	f886 b01d 	strb.w	fp, [r6, #29]
c0de532a:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de532e:	f002 fbba 	bl	c0de7aa6 <OUTLINED_FUNCTION_12>
c0de5332:	f886 a01c 	strb.w	sl, [r6, #28]
c0de5336:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de533a:	2005      	movs	r0, #5
c0de533c:	f886 0020 	strb.w	r0, [r6, #32]
c0de5340:	6920      	ldr	r0, [r4, #16]
c0de5342:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de5346:	3101      	adds	r1, #1
c0de5348:	f880 1020 	strb.w	r1, [r0, #32]
c0de534c:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5350:	f002 fbe7 	bl	c0de7b22 <OUTLINED_FUNCTION_16>
c0de5354:	4682      	mov	sl, r0
c0de5356:	2004      	movs	r0, #4
c0de5358:	2101      	movs	r1, #1
c0de535a:	f88a 0020 	strb.w	r0, [sl, #32]
c0de535e:	20a0      	movs	r0, #160	@ 0xa0
c0de5360:	4656      	mov	r6, sl
c0de5362:	f88a b01f 	strb.w	fp, [sl, #31]
c0de5366:	f806 0f04 	strb.w	r0, [r6, #4]!
c0de536a:	7071      	strb	r1, [r6, #1]
c0de536c:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5370:	f002 fd82 	bl	c0de7e78 <OUTLINED_FUNCTION_62>
c0de5374:	2109      	movs	r1, #9
c0de5376:	0e02      	lsrs	r2, r0, #24
c0de5378:	f88a b007 	strb.w	fp, [sl, #7]
c0de537c:	f88a 1016 	strb.w	r1, [sl, #22]
c0de5380:	2160      	movs	r1, #96	@ 0x60
c0de5382:	f88a 1006 	strb.w	r1, [sl, #6]
c0de5386:	4651      	mov	r1, sl
c0de5388:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de538c:	f002 fd0e 	bl	c0de7dac <OUTLINED_FUNCTION_47>
c0de5390:	f88a 0023 	strb.w	r0, [sl, #35]	@ 0x23
c0de5394:	f898 0000 	ldrb.w	r0, [r8]
c0de5398:	f898 1001 	ldrb.w	r1, [r8, #1]
c0de539c:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de53a0:	9901      	ldr	r1, [sp, #4]
c0de53a2:	f5c0 70f0 	rsb	r0, r0, #480	@ 0x1e0
c0de53a6:	7030      	strb	r0, [r6, #0]
c0de53a8:	0a00      	lsrs	r0, r0, #8
c0de53aa:	7070      	strb	r0, [r6, #1]
c0de53ac:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de53b0:	08c2      	lsrs	r2, r0, #3
c0de53b2:	4650      	mov	r0, sl
c0de53b4:	f002 fe40 	bl	c0de8038 <layoutNavigationPopulate>
c0de53b8:	792a      	ldrb	r2, [r5, #4]
c0de53ba:	7b2b      	ldrb	r3, [r5, #12]
c0de53bc:	4620      	mov	r0, r4
c0de53be:	4651      	mov	r1, sl
c0de53c0:	f7fe ffa4 	bl	c0de430c <layoutAddCallbackObj>
c0de53c4:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de53c8:	2800      	cmp	r0, #0
c0de53ca:	f000 8117 	beq.w	c0de55fc <nbgl_layoutAddExtendedFooter+0x6a4>
c0de53ce:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de53d2:	f002 fd55 	bl	c0de7e80 <OUTLINED_FUNCTION_63>
c0de53d6:	4680      	mov	r8, r0
c0de53d8:	2002      	movs	r0, #2
c0de53da:	2101      	movs	r1, #1
c0de53dc:	f888 0020 	strb.w	r0, [r8, #32]
c0de53e0:	2000      	movs	r0, #0
c0de53e2:	f888 1004 	strb.w	r1, [r8, #4]
c0de53e6:	f888 1021 	strb.w	r1, [r8, #33]	@ 0x21
c0de53ea:	ea4f 611a 	mov.w	r1, sl, lsr #24
c0de53ee:	f888 7017 	strb.w	r7, [r8, #23]
c0de53f2:	f888 0005 	strb.w	r0, [r8, #5]
c0de53f6:	f888 001f 	strb.w	r0, [r8, #31]
c0de53fa:	2004      	movs	r0, #4
c0de53fc:	f888 0016 	strb.w	r0, [r8, #22]
c0de5400:	20ff      	movs	r0, #255	@ 0xff
c0de5402:	f888 0018 	strb.w	r0, [r8, #24]
c0de5406:	ea4f 201a 	mov.w	r0, sl, lsr #8
c0de540a:	f888 0013 	strb.w	r0, [r8, #19]
c0de540e:	4640      	mov	r0, r8
c0de5410:	f800 af12 	strb.w	sl, [r0, #18]!
c0de5414:	70c1      	strb	r1, [r0, #3]
c0de5416:	ea4f 411a 	mov.w	r1, sl, lsr #16
c0de541a:	7081      	strb	r1, [r0, #2]
c0de541c:	6920      	ldr	r0, [r4, #16]
c0de541e:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de5422:	f810 3c1b 	ldrb.w	r3, [r0, #-27]
c0de5426:	f810 2c1c 	ldrb.w	r2, [r0, #-28]
c0de542a:	7847      	ldrb	r7, [r0, #1]
c0de542c:	f810 6c02 	ldrb.w	r6, [r0, #-2]
c0de5430:	f888 3007 	strb.w	r3, [r8, #7]
c0de5434:	f888 2006 	strb.w	r2, [r8, #6]
c0de5438:	ea41 2107 	orr.w	r1, r1, r7, lsl #8
c0de543c:	79aa      	ldrb	r2, [r5, #6]
c0de543e:	f884 20a9 	strb.w	r2, [r4, #169]	@ 0xa9
c0de5442:	78c2      	ldrb	r2, [r0, #3]
c0de5444:	7880      	ldrb	r0, [r0, #2]
c0de5446:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de544a:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de544e:	7969      	ldrb	r1, [r5, #5]
c0de5450:	f840 a026 	str.w	sl, [r0, r6, lsl #2]
c0de5454:	f884 10a8 	strb.w	r1, [r4, #168]	@ 0xa8
c0de5458:	e09b      	b.n	c0de5592 <nbgl_layoutAddExtendedFooter+0x63a>
c0de545a:	2100      	movs	r1, #0
c0de545c:	71c1      	strb	r1, [r0, #7]
c0de545e:	2160      	movs	r1, #96	@ 0x60
c0de5460:	7181      	strb	r1, [r0, #6]
c0de5462:	2101      	movs	r1, #1
c0de5464:	7141      	strb	r1, [r0, #5]
c0de5466:	21e0      	movs	r1, #224	@ 0xe0
c0de5468:	7101      	strb	r1, [r0, #4]
c0de546a:	1d29      	adds	r1, r5, #4
c0de546c:	f894 20ad 	ldrb.w	r2, [r4, #173]	@ 0xad
c0de5470:	08d2      	lsrs	r2, r2, #3
c0de5472:	f002 fde1 	bl	c0de8038 <layoutNavigationPopulate>
c0de5476:	6921      	ldr	r1, [r4, #16]
c0de5478:	2004      	movs	r0, #4
c0de547a:	f881 0020 	strb.w	r0, [r1, #32]
c0de547e:	4620      	mov	r0, r4
c0de5480:	792a      	ldrb	r2, [r5, #4]
c0de5482:	7b2b      	ldrb	r3, [r5, #12]
c0de5484:	f7fe ff42 	bl	c0de430c <layoutAddCallbackObj>
c0de5488:	2800      	cmp	r0, #0
c0de548a:	f000 80b5 	beq.w	c0de55f8 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de548e:	79a8      	ldrb	r0, [r5, #6]
c0de5490:	f04f 0800 	mov.w	r8, #0
c0de5494:	f884 00a9 	strb.w	r0, [r4, #169]	@ 0xa9
c0de5498:	7968      	ldrb	r0, [r5, #5]
c0de549a:	f884 00a8 	strb.w	r0, [r4, #168]	@ 0xa8
c0de549e:	e07b      	b.n	c0de5598 <nbgl_layoutAddExtendedFooter+0x640>
c0de54a0:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de54a4:	2605      	movs	r6, #5
c0de54a6:	f002 fb40 	bl	c0de7b2a <OUTLINED_FUNCTION_17>
c0de54aa:	4607      	mov	r7, r0
c0de54ac:	7b2a      	ldrb	r2, [r5, #12]
c0de54ae:	7c2b      	ldrb	r3, [r5, #16]
c0de54b0:	4620      	mov	r0, r4
c0de54b2:	4639      	mov	r1, r7
c0de54b4:	f7fe ff2a 	bl	c0de430c <layoutAddCallbackObj>
c0de54b8:	2800      	cmp	r0, #0
c0de54ba:	f000 809d 	beq.w	c0de55f8 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de54be:	75be      	strb	r6, [r7, #22]
c0de54c0:	2100      	movs	r1, #0
c0de54c2:	f04f 0800 	mov.w	r8, #0
c0de54c6:	7b68      	ldrb	r0, [r5, #13]
c0de54c8:	2800      	cmp	r0, #0
c0de54ca:	bf08      	it	eq
c0de54cc:	2103      	moveq	r1, #3
c0de54ce:	f887 1021 	strb.w	r1, [r7, #33]	@ 0x21
c0de54d2:	bf18      	it	ne
c0de54d4:	2003      	movne	r0, #3
c0de54d6:	77f8      	strb	r0, [r7, #31]
c0de54d8:	7b68      	ldrb	r0, [r5, #13]
c0de54da:	4601      	mov	r1, r0
c0de54dc:	2800      	cmp	r0, #0
c0de54de:	bf18      	it	ne
c0de54e0:	2101      	movne	r1, #1
c0de54e2:	0049      	lsls	r1, r1, #1
c0de54e4:	2802      	cmp	r0, #2
c0de54e6:	bf08      	it	eq
c0de54e8:	2103      	moveq	r1, #3
c0de54ea:	f887 1020 	strb.w	r1, [r7, #32]
c0de54ee:	f002 fb61 	bl	c0de7bb4 <OUTLINED_FUNCTION_23>
c0de54f2:	463e      	mov	r6, r7
c0de54f4:	210c      	movs	r1, #12
c0de54f6:	f887 1023 	strb.w	r1, [r7, #35]	@ 0x23
c0de54fa:	f806 0f25 	strb.w	r0, [r6, #37]!
c0de54fe:	0e01      	lsrs	r1, r0, #24
c0de5500:	f002 fcaf 	bl	c0de7e62 <OUTLINED_FUNCTION_60>
c0de5504:	f887 0026 	strb.w	r0, [r7, #38]	@ 0x26
c0de5508:	f002 fc5c 	bl	c0de7dc4 <OUTLINED_FUNCTION_49>
c0de550c:	2103      	movs	r1, #3
c0de550e:	0e02      	lsrs	r2, r0, #24
c0de5510:	f887 8007 	strb.w	r8, [r7, #7]
c0de5514:	f887 1022 	strb.w	r1, [r7, #34]	@ 0x22
c0de5518:	2158      	movs	r1, #88	@ 0x58
c0de551a:	71b9      	strb	r1, [r7, #6]
c0de551c:	4639      	mov	r1, r7
c0de551e:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de5522:	f002 fc43 	bl	c0de7dac <OUTLINED_FUNCTION_47>
c0de5526:	f887 002f 	strb.w	r0, [r7, #47]	@ 0x2f
c0de552a:	2188      	movs	r1, #136	@ 0x88
c0de552c:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de5530:	6920      	ldr	r0, [r4, #16]
c0de5532:	f880 8007 	strb.w	r8, [r0, #7]
c0de5536:	7181      	strb	r1, [r0, #6]
c0de5538:	6869      	ldr	r1, [r5, #4]
c0de553a:	2900      	cmp	r1, #0
c0de553c:	bf08      	it	eq
c0de553e:	2258      	moveq	r2, #88	@ 0x58
c0de5540:	713a      	strb	r2, [r7, #4]
c0de5542:	f896 c000 	ldrb.w	ip, [r6]
c0de5546:	f896 e002 	ldrb.w	lr, [r6, #2]
c0de554a:	f896 a003 	ldrb.w	sl, [r6, #3]
c0de554e:	f887 801d 	strb.w	r8, [r7, #29]
c0de5552:	0a11      	lsrs	r1, r2, #8
c0de5554:	7179      	strb	r1, [r7, #5]
c0de5556:	f810 6f22 	ldrb.w	r6, [r0, #34]!
c0de555a:	7842      	ldrb	r2, [r0, #1]
c0de555c:	f810 1c02 	ldrb.w	r1, [r0, #-2]
c0de5560:	7883      	ldrb	r3, [r0, #2]
c0de5562:	78c0      	ldrb	r0, [r0, #3]
c0de5564:	ea46 2202 	orr.w	r2, r6, r2, lsl #8
c0de5568:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de556c:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de5570:	f897 2026 	ldrb.w	r2, [r7, #38]	@ 0x26
c0de5574:	f840 7021 	str.w	r7, [r0, r1, lsl #2]
c0de5578:	2001      	movs	r0, #1
c0de557a:	ea4e 210a 	orr.w	r1, lr, sl, lsl #8
c0de557e:	7738      	strb	r0, [r7, #28]
c0de5580:	ea4c 2002 	orr.w	r0, ip, r2, lsl #8
c0de5584:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de5588:	2107      	movs	r1, #7
c0de558a:	2800      	cmp	r0, #0
c0de558c:	bf08      	it	eq
c0de558e:	2101      	moveq	r1, #1
c0de5590:	77b9      	strb	r1, [r7, #30]
c0de5592:	6920      	ldr	r0, [r4, #16]
c0de5594:	f002 f9e0 	bl	c0de7958 <OUTLINED_FUNCTION_1>
c0de5598:	7828      	ldrb	r0, [r5, #0]
c0de559a:	3803      	subs	r0, #3
c0de559c:	2801      	cmp	r0, #1
c0de559e:	d808      	bhi.n	c0de55b2 <nbgl_layoutAddExtendedFooter+0x65a>
c0de55a0:	7b28      	ldrb	r0, [r5, #12]
c0de55a2:	792b      	ldrb	r3, [r5, #4]
c0de55a4:	f44f 61c0 	mov.w	r1, #1536	@ 0x600
c0de55a8:	2200      	movs	r2, #0
c0de55aa:	9000      	str	r0, [sp, #0]
c0de55ac:	4620      	mov	r0, r4
c0de55ae:	f7ff fc7c 	bl	c0de4eaa <addSwipeInternal>
c0de55b2:	7868      	ldrb	r0, [r5, #1]
c0de55b4:	b148      	cbz	r0, c0de55ca <nbgl_layoutAddExtendedFooter+0x672>
c0de55b6:	f002 fb10 	bl	c0de7bda <OUTLINED_FUNCTION_25>
c0de55ba:	6921      	ldr	r1, [r4, #16]
c0de55bc:	f002 f9f9 	bl	c0de79b2 <OUTLINED_FUNCTION_4>
c0de55c0:	2102      	movs	r1, #2
c0de55c2:	7581      	strb	r1, [r0, #22]
c0de55c4:	6920      	ldr	r0, [r4, #16]
c0de55c6:	f002 f9c7 	bl	c0de7958 <OUTLINED_FUNCTION_1>
c0de55ca:	f1b8 0f00 	cmp.w	r8, #0
c0de55ce:	d018      	beq.n	c0de5602 <nbgl_layoutAddExtendedFooter+0x6aa>
c0de55d0:	6920      	ldr	r0, [r4, #16]
c0de55d2:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de55d6:	7843      	ldrb	r3, [r0, #1]
c0de55d8:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de55dc:	7886      	ldrb	r6, [r0, #2]
c0de55de:	78c0      	ldrb	r0, [r0, #3]
c0de55e0:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de55e4:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de55e8:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de55ec:	f840 8022 	str.w	r8, [r0, r2, lsl #2]
c0de55f0:	6920      	ldr	r0, [r4, #16]
c0de55f2:	f002 f9b1 	bl	c0de7958 <OUTLINED_FUNCTION_1>
c0de55f6:	e005      	b.n	c0de5604 <nbgl_layoutAddExtendedFooter+0x6ac>
c0de55f8:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de55fc:	4638      	mov	r0, r7
c0de55fe:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de5602:	6920      	ldr	r0, [r4, #16]
c0de5604:	68a1      	ldr	r1, [r4, #8]
c0de5606:	60c8      	str	r0, [r1, #12]
c0de5608:	6920      	ldr	r0, [r4, #16]
c0de560a:	f8d4 10a0 	ldr.w	r1, [r4, #160]	@ 0xa0
c0de560e:	f810 2f06 	ldrb.w	r2, [r0, #6]!
c0de5612:	7843      	ldrb	r3, [r0, #1]
c0de5614:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5618:	f811 3f06 	ldrb.w	r3, [r1, #6]!
c0de561c:	784e      	ldrb	r6, [r1, #1]
c0de561e:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de5622:	1a9a      	subs	r2, r3, r2
c0de5624:	700a      	strb	r2, [r1, #0]
c0de5626:	0a12      	lsrs	r2, r2, #8
c0de5628:	704a      	strb	r2, [r1, #1]
c0de562a:	7829      	ldrb	r1, [r5, #0]
c0de562c:	f884 10ab 	strb.w	r1, [r4, #171]	@ 0xab
c0de5630:	7801      	ldrb	r1, [r0, #0]
c0de5632:	7840      	ldrb	r0, [r0, #1]
c0de5634:	ea41 2700 	orr.w	r7, r1, r0, lsl #8
c0de5638:	e7e0      	b.n	c0de55fc <nbgl_layoutAddExtendedFooter+0x6a4>
c0de563a:	2000      	movs	r0, #0
c0de563c:	f002 fc06 	bl	c0de7e4c <OUTLINED_FUNCTION_58>
c0de5640:	f002 fb11 	bl	c0de7c66 <OUTLINED_FUNCTION_31>
c0de5644:	f002 fa75 	bl	c0de7b32 <OUTLINED_FUNCTION_18>
c0de5648:	f04f 0800 	mov.w	r8, #0
c0de564c:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de5650:	2009      	movs	r0, #9
c0de5652:	77b0      	strb	r0, [r6, #30]
c0de5654:	6920      	ldr	r0, [r4, #16]
c0de5656:	f002 f97f 	bl	c0de7958 <OUTLINED_FUNCTION_1>
c0de565a:	7c69      	ldrb	r1, [r5, #17]
c0de565c:	f880 8007 	strb.w	r8, [r0, #7]
c0de5660:	2900      	cmp	r1, #0
c0de5662:	bf0c      	ite	eq
c0de5664:	21d0      	moveq	r1, #208	@ 0xd0
c0de5666:	21e8      	movne	r1, #232	@ 0xe8
c0de5668:	7181      	strb	r1, [r0, #6]
c0de566a:	e795      	b.n	c0de5598 <nbgl_layoutAddExtendedFooter+0x640>

c0de566c <nbgl_layoutAddBottomButton>:
c0de566c:	b570      	push	{r4, r5, r6, lr}
c0de566e:	b086      	sub	sp, #24
c0de5670:	4605      	mov	r5, r0
c0de5672:	2005      	movs	r0, #5
c0de5674:	2600      	movs	r6, #0
c0de5676:	4614      	mov	r4, r2
c0de5678:	f88d 3001 	strb.w	r3, [sp, #1]
c0de567c:	f88d 0000 	strb.w	r0, [sp]
c0de5680:	4608      	mov	r0, r1
c0de5682:	f88d 600e 	strb.w	r6, [sp, #14]
c0de5686:	f006 fc75 	bl	c0debf74 <pic>
c0de568a:	9002      	str	r0, [sp, #8]
c0de568c:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de568e:	4669      	mov	r1, sp
c0de5690:	f88d 400c 	strb.w	r4, [sp, #12]
c0de5694:	9601      	str	r6, [sp, #4]
c0de5696:	f88d 0010 	strb.w	r0, [sp, #16]
c0de569a:	2001      	movs	r0, #1
c0de569c:	f88d 000d 	strb.w	r0, [sp, #13]
c0de56a0:	4628      	mov	r0, r5
c0de56a2:	f7ff fc59 	bl	c0de4f58 <nbgl_layoutAddExtendedFooter>
c0de56a6:	b006      	add	sp, #24
c0de56a8:	bd70      	pop	{r4, r5, r6, pc}

c0de56aa <nbgl_layoutAddTouchableBar>:
c0de56aa:	b5b0      	push	{r4, r5, r7, lr}
c0de56ac:	b086      	sub	sp, #24
c0de56ae:	b1e8      	cbz	r0, c0de56ec <nbgl_layoutAddTouchableBar+0x42>
c0de56b0:	2200      	movs	r2, #0
c0de56b2:	f88d 2000 	strb.w	r2, [sp]
c0de56b6:	e891 003c 	ldmia.w	r1, {r2, r3, r4, r5}
c0de56ba:	e9cd 3503 	strd	r3, r5, [sp, #12]
c0de56be:	e9cd 2401 	strd	r2, r4, [sp, #4]
c0de56c2:	7c4a      	ldrb	r2, [r1, #17]
c0de56c4:	f88d 2014 	strb.w	r2, [sp, #20]
c0de56c8:	7d0a      	ldrb	r2, [r1, #20]
c0de56ca:	f88d 2017 	strb.w	r2, [sp, #23]
c0de56ce:	7c0a      	ldrb	r2, [r1, #16]
c0de56d0:	7c89      	ldrb	r1, [r1, #18]
c0de56d2:	f081 0101 	eor.w	r1, r1, #1
c0de56d6:	f88d 2016 	strb.w	r2, [sp, #22]
c0de56da:	f88d 1015 	strb.w	r1, [sp, #21]
c0de56de:	4669      	mov	r1, sp
c0de56e0:	f000 f808 	bl	c0de56f4 <addListItem>
c0de56e4:	b110      	cbz	r0, c0de56ec <nbgl_layoutAddTouchableBar+0x42>
c0de56e6:	f002 fb9a 	bl	c0de7e1e <OUTLINED_FUNCTION_55>
c0de56ea:	e001      	b.n	c0de56f0 <nbgl_layoutAddTouchableBar+0x46>
c0de56ec:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de56f0:	b006      	add	sp, #24
c0de56f2:	bdb0      	pop	{r4, r5, r7, pc}

c0de56f4 <addListItem>:
c0de56f4:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de56f8:	4682      	mov	sl, r0
c0de56fa:	7808      	ldrb	r0, [r1, #0]
c0de56fc:	4688      	mov	r8, r1
c0de56fe:	b110      	cbz	r0, c0de5706 <addListItem+0x12>
c0de5700:	f04f 0b00 	mov.w	fp, #0
c0de5704:	e006      	b.n	c0de5714 <addListItem+0x20>
c0de5706:	f898 0015 	ldrb.w	r0, [r8, #21]
c0de570a:	fab0 f080 	clz	r0, r0
c0de570e:	0940      	lsrs	r0, r0, #5
c0de5710:	ea4f 0b40 	mov.w	fp, r0, lsl #1
c0de5714:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de5718:	2401      	movs	r4, #1
c0de571a:	f002 fa02 	bl	c0de7b22 <OUTLINED_FUNCTION_16>
c0de571e:	4606      	mov	r6, r0
c0de5720:	f898 2014 	ldrb.w	r2, [r8, #20]
c0de5724:	f898 3017 	ldrb.w	r3, [r8, #23]
c0de5728:	4650      	mov	r0, sl
c0de572a:	f002 fa2a 	bl	c0de7b82 <OUTLINED_FUNCTION_20>
c0de572e:	2500      	movs	r5, #0
c0de5730:	2800      	cmp	r0, #0
c0de5732:	d075      	beq.n	c0de5820 <addListItem+0x12c>
c0de5734:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de5738:	f002 fb9e 	bl	c0de7e78 <OUTLINED_FUNCTION_62>
c0de573c:	4631      	mov	r1, r6
c0de573e:	0e02      	lsrs	r2, r0, #24
c0de5740:	2364      	movs	r3, #100	@ 0x64
c0de5742:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de5746:	f801 5d10 	strb.w	r5, [r1, #-16]!
c0de574a:	74ca      	strb	r2, [r1, #19]
c0de574c:	0c02      	lsrs	r2, r0, #16
c0de574e:	0a00      	lsrs	r0, r0, #8
c0de5750:	f801 4c0d 	strb.w	r4, [r1, #-13]
c0de5754:	f801 5c0b 	strb.w	r5, [r1, #-11]
c0de5758:	7448      	strb	r0, [r1, #17]
c0de575a:	20a0      	movs	r0, #160	@ 0xa0
c0de575c:	748a      	strb	r2, [r1, #18]
c0de575e:	f801 0c0e 	strb.w	r0, [r1, #-14]
c0de5762:	f898 2016 	ldrb.w	r2, [r8, #22]
c0de5766:	f898 0000 	ldrb.w	r0, [r8]
c0de576a:	2a00      	cmp	r2, #0
c0de576c:	bf08      	it	eq
c0de576e:	235c      	moveq	r3, #92	@ 0x5c
c0de5770:	f801 3c0c 	strb.w	r3, [r1, #-12]
c0de5774:	718d      	strb	r5, [r1, #6]
c0de5776:	70cd      	strb	r5, [r1, #3]
c0de5778:	708d      	strb	r5, [r1, #2]
c0de577a:	704d      	strb	r5, [r1, #1]
c0de577c:	738d      	strb	r5, [r1, #14]
c0de577e:	734c      	strb	r4, [r1, #13]
c0de5780:	710d      	strb	r5, [r1, #4]
c0de5782:	2220      	movs	r2, #32
c0de5784:	2801      	cmp	r0, #1
c0de5786:	714a      	strb	r2, [r1, #5]
c0de5788:	d004      	beq.n	c0de5794 <addListItem+0xa0>
c0de578a:	b980      	cbnz	r0, c0de57ae <addListItem+0xba>
c0de578c:	f898 0015 	ldrb.w	r0, [r8, #21]
c0de5790:	2801      	cmp	r0, #1
c0de5792:	d10c      	bne.n	c0de57ae <addListItem+0xba>
c0de5794:	48c4      	ldr	r0, [pc, #784]	@ (c0de5aa8 <addListItem+0x3b4>)
c0de5796:	f819 1000 	ldrb.w	r1, [r9, r0]
c0de579a:	1c4a      	adds	r2, r1, #1
c0de579c:	f809 2000 	strb.w	r2, [r9, r0]
c0de57a0:	2000      	movs	r0, #0
c0de57a2:	7770      	strb	r0, [r6, #29]
c0de57a4:	2001      	movs	r0, #1
c0de57a6:	7730      	strb	r0, [r6, #28]
c0de57a8:	f101 0014 	add.w	r0, r1, #20
c0de57ac:	77b0      	strb	r0, [r6, #30]
c0de57ae:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de57b2:	f002 f8cd 	bl	c0de7950 <OUTLINED_FUNCTION_0>
c0de57b6:	4607      	mov	r7, r0
c0de57b8:	f880 b01f 	strb.w	fp, [r0, #31]
c0de57bc:	f8d8 000c 	ldr.w	r0, [r8, #12]
c0de57c0:	f006 fbd8 	bl	c0debf74 <pic>
c0de57c4:	2201      	movs	r2, #1
c0de57c6:	2100      	movs	r1, #0
c0de57c8:	f64f 74f0 	movw	r4, #65520	@ 0xfff0
c0de57cc:	f887 2024 	strb.w	r2, [r7, #36]	@ 0x24
c0de57d0:	220c      	movs	r2, #12
c0de57d2:	f887 102d 	strb.w	r1, [r7, #45]	@ 0x2d
c0de57d6:	f887 2022 	strb.w	r2, [r7, #34]	@ 0x22
c0de57da:	463a      	mov	r2, r7
c0de57dc:	f802 1f2c 	strb.w	r1, [r2, #44]!
c0de57e0:	70d1      	strb	r1, [r2, #3]
c0de57e2:	7091      	strb	r1, [r2, #2]
c0de57e4:	4639      	mov	r1, r7
c0de57e6:	f002 fab4 	bl	c0de7d52 <OUTLINED_FUNCTION_41>
c0de57ea:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de57ee:	7931      	ldrb	r1, [r6, #4]
c0de57f0:	7972      	ldrb	r2, [r6, #5]
c0de57f2:	7139      	strb	r1, [r7, #4]
c0de57f4:	717a      	strb	r2, [r7, #5]
c0de57f6:	f8d8 0004 	ldr.w	r0, [r8, #4]
c0de57fa:	b198      	cbz	r0, c0de5824 <addListItem+0x130>
c0de57fc:	f006 fbba 	bl	c0debf74 <pic>
c0de5800:	4639      	mov	r1, r7
c0de5802:	f811 2f04 	ldrb.w	r2, [r1, #4]!
c0de5806:	784b      	ldrb	r3, [r1, #1]
c0de5808:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de580c:	7803      	ldrb	r3, [r0, #0]
c0de580e:	7840      	ldrb	r0, [r0, #1]
c0de5810:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de5814:	1a20      	subs	r0, r4, r0
c0de5816:	4402      	add	r2, r0
c0de5818:	0a10      	lsrs	r0, r2, #8
c0de581a:	700a      	strb	r2, [r1, #0]
c0de581c:	7048      	strb	r0, [r1, #1]
c0de581e:	e003      	b.n	c0de5828 <addListItem+0x134>
c0de5820:	2000      	movs	r0, #0
c0de5822:	e13e      	b.n	c0de5aa2 <addListItem+0x3ae>
c0de5824:	ea41 2202 	orr.w	r2, r1, r2, lsl #8
c0de5828:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de582c:	f8cd b00c 	str.w	fp, [sp, #12]
c0de5830:	b160      	cbz	r0, c0de584c <addListItem+0x158>
c0de5832:	f006 fb9f 	bl	c0debf74 <pic>
c0de5836:	7801      	ldrb	r1, [r0, #0]
c0de5838:	7840      	ldrb	r0, [r0, #1]
c0de583a:	797a      	ldrb	r2, [r7, #5]
c0de583c:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de5840:	7939      	ldrb	r1, [r7, #4]
c0de5842:	1a20      	subs	r0, r4, r0
c0de5844:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de5848:	1842      	adds	r2, r0, r1
c0de584a:	e004      	b.n	c0de5856 <addListItem+0x162>
c0de584c:	f898 0000 	ldrb.w	r0, [r8]
c0de5850:	2801      	cmp	r0, #1
c0de5852:	d103      	bne.n	c0de585c <addListItem+0x168>
c0de5854:	3a4c      	subs	r2, #76	@ 0x4c
c0de5856:	0a10      	lsrs	r0, r2, #8
c0de5858:	713a      	strb	r2, [r7, #4]
c0de585a:	7178      	strb	r0, [r7, #5]
c0de585c:	463c      	mov	r4, r7
c0de585e:	f897 1027 	ldrb.w	r1, [r7, #39]	@ 0x27
c0de5862:	f897 0022 	ldrb.w	r0, [r7, #34]	@ 0x22
c0de5866:	f897 3024 	ldrb.w	r3, [r7, #36]	@ 0x24
c0de586a:	b292      	uxth	r2, r2
c0de586c:	f814 5f26 	ldrb.w	r5, [r4, #38]!
c0de5870:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de5874:	78a5      	ldrb	r5, [r4, #2]
c0de5876:	78e4      	ldrb	r4, [r4, #3]
c0de5878:	ea45 2404 	orr.w	r4, r5, r4, lsl #8
c0de587c:	ea41 4104 	orr.w	r1, r1, r4, lsl #16
c0de5880:	f006 f9b0 	bl	c0debbe4 <nbgl_getTextHeightInWidth>
c0de5884:	4683      	mov	fp, r0
c0de5886:	4630      	mov	r0, r6
c0de5888:	4634      	mov	r4, r6
c0de588a:	f002 fa3c 	bl	c0de7d06 <OUTLINED_FUNCTION_38>
c0de588e:	f841 7022 	str.w	r7, [r1, r2, lsl #2]
c0de5892:	2100      	movs	r1, #0
c0de5894:	f887 b006 	strb.w	fp, [r7, #6]
c0de5898:	f887 1021 	strb.w	r1, [r7, #33]	@ 0x21
c0de589c:	2104      	movs	r1, #4
c0de589e:	f887 1020 	strb.w	r1, [r7, #32]
c0de58a2:	75b9      	strb	r1, [r7, #22]
c0de58a4:	ea4f 211b 	mov.w	r1, fp, lsr #8
c0de58a8:	71f9      	strb	r1, [r7, #7]
c0de58aa:	1c51      	adds	r1, r2, #1
c0de58ac:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de58b0:	f1bb 0f28 	cmp.w	fp, #40	@ 0x28
c0de58b4:	bf98      	it	ls
c0de58b6:	f04f 0b28 	movls.w	fp, #40	@ 0x28
c0de58ba:	f8d8 0004 	ldr.w	r0, [r8, #4]
c0de58be:	9402      	str	r4, [sp, #8]
c0de58c0:	b358      	cbz	r0, c0de591a <addListItem+0x226>
c0de58c2:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de58c6:	f002 f95f 	bl	c0de7b88 <OUTLINED_FUNCTION_21>
c0de58ca:	4605      	mov	r5, r0
c0de58cc:	9803      	ldr	r0, [sp, #12]
c0de58ce:	77e8      	strb	r0, [r5, #31]
c0de58d0:	f8d8 0004 	ldr.w	r0, [r8, #4]
c0de58d4:	f006 fb4e 	bl	c0debf74 <pic>
c0de58d8:	f002 f93f 	bl	c0de7b5a <OUTLINED_FUNCTION_19>
c0de58dc:	4620      	mov	r0, r4
c0de58de:	f810 cf22 	ldrb.w	ip, [r0, #34]!
c0de58e2:	7846      	ldrb	r6, [r0, #1]
c0de58e4:	7884      	ldrb	r4, [r0, #2]
c0de58e6:	78c2      	ldrb	r2, [r0, #3]
c0de58e8:	f810 3c02 	ldrb.w	r3, [r0, #-2]
c0de58ec:	ea4c 2606 	orr.w	r6, ip, r6, lsl #8
c0de58f0:	ea44 2202 	orr.w	r2, r4, r2, lsl #8
c0de58f4:	ea46 4202 	orr.w	r2, r6, r2, lsl #16
c0de58f8:	f002 faf8 	bl	c0de7eec <OUTLINED_FUNCTION_72>
c0de58fc:	2204      	movs	r2, #4
c0de58fe:	f002 f971 	bl	c0de7be4 <OUTLINED_FUNCTION_26>
c0de5902:	7801      	ldrb	r1, [r0, #0]
c0de5904:	f002 f8ee 	bl	c0de7ae4 <OUTLINED_FUNCTION_14>
c0de5908:	3110      	adds	r1, #16
c0de590a:	75f9      	strb	r1, [r7, #23]
c0de590c:	0a09      	lsrs	r1, r1, #8
c0de590e:	7639      	strb	r1, [r7, #24]
c0de5910:	fa0f f18b 	sxth.w	r1, fp
c0de5914:	4281      	cmp	r1, r0
c0de5916:	bfd8      	it	le
c0de5918:	4683      	movle	fp, r0
c0de591a:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de591e:	f8cd a004 	str.w	sl, [sp, #4]
c0de5922:	b348      	cbz	r0, c0de5978 <addListItem+0x284>
c0de5924:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de5928:	f002 f92e 	bl	c0de7b88 <OUTLINED_FUNCTION_21>
c0de592c:	4605      	mov	r5, r0
c0de592e:	9803      	ldr	r0, [sp, #12]
c0de5930:	77e8      	strb	r0, [r5, #31]
c0de5932:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de5936:	f006 fb1d 	bl	c0debf74 <pic>
c0de593a:	f002 f90e 	bl	c0de7b5a <OUTLINED_FUNCTION_19>
c0de593e:	9802      	ldr	r0, [sp, #8]
c0de5940:	f810 cf22 	ldrb.w	ip, [r0, #34]!
c0de5944:	7844      	ldrb	r4, [r0, #1]
c0de5946:	7886      	ldrb	r6, [r0, #2]
c0de5948:	78c2      	ldrb	r2, [r0, #3]
c0de594a:	f810 3c02 	ldrb.w	r3, [r0, #-2]
c0de594e:	ea4c 2404 	orr.w	r4, ip, r4, lsl #8
c0de5952:	ea46 2202 	orr.w	r2, r6, r2, lsl #8
c0de5956:	ea44 4202 	orr.w	r2, r4, r2, lsl #16
c0de595a:	f002 fac7 	bl	c0de7eec <OUTLINED_FUNCTION_72>
c0de595e:	2206      	movs	r2, #6
c0de5960:	f002 f940 	bl	c0de7be4 <OUTLINED_FUNCTION_26>
c0de5964:	7881      	ldrb	r1, [r0, #2]
c0de5966:	78c0      	ldrb	r0, [r0, #3]
c0de5968:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
c0de596c:	fa0f f08b 	sxth.w	r0, fp
c0de5970:	4288      	cmp	r0, r1
c0de5972:	bfc8      	it	gt
c0de5974:	4659      	movgt	r1, fp
c0de5976:	e028      	b.n	c0de59ca <addListItem+0x2d6>
c0de5978:	f898 0000 	ldrb.w	r0, [r8]
c0de597c:	2801      	cmp	r0, #1
c0de597e:	d123      	bne.n	c0de59c8 <addListItem+0x2d4>
c0de5980:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de5984:	f04f 0a06 	mov.w	sl, #6
c0de5988:	08c1      	lsrs	r1, r0, #3
c0de598a:	2006      	movs	r0, #6
c0de598c:	f006 f911 	bl	c0debbb2 <nbgl_objPoolGet>
c0de5990:	0a39      	lsrs	r1, r7, #8
c0de5992:	0e3a      	lsrs	r2, r7, #24
c0de5994:	f880 a016 	strb.w	sl, [r0, #22]
c0de5998:	74c1      	strb	r1, [r0, #19]
c0de599a:	4601      	mov	r1, r0
c0de599c:	f002 fa92 	bl	c0de7ec4 <OUTLINED_FUNCTION_69>
c0de59a0:	9902      	ldr	r1, [sp, #8]
c0de59a2:	f002 f977 	bl	c0de7c94 <OUTLINED_FUNCTION_33>
c0de59a6:	2410      	movs	r4, #16
c0de59a8:	f842 0023 	str.w	r0, [r2, r3, lsl #2]
c0de59ac:	2200      	movs	r2, #0
c0de59ae:	75c4      	strb	r4, [r0, #23]
c0de59b0:	2402      	movs	r4, #2
c0de59b2:	7602      	strb	r2, [r0, #24]
c0de59b4:	77c2      	strb	r2, [r0, #31]
c0de59b6:	f898 2015 	ldrb.w	r2, [r8, #21]
c0de59ba:	f880 4020 	strb.w	r4, [r0, #32]
c0de59be:	f880 2021 	strb.w	r2, [r0, #33]	@ 0x21
c0de59c2:	1c58      	adds	r0, r3, #1
c0de59c4:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de59c8:	4659      	mov	r1, fp
c0de59ca:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de59ce:	e9dd 5a01 	ldrd	r5, sl, [sp, #4]
c0de59d2:	2800      	cmp	r0, #0
c0de59d4:	d05c      	beq.n	c0de5a90 <addListItem+0x39c>
c0de59d6:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de59da:	9100      	str	r1, [sp, #0]
c0de59dc:	2604      	movs	r6, #4
c0de59de:	f001 ffb7 	bl	c0de7950 <OUTLINED_FUNCTION_0>
c0de59e2:	4604      	mov	r4, r0
c0de59e4:	9803      	ldr	r0, [sp, #12]
c0de59e6:	77e0      	strb	r0, [r4, #31]
c0de59e8:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de59ec:	f006 fac2 	bl	c0debf74 <pic>
c0de59f0:	4601      	mov	r1, r0
c0de59f2:	200b      	movs	r0, #11
c0de59f4:	2301      	movs	r3, #1
c0de59f6:	f884 6020 	strb.w	r6, [r4, #32]
c0de59fa:	75a6      	strb	r6, [r4, #22]
c0de59fc:	f884 0022 	strb.w	r0, [r4, #34]	@ 0x22
c0de5a00:	2001      	movs	r0, #1
c0de5a02:	0e0a      	lsrs	r2, r1, #24
c0de5a04:	f884 0024 	strb.w	r0, [r4, #36]	@ 0x24
c0de5a08:	2000      	movs	r0, #0
c0de5a0a:	f884 0021 	strb.w	r0, [r4, #33]	@ 0x21
c0de5a0e:	4620      	mov	r0, r4
c0de5a10:	f002 f861 	bl	c0de7ad6 <OUTLINED_FUNCTION_13>
c0de5a14:	f884 0027 	strb.w	r0, [r4, #39]	@ 0x27
c0de5a18:	f89a 2005 	ldrb.w	r2, [sl, #5]
c0de5a1c:	f89a 0004 	ldrb.w	r0, [sl, #4]
c0de5a20:	7162      	strb	r2, [r4, #5]
c0de5a22:	7120      	strb	r0, [r4, #4]
c0de5a24:	ea40 2202 	orr.w	r2, r0, r2, lsl #8
c0de5a28:	f002 f9a3 	bl	c0de7d72 <OUTLINED_FUNCTION_43>
c0de5a2c:	4651      	mov	r1, sl
c0de5a2e:	46ac      	mov	ip, r5
c0de5a30:	f811 bf22 	ldrb.w	fp, [r1, #34]!
c0de5a34:	f811 8d1c 	ldrb.w	r8, [r1, #-28]!
c0de5a38:	7f4d      	ldrb	r5, [r1, #29]
c0de5a3a:	7fce      	ldrb	r6, [r1, #31]
c0de5a3c:	7f8b      	ldrb	r3, [r1, #30]
c0de5a3e:	7e8a      	ldrb	r2, [r1, #26]
c0de5a40:	f891 e001 	ldrb.w	lr, [r1, #1]
c0de5a44:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de5a48:	ea4b 2505 	orr.w	r5, fp, r5, lsl #8
c0de5a4c:	ea45 4303 	orr.w	r3, r5, r3, lsl #16
c0de5a50:	2500      	movs	r5, #0
c0de5a52:	f843 4022 	str.w	r4, [r3, r2, lsl #2]
c0de5a56:	f100 030c 	add.w	r3, r0, #12
c0de5a5a:	3201      	adds	r2, #1
c0de5a5c:	eba5 0353 	sub.w	r3, r5, r3, lsr #1
c0de5a60:	2502      	movs	r5, #2
c0de5a62:	767b      	strb	r3, [r7, #25]
c0de5a64:	0a1b      	lsrs	r3, r3, #8
c0de5a66:	76bb      	strb	r3, [r7, #26]
c0de5a68:	0a03      	lsrs	r3, r0, #8
c0de5a6a:	71a0      	strb	r0, [r4, #6]
c0de5a6c:	71e3      	strb	r3, [r4, #7]
c0de5a6e:	9b00      	ldr	r3, [sp, #0]
c0de5a70:	b21b      	sxth	r3, r3
c0de5a72:	330c      	adds	r3, #12
c0de5a74:	fb93 f3f5 	sdiv	r3, r3, r5
c0de5a78:	7663      	strb	r3, [r4, #25]
c0de5a7a:	768a      	strb	r2, [r1, #26]
c0de5a7c:	ea48 220e 	orr.w	r2, r8, lr, lsl #8
c0de5a80:	0a1d      	lsrs	r5, r3, #8
c0de5a82:	4410      	add	r0, r2
c0de5a84:	76a5      	strb	r5, [r4, #26]
c0de5a86:	4665      	mov	r5, ip
c0de5a88:	300c      	adds	r0, #12
c0de5a8a:	7008      	strb	r0, [r1, #0]
c0de5a8c:	0a00      	lsrs	r0, r0, #8
c0de5a8e:	7048      	strb	r0, [r1, #1]
c0de5a90:	f8d5 00a0 	ldr.w	r0, [r5, #160]	@ 0xa0
c0de5a94:	f002 f8b6 	bl	c0de7c04 <OUTLINED_FUNCTION_27>
c0de5a98:	f8d5 00a0 	ldr.w	r0, [r5, #160]	@ 0xa0
c0de5a9c:	f001 ff5c 	bl	c0de7958 <OUTLINED_FUNCTION_1>
c0de5aa0:	4650      	mov	r0, sl
c0de5aa2:	b004      	add	sp, #16
c0de5aa4:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de5aa8:	000018e8 	.word	0x000018e8

c0de5aac <nbgl_layoutAddSwitch>:
c0de5aac:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de5aae:	b1d8      	cbz	r0, c0de5ae8 <nbgl_layoutAddSwitch+0x3c>
c0de5ab0:	2200      	movs	r2, #0
c0de5ab2:	e9cd 2201 	strd	r2, r2, [sp, #4]
c0de5ab6:	f88d 2016 	strb.w	r2, [sp, #22]
c0de5aba:	2201      	movs	r2, #1
c0de5abc:	f88d 2000 	strb.w	r2, [sp]
c0de5ac0:	e9d1 2300 	ldrd	r2, r3, [r1]
c0de5ac4:	e9cd 2303 	strd	r2, r3, [sp, #12]
c0de5ac8:	7a4a      	ldrb	r2, [r1, #9]
c0de5aca:	f88d 2014 	strb.w	r2, [sp, #20]
c0de5ace:	7a8a      	ldrb	r2, [r1, #10]
c0de5ad0:	7a09      	ldrb	r1, [r1, #8]
c0de5ad2:	f88d 1015 	strb.w	r1, [sp, #21]
c0de5ad6:	4669      	mov	r1, sp
c0de5ad8:	f88d 2017 	strb.w	r2, [sp, #23]
c0de5adc:	f7ff fe0a 	bl	c0de56f4 <addListItem>
c0de5ae0:	b110      	cbz	r0, c0de5ae8 <nbgl_layoutAddSwitch+0x3c>
c0de5ae2:	f002 f99c 	bl	c0de7e1e <OUTLINED_FUNCTION_55>
c0de5ae6:	e001      	b.n	c0de5aec <nbgl_layoutAddSwitch+0x40>
c0de5ae8:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de5aec:	b006      	add	sp, #24
c0de5aee:	bd80      	pop	{r7, pc}

c0de5af0 <nbgl_layoutAddText>:
c0de5af0:	b5e0      	push	{r5, r6, r7, lr}
c0de5af2:	2300      	movs	r3, #0
c0de5af4:	e9cd 3300 	strd	r3, r3, [sp]
c0de5af8:	2300      	movs	r3, #0
c0de5afa:	f000 f801 	bl	c0de5b00 <addText>
c0de5afe:	bd8c      	pop	{r2, r3, r7, pc}

c0de5b00 <addText>:
c0de5b00:	2800      	cmp	r0, #0
c0de5b02:	f000 8115 	beq.w	c0de5d30 <addText+0x230>
c0de5b06:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de5b0a:	4683      	mov	fp, r0
c0de5b0c:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de5b10:	460c      	mov	r4, r1
c0de5b12:	9e0d      	ldr	r6, [sp, #52]	@ 0x34
c0de5b14:	461f      	mov	r7, r3
c0de5b16:	9203      	str	r2, [sp, #12]
c0de5b18:	f04f 0a01 	mov.w	sl, #1
c0de5b1c:	f002 f801 	bl	c0de7b22 <OUTLINED_FUNCTION_16>
c0de5b20:	4605      	mov	r5, r0
c0de5b22:	2002      	movs	r0, #2
c0de5b24:	2e00      	cmp	r6, #0
c0de5b26:	bf18      	it	ne
c0de5b28:	2003      	movne	r0, #3
c0de5b2a:	f89b 10ad 	ldrb.w	r1, [fp, #173]	@ 0xad
c0de5b2e:	f002 f9eb 	bl	c0de7f08 <OUTLINED_FUNCTION_74>
c0de5b32:	21a0      	movs	r1, #160	@ 0xa0
c0de5b34:	0e02      	lsrs	r2, r0, #24
c0de5b36:	f04f 0800 	mov.w	r8, #0
c0de5b3a:	f885 a005 	strb.w	sl, [r5, #5]
c0de5b3e:	7129      	strb	r1, [r5, #4]
c0de5b40:	4629      	mov	r1, r5
c0de5b42:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de5b46:	70ca      	strb	r2, [r1, #3]
c0de5b48:	0c02      	lsrs	r2, r0, #16
c0de5b4a:	0a00      	lsrs	r0, r0, #8
c0de5b4c:	2c00      	cmp	r4, #0
c0de5b4e:	708a      	strb	r2, [r1, #2]
c0de5b50:	f885 0023 	strb.w	r0, [r5, #35]	@ 0x23
c0de5b54:	f000 809f 	beq.w	c0de5c96 <addText+0x196>
c0de5b58:	f89b 00ad 	ldrb.w	r0, [fp, #173]	@ 0xad
c0de5b5c:	9701      	str	r7, [sp, #4]
c0de5b5e:	2604      	movs	r6, #4
c0de5b60:	f001 fef6 	bl	c0de7950 <OUTLINED_FUNCTION_0>
c0de5b64:	4607      	mov	r7, r0
c0de5b66:	f880 801f 	strb.w	r8, [r0, #31]
c0de5b6a:	4620      	mov	r0, r4
c0de5b6c:	9402      	str	r4, [sp, #8]
c0de5b6e:	f006 fa01 	bl	c0debf74 <pic>
c0de5b72:	4601      	mov	r1, r0
c0de5b74:	201c      	movs	r0, #28
c0de5b76:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
c0de5b78:	f887 a024 	strb.w	sl, [r7, #36]	@ 0x24
c0de5b7c:	f887 801a 	strb.w	r8, [r7, #26]
c0de5b80:	f887 6020 	strb.w	r6, [r7, #32]
c0de5b84:	f887 8021 	strb.w	r8, [r7, #33]	@ 0x21
c0de5b88:	f887 8016 	strb.w	r8, [r7, #22]
c0de5b8c:	7678      	strb	r0, [r7, #25]
c0de5b8e:	200c      	movs	r0, #12
c0de5b90:	0e0a      	lsrs	r2, r1, #24
c0de5b92:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de5b96:	4638      	mov	r0, r7
c0de5b98:	469a      	mov	sl, r3
c0de5b9a:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de5b9e:	f002 f8f7 	bl	c0de7d90 <OUTLINED_FUNCTION_45>
c0de5ba2:	796a      	ldrb	r2, [r5, #5]
c0de5ba4:	7928      	ldrb	r0, [r5, #4]
c0de5ba6:	7138      	strb	r0, [r7, #4]
c0de5ba8:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de5bac:	717a      	strb	r2, [r7, #5]
c0de5bae:	b153      	cbz	r3, c0de5bc6 <addText+0xc6>
c0de5bb0:	4a71      	ldr	r2, [pc, #452]	@ (c0de5d78 <addText+0x278>)
c0de5bb2:	447a      	add	r2, pc
c0de5bb4:	7813      	ldrb	r3, [r2, #0]
c0de5bb6:	7852      	ldrb	r2, [r2, #1]
c0de5bb8:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de5bbc:	1a80      	subs	r0, r0, r2
c0de5bbe:	380c      	subs	r0, #12
c0de5bc0:	0a02      	lsrs	r2, r0, #8
c0de5bc2:	7138      	strb	r0, [r7, #4]
c0de5bc4:	717a      	strb	r2, [r7, #5]
c0de5bc6:	b282      	uxth	r2, r0
c0de5bc8:	200c      	movs	r0, #12
c0de5bca:	2301      	movs	r3, #1
c0de5bcc:	f006 f80a 	bl	c0debbe4 <nbgl_getTextHeightInWidth>
c0de5bd0:	4629      	mov	r1, r5
c0de5bd2:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de5bd6:	784e      	ldrb	r6, [r1, #1]
c0de5bd8:	788c      	ldrb	r4, [r1, #2]
c0de5bda:	78ca      	ldrb	r2, [r1, #3]
c0de5bdc:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de5be0:	ea4c 2606 	orr.w	r6, ip, r6, lsl #8
c0de5be4:	ea44 2202 	orr.w	r2, r4, r2, lsl #8
c0de5be8:	ea46 4202 	orr.w	r2, r6, r2, lsl #16
c0de5bec:	f842 7023 	str.w	r7, [r2, r3, lsl #2]
c0de5bf0:	0a02      	lsrs	r2, r0, #8
c0de5bf2:	71b8      	strb	r0, [r7, #6]
c0de5bf4:	71fa      	strb	r2, [r7, #7]
c0de5bf6:	1c5a      	adds	r2, r3, #1
c0de5bf8:	f801 2c02 	strb.w	r2, [r1, #-2]
c0de5bfc:	7e79      	ldrb	r1, [r7, #25]
c0de5bfe:	7eba      	ldrb	r2, [r7, #26]
c0de5c00:	f1ba 0f00 	cmp.w	sl, #0
c0de5c04:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de5c08:	eb01 0800 	add.w	r8, r1, r0
c0de5c0c:	d042      	beq.n	c0de5c94 <addText+0x194>
c0de5c0e:	f89b 00ad 	ldrb.w	r0, [fp, #173]	@ 0xad
c0de5c12:	f8dd a030 	ldr.w	sl, [sp, #48]	@ 0x30
c0de5c16:	f001 ffb7 	bl	c0de7b88 <OUTLINED_FUNCTION_21>
c0de5c1a:	9a01      	ldr	r2, [sp, #4]
c0de5c1c:	4606      	mov	r6, r0
c0de5c1e:	4658      	mov	r0, fp
c0de5c20:	4629      	mov	r1, r5
c0de5c22:	2309      	movs	r3, #9
c0de5c24:	f7fe fb72 	bl	c0de430c <layoutAddCallbackObj>
c0de5c28:	4954      	ldr	r1, [pc, #336]	@ (c0de5d7c <addText+0x27c>)
c0de5c2a:	4479      	add	r1, pc
c0de5c2c:	0a0a      	lsrs	r2, r1, #8
c0de5c2e:	0e0b      	lsrs	r3, r1, #24
c0de5c30:	f886 2022 	strb.w	r2, [r6, #34]	@ 0x22
c0de5c34:	0a3a      	lsrs	r2, r7, #8
c0de5c36:	74f2      	strb	r2, [r6, #19]
c0de5c38:	4632      	mov	r2, r6
c0de5c3a:	f802 1f21 	strb.w	r1, [r2, #33]!
c0de5c3e:	0c09      	lsrs	r1, r1, #16
c0de5c40:	7091      	strb	r1, [r2, #2]
c0de5c42:	4631      	mov	r1, r6
c0de5c44:	70d3      	strb	r3, [r2, #3]
c0de5c46:	0e3a      	lsrs	r2, r7, #24
c0de5c48:	f002 f93c 	bl	c0de7ec4 <OUTLINED_FUNCTION_69>
c0de5c4c:	4629      	mov	r1, r5
c0de5c4e:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de5c52:	784c      	ldrb	r4, [r1, #1]
c0de5c54:	788f      	ldrb	r7, [r1, #2]
c0de5c56:	78ca      	ldrb	r2, [r1, #3]
c0de5c58:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de5c5c:	ea4c 2404 	orr.w	r4, ip, r4, lsl #8
c0de5c60:	ea47 2202 	orr.w	r2, r7, r2, lsl #8
c0de5c64:	ea44 4202 	orr.w	r2, r4, r2, lsl #16
c0de5c68:	240c      	movs	r4, #12
c0de5c6a:	f842 6023 	str.w	r6, [r2, r3, lsl #2]
c0de5c6e:	2200      	movs	r2, #0
c0de5c70:	75f4      	strb	r4, [r6, #23]
c0de5c72:	f880 a005 	strb.w	sl, [r0, #5]
c0de5c76:	2001      	movs	r0, #1
c0de5c78:	75b4      	strb	r4, [r6, #22]
c0de5c7a:	7632      	strb	r2, [r6, #24]
c0de5c7c:	77f2      	strb	r2, [r6, #31]
c0de5c7e:	f801 0c06 	strb.w	r0, [r1, #-6]
c0de5c82:	f10a 000f 	add.w	r0, sl, #15
c0de5c86:	f801 2c05 	strb.w	r2, [r1, #-5]
c0de5c8a:	f801 0c04 	strb.w	r0, [r1, #-4]
c0de5c8e:	1c58      	adds	r0, r3, #1
c0de5c90:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de5c94:	9c02      	ldr	r4, [sp, #8]
c0de5c96:	9e03      	ldr	r6, [sp, #12]
c0de5c98:	2e00      	cmp	r6, #0
c0de5c9a:	d04b      	beq.n	c0de5d34 <addText+0x234>
c0de5c9c:	f89b 00ad 	ldrb.w	r0, [fp, #173]	@ 0xad
c0de5ca0:	f001 fe56 	bl	c0de7950 <OUTLINED_FUNCTION_0>
c0de5ca4:	f04f 0a00 	mov.w	sl, #0
c0de5ca8:	4607      	mov	r7, r0
c0de5caa:	f880 a01f 	strb.w	sl, [r0, #31]
c0de5cae:	f002 f906 	bl	c0de7ebe <OUTLINED_FUNCTION_68>
c0de5cb2:	4601      	mov	r1, r0
c0de5cb4:	200b      	movs	r0, #11
c0de5cb6:	2301      	movs	r3, #1
c0de5cb8:	f887 a021 	strb.w	sl, [r7, #33]	@ 0x21
c0de5cbc:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de5cc0:	2001      	movs	r0, #1
c0de5cc2:	0e0a      	lsrs	r2, r1, #24
c0de5cc4:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de5cc8:	4638      	mov	r0, r7
c0de5cca:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de5cce:	f002 f85f 	bl	c0de7d90 <OUTLINED_FUNCTION_45>
c0de5cd2:	796a      	ldrb	r2, [r5, #5]
c0de5cd4:	7928      	ldrb	r0, [r5, #4]
c0de5cd6:	717a      	strb	r2, [r7, #5]
c0de5cd8:	7138      	strb	r0, [r7, #4]
c0de5cda:	ea40 2202 	orr.w	r2, r0, r2, lsl #8
c0de5cde:	f002 f848 	bl	c0de7d72 <OUTLINED_FUNCTION_43>
c0de5ce2:	210e      	movs	r1, #14
c0de5ce4:	f887 a01a 	strb.w	sl, [r7, #26]
c0de5ce8:	462a      	mov	r2, r5
c0de5cea:	2c00      	cmp	r4, #0
c0de5cec:	bf08      	it	eq
c0de5cee:	211a      	moveq	r1, #26
c0de5cf0:	7679      	strb	r1, [r7, #25]
c0de5cf2:	f887 a016 	strb.w	sl, [r7, #22]
c0de5cf6:	f812 cf22 	ldrb.w	ip, [r2, #34]!
c0de5cfa:	7856      	ldrb	r6, [r2, #1]
c0de5cfc:	f892 e002 	ldrb.w	lr, [r2, #2]
c0de5d00:	78d3      	ldrb	r3, [r2, #3]
c0de5d02:	f812 4c02 	ldrb.w	r4, [r2, #-2]
c0de5d06:	ea4c 2606 	orr.w	r6, ip, r6, lsl #8
c0de5d0a:	ea4e 2303 	orr.w	r3, lr, r3, lsl #8
c0de5d0e:	ea46 4303 	orr.w	r3, r6, r3, lsl #16
c0de5d12:	f843 7024 	str.w	r7, [r3, r4, lsl #2]
c0de5d16:	2304      	movs	r3, #4
c0de5d18:	71b8      	strb	r0, [r7, #6]
c0de5d1a:	f887 3020 	strb.w	r3, [r7, #32]
c0de5d1e:	0a03      	lsrs	r3, r0, #8
c0de5d20:	4440      	add	r0, r8
c0de5d22:	4408      	add	r0, r1
c0de5d24:	71fb      	strb	r3, [r7, #7]
c0de5d26:	1c63      	adds	r3, r4, #1
c0de5d28:	f802 3c02 	strb.w	r3, [r2, #-2]
c0de5d2c:	301a      	adds	r0, #26
c0de5d2e:	e003      	b.n	c0de5d38 <addText+0x238>
c0de5d30:	f001 bfca 	b.w	c0de7cc8 <OUTLINED_FUNCTION_35>
c0de5d34:	f108 001c 	add.w	r0, r8, #28
c0de5d38:	f8db 10a0 	ldr.w	r1, [fp, #160]	@ 0xa0
c0de5d3c:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de5d40:	784c      	ldrb	r4, [r1, #1]
c0de5d42:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de5d46:	788e      	ldrb	r6, [r1, #2]
c0de5d48:	78c9      	ldrb	r1, [r1, #3]
c0de5d4a:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de5d4e:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de5d52:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de5d56:	2220      	movs	r2, #32
c0de5d58:	f841 5023 	str.w	r5, [r1, r3, lsl #2]
c0de5d5c:	2100      	movs	r1, #0
c0de5d5e:	71a8      	strb	r0, [r5, #6]
c0de5d60:	75ea      	strb	r2, [r5, #23]
c0de5d62:	7629      	strb	r1, [r5, #24]
c0de5d64:	77e9      	strb	r1, [r5, #31]
c0de5d66:	75a9      	strb	r1, [r5, #22]
c0de5d68:	0a01      	lsrs	r1, r0, #8
c0de5d6a:	b280      	uxth	r0, r0
c0de5d6c:	71e9      	strb	r1, [r5, #7]
c0de5d6e:	f8db 10a0 	ldr.w	r1, [fp, #160]	@ 0xa0
c0de5d72:	f002 b84c 	b.w	c0de7e0e <OUTLINED_FUNCTION_54>
c0de5d76:	bf00      	nop
c0de5d78:	000077dc 	.word	0x000077dc
c0de5d7c:	0000749f 	.word	0x0000749f

c0de5d80 <nbgl_layoutAddTextWithAlias>:
c0de5d80:	b51c      	push	{r2, r3, r4, lr}
c0de5d82:	2401      	movs	r4, #1
c0de5d84:	9401      	str	r4, [sp, #4]
c0de5d86:	9c04      	ldr	r4, [sp, #16]
c0de5d88:	9400      	str	r4, [sp, #0]
c0de5d8a:	f7ff feb9 	bl	c0de5b00 <addText>
c0de5d8e:	bd1c      	pop	{r2, r3, r4, pc}

c0de5d90 <nbgl_layoutAddTextContent>:
c0de5d90:	2800      	cmp	r0, #0
c0de5d92:	f000 80b5 	beq.w	c0de5f00 <nbgl_layoutAddTextContent+0x170>
c0de5d96:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de5d9a:	4682      	mov	sl, r0
c0de5d9c:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de5da0:	4e58      	ldr	r6, [pc, #352]	@ (c0de5f04 <nbgl_layoutAddTextContent+0x174>)
c0de5da2:	460d      	mov	r5, r1
c0de5da4:	e9cd 2302 	strd	r2, r3, [sp, #8]
c0de5da8:	08c1      	lsrs	r1, r0, #3
c0de5daa:	447e      	add	r6, pc
c0de5dac:	2004      	movs	r0, #4
c0de5dae:	47b0      	blx	r6
c0de5db0:	f04f 0b00 	mov.w	fp, #0
c0de5db4:	4607      	mov	r7, r0
c0de5db6:	f880 b01f 	strb.w	fp, [r0, #31]
c0de5dba:	4628      	mov	r0, r5
c0de5dbc:	4c52      	ldr	r4, [pc, #328]	@ (c0de5f08 <nbgl_layoutAddTextContent+0x178>)
c0de5dbe:	447c      	add	r4, pc
c0de5dc0:	47a0      	blx	r4
c0de5dc2:	4601      	mov	r1, r0
c0de5dc4:	2010      	movs	r0, #16
c0de5dc6:	2201      	movs	r2, #1
c0de5dc8:	9401      	str	r4, [sp, #4]
c0de5dca:	f887 b01a 	strb.w	fp, [r7, #26]
c0de5dce:	f887 b018 	strb.w	fp, [r7, #24]
c0de5dd2:	f887 b021 	strb.w	fp, [r7, #33]	@ 0x21
c0de5dd6:	f887 b016 	strb.w	fp, [r7, #22]
c0de5dda:	2301      	movs	r3, #1
c0de5ddc:	46a0      	mov	r8, r4
c0de5dde:	7678      	strb	r0, [r7, #25]
c0de5de0:	2020      	movs	r0, #32
c0de5de2:	717a      	strb	r2, [r7, #5]
c0de5de4:	f887 2024 	strb.w	r2, [r7, #36]	@ 0x24
c0de5de8:	0e0a      	lsrs	r2, r1, #24
c0de5dea:	75f8      	strb	r0, [r7, #23]
c0de5dec:	20a0      	movs	r0, #160	@ 0xa0
c0de5dee:	7138      	strb	r0, [r7, #4]
c0de5df0:	200d      	movs	r0, #13
c0de5df2:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de5df6:	2004      	movs	r0, #4
c0de5df8:	f887 0020 	strb.w	r0, [r7, #32]
c0de5dfc:	4638      	mov	r0, r7
c0de5dfe:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de5e02:	70c2      	strb	r2, [r0, #3]
c0de5e04:	0c0a      	lsrs	r2, r1, #16
c0de5e06:	7082      	strb	r2, [r0, #2]
c0de5e08:	0a08      	lsrs	r0, r1, #8
c0de5e0a:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de5e0e:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de5e12:	200d      	movs	r0, #13
c0de5e14:	4d3d      	ldr	r5, [pc, #244]	@ (c0de5f0c <nbgl_layoutAddTextContent+0x17c>)
c0de5e16:	447d      	add	r5, pc
c0de5e18:	47a8      	blx	r5
c0de5e1a:	f8da 10a0 	ldr.w	r1, [sl, #160]	@ 0xa0
c0de5e1e:	f001 fecc 	bl	c0de7bba <OUTLINED_FUNCTION_24>
c0de5e22:	71b8      	strb	r0, [r7, #6]
c0de5e24:	0a00      	lsrs	r0, r0, #8
c0de5e26:	71f8      	strb	r0, [r7, #7]
c0de5e28:	f001 ff42 	bl	c0de7cb0 <OUTLINED_FUNCTION_34>
c0de5e2c:	4607      	mov	r7, r0
c0de5e2e:	f880 b01f 	strb.w	fp, [r0, #31]
c0de5e32:	9802      	ldr	r0, [sp, #8]
c0de5e34:	47c0      	blx	r8
c0de5e36:	4601      	mov	r1, r0
c0de5e38:	2001      	movs	r0, #1
c0de5e3a:	22a0      	movs	r2, #160	@ 0xa0
c0de5e3c:	2301      	movs	r3, #1
c0de5e3e:	f04f 0801 	mov.w	r8, #1
c0de5e42:	f887 b021 	strb.w	fp, [r7, #33]	@ 0x21
c0de5e46:	713a      	strb	r2, [r7, #4]
c0de5e48:	220b      	movs	r2, #11
c0de5e4a:	7178      	strb	r0, [r7, #5]
c0de5e4c:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de5e50:	4638      	mov	r0, r7
c0de5e52:	f887 2022 	strb.w	r2, [r7, #34]	@ 0x22
c0de5e56:	f001 ffc6 	bl	c0de7de6 <OUTLINED_FUNCTION_52>
c0de5e5a:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de5e5e:	200b      	movs	r0, #11
c0de5e60:	47a8      	blx	r5
c0de5e62:	f8da 10a0 	ldr.w	r1, [sl, #160]	@ 0xa0
c0de5e66:	f887 b01a 	strb.w	fp, [r7, #26]
c0de5e6a:	f887 b018 	strb.w	fp, [r7, #24]
c0de5e6e:	f887 b016 	strb.w	fp, [r7, #22]
c0de5e72:	f001 fea2 	bl	c0de7bba <OUTLINED_FUNCTION_24>
c0de5e76:	2104      	movs	r1, #4
c0de5e78:	71b8      	strb	r0, [r7, #6]
c0de5e7a:	0a00      	lsrs	r0, r0, #8
c0de5e7c:	f887 1020 	strb.w	r1, [r7, #32]
c0de5e80:	2118      	movs	r1, #24
c0de5e82:	71f8      	strb	r0, [r7, #7]
c0de5e84:	7679      	strb	r1, [r7, #25]
c0de5e86:	2120      	movs	r1, #32
c0de5e88:	75f9      	strb	r1, [r7, #23]
c0de5e8a:	f001 ff11 	bl	c0de7cb0 <OUTLINED_FUNCTION_34>
c0de5e8e:	4606      	mov	r6, r0
c0de5e90:	f880 801f 	strb.w	r8, [r0, #31]
c0de5e94:	9803      	ldr	r0, [sp, #12]
c0de5e96:	9901      	ldr	r1, [sp, #4]
c0de5e98:	4788      	blx	r1
c0de5e9a:	4601      	mov	r1, r0
c0de5e9c:	20a0      	movs	r0, #160	@ 0xa0
c0de5e9e:	2301      	movs	r3, #1
c0de5ea0:	f886 8005 	strb.w	r8, [r6, #5]
c0de5ea4:	f886 8024 	strb.w	r8, [r6, #36]	@ 0x24
c0de5ea8:	f886 b021 	strb.w	fp, [r6, #33]	@ 0x21
c0de5eac:	7130      	strb	r0, [r6, #4]
c0de5eae:	200b      	movs	r0, #11
c0de5eb0:	0e0a      	lsrs	r2, r1, #24
c0de5eb2:	f001 fec9 	bl	c0de7c48 <OUTLINED_FUNCTION_30>
c0de5eb6:	47a8      	blx	r5
c0de5eb8:	f8da 10a0 	ldr.w	r1, [sl, #160]	@ 0xa0
c0de5ebc:	f886 b01a 	strb.w	fp, [r6, #26]
c0de5ec0:	f886 b018 	strb.w	fp, [r6, #24]
c0de5ec4:	f001 fdb0 	bl	c0de7a28 <OUTLINED_FUNCTION_8>
c0de5ec8:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
c0de5ecc:	2128      	movs	r1, #40	@ 0x28
c0de5ece:	71b0      	strb	r0, [r6, #6]
c0de5ed0:	0a00      	lsrs	r0, r0, #8
c0de5ed2:	7671      	strb	r1, [r6, #25]
c0de5ed4:	2120      	movs	r1, #32
c0de5ed6:	71f0      	strb	r0, [r6, #7]
c0de5ed8:	75f1      	strb	r1, [r6, #23]
c0de5eda:	2104      	movs	r1, #4
c0de5edc:	f8da 00a0 	ldr.w	r0, [sl, #160]	@ 0xa0
c0de5ee0:	f886 1020 	strb.w	r1, [r6, #32]
c0de5ee4:	2107      	movs	r1, #7
c0de5ee6:	75b1      	strb	r1, [r6, #22]
c0de5ee8:	f890 3020 	ldrb.w	r3, [r0, #32]
c0de5eec:	7981      	ldrb	r1, [r0, #6]
c0de5eee:	79c2      	ldrb	r2, [r0, #7]
c0de5ef0:	3301      	adds	r3, #1
c0de5ef2:	f880 3020 	strb.w	r3, [r0, #32]
c0de5ef6:	ea41 2002 	orr.w	r0, r1, r2, lsl #8
c0de5efa:	b004      	add	sp, #16
c0de5efc:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de5f00:	f001 bee2 	b.w	c0de7cc8 <OUTLINED_FUNCTION_35>
c0de5f04:	00005e05 	.word	0x00005e05
c0de5f08:	000061b3 	.word	0x000061b3
c0de5f0c:	00005dcb 	.word	0x00005dcb

c0de5f10 <nbgl_layoutAddRadioChoice>:
c0de5f10:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de5f14:	2800      	cmp	r0, #0
c0de5f16:	f000 8102 	beq.w	c0de611e <nbgl_layoutAddRadioChoice+0x20e>
c0de5f1a:	4605      	mov	r5, r0
c0de5f1c:	4884      	ldr	r0, [pc, #528]	@ (c0de6130 <nbgl_layoutAddRadioChoice+0x220>)
c0de5f1e:	468a      	mov	sl, r1
c0de5f20:	f04f 0800 	mov.w	r8, #0
c0de5f24:	e9cd 1501 	strd	r1, r5, [sp, #4]
c0de5f28:	4478      	add	r0, pc
c0de5f2a:	9003      	str	r0, [sp, #12]
c0de5f2c:	f89a 0005 	ldrb.w	r0, [sl, #5]
c0de5f30:	4580      	cmp	r8, r0
c0de5f32:	f080 80f7 	bcs.w	c0de6124 <nbgl_layoutAddRadioChoice+0x214>
c0de5f36:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de5f3a:	9c03      	ldr	r4, [sp, #12]
c0de5f3c:	08c1      	lsrs	r1, r0, #3
c0de5f3e:	2001      	movs	r0, #1
c0de5f40:	47a0      	blx	r4
c0de5f42:	4606      	mov	r6, r0
c0de5f44:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de5f48:	08c1      	lsrs	r1, r0, #3
c0de5f4a:	2004      	movs	r0, #4
c0de5f4c:	47a0      	blx	r4
c0de5f4e:	4607      	mov	r7, r0
c0de5f50:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de5f54:	08c1      	lsrs	r1, r0, #3
c0de5f56:	2009      	movs	r0, #9
c0de5f58:	47a0      	blx	r4
c0de5f5a:	f89a 2007 	ldrb.w	r2, [sl, #7]
c0de5f5e:	f89a 3008 	ldrb.w	r3, [sl, #8]
c0de5f62:	4604      	mov	r4, r0
c0de5f64:	4628      	mov	r0, r5
c0de5f66:	f001 fe0c 	bl	c0de7b82 <OUTLINED_FUNCTION_20>
c0de5f6a:	2800      	cmp	r0, #0
c0de5f6c:	f000 80d7 	beq.w	c0de611e <nbgl_layoutAddRadioChoice+0x20e>
c0de5f70:	2002      	movs	r0, #2
c0de5f72:	f886 0020 	strb.w	r0, [r6, #32]
c0de5f76:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de5f7a:	08c1      	lsrs	r1, r0, #3
c0de5f7c:	2002      	movs	r0, #2
c0de5f7e:	f005 fe1d 	bl	c0debbbc <nbgl_containerPoolGet>
c0de5f82:	2300      	movs	r3, #0
c0de5f84:	ea4f 2c16 	mov.w	ip, r6, lsr #8
c0de5f88:	4631      	mov	r1, r6
c0de5f8a:	0e02      	lsrs	r2, r0, #24
c0de5f8c:	4655      	mov	r5, sl
c0de5f8e:	ea4f 6a16 	mov.w	sl, r6, lsr #24
c0de5f92:	ea4f 4b16 	mov.w	fp, r6, lsr #16
c0de5f96:	74f3      	strb	r3, [r6, #19]
c0de5f98:	f884 c013 	strb.w	ip, [r4, #19]
c0de5f9c:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de5fa0:	70ca      	strb	r2, [r1, #3]
c0de5fa2:	0c02      	lsrs	r2, r0, #16
c0de5fa4:	708a      	strb	r2, [r1, #2]
c0de5fa6:	0a01      	lsrs	r1, r0, #8
c0de5fa8:	f886 1023 	strb.w	r1, [r6, #35]	@ 0x23
c0de5fac:	4631      	mov	r1, r6
c0de5fae:	f801 3f12 	strb.w	r3, [r1, #18]!
c0de5fb2:	70cb      	strb	r3, [r1, #3]
c0de5fb4:	708b      	strb	r3, [r1, #2]
c0de5fb6:	4621      	mov	r1, r4
c0de5fb8:	f801 6f12 	strb.w	r6, [r1, #18]!
c0de5fbc:	f881 b002 	strb.w	fp, [r1, #2]
c0de5fc0:	f881 a003 	strb.w	sl, [r1, #3]
c0de5fc4:	2120      	movs	r1, #32
c0de5fc6:	7633      	strb	r3, [r6, #24]
c0de5fc8:	71f3      	strb	r3, [r6, #7]
c0de5fca:	75b3      	strb	r3, [r6, #22]
c0de5fcc:	75f1      	strb	r1, [r6, #23]
c0de5fce:	215c      	movs	r1, #92	@ 0x5c
c0de5fd0:	71b1      	strb	r1, [r6, #6]
c0de5fd2:	2101      	movs	r1, #1
c0de5fd4:	7171      	strb	r1, [r6, #5]
c0de5fd6:	21a0      	movs	r1, #160	@ 0xa0
c0de5fd8:	7131      	strb	r1, [r6, #4]
c0de5fda:	2102      	movs	r1, #2
c0de5fdc:	6044      	str	r4, [r0, #4]
c0de5fde:	77e3      	strb	r3, [r4, #31]
c0de5fe0:	f884 3021 	strb.w	r3, [r4, #33]	@ 0x21
c0de5fe4:	7928      	ldrb	r0, [r5, #4]
c0de5fe6:	f884 1020 	strb.w	r1, [r4, #32]
c0de5fea:	2106      	movs	r1, #6
c0de5fec:	75a1      	strb	r1, [r4, #22]
c0de5fee:	b110      	cbz	r0, c0de5ff6 <nbgl_layoutAddRadioChoice+0xe6>
c0de5ff0:	f44f 70d0 	mov.w	r0, #416	@ 0x1a0
c0de5ff4:	e014      	b.n	c0de6020 <nbgl_layoutAddRadioChoice+0x110>
c0de5ff6:	6828      	ldr	r0, [r5, #0]
c0de5ff8:	4665      	mov	r5, ip
c0de5ffa:	f850 0028 	ldr.w	r0, [r0, r8, lsl #2]
c0de5ffe:	f005 ffb9 	bl	c0debf74 <pic>
c0de6002:	4639      	mov	r1, r7
c0de6004:	0e02      	lsrs	r2, r0, #24
c0de6006:	46ac      	mov	ip, r5
c0de6008:	9d01      	ldr	r5, [sp, #4]
c0de600a:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de600e:	70ca      	strb	r2, [r1, #3]
c0de6010:	0c02      	lsrs	r2, r0, #16
c0de6012:	0a00      	lsrs	r0, r0, #8
c0de6014:	708a      	strb	r2, [r1, #2]
c0de6016:	7048      	strb	r0, [r1, #1]
c0de6018:	7930      	ldrb	r0, [r6, #4]
c0de601a:	7971      	ldrb	r1, [r6, #5]
c0de601c:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de6020:	4639      	mov	r1, r7
c0de6022:	f887 c013 	strb.w	ip, [r7, #19]
c0de6026:	4632      	mov	r2, r6
c0de6028:	3828      	subs	r0, #40	@ 0x28
c0de602a:	f801 6f12 	strb.w	r6, [r1, #18]!
c0de602e:	f881 b002 	strb.w	fp, [r1, #2]
c0de6032:	f881 a003 	strb.w	sl, [r1, #3]
c0de6036:	f04f 0b00 	mov.w	fp, #0
c0de603a:	46aa      	mov	sl, r5
c0de603c:	f896 1023 	ldrb.w	r1, [r6, #35]	@ 0x23
c0de6040:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de6044:	f886 b01d 	strb.w	fp, [r6, #29]
c0de6048:	f001 ff61 	bl	c0de7f0e <OUTLINED_FUNCTION_75>
c0de604c:	4b37      	ldr	r3, [pc, #220]	@ (c0de612c <nbgl_layoutAddRadioChoice+0x21c>)
c0de604e:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de6052:	600f      	str	r7, [r1, #0]
c0de6054:	f819 1003 	ldrb.w	r1, [r9, r3]
c0de6058:	1c4a      	adds	r2, r1, #1
c0de605a:	3114      	adds	r1, #20
c0de605c:	f809 2003 	strb.w	r2, [r9, r3]
c0de6060:	2201      	movs	r2, #1
c0de6062:	77b1      	strb	r1, [r6, #30]
c0de6064:	2104      	movs	r1, #4
c0de6066:	7732      	strb	r2, [r6, #28]
c0de6068:	f887 b021 	strb.w	fp, [r7, #33]	@ 0x21
c0de606c:	f887 1020 	strb.w	r1, [r7, #32]
c0de6070:	75b9      	strb	r1, [r7, #22]
c0de6072:	79aa      	ldrb	r2, [r5, #6]
c0de6074:	eba8 0302 	sub.w	r3, r8, r2
c0de6078:	fab3 f383 	clz	r3, r3
c0de607c:	095b      	lsrs	r3, r3, #5
c0de607e:	f884 3021 	strb.w	r3, [r4, #33]	@ 0x21
c0de6082:	7138      	strb	r0, [r7, #4]
c0de6084:	0a00      	lsrs	r0, r0, #8
c0de6086:	7178      	strb	r0, [r7, #5]
c0de6088:	ebb8 0002 	subs.w	r0, r8, r2
c0de608c:	bf18      	it	ne
c0de608e:	2001      	movne	r0, #1
c0de6090:	77f8      	strb	r0, [r7, #31]
c0de6092:	4590      	cmp	r8, r2
c0de6094:	f04f 000b 	mov.w	r0, #11
c0de6098:	bf08      	it	eq
c0de609a:	200c      	moveq	r0, #12
c0de609c:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de60a0:	f005 fd96 	bl	c0debbd0 <nbgl_getFontHeight>
c0de60a4:	9d02      	ldr	r5, [sp, #8]
c0de60a6:	f887 b007 	strb.w	fp, [r7, #7]
c0de60aa:	71b8      	strb	r0, [r7, #6]
c0de60ac:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de60b0:	08c0      	lsrs	r0, r0, #3
c0de60b2:	f000 f83f 	bl	c0de6134 <createHorizontalLine>
c0de60b6:	f8d5 10a0 	ldr.w	r1, [r5, #160]	@ 0xa0
c0de60ba:	f108 0801 	add.w	r8, r8, #1
c0de60be:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de60c2:	784c      	ldrb	r4, [r1, #1]
c0de60c4:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de60c8:	788f      	ldrb	r7, [r1, #2]
c0de60ca:	78c9      	ldrb	r1, [r1, #3]
c0de60cc:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de60d0:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de60d4:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de60d8:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
c0de60dc:	f8d5 10a0 	ldr.w	r1, [r5, #160]	@ 0xa0
c0de60e0:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de60e4:	784b      	ldrb	r3, [r1, #1]
c0de60e6:	788c      	ldrb	r4, [r1, #2]
c0de60e8:	78ce      	ldrb	r6, [r1, #3]
c0de60ea:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de60ee:	ea44 2306 	orr.w	r3, r4, r6, lsl #8
c0de60f2:	ea42 4203 	orr.w	r2, r2, r3, lsl #16
c0de60f6:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de60fa:	3301      	adds	r3, #1
c0de60fc:	f801 3c02 	strb.w	r3, [r1, #-2]
c0de6100:	21ff      	movs	r1, #255	@ 0xff
c0de6102:	b2dc      	uxtb	r4, r3
c0de6104:	7681      	strb	r1, [r0, #26]
c0de6106:	21fc      	movs	r1, #252	@ 0xfc
c0de6108:	f842 0024 	str.w	r0, [r2, r4, lsl #2]
c0de610c:	7641      	strb	r1, [r0, #25]
c0de610e:	2103      	movs	r1, #3
c0de6110:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de6114:	f8d5 00a0 	ldr.w	r0, [r5, #160]	@ 0xa0
c0de6118:	f001 fc1e 	bl	c0de7958 <OUTLINED_FUNCTION_1>
c0de611c:	e706      	b.n	c0de5f2c <nbgl_layoutAddRadioChoice+0x1c>
c0de611e:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de6122:	e000      	b.n	c0de6126 <nbgl_layoutAddRadioChoice+0x216>
c0de6124:	2000      	movs	r0, #0
c0de6126:	b004      	add	sp, #16
c0de6128:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de612c:	000018e8 	.word	0x000018e8
c0de6130:	00005c87 	.word	0x00005c87

c0de6134 <createHorizontalLine>:
c0de6134:	b580      	push	{r7, lr}
c0de6136:	4601      	mov	r1, r0
c0de6138:	2003      	movs	r0, #3
c0de613a:	f005 fd3a 	bl	c0debbb2 <nbgl_objPoolGet>
c0de613e:	2100      	movs	r1, #0
c0de6140:	22e0      	movs	r2, #224	@ 0xe0
c0de6142:	71c1      	strb	r1, [r0, #7]
c0de6144:	2104      	movs	r1, #4
c0de6146:	7102      	strb	r2, [r0, #4]
c0de6148:	2202      	movs	r2, #2
c0de614a:	7181      	strb	r1, [r0, #6]
c0de614c:	2101      	movs	r1, #1
c0de614e:	f880 2020 	strb.w	r2, [r0, #32]
c0de6152:	7141      	strb	r1, [r0, #5]
c0de6154:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de6158:	77c1      	strb	r1, [r0, #31]
c0de615a:	bd80      	pop	{r7, pc}

c0de615c <nbgl_layoutAddCenteredInfo>:
c0de615c:	b570      	push	{r4, r5, r6, lr}
c0de615e:	b08a      	sub	sp, #40	@ 0x28
c0de6160:	ae01      	add	r6, sp, #4
c0de6162:	460c      	mov	r4, r1
c0de6164:	4605      	mov	r5, r0
c0de6166:	2124      	movs	r1, #36	@ 0x24
c0de6168:	4630      	mov	r0, r6
c0de616a:	f006 f925 	bl	c0dec3b8 <__aeabi_memclr>
c0de616e:	b33d      	cbz	r5, c0de61c0 <nbgl_layoutAddCenteredInfo+0x64>
c0de6170:	6820      	ldr	r0, [r4, #0]
c0de6172:	68e1      	ldr	r1, [r4, #12]
c0de6174:	9102      	str	r1, [sp, #8]
c0de6176:	b128      	cbz	r0, c0de6184 <nbgl_layoutAddCenteredInfo+0x28>
c0de6178:	7c61      	ldrb	r1, [r4, #17]
c0de617a:	2210      	movs	r2, #16
c0de617c:	2903      	cmp	r1, #3
c0de617e:	bf08      	it	eq
c0de6180:	2214      	moveq	r2, #20
c0de6182:	50b0      	str	r0, [r6, r2]
c0de6184:	6860      	ldr	r0, [r4, #4]
c0de6186:	b128      	cbz	r0, c0de6194 <nbgl_layoutAddCenteredInfo+0x38>
c0de6188:	7c61      	ldrb	r1, [r4, #17]
c0de618a:	2218      	movs	r2, #24
c0de618c:	2901      	cmp	r1, #1
c0de618e:	bf08      	it	eq
c0de6190:	2214      	moveq	r2, #20
c0de6192:	50b0      	str	r0, [r6, r2]
c0de6194:	68a0      	ldr	r0, [r4, #8]
c0de6196:	b128      	cbz	r0, c0de61a4 <nbgl_layoutAddCenteredInfo+0x48>
c0de6198:	7c61      	ldrb	r1, [r4, #17]
c0de619a:	2218      	movs	r2, #24
c0de619c:	2902      	cmp	r1, #2
c0de619e:	bf08      	it	eq
c0de61a0:	221c      	moveq	r2, #28
c0de61a2:	50b0      	str	r0, [r6, r2]
c0de61a4:	a901      	add	r1, sp, #4
c0de61a6:	4628      	mov	r0, r5
c0de61a8:	f000 f816 	bl	c0de61d8 <addContentCenter>
c0de61ac:	7c21      	ldrb	r1, [r4, #16]
c0de61ae:	b151      	cbz	r1, c0de61c6 <nbgl_layoutAddCenteredInfo+0x6a>
c0de61b0:	2100      	movs	r1, #0
c0de61b2:	2220      	movs	r2, #32
c0de61b4:	7601      	strb	r1, [r0, #24]
c0de61b6:	75c2      	strb	r2, [r0, #23]
c0de61b8:	7581      	strb	r1, [r0, #22]
c0de61ba:	8a61      	ldrh	r1, [r4, #18]
c0de61bc:	3120      	adds	r1, #32
c0de61be:	e003      	b.n	c0de61c8 <nbgl_layoutAddCenteredInfo+0x6c>
c0de61c0:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de61c4:	e005      	b.n	c0de61d2 <nbgl_layoutAddCenteredInfo+0x76>
c0de61c6:	8a61      	ldrh	r1, [r4, #18]
c0de61c8:	7641      	strb	r1, [r0, #25]
c0de61ca:	0a09      	lsrs	r1, r1, #8
c0de61cc:	7681      	strb	r1, [r0, #26]
c0de61ce:	f001 fe26 	bl	c0de7e1e <OUTLINED_FUNCTION_55>
c0de61d2:	b00a      	add	sp, #40	@ 0x28
c0de61d4:	bd70      	pop	{r4, r5, r6, pc}
	...

c0de61d8 <addContentCenter>:
c0de61d8:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de61dc:	4606      	mov	r6, r0
c0de61de:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de61e2:	468b      	mov	fp, r1
c0de61e4:	f001 fc9d 	bl	c0de7b22 <OUTLINED_FUNCTION_16>
c0de61e8:	2400      	movs	r4, #0
c0de61ea:	4680      	mov	r8, r0
c0de61ec:	f880 4020 	strb.w	r4, [r0, #32]
c0de61f0:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de61f4:	08c1      	lsrs	r1, r0, #3
c0de61f6:	2006      	movs	r0, #6
c0de61f8:	f005 fce0 	bl	c0debbbc <nbgl_containerPoolGet>
c0de61fc:	4641      	mov	r1, r8
c0de61fe:	0e02      	lsrs	r2, r0, #24
c0de6200:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de6204:	f001 fdd2 	bl	c0de7dac <OUTLINED_FUNCTION_47>
c0de6208:	f888 0023 	strb.w	r0, [r8, #35]	@ 0x23
c0de620c:	f8db 0004 	ldr.w	r0, [fp, #4]
c0de6210:	2800      	cmp	r0, #0
c0de6212:	d079      	beq.n	c0de6308 <addContentCenter+0x130>
c0de6214:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de6218:	f001 fcb6 	bl	c0de7b88 <OUTLINED_FUNCTION_21>
c0de621c:	4607      	mov	r7, r0
c0de621e:	77c4      	strb	r4, [r0, #31]
c0de6220:	f8db 0004 	ldr.w	r0, [fp, #4]
c0de6224:	f005 fea6 	bl	c0debf74 <pic>
c0de6228:	4639      	mov	r1, r7
c0de622a:	0e02      	lsrs	r2, r0, #24
c0de622c:	46b2      	mov	sl, r6
c0de622e:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de6232:	70ca      	strb	r2, [r1, #3]
c0de6234:	0c02      	lsrs	r2, r0, #16
c0de6236:	708a      	strb	r2, [r1, #2]
c0de6238:	0a01      	lsrs	r1, r0, #8
c0de623a:	f887 1022 	strb.w	r1, [r7, #34]	@ 0x22
c0de623e:	4641      	mov	r1, r8
c0de6240:	f001 fd28 	bl	c0de7c94 <OUTLINED_FUNCTION_33>
c0de6244:	f842 7023 	str.w	r7, [r2, r3, lsl #2]
c0de6248:	2202      	movs	r2, #2
c0de624a:	3301      	adds	r3, #1
c0de624c:	75ba      	strb	r2, [r7, #22]
c0de624e:	f8bb 2020 	ldrh.w	r2, [fp, #32]
c0de6252:	767a      	strb	r2, [r7, #25]
c0de6254:	f801 3c02 	strb.w	r3, [r1, #-2]
c0de6258:	0a14      	lsrs	r4, r2, #8
c0de625a:	7881      	ldrb	r1, [r0, #2]
c0de625c:	78c0      	ldrb	r0, [r0, #3]
c0de625e:	76bc      	strb	r4, [r7, #26]
c0de6260:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de6264:	4410      	add	r0, r2
c0de6266:	9000      	str	r0, [sp, #0]
c0de6268:	f89b 0000 	ldrb.w	r0, [fp]
c0de626c:	2801      	cmp	r0, #1
c0de626e:	d146      	bne.n	c0de62fe <addContentCenter+0x126>
c0de6270:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de6274:	f001 fc88 	bl	c0de7b88 <OUTLINED_FUNCTION_21>
c0de6278:	4604      	mov	r4, r0
c0de627a:	2000      	movs	r0, #0
c0de627c:	77e0      	strb	r0, [r4, #31]
c0de627e:	f8db 0008 	ldr.w	r0, [fp, #8]
c0de6282:	6800      	ldr	r0, [r0, #0]
c0de6284:	6800      	ldr	r0, [r0, #0]
c0de6286:	f005 fe75 	bl	c0debf74 <pic>
c0de628a:	4621      	mov	r1, r4
c0de628c:	0e02      	lsrs	r2, r0, #24
c0de628e:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de6292:	70ca      	strb	r2, [r1, #3]
c0de6294:	0c02      	lsrs	r2, r0, #16
c0de6296:	0a00      	lsrs	r0, r0, #8
c0de6298:	f884 0022 	strb.w	r0, [r4, #34]	@ 0x22
c0de629c:	708a      	strb	r2, [r1, #2]
c0de629e:	4640      	mov	r0, r8
c0de62a0:	f001 fd31 	bl	c0de7d06 <OUTLINED_FUNCTION_38>
c0de62a4:	f841 4022 	str.w	r4, [r1, r2, lsl #2]
c0de62a8:	2102      	movs	r1, #2
c0de62aa:	75a1      	strb	r1, [r4, #22]
c0de62ac:	f8bb 100c 	ldrh.w	r1, [fp, #12]
c0de62b0:	75e1      	strb	r1, [r4, #23]
c0de62b2:	0a09      	lsrs	r1, r1, #8
c0de62b4:	f8bb 3020 	ldrh.w	r3, [fp, #32]
c0de62b8:	f8bb 500e 	ldrh.w	r5, [fp, #14]
c0de62bc:	7621      	strb	r1, [r4, #24]
c0de62be:	1c51      	adds	r1, r2, #1
c0de62c0:	442b      	add	r3, r5
c0de62c2:	7663      	strb	r3, [r4, #25]
c0de62c4:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de62c8:	0a18      	lsrs	r0, r3, #8
c0de62ca:	76a0      	strb	r0, [r4, #26]
c0de62cc:	2000      	movs	r0, #0
c0de62ce:	f88a 00af 	strb.w	r0, [sl, #175]	@ 0xaf
c0de62d2:	f8db 0008 	ldr.w	r0, [fp, #8]
c0de62d6:	f8ca 00a4 	str.w	r0, [sl, #164]	@ 0xa4
c0de62da:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de62de:	f040 0104 	orr.w	r1, r0, #4
c0de62e2:	08c0      	lsrs	r0, r0, #3
c0de62e4:	f88a 10ad 	strb.w	r1, [sl, #173]	@ 0xad
c0de62e8:	49b2      	ldr	r1, [pc, #712]	@ (c0de65b4 <addContentCenter+0x3dc>)
c0de62ea:	4479      	add	r1, pc
c0de62ec:	9101      	str	r1, [sp, #4]
c0de62ee:	f8db 1008 	ldr.w	r1, [fp, #8]
c0de62f2:	88c9      	ldrh	r1, [r1, #6]
c0de62f4:	e9cd 1102 	strd	r1, r1, [sp, #8]
c0de62f8:	a901      	add	r1, sp, #4
c0de62fa:	f005 fc50 	bl	c0debb9e <nbgl_screenUpdateTicker>
c0de62fe:	4656      	mov	r6, sl
c0de6300:	f8dd a000 	ldr.w	sl, [sp]
c0de6304:	463c      	mov	r4, r7
c0de6306:	e001      	b.n	c0de630c <addContentCenter+0x134>
c0de6308:	f04f 0a00 	mov.w	sl, #0
c0de630c:	f8db 0010 	ldr.w	r0, [fp, #16]
c0de6310:	9600      	str	r6, [sp, #0]
c0de6312:	2800      	cmp	r0, #0
c0de6314:	d046      	beq.n	c0de63a4 <addContentCenter+0x1cc>
c0de6316:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de631a:	f001 fb19 	bl	c0de7950 <OUTLINED_FUNCTION_0>
c0de631e:	4607      	mov	r7, r0
c0de6320:	2000      	movs	r0, #0
c0de6322:	77f8      	strb	r0, [r7, #31]
c0de6324:	f8db 0010 	ldr.w	r0, [fp, #16]
c0de6328:	f005 fe24 	bl	c0debf74 <pic>
c0de632c:	f001 fd19 	bl	c0de7d62 <OUTLINED_FUNCTION_42>
c0de6330:	200d      	movs	r0, #13
c0de6332:	f001 fb2b 	bl	c0de798c <OUTLINED_FUNCTION_3>
c0de6336:	f001 fdf8 	bl	c0de7f2a <OUTLINED_FUNCTION_78>
c0de633a:	71b8      	strb	r0, [r7, #6]
c0de633c:	0a01      	lsrs	r1, r0, #8
c0de633e:	f898 c020 	ldrb.w	ip, [r8, #32]
c0de6342:	71f9      	strb	r1, [r7, #7]
c0de6344:	f1bc 0f00 	cmp.w	ip, #0
c0de6348:	d010      	beq.n	c0de636c <addContentCenter+0x194>
c0de634a:	463b      	mov	r3, r7
c0de634c:	0e22      	lsrs	r2, r4, #24
c0de634e:	f803 4f12 	strb.w	r4, [r3, #18]!
c0de6352:	70da      	strb	r2, [r3, #3]
c0de6354:	0c22      	lsrs	r2, r4, #16
c0de6356:	709a      	strb	r2, [r3, #2]
c0de6358:	0a22      	lsrs	r2, r4, #8
c0de635a:	705a      	strb	r2, [r3, #1]
c0de635c:	f8bb 2020 	ldrh.w	r2, [fp, #32]
c0de6360:	3218      	adds	r2, #24
c0de6362:	0a14      	lsrs	r4, r2, #8
c0de6364:	71da      	strb	r2, [r3, #7]
c0de6366:	721c      	strb	r4, [r3, #8]
c0de6368:	2308      	movs	r3, #8
c0de636a:	e004      	b.n	c0de6376 <addContentCenter+0x19e>
c0de636c:	7e7a      	ldrb	r2, [r7, #25]
c0de636e:	7ebb      	ldrb	r3, [r7, #26]
c0de6370:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6374:	2302      	movs	r3, #2
c0de6376:	75bb      	strb	r3, [r7, #22]
c0de6378:	4643      	mov	r3, r8
c0de637a:	4450      	add	r0, sl
c0de637c:	f813 4f22 	ldrb.w	r4, [r3, #34]!
c0de6380:	eb00 0a02 	add.w	sl, r0, r2
c0de6384:	785d      	ldrb	r5, [r3, #1]
c0de6386:	789e      	ldrb	r6, [r3, #2]
c0de6388:	78d9      	ldrb	r1, [r3, #3]
c0de638a:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de638e:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de6392:	9e00      	ldr	r6, [sp, #0]
c0de6394:	ea44 4101 	orr.w	r1, r4, r1, lsl #16
c0de6398:	f841 702c 	str.w	r7, [r1, ip, lsl #2]
c0de639c:	f10c 0101 	add.w	r1, ip, #1
c0de63a0:	f803 1c02 	strb.w	r1, [r3, #-2]
c0de63a4:	f8db 0014 	ldr.w	r0, [fp, #20]
c0de63a8:	2800      	cmp	r0, #0
c0de63aa:	d049      	beq.n	c0de6440 <addContentCenter+0x268>
c0de63ac:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de63b0:	f001 face 	bl	c0de7950 <OUTLINED_FUNCTION_0>
c0de63b4:	4607      	mov	r7, r0
c0de63b6:	2000      	movs	r0, #0
c0de63b8:	77f8      	strb	r0, [r7, #31]
c0de63ba:	f8db 0014 	ldr.w	r0, [fp, #20]
c0de63be:	f005 fdd9 	bl	c0debf74 <pic>
c0de63c2:	f001 fcce 	bl	c0de7d62 <OUTLINED_FUNCTION_42>
c0de63c6:	200c      	movs	r0, #12
c0de63c8:	f001 fae0 	bl	c0de798c <OUTLINED_FUNCTION_3>
c0de63cc:	200c      	movs	r0, #12
c0de63ce:	f005 fc09 	bl	c0debbe4 <nbgl_getTextHeightInWidth>
c0de63d2:	f001 fce4 	bl	c0de7d9e <OUTLINED_FUNCTION_46>
c0de63d6:	d028      	beq.n	c0de642a <addContentCenter+0x252>
c0de63d8:	4642      	mov	r2, r8
c0de63da:	f04f 0c00 	mov.w	ip, #0
c0de63de:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de63e2:	7855      	ldrb	r5, [r2, #1]
c0de63e4:	7896      	ldrb	r6, [r2, #2]
c0de63e6:	78d2      	ldrb	r2, [r2, #3]
c0de63e8:	ea46 2202 	orr.w	r2, r6, r2, lsl #8
c0de63ec:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0de63f0:	463e      	mov	r6, r7
c0de63f2:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de63f6:	eb02 0381 	add.w	r3, r2, r1, lsl #2
c0de63fa:	f853 5c04 	ldr.w	r5, [r3, #-4]
c0de63fe:	f806 5f12 	strb.w	r5, [r6, #18]!
c0de6402:	0e2c      	lsrs	r4, r5, #24
c0de6404:	70f4      	strb	r4, [r6, #3]
c0de6406:	0c2c      	lsrs	r4, r5, #16
c0de6408:	f886 c008 	strb.w	ip, [r6, #8]
c0de640c:	70b4      	strb	r4, [r6, #2]
c0de640e:	0a2c      	lsrs	r4, r5, #8
c0de6410:	7074      	strb	r4, [r6, #1]
c0de6412:	2418      	movs	r4, #24
c0de6414:	71f4      	strb	r4, [r6, #7]
c0de6416:	2408      	movs	r4, #8
c0de6418:	f853 3c04 	ldr.w	r3, [r3, #-4]
c0de641c:	7134      	strb	r4, [r6, #4]
c0de641e:	7edb      	ldrb	r3, [r3, #27]
c0de6420:	2b02      	cmp	r3, #2
c0de6422:	d105      	bne.n	c0de6430 <addContentCenter+0x258>
c0de6424:	f001 fd5b 	bl	c0de7ede <OUTLINED_FUNCTION_71>
c0de6428:	e006      	b.n	c0de6438 <addContentCenter+0x260>
c0de642a:	f001 fa9b 	bl	c0de7964 <OUTLINED_FUNCTION_2>
c0de642e:	e005      	b.n	c0de643c <addContentCenter+0x264>
c0de6430:	2300      	movs	r3, #0
c0de6432:	76bb      	strb	r3, [r7, #26]
c0de6434:	2310      	movs	r3, #16
c0de6436:	767b      	strb	r3, [r7, #25]
c0de6438:	9e00      	ldr	r6, [sp, #0]
c0de643a:	460c      	mov	r4, r1
c0de643c:	f001 fbfb 	bl	c0de7c36 <OUTLINED_FUNCTION_29>
c0de6440:	f8db 0018 	ldr.w	r0, [fp, #24]
c0de6444:	b3b8      	cbz	r0, c0de64b6 <addContentCenter+0x2de>
c0de6446:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de644a:	f001 fa81 	bl	c0de7950 <OUTLINED_FUNCTION_0>
c0de644e:	4607      	mov	r7, r0
c0de6450:	2000      	movs	r0, #0
c0de6452:	77f8      	strb	r0, [r7, #31]
c0de6454:	f8db 0018 	ldr.w	r0, [fp, #24]
c0de6458:	f005 fd8c 	bl	c0debf74 <pic>
c0de645c:	f001 fc81 	bl	c0de7d62 <OUTLINED_FUNCTION_42>
c0de6460:	200b      	movs	r0, #11
c0de6462:	f001 fa93 	bl	c0de798c <OUTLINED_FUNCTION_3>
c0de6466:	f001 fc84 	bl	c0de7d72 <OUTLINED_FUNCTION_43>
c0de646a:	f001 fc98 	bl	c0de7d9e <OUTLINED_FUNCTION_46>
c0de646e:	d019      	beq.n	c0de64a4 <addContentCenter+0x2cc>
c0de6470:	f001 fc3b 	bl	c0de7cea <OUTLINED_FUNCTION_37>
c0de6474:	eb02 0381 	add.w	r3, r2, r1, lsl #2
c0de6478:	f853 4c04 	ldr.w	r4, [r3, #-4]
c0de647c:	f805 4f12 	strb.w	r4, [r5, #18]!
c0de6480:	0e26      	lsrs	r6, r4, #24
c0de6482:	70ee      	strb	r6, [r5, #3]
c0de6484:	0c26      	lsrs	r6, r4, #16
c0de6486:	0a24      	lsrs	r4, r4, #8
c0de6488:	706c      	strb	r4, [r5, #1]
c0de648a:	70ae      	strb	r6, [r5, #2]
c0de648c:	2408      	movs	r4, #8
c0de648e:	f853 3c04 	ldr.w	r3, [r3, #-4]
c0de6492:	712c      	strb	r4, [r5, #4]
c0de6494:	7edb      	ldrb	r3, [r3, #27]
c0de6496:	2b04      	cmp	r3, #4
c0de6498:	d107      	bne.n	c0de64aa <addContentCenter+0x2d2>
c0de649a:	2300      	movs	r3, #0
c0de649c:	76bb      	strb	r3, [r7, #26]
c0de649e:	2310      	movs	r3, #16
c0de64a0:	767b      	strb	r3, [r7, #25]
c0de64a2:	e004      	b.n	c0de64ae <addContentCenter+0x2d6>
c0de64a4:	f001 fa5e 	bl	c0de7964 <OUTLINED_FUNCTION_2>
c0de64a8:	e003      	b.n	c0de64b2 <addContentCenter+0x2da>
c0de64aa:	f001 fd18 	bl	c0de7ede <OUTLINED_FUNCTION_71>
c0de64ae:	9e00      	ldr	r6, [sp, #0]
c0de64b0:	460c      	mov	r4, r1
c0de64b2:	f001 fbc0 	bl	c0de7c36 <OUTLINED_FUNCTION_29>
c0de64b6:	f8db 001c 	ldr.w	r0, [fp, #28]
c0de64ba:	2800      	cmp	r0, #0
c0de64bc:	d04f      	beq.n	c0de655e <addContentCenter+0x386>
c0de64be:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de64c2:	f001 fa45 	bl	c0de7950 <OUTLINED_FUNCTION_0>
c0de64c6:	2401      	movs	r4, #1
c0de64c8:	4607      	mov	r7, r0
c0de64ca:	77c4      	strb	r4, [r0, #31]
c0de64cc:	f8db 001c 	ldr.w	r0, [fp, #28]
c0de64d0:	f005 fd50 	bl	c0debf74 <pic>
c0de64d4:	4601      	mov	r1, r0
c0de64d6:	20a0      	movs	r0, #160	@ 0xa0
c0de64d8:	2301      	movs	r3, #1
c0de64da:	717c      	strb	r4, [r7, #5]
c0de64dc:	f887 4024 	strb.w	r4, [r7, #36]	@ 0x24
c0de64e0:	7138      	strb	r0, [r7, #4]
c0de64e2:	200b      	movs	r0, #11
c0de64e4:	0e0a      	lsrs	r2, r1, #24
c0de64e6:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de64ea:	2005      	movs	r0, #5
c0de64ec:	f887 0020 	strb.w	r0, [r7, #32]
c0de64f0:	4638      	mov	r0, r7
c0de64f2:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de64f6:	70c2      	strb	r2, [r0, #3]
c0de64f8:	0c0a      	lsrs	r2, r1, #16
c0de64fa:	7082      	strb	r2, [r0, #2]
c0de64fc:	0a08      	lsrs	r0, r1, #8
c0de64fe:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de6502:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de6506:	f001 fc34 	bl	c0de7d72 <OUTLINED_FUNCTION_43>
c0de650a:	3010      	adds	r0, #16
c0de650c:	f001 fc47 	bl	c0de7d9e <OUTLINED_FUNCTION_46>
c0de6510:	d021      	beq.n	c0de6556 <addContentCenter+0x37e>
c0de6512:	f001 fbea 	bl	c0de7cea <OUTLINED_FUNCTION_37>
c0de6516:	eb02 0481 	add.w	r4, r2, r1, lsl #2
c0de651a:	f854 3c04 	ldr.w	r3, [r4, #-4]
c0de651e:	f805 3f12 	strb.w	r3, [r5, #18]!
c0de6522:	0e1e      	lsrs	r6, r3, #24
c0de6524:	70ee      	strb	r6, [r5, #3]
c0de6526:	0c1e      	lsrs	r6, r3, #16
c0de6528:	0a1b      	lsrs	r3, r3, #8
c0de652a:	706b      	strb	r3, [r5, #1]
c0de652c:	2300      	movs	r3, #0
c0de652e:	70ae      	strb	r6, [r5, #2]
c0de6530:	2608      	movs	r6, #8
c0de6532:	722b      	strb	r3, [r5, #8]
c0de6534:	2310      	movs	r3, #16
c0de6536:	712e      	strb	r6, [r5, #4]
c0de6538:	71eb      	strb	r3, [r5, #7]
c0de653a:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de653e:	7ee4      	ldrb	r4, [r4, #27]
c0de6540:	2c02      	cmp	r4, #2
c0de6542:	d105      	bne.n	c0de6550 <addContentCenter+0x378>
c0de6544:	f8bb 3020 	ldrh.w	r3, [fp, #32]
c0de6548:	3310      	adds	r3, #16
c0de654a:	0a1c      	lsrs	r4, r3, #8
c0de654c:	767b      	strb	r3, [r7, #25]
c0de654e:	76bc      	strb	r4, [r7, #26]
c0de6550:	9e00      	ldr	r6, [sp, #0]
c0de6552:	460c      	mov	r4, r1
c0de6554:	e001      	b.n	c0de655a <addContentCenter+0x382>
c0de6556:	f001 fa05 	bl	c0de7964 <OUTLINED_FUNCTION_2>
c0de655a:	f001 fb6c 	bl	c0de7c36 <OUTLINED_FUNCTION_29>
c0de655e:	2001      	movs	r0, #1
c0de6560:	f888 a006 	strb.w	sl, [r8, #6]
c0de6564:	f888 0005 	strb.w	r0, [r8, #5]
c0de6568:	20a0      	movs	r0, #160	@ 0xa0
c0de656a:	f888 0004 	strb.w	r0, [r8, #4]
c0de656e:	2005      	movs	r0, #5
c0de6570:	f888 0016 	strb.w	r0, [r8, #22]
c0de6574:	2000      	movs	r0, #0
c0de6576:	f888 001f 	strb.w	r0, [r8, #31]
c0de657a:	ea4f 201a 	mov.w	r0, sl, lsr #8
c0de657e:	f888 0007 	strb.w	r0, [r8, #7]
c0de6582:	f89b 0022 	ldrb.w	r0, [fp, #34]	@ 0x22
c0de6586:	b130      	cbz	r0, c0de6596 <addContentCenter+0x3be>
c0de6588:	f10a 0028 	add.w	r0, sl, #40	@ 0x28
c0de658c:	f888 0006 	strb.w	r0, [r8, #6]
c0de6590:	0a00      	lsrs	r0, r0, #8
c0de6592:	f888 0007 	strb.w	r0, [r8, #7]
c0de6596:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de659a:	f001 fa6c 	bl	c0de7a76 <OUTLINED_FUNCTION_10>
c0de659e:	f840 8022 	str.w	r8, [r0, r2, lsl #2]
c0de65a2:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de65a6:	f001 f9d7 	bl	c0de7958 <OUTLINED_FUNCTION_1>
c0de65aa:	4640      	mov	r0, r8
c0de65ac:	b004      	add	sp, #16
c0de65ae:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de65b2:	bf00      	nop
c0de65b4:	0000155f 	.word	0x0000155f

c0de65b8 <nbgl_layoutAddContentCenter>:
c0de65b8:	b128      	cbz	r0, c0de65c6 <nbgl_layoutAddContentCenter+0xe>
c0de65ba:	b580      	push	{r7, lr}
c0de65bc:	f7ff fe0c 	bl	c0de61d8 <addContentCenter>
c0de65c0:	f001 fc2d 	bl	c0de7e1e <OUTLINED_FUNCTION_55>
c0de65c4:	bd80      	pop	{r7, pc}
c0de65c6:	f001 bb7f 	b.w	c0de7cc8 <OUTLINED_FUNCTION_35>

c0de65ca <nbgl_layoutAddQRCode>:
c0de65ca:	2800      	cmp	r0, #0
c0de65cc:	f000 8116 	beq.w	c0de67fc <nbgl_layoutAddQRCode+0x232>
c0de65d0:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de65d4:	4606      	mov	r6, r0
c0de65d6:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de65da:	460f      	mov	r7, r1
c0de65dc:	f001 faa1 	bl	c0de7b22 <OUTLINED_FUNCTION_16>
c0de65e0:	4682      	mov	sl, r0
c0de65e2:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de65e6:	08c1      	lsrs	r1, r0, #3
c0de65e8:	2003      	movs	r0, #3
c0de65ea:	f005 fae7 	bl	c0debbbc <nbgl_containerPoolGet>
c0de65ee:	4654      	mov	r4, sl
c0de65f0:	0e01      	lsrs	r1, r0, #24
c0de65f2:	f04f 0b00 	mov.w	fp, #0
c0de65f6:	f804 0f22 	strb.w	r0, [r4, #34]!
c0de65fa:	f88a b020 	strb.w	fp, [sl, #32]
c0de65fe:	70e1      	strb	r1, [r4, #3]
c0de6600:	0c01      	lsrs	r1, r0, #16
c0de6602:	0a00      	lsrs	r0, r0, #8
c0de6604:	70a1      	strb	r1, [r4, #2]
c0de6606:	f88a 0023 	strb.w	r0, [sl, #35]	@ 0x23
c0de660a:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de660e:	08c1      	lsrs	r1, r0, #3
c0de6610:	200a      	movs	r0, #10
c0de6612:	f005 face 	bl	c0debbb2 <nbgl_objPoolGet>
c0de6616:	4680      	mov	r8, r0
c0de6618:	6838      	ldr	r0, [r7, #0]
c0de661a:	f005 fcab 	bl	c0debf74 <pic>
c0de661e:	f005 ff37 	bl	c0dec490 <strlen>
c0de6622:	283e      	cmp	r0, #62	@ 0x3e
c0de6624:	f04f 0000 	mov.w	r0, #0
c0de6628:	4645      	mov	r5, r8
c0de662a:	bf88      	it	hi
c0de662c:	2001      	movhi	r0, #1
c0de662e:	f888 0020 	strb.w	r0, [r8, #32]
c0de6632:	f888 b01f 	strb.w	fp, [r8, #31]
c0de6636:	f44f 7084 	mov.w	r0, #264	@ 0x108
c0de663a:	bf88      	it	hi
c0de663c:	20e4      	movhi	r0, #228	@ 0xe4
c0de663e:	f888 0004 	strb.w	r0, [r8, #4]
c0de6642:	f805 0f06 	strb.w	r0, [r5, #6]!
c0de6646:	0a00      	lsrs	r0, r0, #8
c0de6648:	7068      	strb	r0, [r5, #1]
c0de664a:	f888 0005 	strb.w	r0, [r8, #5]
c0de664e:	6838      	ldr	r0, [r7, #0]
c0de6650:	f005 fc90 	bl	c0debf74 <pic>
c0de6654:	4641      	mov	r1, r8
c0de6656:	0e02      	lsrs	r2, r0, #24
c0de6658:	f888 b009 	strb.w	fp, [r8, #9]
c0de665c:	9601      	str	r6, [sp, #4]
c0de665e:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de6662:	f001 fba3 	bl	c0de7dac <OUTLINED_FUNCTION_47>
c0de6666:	f888 0022 	strb.w	r0, [r8, #34]	@ 0x22
c0de666a:	7820      	ldrb	r0, [r4, #0]
c0de666c:	78a1      	ldrb	r1, [r4, #2]
c0de666e:	78e2      	ldrb	r2, [r4, #3]
c0de6670:	f89a 4023 	ldrb.w	r4, [sl, #35]	@ 0x23
c0de6674:	f89a 3020 	ldrb.w	r3, [sl, #32]
c0de6678:	ea40 2004 	orr.w	r0, r0, r4, lsl #8
c0de667c:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de6680:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de6684:	7869      	ldrb	r1, [r5, #1]
c0de6686:	f840 8023 	str.w	r8, [r0, r3, lsl #2]
c0de668a:	2002      	movs	r0, #2
c0de668c:	f888 0016 	strb.w	r0, [r8, #22]
c0de6690:	1c58      	adds	r0, r3, #1
c0de6692:	f88a 0020 	strb.w	r0, [sl, #32]
c0de6696:	7828      	ldrb	r0, [r5, #0]
c0de6698:	ea40 2b01 	orr.w	fp, r0, r1, lsl #8
c0de669c:	6878      	ldr	r0, [r7, #4]
c0de669e:	2800      	cmp	r0, #0
c0de66a0:	d053      	beq.n	c0de674a <nbgl_layoutAddQRCode+0x180>
c0de66a2:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de66a6:	f001 f953 	bl	c0de7950 <OUTLINED_FUNCTION_0>
c0de66aa:	4605      	mov	r5, r0
c0de66ac:	2000      	movs	r0, #0
c0de66ae:	77e8      	strb	r0, [r5, #31]
c0de66b0:	6878      	ldr	r0, [r7, #4]
c0de66b2:	f005 fc5f 	bl	c0debf74 <pic>
c0de66b6:	4601      	mov	r1, r0
c0de66b8:	20a0      	movs	r0, #160	@ 0xa0
c0de66ba:	2201      	movs	r2, #1
c0de66bc:	7128      	strb	r0, [r5, #4]
c0de66be:	2005      	movs	r0, #5
c0de66c0:	716a      	strb	r2, [r5, #5]
c0de66c2:	f885 2024 	strb.w	r2, [r5, #36]	@ 0x24
c0de66c6:	0e0a      	lsrs	r2, r1, #24
c0de66c8:	f885 0020 	strb.w	r0, [r5, #32]
c0de66cc:	4628      	mov	r0, r5
c0de66ce:	f001 fa02 	bl	c0de7ad6 <OUTLINED_FUNCTION_13>
c0de66d2:	f885 0027 	strb.w	r0, [r5, #39]	@ 0x27
c0de66d6:	200d      	movs	r0, #13
c0de66d8:	7bfa      	ldrb	r2, [r7, #15]
c0de66da:	2a00      	cmp	r2, #0
c0de66dc:	bf08      	it	eq
c0de66de:	200b      	moveq	r0, #11
c0de66e0:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de66e4:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de66e8:	2301      	movs	r3, #1
c0de66ea:	f005 fa7b 	bl	c0debbe4 <nbgl_getTextHeightInWidth>
c0de66ee:	4651      	mov	r1, sl
c0de66f0:	46be      	mov	lr, r7
c0de66f2:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de66f6:	784c      	ldrb	r4, [r1, #1]
c0de66f8:	788a      	ldrb	r2, [r1, #2]
c0de66fa:	78cf      	ldrb	r7, [r1, #3]
c0de66fc:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de6700:	ea42 2207 	orr.w	r2, r2, r7, lsl #8
c0de6704:	ea4c 2404 	orr.w	r4, ip, r4, lsl #8
c0de6708:	462f      	mov	r7, r5
c0de670a:	ea44 4202 	orr.w	r2, r4, r2, lsl #16
c0de670e:	eb02 0483 	add.w	r4, r2, r3, lsl #2
c0de6712:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de6716:	f807 4f12 	strb.w	r4, [r7, #18]!
c0de671a:	0e26      	lsrs	r6, r4, #24
c0de671c:	70fe      	strb	r6, [r7, #3]
c0de671e:	0c26      	lsrs	r6, r4, #16
c0de6720:	0a24      	lsrs	r4, r4, #8
c0de6722:	70be      	strb	r6, [r7, #2]
c0de6724:	74ec      	strb	r4, [r5, #19]
c0de6726:	f842 5023 	str.w	r5, [r2, r3, lsl #2]
c0de672a:	2200      	movs	r2, #0
c0de672c:	71a8      	strb	r0, [r5, #6]
c0de672e:	4677      	mov	r7, lr
c0de6730:	76aa      	strb	r2, [r5, #26]
c0de6732:	2218      	movs	r2, #24
c0de6734:	766a      	strb	r2, [r5, #25]
c0de6736:	2208      	movs	r2, #8
c0de6738:	75aa      	strb	r2, [r5, #22]
c0de673a:	0a02      	lsrs	r2, r0, #8
c0de673c:	4458      	add	r0, fp
c0de673e:	71ea      	strb	r2, [r5, #7]
c0de6740:	1c5a      	adds	r2, r3, #1
c0de6742:	f100 0b18 	add.w	fp, r0, #24
c0de6746:	f801 2c02 	strb.w	r2, [r1, #-2]
c0de674a:	68b8      	ldr	r0, [r7, #8]
c0de674c:	9700      	str	r7, [sp, #0]
c0de674e:	2800      	cmp	r0, #0
c0de6750:	d056      	beq.n	c0de6800 <nbgl_layoutAddQRCode+0x236>
c0de6752:	9801      	ldr	r0, [sp, #4]
c0de6754:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de6758:	f001 f8fa 	bl	c0de7950 <OUTLINED_FUNCTION_0>
c0de675c:	2401      	movs	r4, #1
c0de675e:	4605      	mov	r5, r0
c0de6760:	77c4      	strb	r4, [r0, #31]
c0de6762:	68b8      	ldr	r0, [r7, #8]
c0de6764:	f005 fc06 	bl	c0debf74 <pic>
c0de6768:	4601      	mov	r1, r0
c0de676a:	20a0      	movs	r0, #160	@ 0xa0
c0de676c:	2301      	movs	r3, #1
c0de676e:	716c      	strb	r4, [r5, #5]
c0de6770:	f885 4024 	strb.w	r4, [r5, #36]	@ 0x24
c0de6774:	7128      	strb	r0, [r5, #4]
c0de6776:	200b      	movs	r0, #11
c0de6778:	0e0a      	lsrs	r2, r1, #24
c0de677a:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de677e:	2005      	movs	r0, #5
c0de6780:	f885 0020 	strb.w	r0, [r5, #32]
c0de6784:	4628      	mov	r0, r5
c0de6786:	f001 f924 	bl	c0de79d2 <OUTLINED_FUNCTION_5>
c0de678a:	4651      	mov	r1, sl
c0de678c:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de6790:	784b      	ldrb	r3, [r1, #1]
c0de6792:	788e      	ldrb	r6, [r1, #2]
c0de6794:	78cc      	ldrb	r4, [r1, #3]
c0de6796:	f811 2c02 	ldrb.w	r2, [r1, #-2]
c0de679a:	ea4c 2303 	orr.w	r3, ip, r3, lsl #8
c0de679e:	ea46 2404 	orr.w	r4, r6, r4, lsl #8
c0de67a2:	f8d7 c004 	ldr.w	ip, [r7, #4]
c0de67a6:	2700      	movs	r7, #0
c0de67a8:	462e      	mov	r6, r5
c0de67aa:	ea43 4e04 	orr.w	lr, r3, r4, lsl #16
c0de67ae:	eb0e 0482 	add.w	r4, lr, r2, lsl #2
c0de67b2:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de67b6:	76af      	strb	r7, [r5, #26]
c0de67b8:	271c      	movs	r7, #28
c0de67ba:	f1bc 0f00 	cmp.w	ip, #0
c0de67be:	bf08      	it	eq
c0de67c0:	2720      	moveq	r7, #32
c0de67c2:	766f      	strb	r7, [r5, #25]
c0de67c4:	f806 4f12 	strb.w	r4, [r6, #18]!
c0de67c8:	0e23      	lsrs	r3, r4, #24
c0de67ca:	70f3      	strb	r3, [r6, #3]
c0de67cc:	0c23      	lsrs	r3, r4, #16
c0de67ce:	70b3      	strb	r3, [r6, #2]
c0de67d0:	0a23      	lsrs	r3, r4, #8
c0de67d2:	9e01      	ldr	r6, [sp, #4]
c0de67d4:	74eb      	strb	r3, [r5, #19]
c0de67d6:	2308      	movs	r3, #8
c0de67d8:	f84e 5022 	str.w	r5, [lr, r2, lsl #2]
c0de67dc:	3201      	adds	r2, #1
c0de67de:	71a8      	strb	r0, [r5, #6]
c0de67e0:	75ab      	strb	r3, [r5, #22]
c0de67e2:	0a03      	lsrs	r3, r0, #8
c0de67e4:	f801 2c02 	strb.w	r2, [r1, #-2]
c0de67e8:	71eb      	strb	r3, [r5, #7]
c0de67ea:	f1bc 0f00 	cmp.w	ip, #0
c0de67ee:	bf08      	it	eq
c0de67f0:	f10b 0b08 	addeq.w	fp, fp, #8
c0de67f4:	4458      	add	r0, fp
c0de67f6:	eb00 0b07 	add.w	fp, r0, r7
c0de67fa:	e002      	b.n	c0de6802 <nbgl_layoutAddQRCode+0x238>
c0de67fc:	f001 ba64 	b.w	c0de7cc8 <OUTLINED_FUNCTION_35>
c0de6800:	9e01      	ldr	r6, [sp, #4]
c0de6802:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de6806:	fa1f f18b 	uxth.w	r1, fp
c0de680a:	7982      	ldrb	r2, [r0, #6]
c0de680c:	79c3      	ldrb	r3, [r0, #7]
c0de680e:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6812:	3a10      	subs	r2, #16
c0de6814:	428a      	cmp	r2, r1
c0de6816:	dd01      	ble.n	c0de681c <nbgl_layoutAddQRCode+0x252>
c0de6818:	9d00      	ldr	r5, [sp, #0]
c0de681a:	e012      	b.n	c0de6842 <nbgl_layoutAddQRCode+0x278>
c0de681c:	f898 1020 	ldrb.w	r1, [r8, #32]
c0de6820:	9d00      	ldr	r5, [sp, #0]
c0de6822:	b971      	cbnz	r1, c0de6842 <nbgl_layoutAddQRCode+0x278>
c0de6824:	2100      	movs	r1, #0
c0de6826:	2284      	movs	r2, #132	@ 0x84
c0de6828:	f1ab 0b84 	sub.w	fp, fp, #132	@ 0x84
c0de682c:	f888 1007 	strb.w	r1, [r8, #7]
c0de6830:	f888 1005 	strb.w	r1, [r8, #5]
c0de6834:	2102      	movs	r1, #2
c0de6836:	f888 2006 	strb.w	r2, [r8, #6]
c0de683a:	f888 2004 	strb.w	r2, [r8, #4]
c0de683e:	f888 1020 	strb.w	r1, [r8, #32]
c0de6842:	2100      	movs	r1, #0
c0de6844:	f88a b006 	strb.w	fp, [sl, #6]
c0de6848:	f88a 101f 	strb.w	r1, [sl, #31]
c0de684c:	ea4f 211b 	mov.w	r1, fp, lsr #8
c0de6850:	f88a 1007 	strb.w	r1, [sl, #7]
c0de6854:	7ba9      	ldrb	r1, [r5, #14]
c0de6856:	b109      	cbz	r1, c0de685c <nbgl_layoutAddQRCode+0x292>
c0de6858:	2005      	movs	r0, #5
c0de685a:	e00f      	b.n	c0de687c <nbgl_layoutAddQRCode+0x2b2>
c0de685c:	f001 f90b 	bl	c0de7a76 <OUTLINED_FUNCTION_10>
c0de6860:	4651      	mov	r1, sl
c0de6862:	eb00 0082 	add.w	r0, r0, r2, lsl #2
c0de6866:	f850 0c04 	ldr.w	r0, [r0, #-4]
c0de686a:	f801 0f12 	strb.w	r0, [r1, #18]!
c0de686e:	0e02      	lsrs	r2, r0, #24
c0de6870:	70ca      	strb	r2, [r1, #3]
c0de6872:	0c02      	lsrs	r2, r0, #16
c0de6874:	0a00      	lsrs	r0, r0, #8
c0de6876:	7048      	strb	r0, [r1, #1]
c0de6878:	2008      	movs	r0, #8
c0de687a:	708a      	strb	r2, [r1, #2]
c0de687c:	f88a 0016 	strb.w	r0, [sl, #22]
c0de6880:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de6884:	f001 f9be 	bl	c0de7c04 <OUTLINED_FUNCTION_27>
c0de6888:	2001      	movs	r0, #1
c0de688a:	f88a 0005 	strb.w	r0, [sl, #5]
c0de688e:	20a0      	movs	r0, #160	@ 0xa0
c0de6890:	f88a 0004 	strb.w	r0, [sl, #4]
c0de6894:	89a8      	ldrh	r0, [r5, #12]
c0de6896:	f88a 0019 	strb.w	r0, [sl, #25]
c0de689a:	0a00      	lsrs	r0, r0, #8
c0de689c:	f88a 001a 	strb.w	r0, [sl, #26]
c0de68a0:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de68a4:	f001 f858 	bl	c0de7958 <OUTLINED_FUNCTION_1>
c0de68a8:	fa1f f08b 	uxth.w	r0, fp
c0de68ac:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de68b0 <nbgl_layoutAddChoiceButtons>:
c0de68b0:	b510      	push	{r4, lr}
c0de68b2:	b086      	sub	sp, #24
c0de68b4:	2206      	movs	r2, #6
c0de68b6:	f10d 0c04 	add.w	ip, sp, #4
c0de68ba:	f8ad 2000 	strh.w	r2, [sp]
c0de68be:	e891 001c 	ldmia.w	r1, {r2, r3, r4}
c0de68c2:	e8ac 001c 	stmia.w	ip!, {r2, r3, r4}
c0de68c6:	898a      	ldrh	r2, [r1, #12]
c0de68c8:	7b89      	ldrb	r1, [r1, #14]
c0de68ca:	f88d 1012 	strb.w	r1, [sp, #18]
c0de68ce:	4669      	mov	r1, sp
c0de68d0:	f8ad 2010 	strh.w	r2, [sp, #16]
c0de68d4:	f7fe fb40 	bl	c0de4f58 <nbgl_layoutAddExtendedFooter>
c0de68d8:	b006      	add	sp, #24
c0de68da:	bd10      	pop	{r4, pc}

c0de68dc <nbgl_layoutAddHorizontalButtons>:
c0de68dc:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de68de:	2202      	movs	r2, #2
c0de68e0:	f88d 2004 	strb.w	r2, [sp, #4]
c0de68e4:	e9d1 2300 	ldrd	r2, r3, [r1]
c0de68e8:	e9cd 2302 	strd	r2, r3, [sp, #8]
c0de68ec:	890a      	ldrh	r2, [r1, #8]
c0de68ee:	7a89      	ldrb	r1, [r1, #10]
c0de68f0:	f8ad 2010 	strh.w	r2, [sp, #16]
c0de68f4:	f88d 1012 	strb.w	r1, [sp, #18]
c0de68f8:	a901      	add	r1, sp, #4
c0de68fa:	f7fd ff85 	bl	c0de4808 <nbgl_layoutAddUpFooter>
c0de68fe:	b006      	add	sp, #24
c0de6900:	bd80      	pop	{r7, pc}
	...

c0de6904 <nbgl_layoutAddTagValueList>:
c0de6904:	2800      	cmp	r0, #0
c0de6906:	f000 818a 	beq.w	c0de6c1e <nbgl_layoutAddTagValueList+0x31a>
c0de690a:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de690e:	b088      	sub	sp, #32
c0de6910:	4680      	mov	r8, r0
c0de6912:	48c4      	ldr	r0, [pc, #784]	@ (c0de6c24 <nbgl_layoutAddTagValueList+0x320>)
c0de6914:	460c      	mov	r4, r1
c0de6916:	2100      	movs	r1, #0
c0de6918:	f04f 0b00 	mov.w	fp, #0
c0de691c:	f8cd 8004 	str.w	r8, [sp, #4]
c0de6920:	9406      	str	r4, [sp, #24]
c0de6922:	4478      	add	r0, pc
c0de6924:	9000      	str	r0, [sp, #0]
c0de6926:	7a20      	ldrb	r0, [r4, #8]
c0de6928:	4583      	cmp	fp, r0
c0de692a:	f080 8174 	bcs.w	c0de6c16 <nbgl_layoutAddTagValueList+0x312>
c0de692e:	6820      	ldr	r0, [r4, #0]
c0de6930:	e9cd b104 	strd	fp, r1, [sp, #16]
c0de6934:	b110      	cbz	r0, c0de693c <nbgl_layoutAddTagValueList+0x38>
c0de6936:	eb00 0b01 	add.w	fp, r0, r1
c0de693a:	e005      	b.n	c0de6948 <nbgl_layoutAddTagValueList+0x44>
c0de693c:	7a60      	ldrb	r0, [r4, #9]
c0de693e:	6861      	ldr	r1, [r4, #4]
c0de6940:	4458      	add	r0, fp
c0de6942:	b2c0      	uxtb	r0, r0
c0de6944:	4788      	blx	r1
c0de6946:	4683      	mov	fp, r0
c0de6948:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de694c:	9c00      	ldr	r4, [sp, #0]
c0de694e:	08c1      	lsrs	r1, r0, #3
c0de6950:	2001      	movs	r0, #1
c0de6952:	47a0      	blx	r4
c0de6954:	4682      	mov	sl, r0
c0de6956:	f8db 0008 	ldr.w	r0, [fp, #8]
c0de695a:	2800      	cmp	r0, #0
c0de695c:	f04f 0003 	mov.w	r0, #3
c0de6960:	bf08      	it	eq
c0de6962:	2002      	moveq	r0, #2
c0de6964:	f898 10ad 	ldrb.w	r1, [r8, #173]	@ 0xad
c0de6968:	f001 face 	bl	c0de7f08 <OUTLINED_FUNCTION_74>
c0de696c:	4656      	mov	r6, sl
c0de696e:	0e01      	lsrs	r1, r0, #24
c0de6970:	f806 0f22 	strb.w	r0, [r6, #34]!
c0de6974:	f001 fa75 	bl	c0de7e62 <OUTLINED_FUNCTION_60>
c0de6978:	f88a 0023 	strb.w	r0, [sl, #35]	@ 0x23
c0de697c:	f001 fadc 	bl	c0de7f38 <OUTLINED_FUNCTION_80>
c0de6980:	4605      	mov	r5, r0
c0de6982:	f001 fad9 	bl	c0de7f38 <OUTLINED_FUNCTION_80>
c0de6986:	4607      	mov	r7, r0
c0de6988:	f8db 0000 	ldr.w	r0, [fp]
c0de698c:	2401      	movs	r4, #1
c0de698e:	77ec      	strb	r4, [r5, #31]
c0de6990:	f005 faf0 	bl	c0debf74 <pic>
c0de6994:	4601      	mov	r1, r0
c0de6996:	20a0      	movs	r0, #160	@ 0xa0
c0de6998:	716c      	strb	r4, [r5, #5]
c0de699a:	f885 4024 	strb.w	r4, [r5, #36]	@ 0x24
c0de699e:	2404      	movs	r4, #4
c0de69a0:	2301      	movs	r3, #1
c0de69a2:	7128      	strb	r0, [r5, #4]
c0de69a4:	200b      	movs	r0, #11
c0de69a6:	0e0a      	lsrs	r2, r1, #24
c0de69a8:	f885 4020 	strb.w	r4, [r5, #32]
c0de69ac:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de69b0:	4628      	mov	r0, r5
c0de69b2:	f001 f80e 	bl	c0de79d2 <OUTLINED_FUNCTION_5>
c0de69b6:	71a8      	strb	r0, [r5, #6]
c0de69b8:	9003      	str	r0, [sp, #12]
c0de69ba:	0a00      	lsrs	r0, r0, #8
c0de69bc:	f04f 0800 	mov.w	r8, #0
c0de69c0:	2109      	movs	r1, #9
c0de69c2:	71e8      	strb	r0, [r5, #7]
c0de69c4:	f105 0012 	add.w	r0, r5, #18
c0de69c8:	f885 8021 	strb.w	r8, [r5, #33]	@ 0x21
c0de69cc:	f005 fcf4 	bl	c0dec3b8 <__aeabi_memclr>
c0de69d0:	f89a 1023 	ldrb.w	r1, [sl, #35]	@ 0x23
c0de69d4:	7832      	ldrb	r2, [r6, #0]
c0de69d6:	78b3      	ldrb	r3, [r6, #2]
c0de69d8:	78f6      	ldrb	r6, [r6, #3]
c0de69da:	f89a 0020 	ldrb.w	r0, [sl, #32]
c0de69de:	f887 801f 	strb.w	r8, [r7, #31]
c0de69e2:	f001 fa9b 	bl	c0de7f1c <OUTLINED_FUNCTION_76>
c0de69e6:	f841 5020 	str.w	r5, [r1, r0, lsl #2]
c0de69ea:	3001      	adds	r0, #1
c0de69ec:	f88a 0020 	strb.w	r0, [sl, #32]
c0de69f0:	f8db 0004 	ldr.w	r0, [fp, #4]
c0de69f4:	f005 fabe 	bl	c0debf74 <pic>
c0de69f8:	4601      	mov	r1, r0
c0de69fa:	4638      	mov	r0, r7
c0de69fc:	f887 4020 	strb.w	r4, [r7, #32]
c0de6a00:	9c06      	ldr	r4, [sp, #24]
c0de6a02:	260c      	movs	r6, #12
c0de6a04:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de6a08:	0e0a      	lsrs	r2, r1, #24
c0de6a0a:	f001 f9c1 	bl	c0de7d90 <OUTLINED_FUNCTION_45>
c0de6a0e:	7b20      	ldrb	r0, [r4, #12]
c0de6a10:	2800      	cmp	r0, #0
c0de6a12:	bf08      	it	eq
c0de6a14:	260d      	moveq	r6, #13
c0de6a16:	f887 6022 	strb.w	r6, [r7, #34]	@ 0x22
c0de6a1a:	f89b 200c 	ldrb.w	r2, [fp, #12]
c0de6a1e:	0752      	lsls	r2, r2, #29
c0de6a20:	d417      	bmi.n	c0de6a52 <nbgl_layoutAddTagValueList+0x14e>
c0de6a22:	f8db 2008 	ldr.w	r2, [fp, #8]
c0de6a26:	2a00      	cmp	r2, #0
c0de6a28:	f000 80f0 	beq.w	c0de6c0c <nbgl_layoutAddTagValueList+0x308>
c0de6a2c:	4610      	mov	r0, r2
c0de6a2e:	f005 faa1 	bl	c0debf74 <pic>
c0de6a32:	4639      	mov	r1, r7
c0de6a34:	f811 2f26 	ldrb.w	r2, [r1, #38]!
c0de6a38:	784b      	ldrb	r3, [r1, #1]
c0de6a3a:	f811 6c04 	ldrb.w	r6, [r1, #-4]
c0de6a3e:	f891 c002 	ldrb.w	ip, [r1, #2]
c0de6a42:	78c9      	ldrb	r1, [r1, #3]
c0de6a44:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6a48:	ea4c 2101 	orr.w	r1, ip, r1, lsl #8
c0de6a4c:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6a50:	e001      	b.n	c0de6a56 <nbgl_layoutAddTagValueList+0x152>
c0de6a52:	4875      	ldr	r0, [pc, #468]	@ (c0de6c28 <nbgl_layoutAddTagValueList+0x324>)
c0de6a54:	4478      	add	r0, pc
c0de6a56:	7802      	ldrb	r2, [r0, #0]
c0de6a58:	7843      	ldrb	r3, [r0, #1]
c0de6a5a:	4680      	mov	r8, r0
c0de6a5c:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6a60:	f5c2 72ca 	rsb	r2, r2, #404	@ 0x194
c0de6a64:	0a13      	lsrs	r3, r2, #8
c0de6a66:	713a      	strb	r2, [r7, #4]
c0de6a68:	b292      	uxth	r2, r2
c0de6a6a:	4630      	mov	r0, r6
c0de6a6c:	717b      	strb	r3, [r7, #5]
c0de6a6e:	7b63      	ldrb	r3, [r4, #13]
c0de6a70:	f005 f8bd 	bl	c0debbee <nbgl_getTextNbLinesInWidth>
c0de6a74:	7aa1      	ldrb	r1, [r4, #10]
c0de6a76:	46a3      	mov	fp, r4
c0de6a78:	b121      	cbz	r1, c0de6a84 <nbgl_layoutAddTagValueList+0x180>
c0de6a7a:	4288      	cmp	r0, r1
c0de6a7c:	bf84      	itt	hi
c0de6a7e:	f887 1025 	strbhi.w	r1, [r7, #37]	@ 0x25
c0de6a82:	4608      	movhi	r0, r1
c0de6a84:	9007      	str	r0, [sp, #28]
c0de6a86:	f897 0022 	ldrb.w	r0, [r7, #34]	@ 0x22
c0de6a8a:	f005 f89c 	bl	c0debbc6 <nbgl_getFont>
c0de6a8e:	0a29      	lsrs	r1, r5, #8
c0de6a90:	0e2a      	lsrs	r2, r5, #24
c0de6a92:	46dc      	mov	ip, fp
c0de6a94:	f04f 0e01 	mov.w	lr, #1
c0de6a98:	74f9      	strb	r1, [r7, #19]
c0de6a9a:	4639      	mov	r1, r7
c0de6a9c:	f801 5f12 	strb.w	r5, [r1, #18]!
c0de6aa0:	70ca      	strb	r2, [r1, #3]
c0de6aa2:	0c2a      	lsrs	r2, r5, #16
c0de6aa4:	708a      	strb	r2, [r1, #2]
c0de6aa6:	4651      	mov	r1, sl
c0de6aa8:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6aac:	784d      	ldrb	r5, [r1, #1]
c0de6aae:	788e      	ldrb	r6, [r1, #2]
c0de6ab0:	78cc      	ldrb	r4, [r1, #3]
c0de6ab2:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de6ab6:	ea46 2404 	orr.w	r4, r6, r4, lsl #8
c0de6aba:	ea42 2205 	orr.w	r2, r2, r5, lsl #8
c0de6abe:	2600      	movs	r6, #0
c0de6ac0:	ea42 4204 	orr.w	r2, r2, r4, lsl #16
c0de6ac4:	4644      	mov	r4, r8
c0de6ac6:	76be      	strb	r6, [r7, #26]
c0de6ac8:	f887 6021 	strb.w	r6, [r7, #33]	@ 0x21
c0de6acc:	f842 7023 	str.w	r7, [r2, r3, lsl #2]
c0de6ad0:	2204      	movs	r2, #4
c0de6ad2:	767a      	strb	r2, [r7, #25]
c0de6ad4:	2207      	movs	r2, #7
c0de6ad6:	75ba      	strb	r2, [r7, #22]
c0de6ad8:	f89b 200d 	ldrb.w	r2, [fp, #13]
c0de6adc:	79c5      	ldrb	r5, [r0, #7]
c0de6ade:	f8dd b010 	ldr.w	fp, [sp, #16]
c0de6ae2:	f887 2024 	strb.w	r2, [r7, #36]	@ 0x24
c0de6ae6:	9a07      	ldr	r2, [sp, #28]
c0de6ae8:	fb02 f005 	mul.w	r0, r2, r5
c0de6aec:	71b8      	strb	r0, [r7, #6]
c0de6aee:	0a00      	lsrs	r0, r0, #8
c0de6af0:	71f8      	strb	r0, [r7, #7]
c0de6af2:	1c58      	adds	r0, r3, #1
c0de6af4:	f1b8 0f00 	cmp.w	r8, #0
c0de6af8:	f8dd 8004 	ldr.w	r8, [sp, #4]
c0de6afc:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de6b00:	d048      	beq.n	c0de6b94 <nbgl_layoutAddTagValueList+0x290>
c0de6b02:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de6b06:	f001 f83f 	bl	c0de7b88 <OUTLINED_FUNCTION_21>
c0de6b0a:	9502      	str	r5, [sp, #8]
c0de6b0c:	4605      	mov	r5, r0
c0de6b0e:	9806      	ldr	r0, [sp, #24]
c0de6b10:	4651      	mov	r1, sl
c0de6b12:	2309      	movs	r3, #9
c0de6b14:	7ac2      	ldrb	r2, [r0, #11]
c0de6b16:	4640      	mov	r0, r8
c0de6b18:	f7fd fbf8 	bl	c0de430c <layoutAddCallbackObj>
c0de6b1c:	0a21      	lsrs	r1, r4, #8
c0de6b1e:	0e22      	lsrs	r2, r4, #24
c0de6b20:	2600      	movs	r6, #0
c0de6b22:	f04f 0e01 	mov.w	lr, #1
c0de6b26:	f885 1022 	strb.w	r1, [r5, #34]	@ 0x22
c0de6b2a:	0a39      	lsrs	r1, r7, #8
c0de6b2c:	762e      	strb	r6, [r5, #24]
c0de6b2e:	77ee      	strb	r6, [r5, #31]
c0de6b30:	74e9      	strb	r1, [r5, #19]
c0de6b32:	4629      	mov	r1, r5
c0de6b34:	f801 4f21 	strb.w	r4, [r1, #33]!
c0de6b38:	70ca      	strb	r2, [r1, #3]
c0de6b3a:	0c22      	lsrs	r2, r4, #16
c0de6b3c:	708a      	strb	r2, [r1, #2]
c0de6b3e:	4629      	mov	r1, r5
c0de6b40:	0e3a      	lsrs	r2, r7, #24
c0de6b42:	4673      	mov	r3, lr
c0de6b44:	f001 f9be 	bl	c0de7ec4 <OUTLINED_FUNCTION_69>
c0de6b48:	469e      	mov	lr, r3
c0de6b4a:	4651      	mov	r1, sl
c0de6b4c:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6b50:	784c      	ldrb	r4, [r1, #1]
c0de6b52:	788f      	ldrb	r7, [r1, #2]
c0de6b54:	78cb      	ldrb	r3, [r1, #3]
c0de6b56:	f811 cc02 	ldrb.w	ip, [r1, #-2]
c0de6b5a:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de6b5e:	ea47 2403 	orr.w	r4, r7, r3, lsl #8
c0de6b62:	ea42 4204 	orr.w	r2, r2, r4, lsl #16
c0de6b66:	f842 502c 	str.w	r5, [r2, ip, lsl #2]
c0de6b6a:	220c      	movs	r2, #12
c0de6b6c:	75ea      	strb	r2, [r5, #23]
c0de6b6e:	f880 b005 	strb.w	fp, [r0, #5]
c0de6b72:	f10b 000f 	add.w	r0, fp, #15
c0de6b76:	75aa      	strb	r2, [r5, #22]
c0de6b78:	9d02      	ldr	r5, [sp, #8]
c0de6b7a:	9a07      	ldr	r2, [sp, #28]
c0de6b7c:	f801 6c05 	strb.w	r6, [r1, #-5]
c0de6b80:	f801 ec06 	strb.w	lr, [r1, #-6]
c0de6b84:	f801 0c04 	strb.w	r0, [r1, #-4]
c0de6b88:	f10c 0001 	add.w	r0, ip, #1
c0de6b8c:	f8dd c018 	ldr.w	ip, [sp, #24]
c0de6b90:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de6b94:	9803      	ldr	r0, [sp, #12]
c0de6b96:	4659      	mov	r1, fp
c0de6b98:	fb02 0005 	mla	r0, r2, r5, r0
c0de6b9c:	3004      	adds	r0, #4
c0de6b9e:	f1bb 0f00 	cmp.w	fp, #0
c0de6ba2:	bf18      	it	ne
c0de6ba4:	2118      	movne	r1, #24
c0de6ba6:	f88a 1019 	strb.w	r1, [sl, #25]
c0de6baa:	f88a e005 	strb.w	lr, [sl, #5]
c0de6bae:	f88a 6018 	strb.w	r6, [sl, #24]
c0de6bb2:	f88a 601f 	strb.w	r6, [sl, #31]
c0de6bb6:	f88a 6016 	strb.w	r6, [sl, #22]
c0de6bba:	f10b 0b01 	add.w	fp, fp, #1
c0de6bbe:	0a09      	lsrs	r1, r1, #8
c0de6bc0:	f88a 101a 	strb.w	r1, [sl, #26]
c0de6bc4:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de6bc8:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6bcc:	784c      	ldrb	r4, [r1, #1]
c0de6bce:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de6bd2:	788d      	ldrb	r5, [r1, #2]
c0de6bd4:	78c9      	ldrb	r1, [r1, #3]
c0de6bd6:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de6bda:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de6bde:	4664      	mov	r4, ip
c0de6be0:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6be4:	f841 a023 	str.w	sl, [r1, r3, lsl #2]
c0de6be8:	21a0      	movs	r1, #160	@ 0xa0
c0de6bea:	f88a 0006 	strb.w	r0, [sl, #6]
c0de6bee:	0a00      	lsrs	r0, r0, #8
c0de6bf0:	f88a 1004 	strb.w	r1, [sl, #4]
c0de6bf4:	2120      	movs	r1, #32
c0de6bf6:	f88a 0007 	strb.w	r0, [sl, #7]
c0de6bfa:	f88a 1017 	strb.w	r1, [sl, #23]
c0de6bfe:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de6c02:	f000 fea9 	bl	c0de7958 <OUTLINED_FUNCTION_1>
c0de6c06:	9905      	ldr	r1, [sp, #20]
c0de6c08:	3110      	adds	r1, #16
c0de6c0a:	e68c      	b.n	c0de6926 <nbgl_layoutAddTagValueList+0x22>
c0de6c0c:	f04f 0800 	mov.w	r8, #0
c0de6c10:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de6c14:	e726      	b.n	c0de6a64 <nbgl_layoutAddTagValueList+0x160>
c0de6c16:	2000      	movs	r0, #0
c0de6c18:	b008      	add	sp, #32
c0de6c1a:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de6c1e:	f001 b853 	b.w	c0de7cc8 <OUTLINED_FUNCTION_35>
c0de6c22:	bf00      	nop
c0de6c24:	0000528d 	.word	0x0000528d
c0de6c28:	0000693a 	.word	0x0000693a

c0de6c2c <nbgl_layoutAddSeparationLine>:
c0de6c2c:	b570      	push	{r4, r5, r6, lr}
c0de6c2e:	f001 f97f 	bl	c0de7f30 <OUTLINED_FUNCTION_79>
c0de6c32:	08c0      	lsrs	r0, r0, #3
c0de6c34:	f7ff fa7e 	bl	c0de6134 <createHorizontalLine>
c0de6c38:	f000 ffaa 	bl	c0de7b90 <OUTLINED_FUNCTION_22>
c0de6c3c:	21ff      	movs	r1, #255	@ 0xff
c0de6c3e:	7681      	strb	r1, [r0, #26]
c0de6c40:	21fc      	movs	r1, #252	@ 0xfc
c0de6c42:	7641      	strb	r1, [r0, #25]
c0de6c44:	2103      	movs	r1, #3
c0de6c46:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de6c4a:	f001 f8f6 	bl	c0de7e3a <OUTLINED_FUNCTION_57>
c0de6c4e:	bd70      	pop	{r4, r5, r6, pc}

c0de6c50 <nbgl_layoutAddButton>:
c0de6c50:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de6c54:	b086      	sub	sp, #24
c0de6c56:	b310      	cbz	r0, c0de6c9e <nbgl_layoutAddButton+0x4e>
c0de6c58:	4680      	mov	r8, r0
c0de6c5a:	7ac8      	ldrb	r0, [r1, #11]
c0de6c5c:	460d      	mov	r5, r1
c0de6c5e:	b108      	cbz	r0, c0de6c64 <nbgl_layoutAddButton+0x14>
c0de6c60:	7aa8      	ldrb	r0, [r5, #10]
c0de6c62:	b1f8      	cbz	r0, c0de6ca4 <nbgl_layoutAddButton+0x54>
c0de6c64:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de6c68:	f000 ff5f 	bl	c0de7b2a <OUTLINED_FUNCTION_17>
c0de6c6c:	4606      	mov	r6, r0
c0de6c6e:	7a2a      	ldrb	r2, [r5, #8]
c0de6c70:	7b2b      	ldrb	r3, [r5, #12]
c0de6c72:	4640      	mov	r0, r8
c0de6c74:	f000 ff85 	bl	c0de7b82 <OUTLINED_FUNCTION_20>
c0de6c78:	b188      	cbz	r0, c0de6c9e <nbgl_layoutAddButton+0x4e>
c0de6c7a:	210c      	movs	r1, #12
c0de6c7c:	2000      	movs	r0, #0
c0de6c7e:	7671      	strb	r1, [r6, #25]
c0de6c80:	2120      	movs	r1, #32
c0de6c82:	76b0      	strb	r0, [r6, #26]
c0de6c84:	7630      	strb	r0, [r6, #24]
c0de6c86:	75b0      	strb	r0, [r6, #22]
c0de6c88:	75f1      	strb	r1, [r6, #23]
c0de6c8a:	7a69      	ldrb	r1, [r5, #9]
c0de6c8c:	b1e9      	cbz	r1, c0de6cca <nbgl_layoutAddButton+0x7a>
c0de6c8e:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de6c92:	2003      	movs	r0, #3
c0de6c94:	77f0      	strb	r0, [r6, #31]
c0de6c96:	2902      	cmp	r1, #2
c0de6c98:	bf18      	it	ne
c0de6c9a:	2002      	movne	r0, #2
c0de6c9c:	e019      	b.n	c0de6cd2 <nbgl_layoutAddButton+0x82>
c0de6c9e:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de6ca2:	e0a3      	b.n	c0de6dec <nbgl_layoutAddButton+0x19c>
c0de6ca4:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de6ca8:	2800      	cmp	r0, #0
c0de6caa:	f000 80a2 	beq.w	c0de6df2 <nbgl_layoutAddButton+0x1a2>
c0de6cae:	2001      	movs	r0, #1
c0de6cb0:	f88d 0000 	strb.w	r0, [sp]
c0de6cb4:	e9d5 0100 	ldrd	r0, r1, [r5]
c0de6cb8:	9001      	str	r0, [sp, #4]
c0de6cba:	7b28      	ldrb	r0, [r5, #12]
c0de6cbc:	9102      	str	r1, [sp, #8]
c0de6cbe:	4669      	mov	r1, sp
c0de6cc0:	f001 f91b 	bl	c0de7efa <OUTLINED_FUNCTION_73>
c0de6cc4:	f7fd fda0 	bl	c0de4808 <nbgl_layoutAddUpFooter>
c0de6cc8:	e090      	b.n	c0de6dec <nbgl_layoutAddButton+0x19c>
c0de6cca:	2103      	movs	r1, #3
c0de6ccc:	77f0      	strb	r0, [r6, #31]
c0de6cce:	f886 1021 	strb.w	r1, [r6, #33]	@ 0x21
c0de6cd2:	f886 0020 	strb.w	r0, [r6, #32]
c0de6cd6:	6828      	ldr	r0, [r5, #0]
c0de6cd8:	f005 f94c 	bl	c0debf74 <pic>
c0de6cdc:	210c      	movs	r1, #12
c0de6cde:	0e02      	lsrs	r2, r0, #24
c0de6ce0:	f886 1023 	strb.w	r1, [r6, #35]	@ 0x23
c0de6ce4:	4631      	mov	r1, r6
c0de6ce6:	f000 ff9d 	bl	c0de7c24 <OUTLINED_FUNCTION_28>
c0de6cea:	f000 ff63 	bl	c0de7bb4 <OUTLINED_FUNCTION_23>
c0de6cee:	4631      	mov	r1, r6
c0de6cf0:	0e02      	lsrs	r2, r0, #24
c0de6cf2:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de6cf6:	70ca      	strb	r2, [r1, #3]
c0de6cf8:	0c02      	lsrs	r2, r0, #16
c0de6cfa:	0a00      	lsrs	r0, r0, #8
c0de6cfc:	708a      	strb	r2, [r1, #2]
c0de6cfe:	7048      	strb	r0, [r1, #1]
c0de6d00:	7aa8      	ldrb	r0, [r5, #10]
c0de6d02:	b308      	cbz	r0, c0de6d48 <nbgl_layoutAddButton+0xf8>
c0de6d04:	4632      	mov	r2, r6
c0de6d06:	f896 1026 	ldrb.w	r1, [r6, #38]	@ 0x26
c0de6d0a:	f896 0023 	ldrb.w	r0, [r6, #35]	@ 0x23
c0de6d0e:	f812 3f25 	ldrb.w	r3, [r2, #37]!
c0de6d12:	f001 f8fc 	bl	c0de7f0e <OUTLINED_FUNCTION_75>
c0de6d16:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de6d1a:	f004 ff6d 	bl	c0debbf8 <nbgl_getTextWidth>
c0de6d1e:	4631      	mov	r1, r6
c0de6d20:	3040      	adds	r0, #64	@ 0x40
c0de6d22:	f811 2f2e 	ldrb.w	r2, [r1, #46]!
c0de6d26:	784b      	ldrb	r3, [r1, #1]
c0de6d28:	788f      	ldrb	r7, [r1, #2]
c0de6d2a:	78c9      	ldrb	r1, [r1, #3]
c0de6d2c:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6d30:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de6d34:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
c0de6d38:	2100      	movs	r1, #0
c0de6d3a:	b18a      	cbz	r2, c0de6d60 <nbgl_layoutAddButton+0x110>
c0de6d3c:	7813      	ldrb	r3, [r2, #0]
c0de6d3e:	7852      	ldrb	r2, [r2, #1]
c0de6d40:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de6d44:	320c      	adds	r2, #12
c0de6d46:	e00c      	b.n	c0de6d62 <nbgl_layoutAddButton+0x112>
c0de6d48:	2000      	movs	r0, #0
c0de6d4a:	71f0      	strb	r0, [r6, #7]
c0de6d4c:	2058      	movs	r0, #88	@ 0x58
c0de6d4e:	71b0      	strb	r0, [r6, #6]
c0de6d50:	2001      	movs	r0, #1
c0de6d52:	7170      	strb	r0, [r6, #5]
c0de6d54:	20a0      	movs	r0, #160	@ 0xa0
c0de6d56:	7130      	strb	r0, [r6, #4]
c0de6d58:	2003      	movs	r0, #3
c0de6d5a:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de6d5e:	e01d      	b.n	c0de6d9c <nbgl_layoutAddButton+0x14c>
c0de6d60:	2200      	movs	r2, #0
c0de6d62:	71f1      	strb	r1, [r6, #7]
c0de6d64:	2140      	movs	r1, #64	@ 0x40
c0de6d66:	4410      	add	r0, r2
c0de6d68:	71b1      	strb	r1, [r6, #6]
c0de6d6a:	2101      	movs	r1, #1
c0de6d6c:	7130      	strb	r0, [r6, #4]
c0de6d6e:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de6d72:	0a01      	lsrs	r1, r0, #8
c0de6d74:	7171      	strb	r1, [r6, #5]
c0de6d76:	7ae9      	ldrb	r1, [r5, #11]
c0de6d78:	2901      	cmp	r1, #1
c0de6d7a:	d00f      	beq.n	c0de6d9c <nbgl_layoutAddButton+0x14c>
c0de6d7c:	b280      	uxth	r0, r0
c0de6d7e:	2102      	movs	r1, #2
c0de6d80:	f5c0 70d0 	rsb	r0, r0, #416	@ 0x1a0
c0de6d84:	fb90 f0f1 	sdiv	r0, r0, r1
c0de6d88:	4631      	mov	r1, r6
c0de6d8a:	f811 2f17 	ldrb.w	r2, [r1, #23]!
c0de6d8e:	784b      	ldrb	r3, [r1, #1]
c0de6d90:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6d94:	4410      	add	r0, r2
c0de6d96:	7008      	strb	r0, [r1, #0]
c0de6d98:	0a00      	lsrs	r0, r0, #8
c0de6d9a:	7048      	strb	r0, [r1, #1]
c0de6d9c:	2000      	movs	r0, #0
c0de6d9e:	4631      	mov	r1, r6
c0de6da0:	f801 0f12 	strb.w	r0, [r1, #18]!
c0de6da4:	74f0      	strb	r0, [r6, #19]
c0de6da6:	70c8      	strb	r0, [r1, #3]
c0de6da8:	7088      	strb	r0, [r1, #2]
c0de6daa:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de6dae:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6db2:	784f      	ldrb	r7, [r1, #1]
c0de6db4:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de6db8:	788c      	ldrb	r4, [r1, #2]
c0de6dba:	78c9      	ldrb	r1, [r1, #3]
c0de6dbc:	ea42 2207 	orr.w	r2, r2, r7, lsl #8
c0de6dc0:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
c0de6dc4:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6dc8:	2208      	movs	r2, #8
c0de6dca:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
c0de6dce:	2101      	movs	r1, #1
c0de6dd0:	7770      	strb	r0, [r6, #29]
c0de6dd2:	7731      	strb	r1, [r6, #28]
c0de6dd4:	7aa9      	ldrb	r1, [r5, #10]
c0de6dd6:	2900      	cmp	r1, #0
c0de6dd8:	bf08      	it	eq
c0de6dda:	2207      	moveq	r2, #7
c0de6ddc:	77b2      	strb	r2, [r6, #30]
c0de6dde:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de6de2:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de6de6:	3201      	adds	r2, #1
c0de6de8:	f881 2020 	strb.w	r2, [r1, #32]
c0de6dec:	b006      	add	sp, #24
c0de6dee:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de6df2:	2005      	movs	r0, #5
c0de6df4:	f8ad 0000 	strh.w	r0, [sp]
c0de6df8:	e9d5 0100 	ldrd	r0, r1, [r5]
c0de6dfc:	9001      	str	r0, [sp, #4]
c0de6dfe:	7b28      	ldrb	r0, [r5, #12]
c0de6e00:	9102      	str	r1, [sp, #8]
c0de6e02:	4669      	mov	r1, sp
c0de6e04:	f001 f879 	bl	c0de7efa <OUTLINED_FUNCTION_73>
c0de6e08:	f7fe f8a6 	bl	c0de4f58 <nbgl_layoutAddExtendedFooter>
c0de6e0c:	e7ee      	b.n	c0de6dec <nbgl_layoutAddButton+0x19c>

c0de6e0e <nbgl_layoutAddLongPressButton>:
c0de6e0e:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de6e10:	9102      	str	r1, [sp, #8]
c0de6e12:	2100      	movs	r1, #0
c0de6e14:	f88d 300d 	strb.w	r3, [sp, #13]
c0de6e18:	f88d 200c 	strb.w	r2, [sp, #12]
c0de6e1c:	f88d 1004 	strb.w	r1, [sp, #4]
c0de6e20:	b118      	cbz	r0, c0de6e2a <nbgl_layoutAddLongPressButton+0x1c>
c0de6e22:	a901      	add	r1, sp, #4
c0de6e24:	f7fd fcf0 	bl	c0de4808 <nbgl_layoutAddUpFooter>
c0de6e28:	e001      	b.n	c0de6e2e <nbgl_layoutAddLongPressButton+0x20>
c0de6e2a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de6e2e:	b006      	add	sp, #24
c0de6e30:	bd80      	pop	{r7, pc}

c0de6e32 <nbgl_layoutAddFooter>:
c0de6e32:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de6e34:	9101      	str	r1, [sp, #4]
c0de6e36:	f240 1101 	movw	r1, #257	@ 0x101
c0de6e3a:	f88d 2009 	strb.w	r2, [sp, #9]
c0de6e3e:	2200      	movs	r2, #0
c0de6e40:	f88d 300a 	strb.w	r3, [sp, #10]
c0de6e44:	f8ad 1000 	strh.w	r1, [sp]
c0de6e48:	4669      	mov	r1, sp
c0de6e4a:	f88d 2008 	strb.w	r2, [sp, #8]
c0de6e4e:	f7fe f883 	bl	c0de4f58 <nbgl_layoutAddExtendedFooter>
c0de6e52:	b006      	add	sp, #24
c0de6e54:	bd80      	pop	{r7, pc}

c0de6e56 <nbgl_layoutAddSplitFooter>:
c0de6e56:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de6e58:	9101      	str	r1, [sp, #4]
c0de6e5a:	f44f 7181 	mov.w	r1, #258	@ 0x102
c0de6e5e:	f88d 200c 	strb.w	r2, [sp, #12]
c0de6e62:	9302      	str	r3, [sp, #8]
c0de6e64:	f8ad 1000 	strh.w	r1, [sp]
c0de6e68:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0de6e6a:	f88d 100e 	strb.w	r1, [sp, #14]
c0de6e6e:	9908      	ldr	r1, [sp, #32]
c0de6e70:	f88d 100d 	strb.w	r1, [sp, #13]
c0de6e74:	4669      	mov	r1, sp
c0de6e76:	f7fe f86f 	bl	c0de4f58 <nbgl_layoutAddExtendedFooter>
c0de6e7a:	b006      	add	sp, #24
c0de6e7c:	bd80      	pop	{r7, pc}
	...

c0de6e80 <nbgl_layoutAddHeader>:
c0de6e80:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de6e84:	2800      	cmp	r0, #0
c0de6e86:	f000 8239 	beq.w	c0de72fc <nbgl_layoutAddHeader+0x47c>
c0de6e8a:	460d      	mov	r5, r1
c0de6e8c:	b119      	cbz	r1, c0de6e96 <nbgl_layoutAddHeader+0x16>
c0de6e8e:	4604      	mov	r4, r0
c0de6e90:	7828      	ldrb	r0, [r5, #0]
c0de6e92:	2806      	cmp	r0, #6
c0de6e94:	d903      	bls.n	c0de6e9e <nbgl_layoutAddHeader+0x1e>
c0de6e96:	f06f 0001 	mvn.w	r0, #1
c0de6e9a:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de6e9e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de6ea2:	2601      	movs	r6, #1
c0de6ea4:	f000 fe3d 	bl	c0de7b22 <OUTLINED_FUNCTION_16>
c0de6ea8:	2100      	movs	r1, #0
c0de6eaa:	7146      	strb	r6, [r0, #5]
c0de6eac:	77c1      	strb	r1, [r0, #31]
c0de6eae:	21e0      	movs	r1, #224	@ 0xe0
c0de6eb0:	7101      	strb	r1, [r0, #4]
c0de6eb2:	60e0      	str	r0, [r4, #12]
c0de6eb4:	f000 ffe8 	bl	c0de7e88 <OUTLINED_FUNCTION_64>
c0de6eb8:	68e1      	ldr	r1, [r4, #12]
c0de6eba:	0a02      	lsrs	r2, r0, #8
c0de6ebc:	0e03      	lsrs	r3, r0, #24
c0de6ebe:	f881 2023 	strb.w	r2, [r1, #35]	@ 0x23
c0de6ec2:	2202      	movs	r2, #2
c0de6ec4:	f001 f804 	bl	c0de7ed0 <OUTLINED_FUNCTION_70>
c0de6ec8:	70d3      	strb	r3, [r2, #3]
c0de6eca:	7828      	ldrb	r0, [r5, #0]
c0de6ecc:	1e42      	subs	r2, r0, #1
c0de6ece:	2a02      	cmp	r2, #2
c0de6ed0:	d311      	bcc.n	c0de6ef6 <nbgl_layoutAddHeader+0x76>
c0de6ed2:	2806      	cmp	r0, #6
c0de6ed4:	f000 80ab 	beq.w	c0de702e <nbgl_layoutAddHeader+0x1ae>
c0de6ed8:	2803      	cmp	r0, #3
c0de6eda:	f000 81d9 	beq.w	c0de7290 <nbgl_layoutAddHeader+0x410>
c0de6ede:	2804      	cmp	r0, #4
c0de6ee0:	f000 80d5 	beq.w	c0de708e <nbgl_layoutAddHeader+0x20e>
c0de6ee4:	2805      	cmp	r0, #5
c0de6ee6:	d006      	beq.n	c0de6ef6 <nbgl_layoutAddHeader+0x76>
c0de6ee8:	2800      	cmp	r0, #0
c0de6eea:	d1d4      	bne.n	c0de6e96 <nbgl_layoutAddHeader+0x16>
c0de6eec:	88a8      	ldrh	r0, [r5, #4]
c0de6eee:	7188      	strb	r0, [r1, #6]
c0de6ef0:	0a00      	lsrs	r0, r0, #8
c0de6ef2:	71c8      	strb	r0, [r1, #7]
c0de6ef4:	e1cc      	b.n	c0de7290 <nbgl_layoutAddHeader+0x410>
c0de6ef6:	f000 ff65 	bl	c0de7dc4 <OUTLINED_FUNCTION_49>
c0de6efa:	9001      	str	r0, [sp, #4]
c0de6efc:	7828      	ldrb	r0, [r5, #0]
c0de6efe:	210c      	movs	r1, #12
c0de6f00:	2805      	cmp	r0, #5
c0de6f02:	bf08      	it	eq
c0de6f04:	210d      	moveq	r1, #13
c0de6f06:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de6f0a:	f815 b001 	ldrb.w	fp, [r5, r1]
c0de6f0e:	f000 fe0c 	bl	c0de7b2a <OUTLINED_FUNCTION_17>
c0de6f12:	4606      	mov	r6, r0
c0de6f14:	f04f 0a03 	mov.w	sl, #3
c0de6f18:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de6f1c:	d00d      	beq.n	c0de6f3a <nbgl_layoutAddHeader+0xba>
c0de6f1e:	7828      	ldrb	r0, [r5, #0]
c0de6f20:	210d      	movs	r1, #13
c0de6f22:	465a      	mov	r2, fp
c0de6f24:	2805      	cmp	r0, #5
c0de6f26:	bf08      	it	eq
c0de6f28:	210f      	moveq	r1, #15
c0de6f2a:	5c6b      	ldrb	r3, [r5, r1]
c0de6f2c:	f000 fd5e 	bl	c0de79ec <OUTLINED_FUNCTION_6>
c0de6f30:	2800      	cmp	r0, #0
c0de6f32:	f000 81e3 	beq.w	c0de72fc <nbgl_layoutAddHeader+0x47c>
c0de6f36:	2000      	movs	r0, #0
c0de6f38:	e000      	b.n	c0de6f3c <nbgl_layoutAddHeader+0xbc>
c0de6f3a:	2003      	movs	r0, #3
c0de6f3c:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de6f40:	2004      	movs	r0, #4
c0de6f42:	f04f 0800 	mov.w	r8, #0
c0de6f46:	2160      	movs	r1, #96	@ 0x60
c0de6f48:	f886 a01f 	strb.w	sl, [r6, #31]
c0de6f4c:	f886 a020 	strb.w	sl, [r6, #32]
c0de6f50:	75b0      	strb	r0, [r6, #22]
c0de6f52:	4630      	mov	r0, r6
c0de6f54:	71b1      	strb	r1, [r6, #6]
c0de6f56:	2168      	movs	r1, #104	@ 0x68
c0de6f58:	f886 8026 	strb.w	r8, [r6, #38]	@ 0x26
c0de6f5c:	f886 8007 	strb.w	r8, [r6, #7]
c0de6f60:	f886 8005 	strb.w	r8, [r6, #5]
c0de6f64:	f800 8f25 	strb.w	r8, [r0, #37]!
c0de6f68:	7131      	strb	r1, [r6, #4]
c0de6f6a:	f880 8003 	strb.w	r8, [r0, #3]
c0de6f6e:	f880 8002 	strb.w	r8, [r0, #2]
c0de6f72:	48e4      	ldr	r0, [pc, #912]	@ (c0de7304 <nbgl_layoutAddHeader+0x484>)
c0de6f74:	4478      	add	r0, pc
c0de6f76:	f004 fffd 	bl	c0debf74 <pic>
c0de6f7a:	4631      	mov	r1, r6
c0de6f7c:	0e02      	lsrs	r2, r0, #24
c0de6f7e:	f886 801d 	strb.w	r8, [r6, #29]
c0de6f82:	f000 fd5f 	bl	c0de7a44 <OUTLINED_FUNCTION_9>
c0de6f86:	f1bb 00ff 	subs.w	r0, fp, #255	@ 0xff
c0de6f8a:	bf18      	it	ne
c0de6f8c:	2001      	movne	r0, #1
c0de6f8e:	7730      	strb	r0, [r6, #28]
c0de6f90:	9f01      	ldr	r7, [sp, #4]
c0de6f92:	68e1      	ldr	r1, [r4, #12]
c0de6f94:	2006      	movs	r0, #6
c0de6f96:	77b0      	strb	r0, [r6, #30]
c0de6f98:	f891 0020 	ldrb.w	r0, [r1, #32]
c0de6f9c:	3001      	adds	r0, #1
c0de6f9e:	2f00      	cmp	r7, #0
c0de6fa0:	f881 0020 	strb.w	r0, [r1, #32]
c0de6fa4:	f000 809a 	beq.w	c0de70dc <nbgl_layoutAddHeader+0x25c>
c0de6fa8:	7828      	ldrb	r0, [r5, #0]
c0de6faa:	f04f 0a00 	mov.w	sl, #0
c0de6fae:	2802      	cmp	r0, #2
c0de6fb0:	d122      	bne.n	c0de6ff8 <nbgl_layoutAddHeader+0x178>
c0de6fb2:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de6fb6:	f000 fde7 	bl	c0de7b88 <OUTLINED_FUNCTION_21>
c0de6fba:	4606      	mov	r6, r0
c0de6fbc:	f000 fdfa 	bl	c0de7bb4 <OUTLINED_FUNCTION_23>
c0de6fc0:	4631      	mov	r1, r6
c0de6fc2:	0e02      	lsrs	r2, r0, #24
c0de6fc4:	f886 a01f 	strb.w	sl, [r6, #31]
c0de6fc8:	46b2      	mov	sl, r6
c0de6fca:	f000 ff2d 	bl	c0de7e28 <OUTLINED_FUNCTION_56>
c0de6fce:	68e0      	ldr	r0, [r4, #12]
c0de6fd0:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6fd4:	7843      	ldrb	r3, [r0, #1]
c0de6fd6:	f810 cc02 	ldrb.w	ip, [r0, #-2]
c0de6fda:	7882      	ldrb	r2, [r0, #2]
c0de6fdc:	78c0      	ldrb	r0, [r0, #3]
c0de6fde:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de6fe2:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de6fe6:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de6fea:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de6fee:	2005      	movs	r0, #5
c0de6ff0:	75b0      	strb	r0, [r6, #22]
c0de6ff2:	68e0      	ldr	r0, [r4, #12]
c0de6ff4:	f000 fcb0 	bl	c0de7958 <OUTLINED_FUNCTION_1>
c0de6ff8:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de6ffc:	f000 fca8 	bl	c0de7950 <OUTLINED_FUNCTION_0>
c0de7000:	782b      	ldrb	r3, [r5, #0]
c0de7002:	4680      	mov	r8, r0
c0de7004:	2b05      	cmp	r3, #5
c0de7006:	d16c      	bne.n	c0de70e2 <nbgl_layoutAddHeader+0x262>
c0de7008:	7b2a      	ldrb	r2, [r5, #12]
c0de700a:	2aff      	cmp	r2, #255	@ 0xff
c0de700c:	d068      	beq.n	c0de70e0 <nbgl_layoutAddHeader+0x260>
c0de700e:	7beb      	ldrb	r3, [r5, #15]
c0de7010:	4620      	mov	r0, r4
c0de7012:	4641      	mov	r1, r8
c0de7014:	f7fd f97a 	bl	c0de430c <layoutAddCallbackObj>
c0de7018:	2800      	cmp	r0, #0
c0de701a:	f000 816f 	beq.w	c0de72fc <nbgl_layoutAddHeader+0x47c>
c0de701e:	2000      	movs	r0, #0
c0de7020:	f888 001d 	strb.w	r0, [r8, #29]
c0de7024:	2001      	movs	r0, #1
c0de7026:	f888 001c 	strb.w	r0, [r8, #28]
c0de702a:	782b      	ldrb	r3, [r5, #0]
c0de702c:	e059      	b.n	c0de70e2 <nbgl_layoutAddHeader+0x262>
c0de702e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7032:	f000 fc8d 	bl	c0de7950 <OUTLINED_FUNCTION_0>
c0de7036:	4606      	mov	r6, r0
c0de7038:	7a2a      	ldrb	r2, [r5, #8]
c0de703a:	7a6b      	ldrb	r3, [r5, #9]
c0de703c:	f000 fcd6 	bl	c0de79ec <OUTLINED_FUNCTION_6>
c0de7040:	2800      	cmp	r0, #0
c0de7042:	f000 815b 	beq.w	c0de72fc <nbgl_layoutAddHeader+0x47c>
c0de7046:	2020      	movs	r0, #32
c0de7048:	4637      	mov	r7, r6
c0de704a:	f04f 0a00 	mov.w	sl, #0
c0de704e:	f04f 0806 	mov.w	r8, #6
c0de7052:	f04f 0b01 	mov.w	fp, #1
c0de7056:	75f0      	strb	r0, [r6, #23]
c0de7058:	20a0      	movs	r0, #160	@ 0xa0
c0de705a:	f886 a01f 	strb.w	sl, [r6, #31]
c0de705e:	f886 a018 	strb.w	sl, [r6, #24]
c0de7062:	f886 8016 	strb.w	r8, [r6, #22]
c0de7066:	f886 b005 	strb.w	fp, [r6, #5]
c0de706a:	7130      	strb	r0, [r6, #4]
c0de706c:	2060      	movs	r0, #96	@ 0x60
c0de706e:	f807 0f06 	strb.w	r0, [r7, #6]!
c0de7072:	f887 a001 	strb.w	sl, [r7, #1]
c0de7076:	f000 fd9d 	bl	c0de7bb4 <OUTLINED_FUNCTION_23>
c0de707a:	f000 fee7 	bl	c0de7e4c <OUTLINED_FUNCTION_58>
c0de707e:	f886 8020 	strb.w	r8, [r6, #32]
c0de7082:	f000 fcb7 	bl	c0de79f4 <OUTLINED_FUNCTION_7>
c0de7086:	f000 fee6 	bl	c0de7e56 <OUTLINED_FUNCTION_59>
c0de708a:	77b0      	strb	r0, [r6, #30]
c0de708c:	e01e      	b.n	c0de70cc <nbgl_layoutAddHeader+0x24c>
c0de708e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7092:	f000 fc5d 	bl	c0de7950 <OUTLINED_FUNCTION_0>
c0de7096:	4606      	mov	r6, r0
c0de7098:	21a0      	movs	r1, #160	@ 0xa0
c0de709a:	2000      	movs	r0, #0
c0de709c:	f04f 0801 	mov.w	r8, #1
c0de70a0:	7131      	strb	r1, [r6, #4]
c0de70a2:	2160      	movs	r1, #96	@ 0x60
c0de70a4:	4637      	mov	r7, r6
c0de70a6:	77f0      	strb	r0, [r6, #31]
c0de70a8:	f886 8005 	strb.w	r8, [r6, #5]
c0de70ac:	f807 1f06 	strb.w	r1, [r7, #6]!
c0de70b0:	7078      	strb	r0, [r7, #1]
c0de70b2:	f000 fd7f 	bl	c0de7bb4 <OUTLINED_FUNCTION_23>
c0de70b6:	4631      	mov	r1, r6
c0de70b8:	0e02      	lsrs	r2, r0, #24
c0de70ba:	f886 8024 	strb.w	r8, [r6, #36]	@ 0x24
c0de70be:	f000 fc99 	bl	c0de79f4 <OUTLINED_FUNCTION_7>
c0de70c2:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de70c6:	2005      	movs	r0, #5
c0de70c8:	f886 0020 	strb.w	r0, [r6, #32]
c0de70cc:	68e1      	ldr	r1, [r4, #12]
c0de70ce:	787a      	ldrb	r2, [r7, #1]
c0de70d0:	7838      	ldrb	r0, [r7, #0]
c0de70d2:	71ca      	strb	r2, [r1, #7]
c0de70d4:	7188      	strb	r0, [r1, #6]
c0de70d6:	f000 fec9 	bl	c0de7e6c <OUTLINED_FUNCTION_61>
c0de70da:	e0d9      	b.n	c0de7290 <nbgl_layoutAddHeader+0x410>
c0de70dc:	7828      	ldrb	r0, [r5, #0]
c0de70de:	e096      	b.n	c0de720e <nbgl_layoutAddHeader+0x38e>
c0de70e0:	2305      	movs	r3, #5
c0de70e2:	68e2      	ldr	r2, [r4, #12]
c0de70e4:	f04f 0e00 	mov.w	lr, #0
c0de70e8:	f04f 0c05 	mov.w	ip, #5
c0de70ec:	f888 e01f 	strb.w	lr, [r8, #31]
c0de70f0:	f888 c016 	strb.w	ip, [r8, #22]
c0de70f4:	7916      	ldrb	r6, [r2, #4]
c0de70f6:	7952      	ldrb	r2, [r2, #5]
c0de70f8:	ea46 2602 	orr.w	r6, r6, r2, lsl #8
c0de70fc:	f1a6 02d0 	sub.w	r2, r6, #208	@ 0xd0
c0de7100:	0a10      	lsrs	r0, r2, #8
c0de7102:	f888 2004 	strb.w	r2, [r8, #4]
c0de7106:	2b02      	cmp	r3, #2
c0de7108:	f888 0005 	strb.w	r0, [r8, #5]
c0de710c:	d117      	bne.n	c0de713e <nbgl_layoutAddHeader+0x2be>
c0de710e:	4650      	mov	r0, sl
c0de7110:	f810 2f21 	ldrb.w	r2, [r0, #33]!
c0de7114:	7843      	ldrb	r3, [r0, #1]
c0de7116:	7881      	ldrb	r1, [r0, #2]
c0de7118:	78c0      	ldrb	r0, [r0, #3]
c0de711a:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de711e:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de7122:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de7126:	7801      	ldrb	r1, [r0, #0]
c0de7128:	7840      	ldrb	r0, [r0, #1]
c0de712a:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de712e:	1a30      	subs	r0, r6, r0
c0de7130:	f1a0 02e0 	sub.w	r2, r0, #224	@ 0xe0
c0de7134:	0a10      	lsrs	r0, r2, #8
c0de7136:	f888 2004 	strb.w	r2, [r8, #4]
c0de713a:	f888 0005 	strb.w	r0, [r8, #5]
c0de713e:	4640      	mov	r0, r8
c0de7140:	0e39      	lsrs	r1, r7, #24
c0de7142:	b292      	uxth	r2, r2
c0de7144:	2301      	movs	r3, #1
c0de7146:	f800 7f26 	strb.w	r7, [r0, #38]!
c0de714a:	70c1      	strb	r1, [r0, #3]
c0de714c:	0c39      	lsrs	r1, r7, #16
c0de714e:	f800 ec1f 	strb.w	lr, [r0, #-31]
c0de7152:	f800 cc06 	strb.w	ip, [r0, #-6]
c0de7156:	7081      	strb	r1, [r0, #2]
c0de7158:	0a39      	lsrs	r1, r7, #8
c0de715a:	7041      	strb	r1, [r0, #1]
c0de715c:	2160      	movs	r1, #96	@ 0x60
c0de715e:	f800 1c20 	strb.w	r1, [r0, #-32]
c0de7162:	210c      	movs	r1, #12
c0de7164:	f800 1c04 	strb.w	r1, [r0, #-4]
c0de7168:	2101      	movs	r1, #1
c0de716a:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de716e:	200c      	movs	r0, #12
c0de7170:	4639      	mov	r1, r7
c0de7172:	f004 fd3c 	bl	c0debbee <nbgl_getTextNbLinesInWidth>
c0de7176:	7828      	ldrb	r0, [r5, #0]
c0de7178:	2802      	cmp	r0, #2
c0de717a:	d115      	bne.n	c0de71a8 <nbgl_layoutAddHeader+0x328>
c0de717c:	4646      	mov	r6, r8
c0de717e:	f816 cf26 	ldrb.w	ip, [r6, #38]!
c0de7182:	7872      	ldrb	r2, [r6, #1]
c0de7184:	78b3      	ldrb	r3, [r6, #2]
c0de7186:	78f1      	ldrb	r1, [r6, #3]
c0de7188:	f816 0c04 	ldrb.w	r0, [r6, #-4]
c0de718c:	ea4c 2202 	orr.w	r2, ip, r2, lsl #8
c0de7190:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de7194:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de7198:	f004 fd2e 	bl	c0debbf8 <nbgl_getTextWidth>
c0de719c:	f806 0c22 	strb.w	r0, [r6, #-34]
c0de71a0:	0a00      	lsrs	r0, r0, #8
c0de71a2:	f806 0c21 	strb.w	r0, [r6, #-33]
c0de71a6:	7828      	ldrb	r0, [r5, #0]
c0de71a8:	68e1      	ldr	r1, [r4, #12]
c0de71aa:	f000 fd65 	bl	c0de7c78 <OUTLINED_FUNCTION_32>
c0de71ae:	f841 8023 	str.w	r8, [r1, r3, lsl #2]
c0de71b2:	68e1      	ldr	r1, [r4, #12]
c0de71b4:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de71b8:	3201      	adds	r2, #1
c0de71ba:	2802      	cmp	r0, #2
c0de71bc:	f881 2020 	strb.w	r2, [r1, #32]
c0de71c0:	d125      	bne.n	c0de720e <nbgl_layoutAddHeader+0x38e>
c0de71c2:	f898 0004 	ldrb.w	r0, [r8, #4]
c0de71c6:	f898 2005 	ldrb.w	r2, [r8, #5]
c0de71ca:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de71ce:	f06f 0207 	mvn.w	r2, #7
c0de71d2:	eba2 0050 	sub.w	r0, r2, r0, lsr #1
c0de71d6:	f81a 2f21 	ldrb.w	r2, [sl, #33]!
c0de71da:	f80a 0c0a 	strb.w	r0, [sl, #-10]
c0de71de:	0a00      	lsrs	r0, r0, #8
c0de71e0:	f89a 3002 	ldrb.w	r3, [sl, #2]
c0de71e4:	f89a 6003 	ldrb.w	r6, [sl, #3]
c0de71e8:	f80a 0c09 	strb.w	r0, [sl, #-9]
c0de71ec:	f89a 0001 	ldrb.w	r0, [sl, #1]
c0de71f0:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de71f4:	ea43 2206 	orr.w	r2, r3, r6, lsl #8
c0de71f8:	f000 fea3 	bl	c0de7f42 <OUTLINED_FUNCTION_81>
c0de71fc:	2208      	movs	r2, #8
c0de71fe:	eb02 0050 	add.w	r0, r2, r0, lsr #1
c0de7202:	f888 0017 	strb.w	r0, [r8, #23]
c0de7206:	0a00      	lsrs	r0, r0, #8
c0de7208:	f888 0018 	strb.w	r0, [r8, #24]
c0de720c:	e03c      	b.n	c0de7288 <nbgl_layoutAddHeader+0x408>
c0de720e:	2805      	cmp	r0, #5
c0de7210:	d13a      	bne.n	c0de7288 <nbgl_layoutAddHeader+0x408>
c0de7212:	6868      	ldr	r0, [r5, #4]
c0de7214:	b3c0      	cbz	r0, c0de7288 <nbgl_layoutAddHeader+0x408>
c0de7216:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de721a:	f000 fc86 	bl	c0de7b2a <OUTLINED_FUNCTION_17>
c0de721e:	7baa      	ldrb	r2, [r5, #14]
c0de7220:	4606      	mov	r6, r0
c0de7222:	2aff      	cmp	r2, #255	@ 0xff
c0de7224:	d008      	beq.n	c0de7238 <nbgl_layoutAddHeader+0x3b8>
c0de7226:	7beb      	ldrb	r3, [r5, #15]
c0de7228:	f000 fbe0 	bl	c0de79ec <OUTLINED_FUNCTION_6>
c0de722c:	2800      	cmp	r0, #0
c0de722e:	d065      	beq.n	c0de72fc <nbgl_layoutAddHeader+0x47c>
c0de7230:	2000      	movs	r0, #0
c0de7232:	7770      	strb	r0, [r6, #29]
c0de7234:	2001      	movs	r0, #1
c0de7236:	7730      	strb	r0, [r6, #28]
c0de7238:	2003      	movs	r0, #3
c0de723a:	2106      	movs	r1, #6
c0de723c:	2260      	movs	r2, #96	@ 0x60
c0de723e:	77f0      	strb	r0, [r6, #31]
c0de7240:	75b1      	strb	r1, [r6, #22]
c0de7242:	7ba9      	ldrb	r1, [r5, #14]
c0de7244:	71b2      	strb	r2, [r6, #6]
c0de7246:	2268      	movs	r2, #104	@ 0x68
c0de7248:	f886 0020 	strb.w	r0, [r6, #32]
c0de724c:	2000      	movs	r0, #0
c0de724e:	7132      	strb	r2, [r6, #4]
c0de7250:	4632      	mov	r2, r6
c0de7252:	f886 0026 	strb.w	r0, [r6, #38]	@ 0x26
c0de7256:	71f0      	strb	r0, [r6, #7]
c0de7258:	7170      	strb	r0, [r6, #5]
c0de725a:	f802 0f25 	strb.w	r0, [r2, #37]!
c0de725e:	70d0      	strb	r0, [r2, #3]
c0de7260:	7090      	strb	r0, [r2, #2]
c0de7262:	f1a1 00ff 	sub.w	r0, r1, #255	@ 0xff
c0de7266:	fab0 f080 	clz	r0, r0
c0de726a:	0940      	lsrs	r0, r0, #5
c0de726c:	0040      	lsls	r0, r0, #1
c0de726e:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de7272:	f000 fc9f 	bl	c0de7bb4 <OUTLINED_FUNCTION_23>
c0de7276:	4631      	mov	r1, r6
c0de7278:	0e02      	lsrs	r2, r0, #24
c0de727a:	f000 fbe3 	bl	c0de7a44 <OUTLINED_FUNCTION_9>
c0de727e:	2008      	movs	r0, #8
c0de7280:	68e1      	ldr	r1, [r4, #12]
c0de7282:	77b0      	strb	r0, [r6, #30]
c0de7284:	f000 fdf2 	bl	c0de7e6c <OUTLINED_FUNCTION_61>
c0de7288:	2000      	movs	r0, #0
c0de728a:	71c8      	strb	r0, [r1, #7]
c0de728c:	2060      	movs	r0, #96	@ 0x60
c0de728e:	7188      	strb	r0, [r1, #6]
c0de7290:	7868      	ldrb	r0, [r5, #1]
c0de7292:	b160      	cbz	r0, c0de72ae <nbgl_layoutAddHeader+0x42e>
c0de7294:	f000 fca1 	bl	c0de7bda <OUTLINED_FUNCTION_25>
c0de7298:	68e1      	ldr	r1, [r4, #12]
c0de729a:	f000 fb8a 	bl	c0de79b2 <OUTLINED_FUNCTION_4>
c0de729e:	2103      	movs	r1, #3
c0de72a0:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de72a4:	2108      	movs	r1, #8
c0de72a6:	7581      	strb	r1, [r0, #22]
c0de72a8:	68e1      	ldr	r1, [r4, #12]
c0de72aa:	f000 fddf 	bl	c0de7e6c <OUTLINED_FUNCTION_61>
c0de72ae:	68a0      	ldr	r0, [r4, #8]
c0de72b0:	6001      	str	r1, [r0, #0]
c0de72b2:	68e0      	ldr	r0, [r4, #12]
c0de72b4:	f8d4 10a0 	ldr.w	r1, [r4, #160]	@ 0xa0
c0de72b8:	4602      	mov	r2, r0
c0de72ba:	f812 3f06 	ldrb.w	r3, [r2, #6]!
c0de72be:	7856      	ldrb	r6, [r2, #1]
c0de72c0:	f801 0f12 	strb.w	r0, [r1, #18]!
c0de72c4:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de72c8:	f811 6d0c 	ldrb.w	r6, [r1, #-12]!
c0de72cc:	784f      	ldrb	r7, [r1, #1]
c0de72ce:	ea46 2607 	orr.w	r6, r6, r7, lsl #8
c0de72d2:	1af3      	subs	r3, r6, r3
c0de72d4:	700b      	strb	r3, [r1, #0]
c0de72d6:	0a1b      	lsrs	r3, r3, #8
c0de72d8:	704b      	strb	r3, [r1, #1]
c0de72da:	782b      	ldrb	r3, [r5, #0]
c0de72dc:	f884 30aa 	strb.w	r3, [r4, #170]	@ 0xaa
c0de72e0:	0e03      	lsrs	r3, r0, #24
c0de72e2:	73cb      	strb	r3, [r1, #15]
c0de72e4:	0c03      	lsrs	r3, r0, #16
c0de72e6:	0a00      	lsrs	r0, r0, #8
c0de72e8:	7348      	strb	r0, [r1, #13]
c0de72ea:	2007      	movs	r0, #7
c0de72ec:	738b      	strb	r3, [r1, #14]
c0de72ee:	7408      	strb	r0, [r1, #16]
c0de72f0:	7810      	ldrb	r0, [r2, #0]
c0de72f2:	7851      	ldrb	r1, [r2, #1]
c0de72f4:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de72f8:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de72fc:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de7300:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de7304:	00006081 	.word	0x00006081

c0de7308 <nbgl_layoutAddProgressIndicator>:
c0de7308:	b51f      	push	{r0, r1, r2, r3, r4, lr}
c0de730a:	9c07      	ldr	r4, [sp, #28]
c0de730c:	f88d 1008 	strb.w	r1, [sp, #8]
c0de7310:	2100      	movs	r1, #0
c0de7312:	f88d 300a 	strb.w	r3, [sp, #10]
c0de7316:	f88d 2009 	strb.w	r2, [sp, #9]
c0de731a:	9101      	str	r1, [sp, #4]
c0de731c:	2103      	movs	r1, #3
c0de731e:	f88d 400d 	strb.w	r4, [sp, #13]
c0de7322:	24ff      	movs	r4, #255	@ 0xff
c0de7324:	f8ad 1000 	strh.w	r1, [sp]
c0de7328:	4669      	mov	r1, sp
c0de732a:	f88d 400c 	strb.w	r4, [sp, #12]
c0de732e:	9c06      	ldr	r4, [sp, #24]
c0de7330:	f88d 400b 	strb.w	r4, [sp, #11]
c0de7334:	f7ff fda4 	bl	c0de6e80 <nbgl_layoutAddHeader>
c0de7338:	b004      	add	sp, #16
c0de733a:	bd10      	pop	{r4, pc}

c0de733c <nbgl_layoutAddSpinner>:
c0de733c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de7340:	b088      	sub	sp, #32
c0de7342:	2800      	cmp	r0, #0
c0de7344:	f000 811a 	beq.w	c0de757c <nbgl_layoutAddSpinner+0x240>
c0de7348:	9101      	str	r1, [sp, #4]
c0de734a:	f000 fdf1 	bl	c0de7f30 <OUTLINED_FUNCTION_79>
c0de734e:	469a      	mov	sl, r3
c0de7350:	2601      	movs	r6, #1
c0de7352:	4f8d      	ldr	r7, [pc, #564]	@ (c0de7588 <nbgl_layoutAddSpinner+0x24c>)
c0de7354:	9203      	str	r2, [sp, #12]
c0de7356:	08c1      	lsrs	r1, r0, #3
c0de7358:	2001      	movs	r0, #1
c0de735a:	447f      	add	r7, pc
c0de735c:	47b8      	blx	r7
c0de735e:	4683      	mov	fp, r0
c0de7360:	2003      	movs	r0, #3
c0de7362:	463d      	mov	r5, r7
c0de7364:	f88b 0020 	strb.w	r0, [fp, #32]
c0de7368:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de736c:	08c1      	lsrs	r1, r0, #3
c0de736e:	2003      	movs	r0, #3
c0de7370:	f004 fc24 	bl	c0debbbc <nbgl_containerPoolGet>
c0de7374:	2100      	movs	r1, #0
c0de7376:	f88b 6005 	strb.w	r6, [fp, #5]
c0de737a:	465e      	mov	r6, fp
c0de737c:	270d      	movs	r7, #13
c0de737e:	f88b 101f 	strb.w	r1, [fp, #31]
c0de7382:	21a0      	movs	r1, #160	@ 0xa0
c0de7384:	f806 0f22 	strb.w	r0, [r6, #34]!
c0de7388:	f88b 1004 	strb.w	r1, [fp, #4]
c0de738c:	2105      	movs	r1, #5
c0de738e:	f88b 1016 	strb.w	r1, [fp, #22]
c0de7392:	0e01      	lsrs	r1, r0, #24
c0de7394:	f000 fd65 	bl	c0de7e62 <OUTLINED_FUNCTION_60>
c0de7398:	f88b 0023 	strb.w	r0, [fp, #35]	@ 0x23
c0de739c:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de73a0:	08c1      	lsrs	r1, r0, #3
c0de73a2:	200d      	movs	r0, #13
c0de73a4:	47a8      	blx	r5
c0de73a6:	4680      	mov	r8, r0
c0de73a8:	f880 a01f 	strb.w	sl, [r0, #31]
c0de73ac:	2002      	movs	r0, #2
c0de73ae:	7831      	ldrb	r1, [r6, #0]
c0de73b0:	78b2      	ldrb	r2, [r6, #2]
c0de73b2:	78f3      	ldrb	r3, [r6, #3]
c0de73b4:	f8cd a008 	str.w	sl, [sp, #8]
c0de73b8:	46da      	mov	sl, fp
c0de73ba:	9404      	str	r4, [sp, #16]
c0de73bc:	f888 0016 	strb.w	r0, [r8, #22]
c0de73c0:	f89b 0023 	ldrb.w	r0, [fp, #35]	@ 0x23
c0de73c4:	f000 fcf7 	bl	c0de7db6 <OUTLINED_FUNCTION_48>
c0de73c8:	f8c0 8000 	str.w	r8, [r0]
c0de73cc:	f81a 0f06 	ldrb.w	r0, [sl, #6]!
c0de73d0:	f89a 1001 	ldrb.w	r1, [sl, #1]
c0de73d4:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de73d8:	3030      	adds	r0, #48	@ 0x30
c0de73da:	f88a 0000 	strb.w	r0, [sl]
c0de73de:	0a00      	lsrs	r0, r0, #8
c0de73e0:	f88a 0001 	strb.w	r0, [sl, #1]
c0de73e4:	9804      	ldr	r0, [sp, #16]
c0de73e6:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de73ea:	08c1      	lsrs	r1, r0, #3
c0de73ec:	2004      	movs	r0, #4
c0de73ee:	47a8      	blx	r5
c0de73f0:	4605      	mov	r5, r0
c0de73f2:	2000      	movs	r0, #0
c0de73f4:	ea4f 2418 	mov.w	r4, r8, lsr #8
c0de73f8:	77e8      	strb	r0, [r5, #31]
c0de73fa:	9801      	ldr	r0, [sp, #4]
c0de73fc:	f004 fdba 	bl	c0debf74 <pic>
c0de7400:	4601      	mov	r1, r0
c0de7402:	2001      	movs	r0, #1
c0de7404:	22a0      	movs	r2, #160	@ 0xa0
c0de7406:	74ec      	strb	r4, [r5, #19]
c0de7408:	462c      	mov	r4, r5
c0de740a:	7168      	strb	r0, [r5, #5]
c0de740c:	f885 0024 	strb.w	r0, [r5, #36]	@ 0x24
c0de7410:	9803      	ldr	r0, [sp, #12]
c0de7412:	712a      	strb	r2, [r5, #4]
c0de7414:	2800      	cmp	r0, #0
c0de7416:	bf08      	it	eq
c0de7418:	270b      	moveq	r7, #11
c0de741a:	f885 7022 	strb.w	r7, [r5, #34]	@ 0x22
c0de741e:	2005      	movs	r0, #5
c0de7420:	0e0a      	lsrs	r2, r1, #24
c0de7422:	2301      	movs	r3, #1
c0de7424:	f885 0020 	strb.w	r0, [r5, #32]
c0de7428:	2008      	movs	r0, #8
c0de742a:	75a8      	strb	r0, [r5, #22]
c0de742c:	4628      	mov	r0, r5
c0de742e:	f000 fb52 	bl	c0de7ad6 <OUTLINED_FUNCTION_13>
c0de7432:	ea4f 6218 	mov.w	r2, r8, lsr #24
c0de7436:	f885 0027 	strb.w	r0, [r5, #39]	@ 0x27
c0de743a:	2018      	movs	r0, #24
c0de743c:	f804 0f19 	strb.w	r0, [r4, #25]!
c0de7440:	2000      	movs	r0, #0
c0de7442:	7060      	strb	r0, [r4, #1]
c0de7444:	4628      	mov	r0, r5
c0de7446:	f800 8f12 	strb.w	r8, [r0, #18]!
c0de744a:	70c2      	strb	r2, [r0, #3]
c0de744c:	ea4f 4218 	mov.w	r2, r8, lsr #16
c0de7450:	f8dd 8010 	ldr.w	r8, [sp, #16]
c0de7454:	7082      	strb	r2, [r0, #2]
c0de7456:	4638      	mov	r0, r7
c0de7458:	f000 fcc1 	bl	c0de7dde <OUTLINED_FUNCTION_51>
c0de745c:	2100      	movs	r1, #0
c0de745e:	71a8      	strb	r0, [r5, #6]
c0de7460:	f885 1021 	strb.w	r1, [r5, #33]	@ 0x21
c0de7464:	0a01      	lsrs	r1, r0, #8
c0de7466:	7832      	ldrb	r2, [r6, #0]
c0de7468:	78b3      	ldrb	r3, [r6, #2]
c0de746a:	78f6      	ldrb	r6, [r6, #3]
c0de746c:	71e9      	strb	r1, [r5, #7]
c0de746e:	f89b 1023 	ldrb.w	r1, [fp, #35]	@ 0x23
c0de7472:	f000 fd53 	bl	c0de7f1c <OUTLINED_FUNCTION_76>
c0de7476:	7862      	ldrb	r2, [r4, #1]
c0de7478:	604d      	str	r5, [r1, #4]
c0de747a:	7821      	ldrb	r1, [r4, #0]
c0de747c:	9c03      	ldr	r4, [sp, #12]
c0de747e:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7482:	f89a 2001 	ldrb.w	r2, [sl, #1]
c0de7486:	4408      	add	r0, r1
c0de7488:	f89a 1000 	ldrb.w	r1, [sl]
c0de748c:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7490:	4408      	add	r0, r1
c0de7492:	f88a 0000 	strb.w	r0, [sl]
c0de7496:	0a00      	lsrs	r0, r0, #8
c0de7498:	2c00      	cmp	r4, #0
c0de749a:	f88a 0001 	strb.w	r0, [sl, #1]
c0de749e:	d051      	beq.n	c0de7544 <nbgl_layoutAddSpinner+0x208>
c0de74a0:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de74a4:	f000 fa54 	bl	c0de7950 <OUTLINED_FUNCTION_0>
c0de74a8:	2600      	movs	r6, #0
c0de74aa:	4607      	mov	r7, r0
c0de74ac:	77c6      	strb	r6, [r0, #31]
c0de74ae:	4620      	mov	r0, r4
c0de74b0:	f004 fd60 	bl	c0debf74 <pic>
c0de74b4:	4601      	mov	r1, r0
c0de74b6:	0a28      	lsrs	r0, r5, #8
c0de74b8:	22a0      	movs	r2, #160	@ 0xa0
c0de74ba:	463c      	mov	r4, r7
c0de74bc:	2301      	movs	r3, #1
c0de74be:	74f8      	strb	r0, [r7, #19]
c0de74c0:	2001      	movs	r0, #1
c0de74c2:	713a      	strb	r2, [r7, #4]
c0de74c4:	0e0a      	lsrs	r2, r1, #24
c0de74c6:	7178      	strb	r0, [r7, #5]
c0de74c8:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de74cc:	200b      	movs	r0, #11
c0de74ce:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de74d2:	2005      	movs	r0, #5
c0de74d4:	f887 0020 	strb.w	r0, [r7, #32]
c0de74d8:	2008      	movs	r0, #8
c0de74da:	75b8      	strb	r0, [r7, #22]
c0de74dc:	4638      	mov	r0, r7
c0de74de:	f000 fafa 	bl	c0de7ad6 <OUTLINED_FUNCTION_13>
c0de74e2:	0e2a      	lsrs	r2, r5, #24
c0de74e4:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de74e8:	2010      	movs	r0, #16
c0de74ea:	f804 0f19 	strb.w	r0, [r4, #25]!
c0de74ee:	4638      	mov	r0, r7
c0de74f0:	f800 5f12 	strb.w	r5, [r0, #18]!
c0de74f4:	7066      	strb	r6, [r4, #1]
c0de74f6:	70c2      	strb	r2, [r0, #3]
c0de74f8:	0c2a      	lsrs	r2, r5, #16
c0de74fa:	7082      	strb	r2, [r0, #2]
c0de74fc:	200b      	movs	r0, #11
c0de74fe:	f000 fc6e 	bl	c0de7dde <OUTLINED_FUNCTION_51>
c0de7502:	0a01      	lsrs	r1, r0, #8
c0de7504:	7862      	ldrb	r2, [r4, #1]
c0de7506:	71b8      	strb	r0, [r7, #6]
c0de7508:	f887 6021 	strb.w	r6, [r7, #33]	@ 0x21
c0de750c:	71f9      	strb	r1, [r7, #7]
c0de750e:	7821      	ldrb	r1, [r4, #0]
c0de7510:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7514:	eb01 0c00 	add.w	ip, r1, r0
c0de7518:	4659      	mov	r1, fp
c0de751a:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de751e:	f811 3d1c 	ldrb.w	r3, [r1, #-28]!
c0de7522:	784c      	ldrb	r4, [r1, #1]
c0de7524:	7f4d      	ldrb	r5, [r1, #29]
c0de7526:	7f8e      	ldrb	r6, [r1, #30]
c0de7528:	7fc8      	ldrb	r0, [r1, #31]
c0de752a:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de752e:	ea42 2205 	orr.w	r2, r2, r5, lsl #8
c0de7532:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de7536:	4463      	add	r3, ip
c0de7538:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de753c:	700b      	strb	r3, [r1, #0]
c0de753e:	6087      	str	r7, [r0, #8]
c0de7540:	0a18      	lsrs	r0, r3, #8
c0de7542:	7048      	strb	r0, [r1, #1]
c0de7544:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de7548:	f000 fa95 	bl	c0de7a76 <OUTLINED_FUNCTION_10>
c0de754c:	f840 b022 	str.w	fp, [r0, r2, lsl #2]
c0de7550:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de7554:	f000 fa00 	bl	c0de7958 <OUTLINED_FUNCTION_1>
c0de7558:	9802      	ldr	r0, [sp, #8]
c0de755a:	28ff      	cmp	r0, #255	@ 0xff
c0de755c:	d00c      	beq.n	c0de7578 <nbgl_layoutAddSpinner+0x23c>
c0de755e:	f44f 70c8 	mov.w	r0, #400	@ 0x190
c0de7562:	e9cd 0006 	strd	r0, r0, [sp, #24]
c0de7566:	4809      	ldr	r0, [pc, #36]	@ (c0de758c <nbgl_layoutAddSpinner+0x250>)
c0de7568:	4478      	add	r0, pc
c0de756a:	9005      	str	r0, [sp, #20]
c0de756c:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de7570:	a905      	add	r1, sp, #20
c0de7572:	08c0      	lsrs	r0, r0, #3
c0de7574:	f004 fb13 	bl	c0debb9e <nbgl_screenUpdateTicker>
c0de7578:	2000      	movs	r0, #0
c0de757a:	e001      	b.n	c0de7580 <nbgl_layoutAddSpinner+0x244>
c0de757c:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de7580:	b008      	add	sp, #32
c0de7582:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de7586:	bf00      	nop
c0de7588:	00004855 	.word	0x00004855
c0de758c:	00000025 	.word	0x00000025

c0de7590 <spinnerTickerCallback>:
c0de7590:	b570      	push	{r4, r5, r6, lr}
c0de7592:	4819      	ldr	r0, [pc, #100]	@ (c0de75f8 <spinnerTickerCallback+0x68>)
c0de7594:	4448      	add	r0, r9
c0de7596:	6840      	ldr	r0, [r0, #4]
c0de7598:	b120      	cbz	r0, c0de75a4 <spinnerTickerCallback+0x14>
c0de759a:	f890 10ae 	ldrb.w	r1, [r0, #174]	@ 0xae
c0de759e:	0209      	lsls	r1, r1, #8
c0de75a0:	0449      	lsls	r1, r1, #17
c0de75a2:	d400      	bmi.n	c0de75a6 <spinnerTickerCallback+0x16>
c0de75a4:	bd70      	pop	{r4, r5, r6, pc}
c0de75a6:	f8d0 10a0 	ldr.w	r1, [r0, #160]	@ 0xa0
c0de75aa:	2300      	movs	r3, #0
c0de75ac:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de75b0:	429a      	cmp	r2, r3
c0de75b2:	d0f7      	beq.n	c0de75a4 <spinnerTickerCallback+0x14>
c0de75b4:	4608      	mov	r0, r1
c0de75b6:	f000 fbdf 	bl	c0de7d78 <OUTLINED_FUNCTION_44>
c0de75ba:	f850 0023 	ldr.w	r0, [r0, r3, lsl #2]
c0de75be:	7ec4      	ldrb	r4, [r0, #27]
c0de75c0:	2c01      	cmp	r4, #1
c0de75c2:	d108      	bne.n	c0de75d6 <spinnerTickerCallback+0x46>
c0de75c4:	f890 4020 	ldrb.w	r4, [r0, #32]
c0de75c8:	b12c      	cbz	r4, c0de75d6 <spinnerTickerCallback+0x46>
c0de75ca:	f000 fbd5 	bl	c0de7d78 <OUTLINED_FUNCTION_44>
c0de75ce:	6800      	ldr	r0, [r0, #0]
c0de75d0:	7ec4      	ldrb	r4, [r0, #27]
c0de75d2:	2c0d      	cmp	r4, #13
c0de75d4:	d001      	beq.n	c0de75da <spinnerTickerCallback+0x4a>
c0de75d6:	3301      	adds	r3, #1
c0de75d8:	e7ea      	b.n	c0de75b0 <spinnerTickerCallback+0x20>
c0de75da:	7fc1      	ldrb	r1, [r0, #31]
c0de75dc:	3101      	adds	r1, #1
c0de75de:	b2ca      	uxtb	r2, r1
c0de75e0:	3a04      	subs	r2, #4
c0de75e2:	bf18      	it	ne
c0de75e4:	460a      	movne	r2, r1
c0de75e6:	77c2      	strb	r2, [r0, #31]
c0de75e8:	f004 fabb 	bl	c0debb62 <nbgl_objDraw>
c0de75ec:	2004      	movs	r0, #4
c0de75ee:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de75f2:	f004 baa7 	b.w	c0debb44 <nbgl_refreshSpecial>
c0de75f6:	bf00      	nop
c0de75f8:	000018e8 	.word	0x000018e8

c0de75fc <nbgl_layoutUpdateSpinner>:
c0de75fc:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de7600:	2800      	cmp	r0, #0
c0de7602:	f000 809a 	beq.w	c0de773a <nbgl_layoutUpdateSpinner+0x13e>
c0de7606:	f8d0 00a0 	ldr.w	r0, [r0, #160]	@ 0xa0
c0de760a:	460e      	mov	r6, r1
c0de760c:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de7610:	2900      	cmp	r1, #0
c0de7612:	f000 8092 	beq.w	c0de773a <nbgl_layoutUpdateSpinner+0x13e>
c0de7616:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de761a:	4615      	mov	r5, r2
c0de761c:	f000 fc42 	bl	c0de7ea4 <OUTLINED_FUNCTION_66>
c0de7620:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7624:	6807      	ldr	r7, [r0, #0]
c0de7626:	7ef8      	ldrb	r0, [r7, #27]
c0de7628:	2801      	cmp	r0, #1
c0de762a:	f040 8086 	bne.w	c0de773a <nbgl_layoutUpdateSpinner+0x13e>
c0de762e:	f897 0020 	ldrb.w	r0, [r7, #32]
c0de7632:	2802      	cmp	r0, #2
c0de7634:	f0c0 8081 	bcc.w	c0de773a <nbgl_layoutUpdateSpinner+0x13e>
c0de7638:	4638      	mov	r0, r7
c0de763a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de763e:	f000 fc31 	bl	c0de7ea4 <OUTLINED_FUNCTION_66>
c0de7642:	ea41 4100 	orr.w	r1, r1, r0, lsl #16
c0de7646:	6808      	ldr	r0, [r1, #0]
c0de7648:	7ec2      	ldrb	r2, [r0, #27]
c0de764a:	2a0d      	cmp	r2, #13
c0de764c:	d175      	bne.n	c0de773a <nbgl_layoutUpdateSpinner+0x13e>
c0de764e:	7fc2      	ldrb	r2, [r0, #31]
c0de7650:	429a      	cmp	r2, r3
c0de7652:	d101      	bne.n	c0de7658 <nbgl_layoutUpdateSpinner+0x5c>
c0de7654:	2400      	movs	r4, #0
c0de7656:	e008      	b.n	c0de766a <nbgl_layoutUpdateSpinner+0x6e>
c0de7658:	77c3      	strb	r3, [r0, #31]
c0de765a:	f004 fa82 	bl	c0debb62 <nbgl_objDraw>
c0de765e:	4638      	mov	r0, r7
c0de7660:	2401      	movs	r4, #1
c0de7662:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7666:	f000 fbc8 	bl	c0de7dfa <OUTLINED_FUNCTION_53>
c0de766a:	f8d1 b004 	ldr.w	fp, [r1, #4]
c0de766e:	f89b 001b 	ldrb.w	r0, [fp, #27]
c0de7672:	2804      	cmp	r0, #4
c0de7674:	d161      	bne.n	c0de773a <nbgl_layoutUpdateSpinner+0x13e>
c0de7676:	f000 fc22 	bl	c0de7ebe <OUTLINED_FUNCTION_68>
c0de767a:	4606      	mov	r6, r0
c0de767c:	f004 ff08 	bl	c0dec490 <strlen>
c0de7680:	4680      	mov	r8, r0
c0de7682:	4658      	mov	r0, fp
c0de7684:	f810 1f26 	ldrb.w	r1, [r0, #38]!
c0de7688:	f000 fa2c 	bl	c0de7ae4 <OUTLINED_FUNCTION_14>
c0de768c:	ea41 4a00 	orr.w	sl, r1, r0, lsl #16
c0de7690:	4650      	mov	r0, sl
c0de7692:	f004 fefd 	bl	c0dec490 <strlen>
c0de7696:	4580      	cmp	r8, r0
c0de7698:	d105      	bne.n	c0de76a6 <nbgl_layoutUpdateSpinner+0xaa>
c0de769a:	4650      	mov	r0, sl
c0de769c:	4631      	mov	r1, r6
c0de769e:	4642      	mov	r2, r8
c0de76a0:	f004 fe9e 	bl	c0dec3e0 <memcmp>
c0de76a4:	b168      	cbz	r0, c0de76c2 <nbgl_layoutUpdateSpinner+0xc6>
c0de76a6:	4658      	mov	r0, fp
c0de76a8:	0e31      	lsrs	r1, r6, #24
c0de76aa:	f800 6f26 	strb.w	r6, [r0, #38]!
c0de76ae:	70c1      	strb	r1, [r0, #3]
c0de76b0:	0c31      	lsrs	r1, r6, #16
c0de76b2:	7081      	strb	r1, [r0, #2]
c0de76b4:	0a30      	lsrs	r0, r6, #8
c0de76b6:	f88b 0027 	strb.w	r0, [fp, #39]	@ 0x27
c0de76ba:	4658      	mov	r0, fp
c0de76bc:	f004 fa51 	bl	c0debb62 <nbgl_objDraw>
c0de76c0:	2402      	movs	r4, #2
c0de76c2:	b3e5      	cbz	r5, c0de773e <nbgl_layoutUpdateSpinner+0x142>
c0de76c4:	f897 0020 	ldrb.w	r0, [r7, #32]
c0de76c8:	2803      	cmp	r0, #3
c0de76ca:	d136      	bne.n	c0de773a <nbgl_layoutUpdateSpinner+0x13e>
c0de76cc:	f817 0f22 	ldrb.w	r0, [r7, #34]!
c0de76d0:	7879      	ldrb	r1, [r7, #1]
c0de76d2:	78ba      	ldrb	r2, [r7, #2]
c0de76d4:	78fb      	ldrb	r3, [r7, #3]
c0de76d6:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de76da:	ea42 2103 	orr.w	r1, r2, r3, lsl #8
c0de76de:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de76e2:	6886      	ldr	r6, [r0, #8]
c0de76e4:	7ef0      	ldrb	r0, [r6, #27]
c0de76e6:	2804      	cmp	r0, #4
c0de76e8:	d127      	bne.n	c0de773a <nbgl_layoutUpdateSpinner+0x13e>
c0de76ea:	4628      	mov	r0, r5
c0de76ec:	f004 fc42 	bl	c0debf74 <pic>
c0de76f0:	4605      	mov	r5, r0
c0de76f2:	f004 fecd 	bl	c0dec490 <strlen>
c0de76f6:	4680      	mov	r8, r0
c0de76f8:	4630      	mov	r0, r6
c0de76fa:	f810 1f26 	ldrb.w	r1, [r0, #38]!
c0de76fe:	f000 f9f1 	bl	c0de7ae4 <OUTLINED_FUNCTION_14>
c0de7702:	ea41 4700 	orr.w	r7, r1, r0, lsl #16
c0de7706:	4638      	mov	r0, r7
c0de7708:	f004 fec2 	bl	c0dec490 <strlen>
c0de770c:	4580      	cmp	r8, r0
c0de770e:	d105      	bne.n	c0de771c <nbgl_layoutUpdateSpinner+0x120>
c0de7710:	4638      	mov	r0, r7
c0de7712:	4629      	mov	r1, r5
c0de7714:	4642      	mov	r2, r8
c0de7716:	f004 fe63 	bl	c0dec3e0 <memcmp>
c0de771a:	b180      	cbz	r0, c0de773e <nbgl_layoutUpdateSpinner+0x142>
c0de771c:	4630      	mov	r0, r6
c0de771e:	0e29      	lsrs	r1, r5, #24
c0de7720:	f800 5f26 	strb.w	r5, [r0, #38]!
c0de7724:	70c1      	strb	r1, [r0, #3]
c0de7726:	0c29      	lsrs	r1, r5, #16
c0de7728:	7081      	strb	r1, [r0, #2]
c0de772a:	0a28      	lsrs	r0, r5, #8
c0de772c:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de7730:	4630      	mov	r0, r6
c0de7732:	f004 fa16 	bl	c0debb62 <nbgl_objDraw>
c0de7736:	2402      	movs	r4, #2
c0de7738:	e001      	b.n	c0de773e <nbgl_layoutUpdateSpinner+0x142>
c0de773a:	f04f 34ff 	mov.w	r4, #4294967295	@ 0xffffffff
c0de773e:	4620      	mov	r0, r4
c0de7740:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de7744 <nbgl_layoutDraw>:
c0de7744:	b348      	cbz	r0, c0de779a <nbgl_layoutDraw+0x56>
c0de7746:	b570      	push	{r4, r5, r6, lr}
c0de7748:	4604      	mov	r4, r0
c0de774a:	6980      	ldr	r0, [r0, #24]
c0de774c:	b128      	cbz	r0, c0de775a <nbgl_layoutDraw+0x16>
c0de774e:	f000 fa1f 	bl	c0de7b90 <OUTLINED_FUNCTION_22>
c0de7752:	f8d4 00a0 	ldr.w	r0, [r4, #160]	@ 0xa0
c0de7756:	f000 f8ff 	bl	c0de7958 <OUTLINED_FUNCTION_1>
c0de775a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de775e:	f894 10ae 	ldrb.w	r1, [r4, #174]	@ 0xae
c0de7762:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de7766:	0781      	lsls	r1, r0, #30
c0de7768:	d513      	bpl.n	c0de7792 <nbgl_layoutDraw+0x4e>
c0de776a:	b2c0      	uxtb	r0, r0
c0de776c:	f000 fb88 	bl	c0de7e80 <OUTLINED_FUNCTION_63>
c0de7770:	2102      	movs	r1, #2
c0de7772:	2301      	movs	r3, #1
c0de7774:	2258      	movs	r2, #88	@ 0x58
c0de7776:	7182      	strb	r2, [r0, #6]
c0de7778:	71c1      	strb	r1, [r0, #7]
c0de777a:	f880 1020 	strb.w	r1, [r0, #32]
c0de777e:	2104      	movs	r1, #4
c0de7780:	7103      	strb	r3, [r0, #4]
c0de7782:	2200      	movs	r2, #0
c0de7784:	f880 3021 	strb.w	r3, [r0, #33]	@ 0x21
c0de7788:	7581      	strb	r1, [r0, #22]
c0de778a:	68a1      	ldr	r1, [r4, #8]
c0de778c:	7142      	strb	r2, [r0, #5]
c0de778e:	77c2      	strb	r2, [r0, #31]
c0de7790:	6148      	str	r0, [r1, #20]
c0de7792:	f004 f9fa 	bl	c0debb8a <nbgl_screenRedraw>
c0de7796:	2000      	movs	r0, #0
c0de7798:	bd70      	pop	{r4, r5, r6, pc}
c0de779a:	f000 ba95 	b.w	c0de7cc8 <OUTLINED_FUNCTION_35>
	...

c0de77a0 <nbgl_layoutRelease>:
c0de77a0:	b510      	push	{r4, lr}
c0de77a2:	b138      	cbz	r0, c0de77b4 <nbgl_layoutRelease+0x14>
c0de77a4:	f000 fbc4 	bl	c0de7f30 <OUTLINED_FUNCTION_79>
c0de77a8:	f894 10ae 	ldrb.w	r1, [r4, #174]	@ 0xae
c0de77ac:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de77b0:	0441      	lsls	r1, r0, #17
c0de77b2:	d402      	bmi.n	c0de77ba <nbgl_layoutRelease+0x1a>
c0de77b4:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de77b8:	bd10      	pop	{r4, pc}
c0de77ba:	07c1      	lsls	r1, r0, #31
c0de77bc:	d014      	beq.n	c0de77e8 <nbgl_layoutRelease+0x48>
c0de77be:	b2c0      	uxtb	r0, r0
c0de77c0:	08c0      	lsrs	r0, r0, #3
c0de77c2:	f004 f9e7 	bl	c0debb94 <nbgl_screenPop>
c0de77c6:	480d      	ldr	r0, [pc, #52]	@ (c0de77fc <nbgl_layoutRelease+0x5c>)
c0de77c8:	eb09 0100 	add.w	r1, r9, r0
c0de77cc:	6849      	ldr	r1, [r1, #4]
c0de77ce:	42a1      	cmp	r1, r4
c0de77d0:	d005      	beq.n	c0de77de <nbgl_layoutRelease+0x3e>
c0de77d2:	e9d4 0100 	ldrd	r0, r1, [r4]
c0de77d6:	6008      	str	r0, [r1, #0]
c0de77d8:	6820      	ldr	r0, [r4, #0]
c0de77da:	6041      	str	r1, [r0, #4]
c0de77dc:	e004      	b.n	c0de77e8 <nbgl_layoutRelease+0x48>
c0de77de:	6861      	ldr	r1, [r4, #4]
c0de77e0:	4448      	add	r0, r9
c0de77e2:	6041      	str	r1, [r0, #4]
c0de77e4:	2000      	movs	r0, #0
c0de77e6:	6008      	str	r0, [r1, #0]
c0de77e8:	f814 0fad 	ldrb.w	r0, [r4, #173]!
c0de77ec:	7861      	ldrb	r1, [r4, #1]
c0de77ee:	7020      	strb	r0, [r4, #0]
c0de77f0:	2000      	movs	r0, #0
c0de77f2:	f001 01bf 	and.w	r1, r1, #191	@ 0xbf
c0de77f6:	7061      	strb	r1, [r4, #1]
c0de77f8:	bd10      	pop	{r4, pc}
c0de77fa:	bf00      	nop
c0de77fc:	000018e8 	.word	0x000018e8

c0de7800 <getLayoutAndLayoutObj>:
c0de7800:	b570      	push	{r4, r5, r6, lr}
c0de7802:	4c11      	ldr	r4, [pc, #68]	@ (c0de7848 <getLayoutAndLayoutObj+0x48>)
c0de7804:	2300      	movs	r3, #0
c0de7806:	600b      	str	r3, [r1, #0]
c0de7808:	444c      	add	r4, r9
c0de780a:	6864      	ldr	r4, [r4, #4]
c0de780c:	b1d4      	cbz	r4, c0de7844 <getLayoutAndLayoutObj+0x44>
c0de780e:	f894 30ad 	ldrb.w	r3, [r4, #173]	@ 0xad
c0de7812:	f894 50ae 	ldrb.w	r5, [r4, #174]	@ 0xae
c0de7816:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0de781a:	045d      	lsls	r5, r3, #17
c0de781c:	d401      	bmi.n	c0de7822 <getLayoutAndLayoutObj+0x22>
c0de781e:	2300      	movs	r3, #0
c0de7820:	e010      	b.n	c0de7844 <getLayoutAndLayoutObj+0x44>
c0de7822:	f44f 75fc 	mov.w	r5, #504	@ 0x1f8
c0de7826:	ea05 1553 	and.w	r5, r5, r3, lsr #5
c0de782a:	2300      	movs	r3, #0
c0de782c:	429d      	cmp	r5, r3
c0de782e:	d0f6      	beq.n	c0de781e <getLayoutAndLayoutObj+0x1e>
c0de7830:	18e6      	adds	r6, r4, r3
c0de7832:	3308      	adds	r3, #8
c0de7834:	6a36      	ldr	r6, [r6, #32]
c0de7836:	4286      	cmp	r6, r0
c0de7838:	d1f8      	bne.n	c0de782c <getLayoutAndLayoutObj+0x2c>
c0de783a:	18e0      	adds	r0, r4, r3
c0de783c:	2301      	movs	r3, #1
c0de783e:	600c      	str	r4, [r1, #0]
c0de7840:	3018      	adds	r0, #24
c0de7842:	6010      	str	r0, [r2, #0]
c0de7844:	4618      	mov	r0, r3
c0de7846:	bd70      	pop	{r4, r5, r6, pc}
c0de7848:	000018e8 	.word	0x000018e8

c0de784c <animTickerCallback>:
c0de784c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de784e:	483f      	ldr	r0, [pc, #252]	@ (c0de794c <animTickerCallback+0x100>)
c0de7850:	4448      	add	r0, r9
c0de7852:	6842      	ldr	r2, [r0, #4]
c0de7854:	b3b2      	cbz	r2, c0de78c4 <animTickerCallback+0x78>
c0de7856:	f892 00ad 	ldrb.w	r0, [r2, #173]	@ 0xad
c0de785a:	f892 10ae 	ldrb.w	r1, [r2, #174]	@ 0xae
c0de785e:	ea40 2e01 	orr.w	lr, r0, r1, lsl #8
c0de7862:	ea5f 404e 	movs.w	r0, lr, lsl #17
c0de7866:	d52d      	bpl.n	c0de78c4 <animTickerCallback+0x78>
c0de7868:	f8d2 c0a4 	ldr.w	ip, [r2, #164]	@ 0xa4
c0de786c:	f1bc 0f00 	cmp.w	ip, #0
c0de7870:	d028      	beq.n	c0de78c4 <animTickerCallback+0x78>
c0de7872:	f8d2 40a0 	ldr.w	r4, [r2, #160]	@ 0xa0
c0de7876:	2600      	movs	r6, #0
c0de7878:	f894 5020 	ldrb.w	r5, [r4, #32]
c0de787c:	42b5      	cmp	r5, r6
c0de787e:	d021      	beq.n	c0de78c4 <animTickerCallback+0x78>
c0de7880:	4620      	mov	r0, r4
c0de7882:	f810 7f22 	ldrb.w	r7, [r0, #34]!
c0de7886:	7841      	ldrb	r1, [r0, #1]
c0de7888:	7883      	ldrb	r3, [r0, #2]
c0de788a:	78c0      	ldrb	r0, [r0, #3]
c0de788c:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de7890:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de7894:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7898:	f850 0026 	ldr.w	r0, [r0, r6, lsl #2]
c0de789c:	7ec1      	ldrb	r1, [r0, #27]
c0de789e:	2901      	cmp	r1, #1
c0de78a0:	d10e      	bne.n	c0de78c0 <animTickerCallback+0x74>
c0de78a2:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de78a6:	7843      	ldrb	r3, [r0, #1]
c0de78a8:	7887      	ldrb	r7, [r0, #2]
c0de78aa:	78c0      	ldrb	r0, [r0, #3]
c0de78ac:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de78b0:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de78b4:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de78b8:	6840      	ldr	r0, [r0, #4]
c0de78ba:	7ec1      	ldrb	r1, [r0, #27]
c0de78bc:	2902      	cmp	r1, #2
c0de78be:	d002      	beq.n	c0de78c6 <animTickerCallback+0x7a>
c0de78c0:	3601      	adds	r6, #1
c0de78c2:	e7db      	b.n	c0de787c <animTickerCallback+0x30>
c0de78c4:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de78c6:	f89c 1005 	ldrb.w	r1, [ip, #5]
c0de78ca:	b171      	cbz	r1, c0de78ea <animTickerCallback+0x9e>
c0de78cc:	f892 40af 	ldrb.w	r4, [r2, #175]	@ 0xaf
c0de78d0:	ea5f 714e 	movs.w	r1, lr, lsl #29
c0de78d4:	d504      	bpl.n	c0de78e0 <animTickerCallback+0x94>
c0de78d6:	f89c 1004 	ldrb.w	r1, [ip, #4]
c0de78da:	3901      	subs	r1, #1
c0de78dc:	42a1      	cmp	r1, r4
c0de78de:	dd0e      	ble.n	c0de78fe <animTickerCallback+0xb2>
c0de78e0:	b9ac      	cbnz	r4, c0de790e <animTickerCallback+0xc2>
c0de78e2:	f04e 0e04 	orr.w	lr, lr, #4
c0de78e6:	2400      	movs	r4, #0
c0de78e8:	e00b      	b.n	c0de7902 <animTickerCallback+0xb6>
c0de78ea:	f89c 1004 	ldrb.w	r1, [ip, #4]
c0de78ee:	f892 30af 	ldrb.w	r3, [r2, #175]	@ 0xaf
c0de78f2:	3901      	subs	r1, #1
c0de78f4:	4299      	cmp	r1, r3
c0de78f6:	bf14      	ite	ne
c0de78f8:	3301      	addne	r3, #1
c0de78fa:	2300      	moveq	r3, #0
c0de78fc:	e00c      	b.n	c0de7918 <animTickerCallback+0xcc>
c0de78fe:	f02e 0e04 	bic.w	lr, lr, #4
c0de7902:	ea4f 211e 	mov.w	r1, lr, lsr #8
c0de7906:	f882 e0ad 	strb.w	lr, [r2, #173]	@ 0xad
c0de790a:	f882 10ae 	strb.w	r1, [r2, #174]	@ 0xae
c0de790e:	ea5f 714e 	movs.w	r1, lr, lsl #29
c0de7912:	bf54      	ite	pl
c0de7914:	1e63      	subpl	r3, r4, #1
c0de7916:	1c63      	addmi	r3, r4, #1
c0de7918:	f882 30af 	strb.w	r3, [r2, #175]	@ 0xaf
c0de791c:	f8dc 2000 	ldr.w	r2, [ip]
c0de7920:	b2d9      	uxtb	r1, r3
c0de7922:	f852 1021 	ldr.w	r1, [r2, r1, lsl #2]
c0de7926:	4602      	mov	r2, r0
c0de7928:	f802 1f21 	strb.w	r1, [r2, #33]!
c0de792c:	0e0b      	lsrs	r3, r1, #24
c0de792e:	70d3      	strb	r3, [r2, #3]
c0de7930:	0c0b      	lsrs	r3, r1, #16
c0de7932:	0a09      	lsrs	r1, r1, #8
c0de7934:	7093      	strb	r3, [r2, #2]
c0de7936:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de793a:	f004 f912 	bl	c0debb62 <nbgl_objDraw>
c0de793e:	2004      	movs	r0, #4
c0de7940:	2101      	movs	r1, #1
c0de7942:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de7946:	f004 b902 	b.w	c0debb4e <nbgl_refreshSpecialWithPostRefresh>
c0de794a:	bf00      	nop
c0de794c:	000018e8 	.word	0x000018e8

c0de7950 <OUTLINED_FUNCTION_0>:
c0de7950:	08c1      	lsrs	r1, r0, #3
c0de7952:	2004      	movs	r0, #4
c0de7954:	f004 b92d 	b.w	c0debbb2 <nbgl_objPoolGet>

c0de7958 <OUTLINED_FUNCTION_1>:
c0de7958:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de795c:	3101      	adds	r1, #1
c0de795e:	f880 1020 	strb.w	r1, [r0, #32]
c0de7962:	4770      	bx	lr

c0de7964 <OUTLINED_FUNCTION_2>:
c0de7964:	2202      	movs	r2, #2
c0de7966:	75ba      	strb	r2, [r7, #22]
c0de7968:	4642      	mov	r2, r8
c0de796a:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de796e:	7854      	ldrb	r4, [r2, #1]
c0de7970:	7895      	ldrb	r5, [r2, #2]
c0de7972:	78d2      	ldrb	r2, [r2, #3]
c0de7974:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de7978:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0de797c:	7ebc      	ldrb	r4, [r7, #26]
c0de797e:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de7982:	7e7b      	ldrb	r3, [r7, #25]
c0de7984:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de7988:	2400      	movs	r4, #0
c0de798a:	4770      	bx	lr

c0de798c <OUTLINED_FUNCTION_3>:
c0de798c:	713a      	strb	r2, [r7, #4]
c0de798e:	0e0a      	lsrs	r2, r1, #24
c0de7990:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de7994:	2005      	movs	r0, #5
c0de7996:	f887 0020 	strb.w	r0, [r7, #32]
c0de799a:	4638      	mov	r0, r7
c0de799c:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de79a0:	70c2      	strb	r2, [r0, #3]
c0de79a2:	0c0a      	lsrs	r2, r1, #16
c0de79a4:	7082      	strb	r2, [r0, #2]
c0de79a6:	0a08      	lsrs	r0, r1, #8
c0de79a8:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de79ac:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de79b0:	4770      	bx	lr

c0de79b2 <OUTLINED_FUNCTION_4>:
c0de79b2:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de79b6:	784e      	ldrb	r6, [r1, #1]
c0de79b8:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de79bc:	788f      	ldrb	r7, [r1, #2]
c0de79be:	78c9      	ldrb	r1, [r1, #3]
c0de79c0:	ea42 2206 	orr.w	r2, r2, r6, lsl #8
c0de79c4:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de79c8:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de79cc:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
c0de79d0:	4770      	bx	lr

c0de79d2 <OUTLINED_FUNCTION_5>:
c0de79d2:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de79d6:	70c2      	strb	r2, [r0, #3]
c0de79d8:	0c0a      	lsrs	r2, r1, #16
c0de79da:	7082      	strb	r2, [r0, #2]
c0de79dc:	0a08      	lsrs	r0, r1, #8
c0de79de:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de79e2:	f885 0027 	strb.w	r0, [r5, #39]	@ 0x27
c0de79e6:	200b      	movs	r0, #11
c0de79e8:	f004 b8fc 	b.w	c0debbe4 <nbgl_getTextHeightInWidth>

c0de79ec <OUTLINED_FUNCTION_6>:
c0de79ec:	4620      	mov	r0, r4
c0de79ee:	4631      	mov	r1, r6
c0de79f0:	f7fc bc8c 	b.w	c0de430c <layoutAddCallbackObj>

c0de79f4 <OUTLINED_FUNCTION_7>:
c0de79f4:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de79f8:	70ca      	strb	r2, [r1, #3]
c0de79fa:	0c02      	lsrs	r2, r0, #16
c0de79fc:	0a00      	lsrs	r0, r0, #8
c0de79fe:	708a      	strb	r2, [r1, #2]
c0de7a00:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de7a04:	68e0      	ldr	r0, [r4, #12]
c0de7a06:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7a0a:	7843      	ldrb	r3, [r0, #1]
c0de7a0c:	f810 cc02 	ldrb.w	ip, [r0, #-2]
c0de7a10:	7882      	ldrb	r2, [r0, #2]
c0de7a12:	78c0      	ldrb	r0, [r0, #3]
c0de7a14:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de7a18:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de7a1c:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7a20:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de7a24:	200c      	movs	r0, #12
c0de7a26:	4770      	bx	lr

c0de7a28 <OUTLINED_FUNCTION_8>:
c0de7a28:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de7a2c:	784c      	ldrb	r4, [r1, #1]
c0de7a2e:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de7a32:	788d      	ldrb	r5, [r1, #2]
c0de7a34:	78c9      	ldrb	r1, [r1, #3]
c0de7a36:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de7a3a:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de7a3e:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de7a42:	4770      	bx	lr

c0de7a44 <OUTLINED_FUNCTION_9>:
c0de7a44:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de7a48:	70ca      	strb	r2, [r1, #3]
c0de7a4a:	0c02      	lsrs	r2, r0, #16
c0de7a4c:	0a00      	lsrs	r0, r0, #8
c0de7a4e:	708a      	strb	r2, [r1, #2]
c0de7a50:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de7a54:	68e0      	ldr	r0, [r4, #12]
c0de7a56:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7a5a:	7843      	ldrb	r3, [r0, #1]
c0de7a5c:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de7a60:	7887      	ldrb	r7, [r0, #2]
c0de7a62:	78c0      	ldrb	r0, [r0, #3]
c0de7a64:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de7a68:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de7a6c:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7a70:	f840 6022 	str.w	r6, [r0, r2, lsl #2]
c0de7a74:	4770      	bx	lr

c0de7a76 <OUTLINED_FUNCTION_10>:
c0de7a76:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7a7a:	7843      	ldrb	r3, [r0, #1]
c0de7a7c:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de7a80:	7884      	ldrb	r4, [r0, #2]
c0de7a82:	78c0      	ldrb	r0, [r0, #3]
c0de7a84:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de7a88:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de7a8c:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7a90:	4770      	bx	lr

c0de7a92 <OUTLINED_FUNCTION_11>:
c0de7a92:	784b      	ldrb	r3, [r1, #1]
c0de7a94:	788e      	ldrb	r6, [r1, #2]
c0de7a96:	78c9      	ldrb	r1, [r1, #3]
c0de7a98:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de7a9c:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de7aa0:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de7aa4:	4770      	bx	lr

c0de7aa6 <OUTLINED_FUNCTION_12>:
c0de7aa6:	70ca      	strb	r2, [r1, #3]
c0de7aa8:	0c02      	lsrs	r2, r0, #16
c0de7aaa:	0a00      	lsrs	r0, r0, #8
c0de7aac:	708a      	strb	r2, [r1, #2]
c0de7aae:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de7ab2:	6920      	ldr	r0, [r4, #16]
c0de7ab4:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7ab8:	7843      	ldrb	r3, [r0, #1]
c0de7aba:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de7abe:	7887      	ldrb	r7, [r0, #2]
c0de7ac0:	78c0      	ldrb	r0, [r0, #3]
c0de7ac2:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de7ac6:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de7aca:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7ace:	f840 6022 	str.w	r6, [r0, r2, lsl #2]
c0de7ad2:	200c      	movs	r0, #12
c0de7ad4:	4770      	bx	lr

c0de7ad6 <OUTLINED_FUNCTION_13>:
c0de7ad6:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de7ada:	70c2      	strb	r2, [r0, #3]
c0de7adc:	0c0a      	lsrs	r2, r1, #16
c0de7ade:	7082      	strb	r2, [r0, #2]
c0de7ae0:	0a08      	lsrs	r0, r1, #8
c0de7ae2:	4770      	bx	lr

c0de7ae4 <OUTLINED_FUNCTION_14>:
c0de7ae4:	7842      	ldrb	r2, [r0, #1]
c0de7ae6:	7883      	ldrb	r3, [r0, #2]
c0de7ae8:	78c0      	ldrb	r0, [r0, #3]
c0de7aea:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7aee:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de7af2:	4770      	bx	lr

c0de7af4 <OUTLINED_FUNCTION_15>:
c0de7af4:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de7af8:	70ca      	strb	r2, [r1, #3]
c0de7afa:	0c02      	lsrs	r2, r0, #16
c0de7afc:	0a00      	lsrs	r0, r0, #8
c0de7afe:	708a      	strb	r2, [r1, #2]
c0de7b00:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de7b04:	6920      	ldr	r0, [r4, #16]
c0de7b06:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7b0a:	7843      	ldrb	r3, [r0, #1]
c0de7b0c:	f810 cc02 	ldrb.w	ip, [r0, #-2]
c0de7b10:	7882      	ldrb	r2, [r0, #2]
c0de7b12:	78c0      	ldrb	r0, [r0, #3]
c0de7b14:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de7b18:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de7b1c:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7b20:	4770      	bx	lr

c0de7b22 <OUTLINED_FUNCTION_16>:
c0de7b22:	08c1      	lsrs	r1, r0, #3
c0de7b24:	2001      	movs	r0, #1
c0de7b26:	f004 b844 	b.w	c0debbb2 <nbgl_objPoolGet>

c0de7b2a <OUTLINED_FUNCTION_17>:
c0de7b2a:	08c1      	lsrs	r1, r0, #3
c0de7b2c:	2005      	movs	r0, #5
c0de7b2e:	f004 b840 	b.w	c0debbb2 <nbgl_objPoolGet>

c0de7b32 <OUTLINED_FUNCTION_18>:
c0de7b32:	6920      	ldr	r0, [r4, #16]
c0de7b34:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7b38:	7843      	ldrb	r3, [r0, #1]
c0de7b3a:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de7b3e:	7887      	ldrb	r7, [r0, #2]
c0de7b40:	78c0      	ldrb	r0, [r0, #3]
c0de7b42:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de7b46:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de7b4a:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7b4e:	f840 6022 	str.w	r6, [r0, r2, lsl #2]
c0de7b52:	200c      	movs	r0, #12
c0de7b54:	f886 801c 	strb.w	r8, [r6, #28]
c0de7b58:	4770      	bx	lr

c0de7b5a <OUTLINED_FUNCTION_19>:
c0de7b5a:	0a39      	lsrs	r1, r7, #8
c0de7b5c:	0e02      	lsrs	r2, r0, #24
c0de7b5e:	74e9      	strb	r1, [r5, #19]
c0de7b60:	4629      	mov	r1, r5
c0de7b62:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de7b66:	70ca      	strb	r2, [r1, #3]
c0de7b68:	0c02      	lsrs	r2, r0, #16
c0de7b6a:	0a00      	lsrs	r0, r0, #8
c0de7b6c:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de7b70:	4628      	mov	r0, r5
c0de7b72:	708a      	strb	r2, [r1, #2]
c0de7b74:	0e3a      	lsrs	r2, r7, #24
c0de7b76:	f800 7f12 	strb.w	r7, [r0, #18]!
c0de7b7a:	70c2      	strb	r2, [r0, #3]
c0de7b7c:	0c3a      	lsrs	r2, r7, #16
c0de7b7e:	7082      	strb	r2, [r0, #2]
c0de7b80:	4770      	bx	lr

c0de7b82 <OUTLINED_FUNCTION_20>:
c0de7b82:	4631      	mov	r1, r6
c0de7b84:	f7fc bbc2 	b.w	c0de430c <layoutAddCallbackObj>

c0de7b88 <OUTLINED_FUNCTION_21>:
c0de7b88:	08c1      	lsrs	r1, r0, #3
c0de7b8a:	2002      	movs	r0, #2
c0de7b8c:	f004 b811 	b.w	c0debbb2 <nbgl_objPoolGet>

c0de7b90 <OUTLINED_FUNCTION_22>:
c0de7b90:	f8d4 10a0 	ldr.w	r1, [r4, #160]	@ 0xa0
c0de7b94:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de7b98:	784d      	ldrb	r5, [r1, #1]
c0de7b9a:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de7b9e:	788e      	ldrb	r6, [r1, #2]
c0de7ba0:	78c9      	ldrb	r1, [r1, #3]
c0de7ba2:	ea42 2205 	orr.w	r2, r2, r5, lsl #8
c0de7ba6:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de7baa:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de7bae:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
c0de7bb2:	4770      	bx	lr

c0de7bb4 <OUTLINED_FUNCTION_23>:
c0de7bb4:	6868      	ldr	r0, [r5, #4]
c0de7bb6:	f004 b9dd 	b.w	c0debf74 <pic>

c0de7bba <OUTLINED_FUNCTION_24>:
c0de7bba:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de7bbe:	784c      	ldrb	r4, [r1, #1]
c0de7bc0:	f811 cc02 	ldrb.w	ip, [r1, #-2]
c0de7bc4:	788b      	ldrb	r3, [r1, #2]
c0de7bc6:	78c9      	ldrb	r1, [r1, #3]
c0de7bc8:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de7bcc:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de7bd0:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de7bd4:	f841 702c 	str.w	r7, [r1, ip, lsl #2]
c0de7bd8:	4770      	bx	lr

c0de7bda <OUTLINED_FUNCTION_25>:
c0de7bda:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7bde:	08c0      	lsrs	r0, r0, #3
c0de7be0:	f7fe baa8 	b.w	c0de6134 <createHorizontalLine>

c0de7be4 <OUTLINED_FUNCTION_26>:
c0de7be4:	75aa      	strb	r2, [r5, #22]
c0de7be6:	1c5a      	adds	r2, r3, #1
c0de7be8:	788b      	ldrb	r3, [r1, #2]
c0de7bea:	f800 2c02 	strb.w	r2, [r0, #-2]
c0de7bee:	780a      	ldrb	r2, [r1, #0]
c0de7bf0:	f895 0022 	ldrb.w	r0, [r5, #34]	@ 0x22
c0de7bf4:	78c9      	ldrb	r1, [r1, #3]
c0de7bf6:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de7bfa:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de7bfe:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de7c02:	4770      	bx	lr

c0de7c04 <OUTLINED_FUNCTION_27>:
c0de7c04:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7c08:	7843      	ldrb	r3, [r0, #1]
c0de7c0a:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de7c0e:	7884      	ldrb	r4, [r0, #2]
c0de7c10:	78c0      	ldrb	r0, [r0, #3]
c0de7c12:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de7c16:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de7c1a:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7c1e:	f840 a022 	str.w	sl, [r0, r2, lsl #2]
c0de7c22:	4770      	bx	lr

c0de7c24 <OUTLINED_FUNCTION_28>:
c0de7c24:	f801 0f25 	strb.w	r0, [r1, #37]!
c0de7c28:	70ca      	strb	r2, [r1, #3]
c0de7c2a:	0c02      	lsrs	r2, r0, #16
c0de7c2c:	0a00      	lsrs	r0, r0, #8
c0de7c2e:	708a      	strb	r2, [r1, #2]
c0de7c30:	f886 0026 	strb.w	r0, [r6, #38]	@ 0x26
c0de7c34:	4770      	bx	lr

c0de7c36 <OUTLINED_FUNCTION_29>:
c0de7c36:	4450      	add	r0, sl
c0de7c38:	3101      	adds	r1, #1
c0de7c3a:	f842 7024 	str.w	r7, [r2, r4, lsl #2]
c0de7c3e:	eb00 0a03 	add.w	sl, r0, r3
c0de7c42:	f888 1020 	strb.w	r1, [r8, #32]
c0de7c46:	4770      	bx	lr

c0de7c48 <OUTLINED_FUNCTION_30>:
c0de7c48:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de7c4c:	4630      	mov	r0, r6
c0de7c4e:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de7c52:	70c2      	strb	r2, [r0, #3]
c0de7c54:	0c0a      	lsrs	r2, r1, #16
c0de7c56:	7082      	strb	r2, [r0, #2]
c0de7c58:	0a08      	lsrs	r0, r1, #8
c0de7c5a:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de7c5e:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de7c62:	200b      	movs	r0, #11
c0de7c64:	4770      	bx	lr

c0de7c66 <OUTLINED_FUNCTION_31>:
c0de7c66:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de7c6a:	70ca      	strb	r2, [r1, #3]
c0de7c6c:	0c02      	lsrs	r2, r0, #16
c0de7c6e:	0a00      	lsrs	r0, r0, #8
c0de7c70:	708a      	strb	r2, [r1, #2]
c0de7c72:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de7c76:	4770      	bx	lr

c0de7c78 <OUTLINED_FUNCTION_32>:
c0de7c78:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de7c7c:	784e      	ldrb	r6, [r1, #1]
c0de7c7e:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de7c82:	788f      	ldrb	r7, [r1, #2]
c0de7c84:	78c9      	ldrb	r1, [r1, #3]
c0de7c86:	ea42 2206 	orr.w	r2, r2, r6, lsl #8
c0de7c8a:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de7c8e:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de7c92:	4770      	bx	lr

c0de7c94 <OUTLINED_FUNCTION_33>:
c0de7c94:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de7c98:	784c      	ldrb	r4, [r1, #1]
c0de7c9a:	788e      	ldrb	r6, [r1, #2]
c0de7c9c:	78cd      	ldrb	r5, [r1, #3]
c0de7c9e:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de7ca2:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de7ca6:	ea46 2405 	orr.w	r4, r6, r5, lsl #8
c0de7caa:	ea42 4204 	orr.w	r2, r2, r4, lsl #16
c0de7cae:	4770      	bx	lr

c0de7cb0 <OUTLINED_FUNCTION_34>:
c0de7cb0:	f8da 00a0 	ldr.w	r0, [sl, #160]	@ 0xa0
c0de7cb4:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de7cb8:	3101      	adds	r1, #1
c0de7cba:	f880 1020 	strb.w	r1, [r0, #32]
c0de7cbe:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de7cc2:	08c1      	lsrs	r1, r0, #3
c0de7cc4:	2004      	movs	r0, #4
c0de7cc6:	4730      	bx	r6

c0de7cc8 <OUTLINED_FUNCTION_35>:
c0de7cc8:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de7ccc:	4770      	bx	lr

c0de7cce <OUTLINED_FUNCTION_36>:
c0de7cce:	77b0      	strb	r0, [r6, #30]
c0de7cd0:	6960      	ldr	r0, [r4, #20]
c0de7cd2:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7cd6:	7842      	ldrb	r2, [r0, #1]
c0de7cd8:	7883      	ldrb	r3, [r0, #2]
c0de7cda:	78c0      	ldrb	r0, [r0, #3]
c0de7cdc:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7ce0:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de7ce4:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7ce8:	4770      	bx	lr

c0de7cea <OUTLINED_FUNCTION_37>:
c0de7cea:	4642      	mov	r2, r8
c0de7cec:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de7cf0:	7854      	ldrb	r4, [r2, #1]
c0de7cf2:	7895      	ldrb	r5, [r2, #2]
c0de7cf4:	78d2      	ldrb	r2, [r2, #3]
c0de7cf6:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0de7cfa:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de7cfe:	463d      	mov	r5, r7
c0de7d00:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de7d04:	4770      	bx	lr

c0de7d06 <OUTLINED_FUNCTION_38>:
c0de7d06:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7d0a:	7843      	ldrb	r3, [r0, #1]
c0de7d0c:	7885      	ldrb	r5, [r0, #2]
c0de7d0e:	78c6      	ldrb	r6, [r0, #3]
c0de7d10:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de7d14:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de7d18:	ea45 2306 	orr.w	r3, r5, r6, lsl #8
c0de7d1c:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
c0de7d20:	4770      	bx	lr

c0de7d22 <OUTLINED_FUNCTION_39>:
c0de7d22:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de7d26:	f896 0022 	ldrb.w	r0, [r6, #34]	@ 0x22
c0de7d2a:	f040 0001 	orr.w	r0, r0, #1
c0de7d2e:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de7d32:	4630      	mov	r0, r6
c0de7d34:	f003 bf15 	b.w	c0debb62 <nbgl_objDraw>

c0de7d38 <OUTLINED_FUNCTION_40>:
c0de7d38:	4620      	mov	r0, r4
c0de7d3a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7d3e:	7842      	ldrb	r2, [r0, #1]
c0de7d40:	7883      	ldrb	r3, [r0, #2]
c0de7d42:	78c0      	ldrb	r0, [r0, #3]
c0de7d44:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7d48:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de7d4c:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7d50:	4770      	bx	lr

c0de7d52 <OUTLINED_FUNCTION_41>:
c0de7d52:	0e02      	lsrs	r2, r0, #24
c0de7d54:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de7d58:	70ca      	strb	r2, [r1, #3]
c0de7d5a:	0c02      	lsrs	r2, r0, #16
c0de7d5c:	0a00      	lsrs	r0, r0, #8
c0de7d5e:	708a      	strb	r2, [r1, #2]
c0de7d60:	4770      	bx	lr

c0de7d62 <OUTLINED_FUNCTION_42>:
c0de7d62:	4601      	mov	r1, r0
c0de7d64:	2001      	movs	r0, #1
c0de7d66:	22a0      	movs	r2, #160	@ 0xa0
c0de7d68:	2301      	movs	r3, #1
c0de7d6a:	7178      	strb	r0, [r7, #5]
c0de7d6c:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de7d70:	4770      	bx	lr

c0de7d72 <OUTLINED_FUNCTION_43>:
c0de7d72:	200b      	movs	r0, #11
c0de7d74:	f003 bf36 	b.w	c0debbe4 <nbgl_getTextHeightInWidth>

c0de7d78 <OUTLINED_FUNCTION_44>:
c0de7d78:	f810 4f22 	ldrb.w	r4, [r0, #34]!
c0de7d7c:	7845      	ldrb	r5, [r0, #1]
c0de7d7e:	7886      	ldrb	r6, [r0, #2]
c0de7d80:	78c0      	ldrb	r0, [r0, #3]
c0de7d82:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de7d86:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de7d8a:	ea44 4000 	orr.w	r0, r4, r0, lsl #16
c0de7d8e:	4770      	bx	lr

c0de7d90 <OUTLINED_FUNCTION_45>:
c0de7d90:	70c2      	strb	r2, [r0, #3]
c0de7d92:	0c0a      	lsrs	r2, r1, #16
c0de7d94:	7082      	strb	r2, [r0, #2]
c0de7d96:	0a08      	lsrs	r0, r1, #8
c0de7d98:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de7d9c:	4770      	bx	lr

c0de7d9e <OUTLINED_FUNCTION_46>:
c0de7d9e:	0a01      	lsrs	r1, r0, #8
c0de7da0:	71b8      	strb	r0, [r7, #6]
c0de7da2:	71f9      	strb	r1, [r7, #7]
c0de7da4:	f898 1020 	ldrb.w	r1, [r8, #32]
c0de7da8:	2900      	cmp	r1, #0
c0de7daa:	4770      	bx	lr

c0de7dac <OUTLINED_FUNCTION_47>:
c0de7dac:	70ca      	strb	r2, [r1, #3]
c0de7dae:	0c02      	lsrs	r2, r0, #16
c0de7db0:	0a00      	lsrs	r0, r0, #8
c0de7db2:	708a      	strb	r2, [r1, #2]
c0de7db4:	4770      	bx	lr

c0de7db6 <OUTLINED_FUNCTION_48>:
c0de7db6:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de7dba:	ea42 2103 	orr.w	r1, r2, r3, lsl #8
c0de7dbe:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de7dc2:	4770      	bx	lr

c0de7dc4 <OUTLINED_FUNCTION_49>:
c0de7dc4:	68a8      	ldr	r0, [r5, #8]
c0de7dc6:	f004 b8d5 	b.w	c0debf74 <pic>

c0de7dca <OUTLINED_FUNCTION_50>:
c0de7dca:	4630      	mov	r0, r6
c0de7dcc:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de7dd0:	70c2      	strb	r2, [r0, #3]
c0de7dd2:	0c0a      	lsrs	r2, r1, #16
c0de7dd4:	7082      	strb	r2, [r0, #2]
c0de7dd6:	0a08      	lsrs	r0, r1, #8
c0de7dd8:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de7ddc:	4770      	bx	lr

c0de7dde <OUTLINED_FUNCTION_51>:
c0de7dde:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de7de2:	f003 beff 	b.w	c0debbe4 <nbgl_getTextHeightInWidth>

c0de7de6 <OUTLINED_FUNCTION_52>:
c0de7de6:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de7dea:	0e0a      	lsrs	r2, r1, #24
c0de7dec:	70c2      	strb	r2, [r0, #3]
c0de7dee:	0c0a      	lsrs	r2, r1, #16
c0de7df0:	7082      	strb	r2, [r0, #2]
c0de7df2:	0a08      	lsrs	r0, r1, #8
c0de7df4:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de7df8:	4770      	bx	lr

c0de7dfa <OUTLINED_FUNCTION_53>:
c0de7dfa:	7842      	ldrb	r2, [r0, #1]
c0de7dfc:	7883      	ldrb	r3, [r0, #2]
c0de7dfe:	78c0      	ldrb	r0, [r0, #3]
c0de7e00:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7e04:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de7e08:	ea41 4100 	orr.w	r1, r1, r0, lsl #16
c0de7e0c:	4770      	bx	lr

c0de7e0e <OUTLINED_FUNCTION_54>:
c0de7e0e:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de7e12:	3201      	adds	r2, #1
c0de7e14:	f881 2020 	strb.w	r2, [r1, #32]
c0de7e18:	b004      	add	sp, #16
c0de7e1a:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de7e1e <OUTLINED_FUNCTION_55>:
c0de7e1e:	7981      	ldrb	r1, [r0, #6]
c0de7e20:	79c0      	ldrb	r0, [r0, #7]
c0de7e22:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de7e26:	4770      	bx	lr

c0de7e28 <OUTLINED_FUNCTION_56>:
c0de7e28:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de7e2c:	70ca      	strb	r2, [r1, #3]
c0de7e2e:	0c02      	lsrs	r2, r0, #16
c0de7e30:	0a00      	lsrs	r0, r0, #8
c0de7e32:	708a      	strb	r2, [r1, #2]
c0de7e34:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de7e38:	4770      	bx	lr

c0de7e3a <OUTLINED_FUNCTION_57>:
c0de7e3a:	f8d4 00a0 	ldr.w	r0, [r4, #160]	@ 0xa0
c0de7e3e:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de7e42:	3101      	adds	r1, #1
c0de7e44:	f880 1020 	strb.w	r1, [r0, #32]
c0de7e48:	2000      	movs	r0, #0
c0de7e4a:	4770      	bx	lr

c0de7e4c <OUTLINED_FUNCTION_58>:
c0de7e4c:	4631      	mov	r1, r6
c0de7e4e:	0e02      	lsrs	r2, r0, #24
c0de7e50:	f886 a01d 	strb.w	sl, [r6, #29]
c0de7e54:	4770      	bx	lr

c0de7e56 <OUTLINED_FUNCTION_59>:
c0de7e56:	f886 b01c 	strb.w	fp, [r6, #28]
c0de7e5a:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de7e5e:	2005      	movs	r0, #5
c0de7e60:	4770      	bx	lr

c0de7e62 <OUTLINED_FUNCTION_60>:
c0de7e62:	70f1      	strb	r1, [r6, #3]
c0de7e64:	0c01      	lsrs	r1, r0, #16
c0de7e66:	0a00      	lsrs	r0, r0, #8
c0de7e68:	70b1      	strb	r1, [r6, #2]
c0de7e6a:	4770      	bx	lr

c0de7e6c <OUTLINED_FUNCTION_61>:
c0de7e6c:	f891 0020 	ldrb.w	r0, [r1, #32]
c0de7e70:	3001      	adds	r0, #1
c0de7e72:	f881 0020 	strb.w	r0, [r1, #32]
c0de7e76:	4770      	bx	lr

c0de7e78 <OUTLINED_FUNCTION_62>:
c0de7e78:	08c1      	lsrs	r1, r0, #3
c0de7e7a:	2004      	movs	r0, #4
c0de7e7c:	f003 be9e 	b.w	c0debbbc <nbgl_containerPoolGet>

c0de7e80 <OUTLINED_FUNCTION_63>:
c0de7e80:	08c1      	lsrs	r1, r0, #3
c0de7e82:	2003      	movs	r0, #3
c0de7e84:	f003 be95 	b.w	c0debbb2 <nbgl_objPoolGet>

c0de7e88 <OUTLINED_FUNCTION_64>:
c0de7e88:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7e8c:	08c1      	lsrs	r1, r0, #3
c0de7e8e:	2005      	movs	r0, #5
c0de7e90:	f003 be94 	b.w	c0debbbc <nbgl_containerPoolGet>

c0de7e94 <OUTLINED_FUNCTION_65>:
c0de7e94:	71d1      	strb	r1, [r2, #7]
c0de7e96:	7190      	strb	r0, [r2, #6]
c0de7e98:	f892 0020 	ldrb.w	r0, [r2, #32]
c0de7e9c:	3001      	adds	r0, #1
c0de7e9e:	f882 0020 	strb.w	r0, [r2, #32]
c0de7ea2:	4770      	bx	lr

c0de7ea4 <OUTLINED_FUNCTION_66>:
c0de7ea4:	7842      	ldrb	r2, [r0, #1]
c0de7ea6:	7884      	ldrb	r4, [r0, #2]
c0de7ea8:	78c0      	ldrb	r0, [r0, #3]
c0de7eaa:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7eae:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de7eb2:	4770      	bx	lr

c0de7eb4 <OUTLINED_FUNCTION_67>:
c0de7eb4:	7a2a      	ldrb	r2, [r5, #8]
c0de7eb6:	7a6b      	ldrb	r3, [r5, #9]
c0de7eb8:	4620      	mov	r0, r4
c0de7eba:	f7fc ba27 	b.w	c0de430c <layoutAddCallbackObj>

c0de7ebe <OUTLINED_FUNCTION_68>:
c0de7ebe:	4630      	mov	r0, r6
c0de7ec0:	f004 b858 	b.w	c0debf74 <pic>

c0de7ec4 <OUTLINED_FUNCTION_69>:
c0de7ec4:	f801 7f12 	strb.w	r7, [r1, #18]!
c0de7ec8:	70ca      	strb	r2, [r1, #3]
c0de7eca:	0c3a      	lsrs	r2, r7, #16
c0de7ecc:	708a      	strb	r2, [r1, #2]
c0de7ece:	4770      	bx	lr

c0de7ed0 <OUTLINED_FUNCTION_70>:
c0de7ed0:	758a      	strb	r2, [r1, #22]
c0de7ed2:	460a      	mov	r2, r1
c0de7ed4:	f802 0f22 	strb.w	r0, [r2, #34]!
c0de7ed8:	0c00      	lsrs	r0, r0, #16
c0de7eda:	7090      	strb	r0, [r2, #2]
c0de7edc:	4770      	bx	lr

c0de7ede <OUTLINED_FUNCTION_71>:
c0de7ede:	f8bb 3020 	ldrh.w	r3, [fp, #32]
c0de7ee2:	3318      	adds	r3, #24
c0de7ee4:	0a1c      	lsrs	r4, r3, #8
c0de7ee6:	767b      	strb	r3, [r7, #25]
c0de7ee8:	76bc      	strb	r4, [r7, #26]
c0de7eea:	4770      	bx	lr

c0de7eec <OUTLINED_FUNCTION_72>:
c0de7eec:	f842 5023 	str.w	r5, [r2, r3, lsl #2]
c0de7ef0:	2200      	movs	r2, #0
c0de7ef2:	762a      	strb	r2, [r5, #24]
c0de7ef4:	2210      	movs	r2, #16
c0de7ef6:	75ea      	strb	r2, [r5, #23]
c0de7ef8:	4770      	bx	lr

c0de7efa <OUTLINED_FUNCTION_73>:
c0de7efa:	f88d 0010 	strb.w	r0, [sp, #16]
c0de7efe:	8928      	ldrh	r0, [r5, #8]
c0de7f00:	f8ad 000c 	strh.w	r0, [sp, #12]
c0de7f04:	4640      	mov	r0, r8
c0de7f06:	4770      	bx	lr

c0de7f08 <OUTLINED_FUNCTION_74>:
c0de7f08:	08c9      	lsrs	r1, r1, #3
c0de7f0a:	f003 be57 	b.w	c0debbbc <nbgl_containerPoolGet>

c0de7f0e <OUTLINED_FUNCTION_75>:
c0de7f0e:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de7f12:	7893      	ldrb	r3, [r2, #2]
c0de7f14:	78d2      	ldrb	r2, [r2, #3]
c0de7f16:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de7f1a:	4770      	bx	lr

c0de7f1c <OUTLINED_FUNCTION_76>:
c0de7f1c:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de7f20:	ea43 2206 	orr.w	r2, r3, r6, lsl #8
c0de7f24:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de7f28:	4770      	bx	lr

c0de7f2a <OUTLINED_FUNCTION_78>:
c0de7f2a:	200d      	movs	r0, #13
c0de7f2c:	f003 be5a 	b.w	c0debbe4 <nbgl_getTextHeightInWidth>

c0de7f30 <OUTLINED_FUNCTION_79>:
c0de7f30:	4604      	mov	r4, r0
c0de7f32:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de7f36:	4770      	bx	lr

c0de7f38 <OUTLINED_FUNCTION_80>:
c0de7f38:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de7f3c:	08c1      	lsrs	r1, r0, #3
c0de7f3e:	2004      	movs	r0, #4
c0de7f40:	4720      	bx	r4

c0de7f42 <OUTLINED_FUNCTION_81>:
c0de7f42:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
c0de7f46:	7802      	ldrb	r2, [r0, #0]
c0de7f48:	7840      	ldrb	r0, [r0, #1]
c0de7f4a:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de7f4e:	4770      	bx	lr

c0de7f50 <layoutNavigationCallback>:
c0de7f50:	b570      	push	{r4, r5, r6, lr}
c0de7f52:	290a      	cmp	r1, #10
c0de7f54:	d029      	beq.n	c0de7faa <layoutNavigationCallback+0x5a>
c0de7f56:	2909      	cmp	r1, #9
c0de7f58:	d02b      	beq.n	c0de7fb2 <layoutNavigationCallback+0x62>
c0de7f5a:	2900      	cmp	r1, #0
c0de7f5c:	d14a      	bne.n	c0de7ff4 <layoutNavigationCallback+0xa4>
c0de7f5e:	4604      	mov	r4, r0
c0de7f60:	7bc1      	ldrb	r1, [r0, #15]
c0de7f62:	f814 5f0e 	ldrb.w	r5, [r4, #14]!
c0de7f66:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de7f6a:	78a5      	ldrb	r5, [r4, #2]
c0de7f6c:	78e4      	ldrb	r4, [r4, #3]
c0de7f6e:	ea45 2404 	orr.w	r4, r5, r4, lsl #8
c0de7f72:	ea41 4104 	orr.w	r1, r1, r4, lsl #16
c0de7f76:	460d      	mov	r5, r1
c0de7f78:	f891 4023 	ldrb.w	r4, [r1, #35]	@ 0x23
c0de7f7c:	f815 6f22 	ldrb.w	r6, [r5, #34]!
c0de7f80:	ea46 2404 	orr.w	r4, r6, r4, lsl #8
c0de7f84:	78ae      	ldrb	r6, [r5, #2]
c0de7f86:	78ed      	ldrb	r5, [r5, #3]
c0de7f88:	ea46 2505 	orr.w	r5, r6, r5, lsl #8
c0de7f8c:	ea44 4405 	orr.w	r4, r4, r5, lsl #16
c0de7f90:	6825      	ldr	r5, [r4, #0]
c0de7f92:	4285      	cmp	r5, r0
c0de7f94:	d01e      	beq.n	c0de7fd4 <layoutNavigationCallback+0x84>
c0de7f96:	6865      	ldr	r5, [r4, #4]
c0de7f98:	4285      	cmp	r5, r0
c0de7f9a:	d01e      	beq.n	c0de7fda <layoutNavigationCallback+0x8a>
c0de7f9c:	68a4      	ldr	r4, [r4, #8]
c0de7f9e:	4284      	cmp	r4, r0
c0de7fa0:	d128      	bne.n	c0de7ff4 <layoutNavigationCallback+0xa4>
c0de7fa2:	2a01      	cmp	r2, #1
c0de7fa4:	d81d      	bhi.n	c0de7fe2 <layoutNavigationCallback+0x92>
c0de7fa6:	7818      	ldrb	r0, [r3, #0]
c0de7fa8:	e01f      	b.n	c0de7fea <layoutNavigationCallback+0x9a>
c0de7faa:	2a01      	cmp	r2, #1
c0de7fac:	d805      	bhi.n	c0de7fba <layoutNavigationCallback+0x6a>
c0de7fae:	7819      	ldrb	r1, [r3, #0]
c0de7fb0:	e007      	b.n	c0de7fc2 <layoutNavigationCallback+0x72>
c0de7fb2:	7819      	ldrb	r1, [r3, #0]
c0de7fb4:	b1f1      	cbz	r1, c0de7ff4 <layoutNavigationCallback+0xa4>
c0de7fb6:	3901      	subs	r1, #1
c0de7fb8:	e004      	b.n	c0de7fc4 <layoutNavigationCallback+0x74>
c0de7fba:	7819      	ldrb	r1, [r3, #0]
c0de7fbc:	1e54      	subs	r4, r2, #1
c0de7fbe:	428c      	cmp	r4, r1
c0de7fc0:	d918      	bls.n	c0de7ff4 <layoutNavigationCallback+0xa4>
c0de7fc2:	3101      	adds	r1, #1
c0de7fc4:	7019      	strb	r1, [r3, #0]
c0de7fc6:	b2cb      	uxtb	r3, r1
c0de7fc8:	4611      	mov	r1, r2
c0de7fca:	461a      	mov	r2, r3
c0de7fcc:	f000 f814 	bl	c0de7ff8 <configButtons>
c0de7fd0:	2001      	movs	r0, #1
c0de7fd2:	bd70      	pop	{r4, r5, r6, pc}
c0de7fd4:	20ff      	movs	r0, #255	@ 0xff
c0de7fd6:	7018      	strb	r0, [r3, #0]
c0de7fd8:	e7fa      	b.n	c0de7fd0 <layoutNavigationCallback+0x80>
c0de7fda:	7818      	ldrb	r0, [r3, #0]
c0de7fdc:	b150      	cbz	r0, c0de7ff4 <layoutNavigationCallback+0xa4>
c0de7fde:	3801      	subs	r0, #1
c0de7fe0:	e004      	b.n	c0de7fec <layoutNavigationCallback+0x9c>
c0de7fe2:	7818      	ldrb	r0, [r3, #0]
c0de7fe4:	1e54      	subs	r4, r2, #1
c0de7fe6:	4284      	cmp	r4, r0
c0de7fe8:	d904      	bls.n	c0de7ff4 <layoutNavigationCallback+0xa4>
c0de7fea:	3001      	adds	r0, #1
c0de7fec:	7018      	strb	r0, [r3, #0]
c0de7fee:	b2c3      	uxtb	r3, r0
c0de7ff0:	4608      	mov	r0, r1
c0de7ff2:	e7e9      	b.n	c0de7fc8 <layoutNavigationCallback+0x78>
c0de7ff4:	2000      	movs	r0, #0
c0de7ff6:	bd70      	pop	{r4, r5, r6, pc}

c0de7ff8 <configButtons>:
c0de7ff8:	b5b0      	push	{r4, r5, r7, lr}
c0de7ffa:	f810 3f22 	ldrb.w	r3, [r0, #34]!
c0de7ffe:	7844      	ldrb	r4, [r0, #1]
c0de8000:	7885      	ldrb	r5, [r0, #2]
c0de8002:	78c0      	ldrb	r0, [r0, #3]
c0de8004:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de8008:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
c0de800c:	ea43 4000 	orr.w	r0, r3, r0, lsl #16
c0de8010:	e9d0 3001 	ldrd	r3, r0, [r0, #4]
c0de8014:	b12b      	cbz	r3, c0de8022 <configButtons+0x2a>
c0de8016:	fab2 f482 	clz	r4, r2
c0de801a:	0964      	lsrs	r4, r4, #5
c0de801c:	0064      	lsls	r4, r4, #1
c0de801e:	f883 4021 	strb.w	r4, [r3, #33]	@ 0x21
c0de8022:	2902      	cmp	r1, #2
c0de8024:	d307      	bcc.n	c0de8036 <configButtons+0x3e>
c0de8026:	43d2      	mvns	r2, r2
c0de8028:	4411      	add	r1, r2
c0de802a:	fab1 f181 	clz	r1, r1
c0de802e:	0949      	lsrs	r1, r1, #5
c0de8030:	0049      	lsls	r1, r1, #1
c0de8032:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de8036:	bdb0      	pop	{r4, r5, r7, pc}

c0de8038 <layoutNavigationPopulate>:
c0de8038:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de803c:	4680      	mov	r8, r0
c0de803e:	78c8      	ldrb	r0, [r1, #3]
c0de8040:	4616      	mov	r6, r2
c0de8042:	460d      	mov	r5, r1
c0de8044:	b338      	cbz	r0, c0de8096 <layoutNavigationPopulate+0x5e>
c0de8046:	2005      	movs	r0, #5
c0de8048:	4631      	mov	r1, r6
c0de804a:	2405      	movs	r4, #5
c0de804c:	f003 fdb1 	bl	c0debbb2 <nbgl_objPoolGet>
c0de8050:	4976      	ldr	r1, [pc, #472]	@ (c0de822c <layoutNavigationPopulate+0x1f4>)
c0de8052:	4479      	add	r1, pc
c0de8054:	f000 f8ff 	bl	c0de8256 <OUTLINED_FUNCTION_1>
c0de8058:	70d3      	strb	r3, [r2, #3]
c0de805a:	7091      	strb	r1, [r2, #2]
c0de805c:	2258      	movs	r2, #88	@ 0x58
c0de805e:	2100      	movs	r1, #0
c0de8060:	2303      	movs	r3, #3
c0de8062:	7182      	strb	r2, [r0, #6]
c0de8064:	7102      	strb	r2, [r0, #4]
c0de8066:	2201      	movs	r2, #1
c0de8068:	71c1      	strb	r1, [r0, #7]
c0de806a:	7141      	strb	r1, [r0, #5]
c0de806c:	7601      	strb	r1, [r0, #24]
c0de806e:	7741      	strb	r1, [r0, #29]
c0de8070:	f880 3020 	strb.w	r3, [r0, #32]
c0de8074:	77c3      	strb	r3, [r0, #31]
c0de8076:	f880 3022 	strb.w	r3, [r0, #34]	@ 0x22
c0de807a:	7702      	strb	r2, [r0, #28]
c0de807c:	7782      	strb	r2, [r0, #30]
c0de807e:	786a      	ldrb	r2, [r5, #1]
c0de8080:	2a01      	cmp	r2, #1
c0de8082:	bf88      	it	hi
c0de8084:	2404      	movhi	r4, #4
c0de8086:	7584      	strb	r4, [r0, #22]
c0de8088:	bf88      	it	hi
c0de808a:	2101      	movhi	r1, #1
c0de808c:	00c9      	lsls	r1, r1, #3
c0de808e:	75c1      	strb	r1, [r0, #23]
c0de8090:	f000 f8d4 	bl	c0de823c <OUTLINED_FUNCTION_0>
c0de8094:	6008      	str	r0, [r1, #0]
c0de8096:	7928      	ldrb	r0, [r5, #4]
c0de8098:	b310      	cbz	r0, c0de80e0 <layoutNavigationPopulate+0xa8>
c0de809a:	2005      	movs	r0, #5
c0de809c:	4631      	mov	r1, r6
c0de809e:	f003 fd88 	bl	c0debbb2 <nbgl_objPoolGet>
c0de80a2:	4963      	ldr	r1, [pc, #396]	@ (c0de8230 <layoutNavigationPopulate+0x1f8>)
c0de80a4:	4479      	add	r1, pc
c0de80a6:	f000 f8d6 	bl	c0de8256 <OUTLINED_FUNCTION_1>
c0de80aa:	7091      	strb	r1, [r2, #2]
c0de80ac:	2100      	movs	r1, #0
c0de80ae:	70d3      	strb	r3, [r2, #3]
c0de80b0:	2260      	movs	r2, #96	@ 0x60
c0de80b2:	2301      	movs	r3, #1
c0de80b4:	71c1      	strb	r1, [r0, #7]
c0de80b6:	7141      	strb	r1, [r0, #5]
c0de80b8:	7741      	strb	r1, [r0, #29]
c0de80ba:	7601      	strb	r1, [r0, #24]
c0de80bc:	2103      	movs	r1, #3
c0de80be:	7182      	strb	r2, [r0, #6]
c0de80c0:	2268      	movs	r2, #104	@ 0x68
c0de80c2:	7703      	strb	r3, [r0, #28]
c0de80c4:	f880 1020 	strb.w	r1, [r0, #32]
c0de80c8:	77c1      	strb	r1, [r0, #31]
c0de80ca:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de80ce:	2102      	movs	r1, #2
c0de80d0:	7102      	strb	r2, [r0, #4]
c0de80d2:	75c2      	strb	r2, [r0, #23]
c0de80d4:	7781      	strb	r1, [r0, #30]
c0de80d6:	2106      	movs	r1, #6
c0de80d8:	7581      	strb	r1, [r0, #22]
c0de80da:	f000 f8af 	bl	c0de823c <OUTLINED_FUNCTION_0>
c0de80de:	6048      	str	r0, [r1, #4]
c0de80e0:	2005      	movs	r0, #5
c0de80e2:	4631      	mov	r1, r6
c0de80e4:	f003 fd65 	bl	c0debbb2 <nbgl_objPoolGet>
c0de80e8:	4c52      	ldr	r4, [pc, #328]	@ (c0de8234 <layoutNavigationPopulate+0x1fc>)
c0de80ea:	447c      	add	r4, pc
c0de80ec:	0a21      	lsrs	r1, r4, #8
c0de80ee:	0e22      	lsrs	r2, r4, #24
c0de80f0:	f880 102f 	strb.w	r1, [r0, #47]	@ 0x2f
c0de80f4:	4601      	mov	r1, r0
c0de80f6:	f801 4f2e 	strb.w	r4, [r1, #46]!
c0de80fa:	70ca      	strb	r2, [r1, #3]
c0de80fc:	0c22      	lsrs	r2, r4, #16
c0de80fe:	708a      	strb	r2, [r1, #2]
c0de8100:	2100      	movs	r1, #0
c0de8102:	2260      	movs	r2, #96	@ 0x60
c0de8104:	7182      	strb	r2, [r0, #6]
c0de8106:	2268      	movs	r2, #104	@ 0x68
c0de8108:	71c1      	strb	r1, [r0, #7]
c0de810a:	7141      	strb	r1, [r0, #5]
c0de810c:	7741      	strb	r1, [r0, #29]
c0de810e:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de8112:	2103      	movs	r1, #3
c0de8114:	7102      	strb	r2, [r0, #4]
c0de8116:	2201      	movs	r2, #1
c0de8118:	f880 1020 	strb.w	r1, [r0, #32]
c0de811c:	77c1      	strb	r1, [r0, #31]
c0de811e:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de8122:	7781      	strb	r1, [r0, #30]
c0de8124:	2106      	movs	r1, #6
c0de8126:	7581      	strb	r1, [r0, #22]
c0de8128:	7702      	strb	r2, [r0, #28]
c0de812a:	4641      	mov	r1, r8
c0de812c:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de8130:	784b      	ldrb	r3, [r1, #1]
c0de8132:	788f      	ldrb	r7, [r1, #2]
c0de8134:	78c9      	ldrb	r1, [r1, #3]
c0de8136:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de813a:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de813e:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de8142:	6088      	str	r0, [r1, #8]
c0de8144:	79a8      	ldrb	r0, [r5, #6]
c0de8146:	2800      	cmp	r0, #0
c0de8148:	d067      	beq.n	c0de821a <layoutNavigationPopulate+0x1e2>
c0de814a:	79e8      	ldrb	r0, [r5, #7]
c0de814c:	2800      	cmp	r0, #0
c0de814e:	d04c      	beq.n	c0de81ea <layoutNavigationPopulate+0x1b2>
c0de8150:	2004      	movs	r0, #4
c0de8152:	4631      	mov	r1, r6
c0de8154:	f003 fd2d 	bl	c0debbb2 <nbgl_objPoolGet>
c0de8158:	4606      	mov	r6, r0
c0de815a:	7868      	ldrb	r0, [r5, #1]
c0de815c:	78a9      	ldrb	r1, [r5, #2]
c0de815e:	f04f 0a0b 	mov.w	sl, #11
c0de8162:	9000      	str	r0, [sp, #0]
c0de8164:	4830      	ldr	r0, [pc, #192]	@ (c0de8228 <layoutNavigationPopulate+0x1f0>)
c0de8166:	1c4b      	adds	r3, r1, #1
c0de8168:	210b      	movs	r1, #11
c0de816a:	4a33      	ldr	r2, [pc, #204]	@ (c0de8238 <layoutNavigationPopulate+0x200>)
c0de816c:	eb09 0700 	add.w	r7, r9, r0
c0de8170:	447a      	add	r2, pc
c0de8172:	4638      	mov	r0, r7
c0de8174:	f003 fd6c 	bl	c0debc50 <snprintf>
c0de8178:	0a38      	lsrs	r0, r7, #8
c0de817a:	0e39      	lsrs	r1, r7, #24
c0de817c:	f06f 0201 	mvn.w	r2, #1
c0de8180:	f886 a022 	strb.w	sl, [r6, #34]	@ 0x22
c0de8184:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de8188:	4630      	mov	r0, r6
c0de818a:	f800 7f26 	strb.w	r7, [r0, #38]!
c0de818e:	70c1      	strb	r1, [r0, #3]
c0de8190:	0c39      	lsrs	r1, r7, #16
c0de8192:	7081      	strb	r1, [r0, #2]
c0de8194:	2000      	movs	r0, #0
c0de8196:	7861      	ldrb	r1, [r4, #1]
c0de8198:	71f0      	strb	r0, [r6, #7]
c0de819a:	2060      	movs	r0, #96	@ 0x60
c0de819c:	71b0      	strb	r0, [r6, #6]
c0de819e:	2001      	movs	r0, #1
c0de81a0:	77f0      	strb	r0, [r6, #31]
c0de81a2:	2005      	movs	r0, #5
c0de81a4:	f886 0020 	strb.w	r0, [r6, #32]
c0de81a8:	75b0      	strb	r0, [r6, #22]
c0de81aa:	7820      	ldrb	r0, [r4, #0]
c0de81ac:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de81b0:	f1c0 0168 	rsb	r1, r0, #104	@ 0x68
c0de81b4:	fb91 f1f2 	sdiv	r1, r1, r2
c0de81b8:	1a08      	subs	r0, r1, r0
c0de81ba:	4641      	mov	r1, r8
c0de81bc:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de81c0:	f811 3c1e 	ldrb.w	r3, [r1, #-30]
c0de81c4:	f811 4c1d 	ldrb.w	r4, [r1, #-29]
c0de81c8:	784f      	ldrb	r7, [r1, #1]
c0de81ca:	788a      	ldrb	r2, [r1, #2]
c0de81cc:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de81d0:	eb03 0040 	add.w	r0, r3, r0, lsl #1
c0de81d4:	7130      	strb	r0, [r6, #4]
c0de81d6:	0a00      	lsrs	r0, r0, #8
c0de81d8:	78c9      	ldrb	r1, [r1, #3]
c0de81da:	7170      	strb	r0, [r6, #5]
c0de81dc:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de81e0:	ea4c 2207 	orr.w	r2, ip, r7, lsl #8
c0de81e4:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de81e8:	60ce      	str	r6, [r1, #12]
c0de81ea:	7928      	ldrb	r0, [r5, #4]
c0de81ec:	b1a8      	cbz	r0, c0de821a <layoutNavigationPopulate+0x1e2>
c0de81ee:	4640      	mov	r0, r8
c0de81f0:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de81f4:	7842      	ldrb	r2, [r0, #1]
c0de81f6:	7883      	ldrb	r3, [r0, #2]
c0de81f8:	78c0      	ldrb	r0, [r0, #3]
c0de81fa:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de81fe:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de8202:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de8206:	6840      	ldr	r0, [r0, #4]
c0de8208:	f810 1f17 	ldrb.w	r1, [r0, #23]!
c0de820c:	7842      	ldrb	r2, [r0, #1]
c0de820e:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de8212:	314f      	adds	r1, #79	@ 0x4f
c0de8214:	7001      	strb	r1, [r0, #0]
c0de8216:	0a09      	lsrs	r1, r1, #8
c0de8218:	7041      	strb	r1, [r0, #1]
c0de821a:	7869      	ldrb	r1, [r5, #1]
c0de821c:	78aa      	ldrb	r2, [r5, #2]
c0de821e:	4640      	mov	r0, r8
c0de8220:	e8bd 45f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de8224:	f7ff bee8 	b.w	c0de7ff8 <configButtons>
c0de8228:	000018f0 	.word	0x000018f0
c0de822c:	00005219 	.word	0x00005219
c0de8230:	000050ad 	.word	0x000050ad
c0de8234:	000050ea 	.word	0x000050ea
c0de8238:	00005b9c 	.word	0x00005b9c

c0de823c <OUTLINED_FUNCTION_0>:
c0de823c:	4641      	mov	r1, r8
c0de823e:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de8242:	784b      	ldrb	r3, [r1, #1]
c0de8244:	788c      	ldrb	r4, [r1, #2]
c0de8246:	78c9      	ldrb	r1, [r1, #3]
c0de8248:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de824c:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
c0de8250:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de8254:	4770      	bx	lr

c0de8256 <OUTLINED_FUNCTION_1>:
c0de8256:	0a0a      	lsrs	r2, r1, #8
c0de8258:	0e0b      	lsrs	r3, r1, #24
c0de825a:	f880 202f 	strb.w	r2, [r0, #47]	@ 0x2f
c0de825e:	4602      	mov	r2, r0
c0de8260:	f802 1f2e 	strb.w	r1, [r2, #46]!
c0de8264:	0c09      	lsrs	r1, r1, #16
c0de8266:	4770      	bx	lr

c0de8268 <nbgl_pageDrawLedgerInfo>:
c0de8268:	b510      	push	{r4, lr}
c0de826a:	b08c      	sub	sp, #48	@ 0x30
c0de826c:	9008      	str	r0, [sp, #32]
c0de826e:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0de8272:	f88d 301c 	strb.w	r3, [sp, #28]
c0de8276:	f8ad 0014 	strh.w	r0, [sp, #20]
c0de827a:	2009      	movs	r0, #9
c0de827c:	f88d 001d 	strb.w	r0, [sp, #29]
c0de8280:	481c      	ldr	r0, [pc, #112]	@ (c0de82f4 <nbgl_pageDrawLedgerInfo+0x8c>)
c0de8282:	4478      	add	r0, pc
c0de8284:	9006      	str	r0, [sp, #24]
c0de8286:	2000      	movs	r0, #0
c0de8288:	9004      	str	r0, [sp, #16]
c0de828a:	4b1b      	ldr	r3, [pc, #108]	@ (c0de82f8 <nbgl_pageDrawLedgerInfo+0x90>)
c0de828c:	e9cd 2000 	strd	r2, r0, [sp]
c0de8290:	784a      	ldrb	r2, [r1, #1]
c0de8292:	78cc      	ldrb	r4, [r1, #3]
c0de8294:	447b      	add	r3, pc
c0de8296:	e9cd 0302 	strd	r0, r3, [sp, #8]
c0de829a:	7808      	ldrb	r0, [r1, #0]
c0de829c:	788b      	ldrb	r3, [r1, #2]
c0de829e:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de82a2:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de82a6:	460a      	mov	r2, r1
c0de82a8:	ea40 4003 	orr.w	r0, r0, r3, lsl #16
c0de82ac:	f812 3f08 	ldrb.w	r3, [r2, #8]!
c0de82b0:	9009      	str	r0, [sp, #36]	@ 0x24
c0de82b2:	7a48      	ldrb	r0, [r1, #9]
c0de82b4:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de82b8:	7893      	ldrb	r3, [r2, #2]
c0de82ba:	78d2      	ldrb	r2, [r2, #3]
c0de82bc:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de82c0:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
c0de82c4:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de82c6:	7948      	ldrb	r0, [r1, #5]
c0de82c8:	f811 2f04 	ldrb.w	r2, [r1, #4]!
c0de82cc:	f000 fb79 	bl	c0de89c2 <OUTLINED_FUNCTION_1>
c0de82d0:	900a      	str	r0, [sp, #40]	@ 0x28
c0de82d2:	a805      	add	r0, sp, #20
c0de82d4:	f7fc f83c 	bl	c0de4350 <nbgl_layoutGet>
c0de82d8:	2160      	movs	r1, #96	@ 0x60
c0de82da:	4604      	mov	r4, r0
c0de82dc:	f000 f80e 	bl	c0de82fc <addEmptyHeader>
c0de82e0:	4669      	mov	r1, sp
c0de82e2:	4620      	mov	r0, r4
c0de82e4:	f7fd ff3a 	bl	c0de615c <nbgl_layoutAddCenteredInfo>
c0de82e8:	4620      	mov	r0, r4
c0de82ea:	f7ff fa2b 	bl	c0de7744 <nbgl_layoutDraw>
c0de82ee:	4620      	mov	r0, r4
c0de82f0:	b00c      	add	sp, #48	@ 0x30
c0de82f2:	bd10      	pop	{r4, pc}
c0de82f4:	00005e62 	.word	0x00005e62
c0de82f8:	00004704 	.word	0x00004704

c0de82fc <addEmptyHeader>:
c0de82fc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de82fe:	f8ad 1004 	strh.w	r1, [sp, #4]
c0de8302:	2100      	movs	r1, #0
c0de8304:	f8ad 1000 	strh.w	r1, [sp]
c0de8308:	4669      	mov	r1, sp
c0de830a:	f7fe fdb9 	bl	c0de6e80 <nbgl_layoutAddHeader>
c0de830e:	bd8f      	pop	{r0, r1, r2, r3, r7, pc}

c0de8310 <nbgl_pageDrawInfo>:
c0de8310:	b570      	push	{r4, r5, r6, lr}
c0de8312:	b08c      	sub	sp, #48	@ 0x30
c0de8314:	460d      	mov	r5, r1
c0de8316:	4606      	mov	r6, r0
c0de8318:	a805      	add	r0, sp, #20
c0de831a:	211c      	movs	r1, #28
c0de831c:	4614      	mov	r4, r2
c0de831e:	f004 f84b 	bl	c0dec3b8 <__aeabi_memclr>
c0de8322:	2001      	movs	r0, #1
c0de8324:	9608      	str	r6, [sp, #32]
c0de8326:	f88d 0015 	strb.w	r0, [sp, #21]
c0de832a:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de832e:	b948      	cbnz	r0, c0de8344 <nbgl_pageDrawInfo+0x34>
c0de8330:	6a20      	ldr	r0, [r4, #32]
c0de8332:	9006      	str	r0, [sp, #24]
c0de8334:	f894 0025 	ldrb.w	r0, [r4, #37]	@ 0x25
c0de8338:	f88d 001c 	strb.w	r0, [sp, #28]
c0de833c:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de8340:	f88d 001d 	strb.w	r0, [sp, #29]
c0de8344:	b1f5      	cbz	r5, c0de8384 <nbgl_pageDrawInfo+0x74>
c0de8346:	4629      	mov	r1, r5
c0de8348:	7a68      	ldrb	r0, [r5, #9]
c0de834a:	78eb      	ldrb	r3, [r5, #3]
c0de834c:	f811 2f08 	ldrb.w	r2, [r1, #8]!
c0de8350:	f000 fb37 	bl	c0de89c2 <OUTLINED_FUNCTION_1>
c0de8354:	4629      	mov	r1, r5
c0de8356:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de8358:	7968      	ldrb	r0, [r5, #5]
c0de835a:	f811 2f04 	ldrb.w	r2, [r1, #4]!
c0de835e:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de8362:	788a      	ldrb	r2, [r1, #2]
c0de8364:	78c9      	ldrb	r1, [r1, #3]
c0de8366:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de836a:	78aa      	ldrb	r2, [r5, #2]
c0de836c:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de8370:	7869      	ldrb	r1, [r5, #1]
c0de8372:	900a      	str	r0, [sp, #40]	@ 0x28
c0de8374:	7828      	ldrb	r0, [r5, #0]
c0de8376:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de837a:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de837e:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
c0de8382:	e000      	b.n	c0de8386 <nbgl_pageDrawInfo+0x76>
c0de8384:	2000      	movs	r0, #0
c0de8386:	9009      	str	r0, [sp, #36]	@ 0x24
c0de8388:	a805      	add	r0, sp, #20
c0de838a:	f7fb ffe1 	bl	c0de4350 <nbgl_layoutGet>
c0de838e:	4605      	mov	r5, r0
c0de8390:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de8394:	b150      	cbz	r0, c0de83ac <nbgl_pageDrawInfo+0x9c>
c0de8396:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de839a:	f894 3025 	ldrb.w	r3, [r4, #37]	@ 0x25
c0de839e:	6a22      	ldr	r2, [r4, #32]
c0de83a0:	f44f 61c0 	mov.w	r1, #1536	@ 0x600
c0de83a4:	9000      	str	r0, [sp, #0]
c0de83a6:	4628      	mov	r0, r5
c0de83a8:	f7fc fd40 	bl	c0de4e2c <nbgl_layoutAddSwipe>
c0de83ac:	7d20      	ldrb	r0, [r4, #20]
c0de83ae:	b118      	cbz	r0, c0de83b8 <nbgl_pageDrawInfo+0xa8>
c0de83b0:	4628      	mov	r0, r5
c0de83b2:	2128      	movs	r1, #40	@ 0x28
c0de83b4:	f7ff ffa2 	bl	c0de82fc <addEmptyHeader>
c0de83b8:	4628      	mov	r0, r5
c0de83ba:	4621      	mov	r1, r4
c0de83bc:	f7fd fece 	bl	c0de615c <nbgl_layoutAddCenteredInfo>
c0de83c0:	6aa0      	ldr	r0, [r4, #40]	@ 0x28
c0de83c2:	b1b8      	cbz	r0, c0de83f4 <nbgl_pageDrawInfo+0xe4>
c0de83c4:	7d61      	ldrb	r1, [r4, #21]
c0de83c6:	2904      	cmp	r1, #4
c0de83c8:	d014      	beq.n	c0de83f4 <nbgl_pageDrawInfo+0xe4>
c0de83ca:	9001      	str	r0, [sp, #4]
c0de83cc:	2001      	movs	r0, #1
c0de83ce:	f8ad 000e 	strh.w	r0, [sp, #14]
c0de83d2:	6ae0      	ldr	r0, [r4, #44]	@ 0x2c
c0de83d4:	9002      	str	r0, [sp, #8]
c0de83d6:	7de0      	ldrb	r0, [r4, #23]
c0de83d8:	f88d 000c 	strb.w	r0, [sp, #12]
c0de83dc:	f894 0030 	ldrb.w	r0, [r4, #48]	@ 0x30
c0de83e0:	f88d 000d 	strb.w	r0, [sp, #13]
c0de83e4:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de83e8:	f88d 0010 	strb.w	r0, [sp, #16]
c0de83ec:	a901      	add	r1, sp, #4
c0de83ee:	4628      	mov	r0, r5
c0de83f0:	f7fe fc2e 	bl	c0de6c50 <nbgl_layoutAddButton>
c0de83f4:	69a0      	ldr	r0, [r4, #24]
c0de83f6:	b140      	cbz	r0, c0de840a <nbgl_pageDrawInfo+0xfa>
c0de83f8:	f003 fdbc 	bl	c0debf74 <pic>
c0de83fc:	7f22      	ldrb	r2, [r4, #28]
c0de83fe:	f894 3031 	ldrb.w	r3, [r4, #49]	@ 0x31
c0de8402:	4601      	mov	r1, r0
c0de8404:	4628      	mov	r0, r5
c0de8406:	f7fe fd14 	bl	c0de6e32 <nbgl_layoutAddFooter>
c0de840a:	7d20      	ldrb	r0, [r4, #20]
c0de840c:	b1b0      	cbz	r0, c0de843c <nbgl_pageDrawInfo+0x12c>
c0de840e:	2801      	cmp	r0, #1
c0de8410:	d006      	beq.n	c0de8420 <nbgl_pageDrawInfo+0x110>
c0de8412:	2802      	cmp	r0, #2
c0de8414:	d007      	beq.n	c0de8426 <nbgl_pageDrawInfo+0x116>
c0de8416:	2803      	cmp	r0, #3
c0de8418:	d136      	bne.n	c0de8488 <nbgl_pageDrawInfo+0x178>
c0de841a:	482e      	ldr	r0, [pc, #184]	@ (c0de84d4 <nbgl_pageDrawInfo+0x1c4>)
c0de841c:	4478      	add	r0, pc
c0de841e:	e004      	b.n	c0de842a <nbgl_pageDrawInfo+0x11a>
c0de8420:	482b      	ldr	r0, [pc, #172]	@ (c0de84d0 <nbgl_pageDrawInfo+0x1c0>)
c0de8422:	4478      	add	r0, pc
c0de8424:	e001      	b.n	c0de842a <nbgl_pageDrawInfo+0x11a>
c0de8426:	482c      	ldr	r0, [pc, #176]	@ (c0de84d8 <nbgl_pageDrawInfo+0x1c8>)
c0de8428:	4478      	add	r0, pc
c0de842a:	f003 fda3 	bl	c0debf74 <pic>
c0de842e:	7da2      	ldrb	r2, [r4, #22]
c0de8430:	f894 3031 	ldrb.w	r3, [r4, #49]	@ 0x31
c0de8434:	4601      	mov	r1, r0
c0de8436:	4628      	mov	r0, r5
c0de8438:	f7fc fd52 	bl	c0de4ee0 <nbgl_layoutAddTopRightButton>
c0de843c:	7d60      	ldrb	r0, [r4, #21]
c0de843e:	b3c0      	cbz	r0, c0de84b2 <nbgl_pageDrawInfo+0x1a2>
c0de8440:	2801      	cmp	r0, #1
c0de8442:	d023      	beq.n	c0de848c <nbgl_pageDrawInfo+0x17c>
c0de8444:	2802      	cmp	r0, #2
c0de8446:	d024      	beq.n	c0de8492 <nbgl_pageDrawInfo+0x182>
c0de8448:	2803      	cmp	r0, #3
c0de844a:	d025      	beq.n	c0de8498 <nbgl_pageDrawInfo+0x188>
c0de844c:	2804      	cmp	r0, #4
c0de844e:	d11b      	bne.n	c0de8488 <nbgl_pageDrawInfo+0x178>
c0de8450:	6aa0      	ldr	r0, [r4, #40]	@ 0x28
c0de8452:	b3a0      	cbz	r0, c0de84be <nbgl_pageDrawInfo+0x1ae>
c0de8454:	4922      	ldr	r1, [pc, #136]	@ (c0de84e0 <nbgl_pageDrawInfo+0x1d0>)
c0de8456:	4479      	add	r1, pc
c0de8458:	e9cd 0101 	strd	r0, r1, [sp, #4]
c0de845c:	6ae0      	ldr	r0, [r4, #44]	@ 0x2c
c0de845e:	2102      	movs	r1, #2
c0de8460:	9003      	str	r0, [sp, #12]
c0de8462:	7de0      	ldrb	r0, [r4, #23]
c0de8464:	f88d 0010 	strb.w	r0, [sp, #16]
c0de8468:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de846c:	f88d 0012 	strb.w	r0, [sp, #18]
c0de8470:	f894 0030 	ldrb.w	r0, [r4, #48]	@ 0x30
c0de8474:	2800      	cmp	r0, #0
c0de8476:	bf08      	it	eq
c0de8478:	2101      	moveq	r1, #1
c0de847a:	f88d 1011 	strb.w	r1, [sp, #17]
c0de847e:	4628      	mov	r0, r5
c0de8480:	a901      	add	r1, sp, #4
c0de8482:	f7fe fa15 	bl	c0de68b0 <nbgl_layoutAddChoiceButtons>
c0de8486:	e014      	b.n	c0de84b2 <nbgl_pageDrawInfo+0x1a2>
c0de8488:	2500      	movs	r5, #0
c0de848a:	e015      	b.n	c0de84b8 <nbgl_pageDrawInfo+0x1a8>
c0de848c:	4813      	ldr	r0, [pc, #76]	@ (c0de84dc <nbgl_pageDrawInfo+0x1cc>)
c0de848e:	4478      	add	r0, pc
c0de8490:	e004      	b.n	c0de849c <nbgl_pageDrawInfo+0x18c>
c0de8492:	4816      	ldr	r0, [pc, #88]	@ (c0de84ec <nbgl_pageDrawInfo+0x1dc>)
c0de8494:	4478      	add	r0, pc
c0de8496:	e001      	b.n	c0de849c <nbgl_pageDrawInfo+0x18c>
c0de8498:	4813      	ldr	r0, [pc, #76]	@ (c0de84e8 <nbgl_pageDrawInfo+0x1d8>)
c0de849a:	4478      	add	r0, pc
c0de849c:	f003 fd6a 	bl	c0debf74 <pic>
c0de84a0:	4601      	mov	r1, r0
c0de84a2:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de84a6:	7de2      	ldrb	r2, [r4, #23]
c0de84a8:	2300      	movs	r3, #0
c0de84aa:	9000      	str	r0, [sp, #0]
c0de84ac:	4628      	mov	r0, r5
c0de84ae:	f7fd f8dd 	bl	c0de566c <nbgl_layoutAddBottomButton>
c0de84b2:	4628      	mov	r0, r5
c0de84b4:	f7ff f946 	bl	c0de7744 <nbgl_layoutDraw>
c0de84b8:	4628      	mov	r0, r5
c0de84ba:	b00c      	add	sp, #48	@ 0x30
c0de84bc:	bd70      	pop	{r4, r5, r6, pc}
c0de84be:	7de2      	ldrb	r2, [r4, #23]
c0de84c0:	f894 3031 	ldrb.w	r3, [r4, #49]	@ 0x31
c0de84c4:	4907      	ldr	r1, [pc, #28]	@ (c0de84e4 <nbgl_pageDrawInfo+0x1d4>)
c0de84c6:	4628      	mov	r0, r5
c0de84c8:	4479      	add	r1, pc
c0de84ca:	f7fe fcb2 	bl	c0de6e32 <nbgl_layoutAddFooter>
c0de84ce:	e7f0      	b.n	c0de84b2 <nbgl_pageDrawInfo+0x1a2>
c0de84d0:	0000537a 	.word	0x0000537a
c0de84d4:	00004e92 	.word	0x00004e92
c0de84d8:	00004e43 	.word	0x00004e43
c0de84dc:	0000530e 	.word	0x0000530e
c0de84e0:	00005d23 	.word	0x00005d23
c0de84e4:	00005cb1 	.word	0x00005cb1
c0de84e8:	00004e14 	.word	0x00004e14
c0de84ec:	00004dd7 	.word	0x00004dd7

c0de84f0 <nbgl_pageDrawConfirmation>:
c0de84f0:	b5b0      	push	{r4, r5, r7, lr}
c0de84f2:	b08c      	sub	sp, #48	@ 0x30
c0de84f4:	4605      	mov	r5, r0
c0de84f6:	6948      	ldr	r0, [r1, #20]
c0de84f8:	460c      	mov	r4, r1
c0de84fa:	f003 fd3b 	bl	c0debf74 <pic>
c0de84fe:	9001      	str	r0, [sp, #4]
c0de8500:	69a0      	ldr	r0, [r4, #24]
c0de8502:	b110      	cbz	r0, c0de850a <nbgl_pageDrawConfirmation+0x1a>
c0de8504:	f003 fd36 	bl	c0debf74 <pic>
c0de8508:	e001      	b.n	c0de850e <nbgl_pageDrawConfirmation+0x1e>
c0de850a:	4815      	ldr	r0, [pc, #84]	@ (c0de8560 <nbgl_pageDrawConfirmation+0x70>)
c0de850c:	4478      	add	r0, pc
c0de850e:	2100      	movs	r1, #0
c0de8510:	7fe2      	ldrb	r2, [r4, #31]
c0de8512:	9508      	str	r5, [sp, #32]
c0de8514:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de8518:	2001      	movs	r0, #1
c0de851a:	f88d 1011 	strb.w	r1, [sp, #17]
c0de851e:	9109      	str	r1, [sp, #36]	@ 0x24
c0de8520:	9106      	str	r1, [sp, #24]
c0de8522:	7fa1      	ldrb	r1, [r4, #30]
c0de8524:	f88d 0015 	strb.w	r0, [sp, #21]
c0de8528:	7f20      	ldrb	r0, [r4, #28]
c0de852a:	f88d 2014 	strb.w	r2, [sp, #20]
c0de852e:	f88d 1012 	strb.w	r1, [sp, #18]
c0de8532:	f88d 0010 	strb.w	r0, [sp, #16]
c0de8536:	a805      	add	r0, sp, #20
c0de8538:	f7fb ff0a 	bl	c0de4350 <nbgl_layoutGet>
c0de853c:	2140      	movs	r1, #64	@ 0x40
c0de853e:	4605      	mov	r5, r0
c0de8540:	f7ff fedc 	bl	c0de82fc <addEmptyHeader>
c0de8544:	a901      	add	r1, sp, #4
c0de8546:	4628      	mov	r0, r5
c0de8548:	f7fe f9b2 	bl	c0de68b0 <nbgl_layoutAddChoiceButtons>
c0de854c:	4628      	mov	r0, r5
c0de854e:	4621      	mov	r1, r4
c0de8550:	f7fd fe04 	bl	c0de615c <nbgl_layoutAddCenteredInfo>
c0de8554:	4628      	mov	r0, r5
c0de8556:	f7ff f8f5 	bl	c0de7744 <nbgl_layoutDraw>
c0de855a:	4628      	mov	r0, r5
c0de855c:	b00c      	add	sp, #48	@ 0x30
c0de855e:	bdb0      	pop	{r4, r5, r7, pc}
c0de8560:	000057bf 	.word	0x000057bf

c0de8564 <nbgl_pageDrawGenericContentExt>:
c0de8564:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8568:	b096      	sub	sp, #88	@ 0x58
c0de856a:	460e      	mov	r6, r1
c0de856c:	2100      	movs	r1, #0
c0de856e:	4615      	mov	r5, r2
c0de8570:	f88d 3008 	strb.w	r3, [sp, #8]
c0de8574:	e9cd 0105 	strd	r0, r1, [sp, #20]
c0de8578:	2001      	movs	r0, #1
c0de857a:	f88d 0009 	strb.w	r0, [sp, #9]
c0de857e:	b10e      	cbz	r6, c0de8584 <nbgl_pageDrawGenericContentExt+0x20>
c0de8580:	78f0      	ldrb	r0, [r6, #3]
c0de8582:	b108      	cbz	r0, c0de8588 <nbgl_pageDrawGenericContentExt+0x24>
c0de8584:	9103      	str	r1, [sp, #12]
c0de8586:	e007      	b.n	c0de8598 <nbgl_pageDrawGenericContentExt+0x34>
c0de8588:	6970      	ldr	r0, [r6, #20]
c0de858a:	7cb1      	ldrb	r1, [r6, #18]
c0de858c:	9003      	str	r0, [sp, #12]
c0de858e:	7970      	ldrb	r0, [r6, #5]
c0de8590:	f88d 1010 	strb.w	r1, [sp, #16]
c0de8594:	f88d 0011 	strb.w	r0, [sp, #17]
c0de8598:	a802      	add	r0, sp, #8
c0de859a:	f7fb fed9 	bl	c0de4350 <nbgl_layoutGet>
c0de859e:	4682      	mov	sl, r0
c0de85a0:	b17e      	cbz	r6, c0de85c2 <nbgl_pageDrawGenericContentExt+0x5e>
c0de85a2:	78f0      	ldrb	r0, [r6, #3]
c0de85a4:	2801      	cmp	r0, #1
c0de85a6:	d011      	beq.n	c0de85cc <nbgl_pageDrawGenericContentExt+0x68>
c0de85a8:	b958      	cbnz	r0, c0de85c2 <nbgl_pageDrawGenericContentExt+0x5e>
c0de85aa:	68b3      	ldr	r3, [r6, #8]
c0de85ac:	78b2      	ldrb	r2, [r6, #2]
c0de85ae:	69b1      	ldr	r1, [r6, #24]
c0de85b0:	b323      	cbz	r3, c0de85fc <nbgl_pageDrawGenericContentExt+0x98>
c0de85b2:	7970      	ldrb	r0, [r6, #5]
c0de85b4:	7b34      	ldrb	r4, [r6, #12]
c0de85b6:	e9cd 4000 	strd	r4, r0, [sp]
c0de85ba:	4650      	mov	r0, sl
c0de85bc:	f7fe fc4b 	bl	c0de6e56 <nbgl_layoutAddSplitFooter>
c0de85c0:	e020      	b.n	c0de8604 <nbgl_pageDrawGenericContentExt+0xa0>
c0de85c2:	f04f 0800 	mov.w	r8, #0
c0de85c6:	f44f 7716 	mov.w	r7, #600	@ 0x258
c0de85ca:	e07e      	b.n	c0de86ca <nbgl_pageDrawGenericContentExt+0x166>
c0de85cc:	68b0      	ldr	r0, [r6, #8]
c0de85ce:	2800      	cmp	r0, #0
c0de85d0:	4680      	mov	r8, r0
c0de85d2:	bf18      	it	ne
c0de85d4:	f04f 0801 	movne.w	r8, #1
c0de85d8:	d027      	beq.n	c0de862a <nbgl_pageDrawGenericContentExt+0xc6>
c0de85da:	900e      	str	r0, [sp, #56]	@ 0x38
c0de85dc:	2006      	movs	r0, #6
c0de85de:	7b31      	ldrb	r1, [r6, #12]
c0de85e0:	f8ad 0034 	strh.w	r0, [sp, #52]	@ 0x34
c0de85e4:	7970      	ldrb	r0, [r6, #5]
c0de85e6:	f88d 103c 	strb.w	r1, [sp, #60]	@ 0x3c
c0de85ea:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de85ee:	a90d      	add	r1, sp, #52	@ 0x34
c0de85f0:	4650      	mov	r0, sl
c0de85f2:	f7fe fc45 	bl	c0de6e80 <nbgl_layoutAddHeader>
c0de85f6:	f5c0 7716 	rsb	r7, r0, #600	@ 0x258
c0de85fa:	e018      	b.n	c0de862e <nbgl_pageDrawGenericContentExt+0xca>
c0de85fc:	7973      	ldrb	r3, [r6, #5]
c0de85fe:	4650      	mov	r0, sl
c0de8600:	f7fe fc17 	bl	c0de6e32 <nbgl_layoutAddFooter>
c0de8604:	f5c0 7716 	rsb	r7, r0, #600	@ 0x258
c0de8608:	7930      	ldrb	r0, [r6, #4]
c0de860a:	2800      	cmp	r0, #0
c0de860c:	d042      	beq.n	c0de8694 <nbgl_pageDrawGenericContentExt+0x130>
c0de860e:	7c70      	ldrb	r0, [r6, #17]
c0de8610:	7974      	ldrb	r4, [r6, #5]
c0de8612:	7831      	ldrb	r1, [r6, #0]
c0de8614:	7872      	ldrb	r2, [r6, #1]
c0de8616:	7c33      	ldrb	r3, [r6, #16]
c0de8618:	e9cd 0400 	strd	r0, r4, [sp]
c0de861c:	4650      	mov	r0, sl
c0de861e:	f7fe fe73 	bl	c0de7308 <nbgl_layoutAddProgressIndicator>
c0de8622:	1a3f      	subs	r7, r7, r0
c0de8624:	f04f 0801 	mov.w	r8, #1
c0de8628:	e04f      	b.n	c0de86ca <nbgl_pageDrawGenericContentExt+0x166>
c0de862a:	f44f 7716 	mov.w	r7, #600	@ 0x258
c0de862e:	2001      	movs	r0, #1
c0de8630:	f88d 0035 	strb.w	r0, [sp, #53]	@ 0x35
c0de8634:	7870      	ldrb	r0, [r6, #1]
c0de8636:	2802      	cmp	r0, #2
c0de8638:	d31c      	bcc.n	c0de8674 <nbgl_pageDrawGenericContentExt+0x110>
c0de863a:	6971      	ldr	r1, [r6, #20]
c0de863c:	b369      	cbz	r1, c0de869a <nbgl_pageDrawGenericContentExt+0x136>
c0de863e:	f88d 0039 	strb.w	r0, [sp, #57]	@ 0x39
c0de8642:	2001      	movs	r0, #1
c0de8644:	9111      	str	r1, [sp, #68]	@ 0x44
c0de8646:	2103      	movs	r1, #3
c0de8648:	7972      	ldrb	r2, [r6, #5]
c0de864a:	f000 f9c9 	bl	c0de89e0 <OUTLINED_FUNCTION_3>
c0de864e:	2100      	movs	r1, #0
c0de8650:	f88d 103b 	strb.w	r1, [sp, #59]	@ 0x3b
c0de8654:	78b1      	ldrb	r1, [r6, #2]
c0de8656:	f88d 2049 	strb.w	r2, [sp, #73]	@ 0x49
c0de865a:	f88d 303c 	strb.w	r3, [sp, #60]	@ 0x3c
c0de865e:	f88d 2040 	strb.w	r2, [sp, #64]	@ 0x40
c0de8662:	f88d 003a 	strb.w	r0, [sp, #58]	@ 0x3a
c0de8666:	7cb0      	ldrb	r0, [r6, #18]
c0de8668:	f88d 1048 	strb.w	r1, [sp, #72]	@ 0x48
c0de866c:	f88d 003f 	strb.w	r0, [sp, #63]	@ 0x3f
c0de8670:	7cf0      	ldrb	r0, [r6, #19]
c0de8672:	e023      	b.n	c0de86bc <nbgl_pageDrawGenericContentExt+0x158>
c0de8674:	6970      	ldr	r0, [r6, #20]
c0de8676:	b340      	cbz	r0, c0de86ca <nbgl_pageDrawGenericContentExt+0x166>
c0de8678:	2100      	movs	r1, #0
c0de867a:	900e      	str	r0, [sp, #56]	@ 0x38
c0de867c:	2001      	movs	r0, #1
c0de867e:	f88d 103c 	strb.w	r1, [sp, #60]	@ 0x3c
c0de8682:	f88d 0034 	strb.w	r0, [sp, #52]	@ 0x34
c0de8686:	78b0      	ldrb	r0, [r6, #2]
c0de8688:	7971      	ldrb	r1, [r6, #5]
c0de868a:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de868e:	f88d 103e 	strb.w	r1, [sp, #62]	@ 0x3e
c0de8692:	e015      	b.n	c0de86c0 <nbgl_pageDrawGenericContentExt+0x15c>
c0de8694:	f04f 0800 	mov.w	r8, #0
c0de8698:	e017      	b.n	c0de86ca <nbgl_pageDrawGenericContentExt+0x166>
c0de869a:	f88d 0039 	strb.w	r0, [sp, #57]	@ 0x39
c0de869e:	2000      	movs	r0, #0
c0de86a0:	2104      	movs	r1, #4
c0de86a2:	7c32      	ldrb	r2, [r6, #16]
c0de86a4:	f000 f99c 	bl	c0de89e0 <OUTLINED_FUNCTION_3>
c0de86a8:	7971      	ldrb	r1, [r6, #5]
c0de86aa:	f88d 203b 	strb.w	r2, [sp, #59]	@ 0x3b
c0de86ae:	f88d 303c 	strb.w	r3, [sp, #60]	@ 0x3c
c0de86b2:	f88d 003a 	strb.w	r0, [sp, #58]	@ 0x3a
c0de86b6:	7cf0      	ldrb	r0, [r6, #19]
c0de86b8:	f88d 1040 	strb.w	r1, [sp, #64]	@ 0x40
c0de86bc:	f88d 0038 	strb.w	r0, [sp, #56]	@ 0x38
c0de86c0:	a90d      	add	r1, sp, #52	@ 0x34
c0de86c2:	4650      	mov	r0, sl
c0de86c4:	f7fc fc48 	bl	c0de4f58 <nbgl_layoutAddExtendedFooter>
c0de86c8:	1a3f      	subs	r7, r7, r0
c0de86ca:	6828      	ldr	r0, [r5, #0]
c0de86cc:	b190      	cbz	r0, c0de86f4 <nbgl_pageDrawGenericContentExt+0x190>
c0de86ce:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de86d0:	2000      	movs	r0, #0
c0de86d2:	79a9      	ldrb	r1, [r5, #6]
c0de86d4:	900e      	str	r0, [sp, #56]	@ 0x38
c0de86d6:	f240 1001 	movw	r0, #257	@ 0x101
c0de86da:	f8ad 0034 	strh.w	r0, [sp, #52]	@ 0x34
c0de86de:	7968      	ldrb	r0, [r5, #5]
c0de86e0:	f88d 1041 	strb.w	r1, [sp, #65]	@ 0x41
c0de86e4:	f88d 0040 	strb.w	r0, [sp, #64]	@ 0x40
c0de86e8:	a90d      	add	r1, sp, #52	@ 0x34
c0de86ea:	4650      	mov	r0, sl
c0de86ec:	f7fe fbc8 	bl	c0de6e80 <nbgl_layoutAddHeader>
c0de86f0:	f04f 0801 	mov.w	r8, #1
c0de86f4:	68a9      	ldr	r1, [r5, #8]
c0de86f6:	b121      	cbz	r1, c0de8702 <nbgl_pageDrawGenericContentExt+0x19e>
c0de86f8:	79ab      	ldrb	r3, [r5, #6]
c0de86fa:	79ea      	ldrb	r2, [r5, #7]
c0de86fc:	4650      	mov	r0, sl
c0de86fe:	f7fc fbef 	bl	c0de4ee0 <nbgl_layoutAddTopRightButton>
c0de8702:	7b28      	ldrb	r0, [r5, #12]
c0de8704:	2800      	cmp	r0, #0
c0de8706:	d044      	beq.n	c0de8792 <nbgl_pageDrawGenericContentExt+0x22e>
c0de8708:	2801      	cmp	r0, #1
c0de870a:	d04d      	beq.n	c0de87a8 <nbgl_pageDrawGenericContentExt+0x244>
c0de870c:	2802      	cmp	r0, #2
c0de870e:	d067      	beq.n	c0de87e0 <nbgl_pageDrawGenericContentExt+0x27c>
c0de8710:	2803      	cmp	r0, #3
c0de8712:	d075      	beq.n	c0de8800 <nbgl_pageDrawGenericContentExt+0x29c>
c0de8714:	2804      	cmp	r0, #4
c0de8716:	f000 8090 	beq.w	c0de883a <nbgl_pageDrawGenericContentExt+0x2d6>
c0de871a:	2805      	cmp	r0, #5
c0de871c:	f000 8095 	beq.w	c0de884a <nbgl_pageDrawGenericContentExt+0x2e6>
c0de8720:	2806      	cmp	r0, #6
c0de8722:	f000 80ab 	beq.w	c0de887c <nbgl_pageDrawGenericContentExt+0x318>
c0de8726:	2807      	cmp	r0, #7
c0de8728:	f000 80db 	beq.w	c0de88e2 <nbgl_pageDrawGenericContentExt+0x37e>
c0de872c:	2808      	cmp	r0, #8
c0de872e:	f000 80ec 	beq.w	c0de890a <nbgl_pageDrawGenericContentExt+0x3a6>
c0de8732:	2809      	cmp	r0, #9
c0de8734:	f000 8114 	beq.w	c0de8960 <nbgl_pageDrawGenericContentExt+0x3fc>
c0de8738:	280a      	cmp	r0, #10
c0de873a:	f040 8116 	bne.w	c0de896a <nbgl_pageDrawGenericContentExt+0x406>
c0de873e:	489b      	ldr	r0, [pc, #620]	@ (c0de89ac <nbgl_pageDrawGenericContentExt+0x448>)
c0de8740:	2400      	movs	r4, #0
c0de8742:	f10d 0834 	add.w	r8, sp, #52	@ 0x34
c0de8746:	2600      	movs	r6, #0
c0de8748:	4478      	add	r0, pc
c0de874a:	4683      	mov	fp, r0
c0de874c:	7e28      	ldrb	r0, [r5, #24]
c0de874e:	4286      	cmp	r6, r0
c0de8750:	f080 810b 	bcs.w	c0de896a <nbgl_pageDrawGenericContentExt+0x406>
c0de8754:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de8758:	f850 0026 	ldr.w	r0, [r0, r6, lsl #2]
c0de875c:	e9cd b40f 	strd	fp, r4, [sp, #60]	@ 0x3c
c0de8760:	e9cd 400d 	strd	r4, r0, [sp, #52]	@ 0x34
c0de8764:	5d88      	ldrb	r0, [r1, r6]
c0de8766:	4641      	mov	r1, r8
c0de8768:	f88d 4046 	strb.w	r4, [sp, #70]	@ 0x46
c0de876c:	f88d 4044 	strb.w	r4, [sp, #68]	@ 0x44
c0de8770:	f88d 0045 	strb.w	r0, [sp, #69]	@ 0x45
c0de8774:	7e68      	ldrb	r0, [r5, #25]
c0de8776:	f88d 0048 	strb.w	r0, [sp, #72]	@ 0x48
c0de877a:	4650      	mov	r0, sl
c0de877c:	f7fc ff95 	bl	c0de56aa <nbgl_layoutAddTouchableBar>
c0de8780:	1a3f      	subs	r7, r7, r0
c0de8782:	b2b8      	uxth	r0, r7
c0de8784:	280b      	cmp	r0, #11
c0de8786:	d302      	bcc.n	c0de878e <nbgl_pageDrawGenericContentExt+0x22a>
c0de8788:	4650      	mov	r0, sl
c0de878a:	f7fe fa4f 	bl	c0de6c2c <nbgl_layoutAddSeparationLine>
c0de878e:	3601      	adds	r6, #1
c0de8790:	e7dc      	b.n	c0de874c <nbgl_pageDrawGenericContentExt+0x1e8>
c0de8792:	f1b8 0f00 	cmp.w	r8, #0
c0de8796:	d101      	bne.n	c0de879c <nbgl_pageDrawGenericContentExt+0x238>
c0de8798:	f000 f90f 	bl	c0de89ba <OUTLINED_FUNCTION_0>
c0de879c:	f105 0110 	add.w	r1, r5, #16
c0de87a0:	4650      	mov	r0, sl
c0de87a2:	f7fd fcdb 	bl	c0de615c <nbgl_layoutAddCenteredInfo>
c0de87a6:	e0e0      	b.n	c0de896a <nbgl_pageDrawGenericContentExt+0x406>
c0de87a8:	f1b8 0f00 	cmp.w	r8, #0
c0de87ac:	d101      	bne.n	c0de87b2 <nbgl_pageDrawGenericContentExt+0x24e>
c0de87ae:	f000 f904 	bl	c0de89ba <OUTLINED_FUNCTION_0>
c0de87b2:	f105 0110 	add.w	r1, r5, #16
c0de87b6:	4650      	mov	r0, sl
c0de87b8:	f7fd fefe 	bl	c0de65b8 <nbgl_layoutAddContentCenter>
c0de87bc:	6b68      	ldr	r0, [r5, #52]	@ 0x34
c0de87be:	2800      	cmp	r0, #0
c0de87c0:	f000 80d3 	beq.w	c0de896a <nbgl_pageDrawGenericContentExt+0x406>
c0de87c4:	900e      	str	r0, [sp, #56]	@ 0x38
c0de87c6:	2003      	movs	r0, #3
c0de87c8:	f88d 0034 	strb.w	r0, [sp, #52]	@ 0x34
c0de87cc:	6ba8      	ldr	r0, [r5, #56]	@ 0x38
c0de87ce:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de87d0:	8fa8      	ldrh	r0, [r5, #60]	@ 0x3c
c0de87d2:	f8ad 0040 	strh.w	r0, [sp, #64]	@ 0x40
c0de87d6:	a90d      	add	r1, sp, #52	@ 0x34
c0de87d8:	4650      	mov	r0, sl
c0de87da:	f7fc f815 	bl	c0de4808 <nbgl_layoutAddUpFooter>
c0de87de:	e0c4      	b.n	c0de896a <nbgl_pageDrawGenericContentExt+0x406>
c0de87e0:	ae0d      	add	r6, sp, #52	@ 0x34
c0de87e2:	2124      	movs	r1, #36	@ 0x24
c0de87e4:	4630      	mov	r0, r6
c0de87e6:	f003 fde7 	bl	c0dec3b8 <__aeabi_memclr>
c0de87ea:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de87ee:	f000 f8f1 	bl	c0de89d4 <OUTLINED_FUNCTION_2>
c0de87f2:	69a9      	ldr	r1, [r5, #24]
c0de87f4:	7f6b      	ldrb	r3, [r5, #29]
c0de87f6:	7f2a      	ldrb	r2, [r5, #28]
c0de87f8:	4650      	mov	r0, sl
c0de87fa:	f7fe fb08 	bl	c0de6e0e <nbgl_layoutAddLongPressButton>
c0de87fe:	e0b4      	b.n	c0de896a <nbgl_pageDrawGenericContentExt+0x406>
c0de8800:	ae0d      	add	r6, sp, #52	@ 0x34
c0de8802:	2124      	movs	r1, #36	@ 0x24
c0de8804:	4630      	mov	r0, r6
c0de8806:	f003 fdd7 	bl	c0dec3b8 <__aeabi_memclr>
c0de880a:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de880e:	2400      	movs	r4, #0
c0de8810:	f88d 4034 	strb.w	r4, [sp, #52]	@ 0x34
c0de8814:	f000 f8de 	bl	c0de89d4 <OUTLINED_FUNCTION_2>
c0de8818:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0de881c:	940a      	str	r4, [sp, #40]	@ 0x28
c0de881e:	f88d 402d 	strb.w	r4, [sp, #45]	@ 0x2d
c0de8822:	f8ad 002e 	strh.w	r0, [sp, #46]	@ 0x2e
c0de8826:	69a8      	ldr	r0, [r5, #24]
c0de8828:	9009      	str	r0, [sp, #36]	@ 0x24
c0de882a:	7f28      	ldrb	r0, [r5, #28]
c0de882c:	f88d 002c 	strb.w	r0, [sp, #44]	@ 0x2c
c0de8830:	7f68      	ldrb	r0, [r5, #29]
c0de8832:	f88d 0030 	strb.w	r0, [sp, #48]	@ 0x30
c0de8836:	a909      	add	r1, sp, #36	@ 0x24
c0de8838:	e04f      	b.n	c0de88da <nbgl_pageDrawGenericContentExt+0x376>
c0de883a:	f1b8 0f00 	cmp.w	r8, #0
c0de883e:	d101      	bne.n	c0de8844 <nbgl_pageDrawGenericContentExt+0x2e0>
c0de8840:	f000 f8bb 	bl	c0de89ba <OUTLINED_FUNCTION_0>
c0de8844:	f000 f8da 	bl	c0de89fc <OUTLINED_FUNCTION_5>
c0de8848:	e08f      	b.n	c0de896a <nbgl_pageDrawGenericContentExt+0x406>
c0de884a:	f1b8 0f00 	cmp.w	r8, #0
c0de884e:	d101      	bne.n	c0de8854 <nbgl_pageDrawGenericContentExt+0x2f0>
c0de8850:	f000 f8b3 	bl	c0de89ba <OUTLINED_FUNCTION_0>
c0de8854:	7ea8      	ldrb	r0, [r5, #26]
c0de8856:	f105 0110 	add.w	r1, r5, #16
c0de885a:	3803      	subs	r0, #3
c0de885c:	76a8      	strb	r0, [r5, #26]
c0de885e:	4650      	mov	r0, sl
c0de8860:	f7fe f850 	bl	c0de6904 <nbgl_layoutAddTagValueList>
c0de8864:	2001      	movs	r0, #1
c0de8866:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de886a:	f8ad 003e 	strh.w	r0, [sp, #62]	@ 0x3e
c0de886e:	e9d5 0109 	ldrd	r0, r1, [r5, #36]	@ 0x24
c0de8872:	e9cd 100d 	strd	r1, r0, [sp, #52]	@ 0x34
c0de8876:	f000 f8ba 	bl	c0de89ee <OUTLINED_FUNCTION_4>
c0de887a:	e02b      	b.n	c0de88d4 <nbgl_pageDrawGenericContentExt+0x370>
c0de887c:	f1b8 0f00 	cmp.w	r8, #0
c0de8880:	d101      	bne.n	c0de8886 <nbgl_pageDrawGenericContentExt+0x322>
c0de8882:	f000 f89a 	bl	c0de89ba <OUTLINED_FUNCTION_0>
c0de8886:	f000 f8b9 	bl	c0de89fc <OUTLINED_FUNCTION_5>
c0de888a:	6aa8      	ldr	r0, [r5, #40]	@ 0x28
c0de888c:	2800      	cmp	r0, #0
c0de888e:	d073      	beq.n	c0de8978 <nbgl_pageDrawGenericContentExt+0x414>
c0de8890:	900d      	str	r0, [sp, #52]	@ 0x34
c0de8892:	6a68      	ldr	r0, [r5, #36]	@ 0x24
c0de8894:	2101      	movs	r1, #1
c0de8896:	f8ad 103e 	strh.w	r1, [sp, #62]	@ 0x3e
c0de889a:	f88d 103d 	strb.w	r1, [sp, #61]	@ 0x3d
c0de889e:	900e      	str	r0, [sp, #56]	@ 0x38
c0de88a0:	f000 f8a5 	bl	c0de89ee <OUTLINED_FUNCTION_4>
c0de88a4:	f88d 0040 	strb.w	r0, [sp, #64]	@ 0x40
c0de88a8:	a90d      	add	r1, sp, #52	@ 0x34
c0de88aa:	4650      	mov	r0, sl
c0de88ac:	f7fe f9d0 	bl	c0de6c50 <nbgl_layoutAddButton>
c0de88b0:	6b28      	ldr	r0, [r5, #48]	@ 0x30
c0de88b2:	2800      	cmp	r0, #0
c0de88b4:	d059      	beq.n	c0de896a <nbgl_pageDrawGenericContentExt+0x406>
c0de88b6:	2100      	movs	r1, #0
c0de88b8:	900d      	str	r0, [sp, #52]	@ 0x34
c0de88ba:	f895 002d 	ldrb.w	r0, [r5, #45]	@ 0x2d
c0de88be:	f88d 103d 	strb.w	r1, [sp, #61]	@ 0x3d
c0de88c2:	910e      	str	r1, [sp, #56]	@ 0x38
c0de88c4:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de88c8:	f8ad 103e 	strh.w	r1, [sp, #62]	@ 0x3e
c0de88cc:	f895 1038 	ldrb.w	r1, [r5, #56]	@ 0x38
c0de88d0:	f88d 103c 	strb.w	r1, [sp, #60]	@ 0x3c
c0de88d4:	f88d 0040 	strb.w	r0, [sp, #64]	@ 0x40
c0de88d8:	a90d      	add	r1, sp, #52	@ 0x34
c0de88da:	4650      	mov	r0, sl
c0de88dc:	f7fe f9b8 	bl	c0de6c50 <nbgl_layoutAddButton>
c0de88e0:	e043      	b.n	c0de896a <nbgl_pageDrawGenericContentExt+0x406>
c0de88e2:	2400      	movs	r4, #0
c0de88e4:	2600      	movs	r6, #0
c0de88e6:	7d28      	ldrb	r0, [r5, #20]
c0de88e8:	4286      	cmp	r6, r0
c0de88ea:	d23e      	bcs.n	c0de896a <nbgl_pageDrawGenericContentExt+0x406>
c0de88ec:	6928      	ldr	r0, [r5, #16]
c0de88ee:	1901      	adds	r1, r0, r4
c0de88f0:	4650      	mov	r0, sl
c0de88f2:	f7fd f8db 	bl	c0de5aac <nbgl_layoutAddSwitch>
c0de88f6:	1a3f      	subs	r7, r7, r0
c0de88f8:	b2b8      	uxth	r0, r7
c0de88fa:	280b      	cmp	r0, #11
c0de88fc:	d302      	bcc.n	c0de8904 <nbgl_pageDrawGenericContentExt+0x3a0>
c0de88fe:	4650      	mov	r0, sl
c0de8900:	f7fe f994 	bl	c0de6c2c <nbgl_layoutAddSeparationLine>
c0de8904:	340c      	adds	r4, #12
c0de8906:	3601      	adds	r6, #1
c0de8908:	e7ed      	b.n	c0de88e6 <nbgl_pageDrawGenericContentExt+0x382>
c0de890a:	2600      	movs	r6, #0
c0de890c:	2400      	movs	r4, #0
c0de890e:	7f28      	ldrb	r0, [r5, #28]
c0de8910:	4284      	cmp	r4, r0
c0de8912:	d22a      	bcs.n	c0de896a <nbgl_pageDrawGenericContentExt+0x406>
c0de8914:	7fa8      	ldrb	r0, [r5, #30]
c0de8916:	b180      	cbz	r0, c0de893a <nbgl_pageDrawGenericContentExt+0x3d6>
c0de8918:	69a8      	ldr	r0, [r5, #24]
c0de891a:	b170      	cbz	r0, c0de893a <nbgl_pageDrawGenericContentExt+0x3d6>
c0de891c:	5980      	ldr	r0, [r0, r6]
c0de891e:	b160      	cbz	r0, c0de893a <nbgl_pageDrawGenericContentExt+0x3d6>
c0de8920:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de8924:	7f6b      	ldrb	r3, [r5, #29]
c0de8926:	f851 2024 	ldr.w	r2, [r1, r4, lsl #2]
c0de892a:	f850 1024 	ldr.w	r1, [r0, r4, lsl #2]
c0de892e:	b2e0      	uxtb	r0, r4
c0de8930:	9000      	str	r0, [sp, #0]
c0de8932:	4650      	mov	r0, sl
c0de8934:	f7fd fa24 	bl	c0de5d80 <nbgl_layoutAddTextWithAlias>
c0de8938:	e008      	b.n	c0de894c <nbgl_pageDrawGenericContentExt+0x3e8>
c0de893a:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de893e:	f851 2024 	ldr.w	r2, [r1, r4, lsl #2]
c0de8942:	f850 1024 	ldr.w	r1, [r0, r4, lsl #2]
c0de8946:	4650      	mov	r0, sl
c0de8948:	f7fd f8d2 	bl	c0de5af0 <nbgl_layoutAddText>
c0de894c:	1a3f      	subs	r7, r7, r0
c0de894e:	b2b8      	uxth	r0, r7
c0de8950:	280b      	cmp	r0, #11
c0de8952:	d302      	bcc.n	c0de895a <nbgl_pageDrawGenericContentExt+0x3f6>
c0de8954:	4650      	mov	r0, sl
c0de8956:	f7fe f969 	bl	c0de6c2c <nbgl_layoutAddSeparationLine>
c0de895a:	3618      	adds	r6, #24
c0de895c:	3401      	adds	r4, #1
c0de895e:	e7d6      	b.n	c0de890e <nbgl_pageDrawGenericContentExt+0x3aa>
c0de8960:	f105 0110 	add.w	r1, r5, #16
c0de8964:	4650      	mov	r0, sl
c0de8966:	f7fd fad3 	bl	c0de5f10 <nbgl_layoutAddRadioChoice>
c0de896a:	4650      	mov	r0, sl
c0de896c:	f7fe feea 	bl	c0de7744 <nbgl_layoutDraw>
c0de8970:	4650      	mov	r0, sl
c0de8972:	b016      	add	sp, #88	@ 0x58
c0de8974:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de8978:	6a68      	ldr	r0, [r5, #36]	@ 0x24
c0de897a:	2800      	cmp	r0, #0
c0de897c:	d098      	beq.n	c0de88b0 <nbgl_pageDrawGenericContentExt+0x34c>
c0de897e:	6b29      	ldr	r1, [r5, #48]	@ 0x30
c0de8980:	2900      	cmp	r1, #0
c0de8982:	d095      	beq.n	c0de88b0 <nbgl_pageDrawGenericContentExt+0x34c>
c0de8984:	e9cd 010d 	strd	r0, r1, [sp, #52]	@ 0x34
c0de8988:	f895 002c 	ldrb.w	r0, [r5, #44]	@ 0x2c
c0de898c:	f895 102d 	ldrb.w	r1, [r5, #45]	@ 0x2d
c0de8990:	f895 2038 	ldrb.w	r2, [r5, #56]	@ 0x38
c0de8994:	f88d 003c 	strb.w	r0, [sp, #60]	@ 0x3c
c0de8998:	f88d 203d 	strb.w	r2, [sp, #61]	@ 0x3d
c0de899c:	f88d 103e 	strb.w	r1, [sp, #62]	@ 0x3e
c0de89a0:	a90d      	add	r1, sp, #52	@ 0x34
c0de89a2:	4650      	mov	r0, sl
c0de89a4:	f7fd ff9a 	bl	c0de68dc <nbgl_layoutAddHorizontalButtons>
c0de89a8:	e7df      	b.n	c0de896a <nbgl_pageDrawGenericContentExt+0x406>
c0de89aa:	bf00      	nop
c0de89ac:	00004981 	.word	0x00004981

c0de89b0 <nbgl_pageDrawGenericContent>:
c0de89b0:	2300      	movs	r3, #0
c0de89b2:	f7ff bdd7 	b.w	c0de8564 <nbgl_pageDrawGenericContentExt>

c0de89b6 <nbgl_pageRelease>:
c0de89b6:	f7fe bef3 	b.w	c0de77a0 <nbgl_layoutRelease>

c0de89ba <OUTLINED_FUNCTION_0>:
c0de89ba:	4650      	mov	r0, sl
c0de89bc:	2128      	movs	r1, #40	@ 0x28
c0de89be:	f7ff bc9d 	b.w	c0de82fc <addEmptyHeader>

c0de89c2 <OUTLINED_FUNCTION_1>:
c0de89c2:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de89c6:	788a      	ldrb	r2, [r1, #2]
c0de89c8:	78c9      	ldrb	r1, [r1, #3]
c0de89ca:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de89ce:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de89d2:	4770      	bx	lr

c0de89d4 <OUTLINED_FUNCTION_2>:
c0de89d4:	910e      	str	r1, [sp, #56]	@ 0x38
c0de89d6:	9011      	str	r0, [sp, #68]	@ 0x44
c0de89d8:	4650      	mov	r0, sl
c0de89da:	4631      	mov	r1, r6
c0de89dc:	f7fd bdec 	b.w	c0de65b8 <nbgl_layoutAddContentCenter>

c0de89e0 <OUTLINED_FUNCTION_3>:
c0de89e0:	7c73      	ldrb	r3, [r6, #17]
c0de89e2:	f88d 003e 	strb.w	r0, [sp, #62]	@ 0x3e
c0de89e6:	7830      	ldrb	r0, [r6, #0]
c0de89e8:	f88d 1034 	strb.w	r1, [sp, #52]	@ 0x34
c0de89ec:	4770      	bx	lr

c0de89ee <OUTLINED_FUNCTION_4>:
c0de89ee:	f895 002c 	ldrb.w	r0, [r5, #44]	@ 0x2c
c0de89f2:	f88d 003c 	strb.w	r0, [sp, #60]	@ 0x3c
c0de89f6:	f895 002d 	ldrb.w	r0, [r5, #45]	@ 0x2d
c0de89fa:	4770      	bx	lr

c0de89fc <OUTLINED_FUNCTION_5>:
c0de89fc:	f105 0110 	add.w	r1, r5, #16
c0de8a00:	4650      	mov	r0, sl
c0de8a02:	f7fd bf7f 	b.w	c0de6904 <nbgl_layoutAddTagValueList>

c0de8a06 <getNbTagValuesInPage>:
c0de8a06:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de8a0a:	4604      	mov	r4, r0
c0de8a0c:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de8a0e:	f04f 0800 	mov.w	r8, #0
c0de8a12:	2b00      	cmp	r3, #0
c0de8a14:	460e      	mov	r6, r1
c0de8a16:	f04f 0b00 	mov.w	fp, #0
c0de8a1a:	f880 8000 	strb.w	r8, [r0]
c0de8a1e:	f44f 70e8 	mov.w	r0, #464	@ 0x1d0
c0de8a22:	bf18      	it	ne
c0de8a24:	f44f 70cc 	movne.w	r0, #408	@ 0x198
c0de8a28:	0111      	lsls	r1, r2, #4
c0de8a2a:	e9cd 2001 	strd	r2, r0, [sp, #4]
c0de8a2e:	4544      	cmp	r4, r8
c0de8a30:	d052      	beq.n	c0de8ad8 <getNbTagValuesInPage+0xd2>
c0de8a32:	465d      	mov	r5, fp
c0de8a34:	f10b 0a18 	add.w	sl, fp, #24
c0de8a38:	f1b8 0f00 	cmp.w	r8, #0
c0de8a3c:	bf18      	it	ne
c0de8a3e:	4655      	movne	r5, sl
c0de8a40:	6830      	ldr	r0, [r6, #0]
c0de8a42:	9103      	str	r1, [sp, #12]
c0de8a44:	b108      	cbz	r0, c0de8a4a <getNbTagValuesInPage+0x44>
c0de8a46:	4408      	add	r0, r1
c0de8a48:	e004      	b.n	c0de8a54 <getNbTagValuesInPage+0x4e>
c0de8a4a:	9801      	ldr	r0, [sp, #4]
c0de8a4c:	6871      	ldr	r1, [r6, #4]
c0de8a4e:	4440      	add	r0, r8
c0de8a50:	b2c0      	uxtb	r0, r0
c0de8a52:	4788      	blx	r1
c0de8a54:	f003 fa8e 	bl	c0debf74 <pic>
c0de8a58:	4607      	mov	r7, r0
c0de8a5a:	7b00      	ldrb	r0, [r0, #12]
c0de8a5c:	07c1      	lsls	r1, r0, #31
c0de8a5e:	bf18      	it	ne
c0de8a60:	f1b8 0f00 	cmpne.w	r8, #0
c0de8a64:	d13b      	bne.n	c0de8ade <getNbTagValuesInPage+0xd8>
c0de8a66:	0780      	lsls	r0, r0, #30
c0de8a68:	d45d      	bmi.n	c0de8b26 <getNbTagValuesInPage+0x120>
c0de8a6a:	7b73      	ldrb	r3, [r6, #13]
c0de8a6c:	6839      	ldr	r1, [r7, #0]
c0de8a6e:	200b      	movs	r0, #11
c0de8a70:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de8a74:	46a2      	mov	sl, r4
c0de8a76:	f003 f8b5 	bl	c0debbe4 <nbgl_getTextHeightInWidth>
c0de8a7a:	182c      	adds	r4, r5, r0
c0de8a7c:	7b30      	ldrb	r0, [r6, #12]
c0de8a7e:	250b      	movs	r5, #11
c0de8a80:	7b73      	ldrb	r3, [r6, #13]
c0de8a82:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de8a86:	2800      	cmp	r0, #0
c0de8a88:	bf08      	it	eq
c0de8a8a:	250d      	moveq	r5, #13
c0de8a8c:	6879      	ldr	r1, [r7, #4]
c0de8a8e:	4628      	mov	r0, r5
c0de8a90:	f003 f8a8 	bl	c0debbe4 <nbgl_getTextHeightInWidth>
c0de8a94:	4420      	add	r0, r4
c0de8a96:	6879      	ldr	r1, [r7, #4]
c0de8a98:	7b73      	ldrb	r3, [r6, #13]
c0de8a9a:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de8a9e:	f100 0b04 	add.w	fp, r0, #4
c0de8aa2:	4628      	mov	r0, r5
c0de8aa4:	fa1f f48b 	uxth.w	r4, fp
c0de8aa8:	f003 f8a1 	bl	c0debbee <nbgl_getTextNbLinesInWidth>
c0de8aac:	9902      	ldr	r1, [sp, #8]
c0de8aae:	428c      	cmp	r4, r1
c0de8ab0:	bf38      	it	cc
c0de8ab2:	280a      	cmpcc	r0, #10
c0de8ab4:	d205      	bcs.n	c0de8ac2 <getNbTagValuesInPage+0xbc>
c0de8ab6:	9903      	ldr	r1, [sp, #12]
c0de8ab8:	f108 0801 	add.w	r8, r8, #1
c0de8abc:	4654      	mov	r4, sl
c0de8abe:	3110      	adds	r1, #16
c0de8ac0:	e7b5      	b.n	c0de8a2e <getNbTagValuesInPage+0x28>
c0de8ac2:	ea5f 6008 	movs.w	r0, r8, lsl #24
c0de8ac6:	d104      	bne.n	c0de8ad2 <getNbTagValuesInPage+0xcc>
c0de8ac8:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de8aca:	f04f 0801 	mov.w	r8, #1
c0de8ace:	f880 8000 	strb.w	r8, [r0]
c0de8ad2:	4654      	mov	r4, sl
c0de8ad4:	46da      	mov	sl, fp
c0de8ad6:	e003      	b.n	c0de8ae0 <getNbTagValuesInPage+0xda>
c0de8ad8:	46da      	mov	sl, fp
c0de8ada:	46a0      	mov	r8, r4
c0de8adc:	e000      	b.n	c0de8ae0 <getNbTagValuesInPage+0xda>
c0de8ade:	46aa      	mov	sl, r5
c0de8ae0:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de8ae2:	b170      	cbz	r0, c0de8b02 <getNbTagValuesInPage+0xfc>
c0de8ae4:	fa5f f088 	uxtb.w	r0, r8
c0de8ae8:	42a0      	cmp	r0, r4
c0de8aea:	d10a      	bne.n	c0de8b02 <getNbTagValuesInPage+0xfc>
c0de8aec:	9902      	ldr	r1, [sp, #8]
c0de8aee:	fa1f f08a 	uxth.w	r0, sl
c0de8af2:	f501 71bc 	add.w	r1, r1, #376	@ 0x178
c0de8af6:	f401 71ac 	and.w	r1, r1, #344	@ 0x158
c0de8afa:	4281      	cmp	r1, r0
c0de8afc:	bf38      	it	cc
c0de8afe:	3c01      	subcc	r4, #1
c0de8b00:	e00d      	b.n	c0de8b1e <getNbTagValuesInPage+0x118>
c0de8b02:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de8b04:	b150      	cbz	r0, c0de8b1c <getNbTagValuesInPage+0x116>
c0de8b06:	9902      	ldr	r1, [sp, #8]
c0de8b08:	fa1f f08a 	uxth.w	r0, sl
c0de8b0c:	f501 71e0 	add.w	r1, r1, #448	@ 0x1c0
c0de8b10:	f401 71ec 	and.w	r1, r1, #472	@ 0x1d8
c0de8b14:	4281      	cmp	r1, r0
c0de8b16:	bf38      	it	cc
c0de8b18:	f1a8 0801 	subcc.w	r8, r8, #1
c0de8b1c:	4644      	mov	r4, r8
c0de8b1e:	b2e0      	uxtb	r0, r4
c0de8b20:	b004      	add	sp, #16
c0de8b22:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de8b26:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de8b28:	f1b8 0f00 	cmp.w	r8, #0
c0de8b2c:	d1d9      	bne.n	c0de8ae2 <getNbTagValuesInPage+0xdc>
c0de8b2e:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de8b30:	f04f 0801 	mov.w	r8, #1
c0de8b34:	46da      	mov	sl, fp
c0de8b36:	f881 8000 	strb.w	r8, [r1]
c0de8b3a:	e7d2      	b.n	c0de8ae2 <getNbTagValuesInPage+0xdc>

c0de8b3c <nbgl_useCaseGetNbInfosInPage>:
c0de8b3c:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de8b40:	f44f 74fc 	mov.w	r4, #504	@ 0x1f8
c0de8b44:	9001      	str	r0, [sp, #4]
c0de8b46:	9300      	str	r3, [sp, #0]
c0de8b48:	2b00      	cmp	r3, #0
c0de8b4a:	4616      	mov	r6, r2
c0de8b4c:	460f      	mov	r7, r1
c0de8b4e:	bf18      	it	ne
c0de8b50:	f44f 74cc 	movne.w	r4, #408	@ 0x198
c0de8b54:	6808      	ldr	r0, [r1, #0]
c0de8b56:	f003 fa0d 	bl	c0debf74 <pic>
c0de8b5a:	eb00 0b86 	add.w	fp, r0, r6, lsl #2
c0de8b5e:	6878      	ldr	r0, [r7, #4]
c0de8b60:	f003 fa08 	bl	c0debf74 <pic>
c0de8b64:	eb00 0586 	add.w	r5, r0, r6, lsl #2
c0de8b68:	2700      	movs	r7, #0
c0de8b6a:	f04f 0800 	mov.w	r8, #0
c0de8b6e:	f04f 0a00 	mov.w	sl, #0
c0de8b72:	9801      	ldr	r0, [sp, #4]
c0de8b74:	42b8      	cmp	r0, r7
c0de8b76:	d01e      	beq.n	c0de8bb6 <nbgl_useCaseGetNbInfosInPage+0x7a>
c0de8b78:	f85b 0027 	ldr.w	r0, [fp, r7, lsl #2]
c0de8b7c:	f003 f9fa 	bl	c0debf74 <pic>
c0de8b80:	4601      	mov	r1, r0
c0de8b82:	200c      	movs	r0, #12
c0de8b84:	f002 fb2b 	bl	c0deb1de <OUTLINED_FUNCTION_2>
c0de8b88:	4606      	mov	r6, r0
c0de8b8a:	f855 0027 	ldr.w	r0, [r5, r7, lsl #2]
c0de8b8e:	f003 f9f1 	bl	c0debf74 <pic>
c0de8b92:	4601      	mov	r1, r0
c0de8b94:	200b      	movs	r0, #11
c0de8b96:	f002 fb22 	bl	c0deb1de <OUTLINED_FUNCTION_2>
c0de8b9a:	eb0a 0106 	add.w	r1, sl, r6
c0de8b9e:	4408      	add	r0, r1
c0de8ba0:	302a      	adds	r0, #42	@ 0x2a
c0de8ba2:	b280      	uxth	r0, r0
c0de8ba4:	f100 0a1a 	add.w	sl, r0, #26
c0de8ba8:	fa1f f08a 	uxth.w	r0, sl
c0de8bac:	42a0      	cmp	r0, r4
c0de8bae:	d204      	bcs.n	c0de8bba <nbgl_useCaseGetNbInfosInPage+0x7e>
c0de8bb0:	3701      	adds	r7, #1
c0de8bb2:	4680      	mov	r8, r0
c0de8bb4:	e7dd      	b.n	c0de8b72 <nbgl_useCaseGetNbInfosInPage+0x36>
c0de8bb6:	9f01      	ldr	r7, [sp, #4]
c0de8bb8:	e006      	b.n	c0de8bc8 <nbgl_useCaseGetNbInfosInPage+0x8c>
c0de8bba:	9800      	ldr	r0, [sp, #0]
c0de8bbc:	b920      	cbnz	r0, c0de8bc8 <nbgl_useCaseGetNbInfosInPage+0x8c>
c0de8bbe:	ea4f 00d8 	mov.w	r0, r8, lsr #3
c0de8bc2:	2832      	cmp	r0, #50	@ 0x32
c0de8bc4:	bf88      	it	hi
c0de8bc6:	3f01      	subhi	r7, #1
c0de8bc8:	b2f8      	uxtb	r0, r7
c0de8bca:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de8bce <nbgl_useCaseGetNbSwitchesInPage>:
c0de8bce:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de8bd2:	f44f 77fc 	mov.w	r7, #504	@ 0x1f8
c0de8bd6:	2b00      	cmp	r3, #0
c0de8bd8:	4682      	mov	sl, r0
c0de8bda:	4698      	mov	r8, r3
c0de8bdc:	4616      	mov	r6, r2
c0de8bde:	bf18      	it	ne
c0de8be0:	f44f 77cc 	movne.w	r7, #408	@ 0x198
c0de8be4:	6808      	ldr	r0, [r1, #0]
c0de8be6:	f003 f9c5 	bl	c0debf74 <pic>
c0de8bea:	eb06 0146 	add.w	r1, r6, r6, lsl #1
c0de8bee:	2600      	movs	r6, #0
c0de8bf0:	eb00 0081 	add.w	r0, r0, r1, lsl #2
c0de8bf4:	1d04      	adds	r4, r0, #4
c0de8bf6:	2000      	movs	r0, #0
c0de8bf8:	4605      	mov	r5, r0
c0de8bfa:	45b2      	cmp	sl, r6
c0de8bfc:	d010      	beq.n	c0de8c20 <nbgl_useCaseGetNbSwitchesInPage+0x52>
c0de8bfe:	6821      	ldr	r1, [r4, #0]
c0de8c00:	b129      	cbz	r1, c0de8c0e <nbgl_useCaseGetNbSwitchesInPage+0x40>
c0de8c02:	200b      	movs	r0, #11
c0de8c04:	f002 faeb 	bl	c0deb1de <OUTLINED_FUNCTION_2>
c0de8c08:	4428      	add	r0, r5
c0de8c0a:	3068      	adds	r0, #104	@ 0x68
c0de8c0c:	e001      	b.n	c0de8c12 <nbgl_useCaseGetNbSwitchesInPage+0x44>
c0de8c0e:	f105 005c 	add.w	r0, r5, #92	@ 0x5c
c0de8c12:	340c      	adds	r4, #12
c0de8c14:	3601      	adds	r6, #1
c0de8c16:	b281      	uxth	r1, r0
c0de8c18:	428f      	cmp	r7, r1
c0de8c1a:	d8ed      	bhi.n	c0de8bf8 <nbgl_useCaseGetNbSwitchesInPage+0x2a>
c0de8c1c:	f1a6 0a01 	sub.w	sl, r6, #1
c0de8c20:	b2a8      	uxth	r0, r5
c0de8c22:	2100      	movs	r1, #0
c0de8c24:	08c0      	lsrs	r0, r0, #3
c0de8c26:	2832      	cmp	r0, #50	@ 0x32
c0de8c28:	bf88      	it	hi
c0de8c2a:	2101      	movhi	r1, #1
c0de8c2c:	ea21 0008 	bic.w	r0, r1, r8
c0de8c30:	ebaa 0000 	sub.w	r0, sl, r0
c0de8c34:	b2c0      	uxtb	r0, r0
c0de8c36:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}

c0de8c3a <nbgl_useCaseGetNbBarsInPage>:
c0de8c3a:	b570      	push	{r4, r5, r6, lr}
c0de8c3c:	f44f 71fc 	mov.w	r1, #504	@ 0x1f8
c0de8c40:	2b00      	cmp	r3, #0
c0de8c42:	bf18      	it	ne
c0de8c44:	f44f 71cc 	movne.w	r1, #408	@ 0x198
c0de8c48:	2200      	movs	r2, #0
c0de8c4a:	2400      	movs	r4, #0
c0de8c4c:	2500      	movs	r5, #0
c0de8c4e:	b2ee      	uxtb	r6, r5
c0de8c50:	4286      	cmp	r6, r0
c0de8c52:	d208      	bcs.n	c0de8c66 <nbgl_useCaseGetNbBarsInPage+0x2c>
c0de8c54:	b292      	uxth	r2, r2
c0de8c56:	325c      	adds	r2, #92	@ 0x5c
c0de8c58:	b296      	uxth	r6, r2
c0de8c5a:	428e      	cmp	r6, r1
c0de8c5c:	d202      	bcs.n	c0de8c64 <nbgl_useCaseGetNbBarsInPage+0x2a>
c0de8c5e:	3501      	adds	r5, #1
c0de8c60:	4634      	mov	r4, r6
c0de8c62:	e7f4      	b.n	c0de8c4e <nbgl_useCaseGetNbBarsInPage+0x14>
c0de8c64:	4628      	mov	r0, r5
c0de8c66:	08e1      	lsrs	r1, r4, #3
c0de8c68:	2200      	movs	r2, #0
c0de8c6a:	2932      	cmp	r1, #50	@ 0x32
c0de8c6c:	bf88      	it	hi
c0de8c6e:	2201      	movhi	r2, #1
c0de8c70:	ea22 0103 	bic.w	r1, r2, r3
c0de8c74:	1a40      	subs	r0, r0, r1
c0de8c76:	b2c0      	uxtb	r0, r0
c0de8c78:	bd70      	pop	{r4, r5, r6, pc}

c0de8c7a <nbgl_useCaseGetNbChoicesInPage>:
c0de8c7a:	b570      	push	{r4, r5, r6, lr}
c0de8c7c:	f44f 72fc 	mov.w	r2, #504	@ 0x1f8
c0de8c80:	2b00      	cmp	r3, #0
c0de8c82:	bf18      	it	ne
c0de8c84:	f44f 72cc 	movne.w	r2, #408	@ 0x198
c0de8c88:	2400      	movs	r4, #0
c0de8c8a:	2500      	movs	r5, #0
c0de8c8c:	2100      	movs	r1, #0
c0de8c8e:	b2ce      	uxtb	r6, r1
c0de8c90:	4286      	cmp	r6, r0
c0de8c92:	d207      	bcs.n	c0de8ca4 <nbgl_useCaseGetNbChoicesInPage+0x2a>
c0de8c94:	b2a4      	uxth	r4, r4
c0de8c96:	345c      	adds	r4, #92	@ 0x5c
c0de8c98:	b2a6      	uxth	r6, r4
c0de8c9a:	4296      	cmp	r6, r2
c0de8c9c:	d204      	bcs.n	c0de8ca8 <nbgl_useCaseGetNbChoicesInPage+0x2e>
c0de8c9e:	3101      	adds	r1, #1
c0de8ca0:	4635      	mov	r5, r6
c0de8ca2:	e7f4      	b.n	c0de8c8e <nbgl_useCaseGetNbChoicesInPage+0x14>
c0de8ca4:	4601      	mov	r1, r0
c0de8ca6:	e004      	b.n	c0de8cb2 <nbgl_useCaseGetNbChoicesInPage+0x38>
c0de8ca8:	b91b      	cbnz	r3, c0de8cb2 <nbgl_useCaseGetNbChoicesInPage+0x38>
c0de8caa:	08e8      	lsrs	r0, r5, #3
c0de8cac:	2832      	cmp	r0, #50	@ 0x32
c0de8cae:	bf88      	it	hi
c0de8cb0:	3901      	subhi	r1, #1
c0de8cb2:	b2c8      	uxtb	r0, r1
c0de8cb4:	bd70      	pop	{r4, r5, r6, pc}
	...

c0de8cb8 <useCaseHomeExt>:
c0de8cb8:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de8cbc:	b08f      	sub	sp, #60	@ 0x3c
c0de8cbe:	4604      	mov	r4, r0
c0de8cc0:	a802      	add	r0, sp, #8
c0de8cc2:	460f      	mov	r7, r1
c0de8cc4:	2130      	movs	r1, #48	@ 0x30
c0de8cc6:	461e      	mov	r6, r3
c0de8cc8:	4615      	mov	r5, r2
c0de8cca:	3004      	adds	r0, #4
c0de8ccc:	f003 fb74 	bl	c0dec3b8 <__aeabi_memclr>
c0de8cd0:	2009      	movs	r0, #9
c0de8cd2:	f88d 0039 	strb.w	r0, [sp, #57]	@ 0x39
c0de8cd6:	2006      	movs	r0, #6
c0de8cd8:	f88d 001e 	strb.w	r0, [sp, #30]
c0de8cdc:	2004      	movs	r0, #4
c0de8cde:	f88d 001d 	strb.w	r0, [sp, #29]
c0de8ce2:	2003      	movs	r0, #3
c0de8ce4:	2e00      	cmp	r6, #0
c0de8ce6:	bf18      	it	ne
c0de8ce8:	2001      	movne	r0, #1
c0de8cea:	f88d 001c 	strb.w	r0, [sp, #28]
c0de8cee:	9705      	str	r7, [sp, #20]
c0de8cf0:	9402      	str	r4, [sp, #8]
c0de8cf2:	f000 f87b 	bl	c0de8dec <reset_callbacks_and_context>
c0de8cf6:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de8cf8:	e9d0 1200 	ldrd	r1, r2, [r0]
c0de8cfc:	b951      	cbnz	r1, c0de8d14 <useCaseHomeExt+0x5c>
c0de8cfe:	b94a      	cbnz	r2, c0de8d14 <useCaseHomeExt+0x5c>
c0de8d00:	4831      	ldr	r0, [pc, #196]	@ (c0de8dc8 <useCaseHomeExt+0x110>)
c0de8d02:	2100      	movs	r1, #0
c0de8d04:	e9cd 110c 	strd	r1, r1, [sp, #48]	@ 0x30
c0de8d08:	4448      	add	r0, r9
c0de8d0a:	6241      	str	r1, [r0, #36]	@ 0x24
c0de8d0c:	2002      	movs	r0, #2
c0de8d0e:	f88d 001f 	strb.w	r0, [sp, #31]
c0de8d12:	e00e      	b.n	c0de8d32 <useCaseHomeExt+0x7a>
c0de8d14:	4b2c      	ldr	r3, [pc, #176]	@ (c0de8dc8 <useCaseHomeExt+0x110>)
c0de8d16:	6886      	ldr	r6, [r0, #8]
c0de8d18:	e9cd 120c 	strd	r1, r2, [sp, #48]	@ 0x30
c0de8d1c:	444b      	add	r3, r9
c0de8d1e:	625e      	str	r6, [r3, #36]	@ 0x24
c0de8d20:	2308      	movs	r3, #8
c0de8d22:	7b00      	ldrb	r0, [r0, #12]
c0de8d24:	f88d 301f 	strb.w	r3, [sp, #31]
c0de8d28:	2800      	cmp	r0, #0
c0de8d2a:	bf18      	it	ne
c0de8d2c:	2001      	movne	r0, #1
c0de8d2e:	f88d 0038 	strb.w	r0, [sp, #56]	@ 0x38
c0de8d32:	e9dd a817 	ldrd	sl, r8, [sp, #92]	@ 0x5c
c0de8d36:	bb8d      	cbnz	r5, c0de8d9c <useCaseHomeExt+0xe4>
c0de8d38:	4620      	mov	r0, r4
c0de8d3a:	f003 fba9 	bl	c0dec490 <strlen>
c0de8d3e:	4e24      	ldr	r6, [pc, #144]	@ (c0de8dd0 <useCaseHomeExt+0x118>)
c0de8d40:	2814      	cmp	r0, #20
c0de8d42:	447e      	add	r6, pc
c0de8d44:	d307      	bcc.n	c0de8d56 <useCaseHomeExt+0x9e>
c0de8d46:	4821      	ldr	r0, [pc, #132]	@ (c0de8dcc <useCaseHomeExt+0x114>)
c0de8d48:	4922      	ldr	r1, [pc, #136]	@ (c0de8dd4 <useCaseHomeExt+0x11c>)
c0de8d4a:	2236      	movs	r2, #54	@ 0x36
c0de8d4c:	4448      	add	r0, r9
c0de8d4e:	4479      	add	r1, pc
c0de8d50:	f003 fb28 	bl	c0dec3a4 <__aeabi_memcpy>
c0de8d54:	e00a      	b.n	c0de8d6c <useCaseHomeExt+0xb4>
c0de8d56:	e9cd 4600 	strd	r4, r6, [sp]
c0de8d5a:	481c      	ldr	r0, [pc, #112]	@ (c0de8dcc <useCaseHomeExt+0x114>)
c0de8d5c:	214a      	movs	r1, #74	@ 0x4a
c0de8d5e:	4a1e      	ldr	r2, [pc, #120]	@ (c0de8dd8 <useCaseHomeExt+0x120>)
c0de8d60:	4b1e      	ldr	r3, [pc, #120]	@ (c0de8ddc <useCaseHomeExt+0x124>)
c0de8d62:	4448      	add	r0, r9
c0de8d64:	447a      	add	r2, pc
c0de8d66:	447b      	add	r3, pc
c0de8d68:	f002 ff72 	bl	c0debc50 <snprintf>
c0de8d6c:	4f17      	ldr	r7, [pc, #92]	@ (c0de8dcc <useCaseHomeExt+0x114>)
c0de8d6e:	200b      	movs	r0, #11
c0de8d70:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de8d74:	2300      	movs	r3, #0
c0de8d76:	eb09 0507 	add.w	r5, r9, r7
c0de8d7a:	4629      	mov	r1, r5
c0de8d7c:	f002 ff37 	bl	c0debbee <nbgl_getTextNbLinesInWidth>
c0de8d80:	2804      	cmp	r0, #4
c0de8d82:	d30b      	bcc.n	c0de8d9c <useCaseHomeExt+0xe4>
c0de8d84:	e9cd 4600 	strd	r4, r6, [sp]
c0de8d88:	eb09 0507 	add.w	r5, r9, r7
c0de8d8c:	214a      	movs	r1, #74	@ 0x4a
c0de8d8e:	4a14      	ldr	r2, [pc, #80]	@ (c0de8de0 <useCaseHomeExt+0x128>)
c0de8d90:	4b14      	ldr	r3, [pc, #80]	@ (c0de8de4 <useCaseHomeExt+0x12c>)
c0de8d92:	4628      	mov	r0, r5
c0de8d94:	447a      	add	r2, pc
c0de8d96:	447b      	add	r3, pc
c0de8d98:	f002 ff5a 	bl	c0debc50 <snprintf>
c0de8d9c:	480a      	ldr	r0, [pc, #40]	@ (c0de8dc8 <useCaseHomeExt+0x110>)
c0de8d9e:	9503      	str	r5, [sp, #12]
c0de8da0:	2100      	movs	r1, #0
c0de8da2:	eb09 0400 	add.w	r4, r9, r0
c0de8da6:	f8c4 a028 	str.w	sl, [r4, #40]	@ 0x28
c0de8daa:	f8c4 8004 	str.w	r8, [r4, #4]
c0de8dae:	480e      	ldr	r0, [pc, #56]	@ (c0de8de8 <useCaseHomeExt+0x130>)
c0de8db0:	aa02      	add	r2, sp, #8
c0de8db2:	4478      	add	r0, pc
c0de8db4:	f7ff faac 	bl	c0de8310 <nbgl_pageDrawInfo>
c0de8db8:	6160      	str	r0, [r4, #20]
c0de8dba:	2002      	movs	r0, #2
c0de8dbc:	f002 fec2 	bl	c0debb44 <nbgl_refreshSpecial>
c0de8dc0:	b00f      	add	sp, #60	@ 0x3c
c0de8dc2:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de8dc6:	bf00      	nop
c0de8dc8:	00001bc8 	.word	0x00001bc8
c0de8dcc:	00001a48 	.word	0x00001a48
c0de8dd0:	000051c1 	.word	0x000051c1
c0de8dd4:	00006a1a 	.word	0x00006a1a
c0de8dd8:	00004cd4 	.word	0x00004cd4
c0de8ddc:	0000542c 	.word	0x0000542c
c0de8de0:	00004d3e 	.word	0x00004d3e
c0de8de4:	000053fc 	.word	0x000053fc
c0de8de8:	000008fb 	.word	0x000008fb

c0de8dec <reset_callbacks_and_context>:
c0de8dec:	b580      	push	{r7, lr}
c0de8dee:	4808      	ldr	r0, [pc, #32]	@ (c0de8e10 <reset_callbacks_and_context+0x24>)
c0de8df0:	2100      	movs	r1, #0
c0de8df2:	4448      	add	r0, r9
c0de8df4:	e9c0 1109 	strd	r1, r1, [r0, #36]	@ 0x24
c0de8df8:	62c1      	str	r1, [r0, #44]	@ 0x2c
c0de8dfa:	e9c0 1101 	strd	r1, r1, [r0, #4]
c0de8dfe:	60c1      	str	r1, [r0, #12]
c0de8e00:	6181      	str	r1, [r0, #24]
c0de8e02:	4804      	ldr	r0, [pc, #16]	@ (c0de8e14 <reset_callbacks_and_context+0x28>)
c0de8e04:	216c      	movs	r1, #108	@ 0x6c
c0de8e06:	4448      	add	r0, r9
c0de8e08:	f003 fad6 	bl	c0dec3b8 <__aeabi_memclr>
c0de8e0c:	bd80      	pop	{r7, pc}
c0de8e0e:	bf00      	nop
c0de8e10:	00001bc8 	.word	0x00001bc8
c0de8e14:	000018fc 	.word	0x000018fc

c0de8e18 <prepareNavInfo>:
c0de8e18:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de8e1c:	4f1b      	ldr	r7, [pc, #108]	@ (c0de8e8c <prepareNavInfo+0x74>)
c0de8e1e:	460c      	mov	r4, r1
c0de8e20:	4606      	mov	r6, r0
c0de8e22:	211c      	movs	r1, #28
c0de8e24:	4690      	mov	r8, r2
c0de8e26:	eb09 0507 	add.w	r5, r9, r7
c0de8e2a:	f105 0060 	add.w	r0, r5, #96	@ 0x60
c0de8e2e:	f003 fac3 	bl	c0dec3b8 <__aeabi_memclr>
c0de8e32:	2009      	movs	r0, #9
c0de8e34:	f885 4061 	strb.w	r4, [r5, #97]	@ 0x61
c0de8e38:	f885 0065 	strb.w	r0, [r5, #101]	@ 0x65
c0de8e3c:	2001      	movs	r0, #1
c0de8e3e:	f885 0063 	strb.w	r0, [r5, #99]	@ 0x63
c0de8e42:	b1ce      	cbz	r6, c0de8e78 <prepareNavInfo+0x60>
c0de8e44:	eb09 0007 	add.w	r0, r9, r7
c0de8e48:	210c      	movs	r1, #12
c0de8e4a:	f880 1062 	strb.w	r1, [r0, #98]	@ 0x62
c0de8e4e:	2103      	movs	r1, #3
c0de8e50:	f8c0 8074 	str.w	r8, [r0, #116]	@ 0x74
c0de8e54:	f880 1073 	strb.w	r1, [r0, #115]	@ 0x73
c0de8e58:	f819 1007 	ldrb.w	r1, [r9, r7]
c0de8e5c:	3903      	subs	r1, #3
c0de8e5e:	bf18      	it	ne
c0de8e60:	2101      	movne	r1, #1
c0de8e62:	2200      	movs	r2, #0
c0de8e64:	f880 1072 	strb.w	r1, [r0, #114]	@ 0x72
c0de8e68:	2c01      	cmp	r4, #1
c0de8e6a:	bf88      	it	hi
c0de8e6c:	2201      	movhi	r2, #1
c0de8e6e:	4311      	orrs	r1, r2
c0de8e70:	f880 1071 	strb.w	r1, [r0, #113]	@ 0x71
c0de8e74:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de8e78:	eb09 0107 	add.w	r1, r9, r7
c0de8e7c:	f881 0071 	strb.w	r0, [r1, #113]	@ 0x71
c0de8e80:	2003      	movs	r0, #3
c0de8e82:	f881 0073 	strb.w	r0, [r1, #115]	@ 0x73
c0de8e86:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de8e8a:	bf00      	nop
c0de8e8c:	00001bc8 	.word	0x00001bc8

c0de8e90 <displaySettingsPage>:
c0de8e90:	b570      	push	{r4, r5, r6, lr}
c0de8e92:	b090      	sub	sp, #64	@ 0x40
c0de8e94:	460c      	mov	r4, r1
c0de8e96:	4605      	mov	r5, r0
c0de8e98:	4668      	mov	r0, sp
c0de8e9a:	2140      	movs	r1, #64	@ 0x40
c0de8e9c:	f003 fa8c 	bl	c0dec3b8 <__aeabi_memclr>
c0de8ea0:	4e12      	ldr	r6, [pc, #72]	@ (c0de8eec <displaySettingsPage+0x5c>)
c0de8ea2:	eb09 0006 	add.w	r0, r9, r6
c0de8ea6:	6882      	ldr	r2, [r0, #8]
c0de8ea8:	b1f2      	cbz	r2, c0de8ee8 <displaySettingsPage+0x58>
c0de8eaa:	4669      	mov	r1, sp
c0de8eac:	4628      	mov	r0, r5
c0de8eae:	4790      	blx	r2
c0de8eb0:	b1d0      	cbz	r0, c0de8ee8 <displaySettingsPage+0x58>
c0de8eb2:	444e      	add	r6, r9
c0de8eb4:	2009      	movs	r0, #9
c0de8eb6:	466a      	mov	r2, sp
c0de8eb8:	f88d 0006 	strb.w	r0, [sp, #6]
c0de8ebc:	f240 2001 	movw	r0, #513	@ 0x201
c0de8ec0:	f806 5f60 	strb.w	r5, [r6, #96]!
c0de8ec4:	f8ad 0004 	strh.w	r0, [sp, #4]
c0de8ec8:	f856 0c50 	ldr.w	r0, [r6, #-80]
c0de8ecc:	4631      	mov	r1, r6
c0de8ece:	9000      	str	r0, [sp, #0]
c0de8ed0:	4807      	ldr	r0, [pc, #28]	@ (c0de8ef0 <displaySettingsPage+0x60>)
c0de8ed2:	4478      	add	r0, pc
c0de8ed4:	f7ff fd6c 	bl	c0de89b0 <nbgl_pageDrawGenericContent>
c0de8ed8:	f846 0c4c 	str.w	r0, [r6, #-76]
c0de8edc:	2001      	movs	r0, #1
c0de8ede:	2c00      	cmp	r4, #0
c0de8ee0:	bf18      	it	ne
c0de8ee2:	2002      	movne	r0, #2
c0de8ee4:	f002 fe2e 	bl	c0debb44 <nbgl_refreshSpecial>
c0de8ee8:	b010      	add	sp, #64	@ 0x40
c0de8eea:	bd70      	pop	{r4, r5, r6, pc}
c0de8eec:	00001bc8 	.word	0x00001bc8
c0de8ef0:	000007db 	.word	0x000007db

c0de8ef4 <nbgl_useCaseGenericSettings>:
c0de8ef4:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de8ef8:	461d      	mov	r5, r3
c0de8efa:	4616      	mov	r6, r2
c0de8efc:	4688      	mov	r8, r1
c0de8efe:	4607      	mov	r7, r0
c0de8f00:	f7ff ff74 	bl	c0de8dec <reset_callbacks_and_context>
c0de8f04:	4c25      	ldr	r4, [pc, #148]	@ (c0de8f9c <nbgl_useCaseGenericSettings+0xa8>)
c0de8f06:	2002      	movs	r0, #2
c0de8f08:	f809 0004 	strb.w	r0, [r9, r4]
c0de8f0c:	eb09 0004 	add.w	r0, r9, r4
c0de8f10:	6107      	str	r7, [r0, #16]
c0de8f12:	9906      	ldr	r1, [sp, #24]
c0de8f14:	6041      	str	r1, [r0, #4]
c0de8f16:	b12e      	cbz	r6, c0de8f24 <nbgl_useCaseGenericSettings+0x30>
c0de8f18:	4821      	ldr	r0, [pc, #132]	@ (c0de8fa0 <nbgl_useCaseGenericSettings+0xac>)
c0de8f1a:	e896 000e 	ldmia.w	r6, {r1, r2, r3}
c0de8f1e:	4448      	add	r0, r9
c0de8f20:	3004      	adds	r0, #4
c0de8f22:	c00e      	stmia	r0!, {r1, r2, r3}
c0de8f24:	b1a5      	cbz	r5, c0de8f50 <nbgl_useCaseGenericSettings+0x5c>
c0de8f26:	481e      	ldr	r0, [pc, #120]	@ (c0de8fa0 <nbgl_useCaseGenericSettings+0xac>)
c0de8f28:	2101      	movs	r1, #1
c0de8f2a:	4448      	add	r0, r9
c0de8f2c:	7501      	strb	r1, [r0, #20]
c0de8f2e:	481d      	ldr	r0, [pc, #116]	@ (c0de8fa4 <nbgl_useCaseGenericSettings+0xb0>)
c0de8f30:	2138      	movs	r1, #56	@ 0x38
c0de8f32:	eb09 0600 	add.w	r6, r9, r0
c0de8f36:	f106 0038 	add.w	r0, r6, #56	@ 0x38
c0de8f3a:	f003 fa3d 	bl	c0dec3b8 <__aeabi_memclr>
c0de8f3e:	2008      	movs	r0, #8
c0de8f40:	4629      	mov	r1, r5
c0de8f42:	2230      	movs	r2, #48	@ 0x30
c0de8f44:	f886 0038 	strb.w	r0, [r6, #56]	@ 0x38
c0de8f48:	f106 003c 	add.w	r0, r6, #60	@ 0x3c
c0de8f4c:	f003 fa2a 	bl	c0dec3a4 <__aeabi_memcpy>
c0de8f50:	f002 f956 	bl	c0deb200 <OUTLINED_FUNCTION_5>
c0de8f54:	4606      	mov	r6, r0
c0de8f56:	b145      	cbz	r5, c0de8f6a <nbgl_useCaseGenericSettings+0x76>
c0de8f58:	4812      	ldr	r0, [pc, #72]	@ (c0de8fa4 <nbgl_useCaseGenericSettings+0xb0>)
c0de8f5a:	4631      	mov	r1, r6
c0de8f5c:	2201      	movs	r2, #1
c0de8f5e:	2300      	movs	r3, #0
c0de8f60:	4448      	add	r0, r9
c0de8f62:	3038      	adds	r0, #56	@ 0x38
c0de8f64:	f000 f848 	bl	c0de8ff8 <getNbPagesForContent>
c0de8f68:	4406      	add	r6, r0
c0de8f6a:	444c      	add	r4, r9
c0de8f6c:	211c      	movs	r1, #28
c0de8f6e:	f104 0060 	add.w	r0, r4, #96	@ 0x60
c0de8f72:	f003 fa21 	bl	c0dec3b8 <__aeabi_memclr>
c0de8f76:	2009      	movs	r0, #9
c0de8f78:	f884 6061 	strb.w	r6, [r4, #97]	@ 0x61
c0de8f7c:	2101      	movs	r1, #1
c0de8f7e:	f884 0065 	strb.w	r0, [r4, #101]	@ 0x65
c0de8f82:	2003      	movs	r0, #3
c0de8f84:	f884 0073 	strb.w	r0, [r4, #115]	@ 0x73
c0de8f88:	2001      	movs	r0, #1
c0de8f8a:	f884 0063 	strb.w	r0, [r4, #99]	@ 0x63
c0de8f8e:	f884 0071 	strb.w	r0, [r4, #113]	@ 0x71
c0de8f92:	4640      	mov	r0, r8
c0de8f94:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de8f98:	f000 b8c0 	b.w	c0de911c <displayGenericContextPage>
c0de8f9c:	00001bc8 	.word	0x00001bc8
c0de8fa0:	000018fc 	.word	0x000018fc
c0de8fa4:	00001968 	.word	0x00001968

c0de8fa8 <getNbPagesForGenericContents>:
c0de8fa8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de8fac:	b08e      	sub	sp, #56	@ 0x38
c0de8fae:	4f11      	ldr	r7, [pc, #68]	@ (c0de8ff4 <getNbPagesForGenericContents+0x4c>)
c0de8fb0:	4604      	mov	r4, r0
c0de8fb2:	2600      	movs	r6, #0
c0de8fb4:	46e8      	mov	r8, sp
c0de8fb6:	2500      	movs	r5, #0
c0de8fb8:	eb09 0007 	add.w	r0, r9, r7
c0de8fbc:	7b00      	ldrb	r0, [r0, #12]
c0de8fbe:	4285      	cmp	r5, r0
c0de8fc0:	d214      	bcs.n	c0de8fec <getNbPagesForGenericContents+0x44>
c0de8fc2:	b268      	sxtb	r0, r5
c0de8fc4:	4641      	mov	r1, r8
c0de8fc6:	f001 fabb 	bl	c0dea540 <getContentAtIdx>
c0de8fca:	b170      	cbz	r0, c0de8fea <getNbPagesForGenericContents+0x42>
c0de8fcc:	eb09 0107 	add.w	r1, r9, r7
c0de8fd0:	4623      	mov	r3, r4
c0de8fd2:	7b09      	ldrb	r1, [r1, #12]
c0de8fd4:	1a69      	subs	r1, r5, r1
c0de8fd6:	3101      	adds	r1, #1
c0de8fd8:	fab1 f181 	clz	r1, r1
c0de8fdc:	094a      	lsrs	r2, r1, #5
c0de8fde:	b2f1      	uxtb	r1, r6
c0de8fe0:	f000 f80a 	bl	c0de8ff8 <getNbPagesForContent>
c0de8fe4:	4406      	add	r6, r0
c0de8fe6:	3501      	adds	r5, #1
c0de8fe8:	e7e6      	b.n	c0de8fb8 <getNbPagesForGenericContents+0x10>
c0de8fea:	2600      	movs	r6, #0
c0de8fec:	b2f0      	uxtb	r0, r6
c0de8fee:	b00e      	add	sp, #56	@ 0x38
c0de8ff0:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de8ff4:	000018fc 	.word	0x000018fc

c0de8ff8 <getNbPagesForContent>:
c0de8ff8:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8ffc:	b08c      	sub	sp, #48	@ 0x30
c0de8ffe:	4606      	mov	r6, r0
c0de9000:	fab1 f081 	clz	r0, r1
c0de9004:	9306      	str	r3, [sp, #24]
c0de9006:	4614      	mov	r4, r2
c0de9008:	9109      	str	r1, [sp, #36]	@ 0x24
c0de900a:	0940      	lsrs	r0, r0, #5
c0de900c:	4010      	ands	r0, r2
c0de900e:	900a      	str	r0, [sp, #40]	@ 0x28
c0de9010:	4630      	mov	r0, r6
c0de9012:	f001 fabf 	bl	c0dea594 <getContentNbElement>
c0de9016:	4605      	mov	r5, r0
c0de9018:	f084 0001 	eor.w	r0, r4, #1
c0de901c:	f04f 0800 	mov.w	r8, #0
c0de9020:	f04f 0a00 	mov.w	sl, #0
c0de9024:	f04f 0b00 	mov.w	fp, #0
c0de9028:	270f      	movs	r7, #15
c0de902a:	9405      	str	r4, [sp, #20]
c0de902c:	9608      	str	r6, [sp, #32]
c0de902e:	9004      	str	r0, [sp, #16]
c0de9030:	1d30      	adds	r0, r6, #4
c0de9032:	9007      	str	r0, [sp, #28]
c0de9034:	0628      	lsls	r0, r5, #24
c0de9036:	d068      	beq.n	c0de910a <getNbPagesForContent+0x112>
c0de9038:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de903a:	f88d 802f 	strb.w	r8, [sp, #47]	@ 0x2f
c0de903e:	b128      	cbz	r0, c0de904c <getNbPagesForContent+0x54>
c0de9040:	fa5f f38b 	uxtb.w	r3, fp
c0de9044:	2b00      	cmp	r3, #0
c0de9046:	bf18      	it	ne
c0de9048:	2301      	movne	r3, #1
c0de904a:	e000      	b.n	c0de904e <getNbPagesForContent+0x56>
c0de904c:	2301      	movs	r3, #1
c0de904e:	9808      	ldr	r0, [sp, #32]
c0de9050:	7800      	ldrb	r0, [r0, #0]
c0de9052:	280a      	cmp	r0, #10
c0de9054:	d00e      	beq.n	c0de9074 <getNbPagesForContent+0x7c>
c0de9056:	2806      	cmp	r0, #6
c0de9058:	d011      	beq.n	c0de907e <getNbPagesForContent+0x86>
c0de905a:	2807      	cmp	r0, #7
c0de905c:	d01e      	beq.n	c0de909c <getNbPagesForContent+0xa4>
c0de905e:	2808      	cmp	r0, #8
c0de9060:	d023      	beq.n	c0de90aa <getNbPagesForContent+0xb2>
c0de9062:	2809      	cmp	r0, #9
c0de9064:	d028      	beq.n	c0de90b8 <getNbPagesForContent+0xc0>
c0de9066:	2804      	cmp	r0, #4
c0de9068:	d12b      	bne.n	c0de90c2 <getNbPagesForContent+0xca>
c0de906a:	2000      	movs	r0, #0
c0de906c:	f04f 0800 	mov.w	r8, #0
c0de9070:	9000      	str	r0, [sp, #0]
c0de9072:	e007      	b.n	c0de9084 <getNbPagesForContent+0x8c>
c0de9074:	b2e8      	uxtb	r0, r5
c0de9076:	2200      	movs	r2, #0
c0de9078:	f7ff fddf 	bl	c0de8c3a <nbgl_useCaseGetNbBarsInPage>
c0de907c:	e028      	b.n	c0de90d0 <getNbPagesForContent+0xd8>
c0de907e:	9805      	ldr	r0, [sp, #20]
c0de9080:	9000      	str	r0, [sp, #0]
c0de9082:	9804      	ldr	r0, [sp, #16]
c0de9084:	9001      	str	r0, [sp, #4]
c0de9086:	f10d 002f 	add.w	r0, sp, #47	@ 0x2f
c0de908a:	e9dd 3106 	ldrd	r3, r1, [sp, #24]
c0de908e:	fa5f f28b 	uxtb.w	r2, fp
c0de9092:	9002      	str	r0, [sp, #8]
c0de9094:	b2e8      	uxtb	r0, r5
c0de9096:	f7ff fcb6 	bl	c0de8a06 <getNbTagValuesInPage>
c0de909a:	e019      	b.n	c0de90d0 <getNbPagesForContent+0xd8>
c0de909c:	9907      	ldr	r1, [sp, #28]
c0de909e:	b2e8      	uxtb	r0, r5
c0de90a0:	fa5f f28b 	uxtb.w	r2, fp
c0de90a4:	f7ff fd93 	bl	c0de8bce <nbgl_useCaseGetNbSwitchesInPage>
c0de90a8:	e012      	b.n	c0de90d0 <getNbPagesForContent+0xd8>
c0de90aa:	9907      	ldr	r1, [sp, #28]
c0de90ac:	b2e8      	uxtb	r0, r5
c0de90ae:	fa5f f28b 	uxtb.w	r2, fp
c0de90b2:	f7ff fd43 	bl	c0de8b3c <nbgl_useCaseGetNbInfosInPage>
c0de90b6:	e00b      	b.n	c0de90d0 <getNbPagesForContent+0xd8>
c0de90b8:	b2e8      	uxtb	r0, r5
c0de90ba:	2200      	movs	r2, #0
c0de90bc:	f7ff fddd 	bl	c0de8c7a <nbgl_useCaseGetNbChoicesInPage>
c0de90c0:	e006      	b.n	c0de90d0 <getNbPagesForContent+0xd8>
c0de90c2:	4915      	ldr	r1, [pc, #84]	@ (c0de9118 <getNbPagesForContent+0x120>)
c0de90c4:	4479      	add	r1, pc
c0de90c6:	5c08      	ldrb	r0, [r1, r0]
c0de90c8:	b2e9      	uxtb	r1, r5
c0de90ca:	4288      	cmp	r0, r1
c0de90cc:	bf28      	it	cs
c0de90ce:	4628      	movcs	r0, r5
c0de90d0:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0de90d2:	f89d 402f 	ldrb.w	r4, [sp, #47]	@ 0x2f
c0de90d6:	f000 0307 	and.w	r3, r0, #7
c0de90da:	2204      	movs	r2, #4
c0de90dc:	1a2d      	subs	r5, r5, r0
c0de90de:	4483      	add	fp, r0
c0de90e0:	4451      	add	r1, sl
c0de90e2:	ea43 03c4 	orr.w	r3, r3, r4, lsl #3
c0de90e6:	4c0b      	ldr	r4, [pc, #44]	@ (c0de9114 <getNbPagesForContent+0x11c>)
c0de90e8:	f10a 0a01 	add.w	sl, sl, #1
c0de90ec:	b2c9      	uxtb	r1, r1
c0de90ee:	b2db      	uxtb	r3, r3
c0de90f0:	ea02 0281 	and.w	r2, r2, r1, lsl #2
c0de90f4:	444c      	add	r4, r9
c0de90f6:	0849      	lsrs	r1, r1, #1
c0de90f8:	5c66      	ldrb	r6, [r4, r1]
c0de90fa:	4093      	lsls	r3, r2
c0de90fc:	fa07 f202 	lsl.w	r2, r7, r2
c0de9100:	ea26 0202 	bic.w	r2, r6, r2
c0de9104:	431a      	orrs	r2, r3
c0de9106:	5462      	strb	r2, [r4, r1]
c0de9108:	e794      	b.n	c0de9034 <getNbPagesForContent+0x3c>
c0de910a:	fa5f f08a 	uxtb.w	r0, sl
c0de910e:	b00c      	add	sp, #48	@ 0x30
c0de9110:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de9114:	00001ac8 	.word	0x00001ac8
c0de9118:	000066da 	.word	0x000066da

c0de911c <displayGenericContextPage>:
c0de911c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9120:	b0a0      	sub	sp, #128	@ 0x80
c0de9122:	f8df 23e0 	ldr.w	r2, [pc, #992]	@ c0de9504 <displayGenericContextPage+0x3e8>
c0de9126:	4683      	mov	fp, r0
c0de9128:	f819 0002 	ldrb.w	r0, [r9, r2]
c0de912c:	2803      	cmp	r0, #3
c0de912e:	d10f      	bne.n	c0de9150 <displayGenericContextPage+0x34>
c0de9130:	f8df 03d4 	ldr.w	r0, [pc, #980]	@ c0de9508 <displayGenericContextPage+0x3ec>
c0de9134:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de9138:	4448      	add	r0, r9
c0de913a:	d05f      	beq.n	c0de91fc <displayGenericContextPage+0xe0>
c0de913c:	f890 0030 	ldrb.w	r0, [r0, #48]	@ 0x30
c0de9140:	4558      	cmp	r0, fp
c0de9142:	d80e      	bhi.n	c0de9162 <displayGenericContextPage+0x46>
c0de9144:	2001      	movs	r0, #1
c0de9146:	b020      	add	sp, #128	@ 0x80
c0de9148:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de914c:	f001 b854 	b.w	c0dea1f8 <bundleNavReviewStreamingChoice>
c0de9150:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de9154:	d105      	bne.n	c0de9162 <displayGenericContextPage+0x46>
c0de9156:	eb09 0002 	add.w	r0, r9, r2
c0de915a:	f890 0061 	ldrb.w	r0, [r0, #97]	@ 0x61
c0de915e:	f1a0 0b01 	sub.w	fp, r0, #1
c0de9162:	eb09 0002 	add.w	r0, r9, r2
c0de9166:	fa5f f78b 	uxtb.w	r7, fp
c0de916a:	9100      	str	r1, [sp, #0]
c0de916c:	f890 8060 	ldrb.w	r8, [r0, #96]	@ 0x60
c0de9170:	4547      	cmp	r7, r8
c0de9172:	d12e      	bne.n	c0de91d2 <displayGenericContextPage+0xb6>
c0de9174:	a912      	add	r1, sp, #72	@ 0x48
c0de9176:	f10d 0247 	add.w	r2, sp, #71	@ 0x47
c0de917a:	f10d 0346 	add.w	r3, sp, #70	@ 0x46
c0de917e:	4638      	mov	r0, r7
c0de9180:	f001 fa20 	bl	c0dea5c4 <genericContextComputeNextPageParams>
c0de9184:	4682      	mov	sl, r0
c0de9186:	f1ba 0f00 	cmp.w	sl, #0
c0de918a:	f000 8147 	beq.w	c0de941c <displayGenericContextPage+0x300>
c0de918e:	f8df 8374 	ldr.w	r8, [pc, #884]	@ c0de9504 <displayGenericContextPage+0x3e8>
c0de9192:	f819 0008 	ldrb.w	r0, [r9, r8]
c0de9196:	2803      	cmp	r0, #3
c0de9198:	d041      	beq.n	c0de921e <displayGenericContextPage+0x102>
c0de919a:	48db      	ldr	r0, [pc, #876]	@ (c0de9508 <displayGenericContextPage+0x3ec>)
c0de919c:	4448      	add	r0, r9
c0de919e:	f890 0020 	ldrb.w	r0, [r0, #32]
c0de91a2:	06c0      	lsls	r0, r0, #27
c0de91a4:	d53b      	bpl.n	c0de921e <displayGenericContextPage+0x102>
c0de91a6:	ea5f 600b 	movs.w	r0, fp, lsl #24
c0de91aa:	d034      	beq.n	c0de9216 <displayGenericContextPage+0xfa>
c0de91ac:	eb09 0008 	add.w	r0, r9, r8
c0de91b0:	f890 0061 	ldrb.w	r0, [r0, #97]	@ 0x61
c0de91b4:	3801      	subs	r0, #1
c0de91b6:	42b8      	cmp	r0, r7
c0de91b8:	dd2d      	ble.n	c0de9216 <displayGenericContextPage+0xfa>
c0de91ba:	eb09 0008 	add.w	r0, r9, r8
c0de91be:	2105      	movs	r1, #5
c0de91c0:	f880 106c 	strb.w	r1, [r0, #108]	@ 0x6c
c0de91c4:	49d2      	ldr	r1, [pc, #840]	@ (c0de9510 <displayGenericContextPage+0x3f4>)
c0de91c6:	4479      	add	r1, pc
c0de91c8:	6681      	str	r1, [r0, #104]	@ 0x68
c0de91ca:	2100      	movs	r1, #0
c0de91cc:	f880 1064 	strb.w	r1, [r0, #100]	@ 0x64
c0de91d0:	e025      	b.n	c0de921e <displayGenericContextPage+0x102>
c0de91d2:	d91b      	bls.n	c0de920c <displayGenericContextPage+0xf0>
c0de91d4:	f04f 0a00 	mov.w	sl, #0
c0de91d8:	ac12      	add	r4, sp, #72	@ 0x48
c0de91da:	f10d 0547 	add.w	r5, sp, #71	@ 0x47
c0de91de:	f10d 0646 	add.w	r6, sp, #70	@ 0x46
c0de91e2:	4547      	cmp	r7, r8
c0de91e4:	d0cf      	beq.n	c0de9186 <displayGenericContextPage+0x6a>
c0de91e6:	f108 0801 	add.w	r8, r8, #1
c0de91ea:	4621      	mov	r1, r4
c0de91ec:	462a      	mov	r2, r5
c0de91ee:	4633      	mov	r3, r6
c0de91f0:	fa5f f088 	uxtb.w	r0, r8
c0de91f4:	f001 f9e6 	bl	c0dea5c4 <genericContextComputeNextPageParams>
c0de91f8:	4682      	mov	sl, r0
c0de91fa:	e7f2      	b.n	c0de91e2 <displayGenericContextPage+0xc6>
c0de91fc:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0de91fe:	2800      	cmp	r0, #0
c0de9200:	f000 810c 	beq.w	c0de941c <displayGenericContextPage+0x300>
c0de9204:	b020      	add	sp, #128	@ 0x80
c0de9206:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de920a:	4700      	bx	r0
c0de920c:	eba7 0008 	sub.w	r0, r7, r8
c0de9210:	2801      	cmp	r0, #1
c0de9212:	ddaf      	ble.n	c0de9174 <displayGenericContextPage+0x58>
c0de9214:	e102      	b.n	c0de941c <displayGenericContextPage+0x300>
c0de9216:	eb09 0008 	add.w	r0, r9, r8
c0de921a:	2100      	movs	r1, #0
c0de921c:	6681      	str	r1, [r0, #104]	@ 0x68
c0de921e:	af01      	add	r7, sp, #4
c0de9220:	213c      	movs	r1, #60	@ 0x3c
c0de9222:	1d38      	adds	r0, r7, #4
c0de9224:	f003 f8c8 	bl	c0dec3b8 <__aeabi_memclr>
c0de9228:	2009      	movs	r0, #9
c0de922a:	f8df b2e0 	ldr.w	fp, [pc, #736]	@ c0de950c <displayGenericContextPage+0x3f0>
c0de922e:	f89d 5047 	ldrb.w	r5, [sp, #71]	@ 0x47
c0de9232:	f88d 000a 	strb.w	r0, [sp, #10]
c0de9236:	2002      	movs	r0, #2
c0de9238:	f88d 0009 	strb.w	r0, [sp, #9]
c0de923c:	eb09 0008 	add.w	r0, r9, r8
c0de9240:	eb09 010b 	add.w	r1, r9, fp
c0de9244:	6900      	ldr	r0, [r0, #16]
c0de9246:	7c8e      	ldrb	r6, [r1, #18]
c0de9248:	9001      	str	r0, [sp, #4]
c0de924a:	f89a 0000 	ldrb.w	r0, [sl]
c0de924e:	280a      	cmp	r0, #10
c0de9250:	f88d 0010 	strb.w	r0, [sp, #16]
c0de9254:	d01e      	beq.n	c0de9294 <displayGenericContextPage+0x178>
c0de9256:	2801      	cmp	r0, #1
c0de9258:	d02c      	beq.n	c0de92b4 <displayGenericContextPage+0x198>
c0de925a:	2802      	cmp	r0, #2
c0de925c:	d014      	beq.n	c0de9288 <displayGenericContextPage+0x16c>
c0de925e:	2803      	cmp	r0, #3
c0de9260:	d012      	beq.n	c0de9288 <displayGenericContextPage+0x16c>
c0de9262:	2804      	cmp	r0, #4
c0de9264:	d02e      	beq.n	c0de92c4 <displayGenericContextPage+0x1a8>
c0de9266:	2806      	cmp	r0, #6
c0de9268:	d042      	beq.n	c0de92f0 <displayGenericContextPage+0x1d4>
c0de926a:	2807      	cmp	r0, #7
c0de926c:	d04e      	beq.n	c0de930c <displayGenericContextPage+0x1f0>
c0de926e:	2808      	cmp	r0, #8
c0de9270:	d058      	beq.n	c0de9324 <displayGenericContextPage+0x208>
c0de9272:	2809      	cmp	r0, #9
c0de9274:	d063      	beq.n	c0de933e <displayGenericContextPage+0x222>
c0de9276:	2800      	cmp	r0, #0
c0de9278:	f040 80d0 	bne.w	c0de941c <displayGenericContextPage+0x300>
c0de927c:	f001 ffdd 	bl	c0deb23a <OUTLINED_FUNCTION_14>
c0de9280:	e890 007c 	ldmia.w	r0, {r2, r3, r4, r5, r6}
c0de9284:	c17c      	stmia	r1!, {r2, r3, r4, r5, r6}
c0de9286:	e092      	b.n	c0de93ae <displayGenericContextPage+0x292>
c0de9288:	f001 ffd7 	bl	c0deb23a <OUTLINED_FUNCTION_14>
c0de928c:	e890 003c 	ldmia.w	r0, {r2, r3, r4, r5}
c0de9290:	c13c      	stmia	r1!, {r2, r3, r4, r5}
c0de9292:	e08c      	b.n	c0de93ae <displayGenericContextPage+0x292>
c0de9294:	f88d 501c 	strb.w	r5, [sp, #28]
c0de9298:	f001 ff9b 	bl	c0deb1d2 <OUTLINED_FUNCTION_1>
c0de929c:	9005      	str	r0, [sp, #20]
c0de929e:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de92a2:	4430      	add	r0, r6
c0de92a4:	f002 fe66 	bl	c0debf74 <pic>
c0de92a8:	9006      	str	r0, [sp, #24]
c0de92aa:	f89a 000d 	ldrb.w	r0, [sl, #13]
c0de92ae:	f88d 001d 	strb.w	r0, [sp, #29]
c0de92b2:	e07c      	b.n	c0de93ae <displayGenericContextPage+0x292>
c0de92b4:	f107 0010 	add.w	r0, r7, #16
c0de92b8:	f10a 0104 	add.w	r1, sl, #4
c0de92bc:	2230      	movs	r2, #48	@ 0x30
c0de92be:	f003 f871 	bl	c0dec3a4 <__aeabi_memcpy>
c0de92c2:	e074      	b.n	c0de93ae <displayGenericContextPage+0x292>
c0de92c4:	f8da 2004 	ldr.w	r2, [sl, #4]
c0de92c8:	eb09 010b 	add.w	r1, r9, fp
c0de92cc:	f89d 0046 	ldrb.w	r0, [sp, #70]	@ 0x46
c0de92d0:	9f00      	ldr	r7, [sp, #0]
c0de92d2:	624a      	str	r2, [r1, #36]	@ 0x24
c0de92d4:	2800      	cmp	r0, #0
c0de92d6:	f8da 2008 	ldr.w	r2, [sl, #8]
c0de92da:	628a      	str	r2, [r1, #40]	@ 0x28
c0de92dc:	f000 80bf 	beq.w	c0de945e <displayGenericContextPage+0x342>
c0de92e0:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de92e4:	2800      	cmp	r0, #0
c0de92e6:	f000 809c 	beq.w	c0de9422 <displayGenericContextPage+0x306>
c0de92ea:	eb00 1006 	add.w	r0, r0, r6, lsl #4
c0de92ee:	e09c      	b.n	c0de942a <displayGenericContextPage+0x30e>
c0de92f0:	f89a 100c 	ldrb.w	r1, [sl, #12]
c0de92f4:	1970      	adds	r0, r6, r5
c0de92f6:	f10a 0404 	add.w	r4, sl, #4
c0de92fa:	4288      	cmp	r0, r1
c0de92fc:	d134      	bne.n	c0de9368 <displayGenericContextPage+0x24c>
c0de92fe:	3710      	adds	r7, #16
c0de9300:	4621      	mov	r1, r4
c0de9302:	222c      	movs	r2, #44	@ 0x2c
c0de9304:	4638      	mov	r0, r7
c0de9306:	f003 f84d 	bl	c0dec3a4 <__aeabi_memcpy>
c0de930a:	e031      	b.n	c0de9370 <displayGenericContextPage+0x254>
c0de930c:	f88d 5018 	strb.w	r5, [sp, #24]
c0de9310:	eb06 0046 	add.w	r0, r6, r6, lsl #1
c0de9314:	f8da 1004 	ldr.w	r1, [sl, #4]
c0de9318:	eb01 0080 	add.w	r0, r1, r0, lsl #2
c0de931c:	f002 fe2a 	bl	c0debf74 <pic>
c0de9320:	9005      	str	r0, [sp, #20]
c0de9322:	e044      	b.n	c0de93ae <displayGenericContextPage+0x292>
c0de9324:	f88d 5020 	strb.w	r5, [sp, #32]
c0de9328:	f001 ff53 	bl	c0deb1d2 <OUTLINED_FUNCTION_1>
c0de932c:	9005      	str	r0, [sp, #20]
c0de932e:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de9332:	eb00 0086 	add.w	r0, r0, r6, lsl #2
c0de9336:	f002 fe1d 	bl	c0debf74 <pic>
c0de933a:	9006      	str	r0, [sp, #24]
c0de933c:	e037      	b.n	c0de93ae <displayGenericContextPage+0x292>
c0de933e:	f001 ff7c 	bl	c0deb23a <OUTLINED_FUNCTION_14>
c0de9342:	e890 001c 	ldmia.w	r0, {r2, r3, r4}
c0de9346:	c11c      	stmia	r1!, {r2, r3, r4}
c0de9348:	f88d 5019 	strb.w	r5, [sp, #25]
c0de934c:	f001 ff41 	bl	c0deb1d2 <OUTLINED_FUNCTION_1>
c0de9350:	9005      	str	r0, [sp, #20]
c0de9352:	f89a 000a 	ldrb.w	r0, [sl, #10]
c0de9356:	42b0      	cmp	r0, r6
c0de9358:	d327      	bcc.n	c0de93aa <displayGenericContextPage+0x28e>
c0de935a:	1971      	adds	r1, r6, r5
c0de935c:	4281      	cmp	r1, r0
c0de935e:	d924      	bls.n	c0de93aa <displayGenericContextPage+0x28e>
c0de9360:	1b80      	subs	r0, r0, r6
c0de9362:	f88d 001a 	strb.w	r0, [sp, #26]
c0de9366:	e022      	b.n	c0de93ae <displayGenericContextPage+0x292>
c0de9368:	2004      	movs	r0, #4
c0de936a:	3710      	adds	r7, #16
c0de936c:	f88d 0010 	strb.w	r0, [sp, #16]
c0de9370:	f88d 501c 	strb.w	r5, [sp, #28]
c0de9374:	6820      	ldr	r0, [r4, #0]
c0de9376:	eb00 1006 	add.w	r0, r0, r6, lsl #4
c0de937a:	f002 fdfb 	bl	c0debf74 <pic>
c0de937e:	2110      	movs	r1, #16
c0de9380:	2200      	movs	r2, #0
c0de9382:	6038      	str	r0, [r7, #0]
c0de9384:	eb01 1105 	add.w	r1, r1, r5, lsl #4
c0de9388:	f102 0310 	add.w	r3, r2, #16
c0de938c:	4299      	cmp	r1, r3
c0de938e:	d006      	beq.n	c0de939e <displayGenericContextPage+0x282>
c0de9390:	4402      	add	r2, r0
c0de9392:	7b12      	ldrb	r2, [r2, #12]
c0de9394:	0752      	lsls	r2, r2, #29
c0de9396:	461a      	mov	r2, r3
c0de9398:	d5f6      	bpl.n	c0de9388 <displayGenericContextPage+0x26c>
c0de939a:	210d      	movs	r1, #13
c0de939c:	72f9      	strb	r1, [r7, #11]
c0de939e:	9a06      	ldr	r2, [sp, #24]
c0de93a0:	eb09 010b 	add.w	r1, r9, fp
c0de93a4:	e9c1 0209 	strd	r0, r2, [r1, #36]	@ 0x24
c0de93a8:	e001      	b.n	c0de93ae <displayGenericContextPage+0x292>
c0de93aa:	f88d 501a 	strb.w	r5, [sp, #26]
c0de93ae:	9f00      	ldr	r7, [sp, #0]
c0de93b0:	f819 0008 	ldrb.w	r0, [r9, r8]
c0de93b4:	f000 01fe 	and.w	r1, r0, #254	@ 0xfe
c0de93b8:	4853      	ldr	r0, [pc, #332]	@ (c0de9508 <displayGenericContextPage+0x3ec>)
c0de93ba:	2902      	cmp	r1, #2
c0de93bc:	4448      	add	r0, r9
c0de93be:	6a00      	ldr	r0, [r0, #32]
c0de93c0:	bf18      	it	ne
c0de93c2:	2000      	movne	r0, #0
c0de93c4:	f89a 1000 	ldrb.w	r1, [sl]
c0de93c8:	2902      	cmp	r1, #2
c0de93ca:	d817      	bhi.n	c0de93fc <displayGenericContextPage+0x2e0>
c0de93cc:	f010 0fe0 	tst.w	r0, #224	@ 0xe0
c0de93d0:	d014      	beq.n	c0de93fc <displayGenericContextPage+0x2e0>
c0de93d2:	0601      	lsls	r1, r0, #24
c0de93d4:	d508      	bpl.n	c0de93e8 <displayGenericContextPage+0x2cc>
c0de93d6:	eb09 010b 	add.w	r1, r9, fp
c0de93da:	6d89      	ldr	r1, [r1, #88]	@ 0x58
c0de93dc:	7809      	ldrb	r1, [r1, #0]
c0de93de:	06c9      	lsls	r1, r1, #27
c0de93e0:	d402      	bmi.n	c0de93e8 <displayGenericContextPage+0x2cc>
c0de93e2:	494d      	ldr	r1, [pc, #308]	@ (c0de9518 <displayGenericContextPage+0x3fc>)
c0de93e4:	4479      	add	r1, pc
c0de93e6:	e001      	b.n	c0de93ec <displayGenericContextPage+0x2d0>
c0de93e8:	494c      	ldr	r1, [pc, #304]	@ (c0de951c <displayGenericContextPage+0x400>)
c0de93ea:	4479      	add	r1, pc
c0de93ec:	0680      	lsls	r0, r0, #26
c0de93ee:	9103      	str	r1, [sp, #12]
c0de93f0:	f04f 0010 	mov.w	r0, #16
c0de93f4:	bf58      	it	pl
c0de93f6:	2011      	movpl	r0, #17
c0de93f8:	f88d 000b 	strb.w	r0, [sp, #11]
c0de93fc:	4848      	ldr	r0, [pc, #288]	@ (c0de9520 <displayGenericContextPage+0x404>)
c0de93fe:	eb09 0408 	add.w	r4, r9, r8
c0de9402:	aa01      	add	r2, sp, #4
c0de9404:	f104 0160 	add.w	r1, r4, #96	@ 0x60
c0de9408:	4478      	add	r0, pc
c0de940a:	f7ff fad1 	bl	c0de89b0 <nbgl_pageDrawGenericContent>
c0de940e:	6160      	str	r0, [r4, #20]
c0de9410:	2001      	movs	r0, #1
c0de9412:	2f00      	cmp	r7, #0
c0de9414:	bf18      	it	ne
c0de9416:	2002      	movne	r0, #2
c0de9418:	f002 fb94 	bl	c0debb44 <nbgl_refreshSpecial>
c0de941c:	b020      	add	sp, #128	@ 0x80
c0de941e:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de9422:	f8da 1008 	ldr.w	r1, [sl, #8]
c0de9426:	4630      	mov	r0, r6
c0de9428:	4788      	blx	r1
c0de942a:	f002 fda3 	bl	c0debf74 <pic>
c0de942e:	7b01      	ldrb	r1, [r0, #12]
c0de9430:	0789      	lsls	r1, r1, #30
c0de9432:	d42e      	bmi.n	c0de9492 <displayGenericContextPage+0x376>
c0de9434:	4937      	ldr	r1, [pc, #220]	@ (c0de9514 <displayGenericContextPage+0x3f8>)
c0de9436:	4479      	add	r1, pc
c0de9438:	910b      	str	r1, [sp, #44]	@ 0x2c
c0de943a:	210a      	movs	r1, #10
c0de943c:	f88d 1030 	strb.w	r1, [sp, #48]	@ 0x30
c0de9440:	2100      	movs	r1, #0
c0de9442:	910a      	str	r1, [sp, #40]	@ 0x28
c0de9444:	eb09 010b 	add.w	r1, r9, fp
c0de9448:	e9d0 2000 	ldrd	r2, r0, [r0]
c0de944c:	e9c1 2006 	strd	r2, r0, [r1, #24]
c0de9450:	f89a 0011 	ldrb.w	r0, [sl, #17]
c0de9454:	f881 0020 	strb.w	r0, [r1, #32]
c0de9458:	2005      	movs	r0, #5
c0de945a:	f88d 0010 	strb.w	r0, [sp, #16]
c0de945e:	f88d 501c 	strb.w	r5, [sp, #28]
c0de9462:	f89a 000f 	ldrb.w	r0, [sl, #15]
c0de9466:	f88d 001f 	strb.w	r0, [sp, #31]
c0de946a:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de946e:	b328      	cbz	r0, c0de94bc <displayGenericContextPage+0x3a0>
c0de9470:	eb00 1006 	add.w	r0, r0, r6, lsl #4
c0de9474:	f002 fd7e 	bl	c0debf74 <pic>
c0de9478:	9005      	str	r0, [sp, #20]
c0de947a:	f100 010c 	add.w	r1, r0, #12
c0de947e:	1c68      	adds	r0, r5, #1
c0de9480:	3801      	subs	r0, #1
c0de9482:	d033      	beq.n	c0de94ec <displayGenericContextPage+0x3d0>
c0de9484:	f101 0210 	add.w	r2, r1, #16
c0de9488:	7809      	ldrb	r1, [r1, #0]
c0de948a:	0749      	lsls	r1, r1, #29
c0de948c:	4611      	mov	r1, r2
c0de948e:	d5f7      	bpl.n	c0de9480 <displayGenericContextPage+0x364>
c0de9490:	e029      	b.n	c0de94e6 <displayGenericContextPage+0x3ca>
c0de9492:	2101      	movs	r1, #1
c0de9494:	f88d 1010 	strb.w	r1, [sp, #16]
c0de9498:	6881      	ldr	r1, [r0, #8]
c0de949a:	4a22      	ldr	r2, [pc, #136]	@ (c0de9524 <displayGenericContextPage+0x408>)
c0de949c:	447a      	add	r2, pc
c0de949e:	920c      	str	r2, [sp, #48]	@ 0x30
c0de94a0:	e9d0 2000 	ldrd	r2, r0, [r0]
c0de94a4:	9106      	str	r1, [sp, #24]
c0de94a6:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de94a8:	2000      	movs	r0, #0
c0de94aa:	9209      	str	r2, [sp, #36]	@ 0x24
c0de94ac:	f88d 0036 	strb.w	r0, [sp, #54]	@ 0x36
c0de94b0:	f8ad 0034 	strh.w	r0, [sp, #52]	@ 0x34
c0de94b4:	900a      	str	r0, [sp, #40]	@ 0x28
c0de94b6:	f88d 0014 	strb.w	r0, [sp, #20]
c0de94ba:	e779      	b.n	c0de93b0 <displayGenericContextPage+0x294>
c0de94bc:	2400      	movs	r4, #0
c0de94be:	9405      	str	r4, [sp, #20]
c0de94c0:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de94c4:	f88d 601d 	strb.w	r6, [sp, #29]
c0de94c8:	9006      	str	r0, [sp, #24]
c0de94ca:	b2e0      	uxtb	r0, r4
c0de94cc:	42a8      	cmp	r0, r5
c0de94ce:	d20d      	bcs.n	c0de94ec <displayGenericContextPage+0x3d0>
c0de94d0:	19a0      	adds	r0, r4, r6
c0de94d2:	f8da 1008 	ldr.w	r1, [sl, #8]
c0de94d6:	b2c0      	uxtb	r0, r0
c0de94d8:	4788      	blx	r1
c0de94da:	f002 fd4b 	bl	c0debf74 <pic>
c0de94de:	7b00      	ldrb	r0, [r0, #12]
c0de94e0:	3401      	adds	r4, #1
c0de94e2:	0740      	lsls	r0, r0, #29
c0de94e4:	d5f1      	bpl.n	c0de94ca <displayGenericContextPage+0x3ae>
c0de94e6:	200d      	movs	r0, #13
c0de94e8:	f88d 001f 	strb.w	r0, [sp, #31]
c0de94ec:	2009      	movs	r0, #9
c0de94ee:	f88d 001e 	strb.w	r0, [sp, #30]
c0de94f2:	2000      	movs	r0, #0
c0de94f4:	f88d 0020 	strb.w	r0, [sp, #32]
c0de94f8:	f89a 0011 	ldrb.w	r0, [sl, #17]
c0de94fc:	f88d 0021 	strb.w	r0, [sp, #33]	@ 0x21
c0de9500:	e756      	b.n	c0de93b0 <displayGenericContextPage+0x294>
c0de9502:	bf00      	nop
c0de9504:	00001bc8 	.word	0x00001bc8
c0de9508:	00001c44 	.word	0x00001c44
c0de950c:	000018fc 	.word	0x000018fc
c0de9510:	00004f1f 	.word	0x00004f1f
c0de9514:	0000485c 	.word	0x0000485c
c0de9518:	00004168 	.word	0x00004168
c0de951c:	000044ab 	.word	0x000044ab
c0de9520:	000002a5 	.word	0x000002a5
c0de9524:	00004ce6 	.word	0x00004ce6

c0de9528 <nbgl_useCaseHomeAndSettings>:
c0de9528:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de952c:	f8df 8060 	ldr.w	r8, [pc, #96]	@ c0de9590 <nbgl_useCaseHomeAndSettings+0x68>
c0de9530:	469a      	mov	sl, r3
c0de9532:	4615      	mov	r5, r2
c0de9534:	460e      	mov	r6, r1
c0de9536:	4607      	mov	r7, r0
c0de9538:	eb09 0408 	add.w	r4, r9, r8
c0de953c:	f7ff fc56 	bl	c0de8dec <reset_callbacks_and_context>
c0de9540:	9809      	ldr	r0, [sp, #36]	@ 0x24
c0de9542:	6320      	str	r0, [r4, #48]	@ 0x30
c0de9544:	9808      	ldr	r0, [sp, #32]
c0de9546:	e9c4 7608 	strd	r7, r6, [r4, #32]
c0de954a:	e9c4 500a 	strd	r5, r0, [r4, #40]	@ 0x28
c0de954e:	e9dd 100a 	ldrd	r1, r0, [sp, #40]	@ 0x28
c0de9552:	b131      	cbz	r1, c0de9562 <nbgl_useCaseHomeAndSettings+0x3a>
c0de9554:	eb09 0208 	add.w	r2, r9, r8
c0de9558:	e891 0078 	ldmia.w	r1, {r3, r4, r5, r6}
c0de955c:	3234      	adds	r2, #52	@ 0x34
c0de955e:	c278      	stmia	r2!, {r3, r4, r5, r6}
c0de9560:	e006      	b.n	c0de9570 <nbgl_useCaseHomeAndSettings+0x48>
c0de9562:	eb09 0108 	add.w	r1, r9, r8
c0de9566:	2200      	movs	r2, #0
c0de9568:	e9c1 220d 	strd	r2, r2, [r1, #52]	@ 0x34
c0de956c:	e9c1 220f 	strd	r2, r2, [r1, #60]	@ 0x3c
c0de9570:	eb09 0108 	add.w	r1, r9, r8
c0de9574:	f1ba 0fff 	cmp.w	sl, #255	@ 0xff
c0de9578:	6448      	str	r0, [r1, #68]	@ 0x44
c0de957a:	d004      	beq.n	c0de9586 <nbgl_useCaseHomeAndSettings+0x5e>
c0de957c:	4650      	mov	r0, sl
c0de957e:	e8bd 45f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de9582:	f000 b807 	b.w	c0de9594 <bundleNavStartSettingsAtPage>
c0de9586:	e8bd 45f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de958a:	f000 b815 	b.w	c0de95b8 <bundleNavStartHome>
c0de958e:	bf00      	nop
c0de9590:	00001c44 	.word	0x00001c44

c0de9594 <bundleNavStartSettingsAtPage>:
c0de9594:	b51c      	push	{r2, r3, r4, lr}
c0de9596:	4601      	mov	r1, r0
c0de9598:	4805      	ldr	r0, [pc, #20]	@ (c0de95b0 <bundleNavStartSettingsAtPage+0x1c>)
c0de959a:	eb09 0300 	add.w	r3, r9, r0
c0de959e:	6a18      	ldr	r0, [r3, #32]
c0de95a0:	e9d3 230b 	ldrd	r2, r3, [r3, #44]	@ 0x2c
c0de95a4:	4c03      	ldr	r4, [pc, #12]	@ (c0de95b4 <bundleNavStartSettingsAtPage+0x20>)
c0de95a6:	447c      	add	r4, pc
c0de95a8:	9400      	str	r4, [sp, #0]
c0de95aa:	f7ff fca3 	bl	c0de8ef4 <nbgl_useCaseGenericSettings>
c0de95ae:	bd1c      	pop	{r2, r3, r4, pc}
c0de95b0:	00001c44 	.word	0x00001c44
c0de95b4:	0000000f 	.word	0x0000000f

c0de95b8 <bundleNavStartHome>:
c0de95b8:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
c0de95ba:	4809      	ldr	r0, [pc, #36]	@ (c0de95e0 <bundleNavStartHome+0x28>)
c0de95bc:	eb09 0400 	add.w	r4, r9, r0
c0de95c0:	f104 0320 	add.w	r3, r4, #32
c0de95c4:	6c65      	ldr	r5, [r4, #68]	@ 0x44
c0de95c6:	3434      	adds	r4, #52	@ 0x34
c0de95c8:	cb0f      	ldmia	r3, {r0, r1, r2, r3}
c0de95ca:	4e06      	ldr	r6, [pc, #24]	@ (c0de95e4 <bundleNavStartHome+0x2c>)
c0de95cc:	2b00      	cmp	r3, #0
c0de95ce:	9502      	str	r5, [sp, #8]
c0de95d0:	447e      	add	r6, pc
c0de95d2:	e9cd 4600 	strd	r4, r6, [sp]
c0de95d6:	bf18      	it	ne
c0de95d8:	2301      	movne	r3, #1
c0de95da:	f7ff fb6d 	bl	c0de8cb8 <useCaseHomeExt>
c0de95de:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}
c0de95e0:	00001c44 	.word	0x00001c44
c0de95e4:	0000113d 	.word	0x0000113d

c0de95e8 <nbgl_useCaseStatus>:
c0de95e8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de95ec:	b090      	sub	sp, #64	@ 0x40
c0de95ee:	4604      	mov	r4, r0
c0de95f0:	4822      	ldr	r0, [pc, #136]	@ (c0de967c <nbgl_useCaseStatus+0x94>)
c0de95f2:	460e      	mov	r6, r1
c0de95f4:	4615      	mov	r5, r2
c0de95f6:	a90d      	add	r1, sp, #52	@ 0x34
c0de95f8:	f8df 807c 	ldr.w	r8, [pc, #124]	@ c0de9678 <nbgl_useCaseStatus+0x90>
c0de95fc:	4478      	add	r0, pc
c0de95fe:	e890 008c 	ldmia.w	r0, {r2, r3, r7}
c0de9602:	c18c      	stmia	r1!, {r2, r3, r7}
c0de9604:	eb09 0708 	add.w	r7, r9, r8
c0de9608:	f7ff fbf0 	bl	c0de8dec <reset_callbacks_and_context>
c0de960c:	607d      	str	r5, [r7, #4]
c0de960e:	b156      	cbz	r6, c0de9626 <nbgl_useCaseStatus+0x3e>
c0de9610:	2003      	movs	r0, #3
c0de9612:	f7fa fc95 	bl	c0de3f40 <os_io_seph_cmd_piezo_play_tune>
c0de9616:	481a      	ldr	r0, [pc, #104]	@ (c0de9680 <nbgl_useCaseStatus+0x98>)
c0de9618:	a90d      	add	r1, sp, #52	@ 0x34
c0de961a:	4622      	mov	r2, r4
c0de961c:	2302      	movs	r3, #2
c0de961e:	4478      	add	r0, pc
c0de9620:	f7fe fe22 	bl	c0de8268 <nbgl_pageDrawLedgerInfo>
c0de9624:	e020      	b.n	c0de9668 <nbgl_useCaseStatus+0x80>
c0de9626:	2000      	movs	r0, #0
c0de9628:	f44f 1140 	mov.w	r1, #3145728	@ 0x300000
c0de962c:	466a      	mov	r2, sp
c0de962e:	9005      	str	r0, [sp, #20]
c0de9630:	9104      	str	r1, [sp, #16]
c0de9632:	4914      	ldr	r1, [pc, #80]	@ (c0de9684 <nbgl_useCaseStatus+0x9c>)
c0de9634:	e9cd 4000 	strd	r4, r0, [sp]
c0de9638:	9006      	str	r0, [sp, #24]
c0de963a:	f88d 001c 	strb.w	r0, [sp, #28]
c0de963e:	e9cd 000a 	strd	r0, r0, [sp, #40]	@ 0x28
c0de9642:	4479      	add	r1, pc
c0de9644:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de9648:	f44f 6110 	mov.w	r1, #2304	@ 0x900
c0de964c:	f44f 7000 	mov.w	r0, #512	@ 0x200
c0de9650:	f8ad 1030 	strh.w	r1, [sp, #48]	@ 0x30
c0de9654:	f8ad 0024 	strh.w	r0, [sp, #36]	@ 0x24
c0de9658:	480b      	ldr	r0, [pc, #44]	@ (c0de9688 <nbgl_useCaseStatus+0xa0>)
c0de965a:	4478      	add	r0, pc
c0de965c:	9008      	str	r0, [sp, #32]
c0de965e:	480b      	ldr	r0, [pc, #44]	@ (c0de968c <nbgl_useCaseStatus+0xa4>)
c0de9660:	a90d      	add	r1, sp, #52	@ 0x34
c0de9662:	4478      	add	r0, pc
c0de9664:	f7fe fe54 	bl	c0de8310 <nbgl_pageDrawInfo>
c0de9668:	eb09 0108 	add.w	r1, r9, r8
c0de966c:	6148      	str	r0, [r1, #20]
c0de966e:	f001 fdbb 	bl	c0deb1e8 <OUTLINED_FUNCTION_3>
c0de9672:	b010      	add	sp, #64	@ 0x40
c0de9674:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de9678:	00001bc8 	.word	0x00001bc8
c0de967c:	00006138 	.word	0x00006138
c0de9680:	0000008f 	.word	0x0000008f
c0de9684:	00003598 	.word	0x00003598
c0de9688:	00004a8a 	.word	0x00004a8a
c0de968c:	0000004b 	.word	0x0000004b

c0de9690 <tickerCallback>:
c0de9690:	b510      	push	{r4, lr}
c0de9692:	4806      	ldr	r0, [pc, #24]	@ (c0de96ac <tickerCallback+0x1c>)
c0de9694:	eb09 0400 	add.w	r4, r9, r0
c0de9698:	6960      	ldr	r0, [r4, #20]
c0de969a:	f7ff f98c 	bl	c0de89b6 <nbgl_pageRelease>
c0de969e:	6860      	ldr	r0, [r4, #4]
c0de96a0:	b110      	cbz	r0, c0de96a8 <tickerCallback+0x18>
c0de96a2:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de96a6:	4700      	bx	r0
c0de96a8:	bd10      	pop	{r4, pc}
c0de96aa:	bf00      	nop
c0de96ac:	00001bc8 	.word	0x00001bc8

c0de96b0 <pageCallback>:
c0de96b0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de96b4:	b092      	sub	sp, #72	@ 0x48
c0de96b6:	b350      	cbz	r0, c0de970e <pageCallback+0x5e>
c0de96b8:	4605      	mov	r5, r0
c0de96ba:	2801      	cmp	r0, #1
c0de96bc:	d034      	beq.n	c0de9728 <pageCallback+0x78>
c0de96be:	2d12      	cmp	r5, #18
c0de96c0:	d043      	beq.n	c0de974a <pageCallback+0x9a>
c0de96c2:	460c      	mov	r4, r1
c0de96c4:	2d03      	cmp	r5, #3
c0de96c6:	d055      	beq.n	c0de9774 <pageCallback+0xc4>
c0de96c8:	2d05      	cmp	r5, #5
c0de96ca:	d05f      	beq.n	c0de978c <pageCallback+0xdc>
c0de96cc:	2d06      	cmp	r5, #6
c0de96ce:	d075      	beq.n	c0de97bc <pageCallback+0x10c>
c0de96d0:	2d07      	cmp	r5, #7
c0de96d2:	d077      	beq.n	c0de97c4 <pageCallback+0x114>
c0de96d4:	2d08      	cmp	r5, #8
c0de96d6:	f000 809e 	beq.w	c0de9816 <pageCallback+0x166>
c0de96da:	2d09      	cmp	r5, #9
c0de96dc:	f000 80a9 	beq.w	c0de9832 <pageCallback+0x182>
c0de96e0:	2d0a      	cmp	r5, #10
c0de96e2:	f000 80b0 	beq.w	c0de9846 <pageCallback+0x196>
c0de96e6:	2d0b      	cmp	r5, #11
c0de96e8:	f000 80fa 	beq.w	c0de98e0 <pageCallback+0x230>
c0de96ec:	2d0c      	cmp	r5, #12
c0de96ee:	f000 80fe 	beq.w	c0de98ee <pageCallback+0x23e>
c0de96f2:	2d0d      	cmp	r5, #13
c0de96f4:	f000 8105 	beq.w	c0de9902 <pageCallback+0x252>
c0de96f8:	2d10      	cmp	r5, #16
c0de96fa:	f000 810e 	beq.w	c0de991a <pageCallback+0x26a>
c0de96fe:	2d11      	cmp	r5, #17
c0de9700:	f000 8113 	beq.w	c0de992a <pageCallback+0x27a>
c0de9704:	2d02      	cmp	r5, #2
c0de9706:	f040 8119 	bne.w	c0de993c <pageCallback+0x28c>
c0de970a:	48cb      	ldr	r0, [pc, #812]	@ (c0de9a38 <pageCallback+0x388>)
c0de970c:	e161      	b.n	c0de99d2 <pageCallback+0x322>
c0de970e:	48ca      	ldr	r0, [pc, #808]	@ (c0de9a38 <pageCallback+0x388>)
c0de9710:	eb09 0100 	add.w	r1, r9, r0
c0de9714:	f891 0060 	ldrb.w	r0, [r1, #96]	@ 0x60
c0de9718:	6889      	ldr	r1, [r1, #8]
c0de971a:	3801      	subs	r0, #1
c0de971c:	2900      	cmp	r1, #0
c0de971e:	f000 8124 	beq.w	c0de996a <pageCallback+0x2ba>
c0de9722:	b2c0      	uxtb	r0, r0
c0de9724:	2101      	movs	r1, #1
c0de9726:	e00b      	b.n	c0de9740 <pageCallback+0x90>
c0de9728:	48c3      	ldr	r0, [pc, #780]	@ (c0de9a38 <pageCallback+0x388>)
c0de972a:	eb09 0100 	add.w	r1, r9, r0
c0de972e:	f891 0060 	ldrb.w	r0, [r1, #96]	@ 0x60
c0de9732:	6889      	ldr	r1, [r1, #8]
c0de9734:	3001      	adds	r0, #1
c0de9736:	2900      	cmp	r1, #0
c0de9738:	f000 8117 	beq.w	c0de996a <pageCallback+0x2ba>
c0de973c:	b2c0      	uxtb	r0, r0
c0de973e:	2100      	movs	r1, #0
c0de9740:	b012      	add	sp, #72	@ 0x48
c0de9742:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9746:	f000 baa7 	b.w	c0de9c98 <displayReviewPage>
c0de974a:	48b9      	ldr	r0, [pc, #740]	@ (c0de9a30 <pageCallback+0x380>)
c0de974c:	eb09 0100 	add.w	r1, r9, r0
c0de9750:	f891 1021 	ldrb.w	r1, [r1, #33]	@ 0x21
c0de9754:	2900      	cmp	r1, #0
c0de9756:	f000 810f 	beq.w	c0de9978 <pageCallback+0x2c8>
c0de975a:	eb09 0100 	add.w	r1, r9, r0
c0de975e:	6d89      	ldr	r1, [r1, #88]	@ 0x58
c0de9760:	680a      	ldr	r2, [r1, #0]
c0de9762:	2a00      	cmp	r2, #0
c0de9764:	f000 8108 	beq.w	c0de9978 <pageCallback+0x2c8>
c0de9768:	4448      	add	r0, r9
c0de976a:	2201      	movs	r2, #1
c0de976c:	f880 2068 	strb.w	r2, [r0, #104]	@ 0x68
c0de9770:	6808      	ldr	r0, [r1, #0]
c0de9772:	e0de      	b.n	c0de9932 <pageCallback+0x282>
c0de9774:	48b0      	ldr	r0, [pc, #704]	@ (c0de9a38 <pageCallback+0x388>)
c0de9776:	2cff      	cmp	r4, #255	@ 0xff
c0de9778:	f000 812b 	beq.w	c0de99d2 <pageCallback+0x322>
c0de977c:	f819 0000 	ldrb.w	r0, [r9, r0]
c0de9780:	1e81      	subs	r1, r0, #2
c0de9782:	2902      	cmp	r1, #2
c0de9784:	f080 8144 	bcs.w	c0de9a10 <pageCallback+0x360>
c0de9788:	4620      	mov	r0, r4
c0de978a:	e0ef      	b.n	c0de996c <pageCallback+0x2bc>
c0de978c:	a80a      	add	r0, sp, #40	@ 0x28
c0de978e:	49b0      	ldr	r1, [pc, #704]	@ (c0de9a50 <pageCallback+0x3a0>)
c0de9790:	2220      	movs	r2, #32
c0de9792:	4479      	add	r1, pc
c0de9794:	f002 fe06 	bl	c0dec3a4 <__aeabi_memcpy>
c0de9798:	4ca7      	ldr	r4, [pc, #668]	@ (c0de9a38 <pageCallback+0x388>)
c0de979a:	eb09 0004 	add.w	r0, r9, r4
c0de979e:	6a00      	ldr	r0, [r0, #32]
c0de97a0:	b108      	cbz	r0, c0de97a6 <pageCallback+0xf6>
c0de97a2:	f7ff f908 	bl	c0de89b6 <nbgl_pageRelease>
c0de97a6:	48ab      	ldr	r0, [pc, #684]	@ (c0de9a54 <pageCallback+0x3a4>)
c0de97a8:	a90a      	add	r1, sp, #40	@ 0x28
c0de97aa:	4478      	add	r0, pc
c0de97ac:	f7fe fea0 	bl	c0de84f0 <nbgl_pageDrawConfirmation>
c0de97b0:	eb09 0104 	add.w	r1, r9, r4
c0de97b4:	6208      	str	r0, [r1, #32]
c0de97b6:	f001 fd17 	bl	c0deb1e8 <OUTLINED_FUNCTION_3>
c0de97ba:	e111      	b.n	c0de99e0 <pageCallback+0x330>
c0de97bc:	489e      	ldr	r0, [pc, #632]	@ (c0de9a38 <pageCallback+0x388>)
c0de97be:	4448      	add	r0, r9
c0de97c0:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0de97c2:	e108      	b.n	c0de99d6 <pageCallback+0x326>
c0de97c4:	ac0a      	add	r4, sp, #40	@ 0x28
c0de97c6:	499f      	ldr	r1, [pc, #636]	@ (c0de9a44 <pageCallback+0x394>)
c0de97c8:	221c      	movs	r2, #28
c0de97ca:	4620      	mov	r0, r4
c0de97cc:	4479      	add	r1, pc
c0de97ce:	f002 fde9 	bl	c0dec3a4 <__aeabi_memcpy>
c0de97d2:	489d      	ldr	r0, [pc, #628]	@ (c0de9a48 <pageCallback+0x398>)
c0de97d4:	ad06      	add	r5, sp, #24
c0de97d6:	4629      	mov	r1, r5
c0de97d8:	4478      	add	r0, pc
c0de97da:	e890 00cc 	ldmia.w	r0, {r2, r3, r6, r7}
c0de97de:	f44f 3080 	mov.w	r0, #65536	@ 0x10000
c0de97e2:	c1cc      	stmia	r1!, {r2, r3, r6, r7}
c0de97e4:	4e95      	ldr	r6, [pc, #596]	@ (c0de9a3c <pageCallback+0x38c>)
c0de97e6:	9005      	str	r0, [sp, #20]
c0de97e8:	eb09 0706 	add.w	r7, r9, r6
c0de97ec:	6878      	ldr	r0, [r7, #4]
c0de97ee:	9002      	str	r0, [sp, #8]
c0de97f0:	2000      	movs	r0, #0
c0de97f2:	9003      	str	r0, [sp, #12]
c0de97f4:	4620      	mov	r0, r4
c0de97f6:	f7fa fdab 	bl	c0de4350 <nbgl_layoutGet>
c0de97fa:	4629      	mov	r1, r5
c0de97fc:	6338      	str	r0, [r7, #48]	@ 0x30
c0de97fe:	f7fd fb3f 	bl	c0de6e80 <nbgl_layoutAddHeader>
c0de9802:	6879      	ldr	r1, [r7, #4]
c0de9804:	200b      	movs	r0, #11
c0de9806:	f001 fd0b 	bl	c0deb220 <OUTLINED_FUNCTION_11>
c0de980a:	6879      	ldr	r1, [r7, #4]
c0de980c:	2804      	cmp	r0, #4
c0de980e:	f080 80be 	bcs.w	c0de998e <pageCallback+0x2de>
c0de9812:	460c      	mov	r4, r1
c0de9814:	e0c7      	b.n	c0de99a6 <pageCallback+0x2f6>
c0de9816:	4888      	ldr	r0, [pc, #544]	@ (c0de9a38 <pageCallback+0x388>)
c0de9818:	2c00      	cmp	r4, #0
c0de981a:	f040 80d8 	bne.w	c0de99ce <pageCallback+0x31e>
c0de981e:	eb09 0100 	add.w	r1, r9, r0
c0de9822:	6a49      	ldr	r1, [r1, #36]	@ 0x24
c0de9824:	2900      	cmp	r1, #0
c0de9826:	f000 80d2 	beq.w	c0de99ce <pageCallback+0x31e>
c0de982a:	b012      	add	sp, #72	@ 0x48
c0de982c:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9830:	4708      	bx	r1
c0de9832:	4881      	ldr	r0, [pc, #516]	@ (c0de9a38 <pageCallback+0x388>)
c0de9834:	4448      	add	r0, r9
c0de9836:	6981      	ldr	r1, [r0, #24]
c0de9838:	2900      	cmp	r1, #0
c0de983a:	f000 80d1 	beq.w	c0de99e0 <pageCallback+0x330>
c0de983e:	fab4 f084 	clz	r0, r4
c0de9842:	0940      	lsrs	r0, r0, #5
c0de9844:	e059      	b.n	c0de98fa <pageCallback+0x24a>
c0de9846:	487a      	ldr	r0, [pc, #488]	@ (c0de9a30 <pageCallback+0x380>)
c0de9848:	f8df 81ec 	ldr.w	r8, [pc, #492]	@ c0de9a38 <pageCallback+0x388>
c0de984c:	2700      	movs	r7, #0
c0de984e:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de9852:	f04f 0a0b 	mov.w	sl, #11
c0de9856:	4448      	add	r0, r9
c0de9858:	eb09 0608 	add.w	r6, r9, r8
c0de985c:	f890 4020 	ldrb.w	r4, [r0, #32]
c0de9860:	e9d0 b506 	ldrd	fp, r5, [r0, #24]
c0de9864:	200b      	movs	r0, #11
c0de9866:	e9c6 770c 	strd	r7, r7, [r6, #48]	@ 0x30
c0de986a:	e9c6 770e 	strd	r7, r7, [r6, #56]	@ 0x38
c0de986e:	4629      	mov	r1, r5
c0de9870:	4623      	mov	r3, r4
c0de9872:	f002 f9bc 	bl	c0debbee <nbgl_getTextNbLinesInWidth>
c0de9876:	f100 010a 	add.w	r1, r0, #10
c0de987a:	e9c6 b50d 	strd	fp, r5, [r6, #52]	@ 0x34
c0de987e:	f886 4033 	strb.w	r4, [r6, #51]	@ 0x33
c0de9882:	f886 7031 	strb.w	r7, [r6, #49]	@ 0x31
c0de9886:	fbb1 f1fa 	udiv	r1, r1, sl
c0de988a:	b2ca      	uxtb	r2, r1
c0de988c:	f886 1030 	strb.w	r1, [r6, #48]	@ 0x30
c0de9890:	2a02      	cmp	r2, #2
c0de9892:	d31e      	bcc.n	c0de98d2 <pageCallback+0x222>
c0de9894:	3a01      	subs	r2, #1
c0de9896:	241a      	movs	r4, #26
c0de9898:	eb02 0342 	add.w	r3, r2, r2, lsl #1
c0de989c:	3319      	adds	r3, #25
c0de989e:	b29b      	uxth	r3, r3
c0de98a0:	fbb3 f4f4 	udiv	r4, r3, r4
c0de98a4:	b2e4      	uxtb	r4, r4
c0de98a6:	fbb4 f5fa 	udiv	r5, r4, sl
c0de98aa:	fb05 441a 	mls	r4, r5, sl, r4
c0de98ae:	f06f 050a 	mvn.w	r5, #10
c0de98b2:	fb02 0005 	mla	r0, r2, r5, r0
c0de98b6:	f44f 728f 	mov.w	r2, #286	@ 0x11e
c0de98ba:	fbb3 f2f2 	udiv	r2, r3, r2
c0de98be:	b2c0      	uxtb	r0, r0
c0de98c0:	4420      	add	r0, r4
c0de98c2:	4411      	add	r1, r2
c0de98c4:	280b      	cmp	r0, #11
c0de98c6:	eb09 0008 	add.w	r0, r9, r8
c0de98ca:	bf88      	it	hi
c0de98cc:	3101      	addhi	r1, #1
c0de98ce:	f880 1030 	strb.w	r1, [r0, #48]	@ 0x30
c0de98d2:	2000      	movs	r0, #0
c0de98d4:	2101      	movs	r1, #1
c0de98d6:	b012      	add	sp, #72	@ 0x48
c0de98d8:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de98dc:	f001 ba30 	b.w	c0dead40 <displayDetailsPage>
c0de98e0:	4855      	ldr	r0, [pc, #340]	@ (c0de9a38 <pageCallback+0x388>)
c0de98e2:	4448      	add	r0, r9
c0de98e4:	6981      	ldr	r1, [r0, #24]
c0de98e6:	2900      	cmp	r1, #0
c0de98e8:	d07a      	beq.n	c0de99e0 <pageCallback+0x330>
c0de98ea:	2001      	movs	r0, #1
c0de98ec:	e005      	b.n	c0de98fa <pageCallback+0x24a>
c0de98ee:	4852      	ldr	r0, [pc, #328]	@ (c0de9a38 <pageCallback+0x388>)
c0de98f0:	4448      	add	r0, r9
c0de98f2:	6981      	ldr	r1, [r0, #24]
c0de98f4:	2900      	cmp	r1, #0
c0de98f6:	d073      	beq.n	c0de99e0 <pageCallback+0x330>
c0de98f8:	2000      	movs	r0, #0
c0de98fa:	b012      	add	sp, #72	@ 0x48
c0de98fc:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9900:	4708      	bx	r1
c0de9902:	484b      	ldr	r0, [pc, #300]	@ (c0de9a30 <pageCallback+0x380>)
c0de9904:	eb09 0100 	add.w	r1, r9, r0
c0de9908:	4448      	add	r0, r9
c0de990a:	6a49      	ldr	r1, [r1, #36]	@ 0x24
c0de990c:	2900      	cmp	r1, #0
c0de990e:	d06a      	beq.n	c0de99e6 <pageCallback+0x336>
c0de9910:	7c80      	ldrb	r0, [r0, #18]
c0de9912:	4420      	add	r0, r4
c0de9914:	eb01 1000 	add.w	r0, r1, r0, lsl #4
c0de9918:	e06a      	b.n	c0de99f0 <pageCallback+0x340>
c0de991a:	4845      	ldr	r0, [pc, #276]	@ (c0de9a30 <pageCallback+0x380>)
c0de991c:	2100      	movs	r1, #0
c0de991e:	4448      	add	r0, r9
c0de9920:	6581      	str	r1, [r0, #88]	@ 0x58
c0de9922:	f880 1069 	strb.w	r1, [r0, #105]	@ 0x69
c0de9926:	2010      	movs	r0, #16
c0de9928:	e003      	b.n	c0de9932 <pageCallback+0x282>
c0de992a:	4a41      	ldr	r2, [pc, #260]	@ (c0de9a30 <pageCallback+0x380>)
c0de992c:	f001 fc5f 	bl	c0deb1ee <OUTLINED_FUNCTION_4>
c0de9930:	d067      	beq.n	c0de9a02 <pageCallback+0x352>
c0de9932:	b012      	add	sp, #72	@ 0x48
c0de9934:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9938:	f000 bfcc 	b.w	c0dea8d4 <displaySecurityReport>
c0de993c:	4e3e      	ldr	r6, [pc, #248]	@ (c0de9a38 <pageCallback+0x388>)
c0de993e:	eb09 0006 	add.w	r0, r9, r6
c0de9942:	6ac3      	ldr	r3, [r0, #44]	@ 0x2c
c0de9944:	b133      	cbz	r3, c0de9954 <pageCallback+0x2a4>
c0de9946:	eb09 0006 	add.w	r0, r9, r6
c0de994a:	4621      	mov	r1, r4
c0de994c:	f890 2060 	ldrb.w	r2, [r0, #96]	@ 0x60
c0de9950:	4628      	mov	r0, r5
c0de9952:	4798      	blx	r3
c0de9954:	eb09 0006 	add.w	r0, r9, r6
c0de9958:	68c2      	ldr	r2, [r0, #12]
c0de995a:	2a00      	cmp	r2, #0
c0de995c:	d040      	beq.n	c0de99e0 <pageCallback+0x330>
c0de995e:	4628      	mov	r0, r5
c0de9960:	4621      	mov	r1, r4
c0de9962:	b012      	add	sp, #72	@ 0x48
c0de9964:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9968:	4710      	bx	r2
c0de996a:	b2c0      	uxtb	r0, r0
c0de996c:	2100      	movs	r1, #0
c0de996e:	b012      	add	sp, #72	@ 0x48
c0de9970:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9974:	f7ff bbd2 	b.w	c0de911c <displayGenericContextPage>
c0de9978:	482e      	ldr	r0, [pc, #184]	@ (c0de9a34 <pageCallback+0x384>)
c0de997a:	2200      	movs	r2, #0
c0de997c:	eb09 0100 	add.w	r1, r9, r0
c0de9980:	6888      	ldr	r0, [r1, #8]
c0de9982:	3110      	adds	r1, #16
c0de9984:	b012      	add	sp, #72	@ 0x48
c0de9986:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de998a:	f001 b929 	b.w	c0deabe0 <displayInfosListModal>
c0de998e:	2080      	movs	r0, #128	@ 0x80
c0de9990:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de9994:	2303      	movs	r3, #3
c0de9996:	9001      	str	r0, [sp, #4]
c0de9998:	4829      	ldr	r0, [pc, #164]	@ (c0de9a40 <pageCallback+0x390>)
c0de999a:	eb09 0400 	add.w	r4, r9, r0
c0de999e:	200b      	movs	r0, #11
c0de99a0:	9400      	str	r4, [sp, #0]
c0de99a2:	f002 f933 	bl	c0debc0c <nbgl_textReduceOnNbLines>
c0de99a6:	9404      	str	r4, [sp, #16]
c0de99a8:	eb09 0406 	add.w	r4, r9, r6
c0de99ac:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0de99ae:	a902      	add	r1, sp, #8
c0de99b0:	f7fc fe0b 	bl	c0de65ca <nbgl_layoutAddQRCode>
c0de99b4:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0de99b6:	4925      	ldr	r1, [pc, #148]	@ (c0de9a4c <pageCallback+0x39c>)
c0de99b8:	2215      	movs	r2, #21
c0de99ba:	2309      	movs	r3, #9
c0de99bc:	4479      	add	r1, pc
c0de99be:	f7fd fa38 	bl	c0de6e32 <nbgl_layoutAddFooter>
c0de99c2:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0de99c4:	f7fd febe 	bl	c0de7744 <nbgl_layoutDraw>
c0de99c8:	f002 f8b7 	bl	c0debb3a <nbgl_refresh>
c0de99cc:	e008      	b.n	c0de99e0 <pageCallback+0x330>
c0de99ce:	2c01      	cmp	r4, #1
c0de99d0:	d106      	bne.n	c0de99e0 <pageCallback+0x330>
c0de99d2:	4448      	add	r0, r9
c0de99d4:	6840      	ldr	r0, [r0, #4]
c0de99d6:	b118      	cbz	r0, c0de99e0 <pageCallback+0x330>
c0de99d8:	b012      	add	sp, #72	@ 0x48
c0de99da:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de99de:	4700      	bx	r0
c0de99e0:	b012      	add	sp, #72	@ 0x48
c0de99e2:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de99e6:	6a81      	ldr	r1, [r0, #40]	@ 0x28
c0de99e8:	7c80      	ldrb	r0, [r0, #18]
c0de99ea:	4420      	add	r0, r4
c0de99ec:	b2c0      	uxtb	r0, r0
c0de99ee:	4788      	blx	r1
c0de99f0:	e9d0 3100 	ldrd	r3, r1, [r0]
c0de99f4:	6882      	ldr	r2, [r0, #8]
c0de99f6:	4618      	mov	r0, r3
c0de99f8:	b012      	add	sp, #72	@ 0x48
c0de99fa:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de99fe:	f000 be8b 	b.w	c0dea718 <displayFullValuePage>
c0de9a02:	eb09 0002 	add.w	r0, r9, r2
c0de9a06:	f890 0069 	ldrb.w	r0, [r0, #105]	@ 0x69
c0de9a0a:	b120      	cbz	r0, c0de9a16 <pageCallback+0x366>
c0de9a0c:	6948      	ldr	r0, [r1, #20]
c0de9a0e:	e003      	b.n	c0de9a18 <pageCallback+0x368>
c0de9a10:	b938      	cbnz	r0, c0de9a22 <pageCallback+0x372>
c0de9a12:	4620      	mov	r0, r4
c0de9a14:	e693      	b.n	c0de973e <pageCallback+0x8e>
c0de9a16:	6988      	ldr	r0, [r1, #24]
c0de9a18:	b012      	add	sp, #72	@ 0x48
c0de9a1a:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9a1e:	f001 b863 	b.w	c0deaae8 <displayCustomizedSecurityReport>
c0de9a22:	4620      	mov	r0, r4
c0de9a24:	2100      	movs	r1, #0
c0de9a26:	b012      	add	sp, #72	@ 0x48
c0de9a28:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9a2c:	f7ff ba30 	b.w	c0de8e90 <displaySettingsPage>
c0de9a30:	000018fc 	.word	0x000018fc
c0de9a34:	00001c44 	.word	0x00001c44
c0de9a38:	00001bc8 	.word	0x00001bc8
c0de9a3c:	00001a10 	.word	0x00001a10
c0de9a40:	00001b48 	.word	0x00001b48
c0de9a44:	0000608c 	.word	0x0000608c
c0de9a48:	00006004 	.word	0x00006004
c0de9a4c:	000041b0 	.word	0x000041b0
c0de9a50:	0000606a 	.word	0x0000606a
c0de9a54:	00000407 	.word	0x00000407

c0de9a58 <nbgl_useCaseReviewStatus>:
c0de9a58:	460a      	mov	r2, r1
c0de9a5a:	b198      	cbz	r0, c0de9a84 <nbgl_useCaseReviewStatus+0x2c>
c0de9a5c:	2801      	cmp	r0, #1
c0de9a5e:	d016      	beq.n	c0de9a8e <nbgl_useCaseReviewStatus+0x36>
c0de9a60:	2802      	cmp	r0, #2
c0de9a62:	d019      	beq.n	c0de9a98 <nbgl_useCaseReviewStatus+0x40>
c0de9a64:	2803      	cmp	r0, #3
c0de9a66:	d01c      	beq.n	c0de9aa2 <nbgl_useCaseReviewStatus+0x4a>
c0de9a68:	2804      	cmp	r0, #4
c0de9a6a:	d01f      	beq.n	c0de9aac <nbgl_useCaseReviewStatus+0x54>
c0de9a6c:	2807      	cmp	r0, #7
c0de9a6e:	d022      	beq.n	c0de9ab6 <nbgl_useCaseReviewStatus+0x5e>
c0de9a70:	2806      	cmp	r0, #6
c0de9a72:	d025      	beq.n	c0de9ac0 <nbgl_useCaseReviewStatus+0x68>
c0de9a74:	2805      	cmp	r0, #5
c0de9a76:	bf18      	it	ne
c0de9a78:	4770      	bxne	lr
c0de9a7a:	4815      	ldr	r0, [pc, #84]	@ (c0de9ad0 <nbgl_useCaseReviewStatus+0x78>)
c0de9a7c:	2100      	movs	r1, #0
c0de9a7e:	4478      	add	r0, pc
c0de9a80:	f7ff bdb2 	b.w	c0de95e8 <nbgl_useCaseStatus>
c0de9a84:	4813      	ldr	r0, [pc, #76]	@ (c0de9ad4 <nbgl_useCaseReviewStatus+0x7c>)
c0de9a86:	2101      	movs	r1, #1
c0de9a88:	4478      	add	r0, pc
c0de9a8a:	f7ff bdad 	b.w	c0de95e8 <nbgl_useCaseStatus>
c0de9a8e:	4812      	ldr	r0, [pc, #72]	@ (c0de9ad8 <nbgl_useCaseReviewStatus+0x80>)
c0de9a90:	2100      	movs	r1, #0
c0de9a92:	4478      	add	r0, pc
c0de9a94:	f7ff bda8 	b.w	c0de95e8 <nbgl_useCaseStatus>
c0de9a98:	4810      	ldr	r0, [pc, #64]	@ (c0de9adc <nbgl_useCaseReviewStatus+0x84>)
c0de9a9a:	2101      	movs	r1, #1
c0de9a9c:	4478      	add	r0, pc
c0de9a9e:	f7ff bda3 	b.w	c0de95e8 <nbgl_useCaseStatus>
c0de9aa2:	480f      	ldr	r0, [pc, #60]	@ (c0de9ae0 <nbgl_useCaseReviewStatus+0x88>)
c0de9aa4:	2100      	movs	r1, #0
c0de9aa6:	4478      	add	r0, pc
c0de9aa8:	f7ff bd9e 	b.w	c0de95e8 <nbgl_useCaseStatus>
c0de9aac:	4807      	ldr	r0, [pc, #28]	@ (c0de9acc <nbgl_useCaseReviewStatus+0x74>)
c0de9aae:	2101      	movs	r1, #1
c0de9ab0:	4478      	add	r0, pc
c0de9ab2:	f7ff bd99 	b.w	c0de95e8 <nbgl_useCaseStatus>
c0de9ab6:	480c      	ldr	r0, [pc, #48]	@ (c0de9ae8 <nbgl_useCaseReviewStatus+0x90>)
c0de9ab8:	2100      	movs	r1, #0
c0de9aba:	4478      	add	r0, pc
c0de9abc:	f7ff bd94 	b.w	c0de95e8 <nbgl_useCaseStatus>
c0de9ac0:	4808      	ldr	r0, [pc, #32]	@ (c0de9ae4 <nbgl_useCaseReviewStatus+0x8c>)
c0de9ac2:	2101      	movs	r1, #1
c0de9ac4:	4478      	add	r0, pc
c0de9ac6:	f7ff bd8f 	b.w	c0de95e8 <nbgl_useCaseStatus>
c0de9aca:	bf00      	nop
c0de9acc:	00003e16 	.word	0x00003e16
c0de9ad0:	00003ec7 	.word	0x00003ec7
c0de9ad4:	00003ff3 	.word	0x00003ff3
c0de9ad8:	000045f3 	.word	0x000045f3
c0de9adc:	000040c1 	.word	0x000040c1
c0de9ae0:	00004429 	.word	0x00004429
c0de9ae4:	00003f51 	.word	0x00003f51
c0de9ae8:	00003e1d 	.word	0x00003e1d

c0de9aec <nbgl_useCaseChoice>:
c0de9aec:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9af0:	b088      	sub	sp, #32
c0de9af2:	4683      	mov	fp, r0
c0de9af4:	4668      	mov	r0, sp
c0de9af6:	460e      	mov	r6, r1
c0de9af8:	2118      	movs	r1, #24
c0de9afa:	461c      	mov	r4, r3
c0de9afc:	4617      	mov	r7, r2
c0de9afe:	3008      	adds	r0, #8
c0de9b00:	f002 fc5a 	bl	c0dec3b8 <__aeabi_memclr>
c0de9b04:	b324      	cbz	r4, c0de9b50 <nbgl_useCaseChoice+0x64>
c0de9b06:	f8dd 8040 	ldr.w	r8, [sp, #64]	@ 0x40
c0de9b0a:	f1b8 0f00 	cmp.w	r8, #0
c0de9b0e:	d01f      	beq.n	c0de9b50 <nbgl_useCaseChoice+0x64>
c0de9b10:	4811      	ldr	r0, [pc, #68]	@ (c0de9b58 <nbgl_useCaseChoice+0x6c>)
c0de9b12:	f8dd a044 	ldr.w	sl, [sp, #68]	@ 0x44
c0de9b16:	eb09 0500 	add.w	r5, r9, r0
c0de9b1a:	f7ff f967 	bl	c0de8dec <reset_callbacks_and_context>
c0de9b1e:	2000      	movs	r0, #0
c0de9b20:	f8c5 a018 	str.w	sl, [r5, #24]
c0de9b24:	e9cd 6700 	strd	r6, r7, [sp]
c0de9b28:	f8cd 8018 	str.w	r8, [sp, #24]
c0de9b2c:	9405      	str	r4, [sp, #20]
c0de9b2e:	f8cd b00c 	str.w	fp, [sp, #12]
c0de9b32:	4669      	mov	r1, sp
c0de9b34:	f88d 0011 	strb.w	r0, [sp, #17]
c0de9b38:	2009      	movs	r0, #9
c0de9b3a:	f88d 001e 	strb.w	r0, [sp, #30]
c0de9b3e:	f88d 001c 	strb.w	r0, [sp, #28]
c0de9b42:	4806      	ldr	r0, [pc, #24]	@ (c0de9b5c <nbgl_useCaseChoice+0x70>)
c0de9b44:	4478      	add	r0, pc
c0de9b46:	f7fe fcd3 	bl	c0de84f0 <nbgl_pageDrawConfirmation>
c0de9b4a:	6168      	str	r0, [r5, #20]
c0de9b4c:	f001 fb4c 	bl	c0deb1e8 <OUTLINED_FUNCTION_3>
c0de9b50:	b008      	add	sp, #32
c0de9b52:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de9b56:	bf00      	nop
c0de9b58:	00001bc8 	.word	0x00001bc8
c0de9b5c:	fffffb69 	.word	0xfffffb69

c0de9b60 <nbgl_useCaseConfirm>:
c0de9b60:	b570      	push	{r4, r5, r6, lr}
c0de9b62:	b088      	sub	sp, #32
c0de9b64:	4c0f      	ldr	r4, [pc, #60]	@ (c0de9ba4 <nbgl_useCaseConfirm+0x44>)
c0de9b66:	9e0c      	ldr	r6, [sp, #48]	@ 0x30
c0de9b68:	f10d 0c14 	add.w	ip, sp, #20
c0de9b6c:	eb09 0504 	add.w	r5, r9, r4
c0de9b70:	61ee      	str	r6, [r5, #28]
c0de9b72:	4e0d      	ldr	r6, [pc, #52]	@ (c0de9ba8 <nbgl_useCaseConfirm+0x48>)
c0de9b74:	e8ac 004c 	stmia.w	ip!, {r2, r3, r6}
c0de9b78:	2200      	movs	r2, #0
c0de9b7a:	9204      	str	r2, [sp, #16]
c0de9b7c:	4b0b      	ldr	r3, [pc, #44]	@ (c0de9bac <nbgl_useCaseConfirm+0x4c>)
c0de9b7e:	447b      	add	r3, pc
c0de9b80:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0de9b84:	6a28      	ldr	r0, [r5, #32]
c0de9b86:	b108      	cbz	r0, c0de9b8c <nbgl_useCaseConfirm+0x2c>
c0de9b88:	f7fe ff15 	bl	c0de89b6 <nbgl_pageRelease>
c0de9b8c:	4808      	ldr	r0, [pc, #32]	@ (c0de9bb0 <nbgl_useCaseConfirm+0x50>)
c0de9b8e:	4669      	mov	r1, sp
c0de9b90:	4478      	add	r0, pc
c0de9b92:	f7fe fcad 	bl	c0de84f0 <nbgl_pageDrawConfirmation>
c0de9b96:	eb09 0104 	add.w	r1, r9, r4
c0de9b9a:	6208      	str	r0, [r1, #32]
c0de9b9c:	f001 fb24 	bl	c0deb1e8 <OUTLINED_FUNCTION_3>
c0de9ba0:	b008      	add	sp, #32
c0de9ba2:	bd70      	pop	{r4, r5, r6, pc}
c0de9ba4:	00001bc8 	.word	0x00001bc8
c0de9ba8:	01090009 	.word	0x01090009
c0de9bac:	00003268 	.word	0x00003268
c0de9bb0:	00000021 	.word	0x00000021

c0de9bb4 <pageModalCallback>:
c0de9bb4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de9bb6:	460c      	mov	r4, r1
c0de9bb8:	280e      	cmp	r0, #14
c0de9bba:	d008      	beq.n	c0de9bce <pageModalCallback+0x1a>
c0de9bbc:	4605      	mov	r5, r0
c0de9bbe:	280f      	cmp	r0, #15
c0de9bc0:	d117      	bne.n	c0de9bf2 <pageModalCallback+0x3e>
c0de9bc2:	4833      	ldr	r0, [pc, #204]	@ (c0de9c90 <pageModalCallback+0xdc>)
c0de9bc4:	4448      	add	r0, r9
c0de9bc6:	e9d0 2104 	ldrd	r2, r1, [r0, #16]
c0de9bca:	6983      	ldr	r3, [r0, #24]
c0de9bcc:	e005      	b.n	c0de9bda <pageModalCallback+0x26>
c0de9bce:	482f      	ldr	r0, [pc, #188]	@ (c0de9c8c <pageModalCallback+0xd8>)
c0de9bd0:	4448      	add	r0, r9
c0de9bd2:	6b40      	ldr	r0, [r0, #52]	@ 0x34
c0de9bd4:	e9d0 2100 	ldrd	r2, r1, [r0]
c0de9bd8:	6883      	ldr	r3, [r0, #8]
c0de9bda:	f852 0024 	ldr.w	r0, [r2, r4, lsl #2]
c0de9bde:	eb04 0244 	add.w	r2, r4, r4, lsl #1
c0de9be2:	f851 1024 	ldr.w	r1, [r1, r4, lsl #2]
c0de9be6:	eb03 02c2 	add.w	r2, r3, r2, lsl #3
c0de9bea:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de9bee:	f000 bd93 	b.w	c0dea718 <displayFullValuePage>
c0de9bf2:	4e28      	ldr	r6, [pc, #160]	@ (c0de9c94 <pageModalCallback+0xe0>)
c0de9bf4:	eb09 0706 	add.w	r7, r9, r6
c0de9bf8:	6a38      	ldr	r0, [r7, #32]
c0de9bfa:	f7fe fedc 	bl	c0de89b6 <nbgl_pageRelease>
c0de9bfe:	2000      	movs	r0, #0
c0de9c00:	2d02      	cmp	r5, #2
c0de9c02:	6238      	str	r0, [r7, #32]
c0de9c04:	d032      	beq.n	c0de9c6c <pageModalCallback+0xb8>
c0de9c06:	2d13      	cmp	r5, #19
c0de9c08:	d00f      	beq.n	c0de9c2a <pageModalCallback+0x76>
c0de9c0a:	2d04      	cmp	r5, #4
c0de9c0c:	d01e      	beq.n	c0de9c4c <pageModalCallback+0x98>
c0de9c0e:	2d05      	cmp	r5, #5
c0de9c10:	d024      	beq.n	c0de9c5c <pageModalCallback+0xa8>
c0de9c12:	2d09      	cmp	r5, #9
c0de9c14:	d029      	beq.n	c0de9c6a <pageModalCallback+0xb6>
c0de9c16:	2d03      	cmp	r5, #3
c0de9c18:	d137      	bne.n	c0de9c8a <pageModalCallback+0xd6>
c0de9c1a:	2cff      	cmp	r4, #255	@ 0xff
c0de9c1c:	d026      	beq.n	c0de9c6c <pageModalCallback+0xb8>
c0de9c1e:	4620      	mov	r0, r4
c0de9c20:	2100      	movs	r1, #0
c0de9c22:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de9c26:	f001 b88b 	b.w	c0dead40 <displayDetailsPage>
c0de9c2a:	4818      	ldr	r0, [pc, #96]	@ (c0de9c8c <pageModalCallback+0xd8>)
c0de9c2c:	eb09 0100 	add.w	r1, r9, r0
c0de9c30:	f891 1068 	ldrb.w	r1, [r1, #104]	@ 0x68
c0de9c34:	2902      	cmp	r1, #2
c0de9c36:	d119      	bne.n	c0de9c6c <pageModalCallback+0xb8>
c0de9c38:	4448      	add	r0, r9
c0de9c3a:	2101      	movs	r1, #1
c0de9c3c:	f880 1068 	strb.w	r1, [r0, #104]	@ 0x68
c0de9c40:	6d80      	ldr	r0, [r0, #88]	@ 0x58
c0de9c42:	6800      	ldr	r0, [r0, #0]
c0de9c44:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de9c48:	f000 be44 	b.w	c0dea8d4 <displaySecurityReport>
c0de9c4c:	2cff      	cmp	r4, #255	@ 0xff
c0de9c4e:	d00d      	beq.n	c0de9c6c <pageModalCallback+0xb8>
c0de9c50:	4620      	mov	r0, r4
c0de9c52:	2100      	movs	r1, #0
c0de9c54:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de9c58:	f001 b92c 	b.w	c0deaeb4 <displayTagValueListModalPage>
c0de9c5c:	b934      	cbnz	r4, c0de9c6c <pageModalCallback+0xb8>
c0de9c5e:	20ff      	movs	r0, #255	@ 0xff
c0de9c60:	2101      	movs	r1, #1
c0de9c62:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de9c66:	f7ff ba59 	b.w	c0de911c <displayGenericContextPage>
c0de9c6a:	b12c      	cbz	r4, c0de9c78 <pageModalCallback+0xc4>
c0de9c6c:	f001 ff8d 	bl	c0debb8a <nbgl_screenRedraw>
c0de9c70:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de9c74:	f001 bf61 	b.w	c0debb3a <nbgl_refresh>
c0de9c78:	eb09 0006 	add.w	r0, r9, r6
c0de9c7c:	69c0      	ldr	r0, [r0, #28]
c0de9c7e:	b120      	cbz	r0, c0de9c8a <pageModalCallback+0xd6>
c0de9c80:	4780      	blx	r0
c0de9c82:	eb09 0006 	add.w	r0, r9, r6
c0de9c86:	2100      	movs	r1, #0
c0de9c88:	61c1      	str	r1, [r0, #28]
c0de9c8a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de9c8c:	000018fc 	.word	0x000018fc
c0de9c90:	00001c44 	.word	0x00001c44
c0de9c94:	00001bc8 	.word	0x00001bc8

c0de9c98 <displayReviewPage>:
c0de9c98:	b570      	push	{r4, r5, r6, lr}
c0de9c9a:	b090      	sub	sp, #64	@ 0x40
c0de9c9c:	460c      	mov	r4, r1
c0de9c9e:	4605      	mov	r5, r0
c0de9ca0:	4668      	mov	r0, sp
c0de9ca2:	2140      	movs	r1, #64	@ 0x40
c0de9ca4:	f002 fb88 	bl	c0dec3b8 <__aeabi_memclr>
c0de9ca8:	4e24      	ldr	r6, [pc, #144]	@ (c0de9d3c <displayReviewPage+0xa4>)
c0de9caa:	eb09 0006 	add.w	r0, r9, r6
c0de9cae:	f890 0061 	ldrb.w	r0, [r0, #97]	@ 0x61
c0de9cb2:	b108      	cbz	r0, c0de9cb8 <displayReviewPage+0x20>
c0de9cb4:	42a8      	cmp	r0, r5
c0de9cb6:	d93f      	bls.n	c0de9d38 <displayReviewPage+0xa0>
c0de9cb8:	eb09 0006 	add.w	r0, r9, r6
c0de9cbc:	6882      	ldr	r2, [r0, #8]
c0de9cbe:	f880 5060 	strb.w	r5, [r0, #96]	@ 0x60
c0de9cc2:	b3ca      	cbz	r2, c0de9d38 <displayReviewPage+0xa0>
c0de9cc4:	4669      	mov	r1, sp
c0de9cc6:	4628      	mov	r0, r5
c0de9cc8:	4790      	blx	r2
c0de9cca:	b3a8      	cbz	r0, c0de9d38 <displayReviewPage+0xa0>
c0de9ccc:	2009      	movs	r0, #9
c0de9cce:	2100      	movs	r1, #0
c0de9cd0:	f88d 0006 	strb.w	r0, [sp, #6]
c0de9cd4:	f89d 000c 	ldrb.w	r0, [sp, #12]
c0de9cd8:	f88d 1004 	strb.w	r1, [sp, #4]
c0de9cdc:	9100      	str	r1, [sp, #0]
c0de9cde:	2806      	cmp	r0, #6
c0de9ce0:	d00e      	beq.n	c0de9d00 <displayReviewPage+0x68>
c0de9ce2:	2804      	cmp	r0, #4
c0de9ce4:	d015      	beq.n	c0de9d12 <displayReviewPage+0x7a>
c0de9ce6:	2805      	cmp	r0, #5
c0de9ce8:	d010      	beq.n	c0de9d0c <displayReviewPage+0x74>
c0de9cea:	2802      	cmp	r0, #2
c0de9cec:	d114      	bne.n	c0de9d18 <displayReviewPage+0x80>
c0de9cee:	eb09 0006 	add.w	r0, r9, r6
c0de9cf2:	f890 1060 	ldrb.w	r1, [r0, #96]	@ 0x60
c0de9cf6:	3101      	adds	r1, #1
c0de9cf8:	f880 1061 	strb.w	r1, [r0, #97]	@ 0x61
c0de9cfc:	200b      	movs	r0, #11
c0de9cfe:	e009      	b.n	c0de9d14 <displayReviewPage+0x7c>
c0de9d00:	200b      	movs	r0, #11
c0de9d02:	f88d 101c 	strb.w	r1, [sp, #28]
c0de9d06:	f88d 0038 	strb.w	r0, [sp, #56]	@ 0x38
c0de9d0a:	e005      	b.n	c0de9d18 <displayReviewPage+0x80>
c0de9d0c:	2009      	movs	r0, #9
c0de9d0e:	f88d 001a 	strb.w	r0, [sp, #26]
c0de9d12:	2000      	movs	r0, #0
c0de9d14:	f88d 001c 	strb.w	r0, [sp, #28]
c0de9d18:	4809      	ldr	r0, [pc, #36]	@ (c0de9d40 <displayReviewPage+0xa8>)
c0de9d1a:	eb09 0506 	add.w	r5, r9, r6
c0de9d1e:	466a      	mov	r2, sp
c0de9d20:	f105 0160 	add.w	r1, r5, #96	@ 0x60
c0de9d24:	4478      	add	r0, pc
c0de9d26:	f7fe fe43 	bl	c0de89b0 <nbgl_pageDrawGenericContent>
c0de9d2a:	6168      	str	r0, [r5, #20]
c0de9d2c:	2001      	movs	r0, #1
c0de9d2e:	2c00      	cmp	r4, #0
c0de9d30:	bf18      	it	ne
c0de9d32:	2002      	movne	r0, #2
c0de9d34:	f001 ff06 	bl	c0debb44 <nbgl_refreshSpecial>
c0de9d38:	b010      	add	sp, #64	@ 0x40
c0de9d3a:	bd70      	pop	{r4, r5, r6, pc}
c0de9d3c:	00001bc8 	.word	0x00001bc8
c0de9d40:	fffff989 	.word	0xfffff989

c0de9d44 <nbgl_useCaseReview>:
c0de9d44:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de9d46:	b087      	sub	sp, #28
c0de9d48:	461c      	mov	r4, r3
c0de9d4a:	f001 fa3d 	bl	c0deb1c8 <OUTLINED_FUNCTION_0>
c0de9d4e:	2001      	movs	r0, #1
c0de9d50:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de9d52:	462a      	mov	r2, r5
c0de9d54:	4623      	mov	r3, r4
c0de9d56:	9005      	str	r0, [sp, #20]
c0de9d58:	2000      	movs	r0, #0
c0de9d5a:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de9d5e:	9004      	str	r0, [sp, #16]
c0de9d60:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de9d62:	4631      	mov	r1, r6
c0de9d64:	f001 fa52 	bl	c0deb20c <OUTLINED_FUNCTION_7>
c0de9d68:	b007      	add	sp, #28
c0de9d6a:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de9d6c <useCaseReview>:
c0de9d6c:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de9d70:	4682      	mov	sl, r0
c0de9d72:	4840      	ldr	r0, [pc, #256]	@ (c0de9e74 <useCaseReview+0x108>)
c0de9d74:	4688      	mov	r8, r1
c0de9d76:	2102      	movs	r1, #2
c0de9d78:	4614      	mov	r4, r2
c0de9d7a:	f04f 0b00 	mov.w	fp, #0
c0de9d7e:	4e40      	ldr	r6, [pc, #256]	@ (c0de9e80 <useCaseReview+0x114>)
c0de9d80:	461f      	mov	r7, r3
c0de9d82:	f809 1000 	strb.w	r1, [r9, r0]
c0de9d86:	493c      	ldr	r1, [pc, #240]	@ (c0de9e78 <useCaseReview+0x10c>)
c0de9d88:	4448      	add	r0, r9
c0de9d8a:	eb09 0506 	add.w	r5, r9, r6
c0de9d8e:	9a0d      	ldr	r2, [sp, #52]	@ 0x34
c0de9d90:	4449      	add	r1, r9
c0de9d92:	e9c1 a208 	strd	sl, r2, [r1, #32]
c0de9d96:	493b      	ldr	r1, [pc, #236]	@ (c0de9e84 <useCaseReview+0x118>)
c0de9d98:	f8c0 b010 	str.w	fp, [r0, #16]
c0de9d9c:	4479      	add	r1, pc
c0de9d9e:	6181      	str	r1, [r0, #24]
c0de9da0:	4836      	ldr	r0, [pc, #216]	@ (c0de9e7c <useCaseReview+0x110>)
c0de9da2:	2103      	movs	r1, #3
c0de9da4:	4448      	add	r0, r9
c0de9da6:	7301      	strb	r1, [r0, #12]
c0de9da8:	6085      	str	r5, [r0, #8]
c0de9daa:	4628      	mov	r0, r5
c0de9dac:	21a8      	movs	r1, #168	@ 0xa8
c0de9dae:	f002 fb03 	bl	c0dec3b8 <__aeabi_memclr>
c0de9db2:	2001      	movs	r0, #1
c0de9db4:	f8a5 b024 	strh.w	fp, [r5, #36]	@ 0x24
c0de9db8:	f809 0006 	strb.w	r0, [r9, r6]
c0de9dbc:	4832      	ldr	r0, [pc, #200]	@ (c0de9e88 <useCaseReview+0x11c>)
c0de9dbe:	4478      	add	r0, pc
c0de9dc0:	6228      	str	r0, [r5, #32]
c0de9dc2:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de9dc4:	616f      	str	r7, [r5, #20]
c0de9dc6:	9401      	str	r4, [sp, #4]
c0de9dc8:	60ac      	str	r4, [r5, #8]
c0de9dca:	f885 b004 	strb.w	fp, [r5, #4]
c0de9dce:	61e8      	str	r0, [r5, #28]
c0de9dd0:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de9dd2:	f001 f915 	bl	c0deb000 <initWarningTipBox>
c0de9dd6:	2004      	movs	r0, #4
c0de9dd8:	4641      	mov	r1, r8
c0de9dda:	f885 0038 	strb.w	r0, [r5, #56]	@ 0x38
c0de9dde:	f105 003c 	add.w	r0, r5, #60	@ 0x3c
c0de9de2:	e891 00dc 	ldmia.w	r1, {r2, r3, r4, r6, r7}
c0de9de6:	c0dc      	stmia	r0!, {r2, r3, r4, r6, r7}
c0de9de8:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de9dec:	66e8      	str	r0, [r5, #108]	@ 0x6c
c0de9dee:	e9dd 050e 	ldrd	r0, r5, [sp, #56]	@ 0x38
c0de9df2:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
c0de9df4:	b190      	cbz	r0, c0de9e1c <useCaseReview+0xb0>
c0de9df6:	4922      	ldr	r1, [pc, #136]	@ (c0de9e80 <useCaseReview+0x114>)
c0de9df8:	2203      	movs	r2, #3
c0de9dfa:	eb09 0001 	add.w	r0, r9, r1
c0de9dfe:	f880 2070 	strb.w	r2, [r0, #112]	@ 0x70
c0de9e02:	9a01      	ldr	r2, [sp, #4]
c0de9e04:	b343      	cbz	r3, c0de9e58 <useCaseReview+0xec>
c0de9e06:	eb09 0001 	add.w	r0, r9, r1
c0de9e0a:	210b      	movs	r1, #11
c0de9e0c:	f880 1080 	strb.w	r1, [r0, #128]	@ 0x80
c0de9e10:	4921      	ldr	r1, [pc, #132]	@ (c0de9e98 <useCaseReview+0x12c>)
c0de9e12:	e9c0 321d 	strd	r3, r2, [r0, #116]	@ 0x74
c0de9e16:	4479      	add	r1, pc
c0de9e18:	67c1      	str	r1, [r0, #124]	@ 0x7c
c0de9e1a:	e00a      	b.n	c0de9e32 <useCaseReview+0xc6>
c0de9e1c:	4818      	ldr	r0, [pc, #96]	@ (c0de9e80 <useCaseReview+0x114>)
c0de9e1e:	2102      	movs	r1, #2
c0de9e20:	9a01      	ldr	r2, [sp, #4]
c0de9e22:	4448      	add	r0, r9
c0de9e24:	f880 1070 	strb.w	r1, [r0, #112]	@ 0x70
c0de9e28:	f100 0174 	add.w	r1, r0, #116	@ 0x74
c0de9e2c:	4650      	mov	r0, sl
c0de9e2e:	f000 fa07 	bl	c0dea240 <prepareReviewLastPage>
c0de9e32:	f3ca 1000 	ubfx	r0, sl, #4, #1
c0de9e36:	f7ff f8b7 	bl	c0de8fa8 <getNbPagesForGenericContents>
c0de9e3a:	4a18      	ldr	r2, [pc, #96]	@ (c0de9e9c <useCaseReview+0x130>)
c0de9e3c:	4601      	mov	r1, r0
c0de9e3e:	2001      	movs	r0, #1
c0de9e40:	447a      	add	r2, pc
c0de9e42:	f7fe ffe9 	bl	c0de8e18 <prepareNavInfo>
c0de9e46:	b10d      	cbz	r5, c0de9e4c <useCaseReview+0xe0>
c0de9e48:	f001 f9dd 	bl	c0deb206 <OUTLINED_FUNCTION_6>
c0de9e4c:	2000      	movs	r0, #0
c0de9e4e:	2101      	movs	r1, #1
c0de9e50:	e8bd 4dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de9e54:	f7ff b962 	b.w	c0de911c <displayGenericContextPage>
c0de9e58:	f01a 0007 	ands.w	r0, sl, #7
c0de9e5c:	d004      	beq.n	c0de9e68 <useCaseReview+0xfc>
c0de9e5e:	2801      	cmp	r0, #1
c0de9e60:	d105      	bne.n	c0de9e6e <useCaseReview+0x102>
c0de9e62:	4b0b      	ldr	r3, [pc, #44]	@ (c0de9e90 <useCaseReview+0x124>)
c0de9e64:	447b      	add	r3, pc
c0de9e66:	e7ce      	b.n	c0de9e06 <useCaseReview+0x9a>
c0de9e68:	4b08      	ldr	r3, [pc, #32]	@ (c0de9e8c <useCaseReview+0x120>)
c0de9e6a:	447b      	add	r3, pc
c0de9e6c:	e7cb      	b.n	c0de9e06 <useCaseReview+0x9a>
c0de9e6e:	4b09      	ldr	r3, [pc, #36]	@ (c0de9e94 <useCaseReview+0x128>)
c0de9e70:	447b      	add	r3, pc
c0de9e72:	e7c8      	b.n	c0de9e06 <useCaseReview+0x9a>
c0de9e74:	00001bc8 	.word	0x00001bc8
c0de9e78:	00001c44 	.word	0x00001c44
c0de9e7c:	000018fc 	.word	0x000018fc
c0de9e80:	00001968 	.word	0x00001968
c0de9e84:	0000123d 	.word	0x0000123d
c0de9e88:	000043c4 	.word	0x000043c4
c0de9e8c:	00003d08 	.word	0x00003d08
c0de9e90:	00003cdd 	.word	0x00003cdd
c0de9e94:	00004256 	.word	0x00004256
c0de9e98:	00003afe 	.word	0x00003afe
c0de9e9c:	00003b18 	.word	0x00003b18

c0de9ea0 <nbgl_useCaseReviewBlindSigning>:
c0de9ea0:	b510      	push	{r4, lr}
c0de9ea2:	b086      	sub	sp, #24
c0de9ea4:	9c0b      	ldr	r4, [sp, #44]	@ 0x2c
c0de9ea6:	9404      	str	r4, [sp, #16]
c0de9ea8:	4c06      	ldr	r4, [pc, #24]	@ (c0de9ec4 <nbgl_useCaseReviewBlindSigning+0x24>)
c0de9eaa:	447c      	add	r4, pc
c0de9eac:	9403      	str	r4, [sp, #12]
c0de9eae:	9c0a      	ldr	r4, [sp, #40]	@ 0x28
c0de9eb0:	9402      	str	r4, [sp, #8]
c0de9eb2:	9c09      	ldr	r4, [sp, #36]	@ 0x24
c0de9eb4:	9401      	str	r4, [sp, #4]
c0de9eb6:	9c08      	ldr	r4, [sp, #32]
c0de9eb8:	9400      	str	r4, [sp, #0]
c0de9eba:	f000 f805 	bl	c0de9ec8 <nbgl_useCaseAdvancedReview>
c0de9ebe:	b006      	add	sp, #24
c0de9ec0:	bd10      	pop	{r4, pc}
c0de9ec2:	bf00      	nop
c0de9ec4:	00005896 	.word	0x00005896

c0de9ec8 <nbgl_useCaseAdvancedReview>:
c0de9ec8:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9ecc:	b088      	sub	sp, #32
c0de9ece:	e9cd 2306 	strd	r2, r3, [sp, #24]
c0de9ed2:	460e      	mov	r6, r1
c0de9ed4:	4605      	mov	r5, r0
c0de9ed6:	f7fe ff89 	bl	c0de8dec <reset_callbacks_and_context>
c0de9eda:	f10d 0b48 	add.w	fp, sp, #72	@ 0x48
c0de9ede:	482b      	ldr	r0, [pc, #172]	@ (c0de9f8c <nbgl_useCaseAdvancedReview+0xc4>)
c0de9ee0:	e9dd 4810 	ldrd	r4, r8, [sp, #64]	@ 0x40
c0de9ee4:	e89b 0c80 	ldmia.w	fp, {r7, sl, fp}
c0de9ee8:	4448      	add	r0, r9
c0de9eea:	b127      	cbz	r7, c0de9ef6 <nbgl_useCaseAdvancedReview+0x2e>
c0de9eec:	4639      	mov	r1, r7
c0de9eee:	2220      	movs	r2, #32
c0de9ef0:	f002 fa58 	bl	c0dec3a4 <__aeabi_memcpy>
c0de9ef4:	e002      	b.n	c0de9efc <nbgl_useCaseAdvancedReview+0x34>
c0de9ef6:	2120      	movs	r1, #32
c0de9ef8:	f002 fa5e 	bl	c0dec3b8 <__aeabi_memclr>
c0de9efc:	f1ba 0f00 	cmp.w	sl, #0
c0de9f00:	d028      	beq.n	c0de9f54 <nbgl_useCaseAdvancedReview+0x8c>
c0de9f02:	f8da 0000 	ldr.w	r0, [sl]
c0de9f06:	b928      	cbnz	r0, c0de9f14 <nbgl_useCaseAdvancedReview+0x4c>
c0de9f08:	f8da 1014 	ldr.w	r1, [sl, #20]
c0de9f0c:	b911      	cbnz	r1, c0de9f14 <nbgl_useCaseAdvancedReview+0x4c>
c0de9f0e:	f8da 1018 	ldr.w	r1, [sl, #24]
c0de9f12:	b1f9      	cbz	r1, c0de9f54 <nbgl_useCaseAdvancedReview+0x8c>
c0de9f14:	491e      	ldr	r1, [pc, #120]	@ (c0de9f90 <nbgl_useCaseAdvancedReview+0xc8>)
c0de9f16:	2200      	movs	r2, #0
c0de9f18:	4449      	add	r1, r9
c0de9f1a:	f881 203c 	strb.w	r2, [r1, #60]	@ 0x3c
c0de9f1e:	2240      	movs	r2, #64	@ 0x40
c0de9f20:	2808      	cmp	r0, #8
c0de9f22:	bf08      	it	eq
c0de9f24:	2280      	moveq	r2, #128	@ 0x80
c0de9f26:	ea42 0005 	orr.w	r0, r2, r5
c0de9f2a:	9d06      	ldr	r5, [sp, #24]
c0de9f2c:	9b07      	ldr	r3, [sp, #28]
c0de9f2e:	e9c1 0610 	strd	r0, r6, [r1, #64]	@ 0x40
c0de9f32:	648d      	str	r5, [r1, #72]	@ 0x48
c0de9f34:	314c      	adds	r1, #76	@ 0x4c
c0de9f36:	e881 0d18 	stmia.w	r1, {r3, r4, r8, sl, fp}
c0de9f3a:	f89a 1000 	ldrb.w	r1, [sl]
c0de9f3e:	f011 0f16 	tst.w	r1, #22
c0de9f42:	d102      	bne.n	c0de9f4a <nbgl_useCaseAdvancedReview+0x82>
c0de9f44:	f8da 1014 	ldr.w	r1, [sl, #20]
c0de9f48:	b1a9      	cbz	r1, c0de9f76 <nbgl_useCaseAdvancedReview+0xae>
c0de9f4a:	b008      	add	sp, #32
c0de9f4c:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9f50:	f000 b820 	b.w	c0de9f94 <displayInitialWarning>
c0de9f54:	2001      	movs	r0, #1
c0de9f56:	2100      	movs	r1, #0
c0de9f58:	e9cd 4800 	strd	r4, r8, [sp]
c0de9f5c:	e9cd 7b02 	strd	r7, fp, [sp, #8]
c0de9f60:	e9cd 1004 	strd	r1, r0, [sp, #16]
c0de9f64:	4628      	mov	r0, r5
c0de9f66:	4631      	mov	r1, r6
c0de9f68:	e9dd 2306 	ldrd	r2, r3, [sp, #24]
c0de9f6c:	f7ff fefe 	bl	c0de9d6c <useCaseReview>
c0de9f70:	b008      	add	sp, #32
c0de9f72:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de9f76:	2101      	movs	r1, #1
c0de9f78:	2200      	movs	r2, #0
c0de9f7a:	e9cd 4800 	strd	r4, r8, [sp]
c0de9f7e:	e9cd 7b02 	strd	r7, fp, [sp, #8]
c0de9f82:	e9cd 2104 	strd	r2, r1, [sp, #16]
c0de9f86:	4631      	mov	r1, r6
c0de9f88:	462a      	mov	r2, r5
c0de9f8a:	e7ef      	b.n	c0de9f6c <nbgl_useCaseAdvancedReview+0xa4>
c0de9f8c:	00001c44 	.word	0x00001c44
c0de9f90:	000018fc 	.word	0x000018fc

c0de9f94 <displayInitialWarning>:
c0de9f94:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de9f96:	b099      	sub	sp, #100	@ 0x64
c0de9f98:	4857      	ldr	r0, [pc, #348]	@ (c0dea0f8 <displayInitialWarning+0x164>)
c0de9f9a:	a90e      	add	r1, sp, #56	@ 0x38
c0de9f9c:	4478      	add	r0, pc
c0de9f9e:	e890 003c 	ldmia.w	r0, {r2, r3, r4, r5}
c0de9fa2:	c13c      	stmia	r1!, {r2, r3, r4, r5}
c0de9fa4:	4855      	ldr	r0, [pc, #340]	@ (c0dea0fc <displayInitialWarning+0x168>)
c0de9fa6:	ac0a      	add	r4, sp, #40	@ 0x28
c0de9fa8:	4621      	mov	r1, r4
c0de9faa:	4478      	add	r0, pc
c0de9fac:	e890 006c 	ldmia.w	r0, {r2, r3, r5, r6}
c0de9fb0:	c16c      	stmia	r1!, {r2, r3, r5, r6}
c0de9fb2:	4d4f      	ldr	r5, [pc, #316]	@ (c0dea0f0 <displayInitialWarning+0x15c>)
c0de9fb4:	eb09 0705 	add.w	r7, r9, r5
c0de9fb8:	6db8      	ldr	r0, [r7, #88]	@ 0x58
c0de9fba:	6806      	ldr	r6, [r0, #0]
c0de9fbc:	2001      	movs	r0, #1
c0de9fbe:	f887 0069 	strb.w	r0, [r7, #105]	@ 0x69
c0de9fc2:	484f      	ldr	r0, [pc, #316]	@ (c0dea100 <displayInitialWarning+0x16c>)
c0de9fc4:	4478      	add	r0, pc
c0de9fc6:	9015      	str	r0, [sp, #84]	@ 0x54
c0de9fc8:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0de9fcc:	f8ad 0048 	strh.w	r0, [sp, #72]	@ 0x48
c0de9fd0:	2000      	movs	r0, #0
c0de9fd2:	9016      	str	r0, [sp, #88]	@ 0x58
c0de9fd4:	9013      	str	r0, [sp, #76]	@ 0x4c
c0de9fd6:	a812      	add	r0, sp, #72	@ 0x48
c0de9fd8:	f7fa f9ba 	bl	c0de4350 <nbgl_layoutGet>
c0de9fdc:	4621      	mov	r1, r4
c0de9fde:	6638      	str	r0, [r7, #96]	@ 0x60
c0de9fe0:	f7fc ff4e 	bl	c0de6e80 <nbgl_layoutAddHeader>
c0de9fe4:	6db8      	ldr	r0, [r7, #88]	@ 0x58
c0de9fe6:	f026 0409 	bic.w	r4, r6, #9
c0de9fea:	6801      	ldr	r1, [r0, #0]
c0de9fec:	b139      	cbz	r1, c0de9ffe <displayInitialWarning+0x6a>
c0de9fee:	4845      	ldr	r0, [pc, #276]	@ (c0dea104 <displayInitialWarning+0x170>)
c0de9ff0:	4945      	ldr	r1, [pc, #276]	@ (c0dea108 <displayInitialWarning+0x174>)
c0de9ff2:	2c10      	cmp	r4, #16
c0de9ff4:	4479      	add	r1, pc
c0de9ff6:	4478      	add	r0, pc
c0de9ff8:	bf08      	it	eq
c0de9ffa:	4601      	moveq	r1, r0
c0de9ffc:	e001      	b.n	c0dea002 <displayInitialWarning+0x6e>
c0de9ffe:	6a01      	ldr	r1, [r0, #32]
c0dea000:	b131      	cbz	r1, c0dea010 <displayInitialWarning+0x7c>
c0dea002:	eb09 0005 	add.w	r0, r9, r5
c0dea006:	2211      	movs	r2, #17
c0dea008:	2309      	movs	r3, #9
c0dea00a:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0dea00c:	f7fa ff68 	bl	c0de4ee0 <nbgl_layoutAddTopRightButton>
c0dea010:	eb09 0005 	add.w	r0, r9, r5
c0dea014:	6d87      	ldr	r7, [r0, #88]	@ 0x58
c0dea016:	6838      	ldr	r0, [r7, #0]
c0dea018:	b188      	cbz	r0, c0dea03e <displayInitialWarning+0xaa>
c0dea01a:	a801      	add	r0, sp, #4
c0dea01c:	2124      	movs	r1, #36	@ 0x24
c0dea01e:	f002 f9cb 	bl	c0dec3b8 <__aeabi_memclr>
c0dea022:	483a      	ldr	r0, [pc, #232]	@ (c0dea10c <displayInitialWarning+0x178>)
c0dea024:	2c10      	cmp	r4, #16
c0dea026:	4478      	add	r0, pc
c0dea028:	9002      	str	r0, [sp, #8]
c0dea02a:	d111      	bne.n	c0dea050 <displayInitialWarning+0xbc>
c0dea02c:	4840      	ldr	r0, [pc, #256]	@ (c0dea130 <displayInitialWarning+0x19c>)
c0dea02e:	2405      	movs	r4, #5
c0dea030:	4478      	add	r0, pc
c0dea032:	9005      	str	r0, [sp, #20]
c0dea034:	493f      	ldr	r1, [pc, #252]	@ (c0dea134 <displayInitialWarning+0x1a0>)
c0dea036:	4840      	ldr	r0, [pc, #256]	@ (c0dea138 <displayInitialWarning+0x1a4>)
c0dea038:	4479      	add	r1, pc
c0dea03a:	4478      	add	r0, pc
c0dea03c:	e03d      	b.n	c0dea0ba <displayInitialWarning+0x126>
c0dea03e:	69f9      	ldr	r1, [r7, #28]
c0dea040:	b351      	cbz	r1, c0dea098 <displayInitialWarning+0x104>
c0dea042:	eb09 0005 	add.w	r0, r9, r5
c0dea046:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0dea048:	f7fc fab6 	bl	c0de65b8 <nbgl_layoutAddContentCenter>
c0dea04c:	2408      	movs	r4, #8
c0dea04e:	e03c      	b.n	c0dea0ca <displayInitialWarning+0x136>
c0dea050:	4828      	ldr	r0, [pc, #160]	@ (c0dea0f4 <displayInitialWarning+0x160>)
c0dea052:	4448      	add	r0, r9
c0dea054:	9006      	str	r0, [sp, #24]
c0dea056:	68f9      	ldr	r1, [r7, #12]
c0dea058:	4b2d      	ldr	r3, [pc, #180]	@ (c0dea110 <displayInitialWarning+0x17c>)
c0dea05a:	447b      	add	r3, pc
c0dea05c:	2900      	cmp	r1, #0
c0dea05e:	bf18      	it	ne
c0dea060:	460b      	movne	r3, r1
c0dea062:	4a2c      	ldr	r2, [pc, #176]	@ (c0dea114 <displayInitialWarning+0x180>)
c0dea064:	2180      	movs	r1, #128	@ 0x80
c0dea066:	447a      	add	r2, pc
c0dea068:	f001 fdf2 	bl	c0debc50 <snprintf>
c0dea06c:	07b0      	lsls	r0, r6, #30
c0dea06e:	d403      	bmi.n	c0dea078 <displayInitialWarning+0xe4>
c0dea070:	0770      	lsls	r0, r6, #29
c0dea072:	d413      	bmi.n	c0dea09c <displayInitialWarning+0x108>
c0dea074:	2400      	movs	r4, #0
c0dea076:	e022      	b.n	c0dea0be <displayInitialWarning+0x12a>
c0dea078:	4827      	ldr	r0, [pc, #156]	@ (c0dea118 <displayInitialWarning+0x184>)
c0dea07a:	4478      	add	r0, pc
c0dea07c:	9005      	str	r0, [sp, #20]
c0dea07e:	eb09 0005 	add.w	r0, r9, r5
c0dea082:	6d80      	ldr	r0, [r0, #88]	@ 0x58
c0dea084:	6901      	ldr	r1, [r0, #16]
c0dea086:	4825      	ldr	r0, [pc, #148]	@ (c0dea11c <displayInitialWarning+0x188>)
c0dea088:	4478      	add	r0, pc
c0dea08a:	2900      	cmp	r1, #0
c0dea08c:	bf18      	it	ne
c0dea08e:	4608      	movne	r0, r1
c0dea090:	4923      	ldr	r1, [pc, #140]	@ (c0dea120 <displayInitialWarning+0x18c>)
c0dea092:	2405      	movs	r4, #5
c0dea094:	4479      	add	r1, pc
c0dea096:	e010      	b.n	c0dea0ba <displayInitialWarning+0x126>
c0dea098:	2400      	movs	r4, #0
c0dea09a:	e016      	b.n	c0dea0ca <displayInitialWarning+0x136>
c0dea09c:	4821      	ldr	r0, [pc, #132]	@ (c0dea124 <displayInitialWarning+0x190>)
c0dea09e:	4478      	add	r0, pc
c0dea0a0:	9005      	str	r0, [sp, #20]
c0dea0a2:	eb09 0005 	add.w	r0, r9, r5
c0dea0a6:	6d80      	ldr	r0, [r0, #88]	@ 0x58
c0dea0a8:	6901      	ldr	r1, [r0, #16]
c0dea0aa:	481f      	ldr	r0, [pc, #124]	@ (c0dea128 <displayInitialWarning+0x194>)
c0dea0ac:	4478      	add	r0, pc
c0dea0ae:	2900      	cmp	r1, #0
c0dea0b0:	bf18      	it	ne
c0dea0b2:	4608      	movne	r0, r1
c0dea0b4:	491d      	ldr	r1, [pc, #116]	@ (c0dea12c <displayInitialWarning+0x198>)
c0dea0b6:	2404      	movs	r4, #4
c0dea0b8:	4479      	add	r1, pc
c0dea0ba:	910f      	str	r1, [sp, #60]	@ 0x3c
c0dea0bc:	9007      	str	r0, [sp, #28]
c0dea0be:	eb09 0005 	add.w	r0, r9, r5
c0dea0c2:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0dea0c4:	a901      	add	r1, sp, #4
c0dea0c6:	f7fc fa77 	bl	c0de65b8 <nbgl_layoutAddContentCenter>
c0dea0ca:	eb09 0005 	add.w	r0, r9, r5
c0dea0ce:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0dea0d0:	a90e      	add	r1, sp, #56	@ 0x38
c0dea0d2:	f7fc fbed 	bl	c0de68b0 <nbgl_layoutAddChoiceButtons>
c0dea0d6:	b114      	cbz	r4, c0dea0de <displayInitialWarning+0x14a>
c0dea0d8:	4620      	mov	r0, r4
c0dea0da:	f7f9 ff31 	bl	c0de3f40 <os_io_seph_cmd_piezo_play_tune>
c0dea0de:	eb09 0005 	add.w	r0, r9, r5
c0dea0e2:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0dea0e4:	f7fd fb2e 	bl	c0de7744 <nbgl_layoutDraw>
c0dea0e8:	f001 fd27 	bl	c0debb3a <nbgl_refresh>
c0dea0ec:	b019      	add	sp, #100	@ 0x64
c0dea0ee:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0dea0f0:	000018fc 	.word	0x000018fc
c0dea0f4:	00001a48 	.word	0x00001a48
c0dea0f8:	000058f4 	.word	0x000058f4
c0dea0fc:	00005812 	.word	0x00005812
c0dea100:	00001155 	.word	0x00001155
c0dea104:	000032b8 	.word	0x000032b8
c0dea108:	00003603 	.word	0x00003603
c0dea10c:	00002f31 	.word	0x00002f31
c0dea110:	00003cdf 	.word	0x00003cdf
c0dea114:	0000406f 	.word	0x0000406f
c0dea118:	000040cd 	.word	0x000040cd
c0dea11c:	0000391d 	.word	0x0000391d
c0dea120:	00003d39 	.word	0x00003d39
c0dea124:	00003d1f 	.word	0x00003d1f
c0dea128:	00003cbd 	.word	0x00003cbd
c0dea12c:	00003b99 	.word	0x00003b99
c0dea130:	00003e8b 	.word	0x00003e8b
c0dea134:	00004131 	.word	0x00004131
c0dea138:	00003dac 	.word	0x00003dac

c0dea13c <useCaseReviewStreamingStart>:
c0dea13c:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0dea140:	4604      	mov	r4, r0
c0dea142:	4826      	ldr	r0, [pc, #152]	@ (c0dea1dc <useCaseReviewStreamingStart+0xa0>)
c0dea144:	460d      	mov	r5, r1
c0dea146:	2103      	movs	r1, #3
c0dea148:	e9cd 3200 	strd	r3, r2, [sp]
c0dea14c:	f8df b098 	ldr.w	fp, [pc, #152]	@ c0dea1e8 <useCaseReviewStreamingStart+0xac>
c0dea150:	f04f 0a01 	mov.w	sl, #1
c0dea154:	f809 1000 	strb.w	r1, [r9, r0]
c0dea158:	4921      	ldr	r1, [pc, #132]	@ (c0dea1e0 <useCaseReviewStreamingStart+0xa4>)
c0dea15a:	eb09 0700 	add.w	r7, r9, r0
c0dea15e:	eb09 060b 	add.w	r6, r9, fp
c0dea162:	eb09 0801 	add.w	r8, r9, r1
c0dea166:	f8c8 502c 	str.w	r5, [r8, #44]	@ 0x2c
c0dea16a:	990a      	ldr	r1, [sp, #40]	@ 0x28
c0dea16c:	e9c8 4108 	strd	r4, r1, [r8, #32]
c0dea170:	2138      	movs	r1, #56	@ 0x38
c0dea172:	481e      	ldr	r0, [pc, #120]	@ (c0dea1ec <useCaseReviewStreamingStart+0xb0>)
c0dea174:	4478      	add	r0, pc
c0dea176:	61b8      	str	r0, [r7, #24]
c0dea178:	2000      	movs	r0, #0
c0dea17a:	6138      	str	r0, [r7, #16]
c0dea17c:	4819      	ldr	r0, [pc, #100]	@ (c0dea1e4 <useCaseReviewStreamingStart+0xa8>)
c0dea17e:	4448      	add	r0, r9
c0dea180:	f880 a00c 	strb.w	sl, [r0, #12]
c0dea184:	6086      	str	r6, [r0, #8]
c0dea186:	f001 f855 	bl	c0deb234 <OUTLINED_FUNCTION_13>
c0dea18a:	2100      	movs	r1, #0
c0dea18c:	f809 a00b 	strb.w	sl, [r9, fp]
c0dea190:	84b1      	strh	r1, [r6, #36]	@ 0x24
c0dea192:	4817      	ldr	r0, [pc, #92]	@ (c0dea1f0 <useCaseReviewStreamingStart+0xb4>)
c0dea194:	9a00      	ldr	r2, [sp, #0]
c0dea196:	60b5      	str	r5, [r6, #8]
c0dea198:	7131      	strb	r1, [r6, #4]
c0dea19a:	2500      	movs	r5, #0
c0dea19c:	4478      	add	r0, pc
c0dea19e:	e9c6 2007 	strd	r2, r0, [r6, #28]
c0dea1a2:	9801      	ldr	r0, [sp, #4]
c0dea1a4:	6170      	str	r0, [r6, #20]
c0dea1a6:	2000      	movs	r0, #0
c0dea1a8:	f000 ff2a 	bl	c0deb000 <initWarningTipBox>
c0dea1ac:	f3c4 1000 	ubfx	r0, r4, #4, #1
c0dea1b0:	f7fe fefa 	bl	c0de8fa8 <getNbPagesForGenericContents>
c0dea1b4:	f888 0030 	strb.w	r0, [r8, #48]	@ 0x30
c0dea1b8:	2001      	movs	r0, #1
c0dea1ba:	21ff      	movs	r1, #255	@ 0xff
c0dea1bc:	4a0d      	ldr	r2, [pc, #52]	@ (c0dea1f4 <useCaseReviewStreamingStart+0xb8>)
c0dea1be:	447a      	add	r2, pc
c0dea1c0:	f7fe fe2a 	bl	c0de8e18 <prepareNavInfo>
c0dea1c4:	f887 5071 	strb.w	r5, [r7, #113]	@ 0x71
c0dea1c8:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0dea1ca:	b108      	cbz	r0, c0dea1d0 <useCaseReviewStreamingStart+0x94>
c0dea1cc:	f001 f81b 	bl	c0deb206 <OUTLINED_FUNCTION_6>
c0dea1d0:	2000      	movs	r0, #0
c0dea1d2:	2101      	movs	r1, #1
c0dea1d4:	e8bd 4dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0dea1d8:	f7fe bfa0 	b.w	c0de911c <displayGenericContextPage>
c0dea1dc:	00001bc8 	.word	0x00001bc8
c0dea1e0:	00001c44 	.word	0x00001c44
c0dea1e4:	000018fc 	.word	0x000018fc
c0dea1e8:	00001968 	.word	0x00001968
c0dea1ec:	00000081 	.word	0x00000081
c0dea1f0:	00003fe6 	.word	0x00003fe6
c0dea1f4:	0000379a 	.word	0x0000379a

c0dea1f8 <bundleNavReviewStreamingChoice>:
c0dea1f8:	b580      	push	{r7, lr}
c0dea1fa:	b178      	cbz	r0, c0dea21c <bundleNavReviewStreamingChoice+0x24>
c0dea1fc:	480d      	ldr	r0, [pc, #52]	@ (c0dea234 <bundleNavReviewStreamingChoice+0x3c>)
c0dea1fe:	f819 0000 	ldrb.w	r0, [r9, r0]
c0dea202:	2802      	cmp	r0, #2
c0dea204:	d003      	beq.n	c0dea20e <bundleNavReviewStreamingChoice+0x16>
c0dea206:	480c      	ldr	r0, [pc, #48]	@ (c0dea238 <bundleNavReviewStreamingChoice+0x40>)
c0dea208:	4478      	add	r0, pc
c0dea20a:	f000 f955 	bl	c0dea4b8 <nbgl_useCaseSpinner>
c0dea20e:	4808      	ldr	r0, [pc, #32]	@ (c0dea230 <bundleNavReviewStreamingChoice+0x38>)
c0dea210:	4448      	add	r0, r9
c0dea212:	6a41      	ldr	r1, [r0, #36]	@ 0x24
c0dea214:	2001      	movs	r0, #1
c0dea216:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0dea21a:	4708      	bx	r1
c0dea21c:	4804      	ldr	r0, [pc, #16]	@ (c0dea230 <bundleNavReviewStreamingChoice+0x38>)
c0dea21e:	4448      	add	r0, r9
c0dea220:	6a00      	ldr	r0, [r0, #32]
c0dea222:	4906      	ldr	r1, [pc, #24]	@ (c0dea23c <bundleNavReviewStreamingChoice+0x44>)
c0dea224:	4479      	add	r1, pc
c0dea226:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0dea22a:	f000 bf47 	b.w	c0deb0bc <bundleNavReviewAskRejectionConfirmation>
c0dea22e:	bf00      	nop
c0dea230:	00001c44 	.word	0x00001c44
c0dea234:	00001968 	.word	0x00001968
c0dea238:	00003714 	.word	0x00003714
c0dea23c:	00000f95 	.word	0x00000f95

c0dea240 <prepareReviewLastPage>:
c0dea240:	b13b      	cbz	r3, c0dea252 <prepareReviewLastPage+0x12>
c0dea242:	200b      	movs	r0, #11
c0dea244:	7308      	strb	r0, [r1, #12]
c0dea246:	480d      	ldr	r0, [pc, #52]	@ (c0dea27c <prepareReviewLastPage+0x3c>)
c0dea248:	e9c1 3200 	strd	r3, r2, [r1]
c0dea24c:	4478      	add	r0, pc
c0dea24e:	6088      	str	r0, [r1, #8]
c0dea250:	4770      	bx	lr
c0dea252:	f010 0007 	ands.w	r0, r0, #7
c0dea256:	d004      	beq.n	c0dea262 <prepareReviewLastPage+0x22>
c0dea258:	2801      	cmp	r0, #1
c0dea25a:	d105      	bne.n	c0dea268 <prepareReviewLastPage+0x28>
c0dea25c:	4b05      	ldr	r3, [pc, #20]	@ (c0dea274 <prepareReviewLastPage+0x34>)
c0dea25e:	447b      	add	r3, pc
c0dea260:	e7ef      	b.n	c0dea242 <prepareReviewLastPage+0x2>
c0dea262:	4b03      	ldr	r3, [pc, #12]	@ (c0dea270 <prepareReviewLastPage+0x30>)
c0dea264:	447b      	add	r3, pc
c0dea266:	e7ec      	b.n	c0dea242 <prepareReviewLastPage+0x2>
c0dea268:	4b03      	ldr	r3, [pc, #12]	@ (c0dea278 <prepareReviewLastPage+0x38>)
c0dea26a:	447b      	add	r3, pc
c0dea26c:	e7e9      	b.n	c0dea242 <prepareReviewLastPage+0x2>
c0dea26e:	bf00      	nop
c0dea270:	0000390e 	.word	0x0000390e
c0dea274:	000038e3 	.word	0x000038e3
c0dea278:	00003e5c 	.word	0x00003e5c
c0dea27c:	000036ec 	.word	0x000036ec

c0dea280 <prepareAddressConfirmationPages>:
c0dea280:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea284:	b08a      	sub	sp, #40	@ 0x28
c0dea286:	4688      	mov	r8, r1
c0dea288:	4950      	ldr	r1, [pc, #320]	@ (c0dea3cc <prepareAddressConfirmationPages+0x14c>)
c0dea28a:	f8df a13c 	ldr.w	sl, [pc, #316]	@ c0dea3c8 <prepareAddressConfirmationPages+0x148>
c0dea28e:	4693      	mov	fp, r2
c0dea290:	4479      	add	r1, pc
c0dea292:	f849 100a 	str.w	r1, [r9, sl]
c0dea296:	494e      	ldr	r1, [pc, #312]	@ (c0dea3d0 <prepareAddressConfirmationPages+0x150>)
c0dea298:	4479      	add	r1, pc
c0dea29a:	6191      	str	r1, [r2, #24]
c0dea29c:	2106      	movs	r1, #6
c0dea29e:	7011      	strb	r1, [r2, #0]
c0dea2a0:	2201      	movs	r2, #1
c0dea2a2:	eb09 010a 	add.w	r1, r9, sl
c0dea2a6:	f1b8 0f00 	cmp.w	r8, #0
c0dea2aa:	f881 2034 	strb.w	r2, [r1, #52]	@ 0x34
c0dea2ae:	6048      	str	r0, [r1, #4]
c0dea2b0:	d01f      	beq.n	c0dea2f2 <prepareAddressConfirmationPages+0x72>
c0dea2b2:	f898 2008 	ldrb.w	r2, [r8, #8]
c0dea2b6:	2a02      	cmp	r2, #2
c0dea2b8:	d81b      	bhi.n	c0dea2f2 <prepareAddressConfirmationPages+0x72>
c0dea2ba:	2001      	movs	r0, #1
c0dea2bc:	2100      	movs	r1, #0
c0dea2be:	f04f 0c00 	mov.w	ip, #0
c0dea2c2:	9303      	str	r3, [sp, #12]
c0dea2c4:	4594      	cmp	ip, r2
c0dea2c6:	d219      	bcs.n	c0dea2fc <prepareAddressConfirmationPages+0x7c>
c0dea2c8:	f8d8 0000 	ldr.w	r0, [r8]
c0dea2cc:	eb09 030a 	add.w	r3, r9, sl
c0dea2d0:	f10c 0c01 	add.w	ip, ip, #1
c0dea2d4:	185c      	adds	r4, r3, r1
c0dea2d6:	4408      	add	r0, r1
c0dea2d8:	3410      	adds	r4, #16
c0dea2da:	3110      	adds	r1, #16
c0dea2dc:	e890 00e4 	ldmia.w	r0, {r2, r5, r6, r7}
c0dea2e0:	c4e4      	stmia	r4!, {r2, r5, r6, r7}
c0dea2e2:	f893 0034 	ldrb.w	r0, [r3, #52]	@ 0x34
c0dea2e6:	3001      	adds	r0, #1
c0dea2e8:	f883 0034 	strb.w	r0, [r3, #52]	@ 0x34
c0dea2ec:	f898 2008 	ldrb.w	r2, [r8, #8]
c0dea2f0:	e7e8      	b.n	c0dea2c4 <prepareAddressConfirmationPages+0x44>
c0dea2f2:	2000      	movs	r0, #0
c0dea2f4:	f8cb 001c 	str.w	r0, [fp, #28]
c0dea2f8:	2001      	movs	r0, #1
c0dea2fa:	e01c      	b.n	c0dea336 <prepareAddressConfirmationPages+0xb6>
c0dea2fc:	46c4      	mov	ip, r8
c0dea2fe:	a905      	add	r1, sp, #20
c0dea300:	e89c 00f4 	ldmia.w	ip, {r2, r4, r5, r6, r7}
c0dea304:	460b      	mov	r3, r1
c0dea306:	c3f4      	stmia	r3!, {r2, r4, r5, r6, r7}
c0dea308:	f10d 0213 	add.w	r2, sp, #19
c0dea30c:	b2c7      	uxtb	r7, r0
c0dea30e:	eb09 040a 	add.w	r4, r9, sl
c0dea312:	f88d 001c 	strb.w	r0, [sp, #28]
c0dea316:	2301      	movs	r3, #1
c0dea318:	9202      	str	r2, [sp, #8]
c0dea31a:	4638      	mov	r0, r7
c0dea31c:	2200      	movs	r2, #0
c0dea31e:	9405      	str	r4, [sp, #20]
c0dea320:	e9cd 3300 	strd	r3, r3, [sp]
c0dea324:	2300      	movs	r3, #0
c0dea326:	f7fe fb6e 	bl	c0de8a06 <getNbTagValuesInPage>
c0dea32a:	4287      	cmp	r7, r0
c0dea32c:	bf88      	it	hi
c0dea32e:	2001      	movhi	r0, #1
c0dea330:	9b03      	ldr	r3, [sp, #12]
c0dea332:	f884 0034 	strb.w	r0, [r4, #52]	@ 0x34
c0dea336:	f640 1107 	movw	r1, #2311	@ 0x907
c0dea33a:	f88b 000c 	strb.w	r0, [fp, #12]
c0dea33e:	f8ab 1020 	strh.w	r1, [fp, #32]
c0dea342:	2100      	movs	r1, #0
c0dea344:	f1b8 0f00 	cmp.w	r8, #0
c0dea348:	f8ab 1010 	strh.w	r1, [fp, #16]
c0dea34c:	f88b 100e 	strb.w	r1, [fp, #14]
c0dea350:	eb09 010a 	add.w	r1, r9, sl
c0dea354:	f8cb 1004 	str.w	r1, [fp, #4]
c0dea358:	d003      	beq.n	c0dea362 <prepareAddressConfirmationPages+0xe2>
c0dea35a:	f898 1008 	ldrb.w	r1, [r8, #8]
c0dea35e:	4288      	cmp	r0, r1
c0dea360:	d907      	bls.n	c0dea372 <prepareAddressConfirmationPages+0xf2>
c0dea362:	200b      	movs	r0, #11
c0dea364:	f88b 002c 	strb.w	r0, [fp, #44]	@ 0x2c
c0dea368:	481c      	ldr	r0, [pc, #112]	@ (c0dea3dc <prepareAddressConfirmationPages+0x15c>)
c0dea36a:	4478      	add	r0, pc
c0dea36c:	f8cb 0024 	str.w	r0, [fp, #36]	@ 0x24
c0dea370:	e027      	b.n	c0dea3c2 <prepareAddressConfirmationPages+0x142>
c0dea372:	2000      	movs	r0, #0
c0dea374:	f8cb 0024 	str.w	r0, [fp, #36]	@ 0x24
c0dea378:	4916      	ldr	r1, [pc, #88]	@ (c0dea3d4 <prepareAddressConfirmationPages+0x154>)
c0dea37a:	4479      	add	r1, pc
c0dea37c:	f8cb 101c 	str.w	r1, [fp, #28]
c0dea380:	210b      	movs	r1, #11
c0dea382:	f883 102c 	strb.w	r1, [r3, #44]	@ 0x2c
c0dea386:	2106      	movs	r1, #6
c0dea388:	7019      	strb	r1, [r3, #0]
c0dea38a:	2109      	movs	r1, #9
c0dea38c:	f883 1021 	strb.w	r1, [r3, #33]	@ 0x21
c0dea390:	4911      	ldr	r1, [pc, #68]	@ (c0dea3d8 <prepareAddressConfirmationPages+0x158>)
c0dea392:	e9c3 0006 	strd	r0, r0, [r3, #24]
c0dea396:	1d18      	adds	r0, r3, #4
c0dea398:	4479      	add	r1, pc
c0dea39a:	6259      	str	r1, [r3, #36]	@ 0x24
c0dea39c:	4641      	mov	r1, r8
c0dea39e:	e891 00f4 	ldmia.w	r1, {r2, r4, r5, r6, r7}
c0dea3a2:	c0f4      	stmia	r0!, {r2, r4, r5, r6, r7}
c0dea3a4:	eb09 000a 	add.w	r0, r9, sl
c0dea3a8:	f898 1008 	ldrb.w	r1, [r8, #8]
c0dea3ac:	f890 0034 	ldrb.w	r0, [r0, #52]	@ 0x34
c0dea3b0:	1a09      	subs	r1, r1, r0
c0dea3b2:	3101      	adds	r1, #1
c0dea3b4:	7319      	strb	r1, [r3, #12]
c0dea3b6:	f8d8 1000 	ldr.w	r1, [r8]
c0dea3ba:	eb01 1000 	add.w	r0, r1, r0, lsl #4
c0dea3be:	3810      	subs	r0, #16
c0dea3c0:	6058      	str	r0, [r3, #4]
c0dea3c2:	b00a      	add	sp, #40	@ 0x28
c0dea3c4:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0dea3c8:	00001a10 	.word	0x00001a10
c0dea3cc:	00003c85 	.word	0x00003c85
c0dea3d0:	0000335f 	.word	0x0000335f
c0dea3d4:	0000363d 	.word	0x0000363d
c0dea3d8:	00003e82 	.word	0x00003e82
c0dea3dc:	00003eb0 	.word	0x00003eb0

c0dea3e0 <nbgl_useCaseAddressReview>:
c0dea3e0:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0dea3e4:	4e2d      	ldr	r6, [pc, #180]	@ (c0dea49c <nbgl_useCaseAddressReview+0xbc>)
c0dea3e6:	9301      	str	r3, [sp, #4]
c0dea3e8:	4617      	mov	r7, r2
c0dea3ea:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0dea3ee:	eb09 0406 	add.w	r4, r9, r6
c0dea3f2:	f7fe fcfb 	bl	c0de8dec <reset_callbacks_and_context>
c0dea3f6:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0dea3f8:	e9dd 540c 	ldrd	r5, r4, [sp, #48]	@ 0x30
c0dea3fc:	b108      	cbz	r0, c0dea402 <nbgl_useCaseAddressReview+0x22>
c0dea3fe:	f7fd f9cf 	bl	c0de77a0 <nbgl_layoutRelease>
c0dea402:	eb09 0006 	add.w	r0, r9, r6
c0dea406:	2138      	movs	r1, #56	@ 0x38
c0dea408:	f001 ffd6 	bl	c0dec3b8 <__aeabi_memclr>
c0dea40c:	4824      	ldr	r0, [pc, #144]	@ (c0dea4a0 <nbgl_useCaseAddressReview+0xc0>)
c0dea40e:	2602      	movs	r6, #2
c0dea410:	f04f 0a00 	mov.w	sl, #0
c0dea414:	f8df b094 	ldr.w	fp, [pc, #148]	@ c0dea4ac <nbgl_useCaseAddressReview+0xcc>
c0dea418:	21a8      	movs	r1, #168	@ 0xa8
c0dea41a:	f809 6000 	strb.w	r6, [r9, r0]
c0dea41e:	4448      	add	r0, r9
c0dea420:	6184      	str	r4, [r0, #24]
c0dea422:	f8c0 a010 	str.w	sl, [r0, #16]
c0dea426:	481f      	ldr	r0, [pc, #124]	@ (c0dea4a4 <nbgl_useCaseAddressReview+0xc4>)
c0dea428:	eb09 040b 	add.w	r4, r9, fp
c0dea42c:	4448      	add	r0, r9
c0dea42e:	6206      	str	r6, [r0, #32]
c0dea430:	481d      	ldr	r0, [pc, #116]	@ (c0dea4a8 <nbgl_useCaseAddressReview+0xc8>)
c0dea432:	eb09 0800 	add.w	r8, r9, r0
c0dea436:	4620      	mov	r0, r4
c0dea438:	f8c8 4008 	str.w	r4, [r8, #8]
c0dea43c:	f001 ffbc 	bl	c0dec3b8 <__aeabi_memclr>
c0dea440:	2001      	movs	r0, #1
c0dea442:	60a7      	str	r7, [r4, #8]
c0dea444:	f884 a026 	strb.w	sl, [r4, #38]	@ 0x26
c0dea448:	f104 0238 	add.w	r2, r4, #56	@ 0x38
c0dea44c:	f104 0370 	add.w	r3, r4, #112	@ 0x70
c0dea450:	f809 000b 	strb.w	r0, [r9, fp]
c0dea454:	4816      	ldr	r0, [pc, #88]	@ (c0dea4b0 <nbgl_useCaseAddressReview+0xd0>)
c0dea456:	9901      	ldr	r1, [sp, #4]
c0dea458:	4478      	add	r0, pc
c0dea45a:	e9c4 1a05 	strd	r1, sl, [r4, #20]
c0dea45e:	e9c4 5007 	strd	r5, r0, [r4, #28]
c0dea462:	e9dd 0102 	ldrd	r0, r1, [sp, #8]
c0dea466:	f7ff ff0b 	bl	c0dea280 <prepareAddressConfirmationPages>
c0dea46a:	f894 0070 	ldrb.w	r0, [r4, #112]	@ 0x70
c0dea46e:	2806      	cmp	r0, #6
c0dea470:	bf08      	it	eq
c0dea472:	2603      	moveq	r6, #3
c0dea474:	f888 600c 	strb.w	r6, [r8, #12]
c0dea478:	f000 fec2 	bl	c0deb200 <OUTLINED_FUNCTION_5>
c0dea47c:	4a0d      	ldr	r2, [pc, #52]	@ (c0dea4b4 <nbgl_useCaseAddressReview+0xd4>)
c0dea47e:	4601      	mov	r1, r0
c0dea480:	2001      	movs	r0, #1
c0dea482:	447a      	add	r2, pc
c0dea484:	f7fe fcc8 	bl	c0de8e18 <prepareNavInfo>
c0dea488:	f000 febd 	bl	c0deb206 <OUTLINED_FUNCTION_6>
c0dea48c:	2000      	movs	r0, #0
c0dea48e:	2101      	movs	r1, #1
c0dea490:	b004      	add	sp, #16
c0dea492:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea496:	f7fe be41 	b.w	c0de911c <displayGenericContextPage>
c0dea49a:	bf00      	nop
c0dea49c:	00001a10 	.word	0x00001a10
c0dea4a0:	00001bc8 	.word	0x00001bc8
c0dea4a4:	00001c44 	.word	0x00001c44
c0dea4a8:	000018fc 	.word	0x000018fc
c0dea4ac:	00001968 	.word	0x00001968
c0dea4b0:	000035ce 	.word	0x000035ce
c0dea4b4:	00003849 	.word	0x00003849

c0dea4b8 <nbgl_useCaseSpinner>:
c0dea4b8:	b5f0      	push	{r4, r5, r6, r7, lr}
c0dea4ba:	b087      	sub	sp, #28
c0dea4bc:	4e1f      	ldr	r6, [pc, #124]	@ (c0dea53c <nbgl_useCaseSpinner+0x84>)
c0dea4be:	4604      	mov	r4, r0
c0dea4c0:	f819 0006 	ldrb.w	r0, [r9, r6]
c0dea4c4:	2801      	cmp	r0, #1
c0dea4c6:	d114      	bne.n	c0dea4f2 <nbgl_useCaseSpinner+0x3a>
c0dea4c8:	eb09 0006 	add.w	r0, r9, r6
c0dea4cc:	7841      	ldrb	r1, [r0, #1]
c0dea4ce:	3101      	adds	r1, #1
c0dea4d0:	b2ca      	uxtb	r2, r1
c0dea4d2:	3a04      	subs	r2, #4
c0dea4d4:	bf18      	it	ne
c0dea4d6:	460a      	movne	r2, r1
c0dea4d8:	7042      	strb	r2, [r0, #1]
c0dea4da:	6b00      	ldr	r0, [r0, #48]	@ 0x30
c0dea4dc:	b2d3      	uxtb	r3, r2
c0dea4de:	4621      	mov	r1, r4
c0dea4e0:	2200      	movs	r2, #0
c0dea4e2:	f7fd f88b 	bl	c0de75fc <nbgl_layoutUpdateSpinner>
c0dea4e6:	2802      	cmp	r0, #2
c0dea4e8:	d022      	beq.n	c0dea530 <nbgl_useCaseSpinner+0x78>
c0dea4ea:	2801      	cmp	r0, #1
c0dea4ec:	d11e      	bne.n	c0dea52c <nbgl_useCaseSpinner+0x74>
c0dea4ee:	2004      	movs	r0, #4
c0dea4f0:	e01f      	b.n	c0dea532 <nbgl_useCaseSpinner+0x7a>
c0dea4f2:	eb09 0506 	add.w	r5, r9, r6
c0dea4f6:	216c      	movs	r1, #108	@ 0x6c
c0dea4f8:	4628      	mov	r0, r5
c0dea4fa:	f001 ff5d 	bl	c0dec3b8 <__aeabi_memclr>
c0dea4fe:	2701      	movs	r7, #1
c0dea500:	211c      	movs	r1, #28
c0dea502:	f809 7006 	strb.w	r7, [r9, r6]
c0dea506:	466e      	mov	r6, sp
c0dea508:	f000 fe94 	bl	c0deb234 <OUTLINED_FUNCTION_13>
c0dea50c:	4630      	mov	r0, r6
c0dea50e:	f88d 7001 	strb.w	r7, [sp, #1]
c0dea512:	f7f9 ff1d 	bl	c0de4350 <nbgl_layoutGet>
c0dea516:	786b      	ldrb	r3, [r5, #1]
c0dea518:	4621      	mov	r1, r4
c0dea51a:	2200      	movs	r2, #0
c0dea51c:	6328      	str	r0, [r5, #48]	@ 0x30
c0dea51e:	f7fc ff0d 	bl	c0de733c <nbgl_layoutAddSpinner>
c0dea522:	6b28      	ldr	r0, [r5, #48]	@ 0x30
c0dea524:	f7fd f90e 	bl	c0de7744 <nbgl_layoutDraw>
c0dea528:	f000 fe5e 	bl	c0deb1e8 <OUTLINED_FUNCTION_3>
c0dea52c:	b007      	add	sp, #28
c0dea52e:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0dea530:	2001      	movs	r0, #1
c0dea532:	b007      	add	sp, #28
c0dea534:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0dea538:	f001 bb04 	b.w	c0debb44 <nbgl_refreshSpecial>
c0dea53c:	000018fc 	.word	0x000018fc

c0dea540 <getContentAtIdx>:
c0dea540:	b570      	push	{r4, r5, r6, lr}
c0dea542:	4605      	mov	r5, r0
c0dea544:	2000      	movs	r0, #0
c0dea546:	2d00      	cmp	r5, #0
c0dea548:	d415      	bmi.n	c0dea576 <getContentAtIdx+0x36>
c0dea54a:	4e11      	ldr	r6, [pc, #68]	@ (c0dea590 <getContentAtIdx+0x50>)
c0dea54c:	460c      	mov	r4, r1
c0dea54e:	eb09 0106 	add.w	r1, r9, r6
c0dea552:	7b09      	ldrb	r1, [r1, #12]
c0dea554:	428d      	cmp	r5, r1
c0dea556:	da0e      	bge.n	c0dea576 <getContentAtIdx+0x36>
c0dea558:	eb09 0006 	add.w	r0, r9, r6
c0dea55c:	7900      	ldrb	r0, [r0, #4]
c0dea55e:	b158      	cbz	r0, c0dea578 <getContentAtIdx+0x38>
c0dea560:	4620      	mov	r0, r4
c0dea562:	2138      	movs	r1, #56	@ 0x38
c0dea564:	f001 ff28 	bl	c0dec3b8 <__aeabi_memclr>
c0dea568:	eb09 0006 	add.w	r0, r9, r6
c0dea56c:	4621      	mov	r1, r4
c0dea56e:	6882      	ldr	r2, [r0, #8]
c0dea570:	b2e8      	uxtb	r0, r5
c0dea572:	4790      	blx	r2
c0dea574:	4620      	mov	r0, r4
c0dea576:	bd70      	pop	{r4, r5, r6, pc}
c0dea578:	eb09 0006 	add.w	r0, r9, r6
c0dea57c:	ebc5 01c5 	rsb	r1, r5, r5, lsl #3
c0dea580:	6880      	ldr	r0, [r0, #8]
c0dea582:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
c0dea586:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0dea58a:	f001 bcf3 	b.w	c0debf74 <pic>
c0dea58e:	bf00      	nop
c0dea590:	000018fc 	.word	0x000018fc

c0dea594 <getContentNbElement>:
c0dea594:	7801      	ldrb	r1, [r0, #0]
c0dea596:	290a      	cmp	r1, #10
c0dea598:	d00b      	beq.n	c0dea5b2 <getContentNbElement+0x1e>
c0dea59a:	2906      	cmp	r1, #6
c0dea59c:	d009      	beq.n	c0dea5b2 <getContentNbElement+0x1e>
c0dea59e:	2907      	cmp	r1, #7
c0dea5a0:	d009      	beq.n	c0dea5b6 <getContentNbElement+0x22>
c0dea5a2:	2908      	cmp	r1, #8
c0dea5a4:	d009      	beq.n	c0dea5ba <getContentNbElement+0x26>
c0dea5a6:	2909      	cmp	r1, #9
c0dea5a8:	d009      	beq.n	c0dea5be <getContentNbElement+0x2a>
c0dea5aa:	2904      	cmp	r1, #4
c0dea5ac:	bf1c      	itt	ne
c0dea5ae:	2001      	movne	r0, #1
c0dea5b0:	4770      	bxne	lr
c0dea5b2:	7b00      	ldrb	r0, [r0, #12]
c0dea5b4:	4770      	bx	lr
c0dea5b6:	7a00      	ldrb	r0, [r0, #8]
c0dea5b8:	4770      	bx	lr
c0dea5ba:	7c00      	ldrb	r0, [r0, #16]
c0dea5bc:	4770      	bx	lr
c0dea5be:	7a40      	ldrb	r0, [r0, #9]
c0dea5c0:	4770      	bx	lr
	...

c0dea5c4 <genericContextComputeNextPageParams>:
c0dea5c4:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0dea5c8:	f8df 810c 	ldr.w	r8, [pc, #268]	@ c0dea6d8 <genericContextComputeNextPageParams+0x114>
c0dea5cc:	4682      	mov	sl, r0
c0dea5ce:	4616      	mov	r6, r2
c0dea5d0:	460d      	mov	r5, r1
c0dea5d2:	f10d 0107 	add.w	r1, sp, #7
c0dea5d6:	461a      	mov	r2, r3
c0dea5d8:	eb09 0008 	add.w	r0, r9, r8
c0dea5dc:	7c04      	ldrb	r4, [r0, #16]
c0dea5de:	7c87      	ldrb	r7, [r0, #18]
c0dea5e0:	4650      	mov	r0, sl
c0dea5e2:	f000 f881 	bl	c0dea6e8 <genericContextGetPageInfo>
c0dea5e6:	f89d 0007 	ldrb.w	r0, [sp, #7]
c0dea5ea:	f8df b0f0 	ldr.w	fp, [pc, #240]	@ c0dea6dc <genericContextComputeNextPageParams+0x118>
c0dea5ee:	7030      	strb	r0, [r6, #0]
c0dea5f0:	eb09 010b 	add.w	r1, r9, fp
c0dea5f4:	f891 1060 	ldrb.w	r1, [r1, #96]	@ 0x60
c0dea5f8:	4551      	cmp	r1, sl
c0dea5fa:	d219      	bcs.n	c0dea630 <genericContextComputeNextPageParams+0x6c>
c0dea5fc:	4b38      	ldr	r3, [pc, #224]	@ (c0dea6e0 <genericContextComputeNextPageParams+0x11c>)
c0dea5fe:	084e      	lsrs	r6, r1, #1
c0dea600:	2204      	movs	r2, #4
c0dea602:	ea02 0281 	and.w	r2, r2, r1, lsl #2
c0dea606:	444b      	add	r3, r9
c0dea608:	5d9b      	ldrb	r3, [r3, r6]
c0dea60a:	fa23 f202 	lsr.w	r2, r3, r2
c0dea60e:	2300      	movs	r3, #0
c0dea610:	f002 0207 	and.w	r2, r2, #7
c0dea614:	4417      	add	r7, r2
c0dea616:	eb09 0208 	add.w	r2, r9, r8
c0dea61a:	7c52      	ldrb	r2, [r2, #17]
c0dea61c:	4297      	cmp	r7, r2
c0dea61e:	bf28      	it	cs
c0dea620:	2301      	movcs	r3, #1
c0dea622:	2a00      	cmp	r2, #0
c0dea624:	bf18      	it	ne
c0dea626:	2201      	movne	r2, #1
c0dea628:	401a      	ands	r2, r3
c0dea62a:	bf18      	it	ne
c0dea62c:	2700      	movne	r7, #0
c0dea62e:	4414      	add	r4, r2
c0dea630:	4551      	cmp	r1, sl
c0dea632:	d905      	bls.n	c0dea640 <genericContextComputeNextPageParams+0x7c>
c0dea634:	1a3f      	subs	r7, r7, r0
c0dea636:	f1b7 3fff 	cmp.w	r7, #4294967295	@ 0xffffffff
c0dea63a:	bfdc      	itt	le
c0dea63c:	4247      	negle	r7, r0
c0dea63e:	3c01      	suble	r4, #1
c0dea640:	b2e6      	uxtb	r6, r4
c0dea642:	2eff      	cmp	r6, #255	@ 0xff
c0dea644:	d014      	beq.n	c0dea670 <genericContextComputeNextPageParams+0xac>
c0dea646:	eb09 0108 	add.w	r1, r9, r8
c0dea64a:	b260      	sxtb	r0, r4
c0dea64c:	7b09      	ldrb	r1, [r1, #12]
c0dea64e:	4288      	cmp	r0, r1
c0dea650:	d108      	bne.n	c0dea664 <genericContextComputeNextPageParams+0xa0>
c0dea652:	eb09 0108 	add.w	r1, r9, r8
c0dea656:	7d09      	ldrb	r1, [r1, #20]
c0dea658:	b121      	cbz	r1, c0dea664 <genericContextComputeNextPageParams+0xa0>
c0dea65a:	4822      	ldr	r0, [pc, #136]	@ (c0dea6e4 <genericContextComputeNextPageParams+0x120>)
c0dea65c:	4448      	add	r0, r9
c0dea65e:	f100 0538 	add.w	r5, r0, #56	@ 0x38
c0dea662:	e00d      	b.n	c0dea680 <genericContextComputeNextPageParams+0xbc>
c0dea664:	4629      	mov	r1, r5
c0dea666:	f7ff ff6b 	bl	c0dea540 <getContentAtIdx>
c0dea66a:	4605      	mov	r5, r0
c0dea66c:	b940      	cbnz	r0, c0dea680 <genericContextComputeNextPageParams+0xbc>
c0dea66e:	e02e      	b.n	c0dea6ce <genericContextComputeNextPageParams+0x10a>
c0dea670:	eb09 0008 	add.w	r0, r9, r8
c0dea674:	7cc0      	ldrb	r0, [r0, #19]
c0dea676:	2800      	cmp	r0, #0
c0dea678:	d0e5      	beq.n	c0dea646 <genericContextComputeNextPageParams+0x82>
c0dea67a:	481a      	ldr	r0, [pc, #104]	@ (c0dea6e4 <genericContextComputeNextPageParams+0x120>)
c0dea67c:	eb09 0500 	add.w	r5, r9, r0
c0dea680:	eb09 0008 	add.w	r0, r9, r8
c0dea684:	7c00      	ldrb	r0, [r0, #16]
c0dea686:	4286      	cmp	r6, r0
c0dea688:	d103      	bne.n	c0dea692 <genericContextComputeNextPageParams+0xce>
c0dea68a:	eb09 0008 	add.w	r0, r9, r8
c0dea68e:	7c40      	ldrb	r0, [r0, #17]
c0dea690:	b988      	cbnz	r0, c0dea6b6 <genericContextComputeNextPageParams+0xf2>
c0dea692:	eb09 0608 	add.w	r6, r9, r8
c0dea696:	4628      	mov	r0, r5
c0dea698:	7434      	strb	r4, [r6, #16]
c0dea69a:	f7ff ff7b 	bl	c0dea594 <getContentNbElement>
c0dea69e:	7470      	strb	r0, [r6, #17]
c0dea6a0:	6b68      	ldr	r0, [r5, #52]	@ 0x34
c0dea6a2:	eb09 040b 	add.w	r4, r9, fp
c0dea6a6:	f001 fc65 	bl	c0debf74 <pic>
c0dea6aa:	62e0      	str	r0, [r4, #44]	@ 0x2c
c0dea6ac:	7c70      	ldrb	r0, [r6, #17]
c0dea6ae:	f1b7 3fff 	cmp.w	r7, #4294967295	@ 0xffffffff
c0dea6b2:	dc02      	bgt.n	c0dea6ba <genericContextComputeNextPageParams+0xf6>
c0dea6b4:	4407      	add	r7, r0
c0dea6b6:	2f00      	cmp	r7, #0
c0dea6b8:	d409      	bmi.n	c0dea6ce <genericContextComputeNextPageParams+0x10a>
c0dea6ba:	4287      	cmp	r7, r0
c0dea6bc:	d207      	bcs.n	c0dea6ce <genericContextComputeNextPageParams+0x10a>
c0dea6be:	eb09 000b 	add.w	r0, r9, fp
c0dea6c2:	f880 a060 	strb.w	sl, [r0, #96]	@ 0x60
c0dea6c6:	eb09 0008 	add.w	r0, r9, r8
c0dea6ca:	7487      	strb	r7, [r0, #18]
c0dea6cc:	e000      	b.n	c0dea6d0 <genericContextComputeNextPageParams+0x10c>
c0dea6ce:	2500      	movs	r5, #0
c0dea6d0:	4628      	mov	r0, r5
c0dea6d2:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0dea6d6:	bf00      	nop
c0dea6d8:	000018fc 	.word	0x000018fc
c0dea6dc:	00001bc8 	.word	0x00001bc8
c0dea6e0:	00001ac8 	.word	0x00001ac8
c0dea6e4:	00001968 	.word	0x00001968

c0dea6e8 <genericContextGetPageInfo>:
c0dea6e8:	b510      	push	{r4, lr}
c0dea6ea:	4c08      	ldr	r4, [pc, #32]	@ (c0dea70c <genericContextGetPageInfo+0x24>)
c0dea6ec:	2304      	movs	r3, #4
c0dea6ee:	ea03 0380 	and.w	r3, r3, r0, lsl #2
c0dea6f2:	0840      	lsrs	r0, r0, #1
c0dea6f4:	444c      	add	r4, r9
c0dea6f6:	5c20      	ldrb	r0, [r4, r0]
c0dea6f8:	40d8      	lsrs	r0, r3
c0dea6fa:	b111      	cbz	r1, c0dea702 <genericContextGetPageInfo+0x1a>
c0dea6fc:	f000 0307 	and.w	r3, r0, #7
c0dea700:	700b      	strb	r3, [r1, #0]
c0dea702:	b112      	cbz	r2, c0dea70a <genericContextGetPageInfo+0x22>
c0dea704:	f3c0 00c0 	ubfx	r0, r0, #3, #1
c0dea708:	7010      	strb	r0, [r2, #0]
c0dea70a:	bd10      	pop	{r4, pc}
c0dea70c:	00001ac8 	.word	0x00001ac8

c0dea710 <bundleNavStartSettings>:
c0dea710:	2000      	movs	r0, #0
c0dea712:	f7fe bf3f 	b.w	c0de9594 <bundleNavStartSettingsAtPage>
	...

c0dea718 <displayFullValuePage>:
c0dea718:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea71c:	b092      	sub	sp, #72	@ 0x48
c0dea71e:	460d      	mov	r5, r1
c0dea720:	68d1      	ldr	r1, [r2, #12]
c0dea722:	4614      	mov	r4, r2
c0dea724:	b101      	cbz	r1, c0dea728 <displayFullValuePage+0x10>
c0dea726:	4608      	mov	r0, r1
c0dea728:	f001 fc24 	bl	c0debf74 <pic>
c0dea72c:	4606      	mov	r6, r0
c0dea72e:	7d20      	ldrb	r0, [r4, #20]
c0dea730:	2805      	cmp	r0, #5
c0dea732:	d00d      	beq.n	c0dea750 <displayFullValuePage+0x38>
c0dea734:	2804      	cmp	r0, #4
c0dea736:	d170      	bne.n	c0dea81a <displayFullValuePage+0x102>
c0dea738:	4861      	ldr	r0, [pc, #388]	@ (c0dea8c0 <displayFullValuePage+0x1a8>)
c0dea73a:	6921      	ldr	r1, [r4, #16]
c0dea73c:	2201      	movs	r2, #1
c0dea73e:	4448      	add	r0, r9
c0dea740:	6341      	str	r1, [r0, #52]	@ 0x34
c0dea742:	4630      	mov	r0, r6
c0dea744:	6921      	ldr	r1, [r4, #16]
c0dea746:	b012      	add	sp, #72	@ 0x48
c0dea748:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea74c:	f000 ba48 	b.w	c0deabe0 <displayInfosListModal>
c0dea750:	485b      	ldr	r0, [pc, #364]	@ (c0dea8c0 <displayFullValuePage+0x1a8>)
c0dea752:	6921      	ldr	r1, [r4, #16]
c0dea754:	2200      	movs	r2, #0
c0dea756:	4448      	add	r0, r9
c0dea758:	6381      	str	r1, [r0, #56]	@ 0x38
c0dea75a:	485a      	ldr	r0, [pc, #360]	@ (c0dea8c4 <displayFullValuePage+0x1ac>)
c0dea75c:	2100      	movs	r1, #0
c0dea75e:	6927      	ldr	r7, [r4, #16]
c0dea760:	9102      	str	r1, [sp, #8]
c0dea762:	4448      	add	r0, r9
c0dea764:	e9c0 220c 	strd	r2, r2, [r0, #48]	@ 0x30
c0dea768:	6382      	str	r2, [r0, #56]	@ 0x38
c0dea76a:	63c2      	str	r2, [r0, #60]	@ 0x3c
c0dea76c:	7a3d      	ldrb	r5, [r7, #8]
c0dea76e:	0628      	lsls	r0, r5, #24
c0dea770:	f000 8087 	beq.w	c0dea882 <displayFullValuePage+0x16a>
c0dea774:	9501      	str	r5, [sp, #4]
c0dea776:	fa5f fb85 	uxtb.w	fp, r5
c0dea77a:	f04f 0800 	mov.w	r8, #0
c0dea77e:	2600      	movs	r6, #0
c0dea780:	9802      	ldr	r0, [sp, #8]
c0dea782:	b2c0      	uxtb	r0, r0
c0dea784:	ea4f 1a00 	mov.w	sl, r0, lsl #4
c0dea788:	45c3      	cmp	fp, r8
c0dea78a:	d027      	beq.n	c0dea7dc <displayFullValuePage+0xc4>
c0dea78c:	f1b8 0f00 	cmp.w	r8, #0
c0dea790:	bf18      	it	ne
c0dea792:	3618      	addne	r6, #24
c0dea794:	6838      	ldr	r0, [r7, #0]
c0dea796:	b108      	cbz	r0, c0dea79c <displayFullValuePage+0x84>
c0dea798:	4450      	add	r0, sl
c0dea79a:	e004      	b.n	c0dea7a6 <displayFullValuePage+0x8e>
c0dea79c:	9802      	ldr	r0, [sp, #8]
c0dea79e:	6879      	ldr	r1, [r7, #4]
c0dea7a0:	4440      	add	r0, r8
c0dea7a2:	b2c0      	uxtb	r0, r0
c0dea7a4:	4788      	blx	r1
c0dea7a6:	f001 fbe5 	bl	c0debf74 <pic>
c0dea7aa:	7b7b      	ldrb	r3, [r7, #13]
c0dea7ac:	6801      	ldr	r1, [r0, #0]
c0dea7ae:	4604      	mov	r4, r0
c0dea7b0:	f000 fd3b 	bl	c0deb22a <OUTLINED_FUNCTION_12>
c0dea7b4:	6861      	ldr	r1, [r4, #4]
c0dea7b6:	7b7b      	ldrb	r3, [r7, #13]
c0dea7b8:	4605      	mov	r5, r0
c0dea7ba:	f000 fd36 	bl	c0deb22a <OUTLINED_FUNCTION_12>
c0dea7be:	1971      	adds	r1, r6, r5
c0dea7c0:	f10a 0a10 	add.w	sl, sl, #16
c0dea7c4:	f108 0801 	add.w	r8, r8, #1
c0dea7c8:	4408      	add	r0, r1
c0dea7ca:	1d06      	adds	r6, r0, #4
c0dea7cc:	b2b0      	uxth	r0, r6
c0dea7ce:	f5b0 7fe8 	cmp.w	r0, #464	@ 0x1d0
c0dea7d2:	d3d9      	bcc.n	c0dea788 <displayFullValuePage+0x70>
c0dea7d4:	9d01      	ldr	r5, [sp, #4]
c0dea7d6:	f1a8 0001 	sub.w	r0, r8, #1
c0dea7da:	e001      	b.n	c0dea7e0 <displayFullValuePage+0xc8>
c0dea7dc:	9d01      	ldr	r5, [sp, #4]
c0dea7de:	4628      	mov	r0, r5
c0dea7e0:	4938      	ldr	r1, [pc, #224]	@ (c0dea8c4 <displayFullValuePage+0x1ac>)
c0dea7e2:	2404      	movs	r4, #4
c0dea7e4:	1a2d      	subs	r5, r5, r0
c0dea7e6:	4449      	add	r1, r9
c0dea7e8:	f891 2030 	ldrb.w	r2, [r1, #48]	@ 0x30
c0dea7ec:	1c53      	adds	r3, r2, #1
c0dea7ee:	f881 3030 	strb.w	r3, [r1, #48]	@ 0x30
c0dea7f2:	eb01 0152 	add.w	r1, r1, r2, lsr #1
c0dea7f6:	ea04 0282 	and.w	r2, r4, r2, lsl #2
c0dea7fa:	240f      	movs	r4, #15
c0dea7fc:	f891 3050 	ldrb.w	r3, [r1, #80]	@ 0x50
c0dea800:	4094      	lsls	r4, r2
c0dea802:	43a3      	bics	r3, r4
c0dea804:	f000 0407 	and.w	r4, r0, #7
c0dea808:	fa04 f202 	lsl.w	r2, r4, r2
c0dea80c:	431a      	orrs	r2, r3
c0dea80e:	f881 2050 	strb.w	r2, [r1, #80]	@ 0x50
c0dea812:	9902      	ldr	r1, [sp, #8]
c0dea814:	4401      	add	r1, r0
c0dea816:	9102      	str	r1, [sp, #8]
c0dea818:	e7a9      	b.n	c0dea76e <displayFullValuePage+0x56>
c0dea81a:	af0b      	add	r7, sp, #44	@ 0x2c
c0dea81c:	492a      	ldr	r1, [pc, #168]	@ (c0dea8c8 <displayFullValuePage+0x1b0>)
c0dea81e:	221c      	movs	r2, #28
c0dea820:	4638      	mov	r0, r7
c0dea822:	4479      	add	r1, pc
c0dea824:	f001 fdbe 	bl	c0dec3a4 <__aeabi_memcpy>
c0dea828:	f44f 6010 	mov.w	r0, #2304	@ 0x900
c0dea82c:	f8df 8090 	ldr.w	r8, [pc, #144]	@ c0dea8c0 <displayFullValuePage+0x1a8>
c0dea830:	9609      	str	r6, [sp, #36]	@ 0x24
c0dea832:	f8ad 0028 	strh.w	r0, [sp, #40]	@ 0x28
c0dea836:	2000      	movs	r0, #0
c0dea838:	9008      	str	r0, [sp, #32]
c0dea83a:	2001      	movs	r0, #1
c0dea83c:	eb09 0608 	add.w	r6, r9, r8
c0dea840:	f8ad 001c 	strh.w	r0, [sp, #28]
c0dea844:	4638      	mov	r0, r7
c0dea846:	f7f9 fd83 	bl	c0de4350 <nbgl_layoutGet>
c0dea84a:	62f0      	str	r0, [r6, #44]	@ 0x2c
c0dea84c:	a907      	add	r1, sp, #28
c0dea84e:	f7fc fb17 	bl	c0de6e80 <nbgl_layoutAddHeader>
c0dea852:	7d20      	ldrb	r0, [r4, #20]
c0dea854:	2801      	cmp	r0, #1
c0dea856:	d01b      	beq.n	c0dea890 <displayFullValuePage+0x178>
c0dea858:	2802      	cmp	r0, #2
c0dea85a:	d01c      	beq.n	c0dea896 <displayFullValuePage+0x17e>
c0dea85c:	2803      	cmp	r0, #3
c0dea85e:	d11d      	bne.n	c0dea89c <displayFullValuePage+0x184>
c0dea860:	f44f 3080 	mov.w	r0, #65536	@ 0x10000
c0dea864:	9006      	str	r0, [sp, #24]
c0dea866:	cc07      	ldmia	r4!, {r0, r1, r2}
c0dea868:	9105      	str	r1, [sp, #20]
c0dea86a:	2a00      	cmp	r2, #0
c0dea86c:	9003      	str	r0, [sp, #12]
c0dea86e:	bf08      	it	eq
c0dea870:	4602      	moveq	r2, r0
c0dea872:	eb09 0008 	add.w	r0, r9, r8
c0dea876:	9204      	str	r2, [sp, #16]
c0dea878:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0dea87a:	a903      	add	r1, sp, #12
c0dea87c:	f7fb fea5 	bl	c0de65ca <nbgl_layoutAddQRCode>
c0dea880:	e014      	b.n	c0dea8ac <displayFullValuePage+0x194>
c0dea882:	2000      	movs	r0, #0
c0dea884:	2101      	movs	r1, #1
c0dea886:	b012      	add	sp, #72	@ 0x48
c0dea888:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea88c:	f000 bb12 	b.w	c0deaeb4 <displayTagValueListModalPage>
c0dea890:	4b0e      	ldr	r3, [pc, #56]	@ (c0dea8cc <displayFullValuePage+0x1b4>)
c0dea892:	447b      	add	r3, pc
c0dea894:	e003      	b.n	c0dea89e <displayFullValuePage+0x186>
c0dea896:	4b0e      	ldr	r3, [pc, #56]	@ (c0dea8d0 <displayFullValuePage+0x1b8>)
c0dea898:	447b      	add	r3, pc
c0dea89a:	e000      	b.n	c0dea89e <displayFullValuePage+0x186>
c0dea89c:	6863      	ldr	r3, [r4, #4]
c0dea89e:	eb09 0008 	add.w	r0, r9, r8
c0dea8a2:	6822      	ldr	r2, [r4, #0]
c0dea8a4:	4629      	mov	r1, r5
c0dea8a6:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0dea8a8:	f7fb fa72 	bl	c0de5d90 <nbgl_layoutAddTextContent>
c0dea8ac:	eb09 0008 	add.w	r0, r9, r8
c0dea8b0:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0dea8b2:	f7fc ff47 	bl	c0de7744 <nbgl_layoutDraw>
c0dea8b6:	f001 f940 	bl	c0debb3a <nbgl_refresh>
c0dea8ba:	b012      	add	sp, #72	@ 0x48
c0dea8bc:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0dea8c0:	000018fc 	.word	0x000018fc
c0dea8c4:	00001bc8 	.word	0x00001bc8
c0dea8c8:	00005036 	.word	0x00005036
c0dea8cc:	000031fc 	.word	0x000031fc
c0dea8d0:	000034e5 	.word	0x000034e5

c0dea8d4 <displaySecurityReport>:
c0dea8d4:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea8d8:	b09a      	sub	sp, #104	@ 0x68
c0dea8da:	ac13      	add	r4, sp, #76	@ 0x4c
c0dea8dc:	4974      	ldr	r1, [pc, #464]	@ (c0deaab0 <displaySecurityReport+0x1dc>)
c0dea8de:	4605      	mov	r5, r0
c0dea8e0:	221c      	movs	r2, #28
c0dea8e2:	4620      	mov	r0, r4
c0dea8e4:	4479      	add	r1, pc
c0dea8e6:	f001 fd5d 	bl	c0dec3a4 <__aeabi_memcpy>
c0dea8ea:	4872      	ldr	r0, [pc, #456]	@ (c0deaab4 <displaySecurityReport+0x1e0>)
c0dea8ec:	a90f      	add	r1, sp, #60	@ 0x3c
c0dea8ee:	4478      	add	r0, pc
c0dea8f0:	e890 00cc 	ldmia.w	r0, {r2, r3, r6, r7}
c0dea8f4:	c1cc      	stmia	r1!, {r2, r3, r6, r7}
c0dea8f6:	a809      	add	r0, sp, #36	@ 0x24
c0dea8f8:	2118      	movs	r1, #24
c0dea8fa:	f001 fd5d 	bl	c0dec3b8 <__aeabi_memclr>
c0dea8fe:	f8df b1a8 	ldr.w	fp, [pc, #424]	@ c0deaaa8 <displaySecurityReport+0x1d4>
c0dea902:	4620      	mov	r0, r4
c0dea904:	eb09 060b 	add.w	r6, r9, fp
c0dea908:	f7f9 fd22 	bl	c0de4350 <nbgl_layoutGet>
c0dea90c:	4604      	mov	r4, r0
c0dea90e:	6670      	str	r0, [r6, #100]	@ 0x64
c0dea910:	f896 0068 	ldrb.w	r0, [r6, #104]	@ 0x68
c0dea914:	2801      	cmp	r0, #1
c0dea916:	d14b      	bne.n	c0dea9b0 <displaySecurityReport+0xdc>
c0dea918:	f896 0069 	ldrb.w	r0, [r6, #105]	@ 0x69
c0dea91c:	2800      	cmp	r0, #0
c0dea91e:	d147      	bne.n	c0dea9b0 <displaySecurityReport+0xdc>
c0dea920:	4865      	ldr	r0, [pc, #404]	@ (c0deaab8 <displaySecurityReport+0x1e4>)
c0dea922:	2600      	movs	r6, #0
c0dea924:	466c      	mov	r4, sp
c0dea926:	f04f 0800 	mov.w	r8, #0
c0dea92a:	4478      	add	r0, pc
c0dea92c:	1d05      	adds	r5, r0, #4
c0dea92e:	2e05      	cmp	r6, #5
c0dea930:	d075      	beq.n	c0deaa1e <displaySecurityReport+0x14a>
c0dea932:	eb09 000b 	add.w	r0, r9, fp
c0dea936:	f8d0 a058 	ldr.w	sl, [r0, #88]	@ 0x58
c0dea93a:	f8da 0000 	ldr.w	r0, [sl]
c0dea93e:	40f0      	lsrs	r0, r6
c0dea940:	07c0      	lsls	r0, r0, #31
c0dea942:	d02b      	beq.n	c0dea99c <displaySecurityReport+0xc8>
c0dea944:	4620      	mov	r0, r4
c0dea946:	2118      	movs	r1, #24
c0dea948:	f001 fd36 	bl	c0dec3b8 <__aeabi_memclr>
c0dea94c:	f008 007f 	and.w	r0, r8, #127	@ 0x7f
c0dea950:	2804      	cmp	r0, #4
c0dea952:	d828      	bhi.n	c0dea9a6 <displaySecurityReport+0xd2>
c0dea954:	2101      	movs	r1, #1
c0dea956:	fa01 f000 	lsl.w	r0, r1, r0
c0dea95a:	f010 0f19 	tst.w	r0, #25
c0dea95e:	d022      	beq.n	c0dea9a6 <displaySecurityReport+0xd2>
c0dea960:	6868      	ldr	r0, [r5, #4]
c0dea962:	9003      	str	r0, [sp, #12]
c0dea964:	6828      	ldr	r0, [r5, #0]
c0dea966:	2e03      	cmp	r6, #3
c0dea968:	9001      	str	r0, [sp, #4]
c0dea96a:	d101      	bne.n	c0dea970 <displaySecurityReport+0x9c>
c0dea96c:	20ff      	movs	r0, #255	@ 0xff
c0dea96e:	e007      	b.n	c0dea980 <displaySecurityReport+0xac>
c0dea970:	2009      	movs	r0, #9
c0dea972:	f88d 0014 	strb.w	r0, [sp, #20]
c0dea976:	4851      	ldr	r0, [pc, #324]	@ (c0deaabc <displaySecurityReport+0x1e8>)
c0dea978:	4478      	add	r0, pc
c0dea97a:	9002      	str	r0, [sp, #8]
c0dea97c:	f106 0017 	add.w	r0, r6, #23
c0dea980:	f88d 0011 	strb.w	r0, [sp, #17]
c0dea984:	f855 0c04 	ldr.w	r0, [r5, #-4]
c0dea988:	eb09 070b 	add.w	r7, r9, fp
c0dea98c:	4621      	mov	r1, r4
c0dea98e:	9000      	str	r0, [sp, #0]
c0dea990:	6e78      	ldr	r0, [r7, #100]	@ 0x64
c0dea992:	f7fa fe8a 	bl	c0de56aa <nbgl_layoutAddTouchableBar>
c0dea996:	6e78      	ldr	r0, [r7, #100]	@ 0x64
c0dea998:	f7fc f948 	bl	c0de6c2c <nbgl_layoutAddSeparationLine>
c0dea99c:	350c      	adds	r5, #12
c0dea99e:	f108 0801 	add.w	r8, r8, #1
c0dea9a2:	3601      	adds	r6, #1
c0dea9a4:	e7c3      	b.n	c0dea92e <displaySecurityReport+0x5a>
c0dea9a6:	f8da 0010 	ldr.w	r0, [sl, #16]
c0dea9aa:	2800      	cmp	r0, #0
c0dea9ac:	d1d9      	bne.n	c0dea962 <displaySecurityReport+0x8e>
c0dea9ae:	e7d7      	b.n	c0dea960 <displaySecurityReport+0x8c>
c0dea9b0:	eb09 000b 	add.w	r0, r9, fp
c0dea9b4:	6d80      	ldr	r0, [r0, #88]	@ 0x58
c0dea9b6:	b108      	cbz	r0, c0dea9bc <displaySecurityReport+0xe8>
c0dea9b8:	68c6      	ldr	r6, [r0, #12]
c0dea9ba:	b90e      	cbnz	r6, c0dea9c0 <displaySecurityReport+0xec>
c0dea9bc:	4e40      	ldr	r6, [pc, #256]	@ (c0deaac0 <displaySecurityReport+0x1ec>)
c0dea9be:	447e      	add	r6, pc
c0dea9c0:	f015 0f06 	tst.w	r5, #6
c0dea9c4:	d035      	beq.n	c0deaa32 <displaySecurityReport+0x15e>
c0dea9c6:	f44f 3180 	mov.w	r1, #65536	@ 0x10000
c0dea9ca:	9103      	str	r1, [sp, #12]
c0dea9cc:	493d      	ldr	r1, [pc, #244]	@ (c0deaac4 <displaySecurityReport+0x1f0>)
c0dea9ce:	4479      	add	r1, pc
c0dea9d0:	9102      	str	r1, [sp, #8]
c0dea9d2:	2140      	movs	r1, #64	@ 0x40
c0dea9d4:	6883      	ldr	r3, [r0, #8]
c0dea9d6:	4835      	ldr	r0, [pc, #212]	@ (c0deaaac <displaySecurityReport+0x1d8>)
c0dea9d8:	4448      	add	r0, r9
c0dea9da:	9301      	str	r3, [sp, #4]
c0dea9dc:	f100 0440 	add.w	r4, r0, #64	@ 0x40
c0dea9e0:	9400      	str	r4, [sp, #0]
c0dea9e2:	4620      	mov	r0, r4
c0dea9e4:	4a38      	ldr	r2, [pc, #224]	@ (c0deaac8 <displaySecurityReport+0x1f4>)
c0dea9e6:	447a      	add	r2, pc
c0dea9e8:	f001 f932 	bl	c0debc50 <snprintf>
c0dea9ec:	4620      	mov	r0, r4
c0dea9ee:	f001 fd4f 	bl	c0dec490 <strlen>
c0dea9f2:	4605      	mov	r5, r0
c0dea9f4:	eb09 000b 	add.w	r0, r9, fp
c0dea9f8:	4669      	mov	r1, sp
c0dea9fa:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0dea9fc:	f7fb fde5 	bl	c0de65ca <nbgl_layoutAddQRCode>
c0deaa00:	2018      	movs	r0, #24
c0deaa02:	f1c5 013f 	rsb	r1, r5, #63	@ 0x3f
c0deaa06:	4633      	mov	r3, r6
c0deaa08:	f8ad 0028 	strh.w	r0, [sp, #40]	@ 0x28
c0deaa0c:	1928      	adds	r0, r5, r4
c0deaa0e:	4a2f      	ldr	r2, [pc, #188]	@ (c0deaacc <displaySecurityReport+0x1f8>)
c0deaa10:	1c44      	adds	r4, r0, #1
c0deaa12:	4620      	mov	r0, r4
c0deaa14:	447a      	add	r2, pc
c0deaa16:	f001 f91b 	bl	c0debc50 <snprintf>
c0deaa1a:	9411      	str	r4, [sp, #68]	@ 0x44
c0deaa1c:	e030      	b.n	c0deaa80 <displaySecurityReport+0x1ac>
c0deaa1e:	4831      	ldr	r0, [pc, #196]	@ (c0deaae4 <displaySecurityReport+0x210>)
c0deaa20:	4478      	add	r0, pc
c0deaa22:	9011      	str	r0, [sp, #68]	@ 0x44
c0deaa24:	eb09 000b 	add.w	r0, r9, fp
c0deaa28:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0deaa2a:	a90f      	add	r1, sp, #60	@ 0x3c
c0deaa2c:	f7fc fa28 	bl	c0de6e80 <nbgl_layoutAddHeader>
c0deaa30:	e030      	b.n	c0deaa94 <displaySecurityReport+0x1c0>
c0deaa32:	06e8      	lsls	r0, r5, #27
c0deaa34:	d40c      	bmi.n	c0deaa50 <displaySecurityReport+0x17c>
c0deaa36:	07e8      	lsls	r0, r5, #31
c0deaa38:	d0f4      	beq.n	c0deaa24 <displaySecurityReport+0x150>
c0deaa3a:	466d      	mov	r5, sp
c0deaa3c:	2124      	movs	r1, #36	@ 0x24
c0deaa3e:	4628      	mov	r0, r5
c0deaa40:	f001 fcba 	bl	c0dec3b8 <__aeabi_memclr>
c0deaa44:	4825      	ldr	r0, [pc, #148]	@ (c0deaadc <displaySecurityReport+0x208>)
c0deaa46:	4478      	add	r0, pc
c0deaa48:	9006      	str	r0, [sp, #24]
c0deaa4a:	4825      	ldr	r0, [pc, #148]	@ (c0deaae0 <displaySecurityReport+0x20c>)
c0deaa4c:	4478      	add	r0, pc
c0deaa4e:	e009      	b.n	c0deaa64 <displaySecurityReport+0x190>
c0deaa50:	466d      	mov	r5, sp
c0deaa52:	2124      	movs	r1, #36	@ 0x24
c0deaa54:	4628      	mov	r0, r5
c0deaa56:	f001 fcaf 	bl	c0dec3b8 <__aeabi_memclr>
c0deaa5a:	481d      	ldr	r0, [pc, #116]	@ (c0deaad0 <displaySecurityReport+0x1fc>)
c0deaa5c:	4478      	add	r0, pc
c0deaa5e:	9006      	str	r0, [sp, #24]
c0deaa60:	481c      	ldr	r0, [pc, #112]	@ (c0deaad4 <displaySecurityReport+0x200>)
c0deaa62:	4478      	add	r0, pc
c0deaa64:	9004      	str	r0, [sp, #16]
c0deaa66:	4629      	mov	r1, r5
c0deaa68:	481b      	ldr	r0, [pc, #108]	@ (c0deaad8 <displaySecurityReport+0x204>)
c0deaa6a:	4478      	add	r0, pc
c0deaa6c:	9001      	str	r0, [sp, #4]
c0deaa6e:	4620      	mov	r0, r4
c0deaa70:	f7fb fda2 	bl	c0de65b8 <nbgl_layoutAddContentCenter>
c0deaa74:	2040      	movs	r0, #64	@ 0x40
c0deaa76:	f8ad 0028 	strh.w	r0, [sp, #40]	@ 0x28
c0deaa7a:	2000      	movs	r0, #0
c0deaa7c:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0deaa80:	eb09 040b 	add.w	r4, r9, fp
c0deaa84:	6e60      	ldr	r0, [r4, #100]	@ 0x64
c0deaa86:	a90f      	add	r1, sp, #60	@ 0x3c
c0deaa88:	f7fc f9fa 	bl	c0de6e80 <nbgl_layoutAddHeader>
c0deaa8c:	6e60      	ldr	r0, [r4, #100]	@ 0x64
c0deaa8e:	a909      	add	r1, sp, #36	@ 0x24
c0deaa90:	f7fa fa62 	bl	c0de4f58 <nbgl_layoutAddExtendedFooter>
c0deaa94:	eb09 000b 	add.w	r0, r9, fp
c0deaa98:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0deaa9a:	f7fc fe53 	bl	c0de7744 <nbgl_layoutDraw>
c0deaa9e:	f001 f84c 	bl	c0debb3a <nbgl_refresh>
c0deaaa2:	b01a      	add	sp, #104	@ 0x68
c0deaaa4:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0deaaa8:	000018fc 	.word	0x000018fc
c0deaaac:	00001a48 	.word	0x00001a48
c0deaab0:	00004f74 	.word	0x00004f74
c0deaab4:	00004ede 	.word	0x00004ede
c0deaab8:	00004ef2 	.word	0x00004ef2
c0deaabc:	00002751 	.word	0x00002751
c0deaac0:	0000337b 	.word	0x0000337b
c0deaac4:	000031bc 	.word	0x000031bc
c0deaac8:	0000305b 	.word	0x0000305b
c0deaacc:	0000310c 	.word	0x0000310c
c0deaad0:	00003147 	.word	0x00003147
c0deaad4:	00003235 	.word	0x00003235
c0deaad8:	000024ed 	.word	0x000024ed
c0deaadc:	0000352d 	.word	0x0000352d
c0deaae0:	00002eaa 	.word	0x00002eaa
c0deaae4:	00003098 	.word	0x00003098

c0deaae8 <displayCustomizedSecurityReport>:
c0deaae8:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0deaaec:	b092      	sub	sp, #72	@ 0x48
c0deaaee:	4939      	ldr	r1, [pc, #228]	@ (c0deabd4 <displayCustomizedSecurityReport+0xec>)
c0deaaf0:	f10d 0a2c 	add.w	sl, sp, #44	@ 0x2c
c0deaaf4:	4604      	mov	r4, r0
c0deaaf6:	221c      	movs	r2, #28
c0deaaf8:	4650      	mov	r0, sl
c0deaafa:	4479      	add	r1, pc
c0deaafc:	f001 fc52 	bl	c0dec3a4 <__aeabi_memcpy>
c0deab00:	4835      	ldr	r0, [pc, #212]	@ (c0deabd8 <displayCustomizedSecurityReport+0xf0>)
c0deab02:	ae07      	add	r6, sp, #28
c0deab04:	4631      	mov	r1, r6
c0deab06:	4478      	add	r0, pc
c0deab08:	e890 00ac 	ldmia.w	r0, {r2, r3, r5, r7}
c0deab0c:	4830      	ldr	r0, [pc, #192]	@ (c0deabd0 <displayCustomizedSecurityReport+0xe8>)
c0deab0e:	c1ac      	stmia	r1!, {r2, r3, r5, r7}
c0deab10:	eb09 0500 	add.w	r5, r9, r0
c0deab14:	4650      	mov	r0, sl
c0deab16:	f7f9 fc1b 	bl	c0de4350 <nbgl_layoutGet>
c0deab1a:	6668      	str	r0, [r5, #100]	@ 0x64
c0deab1c:	6821      	ldr	r1, [r4, #0]
c0deab1e:	9109      	str	r1, [sp, #36]	@ 0x24
c0deab20:	4631      	mov	r1, r6
c0deab22:	f7fc f9ad 	bl	c0de6e80 <nbgl_layoutAddHeader>
c0deab26:	7920      	ldrb	r0, [r4, #4]
c0deab28:	b398      	cbz	r0, c0deab92 <displayCustomizedSecurityReport+0xaa>
c0deab2a:	2801      	cmp	r0, #1
c0deab2c:	d03c      	beq.n	c0deaba8 <displayCustomizedSecurityReport+0xc0>
c0deab2e:	2802      	cmp	r0, #2
c0deab30:	d143      	bne.n	c0deabba <displayCustomizedSecurityReport+0xd2>
c0deab32:	4f2a      	ldr	r7, [pc, #168]	@ (c0deabdc <displayCustomizedSecurityReport+0xf4>)
c0deab34:	2600      	movs	r6, #0
c0deab36:	f04f 0a09 	mov.w	sl, #9
c0deab3a:	f10d 0b04 	add.w	fp, sp, #4
c0deab3e:	2500      	movs	r5, #0
c0deab40:	447f      	add	r7, pc
c0deab42:	7a20      	ldrb	r0, [r4, #8]
c0deab44:	4285      	cmp	r5, r0
c0deab46:	d238      	bcs.n	c0deabba <displayCustomizedSecurityReport+0xd2>
c0deab48:	f104 020c 	add.w	r2, r4, #12
c0deab4c:	ca07      	ldmia	r2, {r0, r1, r2}
c0deab4e:	f850 0025 	ldr.w	r0, [r0, r5, lsl #2]
c0deab52:	9002      	str	r0, [sp, #8]
c0deab54:	f851 0025 	ldr.w	r0, [r1, r5, lsl #2]
c0deab58:	f88d a018 	strb.w	sl, [sp, #24]
c0deab5c:	f88d 6016 	strb.w	r6, [sp, #22]
c0deab60:	f88d 6014 	strb.w	r6, [sp, #20]
c0deab64:	4659      	mov	r1, fp
c0deab66:	e9cd 7003 	strd	r7, r0, [sp, #12]
c0deab6a:	f105 0017 	add.w	r0, r5, #23
c0deab6e:	f88d 0015 	strb.w	r0, [sp, #21]
c0deab72:	f852 0025 	ldr.w	r0, [r2, r5, lsl #2]
c0deab76:	9001      	str	r0, [sp, #4]
c0deab78:	4815      	ldr	r0, [pc, #84]	@ (c0deabd0 <displayCustomizedSecurityReport+0xe8>)
c0deab7a:	eb09 0800 	add.w	r8, r9, r0
c0deab7e:	f8d8 0064 	ldr.w	r0, [r8, #100]	@ 0x64
c0deab82:	f7fa fd92 	bl	c0de56aa <nbgl_layoutAddTouchableBar>
c0deab86:	f8d8 0064 	ldr.w	r0, [r8, #100]	@ 0x64
c0deab8a:	f7fc f84f 	bl	c0de6c2c <nbgl_layoutAddSeparationLine>
c0deab8e:	3501      	adds	r5, #1
c0deab90:	e7d7      	b.n	c0deab42 <displayCustomizedSecurityReport+0x5a>
c0deab92:	480f      	ldr	r0, [pc, #60]	@ (c0deabd0 <displayCustomizedSecurityReport+0xe8>)
c0deab94:	f104 0108 	add.w	r1, r4, #8
c0deab98:	4448      	add	r0, r9
c0deab9a:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0deab9c:	f7fb fd0c 	bl	c0de65b8 <nbgl_layoutAddContentCenter>
c0deaba0:	2000      	movs	r0, #0
c0deaba2:	f88d 001d 	strb.w	r0, [sp, #29]
c0deaba6:	e008      	b.n	c0deabba <displayCustomizedSecurityReport+0xd2>
c0deaba8:	4809      	ldr	r0, [pc, #36]	@ (c0deabd0 <displayCustomizedSecurityReport+0xe8>)
c0deabaa:	f104 0108 	add.w	r1, r4, #8
c0deabae:	4448      	add	r0, r9
c0deabb0:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0deabb2:	f7fb fd0a 	bl	c0de65ca <nbgl_layoutAddQRCode>
c0deabb6:	6820      	ldr	r0, [r4, #0]
c0deabb8:	9009      	str	r0, [sp, #36]	@ 0x24
c0deabba:	4805      	ldr	r0, [pc, #20]	@ (c0deabd0 <displayCustomizedSecurityReport+0xe8>)
c0deabbc:	4448      	add	r0, r9
c0deabbe:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0deabc0:	f7fc fdc0 	bl	c0de7744 <nbgl_layoutDraw>
c0deabc4:	f000 ffb9 	bl	c0debb3a <nbgl_refresh>
c0deabc8:	b012      	add	sp, #72	@ 0x48
c0deabca:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0deabce:	bf00      	nop
c0deabd0:	000018fc 	.word	0x000018fc
c0deabd4:	00004d5e 	.word	0x00004d5e
c0deabd8:	00004cc6 	.word	0x00004cc6
c0deabdc:	00002589 	.word	0x00002589

c0deabe0 <displayInfosListModal>:
c0deabe0:	b570      	push	{r4, r5, r6, lr}
c0deabe2:	b098      	sub	sp, #96	@ 0x60
c0deabe4:	4606      	mov	r6, r0
c0deabe6:	460c      	mov	r4, r1
c0deabe8:	a811      	add	r0, sp, #68	@ 0x44
c0deabea:	491c      	ldr	r1, [pc, #112]	@ (c0deac5c <displayInfosListModal+0x7c>)
c0deabec:	4615      	mov	r5, r2
c0deabee:	221c      	movs	r2, #28
c0deabf0:	4479      	add	r1, pc
c0deabf2:	f001 fbd7 	bl	c0dec3a4 <__aeabi_memcpy>
c0deabf6:	2008      	movs	r0, #8
c0deabf8:	f88d 0010 	strb.w	r0, [sp, #16]
c0deabfc:	2000      	movs	r0, #0
c0deabfe:	9003      	str	r0, [sp, #12]
c0deac00:	4814      	ldr	r0, [pc, #80]	@ (c0deac54 <displayInfosListModal+0x74>)
c0deac02:	e9cd 6001 	strd	r6, r0, [sp, #4]
c0deac06:	200f      	movs	r0, #15
c0deac08:	2d00      	cmp	r5, #0
c0deac0a:	bf18      	it	ne
c0deac0c:	200e      	movne	r0, #14
c0deac0e:	f88d 0021 	strb.w	r0, [sp, #33]	@ 0x21
c0deac12:	e894 0007 	ldmia.w	r4, {r0, r1, r2}
c0deac16:	ab05      	add	r3, sp, #20
c0deac18:	c307      	stmia	r3!, {r0, r1, r2}
c0deac1a:	7b20      	ldrb	r0, [r4, #12]
c0deac1c:	f88d 0020 	strb.w	r0, [sp, #32]
c0deac20:	7ba0      	ldrb	r0, [r4, #14]
c0deac22:	4c0d      	ldr	r4, [pc, #52]	@ (c0deac58 <displayInfosListModal+0x78>)
c0deac24:	f88d 0022 	strb.w	r0, [sp, #34]	@ 0x22
c0deac28:	eb09 0004 	add.w	r0, r9, r4
c0deac2c:	6a00      	ldr	r0, [r0, #32]
c0deac2e:	b108      	cbz	r0, c0deac34 <displayInfosListModal+0x54>
c0deac30:	f7fd fec1 	bl	c0de89b6 <nbgl_pageRelease>
c0deac34:	480a      	ldr	r0, [pc, #40]	@ (c0deac60 <displayInfosListModal+0x80>)
c0deac36:	a911      	add	r1, sp, #68	@ 0x44
c0deac38:	aa01      	add	r2, sp, #4
c0deac3a:	2301      	movs	r3, #1
c0deac3c:	4478      	add	r0, pc
c0deac3e:	f7fd fc91 	bl	c0de8564 <nbgl_pageDrawGenericContentExt>
c0deac42:	eb09 0104 	add.w	r1, r9, r4
c0deac46:	6208      	str	r0, [r1, #32]
c0deac48:	2002      	movs	r0, #2
c0deac4a:	f000 ff7b 	bl	c0debb44 <nbgl_refreshSpecial>
c0deac4e:	b018      	add	sp, #96	@ 0x60
c0deac50:	bd70      	pop	{r4, r5, r6, pc}
c0deac52:	bf00      	nop
c0deac54:	00091300 	.word	0x00091300
c0deac58:	00001bc8 	.word	0x00001bc8
c0deac5c:	00004c84 	.word	0x00004c84
c0deac60:	ffffef75 	.word	0xffffef75

c0deac64 <modalLayoutTouchCallback>:
c0deac64:	b570      	push	{r4, r5, r6, lr}
c0deac66:	2816      	cmp	r0, #22
c0deac68:	d00a      	beq.n	c0deac80 <modalLayoutTouchCallback+0x1c>
c0deac6a:	2815      	cmp	r0, #21
c0deac6c:	d117      	bne.n	c0deac9e <modalLayoutTouchCallback+0x3a>
c0deac6e:	4833      	ldr	r0, [pc, #204]	@ (c0dead3c <modalLayoutTouchCallback+0xd8>)
c0deac70:	eb09 0400 	add.w	r4, r9, r0
c0deac74:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0deac76:	f7fc fd93 	bl	c0de77a0 <nbgl_layoutRelease>
c0deac7a:	2000      	movs	r0, #0
c0deac7c:	6320      	str	r0, [r4, #48]	@ 0x30
c0deac7e:	e035      	b.n	c0deacec <modalLayoutTouchCallback+0x88>
c0deac80:	4c2d      	ldr	r4, [pc, #180]	@ (c0dead38 <modalLayoutTouchCallback+0xd4>)
c0deac82:	eb09 0504 	add.w	r5, r9, r4
c0deac86:	6e68      	ldr	r0, [r5, #100]	@ 0x64
c0deac88:	f7fc fd8a 	bl	c0de77a0 <nbgl_layoutRelease>
c0deac8c:	f895 0068 	ldrb.w	r0, [r5, #104]	@ 0x68
c0deac90:	2801      	cmp	r0, #1
c0deac92:	d817      	bhi.n	c0deacc4 <modalLayoutTouchCallback+0x60>
c0deac94:	eb09 0004 	add.w	r0, r9, r4
c0deac98:	2100      	movs	r1, #0
c0deac9a:	6641      	str	r1, [r0, #100]	@ 0x64
c0deac9c:	e026      	b.n	c0deacec <modalLayoutTouchCallback+0x88>
c0deac9e:	f1a0 0417 	sub.w	r4, r0, #23
c0deaca2:	2c04      	cmp	r4, #4
c0deaca4:	d81a      	bhi.n	c0deacdc <modalLayoutTouchCallback+0x78>
c0deaca6:	4d24      	ldr	r5, [pc, #144]	@ (c0dead38 <modalLayoutTouchCallback+0xd4>)
c0deaca8:	eb09 0605 	add.w	r6, r9, r5
c0deacac:	6e70      	ldr	r0, [r6, #100]	@ 0x64
c0deacae:	f7fc fd77 	bl	c0de77a0 <nbgl_layoutRelease>
c0deacb2:	2002      	movs	r0, #2
c0deacb4:	f886 0068 	strb.w	r0, [r6, #104]	@ 0x68
c0deacb8:	6db0      	ldr	r0, [r6, #88]	@ 0x58
c0deacba:	6801      	ldr	r1, [r0, #0]
c0deacbc:	b331      	cbz	r1, c0dead0c <modalLayoutTouchCallback+0xa8>
c0deacbe:	2001      	movs	r0, #1
c0deacc0:	40a0      	lsls	r0, r4
c0deacc2:	e007      	b.n	c0deacd4 <modalLayoutTouchCallback+0x70>
c0deacc4:	eb09 0004 	add.w	r0, r9, r4
c0deacc8:	2101      	movs	r1, #1
c0deacca:	f880 1068 	strb.w	r1, [r0, #104]	@ 0x68
c0deacce:	6d81      	ldr	r1, [r0, #88]	@ 0x58
c0deacd0:	6808      	ldr	r0, [r1, #0]
c0deacd2:	b188      	cbz	r0, c0deacf8 <modalLayoutTouchCallback+0x94>
c0deacd4:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0deacd8:	f7ff bdfc 	b.w	c0dea8d4 <displaySecurityReport>
c0deacdc:	4816      	ldr	r0, [pc, #88]	@ (c0dead38 <modalLayoutTouchCallback+0xd4>)
c0deacde:	eb09 0400 	add.w	r4, r9, r0
c0deace2:	6ae0      	ldr	r0, [r4, #44]	@ 0x2c
c0deace4:	f7fc fd5c 	bl	c0de77a0 <nbgl_layoutRelease>
c0deace8:	2000      	movs	r0, #0
c0deacea:	62e0      	str	r0, [r4, #44]	@ 0x2c
c0deacec:	f000 ff4d 	bl	c0debb8a <nbgl_screenRedraw>
c0deacf0:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0deacf4:	f000 bf21 	b.w	c0debb3a <nbgl_refresh>
c0deacf8:	eb09 0004 	add.w	r0, r9, r4
c0deacfc:	2214      	movs	r2, #20
c0deacfe:	f890 0069 	ldrb.w	r0, [r0, #105]	@ 0x69
c0dead02:	2800      	cmp	r0, #0
c0dead04:	bf08      	it	eq
c0dead06:	2218      	moveq	r2, #24
c0dead08:	5888      	ldr	r0, [r1, r2]
c0dead0a:	e010      	b.n	c0dead2e <modalLayoutTouchCallback+0xca>
c0dead0c:	eb09 0105 	add.w	r1, r9, r5
c0dead10:	2214      	movs	r2, #20
c0dead12:	f891 1069 	ldrb.w	r1, [r1, #105]	@ 0x69
c0dead16:	2900      	cmp	r1, #0
c0dead18:	bf08      	it	eq
c0dead1a:	2218      	moveq	r2, #24
c0dead1c:	5880      	ldr	r0, [r0, r2]
c0dead1e:	7901      	ldrb	r1, [r0, #4]
c0dead20:	2902      	cmp	r1, #2
c0dead22:	bf18      	it	ne
c0dead24:	bd70      	popne	{r4, r5, r6, pc}
c0dead26:	6980      	ldr	r0, [r0, #24]
c0dead28:	212c      	movs	r1, #44	@ 0x2c
c0dead2a:	fb04 0001 	mla	r0, r4, r1, r0
c0dead2e:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0dead32:	f7ff bed9 	b.w	c0deaae8 <displayCustomizedSecurityReport>
c0dead36:	bf00      	nop
c0dead38:	000018fc 	.word	0x000018fc
c0dead3c:	00001a10 	.word	0x00001a10

c0dead40 <displayDetailsPage>:
c0dead40:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0dead44:	b09b      	sub	sp, #108	@ 0x6c
c0dead46:	f8df a160 	ldr.w	sl, [pc, #352]	@ c0deaea8 <displayDetailsPage+0x168>
c0dead4a:	4604      	mov	r4, r0
c0dead4c:	f88d 004c 	strb.w	r0, [sp, #76]	@ 0x4c
c0dead50:	2000      	movs	r0, #0
c0dead52:	460e      	mov	r6, r1
c0dead54:	4953      	ldr	r1, [pc, #332]	@ (c0deaea4 <displayDetailsPage+0x164>)
c0dead56:	9018      	str	r0, [sp, #96]	@ 0x60
c0dead58:	f88d 0058 	strb.w	r0, [sp, #88]	@ 0x58
c0dead5c:	9015      	str	r0, [sp, #84]	@ 0x54
c0dead5e:	f44f 6010 	mov.w	r0, #2304	@ 0x900
c0dead62:	eb09 050a 	add.w	r5, r9, sl
c0dead66:	f8ad 0050 	strh.w	r0, [sp, #80]	@ 0x50
c0dead6a:	f44f 7081 	mov.w	r0, #258	@ 0x102
c0dead6e:	9117      	str	r1, [sp, #92]	@ 0x5c
c0dead70:	2140      	movs	r1, #64	@ 0x40
c0dead72:	f895 8030 	ldrb.w	r8, [r5, #48]	@ 0x30
c0dead76:	f8ad 004e 	strh.w	r0, [sp, #78]	@ 0x4e
c0dead7a:	f88d 804d 	strb.w	r8, [sp, #77]	@ 0x4d
c0dead7e:	a803      	add	r0, sp, #12
c0dead80:	f001 fb1a 	bl	c0dec3b8 <__aeabi_memclr>
c0dead84:	2001      	movs	r0, #1
c0dead86:	f88d 0028 	strb.w	r0, [sp, #40]	@ 0x28
c0dead8a:	f88d 0024 	strb.w	r0, [sp, #36]	@ 0x24
c0dead8e:	f105 0040 	add.w	r0, r5, #64	@ 0x40
c0dead92:	9007      	str	r0, [sp, #28]
c0dead94:	2004      	movs	r0, #4
c0dead96:	f88d 0018 	strb.w	r0, [sp, #24]
c0dead9a:	f895 0033 	ldrb.w	r0, [r5, #51]	@ 0x33
c0dead9e:	f88d 0029 	strb.w	r0, [sp, #41]	@ 0x29
c0deada2:	6a28      	ldr	r0, [r5, #32]
c0deada4:	b108      	cbz	r0, c0deadaa <displayDetailsPage+0x6a>
c0deada6:	f7fd fe06 	bl	c0de89b6 <nbgl_pageRelease>
c0deadaa:	eb09 000a 	add.w	r0, r9, sl
c0deadae:	6b41      	ldr	r1, [r0, #52]	@ 0x34
c0deadb0:	6401      	str	r1, [r0, #64]	@ 0x40
c0deadb2:	f890 0031 	ldrb.w	r0, [r0, #49]	@ 0x31
c0deadb6:	42a0      	cmp	r0, r4
c0deadb8:	d207      	bcs.n	c0deadca <displayDetailsPage+0x8a>
c0deadba:	2501      	movs	r5, #1
c0deadbc:	eb09 000a 	add.w	r0, r9, sl
c0deadc0:	2e00      	cmp	r6, #0
c0deadc2:	bf18      	it	ne
c0deadc4:	2502      	movne	r5, #2
c0deadc6:	6bc6      	ldr	r6, [r0, #60]	@ 0x3c
c0deadc8:	e022      	b.n	c0deae10 <displayDetailsPage+0xd0>
c0deadca:	eb09 000a 	add.w	r0, r9, sl
c0deadce:	2500      	movs	r5, #0
c0deadd0:	f10d 076a 	add.w	r7, sp, #106	@ 0x6a
c0deadd4:	6b86      	ldr	r6, [r0, #56]	@ 0x38
c0deadd6:	42a5      	cmp	r5, r4
c0deadd8:	d219      	bcs.n	c0deae0e <displayDetailsPage+0xce>
c0deadda:	200c      	movs	r0, #12
c0deaddc:	4631      	mov	r1, r6
c0deadde:	f000 fa1f 	bl	c0deb220 <OUTLINED_FUNCTION_11>
c0deade2:	280c      	cmp	r0, #12
c0deade4:	d311      	bcc.n	c0deae0a <displayDetailsPage+0xca>
c0deade6:	eb09 000a 	add.w	r0, r9, sl
c0deadea:	4631      	mov	r1, r6
c0deadec:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0deadf0:	230b      	movs	r3, #11
c0deadf2:	f890 0033 	ldrb.w	r0, [r0, #51]	@ 0x33
c0deadf6:	e9cd 7000 	strd	r7, r0, [sp]
c0deadfa:	200c      	movs	r0, #12
c0deadfc:	f000 ff01 	bl	c0debc02 <nbgl_getTextMaxLenInNbLines>
c0deae00:	f8bd 006a 	ldrh.w	r0, [sp, #106]	@ 0x6a
c0deae04:	3803      	subs	r0, #3
c0deae06:	b280      	uxth	r0, r0
c0deae08:	4406      	add	r6, r0
c0deae0a:	3501      	adds	r5, #1
c0deae0c:	e7e3      	b.n	c0deadd6 <displayDetailsPage+0x96>
c0deae0e:	2502      	movs	r5, #2
c0deae10:	eb09 000a 	add.w	r0, r9, sl
c0deae14:	4631      	mov	r1, r6
c0deae16:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0deae1a:	f890 3033 	ldrb.w	r3, [r0, #51]	@ 0x33
c0deae1e:	f880 4031 	strb.w	r4, [r0, #49]	@ 0x31
c0deae22:	6446      	str	r6, [r0, #68]	@ 0x44
c0deae24:	200c      	movs	r0, #12
c0deae26:	f000 fee2 	bl	c0debbee <nbgl_getTextNbLinesInWidth>
c0deae2a:	280c      	cmp	r0, #12
c0deae2c:	d31e      	bcc.n	c0deae6c <displayDetailsPage+0x12c>
c0deae2e:	eb09 040a 	add.w	r4, r9, sl
c0deae32:	f10d 026a 	add.w	r2, sp, #106	@ 0x6a
c0deae36:	230b      	movs	r3, #11
c0deae38:	260b      	movs	r6, #11
c0deae3a:	f894 0033 	ldrb.w	r0, [r4, #51]	@ 0x33
c0deae3e:	6c61      	ldr	r1, [r4, #68]	@ 0x44
c0deae40:	e9cd 2000 	strd	r2, r0, [sp]
c0deae44:	200c      	movs	r0, #12
c0deae46:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0deae4a:	f000 feda 	bl	c0debc02 <nbgl_getTextMaxLenInNbLines>
c0deae4e:	f8bd 106a 	ldrh.w	r1, [sp, #106]	@ 0x6a
c0deae52:	6c60      	ldr	r0, [r4, #68]	@ 0x44
c0deae54:	1eca      	subs	r2, r1, #3
c0deae56:	4401      	add	r1, r0
c0deae58:	f811 3b01 	ldrb.w	r3, [r1], #1
c0deae5c:	b292      	uxth	r2, r2
c0deae5e:	2b0a      	cmp	r3, #10
c0deae60:	bf18      	it	ne
c0deae62:	1881      	addne	r1, r0, r2
c0deae64:	63e1      	str	r1, [r4, #60]	@ 0x3c
c0deae66:	f88d 6026 	strb.w	r6, [sp, #38]	@ 0x26
c0deae6a:	e005      	b.n	c0deae78 <displayDetailsPage+0x138>
c0deae6c:	2100      	movs	r1, #0
c0deae6e:	eb09 000a 	add.w	r0, r9, sl
c0deae72:	63c1      	str	r1, [r0, #60]	@ 0x3c
c0deae74:	f88d 1026 	strb.w	r1, [sp, #38]	@ 0x26
c0deae78:	f1b8 0f01 	cmp.w	r8, #1
c0deae7c:	d102      	bne.n	c0deae84 <displayDetailsPage+0x144>
c0deae7e:	480b      	ldr	r0, [pc, #44]	@ (c0deaeac <displayDetailsPage+0x16c>)
c0deae80:	4478      	add	r0, pc
c0deae82:	9018      	str	r0, [sp, #96]	@ 0x60
c0deae84:	480a      	ldr	r0, [pc, #40]	@ (c0deaeb0 <displayDetailsPage+0x170>)
c0deae86:	a913      	add	r1, sp, #76	@ 0x4c
c0deae88:	aa03      	add	r2, sp, #12
c0deae8a:	2301      	movs	r3, #1
c0deae8c:	4478      	add	r0, pc
c0deae8e:	f7fd fb69 	bl	c0de8564 <nbgl_pageDrawGenericContentExt>
c0deae92:	eb09 010a 	add.w	r1, r9, sl
c0deae96:	6208      	str	r0, [r1, #32]
c0deae98:	4628      	mov	r0, r5
c0deae9a:	f000 fe53 	bl	c0debb44 <nbgl_refreshSpecial>
c0deae9e:	b01b      	add	sp, #108	@ 0x6c
c0deaea0:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0deaea4:	03000101 	.word	0x03000101
c0deaea8:	00001bc8 	.word	0x00001bc8
c0deaeac:	00002cec 	.word	0x00002cec
c0deaeb0:	ffffed25 	.word	0xffffed25

c0deaeb4 <displayTagValueListModalPage>:
c0deaeb4:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0deaeb8:	b098      	sub	sp, #96	@ 0x60
c0deaeba:	4e44      	ldr	r6, [pc, #272]	@ (c0deafcc <displayTagValueListModalPage+0x118>)
c0deaebc:	4605      	mov	r5, r0
c0deaebe:	f88d 0044 	strb.w	r0, [sp, #68]	@ 0x44
c0deaec2:	2000      	movs	r0, #0
c0deaec4:	4688      	mov	r8, r1
c0deaec6:	4940      	ldr	r1, [pc, #256]	@ (c0deafc8 <displayTagValueListModalPage+0x114>)
c0deaec8:	9016      	str	r0, [sp, #88]	@ 0x58
c0deaeca:	f88d 0050 	strb.w	r0, [sp, #80]	@ 0x50
c0deaece:	9013      	str	r0, [sp, #76]	@ 0x4c
c0deaed0:	f44f 6010 	mov.w	r0, #2304	@ 0x900
c0deaed4:	eb09 0406 	add.w	r4, r9, r6
c0deaed8:	f8ad 0048 	strh.w	r0, [sp, #72]	@ 0x48
c0deaedc:	f44f 7081 	mov.w	r0, #258	@ 0x102
c0deaee0:	9115      	str	r1, [sp, #84]	@ 0x54
c0deaee2:	2140      	movs	r1, #64	@ 0x40
c0deaee4:	f894 7030 	ldrb.w	r7, [r4, #48]	@ 0x30
c0deaee8:	f8ad 0046 	strh.w	r0, [sp, #70]	@ 0x46
c0deaeec:	f88d 7045 	strb.w	r7, [sp, #69]	@ 0x45
c0deaef0:	a801      	add	r0, sp, #4
c0deaef2:	f001 fa61 	bl	c0dec3b8 <__aeabi_memclr>
c0deaef6:	2001      	movs	r0, #1
c0deaef8:	f894 1031 	ldrb.w	r1, [r4, #49]	@ 0x31
c0deaefc:	f894 2033 	ldrb.w	r2, [r4, #51]	@ 0x33
c0deaf00:	f88d 0020 	strb.w	r0, [sp, #32]
c0deaf04:	2004      	movs	r0, #4
c0deaf06:	42a9      	cmp	r1, r5
c0deaf08:	f88d 0010 	strb.w	r0, [sp, #16]
c0deaf0c:	f88d 2021 	strb.w	r2, [sp, #33]	@ 0x21
c0deaf10:	d91b      	bls.n	c0deaf4a <displayTagValueListModalPage+0x96>
c0deaf12:	1c69      	adds	r1, r5, #1
c0deaf14:	eb09 0306 	add.w	r3, r9, r6
c0deaf18:	ea00 0281 	and.w	r2, r0, r1, lsl #2
c0deaf1c:	b2c9      	uxtb	r1, r1
c0deaf1e:	f103 0450 	add.w	r4, r3, #80	@ 0x50
c0deaf22:	ea00 0085 	and.w	r0, r0, r5, lsl #2
c0deaf26:	0849      	lsrs	r1, r1, #1
c0deaf28:	5c61      	ldrb	r1, [r4, r1]
c0deaf2a:	40d1      	lsrs	r1, r2
c0deaf2c:	f893 2032 	ldrb.w	r2, [r3, #50]	@ 0x32
c0deaf30:	f001 0107 	and.w	r1, r1, #7
c0deaf34:	1a52      	subs	r2, r2, r1
c0deaf36:	0869      	lsrs	r1, r5, #1
c0deaf38:	5c61      	ldrb	r1, [r4, r1]
c0deaf3a:	f883 2032 	strb.w	r2, [r3, #50]	@ 0x32
c0deaf3e:	fa21 f000 	lsr.w	r0, r1, r0
c0deaf42:	f000 0107 	and.w	r1, r0, #7
c0deaf46:	1a50      	subs	r0, r2, r1
c0deaf48:	e00d      	b.n	c0deaf66 <displayTagValueListModalPage+0xb2>
c0deaf4a:	eb09 0206 	add.w	r2, r9, r6
c0deaf4e:	ea00 0085 	and.w	r0, r0, r5, lsl #2
c0deaf52:	eb02 0155 	add.w	r1, r2, r5, lsr #1
c0deaf56:	f891 1050 	ldrb.w	r1, [r1, #80]	@ 0x50
c0deaf5a:	fa21 f000 	lsr.w	r0, r1, r0
c0deaf5e:	f000 0107 	and.w	r1, r0, #7
c0deaf62:	f892 0032 	ldrb.w	r0, [r2, #50]	@ 0x32
c0deaf66:	4b1a      	ldr	r3, [pc, #104]	@ (c0deafd0 <displayTagValueListModalPage+0x11c>)
c0deaf68:	eb09 0206 	add.w	r2, r9, r6
c0deaf6c:	2f01      	cmp	r7, #1
c0deaf6e:	f882 5031 	strb.w	r5, [r2, #49]	@ 0x31
c0deaf72:	444b      	add	r3, r9
c0deaf74:	6b9b      	ldr	r3, [r3, #56]	@ 0x38
c0deaf76:	681b      	ldr	r3, [r3, #0]
c0deaf78:	f88d 101c 	strb.w	r1, [sp, #28]
c0deaf7c:	4401      	add	r1, r0
c0deaf7e:	b2c0      	uxtb	r0, r0
c0deaf80:	f882 1032 	strb.w	r1, [r2, #50]	@ 0x32
c0deaf84:	eb03 1000 	add.w	r0, r3, r0, lsl #4
c0deaf88:	9005      	str	r0, [sp, #20]
c0deaf8a:	d102      	bne.n	c0deaf92 <displayTagValueListModalPage+0xde>
c0deaf8c:	4811      	ldr	r0, [pc, #68]	@ (c0deafd4 <displayTagValueListModalPage+0x120>)
c0deaf8e:	4478      	add	r0, pc
c0deaf90:	9016      	str	r0, [sp, #88]	@ 0x58
c0deaf92:	eb09 0006 	add.w	r0, r9, r6
c0deaf96:	6a00      	ldr	r0, [r0, #32]
c0deaf98:	b108      	cbz	r0, c0deaf9e <displayTagValueListModalPage+0xea>
c0deaf9a:	f7fd fd0c 	bl	c0de89b6 <nbgl_pageRelease>
c0deaf9e:	480e      	ldr	r0, [pc, #56]	@ (c0deafd8 <displayTagValueListModalPage+0x124>)
c0deafa0:	a911      	add	r1, sp, #68	@ 0x44
c0deafa2:	aa01      	add	r2, sp, #4
c0deafa4:	2301      	movs	r3, #1
c0deafa6:	2501      	movs	r5, #1
c0deafa8:	4478      	add	r0, pc
c0deafaa:	f7fd fadb 	bl	c0de8564 <nbgl_pageDrawGenericContentExt>
c0deafae:	eb09 0106 	add.w	r1, r9, r6
c0deafb2:	f1b8 0f00 	cmp.w	r8, #0
c0deafb6:	6208      	str	r0, [r1, #32]
c0deafb8:	bf18      	it	ne
c0deafba:	2502      	movne	r5, #2
c0deafbc:	4628      	mov	r0, r5
c0deafbe:	f000 fdc1 	bl	c0debb44 <nbgl_refreshSpecial>
c0deafc2:	b018      	add	sp, #96	@ 0x60
c0deafc4:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0deafc8:	04000101 	.word	0x04000101
c0deafcc:	00001bc8 	.word	0x00001bc8
c0deafd0:	000018fc 	.word	0x000018fc
c0deafd4:	00002bde 	.word	0x00002bde
c0deafd8:	ffffec09 	.word	0xffffec09

c0deafdc <bundleNavReviewChoice>:
c0deafdc:	b120      	cbz	r0, c0deafe8 <bundleNavReviewChoice+0xc>
c0deafde:	4806      	ldr	r0, [pc, #24]	@ (c0deaff8 <bundleNavReviewChoice+0x1c>)
c0deafe0:	4448      	add	r0, r9
c0deafe2:	6a41      	ldr	r1, [r0, #36]	@ 0x24
c0deafe4:	2001      	movs	r0, #1
c0deafe6:	4708      	bx	r1
c0deafe8:	4803      	ldr	r0, [pc, #12]	@ (c0deaff8 <bundleNavReviewChoice+0x1c>)
c0deafea:	4448      	add	r0, r9
c0deafec:	6a00      	ldr	r0, [r0, #32]
c0deafee:	4903      	ldr	r1, [pc, #12]	@ (c0deaffc <bundleNavReviewChoice+0x20>)
c0deaff0:	4479      	add	r1, pc
c0deaff2:	f000 b863 	b.w	c0deb0bc <bundleNavReviewAskRejectionConfirmation>
c0deaff6:	bf00      	nop
c0deaff8:	00001c44 	.word	0x00001c44
c0deaffc:	0000011d 	.word	0x0000011d

c0deb000 <initWarningTipBox>:
c0deb000:	4923      	ldr	r1, [pc, #140]	@ (c0deb090 <initWarningTipBox+0x90>)
c0deb002:	eb09 0201 	add.w	r2, r9, r1
c0deb006:	6d92      	ldr	r2, [r2, #88]	@ 0x58
c0deb008:	b15a      	cbz	r2, c0deb022 <initWarningTipBox+0x22>
c0deb00a:	6812      	ldr	r2, [r2, #0]
c0deb00c:	07d3      	lsls	r3, r2, #31
c0deb00e:	d111      	bne.n	c0deb034 <initWarningTipBox+0x34>
c0deb010:	0753      	lsls	r3, r2, #29
c0deb012:	d415      	bmi.n	c0deb040 <initWarningTipBox+0x40>
c0deb014:	0793      	lsls	r3, r2, #30
c0deb016:	d419      	bmi.n	c0deb04c <initWarningTipBox+0x4c>
c0deb018:	f002 0310 	and.w	r3, r2, #16
c0deb01c:	0712      	lsls	r2, r2, #28
c0deb01e:	d42c      	bmi.n	c0deb07a <initWarningTipBox+0x7a>
c0deb020:	bb9b      	cbnz	r3, c0deb08a <initWarningTipBox+0x8a>
c0deb022:	b348      	cbz	r0, c0deb078 <initWarningTipBox+0x78>
c0deb024:	491b      	ldr	r1, [pc, #108]	@ (c0deb094 <initWarningTipBox+0x94>)
c0deb026:	2200      	movs	r2, #0
c0deb028:	4449      	add	r1, r9
c0deb02a:	620a      	str	r2, [r1, #32]
c0deb02c:	6842      	ldr	r2, [r0, #4]
c0deb02e:	62ca      	str	r2, [r1, #44]	@ 0x2c
c0deb030:	6800      	ldr	r0, [r0, #0]
c0deb032:	e01b      	b.n	c0deb06c <initWarningTipBox+0x6c>
c0deb034:	06d0      	lsls	r0, r2, #27
c0deb036:	4a18      	ldr	r2, [pc, #96]	@ (c0deb098 <initWarningTipBox+0x98>)
c0deb038:	4818      	ldr	r0, [pc, #96]	@ (c0deb09c <initWarningTipBox+0x9c>)
c0deb03a:	447a      	add	r2, pc
c0deb03c:	4478      	add	r0, pc
c0deb03e:	e00a      	b.n	c0deb056 <initWarningTipBox+0x56>
c0deb040:	06d0      	lsls	r0, r2, #27
c0deb042:	4a17      	ldr	r2, [pc, #92]	@ (c0deb0a0 <initWarningTipBox+0xa0>)
c0deb044:	4817      	ldr	r0, [pc, #92]	@ (c0deb0a4 <initWarningTipBox+0xa4>)
c0deb046:	447a      	add	r2, pc
c0deb048:	4478      	add	r0, pc
c0deb04a:	e004      	b.n	c0deb056 <initWarningTipBox+0x56>
c0deb04c:	06d0      	lsls	r0, r2, #27
c0deb04e:	4a16      	ldr	r2, [pc, #88]	@ (c0deb0a8 <initWarningTipBox+0xa8>)
c0deb050:	4816      	ldr	r0, [pc, #88]	@ (c0deb0ac <initWarningTipBox+0xac>)
c0deb052:	447a      	add	r2, pc
c0deb054:	4478      	add	r0, pc
c0deb056:	bf58      	it	pl
c0deb058:	4610      	movpl	r0, r2
c0deb05a:	4449      	add	r1, r9
c0deb05c:	2201      	movs	r2, #1
c0deb05e:	f881 2021 	strb.w	r2, [r1, #33]	@ 0x21
c0deb062:	490c      	ldr	r1, [pc, #48]	@ (c0deb094 <initWarningTipBox+0x94>)
c0deb064:	2200      	movs	r2, #0
c0deb066:	4449      	add	r1, r9
c0deb068:	620a      	str	r2, [r1, #32]
c0deb06a:	62ca      	str	r2, [r1, #44]	@ 0x2c
c0deb06c:	4909      	ldr	r1, [pc, #36]	@ (c0deb094 <initWarningTipBox+0x94>)
c0deb06e:	f640 1212 	movw	r2, #2322	@ 0x912
c0deb072:	4449      	add	r1, r9
c0deb074:	860a      	strh	r2, [r1, #48]	@ 0x30
c0deb076:	6288      	str	r0, [r1, #40]	@ 0x28
c0deb078:	4770      	bx	lr
c0deb07a:	4a0d      	ldr	r2, [pc, #52]	@ (c0deb0b0 <initWarningTipBox+0xb0>)
c0deb07c:	480d      	ldr	r0, [pc, #52]	@ (c0deb0b4 <initWarningTipBox+0xb4>)
c0deb07e:	2b00      	cmp	r3, #0
c0deb080:	4478      	add	r0, pc
c0deb082:	447a      	add	r2, pc
c0deb084:	bf08      	it	eq
c0deb086:	4610      	moveq	r0, r2
c0deb088:	e7e7      	b.n	c0deb05a <initWarningTipBox+0x5a>
c0deb08a:	480b      	ldr	r0, [pc, #44]	@ (c0deb0b8 <initWarningTipBox+0xb8>)
c0deb08c:	4478      	add	r0, pc
c0deb08e:	e7e4      	b.n	c0deb05a <initWarningTipBox+0x5a>
c0deb090:	000018fc 	.word	0x000018fc
c0deb094:	00001968 	.word	0x00001968
c0deb098:	000028bc 	.word	0x000028bc
c0deb09c:	000029a2 	.word	0x000029a2
c0deb0a0:	00003066 	.word	0x00003066
c0deb0a4:	0000292b 	.word	0x0000292b
c0deb0a8:	00003098 	.word	0x00003098
c0deb0ac:	00002e07 	.word	0x00002e07
c0deb0b0:	00002e10 	.word	0x00002e10
c0deb0b4:	00003083 	.word	0x00003083
c0deb0b8:	00002cc5 	.word	0x00002cc5

c0deb0bc <bundleNavReviewAskRejectionConfirmation>:
c0deb0bc:	f020 00f0 	bic.w	r0, r0, #240	@ 0xf0
c0deb0c0:	b130      	cbz	r0, c0deb0d0 <bundleNavReviewAskRejectionConfirmation+0x14>
c0deb0c2:	2801      	cmp	r0, #1
c0deb0c4:	d109      	bne.n	c0deb0da <bundleNavReviewAskRejectionConfirmation+0x1e>
c0deb0c6:	4b0d      	ldr	r3, [pc, #52]	@ (c0deb0fc <bundleNavReviewAskRejectionConfirmation+0x40>)
c0deb0c8:	480d      	ldr	r0, [pc, #52]	@ (c0deb100 <bundleNavReviewAskRejectionConfirmation+0x44>)
c0deb0ca:	447b      	add	r3, pc
c0deb0cc:	4478      	add	r0, pc
c0deb0ce:	e008      	b.n	c0deb0e2 <bundleNavReviewAskRejectionConfirmation+0x26>
c0deb0d0:	4b08      	ldr	r3, [pc, #32]	@ (c0deb0f4 <bundleNavReviewAskRejectionConfirmation+0x38>)
c0deb0d2:	4809      	ldr	r0, [pc, #36]	@ (c0deb0f8 <bundleNavReviewAskRejectionConfirmation+0x3c>)
c0deb0d4:	447b      	add	r3, pc
c0deb0d6:	4478      	add	r0, pc
c0deb0d8:	e003      	b.n	c0deb0e2 <bundleNavReviewAskRejectionConfirmation+0x26>
c0deb0da:	4b0a      	ldr	r3, [pc, #40]	@ (c0deb104 <bundleNavReviewAskRejectionConfirmation+0x48>)
c0deb0dc:	480a      	ldr	r0, [pc, #40]	@ (c0deb108 <bundleNavReviewAskRejectionConfirmation+0x4c>)
c0deb0de:	447b      	add	r3, pc
c0deb0e0:	4478      	add	r0, pc
c0deb0e2:	b5e0      	push	{r5, r6, r7, lr}
c0deb0e4:	9100      	str	r1, [sp, #0]
c0deb0e6:	2100      	movs	r1, #0
c0deb0e8:	4a08      	ldr	r2, [pc, #32]	@ (c0deb10c <bundleNavReviewAskRejectionConfirmation+0x50>)
c0deb0ea:	447a      	add	r2, pc
c0deb0ec:	f7fe fd38 	bl	c0de9b60 <nbgl_useCaseConfirm>
c0deb0f0:	bd8c      	pop	{r2, r3, r7, pc}
c0deb0f2:	bf00      	nop
c0deb0f4:	00002a56 	.word	0x00002a56
c0deb0f8:	00002889 	.word	0x00002889
c0deb0fc:	00002d7e 	.word	0x00002d7e
c0deb100:	00003156 	.word	0x00003156
c0deb104:	000028eb 	.word	0x000028eb
c0deb108:	00002e00 	.word	0x00002e00
c0deb10c:	00002bd5 	.word	0x00002bd5

c0deb110 <bundleNavReviewConfirmRejection>:
c0deb110:	4801      	ldr	r0, [pc, #4]	@ (c0deb118 <bundleNavReviewConfirmRejection+0x8>)
c0deb112:	f000 b881 	b.w	c0deb218 <OUTLINED_FUNCTION_9>
c0deb116:	bf00      	nop
c0deb118:	00001c44 	.word	0x00001c44

c0deb11c <layoutTouchCallback>:
c0deb11c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0deb11e:	b087      	sub	sp, #28
c0deb120:	2811      	cmp	r0, #17
c0deb122:	d017      	beq.n	c0deb154 <layoutTouchCallback+0x38>
c0deb124:	2814      	cmp	r0, #20
c0deb126:	d142      	bne.n	c0deb1ae <layoutTouchCallback+0x92>
c0deb128:	b1e9      	cbz	r1, c0deb166 <layoutTouchCallback+0x4a>
c0deb12a:	4922      	ldr	r1, [pc, #136]	@ (c0deb1b4 <layoutTouchCallback+0x98>)
c0deb12c:	2400      	movs	r4, #0
c0deb12e:	eb09 0201 	add.w	r2, r9, r1
c0deb132:	eb09 0501 	add.w	r5, r9, r1
c0deb136:	f882 4069 	strb.w	r4, [r2, #105]	@ 0x69
c0deb13a:	6c10      	ldr	r0, [r2, #64]	@ 0x40
c0deb13c:	f892 203c 	ldrb.w	r2, [r2, #60]	@ 0x3c
c0deb140:	b33a      	cbz	r2, c0deb192 <layoutTouchCallback+0x76>
c0deb142:	f105 0348 	add.w	r3, r5, #72	@ 0x48
c0deb146:	6ded      	ldr	r5, [r5, #92]	@ 0x5c
c0deb148:	cb0e      	ldmia	r3, {r1, r2, r3}
c0deb14a:	e9cd 5400 	strd	r5, r4, [sp]
c0deb14e:	f7fe fff5 	bl	c0dea13c <useCaseReviewStreamingStart>
c0deb152:	e02c      	b.n	c0deb1ae <layoutTouchCallback+0x92>
c0deb154:	4a17      	ldr	r2, [pc, #92]	@ (c0deb1b4 <layoutTouchCallback+0x98>)
c0deb156:	f000 f84a 	bl	c0deb1ee <OUTLINED_FUNCTION_4>
c0deb15a:	d00c      	beq.n	c0deb176 <layoutTouchCallback+0x5a>
c0deb15c:	b007      	add	sp, #28
c0deb15e:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0deb162:	f7ff bbb7 	b.w	c0dea8d4 <displaySecurityReport>
c0deb166:	4813      	ldr	r0, [pc, #76]	@ (c0deb1b4 <layoutTouchCallback+0x98>)
c0deb168:	4448      	add	r0, r9
c0deb16a:	6dc1      	ldr	r1, [r0, #92]	@ 0x5c
c0deb16c:	2000      	movs	r0, #0
c0deb16e:	b007      	add	sp, #28
c0deb170:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0deb174:	4708      	bx	r1
c0deb176:	eb09 0002 	add.w	r0, r9, r2
c0deb17a:	2214      	movs	r2, #20
c0deb17c:	f890 0069 	ldrb.w	r0, [r0, #105]	@ 0x69
c0deb180:	2800      	cmp	r0, #0
c0deb182:	bf08      	it	eq
c0deb184:	2218      	moveq	r2, #24
c0deb186:	5888      	ldr	r0, [r1, r2]
c0deb188:	b007      	add	sp, #28
c0deb18a:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0deb18e:	f7ff bcab 	b.w	c0deaae8 <displayCustomizedSecurityReport>
c0deb192:	f105 0744 	add.w	r7, r5, #68	@ 0x44
c0deb196:	6ded      	ldr	r5, [r5, #92]	@ 0x5c
c0deb198:	cfce      	ldmia	r7, {r1, r2, r3, r6, r7}
c0deb19a:	9405      	str	r4, [sp, #20]
c0deb19c:	e9cd 6700 	strd	r6, r7, [sp]
c0deb1a0:	e9cd 5403 	strd	r5, r4, [sp, #12]
c0deb1a4:	4c04      	ldr	r4, [pc, #16]	@ (c0deb1b8 <layoutTouchCallback+0x9c>)
c0deb1a6:	444c      	add	r4, r9
c0deb1a8:	9402      	str	r4, [sp, #8]
c0deb1aa:	f7fe fddf 	bl	c0de9d6c <useCaseReview>
c0deb1ae:	b007      	add	sp, #28
c0deb1b0:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0deb1b2:	bf00      	nop
c0deb1b4:	000018fc 	.word	0x000018fc
c0deb1b8:	00001c44 	.word	0x00001c44

c0deb1bc <bundleNavReviewStreamingConfirmRejection>:
c0deb1bc:	4801      	ldr	r0, [pc, #4]	@ (c0deb1c4 <bundleNavReviewStreamingConfirmRejection+0x8>)
c0deb1be:	f000 b82b 	b.w	c0deb218 <OUTLINED_FUNCTION_9>
c0deb1c2:	bf00      	nop
c0deb1c4:	00001c44 	.word	0x00001c44

c0deb1c8 <OUTLINED_FUNCTION_0>:
c0deb1c8:	4615      	mov	r5, r2
c0deb1ca:	460e      	mov	r6, r1
c0deb1cc:	4607      	mov	r7, r0
c0deb1ce:	f7fd be0d 	b.w	c0de8dec <reset_callbacks_and_context>

c0deb1d2 <OUTLINED_FUNCTION_1>:
c0deb1d2:	f8da 0004 	ldr.w	r0, [sl, #4]
c0deb1d6:	eb00 0086 	add.w	r0, r0, r6, lsl #2
c0deb1da:	f000 becb 	b.w	c0debf74 <pic>

c0deb1de <OUTLINED_FUNCTION_2>:
c0deb1de:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0deb1e2:	2301      	movs	r3, #1
c0deb1e4:	f000 bcfe 	b.w	c0debbe4 <nbgl_getTextHeightInWidth>

c0deb1e8 <OUTLINED_FUNCTION_3>:
c0deb1e8:	2001      	movs	r0, #1
c0deb1ea:	f000 bcab 	b.w	c0debb44 <nbgl_refreshSpecial>

c0deb1ee <OUTLINED_FUNCTION_4>:
c0deb1ee:	2101      	movs	r1, #1
c0deb1f0:	eb09 0002 	add.w	r0, r9, r2
c0deb1f4:	f880 1068 	strb.w	r1, [r0, #104]	@ 0x68
c0deb1f8:	6d81      	ldr	r1, [r0, #88]	@ 0x58
c0deb1fa:	6808      	ldr	r0, [r1, #0]
c0deb1fc:	2800      	cmp	r0, #0
c0deb1fe:	4770      	bx	lr

c0deb200 <OUTLINED_FUNCTION_5>:
c0deb200:	2000      	movs	r0, #0
c0deb202:	f7fd bed1 	b.w	c0de8fa8 <getNbPagesForGenericContents>

c0deb206 <OUTLINED_FUNCTION_6>:
c0deb206:	2008      	movs	r0, #8
c0deb208:	f7f8 be9a 	b.w	c0de3f40 <os_io_seph_cmd_piezo_play_tune>

c0deb20c <OUTLINED_FUNCTION_7>:
c0deb20c:	9001      	str	r0, [sp, #4]
c0deb20e:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0deb210:	9000      	str	r0, [sp, #0]
c0deb212:	4638      	mov	r0, r7
c0deb214:	f7fe bdaa 	b.w	c0de9d6c <useCaseReview>

c0deb218 <OUTLINED_FUNCTION_9>:
c0deb218:	4448      	add	r0, r9
c0deb21a:	6a41      	ldr	r1, [r0, #36]	@ 0x24
c0deb21c:	2000      	movs	r0, #0
c0deb21e:	4708      	bx	r1

c0deb220 <OUTLINED_FUNCTION_11>:
c0deb220:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0deb224:	2300      	movs	r3, #0
c0deb226:	f000 bce2 	b.w	c0debbee <nbgl_getTextNbLinesInWidth>

c0deb22a <OUTLINED_FUNCTION_12>:
c0deb22a:	200b      	movs	r0, #11
c0deb22c:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0deb230:	f000 bcd8 	b.w	c0debbe4 <nbgl_getTextHeightInWidth>

c0deb234 <OUTLINED_FUNCTION_13>:
c0deb234:	4630      	mov	r0, r6
c0deb236:	f001 b8bf 	b.w	c0dec3b8 <__aeabi_memclr>

c0deb23a <OUTLINED_FUNCTION_14>:
c0deb23a:	f10a 0004 	add.w	r0, sl, #4
c0deb23e:	f107 0110 	add.w	r1, r7, #16
c0deb242:	4770      	bx	lr

c0deb244 <bip32_path_read>:
c0deb244:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0deb248:	b10b      	cbz	r3, c0deb24e <bip32_path_read+0xa>
c0deb24a:	2b0a      	cmp	r3, #10
c0deb24c:	d902      	bls.n	c0deb254 <bip32_path_read+0x10>
c0deb24e:	2000      	movs	r0, #0
c0deb250:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0deb254:	4692      	mov	sl, r2
c0deb256:	460e      	mov	r6, r1
c0deb258:	4683      	mov	fp, r0
c0deb25a:	425f      	negs	r7, r3
c0deb25c:	2500      	movs	r5, #0
c0deb25e:	f04f 0800 	mov.w	r8, #0
c0deb262:	9301      	str	r3, [sp, #4]
c0deb264:	42af      	cmp	r7, r5
c0deb266:	d00c      	beq.n	c0deb282 <bip32_path_read+0x3e>
c0deb268:	f108 0404 	add.w	r4, r8, #4
c0deb26c:	42b4      	cmp	r4, r6
c0deb26e:	d808      	bhi.n	c0deb282 <bip32_path_read+0x3e>
c0deb270:	4658      	mov	r0, fp
c0deb272:	4641      	mov	r1, r8
c0deb274:	f000 faee 	bl	c0deb854 <read_u32_be>
c0deb278:	f84a 0008 	str.w	r0, [sl, r8]
c0deb27c:	3d01      	subs	r5, #1
c0deb27e:	46a0      	mov	r8, r4
c0deb280:	e7f0      	b.n	c0deb264 <bip32_path_read+0x20>
c0deb282:	9a01      	ldr	r2, [sp, #4]
c0deb284:	4269      	negs	r1, r5
c0deb286:	2000      	movs	r0, #0
c0deb288:	4291      	cmp	r1, r2
c0deb28a:	bf28      	it	cs
c0deb28c:	2001      	movcs	r0, #1
c0deb28e:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0deb292 <buffer_seek_cur>:
c0deb292:	6882      	ldr	r2, [r0, #8]
c0deb294:	1889      	adds	r1, r1, r2
c0deb296:	d205      	bcs.n	c0deb2a4 <buffer_seek_cur+0x12>
c0deb298:	6842      	ldr	r2, [r0, #4]
c0deb29a:	4291      	cmp	r1, r2
c0deb29c:	bf9e      	ittt	ls
c0deb29e:	6081      	strls	r1, [r0, #8]
c0deb2a0:	2001      	movls	r0, #1
c0deb2a2:	4770      	bxls	lr
c0deb2a4:	2000      	movs	r0, #0
c0deb2a6:	4770      	bx	lr

c0deb2a8 <buffer_read_u8>:
c0deb2a8:	b510      	push	{r4, lr}
c0deb2aa:	e9d0 2301 	ldrd	r2, r3, [r0, #4]
c0deb2ae:	429a      	cmp	r2, r3
c0deb2b0:	d00a      	beq.n	c0deb2c8 <buffer_read_u8+0x20>
c0deb2b2:	6804      	ldr	r4, [r0, #0]
c0deb2b4:	5ce4      	ldrb	r4, [r4, r3]
c0deb2b6:	700c      	strb	r4, [r1, #0]
c0deb2b8:	6881      	ldr	r1, [r0, #8]
c0deb2ba:	3101      	adds	r1, #1
c0deb2bc:	d206      	bcs.n	c0deb2cc <buffer_read_u8+0x24>
c0deb2be:	6844      	ldr	r4, [r0, #4]
c0deb2c0:	42a1      	cmp	r1, r4
c0deb2c2:	bf98      	it	ls
c0deb2c4:	6081      	strls	r1, [r0, #8]
c0deb2c6:	e001      	b.n	c0deb2cc <buffer_read_u8+0x24>
c0deb2c8:	2000      	movs	r0, #0
c0deb2ca:	7008      	strb	r0, [r1, #0]
c0deb2cc:	1ad0      	subs	r0, r2, r3
c0deb2ce:	bf18      	it	ne
c0deb2d0:	2001      	movne	r0, #1
c0deb2d2:	bd10      	pop	{r4, pc}

c0deb2d4 <buffer_read_u64>:
c0deb2d4:	b570      	push	{r4, r5, r6, lr}
c0deb2d6:	f000 f87d 	bl	c0deb3d4 <OUTLINED_FUNCTION_0>
c0deb2da:	2e07      	cmp	r6, #7
c0deb2dc:	d904      	bls.n	c0deb2e8 <buffer_read_u64+0x14>
c0deb2de:	6820      	ldr	r0, [r4, #0]
c0deb2e0:	b132      	cbz	r2, c0deb2f0 <buffer_read_u64+0x1c>
c0deb2e2:	f000 faee 	bl	c0deb8c2 <read_u64_le>
c0deb2e6:	e005      	b.n	c0deb2f4 <buffer_read_u64+0x20>
c0deb2e8:	2000      	movs	r0, #0
c0deb2ea:	e9c5 0000 	strd	r0, r0, [r5]
c0deb2ee:	e00c      	b.n	c0deb30a <buffer_read_u64+0x36>
c0deb2f0:	f000 fabc 	bl	c0deb86c <read_u64_be>
c0deb2f4:	e9c5 0100 	strd	r0, r1, [r5]
c0deb2f8:	68a0      	ldr	r0, [r4, #8]
c0deb2fa:	f110 0f09 	cmn.w	r0, #9
c0deb2fe:	d804      	bhi.n	c0deb30a <buffer_read_u64+0x36>
c0deb300:	6861      	ldr	r1, [r4, #4]
c0deb302:	3008      	adds	r0, #8
c0deb304:	4288      	cmp	r0, r1
c0deb306:	bf98      	it	ls
c0deb308:	60a0      	strls	r0, [r4, #8]
c0deb30a:	2000      	movs	r0, #0
c0deb30c:	2e07      	cmp	r6, #7
c0deb30e:	bf88      	it	hi
c0deb310:	2001      	movhi	r0, #1
c0deb312:	bd70      	pop	{r4, r5, r6, pc}

c0deb314 <buffer_read_varint>:
c0deb314:	b5b0      	push	{r4, r5, r7, lr}
c0deb316:	4604      	mov	r4, r0
c0deb318:	460d      	mov	r5, r1
c0deb31a:	6800      	ldr	r0, [r0, #0]
c0deb31c:	e9d4 1201 	ldrd	r1, r2, [r4, #4]
c0deb320:	4410      	add	r0, r2
c0deb322:	1a89      	subs	r1, r1, r2
c0deb324:	462a      	mov	r2, r5
c0deb326:	f000 fae3 	bl	c0deb8f0 <varint_read>
c0deb32a:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0deb32e:	dd0a      	ble.n	c0deb346 <buffer_read_varint+0x32>
c0deb330:	68a1      	ldr	r1, [r4, #8]
c0deb332:	1840      	adds	r0, r0, r1
c0deb334:	d205      	bcs.n	c0deb342 <buffer_read_varint+0x2e>
c0deb336:	6861      	ldr	r1, [r4, #4]
c0deb338:	4288      	cmp	r0, r1
c0deb33a:	bf9e      	ittt	ls
c0deb33c:	60a0      	strls	r0, [r4, #8]
c0deb33e:	2001      	movls	r0, #1
c0deb340:	bdb0      	popls	{r4, r5, r7, pc}
c0deb342:	2000      	movs	r0, #0
c0deb344:	bdb0      	pop	{r4, r5, r7, pc}
c0deb346:	2000      	movs	r0, #0
c0deb348:	e9c5 0000 	strd	r0, r0, [r5]
c0deb34c:	bdb0      	pop	{r4, r5, r7, pc}

c0deb34e <buffer_read_bip32_path>:
c0deb34e:	b5b0      	push	{r4, r5, r7, lr}
c0deb350:	4604      	mov	r4, r0
c0deb352:	4615      	mov	r5, r2
c0deb354:	460a      	mov	r2, r1
c0deb356:	6800      	ldr	r0, [r0, #0]
c0deb358:	e9d4 1301 	ldrd	r1, r3, [r4, #4]
c0deb35c:	4418      	add	r0, r3
c0deb35e:	1ac9      	subs	r1, r1, r3
c0deb360:	462b      	mov	r3, r5
c0deb362:	f7ff ff6f 	bl	c0deb244 <bip32_path_read>
c0deb366:	b140      	cbz	r0, c0deb37a <buffer_read_bip32_path+0x2c>
c0deb368:	68a2      	ldr	r2, [r4, #8]
c0deb36a:	eb02 0185 	add.w	r1, r2, r5, lsl #2
c0deb36e:	4291      	cmp	r1, r2
c0deb370:	d303      	bcc.n	c0deb37a <buffer_read_bip32_path+0x2c>
c0deb372:	6862      	ldr	r2, [r4, #4]
c0deb374:	4291      	cmp	r1, r2
c0deb376:	bf98      	it	ls
c0deb378:	60a1      	strls	r1, [r4, #8]
c0deb37a:	bdb0      	pop	{r4, r5, r7, pc}

c0deb37c <buffer_copy>:
c0deb37c:	b5b0      	push	{r4, r5, r7, lr}
c0deb37e:	4614      	mov	r4, r2
c0deb380:	e9d0 3201 	ldrd	r3, r2, [r0, #4]
c0deb384:	1a9d      	subs	r5, r3, r2
c0deb386:	42a5      	cmp	r5, r4
c0deb388:	d806      	bhi.n	c0deb398 <buffer_copy+0x1c>
c0deb38a:	6800      	ldr	r0, [r0, #0]
c0deb38c:	4402      	add	r2, r0
c0deb38e:	4608      	mov	r0, r1
c0deb390:	4611      	mov	r1, r2
c0deb392:	462a      	mov	r2, r5
c0deb394:	f001 f808 	bl	c0dec3a8 <__aeabi_memmove>
c0deb398:	2000      	movs	r0, #0
c0deb39a:	42a5      	cmp	r5, r4
c0deb39c:	bf98      	it	ls
c0deb39e:	2001      	movls	r0, #1
c0deb3a0:	bdb0      	pop	{r4, r5, r7, pc}

c0deb3a2 <buffer_move>:
c0deb3a2:	b5b0      	push	{r4, r5, r7, lr}
c0deb3a4:	4615      	mov	r5, r2
c0deb3a6:	4604      	mov	r4, r0
c0deb3a8:	e9d0 2001 	ldrd	r2, r0, [r0, #4]
c0deb3ac:	1a12      	subs	r2, r2, r0
c0deb3ae:	42aa      	cmp	r2, r5
c0deb3b0:	bf84      	itt	hi
c0deb3b2:	2000      	movhi	r0, #0
c0deb3b4:	bdb0      	pophi	{r4, r5, r7, pc}
c0deb3b6:	6823      	ldr	r3, [r4, #0]
c0deb3b8:	4403      	add	r3, r0
c0deb3ba:	4608      	mov	r0, r1
c0deb3bc:	4619      	mov	r1, r3
c0deb3be:	f000 fff3 	bl	c0dec3a8 <__aeabi_memmove>
c0deb3c2:	68a0      	ldr	r0, [r4, #8]
c0deb3c4:	1940      	adds	r0, r0, r5
c0deb3c6:	d203      	bcs.n	c0deb3d0 <buffer_move+0x2e>
c0deb3c8:	6861      	ldr	r1, [r4, #4]
c0deb3ca:	4288      	cmp	r0, r1
c0deb3cc:	bf98      	it	ls
c0deb3ce:	60a0      	strls	r0, [r4, #8]
c0deb3d0:	2001      	movs	r0, #1
c0deb3d2:	bdb0      	pop	{r4, r5, r7, pc}

c0deb3d4 <OUTLINED_FUNCTION_0>:
c0deb3d4:	4604      	mov	r4, r0
c0deb3d6:	460d      	mov	r5, r1
c0deb3d8:	6840      	ldr	r0, [r0, #4]
c0deb3da:	68a1      	ldr	r1, [r4, #8]
c0deb3dc:	1a46      	subs	r6, r0, r1
c0deb3de:	4770      	bx	lr

c0deb3e0 <bip32_derive_with_seed_init_privkey_256>:
c0deb3e0:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0deb3e4:	b095      	sub	sp, #84	@ 0x54
c0deb3e6:	460d      	mov	r5, r1
c0deb3e8:	4607      	mov	r7, r0
c0deb3ea:	a904      	add	r1, sp, #16
c0deb3ec:	469a      	mov	sl, r3
c0deb3ee:	4614      	mov	r4, r2
c0deb3f0:	4628      	mov	r0, r5
c0deb3f2:	f000 fe03 	bl	c0debffc <cx_ecdomain_parameters_length>
c0deb3f6:	f8dd 8070 	ldr.w	r8, [sp, #112]	@ 0x70
c0deb3fa:	4606      	mov	r6, r0
c0deb3fc:	b9e0      	cbnz	r0, c0deb438 <bip32_derive_with_seed_init_privkey_256+0x58>
c0deb3fe:	9804      	ldr	r0, [sp, #16]
c0deb400:	2820      	cmp	r0, #32
c0deb402:	d117      	bne.n	c0deb434 <bip32_derive_with_seed_init_privkey_256+0x54>
c0deb404:	981f      	ldr	r0, [sp, #124]	@ 0x7c
c0deb406:	e9dd 211d 	ldrd	r2, r1, [sp, #116]	@ 0x74
c0deb40a:	ab05      	add	r3, sp, #20
c0deb40c:	e9cd 3200 	strd	r3, r2, [sp]
c0deb410:	e9cd 1002 	strd	r1, r0, [sp, #8]
c0deb414:	4638      	mov	r0, r7
c0deb416:	4629      	mov	r1, r5
c0deb418:	4622      	mov	r2, r4
c0deb41a:	4653      	mov	r3, sl
c0deb41c:	f000 f818 	bl	c0deb450 <os_derive_bip32_with_seed_no_throw>
c0deb420:	4606      	mov	r6, r0
c0deb422:	b948      	cbnz	r0, c0deb438 <bip32_derive_with_seed_init_privkey_256+0x58>
c0deb424:	9a04      	ldr	r2, [sp, #16]
c0deb426:	a905      	add	r1, sp, #20
c0deb428:	4628      	mov	r0, r5
c0deb42a:	4643      	mov	r3, r8
c0deb42c:	f000 fb61 	bl	c0debaf2 <cx_ecfp_init_private_key_no_throw>
c0deb430:	4606      	mov	r6, r0
c0deb432:	e001      	b.n	c0deb438 <bip32_derive_with_seed_init_privkey_256+0x58>
c0deb434:	f06f 065c 	mvn.w	r6, #92	@ 0x5c
c0deb438:	a805      	add	r0, sp, #20
c0deb43a:	2140      	movs	r1, #64	@ 0x40
c0deb43c:	f000 ffca 	bl	c0dec3d4 <explicit_bzero>
c0deb440:	b116      	cbz	r6, c0deb448 <bip32_derive_with_seed_init_privkey_256+0x68>
c0deb442:	4640      	mov	r0, r8
c0deb444:	f000 f89f 	bl	c0deb586 <OUTLINED_FUNCTION_0>
c0deb448:	4630      	mov	r0, r6
c0deb44a:	b015      	add	sp, #84	@ 0x54
c0deb44c:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}

c0deb450 <os_derive_bip32_with_seed_no_throw>:
c0deb450:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0deb454:	b090      	sub	sp, #64	@ 0x40
c0deb456:	f10d 0810 	add.w	r8, sp, #16
c0deb45a:	4607      	mov	r7, r0
c0deb45c:	469b      	mov	fp, r3
c0deb45e:	4616      	mov	r6, r2
c0deb460:	460c      	mov	r4, r1
c0deb462:	4640      	mov	r0, r8
c0deb464:	f000 fffc 	bl	c0dec460 <setjmp>
c0deb468:	b285      	uxth	r5, r0
c0deb46a:	f8dd a060 	ldr.w	sl, [sp, #96]	@ 0x60
c0deb46e:	f8ad 003c 	strh.w	r0, [sp, #60]	@ 0x3c
c0deb472:	b155      	cbz	r5, c0deb48a <os_derive_bip32_with_seed_no_throw+0x3a>
c0deb474:	2000      	movs	r0, #0
c0deb476:	f8ad 003c 	strh.w	r0, [sp, #60]	@ 0x3c
c0deb47a:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0deb47c:	f000 fe66 	bl	c0dec14c <try_context_set>
c0deb480:	2140      	movs	r1, #64	@ 0x40
c0deb482:	4650      	mov	r0, sl
c0deb484:	f000 ffa6 	bl	c0dec3d4 <explicit_bzero>
c0deb488:	e012      	b.n	c0deb4b0 <os_derive_bip32_with_seed_no_throw+0x60>
c0deb48a:	a804      	add	r0, sp, #16
c0deb48c:	f000 fe5e 	bl	c0dec14c <try_context_set>
c0deb490:	9919      	ldr	r1, [sp, #100]	@ 0x64
c0deb492:	900e      	str	r0, [sp, #56]	@ 0x38
c0deb494:	4668      	mov	r0, sp
c0deb496:	4632      	mov	r2, r6
c0deb498:	465b      	mov	r3, fp
c0deb49a:	f8c0 a000 	str.w	sl, [r0]
c0deb49e:	6041      	str	r1, [r0, #4]
c0deb4a0:	991a      	ldr	r1, [sp, #104]	@ 0x68
c0deb4a2:	6081      	str	r1, [r0, #8]
c0deb4a4:	991b      	ldr	r1, [sp, #108]	@ 0x6c
c0deb4a6:	60c1      	str	r1, [r0, #12]
c0deb4a8:	4638      	mov	r0, r7
c0deb4aa:	4621      	mov	r1, r4
c0deb4ac:	f000 fdb0 	bl	c0dec010 <os_perso_derive_node_with_seed_key>
c0deb4b0:	f000 fe44 	bl	c0dec13c <try_context_get>
c0deb4b4:	4540      	cmp	r0, r8
c0deb4b6:	d102      	bne.n	c0deb4be <os_derive_bip32_with_seed_no_throw+0x6e>
c0deb4b8:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0deb4ba:	f000 fe47 	bl	c0dec14c <try_context_set>
c0deb4be:	f8bd 003c 	ldrh.w	r0, [sp, #60]	@ 0x3c
c0deb4c2:	b918      	cbnz	r0, c0deb4cc <os_derive_bip32_with_seed_no_throw+0x7c>
c0deb4c4:	4628      	mov	r0, r5
c0deb4c6:	b010      	add	sp, #64	@ 0x40
c0deb4c8:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0deb4cc:	f000 fbb9 	bl	c0debc42 <os_longjmp>

c0deb4d0 <bip32_derive_with_seed_get_pubkey_256>:
c0deb4d0:	b5f0      	push	{r4, r5, r6, r7, lr}
c0deb4d2:	b0a1      	sub	sp, #132	@ 0x84
c0deb4d4:	460e      	mov	r6, r1
c0deb4d6:	992a      	ldr	r1, [sp, #168]	@ 0xa8
c0deb4d8:	9103      	str	r1, [sp, #12]
c0deb4da:	9929      	ldr	r1, [sp, #164]	@ 0xa4
c0deb4dc:	9102      	str	r1, [sp, #8]
c0deb4de:	9927      	ldr	r1, [sp, #156]	@ 0x9c
c0deb4e0:	9101      	str	r1, [sp, #4]
c0deb4e2:	a917      	add	r1, sp, #92	@ 0x5c
c0deb4e4:	9100      	str	r1, [sp, #0]
c0deb4e6:	4631      	mov	r1, r6
c0deb4e8:	f7ff ff7a 	bl	c0deb3e0 <bip32_derive_with_seed_init_privkey_256>
c0deb4ec:	9c26      	ldr	r4, [sp, #152]	@ 0x98
c0deb4ee:	4605      	mov	r5, r0
c0deb4f0:	b9b8      	cbnz	r0, c0deb522 <bip32_derive_with_seed_get_pubkey_256+0x52>
c0deb4f2:	9828      	ldr	r0, [sp, #160]	@ 0xa0
c0deb4f4:	2301      	movs	r3, #1
c0deb4f6:	9000      	str	r0, [sp, #0]
c0deb4f8:	af04      	add	r7, sp, #16
c0deb4fa:	aa17      	add	r2, sp, #92	@ 0x5c
c0deb4fc:	4630      	mov	r0, r6
c0deb4fe:	4639      	mov	r1, r7
c0deb500:	f000 faf2 	bl	c0debae8 <cx_ecfp_generate_pair2_no_throw>
c0deb504:	4605      	mov	r5, r0
c0deb506:	b960      	cbnz	r0, c0deb522 <bip32_derive_with_seed_get_pubkey_256+0x52>
c0deb508:	9805      	ldr	r0, [sp, #20]
c0deb50a:	2841      	cmp	r0, #65	@ 0x41
c0deb50c:	d107      	bne.n	c0deb51e <bip32_derive_with_seed_get_pubkey_256+0x4e>
c0deb50e:	f107 0108 	add.w	r1, r7, #8
c0deb512:	4620      	mov	r0, r4
c0deb514:	2241      	movs	r2, #65	@ 0x41
c0deb516:	f000 ff45 	bl	c0dec3a4 <__aeabi_memcpy>
c0deb51a:	2500      	movs	r5, #0
c0deb51c:	e001      	b.n	c0deb522 <bip32_derive_with_seed_get_pubkey_256+0x52>
c0deb51e:	f06f 055c 	mvn.w	r5, #92	@ 0x5c
c0deb522:	a817      	add	r0, sp, #92	@ 0x5c
c0deb524:	f000 f82f 	bl	c0deb586 <OUTLINED_FUNCTION_0>
c0deb528:	b11d      	cbz	r5, c0deb532 <bip32_derive_with_seed_get_pubkey_256+0x62>
c0deb52a:	4620      	mov	r0, r4
c0deb52c:	2141      	movs	r1, #65	@ 0x41
c0deb52e:	f000 ff51 	bl	c0dec3d4 <explicit_bzero>
c0deb532:	4628      	mov	r0, r5
c0deb534:	b021      	add	sp, #132	@ 0x84
c0deb536:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0deb538 <bip32_derive_with_seed_ecdsa_sign_hash_256>:
c0deb538:	b5f0      	push	{r4, r5, r6, r7, lr}
c0deb53a:	b08f      	sub	sp, #60	@ 0x3c
c0deb53c:	9f19      	ldr	r7, [sp, #100]	@ 0x64
c0deb53e:	9d1c      	ldr	r5, [sp, #112]	@ 0x70
c0deb540:	683c      	ldr	r4, [r7, #0]
c0deb542:	9503      	str	r5, [sp, #12]
c0deb544:	9d1b      	ldr	r5, [sp, #108]	@ 0x6c
c0deb546:	9502      	str	r5, [sp, #8]
c0deb548:	2500      	movs	r5, #0
c0deb54a:	9501      	str	r5, [sp, #4]
c0deb54c:	ad05      	add	r5, sp, #20
c0deb54e:	9500      	str	r5, [sp, #0]
c0deb550:	f7ff ff46 	bl	c0deb3e0 <bip32_derive_with_seed_init_privkey_256>
c0deb554:	9d18      	ldr	r5, [sp, #96]	@ 0x60
c0deb556:	4606      	mov	r6, r0
c0deb558:	b950      	cbnz	r0, c0deb570 <bip32_derive_with_seed_ecdsa_sign_hash_256+0x38>
c0deb55a:	ae14      	add	r6, sp, #80	@ 0x50
c0deb55c:	981a      	ldr	r0, [sp, #104]	@ 0x68
c0deb55e:	ce4e      	ldmia	r6, {r1, r2, r3, r6}
c0deb560:	e9cd 6500 	strd	r6, r5, [sp]
c0deb564:	e9cd 7002 	strd	r7, r0, [sp, #8]
c0deb568:	a805      	add	r0, sp, #20
c0deb56a:	f000 fab8 	bl	c0debade <cx_ecdsa_sign_no_throw>
c0deb56e:	4606      	mov	r6, r0
c0deb570:	a805      	add	r0, sp, #20
c0deb572:	f000 f808 	bl	c0deb586 <OUTLINED_FUNCTION_0>
c0deb576:	b11e      	cbz	r6, c0deb580 <bip32_derive_with_seed_ecdsa_sign_hash_256+0x48>
c0deb578:	4628      	mov	r0, r5
c0deb57a:	4621      	mov	r1, r4
c0deb57c:	f000 ff2a 	bl	c0dec3d4 <explicit_bzero>
c0deb580:	4630      	mov	r0, r6
c0deb582:	b00f      	add	sp, #60	@ 0x3c
c0deb584:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0deb586 <OUTLINED_FUNCTION_0>:
c0deb586:	2128      	movs	r1, #40	@ 0x28
c0deb588:	f000 bf24 	b.w	c0dec3d4 <explicit_bzero>

c0deb58c <format_u64>:
c0deb58c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0deb590:	b1f9      	cbz	r1, c0deb5d2 <format_u64+0x46>
c0deb592:	4615      	mov	r5, r2
c0deb594:	4604      	mov	r4, r0
c0deb596:	f1a1 0801 	sub.w	r8, r1, #1
c0deb59a:	2700      	movs	r7, #0
c0deb59c:	2600      	movs	r6, #0
c0deb59e:	f1b5 000a 	subs.w	r0, r5, #10
c0deb5a2:	f173 0000 	sbcs.w	r0, r3, #0
c0deb5a6:	d316      	bcc.n	c0deb5d6 <format_u64+0x4a>
c0deb5a8:	4619      	mov	r1, r3
c0deb5aa:	4628      	mov	r0, r5
c0deb5ac:	220a      	movs	r2, #10
c0deb5ae:	2300      	movs	r3, #0
c0deb5b0:	f000 ff06 	bl	c0dec3c0 <__aeabi_uldivmod>
c0deb5b4:	460b      	mov	r3, r1
c0deb5b6:	eb00 0180 	add.w	r1, r0, r0, lsl #2
c0deb5ba:	1cba      	adds	r2, r7, #2
c0deb5bc:	eba5 0141 	sub.w	r1, r5, r1, lsl #1
c0deb5c0:	4605      	mov	r5, r0
c0deb5c2:	f041 0130 	orr.w	r1, r1, #48	@ 0x30
c0deb5c6:	55e1      	strb	r1, [r4, r7]
c0deb5c8:	1c79      	adds	r1, r7, #1
c0deb5ca:	4542      	cmp	r2, r8
c0deb5cc:	460f      	mov	r7, r1
c0deb5ce:	d9e6      	bls.n	c0deb59e <format_u64+0x12>
c0deb5d0:	e012      	b.n	c0deb5f8 <format_u64+0x6c>
c0deb5d2:	2600      	movs	r6, #0
c0deb5d4:	e010      	b.n	c0deb5f8 <format_u64+0x6c>
c0deb5d6:	f105 0030 	add.w	r0, r5, #48	@ 0x30
c0deb5da:	19e1      	adds	r1, r4, r7
c0deb5dc:	55e0      	strb	r0, [r4, r7]
c0deb5de:	2000      	movs	r0, #0
c0deb5e0:	7048      	strb	r0, [r1, #1]
c0deb5e2:	b2c1      	uxtb	r1, r0
c0deb5e4:	428f      	cmp	r7, r1
c0deb5e6:	d906      	bls.n	c0deb5f6 <format_u64+0x6a>
c0deb5e8:	5c62      	ldrb	r2, [r4, r1]
c0deb5ea:	5de3      	ldrb	r3, [r4, r7]
c0deb5ec:	3001      	adds	r0, #1
c0deb5ee:	5463      	strb	r3, [r4, r1]
c0deb5f0:	55e2      	strb	r2, [r4, r7]
c0deb5f2:	3f01      	subs	r7, #1
c0deb5f4:	e7f5      	b.n	c0deb5e2 <format_u64+0x56>
c0deb5f6:	2601      	movs	r6, #1
c0deb5f8:	4630      	mov	r0, r6
c0deb5fa:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0deb5fe <format_fpu64>:
c0deb5fe:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0deb602:	b086      	sub	sp, #24
c0deb604:	466c      	mov	r4, sp
c0deb606:	4688      	mov	r8, r1
c0deb608:	4605      	mov	r5, r0
c0deb60a:	2115      	movs	r1, #21
c0deb60c:	461e      	mov	r6, r3
c0deb60e:	4617      	mov	r7, r2
c0deb610:	4620      	mov	r0, r4
c0deb612:	f000 fed1 	bl	c0dec3b8 <__aeabi_memclr>
c0deb616:	4620      	mov	r0, r4
c0deb618:	2115      	movs	r1, #21
c0deb61a:	463a      	mov	r2, r7
c0deb61c:	4633      	mov	r3, r6
c0deb61e:	f7ff ffb5 	bl	c0deb58c <format_u64>
c0deb622:	b340      	cbz	r0, c0deb676 <format_fpu64+0x78>
c0deb624:	466f      	mov	r7, sp
c0deb626:	9e0c      	ldr	r6, [sp, #48]	@ 0x30
c0deb628:	4638      	mov	r0, r7
c0deb62a:	f000 ff31 	bl	c0dec490 <strlen>
c0deb62e:	42b0      	cmp	r0, r6
c0deb630:	d910      	bls.n	c0deb654 <format_fpu64+0x56>
c0deb632:	1831      	adds	r1, r6, r0
c0deb634:	3101      	adds	r1, #1
c0deb636:	4541      	cmp	r1, r8
c0deb638:	d21d      	bcs.n	c0deb676 <format_fpu64+0x78>
c0deb63a:	1b84      	subs	r4, r0, r6
c0deb63c:	4628      	mov	r0, r5
c0deb63e:	4639      	mov	r1, r7
c0deb640:	4622      	mov	r2, r4
c0deb642:	f000 feaf 	bl	c0dec3a4 <__aeabi_memcpy>
c0deb646:	1928      	adds	r0, r5, r4
c0deb648:	212e      	movs	r1, #46	@ 0x2e
c0deb64a:	4632      	mov	r2, r6
c0deb64c:	f800 1b01 	strb.w	r1, [r0], #1
c0deb650:	1939      	adds	r1, r7, r4
c0deb652:	e015      	b.n	c0deb680 <format_fpu64+0x82>
c0deb654:	1a32      	subs	r2, r6, r0
c0deb656:	1c91      	adds	r1, r2, #2
c0deb658:	4541      	cmp	r1, r8
c0deb65a:	d20c      	bcs.n	c0deb676 <format_fpu64+0x78>
c0deb65c:	202e      	movs	r0, #46	@ 0x2e
c0deb65e:	2330      	movs	r3, #48	@ 0x30
c0deb660:	2400      	movs	r4, #0
c0deb662:	7068      	strb	r0, [r5, #1]
c0deb664:	1ca8      	adds	r0, r5, #2
c0deb666:	702b      	strb	r3, [r5, #0]
c0deb668:	b2a5      	uxth	r5, r4
c0deb66a:	42aa      	cmp	r2, r5
c0deb66c:	d905      	bls.n	c0deb67a <format_fpu64+0x7c>
c0deb66e:	f800 3b01 	strb.w	r3, [r0], #1
c0deb672:	3401      	adds	r4, #1
c0deb674:	e7f8      	b.n	c0deb668 <format_fpu64+0x6a>
c0deb676:	2000      	movs	r0, #0
c0deb678:	e005      	b.n	c0deb686 <format_fpu64+0x88>
c0deb67a:	eba8 0201 	sub.w	r2, r8, r1
c0deb67e:	4669      	mov	r1, sp
c0deb680:	f000 ff0e 	bl	c0dec4a0 <strncpy>
c0deb684:	2001      	movs	r0, #1
c0deb686:	b006      	add	sp, #24
c0deb688:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0deb68c <format_hex>:
c0deb68c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0deb68e:	4604      	mov	r4, r0
c0deb690:	0048      	lsls	r0, r1, #1
c0deb692:	f100 0c01 	add.w	ip, r0, #1
c0deb696:	459c      	cmp	ip, r3
c0deb698:	d902      	bls.n	c0deb6a0 <format_hex+0x14>
c0deb69a:	f04f 3cff 	mov.w	ip, #4294967295	@ 0xffffffff
c0deb69e:	e018      	b.n	c0deb6d2 <format_hex+0x46>
c0deb6a0:	480d      	ldr	r0, [pc, #52]	@ (c0deb6d8 <format_hex+0x4c>)
c0deb6a2:	2500      	movs	r5, #0
c0deb6a4:	4478      	add	r0, pc
c0deb6a6:	b191      	cbz	r1, c0deb6ce <format_hex+0x42>
c0deb6a8:	1cef      	adds	r7, r5, #3
c0deb6aa:	429f      	cmp	r7, r3
c0deb6ac:	d80d      	bhi.n	c0deb6ca <format_hex+0x3e>
c0deb6ae:	7827      	ldrb	r7, [r4, #0]
c0deb6b0:	3901      	subs	r1, #1
c0deb6b2:	093f      	lsrs	r7, r7, #4
c0deb6b4:	5dc7      	ldrb	r7, [r0, r7]
c0deb6b6:	5557      	strb	r7, [r2, r5]
c0deb6b8:	1957      	adds	r7, r2, r5
c0deb6ba:	3502      	adds	r5, #2
c0deb6bc:	f814 6b01 	ldrb.w	r6, [r4], #1
c0deb6c0:	f006 060f 	and.w	r6, r6, #15
c0deb6c4:	5d86      	ldrb	r6, [r0, r6]
c0deb6c6:	707e      	strb	r6, [r7, #1]
c0deb6c8:	e7ed      	b.n	c0deb6a6 <format_hex+0x1a>
c0deb6ca:	f105 0c01 	add.w	ip, r5, #1
c0deb6ce:	2000      	movs	r0, #0
c0deb6d0:	5550      	strb	r0, [r2, r5]
c0deb6d2:	4660      	mov	r0, ip
c0deb6d4:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0deb6d6:	bf00      	nop
c0deb6d8:	0000284e 	.word	0x0000284e

c0deb6dc <app_ticker_event_callback>:
c0deb6dc:	4770      	bx	lr
	...

c0deb6e0 <io_event>:
c0deb6e0:	b580      	push	{r7, lr}
c0deb6e2:	480b      	ldr	r0, [pc, #44]	@ (c0deb710 <io_event+0x30>)
c0deb6e4:	f819 1000 	ldrb.w	r1, [r9, r0]
c0deb6e8:	2905      	cmp	r1, #5
c0deb6ea:	d00e      	beq.n	c0deb70a <io_event+0x2a>
c0deb6ec:	290e      	cmp	r1, #14
c0deb6ee:	d005      	beq.n	c0deb6fc <io_event+0x1c>
c0deb6f0:	290c      	cmp	r1, #12
c0deb6f2:	d108      	bne.n	c0deb706 <io_event+0x26>
c0deb6f4:	4448      	add	r0, r9
c0deb6f6:	f000 f92f 	bl	c0deb958 <ux_process_finger_event>
c0deb6fa:	e006      	b.n	c0deb70a <io_event+0x2a>
c0deb6fc:	f7ff ffee 	bl	c0deb6dc <app_ticker_event_callback>
c0deb700:	f000 f980 	bl	c0deba04 <ux_process_ticker_event>
c0deb704:	e001      	b.n	c0deb70a <io_event+0x2a>
c0deb706:	f000 f9b3 	bl	c0deba70 <ux_process_default_event>
c0deb70a:	2001      	movs	r0, #1
c0deb70c:	bd80      	pop	{r7, pc}
c0deb70e:	bf00      	nop
c0deb710:	00001c8c 	.word	0x00001c8c

c0deb714 <io_init>:
c0deb714:	4802      	ldr	r0, [pc, #8]	@ (c0deb720 <io_init+0xc>)
c0deb716:	2101      	movs	r1, #1
c0deb718:	f809 1000 	strb.w	r1, [r9, r0]
c0deb71c:	4770      	bx	lr
c0deb71e:	bf00      	nop
c0deb720:	00001d9c 	.word	0x00001d9c

c0deb724 <io_recv_command>:
c0deb724:	b510      	push	{r4, lr}
c0deb726:	4c09      	ldr	r4, [pc, #36]	@ (c0deb74c <io_recv_command+0x28>)
c0deb728:	f819 0004 	ldrb.w	r0, [r9, r4]
c0deb72c:	2801      	cmp	r0, #1
c0deb72e:	d104      	bne.n	c0deb73a <io_recv_command+0x16>
c0deb730:	f000 fce2 	bl	c0dec0f8 <os_io_start>
c0deb734:	2000      	movs	r0, #0
c0deb736:	f809 0004 	strb.w	r0, [r9, r4]
c0deb73a:	2000      	movs	r0, #0
c0deb73c:	2800      	cmp	r0, #0
c0deb73e:	dc03      	bgt.n	c0deb748 <io_recv_command+0x24>
c0deb740:	2001      	movs	r0, #1
c0deb742:	f7f8 fc91 	bl	c0de4068 <io_legacy_apdu_rx>
c0deb746:	e7f9      	b.n	c0deb73c <io_recv_command+0x18>
c0deb748:	bd10      	pop	{r4, pc}
c0deb74a:	bf00      	nop
c0deb74c:	00001d9c 	.word	0x00001d9c

c0deb750 <io_send_response_buffers>:
c0deb750:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0deb754:	f8df a060 	ldr.w	sl, [pc, #96]	@ c0deb7b8 <io_send_response_buffers+0x68>
c0deb758:	4690      	mov	r8, r2
c0deb75a:	460f      	mov	r7, r1
c0deb75c:	4605      	mov	r5, r0
c0deb75e:	f240 140f 	movw	r4, #271	@ 0x10f
c0deb762:	2600      	movs	r6, #0
c0deb764:	b1b5      	cbz	r5, c0deb794 <io_send_response_buffers+0x44>
c0deb766:	b1af      	cbz	r7, c0deb794 <io_send_response_buffers+0x44>
c0deb768:	2600      	movs	r6, #0
c0deb76a:	b19f      	cbz	r7, c0deb794 <io_send_response_buffers+0x44>
c0deb76c:	eb09 000a 	add.w	r0, r9, sl
c0deb770:	1ba2      	subs	r2, r4, r6
c0deb772:	1981      	adds	r1, r0, r6
c0deb774:	4628      	mov	r0, r5
c0deb776:	f7ff fe01 	bl	c0deb37c <buffer_copy>
c0deb77a:	b130      	cbz	r0, c0deb78a <io_send_response_buffers+0x3a>
c0deb77c:	e9d5 0101 	ldrd	r0, r1, [r5, #4]
c0deb780:	350c      	adds	r5, #12
c0deb782:	3f01      	subs	r7, #1
c0deb784:	4430      	add	r0, r6
c0deb786:	1a46      	subs	r6, r0, r1
c0deb788:	e7ef      	b.n	c0deb76a <io_send_response_buffers+0x1a>
c0deb78a:	f44f 4830 	mov.w	r8, #45056	@ 0xb000
c0deb78e:	2500      	movs	r5, #0
c0deb790:	2700      	movs	r7, #0
c0deb792:	e7e6      	b.n	c0deb762 <io_send_response_buffers+0x12>
c0deb794:	eb09 050a 	add.w	r5, r9, sl
c0deb798:	fa1f f288 	uxth.w	r2, r8
c0deb79c:	4631      	mov	r1, r6
c0deb79e:	4628      	mov	r0, r5
c0deb7a0:	f000 f8d4 	bl	c0deb94c <write_u16_be>
c0deb7a4:	1cb0      	adds	r0, r6, #2
c0deb7a6:	b281      	uxth	r1, r0
c0deb7a8:	4628      	mov	r0, r5
c0deb7aa:	f7f8 fc43 	bl	c0de4034 <io_legacy_apdu_tx>
c0deb7ae:	ea40 70e0 	orr.w	r0, r0, r0, asr #31
c0deb7b2:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0deb7b6:	bf00      	nop
c0deb7b8:	00001497 	.word	0x00001497

c0deb7bc <app_exit>:
c0deb7bc:	20ff      	movs	r0, #255	@ 0xff
c0deb7be:	f000 fc87 	bl	c0dec0d0 <os_sched_exit>

c0deb7c2 <common_app_init>:
c0deb7c2:	b580      	push	{r7, lr}
c0deb7c4:	f000 f9c8 	bl	c0debb58 <nbgl_objInit>
c0deb7c8:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0deb7cc:	f7f8 bd78 	b.w	c0de42c0 <io_seproxyhal_init>

c0deb7d0 <standalone_app_main>:
c0deb7d0:	b510      	push	{r4, lr}
c0deb7d2:	b08c      	sub	sp, #48	@ 0x30
c0deb7d4:	466c      	mov	r4, sp
c0deb7d6:	4620      	mov	r0, r4
c0deb7d8:	f000 fe42 	bl	c0dec460 <setjmp>
c0deb7dc:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0deb7e0:	0400      	lsls	r0, r0, #16
c0deb7e2:	d108      	bne.n	c0deb7f6 <standalone_app_main+0x26>
c0deb7e4:	4668      	mov	r0, sp
c0deb7e6:	f000 fcb1 	bl	c0dec14c <try_context_set>
c0deb7ea:	900a      	str	r0, [sp, #40]	@ 0x28
c0deb7ec:	f7ff ffe9 	bl	c0deb7c2 <common_app_init>
c0deb7f0:	f7f4 fd3a 	bl	c0de0268 <app_main>
c0deb7f4:	e005      	b.n	c0deb802 <standalone_app_main+0x32>
c0deb7f6:	2000      	movs	r0, #0
c0deb7f8:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0deb7fc:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0deb7fe:	f000 fca5 	bl	c0dec14c <try_context_set>
c0deb802:	f000 fc9b 	bl	c0dec13c <try_context_get>
c0deb806:	42a0      	cmp	r0, r4
c0deb808:	d102      	bne.n	c0deb810 <standalone_app_main+0x40>
c0deb80a:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0deb80c:	f000 fc9e 	bl	c0dec14c <try_context_set>
c0deb810:	f8bd 002c 	ldrh.w	r0, [sp, #44]	@ 0x2c
c0deb814:	b908      	cbnz	r0, c0deb81a <standalone_app_main+0x4a>
c0deb816:	f7ff ffd1 	bl	c0deb7bc <app_exit>
c0deb81a:	f000 fa12 	bl	c0debc42 <os_longjmp>

c0deb81e <apdu_parser>:
c0deb81e:	2a04      	cmp	r2, #4
c0deb820:	d316      	bcc.n	c0deb850 <apdu_parser+0x32>
c0deb822:	d102      	bne.n	c0deb82a <apdu_parser+0xc>
c0deb824:	2300      	movs	r3, #0
c0deb826:	7103      	strb	r3, [r0, #4]
c0deb828:	e004      	b.n	c0deb834 <apdu_parser+0x16>
c0deb82a:	790b      	ldrb	r3, [r1, #4]
c0deb82c:	3a05      	subs	r2, #5
c0deb82e:	429a      	cmp	r2, r3
c0deb830:	7103      	strb	r3, [r0, #4]
c0deb832:	d10d      	bne.n	c0deb850 <apdu_parser+0x32>
c0deb834:	780a      	ldrb	r2, [r1, #0]
c0deb836:	2b00      	cmp	r3, #0
c0deb838:	7002      	strb	r2, [r0, #0]
c0deb83a:	784a      	ldrb	r2, [r1, #1]
c0deb83c:	7042      	strb	r2, [r0, #1]
c0deb83e:	788a      	ldrb	r2, [r1, #2]
c0deb840:	7082      	strb	r2, [r0, #2]
c0deb842:	bf18      	it	ne
c0deb844:	1d4b      	addne	r3, r1, #5
c0deb846:	78c9      	ldrb	r1, [r1, #3]
c0deb848:	6083      	str	r3, [r0, #8]
c0deb84a:	70c1      	strb	r1, [r0, #3]
c0deb84c:	2001      	movs	r0, #1
c0deb84e:	4770      	bx	lr
c0deb850:	2000      	movs	r0, #0
c0deb852:	4770      	bx	lr

c0deb854 <read_u32_be>:
c0deb854:	5c42      	ldrb	r2, [r0, r1]
c0deb856:	4408      	add	r0, r1
c0deb858:	7841      	ldrb	r1, [r0, #1]
c0deb85a:	7883      	ldrb	r3, [r0, #2]
c0deb85c:	78c0      	ldrb	r0, [r0, #3]
c0deb85e:	0409      	lsls	r1, r1, #16
c0deb860:	ea41 6102 	orr.w	r1, r1, r2, lsl #24
c0deb864:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0deb868:	4408      	add	r0, r1
c0deb86a:	4770      	bx	lr

c0deb86c <read_u64_be>:
c0deb86c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0deb86e:	1842      	adds	r2, r0, r1
c0deb870:	5c40      	ldrb	r0, [r0, r1]
c0deb872:	7917      	ldrb	r7, [r2, #4]
c0deb874:	7953      	ldrb	r3, [r2, #5]
c0deb876:	7854      	ldrb	r4, [r2, #1]
c0deb878:	7895      	ldrb	r5, [r2, #2]
c0deb87a:	78d6      	ldrb	r6, [r2, #3]
c0deb87c:	063f      	lsls	r7, r7, #24
c0deb87e:	0421      	lsls	r1, r4, #16
c0deb880:	ea47 4303 	orr.w	r3, r7, r3, lsl #16
c0deb884:	7997      	ldrb	r7, [r2, #6]
c0deb886:	79d2      	ldrb	r2, [r2, #7]
c0deb888:	ea41 6000 	orr.w	r0, r1, r0, lsl #24
c0deb88c:	ea40 2005 	orr.w	r0, r0, r5, lsl #8
c0deb890:	ea43 2307 	orr.w	r3, r3, r7, lsl #8
c0deb894:	1981      	adds	r1, r0, r6
c0deb896:	441a      	add	r2, r3
c0deb898:	4610      	mov	r0, r2
c0deb89a:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0deb89c <read_u16_le>:
c0deb89c:	5c42      	ldrb	r2, [r0, r1]
c0deb89e:	4408      	add	r0, r1
c0deb8a0:	7840      	ldrb	r0, [r0, #1]
c0deb8a2:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0deb8a6:	b280      	uxth	r0, r0
c0deb8a8:	4770      	bx	lr

c0deb8aa <read_u32_le>:
c0deb8aa:	5c42      	ldrb	r2, [r0, r1]
c0deb8ac:	4408      	add	r0, r1
c0deb8ae:	7841      	ldrb	r1, [r0, #1]
c0deb8b0:	7883      	ldrb	r3, [r0, #2]
c0deb8b2:	78c0      	ldrb	r0, [r0, #3]
c0deb8b4:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0deb8b8:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
c0deb8bc:	ea41 6000 	orr.w	r0, r1, r0, lsl #24
c0deb8c0:	4770      	bx	lr

c0deb8c2 <read_u64_le>:
c0deb8c2:	b5b0      	push	{r4, r5, r7, lr}
c0deb8c4:	5c42      	ldrb	r2, [r0, r1]
c0deb8c6:	4401      	add	r1, r0
c0deb8c8:	7848      	ldrb	r0, [r1, #1]
c0deb8ca:	788b      	ldrb	r3, [r1, #2]
c0deb8cc:	790d      	ldrb	r5, [r1, #4]
c0deb8ce:	78cc      	ldrb	r4, [r1, #3]
c0deb8d0:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0deb8d4:	794a      	ldrb	r2, [r1, #5]
c0deb8d6:	ea40 4003 	orr.w	r0, r0, r3, lsl #16
c0deb8da:	798b      	ldrb	r3, [r1, #6]
c0deb8dc:	79c9      	ldrb	r1, [r1, #7]
c0deb8de:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0deb8e2:	ea40 6004 	orr.w	r0, r0, r4, lsl #24
c0deb8e6:	ea42 4203 	orr.w	r2, r2, r3, lsl #16
c0deb8ea:	ea42 6101 	orr.w	r1, r2, r1, lsl #24
c0deb8ee:	bdb0      	pop	{r4, r5, r7, pc}

c0deb8f0 <varint_read>:
c0deb8f0:	b510      	push	{r4, lr}
c0deb8f2:	b1d9      	cbz	r1, c0deb92c <varint_read+0x3c>
c0deb8f4:	4614      	mov	r4, r2
c0deb8f6:	4602      	mov	r2, r0
c0deb8f8:	7800      	ldrb	r0, [r0, #0]
c0deb8fa:	28ff      	cmp	r0, #255	@ 0xff
c0deb8fc:	d00c      	beq.n	c0deb918 <varint_read+0x28>
c0deb8fe:	28fe      	cmp	r0, #254	@ 0xfe
c0deb900:	d012      	beq.n	c0deb928 <varint_read+0x38>
c0deb902:	28fd      	cmp	r0, #253	@ 0xfd
c0deb904:	d115      	bne.n	c0deb932 <varint_read+0x42>
c0deb906:	2903      	cmp	r1, #3
c0deb908:	d310      	bcc.n	c0deb92c <varint_read+0x3c>
c0deb90a:	4610      	mov	r0, r2
c0deb90c:	2101      	movs	r1, #1
c0deb90e:	f7ff ffc5 	bl	c0deb89c <read_u16_le>
c0deb912:	2100      	movs	r1, #0
c0deb914:	2203      	movs	r2, #3
c0deb916:	e015      	b.n	c0deb944 <varint_read+0x54>
c0deb918:	2909      	cmp	r1, #9
c0deb91a:	d307      	bcc.n	c0deb92c <varint_read+0x3c>
c0deb91c:	4610      	mov	r0, r2
c0deb91e:	2101      	movs	r1, #1
c0deb920:	f7ff ffcf 	bl	c0deb8c2 <read_u64_le>
c0deb924:	2209      	movs	r2, #9
c0deb926:	e00d      	b.n	c0deb944 <varint_read+0x54>
c0deb928:	2905      	cmp	r1, #5
c0deb92a:	d205      	bcs.n	c0deb938 <varint_read+0x48>
c0deb92c:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
c0deb930:	e00a      	b.n	c0deb948 <varint_read+0x58>
c0deb932:	2100      	movs	r1, #0
c0deb934:	2201      	movs	r2, #1
c0deb936:	e005      	b.n	c0deb944 <varint_read+0x54>
c0deb938:	4610      	mov	r0, r2
c0deb93a:	2101      	movs	r1, #1
c0deb93c:	f7ff ffb5 	bl	c0deb8aa <read_u32_le>
c0deb940:	2100      	movs	r1, #0
c0deb942:	2205      	movs	r2, #5
c0deb944:	e9c4 0100 	strd	r0, r1, [r4]
c0deb948:	4610      	mov	r0, r2
c0deb94a:	bd10      	pop	{r4, pc}

c0deb94c <write_u16_be>:
c0deb94c:	0a13      	lsrs	r3, r2, #8
c0deb94e:	5443      	strb	r3, [r0, r1]
c0deb950:	4408      	add	r0, r1
c0deb952:	7042      	strb	r2, [r0, #1]
c0deb954:	4770      	bx	lr
	...

c0deb958 <ux_process_finger_event>:
c0deb958:	b5b0      	push	{r4, r5, r7, lr}
c0deb95a:	4604      	mov	r4, r0
c0deb95c:	2001      	movs	r0, #1
c0deb95e:	f000 f827 	bl	c0deb9b0 <ux_forward_event>
c0deb962:	4605      	mov	r5, r0
c0deb964:	f000 f902 	bl	c0debb6c <nbgl_objAllowDrawing>
c0deb968:	b1fd      	cbz	r5, c0deb9aa <ux_process_finger_event+0x52>
c0deb96a:	78e1      	ldrb	r1, [r4, #3]
c0deb96c:	480f      	ldr	r0, [pc, #60]	@ (c0deb9ac <ux_process_finger_event+0x54>)
c0deb96e:	7963      	ldrb	r3, [r4, #5]
c0deb970:	3901      	subs	r1, #1
c0deb972:	eb09 0200 	add.w	r2, r9, r0
c0deb976:	f859 0000 	ldr.w	r0, [r9, r0]
c0deb97a:	fab1 f181 	clz	r1, r1
c0deb97e:	094d      	lsrs	r5, r1, #5
c0deb980:	4611      	mov	r1, r2
c0deb982:	f801 5f04 	strb.w	r5, [r1, #4]!
c0deb986:	7925      	ldrb	r5, [r4, #4]
c0deb988:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0deb98c:	80d3      	strh	r3, [r2, #6]
c0deb98e:	79a3      	ldrb	r3, [r4, #6]
c0deb990:	79e4      	ldrb	r4, [r4, #7]
c0deb992:	ea44 2303 	orr.w	r3, r4, r3, lsl #8
c0deb996:	8113      	strh	r3, [r2, #8]
c0deb998:	2264      	movs	r2, #100	@ 0x64
c0deb99a:	4342      	muls	r2, r0
c0deb99c:	2000      	movs	r0, #0
c0deb99e:	f000 f93a 	bl	c0debc16 <nbgl_touchHandler>
c0deb9a2:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
c0deb9a6:	f000 b8c8 	b.w	c0debb3a <nbgl_refresh>
c0deb9aa:	bdb0      	pop	{r4, r5, r7, pc}
c0deb9ac:	00001dc4 	.word	0x00001dc4

c0deb9b0 <ux_forward_event>:
c0deb9b0:	b5b0      	push	{r4, r5, r7, lr}
c0deb9b2:	4604      	mov	r4, r0
c0deb9b4:	4812      	ldr	r0, [pc, #72]	@ (c0deba00 <ux_forward_event+0x50>)
c0deb9b6:	2101      	movs	r1, #1
c0deb9b8:	f809 1000 	strb.w	r1, [r9, r0]
c0deb9bc:	eb09 0500 	add.w	r5, r9, r0
c0deb9c0:	2000      	movs	r0, #0
c0deb9c2:	6068      	str	r0, [r5, #4]
c0deb9c4:	4628      	mov	r0, r5
c0deb9c6:	f000 fb59 	bl	c0dec07c <os_ux>
c0deb9ca:	2004      	movs	r0, #4
c0deb9cc:	f000 fbc8 	bl	c0dec160 <os_sched_last_status>
c0deb9d0:	2869      	cmp	r0, #105	@ 0x69
c0deb9d2:	6068      	str	r0, [r5, #4]
c0deb9d4:	d108      	bne.n	c0deb9e8 <ux_forward_event+0x38>
c0deb9d6:	2001      	movs	r0, #1
c0deb9d8:	f000 f8c8 	bl	c0debb6c <nbgl_objAllowDrawing>
c0deb9dc:	f000 f8d5 	bl	c0debb8a <nbgl_screenRedraw>
c0deb9e0:	f000 f8ab 	bl	c0debb3a <nbgl_refresh>
c0deb9e4:	2000      	movs	r0, #0
c0deb9e6:	bdb0      	pop	{r4, r5, r7, pc}
c0deb9e8:	b144      	cbz	r4, c0deb9fc <ux_forward_event+0x4c>
c0deb9ea:	f1b0 0197 	subs.w	r1, r0, #151	@ 0x97
c0deb9ee:	bf18      	it	ne
c0deb9f0:	2101      	movne	r1, #1
c0deb9f2:	2800      	cmp	r0, #0
c0deb9f4:	bf18      	it	ne
c0deb9f6:	2001      	movne	r0, #1
c0deb9f8:	4008      	ands	r0, r1
c0deb9fa:	bdb0      	pop	{r4, r5, r7, pc}
c0deb9fc:	2001      	movs	r0, #1
c0deb9fe:	bdb0      	pop	{r4, r5, r7, pc}
c0deba00:	00001da0 	.word	0x00001da0

c0deba04 <ux_process_ticker_event>:
c0deba04:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0deba06:	4d19      	ldr	r5, [pc, #100]	@ (c0deba6c <ux_process_ticker_event+0x68>)
c0deba08:	f859 0005 	ldr.w	r0, [r9, r5]
c0deba0c:	3001      	adds	r0, #1
c0deba0e:	f849 0005 	str.w	r0, [r9, r5]
c0deba12:	2001      	movs	r0, #1
c0deba14:	f7ff ffcc 	bl	c0deb9b0 <ux_forward_event>
c0deba18:	4604      	mov	r4, r0
c0deba1a:	f000 f8a7 	bl	c0debb6c <nbgl_objAllowDrawing>
c0deba1e:	b324      	cbz	r4, c0deba6a <ux_process_ticker_event+0x66>
c0deba20:	2064      	movs	r0, #100	@ 0x64
c0deba22:	2464      	movs	r4, #100	@ 0x64
c0deba24:	f000 f8c0 	bl	c0debba8 <nbgl_screenHandler>
c0deba28:	eb09 0005 	add.w	r0, r9, r5
c0deba2c:	7900      	ldrb	r0, [r0, #4]
c0deba2e:	2801      	cmp	r0, #1
c0deba30:	d119      	bne.n	c0deba66 <ux_process_ticker_event+0x62>
c0deba32:	4668      	mov	r0, sp
c0deba34:	f000 fba0 	bl	c0dec178 <touch_get_last_info>
c0deba38:	f8bd 0000 	ldrh.w	r0, [sp]
c0deba3c:	eb09 0105 	add.w	r1, r9, r5
c0deba40:	80c8      	strh	r0, [r1, #6]
c0deba42:	f8bd 0002 	ldrh.w	r0, [sp, #2]
c0deba46:	8108      	strh	r0, [r1, #8]
c0deba48:	f89d 0004 	ldrb.w	r0, [sp, #4]
c0deba4c:	3801      	subs	r0, #1
c0deba4e:	fab0 f080 	clz	r0, r0
c0deba52:	0940      	lsrs	r0, r0, #5
c0deba54:	f801 0f04 	strb.w	r0, [r1, #4]!
c0deba58:	f859 0005 	ldr.w	r0, [r9, r5]
c0deba5c:	fb00 f204 	mul.w	r2, r0, r4
c0deba60:	2000      	movs	r0, #0
c0deba62:	f000 f8d8 	bl	c0debc16 <nbgl_touchHandler>
c0deba66:	f000 f868 	bl	c0debb3a <nbgl_refresh>
c0deba6a:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}
c0deba6c:	00001dc4 	.word	0x00001dc4

c0deba70 <ux_process_default_event>:
c0deba70:	2000      	movs	r0, #0
c0deba72:	f7ff bf9d 	b.w	c0deb9b0 <ux_forward_event>

c0deba76 <hash_iovec_ex>:
c0deba76:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0deba7a:	468a      	mov	sl, r1
c0deba7c:	4611      	mov	r1, r2
c0deba7e:	461a      	mov	r2, r3
c0deba80:	4605      	mov	r5, r0
c0deba82:	f000 f840 	bl	c0debb06 <cx_hash_init_ex>
c0deba86:	4607      	mov	r7, r0
c0deba88:	b9a8      	cbnz	r0, c0debab6 <hash_iovec_ex+0x40>
c0deba8a:	f10d 0820 	add.w	r8, sp, #32
c0deba8e:	e898 0141 	ldmia.w	r8, {r0, r6, r8}
c0deba92:	1d04      	adds	r4, r0, #4
c0deba94:	b156      	cbz	r6, c0debaac <hash_iovec_ex+0x36>
c0deba96:	f854 1c04 	ldr.w	r1, [r4, #-4]
c0deba9a:	f854 2b08 	ldr.w	r2, [r4], #8
c0deba9e:	4628      	mov	r0, r5
c0debaa0:	f000 f836 	bl	c0debb10 <cx_hash_update>
c0debaa4:	3e01      	subs	r6, #1
c0debaa6:	2800      	cmp	r0, #0
c0debaa8:	d0f4      	beq.n	c0deba94 <hash_iovec_ex+0x1e>
c0debaaa:	e003      	b.n	c0debab4 <hash_iovec_ex+0x3e>
c0debaac:	4628      	mov	r0, r5
c0debaae:	4641      	mov	r1, r8
c0debab0:	f000 f824 	bl	c0debafc <cx_hash_final>
c0debab4:	4607      	mov	r7, r0
c0debab6:	4628      	mov	r0, r5
c0debab8:	4651      	mov	r1, sl
c0debaba:	f000 fc8b 	bl	c0dec3d4 <explicit_bzero>
c0debabe:	4638      	mov	r0, r7
c0debac0:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}

c0debac4 <cx_keccak_256_hash_iovec>:
c0debac4:	b580      	push	{r7, lr}
c0debac6:	b0ee      	sub	sp, #440	@ 0x1b8
c0debac8:	e88d 0007 	stmia.w	sp, {r0, r1, r2}
c0debacc:	a804      	add	r0, sp, #16
c0debace:	f44f 71d4 	mov.w	r1, #424	@ 0x1a8
c0debad2:	2206      	movs	r2, #6
c0debad4:	2320      	movs	r3, #32
c0debad6:	f7ff ffce 	bl	c0deba76 <hash_iovec_ex>
c0debada:	b06e      	add	sp, #440	@ 0x1b8
c0debadc:	bd80      	pop	{r7, pc}

c0debade <cx_ecdsa_sign_no_throw>:
c0debade:	b403      	push	{r0, r1}
c0debae0:	f04f 002c 	mov.w	r0, #44	@ 0x2c
c0debae4:	f000 b822 	b.w	c0debb2c <cx_trampoline_helper>

c0debae8 <cx_ecfp_generate_pair2_no_throw>:
c0debae8:	b403      	push	{r0, r1}
c0debaea:	f04f 0031 	mov.w	r0, #49	@ 0x31
c0debaee:	f000 b81d 	b.w	c0debb2c <cx_trampoline_helper>

c0debaf2 <cx_ecfp_init_private_key_no_throw>:
c0debaf2:	b403      	push	{r0, r1}
c0debaf4:	f04f 0033 	mov.w	r0, #51	@ 0x33
c0debaf8:	f000 b818 	b.w	c0debb2c <cx_trampoline_helper>

c0debafc <cx_hash_final>:
c0debafc:	b403      	push	{r0, r1}
c0debafe:	f04f 003f 	mov.w	r0, #63	@ 0x3f
c0debb02:	f000 b813 	b.w	c0debb2c <cx_trampoline_helper>

c0debb06 <cx_hash_init_ex>:
c0debb06:	b403      	push	{r0, r1}
c0debb08:	f04f 0043 	mov.w	r0, #67	@ 0x43
c0debb0c:	f000 b80e 	b.w	c0debb2c <cx_trampoline_helper>

c0debb10 <cx_hash_update>:
c0debb10:	b403      	push	{r0, r1}
c0debb12:	f04f 0048 	mov.w	r0, #72	@ 0x48
c0debb16:	f000 b809 	b.w	c0debb2c <cx_trampoline_helper>

c0debb1a <cx_rng_no_throw>:
c0debb1a:	b403      	push	{r0, r1}
c0debb1c:	f04f 006a 	mov.w	r0, #106	@ 0x6a
c0debb20:	f000 b804 	b.w	c0debb2c <cx_trampoline_helper>

c0debb24 <cx_aes_siv_reset>:
c0debb24:	b403      	push	{r0, r1}
c0debb26:	f04f 0090 	mov.w	r0, #144	@ 0x90
c0debb2a:	e7ff      	b.n	c0debb2c <cx_trampoline_helper>

c0debb2c <cx_trampoline_helper>:
c0debb2c:	4900      	ldr	r1, [pc, #0]	@ (c0debb30 <cx_trampoline_helper+0x4>)
c0debb2e:	4708      	bx	r1
c0debb30:	00808001 	.word	0x00808001

c0debb34 <assert_exit>:
c0debb34:	20ff      	movs	r0, #255	@ 0xff
c0debb36:	f000 facb 	bl	c0dec0d0 <os_sched_exit>

c0debb3a <nbgl_refresh>:
c0debb3a:	b403      	push	{r0, r1}
c0debb3c:	f04f 0091 	mov.w	r0, #145	@ 0x91
c0debb40:	f000 b878 	b.w	c0debc34 <nbgl_trampoline_helper>

c0debb44 <nbgl_refreshSpecial>:
c0debb44:	b403      	push	{r0, r1}
c0debb46:	f04f 0092 	mov.w	r0, #146	@ 0x92
c0debb4a:	f000 b873 	b.w	c0debc34 <nbgl_trampoline_helper>

c0debb4e <nbgl_refreshSpecialWithPostRefresh>:
c0debb4e:	b403      	push	{r0, r1}
c0debb50:	f04f 0093 	mov.w	r0, #147	@ 0x93
c0debb54:	f000 b86e 	b.w	c0debc34 <nbgl_trampoline_helper>

c0debb58 <nbgl_objInit>:
c0debb58:	b403      	push	{r0, r1}
c0debb5a:	f04f 0096 	mov.w	r0, #150	@ 0x96
c0debb5e:	f000 b869 	b.w	c0debc34 <nbgl_trampoline_helper>

c0debb62 <nbgl_objDraw>:
c0debb62:	b403      	push	{r0, r1}
c0debb64:	f04f 0097 	mov.w	r0, #151	@ 0x97
c0debb68:	f000 b864 	b.w	c0debc34 <nbgl_trampoline_helper>

c0debb6c <nbgl_objAllowDrawing>:
c0debb6c:	b403      	push	{r0, r1}
c0debb6e:	f04f 0098 	mov.w	r0, #152	@ 0x98
c0debb72:	f000 b85f 	b.w	c0debc34 <nbgl_trampoline_helper>

c0debb76 <nbgl_screenSet>:
c0debb76:	b403      	push	{r0, r1}
c0debb78:	f04f 009b 	mov.w	r0, #155	@ 0x9b
c0debb7c:	f000 b85a 	b.w	c0debc34 <nbgl_trampoline_helper>

c0debb80 <nbgl_screenPush>:
c0debb80:	b403      	push	{r0, r1}
c0debb82:	f04f 009c 	mov.w	r0, #156	@ 0x9c
c0debb86:	f000 b855 	b.w	c0debc34 <nbgl_trampoline_helper>

c0debb8a <nbgl_screenRedraw>:
c0debb8a:	b403      	push	{r0, r1}
c0debb8c:	f04f 009d 	mov.w	r0, #157	@ 0x9d
c0debb90:	f000 b850 	b.w	c0debc34 <nbgl_trampoline_helper>

c0debb94 <nbgl_screenPop>:
c0debb94:	b403      	push	{r0, r1}
c0debb96:	f04f 009e 	mov.w	r0, #158	@ 0x9e
c0debb9a:	f000 b84b 	b.w	c0debc34 <nbgl_trampoline_helper>

c0debb9e <nbgl_screenUpdateTicker>:
c0debb9e:	b403      	push	{r0, r1}
c0debba0:	f04f 00a4 	mov.w	r0, #164	@ 0xa4
c0debba4:	f000 b846 	b.w	c0debc34 <nbgl_trampoline_helper>

c0debba8 <nbgl_screenHandler>:
c0debba8:	b403      	push	{r0, r1}
c0debbaa:	f04f 00a7 	mov.w	r0, #167	@ 0xa7
c0debbae:	f000 b841 	b.w	c0debc34 <nbgl_trampoline_helper>

c0debbb2 <nbgl_objPoolGet>:
c0debbb2:	b403      	push	{r0, r1}
c0debbb4:	f04f 00a8 	mov.w	r0, #168	@ 0xa8
c0debbb8:	f000 b83c 	b.w	c0debc34 <nbgl_trampoline_helper>

c0debbbc <nbgl_containerPoolGet>:
c0debbbc:	b403      	push	{r0, r1}
c0debbbe:	f04f 00aa 	mov.w	r0, #170	@ 0xaa
c0debbc2:	f000 b837 	b.w	c0debc34 <nbgl_trampoline_helper>

c0debbc6 <nbgl_getFont>:
c0debbc6:	b403      	push	{r0, r1}
c0debbc8:	f04f 00ac 	mov.w	r0, #172	@ 0xac
c0debbcc:	f000 b832 	b.w	c0debc34 <nbgl_trampoline_helper>

c0debbd0 <nbgl_getFontHeight>:
c0debbd0:	b403      	push	{r0, r1}
c0debbd2:	f04f 00ad 	mov.w	r0, #173	@ 0xad
c0debbd6:	f000 b82d 	b.w	c0debc34 <nbgl_trampoline_helper>

c0debbda <nbgl_getFontLineHeight>:
c0debbda:	b403      	push	{r0, r1}
c0debbdc:	f04f 00ae 	mov.w	r0, #174	@ 0xae
c0debbe0:	f000 b828 	b.w	c0debc34 <nbgl_trampoline_helper>

c0debbe4 <nbgl_getTextHeightInWidth>:
c0debbe4:	b403      	push	{r0, r1}
c0debbe6:	f04f 00b2 	mov.w	r0, #178	@ 0xb2
c0debbea:	f000 b823 	b.w	c0debc34 <nbgl_trampoline_helper>

c0debbee <nbgl_getTextNbLinesInWidth>:
c0debbee:	b403      	push	{r0, r1}
c0debbf0:	f04f 00b4 	mov.w	r0, #180	@ 0xb4
c0debbf4:	f000 b81e 	b.w	c0debc34 <nbgl_trampoline_helper>

c0debbf8 <nbgl_getTextWidth>:
c0debbf8:	b403      	push	{r0, r1}
c0debbfa:	f04f 00b6 	mov.w	r0, #182	@ 0xb6
c0debbfe:	f000 b819 	b.w	c0debc34 <nbgl_trampoline_helper>

c0debc02 <nbgl_getTextMaxLenInNbLines>:
c0debc02:	b403      	push	{r0, r1}
c0debc04:	f04f 00b7 	mov.w	r0, #183	@ 0xb7
c0debc08:	f000 b814 	b.w	c0debc34 <nbgl_trampoline_helper>

c0debc0c <nbgl_textReduceOnNbLines>:
c0debc0c:	b403      	push	{r0, r1}
c0debc0e:	f04f 00b8 	mov.w	r0, #184	@ 0xb8
c0debc12:	f000 b80f 	b.w	c0debc34 <nbgl_trampoline_helper>

c0debc16 <nbgl_touchHandler>:
c0debc16:	b403      	push	{r0, r1}
c0debc18:	f04f 00bb 	mov.w	r0, #187	@ 0xbb
c0debc1c:	f000 b80a 	b.w	c0debc34 <nbgl_trampoline_helper>

c0debc20 <nbgl_touchGetTouchDuration>:
c0debc20:	b403      	push	{r0, r1}
c0debc22:	f04f 00bc 	mov.w	r0, #188	@ 0xbc
c0debc26:	f000 b805 	b.w	c0debc34 <nbgl_trampoline_helper>
	...

c0debc2c <pic_init>:
c0debc2c:	b403      	push	{r0, r1}
c0debc2e:	f04f 00c4 	mov.w	r0, #196	@ 0xc4
c0debc32:	e7ff      	b.n	c0debc34 <nbgl_trampoline_helper>

c0debc34 <nbgl_trampoline_helper>:
c0debc34:	4900      	ldr	r1, [pc, #0]	@ (c0debc38 <nbgl_trampoline_helper+0x4>)
c0debc36:	4708      	bx	r1
c0debc38:	00808001 	.word	0x00808001

c0debc3c <os_boot>:
c0debc3c:	2000      	movs	r0, #0
c0debc3e:	f000 ba85 	b.w	c0dec14c <try_context_set>

c0debc42 <os_longjmp>:
c0debc42:	4604      	mov	r4, r0
c0debc44:	f000 fa7a 	bl	c0dec13c <try_context_get>
c0debc48:	4621      	mov	r1, r4
c0debc4a:	f000 fc0f 	bl	c0dec46c <longjmp>
	...

c0debc50 <snprintf>:
c0debc50:	b081      	sub	sp, #4
c0debc52:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0debc56:	b087      	sub	sp, #28
c0debc58:	2800      	cmp	r0, #0
c0debc5a:	930f      	str	r3, [sp, #60]	@ 0x3c
c0debc5c:	f000 817a 	beq.w	c0debf54 <snprintf+0x304>
c0debc60:	460d      	mov	r5, r1
c0debc62:	2900      	cmp	r1, #0
c0debc64:	f000 8176 	beq.w	c0debf54 <snprintf+0x304>
c0debc68:	4629      	mov	r1, r5
c0debc6a:	4616      	mov	r6, r2
c0debc6c:	4604      	mov	r4, r0
c0debc6e:	f000 fba3 	bl	c0dec3b8 <__aeabi_memclr>
c0debc72:	f1b5 0801 	subs.w	r8, r5, #1
c0debc76:	f000 816d 	beq.w	c0debf54 <snprintf+0x304>
c0debc7a:	a80f      	add	r0, sp, #60	@ 0x3c
c0debc7c:	9002      	str	r0, [sp, #8]
c0debc7e:	7830      	ldrb	r0, [r6, #0]
c0debc80:	2800      	cmp	r0, #0
c0debc82:	f000 8167 	beq.w	c0debf54 <snprintf+0x304>
c0debc86:	2700      	movs	r7, #0
c0debc88:	b128      	cbz	r0, c0debc96 <snprintf+0x46>
c0debc8a:	2825      	cmp	r0, #37	@ 0x25
c0debc8c:	d003      	beq.n	c0debc96 <snprintf+0x46>
c0debc8e:	19f0      	adds	r0, r6, r7
c0debc90:	3701      	adds	r7, #1
c0debc92:	7840      	ldrb	r0, [r0, #1]
c0debc94:	e7f8      	b.n	c0debc88 <snprintf+0x38>
c0debc96:	4547      	cmp	r7, r8
c0debc98:	bf28      	it	cs
c0debc9a:	4647      	movcs	r7, r8
c0debc9c:	4620      	mov	r0, r4
c0debc9e:	4631      	mov	r1, r6
c0debca0:	463a      	mov	r2, r7
c0debca2:	f000 fb81 	bl	c0dec3a8 <__aeabi_memmove>
c0debca6:	ebb8 0807 	subs.w	r8, r8, r7
c0debcaa:	f000 8153 	beq.w	c0debf54 <snprintf+0x304>
c0debcae:	5df1      	ldrb	r1, [r6, r7]
c0debcb0:	19f0      	adds	r0, r6, r7
c0debcb2:	443c      	add	r4, r7
c0debcb4:	4606      	mov	r6, r0
c0debcb6:	2925      	cmp	r1, #37	@ 0x25
c0debcb8:	d1e1      	bne.n	c0debc7e <snprintf+0x2e>
c0debcba:	1c41      	adds	r1, r0, #1
c0debcbc:	f04f 0b00 	mov.w	fp, #0
c0debcc0:	f04f 0e20 	mov.w	lr, #32
c0debcc4:	2500      	movs	r5, #0
c0debcc6:	2600      	movs	r6, #0
c0debcc8:	3101      	adds	r1, #1
c0debcca:	f811 3c01 	ldrb.w	r3, [r1, #-1]
c0debcce:	4632      	mov	r2, r6
c0debcd0:	3101      	adds	r1, #1
c0debcd2:	2600      	movs	r6, #0
c0debcd4:	2b2d      	cmp	r3, #45	@ 0x2d
c0debcd6:	d0f8      	beq.n	c0debcca <snprintf+0x7a>
c0debcd8:	f1a3 0630 	sub.w	r6, r3, #48	@ 0x30
c0debcdc:	2e0a      	cmp	r6, #10
c0debcde:	d313      	bcc.n	c0debd08 <snprintf+0xb8>
c0debce0:	2b25      	cmp	r3, #37	@ 0x25
c0debce2:	d046      	beq.n	c0debd72 <snprintf+0x122>
c0debce4:	2b2a      	cmp	r3, #42	@ 0x2a
c0debce6:	d01f      	beq.n	c0debd28 <snprintf+0xd8>
c0debce8:	2b2e      	cmp	r3, #46	@ 0x2e
c0debcea:	d129      	bne.n	c0debd40 <snprintf+0xf0>
c0debcec:	f811 2c01 	ldrb.w	r2, [r1, #-1]
c0debcf0:	2a2a      	cmp	r2, #42	@ 0x2a
c0debcf2:	d13c      	bne.n	c0debd6e <snprintf+0x11e>
c0debcf4:	780a      	ldrb	r2, [r1, #0]
c0debcf6:	2a48      	cmp	r2, #72	@ 0x48
c0debcf8:	d003      	beq.n	c0debd02 <snprintf+0xb2>
c0debcfa:	2a73      	cmp	r2, #115	@ 0x73
c0debcfc:	d001      	beq.n	c0debd02 <snprintf+0xb2>
c0debcfe:	2a68      	cmp	r2, #104	@ 0x68
c0debd00:	d135      	bne.n	c0debd6e <snprintf+0x11e>
c0debd02:	9a02      	ldr	r2, [sp, #8]
c0debd04:	2601      	movs	r6, #1
c0debd06:	e017      	b.n	c0debd38 <snprintf+0xe8>
c0debd08:	f083 0630 	eor.w	r6, r3, #48	@ 0x30
c0debd0c:	ea56 060b 	orrs.w	r6, r6, fp
c0debd10:	bf08      	it	eq
c0debd12:	f04f 0e30 	moveq.w	lr, #48	@ 0x30
c0debd16:	eb0b 068b 	add.w	r6, fp, fp, lsl #2
c0debd1a:	3901      	subs	r1, #1
c0debd1c:	eb03 0346 	add.w	r3, r3, r6, lsl #1
c0debd20:	4616      	mov	r6, r2
c0debd22:	f1a3 0b30 	sub.w	fp, r3, #48	@ 0x30
c0debd26:	e7cf      	b.n	c0debcc8 <snprintf+0x78>
c0debd28:	460b      	mov	r3, r1
c0debd2a:	f813 2d01 	ldrb.w	r2, [r3, #-1]!
c0debd2e:	2a73      	cmp	r2, #115	@ 0x73
c0debd30:	d11d      	bne.n	c0debd6e <snprintf+0x11e>
c0debd32:	9a02      	ldr	r2, [sp, #8]
c0debd34:	2602      	movs	r6, #2
c0debd36:	4619      	mov	r1, r3
c0debd38:	1d13      	adds	r3, r2, #4
c0debd3a:	9302      	str	r3, [sp, #8]
c0debd3c:	6815      	ldr	r5, [r2, #0]
c0debd3e:	e7c3      	b.n	c0debcc8 <snprintf+0x78>
c0debd40:	2b48      	cmp	r3, #72	@ 0x48
c0debd42:	d018      	beq.n	c0debd76 <snprintf+0x126>
c0debd44:	2b58      	cmp	r3, #88	@ 0x58
c0debd46:	d019      	beq.n	c0debd7c <snprintf+0x12c>
c0debd48:	2b63      	cmp	r3, #99	@ 0x63
c0debd4a:	d020      	beq.n	c0debd8e <snprintf+0x13e>
c0debd4c:	2b64      	cmp	r3, #100	@ 0x64
c0debd4e:	d02a      	beq.n	c0debda6 <snprintf+0x156>
c0debd50:	2b68      	cmp	r3, #104	@ 0x68
c0debd52:	d036      	beq.n	c0debdc2 <snprintf+0x172>
c0debd54:	2b70      	cmp	r3, #112	@ 0x70
c0debd56:	d006      	beq.n	c0debd66 <snprintf+0x116>
c0debd58:	2b73      	cmp	r3, #115	@ 0x73
c0debd5a:	d037      	beq.n	c0debdcc <snprintf+0x17c>
c0debd5c:	2b75      	cmp	r3, #117	@ 0x75
c0debd5e:	f000 8081 	beq.w	c0debe64 <snprintf+0x214>
c0debd62:	2b78      	cmp	r3, #120	@ 0x78
c0debd64:	d103      	bne.n	c0debd6e <snprintf+0x11e>
c0debd66:	9400      	str	r4, [sp, #0]
c0debd68:	f04f 0c00 	mov.w	ip, #0
c0debd6c:	e009      	b.n	c0debd82 <snprintf+0x132>
c0debd6e:	1e4e      	subs	r6, r1, #1
c0debd70:	e785      	b.n	c0debc7e <snprintf+0x2e>
c0debd72:	2025      	movs	r0, #37	@ 0x25
c0debd74:	e00f      	b.n	c0debd96 <snprintf+0x146>
c0debd76:	487b      	ldr	r0, [pc, #492]	@ (c0debf64 <snprintf+0x314>)
c0debd78:	4478      	add	r0, pc
c0debd7a:	e024      	b.n	c0debdc6 <snprintf+0x176>
c0debd7c:	f04f 0c01 	mov.w	ip, #1
c0debd80:	9400      	str	r4, [sp, #0]
c0debd82:	9a02      	ldr	r2, [sp, #8]
c0debd84:	2400      	movs	r4, #0
c0debd86:	1d13      	adds	r3, r2, #4
c0debd88:	9302      	str	r3, [sp, #8]
c0debd8a:	2310      	movs	r3, #16
c0debd8c:	e072      	b.n	c0debe74 <snprintf+0x224>
c0debd8e:	9802      	ldr	r0, [sp, #8]
c0debd90:	1d02      	adds	r2, r0, #4
c0debd92:	9202      	str	r2, [sp, #8]
c0debd94:	6800      	ldr	r0, [r0, #0]
c0debd96:	1e4e      	subs	r6, r1, #1
c0debd98:	f804 0b01 	strb.w	r0, [r4], #1
c0debd9c:	f1b8 0801 	subs.w	r8, r8, #1
c0debda0:	f47f af6d 	bne.w	c0debc7e <snprintf+0x2e>
c0debda4:	e0d6      	b.n	c0debf54 <snprintf+0x304>
c0debda6:	9a02      	ldr	r2, [sp, #8]
c0debda8:	9400      	str	r4, [sp, #0]
c0debdaa:	1d13      	adds	r3, r2, #4
c0debdac:	9302      	str	r3, [sp, #8]
c0debdae:	6813      	ldr	r3, [r2, #0]
c0debdb0:	2b00      	cmp	r3, #0
c0debdb2:	461a      	mov	r2, r3
c0debdb4:	d500      	bpl.n	c0debdb8 <snprintf+0x168>
c0debdb6:	425a      	negs	r2, r3
c0debdb8:	0fdc      	lsrs	r4, r3, #31
c0debdba:	f04f 0c00 	mov.w	ip, #0
c0debdbe:	230a      	movs	r3, #10
c0debdc0:	e059      	b.n	c0debe76 <snprintf+0x226>
c0debdc2:	4869      	ldr	r0, [pc, #420]	@ (c0debf68 <snprintf+0x318>)
c0debdc4:	4478      	add	r0, pc
c0debdc6:	f04f 0c01 	mov.w	ip, #1
c0debdca:	e003      	b.n	c0debdd4 <snprintf+0x184>
c0debdcc:	4864      	ldr	r0, [pc, #400]	@ (c0debf60 <snprintf+0x310>)
c0debdce:	f04f 0c00 	mov.w	ip, #0
c0debdd2:	4478      	add	r0, pc
c0debdd4:	9b02      	ldr	r3, [sp, #8]
c0debdd6:	b2d2      	uxtb	r2, r2
c0debdd8:	1d1e      	adds	r6, r3, #4
c0debdda:	9602      	str	r6, [sp, #8]
c0debddc:	1e4e      	subs	r6, r1, #1
c0debdde:	6819      	ldr	r1, [r3, #0]
c0debde0:	2a02      	cmp	r2, #2
c0debde2:	f000 80a7 	beq.w	c0debf34 <snprintf+0x2e4>
c0debde6:	2a01      	cmp	r2, #1
c0debde8:	d007      	beq.n	c0debdfa <snprintf+0x1aa>
c0debdea:	463d      	mov	r5, r7
c0debdec:	b92a      	cbnz	r2, c0debdfa <snprintf+0x1aa>
c0debdee:	2200      	movs	r2, #0
c0debdf0:	5c8b      	ldrb	r3, [r1, r2]
c0debdf2:	3201      	adds	r2, #1
c0debdf4:	2b00      	cmp	r3, #0
c0debdf6:	d1fb      	bne.n	c0debdf0 <snprintf+0x1a0>
c0debdf8:	1e55      	subs	r5, r2, #1
c0debdfa:	f1bc 0f00 	cmp.w	ip, #0
c0debdfe:	d016      	beq.n	c0debe2e <snprintf+0x1de>
c0debe00:	2d00      	cmp	r5, #0
c0debe02:	f43f af3c 	beq.w	c0debc7e <snprintf+0x2e>
c0debe06:	f1b8 0f02 	cmp.w	r8, #2
c0debe0a:	f0c0 80a3 	bcc.w	c0debf54 <snprintf+0x304>
c0debe0e:	780a      	ldrb	r2, [r1, #0]
c0debe10:	0913      	lsrs	r3, r2, #4
c0debe12:	f002 020f 	and.w	r2, r2, #15
c0debe16:	5cc3      	ldrb	r3, [r0, r3]
c0debe18:	f1b8 0802 	subs.w	r8, r8, #2
c0debe1c:	7023      	strb	r3, [r4, #0]
c0debe1e:	5c82      	ldrb	r2, [r0, r2]
c0debe20:	7062      	strb	r2, [r4, #1]
c0debe22:	f000 8097 	beq.w	c0debf54 <snprintf+0x304>
c0debe26:	3101      	adds	r1, #1
c0debe28:	3d01      	subs	r5, #1
c0debe2a:	3402      	adds	r4, #2
c0debe2c:	e7e8      	b.n	c0debe00 <snprintf+0x1b0>
c0debe2e:	4545      	cmp	r5, r8
c0debe30:	bf28      	it	cs
c0debe32:	4645      	movcs	r5, r8
c0debe34:	4620      	mov	r0, r4
c0debe36:	462a      	mov	r2, r5
c0debe38:	f000 fab6 	bl	c0dec3a8 <__aeabi_memmove>
c0debe3c:	ebb8 0805 	subs.w	r8, r8, r5
c0debe40:	f000 8088 	beq.w	c0debf54 <snprintf+0x304>
c0debe44:	462f      	mov	r7, r5
c0debe46:	442c      	add	r4, r5
c0debe48:	45bb      	cmp	fp, r7
c0debe4a:	f67f af18 	bls.w	c0debc7e <snprintf+0x2e>
c0debe4e:	ebab 0507 	sub.w	r5, fp, r7
c0debe52:	4620      	mov	r0, r4
c0debe54:	4545      	cmp	r5, r8
c0debe56:	bf28      	it	cs
c0debe58:	4645      	movcs	r5, r8
c0debe5a:	4629      	mov	r1, r5
c0debe5c:	2220      	movs	r2, #32
c0debe5e:	f000 faa5 	bl	c0dec3ac <__aeabi_memset>
c0debe62:	e061      	b.n	c0debf28 <snprintf+0x2d8>
c0debe64:	9a02      	ldr	r2, [sp, #8]
c0debe66:	9400      	str	r4, [sp, #0]
c0debe68:	2400      	movs	r4, #0
c0debe6a:	f04f 0c00 	mov.w	ip, #0
c0debe6e:	1d13      	adds	r3, r2, #4
c0debe70:	9302      	str	r3, [sp, #8]
c0debe72:	230a      	movs	r3, #10
c0debe74:	6812      	ldr	r2, [r2, #0]
c0debe76:	483d      	ldr	r0, [pc, #244]	@ (c0debf6c <snprintf+0x31c>)
c0debe78:	1e4e      	subs	r6, r1, #1
c0debe7a:	f04f 0a01 	mov.w	sl, #1
c0debe7e:	4478      	add	r0, pc
c0debe80:	9001      	str	r0, [sp, #4]
c0debe82:	fba3 570a 	umull	r5, r7, r3, sl
c0debe86:	2f00      	cmp	r7, #0
c0debe88:	bf18      	it	ne
c0debe8a:	2701      	movne	r7, #1
c0debe8c:	4295      	cmp	r5, r2
c0debe8e:	d804      	bhi.n	c0debe9a <snprintf+0x24a>
c0debe90:	b91f      	cbnz	r7, c0debe9a <snprintf+0x24a>
c0debe92:	f1ab 0b01 	sub.w	fp, fp, #1
c0debe96:	46aa      	mov	sl, r5
c0debe98:	e7f3      	b.n	c0debe82 <snprintf+0x232>
c0debe9a:	2c00      	cmp	r4, #0
c0debe9c:	4627      	mov	r7, r4
c0debe9e:	f04f 0500 	mov.w	r5, #0
c0debea2:	bf18      	it	ne
c0debea4:	f04f 37ff 	movne.w	r7, #4294967295	@ 0xffffffff
c0debea8:	d00d      	beq.n	c0debec6 <snprintf+0x276>
c0debeaa:	4660      	mov	r0, ip
c0debeac:	fa5f fc8e 	uxtb.w	ip, lr
c0debeb0:	a903      	add	r1, sp, #12
c0debeb2:	f1bc 0f30 	cmp.w	ip, #48	@ 0x30
c0debeb6:	4684      	mov	ip, r0
c0debeb8:	d106      	bne.n	c0debec8 <snprintf+0x278>
c0debeba:	202d      	movs	r0, #45	@ 0x2d
c0debebc:	2400      	movs	r4, #0
c0debebe:	2501      	movs	r5, #1
c0debec0:	f88d 000c 	strb.w	r0, [sp, #12]
c0debec4:	e000      	b.n	c0debec8 <snprintf+0x278>
c0debec6:	a903      	add	r1, sp, #12
c0debec8:	eb07 000b 	add.w	r0, r7, fp
c0debecc:	3802      	subs	r0, #2
c0debece:	280d      	cmp	r0, #13
c0debed0:	d808      	bhi.n	c0debee4 <snprintf+0x294>
c0debed2:	f1c7 0701 	rsb	r7, r7, #1
c0debed6:	45bb      	cmp	fp, r7
c0debed8:	d004      	beq.n	c0debee4 <snprintf+0x294>
c0debeda:	f801 e005 	strb.w	lr, [r1, r5]
c0debede:	3701      	adds	r7, #1
c0debee0:	3501      	adds	r5, #1
c0debee2:	e7f8      	b.n	c0debed6 <snprintf+0x286>
c0debee4:	9f01      	ldr	r7, [sp, #4]
c0debee6:	b114      	cbz	r4, c0debeee <snprintf+0x29e>
c0debee8:	202d      	movs	r0, #45	@ 0x2d
c0debeea:	5548      	strb	r0, [r1, r5]
c0debeec:	3501      	adds	r5, #1
c0debeee:	4820      	ldr	r0, [pc, #128]	@ (c0debf70 <snprintf+0x320>)
c0debef0:	f1bc 0f00 	cmp.w	ip, #0
c0debef4:	4478      	add	r0, pc
c0debef6:	bf08      	it	eq
c0debef8:	4638      	moveq	r0, r7
c0debefa:	f1ba 0f00 	cmp.w	sl, #0
c0debefe:	d00b      	beq.n	c0debf18 <snprintf+0x2c8>
c0debf00:	fbb2 f7fa 	udiv	r7, r2, sl
c0debf04:	fbba faf3 	udiv	sl, sl, r3
c0debf08:	fbb7 f4f3 	udiv	r4, r7, r3
c0debf0c:	fb04 7413 	mls	r4, r4, r3, r7
c0debf10:	5d04      	ldrb	r4, [r0, r4]
c0debf12:	554c      	strb	r4, [r1, r5]
c0debf14:	3501      	adds	r5, #1
c0debf16:	e7f0      	b.n	c0debefa <snprintf+0x2aa>
c0debf18:	4545      	cmp	r5, r8
c0debf1a:	bf28      	it	cs
c0debf1c:	4645      	movcs	r5, r8
c0debf1e:	9c00      	ldr	r4, [sp, #0]
c0debf20:	462a      	mov	r2, r5
c0debf22:	4620      	mov	r0, r4
c0debf24:	f000 fa40 	bl	c0dec3a8 <__aeabi_memmove>
c0debf28:	ebb8 0805 	subs.w	r8, r8, r5
c0debf2c:	442c      	add	r4, r5
c0debf2e:	f47f aea6 	bne.w	c0debc7e <snprintf+0x2e>
c0debf32:	e00f      	b.n	c0debf54 <snprintf+0x304>
c0debf34:	7808      	ldrb	r0, [r1, #0]
c0debf36:	2800      	cmp	r0, #0
c0debf38:	f47f aea1 	bne.w	c0debc7e <snprintf+0x2e>
c0debf3c:	4545      	cmp	r5, r8
c0debf3e:	bf28      	it	cs
c0debf40:	4645      	movcs	r5, r8
c0debf42:	4620      	mov	r0, r4
c0debf44:	4629      	mov	r1, r5
c0debf46:	2220      	movs	r2, #32
c0debf48:	f000 fa30 	bl	c0dec3ac <__aeabi_memset>
c0debf4c:	ebb8 0805 	subs.w	r8, r8, r5
c0debf50:	f47f af79 	bne.w	c0debe46 <snprintf+0x1f6>
c0debf54:	2000      	movs	r0, #0
c0debf56:	b007      	add	sp, #28
c0debf58:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0debf5c:	b001      	add	sp, #4
c0debf5e:	4770      	bx	lr
c0debf60:	000039da 	.word	0x000039da
c0debf64:	00003a74 	.word	0x00003a74
c0debf68:	000039e8 	.word	0x000039e8
c0debf6c:	0000392e 	.word	0x0000392e
c0debf70:	000038f8 	.word	0x000038f8

c0debf74 <pic>:
c0debf74:	4a0a      	ldr	r2, [pc, #40]	@ (c0debfa0 <pic+0x2c>)
c0debf76:	4282      	cmp	r2, r0
c0debf78:	490a      	ldr	r1, [pc, #40]	@ (c0debfa4 <pic+0x30>)
c0debf7a:	d806      	bhi.n	c0debf8a <pic+0x16>
c0debf7c:	4281      	cmp	r1, r0
c0debf7e:	d304      	bcc.n	c0debf8a <pic+0x16>
c0debf80:	b580      	push	{r7, lr}
c0debf82:	f000 f815 	bl	c0debfb0 <pic_internal>
c0debf86:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0debf8a:	4907      	ldr	r1, [pc, #28]	@ (c0debfa8 <pic+0x34>)
c0debf8c:	4288      	cmp	r0, r1
c0debf8e:	4a07      	ldr	r2, [pc, #28]	@ (c0debfac <pic+0x38>)
c0debf90:	d304      	bcc.n	c0debf9c <pic+0x28>
c0debf92:	4290      	cmp	r0, r2
c0debf94:	d802      	bhi.n	c0debf9c <pic+0x28>
c0debf96:	1a40      	subs	r0, r0, r1
c0debf98:	4649      	mov	r1, r9
c0debf9a:	4408      	add	r0, r1
c0debf9c:	4770      	bx	lr
c0debf9e:	0000      	movs	r0, r0
c0debfa0:	c0de0000 	.word	0xc0de0000
c0debfa4:	c0defd68 	.word	0xc0defd68
c0debfa8:	da7a0000 	.word	0xda7a0000
c0debfac:	da7a9000 	.word	0xda7a9000

c0debfb0 <pic_internal>:
c0debfb0:	467a      	mov	r2, pc
c0debfb2:	4902      	ldr	r1, [pc, #8]	@ (c0debfbc <pic_internal+0xc>)
c0debfb4:	1cc9      	adds	r1, r1, #3
c0debfb6:	1a89      	subs	r1, r1, r2
c0debfb8:	1a40      	subs	r0, r0, r1
c0debfba:	4770      	bx	lr
c0debfbc:	c0debfb1 	.word	0xc0debfb1

c0debfc0 <SVC_Call>:
c0debfc0:	df01      	svc	1
c0debfc2:	2900      	cmp	r1, #0
c0debfc4:	d100      	bne.n	c0debfc8 <exception>
c0debfc6:	4770      	bx	lr

c0debfc8 <exception>:
c0debfc8:	4608      	mov	r0, r1
c0debfca:	f7ff fe3a 	bl	c0debc42 <os_longjmp>
	...

c0debfd0 <SVC_cx_call>:
c0debfd0:	df01      	svc	1
c0debfd2:	4770      	bx	lr

c0debfd4 <nbgl_wait_pipeline>:
c0debfd4:	b5e0      	push	{r5, r6, r7, lr}
c0debfd6:	2000      	movs	r0, #0
c0debfd8:	9001      	str	r0, [sp, #4]
c0debfda:	4802      	ldr	r0, [pc, #8]	@ (c0debfe4 <nbgl_wait_pipeline+0x10>)
c0debfdc:	a901      	add	r1, sp, #4
c0debfde:	f7ff ffef 	bl	c0debfc0 <SVC_Call>
c0debfe2:	bd8c      	pop	{r2, r3, r7, pc}
c0debfe4:	00fa0011 	.word	0x00fa0011

c0debfe8 <nvm_write>:
c0debfe8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0debfea:	ab01      	add	r3, sp, #4
c0debfec:	c307      	stmia	r3!, {r0, r1, r2}
c0debfee:	4802      	ldr	r0, [pc, #8]	@ (c0debff8 <nvm_write+0x10>)
c0debff0:	a901      	add	r1, sp, #4
c0debff2:	f7ff ffe5 	bl	c0debfc0 <SVC_Call>
c0debff6:	bd8f      	pop	{r0, r1, r2, r3, r7, pc}
c0debff8:	03000003 	.word	0x03000003

c0debffc <cx_ecdomain_parameters_length>:
c0debffc:	b5e0      	push	{r5, r6, r7, lr}
c0debffe:	e9cd 0100 	strd	r0, r1, [sp]
c0dec002:	4802      	ldr	r0, [pc, #8]	@ (c0dec00c <cx_ecdomain_parameters_length+0x10>)
c0dec004:	4669      	mov	r1, sp
c0dec006:	f7ff ffe3 	bl	c0debfd0 <SVC_cx_call>
c0dec00a:	bd8c      	pop	{r2, r3, r7, pc}
c0dec00c:	0200012f 	.word	0x0200012f

c0dec010 <os_perso_derive_node_with_seed_key>:
c0dec010:	b510      	push	{r4, lr}
c0dec012:	b088      	sub	sp, #32
c0dec014:	9c0d      	ldr	r4, [sp, #52]	@ 0x34
c0dec016:	9407      	str	r4, [sp, #28]
c0dec018:	9c0c      	ldr	r4, [sp, #48]	@ 0x30
c0dec01a:	9406      	str	r4, [sp, #24]
c0dec01c:	9c0b      	ldr	r4, [sp, #44]	@ 0x2c
c0dec01e:	9405      	str	r4, [sp, #20]
c0dec020:	9c0a      	ldr	r4, [sp, #40]	@ 0x28
c0dec022:	e88d 001f 	stmia.w	sp, {r0, r1, r2, r3, r4}
c0dec026:	4803      	ldr	r0, [pc, #12]	@ (c0dec034 <os_perso_derive_node_with_seed_key+0x24>)
c0dec028:	4669      	mov	r1, sp
c0dec02a:	f7ff ffc9 	bl	c0debfc0 <SVC_Call>
c0dec02e:	b008      	add	sp, #32
c0dec030:	bd10      	pop	{r4, pc}
c0dec032:	bf00      	nop
c0dec034:	080000a6 	.word	0x080000a6

c0dec038 <os_pki_load_certificate>:
c0dec038:	b510      	push	{r4, lr}
c0dec03a:	b086      	sub	sp, #24
c0dec03c:	9c09      	ldr	r4, [sp, #36]	@ 0x24
c0dec03e:	9405      	str	r4, [sp, #20]
c0dec040:	9c08      	ldr	r4, [sp, #32]
c0dec042:	e88d 001f 	stmia.w	sp, {r0, r1, r2, r3, r4}
c0dec046:	4803      	ldr	r0, [pc, #12]	@ (c0dec054 <os_pki_load_certificate+0x1c>)
c0dec048:	4669      	mov	r1, sp
c0dec04a:	f7ff ffb9 	bl	c0debfc0 <SVC_Call>
c0dec04e:	b006      	add	sp, #24
c0dec050:	bd10      	pop	{r4, pc}
c0dec052:	bf00      	nop
c0dec054:	060000aa 	.word	0x060000aa

c0dec058 <os_perso_is_pin_set>:
c0dec058:	b5e0      	push	{r5, r6, r7, lr}
c0dec05a:	2000      	movs	r0, #0
c0dec05c:	4669      	mov	r1, sp
c0dec05e:	9001      	str	r0, [sp, #4]
c0dec060:	209e      	movs	r0, #158	@ 0x9e
c0dec062:	f7ff ffad 	bl	c0debfc0 <SVC_Call>
c0dec066:	b2c0      	uxtb	r0, r0
c0dec068:	bd8c      	pop	{r2, r3, r7, pc}

c0dec06a <os_global_pin_is_validated>:
c0dec06a:	b5e0      	push	{r5, r6, r7, lr}
c0dec06c:	2000      	movs	r0, #0
c0dec06e:	4669      	mov	r1, sp
c0dec070:	9001      	str	r0, [sp, #4]
c0dec072:	20a0      	movs	r0, #160	@ 0xa0
c0dec074:	f7ff ffa4 	bl	c0debfc0 <SVC_Call>
c0dec078:	b2c0      	uxtb	r0, r0
c0dec07a:	bd8c      	pop	{r2, r3, r7, pc}

c0dec07c <os_ux>:
c0dec07c:	b5e0      	push	{r5, r6, r7, lr}
c0dec07e:	f000 f885 	bl	c0dec18c <OUTLINED_FUNCTION_0>
c0dec082:	4802      	ldr	r0, [pc, #8]	@ (c0dec08c <os_ux+0x10>)
c0dec084:	4669      	mov	r1, sp
c0dec086:	f7ff ff9b 	bl	c0debfc0 <SVC_Call>
c0dec08a:	bd8c      	pop	{r2, r3, r7, pc}
c0dec08c:	01000064 	.word	0x01000064

c0dec090 <os_flags>:
c0dec090:	b5e0      	push	{r5, r6, r7, lr}
c0dec092:	2000      	movs	r0, #0
c0dec094:	4669      	mov	r1, sp
c0dec096:	9001      	str	r0, [sp, #4]
c0dec098:	206a      	movs	r0, #106	@ 0x6a
c0dec09a:	f7ff ff91 	bl	c0debfc0 <SVC_Call>
c0dec09e:	bd8c      	pop	{r2, r3, r7, pc}

c0dec0a0 <os_setting_get>:
c0dec0a0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0dec0a2:	ab01      	add	r3, sp, #4
c0dec0a4:	c307      	stmia	r3!, {r0, r1, r2}
c0dec0a6:	4803      	ldr	r0, [pc, #12]	@ (c0dec0b4 <os_setting_get+0x14>)
c0dec0a8:	a901      	add	r1, sp, #4
c0dec0aa:	f7ff ff89 	bl	c0debfc0 <SVC_Call>
c0dec0ae:	b004      	add	sp, #16
c0dec0b0:	bd80      	pop	{r7, pc}
c0dec0b2:	bf00      	nop
c0dec0b4:	03000070 	.word	0x03000070

c0dec0b8 <os_registry_get_current_app_tag>:
c0dec0b8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0dec0ba:	ab01      	add	r3, sp, #4
c0dec0bc:	c307      	stmia	r3!, {r0, r1, r2}
c0dec0be:	4803      	ldr	r0, [pc, #12]	@ (c0dec0cc <os_registry_get_current_app_tag+0x14>)
c0dec0c0:	a901      	add	r1, sp, #4
c0dec0c2:	f7ff ff7d 	bl	c0debfc0 <SVC_Call>
c0dec0c6:	b004      	add	sp, #16
c0dec0c8:	bd80      	pop	{r7, pc}
c0dec0ca:	bf00      	nop
c0dec0cc:	03000074 	.word	0x03000074

c0dec0d0 <os_sched_exit>:
c0dec0d0:	b082      	sub	sp, #8
c0dec0d2:	f000 f85b 	bl	c0dec18c <OUTLINED_FUNCTION_0>
c0dec0d6:	4802      	ldr	r0, [pc, #8]	@ (c0dec0e0 <os_sched_exit+0x10>)
c0dec0d8:	4669      	mov	r1, sp
c0dec0da:	f7ff ff71 	bl	c0debfc0 <SVC_Call>
c0dec0de:	deff      	udf	#255	@ 0xff
c0dec0e0:	0100009a 	.word	0x0100009a

c0dec0e4 <os_io_init>:
c0dec0e4:	b5e0      	push	{r5, r6, r7, lr}
c0dec0e6:	9001      	str	r0, [sp, #4]
c0dec0e8:	4802      	ldr	r0, [pc, #8]	@ (c0dec0f4 <os_io_init+0x10>)
c0dec0ea:	a901      	add	r1, sp, #4
c0dec0ec:	f7ff ff68 	bl	c0debfc0 <SVC_Call>
c0dec0f0:	bd8c      	pop	{r2, r3, r7, pc}
c0dec0f2:	bf00      	nop
c0dec0f4:	01000084 	.word	0x01000084

c0dec0f8 <os_io_start>:
c0dec0f8:	b5e0      	push	{r5, r6, r7, lr}
c0dec0fa:	2000      	movs	r0, #0
c0dec0fc:	4669      	mov	r1, sp
c0dec0fe:	9001      	str	r0, [sp, #4]
c0dec100:	4801      	ldr	r0, [pc, #4]	@ (c0dec108 <os_io_start+0x10>)
c0dec102:	f7ff ff5d 	bl	c0debfc0 <SVC_Call>
c0dec106:	bd8c      	pop	{r2, r3, r7, pc}
c0dec108:	01000085 	.word	0x01000085

c0dec10c <os_io_tx_cmd>:
c0dec10c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0dec10e:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0dec112:	4803      	ldr	r0, [pc, #12]	@ (c0dec120 <os_io_tx_cmd+0x14>)
c0dec114:	4669      	mov	r1, sp
c0dec116:	f7ff ff53 	bl	c0debfc0 <SVC_Call>
c0dec11a:	b004      	add	sp, #16
c0dec11c:	bd80      	pop	{r7, pc}
c0dec11e:	bf00      	nop
c0dec120:	04000088 	.word	0x04000088

c0dec124 <os_io_rx_evt>:
c0dec124:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0dec126:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0dec12a:	4803      	ldr	r0, [pc, #12]	@ (c0dec138 <os_io_rx_evt+0x14>)
c0dec12c:	4669      	mov	r1, sp
c0dec12e:	f7ff ff47 	bl	c0debfc0 <SVC_Call>
c0dec132:	b004      	add	sp, #16
c0dec134:	bd80      	pop	{r7, pc}
c0dec136:	bf00      	nop
c0dec138:	03000089 	.word	0x03000089

c0dec13c <try_context_get>:
c0dec13c:	b5e0      	push	{r5, r6, r7, lr}
c0dec13e:	2000      	movs	r0, #0
c0dec140:	4669      	mov	r1, sp
c0dec142:	9001      	str	r0, [sp, #4]
c0dec144:	2087      	movs	r0, #135	@ 0x87
c0dec146:	f7ff ff3b 	bl	c0debfc0 <SVC_Call>
c0dec14a:	bd8c      	pop	{r2, r3, r7, pc}

c0dec14c <try_context_set>:
c0dec14c:	b5e0      	push	{r5, r6, r7, lr}
c0dec14e:	f000 f81d 	bl	c0dec18c <OUTLINED_FUNCTION_0>
c0dec152:	4802      	ldr	r0, [pc, #8]	@ (c0dec15c <try_context_set+0x10>)
c0dec154:	4669      	mov	r1, sp
c0dec156:	f7ff ff33 	bl	c0debfc0 <SVC_Call>
c0dec15a:	bd8c      	pop	{r2, r3, r7, pc}
c0dec15c:	0100010b 	.word	0x0100010b

c0dec160 <os_sched_last_status>:
c0dec160:	b5e0      	push	{r5, r6, r7, lr}
c0dec162:	f000 f813 	bl	c0dec18c <OUTLINED_FUNCTION_0>
c0dec166:	4803      	ldr	r0, [pc, #12]	@ (c0dec174 <os_sched_last_status+0x14>)
c0dec168:	4669      	mov	r1, sp
c0dec16a:	f7ff ff29 	bl	c0debfc0 <SVC_Call>
c0dec16e:	b2c0      	uxtb	r0, r0
c0dec170:	bd8c      	pop	{r2, r3, r7, pc}
c0dec172:	bf00      	nop
c0dec174:	0100009c 	.word	0x0100009c

c0dec178 <touch_get_last_info>:
c0dec178:	b5e0      	push	{r5, r6, r7, lr}
c0dec17a:	9001      	str	r0, [sp, #4]
c0dec17c:	4802      	ldr	r0, [pc, #8]	@ (c0dec188 <touch_get_last_info+0x10>)
c0dec17e:	a901      	add	r1, sp, #4
c0dec180:	f7ff ff1e 	bl	c0debfc0 <SVC_Call>
c0dec184:	bd8c      	pop	{r2, r3, r7, pc}
c0dec186:	bf00      	nop
c0dec188:	01fa000b 	.word	0x01fa000b

c0dec18c <OUTLINED_FUNCTION_0>:
c0dec18c:	2100      	movs	r1, #0
c0dec18e:	e9cd 0100 	strd	r0, r1, [sp]
c0dec192:	4770      	bx	lr

c0dec194 <__aeabi_llsl>:
c0dec194:	0693      	lsls	r3, r2, #26
c0dec196:	d408      	bmi.n	c0dec1aa <__aeabi_llsl+0x16>
c0dec198:	b132      	cbz	r2, c0dec1a8 <__aeabi_llsl+0x14>
c0dec19a:	f1c2 0320 	rsb	r3, r2, #32
c0dec19e:	4091      	lsls	r1, r2
c0dec1a0:	fa20 f303 	lsr.w	r3, r0, r3
c0dec1a4:	4090      	lsls	r0, r2
c0dec1a6:	4319      	orrs	r1, r3
c0dec1a8:	4770      	bx	lr
c0dec1aa:	f1a2 0120 	sub.w	r1, r2, #32
c0dec1ae:	fa00 f101 	lsl.w	r1, r0, r1
c0dec1b2:	2000      	movs	r0, #0
c0dec1b4:	4770      	bx	lr
	...

c0dec1b8 <__aeabi_llsr>:
c0dec1b8:	0693      	lsls	r3, r2, #26
c0dec1ba:	d408      	bmi.n	c0dec1ce <__aeabi_llsr+0x16>
c0dec1bc:	b132      	cbz	r2, c0dec1cc <__aeabi_llsr+0x14>
c0dec1be:	f1c2 0320 	rsb	r3, r2, #32
c0dec1c2:	40d0      	lsrs	r0, r2
c0dec1c4:	fa01 f303 	lsl.w	r3, r1, r3
c0dec1c8:	40d1      	lsrs	r1, r2
c0dec1ca:	4318      	orrs	r0, r3
c0dec1cc:	4770      	bx	lr
c0dec1ce:	f1a2 0020 	sub.w	r0, r2, #32
c0dec1d2:	fa21 f000 	lsr.w	r0, r1, r0
c0dec1d6:	2100      	movs	r1, #0
c0dec1d8:	4770      	bx	lr
	...

c0dec1dc <__udivmoddi4>:
c0dec1dc:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dec1e0:	f8dd c020 	ldr.w	ip, [sp, #32]
c0dec1e4:	4604      	mov	r4, r0
c0dec1e6:	b179      	cbz	r1, c0dec208 <__udivmoddi4+0x2c>
c0dec1e8:	b1ba      	cbz	r2, c0dec21a <__udivmoddi4+0x3e>
c0dec1ea:	b35b      	cbz	r3, c0dec244 <__udivmoddi4+0x68>
c0dec1ec:	fab1 f581 	clz	r5, r1
c0dec1f0:	fab3 f683 	clz	r6, r3
c0dec1f4:	1b75      	subs	r5, r6, r5
c0dec1f6:	2d20      	cmp	r5, #32
c0dec1f8:	d34a      	bcc.n	c0dec290 <__udivmoddi4+0xb4>
c0dec1fa:	f1bc 0f00 	cmp.w	ip, #0
c0dec1fe:	bf18      	it	ne
c0dec200:	e9cc 4100 	strdne	r4, r1, [ip]
c0dec204:	2400      	movs	r4, #0
c0dec206:	e066      	b.n	c0dec2d6 <__udivmoddi4+0xfa>
c0dec208:	b3cb      	cbz	r3, c0dec27e <__udivmoddi4+0xa2>
c0dec20a:	2100      	movs	r1, #0
c0dec20c:	f1bc 0f00 	cmp.w	ip, #0
c0dec210:	bf18      	it	ne
c0dec212:	e9cc 4100 	strdne	r4, r1, [ip]
c0dec216:	2400      	movs	r4, #0
c0dec218:	e0a6      	b.n	c0dec368 <__udivmoddi4+0x18c>
c0dec21a:	2b00      	cmp	r3, #0
c0dec21c:	d03e      	beq.n	c0dec29c <__udivmoddi4+0xc0>
c0dec21e:	2800      	cmp	r0, #0
c0dec220:	d04f      	beq.n	c0dec2c2 <__udivmoddi4+0xe6>
c0dec222:	1e5d      	subs	r5, r3, #1
c0dec224:	422b      	tst	r3, r5
c0dec226:	d158      	bne.n	c0dec2da <__udivmoddi4+0xfe>
c0dec228:	f1bc 0f00 	cmp.w	ip, #0
c0dec22c:	bf1c      	itt	ne
c0dec22e:	ea05 0001 	andne.w	r0, r5, r1
c0dec232:	e9cc 4000 	strdne	r4, r0, [ip]
c0dec236:	fa93 f0a3 	rbit	r0, r3
c0dec23a:	fab0 f080 	clz	r0, r0
c0dec23e:	fa21 f400 	lsr.w	r4, r1, r0
c0dec242:	e048      	b.n	c0dec2d6 <__udivmoddi4+0xfa>
c0dec244:	1e55      	subs	r5, r2, #1
c0dec246:	422a      	tst	r2, r5
c0dec248:	d129      	bne.n	c0dec29e <__udivmoddi4+0xc2>
c0dec24a:	f1bc 0f00 	cmp.w	ip, #0
c0dec24e:	bf1e      	ittt	ne
c0dec250:	2300      	movne	r3, #0
c0dec252:	4005      	andne	r5, r0
c0dec254:	e9cc 5300 	strdne	r5, r3, [ip]
c0dec258:	2a01      	cmp	r2, #1
c0dec25a:	f000 8085 	beq.w	c0dec368 <__udivmoddi4+0x18c>
c0dec25e:	fa92 f2a2 	rbit	r2, r2
c0dec262:	004c      	lsls	r4, r1, #1
c0dec264:	fab2 f282 	clz	r2, r2
c0dec268:	f002 031f 	and.w	r3, r2, #31
c0dec26c:	40d1      	lsrs	r1, r2
c0dec26e:	40d8      	lsrs	r0, r3
c0dec270:	231f      	movs	r3, #31
c0dec272:	4393      	bics	r3, r2
c0dec274:	fa04 f303 	lsl.w	r3, r4, r3
c0dec278:	ea43 0400 	orr.w	r4, r3, r0
c0dec27c:	e074      	b.n	c0dec368 <__udivmoddi4+0x18c>
c0dec27e:	fbb0 f4f2 	udiv	r4, r0, r2
c0dec282:	f1bc 0f00 	cmp.w	ip, #0
c0dec286:	d026      	beq.n	c0dec2d6 <__udivmoddi4+0xfa>
c0dec288:	fb04 0012 	mls	r0, r4, r2, r0
c0dec28c:	2100      	movs	r1, #0
c0dec28e:	e020      	b.n	c0dec2d2 <__udivmoddi4+0xf6>
c0dec290:	f105 0e01 	add.w	lr, r5, #1
c0dec294:	f1be 0f20 	cmp.w	lr, #32
c0dec298:	d00b      	beq.n	c0dec2b2 <__udivmoddi4+0xd6>
c0dec29a:	e028      	b.n	c0dec2ee <__udivmoddi4+0x112>
c0dec29c:	e064      	b.n	c0dec368 <__udivmoddi4+0x18c>
c0dec29e:	fab1 f481 	clz	r4, r1
c0dec2a2:	fab2 f582 	clz	r5, r2
c0dec2a6:	1b2c      	subs	r4, r5, r4
c0dec2a8:	f104 0e21 	add.w	lr, r4, #33	@ 0x21
c0dec2ac:	f1be 0f20 	cmp.w	lr, #32
c0dec2b0:	d15d      	bne.n	c0dec36e <__udivmoddi4+0x192>
c0dec2b2:	f04f 0e20 	mov.w	lr, #32
c0dec2b6:	f04f 0a00 	mov.w	sl, #0
c0dec2ba:	f04f 0b00 	mov.w	fp, #0
c0dec2be:	460e      	mov	r6, r1
c0dec2c0:	e021      	b.n	c0dec306 <__udivmoddi4+0x12a>
c0dec2c2:	fbb1 f4f3 	udiv	r4, r1, r3
c0dec2c6:	f1bc 0f00 	cmp.w	ip, #0
c0dec2ca:	d004      	beq.n	c0dec2d6 <__udivmoddi4+0xfa>
c0dec2cc:	2000      	movs	r0, #0
c0dec2ce:	fb04 1113 	mls	r1, r4, r3, r1
c0dec2d2:	e9cc 0100 	strd	r0, r1, [ip]
c0dec2d6:	2100      	movs	r1, #0
c0dec2d8:	e046      	b.n	c0dec368 <__udivmoddi4+0x18c>
c0dec2da:	fab1 f581 	clz	r5, r1
c0dec2de:	fab3 f683 	clz	r6, r3
c0dec2e2:	1b75      	subs	r5, r6, r5
c0dec2e4:	2d1f      	cmp	r5, #31
c0dec2e6:	f4bf af88 	bcs.w	c0dec1fa <__udivmoddi4+0x1e>
c0dec2ea:	f105 0e01 	add.w	lr, r5, #1
c0dec2ee:	fa20 f40e 	lsr.w	r4, r0, lr
c0dec2f2:	f1c5 051f 	rsb	r5, r5, #31
c0dec2f6:	fa01 f605 	lsl.w	r6, r1, r5
c0dec2fa:	fa21 fb0e 	lsr.w	fp, r1, lr
c0dec2fe:	40a8      	lsls	r0, r5
c0dec300:	f04f 0a00 	mov.w	sl, #0
c0dec304:	4326      	orrs	r6, r4
c0dec306:	f04f 0800 	mov.w	r8, #0
c0dec30a:	f1be 0f00 	cmp.w	lr, #0
c0dec30e:	d01c      	beq.n	c0dec34a <__udivmoddi4+0x16e>
c0dec310:	ea4f 014b 	mov.w	r1, fp, lsl #1
c0dec314:	f1ae 0e01 	sub.w	lr, lr, #1
c0dec318:	ea41 71d6 	orr.w	r1, r1, r6, lsr #31
c0dec31c:	0076      	lsls	r6, r6, #1
c0dec31e:	ea46 75d0 	orr.w	r5, r6, r0, lsr #31
c0dec322:	1aae      	subs	r6, r5, r2
c0dec324:	eb61 0b03 	sbc.w	fp, r1, r3
c0dec328:	43cf      	mvns	r7, r1
c0dec32a:	43ec      	mvns	r4, r5
c0dec32c:	18a4      	adds	r4, r4, r2
c0dec32e:	eb57 0403 	adcs.w	r4, r7, r3
c0dec332:	bf5c      	itt	pl
c0dec334:	468b      	movpl	fp, r1
c0dec336:	462e      	movpl	r6, r5
c0dec338:	0040      	lsls	r0, r0, #1
c0dec33a:	0fe1      	lsrs	r1, r4, #31
c0dec33c:	ea48 044a 	orr.w	r4, r8, sl, lsl #1
c0dec340:	ea40 70da 	orr.w	r0, r0, sl, lsr #31
c0dec344:	46a2      	mov	sl, r4
c0dec346:	4688      	mov	r8, r1
c0dec348:	e7df      	b.n	c0dec30a <__udivmoddi4+0x12e>
c0dec34a:	ea4f 71da 	mov.w	r1, sl, lsr #31
c0dec34e:	f1bc 0f00 	cmp.w	ip, #0
c0dec352:	bf18      	it	ne
c0dec354:	e9cc 6b00 	strdne	r6, fp, [ip]
c0dec358:	ea41 0140 	orr.w	r1, r1, r0, lsl #1
c0dec35c:	ea4f 004a 	mov.w	r0, sl, lsl #1
c0dec360:	f020 0001 	bic.w	r0, r0, #1
c0dec364:	ea40 0408 	orr.w	r4, r0, r8
c0dec368:	4620      	mov	r0, r4
c0dec36a:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0dec36e:	f1be 0f1f 	cmp.w	lr, #31
c0dec372:	d804      	bhi.n	c0dec37e <__udivmoddi4+0x1a2>
c0dec374:	fa20 f40e 	lsr.w	r4, r0, lr
c0dec378:	f1ce 0520 	rsb	r5, lr, #32
c0dec37c:	e7bb      	b.n	c0dec2f6 <__udivmoddi4+0x11a>
c0dec37e:	f1ce 0740 	rsb	r7, lr, #64	@ 0x40
c0dec382:	f1ae 0420 	sub.w	r4, lr, #32
c0dec386:	f04f 0b00 	mov.w	fp, #0
c0dec38a:	fa20 f504 	lsr.w	r5, r0, r4
c0dec38e:	fa01 f607 	lsl.w	r6, r1, r7
c0dec392:	fa00 fa07 	lsl.w	sl, r0, r7
c0dec396:	ea46 0805 	orr.w	r8, r6, r5
c0dec39a:	fa21 f604 	lsr.w	r6, r1, r4
c0dec39e:	4640      	mov	r0, r8
c0dec3a0:	e7b1      	b.n	c0dec306 <__udivmoddi4+0x12a>
	...

c0dec3a4 <__aeabi_memcpy>:
c0dec3a4:	f000 b82c 	b.w	c0dec400 <memcpy>

c0dec3a8 <__aeabi_memmove>:
c0dec3a8:	f000 b838 	b.w	c0dec41c <memmove>

c0dec3ac <__aeabi_memset>:
c0dec3ac:	460b      	mov	r3, r1
c0dec3ae:	4611      	mov	r1, r2
c0dec3b0:	461a      	mov	r2, r3
c0dec3b2:	f000 b84d 	b.w	c0dec450 <memset>
c0dec3b6:	bf00      	nop

c0dec3b8 <__aeabi_memclr>:
c0dec3b8:	460a      	mov	r2, r1
c0dec3ba:	2100      	movs	r1, #0
c0dec3bc:	f000 b848 	b.w	c0dec450 <memset>

c0dec3c0 <__aeabi_uldivmod>:
c0dec3c0:	b540      	push	{r6, lr}
c0dec3c2:	b084      	sub	sp, #16
c0dec3c4:	ae02      	add	r6, sp, #8
c0dec3c6:	9600      	str	r6, [sp, #0]
c0dec3c8:	f7ff ff08 	bl	c0dec1dc <__udivmoddi4>
c0dec3cc:	9a02      	ldr	r2, [sp, #8]
c0dec3ce:	9b03      	ldr	r3, [sp, #12]
c0dec3d0:	b004      	add	sp, #16
c0dec3d2:	bd40      	pop	{r6, pc}

c0dec3d4 <explicit_bzero>:
c0dec3d4:	f000 b800 	b.w	c0dec3d8 <bzero>

c0dec3d8 <bzero>:
c0dec3d8:	460a      	mov	r2, r1
c0dec3da:	2100      	movs	r1, #0
c0dec3dc:	f000 b838 	b.w	c0dec450 <memset>

c0dec3e0 <memcmp>:
c0dec3e0:	b510      	push	{r4, lr}
c0dec3e2:	3901      	subs	r1, #1
c0dec3e4:	4402      	add	r2, r0
c0dec3e6:	4290      	cmp	r0, r2
c0dec3e8:	d101      	bne.n	c0dec3ee <memcmp+0xe>
c0dec3ea:	2000      	movs	r0, #0
c0dec3ec:	e005      	b.n	c0dec3fa <memcmp+0x1a>
c0dec3ee:	7803      	ldrb	r3, [r0, #0]
c0dec3f0:	f811 4f01 	ldrb.w	r4, [r1, #1]!
c0dec3f4:	42a3      	cmp	r3, r4
c0dec3f6:	d001      	beq.n	c0dec3fc <memcmp+0x1c>
c0dec3f8:	1b18      	subs	r0, r3, r4
c0dec3fa:	bd10      	pop	{r4, pc}
c0dec3fc:	3001      	adds	r0, #1
c0dec3fe:	e7f2      	b.n	c0dec3e6 <memcmp+0x6>

c0dec400 <memcpy>:
c0dec400:	440a      	add	r2, r1
c0dec402:	4291      	cmp	r1, r2
c0dec404:	f100 33ff 	add.w	r3, r0, #4294967295	@ 0xffffffff
c0dec408:	d100      	bne.n	c0dec40c <memcpy+0xc>
c0dec40a:	4770      	bx	lr
c0dec40c:	b510      	push	{r4, lr}
c0dec40e:	f811 4b01 	ldrb.w	r4, [r1], #1
c0dec412:	4291      	cmp	r1, r2
c0dec414:	f803 4f01 	strb.w	r4, [r3, #1]!
c0dec418:	d1f9      	bne.n	c0dec40e <memcpy+0xe>
c0dec41a:	bd10      	pop	{r4, pc}

c0dec41c <memmove>:
c0dec41c:	4288      	cmp	r0, r1
c0dec41e:	b510      	push	{r4, lr}
c0dec420:	eb01 0402 	add.w	r4, r1, r2
c0dec424:	d902      	bls.n	c0dec42c <memmove+0x10>
c0dec426:	4284      	cmp	r4, r0
c0dec428:	4623      	mov	r3, r4
c0dec42a:	d807      	bhi.n	c0dec43c <memmove+0x20>
c0dec42c:	1e43      	subs	r3, r0, #1
c0dec42e:	42a1      	cmp	r1, r4
c0dec430:	d008      	beq.n	c0dec444 <memmove+0x28>
c0dec432:	f811 2b01 	ldrb.w	r2, [r1], #1
c0dec436:	f803 2f01 	strb.w	r2, [r3, #1]!
c0dec43a:	e7f8      	b.n	c0dec42e <memmove+0x12>
c0dec43c:	4601      	mov	r1, r0
c0dec43e:	4402      	add	r2, r0
c0dec440:	428a      	cmp	r2, r1
c0dec442:	d100      	bne.n	c0dec446 <memmove+0x2a>
c0dec444:	bd10      	pop	{r4, pc}
c0dec446:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
c0dec44a:	f802 4d01 	strb.w	r4, [r2, #-1]!
c0dec44e:	e7f7      	b.n	c0dec440 <memmove+0x24>

c0dec450 <memset>:
c0dec450:	4603      	mov	r3, r0
c0dec452:	4402      	add	r2, r0
c0dec454:	4293      	cmp	r3, r2
c0dec456:	d100      	bne.n	c0dec45a <memset+0xa>
c0dec458:	4770      	bx	lr
c0dec45a:	f803 1b01 	strb.w	r1, [r3], #1
c0dec45e:	e7f9      	b.n	c0dec454 <memset+0x4>

c0dec460 <setjmp>:
c0dec460:	46ec      	mov	ip, sp
c0dec462:	e8a0 5ff0 	stmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
c0dec466:	f04f 0000 	mov.w	r0, #0
c0dec46a:	4770      	bx	lr

c0dec46c <longjmp>:
c0dec46c:	e8b0 5ff0 	ldmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
c0dec470:	46e5      	mov	sp, ip
c0dec472:	0008      	movs	r0, r1
c0dec474:	bf08      	it	eq
c0dec476:	2001      	moveq	r0, #1
c0dec478:	4770      	bx	lr
c0dec47a:	bf00      	nop

c0dec47c <strcmp>:
c0dec47c:	f810 2b01 	ldrb.w	r2, [r0], #1
c0dec480:	f811 3b01 	ldrb.w	r3, [r1], #1
c0dec484:	2a01      	cmp	r2, #1
c0dec486:	bf28      	it	cs
c0dec488:	429a      	cmpcs	r2, r3
c0dec48a:	d0f7      	beq.n	c0dec47c <strcmp>
c0dec48c:	1ad0      	subs	r0, r2, r3
c0dec48e:	4770      	bx	lr

c0dec490 <strlen>:
c0dec490:	4603      	mov	r3, r0
c0dec492:	f813 2b01 	ldrb.w	r2, [r3], #1
c0dec496:	2a00      	cmp	r2, #0
c0dec498:	d1fb      	bne.n	c0dec492 <strlen+0x2>
c0dec49a:	1a18      	subs	r0, r3, r0
c0dec49c:	3801      	subs	r0, #1
c0dec49e:	4770      	bx	lr

c0dec4a0 <strncpy>:
c0dec4a0:	4603      	mov	r3, r0
c0dec4a2:	b510      	push	{r4, lr}
c0dec4a4:	3901      	subs	r1, #1
c0dec4a6:	b132      	cbz	r2, c0dec4b6 <strncpy+0x16>
c0dec4a8:	f811 4f01 	ldrb.w	r4, [r1, #1]!
c0dec4ac:	3a01      	subs	r2, #1
c0dec4ae:	f803 4b01 	strb.w	r4, [r3], #1
c0dec4b2:	2c00      	cmp	r4, #0
c0dec4b4:	d1f7      	bne.n	c0dec4a6 <strncpy+0x6>
c0dec4b6:	2100      	movs	r1, #0
c0dec4b8:	441a      	add	r2, r3
c0dec4ba:	4293      	cmp	r3, r2
c0dec4bc:	d100      	bne.n	c0dec4c0 <strncpy+0x20>
c0dec4be:	bd10      	pop	{r4, pc}
c0dec4c0:	f803 1b01 	strb.w	r1, [r3], #1
c0dec4c4:	e7f9      	b.n	c0dec4ba <strncpy+0x1a>

c0dec4c6 <C_app_zknox_64px_bitmap>:
c0dec4c6:	0040 0040 8922 0002 ffff ffff ffff ffff     @.@."...........
c0dec4d6:	ffff ffff 0ed7 f55d a39d 3010 8311 f0ad     ......]....0....
c0dec4e6:	030b 0110 0070 4c81 0dec 2005 0001 7031     ....p..L... ..1p
c0dec4f6:	0d04 0be9 7231 5011 0a01 99e7 2001 7223     ....1r.P..... #r
c0dec506:	1102 8140 e47e 1287 4315 2162 0450 e20e     ..@.~....Cb!P...
c0dec516:	13b8 4065 5263 4031 e106 13ab 1485 0373     ..e@cR1@......s.
c0dec526:	2142 0750 addf 6513 5364 2142 0b50 96de     B!P....edSB!P...
c0dec536:	6027 0474 5243 4021 0d01 9bdc 8015 5325     '`t.CR!@......%S
c0dec546:	4304 3152 0640 b6dc 6549 b530 a989 0680     .CR1@...Ie0.....
c0dec556:	4312 3142 0140 da0d 010c 8417 c57c c79e     .CB1@.......|...
c0dec566:	3310 4142 0540 a8da 4b48 8ec9 33a4 4132     .3BA@...HK...32A
c0dec576:	0140 c60e cd4e 7691 ccc0 330b 1122 3182     @...N..v...3"..1
c0dec586:	0b60 0bc5 0231 9dcc c026 09ce 1302 0422     `...1...&.....".
c0dec596:	1c0a 728b 0540 0bc5 0130 8bcc c748 c51e     ...r@...0...H...
c0dec5a6:	060e 1213 0d04 ad1e a2ed 1440 c10d 030e     ..........@.....
c0dec5b6:	0130 88cc c55d 68bc b075 09c4 1302 ce92     0...]..hu.......
c0dec5c6:	13a0 ed9a 1090 1a08 6489 0617 0140 cb0c     .........d..@...
c0dec5d6:	c515 080d 9d1e d0c6 0dc3 8623 31ed dc8c     ..........#..1..
c0dec5e6:	0a15 0c1d 150b 8364 ca2d 0a02 06c5 c20e     ......d.-.......
c0dec5f6:	b68e 0ec3 1305 ca88 0931 4d1e 3b6c 319a     ........1..Ml;.1
c0dec606:	c9b0 0d04 0ec4 c407 040c 08c4 0113 0210     ................
c0dec616:	0821 7d2e 6c0d 0308 07ca c40d 060e 0cc4     !..}.l..........
c0dec626:	c405 23ba 705a 0931 2d2e 1d0e 2d4c a39c     ...#Zp1..-..L-..
c0dec636:	cad0 0c08 08c5 c30c 0b09 bcc4 4e23 b5d0     ............#N..
c0dec646:	3d01 0ce0 b220 d66e ab70 9858 0419 cb0d     .=.. .n.p.X.....
c0dec656:	c01a c30e 5a8e 081d c509 060e 8912 1afd     .....Z..........
c0dec666:	edad 1061 39aa c183 49be 30b7 cc07 7f8c     ..a..9...I.0....
c0dec676:	c22e a8ae c79c 220b 3e09 818d 8710 1dc4     .......".>......
c0dec686:	c20e 6b87 ce18 5e02 0eca 8ec1 1281 1a06     ...k...^........
c0dec696:	4189 0610 190c b7c4 b516 ceb0 cf86 8f3e     .A............>.
c0dec6a6:	1eef 3ec4 d89f 5120 a810 6ddc bbc4 a19c     ...>.. Q...m....
c0dec6b6:	cec0 6f8a 7e7e 8b4e 2062 6c81 0b1d c505     ...o~~N.b .l....
c0dec6c6:	8abb d091 01cf 7e0d 5e7e 0c0d 3d2a 6b8c     .......~~^..*=.k
c0dec6d6:	0dc5 d039 7f8a 7e7e 2e7e 0a2d dd05 0c01     ..9...~~~.-.....
c0dec6e6:	7e7e 0e7e 8c3d dd5d 040b 7e7e 0e7e 8c2d     ~~~.=.]...~~~.-.
c0dec6f6:	df7a 0807 7e7e 3d6e 0609 8ee0 7e39 5e7e     z...~~n=....9~~^
c0dec706:	0a2d e206 398e 7e7e 2d3e 0609 8ee4 7e38     -....9~~>-....8~
c0dec716:	0e7e 083d e607 76be e0cf 7e0d 0e0d 9e2d     ~.=....v...~..-.
c0dec726:	90b5 aae9 df29 7d1e 0c1e 0e17 beeb 6b80     ....)..}.......k
c0dec736:	0ed0 4ec0 a5ad f03c 72ab 1836 52b7 d039     ...N..<..r6..R9.
c0dec746:	1df5 1a0b 0e0d ffff ffff ffff ffff ffff     ................
c0dec756:	                                             .

c0dec757 <C_app_zknox_64px>:
c0dec757:	0040 0040 0102 c4c6 c0de                    @.@.......

c0dec761 <C_Check_Circle_64px_bitmap>:
c0dec761:	0040 0040 3321 0002 0231 8b1f 0008 0000     @.@.!3..1.......
c0dec771:	0000 0302 55ad 4e39 3103 fd14 6124 4b5f     .....U9N.1..$a_K
c0dec781:	8028 a091 2401 b888 4640 2054 4121 3949     (....$..@FT !AI9
c0dec791:	152d 00dc a090 1166 05a2 0171 1710 0a48     -.....f...q...H.
c0dec7a1:	026a 6017 41ab 8961 2404 9f21 65ef be66     j..`.Aa..$!..ef.
c0dec7b1:	0e3d c48b 9914 9fb1 fcfd fcfc 8cf3 7ff8     =...............
c0dec7c1:	f54f 1a60 7460 d8a9 de00 fd04 95cc 681c     O.`.`t.........h
c0dec7d1:	87cd c9e8 bf14 0185 7952 ae0b 301b 8b40     ........Ry...0@.
c0dec7e1:	c4b5 9cae 7cb5 f88d e070 ef89 0371 137e     .....|..p...q.~.
c0dec7f1:	fd5d 4e7a 4f7d d6b4 9e38 8ea5 b8f9 4c79     ].zN}O..8.....yL
c0dec801:	34cd e15b da9e 7c13 18bc 1930 a38b 5b15     .4[....|..0....[
c0dec811:	b94d a901 5a89 34af d0fa fbd4 5d41 b0b9     M....Z.4....A]..
c0dec821:	0ab1 6830 71fb 5315 0056 6e9a fc6c 2fb3     ..0h.q.SV..nl../
c0dec831:	24e2 dd75 bf49 012f d486 1057 ac8e 0a5a     .$u.I./...W...Z.
c0dec841:	aa32 dc97 5d54 3947 803e c954 7a63 b709     2...T]G9>.T.cz..
c0dec851:	815a c734 7fa9 bc41 000b 6a27 db3a e292     Z.4...A...'j:...
c0dec861:	12ed 3f6f 8274 64b6 f810 4052 a01d de23     ..o?t..d..R@..#.
c0dec871:	2712 6220 73a5 9d0a cf04 db00 e588 5bd8     .' b.s.........[
c0dec881:	e08b 0a5d 027c a128 8093 ee56 ab15 0ca4     ..].|.(...V.....
c0dec891:	1953 0781 889d a1eb 493b 0082 11da c517     S.......;I......
c0dec8a1:	9b8f 4760 f54c 0b95 822e f14b 41ed 360f     ..`GL.....K..A.6
c0dec8b1:	b820 d215 48a4 c137 3093 c2c8 8139 e70b      ....H7..0..9...
c0dec8c1:	4e04 105c 30ac d4dc 08a7 9856 acbe 7c5d     .N\..0....V...]|
c0dec8d1:	5e31 0710 701c 347f 5aff 4fe8 36b3 adc9     1^...p.4.Z.O.6..
c0dec8e1:	802f c436 7653 d63e 3cfe 2d61 5f3f ba73     /.6.Sv>..<a-?_s.
c0dec8f1:	df3a acb2 d712 0ff4 1f59 2554 6ec3 5f7b     :.......Y.T%.n{_
c0dec901:	6554 3b01 e340 8e78 cad4 febe e91f 4c92     Te.;@.x........L
c0dec911:	f2b3 e8c9 ce32 92b3 a68c 3457 3971 702e     ....2.....W4q9.p
c0dec921:	b6aa 0f34 d91d e35f f2e1 639e a7d5 fd79     ..4..._....c..y.
c0dec931:	ba44 dde8 6369 1aef c3e5 3464 9dd2 272f     D...ic....d4../'
c0dec941:	cbbf 1fa7 8df3 b09c 9b03 5328 2325 8d5f     ..........(S%#_.
c0dec951:	3ec0 f233 eb15 7359 39c0 5158 f322 2c7d     .>3...Ys.9XQ".},
c0dec961:	f7cc 448d cbbe a6c0 e1fb f102 dd51 030f     ...D........Q...
c0dec971:	0898 fe6c ec64 ac2b 19ea f170 f7af 2d1b     ..l.d.+...p....-
c0dec981:	1fb1 b3c2 2e0d dad0 0cd6 c8c0 fe72 af1f     ............r...
c0dec991:	fc6c 2402 5a14 00c5 0008                     l..$.Z.....

c0dec99c <C_Check_Circle_64px>:
c0dec99c:	0040 0040 0102 c761 c0de                    @.@...a...

c0dec9a6 <C_Denied_Circle_64px_bitmap>:
c0dec9a6:	0040 0040 3021 0002 022e 8b1f 0008 0000     @.@.!0..........
c0dec9b6:	0000 0302 55ad 2f4b 4104 2e10 bd6b 479f     .....UK/.A..k..G
c0dec9c6:	d80e 4884 ac90 3f8d e260 2244 e8e1 71b8     ...H...?`.D"...q
c0dec9d6:	e273 201f ece1 7111 fe25 f100 d607 d9c1     s.. ...q%.......
c0dec9e6:	07f2 e63c d64c e363 a6b9 f554 a663 67a7     ..<.L.c...T.c..g
c0dec9f6:	9766 1f44 b676 babb beaa eafe 6aeb ffc4     f.D.v........j..
c0deca06:	5f1b 13fb 4300 c50b f304 a806 5331 b18a     ._...C......1S..
c0deca16:	1c56 47f0 58ba 0cd5 2a90 6658 642f 6806     V..G.X...*Xf/d.h
c0deca26:	52b4 08ec a5af c46b fdfb ff0c 0d1f df99     .R....k.........
c0deca36:	a978 f947 bb78 5b3c ed35 5a39 0d98 47a6     x.G.x.<[5.9Z...G
c0deca46:	ad34 3237 34b8 331f f3f7 6c86 8e00 3632     4.72.4.3...l..26
c0deca56:	e185 09e6 3f8d a17b 07dd bc61 b41f a934     .....?{...a...4.
c0deca66:	2b27 7d00 1f36 4157 4fc8 ba80 db1b ddfe     '+.}6.WA.O......
c0deca76:	c7ed 7424 511d 2fbe fa01 bfe5 247c 42bb     ..$t.Q./....|$.B
c0deca86:	9690 2555 e336 49ca 44a8 9e99 a3cd 831a     ..U%6..I.D......
c0deca96:	e7d6 7bf8 7006 0f2c a96d a005 bf9d 668e     ...{.p,.m......f
c0decaa6:	5162 3ff3 bf2c 008e 01e0 8ab4 abe9 e34e     bQ.?,.........N.
c0decab6:	32c2 c0aa e712 3ab8 aa46 d8a4 7896 009f     .2.....:F....x..
c0decac6:	10b6 facb 1974 9385 90e8 df1b c005 8047     ....t.........G.
c0decad6:	1a12 9eeb c7de bb99 4b38 a82a d662 e770     ........8K*.b.p.
c0decae6:	6d88 6b88 3b3e 12c2 33b8 16a2 79c4 09fe     .m.k>;...3...y..
c0decaf6:	1802 b8ee aecd 648e 0741 dc30 44a9 9cf5     .......dA.0..D..
c0decb06:	d3a4 91d4 8ee1 0cb7 804d 7434 1468 91e3     ........M.4th...
c0decb16:	3209 1ced 7020 bbff 2e3d 2d7e b97c 7c40     .2.. p..=.~-|.@|
c0decb26:	f9f6 b8ce f9c0 fc6a 2834 9292 6df8 3c46     ......j.4(...mF<
c0decb36:	56a9 f69f f5da 0b2d 1895 aeeb 9abe 421f     .V....-........B
c0decb46:	a41f 8192 7d78 4b3d 2965 4719 79f5 3328     ....x}=Ke).G.y(3
c0decb56:	ea3b 451e 9df4 0691 b192 cdd5 fa4a 8b5a     ;..E........J.Z.
c0decb66:	65c0 702d b86b bd6a 3762 9f17 151d 49d7     .e-pk.j.b7.....I
c0decb76:	dfba d88a a4bb 90fe 77f5 f7c6 e397 f5df     .........w......
c0decb86:	9aa7 8dfd a6af b0d5 4257 7442 86ed 1a7d     ........WBBt..}.
c0decb96:	21d2 b97a 86f0 ee73 91cf 3efe f9a2 8f5f     .!z...s....>.._.
c0decba6:	77f4 b0d1 7de9 40b8 907c 43ef 462f b61a     .w...}.@|..C/F..
c0decbb6:	d239 13f6 95f6 9909 7f8b df7d c528 369e     9.........}.(..6
c0decbc6:	274f a03c cd95 8029 a5c1 3fc2 d93e 03f8     O'<...)....?>...
c0decbd6:	a770 8485 0800 0000                         p.......

c0decbde <C_Denied_Circle_64px>:
c0decbde:	0040 0040 0102 c9a6 c0de                    @.@.......

c0decbe8 <C_Important_Circle_64px_bitmap>:
c0decbe8:	0040 0040 fa21 0001 01f8 8b1f 0008 0000     @.@.!...........
c0decbf8:	0000 0302 55b5 4ecd 40c2 1e10 fea1 cfe3     .....U.N.@......
c0decc08:	0f51 892a d45e 8904 602f 49e3 1313 7a3c     Q.*.^.../`.I..<z
c0decc18:	cae4 37cd 1350 a33d 70c6 f8d5 1802 005f     ...7P.=..p...._.
c0decc28:	9e0f 5f05 1fc0 1ace 4910 c054 b38e b6ed     ..._.....IT.....
c0decc38:	db74 d059 e704 76d0 dbf6 7cee 76fd 2dfa     t.Y....v...|.v.-
c0decc48:	ef62 99a2 055b d858 6a29 43e0 b190 6159     b...[.X.)j.C..Ya
c0decc58:	96d0 5e09 c518 308e a440 8010 052d 1806     ...^...0@...-...
c0decc68:	9408 b138 cadf 203c e4be e2e2 4979 3f81     ..8...< ....yI.?
c0decc78:	d0c4 7c94 3ac7 d915 1f9e d24f 56c0 bd3b     ...|.:....O..V;.
c0decc88:	34a4 abea a650 d97c 5f3f 484c c9b4 c551     .4..P.|.?_LH..Q.
c0decc98:	9541 9a6e 78d8 3bd9 3ecd f957 d17e 9ad0     A.n..x.;.>W.~...
c0decca8:	ec9b cc02 f504 6fb8 d92f e800 0c7b dfe2     .......o/...{...
c0deccb8:	de93 c49a 2c6e 77ac 6009 79d6 874a 4baa     ....n,.w.`.yJ..K
c0deccc8:	8606 abb3 26a4 9db7 cac4 a6de ff9a 7d53     .....&........S}
c0deccd8:	e341 7129 01bf b3c8 02dd 1310 d377 84a7     A.)q........w...
c0decce8:	a612 c04d 1802 71e1 d85a b9e1 e3c2 006f     ..M....qZ.....o.
c0deccf8:	c459 fb3a 2275 6d3e 5582 0a80 538f 09e5     Y.:.u">m.U...S..
c0decd08:	2551 eba2 38f7 228c f3ee 38ea 0ec2 6e23     Q%...8."...8..#n
c0decd18:	0b8b c71f 55e2 51d3 8b81 4412 9145 3b71     .....U.Q...DE.q;
c0decd28:	f769 20b6 159e 4f43 9a82 924d abc7 a042     i.. ..CO..M...B.
c0decd38:	c6ff f1bb 724b e7cd a06e 4521 e9d2 2fd3     ....Kr..n.!E.../
c0decd48:	d245 3be9 7884 69d5 627f f7dd 2eb7 b2c9     E..;.x.i.b......
c0decd58:	407f eeca 3992 af1e 9d39 ba05 bc0d 2a70     .@...9..9.....p*
c0decd68:	f29b 623f 19e8 8db2 1c0b 90dc d70b 0d35     ..?b..........5.
c0decd78:	965e ade3 b9a0 ea78 75c8 dd4d 2dff 7d85     ^.....x..uM..-.}
c0decd88:	f9d6 c243 c99b 4bfb 77fe d4fe dfd5 8948     ..C....K.w....H.
c0decd98:	61a0 92d3 8a91 afe2 618a 2b5f 8afe 5256     .a.......a_+..VR
c0decda8:	709d fc2b e439 8bef bfae 841f ddfc 6c36     .p+.9.........6l
c0decdb8:	1f3a 10ee 9d5f 61f3 431a ed86 230f 53d8     :..._..a.C...#.S
c0decdc8:	b8cd 1702 7aff 51be 3389 de17 f4d0 eb73     .....z.Q.3....s.
c0decdd8:	1d68 3e60 e853 91e1 3f8d c10e e439 0800     h.`>S....?..9...
	...

c0decdea <C_Important_Circle_64px>:
c0decdea:	0040 0040 0102 cbe8 c0de                    @.@.......

c0decdf4 <C_Warning_64px_bitmap>:
c0decdf4:	0040 0040 5f21 0001 015d 8b1f 0008 0000     @.@.!_..].......
c0dece04:	0000 0302 d585 4e31 40c3 0510 8dd0 0885     ......1N.@......
c0dece14:	454a 9149 25c2 52b2 08e4 4039 19c4 8272     JEI..%.R..9@..r.
c0dece24:	815c 0384 b880 c441 7205 0a04 e7d2 6908     \.....A..r.....i
c0dece34:	a202 a50b a113 ec1d 5d99 f6b3 1fee fb6f     .........]....o.
c0dece44:	96c6 febc 4333 4f84 27b9 5ced ebf2 c293     ....3C.O.'.\....
c0dece54:	53bf 2663 cf0a 318c 9d23 5bb1 e866 5176     .Sc&...1#..[f.vQ
c0dece64:	60e1 7d06 3f5d b8fc ce41 24bc cce4 4273     .`.}]?..A..$..sB
c0dece74:	eafe f818 e79b efb4 966a 4b7b 7339 c841     ........j.{K9sA.
c0dece84:	ef99 f908 e431 bfd8 1c5a 7979 f15b 9090     ....1...Z.yy[...
c0dece94:	8733 6891 f33b 1855 96a9 239f f96e 8f25     3..h;.U....#n.%.
c0decea4:	7438 4b8e c9d6 bfeb 6f0b 3809 e0f3 8085     8t.K.....o.8....
c0deceb4:	34db 977b c5b0 5dec 46c2 5dc8 90d8 9baf     .4{....].F.]....
c0decec4:	94b8 9fc6 fa1b 4631 36dc 7d8c ba4e 3d17     ......1F.6.}N..=
c0deced4:	bdae e25f c4bc 9f6e eff4 eb93 164b f784     .._...n.....K...
c0decee4:	2a9b fe68 5d4f 3d90 7743 5b05 7de8 70f9     .*h.O].=Cw.[.}.p
c0decef4:	ebf1 4416 ccf9 a1de 00bb a01f 39d3 b4ef     ...D.........9..
c0decf04:	b74f bebf fef5 ed72 141b fba4 787b 2e82     O.....r.....{x..
c0decf14:	f705 e9d8 1833 c93f f4f9 cfa1 9727 0297     ....3.?.....'...
c0decf24:	14bb b04c c14b 7603 89f2 6e43 fa57 f77c     ..L.K..v..CnW.|.
c0decf34:	db89 fbe8 4cc5 fd95 50b4 93f7 605f 6523     .....L...P.._`#e
c0decf44:	e63f 73ba c6a0 fb3d f499 5e05 cbcd e43f     ?..s..=....^..?.
c0decf54:	7b2a 0024 0008                               *{$....

c0decf5b <C_Warning_64px>:
c0decf5b:	0040 0040 0102 cdf4 c0de                    @.@.......

c0decf65 <C_Back_40px_bitmap>:
c0decf65:	0028 0028 8c21 0000 008a 8b1f 0008 0000     (.(.!...........
c0decf75:	0000 0302 d3ed 09cd 20c0 800c d0d1 0e53     ......... ....S.
c0decf85:	a21d 39a3 364a 9570 d26e c46d c143 c7e6     ...9J6p.n.m.C...
c0decf95:	a8d6 73d0 f50f e110 81e3 b010 9794 f843     ...s..........C.
c0decfa5:	efb7 c3b6 53b7 4667 28df dcca b621 6196     .....SgF.(..!..a
c0decfb5:	2b95 b601 0646 d04a 5b5b fa86 4192 376d     .+..F.J.[[...Am7
c0decfc5:	50ab c3da 942a 98d6 6e41 198e e6e4 4299     .P..*...An.....B
c0decfd5:	8ec2 2429 99ec 6dc0 6181 0933 c4f8 5561     ..)$...m.a3...aU
c0decfe5:	6001 605a 199a 7c43 01fb 02e5 04e6 e43a     .`Z`..C|......:.
c0decff5:	0320 0000                                    ...

c0decff9 <C_Back_40px>:
c0decff9:	0028 0028 0102 cf65 c0de                    (.(...e...

c0ded003 <C_Check_40px_bitmap>:
c0ded003:	0028 0028 5401 0000 0052 8b1f 0008 0000     (.(..T..R.......
c0ded013:	0000 0302 6063 05c0 4078 1c84 9088 1307     ....c`..x@......
c0ded023:	400d ff82 9000 7f60 2400 3f98 0900 1fc6     .@....`..$.?....
c0ded033:	9920 203f 0ea2 d844 57e3 2608 602a b02c      .? ..D..W.&*`,.
c0ded043:	5818 ac16 ac0e ac03 1ed7 5e6e 5c0d 0183     .X........n^.\..
c0ded053:	0103 0000 8363 77dc 00c8 0000               ....c..w....

c0ded05f <C_Check_40px>:
c0ded05f:	0028 0028 0100 d003 c0de                    (.(.......

c0ded069 <C_Chevron_40px_bitmap>:
c0ded069:	0028 0028 5c22 0000 ffff ffff ffff ffff     (.(."\..........
c0ded079:	1cda 03e4 0310 03e2 0330 03e0 0350 03de     ........0...P...
c0ded089:	1820 0320 03dc 0820 08c1 0320 03da 0820      . ... ... ... .
c0ded099:	08c3 0320 03d8 0820 08c5 0320 03d6 0820     .. ... ... ... .
c0ded0a9:	08c7 0320 05d4 0820 08c9 0520 9ed3 8020     .. ... ... ... .
c0ded0b9:	98cb e002 0ed4 cd09 0e09 ffff ffff ffff     ................
c0ded0c9:	ffff e2ff                                   ....

c0ded0cd <C_Chevron_40px>:
c0ded0cd:	0028 0028 0102 d069 c0de                    (.(...i...

c0ded0d7 <C_Chevron_Back_40px_bitmap>:
c0ded0d7:	0028 0028 7621 0000 0074 8b1f 0008 0000     (.(.!v..t.......
c0ded0e7:	0000 0302 d2ed 0dc1 3080 0508 8e50 383d     .........0..P.=8
c0ded0f7:	a3a4 41b0 7157 6e93 3863 d498 1042 eb7e     ...AWq.nc8..B.~.
c0ded107:	4606 340e bfe5 0b84 ffbd aa35 e7e1 2eb2     .F.4......5.....
c0ded117:	6705 b55c 541f 2473 e9b4 1273 7640 27b0     .g\..Ts$..s.@v.'
c0ded127:	2794 c807 0711 4c94 3203 73ac b828 21cd     .'.....L.2.s(..!
c0ded137:	8732 7313 3338 0b83 b833 8532 532b 62f8     2..s83..3.2.+S.b
c0ded147:	9603 1dcf 0dc6 8ef2 7343 0320 0000          ........Cs ...

c0ded155 <C_Chevron_Back_40px>:
c0ded155:	0028 0028 0102 d0d7 c0de                    (.(.......

c0ded15f <C_Chevron_Next_40px_bitmap>:
c0ded15f:	0028 0028 7121 0000 006f 8b1f 0008 0000     (.(.!q..o.......
c0ded16f:	0000 0302 ceed 0dbb 3080 450c 5751 0a51     .........0.EQWQ.
c0ded17f:	cc86 ac06 0d90 0918 42a6 1448 c48f 8e44     .........BH...D.
c0ded18f:	1b3f 6e20 74f9 1964 58f8 8735 22e9 02da     ?. n.td..X5.."..
c0ded19f:	ca23 a581 61e2 f5a5 b074 c031 c6c1 0b00     #....a..t.1.....
c0ded1af:	3999 ccc8 c1c2 1c0c 434c 0a61 9b0a 3150     .9......LCa...P1
c0ded1bf:	c781 1d64 ec2e fe92 bcbe 7707 ddbd ebf8     ..d........w....
c0ded1cf:	383d be09 209b 0003                          =8... ...

c0ded1d8 <C_Chevron_Next_40px>:
c0ded1d8:	0028 0028 0102 d15f c0de                    (.(..._...

c0ded1e2 <C_Close_40px_bitmap>:
c0ded1e2:	0028 0028 8521 0000 0083 8b1f 0008 0000     (.(.!...........
c0ded1f2:	0000 0302 fffb c07f bfc0 08f9 cff6 10f7     ................
c0ded202:	11fa 4207 41ac 420f 604f 87e8 fd09 e060     ...B.A.BO`....`.
c0ded212:	3184 0ae0 e01b 70d2 9216 9c2c 5089 6706     .1.....p..,..P.g
c0ded222:	2923 7383 9590 7941 ca28 5ca0 6554 3e60     #).s..Ay(..\Te`>
c0ded232:	329a 42b0 6574 8520 cae8 0a40 9431 1561     .2.Bte ...@.1.a.
c0ded242:	a2c3 9b17 581d 82dc cdcd fc58 2d86 b00c     .....X....X..-..
c0ded252:	1584 30b6 12c5 d8f6 08e2 5c5b 8b62 6c73     ...0......[\b.sl
c0ded262:	6369 0040 b400 b40b 2014 0003                ic@...... ...

c0ded26f <C_Close_40px>:
c0ded26f:	0028 0028 0102 d1e2 c0de                    (.(.......

c0ded279 <C_Info_40px_bitmap>:
c0ded279:	0028 0028 3121 0000 002f 8b1f 0008 0000     (.(.!1../.......
c0ded289:	0000 0302 fffb 147f 0bd0 f030 67ff 0180     ..........0..g..
c0ded299:	2a7e 7189 5a60 80d3 ec45 cf57 f068 0593     ~*.q`Z..E.W.h...
c0ded2a9:	d900 c99e 2019 0003                          ..... ...

c0ded2b2 <C_Info_40px>:
c0ded2b2:	0028 0028 0102 d279 c0de                    (.(...y...

c0ded2bc <C_Mini_Push_40px_bitmap>:
c0ded2bc:	0028 0028 ce21 0000 00cc 8b1f 0008 0000     (.(.!...........
c0ded2cc:	0000 0302 936d 0dcd 30c2 460c 2123 4ea4     ....m....0.F#!.N
c0ded2dc:	ba83 2b01 5230 6037 4604 0762 b006 5c0f     ...+0R7`.Fb....\
c0ded2ec:	4240 4936 2f9c f6bf c9a5 b3d3 3913 aaae     @B6I./.......9..
c0ded2fc:	1085 0eb1 4911 1e0a 7710 829f 6ab0 5a90     .....I...w...j.Z
c0ded30c:	9606 3ac2 08a7 a7f5 a2d1 4761 b5e3 d168     ...:......aG..h.
c0ded31c:	2f6c 053a a92f f019 a4cc fb95 6b3d cac1     l/:./.......=k..
c0ded32c:	53f6 6563 0ef5 8ae1 c043 10f6 3220 db41     .Sce....C... 2A.
c0ded33c:	880e d044 1fee 8588 4d45 6215 5161 8553     ..D.....EM.baQS.
c0ded34c:	2c68 556b 7634 5a4b cf12 e599 bcbb ab36     h,kU4vKZ......6.
c0ded35c:	5c7e fdda 61e4 cbec d6c6 b81e ebcc db95     ~\...a..........
c0ded36c:	af53 def7 791b e96f f9be 9628 eac9 b147     S....yo...(...G.
c0ded37c:	3926 e6b3 a4ce bb37 8cee ff4f 1fc2 8764     &9....7...O...d.
c0ded38c:	9d98 0320 0000                              .. ...

c0ded392 <C_Mini_Push_40px>:
c0ded392:	0028 0028 0102 d2bc c0de                    (.(.......

c0ded39c <C_Privacy_40px_bitmap>:
c0ded39c:	0028 0028 ac21 0001 01aa 8b1f 0008 0000     (.(.!...........
c0ded3ac:	0000 0302 927d 4bbf 50c3 c710 e9af 8b4f     ....}..K.P....O.
c0ded3bc:	1768 0741 b335 fe88 6609 1d28 2c44 1fe2     h.A.5....f(.D,..
c0ded3cc:	2ea0 cdd2 2e0a 6082 a45c b4b8 0ff8 4418     .......`\......D
c0ded3dc:	1c50 b3b4 dd28 60a5 8777 38a2 10e9 b56b     P...(..`w..8..k.
c0ded3ec:	dac6 bce6 97bb 2da6 378a 25e4 f79f f7de     .......-.7.%....
c0ded3fc:	77be c439 a3bf ba75 ca9e f75c 26a1 8448     .w9...u...\..&H.
c0ded40c:	7a2e 23d8 b178 1f40 5e4e 6ad8 7320 7b7e     .z.#x.@.N^.j s~{
c0ded41c:	4cb6 1a70 8cd1 7231 2e21 cf5b 8c06 03a3     .Lp...1r!.[.....
c0ded42c:	1ac2 a730 dc34 2ab5 4166 beee c941 6e97     ..0.4..*fA..A..n
c0ded43c:	63a8 6968 74dd d859 d595 fb88 81c8 5288     .chi.tY........R
c0ded44c:	2181 90c9 a1bb 74a4 16cc 69c7 9e7a 9390     .!.....t...iz...
c0ded45c:	4e29 1eda d913 c423 f127 53ac 07d2 22a8     )N....#.'..S..."
c0ded46c:	e1d6 5d0e 461d 4b72 49c0 30eb f88b 880a     ...].FrK.I.0....
c0ded47c:	10ef 6125 8d93 09ba a8da c904 5c0e 328a     ..%a.........\.2
c0ded48c:	283b 1004 218b 5d44 cd39 2bd2 c9dd 15a3     ;(...!D]9..+....
c0ded49c:	36c1 084c 01ab 6919 24c1 e237 561b 7d84     .6L....i.$7..V.}
c0ded4ac:	8488 c031 51cc 7b85 216b 9bf4 c259 fe9a     ..1..Q.{k!..Y...
c0ded4bc:	92dd 9faa b872 cb24 3521 a8b4 62fe b698     ....r.$.!5...b..
c0ded4cc:	c2a2 4d4c 6cbc 4560 f7eb 916c 5521 cc5b     ..LM.l`E..l.!U[.
c0ded4dc:	86e6 8752 3d5c adc2 7bf7 d9a0 a6dc be99     ..R.\=...{......
c0ded4ec:	2d5e 26b2 a8cb 1e9e 9a13 8b17 3a52 f30c     ^-.&........R:..
c0ded4fc:	3ef3 a327 ca61 ae09 8fcf 084f 5aca f908     .>'.a.....O..Z..
c0ded50c:	35c8 ffbc a35f 5ec4 41ec f3b8 d353 3a1e     .5.._..^.A..S..:
c0ded51c:	f604 9120 5418 b993 8329 5e85 db99 f2e5     .. ..T..)..^....
c0ded52c:	56d5 6002 57d4 75ae b266 f08b 114b a76d     .V.`.W.uf...K.m.
c0ded53c:	a077 f65f c993 81d4 ff8d 0fc5 af18 4ccb     w._............L
c0ded54c:	0320 0000                                    ...

c0ded550 <C_Privacy_40px>:
c0ded550:	0028 0028 0102 d39c c0de                    (.(.......

c0ded55a <C_QRCode_40px_bitmap>:
c0ded55a:	0028 0028 9921 0000 0097 8b1f 0008 0000     (.(.!...........
c0ded56a:	0000 0302 fffb da9f 11e0 0803 bd30 00ff     ............0...
c0ded57a:	fea2 607f 8900 8029 18c5 91f4 20c5 0c42     ...`..)...... B.
c0ded58a:	28fc fc62 1230 c2c2 f62d a3a7 4307 07ec     .(b.0...-....C..
c0ded59a:	0703 ff84 6101 b11e 1062 c0f3 903c 9073     .....a..b...<.s.
c0ded5aa:	25ec 8628 07f0 cc3f 4839 85fe 218b 0b85     .%(...?.9H...!..
c0ded5ba:	923f 49b3 d30a 107f f583 ed90 04f8 99a1     ?..I............
c0ded5ca:	c230 9b14 d19b 19c2 0c55 061e 3a27 a3ce     0.......U...':..
c0ded5da:	1586 d790 d0c0 aa4f 3618 88f3 0b74 7f16     ......O..6..t...
c0ded5ea:	f360 b62f a170 002e 5b00 1eb2 20fb 0003     `./.p....[... ..
	...

c0ded5fb <C_QRCode_40px>:
c0ded5fb:	0028 0028 0102 d55a c0de                    (.(...Z...

c0ded605 <C_Settings_40px_bitmap>:
c0ded605:	0028 0028 9321 0001 0191 8b1f 0008 0000     (.(.!...........
c0ded615:	0000 0302 5275 52b1 40c2 7d10 88c9 9841     ....uR.R.@.}..A.
c0ded625:	8c91 8e56 10ce 5e87 3e46 ec40 93b0 4e8e     ..V....^F>@....N
c0ded635:	03fd 4053 850d 1695 9d62 4a42 b03b 8a93     ..S@....b.BJ;...
c0ded645:	0bf1 04fc 1c1c 40eb a202 3920 2f77 1738     .......@.. 9w/8.
c0ded655:	d818 6f62 e5ef eef2 bbed 6215 8c7d ad4d     ..bo.......b}.M.
c0ded665:	8cba 81d5 25ad 8028 6b61 45dd 87ac 8fac     .....%(.ak.E....
c0ded675:	daac 764f 4e0b 7751 3303 aed6 761c ac42     ..Ov.NQw.3...vB.
c0ded685:	8a01 1084 f9ad 314a 12e5 74f7 2cb5 8c9a     ......J1...t.,..
c0ded695:	300d 976b 5c73 4ae5 8b8e 5734 5c1e 3dc5     .0k.s\.J..4W.\.=
c0ded6a5:	9e43 1197 0a3a e29b 765c 4780 fd85 1aa0     C...:...\v.G....
c0ded6b5:	9e59 5cee 6075 4b8a 57ca 26c0 c381 6890     Y..\u`.K.W.&...h
c0ded6c5:	fac4 2c7b 48e3 1f08 7c17 4593 0557 0a16     ..{,.H...|.EW...
c0ded6d5:	d037 8459 a74e 601f f108 0385 9e21 2d71     7.Y.N..`....!.q-
c0ded6e5:	8d44 19ec 2343 7786 f9a6 8a45 b79a 1d50     D...C#.w..E...P.
c0ded6f5:	84e0 5a08 cc1b 9a7c 0e90 fba5 ef06 716a     ...Z..|.......jq
c0ded705:	76ce 5398 2c73 25fa 6035 a205 fe11 a49b     .v.Ss,.%5`......
c0ded715:	81f4 18f4 b93a c7d3 8b1b a6df 5264 755b     ....:.......dR[u
c0ded725:	59c4 becb af10 c5ac 9ec6 b960 87d4 b385     .Y........`.....
c0ded735:	cb32 a1f5 4bf3 b27d ff65 79bd f9b2 b2d0     2....K}.e..y....
c0ded745:	3d80 6650 5e86 2f05 11b7 5733 3a79 f45c     .=Pf.^./..3Wy:\.
c0ded755:	f25e e8f9 6746 1b24 65be aed0 b864 14ca     ^...Fg$..e..d...
c0ded765:	6e9c 96f8 f913 44d4 2df3 8e8b 8d9a 9aa4     .n.....D.-......
c0ded775:	c911 53bb 8a72 1b9a b158 f976 a9b8 3db8     ...Sr...X.v....=
c0ded785:	3de4 50e9 6624 61a6 6747 dd64 aeec f19c     .=.P$f.aGgd.....
c0ded795:	fc68 4701 f51a 207f 0003                     h..G... ...

c0ded7a0 <C_Settings_40px>:
c0ded7a0:	0028 0028 0102 d605 c0de                    (.(.......

c0ded7aa <C_Warning_40px_bitmap>:
c0ded7aa:	0028 0028 e721 0000 00e5 8b1f 0008 0000     (.(.!...........
c0ded7ba:	0000 0302 d36d 0db1 40c2 850c 47e1 2284     ....m....@...G."
c0ded7ca:	283a d511 88d5 1182 0032 8662 904c 0815     :(......2.b.L...
c0ded7da:	3013 2c03 0ec0 9e88 1025 526d 8450 9d10     .0.,....%.mRP...
c0ded7ea:	73b9 8842 b87d aafc 675f 911f 4b1c 34c1     .sB.}..._g...K.4
c0ded7fa:	0b26 c128 5b44 c08a c0f6 d95a d811 d2e6     &.(.D[....Z.....
c0ded80a:	c0ae a486 81dd 4905 80ab 4939 66ab 4988     .......I..9I.f.I
c0ded81a:	635a be30 7349 11ad c0d3 8c52 240e b5cd     Zc0.Is....R..$..
c0ded82a:	d476 6f9b 6925 2adc 6dad d615 0eb5 c5ed     v..o%i.*.m......
c0ded83a:	25ad 4cfc b04b b93d b035 db42 20db 942e     .%.LK.=.5.B.. ..
c0ded84a:	43d1 773e e2db a970 2e8d 4ac0 9d1b 4c80     .C>w..p....J...L
c0ded85a:	e51b ec3f a6cd ce88 c8ca 5f26 bc1c 6d7d     ..?.......&_..}m
c0ded86a:	5db8 a8ee 76e6 cbb5 5dae bcee 576d c1b7     .]...v...]..mW..
c0ded87a:	caed 5db8 6f9b da37 9fec f49b 81ed ccb9     ...].o7.........
c0ded88a:	785d fef8 7c2f 1300 b8d8 2006 0003           ]x../|..... ...

c0ded899 <C_Warning_40px>:
c0ded899:	0028 0028 0102 d7aa c0de 7544 6d6d 2079     (.(.......Dummy 
c0ded8a9:	0032 6552 6976 7765 7420 6172 736e 6361     2.Review transac
c0ded8b9:	6974 6e6f 740a 206f 6573 646e 4220 4c4f     tion.to send BOL
c0ded8c9:	4f00 6570 6172 6974 6e6f 7320 6769 656e     .Operation signe
c0ded8d9:	0064 6441 7264 7365 2073 6576 6972 6966     d.Address verifi
c0ded8e9:	6163 6974 6e6f 630a 6e61 6563 6c6c 6465     cation.cancelled
c0ded8f9:	5400 6172 736e 6361 6974 6e6f 4320 6568     .Transaction Che
c0ded909:	6b63 7520 616e 6176 6c69 6261 656c 4100     ck unavailable.A
c0ded919:	7070 6f72 6576 5000 6f72 6563 7373 6e69     pprove.Processin
c0ded929:	0067 6c42 6e69 2d64 6973 6e67 3000 302e     g.Blind-sign.0.0
c0ded939:	312e 4800 6c6f 2064 6f74 7320 6769 006e     .1.Hold to sign.
c0ded949:	704f 7265 7461 6f69 206e 6572 656a 7463     Operation reject
c0ded959:	6465 5200 6a65 6365 0074 6552 656a 7463     ed.Reject.Reject
c0ded969:	7420 6172 736e 6361 6974 6e6f 003f 7243      transaction?.Cr
c0ded979:	7469 6369 6c61 7420 7268 6165 2074 6564     itical threat de
c0ded989:	6574 7463 6465 0a2e 6c42 6e69 2064 6973     tected..Blind si
c0ded999:	6e67 6e69 2067 6572 7571 7269 6465 002e     gning required..
c0ded9a9:	6e55 6469 6e65 6974 6966 6465 7220 7369     Unidentified ris
c0ded9b9:	006b 6853 776f 6120 2073 5251 4100 6f6d     k.Show as QR.Amo
c0ded9c9:	6e75 0074 6f47 6220 6361 206b 6f74 6f20     unt.Go back to o
c0ded9d9:	6570 6172 6974 6e6f 5400 6172 736e 6361     peration.Transac
c0ded9e9:	6974 6e6f 4320 6568 6b63 7520 616e 6176     tion Check unava
c0ded9f9:	6c69 6261 656c 0a2e 6c42 6e69 2064 6973     ilable..Blind si
c0deda09:	6e67 6e69 2067 6572 7571 7269 6465 002e     gning required..
c0deda19:	6441 7264 7365 2073 6576 6972 6966 6465     Address verified
c0deda29:	5300 6977 6570 7420 206f 6f63 746e 6e69     .Swipe to contin
c0deda39:	6575 2500 2073 7325 250a 0073 7468 7074     ue.%s %s.%s.http
c0deda49:	3a73 2f2f 7325 4100 6572 7920 756f 7320     s://%s.Are you s
c0deda59:	7275 2065 6f74 610a 6c6c 776f 6420 6d75     ure to.allow dum
c0deda69:	796d 3220 690a 206e 7274 6e61 6173 7463     my 2.in transact
c0deda79:	6f69 736e 003f 7254 6e61 6173 7463 6f69     ions?.Transactio
c0deda89:	206e 6973 6e67 6465 4500 534e 6e20 6d61     n signed.ENS nam
c0deda99:	7365 6120 6572 7220 7365 6c6f 6576 2064     es are resolved 
c0dedaa9:	7962 4c20 6465 6567 2072 6162 6b63 6e65     by Ledger backen
c0dedab9:	2e64 5300 6365 7275 7469 2079 6572 6f70     d..Security repo
c0dedac9:	7472 4400 7665 6c65 706f 7265 2500 0a73     rt.Developer.%s.
c0dedad9:	7325 2520 0073 6c41 6f6c 2077 7564 6d6d     %s %s.Allow dumm
c0dedae9:	2079 0a31 6e69 7420 6172 736e 6361 6974     y 1.in transacti
c0dedaf9:	6e6f 0073 6953 6e67 7420 6172 736e 6361     ons.Sign transac
c0dedb09:	6974 6e6f 740a 206f 6573 646e 4220 4c4f     tion.to send BOL
c0dedb19:	5900 7365 202c 6b73 7069 2500 2073 6572     .Yes, skip.%s re
c0dedb29:	6f70 7472 4700 206f 6162 6b63 7420 206f     port.Go back to 
c0dedb39:	7274 6e61 6173 7463 6f69 006e 6953 6e67     transaction.Sign
c0dedb49:	6d20 7365 6173 6567 4200 6361 206b 6f74      message.Back to
c0dedb59:	7320 6661 7465 0079 654d 7373 6761 2065      safety.Message 
c0dedb69:	6973 6e67 6465 4300 6f6c 6573 5300 6769     signed.Close.Sig
c0dedb79:	206e 7274 6e61 6173 7463 6f69 006e 654c     n transaction.Le
c0dedb89:	6764 7265 5300 6163 206e 6f74 7620 6569     dger.Scan to vie
c0dedb99:	2077 7566 6c6c 7220 7065 726f 0074 6854     w full report.Th
c0dedba9:	7369 7420 6172 736e 6361 6974 6e6f 6f20     is transaction o
c0dedbb9:	2072 656d 7373 6761 2065 6163 6e6e 746f     r message cannot
c0dedbc9:	6220 2065 6564 6f63 6564 2064 7566 6c6c      be decoded full
c0dedbd9:	2e79 4920 2066 6f79 2075 6863 6f6f 6573     y. If you choose
c0dedbe9:	7420 206f 6973 6e67 202c 6f79 2075 6f63      to sign, you co
c0dedbf9:	6c75 2064 6562 6120 7475 6f68 6972 697a     uld be authorizi
c0dedc09:	676e 6d20 6c61 6369 6f69 7375 6120 7463     ng malicious act
c0dedc19:	6f69 736e 7420 6168 2074 6163 206e 7264     ions that can dr
c0dedc29:	6961 206e 6f79 7275 7720 6c61 656c 2e74     ain your wallet.
c0dedc39:	0a0a 654c 7261 206e 6f6d 6572 203a 656c     ..Learn more: le
c0dedc49:	6764 7265 632e 6d6f 652f 0038 6341 6563     dger.com/e8.Acce
c0dedc59:	7470 7420 7268 6165 2074 6e61 2064 6f63     pt threat and co
c0dedc69:	746e 6e69 6575 4100 6c6c 776f 6420 6d75     ntinue.Allow dum
c0dedc79:	796d 3220 690a 206e 7274 6e61 6173 7463     my 2.in transact
c0dedc89:	6f69 736e 5600 7265 6973 6e6f 4d00 726f     ions.Version.Mor
c0dedc99:	0065 6854 7369 7420 6172 736e 6361 6974     e.This transacti
c0dedca9:	6e6f 6320 6e61 6f6e 2074 6562 4320 656c     on cannot be Cle
c0dedcb9:	7261 5320 6769 656e 0064 6559 2c73 7220     ar Signed.Yes, r
c0dedcc9:	6a65 6365 0074 6143 636e 6c65 5400 6968     eject.Cancel.Thi
c0dedcd9:	2073 7274 6e61 6173 7463 6f69 206e 6177     s transaction wa
c0dedce9:	2073 6373 6e61 656e 2064 7361 6d20 6c61     s scanned as mal
c0dedcf9:	6369 6f69 7375 6220 2079 6557 3362 4320     icious by Web3 C
c0dedd09:	6568 6b63 2e73 2500 2064 666f 2520 0064     hecks..%d of %d.
c0dedd19:	6b53 7069 7220 7665 6569 3f77 4200 696c     Skip review?.Bli
c0dedd29:	646e 7320 6769 696e 676e 7220 7165 6975     nd signing requi
c0dedd39:	6572 0064 755b 6b6e 6f6e 6e77 005d 6952     red.[unknown].Ri
c0dedd49:	6b73 6420 7465 6365 6574 0064 6c42 6e69     sk detected.Blin
c0dedd59:	2064 6973 6e67 6e69 2067 6572 7571 7269     d signing requir
c0dedd69:	6465 002e 6e55 6469 6e65 6974 6966 6465     ed..Unidentified
c0dedd79:	7420 7268 6165 0074 6854 7369 6120 6363      threat.This acc
c0dedd89:	756f 746e 6c20 6261 6c65 6320 6d6f 7365     ount label comes
c0dedd99:	6620 6f72 206d 6f79 7275 4120 6464 6572      from your Addre
c0dedda9:	7373 4220 6f6f 206b 6e69 4c20 6465 6567     ss Book in Ledge
c0deddb9:	2072 694c 6576 002e 7243 7469 6369 6c61     r Live..Critical
c0deddc9:	7420 7268 6165 0074 6341 6563 7470 7220      threat.Accept r
c0deddd9:	7369 206b 6e61 2064 6f63 746e 6e69 6575     isk and continue
c0dedde9:	5400 6968 2073 7274 6e61 6173 7463 6f69     .This transactio
c0deddf9:	276e 2073 6564 6174 6c69 2073 7261 2065     n's details are 
c0dede09:	6f6e 2074 7566 6c6c 2079 6576 6972 6966     not fully verifi
c0dede19:	6261 656c 202e 6649 7920 756f 7320 6769     able. If you sig
c0dede29:	2c6e 7920 756f 6320 756f 646c 6c20 736f     n, you could los
c0dede39:	2065 6c61 206c 6f79 7275 6120 7373 7465     e all your asset
c0dede49:	2e73 4700 206f 6162 6b63 7420 206f 656d     s..Go back to me
c0dede59:	7373 6761 0065 6f50 6574 746e 6169 206c     ssage.Potential 
c0dede69:	6972 6b73 6420 7465 6365 6574 2e64 420a     risk detected..B
c0dede79:	696c 646e 7320 6769 696e 676e 7220 7165     lind signing req
c0dede89:	6975 6572 2e64 4d00 444c 4153 4e00 206f     uired..MLDSA.No 
c0dede99:	6874 6572 7461 6420 7465 6365 6574 2064     threat detected 
c0dedea9:	7962 5420 6172 736e 6361 6974 6e6f 4320     by Transaction C
c0dedeb9:	6568 6b63 002e 6c42 6e69 2064 6973 6e67     heck..Blind sign
c0dedec9:	6e69 2067 6861 6165 0064 654d 7373 6761     ing ahead.Messag
c0deded9:	2065 6572 656a 7463 6465 5200 6a65 6365     e rejected.Rejec
c0dedee9:	2074 706f 7265 7461 6f69 3f6e 3000 3231     t operation?.012
c0dedef9:	3433 3635 3837 4139 4342 4544 0046 656e     3456789ABCDEF.ne
c0dedf09:	7774 726f 2e6b 4200 4c4f 2520 2a2e 0073     twork..BOL %.*s.
c0dedf19:	6441 7264 7365 0073 6649 7920 756f 7227     Address.If you'r
c0dedf29:	2065 7573 6572 7920 756f 6420 6e6f 7427     e sure you don't
c0dedf39:	6e20 6565 2064 6f74 7220 7665 6569 2077      need to review 
c0dedf49:	6c61 206c 6966 6c65 7364 202c 6f79 2075     all fields, you 
c0dedf59:	6163 206e 6b73 7069 7320 7274 6961 6867     can skip straigh
c0dedf69:	2074 6f74 7320 6769 696e 676e 002e 6649     t to signing..If
c0dedf79:	7920 756f 7227 2065 6f6e 2074 7375 6e69      you're not usin
c0dedf89:	2067 6874 0a65 654c 6764 7265 4c20 7669     g the.Ledger Liv
c0dedf99:	2065 7061 2c70 5420 6172 736e 6361 6974     e app, Transacti
c0dedfa9:	6e6f 4320 6568 6b63 6d20 6769 7468 6e20     on Check might n
c0dedfb9:	746f 7720 726f 2e6b 4920 2066 6f79 2075     ot work. If you 
c0dedfc9:	7261 2065 7375 6e69 2067 654c 6764 7265     are using Ledger
c0dedfd9:	4c20 7669 2c65 7220 6a65 6365 2074 6874      Live, reject th
c0dedfe9:	2065 7274 6e61 6173 7463 6f69 206e 6e61     e transaction an
c0dedff9:	2064 7274 2079 6761 6961 2e6e 0a0a 6547     d try again...Ge
c0dee009:	2074 6568 706c 6120 2074 656c 6764 7265     t help at ledger
c0dee019:	632e 6d6f 652f 3131 5400 6968 2073 7274     .com/e11.This tr
c0dee029:	6e61 6173 7463 6f69 206e 6177 2073 6373     ansaction was sc
c0dee039:	6e61 656e 2064 7361 7220 7369 796b 6220     anned as risky b
c0dee049:	2079 6557 3362 4320 6568 6b63 2e73 4400     y Web3 Checks..D
c0dee059:	6d75 796d 3120 4900 7520 646e 7265 7473     ummy 1.I underst
c0dee069:	6e61 2c64 6320 6e6f 6966 6d72 4e00 206f     and, confirm.No 
c0dee079:	6874 6572 7461 6420 7465 6365 6574 0064     threat detected.
c0dee089:	7254 6e61 6173 7463 6f69 206e 6572 656a     Transaction reje
c0dee099:	7463 6465 4700 206f 6162 6b63 7420 206f     cted.Go back to 
c0dee0a9:	6572 6976 7765 4300 6972 6974 6163 206c     review.Critical 
c0dee0b9:	6874 6572 7461 6420 7465 6365 6574 2e64     threat detected.
c0dee0c9:	5300 6769 206e 706f 7265 7461 6f69 006e     .Sign operation.
c0dee0d9:	6544 6574 7463 6465 6220 2079 7325 0000     Detected by %s..
c0dee0e9:	6b53 7069 5000 746f 6e65 6974 6c61 7220     Skip.Potential r
c0dee0f9:	7369 206b 6564 6574 7463 6465 002e 6f4e     isk detected..No
c0dee109:	7420 7268 6165 2074 6564 6574 7463 6465      threat detected
c0dee119:	6220 2079 7254 6e61 6173 7463 6f69 206e      by Transaction 
c0dee129:	6843 6365 206b 7562 2074 6c62 6e69 2064     Check but blind 
c0dee139:	6973 6e67 6e69 2067 6572 7571 7269 6465     signing required
c0dee149:	002e 6f50 6574 746e 6169 206c 6972 6b73     ..Potential risk
c0dee159:	5600 7265 6669 2079 4f42 204c 6461 7264     .Verify BOL addr
c0dee169:	7365 0073 6f43 746e 6e69 6575 6120 796e     ess.Continue any
c0dee179:	6177 0079 7551 7469 6120 7070 5300 6977     way.Quit app.Swi
c0dee189:	6570 7420 206f 6572 6976 7765 5400 6968     pe to review.Thi
c0dee199:	2073 7061 2070 6e65 6261 656c 2073 6973     s app enables si
c0dee1a9:	6e67 6e69 0a67 7274 6e61 6173 7463 6f69     gning.transactio
c0dee1b9:	736e 6f20 206e 6874 0065 7254 6e61 6173     ns on the.Transa
c0dee1c9:	7463 6f69 206e 6843 6365 206b 6964 6e64     ction Check didn
c0dee1d9:	7427 6620 6e69 2064 6e61 2079 6874 6572     't find any thre
c0dee1e9:	7461 202c 7562 2074 6c61 6177 7379 7220     at, but always r
c0dee1f9:	7665 6569 2077 7274 6e61 6173 7463 6f69     eview transactio
c0dee209:	206e 6564 6174 6c69 2073 6163 6572 7566     n details carefu
c0dee219:	6c6c 2e79 4300 6e6f 6966 6d72 5200 6a65     lly..Confirm.Rej
c0dee229:	6365 2074 656d 7373 6761 3f65 0000 a300     ect message?....
c0dee239:	c03b a0a7 138c d4c0 17c1 dd4d 6a88 4cac     ;.........M..j.L
c0dee249:	6656 f4e1 1f83 6c00 1995 6bd3 e82c           Vf.....l...k,..

c0dee258 <handler_cmd_verify_dilithium.sig>:
c0dee258:	7c23 887b 7320 2c3d 53f3 f845 51a8 6099     #|{. s=,.SE..Q.`
c0dee268:	6761 7055 42ce 3e92 cde2 7e43 b441 b3a9     agUp.B.>..C~A...
c0dee278:	4891 711f e9ec b6e0 584c 734a 0d71 688d     .H.q....LXJsq..h
c0dee288:	938a c00a 02bf f5ab 6e7c 0947 24e7 e4a9     ........|nG..$..
c0dee298:	8c17 9062 bc18 730b 7ab3 7d08 e7d3 8dea     ..b....s.z.}....
c0dee2a8:	5ba6 4511 febc 1aed 127c 6023 af7e ef0a     .[.E....|.#`~...
c0dee2b8:	ab04 602b 74d4 9460 625c 4f1a 5693 0b13     ..+`.t`.\b.O.V..
c0dee2c8:	5ecb f094 710c 1c0d 99fe 5ec0 cfa0 079e     .^...q.....^....
c0dee2d8:	5779 367f 5671 1603 24bf 9cec 57f2 132b     yW.6qV...$...W+.
c0dee2e8:	a5e9 5f0d cabc dc4d 81e4 40f7 1ddb 207e     ..._..M....@..~ 
c0dee2f8:	6802 9645 d629 b56e b5a0 3a60 46d6 4a8a     .hE.).n...`:.F.J
c0dee308:	4904 848d 62df 39ee 6f4d a3c5 b1a7 9def     .I...b.9Mo......
c0dee318:	cee0 88be 8e16 6f5d 1e77 1efc 15a3 8be7     ......]ow.......
c0dee328:	cb83 0e2c 8ff8 7e16 70e1 fddf 9adb a5ca     ..,....~.p......
c0dee338:	38df f10a 03f8 7453 6a6b 3055 fdc9 45e8     .8....StkjU0...E
c0dee348:	ec8e b499 dc78 67c6 3632 77b2 1cc4 9ede     ....x..g26.w....
c0dee358:	58ba 986b 1408 cf6c 6fae bed8 d0a1 4f65     .Xk...l..o....eO
c0dee368:	ca65 58c7 b73a 0705 b111 22a3 dad8 6a6c     e..X:......"..lj
c0dee378:	16ad 8a60 5390 55a6 0d58 0166 c96f face     ..`..S.UX.f.o...
c0dee388:	7fa1 fee0 08d5 bd0d aa4d 9296 67f9 2494     ........M....g.$
c0dee398:	283a 6713 d57a e142 64e1 a9ef 1b34 fdd0     :(.gz.B..d..4...
c0dee3a8:	95ba 1b6a 594b 1a4f fb70 143c d1ae 7b21     ..j.KYO.p.<...!{
c0dee3b8:	1d86 74cb 569a 81b2 5d20 f57d 72d4 8fa0     ...t.V.. ]}..r..
c0dee3c8:	76b3 5595 dd24 01a1 cc7b e88b 6857 1d19     .v.U$...{...Wh..
c0dee3d8:	180e 0f57 f2a8 bd63 2a59 538d cf58 6a7f     ..W...c.Y*.SX..j
c0dee3e8:	8ec2 660c 7647 f5ac 681b f29c 66e9 cb03     ...fGv...h...f..
c0dee3f8:	e17d 7849 56cc 08f0 a219 b517 5eae 083c     }.Ix.V.......^<.
c0dee408:	483c 5a7f c023 3979 7c73 d69e a5b2 041e     <H.Z#.y9s|......
c0dee418:	9df3 69dc 56da 889b 4f05 47c6 0969 5680     ...i.V...O.Gi..V
c0dee428:	35d8 7539 0c9d 87c4 11a7 5b12 3df7 f6e1     .59u.......[.=..
c0dee438:	1667 f595 3663 5345 6c4e d3b2 6474 3c5c     g...c6ESNl..td\<
c0dee448:	d39f 539c c447 2fb8 a4b1 fb52 13b6 3c7f     ...SG../..R....<
c0dee458:	0e47 fcb1 4072 c2a5 81a2 dda1 6745 0708     G...r@......Eg..
c0dee468:	2b55 0dcc 0a16 7567 dfb6 bceb 5068 b70e     U+....gu....hP..
c0dee478:	1e6e db96 a01c 14f3 c913 876f 4a35 07b7     n.........o.5J..
c0dee488:	771c c986 7de6 640d 2876 d62b af76 fe23     .w...}.dv(+.v.#.
c0dee498:	71eb b727 4d86 a7ac 992f 854a 10bd f6f1     .q'..M../.J.....
c0dee4a8:	a16e 0824 f982 28b6 f195 0a9c d1aa 35cf     n.$....(.......5
c0dee4b8:	a8cd 311b 9319 4d19 7397 d937 07a1 a728     ...1...M.s7...(.
c0dee4c8:	d8f3 8d2c e37f d75c 7d04 3c23 fe8e 9b1d     ..,...\..}#<....
c0dee4d8:	b266 8c82 589b c22d 60e4 8356 e6ac 76be     f....X-..`V....v
c0dee4e8:	35ba 6d1b 1d7a 3ab2 8581 174d 60e9 7d1e     .5.mz..:..M..`.}
c0dee4f8:	9bc6 aeea 2664 30ef 0073 8d50 4b20 3043     ....d&.0s.P. KC0
c0dee508:	e026 4d53 f0d0 3b12 2506 2425 9f76 862f     &.SM...;.%%$v./.
c0dee518:	1c77 f58c 82ee b3f0 01b3 2808 00a3 8857     w..........(..W.
c0dee528:	af71 609b f331 4243 2dcb a45e 3c09 b650     q..`1.CB.-^..<P.
c0dee538:	b121 4802 a3d0 1c2c 68d5 a54c 5f0b 8698     !..H..,..hL.._..
c0dee548:	dfe2 ec6d 21a3 d53b 79cd 3bd6 c85d 6b26     ..m..!;..y.;].&k
c0dee558:	4deb be80 d8ee 9e2c 01e8 35ed a9c6 99f6     .M....,....5....
c0dee568:	e847 e706 1791 5b3b 3e88 1920 7325 5ee8     G.....;[.> .%s.^
c0dee578:	0370 9cf9 b45a e717 032f 3e56 3bb9 3f16     p...Z.../.V>.;.?
c0dee588:	234c 6700 8c5e b91a 0cf8 2cf6 b188 6f87     L#.g^......,...o
c0dee598:	bdd0 5842 e0e0 da83 2e71 1f34 cebb 37ef     ..BX....q.4....7
c0dee5a8:	9ed5 0f09 ca6e b30c e6e8 feb7 7f1c c335     ....n.........5.
c0dee5b8:	dba9 8c95 73d2 c5fc b281 e385 3c0e 7135     .....s.......<5q
c0dee5c8:	014f edd2 06a3 e6a6 966d d409 88ae 8b24     O.......m.....$.
c0dee5d8:	6af7 1a99 8bcb 3283 aa55 cbaf 4927 008d     .j.....2U...'I..
c0dee5e8:	ff9e a50a 4e26 7418 7eb1 46b6 cedf 0747     ....&N.t.~.F..G.
c0dee5f8:	bfe8 46b9 bfba f7a4 feaf 8c38 5606 dcb9     ...F......8..V..
c0dee608:	8b4a 67bc 640e 26d4 db76 3c5b 17d0 6dce     J..g.d.&v.[<...m
c0dee618:	e252 7d54 7443 665e 9bed a21c 8522 5494     R.T}Ct^f...."..T
c0dee628:	4c6b 632c 526f de4e 5dc6 de9a a960 3bfd     kL,coRN..]..`..;
c0dee638:	8625 16af da9a 5764 854d 4c59 acba 385f     %.....dWM.YL.._8
c0dee648:	d327 31c4 517e 2c72 7f49 dc09 4baa 4f7c     '..1~Qr,I....K|O
c0dee658:	bd03 ef4f a83b d347 258d cc2f d7ec 07e2     ..O.;.G..%/.....
c0dee668:	0f83 d6e4 3307 95b4 b527 9ed2 d271 36b7     .....3..'...q..6
c0dee678:	7da9 349d 5f47 81b0 bcd0 1088 7f50 2a67     .}.4G_......P.g*
c0dee688:	32e0 bc32 a332 713c 3f1a 8212 e16f 1f80     .22.2.<q.?..o...
c0dee698:	9640 6120 d3e3 ebfd 6833 1ee9 89ab da2c     @. a....3h....,.
c0dee6a8:	8fc1 060e 31a4 672e 45f4 8d57 afbe f554     .....1.g.EW...T.
c0dee6b8:	cbc3 aedb b20a 84dd 5a52 2532 373b d820     ........RZ2%;7 .
c0dee6c8:	9b3c 503e f0ec 4c55 d189 d35b b052 6b63     <.>P..UL..[.R.ck
c0dee6d8:	b740 389d 5cfc 5eca 6c69 f01f 2fcd 3409     @..8.\.^il.../.4
c0dee6e8:	3efb dcaa 1bcc 5f6d 55ac b644 5cfe 0a6e     .>....m_.UD..\n.
c0dee6f8:	7c31 cf4f 2bff 701f 8b71 4e7e f37c 3bdb     1|O..+.pq.~N|..;
c0dee708:	c0f1 0302 f51e 040c df9b 3bfc 3578 0b8e     ...........;x5..
c0dee718:	0ee2 7eb5 1bd4 04ae d0cd 9190 efaf 57a4     ...~...........W
c0dee728:	aea8 33bb 3776 e00e 7f4a d448 b744 17f1     ...3v7..J.H.D...
c0dee738:	da0e 8eb6 970b 8f0e 85c2 7609 6c53 bbe3     ...........vSl..
c0dee748:	5814 f06a ae6b 17ac 7812 e9a5 e049 f70a     .Xj.k....x..I...
c0dee758:	b0cd b8d4 2441 cc4c 79cc f37f 41fd 0787     ....A$L..y...A..
c0dee768:	4c7d 339d 3c87 0bab e6f6 5990 901b f821     }L.3.<.....Y..!.
c0dee778:	520c 74d4 0594 c11a 75ff 4b55 196b 9007     .R.t.....uUKk...
c0dee788:	c53d ec30 426b 25d0 23f7 d4d7 39e5 2e22     =.0.kB.%.#...9".
c0dee798:	3e68 5347 4125 5ff2 b014 07c0 93b0 ccb7     h>GS%A._........
c0dee7a8:	c0bf 2e17 e578 5143 637f 4921 42d8 1a82     ....x.CQ.c!I.B..
c0dee7b8:	412b 0d4d aab9 39c1 5e8b c299 ef69 304e     +AM....9.^..i.N0
c0dee7c8:	133e f973 dfbc 1182 5cb5 ec65 f919 043a     >.s......\e...:.
c0dee7d8:	a722 8c14 d4ab 11c3 1af1 ef49 57c7 4d53     ".........I..WSM
c0dee7e8:	ca00 c8e3 b84c e949 1975 4531 8953 f817     ....L.I.u.1ES...
c0dee7f8:	2512 96cc 7b45 a2c1 8fab 2aa7 85fa dc63     .%..E{.....*..c.
c0dee808:	4731 ff66 9ad1 db10 da92 9abf 5606 6706     1Gf..........V.g
c0dee818:	d328 f584 2298 a99f 904e 8a6b 2232 dfb0     (...."..N.k.2"..
c0dee828:	64e1 d9af 16c1 1cf3 5e31 3fe5 0bfb 580d     .d......1^.?...X
c0dee838:	e02e faab 59d2 b4f1 5c09 a300 6747 d43f     .....Y...\..Gg?.
c0dee848:	7ee1 d8a7 74f9 f2db 90ed 1c31 67b1 1ad6     .~...t....1..g..
c0dee858:	eaeb 0b7b a317 5b4f 1f72 afec bccf ea3f     ..{...O[r.....?.
c0dee868:	09c7 811b 1f85 5b8a 1a05 8edd 4a72 3350     .......[....rJP3
c0dee878:	a586 703b 06d1 6ad8 8199 573d f79e 065a     ..;p...j..=W..Z.
c0dee888:	f75c c10c 9dab c380 019a c5d3 6094 ef49     \............`I.
c0dee898:	8ded 384e 5c3b 58a6 a927 e0ce ba8c 2a79     ..N8;\.X'.....y*
c0dee8a8:	3390 f747 7a54 7464 8e5f d717 0d1a d740     .3G.Tzdt_.....@.
c0dee8b8:	151d 4b48 689a c814 3062 05aa 9e53 7c90     ..HK.h..b0..S..|
c0dee8c8:	dadd fb5e 6231 56c3 58f3 bc29 a232 c88b     ..^.1b.V.X).2...
c0dee8d8:	c90e 4e45 fe5b 4ac2 d76d 7546 b9e3 6413     ..EN[..Jm.Fu...d
c0dee8e8:	3d7f 6a17 7367 a0c1 0ee4 17dd d1ec ee3a     .=.jgs........:.
c0dee8f8:	9334 0b71 5411 55f8 59f2 621e 70cc c673     4.q..T.U.Y.b.ps.
c0dee908:	bb08 77aa 4e10 498d b693 f87c 651f 89af     ...w.N.I..|..e..
c0dee918:	c9c8 691d 755f da60 8aa6 41d1 cb60 f47d     ...i_u`....A`.}.
c0dee928:	a6e7 181b 2560 2053 b8db 6713 f16d 5c28     ....`%S ...gm.(\
c0dee938:	5a01 99ec 7b4d cec0 7529 1614 1eb3 5bd1     .Z..M{..)u.....[
c0dee948:	1769 6829 aadd 5651 b892 bcfe 4ecb 9832     i.)h..QV.....N2.
c0dee958:	bfe8 9c16 b920 9065 803b 6ff2 a620 bda3     .... .e.;..o ...
c0dee968:	ac5f bcd1 c638 17c8 3be2 51f3 ff87 f975     _...8....;.Q..u.
c0dee978:	ae82 d69e 435a 19f6 619b 84ae 3e68 ef1b     ....ZC...a..h>..
c0dee988:	9ccf 7801 eab8 9028 6af9 086e 3dd3 c344     ...x..(..jn..=D.
c0dee998:	50ce ccd9 1cbd 96df 6bdf 5e2f 1c8f b06c     .P.......k/^..l.
c0dee9a8:	0043 f6f7 83d4 8310 ae90 eda8 b031 327b     C...........1.{2
c0dee9b8:	7cc8 2a54 75b4 6d94 5e52 c124 2d6b fb0a     .|T*.u.mR^$.k-..
c0dee9c8:	6886 477e e7cc b5ab fcb7 d641 95a9 593a     .h~G......A...:Y
c0dee9d8:	b2a8 d021 b757 8493 fa5c 14b4 6b72 5337     ..!.W...\...rk7S
c0dee9e8:	7cd8 0202 fb53 7293 6322 eece a693 cf6a     .|..S..r"c....j.
c0dee9f8:	3c16 eb86 d67b 3621 0ef7 14c4 56b5 6228     .<..{.!6.....V(b
c0deea08:	20f1 ee2d feb9 79af 4181 e26b 9ca0 7c0e     . -....y.Ak....|
c0deea18:	181f 95ee 4b31 d054 7b49 29ac d986 9e0e     ....1KT.I{.)....
c0deea28:	99d3 2002 6ae9 62e1 112e eef2 c191 61b1     ... .j.b.......a
c0deea38:	e728 4a38 fa87 67bc c731 b0b0 b70b fd07     (.8J...g1.......
c0deea48:	be1a 9203 5ec9 434c 6054 7db4 9921 9b82     .....^LCT`.}!...
c0deea58:	6b07 f64e 1ab1 28d3 ca25 57d8 a694 ee74     .kN....(%..W..t.
c0deea68:	d6fd 3d17 39ca bfdc 7c39 951b 3831 720a     ...=.9..9|..18.r
c0deea78:	42d1 d4b7 5d00 4f88 d5cb 1192 7882 fc20     .B...].O.....x .
c0deea88:	2b5b 05c6 c7e5 c317 121e d14c 71f5 d480     [+........L..q..
c0deea98:	59ba 3388 97f0 6f05 9b80 2171 be4f 5fe2     .Y.3...o..q!O.._
c0deeaa8:	e77f 4ef1 f83d 6bcb 6cbf 3d3f 28e8 f785     ...N=..k.l?=.(..
c0deeab8:	fd1b 4e87 7a6b 1dd1 21b7 d70f 0c3c aacb     ...Nkz...!..<...
c0deeac8:	f060 a808 596a 86a9 0c0c 1685 da72 b017     `...jY......r...
c0deead8:	d377 7759 2cc5 5bf3 6df0 0f45 c03e 9761     w.Yw.,.[.mE.>.a.
c0deeae8:	627f 2473 5ac5 a3ad c661 b3ab 77de 28e8     .bs$.Z..a....w.(
c0deeaf8:	3aa6 6def 7cc3 0cdf 3baf c398 09a4 cde3     .:.m.|...;......
c0deeb08:	d2bd d0ed 4fdc 1aeb de6e f78d 2c25 58b6     .....O..n...%,.X
c0deeb18:	3f41 7222 4281 4d30 027d 6eb0 8b43 8110     A?"r.B0M}..nC...
c0deeb28:	774f a431 e789 6b9b 6b8a ca0f 636b 9afe     Ow1....k.k..kc..
c0deeb38:	ff61 9429 4b70 f9df e118 6aae df99 d307     a.).pK.....j....
c0deeb48:	8ae1 6821 4690 9753 edb6 f4a5 d27a 16f2     ..!h.FS.....z...
c0deeb58:	7581 b844 0c84 f16a 4d70 719a 2ca0 b673     .uD...j.pM.q.,s.
c0deeb68:	9fa2 fbb6 7817 977d 98a8 9047 47a3 0536     .....x}...G..G6.
c0deeb78:	0706 3d09 553f 9b7d afa5 ceb8 d4d3 e1de     ...=?U}.........
c0deeb88:	eee8 f8f1 01fc 4717 554f 968c b4b2 d6c2     .......GOU......
c0deeb98:	f8d9 9143 aa98 cac0 d3d2 edea 1a0d 3d24     ..C...........$=
c0deeba8:	4544 8664 dccf e6e4 00f1 0000 0000 0000     DEd.............
	...
c0deebc8:	2215 392c 1cd8 8d4d 4f73 fbcb deea 3f3d     .",9..M.sO....=?
c0deebd8:	038a aa9f 2c2a 5799 35e8 55ad 2eb2 bf75     ....*,.W.5.U..u.
c0deebe8:	bb57 6a55                                    W.Uj.

c0deebed <handler_cmd_verify_dilithium.pk>:
c0deebed:	7bdc a2c9 b6e0 66dc 3a82 fbe4 97de 0c1c     .{.....f.:......
c0deebfd:	46fc d9f9 bf6b ebbe 47b3 e00a a0a5 9f13     .F..k....G......
c0deec0d:	6add e56c 76bc 4fe9 9eaa 5092 d4ab e0ce     .jl..v.O...P....
c0deec1d:	f12c 46ee e9a8 e19c 732d 7895 a71f 9051     ,..F....-s.x..Q.
c0deec2d:	2721 a33d 5536 7219 fb4e 79e2 d6ad 5fc3     !'=.6U.rN..y..._
c0deec3d:	c992 2bd4 2803 f132 29bf beeb 3ecd 7ac8     ...+.(2..)...>.z
c0deec4d:	f33a 33da 11c6 f3f7 a35f ca5a 74b1 4f02     :..3...._.Z..t.O
c0deec5d:	8911 e279 f23b 06fe 6992 eca2 fb45 b9c1     ..y.;....i..E...
c0deec6d:	fbc1 1f0e 4805 6a6a 3e83 8ab4 29dc 6460     .....Hjj.>...)`d
c0deec7d:	9a1d ebf6 738b b181 55ec 89d8 6bf2 4d08     .....s...U...k.M
c0deec8d:	a1df edc9 969b 342d 9426 dece 8283 0953     ......-4&.....S.
c0deec9d:	dbd9 d66b 75ba 1382 3425 1e86 a044 8843     ..k..u..%4..D.C.
c0deecad:	94a6 2424 7611 341d c0e7 d285 b782 c623     ..$$.v.4......#.
c0deecbd:	4859 aca2 4d76 0297 8ebd fed7 3199 d8d7     YH..vM.......1..
c0deeccd:	4a70 e639 8850 f344 48f8 c343 5905 e64f     pJ9.P.D..HC..YO.
c0deecdd:	40e5 084e 8ef1 39d0 65ac cb63 34aa cab0     .@N....9.ec..4..
c0deeced:	3238 9902 25d6 c06e 8df7 1f42 8108 d459     82...%n...B...Y.
c0deecfd:	c49d cb39 39c5 58a5 a384 4eeb 9cfc 90f1     ..9..9.X...N....
c0deed0d:	2fb4 3471 cb41 0097 4542 14d4 a337 7b9b     ./q4A...BE..7..{
c0deed1d:	fc77 2f60 fdbb 9a61 3642 1437 65b2 3c17     w.`/..a.B67..e.<
c0deed2d:	68ae 8afd 3c1b bda2 ae30 c560 563e 5704     .h...<..0.`.>V.W
c0deed3d:	4a7a 1f3b 0615 97e6 74c3 db32 83d8 3a55     zJ;......t2...U:
c0deed4d:	8dac 2a38 253d f50c 9eb2 1b4d cbe2 53cd     ..8*=%....M....S
c0deed5d:	f01f 7ee0 c189 dbf7 d4c8 9a52 beee b555     ...~......R...U.
c0deed6d:	4dce 1402 debf 9ec6 0b08 efd3 cc36 a5a6     .M..........6...
c0deed7d:	3349 eff1 372f 7c86 380d 58fd b865 2979     I3../7.|.8.Xe.y)
c0deed8d:	5811 c708 59e2 5854 93e9 ccba 5a6c 9f3b     .X...YTX....lZ;.
c0deed9d:	2550 1e00 419b 7744 bf08 a0ba 2e46 63fa     P%...ADw....F..c
c0deedad:	6c87 f742 9069 438b 542f 5085 398a 2432     .lB.i..C/T.P.92$
c0deedbd:	0596 d751 ad7e f4fa 1c41 49bc fffd f246     ..Q.~...A..I..F.
c0deedcd:	55f1 d6dd 30ec 7986 b705 8809 a08c 0ff3     .U...0.y........
c0deeddd:	5f93 d7b8 80f4 fc3c 5f7a 9077 18ca 991d     ._....<.z_w.....
c0deeded:	21ca 62f2 691d c6a5 9cd4 b476 9d96 27a6     .!.b.i....v....'
c0deedfd:	a340 4778 3203 09b3 ab47 cc31 9bdb c7a0     @.xG.2..G.1.....
c0deee0d:	25b6 9e87 4bec 1fd8 0002 23ba 4a50 c37d     .%...K.....#PJ}.
c0deee1d:	18b1 2abc 14b1 f15d f33a ccc8 f539 8777     ...*..].:...9.w.
c0deee2d:	843b 1b91 853d bffb b14c 4d9e b136 930a     ;...=...L..M6...
c0deee3d:	eb8e b578 dc99 6186 d65f c6ce 7beb 7a8f     ..x....a_....{.z
c0deee4d:	5ffa 6b6d 9ee1 16a8 d330 cf6c f4b2 de87     ._mk....0.l.....
c0deee5d:	d050 46cf 8dda e33f 2851 0412 0e3c f23e     P..F..?.Q(..<.>.
c0deee6d:	23d7 b01f a3b0 0f5a 83b2 30be 24a1 8077     .#....Z....0.$w.
c0deee7d:	0af3 29e0 8b4e 586f 3897 db3e 5589 f595     ...)N.oX.8>..U..
c0deee8d:	5277 f54d 9345 f9cd b427 7696 ee16 1339     wRM.E...'..v..9.
c0deee9d:	d6e4 9bb2 bd0d 337c a4a2 4e5e b1f1 4e95     ......|3..^N...N
c0deeead:	d9a5 e31c fc7e 0213 cee7 a902 9573 5d56     ....~.......s.V]
c0deeebd:	a5a2 d3c5 b0fd 76d8 e984 c0b1 07ad 33ec     .......v.......3
c0deeecd:	2ddf d5fa e228 09ea d266 7da4 eed5 e788     .-..(...f..}....
c0deeedd:	657d 0d3c 4f00 01ab f065 7c75 a44d f30a     }e<..O..e.u|M...
c0deeeed:	e727 2519 c736 4799 0aa8 7a82 10a2 ac7d     '..%6..G...z..}.
c0deeefd:	e3fa bfde fac8 d6d3 80e0 d976 c538 a210     ..........v.8...
c0deef0d:	bd76 72f6 1f1a 7c08 69b1 5051 ad28 e25c     v..r...|.iQP(.\.
c0deef1d:	107a ab47 28d9 9309 a64c 893b 713f a3f9     z.G..(..L.;.?q..
c0deef2d:	994a fdc0 3130 470c aae9 3937 0a4d 3bb7     J...01.G..79M..;
c0deef3d:	4d25 a63c 9c9d 4955 47c9 ae9a 2624 c54a     %M<...UI.G..$&J.
c0deef4d:	64ea fdd3 1c82 6239 77ec 09e7 d3f9 c70b     .d....9b.w......
c0deef5d:	5ab6 e452 168c 06e8 5503 ac8c 81a1 1114     .ZR......U......
c0deef6d:	15c3 1f5d 9f94 cfc9 a99a 5a38 9971 9be9     ..].......8Zq...
c0deef7d:	7ae7 fa66 eed7 12d9 de58 b255 c8c4 9a3f     .zf.....X.U...?.
c0deef8d:	0a05 bede f0a5 5897 0df4 4aac 391c e84e     .......X...J.9N.
c0deef9d:	87d6 9187 d250 2664 5a89 93b1 148e 11ae     ....P.d&.Z......
c0deefad:	76b3 4c25 fc91 3061 6943 f896 43ed 27bd     .v%L..a0Ci...C.'
c0deefbd:	20be 90ec 1167 111c c96e c24c 6cb0 1ac9     . ..g...n.L..l..
c0deefcd:	c513 0bd1 7ebd eaec 9247 7bf1 772b 1e63     .....~..G..{+wc.
c0deefdd:	45f1 fbe9 a841 aa3e c211 2ab7 fb48 fd90     .E..A.>....*H...
c0deefed:	88bd 4c64 df4e b28a ce0d 1831 4b36 6a27     ..dLN.....1.6K'j
c0deeffd:	23c1 367b 92c8 346e ab6a 115a a01a 34bf     .#{6..n4j.Z....4
c0def00d:	511c 7b8b 9eff bb9d cb8b 2847 1b60 6037     .Q.{......G(`.7`
c0def01d:	3e66 6567 3103 fbe6 ac54 fc82 4c41 ddb8     f>ge.1..T...AL..
c0def02d:	16fc 250a 1e31 27c5 e42d 1762 f8fe 92b9     ...%1..'-.b.....
c0def03d:	89ff 4f75 e3be f251 b91b 6c0b 0797 518b     ..uO..Q....l...Q
c0def04d:	980c 5033 1268 c866 d1fe 58f0 513c e751     ..3Ph.f....X<QQ.
c0def05d:	feb8 723b 3192 9996 7c68 b6c6 fd41 68bd     ..;r.1..h|..A..h
c0def06d:	2894 3b54 fac0 ac1f 09c1 65de 27b6 c284     .(T;.......e.'..
c0def07d:	85d9 15ab 7dd7 f13a f62a 3ed0 188d a559     .....}:.*..>..Y.
c0def08d:	6853 8485 5ed7 73f6 dea1 0974 e13e c708     Sh...^.s..t.>...
c0def09d:	ff61 2cf3 7c21 1b23 290e da53 21f5 9242     a..,!|#..)S..!B.
c0def0ad:	c064 3b96 a5c8 edcd 61dc 727a b985 ea34     d..;.....azr..4.
c0def0bd:	dd51 cdb5 23ab edbc 6be8 6ee3 1b00 5cc6     Q....#...k.n...\
c0def0cd:	e965 c9a1 af4b faf4 ebb8 8e5f 2ed4 77c3     e...K....._....w
c0def0dd:	3642 fe33 0400 4291 7c46 c547 8ad5 0272     B63....BF|G...r.
c0def0ed:	e9c8 4810 c141 f3f7 1480 6a5a 820a 578c     ...HA.....Zj...W
c0def0fd:	3502 07e5 58ae a668 2f06 2b72 8fb9 bef6     .5...Xh../r+....
c0def10d:	0000                                         ...

c0def110 <settingContents>:
c0def110:	0000 0000 f12c c0de 0001 0000               ....,.......

c0def11c <infoList>:
c0def11c:	f164 c0de f16c c0de 0000 0000 0002 0000     d...l...........

c0def12c <contents>:
c0def12c:	0007 0000 13d4 da7a 0002 0000 0000 0000     ......z.........
	...
c0def160:	0ac9 c0de                                   ....

c0def164 <INFO_TYPES>:
c0def164:	dc8e c0de dacc c0de                         ........

c0def16c <INFO_CONTENTS>:
c0def16c:	d936 c0de db87 c0de 0000 0000               6...........

c0def178 <pqcrystals_dilithium_fips202_ref_KeccakF_RoundConstants>:
c0def178:	0001 0000 0000 0000 8082 0000 0000 0000     ................
c0def188:	808a 0000 0000 8000 8000 8000 0000 8000     ................
c0def198:	808b 0000 0000 0000 0001 8000 0000 0000     ................
c0def1a8:	8081 8000 0000 8000 8009 0000 0000 8000     ................
c0def1b8:	008a 0000 0000 0000 0088 0000 0000 0000     ................
c0def1c8:	8009 8000 0000 0000 000a 8000 0000 0000     ................
c0def1d8:	808b 8000 0000 0000 008b 0000 0000 8000     ................
c0def1e8:	8089 0000 0000 8000 8003 0000 0000 8000     ................
c0def1f8:	8002 0000 0000 8000 0080 0000 0000 8000     ................
c0def208:	800a 0000 0000 0000 000a 8000 0000 8000     ................
c0def218:	8081 8000 0000 8000 8080 0000 0000 8000     ................
c0def228:	0001 8000 0000 0000 8008 8000 0000 8000     ................

c0def238 <zetas>:
c0def238:	0000 0000 64f7 0000 3102 ffd8 1503 fff8     .....d...1......
c0def248:	9e44 0003 2118 fff4 a128 fff2 1e24 0007     D....!..(...$...
c0def258:	de2b 001b e92b 0023 84ad fffa 147f ffe0     +...+.#.........
c0def268:	9a75 002f fb09 ffd3 7a49 002f e527 0028     u./.....Iz/.'.(.
c0def278:	9658 0029 a070 000f 85a4 ffef b788 0036     X.).p.........6.
c0def288:	9d90 fff7 eaa0 ffee f968 0027 d37b ffdf     ........h.'.{...
c0def298:	add6 ffdf 1ae7 ffc5 a4f7 ffea fc98 ffcd     ................
c0def2a8:	d035 001a b422 ffff 3201 003d 45c5 0004     5..."....2=..E..
c0def2b8:	4a67 0029 7620 0001 f4cd 002e dec5 0035     gJ). v........5.
c0def2c8:	a503 ffe6 302c ffc9 47d4 ffd9 beaf 003b     ....,0...G....;.
c0def2d8:	1585 ffc5 8e7c ffd1 8a96 0036 3e41 ffd4     ....|.....6.A>..
c0def2e8:	0400 0036 6a4d fffb d69c 0023 c55d fff7     ..6.Mj....#.]...
c0def2f8:	123d ffe6 ead6 ffe6 7e1e 0035 af59 ffc5     =........~5.Y...
c0def308:	843f 0035 5617 ffdf 945c ffe7 738c 0038     ?.5..V..\....s8.
c0def318:	63a8 000c 1b9a 0008 8f76 000e 3853 003b     .c......v...S8;.
c0def328:	8534 003b fc30 ffd8 9d54 001f 4f2d ffd5     4.;.0...T...-O..
c0def338:	06e5 ffc4 ac81 ffe8 e1cf ffc7 9819 ffd1     ................
c0def348:	d65d ffe9 09ee 0035 35c7 0021 cfbb ffe7     ].....5..5!.....
c0def358:	cf75 ffec 9772 001d b072 ffc1 bcf6 fff0     u...r...r.......
c0def368:	5280 ffcf d2ae ffcf 90e0 ffc8 efca 0001     .R..............
c0def378:	10f2 0034 fe85 fff0 c638 0020 6e9f 0029     ..4.....8. ..n).
c0def388:	b7a3 ffd2 a44b ffc7 ba6d fff9 3409 ffda     ....K...m....4..
c0def398:	c282 fff5 4113 ffed a63b ffff 09f7 ffec     .....A..;.......
c0def3a8:	2bdd fffa 95d4 0014 4563 001c 2c62 ffea     .+......cE..b,..
c0def3b8:	fbe9 ffcc 0af0 0004 c417 0007 4588 002f     .............E/.
c0def3c8:	ad00 0000 36be ffef cd44 000d 675a 003c     .....6..D...Zg<.
c0def3d8:	2bca ffc7 de7e ffff 3948 0019 69c0 ffce     .+..~...H9...i..
c0def3e8:	756c 0024 c7df fffc 98a1 000b e808 ffeb     lu$.............
c0def3f8:	e46c 0002 c808 ffc9 36c2 0030 bff6 ffe3     l........60.....
c0def408:	3c93 ffdb 4ae0 fffd 1305 0014 7792 0014     .<...J.......w..
c0def418:	9e25 0013 d0e0 ffe7 9944 fff3 0802 ffea     %.......D.......
c0def428:	eea2 ffd1 c79c ffc4 a057 ffc8 97d9 003a     ........W.....:.
c0def438:	ea93 001f ff5a 0033 58d4 0023 41f8 003a     ....Z.3..X#..A:.
c0def448:	ff72 ffcc 3dfb 0022 ab9f ffda a422 ffc9     r....="....."...
c0def458:	12f5 0004 2587 0025 24f0 ffed 9b5d 0035     .....%%..$..].5.
c0def468:	48a0 ffca a2fc ffc6 bb56 ffed 45de ffcf     .H......V....E..
c0def478:	be5e 000d 5e1a 001c e0e6 000d 7f5a 000c     ^....^......Z...
c0def488:	8f83 0007 628a ffe7 5704 ffff 06fc fff8     .....b...W......
c0def498:	0021 fff6 5af6 ffd0 0084 001f ef86 0030     !....Z........0.
c0def4a8:	b97d ffc9 fcd6 fff7 4592 fff4 21c2 ffc9     }........E...!..
c0def4b8:	3919 0005 610c 0004 cd41 ffda b01b 003e     .9...a..A.....>.
c0def4c8:	72e7 0034 003b ffcd 7cc7 001a 1924 0003     .r4.;....|..$...
c0def4d8:	5ee5 002b 1199 0029 7a3a ffd8 4d71 0013     .^+...).:z..qM..
c0def4e8:	e11c 003d 0984 0013 f051 0025 5a46 0018     ..=.....Q.%.FZ..
c0def4f8:	8518 ffc6 14be 0013 3891 0028 db90 ffc9     .........8(.....
c0def508:	5089 ffd2 853f 001c 0b4b 001d f6a6 ffef     .P..?...K.......
c0def518:	a8be ffeb e11b 0012 5e3e ffcd 2d2f ffea     ........>^../-..
c0def528:	1de4 fff9 06c7 0014 7283 0032 0d6e ffe2     .........r2.n...
c0def538:	7953 ffec 4099 001d 2578 ffd9 05ad ffeb     Sy...@..x%......
c0def548:	e405 0016 dbe7 000b 1de8 0022 f8cf 0033     .........."...3.
c0def558:	b934 fff7 ca0c ffd4 7ff8 ffe6 d157 ffe3     4...........W...
c0def568:	911b ffd8 2c12 ffc7 10d8 0009 5e1f ffc6     .....,.......^..
c0def578:	4658 ffe1 1d8b 0025 73b7 0025 7c8f fffd     XF....%..s%..|..
c0def588:	dd98 001d 6898 0033 d4bb 0002 93a7 ffed     .....h3.........
c0def598:	6cbe ffcf 7c1c 0002 aa08 0018 fd71 002d     .l...|......q.-.
c0def5a8:	5ca5 000c 379a 0019 a167 ffc7 8c3d ffe4     .\...7..g...=...
c0def5b8:	a13c ffd1 c539 0035 0115 003b 1dc0 0004     <...9.5...;.....
c0def5c8:	c4f7 0021 1bf4 fff1 35e7 001a 340e 0007     ..!......5...4..
c0def5d8:	7d45 fff9 4cd0 001a 7cae ffe4 2668 001d     E}...L...|..h&..
c0def5e8:	8e98 ffe6 2633 ffef 05da fffc 7fdb ffc5     ....3&..........
c0def5f8:	2764 ffd3 e1af ffdd 93dd fff9 1d09 ffdd     d'..............
c0def608:	cc93 0002 1805 fff1 9c2a 0018 e5a9 ffc9     ........*.......
c0def618:	8a50 fff7 cf2c 003b 434e ffff 36df ffeb     P...,.;.NC...6..
c0def628:	15ca 003c 5e68 0015 16b6 fff3 29ce 001e     ..<.h^.......)..

c0def638 <small_zetas>:
c0def638:	fbec fd0a fe99 fa13 05d5 058e 011f 00ca     ................
c0def648:	ff55 026e 0629 00b6 03c2 fb4e fa3e 05bc     U.n.).....N.>...
c0def658:	023d fad3 0108 017f fcc3 05b2 f9be ff7e     =.............~.
c0def668:	fd57 03f9 02dc 0260 f9fa 019b ff33 f9dd     W.....`.....3...
c0def678:	04c7 028c fdd8 03f7 faf3 05d3 fee6 f9f8     ................
c0def688:	0204 fff8 fec0 fd66 f9ae fb76 007e 05bd     ......f...v.~...
c0def698:	fcab ffa6 fef1 033e 006b fa73 ff09 fc49     ......>.k.s...I.
c0def6a8:	fe72 03c1 fa1c fd2b 01c0 fbd7 02a5 fb05     r.....+.........
c0def6b8:	fbb1 01ae 022b 034b fb1d 0367 060e 0069     ....+.K...g...i.
c0def6c8:	01a6 024b 00b1 ff15 fedd fe34 0626 0675     ..K.......4.&.u.
c0def6d8:	ff0a 030a 0487 ff6d fcf7 05cb fda6 045f     ......m......._.
c0def6e8:	f9ca 0284 fc98 015d 01a2 0149 ff64 ffb5     ......]...I.d...
c0def6f8:	0331 0449 025b 0262 052a fafb fa47 0180     1.I.[.b.*...G...
c0def708:	fb41 ff78 04c2 fac9 fc96 00dc fb5d f985     A.x.........]...
c0def718:	fb5f fa06 fb02 031a fa1a fcaa fc9a 01de     _...............
c0def728:	ff94 fecc 03e4 03df 03be fa4c 05f2 065c     ..........L...\.

c0def738 <.L__const.nbgl_useCaseStatus.ticker>:
c0def738:	9691 c0de 0bb8 0000 0000 0000               ............

c0def744 <blindSigningWarning>:
c0def744:	0010 0000 0000 0000 0000 0000 0000 0000     ................
	...
c0def76c:	6854 7369 6120 7070 6520 616e 6c62 7365     This app enables
c0def77c:	7320 6769 696e 676e 740a 6172 736e 6361      signing.transac
c0def78c:	6974 6e6f 2073 6e6f 6920 7374 6e20 7465     tions on its net
c0def79c:	6f77 6b72 002e                              work..

c0def7a2 <nbMaxElementsPerContentType>:
c0def7a2:	0101 0101 0101 0301 0503 0005 0000          ..............

c0def7b0 <g_pcHex>:
c0def7b0:	3130 3332 3534 3736 3938 6261 6463 6665     0123456789abcdef
c0def7c0:	0000 0000 0040 0000 0000 0000 0000 0000     ....@...........
c0def7d0:	0101 0000 0000 0000 0000 0000 0916 0000     ................
c0def7e0:	0000 0000 0028 0000 0000 0000 0000 0000     ....(...........

c0def7f0 <g_pcHex_cap>:
c0def7f0:	3130 3332 3534 3736 3938 4241 4443 4645     0123456789ABCDEF

c0def800 <.L__const.displaySkipWarning.info>:
c0def800:	dd19 c0de df21 c0de 0000 0000 cdea c0de     ....!...........
c0def810:	0000 0000 db1a c0de e09e c0de 0005 0109     ................

c0def820 <securityReportItems>:
c0def820:	d899 c0de d8fa c0de 0000 0000 d899 c0de     ................
c0def830:	dd47 c0de e022 c0de d899 c0de ddc1 c0de     G..."...........
c0def840:	dcd6 c0de 0000 0000 e076 c0de e1c3 c0de     ........v.......
c0def850:	d899 c0de dd26 c0de ddea c0de               ....&.......

c0def85c <.L__const.displayCustomizedSecurityReport.layoutDescription>:
c0def85c:	0101 0000 0000 0000 0000 0000 ac65 c0de     ............e...
	...

c0def878 <.L__const.displayInfosListModal.info>:
c0def878:	0100 0113 0900 0000 0000 0000 0000 0000     ................
c0def888:	0100 0300 0000 0000 0000 0000               ............

c0def894 <.L__const.displayInitialWarning.buttonsInfo>:
c0def894:	db52 c0de e16d c0de 0000 0000 0014 0009     R...m...........

c0def8a4 <_etext>:
	...

c0defa00 <N_storage_real>:
	...

c0defc00 <install_parameters>:
c0defc00:	0501 4c4d 5344 0241 3005 302e 312e 8203     ..MLDSA..0.0.1..
c0defc10:	4a01 0028 0028 4222 0001 ffff ffff ccff     .J(.(."B........
c0defc20:	828c 9110 e05a 0bdc 1002 3011 8e81 07d9     ....Z......0....
c0defc30:	5201 2011 0c03 85d7 3334 0132 0a30 96d5     .R. ....432.0...
c0defc40:	4056 2243 2021 d30c 4689 3334 1122 0120     V@C"! ...F43". .
c0defc50:	d10d 379d 1450 1413 3213 2011 d105 0708     ...7P....2. ....
c0defc60:	0a16 0b1c 3308 1122 0c30 9ecf b047 0dc5     .....3".0...G...
c0defc70:	1305 1122 0630 2ec4 8bc7 c76c 538d 8822     ..".0.....l..S".
c0defc80:	3095 c20e 100b c703 0908 8ec3 c2ce 020b     .0..............
c0defc90:	bc13 d9dc 9100 8026 05c1 0210 05c7 c20d     ......&.........
c0defca0:	bdac c19c 43be 309d bda1 1c67 1409 0223     .....C.0..g...#.
c0defcb0:	c60b c305 c10a 080e 06c2 1803 1792 3de0     ...............=
c0defcc0:	2b2c 3c8a 09c5 0ec2 c20a c208 0309 1117     ,+.<............
c0defcd0:	ed88 1d1c 2c1b 090a 08c6 aac3 cbdf bcc2     .....,..........
c0defce0:	e827 1d70 06b3 b0a9 7aad c778 2e0a ecaf     '.p......zx.....
c0defcf0:	c3ad 729e 1e90 60bd c05a c10e a786 0dc8     ...r...`Z.......
c0defd00:	2e0b 0ec0 bec5 12d6 a130 c806 9ec2 508b     ........0......P
c0defd10:	07c9 5e7e 64ba d07b 0a0b 0ec2 1807 0bc9     ..~^.d{.........
c0defd20:	7e0c 0e7e 081d 07d2 7e7e 8d0e d2ac 090d     .~~.....~~......
c0defd30:	6e7e b98d 0bd4 7e0a 8d4e d6c9 090b 1e7e     ~n.....~N.....~.
c0defd40:	0b1d d809 7c8d 1d3e 8c1e db8d 899c 1cb0     .....|>.........
c0defd50:	a89b e0b0 cb9d ffd0 ffff c4ff 0a04 0201     ................
c0defd60:	0080 2c00 0080 0100                         ...,....
