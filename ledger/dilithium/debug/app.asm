
build/flex/bin/app.elf:     file format elf32-littlearm


Disassembly of section .text:

c0de0000 <main>:
c0de0000:	b510      	push	{r4, lr}
c0de0002:	4604      	mov	r4, r0
c0de0004:	b662      	cpsie	i
c0de0006:	f00b fe53 	bl	c0debcb0 <os_boot>
c0de000a:	b90c      	cbnz	r4, c0de0010 <main+0x10>
c0de000c:	f00b fc1a 	bl	c0deb844 <standalone_app_main>
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
c0de0022:	f00c fa03 	bl	c0dec42c <__aeabi_memclr>
c0de0026:	b914      	cbnz	r4, c0de002e <address_from_pubkey+0x1a>
c0de0028:	2001      	movs	r0, #1
c0de002a:	f00b fdbd 	bl	c0debba8 <assert_exit>
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
c0de0042:	f00b fd79 	bl	c0debb38 <cx_keccak_256_hash_iovec>
c0de0046:	b108      	cbz	r0, c0de004c <address_from_pubkey+0x38>
c0de0048:	2000      	movs	r0, #0
c0de004a:	e006      	b.n	c0de005a <address_from_pubkey+0x46>
c0de004c:	f105 010c 	add.w	r1, r5, #12
c0de0050:	4620      	mov	r0, r4
c0de0052:	2214      	movs	r2, #20
c0de0054:	f00c f9e0 	bl	c0dec418 <__aeabi_memcpy>
c0de0058:	2001      	movs	r0, #1
c0de005a:	b00a      	add	sp, #40	@ 0x28
c0de005c:	bd70      	pop	{r4, r5, r6, pc}

c0de005e <apdu_dispatcher>:
c0de005e:	b51f      	push	{r0, r1, r2, r3, r4, lr}
c0de0060:	4604      	mov	r4, r0
c0de0062:	b910      	cbnz	r0, c0de006a <apdu_dispatcher+0xc>
c0de0064:	2001      	movs	r0, #1
c0de0066:	f00b fd9f 	bl	c0debba8 <assert_exit>
c0de006a:	7820      	ldrb	r0, [r4, #0]
c0de006c:	28e0      	cmp	r0, #224	@ 0xe0
c0de006e:	d137      	bne.n	c0de00e0 <apdu_dispatcher+0x82>
c0de0070:	2000      	movs	r0, #0
c0de0072:	9003      	str	r0, [sp, #12]
c0de0074:	e9cd 0001 	strd	r0, r0, [sp, #4]
c0de0078:	7860      	ldrb	r0, [r4, #1]
c0de007a:	2814      	cmp	r0, #20
c0de007c:	d033      	beq.n	c0de00e6 <apdu_dispatcher+0x88>
c0de007e:	2804      	cmp	r0, #4
c0de0080:	d043      	beq.n	c0de010a <apdu_dispatcher+0xac>
c0de0082:	2805      	cmp	r0, #5
c0de0084:	d04d      	beq.n	c0de0122 <apdu_dispatcher+0xc4>
c0de0086:	2806      	cmp	r0, #6
c0de0088:	d061      	beq.n	c0de014e <apdu_dispatcher+0xf0>
c0de008a:	2807      	cmp	r0, #7
c0de008c:	d06b      	beq.n	c0de0166 <apdu_dispatcher+0x108>
c0de008e:	2809      	cmp	r0, #9
c0de0090:	d073      	beq.n	c0de017a <apdu_dispatcher+0x11c>
c0de0092:	280a      	cmp	r0, #10
c0de0094:	f000 8080 	beq.w	c0de0198 <apdu_dispatcher+0x13a>
c0de0098:	280b      	cmp	r0, #11
c0de009a:	f000 8086 	beq.w	c0de01aa <apdu_dispatcher+0x14c>
c0de009e:	280c      	cmp	r0, #12
c0de00a0:	f000 808c 	beq.w	c0de01bc <apdu_dispatcher+0x15e>
c0de00a4:	280f      	cmp	r0, #15
c0de00a6:	f000 8096 	beq.w	c0de01d6 <apdu_dispatcher+0x178>
c0de00aa:	2810      	cmp	r0, #16
c0de00ac:	f000 80a5 	beq.w	c0de01fa <apdu_dispatcher+0x19c>
c0de00b0:	2811      	cmp	r0, #17
c0de00b2:	f000 80ad 	beq.w	c0de0210 <apdu_dispatcher+0x1b2>
c0de00b6:	2812      	cmp	r0, #18
c0de00b8:	f000 80b5 	beq.w	c0de0226 <apdu_dispatcher+0x1c8>
c0de00bc:	2813      	cmp	r0, #19
c0de00be:	f000 80bb 	beq.w	c0de0238 <apdu_dispatcher+0x1da>
c0de00c2:	2803      	cmp	r0, #3
c0de00c4:	f040 80c2 	bne.w	c0de024c <apdu_dispatcher+0x1ee>
c0de00c8:	78a0      	ldrb	r0, [r4, #2]
c0de00ca:	2800      	cmp	r0, #0
c0de00cc:	f040 80cf 	bne.w	c0de026e <apdu_dispatcher+0x210>
c0de00d0:	78e0      	ldrb	r0, [r4, #3]
c0de00d2:	2800      	cmp	r0, #0
c0de00d4:	f040 80cb 	bne.w	c0de026e <apdu_dispatcher+0x210>
c0de00d8:	e8bd 401f 	ldmia.w	sp!, {r0, r1, r2, r3, r4, lr}
c0de00dc:	f000 b987 	b.w	c0de03ee <handler_get_version>
c0de00e0:	f44f 40dc 	mov.w	r0, #28160	@ 0x6e00
c0de00e4:	e0c5      	b.n	c0de0272 <apdu_dispatcher+0x214>
c0de00e6:	78a0      	ldrb	r0, [r4, #2]
c0de00e8:	2801      	cmp	r0, #1
c0de00ea:	f200 80c0 	bhi.w	c0de026e <apdu_dispatcher+0x210>
c0de00ee:	78e0      	ldrb	r0, [r4, #3]
c0de00f0:	2800      	cmp	r0, #0
c0de00f2:	f040 80bc 	bne.w	c0de026e <apdu_dispatcher+0x210>
c0de00f6:	68a0      	ldr	r0, [r4, #8]
c0de00f8:	2800      	cmp	r0, #0
c0de00fa:	f000 80bf 	beq.w	c0de027c <apdu_dispatcher+0x21e>
c0de00fe:	f000 f8c7 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de0102:	a801      	add	r0, sp, #4
c0de0104:	f000 fb6c 	bl	c0de07e0 <handler_get_mldsa_seed>
c0de0108:	e09e      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de010a:	78a0      	ldrb	r0, [r4, #2]
c0de010c:	2800      	cmp	r0, #0
c0de010e:	f040 80ae 	bne.w	c0de026e <apdu_dispatcher+0x210>
c0de0112:	78e0      	ldrb	r0, [r4, #3]
c0de0114:	2800      	cmp	r0, #0
c0de0116:	f040 80aa 	bne.w	c0de026e <apdu_dispatcher+0x210>
c0de011a:	e8bd 401f 	ldmia.w	sp!, {r0, r1, r2, r3, r4, lr}
c0de011e:	f000 b8ff 	b.w	c0de0320 <handler_get_app_name>
c0de0122:	78a1      	ldrb	r1, [r4, #2]
c0de0124:	2901      	cmp	r1, #1
c0de0126:	f200 80a2 	bhi.w	c0de026e <apdu_dispatcher+0x210>
c0de012a:	78e0      	ldrb	r0, [r4, #3]
c0de012c:	2800      	cmp	r0, #0
c0de012e:	f040 809e 	bne.w	c0de026e <apdu_dispatcher+0x210>
c0de0132:	68a0      	ldr	r0, [r4, #8]
c0de0134:	2800      	cmp	r0, #0
c0de0136:	f000 80a1 	beq.w	c0de027c <apdu_dispatcher+0x21e>
c0de013a:	9001      	str	r0, [sp, #4]
c0de013c:	7920      	ldrb	r0, [r4, #4]
c0de013e:	2900      	cmp	r1, #0
c0de0140:	9002      	str	r0, [sp, #8]
c0de0142:	bf18      	it	ne
c0de0144:	2101      	movne	r1, #1
c0de0146:	a801      	add	r0, sp, #4
c0de0148:	f000 f8fe 	bl	c0de0348 <handler_get_public_key>
c0de014c:	e07c      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de014e:	78a1      	ldrb	r1, [r4, #2]
c0de0150:	2900      	cmp	r1, #0
c0de0152:	d07e      	beq.n	c0de0252 <apdu_dispatcher+0x1f4>
c0de0154:	2903      	cmp	r1, #3
c0de0156:	f200 808a 	bhi.w	c0de026e <apdu_dispatcher+0x210>
c0de015a:	78e0      	ldrb	r0, [r4, #3]
c0de015c:	f040 0280 	orr.w	r2, r0, #128	@ 0x80
c0de0160:	2a80      	cmp	r2, #128	@ 0x80
c0de0162:	d07a      	beq.n	c0de025a <apdu_dispatcher+0x1fc>
c0de0164:	e083      	b.n	c0de026e <apdu_dispatcher+0x210>
c0de0166:	68a0      	ldr	r0, [r4, #8]
c0de0168:	2800      	cmp	r0, #0
c0de016a:	f000 8087 	beq.w	c0de027c <apdu_dispatcher+0x21e>
c0de016e:	f000 f88f 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de0172:	a801      	add	r0, sp, #4
c0de0174:	f000 fa07 	bl	c0de0586 <handler_cmd_keccakH>
c0de0178:	e066      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de017a:	78e0      	ldrb	r0, [r4, #3]
c0de017c:	2800      	cmp	r0, #0
c0de017e:	d176      	bne.n	c0de026e <apdu_dispatcher+0x210>
c0de0180:	78a1      	ldrb	r1, [r4, #2]
c0de0182:	2902      	cmp	r1, #2
c0de0184:	d301      	bcc.n	c0de018a <apdu_dispatcher+0x12c>
c0de0186:	2980      	cmp	r1, #128	@ 0x80
c0de0188:	d171      	bne.n	c0de026e <apdu_dispatcher+0x210>
c0de018a:	68a0      	ldr	r0, [r4, #8]
c0de018c:	f000 f880 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de0190:	a801      	add	r0, sp, #4
c0de0192:	f000 fa11 	bl	c0de05b8 <handler_cmd_keccak_prng>
c0de0196:	e057      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de0198:	68a0      	ldr	r0, [r4, #8]
c0de019a:	2800      	cmp	r0, #0
c0de019c:	d06e      	beq.n	c0de027c <apdu_dispatcher+0x21e>
c0de019e:	f000 f877 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de01a2:	a801      	add	r0, sp, #4
c0de01a4:	f000 f9d5 	bl	c0de0552 <handler_cmd_dummy>
c0de01a8:	e04e      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de01aa:	68a0      	ldr	r0, [r4, #8]
c0de01ac:	2800      	cmp	r0, #0
c0de01ae:	d065      	beq.n	c0de027c <apdu_dispatcher+0x21e>
c0de01b0:	f000 f86e 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de01b4:	a801      	add	r0, sp, #4
c0de01b6:	f000 fa37 	bl	c0de0628 <handler_cmd_sample_in_ball>
c0de01ba:	e045      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de01bc:	78a0      	ldrb	r0, [r4, #2]
c0de01be:	2800      	cmp	r0, #0
c0de01c0:	d155      	bne.n	c0de026e <apdu_dispatcher+0x210>
c0de01c2:	78e0      	ldrb	r0, [r4, #3]
c0de01c4:	2800      	cmp	r0, #0
c0de01c6:	d152      	bne.n	c0de026e <apdu_dispatcher+0x210>
c0de01c8:	68a0      	ldr	r0, [r4, #8]
c0de01ca:	f000 f861 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de01ce:	a801      	add	r0, sp, #4
c0de01d0:	f000 fa39 	bl	c0de0646 <handler_cmd_keygen_core_dilithium>
c0de01d4:	e038      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de01d6:	78e0      	ldrb	r0, [r4, #3]
c0de01d8:	2800      	cmp	r0, #0
c0de01da:	d148      	bne.n	c0de026e <apdu_dispatcher+0x210>
c0de01dc:	78a1      	ldrb	r1, [r4, #2]
c0de01de:	2902      	cmp	r1, #2
c0de01e0:	d304      	bcc.n	c0de01ec <apdu_dispatcher+0x18e>
c0de01e2:	2980      	cmp	r1, #128	@ 0x80
c0de01e4:	d143      	bne.n	c0de026e <apdu_dispatcher+0x210>
c0de01e6:	7920      	ldrb	r0, [r4, #4]
c0de01e8:	2802      	cmp	r0, #2
c0de01ea:	d140      	bne.n	c0de026e <apdu_dispatcher+0x210>
c0de01ec:	68a0      	ldr	r0, [r4, #8]
c0de01ee:	f000 f84f 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de01f2:	a801      	add	r0, sp, #4
c0de01f4:	f000 fa4e 	bl	c0de0694 <handler_cmd_sign_dilithium>
c0de01f8:	e026      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de01fa:	78a0      	ldrb	r0, [r4, #2]
c0de01fc:	bbb8      	cbnz	r0, c0de026e <apdu_dispatcher+0x210>
c0de01fe:	78e0      	ldrb	r0, [r4, #3]
c0de0200:	bba8      	cbnz	r0, c0de026e <apdu_dispatcher+0x210>
c0de0202:	68a0      	ldr	r0, [r4, #8]
c0de0204:	f000 f844 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de0208:	a801      	add	r0, sp, #4
c0de020a:	f000 faa7 	bl	c0de075c <handler_cmd_verify_dilithium>
c0de020e:	e01b      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de0210:	78a0      	ldrb	r0, [r4, #2]
c0de0212:	bb60      	cbnz	r0, c0de026e <apdu_dispatcher+0x210>
c0de0214:	78e0      	ldrb	r0, [r4, #3]
c0de0216:	bb50      	cbnz	r0, c0de026e <apdu_dispatcher+0x210>
c0de0218:	68a0      	ldr	r0, [r4, #8]
c0de021a:	f000 f839 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de021e:	a801      	add	r0, sp, #4
c0de0220:	f000 fa25 	bl	c0de066e <handler_cmd_keygen_dilithium>
c0de0224:	e010      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de0226:	68a0      	ldr	r0, [r4, #8]
c0de0228:	78a1      	ldrb	r1, [r4, #2]
c0de022a:	78e2      	ldrb	r2, [r4, #3]
c0de022c:	f000 f830 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de0230:	a801      	add	r0, sp, #4
c0de0232:	f000 fab5 	bl	c0de07a0 <handler_cmd_get_sig_chunk>
c0de0236:	e007      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de0238:	68a0      	ldr	r0, [r4, #8]
c0de023a:	78a1      	ldrb	r1, [r4, #2]
c0de023c:	78e2      	ldrb	r2, [r4, #3]
c0de023e:	f000 f827 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de0242:	a801      	add	r0, sp, #4
c0de0244:	f000 fabc 	bl	c0de07c0 <handler_cmd_get_pk_chunk>
c0de0248:	b004      	add	sp, #16
c0de024a:	bd10      	pop	{r4, pc}
c0de024c:	f44f 40da 	mov.w	r0, #27904	@ 0x6d00
c0de0250:	e00f      	b.n	c0de0272 <apdu_dispatcher+0x214>
c0de0252:	78e0      	ldrb	r0, [r4, #3]
c0de0254:	2880      	cmp	r0, #128	@ 0x80
c0de0256:	d10a      	bne.n	c0de026e <apdu_dispatcher+0x210>
c0de0258:	2080      	movs	r0, #128	@ 0x80
c0de025a:	68a2      	ldr	r2, [r4, #8]
c0de025c:	b172      	cbz	r2, c0de027c <apdu_dispatcher+0x21e>
c0de025e:	9201      	str	r2, [sp, #4]
c0de0260:	7922      	ldrb	r2, [r4, #4]
c0de0262:	9202      	str	r2, [sp, #8]
c0de0264:	09c2      	lsrs	r2, r0, #7
c0de0266:	a801      	add	r0, sp, #4
c0de0268:	f000 f8d8 	bl	c0de041c <handler_sign_tx>
c0de026c:	e7ec      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de026e:	f646 2086 	movw	r0, #27270	@ 0x6a86
c0de0272:	b004      	add	sp, #16
c0de0274:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de0278:	f000 b803 	b.w	c0de0282 <io_send_sw>
c0de027c:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de0280:	e7f7      	b.n	c0de0272 <apdu_dispatcher+0x214>

c0de0282 <io_send_sw>:
c0de0282:	b580      	push	{r7, lr}
c0de0284:	4602      	mov	r2, r0
c0de0286:	2000      	movs	r0, #0
c0de0288:	2100      	movs	r1, #0
c0de028a:	f00b fa9b 	bl	c0deb7c4 <io_send_response_buffers>
c0de028e:	bd80      	pop	{r7, pc}

c0de0290 <OUTLINED_FUNCTION_0>:
c0de0290:	9001      	str	r0, [sp, #4]
c0de0292:	7920      	ldrb	r0, [r4, #4]
c0de0294:	9002      	str	r0, [sp, #8]
c0de0296:	4770      	bx	lr

c0de0298 <app_main>:
c0de0298:	b5bf      	push	{r0, r1, r2, r3, r4, r5, r7, lr}
c0de029a:	f00b fa75 	bl	c0deb788 <io_init>
c0de029e:	f000 fc01 	bl	c0de0aa4 <ui_menu_main>
c0de02a2:	481b      	ldr	r0, [pc, #108]	@ (c0de0310 <app_main+0x78>)
c0de02a4:	f44f 7136 	mov.w	r1, #728	@ 0x2d8
c0de02a8:	4448      	add	r0, r9
c0de02aa:	f00c f8cd 	bl	c0dec448 <explicit_bzero>
c0de02ae:	481a      	ldr	r0, [pc, #104]	@ (c0de0318 <app_main+0x80>)
c0de02b0:	4478      	add	r0, pc
c0de02b2:	f00b fe99 	bl	c0debfe8 <pic>
c0de02b6:	7880      	ldrb	r0, [r0, #2]
c0de02b8:	2801      	cmp	r0, #1
c0de02ba:	d00d      	beq.n	c0de02d8 <app_main+0x40>
c0de02bc:	2001      	movs	r0, #1
c0de02be:	f88d 0002 	strb.w	r0, [sp, #2]
c0de02c2:	2000      	movs	r0, #0
c0de02c4:	f8ad 0000 	strh.w	r0, [sp]
c0de02c8:	4814      	ldr	r0, [pc, #80]	@ (c0de031c <app_main+0x84>)
c0de02ca:	4478      	add	r0, pc
c0de02cc:	f00b fe8c 	bl	c0debfe8 <pic>
c0de02d0:	4669      	mov	r1, sp
c0de02d2:	2203      	movs	r2, #3
c0de02d4:	f00b fec2 	bl	c0dec05c <nvm_write>
c0de02d8:	4d0e      	ldr	r5, [pc, #56]	@ (c0de0314 <app_main+0x7c>)
c0de02da:	ac01      	add	r4, sp, #4
c0de02dc:	f00b fa5c 	bl	c0deb798 <io_recv_command>
c0de02e0:	2800      	cmp	r0, #0
c0de02e2:	d414      	bmi.n	c0de030e <app_main+0x76>
c0de02e4:	4602      	mov	r2, r0
c0de02e6:	eb09 0105 	add.w	r1, r9, r5
c0de02ea:	4620      	mov	r0, r4
c0de02ec:	f00b fad1 	bl	c0deb892 <apdu_parser>
c0de02f0:	b130      	cbz	r0, c0de0300 <app_main+0x68>
c0de02f2:	4620      	mov	r0, r4
c0de02f4:	f7ff feb3 	bl	c0de005e <apdu_dispatcher>
c0de02f8:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0de02fc:	dcee      	bgt.n	c0de02dc <app_main+0x44>
c0de02fe:	e006      	b.n	c0de030e <app_main+0x76>
c0de0300:	2000      	movs	r0, #0
c0de0302:	2100      	movs	r1, #0
c0de0304:	f646 2287 	movw	r2, #27271	@ 0x6a87
c0de0308:	f00b fa5c 	bl	c0deb7c4 <io_send_response_buffers>
c0de030c:	e7e6      	b.n	c0de02dc <app_main+0x44>
c0de030e:	bdbf      	pop	{r0, r1, r2, r3, r4, r5, r7, pc}
c0de0310:	00000000 	.word	0x00000000
c0de0314:	000014b7 	.word	0x000014b7
c0de0318:	0000f74c 	.word	0x0000f74c
c0de031c:	0000f732 	.word	0x0000f732

c0de0320 <handler_get_app_name>:
c0de0320:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de0322:	4808      	ldr	r0, [pc, #32]	@ (c0de0344 <handler_get_app_name+0x24>)
c0de0324:	4478      	add	r0, pc
c0de0326:	f00b fe5f 	bl	c0debfe8 <pic>
c0de032a:	2100      	movs	r1, #0
c0de032c:	f44f 4210 	mov.w	r2, #36864	@ 0x9000
c0de0330:	9103      	str	r1, [sp, #12]
c0de0332:	2105      	movs	r1, #5
c0de0334:	e9cd 0101 	strd	r0, r1, [sp, #4]
c0de0338:	a801      	add	r0, sp, #4
c0de033a:	2101      	movs	r1, #1
c0de033c:	f00b fa42 	bl	c0deb7c4 <io_send_response_buffers>
c0de0340:	b004      	add	sp, #16
c0de0342:	bd80      	pop	{r7, pc}
c0de0344:	0000dbdc 	.word	0x0000dbdc

c0de0348 <handler_get_public_key>:
c0de0348:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de034a:	b085      	sub	sp, #20
c0de034c:	4f23      	ldr	r7, [pc, #140]	@ (c0de03dc <handler_get_public_key+0x94>)
c0de034e:	460c      	mov	r4, r1
c0de0350:	4605      	mov	r5, r0
c0de0352:	f44f 7136 	mov.w	r1, #728	@ 0x2d8
c0de0356:	eb09 0607 	add.w	r6, r9, r7
c0de035a:	4630      	mov	r0, r6
c0de035c:	f00c f874 	bl	c0dec448 <explicit_bzero>
c0de0360:	2000      	movs	r0, #0
c0de0362:	f506 7135 	add.w	r1, r6, #724	@ 0x2d4
c0de0366:	f809 0007 	strb.w	r0, [r9, r7]
c0de036a:	f886 02a8 	strb.w	r0, [r6, #680]	@ 0x2a8
c0de036e:	4628      	mov	r0, r5
c0de0370:	f00a ffd4 	bl	c0deb31c <buffer_read_u8>
c0de0374:	b308      	cbz	r0, c0de03ba <handler_get_public_key+0x72>
c0de0376:	eb09 0007 	add.w	r0, r9, r7
c0de037a:	f890 22d4 	ldrb.w	r2, [r0, #724]	@ 0x2d4
c0de037e:	f500 712b 	add.w	r1, r0, #684	@ 0x2ac
c0de0382:	4628      	mov	r0, r5
c0de0384:	f00b f81d 	bl	c0deb3c2 <buffer_read_bip32_path>
c0de0388:	b1b8      	cbz	r0, c0de03ba <handler_get_public_key+0x72>
c0de038a:	eb09 0007 	add.w	r0, r9, r7
c0de038e:	2100      	movs	r1, #0
c0de0390:	2205      	movs	r2, #5
c0de0392:	f890 32d4 	ldrb.w	r3, [r0, #724]	@ 0x2d4
c0de0396:	e9cd 2102 	strd	r2, r1, [sp, #8]
c0de039a:	9104      	str	r1, [sp, #16]
c0de039c:	f100 0549 	add.w	r5, r0, #73	@ 0x49
c0de03a0:	f100 0608 	add.w	r6, r0, #8
c0de03a4:	f500 722b 	add.w	r2, r0, #684	@ 0x2ac
c0de03a8:	2000      	movs	r0, #0
c0de03aa:	2121      	movs	r1, #33	@ 0x21
c0de03ac:	e9cd 6500 	strd	r6, r5, [sp]
c0de03b0:	f00b f8c8 	bl	c0deb544 <bip32_derive_with_seed_get_pubkey_256>
c0de03b4:	b140      	cbz	r0, c0de03c8 <handler_get_public_key+0x80>
c0de03b6:	b280      	uxth	r0, r0
c0de03b8:	e001      	b.n	c0de03be <handler_get_public_key+0x76>
c0de03ba:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de03be:	b005      	add	sp, #20
c0de03c0:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de03c4:	f000 b80c 	b.w	c0de03e0 <io_send_sw>
c0de03c8:	2c00      	cmp	r4, #0
c0de03ca:	b005      	add	sp, #20
c0de03cc:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de03d0:	bf08      	it	eq
c0de03d2:	f000 ba37 	beq.w	c0de0844 <helper_send_response_pubkey>
c0de03d6:	f000 bc4d 	b.w	c0de0c74 <ui_display_address>
c0de03da:	bf00      	nop
c0de03dc:	00000000 	.word	0x00000000

c0de03e0 <io_send_sw>:
c0de03e0:	b580      	push	{r7, lr}
c0de03e2:	4602      	mov	r2, r0
c0de03e4:	2000      	movs	r0, #0
c0de03e6:	2100      	movs	r1, #0
c0de03e8:	f00b f9ec 	bl	c0deb7c4 <io_send_response_buffers>
c0de03ec:	bd80      	pop	{r7, pc}

c0de03ee <handler_get_version>:
c0de03ee:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de03f0:	2000      	movs	r0, #0
c0de03f2:	2101      	movs	r1, #1
c0de03f4:	f44f 4210 	mov.w	r2, #36864	@ 0x9000
c0de03f8:	f88d 0002 	strb.w	r0, [sp, #2]
c0de03fc:	f88d 0001 	strb.w	r0, [sp, #1]
c0de0400:	9003      	str	r0, [sp, #12]
c0de0402:	2003      	movs	r0, #3
c0de0404:	f88d 1003 	strb.w	r1, [sp, #3]
c0de0408:	2101      	movs	r1, #1
c0de040a:	9002      	str	r0, [sp, #8]
c0de040c:	f10d 0001 	add.w	r0, sp, #1
c0de0410:	9001      	str	r0, [sp, #4]
c0de0412:	a801      	add	r0, sp, #4
c0de0414:	f00b f9d6 	bl	c0deb7c4 <io_send_response_buffers>
c0de0418:	b004      	add	sp, #16
c0de041a:	bd80      	pop	{r7, pc}

c0de041c <handler_sign_tx>:
c0de041c:	b570      	push	{r4, r5, r6, lr}
c0de041e:	b086      	sub	sp, #24
c0de0420:	4e46      	ldr	r6, [pc, #280]	@ (c0de053c <handler_sign_tx+0x120>)
c0de0422:	4604      	mov	r4, r0
c0de0424:	b191      	cbz	r1, c0de044c <handler_sign_tx+0x30>
c0de0426:	eb09 0006 	add.w	r0, r9, r6
c0de042a:	f890 02a8 	ldrb.w	r0, [r0, #680]	@ 0x2a8
c0de042e:	2801      	cmp	r0, #1
c0de0430:	d12c      	bne.n	c0de048c <handler_sign_tx+0x70>
c0de0432:	eb09 0006 	add.w	r0, r9, r6
c0de0436:	4615      	mov	r5, r2
c0de0438:	6862      	ldr	r2, [r4, #4]
c0de043a:	f8d0 0208 	ldr.w	r0, [r0, #520]	@ 0x208
c0de043e:	1811      	adds	r1, r2, r0
c0de0440:	f5b1 7fff 	cmp.w	r1, #510	@ 0x1fe
c0de0444:	d925      	bls.n	c0de0492 <handler_sign_tx+0x76>
c0de0446:	f24b 0004 	movw	r0, #45060	@ 0xb004
c0de044a:	e039      	b.n	c0de04c0 <handler_sign_tx+0xa4>
c0de044c:	eb09 0506 	add.w	r5, r9, r6
c0de0450:	f44f 7136 	mov.w	r1, #728	@ 0x2d8
c0de0454:	4628      	mov	r0, r5
c0de0456:	f00b fff7 	bl	c0dec448 <explicit_bzero>
c0de045a:	2000      	movs	r0, #0
c0de045c:	f505 7135 	add.w	r1, r5, #724	@ 0x2d4
c0de0460:	f809 0006 	strb.w	r0, [r9, r6]
c0de0464:	2001      	movs	r0, #1
c0de0466:	f885 02a8 	strb.w	r0, [r5, #680]	@ 0x2a8
c0de046a:	4620      	mov	r0, r4
c0de046c:	f00a ff56 	bl	c0deb31c <buffer_read_u8>
c0de0470:	b148      	cbz	r0, c0de0486 <handler_sign_tx+0x6a>
c0de0472:	eb09 0006 	add.w	r0, r9, r6
c0de0476:	f890 22d4 	ldrb.w	r2, [r0, #724]	@ 0x2d4
c0de047a:	f500 712b 	add.w	r1, r0, #684	@ 0x2ac
c0de047e:	4620      	mov	r0, r4
c0de0480:	f00a ff9f 	bl	c0deb3c2 <buffer_read_bip32_path>
c0de0484:	b9b8      	cbnz	r0, c0de04b6 <handler_sign_tx+0x9a>
c0de0486:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de048a:	e019      	b.n	c0de04c0 <handler_sign_tx+0xa4>
c0de048c:	f24b 0007 	movw	r0, #45063	@ 0xb007
c0de0490:	e016      	b.n	c0de04c0 <handler_sign_tx+0xa4>
c0de0492:	eb09 0106 	add.w	r1, r9, r6
c0de0496:	4408      	add	r0, r1
c0de0498:	f100 0108 	add.w	r1, r0, #8
c0de049c:	4620      	mov	r0, r4
c0de049e:	f00a ffba 	bl	c0deb416 <buffer_move>
c0de04a2:	b158      	cbz	r0, c0de04bc <handler_sign_tx+0xa0>
c0de04a4:	eb09 0106 	add.w	r1, r9, r6
c0de04a8:	6862      	ldr	r2, [r4, #4]
c0de04aa:	f8d1 0208 	ldr.w	r0, [r1, #520]	@ 0x208
c0de04ae:	4410      	add	r0, r2
c0de04b0:	f8c1 0208 	str.w	r0, [r1, #520]	@ 0x208
c0de04b4:	b14d      	cbz	r5, c0de04ca <handler_sign_tx+0xae>
c0de04b6:	f44f 4010 	mov.w	r0, #36864	@ 0x9000
c0de04ba:	e001      	b.n	c0de04c0 <handler_sign_tx+0xa4>
c0de04bc:	f24b 0005 	movw	r0, #45061	@ 0xb005
c0de04c0:	b006      	add	sp, #24
c0de04c2:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de04c6:	f000 b83d 	b.w	c0de0544 <io_send_sw>
c0de04ca:	2100      	movs	r1, #0
c0de04cc:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de04d0:	eb09 0006 	add.w	r0, r9, r6
c0de04d4:	f100 0108 	add.w	r1, r0, #8
c0de04d8:	9101      	str	r1, [sp, #4]
c0de04da:	f500 7104 	add.w	r1, r0, #528	@ 0x210
c0de04de:	a801      	add	r0, sp, #4
c0de04e0:	f000 fa00 	bl	c0de08e4 <transaction_deserialize>
c0de04e4:	2801      	cmp	r0, #1
c0de04e6:	d114      	bne.n	c0de0512 <handler_sign_tx+0xf6>
c0de04e8:	2001      	movs	r0, #1
c0de04ea:	f809 0006 	strb.w	r0, [r9, r6]
c0de04ee:	eb09 0006 	add.w	r0, r9, r6
c0de04f2:	f8d0 1208 	ldr.w	r1, [r0, #520]	@ 0x208
c0de04f6:	f500 720e 	add.w	r2, r0, #568	@ 0x238
c0de04fa:	9105      	str	r1, [sp, #20]
c0de04fc:	f100 0108 	add.w	r1, r0, #8
c0de0500:	9104      	str	r1, [sp, #16]
c0de0502:	a804      	add	r0, sp, #16
c0de0504:	2101      	movs	r1, #1
c0de0506:	f00b fb17 	bl	c0debb38 <cx_keccak_256_hash_iovec>
c0de050a:	b140      	cbz	r0, c0de051e <handler_sign_tx+0x102>
c0de050c:	f24b 0006 	movw	r0, #45062	@ 0xb006
c0de0510:	e001      	b.n	c0de0516 <handler_sign_tx+0xfa>
c0de0512:	f24b 0005 	movw	r0, #45061	@ 0xb005
c0de0516:	f000 f815 	bl	c0de0544 <io_send_sw>
c0de051a:	b006      	add	sp, #24
c0de051c:	bd70      	pop	{r4, r5, r6, pc}
c0de051e:	eb09 0006 	add.w	r0, r9, r6
c0de0522:	f8d0 022c 	ldr.w	r0, [r0, #556]	@ 0x22c
c0de0526:	4906      	ldr	r1, [pc, #24]	@ (c0de0540 <handler_sign_tx+0x124>)
c0de0528:	4479      	add	r1, pc
c0de052a:	f00b ffe1 	bl	c0dec4f0 <strcmp>
c0de052e:	b110      	cbz	r0, c0de0536 <handler_sign_tx+0x11a>
c0de0530:	f000 fcc5 	bl	c0de0ebe <ui_display_transaction>
c0de0534:	e7f1      	b.n	c0de051a <handler_sign_tx+0xfe>
c0de0536:	f000 fcbf 	bl	c0de0eb8 <ui_display_blind_signed_transaction>
c0de053a:	e7ee      	b.n	c0de051a <handler_sign_tx+0xfe>
c0de053c:	00000000 	.word	0x00000000
c0de0540:	0000d473 	.word	0x0000d473

c0de0544 <io_send_sw>:
c0de0544:	b580      	push	{r7, lr}
c0de0546:	4602      	mov	r2, r0
c0de0548:	2000      	movs	r0, #0
c0de054a:	2100      	movs	r1, #0
c0de054c:	f00b f93a 	bl	c0deb7c4 <io_send_response_buffers>
c0de0550:	bd80      	pop	{r7, pc}

c0de0552 <handler_cmd_dummy>:
c0de0552:	b580      	push	{r7, lr}
c0de0554:	e9d0 2100 	ldrd	r2, r1, [r0]
c0de0558:	4610      	mov	r0, r2
c0de055a:	f000 f802 	bl	c0de0562 <io_send_response_pointer>
c0de055e:	2000      	movs	r0, #0
c0de0560:	bd80      	pop	{r7, pc}

c0de0562 <io_send_response_pointer>:
c0de0562:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de0564:	2200      	movs	r2, #0
c0de0566:	ab01      	add	r3, sp, #4
c0de0568:	c307      	stmia	r3!, {r0, r1, r2}
c0de056a:	a801      	add	r0, sp, #4
c0de056c:	2101      	movs	r1, #1
c0de056e:	f44f 4210 	mov.w	r2, #36864	@ 0x9000
c0de0572:	f00b f927 	bl	c0deb7c4 <io_send_response_buffers>
c0de0576:	bd8f      	pop	{r0, r1, r2, r3, r7, pc}

c0de0578 <io_send_sw>:
c0de0578:	b580      	push	{r7, lr}
c0de057a:	4602      	mov	r2, r0
c0de057c:	2000      	movs	r0, #0
c0de057e:	2100      	movs	r1, #0
c0de0580:	f00b f920 	bl	c0deb7c4 <io_send_response_buffers>
c0de0584:	bd80      	pop	{r7, pc}

c0de0586 <handler_cmd_keccakH>:
c0de0586:	b5b0      	push	{r4, r5, r7, lr}
c0de0588:	b0f2      	sub	sp, #456	@ 0x1c8
c0de058a:	466d      	mov	r5, sp
c0de058c:	4604      	mov	r4, r0
c0de058e:	4628      	mov	r0, r5
c0de0590:	f001 fdab 	bl	c0de20ea <keccak_init>
c0de0594:	88a2      	ldrh	r2, [r4, #4]
c0de0596:	6821      	ldr	r1, [r4, #0]
c0de0598:	4628      	mov	r0, r5
c0de059a:	f001 fdaa 	bl	c0de20f2 <keccak_update>
c0de059e:	ac6a      	add	r4, sp, #424	@ 0x1a8
c0de05a0:	4628      	mov	r0, r5
c0de05a2:	4621      	mov	r1, r4
c0de05a4:	f001 fda7 	bl	c0de20f6 <keccak_final>
c0de05a8:	4620      	mov	r0, r4
c0de05aa:	2120      	movs	r1, #32
c0de05ac:	f7ff ffd9 	bl	c0de0562 <io_send_response_pointer>
c0de05b0:	2000      	movs	r0, #0
c0de05b2:	b072      	add	sp, #456	@ 0x1c8
c0de05b4:	bdb0      	pop	{r4, r5, r7, pc}
	...

c0de05b8 <handler_cmd_keccak_prng>:
c0de05b8:	b510      	push	{r4, lr}
c0de05ba:	b090      	sub	sp, #64	@ 0x40
c0de05bc:	2980      	cmp	r1, #128	@ 0x80
c0de05be:	d007      	beq.n	c0de05d0 <handler_cmd_keccak_prng+0x18>
c0de05c0:	2901      	cmp	r1, #1
c0de05c2:	d017      	beq.n	c0de05f4 <handler_cmd_keccak_prng+0x3c>
c0de05c4:	bb11      	cbnz	r1, c0de060c <handler_cmd_keccak_prng+0x54>
c0de05c6:	4817      	ldr	r0, [pc, #92]	@ (c0de0624 <handler_cmd_keccak_prng+0x6c>)
c0de05c8:	4448      	add	r0, r9
c0de05ca:	f001 fd96 	bl	c0de20fa <inner_keccak256_init>
c0de05ce:	e019      	b.n	c0de0604 <handler_cmd_keccak_prng+0x4c>
c0de05d0:	4c14      	ldr	r4, [pc, #80]	@ (c0de0624 <handler_cmd_keccak_prng+0x6c>)
c0de05d2:	eb09 0004 	add.w	r0, r9, r4
c0de05d6:	f001 fdb3 	bl	c0de2140 <inner_keccak256_flip>
c0de05da:	b9a0      	cbnz	r0, c0de0606 <handler_cmd_keccak_prng+0x4e>
c0de05dc:	eb09 0004 	add.w	r0, r9, r4
c0de05e0:	4669      	mov	r1, sp
c0de05e2:	2240      	movs	r2, #64	@ 0x40
c0de05e4:	f001 fdc2 	bl	c0de216c <inner_keccak256_extract>
c0de05e8:	b968      	cbnz	r0, c0de0606 <handler_cmd_keccak_prng+0x4e>
c0de05ea:	4668      	mov	r0, sp
c0de05ec:	2140      	movs	r1, #64	@ 0x40
c0de05ee:	f7ff ffb8 	bl	c0de0562 <io_send_response_pointer>
c0de05f2:	e014      	b.n	c0de061e <handler_cmd_keccak_prng+0x66>
c0de05f4:	490b      	ldr	r1, [pc, #44]	@ (c0de0624 <handler_cmd_keccak_prng+0x6c>)
c0de05f6:	eb09 0301 	add.w	r3, r9, r1
c0de05fa:	e9d0 1200 	ldrd	r1, r2, [r0]
c0de05fe:	4618      	mov	r0, r3
c0de0600:	f001 fd8c 	bl	c0de211c <inner_keccak256_inject>
c0de0604:	b148      	cbz	r0, c0de061a <handler_cmd_keccak_prng+0x62>
c0de0606:	f000 f911 	bl	c0de082c <OUTLINED_FUNCTION_0>
c0de060a:	e009      	b.n	c0de0620 <handler_cmd_keccak_prng+0x68>
c0de060c:	f646 2086 	movw	r0, #27270	@ 0x6a86
c0de0610:	b010      	add	sp, #64	@ 0x40
c0de0612:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de0616:	f7ff bfaf 	b.w	c0de0578 <io_send_sw>
c0de061a:	f000 f90f 	bl	c0de083c <OUTLINED_FUNCTION_2>
c0de061e:	2000      	movs	r0, #0
c0de0620:	b010      	add	sp, #64	@ 0x40
c0de0622:	bd10      	pop	{r4, pc}
c0de0624:	000002d8 	.word	0x000002d8

c0de0628 <handler_cmd_sample_in_ball>:
c0de0628:	b510      	push	{r4, lr}
c0de062a:	f5ad 6d80 	sub.w	sp, sp, #1024	@ 0x400
c0de062e:	6801      	ldr	r1, [r0, #0]
c0de0630:	466c      	mov	r4, sp
c0de0632:	4620      	mov	r0, r4
c0de0634:	f002 fcc3 	bl	c0de2fbe <pqcrystals_dilithium2_lowram_poly_challenge>
c0de0638:	4620      	mov	r0, r4
c0de063a:	f000 f8fb 	bl	c0de0834 <OUTLINED_FUNCTION_1>
c0de063e:	2000      	movs	r0, #0
c0de0640:	f50d 6d80 	add.w	sp, sp, #1024	@ 0x400
c0de0644:	bd10      	pop	{r4, pc}

c0de0646 <handler_cmd_keygen_core_dilithium>:
c0de0646:	b580      	push	{r7, lr}
c0de0648:	f5ad 6d72 	sub.w	sp, sp, #3872	@ 0xf20
c0de064c:	6802      	ldr	r2, [r0, #0]
c0de064e:	f50d 6020 	add.w	r0, sp, #2560	@ 0xa00
c0de0652:	4669      	mov	r1, sp
c0de0654:	f002 fe9e 	bl	c0de3394 <crypto_sign_keypair_core>
c0de0658:	b110      	cbz	r0, c0de0660 <handler_cmd_keygen_core_dilithium+0x1a>
c0de065a:	f000 f8e7 	bl	c0de082c <OUTLINED_FUNCTION_0>
c0de065e:	e003      	b.n	c0de0668 <handler_cmd_keygen_core_dilithium+0x22>
c0de0660:	4668      	mov	r0, sp
c0de0662:	f000 f8e7 	bl	c0de0834 <OUTLINED_FUNCTION_1>
c0de0666:	2000      	movs	r0, #0
c0de0668:	f50d 6d72 	add.w	sp, sp, #3872	@ 0xf20
c0de066c:	bd80      	pop	{r7, pc}

c0de066e <handler_cmd_keygen_dilithium>:
c0de066e:	b580      	push	{r7, lr}
c0de0670:	f5ad 6d72 	sub.w	sp, sp, #3872	@ 0xf20
c0de0674:	f50d 6020 	add.w	r0, sp, #2560	@ 0xa00
c0de0678:	4669      	mov	r1, sp
c0de067a:	f002 fe7a 	bl	c0de3372 <pqcrystals_dilithium2_lowram_keypair>
c0de067e:	b110      	cbz	r0, c0de0686 <handler_cmd_keygen_dilithium+0x18>
c0de0680:	f000 f8d4 	bl	c0de082c <OUTLINED_FUNCTION_0>
c0de0684:	e003      	b.n	c0de068e <handler_cmd_keygen_dilithium+0x20>
c0de0686:	4668      	mov	r0, sp
c0de0688:	f000 f8d4 	bl	c0de0834 <OUTLINED_FUNCTION_1>
c0de068c:	2000      	movs	r0, #0
c0de068e:	f50d 6d72 	add.w	sp, sp, #3872	@ 0xf20
c0de0692:	bd80      	pop	{r7, pc}

c0de0694 <handler_cmd_sign_dilithium>:
c0de0694:	b5b0      	push	{r4, r5, r7, lr}
c0de0696:	f6ad 7d28 	subw	sp, sp, #3880	@ 0xf28
c0de069a:	4604      	mov	r4, r0
c0de069c:	2980      	cmp	r1, #128	@ 0x80
c0de069e:	d016      	beq.n	c0de06ce <handler_cmd_sign_dilithium+0x3a>
c0de06a0:	2901      	cmp	r1, #1
c0de06a2:	d026      	beq.n	c0de06f2 <handler_cmd_sign_dilithium+0x5e>
c0de06a4:	bb69      	cbnz	r1, c0de0702 <handler_cmd_sign_dilithium+0x6e>
c0de06a6:	482c      	ldr	r0, [pc, #176]	@ (c0de0758 <handler_cmd_sign_dilithium+0xc4>)
c0de06a8:	f241 01f4 	movw	r1, #4340	@ 0x10f4
c0de06ac:	4448      	add	r0, r9
c0de06ae:	1842      	adds	r2, r0, r1
c0de06b0:	f60d 2008 	addw	r0, sp, #2568	@ 0xa08
c0de06b4:	a902      	add	r1, sp, #8
c0de06b6:	f002 fe6d 	bl	c0de3394 <crypto_sign_keypair_core>
c0de06ba:	4604      	mov	r4, r0
c0de06bc:	2800      	cmp	r0, #0
c0de06be:	d141      	bne.n	c0de0744 <handler_cmd_sign_dilithium+0xb0>
c0de06c0:	2000      	movs	r0, #0
c0de06c2:	2100      	movs	r1, #0
c0de06c4:	f002 ff3c 	bl	c0de3540 <crypto_sign_signature_init>
c0de06c8:	f000 f8b8 	bl	c0de083c <OUTLINED_FUNCTION_2>
c0de06cc:	e03a      	b.n	c0de0744 <handler_cmd_sign_dilithium+0xb0>
c0de06ce:	4d22      	ldr	r5, [pc, #136]	@ (c0de0758 <handler_cmd_sign_dilithium+0xc4>)
c0de06d0:	f241 01f4 	movw	r1, #4340	@ 0x10f4
c0de06d4:	eb09 0005 	add.w	r0, r9, r5
c0de06d8:	1842      	adds	r2, r0, r1
c0de06da:	f60d 2008 	addw	r0, sp, #2568	@ 0xa08
c0de06de:	a902      	add	r1, sp, #8
c0de06e0:	f002 fe58 	bl	c0de3394 <crypto_sign_keypair_core>
c0de06e4:	bb78      	cbnz	r0, c0de0746 <handler_cmd_sign_dilithium+0xb2>
c0de06e6:	6860      	ldr	r0, [r4, #4]
c0de06e8:	2801      	cmp	r0, #1
c0de06ea:	d812      	bhi.n	c0de0712 <handler_cmd_sign_dilithium+0x7e>
c0de06ec:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de06f0:	e02b      	b.n	c0de074a <handler_cmd_sign_dilithium+0xb6>
c0de06f2:	e9d4 0100 	ldrd	r0, r1, [r4]
c0de06f6:	f002 ff4f 	bl	c0de3598 <crypto_sign_signature_absorb>
c0de06fa:	bb20      	cbnz	r0, c0de0746 <handler_cmd_sign_dilithium+0xb2>
c0de06fc:	f000 f89e 	bl	c0de083c <OUTLINED_FUNCTION_2>
c0de0700:	e026      	b.n	c0de0750 <handler_cmd_sign_dilithium+0xbc>
c0de0702:	f646 2086 	movw	r0, #27270	@ 0x6a86
c0de0706:	f60d 7d28 	addw	sp, sp, #3880	@ 0xf28
c0de070a:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
c0de070e:	f7ff bf33 	b.w	c0de0578 <io_send_sw>
c0de0712:	3802      	subs	r0, #2
c0de0714:	6060      	str	r0, [r4, #4]
c0de0716:	6820      	ldr	r0, [r4, #0]
c0de0718:	3002      	adds	r0, #2
c0de071a:	6020      	str	r0, [r4, #0]
c0de071c:	2000      	movs	r0, #0
c0de071e:	9001      	str	r0, [sp, #4]
c0de0720:	eb09 0005 	add.w	r0, r9, r5
c0de0724:	a901      	add	r1, sp, #4
c0de0726:	aa02      	add	r2, sp, #8
c0de0728:	f500 60f0 	add.w	r0, r0, #1920	@ 0x780
c0de072c:	f002 ff40 	bl	c0de35b0 <crypto_sign_signature_core>
c0de0730:	4604      	mov	r4, r0
c0de0732:	b938      	cbnz	r0, c0de0744 <handler_cmd_sign_dilithium+0xb0>
c0de0734:	eb09 0005 	add.w	r0, r9, r5
c0de0738:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de073c:	f500 60f0 	add.w	r0, r0, #1920	@ 0x780
c0de0740:	f7ff ff0f 	bl	c0de0562 <io_send_response_pointer>
c0de0744:	b124      	cbz	r4, c0de0750 <handler_cmd_sign_dilithium+0xbc>
c0de0746:	f24b 0005 	movw	r0, #45061	@ 0xb005
c0de074a:	f7ff ff15 	bl	c0de0578 <io_send_sw>
c0de074e:	e000      	b.n	c0de0752 <handler_cmd_sign_dilithium+0xbe>
c0de0750:	2000      	movs	r0, #0
c0de0752:	f60d 7d28 	addw	sp, sp, #3880	@ 0xf28
c0de0756:	bdb0      	pop	{r4, r5, r7, pc}
c0de0758:	000002d8 	.word	0x000002d8

c0de075c <handler_cmd_verify_dilithium>:
c0de075c:	b580      	push	{r7, lr}
c0de075e:	b08e      	sub	sp, #56	@ 0x38
c0de0760:	480d      	ldr	r0, [pc, #52]	@ (c0de0798 <handler_cmd_verify_dilithium+0x3c>)
c0de0762:	2100      	movs	r1, #0
c0de0764:	f640 1395 	movw	r3, #2453	@ 0x995
c0de0768:	e9cd 1100 	strd	r1, r1, [sp]
c0de076c:	4478      	add	r0, pc
c0de076e:	9002      	str	r0, [sp, #8]
c0de0770:	a904      	add	r1, sp, #16
c0de0772:	4a0a      	ldr	r2, [pc, #40]	@ (c0de079c <handler_cmd_verify_dilithium+0x40>)
c0de0774:	f10d 0017 	add.w	r0, sp, #23
c0de0778:	447a      	add	r2, pc
c0de077a:	f003 f9bd 	bl	c0de3af8 <pqcrystals_dilithium2_lowram_open>
c0de077e:	b110      	cbz	r0, c0de0786 <handler_cmd_verify_dilithium+0x2a>
c0de0780:	f000 f854 	bl	c0de082c <OUTLINED_FUNCTION_0>
c0de0784:	e005      	b.n	c0de0792 <handler_cmd_verify_dilithium+0x36>
c0de0786:	9904      	ldr	r1, [sp, #16]
c0de0788:	f10d 0017 	add.w	r0, sp, #23
c0de078c:	f7ff fee9 	bl	c0de0562 <io_send_response_pointer>
c0de0790:	2000      	movs	r0, #0
c0de0792:	b00e      	add	sp, #56	@ 0x38
c0de0794:	bd80      	pop	{r7, pc}
c0de0796:	bf00      	nop
c0de0798:	0000e4cf 	.word	0x0000e4cf
c0de079c:	0000db2e 	.word	0x0000db2e

c0de07a0 <handler_cmd_get_sig_chunk>:
c0de07a0:	b580      	push	{r7, lr}
c0de07a2:	4806      	ldr	r0, [pc, #24]	@ (c0de07bc <handler_cmd_get_sig_chunk+0x1c>)
c0de07a4:	ebc1 2101 	rsb	r1, r1, r1, lsl #8
c0de07a8:	4448      	add	r0, r9
c0de07aa:	4408      	add	r0, r1
c0de07ac:	4611      	mov	r1, r2
c0de07ae:	f500 60f0 	add.w	r0, r0, #1920	@ 0x780
c0de07b2:	f7ff fed6 	bl	c0de0562 <io_send_response_pointer>
c0de07b6:	2000      	movs	r0, #0
c0de07b8:	bd80      	pop	{r7, pc}
c0de07ba:	bf00      	nop
c0de07bc:	000002d8 	.word	0x000002d8

c0de07c0 <handler_cmd_get_pk_chunk>:
c0de07c0:	b580      	push	{r7, lr}
c0de07c2:	4806      	ldr	r0, [pc, #24]	@ (c0de07dc <handler_cmd_get_pk_chunk+0x1c>)
c0de07c4:	ebc1 2101 	rsb	r1, r1, r1, lsl #8
c0de07c8:	4448      	add	r0, r9
c0de07ca:	4408      	add	r0, r1
c0de07cc:	4611      	mov	r1, r2
c0de07ce:	f500 7018 	add.w	r0, r0, #608	@ 0x260
c0de07d2:	f7ff fec6 	bl	c0de0562 <io_send_response_pointer>
c0de07d6:	2000      	movs	r0, #0
c0de07d8:	bd80      	pop	{r7, pc}
c0de07da:	bf00      	nop
c0de07dc:	000002d8 	.word	0x000002d8

c0de07e0 <handler_get_mldsa_seed>:
c0de07e0:	b5b0      	push	{r4, r5, r7, lr}
c0de07e2:	b0ea      	sub	sp, #424	@ 0x1a8
c0de07e4:	2100      	movs	r1, #0
c0de07e6:	f7ff fdaf 	bl	c0de0348 <handler_get_public_key>
c0de07ea:	466c      	mov	r4, sp
c0de07ec:	4620      	mov	r0, r4
c0de07ee:	f001 fc7c 	bl	c0de20ea <keccak_init>
c0de07f2:	480c      	ldr	r0, [pc, #48]	@ (c0de0824 <handler_get_mldsa_seed+0x44>)
c0de07f4:	2241      	movs	r2, #65	@ 0x41
c0de07f6:	4448      	add	r0, r9
c0de07f8:	f100 0108 	add.w	r1, r0, #8
c0de07fc:	4620      	mov	r0, r4
c0de07fe:	f001 fc78 	bl	c0de20f2 <keccak_update>
c0de0802:	4809      	ldr	r0, [pc, #36]	@ (c0de0828 <handler_get_mldsa_seed+0x48>)
c0de0804:	f241 01f4 	movw	r1, #4340	@ 0x10f4
c0de0808:	4448      	add	r0, r9
c0de080a:	1845      	adds	r5, r0, r1
c0de080c:	4620      	mov	r0, r4
c0de080e:	4629      	mov	r1, r5
c0de0810:	f001 fc71 	bl	c0de20f6 <keccak_final>
c0de0814:	4628      	mov	r0, r5
c0de0816:	2120      	movs	r1, #32
c0de0818:	f7ff fea3 	bl	c0de0562 <io_send_response_pointer>
c0de081c:	2000      	movs	r0, #0
c0de081e:	b06a      	add	sp, #424	@ 0x1a8
c0de0820:	bdb0      	pop	{r4, r5, r7, pc}
c0de0822:	bf00      	nop
c0de0824:	00000000 	.word	0x00000000
c0de0828:	000002d8 	.word	0x000002d8

c0de082c <OUTLINED_FUNCTION_0>:
c0de082c:	f24b 0005 	movw	r0, #45061	@ 0xb005
c0de0830:	f7ff bea2 	b.w	c0de0578 <io_send_sw>

c0de0834 <OUTLINED_FUNCTION_1>:
c0de0834:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de0838:	f7ff be93 	b.w	c0de0562 <io_send_response_pointer>

c0de083c <OUTLINED_FUNCTION_2>:
c0de083c:	f44f 4010 	mov.w	r0, #36864	@ 0x9000
c0de0840:	f7ff be9a 	b.w	c0de0578 <io_send_sw>

c0de0844 <helper_send_response_pubkey>:
c0de0844:	b5b0      	push	{r4, r5, r7, lr}
c0de0846:	b09a      	sub	sp, #104	@ 0x68
c0de0848:	2041      	movs	r0, #65	@ 0x41
c0de084a:	f10d 0405 	add.w	r4, sp, #5
c0de084e:	2241      	movs	r2, #65	@ 0x41
c0de0850:	f88d 0005 	strb.w	r0, [sp, #5]
c0de0854:	480b      	ldr	r0, [pc, #44]	@ (c0de0884 <helper_send_response_pubkey+0x40>)
c0de0856:	eb09 0500 	add.w	r5, r9, r0
c0de085a:	1c60      	adds	r0, r4, #1
c0de085c:	f105 0108 	add.w	r1, r5, #8
c0de0860:	f00b fdda 	bl	c0dec418 <__aeabi_memcpy>
c0de0864:	2020      	movs	r0, #32
c0de0866:	f105 0149 	add.w	r1, r5, #73	@ 0x49
c0de086a:	2220      	movs	r2, #32
c0de086c:	f88d 0047 	strb.w	r0, [sp, #71]	@ 0x47
c0de0870:	f104 0043 	add.w	r0, r4, #67	@ 0x43
c0de0874:	f00b fdd0 	bl	c0dec418 <__aeabi_memcpy>
c0de0878:	4620      	mov	r0, r4
c0de087a:	2163      	movs	r1, #99	@ 0x63
c0de087c:	f000 f804 	bl	c0de0888 <io_send_response_pointer>
c0de0880:	b01a      	add	sp, #104	@ 0x68
c0de0882:	bdb0      	pop	{r4, r5, r7, pc}
c0de0884:	00000000 	.word	0x00000000

c0de0888 <io_send_response_pointer>:
c0de0888:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de088a:	2200      	movs	r2, #0
c0de088c:	ab01      	add	r3, sp, #4
c0de088e:	c307      	stmia	r3!, {r0, r1, r2}
c0de0890:	a801      	add	r0, sp, #4
c0de0892:	2101      	movs	r1, #1
c0de0894:	f44f 4210 	mov.w	r2, #36864	@ 0x9000
c0de0898:	f00a ff94 	bl	c0deb7c4 <io_send_response_buffers>
c0de089c:	b004      	add	sp, #16
c0de089e:	bd80      	pop	{r7, pc}

c0de08a0 <helper_send_response_sig>:
c0de08a0:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de08a2:	b093      	sub	sp, #76	@ 0x4c
c0de08a4:	f10d 0402 	add.w	r4, sp, #2
c0de08a8:	2149      	movs	r1, #73	@ 0x49
c0de08aa:	1c65      	adds	r5, r4, #1
c0de08ac:	4628      	mov	r0, r5
c0de08ae:	f00b fdbd 	bl	c0dec42c <__aeabi_memclr>
c0de08b2:	480b      	ldr	r0, [pc, #44]	@ (c0de08e0 <helper_send_response_sig+0x40>)
c0de08b4:	eb09 0700 	add.w	r7, r9, r0
c0de08b8:	4628      	mov	r0, r5
c0de08ba:	f897 62a0 	ldrb.w	r6, [r7, #672]	@ 0x2a0
c0de08be:	f507 7116 	add.w	r1, r7, #600	@ 0x258
c0de08c2:	4632      	mov	r2, r6
c0de08c4:	f88d 6002 	strb.w	r6, [sp, #2]
c0de08c8:	f00b fda6 	bl	c0dec418 <__aeabi_memcpy>
c0de08cc:	f897 12a1 	ldrb.w	r1, [r7, #673]	@ 0x2a1
c0de08d0:	1930      	adds	r0, r6, r4
c0de08d2:	7041      	strb	r1, [r0, #1]
c0de08d4:	1cb1      	adds	r1, r6, #2
c0de08d6:	4620      	mov	r0, r4
c0de08d8:	f7ff ffd6 	bl	c0de0888 <io_send_response_pointer>
c0de08dc:	b013      	add	sp, #76	@ 0x4c
c0de08de:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de08e0:	00000000 	.word	0x00000000

c0de08e4 <transaction_deserialize>:
c0de08e4:	b570      	push	{r4, r5, r6, lr}
c0de08e6:	460d      	mov	r5, r1
c0de08e8:	4604      	mov	r4, r0
c0de08ea:	b910      	cbnz	r0, c0de08f2 <transaction_deserialize+0xe>
c0de08ec:	2001      	movs	r0, #1
c0de08ee:	f00b f95b 	bl	c0debba8 <assert_exit>
c0de08f2:	b915      	cbnz	r5, c0de08fa <transaction_deserialize+0x16>
c0de08f4:	2001      	movs	r0, #1
c0de08f6:	f00b f957 	bl	c0debba8 <assert_exit>
c0de08fa:	6860      	ldr	r0, [r4, #4]
c0de08fc:	f5b0 7fff 	cmp.w	r0, #510	@ 0x1fe
c0de0900:	d901      	bls.n	c0de0906 <transaction_deserialize+0x22>
c0de0902:	20f9      	movs	r0, #249	@ 0xf9
c0de0904:	e04b      	b.n	c0de099e <transaction_deserialize+0xba>
c0de0906:	4620      	mov	r0, r4
c0de0908:	4629      	mov	r1, r5
c0de090a:	2200      	movs	r2, #0
c0de090c:	f00a fd1c 	bl	c0deb348 <buffer_read_u64>
c0de0910:	b330      	cbz	r0, c0de0960 <transaction_deserialize+0x7c>
c0de0912:	6820      	ldr	r0, [r4, #0]
c0de0914:	68a1      	ldr	r1, [r4, #8]
c0de0916:	4408      	add	r0, r1
c0de0918:	2114      	movs	r1, #20
c0de091a:	61a8      	str	r0, [r5, #24]
c0de091c:	4620      	mov	r0, r4
c0de091e:	f00a fcf2 	bl	c0deb306 <buffer_seek_cur>
c0de0922:	b1f8      	cbz	r0, c0de0964 <transaction_deserialize+0x80>
c0de0924:	f105 0108 	add.w	r1, r5, #8
c0de0928:	4620      	mov	r0, r4
c0de092a:	2200      	movs	r2, #0
c0de092c:	2600      	movs	r6, #0
c0de092e:	f00a fd0b 	bl	c0deb348 <buffer_read_u64>
c0de0932:	b1c8      	cbz	r0, c0de0968 <transaction_deserialize+0x84>
c0de0934:	f105 0120 	add.w	r1, r5, #32
c0de0938:	4620      	mov	r0, r4
c0de093a:	e9c5 6604 	strd	r6, r6, [r5, #16]
c0de093e:	f00a fd23 	bl	c0deb388 <buffer_read_varint>
c0de0942:	6a29      	ldr	r1, [r5, #32]
c0de0944:	b990      	cbnz	r0, c0de096c <transaction_deserialize+0x88>
c0de0946:	6a68      	ldr	r0, [r5, #36]	@ 0x24
c0de0948:	ea5f 0050 	movs.w	r0, r0, lsr #1
c0de094c:	ea4f 0231 	mov.w	r2, r1, rrx
c0de0950:	2300      	movs	r3, #0
c0de0952:	f1d2 02e8 	rsbs	r2, r2, #232	@ 0xe8
c0de0956:	eb73 0000 	sbcs.w	r0, r3, r0
c0de095a:	d207      	bcs.n	c0de096c <transaction_deserialize+0x88>
c0de095c:	20fc      	movs	r0, #252	@ 0xfc
c0de095e:	e01e      	b.n	c0de099e <transaction_deserialize+0xba>
c0de0960:	20ff      	movs	r0, #255	@ 0xff
c0de0962:	e01c      	b.n	c0de099e <transaction_deserialize+0xba>
c0de0964:	20fe      	movs	r0, #254	@ 0xfe
c0de0966:	e01a      	b.n	c0de099e <transaction_deserialize+0xba>
c0de0968:	20fd      	movs	r0, #253	@ 0xfd
c0de096a:	e018      	b.n	c0de099e <transaction_deserialize+0xba>
c0de096c:	6820      	ldr	r0, [r4, #0]
c0de096e:	68a2      	ldr	r2, [r4, #8]
c0de0970:	4410      	add	r0, r2
c0de0972:	61e8      	str	r0, [r5, #28]
c0de0974:	4620      	mov	r0, r4
c0de0976:	f00a fcc6 	bl	c0deb306 <buffer_seek_cur>
c0de097a:	b168      	cbz	r0, c0de0998 <transaction_deserialize+0xb4>
c0de097c:	f105 031c 	add.w	r3, r5, #28
c0de0980:	cb0d      	ldmia	r3, {r0, r2, r3}
c0de0982:	f000 f80e 	bl	c0de09a2 <transaction_utils_check_encoding>
c0de0986:	b148      	cbz	r0, c0de099c <transaction_deserialize+0xb8>
c0de0988:	e9d4 1201 	ldrd	r1, r2, [r4, #4]
c0de098c:	f06f 0006 	mvn.w	r0, #6
c0de0990:	428a      	cmp	r2, r1
c0de0992:	bf08      	it	eq
c0de0994:	2001      	moveq	r0, #1
c0de0996:	e002      	b.n	c0de099e <transaction_deserialize+0xba>
c0de0998:	20fb      	movs	r0, #251	@ 0xfb
c0de099a:	e000      	b.n	c0de099e <transaction_deserialize+0xba>
c0de099c:	20fa      	movs	r0, #250	@ 0xfa
c0de099e:	b240      	sxtb	r0, r0
c0de09a0:	bd70      	pop	{r4, r5, r6, pc}

c0de09a2 <transaction_utils_check_encoding>:
c0de09a2:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de09a4:	461c      	mov	r4, r3
c0de09a6:	4615      	mov	r5, r2
c0de09a8:	4606      	mov	r6, r0
c0de09aa:	b910      	cbnz	r0, c0de09b2 <transaction_utils_check_encoding+0x10>
c0de09ac:	2001      	movs	r0, #1
c0de09ae:	f00b f8fb 	bl	c0debba8 <assert_exit>
c0de09b2:	2000      	movs	r0, #0
c0de09b4:	2300      	movs	r3, #0
c0de09b6:	4602      	mov	r2, r0
c0de09b8:	1b40      	subs	r0, r0, r5
c0de09ba:	4619      	mov	r1, r3
c0de09bc:	eb73 0004 	sbcs.w	r0, r3, r4
c0de09c0:	d206      	bcs.n	c0de09d0 <transaction_utils_check_encoding+0x2e>
c0de09c2:	56b7      	ldrsb	r7, [r6, r2]
c0de09c4:	1c50      	adds	r0, r2, #1
c0de09c6:	f141 0300 	adc.w	r3, r1, #0
c0de09ca:	f1b7 3fff 	cmp.w	r7, #4294967295	@ 0xffffffff
c0de09ce:	dcf2      	bgt.n	c0de09b6 <transaction_utils_check_encoding+0x14>
c0de09d0:	2000      	movs	r0, #0
c0de09d2:	1b52      	subs	r2, r2, r5
c0de09d4:	41a1      	sbcs	r1, r4
c0de09d6:	bf28      	it	cs
c0de09d8:	2001      	movcs	r0, #1
c0de09da:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0de09dc <validate_pubkey>:
c0de09dc:	b108      	cbz	r0, c0de09e2 <validate_pubkey+0x6>
c0de09de:	f7ff bf31 	b.w	c0de0844 <helper_send_response_pubkey>
c0de09e2:	f646 1085 	movw	r0, #27013	@ 0x6985
c0de09e6:	f000 b800 	b.w	c0de09ea <io_send_sw>

c0de09ea <io_send_sw>:
c0de09ea:	b580      	push	{r7, lr}
c0de09ec:	4602      	mov	r2, r0
c0de09ee:	2000      	movs	r0, #0
c0de09f0:	2100      	movs	r1, #0
c0de09f2:	f00a fee7 	bl	c0deb7c4 <io_send_response_buffers>
c0de09f6:	bd80      	pop	{r7, pc}

c0de09f8 <validate_transaction>:
c0de09f8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de09fc:	b08c      	sub	sp, #48	@ 0x30
c0de09fe:	b378      	cbz	r0, c0de0a60 <validate_transaction+0x68>
c0de0a00:	f8df 8094 	ldr.w	r8, [pc, #148]	@ c0de0a98 <validate_transaction+0xa0>
c0de0a04:	2002      	movs	r0, #2
c0de0a06:	2500      	movs	r5, #0
c0de0a08:	2720      	movs	r7, #32
c0de0a0a:	2203      	movs	r2, #3
c0de0a0c:	f240 6401 	movw	r4, #1537	@ 0x601
c0de0a10:	f10d 0c2c 	add.w	ip, sp, #44	@ 0x2c
c0de0a14:	f10d 0e28 	add.w	lr, sp, #40	@ 0x28
c0de0a18:	950b      	str	r5, [sp, #44]	@ 0x2c
c0de0a1a:	f809 0008 	strb.w	r0, [r9, r8]
c0de0a1e:	2048      	movs	r0, #72	@ 0x48
c0de0a20:	900a      	str	r0, [sp, #40]	@ 0x28
c0de0a22:	eb09 0008 	add.w	r0, r9, r8
c0de0a26:	f890 32d4 	ldrb.w	r3, [r0, #724]	@ 0x2d4
c0de0a2a:	f500 710e 	add.w	r1, r0, #568	@ 0x238
c0de0a2e:	f500 7616 	add.w	r6, r0, #600	@ 0x258
c0de0a32:	e9cd 4200 	strd	r4, r2, [sp]
c0de0a36:	f500 722b 	add.w	r2, r0, #684	@ 0x2ac
c0de0a3a:	2000      	movs	r0, #0
c0de0a3c:	9508      	str	r5, [sp, #32]
c0de0a3e:	e9cd c506 	strd	ip, r5, [sp, #24]
c0de0a42:	e9cd 1702 	strd	r1, r7, [sp, #8]
c0de0a46:	2121      	movs	r1, #33	@ 0x21
c0de0a48:	e9cd 6e04 	strd	r6, lr, [sp, #16]
c0de0a4c:	f00a fdae 	bl	c0deb5ac <bip32_derive_with_seed_ecdsa_sign_hash_256>
c0de0a50:	b188      	cbz	r0, c0de0a76 <validate_transaction+0x7e>
c0de0a52:	f24b 0008 	movw	r0, #45064	@ 0xb008
c0de0a56:	f809 5008 	strb.w	r5, [r9, r8]
c0de0a5a:	f7ff ffc6 	bl	c0de09ea <io_send_sw>
c0de0a5e:	e017      	b.n	c0de0a90 <validate_transaction+0x98>
c0de0a60:	480d      	ldr	r0, [pc, #52]	@ (c0de0a98 <validate_transaction+0xa0>)
c0de0a62:	2100      	movs	r1, #0
c0de0a64:	f809 1000 	strb.w	r1, [r9, r0]
c0de0a68:	f646 1085 	movw	r0, #27013	@ 0x6985
c0de0a6c:	b00c      	add	sp, #48	@ 0x30
c0de0a6e:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de0a72:	f7ff bfba 	b.w	c0de09ea <io_send_sw>
c0de0a76:	990a      	ldr	r1, [sp, #40]	@ 0x28
c0de0a78:	eb09 0008 	add.w	r0, r9, r8
c0de0a7c:	f880 12a0 	strb.w	r1, [r0, #672]	@ 0x2a0
c0de0a80:	f89d 102c 	ldrb.w	r1, [sp, #44]	@ 0x2c
c0de0a84:	f001 0101 	and.w	r1, r1, #1
c0de0a88:	f880 12a1 	strb.w	r1, [r0, #673]	@ 0x2a1
c0de0a8c:	f7ff ff08 	bl	c0de08a0 <helper_send_response_sig>
c0de0a90:	b00c      	add	sp, #48	@ 0x30
c0de0a92:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de0a96:	bf00      	nop
c0de0a98:	00000000 	.word	0x00000000

c0de0a9c <app_quit>:
c0de0a9c:	20ff      	movs	r0, #255	@ 0xff
c0de0a9e:	f00b fb51 	bl	c0dec144 <os_sched_exit>
	...

c0de0aa4 <ui_menu_main>:
c0de0aa4:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
c0de0aa6:	4c1b      	ldr	r4, [pc, #108]	@ (c0de0b14 <ui_menu_main+0x70>)
c0de0aa8:	4819      	ldr	r0, [pc, #100]	@ (c0de0b10 <ui_menu_main+0x6c>)
c0de0aaa:	447c      	add	r4, pc
c0de0aac:	eb09 0500 	add.w	r5, r9, r0
c0de0ab0:	f000 f8dc 	bl	c0de0c6c <OUTLINED_FUNCTION_0>
c0de0ab4:	2609      	movs	r6, #9
c0de0ab6:	2114      	movs	r1, #20
c0de0ab8:	73ae      	strb	r6, [r5, #14]
c0de0aba:	7369      	strb	r1, [r5, #13]
c0de0abc:	4916      	ldr	r1, [pc, #88]	@ (c0de0b18 <ui_menu_main+0x74>)
c0de0abe:	4a17      	ldr	r2, [pc, #92]	@ (c0de0b1c <ui_menu_main+0x78>)
c0de0ac0:	4479      	add	r1, pc
c0de0ac2:	447a      	add	r2, pc
c0de0ac4:	e9c5 2101 	strd	r2, r1, [r5, #4]
c0de0ac8:	7800      	ldrb	r0, [r0, #0]
c0de0aca:	7328      	strb	r0, [r5, #12]
c0de0acc:	f000 f8ce 	bl	c0de0c6c <OUTLINED_FUNCTION_0>
c0de0ad0:	2115      	movs	r1, #21
c0de0ad2:	76ae      	strb	r6, [r5, #26]
c0de0ad4:	7669      	strb	r1, [r5, #25]
c0de0ad6:	4912      	ldr	r1, [pc, #72]	@ (c0de0b20 <ui_menu_main+0x7c>)
c0de0ad8:	4a12      	ldr	r2, [pc, #72]	@ (c0de0b24 <ui_menu_main+0x80>)
c0de0ada:	4479      	add	r1, pc
c0de0adc:	447a      	add	r2, pc
c0de0ade:	e9c5 2104 	strd	r2, r1, [r5, #16]
c0de0ae2:	2100      	movs	r1, #0
c0de0ae4:	7840      	ldrb	r0, [r0, #1]
c0de0ae6:	7628      	strb	r0, [r5, #24]
c0de0ae8:	480f      	ldr	r0, [pc, #60]	@ (c0de0b28 <ui_menu_main+0x84>)
c0de0aea:	4a10      	ldr	r2, [pc, #64]	@ (c0de0b2c <ui_menu_main+0x88>)
c0de0aec:	4b10      	ldr	r3, [pc, #64]	@ (c0de0b30 <ui_menu_main+0x8c>)
c0de0aee:	4478      	add	r0, pc
c0de0af0:	447a      	add	r2, pc
c0de0af2:	447b      	add	r3, pc
c0de0af4:	e9cd 3200 	strd	r3, r2, [sp]
c0de0af8:	e9cd 1002 	strd	r1, r0, [sp, #8]
c0de0afc:	2200      	movs	r2, #0
c0de0afe:	23ff      	movs	r3, #255	@ 0xff
c0de0b00:	480c      	ldr	r0, [pc, #48]	@ (c0de0b34 <ui_menu_main+0x90>)
c0de0b02:	490d      	ldr	r1, [pc, #52]	@ (c0de0b38 <ui_menu_main+0x94>)
c0de0b04:	4478      	add	r0, pc
c0de0b06:	4479      	add	r1, pc
c0de0b08:	f008 fd48 	bl	c0de959c <nbgl_useCaseHomeAndSettings>
c0de0b0c:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}
c0de0b0e:	bf00      	nop
c0de0b10:	000013f0 	.word	0x000013f0
c0de0b14:	0000ef52 	.word	0x0000ef52
c0de0b18:	0000d08f 	.word	0x0000d08f
c0de0b1c:	0000d606 	.word	0x0000d606
c0de0b20:	0000d206 	.word	0x0000d206
c0de0b24:	0000ce37 	.word	0x0000ce37
c0de0b28:	ffffffab 	.word	0xffffffab
c0de0b2c:	0000e678 	.word	0x0000e678
c0de0b30:	0000e66a 	.word	0x0000e66a
c0de0b34:	0000d3fc 	.word	0x0000d3fc
c0de0b38:	0000bcc1 	.word	0x0000bcc1

c0de0b3c <controls_callback>:
c0de0b3c:	b5bf      	push	{r0, r1, r2, r3, r4, r5, r7, lr}
c0de0b3e:	4c22      	ldr	r4, [pc, #136]	@ (c0de0bc8 <controls_callback+0x8c>)
c0de0b40:	2815      	cmp	r0, #21
c0de0b42:	f809 2004 	strb.w	r2, [r9, r4]
c0de0b46:	d011      	beq.n	c0de0b6c <controls_callback+0x30>
c0de0b48:	2814      	cmp	r0, #20
c0de0b4a:	d12a      	bne.n	c0de0ba2 <controls_callback+0x66>
c0de0b4c:	eb09 0504 	add.w	r5, r9, r4
c0de0b50:	4c1e      	ldr	r4, [pc, #120]	@ (c0de0bcc <controls_callback+0x90>)
c0de0b52:	447c      	add	r4, pc
c0de0b54:	f000 f88a 	bl	c0de0c6c <OUTLINED_FUNCTION_0>
c0de0b58:	7800      	ldrb	r0, [r0, #0]
c0de0b5a:	fab0 f080 	clz	r0, r0
c0de0b5e:	0940      	lsrs	r0, r0, #5
c0de0b60:	7328      	strb	r0, [r5, #12]
c0de0b62:	f88d 000f 	strb.w	r0, [sp, #15]
c0de0b66:	f000 f881 	bl	c0de0c6c <OUTLINED_FUNCTION_0>
c0de0b6a:	e015      	b.n	c0de0b98 <controls_callback+0x5c>
c0de0b6c:	4818      	ldr	r0, [pc, #96]	@ (c0de0bd0 <controls_callback+0x94>)
c0de0b6e:	4478      	add	r0, pc
c0de0b70:	f00b fa3a 	bl	c0debfe8 <pic>
c0de0b74:	7840      	ldrb	r0, [r0, #1]
c0de0b76:	b1a8      	cbz	r0, c0de0ba4 <controls_callback+0x68>
c0de0b78:	eb09 0504 	add.w	r5, r9, r4
c0de0b7c:	4c15      	ldr	r4, [pc, #84]	@ (c0de0bd4 <controls_callback+0x98>)
c0de0b7e:	447c      	add	r4, pc
c0de0b80:	f000 f874 	bl	c0de0c6c <OUTLINED_FUNCTION_0>
c0de0b84:	7840      	ldrb	r0, [r0, #1]
c0de0b86:	fab0 f080 	clz	r0, r0
c0de0b8a:	0940      	lsrs	r0, r0, #5
c0de0b8c:	7628      	strb	r0, [r5, #24]
c0de0b8e:	f88d 000f 	strb.w	r0, [sp, #15]
c0de0b92:	f000 f86b 	bl	c0de0c6c <OUTLINED_FUNCTION_0>
c0de0b96:	3001      	adds	r0, #1
c0de0b98:	f10d 010f 	add.w	r1, sp, #15
c0de0b9c:	2201      	movs	r2, #1
c0de0b9e:	f00b fa5d 	bl	c0dec05c <nvm_write>
c0de0ba2:	bdbf      	pop	{r0, r1, r2, r3, r4, r5, r7, pc}
c0de0ba4:	480c      	ldr	r0, [pc, #48]	@ (c0de0bd8 <controls_callback+0x9c>)
c0de0ba6:	490d      	ldr	r1, [pc, #52]	@ (c0de0bdc <controls_callback+0xa0>)
c0de0ba8:	4478      	add	r0, pc
c0de0baa:	4479      	add	r1, pc
c0de0bac:	e9cd 1000 	strd	r1, r0, [sp]
c0de0bb0:	480b      	ldr	r0, [pc, #44]	@ (c0de0be0 <controls_callback+0xa4>)
c0de0bb2:	490c      	ldr	r1, [pc, #48]	@ (c0de0be4 <controls_callback+0xa8>)
c0de0bb4:	4a0c      	ldr	r2, [pc, #48]	@ (c0de0be8 <controls_callback+0xac>)
c0de0bb6:	4b0d      	ldr	r3, [pc, #52]	@ (c0de0bec <controls_callback+0xb0>)
c0de0bb8:	4478      	add	r0, pc
c0de0bba:	4479      	add	r1, pc
c0de0bbc:	447a      	add	r2, pc
c0de0bbe:	447b      	add	r3, pc
c0de0bc0:	f008 ffce 	bl	c0de9b60 <nbgl_useCaseChoice>
c0de0bc4:	bdbf      	pop	{r0, r1, r2, r3, r4, r5, r7, pc}
c0de0bc6:	bf00      	nop
c0de0bc8:	000013f0 	.word	0x000013f0
c0de0bcc:	0000eeaa 	.word	0x0000eeaa
c0de0bd0:	0000ee8e 	.word	0x0000ee8e
c0de0bd4:	0000ee7e 	.word	0x0000ee7e
c0de0bd8:	00000045 	.word	0x00000045
c0de0bdc:	0000d195 	.word	0x0000d195
c0de0be0:	0000c413 	.word	0x0000c413
c0de0be4:	0000cd59 	.word	0x0000cd59
c0de0be8:	0000cf04 	.word	0x0000cf04
c0de0bec:	0000d512 	.word	0x0000d512

c0de0bf0 <review_warning_choice>:
c0de0bf0:	b5b0      	push	{r4, r5, r7, lr}
c0de0bf2:	b086      	sub	sp, #24
c0de0bf4:	b1a8      	cbz	r0, c0de0c22 <review_warning_choice+0x32>
c0de0bf6:	4c17      	ldr	r4, [pc, #92]	@ (c0de0c54 <review_warning_choice+0x64>)
c0de0bf8:	4815      	ldr	r0, [pc, #84]	@ (c0de0c50 <review_warning_choice+0x60>)
c0de0bfa:	447c      	add	r4, pc
c0de0bfc:	eb09 0500 	add.w	r5, r9, r0
c0de0c00:	f000 f834 	bl	c0de0c6c <OUTLINED_FUNCTION_0>
c0de0c04:	7840      	ldrb	r0, [r0, #1]
c0de0c06:	fab0 f080 	clz	r0, r0
c0de0c0a:	0940      	lsrs	r0, r0, #5
c0de0c0c:	7628      	strb	r0, [r5, #24]
c0de0c0e:	f88d 0017 	strb.w	r0, [sp, #23]
c0de0c12:	f000 f82b 	bl	c0de0c6c <OUTLINED_FUNCTION_0>
c0de0c16:	3001      	adds	r0, #1
c0de0c18:	f10d 0117 	add.w	r1, sp, #23
c0de0c1c:	2201      	movs	r2, #1
c0de0c1e:	f00b fa1d 	bl	c0dec05c <nvm_write>
c0de0c22:	480b      	ldr	r0, [pc, #44]	@ (c0de0c50 <review_warning_choice+0x60>)
c0de0c24:	2100      	movs	r1, #0
c0de0c26:	f819 3000 	ldrb.w	r3, [r9, r0]
c0de0c2a:	480b      	ldr	r0, [pc, #44]	@ (c0de0c58 <review_warning_choice+0x68>)
c0de0c2c:	4a0b      	ldr	r2, [pc, #44]	@ (c0de0c5c <review_warning_choice+0x6c>)
c0de0c2e:	4c0c      	ldr	r4, [pc, #48]	@ (c0de0c60 <review_warning_choice+0x70>)
c0de0c30:	4478      	add	r0, pc
c0de0c32:	447a      	add	r2, pc
c0de0c34:	447c      	add	r4, pc
c0de0c36:	e9cd 4200 	strd	r4, r2, [sp]
c0de0c3a:	e9cd 1002 	strd	r1, r0, [sp, #8]
c0de0c3e:	2200      	movs	r2, #0
c0de0c40:	4808      	ldr	r0, [pc, #32]	@ (c0de0c64 <review_warning_choice+0x74>)
c0de0c42:	4909      	ldr	r1, [pc, #36]	@ (c0de0c68 <review_warning_choice+0x78>)
c0de0c44:	4478      	add	r0, pc
c0de0c46:	4479      	add	r1, pc
c0de0c48:	f008 fca8 	bl	c0de959c <nbgl_useCaseHomeAndSettings>
c0de0c4c:	b006      	add	sp, #24
c0de0c4e:	bdb0      	pop	{r4, r5, r7, pc}
c0de0c50:	000013f0 	.word	0x000013f0
c0de0c54:	0000ee02 	.word	0x0000ee02
c0de0c58:	fffffe69 	.word	0xfffffe69
c0de0c5c:	0000e536 	.word	0x0000e536
c0de0c60:	0000e528 	.word	0x0000e528
c0de0c64:	0000d2bc 	.word	0x0000d2bc
c0de0c68:	0000bb81 	.word	0x0000bb81

c0de0c6c <OUTLINED_FUNCTION_0>:
c0de0c6c:	4620      	mov	r0, r4
c0de0c6e:	f00b b9bb 	b.w	c0debfe8 <pic>
	...

c0de0c74 <ui_display_address>:
c0de0c74:	b570      	push	{r4, r5, r6, lr}
c0de0c76:	b088      	sub	sp, #32
c0de0c78:	4e22      	ldr	r6, [pc, #136]	@ (c0de0d04 <ui_display_address+0x90>)
c0de0c7a:	eb09 0106 	add.w	r1, r9, r6
c0de0c7e:	f819 0006 	ldrb.w	r0, [r9, r6]
c0de0c82:	f891 12a8 	ldrb.w	r1, [r1, #680]	@ 0x2a8
c0de0c86:	4308      	orrs	r0, r1
c0de0c88:	d12a      	bne.n	c0de0ce0 <ui_display_address+0x6c>
c0de0c8a:	4d1f      	ldr	r5, [pc, #124]	@ (c0de0d08 <ui_display_address+0x94>)
c0de0c8c:	212b      	movs	r1, #43	@ 0x2b
c0de0c8e:	eb09 0005 	add.w	r0, r9, r5
c0de0c92:	f00b fbcb 	bl	c0dec42c <__aeabi_memclr>
c0de0c96:	ac03      	add	r4, sp, #12
c0de0c98:	2114      	movs	r1, #20
c0de0c9a:	4620      	mov	r0, r4
c0de0c9c:	f00b fbc6 	bl	c0dec42c <__aeabi_memclr>
c0de0ca0:	eb09 0006 	add.w	r0, r9, r6
c0de0ca4:	4621      	mov	r1, r4
c0de0ca6:	2214      	movs	r2, #20
c0de0ca8:	3008      	adds	r0, #8
c0de0caa:	f7ff f9b3 	bl	c0de0014 <address_from_pubkey>
c0de0cae:	b308      	cbz	r0, c0de0cf4 <ui_display_address+0x80>
c0de0cb0:	eb09 0205 	add.w	r2, r9, r5
c0de0cb4:	a803      	add	r0, sp, #12
c0de0cb6:	2114      	movs	r1, #20
c0de0cb8:	232b      	movs	r3, #43	@ 0x2b
c0de0cba:	f00a fd21 	bl	c0deb700 <format_hex>
c0de0cbe:	3001      	adds	r0, #1
c0de0cc0:	d018      	beq.n	c0de0cf4 <ui_display_address+0x80>
c0de0cc2:	4812      	ldr	r0, [pc, #72]	@ (c0de0d0c <ui_display_address+0x98>)
c0de0cc4:	2400      	movs	r4, #0
c0de0cc6:	2100      	movs	r1, #0
c0de0cc8:	4478      	add	r0, pc
c0de0cca:	e9cd 4000 	strd	r4, r0, [sp]
c0de0cce:	eb09 0005 	add.w	r0, r9, r5
c0de0cd2:	4a0f      	ldr	r2, [pc, #60]	@ (c0de0d10 <ui_display_address+0x9c>)
c0de0cd4:	4b0f      	ldr	r3, [pc, #60]	@ (c0de0d14 <ui_display_address+0xa0>)
c0de0cd6:	447a      	add	r2, pc
c0de0cd8:	447b      	add	r3, pc
c0de0cda:	f009 fbbb 	bl	c0dea454 <nbgl_useCaseAddressReview>
c0de0cde:	e00e      	b.n	c0de0cfe <ui_display_address+0x8a>
c0de0ce0:	2000      	movs	r0, #0
c0de0ce2:	f809 0006 	strb.w	r0, [r9, r6]
c0de0ce6:	f24b 0007 	movw	r0, #45063	@ 0xb007
c0de0cea:	b008      	add	sp, #32
c0de0cec:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de0cf0:	f000 b812 	b.w	c0de0d18 <io_send_sw>
c0de0cf4:	f24b 0002 	movw	r0, #45058	@ 0xb002
c0de0cf8:	f000 f80e 	bl	c0de0d18 <io_send_sw>
c0de0cfc:	4604      	mov	r4, r0
c0de0cfe:	4620      	mov	r0, r4
c0de0d00:	b008      	add	sp, #32
c0de0d02:	bd70      	pop	{r4, r5, r6, pc}
c0de0d04:	00000000 	.word	0x00000000
c0de0d08:	0000140c 	.word	0x0000140c
c0de0d0c:	0000005d 	.word	0x0000005d
c0de0d10:	0000baf1 	.word	0x0000baf1
c0de0d14:	0000d4f2 	.word	0x0000d4f2

c0de0d18 <io_send_sw>:
c0de0d18:	b580      	push	{r7, lr}
c0de0d1a:	4602      	mov	r2, r0
c0de0d1c:	2000      	movs	r0, #0
c0de0d1e:	2100      	movs	r1, #0
c0de0d20:	f00a fd50 	bl	c0deb7c4 <io_send_response_buffers>
c0de0d24:	bd80      	pop	{r7, pc}
	...

c0de0d28 <review_choice>:
c0de0d28:	b510      	push	{r4, lr}
c0de0d2a:	4604      	mov	r4, r0
c0de0d2c:	f7ff fe56 	bl	c0de09dc <validate_pubkey>
c0de0d30:	2007      	movs	r0, #7
c0de0d32:	2c00      	cmp	r4, #0
c0de0d34:	bf18      	it	ne
c0de0d36:	2006      	movne	r0, #6
c0de0d38:	4902      	ldr	r1, [pc, #8]	@ (c0de0d44 <review_choice+0x1c>)
c0de0d3a:	4479      	add	r1, pc
c0de0d3c:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de0d40:	f008 bec4 	b.w	c0de9acc <nbgl_useCaseReviewStatus>
c0de0d44:	fffffd67 	.word	0xfffffd67

c0de0d48 <ui_display_transaction_bs_choice>:
c0de0d48:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de0d4a:	b08d      	sub	sp, #52	@ 0x34
c0de0d4c:	4f44      	ldr	r7, [pc, #272]	@ (c0de0e60 <ui_display_transaction_bs_choice+0x118>)
c0de0d4e:	4604      	mov	r4, r0
c0de0d50:	eb09 0007 	add.w	r0, r9, r7
c0de0d54:	f890 02a8 	ldrb.w	r0, [r0, #680]	@ 0x2a8
c0de0d58:	2801      	cmp	r0, #1
c0de0d5a:	d15f      	bne.n	c0de0e1c <ui_display_transaction_bs_choice+0xd4>
c0de0d5c:	f819 0007 	ldrb.w	r0, [r9, r7]
c0de0d60:	2801      	cmp	r0, #1
c0de0d62:	d15b      	bne.n	c0de0e1c <ui_display_transaction_bs_choice+0xd4>
c0de0d64:	4e3f      	ldr	r6, [pc, #252]	@ (c0de0e64 <ui_display_transaction_bs_choice+0x11c>)
c0de0d66:	211e      	movs	r1, #30
c0de0d68:	eb09 0006 	add.w	r0, r9, r6
c0de0d6c:	3014      	adds	r0, #20
c0de0d6e:	f00b fb5d 	bl	c0dec42c <__aeabi_memclr>
c0de0d72:	ad05      	add	r5, sp, #20
c0de0d74:	211e      	movs	r1, #30
c0de0d76:	4628      	mov	r0, r5
c0de0d78:	f00b fb58 	bl	c0dec42c <__aeabi_memclr>
c0de0d7c:	eb09 0007 	add.w	r0, r9, r7
c0de0d80:	211e      	movs	r1, #30
c0de0d82:	e9d0 2386 	ldrd	r2, r3, [r0, #536]	@ 0x218
c0de0d86:	2003      	movs	r0, #3
c0de0d88:	9000      	str	r0, [sp, #0]
c0de0d8a:	4628      	mov	r0, r5
c0de0d8c:	f00a fc71 	bl	c0deb672 <format_fpu64>
c0de0d90:	2800      	cmp	r0, #0
c0de0d92:	d04d      	beq.n	c0de0e30 <ui_display_transaction_bs_choice+0xe8>
c0de0d94:	9500      	str	r5, [sp, #0]
c0de0d96:	eb09 0506 	add.w	r5, r9, r6
c0de0d9a:	211e      	movs	r1, #30
c0de0d9c:	231e      	movs	r3, #30
c0de0d9e:	4a32      	ldr	r2, [pc, #200]	@ (c0de0e68 <ui_display_transaction_bs_choice+0x120>)
c0de0da0:	f105 0014 	add.w	r0, r5, #20
c0de0da4:	447a      	add	r2, pc
c0de0da6:	f00a ff8d 	bl	c0debcc4 <snprintf>
c0de0daa:	3554      	adds	r5, #84	@ 0x54
c0de0dac:	212b      	movs	r1, #43	@ 0x2b
c0de0dae:	4628      	mov	r0, r5
c0de0db0:	f00b fb3c 	bl	c0dec42c <__aeabi_memclr>
c0de0db4:	eb09 0007 	add.w	r0, r9, r7
c0de0db8:	2114      	movs	r1, #20
c0de0dba:	462a      	mov	r2, r5
c0de0dbc:	232b      	movs	r3, #43	@ 0x2b
c0de0dbe:	f8d0 0228 	ldr.w	r0, [r0, #552]	@ 0x228
c0de0dc2:	f00a fc9d 	bl	c0deb700 <format_hex>
c0de0dc6:	3001      	adds	r0, #1
c0de0dc8:	d035      	beq.n	c0de0e36 <ui_display_transaction_bs_choice+0xee>
c0de0dca:	4928      	ldr	r1, [pc, #160]	@ (c0de0e6c <ui_display_transaction_bs_choice+0x124>)
c0de0dcc:	eb09 0006 	add.w	r0, r9, r6
c0de0dd0:	2500      	movs	r5, #0
c0de0dd2:	4602      	mov	r2, r0
c0de0dd4:	4479      	add	r1, pc
c0de0dd6:	f842 1f34 	str.w	r1, [r2, #52]!
c0de0dda:	f849 2006 	str.w	r2, [r9, r6]
c0de0dde:	2202      	movs	r2, #2
c0de0de0:	4923      	ldr	r1, [pc, #140]	@ (c0de0e70 <ui_display_transaction_bs_choice+0x128>)
c0de0de2:	7202      	strb	r2, [r0, #8]
c0de0de4:	f100 0254 	add.w	r2, r0, #84	@ 0x54
c0de0de8:	7285      	strb	r5, [r0, #10]
c0de0dea:	4479      	add	r1, pc
c0de0dec:	e9c0 1211 	strd	r1, r2, [r0, #68]	@ 0x44
c0de0df0:	f100 0114 	add.w	r1, r0, #20
c0de0df4:	6381      	str	r1, [r0, #56]	@ 0x38
c0de0df6:	481f      	ldr	r0, [pc, #124]	@ (c0de0e74 <ui_display_transaction_bs_choice+0x12c>)
c0de0df8:	491f      	ldr	r1, [pc, #124]	@ (c0de0e78 <ui_display_transaction_bs_choice+0x130>)
c0de0dfa:	4478      	add	r0, pc
c0de0dfc:	4479      	add	r1, pc
c0de0dfe:	b314      	cbz	r4, c0de0e46 <ui_display_transaction_bs_choice+0xfe>
c0de0e00:	e9cd 5100 	strd	r5, r1, [sp]
c0de0e04:	e9cd 5002 	strd	r5, r0, [sp, #8]
c0de0e08:	eb09 0106 	add.w	r1, r9, r6
c0de0e0c:	2000      	movs	r0, #0
c0de0e0e:	4a1b      	ldr	r2, [pc, #108]	@ (c0de0e7c <ui_display_transaction_bs_choice+0x134>)
c0de0e10:	4b1b      	ldr	r3, [pc, #108]	@ (c0de0e80 <ui_display_transaction_bs_choice+0x138>)
c0de0e12:	447a      	add	r2, pc
c0de0e14:	447b      	add	r3, pc
c0de0e16:	f009 f87d 	bl	c0de9f14 <nbgl_useCaseReviewBlindSigning>
c0de0e1a:	e011      	b.n	c0de0e40 <ui_display_transaction_bs_choice+0xf8>
c0de0e1c:	2000      	movs	r0, #0
c0de0e1e:	f809 0007 	strb.w	r0, [r9, r7]
c0de0e22:	f24b 0007 	movw	r0, #45063	@ 0xb007
c0de0e26:	b00d      	add	sp, #52	@ 0x34
c0de0e28:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de0e2c:	f000 b82e 	b.w	c0de0e8c <io_send_sw>
c0de0e30:	f24b 0003 	movw	r0, #45059	@ 0xb003
c0de0e34:	e001      	b.n	c0de0e3a <ui_display_transaction_bs_choice+0xf2>
c0de0e36:	f24b 0002 	movw	r0, #45058	@ 0xb002
c0de0e3a:	f000 f827 	bl	c0de0e8c <io_send_sw>
c0de0e3e:	4605      	mov	r5, r0
c0de0e40:	4628      	mov	r0, r5
c0de0e42:	b00d      	add	sp, #52	@ 0x34
c0de0e44:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de0e46:	e9cd 5100 	strd	r5, r1, [sp]
c0de0e4a:	9002      	str	r0, [sp, #8]
c0de0e4c:	eb09 0106 	add.w	r1, r9, r6
c0de0e50:	2000      	movs	r0, #0
c0de0e52:	4a0c      	ldr	r2, [pc, #48]	@ (c0de0e84 <ui_display_transaction_bs_choice+0x13c>)
c0de0e54:	4b0c      	ldr	r3, [pc, #48]	@ (c0de0e88 <ui_display_transaction_bs_choice+0x140>)
c0de0e56:	447a      	add	r2, pc
c0de0e58:	447b      	add	r3, pc
c0de0e5a:	f008 ffad 	bl	c0de9db8 <nbgl_useCaseReview>
c0de0e5e:	e7ef      	b.n	c0de0e40 <ui_display_transaction_bs_choice+0xf8>
c0de0e60:	00000000 	.word	0x00000000
c0de0e64:	00001438 	.word	0x00001438
c0de0e68:	0000d1dc 	.word	0x0000d1dc
c0de0e6c:	0000cc62 	.word	0x0000cc62
c0de0e70:	0000d19f 	.word	0x0000d19f
c0de0e74:	0000009f 	.word	0x0000009f
c0de0e78:	0000cd71 	.word	0x0000cd71
c0de0e7c:	0000b9b5 	.word	0x0000b9b5
c0de0e80:	0000cb07 	.word	0x0000cb07
c0de0e84:	0000b971 	.word	0x0000b971
c0de0e88:	0000cac3 	.word	0x0000cac3

c0de0e8c <io_send_sw>:
c0de0e8c:	b580      	push	{r7, lr}
c0de0e8e:	4602      	mov	r2, r0
c0de0e90:	2000      	movs	r0, #0
c0de0e92:	2100      	movs	r1, #0
c0de0e94:	f00a fc96 	bl	c0deb7c4 <io_send_response_buffers>
c0de0e98:	bd80      	pop	{r7, pc}
	...

c0de0e9c <review_choice>:
c0de0e9c:	b510      	push	{r4, lr}
c0de0e9e:	4604      	mov	r4, r0
c0de0ea0:	f7ff fdaa 	bl	c0de09f8 <validate_transaction>
c0de0ea4:	4903      	ldr	r1, [pc, #12]	@ (c0de0eb4 <review_choice+0x18>)
c0de0ea6:	f084 0001 	eor.w	r0, r4, #1
c0de0eaa:	4479      	add	r1, pc
c0de0eac:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de0eb0:	f008 be0c 	b.w	c0de9acc <nbgl_useCaseReviewStatus>
c0de0eb4:	fffffbf7 	.word	0xfffffbf7

c0de0eb8 <ui_display_blind_signed_transaction>:
c0de0eb8:	2001      	movs	r0, #1
c0de0eba:	f7ff bf45 	b.w	c0de0d48 <ui_display_transaction_bs_choice>

c0de0ebe <ui_display_transaction>:
c0de0ebe:	2000      	movs	r0, #0
c0de0ec0:	f7ff bf42 	b.w	c0de0d48 <ui_display_transaction_bs_choice>

c0de0ec4 <pqcrystals_dilithium_fips202_ref_shake128_init>:
c0de0ec4:	b510      	push	{r4, lr}
c0de0ec6:	4604      	mov	r4, r0
c0de0ec8:	f000 f804 	bl	c0de0ed4 <keccak_init>
c0de0ecc:	2000      	movs	r0, #0
c0de0ece:	f8c4 00c8 	str.w	r0, [r4, #200]	@ 0xc8
c0de0ed2:	bd10      	pop	{r4, pc}

c0de0ed4 <keccak_init>:
c0de0ed4:	2100      	movs	r1, #0
c0de0ed6:	2200      	movs	r2, #0
c0de0ed8:	2ac8      	cmp	r2, #200	@ 0xc8
c0de0eda:	bf08      	it	eq
c0de0edc:	4770      	bxeq	lr
c0de0ede:	1883      	adds	r3, r0, r2
c0de0ee0:	5081      	str	r1, [r0, r2]
c0de0ee2:	3208      	adds	r2, #8
c0de0ee4:	6059      	str	r1, [r3, #4]
c0de0ee6:	e7f7      	b.n	c0de0ed8 <keccak_init+0x4>

c0de0ee8 <pqcrystals_dilithium_fips202_ref_shake128_absorb>:
c0de0ee8:	b51c      	push	{r2, r3, r4, lr}
c0de0eea:	460b      	mov	r3, r1
c0de0eec:	f8d0 10c8 	ldr.w	r1, [r0, #200]	@ 0xc8
c0de0ef0:	9200      	str	r2, [sp, #0]
c0de0ef2:	22a8      	movs	r2, #168	@ 0xa8
c0de0ef4:	4604      	mov	r4, r0
c0de0ef6:	f000 f802 	bl	c0de0efe <keccak_absorb>
c0de0efa:	f001 b8f3 	b.w	c0de20e4 <OUTLINED_FUNCTION_3>

c0de0efe <keccak_absorb>:
c0de0efe:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de0f02:	f8dd 8020 	ldr.w	r8, [sp, #32]
c0de0f06:	461c      	mov	r4, r3
c0de0f08:	4693      	mov	fp, r2
c0de0f0a:	468a      	mov	sl, r1
c0de0f0c:	4606      	mov	r6, r0
c0de0f0e:	eb08 050a 	add.w	r5, r8, sl
c0de0f12:	455d      	cmp	r5, fp
c0de0f14:	d31b      	bcc.n	c0de0f4e <keccak_absorb+0x50>
c0de0f16:	ea4f 05ca 	mov.w	r5, sl, lsl #3
c0de0f1a:	4657      	mov	r7, sl
c0de0f1c:	455f      	cmp	r7, fp
c0de0f1e:	d20d      	bcs.n	c0de0f3c <keccak_absorb+0x3e>
c0de0f20:	f814 0b01 	ldrb.w	r0, [r4], #1
c0de0f24:	f005 0238 	and.w	r2, r5, #56	@ 0x38
c0de0f28:	2100      	movs	r1, #0
c0de0f2a:	f00b f96d 	bl	c0dec208 <__aeabi_llsl>
c0de0f2e:	f027 0207 	bic.w	r2, r7, #7
c0de0f32:	3508      	adds	r5, #8
c0de0f34:	3701      	adds	r7, #1
c0de0f36:	f001 f8c5 	bl	c0de20c4 <OUTLINED_FUNCTION_0>
c0de0f3a:	e7ef      	b.n	c0de0f1c <keccak_absorb+0x1e>
c0de0f3c:	4630      	mov	r0, r6
c0de0f3e:	f000 f963 	bl	c0de1208 <KeccakF1600_StatePermute>
c0de0f42:	ebaa 000b 	sub.w	r0, sl, fp
c0de0f46:	f04f 0a00 	mov.w	sl, #0
c0de0f4a:	4480      	add	r8, r0
c0de0f4c:	e7df      	b.n	c0de0f0e <keccak_absorb+0x10>
c0de0f4e:	ea4f 07ca 	mov.w	r7, sl, lsl #3
c0de0f52:	45aa      	cmp	sl, r5
c0de0f54:	d20e      	bcs.n	c0de0f74 <keccak_absorb+0x76>
c0de0f56:	f814 0b01 	ldrb.w	r0, [r4], #1
c0de0f5a:	f007 0238 	and.w	r2, r7, #56	@ 0x38
c0de0f5e:	2100      	movs	r1, #0
c0de0f60:	f00b f952 	bl	c0dec208 <__aeabi_llsl>
c0de0f64:	f02a 0207 	bic.w	r2, sl, #7
c0de0f68:	3708      	adds	r7, #8
c0de0f6a:	f10a 0a01 	add.w	sl, sl, #1
c0de0f6e:	f001 f8a9 	bl	c0de20c4 <OUTLINED_FUNCTION_0>
c0de0f72:	e7ee      	b.n	c0de0f52 <keccak_absorb+0x54>
c0de0f74:	4650      	mov	r0, sl
c0de0f76:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de0f7a <pqcrystals_dilithium_fips202_ref_shake128_finalize>:
c0de0f7a:	b5b0      	push	{r4, r5, r7, lr}
c0de0f7c:	f8d0 10c8 	ldr.w	r1, [r0, #200]	@ 0xc8
c0de0f80:	22a8      	movs	r2, #168	@ 0xa8
c0de0f82:	4604      	mov	r4, r0
c0de0f84:	25a8      	movs	r5, #168	@ 0xa8
c0de0f86:	f000 f803 	bl	c0de0f90 <keccak_finalize>
c0de0f8a:	f8c4 50c8 	str.w	r5, [r4, #200]	@ 0xc8
c0de0f8e:	bdb0      	pop	{r4, r5, r7, pc}

c0de0f90 <keccak_finalize>:
c0de0f90:	b570      	push	{r4, r5, r6, lr}
c0de0f92:	4606      	mov	r6, r0
c0de0f94:	2038      	movs	r0, #56	@ 0x38
c0de0f96:	4614      	mov	r4, r2
c0de0f98:	460d      	mov	r5, r1
c0de0f9a:	ea00 02c1 	and.w	r2, r0, r1, lsl #3
c0de0f9e:	201f      	movs	r0, #31
c0de0fa0:	2100      	movs	r1, #0
c0de0fa2:	f00b f931 	bl	c0dec208 <__aeabi_llsl>
c0de0fa6:	f025 0207 	bic.w	r2, r5, #7
c0de0faa:	f001 f88b 	bl	c0de20c4 <OUTLINED_FUNCTION_0>
c0de0fae:	f024 0007 	bic.w	r0, r4, #7
c0de0fb2:	4430      	add	r0, r6
c0de0fb4:	f850 1c04 	ldr.w	r1, [r0, #-4]
c0de0fb8:	f081 4100 	eor.w	r1, r1, #2147483648	@ 0x80000000
c0de0fbc:	f840 1c04 	str.w	r1, [r0, #-4]
c0de0fc0:	bd70      	pop	{r4, r5, r6, pc}

c0de0fc2 <pqcrystals_dilithium_fips202_ref_shake128_squeeze>:
c0de0fc2:	b51c      	push	{r2, r3, r4, lr}
c0de0fc4:	4614      	mov	r4, r2
c0de0fc6:	f8d2 30c8 	ldr.w	r3, [r2, #200]	@ 0xc8
c0de0fca:	22a8      	movs	r2, #168	@ 0xa8
c0de0fcc:	9200      	str	r2, [sp, #0]
c0de0fce:	4622      	mov	r2, r4
c0de0fd0:	f000 f802 	bl	c0de0fd8 <keccak_squeeze>
c0de0fd4:	f001 b886 	b.w	c0de20e4 <OUTLINED_FUNCTION_3>

c0de0fd8 <keccak_squeeze>:
c0de0fd8:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de0fdc:	f8dd 8020 	ldr.w	r8, [sp, #32]
c0de0fe0:	461f      	mov	r7, r3
c0de0fe2:	4693      	mov	fp, r2
c0de0fe4:	460d      	mov	r5, r1
c0de0fe6:	4606      	mov	r6, r0
c0de0fe8:	b1e5      	cbz	r5, c0de1024 <keccak_squeeze+0x4c>
c0de0fea:	4547      	cmp	r7, r8
c0de0fec:	d103      	bne.n	c0de0ff6 <keccak_squeeze+0x1e>
c0de0fee:	4658      	mov	r0, fp
c0de0ff0:	f000 f90a 	bl	c0de1208 <KeccakF1600_StatePermute>
c0de0ff4:	2700      	movs	r7, #0
c0de0ff6:	eb07 0a05 	add.w	sl, r7, r5
c0de0ffa:	00fc      	lsls	r4, r7, #3
c0de0ffc:	4547      	cmp	r7, r8
c0de0ffe:	d2f3      	bcs.n	c0de0fe8 <keccak_squeeze+0x10>
c0de1000:	45ba      	cmp	sl, r7
c0de1002:	d9f1      	bls.n	c0de0fe8 <keccak_squeeze+0x10>
c0de1004:	f027 0107 	bic.w	r1, r7, #7
c0de1008:	f004 0238 	and.w	r2, r4, #56	@ 0x38
c0de100c:	f85b 0001 	ldr.w	r0, [fp, r1]
c0de1010:	4459      	add	r1, fp
c0de1012:	6849      	ldr	r1, [r1, #4]
c0de1014:	f00b f90a 	bl	c0dec22c <__aeabi_llsr>
c0de1018:	f806 0b01 	strb.w	r0, [r6], #1
c0de101c:	3408      	adds	r4, #8
c0de101e:	3d01      	subs	r5, #1
c0de1020:	3701      	adds	r7, #1
c0de1022:	e7eb      	b.n	c0de0ffc <keccak_squeeze+0x24>
c0de1024:	4638      	mov	r0, r7
c0de1026:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de102a <keccak_absorb_once>:
c0de102a:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de102e:	4688      	mov	r8, r1
c0de1030:	4604      	mov	r4, r0
c0de1032:	461f      	mov	r7, r3
c0de1034:	2000      	movs	r0, #0
c0de1036:	2100      	movs	r1, #0
c0de1038:	9202      	str	r2, [sp, #8]
c0de103a:	29c8      	cmp	r1, #200	@ 0xc8
c0de103c:	d004      	beq.n	c0de1048 <keccak_absorb_once+0x1e>
c0de103e:	1862      	adds	r2, r4, r1
c0de1040:	5060      	str	r0, [r4, r1]
c0de1042:	3108      	adds	r1, #8
c0de1044:	6050      	str	r0, [r2, #4]
c0de1046:	e7f8      	b.n	c0de103a <keccak_absorb_once+0x10>
c0de1048:	ea4f 00d8 	mov.w	r0, r8, lsr #3
c0de104c:	f8cd 8000 	str.w	r8, [sp]
c0de1050:	9003      	str	r0, [sp, #12]
c0de1052:	4547      	cmp	r7, r8
c0de1054:	d335      	bcc.n	c0de10c2 <keccak_absorb_once+0x98>
c0de1056:	9e02      	ldr	r6, [sp, #8]
c0de1058:	f04f 0800 	mov.w	r8, #0
c0de105c:	9701      	str	r7, [sp, #4]
c0de105e:	9803      	ldr	r0, [sp, #12]
c0de1060:	4580      	cmp	r8, r0
c0de1062:	d023      	beq.n	c0de10ac <keccak_absorb_once+0x82>
c0de1064:	2500      	movs	r5, #0
c0de1066:	4637      	mov	r7, r6
c0de1068:	f04f 0a00 	mov.w	sl, #0
c0de106c:	f04f 0b00 	mov.w	fp, #0
c0de1070:	2d40      	cmp	r5, #64	@ 0x40
c0de1072:	d00b      	beq.n	c0de108c <keccak_absorb_once+0x62>
c0de1074:	f817 0b01 	ldrb.w	r0, [r7], #1
c0de1078:	2100      	movs	r1, #0
c0de107a:	462a      	mov	r2, r5
c0de107c:	f00b f8c4 	bl	c0dec208 <__aeabi_llsl>
c0de1080:	ea4b 0b01 	orr.w	fp, fp, r1
c0de1084:	ea4a 0a00 	orr.w	sl, sl, r0
c0de1088:	3508      	adds	r5, #8
c0de108a:	e7f1      	b.n	c0de1070 <keccak_absorb_once+0x46>
c0de108c:	f854 0038 	ldr.w	r0, [r4, r8, lsl #3]
c0de1090:	3608      	adds	r6, #8
c0de1092:	ea80 000a 	eor.w	r0, r0, sl
c0de1096:	f844 0038 	str.w	r0, [r4, r8, lsl #3]
c0de109a:	eb04 00c8 	add.w	r0, r4, r8, lsl #3
c0de109e:	f108 0801 	add.w	r8, r8, #1
c0de10a2:	6841      	ldr	r1, [r0, #4]
c0de10a4:	ea81 010b 	eor.w	r1, r1, fp
c0de10a8:	6041      	str	r1, [r0, #4]
c0de10aa:	e7d8      	b.n	c0de105e <keccak_absorb_once+0x34>
c0de10ac:	4620      	mov	r0, r4
c0de10ae:	f000 f8ab 	bl	c0de1208 <KeccakF1600_StatePermute>
c0de10b2:	e9dd 8700 	ldrd	r8, r7, [sp]
c0de10b6:	9802      	ldr	r0, [sp, #8]
c0de10b8:	4440      	add	r0, r8
c0de10ba:	eba7 0708 	sub.w	r7, r7, r8
c0de10be:	9002      	str	r0, [sp, #8]
c0de10c0:	e7c7      	b.n	c0de1052 <keccak_absorb_once+0x28>
c0de10c2:	2500      	movs	r5, #0
c0de10c4:	2600      	movs	r6, #0
c0de10c6:	42b7      	cmp	r7, r6
c0de10c8:	d00d      	beq.n	c0de10e6 <keccak_absorb_once+0xbc>
c0de10ca:	9802      	ldr	r0, [sp, #8]
c0de10cc:	f005 0238 	and.w	r2, r5, #56	@ 0x38
c0de10d0:	2100      	movs	r1, #0
c0de10d2:	5d80      	ldrb	r0, [r0, r6]
c0de10d4:	f00b f898 	bl	c0dec208 <__aeabi_llsl>
c0de10d8:	f026 0207 	bic.w	r2, r6, #7
c0de10dc:	3508      	adds	r5, #8
c0de10de:	3601      	adds	r6, #1
c0de10e0:	f000 fff8 	bl	c0de20d4 <OUTLINED_FUNCTION_2>
c0de10e4:	e7ef      	b.n	c0de10c6 <keccak_absorb_once+0x9c>
c0de10e6:	2038      	movs	r0, #56	@ 0x38
c0de10e8:	2100      	movs	r1, #0
c0de10ea:	ea00 02c7 	and.w	r2, r0, r7, lsl #3
c0de10ee:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de10f0:	f00b f88a 	bl	c0dec208 <__aeabi_llsl>
c0de10f4:	f027 0207 	bic.w	r2, r7, #7
c0de10f8:	f000 ffec 	bl	c0de20d4 <OUTLINED_FUNCTION_2>
c0de10fc:	f1a8 0001 	sub.w	r0, r8, #1
c0de1100:	f020 0007 	bic.w	r0, r0, #7
c0de1104:	4420      	add	r0, r4
c0de1106:	6841      	ldr	r1, [r0, #4]
c0de1108:	f081 4100 	eor.w	r1, r1, #2147483648	@ 0x80000000
c0de110c:	6041      	str	r1, [r0, #4]
c0de110e:	e8bd 8dff 	ldmia.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de1112 <pqcrystals_dilithium_fips202_ref_shake128_squeezeblocks>:
c0de1112:	23a8      	movs	r3, #168	@ 0xa8
c0de1114:	f000 b800 	b.w	c0de1118 <keccak_squeezeblocks>

c0de1118 <keccak_squeezeblocks>:
c0de1118:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de111c:	4698      	mov	r8, r3
c0de111e:	4615      	mov	r5, r2
c0de1120:	468b      	mov	fp, r1
c0de1122:	4607      	mov	r7, r0
c0de1124:	ea4f 0ad3 	mov.w	sl, r3, lsr #3
c0de1128:	f1bb 0f00 	cmp.w	fp, #0
c0de112c:	bf08      	it	eq
c0de112e:	e8bd 8df0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de1132:	4628      	mov	r0, r5
c0de1134:	f000 f868 	bl	c0de1208 <KeccakF1600_StatePermute>
c0de1138:	2400      	movs	r4, #0
c0de113a:	4656      	mov	r6, sl
c0de113c:	b146      	cbz	r6, c0de1150 <keccak_squeezeblocks+0x38>
c0de113e:	1929      	adds	r1, r5, r4
c0de1140:	592a      	ldr	r2, [r5, r4]
c0de1142:	1938      	adds	r0, r7, r4
c0de1144:	684b      	ldr	r3, [r1, #4]
c0de1146:	f000 ffac 	bl	c0de20a2 <store64>
c0de114a:	3408      	adds	r4, #8
c0de114c:	3e01      	subs	r6, #1
c0de114e:	e7f5      	b.n	c0de113c <keccak_squeezeblocks+0x24>
c0de1150:	4447      	add	r7, r8
c0de1152:	f1ab 0b01 	sub.w	fp, fp, #1
c0de1156:	e7e7      	b.n	c0de1128 <keccak_squeezeblocks+0x10>

c0de1158 <pqcrystals_dilithium_fips202_ref_shake256_init>:
c0de1158:	b510      	push	{r4, lr}
c0de115a:	4604      	mov	r4, r0
c0de115c:	f7ff feba 	bl	c0de0ed4 <keccak_init>
c0de1160:	2000      	movs	r0, #0
c0de1162:	f8c4 00c8 	str.w	r0, [r4, #200]	@ 0xc8
c0de1166:	bd10      	pop	{r4, pc}

c0de1168 <pqcrystals_dilithium_fips202_ref_shake256_absorb>:
c0de1168:	b51c      	push	{r2, r3, r4, lr}
c0de116a:	460b      	mov	r3, r1
c0de116c:	f8d0 10c8 	ldr.w	r1, [r0, #200]	@ 0xc8
c0de1170:	9200      	str	r2, [sp, #0]
c0de1172:	2288      	movs	r2, #136	@ 0x88
c0de1174:	4604      	mov	r4, r0
c0de1176:	f7ff fec2 	bl	c0de0efe <keccak_absorb>
c0de117a:	f000 bfb3 	b.w	c0de20e4 <OUTLINED_FUNCTION_3>

c0de117e <pqcrystals_dilithium_fips202_ref_shake256_finalize>:
c0de117e:	b5b0      	push	{r4, r5, r7, lr}
c0de1180:	f8d0 10c8 	ldr.w	r1, [r0, #200]	@ 0xc8
c0de1184:	2288      	movs	r2, #136	@ 0x88
c0de1186:	4604      	mov	r4, r0
c0de1188:	2588      	movs	r5, #136	@ 0x88
c0de118a:	f7ff ff01 	bl	c0de0f90 <keccak_finalize>
c0de118e:	f8c4 50c8 	str.w	r5, [r4, #200]	@ 0xc8
c0de1192:	bdb0      	pop	{r4, r5, r7, pc}

c0de1194 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>:
c0de1194:	b51c      	push	{r2, r3, r4, lr}
c0de1196:	4614      	mov	r4, r2
c0de1198:	f8d2 30c8 	ldr.w	r3, [r2, #200]	@ 0xc8
c0de119c:	2288      	movs	r2, #136	@ 0x88
c0de119e:	9200      	str	r2, [sp, #0]
c0de11a0:	4622      	mov	r2, r4
c0de11a2:	f7ff ff19 	bl	c0de0fd8 <keccak_squeeze>
c0de11a6:	f000 bf9d 	b.w	c0de20e4 <OUTLINED_FUNCTION_3>

c0de11aa <pqcrystals_dilithium_fips202_ref_shake256_absorb_once>:
c0de11aa:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0de11ac:	4604      	mov	r4, r0
c0de11ae:	201f      	movs	r0, #31
c0de11b0:	4613      	mov	r3, r2
c0de11b2:	460a      	mov	r2, r1
c0de11b4:	2188      	movs	r1, #136	@ 0x88
c0de11b6:	2588      	movs	r5, #136	@ 0x88
c0de11b8:	9000      	str	r0, [sp, #0]
c0de11ba:	4620      	mov	r0, r4
c0de11bc:	f7ff ff35 	bl	c0de102a <keccak_absorb_once>
c0de11c0:	f8c4 50c8 	str.w	r5, [r4, #200]	@ 0xc8
c0de11c4:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0de11c6 <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>:
c0de11c6:	2388      	movs	r3, #136	@ 0x88
c0de11c8:	f7ff bfa6 	b.w	c0de1118 <keccak_squeezeblocks>

c0de11cc <pqcrystals_dilithium_fips202_ref_shake256>:
c0de11cc:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de11ce:	b0b5      	sub	sp, #212	@ 0xd4
c0de11d0:	466e      	mov	r6, sp
c0de11d2:	460c      	mov	r4, r1
c0de11d4:	4605      	mov	r5, r0
c0de11d6:	4611      	mov	r1, r2
c0de11d8:	461a      	mov	r2, r3
c0de11da:	4630      	mov	r0, r6
c0de11dc:	f7ff ffe5 	bl	c0de11aa <pqcrystals_dilithium_fips202_ref_shake256_absorb_once>
c0de11e0:	2088      	movs	r0, #136	@ 0x88
c0de11e2:	4632      	mov	r2, r6
c0de11e4:	fbb4 f7f0 	udiv	r7, r4, r0
c0de11e8:	4628      	mov	r0, r5
c0de11ea:	4639      	mov	r1, r7
c0de11ec:	f7ff ffeb 	bl	c0de11c6 <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>
c0de11f0:	eb07 1107 	add.w	r1, r7, r7, lsl #4
c0de11f4:	4632      	mov	r2, r6
c0de11f6:	eb05 00c1 	add.w	r0, r5, r1, lsl #3
c0de11fa:	eba4 01c1 	sub.w	r1, r4, r1, lsl #3
c0de11fe:	f7ff ffc9 	bl	c0de1194 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de1202:	b035      	add	sp, #212	@ 0xd4
c0de1204:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

c0de1208 <KeccakF1600_StatePermute>:
c0de1208:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de120c:	b0de      	sub	sp, #376	@ 0x178
c0de120e:	e9d0 2130 	ldrd	r2, r1, [r0, #192]	@ 0xc0
c0de1212:	9000      	str	r0, [sp, #0]
c0de1214:	9156      	str	r1, [sp, #344]	@ 0x158
c0de1216:	f8d0 10a0 	ldr.w	r1, [r0, #160]	@ 0xa0
c0de121a:	9253      	str	r2, [sp, #332]	@ 0x14c
c0de121c:	e9d0 2302 	ldrd	r2, r3, [r0, #8]
c0de1220:	912a      	str	r1, [sp, #168]	@ 0xa8
c0de1222:	f8d0 10a4 	ldr.w	r1, [r0, #164]	@ 0xa4
c0de1226:	912c      	str	r1, [sp, #176]	@ 0xb0
c0de1228:	f8d0 10a8 	ldr.w	r1, [r0, #168]	@ 0xa8
c0de122c:	9148      	str	r1, [sp, #288]	@ 0x120
c0de122e:	f8d0 10ac 	ldr.w	r1, [r0, #172]	@ 0xac
c0de1232:	914f      	str	r1, [sp, #316]	@ 0x13c
c0de1234:	f8d0 10b0 	ldr.w	r1, [r0, #176]	@ 0xb0
c0de1238:	9143      	str	r1, [sp, #268]	@ 0x10c
c0de123a:	f8d0 10b4 	ldr.w	r1, [r0, #180]	@ 0xb4
c0de123e:	914d      	str	r1, [sp, #308]	@ 0x134
c0de1240:	f8d0 10b8 	ldr.w	r1, [r0, #184]	@ 0xb8
c0de1244:	9151      	str	r1, [sp, #324]	@ 0x144
c0de1246:	f8d0 10bc 	ldr.w	r1, [r0, #188]	@ 0xbc
c0de124a:	9154      	str	r1, [sp, #336]	@ 0x150
c0de124c:	f8d0 1080 	ldr.w	r1, [r0, #128]	@ 0x80
c0de1250:	9136      	str	r1, [sp, #216]	@ 0xd8
c0de1252:	f8d0 1084 	ldr.w	r1, [r0, #132]	@ 0x84
c0de1256:	913e      	str	r1, [sp, #248]	@ 0xf8
c0de1258:	f8d0 1088 	ldr.w	r1, [r0, #136]	@ 0x88
c0de125c:	9142      	str	r1, [sp, #264]	@ 0x108
c0de125e:	f8d0 108c 	ldr.w	r1, [r0, #140]	@ 0x8c
c0de1262:	914a      	str	r1, [sp, #296]	@ 0x128
c0de1264:	f8d0 1090 	ldr.w	r1, [r0, #144]	@ 0x90
c0de1268:	913f      	str	r1, [sp, #252]	@ 0xfc
c0de126a:	f8d0 1094 	ldr.w	r1, [r0, #148]	@ 0x94
c0de126e:	9147      	str	r1, [sp, #284]	@ 0x11c
c0de1270:	f8d0 1098 	ldr.w	r1, [r0, #152]	@ 0x98
c0de1274:	9134      	str	r1, [sp, #208]	@ 0xd0
c0de1276:	f8d0 109c 	ldr.w	r1, [r0, #156]	@ 0x9c
c0de127a:	913a      	str	r1, [sp, #232]	@ 0xe8
c0de127c:	6e01      	ldr	r1, [r0, #96]	@ 0x60
c0de127e:	9141      	str	r1, [sp, #260]	@ 0x104
c0de1280:	6e41      	ldr	r1, [r0, #100]	@ 0x64
c0de1282:	9149      	str	r1, [sp, #292]	@ 0x124
c0de1284:	6e81      	ldr	r1, [r0, #104]	@ 0x68
c0de1286:	914e      	str	r1, [sp, #312]	@ 0x138
c0de1288:	6ec1      	ldr	r1, [r0, #108]	@ 0x6c
c0de128a:	9152      	str	r1, [sp, #328]	@ 0x148
c0de128c:	6f01      	ldr	r1, [r0, #112]	@ 0x70
c0de128e:	9150      	str	r1, [sp, #320]	@ 0x140
c0de1290:	6f41      	ldr	r1, [r0, #116]	@ 0x74
c0de1292:	9155      	str	r1, [sp, #340]	@ 0x154
c0de1294:	6f81      	ldr	r1, [r0, #120]	@ 0x78
c0de1296:	9135      	str	r1, [sp, #212]	@ 0xd4
c0de1298:	6fc1      	ldr	r1, [r0, #124]	@ 0x7c
c0de129a:	913c      	str	r1, [sp, #240]	@ 0xf0
c0de129c:	6c01      	ldr	r1, [r0, #64]	@ 0x40
c0de129e:	9145      	str	r1, [sp, #276]	@ 0x114
c0de12a0:	6c41      	ldr	r1, [r0, #68]	@ 0x44
c0de12a2:	914c      	str	r1, [sp, #304]	@ 0x130
c0de12a4:	6c81      	ldr	r1, [r0, #72]	@ 0x48
c0de12a6:	9139      	str	r1, [sp, #228]	@ 0xe4
c0de12a8:	6cc1      	ldr	r1, [r0, #76]	@ 0x4c
c0de12aa:	913b      	str	r1, [sp, #236]	@ 0xec
c0de12ac:	6d01      	ldr	r1, [r0, #80]	@ 0x50
c0de12ae:	9140      	str	r1, [sp, #256]	@ 0x100
c0de12b0:	6d41      	ldr	r1, [r0, #84]	@ 0x54
c0de12b2:	9146      	str	r1, [sp, #280]	@ 0x118
c0de12b4:	6d81      	ldr	r1, [r0, #88]	@ 0x58
c0de12b6:	9144      	str	r1, [sp, #272]	@ 0x110
c0de12b8:	6dc1      	ldr	r1, [r0, #92]	@ 0x5c
c0de12ba:	914b      	str	r1, [sp, #300]	@ 0x12c
c0de12bc:	6a01      	ldr	r1, [r0, #32]
c0de12be:	9158      	str	r1, [sp, #352]	@ 0x160
c0de12c0:	e9d0 e109 	ldrd	lr, r1, [r0, #36]	@ 0x24
c0de12c4:	9133      	str	r1, [sp, #204]	@ 0xcc
c0de12c6:	6ac1      	ldr	r1, [r0, #44]	@ 0x2c
c0de12c8:	913d      	str	r1, [sp, #244]	@ 0xf4
c0de12ca:	6b01      	ldr	r1, [r0, #48]	@ 0x30
c0de12cc:	9131      	str	r1, [sp, #196]	@ 0xc4
c0de12ce:	6b41      	ldr	r1, [r0, #52]	@ 0x34
c0de12d0:	9132      	str	r1, [sp, #200]	@ 0xc8
c0de12d2:	6b81      	ldr	r1, [r0, #56]	@ 0x38
c0de12d4:	9137      	str	r1, [sp, #220]	@ 0xdc
c0de12d6:	6bc1      	ldr	r1, [r0, #60]	@ 0x3c
c0de12d8:	9138      	str	r1, [sp, #224]	@ 0xe0
c0de12da:	6801      	ldr	r1, [r0, #0]
c0de12dc:	915a      	str	r1, [sp, #360]	@ 0x168
c0de12de:	6841      	ldr	r1, [r0, #4]
c0de12e0:	915b      	str	r1, [sp, #364]	@ 0x16c
c0de12e2:	6901      	ldr	r1, [r0, #16]
c0de12e4:	9159      	str	r1, [sp, #356]	@ 0x164
c0de12e6:	6941      	ldr	r1, [r0, #20]
c0de12e8:	915c      	str	r1, [sp, #368]	@ 0x170
c0de12ea:	6981      	ldr	r1, [r0, #24]
c0de12ec:	69c0      	ldr	r0, [r0, #28]
c0de12ee:	912e      	str	r1, [sp, #184]	@ 0xb8
c0de12f0:	9030      	str	r0, [sp, #192]	@ 0xc0
c0de12f2:	4803      	ldr	r0, [pc, #12]	@ (c0de1300 <KeccakF1600_StatePermute+0xf8>)
c0de12f4:	4478      	add	r0, pc
c0de12f6:	3008      	adds	r0, #8
c0de12f8:	905d      	str	r0, [sp, #372]	@ 0x174
c0de12fa:	2000      	movs	r0, #0
c0de12fc:	e002      	b.n	c0de1304 <KeccakF1600_StatePermute+0xfc>
c0de12fe:	bf00      	nop
c0de1300:	0000ded0 	.word	0x0000ded0
c0de1304:	2817      	cmp	r0, #23
c0de1306:	f200 8654 	bhi.w	c0de1fb2 <KeccakF1600_StatePermute+0xdaa>
c0de130a:	9027      	str	r0, [sp, #156]	@ 0x9c
c0de130c:	9848      	ldr	r0, [sp, #288]	@ 0x120
c0de130e:	9936      	ldr	r1, [sp, #216]	@ 0xd8
c0de1310:	469a      	mov	sl, r3
c0de1312:	9257      	str	r2, [sp, #348]	@ 0x15c
c0de1314:	f8cd e098 	str.w	lr, [sp, #152]	@ 0x98
c0de1318:	4048      	eors	r0, r1
c0de131a:	9944      	ldr	r1, [sp, #272]	@ 0x110
c0de131c:	4048      	eors	r0, r1
c0de131e:	9931      	ldr	r1, [sp, #196]	@ 0xc4
c0de1320:	4048      	eors	r0, r1
c0de1322:	993e      	ldr	r1, [sp, #248]	@ 0xf8
c0de1324:	ea80 0402 	eor.w	r4, r0, r2
c0de1328:	984f      	ldr	r0, [sp, #316]	@ 0x13c
c0de132a:	9423      	str	r4, [sp, #140]	@ 0x8c
c0de132c:	4048      	eors	r0, r1
c0de132e:	994b      	ldr	r1, [sp, #300]	@ 0x12c
c0de1330:	4048      	eors	r0, r1
c0de1332:	9932      	ldr	r1, [sp, #200]	@ 0xc8
c0de1334:	4048      	eors	r0, r1
c0de1336:	993a      	ldr	r1, [sp, #232]	@ 0xe8
c0de1338:	4058      	eors	r0, r3
c0de133a:	0043      	lsls	r3, r0, #1
c0de133c:	4606      	mov	r6, r0
c0de133e:	9028      	str	r0, [sp, #160]	@ 0xa0
c0de1340:	9856      	ldr	r0, [sp, #344]	@ 0x158
c0de1342:	ea43 75d4 	orr.w	r5, r3, r4, lsr #31
c0de1346:	ea81 0300 	eor.w	r3, r1, r0
c0de134a:	9855      	ldr	r0, [sp, #340]	@ 0x154
c0de134c:	4043      	eors	r3, r0
c0de134e:	983b      	ldr	r0, [sp, #236]	@ 0xec
c0de1350:	4043      	eors	r3, r0
c0de1352:	982c      	ldr	r0, [sp, #176]	@ 0xb0
c0de1354:	ea83 0b0e 	eor.w	fp, r3, lr
c0de1358:	9b34      	ldr	r3, [sp, #208]	@ 0xd0
c0de135a:	ea85 010b 	eor.w	r1, r5, fp
c0de135e:	0065      	lsls	r5, r4, #1
c0de1360:	ea81 0200 	eor.w	r2, r1, r0
c0de1364:	912f      	str	r1, [sp, #188]	@ 0xbc
c0de1366:	9953      	ldr	r1, [sp, #332]	@ 0x14c
c0de1368:	ea45 76d6 	orr.w	r6, r5, r6, lsr #31
c0de136c:	9222      	str	r2, [sp, #136]	@ 0x88
c0de136e:	ea83 0501 	eor.w	r5, r3, r1
c0de1372:	9950      	ldr	r1, [sp, #320]	@ 0x140
c0de1374:	9b2a      	ldr	r3, [sp, #168]	@ 0xa8
c0de1376:	404d      	eors	r5, r1
c0de1378:	9939      	ldr	r1, [sp, #228]	@ 0xe4
c0de137a:	404d      	eors	r5, r1
c0de137c:	9958      	ldr	r1, [sp, #352]	@ 0x160
c0de137e:	ea85 0801 	eor.w	r8, r5, r1
c0de1382:	ea86 0108 	eor.w	r1, r6, r8
c0de1386:	ea81 0403 	eor.w	r4, r1, r3
c0de138a:	912b      	str	r1, [sp, #172]	@ 0xac
c0de138c:	04a6      	lsls	r6, r4, #18
c0de138e:	9425      	str	r4, [sp, #148]	@ 0x94
c0de1390:	ea46 3c92 	orr.w	ip, r6, r2, lsr #14
c0de1394:	e9dd 1242 	ldrd	r1, r2, [sp, #264]	@ 0x108
c0de1398:	f8cd c070 	str.w	ip, [sp, #112]	@ 0x70
c0de139c:	ea81 0602 	eor.w	r6, r1, r2
c0de13a0:	9941      	ldr	r1, [sp, #260]	@ 0x104
c0de13a2:	9a4d      	ldr	r2, [sp, #308]	@ 0x134
c0de13a4:	404e      	eors	r6, r1
c0de13a6:	9937      	ldr	r1, [sp, #220]	@ 0xdc
c0de13a8:	404e      	eors	r6, r1
c0de13aa:	9959      	ldr	r1, [sp, #356]	@ 0x164
c0de13ac:	ea86 0e01 	eor.w	lr, r6, r1
c0de13b0:	994a      	ldr	r1, [sp, #296]	@ 0x128
c0de13b2:	9e30      	ldr	r6, [sp, #192]	@ 0xc0
c0de13b4:	ea81 0702 	eor.w	r7, r1, r2
c0de13b8:	9949      	ldr	r1, [sp, #292]	@ 0x124
c0de13ba:	404f      	eors	r7, r1
c0de13bc:	9938      	ldr	r1, [sp, #224]	@ 0xe0
c0de13be:	404f      	eors	r7, r1
c0de13c0:	995c      	ldr	r1, [sp, #368]	@ 0x170
c0de13c2:	404f      	eors	r7, r1
c0de13c4:	993c      	ldr	r1, [sp, #240]	@ 0xf0
c0de13c6:	007c      	lsls	r4, r7, #1
c0de13c8:	ea81 0200 	eor.w	r2, r1, r0
c0de13cc:	9846      	ldr	r0, [sp, #280]	@ 0x118
c0de13ce:	ea44 74de 	orr.w	r4, r4, lr, lsr #31
c0de13d2:	4042      	eors	r2, r0
c0de13d4:	983d      	ldr	r0, [sp, #244]	@ 0xf4
c0de13d6:	4042      	eors	r2, r0
c0de13d8:	985b      	ldr	r0, [sp, #364]	@ 0x16c
c0de13da:	ea82 0100 	eor.w	r1, r2, r0
c0de13de:	ea4f 024e 	mov.w	r2, lr, lsl #1
c0de13e2:	ea81 0004 	eor.w	r0, r1, r4
c0de13e6:	ea42 72d7 	orr.w	r2, r2, r7, lsr #31
c0de13ea:	ea80 050a 	eor.w	r5, r0, sl
c0de13ee:	902d      	str	r0, [sp, #180]	@ 0xb4
c0de13f0:	9835      	ldr	r0, [sp, #212]	@ 0xd4
c0de13f2:	9520      	str	r5, [sp, #128]	@ 0x80
c0de13f4:	ea80 0403 	eor.w	r4, r0, r3
c0de13f8:	9840      	ldr	r0, [sp, #256]	@ 0x100
c0de13fa:	4044      	eors	r4, r0
c0de13fc:	9833      	ldr	r0, [sp, #204]	@ 0xcc
c0de13fe:	4044      	eors	r4, r0
c0de1400:	985a      	ldr	r0, [sp, #360]	@ 0x168
c0de1402:	4044      	eors	r4, r0
c0de1404:	9857      	ldr	r0, [sp, #348]	@ 0x15c
c0de1406:	ea84 0a02 	eor.w	sl, r4, r2
c0de140a:	ea80 000a 	eor.w	r0, r0, sl
c0de140e:	f8cd a064 	str.w	sl, [sp, #100]	@ 0x64
c0de1412:	0042      	lsls	r2, r0, #1
c0de1414:	9021      	str	r0, [sp, #132]	@ 0x84
c0de1416:	9854      	ldr	r0, [sp, #336]	@ 0x150
c0de1418:	ea42 72d5 	orr.w	r2, r2, r5, lsr #31
c0de141c:	9257      	str	r2, [sp, #348]	@ 0x15c
c0de141e:	ea22 0c0c 	bic.w	ip, r2, ip
c0de1422:	004a      	lsls	r2, r1, #1
c0de1424:	ea42 73d4 	orr.w	r3, r2, r4, lsr #31
c0de1428:	9a47      	ldr	r2, [sp, #284]	@ 0x11c
c0de142a:	4042      	eors	r2, r0
c0de142c:	9852      	ldr	r0, [sp, #328]	@ 0x148
c0de142e:	4042      	eors	r2, r0
c0de1430:	984c      	ldr	r0, [sp, #304]	@ 0x130
c0de1432:	4042      	eors	r2, r0
c0de1434:	ea82 0506 	eor.w	r5, r2, r6
c0de1438:	9a3a      	ldr	r2, [sp, #232]	@ 0xe8
c0de143a:	ea83 0005 	eor.w	r0, r3, r5
c0de143e:	0063      	lsls	r3, r4, #1
c0de1440:	9c2e      	ldr	r4, [sp, #184]	@ 0xb8
c0de1442:	4042      	eors	r2, r0
c0de1444:	902a      	str	r0, [sp, #168]	@ 0xa8
c0de1446:	ea43 70d1 	orr.w	r0, r3, r1, lsr #31
c0de144a:	9951      	ldr	r1, [sp, #324]	@ 0x144
c0de144c:	9b3f      	ldr	r3, [sp, #252]	@ 0xfc
c0de144e:	9212      	str	r2, [sp, #72]	@ 0x48
c0de1450:	404b      	eors	r3, r1
c0de1452:	994e      	ldr	r1, [sp, #312]	@ 0x138
c0de1454:	404b      	eors	r3, r1
c0de1456:	9945      	ldr	r1, [sp, #276]	@ 0x114
c0de1458:	404b      	eors	r3, r1
c0de145a:	4063      	eors	r3, r4
c0de145c:	ea80 0103 	eor.w	r1, r0, r3
c0de1460:	9834      	ldr	r0, [sp, #208]	@ 0xd0
c0de1462:	9129      	str	r1, [sp, #164]	@ 0xa4
c0de1464:	4048      	eors	r0, r1
c0de1466:	901d      	str	r0, [sp, #116]	@ 0x74
c0de1468:	0200      	lsls	r0, r0, #8
c0de146a:	ea40 6012 	orr.w	r0, r0, r2, lsr #24
c0de146e:	ea8c 0c00 	eor.w	ip, ip, r0
c0de1472:	9034      	str	r0, [sp, #208]	@ 0xd0
c0de1474:	ea4f 004b 	mov.w	r0, fp, lsl #1
c0de1478:	ea40 70d8 	orr.w	r0, r0, r8, lsr #31
c0de147c:	f8cd c090 	str.w	ip, [sp, #144]	@ 0x90
c0de1480:	4078      	eors	r0, r7
c0de1482:	ea80 0106 	eor.w	r1, r0, r6
c0de1486:	902c      	str	r0, [sp, #176]	@ 0xb0
c0de1488:	ea4f 0048 	mov.w	r0, r8, lsl #1
c0de148c:	ea40 70db 	orr.w	r0, r0, fp, lsr #31
c0de1490:	9130      	str	r1, [sp, #192]	@ 0xc0
c0de1492:	ea80 000e 	eor.w	r0, r0, lr
c0de1496:	ea80 0204 	eor.w	r2, r0, r4
c0de149a:	4604      	mov	r4, r0
c0de149c:	0710      	lsls	r0, r2, #28
c0de149e:	922e      	str	r2, [sp, #184]	@ 0xb8
c0de14a0:	9a23      	ldr	r2, [sp, #140]	@ 0x8c
c0de14a2:	9413      	str	r4, [sp, #76]	@ 0x4c
c0de14a4:	ea40 1111 	orr.w	r1, r0, r1, lsr #4
c0de14a8:	0058      	lsls	r0, r3, #1
c0de14aa:	ea40 70d5 	orr.w	r0, r0, r5, lsr #31
c0de14ae:	913a      	str	r1, [sp, #232]	@ 0xe8
c0de14b0:	ea82 0800 	eor.w	r8, r2, r0
c0de14b4:	9a43      	ldr	r2, [sp, #268]	@ 0x10c
c0de14b6:	0068      	lsls	r0, r5, #1
c0de14b8:	ea40 70d3 	orr.w	r0, r0, r3, lsr #31
c0de14bc:	9b2b      	ldr	r3, [sp, #172]	@ 0xac
c0de14be:	f8cd 802c 	str.w	r8, [sp, #44]	@ 0x2c
c0de14c2:	ea88 0602 	eor.w	r6, r8, r2
c0de14c6:	9a28      	ldr	r2, [sp, #160]	@ 0xa0
c0de14c8:	9616      	str	r6, [sp, #88]	@ 0x58
c0de14ca:	ea82 0e00 	eor.w	lr, r2, r0
c0de14ce:	9a4d      	ldr	r2, [sp, #308]	@ 0x134
c0de14d0:	f8cd e0a0 	str.w	lr, [sp, #160]	@ 0xa0
c0de14d4:	ea82 020e 	eor.w	r2, r2, lr
c0de14d8:	0750      	lsls	r0, r2, #29
c0de14da:	9214      	str	r2, [sp, #80]	@ 0x50
c0de14dc:	9a2d      	ldr	r2, [sp, #180]	@ 0xb4
c0de14de:	ea40 00d6 	orr.w	r0, r0, r6, lsr #3
c0de14e2:	901a      	str	r0, [sp, #104]	@ 0x68
c0de14e4:	ea21 0000 	bic.w	r0, r1, r0
c0de14e8:	9936      	ldr	r1, [sp, #216]	@ 0xd8
c0de14ea:	ea8a 0501 	eor.w	r5, sl, r1
c0de14ee:	993e      	ldr	r1, [sp, #248]	@ 0xf8
c0de14f0:	950d      	str	r5, [sp, #52]	@ 0x34
c0de14f2:	4051      	eors	r1, r2
c0de14f4:	9117      	str	r1, [sp, #92]	@ 0x5c
c0de14f6:	0349      	lsls	r1, r1, #13
c0de14f8:	ea41 41d5 	orr.w	r1, r1, r5, lsr #19
c0de14fc:	4048      	eors	r0, r1
c0de14fe:	9143      	str	r1, [sp, #268]	@ 0x10c
c0de1500:	994f      	ldr	r1, [sp, #316]	@ 0x13c
c0de1502:	901b      	str	r0, [sp, #108]	@ 0x6c
c0de1504:	ea80 000c 	eor.w	r0, r0, ip
c0de1508:	404a      	eors	r2, r1
c0de150a:	9948      	ldr	r1, [sp, #288]	@ 0x120
c0de150c:	9211      	str	r2, [sp, #68]	@ 0x44
c0de150e:	ea81 010a 	eor.w	r1, r1, sl
c0de1512:	9148      	str	r1, [sp, #288]	@ 0x120
c0de1514:	0089      	lsls	r1, r1, #2
c0de1516:	ea41 7292 	orr.w	r2, r1, r2, lsr #30
c0de151a:	9959      	ldr	r1, [sp, #356]	@ 0x164
c0de151c:	923e      	str	r2, [sp, #248]	@ 0xf8
c0de151e:	ea88 0501 	eor.w	r5, r8, r1
c0de1522:	995c      	ldr	r1, [sp, #368]	@ 0x170
c0de1524:	9510      	str	r5, [sp, #64]	@ 0x40
c0de1526:	ea81 010e 	eor.w	r1, r1, lr
c0de152a:	915c      	str	r1, [sp, #368]	@ 0x170
c0de152c:	0789      	lsls	r1, r1, #30
c0de152e:	ea41 0195 	orr.w	r1, r1, r5, lsr #2
c0de1532:	9d3c      	ldr	r5, [sp, #240]	@ 0xf0
c0de1534:	914f      	str	r1, [sp, #316]	@ 0x13c
c0de1536:	4391      	bics	r1, r2
c0de1538:	9a35      	ldr	r2, [sp, #212]	@ 0xd4
c0de153a:	ea83 0602 	eor.w	r6, r3, r2
c0de153e:	9a2f      	ldr	r2, [sp, #188]	@ 0xbc
c0de1540:	960f      	str	r6, [sp, #60]	@ 0x3c
c0de1542:	406a      	eors	r2, r5
c0de1544:	920e      	str	r2, [sp, #56]	@ 0x38
c0de1546:	0252      	lsls	r2, r2, #9
c0de1548:	ea42 52d6 	orr.w	r2, r2, r6, lsr #23
c0de154c:	9e2c      	ldr	r6, [sp, #176]	@ 0xb0
c0de154e:	4051      	eors	r1, r2
c0de1550:	9236      	str	r2, [sp, #216]	@ 0xd8
c0de1552:	ea80 0c01 	eor.w	ip, r0, r1
c0de1556:	911f      	str	r1, [sp, #124]	@ 0x7c
c0de1558:	993f      	ldr	r1, [sp, #252]	@ 0xfc
c0de155a:	9847      	ldr	r0, [sp, #284]	@ 0x11c
c0de155c:	4061      	eors	r1, r4
c0de155e:	ea86 0200 	eor.w	r2, r6, r0
c0de1562:	4620      	mov	r0, r4
c0de1564:	9c29      	ldr	r4, [sp, #164]	@ 0xa4
c0de1566:	910c      	str	r1, [sp, #48]	@ 0x30
c0de1568:	0549      	lsls	r1, r1, #21
c0de156a:	9247      	str	r2, [sp, #284]	@ 0x11c
c0de156c:	ea41 25d2 	orr.w	r5, r1, r2, lsr #11
c0de1570:	9a2a      	ldr	r2, [sp, #168]	@ 0xa8
c0de1572:	9956      	ldr	r1, [sp, #344]	@ 0x158
c0de1574:	9518      	str	r5, [sp, #96]	@ 0x60
c0de1576:	ea82 0b01 	eor.w	fp, r2, r1
c0de157a:	9953      	ldr	r1, [sp, #332]	@ 0x14c
c0de157c:	4061      	eors	r1, r4
c0de157e:	910a      	str	r1, [sp, #40]	@ 0x28
c0de1580:	0389      	lsls	r1, r1, #14
c0de1582:	ea41 479b 	orr.w	r7, r1, fp, lsr #18
c0de1586:	995a      	ldr	r1, [sp, #360]	@ 0x168
c0de1588:	971e      	str	r7, [sp, #120]	@ 0x78
c0de158a:	4059      	eors	r1, r3
c0de158c:	9156      	str	r1, [sp, #344]	@ 0x158
c0de158e:	43b9      	bics	r1, r7
c0de1590:	9f21      	ldr	r7, [sp, #132]	@ 0x84
c0de1592:	4069      	eors	r1, r5
c0de1594:	9123      	str	r1, [sp, #140]	@ 0x8c
c0de1596:	ea8c 0301 	eor.w	r3, ip, r1
c0de159a:	9926      	ldr	r1, [sp, #152]	@ 0x98
c0de159c:	ea82 0a01 	eor.w	sl, r2, r1
c0de15a0:	9958      	ldr	r1, [sp, #352]	@ 0x160
c0de15a2:	4061      	eors	r1, r4
c0de15a4:	915a      	str	r1, [sp, #360]	@ 0x168
c0de15a6:	06c9      	lsls	r1, r1, #27
c0de15a8:	ea41 155a 	orr.w	r5, r1, sl, lsr #5
c0de15ac:	9951      	ldr	r1, [sp, #324]	@ 0x144
c0de15ae:	9535      	str	r5, [sp, #212]	@ 0xd4
c0de15b0:	ea80 0401 	eor.w	r4, r0, r1
c0de15b4:	9854      	ldr	r0, [sp, #336]	@ 0x150
c0de15b6:	ea86 0100 	eor.w	r1, r6, r0
c0de15ba:	9e2e      	ldr	r6, [sp, #184]	@ 0xb8
c0de15bc:	060a      	lsls	r2, r1, #24
c0de15be:	ea42 2014 	orr.w	r0, r2, r4, lsr #8
c0de15c2:	9a4a      	ldr	r2, [sp, #296]	@ 0x128
c0de15c4:	9015      	str	r0, [sp, #84]	@ 0x54
c0de15c6:	ea25 0000 	bic.w	r0, r5, r0
c0de15ca:	9d42      	ldr	r5, [sp, #264]	@ 0x108
c0de15cc:	ea82 020e 	eor.w	r2, r2, lr
c0de15d0:	f8dd e0a4 	ldr.w	lr, [sp, #164]	@ 0xa4
c0de15d4:	ea85 0508 	eor.w	r5, r5, r8
c0de15d8:	ea4f 3cc5 	mov.w	ip, r5, lsl #15
c0de15dc:	ea4c 4c52 	orr.w	ip, ip, r2, lsr #17
c0de15e0:	03d2      	lsls	r2, r2, #15
c0de15e2:	ea80 000c 	eor.w	r0, r0, ip
c0de15e6:	f8cd c164 	str.w	ip, [sp, #356]	@ 0x164
c0de15ea:	ea42 4255 	orr.w	r2, r2, r5, lsr #17
c0de15ee:	9d19      	ldr	r5, [sp, #100]	@ 0x64
c0de15f0:	ea83 0c00 	eor.w	ip, r3, r0
c0de15f4:	9026      	str	r0, [sp, #152]	@ 0x98
c0de15f6:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de15f8:	9b14      	ldr	r3, [sp, #80]	@ 0x50
c0de15fa:	f8cd c134 	str.w	ip, [sp, #308]	@ 0x134
c0de15fe:	0740      	lsls	r0, r0, #29
c0de1600:	ea40 03d3 	orr.w	r3, r0, r3, lsr #3
c0de1604:	9830      	ldr	r0, [sp, #192]	@ 0xc0
c0de1606:	9316      	str	r3, [sp, #88]	@ 0x58
c0de1608:	0700      	lsls	r0, r0, #28
c0de160a:	ea40 1016 	orr.w	r0, r0, r6, lsr #4
c0de160e:	9e17      	ldr	r6, [sp, #92]	@ 0x5c
c0de1610:	9058      	str	r0, [sp, #352]	@ 0x160
c0de1612:	4398      	bics	r0, r3
c0de1614:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
c0de1616:	035b      	lsls	r3, r3, #13
c0de1618:	ea43 43d6 	orr.w	r3, r3, r6, lsr #19
c0de161c:	ea83 0600 	eor.w	r6, r3, r0
c0de1620:	9822      	ldr	r0, [sp, #136]	@ 0x88
c0de1622:	933c      	str	r3, [sp, #240]	@ 0xf0
c0de1624:	9b25      	ldr	r3, [sp, #148]	@ 0x94
c0de1626:	9617      	str	r6, [sp, #92]	@ 0x5c
c0de1628:	0480      	lsls	r0, r0, #18
c0de162a:	ea40 3393 	orr.w	r3, r0, r3, lsr #14
c0de162e:	9820      	ldr	r0, [sp, #128]	@ 0x80
c0de1630:	9314      	str	r3, [sp, #80]	@ 0x50
c0de1632:	0040      	lsls	r0, r0, #1
c0de1634:	ea40 70d7 	orr.w	r0, r0, r7, lsr #31
c0de1638:	9f1d      	ldr	r7, [sp, #116]	@ 0x74
c0de163a:	9054      	str	r0, [sp, #336]	@ 0x150
c0de163c:	4398      	bics	r0, r3
c0de163e:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de1640:	021b      	lsls	r3, r3, #8
c0de1642:	ea43 6317 	orr.w	r3, r3, r7, lsr #24
c0de1646:	4058      	eors	r0, r3
c0de1648:	933f      	str	r3, [sp, #252]	@ 0xfc
c0de164a:	9021      	str	r0, [sp, #132]	@ 0x84
c0de164c:	ea80 0806 	eor.w	r8, r0, r6
c0de1650:	9810      	ldr	r0, [sp, #64]	@ 0x40
c0de1652:	0783      	lsls	r3, r0, #30
c0de1654:	985c      	ldr	r0, [sp, #368]	@ 0x170
c0de1656:	ea43 0690 	orr.w	r6, r3, r0, lsr #2
c0de165a:	9811      	ldr	r0, [sp, #68]	@ 0x44
c0de165c:	9653      	str	r6, [sp, #332]	@ 0x14c
c0de165e:	0083      	lsls	r3, r0, #2
c0de1660:	9848      	ldr	r0, [sp, #288]	@ 0x120
c0de1662:	ea43 7090 	orr.w	r0, r3, r0, lsr #30
c0de1666:	9012      	str	r0, [sp, #72]	@ 0x48
c0de1668:	ea26 0300 	bic.w	r3, r6, r0
c0de166c:	980f      	ldr	r0, [sp, #60]	@ 0x3c
c0de166e:	0246      	lsls	r6, r0, #9
c0de1670:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de1672:	920e      	str	r2, [sp, #56]	@ 0x38
c0de1674:	ea46 50d0 	orr.w	r0, r6, r0, lsr #23
c0de1678:	9e0c      	ldr	r6, [sp, #48]	@ 0x30
c0de167a:	4043      	eors	r3, r0
c0de167c:	9030      	str	r0, [sp, #192]	@ 0xc0
c0de167e:	ea88 0003 	eor.w	r0, r8, r3
c0de1682:	931d      	str	r3, [sp, #116]	@ 0x74
c0de1684:	9b47      	ldr	r3, [sp, #284]	@ 0x11c
c0de1686:	f8dd 80bc 	ldr.w	r8, [sp, #188]	@ 0xbc
c0de168a:	055b      	lsls	r3, r3, #21
c0de168c:	ea43 27d6 	orr.w	r7, r3, r6, lsr #11
c0de1690:	9e0a      	ldr	r6, [sp, #40]	@ 0x28
c0de1692:	ea4f 338b 	mov.w	r3, fp, lsl #14
c0de1696:	4693      	mov	fp, r2
c0de1698:	970d      	str	r7, [sp, #52]	@ 0x34
c0de169a:	ea43 4696 	orr.w	r6, r3, r6, lsr #18
c0de169e:	9b5b      	ldr	r3, [sp, #364]	@ 0x16c
c0de16a0:	962e      	str	r6, [sp, #184]	@ 0xb8
c0de16a2:	ea83 0308 	eor.w	r3, r3, r8
c0de16a6:	9351      	str	r3, [sp, #324]	@ 0x144
c0de16a8:	43b3      	bics	r3, r6
c0de16aa:	407b      	eors	r3, r7
c0de16ac:	9320      	str	r3, [sp, #128]	@ 0x80
c0de16ae:	4058      	eors	r0, r3
c0de16b0:	0623      	lsls	r3, r4, #24
c0de16b2:	9c5a      	ldr	r4, [sp, #360]	@ 0x168
c0de16b4:	ea43 2311 	orr.w	r3, r3, r1, lsr #8
c0de16b8:	ea4f 61ca 	mov.w	r1, sl, lsl #27
c0de16bc:	f8dd a02c 	ldr.w	sl, [sp, #44]	@ 0x2c
c0de16c0:	ea41 1154 	orr.w	r1, r1, r4, lsr #5
c0de16c4:	935b      	str	r3, [sp, #364]	@ 0x16c
c0de16c6:	9c2b      	ldr	r4, [sp, #172]	@ 0xac
c0de16c8:	9148      	str	r1, [sp, #288]	@ 0x120
c0de16ca:	4399      	bics	r1, r3
c0de16cc:	4051      	eors	r1, r2
c0de16ce:	4048      	eors	r0, r1
c0de16d0:	9125      	str	r1, [sp, #148]	@ 0x94
c0de16d2:	9928      	ldr	r1, [sp, #160]	@ 0xa0
c0de16d4:	904a      	str	r0, [sp, #296]	@ 0x128
c0de16d6:	0040      	lsls	r0, r0, #1
c0de16d8:	ea40 70dc 	orr.w	r0, r0, ip, lsr #31
c0de16dc:	f8dd c0a8 	ldr.w	ip, [sp, #168]	@ 0xa8
c0de16e0:	905c      	str	r0, [sp, #368]	@ 0x170
c0de16e2:	9849      	ldr	r0, [sp, #292]	@ 0x124
c0de16e4:	4041      	eors	r1, r0
c0de16e6:	9841      	ldr	r0, [sp, #260]	@ 0x104
c0de16e8:	915a      	str	r1, [sp, #360]	@ 0x168
c0de16ea:	ea80 000a 	eor.w	r0, r0, sl
c0de16ee:	9011      	str	r0, [sp, #68]	@ 0x44
c0de16f0:	02c0      	lsls	r0, r0, #11
c0de16f2:	ea40 5051 	orr.w	r0, r0, r1, lsr #21
c0de16f6:	9932      	ldr	r1, [sp, #200]	@ 0xc8
c0de16f8:	9049      	str	r0, [sp, #292]	@ 0x124
c0de16fa:	ea27 0000 	bic.w	r0, r7, r0
c0de16fe:	9f2d      	ldr	r7, [sp, #180]	@ 0xb4
c0de1700:	ea87 0201 	eor.w	r2, r7, r1
c0de1704:	9931      	ldr	r1, [sp, #196]	@ 0xc4
c0de1706:	9232      	str	r2, [sp, #200]	@ 0xc8
c0de1708:	4069      	eors	r1, r5
c0de170a:	9110      	str	r1, [sp, #64]	@ 0x40
c0de170c:	0309      	lsls	r1, r1, #12
c0de170e:	ea41 5112 	orr.w	r1, r1, r2, lsr #20
c0de1712:	ea81 0300 	eor.w	r3, r1, r0
c0de1716:	9840      	ldr	r0, [sp, #256]	@ 0x100
c0de1718:	9147      	str	r1, [sp, #284]	@ 0x11c
c0de171a:	9341      	str	r3, [sp, #260]	@ 0x104
c0de171c:	ea84 0100 	eor.w	r1, r4, r0
c0de1720:	9846      	ldr	r0, [sp, #280]	@ 0x118
c0de1722:	910f      	str	r1, [sp, #60]	@ 0x3c
c0de1724:	ea80 0008 	eor.w	r0, r0, r8
c0de1728:	900c      	str	r0, [sp, #48]	@ 0x30
c0de172a:	00c0      	lsls	r0, r0, #3
c0de172c:	ea40 7051 	orr.w	r0, r0, r1, lsr #29
c0de1730:	993c      	ldr	r1, [sp, #240]	@ 0xf0
c0de1732:	9046      	str	r0, [sp, #280]	@ 0x118
c0de1734:	ea21 0600 	bic.w	r6, r1, r0
c0de1738:	9939      	ldr	r1, [sp, #228]	@ 0xe4
c0de173a:	ea8e 0201 	eor.w	r2, lr, r1
c0de173e:	993b      	ldr	r1, [sp, #236]	@ 0xec
c0de1740:	9239      	str	r2, [sp, #228]	@ 0xe4
c0de1742:	ea8c 0001 	eor.w	r0, ip, r1
c0de1746:	0501      	lsls	r1, r0, #20
c0de1748:	903b      	str	r0, [sp, #236]	@ 0xec
c0de174a:	ea41 3112 	orr.w	r1, r1, r2, lsr #12
c0de174e:	ea81 0006 	eor.w	r0, r1, r6
c0de1752:	9142      	str	r1, [sp, #264]	@ 0x108
c0de1754:	9944      	ldr	r1, [sp, #272]	@ 0x110
c0de1756:	9e49      	ldr	r6, [sp, #292]	@ 0x124
c0de1758:	9022      	str	r0, [sp, #136]	@ 0x88
c0de175a:	4058      	eors	r0, r3
c0de175c:	ea85 0201 	eor.w	r2, r5, r1
c0de1760:	994b      	ldr	r1, [sp, #300]	@ 0x12c
c0de1762:	9219      	str	r2, [sp, #100]	@ 0x64
c0de1764:	4079      	eors	r1, r7
c0de1766:	9f2c      	ldr	r7, [sp, #176]	@ 0xb0
c0de1768:	9109      	str	r1, [sp, #36]	@ 0x24
c0de176a:	0289      	lsls	r1, r1, #10
c0de176c:	ea41 5192 	orr.w	r1, r1, r2, lsr #22
c0de1770:	9a3d      	ldr	r2, [sp, #244]	@ 0xf4
c0de1772:	914b      	str	r1, [sp, #300]	@ 0x12c
c0de1774:	ea2b 0101 	bic.w	r1, fp, r1
c0de1778:	ea88 0302 	eor.w	r3, r8, r2
c0de177c:	9a33      	ldr	r2, [sp, #204]	@ 0xcc
c0de177e:	9308      	str	r3, [sp, #32]
c0de1780:	4062      	eors	r2, r4
c0de1782:	9c28      	ldr	r4, [sp, #160]	@ 0xa0
c0de1784:	9233      	str	r2, [sp, #204]	@ 0xcc
c0de1786:	0112      	lsls	r2, r2, #4
c0de1788:	ea42 7213 	orr.w	r2, r2, r3, lsr #28
c0de178c:	9b13      	ldr	r3, [sp, #76]	@ 0x4c
c0de178e:	4051      	eors	r1, r2
c0de1790:	9244      	str	r2, [sp, #272]	@ 0x110
c0de1792:	913d      	str	r1, [sp, #244]	@ 0xf4
c0de1794:	4048      	eors	r0, r1
c0de1796:	994e      	ldr	r1, [sp, #312]	@ 0x138
c0de1798:	ea83 0201 	eor.w	r2, r3, r1
c0de179c:	9952      	ldr	r1, [sp, #328]	@ 0x148
c0de179e:	9206      	str	r2, [sp, #24]
c0de17a0:	4079      	eors	r1, r7
c0de17a2:	9105      	str	r1, [sp, #20]
c0de17a4:	0649      	lsls	r1, r1, #25
c0de17a6:	ea41 12d2 	orr.w	r2, r1, r2, lsr #7
c0de17aa:	993f      	ldr	r1, [sp, #252]	@ 0xfc
c0de17ac:	924e      	str	r2, [sp, #312]	@ 0x138
c0de17ae:	4391      	bics	r1, r2
c0de17b0:	9a37      	ldr	r2, [sp, #220]	@ 0xdc
c0de17b2:	ea8a 0502 	eor.w	r5, sl, r2
c0de17b6:	9a38      	ldr	r2, [sp, #224]	@ 0xe0
c0de17b8:	9537      	str	r5, [sp, #220]	@ 0xdc
c0de17ba:	4062      	eors	r2, r4
c0de17bc:	9228      	str	r2, [sp, #160]	@ 0xa0
c0de17be:	0192      	lsls	r2, r2, #6
c0de17c0:	ea42 6295 	orr.w	r2, r2, r5, lsr #26
c0de17c4:	9d28      	ldr	r5, [sp, #160]	@ 0xa0
c0de17c6:	4051      	eors	r1, r2
c0de17c8:	9252      	str	r2, [sp, #328]	@ 0x148
c0de17ca:	ea80 0201 	eor.w	r2, r0, r1
c0de17ce:	9855      	ldr	r0, [sp, #340]	@ 0x154
c0de17d0:	9140      	str	r1, [sp, #256]	@ 0x100
c0de17d2:	ea8c 0400 	eor.w	r4, ip, r0
c0de17d6:	9850      	ldr	r0, [sp, #320]	@ 0x140
c0de17d8:	940b      	str	r4, [sp, #44]	@ 0x2c
c0de17da:	ea80 000e 	eor.w	r0, r0, lr
c0de17de:	01c1      	lsls	r1, r0, #7
c0de17e0:	902a      	str	r0, [sp, #168]	@ 0xa8
c0de17e2:	9830      	ldr	r0, [sp, #192]	@ 0xc0
c0de17e4:	ea41 6154 	orr.w	r1, r1, r4, lsr #25
c0de17e8:	9c10      	ldr	r4, [sp, #64]	@ 0x40
c0de17ea:	9155      	str	r1, [sp, #340]	@ 0x154
c0de17ec:	4388      	bics	r0, r1
c0de17ee:	994c      	ldr	r1, [sp, #304]	@ 0x130
c0de17f0:	ea87 0e01 	eor.w	lr, r7, r1
c0de17f4:	9945      	ldr	r1, [sp, #276]	@ 0x114
c0de17f6:	9f33      	ldr	r7, [sp, #204]	@ 0xcc
c0de17f8:	ea83 0b01 	eor.w	fp, r3, r1
c0de17fc:	ea4f 5acb 	mov.w	sl, fp, lsl #23
c0de1800:	ea4a 215e 	orr.w	r1, sl, lr, lsr #9
c0de1804:	4048      	eors	r0, r1
c0de1806:	9150      	str	r1, [sp, #320]	@ 0x140
c0de1808:	995c      	ldr	r1, [sp, #368]	@ 0x170
c0de180a:	902c      	str	r0, [sp, #176]	@ 0xb0
c0de180c:	4050      	eors	r0, r2
c0de180e:	ea81 0200 	eor.w	r2, r1, r0
c0de1812:	902d      	str	r0, [sp, #180]	@ 0xb4
c0de1814:	982e      	ldr	r0, [sp, #184]	@ 0xb8
c0de1816:	990d      	ldr	r1, [sp, #52]	@ 0x34
c0de1818:	925c      	str	r2, [sp, #368]	@ 0x170
c0de181a:	4388      	bics	r0, r1
c0de181c:	9911      	ldr	r1, [sp, #68]	@ 0x44
c0de181e:	4070      	eors	r0, r6
c0de1820:	9e09      	ldr	r6, [sp, #36]	@ 0x24
c0de1822:	ea82 0a00 	eor.w	sl, r2, r0
c0de1826:	9031      	str	r0, [sp, #196]	@ 0xc4
c0de1828:	984d      	ldr	r0, [sp, #308]	@ 0x134
c0de182a:	9a4a      	ldr	r2, [sp, #296]	@ 0x128
c0de182c:	f8cd a034 	str.w	sl, [sp, #52]	@ 0x34
c0de1830:	0040      	lsls	r0, r0, #1
c0de1832:	ea40 70d2 	orr.w	r0, r0, r2, lsr #31
c0de1836:	9a32      	ldr	r2, [sp, #200]	@ 0xc8
c0de1838:	904c      	str	r0, [sp, #304]	@ 0x130
c0de183a:	985a      	ldr	r0, [sp, #360]	@ 0x168
c0de183c:	0312      	lsls	r2, r2, #12
c0de183e:	02c0      	lsls	r0, r0, #11
c0de1840:	ea42 5c14 	orr.w	ip, r2, r4, lsr #20
c0de1844:	9a0c      	ldr	r2, [sp, #48]	@ 0x30
c0de1846:	9c3b      	ldr	r4, [sp, #236]	@ 0xec
c0de1848:	ea40 5351 	orr.w	r3, r0, r1, lsr #21
c0de184c:	9918      	ldr	r1, [sp, #96]	@ 0x60
c0de184e:	f8cd c01c 	str.w	ip, [sp, #28]
c0de1852:	930a      	str	r3, [sp, #40]	@ 0x28
c0de1854:	ea21 0003 	bic.w	r0, r1, r3
c0de1858:	ea8c 0800 	eor.w	r8, ip, r0
c0de185c:	980f      	ldr	r0, [sp, #60]	@ 0x3c
c0de185e:	f8cd 80e0 	str.w	r8, [sp, #224]	@ 0xe0
c0de1862:	00c0      	lsls	r0, r0, #3
c0de1864:	ea40 7252 	orr.w	r2, r0, r2, lsr #29
c0de1868:	9843      	ldr	r0, [sp, #268]	@ 0x10c
c0de186a:	922f      	str	r2, [sp, #188]	@ 0xbc
c0de186c:	4390      	bics	r0, r2
c0de186e:	9a39      	ldr	r2, [sp, #228]	@ 0xe4
c0de1870:	0512      	lsls	r2, r2, #20
c0de1872:	ea42 3414 	orr.w	r4, r2, r4, lsr #12
c0de1876:	9a19      	ldr	r2, [sp, #100]	@ 0x64
c0de1878:	4060      	eors	r0, r4
c0de187a:	9404      	str	r4, [sp, #16]
c0de187c:	0292      	lsls	r2, r2, #10
c0de187e:	902b      	str	r0, [sp, #172]	@ 0xac
c0de1880:	ea80 0008 	eor.w	r0, r0, r8
c0de1884:	ea42 5696 	orr.w	r6, r2, r6, lsr #22
c0de1888:	9a59      	ldr	r2, [sp, #356]	@ 0x164
c0de188a:	9609      	str	r6, [sp, #36]	@ 0x24
c0de188c:	43b2      	bics	r2, r6
c0de188e:	9e08      	ldr	r6, [sp, #32]
c0de1890:	0136      	lsls	r6, r6, #4
c0de1892:	ea46 7717 	orr.w	r7, r6, r7, lsr #28
c0de1896:	9e05      	ldr	r6, [sp, #20]
c0de1898:	407a      	eors	r2, r7
c0de189a:	9701      	str	r7, [sp, #4]
c0de189c:	9245      	str	r2, [sp, #276]	@ 0x114
c0de189e:	4050      	eors	r0, r2
c0de18a0:	9a06      	ldr	r2, [sp, #24]
c0de18a2:	0652      	lsls	r2, r2, #25
c0de18a4:	ea42 16d6 	orr.w	r6, r2, r6, lsr #7
c0de18a8:	9a34      	ldr	r2, [sp, #208]	@ 0xd0
c0de18aa:	9633      	str	r6, [sp, #204]	@ 0xcc
c0de18ac:	43b2      	bics	r2, r6
c0de18ae:	9e37      	ldr	r6, [sp, #220]	@ 0xdc
c0de18b0:	01b6      	lsls	r6, r6, #6
c0de18b2:	ea46 6695 	orr.w	r6, r6, r5, lsr #26
c0de18b6:	4072      	eors	r2, r6
c0de18b8:	9603      	str	r6, [sp, #12]
c0de18ba:	ea80 0802 	eor.w	r8, r0, r2
c0de18be:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de18c0:	9219      	str	r2, [sp, #100]	@ 0x64
c0de18c2:	9a2a      	ldr	r2, [sp, #168]	@ 0xa8
c0de18c4:	01c0      	lsls	r0, r0, #7
c0de18c6:	ea40 6252 	orr.w	r2, r0, r2, lsr #25
c0de18ca:	9836      	ldr	r0, [sp, #216]	@ 0xd8
c0de18cc:	9208      	str	r2, [sp, #32]
c0de18ce:	ea20 0502 	bic.w	r5, r0, r2
c0de18d2:	ea4f 50ce 	mov.w	r0, lr, lsl #23
c0de18d6:	ea40 225b 	orr.w	r2, r0, fp, lsr #9
c0de18da:	f8dd b070 	ldr.w	fp, [sp, #112]	@ 0x70
c0de18de:	ea85 0002 	eor.w	r0, r5, r2
c0de18e2:	9d1e      	ldr	r5, [sp, #120]	@ 0x78
c0de18e4:	4696      	mov	lr, r2
c0de18e6:	e9cd 200b 	strd	r2, r0, [sp, #44]	@ 0x2c
c0de18ea:	9a4c      	ldr	r2, [sp, #304]	@ 0x130
c0de18ec:	ea80 0008 	eor.w	r0, r0, r8
c0de18f0:	f8dd 8054 	ldr.w	r8, [sp, #84]	@ 0x54
c0de18f4:	ea25 0101 	bic.w	r1, r5, r1
c0de18f8:	9010      	str	r0, [sp, #64]	@ 0x40
c0de18fa:	4050      	eors	r0, r2
c0de18fc:	4059      	eors	r1, r3
c0de18fe:	905a      	str	r0, [sp, #360]	@ 0x168
c0de1900:	4048      	eors	r0, r1
c0de1902:	9105      	str	r1, [sp, #20]
c0de1904:	9912      	ldr	r1, [sp, #72]	@ 0x48
c0de1906:	0782      	lsls	r2, r0, #30
c0de1908:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de190a:	ea42 009a 	orr.w	r0, r2, sl, lsr #2
c0de190e:	9a4f      	ldr	r2, [sp, #316]	@ 0x13c
c0de1910:	f8dd a068 	ldr.w	sl, [sp, #104]	@ 0x68
c0de1914:	904c      	str	r0, [sp, #304]	@ 0x130
c0de1916:	983e      	ldr	r0, [sp, #248]	@ 0xf8
c0de1918:	ea2e 0202 	bic.w	r2, lr, r2
c0de191c:	ea80 0302 	eor.w	r3, r0, r2
c0de1920:	9a56      	ldr	r2, [sp, #344]	@ 0x158
c0de1922:	9329      	str	r3, [sp, #164]	@ 0xa4
c0de1924:	ea2c 0202 	bic.w	r2, ip, r2
c0de1928:	ea85 0002 	eor.w	r0, r5, r2
c0de192c:	9d47      	ldr	r5, [sp, #284]	@ 0x11c
c0de192e:	ea80 0203 	eor.w	r2, r0, r3
c0de1932:	9b57      	ldr	r3, [sp, #348]	@ 0x15c
c0de1934:	9013      	str	r0, [sp, #76]	@ 0x4c
c0de1936:	ea26 0303 	bic.w	r3, r6, r3
c0de193a:	9e44      	ldr	r6, [sp, #272]	@ 0x110
c0de193c:	ea83 000b 	eor.w	r0, r3, fp
c0de1940:	9b3a      	ldr	r3, [sp, #232]	@ 0xe8
c0de1942:	902a      	str	r0, [sp, #168]	@ 0xa8
c0de1944:	4042      	eors	r2, r0
c0de1946:	9835      	ldr	r0, [sp, #212]	@ 0xd4
c0de1948:	ea24 0303 	bic.w	r3, r4, r3
c0de194c:	9c14      	ldr	r4, [sp, #80]	@ 0x50
c0de194e:	ea83 030a 	eor.w	r3, r3, sl
c0de1952:	933b      	str	r3, [sp, #236]	@ 0xec
c0de1954:	405a      	eors	r2, r3
c0de1956:	ea27 0300 	bic.w	r3, r7, r0
c0de195a:	9850      	ldr	r0, [sp, #320]	@ 0x140
c0de195c:	ea83 0308 	eor.w	r3, r3, r8
c0de1960:	ea82 0c03 	eor.w	ip, r2, r3
c0de1964:	9a53      	ldr	r2, [sp, #332]	@ 0x14c
c0de1966:	9332      	str	r3, [sp, #200]	@ 0xc8
c0de1968:	4667      	mov	r7, ip
c0de196a:	f8cd c018 	str.w	ip, [sp, #24]
c0de196e:	ea20 0202 	bic.w	r2, r0, r2
c0de1972:	982e      	ldr	r0, [sp, #184]	@ 0xb8
c0de1974:	ea81 0302 	eor.w	r3, r1, r2
c0de1978:	9a51      	ldr	r2, [sp, #324]	@ 0x144
c0de197a:	931e      	str	r3, [sp, #120]	@ 0x78
c0de197c:	ea25 0202 	bic.w	r2, r5, r2
c0de1980:	9d42      	ldr	r5, [sp, #264]	@ 0x108
c0de1982:	4050      	eors	r0, r2
c0de1984:	ea80 0203 	eor.w	r2, r0, r3
c0de1988:	9011      	str	r0, [sp, #68]	@ 0x44
c0de198a:	9b54      	ldr	r3, [sp, #336]	@ 0x150
c0de198c:	9852      	ldr	r0, [sp, #328]	@ 0x148
c0de198e:	ea20 0303 	bic.w	r3, r0, r3
c0de1992:	4063      	eors	r3, r4
c0de1994:	932e      	str	r3, [sp, #184]	@ 0xb8
c0de1996:	405a      	eors	r2, r3
c0de1998:	9b58      	ldr	r3, [sp, #352]	@ 0x160
c0de199a:	ea25 0303 	bic.w	r3, r5, r3
c0de199e:	9d16      	ldr	r5, [sp, #88]	@ 0x58
c0de19a0:	406b      	eors	r3, r5
c0de19a2:	9339      	str	r3, [sp, #228]	@ 0xe4
c0de19a4:	405a      	eors	r2, r3
c0de19a6:	9b48      	ldr	r3, [sp, #288]	@ 0x120
c0de19a8:	ea26 0303 	bic.w	r3, r6, r3
c0de19ac:	9e5b      	ldr	r6, [sp, #364]	@ 0x16c
c0de19ae:	4073      	eors	r3, r6
c0de19b0:	ea82 0003 	eor.w	r0, r2, r3
c0de19b4:	9318      	str	r3, [sp, #96]	@ 0x60
c0de19b6:	9b3c      	ldr	r3, [sp, #240]	@ 0xf0
c0de19b8:	0042      	lsls	r2, r0, #1
c0de19ba:	9002      	str	r0, [sp, #8]
c0de19bc:	ea25 0303 	bic.w	r3, r5, r3
c0de19c0:	9d46      	ldr	r5, [sp, #280]	@ 0x118
c0de19c2:	ea42 72dc 	orr.w	r2, r2, ip, lsr #31
c0de19c6:	f8dd c12c 	ldr.w	ip, [sp, #300]	@ 0x12c
c0de19ca:	405d      	eors	r5, r3
c0de19cc:	9b0e      	ldr	r3, [sp, #56]	@ 0x38
c0de19ce:	9516      	str	r5, [sp, #88]	@ 0x58
c0de19d0:	ea26 0303 	bic.w	r3, r6, r3
c0de19d4:	9e09      	ldr	r6, [sp, #36]	@ 0x24
c0de19d6:	ea83 030c 	eor.w	r3, r3, ip
c0de19da:	933c      	str	r3, [sp, #240]	@ 0xf0
c0de19dc:	406b      	eors	r3, r5
c0de19de:	9d30      	ldr	r5, [sp, #192]	@ 0xc0
c0de19e0:	ea21 0505 	bic.w	r5, r1, r5
c0de19e4:	9955      	ldr	r1, [sp, #340]	@ 0x154
c0de19e6:	404d      	eors	r5, r1
c0de19e8:	9931      	ldr	r1, [sp, #196]	@ 0xc4
c0de19ea:	406b      	eors	r3, r5
c0de19ec:	9537      	str	r5, [sp, #220]	@ 0xdc
c0de19ee:	9d3f      	ldr	r5, [sp, #252]	@ 0xfc
c0de19f0:	404b      	eors	r3, r1
c0de19f2:	994e      	ldr	r1, [sp, #312]	@ 0x138
c0de19f4:	ea24 0505 	bic.w	r5, r4, r5
c0de19f8:	9c08      	ldr	r4, [sp, #32]
c0de19fa:	404d      	eors	r5, r1
c0de19fc:	ea83 0e05 	eor.w	lr, r3, r5
c0de1a00:	9b17      	ldr	r3, [sp, #92]	@ 0x5c
c0de1a02:	9528      	str	r5, [sp, #160]	@ 0xa0
c0de1a04:	9d2f      	ldr	r5, [sp, #188]	@ 0xbc
c0de1a06:	ea82 020e 	eor.w	r2, r2, lr
c0de1a0a:	ea82 0c03 	eor.w	ip, r2, r3
c0de1a0e:	9b59      	ldr	r3, [sp, #356]	@ 0x164
c0de1a10:	925b      	str	r2, [sp, #364]	@ 0x16c
c0de1a12:	007a      	lsls	r2, r7, #1
c0de1a14:	ea42 72d0 	orr.w	r2, r2, r0, lsr #31
c0de1a18:	ea28 0303 	bic.w	r3, r8, r3
c0de1a1c:	ea86 0103 	eor.w	r1, r6, r3
c0de1a20:	9b43      	ldr	r3, [sp, #268]	@ 0x10c
c0de1a22:	913f      	str	r1, [sp, #252]	@ 0xfc
c0de1a24:	ea2a 0303 	bic.w	r3, sl, r3
c0de1a28:	f8dd a130 	ldr.w	sl, [sp, #304]	@ 0x130
c0de1a2c:	ea83 0005 	eor.w	r0, r3, r5
c0de1a30:	ea80 0301 	eor.w	r3, r0, r1
c0de1a34:	9015      	str	r0, [sp, #84]	@ 0x54
c0de1a36:	9836      	ldr	r0, [sp, #216]	@ 0xd8
c0de1a38:	993e      	ldr	r1, [sp, #248]	@ 0xf8
c0de1a3a:	ea21 0700 	bic.w	r7, r1, r0
c0de1a3e:	9805      	ldr	r0, [sp, #20]
c0de1a40:	ea84 0107 	eor.w	r1, r4, r7
c0de1a44:	9f33      	ldr	r7, [sp, #204]	@ 0xcc
c0de1a46:	404b      	eors	r3, r1
c0de1a48:	9131      	str	r1, [sp, #196]	@ 0xc4
c0de1a4a:	ea83 0100 	eor.w	r1, r3, r0
c0de1a4e:	9b34      	ldr	r3, [sp, #208]	@ 0xd0
c0de1a50:	ea2b 0303 	bic.w	r3, fp, r3
c0de1a54:	407b      	eors	r3, r7
c0de1a56:	ea81 0b03 	eor.w	fp, r1, r3
c0de1a5a:	931c      	str	r3, [sp, #112]	@ 0x70
c0de1a5c:	9957      	ldr	r1, [sp, #348]	@ 0x15c
c0de1a5e:	ea82 000b 	eor.w	r0, r2, fp
c0de1a62:	9a1b      	ldr	r2, [sp, #108]	@ 0x6c
c0de1a64:	9059      	str	r0, [sp, #356]	@ 0x164
c0de1a66:	ea80 0802 	eor.w	r8, r0, r2
c0de1a6a:	ea4f 52c8 	mov.w	r2, r8, lsl #23
c0de1a6e:	ea42 205c 	orr.w	r0, r2, ip, lsr #9
c0de1a72:	ea4f 024b 	mov.w	r2, fp, lsl #1
c0de1a76:	9036      	str	r0, [sp, #216]	@ 0xd8
c0de1a78:	ea20 000a 	bic.w	r0, r0, sl
c0de1a7c:	ea42 72de 	orr.w	r2, r2, lr, lsr #31
c0de1a80:	9034      	str	r0, [sp, #208]	@ 0xd0
c0de1a82:	9803      	ldr	r0, [sp, #12]
c0de1a84:	ea27 0300 	bic.w	r3, r7, r0
c0de1a88:	9801      	ldr	r0, [sp, #4]
c0de1a8a:	4059      	eors	r1, r3
c0de1a8c:	ea26 0300 	bic.w	r3, r6, r0
c0de1a90:	9835      	ldr	r0, [sp, #212]	@ 0xd4
c0de1a92:	9133      	str	r1, [sp, #204]	@ 0xcc
c0de1a94:	4058      	eors	r0, r3
c0de1a96:	9b07      	ldr	r3, [sp, #28]
c0de1a98:	ea80 0601 	eor.w	r6, r0, r1
c0de1a9c:	9043      	str	r0, [sp, #268]	@ 0x10c
c0de1a9e:	9804      	ldr	r0, [sp, #16]
c0de1aa0:	993a      	ldr	r1, [sp, #232]	@ 0xe8
c0de1aa2:	ea25 0700 	bic.w	r7, r5, r0
c0de1aa6:	ea87 0001 	eor.w	r0, r7, r1
c0de1aaa:	994f      	ldr	r1, [sp, #316]	@ 0x13c
c0de1aac:	903e      	str	r0, [sp, #248]	@ 0xf8
c0de1aae:	4046      	eors	r6, r0
c0de1ab0:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de1ab2:	ea24 0000 	bic.w	r0, r4, r0
c0de1ab6:	4048      	eors	r0, r1
c0de1ab8:	990a      	ldr	r1, [sp, #40]	@ 0x28
c0de1aba:	9014      	str	r0, [sp, #80]	@ 0x50
c0de1abc:	4070      	eors	r0, r6
c0de1abe:	ea21 0403 	bic.w	r4, r1, r3
c0de1ac2:	9956      	ldr	r1, [sp, #344]	@ 0x158
c0de1ac4:	9b44      	ldr	r3, [sp, #272]	@ 0x110
c0de1ac6:	404c      	eors	r4, r1
c0de1ac8:	995d      	ldr	r1, [sp, #372]	@ 0x174
c0de1aca:	e951 6702 	ldrd	r6, r7, [r1, #-8]
c0de1ace:	ea84 0106 	eor.w	r1, r4, r6
c0de1ad2:	9e10      	ldr	r6, [sp, #64]	@ 0x40
c0de1ad4:	4048      	eors	r0, r1
c0de1ad6:	911b      	str	r1, [sp, #108]	@ 0x6c
c0de1ad8:	990c      	ldr	r1, [sp, #48]	@ 0x30
c0de1ada:	904f      	str	r0, [sp, #316]	@ 0x13c
c0de1adc:	4050      	eors	r0, r2
c0de1ade:	ea4f 024e 	mov.w	r2, lr, lsl #1
c0de1ae2:	f8dd e0b4 	ldr.w	lr, [sp, #180]	@ 0xb4
c0de1ae6:	ea42 74db 	orr.w	r4, r2, fp, lsr #31
c0de1aea:	902f      	str	r0, [sp, #188]	@ 0xbc
c0de1aec:	4041      	eors	r1, r0
c0de1aee:	9852      	ldr	r0, [sp, #328]	@ 0x148
c0de1af0:	9a4e      	ldr	r2, [sp, #312]	@ 0x138
c0de1af2:	4382      	bics	r2, r0
c0de1af4:	9854      	ldr	r0, [sp, #336]	@ 0x150
c0de1af6:	4050      	eors	r0, r2
c0de1af8:	9a4b      	ldr	r2, [sp, #300]	@ 0x12c
c0de1afa:	9017      	str	r0, [sp, #92]	@ 0x5c
c0de1afc:	439a      	bics	r2, r3
c0de1afe:	9b48      	ldr	r3, [sp, #288]	@ 0x120
c0de1b00:	ea83 0b02 	eor.w	fp, r3, r2
c0de1b04:	9b42      	ldr	r3, [sp, #264]	@ 0x108
c0de1b06:	ea8b 0200 	eor.w	r2, fp, r0
c0de1b0a:	9846      	ldr	r0, [sp, #280]	@ 0x118
c0de1b0c:	ea20 0503 	bic.w	r5, r0, r3
c0de1b10:	9858      	ldr	r0, [sp, #352]	@ 0x160
c0de1b12:	9b50      	ldr	r3, [sp, #320]	@ 0x140
c0de1b14:	4068      	eors	r0, r5
c0de1b16:	9052      	str	r0, [sp, #328]	@ 0x148
c0de1b18:	4042      	eors	r2, r0
c0de1b1a:	9855      	ldr	r0, [sp, #340]	@ 0x154
c0de1b1c:	ea20 0503 	bic.w	r5, r0, r3
c0de1b20:	9853      	ldr	r0, [sp, #332]	@ 0x14c
c0de1b22:	9b47      	ldr	r3, [sp, #284]	@ 0x11c
c0de1b24:	4068      	eors	r0, r5
c0de1b26:	9055      	str	r0, [sp, #340]	@ 0x154
c0de1b28:	4042      	eors	r2, r0
c0de1b2a:	9849      	ldr	r0, [sp, #292]	@ 0x124
c0de1b2c:	ea20 0503 	bic.w	r5, r0, r3
c0de1b30:	9851      	ldr	r0, [sp, #324]	@ 0x144
c0de1b32:	9b2c      	ldr	r3, [sp, #176]	@ 0xb0
c0de1b34:	4045      	eors	r5, r0
c0de1b36:	ea85 0007 	eor.w	r0, r5, r7
c0de1b3a:	4042      	eors	r2, r0
c0de1b3c:	901a      	str	r0, [sp, #104]	@ 0x68
c0de1b3e:	ea82 0004 	eor.w	r0, r2, r4
c0de1b42:	ea80 0703 	eor.w	r7, r0, r3
c0de1b46:	9b34      	ldr	r3, [sp, #208]	@ 0xd0
c0de1b48:	9057      	str	r0, [sp, #348]	@ 0x15c
c0de1b4a:	00bc      	lsls	r4, r7, #2
c0de1b4c:	ea44 7091 	orr.w	r0, r4, r1, lsr #30
c0de1b50:	ea4f 54cc 	mov.w	r4, ip, lsl #23
c0de1b54:	0089      	lsls	r1, r1, #2
c0de1b56:	4043      	eors	r3, r0
c0de1b58:	ea44 2858 	orr.w	r8, r4, r8, lsr #9
c0de1b5c:	ea41 7797 	orr.w	r7, r1, r7, lsr #30
c0de1b60:	9356      	str	r3, [sp, #344]	@ 0x158
c0de1b62:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
c0de1b64:	079d      	lsls	r5, r3, #30
c0de1b66:	9b0f      	ldr	r3, [sp, #60]	@ 0x3c
c0de1b68:	ea45 0c93 	orr.w	ip, r5, r3, lsr #2
c0de1b6c:	9b02      	ldr	r3, [sp, #8]
c0de1b6e:	9d06      	ldr	r5, [sp, #24]
c0de1b70:	ea28 040c 	bic.w	r4, r8, ip
c0de1b74:	ea87 0104 	eor.w	r1, r7, r4
c0de1b78:	ea4f 044e 	mov.w	r4, lr, lsl #1
c0de1b7c:	ea44 74d6 	orr.w	r4, r4, r6, lsr #31
c0de1b80:	9153      	str	r1, [sp, #332]	@ 0x14c
c0de1b82:	ea2a 0100 	bic.w	r1, sl, r0
c0de1b86:	ea83 0a04 	eor.w	sl, r3, r4
c0de1b8a:	0073      	lsls	r3, r6, #1
c0de1b8c:	ea43 73de 	orr.w	r3, r3, lr, lsr #31
c0de1b90:	ea8a 040b 	eor.w	r4, sl, fp
c0de1b94:	f8cd a0c0 	str.w	sl, [sp, #192]	@ 0xc0
c0de1b98:	ea85 0b03 	eor.w	fp, r5, r3
c0de1b9c:	9b43      	ldr	r3, [sp, #268]	@ 0x10c
c0de1b9e:	9d4f      	ldr	r5, [sp, #316]	@ 0x13c
c0de1ba0:	f8cd b160 	str.w	fp, [sp, #352]	@ 0x160
c0de1ba4:	ea83 030b 	eor.w	r3, r3, fp
c0de1ba8:	025e      	lsls	r6, r3, #9
c0de1baa:	ea46 56d4 	orr.w	r6, r6, r4, lsr #23
c0de1bae:	0264      	lsls	r4, r4, #9
c0de1bb0:	4071      	eors	r1, r6
c0de1bb2:	ea44 53d3 	orr.w	r3, r4, r3, lsr #23
c0de1bb6:	ea20 0406 	bic.w	r4, r0, r6
c0de1bba:	0050      	lsls	r0, r2, #1
c0de1bbc:	9154      	str	r1, [sp, #336]	@ 0x150
c0de1bbe:	ea2c 0107 	bic.w	r1, ip, r7
c0de1bc2:	ea40 70d5 	orr.w	r0, r0, r5, lsr #31
c0de1bc6:	4059      	eors	r1, r3
c0de1bc8:	9151      	str	r1, [sp, #324]	@ 0x144
c0de1bca:	994a      	ldr	r1, [sp, #296]	@ 0x128
c0de1bcc:	ea80 0e01 	eor.w	lr, r0, r1
c0de1bd0:	0068      	lsls	r0, r5, #1
c0de1bd2:	992e      	ldr	r1, [sp, #184]	@ 0xb8
c0de1bd4:	ea40 70d2 	orr.w	r0, r0, r2, lsr #31
c0de1bd8:	9a4d      	ldr	r2, [sp, #308]	@ 0x134
c0de1bda:	f8cd e0b4 	str.w	lr, [sp, #180]	@ 0xb4
c0de1bde:	ea81 010e 	eor.w	r1, r1, lr
c0de1be2:	4050      	eors	r0, r2
c0de1be4:	9a2a      	ldr	r2, [sp, #168]	@ 0xa8
c0de1be6:	4605      	mov	r5, r0
c0de1be8:	902e      	str	r0, [sp, #184]	@ 0xb8
c0de1bea:	4042      	eors	r2, r0
c0de1bec:	01d0      	lsls	r0, r2, #7
c0de1bee:	ea40 6051 	orr.w	r0, r0, r1, lsr #25
c0de1bf2:	01c9      	lsls	r1, r1, #7
c0de1bf4:	4044      	eors	r4, r0
c0de1bf6:	ea41 6152 	orr.w	r1, r1, r2, lsr #25
c0de1bfa:	944d      	str	r4, [sp, #308]	@ 0x134
c0de1bfc:	ea27 0403 	bic.w	r4, r7, r3
c0de1c00:	ea81 0204 	eor.w	r2, r1, r4
c0de1c04:	9c36      	ldr	r4, [sp, #216]	@ 0xd8
c0de1c06:	9243      	str	r2, [sp, #268]	@ 0x10c
c0de1c08:	ea26 0200 	bic.w	r2, r6, r0
c0de1c0c:	4062      	eors	r2, r4
c0de1c0e:	43a0      	bics	r0, r4
c0de1c10:	9c5b      	ldr	r4, [sp, #364]	@ 0x16c
c0de1c12:	924f      	str	r2, [sp, #316]	@ 0x13c
c0de1c14:	ea23 0201 	bic.w	r2, r3, r1
c0de1c18:	ea82 0208 	eor.w	r2, r2, r8
c0de1c1c:	9248      	str	r2, [sp, #288]	@ 0x120
c0de1c1e:	9a4c      	ldr	r2, [sp, #304]	@ 0x130
c0de1c20:	4050      	eors	r0, r2
c0de1c22:	902c      	str	r0, [sp, #176]	@ 0xb0
c0de1c24:	ea21 0008 	bic.w	r0, r1, r8
c0de1c28:	9911      	ldr	r1, [sp, #68]	@ 0x44
c0de1c2a:	f8dd 8170 	ldr.w	r8, [sp, #368]	@ 0x170
c0de1c2e:	ea80 000c 	eor.w	r0, r0, ip
c0de1c32:	902a      	str	r0, [sp, #168]	@ 0xa8
c0de1c34:	9813      	ldr	r0, [sp, #76]	@ 0x4c
c0de1c36:	ea8e 0c01 	eor.w	ip, lr, r1
c0de1c3a:	f8dd e168 	ldr.w	lr, [sp, #360]	@ 0x168
c0de1c3e:	ea4f 62cc 	mov.w	r2, ip, lsl #27
c0de1c42:	4068      	eors	r0, r5
c0de1c44:	ea42 1350 	orr.w	r3, r2, r0, lsr #5
c0de1c48:	9a52      	ldr	r2, [sp, #328]	@ 0x148
c0de1c4a:	06c0      	lsls	r0, r0, #27
c0de1c4c:	461d      	mov	r5, r3
c0de1c4e:	9350      	str	r3, [sp, #320]	@ 0x140
c0de1c50:	ea8a 0102 	eor.w	r1, sl, r2
c0de1c54:	9a3e      	ldr	r2, [sp, #248]	@ 0xf8
c0de1c56:	ea40 1a5c 	orr.w	sl, r0, ip, lsr #5
c0de1c5a:	0108      	lsls	r0, r1, #4
c0de1c5c:	ea8b 0602 	eor.w	r6, fp, r2
c0de1c60:	0132      	lsls	r2, r6, #4
c0de1c62:	ea40 7c16 	orr.w	ip, r0, r6, lsr #28
c0de1c66:	ea42 7211 	orr.w	r2, r2, r1, lsr #28
c0de1c6a:	ea2c 000a 	bic.w	r0, ip, sl
c0de1c6e:	9252      	str	r2, [sp, #328]	@ 0x148
c0de1c70:	439a      	bics	r2, r3
c0de1c72:	9b1d      	ldr	r3, [sp, #116]	@ 0x74
c0de1c74:	ea84 0703 	eor.w	r7, r4, r3
c0de1c78:	9b1f      	ldr	r3, [sp, #124]	@ 0x7c
c0de1c7a:	9c59      	ldr	r4, [sp, #356]	@ 0x164
c0de1c7c:	0639      	lsls	r1, r7, #24
c0de1c7e:	405c      	eors	r4, r3
c0de1c80:	0623      	lsls	r3, r4, #24
c0de1c82:	ea41 2114 	orr.w	r1, r1, r4, lsr #8
c0de1c86:	ea43 2317 	orr.w	r3, r3, r7, lsr #8
c0de1c8a:	4048      	eors	r0, r1
c0de1c8c:	405a      	eors	r2, r3
c0de1c8e:	9034      	str	r0, [sp, #208]	@ 0xd0
c0de1c90:	ea25 0003 	bic.w	r0, r5, r3
c0de1c94:	9d2f      	ldr	r5, [sp, #188]	@ 0xbc
c0de1c96:	923a      	str	r2, [sp, #232]	@ 0xe8
c0de1c98:	9a3f      	ldr	r2, [sp, #252]	@ 0xfc
c0de1c9a:	ea8e 0402 	eor.w	r4, lr, r2
c0de1c9e:	9a3c      	ldr	r2, [sp, #240]	@ 0xf0
c0de1ca0:	ea88 0602 	eor.w	r6, r8, r2
c0de1ca4:	9a19      	ldr	r2, [sp, #100]	@ 0x64
c0de1ca6:	03f7      	lsls	r7, r6, #15
c0de1ca8:	ea47 4754 	orr.w	r7, r7, r4, lsr #17
c0de1cac:	03e4      	lsls	r4, r4, #15
c0de1cae:	4078      	eors	r0, r7
c0de1cb0:	ea44 4456 	orr.w	r4, r4, r6, lsr #17
c0de1cb4:	9e40      	ldr	r6, [sp, #256]	@ 0x100
c0de1cb6:	9047      	str	r0, [sp, #284]	@ 0x11c
c0de1cb8:	ea2a 0001 	bic.w	r0, sl, r1
c0de1cbc:	4060      	eors	r0, r4
c0de1cbe:	903f      	str	r0, [sp, #252]	@ 0xfc
c0de1cc0:	ea23 0007 	bic.w	r0, r3, r7
c0de1cc4:	ea85 0302 	eor.w	r3, r5, r2
c0de1cc8:	9a57      	ldr	r2, [sp, #348]	@ 0x15c
c0de1cca:	4056      	eors	r6, r2
c0de1ccc:	ea4f 2b86 	mov.w	fp, r6, lsl #10
c0de1cd0:	ea4b 5b93 	orr.w	fp, fp, r3, lsr #22
c0de1cd4:	ea80 000b 	eor.w	r0, r0, fp
c0de1cd8:	904a      	str	r0, [sp, #296]	@ 0x128
c0de1cda:	ea21 0004 	bic.w	r0, r1, r4
c0de1cde:	0299      	lsls	r1, r3, #10
c0de1ce0:	9b52      	ldr	r3, [sp, #328]	@ 0x148
c0de1ce2:	ea41 5196 	orr.w	r1, r1, r6, lsr #22
c0de1ce6:	4048      	eors	r0, r1
c0de1ce8:	9042      	str	r0, [sp, #264]	@ 0x108
c0de1cea:	ea27 000b 	bic.w	r0, r7, fp
c0de1cee:	4058      	eors	r0, r3
c0de1cf0:	903e      	str	r0, [sp, #248]	@ 0xf8
c0de1cf2:	ea24 0001 	bic.w	r0, r4, r1
c0de1cf6:	9c14      	ldr	r4, [sp, #80]	@ 0x50
c0de1cf8:	ea80 000c 	eor.w	r0, r0, ip
c0de1cfc:	9036      	str	r0, [sp, #216]	@ 0xd8
c0de1cfe:	ea2b 0003 	bic.w	r0, fp, r3
c0de1d02:	9b50      	ldr	r3, [sp, #320]	@ 0x140
c0de1d04:	f8dd b16c 	ldr.w	fp, [sp, #364]	@ 0x16c
c0de1d08:	4058      	eors	r0, r3
c0de1d0a:	9b58      	ldr	r3, [sp, #352]	@ 0x160
c0de1d0c:	903c      	str	r0, [sp, #240]	@ 0xf0
c0de1d0e:	ea21 000c 	bic.w	r0, r1, ip
c0de1d12:	9941      	ldr	r1, [sp, #260]	@ 0x104
c0de1d14:	ea80 000a 	eor.w	r0, r0, sl
c0de1d18:	ea83 0704 	eor.w	r7, r3, r4
c0de1d1c:	9b30      	ldr	r3, [sp, #192]	@ 0xc0
c0de1d1e:	9c55      	ldr	r4, [sp, #340]	@ 0x154
c0de1d20:	9035      	str	r0, [sp, #212]	@ 0xd4
c0de1d22:	9838      	ldr	r0, [sp, #224]	@ 0xe0
c0de1d24:	ea82 0c01 	eor.w	ip, r2, r1
c0de1d28:	ea4f 024c 	mov.w	r2, ip, lsl #1
c0de1d2c:	4063      	eors	r3, r4
c0de1d2e:	4068      	eors	r0, r5
c0de1d30:	049c      	lsls	r4, r3, #18
c0de1d32:	ea42 75d0 	orr.w	r5, r2, r0, lsr #31
c0de1d36:	9a15      	ldr	r2, [sp, #84]	@ 0x54
c0de1d38:	ea44 3497 	orr.w	r4, r4, r7, lsr #14
c0de1d3c:	0040      	lsls	r0, r0, #1
c0de1d3e:	ea40 7adc 	orr.w	sl, r0, ip, lsr #31
c0de1d42:	f8dd c0b8 	ldr.w	ip, [sp, #184]	@ 0xb8
c0de1d46:	9546      	str	r5, [sp, #280]	@ 0x118
c0de1d48:	ea8e 0102 	eor.w	r1, lr, r2
c0de1d4c:	9a16      	ldr	r2, [sp, #88]	@ 0x58
c0de1d4e:	0188      	lsls	r0, r1, #6
c0de1d50:	ea88 0602 	eor.w	r6, r8, r2
c0de1d54:	f8dd 80b4 	ldr.w	r8, [sp, #180]	@ 0xb4
c0de1d58:	01b2      	lsls	r2, r6, #6
c0de1d5a:	ea40 6e96 	orr.w	lr, r0, r6, lsr #26
c0de1d5e:	ea42 6291 	orr.w	r2, r2, r1, lsr #26
c0de1d62:	04b9      	lsls	r1, r7, #18
c0de1d64:	ea2e 000a 	bic.w	r0, lr, sl
c0de1d68:	924c      	str	r2, [sp, #304]	@ 0x130
c0de1d6a:	43aa      	bics	r2, r5
c0de1d6c:	ea41 3193 	orr.w	r1, r1, r3, lsr #14
c0de1d70:	4062      	eors	r2, r4
c0de1d72:	4048      	eors	r0, r1
c0de1d74:	9255      	str	r2, [sp, #340]	@ 0x154
c0de1d76:	9a32      	ldr	r2, [sp, #200]	@ 0xc8
c0de1d78:	9050      	str	r0, [sp, #320]	@ 0x140
c0de1d7a:	ea25 0004 	bic.w	r0, r5, r4
c0de1d7e:	9d59      	ldr	r5, [sp, #356]	@ 0x164
c0de1d80:	ea8c 0302 	eor.w	r3, ip, r2
c0de1d84:	9a18      	ldr	r2, [sp, #96]	@ 0x60
c0de1d86:	ea88 0602 	eor.w	r6, r8, r2
c0de1d8a:	0237      	lsls	r7, r6, #8
c0de1d8c:	ea47 6713 	orr.w	r7, r7, r3, lsr #24
c0de1d90:	021b      	lsls	r3, r3, #8
c0de1d92:	4078      	eors	r0, r7
c0de1d94:	ea43 6316 	orr.w	r3, r3, r6, lsr #24
c0de1d98:	ea24 0207 	bic.w	r2, r4, r7
c0de1d9c:	9052      	str	r0, [sp, #328]	@ 0x148
c0de1d9e:	ea2a 0001 	bic.w	r0, sl, r1
c0de1da2:	4399      	bics	r1, r3
c0de1da4:	4058      	eors	r0, r3
c0de1da6:	904e      	str	r0, [sp, #312]	@ 0x138
c0de1da8:	9824      	ldr	r0, [sp, #144]	@ 0x90
c0de1daa:	ea85 0400 	eor.w	r4, r5, r0
c0de1dae:	9821      	ldr	r0, [sp, #132]	@ 0x84
c0de1db0:	ea8b 0600 	eor.w	r6, fp, r0
c0de1db4:	0670      	lsls	r0, r6, #25
c0de1db6:	ea40 10d4 	orr.w	r0, r0, r4, lsr #7
c0de1dba:	0664      	lsls	r4, r4, #25
c0de1dbc:	4042      	eors	r2, r0
c0de1dbe:	ea44 14d6 	orr.w	r4, r4, r6, lsr #7
c0de1dc2:	9249      	str	r2, [sp, #292]	@ 0x124
c0de1dc4:	4061      	eors	r1, r4
c0de1dc6:	9a4c      	ldr	r2, [sp, #304]	@ 0x130
c0de1dc8:	9141      	str	r1, [sp, #260]	@ 0x104
c0de1dca:	ea27 0100 	bic.w	r1, r7, r0
c0de1dce:	4051      	eors	r1, r2
c0de1dd0:	4390      	bics	r0, r2
c0de1dd2:	914b      	str	r1, [sp, #300]	@ 0x12c
c0de1dd4:	ea23 0104 	bic.w	r1, r3, r4
c0de1dd8:	9b37      	ldr	r3, [sp, #220]	@ 0xdc
c0de1dda:	ea81 010e 	eor.w	r1, r1, lr
c0de1dde:	9144      	str	r1, [sp, #272]	@ 0x110
c0de1de0:	9946      	ldr	r1, [sp, #280]	@ 0x118
c0de1de2:	4048      	eors	r0, r1
c0de1de4:	9920      	ldr	r1, [sp, #128]	@ 0x80
c0de1de6:	9046      	str	r0, [sp, #280]	@ 0x118
c0de1de8:	ea24 000e 	bic.w	r0, r4, lr
c0de1dec:	9c5c      	ldr	r4, [sp, #368]	@ 0x170
c0de1dee:	ea80 000a 	eor.w	r0, r0, sl
c0de1df2:	ea8b 0e01 	eor.w	lr, fp, r1
c0de1df6:	9040      	str	r0, [sp, #256]	@ 0x100
c0de1df8:	9823      	ldr	r0, [sp, #140]	@ 0x8c
c0de1dfa:	ea4f 720e 	mov.w	r2, lr, lsl #28
c0de1dfe:	ea84 0703 	eor.w	r7, r4, r3
c0de1e02:	9b31      	ldr	r3, [sp, #196]	@ 0xc4
c0de1e04:	9c5a      	ldr	r4, [sp, #360]	@ 0x168
c0de1e06:	4068      	eors	r0, r5
c0de1e08:	4063      	eors	r3, r4
c0de1e0a:	ea42 1610 	orr.w	r6, r2, r0, lsr #4
c0de1e0e:	9a3b      	ldr	r2, [sp, #236]	@ 0xec
c0de1e10:	075c      	lsls	r4, r3, #29
c0de1e12:	0700      	lsls	r0, r0, #28
c0de1e14:	ea44 04d7 	orr.w	r4, r4, r7, lsr #3
c0de1e18:	ea40 1e1e 	orr.w	lr, r0, lr, lsr #4
c0de1e1c:	9624      	str	r6, [sp, #144]	@ 0x90
c0de1e1e:	ea8c 0502 	eor.w	r5, ip, r2
c0de1e22:	9a39      	ldr	r2, [sp, #228]	@ 0xe4
c0de1e24:	f8dd c0c0 	ldr.w	ip, [sp, #192]	@ 0xc0
c0de1e28:	0528      	lsls	r0, r5, #20
c0de1e2a:	ea88 0102 	eor.w	r1, r8, r2
c0de1e2e:	f8dd 80bc 	ldr.w	r8, [sp, #188]	@ 0xbc
c0de1e32:	050a      	lsls	r2, r1, #20
c0de1e34:	ea42 3a15 	orr.w	sl, r2, r5, lsr #12
c0de1e38:	ea40 3511 	orr.w	r5, r0, r1, lsr #12
c0de1e3c:	0779      	lsls	r1, r7, #29
c0de1e3e:	ea2a 0206 	bic.w	r2, sl, r6
c0de1e42:	ea41 01d3 	orr.w	r1, r1, r3, lsr #3
c0de1e46:	9b57      	ldr	r3, [sp, #348]	@ 0x15c
c0de1e48:	ea25 000e 	bic.w	r0, r5, lr
c0de1e4c:	4062      	eors	r2, r4
c0de1e4e:	4048      	eors	r0, r1
c0de1e50:	923b      	str	r2, [sp, #236]	@ 0xec
c0de1e52:	9a3d      	ldr	r2, [sp, #244]	@ 0xf4
c0de1e54:	9039      	str	r0, [sp, #228]	@ 0xe4
c0de1e56:	ea26 0004 	bic.w	r0, r6, r4
c0de1e5a:	4053      	eors	r3, r2
c0de1e5c:	9a45      	ldr	r2, [sp, #276]	@ 0x114
c0de1e5e:	ea88 0602 	eor.w	r6, r8, r2
c0de1e62:	9a58      	ldr	r2, [sp, #352]	@ 0x160
c0de1e64:	0377      	lsls	r7, r6, #13
c0de1e66:	ea47 47d3 	orr.w	r7, r7, r3, lsr #19
c0de1e6a:	035b      	lsls	r3, r3, #13
c0de1e6c:	4078      	eors	r0, r7
c0de1e6e:	ea43 43d6 	orr.w	r3, r3, r6, lsr #19
c0de1e72:	ea24 0b07 	bic.w	fp, r4, r7
c0de1e76:	904c      	str	r0, [sp, #304]	@ 0x130
c0de1e78:	ea2e 0001 	bic.w	r0, lr, r1
c0de1e7c:	4399      	bics	r1, r3
c0de1e7e:	4058      	eors	r0, r3
c0de1e80:	9045      	str	r0, [sp, #276]	@ 0x114
c0de1e82:	9833      	ldr	r0, [sp, #204]	@ 0xcc
c0de1e84:	ea82 0400 	eor.w	r4, r2, r0
c0de1e88:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de1e8a:	ea8c 0600 	eor.w	r6, ip, r0
c0de1e8e:	00f0      	lsls	r0, r6, #3
c0de1e90:	ea40 7054 	orr.w	r0, r0, r4, lsr #29
c0de1e94:	00e4      	lsls	r4, r4, #3
c0de1e96:	ea44 7456 	orr.w	r4, r4, r6, lsr #29
c0de1e9a:	ea8b 0200 	eor.w	r2, fp, r0
c0de1e9e:	4061      	eors	r1, r4
c0de1ea0:	9238      	str	r2, [sp, #224]	@ 0xe0
c0de1ea2:	9137      	str	r1, [sp, #220]	@ 0xdc
c0de1ea4:	ea27 0100 	bic.w	r1, r7, r0
c0de1ea8:	ea20 000a 	bic.w	r0, r0, sl
c0de1eac:	ea81 010a 	eor.w	r1, r1, sl
c0de1eb0:	9132      	str	r1, [sp, #200]	@ 0xc8
c0de1eb2:	ea23 0104 	bic.w	r1, r3, r4
c0de1eb6:	4069      	eors	r1, r5
c0de1eb8:	9131      	str	r1, [sp, #196]	@ 0xc4
c0de1eba:	9924      	ldr	r1, [sp, #144]	@ 0x90
c0de1ebc:	4048      	eors	r0, r1
c0de1ebe:	992e      	ldr	r1, [sp, #184]	@ 0xb8
c0de1ec0:	903d      	str	r0, [sp, #244]	@ 0xf4
c0de1ec2:	ea24 0005 	bic.w	r0, r4, r5
c0de1ec6:	ea80 000e 	eor.w	r0, r0, lr
c0de1eca:	9033      	str	r0, [sp, #204]	@ 0xcc
c0de1ecc:	9829      	ldr	r0, [sp, #164]	@ 0xa4
c0de1ece:	ea81 0200 	eor.w	r2, r1, r0
c0de1ed2:	981e      	ldr	r0, [sp, #120]	@ 0x78
c0de1ed4:	992d      	ldr	r1, [sp, #180]	@ 0xb4
c0de1ed6:	ea81 0300 	eor.w	r3, r1, r0
c0de1eda:	9957      	ldr	r1, [sp, #348]	@ 0x15c
c0de1edc:	0398      	lsls	r0, r3, #14
c0de1ede:	ea40 4492 	orr.w	r4, r0, r2, lsr #18
c0de1ee2:	9822      	ldr	r0, [sp, #136]	@ 0x88
c0de1ee4:	0392      	lsls	r2, r2, #14
c0de1ee6:	ea42 4293 	orr.w	r2, r2, r3, lsr #18
c0de1eea:	ea81 0500 	eor.w	r5, r1, r0
c0de1eee:	982b      	ldr	r0, [sp, #172]	@ 0xac
c0de1ef0:	9958      	ldr	r1, [sp, #352]	@ 0x160
c0de1ef2:	032b      	lsls	r3, r5, #12
c0de1ef4:	ea88 0600 	eor.w	r6, r8, r0
c0de1ef8:	0330      	lsls	r0, r6, #12
c0de1efa:	ea40 5a15 	orr.w	sl, r0, r5, lsr #20
c0de1efe:	981a      	ldr	r0, [sp, #104]	@ 0x68
c0de1f00:	ea43 5516 	orr.w	r5, r3, r6, lsr #20
c0de1f04:	ea80 080c 	eor.w	r8, r0, ip
c0de1f08:	981b      	ldr	r0, [sp, #108]	@ 0x6c
c0de1f0a:	ea2a 0708 	bic.w	r7, sl, r8
c0de1f0e:	ea80 0b01 	eor.w	fp, r0, r1
c0de1f12:	9959      	ldr	r1, [sp, #356]	@ 0x164
c0de1f14:	ea84 0e07 	eor.w	lr, r4, r7
c0de1f18:	ea25 060b 	bic.w	r6, r5, fp
c0de1f1c:	ea82 0006 	eor.w	r0, r2, r6
c0de1f20:	9058      	str	r0, [sp, #352]	@ 0x160
c0de1f22:	9826      	ldr	r0, [sp, #152]	@ 0x98
c0de1f24:	ea81 0600 	eor.w	r6, r1, r0
c0de1f28:	9825      	ldr	r0, [sp, #148]	@ 0x94
c0de1f2a:	995b      	ldr	r1, [sp, #364]	@ 0x16c
c0de1f2c:	ea81 0700 	eor.w	r7, r1, r0
c0de1f30:	ea28 0104 	bic.w	r1, r8, r4
c0de1f34:	0578      	lsls	r0, r7, #21
c0de1f36:	ea40 20d6 	orr.w	r0, r0, r6, lsr #11
c0de1f3a:	4041      	eors	r1, r0
c0de1f3c:	ea24 0c00 	bic.w	ip, r4, r0
c0de1f40:	9c5c      	ldr	r4, [sp, #368]	@ 0x170
c0de1f42:	9130      	str	r1, [sp, #192]	@ 0xc0
c0de1f44:	0571      	lsls	r1, r6, #21
c0de1f46:	ea2b 0602 	bic.w	r6, fp, r2
c0de1f4a:	ea41 21d7 	orr.w	r1, r1, r7, lsr #11
c0de1f4e:	ea86 0301 	eor.w	r3, r6, r1
c0de1f52:	438a      	bics	r2, r1
c0de1f54:	932e      	str	r3, [sp, #184]	@ 0xb8
c0de1f56:	9b28      	ldr	r3, [sp, #160]	@ 0xa0
c0de1f58:	ea84 0603 	eor.w	r6, r4, r3
c0de1f5c:	9b1c      	ldr	r3, [sp, #112]	@ 0x70
c0de1f5e:	9c5a      	ldr	r4, [sp, #360]	@ 0x168
c0de1f60:	ea84 0703 	eor.w	r7, r4, r3
c0de1f64:	02fc      	lsls	r4, r7, #11
c0de1f66:	ea44 5456 	orr.w	r4, r4, r6, lsr #21
c0de1f6a:	02f6      	lsls	r6, r6, #11
c0de1f6c:	ea8c 0304 	eor.w	r3, ip, r4
c0de1f70:	ea46 5657 	orr.w	r6, r6, r7, lsr #21
c0de1f74:	43a0      	bics	r0, r4
c0de1f76:	935c      	str	r3, [sp, #368]	@ 0x170
c0de1f78:	4072      	eors	r2, r6
c0de1f7a:	ea8a 0300 	eor.w	r3, sl, r0
c0de1f7e:	ea21 0006 	bic.w	r0, r1, r6
c0de1f82:	9259      	str	r2, [sp, #356]	@ 0x164
c0de1f84:	ea85 0200 	eor.w	r2, r5, r0
c0de1f88:	ea24 000a 	bic.w	r0, r4, sl
c0de1f8c:	9c5d      	ldr	r4, [sp, #372]	@ 0x174
c0de1f8e:	6861      	ldr	r1, [r4, #4]
c0de1f90:	ea81 0108 	eor.w	r1, r1, r8
c0de1f94:	4048      	eors	r0, r1
c0de1f96:	f854 1b10 	ldr.w	r1, [r4], #16
c0de1f9a:	905b      	str	r0, [sp, #364]	@ 0x16c
c0de1f9c:	ea26 0005 	bic.w	r0, r6, r5
c0de1fa0:	ea81 010b 	eor.w	r1, r1, fp
c0de1fa4:	945d      	str	r4, [sp, #372]	@ 0x174
c0de1fa6:	4048      	eors	r0, r1
c0de1fa8:	905a      	str	r0, [sp, #360]	@ 0x168
c0de1faa:	9827      	ldr	r0, [sp, #156]	@ 0x9c
c0de1fac:	3002      	adds	r0, #2
c0de1fae:	f7ff b9a9 	b.w	c0de1304 <KeccakF1600_StatePermute+0xfc>
c0de1fb2:	9800      	ldr	r0, [sp, #0]
c0de1fb4:	9953      	ldr	r1, [sp, #332]	@ 0x14c
c0de1fb6:	f8c0 10c0 	str.w	r1, [r0, #192]	@ 0xc0
c0de1fba:	9951      	ldr	r1, [sp, #324]	@ 0x144
c0de1fbc:	6082      	str	r2, [r0, #8]
c0de1fbe:	f8c0 e024 	str.w	lr, [r0, #36]	@ 0x24
c0de1fc2:	60c3      	str	r3, [r0, #12]
c0de1fc4:	f8c0 10b8 	str.w	r1, [r0, #184]	@ 0xb8
c0de1fc8:	9943      	ldr	r1, [sp, #268]	@ 0x10c
c0de1fca:	f8c0 10b0 	str.w	r1, [r0, #176]	@ 0xb0
c0de1fce:	9948      	ldr	r1, [sp, #288]	@ 0x120
c0de1fd0:	f8c0 10a8 	str.w	r1, [r0, #168]	@ 0xa8
c0de1fd4:	992a      	ldr	r1, [sp, #168]	@ 0xa8
c0de1fd6:	f8c0 10a0 	str.w	r1, [r0, #160]	@ 0xa0
c0de1fda:	9934      	ldr	r1, [sp, #208]	@ 0xd0
c0de1fdc:	f8c0 1098 	str.w	r1, [r0, #152]	@ 0x98
c0de1fe0:	993f      	ldr	r1, [sp, #252]	@ 0xfc
c0de1fe2:	f8c0 1090 	str.w	r1, [r0, #144]	@ 0x90
c0de1fe6:	9942      	ldr	r1, [sp, #264]	@ 0x108
c0de1fe8:	f8c0 1088 	str.w	r1, [r0, #136]	@ 0x88
c0de1fec:	9936      	ldr	r1, [sp, #216]	@ 0xd8
c0de1fee:	f8c0 1080 	str.w	r1, [r0, #128]	@ 0x80
c0de1ff2:	9935      	ldr	r1, [sp, #212]	@ 0xd4
c0de1ff4:	6781      	str	r1, [r0, #120]	@ 0x78
c0de1ff6:	9950      	ldr	r1, [sp, #320]	@ 0x140
c0de1ff8:	6701      	str	r1, [r0, #112]	@ 0x70
c0de1ffa:	994e      	ldr	r1, [sp, #312]	@ 0x138
c0de1ffc:	6681      	str	r1, [r0, #104]	@ 0x68
c0de1ffe:	9941      	ldr	r1, [sp, #260]	@ 0x104
c0de2000:	6601      	str	r1, [r0, #96]	@ 0x60
c0de2002:	9944      	ldr	r1, [sp, #272]	@ 0x110
c0de2004:	6581      	str	r1, [r0, #88]	@ 0x58
c0de2006:	9940      	ldr	r1, [sp, #256]	@ 0x100
c0de2008:	6501      	str	r1, [r0, #80]	@ 0x50
c0de200a:	9939      	ldr	r1, [sp, #228]	@ 0xe4
c0de200c:	6481      	str	r1, [r0, #72]	@ 0x48
c0de200e:	9945      	ldr	r1, [sp, #276]	@ 0x114
c0de2010:	6401      	str	r1, [r0, #64]	@ 0x40
c0de2012:	9937      	ldr	r1, [sp, #220]	@ 0xdc
c0de2014:	6381      	str	r1, [r0, #56]	@ 0x38
c0de2016:	9931      	ldr	r1, [sp, #196]	@ 0xc4
c0de2018:	6301      	str	r1, [r0, #48]	@ 0x30
c0de201a:	9933      	ldr	r1, [sp, #204]	@ 0xcc
c0de201c:	6281      	str	r1, [r0, #40]	@ 0x28
c0de201e:	9958      	ldr	r1, [sp, #352]	@ 0x160
c0de2020:	6201      	str	r1, [r0, #32]
c0de2022:	992e      	ldr	r1, [sp, #184]	@ 0xb8
c0de2024:	6181      	str	r1, [r0, #24]
c0de2026:	9959      	ldr	r1, [sp, #356]	@ 0x164
c0de2028:	6101      	str	r1, [r0, #16]
c0de202a:	995a      	ldr	r1, [sp, #360]	@ 0x168
c0de202c:	6001      	str	r1, [r0, #0]
c0de202e:	9956      	ldr	r1, [sp, #344]	@ 0x158
c0de2030:	f8c0 10c4 	str.w	r1, [r0, #196]	@ 0xc4
c0de2034:	9954      	ldr	r1, [sp, #336]	@ 0x150
c0de2036:	f8c0 10bc 	str.w	r1, [r0, #188]	@ 0xbc
c0de203a:	994d      	ldr	r1, [sp, #308]	@ 0x134
c0de203c:	f8c0 10b4 	str.w	r1, [r0, #180]	@ 0xb4
c0de2040:	994f      	ldr	r1, [sp, #316]	@ 0x13c
c0de2042:	f8c0 10ac 	str.w	r1, [r0, #172]	@ 0xac
c0de2046:	992c      	ldr	r1, [sp, #176]	@ 0xb0
c0de2048:	f8c0 10a4 	str.w	r1, [r0, #164]	@ 0xa4
c0de204c:	993a      	ldr	r1, [sp, #232]	@ 0xe8
c0de204e:	f8c0 109c 	str.w	r1, [r0, #156]	@ 0x9c
c0de2052:	9947      	ldr	r1, [sp, #284]	@ 0x11c
c0de2054:	f8c0 1094 	str.w	r1, [r0, #148]	@ 0x94
c0de2058:	994a      	ldr	r1, [sp, #296]	@ 0x128
c0de205a:	f8c0 108c 	str.w	r1, [r0, #140]	@ 0x8c
c0de205e:	993e      	ldr	r1, [sp, #248]	@ 0xf8
c0de2060:	f8c0 1084 	str.w	r1, [r0, #132]	@ 0x84
c0de2064:	993c      	ldr	r1, [sp, #240]	@ 0xf0
c0de2066:	67c1      	str	r1, [r0, #124]	@ 0x7c
c0de2068:	9955      	ldr	r1, [sp, #340]	@ 0x154
c0de206a:	6741      	str	r1, [r0, #116]	@ 0x74
c0de206c:	9952      	ldr	r1, [sp, #328]	@ 0x148
c0de206e:	66c1      	str	r1, [r0, #108]	@ 0x6c
c0de2070:	9949      	ldr	r1, [sp, #292]	@ 0x124
c0de2072:	6641      	str	r1, [r0, #100]	@ 0x64
c0de2074:	994b      	ldr	r1, [sp, #300]	@ 0x12c
c0de2076:	65c1      	str	r1, [r0, #92]	@ 0x5c
c0de2078:	9946      	ldr	r1, [sp, #280]	@ 0x118
c0de207a:	6541      	str	r1, [r0, #84]	@ 0x54
c0de207c:	993b      	ldr	r1, [sp, #236]	@ 0xec
c0de207e:	64c1      	str	r1, [r0, #76]	@ 0x4c
c0de2080:	994c      	ldr	r1, [sp, #304]	@ 0x130
c0de2082:	6441      	str	r1, [r0, #68]	@ 0x44
c0de2084:	9938      	ldr	r1, [sp, #224]	@ 0xe0
c0de2086:	63c1      	str	r1, [r0, #60]	@ 0x3c
c0de2088:	9932      	ldr	r1, [sp, #200]	@ 0xc8
c0de208a:	6341      	str	r1, [r0, #52]	@ 0x34
c0de208c:	993d      	ldr	r1, [sp, #244]	@ 0xf4
c0de208e:	62c1      	str	r1, [r0, #44]	@ 0x2c
c0de2090:	9930      	ldr	r1, [sp, #192]	@ 0xc0
c0de2092:	61c1      	str	r1, [r0, #28]
c0de2094:	995c      	ldr	r1, [sp, #368]	@ 0x170
c0de2096:	6141      	str	r1, [r0, #20]
c0de2098:	995b      	ldr	r1, [sp, #364]	@ 0x16c
c0de209a:	6041      	str	r1, [r0, #4]
c0de209c:	b05e      	add	sp, #376	@ 0x178
c0de209e:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de20a2 <store64>:
c0de20a2:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de20a4:	461c      	mov	r4, r3
c0de20a6:	4615      	mov	r5, r2
c0de20a8:	4606      	mov	r6, r0
c0de20aa:	2700      	movs	r7, #0
c0de20ac:	2f40      	cmp	r7, #64	@ 0x40
c0de20ae:	bf08      	it	eq
c0de20b0:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de20b2:	4628      	mov	r0, r5
c0de20b4:	4621      	mov	r1, r4
c0de20b6:	463a      	mov	r2, r7
c0de20b8:	f00a f8b8 	bl	c0dec22c <__aeabi_llsr>
c0de20bc:	f806 0b01 	strb.w	r0, [r6], #1
c0de20c0:	3708      	adds	r7, #8
c0de20c2:	e7f3      	b.n	c0de20ac <store64+0xa>

c0de20c4 <OUTLINED_FUNCTION_0>:
c0de20c4:	58b3      	ldr	r3, [r6, r2]
c0de20c6:	4058      	eors	r0, r3
c0de20c8:	50b0      	str	r0, [r6, r2]
c0de20ca:	18b0      	adds	r0, r6, r2
c0de20cc:	6842      	ldr	r2, [r0, #4]
c0de20ce:	4051      	eors	r1, r2
c0de20d0:	6041      	str	r1, [r0, #4]
c0de20d2:	4770      	bx	lr

c0de20d4 <OUTLINED_FUNCTION_2>:
c0de20d4:	58a3      	ldr	r3, [r4, r2]
c0de20d6:	4058      	eors	r0, r3
c0de20d8:	50a0      	str	r0, [r4, r2]
c0de20da:	18a0      	adds	r0, r4, r2
c0de20dc:	6842      	ldr	r2, [r0, #4]
c0de20de:	4051      	eors	r1, r2
c0de20e0:	6041      	str	r1, [r0, #4]
c0de20e2:	4770      	bx	lr

c0de20e4 <OUTLINED_FUNCTION_3>:
c0de20e4:	f8c4 00c8 	str.w	r0, [r4, #200]	@ 0xc8
c0de20e8:	bd1c      	pop	{r2, r3, r4, pc}

c0de20ea <keccak_init>:
c0de20ea:	2106      	movs	r1, #6
c0de20ec:	2220      	movs	r2, #32
c0de20ee:	f009 bd44 	b.w	c0debb7a <cx_hash_init_ex>

c0de20f2 <keccak_update>:
c0de20f2:	f009 bd47 	b.w	c0debb84 <cx_hash_update>

c0de20f6 <keccak_final>:
c0de20f6:	f009 bd3b 	b.w	c0debb70 <cx_hash_final>

c0de20fa <inner_keccak256_init>:
c0de20fa:	b160      	cbz	r0, c0de2116 <inner_keccak256_init+0x1c>
c0de20fc:	b510      	push	{r4, lr}
c0de20fe:	212c      	movs	r1, #44	@ 0x2c
c0de2100:	4604      	mov	r4, r0
c0de2102:	f00a f993 	bl	c0dec42c <__aeabi_memclr>
c0de2106:	f104 0030 	add.w	r0, r4, #48	@ 0x30
c0de210a:	f7ff ffee 	bl	c0de20ea <keccak_init>
c0de210e:	2000      	movs	r0, #0
c0de2110:	e9c4 007e 	strd	r0, r0, [r4, #504]	@ 0x1f8
c0de2114:	bd10      	pop	{r4, pc}
c0de2116:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de211a:	4770      	bx	lr

c0de211c <inner_keccak256_inject>:
c0de211c:	b580      	push	{r7, lr}
c0de211e:	4603      	mov	r3, r0
c0de2120:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de2124:	b15b      	cbz	r3, c0de213e <inner_keccak256_inject+0x22>
c0de2126:	b151      	cbz	r1, c0de213e <inner_keccak256_inject+0x22>
c0de2128:	6a98      	ldr	r0, [r3, #40]	@ 0x28
c0de212a:	b110      	cbz	r0, c0de2132 <inner_keccak256_inject+0x16>
c0de212c:	f06f 0001 	mvn.w	r0, #1
c0de2130:	bd80      	pop	{r7, pc}
c0de2132:	f103 0030 	add.w	r0, r3, #48	@ 0x30
c0de2136:	b292      	uxth	r2, r2
c0de2138:	f7ff ffdb 	bl	c0de20f2 <keccak_update>
c0de213c:	2000      	movs	r0, #0
c0de213e:	bd80      	pop	{r7, pc}

c0de2140 <inner_keccak256_flip>:
c0de2140:	b510      	push	{r4, lr}
c0de2142:	b128      	cbz	r0, c0de2150 <inner_keccak256_flip+0x10>
c0de2144:	4604      	mov	r4, r0
c0de2146:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0de2148:	b128      	cbz	r0, c0de2156 <inner_keccak256_flip+0x16>
c0de214a:	f06f 0001 	mvn.w	r0, #1
c0de214e:	bd10      	pop	{r4, pc}
c0de2150:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de2154:	bd10      	pop	{r4, pc}
c0de2156:	f104 0030 	add.w	r0, r4, #48	@ 0x30
c0de215a:	4621      	mov	r1, r4
c0de215c:	f7ff ffcb 	bl	c0de20f6 <keccak_final>
c0de2160:	2000      	movs	r0, #0
c0de2162:	2101      	movs	r1, #1
c0de2164:	e9c4 007e 	strd	r0, r0, [r4, #504]	@ 0x1f8
c0de2168:	62a1      	str	r1, [r4, #40]	@ 0x28
c0de216a:	bd10      	pop	{r4, pc}

c0de216c <inner_keccak256_extract>:
c0de216c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2170:	b0f8      	sub	sp, #480	@ 0x1e0
c0de2172:	4682      	mov	sl, r0
c0de2174:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de2178:	f1ba 0f00 	cmp.w	sl, #0
c0de217c:	d020      	beq.n	c0de21c0 <inner_keccak256_extract+0x54>
c0de217e:	460e      	mov	r6, r1
c0de2180:	b1f1      	cbz	r1, c0de21c0 <inner_keccak256_extract+0x54>
c0de2182:	f8da 0028 	ldr.w	r0, [sl, #40]	@ 0x28
c0de2186:	b1c8      	cbz	r0, c0de21bc <inner_keccak256_extract+0x50>
c0de2188:	e9da 017e 	ldrd	r0, r1, [sl, #504]	@ 0x1f8
c0de218c:	4615      	mov	r5, r2
c0de218e:	4281      	cmp	r1, r0
c0de2190:	d919      	bls.n	c0de21c6 <inner_keccak256_extract+0x5a>
c0de2192:	1a0c      	subs	r4, r1, r0
c0de2194:	4450      	add	r0, sl
c0de2196:	46a3      	mov	fp, r4
c0de2198:	42ac      	cmp	r4, r5
c0de219a:	f500 71ec 	add.w	r1, r0, #472	@ 0x1d8
c0de219e:	4630      	mov	r0, r6
c0de21a0:	bf88      	it	hi
c0de21a2:	46ab      	movhi	fp, r5
c0de21a4:	465a      	mov	r2, fp
c0de21a6:	f00a f937 	bl	c0dec418 <__aeabi_memcpy>
c0de21aa:	f8da 01f8 	ldr.w	r0, [sl, #504]	@ 0x1f8
c0de21ae:	42ac      	cmp	r4, r5
c0de21b0:	4458      	add	r0, fp
c0de21b2:	f8ca 01f8 	str.w	r0, [sl, #504]	@ 0x1f8
c0de21b6:	d308      	bcc.n	c0de21ca <inner_keccak256_extract+0x5e>
c0de21b8:	2000      	movs	r0, #0
c0de21ba:	e001      	b.n	c0de21c0 <inner_keccak256_extract+0x54>
c0de21bc:	f06f 0001 	mvn.w	r0, #1
c0de21c0:	b078      	add	sp, #480	@ 0x1e0
c0de21c2:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de21c6:	f04f 0b00 	mov.w	fp, #0
c0de21ca:	ac6e      	add	r4, sp, #440	@ 0x1b8
c0de21cc:	9503      	str	r5, [sp, #12]
c0de21ce:	f104 0020 	add.w	r0, r4, #32
c0de21d2:	9002      	str	r0, [sp, #8]
c0de21d4:	f50a 70ec 	add.w	r0, sl, #472	@ 0x1d8
c0de21d8:	e9cd 0600 	strd	r0, r6, [sp]
c0de21dc:	45ab      	cmp	fp, r5
c0de21de:	d2eb      	bcs.n	c0de21b8 <inner_keccak256_extract+0x4c>
c0de21e0:	4620      	mov	r0, r4
c0de21e2:	4651      	mov	r1, sl
c0de21e4:	2220      	movs	r2, #32
c0de21e6:	46a0      	mov	r8, r4
c0de21e8:	f00a f916 	bl	c0dec418 <__aeabi_memcpy>
c0de21ec:	e9da 5408 	ldrd	r5, r4, [sl, #32]
c0de21f0:	9f02      	ldr	r7, [sp, #8]
c0de21f2:	2638      	movs	r6, #56	@ 0x38
c0de21f4:	f116 0008 	adds.w	r0, r6, #8
c0de21f8:	d008      	beq.n	c0de220c <inner_keccak256_extract+0xa0>
c0de21fa:	4628      	mov	r0, r5
c0de21fc:	4621      	mov	r1, r4
c0de21fe:	4632      	mov	r2, r6
c0de2200:	f00a f814 	bl	c0dec22c <__aeabi_llsr>
c0de2204:	f807 0b01 	strb.w	r0, [r7], #1
c0de2208:	3e08      	subs	r6, #8
c0de220a:	e7f3      	b.n	c0de21f4 <inner_keccak256_extract+0x88>
c0de220c:	af04      	add	r7, sp, #16
c0de220e:	4638      	mov	r0, r7
c0de2210:	f7ff ff6b 	bl	c0de20ea <keccak_init>
c0de2214:	4638      	mov	r0, r7
c0de2216:	4641      	mov	r1, r8
c0de2218:	2228      	movs	r2, #40	@ 0x28
c0de221a:	4644      	mov	r4, r8
c0de221c:	f7ff ff69 	bl	c0de20f2 <keccak_update>
c0de2220:	9d03      	ldr	r5, [sp, #12]
c0de2222:	eba5 080b 	sub.w	r8, r5, fp
c0de2226:	f1b8 0f1f 	cmp.w	r8, #31
c0de222a:	d90b      	bls.n	c0de2244 <inner_keccak256_extract+0xd8>
c0de222c:	9e01      	ldr	r6, [sp, #4]
c0de222e:	4638      	mov	r0, r7
c0de2230:	eb06 010b 	add.w	r1, r6, fp
c0de2234:	f7ff ff5f 	bl	c0de20f6 <keccak_final>
c0de2238:	f10b 0b20 	add.w	fp, fp, #32
c0de223c:	f04f 0800 	mov.w	r8, #0
c0de2240:	2000      	movs	r0, #0
c0de2242:	e00d      	b.n	c0de2260 <inner_keccak256_extract+0xf4>
c0de2244:	4638      	mov	r0, r7
c0de2246:	9f00      	ldr	r7, [sp, #0]
c0de2248:	4639      	mov	r1, r7
c0de224a:	f7ff ff54 	bl	c0de20f6 <keccak_final>
c0de224e:	9e01      	ldr	r6, [sp, #4]
c0de2250:	4639      	mov	r1, r7
c0de2252:	4642      	mov	r2, r8
c0de2254:	eb06 000b 	add.w	r0, r6, fp
c0de2258:	f00a f8de 	bl	c0dec418 <__aeabi_memcpy>
c0de225c:	2020      	movs	r0, #32
c0de225e:	46ab      	mov	fp, r5
c0de2260:	e9ca 807e 	strd	r8, r0, [sl, #504]	@ 0x1f8
c0de2264:	e9da 0108 	ldrd	r0, r1, [sl, #32]
c0de2268:	3001      	adds	r0, #1
c0de226a:	f141 0100 	adc.w	r1, r1, #0
c0de226e:	e9ca 0108 	strd	r0, r1, [sl, #32]
c0de2272:	e7b3      	b.n	c0de21dc <inner_keccak256_extract+0x70>

c0de2274 <pqcrystals_dilithium2_lowram_pack_sig_h>:
c0de2274:	b5b0      	push	{r4, r5, r7, lr}
c0de2276:	f500 6012 	add.w	r0, r0, #2336	@ 0x920
c0de227a:	2400      	movs	r4, #0
c0de227c:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de2280:	d009      	beq.n	c0de2296 <pqcrystals_dilithium2_lowram_pack_sig_h+0x22>
c0de2282:	f851 5024 	ldr.w	r5, [r1, r4, lsl #2]
c0de2286:	b125      	cbz	r5, c0de2292 <pqcrystals_dilithium2_lowram_pack_sig_h+0x1e>
c0de2288:	681d      	ldr	r5, [r3, #0]
c0de228a:	5544      	strb	r4, [r0, r5]
c0de228c:	681d      	ldr	r5, [r3, #0]
c0de228e:	3501      	adds	r5, #1
c0de2290:	601d      	str	r5, [r3, #0]
c0de2292:	3401      	adds	r4, #1
c0de2294:	e7f2      	b.n	c0de227c <pqcrystals_dilithium2_lowram_pack_sig_h+0x8>
c0de2296:	6819      	ldr	r1, [r3, #0]
c0de2298:	4410      	add	r0, r2
c0de229a:	f880 1050 	strb.w	r1, [r0, #80]	@ 0x50
c0de229e:	bdb0      	pop	{r4, r5, r7, pc}

c0de22a0 <pqcrystals_dilithium2_lowram_pack_sig_h_zero>:
c0de22a0:	680a      	ldr	r2, [r1, #0]
c0de22a2:	f500 6012 	add.w	r0, r0, #2336	@ 0x920
c0de22a6:	2300      	movs	r3, #0
c0de22a8:	2a4f      	cmp	r2, #79	@ 0x4f
c0de22aa:	bf88      	it	hi
c0de22ac:	4770      	bxhi	lr
c0de22ae:	5483      	strb	r3, [r0, r2]
c0de22b0:	680a      	ldr	r2, [r1, #0]
c0de22b2:	3201      	adds	r2, #1
c0de22b4:	600a      	str	r2, [r1, #0]
c0de22b6:	e7f7      	b.n	c0de22a8 <pqcrystals_dilithium2_lowram_pack_sig_h_zero+0x8>

c0de22b8 <poly_challenge_compress>:
c0de22b8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de22bc:	2200      	movs	r2, #0
c0de22be:	2300      	movs	r3, #0
c0de22c0:	2b44      	cmp	r3, #68	@ 0x44
c0de22c2:	d002      	beq.n	c0de22ca <poly_challenge_compress+0x12>
c0de22c4:	54c2      	strb	r2, [r0, r3]
c0de22c6:	3301      	adds	r3, #1
c0de22c8:	e7fa      	b.n	c0de22c0 <poly_challenge_compress+0x8>
c0de22ca:	2200      	movs	r2, #0
c0de22cc:	2301      	movs	r3, #1
c0de22ce:	2600      	movs	r6, #0
c0de22d0:	f04f 0800 	mov.w	r8, #0
c0de22d4:	2500      	movs	r5, #0
c0de22d6:	2700      	movs	r7, #0
c0de22d8:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de22dc:	d011      	beq.n	c0de2302 <poly_challenge_compress+0x4a>
c0de22de:	f851 4022 	ldr.w	r4, [r1, r2, lsl #2]
c0de22e2:	b164      	cbz	r4, c0de22fe <poly_challenge_compress+0x46>
c0de22e4:	5582      	strb	r2, [r0, r6]
c0de22e6:	f851 4022 	ldr.w	r4, [r1, r2, lsl #2]
c0de22ea:	3401      	adds	r4, #1
c0de22ec:	bf04      	itt	eq
c0de22ee:	433d      	orreq	r5, r7
c0de22f0:	ea48 0803 	orreq.w	r8, r8, r3
c0de22f4:	007c      	lsls	r4, r7, #1
c0de22f6:	3601      	adds	r6, #1
c0de22f8:	ea44 77d3 	orr.w	r7, r4, r3, lsr #31
c0de22fc:	005b      	lsls	r3, r3, #1
c0de22fe:	3201      	adds	r2, #1
c0de2300:	e7ea      	b.n	c0de22d8 <poly_challenge_compress+0x20>
c0de2302:	f100 073c 	add.w	r7, r0, #60	@ 0x3c
c0de2306:	2600      	movs	r6, #0
c0de2308:	2e40      	cmp	r6, #64	@ 0x40
c0de230a:	bf08      	it	eq
c0de230c:	e8bd 81f0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de2310:	4640      	mov	r0, r8
c0de2312:	4629      	mov	r1, r5
c0de2314:	4632      	mov	r2, r6
c0de2316:	f009 ff89 	bl	c0dec22c <__aeabi_llsr>
c0de231a:	f807 0b01 	strb.w	r0, [r7], #1
c0de231e:	3608      	adds	r6, #8
c0de2320:	e7f2      	b.n	c0de2308 <poly_challenge_compress+0x50>

c0de2322 <poly_challenge_decompress>:
c0de2322:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de2326:	4688      	mov	r8, r1
c0de2328:	4682      	mov	sl, r0
c0de232a:	2000      	movs	r0, #0
c0de232c:	2100      	movs	r1, #0
c0de232e:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de2332:	d003      	beq.n	c0de233c <poly_challenge_decompress+0x1a>
c0de2334:	f84a 0021 	str.w	r0, [sl, r1, lsl #2]
c0de2338:	3101      	adds	r1, #1
c0de233a:	e7f8      	b.n	c0de232e <poly_challenge_decompress+0xc>
c0de233c:	f108 053c 	add.w	r5, r8, #60	@ 0x3c
c0de2340:	2600      	movs	r6, #0
c0de2342:	2700      	movs	r7, #0
c0de2344:	2400      	movs	r4, #0
c0de2346:	2e40      	cmp	r6, #64	@ 0x40
c0de2348:	d009      	beq.n	c0de235e <poly_challenge_decompress+0x3c>
c0de234a:	f815 0b01 	ldrb.w	r0, [r5], #1
c0de234e:	2100      	movs	r1, #0
c0de2350:	4632      	mov	r2, r6
c0de2352:	f009 ff59 	bl	c0dec208 <__aeabi_llsl>
c0de2356:	430c      	orrs	r4, r1
c0de2358:	4307      	orrs	r7, r0
c0de235a:	3608      	adds	r6, #8
c0de235c:	e7f3      	b.n	c0de2346 <poly_challenge_decompress+0x24>
c0de235e:	2000      	movs	r0, #0
c0de2360:	2827      	cmp	r0, #39	@ 0x27
c0de2362:	bf08      	it	eq
c0de2364:	e8bd 85f8 	ldmiaeq.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0de2368:	07fa      	lsls	r2, r7, #31
c0de236a:	f818 1000 	ldrb.w	r1, [r8, r0]
c0de236e:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
c0de2372:	bf08      	it	eq
c0de2374:	2201      	moveq	r2, #1
c0de2376:	ea5f 0454 	movs.w	r4, r4, lsr #1
c0de237a:	f84a 2021 	str.w	r2, [sl, r1, lsl #2]
c0de237e:	ea4f 0737 	mov.w	r7, r7, rrx
c0de2382:	3001      	adds	r0, #1
c0de2384:	e7ec      	b.n	c0de2360 <poly_challenge_decompress+0x3e>

c0de2386 <poly_schoolbook>:
c0de2386:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de238a:	4614      	mov	r4, r2
c0de238c:	468a      	mov	sl, r1
c0de238e:	2200      	movs	r2, #0
c0de2390:	2100      	movs	r1, #0
c0de2392:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de2396:	d003      	beq.n	c0de23a0 <poly_schoolbook+0x1a>
c0de2398:	f840 2021 	str.w	r2, [r0, r1, lsl #2]
c0de239c:	3101      	adds	r1, #1
c0de239e:	e7f8      	b.n	c0de2392 <poly_schoolbook+0xc>
c0de23a0:	f10a 053c 	add.w	r5, sl, #60	@ 0x3c
c0de23a4:	2700      	movs	r7, #0
c0de23a6:	f04f 0b00 	mov.w	fp, #0
c0de23aa:	2600      	movs	r6, #0
c0de23ac:	9003      	str	r0, [sp, #12]
c0de23ae:	2f40      	cmp	r7, #64	@ 0x40
c0de23b0:	d006      	beq.n	c0de23c0 <poly_schoolbook+0x3a>
c0de23b2:	f000 fc0a 	bl	c0de2bca <OUTLINED_FUNCTION_2>
c0de23b6:	430e      	orrs	r6, r1
c0de23b8:	ea4b 0b00 	orr.w	fp, fp, r0
c0de23bc:	3708      	adds	r7, #8
c0de23be:	e7f6      	b.n	c0de23ae <poly_schoolbook+0x28>
c0de23c0:	f04f 0800 	mov.w	r8, #0
c0de23c4:	f8cd a004 	str.w	sl, [sp, #4]
c0de23c8:	f1b8 0f27 	cmp.w	r8, #39	@ 0x27
c0de23cc:	bf08      	it	eq
c0de23ce:	e8bd 8dff 	ldmiaeq.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de23d2:	f81a 0008 	ldrb.w	r0, [sl, r8]
c0de23d6:	ea5f 71cb 	movs.w	r1, fp, lsl #31
c0de23da:	f5c0 7780 	rsb	r7, r0, #256	@ 0x100
c0de23de:	d111      	bne.n	c0de2404 <poly_schoolbook+0x7e>
c0de23e0:	9903      	ldr	r1, [sp, #12]
c0de23e2:	9602      	str	r6, [sp, #8]
c0de23e4:	2500      	movs	r5, #0
c0de23e6:	eb01 0680 	add.w	r6, r1, r0, lsl #2
c0de23ea:	42af      	cmp	r7, r5
c0de23ec:	d01b      	beq.n	c0de2426 <poly_schoolbook+0xa0>
c0de23ee:	4620      	mov	r0, r4
c0de23f0:	4629      	mov	r1, r5
c0de23f2:	f000 f842 	bl	c0de247a <polyt0_unpack_idx>
c0de23f6:	f856 1025 	ldr.w	r1, [r6, r5, lsl #2]
c0de23fa:	4408      	add	r0, r1
c0de23fc:	f846 0025 	str.w	r0, [r6, r5, lsl #2]
c0de2400:	3501      	adds	r5, #1
c0de2402:	e7f2      	b.n	c0de23ea <poly_schoolbook+0x64>
c0de2404:	9903      	ldr	r1, [sp, #12]
c0de2406:	2500      	movs	r5, #0
c0de2408:	eb01 0a80 	add.w	sl, r1, r0, lsl #2
c0de240c:	42af      	cmp	r7, r5
c0de240e:	d01b      	beq.n	c0de2448 <poly_schoolbook+0xc2>
c0de2410:	4620      	mov	r0, r4
c0de2412:	4629      	mov	r1, r5
c0de2414:	f000 f831 	bl	c0de247a <polyt0_unpack_idx>
c0de2418:	f85a 1025 	ldr.w	r1, [sl, r5, lsl #2]
c0de241c:	1a08      	subs	r0, r1, r0
c0de241e:	f84a 0025 	str.w	r0, [sl, r5, lsl #2]
c0de2422:	3501      	adds	r5, #1
c0de2424:	e7f2      	b.n	c0de240c <poly_schoolbook+0x86>
c0de2426:	f5a6 6580 	sub.w	r5, r6, #1024	@ 0x400
c0de242a:	9e02      	ldr	r6, [sp, #8]
c0de242c:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de2430:	d01c      	beq.n	c0de246c <poly_schoolbook+0xe6>
c0de2432:	4620      	mov	r0, r4
c0de2434:	4639      	mov	r1, r7
c0de2436:	f000 f820 	bl	c0de247a <polyt0_unpack_idx>
c0de243a:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de243e:	1a08      	subs	r0, r1, r0
c0de2440:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de2444:	3701      	adds	r7, #1
c0de2446:	e7f1      	b.n	c0de242c <poly_schoolbook+0xa6>
c0de2448:	f5aa 6580 	sub.w	r5, sl, #1024	@ 0x400
c0de244c:	f8dd a004 	ldr.w	sl, [sp, #4]
c0de2450:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de2454:	d00a      	beq.n	c0de246c <poly_schoolbook+0xe6>
c0de2456:	4620      	mov	r0, r4
c0de2458:	4639      	mov	r1, r7
c0de245a:	f000 f80e 	bl	c0de247a <polyt0_unpack_idx>
c0de245e:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de2462:	4408      	add	r0, r1
c0de2464:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de2468:	3701      	adds	r7, #1
c0de246a:	e7f1      	b.n	c0de2450 <poly_schoolbook+0xca>
c0de246c:	ea5f 0656 	movs.w	r6, r6, lsr #1
c0de2470:	f108 0801 	add.w	r8, r8, #1
c0de2474:	ea4f 0b3b 	mov.w	fp, fp, rrx
c0de2478:	e7a6      	b.n	c0de23c8 <poly_schoolbook+0x42>

c0de247a <polyt0_unpack_idx>:
c0de247a:	08ca      	lsrs	r2, r1, #3
c0de247c:	230d      	movs	r3, #13
c0de247e:	f001 0107 	and.w	r1, r1, #7
c0de2482:	fb02 0003 	mla	r0, r2, r3, r0
c0de2486:	2906      	cmp	r1, #6
c0de2488:	d00e      	beq.n	c0de24a8 <polyt0_unpack_idx+0x2e>
c0de248a:	2901      	cmp	r1, #1
c0de248c:	d014      	beq.n	c0de24b8 <polyt0_unpack_idx+0x3e>
c0de248e:	2902      	cmp	r1, #2
c0de2490:	d01a      	beq.n	c0de24c8 <polyt0_unpack_idx+0x4e>
c0de2492:	2903      	cmp	r1, #3
c0de2494:	d01d      	beq.n	c0de24d2 <polyt0_unpack_idx+0x58>
c0de2496:	2904      	cmp	r1, #4
c0de2498:	d023      	beq.n	c0de24e2 <polyt0_unpack_idx+0x68>
c0de249a:	2905      	cmp	r1, #5
c0de249c:	d029      	beq.n	c0de24f2 <polyt0_unpack_idx+0x78>
c0de249e:	bb69      	cbnz	r1, c0de24fc <polyt0_unpack_idx+0x82>
c0de24a0:	7801      	ldrb	r1, [r0, #0]
c0de24a2:	7840      	ldrb	r0, [r0, #1]
c0de24a4:	0200      	lsls	r0, r0, #8
c0de24a6:	e02d      	b.n	c0de2504 <polyt0_unpack_idx+0x8a>
c0de24a8:	7a82      	ldrb	r2, [r0, #10]
c0de24aa:	7a41      	ldrb	r1, [r0, #9]
c0de24ac:	7ac3      	ldrb	r3, [r0, #11]
c0de24ae:	0090      	lsls	r0, r2, #2
c0de24b0:	ea40 1091 	orr.w	r0, r0, r1, lsr #6
c0de24b4:	0299      	lsls	r1, r3, #10
c0de24b6:	e025      	b.n	c0de2504 <polyt0_unpack_idx+0x8a>
c0de24b8:	7882      	ldrb	r2, [r0, #2]
c0de24ba:	7841      	ldrb	r1, [r0, #1]
c0de24bc:	78c3      	ldrb	r3, [r0, #3]
c0de24be:	00d0      	lsls	r0, r2, #3
c0de24c0:	ea40 1051 	orr.w	r0, r0, r1, lsr #5
c0de24c4:	02d9      	lsls	r1, r3, #11
c0de24c6:	e01d      	b.n	c0de2504 <polyt0_unpack_idx+0x8a>
c0de24c8:	78c1      	ldrb	r1, [r0, #3]
c0de24ca:	7900      	ldrb	r0, [r0, #4]
c0de24cc:	0180      	lsls	r0, r0, #6
c0de24ce:	0889      	lsrs	r1, r1, #2
c0de24d0:	e018      	b.n	c0de2504 <polyt0_unpack_idx+0x8a>
c0de24d2:	7942      	ldrb	r2, [r0, #5]
c0de24d4:	7901      	ldrb	r1, [r0, #4]
c0de24d6:	7983      	ldrb	r3, [r0, #6]
c0de24d8:	0050      	lsls	r0, r2, #1
c0de24da:	ea40 10d1 	orr.w	r0, r0, r1, lsr #7
c0de24de:	0259      	lsls	r1, r3, #9
c0de24e0:	e010      	b.n	c0de2504 <polyt0_unpack_idx+0x8a>
c0de24e2:	79c2      	ldrb	r2, [r0, #7]
c0de24e4:	7981      	ldrb	r1, [r0, #6]
c0de24e6:	7a03      	ldrb	r3, [r0, #8]
c0de24e8:	0110      	lsls	r0, r2, #4
c0de24ea:	ea40 1011 	orr.w	r0, r0, r1, lsr #4
c0de24ee:	0319      	lsls	r1, r3, #12
c0de24f0:	e008      	b.n	c0de2504 <polyt0_unpack_idx+0x8a>
c0de24f2:	7a01      	ldrb	r1, [r0, #8]
c0de24f4:	7a40      	ldrb	r0, [r0, #9]
c0de24f6:	01c0      	lsls	r0, r0, #7
c0de24f8:	0849      	lsrs	r1, r1, #1
c0de24fa:	e003      	b.n	c0de2504 <polyt0_unpack_idx+0x8a>
c0de24fc:	7ac1      	ldrb	r1, [r0, #11]
c0de24fe:	7b00      	ldrb	r0, [r0, #12]
c0de2500:	0140      	lsls	r0, r0, #5
c0de2502:	08c9      	lsrs	r1, r1, #3
c0de2504:	4308      	orrs	r0, r1
c0de2506:	f36f 305f 	bfc	r0, #13, #19
c0de250a:	f5c0 5080 	rsb	r0, r0, #4096	@ 0x1000
c0de250e:	4770      	bx	lr

c0de2510 <poly_schoolbook_t1>:
c0de2510:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de2514:	4614      	mov	r4, r2
c0de2516:	468b      	mov	fp, r1
c0de2518:	2200      	movs	r2, #0
c0de251a:	2100      	movs	r1, #0
c0de251c:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de2520:	d003      	beq.n	c0de252a <poly_schoolbook_t1+0x1a>
c0de2522:	f840 2021 	str.w	r2, [r0, r1, lsl #2]
c0de2526:	3101      	adds	r1, #1
c0de2528:	e7f8      	b.n	c0de251c <poly_schoolbook_t1+0xc>
c0de252a:	f10b 053c 	add.w	r5, fp, #60	@ 0x3c
c0de252e:	2700      	movs	r7, #0
c0de2530:	f04f 0a00 	mov.w	sl, #0
c0de2534:	2600      	movs	r6, #0
c0de2536:	9002      	str	r0, [sp, #8]
c0de2538:	2f40      	cmp	r7, #64	@ 0x40
c0de253a:	d006      	beq.n	c0de254a <poly_schoolbook_t1+0x3a>
c0de253c:	f000 fb45 	bl	c0de2bca <OUTLINED_FUNCTION_2>
c0de2540:	430e      	orrs	r6, r1
c0de2542:	ea4a 0a00 	orr.w	sl, sl, r0
c0de2546:	3708      	adds	r7, #8
c0de2548:	e7f6      	b.n	c0de2538 <poly_schoolbook_t1+0x28>
c0de254a:	4832      	ldr	r0, [pc, #200]	@ (c0de2614 <poly_schoolbook_t1+0x104>)
c0de254c:	2200      	movs	r2, #0
c0de254e:	f8cd b000 	str.w	fp, [sp]
c0de2552:	4680      	mov	r8, r0
c0de2554:	2a27      	cmp	r2, #39	@ 0x27
c0de2556:	bf08      	it	eq
c0de2558:	e8bd 8dff 	ldmiaeq.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de255c:	f81b 0002 	ldrb.w	r0, [fp, r2]
c0de2560:	ea5f 71ca 	movs.w	r1, sl, lsl #31
c0de2564:	9203      	str	r2, [sp, #12]
c0de2566:	f5c0 7780 	rsb	r7, r0, #256	@ 0x100
c0de256a:	d112      	bne.n	c0de2592 <poly_schoolbook_t1+0x82>
c0de256c:	9902      	ldr	r1, [sp, #8]
c0de256e:	9601      	str	r6, [sp, #4]
c0de2570:	2500      	movs	r5, #0
c0de2572:	eb01 0680 	add.w	r6, r1, r0, lsl #2
c0de2576:	42af      	cmp	r7, r5
c0de2578:	d01e      	beq.n	c0de25b8 <poly_schoolbook_t1+0xa8>
c0de257a:	4620      	mov	r0, r4
c0de257c:	4629      	mov	r1, r5
c0de257e:	f000 f84b 	bl	c0de2618 <polyt1_unpack_idx>
c0de2582:	f856 1025 	ldr.w	r1, [r6, r5, lsl #2]
c0de2586:	eb01 3040 	add.w	r0, r1, r0, lsl #13
c0de258a:	f846 0025 	str.w	r0, [r6, r5, lsl #2]
c0de258e:	3501      	adds	r5, #1
c0de2590:	e7f1      	b.n	c0de2576 <poly_schoolbook_t1+0x66>
c0de2592:	9902      	ldr	r1, [sp, #8]
c0de2594:	2500      	movs	r5, #0
c0de2596:	eb01 0b80 	add.w	fp, r1, r0, lsl #2
c0de259a:	42af      	cmp	r7, r5
c0de259c:	d01f      	beq.n	c0de25de <poly_schoolbook_t1+0xce>
c0de259e:	4620      	mov	r0, r4
c0de25a0:	4629      	mov	r1, r5
c0de25a2:	f000 f839 	bl	c0de2618 <polyt1_unpack_idx>
c0de25a6:	f85b 1025 	ldr.w	r1, [fp, r5, lsl #2]
c0de25aa:	4642      	mov	r2, r8
c0de25ac:	fb00 1008 	mla	r0, r0, r8, r1
c0de25b0:	f84b 0025 	str.w	r0, [fp, r5, lsl #2]
c0de25b4:	3501      	adds	r5, #1
c0de25b6:	e7f0      	b.n	c0de259a <poly_schoolbook_t1+0x8a>
c0de25b8:	f5a6 6580 	sub.w	r5, r6, #1024	@ 0x400
c0de25bc:	9e01      	ldr	r6, [sp, #4]
c0de25be:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de25c2:	d01f      	beq.n	c0de2604 <poly_schoolbook_t1+0xf4>
c0de25c4:	4620      	mov	r0, r4
c0de25c6:	4639      	mov	r1, r7
c0de25c8:	f000 f826 	bl	c0de2618 <polyt1_unpack_idx>
c0de25cc:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de25d0:	4642      	mov	r2, r8
c0de25d2:	fb00 1008 	mla	r0, r0, r8, r1
c0de25d6:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de25da:	3701      	adds	r7, #1
c0de25dc:	e7ef      	b.n	c0de25be <poly_schoolbook_t1+0xae>
c0de25de:	f5ab 6580 	sub.w	r5, fp, #1024	@ 0x400
c0de25e2:	f8dd b000 	ldr.w	fp, [sp]
c0de25e6:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de25ea:	d00b      	beq.n	c0de2604 <poly_schoolbook_t1+0xf4>
c0de25ec:	4620      	mov	r0, r4
c0de25ee:	4639      	mov	r1, r7
c0de25f0:	f000 f812 	bl	c0de2618 <polyt1_unpack_idx>
c0de25f4:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de25f8:	eb01 3040 	add.w	r0, r1, r0, lsl #13
c0de25fc:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de2600:	3701      	adds	r7, #1
c0de2602:	e7f0      	b.n	c0de25e6 <poly_schoolbook_t1+0xd6>
c0de2604:	9a03      	ldr	r2, [sp, #12]
c0de2606:	ea5f 0656 	movs.w	r6, r6, lsr #1
c0de260a:	ea4f 0a3a 	mov.w	sl, sl, rrx
c0de260e:	3201      	adds	r2, #1
c0de2610:	e7a0      	b.n	c0de2554 <poly_schoolbook_t1+0x44>
c0de2612:	bf00      	nop
c0de2614:	ffffe000 	.word	0xffffe000

c0de2618 <polyt1_unpack_idx>:
c0de2618:	088a      	lsrs	r2, r1, #2
c0de261a:	f001 0103 	and.w	r1, r1, #3
c0de261e:	eb02 0282 	add.w	r2, r2, r2, lsl #2
c0de2622:	2902      	cmp	r1, #2
c0de2624:	4410      	add	r0, r2
c0de2626:	d006      	beq.n	c0de2636 <polyt1_unpack_idx+0x1e>
c0de2628:	2901      	cmp	r1, #1
c0de262a:	d009      	beq.n	c0de2640 <polyt1_unpack_idx+0x28>
c0de262c:	b969      	cbnz	r1, c0de264a <polyt1_unpack_idx+0x32>
c0de262e:	7801      	ldrb	r1, [r0, #0]
c0de2630:	2208      	movs	r2, #8
c0de2632:	2301      	movs	r3, #1
c0de2634:	e00d      	b.n	c0de2652 <polyt1_unpack_idx+0x3a>
c0de2636:	7881      	ldrb	r1, [r0, #2]
c0de2638:	2204      	movs	r2, #4
c0de263a:	2303      	movs	r3, #3
c0de263c:	0909      	lsrs	r1, r1, #4
c0de263e:	e008      	b.n	c0de2652 <polyt1_unpack_idx+0x3a>
c0de2640:	7841      	ldrb	r1, [r0, #1]
c0de2642:	2206      	movs	r2, #6
c0de2644:	2302      	movs	r3, #2
c0de2646:	0889      	lsrs	r1, r1, #2
c0de2648:	e003      	b.n	c0de2652 <polyt1_unpack_idx+0x3a>
c0de264a:	78c1      	ldrb	r1, [r0, #3]
c0de264c:	2202      	movs	r2, #2
c0de264e:	2304      	movs	r3, #4
c0de2650:	0989      	lsrs	r1, r1, #6
c0de2652:	5cc0      	ldrb	r0, [r0, r3]
c0de2654:	4090      	lsls	r0, r2
c0de2656:	f400 707f 	and.w	r0, r0, #1020	@ 0x3fc
c0de265a:	4308      	orrs	r0, r1
c0de265c:	4770      	bx	lr

c0de265e <polyw_pack>:
c0de265e:	b5b0      	push	{r4, r5, r7, lr}
c0de2660:	4605      	mov	r5, r0
c0de2662:	4608      	mov	r0, r1
c0de2664:	460c      	mov	r4, r1
c0de2666:	f000 fb3d 	bl	c0de2ce4 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de266a:	4620      	mov	r0, r4
c0de266c:	f000 fb49 	bl	c0de2d02 <pqcrystals_dilithium2_lowram_poly_caddq>
c0de2670:	2000      	movs	r0, #0
c0de2672:	f5b0 7f80 	cmp.w	r0, #256	@ 0x100
c0de2676:	bf08      	it	eq
c0de2678:	bdb0      	popeq	{r4, r5, r7, pc}
c0de267a:	f854 1020 	ldr.w	r1, [r4, r0, lsl #2]
c0de267e:	eb00 0240 	add.w	r2, r0, r0, lsl #1
c0de2682:	54a9      	strb	r1, [r5, r2]
c0de2684:	18a9      	adds	r1, r5, r2
c0de2686:	f854 2020 	ldr.w	r2, [r4, r0, lsl #2]
c0de268a:	0a12      	lsrs	r2, r2, #8
c0de268c:	704a      	strb	r2, [r1, #1]
c0de268e:	eb04 0280 	add.w	r2, r4, r0, lsl #2
c0de2692:	3001      	adds	r0, #1
c0de2694:	8852      	ldrh	r2, [r2, #2]
c0de2696:	708a      	strb	r2, [r1, #2]
c0de2698:	e7eb      	b.n	c0de2672 <polyw_pack+0x14>

c0de269a <polyw_unpack>:
c0de269a:	b5b0      	push	{r4, r5, r7, lr}
c0de269c:	2200      	movs	r2, #0
c0de269e:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de26a2:	bf08      	it	eq
c0de26a4:	bdb0      	popeq	{r4, r5, r7, pc}
c0de26a6:	eb02 0342 	add.w	r3, r2, r2, lsl #1
c0de26aa:	5ccc      	ldrb	r4, [r1, r3]
c0de26ac:	440b      	add	r3, r1
c0de26ae:	f840 4022 	str.w	r4, [r0, r2, lsl #2]
c0de26b2:	785d      	ldrb	r5, [r3, #1]
c0de26b4:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de26b8:	f840 4022 	str.w	r4, [r0, r2, lsl #2]
c0de26bc:	789b      	ldrb	r3, [r3, #2]
c0de26be:	ea44 4303 	orr.w	r3, r4, r3, lsl #16
c0de26c2:	f840 3022 	str.w	r3, [r0, r2, lsl #2]
c0de26c6:	3201      	adds	r2, #1
c0de26c8:	e7e9      	b.n	c0de269e <polyw_unpack+0x4>

c0de26ca <polyw_sub>:
c0de26ca:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de26cc:	3102      	adds	r1, #2
c0de26ce:	2300      	movs	r3, #0
c0de26d0:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
c0de26d4:	bf08      	it	eq
c0de26d6:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de26d8:	f811 5c02 	ldrb.w	r5, [r1, #-2]
c0de26dc:	f811 6c01 	ldrb.w	r6, [r1, #-1]
c0de26e0:	f811 7b03 	ldrb.w	r7, [r1], #3
c0de26e4:	f852 4023 	ldr.w	r4, [r2, r3, lsl #2]
c0de26e8:	ea45 2506 	orr.w	r5, r5, r6, lsl #8
c0de26ec:	ea45 4507 	orr.w	r5, r5, r7, lsl #16
c0de26f0:	1b2c      	subs	r4, r5, r4
c0de26f2:	f840 4023 	str.w	r4, [r0, r3, lsl #2]
c0de26f6:	3301      	adds	r3, #1
c0de26f8:	e7ea      	b.n	c0de26d0 <polyw_sub+0x6>

c0de26fa <poly_highbits>:
c0de26fa:	b5b0      	push	{r4, r5, r7, lr}
c0de26fc:	2200      	movs	r2, #0
c0de26fe:	f642 430b 	movw	r3, #11275	@ 0x2c0b
c0de2702:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de2706:	bf08      	it	eq
c0de2708:	bdb0      	popeq	{r4, r5, r7, pc}
c0de270a:	f851 4022 	ldr.w	r4, [r1, r2, lsl #2]
c0de270e:	347f      	adds	r4, #127	@ 0x7f
c0de2710:	11e4      	asrs	r4, r4, #7
c0de2712:	435c      	muls	r4, r3
c0de2714:	f504 0500 	add.w	r5, r4, #8388608	@ 0x800000
c0de2718:	162d      	asrs	r5, r5, #24
c0de271a:	f1b4 5f2e 	cmp.w	r4, #729808896	@ 0x2b800000
c0de271e:	bfa8      	it	ge
c0de2720:	2500      	movge	r5, #0
c0de2722:	f840 5022 	str.w	r5, [r0, r2, lsl #2]
c0de2726:	3201      	adds	r2, #1
c0de2728:	e7eb      	b.n	c0de2702 <poly_highbits+0x8>
	...

c0de272c <poly_lowbits>:
c0de272c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de2730:	4e13      	ldr	r6, [pc, #76]	@ (c0de2780 <poly_lowbits+0x54>)
c0de2732:	4f15      	ldr	r7, [pc, #84]	@ (c0de2788 <poly_lowbits+0x5c>)
c0de2734:	2200      	movs	r2, #0
c0de2736:	f642 4c0b 	movw	ip, #11275	@ 0x2c0b
c0de273a:	f06f 0e01 	mvn.w	lr, #1
c0de273e:	46b0      	mov	r8, r6
c0de2740:	4e10      	ldr	r6, [pc, #64]	@ (c0de2784 <poly_lowbits+0x58>)
c0de2742:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de2746:	bf08      	it	eq
c0de2748:	e8bd 81f0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de274c:	f851 3022 	ldr.w	r3, [r1, r2, lsl #2]
c0de2750:	f103 047f 	add.w	r4, r3, #127	@ 0x7f
c0de2754:	11e4      	asrs	r4, r4, #7
c0de2756:	fb04 f40c 	mul.w	r4, r4, ip
c0de275a:	f504 0500 	add.w	r5, r4, #8388608	@ 0x800000
c0de275e:	f1b4 5f2e 	cmp.w	r4, #729808896	@ 0x2b800000
c0de2762:	4644      	mov	r4, r8
c0de2764:	ea0e 55e5 	and.w	r5, lr, r5, asr #23
c0de2768:	bfb8      	it	lt
c0de276a:	fb05 3308 	mlalt	r3, r5, r8, r3
c0de276e:	42bb      	cmp	r3, r7
c0de2770:	4634      	mov	r4, r6
c0de2772:	bfc8      	it	gt
c0de2774:	4433      	addgt	r3, r6
c0de2776:	f840 3022 	str.w	r3, [r0, r2, lsl #2]
c0de277a:	3201      	adds	r2, #1
c0de277c:	e7e1      	b.n	c0de2742 <poly_lowbits+0x16>
c0de277e:	bf00      	nop
c0de2780:	fffe8c00 	.word	0xfffe8c00
c0de2784:	ff801fff 	.word	0xff801fff
c0de2788:	003ff000 	.word	0x003ff000

c0de278c <unpack_sk_s1>:
c0de278c:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de2790:	eb01 1142 	add.w	r1, r1, r2, lsl #5
c0de2794:	3180      	adds	r1, #128	@ 0x80
c0de2796:	f001 bb18 	b.w	c0de3dca <small_polyeta_unpack>

c0de279a <unpack_sk_s2>:
c0de279a:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de279e:	eb01 1142 	add.w	r1, r1, r2, lsl #5
c0de27a2:	f501 7100 	add.w	r1, r1, #512	@ 0x200
c0de27a6:	f001 bb10 	b.w	c0de3dca <small_polyeta_unpack>
	...

c0de27ac <poly_uniform_pointwise_montgomery_polywadd_lowram>:
c0de27ac:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de27b0:	f8dd 8030 	ldr.w	r8, [sp, #48]	@ 0x30
c0de27b4:	468a      	mov	sl, r1
c0de27b6:	4683      	mov	fp, r0
c0de27b8:	4611      	mov	r1, r2
c0de27ba:	461a      	mov	r2, r3
c0de27bc:	4640      	mov	r0, r8
c0de27be:	f001 fb56 	bl	c0de3e6e <pqcrystals_dilithium2_lowram_dilithium_shake128_stream_init>
c0de27c2:	4c10      	ldr	r4, [pc, #64]	@ (c0de2804 <poly_uniform_pointwise_montgomery_polywadd_lowram+0x58>)
c0de27c4:	2700      	movs	r7, #0
c0de27c6:	f10d 0607 	add.w	r6, sp, #7
c0de27ca:	4630      	mov	r0, r6
c0de27cc:	2109      	movs	r1, #9
c0de27ce:	4642      	mov	r2, r8
c0de27d0:	f7fe fbf7 	bl	c0de0fc2 <pqcrystals_dilithium_fips202_ref_shake128_squeeze>
c0de27d4:	2500      	movs	r5, #0
c0de27d6:	2d08      	cmp	r5, #8
c0de27d8:	bf98      	it	ls
c0de27da:	f5b7 7f80 	cmpls.w	r7, #256	@ 0x100
c0de27de:	d20b      	bcs.n	c0de27f8 <poly_uniform_pointwise_montgomery_polywadd_lowram+0x4c>
c0de27e0:	f000 f9de 	bl	c0de2ba0 <OUTLINED_FUNCTION_0>
c0de27e4:	d806      	bhi.n	c0de27f4 <poly_uniform_pointwise_montgomery_polywadd_lowram+0x48>
c0de27e6:	f85a 1027 	ldr.w	r1, [sl, r7, lsl #2]
c0de27ea:	f000 f9f4 	bl	c0de2bd6 <OUTLINED_FUNCTION_3>
c0de27ee:	f000 f9f6 	bl	c0de2bde <OUTLINED_FUNCTION_4>
c0de27f2:	3701      	adds	r7, #1
c0de27f4:	3503      	adds	r5, #3
c0de27f6:	e7ee      	b.n	c0de27d6 <poly_uniform_pointwise_montgomery_polywadd_lowram+0x2a>
c0de27f8:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de27fc:	bf28      	it	cs
c0de27fe:	e8bd 8dff 	ldmiacs.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de2802:	e7e2      	b.n	c0de27ca <poly_uniform_pointwise_montgomery_polywadd_lowram+0x1e>
c0de2804:	007fe000 	.word	0x007fe000

c0de2808 <polyw_add_idx>:
c0de2808:	b570      	push	{r4, r5, r6, lr}
c0de280a:	4604      	mov	r4, r0
c0de280c:	eb02 0542 	add.w	r5, r2, r2, lsl #1
c0de2810:	1966      	adds	r6, r4, r5
c0de2812:	5d40      	ldrb	r0, [r0, r5]
c0de2814:	7872      	ldrb	r2, [r6, #1]
c0de2816:	78b3      	ldrb	r3, [r6, #2]
c0de2818:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de281c:	ea40 4003 	orr.w	r0, r0, r3, lsl #16
c0de2820:	4408      	add	r0, r1
c0de2822:	f000 fd57 	bl	c0de32d4 <pqcrystals_dilithium2_lowram_freeze>
c0de2826:	0c01      	lsrs	r1, r0, #16
c0de2828:	5560      	strb	r0, [r4, r5]
c0de282a:	0a00      	lsrs	r0, r0, #8
c0de282c:	70b1      	strb	r1, [r6, #2]
c0de282e:	7070      	strb	r0, [r6, #1]
c0de2830:	bd70      	pop	{r4, r5, r6, pc}

c0de2832 <poly_uniform_gamma1_lowram>:
c0de2832:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2834:	b085      	sub	sp, #20
c0de2836:	4605      	mov	r5, r0
c0de2838:	4618      	mov	r0, r3
c0de283a:	461c      	mov	r4, r3
c0de283c:	f001 fb2b 	bl	c0de3e96 <pqcrystals_dilithium2_lowram_dilithium_shake256_stream_init>
c0de2840:	2700      	movs	r7, #0
c0de2842:	ae01      	add	r6, sp, #4
c0de2844:	2f40      	cmp	r7, #64	@ 0x40
c0de2846:	bf04      	itt	eq
c0de2848:	b005      	addeq	sp, #20
c0de284a:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de284c:	4630      	mov	r0, r6
c0de284e:	2109      	movs	r1, #9
c0de2850:	4622      	mov	r2, r4
c0de2852:	f7fe fc9f 	bl	c0de1194 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de2856:	4630      	mov	r0, r6
c0de2858:	f000 f80c 	bl	c0de2874 <polyz_unpack_inplace>
c0de285c:	2000      	movs	r0, #0
c0de285e:	2804      	cmp	r0, #4
c0de2860:	d005      	beq.n	c0de286e <poly_uniform_gamma1_lowram+0x3c>
c0de2862:	f856 1020 	ldr.w	r1, [r6, r0, lsl #2]
c0de2866:	f845 1020 	str.w	r1, [r5, r0, lsl #2]
c0de286a:	3001      	adds	r0, #1
c0de286c:	e7f7      	b.n	c0de285e <poly_uniform_gamma1_lowram+0x2c>
c0de286e:	3510      	adds	r5, #16
c0de2870:	3701      	adds	r7, #1
c0de2872:	e7e7      	b.n	c0de2844 <poly_uniform_gamma1_lowram+0x12>

c0de2874 <polyz_unpack_inplace>:
c0de2874:	b5b0      	push	{r4, r5, r7, lr}
c0de2876:	7801      	ldrb	r1, [r0, #0]
c0de2878:	7883      	ldrb	r3, [r0, #2]
c0de287a:	7842      	ldrb	r2, [r0, #1]
c0de287c:	78c4      	ldrb	r4, [r0, #3]
c0de287e:	7a05      	ldrb	r5, [r0, #8]
c0de2880:	f363 4111 	bfi	r1, r3, #16, #2
c0de2884:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de2888:	79c2      	ldrb	r2, [r0, #7]
c0de288a:	f5c1 3100 	rsb	r1, r1, #131072	@ 0x20000
c0de288e:	6001      	str	r1, [r0, #0]
c0de2890:	7981      	ldrb	r1, [r0, #6]
c0de2892:	0092      	lsls	r2, r2, #2
c0de2894:	ea42 1291 	orr.w	r2, r2, r1, lsr #6
c0de2898:	f001 013f 	and.w	r1, r1, #63	@ 0x3f
c0de289c:	ea42 2285 	orr.w	r2, r2, r5, lsl #10
c0de28a0:	7945      	ldrb	r5, [r0, #5]
c0de28a2:	f5c2 3200 	rsb	r2, r2, #131072	@ 0x20000
c0de28a6:	60c2      	str	r2, [r0, #12]
c0de28a8:	7902      	ldrb	r2, [r0, #4]
c0de28aa:	012d      	lsls	r5, r5, #4
c0de28ac:	ea45 1512 	orr.w	r5, r5, r2, lsr #4
c0de28b0:	ea45 3101 	orr.w	r1, r5, r1, lsl #12
c0de28b4:	f5c1 3100 	rsb	r1, r1, #131072	@ 0x20000
c0de28b8:	6081      	str	r1, [r0, #8]
c0de28ba:	0899      	lsrs	r1, r3, #2
c0de28bc:	f362 3191 	bfi	r1, r2, #14, #4
c0de28c0:	ea41 1184 	orr.w	r1, r1, r4, lsl #6
c0de28c4:	f5c1 3100 	rsb	r1, r1, #131072	@ 0x20000
c0de28c8:	6041      	str	r1, [r0, #4]
c0de28ca:	bdb0      	pop	{r4, r5, r7, pc}

c0de28cc <poly_uniform_gamma1_add_lowram>:
c0de28cc:	e92d 41ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
c0de28d0:	f8dd 8028 	ldr.w	r8, [sp, #40]	@ 0x28
c0de28d4:	460c      	mov	r4, r1
c0de28d6:	4605      	mov	r5, r0
c0de28d8:	4611      	mov	r1, r2
c0de28da:	461a      	mov	r2, r3
c0de28dc:	4640      	mov	r0, r8
c0de28de:	f001 fada 	bl	c0de3e96 <pqcrystals_dilithium2_lowram_dilithium_shake256_stream_init>
c0de28e2:	2600      	movs	r6, #0
c0de28e4:	466f      	mov	r7, sp
c0de28e6:	2e40      	cmp	r6, #64	@ 0x40
c0de28e8:	bf08      	it	eq
c0de28ea:	e8bd 81ff 	ldmiaeq.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, pc}
c0de28ee:	4638      	mov	r0, r7
c0de28f0:	2109      	movs	r1, #9
c0de28f2:	4642      	mov	r2, r8
c0de28f4:	f7fe fc4e 	bl	c0de1194 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de28f8:	4638      	mov	r0, r7
c0de28fa:	f7ff ffbb 	bl	c0de2874 <polyz_unpack_inplace>
c0de28fe:	2000      	movs	r0, #0
c0de2900:	2804      	cmp	r0, #4
c0de2902:	d002      	beq.n	c0de290a <poly_uniform_gamma1_add_lowram+0x3e>
c0de2904:	f000 f958 	bl	c0de2bb8 <OUTLINED_FUNCTION_1>
c0de2908:	e7fa      	b.n	c0de2900 <poly_uniform_gamma1_add_lowram+0x34>
c0de290a:	3410      	adds	r4, #16
c0de290c:	3510      	adds	r5, #16
c0de290e:	3601      	adds	r6, #1
c0de2910:	e7e9      	b.n	c0de28e6 <poly_uniform_gamma1_add_lowram+0x1a>
	...

c0de2914 <poly_make_hint_lowram>:
c0de2914:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de2918:	4686      	mov	lr, r0
c0de291a:	481a      	ldr	r0, [pc, #104]	@ (c0de2984 <poly_make_hint_lowram+0x70>)
c0de291c:	1c93      	adds	r3, r2, #2
c0de291e:	468c      	mov	ip, r1
c0de2920:	2200      	movs	r2, #0
c0de2922:	f642 450b 	movw	r5, #11275	@ 0x2c0b
c0de2926:	2600      	movs	r6, #0
c0de2928:	4680      	mov	r8, r0
c0de292a:	f5b6 7f80 	cmp.w	r6, #256	@ 0x100
c0de292e:	d026      	beq.n	c0de297e <poly_make_hint_lowram+0x6a>
c0de2930:	f813 4c02 	ldrb.w	r4, [r3, #-2]
c0de2934:	f813 1c01 	ldrb.w	r1, [r3, #-1]
c0de2938:	f813 0b03 	ldrb.w	r0, [r3], #3
c0de293c:	f85c 7026 	ldr.w	r7, [ip, r6, lsl #2]
c0de2940:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
c0de2944:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de2948:	307f      	adds	r0, #127	@ 0x7f
c0de294a:	19c1      	adds	r1, r0, r7
c0de294c:	4647      	mov	r7, r8
c0de294e:	11c9      	asrs	r1, r1, #7
c0de2950:	4369      	muls	r1, r5
c0de2952:	f501 0400 	add.w	r4, r1, #8388608	@ 0x800000
c0de2956:	1624      	asrs	r4, r4, #24
c0de2958:	4541      	cmp	r1, r8
c0de295a:	bfc8      	it	gt
c0de295c:	2400      	movgt	r4, #0
c0de295e:	09c0      	lsrs	r0, r0, #7
c0de2960:	4368      	muls	r0, r5
c0de2962:	f500 0100 	add.w	r1, r0, #8388608	@ 0x800000
c0de2966:	0e09      	lsrs	r1, r1, #24
c0de2968:	4540      	cmp	r0, r8
c0de296a:	bf88      	it	hi
c0de296c:	2100      	movhi	r1, #0
c0de296e:	1a60      	subs	r0, r4, r1
c0de2970:	bf18      	it	ne
c0de2972:	2001      	movne	r0, #1
c0de2974:	f84e 0026 	str.w	r0, [lr, r6, lsl #2]
c0de2978:	4402      	add	r2, r0
c0de297a:	3601      	adds	r6, #1
c0de297c:	e7d5      	b.n	c0de292a <poly_make_hint_lowram+0x16>
c0de297e:	4610      	mov	r0, r2
c0de2980:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de2984:	2b7fffff 	.word	0x2b7fffff

c0de2988 <unpack_sig_h_indices>:
c0de2988:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de298c:	f503 6c12 	add.w	ip, r3, #2336	@ 0x920
c0de2990:	b142      	cbz	r2, c0de29a4 <unpack_sig_h_indices+0x1c>
c0de2992:	eb02 0e0c 	add.w	lr, r2, ip
c0de2996:	f81e 6f50 	ldrb.w	r6, [lr, #80]!
c0de299a:	f81e 5c01 	ldrb.w	r5, [lr, #-1]
c0de299e:	42b5      	cmp	r5, r6
c0de29a0:	d905      	bls.n	c0de29ae <unpack_sig_h_indices+0x26>
c0de29a2:	e006      	b.n	c0de29b2 <unpack_sig_h_indices+0x2a>
c0de29a4:	f893 6970 	ldrb.w	r6, [r3, #2416]	@ 0x970
c0de29a8:	f503 6e17 	add.w	lr, r3, #2416	@ 0x970
c0de29ac:	2500      	movs	r5, #0
c0de29ae:	2e50      	cmp	r6, #80	@ 0x50
c0de29b0:	d902      	bls.n	c0de29b8 <unpack_sig_h_indices+0x30>
c0de29b2:	2001      	movs	r0, #1
c0de29b4:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de29b8:	eb03 0805 	add.w	r8, r3, r5
c0de29bc:	2700      	movs	r7, #0
c0de29be:	19ea      	adds	r2, r5, r7
c0de29c0:	42b2      	cmp	r2, r6
c0de29c2:	d20e      	bcs.n	c0de29e2 <unpack_sig_h_indices+0x5a>
c0de29c4:	eb08 0407 	add.w	r4, r8, r7
c0de29c8:	42aa      	cmp	r2, r5
c0de29ca:	f894 6920 	ldrb.w	r6, [r4, #2336]	@ 0x920
c0de29ce:	d903      	bls.n	c0de29d8 <unpack_sig_h_indices+0x50>
c0de29d0:	f894 291f 	ldrb.w	r2, [r4, #2335]	@ 0x91f
c0de29d4:	4296      	cmp	r6, r2
c0de29d6:	d9ec      	bls.n	c0de29b2 <unpack_sig_h_indices+0x2a>
c0de29d8:	55c6      	strb	r6, [r0, r7]
c0de29da:	3701      	adds	r7, #1
c0de29dc:	f89e 6000 	ldrb.w	r6, [lr]
c0de29e0:	e7ed      	b.n	c0de29be <unpack_sig_h_indices+0x36>
c0de29e2:	600f      	str	r7, [r1, #0]
c0de29e4:	f893 0973 	ldrb.w	r0, [r3, #2419]	@ 0x973
c0de29e8:	4601      	mov	r1, r0
c0de29ea:	284f      	cmp	r0, #79	@ 0x4f
c0de29ec:	d804      	bhi.n	c0de29f8 <unpack_sig_h_indices+0x70>
c0de29ee:	f81c 2001 	ldrb.w	r2, [ip, r1]
c0de29f2:	1c48      	adds	r0, r1, #1
c0de29f4:	2a00      	cmp	r2, #0
c0de29f6:	d0f7      	beq.n	c0de29e8 <unpack_sig_h_indices+0x60>
c0de29f8:	2000      	movs	r0, #0
c0de29fa:	2950      	cmp	r1, #80	@ 0x50
c0de29fc:	bf38      	it	cc
c0de29fe:	2001      	movcc	r0, #1
c0de2a00:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0de2a04 <poly_use_hint_lowram>:
c0de2a04:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de2a08:	4698      	mov	r8, r3
c0de2a0a:	4615      	mov	r5, r2
c0de2a0c:	460e      	mov	r6, r1
c0de2a0e:	4607      	mov	r7, r0
c0de2a10:	2400      	movs	r4, #0
c0de2a12:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de2a16:	bf08      	it	eq
c0de2a18:	e8bd 81f0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de2a1c:	4628      	mov	r0, r5
c0de2a1e:	4641      	mov	r1, r8
c0de2a20:	b131      	cbz	r1, c0de2a30 <poly_use_hint_lowram+0x2c>
c0de2a22:	f810 2b01 	ldrb.w	r2, [r0], #1
c0de2a26:	3901      	subs	r1, #1
c0de2a28:	4294      	cmp	r4, r2
c0de2a2a:	d1f9      	bne.n	c0de2a20 <poly_use_hint_lowram+0x1c>
c0de2a2c:	2101      	movs	r1, #1
c0de2a2e:	e000      	b.n	c0de2a32 <poly_use_hint_lowram+0x2e>
c0de2a30:	2100      	movs	r1, #0
c0de2a32:	f856 0024 	ldr.w	r0, [r6, r4, lsl #2]
c0de2a36:	f000 fc87 	bl	c0de3348 <pqcrystals_dilithium2_lowram_use_hint>
c0de2a3a:	f847 0024 	str.w	r0, [r7, r4, lsl #2]
c0de2a3e:	3401      	adds	r4, #1
c0de2a40:	e7e7      	b.n	c0de2a12 <poly_use_hint_lowram+0xe>

c0de2a42 <pack_pk_rho>:
c0de2a42:	2200      	movs	r2, #0
c0de2a44:	2a20      	cmp	r2, #32
c0de2a46:	bf08      	it	eq
c0de2a48:	4770      	bxeq	lr
c0de2a4a:	5c8b      	ldrb	r3, [r1, r2]
c0de2a4c:	5483      	strb	r3, [r0, r2]
c0de2a4e:	3201      	adds	r2, #1
c0de2a50:	e7f8      	b.n	c0de2a44 <pack_pk_rho+0x2>

c0de2a52 <pack_pk_t1>:
c0de2a52:	eb02 0282 	add.w	r2, r2, r2, lsl #2
c0de2a56:	eb00 1082 	add.w	r0, r0, r2, lsl #6
c0de2a5a:	3020      	adds	r0, #32
c0de2a5c:	f000 bb42 	b.w	c0de30e4 <pqcrystals_dilithium2_lowram_polyt1_pack>

c0de2a60 <pack_sk_s1>:
c0de2a60:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de2a64:	eb00 1042 	add.w	r0, r0, r2, lsl #5
c0de2a68:	3080      	adds	r0, #128	@ 0x80
c0de2a6a:	f000 bafd 	b.w	c0de3068 <pqcrystals_dilithium2_lowram_polyeta_pack>

c0de2a6e <pack_sk_s2>:
c0de2a6e:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de2a72:	eb00 1042 	add.w	r0, r0, r2, lsl #5
c0de2a76:	f500 7000 	add.w	r0, r0, #512	@ 0x200
c0de2a7a:	f000 baf5 	b.w	c0de3068 <pqcrystals_dilithium2_lowram_polyeta_pack>

c0de2a7e <pack_sk_t0>:
c0de2a7e:	f44f 73d0 	mov.w	r3, #416	@ 0x1a0
c0de2a82:	fb02 0003 	mla	r0, r2, r3, r0
c0de2a86:	f500 7060 	add.w	r0, r0, #896	@ 0x380
c0de2a8a:	f000 bb4f 	b.w	c0de312c <pqcrystals_dilithium2_lowram_polyt0_pack>

c0de2a8e <pack_sk_rho>:
c0de2a8e:	2200      	movs	r2, #0
c0de2a90:	2a20      	cmp	r2, #32
c0de2a92:	bf08      	it	eq
c0de2a94:	4770      	bxeq	lr
c0de2a96:	5c8b      	ldrb	r3, [r1, r2]
c0de2a98:	5483      	strb	r3, [r0, r2]
c0de2a9a:	3201      	adds	r2, #1
c0de2a9c:	e7f8      	b.n	c0de2a90 <pack_sk_rho+0x2>

c0de2a9e <pack_sk_key>:
c0de2a9e:	3020      	adds	r0, #32
c0de2aa0:	2200      	movs	r2, #0
c0de2aa2:	2a20      	cmp	r2, #32
c0de2aa4:	bf08      	it	eq
c0de2aa6:	4770      	bxeq	lr
c0de2aa8:	5c8b      	ldrb	r3, [r1, r2]
c0de2aaa:	5483      	strb	r3, [r0, r2]
c0de2aac:	3201      	adds	r2, #1
c0de2aae:	e7f8      	b.n	c0de2aa2 <pack_sk_key+0x4>

c0de2ab0 <pack_sk_tr>:
c0de2ab0:	3040      	adds	r0, #64	@ 0x40
c0de2ab2:	2200      	movs	r2, #0
c0de2ab4:	2a40      	cmp	r2, #64	@ 0x40
c0de2ab6:	bf08      	it	eq
c0de2ab8:	4770      	bxeq	lr
c0de2aba:	5c8b      	ldrb	r3, [r1, r2]
c0de2abc:	5483      	strb	r3, [r0, r2]
c0de2abe:	3201      	adds	r2, #1
c0de2ac0:	e7f8      	b.n	c0de2ab4 <pack_sk_tr+0x4>

c0de2ac2 <poly_challenge_lowram>:
c0de2ac2:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2ac6:	b0b6      	sub	sp, #216	@ 0xd8
c0de2ac8:	466e      	mov	r6, sp
c0de2aca:	4680      	mov	r8, r0
c0de2acc:	460d      	mov	r5, r1
c0de2ace:	4630      	mov	r0, r6
c0de2ad0:	f7fe fb42 	bl	c0de1158 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de2ad4:	4630      	mov	r0, r6
c0de2ad6:	4629      	mov	r1, r5
c0de2ad8:	2220      	movs	r2, #32
c0de2ada:	f7fe fb45 	bl	c0de1168 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de2ade:	4630      	mov	r0, r6
c0de2ae0:	f7fe fb4d 	bl	c0de117e <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de2ae4:	ad34      	add	r5, sp, #208	@ 0xd0
c0de2ae6:	2108      	movs	r1, #8
c0de2ae8:	4632      	mov	r2, r6
c0de2aea:	4628      	mov	r0, r5
c0de2aec:	f7fe fb52 	bl	c0de1194 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de2af0:	2600      	movs	r6, #0
c0de2af2:	462c      	mov	r4, r5
c0de2af4:	2700      	movs	r7, #0
c0de2af6:	f04f 0a00 	mov.w	sl, #0
c0de2afa:	2e40      	cmp	r6, #64	@ 0x40
c0de2afc:	d00a      	beq.n	c0de2b14 <poly_challenge_lowram+0x52>
c0de2afe:	f814 0b01 	ldrb.w	r0, [r4], #1
c0de2b02:	2100      	movs	r1, #0
c0de2b04:	4632      	mov	r2, r6
c0de2b06:	f009 fb7f 	bl	c0dec208 <__aeabi_llsl>
c0de2b0a:	ea4a 0a01 	orr.w	sl, sl, r1
c0de2b0e:	4307      	orrs	r7, r0
c0de2b10:	3608      	adds	r6, #8
c0de2b12:	e7f2      	b.n	c0de2afa <poly_challenge_lowram+0x38>
c0de2b14:	2000      	movs	r0, #0
c0de2b16:	2100      	movs	r1, #0
c0de2b18:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de2b1c:	d003      	beq.n	c0de2b26 <poly_challenge_lowram+0x64>
c0de2b1e:	f848 0021 	str.w	r0, [r8, r1, lsl #2]
c0de2b22:	3101      	adds	r1, #1
c0de2b24:	e7f8      	b.n	c0de2b18 <poly_challenge_lowram+0x56>
c0de2b26:	2008      	movs	r0, #8
c0de2b28:	24d9      	movs	r4, #217	@ 0xd9
c0de2b2a:	466e      	mov	r6, sp
c0de2b2c:	f04f 0b02 	mov.w	fp, #2
c0de2b30:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de2b34:	d01b      	beq.n	c0de2b6e <poly_challenge_lowram+0xac>
c0de2b36:	2808      	cmp	r0, #8
c0de2b38:	d305      	bcc.n	c0de2b46 <poly_challenge_lowram+0x84>
c0de2b3a:	4628      	mov	r0, r5
c0de2b3c:	2108      	movs	r1, #8
c0de2b3e:	4632      	mov	r2, r6
c0de2b40:	f7fe fb28 	bl	c0de1194 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de2b44:	2000      	movs	r0, #0
c0de2b46:	5c29      	ldrb	r1, [r5, r0]
c0de2b48:	3001      	adds	r0, #1
c0de2b4a:	428c      	cmp	r4, r1
c0de2b4c:	d3f3      	bcc.n	c0de2b36 <poly_challenge_lowram+0x74>
c0de2b4e:	f858 2021 	ldr.w	r2, [r8, r1, lsl #2]
c0de2b52:	ea5f 0a5a 	movs.w	sl, sl, lsr #1
c0de2b56:	f848 2024 	str.w	r2, [r8, r4, lsl #2]
c0de2b5a:	ea0b 0247 	and.w	r2, fp, r7, lsl #1
c0de2b5e:	ea4f 0737 	mov.w	r7, r7, rrx
c0de2b62:	3401      	adds	r4, #1
c0de2b64:	f1c2 0201 	rsb	r2, r2, #1
c0de2b68:	f848 2021 	str.w	r2, [r8, r1, lsl #2]
c0de2b6c:	e7e0      	b.n	c0de2b30 <poly_challenge_lowram+0x6e>
c0de2b6e:	b036      	add	sp, #216	@ 0xd8
c0de2b70:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de2b74 <pqcrystals_dilithium2_lowram_poly_pointwise_acc_montgomery>:
c0de2b74:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de2b76:	4614      	mov	r4, r2
c0de2b78:	460d      	mov	r5, r1
c0de2b7a:	4606      	mov	r6, r0
c0de2b7c:	2700      	movs	r7, #0
c0de2b7e:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de2b82:	bf08      	it	eq
c0de2b84:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de2b86:	f855 0027 	ldr.w	r0, [r5, r7, lsl #2]
c0de2b8a:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
c0de2b8e:	f000 f822 	bl	c0de2bd6 <OUTLINED_FUNCTION_3>
c0de2b92:	f856 1027 	ldr.w	r1, [r6, r7, lsl #2]
c0de2b96:	4408      	add	r0, r1
c0de2b98:	f846 0027 	str.w	r0, [r6, r7, lsl #2]
c0de2b9c:	3701      	adds	r7, #1
c0de2b9e:	e7ee      	b.n	c0de2b7e <pqcrystals_dilithium2_lowram_poly_pointwise_acc_montgomery+0xa>

c0de2ba0 <OUTLINED_FUNCTION_0>:
c0de2ba0:	1971      	adds	r1, r6, r5
c0de2ba2:	5d70      	ldrb	r0, [r6, r5]
c0de2ba4:	784a      	ldrb	r2, [r1, #1]
c0de2ba6:	7889      	ldrb	r1, [r1, #2]
c0de2ba8:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de2bac:	f001 017f 	and.w	r1, r1, #127	@ 0x7f
c0de2bb0:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de2bb4:	42a0      	cmp	r0, r4
c0de2bb6:	4770      	bx	lr

c0de2bb8 <OUTLINED_FUNCTION_1>:
c0de2bb8:	f857 1020 	ldr.w	r1, [r7, r0, lsl #2]
c0de2bbc:	f854 2020 	ldr.w	r2, [r4, r0, lsl #2]
c0de2bc0:	4411      	add	r1, r2
c0de2bc2:	f845 1020 	str.w	r1, [r5, r0, lsl #2]
c0de2bc6:	3001      	adds	r0, #1
c0de2bc8:	4770      	bx	lr

c0de2bca <OUTLINED_FUNCTION_2>:
c0de2bca:	f815 0b01 	ldrb.w	r0, [r5], #1
c0de2bce:	2100      	movs	r1, #0
c0de2bd0:	463a      	mov	r2, r7
c0de2bd2:	f009 bb19 	b.w	c0dec208 <__aeabi_llsl>

c0de2bd6 <OUTLINED_FUNCTION_3>:
c0de2bd6:	fb81 0100 	smull	r0, r1, r1, r0
c0de2bda:	f000 bb5d 	b.w	c0de3298 <pqcrystals_dilithium2_lowram_montgomery_reduce>

c0de2bde <OUTLINED_FUNCTION_4>:
c0de2bde:	4601      	mov	r1, r0
c0de2be0:	4658      	mov	r0, fp
c0de2be2:	463a      	mov	r2, r7
c0de2be4:	f7ff be10 	b.w	c0de2808 <polyw_add_idx>

c0de2be8 <pqcrystals_dilithium2_lowram_ntt>:
c0de2be8:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de2bec:	4604      	mov	r4, r0
c0de2bee:	4817      	ldr	r0, [pc, #92]	@ (c0de2c4c <pqcrystals_dilithium2_lowram_ntt+0x64>)
c0de2bf0:	f04f 0880 	mov.w	r8, #128	@ 0x80
c0de2bf4:	f04f 0a00 	mov.w	sl, #0
c0de2bf8:	4478      	add	r0, pc
c0de2bfa:	9001      	str	r0, [sp, #4]
c0de2bfc:	f1b8 0f00 	cmp.w	r8, #0
c0de2c00:	bf08      	it	eq
c0de2c02:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de2c06:	2700      	movs	r7, #0
c0de2c08:	2fff      	cmp	r7, #255	@ 0xff
c0de2c0a:	d81c      	bhi.n	c0de2c46 <pqcrystals_dilithium2_lowram_ntt+0x5e>
c0de2c0c:	9801      	ldr	r0, [sp, #4]
c0de2c0e:	f10a 0a01 	add.w	sl, sl, #1
c0de2c12:	eb07 0608 	add.w	r6, r7, r8
c0de2c16:	4635      	mov	r5, r6
c0de2c18:	f850 b02a 	ldr.w	fp, [r0, sl, lsl #2]
c0de2c1c:	42b7      	cmp	r7, r6
c0de2c1e:	d210      	bcs.n	c0de2c42 <pqcrystals_dilithium2_lowram_ntt+0x5a>
c0de2c20:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de2c24:	fb80 010b 	smull	r0, r1, r0, fp
c0de2c28:	f000 fb36 	bl	c0de3298 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de2c2c:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
c0de2c30:	180a      	adds	r2, r1, r0
c0de2c32:	1a08      	subs	r0, r1, r0
c0de2c34:	f844 2027 	str.w	r2, [r4, r7, lsl #2]
c0de2c38:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de2c3c:	3501      	adds	r5, #1
c0de2c3e:	3701      	adds	r7, #1
c0de2c40:	e7ec      	b.n	c0de2c1c <pqcrystals_dilithium2_lowram_ntt+0x34>
c0de2c42:	462f      	mov	r7, r5
c0de2c44:	e7e0      	b.n	c0de2c08 <pqcrystals_dilithium2_lowram_ntt+0x20>
c0de2c46:	ea4f 0858 	mov.w	r8, r8, lsr #1
c0de2c4a:	e7d7      	b.n	c0de2bfc <pqcrystals_dilithium2_lowram_ntt+0x14>
c0de2c4c:	0000c68c 	.word	0x0000c68c

c0de2c50 <pqcrystals_dilithium2_lowram_invntt_tomont>:
c0de2c50:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de2c54:	4604      	mov	r4, r0
c0de2c56:	4822      	ldr	r0, [pc, #136]	@ (c0de2ce0 <pqcrystals_dilithium2_lowram_invntt_tomont+0x90>)
c0de2c58:	f04f 0801 	mov.w	r8, #1
c0de2c5c:	f44f 7a80 	mov.w	sl, #256	@ 0x100
c0de2c60:	4478      	add	r0, pc
c0de2c62:	9001      	str	r0, [sp, #4]
c0de2c64:	f1b8 0fff 	cmp.w	r8, #255	@ 0xff
c0de2c68:	d828      	bhi.n	c0de2cbc <pqcrystals_dilithium2_lowram_invntt_tomont+0x6c>
c0de2c6a:	2700      	movs	r7, #0
c0de2c6c:	2fff      	cmp	r7, #255	@ 0xff
c0de2c6e:	d822      	bhi.n	c0de2cb6 <pqcrystals_dilithium2_lowram_invntt_tomont+0x66>
c0de2c70:	9801      	ldr	r0, [sp, #4]
c0de2c72:	f1aa 0a01 	sub.w	sl, sl, #1
c0de2c76:	eb07 0608 	add.w	r6, r7, r8
c0de2c7a:	4635      	mov	r5, r6
c0de2c7c:	f850 002a 	ldr.w	r0, [r0, sl, lsl #2]
c0de2c80:	f1c0 0b00 	rsb	fp, r0, #0
c0de2c84:	42b7      	cmp	r7, r6
c0de2c86:	d214      	bcs.n	c0de2cb2 <pqcrystals_dilithium2_lowram_invntt_tomont+0x62>
c0de2c88:	f854 0027 	ldr.w	r0, [r4, r7, lsl #2]
c0de2c8c:	f854 1025 	ldr.w	r1, [r4, r5, lsl #2]
c0de2c90:	4401      	add	r1, r0
c0de2c92:	f844 1027 	str.w	r1, [r4, r7, lsl #2]
c0de2c96:	f854 1025 	ldr.w	r1, [r4, r5, lsl #2]
c0de2c9a:	1a40      	subs	r0, r0, r1
c0de2c9c:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de2ca0:	fb80 010b 	smull	r0, r1, r0, fp
c0de2ca4:	f000 faf8 	bl	c0de3298 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de2ca8:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de2cac:	3501      	adds	r5, #1
c0de2cae:	3701      	adds	r7, #1
c0de2cb0:	e7e8      	b.n	c0de2c84 <pqcrystals_dilithium2_lowram_invntt_tomont+0x34>
c0de2cb2:	462f      	mov	r7, r5
c0de2cb4:	e7da      	b.n	c0de2c6c <pqcrystals_dilithium2_lowram_invntt_tomont+0x1c>
c0de2cb6:	ea4f 0848 	mov.w	r8, r8, lsl #1
c0de2cba:	e7d3      	b.n	c0de2c64 <pqcrystals_dilithium2_lowram_invntt_tomont+0x14>
c0de2cbc:	2500      	movs	r5, #0
c0de2cbe:	f24a 36fa 	movw	r6, #41978	@ 0xa3fa
c0de2cc2:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
c0de2cc6:	bf08      	it	eq
c0de2cc8:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de2ccc:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de2cd0:	fb80 0106 	smull	r0, r1, r0, r6
c0de2cd4:	f000 fae0 	bl	c0de3298 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de2cd8:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de2cdc:	3501      	adds	r5, #1
c0de2cde:	e7f0      	b.n	c0de2cc2 <pqcrystals_dilithium2_lowram_invntt_tomont+0x72>
c0de2ce0:	0000c624 	.word	0x0000c624

c0de2ce4 <pqcrystals_dilithium2_lowram_poly_reduce>:
c0de2ce4:	b5b0      	push	{r4, r5, r7, lr}
c0de2ce6:	4604      	mov	r4, r0
c0de2ce8:	2500      	movs	r5, #0
c0de2cea:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
c0de2cee:	bf08      	it	eq
c0de2cf0:	bdb0      	popeq	{r4, r5, r7, pc}
c0de2cf2:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de2cf6:	f000 fadb 	bl	c0de32b0 <pqcrystals_dilithium2_lowram_reduce32>
c0de2cfa:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de2cfe:	3501      	adds	r5, #1
c0de2d00:	e7f3      	b.n	c0de2cea <pqcrystals_dilithium2_lowram_poly_reduce+0x6>

c0de2d02 <pqcrystals_dilithium2_lowram_poly_caddq>:
c0de2d02:	b5b0      	push	{r4, r5, r7, lr}
c0de2d04:	4604      	mov	r4, r0
c0de2d06:	2500      	movs	r5, #0
c0de2d08:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
c0de2d0c:	bf08      	it	eq
c0de2d0e:	bdb0      	popeq	{r4, r5, r7, pc}
c0de2d10:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de2d14:	f000 fad6 	bl	c0de32c4 <pqcrystals_dilithium2_lowram_caddq>
c0de2d18:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de2d1c:	3501      	adds	r5, #1
c0de2d1e:	e7f3      	b.n	c0de2d08 <pqcrystals_dilithium2_lowram_poly_caddq+0x6>

c0de2d20 <pqcrystals_dilithium2_lowram_poly_add>:
c0de2d20:	b5b0      	push	{r4, r5, r7, lr}
c0de2d22:	2300      	movs	r3, #0
c0de2d24:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
c0de2d28:	bf08      	it	eq
c0de2d2a:	bdb0      	popeq	{r4, r5, r7, pc}
c0de2d2c:	f851 4023 	ldr.w	r4, [r1, r3, lsl #2]
c0de2d30:	f852 5023 	ldr.w	r5, [r2, r3, lsl #2]
c0de2d34:	442c      	add	r4, r5
c0de2d36:	f840 4023 	str.w	r4, [r0, r3, lsl #2]
c0de2d3a:	3301      	adds	r3, #1
c0de2d3c:	e7f2      	b.n	c0de2d24 <pqcrystals_dilithium2_lowram_poly_add+0x4>

c0de2d3e <pqcrystals_dilithium2_lowram_poly_ntt>:
c0de2d3e:	f7ff bf53 	b.w	c0de2be8 <pqcrystals_dilithium2_lowram_ntt>

c0de2d42 <pqcrystals_dilithium2_lowram_poly_invntt_tomont>:
c0de2d42:	f7ff bf85 	b.w	c0de2c50 <pqcrystals_dilithium2_lowram_invntt_tomont>

c0de2d46 <pqcrystals_dilithium2_lowram_poly_pointwise_montgomery>:
c0de2d46:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de2d48:	f000 fa99 	bl	c0de327e <OUTLINED_FUNCTION_0>
c0de2d4c:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de2d50:	bf08      	it	eq
c0de2d52:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de2d54:	f855 0027 	ldr.w	r0, [r5, r7, lsl #2]
c0de2d58:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
c0de2d5c:	fb81 0100 	smull	r0, r1, r1, r0
c0de2d60:	f000 fa9a 	bl	c0de3298 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de2d64:	f846 0027 	str.w	r0, [r6, r7, lsl #2]
c0de2d68:	3701      	adds	r7, #1
c0de2d6a:	e7ef      	b.n	c0de2d4c <pqcrystals_dilithium2_lowram_poly_pointwise_montgomery+0x6>

c0de2d6c <pqcrystals_dilithium2_lowram_poly_power2round>:
c0de2d6c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de2d6e:	f000 fa86 	bl	c0de327e <OUTLINED_FUNCTION_0>
c0de2d72:	f5b7 6f80 	cmp.w	r7, #1024	@ 0x400
c0de2d76:	bf08      	it	eq
c0de2d78:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de2d7a:	59e1      	ldr	r1, [r4, r7]
c0de2d7c:	19e8      	adds	r0, r5, r7
c0de2d7e:	f000 fab9 	bl	c0de32f4 <pqcrystals_dilithium2_lowram_power2round>
c0de2d82:	51f0      	str	r0, [r6, r7]
c0de2d84:	3704      	adds	r7, #4
c0de2d86:	e7f4      	b.n	c0de2d72 <pqcrystals_dilithium2_lowram_poly_power2round+0x6>

c0de2d88 <pqcrystals_dilithium2_lowram_poly_chknorm>:
c0de2d88:	4a09      	ldr	r2, [pc, #36]	@ (c0de2db0 <pqcrystals_dilithium2_lowram_poly_chknorm+0x28>)
c0de2d8a:	4291      	cmp	r1, r2
c0de2d8c:	dc0e      	bgt.n	c0de2dac <pqcrystals_dilithium2_lowram_poly_chknorm+0x24>
c0de2d8e:	2200      	movs	r2, #0
c0de2d90:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de2d94:	bf04      	itt	eq
c0de2d96:	2000      	moveq	r0, #0
c0de2d98:	4770      	bxeq	lr
c0de2d9a:	f850 3022 	ldr.w	r3, [r0, r2, lsl #2]
c0de2d9e:	2b00      	cmp	r3, #0
c0de2da0:	bf48      	it	mi
c0de2da2:	eba3 0343 	submi.w	r3, r3, r3, lsl #1
c0de2da6:	3201      	adds	r2, #1
c0de2da8:	428b      	cmp	r3, r1
c0de2daa:	dbf1      	blt.n	c0de2d90 <pqcrystals_dilithium2_lowram_poly_chknorm+0x8>
c0de2dac:	2001      	movs	r0, #1
c0de2dae:	4770      	bx	lr
c0de2db0:	000ffc00 	.word	0x000ffc00

c0de2db4 <pqcrystals_dilithium2_lowram_poly_uniform>:
c0de2db4:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2db8:	f5ad 6d84 	sub.w	sp, sp, #1056	@ 0x420
c0de2dbc:	46e8      	mov	r8, sp
c0de2dbe:	4683      	mov	fp, r0
c0de2dc0:	4640      	mov	r0, r8
c0de2dc2:	f001 f854 	bl	c0de3e6e <pqcrystals_dilithium2_lowram_dilithium_shake128_stream_init>
c0de2dc6:	f10d 06d6 	add.w	r6, sp, #214	@ 0xd6
c0de2dca:	2105      	movs	r1, #5
c0de2dcc:	4642      	mov	r2, r8
c0de2dce:	4630      	mov	r0, r6
c0de2dd0:	f7fe f99f 	bl	c0de1112 <pqcrystals_dilithium_fips202_ref_shake128_squeezeblocks>
c0de2dd4:	4658      	mov	r0, fp
c0de2dd6:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de2dda:	4632      	mov	r2, r6
c0de2ddc:	f44f 7352 	mov.w	r3, #840	@ 0x348
c0de2de0:	f44f 7552 	mov.w	r5, #840	@ 0x348
c0de2de4:	f000 f828 	bl	c0de2e38 <rej_uniform>
c0de2de8:	4607      	mov	r7, r0
c0de2dea:	f04f 0a03 	mov.w	sl, #3
c0de2dee:	2fff      	cmp	r7, #255	@ 0xff
c0de2df0:	d81d      	bhi.n	c0de2e2e <pqcrystals_dilithium2_lowram_poly_uniform+0x7a>
c0de2df2:	fbb5 f0fa 	udiv	r0, r5, sl
c0de2df6:	4631      	mov	r1, r6
c0de2df8:	eb00 0040 	add.w	r0, r0, r0, lsl #1
c0de2dfc:	1a2c      	subs	r4, r5, r0
c0de2dfe:	42a8      	cmp	r0, r5
c0de2e00:	d004      	beq.n	c0de2e0c <pqcrystals_dilithium2_lowram_poly_uniform+0x58>
c0de2e02:	5c0a      	ldrb	r2, [r1, r0]
c0de2e04:	3d01      	subs	r5, #1
c0de2e06:	700a      	strb	r2, [r1, #0]
c0de2e08:	3101      	adds	r1, #1
c0de2e0a:	e7f8      	b.n	c0de2dfe <pqcrystals_dilithium2_lowram_poly_uniform+0x4a>
c0de2e0c:	1930      	adds	r0, r6, r4
c0de2e0e:	2101      	movs	r1, #1
c0de2e10:	4642      	mov	r2, r8
c0de2e12:	f7fe f97e 	bl	c0de1112 <pqcrystals_dilithium_fips202_ref_shake128_squeezeblocks>
c0de2e16:	f044 05a8 	orr.w	r5, r4, #168	@ 0xa8
c0de2e1a:	eb0b 0087 	add.w	r0, fp, r7, lsl #2
c0de2e1e:	f5c7 7180 	rsb	r1, r7, #256	@ 0x100
c0de2e22:	4632      	mov	r2, r6
c0de2e24:	462b      	mov	r3, r5
c0de2e26:	f000 f807 	bl	c0de2e38 <rej_uniform>
c0de2e2a:	4407      	add	r7, r0
c0de2e2c:	e7df      	b.n	c0de2dee <pqcrystals_dilithium2_lowram_poly_uniform+0x3a>
c0de2e2e:	f50d 6d84 	add.w	sp, sp, #1056	@ 0x420
c0de2e32:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
	...

c0de2e38 <rej_uniform>:
c0de2e38:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2e3a:	4c0f      	ldr	r4, [pc, #60]	@ (c0de2e78 <rej_uniform+0x40>)
c0de2e3c:	4684      	mov	ip, r0
c0de2e3e:	2000      	movs	r0, #0
c0de2e40:	2700      	movs	r7, #0
c0de2e42:	46a6      	mov	lr, r4
c0de2e44:	4288      	cmp	r0, r1
c0de2e46:	d215      	bcs.n	c0de2e74 <rej_uniform+0x3c>
c0de2e48:	1cfe      	adds	r6, r7, #3
c0de2e4a:	429e      	cmp	r6, r3
c0de2e4c:	d812      	bhi.n	c0de2e74 <rej_uniform+0x3c>
c0de2e4e:	5dd4      	ldrb	r4, [r2, r7]
c0de2e50:	4417      	add	r7, r2
c0de2e52:	787d      	ldrb	r5, [r7, #1]
c0de2e54:	78bf      	ldrb	r7, [r7, #2]
c0de2e56:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de2e5a:	f007 057f 	and.w	r5, r7, #127	@ 0x7f
c0de2e5e:	4637      	mov	r7, r6
c0de2e60:	ea44 4405 	orr.w	r4, r4, r5, lsl #16
c0de2e64:	4675      	mov	r5, lr
c0de2e66:	4574      	cmp	r4, lr
c0de2e68:	d8ec      	bhi.n	c0de2e44 <rej_uniform+0xc>
c0de2e6a:	f84c 4020 	str.w	r4, [ip, r0, lsl #2]
c0de2e6e:	3001      	adds	r0, #1
c0de2e70:	4637      	mov	r7, r6
c0de2e72:	e7e7      	b.n	c0de2e44 <rej_uniform+0xc>
c0de2e74:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de2e76:	bf00      	nop
c0de2e78:	007fe000 	.word	0x007fe000

c0de2e7c <pqcrystals_dilithium2_lowram_poly_uniform_eta>:
c0de2e7c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2e7e:	b0d7      	sub	sp, #348	@ 0x15c
c0de2e80:	466d      	mov	r5, sp
c0de2e82:	4604      	mov	r4, r0
c0de2e84:	4628      	mov	r0, r5
c0de2e86:	f001 f806 	bl	c0de3e96 <pqcrystals_dilithium2_lowram_dilithium_shake256_stream_init>
c0de2e8a:	ae35      	add	r6, sp, #212	@ 0xd4
c0de2e8c:	2101      	movs	r1, #1
c0de2e8e:	462a      	mov	r2, r5
c0de2e90:	4630      	mov	r0, r6
c0de2e92:	f7fe f998 	bl	c0de11c6 <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>
c0de2e96:	4620      	mov	r0, r4
c0de2e98:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de2e9c:	4632      	mov	r2, r6
c0de2e9e:	f000 f813 	bl	c0de2ec8 <rej_eta>
c0de2ea2:	4607      	mov	r7, r0
c0de2ea4:	2fff      	cmp	r7, #255	@ 0xff
c0de2ea6:	bf84      	itt	hi
c0de2ea8:	b057      	addhi	sp, #348	@ 0x15c
c0de2eaa:	bdf0      	pophi	{r4, r5, r6, r7, pc}
c0de2eac:	4630      	mov	r0, r6
c0de2eae:	2101      	movs	r1, #1
c0de2eb0:	462a      	mov	r2, r5
c0de2eb2:	f7fe f988 	bl	c0de11c6 <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>
c0de2eb6:	eb04 0087 	add.w	r0, r4, r7, lsl #2
c0de2eba:	f5c7 7180 	rsb	r1, r7, #256	@ 0x100
c0de2ebe:	4632      	mov	r2, r6
c0de2ec0:	f000 f802 	bl	c0de2ec8 <rej_eta>
c0de2ec4:	4407      	add	r7, r0
c0de2ec6:	e7ed      	b.n	c0de2ea4 <pqcrystals_dilithium2_lowram_poly_uniform_eta+0x28>

c0de2ec8 <rej_eta>:
c0de2ec8:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2eca:	4603      	mov	r3, r0
c0de2ecc:	2000      	movs	r0, #0
c0de2ece:	f04f 0ccd 	mov.w	ip, #205	@ 0xcd
c0de2ed2:	2500      	movs	r5, #0
c0de2ed4:	4288      	cmp	r0, r1
c0de2ed6:	d221      	bcs.n	c0de2f1c <rej_eta+0x54>
c0de2ed8:	2d87      	cmp	r5, #135	@ 0x87
c0de2eda:	d81f      	bhi.n	c0de2f1c <rej_eta+0x54>
c0de2edc:	5d56      	ldrb	r6, [r2, r5]
c0de2ede:	f006 070f 	and.w	r7, r6, #15
c0de2ee2:	2f0f      	cmp	r7, #15
c0de2ee4:	d009      	beq.n	c0de2efa <rej_eta+0x32>
c0de2ee6:	fb07 f40c 	mul.w	r4, r7, ip
c0de2eea:	0aa4      	lsrs	r4, r4, #10
c0de2eec:	eb04 0484 	add.w	r4, r4, r4, lsl #2
c0de2ef0:	1be4      	subs	r4, r4, r7
c0de2ef2:	3402      	adds	r4, #2
c0de2ef4:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
c0de2ef8:	3001      	adds	r0, #1
c0de2efa:	0936      	lsrs	r6, r6, #4
c0de2efc:	2e0f      	cmp	r6, #15
c0de2efe:	d00b      	beq.n	c0de2f18 <rej_eta+0x50>
c0de2f00:	4288      	cmp	r0, r1
c0de2f02:	d209      	bcs.n	c0de2f18 <rej_eta+0x50>
c0de2f04:	fb06 f40c 	mul.w	r4, r6, ip
c0de2f08:	0aa4      	lsrs	r4, r4, #10
c0de2f0a:	eb04 0484 	add.w	r4, r4, r4, lsl #2
c0de2f0e:	1ba4      	subs	r4, r4, r6
c0de2f10:	3402      	adds	r4, #2
c0de2f12:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
c0de2f16:	3001      	adds	r0, #1
c0de2f18:	3501      	adds	r5, #1
c0de2f1a:	e7db      	b.n	c0de2ed4 <rej_eta+0xc>
c0de2f1c:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de2f1e <pqcrystals_dilithium2_lowram_polyz_unpack>:
c0de2f1e:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2f20:	3008      	adds	r0, #8
c0de2f22:	f04f 0c00 	mov.w	ip, #0
c0de2f26:	f5bc 7f10 	cmp.w	ip, #576	@ 0x240
c0de2f2a:	bf08      	it	eq
c0de2f2c:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de2f2e:	f811 300c 	ldrb.w	r3, [r1, ip]
c0de2f32:	eb01 040c 	add.w	r4, r1, ip
c0de2f36:	f10c 0c09 	add.w	ip, ip, #9
c0de2f3a:	f840 3c08 	str.w	r3, [r0, #-8]
c0de2f3e:	7865      	ldrb	r5, [r4, #1]
c0de2f40:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0de2f44:	f840 3c08 	str.w	r3, [r0, #-8]
c0de2f48:	78a5      	ldrb	r5, [r4, #2]
c0de2f4a:	f365 4311 	bfi	r3, r5, #16, #2
c0de2f4e:	f840 3c08 	str.w	r3, [r0, #-8]
c0de2f52:	f5c3 3300 	rsb	r3, r3, #131072	@ 0x20000
c0de2f56:	78a5      	ldrb	r5, [r4, #2]
c0de2f58:	08ae      	lsrs	r6, r5, #2
c0de2f5a:	f840 6c04 	str.w	r6, [r0, #-4]
c0de2f5e:	78e6      	ldrb	r6, [r4, #3]
c0de2f60:	01b6      	lsls	r6, r6, #6
c0de2f62:	ea46 0595 	orr.w	r5, r6, r5, lsr #2
c0de2f66:	f840 5c04 	str.w	r5, [r0, #-4]
c0de2f6a:	7926      	ldrb	r6, [r4, #4]
c0de2f6c:	f366 3591 	bfi	r5, r6, #14, #4
c0de2f70:	f840 5c04 	str.w	r5, [r0, #-4]
c0de2f74:	f5c5 3500 	rsb	r5, r5, #131072	@ 0x20000
c0de2f78:	7926      	ldrb	r6, [r4, #4]
c0de2f7a:	0937      	lsrs	r7, r6, #4
c0de2f7c:	6007      	str	r7, [r0, #0]
c0de2f7e:	7967      	ldrb	r7, [r4, #5]
c0de2f80:	013f      	lsls	r7, r7, #4
c0de2f82:	ea47 1616 	orr.w	r6, r7, r6, lsr #4
c0de2f86:	6006      	str	r6, [r0, #0]
c0de2f88:	79a7      	ldrb	r7, [r4, #6]
c0de2f8a:	f367 3611 	bfi	r6, r7, #12, #6
c0de2f8e:	6006      	str	r6, [r0, #0]
c0de2f90:	f5c6 3600 	rsb	r6, r6, #131072	@ 0x20000
c0de2f94:	79a7      	ldrb	r7, [r4, #6]
c0de2f96:	09ba      	lsrs	r2, r7, #6
c0de2f98:	6042      	str	r2, [r0, #4]
c0de2f9a:	79e2      	ldrb	r2, [r4, #7]
c0de2f9c:	0092      	lsls	r2, r2, #2
c0de2f9e:	ea42 1297 	orr.w	r2, r2, r7, lsr #6
c0de2fa2:	6042      	str	r2, [r0, #4]
c0de2fa4:	7a24      	ldrb	r4, [r4, #8]
c0de2fa6:	6006      	str	r6, [r0, #0]
c0de2fa8:	f840 5c04 	str.w	r5, [r0, #-4]
c0de2fac:	f840 3c08 	str.w	r3, [r0, #-8]
c0de2fb0:	ea42 2284 	orr.w	r2, r2, r4, lsl #10
c0de2fb4:	f5c2 3200 	rsb	r2, r2, #131072	@ 0x20000
c0de2fb8:	6042      	str	r2, [r0, #4]
c0de2fba:	3010      	adds	r0, #16
c0de2fbc:	e7b3      	b.n	c0de2f26 <pqcrystals_dilithium2_lowram_polyz_unpack+0x8>

c0de2fbe <pqcrystals_dilithium2_lowram_poly_challenge>:
c0de2fbe:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2fc2:	b0d6      	sub	sp, #344	@ 0x158
c0de2fc4:	466e      	mov	r6, sp
c0de2fc6:	4680      	mov	r8, r0
c0de2fc8:	460d      	mov	r5, r1
c0de2fca:	4630      	mov	r0, r6
c0de2fcc:	f7fe f8c4 	bl	c0de1158 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de2fd0:	4630      	mov	r0, r6
c0de2fd2:	4629      	mov	r1, r5
c0de2fd4:	2220      	movs	r2, #32
c0de2fd6:	f7fe f8c7 	bl	c0de1168 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de2fda:	4630      	mov	r0, r6
c0de2fdc:	f7fe f8cf 	bl	c0de117e <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de2fe0:	ad34      	add	r5, sp, #208	@ 0xd0
c0de2fe2:	2101      	movs	r1, #1
c0de2fe4:	4632      	mov	r2, r6
c0de2fe6:	4628      	mov	r0, r5
c0de2fe8:	f7fe f8ed 	bl	c0de11c6 <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>
c0de2fec:	2600      	movs	r6, #0
c0de2fee:	462c      	mov	r4, r5
c0de2ff0:	2700      	movs	r7, #0
c0de2ff2:	f04f 0a00 	mov.w	sl, #0
c0de2ff6:	2e40      	cmp	r6, #64	@ 0x40
c0de2ff8:	d006      	beq.n	c0de3008 <pqcrystals_dilithium2_lowram_poly_challenge+0x4a>
c0de2ffa:	f000 f945 	bl	c0de3288 <OUTLINED_FUNCTION_1>
c0de2ffe:	ea4a 0a01 	orr.w	sl, sl, r1
c0de3002:	4307      	orrs	r7, r0
c0de3004:	3608      	adds	r6, #8
c0de3006:	e7f6      	b.n	c0de2ff6 <pqcrystals_dilithium2_lowram_poly_challenge+0x38>
c0de3008:	2000      	movs	r0, #0
c0de300a:	2100      	movs	r1, #0
c0de300c:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de3010:	d003      	beq.n	c0de301a <pqcrystals_dilithium2_lowram_poly_challenge+0x5c>
c0de3012:	f848 0021 	str.w	r0, [r8, r1, lsl #2]
c0de3016:	3101      	adds	r1, #1
c0de3018:	e7f8      	b.n	c0de300c <pqcrystals_dilithium2_lowram_poly_challenge+0x4e>
c0de301a:	2008      	movs	r0, #8
c0de301c:	24d9      	movs	r4, #217	@ 0xd9
c0de301e:	466e      	mov	r6, sp
c0de3020:	f04f 0b02 	mov.w	fp, #2
c0de3024:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de3028:	d01b      	beq.n	c0de3062 <pqcrystals_dilithium2_lowram_poly_challenge+0xa4>
c0de302a:	2888      	cmp	r0, #136	@ 0x88
c0de302c:	d305      	bcc.n	c0de303a <pqcrystals_dilithium2_lowram_poly_challenge+0x7c>
c0de302e:	4628      	mov	r0, r5
c0de3030:	2101      	movs	r1, #1
c0de3032:	4632      	mov	r2, r6
c0de3034:	f7fe f8c7 	bl	c0de11c6 <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>
c0de3038:	2000      	movs	r0, #0
c0de303a:	5c29      	ldrb	r1, [r5, r0]
c0de303c:	3001      	adds	r0, #1
c0de303e:	428c      	cmp	r4, r1
c0de3040:	d3f3      	bcc.n	c0de302a <pqcrystals_dilithium2_lowram_poly_challenge+0x6c>
c0de3042:	f858 2021 	ldr.w	r2, [r8, r1, lsl #2]
c0de3046:	ea5f 0a5a 	movs.w	sl, sl, lsr #1
c0de304a:	f848 2024 	str.w	r2, [r8, r4, lsl #2]
c0de304e:	ea0b 0247 	and.w	r2, fp, r7, lsl #1
c0de3052:	ea4f 0737 	mov.w	r7, r7, rrx
c0de3056:	3401      	adds	r4, #1
c0de3058:	f1c2 0201 	rsb	r2, r2, #1
c0de305c:	f848 2021 	str.w	r2, [r8, r1, lsl #2]
c0de3060:	e7e0      	b.n	c0de3024 <pqcrystals_dilithium2_lowram_poly_challenge+0x66>
c0de3062:	b056      	add	sp, #344	@ 0x158
c0de3064:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de3068 <pqcrystals_dilithium2_lowram_polyeta_pack>:
c0de3068:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de306c:	3001      	adds	r0, #1
c0de306e:	2200      	movs	r2, #0
c0de3070:	2640      	movs	r6, #64	@ 0x40
c0de3072:	f5b2 6f80 	cmp.w	r2, #1024	@ 0x400
c0de3076:	bf08      	it	eq
c0de3078:	e8bd 8df0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de307c:	188b      	adds	r3, r1, r2
c0de307e:	f851 8002 	ldr.w	r8, [r1, r2]
c0de3082:	2710      	movs	r7, #16
c0de3084:	3220      	adds	r2, #32
c0de3086:	f103 0b04 	add.w	fp, r3, #4
c0de308a:	f103 0e10 	add.w	lr, r3, #16
c0de308e:	69db      	ldr	r3, [r3, #28]
c0de3090:	e89b 0830 	ldmia.w	fp, {r4, r5, fp}
c0de3094:	e89e 5400 	ldmia.w	lr, {sl, ip, lr}
c0de3098:	f1c5 0502 	rsb	r5, r5, #2
c0de309c:	eba6 1343 	sub.w	r3, r6, r3, lsl #5
c0de30a0:	eba7 04c4 	sub.w	r4, r7, r4, lsl #3
c0de30a4:	f1c8 0702 	rsb	r7, r8, #2
c0de30a8:	b2ed      	uxtb	r5, r5
c0de30aa:	433c      	orrs	r4, r7
c0de30ac:	f1cc 0702 	rsb	r7, ip, #2
c0de30b0:	ea44 1485 	orr.w	r4, r4, r5, lsl #6
c0de30b4:	b2ff      	uxtb	r7, r7
c0de30b6:	f800 4c01 	strb.w	r4, [r0, #-1]
c0de30ba:	2408      	movs	r4, #8
c0de30bc:	eba4 048e 	sub.w	r4, r4, lr, lsl #2
c0de30c0:	ea44 0457 	orr.w	r4, r4, r7, lsr #1
c0de30c4:	4323      	orrs	r3, r4
c0de30c6:	2420      	movs	r4, #32
c0de30c8:	7043      	strb	r3, [r0, #1]
c0de30ca:	2304      	movs	r3, #4
c0de30cc:	eba4 140a 	sub.w	r4, r4, sl, lsl #4
c0de30d0:	eba3 034b 	sub.w	r3, r3, fp, lsl #1
c0de30d4:	ea43 0395 	orr.w	r3, r3, r5, lsr #2
c0de30d8:	4323      	orrs	r3, r4
c0de30da:	ea43 13c7 	orr.w	r3, r3, r7, lsl #7
c0de30de:	f800 3b03 	strb.w	r3, [r0], #3
c0de30e2:	e7c6      	b.n	c0de3072 <pqcrystals_dilithium2_lowram_polyeta_pack+0xa>

c0de30e4 <pqcrystals_dilithium2_lowram_polyt1_pack>:
c0de30e4:	b5b0      	push	{r4, r5, r7, lr}
c0de30e6:	3108      	adds	r1, #8
c0de30e8:	2200      	movs	r2, #0
c0de30ea:	f5b2 7fa0 	cmp.w	r2, #320	@ 0x140
c0de30ee:	bf08      	it	eq
c0de30f0:	bdb0      	popeq	{r4, r5, r7, pc}
c0de30f2:	f851 3c08 	ldr.w	r3, [r1, #-8]
c0de30f6:	5483      	strb	r3, [r0, r2]
c0de30f8:	1883      	adds	r3, r0, r2
c0de30fa:	3205      	adds	r2, #5
c0de30fc:	e951 4502 	ldrd	r4, r5, [r1, #-8]
c0de3100:	00ad      	lsls	r5, r5, #2
c0de3102:	ea45 2414 	orr.w	r4, r5, r4, lsr #8
c0de3106:	705c      	strb	r4, [r3, #1]
c0de3108:	680d      	ldr	r5, [r1, #0]
c0de310a:	f851 4c04 	ldr.w	r4, [r1, #-4]
c0de310e:	012d      	lsls	r5, r5, #4
c0de3110:	ea45 1494 	orr.w	r4, r5, r4, lsr #6
c0de3114:	709c      	strb	r4, [r3, #2]
c0de3116:	e9d1 4500 	ldrd	r4, r5, [r1]
c0de311a:	01ad      	lsls	r5, r5, #6
c0de311c:	ea45 1414 	orr.w	r4, r5, r4, lsr #4
c0de3120:	70dc      	strb	r4, [r3, #3]
c0de3122:	684c      	ldr	r4, [r1, #4]
c0de3124:	3110      	adds	r1, #16
c0de3126:	08a4      	lsrs	r4, r4, #2
c0de3128:	711c      	strb	r4, [r3, #4]
c0de312a:	e7de      	b.n	c0de30ea <pqcrystals_dilithium2_lowram_polyt1_pack+0x6>

c0de312c <pqcrystals_dilithium2_lowram_polyt0_pack>:
c0de312c:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de3130:	311c      	adds	r1, #28
c0de3132:	f04f 0c00 	mov.w	ip, #0
c0de3136:	9000      	str	r0, [sp, #0]
c0de3138:	f5bc 7fd0 	cmp.w	ip, #416	@ 0x1a0
c0de313c:	bf08      	it	eq
c0de313e:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de3142:	f851 0c14 	ldr.w	r0, [r1, #-20]
c0de3146:	e951 a504 	ldrd	sl, r5, [r1, #-16]
c0de314a:	e951 3807 	ldrd	r3, r8, [r1, #-28]
c0de314e:	e951 e602 	ldrd	lr, r6, [r1, #-8]
c0de3152:	f851 7b20 	ldr.w	r7, [r1], #32
c0de3156:	9001      	str	r0, [sp, #4]
c0de3158:	9800      	ldr	r0, [sp, #0]
c0de315a:	f5c7 5780 	rsb	r7, r7, #4096	@ 0x1000
c0de315e:	f5c3 5b80 	rsb	fp, r3, #4096	@ 0x1000
c0de3162:	f5c5 5580 	rsb	r5, r5, #4096	@ 0x1000
c0de3166:	097b      	lsrs	r3, r7, #5
c0de3168:	eb00 040c 	add.w	r4, r0, ip
c0de316c:	f800 b00c 	strb.w	fp, [r0, ip]
c0de3170:	f10c 0c0d 	add.w	ip, ip, #13
c0de3174:	7323      	strb	r3, [r4, #12]
c0de3176:	f5c6 5380 	rsb	r3, r6, #4096	@ 0x1000
c0de317a:	089e      	lsrs	r6, r3, #2
c0de317c:	72a6      	strb	r6, [r4, #10]
c0de317e:	092e      	lsrs	r6, r5, #4
c0de3180:	71e6      	strb	r6, [r4, #7]
c0de3182:	f5ca 5680 	rsb	r6, sl, #4096	@ 0x1000
c0de3186:	0872      	lsrs	r2, r6, #1
c0de3188:	7162      	strb	r2, [r4, #5]
c0de318a:	f5c8 5280 	rsb	r2, r8, #4096	@ 0x1000
c0de318e:	08d0      	lsrs	r0, r2, #3
c0de3190:	70a0      	strb	r0, [r4, #2]
c0de3192:	00f8      	lsls	r0, r7, #3
c0de3194:	ea40 2093 	orr.w	r0, r0, r3, lsr #10
c0de3198:	019b      	lsls	r3, r3, #6
c0de319a:	72e0      	strb	r0, [r4, #11]
c0de319c:	f5ce 5080 	rsb	r0, lr, #4096	@ 0x1000
c0de31a0:	ea43 13d0 	orr.w	r3, r3, r0, lsr #7
c0de31a4:	0040      	lsls	r0, r0, #1
c0de31a6:	ea40 3015 	orr.w	r0, r0, r5, lsr #12
c0de31aa:	7263      	strb	r3, [r4, #9]
c0de31ac:	01f3      	lsls	r3, r6, #7
c0de31ae:	7220      	strb	r0, [r4, #8]
c0de31b0:	0128      	lsls	r0, r5, #4
c0de31b2:	ea40 2056 	orr.w	r0, r0, r6, lsr #9
c0de31b6:	71a0      	strb	r0, [r4, #6]
c0de31b8:	9801      	ldr	r0, [sp, #4]
c0de31ba:	f5c0 5080 	rsb	r0, r0, #4096	@ 0x1000
c0de31be:	ea43 1390 	orr.w	r3, r3, r0, lsr #6
c0de31c2:	0080      	lsls	r0, r0, #2
c0de31c4:	ea40 20d2 	orr.w	r0, r0, r2, lsr #11
c0de31c8:	7123      	strb	r3, [r4, #4]
c0de31ca:	70e0      	strb	r0, [r4, #3]
c0de31cc:	0150      	lsls	r0, r2, #5
c0de31ce:	ea40 201b 	orr.w	r0, r0, fp, lsr #8
c0de31d2:	7060      	strb	r0, [r4, #1]
c0de31d4:	e7b0      	b.n	c0de3138 <pqcrystals_dilithium2_lowram_polyt0_pack+0xc>

c0de31d6 <pqcrystals_dilithium2_lowram_polyz_pack>:
c0de31d6:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de31d8:	3108      	adds	r1, #8
c0de31da:	f04f 0e00 	mov.w	lr, #0
c0de31de:	f5be 7f10 	cmp.w	lr, #576	@ 0x240
c0de31e2:	bf08      	it	eq
c0de31e4:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de31e6:	e951 3c02 	ldrd	r3, ip, [r1, #-8]
c0de31ea:	e8f1 5604 	ldrd	r5, r6, [r1], #16
c0de31ee:	eb00 070e 	add.w	r7, r0, lr
c0de31f2:	f5c6 3600 	rsb	r6, r6, #131072	@ 0x20000
c0de31f6:	f5c3 3300 	rsb	r3, r3, #131072	@ 0x20000
c0de31fa:	0ab4      	lsrs	r4, r6, #10
c0de31fc:	f800 300e 	strb.w	r3, [r0, lr]
c0de3200:	f10e 0e09 	add.w	lr, lr, #9
c0de3204:	723c      	strb	r4, [r7, #8]
c0de3206:	08b4      	lsrs	r4, r6, #2
c0de3208:	71fc      	strb	r4, [r7, #7]
c0de320a:	f5c5 3400 	rsb	r4, r5, #131072	@ 0x20000
c0de320e:	0925      	lsrs	r5, r4, #4
c0de3210:	717d      	strb	r5, [r7, #5]
c0de3212:	f5cc 3500 	rsb	r5, ip, #131072	@ 0x20000
c0de3216:	09aa      	lsrs	r2, r5, #6
c0de3218:	70fa      	strb	r2, [r7, #3]
c0de321a:	0a1a      	lsrs	r2, r3, #8
c0de321c:	707a      	strb	r2, [r7, #1]
c0de321e:	01b2      	lsls	r2, r6, #6
c0de3220:	ea42 3214 	orr.w	r2, r2, r4, lsr #12
c0de3224:	71ba      	strb	r2, [r7, #6]
c0de3226:	0122      	lsls	r2, r4, #4
c0de3228:	ea42 3295 	orr.w	r2, r2, r5, lsr #14
c0de322c:	713a      	strb	r2, [r7, #4]
c0de322e:	00aa      	lsls	r2, r5, #2
c0de3230:	ea42 4213 	orr.w	r2, r2, r3, lsr #16
c0de3234:	70ba      	strb	r2, [r7, #2]
c0de3236:	e7d2      	b.n	c0de31de <pqcrystals_dilithium2_lowram_polyz_pack+0x8>

c0de3238 <pqcrystals_dilithium2_lowram_polyw1_pack>:
c0de3238:	b5b0      	push	{r4, r5, r7, lr}
c0de323a:	3001      	adds	r0, #1
c0de323c:	2200      	movs	r2, #0
c0de323e:	f5b2 6f80 	cmp.w	r2, #1024	@ 0x400
c0de3242:	bf08      	it	eq
c0de3244:	bdb0      	popeq	{r4, r5, r7, pc}
c0de3246:	588b      	ldr	r3, [r1, r2]
c0de3248:	188c      	adds	r4, r1, r2
c0de324a:	3210      	adds	r2, #16
c0de324c:	f800 3c01 	strb.w	r3, [r0, #-1]
c0de3250:	6865      	ldr	r5, [r4, #4]
c0de3252:	ea43 1385 	orr.w	r3, r3, r5, lsl #6
c0de3256:	f800 3c01 	strb.w	r3, [r0, #-1]
c0de325a:	6863      	ldr	r3, [r4, #4]
c0de325c:	089d      	lsrs	r5, r3, #2
c0de325e:	7005      	strb	r5, [r0, #0]
c0de3260:	68a5      	ldr	r5, [r4, #8]
c0de3262:	012d      	lsls	r5, r5, #4
c0de3264:	ea45 0393 	orr.w	r3, r5, r3, lsr #2
c0de3268:	7003      	strb	r3, [r0, #0]
c0de326a:	68a3      	ldr	r3, [r4, #8]
c0de326c:	091d      	lsrs	r5, r3, #4
c0de326e:	7045      	strb	r5, [r0, #1]
c0de3270:	68e4      	ldr	r4, [r4, #12]
c0de3272:	00a4      	lsls	r4, r4, #2
c0de3274:	ea44 1313 	orr.w	r3, r4, r3, lsr #4
c0de3278:	7043      	strb	r3, [r0, #1]
c0de327a:	3003      	adds	r0, #3
c0de327c:	e7df      	b.n	c0de323e <pqcrystals_dilithium2_lowram_polyw1_pack+0x6>

c0de327e <OUTLINED_FUNCTION_0>:
c0de327e:	4614      	mov	r4, r2
c0de3280:	460d      	mov	r5, r1
c0de3282:	4606      	mov	r6, r0
c0de3284:	2700      	movs	r7, #0
c0de3286:	4770      	bx	lr

c0de3288 <OUTLINED_FUNCTION_1>:
c0de3288:	f814 0b01 	ldrb.w	r0, [r4], #1
c0de328c:	2100      	movs	r1, #0
c0de328e:	4632      	mov	r2, r6
c0de3290:	f008 bfba 	b.w	c0dec208 <__aeabi_llsl>

c0de3294 <randombytes>:
c0de3294:	f008 bc7b 	b.w	c0debb8e <cx_rng_no_throw>

c0de3298 <pqcrystals_dilithium2_lowram_montgomery_reduce>:
c0de3298:	4a03      	ldr	r2, [pc, #12]	@ (c0de32a8 <pqcrystals_dilithium2_lowram_montgomery_reduce+0x10>)
c0de329a:	4b04      	ldr	r3, [pc, #16]	@ (c0de32ac <pqcrystals_dilithium2_lowram_montgomery_reduce+0x14>)
c0de329c:	4342      	muls	r2, r0
c0de329e:	fbc2 0103 	smlal	r0, r1, r2, r3
c0de32a2:	4608      	mov	r0, r1
c0de32a4:	4770      	bx	lr
c0de32a6:	bf00      	nop
c0de32a8:	03802001 	.word	0x03802001
c0de32ac:	ff801fff 	.word	0xff801fff

c0de32b0 <pqcrystals_dilithium2_lowram_reduce32>:
c0de32b0:	f500 0180 	add.w	r1, r0, #4194304	@ 0x400000
c0de32b4:	4a02      	ldr	r2, [pc, #8]	@ (c0de32c0 <pqcrystals_dilithium2_lowram_reduce32+0x10>)
c0de32b6:	15c9      	asrs	r1, r1, #23
c0de32b8:	fb01 0002 	mla	r0, r1, r2, r0
c0de32bc:	4770      	bx	lr
c0de32be:	bf00      	nop
c0de32c0:	ff801fff 	.word	0xff801fff

c0de32c4 <pqcrystals_dilithium2_lowram_caddq>:
c0de32c4:	4902      	ldr	r1, [pc, #8]	@ (c0de32d0 <pqcrystals_dilithium2_lowram_caddq+0xc>)
c0de32c6:	2800      	cmp	r0, #0
c0de32c8:	bf48      	it	mi
c0de32ca:	4408      	addmi	r0, r1
c0de32cc:	4770      	bx	lr
c0de32ce:	bf00      	nop
c0de32d0:	007fe001 	.word	0x007fe001

c0de32d4 <pqcrystals_dilithium2_lowram_freeze>:
c0de32d4:	f500 0180 	add.w	r1, r0, #4194304	@ 0x400000
c0de32d8:	4a04      	ldr	r2, [pc, #16]	@ (c0de32ec <pqcrystals_dilithium2_lowram_freeze+0x18>)
c0de32da:	15c9      	asrs	r1, r1, #23
c0de32dc:	fb01 0002 	mla	r0, r1, r2, r0
c0de32e0:	4903      	ldr	r1, [pc, #12]	@ (c0de32f0 <pqcrystals_dilithium2_lowram_freeze+0x1c>)
c0de32e2:	2800      	cmp	r0, #0
c0de32e4:	bf48      	it	mi
c0de32e6:	4408      	addmi	r0, r1
c0de32e8:	4770      	bx	lr
c0de32ea:	bf00      	nop
c0de32ec:	ff801fff 	.word	0xff801fff
c0de32f0:	007fe001 	.word	0x007fe001

c0de32f4 <pqcrystals_dilithium2_lowram_power2round>:
c0de32f4:	f601 72ff 	addw	r2, r1, #4095	@ 0xfff
c0de32f8:	f641 73ff 	movw	r3, #8191	@ 0x1fff
c0de32fc:	ea22 0303 	bic.w	r3, r2, r3
c0de3300:	1ac9      	subs	r1, r1, r3
c0de3302:	6001      	str	r1, [r0, #0]
c0de3304:	1350      	asrs	r0, r2, #13
c0de3306:	4770      	bx	lr

c0de3308 <pqcrystals_dilithium2_lowram_decompose>:
c0de3308:	b510      	push	{r4, lr}
c0de330a:	f101 027f 	add.w	r2, r1, #127	@ 0x7f
c0de330e:	f642 430b 	movw	r3, #11275	@ 0x2c0b
c0de3312:	4c0c      	ldr	r4, [pc, #48]	@ (c0de3344 <pqcrystals_dilithium2_lowram_decompose+0x3c>)
c0de3314:	11d2      	asrs	r2, r2, #7
c0de3316:	4353      	muls	r3, r2
c0de3318:	f503 0200 	add.w	r2, r3, #8388608	@ 0x800000
c0de331c:	1612      	asrs	r2, r2, #24
c0de331e:	f1b3 5f2e 	cmp.w	r3, #729808896	@ 0x2b800000
c0de3322:	4b06      	ldr	r3, [pc, #24]	@ (c0de333c <pqcrystals_dilithium2_lowram_decompose+0x34>)
c0de3324:	bfa8      	it	ge
c0de3326:	2200      	movge	r2, #0
c0de3328:	fb02 1103 	mla	r1, r2, r3, r1
c0de332c:	4b04      	ldr	r3, [pc, #16]	@ (c0de3340 <pqcrystals_dilithium2_lowram_decompose+0x38>)
c0de332e:	42a1      	cmp	r1, r4
c0de3330:	bfc8      	it	gt
c0de3332:	4419      	addgt	r1, r3
c0de3334:	6001      	str	r1, [r0, #0]
c0de3336:	4610      	mov	r0, r2
c0de3338:	bd10      	pop	{r4, pc}
c0de333a:	bf00      	nop
c0de333c:	fffd1800 	.word	0xfffd1800
c0de3340:	ff801fff 	.word	0xff801fff
c0de3344:	003ff000 	.word	0x003ff000

c0de3348 <pqcrystals_dilithium2_lowram_use_hint>:
c0de3348:	b51c      	push	{r2, r3, r4, lr}
c0de334a:	460c      	mov	r4, r1
c0de334c:	4601      	mov	r1, r0
c0de334e:	a801      	add	r0, sp, #4
c0de3350:	f7ff ffda 	bl	c0de3308 <pqcrystals_dilithium2_lowram_decompose>
c0de3354:	b164      	cbz	r4, c0de3370 <pqcrystals_dilithium2_lowram_use_hint+0x28>
c0de3356:	9901      	ldr	r1, [sp, #4]
c0de3358:	2901      	cmp	r1, #1
c0de335a:	db04      	blt.n	c0de3366 <pqcrystals_dilithium2_lowram_use_hint+0x1e>
c0de335c:	f1b0 012b 	subs.w	r1, r0, #43	@ 0x2b
c0de3360:	bf18      	it	ne
c0de3362:	1c41      	addne	r1, r0, #1
c0de3364:	e003      	b.n	c0de336e <pqcrystals_dilithium2_lowram_use_hint+0x26>
c0de3366:	1e41      	subs	r1, r0, #1
c0de3368:	2800      	cmp	r0, #0
c0de336a:	bf08      	it	eq
c0de336c:	212b      	moveq	r1, #43	@ 0x2b
c0de336e:	4608      	mov	r0, r1
c0de3370:	bd1c      	pop	{r2, r3, r4, pc}

c0de3372 <pqcrystals_dilithium2_lowram_keypair>:
c0de3372:	b570      	push	{r4, r5, r6, lr}
c0de3374:	b088      	sub	sp, #32
c0de3376:	466e      	mov	r6, sp
c0de3378:	460c      	mov	r4, r1
c0de337a:	4605      	mov	r5, r0
c0de337c:	2120      	movs	r1, #32
c0de337e:	4630      	mov	r0, r6
c0de3380:	f7ff ff88 	bl	c0de3294 <randombytes>
c0de3384:	4628      	mov	r0, r5
c0de3386:	4621      	mov	r1, r4
c0de3388:	4632      	mov	r2, r6
c0de338a:	f000 f803 	bl	c0de3394 <crypto_sign_keypair_core>
c0de338e:	2000      	movs	r0, #0
c0de3390:	b008      	add	sp, #32
c0de3392:	bd70      	pop	{r4, r5, r6, pc}

c0de3394 <crypto_sign_keypair_core>:
c0de3394:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3398:	f6ad 4d88 	subw	sp, sp, #3208	@ 0xc88
c0de339c:	f60d 4608 	addw	r6, sp, #3080	@ 0xc08
c0de33a0:	460c      	mov	r4, r1
c0de33a2:	4605      	mov	r5, r0
c0de33a4:	4611      	mov	r1, r2
c0de33a6:	2220      	movs	r2, #32
c0de33a8:	4630      	mov	r0, r6
c0de33aa:	f009 f835 	bl	c0dec418 <__aeabi_memcpy>
c0de33ae:	f240 4004 	movw	r0, #1028	@ 0x404
c0de33b2:	f8ad 0c28 	strh.w	r0, [sp, #3112]	@ 0xc28
c0de33b6:	af02      	add	r7, sp, #8
c0de33b8:	4638      	mov	r0, r7
c0de33ba:	f7fd fecd 	bl	c0de1158 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de33be:	4638      	mov	r0, r7
c0de33c0:	4631      	mov	r1, r6
c0de33c2:	2222      	movs	r2, #34	@ 0x22
c0de33c4:	f7fd fed0 	bl	c0de1168 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de33c8:	4638      	mov	r0, r7
c0de33ca:	f7fd fed8 	bl	c0de117e <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de33ce:	4630      	mov	r0, r6
c0de33d0:	2180      	movs	r1, #128	@ 0x80
c0de33d2:	463a      	mov	r2, r7
c0de33d4:	f7fd fede 	bl	c0de1194 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de33d8:	4620      	mov	r0, r4
c0de33da:	4631      	mov	r1, r6
c0de33dc:	f7ff fb57 	bl	c0de2a8e <pack_sk_rho>
c0de33e0:	f106 0160 	add.w	r1, r6, #96	@ 0x60
c0de33e4:	4620      	mov	r0, r4
c0de33e6:	9401      	str	r4, [sp, #4]
c0de33e8:	f7ff fb59 	bl	c0de2a9e <pack_sk_key>
c0de33ec:	4628      	mov	r0, r5
c0de33ee:	4631      	mov	r1, r6
c0de33f0:	9500      	str	r5, [sp, #0]
c0de33f2:	f7ff fb26 	bl	c0de2a42 <pack_pk_rho>
c0de33f6:	f106 0520 	add.w	r5, r6, #32
c0de33fa:	f04f 0b00 	mov.w	fp, #0
c0de33fe:	f50d 6481 	add.w	r4, sp, #1032	@ 0x408
c0de3402:	f60d 0608 	addw	r6, sp, #2056	@ 0x808
c0de3406:	f04f 0800 	mov.w	r8, #0
c0de340a:	f1b8 0f04 	cmp.w	r8, #4
c0de340e:	d072      	beq.n	c0de34f6 <crypto_sign_keypair_core+0x162>
c0de3410:	4638      	mov	r0, r7
c0de3412:	4629      	mov	r1, r5
c0de3414:	2200      	movs	r2, #0
c0de3416:	f7ff fd31 	bl	c0de2e7c <pqcrystals_dilithium2_lowram_poly_uniform_eta>
c0de341a:	f1b8 0f00 	cmp.w	r8, #0
c0de341e:	d104      	bne.n	c0de342a <crypto_sign_keypair_core+0x96>
c0de3420:	9801      	ldr	r0, [sp, #4]
c0de3422:	4639      	mov	r1, r7
c0de3424:	2200      	movs	r2, #0
c0de3426:	f7ff fb1b 	bl	c0de2a60 <pack_sk_s1>
c0de342a:	4638      	mov	r0, r7
c0de342c:	f7ff fc87 	bl	c0de2d3e <pqcrystals_dilithium2_lowram_poly_ntt>
c0de3430:	ea4f 2008 	mov.w	r0, r8, lsl #8
c0de3434:	f60d 4108 	addw	r1, sp, #3080	@ 0xc08
c0de3438:	b282      	uxth	r2, r0
c0de343a:	4620      	mov	r0, r4
c0de343c:	f7ff fcba 	bl	c0de2db4 <pqcrystals_dilithium2_lowram_poly_uniform>
c0de3440:	4630      	mov	r0, r6
c0de3442:	4621      	mov	r1, r4
c0de3444:	463a      	mov	r2, r7
c0de3446:	f7ff fc7e 	bl	c0de2d46 <pqcrystals_dilithium2_lowram_poly_pointwise_montgomery>
c0de344a:	f04f 0a01 	mov.w	sl, #1
c0de344e:	f1ba 0f04 	cmp.w	sl, #4
c0de3452:	d020      	beq.n	c0de3496 <crypto_sign_keypair_core+0x102>
c0de3454:	fa1f f28a 	uxth.w	r2, sl
c0de3458:	4638      	mov	r0, r7
c0de345a:	4629      	mov	r1, r5
c0de345c:	f7ff fd0e 	bl	c0de2e7c <pqcrystals_dilithium2_lowram_poly_uniform_eta>
c0de3460:	f1b8 0f00 	cmp.w	r8, #0
c0de3464:	d104      	bne.n	c0de3470 <crypto_sign_keypair_core+0xdc>
c0de3466:	9801      	ldr	r0, [sp, #4]
c0de3468:	4639      	mov	r1, r7
c0de346a:	4652      	mov	r2, sl
c0de346c:	f7ff faf8 	bl	c0de2a60 <pack_sk_s1>
c0de3470:	4638      	mov	r0, r7
c0de3472:	f7ff fc64 	bl	c0de2d3e <pqcrystals_dilithium2_lowram_poly_ntt>
c0de3476:	eb0b 000a 	add.w	r0, fp, sl
c0de347a:	f60d 4108 	addw	r1, sp, #3080	@ 0xc08
c0de347e:	b282      	uxth	r2, r0
c0de3480:	4620      	mov	r0, r4
c0de3482:	f7ff fc97 	bl	c0de2db4 <pqcrystals_dilithium2_lowram_poly_uniform>
c0de3486:	4630      	mov	r0, r6
c0de3488:	4621      	mov	r1, r4
c0de348a:	463a      	mov	r2, r7
c0de348c:	f7ff fb72 	bl	c0de2b74 <pqcrystals_dilithium2_lowram_poly_pointwise_acc_montgomery>
c0de3490:	f10a 0a01 	add.w	sl, sl, #1
c0de3494:	e7db      	b.n	c0de344e <crypto_sign_keypair_core+0xba>
c0de3496:	4630      	mov	r0, r6
c0de3498:	f7ff fc24 	bl	c0de2ce4 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de349c:	4630      	mov	r0, r6
c0de349e:	f7ff fc50 	bl	c0de2d42 <pqcrystals_dilithium2_lowram_poly_invntt_tomont>
c0de34a2:	f108 0004 	add.w	r0, r8, #4
c0de34a6:	4629      	mov	r1, r5
c0de34a8:	b282      	uxth	r2, r0
c0de34aa:	4620      	mov	r0, r4
c0de34ac:	f7ff fce6 	bl	c0de2e7c <pqcrystals_dilithium2_lowram_poly_uniform_eta>
c0de34b0:	f8dd a004 	ldr.w	sl, [sp, #4]
c0de34b4:	4621      	mov	r1, r4
c0de34b6:	4642      	mov	r2, r8
c0de34b8:	4650      	mov	r0, sl
c0de34ba:	f7ff fad8 	bl	c0de2a6e <pack_sk_s2>
c0de34be:	4630      	mov	r0, r6
c0de34c0:	4631      	mov	r1, r6
c0de34c2:	4622      	mov	r2, r4
c0de34c4:	f7ff fc2c 	bl	c0de2d20 <pqcrystals_dilithium2_lowram_poly_add>
c0de34c8:	4630      	mov	r0, r6
c0de34ca:	f7ff fc1a 	bl	c0de2d02 <pqcrystals_dilithium2_lowram_poly_caddq>
c0de34ce:	4638      	mov	r0, r7
c0de34d0:	4621      	mov	r1, r4
c0de34d2:	4632      	mov	r2, r6
c0de34d4:	f7ff fc4a 	bl	c0de2d6c <pqcrystals_dilithium2_lowram_poly_power2round>
c0de34d8:	4650      	mov	r0, sl
c0de34da:	4621      	mov	r1, r4
c0de34dc:	4642      	mov	r2, r8
c0de34de:	f7ff face 	bl	c0de2a7e <pack_sk_t0>
c0de34e2:	9800      	ldr	r0, [sp, #0]
c0de34e4:	4639      	mov	r1, r7
c0de34e6:	4642      	mov	r2, r8
c0de34e8:	f7ff fab3 	bl	c0de2a52 <pack_pk_t1>
c0de34ec:	f50b 7b80 	add.w	fp, fp, #256	@ 0x100
c0de34f0:	f108 0801 	add.w	r8, r8, #1
c0de34f4:	e789      	b.n	c0de340a <crypto_sign_keypair_core+0x76>
c0de34f6:	ac02      	add	r4, sp, #8
c0de34f8:	9e00      	ldr	r6, [sp, #0]
c0de34fa:	2140      	movs	r1, #64	@ 0x40
c0de34fc:	f44f 63a4 	mov.w	r3, #1312	@ 0x520
c0de3500:	4620      	mov	r0, r4
c0de3502:	4632      	mov	r2, r6
c0de3504:	f7fd fe62 	bl	c0de11cc <pqcrystals_dilithium_fips202_ref_shake256>
c0de3508:	480c      	ldr	r0, [pc, #48]	@ (c0de353c <crypto_sign_keypair_core+0x1a8>)
c0de350a:	4621      	mov	r1, r4
c0de350c:	2240      	movs	r2, #64	@ 0x40
c0de350e:	eb09 0500 	add.w	r5, r9, r0
c0de3512:	f505 7008 	add.w	r0, r5, #544	@ 0x220
c0de3516:	f008 ff7f 	bl	c0dec418 <__aeabi_memcpy>
c0de351a:	f505 7018 	add.w	r0, r5, #608	@ 0x260
c0de351e:	4631      	mov	r1, r6
c0de3520:	f44f 62a4 	mov.w	r2, #1312	@ 0x520
c0de3524:	f008 ff78 	bl	c0dec418 <__aeabi_memcpy>
c0de3528:	9801      	ldr	r0, [sp, #4]
c0de352a:	4621      	mov	r1, r4
c0de352c:	f7ff fac0 	bl	c0de2ab0 <pack_sk_tr>
c0de3530:	2000      	movs	r0, #0
c0de3532:	f60d 4d88 	addw	sp, sp, #3208	@ 0xc88
c0de3536:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de353a:	bf00      	nop
c0de353c:	000002d8 	.word	0x000002d8

c0de3540 <crypto_sign_signature_init>:
c0de3540:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de3544:	29ff      	cmp	r1, #255	@ 0xff
c0de3546:	d902      	bls.n	c0de354e <crypto_sign_signature_init+0xe>
c0de3548:	f04f 34ff 	mov.w	r4, #4294967295	@ 0xffffffff
c0de354c:	e01c      	b.n	c0de3588 <crypto_sign_signature_init+0x48>
c0de354e:	4680      	mov	r8, r0
c0de3550:	480f      	ldr	r0, [pc, #60]	@ (c0de3590 <crypto_sign_signature_init+0x50>)
c0de3552:	2400      	movs	r4, #0
c0de3554:	460d      	mov	r5, r1
c0de3556:	eb09 0700 	add.w	r7, r9, r0
c0de355a:	4638      	mov	r0, r7
c0de355c:	f887 11a1 	strb.w	r1, [r7, #417]	@ 0x1a1
c0de3560:	f887 41a0 	strb.w	r4, [r7, #416]	@ 0x1a0
c0de3564:	f7fd fdf8 	bl	c0de1158 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de3568:	4e0a      	ldr	r6, [pc, #40]	@ (c0de3594 <crypto_sign_signature_init+0x54>)
c0de356a:	f507 7108 	add.w	r1, r7, #544	@ 0x220
c0de356e:	4638      	mov	r0, r7
c0de3570:	2240      	movs	r2, #64	@ 0x40
c0de3572:	447e      	add	r6, pc
c0de3574:	47b0      	blx	r6
c0de3576:	f507 71d0 	add.w	r1, r7, #416	@ 0x1a0
c0de357a:	4638      	mov	r0, r7
c0de357c:	2202      	movs	r2, #2
c0de357e:	47b0      	blx	r6
c0de3580:	4638      	mov	r0, r7
c0de3582:	4641      	mov	r1, r8
c0de3584:	462a      	mov	r2, r5
c0de3586:	47b0      	blx	r6
c0de3588:	4620      	mov	r0, r4
c0de358a:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de358e:	bf00      	nop
c0de3590:	000002d8 	.word	0x000002d8
c0de3594:	ffffdbf3 	.word	0xffffdbf3

c0de3598 <crypto_sign_signature_absorb>:
c0de3598:	b580      	push	{r7, lr}
c0de359a:	460a      	mov	r2, r1
c0de359c:	4601      	mov	r1, r0
c0de359e:	4803      	ldr	r0, [pc, #12]	@ (c0de35ac <crypto_sign_signature_absorb+0x14>)
c0de35a0:	4448      	add	r0, r9
c0de35a2:	f7fd fde1 	bl	c0de1168 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de35a6:	2000      	movs	r0, #0
c0de35a8:	bd80      	pop	{r7, pc}
c0de35aa:	bf00      	nop
c0de35ac:	000002d8 	.word	0x000002d8

c0de35b0 <crypto_sign_signature_core>:
c0de35b0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de35b4:	f5ad 5d83 	sub.w	sp, sp, #4192	@ 0x1060
c0de35b8:	b086      	sub	sp, #24
c0de35ba:	f8df 8300 	ldr.w	r8, [pc, #768]	@ c0de38bc <crypto_sign_signature_core+0x30c>
c0de35be:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de35c0:	4616      	mov	r6, r2
c0de35c2:	9102      	str	r1, [sp, #8]
c0de35c4:	eb09 0408 	add.w	r4, r9, r8
c0de35c8:	4620      	mov	r0, r4
c0de35ca:	f7fd fdd8 	bl	c0de117e <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de35ce:	f504 70d0 	add.w	r0, r4, #416	@ 0x1a0
c0de35d2:	2140      	movs	r1, #64	@ 0x40
c0de35d4:	4622      	mov	r2, r4
c0de35d6:	f7fd fddd 	bl	c0de1194 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de35da:	a80d      	add	r0, sp, #52	@ 0x34
c0de35dc:	2100      	movs	r1, #0
c0de35de:	f500 7000 	add.w	r0, r0, #512	@ 0x200
c0de35e2:	9009      	str	r0, [sp, #36]	@ 0x24
c0de35e4:	2000      	movs	r0, #0
c0de35e6:	2920      	cmp	r1, #32
c0de35e8:	d006      	beq.n	c0de35f8 <crypto_sign_signature_core+0x48>
c0de35ea:	eb09 0208 	add.w	r2, r9, r8
c0de35ee:	440a      	add	r2, r1
c0de35f0:	3101      	adds	r1, #1
c0de35f2:	f882 01e0 	strb.w	r0, [r2, #480]	@ 0x1e0
c0de35f6:	e7f6      	b.n	c0de35e6 <crypto_sign_signature_core+0x36>
c0de35f8:	eb09 0408 	add.w	r4, r9, r8
c0de35fc:	4620      	mov	r0, r4
c0de35fe:	f7fd fdab 	bl	c0de1158 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de3602:	4fb0      	ldr	r7, [pc, #704]	@ (c0de38c4 <crypto_sign_signature_core+0x314>)
c0de3604:	f106 0120 	add.w	r1, r6, #32
c0de3608:	4620      	mov	r0, r4
c0de360a:	2220      	movs	r2, #32
c0de360c:	447f      	add	r7, pc
c0de360e:	47b8      	blx	r7
c0de3610:	f504 75f0 	add.w	r5, r4, #480	@ 0x1e0
c0de3614:	4620      	mov	r0, r4
c0de3616:	2220      	movs	r2, #32
c0de3618:	4629      	mov	r1, r5
c0de361a:	47b8      	blx	r7
c0de361c:	f504 71d0 	add.w	r1, r4, #416	@ 0x1a0
c0de3620:	4620      	mov	r0, r4
c0de3622:	2240      	movs	r2, #64	@ 0x40
c0de3624:	47b8      	blx	r7
c0de3626:	4620      	mov	r0, r4
c0de3628:	f7fd fda9 	bl	c0de117e <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de362c:	4628      	mov	r0, r5
c0de362e:	2140      	movs	r1, #64	@ 0x40
c0de3630:	4622      	mov	r2, r4
c0de3632:	f7fd fdaf 	bl	c0de1194 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de3636:	f506 7060 	add.w	r0, r6, #896	@ 0x380
c0de363a:	2100      	movs	r1, #0
c0de363c:	f04f 0b00 	mov.w	fp, #0
c0de3640:	9003      	str	r0, [sp, #12]
c0de3642:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de3644:	3020      	adds	r0, #32
c0de3646:	9004      	str	r0, [sp, #16]
c0de3648:	ac0d      	add	r4, sp, #52	@ 0x34
c0de364a:	2001      	movs	r0, #1
c0de364c:	9106      	str	r1, [sp, #24]
c0de364e:	9005      	str	r0, [sp, #20]
c0de3650:	b280      	uxth	r0, r0
c0de3652:	f64f 71fc 	movw	r1, #65532	@ 0xfffc
c0de3656:	eb01 0080 	add.w	r0, r1, r0, lsl #2
c0de365a:	f50d 618f 	add.w	r1, sp, #1144	@ 0x478
c0de365e:	9008      	str	r0, [sp, #32]
c0de3660:	2000      	movs	r0, #0
c0de3662:	2804      	cmp	r0, #4
c0de3664:	d00b      	beq.n	c0de367e <crypto_sign_signature_core+0xce>
c0de3666:	2200      	movs	r2, #0
c0de3668:	f5b2 7f40 	cmp.w	r2, #768	@ 0x300
c0de366c:	d003      	beq.n	c0de3676 <crypto_sign_signature_core+0xc6>
c0de366e:	f801 b002 	strb.w	fp, [r1, r2]
c0de3672:	3201      	adds	r2, #1
c0de3674:	e7f8      	b.n	c0de3668 <crypto_sign_signature_core+0xb8>
c0de3676:	f501 7140 	add.w	r1, r1, #768	@ 0x300
c0de367a:	3001      	adds	r0, #1
c0de367c:	e7f1      	b.n	c0de3662 <crypto_sign_signature_core+0xb2>
c0de367e:	9806      	ldr	r0, [sp, #24]
c0de3680:	f04f 0a00 	mov.w	sl, #0
c0de3684:	b280      	uxth	r0, r0
c0de3686:	0080      	lsls	r0, r0, #2
c0de3688:	900a      	str	r0, [sp, #40]	@ 0x28
c0de368a:	f1ba 0f04 	cmp.w	sl, #4
c0de368e:	d026      	beq.n	c0de36de <crypto_sign_signature_core+0x12e>
c0de3690:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de3692:	eb09 0308 	add.w	r3, r9, r8
c0de3696:	f503 71f0 	add.w	r1, r3, #480	@ 0x1e0
c0de369a:	4450      	add	r0, sl
c0de369c:	b282      	uxth	r2, r0
c0de369e:	4620      	mov	r0, r4
c0de36a0:	f7ff f8c7 	bl	c0de2832 <poly_uniform_gamma1_lowram>
c0de36a4:	4620      	mov	r0, r4
c0de36a6:	f7ff fb4a 	bl	c0de2d3e <pqcrystals_dilithium2_lowram_poly_ntt>
c0de36aa:	2700      	movs	r7, #0
c0de36ac:	f50d 658f 	add.w	r5, sp, #1144	@ 0x478
c0de36b0:	f5b7 6f80 	cmp.w	r7, #1024	@ 0x400
c0de36b4:	d010      	beq.n	c0de36d8 <crypto_sign_signature_core+0x128>
c0de36b6:	eb09 0008 	add.w	r0, r9, r8
c0de36ba:	4621      	mov	r1, r4
c0de36bc:	4632      	mov	r2, r6
c0de36be:	30d0      	adds	r0, #208	@ 0xd0
c0de36c0:	9000      	str	r0, [sp, #0]
c0de36c2:	eb0a 0007 	add.w	r0, sl, r7
c0de36c6:	b283      	uxth	r3, r0
c0de36c8:	4628      	mov	r0, r5
c0de36ca:	f7ff f86f 	bl	c0de27ac <poly_uniform_pointwise_montgomery_polywadd_lowram>
c0de36ce:	f505 7540 	add.w	r5, r5, #768	@ 0x300
c0de36d2:	f507 7780 	add.w	r7, r7, #256	@ 0x100
c0de36d6:	e7eb      	b.n	c0de36b0 <crypto_sign_signature_core+0x100>
c0de36d8:	f10a 0a01 	add.w	sl, sl, #1
c0de36dc:	e7d5      	b.n	c0de368a <crypto_sign_signature_core+0xda>
c0de36de:	2700      	movs	r7, #0
c0de36e0:	f50d 658f 	add.w	r5, sp, #1144	@ 0x478
c0de36e4:	f5b7 7f40 	cmp.w	r7, #768	@ 0x300
c0de36e8:	d01a      	beq.n	c0de3720 <crypto_sign_signature_core+0x170>
c0de36ea:	4620      	mov	r0, r4
c0de36ec:	4629      	mov	r1, r5
c0de36ee:	f7fe ffd4 	bl	c0de269a <polyw_unpack>
c0de36f2:	4620      	mov	r0, r4
c0de36f4:	f7ff fb25 	bl	c0de2d42 <pqcrystals_dilithium2_lowram_poly_invntt_tomont>
c0de36f8:	4620      	mov	r0, r4
c0de36fa:	f7ff fb02 	bl	c0de2d02 <pqcrystals_dilithium2_lowram_poly_caddq>
c0de36fe:	4628      	mov	r0, r5
c0de3700:	4621      	mov	r1, r4
c0de3702:	f7fe ffac 	bl	c0de265e <polyw_pack>
c0de3706:	4620      	mov	r0, r4
c0de3708:	4621      	mov	r1, r4
c0de370a:	f7fe fff6 	bl	c0de26fa <poly_highbits>
c0de370e:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de3710:	4621      	mov	r1, r4
c0de3712:	4438      	add	r0, r7
c0de3714:	f7ff fd90 	bl	c0de3238 <pqcrystals_dilithium2_lowram_polyw1_pack>
c0de3718:	f505 7540 	add.w	r5, r5, #768	@ 0x300
c0de371c:	37c0      	adds	r7, #192	@ 0xc0
c0de371e:	e7e1      	b.n	c0de36e4 <crypto_sign_signature_core+0x134>
c0de3720:	eb09 0508 	add.w	r5, r9, r8
c0de3724:	4628      	mov	r0, r5
c0de3726:	f7fd fd17 	bl	c0de1158 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de372a:	f505 71d0 	add.w	r1, r5, #416	@ 0x1a0
c0de372e:	4628      	mov	r0, r5
c0de3730:	2240      	movs	r2, #64	@ 0x40
c0de3732:	f7fd fd19 	bl	c0de1168 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de3736:	9f0b      	ldr	r7, [sp, #44]	@ 0x2c
c0de3738:	4628      	mov	r0, r5
c0de373a:	f44f 7240 	mov.w	r2, #768	@ 0x300
c0de373e:	4639      	mov	r1, r7
c0de3740:	f7fd fd12 	bl	c0de1168 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de3744:	4628      	mov	r0, r5
c0de3746:	f7fd fd1a 	bl	c0de117e <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de374a:	4638      	mov	r0, r7
c0de374c:	2120      	movs	r1, #32
c0de374e:	462a      	mov	r2, r5
c0de3750:	f7fd fd20 	bl	c0de1194 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de3754:	4620      	mov	r0, r4
c0de3756:	4639      	mov	r1, r7
c0de3758:	f7ff fc31 	bl	c0de2fbe <pqcrystals_dilithium2_lowram_poly_challenge>
c0de375c:	f20d 4034 	addw	r0, sp, #1076	@ 0x434
c0de3760:	4621      	mov	r1, r4
c0de3762:	f7fe fda9 	bl	c0de22b8 <poly_challenge_compress>
c0de3766:	9806      	ldr	r0, [sp, #24]
c0de3768:	f8dd a010 	ldr.w	sl, [sp, #16]
c0de376c:	2500      	movs	r5, #0
c0de376e:	3001      	adds	r0, #1
c0de3770:	9006      	str	r0, [sp, #24]
c0de3772:	b135      	cbz	r5, c0de3782 <crypto_sign_signature_core+0x1d2>
c0de3774:	2d04      	cmp	r5, #4
c0de3776:	d032      	beq.n	c0de37de <crypto_sign_signature_core+0x22e>
c0de3778:	4620      	mov	r0, r4
c0de377a:	f20d 4134 	addw	r1, sp, #1076	@ 0x434
c0de377e:	f7fe fdd0 	bl	c0de2322 <poly_challenge_decompress>
c0de3782:	f000 f9e7 	bl	c0de3b54 <OUTLINED_FUNCTION_0>
c0de3786:	4620      	mov	r0, r4
c0de3788:	4631      	mov	r1, r6
c0de378a:	462a      	mov	r2, r5
c0de378c:	f7fe fffe 	bl	c0de278c <unpack_sk_s1>
c0de3790:	4620      	mov	r0, r4
c0de3792:	f000 f9e5 	bl	c0de3b60 <small_ntt>
c0de3796:	4620      	mov	r0, r4
c0de3798:	4639      	mov	r1, r7
c0de379a:	4622      	mov	r2, r4
c0de379c:	f000 fb04 	bl	c0de3da8 <poly_small_basemul_invntt>
c0de37a0:	eb09 0008 	add.w	r0, r9, r8
c0de37a4:	4621      	mov	r1, r4
c0de37a6:	9000      	str	r0, [sp, #0]
c0de37a8:	f500 72f0 	add.w	r2, r0, #480	@ 0x1e0
c0de37ac:	9808      	ldr	r0, [sp, #32]
c0de37ae:	4428      	add	r0, r5
c0de37b0:	b283      	uxth	r3, r0
c0de37b2:	4620      	mov	r0, r4
c0de37b4:	f7ff f88a 	bl	c0de28cc <poly_uniform_gamma1_add_lowram>
c0de37b8:	4620      	mov	r0, r4
c0de37ba:	f7ff fa93 	bl	c0de2ce4 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de37be:	4840      	ldr	r0, [pc, #256]	@ (c0de38c0 <crypto_sign_signature_core+0x310>)
c0de37c0:	f500 410c 	add.w	r1, r0, #35840	@ 0x8c00
c0de37c4:	4620      	mov	r0, r4
c0de37c6:	f7ff fadf 	bl	c0de2d88 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de37ca:	2800      	cmp	r0, #0
c0de37cc:	d165      	bne.n	c0de389a <crypto_sign_signature_core+0x2ea>
c0de37ce:	4650      	mov	r0, sl
c0de37d0:	4621      	mov	r1, r4
c0de37d2:	f7ff fd00 	bl	c0de31d6 <pqcrystals_dilithium2_lowram_polyz_pack>
c0de37d6:	f50a 7a10 	add.w	sl, sl, #576	@ 0x240
c0de37da:	3501      	adds	r5, #1
c0de37dc:	e7c9      	b.n	c0de3772 <crypto_sign_signature_core+0x1c2>
c0de37de:	f8dd a00c 	ldr.w	sl, [sp, #12]
c0de37e2:	2100      	movs	r1, #0
c0de37e4:	2000      	movs	r0, #0
c0de37e6:	f50d 658f 	add.w	r5, sp, #1144	@ 0x478
c0de37ea:	2700      	movs	r7, #0
c0de37ec:	9008      	str	r0, [sp, #32]
c0de37ee:	910c      	str	r1, [sp, #48]	@ 0x30
c0de37f0:	2f04      	cmp	r7, #4
c0de37f2:	d055      	beq.n	c0de38a0 <crypto_sign_signature_core+0x2f0>
c0de37f4:	4620      	mov	r0, r4
c0de37f6:	f20d 4134 	addw	r1, sp, #1076	@ 0x434
c0de37fa:	f7fe fd92 	bl	c0de2322 <poly_challenge_decompress>
c0de37fe:	950a      	str	r5, [sp, #40]	@ 0x28
c0de3800:	463d      	mov	r5, r7
c0de3802:	f000 f9a7 	bl	c0de3b54 <OUTLINED_FUNCTION_0>
c0de3806:	4620      	mov	r0, r4
c0de3808:	4631      	mov	r1, r6
c0de380a:	462a      	mov	r2, r5
c0de380c:	9507      	str	r5, [sp, #28]
c0de380e:	f7fe ffc4 	bl	c0de279a <unpack_sk_s2>
c0de3812:	4620      	mov	r0, r4
c0de3814:	f000 f9a4 	bl	c0de3b60 <small_ntt>
c0de3818:	4620      	mov	r0, r4
c0de381a:	4639      	mov	r1, r7
c0de381c:	9d0a      	ldr	r5, [sp, #40]	@ 0x28
c0de381e:	4622      	mov	r2, r4
c0de3820:	f000 fac2 	bl	c0de3da8 <poly_small_basemul_invntt>
c0de3824:	4620      	mov	r0, r4
c0de3826:	4629      	mov	r1, r5
c0de3828:	4622      	mov	r2, r4
c0de382a:	f7fe ff4e 	bl	c0de26ca <polyw_sub>
c0de382e:	4620      	mov	r0, r4
c0de3830:	f7ff fa58 	bl	c0de2ce4 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de3834:	4628      	mov	r0, r5
c0de3836:	4621      	mov	r1, r4
c0de3838:	f7fe ff11 	bl	c0de265e <polyw_pack>
c0de383c:	4620      	mov	r0, r4
c0de383e:	4621      	mov	r1, r4
c0de3840:	f7fe ff74 	bl	c0de272c <poly_lowbits>
c0de3844:	4620      	mov	r0, r4
c0de3846:	f7ff fa4d 	bl	c0de2ce4 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de384a:	491d      	ldr	r1, [pc, #116]	@ (c0de38c0 <crypto_sign_signature_core+0x310>)
c0de384c:	4620      	mov	r0, r4
c0de384e:	f7ff fa9b 	bl	c0de2d88 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de3852:	bb10      	cbnz	r0, c0de389a <crypto_sign_signature_core+0x2ea>
c0de3854:	4620      	mov	r0, r4
c0de3856:	f20d 4134 	addw	r1, sp, #1076	@ 0x434
c0de385a:	4652      	mov	r2, sl
c0de385c:	f7fe fd93 	bl	c0de2386 <poly_schoolbook>
c0de3860:	4620      	mov	r0, r4
c0de3862:	f44f 31ba 	mov.w	r1, #95232	@ 0x17400
c0de3866:	f7ff fa8f 	bl	c0de2d88 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de386a:	b9b0      	cbnz	r0, c0de389a <crypto_sign_signature_core+0x2ea>
c0de386c:	4620      	mov	r0, r4
c0de386e:	4621      	mov	r1, r4
c0de3870:	462a      	mov	r2, r5
c0de3872:	f7ff f84f 	bl	c0de2914 <poly_make_hint_lowram>
c0de3876:	9908      	ldr	r1, [sp, #32]
c0de3878:	4401      	add	r1, r0
c0de387a:	2950      	cmp	r1, #80	@ 0x50
c0de387c:	9108      	str	r1, [sp, #32]
c0de387e:	d80c      	bhi.n	c0de389a <crypto_sign_signature_core+0x2ea>
c0de3880:	9f07      	ldr	r7, [sp, #28]
c0de3882:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de3884:	4621      	mov	r1, r4
c0de3886:	ab0c      	add	r3, sp, #48	@ 0x30
c0de3888:	463a      	mov	r2, r7
c0de388a:	f7fe fcf3 	bl	c0de2274 <pqcrystals_dilithium2_lowram_pack_sig_h>
c0de388e:	f50a 7ad0 	add.w	sl, sl, #416	@ 0x1a0
c0de3892:	f505 7540 	add.w	r5, r5, #768	@ 0x300
c0de3896:	3701      	adds	r7, #1
c0de3898:	e7aa      	b.n	c0de37f0 <crypto_sign_signature_core+0x240>
c0de389a:	9805      	ldr	r0, [sp, #20]
c0de389c:	3001      	adds	r0, #1
c0de389e:	e6d6      	b.n	c0de364e <crypto_sign_signature_core+0x9e>
c0de38a0:	a90c      	add	r1, sp, #48	@ 0x30
c0de38a2:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de38a4:	f7fe fcfc 	bl	c0de22a0 <pqcrystals_dilithium2_lowram_pack_sig_h_zero>
c0de38a8:	9902      	ldr	r1, [sp, #8]
c0de38aa:	f640 1074 	movw	r0, #2420	@ 0x974
c0de38ae:	6008      	str	r0, [r1, #0]
c0de38b0:	2000      	movs	r0, #0
c0de38b2:	f50d 5d83 	add.w	sp, sp, #4192	@ 0x1060
c0de38b6:	b006      	add	sp, #24
c0de38b8:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de38bc:	000002d8 	.word	0x000002d8
c0de38c0:	000173b2 	.word	0x000173b2
c0de38c4:	ffffdb59 	.word	0xffffdb59

c0de38c8 <pqcrystals_dilithium2_lowram_verify>:
c0de38c8:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de38cc:	f5ad 6d10 	sub.w	sp, sp, #2304	@ 0x900
c0de38d0:	4615      	mov	r5, r2
c0de38d2:	f640 1274 	movw	r2, #2420	@ 0x974
c0de38d6:	4604      	mov	r4, r0
c0de38d8:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de38dc:	4291      	cmp	r1, r2
c0de38de:	f040 80ea 	bne.w	c0de3ab6 <pqcrystals_dilithium2_lowram_verify+0x1ee>
c0de38e2:	f8dd a924 	ldr.w	sl, [sp, #2340]	@ 0x924
c0de38e6:	f1ba 0fff 	cmp.w	sl, #255	@ 0xff
c0de38ea:	f200 80e4 	bhi.w	c0de3ab6 <pqcrystals_dilithium2_lowram_verify+0x1ee>
c0de38ee:	4f80      	ldr	r7, [pc, #512]	@ (c0de3af0 <pqcrystals_dilithium2_lowram_verify+0x228>)
c0de38f0:	f10d 0be8 	add.w	fp, sp, #232	@ 0xe8
c0de38f4:	f8dd 6928 	ldr.w	r6, [sp, #2344]	@ 0x928
c0de38f8:	9305      	str	r3, [sp, #20]
c0de38fa:	4658      	mov	r0, fp
c0de38fc:	447f      	add	r7, pc
c0de38fe:	47b8      	blx	r7
c0de3900:	9504      	str	r5, [sp, #16]
c0de3902:	4658      	mov	r0, fp
c0de3904:	4631      	mov	r1, r6
c0de3906:	f44f 62a4 	mov.w	r2, #1312	@ 0x520
c0de390a:	4d7a      	ldr	r5, [pc, #488]	@ (c0de3af4 <pqcrystals_dilithium2_lowram_verify+0x22c>)
c0de390c:	447d      	add	r5, pc
c0de390e:	47a8      	blx	r5
c0de3910:	4658      	mov	r0, fp
c0de3912:	f7fd fc34 	bl	c0de117e <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de3916:	f50d 78dc 	add.w	r8, sp, #440	@ 0x1b8
c0de391a:	2140      	movs	r1, #64	@ 0x40
c0de391c:	465a      	mov	r2, fp
c0de391e:	4640      	mov	r0, r8
c0de3920:	f7fd fc38 	bl	c0de1194 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de3924:	4658      	mov	r0, fp
c0de3926:	47b8      	blx	r7
c0de3928:	4658      	mov	r0, fp
c0de392a:	4641      	mov	r1, r8
c0de392c:	2240      	movs	r2, #64	@ 0x40
c0de392e:	47a8      	blx	r5
c0de3930:	f88d a1b9 	strb.w	sl, [sp, #441]	@ 0x1b9
c0de3934:	4656      	mov	r6, sl
c0de3936:	f04f 0a00 	mov.w	sl, #0
c0de393a:	4658      	mov	r0, fp
c0de393c:	4641      	mov	r1, r8
c0de393e:	2202      	movs	r2, #2
c0de3940:	f88d a1b8 	strb.w	sl, [sp, #440]	@ 0x1b8
c0de3944:	47a8      	blx	r5
c0de3946:	f8dd 1920 	ldr.w	r1, [sp, #2336]	@ 0x920
c0de394a:	4658      	mov	r0, fp
c0de394c:	4632      	mov	r2, r6
c0de394e:	47a8      	blx	r5
c0de3950:	e9dd 1204 	ldrd	r1, r2, [sp, #16]
c0de3954:	4658      	mov	r0, fp
c0de3956:	47a8      	blx	r5
c0de3958:	4658      	mov	r0, fp
c0de395a:	f7fd fc10 	bl	c0de117e <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de395e:	4640      	mov	r0, r8
c0de3960:	2140      	movs	r1, #64	@ 0x40
c0de3962:	465a      	mov	r2, fp
c0de3964:	f7fd fc16 	bl	c0de1194 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de3968:	4658      	mov	r0, fp
c0de396a:	47b8      	blx	r7
c0de396c:	4658      	mov	r0, fp
c0de396e:	4641      	mov	r1, r8
c0de3970:	2240      	movs	r2, #64	@ 0x40
c0de3972:	47a8      	blx	r5
c0de3974:	f20d 46fc 	addw	r6, sp, #1276	@ 0x4fc
c0de3978:	4621      	mov	r1, r4
c0de397a:	4630      	mov	r0, r6
c0de397c:	f7ff f8a1 	bl	c0de2ac2 <poly_challenge_lowram>
c0de3980:	4640      	mov	r0, r8
c0de3982:	4631      	mov	r1, r6
c0de3984:	f7fe fc98 	bl	c0de22b8 <poly_challenge_compress>
c0de3988:	f8dd 0928 	ldr.w	r0, [sp, #2344]	@ 0x928
c0de398c:	f104 0520 	add.w	r5, r4, #32
c0de3990:	f10d 0b18 	add.w	fp, sp, #24
c0de3994:	f50d 78fe 	add.w	r8, sp, #508	@ 0x1fc
c0de3998:	2700      	movs	r7, #0
c0de399a:	9502      	str	r5, [sp, #8]
c0de399c:	3020      	adds	r0, #32
c0de399e:	9003      	str	r0, [sp, #12]
c0de39a0:	2001      	movs	r0, #1
c0de39a2:	9005      	str	r0, [sp, #20]
c0de39a4:	2f04      	cmp	r7, #4
c0de39a6:	f000 808a 	beq.w	c0de3abe <pqcrystals_dilithium2_lowram_verify+0x1f6>
c0de39aa:	2000      	movs	r0, #0
c0de39ac:	f5b0 7f40 	cmp.w	r0, #768	@ 0x300
c0de39b0:	d003      	beq.n	c0de39ba <pqcrystals_dilithium2_lowram_verify+0xf2>
c0de39b2:	f808 a000 	strb.w	sl, [r8, r0]
c0de39b6:	3001      	adds	r0, #1
c0de39b8:	e7f8      	b.n	c0de39ac <pqcrystals_dilithium2_lowram_verify+0xe4>
c0de39ba:	4630      	mov	r0, r6
c0de39bc:	4629      	mov	r1, r5
c0de39be:	f7ff faae 	bl	c0de2f1e <pqcrystals_dilithium2_lowram_polyz_unpack>
c0de39c2:	494a      	ldr	r1, [pc, #296]	@ (c0de3aec <pqcrystals_dilithium2_lowram_verify+0x224>)
c0de39c4:	4630      	mov	r0, r6
c0de39c6:	f7ff f9df 	bl	c0de2d88 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de39ca:	2800      	cmp	r0, #0
c0de39cc:	d171      	bne.n	c0de3ab2 <pqcrystals_dilithium2_lowram_verify+0x1ea>
c0de39ce:	4630      	mov	r0, r6
c0de39d0:	f7ff f9b5 	bl	c0de2d3e <pqcrystals_dilithium2_lowram_poly_ntt>
c0de39d4:	0238      	lsls	r0, r7, #8
c0de39d6:	f8dd 2928 	ldr.w	r2, [sp, #2344]	@ 0x928
c0de39da:	4631      	mov	r1, r6
c0de39dc:	465d      	mov	r5, fp
c0de39de:	f8cd b000 	str.w	fp, [sp]
c0de39e2:	9704      	str	r7, [sp, #16]
c0de39e4:	b283      	uxth	r3, r0
c0de39e6:	4640      	mov	r0, r8
c0de39e8:	f7fe fee0 	bl	c0de27ac <poly_uniform_pointwise_montgomery_polywadd_lowram>
c0de39ec:	9f05      	ldr	r7, [sp, #20]
c0de39ee:	f44f 7b18 	mov.w	fp, #608	@ 0x260
c0de39f2:	f5bb 6f12 	cmp.w	fp, #2336	@ 0x920
c0de39f6:	d019      	beq.n	c0de3a2c <pqcrystals_dilithium2_lowram_verify+0x164>
c0de39f8:	eb04 010b 	add.w	r1, r4, fp
c0de39fc:	4630      	mov	r0, r6
c0de39fe:	f7ff fa8e 	bl	c0de2f1e <pqcrystals_dilithium2_lowram_polyz_unpack>
c0de3a02:	493a      	ldr	r1, [pc, #232]	@ (c0de3aec <pqcrystals_dilithium2_lowram_verify+0x224>)
c0de3a04:	4630      	mov	r0, r6
c0de3a06:	f7ff f9bf 	bl	c0de2d88 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de3a0a:	2800      	cmp	r0, #0
c0de3a0c:	d151      	bne.n	c0de3ab2 <pqcrystals_dilithium2_lowram_verify+0x1ea>
c0de3a0e:	4630      	mov	r0, r6
c0de3a10:	f7ff f995 	bl	c0de2d3e <pqcrystals_dilithium2_lowram_poly_ntt>
c0de3a14:	f8dd 2928 	ldr.w	r2, [sp, #2344]	@ 0x928
c0de3a18:	b2bb      	uxth	r3, r7
c0de3a1a:	4640      	mov	r0, r8
c0de3a1c:	4631      	mov	r1, r6
c0de3a1e:	9500      	str	r5, [sp, #0]
c0de3a20:	f7fe fec4 	bl	c0de27ac <poly_uniform_pointwise_montgomery_polywadd_lowram>
c0de3a24:	3701      	adds	r7, #1
c0de3a26:	f50b 7b10 	add.w	fp, fp, #576	@ 0x240
c0de3a2a:	e7e2      	b.n	c0de39f2 <pqcrystals_dilithium2_lowram_verify+0x12a>
c0de3a2c:	4630      	mov	r0, r6
c0de3a2e:	4641      	mov	r1, r8
c0de3a30:	f7fe fe33 	bl	c0de269a <polyw_unpack>
c0de3a34:	4630      	mov	r0, r6
c0de3a36:	f7ff f955 	bl	c0de2ce4 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de3a3a:	4630      	mov	r0, r6
c0de3a3c:	f7ff f981 	bl	c0de2d42 <pqcrystals_dilithium2_lowram_poly_invntt_tomont>
c0de3a40:	4640      	mov	r0, r8
c0de3a42:	4631      	mov	r1, r6
c0de3a44:	f7fe fe0b 	bl	c0de265e <polyw_pack>
c0de3a48:	9f04      	ldr	r7, [sp, #16]
c0de3a4a:	9903      	ldr	r1, [sp, #12]
c0de3a4c:	eb07 0087 	add.w	r0, r7, r7, lsl #2
c0de3a50:	eb01 1280 	add.w	r2, r1, r0, lsl #6
c0de3a54:	4630      	mov	r0, r6
c0de3a56:	a96e      	add	r1, sp, #440	@ 0x1b8
c0de3a58:	f7fe fd5a 	bl	c0de2510 <poly_schoolbook_t1>
c0de3a5c:	4630      	mov	r0, r6
c0de3a5e:	4641      	mov	r1, r8
c0de3a60:	4632      	mov	r2, r6
c0de3a62:	f7fe fe32 	bl	c0de26ca <polyw_sub>
c0de3a66:	4630      	mov	r0, r6
c0de3a68:	f7ff f93c 	bl	c0de2ce4 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de3a6c:	4630      	mov	r0, r6
c0de3a6e:	f7ff f948 	bl	c0de2d02 <pqcrystals_dilithium2_lowram_poly_caddq>
c0de3a72:	4628      	mov	r0, r5
c0de3a74:	f60d 01fc 	addw	r1, sp, #2300	@ 0x8fc
c0de3a78:	463a      	mov	r2, r7
c0de3a7a:	4623      	mov	r3, r4
c0de3a7c:	46ab      	mov	fp, r5
c0de3a7e:	f7fe ff83 	bl	c0de2988 <unpack_sig_h_indices>
c0de3a82:	b9b0      	cbnz	r0, c0de3ab2 <pqcrystals_dilithium2_lowram_verify+0x1ea>
c0de3a84:	f8dd 38fc 	ldr.w	r3, [sp, #2300]	@ 0x8fc
c0de3a88:	4630      	mov	r0, r6
c0de3a8a:	4631      	mov	r1, r6
c0de3a8c:	465a      	mov	r2, fp
c0de3a8e:	f7fe ffb9 	bl	c0de2a04 <poly_use_hint_lowram>
c0de3a92:	4640      	mov	r0, r8
c0de3a94:	4631      	mov	r1, r6
c0de3a96:	f7ff fbcf 	bl	c0de3238 <pqcrystals_dilithium2_lowram_polyw1_pack>
c0de3a9a:	a83a      	add	r0, sp, #232	@ 0xe8
c0de3a9c:	4641      	mov	r1, r8
c0de3a9e:	22c0      	movs	r2, #192	@ 0xc0
c0de3aa0:	f7fd fb62 	bl	c0de1168 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de3aa4:	9805      	ldr	r0, [sp, #20]
c0de3aa6:	9d02      	ldr	r5, [sp, #8]
c0de3aa8:	3701      	adds	r7, #1
c0de3aaa:	f500 7080 	add.w	r0, r0, #256	@ 0x100
c0de3aae:	9005      	str	r0, [sp, #20]
c0de3ab0:	e778      	b.n	c0de39a4 <pqcrystals_dilithium2_lowram_verify+0xdc>
c0de3ab2:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de3ab6:	f50d 6d10 	add.w	sp, sp, #2304	@ 0x900
c0de3aba:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de3abe:	ad3a      	add	r5, sp, #232	@ 0xe8
c0de3ac0:	4628      	mov	r0, r5
c0de3ac2:	f7fd fb5c 	bl	c0de117e <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de3ac6:	4658      	mov	r0, fp
c0de3ac8:	2120      	movs	r1, #32
c0de3aca:	462a      	mov	r2, r5
c0de3acc:	f7fd fb62 	bl	c0de1194 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de3ad0:	2100      	movs	r1, #0
c0de3ad2:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de3ad6:	2920      	cmp	r1, #32
c0de3ad8:	d006      	beq.n	c0de3ae8 <pqcrystals_dilithium2_lowram_verify+0x220>
c0de3ada:	f81b 2001 	ldrb.w	r2, [fp, r1]
c0de3ade:	5c63      	ldrb	r3, [r4, r1]
c0de3ae0:	3101      	adds	r1, #1
c0de3ae2:	4293      	cmp	r3, r2
c0de3ae4:	d0f7      	beq.n	c0de3ad6 <pqcrystals_dilithium2_lowram_verify+0x20e>
c0de3ae6:	e7e6      	b.n	c0de3ab6 <pqcrystals_dilithium2_lowram_verify+0x1ee>
c0de3ae8:	2000      	movs	r0, #0
c0de3aea:	e7e4      	b.n	c0de3ab6 <pqcrystals_dilithium2_lowram_verify+0x1ee>
c0de3aec:	0001ffb2 	.word	0x0001ffb2
c0de3af0:	ffffd859 	.word	0xffffd859
c0de3af4:	ffffd859 	.word	0xffffd859

c0de3af8 <pqcrystals_dilithium2_lowram_open>:
c0de3af8:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de3afa:	4604      	mov	r4, r0
c0de3afc:	f640 1074 	movw	r0, #2420	@ 0x974
c0de3b00:	461d      	mov	r5, r3
c0de3b02:	460e      	mov	r6, r1
c0de3b04:	4283      	cmp	r3, r0
c0de3b06:	d311      	bcc.n	c0de3b2c <pqcrystals_dilithium2_lowram_open+0x34>
c0de3b08:	e9dd 7108 	ldrd	r7, r1, [sp, #32]
c0de3b0c:	f6a5 1374 	subw	r3, r5, #2420	@ 0x974
c0de3b10:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de3b12:	6033      	str	r3, [r6, #0]
c0de3b14:	e9cd 7100 	strd	r7, r1, [sp]
c0de3b18:	f602 1774 	addw	r7, r2, #2420	@ 0x974
c0de3b1c:	9002      	str	r0, [sp, #8]
c0de3b1e:	4610      	mov	r0, r2
c0de3b20:	f640 1174 	movw	r1, #2420	@ 0x974
c0de3b24:	463a      	mov	r2, r7
c0de3b26:	f7ff fecf 	bl	c0de38c8 <pqcrystals_dilithium2_lowram_verify>
c0de3b2a:	b148      	cbz	r0, c0de3b40 <pqcrystals_dilithium2_lowram_open+0x48>
c0de3b2c:	2000      	movs	r0, #0
c0de3b2e:	6030      	str	r0, [r6, #0]
c0de3b30:	b11d      	cbz	r5, c0de3b3a <pqcrystals_dilithium2_lowram_open+0x42>
c0de3b32:	f804 0b01 	strb.w	r0, [r4], #1
c0de3b36:	3d01      	subs	r5, #1
c0de3b38:	e7fa      	b.n	c0de3b30 <pqcrystals_dilithium2_lowram_open+0x38>
c0de3b3a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de3b3e:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
c0de3b40:	2000      	movs	r0, #0
c0de3b42:	6831      	ldr	r1, [r6, #0]
c0de3b44:	4288      	cmp	r0, r1
c0de3b46:	bf24      	itt	cs
c0de3b48:	2000      	movcs	r0, #0
c0de3b4a:	bdfe      	popcs	{r1, r2, r3, r4, r5, r6, r7, pc}
c0de3b4c:	5c39      	ldrb	r1, [r7, r0]
c0de3b4e:	5421      	strb	r1, [r4, r0]
c0de3b50:	3001      	adds	r0, #1
c0de3b52:	e7f6      	b.n	c0de3b42 <pqcrystals_dilithium2_lowram_open+0x4a>

c0de3b54 <OUTLINED_FUNCTION_0>:
c0de3b54:	9f09      	ldr	r7, [sp, #36]	@ 0x24
c0de3b56:	4621      	mov	r1, r4
c0de3b58:	4638      	mov	r0, r7
c0de3b5a:	f000 b8ed 	b.w	c0de3d38 <poly_small_ntt_copy>
	...

c0de3b60 <small_ntt>:
c0de3b60:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3b64:	491c      	ldr	r1, [pc, #112]	@ (c0de3bd8 <small_ntt+0x78>)
c0de3b66:	f04f 0c80 	mov.w	ip, #128	@ 0x80
c0de3b6a:	f04f 0e01 	mov.w	lr, #1
c0de3b6e:	f46f 6850 	mvn.w	r8, #3328	@ 0xd00
c0de3b72:	4479      	add	r1, pc
c0de3b74:	468a      	mov	sl, r1
c0de3b76:	4917      	ldr	r1, [pc, #92]	@ (c0de3bd4 <small_ntt+0x74>)
c0de3b78:	468b      	mov	fp, r1
c0de3b7a:	f1bc 0f02 	cmp.w	ip, #2
c0de3b7e:	bf38      	it	cc
c0de3b80:	e8bd 8df0 	ldmiacc.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de3b84:	2600      	movs	r6, #0
c0de3b86:	2eff      	cmp	r6, #255	@ 0xff
c0de3b88:	d821      	bhi.n	c0de3bce <small_ntt+0x6e>
c0de3b8a:	4651      	mov	r1, sl
c0de3b8c:	f93a 301e 	ldrsh.w	r3, [sl, lr, lsl #1]
c0de3b90:	eb06 010c 	add.w	r1, r6, ip
c0de3b94:	460f      	mov	r7, r1
c0de3b96:	428e      	cmp	r6, r1
c0de3b98:	d215      	bcs.n	c0de3bc6 <small_ntt+0x66>
c0de3b9a:	f930 2017 	ldrsh.w	r2, [r0, r7, lsl #1]
c0de3b9e:	465c      	mov	r4, fp
c0de3ba0:	435a      	muls	r2, r3
c0de3ba2:	fb02 f40b 	mul.w	r4, r2, fp
c0de3ba6:	1424      	asrs	r4, r4, #16
c0de3ba8:	fb04 2208 	mla	r2, r4, r8, r2
c0de3bac:	f830 4016 	ldrh.w	r4, [r0, r6, lsl #1]
c0de3bb0:	eba4 4512 	sub.w	r5, r4, r2, lsr #16
c0de3bb4:	eb04 4212 	add.w	r2, r4, r2, lsr #16
c0de3bb8:	f820 5017 	strh.w	r5, [r0, r7, lsl #1]
c0de3bbc:	f820 2016 	strh.w	r2, [r0, r6, lsl #1]
c0de3bc0:	3701      	adds	r7, #1
c0de3bc2:	3601      	adds	r6, #1
c0de3bc4:	e7e7      	b.n	c0de3b96 <small_ntt+0x36>
c0de3bc6:	f10e 0e01 	add.w	lr, lr, #1
c0de3bca:	463e      	mov	r6, r7
c0de3bcc:	e7db      	b.n	c0de3b86 <small_ntt+0x26>
c0de3bce:	ea4f 0c5c 	mov.w	ip, ip, lsr #1
c0de3bd2:	e7d2      	b.n	c0de3b7a <small_ntt+0x1a>
c0de3bd4:	f3010000 	.word	0xf3010000
c0de3bd8:	0000bb12 	.word	0x0000bb12

c0de3bdc <small_invntt_tomont>:
c0de3bdc:	e92d 4dfe 	stmdb	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de3be0:	4934      	ldr	r1, [pc, #208]	@ (c0de3cb4 <small_invntt_tomont+0xd8>)
c0de3be2:	4b36      	ldr	r3, [pc, #216]	@ (c0de3cbc <small_invntt_tomont+0xe0>)
c0de3be4:	2202      	movs	r2, #2
c0de3be6:	247f      	movs	r4, #127	@ 0x7f
c0de3be8:	f644 68bf 	movw	r8, #20159	@ 0x4ebf
c0de3bec:	f46f 6a50 	mvn.w	sl, #3328	@ 0xd00
c0de3bf0:	468e      	mov	lr, r1
c0de3bf2:	4931      	ldr	r1, [pc, #196]	@ (c0de3cb8 <small_invntt_tomont+0xdc>)
c0de3bf4:	447b      	add	r3, pc
c0de3bf6:	9300      	str	r3, [sp, #0]
c0de3bf8:	f101 5bd3 	add.w	fp, r1, #442499072	@ 0x1a600000
c0de3bfc:	2a80      	cmp	r2, #128	@ 0x80
c0de3bfe:	d834      	bhi.n	c0de3c6a <small_invntt_tomont+0x8e>
c0de3c00:	2300      	movs	r3, #0
c0de3c02:	9201      	str	r2, [sp, #4]
c0de3c04:	2bff      	cmp	r3, #255	@ 0xff
c0de3c06:	d82e      	bhi.n	c0de3c66 <small_invntt_tomont+0x8a>
c0de3c08:	9900      	ldr	r1, [sp, #0]
c0de3c0a:	9402      	str	r4, [sp, #8]
c0de3c0c:	f931 4014 	ldrsh.w	r4, [r1, r4, lsl #1]
c0de3c10:	1899      	adds	r1, r3, r2
c0de3c12:	460d      	mov	r5, r1
c0de3c14:	428b      	cmp	r3, r1
c0de3c16:	d221      	bcs.n	c0de3c5c <small_invntt_tomont+0x80>
c0de3c18:	f830 6013 	ldrh.w	r6, [r0, r3, lsl #1]
c0de3c1c:	f830 2015 	ldrh.w	r2, [r0, r5, lsl #1]
c0de3c20:	46f4      	mov	ip, lr
c0de3c22:	4432      	add	r2, r6
c0de3c24:	b217      	sxth	r7, r2
c0de3c26:	fb07 f708 	mul.w	r7, r7, r8
c0de3c2a:	f107 7700 	add.w	r7, r7, #33554432	@ 0x2000000
c0de3c2e:	16bf      	asrs	r7, r7, #26
c0de3c30:	fb07 f70e 	mul.w	r7, r7, lr
c0de3c34:	eba2 4217 	sub.w	r2, r2, r7, lsr #16
c0de3c38:	f820 2013 	strh.w	r2, [r0, r3, lsl #1]
c0de3c3c:	3301      	adds	r3, #1
c0de3c3e:	f830 2015 	ldrh.w	r2, [r0, r5, lsl #1]
c0de3c42:	1b92      	subs	r2, r2, r6
c0de3c44:	b212      	sxth	r2, r2
c0de3c46:	4362      	muls	r2, r4
c0de3c48:	fb02 f60b 	mul.w	r6, r2, fp
c0de3c4c:	1436      	asrs	r6, r6, #16
c0de3c4e:	fb06 220a 	mla	r2, r6, sl, r2
c0de3c52:	0c12      	lsrs	r2, r2, #16
c0de3c54:	f820 2015 	strh.w	r2, [r0, r5, lsl #1]
c0de3c58:	3501      	adds	r5, #1
c0de3c5a:	e7db      	b.n	c0de3c14 <small_invntt_tomont+0x38>
c0de3c5c:	9c02      	ldr	r4, [sp, #8]
c0de3c5e:	9a01      	ldr	r2, [sp, #4]
c0de3c60:	462b      	mov	r3, r5
c0de3c62:	3c01      	subs	r4, #1
c0de3c64:	e7ce      	b.n	c0de3c04 <small_invntt_tomont+0x28>
c0de3c66:	0052      	lsls	r2, r2, #1
c0de3c68:	e7c8      	b.n	c0de3bfc <small_invntt_tomont+0x20>
c0de3c6a:	2100      	movs	r1, #0
c0de3c6c:	f240 52a1 	movw	r2, #1441	@ 0x5a1
c0de3c70:	f46f 6350 	mvn.w	r3, #3328	@ 0xd00
c0de3c74:	f644 64bf 	movw	r4, #20159	@ 0x4ebf
c0de3c78:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de3c7c:	bf08      	it	eq
c0de3c7e:	e8bd 8dfe 	ldmiaeq.w	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de3c82:	f930 5011 	ldrsh.w	r5, [r0, r1, lsl #1]
c0de3c86:	4f0c      	ldr	r7, [pc, #48]	@ (c0de3cb8 <small_invntt_tomont+0xdc>)
c0de3c88:	fb05 f602 	mul.w	r6, r5, r2
c0de3c8c:	437d      	muls	r5, r7
c0de3c8e:	4677      	mov	r7, lr
c0de3c90:	142d      	asrs	r5, r5, #16
c0de3c92:	fb05 6503 	mla	r5, r5, r3, r6
c0de3c96:	142e      	asrs	r6, r5, #16
c0de3c98:	0c2d      	lsrs	r5, r5, #16
c0de3c9a:	4366      	muls	r6, r4
c0de3c9c:	f106 7600 	add.w	r6, r6, #33554432	@ 0x2000000
c0de3ca0:	16b6      	asrs	r6, r6, #26
c0de3ca2:	fb06 f60e 	mul.w	r6, r6, lr
c0de3ca6:	eba5 4516 	sub.w	r5, r5, r6, lsr #16
c0de3caa:	f820 5011 	strh.w	r5, [r0, r1, lsl #1]
c0de3cae:	3101      	adds	r1, #1
c0de3cb0:	e7e2      	b.n	c0de3c78 <small_invntt_tomont+0x9c>
c0de3cb2:	bf00      	nop
c0de3cb4:	0d010000 	.word	0x0d010000
c0de3cb8:	d8a10000 	.word	0xd8a10000
c0de3cbc:	0000ba90 	.word	0x0000ba90

c0de3cc0 <small_basemul>:
c0de3cc0:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de3cc2:	f9b1 c000 	ldrsh.w	ip, [r1]
c0de3cc6:	f9b1 5002 	ldrsh.w	r5, [r1, #2]
c0de3cca:	f9b2 1002 	ldrsh.w	r1, [r2, #2]
c0de3cce:	f46f 6e50 	mvn.w	lr, #3328	@ 0xd00
c0de3cd2:	f9b2 6000 	ldrsh.w	r6, [r2]
c0de3cd6:	fb01 f705 	mul.w	r7, r1, r5
c0de3cda:	4916      	ldr	r1, [pc, #88]	@ (c0de3d34 <small_basemul+0x74>)
c0de3cdc:	fb07 f401 	mul.w	r4, r7, r1
c0de3ce0:	1424      	asrs	r4, r4, #16
c0de3ce2:	fb04 740e 	mla	r4, r4, lr, r7
c0de3ce6:	1424      	asrs	r4, r4, #16
c0de3ce8:	4363      	muls	r3, r4
c0de3cea:	fb03 f401 	mul.w	r4, r3, r1
c0de3cee:	1424      	asrs	r4, r4, #16
c0de3cf0:	fb04 330e 	mla	r3, r4, lr, r3
c0de3cf4:	fb06 f40c 	mul.w	r4, r6, ip
c0de3cf8:	fb04 f701 	mul.w	r7, r4, r1
c0de3cfc:	143f      	asrs	r7, r7, #16
c0de3cfe:	0c1b      	lsrs	r3, r3, #16
c0de3d00:	fb07 440e 	mla	r4, r7, lr, r4
c0de3d04:	eb03 4314 	add.w	r3, r3, r4, lsr #16
c0de3d08:	8003      	strh	r3, [r0, #0]
c0de3d0a:	fb06 f305 	mul.w	r3, r6, r5
c0de3d0e:	f9b2 2002 	ldrsh.w	r2, [r2, #2]
c0de3d12:	fb03 f401 	mul.w	r4, r3, r1
c0de3d16:	1424      	asrs	r4, r4, #16
c0de3d18:	fb02 f20c 	mul.w	r2, r2, ip
c0de3d1c:	fb04 330e 	mla	r3, r4, lr, r3
c0de3d20:	4351      	muls	r1, r2
c0de3d22:	1409      	asrs	r1, r1, #16
c0de3d24:	fb01 210e 	mla	r1, r1, lr, r2
c0de3d28:	0c09      	lsrs	r1, r1, #16
c0de3d2a:	eb01 4113 	add.w	r1, r1, r3, lsr #16
c0de3d2e:	8041      	strh	r1, [r0, #2]
c0de3d30:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de3d32:	bf00      	nop
c0de3d34:	f3010000 	.word	0xf3010000

c0de3d38 <poly_small_ntt_copy>:
c0de3d38:	22ff      	movs	r2, #255	@ 0xff
c0de3d3a:	f1b2 3fff 	cmp.w	r2, #4294967295	@ 0xffffffff
c0de3d3e:	bfd8      	it	le
c0de3d40:	f7ff bf0e 	ble.w	c0de3b60 <small_ntt>
c0de3d44:	f851 3022 	ldr.w	r3, [r1, r2, lsl #2]
c0de3d48:	f820 3012 	strh.w	r3, [r0, r2, lsl #1]
c0de3d4c:	3a01      	subs	r2, #1
c0de3d4e:	e7f4      	b.n	c0de3d3a <poly_small_ntt_copy+0x2>

c0de3d50 <poly_small_basemul>:
c0de3d50:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de3d54:	e9cd 1200 	strd	r1, r2, [sp]
c0de3d58:	4683      	mov	fp, r0
c0de3d5a:	f04f 0a00 	mov.w	sl, #0
c0de3d5e:	4811      	ldr	r0, [pc, #68]	@ (c0de3da4 <poly_small_basemul+0x54>)
c0de3d60:	4478      	add	r0, pc
c0de3d62:	f100 0880 	add.w	r8, r0, #128	@ 0x80
c0de3d66:	f5ba 7f00 	cmp.w	sl, #512	@ 0x200
c0de3d6a:	bf08      	it	eq
c0de3d6c:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de3d70:	9800      	ldr	r0, [sp, #0]
c0de3d72:	f938 6b02 	ldrsh.w	r6, [r8], #2
c0de3d76:	eb0b 070a 	add.w	r7, fp, sl
c0de3d7a:	eb00 040a 	add.w	r4, r0, sl
c0de3d7e:	9801      	ldr	r0, [sp, #4]
c0de3d80:	4633      	mov	r3, r6
c0de3d82:	4621      	mov	r1, r4
c0de3d84:	eb00 050a 	add.w	r5, r0, sl
c0de3d88:	4638      	mov	r0, r7
c0de3d8a:	462a      	mov	r2, r5
c0de3d8c:	f7ff ff98 	bl	c0de3cc0 <small_basemul>
c0de3d90:	4273      	negs	r3, r6
c0de3d92:	1d38      	adds	r0, r7, #4
c0de3d94:	1d21      	adds	r1, r4, #4
c0de3d96:	1d2a      	adds	r2, r5, #4
c0de3d98:	b21b      	sxth	r3, r3
c0de3d9a:	f7ff ff91 	bl	c0de3cc0 <small_basemul>
c0de3d9e:	f10a 0a08 	add.w	sl, sl, #8
c0de3da2:	e7e0      	b.n	c0de3d66 <poly_small_basemul+0x16>
c0de3da4:	0000b924 	.word	0x0000b924

c0de3da8 <poly_small_basemul_invntt>:
c0de3da8:	b510      	push	{r4, lr}
c0de3daa:	4604      	mov	r4, r0
c0de3dac:	f7ff ffd0 	bl	c0de3d50 <poly_small_basemul>
c0de3db0:	4620      	mov	r0, r4
c0de3db2:	f7ff ff13 	bl	c0de3bdc <small_invntt_tomont>
c0de3db6:	20ff      	movs	r0, #255	@ 0xff
c0de3db8:	2800      	cmp	r0, #0
c0de3dba:	d405      	bmi.n	c0de3dc8 <poly_small_basemul_invntt+0x20>
c0de3dbc:	f934 1010 	ldrsh.w	r1, [r4, r0, lsl #1]
c0de3dc0:	f844 1020 	str.w	r1, [r4, r0, lsl #2]
c0de3dc4:	3801      	subs	r0, #1
c0de3dc6:	e7f7      	b.n	c0de3db8 <poly_small_basemul_invntt+0x10>
c0de3dc8:	bd10      	pop	{r4, pc}

c0de3dca <small_polyeta_unpack>:
c0de3dca:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3dce:	3101      	adds	r1, #1
c0de3dd0:	f04f 0c00 	mov.w	ip, #0
c0de3dd4:	f5bc 7f00 	cmp.w	ip, #512	@ 0x200
c0de3dd8:	bf08      	it	eq
c0de3dda:	e8bd 8df0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de3dde:	f811 4c01 	ldrb.w	r4, [r1, #-1]
c0de3de2:	f004 0807 	and.w	r8, r4, #7
c0de3de6:	eb00 040c 	add.w	r4, r0, ip
c0de3dea:	f820 800c 	strh.w	r8, [r0, ip]
c0de3dee:	f1c8 0202 	rsb	r2, r8, #2
c0de3df2:	f811 5c01 	ldrb.w	r5, [r1, #-1]
c0de3df6:	f3c5 0ec2 	ubfx	lr, r5, #3, #3
c0de3dfa:	f8a4 e002 	strh.w	lr, [r4, #2]
c0de3dfe:	f811 6c01 	ldrb.w	r6, [r1, #-1]
c0de3e02:	780b      	ldrb	r3, [r1, #0]
c0de3e04:	09b6      	lsrs	r6, r6, #6
c0de3e06:	f363 0682 	bfi	r6, r3, #2, #1
c0de3e0a:	80a6      	strh	r6, [r4, #4]
c0de3e0c:	780b      	ldrb	r3, [r1, #0]
c0de3e0e:	f3c3 0a42 	ubfx	sl, r3, #1, #3
c0de3e12:	f8a4 a006 	strh.w	sl, [r4, #6]
c0de3e16:	780d      	ldrb	r5, [r1, #0]
c0de3e18:	f3c5 1502 	ubfx	r5, r5, #4, #3
c0de3e1c:	8125      	strh	r5, [r4, #8]
c0de3e1e:	780f      	ldrb	r7, [r1, #0]
c0de3e20:	784b      	ldrb	r3, [r1, #1]
c0de3e22:	09ff      	lsrs	r7, r7, #7
c0de3e24:	f363 0742 	bfi	r7, r3, #1, #2
c0de3e28:	8167      	strh	r7, [r4, #10]
c0de3e2a:	784b      	ldrb	r3, [r1, #1]
c0de3e2c:	f3c3 0382 	ubfx	r3, r3, #2, #3
c0de3e30:	81a3      	strh	r3, [r4, #12]
c0de3e32:	f891 b001 	ldrb.w	fp, [r1, #1]
c0de3e36:	f820 200c 	strh.w	r2, [r0, ip]
c0de3e3a:	f1c3 0202 	rsb	r2, r3, #2
c0de3e3e:	3103      	adds	r1, #3
c0de3e40:	f10c 0c10 	add.w	ip, ip, #16
c0de3e44:	81a2      	strh	r2, [r4, #12]
c0de3e46:	f1c7 0202 	rsb	r2, r7, #2
c0de3e4a:	8162      	strh	r2, [r4, #10]
c0de3e4c:	f1c5 0202 	rsb	r2, r5, #2
c0de3e50:	8122      	strh	r2, [r4, #8]
c0de3e52:	f1ca 0202 	rsb	r2, sl, #2
c0de3e56:	80e2      	strh	r2, [r4, #6]
c0de3e58:	f1c6 0202 	rsb	r2, r6, #2
c0de3e5c:	80a2      	strh	r2, [r4, #4]
c0de3e5e:	f1ce 0202 	rsb	r2, lr, #2
c0de3e62:	8062      	strh	r2, [r4, #2]
c0de3e64:	2202      	movs	r2, #2
c0de3e66:	eba2 125b 	sub.w	r2, r2, fp, lsr #5
c0de3e6a:	81e2      	strh	r2, [r4, #14]
c0de3e6c:	e7b2      	b.n	c0de3dd4 <small_polyeta_unpack+0xa>

c0de3e6e <pqcrystals_dilithium2_lowram_dilithium_shake128_stream_init>:
c0de3e6e:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0de3e70:	f000 f825 	bl	c0de3ebe <OUTLINED_FUNCTION_0>
c0de3e74:	f7fd f826 	bl	c0de0ec4 <pqcrystals_dilithium_fips202_ref_shake128_init>
c0de3e78:	4628      	mov	r0, r5
c0de3e7a:	4621      	mov	r1, r4
c0de3e7c:	2220      	movs	r2, #32
c0de3e7e:	f7fd f833 	bl	c0de0ee8 <pqcrystals_dilithium_fips202_ref_shake128_absorb>
c0de3e82:	f10d 0106 	add.w	r1, sp, #6
c0de3e86:	4628      	mov	r0, r5
c0de3e88:	2202      	movs	r2, #2
c0de3e8a:	f7fd f82d 	bl	c0de0ee8 <pqcrystals_dilithium_fips202_ref_shake128_absorb>
c0de3e8e:	4628      	mov	r0, r5
c0de3e90:	f7fd f873 	bl	c0de0f7a <pqcrystals_dilithium_fips202_ref_shake128_finalize>
c0de3e94:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0de3e96 <pqcrystals_dilithium2_lowram_dilithium_shake256_stream_init>:
c0de3e96:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0de3e98:	f000 f811 	bl	c0de3ebe <OUTLINED_FUNCTION_0>
c0de3e9c:	f7fd f95c 	bl	c0de1158 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de3ea0:	4628      	mov	r0, r5
c0de3ea2:	4621      	mov	r1, r4
c0de3ea4:	2240      	movs	r2, #64	@ 0x40
c0de3ea6:	f7fd f95f 	bl	c0de1168 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de3eaa:	f10d 0106 	add.w	r1, sp, #6
c0de3eae:	4628      	mov	r0, r5
c0de3eb0:	2202      	movs	r2, #2
c0de3eb2:	f7fd f959 	bl	c0de1168 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de3eb6:	4628      	mov	r0, r5
c0de3eb8:	f7fd f961 	bl	c0de117e <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de3ebc:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0de3ebe <OUTLINED_FUNCTION_0>:
c0de3ebe:	4605      	mov	r5, r0
c0de3ec0:	0a10      	lsrs	r0, r2, #8
c0de3ec2:	460c      	mov	r4, r1
c0de3ec4:	f88d 2006 	strb.w	r2, [sp, #6]
c0de3ec8:	f88d 0007 	strb.w	r0, [sp, #7]
c0de3ecc:	4628      	mov	r0, r5
c0de3ece:	4770      	bx	lr

c0de3ed0 <os_io_handle_default_apdu>:
c0de3ed0:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de3ed2:	b09d      	sub	sp, #116	@ 0x74
c0de3ed4:	4615      	mov	r5, r2
c0de3ed6:	9a22      	ldr	r2, [sp, #136]	@ 0x88
c0de3ed8:	b3c8      	cbz	r0, c0de3f4e <os_io_handle_default_apdu+0x7e>
c0de3eda:	b3c1      	cbz	r1, c0de3f4e <os_io_handle_default_apdu+0x7e>
c0de3edc:	b3bd      	cbz	r5, c0de3f4e <os_io_handle_default_apdu+0x7e>
c0de3ede:	461c      	mov	r4, r3
c0de3ee0:	b3ab      	cbz	r3, c0de3f4e <os_io_handle_default_apdu+0x7e>
c0de3ee2:	b10a      	cbz	r2, c0de3ee8 <os_io_handle_default_apdu+0x18>
c0de3ee4:	2100      	movs	r1, #0
c0de3ee6:	7011      	strb	r1, [r2, #0]
c0de3ee8:	7801      	ldrb	r1, [r0, #0]
c0de3eea:	29b0      	cmp	r1, #176	@ 0xb0
c0de3eec:	d131      	bne.n	c0de3f52 <os_io_handle_default_apdu+0x82>
c0de3eee:	7841      	ldrb	r1, [r0, #1]
c0de3ef0:	29a7      	cmp	r1, #167	@ 0xa7
c0de3ef2:	d031      	beq.n	c0de3f58 <os_io_handle_default_apdu+0x88>
c0de3ef4:	2906      	cmp	r1, #6
c0de3ef6:	d036      	beq.n	c0de3f66 <os_io_handle_default_apdu+0x96>
c0de3ef8:	2901      	cmp	r1, #1
c0de3efa:	d131      	bne.n	c0de3f60 <os_io_handle_default_apdu+0x90>
c0de3efc:	7881      	ldrb	r1, [r0, #2]
c0de3efe:	bb79      	cbnz	r1, c0de3f60 <os_io_handle_default_apdu+0x90>
c0de3f00:	78c0      	ldrb	r0, [r0, #3]
c0de3f02:	bb68      	cbnz	r0, c0de3f60 <os_io_handle_default_apdu+0x90>
c0de3f04:	6820      	ldr	r0, [r4, #0]
c0de3f06:	2100      	movs	r1, #0
c0de3f08:	6021      	str	r1, [r4, #0]
c0de3f0a:	2803      	cmp	r0, #3
c0de3f0c:	d321      	bcc.n	c0de3f52 <os_io_handle_default_apdu+0x82>
c0de3f0e:	2601      	movs	r6, #1
c0de3f10:	1ec7      	subs	r7, r0, #3
c0de3f12:	6026      	str	r6, [r4, #0]
c0de3f14:	702e      	strb	r6, [r5, #0]
c0de3f16:	6820      	ldr	r0, [r4, #0]
c0de3f18:	1a3a      	subs	r2, r7, r0
c0de3f1a:	4428      	add	r0, r5
c0de3f1c:	1c41      	adds	r1, r0, #1
c0de3f1e:	2001      	movs	r0, #1
c0de3f20:	f008 f904 	bl	c0dec12c <os_registry_get_current_app_tag>
c0de3f24:	f000 f83f 	bl	c0de3fa6 <OUTLINED_FUNCTION_0>
c0de3f28:	6020      	str	r0, [r4, #0]
c0de3f2a:	1a3a      	subs	r2, r7, r0
c0de3f2c:	4428      	add	r0, r5
c0de3f2e:	1c41      	adds	r1, r0, #1
c0de3f30:	2002      	movs	r0, #2
c0de3f32:	f008 f8fb 	bl	c0dec12c <os_registry_get_current_app_tag>
c0de3f36:	f000 f836 	bl	c0de3fa6 <OUTLINED_FUNCTION_0>
c0de3f3a:	1c41      	adds	r1, r0, #1
c0de3f3c:	6021      	str	r1, [r4, #0]
c0de3f3e:	542e      	strb	r6, [r5, r0]
c0de3f40:	f008 f8e0 	bl	c0dec104 <os_flags>
c0de3f44:	6821      	ldr	r1, [r4, #0]
c0de3f46:	1c4a      	adds	r2, r1, #1
c0de3f48:	6022      	str	r2, [r4, #0]
c0de3f4a:	5468      	strb	r0, [r5, r1]
c0de3f4c:	e028      	b.n	c0de3fa0 <os_io_handle_default_apdu+0xd0>
c0de3f4e:	7814      	ldrb	r4, [r2, #0]
c0de3f50:	e01e      	b.n	c0de3f90 <os_io_handle_default_apdu+0xc0>
c0de3f52:	f646 1485 	movw	r4, #27013	@ 0x6985
c0de3f56:	e01b      	b.n	c0de3f90 <os_io_handle_default_apdu+0xc0>
c0de3f58:	7881      	ldrb	r1, [r0, #2]
c0de3f5a:	b909      	cbnz	r1, c0de3f60 <os_io_handle_default_apdu+0x90>
c0de3f5c:	78c0      	ldrb	r0, [r0, #3]
c0de3f5e:	b1d0      	cbz	r0, c0de3f96 <os_io_handle_default_apdu+0xc6>
c0de3f60:	f44f 44dc 	mov.w	r4, #28160	@ 0x6e00
c0de3f64:	e014      	b.n	c0de3f90 <os_io_handle_default_apdu+0xc0>
c0de3f66:	2100      	movs	r1, #0
c0de3f68:	6021      	str	r1, [r4, #0]
c0de3f6a:	7883      	ldrb	r3, [r0, #2]
c0de3f6c:	7902      	ldrb	r2, [r0, #4]
c0de3f6e:	ad02      	add	r5, sp, #8
c0de3f70:	e9cd 1500 	strd	r1, r5, [sp]
c0de3f74:	1d41      	adds	r1, r0, #5
c0de3f76:	4618      	mov	r0, r3
c0de3f78:	2300      	movs	r3, #0
c0de3f7a:	f008 f897 	bl	c0dec0ac <os_pki_load_certificate>
c0de3f7e:	4604      	mov	r4, r0
c0de3f80:	4628      	mov	r0, r5
c0de3f82:	216c      	movs	r1, #108	@ 0x6c
c0de3f84:	f008 fa60 	bl	c0dec448 <explicit_bzero>
c0de3f88:	2c00      	cmp	r4, #0
c0de3f8a:	bf08      	it	eq
c0de3f8c:	f44f 4410 	moveq.w	r4, #36864	@ 0x9000
c0de3f90:	4620      	mov	r0, r4
c0de3f92:	b01d      	add	sp, #116	@ 0x74
c0de3f94:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de3f96:	2000      	movs	r0, #0
c0de3f98:	6020      	str	r0, [r4, #0]
c0de3f9a:	b10a      	cbz	r2, c0de3fa0 <os_io_handle_default_apdu+0xd0>
c0de3f9c:	2001      	movs	r0, #1
c0de3f9e:	7010      	strb	r0, [r2, #0]
c0de3fa0:	f44f 4410 	mov.w	r4, #36864	@ 0x9000
c0de3fa4:	e7f4      	b.n	c0de3f90 <os_io_handle_default_apdu+0xc0>

c0de3fa6 <OUTLINED_FUNCTION_0>:
c0de3fa6:	6821      	ldr	r1, [r4, #0]
c0de3fa8:	1c4a      	adds	r2, r1, #1
c0de3faa:	6022      	str	r2, [r4, #0]
c0de3fac:	5468      	strb	r0, [r5, r1]
c0de3fae:	6821      	ldr	r1, [r4, #0]
c0de3fb0:	4408      	add	r0, r1
c0de3fb2:	4770      	bx	lr

c0de3fb4 <os_io_seph_cmd_piezo_play_tune>:
c0de3fb4:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0de3fb6:	280b      	cmp	r0, #11
c0de3fb8:	d902      	bls.n	c0de3fc0 <os_io_seph_cmd_piezo_play_tune+0xc>
c0de3fba:	f06f 0415 	mvn.w	r4, #21
c0de3fbe:	e021      	b.n	c0de4004 <os_io_seph_cmd_piezo_play_tune+0x50>
c0de3fc0:	4605      	mov	r5, r0
c0de3fc2:	2009      	movs	r0, #9
c0de3fc4:	2100      	movs	r1, #0
c0de3fc6:	2200      	movs	r2, #0
c0de3fc8:	2400      	movs	r4, #0
c0de3fca:	f008 f8a3 	bl	c0dec114 <os_setting_get>
c0de3fce:	2d08      	cmp	r5, #8
c0de3fd0:	d802      	bhi.n	c0de3fd8 <os_io_seph_cmd_piezo_play_tune+0x24>
c0de3fd2:	f010 0102 	ands.w	r1, r0, #2
c0de3fd6:	d115      	bne.n	c0de4004 <os_io_seph_cmd_piezo_play_tune+0x50>
c0de3fd8:	2400      	movs	r4, #0
c0de3fda:	2d09      	cmp	r5, #9
c0de3fdc:	d302      	bcc.n	c0de3fe4 <os_io_seph_cmd_piezo_play_tune+0x30>
c0de3fde:	f010 0001 	ands.w	r0, r0, #1
c0de3fe2:	d10f      	bne.n	c0de4004 <os_io_seph_cmd_piezo_play_tune+0x50>
c0de3fe4:	2056      	movs	r0, #86	@ 0x56
c0de3fe6:	f88d 5007 	strb.w	r5, [sp, #7]
c0de3fea:	f88d 4005 	strb.w	r4, [sp, #5]
c0de3fee:	2204      	movs	r2, #4
c0de3ff0:	2300      	movs	r3, #0
c0de3ff2:	f88d 0004 	strb.w	r0, [sp, #4]
c0de3ff6:	2001      	movs	r0, #1
c0de3ff8:	f88d 0006 	strb.w	r0, [sp, #6]
c0de3ffc:	a901      	add	r1, sp, #4
c0de3ffe:	f000 f803 	bl	c0de4008 <OUTLINED_FUNCTION_1>
c0de4002:	4604      	mov	r4, r0
c0de4004:	4620      	mov	r0, r4
c0de4006:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0de4008 <OUTLINED_FUNCTION_1>:
c0de4008:	2001      	movs	r0, #1
c0de400a:	f008 b8b9 	b.w	c0dec180 <os_io_tx_cmd>
	...

c0de4010 <io_process_itc_ux_event>:
c0de4010:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de4012:	4605      	mov	r5, r0
c0de4014:	78c0      	ldrb	r0, [r0, #3]
c0de4016:	2820      	cmp	r0, #32
c0de4018:	d023      	beq.n	c0de4062 <io_process_itc_ux_event+0x52>
c0de401a:	2823      	cmp	r0, #35	@ 0x23
c0de401c:	d029      	beq.n	c0de4072 <io_process_itc_ux_event+0x62>
c0de401e:	460c      	mov	r4, r1
c0de4020:	2822      	cmp	r0, #34	@ 0x22
c0de4022:	d132      	bne.n	c0de408a <io_process_itc_ux_event+0x7a>
c0de4024:	4e1f      	ldr	r6, [pc, #124]	@ (c0de40a4 <io_process_itc_ux_event+0x94>)
c0de4026:	2006      	movs	r0, #6
c0de4028:	2118      	movs	r1, #24
c0de402a:	f809 0006 	strb.w	r0, [r9, r6]
c0de402e:	eb09 0706 	add.w	r7, r9, r6
c0de4032:	2018      	movs	r0, #24
c0de4034:	6078      	str	r0, [r7, #4]
c0de4036:	f107 0008 	add.w	r0, r7, #8
c0de403a:	f008 f9f7 	bl	c0dec42c <__aeabi_memclr>
c0de403e:	7928      	ldrb	r0, [r5, #4]
c0de4040:	7238      	strb	r0, [r7, #8]
c0de4042:	7868      	ldrb	r0, [r5, #1]
c0de4044:	78a9      	ldrb	r1, [r5, #2]
c0de4046:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de404a:	3802      	subs	r0, #2
c0de404c:	0401      	lsls	r1, r0, #16
c0de404e:	d005      	beq.n	c0de405c <io_process_itc_ux_event+0x4c>
c0de4050:	b282      	uxth	r2, r0
c0de4052:	2a10      	cmp	r2, #16
c0de4054:	d802      	bhi.n	c0de405c <io_process_itc_ux_event+0x4c>
c0de4056:	1f60      	subs	r0, r4, #5
c0de4058:	4290      	cmp	r0, r2
c0de405a:	d218      	bcs.n	c0de408e <io_process_itc_ux_event+0x7e>
c0de405c:	f06f 0415 	mvn.w	r4, #21
c0de4060:	e013      	b.n	c0de408a <io_process_itc_ux_event+0x7a>
c0de4062:	2001      	movs	r0, #1
c0de4064:	f007 fdbc 	bl	c0debbe0 <nbgl_objAllowDrawing>
c0de4068:	f007 fdc9 	bl	c0debbfe <nbgl_screenRedraw>
c0de406c:	f007 fd9f 	bl	c0debbae <nbgl_refresh>
c0de4070:	e00a      	b.n	c0de4088 <io_process_itc_ux_event+0x78>
c0de4072:	480c      	ldr	r0, [pc, #48]	@ (c0de40a4 <io_process_itc_ux_event+0x94>)
c0de4074:	2107      	movs	r1, #7
c0de4076:	f809 1000 	strb.w	r1, [r9, r0]
c0de407a:	4448      	add	r0, r9
c0de407c:	2101      	movs	r1, #1
c0de407e:	6041      	str	r1, [r0, #4]
c0de4080:	7929      	ldrb	r1, [r5, #4]
c0de4082:	7201      	strb	r1, [r0, #8]
c0de4084:	f008 f834 	bl	c0dec0f0 <os_ux>
c0de4088:	2400      	movs	r4, #0
c0de408a:	4620      	mov	r0, r4
c0de408c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de408e:	eb09 0406 	add.w	r4, r9, r6
c0de4092:	1d69      	adds	r1, r5, #5
c0de4094:	f104 0010 	add.w	r0, r4, #16
c0de4098:	60e2      	str	r2, [r4, #12]
c0de409a:	f008 f9bd 	bl	c0dec418 <__aeabi_memcpy>
c0de409e:	4620      	mov	r0, r4
c0de40a0:	e7f0      	b.n	c0de4084 <io_process_itc_ux_event+0x74>
c0de40a2:	bf00      	nop
c0de40a4:	00001dc0 	.word	0x00001dc0

c0de40a8 <io_legacy_apdu_tx>:
c0de40a8:	b5b0      	push	{r4, r5, r7, lr}
c0de40aa:	460a      	mov	r2, r1
c0de40ac:	4601      	mov	r1, r0
c0de40ae:	4808      	ldr	r0, [pc, #32]	@ (c0de40d0 <io_legacy_apdu_tx+0x28>)
c0de40b0:	2300      	movs	r3, #0
c0de40b2:	2500      	movs	r5, #0
c0de40b4:	eb09 0400 	add.w	r4, r9, r0
c0de40b8:	7860      	ldrb	r0, [r4, #1]
c0de40ba:	f008 f861 	bl	c0dec180 <os_io_tx_cmd>
c0de40be:	4905      	ldr	r1, [pc, #20]	@ (c0de40d4 <io_legacy_apdu_tx+0x2c>)
c0de40c0:	7065      	strb	r5, [r4, #1]
c0de40c2:	f809 5001 	strb.w	r5, [r9, r1]
c0de40c6:	4904      	ldr	r1, [pc, #16]	@ (c0de40d8 <io_legacy_apdu_tx+0x30>)
c0de40c8:	4449      	add	r1, r9
c0de40ca:	718d      	strb	r5, [r1, #6]
c0de40cc:	bdb0      	pop	{r4, r5, r7, pc}
c0de40ce:	bf00      	nop
c0de40d0:	000016e8 	.word	0x000016e8
c0de40d4:	00001de0 	.word	0x00001de0
c0de40d8:	000016dc 	.word	0x000016dc

c0de40dc <io_legacy_apdu_rx>:
c0de40dc:	e92d 41ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
c0de40e0:	4e8c      	ldr	r6, [pc, #560]	@ (c0de4314 <io_legacy_apdu_rx+0x238>)
c0de40e2:	2100      	movs	r1, #0
c0de40e4:	4605      	mov	r5, r0
c0de40e6:	2200      	movs	r2, #0
c0de40e8:	2301      	movs	r3, #1
c0de40ea:	f88d 100f 	strb.w	r1, [sp, #15]
c0de40ee:	f240 1111 	movw	r1, #273	@ 0x111
c0de40f2:	eb09 0006 	add.w	r0, r9, r6
c0de40f6:	f008 f84f 	bl	c0dec198 <os_io_rx_evt>
c0de40fa:	4604      	mov	r4, r0
c0de40fc:	2801      	cmp	r0, #1
c0de40fe:	f2c0 8100 	blt.w	c0de4302 <io_legacy_apdu_rx+0x226>
c0de4102:	f819 0006 	ldrb.w	r0, [r9, r6]
c0de4106:	f1a0 0110 	sub.w	r1, r0, #16
c0de410a:	2916      	cmp	r1, #22
c0de410c:	d844      	bhi.n	c0de4198 <io_legacy_apdu_rx+0xbc>
c0de410e:	2201      	movs	r2, #1
c0de4110:	fa02 f101 	lsl.w	r1, r2, r1
c0de4114:	4a80      	ldr	r2, [pc, #512]	@ (c0de4318 <io_legacy_apdu_rx+0x23c>)
c0de4116:	4211      	tst	r1, r2
c0de4118:	d03e      	beq.n	c0de4198 <io_legacy_apdu_rx+0xbc>
c0de411a:	4f80      	ldr	r7, [pc, #512]	@ (c0de431c <io_legacy_apdu_rx+0x240>)
c0de411c:	eb09 0107 	add.w	r1, r9, r7
c0de4120:	7048      	strb	r0, [r1, #1]
c0de4122:	f007 ffd3 	bl	c0dec0cc <os_perso_is_pin_set>
c0de4126:	28aa      	cmp	r0, #170	@ 0xaa
c0de4128:	d103      	bne.n	c0de4132 <io_legacy_apdu_rx+0x56>
c0de412a:	f007 ffd8 	bl	c0dec0de <os_global_pin_is_validated>
c0de412e:	28aa      	cmp	r0, #170	@ 0xaa
c0de4130:	d161      	bne.n	c0de41f6 <io_legacy_apdu_rx+0x11a>
c0de4132:	eb09 0006 	add.w	r0, r9, r6
c0de4136:	7840      	ldrb	r0, [r0, #1]
c0de4138:	28b0      	cmp	r0, #176	@ 0xb0
c0de413a:	d135      	bne.n	c0de41a8 <io_legacy_apdu_rx+0xcc>
c0de413c:	f240 1011 	movw	r0, #273	@ 0x111
c0de4140:	1e61      	subs	r1, r4, #1
c0de4142:	9002      	str	r0, [sp, #8]
c0de4144:	f10d 000f 	add.w	r0, sp, #15
c0de4148:	9000      	str	r0, [sp, #0]
c0de414a:	4875      	ldr	r0, [pc, #468]	@ (c0de4320 <io_legacy_apdu_rx+0x244>)
c0de414c:	ab02      	add	r3, sp, #8
c0de414e:	eb09 0500 	add.w	r5, r9, r0
c0de4152:	eb09 0006 	add.w	r0, r9, r6
c0de4156:	3001      	adds	r0, #1
c0de4158:	462a      	mov	r2, r5
c0de415a:	f7ff feb9 	bl	c0de3ed0 <os_io_handle_default_apdu>
c0de415e:	2400      	movs	r4, #0
c0de4160:	9902      	ldr	r1, [sp, #8]
c0de4162:	eb09 0607 	add.w	r6, r9, r7
c0de4166:	f5b0 4f10 	cmp.w	r0, #36864	@ 0x9000
c0de416a:	bf18      	it	ne
c0de416c:	4621      	movne	r1, r4
c0de416e:	0a02      	lsrs	r2, r0, #8
c0de4170:	2300      	movs	r3, #0
c0de4172:	546a      	strb	r2, [r5, r1]
c0de4174:	186a      	adds	r2, r5, r1
c0de4176:	7050      	strb	r0, [r2, #1]
c0de4178:	1c88      	adds	r0, r1, #2
c0de417a:	4629      	mov	r1, r5
c0de417c:	9002      	str	r0, [sp, #8]
c0de417e:	b282      	uxth	r2, r0
c0de4180:	7870      	ldrb	r0, [r6, #1]
c0de4182:	f007 fffd 	bl	c0dec180 <os_io_tx_cmd>
c0de4186:	f89d 100f 	ldrb.w	r1, [sp, #15]
c0de418a:	7074      	strb	r4, [r6, #1]
c0de418c:	2901      	cmp	r1, #1
c0de418e:	f000 80bd 	beq.w	c0de430c <io_legacy_apdu_rx+0x230>
c0de4192:	ea00 75e0 	and.w	r5, r0, r0, asr #31
c0de4196:	e0b5      	b.n	c0de4304 <io_legacy_apdu_rx+0x228>
c0de4198:	1e41      	subs	r1, r0, #1
c0de419a:	2902      	cmp	r1, #2
c0de419c:	d33d      	bcc.n	c0de421a <io_legacy_apdu_rx+0x13e>
c0de419e:	2830      	cmp	r0, #48	@ 0x30
c0de41a0:	d0bb      	beq.n	c0de411a <io_legacy_apdu_rx+0x3e>
c0de41a2:	2840      	cmp	r0, #64	@ 0x40
c0de41a4:	d0b9      	beq.n	c0de411a <io_legacy_apdu_rx+0x3e>
c0de41a6:	e0a3      	b.n	c0de42f0 <io_legacy_apdu_rx+0x214>
c0de41a8:	eb09 0007 	add.w	r0, r9, r7
c0de41ac:	7847      	ldrb	r7, [r0, #1]
c0de41ae:	2f10      	cmp	r7, #16
c0de41b0:	d05f      	beq.n	c0de4272 <io_legacy_apdu_rx+0x196>
c0de41b2:	2f40      	cmp	r7, #64	@ 0x40
c0de41b4:	d05f      	beq.n	c0de4276 <io_legacy_apdu_rx+0x19a>
c0de41b6:	2f21      	cmp	r7, #33	@ 0x21
c0de41b8:	d06f      	beq.n	c0de429a <io_legacy_apdu_rx+0x1be>
c0de41ba:	2f22      	cmp	r7, #34	@ 0x22
c0de41bc:	d048      	beq.n	c0de4250 <io_legacy_apdu_rx+0x174>
c0de41be:	2f23      	cmp	r7, #35	@ 0x23
c0de41c0:	d048      	beq.n	c0de4254 <io_legacy_apdu_rx+0x178>
c0de41c2:	2f30      	cmp	r7, #48	@ 0x30
c0de41c4:	d053      	beq.n	c0de426e <io_legacy_apdu_rx+0x192>
c0de41c6:	f8df 815c 	ldr.w	r8, [pc, #348]	@ c0de4324 <io_legacy_apdu_rx+0x248>
c0de41ca:	2f20      	cmp	r7, #32
c0de41cc:	eb09 0008 	add.w	r0, r9, r8
c0de41d0:	d16d      	bne.n	c0de42ae <io_legacy_apdu_rx+0x1d2>
c0de41d2:	2701      	movs	r7, #1
c0de41d4:	eb09 0106 	add.w	r1, r9, r6
c0de41d8:	1e65      	subs	r5, r4, #1
c0de41da:	7187      	strb	r7, [r0, #6]
c0de41dc:	4850      	ldr	r0, [pc, #320]	@ (c0de4320 <io_legacy_apdu_rx+0x244>)
c0de41de:	3101      	adds	r1, #1
c0de41e0:	462a      	mov	r2, r5
c0de41e2:	4448      	add	r0, r9
c0de41e4:	f008 f918 	bl	c0dec418 <__aeabi_memcpy>
c0de41e8:	484f      	ldr	r0, [pc, #316]	@ (c0de4328 <io_legacy_apdu_rx+0x24c>)
c0de41ea:	f809 7000 	strb.w	r7, [r9, r0]
c0de41ee:	2008      	movs	r0, #8
c0de41f0:	f809 0008 	strb.w	r0, [r9, r8]
c0de41f4:	e086      	b.n	c0de4304 <io_legacy_apdu_rx+0x228>
c0de41f6:	484a      	ldr	r0, [pc, #296]	@ (c0de4320 <io_legacy_apdu_rx+0x244>)
c0de41f8:	2155      	movs	r1, #85	@ 0x55
c0de41fa:	2202      	movs	r2, #2
c0de41fc:	2300      	movs	r3, #0
c0de41fe:	f809 1000 	strb.w	r1, [r9, r0]
c0de4202:	eb09 0100 	add.w	r1, r9, r0
c0de4206:	2015      	movs	r0, #21
c0de4208:	7048      	strb	r0, [r1, #1]
c0de420a:	eb09 0007 	add.w	r0, r9, r7
c0de420e:	7840      	ldrb	r0, [r0, #1]
c0de4210:	b004      	add	sp, #16
c0de4212:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de4216:	f007 bfb3 	b.w	c0dec180 <os_io_tx_cmd>
c0de421a:	4f44      	ldr	r7, [pc, #272]	@ (c0de432c <io_legacy_apdu_rx+0x250>)
c0de421c:	444e      	add	r6, r9
c0de421e:	3c01      	subs	r4, #1
c0de4220:	1c71      	adds	r1, r6, #1
c0de4222:	4622      	mov	r2, r4
c0de4224:	eb09 0007 	add.w	r0, r9, r7
c0de4228:	f008 f8f6 	bl	c0dec418 <__aeabi_memcpy>
c0de422c:	7870      	ldrb	r0, [r6, #1]
c0de422e:	281a      	cmp	r0, #26
c0de4230:	d107      	bne.n	c0de4242 <io_legacy_apdu_rx+0x166>
c0de4232:	eb09 0007 	add.w	r0, r9, r7
c0de4236:	4621      	mov	r1, r4
c0de4238:	b004      	add	sp, #16
c0de423a:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de423e:	f7ff bee7 	b.w	c0de4010 <io_process_itc_ux_event>
c0de4242:	2d00      	cmp	r5, #0
c0de4244:	d04a      	beq.n	c0de42dc <io_legacy_apdu_rx+0x200>
c0de4246:	2000      	movs	r0, #0
c0de4248:	2500      	movs	r5, #0
c0de424a:	f007 fa83 	bl	c0deb754 <io_event>
c0de424e:	e059      	b.n	c0de4304 <io_legacy_apdu_rx+0x228>
c0de4250:	2004      	movs	r0, #4
c0de4252:	e023      	b.n	c0de429c <io_legacy_apdu_rx+0x1c0>
c0de4254:	4f33      	ldr	r7, [pc, #204]	@ (c0de4324 <io_legacy_apdu_rx+0x248>)
c0de4256:	2107      	movs	r1, #7
c0de4258:	1e65      	subs	r5, r4, #1
c0de425a:	462a      	mov	r2, r5
c0de425c:	eb09 0007 	add.w	r0, r9, r7
c0de4260:	7181      	strb	r1, [r0, #6]
c0de4262:	482f      	ldr	r0, [pc, #188]	@ (c0de4320 <io_legacy_apdu_rx+0x244>)
c0de4264:	f000 f886 	bl	c0de4374 <OUTLINED_FUNCTION_0>
c0de4268:	482f      	ldr	r0, [pc, #188]	@ (c0de4328 <io_legacy_apdu_rx+0x24c>)
c0de426a:	2101      	movs	r1, #1
c0de426c:	e00f      	b.n	c0de428e <io_legacy_apdu_rx+0x1b2>
c0de426e:	2002      	movs	r0, #2
c0de4270:	e014      	b.n	c0de429c <io_legacy_apdu_rx+0x1c0>
c0de4272:	2006      	movs	r0, #6
c0de4274:	e012      	b.n	c0de429c <io_legacy_apdu_rx+0x1c0>
c0de4276:	4f2b      	ldr	r7, [pc, #172]	@ (c0de4324 <io_legacy_apdu_rx+0x248>)
c0de4278:	2103      	movs	r1, #3
c0de427a:	1e65      	subs	r5, r4, #1
c0de427c:	462a      	mov	r2, r5
c0de427e:	eb09 0007 	add.w	r0, r9, r7
c0de4282:	7181      	strb	r1, [r0, #6]
c0de4284:	4826      	ldr	r0, [pc, #152]	@ (c0de4320 <io_legacy_apdu_rx+0x244>)
c0de4286:	f000 f875 	bl	c0de4374 <OUTLINED_FUNCTION_0>
c0de428a:	4827      	ldr	r0, [pc, #156]	@ (c0de4328 <io_legacy_apdu_rx+0x24c>)
c0de428c:	2102      	movs	r1, #2
c0de428e:	f809 1000 	strb.w	r1, [r9, r0]
c0de4292:	200a      	movs	r0, #10
c0de4294:	f809 0007 	strb.w	r0, [r9, r7]
c0de4298:	e034      	b.n	c0de4304 <io_legacy_apdu_rx+0x228>
c0de429a:	2005      	movs	r0, #5
c0de429c:	4921      	ldr	r1, [pc, #132]	@ (c0de4324 <io_legacy_apdu_rx+0x248>)
c0de429e:	1e65      	subs	r5, r4, #1
c0de42a0:	462a      	mov	r2, r5
c0de42a2:	4449      	add	r1, r9
c0de42a4:	7188      	strb	r0, [r1, #6]
c0de42a6:	481e      	ldr	r0, [pc, #120]	@ (c0de4320 <io_legacy_apdu_rx+0x244>)
c0de42a8:	f000 f864 	bl	c0de4374 <OUTLINED_FUNCTION_0>
c0de42ac:	e02a      	b.n	c0de4304 <io_legacy_apdu_rx+0x228>
c0de42ae:	2100      	movs	r1, #0
c0de42b0:	1e65      	subs	r5, r4, #1
c0de42b2:	7181      	strb	r1, [r0, #6]
c0de42b4:	481a      	ldr	r0, [pc, #104]	@ (c0de4320 <io_legacy_apdu_rx+0x244>)
c0de42b6:	eb09 0106 	add.w	r1, r9, r6
c0de42ba:	462a      	mov	r2, r5
c0de42bc:	3101      	adds	r1, #1
c0de42be:	4448      	add	r0, r9
c0de42c0:	f008 f8aa 	bl	c0dec418 <__aeabi_memcpy>
c0de42c4:	2f25      	cmp	r7, #37	@ 0x25
c0de42c6:	d015      	beq.n	c0de42f4 <io_legacy_apdu_rx+0x218>
c0de42c8:	2f24      	cmp	r7, #36	@ 0x24
c0de42ca:	d11b      	bne.n	c0de4304 <io_legacy_apdu_rx+0x228>
c0de42cc:	200b      	movs	r0, #11
c0de42ce:	2101      	movs	r1, #1
c0de42d0:	f809 0008 	strb.w	r0, [r9, r8]
c0de42d4:	4814      	ldr	r0, [pc, #80]	@ (c0de4328 <io_legacy_apdu_rx+0x24c>)
c0de42d6:	f809 1000 	strb.w	r1, [r9, r0]
c0de42da:	e013      	b.n	c0de4304 <io_legacy_apdu_rx+0x228>
c0de42dc:	f819 0007 	ldrb.w	r0, [r9, r7]
c0de42e0:	2815      	cmp	r0, #21
c0de42e2:	d8b0      	bhi.n	c0de4246 <io_legacy_apdu_rx+0x16a>
c0de42e4:	2101      	movs	r1, #1
c0de42e6:	fa01 f000 	lsl.w	r0, r1, r0
c0de42ea:	4911      	ldr	r1, [pc, #68]	@ (c0de4330 <io_legacy_apdu_rx+0x254>)
c0de42ec:	4208      	tst	r0, r1
c0de42ee:	d0aa      	beq.n	c0de4246 <io_legacy_apdu_rx+0x16a>
c0de42f0:	2500      	movs	r5, #0
c0de42f2:	e007      	b.n	c0de4304 <io_legacy_apdu_rx+0x228>
c0de42f4:	200c      	movs	r0, #12
c0de42f6:	2101      	movs	r1, #1
c0de42f8:	f809 0008 	strb.w	r0, [r9, r8]
c0de42fc:	480a      	ldr	r0, [pc, #40]	@ (c0de4328 <io_legacy_apdu_rx+0x24c>)
c0de42fe:	f809 1000 	strb.w	r1, [r9, r0]
c0de4302:	4625      	mov	r5, r4
c0de4304:	4628      	mov	r0, r5
c0de4306:	b004      	add	sp, #16
c0de4308:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de430c:	20ff      	movs	r0, #255	@ 0xff
c0de430e:	f007 ff19 	bl	c0dec144 <os_sched_exit>
c0de4312:	bf00      	nop
c0de4314:	000015c8 	.word	0x000015c8
c0de4318:	007f0001 	.word	0x007f0001
c0de431c:	000016e8 	.word	0x000016e8
c0de4320:	000014b7 	.word	0x000014b7
c0de4324:	000016dc 	.word	0x000016dc
c0de4328:	00001de0 	.word	0x00001de0
c0de432c:	00001cac 	.word	0x00001cac
c0de4330:	00205020 	.word	0x00205020

c0de4334 <io_seproxyhal_init>:
c0de4334:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de4336:	b089      	sub	sp, #36	@ 0x24
c0de4338:	4d0c      	ldr	r5, [pc, #48]	@ (c0de436c <io_seproxyhal_init+0x38>)
c0de433a:	2600      	movs	r6, #0
c0de433c:	466c      	mov	r4, sp
c0de433e:	2118      	movs	r1, #24
c0de4340:	eb09 0005 	add.w	r0, r9, r5
c0de4344:	7046      	strb	r6, [r0, #1]
c0de4346:	4620      	mov	r0, r4
c0de4348:	f008 f870 	bl	c0dec42c <__aeabi_memclr>
c0de434c:	4808      	ldr	r0, [pc, #32]	@ (c0de4370 <io_seproxyhal_init+0x3c>)
c0de434e:	2701      	movs	r7, #1
c0de4350:	f88d 601e 	strb.w	r6, [sp, #30]
c0de4354:	f8ad 7020 	strh.w	r7, [sp, #32]
c0de4358:	f8ad 701c 	strh.w	r7, [sp, #28]
c0de435c:	9006      	str	r0, [sp, #24]
c0de435e:	4620      	mov	r0, r4
c0de4360:	f007 fefa 	bl	c0dec158 <os_io_init>
c0de4364:	f809 7005 	strb.w	r7, [r9, r5]
c0de4368:	b009      	add	sp, #36	@ 0x24
c0de436a:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de436c:	000016e8 	.word	0x000016e8
c0de4370:	00020015 	.word	0x00020015

c0de4374 <OUTLINED_FUNCTION_0>:
c0de4374:	eb09 0106 	add.w	r1, r9, r6
c0de4378:	3101      	adds	r1, #1
c0de437a:	4448      	add	r0, r9
c0de437c:	f008 b84c 	b.w	c0dec418 <__aeabi_memcpy>

c0de4380 <layoutAddCallbackObj>:
c0de4380:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de4382:	f890 40ad 	ldrb.w	r4, [r0, #173]	@ 0xad
c0de4386:	f890 50ae 	ldrb.w	r5, [r0, #174]	@ 0xae
c0de438a:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de438e:	f3c4 2505 	ubfx	r5, r4, #8, #6
c0de4392:	2d0e      	cmp	r5, #14
c0de4394:	bf84      	itt	hi
c0de4396:	2000      	movhi	r0, #0
c0de4398:	bdf0      	pophi	{r4, r5, r6, r7, pc}
c0de439a:	0a26      	lsrs	r6, r4, #8
c0de439c:	f404 4740 	and.w	r7, r4, #49152	@ 0xc000
c0de43a0:	f880 40ad 	strb.w	r4, [r0, #173]	@ 0xad
c0de43a4:	3601      	adds	r6, #1
c0de43a6:	f006 063f 	and.w	r6, r6, #63	@ 0x3f
c0de43aa:	ea47 2606 	orr.w	r6, r7, r6, lsl #8
c0de43ae:	0a36      	lsrs	r6, r6, #8
c0de43b0:	f880 60ae 	strb.w	r6, [r0, #174]	@ 0xae
c0de43b4:	eb00 00c5 	add.w	r0, r0, r5, lsl #3
c0de43b8:	f840 1f20 	str.w	r1, [r0, #32]!
c0de43bc:	7102      	strb	r2, [r0, #4]
c0de43be:	7183      	strb	r3, [r0, #6]
c0de43c0:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

c0de43c4 <nbgl_layoutGet>:
c0de43c4:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de43c8:	b085      	sub	sp, #20
c0de43ca:	4604      	mov	r4, r0
c0de43cc:	7800      	ldrb	r0, [r0, #0]
c0de43ce:	b190      	cbz	r0, c0de43f6 <nbgl_layoutGet+0x32>
c0de43d0:	486c      	ldr	r0, [pc, #432]	@ (c0de4584 <nbgl_layoutGet+0x1c0>)
c0de43d2:	496d      	ldr	r1, [pc, #436]	@ (c0de4588 <nbgl_layoutGet+0x1c4>)
c0de43d4:	2500      	movs	r5, #0
c0de43d6:	b158      	cbz	r0, c0de43f0 <nbgl_layoutGet+0x2c>
c0de43d8:	eb09 0201 	add.w	r2, r9, r1
c0de43dc:	4402      	add	r2, r0
c0de43de:	f892 32ca 	ldrb.w	r3, [r2, #714]	@ 0x2ca
c0de43e2:	021b      	lsls	r3, r3, #8
c0de43e4:	045b      	lsls	r3, r3, #17
c0de43e6:	bf58      	it	pl
c0de43e8:	f502 7507 	addpl.w	r5, r2, #540	@ 0x21c
c0de43ec:	30b4      	adds	r0, #180	@ 0xb4
c0de43ee:	e7f2      	b.n	c0de43d6 <nbgl_layoutGet+0x12>
c0de43f0:	b975      	cbnz	r5, c0de4410 <nbgl_layoutGet+0x4c>
c0de43f2:	2500      	movs	r5, #0
c0de43f4:	e0c1      	b.n	c0de457a <nbgl_layoutGet+0x1b6>
c0de43f6:	4965      	ldr	r1, [pc, #404]	@ (c0de458c <nbgl_layoutGet+0x1c8>)
c0de43f8:	4863      	ldr	r0, [pc, #396]	@ (c0de4588 <nbgl_layoutGet+0x1c4>)
c0de43fa:	eb09 0201 	add.w	r2, r9, r1
c0de43fe:	6852      	ldr	r2, [r2, #4]
c0de4400:	b112      	cbz	r2, c0de4408 <nbgl_layoutGet+0x44>
c0de4402:	eb09 0500 	add.w	r5, r9, r0
c0de4406:	e003      	b.n	c0de4410 <nbgl_layoutGet+0x4c>
c0de4408:	eb09 0500 	add.w	r5, r9, r0
c0de440c:	4449      	add	r1, r9
c0de440e:	604d      	str	r5, [r1, #4]
c0de4410:	4e5d      	ldr	r6, [pc, #372]	@ (c0de4588 <nbgl_layoutGet+0x1c4>)
c0de4412:	4628      	mov	r0, r5
c0de4414:	21b4      	movs	r1, #180	@ 0xb4
c0de4416:	f859 7006 	ldr.w	r7, [r9, r6]
c0de441a:	f008 f807 	bl	c0dec42c <__aeabi_memclr>
c0de441e:	7820      	ldrb	r0, [r4, #0]
c0de4420:	b150      	cbz	r0, c0de4438 <nbgl_layoutGet+0x74>
c0de4422:	485a      	ldr	r0, [pc, #360]	@ (c0de458c <nbgl_layoutGet+0x1c8>)
c0de4424:	4448      	add	r0, r9
c0de4426:	6841      	ldr	r1, [r0, #4]
c0de4428:	2900      	cmp	r1, #0
c0de442a:	bf08      	it	eq
c0de442c:	eb09 0106 	addeq.w	r1, r9, r6
c0de4430:	600d      	str	r5, [r1, #0]
c0de4432:	6069      	str	r1, [r5, #4]
c0de4434:	6045      	str	r5, [r0, #4]
c0de4436:	e001      	b.n	c0de443c <nbgl_layoutGet+0x78>
c0de4438:	f849 7006 	str.w	r7, [r9, r6]
c0de443c:	4853      	ldr	r0, [pc, #332]	@ (c0de458c <nbgl_layoutGet+0x1c8>)
c0de443e:	2100      	movs	r1, #0
c0de4440:	f809 1000 	strb.w	r1, [r9, r0]
c0de4444:	68e0      	ldr	r0, [r4, #12]
c0de4446:	f007 fdcf 	bl	c0debfe8 <pic>
c0de444a:	4629      	mov	r1, r5
c0de444c:	7826      	ldrb	r6, [r4, #0]
c0de444e:	f811 2fad 	ldrb.w	r2, [r1, #173]!
c0de4452:	784b      	ldrb	r3, [r1, #1]
c0de4454:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de4458:	f022 0201 	bic.w	r2, r2, #1
c0de445c:	4332      	orrs	r2, r6
c0de445e:	700a      	strb	r2, [r1, #0]
c0de4460:	f002 02fd 	and.w	r2, r2, #253	@ 0xfd
c0de4464:	7866      	ldrb	r6, [r4, #1]
c0de4466:	f841 0c91 	str.w	r0, [r1, #-145]
c0de446a:	704b      	strb	r3, [r1, #1]
c0de446c:	f1a1 00a5 	sub.w	r0, r1, #165	@ 0xa5
c0de4470:	ea42 0246 	orr.w	r2, r2, r6, lsl #1
c0de4474:	700a      	strb	r2, [r1, #0]
c0de4476:	f104 0210 	add.w	r2, r4, #16
c0de447a:	7821      	ldrb	r1, [r4, #0]
c0de447c:	4b44      	ldr	r3, [pc, #272]	@ (c0de4590 <nbgl_layoutGet+0x1cc>)
c0de447e:	447b      	add	r3, pc
c0de4480:	b159      	cbz	r1, c0de449a <nbgl_layoutGet+0xd6>
c0de4482:	2106      	movs	r1, #6
c0de4484:	f007 fbb6 	bl	c0debbf4 <nbgl_screenPush>
c0de4488:	f895 10ad 	ldrb.w	r1, [r5, #173]	@ 0xad
c0de448c:	f895 20ae 	ldrb.w	r2, [r5, #174]	@ 0xae
c0de4490:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de4494:	f360 01c7 	bfi	r1, r0, #3, #5
c0de4498:	e00a      	b.n	c0de44b0 <nbgl_layoutGet+0xec>
c0de449a:	2106      	movs	r1, #6
c0de449c:	f007 fba5 	bl	c0debbea <nbgl_screenSet>
c0de44a0:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de44a4:	f895 10ae 	ldrb.w	r1, [r5, #174]	@ 0xae
c0de44a8:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de44ac:	f020 01f8 	bic.w	r1, r0, #248	@ 0xf8
c0de44b0:	462f      	mov	r7, r5
c0de44b2:	0a08      	lsrs	r0, r1, #8
c0de44b4:	f04f 0a01 	mov.w	sl, #1
c0de44b8:	f807 1fad 	strb.w	r1, [r7, #173]!
c0de44bc:	7078      	strb	r0, [r7, #1]
c0de44be:	b2c8      	uxtb	r0, r1
c0de44c0:	f003 fb69 	bl	c0de7b96 <OUTLINED_FUNCTION_16>
c0de44c4:	2102      	movs	r1, #2
c0de44c6:	f04f 0800 	mov.w	r8, #0
c0de44ca:	f880 a005 	strb.w	sl, [r0, #5]
c0de44ce:	71c1      	strb	r1, [r0, #7]
c0de44d0:	2158      	movs	r1, #88	@ 0x58
c0de44d2:	f880 801f 	strb.w	r8, [r0, #31]
c0de44d6:	7181      	strb	r1, [r0, #6]
c0de44d8:	21e0      	movs	r1, #224	@ 0xe0
c0de44da:	7101      	strb	r1, [r0, #4]
c0de44dc:	f847 0c0d 	str.w	r0, [r7, #-13]
c0de44e0:	7838      	ldrb	r0, [r7, #0]
c0de44e2:	08c1      	lsrs	r1, r0, #3
c0de44e4:	2014      	movs	r0, #20
c0de44e6:	f007 fba3 	bl	c0debc30 <nbgl_containerPoolGet>
c0de44ea:	f857 2c0d 	ldr.w	r2, [r7, #-13]
c0de44ee:	0a03      	lsrs	r3, r0, #8
c0de44f0:	f857 1ca5 	ldr.w	r1, [r7, #-165]
c0de44f4:	0e06      	lsrs	r6, r0, #24
c0de44f6:	f882 3023 	strb.w	r3, [r2, #35]	@ 0x23
c0de44fa:	4613      	mov	r3, r2
c0de44fc:	f882 a016 	strb.w	sl, [r2, #22]
c0de4500:	f803 0f22 	strb.w	r0, [r3, #34]!
c0de4504:	0c00      	lsrs	r0, r0, #16
c0de4506:	70de      	strb	r6, [r3, #3]
c0de4508:	7098      	strb	r0, [r3, #2]
c0de450a:	604a      	str	r2, [r1, #4]
c0de450c:	7838      	ldrb	r0, [r7, #0]
c0de450e:	7879      	ldrb	r1, [r7, #1]
c0de4510:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de4514:	f440 4180 	orr.w	r1, r0, #16384	@ 0x4000
c0de4518:	0a0a      	lsrs	r2, r1, #8
c0de451a:	707a      	strb	r2, [r7, #1]
c0de451c:	6862      	ldr	r2, [r4, #4]
c0de451e:	b362      	cbz	r2, c0de457a <nbgl_layoutGet+0x1b6>
c0de4520:	eb0a 2210 	add.w	r2, sl, r0, lsr #8
c0de4524:	f885 10ad 	strb.w	r1, [r5, #173]	@ 0xad
c0de4528:	f401 4140 	and.w	r1, r1, #49152	@ 0xc000
c0de452c:	f3c0 2005 	ubfx	r0, r0, #8, #6
c0de4530:	f002 023f 	and.w	r2, r2, #63	@ 0x3f
c0de4534:	eb05 00c0 	add.w	r0, r5, r0, lsl #3
c0de4538:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de453c:	2204      	movs	r2, #4
c0de453e:	0a09      	lsrs	r1, r1, #8
c0de4540:	f885 10ae 	strb.w	r1, [r5, #174]	@ 0xae
c0de4544:	f8d5 10a0 	ldr.w	r1, [r5, #160]	@ 0xa0
c0de4548:	6201      	str	r1, [r0, #32]
c0de454a:	f881 801d 	strb.w	r8, [r1, #29]
c0de454e:	f881 a01c 	strb.w	sl, [r1, #28]
c0de4552:	778a      	strb	r2, [r1, #30]
c0de4554:	7a21      	ldrb	r1, [r4, #8]
c0de4556:	7a63      	ldrb	r3, [r4, #9]
c0de4558:	f880 3026 	strb.w	r3, [r0, #38]	@ 0x26
c0de455c:	f880 1024 	strb.w	r1, [r0, #36]	@ 0x24
c0de4560:	f88d 2000 	strb.w	r2, [sp]
c0de4564:	6860      	ldr	r0, [r4, #4]
c0de4566:	f007 fd3f 	bl	c0debfe8 <pic>
c0de456a:	9001      	str	r0, [sp, #4]
c0de456c:	8920      	ldrh	r0, [r4, #8]
c0de456e:	4669      	mov	r1, sp
c0de4570:	f8ad 0008 	strh.w	r0, [sp, #8]
c0de4574:	4628      	mov	r0, r5
c0de4576:	f000 f981 	bl	c0de487c <nbgl_layoutAddUpFooter>
c0de457a:	4628      	mov	r0, r5
c0de457c:	b005      	add	sp, #20
c0de457e:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de4582:	bf00      	nop
c0de4584:	fffffe98 	.word	0xfffffe98
c0de4588:	000016ec 	.word	0x000016ec
c0de458c:	00001908 	.word	0x00001908
c0de4590:	00000113 	.word	0x00000113

c0de4594 <touchCallback>:
c0de4594:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de4598:	2800      	cmp	r0, #0
c0de459a:	f000 816d 	beq.w	c0de4878 <touchCallback+0x2e4>
c0de459e:	460d      	mov	r5, r1
c0de45a0:	a901      	add	r1, sp, #4
c0de45a2:	466a      	mov	r2, sp
c0de45a4:	4604      	mov	r4, r0
c0de45a6:	f003 f965 	bl	c0de7874 <getLayoutAndLayoutObj>
c0de45aa:	b968      	cbnz	r0, c0de45c8 <touchCallback+0x34>
c0de45ac:	4620      	mov	r0, r4
c0de45ae:	f810 1f0e 	ldrb.w	r1, [r0, #14]!
c0de45b2:	f003 fad1 	bl	c0de7b58 <OUTLINED_FUNCTION_14>
c0de45b6:	466a      	mov	r2, sp
c0de45b8:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de45bc:	a901      	add	r1, sp, #4
c0de45be:	f003 f959 	bl	c0de7874 <getLayoutAndLayoutObj>
c0de45c2:	2800      	cmp	r0, #0
c0de45c4:	f000 8158 	beq.w	c0de4878 <touchCallback+0x2e4>
c0de45c8:	1fe8      	subs	r0, r5, #7
c0de45ca:	b2c0      	uxtb	r0, r0
c0de45cc:	2803      	cmp	r0, #3
c0de45ce:	d833      	bhi.n	c0de4638 <touchCallback+0xa4>
c0de45d0:	7ee0      	ldrb	r0, [r4, #27]
c0de45d2:	2801      	cmp	r0, #1
c0de45d4:	d130      	bne.n	c0de4638 <touchCallback+0xa4>
c0de45d6:	9901      	ldr	r1, [sp, #4]
c0de45d8:	4628      	mov	r0, r5
c0de45da:	f891 20b0 	ldrb.w	r2, [r1, #176]	@ 0xb0
c0de45de:	2a01      	cmp	r2, #1
c0de45e0:	d028      	beq.n	c0de4634 <touchCallback+0xa0>
c0de45e2:	bb4a      	cbnz	r2, c0de4638 <touchCallback+0xa4>
c0de45e4:	f8d1 00a0 	ldr.w	r0, [r1, #160]	@ 0xa0
c0de45e8:	42a0      	cmp	r0, r4
c0de45ea:	d125      	bne.n	c0de4638 <touchCallback+0xa4>
c0de45ec:	f891 00ab 	ldrb.w	r0, [r1, #171]	@ 0xab
c0de45f0:	2803      	cmp	r0, #3
c0de45f2:	d005      	beq.n	c0de4600 <touchCallback+0x6c>
c0de45f4:	2804      	cmp	r0, #4
c0de45f6:	f040 813f 	bne.w	c0de4878 <touchCallback+0x2e4>
c0de45fa:	f101 0010 	add.w	r0, r1, #16
c0de45fe:	e00c      	b.n	c0de461a <touchCallback+0x86>
c0de4600:	6908      	ldr	r0, [r1, #16]
c0de4602:	f810 2f22 	ldrb.w	r2, [r0, #34]!
c0de4606:	7843      	ldrb	r3, [r0, #1]
c0de4608:	7886      	ldrb	r6, [r0, #2]
c0de460a:	78c0      	ldrb	r0, [r0, #3]
c0de460c:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de4610:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de4614:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de4618:	3004      	adds	r0, #4
c0de461a:	f101 06a9 	add.w	r6, r1, #169	@ 0xa9
c0de461e:	f891 20a8 	ldrb.w	r2, [r1, #168]	@ 0xa8
c0de4622:	6800      	ldr	r0, [r0, #0]
c0de4624:	4629      	mov	r1, r5
c0de4626:	4633      	mov	r3, r6
c0de4628:	f003 fccc 	bl	c0de7fc4 <layoutNavigationCallback>
c0de462c:	2800      	cmp	r0, #0
c0de462e:	f000 8123 	beq.w	c0de4878 <touchCallback+0x2e4>
c0de4632:	7830      	ldrb	r0, [r6, #0]
c0de4634:	9900      	ldr	r1, [sp, #0]
c0de4636:	7148      	strb	r0, [r1, #5]
c0de4638:	4620      	mov	r0, r4
c0de463a:	9f01      	ldr	r7, [sp, #4]
c0de463c:	f810 1f0e 	ldrb.w	r1, [r0, #14]!
c0de4640:	f003 fc15 	bl	c0de7e6e <OUTLINED_FUNCTION_53>
c0de4644:	6938      	ldr	r0, [r7, #16]
c0de4646:	4281      	cmp	r1, r0
c0de4648:	d103      	bne.n	c0de4652 <touchCallback+0xbe>
c0de464a:	f897 20ab 	ldrb.w	r2, [r7, #171]	@ 0xab
c0de464e:	2a04      	cmp	r2, #4
c0de4650:	d00c      	beq.n	c0de466c <touchCallback+0xd8>
c0de4652:	7eca      	ldrb	r2, [r1, #27]
c0de4654:	2a01      	cmp	r2, #1
c0de4656:	d118      	bne.n	c0de468a <touchCallback+0xf6>
c0de4658:	f811 2f0e 	ldrb.w	r2, [r1, #14]!
c0de465c:	f003 fa53 	bl	c0de7b06 <OUTLINED_FUNCTION_11>
c0de4660:	4281      	cmp	r1, r0
c0de4662:	d112      	bne.n	c0de468a <touchCallback+0xf6>
c0de4664:	f897 00ab 	ldrb.w	r0, [r7, #171]	@ 0xab
c0de4668:	2803      	cmp	r0, #3
c0de466a:	d10e      	bne.n	c0de468a <touchCallback+0xf6>
c0de466c:	f107 06a9 	add.w	r6, r7, #169	@ 0xa9
c0de4670:	f897 20a8 	ldrb.w	r2, [r7, #168]	@ 0xa8
c0de4674:	4620      	mov	r0, r4
c0de4676:	4629      	mov	r1, r5
c0de4678:	4633      	mov	r3, r6
c0de467a:	f003 fca3 	bl	c0de7fc4 <layoutNavigationCallback>
c0de467e:	2800      	cmp	r0, #0
c0de4680:	f000 80fa 	beq.w	c0de4878 <touchCallback+0x2e4>
c0de4684:	7830      	ldrb	r0, [r6, #0]
c0de4686:	9900      	ldr	r1, [sp, #0]
c0de4688:	7148      	strb	r0, [r1, #5]
c0de468a:	7ee0      	ldrb	r0, [r4, #27]
c0de468c:	2801      	cmp	r0, #1
c0de468e:	f040 809b 	bne.w	c0de47c8 <touchCallback+0x234>
c0de4692:	f894 0020 	ldrb.w	r0, [r4, #32]
c0de4696:	2802      	cmp	r0, #2
c0de4698:	f0c0 8096 	bcc.w	c0de47c8 <touchCallback+0x234>
c0de469c:	4621      	mov	r1, r4
c0de469e:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de46a2:	f003 fa30 	bl	c0de7b06 <OUTLINED_FUNCTION_11>
c0de46a6:	684e      	ldr	r6, [r1, #4]
c0de46a8:	b196      	cbz	r6, c0de46d0 <touchCallback+0x13c>
c0de46aa:	7ef1      	ldrb	r1, [r6, #27]
c0de46ac:	2906      	cmp	r1, #6
c0de46ae:	d10f      	bne.n	c0de46d0 <touchCallback+0x13c>
c0de46b0:	f896 0021 	ldrb.w	r0, [r6, #33]	@ 0x21
c0de46b4:	3801      	subs	r0, #1
c0de46b6:	bf18      	it	ne
c0de46b8:	2001      	movne	r0, #1
c0de46ba:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de46be:	4630      	mov	r0, r6
c0de46c0:	f007 fa89 	bl	c0debbd6 <nbgl_objDraw>
c0de46c4:	f896 0021 	ldrb.w	r0, [r6, #33]	@ 0x21
c0de46c8:	9900      	ldr	r1, [sp, #0]
c0de46ca:	2401      	movs	r4, #1
c0de46cc:	7148      	strb	r0, [r1, #5]
c0de46ce:	e07c      	b.n	c0de47ca <touchCallback+0x236>
c0de46d0:	2804      	cmp	r0, #4
c0de46d2:	d060      	beq.n	c0de4796 <touchCallback+0x202>
c0de46d4:	2802      	cmp	r0, #2
c0de46d6:	d177      	bne.n	c0de47c8 <touchCallback+0x234>
c0de46d8:	f003 fb68 	bl	c0de7dac <OUTLINED_FUNCTION_40>
c0de46dc:	6840      	ldr	r0, [r0, #4]
c0de46de:	2800      	cmp	r0, #0
c0de46e0:	d072      	beq.n	c0de47c8 <touchCallback+0x234>
c0de46e2:	7ec0      	ldrb	r0, [r0, #27]
c0de46e4:	2809      	cmp	r0, #9
c0de46e6:	d16f      	bne.n	c0de47c8 <touchCallback+0x234>
c0de46e8:	2d00      	cmp	r5, #0
c0de46ea:	f040 80c5 	bne.w	c0de4878 <touchCallback+0x2e4>
c0de46ee:	f04f 0aff 	mov.w	sl, #255	@ 0xff
c0de46f2:	2500      	movs	r5, #0
c0de46f4:	f04f 0800 	mov.w	r8, #0
c0de46f8:	f897 10ae 	ldrb.w	r1, [r7, #174]	@ 0xae
c0de46fc:	fa5f f088 	uxtb.w	r0, r8
c0de4700:	f001 013f 	and.w	r1, r1, #63	@ 0x3f
c0de4704:	4281      	cmp	r1, r0
c0de4706:	d977      	bls.n	c0de47f8 <touchCallback+0x264>
c0de4708:	eb07 00c0 	add.w	r0, r7, r0, lsl #3
c0de470c:	6a00      	ldr	r0, [r0, #32]
c0de470e:	42a0      	cmp	r0, r4
c0de4710:	d117      	bne.n	c0de4742 <touchCallback+0x1ae>
c0de4712:	7ee1      	ldrb	r1, [r4, #27]
c0de4714:	2901      	cmp	r1, #1
c0de4716:	d114      	bne.n	c0de4742 <touchCallback+0x1ae>
c0de4718:	4620      	mov	r0, r4
c0de471a:	46ab      	mov	fp, r5
c0de471c:	46c2      	mov	sl, r8
c0de471e:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de4722:	f003 fa19 	bl	c0de7b58 <OUTLINED_FUNCTION_14>
c0de4726:	220c      	movs	r2, #12
c0de4728:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de472c:	e9d0 1000 	ldrd	r1, r0, [r0]
c0de4730:	f881 2022 	strb.w	r2, [r1, #34]	@ 0x22
c0de4734:	2200      	movs	r2, #0
c0de4736:	77ca      	strb	r2, [r1, #31]
c0de4738:	2101      	movs	r1, #1
c0de473a:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de473e:	4620      	mov	r0, r4
c0de4740:	e024      	b.n	c0de478c <touchCallback+0x1f8>
c0de4742:	7ec1      	ldrb	r1, [r0, #27]
c0de4744:	2901      	cmp	r1, #1
c0de4746:	d123      	bne.n	c0de4790 <touchCallback+0x1fc>
c0de4748:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de474c:	2902      	cmp	r1, #2
c0de474e:	d11f      	bne.n	c0de4790 <touchCallback+0x1fc>
c0de4750:	4601      	mov	r1, r0
c0de4752:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de4756:	784b      	ldrb	r3, [r1, #1]
c0de4758:	788e      	ldrb	r6, [r1, #2]
c0de475a:	78c9      	ldrb	r1, [r1, #3]
c0de475c:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de4760:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de4764:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
c0de4768:	6851      	ldr	r1, [r2, #4]
c0de476a:	7ecb      	ldrb	r3, [r1, #27]
c0de476c:	2b09      	cmp	r3, #9
c0de476e:	d10f      	bne.n	c0de4790 <touchCallback+0x1fc>
c0de4770:	f891 3021 	ldrb.w	r3, [r1, #33]	@ 0x21
c0de4774:	3501      	adds	r5, #1
c0de4776:	2b01      	cmp	r3, #1
c0de4778:	d10a      	bne.n	c0de4790 <touchCallback+0x1fc>
c0de477a:	6812      	ldr	r2, [r2, #0]
c0de477c:	230b      	movs	r3, #11
c0de477e:	f882 3022 	strb.w	r3, [r2, #34]	@ 0x22
c0de4782:	2301      	movs	r3, #1
c0de4784:	77d3      	strb	r3, [r2, #31]
c0de4786:	2200      	movs	r2, #0
c0de4788:	f881 2021 	strb.w	r2, [r1, #33]	@ 0x21
c0de478c:	f007 fa23 	bl	c0debbd6 <nbgl_objDraw>
c0de4790:	f108 0801 	add.w	r8, r8, #1
c0de4794:	e7b0      	b.n	c0de46f8 <touchCallback+0x164>
c0de4796:	f003 fb09 	bl	c0de7dac <OUTLINED_FUNCTION_40>
c0de479a:	68c6      	ldr	r6, [r0, #12]
c0de479c:	b1a6      	cbz	r6, c0de47c8 <touchCallback+0x234>
c0de479e:	7ef0      	ldrb	r0, [r6, #27]
c0de47a0:	2808      	cmp	r0, #8
c0de47a2:	d111      	bne.n	c0de47c8 <touchCallback+0x234>
c0de47a4:	2d0a      	cmp	r5, #10
c0de47a6:	d867      	bhi.n	c0de4878 <touchCallback+0x2e4>
c0de47a8:	2001      	movs	r0, #1
c0de47aa:	40a8      	lsls	r0, r5
c0de47ac:	f410 6fc5 	tst.w	r0, #1576	@ 0x628
c0de47b0:	d039      	beq.n	c0de4826 <touchCallback+0x292>
c0de47b2:	f007 fc49 	bl	c0dec048 <nbgl_wait_pipeline>
c0de47b6:	2000      	movs	r0, #0
c0de47b8:	f003 faed 	bl	c0de7d96 <OUTLINED_FUNCTION_39>
c0de47bc:	2003      	movs	r0, #3
c0de47be:	2100      	movs	r1, #0
c0de47c0:	e8bd 4dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de47c4:	f007 b9fd 	b.w	c0debbc2 <nbgl_refreshSpecialWithPostRefresh>
c0de47c8:	2400      	movs	r4, #0
c0de47ca:	69f8      	ldr	r0, [r7, #28]
c0de47cc:	2800      	cmp	r0, #0
c0de47ce:	d053      	beq.n	c0de4878 <touchCallback+0x2e4>
c0de47d0:	9d00      	ldr	r5, [sp, #0]
c0de47d2:	7928      	ldrb	r0, [r5, #4]
c0de47d4:	28ff      	cmp	r0, #255	@ 0xff
c0de47d6:	d04f      	beq.n	c0de4878 <touchCallback+0x2e4>
c0de47d8:	79a8      	ldrb	r0, [r5, #6]
c0de47da:	280b      	cmp	r0, #11
c0de47dc:	bf98      	it	ls
c0de47de:	f7ff fbe9 	blls	c0de3fb4 <os_io_seph_cmd_piezo_play_tune>
c0de47e2:	b114      	cbz	r4, c0de47ea <touchCallback+0x256>
c0de47e4:	2001      	movs	r0, #1
c0de47e6:	f007 f9e7 	bl	c0debbb8 <nbgl_refreshSpecial>
c0de47ea:	7928      	ldrb	r0, [r5, #4]
c0de47ec:	7969      	ldrb	r1, [r5, #5]
c0de47ee:	69fa      	ldr	r2, [r7, #28]
c0de47f0:	b002      	add	sp, #8
c0de47f2:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de47f6:	4710      	bx	r2
c0de47f8:	fa5f f08a 	uxtb.w	r0, sl
c0de47fc:	28ff      	cmp	r0, #255	@ 0xff
c0de47fe:	d03b      	beq.n	c0de4878 <touchCallback+0x2e4>
c0de4800:	69f9      	ldr	r1, [r7, #28]
c0de4802:	b3c9      	cbz	r1, c0de4878 <touchCallback+0x2e4>
c0de4804:	eb07 04c0 	add.w	r4, r7, r0, lsl #3
c0de4808:	f894 0026 	ldrb.w	r0, [r4, #38]	@ 0x26
c0de480c:	280b      	cmp	r0, #11
c0de480e:	bf98      	it	ls
c0de4810:	f7ff fbd0 	blls	c0de3fb4 <os_io_seph_cmd_piezo_play_tune>
c0de4814:	2001      	movs	r0, #1
c0de4816:	f007 f9cf 	bl	c0debbb8 <nbgl_refreshSpecial>
c0de481a:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de481e:	69fa      	ldr	r2, [r7, #28]
c0de4820:	fa5f f18b 	uxtb.w	r1, fp
c0de4824:	e7e4      	b.n	c0de47f0 <touchCallback+0x25c>
c0de4826:	2d02      	cmp	r5, #2
c0de4828:	d126      	bne.n	c0de4878 <touchCallback+0x2e4>
c0de482a:	9d00      	ldr	r5, [sp, #0]
c0de482c:	4620      	mov	r0, r4
c0de482e:	f007 fa31 	bl	c0debc94 <nbgl_touchGetTouchDuration>
c0de4832:	f896 1021 	ldrb.w	r1, [r6, #33]	@ 0x21
c0de4836:	2200      	movs	r2, #0
c0de4838:	2300      	movs	r3, #0
c0de483a:	2964      	cmp	r1, #100	@ 0x64
c0de483c:	bf38      	it	cc
c0de483e:	2301      	movcc	r3, #1
c0de4840:	2464      	movs	r4, #100	@ 0x64
c0de4842:	fbb0 f0f4 	udiv	r0, r0, r4
c0de4846:	ebc0 00c0 	rsb	r0, r0, r0, lsl #3
c0de484a:	b2c4      	uxtb	r4, r0
c0de484c:	2c63      	cmp	r4, #99	@ 0x63
c0de484e:	bf88      	it	hi
c0de4850:	2201      	movhi	r2, #1
c0de4852:	ea02 0403 	and.w	r4, r2, r3
c0de4856:	bf88      	it	hi
c0de4858:	2064      	movhi	r0, #100	@ 0x64
c0de485a:	b2c2      	uxtb	r2, r0
c0de485c:	428a      	cmp	r2, r1
c0de485e:	d005      	beq.n	c0de486c <touchCallback+0x2d8>
c0de4860:	f003 fa99 	bl	c0de7d96 <OUTLINED_FUNCTION_39>
c0de4864:	2004      	movs	r0, #4
c0de4866:	2102      	movs	r1, #2
c0de4868:	f007 f9ab 	bl	c0debbc2 <nbgl_refreshSpecialWithPostRefresh>
c0de486c:	b124      	cbz	r4, c0de4878 <touchCallback+0x2e4>
c0de486e:	69fa      	ldr	r2, [r7, #28]
c0de4870:	b112      	cbz	r2, c0de4878 <touchCallback+0x2e4>
c0de4872:	7928      	ldrb	r0, [r5, #4]
c0de4874:	7969      	ldrb	r1, [r5, #5]
c0de4876:	e7bb      	b.n	c0de47f0 <touchCallback+0x25c>
c0de4878:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de487c <nbgl_layoutAddUpFooter>:
c0de487c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de4880:	2800      	cmp	r0, #0
c0de4882:	f000 827e 	beq.w	c0de4d82 <nbgl_layoutAddUpFooter+0x506>
c0de4886:	460d      	mov	r5, r1
c0de4888:	b119      	cbz	r1, c0de4892 <nbgl_layoutAddUpFooter+0x16>
c0de488a:	4604      	mov	r4, r0
c0de488c:	7828      	ldrb	r0, [r5, #0]
c0de488e:	2804      	cmp	r0, #4
c0de4890:	d903      	bls.n	c0de489a <nbgl_layoutAddUpFooter+0x1e>
c0de4892:	f06f 0001 	mvn.w	r0, #1
c0de4896:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de489a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de489e:	2601      	movs	r6, #1
c0de48a0:	f003 f979 	bl	c0de7b96 <OUTLINED_FUNCTION_16>
c0de48a4:	2100      	movs	r1, #0
c0de48a6:	7146      	strb	r6, [r0, #5]
c0de48a8:	77c1      	strb	r1, [r0, #31]
c0de48aa:	21e0      	movs	r1, #224	@ 0xe0
c0de48ac:	7101      	strb	r1, [r0, #4]
c0de48ae:	6160      	str	r0, [r4, #20]
c0de48b0:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de48b4:	f003 fb1a 	bl	c0de7eec <OUTLINED_FUNCTION_62>
c0de48b8:	6961      	ldr	r1, [r4, #20]
c0de48ba:	0a02      	lsrs	r2, r0, #8
c0de48bc:	f8d4 30a0 	ldr.w	r3, [r4, #160]	@ 0xa0
c0de48c0:	0e06      	lsrs	r6, r0, #24
c0de48c2:	f881 2023 	strb.w	r2, [r1, #35]	@ 0x23
c0de48c6:	2208      	movs	r2, #8
c0de48c8:	f003 fb3c 	bl	c0de7f44 <OUTLINED_FUNCTION_70>
c0de48cc:	4608      	mov	r0, r1
c0de48ce:	70d6      	strb	r6, [r2, #3]
c0de48d0:	0e1a      	lsrs	r2, r3, #24
c0de48d2:	f800 3f12 	strb.w	r3, [r0, #18]!
c0de48d6:	70c2      	strb	r2, [r0, #3]
c0de48d8:	0c1a      	lsrs	r2, r3, #16
c0de48da:	7082      	strb	r2, [r0, #2]
c0de48dc:	0a18      	lsrs	r0, r3, #8
c0de48de:	74c8      	strb	r0, [r1, #19]
c0de48e0:	7828      	ldrb	r0, [r5, #0]
c0de48e2:	2804      	cmp	r0, #4
c0de48e4:	f000 80c6 	beq.w	c0de4a74 <nbgl_layoutAddUpFooter+0x1f8>
c0de48e8:	2801      	cmp	r0, #1
c0de48ea:	f000 80f1 	beq.w	c0de4ad0 <nbgl_layoutAddUpFooter+0x254>
c0de48ee:	2802      	cmp	r0, #2
c0de48f0:	f000 8153 	beq.w	c0de4b9a <nbgl_layoutAddUpFooter+0x31e>
c0de48f4:	2803      	cmp	r0, #3
c0de48f6:	f000 81df 	beq.w	c0de4cb8 <nbgl_layoutAddUpFooter+0x43c>
c0de48fa:	2800      	cmp	r0, #0
c0de48fc:	d1c9      	bne.n	c0de4892 <nbgl_layoutAddUpFooter+0x16>
c0de48fe:	f003 fb13 	bl	c0de7f28 <OUTLINED_FUNCTION_67>
c0de4902:	2800      	cmp	r0, #0
c0de4904:	f000 823d 	beq.w	c0de4d82 <nbgl_layoutAddUpFooter+0x506>
c0de4908:	6960      	ldr	r0, [r4, #20]
c0de490a:	2104      	movs	r1, #4
c0de490c:	2700      	movs	r7, #0
c0de490e:	f04f 0806 	mov.w	r8, #6
c0de4912:	f880 1020 	strb.w	r1, [r0, #32]
c0de4916:	2112      	movs	r1, #18
c0de4918:	71c7      	strb	r7, [r0, #7]
c0de491a:	f880 801d 	strb.w	r8, [r0, #29]
c0de491e:	7781      	strb	r1, [r0, #30]
c0de4920:	2198      	movs	r1, #152	@ 0x98
c0de4922:	7181      	strb	r1, [r0, #6]
c0de4924:	212c      	movs	r1, #44	@ 0x2c
c0de4926:	7701      	strb	r1, [r0, #28]
c0de4928:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de492c:	4ee0      	ldr	r6, [pc, #896]	@ (c0de4cb0 <nbgl_layoutAddUpFooter+0x434>)
c0de492e:	08c1      	lsrs	r1, r0, #3
c0de4930:	447e      	add	r6, pc
c0de4932:	2005      	movs	r0, #5
c0de4934:	47b0      	blx	r6
c0de4936:	46b2      	mov	sl, r6
c0de4938:	4606      	mov	r6, r0
c0de493a:	7607      	strb	r7, [r0, #24]
c0de493c:	2020      	movs	r0, #32
c0de493e:	2103      	movs	r1, #3
c0de4940:	75f0      	strb	r0, [r6, #23]
c0de4942:	2058      	movs	r0, #88	@ 0x58
c0de4944:	f886 8016 	strb.w	r8, [r6, #22]
c0de4948:	46b0      	mov	r8, r6
c0de494a:	71f7      	strb	r7, [r6, #7]
c0de494c:	f886 1021 	strb.w	r1, [r6, #33]	@ 0x21
c0de4950:	77f7      	strb	r7, [r6, #31]
c0de4952:	f886 7020 	strb.w	r7, [r6, #32]
c0de4956:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de495a:	f808 0f04 	strb.w	r0, [r8, #4]!
c0de495e:	71b0      	strb	r0, [r6, #6]
c0de4960:	f888 7001 	strb.w	r7, [r8, #1]
c0de4964:	48d3      	ldr	r0, [pc, #844]	@ (c0de4cb4 <nbgl_layoutAddUpFooter+0x438>)
c0de4966:	4478      	add	r0, pc
c0de4968:	f007 fb3e 	bl	c0debfe8 <pic>
c0de496c:	4631      	mov	r1, r6
c0de496e:	0e02      	lsrs	r2, r0, #24
c0de4970:	f003 f9b3 	bl	c0de7cda <OUTLINED_FUNCTION_31>
c0de4974:	6960      	ldr	r0, [r4, #20]
c0de4976:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de497a:	7842      	ldrb	r2, [r0, #1]
c0de497c:	7883      	ldrb	r3, [r0, #2]
c0de497e:	78c0      	ldrb	r0, [r0, #3]
c0de4980:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de4984:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de4988:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de498c:	6006      	str	r6, [r0, #0]
c0de498e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4992:	08c1      	lsrs	r1, r0, #3
c0de4994:	2004      	movs	r0, #4
c0de4996:	47d0      	blx	sl
c0de4998:	77c7      	strb	r7, [r0, #31]
c0de499a:	4606      	mov	r6, r0
c0de499c:	f003 f944 	bl	c0de7c28 <OUTLINED_FUNCTION_23>
c0de49a0:	4601      	mov	r1, r0
c0de49a2:	2001      	movs	r0, #1
c0de49a4:	f04f 0b04 	mov.w	fp, #4
c0de49a8:	2301      	movs	r3, #1
c0de49aa:	f886 0024 	strb.w	r0, [r6, #36]	@ 0x24
c0de49ae:	200d      	movs	r0, #13
c0de49b0:	0e0a      	lsrs	r2, r1, #24
c0de49b2:	f886 b020 	strb.w	fp, [r6, #32]
c0de49b6:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de49ba:	f003 fa40 	bl	c0de7e3e <OUTLINED_FUNCTION_50>
c0de49be:	f898 0000 	ldrb.w	r0, [r8]
c0de49c2:	f898 2001 	ldrb.w	r2, [r8, #1]
c0de49c6:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de49ca:	f5c0 70c0 	rsb	r0, r0, #384	@ 0x180
c0de49ce:	0a02      	lsrs	r2, r0, #8
c0de49d0:	7130      	strb	r0, [r6, #4]
c0de49d2:	7172      	strb	r2, [r6, #5]
c0de49d4:	b282      	uxth	r2, r0
c0de49d6:	f003 fae2 	bl	c0de7f9e <OUTLINED_FUNCTION_78>
c0de49da:	2120      	movs	r1, #32
c0de49dc:	71b0      	strb	r0, [r6, #6]
c0de49de:	0a00      	lsrs	r0, r0, #8
c0de49e0:	f886 b016 	strb.w	fp, [r6, #22]
c0de49e4:	f886 7021 	strb.w	r7, [r6, #33]	@ 0x21
c0de49e8:	7637      	strb	r7, [r6, #24]
c0de49ea:	f04f 0b04 	mov.w	fp, #4
c0de49ee:	75f1      	strb	r1, [r6, #23]
c0de49f0:	71f0      	strb	r0, [r6, #7]
c0de49f2:	6960      	ldr	r0, [r4, #20]
c0de49f4:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de49f8:	7842      	ldrb	r2, [r0, #1]
c0de49fa:	7883      	ldrb	r3, [r0, #2]
c0de49fc:	78c0      	ldrb	r0, [r0, #3]
c0de49fe:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de4a02:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de4a06:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de4a0a:	6046      	str	r6, [r0, #4]
c0de4a0c:	f003 f91f 	bl	c0de7c4e <OUTLINED_FUNCTION_25>
c0de4a10:	2103      	movs	r1, #3
c0de4a12:	f04f 0802 	mov.w	r8, #2
c0de4a16:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de4a1a:	6961      	ldr	r1, [r4, #20]
c0de4a1c:	f880 8016 	strb.w	r8, [r0, #22]
c0de4a20:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de4a24:	784b      	ldrb	r3, [r1, #1]
c0de4a26:	788e      	ldrb	r6, [r1, #2]
c0de4a28:	78c9      	ldrb	r1, [r1, #3]
c0de4a2a:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de4a2e:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de4a32:	2608      	movs	r6, #8
c0de4a34:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de4a38:	6088      	str	r0, [r1, #8]
c0de4a3a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4a3e:	08c1      	lsrs	r1, r0, #3
c0de4a40:	2008      	movs	r0, #8
c0de4a42:	47d0      	blx	sl
c0de4a44:	f890 1022 	ldrb.w	r1, [r0, #34]	@ 0x22
c0de4a48:	f880 b019 	strb.w	fp, [r0, #25]
c0de4a4c:	7186      	strb	r6, [r0, #6]
c0de4a4e:	7687      	strb	r7, [r0, #26]
c0de4a50:	71c7      	strb	r7, [r0, #7]
c0de4a52:	f880 8016 	strb.w	r8, [r0, #22]
c0de4a56:	f041 0104 	orr.w	r1, r1, #4
c0de4a5a:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de4a5e:	2101      	movs	r1, #1
c0de4a60:	7141      	strb	r1, [r0, #5]
c0de4a62:	21e0      	movs	r1, #224	@ 0xe0
c0de4a64:	7101      	strb	r1, [r0, #4]
c0de4a66:	6961      	ldr	r1, [r4, #20]
c0de4a68:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de4a6c:	f003 f84b 	bl	c0de7b06 <OUTLINED_FUNCTION_11>
c0de4a70:	60c8      	str	r0, [r1, #12]
c0de4a72:	e1f9      	b.n	c0de4e68 <nbgl_layoutAddUpFooter+0x5ec>
c0de4a74:	f003 fa58 	bl	c0de7f28 <OUTLINED_FUNCTION_67>
c0de4a78:	2800      	cmp	r0, #0
c0de4a7a:	f000 8182 	beq.w	c0de4d82 <nbgl_layoutAddUpFooter+0x506>
c0de4a7e:	6960      	ldr	r0, [r4, #20]
c0de4a80:	2104      	movs	r1, #4
c0de4a82:	2701      	movs	r7, #1
c0de4a84:	2260      	movs	r2, #96	@ 0x60
c0de4a86:	7781      	strb	r1, [r0, #30]
c0de4a88:	2100      	movs	r1, #0
c0de4a8a:	f880 7020 	strb.w	r7, [r0, #32]
c0de4a8e:	7182      	strb	r2, [r0, #6]
c0de4a90:	7707      	strb	r7, [r0, #28]
c0de4a92:	71c1      	strb	r1, [r0, #7]
c0de4a94:	7741      	strb	r1, [r0, #29]
c0de4a96:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4a9a:	f002 ff93 	bl	c0de79c4 <OUTLINED_FUNCTION_0>
c0de4a9e:	77c7      	strb	r7, [r0, #31]
c0de4aa0:	4606      	mov	r6, r0
c0de4aa2:	f003 f8c1 	bl	c0de7c28 <OUTLINED_FUNCTION_23>
c0de4aa6:	4601      	mov	r1, r0
c0de4aa8:	20a0      	movs	r0, #160	@ 0xa0
c0de4aaa:	7177      	strb	r7, [r6, #5]
c0de4aac:	f886 7024 	strb.w	r7, [r6, #36]	@ 0x24
c0de4ab0:	2705      	movs	r7, #5
c0de4ab2:	2301      	movs	r3, #1
c0de4ab4:	7130      	strb	r0, [r6, #4]
c0de4ab6:	200b      	movs	r0, #11
c0de4ab8:	0e0a      	lsrs	r2, r1, #24
c0de4aba:	f886 7020 	strb.w	r7, [r6, #32]
c0de4abe:	f003 f8fd 	bl	c0de7cbc <OUTLINED_FUNCTION_30>
c0de4ac2:	f007 f8c9 	bl	c0debc58 <nbgl_getTextHeightInWidth>
c0de4ac6:	71b0      	strb	r0, [r6, #6]
c0de4ac8:	0a00      	lsrs	r0, r0, #8
c0de4aca:	75b7      	strb	r7, [r6, #22]
c0de4acc:	71f0      	strb	r0, [r6, #7]
c0de4ace:	e056      	b.n	c0de4b7e <nbgl_layoutAddUpFooter+0x302>
c0de4ad0:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4ad4:	2705      	movs	r7, #5
c0de4ad6:	f003 f862 	bl	c0de7b9e <OUTLINED_FUNCTION_17>
c0de4ada:	4606      	mov	r6, r0
c0de4adc:	7b2a      	ldrb	r2, [r5, #12]
c0de4ade:	7c2b      	ldrb	r3, [r5, #16]
c0de4ae0:	f002 ffbe 	bl	c0de7a60 <OUTLINED_FUNCTION_6>
c0de4ae4:	2800      	cmp	r0, #0
c0de4ae6:	f000 814c 	beq.w	c0de4d82 <nbgl_layoutAddUpFooter+0x506>
c0de4aea:	6960      	ldr	r0, [r4, #20]
c0de4aec:	75b7      	strb	r7, [r6, #22]
c0de4aee:	f04f 0801 	mov.w	r8, #1
c0de4af2:	2700      	movs	r7, #0
c0de4af4:	2188      	movs	r1, #136	@ 0x88
c0de4af6:	f880 8020 	strb.w	r8, [r0, #32]
c0de4afa:	71c7      	strb	r7, [r0, #7]
c0de4afc:	7181      	strb	r1, [r0, #6]
c0de4afe:	7b68      	ldrb	r0, [r5, #13]
c0de4b00:	2800      	cmp	r0, #0
c0de4b02:	bf18      	it	ne
c0de4b04:	2003      	movne	r0, #3
c0de4b06:	77f0      	strb	r0, [r6, #31]
c0de4b08:	f04f 0000 	mov.w	r0, #0
c0de4b0c:	bf08      	it	eq
c0de4b0e:	2003      	moveq	r0, #3
c0de4b10:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de4b14:	7b68      	ldrb	r0, [r5, #13]
c0de4b16:	4601      	mov	r1, r0
c0de4b18:	2800      	cmp	r0, #0
c0de4b1a:	bf18      	it	ne
c0de4b1c:	2101      	movne	r1, #1
c0de4b1e:	0049      	lsls	r1, r1, #1
c0de4b20:	2802      	cmp	r0, #2
c0de4b22:	bf08      	it	eq
c0de4b24:	2103      	moveq	r1, #3
c0de4b26:	f886 1020 	strb.w	r1, [r6, #32]
c0de4b2a:	f003 f87d 	bl	c0de7c28 <OUTLINED_FUNCTION_23>
c0de4b2e:	210c      	movs	r1, #12
c0de4b30:	0e02      	lsrs	r2, r0, #24
c0de4b32:	f886 1023 	strb.w	r1, [r6, #35]	@ 0x23
c0de4b36:	4631      	mov	r1, r6
c0de4b38:	f003 f8ae 	bl	c0de7c98 <OUTLINED_FUNCTION_28>
c0de4b3c:	f003 f97c 	bl	c0de7e38 <OUTLINED_FUNCTION_49>
c0de4b40:	4631      	mov	r1, r6
c0de4b42:	0e02      	lsrs	r2, r0, #24
c0de4b44:	74f7      	strb	r7, [r6, #19]
c0de4b46:	71f7      	strb	r7, [r6, #7]
c0de4b48:	f886 8005 	strb.w	r8, [r6, #5]
c0de4b4c:	7777      	strb	r7, [r6, #29]
c0de4b4e:	f886 801c 	strb.w	r8, [r6, #28]
c0de4b52:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de4b56:	70ca      	strb	r2, [r1, #3]
c0de4b58:	0c02      	lsrs	r2, r0, #16
c0de4b5a:	0a00      	lsrs	r0, r0, #8
c0de4b5c:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de4b60:	4630      	mov	r0, r6
c0de4b62:	708a      	strb	r2, [r1, #2]
c0de4b64:	f800 7f12 	strb.w	r7, [r0, #18]!
c0de4b68:	70c7      	strb	r7, [r0, #3]
c0de4b6a:	7087      	strb	r7, [r0, #2]
c0de4b6c:	2058      	movs	r0, #88	@ 0x58
c0de4b6e:	71b0      	strb	r0, [r6, #6]
c0de4b70:	20a0      	movs	r0, #160	@ 0xa0
c0de4b72:	7130      	strb	r0, [r6, #4]
c0de4b74:	2003      	movs	r0, #3
c0de4b76:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de4b7a:	2007      	movs	r0, #7
c0de4b7c:	77b0      	strb	r0, [r6, #30]
c0de4b7e:	6960      	ldr	r0, [r4, #20]
c0de4b80:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de4b84:	7842      	ldrb	r2, [r0, #1]
c0de4b86:	7883      	ldrb	r3, [r0, #2]
c0de4b88:	78c0      	ldrb	r0, [r0, #3]
c0de4b8a:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de4b8e:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de4b92:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de4b96:	6006      	str	r6, [r0, #0]
c0de4b98:	e166      	b.n	c0de4e68 <nbgl_layoutAddUpFooter+0x5ec>
c0de4b9a:	6868      	ldr	r0, [r5, #4]
c0de4b9c:	2800      	cmp	r0, #0
c0de4b9e:	f000 80f0 	beq.w	c0de4d82 <nbgl_layoutAddUpFooter+0x506>
c0de4ba2:	68a8      	ldr	r0, [r5, #8]
c0de4ba4:	2800      	cmp	r0, #0
c0de4ba6:	f000 80ec 	beq.w	c0de4d82 <nbgl_layoutAddUpFooter+0x506>
c0de4baa:	f04f 0b00 	mov.w	fp, #0
c0de4bae:	2088      	movs	r0, #136	@ 0x88
c0de4bb0:	2702      	movs	r7, #2
c0de4bb2:	f881 b007 	strb.w	fp, [r1, #7]
c0de4bb6:	7188      	strb	r0, [r1, #6]
c0de4bb8:	f881 7020 	strb.w	r7, [r1, #32]
c0de4bbc:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4bc0:	f002 ffed 	bl	c0de7b9e <OUTLINED_FUNCTION_17>
c0de4bc4:	4606      	mov	r6, r0
c0de4bc6:	7b2a      	ldrb	r2, [r5, #12]
c0de4bc8:	7bab      	ldrb	r3, [r5, #14]
c0de4bca:	f002 ff49 	bl	c0de7a60 <OUTLINED_FUNCTION_6>
c0de4bce:	2800      	cmp	r0, #0
c0de4bd0:	f000 80d7 	beq.w	c0de4d82 <nbgl_layoutAddUpFooter+0x506>
c0de4bd4:	2120      	movs	r1, #32
c0de4bd6:	f04f 0a03 	mov.w	sl, #3
c0de4bda:	f04f 0858 	mov.w	r8, #88	@ 0x58
c0de4bde:	f886 7020 	strb.w	r7, [r6, #32]
c0de4be2:	f886 b018 	strb.w	fp, [r6, #24]
c0de4be6:	f886 b021 	strb.w	fp, [r6, #33]	@ 0x21
c0de4bea:	f886 b007 	strb.w	fp, [r6, #7]
c0de4bee:	f886 b005 	strb.w	fp, [r6, #5]
c0de4bf2:	75f1      	strb	r1, [r6, #23]
c0de4bf4:	2104      	movs	r1, #4
c0de4bf6:	f886 a01f 	strb.w	sl, [r6, #31]
c0de4bfa:	f886 a022 	strb.w	sl, [r6, #34]	@ 0x22
c0de4bfe:	75b1      	strb	r1, [r6, #22]
c0de4c00:	2101      	movs	r1, #1
c0de4c02:	7141      	strb	r1, [r0, #5]
c0de4c04:	f886 8006 	strb.w	r8, [r6, #6]
c0de4c08:	f886 8004 	strb.w	r8, [r6, #4]
c0de4c0c:	f003 f80c 	bl	c0de7c28 <OUTLINED_FUNCTION_23>
c0de4c10:	4631      	mov	r1, r6
c0de4c12:	0e02      	lsrs	r2, r0, #24
c0de4c14:	f886 b01d 	strb.w	fp, [r6, #29]
c0de4c18:	f04f 0b01 	mov.w	fp, #1
c0de4c1c:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de4c20:	f886 b01c 	strb.w	fp, [r6, #28]
c0de4c24:	70ca      	strb	r2, [r1, #3]
c0de4c26:	0c02      	lsrs	r2, r0, #16
c0de4c28:	0a00      	lsrs	r0, r0, #8
c0de4c2a:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de4c2e:	200c      	movs	r0, #12
c0de4c30:	708a      	strb	r2, [r1, #2]
c0de4c32:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de4c36:	200a      	movs	r0, #10
c0de4c38:	f003 f883 	bl	c0de7d42 <OUTLINED_FUNCTION_36>
c0de4c3c:	6006      	str	r6, [r0, #0]
c0de4c3e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4c42:	f002 ffac 	bl	c0de7b9e <OUTLINED_FUNCTION_17>
c0de4c46:	4606      	mov	r6, r0
c0de4c48:	7b6a      	ldrb	r2, [r5, #13]
c0de4c4a:	7bab      	ldrb	r3, [r5, #14]
c0de4c4c:	f002 ff08 	bl	c0de7a60 <OUTLINED_FUNCTION_6>
c0de4c50:	2800      	cmp	r0, #0
c0de4c52:	f000 8096 	beq.w	c0de4d82 <nbgl_layoutAddUpFooter+0x506>
c0de4c56:	2700      	movs	r7, #0
c0de4c58:	2120      	movs	r1, #32
c0de4c5a:	f886 a021 	strb.w	sl, [r6, #33]	@ 0x21
c0de4c5e:	f886 a022 	strb.w	sl, [r6, #34]	@ 0x22
c0de4c62:	f886 b005 	strb.w	fp, [r6, #5]
c0de4c66:	75f1      	strb	r1, [r6, #23]
c0de4c68:	7147      	strb	r7, [r0, #5]
c0de4c6a:	2106      	movs	r1, #6
c0de4c6c:	2038      	movs	r0, #56	@ 0x38
c0de4c6e:	f886 7020 	strb.w	r7, [r6, #32]
c0de4c72:	77f7      	strb	r7, [r6, #31]
c0de4c74:	7637      	strb	r7, [r6, #24]
c0de4c76:	71f7      	strb	r7, [r6, #7]
c0de4c78:	f886 8006 	strb.w	r8, [r6, #6]
c0de4c7c:	75b1      	strb	r1, [r6, #22]
c0de4c7e:	7130      	strb	r0, [r6, #4]
c0de4c80:	f003 f8da 	bl	c0de7e38 <OUTLINED_FUNCTION_49>
c0de4c84:	4631      	mov	r1, r6
c0de4c86:	0e02      	lsrs	r2, r0, #24
c0de4c88:	f886 b01c 	strb.w	fp, [r6, #28]
c0de4c8c:	7777      	strb	r7, [r6, #29]
c0de4c8e:	f801 0f25 	strb.w	r0, [r1, #37]!
c0de4c92:	70ca      	strb	r2, [r1, #3]
c0de4c94:	0c02      	lsrs	r2, r0, #16
c0de4c96:	0a00      	lsrs	r0, r0, #8
c0de4c98:	f886 0026 	strb.w	r0, [r6, #38]	@ 0x26
c0de4c9c:	200c      	movs	r0, #12
c0de4c9e:	708a      	strb	r2, [r1, #2]
c0de4ca0:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de4ca4:	2009      	movs	r0, #9
c0de4ca6:	f003 f84c 	bl	c0de7d42 <OUTLINED_FUNCTION_36>
c0de4caa:	6046      	str	r6, [r0, #4]
c0de4cac:	e0dc      	b.n	c0de4e68 <nbgl_layoutAddUpFooter+0x5ec>
c0de4cae:	bf00      	nop
c0de4cb0:	000072f3 	.word	0x000072f3
c0de4cb4:	00008769 	.word	0x00008769
c0de4cb8:	6868      	ldr	r0, [r5, #4]
c0de4cba:	2800      	cmp	r0, #0
c0de4cbc:	d061      	beq.n	c0de4d82 <nbgl_layoutAddUpFooter+0x506>
c0de4cbe:	7b2a      	ldrb	r2, [r5, #12]
c0de4cc0:	7b6b      	ldrb	r3, [r5, #13]
c0de4cc2:	4620      	mov	r0, r4
c0de4cc4:	f7ff fb5c 	bl	c0de4380 <layoutAddCallbackObj>
c0de4cc8:	2800      	cmp	r0, #0
c0de4cca:	d05a      	beq.n	c0de4d82 <nbgl_layoutAddUpFooter+0x506>
c0de4ccc:	6960      	ldr	r0, [r4, #20]
c0de4cce:	f04f 0803 	mov.w	r8, #3
c0de4cd2:	2113      	movs	r1, #19
c0de4cd4:	f04f 0a00 	mov.w	sl, #0
c0de4cd8:	2701      	movs	r7, #1
c0de4cda:	f04f 0b04 	mov.w	fp, #4
c0de4cde:	f880 8020 	strb.w	r8, [r0, #32]
c0de4ce2:	7781      	strb	r1, [r0, #30]
c0de4ce4:	f880 a01d 	strb.w	sl, [r0, #29]
c0de4ce8:	7707      	strb	r7, [r0, #28]
c0de4cea:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4cee:	f002 fe69 	bl	c0de79c4 <OUTLINED_FUNCTION_0>
c0de4cf2:	f880 a01f 	strb.w	sl, [r0, #31]
c0de4cf6:	4606      	mov	r6, r0
c0de4cf8:	f002 ff96 	bl	c0de7c28 <OUTLINED_FUNCTION_23>
c0de4cfc:	22a0      	movs	r2, #160	@ 0xa0
c0de4cfe:	4601      	mov	r1, r0
c0de4d00:	200b      	movs	r0, #11
c0de4d02:	f886 7024 	strb.w	r7, [r6, #36]	@ 0x24
c0de4d06:	f886 b020 	strb.w	fp, [r6, #32]
c0de4d0a:	7177      	strb	r7, [r6, #5]
c0de4d0c:	7132      	strb	r2, [r6, #4]
c0de4d0e:	4632      	mov	r2, r6
c0de4d10:	0e0b      	lsrs	r3, r1, #24
c0de4d12:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de4d16:	f802 1f26 	strb.w	r1, [r2, #38]!
c0de4d1a:	70d3      	strb	r3, [r2, #3]
c0de4d1c:	0c0b      	lsrs	r3, r1, #16
c0de4d1e:	7093      	strb	r3, [r2, #2]
c0de4d20:	0a0a      	lsrs	r2, r1, #8
c0de4d22:	f886 2027 	strb.w	r2, [r6, #39]	@ 0x27
c0de4d26:	68aa      	ldr	r2, [r5, #8]
c0de4d28:	b37a      	cbz	r2, c0de4d8a <nbgl_layoutAddUpFooter+0x50e>
c0de4d2a:	4610      	mov	r0, r2
c0de4d2c:	f007 f95c 	bl	c0debfe8 <pic>
c0de4d30:	4633      	mov	r3, r6
c0de4d32:	4601      	mov	r1, r0
c0de4d34:	f813 cf26 	ldrb.w	ip, [r3, #38]!
c0de4d38:	f813 ed22 	ldrb.w	lr, [r3, #-34]!
c0de4d3c:	785a      	ldrb	r2, [r3, #1]
c0de4d3e:	7f98      	ldrb	r0, [r3, #30]
c0de4d40:	f893 7020 	ldrb.w	r7, [r3, #32]
c0de4d44:	f893 8023 	ldrb.w	r8, [r3, #35]	@ 0x23
c0de4d48:	ea4e 2e02 	orr.w	lr, lr, r2, lsl #8
c0de4d4c:	780a      	ldrb	r2, [r1, #0]
c0de4d4e:	7849      	ldrb	r1, [r1, #1]
c0de4d50:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de4d54:	ebae 0101 	sub.w	r1, lr, r1
c0de4d58:	f1a1 0220 	sub.w	r2, r1, #32
c0de4d5c:	0a11      	lsrs	r1, r2, #8
c0de4d5e:	701a      	strb	r2, [r3, #0]
c0de4d60:	7059      	strb	r1, [r3, #1]
c0de4d62:	f893 1025 	ldrb.w	r1, [r3, #37]	@ 0x25
c0de4d66:	f893 3024 	ldrb.w	r3, [r3, #36]	@ 0x24
c0de4d6a:	2f00      	cmp	r7, #0
c0de4d6c:	bf18      	it	ne
c0de4d6e:	2701      	movne	r7, #1
c0de4d70:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de4d74:	ea4c 2308 	orr.w	r3, ip, r8, lsl #8
c0de4d78:	f04f 0803 	mov.w	r8, #3
c0de4d7c:	ea43 4101 	orr.w	r1, r3, r1, lsl #16
c0de4d80:	e005      	b.n	c0de4d8e <nbgl_layoutAddUpFooter+0x512>
c0de4d82:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de4d86:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de4d8a:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de4d8e:	b292      	uxth	r2, r2
c0de4d90:	463b      	mov	r3, r7
c0de4d92:	f006 ff61 	bl	c0debc58 <nbgl_getTextHeightInWidth>
c0de4d96:	6961      	ldr	r1, [r4, #20]
c0de4d98:	f886 a018 	strb.w	sl, [r6, #24]
c0de4d9c:	f886 b016 	strb.w	fp, [r6, #22]
c0de4da0:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de4da4:	784b      	ldrb	r3, [r1, #1]
c0de4da6:	788f      	ldrb	r7, [r1, #2]
c0de4da8:	78c9      	ldrb	r1, [r1, #3]
c0de4daa:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de4dae:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de4db2:	2720      	movs	r7, #32
c0de4db4:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de4db8:	600e      	str	r6, [r1, #0]
c0de4dba:	75f7      	strb	r7, [r6, #23]
c0de4dbc:	71b0      	strb	r0, [r6, #6]
c0de4dbe:	0a01      	lsrs	r1, r0, #8
c0de4dc0:	6962      	ldr	r2, [r4, #20]
c0de4dc2:	71f1      	strb	r1, [r6, #7]
c0de4dc4:	71d1      	strb	r1, [r2, #7]
c0de4dc6:	7190      	strb	r0, [r2, #6]
c0de4dc8:	f002 ff41 	bl	c0de7c4e <OUTLINED_FUNCTION_25>
c0de4dcc:	2102      	movs	r1, #2
c0de4dce:	f880 8022 	strb.w	r8, [r0, #34]	@ 0x22
c0de4dd2:	7581      	strb	r1, [r0, #22]
c0de4dd4:	6961      	ldr	r1, [r4, #20]
c0de4dd6:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de4dda:	f002 fe94 	bl	c0de7b06 <OUTLINED_FUNCTION_11>
c0de4dde:	6048      	str	r0, [r1, #4]
c0de4de0:	68a8      	ldr	r0, [r5, #8]
c0de4de2:	b3c0      	cbz	r0, c0de4e56 <nbgl_layoutAddUpFooter+0x5da>
c0de4de4:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4de8:	f002 ff08 	bl	c0de7bfc <OUTLINED_FUNCTION_21>
c0de4dec:	4606      	mov	r6, r0
c0de4dee:	2000      	movs	r0, #0
c0de4df0:	7630      	strb	r0, [r6, #24]
c0de4df2:	77f0      	strb	r0, [r6, #31]
c0de4df4:	2006      	movs	r0, #6
c0de4df6:	75f7      	strb	r7, [r6, #23]
c0de4df8:	75b0      	strb	r0, [r6, #22]
c0de4dfa:	f003 f81d 	bl	c0de7e38 <OUTLINED_FUNCTION_49>
c0de4dfe:	4631      	mov	r1, r6
c0de4e00:	0e02      	lsrs	r2, r0, #24
c0de4e02:	f003 f84b 	bl	c0de7e9c <OUTLINED_FUNCTION_56>
c0de4e06:	6960      	ldr	r0, [r4, #20]
c0de4e08:	f810 2f22 	ldrb.w	r2, [r0, #34]!
c0de4e0c:	7843      	ldrb	r3, [r0, #1]
c0de4e0e:	7887      	ldrb	r7, [r0, #2]
c0de4e10:	78c0      	ldrb	r0, [r0, #3]
c0de4e12:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de4e16:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de4e1a:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de4e1e:	6086      	str	r6, [r0, #8]
c0de4e20:	f896 0022 	ldrb.w	r0, [r6, #34]	@ 0x22
c0de4e24:	780a      	ldrb	r2, [r1, #0]
c0de4e26:	788b      	ldrb	r3, [r1, #2]
c0de4e28:	78c9      	ldrb	r1, [r1, #3]
c0de4e2a:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de4e2e:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de4e32:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de4e36:	7881      	ldrb	r1, [r0, #2]
c0de4e38:	78c0      	ldrb	r0, [r0, #3]
c0de4e3a:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
c0de4e3e:	6960      	ldr	r0, [r4, #20]
c0de4e40:	7982      	ldrb	r2, [r0, #6]
c0de4e42:	79c3      	ldrb	r3, [r0, #7]
c0de4e44:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de4e48:	428a      	cmp	r2, r1
c0de4e4a:	bf2f      	iteee	cs
c0de4e4c:	4611      	movcs	r1, r2
c0de4e4e:	7181      	strbcc	r1, [r0, #6]
c0de4e50:	0a0a      	lsrcc	r2, r1, #8
c0de4e52:	71c2      	strbcc	r2, [r0, #7]
c0de4e54:	e004      	b.n	c0de4e60 <nbgl_layoutAddUpFooter+0x5e4>
c0de4e56:	6960      	ldr	r0, [r4, #20]
c0de4e58:	7981      	ldrb	r1, [r0, #6]
c0de4e5a:	79c2      	ldrb	r2, [r0, #7]
c0de4e5c:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de4e60:	3130      	adds	r1, #48	@ 0x30
c0de4e62:	7181      	strb	r1, [r0, #6]
c0de4e64:	0a09      	lsrs	r1, r1, #8
c0de4e66:	71c1      	strb	r1, [r0, #7]
c0de4e68:	f8d4 20a0 	ldr.w	r2, [r4, #160]	@ 0xa0
c0de4e6c:	6961      	ldr	r1, [r4, #20]
c0de4e6e:	68a0      	ldr	r0, [r4, #8]
c0de4e70:	f812 3f06 	ldrb.w	r3, [r2, #6]!
c0de4e74:	79cf      	ldrb	r7, [r1, #7]
c0de4e76:	7856      	ldrb	r6, [r2, #1]
c0de4e78:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de4e7c:	798e      	ldrb	r6, [r1, #6]
c0de4e7e:	ea46 2607 	orr.w	r6, r6, r7, lsl #8
c0de4e82:	1b9b      	subs	r3, r3, r6
c0de4e84:	7013      	strb	r3, [r2, #0]
c0de4e86:	6101      	str	r1, [r0, #16]
c0de4e88:	0a1b      	lsrs	r3, r3, #8
c0de4e8a:	6960      	ldr	r0, [r4, #20]
c0de4e8c:	7053      	strb	r3, [r2, #1]
c0de4e8e:	782a      	ldrb	r2, [r5, #0]
c0de4e90:	7981      	ldrb	r1, [r0, #6]
c0de4e92:	79c0      	ldrb	r0, [r0, #7]
c0de4e94:	f884 20ac 	strb.w	r2, [r4, #172]	@ 0xac
c0de4e98:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de4e9c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de4ea0 <nbgl_layoutAddSwipe>:
c0de4ea0:	b3d8      	cbz	r0, c0de4f1a <nbgl_layoutAddSwipe+0x7a>
c0de4ea2:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de4ea6:	f8dd 8020 	ldr.w	r8, [sp, #32]
c0de4eaa:	461c      	mov	r4, r3
c0de4eac:	4617      	mov	r7, r2
c0de4eae:	460d      	mov	r5, r1
c0de4eb0:	4606      	mov	r6, r0
c0de4eb2:	b342      	cbz	r2, c0de4f06 <nbgl_layoutAddSwipe+0x66>
c0de4eb4:	2004      	movs	r0, #4
c0de4eb6:	2100      	movs	r1, #0
c0de4eb8:	f04f 0a00 	mov.w	sl, #0
c0de4ebc:	f006 feb3 	bl	c0debc26 <nbgl_objPoolGet>
c0de4ec0:	61b0      	str	r0, [r6, #24]
c0de4ec2:	4638      	mov	r0, r7
c0de4ec4:	f007 f890 	bl	c0debfe8 <pic>
c0de4ec8:	69b1      	ldr	r1, [r6, #24]
c0de4eca:	f002 ff7c 	bl	c0de7dc6 <OUTLINED_FUNCTION_41>
c0de4ece:	7048      	strb	r0, [r1, #1]
c0de4ed0:	2001      	movs	r0, #1
c0de4ed2:	22a0      	movs	r2, #160	@ 0xa0
c0de4ed4:	f801 2c22 	strb.w	r2, [r1, #-34]
c0de4ed8:	220b      	movs	r2, #11
c0de4eda:	f801 0c21 	strb.w	r0, [r1, #-33]
c0de4ede:	f801 0c07 	strb.w	r0, [r1, #-7]
c0de4ee2:	200b      	movs	r0, #11
c0de4ee4:	f801 2c04 	strb.w	r2, [r1, #-4]
c0de4ee8:	f006 feb1 	bl	c0debc4e <nbgl_getFontLineHeight>
c0de4eec:	69b1      	ldr	r1, [r6, #24]
c0de4eee:	7188      	strb	r0, [r1, #6]
c0de4ef0:	201e      	movs	r0, #30
c0de4ef2:	f881 a007 	strb.w	sl, [r1, #7]
c0de4ef6:	f881 a01a 	strb.w	sl, [r1, #26]
c0de4efa:	7648      	strb	r0, [r1, #25]
c0de4efc:	2005      	movs	r0, #5
c0de4efe:	f881 0020 	strb.w	r0, [r1, #32]
c0de4f02:	2008      	movs	r0, #8
c0de4f04:	7588      	strb	r0, [r1, #22]
c0de4f06:	4630      	mov	r0, r6
c0de4f08:	4629      	mov	r1, r5
c0de4f0a:	2201      	movs	r2, #1
c0de4f0c:	4623      	mov	r3, r4
c0de4f0e:	f8cd 8000 	str.w	r8, [sp]
c0de4f12:	f000 f804 	bl	c0de4f1e <addSwipeInternal>
c0de4f16:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0de4f1a:	f002 bf0f 	b.w	c0de7d3c <OUTLINED_FUNCTION_35>

c0de4f1e <addSwipeInternal>:
c0de4f1e:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de4f20:	f411 6ff0 	tst.w	r1, #1920	@ 0x780
c0de4f24:	d013      	beq.n	c0de4f4e <addSwipeInternal+0x30>
c0de4f26:	9f06      	ldr	r7, [sp, #24]
c0de4f28:	460c      	mov	r4, r1
c0de4f2a:	f8d0 10a0 	ldr.w	r1, [r0, #160]	@ 0xa0
c0de4f2e:	4615      	mov	r5, r2
c0de4f30:	461a      	mov	r2, r3
c0de4f32:	4606      	mov	r6, r0
c0de4f34:	463b      	mov	r3, r7
c0de4f36:	f7ff fa23 	bl	c0de4380 <layoutAddCallbackObj>
c0de4f3a:	b140      	cbz	r0, c0de4f4e <addSwipeInternal+0x30>
c0de4f3c:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de4f40:	0a21      	lsrs	r1, r4, #8
c0de4f42:	f886 50b0 	strb.w	r5, [r6, #176]	@ 0xb0
c0de4f46:	7741      	strb	r1, [r0, #29]
c0de4f48:	7704      	strb	r4, [r0, #28]
c0de4f4a:	2000      	movs	r0, #0
c0de4f4c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de4f4e:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de4f52:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0de4f54 <nbgl_layoutAddTopRightButton>:
c0de4f54:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de4f58:	b398      	cbz	r0, c0de4fc2 <nbgl_layoutAddTopRightButton+0x6e>
c0de4f5a:	f003 f823 	bl	c0de7fa4 <OUTLINED_FUNCTION_79>
c0de4f5e:	4688      	mov	r8, r1
c0de4f60:	461f      	mov	r7, r3
c0de4f62:	4615      	mov	r5, r2
c0de4f64:	f04f 0a05 	mov.w	sl, #5
c0de4f68:	f002 fe19 	bl	c0de7b9e <OUTLINED_FUNCTION_17>
c0de4f6c:	4606      	mov	r6, r0
c0de4f6e:	4620      	mov	r0, r4
c0de4f70:	462a      	mov	r2, r5
c0de4f72:	463b      	mov	r3, r7
c0de4f74:	f002 fe3f 	bl	c0de7bf6 <OUTLINED_FUNCTION_20>
c0de4f78:	b318      	cbz	r0, c0de4fc2 <nbgl_layoutAddTopRightButton+0x6e>
c0de4f7a:	2058      	movs	r0, #88	@ 0x58
c0de4f7c:	2700      	movs	r7, #0
c0de4f7e:	2503      	movs	r5, #3
c0de4f80:	f886 a01e 	strb.w	sl, [r6, #30]
c0de4f84:	71b0      	strb	r0, [r6, #6]
c0de4f86:	7130      	strb	r0, [r6, #4]
c0de4f88:	2020      	movs	r0, #32
c0de4f8a:	71f7      	strb	r7, [r6, #7]
c0de4f8c:	7177      	strb	r7, [r6, #5]
c0de4f8e:	76b7      	strb	r7, [r6, #26]
c0de4f90:	7637      	strb	r7, [r6, #24]
c0de4f92:	7777      	strb	r7, [r6, #29]
c0de4f94:	f886 5022 	strb.w	r5, [r6, #34]	@ 0x22
c0de4f98:	f886 7021 	strb.w	r7, [r6, #33]	@ 0x21
c0de4f9c:	77f5      	strb	r5, [r6, #31]
c0de4f9e:	7670      	strb	r0, [r6, #25]
c0de4fa0:	75f0      	strb	r0, [r6, #23]
c0de4fa2:	2001      	movs	r0, #1
c0de4fa4:	7730      	strb	r0, [r6, #28]
c0de4fa6:	2002      	movs	r0, #2
c0de4fa8:	f886 0020 	strb.w	r0, [r6, #32]
c0de4fac:	4640      	mov	r0, r8
c0de4fae:	f007 f81b 	bl	c0debfe8 <pic>
c0de4fb2:	4631      	mov	r1, r6
c0de4fb4:	0e02      	lsrs	r2, r0, #24
c0de4fb6:	75b5      	strb	r5, [r6, #22]
c0de4fb8:	f002 fe8f 	bl	c0de7cda <OUTLINED_FUNCTION_31>
c0de4fbc:	68a0      	ldr	r0, [r4, #8]
c0de4fbe:	6086      	str	r6, [r0, #8]
c0de4fc0:	e001      	b.n	c0de4fc6 <nbgl_layoutAddTopRightButton+0x72>
c0de4fc2:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de4fc6:	4638      	mov	r0, r7
c0de4fc8:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}

c0de4fcc <nbgl_layoutAddExtendedFooter>:
c0de4fcc:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de4fd0:	2800      	cmp	r0, #0
c0de4fd2:	f000 834b 	beq.w	c0de566c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de4fd6:	460d      	mov	r5, r1
c0de4fd8:	b119      	cbz	r1, c0de4fe2 <nbgl_layoutAddExtendedFooter+0x16>
c0de4fda:	4604      	mov	r4, r0
c0de4fdc:	7828      	ldrb	r0, [r5, #0]
c0de4fde:	2806      	cmp	r0, #6
c0de4fe0:	d902      	bls.n	c0de4fe8 <nbgl_layoutAddExtendedFooter+0x1c>
c0de4fe2:	f06f 0701 	mvn.w	r7, #1
c0de4fe6:	e343      	b.n	c0de5670 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de4fe8:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4fec:	2601      	movs	r6, #1
c0de4fee:	f002 fdd2 	bl	c0de7b96 <OUTLINED_FUNCTION_16>
c0de4ff2:	2100      	movs	r1, #0
c0de4ff4:	7146      	strb	r6, [r0, #5]
c0de4ff6:	77c1      	strb	r1, [r0, #31]
c0de4ff8:	21a0      	movs	r1, #160	@ 0xa0
c0de4ffa:	7101      	strb	r1, [r0, #4]
c0de4ffc:	6120      	str	r0, [r4, #16]
c0de4ffe:	f002 ff7d 	bl	c0de7efc <OUTLINED_FUNCTION_64>
c0de5002:	4601      	mov	r1, r0
c0de5004:	0a02      	lsrs	r2, r0, #8
c0de5006:	6920      	ldr	r0, [r4, #16]
c0de5008:	0e0b      	lsrs	r3, r1, #24
c0de500a:	f880 2023 	strb.w	r2, [r0, #35]	@ 0x23
c0de500e:	2208      	movs	r2, #8
c0de5010:	7582      	strb	r2, [r0, #22]
c0de5012:	4602      	mov	r2, r0
c0de5014:	f802 1f22 	strb.w	r1, [r2, #34]!
c0de5018:	0c09      	lsrs	r1, r1, #16
c0de501a:	7091      	strb	r1, [r2, #2]
c0de501c:	70d3      	strb	r3, [r2, #3]
c0de501e:	7829      	ldrb	r1, [r5, #0]
c0de5020:	2906      	cmp	r1, #6
c0de5022:	d017      	beq.n	c0de5054 <nbgl_layoutAddExtendedFooter+0x88>
c0de5024:	2901      	cmp	r1, #1
c0de5026:	f000 80be 	beq.w	c0de51a6 <nbgl_layoutAddExtendedFooter+0x1da>
c0de502a:	2902      	cmp	r1, #2
c0de502c:	f000 80f7 	beq.w	c0de521e <nbgl_layoutAddExtendedFooter+0x252>
c0de5030:	2903      	cmp	r1, #3
c0de5032:	f000 8184 	beq.w	c0de533e <nbgl_layoutAddExtendedFooter+0x372>
c0de5036:	2904      	cmp	r1, #4
c0de5038:	f000 8249 	beq.w	c0de54ce <nbgl_layoutAddExtendedFooter+0x502>
c0de503c:	2905      	cmp	r1, #5
c0de503e:	f000 8269 	beq.w	c0de5514 <nbgl_layoutAddExtendedFooter+0x548>
c0de5042:	2900      	cmp	r1, #0
c0de5044:	d1cd      	bne.n	c0de4fe2 <nbgl_layoutAddExtendedFooter+0x16>
c0de5046:	88a9      	ldrh	r1, [r5, #4]
c0de5048:	f04f 0800 	mov.w	r8, #0
c0de504c:	7181      	strb	r1, [r0, #6]
c0de504e:	0a09      	lsrs	r1, r1, #8
c0de5050:	71c1      	strb	r1, [r0, #7]
c0de5052:	e2db      	b.n	c0de560c <nbgl_layoutAddExtendedFooter+0x640>
c0de5054:	68a8      	ldr	r0, [r5, #8]
c0de5056:	2800      	cmp	r0, #0
c0de5058:	f000 8308 	beq.w	c0de566c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de505c:	6868      	ldr	r0, [r5, #4]
c0de505e:	2800      	cmp	r0, #0
c0de5060:	f000 8304 	beq.w	c0de566c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de5064:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5068:	f002 fd99 	bl	c0de7b9e <OUTLINED_FUNCTION_17>
c0de506c:	4606      	mov	r6, r0
c0de506e:	7c2a      	ldrb	r2, [r5, #16]
c0de5070:	7cab      	ldrb	r3, [r5, #18]
c0de5072:	f002 fcf5 	bl	c0de7a60 <OUTLINED_FUNCTION_6>
c0de5076:	2800      	cmp	r0, #0
c0de5078:	f000 82f8 	beq.w	c0de566c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de507c:	2103      	movs	r1, #3
c0de507e:	2208      	movs	r2, #8
c0de5080:	f04f 0801 	mov.w	r8, #1
c0de5084:	f04f 0a00 	mov.w	sl, #0
c0de5088:	75b2      	strb	r2, [r6, #22]
c0de508a:	77f1      	strb	r1, [r6, #31]
c0de508c:	f880 8005 	strb.w	r8, [r0, #5]
c0de5090:	2258      	movs	r2, #88	@ 0x58
c0de5092:	7c68      	ldrb	r0, [r5, #17]
c0de5094:	71b2      	strb	r2, [r6, #6]
c0de5096:	22a0      	movs	r2, #160	@ 0xa0
c0de5098:	f886 a021 	strb.w	sl, [r6, #33]	@ 0x21
c0de509c:	f886 a01a 	strb.w	sl, [r6, #26]
c0de50a0:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de50a4:	f886 a007 	strb.w	sl, [r6, #7]
c0de50a8:	f886 8005 	strb.w	r8, [r6, #5]
c0de50ac:	7132      	strb	r2, [r6, #4]
c0de50ae:	2803      	cmp	r0, #3
c0de50b0:	f04f 0004 	mov.w	r0, #4
c0de50b4:	bf08      	it	eq
c0de50b6:	2102      	moveq	r1, #2
c0de50b8:	f886 1020 	strb.w	r1, [r6, #32]
c0de50bc:	bf08      	it	eq
c0de50be:	2018      	moveq	r0, #24
c0de50c0:	7670      	strb	r0, [r6, #25]
c0de50c2:	f002 feb9 	bl	c0de7e38 <OUTLINED_FUNCTION_49>
c0de50c6:	f002 fefb 	bl	c0de7ec0 <OUTLINED_FUNCTION_58>
c0de50ca:	f002 fde5 	bl	c0de7c98 <OUTLINED_FUNCTION_28>
c0de50ce:	f002 fd6a 	bl	c0de7ba6 <OUTLINED_FUNCTION_18>
c0de50d2:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de50d6:	200a      	movs	r0, #10
c0de50d8:	77b0      	strb	r0, [r6, #30]
c0de50da:	6920      	ldr	r0, [r4, #16]
c0de50dc:	f002 fc76 	bl	c0de79cc <OUTLINED_FUNCTION_1>
c0de50e0:	7c68      	ldrb	r0, [r5, #17]
c0de50e2:	b1c0      	cbz	r0, c0de5116 <nbgl_layoutAddExtendedFooter+0x14a>
c0de50e4:	2803      	cmp	r0, #3
c0de50e6:	d016      	beq.n	c0de5116 <nbgl_layoutAddExtendedFooter+0x14a>
c0de50e8:	f002 fdb1 	bl	c0de7c4e <OUTLINED_FUNCTION_25>
c0de50ec:	0a31      	lsrs	r1, r6, #8
c0de50ee:	0e32      	lsrs	r2, r6, #24
c0de50f0:	74c1      	strb	r1, [r0, #19]
c0de50f2:	4601      	mov	r1, r0
c0de50f4:	f801 6f12 	strb.w	r6, [r1, #18]!
c0de50f8:	70ca      	strb	r2, [r1, #3]
c0de50fa:	0c32      	lsrs	r2, r6, #16
c0de50fc:	708a      	strb	r2, [r1, #2]
c0de50fe:	6921      	ldr	r1, [r4, #16]
c0de5100:	f002 fc91 	bl	c0de7a26 <OUTLINED_FUNCTION_4>
c0de5104:	2100      	movs	r1, #0
c0de5106:	7681      	strb	r1, [r0, #26]
c0de5108:	2104      	movs	r1, #4
c0de510a:	7641      	strb	r1, [r0, #25]
c0de510c:	2102      	movs	r1, #2
c0de510e:	7581      	strb	r1, [r0, #22]
c0de5110:	6920      	ldr	r0, [r4, #16]
c0de5112:	f002 fc5b 	bl	c0de79cc <OUTLINED_FUNCTION_1>
c0de5116:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de511a:	f002 fd40 	bl	c0de7b9e <OUTLINED_FUNCTION_17>
c0de511e:	4606      	mov	r6, r0
c0de5120:	7c2a      	ldrb	r2, [r5, #16]
c0de5122:	7cab      	ldrb	r3, [r5, #18]
c0de5124:	f002 fc9c 	bl	c0de7a60 <OUTLINED_FUNCTION_6>
c0de5128:	2800      	cmp	r0, #0
c0de512a:	f000 829f 	beq.w	c0de566c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de512e:	2118      	movs	r1, #24
c0de5130:	f04f 0a00 	mov.w	sl, #0
c0de5134:	f04f 0801 	mov.w	r8, #1
c0de5138:	7671      	strb	r1, [r6, #25]
c0de513a:	2102      	movs	r1, #2
c0de513c:	f886 a01a 	strb.w	sl, [r6, #26]
c0de5140:	f880 a005 	strb.w	sl, [r0, #5]
c0de5144:	75b1      	strb	r1, [r6, #22]
c0de5146:	2103      	movs	r1, #3
c0de5148:	7c68      	ldrb	r0, [r5, #17]
c0de514a:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de514e:	2158      	movs	r1, #88	@ 0x58
c0de5150:	f886 8005 	strb.w	r8, [r6, #5]
c0de5154:	f886 a007 	strb.w	sl, [r6, #7]
c0de5158:	71b1      	strb	r1, [r6, #6]
c0de515a:	21a0      	movs	r1, #160	@ 0xa0
c0de515c:	7131      	strb	r1, [r6, #4]
c0de515e:	2100      	movs	r1, #0
c0de5160:	2802      	cmp	r0, #2
c0de5162:	bf08      	it	eq
c0de5164:	2103      	moveq	r1, #3
c0de5166:	77f1      	strb	r1, [r6, #31]
c0de5168:	1e81      	subs	r1, r0, #2
c0de516a:	bf18      	it	ne
c0de516c:	2103      	movne	r1, #3
c0de516e:	3802      	subs	r0, #2
c0de5170:	f886 1021 	strb.w	r1, [r6, #33]	@ 0x21
c0de5174:	fab0 f080 	clz	r0, r0
c0de5178:	0940      	lsrs	r0, r0, #5
c0de517a:	0040      	lsls	r0, r0, #1
c0de517c:	f886 0020 	strb.w	r0, [r6, #32]
c0de5180:	f002 fd52 	bl	c0de7c28 <OUTLINED_FUNCTION_23>
c0de5184:	4631      	mov	r1, r6
c0de5186:	0e02      	lsrs	r2, r0, #24
c0de5188:	f801 0f25 	strb.w	r0, [r1, #37]!
c0de518c:	70ca      	strb	r2, [r1, #3]
c0de518e:	0c02      	lsrs	r2, r0, #16
c0de5190:	0a00      	lsrs	r0, r0, #8
c0de5192:	708a      	strb	r2, [r1, #2]
c0de5194:	7048      	strb	r0, [r1, #1]
c0de5196:	7c68      	ldrb	r0, [r5, #17]
c0de5198:	2800      	cmp	r0, #0
c0de519a:	f000 8288 	beq.w	c0de56ae <nbgl_layoutAddExtendedFooter+0x6e2>
c0de519e:	68e8      	ldr	r0, [r5, #12]
c0de51a0:	f006 ff22 	bl	c0debfe8 <pic>
c0de51a4:	e284      	b.n	c0de56b0 <nbgl_layoutAddExtendedFooter+0x6e4>
c0de51a6:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de51aa:	f002 fc0b 	bl	c0de79c4 <OUTLINED_FUNCTION_0>
c0de51ae:	4606      	mov	r6, r0
c0de51b0:	7a6a      	ldrb	r2, [r5, #9]
c0de51b2:	7aab      	ldrb	r3, [r5, #10]
c0de51b4:	f002 fc54 	bl	c0de7a60 <OUTLINED_FUNCTION_6>
c0de51b8:	2800      	cmp	r0, #0
c0de51ba:	f000 8257 	beq.w	c0de566c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de51be:	2008      	movs	r0, #8
c0de51c0:	4637      	mov	r7, r6
c0de51c2:	f04f 0a01 	mov.w	sl, #1
c0de51c6:	21a0      	movs	r1, #160	@ 0xa0
c0de51c8:	f04f 0800 	mov.w	r8, #0
c0de51cc:	75b0      	strb	r0, [r6, #22]
c0de51ce:	7a28      	ldrb	r0, [r5, #8]
c0de51d0:	f886 a005 	strb.w	sl, [r6, #5]
c0de51d4:	7131      	strb	r1, [r6, #4]
c0de51d6:	77f0      	strb	r0, [r6, #31]
c0de51d8:	2060      	movs	r0, #96	@ 0x60
c0de51da:	f807 0f06 	strb.w	r0, [r7, #6]!
c0de51de:	f887 8001 	strb.w	r8, [r7, #1]
c0de51e2:	f002 fd21 	bl	c0de7c28 <OUTLINED_FUNCTION_23>
c0de51e6:	4631      	mov	r1, r6
c0de51e8:	0e02      	lsrs	r2, r0, #24
c0de51ea:	f002 fcbd 	bl	c0de7b68 <OUTLINED_FUNCTION_15>
c0de51ee:	7a29      	ldrb	r1, [r5, #8]
c0de51f0:	f886 801d 	strb.w	r8, [r6, #29]
c0de51f4:	f886 a01e 	strb.w	sl, [r6, #30]
c0de51f8:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de51fc:	2005      	movs	r0, #5
c0de51fe:	f886 a01c 	strb.w	sl, [r6, #28]
c0de5202:	f886 0020 	strb.w	r0, [r6, #32]
c0de5206:	200b      	movs	r0, #11
c0de5208:	2900      	cmp	r1, #0
c0de520a:	bf08      	it	eq
c0de520c:	200c      	moveq	r0, #12
c0de520e:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de5212:	6922      	ldr	r2, [r4, #16]
c0de5214:	7879      	ldrb	r1, [r7, #1]
c0de5216:	7838      	ldrb	r0, [r7, #0]
c0de5218:	f002 fe76 	bl	c0de7f08 <OUTLINED_FUNCTION_65>
c0de521c:	e1f6      	b.n	c0de560c <nbgl_layoutAddExtendedFooter+0x640>
c0de521e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5222:	f002 fbcf 	bl	c0de79c4 <OUTLINED_FUNCTION_0>
c0de5226:	4606      	mov	r6, r0
c0de5228:	7b2a      	ldrb	r2, [r5, #12]
c0de522a:	7bab      	ldrb	r3, [r5, #14]
c0de522c:	f002 fc18 	bl	c0de7a60 <OUTLINED_FUNCTION_6>
c0de5230:	2800      	cmp	r0, #0
c0de5232:	f000 821b 	beq.w	c0de566c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de5236:	2007      	movs	r0, #7
c0de5238:	f04f 0a00 	mov.w	sl, #0
c0de523c:	f04f 08d0 	mov.w	r8, #208	@ 0xd0
c0de5240:	75b0      	strb	r0, [r6, #22]
c0de5242:	2060      	movs	r0, #96	@ 0x60
c0de5244:	f886 a01f 	strb.w	sl, [r6, #31]
c0de5248:	f886 a007 	strb.w	sl, [r6, #7]
c0de524c:	f886 a005 	strb.w	sl, [r6, #5]
c0de5250:	f886 8004 	strb.w	r8, [r6, #4]
c0de5254:	71b0      	strb	r0, [r6, #6]
c0de5256:	f002 fce7 	bl	c0de7c28 <OUTLINED_FUNCTION_23>
c0de525a:	4631      	mov	r1, r6
c0de525c:	0e02      	lsrs	r2, r0, #24
c0de525e:	f04f 0b01 	mov.w	fp, #1
c0de5262:	f886 a01d 	strb.w	sl, [r6, #29]
c0de5266:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de526a:	f886 b01e 	strb.w	fp, [r6, #30]
c0de526e:	f002 fc54 	bl	c0de7b1a <OUTLINED_FUNCTION_12>
c0de5272:	f002 fe2a 	bl	c0de7eca <OUTLINED_FUNCTION_59>
c0de5276:	f886 0020 	strb.w	r0, [r6, #32]
c0de527a:	6920      	ldr	r0, [r4, #16]
c0de527c:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de5280:	3101      	adds	r1, #1
c0de5282:	f880 1020 	strb.w	r1, [r0, #32]
c0de5286:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de528a:	f002 fb9b 	bl	c0de79c4 <OUTLINED_FUNCTION_0>
c0de528e:	4606      	mov	r6, r0
c0de5290:	7b6a      	ldrb	r2, [r5, #13]
c0de5292:	7bab      	ldrb	r3, [r5, #14]
c0de5294:	f002 fbe4 	bl	c0de7a60 <OUTLINED_FUNCTION_6>
c0de5298:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de529c:	2800      	cmp	r0, #0
c0de529e:	f000 81e7 	beq.w	c0de5670 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de52a2:	2009      	movs	r0, #9
c0de52a4:	f886 8004 	strb.w	r8, [r6, #4]
c0de52a8:	46b0      	mov	r8, r6
c0de52aa:	f886 a01f 	strb.w	sl, [r6, #31]
c0de52ae:	f886 a005 	strb.w	sl, [r6, #5]
c0de52b2:	75b0      	strb	r0, [r6, #22]
c0de52b4:	2060      	movs	r0, #96	@ 0x60
c0de52b6:	f808 0f06 	strb.w	r0, [r8, #6]!
c0de52ba:	f888 a001 	strb.w	sl, [r8, #1]
c0de52be:	f002 fdbb 	bl	c0de7e38 <OUTLINED_FUNCTION_49>
c0de52c2:	f002 fdfd 	bl	c0de7ec0 <OUTLINED_FUNCTION_58>
c0de52c6:	f002 fc4f 	bl	c0de7b68 <OUTLINED_FUNCTION_15>
c0de52ca:	f898 1001 	ldrb.w	r1, [r8, #1]
c0de52ce:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de52d2:	200c      	movs	r0, #12
c0de52d4:	f002 fdf9 	bl	c0de7eca <OUTLINED_FUNCTION_59>
c0de52d8:	6922      	ldr	r2, [r4, #16]
c0de52da:	f886 0020 	strb.w	r0, [r6, #32]
c0de52de:	2003      	movs	r0, #3
c0de52e0:	77b0      	strb	r0, [r6, #30]
c0de52e2:	f898 0000 	ldrb.w	r0, [r8]
c0de52e6:	f002 fe0f 	bl	c0de7f08 <OUTLINED_FUNCTION_65>
c0de52ea:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de52ee:	f002 fe01 	bl	c0de7ef4 <OUTLINED_FUNCTION_63>
c0de52f2:	4680      	mov	r8, r0
c0de52f4:	f880 a005 	strb.w	sl, [r0, #5]
c0de52f8:	f880 b004 	strb.w	fp, [r0, #4]
c0de52fc:	20ff      	movs	r0, #255	@ 0xff
c0de52fe:	0e31      	lsrs	r1, r6, #24
c0de5300:	f888 0018 	strb.w	r0, [r8, #24]
c0de5304:	0a30      	lsrs	r0, r6, #8
c0de5306:	f888 7017 	strb.w	r7, [r8, #23]
c0de530a:	f888 b021 	strb.w	fp, [r8, #33]	@ 0x21
c0de530e:	f888 a01f 	strb.w	sl, [r8, #31]
c0de5312:	f888 0013 	strb.w	r0, [r8, #19]
c0de5316:	2002      	movs	r0, #2
c0de5318:	f888 0020 	strb.w	r0, [r8, #32]
c0de531c:	2004      	movs	r0, #4
c0de531e:	f888 0016 	strb.w	r0, [r8, #22]
c0de5322:	4640      	mov	r0, r8
c0de5324:	f800 6f12 	strb.w	r6, [r0, #18]!
c0de5328:	70c1      	strb	r1, [r0, #3]
c0de532a:	0c31      	lsrs	r1, r6, #16
c0de532c:	7081      	strb	r1, [r0, #2]
c0de532e:	6920      	ldr	r0, [r4, #16]
c0de5330:	7981      	ldrb	r1, [r0, #6]
c0de5332:	79c0      	ldrb	r0, [r0, #7]
c0de5334:	f888 0007 	strb.w	r0, [r8, #7]
c0de5338:	f888 1006 	strb.w	r1, [r8, #6]
c0de533c:	e166      	b.n	c0de560c <nbgl_layoutAddExtendedFooter+0x640>
c0de533e:	f04f 0b00 	mov.w	fp, #0
c0de5342:	2760      	movs	r7, #96	@ 0x60
c0de5344:	f04f 0a01 	mov.w	sl, #1
c0de5348:	21e0      	movs	r1, #224	@ 0xe0
c0de534a:	f880 b007 	strb.w	fp, [r0, #7]
c0de534e:	7187      	strb	r7, [r0, #6]
c0de5350:	f880 a005 	strb.w	sl, [r0, #5]
c0de5354:	7101      	strb	r1, [r0, #4]
c0de5356:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de535a:	f002 fb33 	bl	c0de79c4 <OUTLINED_FUNCTION_0>
c0de535e:	4606      	mov	r6, r0
c0de5360:	7d2a      	ldrb	r2, [r5, #20]
c0de5362:	7d6b      	ldrb	r3, [r5, #21]
c0de5364:	f002 fb7c 	bl	c0de7a60 <OUTLINED_FUNCTION_6>
c0de5368:	2800      	cmp	r0, #0
c0de536a:	f000 817f 	beq.w	c0de566c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de536e:	1d28      	adds	r0, r5, #4
c0de5370:	46b0      	mov	r8, r6
c0de5372:	f886 b01f 	strb.w	fp, [r6, #31]
c0de5376:	f886 b007 	strb.w	fp, [r6, #7]
c0de537a:	71b7      	strb	r7, [r6, #6]
c0de537c:	9001      	str	r0, [sp, #4]
c0de537e:	2007      	movs	r0, #7
c0de5380:	75b0      	strb	r0, [r6, #22]
c0de5382:	20c0      	movs	r0, #192	@ 0xc0
c0de5384:	f808 0f04 	strb.w	r0, [r8, #4]!
c0de5388:	f888 b001 	strb.w	fp, [r8, #1]
c0de538c:	6928      	ldr	r0, [r5, #16]
c0de538e:	f006 fe2b 	bl	c0debfe8 <pic>
c0de5392:	4631      	mov	r1, r6
c0de5394:	0e02      	lsrs	r2, r0, #24
c0de5396:	f886 a01e 	strb.w	sl, [r6, #30]
c0de539a:	f886 b01d 	strb.w	fp, [r6, #29]
c0de539e:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de53a2:	f002 fbba 	bl	c0de7b1a <OUTLINED_FUNCTION_12>
c0de53a6:	f886 a01c 	strb.w	sl, [r6, #28]
c0de53aa:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de53ae:	2005      	movs	r0, #5
c0de53b0:	f886 0020 	strb.w	r0, [r6, #32]
c0de53b4:	6920      	ldr	r0, [r4, #16]
c0de53b6:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de53ba:	3101      	adds	r1, #1
c0de53bc:	f880 1020 	strb.w	r1, [r0, #32]
c0de53c0:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de53c4:	f002 fbe7 	bl	c0de7b96 <OUTLINED_FUNCTION_16>
c0de53c8:	4682      	mov	sl, r0
c0de53ca:	2004      	movs	r0, #4
c0de53cc:	2101      	movs	r1, #1
c0de53ce:	f88a 0020 	strb.w	r0, [sl, #32]
c0de53d2:	20a0      	movs	r0, #160	@ 0xa0
c0de53d4:	4656      	mov	r6, sl
c0de53d6:	f88a b01f 	strb.w	fp, [sl, #31]
c0de53da:	f806 0f04 	strb.w	r0, [r6, #4]!
c0de53de:	7071      	strb	r1, [r6, #1]
c0de53e0:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de53e4:	f002 fd82 	bl	c0de7eec <OUTLINED_FUNCTION_62>
c0de53e8:	2109      	movs	r1, #9
c0de53ea:	0e02      	lsrs	r2, r0, #24
c0de53ec:	f88a b007 	strb.w	fp, [sl, #7]
c0de53f0:	f88a 1016 	strb.w	r1, [sl, #22]
c0de53f4:	2160      	movs	r1, #96	@ 0x60
c0de53f6:	f88a 1006 	strb.w	r1, [sl, #6]
c0de53fa:	4651      	mov	r1, sl
c0de53fc:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de5400:	f002 fd0e 	bl	c0de7e20 <OUTLINED_FUNCTION_47>
c0de5404:	f88a 0023 	strb.w	r0, [sl, #35]	@ 0x23
c0de5408:	f898 0000 	ldrb.w	r0, [r8]
c0de540c:	f898 1001 	ldrb.w	r1, [r8, #1]
c0de5410:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de5414:	9901      	ldr	r1, [sp, #4]
c0de5416:	f5c0 70f0 	rsb	r0, r0, #480	@ 0x1e0
c0de541a:	7030      	strb	r0, [r6, #0]
c0de541c:	0a00      	lsrs	r0, r0, #8
c0de541e:	7070      	strb	r0, [r6, #1]
c0de5420:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5424:	08c2      	lsrs	r2, r0, #3
c0de5426:	4650      	mov	r0, sl
c0de5428:	f002 fe40 	bl	c0de80ac <layoutNavigationPopulate>
c0de542c:	792a      	ldrb	r2, [r5, #4]
c0de542e:	7b2b      	ldrb	r3, [r5, #12]
c0de5430:	4620      	mov	r0, r4
c0de5432:	4651      	mov	r1, sl
c0de5434:	f7fe ffa4 	bl	c0de4380 <layoutAddCallbackObj>
c0de5438:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de543c:	2800      	cmp	r0, #0
c0de543e:	f000 8117 	beq.w	c0de5670 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de5442:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5446:	f002 fd55 	bl	c0de7ef4 <OUTLINED_FUNCTION_63>
c0de544a:	4680      	mov	r8, r0
c0de544c:	2002      	movs	r0, #2
c0de544e:	2101      	movs	r1, #1
c0de5450:	f888 0020 	strb.w	r0, [r8, #32]
c0de5454:	2000      	movs	r0, #0
c0de5456:	f888 1004 	strb.w	r1, [r8, #4]
c0de545a:	f888 1021 	strb.w	r1, [r8, #33]	@ 0x21
c0de545e:	ea4f 611a 	mov.w	r1, sl, lsr #24
c0de5462:	f888 7017 	strb.w	r7, [r8, #23]
c0de5466:	f888 0005 	strb.w	r0, [r8, #5]
c0de546a:	f888 001f 	strb.w	r0, [r8, #31]
c0de546e:	2004      	movs	r0, #4
c0de5470:	f888 0016 	strb.w	r0, [r8, #22]
c0de5474:	20ff      	movs	r0, #255	@ 0xff
c0de5476:	f888 0018 	strb.w	r0, [r8, #24]
c0de547a:	ea4f 201a 	mov.w	r0, sl, lsr #8
c0de547e:	f888 0013 	strb.w	r0, [r8, #19]
c0de5482:	4640      	mov	r0, r8
c0de5484:	f800 af12 	strb.w	sl, [r0, #18]!
c0de5488:	70c1      	strb	r1, [r0, #3]
c0de548a:	ea4f 411a 	mov.w	r1, sl, lsr #16
c0de548e:	7081      	strb	r1, [r0, #2]
c0de5490:	6920      	ldr	r0, [r4, #16]
c0de5492:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de5496:	f810 3c1b 	ldrb.w	r3, [r0, #-27]
c0de549a:	f810 2c1c 	ldrb.w	r2, [r0, #-28]
c0de549e:	7847      	ldrb	r7, [r0, #1]
c0de54a0:	f810 6c02 	ldrb.w	r6, [r0, #-2]
c0de54a4:	f888 3007 	strb.w	r3, [r8, #7]
c0de54a8:	f888 2006 	strb.w	r2, [r8, #6]
c0de54ac:	ea41 2107 	orr.w	r1, r1, r7, lsl #8
c0de54b0:	79aa      	ldrb	r2, [r5, #6]
c0de54b2:	f884 20a9 	strb.w	r2, [r4, #169]	@ 0xa9
c0de54b6:	78c2      	ldrb	r2, [r0, #3]
c0de54b8:	7880      	ldrb	r0, [r0, #2]
c0de54ba:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de54be:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de54c2:	7969      	ldrb	r1, [r5, #5]
c0de54c4:	f840 a026 	str.w	sl, [r0, r6, lsl #2]
c0de54c8:	f884 10a8 	strb.w	r1, [r4, #168]	@ 0xa8
c0de54cc:	e09b      	b.n	c0de5606 <nbgl_layoutAddExtendedFooter+0x63a>
c0de54ce:	2100      	movs	r1, #0
c0de54d0:	71c1      	strb	r1, [r0, #7]
c0de54d2:	2160      	movs	r1, #96	@ 0x60
c0de54d4:	7181      	strb	r1, [r0, #6]
c0de54d6:	2101      	movs	r1, #1
c0de54d8:	7141      	strb	r1, [r0, #5]
c0de54da:	21e0      	movs	r1, #224	@ 0xe0
c0de54dc:	7101      	strb	r1, [r0, #4]
c0de54de:	1d29      	adds	r1, r5, #4
c0de54e0:	f894 20ad 	ldrb.w	r2, [r4, #173]	@ 0xad
c0de54e4:	08d2      	lsrs	r2, r2, #3
c0de54e6:	f002 fde1 	bl	c0de80ac <layoutNavigationPopulate>
c0de54ea:	6921      	ldr	r1, [r4, #16]
c0de54ec:	2004      	movs	r0, #4
c0de54ee:	f881 0020 	strb.w	r0, [r1, #32]
c0de54f2:	4620      	mov	r0, r4
c0de54f4:	792a      	ldrb	r2, [r5, #4]
c0de54f6:	7b2b      	ldrb	r3, [r5, #12]
c0de54f8:	f7fe ff42 	bl	c0de4380 <layoutAddCallbackObj>
c0de54fc:	2800      	cmp	r0, #0
c0de54fe:	f000 80b5 	beq.w	c0de566c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de5502:	79a8      	ldrb	r0, [r5, #6]
c0de5504:	f04f 0800 	mov.w	r8, #0
c0de5508:	f884 00a9 	strb.w	r0, [r4, #169]	@ 0xa9
c0de550c:	7968      	ldrb	r0, [r5, #5]
c0de550e:	f884 00a8 	strb.w	r0, [r4, #168]	@ 0xa8
c0de5512:	e07b      	b.n	c0de560c <nbgl_layoutAddExtendedFooter+0x640>
c0de5514:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5518:	2605      	movs	r6, #5
c0de551a:	f002 fb40 	bl	c0de7b9e <OUTLINED_FUNCTION_17>
c0de551e:	4607      	mov	r7, r0
c0de5520:	7b2a      	ldrb	r2, [r5, #12]
c0de5522:	7c2b      	ldrb	r3, [r5, #16]
c0de5524:	4620      	mov	r0, r4
c0de5526:	4639      	mov	r1, r7
c0de5528:	f7fe ff2a 	bl	c0de4380 <layoutAddCallbackObj>
c0de552c:	2800      	cmp	r0, #0
c0de552e:	f000 809d 	beq.w	c0de566c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de5532:	75be      	strb	r6, [r7, #22]
c0de5534:	2100      	movs	r1, #0
c0de5536:	f04f 0800 	mov.w	r8, #0
c0de553a:	7b68      	ldrb	r0, [r5, #13]
c0de553c:	2800      	cmp	r0, #0
c0de553e:	bf08      	it	eq
c0de5540:	2103      	moveq	r1, #3
c0de5542:	f887 1021 	strb.w	r1, [r7, #33]	@ 0x21
c0de5546:	bf18      	it	ne
c0de5548:	2003      	movne	r0, #3
c0de554a:	77f8      	strb	r0, [r7, #31]
c0de554c:	7b68      	ldrb	r0, [r5, #13]
c0de554e:	4601      	mov	r1, r0
c0de5550:	2800      	cmp	r0, #0
c0de5552:	bf18      	it	ne
c0de5554:	2101      	movne	r1, #1
c0de5556:	0049      	lsls	r1, r1, #1
c0de5558:	2802      	cmp	r0, #2
c0de555a:	bf08      	it	eq
c0de555c:	2103      	moveq	r1, #3
c0de555e:	f887 1020 	strb.w	r1, [r7, #32]
c0de5562:	f002 fb61 	bl	c0de7c28 <OUTLINED_FUNCTION_23>
c0de5566:	463e      	mov	r6, r7
c0de5568:	210c      	movs	r1, #12
c0de556a:	f887 1023 	strb.w	r1, [r7, #35]	@ 0x23
c0de556e:	f806 0f25 	strb.w	r0, [r6, #37]!
c0de5572:	0e01      	lsrs	r1, r0, #24
c0de5574:	f002 fcaf 	bl	c0de7ed6 <OUTLINED_FUNCTION_60>
c0de5578:	f887 0026 	strb.w	r0, [r7, #38]	@ 0x26
c0de557c:	f002 fc5c 	bl	c0de7e38 <OUTLINED_FUNCTION_49>
c0de5580:	2103      	movs	r1, #3
c0de5582:	0e02      	lsrs	r2, r0, #24
c0de5584:	f887 8007 	strb.w	r8, [r7, #7]
c0de5588:	f887 1022 	strb.w	r1, [r7, #34]	@ 0x22
c0de558c:	2158      	movs	r1, #88	@ 0x58
c0de558e:	71b9      	strb	r1, [r7, #6]
c0de5590:	4639      	mov	r1, r7
c0de5592:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de5596:	f002 fc43 	bl	c0de7e20 <OUTLINED_FUNCTION_47>
c0de559a:	f887 002f 	strb.w	r0, [r7, #47]	@ 0x2f
c0de559e:	2188      	movs	r1, #136	@ 0x88
c0de55a0:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de55a4:	6920      	ldr	r0, [r4, #16]
c0de55a6:	f880 8007 	strb.w	r8, [r0, #7]
c0de55aa:	7181      	strb	r1, [r0, #6]
c0de55ac:	6869      	ldr	r1, [r5, #4]
c0de55ae:	2900      	cmp	r1, #0
c0de55b0:	bf08      	it	eq
c0de55b2:	2258      	moveq	r2, #88	@ 0x58
c0de55b4:	713a      	strb	r2, [r7, #4]
c0de55b6:	f896 c000 	ldrb.w	ip, [r6]
c0de55ba:	f896 e002 	ldrb.w	lr, [r6, #2]
c0de55be:	f896 a003 	ldrb.w	sl, [r6, #3]
c0de55c2:	f887 801d 	strb.w	r8, [r7, #29]
c0de55c6:	0a11      	lsrs	r1, r2, #8
c0de55c8:	7179      	strb	r1, [r7, #5]
c0de55ca:	f810 6f22 	ldrb.w	r6, [r0, #34]!
c0de55ce:	7842      	ldrb	r2, [r0, #1]
c0de55d0:	f810 1c02 	ldrb.w	r1, [r0, #-2]
c0de55d4:	7883      	ldrb	r3, [r0, #2]
c0de55d6:	78c0      	ldrb	r0, [r0, #3]
c0de55d8:	ea46 2202 	orr.w	r2, r6, r2, lsl #8
c0de55dc:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de55e0:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de55e4:	f897 2026 	ldrb.w	r2, [r7, #38]	@ 0x26
c0de55e8:	f840 7021 	str.w	r7, [r0, r1, lsl #2]
c0de55ec:	2001      	movs	r0, #1
c0de55ee:	ea4e 210a 	orr.w	r1, lr, sl, lsl #8
c0de55f2:	7738      	strb	r0, [r7, #28]
c0de55f4:	ea4c 2002 	orr.w	r0, ip, r2, lsl #8
c0de55f8:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de55fc:	2107      	movs	r1, #7
c0de55fe:	2800      	cmp	r0, #0
c0de5600:	bf08      	it	eq
c0de5602:	2101      	moveq	r1, #1
c0de5604:	77b9      	strb	r1, [r7, #30]
c0de5606:	6920      	ldr	r0, [r4, #16]
c0de5608:	f002 f9e0 	bl	c0de79cc <OUTLINED_FUNCTION_1>
c0de560c:	7828      	ldrb	r0, [r5, #0]
c0de560e:	3803      	subs	r0, #3
c0de5610:	2801      	cmp	r0, #1
c0de5612:	d808      	bhi.n	c0de5626 <nbgl_layoutAddExtendedFooter+0x65a>
c0de5614:	7b28      	ldrb	r0, [r5, #12]
c0de5616:	792b      	ldrb	r3, [r5, #4]
c0de5618:	f44f 61c0 	mov.w	r1, #1536	@ 0x600
c0de561c:	2200      	movs	r2, #0
c0de561e:	9000      	str	r0, [sp, #0]
c0de5620:	4620      	mov	r0, r4
c0de5622:	f7ff fc7c 	bl	c0de4f1e <addSwipeInternal>
c0de5626:	7868      	ldrb	r0, [r5, #1]
c0de5628:	b148      	cbz	r0, c0de563e <nbgl_layoutAddExtendedFooter+0x672>
c0de562a:	f002 fb10 	bl	c0de7c4e <OUTLINED_FUNCTION_25>
c0de562e:	6921      	ldr	r1, [r4, #16]
c0de5630:	f002 f9f9 	bl	c0de7a26 <OUTLINED_FUNCTION_4>
c0de5634:	2102      	movs	r1, #2
c0de5636:	7581      	strb	r1, [r0, #22]
c0de5638:	6920      	ldr	r0, [r4, #16]
c0de563a:	f002 f9c7 	bl	c0de79cc <OUTLINED_FUNCTION_1>
c0de563e:	f1b8 0f00 	cmp.w	r8, #0
c0de5642:	d018      	beq.n	c0de5676 <nbgl_layoutAddExtendedFooter+0x6aa>
c0de5644:	6920      	ldr	r0, [r4, #16]
c0de5646:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de564a:	7843      	ldrb	r3, [r0, #1]
c0de564c:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de5650:	7886      	ldrb	r6, [r0, #2]
c0de5652:	78c0      	ldrb	r0, [r0, #3]
c0de5654:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de5658:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de565c:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de5660:	f840 8022 	str.w	r8, [r0, r2, lsl #2]
c0de5664:	6920      	ldr	r0, [r4, #16]
c0de5666:	f002 f9b1 	bl	c0de79cc <OUTLINED_FUNCTION_1>
c0de566a:	e005      	b.n	c0de5678 <nbgl_layoutAddExtendedFooter+0x6ac>
c0de566c:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de5670:	4638      	mov	r0, r7
c0de5672:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de5676:	6920      	ldr	r0, [r4, #16]
c0de5678:	68a1      	ldr	r1, [r4, #8]
c0de567a:	60c8      	str	r0, [r1, #12]
c0de567c:	6920      	ldr	r0, [r4, #16]
c0de567e:	f8d4 10a0 	ldr.w	r1, [r4, #160]	@ 0xa0
c0de5682:	f810 2f06 	ldrb.w	r2, [r0, #6]!
c0de5686:	7843      	ldrb	r3, [r0, #1]
c0de5688:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de568c:	f811 3f06 	ldrb.w	r3, [r1, #6]!
c0de5690:	784e      	ldrb	r6, [r1, #1]
c0de5692:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de5696:	1a9a      	subs	r2, r3, r2
c0de5698:	700a      	strb	r2, [r1, #0]
c0de569a:	0a12      	lsrs	r2, r2, #8
c0de569c:	704a      	strb	r2, [r1, #1]
c0de569e:	7829      	ldrb	r1, [r5, #0]
c0de56a0:	f884 10ab 	strb.w	r1, [r4, #171]	@ 0xab
c0de56a4:	7801      	ldrb	r1, [r0, #0]
c0de56a6:	7840      	ldrb	r0, [r0, #1]
c0de56a8:	ea41 2700 	orr.w	r7, r1, r0, lsl #8
c0de56ac:	e7e0      	b.n	c0de5670 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de56ae:	2000      	movs	r0, #0
c0de56b0:	f002 fc06 	bl	c0de7ec0 <OUTLINED_FUNCTION_58>
c0de56b4:	f002 fb11 	bl	c0de7cda <OUTLINED_FUNCTION_31>
c0de56b8:	f002 fa75 	bl	c0de7ba6 <OUTLINED_FUNCTION_18>
c0de56bc:	f04f 0800 	mov.w	r8, #0
c0de56c0:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de56c4:	2009      	movs	r0, #9
c0de56c6:	77b0      	strb	r0, [r6, #30]
c0de56c8:	6920      	ldr	r0, [r4, #16]
c0de56ca:	f002 f97f 	bl	c0de79cc <OUTLINED_FUNCTION_1>
c0de56ce:	7c69      	ldrb	r1, [r5, #17]
c0de56d0:	f880 8007 	strb.w	r8, [r0, #7]
c0de56d4:	2900      	cmp	r1, #0
c0de56d6:	bf0c      	ite	eq
c0de56d8:	21d0      	moveq	r1, #208	@ 0xd0
c0de56da:	21e8      	movne	r1, #232	@ 0xe8
c0de56dc:	7181      	strb	r1, [r0, #6]
c0de56de:	e795      	b.n	c0de560c <nbgl_layoutAddExtendedFooter+0x640>

c0de56e0 <nbgl_layoutAddBottomButton>:
c0de56e0:	b570      	push	{r4, r5, r6, lr}
c0de56e2:	b086      	sub	sp, #24
c0de56e4:	4605      	mov	r5, r0
c0de56e6:	2005      	movs	r0, #5
c0de56e8:	2600      	movs	r6, #0
c0de56ea:	4614      	mov	r4, r2
c0de56ec:	f88d 3001 	strb.w	r3, [sp, #1]
c0de56f0:	f88d 0000 	strb.w	r0, [sp]
c0de56f4:	4608      	mov	r0, r1
c0de56f6:	f88d 600e 	strb.w	r6, [sp, #14]
c0de56fa:	f006 fc75 	bl	c0debfe8 <pic>
c0de56fe:	9002      	str	r0, [sp, #8]
c0de5700:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de5702:	4669      	mov	r1, sp
c0de5704:	f88d 400c 	strb.w	r4, [sp, #12]
c0de5708:	9601      	str	r6, [sp, #4]
c0de570a:	f88d 0010 	strb.w	r0, [sp, #16]
c0de570e:	2001      	movs	r0, #1
c0de5710:	f88d 000d 	strb.w	r0, [sp, #13]
c0de5714:	4628      	mov	r0, r5
c0de5716:	f7ff fc59 	bl	c0de4fcc <nbgl_layoutAddExtendedFooter>
c0de571a:	b006      	add	sp, #24
c0de571c:	bd70      	pop	{r4, r5, r6, pc}

c0de571e <nbgl_layoutAddTouchableBar>:
c0de571e:	b5b0      	push	{r4, r5, r7, lr}
c0de5720:	b086      	sub	sp, #24
c0de5722:	b1e8      	cbz	r0, c0de5760 <nbgl_layoutAddTouchableBar+0x42>
c0de5724:	2200      	movs	r2, #0
c0de5726:	f88d 2000 	strb.w	r2, [sp]
c0de572a:	e891 003c 	ldmia.w	r1, {r2, r3, r4, r5}
c0de572e:	e9cd 3503 	strd	r3, r5, [sp, #12]
c0de5732:	e9cd 2401 	strd	r2, r4, [sp, #4]
c0de5736:	7c4a      	ldrb	r2, [r1, #17]
c0de5738:	f88d 2014 	strb.w	r2, [sp, #20]
c0de573c:	7d0a      	ldrb	r2, [r1, #20]
c0de573e:	f88d 2017 	strb.w	r2, [sp, #23]
c0de5742:	7c0a      	ldrb	r2, [r1, #16]
c0de5744:	7c89      	ldrb	r1, [r1, #18]
c0de5746:	f081 0101 	eor.w	r1, r1, #1
c0de574a:	f88d 2016 	strb.w	r2, [sp, #22]
c0de574e:	f88d 1015 	strb.w	r1, [sp, #21]
c0de5752:	4669      	mov	r1, sp
c0de5754:	f000 f808 	bl	c0de5768 <addListItem>
c0de5758:	b110      	cbz	r0, c0de5760 <nbgl_layoutAddTouchableBar+0x42>
c0de575a:	f002 fb9a 	bl	c0de7e92 <OUTLINED_FUNCTION_55>
c0de575e:	e001      	b.n	c0de5764 <nbgl_layoutAddTouchableBar+0x46>
c0de5760:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de5764:	b006      	add	sp, #24
c0de5766:	bdb0      	pop	{r4, r5, r7, pc}

c0de5768 <addListItem>:
c0de5768:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de576c:	4682      	mov	sl, r0
c0de576e:	7808      	ldrb	r0, [r1, #0]
c0de5770:	4688      	mov	r8, r1
c0de5772:	b110      	cbz	r0, c0de577a <addListItem+0x12>
c0de5774:	f04f 0b00 	mov.w	fp, #0
c0de5778:	e006      	b.n	c0de5788 <addListItem+0x20>
c0de577a:	f898 0015 	ldrb.w	r0, [r8, #21]
c0de577e:	fab0 f080 	clz	r0, r0
c0de5782:	0940      	lsrs	r0, r0, #5
c0de5784:	ea4f 0b40 	mov.w	fp, r0, lsl #1
c0de5788:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de578c:	2401      	movs	r4, #1
c0de578e:	f002 fa02 	bl	c0de7b96 <OUTLINED_FUNCTION_16>
c0de5792:	4606      	mov	r6, r0
c0de5794:	f898 2014 	ldrb.w	r2, [r8, #20]
c0de5798:	f898 3017 	ldrb.w	r3, [r8, #23]
c0de579c:	4650      	mov	r0, sl
c0de579e:	f002 fa2a 	bl	c0de7bf6 <OUTLINED_FUNCTION_20>
c0de57a2:	2500      	movs	r5, #0
c0de57a4:	2800      	cmp	r0, #0
c0de57a6:	d075      	beq.n	c0de5894 <addListItem+0x12c>
c0de57a8:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de57ac:	f002 fb9e 	bl	c0de7eec <OUTLINED_FUNCTION_62>
c0de57b0:	4631      	mov	r1, r6
c0de57b2:	0e02      	lsrs	r2, r0, #24
c0de57b4:	2364      	movs	r3, #100	@ 0x64
c0de57b6:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de57ba:	f801 5d10 	strb.w	r5, [r1, #-16]!
c0de57be:	74ca      	strb	r2, [r1, #19]
c0de57c0:	0c02      	lsrs	r2, r0, #16
c0de57c2:	0a00      	lsrs	r0, r0, #8
c0de57c4:	f801 4c0d 	strb.w	r4, [r1, #-13]
c0de57c8:	f801 5c0b 	strb.w	r5, [r1, #-11]
c0de57cc:	7448      	strb	r0, [r1, #17]
c0de57ce:	20a0      	movs	r0, #160	@ 0xa0
c0de57d0:	748a      	strb	r2, [r1, #18]
c0de57d2:	f801 0c0e 	strb.w	r0, [r1, #-14]
c0de57d6:	f898 2016 	ldrb.w	r2, [r8, #22]
c0de57da:	f898 0000 	ldrb.w	r0, [r8]
c0de57de:	2a00      	cmp	r2, #0
c0de57e0:	bf08      	it	eq
c0de57e2:	235c      	moveq	r3, #92	@ 0x5c
c0de57e4:	f801 3c0c 	strb.w	r3, [r1, #-12]
c0de57e8:	718d      	strb	r5, [r1, #6]
c0de57ea:	70cd      	strb	r5, [r1, #3]
c0de57ec:	708d      	strb	r5, [r1, #2]
c0de57ee:	704d      	strb	r5, [r1, #1]
c0de57f0:	738d      	strb	r5, [r1, #14]
c0de57f2:	734c      	strb	r4, [r1, #13]
c0de57f4:	710d      	strb	r5, [r1, #4]
c0de57f6:	2220      	movs	r2, #32
c0de57f8:	2801      	cmp	r0, #1
c0de57fa:	714a      	strb	r2, [r1, #5]
c0de57fc:	d004      	beq.n	c0de5808 <addListItem+0xa0>
c0de57fe:	b980      	cbnz	r0, c0de5822 <addListItem+0xba>
c0de5800:	f898 0015 	ldrb.w	r0, [r8, #21]
c0de5804:	2801      	cmp	r0, #1
c0de5806:	d10c      	bne.n	c0de5822 <addListItem+0xba>
c0de5808:	48c4      	ldr	r0, [pc, #784]	@ (c0de5b1c <addListItem+0x3b4>)
c0de580a:	f819 1000 	ldrb.w	r1, [r9, r0]
c0de580e:	1c4a      	adds	r2, r1, #1
c0de5810:	f809 2000 	strb.w	r2, [r9, r0]
c0de5814:	2000      	movs	r0, #0
c0de5816:	7770      	strb	r0, [r6, #29]
c0de5818:	2001      	movs	r0, #1
c0de581a:	7730      	strb	r0, [r6, #28]
c0de581c:	f101 0014 	add.w	r0, r1, #20
c0de5820:	77b0      	strb	r0, [r6, #30]
c0de5822:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de5826:	f002 f8cd 	bl	c0de79c4 <OUTLINED_FUNCTION_0>
c0de582a:	4607      	mov	r7, r0
c0de582c:	f880 b01f 	strb.w	fp, [r0, #31]
c0de5830:	f8d8 000c 	ldr.w	r0, [r8, #12]
c0de5834:	f006 fbd8 	bl	c0debfe8 <pic>
c0de5838:	2201      	movs	r2, #1
c0de583a:	2100      	movs	r1, #0
c0de583c:	f64f 74f0 	movw	r4, #65520	@ 0xfff0
c0de5840:	f887 2024 	strb.w	r2, [r7, #36]	@ 0x24
c0de5844:	220c      	movs	r2, #12
c0de5846:	f887 102d 	strb.w	r1, [r7, #45]	@ 0x2d
c0de584a:	f887 2022 	strb.w	r2, [r7, #34]	@ 0x22
c0de584e:	463a      	mov	r2, r7
c0de5850:	f802 1f2c 	strb.w	r1, [r2, #44]!
c0de5854:	70d1      	strb	r1, [r2, #3]
c0de5856:	7091      	strb	r1, [r2, #2]
c0de5858:	4639      	mov	r1, r7
c0de585a:	f002 fab4 	bl	c0de7dc6 <OUTLINED_FUNCTION_41>
c0de585e:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de5862:	7931      	ldrb	r1, [r6, #4]
c0de5864:	7972      	ldrb	r2, [r6, #5]
c0de5866:	7139      	strb	r1, [r7, #4]
c0de5868:	717a      	strb	r2, [r7, #5]
c0de586a:	f8d8 0004 	ldr.w	r0, [r8, #4]
c0de586e:	b198      	cbz	r0, c0de5898 <addListItem+0x130>
c0de5870:	f006 fbba 	bl	c0debfe8 <pic>
c0de5874:	4639      	mov	r1, r7
c0de5876:	f811 2f04 	ldrb.w	r2, [r1, #4]!
c0de587a:	784b      	ldrb	r3, [r1, #1]
c0de587c:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5880:	7803      	ldrb	r3, [r0, #0]
c0de5882:	7840      	ldrb	r0, [r0, #1]
c0de5884:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de5888:	1a20      	subs	r0, r4, r0
c0de588a:	4402      	add	r2, r0
c0de588c:	0a10      	lsrs	r0, r2, #8
c0de588e:	700a      	strb	r2, [r1, #0]
c0de5890:	7048      	strb	r0, [r1, #1]
c0de5892:	e003      	b.n	c0de589c <addListItem+0x134>
c0de5894:	2000      	movs	r0, #0
c0de5896:	e13e      	b.n	c0de5b16 <addListItem+0x3ae>
c0de5898:	ea41 2202 	orr.w	r2, r1, r2, lsl #8
c0de589c:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de58a0:	f8cd b00c 	str.w	fp, [sp, #12]
c0de58a4:	b160      	cbz	r0, c0de58c0 <addListItem+0x158>
c0de58a6:	f006 fb9f 	bl	c0debfe8 <pic>
c0de58aa:	7801      	ldrb	r1, [r0, #0]
c0de58ac:	7840      	ldrb	r0, [r0, #1]
c0de58ae:	797a      	ldrb	r2, [r7, #5]
c0de58b0:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de58b4:	7939      	ldrb	r1, [r7, #4]
c0de58b6:	1a20      	subs	r0, r4, r0
c0de58b8:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de58bc:	1842      	adds	r2, r0, r1
c0de58be:	e004      	b.n	c0de58ca <addListItem+0x162>
c0de58c0:	f898 0000 	ldrb.w	r0, [r8]
c0de58c4:	2801      	cmp	r0, #1
c0de58c6:	d103      	bne.n	c0de58d0 <addListItem+0x168>
c0de58c8:	3a4c      	subs	r2, #76	@ 0x4c
c0de58ca:	0a10      	lsrs	r0, r2, #8
c0de58cc:	713a      	strb	r2, [r7, #4]
c0de58ce:	7178      	strb	r0, [r7, #5]
c0de58d0:	463c      	mov	r4, r7
c0de58d2:	f897 1027 	ldrb.w	r1, [r7, #39]	@ 0x27
c0de58d6:	f897 0022 	ldrb.w	r0, [r7, #34]	@ 0x22
c0de58da:	f897 3024 	ldrb.w	r3, [r7, #36]	@ 0x24
c0de58de:	b292      	uxth	r2, r2
c0de58e0:	f814 5f26 	ldrb.w	r5, [r4, #38]!
c0de58e4:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de58e8:	78a5      	ldrb	r5, [r4, #2]
c0de58ea:	78e4      	ldrb	r4, [r4, #3]
c0de58ec:	ea45 2404 	orr.w	r4, r5, r4, lsl #8
c0de58f0:	ea41 4104 	orr.w	r1, r1, r4, lsl #16
c0de58f4:	f006 f9b0 	bl	c0debc58 <nbgl_getTextHeightInWidth>
c0de58f8:	4683      	mov	fp, r0
c0de58fa:	4630      	mov	r0, r6
c0de58fc:	4634      	mov	r4, r6
c0de58fe:	f002 fa3c 	bl	c0de7d7a <OUTLINED_FUNCTION_38>
c0de5902:	f841 7022 	str.w	r7, [r1, r2, lsl #2]
c0de5906:	2100      	movs	r1, #0
c0de5908:	f887 b006 	strb.w	fp, [r7, #6]
c0de590c:	f887 1021 	strb.w	r1, [r7, #33]	@ 0x21
c0de5910:	2104      	movs	r1, #4
c0de5912:	f887 1020 	strb.w	r1, [r7, #32]
c0de5916:	75b9      	strb	r1, [r7, #22]
c0de5918:	ea4f 211b 	mov.w	r1, fp, lsr #8
c0de591c:	71f9      	strb	r1, [r7, #7]
c0de591e:	1c51      	adds	r1, r2, #1
c0de5920:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de5924:	f1bb 0f28 	cmp.w	fp, #40	@ 0x28
c0de5928:	bf98      	it	ls
c0de592a:	f04f 0b28 	movls.w	fp, #40	@ 0x28
c0de592e:	f8d8 0004 	ldr.w	r0, [r8, #4]
c0de5932:	9402      	str	r4, [sp, #8]
c0de5934:	b358      	cbz	r0, c0de598e <addListItem+0x226>
c0de5936:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de593a:	f002 f95f 	bl	c0de7bfc <OUTLINED_FUNCTION_21>
c0de593e:	4605      	mov	r5, r0
c0de5940:	9803      	ldr	r0, [sp, #12]
c0de5942:	77e8      	strb	r0, [r5, #31]
c0de5944:	f8d8 0004 	ldr.w	r0, [r8, #4]
c0de5948:	f006 fb4e 	bl	c0debfe8 <pic>
c0de594c:	f002 f93f 	bl	c0de7bce <OUTLINED_FUNCTION_19>
c0de5950:	4620      	mov	r0, r4
c0de5952:	f810 cf22 	ldrb.w	ip, [r0, #34]!
c0de5956:	7846      	ldrb	r6, [r0, #1]
c0de5958:	7884      	ldrb	r4, [r0, #2]
c0de595a:	78c2      	ldrb	r2, [r0, #3]
c0de595c:	f810 3c02 	ldrb.w	r3, [r0, #-2]
c0de5960:	ea4c 2606 	orr.w	r6, ip, r6, lsl #8
c0de5964:	ea44 2202 	orr.w	r2, r4, r2, lsl #8
c0de5968:	ea46 4202 	orr.w	r2, r6, r2, lsl #16
c0de596c:	f002 faf8 	bl	c0de7f60 <OUTLINED_FUNCTION_72>
c0de5970:	2204      	movs	r2, #4
c0de5972:	f002 f971 	bl	c0de7c58 <OUTLINED_FUNCTION_26>
c0de5976:	7801      	ldrb	r1, [r0, #0]
c0de5978:	f002 f8ee 	bl	c0de7b58 <OUTLINED_FUNCTION_14>
c0de597c:	3110      	adds	r1, #16
c0de597e:	75f9      	strb	r1, [r7, #23]
c0de5980:	0a09      	lsrs	r1, r1, #8
c0de5982:	7639      	strb	r1, [r7, #24]
c0de5984:	fa0f f18b 	sxth.w	r1, fp
c0de5988:	4281      	cmp	r1, r0
c0de598a:	bfd8      	it	le
c0de598c:	4683      	movle	fp, r0
c0de598e:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de5992:	f8cd a004 	str.w	sl, [sp, #4]
c0de5996:	b348      	cbz	r0, c0de59ec <addListItem+0x284>
c0de5998:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de599c:	f002 f92e 	bl	c0de7bfc <OUTLINED_FUNCTION_21>
c0de59a0:	4605      	mov	r5, r0
c0de59a2:	9803      	ldr	r0, [sp, #12]
c0de59a4:	77e8      	strb	r0, [r5, #31]
c0de59a6:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de59aa:	f006 fb1d 	bl	c0debfe8 <pic>
c0de59ae:	f002 f90e 	bl	c0de7bce <OUTLINED_FUNCTION_19>
c0de59b2:	9802      	ldr	r0, [sp, #8]
c0de59b4:	f810 cf22 	ldrb.w	ip, [r0, #34]!
c0de59b8:	7844      	ldrb	r4, [r0, #1]
c0de59ba:	7886      	ldrb	r6, [r0, #2]
c0de59bc:	78c2      	ldrb	r2, [r0, #3]
c0de59be:	f810 3c02 	ldrb.w	r3, [r0, #-2]
c0de59c2:	ea4c 2404 	orr.w	r4, ip, r4, lsl #8
c0de59c6:	ea46 2202 	orr.w	r2, r6, r2, lsl #8
c0de59ca:	ea44 4202 	orr.w	r2, r4, r2, lsl #16
c0de59ce:	f002 fac7 	bl	c0de7f60 <OUTLINED_FUNCTION_72>
c0de59d2:	2206      	movs	r2, #6
c0de59d4:	f002 f940 	bl	c0de7c58 <OUTLINED_FUNCTION_26>
c0de59d8:	7881      	ldrb	r1, [r0, #2]
c0de59da:	78c0      	ldrb	r0, [r0, #3]
c0de59dc:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
c0de59e0:	fa0f f08b 	sxth.w	r0, fp
c0de59e4:	4288      	cmp	r0, r1
c0de59e6:	bfc8      	it	gt
c0de59e8:	4659      	movgt	r1, fp
c0de59ea:	e028      	b.n	c0de5a3e <addListItem+0x2d6>
c0de59ec:	f898 0000 	ldrb.w	r0, [r8]
c0de59f0:	2801      	cmp	r0, #1
c0de59f2:	d123      	bne.n	c0de5a3c <addListItem+0x2d4>
c0de59f4:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de59f8:	f04f 0a06 	mov.w	sl, #6
c0de59fc:	08c1      	lsrs	r1, r0, #3
c0de59fe:	2006      	movs	r0, #6
c0de5a00:	f006 f911 	bl	c0debc26 <nbgl_objPoolGet>
c0de5a04:	0a39      	lsrs	r1, r7, #8
c0de5a06:	0e3a      	lsrs	r2, r7, #24
c0de5a08:	f880 a016 	strb.w	sl, [r0, #22]
c0de5a0c:	74c1      	strb	r1, [r0, #19]
c0de5a0e:	4601      	mov	r1, r0
c0de5a10:	f002 fa92 	bl	c0de7f38 <OUTLINED_FUNCTION_69>
c0de5a14:	9902      	ldr	r1, [sp, #8]
c0de5a16:	f002 f977 	bl	c0de7d08 <OUTLINED_FUNCTION_33>
c0de5a1a:	2410      	movs	r4, #16
c0de5a1c:	f842 0023 	str.w	r0, [r2, r3, lsl #2]
c0de5a20:	2200      	movs	r2, #0
c0de5a22:	75c4      	strb	r4, [r0, #23]
c0de5a24:	2402      	movs	r4, #2
c0de5a26:	7602      	strb	r2, [r0, #24]
c0de5a28:	77c2      	strb	r2, [r0, #31]
c0de5a2a:	f898 2015 	ldrb.w	r2, [r8, #21]
c0de5a2e:	f880 4020 	strb.w	r4, [r0, #32]
c0de5a32:	f880 2021 	strb.w	r2, [r0, #33]	@ 0x21
c0de5a36:	1c58      	adds	r0, r3, #1
c0de5a38:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de5a3c:	4659      	mov	r1, fp
c0de5a3e:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de5a42:	e9dd 5a01 	ldrd	r5, sl, [sp, #4]
c0de5a46:	2800      	cmp	r0, #0
c0de5a48:	d05c      	beq.n	c0de5b04 <addListItem+0x39c>
c0de5a4a:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de5a4e:	9100      	str	r1, [sp, #0]
c0de5a50:	2604      	movs	r6, #4
c0de5a52:	f001 ffb7 	bl	c0de79c4 <OUTLINED_FUNCTION_0>
c0de5a56:	4604      	mov	r4, r0
c0de5a58:	9803      	ldr	r0, [sp, #12]
c0de5a5a:	77e0      	strb	r0, [r4, #31]
c0de5a5c:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de5a60:	f006 fac2 	bl	c0debfe8 <pic>
c0de5a64:	4601      	mov	r1, r0
c0de5a66:	200b      	movs	r0, #11
c0de5a68:	2301      	movs	r3, #1
c0de5a6a:	f884 6020 	strb.w	r6, [r4, #32]
c0de5a6e:	75a6      	strb	r6, [r4, #22]
c0de5a70:	f884 0022 	strb.w	r0, [r4, #34]	@ 0x22
c0de5a74:	2001      	movs	r0, #1
c0de5a76:	0e0a      	lsrs	r2, r1, #24
c0de5a78:	f884 0024 	strb.w	r0, [r4, #36]	@ 0x24
c0de5a7c:	2000      	movs	r0, #0
c0de5a7e:	f884 0021 	strb.w	r0, [r4, #33]	@ 0x21
c0de5a82:	4620      	mov	r0, r4
c0de5a84:	f002 f861 	bl	c0de7b4a <OUTLINED_FUNCTION_13>
c0de5a88:	f884 0027 	strb.w	r0, [r4, #39]	@ 0x27
c0de5a8c:	f89a 2005 	ldrb.w	r2, [sl, #5]
c0de5a90:	f89a 0004 	ldrb.w	r0, [sl, #4]
c0de5a94:	7162      	strb	r2, [r4, #5]
c0de5a96:	7120      	strb	r0, [r4, #4]
c0de5a98:	ea40 2202 	orr.w	r2, r0, r2, lsl #8
c0de5a9c:	f002 f9a3 	bl	c0de7de6 <OUTLINED_FUNCTION_43>
c0de5aa0:	4651      	mov	r1, sl
c0de5aa2:	46ac      	mov	ip, r5
c0de5aa4:	f811 bf22 	ldrb.w	fp, [r1, #34]!
c0de5aa8:	f811 8d1c 	ldrb.w	r8, [r1, #-28]!
c0de5aac:	7f4d      	ldrb	r5, [r1, #29]
c0de5aae:	7fce      	ldrb	r6, [r1, #31]
c0de5ab0:	7f8b      	ldrb	r3, [r1, #30]
c0de5ab2:	7e8a      	ldrb	r2, [r1, #26]
c0de5ab4:	f891 e001 	ldrb.w	lr, [r1, #1]
c0de5ab8:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de5abc:	ea4b 2505 	orr.w	r5, fp, r5, lsl #8
c0de5ac0:	ea45 4303 	orr.w	r3, r5, r3, lsl #16
c0de5ac4:	2500      	movs	r5, #0
c0de5ac6:	f843 4022 	str.w	r4, [r3, r2, lsl #2]
c0de5aca:	f100 030c 	add.w	r3, r0, #12
c0de5ace:	3201      	adds	r2, #1
c0de5ad0:	eba5 0353 	sub.w	r3, r5, r3, lsr #1
c0de5ad4:	2502      	movs	r5, #2
c0de5ad6:	767b      	strb	r3, [r7, #25]
c0de5ad8:	0a1b      	lsrs	r3, r3, #8
c0de5ada:	76bb      	strb	r3, [r7, #26]
c0de5adc:	0a03      	lsrs	r3, r0, #8
c0de5ade:	71a0      	strb	r0, [r4, #6]
c0de5ae0:	71e3      	strb	r3, [r4, #7]
c0de5ae2:	9b00      	ldr	r3, [sp, #0]
c0de5ae4:	b21b      	sxth	r3, r3
c0de5ae6:	330c      	adds	r3, #12
c0de5ae8:	fb93 f3f5 	sdiv	r3, r3, r5
c0de5aec:	7663      	strb	r3, [r4, #25]
c0de5aee:	768a      	strb	r2, [r1, #26]
c0de5af0:	ea48 220e 	orr.w	r2, r8, lr, lsl #8
c0de5af4:	0a1d      	lsrs	r5, r3, #8
c0de5af6:	4410      	add	r0, r2
c0de5af8:	76a5      	strb	r5, [r4, #26]
c0de5afa:	4665      	mov	r5, ip
c0de5afc:	300c      	adds	r0, #12
c0de5afe:	7008      	strb	r0, [r1, #0]
c0de5b00:	0a00      	lsrs	r0, r0, #8
c0de5b02:	7048      	strb	r0, [r1, #1]
c0de5b04:	f8d5 00a0 	ldr.w	r0, [r5, #160]	@ 0xa0
c0de5b08:	f002 f8b6 	bl	c0de7c78 <OUTLINED_FUNCTION_27>
c0de5b0c:	f8d5 00a0 	ldr.w	r0, [r5, #160]	@ 0xa0
c0de5b10:	f001 ff5c 	bl	c0de79cc <OUTLINED_FUNCTION_1>
c0de5b14:	4650      	mov	r0, sl
c0de5b16:	b004      	add	sp, #16
c0de5b18:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de5b1c:	00001908 	.word	0x00001908

c0de5b20 <nbgl_layoutAddSwitch>:
c0de5b20:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de5b22:	b1d8      	cbz	r0, c0de5b5c <nbgl_layoutAddSwitch+0x3c>
c0de5b24:	2200      	movs	r2, #0
c0de5b26:	e9cd 2201 	strd	r2, r2, [sp, #4]
c0de5b2a:	f88d 2016 	strb.w	r2, [sp, #22]
c0de5b2e:	2201      	movs	r2, #1
c0de5b30:	f88d 2000 	strb.w	r2, [sp]
c0de5b34:	e9d1 2300 	ldrd	r2, r3, [r1]
c0de5b38:	e9cd 2303 	strd	r2, r3, [sp, #12]
c0de5b3c:	7a4a      	ldrb	r2, [r1, #9]
c0de5b3e:	f88d 2014 	strb.w	r2, [sp, #20]
c0de5b42:	7a8a      	ldrb	r2, [r1, #10]
c0de5b44:	7a09      	ldrb	r1, [r1, #8]
c0de5b46:	f88d 1015 	strb.w	r1, [sp, #21]
c0de5b4a:	4669      	mov	r1, sp
c0de5b4c:	f88d 2017 	strb.w	r2, [sp, #23]
c0de5b50:	f7ff fe0a 	bl	c0de5768 <addListItem>
c0de5b54:	b110      	cbz	r0, c0de5b5c <nbgl_layoutAddSwitch+0x3c>
c0de5b56:	f002 f99c 	bl	c0de7e92 <OUTLINED_FUNCTION_55>
c0de5b5a:	e001      	b.n	c0de5b60 <nbgl_layoutAddSwitch+0x40>
c0de5b5c:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de5b60:	b006      	add	sp, #24
c0de5b62:	bd80      	pop	{r7, pc}

c0de5b64 <nbgl_layoutAddText>:
c0de5b64:	b5e0      	push	{r5, r6, r7, lr}
c0de5b66:	2300      	movs	r3, #0
c0de5b68:	e9cd 3300 	strd	r3, r3, [sp]
c0de5b6c:	2300      	movs	r3, #0
c0de5b6e:	f000 f801 	bl	c0de5b74 <addText>
c0de5b72:	bd8c      	pop	{r2, r3, r7, pc}

c0de5b74 <addText>:
c0de5b74:	2800      	cmp	r0, #0
c0de5b76:	f000 8115 	beq.w	c0de5da4 <addText+0x230>
c0de5b7a:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de5b7e:	4683      	mov	fp, r0
c0de5b80:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de5b84:	460c      	mov	r4, r1
c0de5b86:	9e0d      	ldr	r6, [sp, #52]	@ 0x34
c0de5b88:	461f      	mov	r7, r3
c0de5b8a:	9203      	str	r2, [sp, #12]
c0de5b8c:	f04f 0a01 	mov.w	sl, #1
c0de5b90:	f002 f801 	bl	c0de7b96 <OUTLINED_FUNCTION_16>
c0de5b94:	4605      	mov	r5, r0
c0de5b96:	2002      	movs	r0, #2
c0de5b98:	2e00      	cmp	r6, #0
c0de5b9a:	bf18      	it	ne
c0de5b9c:	2003      	movne	r0, #3
c0de5b9e:	f89b 10ad 	ldrb.w	r1, [fp, #173]	@ 0xad
c0de5ba2:	f002 f9eb 	bl	c0de7f7c <OUTLINED_FUNCTION_74>
c0de5ba6:	21a0      	movs	r1, #160	@ 0xa0
c0de5ba8:	0e02      	lsrs	r2, r0, #24
c0de5baa:	f04f 0800 	mov.w	r8, #0
c0de5bae:	f885 a005 	strb.w	sl, [r5, #5]
c0de5bb2:	7129      	strb	r1, [r5, #4]
c0de5bb4:	4629      	mov	r1, r5
c0de5bb6:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de5bba:	70ca      	strb	r2, [r1, #3]
c0de5bbc:	0c02      	lsrs	r2, r0, #16
c0de5bbe:	0a00      	lsrs	r0, r0, #8
c0de5bc0:	2c00      	cmp	r4, #0
c0de5bc2:	708a      	strb	r2, [r1, #2]
c0de5bc4:	f885 0023 	strb.w	r0, [r5, #35]	@ 0x23
c0de5bc8:	f000 809f 	beq.w	c0de5d0a <addText+0x196>
c0de5bcc:	f89b 00ad 	ldrb.w	r0, [fp, #173]	@ 0xad
c0de5bd0:	9701      	str	r7, [sp, #4]
c0de5bd2:	2604      	movs	r6, #4
c0de5bd4:	f001 fef6 	bl	c0de79c4 <OUTLINED_FUNCTION_0>
c0de5bd8:	4607      	mov	r7, r0
c0de5bda:	f880 801f 	strb.w	r8, [r0, #31]
c0de5bde:	4620      	mov	r0, r4
c0de5be0:	9402      	str	r4, [sp, #8]
c0de5be2:	f006 fa01 	bl	c0debfe8 <pic>
c0de5be6:	4601      	mov	r1, r0
c0de5be8:	201c      	movs	r0, #28
c0de5bea:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
c0de5bec:	f887 a024 	strb.w	sl, [r7, #36]	@ 0x24
c0de5bf0:	f887 801a 	strb.w	r8, [r7, #26]
c0de5bf4:	f887 6020 	strb.w	r6, [r7, #32]
c0de5bf8:	f887 8021 	strb.w	r8, [r7, #33]	@ 0x21
c0de5bfc:	f887 8016 	strb.w	r8, [r7, #22]
c0de5c00:	7678      	strb	r0, [r7, #25]
c0de5c02:	200c      	movs	r0, #12
c0de5c04:	0e0a      	lsrs	r2, r1, #24
c0de5c06:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de5c0a:	4638      	mov	r0, r7
c0de5c0c:	469a      	mov	sl, r3
c0de5c0e:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de5c12:	f002 f8f7 	bl	c0de7e04 <OUTLINED_FUNCTION_45>
c0de5c16:	796a      	ldrb	r2, [r5, #5]
c0de5c18:	7928      	ldrb	r0, [r5, #4]
c0de5c1a:	7138      	strb	r0, [r7, #4]
c0de5c1c:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de5c20:	717a      	strb	r2, [r7, #5]
c0de5c22:	b153      	cbz	r3, c0de5c3a <addText+0xc6>
c0de5c24:	4a71      	ldr	r2, [pc, #452]	@ (c0de5dec <addText+0x278>)
c0de5c26:	447a      	add	r2, pc
c0de5c28:	7813      	ldrb	r3, [r2, #0]
c0de5c2a:	7852      	ldrb	r2, [r2, #1]
c0de5c2c:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de5c30:	1a80      	subs	r0, r0, r2
c0de5c32:	380c      	subs	r0, #12
c0de5c34:	0a02      	lsrs	r2, r0, #8
c0de5c36:	7138      	strb	r0, [r7, #4]
c0de5c38:	717a      	strb	r2, [r7, #5]
c0de5c3a:	b282      	uxth	r2, r0
c0de5c3c:	200c      	movs	r0, #12
c0de5c3e:	2301      	movs	r3, #1
c0de5c40:	f006 f80a 	bl	c0debc58 <nbgl_getTextHeightInWidth>
c0de5c44:	4629      	mov	r1, r5
c0de5c46:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de5c4a:	784e      	ldrb	r6, [r1, #1]
c0de5c4c:	788c      	ldrb	r4, [r1, #2]
c0de5c4e:	78ca      	ldrb	r2, [r1, #3]
c0de5c50:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de5c54:	ea4c 2606 	orr.w	r6, ip, r6, lsl #8
c0de5c58:	ea44 2202 	orr.w	r2, r4, r2, lsl #8
c0de5c5c:	ea46 4202 	orr.w	r2, r6, r2, lsl #16
c0de5c60:	f842 7023 	str.w	r7, [r2, r3, lsl #2]
c0de5c64:	0a02      	lsrs	r2, r0, #8
c0de5c66:	71b8      	strb	r0, [r7, #6]
c0de5c68:	71fa      	strb	r2, [r7, #7]
c0de5c6a:	1c5a      	adds	r2, r3, #1
c0de5c6c:	f801 2c02 	strb.w	r2, [r1, #-2]
c0de5c70:	7e79      	ldrb	r1, [r7, #25]
c0de5c72:	7eba      	ldrb	r2, [r7, #26]
c0de5c74:	f1ba 0f00 	cmp.w	sl, #0
c0de5c78:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de5c7c:	eb01 0800 	add.w	r8, r1, r0
c0de5c80:	d042      	beq.n	c0de5d08 <addText+0x194>
c0de5c82:	f89b 00ad 	ldrb.w	r0, [fp, #173]	@ 0xad
c0de5c86:	f8dd a030 	ldr.w	sl, [sp, #48]	@ 0x30
c0de5c8a:	f001 ffb7 	bl	c0de7bfc <OUTLINED_FUNCTION_21>
c0de5c8e:	9a01      	ldr	r2, [sp, #4]
c0de5c90:	4606      	mov	r6, r0
c0de5c92:	4658      	mov	r0, fp
c0de5c94:	4629      	mov	r1, r5
c0de5c96:	2309      	movs	r3, #9
c0de5c98:	f7fe fb72 	bl	c0de4380 <layoutAddCallbackObj>
c0de5c9c:	4954      	ldr	r1, [pc, #336]	@ (c0de5df0 <addText+0x27c>)
c0de5c9e:	4479      	add	r1, pc
c0de5ca0:	0a0a      	lsrs	r2, r1, #8
c0de5ca2:	0e0b      	lsrs	r3, r1, #24
c0de5ca4:	f886 2022 	strb.w	r2, [r6, #34]	@ 0x22
c0de5ca8:	0a3a      	lsrs	r2, r7, #8
c0de5caa:	74f2      	strb	r2, [r6, #19]
c0de5cac:	4632      	mov	r2, r6
c0de5cae:	f802 1f21 	strb.w	r1, [r2, #33]!
c0de5cb2:	0c09      	lsrs	r1, r1, #16
c0de5cb4:	7091      	strb	r1, [r2, #2]
c0de5cb6:	4631      	mov	r1, r6
c0de5cb8:	70d3      	strb	r3, [r2, #3]
c0de5cba:	0e3a      	lsrs	r2, r7, #24
c0de5cbc:	f002 f93c 	bl	c0de7f38 <OUTLINED_FUNCTION_69>
c0de5cc0:	4629      	mov	r1, r5
c0de5cc2:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de5cc6:	784c      	ldrb	r4, [r1, #1]
c0de5cc8:	788f      	ldrb	r7, [r1, #2]
c0de5cca:	78ca      	ldrb	r2, [r1, #3]
c0de5ccc:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de5cd0:	ea4c 2404 	orr.w	r4, ip, r4, lsl #8
c0de5cd4:	ea47 2202 	orr.w	r2, r7, r2, lsl #8
c0de5cd8:	ea44 4202 	orr.w	r2, r4, r2, lsl #16
c0de5cdc:	240c      	movs	r4, #12
c0de5cde:	f842 6023 	str.w	r6, [r2, r3, lsl #2]
c0de5ce2:	2200      	movs	r2, #0
c0de5ce4:	75f4      	strb	r4, [r6, #23]
c0de5ce6:	f880 a005 	strb.w	sl, [r0, #5]
c0de5cea:	2001      	movs	r0, #1
c0de5cec:	75b4      	strb	r4, [r6, #22]
c0de5cee:	7632      	strb	r2, [r6, #24]
c0de5cf0:	77f2      	strb	r2, [r6, #31]
c0de5cf2:	f801 0c06 	strb.w	r0, [r1, #-6]
c0de5cf6:	f10a 000f 	add.w	r0, sl, #15
c0de5cfa:	f801 2c05 	strb.w	r2, [r1, #-5]
c0de5cfe:	f801 0c04 	strb.w	r0, [r1, #-4]
c0de5d02:	1c58      	adds	r0, r3, #1
c0de5d04:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de5d08:	9c02      	ldr	r4, [sp, #8]
c0de5d0a:	9e03      	ldr	r6, [sp, #12]
c0de5d0c:	2e00      	cmp	r6, #0
c0de5d0e:	d04b      	beq.n	c0de5da8 <addText+0x234>
c0de5d10:	f89b 00ad 	ldrb.w	r0, [fp, #173]	@ 0xad
c0de5d14:	f001 fe56 	bl	c0de79c4 <OUTLINED_FUNCTION_0>
c0de5d18:	f04f 0a00 	mov.w	sl, #0
c0de5d1c:	4607      	mov	r7, r0
c0de5d1e:	f880 a01f 	strb.w	sl, [r0, #31]
c0de5d22:	f002 f906 	bl	c0de7f32 <OUTLINED_FUNCTION_68>
c0de5d26:	4601      	mov	r1, r0
c0de5d28:	200b      	movs	r0, #11
c0de5d2a:	2301      	movs	r3, #1
c0de5d2c:	f887 a021 	strb.w	sl, [r7, #33]	@ 0x21
c0de5d30:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de5d34:	2001      	movs	r0, #1
c0de5d36:	0e0a      	lsrs	r2, r1, #24
c0de5d38:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de5d3c:	4638      	mov	r0, r7
c0de5d3e:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de5d42:	f002 f85f 	bl	c0de7e04 <OUTLINED_FUNCTION_45>
c0de5d46:	796a      	ldrb	r2, [r5, #5]
c0de5d48:	7928      	ldrb	r0, [r5, #4]
c0de5d4a:	717a      	strb	r2, [r7, #5]
c0de5d4c:	7138      	strb	r0, [r7, #4]
c0de5d4e:	ea40 2202 	orr.w	r2, r0, r2, lsl #8
c0de5d52:	f002 f848 	bl	c0de7de6 <OUTLINED_FUNCTION_43>
c0de5d56:	210e      	movs	r1, #14
c0de5d58:	f887 a01a 	strb.w	sl, [r7, #26]
c0de5d5c:	462a      	mov	r2, r5
c0de5d5e:	2c00      	cmp	r4, #0
c0de5d60:	bf08      	it	eq
c0de5d62:	211a      	moveq	r1, #26
c0de5d64:	7679      	strb	r1, [r7, #25]
c0de5d66:	f887 a016 	strb.w	sl, [r7, #22]
c0de5d6a:	f812 cf22 	ldrb.w	ip, [r2, #34]!
c0de5d6e:	7856      	ldrb	r6, [r2, #1]
c0de5d70:	f892 e002 	ldrb.w	lr, [r2, #2]
c0de5d74:	78d3      	ldrb	r3, [r2, #3]
c0de5d76:	f812 4c02 	ldrb.w	r4, [r2, #-2]
c0de5d7a:	ea4c 2606 	orr.w	r6, ip, r6, lsl #8
c0de5d7e:	ea4e 2303 	orr.w	r3, lr, r3, lsl #8
c0de5d82:	ea46 4303 	orr.w	r3, r6, r3, lsl #16
c0de5d86:	f843 7024 	str.w	r7, [r3, r4, lsl #2]
c0de5d8a:	2304      	movs	r3, #4
c0de5d8c:	71b8      	strb	r0, [r7, #6]
c0de5d8e:	f887 3020 	strb.w	r3, [r7, #32]
c0de5d92:	0a03      	lsrs	r3, r0, #8
c0de5d94:	4440      	add	r0, r8
c0de5d96:	4408      	add	r0, r1
c0de5d98:	71fb      	strb	r3, [r7, #7]
c0de5d9a:	1c63      	adds	r3, r4, #1
c0de5d9c:	f802 3c02 	strb.w	r3, [r2, #-2]
c0de5da0:	301a      	adds	r0, #26
c0de5da2:	e003      	b.n	c0de5dac <addText+0x238>
c0de5da4:	f001 bfca 	b.w	c0de7d3c <OUTLINED_FUNCTION_35>
c0de5da8:	f108 001c 	add.w	r0, r8, #28
c0de5dac:	f8db 10a0 	ldr.w	r1, [fp, #160]	@ 0xa0
c0de5db0:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de5db4:	784c      	ldrb	r4, [r1, #1]
c0de5db6:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de5dba:	788e      	ldrb	r6, [r1, #2]
c0de5dbc:	78c9      	ldrb	r1, [r1, #3]
c0de5dbe:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de5dc2:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de5dc6:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de5dca:	2220      	movs	r2, #32
c0de5dcc:	f841 5023 	str.w	r5, [r1, r3, lsl #2]
c0de5dd0:	2100      	movs	r1, #0
c0de5dd2:	71a8      	strb	r0, [r5, #6]
c0de5dd4:	75ea      	strb	r2, [r5, #23]
c0de5dd6:	7629      	strb	r1, [r5, #24]
c0de5dd8:	77e9      	strb	r1, [r5, #31]
c0de5dda:	75a9      	strb	r1, [r5, #22]
c0de5ddc:	0a01      	lsrs	r1, r0, #8
c0de5dde:	b280      	uxth	r0, r0
c0de5de0:	71e9      	strb	r1, [r5, #7]
c0de5de2:	f8db 10a0 	ldr.w	r1, [fp, #160]	@ 0xa0
c0de5de6:	f002 b84c 	b.w	c0de7e82 <OUTLINED_FUNCTION_54>
c0de5dea:	bf00      	nop
c0de5dec:	000077dc 	.word	0x000077dc
c0de5df0:	0000749f 	.word	0x0000749f

c0de5df4 <nbgl_layoutAddTextWithAlias>:
c0de5df4:	b51c      	push	{r2, r3, r4, lr}
c0de5df6:	2401      	movs	r4, #1
c0de5df8:	9401      	str	r4, [sp, #4]
c0de5dfa:	9c04      	ldr	r4, [sp, #16]
c0de5dfc:	9400      	str	r4, [sp, #0]
c0de5dfe:	f7ff feb9 	bl	c0de5b74 <addText>
c0de5e02:	bd1c      	pop	{r2, r3, r4, pc}

c0de5e04 <nbgl_layoutAddTextContent>:
c0de5e04:	2800      	cmp	r0, #0
c0de5e06:	f000 80b5 	beq.w	c0de5f74 <nbgl_layoutAddTextContent+0x170>
c0de5e0a:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de5e0e:	4682      	mov	sl, r0
c0de5e10:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de5e14:	4e58      	ldr	r6, [pc, #352]	@ (c0de5f78 <nbgl_layoutAddTextContent+0x174>)
c0de5e16:	460d      	mov	r5, r1
c0de5e18:	e9cd 2302 	strd	r2, r3, [sp, #8]
c0de5e1c:	08c1      	lsrs	r1, r0, #3
c0de5e1e:	447e      	add	r6, pc
c0de5e20:	2004      	movs	r0, #4
c0de5e22:	47b0      	blx	r6
c0de5e24:	f04f 0b00 	mov.w	fp, #0
c0de5e28:	4607      	mov	r7, r0
c0de5e2a:	f880 b01f 	strb.w	fp, [r0, #31]
c0de5e2e:	4628      	mov	r0, r5
c0de5e30:	4c52      	ldr	r4, [pc, #328]	@ (c0de5f7c <nbgl_layoutAddTextContent+0x178>)
c0de5e32:	447c      	add	r4, pc
c0de5e34:	47a0      	blx	r4
c0de5e36:	4601      	mov	r1, r0
c0de5e38:	2010      	movs	r0, #16
c0de5e3a:	2201      	movs	r2, #1
c0de5e3c:	9401      	str	r4, [sp, #4]
c0de5e3e:	f887 b01a 	strb.w	fp, [r7, #26]
c0de5e42:	f887 b018 	strb.w	fp, [r7, #24]
c0de5e46:	f887 b021 	strb.w	fp, [r7, #33]	@ 0x21
c0de5e4a:	f887 b016 	strb.w	fp, [r7, #22]
c0de5e4e:	2301      	movs	r3, #1
c0de5e50:	46a0      	mov	r8, r4
c0de5e52:	7678      	strb	r0, [r7, #25]
c0de5e54:	2020      	movs	r0, #32
c0de5e56:	717a      	strb	r2, [r7, #5]
c0de5e58:	f887 2024 	strb.w	r2, [r7, #36]	@ 0x24
c0de5e5c:	0e0a      	lsrs	r2, r1, #24
c0de5e5e:	75f8      	strb	r0, [r7, #23]
c0de5e60:	20a0      	movs	r0, #160	@ 0xa0
c0de5e62:	7138      	strb	r0, [r7, #4]
c0de5e64:	200d      	movs	r0, #13
c0de5e66:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de5e6a:	2004      	movs	r0, #4
c0de5e6c:	f887 0020 	strb.w	r0, [r7, #32]
c0de5e70:	4638      	mov	r0, r7
c0de5e72:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de5e76:	70c2      	strb	r2, [r0, #3]
c0de5e78:	0c0a      	lsrs	r2, r1, #16
c0de5e7a:	7082      	strb	r2, [r0, #2]
c0de5e7c:	0a08      	lsrs	r0, r1, #8
c0de5e7e:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de5e82:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de5e86:	200d      	movs	r0, #13
c0de5e88:	4d3d      	ldr	r5, [pc, #244]	@ (c0de5f80 <nbgl_layoutAddTextContent+0x17c>)
c0de5e8a:	447d      	add	r5, pc
c0de5e8c:	47a8      	blx	r5
c0de5e8e:	f8da 10a0 	ldr.w	r1, [sl, #160]	@ 0xa0
c0de5e92:	f001 fecc 	bl	c0de7c2e <OUTLINED_FUNCTION_24>
c0de5e96:	71b8      	strb	r0, [r7, #6]
c0de5e98:	0a00      	lsrs	r0, r0, #8
c0de5e9a:	71f8      	strb	r0, [r7, #7]
c0de5e9c:	f001 ff42 	bl	c0de7d24 <OUTLINED_FUNCTION_34>
c0de5ea0:	4607      	mov	r7, r0
c0de5ea2:	f880 b01f 	strb.w	fp, [r0, #31]
c0de5ea6:	9802      	ldr	r0, [sp, #8]
c0de5ea8:	47c0      	blx	r8
c0de5eaa:	4601      	mov	r1, r0
c0de5eac:	2001      	movs	r0, #1
c0de5eae:	22a0      	movs	r2, #160	@ 0xa0
c0de5eb0:	2301      	movs	r3, #1
c0de5eb2:	f04f 0801 	mov.w	r8, #1
c0de5eb6:	f887 b021 	strb.w	fp, [r7, #33]	@ 0x21
c0de5eba:	713a      	strb	r2, [r7, #4]
c0de5ebc:	220b      	movs	r2, #11
c0de5ebe:	7178      	strb	r0, [r7, #5]
c0de5ec0:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de5ec4:	4638      	mov	r0, r7
c0de5ec6:	f887 2022 	strb.w	r2, [r7, #34]	@ 0x22
c0de5eca:	f001 ffc6 	bl	c0de7e5a <OUTLINED_FUNCTION_52>
c0de5ece:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de5ed2:	200b      	movs	r0, #11
c0de5ed4:	47a8      	blx	r5
c0de5ed6:	f8da 10a0 	ldr.w	r1, [sl, #160]	@ 0xa0
c0de5eda:	f887 b01a 	strb.w	fp, [r7, #26]
c0de5ede:	f887 b018 	strb.w	fp, [r7, #24]
c0de5ee2:	f887 b016 	strb.w	fp, [r7, #22]
c0de5ee6:	f001 fea2 	bl	c0de7c2e <OUTLINED_FUNCTION_24>
c0de5eea:	2104      	movs	r1, #4
c0de5eec:	71b8      	strb	r0, [r7, #6]
c0de5eee:	0a00      	lsrs	r0, r0, #8
c0de5ef0:	f887 1020 	strb.w	r1, [r7, #32]
c0de5ef4:	2118      	movs	r1, #24
c0de5ef6:	71f8      	strb	r0, [r7, #7]
c0de5ef8:	7679      	strb	r1, [r7, #25]
c0de5efa:	2120      	movs	r1, #32
c0de5efc:	75f9      	strb	r1, [r7, #23]
c0de5efe:	f001 ff11 	bl	c0de7d24 <OUTLINED_FUNCTION_34>
c0de5f02:	4606      	mov	r6, r0
c0de5f04:	f880 801f 	strb.w	r8, [r0, #31]
c0de5f08:	9803      	ldr	r0, [sp, #12]
c0de5f0a:	9901      	ldr	r1, [sp, #4]
c0de5f0c:	4788      	blx	r1
c0de5f0e:	4601      	mov	r1, r0
c0de5f10:	20a0      	movs	r0, #160	@ 0xa0
c0de5f12:	2301      	movs	r3, #1
c0de5f14:	f886 8005 	strb.w	r8, [r6, #5]
c0de5f18:	f886 8024 	strb.w	r8, [r6, #36]	@ 0x24
c0de5f1c:	f886 b021 	strb.w	fp, [r6, #33]	@ 0x21
c0de5f20:	7130      	strb	r0, [r6, #4]
c0de5f22:	200b      	movs	r0, #11
c0de5f24:	0e0a      	lsrs	r2, r1, #24
c0de5f26:	f001 fec9 	bl	c0de7cbc <OUTLINED_FUNCTION_30>
c0de5f2a:	47a8      	blx	r5
c0de5f2c:	f8da 10a0 	ldr.w	r1, [sl, #160]	@ 0xa0
c0de5f30:	f886 b01a 	strb.w	fp, [r6, #26]
c0de5f34:	f886 b018 	strb.w	fp, [r6, #24]
c0de5f38:	f001 fdb0 	bl	c0de7a9c <OUTLINED_FUNCTION_8>
c0de5f3c:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
c0de5f40:	2128      	movs	r1, #40	@ 0x28
c0de5f42:	71b0      	strb	r0, [r6, #6]
c0de5f44:	0a00      	lsrs	r0, r0, #8
c0de5f46:	7671      	strb	r1, [r6, #25]
c0de5f48:	2120      	movs	r1, #32
c0de5f4a:	71f0      	strb	r0, [r6, #7]
c0de5f4c:	75f1      	strb	r1, [r6, #23]
c0de5f4e:	2104      	movs	r1, #4
c0de5f50:	f8da 00a0 	ldr.w	r0, [sl, #160]	@ 0xa0
c0de5f54:	f886 1020 	strb.w	r1, [r6, #32]
c0de5f58:	2107      	movs	r1, #7
c0de5f5a:	75b1      	strb	r1, [r6, #22]
c0de5f5c:	f890 3020 	ldrb.w	r3, [r0, #32]
c0de5f60:	7981      	ldrb	r1, [r0, #6]
c0de5f62:	79c2      	ldrb	r2, [r0, #7]
c0de5f64:	3301      	adds	r3, #1
c0de5f66:	f880 3020 	strb.w	r3, [r0, #32]
c0de5f6a:	ea41 2002 	orr.w	r0, r1, r2, lsl #8
c0de5f6e:	b004      	add	sp, #16
c0de5f70:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de5f74:	f001 bee2 	b.w	c0de7d3c <OUTLINED_FUNCTION_35>
c0de5f78:	00005e05 	.word	0x00005e05
c0de5f7c:	000061b3 	.word	0x000061b3
c0de5f80:	00005dcb 	.word	0x00005dcb

c0de5f84 <nbgl_layoutAddRadioChoice>:
c0de5f84:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de5f88:	2800      	cmp	r0, #0
c0de5f8a:	f000 8102 	beq.w	c0de6192 <nbgl_layoutAddRadioChoice+0x20e>
c0de5f8e:	4605      	mov	r5, r0
c0de5f90:	4884      	ldr	r0, [pc, #528]	@ (c0de61a4 <nbgl_layoutAddRadioChoice+0x220>)
c0de5f92:	468a      	mov	sl, r1
c0de5f94:	f04f 0800 	mov.w	r8, #0
c0de5f98:	e9cd 1501 	strd	r1, r5, [sp, #4]
c0de5f9c:	4478      	add	r0, pc
c0de5f9e:	9003      	str	r0, [sp, #12]
c0de5fa0:	f89a 0005 	ldrb.w	r0, [sl, #5]
c0de5fa4:	4580      	cmp	r8, r0
c0de5fa6:	f080 80f7 	bcs.w	c0de6198 <nbgl_layoutAddRadioChoice+0x214>
c0de5faa:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de5fae:	9c03      	ldr	r4, [sp, #12]
c0de5fb0:	08c1      	lsrs	r1, r0, #3
c0de5fb2:	2001      	movs	r0, #1
c0de5fb4:	47a0      	blx	r4
c0de5fb6:	4606      	mov	r6, r0
c0de5fb8:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de5fbc:	08c1      	lsrs	r1, r0, #3
c0de5fbe:	2004      	movs	r0, #4
c0de5fc0:	47a0      	blx	r4
c0de5fc2:	4607      	mov	r7, r0
c0de5fc4:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de5fc8:	08c1      	lsrs	r1, r0, #3
c0de5fca:	2009      	movs	r0, #9
c0de5fcc:	47a0      	blx	r4
c0de5fce:	f89a 2007 	ldrb.w	r2, [sl, #7]
c0de5fd2:	f89a 3008 	ldrb.w	r3, [sl, #8]
c0de5fd6:	4604      	mov	r4, r0
c0de5fd8:	4628      	mov	r0, r5
c0de5fda:	f001 fe0c 	bl	c0de7bf6 <OUTLINED_FUNCTION_20>
c0de5fde:	2800      	cmp	r0, #0
c0de5fe0:	f000 80d7 	beq.w	c0de6192 <nbgl_layoutAddRadioChoice+0x20e>
c0de5fe4:	2002      	movs	r0, #2
c0de5fe6:	f886 0020 	strb.w	r0, [r6, #32]
c0de5fea:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de5fee:	08c1      	lsrs	r1, r0, #3
c0de5ff0:	2002      	movs	r0, #2
c0de5ff2:	f005 fe1d 	bl	c0debc30 <nbgl_containerPoolGet>
c0de5ff6:	2300      	movs	r3, #0
c0de5ff8:	ea4f 2c16 	mov.w	ip, r6, lsr #8
c0de5ffc:	4631      	mov	r1, r6
c0de5ffe:	0e02      	lsrs	r2, r0, #24
c0de6000:	4655      	mov	r5, sl
c0de6002:	ea4f 6a16 	mov.w	sl, r6, lsr #24
c0de6006:	ea4f 4b16 	mov.w	fp, r6, lsr #16
c0de600a:	74f3      	strb	r3, [r6, #19]
c0de600c:	f884 c013 	strb.w	ip, [r4, #19]
c0de6010:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de6014:	70ca      	strb	r2, [r1, #3]
c0de6016:	0c02      	lsrs	r2, r0, #16
c0de6018:	708a      	strb	r2, [r1, #2]
c0de601a:	0a01      	lsrs	r1, r0, #8
c0de601c:	f886 1023 	strb.w	r1, [r6, #35]	@ 0x23
c0de6020:	4631      	mov	r1, r6
c0de6022:	f801 3f12 	strb.w	r3, [r1, #18]!
c0de6026:	70cb      	strb	r3, [r1, #3]
c0de6028:	708b      	strb	r3, [r1, #2]
c0de602a:	4621      	mov	r1, r4
c0de602c:	f801 6f12 	strb.w	r6, [r1, #18]!
c0de6030:	f881 b002 	strb.w	fp, [r1, #2]
c0de6034:	f881 a003 	strb.w	sl, [r1, #3]
c0de6038:	2120      	movs	r1, #32
c0de603a:	7633      	strb	r3, [r6, #24]
c0de603c:	71f3      	strb	r3, [r6, #7]
c0de603e:	75b3      	strb	r3, [r6, #22]
c0de6040:	75f1      	strb	r1, [r6, #23]
c0de6042:	215c      	movs	r1, #92	@ 0x5c
c0de6044:	71b1      	strb	r1, [r6, #6]
c0de6046:	2101      	movs	r1, #1
c0de6048:	7171      	strb	r1, [r6, #5]
c0de604a:	21a0      	movs	r1, #160	@ 0xa0
c0de604c:	7131      	strb	r1, [r6, #4]
c0de604e:	2102      	movs	r1, #2
c0de6050:	6044      	str	r4, [r0, #4]
c0de6052:	77e3      	strb	r3, [r4, #31]
c0de6054:	f884 3021 	strb.w	r3, [r4, #33]	@ 0x21
c0de6058:	7928      	ldrb	r0, [r5, #4]
c0de605a:	f884 1020 	strb.w	r1, [r4, #32]
c0de605e:	2106      	movs	r1, #6
c0de6060:	75a1      	strb	r1, [r4, #22]
c0de6062:	b110      	cbz	r0, c0de606a <nbgl_layoutAddRadioChoice+0xe6>
c0de6064:	f44f 70d0 	mov.w	r0, #416	@ 0x1a0
c0de6068:	e014      	b.n	c0de6094 <nbgl_layoutAddRadioChoice+0x110>
c0de606a:	6828      	ldr	r0, [r5, #0]
c0de606c:	4665      	mov	r5, ip
c0de606e:	f850 0028 	ldr.w	r0, [r0, r8, lsl #2]
c0de6072:	f005 ffb9 	bl	c0debfe8 <pic>
c0de6076:	4639      	mov	r1, r7
c0de6078:	0e02      	lsrs	r2, r0, #24
c0de607a:	46ac      	mov	ip, r5
c0de607c:	9d01      	ldr	r5, [sp, #4]
c0de607e:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de6082:	70ca      	strb	r2, [r1, #3]
c0de6084:	0c02      	lsrs	r2, r0, #16
c0de6086:	0a00      	lsrs	r0, r0, #8
c0de6088:	708a      	strb	r2, [r1, #2]
c0de608a:	7048      	strb	r0, [r1, #1]
c0de608c:	7930      	ldrb	r0, [r6, #4]
c0de608e:	7971      	ldrb	r1, [r6, #5]
c0de6090:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de6094:	4639      	mov	r1, r7
c0de6096:	f887 c013 	strb.w	ip, [r7, #19]
c0de609a:	4632      	mov	r2, r6
c0de609c:	3828      	subs	r0, #40	@ 0x28
c0de609e:	f801 6f12 	strb.w	r6, [r1, #18]!
c0de60a2:	f881 b002 	strb.w	fp, [r1, #2]
c0de60a6:	f881 a003 	strb.w	sl, [r1, #3]
c0de60aa:	f04f 0b00 	mov.w	fp, #0
c0de60ae:	46aa      	mov	sl, r5
c0de60b0:	f896 1023 	ldrb.w	r1, [r6, #35]	@ 0x23
c0de60b4:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de60b8:	f886 b01d 	strb.w	fp, [r6, #29]
c0de60bc:	f001 ff61 	bl	c0de7f82 <OUTLINED_FUNCTION_75>
c0de60c0:	4b37      	ldr	r3, [pc, #220]	@ (c0de61a0 <nbgl_layoutAddRadioChoice+0x21c>)
c0de60c2:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de60c6:	600f      	str	r7, [r1, #0]
c0de60c8:	f819 1003 	ldrb.w	r1, [r9, r3]
c0de60cc:	1c4a      	adds	r2, r1, #1
c0de60ce:	3114      	adds	r1, #20
c0de60d0:	f809 2003 	strb.w	r2, [r9, r3]
c0de60d4:	2201      	movs	r2, #1
c0de60d6:	77b1      	strb	r1, [r6, #30]
c0de60d8:	2104      	movs	r1, #4
c0de60da:	7732      	strb	r2, [r6, #28]
c0de60dc:	f887 b021 	strb.w	fp, [r7, #33]	@ 0x21
c0de60e0:	f887 1020 	strb.w	r1, [r7, #32]
c0de60e4:	75b9      	strb	r1, [r7, #22]
c0de60e6:	79aa      	ldrb	r2, [r5, #6]
c0de60e8:	eba8 0302 	sub.w	r3, r8, r2
c0de60ec:	fab3 f383 	clz	r3, r3
c0de60f0:	095b      	lsrs	r3, r3, #5
c0de60f2:	f884 3021 	strb.w	r3, [r4, #33]	@ 0x21
c0de60f6:	7138      	strb	r0, [r7, #4]
c0de60f8:	0a00      	lsrs	r0, r0, #8
c0de60fa:	7178      	strb	r0, [r7, #5]
c0de60fc:	ebb8 0002 	subs.w	r0, r8, r2
c0de6100:	bf18      	it	ne
c0de6102:	2001      	movne	r0, #1
c0de6104:	77f8      	strb	r0, [r7, #31]
c0de6106:	4590      	cmp	r8, r2
c0de6108:	f04f 000b 	mov.w	r0, #11
c0de610c:	bf08      	it	eq
c0de610e:	200c      	moveq	r0, #12
c0de6110:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de6114:	f005 fd96 	bl	c0debc44 <nbgl_getFontHeight>
c0de6118:	9d02      	ldr	r5, [sp, #8]
c0de611a:	f887 b007 	strb.w	fp, [r7, #7]
c0de611e:	71b8      	strb	r0, [r7, #6]
c0de6120:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de6124:	08c0      	lsrs	r0, r0, #3
c0de6126:	f000 f83f 	bl	c0de61a8 <createHorizontalLine>
c0de612a:	f8d5 10a0 	ldr.w	r1, [r5, #160]	@ 0xa0
c0de612e:	f108 0801 	add.w	r8, r8, #1
c0de6132:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6136:	784c      	ldrb	r4, [r1, #1]
c0de6138:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de613c:	788f      	ldrb	r7, [r1, #2]
c0de613e:	78c9      	ldrb	r1, [r1, #3]
c0de6140:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de6144:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de6148:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de614c:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
c0de6150:	f8d5 10a0 	ldr.w	r1, [r5, #160]	@ 0xa0
c0de6154:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6158:	784b      	ldrb	r3, [r1, #1]
c0de615a:	788c      	ldrb	r4, [r1, #2]
c0de615c:	78ce      	ldrb	r6, [r1, #3]
c0de615e:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6162:	ea44 2306 	orr.w	r3, r4, r6, lsl #8
c0de6166:	ea42 4203 	orr.w	r2, r2, r3, lsl #16
c0de616a:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de616e:	3301      	adds	r3, #1
c0de6170:	f801 3c02 	strb.w	r3, [r1, #-2]
c0de6174:	21ff      	movs	r1, #255	@ 0xff
c0de6176:	b2dc      	uxtb	r4, r3
c0de6178:	7681      	strb	r1, [r0, #26]
c0de617a:	21fc      	movs	r1, #252	@ 0xfc
c0de617c:	f842 0024 	str.w	r0, [r2, r4, lsl #2]
c0de6180:	7641      	strb	r1, [r0, #25]
c0de6182:	2103      	movs	r1, #3
c0de6184:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de6188:	f8d5 00a0 	ldr.w	r0, [r5, #160]	@ 0xa0
c0de618c:	f001 fc1e 	bl	c0de79cc <OUTLINED_FUNCTION_1>
c0de6190:	e706      	b.n	c0de5fa0 <nbgl_layoutAddRadioChoice+0x1c>
c0de6192:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de6196:	e000      	b.n	c0de619a <nbgl_layoutAddRadioChoice+0x216>
c0de6198:	2000      	movs	r0, #0
c0de619a:	b004      	add	sp, #16
c0de619c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de61a0:	00001908 	.word	0x00001908
c0de61a4:	00005c87 	.word	0x00005c87

c0de61a8 <createHorizontalLine>:
c0de61a8:	b580      	push	{r7, lr}
c0de61aa:	4601      	mov	r1, r0
c0de61ac:	2003      	movs	r0, #3
c0de61ae:	f005 fd3a 	bl	c0debc26 <nbgl_objPoolGet>
c0de61b2:	2100      	movs	r1, #0
c0de61b4:	22e0      	movs	r2, #224	@ 0xe0
c0de61b6:	71c1      	strb	r1, [r0, #7]
c0de61b8:	2104      	movs	r1, #4
c0de61ba:	7102      	strb	r2, [r0, #4]
c0de61bc:	2202      	movs	r2, #2
c0de61be:	7181      	strb	r1, [r0, #6]
c0de61c0:	2101      	movs	r1, #1
c0de61c2:	f880 2020 	strb.w	r2, [r0, #32]
c0de61c6:	7141      	strb	r1, [r0, #5]
c0de61c8:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de61cc:	77c1      	strb	r1, [r0, #31]
c0de61ce:	bd80      	pop	{r7, pc}

c0de61d0 <nbgl_layoutAddCenteredInfo>:
c0de61d0:	b570      	push	{r4, r5, r6, lr}
c0de61d2:	b08a      	sub	sp, #40	@ 0x28
c0de61d4:	ae01      	add	r6, sp, #4
c0de61d6:	460c      	mov	r4, r1
c0de61d8:	4605      	mov	r5, r0
c0de61da:	2124      	movs	r1, #36	@ 0x24
c0de61dc:	4630      	mov	r0, r6
c0de61de:	f006 f925 	bl	c0dec42c <__aeabi_memclr>
c0de61e2:	b33d      	cbz	r5, c0de6234 <nbgl_layoutAddCenteredInfo+0x64>
c0de61e4:	6820      	ldr	r0, [r4, #0]
c0de61e6:	68e1      	ldr	r1, [r4, #12]
c0de61e8:	9102      	str	r1, [sp, #8]
c0de61ea:	b128      	cbz	r0, c0de61f8 <nbgl_layoutAddCenteredInfo+0x28>
c0de61ec:	7c61      	ldrb	r1, [r4, #17]
c0de61ee:	2210      	movs	r2, #16
c0de61f0:	2903      	cmp	r1, #3
c0de61f2:	bf08      	it	eq
c0de61f4:	2214      	moveq	r2, #20
c0de61f6:	50b0      	str	r0, [r6, r2]
c0de61f8:	6860      	ldr	r0, [r4, #4]
c0de61fa:	b128      	cbz	r0, c0de6208 <nbgl_layoutAddCenteredInfo+0x38>
c0de61fc:	7c61      	ldrb	r1, [r4, #17]
c0de61fe:	2218      	movs	r2, #24
c0de6200:	2901      	cmp	r1, #1
c0de6202:	bf08      	it	eq
c0de6204:	2214      	moveq	r2, #20
c0de6206:	50b0      	str	r0, [r6, r2]
c0de6208:	68a0      	ldr	r0, [r4, #8]
c0de620a:	b128      	cbz	r0, c0de6218 <nbgl_layoutAddCenteredInfo+0x48>
c0de620c:	7c61      	ldrb	r1, [r4, #17]
c0de620e:	2218      	movs	r2, #24
c0de6210:	2902      	cmp	r1, #2
c0de6212:	bf08      	it	eq
c0de6214:	221c      	moveq	r2, #28
c0de6216:	50b0      	str	r0, [r6, r2]
c0de6218:	a901      	add	r1, sp, #4
c0de621a:	4628      	mov	r0, r5
c0de621c:	f000 f816 	bl	c0de624c <addContentCenter>
c0de6220:	7c21      	ldrb	r1, [r4, #16]
c0de6222:	b151      	cbz	r1, c0de623a <nbgl_layoutAddCenteredInfo+0x6a>
c0de6224:	2100      	movs	r1, #0
c0de6226:	2220      	movs	r2, #32
c0de6228:	7601      	strb	r1, [r0, #24]
c0de622a:	75c2      	strb	r2, [r0, #23]
c0de622c:	7581      	strb	r1, [r0, #22]
c0de622e:	8a61      	ldrh	r1, [r4, #18]
c0de6230:	3120      	adds	r1, #32
c0de6232:	e003      	b.n	c0de623c <nbgl_layoutAddCenteredInfo+0x6c>
c0de6234:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de6238:	e005      	b.n	c0de6246 <nbgl_layoutAddCenteredInfo+0x76>
c0de623a:	8a61      	ldrh	r1, [r4, #18]
c0de623c:	7641      	strb	r1, [r0, #25]
c0de623e:	0a09      	lsrs	r1, r1, #8
c0de6240:	7681      	strb	r1, [r0, #26]
c0de6242:	f001 fe26 	bl	c0de7e92 <OUTLINED_FUNCTION_55>
c0de6246:	b00a      	add	sp, #40	@ 0x28
c0de6248:	bd70      	pop	{r4, r5, r6, pc}
	...

c0de624c <addContentCenter>:
c0de624c:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de6250:	4606      	mov	r6, r0
c0de6252:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de6256:	468b      	mov	fp, r1
c0de6258:	f001 fc9d 	bl	c0de7b96 <OUTLINED_FUNCTION_16>
c0de625c:	2400      	movs	r4, #0
c0de625e:	4680      	mov	r8, r0
c0de6260:	f880 4020 	strb.w	r4, [r0, #32]
c0de6264:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de6268:	08c1      	lsrs	r1, r0, #3
c0de626a:	2006      	movs	r0, #6
c0de626c:	f005 fce0 	bl	c0debc30 <nbgl_containerPoolGet>
c0de6270:	4641      	mov	r1, r8
c0de6272:	0e02      	lsrs	r2, r0, #24
c0de6274:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de6278:	f001 fdd2 	bl	c0de7e20 <OUTLINED_FUNCTION_47>
c0de627c:	f888 0023 	strb.w	r0, [r8, #35]	@ 0x23
c0de6280:	f8db 0004 	ldr.w	r0, [fp, #4]
c0de6284:	2800      	cmp	r0, #0
c0de6286:	d079      	beq.n	c0de637c <addContentCenter+0x130>
c0de6288:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de628c:	f001 fcb6 	bl	c0de7bfc <OUTLINED_FUNCTION_21>
c0de6290:	4607      	mov	r7, r0
c0de6292:	77c4      	strb	r4, [r0, #31]
c0de6294:	f8db 0004 	ldr.w	r0, [fp, #4]
c0de6298:	f005 fea6 	bl	c0debfe8 <pic>
c0de629c:	4639      	mov	r1, r7
c0de629e:	0e02      	lsrs	r2, r0, #24
c0de62a0:	46b2      	mov	sl, r6
c0de62a2:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de62a6:	70ca      	strb	r2, [r1, #3]
c0de62a8:	0c02      	lsrs	r2, r0, #16
c0de62aa:	708a      	strb	r2, [r1, #2]
c0de62ac:	0a01      	lsrs	r1, r0, #8
c0de62ae:	f887 1022 	strb.w	r1, [r7, #34]	@ 0x22
c0de62b2:	4641      	mov	r1, r8
c0de62b4:	f001 fd28 	bl	c0de7d08 <OUTLINED_FUNCTION_33>
c0de62b8:	f842 7023 	str.w	r7, [r2, r3, lsl #2]
c0de62bc:	2202      	movs	r2, #2
c0de62be:	3301      	adds	r3, #1
c0de62c0:	75ba      	strb	r2, [r7, #22]
c0de62c2:	f8bb 2020 	ldrh.w	r2, [fp, #32]
c0de62c6:	767a      	strb	r2, [r7, #25]
c0de62c8:	f801 3c02 	strb.w	r3, [r1, #-2]
c0de62cc:	0a14      	lsrs	r4, r2, #8
c0de62ce:	7881      	ldrb	r1, [r0, #2]
c0de62d0:	78c0      	ldrb	r0, [r0, #3]
c0de62d2:	76bc      	strb	r4, [r7, #26]
c0de62d4:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de62d8:	4410      	add	r0, r2
c0de62da:	9000      	str	r0, [sp, #0]
c0de62dc:	f89b 0000 	ldrb.w	r0, [fp]
c0de62e0:	2801      	cmp	r0, #1
c0de62e2:	d146      	bne.n	c0de6372 <addContentCenter+0x126>
c0de62e4:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de62e8:	f001 fc88 	bl	c0de7bfc <OUTLINED_FUNCTION_21>
c0de62ec:	4604      	mov	r4, r0
c0de62ee:	2000      	movs	r0, #0
c0de62f0:	77e0      	strb	r0, [r4, #31]
c0de62f2:	f8db 0008 	ldr.w	r0, [fp, #8]
c0de62f6:	6800      	ldr	r0, [r0, #0]
c0de62f8:	6800      	ldr	r0, [r0, #0]
c0de62fa:	f005 fe75 	bl	c0debfe8 <pic>
c0de62fe:	4621      	mov	r1, r4
c0de6300:	0e02      	lsrs	r2, r0, #24
c0de6302:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de6306:	70ca      	strb	r2, [r1, #3]
c0de6308:	0c02      	lsrs	r2, r0, #16
c0de630a:	0a00      	lsrs	r0, r0, #8
c0de630c:	f884 0022 	strb.w	r0, [r4, #34]	@ 0x22
c0de6310:	708a      	strb	r2, [r1, #2]
c0de6312:	4640      	mov	r0, r8
c0de6314:	f001 fd31 	bl	c0de7d7a <OUTLINED_FUNCTION_38>
c0de6318:	f841 4022 	str.w	r4, [r1, r2, lsl #2]
c0de631c:	2102      	movs	r1, #2
c0de631e:	75a1      	strb	r1, [r4, #22]
c0de6320:	f8bb 100c 	ldrh.w	r1, [fp, #12]
c0de6324:	75e1      	strb	r1, [r4, #23]
c0de6326:	0a09      	lsrs	r1, r1, #8
c0de6328:	f8bb 3020 	ldrh.w	r3, [fp, #32]
c0de632c:	f8bb 500e 	ldrh.w	r5, [fp, #14]
c0de6330:	7621      	strb	r1, [r4, #24]
c0de6332:	1c51      	adds	r1, r2, #1
c0de6334:	442b      	add	r3, r5
c0de6336:	7663      	strb	r3, [r4, #25]
c0de6338:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de633c:	0a18      	lsrs	r0, r3, #8
c0de633e:	76a0      	strb	r0, [r4, #26]
c0de6340:	2000      	movs	r0, #0
c0de6342:	f88a 00af 	strb.w	r0, [sl, #175]	@ 0xaf
c0de6346:	f8db 0008 	ldr.w	r0, [fp, #8]
c0de634a:	f8ca 00a4 	str.w	r0, [sl, #164]	@ 0xa4
c0de634e:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de6352:	f040 0104 	orr.w	r1, r0, #4
c0de6356:	08c0      	lsrs	r0, r0, #3
c0de6358:	f88a 10ad 	strb.w	r1, [sl, #173]	@ 0xad
c0de635c:	49b2      	ldr	r1, [pc, #712]	@ (c0de6628 <addContentCenter+0x3dc>)
c0de635e:	4479      	add	r1, pc
c0de6360:	9101      	str	r1, [sp, #4]
c0de6362:	f8db 1008 	ldr.w	r1, [fp, #8]
c0de6366:	88c9      	ldrh	r1, [r1, #6]
c0de6368:	e9cd 1102 	strd	r1, r1, [sp, #8]
c0de636c:	a901      	add	r1, sp, #4
c0de636e:	f005 fc50 	bl	c0debc12 <nbgl_screenUpdateTicker>
c0de6372:	4656      	mov	r6, sl
c0de6374:	f8dd a000 	ldr.w	sl, [sp]
c0de6378:	463c      	mov	r4, r7
c0de637a:	e001      	b.n	c0de6380 <addContentCenter+0x134>
c0de637c:	f04f 0a00 	mov.w	sl, #0
c0de6380:	f8db 0010 	ldr.w	r0, [fp, #16]
c0de6384:	9600      	str	r6, [sp, #0]
c0de6386:	2800      	cmp	r0, #0
c0de6388:	d046      	beq.n	c0de6418 <addContentCenter+0x1cc>
c0de638a:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de638e:	f001 fb19 	bl	c0de79c4 <OUTLINED_FUNCTION_0>
c0de6392:	4607      	mov	r7, r0
c0de6394:	2000      	movs	r0, #0
c0de6396:	77f8      	strb	r0, [r7, #31]
c0de6398:	f8db 0010 	ldr.w	r0, [fp, #16]
c0de639c:	f005 fe24 	bl	c0debfe8 <pic>
c0de63a0:	f001 fd19 	bl	c0de7dd6 <OUTLINED_FUNCTION_42>
c0de63a4:	200d      	movs	r0, #13
c0de63a6:	f001 fb2b 	bl	c0de7a00 <OUTLINED_FUNCTION_3>
c0de63aa:	f001 fdf8 	bl	c0de7f9e <OUTLINED_FUNCTION_78>
c0de63ae:	71b8      	strb	r0, [r7, #6]
c0de63b0:	0a01      	lsrs	r1, r0, #8
c0de63b2:	f898 c020 	ldrb.w	ip, [r8, #32]
c0de63b6:	71f9      	strb	r1, [r7, #7]
c0de63b8:	f1bc 0f00 	cmp.w	ip, #0
c0de63bc:	d010      	beq.n	c0de63e0 <addContentCenter+0x194>
c0de63be:	463b      	mov	r3, r7
c0de63c0:	0e22      	lsrs	r2, r4, #24
c0de63c2:	f803 4f12 	strb.w	r4, [r3, #18]!
c0de63c6:	70da      	strb	r2, [r3, #3]
c0de63c8:	0c22      	lsrs	r2, r4, #16
c0de63ca:	709a      	strb	r2, [r3, #2]
c0de63cc:	0a22      	lsrs	r2, r4, #8
c0de63ce:	705a      	strb	r2, [r3, #1]
c0de63d0:	f8bb 2020 	ldrh.w	r2, [fp, #32]
c0de63d4:	3218      	adds	r2, #24
c0de63d6:	0a14      	lsrs	r4, r2, #8
c0de63d8:	71da      	strb	r2, [r3, #7]
c0de63da:	721c      	strb	r4, [r3, #8]
c0de63dc:	2308      	movs	r3, #8
c0de63de:	e004      	b.n	c0de63ea <addContentCenter+0x19e>
c0de63e0:	7e7a      	ldrb	r2, [r7, #25]
c0de63e2:	7ebb      	ldrb	r3, [r7, #26]
c0de63e4:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de63e8:	2302      	movs	r3, #2
c0de63ea:	75bb      	strb	r3, [r7, #22]
c0de63ec:	4643      	mov	r3, r8
c0de63ee:	4450      	add	r0, sl
c0de63f0:	f813 4f22 	ldrb.w	r4, [r3, #34]!
c0de63f4:	eb00 0a02 	add.w	sl, r0, r2
c0de63f8:	785d      	ldrb	r5, [r3, #1]
c0de63fa:	789e      	ldrb	r6, [r3, #2]
c0de63fc:	78d9      	ldrb	r1, [r3, #3]
c0de63fe:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de6402:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de6406:	9e00      	ldr	r6, [sp, #0]
c0de6408:	ea44 4101 	orr.w	r1, r4, r1, lsl #16
c0de640c:	f841 702c 	str.w	r7, [r1, ip, lsl #2]
c0de6410:	f10c 0101 	add.w	r1, ip, #1
c0de6414:	f803 1c02 	strb.w	r1, [r3, #-2]
c0de6418:	f8db 0014 	ldr.w	r0, [fp, #20]
c0de641c:	2800      	cmp	r0, #0
c0de641e:	d049      	beq.n	c0de64b4 <addContentCenter+0x268>
c0de6420:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de6424:	f001 face 	bl	c0de79c4 <OUTLINED_FUNCTION_0>
c0de6428:	4607      	mov	r7, r0
c0de642a:	2000      	movs	r0, #0
c0de642c:	77f8      	strb	r0, [r7, #31]
c0de642e:	f8db 0014 	ldr.w	r0, [fp, #20]
c0de6432:	f005 fdd9 	bl	c0debfe8 <pic>
c0de6436:	f001 fcce 	bl	c0de7dd6 <OUTLINED_FUNCTION_42>
c0de643a:	200c      	movs	r0, #12
c0de643c:	f001 fae0 	bl	c0de7a00 <OUTLINED_FUNCTION_3>
c0de6440:	200c      	movs	r0, #12
c0de6442:	f005 fc09 	bl	c0debc58 <nbgl_getTextHeightInWidth>
c0de6446:	f001 fce4 	bl	c0de7e12 <OUTLINED_FUNCTION_46>
c0de644a:	d028      	beq.n	c0de649e <addContentCenter+0x252>
c0de644c:	4642      	mov	r2, r8
c0de644e:	f04f 0c00 	mov.w	ip, #0
c0de6452:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de6456:	7855      	ldrb	r5, [r2, #1]
c0de6458:	7896      	ldrb	r6, [r2, #2]
c0de645a:	78d2      	ldrb	r2, [r2, #3]
c0de645c:	ea46 2202 	orr.w	r2, r6, r2, lsl #8
c0de6460:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0de6464:	463e      	mov	r6, r7
c0de6466:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de646a:	eb02 0381 	add.w	r3, r2, r1, lsl #2
c0de646e:	f853 5c04 	ldr.w	r5, [r3, #-4]
c0de6472:	f806 5f12 	strb.w	r5, [r6, #18]!
c0de6476:	0e2c      	lsrs	r4, r5, #24
c0de6478:	70f4      	strb	r4, [r6, #3]
c0de647a:	0c2c      	lsrs	r4, r5, #16
c0de647c:	f886 c008 	strb.w	ip, [r6, #8]
c0de6480:	70b4      	strb	r4, [r6, #2]
c0de6482:	0a2c      	lsrs	r4, r5, #8
c0de6484:	7074      	strb	r4, [r6, #1]
c0de6486:	2418      	movs	r4, #24
c0de6488:	71f4      	strb	r4, [r6, #7]
c0de648a:	2408      	movs	r4, #8
c0de648c:	f853 3c04 	ldr.w	r3, [r3, #-4]
c0de6490:	7134      	strb	r4, [r6, #4]
c0de6492:	7edb      	ldrb	r3, [r3, #27]
c0de6494:	2b02      	cmp	r3, #2
c0de6496:	d105      	bne.n	c0de64a4 <addContentCenter+0x258>
c0de6498:	f001 fd5b 	bl	c0de7f52 <OUTLINED_FUNCTION_71>
c0de649c:	e006      	b.n	c0de64ac <addContentCenter+0x260>
c0de649e:	f001 fa9b 	bl	c0de79d8 <OUTLINED_FUNCTION_2>
c0de64a2:	e005      	b.n	c0de64b0 <addContentCenter+0x264>
c0de64a4:	2300      	movs	r3, #0
c0de64a6:	76bb      	strb	r3, [r7, #26]
c0de64a8:	2310      	movs	r3, #16
c0de64aa:	767b      	strb	r3, [r7, #25]
c0de64ac:	9e00      	ldr	r6, [sp, #0]
c0de64ae:	460c      	mov	r4, r1
c0de64b0:	f001 fbfb 	bl	c0de7caa <OUTLINED_FUNCTION_29>
c0de64b4:	f8db 0018 	ldr.w	r0, [fp, #24]
c0de64b8:	b3b8      	cbz	r0, c0de652a <addContentCenter+0x2de>
c0de64ba:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de64be:	f001 fa81 	bl	c0de79c4 <OUTLINED_FUNCTION_0>
c0de64c2:	4607      	mov	r7, r0
c0de64c4:	2000      	movs	r0, #0
c0de64c6:	77f8      	strb	r0, [r7, #31]
c0de64c8:	f8db 0018 	ldr.w	r0, [fp, #24]
c0de64cc:	f005 fd8c 	bl	c0debfe8 <pic>
c0de64d0:	f001 fc81 	bl	c0de7dd6 <OUTLINED_FUNCTION_42>
c0de64d4:	200b      	movs	r0, #11
c0de64d6:	f001 fa93 	bl	c0de7a00 <OUTLINED_FUNCTION_3>
c0de64da:	f001 fc84 	bl	c0de7de6 <OUTLINED_FUNCTION_43>
c0de64de:	f001 fc98 	bl	c0de7e12 <OUTLINED_FUNCTION_46>
c0de64e2:	d019      	beq.n	c0de6518 <addContentCenter+0x2cc>
c0de64e4:	f001 fc3b 	bl	c0de7d5e <OUTLINED_FUNCTION_37>
c0de64e8:	eb02 0381 	add.w	r3, r2, r1, lsl #2
c0de64ec:	f853 4c04 	ldr.w	r4, [r3, #-4]
c0de64f0:	f805 4f12 	strb.w	r4, [r5, #18]!
c0de64f4:	0e26      	lsrs	r6, r4, #24
c0de64f6:	70ee      	strb	r6, [r5, #3]
c0de64f8:	0c26      	lsrs	r6, r4, #16
c0de64fa:	0a24      	lsrs	r4, r4, #8
c0de64fc:	706c      	strb	r4, [r5, #1]
c0de64fe:	70ae      	strb	r6, [r5, #2]
c0de6500:	2408      	movs	r4, #8
c0de6502:	f853 3c04 	ldr.w	r3, [r3, #-4]
c0de6506:	712c      	strb	r4, [r5, #4]
c0de6508:	7edb      	ldrb	r3, [r3, #27]
c0de650a:	2b04      	cmp	r3, #4
c0de650c:	d107      	bne.n	c0de651e <addContentCenter+0x2d2>
c0de650e:	2300      	movs	r3, #0
c0de6510:	76bb      	strb	r3, [r7, #26]
c0de6512:	2310      	movs	r3, #16
c0de6514:	767b      	strb	r3, [r7, #25]
c0de6516:	e004      	b.n	c0de6522 <addContentCenter+0x2d6>
c0de6518:	f001 fa5e 	bl	c0de79d8 <OUTLINED_FUNCTION_2>
c0de651c:	e003      	b.n	c0de6526 <addContentCenter+0x2da>
c0de651e:	f001 fd18 	bl	c0de7f52 <OUTLINED_FUNCTION_71>
c0de6522:	9e00      	ldr	r6, [sp, #0]
c0de6524:	460c      	mov	r4, r1
c0de6526:	f001 fbc0 	bl	c0de7caa <OUTLINED_FUNCTION_29>
c0de652a:	f8db 001c 	ldr.w	r0, [fp, #28]
c0de652e:	2800      	cmp	r0, #0
c0de6530:	d04f      	beq.n	c0de65d2 <addContentCenter+0x386>
c0de6532:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de6536:	f001 fa45 	bl	c0de79c4 <OUTLINED_FUNCTION_0>
c0de653a:	2401      	movs	r4, #1
c0de653c:	4607      	mov	r7, r0
c0de653e:	77c4      	strb	r4, [r0, #31]
c0de6540:	f8db 001c 	ldr.w	r0, [fp, #28]
c0de6544:	f005 fd50 	bl	c0debfe8 <pic>
c0de6548:	4601      	mov	r1, r0
c0de654a:	20a0      	movs	r0, #160	@ 0xa0
c0de654c:	2301      	movs	r3, #1
c0de654e:	717c      	strb	r4, [r7, #5]
c0de6550:	f887 4024 	strb.w	r4, [r7, #36]	@ 0x24
c0de6554:	7138      	strb	r0, [r7, #4]
c0de6556:	200b      	movs	r0, #11
c0de6558:	0e0a      	lsrs	r2, r1, #24
c0de655a:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de655e:	2005      	movs	r0, #5
c0de6560:	f887 0020 	strb.w	r0, [r7, #32]
c0de6564:	4638      	mov	r0, r7
c0de6566:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de656a:	70c2      	strb	r2, [r0, #3]
c0de656c:	0c0a      	lsrs	r2, r1, #16
c0de656e:	7082      	strb	r2, [r0, #2]
c0de6570:	0a08      	lsrs	r0, r1, #8
c0de6572:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de6576:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de657a:	f001 fc34 	bl	c0de7de6 <OUTLINED_FUNCTION_43>
c0de657e:	3010      	adds	r0, #16
c0de6580:	f001 fc47 	bl	c0de7e12 <OUTLINED_FUNCTION_46>
c0de6584:	d021      	beq.n	c0de65ca <addContentCenter+0x37e>
c0de6586:	f001 fbea 	bl	c0de7d5e <OUTLINED_FUNCTION_37>
c0de658a:	eb02 0481 	add.w	r4, r2, r1, lsl #2
c0de658e:	f854 3c04 	ldr.w	r3, [r4, #-4]
c0de6592:	f805 3f12 	strb.w	r3, [r5, #18]!
c0de6596:	0e1e      	lsrs	r6, r3, #24
c0de6598:	70ee      	strb	r6, [r5, #3]
c0de659a:	0c1e      	lsrs	r6, r3, #16
c0de659c:	0a1b      	lsrs	r3, r3, #8
c0de659e:	706b      	strb	r3, [r5, #1]
c0de65a0:	2300      	movs	r3, #0
c0de65a2:	70ae      	strb	r6, [r5, #2]
c0de65a4:	2608      	movs	r6, #8
c0de65a6:	722b      	strb	r3, [r5, #8]
c0de65a8:	2310      	movs	r3, #16
c0de65aa:	712e      	strb	r6, [r5, #4]
c0de65ac:	71eb      	strb	r3, [r5, #7]
c0de65ae:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de65b2:	7ee4      	ldrb	r4, [r4, #27]
c0de65b4:	2c02      	cmp	r4, #2
c0de65b6:	d105      	bne.n	c0de65c4 <addContentCenter+0x378>
c0de65b8:	f8bb 3020 	ldrh.w	r3, [fp, #32]
c0de65bc:	3310      	adds	r3, #16
c0de65be:	0a1c      	lsrs	r4, r3, #8
c0de65c0:	767b      	strb	r3, [r7, #25]
c0de65c2:	76bc      	strb	r4, [r7, #26]
c0de65c4:	9e00      	ldr	r6, [sp, #0]
c0de65c6:	460c      	mov	r4, r1
c0de65c8:	e001      	b.n	c0de65ce <addContentCenter+0x382>
c0de65ca:	f001 fa05 	bl	c0de79d8 <OUTLINED_FUNCTION_2>
c0de65ce:	f001 fb6c 	bl	c0de7caa <OUTLINED_FUNCTION_29>
c0de65d2:	2001      	movs	r0, #1
c0de65d4:	f888 a006 	strb.w	sl, [r8, #6]
c0de65d8:	f888 0005 	strb.w	r0, [r8, #5]
c0de65dc:	20a0      	movs	r0, #160	@ 0xa0
c0de65de:	f888 0004 	strb.w	r0, [r8, #4]
c0de65e2:	2005      	movs	r0, #5
c0de65e4:	f888 0016 	strb.w	r0, [r8, #22]
c0de65e8:	2000      	movs	r0, #0
c0de65ea:	f888 001f 	strb.w	r0, [r8, #31]
c0de65ee:	ea4f 201a 	mov.w	r0, sl, lsr #8
c0de65f2:	f888 0007 	strb.w	r0, [r8, #7]
c0de65f6:	f89b 0022 	ldrb.w	r0, [fp, #34]	@ 0x22
c0de65fa:	b130      	cbz	r0, c0de660a <addContentCenter+0x3be>
c0de65fc:	f10a 0028 	add.w	r0, sl, #40	@ 0x28
c0de6600:	f888 0006 	strb.w	r0, [r8, #6]
c0de6604:	0a00      	lsrs	r0, r0, #8
c0de6606:	f888 0007 	strb.w	r0, [r8, #7]
c0de660a:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de660e:	f001 fa6c 	bl	c0de7aea <OUTLINED_FUNCTION_10>
c0de6612:	f840 8022 	str.w	r8, [r0, r2, lsl #2]
c0de6616:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de661a:	f001 f9d7 	bl	c0de79cc <OUTLINED_FUNCTION_1>
c0de661e:	4640      	mov	r0, r8
c0de6620:	b004      	add	sp, #16
c0de6622:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de6626:	bf00      	nop
c0de6628:	0000155f 	.word	0x0000155f

c0de662c <nbgl_layoutAddContentCenter>:
c0de662c:	b128      	cbz	r0, c0de663a <nbgl_layoutAddContentCenter+0xe>
c0de662e:	b580      	push	{r7, lr}
c0de6630:	f7ff fe0c 	bl	c0de624c <addContentCenter>
c0de6634:	f001 fc2d 	bl	c0de7e92 <OUTLINED_FUNCTION_55>
c0de6638:	bd80      	pop	{r7, pc}
c0de663a:	f001 bb7f 	b.w	c0de7d3c <OUTLINED_FUNCTION_35>

c0de663e <nbgl_layoutAddQRCode>:
c0de663e:	2800      	cmp	r0, #0
c0de6640:	f000 8116 	beq.w	c0de6870 <nbgl_layoutAddQRCode+0x232>
c0de6644:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de6648:	4606      	mov	r6, r0
c0de664a:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de664e:	460f      	mov	r7, r1
c0de6650:	f001 faa1 	bl	c0de7b96 <OUTLINED_FUNCTION_16>
c0de6654:	4682      	mov	sl, r0
c0de6656:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de665a:	08c1      	lsrs	r1, r0, #3
c0de665c:	2003      	movs	r0, #3
c0de665e:	f005 fae7 	bl	c0debc30 <nbgl_containerPoolGet>
c0de6662:	4654      	mov	r4, sl
c0de6664:	0e01      	lsrs	r1, r0, #24
c0de6666:	f04f 0b00 	mov.w	fp, #0
c0de666a:	f804 0f22 	strb.w	r0, [r4, #34]!
c0de666e:	f88a b020 	strb.w	fp, [sl, #32]
c0de6672:	70e1      	strb	r1, [r4, #3]
c0de6674:	0c01      	lsrs	r1, r0, #16
c0de6676:	0a00      	lsrs	r0, r0, #8
c0de6678:	70a1      	strb	r1, [r4, #2]
c0de667a:	f88a 0023 	strb.w	r0, [sl, #35]	@ 0x23
c0de667e:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de6682:	08c1      	lsrs	r1, r0, #3
c0de6684:	200a      	movs	r0, #10
c0de6686:	f005 face 	bl	c0debc26 <nbgl_objPoolGet>
c0de668a:	4680      	mov	r8, r0
c0de668c:	6838      	ldr	r0, [r7, #0]
c0de668e:	f005 fcab 	bl	c0debfe8 <pic>
c0de6692:	f005 ff37 	bl	c0dec504 <strlen>
c0de6696:	283e      	cmp	r0, #62	@ 0x3e
c0de6698:	f04f 0000 	mov.w	r0, #0
c0de669c:	4645      	mov	r5, r8
c0de669e:	bf88      	it	hi
c0de66a0:	2001      	movhi	r0, #1
c0de66a2:	f888 0020 	strb.w	r0, [r8, #32]
c0de66a6:	f888 b01f 	strb.w	fp, [r8, #31]
c0de66aa:	f44f 7084 	mov.w	r0, #264	@ 0x108
c0de66ae:	bf88      	it	hi
c0de66b0:	20e4      	movhi	r0, #228	@ 0xe4
c0de66b2:	f888 0004 	strb.w	r0, [r8, #4]
c0de66b6:	f805 0f06 	strb.w	r0, [r5, #6]!
c0de66ba:	0a00      	lsrs	r0, r0, #8
c0de66bc:	7068      	strb	r0, [r5, #1]
c0de66be:	f888 0005 	strb.w	r0, [r8, #5]
c0de66c2:	6838      	ldr	r0, [r7, #0]
c0de66c4:	f005 fc90 	bl	c0debfe8 <pic>
c0de66c8:	4641      	mov	r1, r8
c0de66ca:	0e02      	lsrs	r2, r0, #24
c0de66cc:	f888 b009 	strb.w	fp, [r8, #9]
c0de66d0:	9601      	str	r6, [sp, #4]
c0de66d2:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de66d6:	f001 fba3 	bl	c0de7e20 <OUTLINED_FUNCTION_47>
c0de66da:	f888 0022 	strb.w	r0, [r8, #34]	@ 0x22
c0de66de:	7820      	ldrb	r0, [r4, #0]
c0de66e0:	78a1      	ldrb	r1, [r4, #2]
c0de66e2:	78e2      	ldrb	r2, [r4, #3]
c0de66e4:	f89a 4023 	ldrb.w	r4, [sl, #35]	@ 0x23
c0de66e8:	f89a 3020 	ldrb.w	r3, [sl, #32]
c0de66ec:	ea40 2004 	orr.w	r0, r0, r4, lsl #8
c0de66f0:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de66f4:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de66f8:	7869      	ldrb	r1, [r5, #1]
c0de66fa:	f840 8023 	str.w	r8, [r0, r3, lsl #2]
c0de66fe:	2002      	movs	r0, #2
c0de6700:	f888 0016 	strb.w	r0, [r8, #22]
c0de6704:	1c58      	adds	r0, r3, #1
c0de6706:	f88a 0020 	strb.w	r0, [sl, #32]
c0de670a:	7828      	ldrb	r0, [r5, #0]
c0de670c:	ea40 2b01 	orr.w	fp, r0, r1, lsl #8
c0de6710:	6878      	ldr	r0, [r7, #4]
c0de6712:	2800      	cmp	r0, #0
c0de6714:	d053      	beq.n	c0de67be <nbgl_layoutAddQRCode+0x180>
c0de6716:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de671a:	f001 f953 	bl	c0de79c4 <OUTLINED_FUNCTION_0>
c0de671e:	4605      	mov	r5, r0
c0de6720:	2000      	movs	r0, #0
c0de6722:	77e8      	strb	r0, [r5, #31]
c0de6724:	6878      	ldr	r0, [r7, #4]
c0de6726:	f005 fc5f 	bl	c0debfe8 <pic>
c0de672a:	4601      	mov	r1, r0
c0de672c:	20a0      	movs	r0, #160	@ 0xa0
c0de672e:	2201      	movs	r2, #1
c0de6730:	7128      	strb	r0, [r5, #4]
c0de6732:	2005      	movs	r0, #5
c0de6734:	716a      	strb	r2, [r5, #5]
c0de6736:	f885 2024 	strb.w	r2, [r5, #36]	@ 0x24
c0de673a:	0e0a      	lsrs	r2, r1, #24
c0de673c:	f885 0020 	strb.w	r0, [r5, #32]
c0de6740:	4628      	mov	r0, r5
c0de6742:	f001 fa02 	bl	c0de7b4a <OUTLINED_FUNCTION_13>
c0de6746:	f885 0027 	strb.w	r0, [r5, #39]	@ 0x27
c0de674a:	200d      	movs	r0, #13
c0de674c:	7bfa      	ldrb	r2, [r7, #15]
c0de674e:	2a00      	cmp	r2, #0
c0de6750:	bf08      	it	eq
c0de6752:	200b      	moveq	r0, #11
c0de6754:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de6758:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de675c:	2301      	movs	r3, #1
c0de675e:	f005 fa7b 	bl	c0debc58 <nbgl_getTextHeightInWidth>
c0de6762:	4651      	mov	r1, sl
c0de6764:	46be      	mov	lr, r7
c0de6766:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de676a:	784c      	ldrb	r4, [r1, #1]
c0de676c:	788a      	ldrb	r2, [r1, #2]
c0de676e:	78cf      	ldrb	r7, [r1, #3]
c0de6770:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de6774:	ea42 2207 	orr.w	r2, r2, r7, lsl #8
c0de6778:	ea4c 2404 	orr.w	r4, ip, r4, lsl #8
c0de677c:	462f      	mov	r7, r5
c0de677e:	ea44 4202 	orr.w	r2, r4, r2, lsl #16
c0de6782:	eb02 0483 	add.w	r4, r2, r3, lsl #2
c0de6786:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de678a:	f807 4f12 	strb.w	r4, [r7, #18]!
c0de678e:	0e26      	lsrs	r6, r4, #24
c0de6790:	70fe      	strb	r6, [r7, #3]
c0de6792:	0c26      	lsrs	r6, r4, #16
c0de6794:	0a24      	lsrs	r4, r4, #8
c0de6796:	70be      	strb	r6, [r7, #2]
c0de6798:	74ec      	strb	r4, [r5, #19]
c0de679a:	f842 5023 	str.w	r5, [r2, r3, lsl #2]
c0de679e:	2200      	movs	r2, #0
c0de67a0:	71a8      	strb	r0, [r5, #6]
c0de67a2:	4677      	mov	r7, lr
c0de67a4:	76aa      	strb	r2, [r5, #26]
c0de67a6:	2218      	movs	r2, #24
c0de67a8:	766a      	strb	r2, [r5, #25]
c0de67aa:	2208      	movs	r2, #8
c0de67ac:	75aa      	strb	r2, [r5, #22]
c0de67ae:	0a02      	lsrs	r2, r0, #8
c0de67b0:	4458      	add	r0, fp
c0de67b2:	71ea      	strb	r2, [r5, #7]
c0de67b4:	1c5a      	adds	r2, r3, #1
c0de67b6:	f100 0b18 	add.w	fp, r0, #24
c0de67ba:	f801 2c02 	strb.w	r2, [r1, #-2]
c0de67be:	68b8      	ldr	r0, [r7, #8]
c0de67c0:	9700      	str	r7, [sp, #0]
c0de67c2:	2800      	cmp	r0, #0
c0de67c4:	d056      	beq.n	c0de6874 <nbgl_layoutAddQRCode+0x236>
c0de67c6:	9801      	ldr	r0, [sp, #4]
c0de67c8:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de67cc:	f001 f8fa 	bl	c0de79c4 <OUTLINED_FUNCTION_0>
c0de67d0:	2401      	movs	r4, #1
c0de67d2:	4605      	mov	r5, r0
c0de67d4:	77c4      	strb	r4, [r0, #31]
c0de67d6:	68b8      	ldr	r0, [r7, #8]
c0de67d8:	f005 fc06 	bl	c0debfe8 <pic>
c0de67dc:	4601      	mov	r1, r0
c0de67de:	20a0      	movs	r0, #160	@ 0xa0
c0de67e0:	2301      	movs	r3, #1
c0de67e2:	716c      	strb	r4, [r5, #5]
c0de67e4:	f885 4024 	strb.w	r4, [r5, #36]	@ 0x24
c0de67e8:	7128      	strb	r0, [r5, #4]
c0de67ea:	200b      	movs	r0, #11
c0de67ec:	0e0a      	lsrs	r2, r1, #24
c0de67ee:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de67f2:	2005      	movs	r0, #5
c0de67f4:	f885 0020 	strb.w	r0, [r5, #32]
c0de67f8:	4628      	mov	r0, r5
c0de67fa:	f001 f924 	bl	c0de7a46 <OUTLINED_FUNCTION_5>
c0de67fe:	4651      	mov	r1, sl
c0de6800:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de6804:	784b      	ldrb	r3, [r1, #1]
c0de6806:	788e      	ldrb	r6, [r1, #2]
c0de6808:	78cc      	ldrb	r4, [r1, #3]
c0de680a:	f811 2c02 	ldrb.w	r2, [r1, #-2]
c0de680e:	ea4c 2303 	orr.w	r3, ip, r3, lsl #8
c0de6812:	ea46 2404 	orr.w	r4, r6, r4, lsl #8
c0de6816:	f8d7 c004 	ldr.w	ip, [r7, #4]
c0de681a:	2700      	movs	r7, #0
c0de681c:	462e      	mov	r6, r5
c0de681e:	ea43 4e04 	orr.w	lr, r3, r4, lsl #16
c0de6822:	eb0e 0482 	add.w	r4, lr, r2, lsl #2
c0de6826:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de682a:	76af      	strb	r7, [r5, #26]
c0de682c:	271c      	movs	r7, #28
c0de682e:	f1bc 0f00 	cmp.w	ip, #0
c0de6832:	bf08      	it	eq
c0de6834:	2720      	moveq	r7, #32
c0de6836:	766f      	strb	r7, [r5, #25]
c0de6838:	f806 4f12 	strb.w	r4, [r6, #18]!
c0de683c:	0e23      	lsrs	r3, r4, #24
c0de683e:	70f3      	strb	r3, [r6, #3]
c0de6840:	0c23      	lsrs	r3, r4, #16
c0de6842:	70b3      	strb	r3, [r6, #2]
c0de6844:	0a23      	lsrs	r3, r4, #8
c0de6846:	9e01      	ldr	r6, [sp, #4]
c0de6848:	74eb      	strb	r3, [r5, #19]
c0de684a:	2308      	movs	r3, #8
c0de684c:	f84e 5022 	str.w	r5, [lr, r2, lsl #2]
c0de6850:	3201      	adds	r2, #1
c0de6852:	71a8      	strb	r0, [r5, #6]
c0de6854:	75ab      	strb	r3, [r5, #22]
c0de6856:	0a03      	lsrs	r3, r0, #8
c0de6858:	f801 2c02 	strb.w	r2, [r1, #-2]
c0de685c:	71eb      	strb	r3, [r5, #7]
c0de685e:	f1bc 0f00 	cmp.w	ip, #0
c0de6862:	bf08      	it	eq
c0de6864:	f10b 0b08 	addeq.w	fp, fp, #8
c0de6868:	4458      	add	r0, fp
c0de686a:	eb00 0b07 	add.w	fp, r0, r7
c0de686e:	e002      	b.n	c0de6876 <nbgl_layoutAddQRCode+0x238>
c0de6870:	f001 ba64 	b.w	c0de7d3c <OUTLINED_FUNCTION_35>
c0de6874:	9e01      	ldr	r6, [sp, #4]
c0de6876:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de687a:	fa1f f18b 	uxth.w	r1, fp
c0de687e:	7982      	ldrb	r2, [r0, #6]
c0de6880:	79c3      	ldrb	r3, [r0, #7]
c0de6882:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6886:	3a10      	subs	r2, #16
c0de6888:	428a      	cmp	r2, r1
c0de688a:	dd01      	ble.n	c0de6890 <nbgl_layoutAddQRCode+0x252>
c0de688c:	9d00      	ldr	r5, [sp, #0]
c0de688e:	e012      	b.n	c0de68b6 <nbgl_layoutAddQRCode+0x278>
c0de6890:	f898 1020 	ldrb.w	r1, [r8, #32]
c0de6894:	9d00      	ldr	r5, [sp, #0]
c0de6896:	b971      	cbnz	r1, c0de68b6 <nbgl_layoutAddQRCode+0x278>
c0de6898:	2100      	movs	r1, #0
c0de689a:	2284      	movs	r2, #132	@ 0x84
c0de689c:	f1ab 0b84 	sub.w	fp, fp, #132	@ 0x84
c0de68a0:	f888 1007 	strb.w	r1, [r8, #7]
c0de68a4:	f888 1005 	strb.w	r1, [r8, #5]
c0de68a8:	2102      	movs	r1, #2
c0de68aa:	f888 2006 	strb.w	r2, [r8, #6]
c0de68ae:	f888 2004 	strb.w	r2, [r8, #4]
c0de68b2:	f888 1020 	strb.w	r1, [r8, #32]
c0de68b6:	2100      	movs	r1, #0
c0de68b8:	f88a b006 	strb.w	fp, [sl, #6]
c0de68bc:	f88a 101f 	strb.w	r1, [sl, #31]
c0de68c0:	ea4f 211b 	mov.w	r1, fp, lsr #8
c0de68c4:	f88a 1007 	strb.w	r1, [sl, #7]
c0de68c8:	7ba9      	ldrb	r1, [r5, #14]
c0de68ca:	b109      	cbz	r1, c0de68d0 <nbgl_layoutAddQRCode+0x292>
c0de68cc:	2005      	movs	r0, #5
c0de68ce:	e00f      	b.n	c0de68f0 <nbgl_layoutAddQRCode+0x2b2>
c0de68d0:	f001 f90b 	bl	c0de7aea <OUTLINED_FUNCTION_10>
c0de68d4:	4651      	mov	r1, sl
c0de68d6:	eb00 0082 	add.w	r0, r0, r2, lsl #2
c0de68da:	f850 0c04 	ldr.w	r0, [r0, #-4]
c0de68de:	f801 0f12 	strb.w	r0, [r1, #18]!
c0de68e2:	0e02      	lsrs	r2, r0, #24
c0de68e4:	70ca      	strb	r2, [r1, #3]
c0de68e6:	0c02      	lsrs	r2, r0, #16
c0de68e8:	0a00      	lsrs	r0, r0, #8
c0de68ea:	7048      	strb	r0, [r1, #1]
c0de68ec:	2008      	movs	r0, #8
c0de68ee:	708a      	strb	r2, [r1, #2]
c0de68f0:	f88a 0016 	strb.w	r0, [sl, #22]
c0de68f4:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de68f8:	f001 f9be 	bl	c0de7c78 <OUTLINED_FUNCTION_27>
c0de68fc:	2001      	movs	r0, #1
c0de68fe:	f88a 0005 	strb.w	r0, [sl, #5]
c0de6902:	20a0      	movs	r0, #160	@ 0xa0
c0de6904:	f88a 0004 	strb.w	r0, [sl, #4]
c0de6908:	89a8      	ldrh	r0, [r5, #12]
c0de690a:	f88a 0019 	strb.w	r0, [sl, #25]
c0de690e:	0a00      	lsrs	r0, r0, #8
c0de6910:	f88a 001a 	strb.w	r0, [sl, #26]
c0de6914:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de6918:	f001 f858 	bl	c0de79cc <OUTLINED_FUNCTION_1>
c0de691c:	fa1f f08b 	uxth.w	r0, fp
c0de6920:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de6924 <nbgl_layoutAddChoiceButtons>:
c0de6924:	b510      	push	{r4, lr}
c0de6926:	b086      	sub	sp, #24
c0de6928:	2206      	movs	r2, #6
c0de692a:	f10d 0c04 	add.w	ip, sp, #4
c0de692e:	f8ad 2000 	strh.w	r2, [sp]
c0de6932:	e891 001c 	ldmia.w	r1, {r2, r3, r4}
c0de6936:	e8ac 001c 	stmia.w	ip!, {r2, r3, r4}
c0de693a:	898a      	ldrh	r2, [r1, #12]
c0de693c:	7b89      	ldrb	r1, [r1, #14]
c0de693e:	f88d 1012 	strb.w	r1, [sp, #18]
c0de6942:	4669      	mov	r1, sp
c0de6944:	f8ad 2010 	strh.w	r2, [sp, #16]
c0de6948:	f7fe fb40 	bl	c0de4fcc <nbgl_layoutAddExtendedFooter>
c0de694c:	b006      	add	sp, #24
c0de694e:	bd10      	pop	{r4, pc}

c0de6950 <nbgl_layoutAddHorizontalButtons>:
c0de6950:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de6952:	2202      	movs	r2, #2
c0de6954:	f88d 2004 	strb.w	r2, [sp, #4]
c0de6958:	e9d1 2300 	ldrd	r2, r3, [r1]
c0de695c:	e9cd 2302 	strd	r2, r3, [sp, #8]
c0de6960:	890a      	ldrh	r2, [r1, #8]
c0de6962:	7a89      	ldrb	r1, [r1, #10]
c0de6964:	f8ad 2010 	strh.w	r2, [sp, #16]
c0de6968:	f88d 1012 	strb.w	r1, [sp, #18]
c0de696c:	a901      	add	r1, sp, #4
c0de696e:	f7fd ff85 	bl	c0de487c <nbgl_layoutAddUpFooter>
c0de6972:	b006      	add	sp, #24
c0de6974:	bd80      	pop	{r7, pc}
	...

c0de6978 <nbgl_layoutAddTagValueList>:
c0de6978:	2800      	cmp	r0, #0
c0de697a:	f000 818a 	beq.w	c0de6c92 <nbgl_layoutAddTagValueList+0x31a>
c0de697e:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de6982:	b088      	sub	sp, #32
c0de6984:	4680      	mov	r8, r0
c0de6986:	48c4      	ldr	r0, [pc, #784]	@ (c0de6c98 <nbgl_layoutAddTagValueList+0x320>)
c0de6988:	460c      	mov	r4, r1
c0de698a:	2100      	movs	r1, #0
c0de698c:	f04f 0b00 	mov.w	fp, #0
c0de6990:	f8cd 8004 	str.w	r8, [sp, #4]
c0de6994:	9406      	str	r4, [sp, #24]
c0de6996:	4478      	add	r0, pc
c0de6998:	9000      	str	r0, [sp, #0]
c0de699a:	7a20      	ldrb	r0, [r4, #8]
c0de699c:	4583      	cmp	fp, r0
c0de699e:	f080 8174 	bcs.w	c0de6c8a <nbgl_layoutAddTagValueList+0x312>
c0de69a2:	6820      	ldr	r0, [r4, #0]
c0de69a4:	e9cd b104 	strd	fp, r1, [sp, #16]
c0de69a8:	b110      	cbz	r0, c0de69b0 <nbgl_layoutAddTagValueList+0x38>
c0de69aa:	eb00 0b01 	add.w	fp, r0, r1
c0de69ae:	e005      	b.n	c0de69bc <nbgl_layoutAddTagValueList+0x44>
c0de69b0:	7a60      	ldrb	r0, [r4, #9]
c0de69b2:	6861      	ldr	r1, [r4, #4]
c0de69b4:	4458      	add	r0, fp
c0de69b6:	b2c0      	uxtb	r0, r0
c0de69b8:	4788      	blx	r1
c0de69ba:	4683      	mov	fp, r0
c0de69bc:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de69c0:	9c00      	ldr	r4, [sp, #0]
c0de69c2:	08c1      	lsrs	r1, r0, #3
c0de69c4:	2001      	movs	r0, #1
c0de69c6:	47a0      	blx	r4
c0de69c8:	4682      	mov	sl, r0
c0de69ca:	f8db 0008 	ldr.w	r0, [fp, #8]
c0de69ce:	2800      	cmp	r0, #0
c0de69d0:	f04f 0003 	mov.w	r0, #3
c0de69d4:	bf08      	it	eq
c0de69d6:	2002      	moveq	r0, #2
c0de69d8:	f898 10ad 	ldrb.w	r1, [r8, #173]	@ 0xad
c0de69dc:	f001 face 	bl	c0de7f7c <OUTLINED_FUNCTION_74>
c0de69e0:	4656      	mov	r6, sl
c0de69e2:	0e01      	lsrs	r1, r0, #24
c0de69e4:	f806 0f22 	strb.w	r0, [r6, #34]!
c0de69e8:	f001 fa75 	bl	c0de7ed6 <OUTLINED_FUNCTION_60>
c0de69ec:	f88a 0023 	strb.w	r0, [sl, #35]	@ 0x23
c0de69f0:	f001 fadc 	bl	c0de7fac <OUTLINED_FUNCTION_80>
c0de69f4:	4605      	mov	r5, r0
c0de69f6:	f001 fad9 	bl	c0de7fac <OUTLINED_FUNCTION_80>
c0de69fa:	4607      	mov	r7, r0
c0de69fc:	f8db 0000 	ldr.w	r0, [fp]
c0de6a00:	2401      	movs	r4, #1
c0de6a02:	77ec      	strb	r4, [r5, #31]
c0de6a04:	f005 faf0 	bl	c0debfe8 <pic>
c0de6a08:	4601      	mov	r1, r0
c0de6a0a:	20a0      	movs	r0, #160	@ 0xa0
c0de6a0c:	716c      	strb	r4, [r5, #5]
c0de6a0e:	f885 4024 	strb.w	r4, [r5, #36]	@ 0x24
c0de6a12:	2404      	movs	r4, #4
c0de6a14:	2301      	movs	r3, #1
c0de6a16:	7128      	strb	r0, [r5, #4]
c0de6a18:	200b      	movs	r0, #11
c0de6a1a:	0e0a      	lsrs	r2, r1, #24
c0de6a1c:	f885 4020 	strb.w	r4, [r5, #32]
c0de6a20:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de6a24:	4628      	mov	r0, r5
c0de6a26:	f001 f80e 	bl	c0de7a46 <OUTLINED_FUNCTION_5>
c0de6a2a:	71a8      	strb	r0, [r5, #6]
c0de6a2c:	9003      	str	r0, [sp, #12]
c0de6a2e:	0a00      	lsrs	r0, r0, #8
c0de6a30:	f04f 0800 	mov.w	r8, #0
c0de6a34:	2109      	movs	r1, #9
c0de6a36:	71e8      	strb	r0, [r5, #7]
c0de6a38:	f105 0012 	add.w	r0, r5, #18
c0de6a3c:	f885 8021 	strb.w	r8, [r5, #33]	@ 0x21
c0de6a40:	f005 fcf4 	bl	c0dec42c <__aeabi_memclr>
c0de6a44:	f89a 1023 	ldrb.w	r1, [sl, #35]	@ 0x23
c0de6a48:	7832      	ldrb	r2, [r6, #0]
c0de6a4a:	78b3      	ldrb	r3, [r6, #2]
c0de6a4c:	78f6      	ldrb	r6, [r6, #3]
c0de6a4e:	f89a 0020 	ldrb.w	r0, [sl, #32]
c0de6a52:	f887 801f 	strb.w	r8, [r7, #31]
c0de6a56:	f001 fa9b 	bl	c0de7f90 <OUTLINED_FUNCTION_76>
c0de6a5a:	f841 5020 	str.w	r5, [r1, r0, lsl #2]
c0de6a5e:	3001      	adds	r0, #1
c0de6a60:	f88a 0020 	strb.w	r0, [sl, #32]
c0de6a64:	f8db 0004 	ldr.w	r0, [fp, #4]
c0de6a68:	f005 fabe 	bl	c0debfe8 <pic>
c0de6a6c:	4601      	mov	r1, r0
c0de6a6e:	4638      	mov	r0, r7
c0de6a70:	f887 4020 	strb.w	r4, [r7, #32]
c0de6a74:	9c06      	ldr	r4, [sp, #24]
c0de6a76:	260c      	movs	r6, #12
c0de6a78:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de6a7c:	0e0a      	lsrs	r2, r1, #24
c0de6a7e:	f001 f9c1 	bl	c0de7e04 <OUTLINED_FUNCTION_45>
c0de6a82:	7b20      	ldrb	r0, [r4, #12]
c0de6a84:	2800      	cmp	r0, #0
c0de6a86:	bf08      	it	eq
c0de6a88:	260d      	moveq	r6, #13
c0de6a8a:	f887 6022 	strb.w	r6, [r7, #34]	@ 0x22
c0de6a8e:	f89b 200c 	ldrb.w	r2, [fp, #12]
c0de6a92:	0752      	lsls	r2, r2, #29
c0de6a94:	d417      	bmi.n	c0de6ac6 <nbgl_layoutAddTagValueList+0x14e>
c0de6a96:	f8db 2008 	ldr.w	r2, [fp, #8]
c0de6a9a:	2a00      	cmp	r2, #0
c0de6a9c:	f000 80f0 	beq.w	c0de6c80 <nbgl_layoutAddTagValueList+0x308>
c0de6aa0:	4610      	mov	r0, r2
c0de6aa2:	f005 faa1 	bl	c0debfe8 <pic>
c0de6aa6:	4639      	mov	r1, r7
c0de6aa8:	f811 2f26 	ldrb.w	r2, [r1, #38]!
c0de6aac:	784b      	ldrb	r3, [r1, #1]
c0de6aae:	f811 6c04 	ldrb.w	r6, [r1, #-4]
c0de6ab2:	f891 c002 	ldrb.w	ip, [r1, #2]
c0de6ab6:	78c9      	ldrb	r1, [r1, #3]
c0de6ab8:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6abc:	ea4c 2101 	orr.w	r1, ip, r1, lsl #8
c0de6ac0:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6ac4:	e001      	b.n	c0de6aca <nbgl_layoutAddTagValueList+0x152>
c0de6ac6:	4875      	ldr	r0, [pc, #468]	@ (c0de6c9c <nbgl_layoutAddTagValueList+0x324>)
c0de6ac8:	4478      	add	r0, pc
c0de6aca:	7802      	ldrb	r2, [r0, #0]
c0de6acc:	7843      	ldrb	r3, [r0, #1]
c0de6ace:	4680      	mov	r8, r0
c0de6ad0:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6ad4:	f5c2 72ca 	rsb	r2, r2, #404	@ 0x194
c0de6ad8:	0a13      	lsrs	r3, r2, #8
c0de6ada:	713a      	strb	r2, [r7, #4]
c0de6adc:	b292      	uxth	r2, r2
c0de6ade:	4630      	mov	r0, r6
c0de6ae0:	717b      	strb	r3, [r7, #5]
c0de6ae2:	7b63      	ldrb	r3, [r4, #13]
c0de6ae4:	f005 f8bd 	bl	c0debc62 <nbgl_getTextNbLinesInWidth>
c0de6ae8:	7aa1      	ldrb	r1, [r4, #10]
c0de6aea:	46a3      	mov	fp, r4
c0de6aec:	b121      	cbz	r1, c0de6af8 <nbgl_layoutAddTagValueList+0x180>
c0de6aee:	4288      	cmp	r0, r1
c0de6af0:	bf84      	itt	hi
c0de6af2:	f887 1025 	strbhi.w	r1, [r7, #37]	@ 0x25
c0de6af6:	4608      	movhi	r0, r1
c0de6af8:	9007      	str	r0, [sp, #28]
c0de6afa:	f897 0022 	ldrb.w	r0, [r7, #34]	@ 0x22
c0de6afe:	f005 f89c 	bl	c0debc3a <nbgl_getFont>
c0de6b02:	0a29      	lsrs	r1, r5, #8
c0de6b04:	0e2a      	lsrs	r2, r5, #24
c0de6b06:	46dc      	mov	ip, fp
c0de6b08:	f04f 0e01 	mov.w	lr, #1
c0de6b0c:	74f9      	strb	r1, [r7, #19]
c0de6b0e:	4639      	mov	r1, r7
c0de6b10:	f801 5f12 	strb.w	r5, [r1, #18]!
c0de6b14:	70ca      	strb	r2, [r1, #3]
c0de6b16:	0c2a      	lsrs	r2, r5, #16
c0de6b18:	708a      	strb	r2, [r1, #2]
c0de6b1a:	4651      	mov	r1, sl
c0de6b1c:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6b20:	784d      	ldrb	r5, [r1, #1]
c0de6b22:	788e      	ldrb	r6, [r1, #2]
c0de6b24:	78cc      	ldrb	r4, [r1, #3]
c0de6b26:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de6b2a:	ea46 2404 	orr.w	r4, r6, r4, lsl #8
c0de6b2e:	ea42 2205 	orr.w	r2, r2, r5, lsl #8
c0de6b32:	2600      	movs	r6, #0
c0de6b34:	ea42 4204 	orr.w	r2, r2, r4, lsl #16
c0de6b38:	4644      	mov	r4, r8
c0de6b3a:	76be      	strb	r6, [r7, #26]
c0de6b3c:	f887 6021 	strb.w	r6, [r7, #33]	@ 0x21
c0de6b40:	f842 7023 	str.w	r7, [r2, r3, lsl #2]
c0de6b44:	2204      	movs	r2, #4
c0de6b46:	767a      	strb	r2, [r7, #25]
c0de6b48:	2207      	movs	r2, #7
c0de6b4a:	75ba      	strb	r2, [r7, #22]
c0de6b4c:	f89b 200d 	ldrb.w	r2, [fp, #13]
c0de6b50:	79c5      	ldrb	r5, [r0, #7]
c0de6b52:	f8dd b010 	ldr.w	fp, [sp, #16]
c0de6b56:	f887 2024 	strb.w	r2, [r7, #36]	@ 0x24
c0de6b5a:	9a07      	ldr	r2, [sp, #28]
c0de6b5c:	fb02 f005 	mul.w	r0, r2, r5
c0de6b60:	71b8      	strb	r0, [r7, #6]
c0de6b62:	0a00      	lsrs	r0, r0, #8
c0de6b64:	71f8      	strb	r0, [r7, #7]
c0de6b66:	1c58      	adds	r0, r3, #1
c0de6b68:	f1b8 0f00 	cmp.w	r8, #0
c0de6b6c:	f8dd 8004 	ldr.w	r8, [sp, #4]
c0de6b70:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de6b74:	d048      	beq.n	c0de6c08 <nbgl_layoutAddTagValueList+0x290>
c0de6b76:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de6b7a:	f001 f83f 	bl	c0de7bfc <OUTLINED_FUNCTION_21>
c0de6b7e:	9502      	str	r5, [sp, #8]
c0de6b80:	4605      	mov	r5, r0
c0de6b82:	9806      	ldr	r0, [sp, #24]
c0de6b84:	4651      	mov	r1, sl
c0de6b86:	2309      	movs	r3, #9
c0de6b88:	7ac2      	ldrb	r2, [r0, #11]
c0de6b8a:	4640      	mov	r0, r8
c0de6b8c:	f7fd fbf8 	bl	c0de4380 <layoutAddCallbackObj>
c0de6b90:	0a21      	lsrs	r1, r4, #8
c0de6b92:	0e22      	lsrs	r2, r4, #24
c0de6b94:	2600      	movs	r6, #0
c0de6b96:	f04f 0e01 	mov.w	lr, #1
c0de6b9a:	f885 1022 	strb.w	r1, [r5, #34]	@ 0x22
c0de6b9e:	0a39      	lsrs	r1, r7, #8
c0de6ba0:	762e      	strb	r6, [r5, #24]
c0de6ba2:	77ee      	strb	r6, [r5, #31]
c0de6ba4:	74e9      	strb	r1, [r5, #19]
c0de6ba6:	4629      	mov	r1, r5
c0de6ba8:	f801 4f21 	strb.w	r4, [r1, #33]!
c0de6bac:	70ca      	strb	r2, [r1, #3]
c0de6bae:	0c22      	lsrs	r2, r4, #16
c0de6bb0:	708a      	strb	r2, [r1, #2]
c0de6bb2:	4629      	mov	r1, r5
c0de6bb4:	0e3a      	lsrs	r2, r7, #24
c0de6bb6:	4673      	mov	r3, lr
c0de6bb8:	f001 f9be 	bl	c0de7f38 <OUTLINED_FUNCTION_69>
c0de6bbc:	469e      	mov	lr, r3
c0de6bbe:	4651      	mov	r1, sl
c0de6bc0:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6bc4:	784c      	ldrb	r4, [r1, #1]
c0de6bc6:	788f      	ldrb	r7, [r1, #2]
c0de6bc8:	78cb      	ldrb	r3, [r1, #3]
c0de6bca:	f811 cc02 	ldrb.w	ip, [r1, #-2]
c0de6bce:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de6bd2:	ea47 2403 	orr.w	r4, r7, r3, lsl #8
c0de6bd6:	ea42 4204 	orr.w	r2, r2, r4, lsl #16
c0de6bda:	f842 502c 	str.w	r5, [r2, ip, lsl #2]
c0de6bde:	220c      	movs	r2, #12
c0de6be0:	75ea      	strb	r2, [r5, #23]
c0de6be2:	f880 b005 	strb.w	fp, [r0, #5]
c0de6be6:	f10b 000f 	add.w	r0, fp, #15
c0de6bea:	75aa      	strb	r2, [r5, #22]
c0de6bec:	9d02      	ldr	r5, [sp, #8]
c0de6bee:	9a07      	ldr	r2, [sp, #28]
c0de6bf0:	f801 6c05 	strb.w	r6, [r1, #-5]
c0de6bf4:	f801 ec06 	strb.w	lr, [r1, #-6]
c0de6bf8:	f801 0c04 	strb.w	r0, [r1, #-4]
c0de6bfc:	f10c 0001 	add.w	r0, ip, #1
c0de6c00:	f8dd c018 	ldr.w	ip, [sp, #24]
c0de6c04:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de6c08:	9803      	ldr	r0, [sp, #12]
c0de6c0a:	4659      	mov	r1, fp
c0de6c0c:	fb02 0005 	mla	r0, r2, r5, r0
c0de6c10:	3004      	adds	r0, #4
c0de6c12:	f1bb 0f00 	cmp.w	fp, #0
c0de6c16:	bf18      	it	ne
c0de6c18:	2118      	movne	r1, #24
c0de6c1a:	f88a 1019 	strb.w	r1, [sl, #25]
c0de6c1e:	f88a e005 	strb.w	lr, [sl, #5]
c0de6c22:	f88a 6018 	strb.w	r6, [sl, #24]
c0de6c26:	f88a 601f 	strb.w	r6, [sl, #31]
c0de6c2a:	f88a 6016 	strb.w	r6, [sl, #22]
c0de6c2e:	f10b 0b01 	add.w	fp, fp, #1
c0de6c32:	0a09      	lsrs	r1, r1, #8
c0de6c34:	f88a 101a 	strb.w	r1, [sl, #26]
c0de6c38:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de6c3c:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6c40:	784c      	ldrb	r4, [r1, #1]
c0de6c42:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de6c46:	788d      	ldrb	r5, [r1, #2]
c0de6c48:	78c9      	ldrb	r1, [r1, #3]
c0de6c4a:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de6c4e:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de6c52:	4664      	mov	r4, ip
c0de6c54:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6c58:	f841 a023 	str.w	sl, [r1, r3, lsl #2]
c0de6c5c:	21a0      	movs	r1, #160	@ 0xa0
c0de6c5e:	f88a 0006 	strb.w	r0, [sl, #6]
c0de6c62:	0a00      	lsrs	r0, r0, #8
c0de6c64:	f88a 1004 	strb.w	r1, [sl, #4]
c0de6c68:	2120      	movs	r1, #32
c0de6c6a:	f88a 0007 	strb.w	r0, [sl, #7]
c0de6c6e:	f88a 1017 	strb.w	r1, [sl, #23]
c0de6c72:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de6c76:	f000 fea9 	bl	c0de79cc <OUTLINED_FUNCTION_1>
c0de6c7a:	9905      	ldr	r1, [sp, #20]
c0de6c7c:	3110      	adds	r1, #16
c0de6c7e:	e68c      	b.n	c0de699a <nbgl_layoutAddTagValueList+0x22>
c0de6c80:	f04f 0800 	mov.w	r8, #0
c0de6c84:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de6c88:	e726      	b.n	c0de6ad8 <nbgl_layoutAddTagValueList+0x160>
c0de6c8a:	2000      	movs	r0, #0
c0de6c8c:	b008      	add	sp, #32
c0de6c8e:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de6c92:	f001 b853 	b.w	c0de7d3c <OUTLINED_FUNCTION_35>
c0de6c96:	bf00      	nop
c0de6c98:	0000528d 	.word	0x0000528d
c0de6c9c:	0000693a 	.word	0x0000693a

c0de6ca0 <nbgl_layoutAddSeparationLine>:
c0de6ca0:	b570      	push	{r4, r5, r6, lr}
c0de6ca2:	f001 f97f 	bl	c0de7fa4 <OUTLINED_FUNCTION_79>
c0de6ca6:	08c0      	lsrs	r0, r0, #3
c0de6ca8:	f7ff fa7e 	bl	c0de61a8 <createHorizontalLine>
c0de6cac:	f000 ffaa 	bl	c0de7c04 <OUTLINED_FUNCTION_22>
c0de6cb0:	21ff      	movs	r1, #255	@ 0xff
c0de6cb2:	7681      	strb	r1, [r0, #26]
c0de6cb4:	21fc      	movs	r1, #252	@ 0xfc
c0de6cb6:	7641      	strb	r1, [r0, #25]
c0de6cb8:	2103      	movs	r1, #3
c0de6cba:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de6cbe:	f001 f8f6 	bl	c0de7eae <OUTLINED_FUNCTION_57>
c0de6cc2:	bd70      	pop	{r4, r5, r6, pc}

c0de6cc4 <nbgl_layoutAddButton>:
c0de6cc4:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de6cc8:	b086      	sub	sp, #24
c0de6cca:	b310      	cbz	r0, c0de6d12 <nbgl_layoutAddButton+0x4e>
c0de6ccc:	4680      	mov	r8, r0
c0de6cce:	7ac8      	ldrb	r0, [r1, #11]
c0de6cd0:	460d      	mov	r5, r1
c0de6cd2:	b108      	cbz	r0, c0de6cd8 <nbgl_layoutAddButton+0x14>
c0de6cd4:	7aa8      	ldrb	r0, [r5, #10]
c0de6cd6:	b1f8      	cbz	r0, c0de6d18 <nbgl_layoutAddButton+0x54>
c0de6cd8:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de6cdc:	f000 ff5f 	bl	c0de7b9e <OUTLINED_FUNCTION_17>
c0de6ce0:	4606      	mov	r6, r0
c0de6ce2:	7a2a      	ldrb	r2, [r5, #8]
c0de6ce4:	7b2b      	ldrb	r3, [r5, #12]
c0de6ce6:	4640      	mov	r0, r8
c0de6ce8:	f000 ff85 	bl	c0de7bf6 <OUTLINED_FUNCTION_20>
c0de6cec:	b188      	cbz	r0, c0de6d12 <nbgl_layoutAddButton+0x4e>
c0de6cee:	210c      	movs	r1, #12
c0de6cf0:	2000      	movs	r0, #0
c0de6cf2:	7671      	strb	r1, [r6, #25]
c0de6cf4:	2120      	movs	r1, #32
c0de6cf6:	76b0      	strb	r0, [r6, #26]
c0de6cf8:	7630      	strb	r0, [r6, #24]
c0de6cfa:	75b0      	strb	r0, [r6, #22]
c0de6cfc:	75f1      	strb	r1, [r6, #23]
c0de6cfe:	7a69      	ldrb	r1, [r5, #9]
c0de6d00:	b1e9      	cbz	r1, c0de6d3e <nbgl_layoutAddButton+0x7a>
c0de6d02:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de6d06:	2003      	movs	r0, #3
c0de6d08:	77f0      	strb	r0, [r6, #31]
c0de6d0a:	2902      	cmp	r1, #2
c0de6d0c:	bf18      	it	ne
c0de6d0e:	2002      	movne	r0, #2
c0de6d10:	e019      	b.n	c0de6d46 <nbgl_layoutAddButton+0x82>
c0de6d12:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de6d16:	e0a3      	b.n	c0de6e60 <nbgl_layoutAddButton+0x19c>
c0de6d18:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de6d1c:	2800      	cmp	r0, #0
c0de6d1e:	f000 80a2 	beq.w	c0de6e66 <nbgl_layoutAddButton+0x1a2>
c0de6d22:	2001      	movs	r0, #1
c0de6d24:	f88d 0000 	strb.w	r0, [sp]
c0de6d28:	e9d5 0100 	ldrd	r0, r1, [r5]
c0de6d2c:	9001      	str	r0, [sp, #4]
c0de6d2e:	7b28      	ldrb	r0, [r5, #12]
c0de6d30:	9102      	str	r1, [sp, #8]
c0de6d32:	4669      	mov	r1, sp
c0de6d34:	f001 f91b 	bl	c0de7f6e <OUTLINED_FUNCTION_73>
c0de6d38:	f7fd fda0 	bl	c0de487c <nbgl_layoutAddUpFooter>
c0de6d3c:	e090      	b.n	c0de6e60 <nbgl_layoutAddButton+0x19c>
c0de6d3e:	2103      	movs	r1, #3
c0de6d40:	77f0      	strb	r0, [r6, #31]
c0de6d42:	f886 1021 	strb.w	r1, [r6, #33]	@ 0x21
c0de6d46:	f886 0020 	strb.w	r0, [r6, #32]
c0de6d4a:	6828      	ldr	r0, [r5, #0]
c0de6d4c:	f005 f94c 	bl	c0debfe8 <pic>
c0de6d50:	210c      	movs	r1, #12
c0de6d52:	0e02      	lsrs	r2, r0, #24
c0de6d54:	f886 1023 	strb.w	r1, [r6, #35]	@ 0x23
c0de6d58:	4631      	mov	r1, r6
c0de6d5a:	f000 ff9d 	bl	c0de7c98 <OUTLINED_FUNCTION_28>
c0de6d5e:	f000 ff63 	bl	c0de7c28 <OUTLINED_FUNCTION_23>
c0de6d62:	4631      	mov	r1, r6
c0de6d64:	0e02      	lsrs	r2, r0, #24
c0de6d66:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de6d6a:	70ca      	strb	r2, [r1, #3]
c0de6d6c:	0c02      	lsrs	r2, r0, #16
c0de6d6e:	0a00      	lsrs	r0, r0, #8
c0de6d70:	708a      	strb	r2, [r1, #2]
c0de6d72:	7048      	strb	r0, [r1, #1]
c0de6d74:	7aa8      	ldrb	r0, [r5, #10]
c0de6d76:	b308      	cbz	r0, c0de6dbc <nbgl_layoutAddButton+0xf8>
c0de6d78:	4632      	mov	r2, r6
c0de6d7a:	f896 1026 	ldrb.w	r1, [r6, #38]	@ 0x26
c0de6d7e:	f896 0023 	ldrb.w	r0, [r6, #35]	@ 0x23
c0de6d82:	f812 3f25 	ldrb.w	r3, [r2, #37]!
c0de6d86:	f001 f8fc 	bl	c0de7f82 <OUTLINED_FUNCTION_75>
c0de6d8a:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de6d8e:	f004 ff6d 	bl	c0debc6c <nbgl_getTextWidth>
c0de6d92:	4631      	mov	r1, r6
c0de6d94:	3040      	adds	r0, #64	@ 0x40
c0de6d96:	f811 2f2e 	ldrb.w	r2, [r1, #46]!
c0de6d9a:	784b      	ldrb	r3, [r1, #1]
c0de6d9c:	788f      	ldrb	r7, [r1, #2]
c0de6d9e:	78c9      	ldrb	r1, [r1, #3]
c0de6da0:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6da4:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de6da8:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
c0de6dac:	2100      	movs	r1, #0
c0de6dae:	b18a      	cbz	r2, c0de6dd4 <nbgl_layoutAddButton+0x110>
c0de6db0:	7813      	ldrb	r3, [r2, #0]
c0de6db2:	7852      	ldrb	r2, [r2, #1]
c0de6db4:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de6db8:	320c      	adds	r2, #12
c0de6dba:	e00c      	b.n	c0de6dd6 <nbgl_layoutAddButton+0x112>
c0de6dbc:	2000      	movs	r0, #0
c0de6dbe:	71f0      	strb	r0, [r6, #7]
c0de6dc0:	2058      	movs	r0, #88	@ 0x58
c0de6dc2:	71b0      	strb	r0, [r6, #6]
c0de6dc4:	2001      	movs	r0, #1
c0de6dc6:	7170      	strb	r0, [r6, #5]
c0de6dc8:	20a0      	movs	r0, #160	@ 0xa0
c0de6dca:	7130      	strb	r0, [r6, #4]
c0de6dcc:	2003      	movs	r0, #3
c0de6dce:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de6dd2:	e01d      	b.n	c0de6e10 <nbgl_layoutAddButton+0x14c>
c0de6dd4:	2200      	movs	r2, #0
c0de6dd6:	71f1      	strb	r1, [r6, #7]
c0de6dd8:	2140      	movs	r1, #64	@ 0x40
c0de6dda:	4410      	add	r0, r2
c0de6ddc:	71b1      	strb	r1, [r6, #6]
c0de6dde:	2101      	movs	r1, #1
c0de6de0:	7130      	strb	r0, [r6, #4]
c0de6de2:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de6de6:	0a01      	lsrs	r1, r0, #8
c0de6de8:	7171      	strb	r1, [r6, #5]
c0de6dea:	7ae9      	ldrb	r1, [r5, #11]
c0de6dec:	2901      	cmp	r1, #1
c0de6dee:	d00f      	beq.n	c0de6e10 <nbgl_layoutAddButton+0x14c>
c0de6df0:	b280      	uxth	r0, r0
c0de6df2:	2102      	movs	r1, #2
c0de6df4:	f5c0 70d0 	rsb	r0, r0, #416	@ 0x1a0
c0de6df8:	fb90 f0f1 	sdiv	r0, r0, r1
c0de6dfc:	4631      	mov	r1, r6
c0de6dfe:	f811 2f17 	ldrb.w	r2, [r1, #23]!
c0de6e02:	784b      	ldrb	r3, [r1, #1]
c0de6e04:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6e08:	4410      	add	r0, r2
c0de6e0a:	7008      	strb	r0, [r1, #0]
c0de6e0c:	0a00      	lsrs	r0, r0, #8
c0de6e0e:	7048      	strb	r0, [r1, #1]
c0de6e10:	2000      	movs	r0, #0
c0de6e12:	4631      	mov	r1, r6
c0de6e14:	f801 0f12 	strb.w	r0, [r1, #18]!
c0de6e18:	74f0      	strb	r0, [r6, #19]
c0de6e1a:	70c8      	strb	r0, [r1, #3]
c0de6e1c:	7088      	strb	r0, [r1, #2]
c0de6e1e:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de6e22:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6e26:	784f      	ldrb	r7, [r1, #1]
c0de6e28:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de6e2c:	788c      	ldrb	r4, [r1, #2]
c0de6e2e:	78c9      	ldrb	r1, [r1, #3]
c0de6e30:	ea42 2207 	orr.w	r2, r2, r7, lsl #8
c0de6e34:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
c0de6e38:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6e3c:	2208      	movs	r2, #8
c0de6e3e:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
c0de6e42:	2101      	movs	r1, #1
c0de6e44:	7770      	strb	r0, [r6, #29]
c0de6e46:	7731      	strb	r1, [r6, #28]
c0de6e48:	7aa9      	ldrb	r1, [r5, #10]
c0de6e4a:	2900      	cmp	r1, #0
c0de6e4c:	bf08      	it	eq
c0de6e4e:	2207      	moveq	r2, #7
c0de6e50:	77b2      	strb	r2, [r6, #30]
c0de6e52:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de6e56:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de6e5a:	3201      	adds	r2, #1
c0de6e5c:	f881 2020 	strb.w	r2, [r1, #32]
c0de6e60:	b006      	add	sp, #24
c0de6e62:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de6e66:	2005      	movs	r0, #5
c0de6e68:	f8ad 0000 	strh.w	r0, [sp]
c0de6e6c:	e9d5 0100 	ldrd	r0, r1, [r5]
c0de6e70:	9001      	str	r0, [sp, #4]
c0de6e72:	7b28      	ldrb	r0, [r5, #12]
c0de6e74:	9102      	str	r1, [sp, #8]
c0de6e76:	4669      	mov	r1, sp
c0de6e78:	f001 f879 	bl	c0de7f6e <OUTLINED_FUNCTION_73>
c0de6e7c:	f7fe f8a6 	bl	c0de4fcc <nbgl_layoutAddExtendedFooter>
c0de6e80:	e7ee      	b.n	c0de6e60 <nbgl_layoutAddButton+0x19c>

c0de6e82 <nbgl_layoutAddLongPressButton>:
c0de6e82:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de6e84:	9102      	str	r1, [sp, #8]
c0de6e86:	2100      	movs	r1, #0
c0de6e88:	f88d 300d 	strb.w	r3, [sp, #13]
c0de6e8c:	f88d 200c 	strb.w	r2, [sp, #12]
c0de6e90:	f88d 1004 	strb.w	r1, [sp, #4]
c0de6e94:	b118      	cbz	r0, c0de6e9e <nbgl_layoutAddLongPressButton+0x1c>
c0de6e96:	a901      	add	r1, sp, #4
c0de6e98:	f7fd fcf0 	bl	c0de487c <nbgl_layoutAddUpFooter>
c0de6e9c:	e001      	b.n	c0de6ea2 <nbgl_layoutAddLongPressButton+0x20>
c0de6e9e:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de6ea2:	b006      	add	sp, #24
c0de6ea4:	bd80      	pop	{r7, pc}

c0de6ea6 <nbgl_layoutAddFooter>:
c0de6ea6:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de6ea8:	9101      	str	r1, [sp, #4]
c0de6eaa:	f240 1101 	movw	r1, #257	@ 0x101
c0de6eae:	f88d 2009 	strb.w	r2, [sp, #9]
c0de6eb2:	2200      	movs	r2, #0
c0de6eb4:	f88d 300a 	strb.w	r3, [sp, #10]
c0de6eb8:	f8ad 1000 	strh.w	r1, [sp]
c0de6ebc:	4669      	mov	r1, sp
c0de6ebe:	f88d 2008 	strb.w	r2, [sp, #8]
c0de6ec2:	f7fe f883 	bl	c0de4fcc <nbgl_layoutAddExtendedFooter>
c0de6ec6:	b006      	add	sp, #24
c0de6ec8:	bd80      	pop	{r7, pc}

c0de6eca <nbgl_layoutAddSplitFooter>:
c0de6eca:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de6ecc:	9101      	str	r1, [sp, #4]
c0de6ece:	f44f 7181 	mov.w	r1, #258	@ 0x102
c0de6ed2:	f88d 200c 	strb.w	r2, [sp, #12]
c0de6ed6:	9302      	str	r3, [sp, #8]
c0de6ed8:	f8ad 1000 	strh.w	r1, [sp]
c0de6edc:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0de6ede:	f88d 100e 	strb.w	r1, [sp, #14]
c0de6ee2:	9908      	ldr	r1, [sp, #32]
c0de6ee4:	f88d 100d 	strb.w	r1, [sp, #13]
c0de6ee8:	4669      	mov	r1, sp
c0de6eea:	f7fe f86f 	bl	c0de4fcc <nbgl_layoutAddExtendedFooter>
c0de6eee:	b006      	add	sp, #24
c0de6ef0:	bd80      	pop	{r7, pc}
	...

c0de6ef4 <nbgl_layoutAddHeader>:
c0de6ef4:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de6ef8:	2800      	cmp	r0, #0
c0de6efa:	f000 8239 	beq.w	c0de7370 <nbgl_layoutAddHeader+0x47c>
c0de6efe:	460d      	mov	r5, r1
c0de6f00:	b119      	cbz	r1, c0de6f0a <nbgl_layoutAddHeader+0x16>
c0de6f02:	4604      	mov	r4, r0
c0de6f04:	7828      	ldrb	r0, [r5, #0]
c0de6f06:	2806      	cmp	r0, #6
c0de6f08:	d903      	bls.n	c0de6f12 <nbgl_layoutAddHeader+0x1e>
c0de6f0a:	f06f 0001 	mvn.w	r0, #1
c0de6f0e:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de6f12:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de6f16:	2601      	movs	r6, #1
c0de6f18:	f000 fe3d 	bl	c0de7b96 <OUTLINED_FUNCTION_16>
c0de6f1c:	2100      	movs	r1, #0
c0de6f1e:	7146      	strb	r6, [r0, #5]
c0de6f20:	77c1      	strb	r1, [r0, #31]
c0de6f22:	21e0      	movs	r1, #224	@ 0xe0
c0de6f24:	7101      	strb	r1, [r0, #4]
c0de6f26:	60e0      	str	r0, [r4, #12]
c0de6f28:	f000 ffe8 	bl	c0de7efc <OUTLINED_FUNCTION_64>
c0de6f2c:	68e1      	ldr	r1, [r4, #12]
c0de6f2e:	0a02      	lsrs	r2, r0, #8
c0de6f30:	0e03      	lsrs	r3, r0, #24
c0de6f32:	f881 2023 	strb.w	r2, [r1, #35]	@ 0x23
c0de6f36:	2202      	movs	r2, #2
c0de6f38:	f001 f804 	bl	c0de7f44 <OUTLINED_FUNCTION_70>
c0de6f3c:	70d3      	strb	r3, [r2, #3]
c0de6f3e:	7828      	ldrb	r0, [r5, #0]
c0de6f40:	1e42      	subs	r2, r0, #1
c0de6f42:	2a02      	cmp	r2, #2
c0de6f44:	d311      	bcc.n	c0de6f6a <nbgl_layoutAddHeader+0x76>
c0de6f46:	2806      	cmp	r0, #6
c0de6f48:	f000 80ab 	beq.w	c0de70a2 <nbgl_layoutAddHeader+0x1ae>
c0de6f4c:	2803      	cmp	r0, #3
c0de6f4e:	f000 81d9 	beq.w	c0de7304 <nbgl_layoutAddHeader+0x410>
c0de6f52:	2804      	cmp	r0, #4
c0de6f54:	f000 80d5 	beq.w	c0de7102 <nbgl_layoutAddHeader+0x20e>
c0de6f58:	2805      	cmp	r0, #5
c0de6f5a:	d006      	beq.n	c0de6f6a <nbgl_layoutAddHeader+0x76>
c0de6f5c:	2800      	cmp	r0, #0
c0de6f5e:	d1d4      	bne.n	c0de6f0a <nbgl_layoutAddHeader+0x16>
c0de6f60:	88a8      	ldrh	r0, [r5, #4]
c0de6f62:	7188      	strb	r0, [r1, #6]
c0de6f64:	0a00      	lsrs	r0, r0, #8
c0de6f66:	71c8      	strb	r0, [r1, #7]
c0de6f68:	e1cc      	b.n	c0de7304 <nbgl_layoutAddHeader+0x410>
c0de6f6a:	f000 ff65 	bl	c0de7e38 <OUTLINED_FUNCTION_49>
c0de6f6e:	9001      	str	r0, [sp, #4]
c0de6f70:	7828      	ldrb	r0, [r5, #0]
c0de6f72:	210c      	movs	r1, #12
c0de6f74:	2805      	cmp	r0, #5
c0de6f76:	bf08      	it	eq
c0de6f78:	210d      	moveq	r1, #13
c0de6f7a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de6f7e:	f815 b001 	ldrb.w	fp, [r5, r1]
c0de6f82:	f000 fe0c 	bl	c0de7b9e <OUTLINED_FUNCTION_17>
c0de6f86:	4606      	mov	r6, r0
c0de6f88:	f04f 0a03 	mov.w	sl, #3
c0de6f8c:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de6f90:	d00d      	beq.n	c0de6fae <nbgl_layoutAddHeader+0xba>
c0de6f92:	7828      	ldrb	r0, [r5, #0]
c0de6f94:	210d      	movs	r1, #13
c0de6f96:	465a      	mov	r2, fp
c0de6f98:	2805      	cmp	r0, #5
c0de6f9a:	bf08      	it	eq
c0de6f9c:	210f      	moveq	r1, #15
c0de6f9e:	5c6b      	ldrb	r3, [r5, r1]
c0de6fa0:	f000 fd5e 	bl	c0de7a60 <OUTLINED_FUNCTION_6>
c0de6fa4:	2800      	cmp	r0, #0
c0de6fa6:	f000 81e3 	beq.w	c0de7370 <nbgl_layoutAddHeader+0x47c>
c0de6faa:	2000      	movs	r0, #0
c0de6fac:	e000      	b.n	c0de6fb0 <nbgl_layoutAddHeader+0xbc>
c0de6fae:	2003      	movs	r0, #3
c0de6fb0:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de6fb4:	2004      	movs	r0, #4
c0de6fb6:	f04f 0800 	mov.w	r8, #0
c0de6fba:	2160      	movs	r1, #96	@ 0x60
c0de6fbc:	f886 a01f 	strb.w	sl, [r6, #31]
c0de6fc0:	f886 a020 	strb.w	sl, [r6, #32]
c0de6fc4:	75b0      	strb	r0, [r6, #22]
c0de6fc6:	4630      	mov	r0, r6
c0de6fc8:	71b1      	strb	r1, [r6, #6]
c0de6fca:	2168      	movs	r1, #104	@ 0x68
c0de6fcc:	f886 8026 	strb.w	r8, [r6, #38]	@ 0x26
c0de6fd0:	f886 8007 	strb.w	r8, [r6, #7]
c0de6fd4:	f886 8005 	strb.w	r8, [r6, #5]
c0de6fd8:	f800 8f25 	strb.w	r8, [r0, #37]!
c0de6fdc:	7131      	strb	r1, [r6, #4]
c0de6fde:	f880 8003 	strb.w	r8, [r0, #3]
c0de6fe2:	f880 8002 	strb.w	r8, [r0, #2]
c0de6fe6:	48e4      	ldr	r0, [pc, #912]	@ (c0de7378 <nbgl_layoutAddHeader+0x484>)
c0de6fe8:	4478      	add	r0, pc
c0de6fea:	f004 fffd 	bl	c0debfe8 <pic>
c0de6fee:	4631      	mov	r1, r6
c0de6ff0:	0e02      	lsrs	r2, r0, #24
c0de6ff2:	f886 801d 	strb.w	r8, [r6, #29]
c0de6ff6:	f000 fd5f 	bl	c0de7ab8 <OUTLINED_FUNCTION_9>
c0de6ffa:	f1bb 00ff 	subs.w	r0, fp, #255	@ 0xff
c0de6ffe:	bf18      	it	ne
c0de7000:	2001      	movne	r0, #1
c0de7002:	7730      	strb	r0, [r6, #28]
c0de7004:	9f01      	ldr	r7, [sp, #4]
c0de7006:	68e1      	ldr	r1, [r4, #12]
c0de7008:	2006      	movs	r0, #6
c0de700a:	77b0      	strb	r0, [r6, #30]
c0de700c:	f891 0020 	ldrb.w	r0, [r1, #32]
c0de7010:	3001      	adds	r0, #1
c0de7012:	2f00      	cmp	r7, #0
c0de7014:	f881 0020 	strb.w	r0, [r1, #32]
c0de7018:	f000 809a 	beq.w	c0de7150 <nbgl_layoutAddHeader+0x25c>
c0de701c:	7828      	ldrb	r0, [r5, #0]
c0de701e:	f04f 0a00 	mov.w	sl, #0
c0de7022:	2802      	cmp	r0, #2
c0de7024:	d122      	bne.n	c0de706c <nbgl_layoutAddHeader+0x178>
c0de7026:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de702a:	f000 fde7 	bl	c0de7bfc <OUTLINED_FUNCTION_21>
c0de702e:	4606      	mov	r6, r0
c0de7030:	f000 fdfa 	bl	c0de7c28 <OUTLINED_FUNCTION_23>
c0de7034:	4631      	mov	r1, r6
c0de7036:	0e02      	lsrs	r2, r0, #24
c0de7038:	f886 a01f 	strb.w	sl, [r6, #31]
c0de703c:	46b2      	mov	sl, r6
c0de703e:	f000 ff2d 	bl	c0de7e9c <OUTLINED_FUNCTION_56>
c0de7042:	68e0      	ldr	r0, [r4, #12]
c0de7044:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7048:	7843      	ldrb	r3, [r0, #1]
c0de704a:	f810 cc02 	ldrb.w	ip, [r0, #-2]
c0de704e:	7882      	ldrb	r2, [r0, #2]
c0de7050:	78c0      	ldrb	r0, [r0, #3]
c0de7052:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de7056:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de705a:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de705e:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de7062:	2005      	movs	r0, #5
c0de7064:	75b0      	strb	r0, [r6, #22]
c0de7066:	68e0      	ldr	r0, [r4, #12]
c0de7068:	f000 fcb0 	bl	c0de79cc <OUTLINED_FUNCTION_1>
c0de706c:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7070:	f000 fca8 	bl	c0de79c4 <OUTLINED_FUNCTION_0>
c0de7074:	782b      	ldrb	r3, [r5, #0]
c0de7076:	4680      	mov	r8, r0
c0de7078:	2b05      	cmp	r3, #5
c0de707a:	d16c      	bne.n	c0de7156 <nbgl_layoutAddHeader+0x262>
c0de707c:	7b2a      	ldrb	r2, [r5, #12]
c0de707e:	2aff      	cmp	r2, #255	@ 0xff
c0de7080:	d068      	beq.n	c0de7154 <nbgl_layoutAddHeader+0x260>
c0de7082:	7beb      	ldrb	r3, [r5, #15]
c0de7084:	4620      	mov	r0, r4
c0de7086:	4641      	mov	r1, r8
c0de7088:	f7fd f97a 	bl	c0de4380 <layoutAddCallbackObj>
c0de708c:	2800      	cmp	r0, #0
c0de708e:	f000 816f 	beq.w	c0de7370 <nbgl_layoutAddHeader+0x47c>
c0de7092:	2000      	movs	r0, #0
c0de7094:	f888 001d 	strb.w	r0, [r8, #29]
c0de7098:	2001      	movs	r0, #1
c0de709a:	f888 001c 	strb.w	r0, [r8, #28]
c0de709e:	782b      	ldrb	r3, [r5, #0]
c0de70a0:	e059      	b.n	c0de7156 <nbgl_layoutAddHeader+0x262>
c0de70a2:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de70a6:	f000 fc8d 	bl	c0de79c4 <OUTLINED_FUNCTION_0>
c0de70aa:	4606      	mov	r6, r0
c0de70ac:	7a2a      	ldrb	r2, [r5, #8]
c0de70ae:	7a6b      	ldrb	r3, [r5, #9]
c0de70b0:	f000 fcd6 	bl	c0de7a60 <OUTLINED_FUNCTION_6>
c0de70b4:	2800      	cmp	r0, #0
c0de70b6:	f000 815b 	beq.w	c0de7370 <nbgl_layoutAddHeader+0x47c>
c0de70ba:	2020      	movs	r0, #32
c0de70bc:	4637      	mov	r7, r6
c0de70be:	f04f 0a00 	mov.w	sl, #0
c0de70c2:	f04f 0806 	mov.w	r8, #6
c0de70c6:	f04f 0b01 	mov.w	fp, #1
c0de70ca:	75f0      	strb	r0, [r6, #23]
c0de70cc:	20a0      	movs	r0, #160	@ 0xa0
c0de70ce:	f886 a01f 	strb.w	sl, [r6, #31]
c0de70d2:	f886 a018 	strb.w	sl, [r6, #24]
c0de70d6:	f886 8016 	strb.w	r8, [r6, #22]
c0de70da:	f886 b005 	strb.w	fp, [r6, #5]
c0de70de:	7130      	strb	r0, [r6, #4]
c0de70e0:	2060      	movs	r0, #96	@ 0x60
c0de70e2:	f807 0f06 	strb.w	r0, [r7, #6]!
c0de70e6:	f887 a001 	strb.w	sl, [r7, #1]
c0de70ea:	f000 fd9d 	bl	c0de7c28 <OUTLINED_FUNCTION_23>
c0de70ee:	f000 fee7 	bl	c0de7ec0 <OUTLINED_FUNCTION_58>
c0de70f2:	f886 8020 	strb.w	r8, [r6, #32]
c0de70f6:	f000 fcb7 	bl	c0de7a68 <OUTLINED_FUNCTION_7>
c0de70fa:	f000 fee6 	bl	c0de7eca <OUTLINED_FUNCTION_59>
c0de70fe:	77b0      	strb	r0, [r6, #30]
c0de7100:	e01e      	b.n	c0de7140 <nbgl_layoutAddHeader+0x24c>
c0de7102:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7106:	f000 fc5d 	bl	c0de79c4 <OUTLINED_FUNCTION_0>
c0de710a:	4606      	mov	r6, r0
c0de710c:	21a0      	movs	r1, #160	@ 0xa0
c0de710e:	2000      	movs	r0, #0
c0de7110:	f04f 0801 	mov.w	r8, #1
c0de7114:	7131      	strb	r1, [r6, #4]
c0de7116:	2160      	movs	r1, #96	@ 0x60
c0de7118:	4637      	mov	r7, r6
c0de711a:	77f0      	strb	r0, [r6, #31]
c0de711c:	f886 8005 	strb.w	r8, [r6, #5]
c0de7120:	f807 1f06 	strb.w	r1, [r7, #6]!
c0de7124:	7078      	strb	r0, [r7, #1]
c0de7126:	f000 fd7f 	bl	c0de7c28 <OUTLINED_FUNCTION_23>
c0de712a:	4631      	mov	r1, r6
c0de712c:	0e02      	lsrs	r2, r0, #24
c0de712e:	f886 8024 	strb.w	r8, [r6, #36]	@ 0x24
c0de7132:	f000 fc99 	bl	c0de7a68 <OUTLINED_FUNCTION_7>
c0de7136:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de713a:	2005      	movs	r0, #5
c0de713c:	f886 0020 	strb.w	r0, [r6, #32]
c0de7140:	68e1      	ldr	r1, [r4, #12]
c0de7142:	787a      	ldrb	r2, [r7, #1]
c0de7144:	7838      	ldrb	r0, [r7, #0]
c0de7146:	71ca      	strb	r2, [r1, #7]
c0de7148:	7188      	strb	r0, [r1, #6]
c0de714a:	f000 fec9 	bl	c0de7ee0 <OUTLINED_FUNCTION_61>
c0de714e:	e0d9      	b.n	c0de7304 <nbgl_layoutAddHeader+0x410>
c0de7150:	7828      	ldrb	r0, [r5, #0]
c0de7152:	e096      	b.n	c0de7282 <nbgl_layoutAddHeader+0x38e>
c0de7154:	2305      	movs	r3, #5
c0de7156:	68e2      	ldr	r2, [r4, #12]
c0de7158:	f04f 0e00 	mov.w	lr, #0
c0de715c:	f04f 0c05 	mov.w	ip, #5
c0de7160:	f888 e01f 	strb.w	lr, [r8, #31]
c0de7164:	f888 c016 	strb.w	ip, [r8, #22]
c0de7168:	7916      	ldrb	r6, [r2, #4]
c0de716a:	7952      	ldrb	r2, [r2, #5]
c0de716c:	ea46 2602 	orr.w	r6, r6, r2, lsl #8
c0de7170:	f1a6 02d0 	sub.w	r2, r6, #208	@ 0xd0
c0de7174:	0a10      	lsrs	r0, r2, #8
c0de7176:	f888 2004 	strb.w	r2, [r8, #4]
c0de717a:	2b02      	cmp	r3, #2
c0de717c:	f888 0005 	strb.w	r0, [r8, #5]
c0de7180:	d117      	bne.n	c0de71b2 <nbgl_layoutAddHeader+0x2be>
c0de7182:	4650      	mov	r0, sl
c0de7184:	f810 2f21 	ldrb.w	r2, [r0, #33]!
c0de7188:	7843      	ldrb	r3, [r0, #1]
c0de718a:	7881      	ldrb	r1, [r0, #2]
c0de718c:	78c0      	ldrb	r0, [r0, #3]
c0de718e:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de7192:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de7196:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de719a:	7801      	ldrb	r1, [r0, #0]
c0de719c:	7840      	ldrb	r0, [r0, #1]
c0de719e:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de71a2:	1a30      	subs	r0, r6, r0
c0de71a4:	f1a0 02e0 	sub.w	r2, r0, #224	@ 0xe0
c0de71a8:	0a10      	lsrs	r0, r2, #8
c0de71aa:	f888 2004 	strb.w	r2, [r8, #4]
c0de71ae:	f888 0005 	strb.w	r0, [r8, #5]
c0de71b2:	4640      	mov	r0, r8
c0de71b4:	0e39      	lsrs	r1, r7, #24
c0de71b6:	b292      	uxth	r2, r2
c0de71b8:	2301      	movs	r3, #1
c0de71ba:	f800 7f26 	strb.w	r7, [r0, #38]!
c0de71be:	70c1      	strb	r1, [r0, #3]
c0de71c0:	0c39      	lsrs	r1, r7, #16
c0de71c2:	f800 ec1f 	strb.w	lr, [r0, #-31]
c0de71c6:	f800 cc06 	strb.w	ip, [r0, #-6]
c0de71ca:	7081      	strb	r1, [r0, #2]
c0de71cc:	0a39      	lsrs	r1, r7, #8
c0de71ce:	7041      	strb	r1, [r0, #1]
c0de71d0:	2160      	movs	r1, #96	@ 0x60
c0de71d2:	f800 1c20 	strb.w	r1, [r0, #-32]
c0de71d6:	210c      	movs	r1, #12
c0de71d8:	f800 1c04 	strb.w	r1, [r0, #-4]
c0de71dc:	2101      	movs	r1, #1
c0de71de:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de71e2:	200c      	movs	r0, #12
c0de71e4:	4639      	mov	r1, r7
c0de71e6:	f004 fd3c 	bl	c0debc62 <nbgl_getTextNbLinesInWidth>
c0de71ea:	7828      	ldrb	r0, [r5, #0]
c0de71ec:	2802      	cmp	r0, #2
c0de71ee:	d115      	bne.n	c0de721c <nbgl_layoutAddHeader+0x328>
c0de71f0:	4646      	mov	r6, r8
c0de71f2:	f816 cf26 	ldrb.w	ip, [r6, #38]!
c0de71f6:	7872      	ldrb	r2, [r6, #1]
c0de71f8:	78b3      	ldrb	r3, [r6, #2]
c0de71fa:	78f1      	ldrb	r1, [r6, #3]
c0de71fc:	f816 0c04 	ldrb.w	r0, [r6, #-4]
c0de7200:	ea4c 2202 	orr.w	r2, ip, r2, lsl #8
c0de7204:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de7208:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de720c:	f004 fd2e 	bl	c0debc6c <nbgl_getTextWidth>
c0de7210:	f806 0c22 	strb.w	r0, [r6, #-34]
c0de7214:	0a00      	lsrs	r0, r0, #8
c0de7216:	f806 0c21 	strb.w	r0, [r6, #-33]
c0de721a:	7828      	ldrb	r0, [r5, #0]
c0de721c:	68e1      	ldr	r1, [r4, #12]
c0de721e:	f000 fd65 	bl	c0de7cec <OUTLINED_FUNCTION_32>
c0de7222:	f841 8023 	str.w	r8, [r1, r3, lsl #2]
c0de7226:	68e1      	ldr	r1, [r4, #12]
c0de7228:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de722c:	3201      	adds	r2, #1
c0de722e:	2802      	cmp	r0, #2
c0de7230:	f881 2020 	strb.w	r2, [r1, #32]
c0de7234:	d125      	bne.n	c0de7282 <nbgl_layoutAddHeader+0x38e>
c0de7236:	f898 0004 	ldrb.w	r0, [r8, #4]
c0de723a:	f898 2005 	ldrb.w	r2, [r8, #5]
c0de723e:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de7242:	f06f 0207 	mvn.w	r2, #7
c0de7246:	eba2 0050 	sub.w	r0, r2, r0, lsr #1
c0de724a:	f81a 2f21 	ldrb.w	r2, [sl, #33]!
c0de724e:	f80a 0c0a 	strb.w	r0, [sl, #-10]
c0de7252:	0a00      	lsrs	r0, r0, #8
c0de7254:	f89a 3002 	ldrb.w	r3, [sl, #2]
c0de7258:	f89a 6003 	ldrb.w	r6, [sl, #3]
c0de725c:	f80a 0c09 	strb.w	r0, [sl, #-9]
c0de7260:	f89a 0001 	ldrb.w	r0, [sl, #1]
c0de7264:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de7268:	ea43 2206 	orr.w	r2, r3, r6, lsl #8
c0de726c:	f000 fea3 	bl	c0de7fb6 <OUTLINED_FUNCTION_81>
c0de7270:	2208      	movs	r2, #8
c0de7272:	eb02 0050 	add.w	r0, r2, r0, lsr #1
c0de7276:	f888 0017 	strb.w	r0, [r8, #23]
c0de727a:	0a00      	lsrs	r0, r0, #8
c0de727c:	f888 0018 	strb.w	r0, [r8, #24]
c0de7280:	e03c      	b.n	c0de72fc <nbgl_layoutAddHeader+0x408>
c0de7282:	2805      	cmp	r0, #5
c0de7284:	d13a      	bne.n	c0de72fc <nbgl_layoutAddHeader+0x408>
c0de7286:	6868      	ldr	r0, [r5, #4]
c0de7288:	b3c0      	cbz	r0, c0de72fc <nbgl_layoutAddHeader+0x408>
c0de728a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de728e:	f000 fc86 	bl	c0de7b9e <OUTLINED_FUNCTION_17>
c0de7292:	7baa      	ldrb	r2, [r5, #14]
c0de7294:	4606      	mov	r6, r0
c0de7296:	2aff      	cmp	r2, #255	@ 0xff
c0de7298:	d008      	beq.n	c0de72ac <nbgl_layoutAddHeader+0x3b8>
c0de729a:	7beb      	ldrb	r3, [r5, #15]
c0de729c:	f000 fbe0 	bl	c0de7a60 <OUTLINED_FUNCTION_6>
c0de72a0:	2800      	cmp	r0, #0
c0de72a2:	d065      	beq.n	c0de7370 <nbgl_layoutAddHeader+0x47c>
c0de72a4:	2000      	movs	r0, #0
c0de72a6:	7770      	strb	r0, [r6, #29]
c0de72a8:	2001      	movs	r0, #1
c0de72aa:	7730      	strb	r0, [r6, #28]
c0de72ac:	2003      	movs	r0, #3
c0de72ae:	2106      	movs	r1, #6
c0de72b0:	2260      	movs	r2, #96	@ 0x60
c0de72b2:	77f0      	strb	r0, [r6, #31]
c0de72b4:	75b1      	strb	r1, [r6, #22]
c0de72b6:	7ba9      	ldrb	r1, [r5, #14]
c0de72b8:	71b2      	strb	r2, [r6, #6]
c0de72ba:	2268      	movs	r2, #104	@ 0x68
c0de72bc:	f886 0020 	strb.w	r0, [r6, #32]
c0de72c0:	2000      	movs	r0, #0
c0de72c2:	7132      	strb	r2, [r6, #4]
c0de72c4:	4632      	mov	r2, r6
c0de72c6:	f886 0026 	strb.w	r0, [r6, #38]	@ 0x26
c0de72ca:	71f0      	strb	r0, [r6, #7]
c0de72cc:	7170      	strb	r0, [r6, #5]
c0de72ce:	f802 0f25 	strb.w	r0, [r2, #37]!
c0de72d2:	70d0      	strb	r0, [r2, #3]
c0de72d4:	7090      	strb	r0, [r2, #2]
c0de72d6:	f1a1 00ff 	sub.w	r0, r1, #255	@ 0xff
c0de72da:	fab0 f080 	clz	r0, r0
c0de72de:	0940      	lsrs	r0, r0, #5
c0de72e0:	0040      	lsls	r0, r0, #1
c0de72e2:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de72e6:	f000 fc9f 	bl	c0de7c28 <OUTLINED_FUNCTION_23>
c0de72ea:	4631      	mov	r1, r6
c0de72ec:	0e02      	lsrs	r2, r0, #24
c0de72ee:	f000 fbe3 	bl	c0de7ab8 <OUTLINED_FUNCTION_9>
c0de72f2:	2008      	movs	r0, #8
c0de72f4:	68e1      	ldr	r1, [r4, #12]
c0de72f6:	77b0      	strb	r0, [r6, #30]
c0de72f8:	f000 fdf2 	bl	c0de7ee0 <OUTLINED_FUNCTION_61>
c0de72fc:	2000      	movs	r0, #0
c0de72fe:	71c8      	strb	r0, [r1, #7]
c0de7300:	2060      	movs	r0, #96	@ 0x60
c0de7302:	7188      	strb	r0, [r1, #6]
c0de7304:	7868      	ldrb	r0, [r5, #1]
c0de7306:	b160      	cbz	r0, c0de7322 <nbgl_layoutAddHeader+0x42e>
c0de7308:	f000 fca1 	bl	c0de7c4e <OUTLINED_FUNCTION_25>
c0de730c:	68e1      	ldr	r1, [r4, #12]
c0de730e:	f000 fb8a 	bl	c0de7a26 <OUTLINED_FUNCTION_4>
c0de7312:	2103      	movs	r1, #3
c0de7314:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de7318:	2108      	movs	r1, #8
c0de731a:	7581      	strb	r1, [r0, #22]
c0de731c:	68e1      	ldr	r1, [r4, #12]
c0de731e:	f000 fddf 	bl	c0de7ee0 <OUTLINED_FUNCTION_61>
c0de7322:	68a0      	ldr	r0, [r4, #8]
c0de7324:	6001      	str	r1, [r0, #0]
c0de7326:	68e0      	ldr	r0, [r4, #12]
c0de7328:	f8d4 10a0 	ldr.w	r1, [r4, #160]	@ 0xa0
c0de732c:	4602      	mov	r2, r0
c0de732e:	f812 3f06 	ldrb.w	r3, [r2, #6]!
c0de7332:	7856      	ldrb	r6, [r2, #1]
c0de7334:	f801 0f12 	strb.w	r0, [r1, #18]!
c0de7338:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de733c:	f811 6d0c 	ldrb.w	r6, [r1, #-12]!
c0de7340:	784f      	ldrb	r7, [r1, #1]
c0de7342:	ea46 2607 	orr.w	r6, r6, r7, lsl #8
c0de7346:	1af3      	subs	r3, r6, r3
c0de7348:	700b      	strb	r3, [r1, #0]
c0de734a:	0a1b      	lsrs	r3, r3, #8
c0de734c:	704b      	strb	r3, [r1, #1]
c0de734e:	782b      	ldrb	r3, [r5, #0]
c0de7350:	f884 30aa 	strb.w	r3, [r4, #170]	@ 0xaa
c0de7354:	0e03      	lsrs	r3, r0, #24
c0de7356:	73cb      	strb	r3, [r1, #15]
c0de7358:	0c03      	lsrs	r3, r0, #16
c0de735a:	0a00      	lsrs	r0, r0, #8
c0de735c:	7348      	strb	r0, [r1, #13]
c0de735e:	2007      	movs	r0, #7
c0de7360:	738b      	strb	r3, [r1, #14]
c0de7362:	7408      	strb	r0, [r1, #16]
c0de7364:	7810      	ldrb	r0, [r2, #0]
c0de7366:	7851      	ldrb	r1, [r2, #1]
c0de7368:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de736c:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de7370:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de7374:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de7378:	00006081 	.word	0x00006081

c0de737c <nbgl_layoutAddProgressIndicator>:
c0de737c:	b51f      	push	{r0, r1, r2, r3, r4, lr}
c0de737e:	9c07      	ldr	r4, [sp, #28]
c0de7380:	f88d 1008 	strb.w	r1, [sp, #8]
c0de7384:	2100      	movs	r1, #0
c0de7386:	f88d 300a 	strb.w	r3, [sp, #10]
c0de738a:	f88d 2009 	strb.w	r2, [sp, #9]
c0de738e:	9101      	str	r1, [sp, #4]
c0de7390:	2103      	movs	r1, #3
c0de7392:	f88d 400d 	strb.w	r4, [sp, #13]
c0de7396:	24ff      	movs	r4, #255	@ 0xff
c0de7398:	f8ad 1000 	strh.w	r1, [sp]
c0de739c:	4669      	mov	r1, sp
c0de739e:	f88d 400c 	strb.w	r4, [sp, #12]
c0de73a2:	9c06      	ldr	r4, [sp, #24]
c0de73a4:	f88d 400b 	strb.w	r4, [sp, #11]
c0de73a8:	f7ff fda4 	bl	c0de6ef4 <nbgl_layoutAddHeader>
c0de73ac:	b004      	add	sp, #16
c0de73ae:	bd10      	pop	{r4, pc}

c0de73b0 <nbgl_layoutAddSpinner>:
c0de73b0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de73b4:	b088      	sub	sp, #32
c0de73b6:	2800      	cmp	r0, #0
c0de73b8:	f000 811a 	beq.w	c0de75f0 <nbgl_layoutAddSpinner+0x240>
c0de73bc:	9101      	str	r1, [sp, #4]
c0de73be:	f000 fdf1 	bl	c0de7fa4 <OUTLINED_FUNCTION_79>
c0de73c2:	469a      	mov	sl, r3
c0de73c4:	2601      	movs	r6, #1
c0de73c6:	4f8d      	ldr	r7, [pc, #564]	@ (c0de75fc <nbgl_layoutAddSpinner+0x24c>)
c0de73c8:	9203      	str	r2, [sp, #12]
c0de73ca:	08c1      	lsrs	r1, r0, #3
c0de73cc:	2001      	movs	r0, #1
c0de73ce:	447f      	add	r7, pc
c0de73d0:	47b8      	blx	r7
c0de73d2:	4683      	mov	fp, r0
c0de73d4:	2003      	movs	r0, #3
c0de73d6:	463d      	mov	r5, r7
c0de73d8:	f88b 0020 	strb.w	r0, [fp, #32]
c0de73dc:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de73e0:	08c1      	lsrs	r1, r0, #3
c0de73e2:	2003      	movs	r0, #3
c0de73e4:	f004 fc24 	bl	c0debc30 <nbgl_containerPoolGet>
c0de73e8:	2100      	movs	r1, #0
c0de73ea:	f88b 6005 	strb.w	r6, [fp, #5]
c0de73ee:	465e      	mov	r6, fp
c0de73f0:	270d      	movs	r7, #13
c0de73f2:	f88b 101f 	strb.w	r1, [fp, #31]
c0de73f6:	21a0      	movs	r1, #160	@ 0xa0
c0de73f8:	f806 0f22 	strb.w	r0, [r6, #34]!
c0de73fc:	f88b 1004 	strb.w	r1, [fp, #4]
c0de7400:	2105      	movs	r1, #5
c0de7402:	f88b 1016 	strb.w	r1, [fp, #22]
c0de7406:	0e01      	lsrs	r1, r0, #24
c0de7408:	f000 fd65 	bl	c0de7ed6 <OUTLINED_FUNCTION_60>
c0de740c:	f88b 0023 	strb.w	r0, [fp, #35]	@ 0x23
c0de7410:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7414:	08c1      	lsrs	r1, r0, #3
c0de7416:	200d      	movs	r0, #13
c0de7418:	47a8      	blx	r5
c0de741a:	4680      	mov	r8, r0
c0de741c:	f880 a01f 	strb.w	sl, [r0, #31]
c0de7420:	2002      	movs	r0, #2
c0de7422:	7831      	ldrb	r1, [r6, #0]
c0de7424:	78b2      	ldrb	r2, [r6, #2]
c0de7426:	78f3      	ldrb	r3, [r6, #3]
c0de7428:	f8cd a008 	str.w	sl, [sp, #8]
c0de742c:	46da      	mov	sl, fp
c0de742e:	9404      	str	r4, [sp, #16]
c0de7430:	f888 0016 	strb.w	r0, [r8, #22]
c0de7434:	f89b 0023 	ldrb.w	r0, [fp, #35]	@ 0x23
c0de7438:	f000 fcf7 	bl	c0de7e2a <OUTLINED_FUNCTION_48>
c0de743c:	f8c0 8000 	str.w	r8, [r0]
c0de7440:	f81a 0f06 	ldrb.w	r0, [sl, #6]!
c0de7444:	f89a 1001 	ldrb.w	r1, [sl, #1]
c0de7448:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de744c:	3030      	adds	r0, #48	@ 0x30
c0de744e:	f88a 0000 	strb.w	r0, [sl]
c0de7452:	0a00      	lsrs	r0, r0, #8
c0de7454:	f88a 0001 	strb.w	r0, [sl, #1]
c0de7458:	9804      	ldr	r0, [sp, #16]
c0de745a:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de745e:	08c1      	lsrs	r1, r0, #3
c0de7460:	2004      	movs	r0, #4
c0de7462:	47a8      	blx	r5
c0de7464:	4605      	mov	r5, r0
c0de7466:	2000      	movs	r0, #0
c0de7468:	ea4f 2418 	mov.w	r4, r8, lsr #8
c0de746c:	77e8      	strb	r0, [r5, #31]
c0de746e:	9801      	ldr	r0, [sp, #4]
c0de7470:	f004 fdba 	bl	c0debfe8 <pic>
c0de7474:	4601      	mov	r1, r0
c0de7476:	2001      	movs	r0, #1
c0de7478:	22a0      	movs	r2, #160	@ 0xa0
c0de747a:	74ec      	strb	r4, [r5, #19]
c0de747c:	462c      	mov	r4, r5
c0de747e:	7168      	strb	r0, [r5, #5]
c0de7480:	f885 0024 	strb.w	r0, [r5, #36]	@ 0x24
c0de7484:	9803      	ldr	r0, [sp, #12]
c0de7486:	712a      	strb	r2, [r5, #4]
c0de7488:	2800      	cmp	r0, #0
c0de748a:	bf08      	it	eq
c0de748c:	270b      	moveq	r7, #11
c0de748e:	f885 7022 	strb.w	r7, [r5, #34]	@ 0x22
c0de7492:	2005      	movs	r0, #5
c0de7494:	0e0a      	lsrs	r2, r1, #24
c0de7496:	2301      	movs	r3, #1
c0de7498:	f885 0020 	strb.w	r0, [r5, #32]
c0de749c:	2008      	movs	r0, #8
c0de749e:	75a8      	strb	r0, [r5, #22]
c0de74a0:	4628      	mov	r0, r5
c0de74a2:	f000 fb52 	bl	c0de7b4a <OUTLINED_FUNCTION_13>
c0de74a6:	ea4f 6218 	mov.w	r2, r8, lsr #24
c0de74aa:	f885 0027 	strb.w	r0, [r5, #39]	@ 0x27
c0de74ae:	2018      	movs	r0, #24
c0de74b0:	f804 0f19 	strb.w	r0, [r4, #25]!
c0de74b4:	2000      	movs	r0, #0
c0de74b6:	7060      	strb	r0, [r4, #1]
c0de74b8:	4628      	mov	r0, r5
c0de74ba:	f800 8f12 	strb.w	r8, [r0, #18]!
c0de74be:	70c2      	strb	r2, [r0, #3]
c0de74c0:	ea4f 4218 	mov.w	r2, r8, lsr #16
c0de74c4:	f8dd 8010 	ldr.w	r8, [sp, #16]
c0de74c8:	7082      	strb	r2, [r0, #2]
c0de74ca:	4638      	mov	r0, r7
c0de74cc:	f000 fcc1 	bl	c0de7e52 <OUTLINED_FUNCTION_51>
c0de74d0:	2100      	movs	r1, #0
c0de74d2:	71a8      	strb	r0, [r5, #6]
c0de74d4:	f885 1021 	strb.w	r1, [r5, #33]	@ 0x21
c0de74d8:	0a01      	lsrs	r1, r0, #8
c0de74da:	7832      	ldrb	r2, [r6, #0]
c0de74dc:	78b3      	ldrb	r3, [r6, #2]
c0de74de:	78f6      	ldrb	r6, [r6, #3]
c0de74e0:	71e9      	strb	r1, [r5, #7]
c0de74e2:	f89b 1023 	ldrb.w	r1, [fp, #35]	@ 0x23
c0de74e6:	f000 fd53 	bl	c0de7f90 <OUTLINED_FUNCTION_76>
c0de74ea:	7862      	ldrb	r2, [r4, #1]
c0de74ec:	604d      	str	r5, [r1, #4]
c0de74ee:	7821      	ldrb	r1, [r4, #0]
c0de74f0:	9c03      	ldr	r4, [sp, #12]
c0de74f2:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de74f6:	f89a 2001 	ldrb.w	r2, [sl, #1]
c0de74fa:	4408      	add	r0, r1
c0de74fc:	f89a 1000 	ldrb.w	r1, [sl]
c0de7500:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7504:	4408      	add	r0, r1
c0de7506:	f88a 0000 	strb.w	r0, [sl]
c0de750a:	0a00      	lsrs	r0, r0, #8
c0de750c:	2c00      	cmp	r4, #0
c0de750e:	f88a 0001 	strb.w	r0, [sl, #1]
c0de7512:	d051      	beq.n	c0de75b8 <nbgl_layoutAddSpinner+0x208>
c0de7514:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de7518:	f000 fa54 	bl	c0de79c4 <OUTLINED_FUNCTION_0>
c0de751c:	2600      	movs	r6, #0
c0de751e:	4607      	mov	r7, r0
c0de7520:	77c6      	strb	r6, [r0, #31]
c0de7522:	4620      	mov	r0, r4
c0de7524:	f004 fd60 	bl	c0debfe8 <pic>
c0de7528:	4601      	mov	r1, r0
c0de752a:	0a28      	lsrs	r0, r5, #8
c0de752c:	22a0      	movs	r2, #160	@ 0xa0
c0de752e:	463c      	mov	r4, r7
c0de7530:	2301      	movs	r3, #1
c0de7532:	74f8      	strb	r0, [r7, #19]
c0de7534:	2001      	movs	r0, #1
c0de7536:	713a      	strb	r2, [r7, #4]
c0de7538:	0e0a      	lsrs	r2, r1, #24
c0de753a:	7178      	strb	r0, [r7, #5]
c0de753c:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de7540:	200b      	movs	r0, #11
c0de7542:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de7546:	2005      	movs	r0, #5
c0de7548:	f887 0020 	strb.w	r0, [r7, #32]
c0de754c:	2008      	movs	r0, #8
c0de754e:	75b8      	strb	r0, [r7, #22]
c0de7550:	4638      	mov	r0, r7
c0de7552:	f000 fafa 	bl	c0de7b4a <OUTLINED_FUNCTION_13>
c0de7556:	0e2a      	lsrs	r2, r5, #24
c0de7558:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de755c:	2010      	movs	r0, #16
c0de755e:	f804 0f19 	strb.w	r0, [r4, #25]!
c0de7562:	4638      	mov	r0, r7
c0de7564:	f800 5f12 	strb.w	r5, [r0, #18]!
c0de7568:	7066      	strb	r6, [r4, #1]
c0de756a:	70c2      	strb	r2, [r0, #3]
c0de756c:	0c2a      	lsrs	r2, r5, #16
c0de756e:	7082      	strb	r2, [r0, #2]
c0de7570:	200b      	movs	r0, #11
c0de7572:	f000 fc6e 	bl	c0de7e52 <OUTLINED_FUNCTION_51>
c0de7576:	0a01      	lsrs	r1, r0, #8
c0de7578:	7862      	ldrb	r2, [r4, #1]
c0de757a:	71b8      	strb	r0, [r7, #6]
c0de757c:	f887 6021 	strb.w	r6, [r7, #33]	@ 0x21
c0de7580:	71f9      	strb	r1, [r7, #7]
c0de7582:	7821      	ldrb	r1, [r4, #0]
c0de7584:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7588:	eb01 0c00 	add.w	ip, r1, r0
c0de758c:	4659      	mov	r1, fp
c0de758e:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de7592:	f811 3d1c 	ldrb.w	r3, [r1, #-28]!
c0de7596:	784c      	ldrb	r4, [r1, #1]
c0de7598:	7f4d      	ldrb	r5, [r1, #29]
c0de759a:	7f8e      	ldrb	r6, [r1, #30]
c0de759c:	7fc8      	ldrb	r0, [r1, #31]
c0de759e:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de75a2:	ea42 2205 	orr.w	r2, r2, r5, lsl #8
c0de75a6:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de75aa:	4463      	add	r3, ip
c0de75ac:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de75b0:	700b      	strb	r3, [r1, #0]
c0de75b2:	6087      	str	r7, [r0, #8]
c0de75b4:	0a18      	lsrs	r0, r3, #8
c0de75b6:	7048      	strb	r0, [r1, #1]
c0de75b8:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de75bc:	f000 fa95 	bl	c0de7aea <OUTLINED_FUNCTION_10>
c0de75c0:	f840 b022 	str.w	fp, [r0, r2, lsl #2]
c0de75c4:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de75c8:	f000 fa00 	bl	c0de79cc <OUTLINED_FUNCTION_1>
c0de75cc:	9802      	ldr	r0, [sp, #8]
c0de75ce:	28ff      	cmp	r0, #255	@ 0xff
c0de75d0:	d00c      	beq.n	c0de75ec <nbgl_layoutAddSpinner+0x23c>
c0de75d2:	f44f 70c8 	mov.w	r0, #400	@ 0x190
c0de75d6:	e9cd 0006 	strd	r0, r0, [sp, #24]
c0de75da:	4809      	ldr	r0, [pc, #36]	@ (c0de7600 <nbgl_layoutAddSpinner+0x250>)
c0de75dc:	4478      	add	r0, pc
c0de75de:	9005      	str	r0, [sp, #20]
c0de75e0:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de75e4:	a905      	add	r1, sp, #20
c0de75e6:	08c0      	lsrs	r0, r0, #3
c0de75e8:	f004 fb13 	bl	c0debc12 <nbgl_screenUpdateTicker>
c0de75ec:	2000      	movs	r0, #0
c0de75ee:	e001      	b.n	c0de75f4 <nbgl_layoutAddSpinner+0x244>
c0de75f0:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de75f4:	b008      	add	sp, #32
c0de75f6:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de75fa:	bf00      	nop
c0de75fc:	00004855 	.word	0x00004855
c0de7600:	00000025 	.word	0x00000025

c0de7604 <spinnerTickerCallback>:
c0de7604:	b570      	push	{r4, r5, r6, lr}
c0de7606:	4819      	ldr	r0, [pc, #100]	@ (c0de766c <spinnerTickerCallback+0x68>)
c0de7608:	4448      	add	r0, r9
c0de760a:	6840      	ldr	r0, [r0, #4]
c0de760c:	b120      	cbz	r0, c0de7618 <spinnerTickerCallback+0x14>
c0de760e:	f890 10ae 	ldrb.w	r1, [r0, #174]	@ 0xae
c0de7612:	0209      	lsls	r1, r1, #8
c0de7614:	0449      	lsls	r1, r1, #17
c0de7616:	d400      	bmi.n	c0de761a <spinnerTickerCallback+0x16>
c0de7618:	bd70      	pop	{r4, r5, r6, pc}
c0de761a:	f8d0 10a0 	ldr.w	r1, [r0, #160]	@ 0xa0
c0de761e:	2300      	movs	r3, #0
c0de7620:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de7624:	429a      	cmp	r2, r3
c0de7626:	d0f7      	beq.n	c0de7618 <spinnerTickerCallback+0x14>
c0de7628:	4608      	mov	r0, r1
c0de762a:	f000 fbdf 	bl	c0de7dec <OUTLINED_FUNCTION_44>
c0de762e:	f850 0023 	ldr.w	r0, [r0, r3, lsl #2]
c0de7632:	7ec4      	ldrb	r4, [r0, #27]
c0de7634:	2c01      	cmp	r4, #1
c0de7636:	d108      	bne.n	c0de764a <spinnerTickerCallback+0x46>
c0de7638:	f890 4020 	ldrb.w	r4, [r0, #32]
c0de763c:	b12c      	cbz	r4, c0de764a <spinnerTickerCallback+0x46>
c0de763e:	f000 fbd5 	bl	c0de7dec <OUTLINED_FUNCTION_44>
c0de7642:	6800      	ldr	r0, [r0, #0]
c0de7644:	7ec4      	ldrb	r4, [r0, #27]
c0de7646:	2c0d      	cmp	r4, #13
c0de7648:	d001      	beq.n	c0de764e <spinnerTickerCallback+0x4a>
c0de764a:	3301      	adds	r3, #1
c0de764c:	e7ea      	b.n	c0de7624 <spinnerTickerCallback+0x20>
c0de764e:	7fc1      	ldrb	r1, [r0, #31]
c0de7650:	3101      	adds	r1, #1
c0de7652:	b2ca      	uxtb	r2, r1
c0de7654:	3a04      	subs	r2, #4
c0de7656:	bf18      	it	ne
c0de7658:	460a      	movne	r2, r1
c0de765a:	77c2      	strb	r2, [r0, #31]
c0de765c:	f004 fabb 	bl	c0debbd6 <nbgl_objDraw>
c0de7660:	2004      	movs	r0, #4
c0de7662:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de7666:	f004 baa7 	b.w	c0debbb8 <nbgl_refreshSpecial>
c0de766a:	bf00      	nop
c0de766c:	00001908 	.word	0x00001908

c0de7670 <nbgl_layoutUpdateSpinner>:
c0de7670:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de7674:	2800      	cmp	r0, #0
c0de7676:	f000 809a 	beq.w	c0de77ae <nbgl_layoutUpdateSpinner+0x13e>
c0de767a:	f8d0 00a0 	ldr.w	r0, [r0, #160]	@ 0xa0
c0de767e:	460e      	mov	r6, r1
c0de7680:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de7684:	2900      	cmp	r1, #0
c0de7686:	f000 8092 	beq.w	c0de77ae <nbgl_layoutUpdateSpinner+0x13e>
c0de768a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de768e:	4615      	mov	r5, r2
c0de7690:	f000 fc42 	bl	c0de7f18 <OUTLINED_FUNCTION_66>
c0de7694:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7698:	6807      	ldr	r7, [r0, #0]
c0de769a:	7ef8      	ldrb	r0, [r7, #27]
c0de769c:	2801      	cmp	r0, #1
c0de769e:	f040 8086 	bne.w	c0de77ae <nbgl_layoutUpdateSpinner+0x13e>
c0de76a2:	f897 0020 	ldrb.w	r0, [r7, #32]
c0de76a6:	2802      	cmp	r0, #2
c0de76a8:	f0c0 8081 	bcc.w	c0de77ae <nbgl_layoutUpdateSpinner+0x13e>
c0de76ac:	4638      	mov	r0, r7
c0de76ae:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de76b2:	f000 fc31 	bl	c0de7f18 <OUTLINED_FUNCTION_66>
c0de76b6:	ea41 4100 	orr.w	r1, r1, r0, lsl #16
c0de76ba:	6808      	ldr	r0, [r1, #0]
c0de76bc:	7ec2      	ldrb	r2, [r0, #27]
c0de76be:	2a0d      	cmp	r2, #13
c0de76c0:	d175      	bne.n	c0de77ae <nbgl_layoutUpdateSpinner+0x13e>
c0de76c2:	7fc2      	ldrb	r2, [r0, #31]
c0de76c4:	429a      	cmp	r2, r3
c0de76c6:	d101      	bne.n	c0de76cc <nbgl_layoutUpdateSpinner+0x5c>
c0de76c8:	2400      	movs	r4, #0
c0de76ca:	e008      	b.n	c0de76de <nbgl_layoutUpdateSpinner+0x6e>
c0de76cc:	77c3      	strb	r3, [r0, #31]
c0de76ce:	f004 fa82 	bl	c0debbd6 <nbgl_objDraw>
c0de76d2:	4638      	mov	r0, r7
c0de76d4:	2401      	movs	r4, #1
c0de76d6:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de76da:	f000 fbc8 	bl	c0de7e6e <OUTLINED_FUNCTION_53>
c0de76de:	f8d1 b004 	ldr.w	fp, [r1, #4]
c0de76e2:	f89b 001b 	ldrb.w	r0, [fp, #27]
c0de76e6:	2804      	cmp	r0, #4
c0de76e8:	d161      	bne.n	c0de77ae <nbgl_layoutUpdateSpinner+0x13e>
c0de76ea:	f000 fc22 	bl	c0de7f32 <OUTLINED_FUNCTION_68>
c0de76ee:	4606      	mov	r6, r0
c0de76f0:	f004 ff08 	bl	c0dec504 <strlen>
c0de76f4:	4680      	mov	r8, r0
c0de76f6:	4658      	mov	r0, fp
c0de76f8:	f810 1f26 	ldrb.w	r1, [r0, #38]!
c0de76fc:	f000 fa2c 	bl	c0de7b58 <OUTLINED_FUNCTION_14>
c0de7700:	ea41 4a00 	orr.w	sl, r1, r0, lsl #16
c0de7704:	4650      	mov	r0, sl
c0de7706:	f004 fefd 	bl	c0dec504 <strlen>
c0de770a:	4580      	cmp	r8, r0
c0de770c:	d105      	bne.n	c0de771a <nbgl_layoutUpdateSpinner+0xaa>
c0de770e:	4650      	mov	r0, sl
c0de7710:	4631      	mov	r1, r6
c0de7712:	4642      	mov	r2, r8
c0de7714:	f004 fe9e 	bl	c0dec454 <memcmp>
c0de7718:	b168      	cbz	r0, c0de7736 <nbgl_layoutUpdateSpinner+0xc6>
c0de771a:	4658      	mov	r0, fp
c0de771c:	0e31      	lsrs	r1, r6, #24
c0de771e:	f800 6f26 	strb.w	r6, [r0, #38]!
c0de7722:	70c1      	strb	r1, [r0, #3]
c0de7724:	0c31      	lsrs	r1, r6, #16
c0de7726:	7081      	strb	r1, [r0, #2]
c0de7728:	0a30      	lsrs	r0, r6, #8
c0de772a:	f88b 0027 	strb.w	r0, [fp, #39]	@ 0x27
c0de772e:	4658      	mov	r0, fp
c0de7730:	f004 fa51 	bl	c0debbd6 <nbgl_objDraw>
c0de7734:	2402      	movs	r4, #2
c0de7736:	b3e5      	cbz	r5, c0de77b2 <nbgl_layoutUpdateSpinner+0x142>
c0de7738:	f897 0020 	ldrb.w	r0, [r7, #32]
c0de773c:	2803      	cmp	r0, #3
c0de773e:	d136      	bne.n	c0de77ae <nbgl_layoutUpdateSpinner+0x13e>
c0de7740:	f817 0f22 	ldrb.w	r0, [r7, #34]!
c0de7744:	7879      	ldrb	r1, [r7, #1]
c0de7746:	78ba      	ldrb	r2, [r7, #2]
c0de7748:	78fb      	ldrb	r3, [r7, #3]
c0de774a:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de774e:	ea42 2103 	orr.w	r1, r2, r3, lsl #8
c0de7752:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de7756:	6886      	ldr	r6, [r0, #8]
c0de7758:	7ef0      	ldrb	r0, [r6, #27]
c0de775a:	2804      	cmp	r0, #4
c0de775c:	d127      	bne.n	c0de77ae <nbgl_layoutUpdateSpinner+0x13e>
c0de775e:	4628      	mov	r0, r5
c0de7760:	f004 fc42 	bl	c0debfe8 <pic>
c0de7764:	4605      	mov	r5, r0
c0de7766:	f004 fecd 	bl	c0dec504 <strlen>
c0de776a:	4680      	mov	r8, r0
c0de776c:	4630      	mov	r0, r6
c0de776e:	f810 1f26 	ldrb.w	r1, [r0, #38]!
c0de7772:	f000 f9f1 	bl	c0de7b58 <OUTLINED_FUNCTION_14>
c0de7776:	ea41 4700 	orr.w	r7, r1, r0, lsl #16
c0de777a:	4638      	mov	r0, r7
c0de777c:	f004 fec2 	bl	c0dec504 <strlen>
c0de7780:	4580      	cmp	r8, r0
c0de7782:	d105      	bne.n	c0de7790 <nbgl_layoutUpdateSpinner+0x120>
c0de7784:	4638      	mov	r0, r7
c0de7786:	4629      	mov	r1, r5
c0de7788:	4642      	mov	r2, r8
c0de778a:	f004 fe63 	bl	c0dec454 <memcmp>
c0de778e:	b180      	cbz	r0, c0de77b2 <nbgl_layoutUpdateSpinner+0x142>
c0de7790:	4630      	mov	r0, r6
c0de7792:	0e29      	lsrs	r1, r5, #24
c0de7794:	f800 5f26 	strb.w	r5, [r0, #38]!
c0de7798:	70c1      	strb	r1, [r0, #3]
c0de779a:	0c29      	lsrs	r1, r5, #16
c0de779c:	7081      	strb	r1, [r0, #2]
c0de779e:	0a28      	lsrs	r0, r5, #8
c0de77a0:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de77a4:	4630      	mov	r0, r6
c0de77a6:	f004 fa16 	bl	c0debbd6 <nbgl_objDraw>
c0de77aa:	2402      	movs	r4, #2
c0de77ac:	e001      	b.n	c0de77b2 <nbgl_layoutUpdateSpinner+0x142>
c0de77ae:	f04f 34ff 	mov.w	r4, #4294967295	@ 0xffffffff
c0de77b2:	4620      	mov	r0, r4
c0de77b4:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de77b8 <nbgl_layoutDraw>:
c0de77b8:	b348      	cbz	r0, c0de780e <nbgl_layoutDraw+0x56>
c0de77ba:	b570      	push	{r4, r5, r6, lr}
c0de77bc:	4604      	mov	r4, r0
c0de77be:	6980      	ldr	r0, [r0, #24]
c0de77c0:	b128      	cbz	r0, c0de77ce <nbgl_layoutDraw+0x16>
c0de77c2:	f000 fa1f 	bl	c0de7c04 <OUTLINED_FUNCTION_22>
c0de77c6:	f8d4 00a0 	ldr.w	r0, [r4, #160]	@ 0xa0
c0de77ca:	f000 f8ff 	bl	c0de79cc <OUTLINED_FUNCTION_1>
c0de77ce:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de77d2:	f894 10ae 	ldrb.w	r1, [r4, #174]	@ 0xae
c0de77d6:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de77da:	0781      	lsls	r1, r0, #30
c0de77dc:	d513      	bpl.n	c0de7806 <nbgl_layoutDraw+0x4e>
c0de77de:	b2c0      	uxtb	r0, r0
c0de77e0:	f000 fb88 	bl	c0de7ef4 <OUTLINED_FUNCTION_63>
c0de77e4:	2102      	movs	r1, #2
c0de77e6:	2301      	movs	r3, #1
c0de77e8:	2258      	movs	r2, #88	@ 0x58
c0de77ea:	7182      	strb	r2, [r0, #6]
c0de77ec:	71c1      	strb	r1, [r0, #7]
c0de77ee:	f880 1020 	strb.w	r1, [r0, #32]
c0de77f2:	2104      	movs	r1, #4
c0de77f4:	7103      	strb	r3, [r0, #4]
c0de77f6:	2200      	movs	r2, #0
c0de77f8:	f880 3021 	strb.w	r3, [r0, #33]	@ 0x21
c0de77fc:	7581      	strb	r1, [r0, #22]
c0de77fe:	68a1      	ldr	r1, [r4, #8]
c0de7800:	7142      	strb	r2, [r0, #5]
c0de7802:	77c2      	strb	r2, [r0, #31]
c0de7804:	6148      	str	r0, [r1, #20]
c0de7806:	f004 f9fa 	bl	c0debbfe <nbgl_screenRedraw>
c0de780a:	2000      	movs	r0, #0
c0de780c:	bd70      	pop	{r4, r5, r6, pc}
c0de780e:	f000 ba95 	b.w	c0de7d3c <OUTLINED_FUNCTION_35>
	...

c0de7814 <nbgl_layoutRelease>:
c0de7814:	b510      	push	{r4, lr}
c0de7816:	b138      	cbz	r0, c0de7828 <nbgl_layoutRelease+0x14>
c0de7818:	f000 fbc4 	bl	c0de7fa4 <OUTLINED_FUNCTION_79>
c0de781c:	f894 10ae 	ldrb.w	r1, [r4, #174]	@ 0xae
c0de7820:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de7824:	0441      	lsls	r1, r0, #17
c0de7826:	d402      	bmi.n	c0de782e <nbgl_layoutRelease+0x1a>
c0de7828:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de782c:	bd10      	pop	{r4, pc}
c0de782e:	07c1      	lsls	r1, r0, #31
c0de7830:	d014      	beq.n	c0de785c <nbgl_layoutRelease+0x48>
c0de7832:	b2c0      	uxtb	r0, r0
c0de7834:	08c0      	lsrs	r0, r0, #3
c0de7836:	f004 f9e7 	bl	c0debc08 <nbgl_screenPop>
c0de783a:	480d      	ldr	r0, [pc, #52]	@ (c0de7870 <nbgl_layoutRelease+0x5c>)
c0de783c:	eb09 0100 	add.w	r1, r9, r0
c0de7840:	6849      	ldr	r1, [r1, #4]
c0de7842:	42a1      	cmp	r1, r4
c0de7844:	d005      	beq.n	c0de7852 <nbgl_layoutRelease+0x3e>
c0de7846:	e9d4 0100 	ldrd	r0, r1, [r4]
c0de784a:	6008      	str	r0, [r1, #0]
c0de784c:	6820      	ldr	r0, [r4, #0]
c0de784e:	6041      	str	r1, [r0, #4]
c0de7850:	e004      	b.n	c0de785c <nbgl_layoutRelease+0x48>
c0de7852:	6861      	ldr	r1, [r4, #4]
c0de7854:	4448      	add	r0, r9
c0de7856:	6041      	str	r1, [r0, #4]
c0de7858:	2000      	movs	r0, #0
c0de785a:	6008      	str	r0, [r1, #0]
c0de785c:	f814 0fad 	ldrb.w	r0, [r4, #173]!
c0de7860:	7861      	ldrb	r1, [r4, #1]
c0de7862:	7020      	strb	r0, [r4, #0]
c0de7864:	2000      	movs	r0, #0
c0de7866:	f001 01bf 	and.w	r1, r1, #191	@ 0xbf
c0de786a:	7061      	strb	r1, [r4, #1]
c0de786c:	bd10      	pop	{r4, pc}
c0de786e:	bf00      	nop
c0de7870:	00001908 	.word	0x00001908

c0de7874 <getLayoutAndLayoutObj>:
c0de7874:	b570      	push	{r4, r5, r6, lr}
c0de7876:	4c11      	ldr	r4, [pc, #68]	@ (c0de78bc <getLayoutAndLayoutObj+0x48>)
c0de7878:	2300      	movs	r3, #0
c0de787a:	600b      	str	r3, [r1, #0]
c0de787c:	444c      	add	r4, r9
c0de787e:	6864      	ldr	r4, [r4, #4]
c0de7880:	b1d4      	cbz	r4, c0de78b8 <getLayoutAndLayoutObj+0x44>
c0de7882:	f894 30ad 	ldrb.w	r3, [r4, #173]	@ 0xad
c0de7886:	f894 50ae 	ldrb.w	r5, [r4, #174]	@ 0xae
c0de788a:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0de788e:	045d      	lsls	r5, r3, #17
c0de7890:	d401      	bmi.n	c0de7896 <getLayoutAndLayoutObj+0x22>
c0de7892:	2300      	movs	r3, #0
c0de7894:	e010      	b.n	c0de78b8 <getLayoutAndLayoutObj+0x44>
c0de7896:	f44f 75fc 	mov.w	r5, #504	@ 0x1f8
c0de789a:	ea05 1553 	and.w	r5, r5, r3, lsr #5
c0de789e:	2300      	movs	r3, #0
c0de78a0:	429d      	cmp	r5, r3
c0de78a2:	d0f6      	beq.n	c0de7892 <getLayoutAndLayoutObj+0x1e>
c0de78a4:	18e6      	adds	r6, r4, r3
c0de78a6:	3308      	adds	r3, #8
c0de78a8:	6a36      	ldr	r6, [r6, #32]
c0de78aa:	4286      	cmp	r6, r0
c0de78ac:	d1f8      	bne.n	c0de78a0 <getLayoutAndLayoutObj+0x2c>
c0de78ae:	18e0      	adds	r0, r4, r3
c0de78b0:	2301      	movs	r3, #1
c0de78b2:	600c      	str	r4, [r1, #0]
c0de78b4:	3018      	adds	r0, #24
c0de78b6:	6010      	str	r0, [r2, #0]
c0de78b8:	4618      	mov	r0, r3
c0de78ba:	bd70      	pop	{r4, r5, r6, pc}
c0de78bc:	00001908 	.word	0x00001908

c0de78c0 <animTickerCallback>:
c0de78c0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de78c2:	483f      	ldr	r0, [pc, #252]	@ (c0de79c0 <animTickerCallback+0x100>)
c0de78c4:	4448      	add	r0, r9
c0de78c6:	6842      	ldr	r2, [r0, #4]
c0de78c8:	b3b2      	cbz	r2, c0de7938 <animTickerCallback+0x78>
c0de78ca:	f892 00ad 	ldrb.w	r0, [r2, #173]	@ 0xad
c0de78ce:	f892 10ae 	ldrb.w	r1, [r2, #174]	@ 0xae
c0de78d2:	ea40 2e01 	orr.w	lr, r0, r1, lsl #8
c0de78d6:	ea5f 404e 	movs.w	r0, lr, lsl #17
c0de78da:	d52d      	bpl.n	c0de7938 <animTickerCallback+0x78>
c0de78dc:	f8d2 c0a4 	ldr.w	ip, [r2, #164]	@ 0xa4
c0de78e0:	f1bc 0f00 	cmp.w	ip, #0
c0de78e4:	d028      	beq.n	c0de7938 <animTickerCallback+0x78>
c0de78e6:	f8d2 40a0 	ldr.w	r4, [r2, #160]	@ 0xa0
c0de78ea:	2600      	movs	r6, #0
c0de78ec:	f894 5020 	ldrb.w	r5, [r4, #32]
c0de78f0:	42b5      	cmp	r5, r6
c0de78f2:	d021      	beq.n	c0de7938 <animTickerCallback+0x78>
c0de78f4:	4620      	mov	r0, r4
c0de78f6:	f810 7f22 	ldrb.w	r7, [r0, #34]!
c0de78fa:	7841      	ldrb	r1, [r0, #1]
c0de78fc:	7883      	ldrb	r3, [r0, #2]
c0de78fe:	78c0      	ldrb	r0, [r0, #3]
c0de7900:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de7904:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de7908:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de790c:	f850 0026 	ldr.w	r0, [r0, r6, lsl #2]
c0de7910:	7ec1      	ldrb	r1, [r0, #27]
c0de7912:	2901      	cmp	r1, #1
c0de7914:	d10e      	bne.n	c0de7934 <animTickerCallback+0x74>
c0de7916:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de791a:	7843      	ldrb	r3, [r0, #1]
c0de791c:	7887      	ldrb	r7, [r0, #2]
c0de791e:	78c0      	ldrb	r0, [r0, #3]
c0de7920:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de7924:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de7928:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de792c:	6840      	ldr	r0, [r0, #4]
c0de792e:	7ec1      	ldrb	r1, [r0, #27]
c0de7930:	2902      	cmp	r1, #2
c0de7932:	d002      	beq.n	c0de793a <animTickerCallback+0x7a>
c0de7934:	3601      	adds	r6, #1
c0de7936:	e7db      	b.n	c0de78f0 <animTickerCallback+0x30>
c0de7938:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de793a:	f89c 1005 	ldrb.w	r1, [ip, #5]
c0de793e:	b171      	cbz	r1, c0de795e <animTickerCallback+0x9e>
c0de7940:	f892 40af 	ldrb.w	r4, [r2, #175]	@ 0xaf
c0de7944:	ea5f 714e 	movs.w	r1, lr, lsl #29
c0de7948:	d504      	bpl.n	c0de7954 <animTickerCallback+0x94>
c0de794a:	f89c 1004 	ldrb.w	r1, [ip, #4]
c0de794e:	3901      	subs	r1, #1
c0de7950:	42a1      	cmp	r1, r4
c0de7952:	dd0e      	ble.n	c0de7972 <animTickerCallback+0xb2>
c0de7954:	b9ac      	cbnz	r4, c0de7982 <animTickerCallback+0xc2>
c0de7956:	f04e 0e04 	orr.w	lr, lr, #4
c0de795a:	2400      	movs	r4, #0
c0de795c:	e00b      	b.n	c0de7976 <animTickerCallback+0xb6>
c0de795e:	f89c 1004 	ldrb.w	r1, [ip, #4]
c0de7962:	f892 30af 	ldrb.w	r3, [r2, #175]	@ 0xaf
c0de7966:	3901      	subs	r1, #1
c0de7968:	4299      	cmp	r1, r3
c0de796a:	bf14      	ite	ne
c0de796c:	3301      	addne	r3, #1
c0de796e:	2300      	moveq	r3, #0
c0de7970:	e00c      	b.n	c0de798c <animTickerCallback+0xcc>
c0de7972:	f02e 0e04 	bic.w	lr, lr, #4
c0de7976:	ea4f 211e 	mov.w	r1, lr, lsr #8
c0de797a:	f882 e0ad 	strb.w	lr, [r2, #173]	@ 0xad
c0de797e:	f882 10ae 	strb.w	r1, [r2, #174]	@ 0xae
c0de7982:	ea5f 714e 	movs.w	r1, lr, lsl #29
c0de7986:	bf54      	ite	pl
c0de7988:	1e63      	subpl	r3, r4, #1
c0de798a:	1c63      	addmi	r3, r4, #1
c0de798c:	f882 30af 	strb.w	r3, [r2, #175]	@ 0xaf
c0de7990:	f8dc 2000 	ldr.w	r2, [ip]
c0de7994:	b2d9      	uxtb	r1, r3
c0de7996:	f852 1021 	ldr.w	r1, [r2, r1, lsl #2]
c0de799a:	4602      	mov	r2, r0
c0de799c:	f802 1f21 	strb.w	r1, [r2, #33]!
c0de79a0:	0e0b      	lsrs	r3, r1, #24
c0de79a2:	70d3      	strb	r3, [r2, #3]
c0de79a4:	0c0b      	lsrs	r3, r1, #16
c0de79a6:	0a09      	lsrs	r1, r1, #8
c0de79a8:	7093      	strb	r3, [r2, #2]
c0de79aa:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de79ae:	f004 f912 	bl	c0debbd6 <nbgl_objDraw>
c0de79b2:	2004      	movs	r0, #4
c0de79b4:	2101      	movs	r1, #1
c0de79b6:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de79ba:	f004 b902 	b.w	c0debbc2 <nbgl_refreshSpecialWithPostRefresh>
c0de79be:	bf00      	nop
c0de79c0:	00001908 	.word	0x00001908

c0de79c4 <OUTLINED_FUNCTION_0>:
c0de79c4:	08c1      	lsrs	r1, r0, #3
c0de79c6:	2004      	movs	r0, #4
c0de79c8:	f004 b92d 	b.w	c0debc26 <nbgl_objPoolGet>

c0de79cc <OUTLINED_FUNCTION_1>:
c0de79cc:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de79d0:	3101      	adds	r1, #1
c0de79d2:	f880 1020 	strb.w	r1, [r0, #32]
c0de79d6:	4770      	bx	lr

c0de79d8 <OUTLINED_FUNCTION_2>:
c0de79d8:	2202      	movs	r2, #2
c0de79da:	75ba      	strb	r2, [r7, #22]
c0de79dc:	4642      	mov	r2, r8
c0de79de:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de79e2:	7854      	ldrb	r4, [r2, #1]
c0de79e4:	7895      	ldrb	r5, [r2, #2]
c0de79e6:	78d2      	ldrb	r2, [r2, #3]
c0de79e8:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de79ec:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0de79f0:	7ebc      	ldrb	r4, [r7, #26]
c0de79f2:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de79f6:	7e7b      	ldrb	r3, [r7, #25]
c0de79f8:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de79fc:	2400      	movs	r4, #0
c0de79fe:	4770      	bx	lr

c0de7a00 <OUTLINED_FUNCTION_3>:
c0de7a00:	713a      	strb	r2, [r7, #4]
c0de7a02:	0e0a      	lsrs	r2, r1, #24
c0de7a04:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de7a08:	2005      	movs	r0, #5
c0de7a0a:	f887 0020 	strb.w	r0, [r7, #32]
c0de7a0e:	4638      	mov	r0, r7
c0de7a10:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de7a14:	70c2      	strb	r2, [r0, #3]
c0de7a16:	0c0a      	lsrs	r2, r1, #16
c0de7a18:	7082      	strb	r2, [r0, #2]
c0de7a1a:	0a08      	lsrs	r0, r1, #8
c0de7a1c:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de7a20:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de7a24:	4770      	bx	lr

c0de7a26 <OUTLINED_FUNCTION_4>:
c0de7a26:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de7a2a:	784e      	ldrb	r6, [r1, #1]
c0de7a2c:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de7a30:	788f      	ldrb	r7, [r1, #2]
c0de7a32:	78c9      	ldrb	r1, [r1, #3]
c0de7a34:	ea42 2206 	orr.w	r2, r2, r6, lsl #8
c0de7a38:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de7a3c:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de7a40:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
c0de7a44:	4770      	bx	lr

c0de7a46 <OUTLINED_FUNCTION_5>:
c0de7a46:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de7a4a:	70c2      	strb	r2, [r0, #3]
c0de7a4c:	0c0a      	lsrs	r2, r1, #16
c0de7a4e:	7082      	strb	r2, [r0, #2]
c0de7a50:	0a08      	lsrs	r0, r1, #8
c0de7a52:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de7a56:	f885 0027 	strb.w	r0, [r5, #39]	@ 0x27
c0de7a5a:	200b      	movs	r0, #11
c0de7a5c:	f004 b8fc 	b.w	c0debc58 <nbgl_getTextHeightInWidth>

c0de7a60 <OUTLINED_FUNCTION_6>:
c0de7a60:	4620      	mov	r0, r4
c0de7a62:	4631      	mov	r1, r6
c0de7a64:	f7fc bc8c 	b.w	c0de4380 <layoutAddCallbackObj>

c0de7a68 <OUTLINED_FUNCTION_7>:
c0de7a68:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de7a6c:	70ca      	strb	r2, [r1, #3]
c0de7a6e:	0c02      	lsrs	r2, r0, #16
c0de7a70:	0a00      	lsrs	r0, r0, #8
c0de7a72:	708a      	strb	r2, [r1, #2]
c0de7a74:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de7a78:	68e0      	ldr	r0, [r4, #12]
c0de7a7a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7a7e:	7843      	ldrb	r3, [r0, #1]
c0de7a80:	f810 cc02 	ldrb.w	ip, [r0, #-2]
c0de7a84:	7882      	ldrb	r2, [r0, #2]
c0de7a86:	78c0      	ldrb	r0, [r0, #3]
c0de7a88:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de7a8c:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de7a90:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7a94:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de7a98:	200c      	movs	r0, #12
c0de7a9a:	4770      	bx	lr

c0de7a9c <OUTLINED_FUNCTION_8>:
c0de7a9c:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de7aa0:	784c      	ldrb	r4, [r1, #1]
c0de7aa2:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de7aa6:	788d      	ldrb	r5, [r1, #2]
c0de7aa8:	78c9      	ldrb	r1, [r1, #3]
c0de7aaa:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de7aae:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de7ab2:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de7ab6:	4770      	bx	lr

c0de7ab8 <OUTLINED_FUNCTION_9>:
c0de7ab8:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de7abc:	70ca      	strb	r2, [r1, #3]
c0de7abe:	0c02      	lsrs	r2, r0, #16
c0de7ac0:	0a00      	lsrs	r0, r0, #8
c0de7ac2:	708a      	strb	r2, [r1, #2]
c0de7ac4:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de7ac8:	68e0      	ldr	r0, [r4, #12]
c0de7aca:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7ace:	7843      	ldrb	r3, [r0, #1]
c0de7ad0:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de7ad4:	7887      	ldrb	r7, [r0, #2]
c0de7ad6:	78c0      	ldrb	r0, [r0, #3]
c0de7ad8:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de7adc:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de7ae0:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7ae4:	f840 6022 	str.w	r6, [r0, r2, lsl #2]
c0de7ae8:	4770      	bx	lr

c0de7aea <OUTLINED_FUNCTION_10>:
c0de7aea:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7aee:	7843      	ldrb	r3, [r0, #1]
c0de7af0:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de7af4:	7884      	ldrb	r4, [r0, #2]
c0de7af6:	78c0      	ldrb	r0, [r0, #3]
c0de7af8:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de7afc:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de7b00:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7b04:	4770      	bx	lr

c0de7b06 <OUTLINED_FUNCTION_11>:
c0de7b06:	784b      	ldrb	r3, [r1, #1]
c0de7b08:	788e      	ldrb	r6, [r1, #2]
c0de7b0a:	78c9      	ldrb	r1, [r1, #3]
c0de7b0c:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de7b10:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de7b14:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de7b18:	4770      	bx	lr

c0de7b1a <OUTLINED_FUNCTION_12>:
c0de7b1a:	70ca      	strb	r2, [r1, #3]
c0de7b1c:	0c02      	lsrs	r2, r0, #16
c0de7b1e:	0a00      	lsrs	r0, r0, #8
c0de7b20:	708a      	strb	r2, [r1, #2]
c0de7b22:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de7b26:	6920      	ldr	r0, [r4, #16]
c0de7b28:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7b2c:	7843      	ldrb	r3, [r0, #1]
c0de7b2e:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de7b32:	7887      	ldrb	r7, [r0, #2]
c0de7b34:	78c0      	ldrb	r0, [r0, #3]
c0de7b36:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de7b3a:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de7b3e:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7b42:	f840 6022 	str.w	r6, [r0, r2, lsl #2]
c0de7b46:	200c      	movs	r0, #12
c0de7b48:	4770      	bx	lr

c0de7b4a <OUTLINED_FUNCTION_13>:
c0de7b4a:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de7b4e:	70c2      	strb	r2, [r0, #3]
c0de7b50:	0c0a      	lsrs	r2, r1, #16
c0de7b52:	7082      	strb	r2, [r0, #2]
c0de7b54:	0a08      	lsrs	r0, r1, #8
c0de7b56:	4770      	bx	lr

c0de7b58 <OUTLINED_FUNCTION_14>:
c0de7b58:	7842      	ldrb	r2, [r0, #1]
c0de7b5a:	7883      	ldrb	r3, [r0, #2]
c0de7b5c:	78c0      	ldrb	r0, [r0, #3]
c0de7b5e:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7b62:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de7b66:	4770      	bx	lr

c0de7b68 <OUTLINED_FUNCTION_15>:
c0de7b68:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de7b6c:	70ca      	strb	r2, [r1, #3]
c0de7b6e:	0c02      	lsrs	r2, r0, #16
c0de7b70:	0a00      	lsrs	r0, r0, #8
c0de7b72:	708a      	strb	r2, [r1, #2]
c0de7b74:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de7b78:	6920      	ldr	r0, [r4, #16]
c0de7b7a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7b7e:	7843      	ldrb	r3, [r0, #1]
c0de7b80:	f810 cc02 	ldrb.w	ip, [r0, #-2]
c0de7b84:	7882      	ldrb	r2, [r0, #2]
c0de7b86:	78c0      	ldrb	r0, [r0, #3]
c0de7b88:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de7b8c:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de7b90:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7b94:	4770      	bx	lr

c0de7b96 <OUTLINED_FUNCTION_16>:
c0de7b96:	08c1      	lsrs	r1, r0, #3
c0de7b98:	2001      	movs	r0, #1
c0de7b9a:	f004 b844 	b.w	c0debc26 <nbgl_objPoolGet>

c0de7b9e <OUTLINED_FUNCTION_17>:
c0de7b9e:	08c1      	lsrs	r1, r0, #3
c0de7ba0:	2005      	movs	r0, #5
c0de7ba2:	f004 b840 	b.w	c0debc26 <nbgl_objPoolGet>

c0de7ba6 <OUTLINED_FUNCTION_18>:
c0de7ba6:	6920      	ldr	r0, [r4, #16]
c0de7ba8:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7bac:	7843      	ldrb	r3, [r0, #1]
c0de7bae:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de7bb2:	7887      	ldrb	r7, [r0, #2]
c0de7bb4:	78c0      	ldrb	r0, [r0, #3]
c0de7bb6:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de7bba:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de7bbe:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7bc2:	f840 6022 	str.w	r6, [r0, r2, lsl #2]
c0de7bc6:	200c      	movs	r0, #12
c0de7bc8:	f886 801c 	strb.w	r8, [r6, #28]
c0de7bcc:	4770      	bx	lr

c0de7bce <OUTLINED_FUNCTION_19>:
c0de7bce:	0a39      	lsrs	r1, r7, #8
c0de7bd0:	0e02      	lsrs	r2, r0, #24
c0de7bd2:	74e9      	strb	r1, [r5, #19]
c0de7bd4:	4629      	mov	r1, r5
c0de7bd6:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de7bda:	70ca      	strb	r2, [r1, #3]
c0de7bdc:	0c02      	lsrs	r2, r0, #16
c0de7bde:	0a00      	lsrs	r0, r0, #8
c0de7be0:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de7be4:	4628      	mov	r0, r5
c0de7be6:	708a      	strb	r2, [r1, #2]
c0de7be8:	0e3a      	lsrs	r2, r7, #24
c0de7bea:	f800 7f12 	strb.w	r7, [r0, #18]!
c0de7bee:	70c2      	strb	r2, [r0, #3]
c0de7bf0:	0c3a      	lsrs	r2, r7, #16
c0de7bf2:	7082      	strb	r2, [r0, #2]
c0de7bf4:	4770      	bx	lr

c0de7bf6 <OUTLINED_FUNCTION_20>:
c0de7bf6:	4631      	mov	r1, r6
c0de7bf8:	f7fc bbc2 	b.w	c0de4380 <layoutAddCallbackObj>

c0de7bfc <OUTLINED_FUNCTION_21>:
c0de7bfc:	08c1      	lsrs	r1, r0, #3
c0de7bfe:	2002      	movs	r0, #2
c0de7c00:	f004 b811 	b.w	c0debc26 <nbgl_objPoolGet>

c0de7c04 <OUTLINED_FUNCTION_22>:
c0de7c04:	f8d4 10a0 	ldr.w	r1, [r4, #160]	@ 0xa0
c0de7c08:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de7c0c:	784d      	ldrb	r5, [r1, #1]
c0de7c0e:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de7c12:	788e      	ldrb	r6, [r1, #2]
c0de7c14:	78c9      	ldrb	r1, [r1, #3]
c0de7c16:	ea42 2205 	orr.w	r2, r2, r5, lsl #8
c0de7c1a:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de7c1e:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de7c22:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
c0de7c26:	4770      	bx	lr

c0de7c28 <OUTLINED_FUNCTION_23>:
c0de7c28:	6868      	ldr	r0, [r5, #4]
c0de7c2a:	f004 b9dd 	b.w	c0debfe8 <pic>

c0de7c2e <OUTLINED_FUNCTION_24>:
c0de7c2e:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de7c32:	784c      	ldrb	r4, [r1, #1]
c0de7c34:	f811 cc02 	ldrb.w	ip, [r1, #-2]
c0de7c38:	788b      	ldrb	r3, [r1, #2]
c0de7c3a:	78c9      	ldrb	r1, [r1, #3]
c0de7c3c:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de7c40:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de7c44:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de7c48:	f841 702c 	str.w	r7, [r1, ip, lsl #2]
c0de7c4c:	4770      	bx	lr

c0de7c4e <OUTLINED_FUNCTION_25>:
c0de7c4e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7c52:	08c0      	lsrs	r0, r0, #3
c0de7c54:	f7fe baa8 	b.w	c0de61a8 <createHorizontalLine>

c0de7c58 <OUTLINED_FUNCTION_26>:
c0de7c58:	75aa      	strb	r2, [r5, #22]
c0de7c5a:	1c5a      	adds	r2, r3, #1
c0de7c5c:	788b      	ldrb	r3, [r1, #2]
c0de7c5e:	f800 2c02 	strb.w	r2, [r0, #-2]
c0de7c62:	780a      	ldrb	r2, [r1, #0]
c0de7c64:	f895 0022 	ldrb.w	r0, [r5, #34]	@ 0x22
c0de7c68:	78c9      	ldrb	r1, [r1, #3]
c0de7c6a:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de7c6e:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de7c72:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de7c76:	4770      	bx	lr

c0de7c78 <OUTLINED_FUNCTION_27>:
c0de7c78:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7c7c:	7843      	ldrb	r3, [r0, #1]
c0de7c7e:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de7c82:	7884      	ldrb	r4, [r0, #2]
c0de7c84:	78c0      	ldrb	r0, [r0, #3]
c0de7c86:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de7c8a:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de7c8e:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7c92:	f840 a022 	str.w	sl, [r0, r2, lsl #2]
c0de7c96:	4770      	bx	lr

c0de7c98 <OUTLINED_FUNCTION_28>:
c0de7c98:	f801 0f25 	strb.w	r0, [r1, #37]!
c0de7c9c:	70ca      	strb	r2, [r1, #3]
c0de7c9e:	0c02      	lsrs	r2, r0, #16
c0de7ca0:	0a00      	lsrs	r0, r0, #8
c0de7ca2:	708a      	strb	r2, [r1, #2]
c0de7ca4:	f886 0026 	strb.w	r0, [r6, #38]	@ 0x26
c0de7ca8:	4770      	bx	lr

c0de7caa <OUTLINED_FUNCTION_29>:
c0de7caa:	4450      	add	r0, sl
c0de7cac:	3101      	adds	r1, #1
c0de7cae:	f842 7024 	str.w	r7, [r2, r4, lsl #2]
c0de7cb2:	eb00 0a03 	add.w	sl, r0, r3
c0de7cb6:	f888 1020 	strb.w	r1, [r8, #32]
c0de7cba:	4770      	bx	lr

c0de7cbc <OUTLINED_FUNCTION_30>:
c0de7cbc:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de7cc0:	4630      	mov	r0, r6
c0de7cc2:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de7cc6:	70c2      	strb	r2, [r0, #3]
c0de7cc8:	0c0a      	lsrs	r2, r1, #16
c0de7cca:	7082      	strb	r2, [r0, #2]
c0de7ccc:	0a08      	lsrs	r0, r1, #8
c0de7cce:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de7cd2:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de7cd6:	200b      	movs	r0, #11
c0de7cd8:	4770      	bx	lr

c0de7cda <OUTLINED_FUNCTION_31>:
c0de7cda:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de7cde:	70ca      	strb	r2, [r1, #3]
c0de7ce0:	0c02      	lsrs	r2, r0, #16
c0de7ce2:	0a00      	lsrs	r0, r0, #8
c0de7ce4:	708a      	strb	r2, [r1, #2]
c0de7ce6:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de7cea:	4770      	bx	lr

c0de7cec <OUTLINED_FUNCTION_32>:
c0de7cec:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de7cf0:	784e      	ldrb	r6, [r1, #1]
c0de7cf2:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de7cf6:	788f      	ldrb	r7, [r1, #2]
c0de7cf8:	78c9      	ldrb	r1, [r1, #3]
c0de7cfa:	ea42 2206 	orr.w	r2, r2, r6, lsl #8
c0de7cfe:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de7d02:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de7d06:	4770      	bx	lr

c0de7d08 <OUTLINED_FUNCTION_33>:
c0de7d08:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de7d0c:	784c      	ldrb	r4, [r1, #1]
c0de7d0e:	788e      	ldrb	r6, [r1, #2]
c0de7d10:	78cd      	ldrb	r5, [r1, #3]
c0de7d12:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de7d16:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de7d1a:	ea46 2405 	orr.w	r4, r6, r5, lsl #8
c0de7d1e:	ea42 4204 	orr.w	r2, r2, r4, lsl #16
c0de7d22:	4770      	bx	lr

c0de7d24 <OUTLINED_FUNCTION_34>:
c0de7d24:	f8da 00a0 	ldr.w	r0, [sl, #160]	@ 0xa0
c0de7d28:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de7d2c:	3101      	adds	r1, #1
c0de7d2e:	f880 1020 	strb.w	r1, [r0, #32]
c0de7d32:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de7d36:	08c1      	lsrs	r1, r0, #3
c0de7d38:	2004      	movs	r0, #4
c0de7d3a:	4730      	bx	r6

c0de7d3c <OUTLINED_FUNCTION_35>:
c0de7d3c:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de7d40:	4770      	bx	lr

c0de7d42 <OUTLINED_FUNCTION_36>:
c0de7d42:	77b0      	strb	r0, [r6, #30]
c0de7d44:	6960      	ldr	r0, [r4, #20]
c0de7d46:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7d4a:	7842      	ldrb	r2, [r0, #1]
c0de7d4c:	7883      	ldrb	r3, [r0, #2]
c0de7d4e:	78c0      	ldrb	r0, [r0, #3]
c0de7d50:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7d54:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de7d58:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7d5c:	4770      	bx	lr

c0de7d5e <OUTLINED_FUNCTION_37>:
c0de7d5e:	4642      	mov	r2, r8
c0de7d60:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de7d64:	7854      	ldrb	r4, [r2, #1]
c0de7d66:	7895      	ldrb	r5, [r2, #2]
c0de7d68:	78d2      	ldrb	r2, [r2, #3]
c0de7d6a:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0de7d6e:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de7d72:	463d      	mov	r5, r7
c0de7d74:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de7d78:	4770      	bx	lr

c0de7d7a <OUTLINED_FUNCTION_38>:
c0de7d7a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7d7e:	7843      	ldrb	r3, [r0, #1]
c0de7d80:	7885      	ldrb	r5, [r0, #2]
c0de7d82:	78c6      	ldrb	r6, [r0, #3]
c0de7d84:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de7d88:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de7d8c:	ea45 2306 	orr.w	r3, r5, r6, lsl #8
c0de7d90:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
c0de7d94:	4770      	bx	lr

c0de7d96 <OUTLINED_FUNCTION_39>:
c0de7d96:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de7d9a:	f896 0022 	ldrb.w	r0, [r6, #34]	@ 0x22
c0de7d9e:	f040 0001 	orr.w	r0, r0, #1
c0de7da2:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de7da6:	4630      	mov	r0, r6
c0de7da8:	f003 bf15 	b.w	c0debbd6 <nbgl_objDraw>

c0de7dac <OUTLINED_FUNCTION_40>:
c0de7dac:	4620      	mov	r0, r4
c0de7dae:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7db2:	7842      	ldrb	r2, [r0, #1]
c0de7db4:	7883      	ldrb	r3, [r0, #2]
c0de7db6:	78c0      	ldrb	r0, [r0, #3]
c0de7db8:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7dbc:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de7dc0:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7dc4:	4770      	bx	lr

c0de7dc6 <OUTLINED_FUNCTION_41>:
c0de7dc6:	0e02      	lsrs	r2, r0, #24
c0de7dc8:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de7dcc:	70ca      	strb	r2, [r1, #3]
c0de7dce:	0c02      	lsrs	r2, r0, #16
c0de7dd0:	0a00      	lsrs	r0, r0, #8
c0de7dd2:	708a      	strb	r2, [r1, #2]
c0de7dd4:	4770      	bx	lr

c0de7dd6 <OUTLINED_FUNCTION_42>:
c0de7dd6:	4601      	mov	r1, r0
c0de7dd8:	2001      	movs	r0, #1
c0de7dda:	22a0      	movs	r2, #160	@ 0xa0
c0de7ddc:	2301      	movs	r3, #1
c0de7dde:	7178      	strb	r0, [r7, #5]
c0de7de0:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de7de4:	4770      	bx	lr

c0de7de6 <OUTLINED_FUNCTION_43>:
c0de7de6:	200b      	movs	r0, #11
c0de7de8:	f003 bf36 	b.w	c0debc58 <nbgl_getTextHeightInWidth>

c0de7dec <OUTLINED_FUNCTION_44>:
c0de7dec:	f810 4f22 	ldrb.w	r4, [r0, #34]!
c0de7df0:	7845      	ldrb	r5, [r0, #1]
c0de7df2:	7886      	ldrb	r6, [r0, #2]
c0de7df4:	78c0      	ldrb	r0, [r0, #3]
c0de7df6:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de7dfa:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de7dfe:	ea44 4000 	orr.w	r0, r4, r0, lsl #16
c0de7e02:	4770      	bx	lr

c0de7e04 <OUTLINED_FUNCTION_45>:
c0de7e04:	70c2      	strb	r2, [r0, #3]
c0de7e06:	0c0a      	lsrs	r2, r1, #16
c0de7e08:	7082      	strb	r2, [r0, #2]
c0de7e0a:	0a08      	lsrs	r0, r1, #8
c0de7e0c:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de7e10:	4770      	bx	lr

c0de7e12 <OUTLINED_FUNCTION_46>:
c0de7e12:	0a01      	lsrs	r1, r0, #8
c0de7e14:	71b8      	strb	r0, [r7, #6]
c0de7e16:	71f9      	strb	r1, [r7, #7]
c0de7e18:	f898 1020 	ldrb.w	r1, [r8, #32]
c0de7e1c:	2900      	cmp	r1, #0
c0de7e1e:	4770      	bx	lr

c0de7e20 <OUTLINED_FUNCTION_47>:
c0de7e20:	70ca      	strb	r2, [r1, #3]
c0de7e22:	0c02      	lsrs	r2, r0, #16
c0de7e24:	0a00      	lsrs	r0, r0, #8
c0de7e26:	708a      	strb	r2, [r1, #2]
c0de7e28:	4770      	bx	lr

c0de7e2a <OUTLINED_FUNCTION_48>:
c0de7e2a:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de7e2e:	ea42 2103 	orr.w	r1, r2, r3, lsl #8
c0de7e32:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de7e36:	4770      	bx	lr

c0de7e38 <OUTLINED_FUNCTION_49>:
c0de7e38:	68a8      	ldr	r0, [r5, #8]
c0de7e3a:	f004 b8d5 	b.w	c0debfe8 <pic>

c0de7e3e <OUTLINED_FUNCTION_50>:
c0de7e3e:	4630      	mov	r0, r6
c0de7e40:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de7e44:	70c2      	strb	r2, [r0, #3]
c0de7e46:	0c0a      	lsrs	r2, r1, #16
c0de7e48:	7082      	strb	r2, [r0, #2]
c0de7e4a:	0a08      	lsrs	r0, r1, #8
c0de7e4c:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de7e50:	4770      	bx	lr

c0de7e52 <OUTLINED_FUNCTION_51>:
c0de7e52:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de7e56:	f003 beff 	b.w	c0debc58 <nbgl_getTextHeightInWidth>

c0de7e5a <OUTLINED_FUNCTION_52>:
c0de7e5a:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de7e5e:	0e0a      	lsrs	r2, r1, #24
c0de7e60:	70c2      	strb	r2, [r0, #3]
c0de7e62:	0c0a      	lsrs	r2, r1, #16
c0de7e64:	7082      	strb	r2, [r0, #2]
c0de7e66:	0a08      	lsrs	r0, r1, #8
c0de7e68:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de7e6c:	4770      	bx	lr

c0de7e6e <OUTLINED_FUNCTION_53>:
c0de7e6e:	7842      	ldrb	r2, [r0, #1]
c0de7e70:	7883      	ldrb	r3, [r0, #2]
c0de7e72:	78c0      	ldrb	r0, [r0, #3]
c0de7e74:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7e78:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de7e7c:	ea41 4100 	orr.w	r1, r1, r0, lsl #16
c0de7e80:	4770      	bx	lr

c0de7e82 <OUTLINED_FUNCTION_54>:
c0de7e82:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de7e86:	3201      	adds	r2, #1
c0de7e88:	f881 2020 	strb.w	r2, [r1, #32]
c0de7e8c:	b004      	add	sp, #16
c0de7e8e:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de7e92 <OUTLINED_FUNCTION_55>:
c0de7e92:	7981      	ldrb	r1, [r0, #6]
c0de7e94:	79c0      	ldrb	r0, [r0, #7]
c0de7e96:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de7e9a:	4770      	bx	lr

c0de7e9c <OUTLINED_FUNCTION_56>:
c0de7e9c:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de7ea0:	70ca      	strb	r2, [r1, #3]
c0de7ea2:	0c02      	lsrs	r2, r0, #16
c0de7ea4:	0a00      	lsrs	r0, r0, #8
c0de7ea6:	708a      	strb	r2, [r1, #2]
c0de7ea8:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de7eac:	4770      	bx	lr

c0de7eae <OUTLINED_FUNCTION_57>:
c0de7eae:	f8d4 00a0 	ldr.w	r0, [r4, #160]	@ 0xa0
c0de7eb2:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de7eb6:	3101      	adds	r1, #1
c0de7eb8:	f880 1020 	strb.w	r1, [r0, #32]
c0de7ebc:	2000      	movs	r0, #0
c0de7ebe:	4770      	bx	lr

c0de7ec0 <OUTLINED_FUNCTION_58>:
c0de7ec0:	4631      	mov	r1, r6
c0de7ec2:	0e02      	lsrs	r2, r0, #24
c0de7ec4:	f886 a01d 	strb.w	sl, [r6, #29]
c0de7ec8:	4770      	bx	lr

c0de7eca <OUTLINED_FUNCTION_59>:
c0de7eca:	f886 b01c 	strb.w	fp, [r6, #28]
c0de7ece:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de7ed2:	2005      	movs	r0, #5
c0de7ed4:	4770      	bx	lr

c0de7ed6 <OUTLINED_FUNCTION_60>:
c0de7ed6:	70f1      	strb	r1, [r6, #3]
c0de7ed8:	0c01      	lsrs	r1, r0, #16
c0de7eda:	0a00      	lsrs	r0, r0, #8
c0de7edc:	70b1      	strb	r1, [r6, #2]
c0de7ede:	4770      	bx	lr

c0de7ee0 <OUTLINED_FUNCTION_61>:
c0de7ee0:	f891 0020 	ldrb.w	r0, [r1, #32]
c0de7ee4:	3001      	adds	r0, #1
c0de7ee6:	f881 0020 	strb.w	r0, [r1, #32]
c0de7eea:	4770      	bx	lr

c0de7eec <OUTLINED_FUNCTION_62>:
c0de7eec:	08c1      	lsrs	r1, r0, #3
c0de7eee:	2004      	movs	r0, #4
c0de7ef0:	f003 be9e 	b.w	c0debc30 <nbgl_containerPoolGet>

c0de7ef4 <OUTLINED_FUNCTION_63>:
c0de7ef4:	08c1      	lsrs	r1, r0, #3
c0de7ef6:	2003      	movs	r0, #3
c0de7ef8:	f003 be95 	b.w	c0debc26 <nbgl_objPoolGet>

c0de7efc <OUTLINED_FUNCTION_64>:
c0de7efc:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7f00:	08c1      	lsrs	r1, r0, #3
c0de7f02:	2005      	movs	r0, #5
c0de7f04:	f003 be94 	b.w	c0debc30 <nbgl_containerPoolGet>

c0de7f08 <OUTLINED_FUNCTION_65>:
c0de7f08:	71d1      	strb	r1, [r2, #7]
c0de7f0a:	7190      	strb	r0, [r2, #6]
c0de7f0c:	f892 0020 	ldrb.w	r0, [r2, #32]
c0de7f10:	3001      	adds	r0, #1
c0de7f12:	f882 0020 	strb.w	r0, [r2, #32]
c0de7f16:	4770      	bx	lr

c0de7f18 <OUTLINED_FUNCTION_66>:
c0de7f18:	7842      	ldrb	r2, [r0, #1]
c0de7f1a:	7884      	ldrb	r4, [r0, #2]
c0de7f1c:	78c0      	ldrb	r0, [r0, #3]
c0de7f1e:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7f22:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de7f26:	4770      	bx	lr

c0de7f28 <OUTLINED_FUNCTION_67>:
c0de7f28:	7a2a      	ldrb	r2, [r5, #8]
c0de7f2a:	7a6b      	ldrb	r3, [r5, #9]
c0de7f2c:	4620      	mov	r0, r4
c0de7f2e:	f7fc ba27 	b.w	c0de4380 <layoutAddCallbackObj>

c0de7f32 <OUTLINED_FUNCTION_68>:
c0de7f32:	4630      	mov	r0, r6
c0de7f34:	f004 b858 	b.w	c0debfe8 <pic>

c0de7f38 <OUTLINED_FUNCTION_69>:
c0de7f38:	f801 7f12 	strb.w	r7, [r1, #18]!
c0de7f3c:	70ca      	strb	r2, [r1, #3]
c0de7f3e:	0c3a      	lsrs	r2, r7, #16
c0de7f40:	708a      	strb	r2, [r1, #2]
c0de7f42:	4770      	bx	lr

c0de7f44 <OUTLINED_FUNCTION_70>:
c0de7f44:	758a      	strb	r2, [r1, #22]
c0de7f46:	460a      	mov	r2, r1
c0de7f48:	f802 0f22 	strb.w	r0, [r2, #34]!
c0de7f4c:	0c00      	lsrs	r0, r0, #16
c0de7f4e:	7090      	strb	r0, [r2, #2]
c0de7f50:	4770      	bx	lr

c0de7f52 <OUTLINED_FUNCTION_71>:
c0de7f52:	f8bb 3020 	ldrh.w	r3, [fp, #32]
c0de7f56:	3318      	adds	r3, #24
c0de7f58:	0a1c      	lsrs	r4, r3, #8
c0de7f5a:	767b      	strb	r3, [r7, #25]
c0de7f5c:	76bc      	strb	r4, [r7, #26]
c0de7f5e:	4770      	bx	lr

c0de7f60 <OUTLINED_FUNCTION_72>:
c0de7f60:	f842 5023 	str.w	r5, [r2, r3, lsl #2]
c0de7f64:	2200      	movs	r2, #0
c0de7f66:	762a      	strb	r2, [r5, #24]
c0de7f68:	2210      	movs	r2, #16
c0de7f6a:	75ea      	strb	r2, [r5, #23]
c0de7f6c:	4770      	bx	lr

c0de7f6e <OUTLINED_FUNCTION_73>:
c0de7f6e:	f88d 0010 	strb.w	r0, [sp, #16]
c0de7f72:	8928      	ldrh	r0, [r5, #8]
c0de7f74:	f8ad 000c 	strh.w	r0, [sp, #12]
c0de7f78:	4640      	mov	r0, r8
c0de7f7a:	4770      	bx	lr

c0de7f7c <OUTLINED_FUNCTION_74>:
c0de7f7c:	08c9      	lsrs	r1, r1, #3
c0de7f7e:	f003 be57 	b.w	c0debc30 <nbgl_containerPoolGet>

c0de7f82 <OUTLINED_FUNCTION_75>:
c0de7f82:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de7f86:	7893      	ldrb	r3, [r2, #2]
c0de7f88:	78d2      	ldrb	r2, [r2, #3]
c0de7f8a:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de7f8e:	4770      	bx	lr

c0de7f90 <OUTLINED_FUNCTION_76>:
c0de7f90:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de7f94:	ea43 2206 	orr.w	r2, r3, r6, lsl #8
c0de7f98:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de7f9c:	4770      	bx	lr

c0de7f9e <OUTLINED_FUNCTION_78>:
c0de7f9e:	200d      	movs	r0, #13
c0de7fa0:	f003 be5a 	b.w	c0debc58 <nbgl_getTextHeightInWidth>

c0de7fa4 <OUTLINED_FUNCTION_79>:
c0de7fa4:	4604      	mov	r4, r0
c0de7fa6:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de7faa:	4770      	bx	lr

c0de7fac <OUTLINED_FUNCTION_80>:
c0de7fac:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de7fb0:	08c1      	lsrs	r1, r0, #3
c0de7fb2:	2004      	movs	r0, #4
c0de7fb4:	4720      	bx	r4

c0de7fb6 <OUTLINED_FUNCTION_81>:
c0de7fb6:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
c0de7fba:	7802      	ldrb	r2, [r0, #0]
c0de7fbc:	7840      	ldrb	r0, [r0, #1]
c0de7fbe:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de7fc2:	4770      	bx	lr

c0de7fc4 <layoutNavigationCallback>:
c0de7fc4:	b570      	push	{r4, r5, r6, lr}
c0de7fc6:	290a      	cmp	r1, #10
c0de7fc8:	d029      	beq.n	c0de801e <layoutNavigationCallback+0x5a>
c0de7fca:	2909      	cmp	r1, #9
c0de7fcc:	d02b      	beq.n	c0de8026 <layoutNavigationCallback+0x62>
c0de7fce:	2900      	cmp	r1, #0
c0de7fd0:	d14a      	bne.n	c0de8068 <layoutNavigationCallback+0xa4>
c0de7fd2:	4604      	mov	r4, r0
c0de7fd4:	7bc1      	ldrb	r1, [r0, #15]
c0de7fd6:	f814 5f0e 	ldrb.w	r5, [r4, #14]!
c0de7fda:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de7fde:	78a5      	ldrb	r5, [r4, #2]
c0de7fe0:	78e4      	ldrb	r4, [r4, #3]
c0de7fe2:	ea45 2404 	orr.w	r4, r5, r4, lsl #8
c0de7fe6:	ea41 4104 	orr.w	r1, r1, r4, lsl #16
c0de7fea:	460d      	mov	r5, r1
c0de7fec:	f891 4023 	ldrb.w	r4, [r1, #35]	@ 0x23
c0de7ff0:	f815 6f22 	ldrb.w	r6, [r5, #34]!
c0de7ff4:	ea46 2404 	orr.w	r4, r6, r4, lsl #8
c0de7ff8:	78ae      	ldrb	r6, [r5, #2]
c0de7ffa:	78ed      	ldrb	r5, [r5, #3]
c0de7ffc:	ea46 2505 	orr.w	r5, r6, r5, lsl #8
c0de8000:	ea44 4405 	orr.w	r4, r4, r5, lsl #16
c0de8004:	6825      	ldr	r5, [r4, #0]
c0de8006:	4285      	cmp	r5, r0
c0de8008:	d01e      	beq.n	c0de8048 <layoutNavigationCallback+0x84>
c0de800a:	6865      	ldr	r5, [r4, #4]
c0de800c:	4285      	cmp	r5, r0
c0de800e:	d01e      	beq.n	c0de804e <layoutNavigationCallback+0x8a>
c0de8010:	68a4      	ldr	r4, [r4, #8]
c0de8012:	4284      	cmp	r4, r0
c0de8014:	d128      	bne.n	c0de8068 <layoutNavigationCallback+0xa4>
c0de8016:	2a01      	cmp	r2, #1
c0de8018:	d81d      	bhi.n	c0de8056 <layoutNavigationCallback+0x92>
c0de801a:	7818      	ldrb	r0, [r3, #0]
c0de801c:	e01f      	b.n	c0de805e <layoutNavigationCallback+0x9a>
c0de801e:	2a01      	cmp	r2, #1
c0de8020:	d805      	bhi.n	c0de802e <layoutNavigationCallback+0x6a>
c0de8022:	7819      	ldrb	r1, [r3, #0]
c0de8024:	e007      	b.n	c0de8036 <layoutNavigationCallback+0x72>
c0de8026:	7819      	ldrb	r1, [r3, #0]
c0de8028:	b1f1      	cbz	r1, c0de8068 <layoutNavigationCallback+0xa4>
c0de802a:	3901      	subs	r1, #1
c0de802c:	e004      	b.n	c0de8038 <layoutNavigationCallback+0x74>
c0de802e:	7819      	ldrb	r1, [r3, #0]
c0de8030:	1e54      	subs	r4, r2, #1
c0de8032:	428c      	cmp	r4, r1
c0de8034:	d918      	bls.n	c0de8068 <layoutNavigationCallback+0xa4>
c0de8036:	3101      	adds	r1, #1
c0de8038:	7019      	strb	r1, [r3, #0]
c0de803a:	b2cb      	uxtb	r3, r1
c0de803c:	4611      	mov	r1, r2
c0de803e:	461a      	mov	r2, r3
c0de8040:	f000 f814 	bl	c0de806c <configButtons>
c0de8044:	2001      	movs	r0, #1
c0de8046:	bd70      	pop	{r4, r5, r6, pc}
c0de8048:	20ff      	movs	r0, #255	@ 0xff
c0de804a:	7018      	strb	r0, [r3, #0]
c0de804c:	e7fa      	b.n	c0de8044 <layoutNavigationCallback+0x80>
c0de804e:	7818      	ldrb	r0, [r3, #0]
c0de8050:	b150      	cbz	r0, c0de8068 <layoutNavigationCallback+0xa4>
c0de8052:	3801      	subs	r0, #1
c0de8054:	e004      	b.n	c0de8060 <layoutNavigationCallback+0x9c>
c0de8056:	7818      	ldrb	r0, [r3, #0]
c0de8058:	1e54      	subs	r4, r2, #1
c0de805a:	4284      	cmp	r4, r0
c0de805c:	d904      	bls.n	c0de8068 <layoutNavigationCallback+0xa4>
c0de805e:	3001      	adds	r0, #1
c0de8060:	7018      	strb	r0, [r3, #0]
c0de8062:	b2c3      	uxtb	r3, r0
c0de8064:	4608      	mov	r0, r1
c0de8066:	e7e9      	b.n	c0de803c <layoutNavigationCallback+0x78>
c0de8068:	2000      	movs	r0, #0
c0de806a:	bd70      	pop	{r4, r5, r6, pc}

c0de806c <configButtons>:
c0de806c:	b5b0      	push	{r4, r5, r7, lr}
c0de806e:	f810 3f22 	ldrb.w	r3, [r0, #34]!
c0de8072:	7844      	ldrb	r4, [r0, #1]
c0de8074:	7885      	ldrb	r5, [r0, #2]
c0de8076:	78c0      	ldrb	r0, [r0, #3]
c0de8078:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de807c:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
c0de8080:	ea43 4000 	orr.w	r0, r3, r0, lsl #16
c0de8084:	e9d0 3001 	ldrd	r3, r0, [r0, #4]
c0de8088:	b12b      	cbz	r3, c0de8096 <configButtons+0x2a>
c0de808a:	fab2 f482 	clz	r4, r2
c0de808e:	0964      	lsrs	r4, r4, #5
c0de8090:	0064      	lsls	r4, r4, #1
c0de8092:	f883 4021 	strb.w	r4, [r3, #33]	@ 0x21
c0de8096:	2902      	cmp	r1, #2
c0de8098:	d307      	bcc.n	c0de80aa <configButtons+0x3e>
c0de809a:	43d2      	mvns	r2, r2
c0de809c:	4411      	add	r1, r2
c0de809e:	fab1 f181 	clz	r1, r1
c0de80a2:	0949      	lsrs	r1, r1, #5
c0de80a4:	0049      	lsls	r1, r1, #1
c0de80a6:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de80aa:	bdb0      	pop	{r4, r5, r7, pc}

c0de80ac <layoutNavigationPopulate>:
c0de80ac:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de80b0:	4680      	mov	r8, r0
c0de80b2:	78c8      	ldrb	r0, [r1, #3]
c0de80b4:	4616      	mov	r6, r2
c0de80b6:	460d      	mov	r5, r1
c0de80b8:	b338      	cbz	r0, c0de810a <layoutNavigationPopulate+0x5e>
c0de80ba:	2005      	movs	r0, #5
c0de80bc:	4631      	mov	r1, r6
c0de80be:	2405      	movs	r4, #5
c0de80c0:	f003 fdb1 	bl	c0debc26 <nbgl_objPoolGet>
c0de80c4:	4976      	ldr	r1, [pc, #472]	@ (c0de82a0 <layoutNavigationPopulate+0x1f4>)
c0de80c6:	4479      	add	r1, pc
c0de80c8:	f000 f8ff 	bl	c0de82ca <OUTLINED_FUNCTION_1>
c0de80cc:	70d3      	strb	r3, [r2, #3]
c0de80ce:	7091      	strb	r1, [r2, #2]
c0de80d0:	2258      	movs	r2, #88	@ 0x58
c0de80d2:	2100      	movs	r1, #0
c0de80d4:	2303      	movs	r3, #3
c0de80d6:	7182      	strb	r2, [r0, #6]
c0de80d8:	7102      	strb	r2, [r0, #4]
c0de80da:	2201      	movs	r2, #1
c0de80dc:	71c1      	strb	r1, [r0, #7]
c0de80de:	7141      	strb	r1, [r0, #5]
c0de80e0:	7601      	strb	r1, [r0, #24]
c0de80e2:	7741      	strb	r1, [r0, #29]
c0de80e4:	f880 3020 	strb.w	r3, [r0, #32]
c0de80e8:	77c3      	strb	r3, [r0, #31]
c0de80ea:	f880 3022 	strb.w	r3, [r0, #34]	@ 0x22
c0de80ee:	7702      	strb	r2, [r0, #28]
c0de80f0:	7782      	strb	r2, [r0, #30]
c0de80f2:	786a      	ldrb	r2, [r5, #1]
c0de80f4:	2a01      	cmp	r2, #1
c0de80f6:	bf88      	it	hi
c0de80f8:	2404      	movhi	r4, #4
c0de80fa:	7584      	strb	r4, [r0, #22]
c0de80fc:	bf88      	it	hi
c0de80fe:	2101      	movhi	r1, #1
c0de8100:	00c9      	lsls	r1, r1, #3
c0de8102:	75c1      	strb	r1, [r0, #23]
c0de8104:	f000 f8d4 	bl	c0de82b0 <OUTLINED_FUNCTION_0>
c0de8108:	6008      	str	r0, [r1, #0]
c0de810a:	7928      	ldrb	r0, [r5, #4]
c0de810c:	b310      	cbz	r0, c0de8154 <layoutNavigationPopulate+0xa8>
c0de810e:	2005      	movs	r0, #5
c0de8110:	4631      	mov	r1, r6
c0de8112:	f003 fd88 	bl	c0debc26 <nbgl_objPoolGet>
c0de8116:	4963      	ldr	r1, [pc, #396]	@ (c0de82a4 <layoutNavigationPopulate+0x1f8>)
c0de8118:	4479      	add	r1, pc
c0de811a:	f000 f8d6 	bl	c0de82ca <OUTLINED_FUNCTION_1>
c0de811e:	7091      	strb	r1, [r2, #2]
c0de8120:	2100      	movs	r1, #0
c0de8122:	70d3      	strb	r3, [r2, #3]
c0de8124:	2260      	movs	r2, #96	@ 0x60
c0de8126:	2301      	movs	r3, #1
c0de8128:	71c1      	strb	r1, [r0, #7]
c0de812a:	7141      	strb	r1, [r0, #5]
c0de812c:	7741      	strb	r1, [r0, #29]
c0de812e:	7601      	strb	r1, [r0, #24]
c0de8130:	2103      	movs	r1, #3
c0de8132:	7182      	strb	r2, [r0, #6]
c0de8134:	2268      	movs	r2, #104	@ 0x68
c0de8136:	7703      	strb	r3, [r0, #28]
c0de8138:	f880 1020 	strb.w	r1, [r0, #32]
c0de813c:	77c1      	strb	r1, [r0, #31]
c0de813e:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de8142:	2102      	movs	r1, #2
c0de8144:	7102      	strb	r2, [r0, #4]
c0de8146:	75c2      	strb	r2, [r0, #23]
c0de8148:	7781      	strb	r1, [r0, #30]
c0de814a:	2106      	movs	r1, #6
c0de814c:	7581      	strb	r1, [r0, #22]
c0de814e:	f000 f8af 	bl	c0de82b0 <OUTLINED_FUNCTION_0>
c0de8152:	6048      	str	r0, [r1, #4]
c0de8154:	2005      	movs	r0, #5
c0de8156:	4631      	mov	r1, r6
c0de8158:	f003 fd65 	bl	c0debc26 <nbgl_objPoolGet>
c0de815c:	4c52      	ldr	r4, [pc, #328]	@ (c0de82a8 <layoutNavigationPopulate+0x1fc>)
c0de815e:	447c      	add	r4, pc
c0de8160:	0a21      	lsrs	r1, r4, #8
c0de8162:	0e22      	lsrs	r2, r4, #24
c0de8164:	f880 102f 	strb.w	r1, [r0, #47]	@ 0x2f
c0de8168:	4601      	mov	r1, r0
c0de816a:	f801 4f2e 	strb.w	r4, [r1, #46]!
c0de816e:	70ca      	strb	r2, [r1, #3]
c0de8170:	0c22      	lsrs	r2, r4, #16
c0de8172:	708a      	strb	r2, [r1, #2]
c0de8174:	2100      	movs	r1, #0
c0de8176:	2260      	movs	r2, #96	@ 0x60
c0de8178:	7182      	strb	r2, [r0, #6]
c0de817a:	2268      	movs	r2, #104	@ 0x68
c0de817c:	71c1      	strb	r1, [r0, #7]
c0de817e:	7141      	strb	r1, [r0, #5]
c0de8180:	7741      	strb	r1, [r0, #29]
c0de8182:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de8186:	2103      	movs	r1, #3
c0de8188:	7102      	strb	r2, [r0, #4]
c0de818a:	2201      	movs	r2, #1
c0de818c:	f880 1020 	strb.w	r1, [r0, #32]
c0de8190:	77c1      	strb	r1, [r0, #31]
c0de8192:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de8196:	7781      	strb	r1, [r0, #30]
c0de8198:	2106      	movs	r1, #6
c0de819a:	7581      	strb	r1, [r0, #22]
c0de819c:	7702      	strb	r2, [r0, #28]
c0de819e:	4641      	mov	r1, r8
c0de81a0:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de81a4:	784b      	ldrb	r3, [r1, #1]
c0de81a6:	788f      	ldrb	r7, [r1, #2]
c0de81a8:	78c9      	ldrb	r1, [r1, #3]
c0de81aa:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de81ae:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de81b2:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de81b6:	6088      	str	r0, [r1, #8]
c0de81b8:	79a8      	ldrb	r0, [r5, #6]
c0de81ba:	2800      	cmp	r0, #0
c0de81bc:	d067      	beq.n	c0de828e <layoutNavigationPopulate+0x1e2>
c0de81be:	79e8      	ldrb	r0, [r5, #7]
c0de81c0:	2800      	cmp	r0, #0
c0de81c2:	d04c      	beq.n	c0de825e <layoutNavigationPopulate+0x1b2>
c0de81c4:	2004      	movs	r0, #4
c0de81c6:	4631      	mov	r1, r6
c0de81c8:	f003 fd2d 	bl	c0debc26 <nbgl_objPoolGet>
c0de81cc:	4606      	mov	r6, r0
c0de81ce:	7868      	ldrb	r0, [r5, #1]
c0de81d0:	78a9      	ldrb	r1, [r5, #2]
c0de81d2:	f04f 0a0b 	mov.w	sl, #11
c0de81d6:	9000      	str	r0, [sp, #0]
c0de81d8:	4830      	ldr	r0, [pc, #192]	@ (c0de829c <layoutNavigationPopulate+0x1f0>)
c0de81da:	1c4b      	adds	r3, r1, #1
c0de81dc:	210b      	movs	r1, #11
c0de81de:	4a33      	ldr	r2, [pc, #204]	@ (c0de82ac <layoutNavigationPopulate+0x200>)
c0de81e0:	eb09 0700 	add.w	r7, r9, r0
c0de81e4:	447a      	add	r2, pc
c0de81e6:	4638      	mov	r0, r7
c0de81e8:	f003 fd6c 	bl	c0debcc4 <snprintf>
c0de81ec:	0a38      	lsrs	r0, r7, #8
c0de81ee:	0e39      	lsrs	r1, r7, #24
c0de81f0:	f06f 0201 	mvn.w	r2, #1
c0de81f4:	f886 a022 	strb.w	sl, [r6, #34]	@ 0x22
c0de81f8:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de81fc:	4630      	mov	r0, r6
c0de81fe:	f800 7f26 	strb.w	r7, [r0, #38]!
c0de8202:	70c1      	strb	r1, [r0, #3]
c0de8204:	0c39      	lsrs	r1, r7, #16
c0de8206:	7081      	strb	r1, [r0, #2]
c0de8208:	2000      	movs	r0, #0
c0de820a:	7861      	ldrb	r1, [r4, #1]
c0de820c:	71f0      	strb	r0, [r6, #7]
c0de820e:	2060      	movs	r0, #96	@ 0x60
c0de8210:	71b0      	strb	r0, [r6, #6]
c0de8212:	2001      	movs	r0, #1
c0de8214:	77f0      	strb	r0, [r6, #31]
c0de8216:	2005      	movs	r0, #5
c0de8218:	f886 0020 	strb.w	r0, [r6, #32]
c0de821c:	75b0      	strb	r0, [r6, #22]
c0de821e:	7820      	ldrb	r0, [r4, #0]
c0de8220:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de8224:	f1c0 0168 	rsb	r1, r0, #104	@ 0x68
c0de8228:	fb91 f1f2 	sdiv	r1, r1, r2
c0de822c:	1a08      	subs	r0, r1, r0
c0de822e:	4641      	mov	r1, r8
c0de8230:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de8234:	f811 3c1e 	ldrb.w	r3, [r1, #-30]
c0de8238:	f811 4c1d 	ldrb.w	r4, [r1, #-29]
c0de823c:	784f      	ldrb	r7, [r1, #1]
c0de823e:	788a      	ldrb	r2, [r1, #2]
c0de8240:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de8244:	eb03 0040 	add.w	r0, r3, r0, lsl #1
c0de8248:	7130      	strb	r0, [r6, #4]
c0de824a:	0a00      	lsrs	r0, r0, #8
c0de824c:	78c9      	ldrb	r1, [r1, #3]
c0de824e:	7170      	strb	r0, [r6, #5]
c0de8250:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de8254:	ea4c 2207 	orr.w	r2, ip, r7, lsl #8
c0de8258:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de825c:	60ce      	str	r6, [r1, #12]
c0de825e:	7928      	ldrb	r0, [r5, #4]
c0de8260:	b1a8      	cbz	r0, c0de828e <layoutNavigationPopulate+0x1e2>
c0de8262:	4640      	mov	r0, r8
c0de8264:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de8268:	7842      	ldrb	r2, [r0, #1]
c0de826a:	7883      	ldrb	r3, [r0, #2]
c0de826c:	78c0      	ldrb	r0, [r0, #3]
c0de826e:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de8272:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de8276:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de827a:	6840      	ldr	r0, [r0, #4]
c0de827c:	f810 1f17 	ldrb.w	r1, [r0, #23]!
c0de8280:	7842      	ldrb	r2, [r0, #1]
c0de8282:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de8286:	314f      	adds	r1, #79	@ 0x4f
c0de8288:	7001      	strb	r1, [r0, #0]
c0de828a:	0a09      	lsrs	r1, r1, #8
c0de828c:	7041      	strb	r1, [r0, #1]
c0de828e:	7869      	ldrb	r1, [r5, #1]
c0de8290:	78aa      	ldrb	r2, [r5, #2]
c0de8292:	4640      	mov	r0, r8
c0de8294:	e8bd 45f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de8298:	f7ff bee8 	b.w	c0de806c <configButtons>
c0de829c:	00001910 	.word	0x00001910
c0de82a0:	00005219 	.word	0x00005219
c0de82a4:	000050ad 	.word	0x000050ad
c0de82a8:	000050ea 	.word	0x000050ea
c0de82ac:	00005b9c 	.word	0x00005b9c

c0de82b0 <OUTLINED_FUNCTION_0>:
c0de82b0:	4641      	mov	r1, r8
c0de82b2:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de82b6:	784b      	ldrb	r3, [r1, #1]
c0de82b8:	788c      	ldrb	r4, [r1, #2]
c0de82ba:	78c9      	ldrb	r1, [r1, #3]
c0de82bc:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de82c0:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
c0de82c4:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de82c8:	4770      	bx	lr

c0de82ca <OUTLINED_FUNCTION_1>:
c0de82ca:	0a0a      	lsrs	r2, r1, #8
c0de82cc:	0e0b      	lsrs	r3, r1, #24
c0de82ce:	f880 202f 	strb.w	r2, [r0, #47]	@ 0x2f
c0de82d2:	4602      	mov	r2, r0
c0de82d4:	f802 1f2e 	strb.w	r1, [r2, #46]!
c0de82d8:	0c09      	lsrs	r1, r1, #16
c0de82da:	4770      	bx	lr

c0de82dc <nbgl_pageDrawLedgerInfo>:
c0de82dc:	b510      	push	{r4, lr}
c0de82de:	b08c      	sub	sp, #48	@ 0x30
c0de82e0:	9008      	str	r0, [sp, #32]
c0de82e2:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0de82e6:	f88d 301c 	strb.w	r3, [sp, #28]
c0de82ea:	f8ad 0014 	strh.w	r0, [sp, #20]
c0de82ee:	2009      	movs	r0, #9
c0de82f0:	f88d 001d 	strb.w	r0, [sp, #29]
c0de82f4:	481c      	ldr	r0, [pc, #112]	@ (c0de8368 <nbgl_pageDrawLedgerInfo+0x8c>)
c0de82f6:	4478      	add	r0, pc
c0de82f8:	9006      	str	r0, [sp, #24]
c0de82fa:	2000      	movs	r0, #0
c0de82fc:	9004      	str	r0, [sp, #16]
c0de82fe:	4b1b      	ldr	r3, [pc, #108]	@ (c0de836c <nbgl_pageDrawLedgerInfo+0x90>)
c0de8300:	e9cd 2000 	strd	r2, r0, [sp]
c0de8304:	784a      	ldrb	r2, [r1, #1]
c0de8306:	78cc      	ldrb	r4, [r1, #3]
c0de8308:	447b      	add	r3, pc
c0de830a:	e9cd 0302 	strd	r0, r3, [sp, #8]
c0de830e:	7808      	ldrb	r0, [r1, #0]
c0de8310:	788b      	ldrb	r3, [r1, #2]
c0de8312:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de8316:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de831a:	460a      	mov	r2, r1
c0de831c:	ea40 4003 	orr.w	r0, r0, r3, lsl #16
c0de8320:	f812 3f08 	ldrb.w	r3, [r2, #8]!
c0de8324:	9009      	str	r0, [sp, #36]	@ 0x24
c0de8326:	7a48      	ldrb	r0, [r1, #9]
c0de8328:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de832c:	7893      	ldrb	r3, [r2, #2]
c0de832e:	78d2      	ldrb	r2, [r2, #3]
c0de8330:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de8334:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
c0de8338:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de833a:	7948      	ldrb	r0, [r1, #5]
c0de833c:	f811 2f04 	ldrb.w	r2, [r1, #4]!
c0de8340:	f000 fb79 	bl	c0de8a36 <OUTLINED_FUNCTION_1>
c0de8344:	900a      	str	r0, [sp, #40]	@ 0x28
c0de8346:	a805      	add	r0, sp, #20
c0de8348:	f7fc f83c 	bl	c0de43c4 <nbgl_layoutGet>
c0de834c:	2160      	movs	r1, #96	@ 0x60
c0de834e:	4604      	mov	r4, r0
c0de8350:	f000 f80e 	bl	c0de8370 <addEmptyHeader>
c0de8354:	4669      	mov	r1, sp
c0de8356:	4620      	mov	r0, r4
c0de8358:	f7fd ff3a 	bl	c0de61d0 <nbgl_layoutAddCenteredInfo>
c0de835c:	4620      	mov	r0, r4
c0de835e:	f7ff fa2b 	bl	c0de77b8 <nbgl_layoutDraw>
c0de8362:	4620      	mov	r0, r4
c0de8364:	b00c      	add	sp, #48	@ 0x30
c0de8366:	bd10      	pop	{r4, pc}
c0de8368:	00005e62 	.word	0x00005e62
c0de836c:	00004704 	.word	0x00004704

c0de8370 <addEmptyHeader>:
c0de8370:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de8372:	f8ad 1004 	strh.w	r1, [sp, #4]
c0de8376:	2100      	movs	r1, #0
c0de8378:	f8ad 1000 	strh.w	r1, [sp]
c0de837c:	4669      	mov	r1, sp
c0de837e:	f7fe fdb9 	bl	c0de6ef4 <nbgl_layoutAddHeader>
c0de8382:	bd8f      	pop	{r0, r1, r2, r3, r7, pc}

c0de8384 <nbgl_pageDrawInfo>:
c0de8384:	b570      	push	{r4, r5, r6, lr}
c0de8386:	b08c      	sub	sp, #48	@ 0x30
c0de8388:	460d      	mov	r5, r1
c0de838a:	4606      	mov	r6, r0
c0de838c:	a805      	add	r0, sp, #20
c0de838e:	211c      	movs	r1, #28
c0de8390:	4614      	mov	r4, r2
c0de8392:	f004 f84b 	bl	c0dec42c <__aeabi_memclr>
c0de8396:	2001      	movs	r0, #1
c0de8398:	9608      	str	r6, [sp, #32]
c0de839a:	f88d 0015 	strb.w	r0, [sp, #21]
c0de839e:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de83a2:	b948      	cbnz	r0, c0de83b8 <nbgl_pageDrawInfo+0x34>
c0de83a4:	6a20      	ldr	r0, [r4, #32]
c0de83a6:	9006      	str	r0, [sp, #24]
c0de83a8:	f894 0025 	ldrb.w	r0, [r4, #37]	@ 0x25
c0de83ac:	f88d 001c 	strb.w	r0, [sp, #28]
c0de83b0:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de83b4:	f88d 001d 	strb.w	r0, [sp, #29]
c0de83b8:	b1f5      	cbz	r5, c0de83f8 <nbgl_pageDrawInfo+0x74>
c0de83ba:	4629      	mov	r1, r5
c0de83bc:	7a68      	ldrb	r0, [r5, #9]
c0de83be:	78eb      	ldrb	r3, [r5, #3]
c0de83c0:	f811 2f08 	ldrb.w	r2, [r1, #8]!
c0de83c4:	f000 fb37 	bl	c0de8a36 <OUTLINED_FUNCTION_1>
c0de83c8:	4629      	mov	r1, r5
c0de83ca:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de83cc:	7968      	ldrb	r0, [r5, #5]
c0de83ce:	f811 2f04 	ldrb.w	r2, [r1, #4]!
c0de83d2:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de83d6:	788a      	ldrb	r2, [r1, #2]
c0de83d8:	78c9      	ldrb	r1, [r1, #3]
c0de83da:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de83de:	78aa      	ldrb	r2, [r5, #2]
c0de83e0:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de83e4:	7869      	ldrb	r1, [r5, #1]
c0de83e6:	900a      	str	r0, [sp, #40]	@ 0x28
c0de83e8:	7828      	ldrb	r0, [r5, #0]
c0de83ea:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de83ee:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de83f2:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
c0de83f6:	e000      	b.n	c0de83fa <nbgl_pageDrawInfo+0x76>
c0de83f8:	2000      	movs	r0, #0
c0de83fa:	9009      	str	r0, [sp, #36]	@ 0x24
c0de83fc:	a805      	add	r0, sp, #20
c0de83fe:	f7fb ffe1 	bl	c0de43c4 <nbgl_layoutGet>
c0de8402:	4605      	mov	r5, r0
c0de8404:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de8408:	b150      	cbz	r0, c0de8420 <nbgl_pageDrawInfo+0x9c>
c0de840a:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de840e:	f894 3025 	ldrb.w	r3, [r4, #37]	@ 0x25
c0de8412:	6a22      	ldr	r2, [r4, #32]
c0de8414:	f44f 61c0 	mov.w	r1, #1536	@ 0x600
c0de8418:	9000      	str	r0, [sp, #0]
c0de841a:	4628      	mov	r0, r5
c0de841c:	f7fc fd40 	bl	c0de4ea0 <nbgl_layoutAddSwipe>
c0de8420:	7d20      	ldrb	r0, [r4, #20]
c0de8422:	b118      	cbz	r0, c0de842c <nbgl_pageDrawInfo+0xa8>
c0de8424:	4628      	mov	r0, r5
c0de8426:	2128      	movs	r1, #40	@ 0x28
c0de8428:	f7ff ffa2 	bl	c0de8370 <addEmptyHeader>
c0de842c:	4628      	mov	r0, r5
c0de842e:	4621      	mov	r1, r4
c0de8430:	f7fd fece 	bl	c0de61d0 <nbgl_layoutAddCenteredInfo>
c0de8434:	6aa0      	ldr	r0, [r4, #40]	@ 0x28
c0de8436:	b1b8      	cbz	r0, c0de8468 <nbgl_pageDrawInfo+0xe4>
c0de8438:	7d61      	ldrb	r1, [r4, #21]
c0de843a:	2904      	cmp	r1, #4
c0de843c:	d014      	beq.n	c0de8468 <nbgl_pageDrawInfo+0xe4>
c0de843e:	9001      	str	r0, [sp, #4]
c0de8440:	2001      	movs	r0, #1
c0de8442:	f8ad 000e 	strh.w	r0, [sp, #14]
c0de8446:	6ae0      	ldr	r0, [r4, #44]	@ 0x2c
c0de8448:	9002      	str	r0, [sp, #8]
c0de844a:	7de0      	ldrb	r0, [r4, #23]
c0de844c:	f88d 000c 	strb.w	r0, [sp, #12]
c0de8450:	f894 0030 	ldrb.w	r0, [r4, #48]	@ 0x30
c0de8454:	f88d 000d 	strb.w	r0, [sp, #13]
c0de8458:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de845c:	f88d 0010 	strb.w	r0, [sp, #16]
c0de8460:	a901      	add	r1, sp, #4
c0de8462:	4628      	mov	r0, r5
c0de8464:	f7fe fc2e 	bl	c0de6cc4 <nbgl_layoutAddButton>
c0de8468:	69a0      	ldr	r0, [r4, #24]
c0de846a:	b140      	cbz	r0, c0de847e <nbgl_pageDrawInfo+0xfa>
c0de846c:	f003 fdbc 	bl	c0debfe8 <pic>
c0de8470:	7f22      	ldrb	r2, [r4, #28]
c0de8472:	f894 3031 	ldrb.w	r3, [r4, #49]	@ 0x31
c0de8476:	4601      	mov	r1, r0
c0de8478:	4628      	mov	r0, r5
c0de847a:	f7fe fd14 	bl	c0de6ea6 <nbgl_layoutAddFooter>
c0de847e:	7d20      	ldrb	r0, [r4, #20]
c0de8480:	b1b0      	cbz	r0, c0de84b0 <nbgl_pageDrawInfo+0x12c>
c0de8482:	2801      	cmp	r0, #1
c0de8484:	d006      	beq.n	c0de8494 <nbgl_pageDrawInfo+0x110>
c0de8486:	2802      	cmp	r0, #2
c0de8488:	d007      	beq.n	c0de849a <nbgl_pageDrawInfo+0x116>
c0de848a:	2803      	cmp	r0, #3
c0de848c:	d136      	bne.n	c0de84fc <nbgl_pageDrawInfo+0x178>
c0de848e:	482e      	ldr	r0, [pc, #184]	@ (c0de8548 <nbgl_pageDrawInfo+0x1c4>)
c0de8490:	4478      	add	r0, pc
c0de8492:	e004      	b.n	c0de849e <nbgl_pageDrawInfo+0x11a>
c0de8494:	482b      	ldr	r0, [pc, #172]	@ (c0de8544 <nbgl_pageDrawInfo+0x1c0>)
c0de8496:	4478      	add	r0, pc
c0de8498:	e001      	b.n	c0de849e <nbgl_pageDrawInfo+0x11a>
c0de849a:	482c      	ldr	r0, [pc, #176]	@ (c0de854c <nbgl_pageDrawInfo+0x1c8>)
c0de849c:	4478      	add	r0, pc
c0de849e:	f003 fda3 	bl	c0debfe8 <pic>
c0de84a2:	7da2      	ldrb	r2, [r4, #22]
c0de84a4:	f894 3031 	ldrb.w	r3, [r4, #49]	@ 0x31
c0de84a8:	4601      	mov	r1, r0
c0de84aa:	4628      	mov	r0, r5
c0de84ac:	f7fc fd52 	bl	c0de4f54 <nbgl_layoutAddTopRightButton>
c0de84b0:	7d60      	ldrb	r0, [r4, #21]
c0de84b2:	b3c0      	cbz	r0, c0de8526 <nbgl_pageDrawInfo+0x1a2>
c0de84b4:	2801      	cmp	r0, #1
c0de84b6:	d023      	beq.n	c0de8500 <nbgl_pageDrawInfo+0x17c>
c0de84b8:	2802      	cmp	r0, #2
c0de84ba:	d024      	beq.n	c0de8506 <nbgl_pageDrawInfo+0x182>
c0de84bc:	2803      	cmp	r0, #3
c0de84be:	d025      	beq.n	c0de850c <nbgl_pageDrawInfo+0x188>
c0de84c0:	2804      	cmp	r0, #4
c0de84c2:	d11b      	bne.n	c0de84fc <nbgl_pageDrawInfo+0x178>
c0de84c4:	6aa0      	ldr	r0, [r4, #40]	@ 0x28
c0de84c6:	b3a0      	cbz	r0, c0de8532 <nbgl_pageDrawInfo+0x1ae>
c0de84c8:	4922      	ldr	r1, [pc, #136]	@ (c0de8554 <nbgl_pageDrawInfo+0x1d0>)
c0de84ca:	4479      	add	r1, pc
c0de84cc:	e9cd 0101 	strd	r0, r1, [sp, #4]
c0de84d0:	6ae0      	ldr	r0, [r4, #44]	@ 0x2c
c0de84d2:	2102      	movs	r1, #2
c0de84d4:	9003      	str	r0, [sp, #12]
c0de84d6:	7de0      	ldrb	r0, [r4, #23]
c0de84d8:	f88d 0010 	strb.w	r0, [sp, #16]
c0de84dc:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de84e0:	f88d 0012 	strb.w	r0, [sp, #18]
c0de84e4:	f894 0030 	ldrb.w	r0, [r4, #48]	@ 0x30
c0de84e8:	2800      	cmp	r0, #0
c0de84ea:	bf08      	it	eq
c0de84ec:	2101      	moveq	r1, #1
c0de84ee:	f88d 1011 	strb.w	r1, [sp, #17]
c0de84f2:	4628      	mov	r0, r5
c0de84f4:	a901      	add	r1, sp, #4
c0de84f6:	f7fe fa15 	bl	c0de6924 <nbgl_layoutAddChoiceButtons>
c0de84fa:	e014      	b.n	c0de8526 <nbgl_pageDrawInfo+0x1a2>
c0de84fc:	2500      	movs	r5, #0
c0de84fe:	e015      	b.n	c0de852c <nbgl_pageDrawInfo+0x1a8>
c0de8500:	4813      	ldr	r0, [pc, #76]	@ (c0de8550 <nbgl_pageDrawInfo+0x1cc>)
c0de8502:	4478      	add	r0, pc
c0de8504:	e004      	b.n	c0de8510 <nbgl_pageDrawInfo+0x18c>
c0de8506:	4816      	ldr	r0, [pc, #88]	@ (c0de8560 <nbgl_pageDrawInfo+0x1dc>)
c0de8508:	4478      	add	r0, pc
c0de850a:	e001      	b.n	c0de8510 <nbgl_pageDrawInfo+0x18c>
c0de850c:	4813      	ldr	r0, [pc, #76]	@ (c0de855c <nbgl_pageDrawInfo+0x1d8>)
c0de850e:	4478      	add	r0, pc
c0de8510:	f003 fd6a 	bl	c0debfe8 <pic>
c0de8514:	4601      	mov	r1, r0
c0de8516:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de851a:	7de2      	ldrb	r2, [r4, #23]
c0de851c:	2300      	movs	r3, #0
c0de851e:	9000      	str	r0, [sp, #0]
c0de8520:	4628      	mov	r0, r5
c0de8522:	f7fd f8dd 	bl	c0de56e0 <nbgl_layoutAddBottomButton>
c0de8526:	4628      	mov	r0, r5
c0de8528:	f7ff f946 	bl	c0de77b8 <nbgl_layoutDraw>
c0de852c:	4628      	mov	r0, r5
c0de852e:	b00c      	add	sp, #48	@ 0x30
c0de8530:	bd70      	pop	{r4, r5, r6, pc}
c0de8532:	7de2      	ldrb	r2, [r4, #23]
c0de8534:	f894 3031 	ldrb.w	r3, [r4, #49]	@ 0x31
c0de8538:	4907      	ldr	r1, [pc, #28]	@ (c0de8558 <nbgl_pageDrawInfo+0x1d4>)
c0de853a:	4628      	mov	r0, r5
c0de853c:	4479      	add	r1, pc
c0de853e:	f7fe fcb2 	bl	c0de6ea6 <nbgl_layoutAddFooter>
c0de8542:	e7f0      	b.n	c0de8526 <nbgl_pageDrawInfo+0x1a2>
c0de8544:	0000537a 	.word	0x0000537a
c0de8548:	00004e92 	.word	0x00004e92
c0de854c:	00004e43 	.word	0x00004e43
c0de8550:	0000530e 	.word	0x0000530e
c0de8554:	00005d23 	.word	0x00005d23
c0de8558:	00005cb1 	.word	0x00005cb1
c0de855c:	00004e14 	.word	0x00004e14
c0de8560:	00004dd7 	.word	0x00004dd7

c0de8564 <nbgl_pageDrawConfirmation>:
c0de8564:	b5b0      	push	{r4, r5, r7, lr}
c0de8566:	b08c      	sub	sp, #48	@ 0x30
c0de8568:	4605      	mov	r5, r0
c0de856a:	6948      	ldr	r0, [r1, #20]
c0de856c:	460c      	mov	r4, r1
c0de856e:	f003 fd3b 	bl	c0debfe8 <pic>
c0de8572:	9001      	str	r0, [sp, #4]
c0de8574:	69a0      	ldr	r0, [r4, #24]
c0de8576:	b110      	cbz	r0, c0de857e <nbgl_pageDrawConfirmation+0x1a>
c0de8578:	f003 fd36 	bl	c0debfe8 <pic>
c0de857c:	e001      	b.n	c0de8582 <nbgl_pageDrawConfirmation+0x1e>
c0de857e:	4815      	ldr	r0, [pc, #84]	@ (c0de85d4 <nbgl_pageDrawConfirmation+0x70>)
c0de8580:	4478      	add	r0, pc
c0de8582:	2100      	movs	r1, #0
c0de8584:	7fe2      	ldrb	r2, [r4, #31]
c0de8586:	9508      	str	r5, [sp, #32]
c0de8588:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de858c:	2001      	movs	r0, #1
c0de858e:	f88d 1011 	strb.w	r1, [sp, #17]
c0de8592:	9109      	str	r1, [sp, #36]	@ 0x24
c0de8594:	9106      	str	r1, [sp, #24]
c0de8596:	7fa1      	ldrb	r1, [r4, #30]
c0de8598:	f88d 0015 	strb.w	r0, [sp, #21]
c0de859c:	7f20      	ldrb	r0, [r4, #28]
c0de859e:	f88d 2014 	strb.w	r2, [sp, #20]
c0de85a2:	f88d 1012 	strb.w	r1, [sp, #18]
c0de85a6:	f88d 0010 	strb.w	r0, [sp, #16]
c0de85aa:	a805      	add	r0, sp, #20
c0de85ac:	f7fb ff0a 	bl	c0de43c4 <nbgl_layoutGet>
c0de85b0:	2140      	movs	r1, #64	@ 0x40
c0de85b2:	4605      	mov	r5, r0
c0de85b4:	f7ff fedc 	bl	c0de8370 <addEmptyHeader>
c0de85b8:	a901      	add	r1, sp, #4
c0de85ba:	4628      	mov	r0, r5
c0de85bc:	f7fe f9b2 	bl	c0de6924 <nbgl_layoutAddChoiceButtons>
c0de85c0:	4628      	mov	r0, r5
c0de85c2:	4621      	mov	r1, r4
c0de85c4:	f7fd fe04 	bl	c0de61d0 <nbgl_layoutAddCenteredInfo>
c0de85c8:	4628      	mov	r0, r5
c0de85ca:	f7ff f8f5 	bl	c0de77b8 <nbgl_layoutDraw>
c0de85ce:	4628      	mov	r0, r5
c0de85d0:	b00c      	add	sp, #48	@ 0x30
c0de85d2:	bdb0      	pop	{r4, r5, r7, pc}
c0de85d4:	000057bf 	.word	0x000057bf

c0de85d8 <nbgl_pageDrawGenericContentExt>:
c0de85d8:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de85dc:	b096      	sub	sp, #88	@ 0x58
c0de85de:	460e      	mov	r6, r1
c0de85e0:	2100      	movs	r1, #0
c0de85e2:	4615      	mov	r5, r2
c0de85e4:	f88d 3008 	strb.w	r3, [sp, #8]
c0de85e8:	e9cd 0105 	strd	r0, r1, [sp, #20]
c0de85ec:	2001      	movs	r0, #1
c0de85ee:	f88d 0009 	strb.w	r0, [sp, #9]
c0de85f2:	b10e      	cbz	r6, c0de85f8 <nbgl_pageDrawGenericContentExt+0x20>
c0de85f4:	78f0      	ldrb	r0, [r6, #3]
c0de85f6:	b108      	cbz	r0, c0de85fc <nbgl_pageDrawGenericContentExt+0x24>
c0de85f8:	9103      	str	r1, [sp, #12]
c0de85fa:	e007      	b.n	c0de860c <nbgl_pageDrawGenericContentExt+0x34>
c0de85fc:	6970      	ldr	r0, [r6, #20]
c0de85fe:	7cb1      	ldrb	r1, [r6, #18]
c0de8600:	9003      	str	r0, [sp, #12]
c0de8602:	7970      	ldrb	r0, [r6, #5]
c0de8604:	f88d 1010 	strb.w	r1, [sp, #16]
c0de8608:	f88d 0011 	strb.w	r0, [sp, #17]
c0de860c:	a802      	add	r0, sp, #8
c0de860e:	f7fb fed9 	bl	c0de43c4 <nbgl_layoutGet>
c0de8612:	4682      	mov	sl, r0
c0de8614:	b17e      	cbz	r6, c0de8636 <nbgl_pageDrawGenericContentExt+0x5e>
c0de8616:	78f0      	ldrb	r0, [r6, #3]
c0de8618:	2801      	cmp	r0, #1
c0de861a:	d011      	beq.n	c0de8640 <nbgl_pageDrawGenericContentExt+0x68>
c0de861c:	b958      	cbnz	r0, c0de8636 <nbgl_pageDrawGenericContentExt+0x5e>
c0de861e:	68b3      	ldr	r3, [r6, #8]
c0de8620:	78b2      	ldrb	r2, [r6, #2]
c0de8622:	69b1      	ldr	r1, [r6, #24]
c0de8624:	b323      	cbz	r3, c0de8670 <nbgl_pageDrawGenericContentExt+0x98>
c0de8626:	7970      	ldrb	r0, [r6, #5]
c0de8628:	7b34      	ldrb	r4, [r6, #12]
c0de862a:	e9cd 4000 	strd	r4, r0, [sp]
c0de862e:	4650      	mov	r0, sl
c0de8630:	f7fe fc4b 	bl	c0de6eca <nbgl_layoutAddSplitFooter>
c0de8634:	e020      	b.n	c0de8678 <nbgl_pageDrawGenericContentExt+0xa0>
c0de8636:	f04f 0800 	mov.w	r8, #0
c0de863a:	f44f 7716 	mov.w	r7, #600	@ 0x258
c0de863e:	e07e      	b.n	c0de873e <nbgl_pageDrawGenericContentExt+0x166>
c0de8640:	68b0      	ldr	r0, [r6, #8]
c0de8642:	2800      	cmp	r0, #0
c0de8644:	4680      	mov	r8, r0
c0de8646:	bf18      	it	ne
c0de8648:	f04f 0801 	movne.w	r8, #1
c0de864c:	d027      	beq.n	c0de869e <nbgl_pageDrawGenericContentExt+0xc6>
c0de864e:	900e      	str	r0, [sp, #56]	@ 0x38
c0de8650:	2006      	movs	r0, #6
c0de8652:	7b31      	ldrb	r1, [r6, #12]
c0de8654:	f8ad 0034 	strh.w	r0, [sp, #52]	@ 0x34
c0de8658:	7970      	ldrb	r0, [r6, #5]
c0de865a:	f88d 103c 	strb.w	r1, [sp, #60]	@ 0x3c
c0de865e:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de8662:	a90d      	add	r1, sp, #52	@ 0x34
c0de8664:	4650      	mov	r0, sl
c0de8666:	f7fe fc45 	bl	c0de6ef4 <nbgl_layoutAddHeader>
c0de866a:	f5c0 7716 	rsb	r7, r0, #600	@ 0x258
c0de866e:	e018      	b.n	c0de86a2 <nbgl_pageDrawGenericContentExt+0xca>
c0de8670:	7973      	ldrb	r3, [r6, #5]
c0de8672:	4650      	mov	r0, sl
c0de8674:	f7fe fc17 	bl	c0de6ea6 <nbgl_layoutAddFooter>
c0de8678:	f5c0 7716 	rsb	r7, r0, #600	@ 0x258
c0de867c:	7930      	ldrb	r0, [r6, #4]
c0de867e:	2800      	cmp	r0, #0
c0de8680:	d042      	beq.n	c0de8708 <nbgl_pageDrawGenericContentExt+0x130>
c0de8682:	7c70      	ldrb	r0, [r6, #17]
c0de8684:	7974      	ldrb	r4, [r6, #5]
c0de8686:	7831      	ldrb	r1, [r6, #0]
c0de8688:	7872      	ldrb	r2, [r6, #1]
c0de868a:	7c33      	ldrb	r3, [r6, #16]
c0de868c:	e9cd 0400 	strd	r0, r4, [sp]
c0de8690:	4650      	mov	r0, sl
c0de8692:	f7fe fe73 	bl	c0de737c <nbgl_layoutAddProgressIndicator>
c0de8696:	1a3f      	subs	r7, r7, r0
c0de8698:	f04f 0801 	mov.w	r8, #1
c0de869c:	e04f      	b.n	c0de873e <nbgl_pageDrawGenericContentExt+0x166>
c0de869e:	f44f 7716 	mov.w	r7, #600	@ 0x258
c0de86a2:	2001      	movs	r0, #1
c0de86a4:	f88d 0035 	strb.w	r0, [sp, #53]	@ 0x35
c0de86a8:	7870      	ldrb	r0, [r6, #1]
c0de86aa:	2802      	cmp	r0, #2
c0de86ac:	d31c      	bcc.n	c0de86e8 <nbgl_pageDrawGenericContentExt+0x110>
c0de86ae:	6971      	ldr	r1, [r6, #20]
c0de86b0:	b369      	cbz	r1, c0de870e <nbgl_pageDrawGenericContentExt+0x136>
c0de86b2:	f88d 0039 	strb.w	r0, [sp, #57]	@ 0x39
c0de86b6:	2001      	movs	r0, #1
c0de86b8:	9111      	str	r1, [sp, #68]	@ 0x44
c0de86ba:	2103      	movs	r1, #3
c0de86bc:	7972      	ldrb	r2, [r6, #5]
c0de86be:	f000 f9c9 	bl	c0de8a54 <OUTLINED_FUNCTION_3>
c0de86c2:	2100      	movs	r1, #0
c0de86c4:	f88d 103b 	strb.w	r1, [sp, #59]	@ 0x3b
c0de86c8:	78b1      	ldrb	r1, [r6, #2]
c0de86ca:	f88d 2049 	strb.w	r2, [sp, #73]	@ 0x49
c0de86ce:	f88d 303c 	strb.w	r3, [sp, #60]	@ 0x3c
c0de86d2:	f88d 2040 	strb.w	r2, [sp, #64]	@ 0x40
c0de86d6:	f88d 003a 	strb.w	r0, [sp, #58]	@ 0x3a
c0de86da:	7cb0      	ldrb	r0, [r6, #18]
c0de86dc:	f88d 1048 	strb.w	r1, [sp, #72]	@ 0x48
c0de86e0:	f88d 003f 	strb.w	r0, [sp, #63]	@ 0x3f
c0de86e4:	7cf0      	ldrb	r0, [r6, #19]
c0de86e6:	e023      	b.n	c0de8730 <nbgl_pageDrawGenericContentExt+0x158>
c0de86e8:	6970      	ldr	r0, [r6, #20]
c0de86ea:	b340      	cbz	r0, c0de873e <nbgl_pageDrawGenericContentExt+0x166>
c0de86ec:	2100      	movs	r1, #0
c0de86ee:	900e      	str	r0, [sp, #56]	@ 0x38
c0de86f0:	2001      	movs	r0, #1
c0de86f2:	f88d 103c 	strb.w	r1, [sp, #60]	@ 0x3c
c0de86f6:	f88d 0034 	strb.w	r0, [sp, #52]	@ 0x34
c0de86fa:	78b0      	ldrb	r0, [r6, #2]
c0de86fc:	7971      	ldrb	r1, [r6, #5]
c0de86fe:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de8702:	f88d 103e 	strb.w	r1, [sp, #62]	@ 0x3e
c0de8706:	e015      	b.n	c0de8734 <nbgl_pageDrawGenericContentExt+0x15c>
c0de8708:	f04f 0800 	mov.w	r8, #0
c0de870c:	e017      	b.n	c0de873e <nbgl_pageDrawGenericContentExt+0x166>
c0de870e:	f88d 0039 	strb.w	r0, [sp, #57]	@ 0x39
c0de8712:	2000      	movs	r0, #0
c0de8714:	2104      	movs	r1, #4
c0de8716:	7c32      	ldrb	r2, [r6, #16]
c0de8718:	f000 f99c 	bl	c0de8a54 <OUTLINED_FUNCTION_3>
c0de871c:	7971      	ldrb	r1, [r6, #5]
c0de871e:	f88d 203b 	strb.w	r2, [sp, #59]	@ 0x3b
c0de8722:	f88d 303c 	strb.w	r3, [sp, #60]	@ 0x3c
c0de8726:	f88d 003a 	strb.w	r0, [sp, #58]	@ 0x3a
c0de872a:	7cf0      	ldrb	r0, [r6, #19]
c0de872c:	f88d 1040 	strb.w	r1, [sp, #64]	@ 0x40
c0de8730:	f88d 0038 	strb.w	r0, [sp, #56]	@ 0x38
c0de8734:	a90d      	add	r1, sp, #52	@ 0x34
c0de8736:	4650      	mov	r0, sl
c0de8738:	f7fc fc48 	bl	c0de4fcc <nbgl_layoutAddExtendedFooter>
c0de873c:	1a3f      	subs	r7, r7, r0
c0de873e:	6828      	ldr	r0, [r5, #0]
c0de8740:	b190      	cbz	r0, c0de8768 <nbgl_pageDrawGenericContentExt+0x190>
c0de8742:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de8744:	2000      	movs	r0, #0
c0de8746:	79a9      	ldrb	r1, [r5, #6]
c0de8748:	900e      	str	r0, [sp, #56]	@ 0x38
c0de874a:	f240 1001 	movw	r0, #257	@ 0x101
c0de874e:	f8ad 0034 	strh.w	r0, [sp, #52]	@ 0x34
c0de8752:	7968      	ldrb	r0, [r5, #5]
c0de8754:	f88d 1041 	strb.w	r1, [sp, #65]	@ 0x41
c0de8758:	f88d 0040 	strb.w	r0, [sp, #64]	@ 0x40
c0de875c:	a90d      	add	r1, sp, #52	@ 0x34
c0de875e:	4650      	mov	r0, sl
c0de8760:	f7fe fbc8 	bl	c0de6ef4 <nbgl_layoutAddHeader>
c0de8764:	f04f 0801 	mov.w	r8, #1
c0de8768:	68a9      	ldr	r1, [r5, #8]
c0de876a:	b121      	cbz	r1, c0de8776 <nbgl_pageDrawGenericContentExt+0x19e>
c0de876c:	79ab      	ldrb	r3, [r5, #6]
c0de876e:	79ea      	ldrb	r2, [r5, #7]
c0de8770:	4650      	mov	r0, sl
c0de8772:	f7fc fbef 	bl	c0de4f54 <nbgl_layoutAddTopRightButton>
c0de8776:	7b28      	ldrb	r0, [r5, #12]
c0de8778:	2800      	cmp	r0, #0
c0de877a:	d044      	beq.n	c0de8806 <nbgl_pageDrawGenericContentExt+0x22e>
c0de877c:	2801      	cmp	r0, #1
c0de877e:	d04d      	beq.n	c0de881c <nbgl_pageDrawGenericContentExt+0x244>
c0de8780:	2802      	cmp	r0, #2
c0de8782:	d067      	beq.n	c0de8854 <nbgl_pageDrawGenericContentExt+0x27c>
c0de8784:	2803      	cmp	r0, #3
c0de8786:	d075      	beq.n	c0de8874 <nbgl_pageDrawGenericContentExt+0x29c>
c0de8788:	2804      	cmp	r0, #4
c0de878a:	f000 8090 	beq.w	c0de88ae <nbgl_pageDrawGenericContentExt+0x2d6>
c0de878e:	2805      	cmp	r0, #5
c0de8790:	f000 8095 	beq.w	c0de88be <nbgl_pageDrawGenericContentExt+0x2e6>
c0de8794:	2806      	cmp	r0, #6
c0de8796:	f000 80ab 	beq.w	c0de88f0 <nbgl_pageDrawGenericContentExt+0x318>
c0de879a:	2807      	cmp	r0, #7
c0de879c:	f000 80db 	beq.w	c0de8956 <nbgl_pageDrawGenericContentExt+0x37e>
c0de87a0:	2808      	cmp	r0, #8
c0de87a2:	f000 80ec 	beq.w	c0de897e <nbgl_pageDrawGenericContentExt+0x3a6>
c0de87a6:	2809      	cmp	r0, #9
c0de87a8:	f000 8114 	beq.w	c0de89d4 <nbgl_pageDrawGenericContentExt+0x3fc>
c0de87ac:	280a      	cmp	r0, #10
c0de87ae:	f040 8116 	bne.w	c0de89de <nbgl_pageDrawGenericContentExt+0x406>
c0de87b2:	489b      	ldr	r0, [pc, #620]	@ (c0de8a20 <nbgl_pageDrawGenericContentExt+0x448>)
c0de87b4:	2400      	movs	r4, #0
c0de87b6:	f10d 0834 	add.w	r8, sp, #52	@ 0x34
c0de87ba:	2600      	movs	r6, #0
c0de87bc:	4478      	add	r0, pc
c0de87be:	4683      	mov	fp, r0
c0de87c0:	7e28      	ldrb	r0, [r5, #24]
c0de87c2:	4286      	cmp	r6, r0
c0de87c4:	f080 810b 	bcs.w	c0de89de <nbgl_pageDrawGenericContentExt+0x406>
c0de87c8:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de87cc:	f850 0026 	ldr.w	r0, [r0, r6, lsl #2]
c0de87d0:	e9cd b40f 	strd	fp, r4, [sp, #60]	@ 0x3c
c0de87d4:	e9cd 400d 	strd	r4, r0, [sp, #52]	@ 0x34
c0de87d8:	5d88      	ldrb	r0, [r1, r6]
c0de87da:	4641      	mov	r1, r8
c0de87dc:	f88d 4046 	strb.w	r4, [sp, #70]	@ 0x46
c0de87e0:	f88d 4044 	strb.w	r4, [sp, #68]	@ 0x44
c0de87e4:	f88d 0045 	strb.w	r0, [sp, #69]	@ 0x45
c0de87e8:	7e68      	ldrb	r0, [r5, #25]
c0de87ea:	f88d 0048 	strb.w	r0, [sp, #72]	@ 0x48
c0de87ee:	4650      	mov	r0, sl
c0de87f0:	f7fc ff95 	bl	c0de571e <nbgl_layoutAddTouchableBar>
c0de87f4:	1a3f      	subs	r7, r7, r0
c0de87f6:	b2b8      	uxth	r0, r7
c0de87f8:	280b      	cmp	r0, #11
c0de87fa:	d302      	bcc.n	c0de8802 <nbgl_pageDrawGenericContentExt+0x22a>
c0de87fc:	4650      	mov	r0, sl
c0de87fe:	f7fe fa4f 	bl	c0de6ca0 <nbgl_layoutAddSeparationLine>
c0de8802:	3601      	adds	r6, #1
c0de8804:	e7dc      	b.n	c0de87c0 <nbgl_pageDrawGenericContentExt+0x1e8>
c0de8806:	f1b8 0f00 	cmp.w	r8, #0
c0de880a:	d101      	bne.n	c0de8810 <nbgl_pageDrawGenericContentExt+0x238>
c0de880c:	f000 f90f 	bl	c0de8a2e <OUTLINED_FUNCTION_0>
c0de8810:	f105 0110 	add.w	r1, r5, #16
c0de8814:	4650      	mov	r0, sl
c0de8816:	f7fd fcdb 	bl	c0de61d0 <nbgl_layoutAddCenteredInfo>
c0de881a:	e0e0      	b.n	c0de89de <nbgl_pageDrawGenericContentExt+0x406>
c0de881c:	f1b8 0f00 	cmp.w	r8, #0
c0de8820:	d101      	bne.n	c0de8826 <nbgl_pageDrawGenericContentExt+0x24e>
c0de8822:	f000 f904 	bl	c0de8a2e <OUTLINED_FUNCTION_0>
c0de8826:	f105 0110 	add.w	r1, r5, #16
c0de882a:	4650      	mov	r0, sl
c0de882c:	f7fd fefe 	bl	c0de662c <nbgl_layoutAddContentCenter>
c0de8830:	6b68      	ldr	r0, [r5, #52]	@ 0x34
c0de8832:	2800      	cmp	r0, #0
c0de8834:	f000 80d3 	beq.w	c0de89de <nbgl_pageDrawGenericContentExt+0x406>
c0de8838:	900e      	str	r0, [sp, #56]	@ 0x38
c0de883a:	2003      	movs	r0, #3
c0de883c:	f88d 0034 	strb.w	r0, [sp, #52]	@ 0x34
c0de8840:	6ba8      	ldr	r0, [r5, #56]	@ 0x38
c0de8842:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de8844:	8fa8      	ldrh	r0, [r5, #60]	@ 0x3c
c0de8846:	f8ad 0040 	strh.w	r0, [sp, #64]	@ 0x40
c0de884a:	a90d      	add	r1, sp, #52	@ 0x34
c0de884c:	4650      	mov	r0, sl
c0de884e:	f7fc f815 	bl	c0de487c <nbgl_layoutAddUpFooter>
c0de8852:	e0c4      	b.n	c0de89de <nbgl_pageDrawGenericContentExt+0x406>
c0de8854:	ae0d      	add	r6, sp, #52	@ 0x34
c0de8856:	2124      	movs	r1, #36	@ 0x24
c0de8858:	4630      	mov	r0, r6
c0de885a:	f003 fde7 	bl	c0dec42c <__aeabi_memclr>
c0de885e:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de8862:	f000 f8f1 	bl	c0de8a48 <OUTLINED_FUNCTION_2>
c0de8866:	69a9      	ldr	r1, [r5, #24]
c0de8868:	7f6b      	ldrb	r3, [r5, #29]
c0de886a:	7f2a      	ldrb	r2, [r5, #28]
c0de886c:	4650      	mov	r0, sl
c0de886e:	f7fe fb08 	bl	c0de6e82 <nbgl_layoutAddLongPressButton>
c0de8872:	e0b4      	b.n	c0de89de <nbgl_pageDrawGenericContentExt+0x406>
c0de8874:	ae0d      	add	r6, sp, #52	@ 0x34
c0de8876:	2124      	movs	r1, #36	@ 0x24
c0de8878:	4630      	mov	r0, r6
c0de887a:	f003 fdd7 	bl	c0dec42c <__aeabi_memclr>
c0de887e:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de8882:	2400      	movs	r4, #0
c0de8884:	f88d 4034 	strb.w	r4, [sp, #52]	@ 0x34
c0de8888:	f000 f8de 	bl	c0de8a48 <OUTLINED_FUNCTION_2>
c0de888c:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0de8890:	940a      	str	r4, [sp, #40]	@ 0x28
c0de8892:	f88d 402d 	strb.w	r4, [sp, #45]	@ 0x2d
c0de8896:	f8ad 002e 	strh.w	r0, [sp, #46]	@ 0x2e
c0de889a:	69a8      	ldr	r0, [r5, #24]
c0de889c:	9009      	str	r0, [sp, #36]	@ 0x24
c0de889e:	7f28      	ldrb	r0, [r5, #28]
c0de88a0:	f88d 002c 	strb.w	r0, [sp, #44]	@ 0x2c
c0de88a4:	7f68      	ldrb	r0, [r5, #29]
c0de88a6:	f88d 0030 	strb.w	r0, [sp, #48]	@ 0x30
c0de88aa:	a909      	add	r1, sp, #36	@ 0x24
c0de88ac:	e04f      	b.n	c0de894e <nbgl_pageDrawGenericContentExt+0x376>
c0de88ae:	f1b8 0f00 	cmp.w	r8, #0
c0de88b2:	d101      	bne.n	c0de88b8 <nbgl_pageDrawGenericContentExt+0x2e0>
c0de88b4:	f000 f8bb 	bl	c0de8a2e <OUTLINED_FUNCTION_0>
c0de88b8:	f000 f8da 	bl	c0de8a70 <OUTLINED_FUNCTION_5>
c0de88bc:	e08f      	b.n	c0de89de <nbgl_pageDrawGenericContentExt+0x406>
c0de88be:	f1b8 0f00 	cmp.w	r8, #0
c0de88c2:	d101      	bne.n	c0de88c8 <nbgl_pageDrawGenericContentExt+0x2f0>
c0de88c4:	f000 f8b3 	bl	c0de8a2e <OUTLINED_FUNCTION_0>
c0de88c8:	7ea8      	ldrb	r0, [r5, #26]
c0de88ca:	f105 0110 	add.w	r1, r5, #16
c0de88ce:	3803      	subs	r0, #3
c0de88d0:	76a8      	strb	r0, [r5, #26]
c0de88d2:	4650      	mov	r0, sl
c0de88d4:	f7fe f850 	bl	c0de6978 <nbgl_layoutAddTagValueList>
c0de88d8:	2001      	movs	r0, #1
c0de88da:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de88de:	f8ad 003e 	strh.w	r0, [sp, #62]	@ 0x3e
c0de88e2:	e9d5 0109 	ldrd	r0, r1, [r5, #36]	@ 0x24
c0de88e6:	e9cd 100d 	strd	r1, r0, [sp, #52]	@ 0x34
c0de88ea:	f000 f8ba 	bl	c0de8a62 <OUTLINED_FUNCTION_4>
c0de88ee:	e02b      	b.n	c0de8948 <nbgl_pageDrawGenericContentExt+0x370>
c0de88f0:	f1b8 0f00 	cmp.w	r8, #0
c0de88f4:	d101      	bne.n	c0de88fa <nbgl_pageDrawGenericContentExt+0x322>
c0de88f6:	f000 f89a 	bl	c0de8a2e <OUTLINED_FUNCTION_0>
c0de88fa:	f000 f8b9 	bl	c0de8a70 <OUTLINED_FUNCTION_5>
c0de88fe:	6aa8      	ldr	r0, [r5, #40]	@ 0x28
c0de8900:	2800      	cmp	r0, #0
c0de8902:	d073      	beq.n	c0de89ec <nbgl_pageDrawGenericContentExt+0x414>
c0de8904:	900d      	str	r0, [sp, #52]	@ 0x34
c0de8906:	6a68      	ldr	r0, [r5, #36]	@ 0x24
c0de8908:	2101      	movs	r1, #1
c0de890a:	f8ad 103e 	strh.w	r1, [sp, #62]	@ 0x3e
c0de890e:	f88d 103d 	strb.w	r1, [sp, #61]	@ 0x3d
c0de8912:	900e      	str	r0, [sp, #56]	@ 0x38
c0de8914:	f000 f8a5 	bl	c0de8a62 <OUTLINED_FUNCTION_4>
c0de8918:	f88d 0040 	strb.w	r0, [sp, #64]	@ 0x40
c0de891c:	a90d      	add	r1, sp, #52	@ 0x34
c0de891e:	4650      	mov	r0, sl
c0de8920:	f7fe f9d0 	bl	c0de6cc4 <nbgl_layoutAddButton>
c0de8924:	6b28      	ldr	r0, [r5, #48]	@ 0x30
c0de8926:	2800      	cmp	r0, #0
c0de8928:	d059      	beq.n	c0de89de <nbgl_pageDrawGenericContentExt+0x406>
c0de892a:	2100      	movs	r1, #0
c0de892c:	900d      	str	r0, [sp, #52]	@ 0x34
c0de892e:	f895 002d 	ldrb.w	r0, [r5, #45]	@ 0x2d
c0de8932:	f88d 103d 	strb.w	r1, [sp, #61]	@ 0x3d
c0de8936:	910e      	str	r1, [sp, #56]	@ 0x38
c0de8938:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de893c:	f8ad 103e 	strh.w	r1, [sp, #62]	@ 0x3e
c0de8940:	f895 1038 	ldrb.w	r1, [r5, #56]	@ 0x38
c0de8944:	f88d 103c 	strb.w	r1, [sp, #60]	@ 0x3c
c0de8948:	f88d 0040 	strb.w	r0, [sp, #64]	@ 0x40
c0de894c:	a90d      	add	r1, sp, #52	@ 0x34
c0de894e:	4650      	mov	r0, sl
c0de8950:	f7fe f9b8 	bl	c0de6cc4 <nbgl_layoutAddButton>
c0de8954:	e043      	b.n	c0de89de <nbgl_pageDrawGenericContentExt+0x406>
c0de8956:	2400      	movs	r4, #0
c0de8958:	2600      	movs	r6, #0
c0de895a:	7d28      	ldrb	r0, [r5, #20]
c0de895c:	4286      	cmp	r6, r0
c0de895e:	d23e      	bcs.n	c0de89de <nbgl_pageDrawGenericContentExt+0x406>
c0de8960:	6928      	ldr	r0, [r5, #16]
c0de8962:	1901      	adds	r1, r0, r4
c0de8964:	4650      	mov	r0, sl
c0de8966:	f7fd f8db 	bl	c0de5b20 <nbgl_layoutAddSwitch>
c0de896a:	1a3f      	subs	r7, r7, r0
c0de896c:	b2b8      	uxth	r0, r7
c0de896e:	280b      	cmp	r0, #11
c0de8970:	d302      	bcc.n	c0de8978 <nbgl_pageDrawGenericContentExt+0x3a0>
c0de8972:	4650      	mov	r0, sl
c0de8974:	f7fe f994 	bl	c0de6ca0 <nbgl_layoutAddSeparationLine>
c0de8978:	340c      	adds	r4, #12
c0de897a:	3601      	adds	r6, #1
c0de897c:	e7ed      	b.n	c0de895a <nbgl_pageDrawGenericContentExt+0x382>
c0de897e:	2600      	movs	r6, #0
c0de8980:	2400      	movs	r4, #0
c0de8982:	7f28      	ldrb	r0, [r5, #28]
c0de8984:	4284      	cmp	r4, r0
c0de8986:	d22a      	bcs.n	c0de89de <nbgl_pageDrawGenericContentExt+0x406>
c0de8988:	7fa8      	ldrb	r0, [r5, #30]
c0de898a:	b180      	cbz	r0, c0de89ae <nbgl_pageDrawGenericContentExt+0x3d6>
c0de898c:	69a8      	ldr	r0, [r5, #24]
c0de898e:	b170      	cbz	r0, c0de89ae <nbgl_pageDrawGenericContentExt+0x3d6>
c0de8990:	5980      	ldr	r0, [r0, r6]
c0de8992:	b160      	cbz	r0, c0de89ae <nbgl_pageDrawGenericContentExt+0x3d6>
c0de8994:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de8998:	7f6b      	ldrb	r3, [r5, #29]
c0de899a:	f851 2024 	ldr.w	r2, [r1, r4, lsl #2]
c0de899e:	f850 1024 	ldr.w	r1, [r0, r4, lsl #2]
c0de89a2:	b2e0      	uxtb	r0, r4
c0de89a4:	9000      	str	r0, [sp, #0]
c0de89a6:	4650      	mov	r0, sl
c0de89a8:	f7fd fa24 	bl	c0de5df4 <nbgl_layoutAddTextWithAlias>
c0de89ac:	e008      	b.n	c0de89c0 <nbgl_pageDrawGenericContentExt+0x3e8>
c0de89ae:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de89b2:	f851 2024 	ldr.w	r2, [r1, r4, lsl #2]
c0de89b6:	f850 1024 	ldr.w	r1, [r0, r4, lsl #2]
c0de89ba:	4650      	mov	r0, sl
c0de89bc:	f7fd f8d2 	bl	c0de5b64 <nbgl_layoutAddText>
c0de89c0:	1a3f      	subs	r7, r7, r0
c0de89c2:	b2b8      	uxth	r0, r7
c0de89c4:	280b      	cmp	r0, #11
c0de89c6:	d302      	bcc.n	c0de89ce <nbgl_pageDrawGenericContentExt+0x3f6>
c0de89c8:	4650      	mov	r0, sl
c0de89ca:	f7fe f969 	bl	c0de6ca0 <nbgl_layoutAddSeparationLine>
c0de89ce:	3618      	adds	r6, #24
c0de89d0:	3401      	adds	r4, #1
c0de89d2:	e7d6      	b.n	c0de8982 <nbgl_pageDrawGenericContentExt+0x3aa>
c0de89d4:	f105 0110 	add.w	r1, r5, #16
c0de89d8:	4650      	mov	r0, sl
c0de89da:	f7fd fad3 	bl	c0de5f84 <nbgl_layoutAddRadioChoice>
c0de89de:	4650      	mov	r0, sl
c0de89e0:	f7fe feea 	bl	c0de77b8 <nbgl_layoutDraw>
c0de89e4:	4650      	mov	r0, sl
c0de89e6:	b016      	add	sp, #88	@ 0x58
c0de89e8:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de89ec:	6a68      	ldr	r0, [r5, #36]	@ 0x24
c0de89ee:	2800      	cmp	r0, #0
c0de89f0:	d098      	beq.n	c0de8924 <nbgl_pageDrawGenericContentExt+0x34c>
c0de89f2:	6b29      	ldr	r1, [r5, #48]	@ 0x30
c0de89f4:	2900      	cmp	r1, #0
c0de89f6:	d095      	beq.n	c0de8924 <nbgl_pageDrawGenericContentExt+0x34c>
c0de89f8:	e9cd 010d 	strd	r0, r1, [sp, #52]	@ 0x34
c0de89fc:	f895 002c 	ldrb.w	r0, [r5, #44]	@ 0x2c
c0de8a00:	f895 102d 	ldrb.w	r1, [r5, #45]	@ 0x2d
c0de8a04:	f895 2038 	ldrb.w	r2, [r5, #56]	@ 0x38
c0de8a08:	f88d 003c 	strb.w	r0, [sp, #60]	@ 0x3c
c0de8a0c:	f88d 203d 	strb.w	r2, [sp, #61]	@ 0x3d
c0de8a10:	f88d 103e 	strb.w	r1, [sp, #62]	@ 0x3e
c0de8a14:	a90d      	add	r1, sp, #52	@ 0x34
c0de8a16:	4650      	mov	r0, sl
c0de8a18:	f7fd ff9a 	bl	c0de6950 <nbgl_layoutAddHorizontalButtons>
c0de8a1c:	e7df      	b.n	c0de89de <nbgl_pageDrawGenericContentExt+0x406>
c0de8a1e:	bf00      	nop
c0de8a20:	00004981 	.word	0x00004981

c0de8a24 <nbgl_pageDrawGenericContent>:
c0de8a24:	2300      	movs	r3, #0
c0de8a26:	f7ff bdd7 	b.w	c0de85d8 <nbgl_pageDrawGenericContentExt>

c0de8a2a <nbgl_pageRelease>:
c0de8a2a:	f7fe bef3 	b.w	c0de7814 <nbgl_layoutRelease>

c0de8a2e <OUTLINED_FUNCTION_0>:
c0de8a2e:	4650      	mov	r0, sl
c0de8a30:	2128      	movs	r1, #40	@ 0x28
c0de8a32:	f7ff bc9d 	b.w	c0de8370 <addEmptyHeader>

c0de8a36 <OUTLINED_FUNCTION_1>:
c0de8a36:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de8a3a:	788a      	ldrb	r2, [r1, #2]
c0de8a3c:	78c9      	ldrb	r1, [r1, #3]
c0de8a3e:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de8a42:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de8a46:	4770      	bx	lr

c0de8a48 <OUTLINED_FUNCTION_2>:
c0de8a48:	910e      	str	r1, [sp, #56]	@ 0x38
c0de8a4a:	9011      	str	r0, [sp, #68]	@ 0x44
c0de8a4c:	4650      	mov	r0, sl
c0de8a4e:	4631      	mov	r1, r6
c0de8a50:	f7fd bdec 	b.w	c0de662c <nbgl_layoutAddContentCenter>

c0de8a54 <OUTLINED_FUNCTION_3>:
c0de8a54:	7c73      	ldrb	r3, [r6, #17]
c0de8a56:	f88d 003e 	strb.w	r0, [sp, #62]	@ 0x3e
c0de8a5a:	7830      	ldrb	r0, [r6, #0]
c0de8a5c:	f88d 1034 	strb.w	r1, [sp, #52]	@ 0x34
c0de8a60:	4770      	bx	lr

c0de8a62 <OUTLINED_FUNCTION_4>:
c0de8a62:	f895 002c 	ldrb.w	r0, [r5, #44]	@ 0x2c
c0de8a66:	f88d 003c 	strb.w	r0, [sp, #60]	@ 0x3c
c0de8a6a:	f895 002d 	ldrb.w	r0, [r5, #45]	@ 0x2d
c0de8a6e:	4770      	bx	lr

c0de8a70 <OUTLINED_FUNCTION_5>:
c0de8a70:	f105 0110 	add.w	r1, r5, #16
c0de8a74:	4650      	mov	r0, sl
c0de8a76:	f7fd bf7f 	b.w	c0de6978 <nbgl_layoutAddTagValueList>

c0de8a7a <getNbTagValuesInPage>:
c0de8a7a:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de8a7e:	4604      	mov	r4, r0
c0de8a80:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de8a82:	f04f 0800 	mov.w	r8, #0
c0de8a86:	2b00      	cmp	r3, #0
c0de8a88:	460e      	mov	r6, r1
c0de8a8a:	f04f 0b00 	mov.w	fp, #0
c0de8a8e:	f880 8000 	strb.w	r8, [r0]
c0de8a92:	f44f 70e8 	mov.w	r0, #464	@ 0x1d0
c0de8a96:	bf18      	it	ne
c0de8a98:	f44f 70cc 	movne.w	r0, #408	@ 0x198
c0de8a9c:	0111      	lsls	r1, r2, #4
c0de8a9e:	e9cd 2001 	strd	r2, r0, [sp, #4]
c0de8aa2:	4544      	cmp	r4, r8
c0de8aa4:	d052      	beq.n	c0de8b4c <getNbTagValuesInPage+0xd2>
c0de8aa6:	465d      	mov	r5, fp
c0de8aa8:	f10b 0a18 	add.w	sl, fp, #24
c0de8aac:	f1b8 0f00 	cmp.w	r8, #0
c0de8ab0:	bf18      	it	ne
c0de8ab2:	4655      	movne	r5, sl
c0de8ab4:	6830      	ldr	r0, [r6, #0]
c0de8ab6:	9103      	str	r1, [sp, #12]
c0de8ab8:	b108      	cbz	r0, c0de8abe <getNbTagValuesInPage+0x44>
c0de8aba:	4408      	add	r0, r1
c0de8abc:	e004      	b.n	c0de8ac8 <getNbTagValuesInPage+0x4e>
c0de8abe:	9801      	ldr	r0, [sp, #4]
c0de8ac0:	6871      	ldr	r1, [r6, #4]
c0de8ac2:	4440      	add	r0, r8
c0de8ac4:	b2c0      	uxtb	r0, r0
c0de8ac6:	4788      	blx	r1
c0de8ac8:	f003 fa8e 	bl	c0debfe8 <pic>
c0de8acc:	4607      	mov	r7, r0
c0de8ace:	7b00      	ldrb	r0, [r0, #12]
c0de8ad0:	07c1      	lsls	r1, r0, #31
c0de8ad2:	bf18      	it	ne
c0de8ad4:	f1b8 0f00 	cmpne.w	r8, #0
c0de8ad8:	d13b      	bne.n	c0de8b52 <getNbTagValuesInPage+0xd8>
c0de8ada:	0780      	lsls	r0, r0, #30
c0de8adc:	d45d      	bmi.n	c0de8b9a <getNbTagValuesInPage+0x120>
c0de8ade:	7b73      	ldrb	r3, [r6, #13]
c0de8ae0:	6839      	ldr	r1, [r7, #0]
c0de8ae2:	200b      	movs	r0, #11
c0de8ae4:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de8ae8:	46a2      	mov	sl, r4
c0de8aea:	f003 f8b5 	bl	c0debc58 <nbgl_getTextHeightInWidth>
c0de8aee:	182c      	adds	r4, r5, r0
c0de8af0:	7b30      	ldrb	r0, [r6, #12]
c0de8af2:	250b      	movs	r5, #11
c0de8af4:	7b73      	ldrb	r3, [r6, #13]
c0de8af6:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de8afa:	2800      	cmp	r0, #0
c0de8afc:	bf08      	it	eq
c0de8afe:	250d      	moveq	r5, #13
c0de8b00:	6879      	ldr	r1, [r7, #4]
c0de8b02:	4628      	mov	r0, r5
c0de8b04:	f003 f8a8 	bl	c0debc58 <nbgl_getTextHeightInWidth>
c0de8b08:	4420      	add	r0, r4
c0de8b0a:	6879      	ldr	r1, [r7, #4]
c0de8b0c:	7b73      	ldrb	r3, [r6, #13]
c0de8b0e:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de8b12:	f100 0b04 	add.w	fp, r0, #4
c0de8b16:	4628      	mov	r0, r5
c0de8b18:	fa1f f48b 	uxth.w	r4, fp
c0de8b1c:	f003 f8a1 	bl	c0debc62 <nbgl_getTextNbLinesInWidth>
c0de8b20:	9902      	ldr	r1, [sp, #8]
c0de8b22:	428c      	cmp	r4, r1
c0de8b24:	bf38      	it	cc
c0de8b26:	280a      	cmpcc	r0, #10
c0de8b28:	d205      	bcs.n	c0de8b36 <getNbTagValuesInPage+0xbc>
c0de8b2a:	9903      	ldr	r1, [sp, #12]
c0de8b2c:	f108 0801 	add.w	r8, r8, #1
c0de8b30:	4654      	mov	r4, sl
c0de8b32:	3110      	adds	r1, #16
c0de8b34:	e7b5      	b.n	c0de8aa2 <getNbTagValuesInPage+0x28>
c0de8b36:	ea5f 6008 	movs.w	r0, r8, lsl #24
c0de8b3a:	d104      	bne.n	c0de8b46 <getNbTagValuesInPage+0xcc>
c0de8b3c:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de8b3e:	f04f 0801 	mov.w	r8, #1
c0de8b42:	f880 8000 	strb.w	r8, [r0]
c0de8b46:	4654      	mov	r4, sl
c0de8b48:	46da      	mov	sl, fp
c0de8b4a:	e003      	b.n	c0de8b54 <getNbTagValuesInPage+0xda>
c0de8b4c:	46da      	mov	sl, fp
c0de8b4e:	46a0      	mov	r8, r4
c0de8b50:	e000      	b.n	c0de8b54 <getNbTagValuesInPage+0xda>
c0de8b52:	46aa      	mov	sl, r5
c0de8b54:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de8b56:	b170      	cbz	r0, c0de8b76 <getNbTagValuesInPage+0xfc>
c0de8b58:	fa5f f088 	uxtb.w	r0, r8
c0de8b5c:	42a0      	cmp	r0, r4
c0de8b5e:	d10a      	bne.n	c0de8b76 <getNbTagValuesInPage+0xfc>
c0de8b60:	9902      	ldr	r1, [sp, #8]
c0de8b62:	fa1f f08a 	uxth.w	r0, sl
c0de8b66:	f501 71bc 	add.w	r1, r1, #376	@ 0x178
c0de8b6a:	f401 71ac 	and.w	r1, r1, #344	@ 0x158
c0de8b6e:	4281      	cmp	r1, r0
c0de8b70:	bf38      	it	cc
c0de8b72:	3c01      	subcc	r4, #1
c0de8b74:	e00d      	b.n	c0de8b92 <getNbTagValuesInPage+0x118>
c0de8b76:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de8b78:	b150      	cbz	r0, c0de8b90 <getNbTagValuesInPage+0x116>
c0de8b7a:	9902      	ldr	r1, [sp, #8]
c0de8b7c:	fa1f f08a 	uxth.w	r0, sl
c0de8b80:	f501 71e0 	add.w	r1, r1, #448	@ 0x1c0
c0de8b84:	f401 71ec 	and.w	r1, r1, #472	@ 0x1d8
c0de8b88:	4281      	cmp	r1, r0
c0de8b8a:	bf38      	it	cc
c0de8b8c:	f1a8 0801 	subcc.w	r8, r8, #1
c0de8b90:	4644      	mov	r4, r8
c0de8b92:	b2e0      	uxtb	r0, r4
c0de8b94:	b004      	add	sp, #16
c0de8b96:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de8b9a:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de8b9c:	f1b8 0f00 	cmp.w	r8, #0
c0de8ba0:	d1d9      	bne.n	c0de8b56 <getNbTagValuesInPage+0xdc>
c0de8ba2:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de8ba4:	f04f 0801 	mov.w	r8, #1
c0de8ba8:	46da      	mov	sl, fp
c0de8baa:	f881 8000 	strb.w	r8, [r1]
c0de8bae:	e7d2      	b.n	c0de8b56 <getNbTagValuesInPage+0xdc>

c0de8bb0 <nbgl_useCaseGetNbInfosInPage>:
c0de8bb0:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de8bb4:	f44f 74fc 	mov.w	r4, #504	@ 0x1f8
c0de8bb8:	9001      	str	r0, [sp, #4]
c0de8bba:	9300      	str	r3, [sp, #0]
c0de8bbc:	2b00      	cmp	r3, #0
c0de8bbe:	4616      	mov	r6, r2
c0de8bc0:	460f      	mov	r7, r1
c0de8bc2:	bf18      	it	ne
c0de8bc4:	f44f 74cc 	movne.w	r4, #408	@ 0x198
c0de8bc8:	6808      	ldr	r0, [r1, #0]
c0de8bca:	f003 fa0d 	bl	c0debfe8 <pic>
c0de8bce:	eb00 0b86 	add.w	fp, r0, r6, lsl #2
c0de8bd2:	6878      	ldr	r0, [r7, #4]
c0de8bd4:	f003 fa08 	bl	c0debfe8 <pic>
c0de8bd8:	eb00 0586 	add.w	r5, r0, r6, lsl #2
c0de8bdc:	2700      	movs	r7, #0
c0de8bde:	f04f 0800 	mov.w	r8, #0
c0de8be2:	f04f 0a00 	mov.w	sl, #0
c0de8be6:	9801      	ldr	r0, [sp, #4]
c0de8be8:	42b8      	cmp	r0, r7
c0de8bea:	d01e      	beq.n	c0de8c2a <nbgl_useCaseGetNbInfosInPage+0x7a>
c0de8bec:	f85b 0027 	ldr.w	r0, [fp, r7, lsl #2]
c0de8bf0:	f003 f9fa 	bl	c0debfe8 <pic>
c0de8bf4:	4601      	mov	r1, r0
c0de8bf6:	200c      	movs	r0, #12
c0de8bf8:	f002 fb2b 	bl	c0deb252 <OUTLINED_FUNCTION_2>
c0de8bfc:	4606      	mov	r6, r0
c0de8bfe:	f855 0027 	ldr.w	r0, [r5, r7, lsl #2]
c0de8c02:	f003 f9f1 	bl	c0debfe8 <pic>
c0de8c06:	4601      	mov	r1, r0
c0de8c08:	200b      	movs	r0, #11
c0de8c0a:	f002 fb22 	bl	c0deb252 <OUTLINED_FUNCTION_2>
c0de8c0e:	eb0a 0106 	add.w	r1, sl, r6
c0de8c12:	4408      	add	r0, r1
c0de8c14:	302a      	adds	r0, #42	@ 0x2a
c0de8c16:	b280      	uxth	r0, r0
c0de8c18:	f100 0a1a 	add.w	sl, r0, #26
c0de8c1c:	fa1f f08a 	uxth.w	r0, sl
c0de8c20:	42a0      	cmp	r0, r4
c0de8c22:	d204      	bcs.n	c0de8c2e <nbgl_useCaseGetNbInfosInPage+0x7e>
c0de8c24:	3701      	adds	r7, #1
c0de8c26:	4680      	mov	r8, r0
c0de8c28:	e7dd      	b.n	c0de8be6 <nbgl_useCaseGetNbInfosInPage+0x36>
c0de8c2a:	9f01      	ldr	r7, [sp, #4]
c0de8c2c:	e006      	b.n	c0de8c3c <nbgl_useCaseGetNbInfosInPage+0x8c>
c0de8c2e:	9800      	ldr	r0, [sp, #0]
c0de8c30:	b920      	cbnz	r0, c0de8c3c <nbgl_useCaseGetNbInfosInPage+0x8c>
c0de8c32:	ea4f 00d8 	mov.w	r0, r8, lsr #3
c0de8c36:	2832      	cmp	r0, #50	@ 0x32
c0de8c38:	bf88      	it	hi
c0de8c3a:	3f01      	subhi	r7, #1
c0de8c3c:	b2f8      	uxtb	r0, r7
c0de8c3e:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de8c42 <nbgl_useCaseGetNbSwitchesInPage>:
c0de8c42:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de8c46:	f44f 77fc 	mov.w	r7, #504	@ 0x1f8
c0de8c4a:	2b00      	cmp	r3, #0
c0de8c4c:	4682      	mov	sl, r0
c0de8c4e:	4698      	mov	r8, r3
c0de8c50:	4616      	mov	r6, r2
c0de8c52:	bf18      	it	ne
c0de8c54:	f44f 77cc 	movne.w	r7, #408	@ 0x198
c0de8c58:	6808      	ldr	r0, [r1, #0]
c0de8c5a:	f003 f9c5 	bl	c0debfe8 <pic>
c0de8c5e:	eb06 0146 	add.w	r1, r6, r6, lsl #1
c0de8c62:	2600      	movs	r6, #0
c0de8c64:	eb00 0081 	add.w	r0, r0, r1, lsl #2
c0de8c68:	1d04      	adds	r4, r0, #4
c0de8c6a:	2000      	movs	r0, #0
c0de8c6c:	4605      	mov	r5, r0
c0de8c6e:	45b2      	cmp	sl, r6
c0de8c70:	d010      	beq.n	c0de8c94 <nbgl_useCaseGetNbSwitchesInPage+0x52>
c0de8c72:	6821      	ldr	r1, [r4, #0]
c0de8c74:	b129      	cbz	r1, c0de8c82 <nbgl_useCaseGetNbSwitchesInPage+0x40>
c0de8c76:	200b      	movs	r0, #11
c0de8c78:	f002 faeb 	bl	c0deb252 <OUTLINED_FUNCTION_2>
c0de8c7c:	4428      	add	r0, r5
c0de8c7e:	3068      	adds	r0, #104	@ 0x68
c0de8c80:	e001      	b.n	c0de8c86 <nbgl_useCaseGetNbSwitchesInPage+0x44>
c0de8c82:	f105 005c 	add.w	r0, r5, #92	@ 0x5c
c0de8c86:	340c      	adds	r4, #12
c0de8c88:	3601      	adds	r6, #1
c0de8c8a:	b281      	uxth	r1, r0
c0de8c8c:	428f      	cmp	r7, r1
c0de8c8e:	d8ed      	bhi.n	c0de8c6c <nbgl_useCaseGetNbSwitchesInPage+0x2a>
c0de8c90:	f1a6 0a01 	sub.w	sl, r6, #1
c0de8c94:	b2a8      	uxth	r0, r5
c0de8c96:	2100      	movs	r1, #0
c0de8c98:	08c0      	lsrs	r0, r0, #3
c0de8c9a:	2832      	cmp	r0, #50	@ 0x32
c0de8c9c:	bf88      	it	hi
c0de8c9e:	2101      	movhi	r1, #1
c0de8ca0:	ea21 0008 	bic.w	r0, r1, r8
c0de8ca4:	ebaa 0000 	sub.w	r0, sl, r0
c0de8ca8:	b2c0      	uxtb	r0, r0
c0de8caa:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}

c0de8cae <nbgl_useCaseGetNbBarsInPage>:
c0de8cae:	b570      	push	{r4, r5, r6, lr}
c0de8cb0:	f44f 71fc 	mov.w	r1, #504	@ 0x1f8
c0de8cb4:	2b00      	cmp	r3, #0
c0de8cb6:	bf18      	it	ne
c0de8cb8:	f44f 71cc 	movne.w	r1, #408	@ 0x198
c0de8cbc:	2200      	movs	r2, #0
c0de8cbe:	2400      	movs	r4, #0
c0de8cc0:	2500      	movs	r5, #0
c0de8cc2:	b2ee      	uxtb	r6, r5
c0de8cc4:	4286      	cmp	r6, r0
c0de8cc6:	d208      	bcs.n	c0de8cda <nbgl_useCaseGetNbBarsInPage+0x2c>
c0de8cc8:	b292      	uxth	r2, r2
c0de8cca:	325c      	adds	r2, #92	@ 0x5c
c0de8ccc:	b296      	uxth	r6, r2
c0de8cce:	428e      	cmp	r6, r1
c0de8cd0:	d202      	bcs.n	c0de8cd8 <nbgl_useCaseGetNbBarsInPage+0x2a>
c0de8cd2:	3501      	adds	r5, #1
c0de8cd4:	4634      	mov	r4, r6
c0de8cd6:	e7f4      	b.n	c0de8cc2 <nbgl_useCaseGetNbBarsInPage+0x14>
c0de8cd8:	4628      	mov	r0, r5
c0de8cda:	08e1      	lsrs	r1, r4, #3
c0de8cdc:	2200      	movs	r2, #0
c0de8cde:	2932      	cmp	r1, #50	@ 0x32
c0de8ce0:	bf88      	it	hi
c0de8ce2:	2201      	movhi	r2, #1
c0de8ce4:	ea22 0103 	bic.w	r1, r2, r3
c0de8ce8:	1a40      	subs	r0, r0, r1
c0de8cea:	b2c0      	uxtb	r0, r0
c0de8cec:	bd70      	pop	{r4, r5, r6, pc}

c0de8cee <nbgl_useCaseGetNbChoicesInPage>:
c0de8cee:	b570      	push	{r4, r5, r6, lr}
c0de8cf0:	f44f 72fc 	mov.w	r2, #504	@ 0x1f8
c0de8cf4:	2b00      	cmp	r3, #0
c0de8cf6:	bf18      	it	ne
c0de8cf8:	f44f 72cc 	movne.w	r2, #408	@ 0x198
c0de8cfc:	2400      	movs	r4, #0
c0de8cfe:	2500      	movs	r5, #0
c0de8d00:	2100      	movs	r1, #0
c0de8d02:	b2ce      	uxtb	r6, r1
c0de8d04:	4286      	cmp	r6, r0
c0de8d06:	d207      	bcs.n	c0de8d18 <nbgl_useCaseGetNbChoicesInPage+0x2a>
c0de8d08:	b2a4      	uxth	r4, r4
c0de8d0a:	345c      	adds	r4, #92	@ 0x5c
c0de8d0c:	b2a6      	uxth	r6, r4
c0de8d0e:	4296      	cmp	r6, r2
c0de8d10:	d204      	bcs.n	c0de8d1c <nbgl_useCaseGetNbChoicesInPage+0x2e>
c0de8d12:	3101      	adds	r1, #1
c0de8d14:	4635      	mov	r5, r6
c0de8d16:	e7f4      	b.n	c0de8d02 <nbgl_useCaseGetNbChoicesInPage+0x14>
c0de8d18:	4601      	mov	r1, r0
c0de8d1a:	e004      	b.n	c0de8d26 <nbgl_useCaseGetNbChoicesInPage+0x38>
c0de8d1c:	b91b      	cbnz	r3, c0de8d26 <nbgl_useCaseGetNbChoicesInPage+0x38>
c0de8d1e:	08e8      	lsrs	r0, r5, #3
c0de8d20:	2832      	cmp	r0, #50	@ 0x32
c0de8d22:	bf88      	it	hi
c0de8d24:	3901      	subhi	r1, #1
c0de8d26:	b2c8      	uxtb	r0, r1
c0de8d28:	bd70      	pop	{r4, r5, r6, pc}
	...

c0de8d2c <useCaseHomeExt>:
c0de8d2c:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de8d30:	b08f      	sub	sp, #60	@ 0x3c
c0de8d32:	4604      	mov	r4, r0
c0de8d34:	a802      	add	r0, sp, #8
c0de8d36:	460f      	mov	r7, r1
c0de8d38:	2130      	movs	r1, #48	@ 0x30
c0de8d3a:	461e      	mov	r6, r3
c0de8d3c:	4615      	mov	r5, r2
c0de8d3e:	3004      	adds	r0, #4
c0de8d40:	f003 fb74 	bl	c0dec42c <__aeabi_memclr>
c0de8d44:	2009      	movs	r0, #9
c0de8d46:	f88d 0039 	strb.w	r0, [sp, #57]	@ 0x39
c0de8d4a:	2006      	movs	r0, #6
c0de8d4c:	f88d 001e 	strb.w	r0, [sp, #30]
c0de8d50:	2004      	movs	r0, #4
c0de8d52:	f88d 001d 	strb.w	r0, [sp, #29]
c0de8d56:	2003      	movs	r0, #3
c0de8d58:	2e00      	cmp	r6, #0
c0de8d5a:	bf18      	it	ne
c0de8d5c:	2001      	movne	r0, #1
c0de8d5e:	f88d 001c 	strb.w	r0, [sp, #28]
c0de8d62:	9705      	str	r7, [sp, #20]
c0de8d64:	9402      	str	r4, [sp, #8]
c0de8d66:	f000 f87b 	bl	c0de8e60 <reset_callbacks_and_context>
c0de8d6a:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de8d6c:	e9d0 1200 	ldrd	r1, r2, [r0]
c0de8d70:	b951      	cbnz	r1, c0de8d88 <useCaseHomeExt+0x5c>
c0de8d72:	b94a      	cbnz	r2, c0de8d88 <useCaseHomeExt+0x5c>
c0de8d74:	4831      	ldr	r0, [pc, #196]	@ (c0de8e3c <useCaseHomeExt+0x110>)
c0de8d76:	2100      	movs	r1, #0
c0de8d78:	e9cd 110c 	strd	r1, r1, [sp, #48]	@ 0x30
c0de8d7c:	4448      	add	r0, r9
c0de8d7e:	6241      	str	r1, [r0, #36]	@ 0x24
c0de8d80:	2002      	movs	r0, #2
c0de8d82:	f88d 001f 	strb.w	r0, [sp, #31]
c0de8d86:	e00e      	b.n	c0de8da6 <useCaseHomeExt+0x7a>
c0de8d88:	4b2c      	ldr	r3, [pc, #176]	@ (c0de8e3c <useCaseHomeExt+0x110>)
c0de8d8a:	6886      	ldr	r6, [r0, #8]
c0de8d8c:	e9cd 120c 	strd	r1, r2, [sp, #48]	@ 0x30
c0de8d90:	444b      	add	r3, r9
c0de8d92:	625e      	str	r6, [r3, #36]	@ 0x24
c0de8d94:	2308      	movs	r3, #8
c0de8d96:	7b00      	ldrb	r0, [r0, #12]
c0de8d98:	f88d 301f 	strb.w	r3, [sp, #31]
c0de8d9c:	2800      	cmp	r0, #0
c0de8d9e:	bf18      	it	ne
c0de8da0:	2001      	movne	r0, #1
c0de8da2:	f88d 0038 	strb.w	r0, [sp, #56]	@ 0x38
c0de8da6:	e9dd a817 	ldrd	sl, r8, [sp, #92]	@ 0x5c
c0de8daa:	bb8d      	cbnz	r5, c0de8e10 <useCaseHomeExt+0xe4>
c0de8dac:	4620      	mov	r0, r4
c0de8dae:	f003 fba9 	bl	c0dec504 <strlen>
c0de8db2:	4e24      	ldr	r6, [pc, #144]	@ (c0de8e44 <useCaseHomeExt+0x118>)
c0de8db4:	2814      	cmp	r0, #20
c0de8db6:	447e      	add	r6, pc
c0de8db8:	d307      	bcc.n	c0de8dca <useCaseHomeExt+0x9e>
c0de8dba:	4821      	ldr	r0, [pc, #132]	@ (c0de8e40 <useCaseHomeExt+0x114>)
c0de8dbc:	4922      	ldr	r1, [pc, #136]	@ (c0de8e48 <useCaseHomeExt+0x11c>)
c0de8dbe:	2236      	movs	r2, #54	@ 0x36
c0de8dc0:	4448      	add	r0, r9
c0de8dc2:	4479      	add	r1, pc
c0de8dc4:	f003 fb28 	bl	c0dec418 <__aeabi_memcpy>
c0de8dc8:	e00a      	b.n	c0de8de0 <useCaseHomeExt+0xb4>
c0de8dca:	e9cd 4600 	strd	r4, r6, [sp]
c0de8dce:	481c      	ldr	r0, [pc, #112]	@ (c0de8e40 <useCaseHomeExt+0x114>)
c0de8dd0:	214a      	movs	r1, #74	@ 0x4a
c0de8dd2:	4a1e      	ldr	r2, [pc, #120]	@ (c0de8e4c <useCaseHomeExt+0x120>)
c0de8dd4:	4b1e      	ldr	r3, [pc, #120]	@ (c0de8e50 <useCaseHomeExt+0x124>)
c0de8dd6:	4448      	add	r0, r9
c0de8dd8:	447a      	add	r2, pc
c0de8dda:	447b      	add	r3, pc
c0de8ddc:	f002 ff72 	bl	c0debcc4 <snprintf>
c0de8de0:	4f17      	ldr	r7, [pc, #92]	@ (c0de8e40 <useCaseHomeExt+0x114>)
c0de8de2:	200b      	movs	r0, #11
c0de8de4:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de8de8:	2300      	movs	r3, #0
c0de8dea:	eb09 0507 	add.w	r5, r9, r7
c0de8dee:	4629      	mov	r1, r5
c0de8df0:	f002 ff37 	bl	c0debc62 <nbgl_getTextNbLinesInWidth>
c0de8df4:	2804      	cmp	r0, #4
c0de8df6:	d30b      	bcc.n	c0de8e10 <useCaseHomeExt+0xe4>
c0de8df8:	e9cd 4600 	strd	r4, r6, [sp]
c0de8dfc:	eb09 0507 	add.w	r5, r9, r7
c0de8e00:	214a      	movs	r1, #74	@ 0x4a
c0de8e02:	4a14      	ldr	r2, [pc, #80]	@ (c0de8e54 <useCaseHomeExt+0x128>)
c0de8e04:	4b14      	ldr	r3, [pc, #80]	@ (c0de8e58 <useCaseHomeExt+0x12c>)
c0de8e06:	4628      	mov	r0, r5
c0de8e08:	447a      	add	r2, pc
c0de8e0a:	447b      	add	r3, pc
c0de8e0c:	f002 ff5a 	bl	c0debcc4 <snprintf>
c0de8e10:	480a      	ldr	r0, [pc, #40]	@ (c0de8e3c <useCaseHomeExt+0x110>)
c0de8e12:	9503      	str	r5, [sp, #12]
c0de8e14:	2100      	movs	r1, #0
c0de8e16:	eb09 0400 	add.w	r4, r9, r0
c0de8e1a:	f8c4 a028 	str.w	sl, [r4, #40]	@ 0x28
c0de8e1e:	f8c4 8004 	str.w	r8, [r4, #4]
c0de8e22:	480e      	ldr	r0, [pc, #56]	@ (c0de8e5c <useCaseHomeExt+0x130>)
c0de8e24:	aa02      	add	r2, sp, #8
c0de8e26:	4478      	add	r0, pc
c0de8e28:	f7ff faac 	bl	c0de8384 <nbgl_pageDrawInfo>
c0de8e2c:	6160      	str	r0, [r4, #20]
c0de8e2e:	2002      	movs	r0, #2
c0de8e30:	f002 fec2 	bl	c0debbb8 <nbgl_refreshSpecial>
c0de8e34:	b00f      	add	sp, #60	@ 0x3c
c0de8e36:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de8e3a:	bf00      	nop
c0de8e3c:	00001be8 	.word	0x00001be8
c0de8e40:	00001a68 	.word	0x00001a68
c0de8e44:	000051c1 	.word	0x000051c1
c0de8e48:	000069f6 	.word	0x000069f6
c0de8e4c:	00004cd4 	.word	0x00004cd4
c0de8e50:	0000542c 	.word	0x0000542c
c0de8e54:	00004d3e 	.word	0x00004d3e
c0de8e58:	000053fc 	.word	0x000053fc
c0de8e5c:	000008fb 	.word	0x000008fb

c0de8e60 <reset_callbacks_and_context>:
c0de8e60:	b580      	push	{r7, lr}
c0de8e62:	4808      	ldr	r0, [pc, #32]	@ (c0de8e84 <reset_callbacks_and_context+0x24>)
c0de8e64:	2100      	movs	r1, #0
c0de8e66:	4448      	add	r0, r9
c0de8e68:	e9c0 1109 	strd	r1, r1, [r0, #36]	@ 0x24
c0de8e6c:	62c1      	str	r1, [r0, #44]	@ 0x2c
c0de8e6e:	e9c0 1101 	strd	r1, r1, [r0, #4]
c0de8e72:	60c1      	str	r1, [r0, #12]
c0de8e74:	6181      	str	r1, [r0, #24]
c0de8e76:	4804      	ldr	r0, [pc, #16]	@ (c0de8e88 <reset_callbacks_and_context+0x28>)
c0de8e78:	216c      	movs	r1, #108	@ 0x6c
c0de8e7a:	4448      	add	r0, r9
c0de8e7c:	f003 fad6 	bl	c0dec42c <__aeabi_memclr>
c0de8e80:	bd80      	pop	{r7, pc}
c0de8e82:	bf00      	nop
c0de8e84:	00001be8 	.word	0x00001be8
c0de8e88:	0000191c 	.word	0x0000191c

c0de8e8c <prepareNavInfo>:
c0de8e8c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de8e90:	4f1b      	ldr	r7, [pc, #108]	@ (c0de8f00 <prepareNavInfo+0x74>)
c0de8e92:	460c      	mov	r4, r1
c0de8e94:	4606      	mov	r6, r0
c0de8e96:	211c      	movs	r1, #28
c0de8e98:	4690      	mov	r8, r2
c0de8e9a:	eb09 0507 	add.w	r5, r9, r7
c0de8e9e:	f105 0060 	add.w	r0, r5, #96	@ 0x60
c0de8ea2:	f003 fac3 	bl	c0dec42c <__aeabi_memclr>
c0de8ea6:	2009      	movs	r0, #9
c0de8ea8:	f885 4061 	strb.w	r4, [r5, #97]	@ 0x61
c0de8eac:	f885 0065 	strb.w	r0, [r5, #101]	@ 0x65
c0de8eb0:	2001      	movs	r0, #1
c0de8eb2:	f885 0063 	strb.w	r0, [r5, #99]	@ 0x63
c0de8eb6:	b1ce      	cbz	r6, c0de8eec <prepareNavInfo+0x60>
c0de8eb8:	eb09 0007 	add.w	r0, r9, r7
c0de8ebc:	210c      	movs	r1, #12
c0de8ebe:	f880 1062 	strb.w	r1, [r0, #98]	@ 0x62
c0de8ec2:	2103      	movs	r1, #3
c0de8ec4:	f8c0 8074 	str.w	r8, [r0, #116]	@ 0x74
c0de8ec8:	f880 1073 	strb.w	r1, [r0, #115]	@ 0x73
c0de8ecc:	f819 1007 	ldrb.w	r1, [r9, r7]
c0de8ed0:	3903      	subs	r1, #3
c0de8ed2:	bf18      	it	ne
c0de8ed4:	2101      	movne	r1, #1
c0de8ed6:	2200      	movs	r2, #0
c0de8ed8:	f880 1072 	strb.w	r1, [r0, #114]	@ 0x72
c0de8edc:	2c01      	cmp	r4, #1
c0de8ede:	bf88      	it	hi
c0de8ee0:	2201      	movhi	r2, #1
c0de8ee2:	4311      	orrs	r1, r2
c0de8ee4:	f880 1071 	strb.w	r1, [r0, #113]	@ 0x71
c0de8ee8:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de8eec:	eb09 0107 	add.w	r1, r9, r7
c0de8ef0:	f881 0071 	strb.w	r0, [r1, #113]	@ 0x71
c0de8ef4:	2003      	movs	r0, #3
c0de8ef6:	f881 0073 	strb.w	r0, [r1, #115]	@ 0x73
c0de8efa:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de8efe:	bf00      	nop
c0de8f00:	00001be8 	.word	0x00001be8

c0de8f04 <displaySettingsPage>:
c0de8f04:	b570      	push	{r4, r5, r6, lr}
c0de8f06:	b090      	sub	sp, #64	@ 0x40
c0de8f08:	460c      	mov	r4, r1
c0de8f0a:	4605      	mov	r5, r0
c0de8f0c:	4668      	mov	r0, sp
c0de8f0e:	2140      	movs	r1, #64	@ 0x40
c0de8f10:	f003 fa8c 	bl	c0dec42c <__aeabi_memclr>
c0de8f14:	4e12      	ldr	r6, [pc, #72]	@ (c0de8f60 <displaySettingsPage+0x5c>)
c0de8f16:	eb09 0006 	add.w	r0, r9, r6
c0de8f1a:	6882      	ldr	r2, [r0, #8]
c0de8f1c:	b1f2      	cbz	r2, c0de8f5c <displaySettingsPage+0x58>
c0de8f1e:	4669      	mov	r1, sp
c0de8f20:	4628      	mov	r0, r5
c0de8f22:	4790      	blx	r2
c0de8f24:	b1d0      	cbz	r0, c0de8f5c <displaySettingsPage+0x58>
c0de8f26:	444e      	add	r6, r9
c0de8f28:	2009      	movs	r0, #9
c0de8f2a:	466a      	mov	r2, sp
c0de8f2c:	f88d 0006 	strb.w	r0, [sp, #6]
c0de8f30:	f240 2001 	movw	r0, #513	@ 0x201
c0de8f34:	f806 5f60 	strb.w	r5, [r6, #96]!
c0de8f38:	f8ad 0004 	strh.w	r0, [sp, #4]
c0de8f3c:	f856 0c50 	ldr.w	r0, [r6, #-80]
c0de8f40:	4631      	mov	r1, r6
c0de8f42:	9000      	str	r0, [sp, #0]
c0de8f44:	4807      	ldr	r0, [pc, #28]	@ (c0de8f64 <displaySettingsPage+0x60>)
c0de8f46:	4478      	add	r0, pc
c0de8f48:	f7ff fd6c 	bl	c0de8a24 <nbgl_pageDrawGenericContent>
c0de8f4c:	f846 0c4c 	str.w	r0, [r6, #-76]
c0de8f50:	2001      	movs	r0, #1
c0de8f52:	2c00      	cmp	r4, #0
c0de8f54:	bf18      	it	ne
c0de8f56:	2002      	movne	r0, #2
c0de8f58:	f002 fe2e 	bl	c0debbb8 <nbgl_refreshSpecial>
c0de8f5c:	b010      	add	sp, #64	@ 0x40
c0de8f5e:	bd70      	pop	{r4, r5, r6, pc}
c0de8f60:	00001be8 	.word	0x00001be8
c0de8f64:	000007db 	.word	0x000007db

c0de8f68 <nbgl_useCaseGenericSettings>:
c0de8f68:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de8f6c:	461d      	mov	r5, r3
c0de8f6e:	4616      	mov	r6, r2
c0de8f70:	4688      	mov	r8, r1
c0de8f72:	4607      	mov	r7, r0
c0de8f74:	f7ff ff74 	bl	c0de8e60 <reset_callbacks_and_context>
c0de8f78:	4c25      	ldr	r4, [pc, #148]	@ (c0de9010 <nbgl_useCaseGenericSettings+0xa8>)
c0de8f7a:	2002      	movs	r0, #2
c0de8f7c:	f809 0004 	strb.w	r0, [r9, r4]
c0de8f80:	eb09 0004 	add.w	r0, r9, r4
c0de8f84:	6107      	str	r7, [r0, #16]
c0de8f86:	9906      	ldr	r1, [sp, #24]
c0de8f88:	6041      	str	r1, [r0, #4]
c0de8f8a:	b12e      	cbz	r6, c0de8f98 <nbgl_useCaseGenericSettings+0x30>
c0de8f8c:	4821      	ldr	r0, [pc, #132]	@ (c0de9014 <nbgl_useCaseGenericSettings+0xac>)
c0de8f8e:	e896 000e 	ldmia.w	r6, {r1, r2, r3}
c0de8f92:	4448      	add	r0, r9
c0de8f94:	3004      	adds	r0, #4
c0de8f96:	c00e      	stmia	r0!, {r1, r2, r3}
c0de8f98:	b1a5      	cbz	r5, c0de8fc4 <nbgl_useCaseGenericSettings+0x5c>
c0de8f9a:	481e      	ldr	r0, [pc, #120]	@ (c0de9014 <nbgl_useCaseGenericSettings+0xac>)
c0de8f9c:	2101      	movs	r1, #1
c0de8f9e:	4448      	add	r0, r9
c0de8fa0:	7501      	strb	r1, [r0, #20]
c0de8fa2:	481d      	ldr	r0, [pc, #116]	@ (c0de9018 <nbgl_useCaseGenericSettings+0xb0>)
c0de8fa4:	2138      	movs	r1, #56	@ 0x38
c0de8fa6:	eb09 0600 	add.w	r6, r9, r0
c0de8faa:	f106 0038 	add.w	r0, r6, #56	@ 0x38
c0de8fae:	f003 fa3d 	bl	c0dec42c <__aeabi_memclr>
c0de8fb2:	2008      	movs	r0, #8
c0de8fb4:	4629      	mov	r1, r5
c0de8fb6:	2230      	movs	r2, #48	@ 0x30
c0de8fb8:	f886 0038 	strb.w	r0, [r6, #56]	@ 0x38
c0de8fbc:	f106 003c 	add.w	r0, r6, #60	@ 0x3c
c0de8fc0:	f003 fa2a 	bl	c0dec418 <__aeabi_memcpy>
c0de8fc4:	f002 f956 	bl	c0deb274 <OUTLINED_FUNCTION_5>
c0de8fc8:	4606      	mov	r6, r0
c0de8fca:	b145      	cbz	r5, c0de8fde <nbgl_useCaseGenericSettings+0x76>
c0de8fcc:	4812      	ldr	r0, [pc, #72]	@ (c0de9018 <nbgl_useCaseGenericSettings+0xb0>)
c0de8fce:	4631      	mov	r1, r6
c0de8fd0:	2201      	movs	r2, #1
c0de8fd2:	2300      	movs	r3, #0
c0de8fd4:	4448      	add	r0, r9
c0de8fd6:	3038      	adds	r0, #56	@ 0x38
c0de8fd8:	f000 f848 	bl	c0de906c <getNbPagesForContent>
c0de8fdc:	4406      	add	r6, r0
c0de8fde:	444c      	add	r4, r9
c0de8fe0:	211c      	movs	r1, #28
c0de8fe2:	f104 0060 	add.w	r0, r4, #96	@ 0x60
c0de8fe6:	f003 fa21 	bl	c0dec42c <__aeabi_memclr>
c0de8fea:	2009      	movs	r0, #9
c0de8fec:	f884 6061 	strb.w	r6, [r4, #97]	@ 0x61
c0de8ff0:	2101      	movs	r1, #1
c0de8ff2:	f884 0065 	strb.w	r0, [r4, #101]	@ 0x65
c0de8ff6:	2003      	movs	r0, #3
c0de8ff8:	f884 0073 	strb.w	r0, [r4, #115]	@ 0x73
c0de8ffc:	2001      	movs	r0, #1
c0de8ffe:	f884 0063 	strb.w	r0, [r4, #99]	@ 0x63
c0de9002:	f884 0071 	strb.w	r0, [r4, #113]	@ 0x71
c0de9006:	4640      	mov	r0, r8
c0de9008:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de900c:	f000 b8c0 	b.w	c0de9190 <displayGenericContextPage>
c0de9010:	00001be8 	.word	0x00001be8
c0de9014:	0000191c 	.word	0x0000191c
c0de9018:	00001988 	.word	0x00001988

c0de901c <getNbPagesForGenericContents>:
c0de901c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de9020:	b08e      	sub	sp, #56	@ 0x38
c0de9022:	4f11      	ldr	r7, [pc, #68]	@ (c0de9068 <getNbPagesForGenericContents+0x4c>)
c0de9024:	4604      	mov	r4, r0
c0de9026:	2600      	movs	r6, #0
c0de9028:	46e8      	mov	r8, sp
c0de902a:	2500      	movs	r5, #0
c0de902c:	eb09 0007 	add.w	r0, r9, r7
c0de9030:	7b00      	ldrb	r0, [r0, #12]
c0de9032:	4285      	cmp	r5, r0
c0de9034:	d214      	bcs.n	c0de9060 <getNbPagesForGenericContents+0x44>
c0de9036:	b268      	sxtb	r0, r5
c0de9038:	4641      	mov	r1, r8
c0de903a:	f001 fabb 	bl	c0dea5b4 <getContentAtIdx>
c0de903e:	b170      	cbz	r0, c0de905e <getNbPagesForGenericContents+0x42>
c0de9040:	eb09 0107 	add.w	r1, r9, r7
c0de9044:	4623      	mov	r3, r4
c0de9046:	7b09      	ldrb	r1, [r1, #12]
c0de9048:	1a69      	subs	r1, r5, r1
c0de904a:	3101      	adds	r1, #1
c0de904c:	fab1 f181 	clz	r1, r1
c0de9050:	094a      	lsrs	r2, r1, #5
c0de9052:	b2f1      	uxtb	r1, r6
c0de9054:	f000 f80a 	bl	c0de906c <getNbPagesForContent>
c0de9058:	4406      	add	r6, r0
c0de905a:	3501      	adds	r5, #1
c0de905c:	e7e6      	b.n	c0de902c <getNbPagesForGenericContents+0x10>
c0de905e:	2600      	movs	r6, #0
c0de9060:	b2f0      	uxtb	r0, r6
c0de9062:	b00e      	add	sp, #56	@ 0x38
c0de9064:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de9068:	0000191c 	.word	0x0000191c

c0de906c <getNbPagesForContent>:
c0de906c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9070:	b08c      	sub	sp, #48	@ 0x30
c0de9072:	4606      	mov	r6, r0
c0de9074:	fab1 f081 	clz	r0, r1
c0de9078:	9306      	str	r3, [sp, #24]
c0de907a:	4614      	mov	r4, r2
c0de907c:	9109      	str	r1, [sp, #36]	@ 0x24
c0de907e:	0940      	lsrs	r0, r0, #5
c0de9080:	4010      	ands	r0, r2
c0de9082:	900a      	str	r0, [sp, #40]	@ 0x28
c0de9084:	4630      	mov	r0, r6
c0de9086:	f001 fabf 	bl	c0dea608 <getContentNbElement>
c0de908a:	4605      	mov	r5, r0
c0de908c:	f084 0001 	eor.w	r0, r4, #1
c0de9090:	f04f 0800 	mov.w	r8, #0
c0de9094:	f04f 0a00 	mov.w	sl, #0
c0de9098:	f04f 0b00 	mov.w	fp, #0
c0de909c:	270f      	movs	r7, #15
c0de909e:	9405      	str	r4, [sp, #20]
c0de90a0:	9608      	str	r6, [sp, #32]
c0de90a2:	9004      	str	r0, [sp, #16]
c0de90a4:	1d30      	adds	r0, r6, #4
c0de90a6:	9007      	str	r0, [sp, #28]
c0de90a8:	0628      	lsls	r0, r5, #24
c0de90aa:	d068      	beq.n	c0de917e <getNbPagesForContent+0x112>
c0de90ac:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de90ae:	f88d 802f 	strb.w	r8, [sp, #47]	@ 0x2f
c0de90b2:	b128      	cbz	r0, c0de90c0 <getNbPagesForContent+0x54>
c0de90b4:	fa5f f38b 	uxtb.w	r3, fp
c0de90b8:	2b00      	cmp	r3, #0
c0de90ba:	bf18      	it	ne
c0de90bc:	2301      	movne	r3, #1
c0de90be:	e000      	b.n	c0de90c2 <getNbPagesForContent+0x56>
c0de90c0:	2301      	movs	r3, #1
c0de90c2:	9808      	ldr	r0, [sp, #32]
c0de90c4:	7800      	ldrb	r0, [r0, #0]
c0de90c6:	280a      	cmp	r0, #10
c0de90c8:	d00e      	beq.n	c0de90e8 <getNbPagesForContent+0x7c>
c0de90ca:	2806      	cmp	r0, #6
c0de90cc:	d011      	beq.n	c0de90f2 <getNbPagesForContent+0x86>
c0de90ce:	2807      	cmp	r0, #7
c0de90d0:	d01e      	beq.n	c0de9110 <getNbPagesForContent+0xa4>
c0de90d2:	2808      	cmp	r0, #8
c0de90d4:	d023      	beq.n	c0de911e <getNbPagesForContent+0xb2>
c0de90d6:	2809      	cmp	r0, #9
c0de90d8:	d028      	beq.n	c0de912c <getNbPagesForContent+0xc0>
c0de90da:	2804      	cmp	r0, #4
c0de90dc:	d12b      	bne.n	c0de9136 <getNbPagesForContent+0xca>
c0de90de:	2000      	movs	r0, #0
c0de90e0:	f04f 0800 	mov.w	r8, #0
c0de90e4:	9000      	str	r0, [sp, #0]
c0de90e6:	e007      	b.n	c0de90f8 <getNbPagesForContent+0x8c>
c0de90e8:	b2e8      	uxtb	r0, r5
c0de90ea:	2200      	movs	r2, #0
c0de90ec:	f7ff fddf 	bl	c0de8cae <nbgl_useCaseGetNbBarsInPage>
c0de90f0:	e028      	b.n	c0de9144 <getNbPagesForContent+0xd8>
c0de90f2:	9805      	ldr	r0, [sp, #20]
c0de90f4:	9000      	str	r0, [sp, #0]
c0de90f6:	9804      	ldr	r0, [sp, #16]
c0de90f8:	9001      	str	r0, [sp, #4]
c0de90fa:	f10d 002f 	add.w	r0, sp, #47	@ 0x2f
c0de90fe:	e9dd 3106 	ldrd	r3, r1, [sp, #24]
c0de9102:	fa5f f28b 	uxtb.w	r2, fp
c0de9106:	9002      	str	r0, [sp, #8]
c0de9108:	b2e8      	uxtb	r0, r5
c0de910a:	f7ff fcb6 	bl	c0de8a7a <getNbTagValuesInPage>
c0de910e:	e019      	b.n	c0de9144 <getNbPagesForContent+0xd8>
c0de9110:	9907      	ldr	r1, [sp, #28]
c0de9112:	b2e8      	uxtb	r0, r5
c0de9114:	fa5f f28b 	uxtb.w	r2, fp
c0de9118:	f7ff fd93 	bl	c0de8c42 <nbgl_useCaseGetNbSwitchesInPage>
c0de911c:	e012      	b.n	c0de9144 <getNbPagesForContent+0xd8>
c0de911e:	9907      	ldr	r1, [sp, #28]
c0de9120:	b2e8      	uxtb	r0, r5
c0de9122:	fa5f f28b 	uxtb.w	r2, fp
c0de9126:	f7ff fd43 	bl	c0de8bb0 <nbgl_useCaseGetNbInfosInPage>
c0de912a:	e00b      	b.n	c0de9144 <getNbPagesForContent+0xd8>
c0de912c:	b2e8      	uxtb	r0, r5
c0de912e:	2200      	movs	r2, #0
c0de9130:	f7ff fddd 	bl	c0de8cee <nbgl_useCaseGetNbChoicesInPage>
c0de9134:	e006      	b.n	c0de9144 <getNbPagesForContent+0xd8>
c0de9136:	4915      	ldr	r1, [pc, #84]	@ (c0de918c <getNbPagesForContent+0x120>)
c0de9138:	4479      	add	r1, pc
c0de913a:	5c08      	ldrb	r0, [r1, r0]
c0de913c:	b2e9      	uxtb	r1, r5
c0de913e:	4288      	cmp	r0, r1
c0de9140:	bf28      	it	cs
c0de9142:	4628      	movcs	r0, r5
c0de9144:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0de9146:	f89d 402f 	ldrb.w	r4, [sp, #47]	@ 0x2f
c0de914a:	f000 0307 	and.w	r3, r0, #7
c0de914e:	2204      	movs	r2, #4
c0de9150:	1a2d      	subs	r5, r5, r0
c0de9152:	4483      	add	fp, r0
c0de9154:	4451      	add	r1, sl
c0de9156:	ea43 03c4 	orr.w	r3, r3, r4, lsl #3
c0de915a:	4c0b      	ldr	r4, [pc, #44]	@ (c0de9188 <getNbPagesForContent+0x11c>)
c0de915c:	f10a 0a01 	add.w	sl, sl, #1
c0de9160:	b2c9      	uxtb	r1, r1
c0de9162:	b2db      	uxtb	r3, r3
c0de9164:	ea02 0281 	and.w	r2, r2, r1, lsl #2
c0de9168:	444c      	add	r4, r9
c0de916a:	0849      	lsrs	r1, r1, #1
c0de916c:	5c66      	ldrb	r6, [r4, r1]
c0de916e:	4093      	lsls	r3, r2
c0de9170:	fa07 f202 	lsl.w	r2, r7, r2
c0de9174:	ea26 0202 	bic.w	r2, r6, r2
c0de9178:	431a      	orrs	r2, r3
c0de917a:	5462      	strb	r2, [r4, r1]
c0de917c:	e794      	b.n	c0de90a8 <getNbPagesForContent+0x3c>
c0de917e:	fa5f f08a 	uxtb.w	r0, sl
c0de9182:	b00c      	add	sp, #48	@ 0x30
c0de9184:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de9188:	00001ae8 	.word	0x00001ae8
c0de918c:	000066b6 	.word	0x000066b6

c0de9190 <displayGenericContextPage>:
c0de9190:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9194:	b0a0      	sub	sp, #128	@ 0x80
c0de9196:	f8df 23e0 	ldr.w	r2, [pc, #992]	@ c0de9578 <displayGenericContextPage+0x3e8>
c0de919a:	4683      	mov	fp, r0
c0de919c:	f819 0002 	ldrb.w	r0, [r9, r2]
c0de91a0:	2803      	cmp	r0, #3
c0de91a2:	d10f      	bne.n	c0de91c4 <displayGenericContextPage+0x34>
c0de91a4:	f8df 03d4 	ldr.w	r0, [pc, #980]	@ c0de957c <displayGenericContextPage+0x3ec>
c0de91a8:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de91ac:	4448      	add	r0, r9
c0de91ae:	d05f      	beq.n	c0de9270 <displayGenericContextPage+0xe0>
c0de91b0:	f890 0030 	ldrb.w	r0, [r0, #48]	@ 0x30
c0de91b4:	4558      	cmp	r0, fp
c0de91b6:	d80e      	bhi.n	c0de91d6 <displayGenericContextPage+0x46>
c0de91b8:	2001      	movs	r0, #1
c0de91ba:	b020      	add	sp, #128	@ 0x80
c0de91bc:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de91c0:	f001 b854 	b.w	c0dea26c <bundleNavReviewStreamingChoice>
c0de91c4:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de91c8:	d105      	bne.n	c0de91d6 <displayGenericContextPage+0x46>
c0de91ca:	eb09 0002 	add.w	r0, r9, r2
c0de91ce:	f890 0061 	ldrb.w	r0, [r0, #97]	@ 0x61
c0de91d2:	f1a0 0b01 	sub.w	fp, r0, #1
c0de91d6:	eb09 0002 	add.w	r0, r9, r2
c0de91da:	fa5f f78b 	uxtb.w	r7, fp
c0de91de:	9100      	str	r1, [sp, #0]
c0de91e0:	f890 8060 	ldrb.w	r8, [r0, #96]	@ 0x60
c0de91e4:	4547      	cmp	r7, r8
c0de91e6:	d12e      	bne.n	c0de9246 <displayGenericContextPage+0xb6>
c0de91e8:	a912      	add	r1, sp, #72	@ 0x48
c0de91ea:	f10d 0247 	add.w	r2, sp, #71	@ 0x47
c0de91ee:	f10d 0346 	add.w	r3, sp, #70	@ 0x46
c0de91f2:	4638      	mov	r0, r7
c0de91f4:	f001 fa20 	bl	c0dea638 <genericContextComputeNextPageParams>
c0de91f8:	4682      	mov	sl, r0
c0de91fa:	f1ba 0f00 	cmp.w	sl, #0
c0de91fe:	f000 8147 	beq.w	c0de9490 <displayGenericContextPage+0x300>
c0de9202:	f8df 8374 	ldr.w	r8, [pc, #884]	@ c0de9578 <displayGenericContextPage+0x3e8>
c0de9206:	f819 0008 	ldrb.w	r0, [r9, r8]
c0de920a:	2803      	cmp	r0, #3
c0de920c:	d041      	beq.n	c0de9292 <displayGenericContextPage+0x102>
c0de920e:	48db      	ldr	r0, [pc, #876]	@ (c0de957c <displayGenericContextPage+0x3ec>)
c0de9210:	4448      	add	r0, r9
c0de9212:	f890 0020 	ldrb.w	r0, [r0, #32]
c0de9216:	06c0      	lsls	r0, r0, #27
c0de9218:	d53b      	bpl.n	c0de9292 <displayGenericContextPage+0x102>
c0de921a:	ea5f 600b 	movs.w	r0, fp, lsl #24
c0de921e:	d034      	beq.n	c0de928a <displayGenericContextPage+0xfa>
c0de9220:	eb09 0008 	add.w	r0, r9, r8
c0de9224:	f890 0061 	ldrb.w	r0, [r0, #97]	@ 0x61
c0de9228:	3801      	subs	r0, #1
c0de922a:	42b8      	cmp	r0, r7
c0de922c:	dd2d      	ble.n	c0de928a <displayGenericContextPage+0xfa>
c0de922e:	eb09 0008 	add.w	r0, r9, r8
c0de9232:	2105      	movs	r1, #5
c0de9234:	f880 106c 	strb.w	r1, [r0, #108]	@ 0x6c
c0de9238:	49d2      	ldr	r1, [pc, #840]	@ (c0de9584 <displayGenericContextPage+0x3f4>)
c0de923a:	4479      	add	r1, pc
c0de923c:	6681      	str	r1, [r0, #104]	@ 0x68
c0de923e:	2100      	movs	r1, #0
c0de9240:	f880 1064 	strb.w	r1, [r0, #100]	@ 0x64
c0de9244:	e025      	b.n	c0de9292 <displayGenericContextPage+0x102>
c0de9246:	d91b      	bls.n	c0de9280 <displayGenericContextPage+0xf0>
c0de9248:	f04f 0a00 	mov.w	sl, #0
c0de924c:	ac12      	add	r4, sp, #72	@ 0x48
c0de924e:	f10d 0547 	add.w	r5, sp, #71	@ 0x47
c0de9252:	f10d 0646 	add.w	r6, sp, #70	@ 0x46
c0de9256:	4547      	cmp	r7, r8
c0de9258:	d0cf      	beq.n	c0de91fa <displayGenericContextPage+0x6a>
c0de925a:	f108 0801 	add.w	r8, r8, #1
c0de925e:	4621      	mov	r1, r4
c0de9260:	462a      	mov	r2, r5
c0de9262:	4633      	mov	r3, r6
c0de9264:	fa5f f088 	uxtb.w	r0, r8
c0de9268:	f001 f9e6 	bl	c0dea638 <genericContextComputeNextPageParams>
c0de926c:	4682      	mov	sl, r0
c0de926e:	e7f2      	b.n	c0de9256 <displayGenericContextPage+0xc6>
c0de9270:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0de9272:	2800      	cmp	r0, #0
c0de9274:	f000 810c 	beq.w	c0de9490 <displayGenericContextPage+0x300>
c0de9278:	b020      	add	sp, #128	@ 0x80
c0de927a:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de927e:	4700      	bx	r0
c0de9280:	eba7 0008 	sub.w	r0, r7, r8
c0de9284:	2801      	cmp	r0, #1
c0de9286:	ddaf      	ble.n	c0de91e8 <displayGenericContextPage+0x58>
c0de9288:	e102      	b.n	c0de9490 <displayGenericContextPage+0x300>
c0de928a:	eb09 0008 	add.w	r0, r9, r8
c0de928e:	2100      	movs	r1, #0
c0de9290:	6681      	str	r1, [r0, #104]	@ 0x68
c0de9292:	af01      	add	r7, sp, #4
c0de9294:	213c      	movs	r1, #60	@ 0x3c
c0de9296:	1d38      	adds	r0, r7, #4
c0de9298:	f003 f8c8 	bl	c0dec42c <__aeabi_memclr>
c0de929c:	2009      	movs	r0, #9
c0de929e:	f8df b2e0 	ldr.w	fp, [pc, #736]	@ c0de9580 <displayGenericContextPage+0x3f0>
c0de92a2:	f89d 5047 	ldrb.w	r5, [sp, #71]	@ 0x47
c0de92a6:	f88d 000a 	strb.w	r0, [sp, #10]
c0de92aa:	2002      	movs	r0, #2
c0de92ac:	f88d 0009 	strb.w	r0, [sp, #9]
c0de92b0:	eb09 0008 	add.w	r0, r9, r8
c0de92b4:	eb09 010b 	add.w	r1, r9, fp
c0de92b8:	6900      	ldr	r0, [r0, #16]
c0de92ba:	7c8e      	ldrb	r6, [r1, #18]
c0de92bc:	9001      	str	r0, [sp, #4]
c0de92be:	f89a 0000 	ldrb.w	r0, [sl]
c0de92c2:	280a      	cmp	r0, #10
c0de92c4:	f88d 0010 	strb.w	r0, [sp, #16]
c0de92c8:	d01e      	beq.n	c0de9308 <displayGenericContextPage+0x178>
c0de92ca:	2801      	cmp	r0, #1
c0de92cc:	d02c      	beq.n	c0de9328 <displayGenericContextPage+0x198>
c0de92ce:	2802      	cmp	r0, #2
c0de92d0:	d014      	beq.n	c0de92fc <displayGenericContextPage+0x16c>
c0de92d2:	2803      	cmp	r0, #3
c0de92d4:	d012      	beq.n	c0de92fc <displayGenericContextPage+0x16c>
c0de92d6:	2804      	cmp	r0, #4
c0de92d8:	d02e      	beq.n	c0de9338 <displayGenericContextPage+0x1a8>
c0de92da:	2806      	cmp	r0, #6
c0de92dc:	d042      	beq.n	c0de9364 <displayGenericContextPage+0x1d4>
c0de92de:	2807      	cmp	r0, #7
c0de92e0:	d04e      	beq.n	c0de9380 <displayGenericContextPage+0x1f0>
c0de92e2:	2808      	cmp	r0, #8
c0de92e4:	d058      	beq.n	c0de9398 <displayGenericContextPage+0x208>
c0de92e6:	2809      	cmp	r0, #9
c0de92e8:	d063      	beq.n	c0de93b2 <displayGenericContextPage+0x222>
c0de92ea:	2800      	cmp	r0, #0
c0de92ec:	f040 80d0 	bne.w	c0de9490 <displayGenericContextPage+0x300>
c0de92f0:	f001 ffdd 	bl	c0deb2ae <OUTLINED_FUNCTION_14>
c0de92f4:	e890 007c 	ldmia.w	r0, {r2, r3, r4, r5, r6}
c0de92f8:	c17c      	stmia	r1!, {r2, r3, r4, r5, r6}
c0de92fa:	e092      	b.n	c0de9422 <displayGenericContextPage+0x292>
c0de92fc:	f001 ffd7 	bl	c0deb2ae <OUTLINED_FUNCTION_14>
c0de9300:	e890 003c 	ldmia.w	r0, {r2, r3, r4, r5}
c0de9304:	c13c      	stmia	r1!, {r2, r3, r4, r5}
c0de9306:	e08c      	b.n	c0de9422 <displayGenericContextPage+0x292>
c0de9308:	f88d 501c 	strb.w	r5, [sp, #28]
c0de930c:	f001 ff9b 	bl	c0deb246 <OUTLINED_FUNCTION_1>
c0de9310:	9005      	str	r0, [sp, #20]
c0de9312:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de9316:	4430      	add	r0, r6
c0de9318:	f002 fe66 	bl	c0debfe8 <pic>
c0de931c:	9006      	str	r0, [sp, #24]
c0de931e:	f89a 000d 	ldrb.w	r0, [sl, #13]
c0de9322:	f88d 001d 	strb.w	r0, [sp, #29]
c0de9326:	e07c      	b.n	c0de9422 <displayGenericContextPage+0x292>
c0de9328:	f107 0010 	add.w	r0, r7, #16
c0de932c:	f10a 0104 	add.w	r1, sl, #4
c0de9330:	2230      	movs	r2, #48	@ 0x30
c0de9332:	f003 f871 	bl	c0dec418 <__aeabi_memcpy>
c0de9336:	e074      	b.n	c0de9422 <displayGenericContextPage+0x292>
c0de9338:	f8da 2004 	ldr.w	r2, [sl, #4]
c0de933c:	eb09 010b 	add.w	r1, r9, fp
c0de9340:	f89d 0046 	ldrb.w	r0, [sp, #70]	@ 0x46
c0de9344:	9f00      	ldr	r7, [sp, #0]
c0de9346:	624a      	str	r2, [r1, #36]	@ 0x24
c0de9348:	2800      	cmp	r0, #0
c0de934a:	f8da 2008 	ldr.w	r2, [sl, #8]
c0de934e:	628a      	str	r2, [r1, #40]	@ 0x28
c0de9350:	f000 80bf 	beq.w	c0de94d2 <displayGenericContextPage+0x342>
c0de9354:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de9358:	2800      	cmp	r0, #0
c0de935a:	f000 809c 	beq.w	c0de9496 <displayGenericContextPage+0x306>
c0de935e:	eb00 1006 	add.w	r0, r0, r6, lsl #4
c0de9362:	e09c      	b.n	c0de949e <displayGenericContextPage+0x30e>
c0de9364:	f89a 100c 	ldrb.w	r1, [sl, #12]
c0de9368:	1970      	adds	r0, r6, r5
c0de936a:	f10a 0404 	add.w	r4, sl, #4
c0de936e:	4288      	cmp	r0, r1
c0de9370:	d134      	bne.n	c0de93dc <displayGenericContextPage+0x24c>
c0de9372:	3710      	adds	r7, #16
c0de9374:	4621      	mov	r1, r4
c0de9376:	222c      	movs	r2, #44	@ 0x2c
c0de9378:	4638      	mov	r0, r7
c0de937a:	f003 f84d 	bl	c0dec418 <__aeabi_memcpy>
c0de937e:	e031      	b.n	c0de93e4 <displayGenericContextPage+0x254>
c0de9380:	f88d 5018 	strb.w	r5, [sp, #24]
c0de9384:	eb06 0046 	add.w	r0, r6, r6, lsl #1
c0de9388:	f8da 1004 	ldr.w	r1, [sl, #4]
c0de938c:	eb01 0080 	add.w	r0, r1, r0, lsl #2
c0de9390:	f002 fe2a 	bl	c0debfe8 <pic>
c0de9394:	9005      	str	r0, [sp, #20]
c0de9396:	e044      	b.n	c0de9422 <displayGenericContextPage+0x292>
c0de9398:	f88d 5020 	strb.w	r5, [sp, #32]
c0de939c:	f001 ff53 	bl	c0deb246 <OUTLINED_FUNCTION_1>
c0de93a0:	9005      	str	r0, [sp, #20]
c0de93a2:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de93a6:	eb00 0086 	add.w	r0, r0, r6, lsl #2
c0de93aa:	f002 fe1d 	bl	c0debfe8 <pic>
c0de93ae:	9006      	str	r0, [sp, #24]
c0de93b0:	e037      	b.n	c0de9422 <displayGenericContextPage+0x292>
c0de93b2:	f001 ff7c 	bl	c0deb2ae <OUTLINED_FUNCTION_14>
c0de93b6:	e890 001c 	ldmia.w	r0, {r2, r3, r4}
c0de93ba:	c11c      	stmia	r1!, {r2, r3, r4}
c0de93bc:	f88d 5019 	strb.w	r5, [sp, #25]
c0de93c0:	f001 ff41 	bl	c0deb246 <OUTLINED_FUNCTION_1>
c0de93c4:	9005      	str	r0, [sp, #20]
c0de93c6:	f89a 000a 	ldrb.w	r0, [sl, #10]
c0de93ca:	42b0      	cmp	r0, r6
c0de93cc:	d327      	bcc.n	c0de941e <displayGenericContextPage+0x28e>
c0de93ce:	1971      	adds	r1, r6, r5
c0de93d0:	4281      	cmp	r1, r0
c0de93d2:	d924      	bls.n	c0de941e <displayGenericContextPage+0x28e>
c0de93d4:	1b80      	subs	r0, r0, r6
c0de93d6:	f88d 001a 	strb.w	r0, [sp, #26]
c0de93da:	e022      	b.n	c0de9422 <displayGenericContextPage+0x292>
c0de93dc:	2004      	movs	r0, #4
c0de93de:	3710      	adds	r7, #16
c0de93e0:	f88d 0010 	strb.w	r0, [sp, #16]
c0de93e4:	f88d 501c 	strb.w	r5, [sp, #28]
c0de93e8:	6820      	ldr	r0, [r4, #0]
c0de93ea:	eb00 1006 	add.w	r0, r0, r6, lsl #4
c0de93ee:	f002 fdfb 	bl	c0debfe8 <pic>
c0de93f2:	2110      	movs	r1, #16
c0de93f4:	2200      	movs	r2, #0
c0de93f6:	6038      	str	r0, [r7, #0]
c0de93f8:	eb01 1105 	add.w	r1, r1, r5, lsl #4
c0de93fc:	f102 0310 	add.w	r3, r2, #16
c0de9400:	4299      	cmp	r1, r3
c0de9402:	d006      	beq.n	c0de9412 <displayGenericContextPage+0x282>
c0de9404:	4402      	add	r2, r0
c0de9406:	7b12      	ldrb	r2, [r2, #12]
c0de9408:	0752      	lsls	r2, r2, #29
c0de940a:	461a      	mov	r2, r3
c0de940c:	d5f6      	bpl.n	c0de93fc <displayGenericContextPage+0x26c>
c0de940e:	210d      	movs	r1, #13
c0de9410:	72f9      	strb	r1, [r7, #11]
c0de9412:	9a06      	ldr	r2, [sp, #24]
c0de9414:	eb09 010b 	add.w	r1, r9, fp
c0de9418:	e9c1 0209 	strd	r0, r2, [r1, #36]	@ 0x24
c0de941c:	e001      	b.n	c0de9422 <displayGenericContextPage+0x292>
c0de941e:	f88d 501a 	strb.w	r5, [sp, #26]
c0de9422:	9f00      	ldr	r7, [sp, #0]
c0de9424:	f819 0008 	ldrb.w	r0, [r9, r8]
c0de9428:	f000 01fe 	and.w	r1, r0, #254	@ 0xfe
c0de942c:	4853      	ldr	r0, [pc, #332]	@ (c0de957c <displayGenericContextPage+0x3ec>)
c0de942e:	2902      	cmp	r1, #2
c0de9430:	4448      	add	r0, r9
c0de9432:	6a00      	ldr	r0, [r0, #32]
c0de9434:	bf18      	it	ne
c0de9436:	2000      	movne	r0, #0
c0de9438:	f89a 1000 	ldrb.w	r1, [sl]
c0de943c:	2902      	cmp	r1, #2
c0de943e:	d817      	bhi.n	c0de9470 <displayGenericContextPage+0x2e0>
c0de9440:	f010 0fe0 	tst.w	r0, #224	@ 0xe0
c0de9444:	d014      	beq.n	c0de9470 <displayGenericContextPage+0x2e0>
c0de9446:	0601      	lsls	r1, r0, #24
c0de9448:	d508      	bpl.n	c0de945c <displayGenericContextPage+0x2cc>
c0de944a:	eb09 010b 	add.w	r1, r9, fp
c0de944e:	6d89      	ldr	r1, [r1, #88]	@ 0x58
c0de9450:	7809      	ldrb	r1, [r1, #0]
c0de9452:	06c9      	lsls	r1, r1, #27
c0de9454:	d402      	bmi.n	c0de945c <displayGenericContextPage+0x2cc>
c0de9456:	494d      	ldr	r1, [pc, #308]	@ (c0de958c <displayGenericContextPage+0x3fc>)
c0de9458:	4479      	add	r1, pc
c0de945a:	e001      	b.n	c0de9460 <displayGenericContextPage+0x2d0>
c0de945c:	494c      	ldr	r1, [pc, #304]	@ (c0de9590 <displayGenericContextPage+0x400>)
c0de945e:	4479      	add	r1, pc
c0de9460:	0680      	lsls	r0, r0, #26
c0de9462:	9103      	str	r1, [sp, #12]
c0de9464:	f04f 0010 	mov.w	r0, #16
c0de9468:	bf58      	it	pl
c0de946a:	2011      	movpl	r0, #17
c0de946c:	f88d 000b 	strb.w	r0, [sp, #11]
c0de9470:	4848      	ldr	r0, [pc, #288]	@ (c0de9594 <displayGenericContextPage+0x404>)
c0de9472:	eb09 0408 	add.w	r4, r9, r8
c0de9476:	aa01      	add	r2, sp, #4
c0de9478:	f104 0160 	add.w	r1, r4, #96	@ 0x60
c0de947c:	4478      	add	r0, pc
c0de947e:	f7ff fad1 	bl	c0de8a24 <nbgl_pageDrawGenericContent>
c0de9482:	6160      	str	r0, [r4, #20]
c0de9484:	2001      	movs	r0, #1
c0de9486:	2f00      	cmp	r7, #0
c0de9488:	bf18      	it	ne
c0de948a:	2002      	movne	r0, #2
c0de948c:	f002 fb94 	bl	c0debbb8 <nbgl_refreshSpecial>
c0de9490:	b020      	add	sp, #128	@ 0x80
c0de9492:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de9496:	f8da 1008 	ldr.w	r1, [sl, #8]
c0de949a:	4630      	mov	r0, r6
c0de949c:	4788      	blx	r1
c0de949e:	f002 fda3 	bl	c0debfe8 <pic>
c0de94a2:	7b01      	ldrb	r1, [r0, #12]
c0de94a4:	0789      	lsls	r1, r1, #30
c0de94a6:	d42e      	bmi.n	c0de9506 <displayGenericContextPage+0x376>
c0de94a8:	4937      	ldr	r1, [pc, #220]	@ (c0de9588 <displayGenericContextPage+0x3f8>)
c0de94aa:	4479      	add	r1, pc
c0de94ac:	910b      	str	r1, [sp, #44]	@ 0x2c
c0de94ae:	210a      	movs	r1, #10
c0de94b0:	f88d 1030 	strb.w	r1, [sp, #48]	@ 0x30
c0de94b4:	2100      	movs	r1, #0
c0de94b6:	910a      	str	r1, [sp, #40]	@ 0x28
c0de94b8:	eb09 010b 	add.w	r1, r9, fp
c0de94bc:	e9d0 2000 	ldrd	r2, r0, [r0]
c0de94c0:	e9c1 2006 	strd	r2, r0, [r1, #24]
c0de94c4:	f89a 0011 	ldrb.w	r0, [sl, #17]
c0de94c8:	f881 0020 	strb.w	r0, [r1, #32]
c0de94cc:	2005      	movs	r0, #5
c0de94ce:	f88d 0010 	strb.w	r0, [sp, #16]
c0de94d2:	f88d 501c 	strb.w	r5, [sp, #28]
c0de94d6:	f89a 000f 	ldrb.w	r0, [sl, #15]
c0de94da:	f88d 001f 	strb.w	r0, [sp, #31]
c0de94de:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de94e2:	b328      	cbz	r0, c0de9530 <displayGenericContextPage+0x3a0>
c0de94e4:	eb00 1006 	add.w	r0, r0, r6, lsl #4
c0de94e8:	f002 fd7e 	bl	c0debfe8 <pic>
c0de94ec:	9005      	str	r0, [sp, #20]
c0de94ee:	f100 010c 	add.w	r1, r0, #12
c0de94f2:	1c68      	adds	r0, r5, #1
c0de94f4:	3801      	subs	r0, #1
c0de94f6:	d033      	beq.n	c0de9560 <displayGenericContextPage+0x3d0>
c0de94f8:	f101 0210 	add.w	r2, r1, #16
c0de94fc:	7809      	ldrb	r1, [r1, #0]
c0de94fe:	0749      	lsls	r1, r1, #29
c0de9500:	4611      	mov	r1, r2
c0de9502:	d5f7      	bpl.n	c0de94f4 <displayGenericContextPage+0x364>
c0de9504:	e029      	b.n	c0de955a <displayGenericContextPage+0x3ca>
c0de9506:	2101      	movs	r1, #1
c0de9508:	f88d 1010 	strb.w	r1, [sp, #16]
c0de950c:	6881      	ldr	r1, [r0, #8]
c0de950e:	4a22      	ldr	r2, [pc, #136]	@ (c0de9598 <displayGenericContextPage+0x408>)
c0de9510:	447a      	add	r2, pc
c0de9512:	920c      	str	r2, [sp, #48]	@ 0x30
c0de9514:	e9d0 2000 	ldrd	r2, r0, [r0]
c0de9518:	9106      	str	r1, [sp, #24]
c0de951a:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de951c:	2000      	movs	r0, #0
c0de951e:	9209      	str	r2, [sp, #36]	@ 0x24
c0de9520:	f88d 0036 	strb.w	r0, [sp, #54]	@ 0x36
c0de9524:	f8ad 0034 	strh.w	r0, [sp, #52]	@ 0x34
c0de9528:	900a      	str	r0, [sp, #40]	@ 0x28
c0de952a:	f88d 0014 	strb.w	r0, [sp, #20]
c0de952e:	e779      	b.n	c0de9424 <displayGenericContextPage+0x294>
c0de9530:	2400      	movs	r4, #0
c0de9532:	9405      	str	r4, [sp, #20]
c0de9534:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de9538:	f88d 601d 	strb.w	r6, [sp, #29]
c0de953c:	9006      	str	r0, [sp, #24]
c0de953e:	b2e0      	uxtb	r0, r4
c0de9540:	42a8      	cmp	r0, r5
c0de9542:	d20d      	bcs.n	c0de9560 <displayGenericContextPage+0x3d0>
c0de9544:	19a0      	adds	r0, r4, r6
c0de9546:	f8da 1008 	ldr.w	r1, [sl, #8]
c0de954a:	b2c0      	uxtb	r0, r0
c0de954c:	4788      	blx	r1
c0de954e:	f002 fd4b 	bl	c0debfe8 <pic>
c0de9552:	7b00      	ldrb	r0, [r0, #12]
c0de9554:	3401      	adds	r4, #1
c0de9556:	0740      	lsls	r0, r0, #29
c0de9558:	d5f1      	bpl.n	c0de953e <displayGenericContextPage+0x3ae>
c0de955a:	200d      	movs	r0, #13
c0de955c:	f88d 001f 	strb.w	r0, [sp, #31]
c0de9560:	2009      	movs	r0, #9
c0de9562:	f88d 001e 	strb.w	r0, [sp, #30]
c0de9566:	2000      	movs	r0, #0
c0de9568:	f88d 0020 	strb.w	r0, [sp, #32]
c0de956c:	f89a 0011 	ldrb.w	r0, [sl, #17]
c0de9570:	f88d 0021 	strb.w	r0, [sp, #33]	@ 0x21
c0de9574:	e756      	b.n	c0de9424 <displayGenericContextPage+0x294>
c0de9576:	bf00      	nop
c0de9578:	00001be8 	.word	0x00001be8
c0de957c:	00001c64 	.word	0x00001c64
c0de9580:	0000191c 	.word	0x0000191c
c0de9584:	00004f1f 	.word	0x00004f1f
c0de9588:	0000485c 	.word	0x0000485c
c0de958c:	00004168 	.word	0x00004168
c0de9590:	000044ab 	.word	0x000044ab
c0de9594:	000002a5 	.word	0x000002a5
c0de9598:	00004ce6 	.word	0x00004ce6

c0de959c <nbgl_useCaseHomeAndSettings>:
c0de959c:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de95a0:	f8df 8060 	ldr.w	r8, [pc, #96]	@ c0de9604 <nbgl_useCaseHomeAndSettings+0x68>
c0de95a4:	469a      	mov	sl, r3
c0de95a6:	4615      	mov	r5, r2
c0de95a8:	460e      	mov	r6, r1
c0de95aa:	4607      	mov	r7, r0
c0de95ac:	eb09 0408 	add.w	r4, r9, r8
c0de95b0:	f7ff fc56 	bl	c0de8e60 <reset_callbacks_and_context>
c0de95b4:	9809      	ldr	r0, [sp, #36]	@ 0x24
c0de95b6:	6320      	str	r0, [r4, #48]	@ 0x30
c0de95b8:	9808      	ldr	r0, [sp, #32]
c0de95ba:	e9c4 7608 	strd	r7, r6, [r4, #32]
c0de95be:	e9c4 500a 	strd	r5, r0, [r4, #40]	@ 0x28
c0de95c2:	e9dd 100a 	ldrd	r1, r0, [sp, #40]	@ 0x28
c0de95c6:	b131      	cbz	r1, c0de95d6 <nbgl_useCaseHomeAndSettings+0x3a>
c0de95c8:	eb09 0208 	add.w	r2, r9, r8
c0de95cc:	e891 0078 	ldmia.w	r1, {r3, r4, r5, r6}
c0de95d0:	3234      	adds	r2, #52	@ 0x34
c0de95d2:	c278      	stmia	r2!, {r3, r4, r5, r6}
c0de95d4:	e006      	b.n	c0de95e4 <nbgl_useCaseHomeAndSettings+0x48>
c0de95d6:	eb09 0108 	add.w	r1, r9, r8
c0de95da:	2200      	movs	r2, #0
c0de95dc:	e9c1 220d 	strd	r2, r2, [r1, #52]	@ 0x34
c0de95e0:	e9c1 220f 	strd	r2, r2, [r1, #60]	@ 0x3c
c0de95e4:	eb09 0108 	add.w	r1, r9, r8
c0de95e8:	f1ba 0fff 	cmp.w	sl, #255	@ 0xff
c0de95ec:	6448      	str	r0, [r1, #68]	@ 0x44
c0de95ee:	d004      	beq.n	c0de95fa <nbgl_useCaseHomeAndSettings+0x5e>
c0de95f0:	4650      	mov	r0, sl
c0de95f2:	e8bd 45f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de95f6:	f000 b807 	b.w	c0de9608 <bundleNavStartSettingsAtPage>
c0de95fa:	e8bd 45f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de95fe:	f000 b815 	b.w	c0de962c <bundleNavStartHome>
c0de9602:	bf00      	nop
c0de9604:	00001c64 	.word	0x00001c64

c0de9608 <bundleNavStartSettingsAtPage>:
c0de9608:	b51c      	push	{r2, r3, r4, lr}
c0de960a:	4601      	mov	r1, r0
c0de960c:	4805      	ldr	r0, [pc, #20]	@ (c0de9624 <bundleNavStartSettingsAtPage+0x1c>)
c0de960e:	eb09 0300 	add.w	r3, r9, r0
c0de9612:	6a18      	ldr	r0, [r3, #32]
c0de9614:	e9d3 230b 	ldrd	r2, r3, [r3, #44]	@ 0x2c
c0de9618:	4c03      	ldr	r4, [pc, #12]	@ (c0de9628 <bundleNavStartSettingsAtPage+0x20>)
c0de961a:	447c      	add	r4, pc
c0de961c:	9400      	str	r4, [sp, #0]
c0de961e:	f7ff fca3 	bl	c0de8f68 <nbgl_useCaseGenericSettings>
c0de9622:	bd1c      	pop	{r2, r3, r4, pc}
c0de9624:	00001c64 	.word	0x00001c64
c0de9628:	0000000f 	.word	0x0000000f

c0de962c <bundleNavStartHome>:
c0de962c:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
c0de962e:	4809      	ldr	r0, [pc, #36]	@ (c0de9654 <bundleNavStartHome+0x28>)
c0de9630:	eb09 0400 	add.w	r4, r9, r0
c0de9634:	f104 0320 	add.w	r3, r4, #32
c0de9638:	6c65      	ldr	r5, [r4, #68]	@ 0x44
c0de963a:	3434      	adds	r4, #52	@ 0x34
c0de963c:	cb0f      	ldmia	r3, {r0, r1, r2, r3}
c0de963e:	4e06      	ldr	r6, [pc, #24]	@ (c0de9658 <bundleNavStartHome+0x2c>)
c0de9640:	2b00      	cmp	r3, #0
c0de9642:	9502      	str	r5, [sp, #8]
c0de9644:	447e      	add	r6, pc
c0de9646:	e9cd 4600 	strd	r4, r6, [sp]
c0de964a:	bf18      	it	ne
c0de964c:	2301      	movne	r3, #1
c0de964e:	f7ff fb6d 	bl	c0de8d2c <useCaseHomeExt>
c0de9652:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}
c0de9654:	00001c64 	.word	0x00001c64
c0de9658:	0000113d 	.word	0x0000113d

c0de965c <nbgl_useCaseStatus>:
c0de965c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de9660:	b090      	sub	sp, #64	@ 0x40
c0de9662:	4604      	mov	r4, r0
c0de9664:	4822      	ldr	r0, [pc, #136]	@ (c0de96f0 <nbgl_useCaseStatus+0x94>)
c0de9666:	460e      	mov	r6, r1
c0de9668:	4615      	mov	r5, r2
c0de966a:	a90d      	add	r1, sp, #52	@ 0x34
c0de966c:	f8df 807c 	ldr.w	r8, [pc, #124]	@ c0de96ec <nbgl_useCaseStatus+0x90>
c0de9670:	4478      	add	r0, pc
c0de9672:	e890 008c 	ldmia.w	r0, {r2, r3, r7}
c0de9676:	c18c      	stmia	r1!, {r2, r3, r7}
c0de9678:	eb09 0708 	add.w	r7, r9, r8
c0de967c:	f7ff fbf0 	bl	c0de8e60 <reset_callbacks_and_context>
c0de9680:	607d      	str	r5, [r7, #4]
c0de9682:	b156      	cbz	r6, c0de969a <nbgl_useCaseStatus+0x3e>
c0de9684:	2003      	movs	r0, #3
c0de9686:	f7fa fc95 	bl	c0de3fb4 <os_io_seph_cmd_piezo_play_tune>
c0de968a:	481a      	ldr	r0, [pc, #104]	@ (c0de96f4 <nbgl_useCaseStatus+0x98>)
c0de968c:	a90d      	add	r1, sp, #52	@ 0x34
c0de968e:	4622      	mov	r2, r4
c0de9690:	2302      	movs	r3, #2
c0de9692:	4478      	add	r0, pc
c0de9694:	f7fe fe22 	bl	c0de82dc <nbgl_pageDrawLedgerInfo>
c0de9698:	e020      	b.n	c0de96dc <nbgl_useCaseStatus+0x80>
c0de969a:	2000      	movs	r0, #0
c0de969c:	f44f 1140 	mov.w	r1, #3145728	@ 0x300000
c0de96a0:	466a      	mov	r2, sp
c0de96a2:	9005      	str	r0, [sp, #20]
c0de96a4:	9104      	str	r1, [sp, #16]
c0de96a6:	4914      	ldr	r1, [pc, #80]	@ (c0de96f8 <nbgl_useCaseStatus+0x9c>)
c0de96a8:	e9cd 4000 	strd	r4, r0, [sp]
c0de96ac:	9006      	str	r0, [sp, #24]
c0de96ae:	f88d 001c 	strb.w	r0, [sp, #28]
c0de96b2:	e9cd 000a 	strd	r0, r0, [sp, #40]	@ 0x28
c0de96b6:	4479      	add	r1, pc
c0de96b8:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de96bc:	f44f 6110 	mov.w	r1, #2304	@ 0x900
c0de96c0:	f44f 7000 	mov.w	r0, #512	@ 0x200
c0de96c4:	f8ad 1030 	strh.w	r1, [sp, #48]	@ 0x30
c0de96c8:	f8ad 0024 	strh.w	r0, [sp, #36]	@ 0x24
c0de96cc:	480b      	ldr	r0, [pc, #44]	@ (c0de96fc <nbgl_useCaseStatus+0xa0>)
c0de96ce:	4478      	add	r0, pc
c0de96d0:	9008      	str	r0, [sp, #32]
c0de96d2:	480b      	ldr	r0, [pc, #44]	@ (c0de9700 <nbgl_useCaseStatus+0xa4>)
c0de96d4:	a90d      	add	r1, sp, #52	@ 0x34
c0de96d6:	4478      	add	r0, pc
c0de96d8:	f7fe fe54 	bl	c0de8384 <nbgl_pageDrawInfo>
c0de96dc:	eb09 0108 	add.w	r1, r9, r8
c0de96e0:	6148      	str	r0, [r1, #20]
c0de96e2:	f001 fdbb 	bl	c0deb25c <OUTLINED_FUNCTION_3>
c0de96e6:	b010      	add	sp, #64	@ 0x40
c0de96e8:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de96ec:	00001be8 	.word	0x00001be8
c0de96f0:	00006114 	.word	0x00006114
c0de96f4:	0000008f 	.word	0x0000008f
c0de96f8:	00003598 	.word	0x00003598
c0de96fc:	00004a8a 	.word	0x00004a8a
c0de9700:	0000004b 	.word	0x0000004b

c0de9704 <tickerCallback>:
c0de9704:	b510      	push	{r4, lr}
c0de9706:	4806      	ldr	r0, [pc, #24]	@ (c0de9720 <tickerCallback+0x1c>)
c0de9708:	eb09 0400 	add.w	r4, r9, r0
c0de970c:	6960      	ldr	r0, [r4, #20]
c0de970e:	f7ff f98c 	bl	c0de8a2a <nbgl_pageRelease>
c0de9712:	6860      	ldr	r0, [r4, #4]
c0de9714:	b110      	cbz	r0, c0de971c <tickerCallback+0x18>
c0de9716:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de971a:	4700      	bx	r0
c0de971c:	bd10      	pop	{r4, pc}
c0de971e:	bf00      	nop
c0de9720:	00001be8 	.word	0x00001be8

c0de9724 <pageCallback>:
c0de9724:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9728:	b092      	sub	sp, #72	@ 0x48
c0de972a:	b350      	cbz	r0, c0de9782 <pageCallback+0x5e>
c0de972c:	4605      	mov	r5, r0
c0de972e:	2801      	cmp	r0, #1
c0de9730:	d034      	beq.n	c0de979c <pageCallback+0x78>
c0de9732:	2d12      	cmp	r5, #18
c0de9734:	d043      	beq.n	c0de97be <pageCallback+0x9a>
c0de9736:	460c      	mov	r4, r1
c0de9738:	2d03      	cmp	r5, #3
c0de973a:	d055      	beq.n	c0de97e8 <pageCallback+0xc4>
c0de973c:	2d05      	cmp	r5, #5
c0de973e:	d05f      	beq.n	c0de9800 <pageCallback+0xdc>
c0de9740:	2d06      	cmp	r5, #6
c0de9742:	d075      	beq.n	c0de9830 <pageCallback+0x10c>
c0de9744:	2d07      	cmp	r5, #7
c0de9746:	d077      	beq.n	c0de9838 <pageCallback+0x114>
c0de9748:	2d08      	cmp	r5, #8
c0de974a:	f000 809e 	beq.w	c0de988a <pageCallback+0x166>
c0de974e:	2d09      	cmp	r5, #9
c0de9750:	f000 80a9 	beq.w	c0de98a6 <pageCallback+0x182>
c0de9754:	2d0a      	cmp	r5, #10
c0de9756:	f000 80b0 	beq.w	c0de98ba <pageCallback+0x196>
c0de975a:	2d0b      	cmp	r5, #11
c0de975c:	f000 80fa 	beq.w	c0de9954 <pageCallback+0x230>
c0de9760:	2d0c      	cmp	r5, #12
c0de9762:	f000 80fe 	beq.w	c0de9962 <pageCallback+0x23e>
c0de9766:	2d0d      	cmp	r5, #13
c0de9768:	f000 8105 	beq.w	c0de9976 <pageCallback+0x252>
c0de976c:	2d10      	cmp	r5, #16
c0de976e:	f000 810e 	beq.w	c0de998e <pageCallback+0x26a>
c0de9772:	2d11      	cmp	r5, #17
c0de9774:	f000 8113 	beq.w	c0de999e <pageCallback+0x27a>
c0de9778:	2d02      	cmp	r5, #2
c0de977a:	f040 8119 	bne.w	c0de99b0 <pageCallback+0x28c>
c0de977e:	48cb      	ldr	r0, [pc, #812]	@ (c0de9aac <pageCallback+0x388>)
c0de9780:	e161      	b.n	c0de9a46 <pageCallback+0x322>
c0de9782:	48ca      	ldr	r0, [pc, #808]	@ (c0de9aac <pageCallback+0x388>)
c0de9784:	eb09 0100 	add.w	r1, r9, r0
c0de9788:	f891 0060 	ldrb.w	r0, [r1, #96]	@ 0x60
c0de978c:	6889      	ldr	r1, [r1, #8]
c0de978e:	3801      	subs	r0, #1
c0de9790:	2900      	cmp	r1, #0
c0de9792:	f000 8124 	beq.w	c0de99de <pageCallback+0x2ba>
c0de9796:	b2c0      	uxtb	r0, r0
c0de9798:	2101      	movs	r1, #1
c0de979a:	e00b      	b.n	c0de97b4 <pageCallback+0x90>
c0de979c:	48c3      	ldr	r0, [pc, #780]	@ (c0de9aac <pageCallback+0x388>)
c0de979e:	eb09 0100 	add.w	r1, r9, r0
c0de97a2:	f891 0060 	ldrb.w	r0, [r1, #96]	@ 0x60
c0de97a6:	6889      	ldr	r1, [r1, #8]
c0de97a8:	3001      	adds	r0, #1
c0de97aa:	2900      	cmp	r1, #0
c0de97ac:	f000 8117 	beq.w	c0de99de <pageCallback+0x2ba>
c0de97b0:	b2c0      	uxtb	r0, r0
c0de97b2:	2100      	movs	r1, #0
c0de97b4:	b012      	add	sp, #72	@ 0x48
c0de97b6:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de97ba:	f000 baa7 	b.w	c0de9d0c <displayReviewPage>
c0de97be:	48b9      	ldr	r0, [pc, #740]	@ (c0de9aa4 <pageCallback+0x380>)
c0de97c0:	eb09 0100 	add.w	r1, r9, r0
c0de97c4:	f891 1021 	ldrb.w	r1, [r1, #33]	@ 0x21
c0de97c8:	2900      	cmp	r1, #0
c0de97ca:	f000 810f 	beq.w	c0de99ec <pageCallback+0x2c8>
c0de97ce:	eb09 0100 	add.w	r1, r9, r0
c0de97d2:	6d89      	ldr	r1, [r1, #88]	@ 0x58
c0de97d4:	680a      	ldr	r2, [r1, #0]
c0de97d6:	2a00      	cmp	r2, #0
c0de97d8:	f000 8108 	beq.w	c0de99ec <pageCallback+0x2c8>
c0de97dc:	4448      	add	r0, r9
c0de97de:	2201      	movs	r2, #1
c0de97e0:	f880 2068 	strb.w	r2, [r0, #104]	@ 0x68
c0de97e4:	6808      	ldr	r0, [r1, #0]
c0de97e6:	e0de      	b.n	c0de99a6 <pageCallback+0x282>
c0de97e8:	48b0      	ldr	r0, [pc, #704]	@ (c0de9aac <pageCallback+0x388>)
c0de97ea:	2cff      	cmp	r4, #255	@ 0xff
c0de97ec:	f000 812b 	beq.w	c0de9a46 <pageCallback+0x322>
c0de97f0:	f819 0000 	ldrb.w	r0, [r9, r0]
c0de97f4:	1e81      	subs	r1, r0, #2
c0de97f6:	2902      	cmp	r1, #2
c0de97f8:	f080 8144 	bcs.w	c0de9a84 <pageCallback+0x360>
c0de97fc:	4620      	mov	r0, r4
c0de97fe:	e0ef      	b.n	c0de99e0 <pageCallback+0x2bc>
c0de9800:	a80a      	add	r0, sp, #40	@ 0x28
c0de9802:	49b0      	ldr	r1, [pc, #704]	@ (c0de9ac4 <pageCallback+0x3a0>)
c0de9804:	2220      	movs	r2, #32
c0de9806:	4479      	add	r1, pc
c0de9808:	f002 fe06 	bl	c0dec418 <__aeabi_memcpy>
c0de980c:	4ca7      	ldr	r4, [pc, #668]	@ (c0de9aac <pageCallback+0x388>)
c0de980e:	eb09 0004 	add.w	r0, r9, r4
c0de9812:	6a00      	ldr	r0, [r0, #32]
c0de9814:	b108      	cbz	r0, c0de981a <pageCallback+0xf6>
c0de9816:	f7ff f908 	bl	c0de8a2a <nbgl_pageRelease>
c0de981a:	48ab      	ldr	r0, [pc, #684]	@ (c0de9ac8 <pageCallback+0x3a4>)
c0de981c:	a90a      	add	r1, sp, #40	@ 0x28
c0de981e:	4478      	add	r0, pc
c0de9820:	f7fe fea0 	bl	c0de8564 <nbgl_pageDrawConfirmation>
c0de9824:	eb09 0104 	add.w	r1, r9, r4
c0de9828:	6208      	str	r0, [r1, #32]
c0de982a:	f001 fd17 	bl	c0deb25c <OUTLINED_FUNCTION_3>
c0de982e:	e111      	b.n	c0de9a54 <pageCallback+0x330>
c0de9830:	489e      	ldr	r0, [pc, #632]	@ (c0de9aac <pageCallback+0x388>)
c0de9832:	4448      	add	r0, r9
c0de9834:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0de9836:	e108      	b.n	c0de9a4a <pageCallback+0x326>
c0de9838:	ac0a      	add	r4, sp, #40	@ 0x28
c0de983a:	499f      	ldr	r1, [pc, #636]	@ (c0de9ab8 <pageCallback+0x394>)
c0de983c:	221c      	movs	r2, #28
c0de983e:	4620      	mov	r0, r4
c0de9840:	4479      	add	r1, pc
c0de9842:	f002 fde9 	bl	c0dec418 <__aeabi_memcpy>
c0de9846:	489d      	ldr	r0, [pc, #628]	@ (c0de9abc <pageCallback+0x398>)
c0de9848:	ad06      	add	r5, sp, #24
c0de984a:	4629      	mov	r1, r5
c0de984c:	4478      	add	r0, pc
c0de984e:	e890 00cc 	ldmia.w	r0, {r2, r3, r6, r7}
c0de9852:	f44f 3080 	mov.w	r0, #65536	@ 0x10000
c0de9856:	c1cc      	stmia	r1!, {r2, r3, r6, r7}
c0de9858:	4e95      	ldr	r6, [pc, #596]	@ (c0de9ab0 <pageCallback+0x38c>)
c0de985a:	9005      	str	r0, [sp, #20]
c0de985c:	eb09 0706 	add.w	r7, r9, r6
c0de9860:	6878      	ldr	r0, [r7, #4]
c0de9862:	9002      	str	r0, [sp, #8]
c0de9864:	2000      	movs	r0, #0
c0de9866:	9003      	str	r0, [sp, #12]
c0de9868:	4620      	mov	r0, r4
c0de986a:	f7fa fdab 	bl	c0de43c4 <nbgl_layoutGet>
c0de986e:	4629      	mov	r1, r5
c0de9870:	6338      	str	r0, [r7, #48]	@ 0x30
c0de9872:	f7fd fb3f 	bl	c0de6ef4 <nbgl_layoutAddHeader>
c0de9876:	6879      	ldr	r1, [r7, #4]
c0de9878:	200b      	movs	r0, #11
c0de987a:	f001 fd0b 	bl	c0deb294 <OUTLINED_FUNCTION_11>
c0de987e:	6879      	ldr	r1, [r7, #4]
c0de9880:	2804      	cmp	r0, #4
c0de9882:	f080 80be 	bcs.w	c0de9a02 <pageCallback+0x2de>
c0de9886:	460c      	mov	r4, r1
c0de9888:	e0c7      	b.n	c0de9a1a <pageCallback+0x2f6>
c0de988a:	4888      	ldr	r0, [pc, #544]	@ (c0de9aac <pageCallback+0x388>)
c0de988c:	2c00      	cmp	r4, #0
c0de988e:	f040 80d8 	bne.w	c0de9a42 <pageCallback+0x31e>
c0de9892:	eb09 0100 	add.w	r1, r9, r0
c0de9896:	6a49      	ldr	r1, [r1, #36]	@ 0x24
c0de9898:	2900      	cmp	r1, #0
c0de989a:	f000 80d2 	beq.w	c0de9a42 <pageCallback+0x31e>
c0de989e:	b012      	add	sp, #72	@ 0x48
c0de98a0:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de98a4:	4708      	bx	r1
c0de98a6:	4881      	ldr	r0, [pc, #516]	@ (c0de9aac <pageCallback+0x388>)
c0de98a8:	4448      	add	r0, r9
c0de98aa:	6981      	ldr	r1, [r0, #24]
c0de98ac:	2900      	cmp	r1, #0
c0de98ae:	f000 80d1 	beq.w	c0de9a54 <pageCallback+0x330>
c0de98b2:	fab4 f084 	clz	r0, r4
c0de98b6:	0940      	lsrs	r0, r0, #5
c0de98b8:	e059      	b.n	c0de996e <pageCallback+0x24a>
c0de98ba:	487a      	ldr	r0, [pc, #488]	@ (c0de9aa4 <pageCallback+0x380>)
c0de98bc:	f8df 81ec 	ldr.w	r8, [pc, #492]	@ c0de9aac <pageCallback+0x388>
c0de98c0:	2700      	movs	r7, #0
c0de98c2:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de98c6:	f04f 0a0b 	mov.w	sl, #11
c0de98ca:	4448      	add	r0, r9
c0de98cc:	eb09 0608 	add.w	r6, r9, r8
c0de98d0:	f890 4020 	ldrb.w	r4, [r0, #32]
c0de98d4:	e9d0 b506 	ldrd	fp, r5, [r0, #24]
c0de98d8:	200b      	movs	r0, #11
c0de98da:	e9c6 770c 	strd	r7, r7, [r6, #48]	@ 0x30
c0de98de:	e9c6 770e 	strd	r7, r7, [r6, #56]	@ 0x38
c0de98e2:	4629      	mov	r1, r5
c0de98e4:	4623      	mov	r3, r4
c0de98e6:	f002 f9bc 	bl	c0debc62 <nbgl_getTextNbLinesInWidth>
c0de98ea:	f100 010a 	add.w	r1, r0, #10
c0de98ee:	e9c6 b50d 	strd	fp, r5, [r6, #52]	@ 0x34
c0de98f2:	f886 4033 	strb.w	r4, [r6, #51]	@ 0x33
c0de98f6:	f886 7031 	strb.w	r7, [r6, #49]	@ 0x31
c0de98fa:	fbb1 f1fa 	udiv	r1, r1, sl
c0de98fe:	b2ca      	uxtb	r2, r1
c0de9900:	f886 1030 	strb.w	r1, [r6, #48]	@ 0x30
c0de9904:	2a02      	cmp	r2, #2
c0de9906:	d31e      	bcc.n	c0de9946 <pageCallback+0x222>
c0de9908:	3a01      	subs	r2, #1
c0de990a:	241a      	movs	r4, #26
c0de990c:	eb02 0342 	add.w	r3, r2, r2, lsl #1
c0de9910:	3319      	adds	r3, #25
c0de9912:	b29b      	uxth	r3, r3
c0de9914:	fbb3 f4f4 	udiv	r4, r3, r4
c0de9918:	b2e4      	uxtb	r4, r4
c0de991a:	fbb4 f5fa 	udiv	r5, r4, sl
c0de991e:	fb05 441a 	mls	r4, r5, sl, r4
c0de9922:	f06f 050a 	mvn.w	r5, #10
c0de9926:	fb02 0005 	mla	r0, r2, r5, r0
c0de992a:	f44f 728f 	mov.w	r2, #286	@ 0x11e
c0de992e:	fbb3 f2f2 	udiv	r2, r3, r2
c0de9932:	b2c0      	uxtb	r0, r0
c0de9934:	4420      	add	r0, r4
c0de9936:	4411      	add	r1, r2
c0de9938:	280b      	cmp	r0, #11
c0de993a:	eb09 0008 	add.w	r0, r9, r8
c0de993e:	bf88      	it	hi
c0de9940:	3101      	addhi	r1, #1
c0de9942:	f880 1030 	strb.w	r1, [r0, #48]	@ 0x30
c0de9946:	2000      	movs	r0, #0
c0de9948:	2101      	movs	r1, #1
c0de994a:	b012      	add	sp, #72	@ 0x48
c0de994c:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9950:	f001 ba30 	b.w	c0deadb4 <displayDetailsPage>
c0de9954:	4855      	ldr	r0, [pc, #340]	@ (c0de9aac <pageCallback+0x388>)
c0de9956:	4448      	add	r0, r9
c0de9958:	6981      	ldr	r1, [r0, #24]
c0de995a:	2900      	cmp	r1, #0
c0de995c:	d07a      	beq.n	c0de9a54 <pageCallback+0x330>
c0de995e:	2001      	movs	r0, #1
c0de9960:	e005      	b.n	c0de996e <pageCallback+0x24a>
c0de9962:	4852      	ldr	r0, [pc, #328]	@ (c0de9aac <pageCallback+0x388>)
c0de9964:	4448      	add	r0, r9
c0de9966:	6981      	ldr	r1, [r0, #24]
c0de9968:	2900      	cmp	r1, #0
c0de996a:	d073      	beq.n	c0de9a54 <pageCallback+0x330>
c0de996c:	2000      	movs	r0, #0
c0de996e:	b012      	add	sp, #72	@ 0x48
c0de9970:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9974:	4708      	bx	r1
c0de9976:	484b      	ldr	r0, [pc, #300]	@ (c0de9aa4 <pageCallback+0x380>)
c0de9978:	eb09 0100 	add.w	r1, r9, r0
c0de997c:	4448      	add	r0, r9
c0de997e:	6a49      	ldr	r1, [r1, #36]	@ 0x24
c0de9980:	2900      	cmp	r1, #0
c0de9982:	d06a      	beq.n	c0de9a5a <pageCallback+0x336>
c0de9984:	7c80      	ldrb	r0, [r0, #18]
c0de9986:	4420      	add	r0, r4
c0de9988:	eb01 1000 	add.w	r0, r1, r0, lsl #4
c0de998c:	e06a      	b.n	c0de9a64 <pageCallback+0x340>
c0de998e:	4845      	ldr	r0, [pc, #276]	@ (c0de9aa4 <pageCallback+0x380>)
c0de9990:	2100      	movs	r1, #0
c0de9992:	4448      	add	r0, r9
c0de9994:	6581      	str	r1, [r0, #88]	@ 0x58
c0de9996:	f880 1069 	strb.w	r1, [r0, #105]	@ 0x69
c0de999a:	2010      	movs	r0, #16
c0de999c:	e003      	b.n	c0de99a6 <pageCallback+0x282>
c0de999e:	4a41      	ldr	r2, [pc, #260]	@ (c0de9aa4 <pageCallback+0x380>)
c0de99a0:	f001 fc5f 	bl	c0deb262 <OUTLINED_FUNCTION_4>
c0de99a4:	d067      	beq.n	c0de9a76 <pageCallback+0x352>
c0de99a6:	b012      	add	sp, #72	@ 0x48
c0de99a8:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de99ac:	f000 bfcc 	b.w	c0dea948 <displaySecurityReport>
c0de99b0:	4e3e      	ldr	r6, [pc, #248]	@ (c0de9aac <pageCallback+0x388>)
c0de99b2:	eb09 0006 	add.w	r0, r9, r6
c0de99b6:	6ac3      	ldr	r3, [r0, #44]	@ 0x2c
c0de99b8:	b133      	cbz	r3, c0de99c8 <pageCallback+0x2a4>
c0de99ba:	eb09 0006 	add.w	r0, r9, r6
c0de99be:	4621      	mov	r1, r4
c0de99c0:	f890 2060 	ldrb.w	r2, [r0, #96]	@ 0x60
c0de99c4:	4628      	mov	r0, r5
c0de99c6:	4798      	blx	r3
c0de99c8:	eb09 0006 	add.w	r0, r9, r6
c0de99cc:	68c2      	ldr	r2, [r0, #12]
c0de99ce:	2a00      	cmp	r2, #0
c0de99d0:	d040      	beq.n	c0de9a54 <pageCallback+0x330>
c0de99d2:	4628      	mov	r0, r5
c0de99d4:	4621      	mov	r1, r4
c0de99d6:	b012      	add	sp, #72	@ 0x48
c0de99d8:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de99dc:	4710      	bx	r2
c0de99de:	b2c0      	uxtb	r0, r0
c0de99e0:	2100      	movs	r1, #0
c0de99e2:	b012      	add	sp, #72	@ 0x48
c0de99e4:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de99e8:	f7ff bbd2 	b.w	c0de9190 <displayGenericContextPage>
c0de99ec:	482e      	ldr	r0, [pc, #184]	@ (c0de9aa8 <pageCallback+0x384>)
c0de99ee:	2200      	movs	r2, #0
c0de99f0:	eb09 0100 	add.w	r1, r9, r0
c0de99f4:	6888      	ldr	r0, [r1, #8]
c0de99f6:	3110      	adds	r1, #16
c0de99f8:	b012      	add	sp, #72	@ 0x48
c0de99fa:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de99fe:	f001 b929 	b.w	c0deac54 <displayInfosListModal>
c0de9a02:	2080      	movs	r0, #128	@ 0x80
c0de9a04:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de9a08:	2303      	movs	r3, #3
c0de9a0a:	9001      	str	r0, [sp, #4]
c0de9a0c:	4829      	ldr	r0, [pc, #164]	@ (c0de9ab4 <pageCallback+0x390>)
c0de9a0e:	eb09 0400 	add.w	r4, r9, r0
c0de9a12:	200b      	movs	r0, #11
c0de9a14:	9400      	str	r4, [sp, #0]
c0de9a16:	f002 f933 	bl	c0debc80 <nbgl_textReduceOnNbLines>
c0de9a1a:	9404      	str	r4, [sp, #16]
c0de9a1c:	eb09 0406 	add.w	r4, r9, r6
c0de9a20:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0de9a22:	a902      	add	r1, sp, #8
c0de9a24:	f7fc fe0b 	bl	c0de663e <nbgl_layoutAddQRCode>
c0de9a28:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0de9a2a:	4925      	ldr	r1, [pc, #148]	@ (c0de9ac0 <pageCallback+0x39c>)
c0de9a2c:	2215      	movs	r2, #21
c0de9a2e:	2309      	movs	r3, #9
c0de9a30:	4479      	add	r1, pc
c0de9a32:	f7fd fa38 	bl	c0de6ea6 <nbgl_layoutAddFooter>
c0de9a36:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0de9a38:	f7fd febe 	bl	c0de77b8 <nbgl_layoutDraw>
c0de9a3c:	f002 f8b7 	bl	c0debbae <nbgl_refresh>
c0de9a40:	e008      	b.n	c0de9a54 <pageCallback+0x330>
c0de9a42:	2c01      	cmp	r4, #1
c0de9a44:	d106      	bne.n	c0de9a54 <pageCallback+0x330>
c0de9a46:	4448      	add	r0, r9
c0de9a48:	6840      	ldr	r0, [r0, #4]
c0de9a4a:	b118      	cbz	r0, c0de9a54 <pageCallback+0x330>
c0de9a4c:	b012      	add	sp, #72	@ 0x48
c0de9a4e:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9a52:	4700      	bx	r0
c0de9a54:	b012      	add	sp, #72	@ 0x48
c0de9a56:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de9a5a:	6a81      	ldr	r1, [r0, #40]	@ 0x28
c0de9a5c:	7c80      	ldrb	r0, [r0, #18]
c0de9a5e:	4420      	add	r0, r4
c0de9a60:	b2c0      	uxtb	r0, r0
c0de9a62:	4788      	blx	r1
c0de9a64:	e9d0 3100 	ldrd	r3, r1, [r0]
c0de9a68:	6882      	ldr	r2, [r0, #8]
c0de9a6a:	4618      	mov	r0, r3
c0de9a6c:	b012      	add	sp, #72	@ 0x48
c0de9a6e:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9a72:	f000 be8b 	b.w	c0dea78c <displayFullValuePage>
c0de9a76:	eb09 0002 	add.w	r0, r9, r2
c0de9a7a:	f890 0069 	ldrb.w	r0, [r0, #105]	@ 0x69
c0de9a7e:	b120      	cbz	r0, c0de9a8a <pageCallback+0x366>
c0de9a80:	6948      	ldr	r0, [r1, #20]
c0de9a82:	e003      	b.n	c0de9a8c <pageCallback+0x368>
c0de9a84:	b938      	cbnz	r0, c0de9a96 <pageCallback+0x372>
c0de9a86:	4620      	mov	r0, r4
c0de9a88:	e693      	b.n	c0de97b2 <pageCallback+0x8e>
c0de9a8a:	6988      	ldr	r0, [r1, #24]
c0de9a8c:	b012      	add	sp, #72	@ 0x48
c0de9a8e:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9a92:	f001 b863 	b.w	c0deab5c <displayCustomizedSecurityReport>
c0de9a96:	4620      	mov	r0, r4
c0de9a98:	2100      	movs	r1, #0
c0de9a9a:	b012      	add	sp, #72	@ 0x48
c0de9a9c:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9aa0:	f7ff ba30 	b.w	c0de8f04 <displaySettingsPage>
c0de9aa4:	0000191c 	.word	0x0000191c
c0de9aa8:	00001c64 	.word	0x00001c64
c0de9aac:	00001be8 	.word	0x00001be8
c0de9ab0:	00001a30 	.word	0x00001a30
c0de9ab4:	00001b68 	.word	0x00001b68
c0de9ab8:	00006068 	.word	0x00006068
c0de9abc:	00005fe0 	.word	0x00005fe0
c0de9ac0:	000041b0 	.word	0x000041b0
c0de9ac4:	00006046 	.word	0x00006046
c0de9ac8:	00000407 	.word	0x00000407

c0de9acc <nbgl_useCaseReviewStatus>:
c0de9acc:	460a      	mov	r2, r1
c0de9ace:	b198      	cbz	r0, c0de9af8 <nbgl_useCaseReviewStatus+0x2c>
c0de9ad0:	2801      	cmp	r0, #1
c0de9ad2:	d016      	beq.n	c0de9b02 <nbgl_useCaseReviewStatus+0x36>
c0de9ad4:	2802      	cmp	r0, #2
c0de9ad6:	d019      	beq.n	c0de9b0c <nbgl_useCaseReviewStatus+0x40>
c0de9ad8:	2803      	cmp	r0, #3
c0de9ada:	d01c      	beq.n	c0de9b16 <nbgl_useCaseReviewStatus+0x4a>
c0de9adc:	2804      	cmp	r0, #4
c0de9ade:	d01f      	beq.n	c0de9b20 <nbgl_useCaseReviewStatus+0x54>
c0de9ae0:	2807      	cmp	r0, #7
c0de9ae2:	d022      	beq.n	c0de9b2a <nbgl_useCaseReviewStatus+0x5e>
c0de9ae4:	2806      	cmp	r0, #6
c0de9ae6:	d025      	beq.n	c0de9b34 <nbgl_useCaseReviewStatus+0x68>
c0de9ae8:	2805      	cmp	r0, #5
c0de9aea:	bf18      	it	ne
c0de9aec:	4770      	bxne	lr
c0de9aee:	4815      	ldr	r0, [pc, #84]	@ (c0de9b44 <nbgl_useCaseReviewStatus+0x78>)
c0de9af0:	2100      	movs	r1, #0
c0de9af2:	4478      	add	r0, pc
c0de9af4:	f7ff bdb2 	b.w	c0de965c <nbgl_useCaseStatus>
c0de9af8:	4813      	ldr	r0, [pc, #76]	@ (c0de9b48 <nbgl_useCaseReviewStatus+0x7c>)
c0de9afa:	2101      	movs	r1, #1
c0de9afc:	4478      	add	r0, pc
c0de9afe:	f7ff bdad 	b.w	c0de965c <nbgl_useCaseStatus>
c0de9b02:	4812      	ldr	r0, [pc, #72]	@ (c0de9b4c <nbgl_useCaseReviewStatus+0x80>)
c0de9b04:	2100      	movs	r1, #0
c0de9b06:	4478      	add	r0, pc
c0de9b08:	f7ff bda8 	b.w	c0de965c <nbgl_useCaseStatus>
c0de9b0c:	4810      	ldr	r0, [pc, #64]	@ (c0de9b50 <nbgl_useCaseReviewStatus+0x84>)
c0de9b0e:	2101      	movs	r1, #1
c0de9b10:	4478      	add	r0, pc
c0de9b12:	f7ff bda3 	b.w	c0de965c <nbgl_useCaseStatus>
c0de9b16:	480f      	ldr	r0, [pc, #60]	@ (c0de9b54 <nbgl_useCaseReviewStatus+0x88>)
c0de9b18:	2100      	movs	r1, #0
c0de9b1a:	4478      	add	r0, pc
c0de9b1c:	f7ff bd9e 	b.w	c0de965c <nbgl_useCaseStatus>
c0de9b20:	4807      	ldr	r0, [pc, #28]	@ (c0de9b40 <nbgl_useCaseReviewStatus+0x74>)
c0de9b22:	2101      	movs	r1, #1
c0de9b24:	4478      	add	r0, pc
c0de9b26:	f7ff bd99 	b.w	c0de965c <nbgl_useCaseStatus>
c0de9b2a:	480c      	ldr	r0, [pc, #48]	@ (c0de9b5c <nbgl_useCaseReviewStatus+0x90>)
c0de9b2c:	2100      	movs	r1, #0
c0de9b2e:	4478      	add	r0, pc
c0de9b30:	f7ff bd94 	b.w	c0de965c <nbgl_useCaseStatus>
c0de9b34:	4808      	ldr	r0, [pc, #32]	@ (c0de9b58 <nbgl_useCaseReviewStatus+0x8c>)
c0de9b36:	2101      	movs	r1, #1
c0de9b38:	4478      	add	r0, pc
c0de9b3a:	f7ff bd8f 	b.w	c0de965c <nbgl_useCaseStatus>
c0de9b3e:	bf00      	nop
c0de9b40:	00003e16 	.word	0x00003e16
c0de9b44:	00003ec7 	.word	0x00003ec7
c0de9b48:	00003ff3 	.word	0x00003ff3
c0de9b4c:	000045f3 	.word	0x000045f3
c0de9b50:	000040c1 	.word	0x000040c1
c0de9b54:	00004429 	.word	0x00004429
c0de9b58:	00003f51 	.word	0x00003f51
c0de9b5c:	00003e1d 	.word	0x00003e1d

c0de9b60 <nbgl_useCaseChoice>:
c0de9b60:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9b64:	b088      	sub	sp, #32
c0de9b66:	4683      	mov	fp, r0
c0de9b68:	4668      	mov	r0, sp
c0de9b6a:	460e      	mov	r6, r1
c0de9b6c:	2118      	movs	r1, #24
c0de9b6e:	461c      	mov	r4, r3
c0de9b70:	4617      	mov	r7, r2
c0de9b72:	3008      	adds	r0, #8
c0de9b74:	f002 fc5a 	bl	c0dec42c <__aeabi_memclr>
c0de9b78:	b324      	cbz	r4, c0de9bc4 <nbgl_useCaseChoice+0x64>
c0de9b7a:	f8dd 8040 	ldr.w	r8, [sp, #64]	@ 0x40
c0de9b7e:	f1b8 0f00 	cmp.w	r8, #0
c0de9b82:	d01f      	beq.n	c0de9bc4 <nbgl_useCaseChoice+0x64>
c0de9b84:	4811      	ldr	r0, [pc, #68]	@ (c0de9bcc <nbgl_useCaseChoice+0x6c>)
c0de9b86:	f8dd a044 	ldr.w	sl, [sp, #68]	@ 0x44
c0de9b8a:	eb09 0500 	add.w	r5, r9, r0
c0de9b8e:	f7ff f967 	bl	c0de8e60 <reset_callbacks_and_context>
c0de9b92:	2000      	movs	r0, #0
c0de9b94:	f8c5 a018 	str.w	sl, [r5, #24]
c0de9b98:	e9cd 6700 	strd	r6, r7, [sp]
c0de9b9c:	f8cd 8018 	str.w	r8, [sp, #24]
c0de9ba0:	9405      	str	r4, [sp, #20]
c0de9ba2:	f8cd b00c 	str.w	fp, [sp, #12]
c0de9ba6:	4669      	mov	r1, sp
c0de9ba8:	f88d 0011 	strb.w	r0, [sp, #17]
c0de9bac:	2009      	movs	r0, #9
c0de9bae:	f88d 001e 	strb.w	r0, [sp, #30]
c0de9bb2:	f88d 001c 	strb.w	r0, [sp, #28]
c0de9bb6:	4806      	ldr	r0, [pc, #24]	@ (c0de9bd0 <nbgl_useCaseChoice+0x70>)
c0de9bb8:	4478      	add	r0, pc
c0de9bba:	f7fe fcd3 	bl	c0de8564 <nbgl_pageDrawConfirmation>
c0de9bbe:	6168      	str	r0, [r5, #20]
c0de9bc0:	f001 fb4c 	bl	c0deb25c <OUTLINED_FUNCTION_3>
c0de9bc4:	b008      	add	sp, #32
c0de9bc6:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de9bca:	bf00      	nop
c0de9bcc:	00001be8 	.word	0x00001be8
c0de9bd0:	fffffb69 	.word	0xfffffb69

c0de9bd4 <nbgl_useCaseConfirm>:
c0de9bd4:	b570      	push	{r4, r5, r6, lr}
c0de9bd6:	b088      	sub	sp, #32
c0de9bd8:	4c0f      	ldr	r4, [pc, #60]	@ (c0de9c18 <nbgl_useCaseConfirm+0x44>)
c0de9bda:	9e0c      	ldr	r6, [sp, #48]	@ 0x30
c0de9bdc:	f10d 0c14 	add.w	ip, sp, #20
c0de9be0:	eb09 0504 	add.w	r5, r9, r4
c0de9be4:	61ee      	str	r6, [r5, #28]
c0de9be6:	4e0d      	ldr	r6, [pc, #52]	@ (c0de9c1c <nbgl_useCaseConfirm+0x48>)
c0de9be8:	e8ac 004c 	stmia.w	ip!, {r2, r3, r6}
c0de9bec:	2200      	movs	r2, #0
c0de9bee:	9204      	str	r2, [sp, #16]
c0de9bf0:	4b0b      	ldr	r3, [pc, #44]	@ (c0de9c20 <nbgl_useCaseConfirm+0x4c>)
c0de9bf2:	447b      	add	r3, pc
c0de9bf4:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0de9bf8:	6a28      	ldr	r0, [r5, #32]
c0de9bfa:	b108      	cbz	r0, c0de9c00 <nbgl_useCaseConfirm+0x2c>
c0de9bfc:	f7fe ff15 	bl	c0de8a2a <nbgl_pageRelease>
c0de9c00:	4808      	ldr	r0, [pc, #32]	@ (c0de9c24 <nbgl_useCaseConfirm+0x50>)
c0de9c02:	4669      	mov	r1, sp
c0de9c04:	4478      	add	r0, pc
c0de9c06:	f7fe fcad 	bl	c0de8564 <nbgl_pageDrawConfirmation>
c0de9c0a:	eb09 0104 	add.w	r1, r9, r4
c0de9c0e:	6208      	str	r0, [r1, #32]
c0de9c10:	f001 fb24 	bl	c0deb25c <OUTLINED_FUNCTION_3>
c0de9c14:	b008      	add	sp, #32
c0de9c16:	bd70      	pop	{r4, r5, r6, pc}
c0de9c18:	00001be8 	.word	0x00001be8
c0de9c1c:	01090009 	.word	0x01090009
c0de9c20:	00003268 	.word	0x00003268
c0de9c24:	00000021 	.word	0x00000021

c0de9c28 <pageModalCallback>:
c0de9c28:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de9c2a:	460c      	mov	r4, r1
c0de9c2c:	280e      	cmp	r0, #14
c0de9c2e:	d008      	beq.n	c0de9c42 <pageModalCallback+0x1a>
c0de9c30:	4605      	mov	r5, r0
c0de9c32:	280f      	cmp	r0, #15
c0de9c34:	d117      	bne.n	c0de9c66 <pageModalCallback+0x3e>
c0de9c36:	4833      	ldr	r0, [pc, #204]	@ (c0de9d04 <pageModalCallback+0xdc>)
c0de9c38:	4448      	add	r0, r9
c0de9c3a:	e9d0 2104 	ldrd	r2, r1, [r0, #16]
c0de9c3e:	6983      	ldr	r3, [r0, #24]
c0de9c40:	e005      	b.n	c0de9c4e <pageModalCallback+0x26>
c0de9c42:	482f      	ldr	r0, [pc, #188]	@ (c0de9d00 <pageModalCallback+0xd8>)
c0de9c44:	4448      	add	r0, r9
c0de9c46:	6b40      	ldr	r0, [r0, #52]	@ 0x34
c0de9c48:	e9d0 2100 	ldrd	r2, r1, [r0]
c0de9c4c:	6883      	ldr	r3, [r0, #8]
c0de9c4e:	f852 0024 	ldr.w	r0, [r2, r4, lsl #2]
c0de9c52:	eb04 0244 	add.w	r2, r4, r4, lsl #1
c0de9c56:	f851 1024 	ldr.w	r1, [r1, r4, lsl #2]
c0de9c5a:	eb03 02c2 	add.w	r2, r3, r2, lsl #3
c0de9c5e:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de9c62:	f000 bd93 	b.w	c0dea78c <displayFullValuePage>
c0de9c66:	4e28      	ldr	r6, [pc, #160]	@ (c0de9d08 <pageModalCallback+0xe0>)
c0de9c68:	eb09 0706 	add.w	r7, r9, r6
c0de9c6c:	6a38      	ldr	r0, [r7, #32]
c0de9c6e:	f7fe fedc 	bl	c0de8a2a <nbgl_pageRelease>
c0de9c72:	2000      	movs	r0, #0
c0de9c74:	2d02      	cmp	r5, #2
c0de9c76:	6238      	str	r0, [r7, #32]
c0de9c78:	d032      	beq.n	c0de9ce0 <pageModalCallback+0xb8>
c0de9c7a:	2d13      	cmp	r5, #19
c0de9c7c:	d00f      	beq.n	c0de9c9e <pageModalCallback+0x76>
c0de9c7e:	2d04      	cmp	r5, #4
c0de9c80:	d01e      	beq.n	c0de9cc0 <pageModalCallback+0x98>
c0de9c82:	2d05      	cmp	r5, #5
c0de9c84:	d024      	beq.n	c0de9cd0 <pageModalCallback+0xa8>
c0de9c86:	2d09      	cmp	r5, #9
c0de9c88:	d029      	beq.n	c0de9cde <pageModalCallback+0xb6>
c0de9c8a:	2d03      	cmp	r5, #3
c0de9c8c:	d137      	bne.n	c0de9cfe <pageModalCallback+0xd6>
c0de9c8e:	2cff      	cmp	r4, #255	@ 0xff
c0de9c90:	d026      	beq.n	c0de9ce0 <pageModalCallback+0xb8>
c0de9c92:	4620      	mov	r0, r4
c0de9c94:	2100      	movs	r1, #0
c0de9c96:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de9c9a:	f001 b88b 	b.w	c0deadb4 <displayDetailsPage>
c0de9c9e:	4818      	ldr	r0, [pc, #96]	@ (c0de9d00 <pageModalCallback+0xd8>)
c0de9ca0:	eb09 0100 	add.w	r1, r9, r0
c0de9ca4:	f891 1068 	ldrb.w	r1, [r1, #104]	@ 0x68
c0de9ca8:	2902      	cmp	r1, #2
c0de9caa:	d119      	bne.n	c0de9ce0 <pageModalCallback+0xb8>
c0de9cac:	4448      	add	r0, r9
c0de9cae:	2101      	movs	r1, #1
c0de9cb0:	f880 1068 	strb.w	r1, [r0, #104]	@ 0x68
c0de9cb4:	6d80      	ldr	r0, [r0, #88]	@ 0x58
c0de9cb6:	6800      	ldr	r0, [r0, #0]
c0de9cb8:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de9cbc:	f000 be44 	b.w	c0dea948 <displaySecurityReport>
c0de9cc0:	2cff      	cmp	r4, #255	@ 0xff
c0de9cc2:	d00d      	beq.n	c0de9ce0 <pageModalCallback+0xb8>
c0de9cc4:	4620      	mov	r0, r4
c0de9cc6:	2100      	movs	r1, #0
c0de9cc8:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de9ccc:	f001 b92c 	b.w	c0deaf28 <displayTagValueListModalPage>
c0de9cd0:	b934      	cbnz	r4, c0de9ce0 <pageModalCallback+0xb8>
c0de9cd2:	20ff      	movs	r0, #255	@ 0xff
c0de9cd4:	2101      	movs	r1, #1
c0de9cd6:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de9cda:	f7ff ba59 	b.w	c0de9190 <displayGenericContextPage>
c0de9cde:	b12c      	cbz	r4, c0de9cec <pageModalCallback+0xc4>
c0de9ce0:	f001 ff8d 	bl	c0debbfe <nbgl_screenRedraw>
c0de9ce4:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de9ce8:	f001 bf61 	b.w	c0debbae <nbgl_refresh>
c0de9cec:	eb09 0006 	add.w	r0, r9, r6
c0de9cf0:	69c0      	ldr	r0, [r0, #28]
c0de9cf2:	b120      	cbz	r0, c0de9cfe <pageModalCallback+0xd6>
c0de9cf4:	4780      	blx	r0
c0de9cf6:	eb09 0006 	add.w	r0, r9, r6
c0de9cfa:	2100      	movs	r1, #0
c0de9cfc:	61c1      	str	r1, [r0, #28]
c0de9cfe:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de9d00:	0000191c 	.word	0x0000191c
c0de9d04:	00001c64 	.word	0x00001c64
c0de9d08:	00001be8 	.word	0x00001be8

c0de9d0c <displayReviewPage>:
c0de9d0c:	b570      	push	{r4, r5, r6, lr}
c0de9d0e:	b090      	sub	sp, #64	@ 0x40
c0de9d10:	460c      	mov	r4, r1
c0de9d12:	4605      	mov	r5, r0
c0de9d14:	4668      	mov	r0, sp
c0de9d16:	2140      	movs	r1, #64	@ 0x40
c0de9d18:	f002 fb88 	bl	c0dec42c <__aeabi_memclr>
c0de9d1c:	4e24      	ldr	r6, [pc, #144]	@ (c0de9db0 <displayReviewPage+0xa4>)
c0de9d1e:	eb09 0006 	add.w	r0, r9, r6
c0de9d22:	f890 0061 	ldrb.w	r0, [r0, #97]	@ 0x61
c0de9d26:	b108      	cbz	r0, c0de9d2c <displayReviewPage+0x20>
c0de9d28:	42a8      	cmp	r0, r5
c0de9d2a:	d93f      	bls.n	c0de9dac <displayReviewPage+0xa0>
c0de9d2c:	eb09 0006 	add.w	r0, r9, r6
c0de9d30:	6882      	ldr	r2, [r0, #8]
c0de9d32:	f880 5060 	strb.w	r5, [r0, #96]	@ 0x60
c0de9d36:	b3ca      	cbz	r2, c0de9dac <displayReviewPage+0xa0>
c0de9d38:	4669      	mov	r1, sp
c0de9d3a:	4628      	mov	r0, r5
c0de9d3c:	4790      	blx	r2
c0de9d3e:	b3a8      	cbz	r0, c0de9dac <displayReviewPage+0xa0>
c0de9d40:	2009      	movs	r0, #9
c0de9d42:	2100      	movs	r1, #0
c0de9d44:	f88d 0006 	strb.w	r0, [sp, #6]
c0de9d48:	f89d 000c 	ldrb.w	r0, [sp, #12]
c0de9d4c:	f88d 1004 	strb.w	r1, [sp, #4]
c0de9d50:	9100      	str	r1, [sp, #0]
c0de9d52:	2806      	cmp	r0, #6
c0de9d54:	d00e      	beq.n	c0de9d74 <displayReviewPage+0x68>
c0de9d56:	2804      	cmp	r0, #4
c0de9d58:	d015      	beq.n	c0de9d86 <displayReviewPage+0x7a>
c0de9d5a:	2805      	cmp	r0, #5
c0de9d5c:	d010      	beq.n	c0de9d80 <displayReviewPage+0x74>
c0de9d5e:	2802      	cmp	r0, #2
c0de9d60:	d114      	bne.n	c0de9d8c <displayReviewPage+0x80>
c0de9d62:	eb09 0006 	add.w	r0, r9, r6
c0de9d66:	f890 1060 	ldrb.w	r1, [r0, #96]	@ 0x60
c0de9d6a:	3101      	adds	r1, #1
c0de9d6c:	f880 1061 	strb.w	r1, [r0, #97]	@ 0x61
c0de9d70:	200b      	movs	r0, #11
c0de9d72:	e009      	b.n	c0de9d88 <displayReviewPage+0x7c>
c0de9d74:	200b      	movs	r0, #11
c0de9d76:	f88d 101c 	strb.w	r1, [sp, #28]
c0de9d7a:	f88d 0038 	strb.w	r0, [sp, #56]	@ 0x38
c0de9d7e:	e005      	b.n	c0de9d8c <displayReviewPage+0x80>
c0de9d80:	2009      	movs	r0, #9
c0de9d82:	f88d 001a 	strb.w	r0, [sp, #26]
c0de9d86:	2000      	movs	r0, #0
c0de9d88:	f88d 001c 	strb.w	r0, [sp, #28]
c0de9d8c:	4809      	ldr	r0, [pc, #36]	@ (c0de9db4 <displayReviewPage+0xa8>)
c0de9d8e:	eb09 0506 	add.w	r5, r9, r6
c0de9d92:	466a      	mov	r2, sp
c0de9d94:	f105 0160 	add.w	r1, r5, #96	@ 0x60
c0de9d98:	4478      	add	r0, pc
c0de9d9a:	f7fe fe43 	bl	c0de8a24 <nbgl_pageDrawGenericContent>
c0de9d9e:	6168      	str	r0, [r5, #20]
c0de9da0:	2001      	movs	r0, #1
c0de9da2:	2c00      	cmp	r4, #0
c0de9da4:	bf18      	it	ne
c0de9da6:	2002      	movne	r0, #2
c0de9da8:	f001 ff06 	bl	c0debbb8 <nbgl_refreshSpecial>
c0de9dac:	b010      	add	sp, #64	@ 0x40
c0de9dae:	bd70      	pop	{r4, r5, r6, pc}
c0de9db0:	00001be8 	.word	0x00001be8
c0de9db4:	fffff989 	.word	0xfffff989

c0de9db8 <nbgl_useCaseReview>:
c0de9db8:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de9dba:	b087      	sub	sp, #28
c0de9dbc:	461c      	mov	r4, r3
c0de9dbe:	f001 fa3d 	bl	c0deb23c <OUTLINED_FUNCTION_0>
c0de9dc2:	2001      	movs	r0, #1
c0de9dc4:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de9dc6:	462a      	mov	r2, r5
c0de9dc8:	4623      	mov	r3, r4
c0de9dca:	9005      	str	r0, [sp, #20]
c0de9dcc:	2000      	movs	r0, #0
c0de9dce:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de9dd2:	9004      	str	r0, [sp, #16]
c0de9dd4:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de9dd6:	4631      	mov	r1, r6
c0de9dd8:	f001 fa52 	bl	c0deb280 <OUTLINED_FUNCTION_7>
c0de9ddc:	b007      	add	sp, #28
c0de9dde:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de9de0 <useCaseReview>:
c0de9de0:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de9de4:	4682      	mov	sl, r0
c0de9de6:	4840      	ldr	r0, [pc, #256]	@ (c0de9ee8 <useCaseReview+0x108>)
c0de9de8:	4688      	mov	r8, r1
c0de9dea:	2102      	movs	r1, #2
c0de9dec:	4614      	mov	r4, r2
c0de9dee:	f04f 0b00 	mov.w	fp, #0
c0de9df2:	4e40      	ldr	r6, [pc, #256]	@ (c0de9ef4 <useCaseReview+0x114>)
c0de9df4:	461f      	mov	r7, r3
c0de9df6:	f809 1000 	strb.w	r1, [r9, r0]
c0de9dfa:	493c      	ldr	r1, [pc, #240]	@ (c0de9eec <useCaseReview+0x10c>)
c0de9dfc:	4448      	add	r0, r9
c0de9dfe:	eb09 0506 	add.w	r5, r9, r6
c0de9e02:	9a0d      	ldr	r2, [sp, #52]	@ 0x34
c0de9e04:	4449      	add	r1, r9
c0de9e06:	e9c1 a208 	strd	sl, r2, [r1, #32]
c0de9e0a:	493b      	ldr	r1, [pc, #236]	@ (c0de9ef8 <useCaseReview+0x118>)
c0de9e0c:	f8c0 b010 	str.w	fp, [r0, #16]
c0de9e10:	4479      	add	r1, pc
c0de9e12:	6181      	str	r1, [r0, #24]
c0de9e14:	4836      	ldr	r0, [pc, #216]	@ (c0de9ef0 <useCaseReview+0x110>)
c0de9e16:	2103      	movs	r1, #3
c0de9e18:	4448      	add	r0, r9
c0de9e1a:	7301      	strb	r1, [r0, #12]
c0de9e1c:	6085      	str	r5, [r0, #8]
c0de9e1e:	4628      	mov	r0, r5
c0de9e20:	21a8      	movs	r1, #168	@ 0xa8
c0de9e22:	f002 fb03 	bl	c0dec42c <__aeabi_memclr>
c0de9e26:	2001      	movs	r0, #1
c0de9e28:	f8a5 b024 	strh.w	fp, [r5, #36]	@ 0x24
c0de9e2c:	f809 0006 	strb.w	r0, [r9, r6]
c0de9e30:	4832      	ldr	r0, [pc, #200]	@ (c0de9efc <useCaseReview+0x11c>)
c0de9e32:	4478      	add	r0, pc
c0de9e34:	6228      	str	r0, [r5, #32]
c0de9e36:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de9e38:	616f      	str	r7, [r5, #20]
c0de9e3a:	9401      	str	r4, [sp, #4]
c0de9e3c:	60ac      	str	r4, [r5, #8]
c0de9e3e:	f885 b004 	strb.w	fp, [r5, #4]
c0de9e42:	61e8      	str	r0, [r5, #28]
c0de9e44:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de9e46:	f001 f915 	bl	c0deb074 <initWarningTipBox>
c0de9e4a:	2004      	movs	r0, #4
c0de9e4c:	4641      	mov	r1, r8
c0de9e4e:	f885 0038 	strb.w	r0, [r5, #56]	@ 0x38
c0de9e52:	f105 003c 	add.w	r0, r5, #60	@ 0x3c
c0de9e56:	e891 00dc 	ldmia.w	r1, {r2, r3, r4, r6, r7}
c0de9e5a:	c0dc      	stmia	r0!, {r2, r3, r4, r6, r7}
c0de9e5c:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de9e60:	66e8      	str	r0, [r5, #108]	@ 0x6c
c0de9e62:	e9dd 050e 	ldrd	r0, r5, [sp, #56]	@ 0x38
c0de9e66:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
c0de9e68:	b190      	cbz	r0, c0de9e90 <useCaseReview+0xb0>
c0de9e6a:	4922      	ldr	r1, [pc, #136]	@ (c0de9ef4 <useCaseReview+0x114>)
c0de9e6c:	2203      	movs	r2, #3
c0de9e6e:	eb09 0001 	add.w	r0, r9, r1
c0de9e72:	f880 2070 	strb.w	r2, [r0, #112]	@ 0x70
c0de9e76:	9a01      	ldr	r2, [sp, #4]
c0de9e78:	b343      	cbz	r3, c0de9ecc <useCaseReview+0xec>
c0de9e7a:	eb09 0001 	add.w	r0, r9, r1
c0de9e7e:	210b      	movs	r1, #11
c0de9e80:	f880 1080 	strb.w	r1, [r0, #128]	@ 0x80
c0de9e84:	4921      	ldr	r1, [pc, #132]	@ (c0de9f0c <useCaseReview+0x12c>)
c0de9e86:	e9c0 321d 	strd	r3, r2, [r0, #116]	@ 0x74
c0de9e8a:	4479      	add	r1, pc
c0de9e8c:	67c1      	str	r1, [r0, #124]	@ 0x7c
c0de9e8e:	e00a      	b.n	c0de9ea6 <useCaseReview+0xc6>
c0de9e90:	4818      	ldr	r0, [pc, #96]	@ (c0de9ef4 <useCaseReview+0x114>)
c0de9e92:	2102      	movs	r1, #2
c0de9e94:	9a01      	ldr	r2, [sp, #4]
c0de9e96:	4448      	add	r0, r9
c0de9e98:	f880 1070 	strb.w	r1, [r0, #112]	@ 0x70
c0de9e9c:	f100 0174 	add.w	r1, r0, #116	@ 0x74
c0de9ea0:	4650      	mov	r0, sl
c0de9ea2:	f000 fa07 	bl	c0dea2b4 <prepareReviewLastPage>
c0de9ea6:	f3ca 1000 	ubfx	r0, sl, #4, #1
c0de9eaa:	f7ff f8b7 	bl	c0de901c <getNbPagesForGenericContents>
c0de9eae:	4a18      	ldr	r2, [pc, #96]	@ (c0de9f10 <useCaseReview+0x130>)
c0de9eb0:	4601      	mov	r1, r0
c0de9eb2:	2001      	movs	r0, #1
c0de9eb4:	447a      	add	r2, pc
c0de9eb6:	f7fe ffe9 	bl	c0de8e8c <prepareNavInfo>
c0de9eba:	b10d      	cbz	r5, c0de9ec0 <useCaseReview+0xe0>
c0de9ebc:	f001 f9dd 	bl	c0deb27a <OUTLINED_FUNCTION_6>
c0de9ec0:	2000      	movs	r0, #0
c0de9ec2:	2101      	movs	r1, #1
c0de9ec4:	e8bd 4dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de9ec8:	f7ff b962 	b.w	c0de9190 <displayGenericContextPage>
c0de9ecc:	f01a 0007 	ands.w	r0, sl, #7
c0de9ed0:	d004      	beq.n	c0de9edc <useCaseReview+0xfc>
c0de9ed2:	2801      	cmp	r0, #1
c0de9ed4:	d105      	bne.n	c0de9ee2 <useCaseReview+0x102>
c0de9ed6:	4b0b      	ldr	r3, [pc, #44]	@ (c0de9f04 <useCaseReview+0x124>)
c0de9ed8:	447b      	add	r3, pc
c0de9eda:	e7ce      	b.n	c0de9e7a <useCaseReview+0x9a>
c0de9edc:	4b08      	ldr	r3, [pc, #32]	@ (c0de9f00 <useCaseReview+0x120>)
c0de9ede:	447b      	add	r3, pc
c0de9ee0:	e7cb      	b.n	c0de9e7a <useCaseReview+0x9a>
c0de9ee2:	4b09      	ldr	r3, [pc, #36]	@ (c0de9f08 <useCaseReview+0x128>)
c0de9ee4:	447b      	add	r3, pc
c0de9ee6:	e7c8      	b.n	c0de9e7a <useCaseReview+0x9a>
c0de9ee8:	00001be8 	.word	0x00001be8
c0de9eec:	00001c64 	.word	0x00001c64
c0de9ef0:	0000191c 	.word	0x0000191c
c0de9ef4:	00001988 	.word	0x00001988
c0de9ef8:	0000123d 	.word	0x0000123d
c0de9efc:	000043c4 	.word	0x000043c4
c0de9f00:	00003d08 	.word	0x00003d08
c0de9f04:	00003cdd 	.word	0x00003cdd
c0de9f08:	00004256 	.word	0x00004256
c0de9f0c:	00003afe 	.word	0x00003afe
c0de9f10:	00003b18 	.word	0x00003b18

c0de9f14 <nbgl_useCaseReviewBlindSigning>:
c0de9f14:	b510      	push	{r4, lr}
c0de9f16:	b086      	sub	sp, #24
c0de9f18:	9c0b      	ldr	r4, [sp, #44]	@ 0x2c
c0de9f1a:	9404      	str	r4, [sp, #16]
c0de9f1c:	4c06      	ldr	r4, [pc, #24]	@ (c0de9f38 <nbgl_useCaseReviewBlindSigning+0x24>)
c0de9f1e:	447c      	add	r4, pc
c0de9f20:	9403      	str	r4, [sp, #12]
c0de9f22:	9c0a      	ldr	r4, [sp, #40]	@ 0x28
c0de9f24:	9402      	str	r4, [sp, #8]
c0de9f26:	9c09      	ldr	r4, [sp, #36]	@ 0x24
c0de9f28:	9401      	str	r4, [sp, #4]
c0de9f2a:	9c08      	ldr	r4, [sp, #32]
c0de9f2c:	9400      	str	r4, [sp, #0]
c0de9f2e:	f000 f805 	bl	c0de9f3c <nbgl_useCaseAdvancedReview>
c0de9f32:	b006      	add	sp, #24
c0de9f34:	bd10      	pop	{r4, pc}
c0de9f36:	bf00      	nop
c0de9f38:	00005872 	.word	0x00005872

c0de9f3c <nbgl_useCaseAdvancedReview>:
c0de9f3c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9f40:	b088      	sub	sp, #32
c0de9f42:	e9cd 2306 	strd	r2, r3, [sp, #24]
c0de9f46:	460e      	mov	r6, r1
c0de9f48:	4605      	mov	r5, r0
c0de9f4a:	f7fe ff89 	bl	c0de8e60 <reset_callbacks_and_context>
c0de9f4e:	f10d 0b48 	add.w	fp, sp, #72	@ 0x48
c0de9f52:	482b      	ldr	r0, [pc, #172]	@ (c0dea000 <nbgl_useCaseAdvancedReview+0xc4>)
c0de9f54:	e9dd 4810 	ldrd	r4, r8, [sp, #64]	@ 0x40
c0de9f58:	e89b 0c80 	ldmia.w	fp, {r7, sl, fp}
c0de9f5c:	4448      	add	r0, r9
c0de9f5e:	b127      	cbz	r7, c0de9f6a <nbgl_useCaseAdvancedReview+0x2e>
c0de9f60:	4639      	mov	r1, r7
c0de9f62:	2220      	movs	r2, #32
c0de9f64:	f002 fa58 	bl	c0dec418 <__aeabi_memcpy>
c0de9f68:	e002      	b.n	c0de9f70 <nbgl_useCaseAdvancedReview+0x34>
c0de9f6a:	2120      	movs	r1, #32
c0de9f6c:	f002 fa5e 	bl	c0dec42c <__aeabi_memclr>
c0de9f70:	f1ba 0f00 	cmp.w	sl, #0
c0de9f74:	d028      	beq.n	c0de9fc8 <nbgl_useCaseAdvancedReview+0x8c>
c0de9f76:	f8da 0000 	ldr.w	r0, [sl]
c0de9f7a:	b928      	cbnz	r0, c0de9f88 <nbgl_useCaseAdvancedReview+0x4c>
c0de9f7c:	f8da 1014 	ldr.w	r1, [sl, #20]
c0de9f80:	b911      	cbnz	r1, c0de9f88 <nbgl_useCaseAdvancedReview+0x4c>
c0de9f82:	f8da 1018 	ldr.w	r1, [sl, #24]
c0de9f86:	b1f9      	cbz	r1, c0de9fc8 <nbgl_useCaseAdvancedReview+0x8c>
c0de9f88:	491e      	ldr	r1, [pc, #120]	@ (c0dea004 <nbgl_useCaseAdvancedReview+0xc8>)
c0de9f8a:	2200      	movs	r2, #0
c0de9f8c:	4449      	add	r1, r9
c0de9f8e:	f881 203c 	strb.w	r2, [r1, #60]	@ 0x3c
c0de9f92:	2240      	movs	r2, #64	@ 0x40
c0de9f94:	2808      	cmp	r0, #8
c0de9f96:	bf08      	it	eq
c0de9f98:	2280      	moveq	r2, #128	@ 0x80
c0de9f9a:	ea42 0005 	orr.w	r0, r2, r5
c0de9f9e:	9d06      	ldr	r5, [sp, #24]
c0de9fa0:	9b07      	ldr	r3, [sp, #28]
c0de9fa2:	e9c1 0610 	strd	r0, r6, [r1, #64]	@ 0x40
c0de9fa6:	648d      	str	r5, [r1, #72]	@ 0x48
c0de9fa8:	314c      	adds	r1, #76	@ 0x4c
c0de9faa:	e881 0d18 	stmia.w	r1, {r3, r4, r8, sl, fp}
c0de9fae:	f89a 1000 	ldrb.w	r1, [sl]
c0de9fb2:	f011 0f16 	tst.w	r1, #22
c0de9fb6:	d102      	bne.n	c0de9fbe <nbgl_useCaseAdvancedReview+0x82>
c0de9fb8:	f8da 1014 	ldr.w	r1, [sl, #20]
c0de9fbc:	b1a9      	cbz	r1, c0de9fea <nbgl_useCaseAdvancedReview+0xae>
c0de9fbe:	b008      	add	sp, #32
c0de9fc0:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9fc4:	f000 b820 	b.w	c0dea008 <displayInitialWarning>
c0de9fc8:	2001      	movs	r0, #1
c0de9fca:	2100      	movs	r1, #0
c0de9fcc:	e9cd 4800 	strd	r4, r8, [sp]
c0de9fd0:	e9cd 7b02 	strd	r7, fp, [sp, #8]
c0de9fd4:	e9cd 1004 	strd	r1, r0, [sp, #16]
c0de9fd8:	4628      	mov	r0, r5
c0de9fda:	4631      	mov	r1, r6
c0de9fdc:	e9dd 2306 	ldrd	r2, r3, [sp, #24]
c0de9fe0:	f7ff fefe 	bl	c0de9de0 <useCaseReview>
c0de9fe4:	b008      	add	sp, #32
c0de9fe6:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de9fea:	2101      	movs	r1, #1
c0de9fec:	2200      	movs	r2, #0
c0de9fee:	e9cd 4800 	strd	r4, r8, [sp]
c0de9ff2:	e9cd 7b02 	strd	r7, fp, [sp, #8]
c0de9ff6:	e9cd 2104 	strd	r2, r1, [sp, #16]
c0de9ffa:	4631      	mov	r1, r6
c0de9ffc:	462a      	mov	r2, r5
c0de9ffe:	e7ef      	b.n	c0de9fe0 <nbgl_useCaseAdvancedReview+0xa4>
c0dea000:	00001c64 	.word	0x00001c64
c0dea004:	0000191c 	.word	0x0000191c

c0dea008 <displayInitialWarning>:
c0dea008:	b5f0      	push	{r4, r5, r6, r7, lr}
c0dea00a:	b099      	sub	sp, #100	@ 0x64
c0dea00c:	4857      	ldr	r0, [pc, #348]	@ (c0dea16c <displayInitialWarning+0x164>)
c0dea00e:	a90e      	add	r1, sp, #56	@ 0x38
c0dea010:	4478      	add	r0, pc
c0dea012:	e890 003c 	ldmia.w	r0, {r2, r3, r4, r5}
c0dea016:	c13c      	stmia	r1!, {r2, r3, r4, r5}
c0dea018:	4855      	ldr	r0, [pc, #340]	@ (c0dea170 <displayInitialWarning+0x168>)
c0dea01a:	ac0a      	add	r4, sp, #40	@ 0x28
c0dea01c:	4621      	mov	r1, r4
c0dea01e:	4478      	add	r0, pc
c0dea020:	e890 006c 	ldmia.w	r0, {r2, r3, r5, r6}
c0dea024:	c16c      	stmia	r1!, {r2, r3, r5, r6}
c0dea026:	4d4f      	ldr	r5, [pc, #316]	@ (c0dea164 <displayInitialWarning+0x15c>)
c0dea028:	eb09 0705 	add.w	r7, r9, r5
c0dea02c:	6db8      	ldr	r0, [r7, #88]	@ 0x58
c0dea02e:	6806      	ldr	r6, [r0, #0]
c0dea030:	2001      	movs	r0, #1
c0dea032:	f887 0069 	strb.w	r0, [r7, #105]	@ 0x69
c0dea036:	484f      	ldr	r0, [pc, #316]	@ (c0dea174 <displayInitialWarning+0x16c>)
c0dea038:	4478      	add	r0, pc
c0dea03a:	9015      	str	r0, [sp, #84]	@ 0x54
c0dea03c:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0dea040:	f8ad 0048 	strh.w	r0, [sp, #72]	@ 0x48
c0dea044:	2000      	movs	r0, #0
c0dea046:	9016      	str	r0, [sp, #88]	@ 0x58
c0dea048:	9013      	str	r0, [sp, #76]	@ 0x4c
c0dea04a:	a812      	add	r0, sp, #72	@ 0x48
c0dea04c:	f7fa f9ba 	bl	c0de43c4 <nbgl_layoutGet>
c0dea050:	4621      	mov	r1, r4
c0dea052:	6638      	str	r0, [r7, #96]	@ 0x60
c0dea054:	f7fc ff4e 	bl	c0de6ef4 <nbgl_layoutAddHeader>
c0dea058:	6db8      	ldr	r0, [r7, #88]	@ 0x58
c0dea05a:	f026 0409 	bic.w	r4, r6, #9
c0dea05e:	6801      	ldr	r1, [r0, #0]
c0dea060:	b139      	cbz	r1, c0dea072 <displayInitialWarning+0x6a>
c0dea062:	4845      	ldr	r0, [pc, #276]	@ (c0dea178 <displayInitialWarning+0x170>)
c0dea064:	4945      	ldr	r1, [pc, #276]	@ (c0dea17c <displayInitialWarning+0x174>)
c0dea066:	2c10      	cmp	r4, #16
c0dea068:	4479      	add	r1, pc
c0dea06a:	4478      	add	r0, pc
c0dea06c:	bf08      	it	eq
c0dea06e:	4601      	moveq	r1, r0
c0dea070:	e001      	b.n	c0dea076 <displayInitialWarning+0x6e>
c0dea072:	6a01      	ldr	r1, [r0, #32]
c0dea074:	b131      	cbz	r1, c0dea084 <displayInitialWarning+0x7c>
c0dea076:	eb09 0005 	add.w	r0, r9, r5
c0dea07a:	2211      	movs	r2, #17
c0dea07c:	2309      	movs	r3, #9
c0dea07e:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0dea080:	f7fa ff68 	bl	c0de4f54 <nbgl_layoutAddTopRightButton>
c0dea084:	eb09 0005 	add.w	r0, r9, r5
c0dea088:	6d87      	ldr	r7, [r0, #88]	@ 0x58
c0dea08a:	6838      	ldr	r0, [r7, #0]
c0dea08c:	b188      	cbz	r0, c0dea0b2 <displayInitialWarning+0xaa>
c0dea08e:	a801      	add	r0, sp, #4
c0dea090:	2124      	movs	r1, #36	@ 0x24
c0dea092:	f002 f9cb 	bl	c0dec42c <__aeabi_memclr>
c0dea096:	483a      	ldr	r0, [pc, #232]	@ (c0dea180 <displayInitialWarning+0x178>)
c0dea098:	2c10      	cmp	r4, #16
c0dea09a:	4478      	add	r0, pc
c0dea09c:	9002      	str	r0, [sp, #8]
c0dea09e:	d111      	bne.n	c0dea0c4 <displayInitialWarning+0xbc>
c0dea0a0:	4840      	ldr	r0, [pc, #256]	@ (c0dea1a4 <displayInitialWarning+0x19c>)
c0dea0a2:	2405      	movs	r4, #5
c0dea0a4:	4478      	add	r0, pc
c0dea0a6:	9005      	str	r0, [sp, #20]
c0dea0a8:	493f      	ldr	r1, [pc, #252]	@ (c0dea1a8 <displayInitialWarning+0x1a0>)
c0dea0aa:	4840      	ldr	r0, [pc, #256]	@ (c0dea1ac <displayInitialWarning+0x1a4>)
c0dea0ac:	4479      	add	r1, pc
c0dea0ae:	4478      	add	r0, pc
c0dea0b0:	e03d      	b.n	c0dea12e <displayInitialWarning+0x126>
c0dea0b2:	69f9      	ldr	r1, [r7, #28]
c0dea0b4:	b351      	cbz	r1, c0dea10c <displayInitialWarning+0x104>
c0dea0b6:	eb09 0005 	add.w	r0, r9, r5
c0dea0ba:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0dea0bc:	f7fc fab6 	bl	c0de662c <nbgl_layoutAddContentCenter>
c0dea0c0:	2408      	movs	r4, #8
c0dea0c2:	e03c      	b.n	c0dea13e <displayInitialWarning+0x136>
c0dea0c4:	4828      	ldr	r0, [pc, #160]	@ (c0dea168 <displayInitialWarning+0x160>)
c0dea0c6:	4448      	add	r0, r9
c0dea0c8:	9006      	str	r0, [sp, #24]
c0dea0ca:	68f9      	ldr	r1, [r7, #12]
c0dea0cc:	4b2d      	ldr	r3, [pc, #180]	@ (c0dea184 <displayInitialWarning+0x17c>)
c0dea0ce:	447b      	add	r3, pc
c0dea0d0:	2900      	cmp	r1, #0
c0dea0d2:	bf18      	it	ne
c0dea0d4:	460b      	movne	r3, r1
c0dea0d6:	4a2c      	ldr	r2, [pc, #176]	@ (c0dea188 <displayInitialWarning+0x180>)
c0dea0d8:	2180      	movs	r1, #128	@ 0x80
c0dea0da:	447a      	add	r2, pc
c0dea0dc:	f001 fdf2 	bl	c0debcc4 <snprintf>
c0dea0e0:	07b0      	lsls	r0, r6, #30
c0dea0e2:	d403      	bmi.n	c0dea0ec <displayInitialWarning+0xe4>
c0dea0e4:	0770      	lsls	r0, r6, #29
c0dea0e6:	d413      	bmi.n	c0dea110 <displayInitialWarning+0x108>
c0dea0e8:	2400      	movs	r4, #0
c0dea0ea:	e022      	b.n	c0dea132 <displayInitialWarning+0x12a>
c0dea0ec:	4827      	ldr	r0, [pc, #156]	@ (c0dea18c <displayInitialWarning+0x184>)
c0dea0ee:	4478      	add	r0, pc
c0dea0f0:	9005      	str	r0, [sp, #20]
c0dea0f2:	eb09 0005 	add.w	r0, r9, r5
c0dea0f6:	6d80      	ldr	r0, [r0, #88]	@ 0x58
c0dea0f8:	6901      	ldr	r1, [r0, #16]
c0dea0fa:	4825      	ldr	r0, [pc, #148]	@ (c0dea190 <displayInitialWarning+0x188>)
c0dea0fc:	4478      	add	r0, pc
c0dea0fe:	2900      	cmp	r1, #0
c0dea100:	bf18      	it	ne
c0dea102:	4608      	movne	r0, r1
c0dea104:	4923      	ldr	r1, [pc, #140]	@ (c0dea194 <displayInitialWarning+0x18c>)
c0dea106:	2405      	movs	r4, #5
c0dea108:	4479      	add	r1, pc
c0dea10a:	e010      	b.n	c0dea12e <displayInitialWarning+0x126>
c0dea10c:	2400      	movs	r4, #0
c0dea10e:	e016      	b.n	c0dea13e <displayInitialWarning+0x136>
c0dea110:	4821      	ldr	r0, [pc, #132]	@ (c0dea198 <displayInitialWarning+0x190>)
c0dea112:	4478      	add	r0, pc
c0dea114:	9005      	str	r0, [sp, #20]
c0dea116:	eb09 0005 	add.w	r0, r9, r5
c0dea11a:	6d80      	ldr	r0, [r0, #88]	@ 0x58
c0dea11c:	6901      	ldr	r1, [r0, #16]
c0dea11e:	481f      	ldr	r0, [pc, #124]	@ (c0dea19c <displayInitialWarning+0x194>)
c0dea120:	4478      	add	r0, pc
c0dea122:	2900      	cmp	r1, #0
c0dea124:	bf18      	it	ne
c0dea126:	4608      	movne	r0, r1
c0dea128:	491d      	ldr	r1, [pc, #116]	@ (c0dea1a0 <displayInitialWarning+0x198>)
c0dea12a:	2404      	movs	r4, #4
c0dea12c:	4479      	add	r1, pc
c0dea12e:	910f      	str	r1, [sp, #60]	@ 0x3c
c0dea130:	9007      	str	r0, [sp, #28]
c0dea132:	eb09 0005 	add.w	r0, r9, r5
c0dea136:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0dea138:	a901      	add	r1, sp, #4
c0dea13a:	f7fc fa77 	bl	c0de662c <nbgl_layoutAddContentCenter>
c0dea13e:	eb09 0005 	add.w	r0, r9, r5
c0dea142:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0dea144:	a90e      	add	r1, sp, #56	@ 0x38
c0dea146:	f7fc fbed 	bl	c0de6924 <nbgl_layoutAddChoiceButtons>
c0dea14a:	b114      	cbz	r4, c0dea152 <displayInitialWarning+0x14a>
c0dea14c:	4620      	mov	r0, r4
c0dea14e:	f7f9 ff31 	bl	c0de3fb4 <os_io_seph_cmd_piezo_play_tune>
c0dea152:	eb09 0005 	add.w	r0, r9, r5
c0dea156:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0dea158:	f7fd fb2e 	bl	c0de77b8 <nbgl_layoutDraw>
c0dea15c:	f001 fd27 	bl	c0debbae <nbgl_refresh>
c0dea160:	b019      	add	sp, #100	@ 0x64
c0dea162:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0dea164:	0000191c 	.word	0x0000191c
c0dea168:	00001a68 	.word	0x00001a68
c0dea16c:	000058d0 	.word	0x000058d0
c0dea170:	000057ee 	.word	0x000057ee
c0dea174:	00001155 	.word	0x00001155
c0dea178:	000032b8 	.word	0x000032b8
c0dea17c:	00003603 	.word	0x00003603
c0dea180:	00002f31 	.word	0x00002f31
c0dea184:	00003cdf 	.word	0x00003cdf
c0dea188:	0000406f 	.word	0x0000406f
c0dea18c:	000040cd 	.word	0x000040cd
c0dea190:	0000391d 	.word	0x0000391d
c0dea194:	00003d39 	.word	0x00003d39
c0dea198:	00003d1f 	.word	0x00003d1f
c0dea19c:	00003cbd 	.word	0x00003cbd
c0dea1a0:	00003b99 	.word	0x00003b99
c0dea1a4:	00003e8b 	.word	0x00003e8b
c0dea1a8:	00004131 	.word	0x00004131
c0dea1ac:	00003dac 	.word	0x00003dac

c0dea1b0 <useCaseReviewStreamingStart>:
c0dea1b0:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0dea1b4:	4604      	mov	r4, r0
c0dea1b6:	4826      	ldr	r0, [pc, #152]	@ (c0dea250 <useCaseReviewStreamingStart+0xa0>)
c0dea1b8:	460d      	mov	r5, r1
c0dea1ba:	2103      	movs	r1, #3
c0dea1bc:	e9cd 3200 	strd	r3, r2, [sp]
c0dea1c0:	f8df b098 	ldr.w	fp, [pc, #152]	@ c0dea25c <useCaseReviewStreamingStart+0xac>
c0dea1c4:	f04f 0a01 	mov.w	sl, #1
c0dea1c8:	f809 1000 	strb.w	r1, [r9, r0]
c0dea1cc:	4921      	ldr	r1, [pc, #132]	@ (c0dea254 <useCaseReviewStreamingStart+0xa4>)
c0dea1ce:	eb09 0700 	add.w	r7, r9, r0
c0dea1d2:	eb09 060b 	add.w	r6, r9, fp
c0dea1d6:	eb09 0801 	add.w	r8, r9, r1
c0dea1da:	f8c8 502c 	str.w	r5, [r8, #44]	@ 0x2c
c0dea1de:	990a      	ldr	r1, [sp, #40]	@ 0x28
c0dea1e0:	e9c8 4108 	strd	r4, r1, [r8, #32]
c0dea1e4:	2138      	movs	r1, #56	@ 0x38
c0dea1e6:	481e      	ldr	r0, [pc, #120]	@ (c0dea260 <useCaseReviewStreamingStart+0xb0>)
c0dea1e8:	4478      	add	r0, pc
c0dea1ea:	61b8      	str	r0, [r7, #24]
c0dea1ec:	2000      	movs	r0, #0
c0dea1ee:	6138      	str	r0, [r7, #16]
c0dea1f0:	4819      	ldr	r0, [pc, #100]	@ (c0dea258 <useCaseReviewStreamingStart+0xa8>)
c0dea1f2:	4448      	add	r0, r9
c0dea1f4:	f880 a00c 	strb.w	sl, [r0, #12]
c0dea1f8:	6086      	str	r6, [r0, #8]
c0dea1fa:	f001 f855 	bl	c0deb2a8 <OUTLINED_FUNCTION_13>
c0dea1fe:	2100      	movs	r1, #0
c0dea200:	f809 a00b 	strb.w	sl, [r9, fp]
c0dea204:	84b1      	strh	r1, [r6, #36]	@ 0x24
c0dea206:	4817      	ldr	r0, [pc, #92]	@ (c0dea264 <useCaseReviewStreamingStart+0xb4>)
c0dea208:	9a00      	ldr	r2, [sp, #0]
c0dea20a:	60b5      	str	r5, [r6, #8]
c0dea20c:	7131      	strb	r1, [r6, #4]
c0dea20e:	2500      	movs	r5, #0
c0dea210:	4478      	add	r0, pc
c0dea212:	e9c6 2007 	strd	r2, r0, [r6, #28]
c0dea216:	9801      	ldr	r0, [sp, #4]
c0dea218:	6170      	str	r0, [r6, #20]
c0dea21a:	2000      	movs	r0, #0
c0dea21c:	f000 ff2a 	bl	c0deb074 <initWarningTipBox>
c0dea220:	f3c4 1000 	ubfx	r0, r4, #4, #1
c0dea224:	f7fe fefa 	bl	c0de901c <getNbPagesForGenericContents>
c0dea228:	f888 0030 	strb.w	r0, [r8, #48]	@ 0x30
c0dea22c:	2001      	movs	r0, #1
c0dea22e:	21ff      	movs	r1, #255	@ 0xff
c0dea230:	4a0d      	ldr	r2, [pc, #52]	@ (c0dea268 <useCaseReviewStreamingStart+0xb8>)
c0dea232:	447a      	add	r2, pc
c0dea234:	f7fe fe2a 	bl	c0de8e8c <prepareNavInfo>
c0dea238:	f887 5071 	strb.w	r5, [r7, #113]	@ 0x71
c0dea23c:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0dea23e:	b108      	cbz	r0, c0dea244 <useCaseReviewStreamingStart+0x94>
c0dea240:	f001 f81b 	bl	c0deb27a <OUTLINED_FUNCTION_6>
c0dea244:	2000      	movs	r0, #0
c0dea246:	2101      	movs	r1, #1
c0dea248:	e8bd 4dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0dea24c:	f7fe bfa0 	b.w	c0de9190 <displayGenericContextPage>
c0dea250:	00001be8 	.word	0x00001be8
c0dea254:	00001c64 	.word	0x00001c64
c0dea258:	0000191c 	.word	0x0000191c
c0dea25c:	00001988 	.word	0x00001988
c0dea260:	00000081 	.word	0x00000081
c0dea264:	00003fe6 	.word	0x00003fe6
c0dea268:	0000379a 	.word	0x0000379a

c0dea26c <bundleNavReviewStreamingChoice>:
c0dea26c:	b580      	push	{r7, lr}
c0dea26e:	b178      	cbz	r0, c0dea290 <bundleNavReviewStreamingChoice+0x24>
c0dea270:	480d      	ldr	r0, [pc, #52]	@ (c0dea2a8 <bundleNavReviewStreamingChoice+0x3c>)
c0dea272:	f819 0000 	ldrb.w	r0, [r9, r0]
c0dea276:	2802      	cmp	r0, #2
c0dea278:	d003      	beq.n	c0dea282 <bundleNavReviewStreamingChoice+0x16>
c0dea27a:	480c      	ldr	r0, [pc, #48]	@ (c0dea2ac <bundleNavReviewStreamingChoice+0x40>)
c0dea27c:	4478      	add	r0, pc
c0dea27e:	f000 f955 	bl	c0dea52c <nbgl_useCaseSpinner>
c0dea282:	4808      	ldr	r0, [pc, #32]	@ (c0dea2a4 <bundleNavReviewStreamingChoice+0x38>)
c0dea284:	4448      	add	r0, r9
c0dea286:	6a41      	ldr	r1, [r0, #36]	@ 0x24
c0dea288:	2001      	movs	r0, #1
c0dea28a:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0dea28e:	4708      	bx	r1
c0dea290:	4804      	ldr	r0, [pc, #16]	@ (c0dea2a4 <bundleNavReviewStreamingChoice+0x38>)
c0dea292:	4448      	add	r0, r9
c0dea294:	6a00      	ldr	r0, [r0, #32]
c0dea296:	4906      	ldr	r1, [pc, #24]	@ (c0dea2b0 <bundleNavReviewStreamingChoice+0x44>)
c0dea298:	4479      	add	r1, pc
c0dea29a:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0dea29e:	f000 bf47 	b.w	c0deb130 <bundleNavReviewAskRejectionConfirmation>
c0dea2a2:	bf00      	nop
c0dea2a4:	00001c64 	.word	0x00001c64
c0dea2a8:	00001988 	.word	0x00001988
c0dea2ac:	00003714 	.word	0x00003714
c0dea2b0:	00000f95 	.word	0x00000f95

c0dea2b4 <prepareReviewLastPage>:
c0dea2b4:	b13b      	cbz	r3, c0dea2c6 <prepareReviewLastPage+0x12>
c0dea2b6:	200b      	movs	r0, #11
c0dea2b8:	7308      	strb	r0, [r1, #12]
c0dea2ba:	480d      	ldr	r0, [pc, #52]	@ (c0dea2f0 <prepareReviewLastPage+0x3c>)
c0dea2bc:	e9c1 3200 	strd	r3, r2, [r1]
c0dea2c0:	4478      	add	r0, pc
c0dea2c2:	6088      	str	r0, [r1, #8]
c0dea2c4:	4770      	bx	lr
c0dea2c6:	f010 0007 	ands.w	r0, r0, #7
c0dea2ca:	d004      	beq.n	c0dea2d6 <prepareReviewLastPage+0x22>
c0dea2cc:	2801      	cmp	r0, #1
c0dea2ce:	d105      	bne.n	c0dea2dc <prepareReviewLastPage+0x28>
c0dea2d0:	4b05      	ldr	r3, [pc, #20]	@ (c0dea2e8 <prepareReviewLastPage+0x34>)
c0dea2d2:	447b      	add	r3, pc
c0dea2d4:	e7ef      	b.n	c0dea2b6 <prepareReviewLastPage+0x2>
c0dea2d6:	4b03      	ldr	r3, [pc, #12]	@ (c0dea2e4 <prepareReviewLastPage+0x30>)
c0dea2d8:	447b      	add	r3, pc
c0dea2da:	e7ec      	b.n	c0dea2b6 <prepareReviewLastPage+0x2>
c0dea2dc:	4b03      	ldr	r3, [pc, #12]	@ (c0dea2ec <prepareReviewLastPage+0x38>)
c0dea2de:	447b      	add	r3, pc
c0dea2e0:	e7e9      	b.n	c0dea2b6 <prepareReviewLastPage+0x2>
c0dea2e2:	bf00      	nop
c0dea2e4:	0000390e 	.word	0x0000390e
c0dea2e8:	000038e3 	.word	0x000038e3
c0dea2ec:	00003e5c 	.word	0x00003e5c
c0dea2f0:	000036ec 	.word	0x000036ec

c0dea2f4 <prepareAddressConfirmationPages>:
c0dea2f4:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea2f8:	b08a      	sub	sp, #40	@ 0x28
c0dea2fa:	4688      	mov	r8, r1
c0dea2fc:	4950      	ldr	r1, [pc, #320]	@ (c0dea440 <prepareAddressConfirmationPages+0x14c>)
c0dea2fe:	f8df a13c 	ldr.w	sl, [pc, #316]	@ c0dea43c <prepareAddressConfirmationPages+0x148>
c0dea302:	4693      	mov	fp, r2
c0dea304:	4479      	add	r1, pc
c0dea306:	f849 100a 	str.w	r1, [r9, sl]
c0dea30a:	494e      	ldr	r1, [pc, #312]	@ (c0dea444 <prepareAddressConfirmationPages+0x150>)
c0dea30c:	4479      	add	r1, pc
c0dea30e:	6191      	str	r1, [r2, #24]
c0dea310:	2106      	movs	r1, #6
c0dea312:	7011      	strb	r1, [r2, #0]
c0dea314:	2201      	movs	r2, #1
c0dea316:	eb09 010a 	add.w	r1, r9, sl
c0dea31a:	f1b8 0f00 	cmp.w	r8, #0
c0dea31e:	f881 2034 	strb.w	r2, [r1, #52]	@ 0x34
c0dea322:	6048      	str	r0, [r1, #4]
c0dea324:	d01f      	beq.n	c0dea366 <prepareAddressConfirmationPages+0x72>
c0dea326:	f898 2008 	ldrb.w	r2, [r8, #8]
c0dea32a:	2a02      	cmp	r2, #2
c0dea32c:	d81b      	bhi.n	c0dea366 <prepareAddressConfirmationPages+0x72>
c0dea32e:	2001      	movs	r0, #1
c0dea330:	2100      	movs	r1, #0
c0dea332:	f04f 0c00 	mov.w	ip, #0
c0dea336:	9303      	str	r3, [sp, #12]
c0dea338:	4594      	cmp	ip, r2
c0dea33a:	d219      	bcs.n	c0dea370 <prepareAddressConfirmationPages+0x7c>
c0dea33c:	f8d8 0000 	ldr.w	r0, [r8]
c0dea340:	eb09 030a 	add.w	r3, r9, sl
c0dea344:	f10c 0c01 	add.w	ip, ip, #1
c0dea348:	185c      	adds	r4, r3, r1
c0dea34a:	4408      	add	r0, r1
c0dea34c:	3410      	adds	r4, #16
c0dea34e:	3110      	adds	r1, #16
c0dea350:	e890 00e4 	ldmia.w	r0, {r2, r5, r6, r7}
c0dea354:	c4e4      	stmia	r4!, {r2, r5, r6, r7}
c0dea356:	f893 0034 	ldrb.w	r0, [r3, #52]	@ 0x34
c0dea35a:	3001      	adds	r0, #1
c0dea35c:	f883 0034 	strb.w	r0, [r3, #52]	@ 0x34
c0dea360:	f898 2008 	ldrb.w	r2, [r8, #8]
c0dea364:	e7e8      	b.n	c0dea338 <prepareAddressConfirmationPages+0x44>
c0dea366:	2000      	movs	r0, #0
c0dea368:	f8cb 001c 	str.w	r0, [fp, #28]
c0dea36c:	2001      	movs	r0, #1
c0dea36e:	e01c      	b.n	c0dea3aa <prepareAddressConfirmationPages+0xb6>
c0dea370:	46c4      	mov	ip, r8
c0dea372:	a905      	add	r1, sp, #20
c0dea374:	e89c 00f4 	ldmia.w	ip, {r2, r4, r5, r6, r7}
c0dea378:	460b      	mov	r3, r1
c0dea37a:	c3f4      	stmia	r3!, {r2, r4, r5, r6, r7}
c0dea37c:	f10d 0213 	add.w	r2, sp, #19
c0dea380:	b2c7      	uxtb	r7, r0
c0dea382:	eb09 040a 	add.w	r4, r9, sl
c0dea386:	f88d 001c 	strb.w	r0, [sp, #28]
c0dea38a:	2301      	movs	r3, #1
c0dea38c:	9202      	str	r2, [sp, #8]
c0dea38e:	4638      	mov	r0, r7
c0dea390:	2200      	movs	r2, #0
c0dea392:	9405      	str	r4, [sp, #20]
c0dea394:	e9cd 3300 	strd	r3, r3, [sp]
c0dea398:	2300      	movs	r3, #0
c0dea39a:	f7fe fb6e 	bl	c0de8a7a <getNbTagValuesInPage>
c0dea39e:	4287      	cmp	r7, r0
c0dea3a0:	bf88      	it	hi
c0dea3a2:	2001      	movhi	r0, #1
c0dea3a4:	9b03      	ldr	r3, [sp, #12]
c0dea3a6:	f884 0034 	strb.w	r0, [r4, #52]	@ 0x34
c0dea3aa:	f640 1107 	movw	r1, #2311	@ 0x907
c0dea3ae:	f88b 000c 	strb.w	r0, [fp, #12]
c0dea3b2:	f8ab 1020 	strh.w	r1, [fp, #32]
c0dea3b6:	2100      	movs	r1, #0
c0dea3b8:	f1b8 0f00 	cmp.w	r8, #0
c0dea3bc:	f8ab 1010 	strh.w	r1, [fp, #16]
c0dea3c0:	f88b 100e 	strb.w	r1, [fp, #14]
c0dea3c4:	eb09 010a 	add.w	r1, r9, sl
c0dea3c8:	f8cb 1004 	str.w	r1, [fp, #4]
c0dea3cc:	d003      	beq.n	c0dea3d6 <prepareAddressConfirmationPages+0xe2>
c0dea3ce:	f898 1008 	ldrb.w	r1, [r8, #8]
c0dea3d2:	4288      	cmp	r0, r1
c0dea3d4:	d907      	bls.n	c0dea3e6 <prepareAddressConfirmationPages+0xf2>
c0dea3d6:	200b      	movs	r0, #11
c0dea3d8:	f88b 002c 	strb.w	r0, [fp, #44]	@ 0x2c
c0dea3dc:	481c      	ldr	r0, [pc, #112]	@ (c0dea450 <prepareAddressConfirmationPages+0x15c>)
c0dea3de:	4478      	add	r0, pc
c0dea3e0:	f8cb 0024 	str.w	r0, [fp, #36]	@ 0x24
c0dea3e4:	e027      	b.n	c0dea436 <prepareAddressConfirmationPages+0x142>
c0dea3e6:	2000      	movs	r0, #0
c0dea3e8:	f8cb 0024 	str.w	r0, [fp, #36]	@ 0x24
c0dea3ec:	4916      	ldr	r1, [pc, #88]	@ (c0dea448 <prepareAddressConfirmationPages+0x154>)
c0dea3ee:	4479      	add	r1, pc
c0dea3f0:	f8cb 101c 	str.w	r1, [fp, #28]
c0dea3f4:	210b      	movs	r1, #11
c0dea3f6:	f883 102c 	strb.w	r1, [r3, #44]	@ 0x2c
c0dea3fa:	2106      	movs	r1, #6
c0dea3fc:	7019      	strb	r1, [r3, #0]
c0dea3fe:	2109      	movs	r1, #9
c0dea400:	f883 1021 	strb.w	r1, [r3, #33]	@ 0x21
c0dea404:	4911      	ldr	r1, [pc, #68]	@ (c0dea44c <prepareAddressConfirmationPages+0x158>)
c0dea406:	e9c3 0006 	strd	r0, r0, [r3, #24]
c0dea40a:	1d18      	adds	r0, r3, #4
c0dea40c:	4479      	add	r1, pc
c0dea40e:	6259      	str	r1, [r3, #36]	@ 0x24
c0dea410:	4641      	mov	r1, r8
c0dea412:	e891 00f4 	ldmia.w	r1, {r2, r4, r5, r6, r7}
c0dea416:	c0f4      	stmia	r0!, {r2, r4, r5, r6, r7}
c0dea418:	eb09 000a 	add.w	r0, r9, sl
c0dea41c:	f898 1008 	ldrb.w	r1, [r8, #8]
c0dea420:	f890 0034 	ldrb.w	r0, [r0, #52]	@ 0x34
c0dea424:	1a09      	subs	r1, r1, r0
c0dea426:	3101      	adds	r1, #1
c0dea428:	7319      	strb	r1, [r3, #12]
c0dea42a:	f8d8 1000 	ldr.w	r1, [r8]
c0dea42e:	eb01 1000 	add.w	r0, r1, r0, lsl #4
c0dea432:	3810      	subs	r0, #16
c0dea434:	6058      	str	r0, [r3, #4]
c0dea436:	b00a      	add	sp, #40	@ 0x28
c0dea438:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0dea43c:	00001a30 	.word	0x00001a30
c0dea440:	00003c85 	.word	0x00003c85
c0dea444:	0000335f 	.word	0x0000335f
c0dea448:	0000363d 	.word	0x0000363d
c0dea44c:	00003e82 	.word	0x00003e82
c0dea450:	00003eb0 	.word	0x00003eb0

c0dea454 <nbgl_useCaseAddressReview>:
c0dea454:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0dea458:	4e2d      	ldr	r6, [pc, #180]	@ (c0dea510 <nbgl_useCaseAddressReview+0xbc>)
c0dea45a:	9301      	str	r3, [sp, #4]
c0dea45c:	4617      	mov	r7, r2
c0dea45e:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0dea462:	eb09 0406 	add.w	r4, r9, r6
c0dea466:	f7fe fcfb 	bl	c0de8e60 <reset_callbacks_and_context>
c0dea46a:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0dea46c:	e9dd 540c 	ldrd	r5, r4, [sp, #48]	@ 0x30
c0dea470:	b108      	cbz	r0, c0dea476 <nbgl_useCaseAddressReview+0x22>
c0dea472:	f7fd f9cf 	bl	c0de7814 <nbgl_layoutRelease>
c0dea476:	eb09 0006 	add.w	r0, r9, r6
c0dea47a:	2138      	movs	r1, #56	@ 0x38
c0dea47c:	f001 ffd6 	bl	c0dec42c <__aeabi_memclr>
c0dea480:	4824      	ldr	r0, [pc, #144]	@ (c0dea514 <nbgl_useCaseAddressReview+0xc0>)
c0dea482:	2602      	movs	r6, #2
c0dea484:	f04f 0a00 	mov.w	sl, #0
c0dea488:	f8df b094 	ldr.w	fp, [pc, #148]	@ c0dea520 <nbgl_useCaseAddressReview+0xcc>
c0dea48c:	21a8      	movs	r1, #168	@ 0xa8
c0dea48e:	f809 6000 	strb.w	r6, [r9, r0]
c0dea492:	4448      	add	r0, r9
c0dea494:	6184      	str	r4, [r0, #24]
c0dea496:	f8c0 a010 	str.w	sl, [r0, #16]
c0dea49a:	481f      	ldr	r0, [pc, #124]	@ (c0dea518 <nbgl_useCaseAddressReview+0xc4>)
c0dea49c:	eb09 040b 	add.w	r4, r9, fp
c0dea4a0:	4448      	add	r0, r9
c0dea4a2:	6206      	str	r6, [r0, #32]
c0dea4a4:	481d      	ldr	r0, [pc, #116]	@ (c0dea51c <nbgl_useCaseAddressReview+0xc8>)
c0dea4a6:	eb09 0800 	add.w	r8, r9, r0
c0dea4aa:	4620      	mov	r0, r4
c0dea4ac:	f8c8 4008 	str.w	r4, [r8, #8]
c0dea4b0:	f001 ffbc 	bl	c0dec42c <__aeabi_memclr>
c0dea4b4:	2001      	movs	r0, #1
c0dea4b6:	60a7      	str	r7, [r4, #8]
c0dea4b8:	f884 a026 	strb.w	sl, [r4, #38]	@ 0x26
c0dea4bc:	f104 0238 	add.w	r2, r4, #56	@ 0x38
c0dea4c0:	f104 0370 	add.w	r3, r4, #112	@ 0x70
c0dea4c4:	f809 000b 	strb.w	r0, [r9, fp]
c0dea4c8:	4816      	ldr	r0, [pc, #88]	@ (c0dea524 <nbgl_useCaseAddressReview+0xd0>)
c0dea4ca:	9901      	ldr	r1, [sp, #4]
c0dea4cc:	4478      	add	r0, pc
c0dea4ce:	e9c4 1a05 	strd	r1, sl, [r4, #20]
c0dea4d2:	e9c4 5007 	strd	r5, r0, [r4, #28]
c0dea4d6:	e9dd 0102 	ldrd	r0, r1, [sp, #8]
c0dea4da:	f7ff ff0b 	bl	c0dea2f4 <prepareAddressConfirmationPages>
c0dea4de:	f894 0070 	ldrb.w	r0, [r4, #112]	@ 0x70
c0dea4e2:	2806      	cmp	r0, #6
c0dea4e4:	bf08      	it	eq
c0dea4e6:	2603      	moveq	r6, #3
c0dea4e8:	f888 600c 	strb.w	r6, [r8, #12]
c0dea4ec:	f000 fec2 	bl	c0deb274 <OUTLINED_FUNCTION_5>
c0dea4f0:	4a0d      	ldr	r2, [pc, #52]	@ (c0dea528 <nbgl_useCaseAddressReview+0xd4>)
c0dea4f2:	4601      	mov	r1, r0
c0dea4f4:	2001      	movs	r0, #1
c0dea4f6:	447a      	add	r2, pc
c0dea4f8:	f7fe fcc8 	bl	c0de8e8c <prepareNavInfo>
c0dea4fc:	f000 febd 	bl	c0deb27a <OUTLINED_FUNCTION_6>
c0dea500:	2000      	movs	r0, #0
c0dea502:	2101      	movs	r1, #1
c0dea504:	b004      	add	sp, #16
c0dea506:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea50a:	f7fe be41 	b.w	c0de9190 <displayGenericContextPage>
c0dea50e:	bf00      	nop
c0dea510:	00001a30 	.word	0x00001a30
c0dea514:	00001be8 	.word	0x00001be8
c0dea518:	00001c64 	.word	0x00001c64
c0dea51c:	0000191c 	.word	0x0000191c
c0dea520:	00001988 	.word	0x00001988
c0dea524:	000035ce 	.word	0x000035ce
c0dea528:	00003849 	.word	0x00003849

c0dea52c <nbgl_useCaseSpinner>:
c0dea52c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0dea52e:	b087      	sub	sp, #28
c0dea530:	4e1f      	ldr	r6, [pc, #124]	@ (c0dea5b0 <nbgl_useCaseSpinner+0x84>)
c0dea532:	4604      	mov	r4, r0
c0dea534:	f819 0006 	ldrb.w	r0, [r9, r6]
c0dea538:	2801      	cmp	r0, #1
c0dea53a:	d114      	bne.n	c0dea566 <nbgl_useCaseSpinner+0x3a>
c0dea53c:	eb09 0006 	add.w	r0, r9, r6
c0dea540:	7841      	ldrb	r1, [r0, #1]
c0dea542:	3101      	adds	r1, #1
c0dea544:	b2ca      	uxtb	r2, r1
c0dea546:	3a04      	subs	r2, #4
c0dea548:	bf18      	it	ne
c0dea54a:	460a      	movne	r2, r1
c0dea54c:	7042      	strb	r2, [r0, #1]
c0dea54e:	6b00      	ldr	r0, [r0, #48]	@ 0x30
c0dea550:	b2d3      	uxtb	r3, r2
c0dea552:	4621      	mov	r1, r4
c0dea554:	2200      	movs	r2, #0
c0dea556:	f7fd f88b 	bl	c0de7670 <nbgl_layoutUpdateSpinner>
c0dea55a:	2802      	cmp	r0, #2
c0dea55c:	d022      	beq.n	c0dea5a4 <nbgl_useCaseSpinner+0x78>
c0dea55e:	2801      	cmp	r0, #1
c0dea560:	d11e      	bne.n	c0dea5a0 <nbgl_useCaseSpinner+0x74>
c0dea562:	2004      	movs	r0, #4
c0dea564:	e01f      	b.n	c0dea5a6 <nbgl_useCaseSpinner+0x7a>
c0dea566:	eb09 0506 	add.w	r5, r9, r6
c0dea56a:	216c      	movs	r1, #108	@ 0x6c
c0dea56c:	4628      	mov	r0, r5
c0dea56e:	f001 ff5d 	bl	c0dec42c <__aeabi_memclr>
c0dea572:	2701      	movs	r7, #1
c0dea574:	211c      	movs	r1, #28
c0dea576:	f809 7006 	strb.w	r7, [r9, r6]
c0dea57a:	466e      	mov	r6, sp
c0dea57c:	f000 fe94 	bl	c0deb2a8 <OUTLINED_FUNCTION_13>
c0dea580:	4630      	mov	r0, r6
c0dea582:	f88d 7001 	strb.w	r7, [sp, #1]
c0dea586:	f7f9 ff1d 	bl	c0de43c4 <nbgl_layoutGet>
c0dea58a:	786b      	ldrb	r3, [r5, #1]
c0dea58c:	4621      	mov	r1, r4
c0dea58e:	2200      	movs	r2, #0
c0dea590:	6328      	str	r0, [r5, #48]	@ 0x30
c0dea592:	f7fc ff0d 	bl	c0de73b0 <nbgl_layoutAddSpinner>
c0dea596:	6b28      	ldr	r0, [r5, #48]	@ 0x30
c0dea598:	f7fd f90e 	bl	c0de77b8 <nbgl_layoutDraw>
c0dea59c:	f000 fe5e 	bl	c0deb25c <OUTLINED_FUNCTION_3>
c0dea5a0:	b007      	add	sp, #28
c0dea5a2:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0dea5a4:	2001      	movs	r0, #1
c0dea5a6:	b007      	add	sp, #28
c0dea5a8:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0dea5ac:	f001 bb04 	b.w	c0debbb8 <nbgl_refreshSpecial>
c0dea5b0:	0000191c 	.word	0x0000191c

c0dea5b4 <getContentAtIdx>:
c0dea5b4:	b570      	push	{r4, r5, r6, lr}
c0dea5b6:	4605      	mov	r5, r0
c0dea5b8:	2000      	movs	r0, #0
c0dea5ba:	2d00      	cmp	r5, #0
c0dea5bc:	d415      	bmi.n	c0dea5ea <getContentAtIdx+0x36>
c0dea5be:	4e11      	ldr	r6, [pc, #68]	@ (c0dea604 <getContentAtIdx+0x50>)
c0dea5c0:	460c      	mov	r4, r1
c0dea5c2:	eb09 0106 	add.w	r1, r9, r6
c0dea5c6:	7b09      	ldrb	r1, [r1, #12]
c0dea5c8:	428d      	cmp	r5, r1
c0dea5ca:	da0e      	bge.n	c0dea5ea <getContentAtIdx+0x36>
c0dea5cc:	eb09 0006 	add.w	r0, r9, r6
c0dea5d0:	7900      	ldrb	r0, [r0, #4]
c0dea5d2:	b158      	cbz	r0, c0dea5ec <getContentAtIdx+0x38>
c0dea5d4:	4620      	mov	r0, r4
c0dea5d6:	2138      	movs	r1, #56	@ 0x38
c0dea5d8:	f001 ff28 	bl	c0dec42c <__aeabi_memclr>
c0dea5dc:	eb09 0006 	add.w	r0, r9, r6
c0dea5e0:	4621      	mov	r1, r4
c0dea5e2:	6882      	ldr	r2, [r0, #8]
c0dea5e4:	b2e8      	uxtb	r0, r5
c0dea5e6:	4790      	blx	r2
c0dea5e8:	4620      	mov	r0, r4
c0dea5ea:	bd70      	pop	{r4, r5, r6, pc}
c0dea5ec:	eb09 0006 	add.w	r0, r9, r6
c0dea5f0:	ebc5 01c5 	rsb	r1, r5, r5, lsl #3
c0dea5f4:	6880      	ldr	r0, [r0, #8]
c0dea5f6:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
c0dea5fa:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0dea5fe:	f001 bcf3 	b.w	c0debfe8 <pic>
c0dea602:	bf00      	nop
c0dea604:	0000191c 	.word	0x0000191c

c0dea608 <getContentNbElement>:
c0dea608:	7801      	ldrb	r1, [r0, #0]
c0dea60a:	290a      	cmp	r1, #10
c0dea60c:	d00b      	beq.n	c0dea626 <getContentNbElement+0x1e>
c0dea60e:	2906      	cmp	r1, #6
c0dea610:	d009      	beq.n	c0dea626 <getContentNbElement+0x1e>
c0dea612:	2907      	cmp	r1, #7
c0dea614:	d009      	beq.n	c0dea62a <getContentNbElement+0x22>
c0dea616:	2908      	cmp	r1, #8
c0dea618:	d009      	beq.n	c0dea62e <getContentNbElement+0x26>
c0dea61a:	2909      	cmp	r1, #9
c0dea61c:	d009      	beq.n	c0dea632 <getContentNbElement+0x2a>
c0dea61e:	2904      	cmp	r1, #4
c0dea620:	bf1c      	itt	ne
c0dea622:	2001      	movne	r0, #1
c0dea624:	4770      	bxne	lr
c0dea626:	7b00      	ldrb	r0, [r0, #12]
c0dea628:	4770      	bx	lr
c0dea62a:	7a00      	ldrb	r0, [r0, #8]
c0dea62c:	4770      	bx	lr
c0dea62e:	7c00      	ldrb	r0, [r0, #16]
c0dea630:	4770      	bx	lr
c0dea632:	7a40      	ldrb	r0, [r0, #9]
c0dea634:	4770      	bx	lr
	...

c0dea638 <genericContextComputeNextPageParams>:
c0dea638:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0dea63c:	f8df 810c 	ldr.w	r8, [pc, #268]	@ c0dea74c <genericContextComputeNextPageParams+0x114>
c0dea640:	4682      	mov	sl, r0
c0dea642:	4616      	mov	r6, r2
c0dea644:	460d      	mov	r5, r1
c0dea646:	f10d 0107 	add.w	r1, sp, #7
c0dea64a:	461a      	mov	r2, r3
c0dea64c:	eb09 0008 	add.w	r0, r9, r8
c0dea650:	7c04      	ldrb	r4, [r0, #16]
c0dea652:	7c87      	ldrb	r7, [r0, #18]
c0dea654:	4650      	mov	r0, sl
c0dea656:	f000 f881 	bl	c0dea75c <genericContextGetPageInfo>
c0dea65a:	f89d 0007 	ldrb.w	r0, [sp, #7]
c0dea65e:	f8df b0f0 	ldr.w	fp, [pc, #240]	@ c0dea750 <genericContextComputeNextPageParams+0x118>
c0dea662:	7030      	strb	r0, [r6, #0]
c0dea664:	eb09 010b 	add.w	r1, r9, fp
c0dea668:	f891 1060 	ldrb.w	r1, [r1, #96]	@ 0x60
c0dea66c:	4551      	cmp	r1, sl
c0dea66e:	d219      	bcs.n	c0dea6a4 <genericContextComputeNextPageParams+0x6c>
c0dea670:	4b38      	ldr	r3, [pc, #224]	@ (c0dea754 <genericContextComputeNextPageParams+0x11c>)
c0dea672:	084e      	lsrs	r6, r1, #1
c0dea674:	2204      	movs	r2, #4
c0dea676:	ea02 0281 	and.w	r2, r2, r1, lsl #2
c0dea67a:	444b      	add	r3, r9
c0dea67c:	5d9b      	ldrb	r3, [r3, r6]
c0dea67e:	fa23 f202 	lsr.w	r2, r3, r2
c0dea682:	2300      	movs	r3, #0
c0dea684:	f002 0207 	and.w	r2, r2, #7
c0dea688:	4417      	add	r7, r2
c0dea68a:	eb09 0208 	add.w	r2, r9, r8
c0dea68e:	7c52      	ldrb	r2, [r2, #17]
c0dea690:	4297      	cmp	r7, r2
c0dea692:	bf28      	it	cs
c0dea694:	2301      	movcs	r3, #1
c0dea696:	2a00      	cmp	r2, #0
c0dea698:	bf18      	it	ne
c0dea69a:	2201      	movne	r2, #1
c0dea69c:	401a      	ands	r2, r3
c0dea69e:	bf18      	it	ne
c0dea6a0:	2700      	movne	r7, #0
c0dea6a2:	4414      	add	r4, r2
c0dea6a4:	4551      	cmp	r1, sl
c0dea6a6:	d905      	bls.n	c0dea6b4 <genericContextComputeNextPageParams+0x7c>
c0dea6a8:	1a3f      	subs	r7, r7, r0
c0dea6aa:	f1b7 3fff 	cmp.w	r7, #4294967295	@ 0xffffffff
c0dea6ae:	bfdc      	itt	le
c0dea6b0:	4247      	negle	r7, r0
c0dea6b2:	3c01      	suble	r4, #1
c0dea6b4:	b2e6      	uxtb	r6, r4
c0dea6b6:	2eff      	cmp	r6, #255	@ 0xff
c0dea6b8:	d014      	beq.n	c0dea6e4 <genericContextComputeNextPageParams+0xac>
c0dea6ba:	eb09 0108 	add.w	r1, r9, r8
c0dea6be:	b260      	sxtb	r0, r4
c0dea6c0:	7b09      	ldrb	r1, [r1, #12]
c0dea6c2:	4288      	cmp	r0, r1
c0dea6c4:	d108      	bne.n	c0dea6d8 <genericContextComputeNextPageParams+0xa0>
c0dea6c6:	eb09 0108 	add.w	r1, r9, r8
c0dea6ca:	7d09      	ldrb	r1, [r1, #20]
c0dea6cc:	b121      	cbz	r1, c0dea6d8 <genericContextComputeNextPageParams+0xa0>
c0dea6ce:	4822      	ldr	r0, [pc, #136]	@ (c0dea758 <genericContextComputeNextPageParams+0x120>)
c0dea6d0:	4448      	add	r0, r9
c0dea6d2:	f100 0538 	add.w	r5, r0, #56	@ 0x38
c0dea6d6:	e00d      	b.n	c0dea6f4 <genericContextComputeNextPageParams+0xbc>
c0dea6d8:	4629      	mov	r1, r5
c0dea6da:	f7ff ff6b 	bl	c0dea5b4 <getContentAtIdx>
c0dea6de:	4605      	mov	r5, r0
c0dea6e0:	b940      	cbnz	r0, c0dea6f4 <genericContextComputeNextPageParams+0xbc>
c0dea6e2:	e02e      	b.n	c0dea742 <genericContextComputeNextPageParams+0x10a>
c0dea6e4:	eb09 0008 	add.w	r0, r9, r8
c0dea6e8:	7cc0      	ldrb	r0, [r0, #19]
c0dea6ea:	2800      	cmp	r0, #0
c0dea6ec:	d0e5      	beq.n	c0dea6ba <genericContextComputeNextPageParams+0x82>
c0dea6ee:	481a      	ldr	r0, [pc, #104]	@ (c0dea758 <genericContextComputeNextPageParams+0x120>)
c0dea6f0:	eb09 0500 	add.w	r5, r9, r0
c0dea6f4:	eb09 0008 	add.w	r0, r9, r8
c0dea6f8:	7c00      	ldrb	r0, [r0, #16]
c0dea6fa:	4286      	cmp	r6, r0
c0dea6fc:	d103      	bne.n	c0dea706 <genericContextComputeNextPageParams+0xce>
c0dea6fe:	eb09 0008 	add.w	r0, r9, r8
c0dea702:	7c40      	ldrb	r0, [r0, #17]
c0dea704:	b988      	cbnz	r0, c0dea72a <genericContextComputeNextPageParams+0xf2>
c0dea706:	eb09 0608 	add.w	r6, r9, r8
c0dea70a:	4628      	mov	r0, r5
c0dea70c:	7434      	strb	r4, [r6, #16]
c0dea70e:	f7ff ff7b 	bl	c0dea608 <getContentNbElement>
c0dea712:	7470      	strb	r0, [r6, #17]
c0dea714:	6b68      	ldr	r0, [r5, #52]	@ 0x34
c0dea716:	eb09 040b 	add.w	r4, r9, fp
c0dea71a:	f001 fc65 	bl	c0debfe8 <pic>
c0dea71e:	62e0      	str	r0, [r4, #44]	@ 0x2c
c0dea720:	7c70      	ldrb	r0, [r6, #17]
c0dea722:	f1b7 3fff 	cmp.w	r7, #4294967295	@ 0xffffffff
c0dea726:	dc02      	bgt.n	c0dea72e <genericContextComputeNextPageParams+0xf6>
c0dea728:	4407      	add	r7, r0
c0dea72a:	2f00      	cmp	r7, #0
c0dea72c:	d409      	bmi.n	c0dea742 <genericContextComputeNextPageParams+0x10a>
c0dea72e:	4287      	cmp	r7, r0
c0dea730:	d207      	bcs.n	c0dea742 <genericContextComputeNextPageParams+0x10a>
c0dea732:	eb09 000b 	add.w	r0, r9, fp
c0dea736:	f880 a060 	strb.w	sl, [r0, #96]	@ 0x60
c0dea73a:	eb09 0008 	add.w	r0, r9, r8
c0dea73e:	7487      	strb	r7, [r0, #18]
c0dea740:	e000      	b.n	c0dea744 <genericContextComputeNextPageParams+0x10c>
c0dea742:	2500      	movs	r5, #0
c0dea744:	4628      	mov	r0, r5
c0dea746:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0dea74a:	bf00      	nop
c0dea74c:	0000191c 	.word	0x0000191c
c0dea750:	00001be8 	.word	0x00001be8
c0dea754:	00001ae8 	.word	0x00001ae8
c0dea758:	00001988 	.word	0x00001988

c0dea75c <genericContextGetPageInfo>:
c0dea75c:	b510      	push	{r4, lr}
c0dea75e:	4c08      	ldr	r4, [pc, #32]	@ (c0dea780 <genericContextGetPageInfo+0x24>)
c0dea760:	2304      	movs	r3, #4
c0dea762:	ea03 0380 	and.w	r3, r3, r0, lsl #2
c0dea766:	0840      	lsrs	r0, r0, #1
c0dea768:	444c      	add	r4, r9
c0dea76a:	5c20      	ldrb	r0, [r4, r0]
c0dea76c:	40d8      	lsrs	r0, r3
c0dea76e:	b111      	cbz	r1, c0dea776 <genericContextGetPageInfo+0x1a>
c0dea770:	f000 0307 	and.w	r3, r0, #7
c0dea774:	700b      	strb	r3, [r1, #0]
c0dea776:	b112      	cbz	r2, c0dea77e <genericContextGetPageInfo+0x22>
c0dea778:	f3c0 00c0 	ubfx	r0, r0, #3, #1
c0dea77c:	7010      	strb	r0, [r2, #0]
c0dea77e:	bd10      	pop	{r4, pc}
c0dea780:	00001ae8 	.word	0x00001ae8

c0dea784 <bundleNavStartSettings>:
c0dea784:	2000      	movs	r0, #0
c0dea786:	f7fe bf3f 	b.w	c0de9608 <bundleNavStartSettingsAtPage>
	...

c0dea78c <displayFullValuePage>:
c0dea78c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea790:	b092      	sub	sp, #72	@ 0x48
c0dea792:	460d      	mov	r5, r1
c0dea794:	68d1      	ldr	r1, [r2, #12]
c0dea796:	4614      	mov	r4, r2
c0dea798:	b101      	cbz	r1, c0dea79c <displayFullValuePage+0x10>
c0dea79a:	4608      	mov	r0, r1
c0dea79c:	f001 fc24 	bl	c0debfe8 <pic>
c0dea7a0:	4606      	mov	r6, r0
c0dea7a2:	7d20      	ldrb	r0, [r4, #20]
c0dea7a4:	2805      	cmp	r0, #5
c0dea7a6:	d00d      	beq.n	c0dea7c4 <displayFullValuePage+0x38>
c0dea7a8:	2804      	cmp	r0, #4
c0dea7aa:	d170      	bne.n	c0dea88e <displayFullValuePage+0x102>
c0dea7ac:	4861      	ldr	r0, [pc, #388]	@ (c0dea934 <displayFullValuePage+0x1a8>)
c0dea7ae:	6921      	ldr	r1, [r4, #16]
c0dea7b0:	2201      	movs	r2, #1
c0dea7b2:	4448      	add	r0, r9
c0dea7b4:	6341      	str	r1, [r0, #52]	@ 0x34
c0dea7b6:	4630      	mov	r0, r6
c0dea7b8:	6921      	ldr	r1, [r4, #16]
c0dea7ba:	b012      	add	sp, #72	@ 0x48
c0dea7bc:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea7c0:	f000 ba48 	b.w	c0deac54 <displayInfosListModal>
c0dea7c4:	485b      	ldr	r0, [pc, #364]	@ (c0dea934 <displayFullValuePage+0x1a8>)
c0dea7c6:	6921      	ldr	r1, [r4, #16]
c0dea7c8:	2200      	movs	r2, #0
c0dea7ca:	4448      	add	r0, r9
c0dea7cc:	6381      	str	r1, [r0, #56]	@ 0x38
c0dea7ce:	485a      	ldr	r0, [pc, #360]	@ (c0dea938 <displayFullValuePage+0x1ac>)
c0dea7d0:	2100      	movs	r1, #0
c0dea7d2:	6927      	ldr	r7, [r4, #16]
c0dea7d4:	9102      	str	r1, [sp, #8]
c0dea7d6:	4448      	add	r0, r9
c0dea7d8:	e9c0 220c 	strd	r2, r2, [r0, #48]	@ 0x30
c0dea7dc:	6382      	str	r2, [r0, #56]	@ 0x38
c0dea7de:	63c2      	str	r2, [r0, #60]	@ 0x3c
c0dea7e0:	7a3d      	ldrb	r5, [r7, #8]
c0dea7e2:	0628      	lsls	r0, r5, #24
c0dea7e4:	f000 8087 	beq.w	c0dea8f6 <displayFullValuePage+0x16a>
c0dea7e8:	9501      	str	r5, [sp, #4]
c0dea7ea:	fa5f fb85 	uxtb.w	fp, r5
c0dea7ee:	f04f 0800 	mov.w	r8, #0
c0dea7f2:	2600      	movs	r6, #0
c0dea7f4:	9802      	ldr	r0, [sp, #8]
c0dea7f6:	b2c0      	uxtb	r0, r0
c0dea7f8:	ea4f 1a00 	mov.w	sl, r0, lsl #4
c0dea7fc:	45c3      	cmp	fp, r8
c0dea7fe:	d027      	beq.n	c0dea850 <displayFullValuePage+0xc4>
c0dea800:	f1b8 0f00 	cmp.w	r8, #0
c0dea804:	bf18      	it	ne
c0dea806:	3618      	addne	r6, #24
c0dea808:	6838      	ldr	r0, [r7, #0]
c0dea80a:	b108      	cbz	r0, c0dea810 <displayFullValuePage+0x84>
c0dea80c:	4450      	add	r0, sl
c0dea80e:	e004      	b.n	c0dea81a <displayFullValuePage+0x8e>
c0dea810:	9802      	ldr	r0, [sp, #8]
c0dea812:	6879      	ldr	r1, [r7, #4]
c0dea814:	4440      	add	r0, r8
c0dea816:	b2c0      	uxtb	r0, r0
c0dea818:	4788      	blx	r1
c0dea81a:	f001 fbe5 	bl	c0debfe8 <pic>
c0dea81e:	7b7b      	ldrb	r3, [r7, #13]
c0dea820:	6801      	ldr	r1, [r0, #0]
c0dea822:	4604      	mov	r4, r0
c0dea824:	f000 fd3b 	bl	c0deb29e <OUTLINED_FUNCTION_12>
c0dea828:	6861      	ldr	r1, [r4, #4]
c0dea82a:	7b7b      	ldrb	r3, [r7, #13]
c0dea82c:	4605      	mov	r5, r0
c0dea82e:	f000 fd36 	bl	c0deb29e <OUTLINED_FUNCTION_12>
c0dea832:	1971      	adds	r1, r6, r5
c0dea834:	f10a 0a10 	add.w	sl, sl, #16
c0dea838:	f108 0801 	add.w	r8, r8, #1
c0dea83c:	4408      	add	r0, r1
c0dea83e:	1d06      	adds	r6, r0, #4
c0dea840:	b2b0      	uxth	r0, r6
c0dea842:	f5b0 7fe8 	cmp.w	r0, #464	@ 0x1d0
c0dea846:	d3d9      	bcc.n	c0dea7fc <displayFullValuePage+0x70>
c0dea848:	9d01      	ldr	r5, [sp, #4]
c0dea84a:	f1a8 0001 	sub.w	r0, r8, #1
c0dea84e:	e001      	b.n	c0dea854 <displayFullValuePage+0xc8>
c0dea850:	9d01      	ldr	r5, [sp, #4]
c0dea852:	4628      	mov	r0, r5
c0dea854:	4938      	ldr	r1, [pc, #224]	@ (c0dea938 <displayFullValuePage+0x1ac>)
c0dea856:	2404      	movs	r4, #4
c0dea858:	1a2d      	subs	r5, r5, r0
c0dea85a:	4449      	add	r1, r9
c0dea85c:	f891 2030 	ldrb.w	r2, [r1, #48]	@ 0x30
c0dea860:	1c53      	adds	r3, r2, #1
c0dea862:	f881 3030 	strb.w	r3, [r1, #48]	@ 0x30
c0dea866:	eb01 0152 	add.w	r1, r1, r2, lsr #1
c0dea86a:	ea04 0282 	and.w	r2, r4, r2, lsl #2
c0dea86e:	240f      	movs	r4, #15
c0dea870:	f891 3050 	ldrb.w	r3, [r1, #80]	@ 0x50
c0dea874:	4094      	lsls	r4, r2
c0dea876:	43a3      	bics	r3, r4
c0dea878:	f000 0407 	and.w	r4, r0, #7
c0dea87c:	fa04 f202 	lsl.w	r2, r4, r2
c0dea880:	431a      	orrs	r2, r3
c0dea882:	f881 2050 	strb.w	r2, [r1, #80]	@ 0x50
c0dea886:	9902      	ldr	r1, [sp, #8]
c0dea888:	4401      	add	r1, r0
c0dea88a:	9102      	str	r1, [sp, #8]
c0dea88c:	e7a9      	b.n	c0dea7e2 <displayFullValuePage+0x56>
c0dea88e:	af0b      	add	r7, sp, #44	@ 0x2c
c0dea890:	492a      	ldr	r1, [pc, #168]	@ (c0dea93c <displayFullValuePage+0x1b0>)
c0dea892:	221c      	movs	r2, #28
c0dea894:	4638      	mov	r0, r7
c0dea896:	4479      	add	r1, pc
c0dea898:	f001 fdbe 	bl	c0dec418 <__aeabi_memcpy>
c0dea89c:	f44f 6010 	mov.w	r0, #2304	@ 0x900
c0dea8a0:	f8df 8090 	ldr.w	r8, [pc, #144]	@ c0dea934 <displayFullValuePage+0x1a8>
c0dea8a4:	9609      	str	r6, [sp, #36]	@ 0x24
c0dea8a6:	f8ad 0028 	strh.w	r0, [sp, #40]	@ 0x28
c0dea8aa:	2000      	movs	r0, #0
c0dea8ac:	9008      	str	r0, [sp, #32]
c0dea8ae:	2001      	movs	r0, #1
c0dea8b0:	eb09 0608 	add.w	r6, r9, r8
c0dea8b4:	f8ad 001c 	strh.w	r0, [sp, #28]
c0dea8b8:	4638      	mov	r0, r7
c0dea8ba:	f7f9 fd83 	bl	c0de43c4 <nbgl_layoutGet>
c0dea8be:	62f0      	str	r0, [r6, #44]	@ 0x2c
c0dea8c0:	a907      	add	r1, sp, #28
c0dea8c2:	f7fc fb17 	bl	c0de6ef4 <nbgl_layoutAddHeader>
c0dea8c6:	7d20      	ldrb	r0, [r4, #20]
c0dea8c8:	2801      	cmp	r0, #1
c0dea8ca:	d01b      	beq.n	c0dea904 <displayFullValuePage+0x178>
c0dea8cc:	2802      	cmp	r0, #2
c0dea8ce:	d01c      	beq.n	c0dea90a <displayFullValuePage+0x17e>
c0dea8d0:	2803      	cmp	r0, #3
c0dea8d2:	d11d      	bne.n	c0dea910 <displayFullValuePage+0x184>
c0dea8d4:	f44f 3080 	mov.w	r0, #65536	@ 0x10000
c0dea8d8:	9006      	str	r0, [sp, #24]
c0dea8da:	cc07      	ldmia	r4!, {r0, r1, r2}
c0dea8dc:	9105      	str	r1, [sp, #20]
c0dea8de:	2a00      	cmp	r2, #0
c0dea8e0:	9003      	str	r0, [sp, #12]
c0dea8e2:	bf08      	it	eq
c0dea8e4:	4602      	moveq	r2, r0
c0dea8e6:	eb09 0008 	add.w	r0, r9, r8
c0dea8ea:	9204      	str	r2, [sp, #16]
c0dea8ec:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0dea8ee:	a903      	add	r1, sp, #12
c0dea8f0:	f7fb fea5 	bl	c0de663e <nbgl_layoutAddQRCode>
c0dea8f4:	e014      	b.n	c0dea920 <displayFullValuePage+0x194>
c0dea8f6:	2000      	movs	r0, #0
c0dea8f8:	2101      	movs	r1, #1
c0dea8fa:	b012      	add	sp, #72	@ 0x48
c0dea8fc:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea900:	f000 bb12 	b.w	c0deaf28 <displayTagValueListModalPage>
c0dea904:	4b0e      	ldr	r3, [pc, #56]	@ (c0dea940 <displayFullValuePage+0x1b4>)
c0dea906:	447b      	add	r3, pc
c0dea908:	e003      	b.n	c0dea912 <displayFullValuePage+0x186>
c0dea90a:	4b0e      	ldr	r3, [pc, #56]	@ (c0dea944 <displayFullValuePage+0x1b8>)
c0dea90c:	447b      	add	r3, pc
c0dea90e:	e000      	b.n	c0dea912 <displayFullValuePage+0x186>
c0dea910:	6863      	ldr	r3, [r4, #4]
c0dea912:	eb09 0008 	add.w	r0, r9, r8
c0dea916:	6822      	ldr	r2, [r4, #0]
c0dea918:	4629      	mov	r1, r5
c0dea91a:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0dea91c:	f7fb fa72 	bl	c0de5e04 <nbgl_layoutAddTextContent>
c0dea920:	eb09 0008 	add.w	r0, r9, r8
c0dea924:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0dea926:	f7fc ff47 	bl	c0de77b8 <nbgl_layoutDraw>
c0dea92a:	f001 f940 	bl	c0debbae <nbgl_refresh>
c0dea92e:	b012      	add	sp, #72	@ 0x48
c0dea930:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0dea934:	0000191c 	.word	0x0000191c
c0dea938:	00001be8 	.word	0x00001be8
c0dea93c:	00005012 	.word	0x00005012
c0dea940:	000031fc 	.word	0x000031fc
c0dea944:	000034e5 	.word	0x000034e5

c0dea948 <displaySecurityReport>:
c0dea948:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea94c:	b09a      	sub	sp, #104	@ 0x68
c0dea94e:	ac13      	add	r4, sp, #76	@ 0x4c
c0dea950:	4974      	ldr	r1, [pc, #464]	@ (c0deab24 <displaySecurityReport+0x1dc>)
c0dea952:	4605      	mov	r5, r0
c0dea954:	221c      	movs	r2, #28
c0dea956:	4620      	mov	r0, r4
c0dea958:	4479      	add	r1, pc
c0dea95a:	f001 fd5d 	bl	c0dec418 <__aeabi_memcpy>
c0dea95e:	4872      	ldr	r0, [pc, #456]	@ (c0deab28 <displaySecurityReport+0x1e0>)
c0dea960:	a90f      	add	r1, sp, #60	@ 0x3c
c0dea962:	4478      	add	r0, pc
c0dea964:	e890 00cc 	ldmia.w	r0, {r2, r3, r6, r7}
c0dea968:	c1cc      	stmia	r1!, {r2, r3, r6, r7}
c0dea96a:	a809      	add	r0, sp, #36	@ 0x24
c0dea96c:	2118      	movs	r1, #24
c0dea96e:	f001 fd5d 	bl	c0dec42c <__aeabi_memclr>
c0dea972:	f8df b1a8 	ldr.w	fp, [pc, #424]	@ c0deab1c <displaySecurityReport+0x1d4>
c0dea976:	4620      	mov	r0, r4
c0dea978:	eb09 060b 	add.w	r6, r9, fp
c0dea97c:	f7f9 fd22 	bl	c0de43c4 <nbgl_layoutGet>
c0dea980:	4604      	mov	r4, r0
c0dea982:	6670      	str	r0, [r6, #100]	@ 0x64
c0dea984:	f896 0068 	ldrb.w	r0, [r6, #104]	@ 0x68
c0dea988:	2801      	cmp	r0, #1
c0dea98a:	d14b      	bne.n	c0deaa24 <displaySecurityReport+0xdc>
c0dea98c:	f896 0069 	ldrb.w	r0, [r6, #105]	@ 0x69
c0dea990:	2800      	cmp	r0, #0
c0dea992:	d147      	bne.n	c0deaa24 <displaySecurityReport+0xdc>
c0dea994:	4865      	ldr	r0, [pc, #404]	@ (c0deab2c <displaySecurityReport+0x1e4>)
c0dea996:	2600      	movs	r6, #0
c0dea998:	466c      	mov	r4, sp
c0dea99a:	f04f 0800 	mov.w	r8, #0
c0dea99e:	4478      	add	r0, pc
c0dea9a0:	1d05      	adds	r5, r0, #4
c0dea9a2:	2e05      	cmp	r6, #5
c0dea9a4:	d075      	beq.n	c0deaa92 <displaySecurityReport+0x14a>
c0dea9a6:	eb09 000b 	add.w	r0, r9, fp
c0dea9aa:	f8d0 a058 	ldr.w	sl, [r0, #88]	@ 0x58
c0dea9ae:	f8da 0000 	ldr.w	r0, [sl]
c0dea9b2:	40f0      	lsrs	r0, r6
c0dea9b4:	07c0      	lsls	r0, r0, #31
c0dea9b6:	d02b      	beq.n	c0deaa10 <displaySecurityReport+0xc8>
c0dea9b8:	4620      	mov	r0, r4
c0dea9ba:	2118      	movs	r1, #24
c0dea9bc:	f001 fd36 	bl	c0dec42c <__aeabi_memclr>
c0dea9c0:	f008 007f 	and.w	r0, r8, #127	@ 0x7f
c0dea9c4:	2804      	cmp	r0, #4
c0dea9c6:	d828      	bhi.n	c0deaa1a <displaySecurityReport+0xd2>
c0dea9c8:	2101      	movs	r1, #1
c0dea9ca:	fa01 f000 	lsl.w	r0, r1, r0
c0dea9ce:	f010 0f19 	tst.w	r0, #25
c0dea9d2:	d022      	beq.n	c0deaa1a <displaySecurityReport+0xd2>
c0dea9d4:	6868      	ldr	r0, [r5, #4]
c0dea9d6:	9003      	str	r0, [sp, #12]
c0dea9d8:	6828      	ldr	r0, [r5, #0]
c0dea9da:	2e03      	cmp	r6, #3
c0dea9dc:	9001      	str	r0, [sp, #4]
c0dea9de:	d101      	bne.n	c0dea9e4 <displaySecurityReport+0x9c>
c0dea9e0:	20ff      	movs	r0, #255	@ 0xff
c0dea9e2:	e007      	b.n	c0dea9f4 <displaySecurityReport+0xac>
c0dea9e4:	2009      	movs	r0, #9
c0dea9e6:	f88d 0014 	strb.w	r0, [sp, #20]
c0dea9ea:	4851      	ldr	r0, [pc, #324]	@ (c0deab30 <displaySecurityReport+0x1e8>)
c0dea9ec:	4478      	add	r0, pc
c0dea9ee:	9002      	str	r0, [sp, #8]
c0dea9f0:	f106 0017 	add.w	r0, r6, #23
c0dea9f4:	f88d 0011 	strb.w	r0, [sp, #17]
c0dea9f8:	f855 0c04 	ldr.w	r0, [r5, #-4]
c0dea9fc:	eb09 070b 	add.w	r7, r9, fp
c0deaa00:	4621      	mov	r1, r4
c0deaa02:	9000      	str	r0, [sp, #0]
c0deaa04:	6e78      	ldr	r0, [r7, #100]	@ 0x64
c0deaa06:	f7fa fe8a 	bl	c0de571e <nbgl_layoutAddTouchableBar>
c0deaa0a:	6e78      	ldr	r0, [r7, #100]	@ 0x64
c0deaa0c:	f7fc f948 	bl	c0de6ca0 <nbgl_layoutAddSeparationLine>
c0deaa10:	350c      	adds	r5, #12
c0deaa12:	f108 0801 	add.w	r8, r8, #1
c0deaa16:	3601      	adds	r6, #1
c0deaa18:	e7c3      	b.n	c0dea9a2 <displaySecurityReport+0x5a>
c0deaa1a:	f8da 0010 	ldr.w	r0, [sl, #16]
c0deaa1e:	2800      	cmp	r0, #0
c0deaa20:	d1d9      	bne.n	c0dea9d6 <displaySecurityReport+0x8e>
c0deaa22:	e7d7      	b.n	c0dea9d4 <displaySecurityReport+0x8c>
c0deaa24:	eb09 000b 	add.w	r0, r9, fp
c0deaa28:	6d80      	ldr	r0, [r0, #88]	@ 0x58
c0deaa2a:	b108      	cbz	r0, c0deaa30 <displaySecurityReport+0xe8>
c0deaa2c:	68c6      	ldr	r6, [r0, #12]
c0deaa2e:	b90e      	cbnz	r6, c0deaa34 <displaySecurityReport+0xec>
c0deaa30:	4e40      	ldr	r6, [pc, #256]	@ (c0deab34 <displaySecurityReport+0x1ec>)
c0deaa32:	447e      	add	r6, pc
c0deaa34:	f015 0f06 	tst.w	r5, #6
c0deaa38:	d035      	beq.n	c0deaaa6 <displaySecurityReport+0x15e>
c0deaa3a:	f44f 3180 	mov.w	r1, #65536	@ 0x10000
c0deaa3e:	9103      	str	r1, [sp, #12]
c0deaa40:	493d      	ldr	r1, [pc, #244]	@ (c0deab38 <displaySecurityReport+0x1f0>)
c0deaa42:	4479      	add	r1, pc
c0deaa44:	9102      	str	r1, [sp, #8]
c0deaa46:	2140      	movs	r1, #64	@ 0x40
c0deaa48:	6883      	ldr	r3, [r0, #8]
c0deaa4a:	4835      	ldr	r0, [pc, #212]	@ (c0deab20 <displaySecurityReport+0x1d8>)
c0deaa4c:	4448      	add	r0, r9
c0deaa4e:	9301      	str	r3, [sp, #4]
c0deaa50:	f100 0440 	add.w	r4, r0, #64	@ 0x40
c0deaa54:	9400      	str	r4, [sp, #0]
c0deaa56:	4620      	mov	r0, r4
c0deaa58:	4a38      	ldr	r2, [pc, #224]	@ (c0deab3c <displaySecurityReport+0x1f4>)
c0deaa5a:	447a      	add	r2, pc
c0deaa5c:	f001 f932 	bl	c0debcc4 <snprintf>
c0deaa60:	4620      	mov	r0, r4
c0deaa62:	f001 fd4f 	bl	c0dec504 <strlen>
c0deaa66:	4605      	mov	r5, r0
c0deaa68:	eb09 000b 	add.w	r0, r9, fp
c0deaa6c:	4669      	mov	r1, sp
c0deaa6e:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0deaa70:	f7fb fde5 	bl	c0de663e <nbgl_layoutAddQRCode>
c0deaa74:	2018      	movs	r0, #24
c0deaa76:	f1c5 013f 	rsb	r1, r5, #63	@ 0x3f
c0deaa7a:	4633      	mov	r3, r6
c0deaa7c:	f8ad 0028 	strh.w	r0, [sp, #40]	@ 0x28
c0deaa80:	1928      	adds	r0, r5, r4
c0deaa82:	4a2f      	ldr	r2, [pc, #188]	@ (c0deab40 <displaySecurityReport+0x1f8>)
c0deaa84:	1c44      	adds	r4, r0, #1
c0deaa86:	4620      	mov	r0, r4
c0deaa88:	447a      	add	r2, pc
c0deaa8a:	f001 f91b 	bl	c0debcc4 <snprintf>
c0deaa8e:	9411      	str	r4, [sp, #68]	@ 0x44
c0deaa90:	e030      	b.n	c0deaaf4 <displaySecurityReport+0x1ac>
c0deaa92:	4831      	ldr	r0, [pc, #196]	@ (c0deab58 <displaySecurityReport+0x210>)
c0deaa94:	4478      	add	r0, pc
c0deaa96:	9011      	str	r0, [sp, #68]	@ 0x44
c0deaa98:	eb09 000b 	add.w	r0, r9, fp
c0deaa9c:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0deaa9e:	a90f      	add	r1, sp, #60	@ 0x3c
c0deaaa0:	f7fc fa28 	bl	c0de6ef4 <nbgl_layoutAddHeader>
c0deaaa4:	e030      	b.n	c0deab08 <displaySecurityReport+0x1c0>
c0deaaa6:	06e8      	lsls	r0, r5, #27
c0deaaa8:	d40c      	bmi.n	c0deaac4 <displaySecurityReport+0x17c>
c0deaaaa:	07e8      	lsls	r0, r5, #31
c0deaaac:	d0f4      	beq.n	c0deaa98 <displaySecurityReport+0x150>
c0deaaae:	466d      	mov	r5, sp
c0deaab0:	2124      	movs	r1, #36	@ 0x24
c0deaab2:	4628      	mov	r0, r5
c0deaab4:	f001 fcba 	bl	c0dec42c <__aeabi_memclr>
c0deaab8:	4825      	ldr	r0, [pc, #148]	@ (c0deab50 <displaySecurityReport+0x208>)
c0deaaba:	4478      	add	r0, pc
c0deaabc:	9006      	str	r0, [sp, #24]
c0deaabe:	4825      	ldr	r0, [pc, #148]	@ (c0deab54 <displaySecurityReport+0x20c>)
c0deaac0:	4478      	add	r0, pc
c0deaac2:	e009      	b.n	c0deaad8 <displaySecurityReport+0x190>
c0deaac4:	466d      	mov	r5, sp
c0deaac6:	2124      	movs	r1, #36	@ 0x24
c0deaac8:	4628      	mov	r0, r5
c0deaaca:	f001 fcaf 	bl	c0dec42c <__aeabi_memclr>
c0deaace:	481d      	ldr	r0, [pc, #116]	@ (c0deab44 <displaySecurityReport+0x1fc>)
c0deaad0:	4478      	add	r0, pc
c0deaad2:	9006      	str	r0, [sp, #24]
c0deaad4:	481c      	ldr	r0, [pc, #112]	@ (c0deab48 <displaySecurityReport+0x200>)
c0deaad6:	4478      	add	r0, pc
c0deaad8:	9004      	str	r0, [sp, #16]
c0deaada:	4629      	mov	r1, r5
c0deaadc:	481b      	ldr	r0, [pc, #108]	@ (c0deab4c <displaySecurityReport+0x204>)
c0deaade:	4478      	add	r0, pc
c0deaae0:	9001      	str	r0, [sp, #4]
c0deaae2:	4620      	mov	r0, r4
c0deaae4:	f7fb fda2 	bl	c0de662c <nbgl_layoutAddContentCenter>
c0deaae8:	2040      	movs	r0, #64	@ 0x40
c0deaaea:	f8ad 0028 	strh.w	r0, [sp, #40]	@ 0x28
c0deaaee:	2000      	movs	r0, #0
c0deaaf0:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0deaaf4:	eb09 040b 	add.w	r4, r9, fp
c0deaaf8:	6e60      	ldr	r0, [r4, #100]	@ 0x64
c0deaafa:	a90f      	add	r1, sp, #60	@ 0x3c
c0deaafc:	f7fc f9fa 	bl	c0de6ef4 <nbgl_layoutAddHeader>
c0deab00:	6e60      	ldr	r0, [r4, #100]	@ 0x64
c0deab02:	a909      	add	r1, sp, #36	@ 0x24
c0deab04:	f7fa fa62 	bl	c0de4fcc <nbgl_layoutAddExtendedFooter>
c0deab08:	eb09 000b 	add.w	r0, r9, fp
c0deab0c:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0deab0e:	f7fc fe53 	bl	c0de77b8 <nbgl_layoutDraw>
c0deab12:	f001 f84c 	bl	c0debbae <nbgl_refresh>
c0deab16:	b01a      	add	sp, #104	@ 0x68
c0deab18:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0deab1c:	0000191c 	.word	0x0000191c
c0deab20:	00001a68 	.word	0x00001a68
c0deab24:	00004f50 	.word	0x00004f50
c0deab28:	00004eba 	.word	0x00004eba
c0deab2c:	00004ece 	.word	0x00004ece
c0deab30:	00002751 	.word	0x00002751
c0deab34:	0000337b 	.word	0x0000337b
c0deab38:	000031bc 	.word	0x000031bc
c0deab3c:	0000305b 	.word	0x0000305b
c0deab40:	0000310c 	.word	0x0000310c
c0deab44:	00003147 	.word	0x00003147
c0deab48:	00003235 	.word	0x00003235
c0deab4c:	000024ed 	.word	0x000024ed
c0deab50:	0000352d 	.word	0x0000352d
c0deab54:	00002eaa 	.word	0x00002eaa
c0deab58:	00003098 	.word	0x00003098

c0deab5c <displayCustomizedSecurityReport>:
c0deab5c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0deab60:	b092      	sub	sp, #72	@ 0x48
c0deab62:	4939      	ldr	r1, [pc, #228]	@ (c0deac48 <displayCustomizedSecurityReport+0xec>)
c0deab64:	f10d 0a2c 	add.w	sl, sp, #44	@ 0x2c
c0deab68:	4604      	mov	r4, r0
c0deab6a:	221c      	movs	r2, #28
c0deab6c:	4650      	mov	r0, sl
c0deab6e:	4479      	add	r1, pc
c0deab70:	f001 fc52 	bl	c0dec418 <__aeabi_memcpy>
c0deab74:	4835      	ldr	r0, [pc, #212]	@ (c0deac4c <displayCustomizedSecurityReport+0xf0>)
c0deab76:	ae07      	add	r6, sp, #28
c0deab78:	4631      	mov	r1, r6
c0deab7a:	4478      	add	r0, pc
c0deab7c:	e890 00ac 	ldmia.w	r0, {r2, r3, r5, r7}
c0deab80:	4830      	ldr	r0, [pc, #192]	@ (c0deac44 <displayCustomizedSecurityReport+0xe8>)
c0deab82:	c1ac      	stmia	r1!, {r2, r3, r5, r7}
c0deab84:	eb09 0500 	add.w	r5, r9, r0
c0deab88:	4650      	mov	r0, sl
c0deab8a:	f7f9 fc1b 	bl	c0de43c4 <nbgl_layoutGet>
c0deab8e:	6668      	str	r0, [r5, #100]	@ 0x64
c0deab90:	6821      	ldr	r1, [r4, #0]
c0deab92:	9109      	str	r1, [sp, #36]	@ 0x24
c0deab94:	4631      	mov	r1, r6
c0deab96:	f7fc f9ad 	bl	c0de6ef4 <nbgl_layoutAddHeader>
c0deab9a:	7920      	ldrb	r0, [r4, #4]
c0deab9c:	b398      	cbz	r0, c0deac06 <displayCustomizedSecurityReport+0xaa>
c0deab9e:	2801      	cmp	r0, #1
c0deaba0:	d03c      	beq.n	c0deac1c <displayCustomizedSecurityReport+0xc0>
c0deaba2:	2802      	cmp	r0, #2
c0deaba4:	d143      	bne.n	c0deac2e <displayCustomizedSecurityReport+0xd2>
c0deaba6:	4f2a      	ldr	r7, [pc, #168]	@ (c0deac50 <displayCustomizedSecurityReport+0xf4>)
c0deaba8:	2600      	movs	r6, #0
c0deabaa:	f04f 0a09 	mov.w	sl, #9
c0deabae:	f10d 0b04 	add.w	fp, sp, #4
c0deabb2:	2500      	movs	r5, #0
c0deabb4:	447f      	add	r7, pc
c0deabb6:	7a20      	ldrb	r0, [r4, #8]
c0deabb8:	4285      	cmp	r5, r0
c0deabba:	d238      	bcs.n	c0deac2e <displayCustomizedSecurityReport+0xd2>
c0deabbc:	f104 020c 	add.w	r2, r4, #12
c0deabc0:	ca07      	ldmia	r2, {r0, r1, r2}
c0deabc2:	f850 0025 	ldr.w	r0, [r0, r5, lsl #2]
c0deabc6:	9002      	str	r0, [sp, #8]
c0deabc8:	f851 0025 	ldr.w	r0, [r1, r5, lsl #2]
c0deabcc:	f88d a018 	strb.w	sl, [sp, #24]
c0deabd0:	f88d 6016 	strb.w	r6, [sp, #22]
c0deabd4:	f88d 6014 	strb.w	r6, [sp, #20]
c0deabd8:	4659      	mov	r1, fp
c0deabda:	e9cd 7003 	strd	r7, r0, [sp, #12]
c0deabde:	f105 0017 	add.w	r0, r5, #23
c0deabe2:	f88d 0015 	strb.w	r0, [sp, #21]
c0deabe6:	f852 0025 	ldr.w	r0, [r2, r5, lsl #2]
c0deabea:	9001      	str	r0, [sp, #4]
c0deabec:	4815      	ldr	r0, [pc, #84]	@ (c0deac44 <displayCustomizedSecurityReport+0xe8>)
c0deabee:	eb09 0800 	add.w	r8, r9, r0
c0deabf2:	f8d8 0064 	ldr.w	r0, [r8, #100]	@ 0x64
c0deabf6:	f7fa fd92 	bl	c0de571e <nbgl_layoutAddTouchableBar>
c0deabfa:	f8d8 0064 	ldr.w	r0, [r8, #100]	@ 0x64
c0deabfe:	f7fc f84f 	bl	c0de6ca0 <nbgl_layoutAddSeparationLine>
c0deac02:	3501      	adds	r5, #1
c0deac04:	e7d7      	b.n	c0deabb6 <displayCustomizedSecurityReport+0x5a>
c0deac06:	480f      	ldr	r0, [pc, #60]	@ (c0deac44 <displayCustomizedSecurityReport+0xe8>)
c0deac08:	f104 0108 	add.w	r1, r4, #8
c0deac0c:	4448      	add	r0, r9
c0deac0e:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0deac10:	f7fb fd0c 	bl	c0de662c <nbgl_layoutAddContentCenter>
c0deac14:	2000      	movs	r0, #0
c0deac16:	f88d 001d 	strb.w	r0, [sp, #29]
c0deac1a:	e008      	b.n	c0deac2e <displayCustomizedSecurityReport+0xd2>
c0deac1c:	4809      	ldr	r0, [pc, #36]	@ (c0deac44 <displayCustomizedSecurityReport+0xe8>)
c0deac1e:	f104 0108 	add.w	r1, r4, #8
c0deac22:	4448      	add	r0, r9
c0deac24:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0deac26:	f7fb fd0a 	bl	c0de663e <nbgl_layoutAddQRCode>
c0deac2a:	6820      	ldr	r0, [r4, #0]
c0deac2c:	9009      	str	r0, [sp, #36]	@ 0x24
c0deac2e:	4805      	ldr	r0, [pc, #20]	@ (c0deac44 <displayCustomizedSecurityReport+0xe8>)
c0deac30:	4448      	add	r0, r9
c0deac32:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0deac34:	f7fc fdc0 	bl	c0de77b8 <nbgl_layoutDraw>
c0deac38:	f000 ffb9 	bl	c0debbae <nbgl_refresh>
c0deac3c:	b012      	add	sp, #72	@ 0x48
c0deac3e:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0deac42:	bf00      	nop
c0deac44:	0000191c 	.word	0x0000191c
c0deac48:	00004d3a 	.word	0x00004d3a
c0deac4c:	00004ca2 	.word	0x00004ca2
c0deac50:	00002589 	.word	0x00002589

c0deac54 <displayInfosListModal>:
c0deac54:	b570      	push	{r4, r5, r6, lr}
c0deac56:	b098      	sub	sp, #96	@ 0x60
c0deac58:	4606      	mov	r6, r0
c0deac5a:	460c      	mov	r4, r1
c0deac5c:	a811      	add	r0, sp, #68	@ 0x44
c0deac5e:	491c      	ldr	r1, [pc, #112]	@ (c0deacd0 <displayInfosListModal+0x7c>)
c0deac60:	4615      	mov	r5, r2
c0deac62:	221c      	movs	r2, #28
c0deac64:	4479      	add	r1, pc
c0deac66:	f001 fbd7 	bl	c0dec418 <__aeabi_memcpy>
c0deac6a:	2008      	movs	r0, #8
c0deac6c:	f88d 0010 	strb.w	r0, [sp, #16]
c0deac70:	2000      	movs	r0, #0
c0deac72:	9003      	str	r0, [sp, #12]
c0deac74:	4814      	ldr	r0, [pc, #80]	@ (c0deacc8 <displayInfosListModal+0x74>)
c0deac76:	e9cd 6001 	strd	r6, r0, [sp, #4]
c0deac7a:	200f      	movs	r0, #15
c0deac7c:	2d00      	cmp	r5, #0
c0deac7e:	bf18      	it	ne
c0deac80:	200e      	movne	r0, #14
c0deac82:	f88d 0021 	strb.w	r0, [sp, #33]	@ 0x21
c0deac86:	e894 0007 	ldmia.w	r4, {r0, r1, r2}
c0deac8a:	ab05      	add	r3, sp, #20
c0deac8c:	c307      	stmia	r3!, {r0, r1, r2}
c0deac8e:	7b20      	ldrb	r0, [r4, #12]
c0deac90:	f88d 0020 	strb.w	r0, [sp, #32]
c0deac94:	7ba0      	ldrb	r0, [r4, #14]
c0deac96:	4c0d      	ldr	r4, [pc, #52]	@ (c0deaccc <displayInfosListModal+0x78>)
c0deac98:	f88d 0022 	strb.w	r0, [sp, #34]	@ 0x22
c0deac9c:	eb09 0004 	add.w	r0, r9, r4
c0deaca0:	6a00      	ldr	r0, [r0, #32]
c0deaca2:	b108      	cbz	r0, c0deaca8 <displayInfosListModal+0x54>
c0deaca4:	f7fd fec1 	bl	c0de8a2a <nbgl_pageRelease>
c0deaca8:	480a      	ldr	r0, [pc, #40]	@ (c0deacd4 <displayInfosListModal+0x80>)
c0deacaa:	a911      	add	r1, sp, #68	@ 0x44
c0deacac:	aa01      	add	r2, sp, #4
c0deacae:	2301      	movs	r3, #1
c0deacb0:	4478      	add	r0, pc
c0deacb2:	f7fd fc91 	bl	c0de85d8 <nbgl_pageDrawGenericContentExt>
c0deacb6:	eb09 0104 	add.w	r1, r9, r4
c0deacba:	6208      	str	r0, [r1, #32]
c0deacbc:	2002      	movs	r0, #2
c0deacbe:	f000 ff7b 	bl	c0debbb8 <nbgl_refreshSpecial>
c0deacc2:	b018      	add	sp, #96	@ 0x60
c0deacc4:	bd70      	pop	{r4, r5, r6, pc}
c0deacc6:	bf00      	nop
c0deacc8:	00091300 	.word	0x00091300
c0deaccc:	00001be8 	.word	0x00001be8
c0deacd0:	00004c60 	.word	0x00004c60
c0deacd4:	ffffef75 	.word	0xffffef75

c0deacd8 <modalLayoutTouchCallback>:
c0deacd8:	b570      	push	{r4, r5, r6, lr}
c0deacda:	2816      	cmp	r0, #22
c0deacdc:	d00a      	beq.n	c0deacf4 <modalLayoutTouchCallback+0x1c>
c0deacde:	2815      	cmp	r0, #21
c0deace0:	d117      	bne.n	c0dead12 <modalLayoutTouchCallback+0x3a>
c0deace2:	4833      	ldr	r0, [pc, #204]	@ (c0deadb0 <modalLayoutTouchCallback+0xd8>)
c0deace4:	eb09 0400 	add.w	r4, r9, r0
c0deace8:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0deacea:	f7fc fd93 	bl	c0de7814 <nbgl_layoutRelease>
c0deacee:	2000      	movs	r0, #0
c0deacf0:	6320      	str	r0, [r4, #48]	@ 0x30
c0deacf2:	e035      	b.n	c0dead60 <modalLayoutTouchCallback+0x88>
c0deacf4:	4c2d      	ldr	r4, [pc, #180]	@ (c0deadac <modalLayoutTouchCallback+0xd4>)
c0deacf6:	eb09 0504 	add.w	r5, r9, r4
c0deacfa:	6e68      	ldr	r0, [r5, #100]	@ 0x64
c0deacfc:	f7fc fd8a 	bl	c0de7814 <nbgl_layoutRelease>
c0dead00:	f895 0068 	ldrb.w	r0, [r5, #104]	@ 0x68
c0dead04:	2801      	cmp	r0, #1
c0dead06:	d817      	bhi.n	c0dead38 <modalLayoutTouchCallback+0x60>
c0dead08:	eb09 0004 	add.w	r0, r9, r4
c0dead0c:	2100      	movs	r1, #0
c0dead0e:	6641      	str	r1, [r0, #100]	@ 0x64
c0dead10:	e026      	b.n	c0dead60 <modalLayoutTouchCallback+0x88>
c0dead12:	f1a0 0417 	sub.w	r4, r0, #23
c0dead16:	2c04      	cmp	r4, #4
c0dead18:	d81a      	bhi.n	c0dead50 <modalLayoutTouchCallback+0x78>
c0dead1a:	4d24      	ldr	r5, [pc, #144]	@ (c0deadac <modalLayoutTouchCallback+0xd4>)
c0dead1c:	eb09 0605 	add.w	r6, r9, r5
c0dead20:	6e70      	ldr	r0, [r6, #100]	@ 0x64
c0dead22:	f7fc fd77 	bl	c0de7814 <nbgl_layoutRelease>
c0dead26:	2002      	movs	r0, #2
c0dead28:	f886 0068 	strb.w	r0, [r6, #104]	@ 0x68
c0dead2c:	6db0      	ldr	r0, [r6, #88]	@ 0x58
c0dead2e:	6801      	ldr	r1, [r0, #0]
c0dead30:	b331      	cbz	r1, c0dead80 <modalLayoutTouchCallback+0xa8>
c0dead32:	2001      	movs	r0, #1
c0dead34:	40a0      	lsls	r0, r4
c0dead36:	e007      	b.n	c0dead48 <modalLayoutTouchCallback+0x70>
c0dead38:	eb09 0004 	add.w	r0, r9, r4
c0dead3c:	2101      	movs	r1, #1
c0dead3e:	f880 1068 	strb.w	r1, [r0, #104]	@ 0x68
c0dead42:	6d81      	ldr	r1, [r0, #88]	@ 0x58
c0dead44:	6808      	ldr	r0, [r1, #0]
c0dead46:	b188      	cbz	r0, c0dead6c <modalLayoutTouchCallback+0x94>
c0dead48:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0dead4c:	f7ff bdfc 	b.w	c0dea948 <displaySecurityReport>
c0dead50:	4816      	ldr	r0, [pc, #88]	@ (c0deadac <modalLayoutTouchCallback+0xd4>)
c0dead52:	eb09 0400 	add.w	r4, r9, r0
c0dead56:	6ae0      	ldr	r0, [r4, #44]	@ 0x2c
c0dead58:	f7fc fd5c 	bl	c0de7814 <nbgl_layoutRelease>
c0dead5c:	2000      	movs	r0, #0
c0dead5e:	62e0      	str	r0, [r4, #44]	@ 0x2c
c0dead60:	f000 ff4d 	bl	c0debbfe <nbgl_screenRedraw>
c0dead64:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0dead68:	f000 bf21 	b.w	c0debbae <nbgl_refresh>
c0dead6c:	eb09 0004 	add.w	r0, r9, r4
c0dead70:	2214      	movs	r2, #20
c0dead72:	f890 0069 	ldrb.w	r0, [r0, #105]	@ 0x69
c0dead76:	2800      	cmp	r0, #0
c0dead78:	bf08      	it	eq
c0dead7a:	2218      	moveq	r2, #24
c0dead7c:	5888      	ldr	r0, [r1, r2]
c0dead7e:	e010      	b.n	c0deada2 <modalLayoutTouchCallback+0xca>
c0dead80:	eb09 0105 	add.w	r1, r9, r5
c0dead84:	2214      	movs	r2, #20
c0dead86:	f891 1069 	ldrb.w	r1, [r1, #105]	@ 0x69
c0dead8a:	2900      	cmp	r1, #0
c0dead8c:	bf08      	it	eq
c0dead8e:	2218      	moveq	r2, #24
c0dead90:	5880      	ldr	r0, [r0, r2]
c0dead92:	7901      	ldrb	r1, [r0, #4]
c0dead94:	2902      	cmp	r1, #2
c0dead96:	bf18      	it	ne
c0dead98:	bd70      	popne	{r4, r5, r6, pc}
c0dead9a:	6980      	ldr	r0, [r0, #24]
c0dead9c:	212c      	movs	r1, #44	@ 0x2c
c0dead9e:	fb04 0001 	mla	r0, r4, r1, r0
c0deada2:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0deada6:	f7ff bed9 	b.w	c0deab5c <displayCustomizedSecurityReport>
c0deadaa:	bf00      	nop
c0deadac:	0000191c 	.word	0x0000191c
c0deadb0:	00001a30 	.word	0x00001a30

c0deadb4 <displayDetailsPage>:
c0deadb4:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0deadb8:	b09b      	sub	sp, #108	@ 0x6c
c0deadba:	f8df a160 	ldr.w	sl, [pc, #352]	@ c0deaf1c <displayDetailsPage+0x168>
c0deadbe:	4604      	mov	r4, r0
c0deadc0:	f88d 004c 	strb.w	r0, [sp, #76]	@ 0x4c
c0deadc4:	2000      	movs	r0, #0
c0deadc6:	460e      	mov	r6, r1
c0deadc8:	4953      	ldr	r1, [pc, #332]	@ (c0deaf18 <displayDetailsPage+0x164>)
c0deadca:	9018      	str	r0, [sp, #96]	@ 0x60
c0deadcc:	f88d 0058 	strb.w	r0, [sp, #88]	@ 0x58
c0deadd0:	9015      	str	r0, [sp, #84]	@ 0x54
c0deadd2:	f44f 6010 	mov.w	r0, #2304	@ 0x900
c0deadd6:	eb09 050a 	add.w	r5, r9, sl
c0deadda:	f8ad 0050 	strh.w	r0, [sp, #80]	@ 0x50
c0deadde:	f44f 7081 	mov.w	r0, #258	@ 0x102
c0deade2:	9117      	str	r1, [sp, #92]	@ 0x5c
c0deade4:	2140      	movs	r1, #64	@ 0x40
c0deade6:	f895 8030 	ldrb.w	r8, [r5, #48]	@ 0x30
c0deadea:	f8ad 004e 	strh.w	r0, [sp, #78]	@ 0x4e
c0deadee:	f88d 804d 	strb.w	r8, [sp, #77]	@ 0x4d
c0deadf2:	a803      	add	r0, sp, #12
c0deadf4:	f001 fb1a 	bl	c0dec42c <__aeabi_memclr>
c0deadf8:	2001      	movs	r0, #1
c0deadfa:	f88d 0028 	strb.w	r0, [sp, #40]	@ 0x28
c0deadfe:	f88d 0024 	strb.w	r0, [sp, #36]	@ 0x24
c0deae02:	f105 0040 	add.w	r0, r5, #64	@ 0x40
c0deae06:	9007      	str	r0, [sp, #28]
c0deae08:	2004      	movs	r0, #4
c0deae0a:	f88d 0018 	strb.w	r0, [sp, #24]
c0deae0e:	f895 0033 	ldrb.w	r0, [r5, #51]	@ 0x33
c0deae12:	f88d 0029 	strb.w	r0, [sp, #41]	@ 0x29
c0deae16:	6a28      	ldr	r0, [r5, #32]
c0deae18:	b108      	cbz	r0, c0deae1e <displayDetailsPage+0x6a>
c0deae1a:	f7fd fe06 	bl	c0de8a2a <nbgl_pageRelease>
c0deae1e:	eb09 000a 	add.w	r0, r9, sl
c0deae22:	6b41      	ldr	r1, [r0, #52]	@ 0x34
c0deae24:	6401      	str	r1, [r0, #64]	@ 0x40
c0deae26:	f890 0031 	ldrb.w	r0, [r0, #49]	@ 0x31
c0deae2a:	42a0      	cmp	r0, r4
c0deae2c:	d207      	bcs.n	c0deae3e <displayDetailsPage+0x8a>
c0deae2e:	2501      	movs	r5, #1
c0deae30:	eb09 000a 	add.w	r0, r9, sl
c0deae34:	2e00      	cmp	r6, #0
c0deae36:	bf18      	it	ne
c0deae38:	2502      	movne	r5, #2
c0deae3a:	6bc6      	ldr	r6, [r0, #60]	@ 0x3c
c0deae3c:	e022      	b.n	c0deae84 <displayDetailsPage+0xd0>
c0deae3e:	eb09 000a 	add.w	r0, r9, sl
c0deae42:	2500      	movs	r5, #0
c0deae44:	f10d 076a 	add.w	r7, sp, #106	@ 0x6a
c0deae48:	6b86      	ldr	r6, [r0, #56]	@ 0x38
c0deae4a:	42a5      	cmp	r5, r4
c0deae4c:	d219      	bcs.n	c0deae82 <displayDetailsPage+0xce>
c0deae4e:	200c      	movs	r0, #12
c0deae50:	4631      	mov	r1, r6
c0deae52:	f000 fa1f 	bl	c0deb294 <OUTLINED_FUNCTION_11>
c0deae56:	280c      	cmp	r0, #12
c0deae58:	d311      	bcc.n	c0deae7e <displayDetailsPage+0xca>
c0deae5a:	eb09 000a 	add.w	r0, r9, sl
c0deae5e:	4631      	mov	r1, r6
c0deae60:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0deae64:	230b      	movs	r3, #11
c0deae66:	f890 0033 	ldrb.w	r0, [r0, #51]	@ 0x33
c0deae6a:	e9cd 7000 	strd	r7, r0, [sp]
c0deae6e:	200c      	movs	r0, #12
c0deae70:	f000 ff01 	bl	c0debc76 <nbgl_getTextMaxLenInNbLines>
c0deae74:	f8bd 006a 	ldrh.w	r0, [sp, #106]	@ 0x6a
c0deae78:	3803      	subs	r0, #3
c0deae7a:	b280      	uxth	r0, r0
c0deae7c:	4406      	add	r6, r0
c0deae7e:	3501      	adds	r5, #1
c0deae80:	e7e3      	b.n	c0deae4a <displayDetailsPage+0x96>
c0deae82:	2502      	movs	r5, #2
c0deae84:	eb09 000a 	add.w	r0, r9, sl
c0deae88:	4631      	mov	r1, r6
c0deae8a:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0deae8e:	f890 3033 	ldrb.w	r3, [r0, #51]	@ 0x33
c0deae92:	f880 4031 	strb.w	r4, [r0, #49]	@ 0x31
c0deae96:	6446      	str	r6, [r0, #68]	@ 0x44
c0deae98:	200c      	movs	r0, #12
c0deae9a:	f000 fee2 	bl	c0debc62 <nbgl_getTextNbLinesInWidth>
c0deae9e:	280c      	cmp	r0, #12
c0deaea0:	d31e      	bcc.n	c0deaee0 <displayDetailsPage+0x12c>
c0deaea2:	eb09 040a 	add.w	r4, r9, sl
c0deaea6:	f10d 026a 	add.w	r2, sp, #106	@ 0x6a
c0deaeaa:	230b      	movs	r3, #11
c0deaeac:	260b      	movs	r6, #11
c0deaeae:	f894 0033 	ldrb.w	r0, [r4, #51]	@ 0x33
c0deaeb2:	6c61      	ldr	r1, [r4, #68]	@ 0x44
c0deaeb4:	e9cd 2000 	strd	r2, r0, [sp]
c0deaeb8:	200c      	movs	r0, #12
c0deaeba:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0deaebe:	f000 feda 	bl	c0debc76 <nbgl_getTextMaxLenInNbLines>
c0deaec2:	f8bd 106a 	ldrh.w	r1, [sp, #106]	@ 0x6a
c0deaec6:	6c60      	ldr	r0, [r4, #68]	@ 0x44
c0deaec8:	1eca      	subs	r2, r1, #3
c0deaeca:	4401      	add	r1, r0
c0deaecc:	f811 3b01 	ldrb.w	r3, [r1], #1
c0deaed0:	b292      	uxth	r2, r2
c0deaed2:	2b0a      	cmp	r3, #10
c0deaed4:	bf18      	it	ne
c0deaed6:	1881      	addne	r1, r0, r2
c0deaed8:	63e1      	str	r1, [r4, #60]	@ 0x3c
c0deaeda:	f88d 6026 	strb.w	r6, [sp, #38]	@ 0x26
c0deaede:	e005      	b.n	c0deaeec <displayDetailsPage+0x138>
c0deaee0:	2100      	movs	r1, #0
c0deaee2:	eb09 000a 	add.w	r0, r9, sl
c0deaee6:	63c1      	str	r1, [r0, #60]	@ 0x3c
c0deaee8:	f88d 1026 	strb.w	r1, [sp, #38]	@ 0x26
c0deaeec:	f1b8 0f01 	cmp.w	r8, #1
c0deaef0:	d102      	bne.n	c0deaef8 <displayDetailsPage+0x144>
c0deaef2:	480b      	ldr	r0, [pc, #44]	@ (c0deaf20 <displayDetailsPage+0x16c>)
c0deaef4:	4478      	add	r0, pc
c0deaef6:	9018      	str	r0, [sp, #96]	@ 0x60
c0deaef8:	480a      	ldr	r0, [pc, #40]	@ (c0deaf24 <displayDetailsPage+0x170>)
c0deaefa:	a913      	add	r1, sp, #76	@ 0x4c
c0deaefc:	aa03      	add	r2, sp, #12
c0deaefe:	2301      	movs	r3, #1
c0deaf00:	4478      	add	r0, pc
c0deaf02:	f7fd fb69 	bl	c0de85d8 <nbgl_pageDrawGenericContentExt>
c0deaf06:	eb09 010a 	add.w	r1, r9, sl
c0deaf0a:	6208      	str	r0, [r1, #32]
c0deaf0c:	4628      	mov	r0, r5
c0deaf0e:	f000 fe53 	bl	c0debbb8 <nbgl_refreshSpecial>
c0deaf12:	b01b      	add	sp, #108	@ 0x6c
c0deaf14:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0deaf18:	03000101 	.word	0x03000101
c0deaf1c:	00001be8 	.word	0x00001be8
c0deaf20:	00002cec 	.word	0x00002cec
c0deaf24:	ffffed25 	.word	0xffffed25

c0deaf28 <displayTagValueListModalPage>:
c0deaf28:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0deaf2c:	b098      	sub	sp, #96	@ 0x60
c0deaf2e:	4e44      	ldr	r6, [pc, #272]	@ (c0deb040 <displayTagValueListModalPage+0x118>)
c0deaf30:	4605      	mov	r5, r0
c0deaf32:	f88d 0044 	strb.w	r0, [sp, #68]	@ 0x44
c0deaf36:	2000      	movs	r0, #0
c0deaf38:	4688      	mov	r8, r1
c0deaf3a:	4940      	ldr	r1, [pc, #256]	@ (c0deb03c <displayTagValueListModalPage+0x114>)
c0deaf3c:	9016      	str	r0, [sp, #88]	@ 0x58
c0deaf3e:	f88d 0050 	strb.w	r0, [sp, #80]	@ 0x50
c0deaf42:	9013      	str	r0, [sp, #76]	@ 0x4c
c0deaf44:	f44f 6010 	mov.w	r0, #2304	@ 0x900
c0deaf48:	eb09 0406 	add.w	r4, r9, r6
c0deaf4c:	f8ad 0048 	strh.w	r0, [sp, #72]	@ 0x48
c0deaf50:	f44f 7081 	mov.w	r0, #258	@ 0x102
c0deaf54:	9115      	str	r1, [sp, #84]	@ 0x54
c0deaf56:	2140      	movs	r1, #64	@ 0x40
c0deaf58:	f894 7030 	ldrb.w	r7, [r4, #48]	@ 0x30
c0deaf5c:	f8ad 0046 	strh.w	r0, [sp, #70]	@ 0x46
c0deaf60:	f88d 7045 	strb.w	r7, [sp, #69]	@ 0x45
c0deaf64:	a801      	add	r0, sp, #4
c0deaf66:	f001 fa61 	bl	c0dec42c <__aeabi_memclr>
c0deaf6a:	2001      	movs	r0, #1
c0deaf6c:	f894 1031 	ldrb.w	r1, [r4, #49]	@ 0x31
c0deaf70:	f894 2033 	ldrb.w	r2, [r4, #51]	@ 0x33
c0deaf74:	f88d 0020 	strb.w	r0, [sp, #32]
c0deaf78:	2004      	movs	r0, #4
c0deaf7a:	42a9      	cmp	r1, r5
c0deaf7c:	f88d 0010 	strb.w	r0, [sp, #16]
c0deaf80:	f88d 2021 	strb.w	r2, [sp, #33]	@ 0x21
c0deaf84:	d91b      	bls.n	c0deafbe <displayTagValueListModalPage+0x96>
c0deaf86:	1c69      	adds	r1, r5, #1
c0deaf88:	eb09 0306 	add.w	r3, r9, r6
c0deaf8c:	ea00 0281 	and.w	r2, r0, r1, lsl #2
c0deaf90:	b2c9      	uxtb	r1, r1
c0deaf92:	f103 0450 	add.w	r4, r3, #80	@ 0x50
c0deaf96:	ea00 0085 	and.w	r0, r0, r5, lsl #2
c0deaf9a:	0849      	lsrs	r1, r1, #1
c0deaf9c:	5c61      	ldrb	r1, [r4, r1]
c0deaf9e:	40d1      	lsrs	r1, r2
c0deafa0:	f893 2032 	ldrb.w	r2, [r3, #50]	@ 0x32
c0deafa4:	f001 0107 	and.w	r1, r1, #7
c0deafa8:	1a52      	subs	r2, r2, r1
c0deafaa:	0869      	lsrs	r1, r5, #1
c0deafac:	5c61      	ldrb	r1, [r4, r1]
c0deafae:	f883 2032 	strb.w	r2, [r3, #50]	@ 0x32
c0deafb2:	fa21 f000 	lsr.w	r0, r1, r0
c0deafb6:	f000 0107 	and.w	r1, r0, #7
c0deafba:	1a50      	subs	r0, r2, r1
c0deafbc:	e00d      	b.n	c0deafda <displayTagValueListModalPage+0xb2>
c0deafbe:	eb09 0206 	add.w	r2, r9, r6
c0deafc2:	ea00 0085 	and.w	r0, r0, r5, lsl #2
c0deafc6:	eb02 0155 	add.w	r1, r2, r5, lsr #1
c0deafca:	f891 1050 	ldrb.w	r1, [r1, #80]	@ 0x50
c0deafce:	fa21 f000 	lsr.w	r0, r1, r0
c0deafd2:	f000 0107 	and.w	r1, r0, #7
c0deafd6:	f892 0032 	ldrb.w	r0, [r2, #50]	@ 0x32
c0deafda:	4b1a      	ldr	r3, [pc, #104]	@ (c0deb044 <displayTagValueListModalPage+0x11c>)
c0deafdc:	eb09 0206 	add.w	r2, r9, r6
c0deafe0:	2f01      	cmp	r7, #1
c0deafe2:	f882 5031 	strb.w	r5, [r2, #49]	@ 0x31
c0deafe6:	444b      	add	r3, r9
c0deafe8:	6b9b      	ldr	r3, [r3, #56]	@ 0x38
c0deafea:	681b      	ldr	r3, [r3, #0]
c0deafec:	f88d 101c 	strb.w	r1, [sp, #28]
c0deaff0:	4401      	add	r1, r0
c0deaff2:	b2c0      	uxtb	r0, r0
c0deaff4:	f882 1032 	strb.w	r1, [r2, #50]	@ 0x32
c0deaff8:	eb03 1000 	add.w	r0, r3, r0, lsl #4
c0deaffc:	9005      	str	r0, [sp, #20]
c0deaffe:	d102      	bne.n	c0deb006 <displayTagValueListModalPage+0xde>
c0deb000:	4811      	ldr	r0, [pc, #68]	@ (c0deb048 <displayTagValueListModalPage+0x120>)
c0deb002:	4478      	add	r0, pc
c0deb004:	9016      	str	r0, [sp, #88]	@ 0x58
c0deb006:	eb09 0006 	add.w	r0, r9, r6
c0deb00a:	6a00      	ldr	r0, [r0, #32]
c0deb00c:	b108      	cbz	r0, c0deb012 <displayTagValueListModalPage+0xea>
c0deb00e:	f7fd fd0c 	bl	c0de8a2a <nbgl_pageRelease>
c0deb012:	480e      	ldr	r0, [pc, #56]	@ (c0deb04c <displayTagValueListModalPage+0x124>)
c0deb014:	a911      	add	r1, sp, #68	@ 0x44
c0deb016:	aa01      	add	r2, sp, #4
c0deb018:	2301      	movs	r3, #1
c0deb01a:	2501      	movs	r5, #1
c0deb01c:	4478      	add	r0, pc
c0deb01e:	f7fd fadb 	bl	c0de85d8 <nbgl_pageDrawGenericContentExt>
c0deb022:	eb09 0106 	add.w	r1, r9, r6
c0deb026:	f1b8 0f00 	cmp.w	r8, #0
c0deb02a:	6208      	str	r0, [r1, #32]
c0deb02c:	bf18      	it	ne
c0deb02e:	2502      	movne	r5, #2
c0deb030:	4628      	mov	r0, r5
c0deb032:	f000 fdc1 	bl	c0debbb8 <nbgl_refreshSpecial>
c0deb036:	b018      	add	sp, #96	@ 0x60
c0deb038:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0deb03c:	04000101 	.word	0x04000101
c0deb040:	00001be8 	.word	0x00001be8
c0deb044:	0000191c 	.word	0x0000191c
c0deb048:	00002bde 	.word	0x00002bde
c0deb04c:	ffffec09 	.word	0xffffec09

c0deb050 <bundleNavReviewChoice>:
c0deb050:	b120      	cbz	r0, c0deb05c <bundleNavReviewChoice+0xc>
c0deb052:	4806      	ldr	r0, [pc, #24]	@ (c0deb06c <bundleNavReviewChoice+0x1c>)
c0deb054:	4448      	add	r0, r9
c0deb056:	6a41      	ldr	r1, [r0, #36]	@ 0x24
c0deb058:	2001      	movs	r0, #1
c0deb05a:	4708      	bx	r1
c0deb05c:	4803      	ldr	r0, [pc, #12]	@ (c0deb06c <bundleNavReviewChoice+0x1c>)
c0deb05e:	4448      	add	r0, r9
c0deb060:	6a00      	ldr	r0, [r0, #32]
c0deb062:	4903      	ldr	r1, [pc, #12]	@ (c0deb070 <bundleNavReviewChoice+0x20>)
c0deb064:	4479      	add	r1, pc
c0deb066:	f000 b863 	b.w	c0deb130 <bundleNavReviewAskRejectionConfirmation>
c0deb06a:	bf00      	nop
c0deb06c:	00001c64 	.word	0x00001c64
c0deb070:	0000011d 	.word	0x0000011d

c0deb074 <initWarningTipBox>:
c0deb074:	4923      	ldr	r1, [pc, #140]	@ (c0deb104 <initWarningTipBox+0x90>)
c0deb076:	eb09 0201 	add.w	r2, r9, r1
c0deb07a:	6d92      	ldr	r2, [r2, #88]	@ 0x58
c0deb07c:	b15a      	cbz	r2, c0deb096 <initWarningTipBox+0x22>
c0deb07e:	6812      	ldr	r2, [r2, #0]
c0deb080:	07d3      	lsls	r3, r2, #31
c0deb082:	d111      	bne.n	c0deb0a8 <initWarningTipBox+0x34>
c0deb084:	0753      	lsls	r3, r2, #29
c0deb086:	d415      	bmi.n	c0deb0b4 <initWarningTipBox+0x40>
c0deb088:	0793      	lsls	r3, r2, #30
c0deb08a:	d419      	bmi.n	c0deb0c0 <initWarningTipBox+0x4c>
c0deb08c:	f002 0310 	and.w	r3, r2, #16
c0deb090:	0712      	lsls	r2, r2, #28
c0deb092:	d42c      	bmi.n	c0deb0ee <initWarningTipBox+0x7a>
c0deb094:	bb9b      	cbnz	r3, c0deb0fe <initWarningTipBox+0x8a>
c0deb096:	b348      	cbz	r0, c0deb0ec <initWarningTipBox+0x78>
c0deb098:	491b      	ldr	r1, [pc, #108]	@ (c0deb108 <initWarningTipBox+0x94>)
c0deb09a:	2200      	movs	r2, #0
c0deb09c:	4449      	add	r1, r9
c0deb09e:	620a      	str	r2, [r1, #32]
c0deb0a0:	6842      	ldr	r2, [r0, #4]
c0deb0a2:	62ca      	str	r2, [r1, #44]	@ 0x2c
c0deb0a4:	6800      	ldr	r0, [r0, #0]
c0deb0a6:	e01b      	b.n	c0deb0e0 <initWarningTipBox+0x6c>
c0deb0a8:	06d0      	lsls	r0, r2, #27
c0deb0aa:	4a18      	ldr	r2, [pc, #96]	@ (c0deb10c <initWarningTipBox+0x98>)
c0deb0ac:	4818      	ldr	r0, [pc, #96]	@ (c0deb110 <initWarningTipBox+0x9c>)
c0deb0ae:	447a      	add	r2, pc
c0deb0b0:	4478      	add	r0, pc
c0deb0b2:	e00a      	b.n	c0deb0ca <initWarningTipBox+0x56>
c0deb0b4:	06d0      	lsls	r0, r2, #27
c0deb0b6:	4a17      	ldr	r2, [pc, #92]	@ (c0deb114 <initWarningTipBox+0xa0>)
c0deb0b8:	4817      	ldr	r0, [pc, #92]	@ (c0deb118 <initWarningTipBox+0xa4>)
c0deb0ba:	447a      	add	r2, pc
c0deb0bc:	4478      	add	r0, pc
c0deb0be:	e004      	b.n	c0deb0ca <initWarningTipBox+0x56>
c0deb0c0:	06d0      	lsls	r0, r2, #27
c0deb0c2:	4a16      	ldr	r2, [pc, #88]	@ (c0deb11c <initWarningTipBox+0xa8>)
c0deb0c4:	4816      	ldr	r0, [pc, #88]	@ (c0deb120 <initWarningTipBox+0xac>)
c0deb0c6:	447a      	add	r2, pc
c0deb0c8:	4478      	add	r0, pc
c0deb0ca:	bf58      	it	pl
c0deb0cc:	4610      	movpl	r0, r2
c0deb0ce:	4449      	add	r1, r9
c0deb0d0:	2201      	movs	r2, #1
c0deb0d2:	f881 2021 	strb.w	r2, [r1, #33]	@ 0x21
c0deb0d6:	490c      	ldr	r1, [pc, #48]	@ (c0deb108 <initWarningTipBox+0x94>)
c0deb0d8:	2200      	movs	r2, #0
c0deb0da:	4449      	add	r1, r9
c0deb0dc:	620a      	str	r2, [r1, #32]
c0deb0de:	62ca      	str	r2, [r1, #44]	@ 0x2c
c0deb0e0:	4909      	ldr	r1, [pc, #36]	@ (c0deb108 <initWarningTipBox+0x94>)
c0deb0e2:	f640 1212 	movw	r2, #2322	@ 0x912
c0deb0e6:	4449      	add	r1, r9
c0deb0e8:	860a      	strh	r2, [r1, #48]	@ 0x30
c0deb0ea:	6288      	str	r0, [r1, #40]	@ 0x28
c0deb0ec:	4770      	bx	lr
c0deb0ee:	4a0d      	ldr	r2, [pc, #52]	@ (c0deb124 <initWarningTipBox+0xb0>)
c0deb0f0:	480d      	ldr	r0, [pc, #52]	@ (c0deb128 <initWarningTipBox+0xb4>)
c0deb0f2:	2b00      	cmp	r3, #0
c0deb0f4:	4478      	add	r0, pc
c0deb0f6:	447a      	add	r2, pc
c0deb0f8:	bf08      	it	eq
c0deb0fa:	4610      	moveq	r0, r2
c0deb0fc:	e7e7      	b.n	c0deb0ce <initWarningTipBox+0x5a>
c0deb0fe:	480b      	ldr	r0, [pc, #44]	@ (c0deb12c <initWarningTipBox+0xb8>)
c0deb100:	4478      	add	r0, pc
c0deb102:	e7e4      	b.n	c0deb0ce <initWarningTipBox+0x5a>
c0deb104:	0000191c 	.word	0x0000191c
c0deb108:	00001988 	.word	0x00001988
c0deb10c:	000028bc 	.word	0x000028bc
c0deb110:	000029a2 	.word	0x000029a2
c0deb114:	00003066 	.word	0x00003066
c0deb118:	0000292b 	.word	0x0000292b
c0deb11c:	00003098 	.word	0x00003098
c0deb120:	00002e07 	.word	0x00002e07
c0deb124:	00002e10 	.word	0x00002e10
c0deb128:	00003083 	.word	0x00003083
c0deb12c:	00002cc5 	.word	0x00002cc5

c0deb130 <bundleNavReviewAskRejectionConfirmation>:
c0deb130:	f020 00f0 	bic.w	r0, r0, #240	@ 0xf0
c0deb134:	b130      	cbz	r0, c0deb144 <bundleNavReviewAskRejectionConfirmation+0x14>
c0deb136:	2801      	cmp	r0, #1
c0deb138:	d109      	bne.n	c0deb14e <bundleNavReviewAskRejectionConfirmation+0x1e>
c0deb13a:	4b0d      	ldr	r3, [pc, #52]	@ (c0deb170 <bundleNavReviewAskRejectionConfirmation+0x40>)
c0deb13c:	480d      	ldr	r0, [pc, #52]	@ (c0deb174 <bundleNavReviewAskRejectionConfirmation+0x44>)
c0deb13e:	447b      	add	r3, pc
c0deb140:	4478      	add	r0, pc
c0deb142:	e008      	b.n	c0deb156 <bundleNavReviewAskRejectionConfirmation+0x26>
c0deb144:	4b08      	ldr	r3, [pc, #32]	@ (c0deb168 <bundleNavReviewAskRejectionConfirmation+0x38>)
c0deb146:	4809      	ldr	r0, [pc, #36]	@ (c0deb16c <bundleNavReviewAskRejectionConfirmation+0x3c>)
c0deb148:	447b      	add	r3, pc
c0deb14a:	4478      	add	r0, pc
c0deb14c:	e003      	b.n	c0deb156 <bundleNavReviewAskRejectionConfirmation+0x26>
c0deb14e:	4b0a      	ldr	r3, [pc, #40]	@ (c0deb178 <bundleNavReviewAskRejectionConfirmation+0x48>)
c0deb150:	480a      	ldr	r0, [pc, #40]	@ (c0deb17c <bundleNavReviewAskRejectionConfirmation+0x4c>)
c0deb152:	447b      	add	r3, pc
c0deb154:	4478      	add	r0, pc
c0deb156:	b5e0      	push	{r5, r6, r7, lr}
c0deb158:	9100      	str	r1, [sp, #0]
c0deb15a:	2100      	movs	r1, #0
c0deb15c:	4a08      	ldr	r2, [pc, #32]	@ (c0deb180 <bundleNavReviewAskRejectionConfirmation+0x50>)
c0deb15e:	447a      	add	r2, pc
c0deb160:	f7fe fd38 	bl	c0de9bd4 <nbgl_useCaseConfirm>
c0deb164:	bd8c      	pop	{r2, r3, r7, pc}
c0deb166:	bf00      	nop
c0deb168:	00002a56 	.word	0x00002a56
c0deb16c:	00002889 	.word	0x00002889
c0deb170:	00002d7e 	.word	0x00002d7e
c0deb174:	00003156 	.word	0x00003156
c0deb178:	000028eb 	.word	0x000028eb
c0deb17c:	00002e00 	.word	0x00002e00
c0deb180:	00002bd5 	.word	0x00002bd5

c0deb184 <bundleNavReviewConfirmRejection>:
c0deb184:	4801      	ldr	r0, [pc, #4]	@ (c0deb18c <bundleNavReviewConfirmRejection+0x8>)
c0deb186:	f000 b881 	b.w	c0deb28c <OUTLINED_FUNCTION_9>
c0deb18a:	bf00      	nop
c0deb18c:	00001c64 	.word	0x00001c64

c0deb190 <layoutTouchCallback>:
c0deb190:	b5f0      	push	{r4, r5, r6, r7, lr}
c0deb192:	b087      	sub	sp, #28
c0deb194:	2811      	cmp	r0, #17
c0deb196:	d017      	beq.n	c0deb1c8 <layoutTouchCallback+0x38>
c0deb198:	2814      	cmp	r0, #20
c0deb19a:	d142      	bne.n	c0deb222 <layoutTouchCallback+0x92>
c0deb19c:	b1e9      	cbz	r1, c0deb1da <layoutTouchCallback+0x4a>
c0deb19e:	4922      	ldr	r1, [pc, #136]	@ (c0deb228 <layoutTouchCallback+0x98>)
c0deb1a0:	2400      	movs	r4, #0
c0deb1a2:	eb09 0201 	add.w	r2, r9, r1
c0deb1a6:	eb09 0501 	add.w	r5, r9, r1
c0deb1aa:	f882 4069 	strb.w	r4, [r2, #105]	@ 0x69
c0deb1ae:	6c10      	ldr	r0, [r2, #64]	@ 0x40
c0deb1b0:	f892 203c 	ldrb.w	r2, [r2, #60]	@ 0x3c
c0deb1b4:	b33a      	cbz	r2, c0deb206 <layoutTouchCallback+0x76>
c0deb1b6:	f105 0348 	add.w	r3, r5, #72	@ 0x48
c0deb1ba:	6ded      	ldr	r5, [r5, #92]	@ 0x5c
c0deb1bc:	cb0e      	ldmia	r3, {r1, r2, r3}
c0deb1be:	e9cd 5400 	strd	r5, r4, [sp]
c0deb1c2:	f7fe fff5 	bl	c0dea1b0 <useCaseReviewStreamingStart>
c0deb1c6:	e02c      	b.n	c0deb222 <layoutTouchCallback+0x92>
c0deb1c8:	4a17      	ldr	r2, [pc, #92]	@ (c0deb228 <layoutTouchCallback+0x98>)
c0deb1ca:	f000 f84a 	bl	c0deb262 <OUTLINED_FUNCTION_4>
c0deb1ce:	d00c      	beq.n	c0deb1ea <layoutTouchCallback+0x5a>
c0deb1d0:	b007      	add	sp, #28
c0deb1d2:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0deb1d6:	f7ff bbb7 	b.w	c0dea948 <displaySecurityReport>
c0deb1da:	4813      	ldr	r0, [pc, #76]	@ (c0deb228 <layoutTouchCallback+0x98>)
c0deb1dc:	4448      	add	r0, r9
c0deb1de:	6dc1      	ldr	r1, [r0, #92]	@ 0x5c
c0deb1e0:	2000      	movs	r0, #0
c0deb1e2:	b007      	add	sp, #28
c0deb1e4:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0deb1e8:	4708      	bx	r1
c0deb1ea:	eb09 0002 	add.w	r0, r9, r2
c0deb1ee:	2214      	movs	r2, #20
c0deb1f0:	f890 0069 	ldrb.w	r0, [r0, #105]	@ 0x69
c0deb1f4:	2800      	cmp	r0, #0
c0deb1f6:	bf08      	it	eq
c0deb1f8:	2218      	moveq	r2, #24
c0deb1fa:	5888      	ldr	r0, [r1, r2]
c0deb1fc:	b007      	add	sp, #28
c0deb1fe:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0deb202:	f7ff bcab 	b.w	c0deab5c <displayCustomizedSecurityReport>
c0deb206:	f105 0744 	add.w	r7, r5, #68	@ 0x44
c0deb20a:	6ded      	ldr	r5, [r5, #92]	@ 0x5c
c0deb20c:	cfce      	ldmia	r7, {r1, r2, r3, r6, r7}
c0deb20e:	9405      	str	r4, [sp, #20]
c0deb210:	e9cd 6700 	strd	r6, r7, [sp]
c0deb214:	e9cd 5403 	strd	r5, r4, [sp, #12]
c0deb218:	4c04      	ldr	r4, [pc, #16]	@ (c0deb22c <layoutTouchCallback+0x9c>)
c0deb21a:	444c      	add	r4, r9
c0deb21c:	9402      	str	r4, [sp, #8]
c0deb21e:	f7fe fddf 	bl	c0de9de0 <useCaseReview>
c0deb222:	b007      	add	sp, #28
c0deb224:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0deb226:	bf00      	nop
c0deb228:	0000191c 	.word	0x0000191c
c0deb22c:	00001c64 	.word	0x00001c64

c0deb230 <bundleNavReviewStreamingConfirmRejection>:
c0deb230:	4801      	ldr	r0, [pc, #4]	@ (c0deb238 <bundleNavReviewStreamingConfirmRejection+0x8>)
c0deb232:	f000 b82b 	b.w	c0deb28c <OUTLINED_FUNCTION_9>
c0deb236:	bf00      	nop
c0deb238:	00001c64 	.word	0x00001c64

c0deb23c <OUTLINED_FUNCTION_0>:
c0deb23c:	4615      	mov	r5, r2
c0deb23e:	460e      	mov	r6, r1
c0deb240:	4607      	mov	r7, r0
c0deb242:	f7fd be0d 	b.w	c0de8e60 <reset_callbacks_and_context>

c0deb246 <OUTLINED_FUNCTION_1>:
c0deb246:	f8da 0004 	ldr.w	r0, [sl, #4]
c0deb24a:	eb00 0086 	add.w	r0, r0, r6, lsl #2
c0deb24e:	f000 becb 	b.w	c0debfe8 <pic>

c0deb252 <OUTLINED_FUNCTION_2>:
c0deb252:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0deb256:	2301      	movs	r3, #1
c0deb258:	f000 bcfe 	b.w	c0debc58 <nbgl_getTextHeightInWidth>

c0deb25c <OUTLINED_FUNCTION_3>:
c0deb25c:	2001      	movs	r0, #1
c0deb25e:	f000 bcab 	b.w	c0debbb8 <nbgl_refreshSpecial>

c0deb262 <OUTLINED_FUNCTION_4>:
c0deb262:	2101      	movs	r1, #1
c0deb264:	eb09 0002 	add.w	r0, r9, r2
c0deb268:	f880 1068 	strb.w	r1, [r0, #104]	@ 0x68
c0deb26c:	6d81      	ldr	r1, [r0, #88]	@ 0x58
c0deb26e:	6808      	ldr	r0, [r1, #0]
c0deb270:	2800      	cmp	r0, #0
c0deb272:	4770      	bx	lr

c0deb274 <OUTLINED_FUNCTION_5>:
c0deb274:	2000      	movs	r0, #0
c0deb276:	f7fd bed1 	b.w	c0de901c <getNbPagesForGenericContents>

c0deb27a <OUTLINED_FUNCTION_6>:
c0deb27a:	2008      	movs	r0, #8
c0deb27c:	f7f8 be9a 	b.w	c0de3fb4 <os_io_seph_cmd_piezo_play_tune>

c0deb280 <OUTLINED_FUNCTION_7>:
c0deb280:	9001      	str	r0, [sp, #4]
c0deb282:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0deb284:	9000      	str	r0, [sp, #0]
c0deb286:	4638      	mov	r0, r7
c0deb288:	f7fe bdaa 	b.w	c0de9de0 <useCaseReview>

c0deb28c <OUTLINED_FUNCTION_9>:
c0deb28c:	4448      	add	r0, r9
c0deb28e:	6a41      	ldr	r1, [r0, #36]	@ 0x24
c0deb290:	2000      	movs	r0, #0
c0deb292:	4708      	bx	r1

c0deb294 <OUTLINED_FUNCTION_11>:
c0deb294:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0deb298:	2300      	movs	r3, #0
c0deb29a:	f000 bce2 	b.w	c0debc62 <nbgl_getTextNbLinesInWidth>

c0deb29e <OUTLINED_FUNCTION_12>:
c0deb29e:	200b      	movs	r0, #11
c0deb2a0:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0deb2a4:	f000 bcd8 	b.w	c0debc58 <nbgl_getTextHeightInWidth>

c0deb2a8 <OUTLINED_FUNCTION_13>:
c0deb2a8:	4630      	mov	r0, r6
c0deb2aa:	f001 b8bf 	b.w	c0dec42c <__aeabi_memclr>

c0deb2ae <OUTLINED_FUNCTION_14>:
c0deb2ae:	f10a 0004 	add.w	r0, sl, #4
c0deb2b2:	f107 0110 	add.w	r1, r7, #16
c0deb2b6:	4770      	bx	lr

c0deb2b8 <bip32_path_read>:
c0deb2b8:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0deb2bc:	b10b      	cbz	r3, c0deb2c2 <bip32_path_read+0xa>
c0deb2be:	2b0a      	cmp	r3, #10
c0deb2c0:	d902      	bls.n	c0deb2c8 <bip32_path_read+0x10>
c0deb2c2:	2000      	movs	r0, #0
c0deb2c4:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0deb2c8:	4692      	mov	sl, r2
c0deb2ca:	460e      	mov	r6, r1
c0deb2cc:	4683      	mov	fp, r0
c0deb2ce:	425f      	negs	r7, r3
c0deb2d0:	2500      	movs	r5, #0
c0deb2d2:	f04f 0800 	mov.w	r8, #0
c0deb2d6:	9301      	str	r3, [sp, #4]
c0deb2d8:	42af      	cmp	r7, r5
c0deb2da:	d00c      	beq.n	c0deb2f6 <bip32_path_read+0x3e>
c0deb2dc:	f108 0404 	add.w	r4, r8, #4
c0deb2e0:	42b4      	cmp	r4, r6
c0deb2e2:	d808      	bhi.n	c0deb2f6 <bip32_path_read+0x3e>
c0deb2e4:	4658      	mov	r0, fp
c0deb2e6:	4641      	mov	r1, r8
c0deb2e8:	f000 faee 	bl	c0deb8c8 <read_u32_be>
c0deb2ec:	f84a 0008 	str.w	r0, [sl, r8]
c0deb2f0:	3d01      	subs	r5, #1
c0deb2f2:	46a0      	mov	r8, r4
c0deb2f4:	e7f0      	b.n	c0deb2d8 <bip32_path_read+0x20>
c0deb2f6:	9a01      	ldr	r2, [sp, #4]
c0deb2f8:	4269      	negs	r1, r5
c0deb2fa:	2000      	movs	r0, #0
c0deb2fc:	4291      	cmp	r1, r2
c0deb2fe:	bf28      	it	cs
c0deb300:	2001      	movcs	r0, #1
c0deb302:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0deb306 <buffer_seek_cur>:
c0deb306:	6882      	ldr	r2, [r0, #8]
c0deb308:	1889      	adds	r1, r1, r2
c0deb30a:	d205      	bcs.n	c0deb318 <buffer_seek_cur+0x12>
c0deb30c:	6842      	ldr	r2, [r0, #4]
c0deb30e:	4291      	cmp	r1, r2
c0deb310:	bf9e      	ittt	ls
c0deb312:	6081      	strls	r1, [r0, #8]
c0deb314:	2001      	movls	r0, #1
c0deb316:	4770      	bxls	lr
c0deb318:	2000      	movs	r0, #0
c0deb31a:	4770      	bx	lr

c0deb31c <buffer_read_u8>:
c0deb31c:	b510      	push	{r4, lr}
c0deb31e:	e9d0 2301 	ldrd	r2, r3, [r0, #4]
c0deb322:	429a      	cmp	r2, r3
c0deb324:	d00a      	beq.n	c0deb33c <buffer_read_u8+0x20>
c0deb326:	6804      	ldr	r4, [r0, #0]
c0deb328:	5ce4      	ldrb	r4, [r4, r3]
c0deb32a:	700c      	strb	r4, [r1, #0]
c0deb32c:	6881      	ldr	r1, [r0, #8]
c0deb32e:	3101      	adds	r1, #1
c0deb330:	d206      	bcs.n	c0deb340 <buffer_read_u8+0x24>
c0deb332:	6844      	ldr	r4, [r0, #4]
c0deb334:	42a1      	cmp	r1, r4
c0deb336:	bf98      	it	ls
c0deb338:	6081      	strls	r1, [r0, #8]
c0deb33a:	e001      	b.n	c0deb340 <buffer_read_u8+0x24>
c0deb33c:	2000      	movs	r0, #0
c0deb33e:	7008      	strb	r0, [r1, #0]
c0deb340:	1ad0      	subs	r0, r2, r3
c0deb342:	bf18      	it	ne
c0deb344:	2001      	movne	r0, #1
c0deb346:	bd10      	pop	{r4, pc}

c0deb348 <buffer_read_u64>:
c0deb348:	b570      	push	{r4, r5, r6, lr}
c0deb34a:	f000 f87d 	bl	c0deb448 <OUTLINED_FUNCTION_0>
c0deb34e:	2e07      	cmp	r6, #7
c0deb350:	d904      	bls.n	c0deb35c <buffer_read_u64+0x14>
c0deb352:	6820      	ldr	r0, [r4, #0]
c0deb354:	b132      	cbz	r2, c0deb364 <buffer_read_u64+0x1c>
c0deb356:	f000 faee 	bl	c0deb936 <read_u64_le>
c0deb35a:	e005      	b.n	c0deb368 <buffer_read_u64+0x20>
c0deb35c:	2000      	movs	r0, #0
c0deb35e:	e9c5 0000 	strd	r0, r0, [r5]
c0deb362:	e00c      	b.n	c0deb37e <buffer_read_u64+0x36>
c0deb364:	f000 fabc 	bl	c0deb8e0 <read_u64_be>
c0deb368:	e9c5 0100 	strd	r0, r1, [r5]
c0deb36c:	68a0      	ldr	r0, [r4, #8]
c0deb36e:	f110 0f09 	cmn.w	r0, #9
c0deb372:	d804      	bhi.n	c0deb37e <buffer_read_u64+0x36>
c0deb374:	6861      	ldr	r1, [r4, #4]
c0deb376:	3008      	adds	r0, #8
c0deb378:	4288      	cmp	r0, r1
c0deb37a:	bf98      	it	ls
c0deb37c:	60a0      	strls	r0, [r4, #8]
c0deb37e:	2000      	movs	r0, #0
c0deb380:	2e07      	cmp	r6, #7
c0deb382:	bf88      	it	hi
c0deb384:	2001      	movhi	r0, #1
c0deb386:	bd70      	pop	{r4, r5, r6, pc}

c0deb388 <buffer_read_varint>:
c0deb388:	b5b0      	push	{r4, r5, r7, lr}
c0deb38a:	4604      	mov	r4, r0
c0deb38c:	460d      	mov	r5, r1
c0deb38e:	6800      	ldr	r0, [r0, #0]
c0deb390:	e9d4 1201 	ldrd	r1, r2, [r4, #4]
c0deb394:	4410      	add	r0, r2
c0deb396:	1a89      	subs	r1, r1, r2
c0deb398:	462a      	mov	r2, r5
c0deb39a:	f000 fae3 	bl	c0deb964 <varint_read>
c0deb39e:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0deb3a2:	dd0a      	ble.n	c0deb3ba <buffer_read_varint+0x32>
c0deb3a4:	68a1      	ldr	r1, [r4, #8]
c0deb3a6:	1840      	adds	r0, r0, r1
c0deb3a8:	d205      	bcs.n	c0deb3b6 <buffer_read_varint+0x2e>
c0deb3aa:	6861      	ldr	r1, [r4, #4]
c0deb3ac:	4288      	cmp	r0, r1
c0deb3ae:	bf9e      	ittt	ls
c0deb3b0:	60a0      	strls	r0, [r4, #8]
c0deb3b2:	2001      	movls	r0, #1
c0deb3b4:	bdb0      	popls	{r4, r5, r7, pc}
c0deb3b6:	2000      	movs	r0, #0
c0deb3b8:	bdb0      	pop	{r4, r5, r7, pc}
c0deb3ba:	2000      	movs	r0, #0
c0deb3bc:	e9c5 0000 	strd	r0, r0, [r5]
c0deb3c0:	bdb0      	pop	{r4, r5, r7, pc}

c0deb3c2 <buffer_read_bip32_path>:
c0deb3c2:	b5b0      	push	{r4, r5, r7, lr}
c0deb3c4:	4604      	mov	r4, r0
c0deb3c6:	4615      	mov	r5, r2
c0deb3c8:	460a      	mov	r2, r1
c0deb3ca:	6800      	ldr	r0, [r0, #0]
c0deb3cc:	e9d4 1301 	ldrd	r1, r3, [r4, #4]
c0deb3d0:	4418      	add	r0, r3
c0deb3d2:	1ac9      	subs	r1, r1, r3
c0deb3d4:	462b      	mov	r3, r5
c0deb3d6:	f7ff ff6f 	bl	c0deb2b8 <bip32_path_read>
c0deb3da:	b140      	cbz	r0, c0deb3ee <buffer_read_bip32_path+0x2c>
c0deb3dc:	68a2      	ldr	r2, [r4, #8]
c0deb3de:	eb02 0185 	add.w	r1, r2, r5, lsl #2
c0deb3e2:	4291      	cmp	r1, r2
c0deb3e4:	d303      	bcc.n	c0deb3ee <buffer_read_bip32_path+0x2c>
c0deb3e6:	6862      	ldr	r2, [r4, #4]
c0deb3e8:	4291      	cmp	r1, r2
c0deb3ea:	bf98      	it	ls
c0deb3ec:	60a1      	strls	r1, [r4, #8]
c0deb3ee:	bdb0      	pop	{r4, r5, r7, pc}

c0deb3f0 <buffer_copy>:
c0deb3f0:	b5b0      	push	{r4, r5, r7, lr}
c0deb3f2:	4614      	mov	r4, r2
c0deb3f4:	e9d0 3201 	ldrd	r3, r2, [r0, #4]
c0deb3f8:	1a9d      	subs	r5, r3, r2
c0deb3fa:	42a5      	cmp	r5, r4
c0deb3fc:	d806      	bhi.n	c0deb40c <buffer_copy+0x1c>
c0deb3fe:	6800      	ldr	r0, [r0, #0]
c0deb400:	4402      	add	r2, r0
c0deb402:	4608      	mov	r0, r1
c0deb404:	4611      	mov	r1, r2
c0deb406:	462a      	mov	r2, r5
c0deb408:	f001 f808 	bl	c0dec41c <__aeabi_memmove>
c0deb40c:	2000      	movs	r0, #0
c0deb40e:	42a5      	cmp	r5, r4
c0deb410:	bf98      	it	ls
c0deb412:	2001      	movls	r0, #1
c0deb414:	bdb0      	pop	{r4, r5, r7, pc}

c0deb416 <buffer_move>:
c0deb416:	b5b0      	push	{r4, r5, r7, lr}
c0deb418:	4615      	mov	r5, r2
c0deb41a:	4604      	mov	r4, r0
c0deb41c:	e9d0 2001 	ldrd	r2, r0, [r0, #4]
c0deb420:	1a12      	subs	r2, r2, r0
c0deb422:	42aa      	cmp	r2, r5
c0deb424:	bf84      	itt	hi
c0deb426:	2000      	movhi	r0, #0
c0deb428:	bdb0      	pophi	{r4, r5, r7, pc}
c0deb42a:	6823      	ldr	r3, [r4, #0]
c0deb42c:	4403      	add	r3, r0
c0deb42e:	4608      	mov	r0, r1
c0deb430:	4619      	mov	r1, r3
c0deb432:	f000 fff3 	bl	c0dec41c <__aeabi_memmove>
c0deb436:	68a0      	ldr	r0, [r4, #8]
c0deb438:	1940      	adds	r0, r0, r5
c0deb43a:	d203      	bcs.n	c0deb444 <buffer_move+0x2e>
c0deb43c:	6861      	ldr	r1, [r4, #4]
c0deb43e:	4288      	cmp	r0, r1
c0deb440:	bf98      	it	ls
c0deb442:	60a0      	strls	r0, [r4, #8]
c0deb444:	2001      	movs	r0, #1
c0deb446:	bdb0      	pop	{r4, r5, r7, pc}

c0deb448 <OUTLINED_FUNCTION_0>:
c0deb448:	4604      	mov	r4, r0
c0deb44a:	460d      	mov	r5, r1
c0deb44c:	6840      	ldr	r0, [r0, #4]
c0deb44e:	68a1      	ldr	r1, [r4, #8]
c0deb450:	1a46      	subs	r6, r0, r1
c0deb452:	4770      	bx	lr

c0deb454 <bip32_derive_with_seed_init_privkey_256>:
c0deb454:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0deb458:	b095      	sub	sp, #84	@ 0x54
c0deb45a:	460d      	mov	r5, r1
c0deb45c:	4607      	mov	r7, r0
c0deb45e:	a904      	add	r1, sp, #16
c0deb460:	469a      	mov	sl, r3
c0deb462:	4614      	mov	r4, r2
c0deb464:	4628      	mov	r0, r5
c0deb466:	f000 fe03 	bl	c0dec070 <cx_ecdomain_parameters_length>
c0deb46a:	f8dd 8070 	ldr.w	r8, [sp, #112]	@ 0x70
c0deb46e:	4606      	mov	r6, r0
c0deb470:	b9e0      	cbnz	r0, c0deb4ac <bip32_derive_with_seed_init_privkey_256+0x58>
c0deb472:	9804      	ldr	r0, [sp, #16]
c0deb474:	2820      	cmp	r0, #32
c0deb476:	d117      	bne.n	c0deb4a8 <bip32_derive_with_seed_init_privkey_256+0x54>
c0deb478:	981f      	ldr	r0, [sp, #124]	@ 0x7c
c0deb47a:	e9dd 211d 	ldrd	r2, r1, [sp, #116]	@ 0x74
c0deb47e:	ab05      	add	r3, sp, #20
c0deb480:	e9cd 3200 	strd	r3, r2, [sp]
c0deb484:	e9cd 1002 	strd	r1, r0, [sp, #8]
c0deb488:	4638      	mov	r0, r7
c0deb48a:	4629      	mov	r1, r5
c0deb48c:	4622      	mov	r2, r4
c0deb48e:	4653      	mov	r3, sl
c0deb490:	f000 f818 	bl	c0deb4c4 <os_derive_bip32_with_seed_no_throw>
c0deb494:	4606      	mov	r6, r0
c0deb496:	b948      	cbnz	r0, c0deb4ac <bip32_derive_with_seed_init_privkey_256+0x58>
c0deb498:	9a04      	ldr	r2, [sp, #16]
c0deb49a:	a905      	add	r1, sp, #20
c0deb49c:	4628      	mov	r0, r5
c0deb49e:	4643      	mov	r3, r8
c0deb4a0:	f000 fb61 	bl	c0debb66 <cx_ecfp_init_private_key_no_throw>
c0deb4a4:	4606      	mov	r6, r0
c0deb4a6:	e001      	b.n	c0deb4ac <bip32_derive_with_seed_init_privkey_256+0x58>
c0deb4a8:	f06f 065c 	mvn.w	r6, #92	@ 0x5c
c0deb4ac:	a805      	add	r0, sp, #20
c0deb4ae:	2140      	movs	r1, #64	@ 0x40
c0deb4b0:	f000 ffca 	bl	c0dec448 <explicit_bzero>
c0deb4b4:	b116      	cbz	r6, c0deb4bc <bip32_derive_with_seed_init_privkey_256+0x68>
c0deb4b6:	4640      	mov	r0, r8
c0deb4b8:	f000 f89f 	bl	c0deb5fa <OUTLINED_FUNCTION_0>
c0deb4bc:	4630      	mov	r0, r6
c0deb4be:	b015      	add	sp, #84	@ 0x54
c0deb4c0:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}

c0deb4c4 <os_derive_bip32_with_seed_no_throw>:
c0deb4c4:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0deb4c8:	b090      	sub	sp, #64	@ 0x40
c0deb4ca:	f10d 0810 	add.w	r8, sp, #16
c0deb4ce:	4607      	mov	r7, r0
c0deb4d0:	469b      	mov	fp, r3
c0deb4d2:	4616      	mov	r6, r2
c0deb4d4:	460c      	mov	r4, r1
c0deb4d6:	4640      	mov	r0, r8
c0deb4d8:	f000 fffc 	bl	c0dec4d4 <setjmp>
c0deb4dc:	b285      	uxth	r5, r0
c0deb4de:	f8dd a060 	ldr.w	sl, [sp, #96]	@ 0x60
c0deb4e2:	f8ad 003c 	strh.w	r0, [sp, #60]	@ 0x3c
c0deb4e6:	b155      	cbz	r5, c0deb4fe <os_derive_bip32_with_seed_no_throw+0x3a>
c0deb4e8:	2000      	movs	r0, #0
c0deb4ea:	f8ad 003c 	strh.w	r0, [sp, #60]	@ 0x3c
c0deb4ee:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0deb4f0:	f000 fe66 	bl	c0dec1c0 <try_context_set>
c0deb4f4:	2140      	movs	r1, #64	@ 0x40
c0deb4f6:	4650      	mov	r0, sl
c0deb4f8:	f000 ffa6 	bl	c0dec448 <explicit_bzero>
c0deb4fc:	e012      	b.n	c0deb524 <os_derive_bip32_with_seed_no_throw+0x60>
c0deb4fe:	a804      	add	r0, sp, #16
c0deb500:	f000 fe5e 	bl	c0dec1c0 <try_context_set>
c0deb504:	9919      	ldr	r1, [sp, #100]	@ 0x64
c0deb506:	900e      	str	r0, [sp, #56]	@ 0x38
c0deb508:	4668      	mov	r0, sp
c0deb50a:	4632      	mov	r2, r6
c0deb50c:	465b      	mov	r3, fp
c0deb50e:	f8c0 a000 	str.w	sl, [r0]
c0deb512:	6041      	str	r1, [r0, #4]
c0deb514:	991a      	ldr	r1, [sp, #104]	@ 0x68
c0deb516:	6081      	str	r1, [r0, #8]
c0deb518:	991b      	ldr	r1, [sp, #108]	@ 0x6c
c0deb51a:	60c1      	str	r1, [r0, #12]
c0deb51c:	4638      	mov	r0, r7
c0deb51e:	4621      	mov	r1, r4
c0deb520:	f000 fdb0 	bl	c0dec084 <os_perso_derive_node_with_seed_key>
c0deb524:	f000 fe44 	bl	c0dec1b0 <try_context_get>
c0deb528:	4540      	cmp	r0, r8
c0deb52a:	d102      	bne.n	c0deb532 <os_derive_bip32_with_seed_no_throw+0x6e>
c0deb52c:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0deb52e:	f000 fe47 	bl	c0dec1c0 <try_context_set>
c0deb532:	f8bd 003c 	ldrh.w	r0, [sp, #60]	@ 0x3c
c0deb536:	b918      	cbnz	r0, c0deb540 <os_derive_bip32_with_seed_no_throw+0x7c>
c0deb538:	4628      	mov	r0, r5
c0deb53a:	b010      	add	sp, #64	@ 0x40
c0deb53c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0deb540:	f000 fbb9 	bl	c0debcb6 <os_longjmp>

c0deb544 <bip32_derive_with_seed_get_pubkey_256>:
c0deb544:	b5f0      	push	{r4, r5, r6, r7, lr}
c0deb546:	b0a1      	sub	sp, #132	@ 0x84
c0deb548:	460e      	mov	r6, r1
c0deb54a:	992a      	ldr	r1, [sp, #168]	@ 0xa8
c0deb54c:	9103      	str	r1, [sp, #12]
c0deb54e:	9929      	ldr	r1, [sp, #164]	@ 0xa4
c0deb550:	9102      	str	r1, [sp, #8]
c0deb552:	9927      	ldr	r1, [sp, #156]	@ 0x9c
c0deb554:	9101      	str	r1, [sp, #4]
c0deb556:	a917      	add	r1, sp, #92	@ 0x5c
c0deb558:	9100      	str	r1, [sp, #0]
c0deb55a:	4631      	mov	r1, r6
c0deb55c:	f7ff ff7a 	bl	c0deb454 <bip32_derive_with_seed_init_privkey_256>
c0deb560:	9c26      	ldr	r4, [sp, #152]	@ 0x98
c0deb562:	4605      	mov	r5, r0
c0deb564:	b9b8      	cbnz	r0, c0deb596 <bip32_derive_with_seed_get_pubkey_256+0x52>
c0deb566:	9828      	ldr	r0, [sp, #160]	@ 0xa0
c0deb568:	2301      	movs	r3, #1
c0deb56a:	9000      	str	r0, [sp, #0]
c0deb56c:	af04      	add	r7, sp, #16
c0deb56e:	aa17      	add	r2, sp, #92	@ 0x5c
c0deb570:	4630      	mov	r0, r6
c0deb572:	4639      	mov	r1, r7
c0deb574:	f000 faf2 	bl	c0debb5c <cx_ecfp_generate_pair2_no_throw>
c0deb578:	4605      	mov	r5, r0
c0deb57a:	b960      	cbnz	r0, c0deb596 <bip32_derive_with_seed_get_pubkey_256+0x52>
c0deb57c:	9805      	ldr	r0, [sp, #20]
c0deb57e:	2841      	cmp	r0, #65	@ 0x41
c0deb580:	d107      	bne.n	c0deb592 <bip32_derive_with_seed_get_pubkey_256+0x4e>
c0deb582:	f107 0108 	add.w	r1, r7, #8
c0deb586:	4620      	mov	r0, r4
c0deb588:	2241      	movs	r2, #65	@ 0x41
c0deb58a:	f000 ff45 	bl	c0dec418 <__aeabi_memcpy>
c0deb58e:	2500      	movs	r5, #0
c0deb590:	e001      	b.n	c0deb596 <bip32_derive_with_seed_get_pubkey_256+0x52>
c0deb592:	f06f 055c 	mvn.w	r5, #92	@ 0x5c
c0deb596:	a817      	add	r0, sp, #92	@ 0x5c
c0deb598:	f000 f82f 	bl	c0deb5fa <OUTLINED_FUNCTION_0>
c0deb59c:	b11d      	cbz	r5, c0deb5a6 <bip32_derive_with_seed_get_pubkey_256+0x62>
c0deb59e:	4620      	mov	r0, r4
c0deb5a0:	2141      	movs	r1, #65	@ 0x41
c0deb5a2:	f000 ff51 	bl	c0dec448 <explicit_bzero>
c0deb5a6:	4628      	mov	r0, r5
c0deb5a8:	b021      	add	sp, #132	@ 0x84
c0deb5aa:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0deb5ac <bip32_derive_with_seed_ecdsa_sign_hash_256>:
c0deb5ac:	b5f0      	push	{r4, r5, r6, r7, lr}
c0deb5ae:	b08f      	sub	sp, #60	@ 0x3c
c0deb5b0:	9f19      	ldr	r7, [sp, #100]	@ 0x64
c0deb5b2:	9d1c      	ldr	r5, [sp, #112]	@ 0x70
c0deb5b4:	683c      	ldr	r4, [r7, #0]
c0deb5b6:	9503      	str	r5, [sp, #12]
c0deb5b8:	9d1b      	ldr	r5, [sp, #108]	@ 0x6c
c0deb5ba:	9502      	str	r5, [sp, #8]
c0deb5bc:	2500      	movs	r5, #0
c0deb5be:	9501      	str	r5, [sp, #4]
c0deb5c0:	ad05      	add	r5, sp, #20
c0deb5c2:	9500      	str	r5, [sp, #0]
c0deb5c4:	f7ff ff46 	bl	c0deb454 <bip32_derive_with_seed_init_privkey_256>
c0deb5c8:	9d18      	ldr	r5, [sp, #96]	@ 0x60
c0deb5ca:	4606      	mov	r6, r0
c0deb5cc:	b950      	cbnz	r0, c0deb5e4 <bip32_derive_with_seed_ecdsa_sign_hash_256+0x38>
c0deb5ce:	ae14      	add	r6, sp, #80	@ 0x50
c0deb5d0:	981a      	ldr	r0, [sp, #104]	@ 0x68
c0deb5d2:	ce4e      	ldmia	r6, {r1, r2, r3, r6}
c0deb5d4:	e9cd 6500 	strd	r6, r5, [sp]
c0deb5d8:	e9cd 7002 	strd	r7, r0, [sp, #8]
c0deb5dc:	a805      	add	r0, sp, #20
c0deb5de:	f000 fab8 	bl	c0debb52 <cx_ecdsa_sign_no_throw>
c0deb5e2:	4606      	mov	r6, r0
c0deb5e4:	a805      	add	r0, sp, #20
c0deb5e6:	f000 f808 	bl	c0deb5fa <OUTLINED_FUNCTION_0>
c0deb5ea:	b11e      	cbz	r6, c0deb5f4 <bip32_derive_with_seed_ecdsa_sign_hash_256+0x48>
c0deb5ec:	4628      	mov	r0, r5
c0deb5ee:	4621      	mov	r1, r4
c0deb5f0:	f000 ff2a 	bl	c0dec448 <explicit_bzero>
c0deb5f4:	4630      	mov	r0, r6
c0deb5f6:	b00f      	add	sp, #60	@ 0x3c
c0deb5f8:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0deb5fa <OUTLINED_FUNCTION_0>:
c0deb5fa:	2128      	movs	r1, #40	@ 0x28
c0deb5fc:	f000 bf24 	b.w	c0dec448 <explicit_bzero>

c0deb600 <format_u64>:
c0deb600:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0deb604:	b1f9      	cbz	r1, c0deb646 <format_u64+0x46>
c0deb606:	4615      	mov	r5, r2
c0deb608:	4604      	mov	r4, r0
c0deb60a:	f1a1 0801 	sub.w	r8, r1, #1
c0deb60e:	2700      	movs	r7, #0
c0deb610:	2600      	movs	r6, #0
c0deb612:	f1b5 000a 	subs.w	r0, r5, #10
c0deb616:	f173 0000 	sbcs.w	r0, r3, #0
c0deb61a:	d316      	bcc.n	c0deb64a <format_u64+0x4a>
c0deb61c:	4619      	mov	r1, r3
c0deb61e:	4628      	mov	r0, r5
c0deb620:	220a      	movs	r2, #10
c0deb622:	2300      	movs	r3, #0
c0deb624:	f000 ff06 	bl	c0dec434 <__aeabi_uldivmod>
c0deb628:	460b      	mov	r3, r1
c0deb62a:	eb00 0180 	add.w	r1, r0, r0, lsl #2
c0deb62e:	1cba      	adds	r2, r7, #2
c0deb630:	eba5 0141 	sub.w	r1, r5, r1, lsl #1
c0deb634:	4605      	mov	r5, r0
c0deb636:	f041 0130 	orr.w	r1, r1, #48	@ 0x30
c0deb63a:	55e1      	strb	r1, [r4, r7]
c0deb63c:	1c79      	adds	r1, r7, #1
c0deb63e:	4542      	cmp	r2, r8
c0deb640:	460f      	mov	r7, r1
c0deb642:	d9e6      	bls.n	c0deb612 <format_u64+0x12>
c0deb644:	e012      	b.n	c0deb66c <format_u64+0x6c>
c0deb646:	2600      	movs	r6, #0
c0deb648:	e010      	b.n	c0deb66c <format_u64+0x6c>
c0deb64a:	f105 0030 	add.w	r0, r5, #48	@ 0x30
c0deb64e:	19e1      	adds	r1, r4, r7
c0deb650:	55e0      	strb	r0, [r4, r7]
c0deb652:	2000      	movs	r0, #0
c0deb654:	7048      	strb	r0, [r1, #1]
c0deb656:	b2c1      	uxtb	r1, r0
c0deb658:	428f      	cmp	r7, r1
c0deb65a:	d906      	bls.n	c0deb66a <format_u64+0x6a>
c0deb65c:	5c62      	ldrb	r2, [r4, r1]
c0deb65e:	5de3      	ldrb	r3, [r4, r7]
c0deb660:	3001      	adds	r0, #1
c0deb662:	5463      	strb	r3, [r4, r1]
c0deb664:	55e2      	strb	r2, [r4, r7]
c0deb666:	3f01      	subs	r7, #1
c0deb668:	e7f5      	b.n	c0deb656 <format_u64+0x56>
c0deb66a:	2601      	movs	r6, #1
c0deb66c:	4630      	mov	r0, r6
c0deb66e:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0deb672 <format_fpu64>:
c0deb672:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0deb676:	b086      	sub	sp, #24
c0deb678:	466c      	mov	r4, sp
c0deb67a:	4688      	mov	r8, r1
c0deb67c:	4605      	mov	r5, r0
c0deb67e:	2115      	movs	r1, #21
c0deb680:	461e      	mov	r6, r3
c0deb682:	4617      	mov	r7, r2
c0deb684:	4620      	mov	r0, r4
c0deb686:	f000 fed1 	bl	c0dec42c <__aeabi_memclr>
c0deb68a:	4620      	mov	r0, r4
c0deb68c:	2115      	movs	r1, #21
c0deb68e:	463a      	mov	r2, r7
c0deb690:	4633      	mov	r3, r6
c0deb692:	f7ff ffb5 	bl	c0deb600 <format_u64>
c0deb696:	b340      	cbz	r0, c0deb6ea <format_fpu64+0x78>
c0deb698:	466f      	mov	r7, sp
c0deb69a:	9e0c      	ldr	r6, [sp, #48]	@ 0x30
c0deb69c:	4638      	mov	r0, r7
c0deb69e:	f000 ff31 	bl	c0dec504 <strlen>
c0deb6a2:	42b0      	cmp	r0, r6
c0deb6a4:	d910      	bls.n	c0deb6c8 <format_fpu64+0x56>
c0deb6a6:	1831      	adds	r1, r6, r0
c0deb6a8:	3101      	adds	r1, #1
c0deb6aa:	4541      	cmp	r1, r8
c0deb6ac:	d21d      	bcs.n	c0deb6ea <format_fpu64+0x78>
c0deb6ae:	1b84      	subs	r4, r0, r6
c0deb6b0:	4628      	mov	r0, r5
c0deb6b2:	4639      	mov	r1, r7
c0deb6b4:	4622      	mov	r2, r4
c0deb6b6:	f000 feaf 	bl	c0dec418 <__aeabi_memcpy>
c0deb6ba:	1928      	adds	r0, r5, r4
c0deb6bc:	212e      	movs	r1, #46	@ 0x2e
c0deb6be:	4632      	mov	r2, r6
c0deb6c0:	f800 1b01 	strb.w	r1, [r0], #1
c0deb6c4:	1939      	adds	r1, r7, r4
c0deb6c6:	e015      	b.n	c0deb6f4 <format_fpu64+0x82>
c0deb6c8:	1a32      	subs	r2, r6, r0
c0deb6ca:	1c91      	adds	r1, r2, #2
c0deb6cc:	4541      	cmp	r1, r8
c0deb6ce:	d20c      	bcs.n	c0deb6ea <format_fpu64+0x78>
c0deb6d0:	202e      	movs	r0, #46	@ 0x2e
c0deb6d2:	2330      	movs	r3, #48	@ 0x30
c0deb6d4:	2400      	movs	r4, #0
c0deb6d6:	7068      	strb	r0, [r5, #1]
c0deb6d8:	1ca8      	adds	r0, r5, #2
c0deb6da:	702b      	strb	r3, [r5, #0]
c0deb6dc:	b2a5      	uxth	r5, r4
c0deb6de:	42aa      	cmp	r2, r5
c0deb6e0:	d905      	bls.n	c0deb6ee <format_fpu64+0x7c>
c0deb6e2:	f800 3b01 	strb.w	r3, [r0], #1
c0deb6e6:	3401      	adds	r4, #1
c0deb6e8:	e7f8      	b.n	c0deb6dc <format_fpu64+0x6a>
c0deb6ea:	2000      	movs	r0, #0
c0deb6ec:	e005      	b.n	c0deb6fa <format_fpu64+0x88>
c0deb6ee:	eba8 0201 	sub.w	r2, r8, r1
c0deb6f2:	4669      	mov	r1, sp
c0deb6f4:	f000 ff0e 	bl	c0dec514 <strncpy>
c0deb6f8:	2001      	movs	r0, #1
c0deb6fa:	b006      	add	sp, #24
c0deb6fc:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0deb700 <format_hex>:
c0deb700:	b5f0      	push	{r4, r5, r6, r7, lr}
c0deb702:	4604      	mov	r4, r0
c0deb704:	0048      	lsls	r0, r1, #1
c0deb706:	f100 0c01 	add.w	ip, r0, #1
c0deb70a:	459c      	cmp	ip, r3
c0deb70c:	d902      	bls.n	c0deb714 <format_hex+0x14>
c0deb70e:	f04f 3cff 	mov.w	ip, #4294967295	@ 0xffffffff
c0deb712:	e018      	b.n	c0deb746 <format_hex+0x46>
c0deb714:	480d      	ldr	r0, [pc, #52]	@ (c0deb74c <format_hex+0x4c>)
c0deb716:	2500      	movs	r5, #0
c0deb718:	4478      	add	r0, pc
c0deb71a:	b191      	cbz	r1, c0deb742 <format_hex+0x42>
c0deb71c:	1cef      	adds	r7, r5, #3
c0deb71e:	429f      	cmp	r7, r3
c0deb720:	d80d      	bhi.n	c0deb73e <format_hex+0x3e>
c0deb722:	7827      	ldrb	r7, [r4, #0]
c0deb724:	3901      	subs	r1, #1
c0deb726:	093f      	lsrs	r7, r7, #4
c0deb728:	5dc7      	ldrb	r7, [r0, r7]
c0deb72a:	5557      	strb	r7, [r2, r5]
c0deb72c:	1957      	adds	r7, r2, r5
c0deb72e:	3502      	adds	r5, #2
c0deb730:	f814 6b01 	ldrb.w	r6, [r4], #1
c0deb734:	f006 060f 	and.w	r6, r6, #15
c0deb738:	5d86      	ldrb	r6, [r0, r6]
c0deb73a:	707e      	strb	r6, [r7, #1]
c0deb73c:	e7ed      	b.n	c0deb71a <format_hex+0x1a>
c0deb73e:	f105 0c01 	add.w	ip, r5, #1
c0deb742:	2000      	movs	r0, #0
c0deb744:	5550      	strb	r0, [r2, r5]
c0deb746:	4660      	mov	r0, ip
c0deb748:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0deb74a:	bf00      	nop
c0deb74c:	0000284e 	.word	0x0000284e

c0deb750 <app_ticker_event_callback>:
c0deb750:	4770      	bx	lr
	...

c0deb754 <io_event>:
c0deb754:	b580      	push	{r7, lr}
c0deb756:	480b      	ldr	r0, [pc, #44]	@ (c0deb784 <io_event+0x30>)
c0deb758:	f819 1000 	ldrb.w	r1, [r9, r0]
c0deb75c:	2905      	cmp	r1, #5
c0deb75e:	d00e      	beq.n	c0deb77e <io_event+0x2a>
c0deb760:	290e      	cmp	r1, #14
c0deb762:	d005      	beq.n	c0deb770 <io_event+0x1c>
c0deb764:	290c      	cmp	r1, #12
c0deb766:	d108      	bne.n	c0deb77a <io_event+0x26>
c0deb768:	4448      	add	r0, r9
c0deb76a:	f000 f92f 	bl	c0deb9cc <ux_process_finger_event>
c0deb76e:	e006      	b.n	c0deb77e <io_event+0x2a>
c0deb770:	f7ff ffee 	bl	c0deb750 <app_ticker_event_callback>
c0deb774:	f000 f980 	bl	c0deba78 <ux_process_ticker_event>
c0deb778:	e001      	b.n	c0deb77e <io_event+0x2a>
c0deb77a:	f000 f9b3 	bl	c0debae4 <ux_process_default_event>
c0deb77e:	2001      	movs	r0, #1
c0deb780:	bd80      	pop	{r7, pc}
c0deb782:	bf00      	nop
c0deb784:	00001cac 	.word	0x00001cac

c0deb788 <io_init>:
c0deb788:	4802      	ldr	r0, [pc, #8]	@ (c0deb794 <io_init+0xc>)
c0deb78a:	2101      	movs	r1, #1
c0deb78c:	f809 1000 	strb.w	r1, [r9, r0]
c0deb790:	4770      	bx	lr
c0deb792:	bf00      	nop
c0deb794:	00001dbc 	.word	0x00001dbc

c0deb798 <io_recv_command>:
c0deb798:	b510      	push	{r4, lr}
c0deb79a:	4c09      	ldr	r4, [pc, #36]	@ (c0deb7c0 <io_recv_command+0x28>)
c0deb79c:	f819 0004 	ldrb.w	r0, [r9, r4]
c0deb7a0:	2801      	cmp	r0, #1
c0deb7a2:	d104      	bne.n	c0deb7ae <io_recv_command+0x16>
c0deb7a4:	f000 fce2 	bl	c0dec16c <os_io_start>
c0deb7a8:	2000      	movs	r0, #0
c0deb7aa:	f809 0004 	strb.w	r0, [r9, r4]
c0deb7ae:	2000      	movs	r0, #0
c0deb7b0:	2800      	cmp	r0, #0
c0deb7b2:	dc03      	bgt.n	c0deb7bc <io_recv_command+0x24>
c0deb7b4:	2001      	movs	r0, #1
c0deb7b6:	f7f8 fc91 	bl	c0de40dc <io_legacy_apdu_rx>
c0deb7ba:	e7f9      	b.n	c0deb7b0 <io_recv_command+0x18>
c0deb7bc:	bd10      	pop	{r4, pc}
c0deb7be:	bf00      	nop
c0deb7c0:	00001dbc 	.word	0x00001dbc

c0deb7c4 <io_send_response_buffers>:
c0deb7c4:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0deb7c8:	f8df a060 	ldr.w	sl, [pc, #96]	@ c0deb82c <io_send_response_buffers+0x68>
c0deb7cc:	4690      	mov	r8, r2
c0deb7ce:	460f      	mov	r7, r1
c0deb7d0:	4605      	mov	r5, r0
c0deb7d2:	f240 140f 	movw	r4, #271	@ 0x10f
c0deb7d6:	2600      	movs	r6, #0
c0deb7d8:	b1b5      	cbz	r5, c0deb808 <io_send_response_buffers+0x44>
c0deb7da:	b1af      	cbz	r7, c0deb808 <io_send_response_buffers+0x44>
c0deb7dc:	2600      	movs	r6, #0
c0deb7de:	b19f      	cbz	r7, c0deb808 <io_send_response_buffers+0x44>
c0deb7e0:	eb09 000a 	add.w	r0, r9, sl
c0deb7e4:	1ba2      	subs	r2, r4, r6
c0deb7e6:	1981      	adds	r1, r0, r6
c0deb7e8:	4628      	mov	r0, r5
c0deb7ea:	f7ff fe01 	bl	c0deb3f0 <buffer_copy>
c0deb7ee:	b130      	cbz	r0, c0deb7fe <io_send_response_buffers+0x3a>
c0deb7f0:	e9d5 0101 	ldrd	r0, r1, [r5, #4]
c0deb7f4:	350c      	adds	r5, #12
c0deb7f6:	3f01      	subs	r7, #1
c0deb7f8:	4430      	add	r0, r6
c0deb7fa:	1a46      	subs	r6, r0, r1
c0deb7fc:	e7ef      	b.n	c0deb7de <io_send_response_buffers+0x1a>
c0deb7fe:	f44f 4830 	mov.w	r8, #45056	@ 0xb000
c0deb802:	2500      	movs	r5, #0
c0deb804:	2700      	movs	r7, #0
c0deb806:	e7e6      	b.n	c0deb7d6 <io_send_response_buffers+0x12>
c0deb808:	eb09 050a 	add.w	r5, r9, sl
c0deb80c:	fa1f f288 	uxth.w	r2, r8
c0deb810:	4631      	mov	r1, r6
c0deb812:	4628      	mov	r0, r5
c0deb814:	f000 f8d4 	bl	c0deb9c0 <write_u16_be>
c0deb818:	1cb0      	adds	r0, r6, #2
c0deb81a:	b281      	uxth	r1, r0
c0deb81c:	4628      	mov	r0, r5
c0deb81e:	f7f8 fc43 	bl	c0de40a8 <io_legacy_apdu_tx>
c0deb822:	ea40 70e0 	orr.w	r0, r0, r0, asr #31
c0deb826:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0deb82a:	bf00      	nop
c0deb82c:	000014b7 	.word	0x000014b7

c0deb830 <app_exit>:
c0deb830:	20ff      	movs	r0, #255	@ 0xff
c0deb832:	f000 fc87 	bl	c0dec144 <os_sched_exit>

c0deb836 <common_app_init>:
c0deb836:	b580      	push	{r7, lr}
c0deb838:	f000 f9c8 	bl	c0debbcc <nbgl_objInit>
c0deb83c:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0deb840:	f7f8 bd78 	b.w	c0de4334 <io_seproxyhal_init>

c0deb844 <standalone_app_main>:
c0deb844:	b510      	push	{r4, lr}
c0deb846:	b08c      	sub	sp, #48	@ 0x30
c0deb848:	466c      	mov	r4, sp
c0deb84a:	4620      	mov	r0, r4
c0deb84c:	f000 fe42 	bl	c0dec4d4 <setjmp>
c0deb850:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0deb854:	0400      	lsls	r0, r0, #16
c0deb856:	d108      	bne.n	c0deb86a <standalone_app_main+0x26>
c0deb858:	4668      	mov	r0, sp
c0deb85a:	f000 fcb1 	bl	c0dec1c0 <try_context_set>
c0deb85e:	900a      	str	r0, [sp, #40]	@ 0x28
c0deb860:	f7ff ffe9 	bl	c0deb836 <common_app_init>
c0deb864:	f7f4 fd18 	bl	c0de0298 <app_main>
c0deb868:	e005      	b.n	c0deb876 <standalone_app_main+0x32>
c0deb86a:	2000      	movs	r0, #0
c0deb86c:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0deb870:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0deb872:	f000 fca5 	bl	c0dec1c0 <try_context_set>
c0deb876:	f000 fc9b 	bl	c0dec1b0 <try_context_get>
c0deb87a:	42a0      	cmp	r0, r4
c0deb87c:	d102      	bne.n	c0deb884 <standalone_app_main+0x40>
c0deb87e:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0deb880:	f000 fc9e 	bl	c0dec1c0 <try_context_set>
c0deb884:	f8bd 002c 	ldrh.w	r0, [sp, #44]	@ 0x2c
c0deb888:	b908      	cbnz	r0, c0deb88e <standalone_app_main+0x4a>
c0deb88a:	f7ff ffd1 	bl	c0deb830 <app_exit>
c0deb88e:	f000 fa12 	bl	c0debcb6 <os_longjmp>

c0deb892 <apdu_parser>:
c0deb892:	2a04      	cmp	r2, #4
c0deb894:	d316      	bcc.n	c0deb8c4 <apdu_parser+0x32>
c0deb896:	d102      	bne.n	c0deb89e <apdu_parser+0xc>
c0deb898:	2300      	movs	r3, #0
c0deb89a:	7103      	strb	r3, [r0, #4]
c0deb89c:	e004      	b.n	c0deb8a8 <apdu_parser+0x16>
c0deb89e:	790b      	ldrb	r3, [r1, #4]
c0deb8a0:	3a05      	subs	r2, #5
c0deb8a2:	429a      	cmp	r2, r3
c0deb8a4:	7103      	strb	r3, [r0, #4]
c0deb8a6:	d10d      	bne.n	c0deb8c4 <apdu_parser+0x32>
c0deb8a8:	780a      	ldrb	r2, [r1, #0]
c0deb8aa:	2b00      	cmp	r3, #0
c0deb8ac:	7002      	strb	r2, [r0, #0]
c0deb8ae:	784a      	ldrb	r2, [r1, #1]
c0deb8b0:	7042      	strb	r2, [r0, #1]
c0deb8b2:	788a      	ldrb	r2, [r1, #2]
c0deb8b4:	7082      	strb	r2, [r0, #2]
c0deb8b6:	bf18      	it	ne
c0deb8b8:	1d4b      	addne	r3, r1, #5
c0deb8ba:	78c9      	ldrb	r1, [r1, #3]
c0deb8bc:	6083      	str	r3, [r0, #8]
c0deb8be:	70c1      	strb	r1, [r0, #3]
c0deb8c0:	2001      	movs	r0, #1
c0deb8c2:	4770      	bx	lr
c0deb8c4:	2000      	movs	r0, #0
c0deb8c6:	4770      	bx	lr

c0deb8c8 <read_u32_be>:
c0deb8c8:	5c42      	ldrb	r2, [r0, r1]
c0deb8ca:	4408      	add	r0, r1
c0deb8cc:	7841      	ldrb	r1, [r0, #1]
c0deb8ce:	7883      	ldrb	r3, [r0, #2]
c0deb8d0:	78c0      	ldrb	r0, [r0, #3]
c0deb8d2:	0409      	lsls	r1, r1, #16
c0deb8d4:	ea41 6102 	orr.w	r1, r1, r2, lsl #24
c0deb8d8:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0deb8dc:	4408      	add	r0, r1
c0deb8de:	4770      	bx	lr

c0deb8e0 <read_u64_be>:
c0deb8e0:	b5f0      	push	{r4, r5, r6, r7, lr}
c0deb8e2:	1842      	adds	r2, r0, r1
c0deb8e4:	5c40      	ldrb	r0, [r0, r1]
c0deb8e6:	7917      	ldrb	r7, [r2, #4]
c0deb8e8:	7953      	ldrb	r3, [r2, #5]
c0deb8ea:	7854      	ldrb	r4, [r2, #1]
c0deb8ec:	7895      	ldrb	r5, [r2, #2]
c0deb8ee:	78d6      	ldrb	r6, [r2, #3]
c0deb8f0:	063f      	lsls	r7, r7, #24
c0deb8f2:	0421      	lsls	r1, r4, #16
c0deb8f4:	ea47 4303 	orr.w	r3, r7, r3, lsl #16
c0deb8f8:	7997      	ldrb	r7, [r2, #6]
c0deb8fa:	79d2      	ldrb	r2, [r2, #7]
c0deb8fc:	ea41 6000 	orr.w	r0, r1, r0, lsl #24
c0deb900:	ea40 2005 	orr.w	r0, r0, r5, lsl #8
c0deb904:	ea43 2307 	orr.w	r3, r3, r7, lsl #8
c0deb908:	1981      	adds	r1, r0, r6
c0deb90a:	441a      	add	r2, r3
c0deb90c:	4610      	mov	r0, r2
c0deb90e:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0deb910 <read_u16_le>:
c0deb910:	5c42      	ldrb	r2, [r0, r1]
c0deb912:	4408      	add	r0, r1
c0deb914:	7840      	ldrb	r0, [r0, #1]
c0deb916:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0deb91a:	b280      	uxth	r0, r0
c0deb91c:	4770      	bx	lr

c0deb91e <read_u32_le>:
c0deb91e:	5c42      	ldrb	r2, [r0, r1]
c0deb920:	4408      	add	r0, r1
c0deb922:	7841      	ldrb	r1, [r0, #1]
c0deb924:	7883      	ldrb	r3, [r0, #2]
c0deb926:	78c0      	ldrb	r0, [r0, #3]
c0deb928:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0deb92c:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
c0deb930:	ea41 6000 	orr.w	r0, r1, r0, lsl #24
c0deb934:	4770      	bx	lr

c0deb936 <read_u64_le>:
c0deb936:	b5b0      	push	{r4, r5, r7, lr}
c0deb938:	5c42      	ldrb	r2, [r0, r1]
c0deb93a:	4401      	add	r1, r0
c0deb93c:	7848      	ldrb	r0, [r1, #1]
c0deb93e:	788b      	ldrb	r3, [r1, #2]
c0deb940:	790d      	ldrb	r5, [r1, #4]
c0deb942:	78cc      	ldrb	r4, [r1, #3]
c0deb944:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0deb948:	794a      	ldrb	r2, [r1, #5]
c0deb94a:	ea40 4003 	orr.w	r0, r0, r3, lsl #16
c0deb94e:	798b      	ldrb	r3, [r1, #6]
c0deb950:	79c9      	ldrb	r1, [r1, #7]
c0deb952:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0deb956:	ea40 6004 	orr.w	r0, r0, r4, lsl #24
c0deb95a:	ea42 4203 	orr.w	r2, r2, r3, lsl #16
c0deb95e:	ea42 6101 	orr.w	r1, r2, r1, lsl #24
c0deb962:	bdb0      	pop	{r4, r5, r7, pc}

c0deb964 <varint_read>:
c0deb964:	b510      	push	{r4, lr}
c0deb966:	b1d9      	cbz	r1, c0deb9a0 <varint_read+0x3c>
c0deb968:	4614      	mov	r4, r2
c0deb96a:	4602      	mov	r2, r0
c0deb96c:	7800      	ldrb	r0, [r0, #0]
c0deb96e:	28ff      	cmp	r0, #255	@ 0xff
c0deb970:	d00c      	beq.n	c0deb98c <varint_read+0x28>
c0deb972:	28fe      	cmp	r0, #254	@ 0xfe
c0deb974:	d012      	beq.n	c0deb99c <varint_read+0x38>
c0deb976:	28fd      	cmp	r0, #253	@ 0xfd
c0deb978:	d115      	bne.n	c0deb9a6 <varint_read+0x42>
c0deb97a:	2903      	cmp	r1, #3
c0deb97c:	d310      	bcc.n	c0deb9a0 <varint_read+0x3c>
c0deb97e:	4610      	mov	r0, r2
c0deb980:	2101      	movs	r1, #1
c0deb982:	f7ff ffc5 	bl	c0deb910 <read_u16_le>
c0deb986:	2100      	movs	r1, #0
c0deb988:	2203      	movs	r2, #3
c0deb98a:	e015      	b.n	c0deb9b8 <varint_read+0x54>
c0deb98c:	2909      	cmp	r1, #9
c0deb98e:	d307      	bcc.n	c0deb9a0 <varint_read+0x3c>
c0deb990:	4610      	mov	r0, r2
c0deb992:	2101      	movs	r1, #1
c0deb994:	f7ff ffcf 	bl	c0deb936 <read_u64_le>
c0deb998:	2209      	movs	r2, #9
c0deb99a:	e00d      	b.n	c0deb9b8 <varint_read+0x54>
c0deb99c:	2905      	cmp	r1, #5
c0deb99e:	d205      	bcs.n	c0deb9ac <varint_read+0x48>
c0deb9a0:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
c0deb9a4:	e00a      	b.n	c0deb9bc <varint_read+0x58>
c0deb9a6:	2100      	movs	r1, #0
c0deb9a8:	2201      	movs	r2, #1
c0deb9aa:	e005      	b.n	c0deb9b8 <varint_read+0x54>
c0deb9ac:	4610      	mov	r0, r2
c0deb9ae:	2101      	movs	r1, #1
c0deb9b0:	f7ff ffb5 	bl	c0deb91e <read_u32_le>
c0deb9b4:	2100      	movs	r1, #0
c0deb9b6:	2205      	movs	r2, #5
c0deb9b8:	e9c4 0100 	strd	r0, r1, [r4]
c0deb9bc:	4610      	mov	r0, r2
c0deb9be:	bd10      	pop	{r4, pc}

c0deb9c0 <write_u16_be>:
c0deb9c0:	0a13      	lsrs	r3, r2, #8
c0deb9c2:	5443      	strb	r3, [r0, r1]
c0deb9c4:	4408      	add	r0, r1
c0deb9c6:	7042      	strb	r2, [r0, #1]
c0deb9c8:	4770      	bx	lr
	...

c0deb9cc <ux_process_finger_event>:
c0deb9cc:	b5b0      	push	{r4, r5, r7, lr}
c0deb9ce:	4604      	mov	r4, r0
c0deb9d0:	2001      	movs	r0, #1
c0deb9d2:	f000 f827 	bl	c0deba24 <ux_forward_event>
c0deb9d6:	4605      	mov	r5, r0
c0deb9d8:	f000 f902 	bl	c0debbe0 <nbgl_objAllowDrawing>
c0deb9dc:	b1fd      	cbz	r5, c0deba1e <ux_process_finger_event+0x52>
c0deb9de:	78e1      	ldrb	r1, [r4, #3]
c0deb9e0:	480f      	ldr	r0, [pc, #60]	@ (c0deba20 <ux_process_finger_event+0x54>)
c0deb9e2:	7963      	ldrb	r3, [r4, #5]
c0deb9e4:	3901      	subs	r1, #1
c0deb9e6:	eb09 0200 	add.w	r2, r9, r0
c0deb9ea:	f859 0000 	ldr.w	r0, [r9, r0]
c0deb9ee:	fab1 f181 	clz	r1, r1
c0deb9f2:	094d      	lsrs	r5, r1, #5
c0deb9f4:	4611      	mov	r1, r2
c0deb9f6:	f801 5f04 	strb.w	r5, [r1, #4]!
c0deb9fa:	7925      	ldrb	r5, [r4, #4]
c0deb9fc:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0deba00:	80d3      	strh	r3, [r2, #6]
c0deba02:	79a3      	ldrb	r3, [r4, #6]
c0deba04:	79e4      	ldrb	r4, [r4, #7]
c0deba06:	ea44 2303 	orr.w	r3, r4, r3, lsl #8
c0deba0a:	8113      	strh	r3, [r2, #8]
c0deba0c:	2264      	movs	r2, #100	@ 0x64
c0deba0e:	4342      	muls	r2, r0
c0deba10:	2000      	movs	r0, #0
c0deba12:	f000 f93a 	bl	c0debc8a <nbgl_touchHandler>
c0deba16:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
c0deba1a:	f000 b8c8 	b.w	c0debbae <nbgl_refresh>
c0deba1e:	bdb0      	pop	{r4, r5, r7, pc}
c0deba20:	00001de4 	.word	0x00001de4

c0deba24 <ux_forward_event>:
c0deba24:	b5b0      	push	{r4, r5, r7, lr}
c0deba26:	4604      	mov	r4, r0
c0deba28:	4812      	ldr	r0, [pc, #72]	@ (c0deba74 <ux_forward_event+0x50>)
c0deba2a:	2101      	movs	r1, #1
c0deba2c:	f809 1000 	strb.w	r1, [r9, r0]
c0deba30:	eb09 0500 	add.w	r5, r9, r0
c0deba34:	2000      	movs	r0, #0
c0deba36:	6068      	str	r0, [r5, #4]
c0deba38:	4628      	mov	r0, r5
c0deba3a:	f000 fb59 	bl	c0dec0f0 <os_ux>
c0deba3e:	2004      	movs	r0, #4
c0deba40:	f000 fbc8 	bl	c0dec1d4 <os_sched_last_status>
c0deba44:	2869      	cmp	r0, #105	@ 0x69
c0deba46:	6068      	str	r0, [r5, #4]
c0deba48:	d108      	bne.n	c0deba5c <ux_forward_event+0x38>
c0deba4a:	2001      	movs	r0, #1
c0deba4c:	f000 f8c8 	bl	c0debbe0 <nbgl_objAllowDrawing>
c0deba50:	f000 f8d5 	bl	c0debbfe <nbgl_screenRedraw>
c0deba54:	f000 f8ab 	bl	c0debbae <nbgl_refresh>
c0deba58:	2000      	movs	r0, #0
c0deba5a:	bdb0      	pop	{r4, r5, r7, pc}
c0deba5c:	b144      	cbz	r4, c0deba70 <ux_forward_event+0x4c>
c0deba5e:	f1b0 0197 	subs.w	r1, r0, #151	@ 0x97
c0deba62:	bf18      	it	ne
c0deba64:	2101      	movne	r1, #1
c0deba66:	2800      	cmp	r0, #0
c0deba68:	bf18      	it	ne
c0deba6a:	2001      	movne	r0, #1
c0deba6c:	4008      	ands	r0, r1
c0deba6e:	bdb0      	pop	{r4, r5, r7, pc}
c0deba70:	2001      	movs	r0, #1
c0deba72:	bdb0      	pop	{r4, r5, r7, pc}
c0deba74:	00001dc0 	.word	0x00001dc0

c0deba78 <ux_process_ticker_event>:
c0deba78:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0deba7a:	4d19      	ldr	r5, [pc, #100]	@ (c0debae0 <ux_process_ticker_event+0x68>)
c0deba7c:	f859 0005 	ldr.w	r0, [r9, r5]
c0deba80:	3001      	adds	r0, #1
c0deba82:	f849 0005 	str.w	r0, [r9, r5]
c0deba86:	2001      	movs	r0, #1
c0deba88:	f7ff ffcc 	bl	c0deba24 <ux_forward_event>
c0deba8c:	4604      	mov	r4, r0
c0deba8e:	f000 f8a7 	bl	c0debbe0 <nbgl_objAllowDrawing>
c0deba92:	b324      	cbz	r4, c0debade <ux_process_ticker_event+0x66>
c0deba94:	2064      	movs	r0, #100	@ 0x64
c0deba96:	2464      	movs	r4, #100	@ 0x64
c0deba98:	f000 f8c0 	bl	c0debc1c <nbgl_screenHandler>
c0deba9c:	eb09 0005 	add.w	r0, r9, r5
c0debaa0:	7900      	ldrb	r0, [r0, #4]
c0debaa2:	2801      	cmp	r0, #1
c0debaa4:	d119      	bne.n	c0debada <ux_process_ticker_event+0x62>
c0debaa6:	4668      	mov	r0, sp
c0debaa8:	f000 fba0 	bl	c0dec1ec <touch_get_last_info>
c0debaac:	f8bd 0000 	ldrh.w	r0, [sp]
c0debab0:	eb09 0105 	add.w	r1, r9, r5
c0debab4:	80c8      	strh	r0, [r1, #6]
c0debab6:	f8bd 0002 	ldrh.w	r0, [sp, #2]
c0debaba:	8108      	strh	r0, [r1, #8]
c0debabc:	f89d 0004 	ldrb.w	r0, [sp, #4]
c0debac0:	3801      	subs	r0, #1
c0debac2:	fab0 f080 	clz	r0, r0
c0debac6:	0940      	lsrs	r0, r0, #5
c0debac8:	f801 0f04 	strb.w	r0, [r1, #4]!
c0debacc:	f859 0005 	ldr.w	r0, [r9, r5]
c0debad0:	fb00 f204 	mul.w	r2, r0, r4
c0debad4:	2000      	movs	r0, #0
c0debad6:	f000 f8d8 	bl	c0debc8a <nbgl_touchHandler>
c0debada:	f000 f868 	bl	c0debbae <nbgl_refresh>
c0debade:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}
c0debae0:	00001de4 	.word	0x00001de4

c0debae4 <ux_process_default_event>:
c0debae4:	2000      	movs	r0, #0
c0debae6:	f7ff bf9d 	b.w	c0deba24 <ux_forward_event>

c0debaea <hash_iovec_ex>:
c0debaea:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0debaee:	468a      	mov	sl, r1
c0debaf0:	4611      	mov	r1, r2
c0debaf2:	461a      	mov	r2, r3
c0debaf4:	4605      	mov	r5, r0
c0debaf6:	f000 f840 	bl	c0debb7a <cx_hash_init_ex>
c0debafa:	4607      	mov	r7, r0
c0debafc:	b9a8      	cbnz	r0, c0debb2a <hash_iovec_ex+0x40>
c0debafe:	f10d 0820 	add.w	r8, sp, #32
c0debb02:	e898 0141 	ldmia.w	r8, {r0, r6, r8}
c0debb06:	1d04      	adds	r4, r0, #4
c0debb08:	b156      	cbz	r6, c0debb20 <hash_iovec_ex+0x36>
c0debb0a:	f854 1c04 	ldr.w	r1, [r4, #-4]
c0debb0e:	f854 2b08 	ldr.w	r2, [r4], #8
c0debb12:	4628      	mov	r0, r5
c0debb14:	f000 f836 	bl	c0debb84 <cx_hash_update>
c0debb18:	3e01      	subs	r6, #1
c0debb1a:	2800      	cmp	r0, #0
c0debb1c:	d0f4      	beq.n	c0debb08 <hash_iovec_ex+0x1e>
c0debb1e:	e003      	b.n	c0debb28 <hash_iovec_ex+0x3e>
c0debb20:	4628      	mov	r0, r5
c0debb22:	4641      	mov	r1, r8
c0debb24:	f000 f824 	bl	c0debb70 <cx_hash_final>
c0debb28:	4607      	mov	r7, r0
c0debb2a:	4628      	mov	r0, r5
c0debb2c:	4651      	mov	r1, sl
c0debb2e:	f000 fc8b 	bl	c0dec448 <explicit_bzero>
c0debb32:	4638      	mov	r0, r7
c0debb34:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}

c0debb38 <cx_keccak_256_hash_iovec>:
c0debb38:	b580      	push	{r7, lr}
c0debb3a:	b0ee      	sub	sp, #440	@ 0x1b8
c0debb3c:	e88d 0007 	stmia.w	sp, {r0, r1, r2}
c0debb40:	a804      	add	r0, sp, #16
c0debb42:	f44f 71d4 	mov.w	r1, #424	@ 0x1a8
c0debb46:	2206      	movs	r2, #6
c0debb48:	2320      	movs	r3, #32
c0debb4a:	f7ff ffce 	bl	c0debaea <hash_iovec_ex>
c0debb4e:	b06e      	add	sp, #440	@ 0x1b8
c0debb50:	bd80      	pop	{r7, pc}

c0debb52 <cx_ecdsa_sign_no_throw>:
c0debb52:	b403      	push	{r0, r1}
c0debb54:	f04f 002c 	mov.w	r0, #44	@ 0x2c
c0debb58:	f000 b822 	b.w	c0debba0 <cx_trampoline_helper>

c0debb5c <cx_ecfp_generate_pair2_no_throw>:
c0debb5c:	b403      	push	{r0, r1}
c0debb5e:	f04f 0031 	mov.w	r0, #49	@ 0x31
c0debb62:	f000 b81d 	b.w	c0debba0 <cx_trampoline_helper>

c0debb66 <cx_ecfp_init_private_key_no_throw>:
c0debb66:	b403      	push	{r0, r1}
c0debb68:	f04f 0033 	mov.w	r0, #51	@ 0x33
c0debb6c:	f000 b818 	b.w	c0debba0 <cx_trampoline_helper>

c0debb70 <cx_hash_final>:
c0debb70:	b403      	push	{r0, r1}
c0debb72:	f04f 003f 	mov.w	r0, #63	@ 0x3f
c0debb76:	f000 b813 	b.w	c0debba0 <cx_trampoline_helper>

c0debb7a <cx_hash_init_ex>:
c0debb7a:	b403      	push	{r0, r1}
c0debb7c:	f04f 0043 	mov.w	r0, #67	@ 0x43
c0debb80:	f000 b80e 	b.w	c0debba0 <cx_trampoline_helper>

c0debb84 <cx_hash_update>:
c0debb84:	b403      	push	{r0, r1}
c0debb86:	f04f 0048 	mov.w	r0, #72	@ 0x48
c0debb8a:	f000 b809 	b.w	c0debba0 <cx_trampoline_helper>

c0debb8e <cx_rng_no_throw>:
c0debb8e:	b403      	push	{r0, r1}
c0debb90:	f04f 006a 	mov.w	r0, #106	@ 0x6a
c0debb94:	f000 b804 	b.w	c0debba0 <cx_trampoline_helper>

c0debb98 <cx_aes_siv_reset>:
c0debb98:	b403      	push	{r0, r1}
c0debb9a:	f04f 0090 	mov.w	r0, #144	@ 0x90
c0debb9e:	e7ff      	b.n	c0debba0 <cx_trampoline_helper>

c0debba0 <cx_trampoline_helper>:
c0debba0:	4900      	ldr	r1, [pc, #0]	@ (c0debba4 <cx_trampoline_helper+0x4>)
c0debba2:	4708      	bx	r1
c0debba4:	00808001 	.word	0x00808001

c0debba8 <assert_exit>:
c0debba8:	20ff      	movs	r0, #255	@ 0xff
c0debbaa:	f000 facb 	bl	c0dec144 <os_sched_exit>

c0debbae <nbgl_refresh>:
c0debbae:	b403      	push	{r0, r1}
c0debbb0:	f04f 0091 	mov.w	r0, #145	@ 0x91
c0debbb4:	f000 b878 	b.w	c0debca8 <nbgl_trampoline_helper>

c0debbb8 <nbgl_refreshSpecial>:
c0debbb8:	b403      	push	{r0, r1}
c0debbba:	f04f 0092 	mov.w	r0, #146	@ 0x92
c0debbbe:	f000 b873 	b.w	c0debca8 <nbgl_trampoline_helper>

c0debbc2 <nbgl_refreshSpecialWithPostRefresh>:
c0debbc2:	b403      	push	{r0, r1}
c0debbc4:	f04f 0093 	mov.w	r0, #147	@ 0x93
c0debbc8:	f000 b86e 	b.w	c0debca8 <nbgl_trampoline_helper>

c0debbcc <nbgl_objInit>:
c0debbcc:	b403      	push	{r0, r1}
c0debbce:	f04f 0096 	mov.w	r0, #150	@ 0x96
c0debbd2:	f000 b869 	b.w	c0debca8 <nbgl_trampoline_helper>

c0debbd6 <nbgl_objDraw>:
c0debbd6:	b403      	push	{r0, r1}
c0debbd8:	f04f 0097 	mov.w	r0, #151	@ 0x97
c0debbdc:	f000 b864 	b.w	c0debca8 <nbgl_trampoline_helper>

c0debbe0 <nbgl_objAllowDrawing>:
c0debbe0:	b403      	push	{r0, r1}
c0debbe2:	f04f 0098 	mov.w	r0, #152	@ 0x98
c0debbe6:	f000 b85f 	b.w	c0debca8 <nbgl_trampoline_helper>

c0debbea <nbgl_screenSet>:
c0debbea:	b403      	push	{r0, r1}
c0debbec:	f04f 009b 	mov.w	r0, #155	@ 0x9b
c0debbf0:	f000 b85a 	b.w	c0debca8 <nbgl_trampoline_helper>

c0debbf4 <nbgl_screenPush>:
c0debbf4:	b403      	push	{r0, r1}
c0debbf6:	f04f 009c 	mov.w	r0, #156	@ 0x9c
c0debbfa:	f000 b855 	b.w	c0debca8 <nbgl_trampoline_helper>

c0debbfe <nbgl_screenRedraw>:
c0debbfe:	b403      	push	{r0, r1}
c0debc00:	f04f 009d 	mov.w	r0, #157	@ 0x9d
c0debc04:	f000 b850 	b.w	c0debca8 <nbgl_trampoline_helper>

c0debc08 <nbgl_screenPop>:
c0debc08:	b403      	push	{r0, r1}
c0debc0a:	f04f 009e 	mov.w	r0, #158	@ 0x9e
c0debc0e:	f000 b84b 	b.w	c0debca8 <nbgl_trampoline_helper>

c0debc12 <nbgl_screenUpdateTicker>:
c0debc12:	b403      	push	{r0, r1}
c0debc14:	f04f 00a4 	mov.w	r0, #164	@ 0xa4
c0debc18:	f000 b846 	b.w	c0debca8 <nbgl_trampoline_helper>

c0debc1c <nbgl_screenHandler>:
c0debc1c:	b403      	push	{r0, r1}
c0debc1e:	f04f 00a7 	mov.w	r0, #167	@ 0xa7
c0debc22:	f000 b841 	b.w	c0debca8 <nbgl_trampoline_helper>

c0debc26 <nbgl_objPoolGet>:
c0debc26:	b403      	push	{r0, r1}
c0debc28:	f04f 00a8 	mov.w	r0, #168	@ 0xa8
c0debc2c:	f000 b83c 	b.w	c0debca8 <nbgl_trampoline_helper>

c0debc30 <nbgl_containerPoolGet>:
c0debc30:	b403      	push	{r0, r1}
c0debc32:	f04f 00aa 	mov.w	r0, #170	@ 0xaa
c0debc36:	f000 b837 	b.w	c0debca8 <nbgl_trampoline_helper>

c0debc3a <nbgl_getFont>:
c0debc3a:	b403      	push	{r0, r1}
c0debc3c:	f04f 00ac 	mov.w	r0, #172	@ 0xac
c0debc40:	f000 b832 	b.w	c0debca8 <nbgl_trampoline_helper>

c0debc44 <nbgl_getFontHeight>:
c0debc44:	b403      	push	{r0, r1}
c0debc46:	f04f 00ad 	mov.w	r0, #173	@ 0xad
c0debc4a:	f000 b82d 	b.w	c0debca8 <nbgl_trampoline_helper>

c0debc4e <nbgl_getFontLineHeight>:
c0debc4e:	b403      	push	{r0, r1}
c0debc50:	f04f 00ae 	mov.w	r0, #174	@ 0xae
c0debc54:	f000 b828 	b.w	c0debca8 <nbgl_trampoline_helper>

c0debc58 <nbgl_getTextHeightInWidth>:
c0debc58:	b403      	push	{r0, r1}
c0debc5a:	f04f 00b2 	mov.w	r0, #178	@ 0xb2
c0debc5e:	f000 b823 	b.w	c0debca8 <nbgl_trampoline_helper>

c0debc62 <nbgl_getTextNbLinesInWidth>:
c0debc62:	b403      	push	{r0, r1}
c0debc64:	f04f 00b4 	mov.w	r0, #180	@ 0xb4
c0debc68:	f000 b81e 	b.w	c0debca8 <nbgl_trampoline_helper>

c0debc6c <nbgl_getTextWidth>:
c0debc6c:	b403      	push	{r0, r1}
c0debc6e:	f04f 00b6 	mov.w	r0, #182	@ 0xb6
c0debc72:	f000 b819 	b.w	c0debca8 <nbgl_trampoline_helper>

c0debc76 <nbgl_getTextMaxLenInNbLines>:
c0debc76:	b403      	push	{r0, r1}
c0debc78:	f04f 00b7 	mov.w	r0, #183	@ 0xb7
c0debc7c:	f000 b814 	b.w	c0debca8 <nbgl_trampoline_helper>

c0debc80 <nbgl_textReduceOnNbLines>:
c0debc80:	b403      	push	{r0, r1}
c0debc82:	f04f 00b8 	mov.w	r0, #184	@ 0xb8
c0debc86:	f000 b80f 	b.w	c0debca8 <nbgl_trampoline_helper>

c0debc8a <nbgl_touchHandler>:
c0debc8a:	b403      	push	{r0, r1}
c0debc8c:	f04f 00bb 	mov.w	r0, #187	@ 0xbb
c0debc90:	f000 b80a 	b.w	c0debca8 <nbgl_trampoline_helper>

c0debc94 <nbgl_touchGetTouchDuration>:
c0debc94:	b403      	push	{r0, r1}
c0debc96:	f04f 00bc 	mov.w	r0, #188	@ 0xbc
c0debc9a:	f000 b805 	b.w	c0debca8 <nbgl_trampoline_helper>
	...

c0debca0 <pic_init>:
c0debca0:	b403      	push	{r0, r1}
c0debca2:	f04f 00c4 	mov.w	r0, #196	@ 0xc4
c0debca6:	e7ff      	b.n	c0debca8 <nbgl_trampoline_helper>

c0debca8 <nbgl_trampoline_helper>:
c0debca8:	4900      	ldr	r1, [pc, #0]	@ (c0debcac <nbgl_trampoline_helper+0x4>)
c0debcaa:	4708      	bx	r1
c0debcac:	00808001 	.word	0x00808001

c0debcb0 <os_boot>:
c0debcb0:	2000      	movs	r0, #0
c0debcb2:	f000 ba85 	b.w	c0dec1c0 <try_context_set>

c0debcb6 <os_longjmp>:
c0debcb6:	4604      	mov	r4, r0
c0debcb8:	f000 fa7a 	bl	c0dec1b0 <try_context_get>
c0debcbc:	4621      	mov	r1, r4
c0debcbe:	f000 fc0f 	bl	c0dec4e0 <longjmp>
	...

c0debcc4 <snprintf>:
c0debcc4:	b081      	sub	sp, #4
c0debcc6:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0debcca:	b087      	sub	sp, #28
c0debccc:	2800      	cmp	r0, #0
c0debcce:	930f      	str	r3, [sp, #60]	@ 0x3c
c0debcd0:	f000 817a 	beq.w	c0debfc8 <snprintf+0x304>
c0debcd4:	460d      	mov	r5, r1
c0debcd6:	2900      	cmp	r1, #0
c0debcd8:	f000 8176 	beq.w	c0debfc8 <snprintf+0x304>
c0debcdc:	4629      	mov	r1, r5
c0debcde:	4616      	mov	r6, r2
c0debce0:	4604      	mov	r4, r0
c0debce2:	f000 fba3 	bl	c0dec42c <__aeabi_memclr>
c0debce6:	f1b5 0801 	subs.w	r8, r5, #1
c0debcea:	f000 816d 	beq.w	c0debfc8 <snprintf+0x304>
c0debcee:	a80f      	add	r0, sp, #60	@ 0x3c
c0debcf0:	9002      	str	r0, [sp, #8]
c0debcf2:	7830      	ldrb	r0, [r6, #0]
c0debcf4:	2800      	cmp	r0, #0
c0debcf6:	f000 8167 	beq.w	c0debfc8 <snprintf+0x304>
c0debcfa:	2700      	movs	r7, #0
c0debcfc:	b128      	cbz	r0, c0debd0a <snprintf+0x46>
c0debcfe:	2825      	cmp	r0, #37	@ 0x25
c0debd00:	d003      	beq.n	c0debd0a <snprintf+0x46>
c0debd02:	19f0      	adds	r0, r6, r7
c0debd04:	3701      	adds	r7, #1
c0debd06:	7840      	ldrb	r0, [r0, #1]
c0debd08:	e7f8      	b.n	c0debcfc <snprintf+0x38>
c0debd0a:	4547      	cmp	r7, r8
c0debd0c:	bf28      	it	cs
c0debd0e:	4647      	movcs	r7, r8
c0debd10:	4620      	mov	r0, r4
c0debd12:	4631      	mov	r1, r6
c0debd14:	463a      	mov	r2, r7
c0debd16:	f000 fb81 	bl	c0dec41c <__aeabi_memmove>
c0debd1a:	ebb8 0807 	subs.w	r8, r8, r7
c0debd1e:	f000 8153 	beq.w	c0debfc8 <snprintf+0x304>
c0debd22:	5df1      	ldrb	r1, [r6, r7]
c0debd24:	19f0      	adds	r0, r6, r7
c0debd26:	443c      	add	r4, r7
c0debd28:	4606      	mov	r6, r0
c0debd2a:	2925      	cmp	r1, #37	@ 0x25
c0debd2c:	d1e1      	bne.n	c0debcf2 <snprintf+0x2e>
c0debd2e:	1c41      	adds	r1, r0, #1
c0debd30:	f04f 0b00 	mov.w	fp, #0
c0debd34:	f04f 0e20 	mov.w	lr, #32
c0debd38:	2500      	movs	r5, #0
c0debd3a:	2600      	movs	r6, #0
c0debd3c:	3101      	adds	r1, #1
c0debd3e:	f811 3c01 	ldrb.w	r3, [r1, #-1]
c0debd42:	4632      	mov	r2, r6
c0debd44:	3101      	adds	r1, #1
c0debd46:	2600      	movs	r6, #0
c0debd48:	2b2d      	cmp	r3, #45	@ 0x2d
c0debd4a:	d0f8      	beq.n	c0debd3e <snprintf+0x7a>
c0debd4c:	f1a3 0630 	sub.w	r6, r3, #48	@ 0x30
c0debd50:	2e0a      	cmp	r6, #10
c0debd52:	d313      	bcc.n	c0debd7c <snprintf+0xb8>
c0debd54:	2b25      	cmp	r3, #37	@ 0x25
c0debd56:	d046      	beq.n	c0debde6 <snprintf+0x122>
c0debd58:	2b2a      	cmp	r3, #42	@ 0x2a
c0debd5a:	d01f      	beq.n	c0debd9c <snprintf+0xd8>
c0debd5c:	2b2e      	cmp	r3, #46	@ 0x2e
c0debd5e:	d129      	bne.n	c0debdb4 <snprintf+0xf0>
c0debd60:	f811 2c01 	ldrb.w	r2, [r1, #-1]
c0debd64:	2a2a      	cmp	r2, #42	@ 0x2a
c0debd66:	d13c      	bne.n	c0debde2 <snprintf+0x11e>
c0debd68:	780a      	ldrb	r2, [r1, #0]
c0debd6a:	2a48      	cmp	r2, #72	@ 0x48
c0debd6c:	d003      	beq.n	c0debd76 <snprintf+0xb2>
c0debd6e:	2a73      	cmp	r2, #115	@ 0x73
c0debd70:	d001      	beq.n	c0debd76 <snprintf+0xb2>
c0debd72:	2a68      	cmp	r2, #104	@ 0x68
c0debd74:	d135      	bne.n	c0debde2 <snprintf+0x11e>
c0debd76:	9a02      	ldr	r2, [sp, #8]
c0debd78:	2601      	movs	r6, #1
c0debd7a:	e017      	b.n	c0debdac <snprintf+0xe8>
c0debd7c:	f083 0630 	eor.w	r6, r3, #48	@ 0x30
c0debd80:	ea56 060b 	orrs.w	r6, r6, fp
c0debd84:	bf08      	it	eq
c0debd86:	f04f 0e30 	moveq.w	lr, #48	@ 0x30
c0debd8a:	eb0b 068b 	add.w	r6, fp, fp, lsl #2
c0debd8e:	3901      	subs	r1, #1
c0debd90:	eb03 0346 	add.w	r3, r3, r6, lsl #1
c0debd94:	4616      	mov	r6, r2
c0debd96:	f1a3 0b30 	sub.w	fp, r3, #48	@ 0x30
c0debd9a:	e7cf      	b.n	c0debd3c <snprintf+0x78>
c0debd9c:	460b      	mov	r3, r1
c0debd9e:	f813 2d01 	ldrb.w	r2, [r3, #-1]!
c0debda2:	2a73      	cmp	r2, #115	@ 0x73
c0debda4:	d11d      	bne.n	c0debde2 <snprintf+0x11e>
c0debda6:	9a02      	ldr	r2, [sp, #8]
c0debda8:	2602      	movs	r6, #2
c0debdaa:	4619      	mov	r1, r3
c0debdac:	1d13      	adds	r3, r2, #4
c0debdae:	9302      	str	r3, [sp, #8]
c0debdb0:	6815      	ldr	r5, [r2, #0]
c0debdb2:	e7c3      	b.n	c0debd3c <snprintf+0x78>
c0debdb4:	2b48      	cmp	r3, #72	@ 0x48
c0debdb6:	d018      	beq.n	c0debdea <snprintf+0x126>
c0debdb8:	2b58      	cmp	r3, #88	@ 0x58
c0debdba:	d019      	beq.n	c0debdf0 <snprintf+0x12c>
c0debdbc:	2b63      	cmp	r3, #99	@ 0x63
c0debdbe:	d020      	beq.n	c0debe02 <snprintf+0x13e>
c0debdc0:	2b64      	cmp	r3, #100	@ 0x64
c0debdc2:	d02a      	beq.n	c0debe1a <snprintf+0x156>
c0debdc4:	2b68      	cmp	r3, #104	@ 0x68
c0debdc6:	d036      	beq.n	c0debe36 <snprintf+0x172>
c0debdc8:	2b70      	cmp	r3, #112	@ 0x70
c0debdca:	d006      	beq.n	c0debdda <snprintf+0x116>
c0debdcc:	2b73      	cmp	r3, #115	@ 0x73
c0debdce:	d037      	beq.n	c0debe40 <snprintf+0x17c>
c0debdd0:	2b75      	cmp	r3, #117	@ 0x75
c0debdd2:	f000 8081 	beq.w	c0debed8 <snprintf+0x214>
c0debdd6:	2b78      	cmp	r3, #120	@ 0x78
c0debdd8:	d103      	bne.n	c0debde2 <snprintf+0x11e>
c0debdda:	9400      	str	r4, [sp, #0]
c0debddc:	f04f 0c00 	mov.w	ip, #0
c0debde0:	e009      	b.n	c0debdf6 <snprintf+0x132>
c0debde2:	1e4e      	subs	r6, r1, #1
c0debde4:	e785      	b.n	c0debcf2 <snprintf+0x2e>
c0debde6:	2025      	movs	r0, #37	@ 0x25
c0debde8:	e00f      	b.n	c0debe0a <snprintf+0x146>
c0debdea:	487b      	ldr	r0, [pc, #492]	@ (c0debfd8 <snprintf+0x314>)
c0debdec:	4478      	add	r0, pc
c0debdee:	e024      	b.n	c0debe3a <snprintf+0x176>
c0debdf0:	f04f 0c01 	mov.w	ip, #1
c0debdf4:	9400      	str	r4, [sp, #0]
c0debdf6:	9a02      	ldr	r2, [sp, #8]
c0debdf8:	2400      	movs	r4, #0
c0debdfa:	1d13      	adds	r3, r2, #4
c0debdfc:	9302      	str	r3, [sp, #8]
c0debdfe:	2310      	movs	r3, #16
c0debe00:	e072      	b.n	c0debee8 <snprintf+0x224>
c0debe02:	9802      	ldr	r0, [sp, #8]
c0debe04:	1d02      	adds	r2, r0, #4
c0debe06:	9202      	str	r2, [sp, #8]
c0debe08:	6800      	ldr	r0, [r0, #0]
c0debe0a:	1e4e      	subs	r6, r1, #1
c0debe0c:	f804 0b01 	strb.w	r0, [r4], #1
c0debe10:	f1b8 0801 	subs.w	r8, r8, #1
c0debe14:	f47f af6d 	bne.w	c0debcf2 <snprintf+0x2e>
c0debe18:	e0d6      	b.n	c0debfc8 <snprintf+0x304>
c0debe1a:	9a02      	ldr	r2, [sp, #8]
c0debe1c:	9400      	str	r4, [sp, #0]
c0debe1e:	1d13      	adds	r3, r2, #4
c0debe20:	9302      	str	r3, [sp, #8]
c0debe22:	6813      	ldr	r3, [r2, #0]
c0debe24:	2b00      	cmp	r3, #0
c0debe26:	461a      	mov	r2, r3
c0debe28:	d500      	bpl.n	c0debe2c <snprintf+0x168>
c0debe2a:	425a      	negs	r2, r3
c0debe2c:	0fdc      	lsrs	r4, r3, #31
c0debe2e:	f04f 0c00 	mov.w	ip, #0
c0debe32:	230a      	movs	r3, #10
c0debe34:	e059      	b.n	c0debeea <snprintf+0x226>
c0debe36:	4869      	ldr	r0, [pc, #420]	@ (c0debfdc <snprintf+0x318>)
c0debe38:	4478      	add	r0, pc
c0debe3a:	f04f 0c01 	mov.w	ip, #1
c0debe3e:	e003      	b.n	c0debe48 <snprintf+0x184>
c0debe40:	4864      	ldr	r0, [pc, #400]	@ (c0debfd4 <snprintf+0x310>)
c0debe42:	f04f 0c00 	mov.w	ip, #0
c0debe46:	4478      	add	r0, pc
c0debe48:	9b02      	ldr	r3, [sp, #8]
c0debe4a:	b2d2      	uxtb	r2, r2
c0debe4c:	1d1e      	adds	r6, r3, #4
c0debe4e:	9602      	str	r6, [sp, #8]
c0debe50:	1e4e      	subs	r6, r1, #1
c0debe52:	6819      	ldr	r1, [r3, #0]
c0debe54:	2a02      	cmp	r2, #2
c0debe56:	f000 80a7 	beq.w	c0debfa8 <snprintf+0x2e4>
c0debe5a:	2a01      	cmp	r2, #1
c0debe5c:	d007      	beq.n	c0debe6e <snprintf+0x1aa>
c0debe5e:	463d      	mov	r5, r7
c0debe60:	b92a      	cbnz	r2, c0debe6e <snprintf+0x1aa>
c0debe62:	2200      	movs	r2, #0
c0debe64:	5c8b      	ldrb	r3, [r1, r2]
c0debe66:	3201      	adds	r2, #1
c0debe68:	2b00      	cmp	r3, #0
c0debe6a:	d1fb      	bne.n	c0debe64 <snprintf+0x1a0>
c0debe6c:	1e55      	subs	r5, r2, #1
c0debe6e:	f1bc 0f00 	cmp.w	ip, #0
c0debe72:	d016      	beq.n	c0debea2 <snprintf+0x1de>
c0debe74:	2d00      	cmp	r5, #0
c0debe76:	f43f af3c 	beq.w	c0debcf2 <snprintf+0x2e>
c0debe7a:	f1b8 0f02 	cmp.w	r8, #2
c0debe7e:	f0c0 80a3 	bcc.w	c0debfc8 <snprintf+0x304>
c0debe82:	780a      	ldrb	r2, [r1, #0]
c0debe84:	0913      	lsrs	r3, r2, #4
c0debe86:	f002 020f 	and.w	r2, r2, #15
c0debe8a:	5cc3      	ldrb	r3, [r0, r3]
c0debe8c:	f1b8 0802 	subs.w	r8, r8, #2
c0debe90:	7023      	strb	r3, [r4, #0]
c0debe92:	5c82      	ldrb	r2, [r0, r2]
c0debe94:	7062      	strb	r2, [r4, #1]
c0debe96:	f000 8097 	beq.w	c0debfc8 <snprintf+0x304>
c0debe9a:	3101      	adds	r1, #1
c0debe9c:	3d01      	subs	r5, #1
c0debe9e:	3402      	adds	r4, #2
c0debea0:	e7e8      	b.n	c0debe74 <snprintf+0x1b0>
c0debea2:	4545      	cmp	r5, r8
c0debea4:	bf28      	it	cs
c0debea6:	4645      	movcs	r5, r8
c0debea8:	4620      	mov	r0, r4
c0debeaa:	462a      	mov	r2, r5
c0debeac:	f000 fab6 	bl	c0dec41c <__aeabi_memmove>
c0debeb0:	ebb8 0805 	subs.w	r8, r8, r5
c0debeb4:	f000 8088 	beq.w	c0debfc8 <snprintf+0x304>
c0debeb8:	462f      	mov	r7, r5
c0debeba:	442c      	add	r4, r5
c0debebc:	45bb      	cmp	fp, r7
c0debebe:	f67f af18 	bls.w	c0debcf2 <snprintf+0x2e>
c0debec2:	ebab 0507 	sub.w	r5, fp, r7
c0debec6:	4620      	mov	r0, r4
c0debec8:	4545      	cmp	r5, r8
c0debeca:	bf28      	it	cs
c0debecc:	4645      	movcs	r5, r8
c0debece:	4629      	mov	r1, r5
c0debed0:	2220      	movs	r2, #32
c0debed2:	f000 faa5 	bl	c0dec420 <__aeabi_memset>
c0debed6:	e061      	b.n	c0debf9c <snprintf+0x2d8>
c0debed8:	9a02      	ldr	r2, [sp, #8]
c0debeda:	9400      	str	r4, [sp, #0]
c0debedc:	2400      	movs	r4, #0
c0debede:	f04f 0c00 	mov.w	ip, #0
c0debee2:	1d13      	adds	r3, r2, #4
c0debee4:	9302      	str	r3, [sp, #8]
c0debee6:	230a      	movs	r3, #10
c0debee8:	6812      	ldr	r2, [r2, #0]
c0debeea:	483d      	ldr	r0, [pc, #244]	@ (c0debfe0 <snprintf+0x31c>)
c0debeec:	1e4e      	subs	r6, r1, #1
c0debeee:	f04f 0a01 	mov.w	sl, #1
c0debef2:	4478      	add	r0, pc
c0debef4:	9001      	str	r0, [sp, #4]
c0debef6:	fba3 570a 	umull	r5, r7, r3, sl
c0debefa:	2f00      	cmp	r7, #0
c0debefc:	bf18      	it	ne
c0debefe:	2701      	movne	r7, #1
c0debf00:	4295      	cmp	r5, r2
c0debf02:	d804      	bhi.n	c0debf0e <snprintf+0x24a>
c0debf04:	b91f      	cbnz	r7, c0debf0e <snprintf+0x24a>
c0debf06:	f1ab 0b01 	sub.w	fp, fp, #1
c0debf0a:	46aa      	mov	sl, r5
c0debf0c:	e7f3      	b.n	c0debef6 <snprintf+0x232>
c0debf0e:	2c00      	cmp	r4, #0
c0debf10:	4627      	mov	r7, r4
c0debf12:	f04f 0500 	mov.w	r5, #0
c0debf16:	bf18      	it	ne
c0debf18:	f04f 37ff 	movne.w	r7, #4294967295	@ 0xffffffff
c0debf1c:	d00d      	beq.n	c0debf3a <snprintf+0x276>
c0debf1e:	4660      	mov	r0, ip
c0debf20:	fa5f fc8e 	uxtb.w	ip, lr
c0debf24:	a903      	add	r1, sp, #12
c0debf26:	f1bc 0f30 	cmp.w	ip, #48	@ 0x30
c0debf2a:	4684      	mov	ip, r0
c0debf2c:	d106      	bne.n	c0debf3c <snprintf+0x278>
c0debf2e:	202d      	movs	r0, #45	@ 0x2d
c0debf30:	2400      	movs	r4, #0
c0debf32:	2501      	movs	r5, #1
c0debf34:	f88d 000c 	strb.w	r0, [sp, #12]
c0debf38:	e000      	b.n	c0debf3c <snprintf+0x278>
c0debf3a:	a903      	add	r1, sp, #12
c0debf3c:	eb07 000b 	add.w	r0, r7, fp
c0debf40:	3802      	subs	r0, #2
c0debf42:	280d      	cmp	r0, #13
c0debf44:	d808      	bhi.n	c0debf58 <snprintf+0x294>
c0debf46:	f1c7 0701 	rsb	r7, r7, #1
c0debf4a:	45bb      	cmp	fp, r7
c0debf4c:	d004      	beq.n	c0debf58 <snprintf+0x294>
c0debf4e:	f801 e005 	strb.w	lr, [r1, r5]
c0debf52:	3701      	adds	r7, #1
c0debf54:	3501      	adds	r5, #1
c0debf56:	e7f8      	b.n	c0debf4a <snprintf+0x286>
c0debf58:	9f01      	ldr	r7, [sp, #4]
c0debf5a:	b114      	cbz	r4, c0debf62 <snprintf+0x29e>
c0debf5c:	202d      	movs	r0, #45	@ 0x2d
c0debf5e:	5548      	strb	r0, [r1, r5]
c0debf60:	3501      	adds	r5, #1
c0debf62:	4820      	ldr	r0, [pc, #128]	@ (c0debfe4 <snprintf+0x320>)
c0debf64:	f1bc 0f00 	cmp.w	ip, #0
c0debf68:	4478      	add	r0, pc
c0debf6a:	bf08      	it	eq
c0debf6c:	4638      	moveq	r0, r7
c0debf6e:	f1ba 0f00 	cmp.w	sl, #0
c0debf72:	d00b      	beq.n	c0debf8c <snprintf+0x2c8>
c0debf74:	fbb2 f7fa 	udiv	r7, r2, sl
c0debf78:	fbba faf3 	udiv	sl, sl, r3
c0debf7c:	fbb7 f4f3 	udiv	r4, r7, r3
c0debf80:	fb04 7413 	mls	r4, r4, r3, r7
c0debf84:	5d04      	ldrb	r4, [r0, r4]
c0debf86:	554c      	strb	r4, [r1, r5]
c0debf88:	3501      	adds	r5, #1
c0debf8a:	e7f0      	b.n	c0debf6e <snprintf+0x2aa>
c0debf8c:	4545      	cmp	r5, r8
c0debf8e:	bf28      	it	cs
c0debf90:	4645      	movcs	r5, r8
c0debf92:	9c00      	ldr	r4, [sp, #0]
c0debf94:	462a      	mov	r2, r5
c0debf96:	4620      	mov	r0, r4
c0debf98:	f000 fa40 	bl	c0dec41c <__aeabi_memmove>
c0debf9c:	ebb8 0805 	subs.w	r8, r8, r5
c0debfa0:	442c      	add	r4, r5
c0debfa2:	f47f aea6 	bne.w	c0debcf2 <snprintf+0x2e>
c0debfa6:	e00f      	b.n	c0debfc8 <snprintf+0x304>
c0debfa8:	7808      	ldrb	r0, [r1, #0]
c0debfaa:	2800      	cmp	r0, #0
c0debfac:	f47f aea1 	bne.w	c0debcf2 <snprintf+0x2e>
c0debfb0:	4545      	cmp	r5, r8
c0debfb2:	bf28      	it	cs
c0debfb4:	4645      	movcs	r5, r8
c0debfb6:	4620      	mov	r0, r4
c0debfb8:	4629      	mov	r1, r5
c0debfba:	2220      	movs	r2, #32
c0debfbc:	f000 fa30 	bl	c0dec420 <__aeabi_memset>
c0debfc0:	ebb8 0805 	subs.w	r8, r8, r5
c0debfc4:	f47f af79 	bne.w	c0debeba <snprintf+0x1f6>
c0debfc8:	2000      	movs	r0, #0
c0debfca:	b007      	add	sp, #28
c0debfcc:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0debfd0:	b001      	add	sp, #4
c0debfd2:	4770      	bx	lr
c0debfd4:	000039b6 	.word	0x000039b6
c0debfd8:	00003a50 	.word	0x00003a50
c0debfdc:	000039c4 	.word	0x000039c4
c0debfe0:	0000390a 	.word	0x0000390a
c0debfe4:	000038d4 	.word	0x000038d4

c0debfe8 <pic>:
c0debfe8:	4a0a      	ldr	r2, [pc, #40]	@ (c0dec014 <pic+0x2c>)
c0debfea:	4282      	cmp	r2, r0
c0debfec:	490a      	ldr	r1, [pc, #40]	@ (c0dec018 <pic+0x30>)
c0debfee:	d806      	bhi.n	c0debffe <pic+0x16>
c0debff0:	4281      	cmp	r1, r0
c0debff2:	d304      	bcc.n	c0debffe <pic+0x16>
c0debff4:	b580      	push	{r7, lr}
c0debff6:	f000 f815 	bl	c0dec024 <pic_internal>
c0debffa:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0debffe:	4907      	ldr	r1, [pc, #28]	@ (c0dec01c <pic+0x34>)
c0dec000:	4288      	cmp	r0, r1
c0dec002:	4a07      	ldr	r2, [pc, #28]	@ (c0dec020 <pic+0x38>)
c0dec004:	d304      	bcc.n	c0dec010 <pic+0x28>
c0dec006:	4290      	cmp	r0, r2
c0dec008:	d802      	bhi.n	c0dec010 <pic+0x28>
c0dec00a:	1a40      	subs	r0, r0, r1
c0dec00c:	4649      	mov	r1, r9
c0dec00e:	4408      	add	r0, r1
c0dec010:	4770      	bx	lr
c0dec012:	0000      	movs	r0, r0
c0dec014:	c0de0000 	.word	0xc0de0000
c0dec018:	c0defd68 	.word	0xc0defd68
c0dec01c:	da7a0000 	.word	0xda7a0000
c0dec020:	da7a9000 	.word	0xda7a9000

c0dec024 <pic_internal>:
c0dec024:	467a      	mov	r2, pc
c0dec026:	4902      	ldr	r1, [pc, #8]	@ (c0dec030 <pic_internal+0xc>)
c0dec028:	1cc9      	adds	r1, r1, #3
c0dec02a:	1a89      	subs	r1, r1, r2
c0dec02c:	1a40      	subs	r0, r0, r1
c0dec02e:	4770      	bx	lr
c0dec030:	c0dec025 	.word	0xc0dec025

c0dec034 <SVC_Call>:
c0dec034:	df01      	svc	1
c0dec036:	2900      	cmp	r1, #0
c0dec038:	d100      	bne.n	c0dec03c <exception>
c0dec03a:	4770      	bx	lr

c0dec03c <exception>:
c0dec03c:	4608      	mov	r0, r1
c0dec03e:	f7ff fe3a 	bl	c0debcb6 <os_longjmp>
	...

c0dec044 <SVC_cx_call>:
c0dec044:	df01      	svc	1
c0dec046:	4770      	bx	lr

c0dec048 <nbgl_wait_pipeline>:
c0dec048:	b5e0      	push	{r5, r6, r7, lr}
c0dec04a:	2000      	movs	r0, #0
c0dec04c:	9001      	str	r0, [sp, #4]
c0dec04e:	4802      	ldr	r0, [pc, #8]	@ (c0dec058 <nbgl_wait_pipeline+0x10>)
c0dec050:	a901      	add	r1, sp, #4
c0dec052:	f7ff ffef 	bl	c0dec034 <SVC_Call>
c0dec056:	bd8c      	pop	{r2, r3, r7, pc}
c0dec058:	00fa0011 	.word	0x00fa0011

c0dec05c <nvm_write>:
c0dec05c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0dec05e:	ab01      	add	r3, sp, #4
c0dec060:	c307      	stmia	r3!, {r0, r1, r2}
c0dec062:	4802      	ldr	r0, [pc, #8]	@ (c0dec06c <nvm_write+0x10>)
c0dec064:	a901      	add	r1, sp, #4
c0dec066:	f7ff ffe5 	bl	c0dec034 <SVC_Call>
c0dec06a:	bd8f      	pop	{r0, r1, r2, r3, r7, pc}
c0dec06c:	03000003 	.word	0x03000003

c0dec070 <cx_ecdomain_parameters_length>:
c0dec070:	b5e0      	push	{r5, r6, r7, lr}
c0dec072:	e9cd 0100 	strd	r0, r1, [sp]
c0dec076:	4802      	ldr	r0, [pc, #8]	@ (c0dec080 <cx_ecdomain_parameters_length+0x10>)
c0dec078:	4669      	mov	r1, sp
c0dec07a:	f7ff ffe3 	bl	c0dec044 <SVC_cx_call>
c0dec07e:	bd8c      	pop	{r2, r3, r7, pc}
c0dec080:	0200012f 	.word	0x0200012f

c0dec084 <os_perso_derive_node_with_seed_key>:
c0dec084:	b510      	push	{r4, lr}
c0dec086:	b088      	sub	sp, #32
c0dec088:	9c0d      	ldr	r4, [sp, #52]	@ 0x34
c0dec08a:	9407      	str	r4, [sp, #28]
c0dec08c:	9c0c      	ldr	r4, [sp, #48]	@ 0x30
c0dec08e:	9406      	str	r4, [sp, #24]
c0dec090:	9c0b      	ldr	r4, [sp, #44]	@ 0x2c
c0dec092:	9405      	str	r4, [sp, #20]
c0dec094:	9c0a      	ldr	r4, [sp, #40]	@ 0x28
c0dec096:	e88d 001f 	stmia.w	sp, {r0, r1, r2, r3, r4}
c0dec09a:	4803      	ldr	r0, [pc, #12]	@ (c0dec0a8 <os_perso_derive_node_with_seed_key+0x24>)
c0dec09c:	4669      	mov	r1, sp
c0dec09e:	f7ff ffc9 	bl	c0dec034 <SVC_Call>
c0dec0a2:	b008      	add	sp, #32
c0dec0a4:	bd10      	pop	{r4, pc}
c0dec0a6:	bf00      	nop
c0dec0a8:	080000a6 	.word	0x080000a6

c0dec0ac <os_pki_load_certificate>:
c0dec0ac:	b510      	push	{r4, lr}
c0dec0ae:	b086      	sub	sp, #24
c0dec0b0:	9c09      	ldr	r4, [sp, #36]	@ 0x24
c0dec0b2:	9405      	str	r4, [sp, #20]
c0dec0b4:	9c08      	ldr	r4, [sp, #32]
c0dec0b6:	e88d 001f 	stmia.w	sp, {r0, r1, r2, r3, r4}
c0dec0ba:	4803      	ldr	r0, [pc, #12]	@ (c0dec0c8 <os_pki_load_certificate+0x1c>)
c0dec0bc:	4669      	mov	r1, sp
c0dec0be:	f7ff ffb9 	bl	c0dec034 <SVC_Call>
c0dec0c2:	b006      	add	sp, #24
c0dec0c4:	bd10      	pop	{r4, pc}
c0dec0c6:	bf00      	nop
c0dec0c8:	060000aa 	.word	0x060000aa

c0dec0cc <os_perso_is_pin_set>:
c0dec0cc:	b5e0      	push	{r5, r6, r7, lr}
c0dec0ce:	2000      	movs	r0, #0
c0dec0d0:	4669      	mov	r1, sp
c0dec0d2:	9001      	str	r0, [sp, #4]
c0dec0d4:	209e      	movs	r0, #158	@ 0x9e
c0dec0d6:	f7ff ffad 	bl	c0dec034 <SVC_Call>
c0dec0da:	b2c0      	uxtb	r0, r0
c0dec0dc:	bd8c      	pop	{r2, r3, r7, pc}

c0dec0de <os_global_pin_is_validated>:
c0dec0de:	b5e0      	push	{r5, r6, r7, lr}
c0dec0e0:	2000      	movs	r0, #0
c0dec0e2:	4669      	mov	r1, sp
c0dec0e4:	9001      	str	r0, [sp, #4]
c0dec0e6:	20a0      	movs	r0, #160	@ 0xa0
c0dec0e8:	f7ff ffa4 	bl	c0dec034 <SVC_Call>
c0dec0ec:	b2c0      	uxtb	r0, r0
c0dec0ee:	bd8c      	pop	{r2, r3, r7, pc}

c0dec0f0 <os_ux>:
c0dec0f0:	b5e0      	push	{r5, r6, r7, lr}
c0dec0f2:	f000 f885 	bl	c0dec200 <OUTLINED_FUNCTION_0>
c0dec0f6:	4802      	ldr	r0, [pc, #8]	@ (c0dec100 <os_ux+0x10>)
c0dec0f8:	4669      	mov	r1, sp
c0dec0fa:	f7ff ff9b 	bl	c0dec034 <SVC_Call>
c0dec0fe:	bd8c      	pop	{r2, r3, r7, pc}
c0dec100:	01000064 	.word	0x01000064

c0dec104 <os_flags>:
c0dec104:	b5e0      	push	{r5, r6, r7, lr}
c0dec106:	2000      	movs	r0, #0
c0dec108:	4669      	mov	r1, sp
c0dec10a:	9001      	str	r0, [sp, #4]
c0dec10c:	206a      	movs	r0, #106	@ 0x6a
c0dec10e:	f7ff ff91 	bl	c0dec034 <SVC_Call>
c0dec112:	bd8c      	pop	{r2, r3, r7, pc}

c0dec114 <os_setting_get>:
c0dec114:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0dec116:	ab01      	add	r3, sp, #4
c0dec118:	c307      	stmia	r3!, {r0, r1, r2}
c0dec11a:	4803      	ldr	r0, [pc, #12]	@ (c0dec128 <os_setting_get+0x14>)
c0dec11c:	a901      	add	r1, sp, #4
c0dec11e:	f7ff ff89 	bl	c0dec034 <SVC_Call>
c0dec122:	b004      	add	sp, #16
c0dec124:	bd80      	pop	{r7, pc}
c0dec126:	bf00      	nop
c0dec128:	03000070 	.word	0x03000070

c0dec12c <os_registry_get_current_app_tag>:
c0dec12c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0dec12e:	ab01      	add	r3, sp, #4
c0dec130:	c307      	stmia	r3!, {r0, r1, r2}
c0dec132:	4803      	ldr	r0, [pc, #12]	@ (c0dec140 <os_registry_get_current_app_tag+0x14>)
c0dec134:	a901      	add	r1, sp, #4
c0dec136:	f7ff ff7d 	bl	c0dec034 <SVC_Call>
c0dec13a:	b004      	add	sp, #16
c0dec13c:	bd80      	pop	{r7, pc}
c0dec13e:	bf00      	nop
c0dec140:	03000074 	.word	0x03000074

c0dec144 <os_sched_exit>:
c0dec144:	b082      	sub	sp, #8
c0dec146:	f000 f85b 	bl	c0dec200 <OUTLINED_FUNCTION_0>
c0dec14a:	4802      	ldr	r0, [pc, #8]	@ (c0dec154 <os_sched_exit+0x10>)
c0dec14c:	4669      	mov	r1, sp
c0dec14e:	f7ff ff71 	bl	c0dec034 <SVC_Call>
c0dec152:	deff      	udf	#255	@ 0xff
c0dec154:	0100009a 	.word	0x0100009a

c0dec158 <os_io_init>:
c0dec158:	b5e0      	push	{r5, r6, r7, lr}
c0dec15a:	9001      	str	r0, [sp, #4]
c0dec15c:	4802      	ldr	r0, [pc, #8]	@ (c0dec168 <os_io_init+0x10>)
c0dec15e:	a901      	add	r1, sp, #4
c0dec160:	f7ff ff68 	bl	c0dec034 <SVC_Call>
c0dec164:	bd8c      	pop	{r2, r3, r7, pc}
c0dec166:	bf00      	nop
c0dec168:	01000084 	.word	0x01000084

c0dec16c <os_io_start>:
c0dec16c:	b5e0      	push	{r5, r6, r7, lr}
c0dec16e:	2000      	movs	r0, #0
c0dec170:	4669      	mov	r1, sp
c0dec172:	9001      	str	r0, [sp, #4]
c0dec174:	4801      	ldr	r0, [pc, #4]	@ (c0dec17c <os_io_start+0x10>)
c0dec176:	f7ff ff5d 	bl	c0dec034 <SVC_Call>
c0dec17a:	bd8c      	pop	{r2, r3, r7, pc}
c0dec17c:	01000085 	.word	0x01000085

c0dec180 <os_io_tx_cmd>:
c0dec180:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0dec182:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0dec186:	4803      	ldr	r0, [pc, #12]	@ (c0dec194 <os_io_tx_cmd+0x14>)
c0dec188:	4669      	mov	r1, sp
c0dec18a:	f7ff ff53 	bl	c0dec034 <SVC_Call>
c0dec18e:	b004      	add	sp, #16
c0dec190:	bd80      	pop	{r7, pc}
c0dec192:	bf00      	nop
c0dec194:	04000088 	.word	0x04000088

c0dec198 <os_io_rx_evt>:
c0dec198:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0dec19a:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0dec19e:	4803      	ldr	r0, [pc, #12]	@ (c0dec1ac <os_io_rx_evt+0x14>)
c0dec1a0:	4669      	mov	r1, sp
c0dec1a2:	f7ff ff47 	bl	c0dec034 <SVC_Call>
c0dec1a6:	b004      	add	sp, #16
c0dec1a8:	bd80      	pop	{r7, pc}
c0dec1aa:	bf00      	nop
c0dec1ac:	03000089 	.word	0x03000089

c0dec1b0 <try_context_get>:
c0dec1b0:	b5e0      	push	{r5, r6, r7, lr}
c0dec1b2:	2000      	movs	r0, #0
c0dec1b4:	4669      	mov	r1, sp
c0dec1b6:	9001      	str	r0, [sp, #4]
c0dec1b8:	2087      	movs	r0, #135	@ 0x87
c0dec1ba:	f7ff ff3b 	bl	c0dec034 <SVC_Call>
c0dec1be:	bd8c      	pop	{r2, r3, r7, pc}

c0dec1c0 <try_context_set>:
c0dec1c0:	b5e0      	push	{r5, r6, r7, lr}
c0dec1c2:	f000 f81d 	bl	c0dec200 <OUTLINED_FUNCTION_0>
c0dec1c6:	4802      	ldr	r0, [pc, #8]	@ (c0dec1d0 <try_context_set+0x10>)
c0dec1c8:	4669      	mov	r1, sp
c0dec1ca:	f7ff ff33 	bl	c0dec034 <SVC_Call>
c0dec1ce:	bd8c      	pop	{r2, r3, r7, pc}
c0dec1d0:	0100010b 	.word	0x0100010b

c0dec1d4 <os_sched_last_status>:
c0dec1d4:	b5e0      	push	{r5, r6, r7, lr}
c0dec1d6:	f000 f813 	bl	c0dec200 <OUTLINED_FUNCTION_0>
c0dec1da:	4803      	ldr	r0, [pc, #12]	@ (c0dec1e8 <os_sched_last_status+0x14>)
c0dec1dc:	4669      	mov	r1, sp
c0dec1de:	f7ff ff29 	bl	c0dec034 <SVC_Call>
c0dec1e2:	b2c0      	uxtb	r0, r0
c0dec1e4:	bd8c      	pop	{r2, r3, r7, pc}
c0dec1e6:	bf00      	nop
c0dec1e8:	0100009c 	.word	0x0100009c

c0dec1ec <touch_get_last_info>:
c0dec1ec:	b5e0      	push	{r5, r6, r7, lr}
c0dec1ee:	9001      	str	r0, [sp, #4]
c0dec1f0:	4802      	ldr	r0, [pc, #8]	@ (c0dec1fc <touch_get_last_info+0x10>)
c0dec1f2:	a901      	add	r1, sp, #4
c0dec1f4:	f7ff ff1e 	bl	c0dec034 <SVC_Call>
c0dec1f8:	bd8c      	pop	{r2, r3, r7, pc}
c0dec1fa:	bf00      	nop
c0dec1fc:	01fa000b 	.word	0x01fa000b

c0dec200 <OUTLINED_FUNCTION_0>:
c0dec200:	2100      	movs	r1, #0
c0dec202:	e9cd 0100 	strd	r0, r1, [sp]
c0dec206:	4770      	bx	lr

c0dec208 <__aeabi_llsl>:
c0dec208:	0693      	lsls	r3, r2, #26
c0dec20a:	d408      	bmi.n	c0dec21e <__aeabi_llsl+0x16>
c0dec20c:	b132      	cbz	r2, c0dec21c <__aeabi_llsl+0x14>
c0dec20e:	f1c2 0320 	rsb	r3, r2, #32
c0dec212:	4091      	lsls	r1, r2
c0dec214:	fa20 f303 	lsr.w	r3, r0, r3
c0dec218:	4090      	lsls	r0, r2
c0dec21a:	4319      	orrs	r1, r3
c0dec21c:	4770      	bx	lr
c0dec21e:	f1a2 0120 	sub.w	r1, r2, #32
c0dec222:	fa00 f101 	lsl.w	r1, r0, r1
c0dec226:	2000      	movs	r0, #0
c0dec228:	4770      	bx	lr
	...

c0dec22c <__aeabi_llsr>:
c0dec22c:	0693      	lsls	r3, r2, #26
c0dec22e:	d408      	bmi.n	c0dec242 <__aeabi_llsr+0x16>
c0dec230:	b132      	cbz	r2, c0dec240 <__aeabi_llsr+0x14>
c0dec232:	f1c2 0320 	rsb	r3, r2, #32
c0dec236:	40d0      	lsrs	r0, r2
c0dec238:	fa01 f303 	lsl.w	r3, r1, r3
c0dec23c:	40d1      	lsrs	r1, r2
c0dec23e:	4318      	orrs	r0, r3
c0dec240:	4770      	bx	lr
c0dec242:	f1a2 0020 	sub.w	r0, r2, #32
c0dec246:	fa21 f000 	lsr.w	r0, r1, r0
c0dec24a:	2100      	movs	r1, #0
c0dec24c:	4770      	bx	lr
	...

c0dec250 <__udivmoddi4>:
c0dec250:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dec254:	f8dd c020 	ldr.w	ip, [sp, #32]
c0dec258:	4604      	mov	r4, r0
c0dec25a:	b179      	cbz	r1, c0dec27c <__udivmoddi4+0x2c>
c0dec25c:	b1ba      	cbz	r2, c0dec28e <__udivmoddi4+0x3e>
c0dec25e:	b35b      	cbz	r3, c0dec2b8 <__udivmoddi4+0x68>
c0dec260:	fab1 f581 	clz	r5, r1
c0dec264:	fab3 f683 	clz	r6, r3
c0dec268:	1b75      	subs	r5, r6, r5
c0dec26a:	2d20      	cmp	r5, #32
c0dec26c:	d34a      	bcc.n	c0dec304 <__udivmoddi4+0xb4>
c0dec26e:	f1bc 0f00 	cmp.w	ip, #0
c0dec272:	bf18      	it	ne
c0dec274:	e9cc 4100 	strdne	r4, r1, [ip]
c0dec278:	2400      	movs	r4, #0
c0dec27a:	e066      	b.n	c0dec34a <__udivmoddi4+0xfa>
c0dec27c:	b3cb      	cbz	r3, c0dec2f2 <__udivmoddi4+0xa2>
c0dec27e:	2100      	movs	r1, #0
c0dec280:	f1bc 0f00 	cmp.w	ip, #0
c0dec284:	bf18      	it	ne
c0dec286:	e9cc 4100 	strdne	r4, r1, [ip]
c0dec28a:	2400      	movs	r4, #0
c0dec28c:	e0a6      	b.n	c0dec3dc <__udivmoddi4+0x18c>
c0dec28e:	2b00      	cmp	r3, #0
c0dec290:	d03e      	beq.n	c0dec310 <__udivmoddi4+0xc0>
c0dec292:	2800      	cmp	r0, #0
c0dec294:	d04f      	beq.n	c0dec336 <__udivmoddi4+0xe6>
c0dec296:	1e5d      	subs	r5, r3, #1
c0dec298:	422b      	tst	r3, r5
c0dec29a:	d158      	bne.n	c0dec34e <__udivmoddi4+0xfe>
c0dec29c:	f1bc 0f00 	cmp.w	ip, #0
c0dec2a0:	bf1c      	itt	ne
c0dec2a2:	ea05 0001 	andne.w	r0, r5, r1
c0dec2a6:	e9cc 4000 	strdne	r4, r0, [ip]
c0dec2aa:	fa93 f0a3 	rbit	r0, r3
c0dec2ae:	fab0 f080 	clz	r0, r0
c0dec2b2:	fa21 f400 	lsr.w	r4, r1, r0
c0dec2b6:	e048      	b.n	c0dec34a <__udivmoddi4+0xfa>
c0dec2b8:	1e55      	subs	r5, r2, #1
c0dec2ba:	422a      	tst	r2, r5
c0dec2bc:	d129      	bne.n	c0dec312 <__udivmoddi4+0xc2>
c0dec2be:	f1bc 0f00 	cmp.w	ip, #0
c0dec2c2:	bf1e      	ittt	ne
c0dec2c4:	2300      	movne	r3, #0
c0dec2c6:	4005      	andne	r5, r0
c0dec2c8:	e9cc 5300 	strdne	r5, r3, [ip]
c0dec2cc:	2a01      	cmp	r2, #1
c0dec2ce:	f000 8085 	beq.w	c0dec3dc <__udivmoddi4+0x18c>
c0dec2d2:	fa92 f2a2 	rbit	r2, r2
c0dec2d6:	004c      	lsls	r4, r1, #1
c0dec2d8:	fab2 f282 	clz	r2, r2
c0dec2dc:	f002 031f 	and.w	r3, r2, #31
c0dec2e0:	40d1      	lsrs	r1, r2
c0dec2e2:	40d8      	lsrs	r0, r3
c0dec2e4:	231f      	movs	r3, #31
c0dec2e6:	4393      	bics	r3, r2
c0dec2e8:	fa04 f303 	lsl.w	r3, r4, r3
c0dec2ec:	ea43 0400 	orr.w	r4, r3, r0
c0dec2f0:	e074      	b.n	c0dec3dc <__udivmoddi4+0x18c>
c0dec2f2:	fbb0 f4f2 	udiv	r4, r0, r2
c0dec2f6:	f1bc 0f00 	cmp.w	ip, #0
c0dec2fa:	d026      	beq.n	c0dec34a <__udivmoddi4+0xfa>
c0dec2fc:	fb04 0012 	mls	r0, r4, r2, r0
c0dec300:	2100      	movs	r1, #0
c0dec302:	e020      	b.n	c0dec346 <__udivmoddi4+0xf6>
c0dec304:	f105 0e01 	add.w	lr, r5, #1
c0dec308:	f1be 0f20 	cmp.w	lr, #32
c0dec30c:	d00b      	beq.n	c0dec326 <__udivmoddi4+0xd6>
c0dec30e:	e028      	b.n	c0dec362 <__udivmoddi4+0x112>
c0dec310:	e064      	b.n	c0dec3dc <__udivmoddi4+0x18c>
c0dec312:	fab1 f481 	clz	r4, r1
c0dec316:	fab2 f582 	clz	r5, r2
c0dec31a:	1b2c      	subs	r4, r5, r4
c0dec31c:	f104 0e21 	add.w	lr, r4, #33	@ 0x21
c0dec320:	f1be 0f20 	cmp.w	lr, #32
c0dec324:	d15d      	bne.n	c0dec3e2 <__udivmoddi4+0x192>
c0dec326:	f04f 0e20 	mov.w	lr, #32
c0dec32a:	f04f 0a00 	mov.w	sl, #0
c0dec32e:	f04f 0b00 	mov.w	fp, #0
c0dec332:	460e      	mov	r6, r1
c0dec334:	e021      	b.n	c0dec37a <__udivmoddi4+0x12a>
c0dec336:	fbb1 f4f3 	udiv	r4, r1, r3
c0dec33a:	f1bc 0f00 	cmp.w	ip, #0
c0dec33e:	d004      	beq.n	c0dec34a <__udivmoddi4+0xfa>
c0dec340:	2000      	movs	r0, #0
c0dec342:	fb04 1113 	mls	r1, r4, r3, r1
c0dec346:	e9cc 0100 	strd	r0, r1, [ip]
c0dec34a:	2100      	movs	r1, #0
c0dec34c:	e046      	b.n	c0dec3dc <__udivmoddi4+0x18c>
c0dec34e:	fab1 f581 	clz	r5, r1
c0dec352:	fab3 f683 	clz	r6, r3
c0dec356:	1b75      	subs	r5, r6, r5
c0dec358:	2d1f      	cmp	r5, #31
c0dec35a:	f4bf af88 	bcs.w	c0dec26e <__udivmoddi4+0x1e>
c0dec35e:	f105 0e01 	add.w	lr, r5, #1
c0dec362:	fa20 f40e 	lsr.w	r4, r0, lr
c0dec366:	f1c5 051f 	rsb	r5, r5, #31
c0dec36a:	fa01 f605 	lsl.w	r6, r1, r5
c0dec36e:	fa21 fb0e 	lsr.w	fp, r1, lr
c0dec372:	40a8      	lsls	r0, r5
c0dec374:	f04f 0a00 	mov.w	sl, #0
c0dec378:	4326      	orrs	r6, r4
c0dec37a:	f04f 0800 	mov.w	r8, #0
c0dec37e:	f1be 0f00 	cmp.w	lr, #0
c0dec382:	d01c      	beq.n	c0dec3be <__udivmoddi4+0x16e>
c0dec384:	ea4f 014b 	mov.w	r1, fp, lsl #1
c0dec388:	f1ae 0e01 	sub.w	lr, lr, #1
c0dec38c:	ea41 71d6 	orr.w	r1, r1, r6, lsr #31
c0dec390:	0076      	lsls	r6, r6, #1
c0dec392:	ea46 75d0 	orr.w	r5, r6, r0, lsr #31
c0dec396:	1aae      	subs	r6, r5, r2
c0dec398:	eb61 0b03 	sbc.w	fp, r1, r3
c0dec39c:	43cf      	mvns	r7, r1
c0dec39e:	43ec      	mvns	r4, r5
c0dec3a0:	18a4      	adds	r4, r4, r2
c0dec3a2:	eb57 0403 	adcs.w	r4, r7, r3
c0dec3a6:	bf5c      	itt	pl
c0dec3a8:	468b      	movpl	fp, r1
c0dec3aa:	462e      	movpl	r6, r5
c0dec3ac:	0040      	lsls	r0, r0, #1
c0dec3ae:	0fe1      	lsrs	r1, r4, #31
c0dec3b0:	ea48 044a 	orr.w	r4, r8, sl, lsl #1
c0dec3b4:	ea40 70da 	orr.w	r0, r0, sl, lsr #31
c0dec3b8:	46a2      	mov	sl, r4
c0dec3ba:	4688      	mov	r8, r1
c0dec3bc:	e7df      	b.n	c0dec37e <__udivmoddi4+0x12e>
c0dec3be:	ea4f 71da 	mov.w	r1, sl, lsr #31
c0dec3c2:	f1bc 0f00 	cmp.w	ip, #0
c0dec3c6:	bf18      	it	ne
c0dec3c8:	e9cc 6b00 	strdne	r6, fp, [ip]
c0dec3cc:	ea41 0140 	orr.w	r1, r1, r0, lsl #1
c0dec3d0:	ea4f 004a 	mov.w	r0, sl, lsl #1
c0dec3d4:	f020 0001 	bic.w	r0, r0, #1
c0dec3d8:	ea40 0408 	orr.w	r4, r0, r8
c0dec3dc:	4620      	mov	r0, r4
c0dec3de:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0dec3e2:	f1be 0f1f 	cmp.w	lr, #31
c0dec3e6:	d804      	bhi.n	c0dec3f2 <__udivmoddi4+0x1a2>
c0dec3e8:	fa20 f40e 	lsr.w	r4, r0, lr
c0dec3ec:	f1ce 0520 	rsb	r5, lr, #32
c0dec3f0:	e7bb      	b.n	c0dec36a <__udivmoddi4+0x11a>
c0dec3f2:	f1ce 0740 	rsb	r7, lr, #64	@ 0x40
c0dec3f6:	f1ae 0420 	sub.w	r4, lr, #32
c0dec3fa:	f04f 0b00 	mov.w	fp, #0
c0dec3fe:	fa20 f504 	lsr.w	r5, r0, r4
c0dec402:	fa01 f607 	lsl.w	r6, r1, r7
c0dec406:	fa00 fa07 	lsl.w	sl, r0, r7
c0dec40a:	ea46 0805 	orr.w	r8, r6, r5
c0dec40e:	fa21 f604 	lsr.w	r6, r1, r4
c0dec412:	4640      	mov	r0, r8
c0dec414:	e7b1      	b.n	c0dec37a <__udivmoddi4+0x12a>
	...

c0dec418 <__aeabi_memcpy>:
c0dec418:	f000 b82c 	b.w	c0dec474 <memcpy>

c0dec41c <__aeabi_memmove>:
c0dec41c:	f000 b838 	b.w	c0dec490 <memmove>

c0dec420 <__aeabi_memset>:
c0dec420:	460b      	mov	r3, r1
c0dec422:	4611      	mov	r1, r2
c0dec424:	461a      	mov	r2, r3
c0dec426:	f000 b84d 	b.w	c0dec4c4 <memset>
c0dec42a:	bf00      	nop

c0dec42c <__aeabi_memclr>:
c0dec42c:	460a      	mov	r2, r1
c0dec42e:	2100      	movs	r1, #0
c0dec430:	f000 b848 	b.w	c0dec4c4 <memset>

c0dec434 <__aeabi_uldivmod>:
c0dec434:	b540      	push	{r6, lr}
c0dec436:	b084      	sub	sp, #16
c0dec438:	ae02      	add	r6, sp, #8
c0dec43a:	9600      	str	r6, [sp, #0]
c0dec43c:	f7ff ff08 	bl	c0dec250 <__udivmoddi4>
c0dec440:	9a02      	ldr	r2, [sp, #8]
c0dec442:	9b03      	ldr	r3, [sp, #12]
c0dec444:	b004      	add	sp, #16
c0dec446:	bd40      	pop	{r6, pc}

c0dec448 <explicit_bzero>:
c0dec448:	f000 b800 	b.w	c0dec44c <bzero>

c0dec44c <bzero>:
c0dec44c:	460a      	mov	r2, r1
c0dec44e:	2100      	movs	r1, #0
c0dec450:	f000 b838 	b.w	c0dec4c4 <memset>

c0dec454 <memcmp>:
c0dec454:	b510      	push	{r4, lr}
c0dec456:	3901      	subs	r1, #1
c0dec458:	4402      	add	r2, r0
c0dec45a:	4290      	cmp	r0, r2
c0dec45c:	d101      	bne.n	c0dec462 <memcmp+0xe>
c0dec45e:	2000      	movs	r0, #0
c0dec460:	e005      	b.n	c0dec46e <memcmp+0x1a>
c0dec462:	7803      	ldrb	r3, [r0, #0]
c0dec464:	f811 4f01 	ldrb.w	r4, [r1, #1]!
c0dec468:	42a3      	cmp	r3, r4
c0dec46a:	d001      	beq.n	c0dec470 <memcmp+0x1c>
c0dec46c:	1b18      	subs	r0, r3, r4
c0dec46e:	bd10      	pop	{r4, pc}
c0dec470:	3001      	adds	r0, #1
c0dec472:	e7f2      	b.n	c0dec45a <memcmp+0x6>

c0dec474 <memcpy>:
c0dec474:	440a      	add	r2, r1
c0dec476:	4291      	cmp	r1, r2
c0dec478:	f100 33ff 	add.w	r3, r0, #4294967295	@ 0xffffffff
c0dec47c:	d100      	bne.n	c0dec480 <memcpy+0xc>
c0dec47e:	4770      	bx	lr
c0dec480:	b510      	push	{r4, lr}
c0dec482:	f811 4b01 	ldrb.w	r4, [r1], #1
c0dec486:	4291      	cmp	r1, r2
c0dec488:	f803 4f01 	strb.w	r4, [r3, #1]!
c0dec48c:	d1f9      	bne.n	c0dec482 <memcpy+0xe>
c0dec48e:	bd10      	pop	{r4, pc}

c0dec490 <memmove>:
c0dec490:	4288      	cmp	r0, r1
c0dec492:	b510      	push	{r4, lr}
c0dec494:	eb01 0402 	add.w	r4, r1, r2
c0dec498:	d902      	bls.n	c0dec4a0 <memmove+0x10>
c0dec49a:	4284      	cmp	r4, r0
c0dec49c:	4623      	mov	r3, r4
c0dec49e:	d807      	bhi.n	c0dec4b0 <memmove+0x20>
c0dec4a0:	1e43      	subs	r3, r0, #1
c0dec4a2:	42a1      	cmp	r1, r4
c0dec4a4:	d008      	beq.n	c0dec4b8 <memmove+0x28>
c0dec4a6:	f811 2b01 	ldrb.w	r2, [r1], #1
c0dec4aa:	f803 2f01 	strb.w	r2, [r3, #1]!
c0dec4ae:	e7f8      	b.n	c0dec4a2 <memmove+0x12>
c0dec4b0:	4601      	mov	r1, r0
c0dec4b2:	4402      	add	r2, r0
c0dec4b4:	428a      	cmp	r2, r1
c0dec4b6:	d100      	bne.n	c0dec4ba <memmove+0x2a>
c0dec4b8:	bd10      	pop	{r4, pc}
c0dec4ba:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
c0dec4be:	f802 4d01 	strb.w	r4, [r2, #-1]!
c0dec4c2:	e7f7      	b.n	c0dec4b4 <memmove+0x24>

c0dec4c4 <memset>:
c0dec4c4:	4603      	mov	r3, r0
c0dec4c6:	4402      	add	r2, r0
c0dec4c8:	4293      	cmp	r3, r2
c0dec4ca:	d100      	bne.n	c0dec4ce <memset+0xa>
c0dec4cc:	4770      	bx	lr
c0dec4ce:	f803 1b01 	strb.w	r1, [r3], #1
c0dec4d2:	e7f9      	b.n	c0dec4c8 <memset+0x4>

c0dec4d4 <setjmp>:
c0dec4d4:	46ec      	mov	ip, sp
c0dec4d6:	e8a0 5ff0 	stmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
c0dec4da:	f04f 0000 	mov.w	r0, #0
c0dec4de:	4770      	bx	lr

c0dec4e0 <longjmp>:
c0dec4e0:	e8b0 5ff0 	ldmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
c0dec4e4:	46e5      	mov	sp, ip
c0dec4e6:	0008      	movs	r0, r1
c0dec4e8:	bf08      	it	eq
c0dec4ea:	2001      	moveq	r0, #1
c0dec4ec:	4770      	bx	lr
c0dec4ee:	bf00      	nop

c0dec4f0 <strcmp>:
c0dec4f0:	f810 2b01 	ldrb.w	r2, [r0], #1
c0dec4f4:	f811 3b01 	ldrb.w	r3, [r1], #1
c0dec4f8:	2a01      	cmp	r2, #1
c0dec4fa:	bf28      	it	cs
c0dec4fc:	429a      	cmpcs	r2, r3
c0dec4fe:	d0f7      	beq.n	c0dec4f0 <strcmp>
c0dec500:	1ad0      	subs	r0, r2, r3
c0dec502:	4770      	bx	lr

c0dec504 <strlen>:
c0dec504:	4603      	mov	r3, r0
c0dec506:	f813 2b01 	ldrb.w	r2, [r3], #1
c0dec50a:	2a00      	cmp	r2, #0
c0dec50c:	d1fb      	bne.n	c0dec506 <strlen+0x2>
c0dec50e:	1a18      	subs	r0, r3, r0
c0dec510:	3801      	subs	r0, #1
c0dec512:	4770      	bx	lr

c0dec514 <strncpy>:
c0dec514:	4603      	mov	r3, r0
c0dec516:	b510      	push	{r4, lr}
c0dec518:	3901      	subs	r1, #1
c0dec51a:	b132      	cbz	r2, c0dec52a <strncpy+0x16>
c0dec51c:	f811 4f01 	ldrb.w	r4, [r1, #1]!
c0dec520:	3a01      	subs	r2, #1
c0dec522:	f803 4b01 	strb.w	r4, [r3], #1
c0dec526:	2c00      	cmp	r4, #0
c0dec528:	d1f7      	bne.n	c0dec51a <strncpy+0x6>
c0dec52a:	2100      	movs	r1, #0
c0dec52c:	441a      	add	r2, r3
c0dec52e:	4293      	cmp	r3, r2
c0dec530:	d100      	bne.n	c0dec534 <strncpy+0x20>
c0dec532:	bd10      	pop	{r4, pc}
c0dec534:	f803 1b01 	strb.w	r1, [r3], #1
c0dec538:	e7f9      	b.n	c0dec52e <strncpy+0x1a>

c0dec53a <C_app_zknox_64px_bitmap>:
c0dec53a:	0040 0040 8922 0002 ffff ffff ffff ffff     @.@."...........
c0dec54a:	ffff ffff 0ed7 f55d a39d 3010 8311 f0ad     ......]....0....
c0dec55a:	030b 0110 0070 4c81 0dec 2005 0001 7031     ....p..L... ..1p
c0dec56a:	0d04 0be9 7231 5011 0a01 99e7 2001 7223     ....1r.P..... #r
c0dec57a:	1102 8140 e47e 1287 4315 2162 0450 e20e     ..@.~....Cb!P...
c0dec58a:	13b8 4065 5263 4031 e106 13ab 1485 0373     ..e@cR1@......s.
c0dec59a:	2142 0750 addf 6513 5364 2142 0b50 96de     B!P....edSB!P...
c0dec5aa:	6027 0474 5243 4021 0d01 9bdc 8015 5325     '`t.CR!@......%S
c0dec5ba:	4304 3152 0640 b6dc 6549 b530 a989 0680     .CR1@...Ie0.....
c0dec5ca:	4312 3142 0140 da0d 010c 8417 c57c c79e     .CB1@.......|...
c0dec5da:	3310 4142 0540 a8da 4b48 8ec9 33a4 4132     .3BA@...HK...32A
c0dec5ea:	0140 c60e cd4e 7691 ccc0 330b 1122 3182     @...N..v...3"..1
c0dec5fa:	0b60 0bc5 0231 9dcc c026 09ce 1302 0422     `...1...&.....".
c0dec60a:	1c0a 728b 0540 0bc5 0130 8bcc c748 c51e     ...r@...0...H...
c0dec61a:	060e 1213 0d04 ad1e a2ed 1440 c10d 030e     ..........@.....
c0dec62a:	0130 88cc c55d 68bc b075 09c4 1302 ce92     0...]..hu.......
c0dec63a:	13a0 ed9a 1090 1a08 6489 0617 0140 cb0c     .........d..@...
c0dec64a:	c515 080d 9d1e d0c6 0dc3 8623 31ed dc8c     ..........#..1..
c0dec65a:	0a15 0c1d 150b 8364 ca2d 0a02 06c5 c20e     ......d.-.......
c0dec66a:	b68e 0ec3 1305 ca88 0931 4d1e 3b6c 319a     ........1..Ml;.1
c0dec67a:	c9b0 0d04 0ec4 c407 040c 08c4 0113 0210     ................
c0dec68a:	0821 7d2e 6c0d 0308 07ca c40d 060e 0cc4     !..}.l..........
c0dec69a:	c405 23ba 705a 0931 2d2e 1d0e 2d4c a39c     ...#Zp1..-..L-..
c0dec6aa:	cad0 0c08 08c5 c30c 0b09 bcc4 4e23 b5d0     ............#N..
c0dec6ba:	3d01 0ce0 b220 d66e ab70 9858 0419 cb0d     .=.. .n.p.X.....
c0dec6ca:	c01a c30e 5a8e 081d c509 060e 8912 1afd     .....Z..........
c0dec6da:	edad 1061 39aa c183 49be 30b7 cc07 7f8c     ..a..9...I.0....
c0dec6ea:	c22e a8ae c79c 220b 3e09 818d 8710 1dc4     .......".>......
c0dec6fa:	c20e 6b87 ce18 5e02 0eca 8ec1 1281 1a06     ...k...^........
c0dec70a:	4189 0610 190c b7c4 b516 ceb0 cf86 8f3e     .A............>.
c0dec71a:	1eef 3ec4 d89f 5120 a810 6ddc bbc4 a19c     ...>.. Q...m....
c0dec72a:	cec0 6f8a 7e7e 8b4e 2062 6c81 0b1d c505     ...o~~N.b .l....
c0dec73a:	8abb d091 01cf 7e0d 5e7e 0c0d 3d2a 6b8c     .......~~^..*=.k
c0dec74a:	0dc5 d039 7f8a 7e7e 2e7e 0a2d dd05 0c01     ..9...~~~.-.....
c0dec75a:	7e7e 0e7e 8c3d dd5d 040b 7e7e 0e7e 8c2d     ~~~.=.]...~~~.-.
c0dec76a:	df7a 0807 7e7e 3d6e 0609 8ee0 7e39 5e7e     z...~~n=....9~~^
c0dec77a:	0a2d e206 398e 7e7e 2d3e 0609 8ee4 7e38     -....9~~>-....8~
c0dec78a:	0e7e 083d e607 76be e0cf 7e0d 0e0d 9e2d     ~.=....v...~..-.
c0dec79a:	90b5 aae9 df29 7d1e 0c1e 0e17 beeb 6b80     ....)..}.......k
c0dec7aa:	0ed0 4ec0 a5ad f03c 72ab 1836 52b7 d039     ...N..<..r6..R9.
c0dec7ba:	1df5 1a0b 0e0d ffff ffff ffff ffff ffff     ................
c0dec7ca:	                                             .

c0dec7cb <C_app_zknox_64px>:
c0dec7cb:	0040 0040 0102 c53a c0de                    @.@...:...

c0dec7d5 <C_Check_Circle_64px_bitmap>:
c0dec7d5:	0040 0040 3321 0002 0231 8b1f 0008 0000     @.@.!3..1.......
c0dec7e5:	0000 0302 55ad 4e39 3103 fd14 6124 4b5f     .....U9N.1..$a_K
c0dec7f5:	8028 a091 2401 b888 4640 2054 4121 3949     (....$..@FT !AI9
c0dec805:	152d 00dc a090 1166 05a2 0171 1710 0a48     -.....f...q...H.
c0dec815:	026a 6017 41ab 8961 2404 9f21 65ef be66     j..`.Aa..$!..ef.
c0dec825:	0e3d c48b 9914 9fb1 fcfd fcfc 8cf3 7ff8     =...............
c0dec835:	f54f 1a60 7460 d8a9 de00 fd04 95cc 681c     O.`.`t.........h
c0dec845:	87cd c9e8 bf14 0185 7952 ae0b 301b 8b40     ........Ry...0@.
c0dec855:	c4b5 9cae 7cb5 f88d e070 ef89 0371 137e     .....|..p...q.~.
c0dec865:	fd5d 4e7a 4f7d d6b4 9e38 8ea5 b8f9 4c79     ].zN}O..8.....yL
c0dec875:	34cd e15b da9e 7c13 18bc 1930 a38b 5b15     .4[....|..0....[
c0dec885:	b94d a901 5a89 34af d0fa fbd4 5d41 b0b9     M....Z.4....A]..
c0dec895:	0ab1 6830 71fb 5315 0056 6e9a fc6c 2fb3     ..0h.q.SV..nl../
c0dec8a5:	24e2 dd75 bf49 012f d486 1057 ac8e 0a5a     .$u.I./...W...Z.
c0dec8b5:	aa32 dc97 5d54 3947 803e c954 7a63 b709     2...T]G9>.T.cz..
c0dec8c5:	815a c734 7fa9 bc41 000b 6a27 db3a e292     Z.4...A...'j:...
c0dec8d5:	12ed 3f6f 8274 64b6 f810 4052 a01d de23     ..o?t..d..R@..#.
c0dec8e5:	2712 6220 73a5 9d0a cf04 db00 e588 5bd8     .' b.s.........[
c0dec8f5:	e08b 0a5d 027c a128 8093 ee56 ab15 0ca4     ..].|.(...V.....
c0dec905:	1953 0781 889d a1eb 493b 0082 11da c517     S.......;I......
c0dec915:	9b8f 4760 f54c 0b95 822e f14b 41ed 360f     ..`GL.....K..A.6
c0dec925:	b820 d215 48a4 c137 3093 c2c8 8139 e70b      ....H7..0..9...
c0dec935:	4e04 105c 30ac d4dc 08a7 9856 acbe 7c5d     .N\..0....V...]|
c0dec945:	5e31 0710 701c 347f 5aff 4fe8 36b3 adc9     1^...p.4.Z.O.6..
c0dec955:	802f c436 7653 d63e 3cfe 2d61 5f3f ba73     /.6.Sv>..<a-?_s.
c0dec965:	df3a acb2 d712 0ff4 1f59 2554 6ec3 5f7b     :.......Y.T%.n{_
c0dec975:	6554 3b01 e340 8e78 cad4 febe e91f 4c92     Te.;@.x........L
c0dec985:	f2b3 e8c9 ce32 92b3 a68c 3457 3971 702e     ....2.....W4q9.p
c0dec995:	b6aa 0f34 d91d e35f f2e1 639e a7d5 fd79     ..4..._....c..y.
c0dec9a5:	ba44 dde8 6369 1aef c3e5 3464 9dd2 272f     D...ic....d4../'
c0dec9b5:	cbbf 1fa7 8df3 b09c 9b03 5328 2325 8d5f     ..........(S%#_.
c0dec9c5:	3ec0 f233 eb15 7359 39c0 5158 f322 2c7d     .>3...Ys.9XQ".},
c0dec9d5:	f7cc 448d cbbe a6c0 e1fb f102 dd51 030f     ...D........Q...
c0dec9e5:	0898 fe6c ec64 ac2b 19ea f170 f7af 2d1b     ..l.d.+...p....-
c0dec9f5:	1fb1 b3c2 2e0d dad0 0cd6 c8c0 fe72 af1f     ............r...
c0deca05:	fc6c 2402 5a14 00c5 0008                     l..$.Z.....

c0deca10 <C_Check_Circle_64px>:
c0deca10:	0040 0040 0102 c7d5 c0de                    @.@.......

c0deca1a <C_Denied_Circle_64px_bitmap>:
c0deca1a:	0040 0040 3021 0002 022e 8b1f 0008 0000     @.@.!0..........
c0deca2a:	0000 0302 55ad 2f4b 4104 2e10 bd6b 479f     .....UK/.A..k..G
c0deca3a:	d80e 4884 ac90 3f8d e260 2244 e8e1 71b8     ...H...?`.D"...q
c0deca4a:	e273 201f ece1 7111 fe25 f100 d607 d9c1     s.. ...q%.......
c0deca5a:	07f2 e63c d64c e363 a6b9 f554 a663 67a7     ..<.L.c...T.c..g
c0deca6a:	9766 1f44 b676 babb beaa eafe 6aeb ffc4     f.D.v........j..
c0deca7a:	5f1b 13fb 4300 c50b f304 a806 5331 b18a     ._...C......1S..
c0deca8a:	1c56 47f0 58ba 0cd5 2a90 6658 642f 6806     V..G.X...*Xf/d.h
c0deca9a:	52b4 08ec a5af c46b fdfb ff0c 0d1f df99     .R....k.........
c0decaaa:	a978 f947 bb78 5b3c ed35 5a39 0d98 47a6     x.G.x.<[5.9Z...G
c0decaba:	ad34 3237 34b8 331f f3f7 6c86 8e00 3632     4.72.4.3...l..26
c0decaca:	e185 09e6 3f8d a17b 07dd bc61 b41f a934     .....?{...a...4.
c0decada:	2b27 7d00 1f36 4157 4fc8 ba80 db1b ddfe     '+.}6.WA.O......
c0decaea:	c7ed 7424 511d 2fbe fa01 bfe5 247c 42bb     ..$t.Q./....|$.B
c0decafa:	9690 2555 e336 49ca 44a8 9e99 a3cd 831a     ..U%6..I.D......
c0decb0a:	e7d6 7bf8 7006 0f2c a96d a005 bf9d 668e     ...{.p,.m......f
c0decb1a:	5162 3ff3 bf2c 008e 01e0 8ab4 abe9 e34e     bQ.?,.........N.
c0decb2a:	32c2 c0aa e712 3ab8 aa46 d8a4 7896 009f     .2.....:F....x..
c0decb3a:	10b6 facb 1974 9385 90e8 df1b c005 8047     ....t.........G.
c0decb4a:	1a12 9eeb c7de bb99 4b38 a82a d662 e770     ........8K*.b.p.
c0decb5a:	6d88 6b88 3b3e 12c2 33b8 16a2 79c4 09fe     .m.k>;...3...y..
c0decb6a:	1802 b8ee aecd 648e 0741 dc30 44a9 9cf5     .......dA.0..D..
c0decb7a:	d3a4 91d4 8ee1 0cb7 804d 7434 1468 91e3     ........M.4th...
c0decb8a:	3209 1ced 7020 bbff 2e3d 2d7e b97c 7c40     .2.. p..=.~-|.@|
c0decb9a:	f9f6 b8ce f9c0 fc6a 2834 9292 6df8 3c46     ......j.4(...mF<
c0decbaa:	56a9 f69f f5da 0b2d 1895 aeeb 9abe 421f     .V....-........B
c0decbba:	a41f 8192 7d78 4b3d 2965 4719 79f5 3328     ....x}=Ke).G.y(3
c0decbca:	ea3b 451e 9df4 0691 b192 cdd5 fa4a 8b5a     ;..E........J.Z.
c0decbda:	65c0 702d b86b bd6a 3762 9f17 151d 49d7     .e-pk.j.b7.....I
c0decbea:	dfba d88a a4bb 90fe 77f5 f7c6 e397 f5df     .........w......
c0decbfa:	9aa7 8dfd a6af b0d5 4257 7442 86ed 1a7d     ........WBBt..}.
c0decc0a:	21d2 b97a 86f0 ee73 91cf 3efe f9a2 8f5f     .!z...s....>.._.
c0decc1a:	77f4 b0d1 7de9 40b8 907c 43ef 462f b61a     .w...}.@|..C/F..
c0decc2a:	d239 13f6 95f6 9909 7f8b df7d c528 369e     9.........}.(..6
c0decc3a:	274f a03c cd95 8029 a5c1 3fc2 d93e 03f8     O'<...)....?>...
c0decc4a:	a770 8485 0800 0000                         p.......

c0decc52 <C_Denied_Circle_64px>:
c0decc52:	0040 0040 0102 ca1a c0de                    @.@.......

c0decc5c <C_Important_Circle_64px_bitmap>:
c0decc5c:	0040 0040 fa21 0001 01f8 8b1f 0008 0000     @.@.!...........
c0decc6c:	0000 0302 55b5 4ecd 40c2 1e10 fea1 cfe3     .....U.N.@......
c0decc7c:	0f51 892a d45e 8904 602f 49e3 1313 7a3c     Q.*.^.../`.I..<z
c0decc8c:	cae4 37cd 1350 a33d 70c6 f8d5 1802 005f     ...7P.=..p...._.
c0decc9c:	9e0f 5f05 1fc0 1ace 4910 c054 b38e b6ed     ..._.....IT.....
c0deccac:	db74 d059 e704 76d0 dbf6 7cee 76fd 2dfa     t.Y....v...|.v.-
c0deccbc:	ef62 99a2 055b d858 6a29 43e0 b190 6159     b...[.X.)j.C..Ya
c0decccc:	96d0 5e09 c518 308e a440 8010 052d 1806     ...^...0@...-...
c0deccdc:	9408 b138 cadf 203c e4be e2e2 4979 3f81     ..8...< ....yI.?
c0deccec:	d0c4 7c94 3ac7 d915 1f9e d24f 56c0 bd3b     ...|.:....O..V;.
c0deccfc:	34a4 abea a650 d97c 5f3f 484c c9b4 c551     .4..P.|.?_LH..Q.
c0decd0c:	9541 9a6e 78d8 3bd9 3ecd f957 d17e 9ad0     A.n..x.;.>W.~...
c0decd1c:	ec9b cc02 f504 6fb8 d92f e800 0c7b dfe2     .......o/...{...
c0decd2c:	de93 c49a 2c6e 77ac 6009 79d6 874a 4baa     ....n,.w.`.yJ..K
c0decd3c:	8606 abb3 26a4 9db7 cac4 a6de ff9a 7d53     .....&........S}
c0decd4c:	e341 7129 01bf b3c8 02dd 1310 d377 84a7     A.)q........w...
c0decd5c:	a612 c04d 1802 71e1 d85a b9e1 e3c2 006f     ..M....qZ.....o.
c0decd6c:	c459 fb3a 2275 6d3e 5582 0a80 538f 09e5     Y.:.u">m.U...S..
c0decd7c:	2551 eba2 38f7 228c f3ee 38ea 0ec2 6e23     Q%...8."...8..#n
c0decd8c:	0b8b c71f 55e2 51d3 8b81 4412 9145 3b71     .....U.Q...DE.q;
c0decd9c:	f769 20b6 159e 4f43 9a82 924d abc7 a042     i.. ..CO..M...B.
c0decdac:	c6ff f1bb 724b e7cd a06e 4521 e9d2 2fd3     ....Kr..n.!E.../
c0decdbc:	d245 3be9 7884 69d5 627f f7dd 2eb7 b2c9     E..;.x.i.b......
c0decdcc:	407f eeca 3992 af1e 9d39 ba05 bc0d 2a70     .@...9..9.....p*
c0decddc:	f29b 623f 19e8 8db2 1c0b 90dc d70b 0d35     ..?b..........5.
c0decdec:	965e ade3 b9a0 ea78 75c8 dd4d 2dff 7d85     ^.....x..uM..-.}
c0decdfc:	f9d6 c243 c99b 4bfb 77fe d4fe dfd5 8948     ..C....K.w....H.
c0dece0c:	61a0 92d3 8a91 afe2 618a 2b5f 8afe 5256     .a.......a_+..VR
c0dece1c:	709d fc2b e439 8bef bfae 841f ddfc 6c36     .p+.9.........6l
c0dece2c:	1f3a 10ee 9d5f 61f3 431a ed86 230f 53d8     :..._..a.C...#.S
c0dece3c:	b8cd 1702 7aff 51be 3389 de17 f4d0 eb73     .....z.Q.3....s.
c0dece4c:	1d68 3e60 e853 91e1 3f8d c10e e439 0800     h.`>S....?..9...
	...

c0dece5e <C_Important_Circle_64px>:
c0dece5e:	0040 0040 0102 cc5c c0de                    @.@...\...

c0dece68 <C_Warning_64px_bitmap>:
c0dece68:	0040 0040 5f21 0001 015d 8b1f 0008 0000     @.@.!_..].......
c0dece78:	0000 0302 d585 4e31 40c3 0510 8dd0 0885     ......1N.@......
c0dece88:	454a 9149 25c2 52b2 08e4 4039 19c4 8272     JEI..%.R..9@..r.
c0dece98:	815c 0384 b880 c441 7205 0a04 e7d2 6908     \.....A..r.....i
c0decea8:	a202 a50b a113 ec1d 5d99 f6b3 1fee fb6f     .........]....o.
c0deceb8:	96c6 febc 4333 4f84 27b9 5ced ebf2 c293     ....3C.O.'.\....
c0decec8:	53bf 2663 cf0a 318c 9d23 5bb1 e866 5176     .Sc&...1#..[f.vQ
c0deced8:	60e1 7d06 3f5d b8fc ce41 24bc cce4 4273     .`.}]?..A..$..sB
c0decee8:	eafe f818 e79b efb4 966a 4b7b 7339 c841     ........j.{K9sA.
c0decef8:	ef99 f908 e431 bfd8 1c5a 7979 f15b 9090     ....1...Z.yy[...
c0decf08:	8733 6891 f33b 1855 96a9 239f f96e 8f25     3..h;.U....#n.%.
c0decf18:	7438 4b8e c9d6 bfeb 6f0b 3809 e0f3 8085     8t.K.....o.8....
c0decf28:	34db 977b c5b0 5dec 46c2 5dc8 90d8 9baf     .4{....].F.]....
c0decf38:	94b8 9fc6 fa1b 4631 36dc 7d8c ba4e 3d17     ......1F.6.}N..=
c0decf48:	bdae e25f c4bc 9f6e eff4 eb93 164b f784     .._...n.....K...
c0decf58:	2a9b fe68 5d4f 3d90 7743 5b05 7de8 70f9     .*h.O].=Cw.[.}.p
c0decf68:	ebf1 4416 ccf9 a1de 00bb a01f 39d3 b4ef     ...D.........9..
c0decf78:	b74f bebf fef5 ed72 141b fba4 787b 2e82     O.....r.....{x..
c0decf88:	f705 e9d8 1833 c93f f4f9 cfa1 9727 0297     ....3.?.....'...
c0decf98:	14bb b04c c14b 7603 89f2 6e43 fa57 f77c     ..L.K..v..CnW.|.
c0decfa8:	db89 fbe8 4cc5 fd95 50b4 93f7 605f 6523     .....L...P.._`#e
c0decfb8:	e63f 73ba c6a0 fb3d f499 5e05 cbcd e43f     ?..s..=....^..?.
c0decfc8:	7b2a 0024 0008                               *{$....

c0decfcf <C_Warning_64px>:
c0decfcf:	0040 0040 0102 ce68 c0de                    @.@...h...

c0decfd9 <C_Back_40px_bitmap>:
c0decfd9:	0028 0028 8c21 0000 008a 8b1f 0008 0000     (.(.!...........
c0decfe9:	0000 0302 d3ed 09cd 20c0 800c d0d1 0e53     ......... ....S.
c0decff9:	a21d 39a3 364a 9570 d26e c46d c143 c7e6     ...9J6p.n.m.C...
c0ded009:	a8d6 73d0 f50f e110 81e3 b010 9794 f843     ...s..........C.
c0ded019:	efb7 c3b6 53b7 4667 28df dcca b621 6196     .....SgF.(..!..a
c0ded029:	2b95 b601 0646 d04a 5b5b fa86 4192 376d     .+..F.J.[[...Am7
c0ded039:	50ab c3da 942a 98d6 6e41 198e e6e4 4299     .P..*...An.....B
c0ded049:	8ec2 2429 99ec 6dc0 6181 0933 c4f8 5561     ..)$...m.a3...aU
c0ded059:	6001 605a 199a 7c43 01fb 02e5 04e6 e43a     .`Z`..C|......:.
c0ded069:	0320 0000                                    ...

c0ded06d <C_Back_40px>:
c0ded06d:	0028 0028 0102 cfd9 c0de                    (.(.......

c0ded077 <C_Check_40px_bitmap>:
c0ded077:	0028 0028 5401 0000 0052 8b1f 0008 0000     (.(..T..R.......
c0ded087:	0000 0302 6063 05c0 4078 1c84 9088 1307     ....c`..x@......
c0ded097:	400d ff82 9000 7f60 2400 3f98 0900 1fc6     .@....`..$.?....
c0ded0a7:	9920 203f 0ea2 d844 57e3 2608 602a b02c      .? ..D..W.&*`,.
c0ded0b7:	5818 ac16 ac0e ac03 1ed7 5e6e 5c0d 0183     .X........n^.\..
c0ded0c7:	0103 0000 8363 77dc 00c8 0000               ....c..w....

c0ded0d3 <C_Check_40px>:
c0ded0d3:	0028 0028 0100 d077 c0de                    (.(...w...

c0ded0dd <C_Chevron_40px_bitmap>:
c0ded0dd:	0028 0028 5c22 0000 ffff ffff ffff ffff     (.(."\..........
c0ded0ed:	1cda 03e4 0310 03e2 0330 03e0 0350 03de     ........0...P...
c0ded0fd:	1820 0320 03dc 0820 08c1 0320 03da 0820      . ... ... ... .
c0ded10d:	08c3 0320 03d8 0820 08c5 0320 03d6 0820     .. ... ... ... .
c0ded11d:	08c7 0320 05d4 0820 08c9 0520 9ed3 8020     .. ... ... ... .
c0ded12d:	98cb e002 0ed4 cd09 0e09 ffff ffff ffff     ................
c0ded13d:	ffff e2ff                                   ....

c0ded141 <C_Chevron_40px>:
c0ded141:	0028 0028 0102 d0dd c0de                    (.(.......

c0ded14b <C_Chevron_Back_40px_bitmap>:
c0ded14b:	0028 0028 7621 0000 0074 8b1f 0008 0000     (.(.!v..t.......
c0ded15b:	0000 0302 d2ed 0dc1 3080 0508 8e50 383d     .........0..P.=8
c0ded16b:	a3a4 41b0 7157 6e93 3863 d498 1042 eb7e     ...AWq.nc8..B.~.
c0ded17b:	4606 340e bfe5 0b84 ffbd aa35 e7e1 2eb2     .F.4......5.....
c0ded18b:	6705 b55c 541f 2473 e9b4 1273 7640 27b0     .g\..Ts$..s.@v.'
c0ded19b:	2794 c807 0711 4c94 3203 73ac b828 21cd     .'.....L.2.s(..!
c0ded1ab:	8732 7313 3338 0b83 b833 8532 532b 62f8     2..s83..3.2.+S.b
c0ded1bb:	9603 1dcf 0dc6 8ef2 7343 0320 0000          ........Cs ...

c0ded1c9 <C_Chevron_Back_40px>:
c0ded1c9:	0028 0028 0102 d14b c0de                    (.(...K...

c0ded1d3 <C_Chevron_Next_40px_bitmap>:
c0ded1d3:	0028 0028 7121 0000 006f 8b1f 0008 0000     (.(.!q..o.......
c0ded1e3:	0000 0302 ceed 0dbb 3080 450c 5751 0a51     .........0.EQWQ.
c0ded1f3:	cc86 ac06 0d90 0918 42a6 1448 c48f 8e44     .........BH...D.
c0ded203:	1b3f 6e20 74f9 1964 58f8 8735 22e9 02da     ?. n.td..X5.."..
c0ded213:	ca23 a581 61e2 f5a5 b074 c031 c6c1 0b00     #....a..t.1.....
c0ded223:	3999 ccc8 c1c2 1c0c 434c 0a61 9b0a 3150     .9......LCa...P1
c0ded233:	c781 1d64 ec2e fe92 bcbe 7707 ddbd ebf8     ..d........w....
c0ded243:	383d be09 209b 0003                          =8... ...

c0ded24c <C_Chevron_Next_40px>:
c0ded24c:	0028 0028 0102 d1d3 c0de                    (.(.......

c0ded256 <C_Close_40px_bitmap>:
c0ded256:	0028 0028 8521 0000 0083 8b1f 0008 0000     (.(.!...........
c0ded266:	0000 0302 fffb c07f bfc0 08f9 cff6 10f7     ................
c0ded276:	11fa 4207 41ac 420f 604f 87e8 fd09 e060     ...B.A.BO`....`.
c0ded286:	3184 0ae0 e01b 70d2 9216 9c2c 5089 6706     .1.....p..,..P.g
c0ded296:	2923 7383 9590 7941 ca28 5ca0 6554 3e60     #).s..Ay(..\Te`>
c0ded2a6:	329a 42b0 6574 8520 cae8 0a40 9431 1561     .2.Bte ...@.1.a.
c0ded2b6:	a2c3 9b17 581d 82dc cdcd fc58 2d86 b00c     .....X....X..-..
c0ded2c6:	1584 30b6 12c5 d8f6 08e2 5c5b 8b62 6c73     ...0......[\b.sl
c0ded2d6:	6369 0040 b400 b40b 2014 0003                ic@...... ...

c0ded2e3 <C_Close_40px>:
c0ded2e3:	0028 0028 0102 d256 c0de                    (.(...V...

c0ded2ed <C_Info_40px_bitmap>:
c0ded2ed:	0028 0028 3121 0000 002f 8b1f 0008 0000     (.(.!1../.......
c0ded2fd:	0000 0302 fffb 147f 0bd0 f030 67ff 0180     ..........0..g..
c0ded30d:	2a7e 7189 5a60 80d3 ec45 cf57 f068 0593     ~*.q`Z..E.W.h...
c0ded31d:	d900 c99e 2019 0003                          ..... ...

c0ded326 <C_Info_40px>:
c0ded326:	0028 0028 0102 d2ed c0de                    (.(.......

c0ded330 <C_Mini_Push_40px_bitmap>:
c0ded330:	0028 0028 ce21 0000 00cc 8b1f 0008 0000     (.(.!...........
c0ded340:	0000 0302 936d 0dcd 30c2 460c 2123 4ea4     ....m....0.F#!.N
c0ded350:	ba83 2b01 5230 6037 4604 0762 b006 5c0f     ...+0R7`.Fb....\
c0ded360:	4240 4936 2f9c f6bf c9a5 b3d3 3913 aaae     @B6I./.......9..
c0ded370:	1085 0eb1 4911 1e0a 7710 829f 6ab0 5a90     .....I...w...j.Z
c0ded380:	9606 3ac2 08a7 a7f5 a2d1 4761 b5e3 d168     ...:......aG..h.
c0ded390:	2f6c 053a a92f f019 a4cc fb95 6b3d cac1     l/:./.......=k..
c0ded3a0:	53f6 6563 0ef5 8ae1 c043 10f6 3220 db41     .Sce....C... 2A.
c0ded3b0:	880e d044 1fee 8588 4d45 6215 5161 8553     ..D.....EM.baQS.
c0ded3c0:	2c68 556b 7634 5a4b cf12 e599 bcbb ab36     h,kU4vKZ......6.
c0ded3d0:	5c7e fdda 61e4 cbec d6c6 b81e ebcc db95     ~\...a..........
c0ded3e0:	af53 def7 791b e96f f9be 9628 eac9 b147     S....yo...(...G.
c0ded3f0:	3926 e6b3 a4ce bb37 8cee ff4f 1fc2 8764     &9....7...O...d.
c0ded400:	9d98 0320 0000                              .. ...

c0ded406 <C_Mini_Push_40px>:
c0ded406:	0028 0028 0102 d330 c0de                    (.(...0...

c0ded410 <C_Privacy_40px_bitmap>:
c0ded410:	0028 0028 ac21 0001 01aa 8b1f 0008 0000     (.(.!...........
c0ded420:	0000 0302 927d 4bbf 50c3 c710 e9af 8b4f     ....}..K.P....O.
c0ded430:	1768 0741 b335 fe88 6609 1d28 2c44 1fe2     h.A.5....f(.D,..
c0ded440:	2ea0 cdd2 2e0a 6082 a45c b4b8 0ff8 4418     .......`\......D
c0ded450:	1c50 b3b4 dd28 60a5 8777 38a2 10e9 b56b     P...(..`w..8..k.
c0ded460:	dac6 bce6 97bb 2da6 378a 25e4 f79f f7de     .......-.7.%....
c0ded470:	77be c439 a3bf ba75 ca9e f75c 26a1 8448     .w9...u...\..&H.
c0ded480:	7a2e 23d8 b178 1f40 5e4e 6ad8 7320 7b7e     .z.#x.@.N^.j s~{
c0ded490:	4cb6 1a70 8cd1 7231 2e21 cf5b 8c06 03a3     .Lp...1r!.[.....
c0ded4a0:	1ac2 a730 dc34 2ab5 4166 beee c941 6e97     ..0.4..*fA..A..n
c0ded4b0:	63a8 6968 74dd d859 d595 fb88 81c8 5288     .chi.tY........R
c0ded4c0:	2181 90c9 a1bb 74a4 16cc 69c7 9e7a 9390     .!.....t...iz...
c0ded4d0:	4e29 1eda d913 c423 f127 53ac 07d2 22a8     )N....#.'..S..."
c0ded4e0:	e1d6 5d0e 461d 4b72 49c0 30eb f88b 880a     ...].FrK.I.0....
c0ded4f0:	10ef 6125 8d93 09ba a8da c904 5c0e 328a     ..%a.........\.2
c0ded500:	283b 1004 218b 5d44 cd39 2bd2 c9dd 15a3     ;(...!D]9..+....
c0ded510:	36c1 084c 01ab 6919 24c1 e237 561b 7d84     .6L....i.$7..V.}
c0ded520:	8488 c031 51cc 7b85 216b 9bf4 c259 fe9a     ..1..Q.{k!..Y...
c0ded530:	92dd 9faa b872 cb24 3521 a8b4 62fe b698     ....r.$.!5...b..
c0ded540:	c2a2 4d4c 6cbc 4560 f7eb 916c 5521 cc5b     ..LM.l`E..l.!U[.
c0ded550:	86e6 8752 3d5c adc2 7bf7 d9a0 a6dc be99     ..R.\=...{......
c0ded560:	2d5e 26b2 a8cb 1e9e 9a13 8b17 3a52 f30c     ^-.&........R:..
c0ded570:	3ef3 a327 ca61 ae09 8fcf 084f 5aca f908     .>'.a.....O..Z..
c0ded580:	35c8 ffbc a35f 5ec4 41ec f3b8 d353 3a1e     .5.._..^.A..S..:
c0ded590:	f604 9120 5418 b993 8329 5e85 db99 f2e5     .. ..T..)..^....
c0ded5a0:	56d5 6002 57d4 75ae b266 f08b 114b a76d     .V.`.W.uf...K.m.
c0ded5b0:	a077 f65f c993 81d4 ff8d 0fc5 af18 4ccb     w._............L
c0ded5c0:	0320 0000                                    ...

c0ded5c4 <C_Privacy_40px>:
c0ded5c4:	0028 0028 0102 d410 c0de                    (.(.......

c0ded5ce <C_QRCode_40px_bitmap>:
c0ded5ce:	0028 0028 9921 0000 0097 8b1f 0008 0000     (.(.!...........
c0ded5de:	0000 0302 fffb da9f 11e0 0803 bd30 00ff     ............0...
c0ded5ee:	fea2 607f 8900 8029 18c5 91f4 20c5 0c42     ...`..)...... B.
c0ded5fe:	28fc fc62 1230 c2c2 f62d a3a7 4307 07ec     .(b.0...-....C..
c0ded60e:	0703 ff84 6101 b11e 1062 c0f3 903c 9073     .....a..b...<.s.
c0ded61e:	25ec 8628 07f0 cc3f 4839 85fe 218b 0b85     .%(...?.9H...!..
c0ded62e:	923f 49b3 d30a 107f f583 ed90 04f8 99a1     ?..I............
c0ded63e:	c230 9b14 d19b 19c2 0c55 061e 3a27 a3ce     0.......U...':..
c0ded64e:	1586 d790 d0c0 aa4f 3618 88f3 0b74 7f16     ......O..6..t...
c0ded65e:	f360 b62f a170 002e 5b00 1eb2 20fb 0003     `./.p....[... ..
	...

c0ded66f <C_QRCode_40px>:
c0ded66f:	0028 0028 0102 d5ce c0de                    (.(.......

c0ded679 <C_Settings_40px_bitmap>:
c0ded679:	0028 0028 9321 0001 0191 8b1f 0008 0000     (.(.!...........
c0ded689:	0000 0302 5275 52b1 40c2 7d10 88c9 9841     ....uR.R.@.}..A.
c0ded699:	8c91 8e56 10ce 5e87 3e46 ec40 93b0 4e8e     ..V....^F>@....N
c0ded6a9:	03fd 4053 850d 1695 9d62 4a42 b03b 8a93     ..S@....b.BJ;...
c0ded6b9:	0bf1 04fc 1c1c 40eb a202 3920 2f77 1738     .......@.. 9w/8.
c0ded6c9:	d818 6f62 e5ef eef2 bbed 6215 8c7d ad4d     ..bo.......b}.M.
c0ded6d9:	8cba 81d5 25ad 8028 6b61 45dd 87ac 8fac     .....%(.ak.E....
c0ded6e9:	daac 764f 4e0b 7751 3303 aed6 761c ac42     ..Ov.NQw.3...vB.
c0ded6f9:	8a01 1084 f9ad 314a 12e5 74f7 2cb5 8c9a     ......J1...t.,..
c0ded709:	300d 976b 5c73 4ae5 8b8e 5734 5c1e 3dc5     .0k.s\.J..4W.\.=
c0ded719:	9e43 1197 0a3a e29b 765c 4780 fd85 1aa0     C...:...\v.G....
c0ded729:	9e59 5cee 6075 4b8a 57ca 26c0 c381 6890     Y..\u`.K.W.&...h
c0ded739:	fac4 2c7b 48e3 1f08 7c17 4593 0557 0a16     ..{,.H...|.EW...
c0ded749:	d037 8459 a74e 601f f108 0385 9e21 2d71     7.Y.N..`....!.q-
c0ded759:	8d44 19ec 2343 7786 f9a6 8a45 b79a 1d50     D...C#.w..E...P.
c0ded769:	84e0 5a08 cc1b 9a7c 0e90 fba5 ef06 716a     ...Z..|.......jq
c0ded779:	76ce 5398 2c73 25fa 6035 a205 fe11 a49b     .v.Ss,.%5`......
c0ded789:	81f4 18f4 b93a c7d3 8b1b a6df 5264 755b     ....:.......dR[u
c0ded799:	59c4 becb af10 c5ac 9ec6 b960 87d4 b385     .Y........`.....
c0ded7a9:	cb32 a1f5 4bf3 b27d ff65 79bd f9b2 b2d0     2....K}.e..y....
c0ded7b9:	3d80 6650 5e86 2f05 11b7 5733 3a79 f45c     .=Pf.^./..3Wy:\.
c0ded7c9:	f25e e8f9 6746 1b24 65be aed0 b864 14ca     ^...Fg$..e..d...
c0ded7d9:	6e9c 96f8 f913 44d4 2df3 8e8b 8d9a 9aa4     .n.....D.-......
c0ded7e9:	c911 53bb 8a72 1b9a b158 f976 a9b8 3db8     ...Sr...X.v....=
c0ded7f9:	3de4 50e9 6624 61a6 6747 dd64 aeec f19c     .=.P$f.aGgd.....
c0ded809:	fc68 4701 f51a 207f 0003                     h..G... ...

c0ded814 <C_Settings_40px>:
c0ded814:	0028 0028 0102 d679 c0de                    (.(...y...

c0ded81e <C_Warning_40px_bitmap>:
c0ded81e:	0028 0028 e721 0000 00e5 8b1f 0008 0000     (.(.!...........
c0ded82e:	0000 0302 d36d 0db1 40c2 850c 47e1 2284     ....m....@...G."
c0ded83e:	283a d511 88d5 1182 0032 8662 904c 0815     :(......2.b.L...
c0ded84e:	3013 2c03 0ec0 9e88 1025 526d 8450 9d10     .0.,....%.mRP...
c0ded85e:	73b9 8842 b87d aafc 675f 911f 4b1c 34c1     .sB.}..._g...K.4
c0ded86e:	0b26 c128 5b44 c08a c0f6 d95a d811 d2e6     &.(.D[....Z.....
c0ded87e:	c0ae a486 81dd 4905 80ab 4939 66ab 4988     .......I..9I.f.I
c0ded88e:	635a be30 7349 11ad c0d3 8c52 240e b5cd     Zc0.Is....R..$..
c0ded89e:	d476 6f9b 6925 2adc 6dad d615 0eb5 c5ed     v..o%i.*.m......
c0ded8ae:	25ad 4cfc b04b b93d b035 db42 20db 942e     .%.LK.=.5.B.. ..
c0ded8be:	43d1 773e e2db a970 2e8d 4ac0 9d1b 4c80     .C>w..p....J...L
c0ded8ce:	e51b ec3f a6cd ce88 c8ca 5f26 bc1c 6d7d     ..?.......&_..}m
c0ded8de:	5db8 a8ee 76e6 cbb5 5dae bcee 576d c1b7     .]...v...]..mW..
c0ded8ee:	caed 5db8 6f9b da37 9fec f49b 81ed ccb9     ...].o7.........
c0ded8fe:	785d fef8 7c2f 1300 b8d8 2006 0003           ]x../|..... ...

c0ded90d <C_Warning_40px>:
c0ded90d:	0028 0028 0102 d81e c0de 7544 6d6d 2079     (.(.......Dummy 
c0ded91d:	0032 6552 6976 7765 7420 6172 736e 6361     2.Review transac
c0ded92d:	6974 6e6f 740a 206f 6573 646e 4220 4c4f     tion.to send BOL
c0ded93d:	4f00 6570 6172 6974 6e6f 7320 6769 656e     .Operation signe
c0ded94d:	0064 6441 7264 7365 2073 6576 6972 6966     d.Address verifi
c0ded95d:	6163 6974 6e6f 630a 6e61 6563 6c6c 6465     cation.cancelled
c0ded96d:	5400 6172 736e 6361 6974 6e6f 4320 6568     .Transaction Che
c0ded97d:	6b63 7520 616e 6176 6c69 6261 656c 4100     ck unavailable.A
c0ded98d:	7070 6f72 6576 5000 6f72 6563 7373 6e69     pprove.Processin
c0ded99d:	0067 6c42 6e69 2d64 6973 6e67 3000 302e     g.Blind-sign.0.0
c0ded9ad:	312e 4800 6c6f 2064 6f74 7320 6769 006e     .1.Hold to sign.
c0ded9bd:	704f 7265 7461 6f69 206e 6572 656a 7463     Operation reject
c0ded9cd:	6465 5200 6a65 6365 0074 6552 656a 7463     ed.Reject.Reject
c0ded9dd:	7420 6172 736e 6361 6974 6e6f 003f 7243      transaction?.Cr
c0ded9ed:	7469 6369 6c61 7420 7268 6165 2074 6564     itical threat de
c0ded9fd:	6574 7463 6465 0a2e 6c42 6e69 2064 6973     tected..Blind si
c0deda0d:	6e67 6e69 2067 6572 7571 7269 6465 002e     gning required..
c0deda1d:	6e55 6469 6e65 6974 6966 6465 7220 7369     Unidentified ris
c0deda2d:	006b 6853 776f 6120 2073 5251 4100 6f6d     k.Show as QR.Amo
c0deda3d:	6e75 0074 6f47 6220 6361 206b 6f74 6f20     unt.Go back to o
c0deda4d:	6570 6172 6974 6e6f 5400 6172 736e 6361     peration.Transac
c0deda5d:	6974 6e6f 4320 6568 6b63 7520 616e 6176     tion Check unava
c0deda6d:	6c69 6261 656c 0a2e 6c42 6e69 2064 6973     ilable..Blind si
c0deda7d:	6e67 6e69 2067 6572 7571 7269 6465 002e     gning required..
c0deda8d:	6441 7264 7365 2073 6576 6972 6966 6465     Address verified
c0deda9d:	5300 6977 6570 7420 206f 6f63 746e 6e69     .Swipe to contin
c0dedaad:	6575 2500 2073 7325 250a 0073 7468 7074     ue.%s %s.%s.http
c0dedabd:	3a73 2f2f 7325 4100 6572 7920 756f 7320     s://%s.Are you s
c0dedacd:	7275 2065 6f74 610a 6c6c 776f 6420 6d75     ure to.allow dum
c0dedadd:	796d 3220 690a 206e 7274 6e61 6173 7463     my 2.in transact
c0dedaed:	6f69 736e 003f 7254 6e61 6173 7463 6f69     ions?.Transactio
c0dedafd:	206e 6973 6e67 6465 4500 534e 6e20 6d61     n signed.ENS nam
c0dedb0d:	7365 6120 6572 7220 7365 6c6f 6576 2064     es are resolved 
c0dedb1d:	7962 4c20 6465 6567 2072 6162 6b63 6e65     by Ledger backen
c0dedb2d:	2e64 5300 6365 7275 7469 2079 6572 6f70     d..Security repo
c0dedb3d:	7472 4400 7665 6c65 706f 7265 2500 0a73     rt.Developer.%s.
c0dedb4d:	7325 2520 0073 6c41 6f6c 2077 7564 6d6d     %s %s.Allow dumm
c0dedb5d:	2079 0a31 6e69 7420 6172 736e 6361 6974     y 1.in transacti
c0dedb6d:	6e6f 0073 6953 6e67 7420 6172 736e 6361     ons.Sign transac
c0dedb7d:	6974 6e6f 740a 206f 6573 646e 4220 4c4f     tion.to send BOL
c0dedb8d:	5900 7365 202c 6b73 7069 2500 2073 6572     .Yes, skip.%s re
c0dedb9d:	6f70 7472 4700 206f 6162 6b63 7420 206f     port.Go back to 
c0dedbad:	7274 6e61 6173 7463 6f69 006e 6953 6e67     transaction.Sign
c0dedbbd:	6d20 7365 6173 6567 4200 6361 206b 6f74      message.Back to
c0dedbcd:	7320 6661 7465 0079 654d 7373 6761 2065      safety.Message 
c0dedbdd:	6973 6e67 6465 4300 6f6c 6573 5300 6769     signed.Close.Sig
c0dedbed:	206e 7274 6e61 6173 7463 6f69 006e 654c     n transaction.Le
c0dedbfd:	6764 7265 5300 6163 206e 6f74 7620 6569     dger.Scan to vie
c0dedc0d:	2077 7566 6c6c 7220 7065 726f 0074 6854     w full report.Th
c0dedc1d:	7369 7420 6172 736e 6361 6974 6e6f 6f20     is transaction o
c0dedc2d:	2072 656d 7373 6761 2065 6163 6e6e 746f     r message cannot
c0dedc3d:	6220 2065 6564 6f63 6564 2064 7566 6c6c      be decoded full
c0dedc4d:	2e79 4920 2066 6f79 2075 6863 6f6f 6573     y. If you choose
c0dedc5d:	7420 206f 6973 6e67 202c 6f79 2075 6f63      to sign, you co
c0dedc6d:	6c75 2064 6562 6120 7475 6f68 6972 697a     uld be authorizi
c0dedc7d:	676e 6d20 6c61 6369 6f69 7375 6120 7463     ng malicious act
c0dedc8d:	6f69 736e 7420 6168 2074 6163 206e 7264     ions that can dr
c0dedc9d:	6961 206e 6f79 7275 7720 6c61 656c 2e74     ain your wallet.
c0dedcad:	0a0a 654c 7261 206e 6f6d 6572 203a 656c     ..Learn more: le
c0dedcbd:	6764 7265 632e 6d6f 652f 0038 6341 6563     dger.com/e8.Acce
c0dedccd:	7470 7420 7268 6165 2074 6e61 2064 6f63     pt threat and co
c0dedcdd:	746e 6e69 6575 4100 6c6c 776f 6420 6d75     ntinue.Allow dum
c0dedced:	796d 3220 690a 206e 7274 6e61 6173 7463     my 2.in transact
c0dedcfd:	6f69 736e 5600 7265 6973 6e6f 4d00 726f     ions.Version.Mor
c0dedd0d:	0065 6854 7369 7420 6172 736e 6361 6974     e.This transacti
c0dedd1d:	6e6f 6320 6e61 6f6e 2074 6562 4320 656c     on cannot be Cle
c0dedd2d:	7261 5320 6769 656e 0064 6559 2c73 7220     ar Signed.Yes, r
c0dedd3d:	6a65 6365 0074 6143 636e 6c65 5400 6968     eject.Cancel.Thi
c0dedd4d:	2073 7274 6e61 6173 7463 6f69 206e 6177     s transaction wa
c0dedd5d:	2073 6373 6e61 656e 2064 7361 6d20 6c61     s scanned as mal
c0dedd6d:	6369 6f69 7375 6220 2079 6557 3362 4320     icious by Web3 C
c0dedd7d:	6568 6b63 2e73 2500 2064 666f 2520 0064     hecks..%d of %d.
c0dedd8d:	6b53 7069 7220 7665 6569 3f77 4200 696c     Skip review?.Bli
c0dedd9d:	646e 7320 6769 696e 676e 7220 7165 6975     nd signing requi
c0deddad:	6572 0064 755b 6b6e 6f6e 6e77 005d 6952     red.[unknown].Ri
c0deddbd:	6b73 6420 7465 6365 6574 0064 6c42 6e69     sk detected.Blin
c0deddcd:	2064 6973 6e67 6e69 2067 6572 7571 7269     d signing requir
c0dedddd:	6465 002e 6e55 6469 6e65 6974 6966 6465     ed..Unidentified
c0dedded:	7420 7268 6165 0074 6854 7369 6120 6363      threat.This acc
c0deddfd:	756f 746e 6c20 6261 6c65 6320 6d6f 7365     ount label comes
c0dede0d:	6620 6f72 206d 6f79 7275 4120 6464 6572      from your Addre
c0dede1d:	7373 4220 6f6f 206b 6e69 4c20 6465 6567     ss Book in Ledge
c0dede2d:	2072 694c 6576 002e 7243 7469 6369 6c61     r Live..Critical
c0dede3d:	7420 7268 6165 0074 6341 6563 7470 7220      threat.Accept r
c0dede4d:	7369 206b 6e61 2064 6f63 746e 6e69 6575     isk and continue
c0dede5d:	5400 6968 2073 7274 6e61 6173 7463 6f69     .This transactio
c0dede6d:	276e 2073 6564 6174 6c69 2073 7261 2065     n's details are 
c0dede7d:	6f6e 2074 7566 6c6c 2079 6576 6972 6966     not fully verifi
c0dede8d:	6261 656c 202e 6649 7920 756f 7320 6769     able. If you sig
c0dede9d:	2c6e 7920 756f 6320 756f 646c 6c20 736f     n, you could los
c0dedead:	2065 6c61 206c 6f79 7275 6120 7373 7465     e all your asset
c0dedebd:	2e73 4700 206f 6162 6b63 7420 206f 656d     s..Go back to me
c0dedecd:	7373 6761 0065 6f50 6574 746e 6169 206c     ssage.Potential 
c0dededd:	6972 6b73 6420 7465 6365 6574 2e64 420a     risk detected..B
c0dedeed:	696c 646e 7320 6769 696e 676e 7220 7165     lind signing req
c0dedefd:	6975 6572 2e64 4d00 444c 4153 4e00 206f     uired..MLDSA.No 
c0dedf0d:	6874 6572 7461 6420 7465 6365 6574 2064     threat detected 
c0dedf1d:	7962 5420 6172 736e 6361 6974 6e6f 4320     by Transaction C
c0dedf2d:	6568 6b63 002e 6c42 6e69 2064 6973 6e67     heck..Blind sign
c0dedf3d:	6e69 2067 6861 6165 0064 654d 7373 6761     ing ahead.Messag
c0dedf4d:	2065 6572 656a 7463 6465 5200 6a65 6365     e rejected.Rejec
c0dedf5d:	2074 706f 7265 7461 6f69 3f6e 3000 3231     t operation?.012
c0dedf6d:	3433 3635 3837 4139 4342 4544 0046 656e     3456789ABCDEF.ne
c0dedf7d:	7774 726f 2e6b 4200 4c4f 2520 2a2e 0073     twork..BOL %.*s.
c0dedf8d:	6441 7264 7365 0073 6649 7920 756f 7227     Address.If you'r
c0dedf9d:	2065 7573 6572 7920 756f 6420 6e6f 7427     e sure you don't
c0dedfad:	6e20 6565 2064 6f74 7220 7665 6569 2077      need to review 
c0dedfbd:	6c61 206c 6966 6c65 7364 202c 6f79 2075     all fields, you 
c0dedfcd:	6163 206e 6b73 7069 7320 7274 6961 6867     can skip straigh
c0dedfdd:	2074 6f74 7320 6769 696e 676e 002e 6649     t to signing..If
c0dedfed:	7920 756f 7227 2065 6f6e 2074 7375 6e69      you're not usin
c0dedffd:	2067 6874 0a65 654c 6764 7265 4c20 7669     g the.Ledger Liv
c0dee00d:	2065 7061 2c70 5420 6172 736e 6361 6974     e app, Transacti
c0dee01d:	6e6f 4320 6568 6b63 6d20 6769 7468 6e20     on Check might n
c0dee02d:	746f 7720 726f 2e6b 4920 2066 6f79 2075     ot work. If you 
c0dee03d:	7261 2065 7375 6e69 2067 654c 6764 7265     are using Ledger
c0dee04d:	4c20 7669 2c65 7220 6a65 6365 2074 6874      Live, reject th
c0dee05d:	2065 7274 6e61 6173 7463 6f69 206e 6e61     e transaction an
c0dee06d:	2064 7274 2079 6761 6961 2e6e 0a0a 6547     d try again...Ge
c0dee07d:	2074 6568 706c 6120 2074 656c 6764 7265     t help at ledger
c0dee08d:	632e 6d6f 652f 3131 5400 6968 2073 7274     .com/e11.This tr
c0dee09d:	6e61 6173 7463 6f69 206e 6177 2073 6373     ansaction was sc
c0dee0ad:	6e61 656e 2064 7361 7220 7369 796b 6220     anned as risky b
c0dee0bd:	2079 6557 3362 4320 6568 6b63 2e73 4400     y Web3 Checks..D
c0dee0cd:	6d75 796d 3120 4900 7520 646e 7265 7473     ummy 1.I underst
c0dee0dd:	6e61 2c64 6320 6e6f 6966 6d72 4e00 206f     and, confirm.No 
c0dee0ed:	6874 6572 7461 6420 7465 6365 6574 0064     threat detected.
c0dee0fd:	7254 6e61 6173 7463 6f69 206e 6572 656a     Transaction reje
c0dee10d:	7463 6465 4700 206f 6162 6b63 7420 206f     cted.Go back to 
c0dee11d:	6572 6976 7765 4300 6972 6974 6163 206c     review.Critical 
c0dee12d:	6874 6572 7461 6420 7465 6365 6574 2e64     threat detected.
c0dee13d:	5300 6769 206e 706f 7265 7461 6f69 006e     .Sign operation.
c0dee14d:	6544 6574 7463 6465 6220 2079 7325 0000     Detected by %s..
c0dee15d:	6b53 7069 5000 746f 6e65 6974 6c61 7220     Skip.Potential r
c0dee16d:	7369 206b 6564 6574 7463 6465 002e 6f4e     isk detected..No
c0dee17d:	7420 7268 6165 2074 6564 6574 7463 6465      threat detected
c0dee18d:	6220 2079 7254 6e61 6173 7463 6f69 206e      by Transaction 
c0dee19d:	6843 6365 206b 7562 2074 6c62 6e69 2064     Check but blind 
c0dee1ad:	6973 6e67 6e69 2067 6572 7571 7269 6465     signing required
c0dee1bd:	002e 6f50 6574 746e 6169 206c 6972 6b73     ..Potential risk
c0dee1cd:	5600 7265 6669 2079 4f42 204c 6461 7264     .Verify BOL addr
c0dee1dd:	7365 0073 6f43 746e 6e69 6575 6120 796e     ess.Continue any
c0dee1ed:	6177 0079 7551 7469 6120 7070 5300 6977     way.Quit app.Swi
c0dee1fd:	6570 7420 206f 6572 6976 7765 5400 6968     pe to review.Thi
c0dee20d:	2073 7061 2070 6e65 6261 656c 2073 6973     s app enables si
c0dee21d:	6e67 6e69 0a67 7274 6e61 6173 7463 6f69     gning.transactio
c0dee22d:	736e 6f20 206e 6874 0065 7254 6e61 6173     ns on the.Transa
c0dee23d:	7463 6f69 206e 6843 6365 206b 6964 6e64     ction Check didn
c0dee24d:	7427 6620 6e69 2064 6e61 2079 6874 6572     't find any thre
c0dee25d:	7461 202c 7562 2074 6c61 6177 7379 7220     at, but always r
c0dee26d:	7665 6569 2077 7274 6e61 6173 7463 6f69     eview transactio
c0dee27d:	206e 6564 6174 6c69 2073 6163 6572 7566     n details carefu
c0dee28d:	6c6c 2e79 4300 6e6f 6966 6d72 5200 6a65     lly..Confirm.Rej
c0dee29d:	6365 2074 656d 7373 6761 3f65                ect message?.

c0dee2aa <handler_cmd_verify_dilithium.sig>:
c0dee2aa:	7c23 887b 7320 2c3d 53f3 f845 51a8 6099     #|{. s=,.SE..Q.`
c0dee2ba:	6761 7055 42ce 3e92 cde2 7e43 b441 b3a9     agUp.B.>..C~A...
c0dee2ca:	4891 711f e9ec b6e0 584c 734a 0d71 688d     .H.q....LXJsq..h
c0dee2da:	938a c00a 02bf f5ab 6e7c 0947 24e7 e4a9     ........|nG..$..
c0dee2ea:	8c17 9062 bc18 730b 7ab3 7d08 e7d3 8dea     ..b....s.z.}....
c0dee2fa:	5ba6 4511 febc 1aed 127c 6023 af7e ef0a     .[.E....|.#`~...
c0dee30a:	ab04 602b 74d4 9460 625c 4f1a 5693 0b13     ..+`.t`.\b.O.V..
c0dee31a:	5ecb f094 710c 1c0d 99fe 5ec0 cfa0 079e     .^...q.....^....
c0dee32a:	5779 367f 5671 1603 24bf 9cec 57f2 132b     yW.6qV...$...W+.
c0dee33a:	a5e9 5f0d cabc dc4d 81e4 40f7 1ddb 207e     ..._..M....@..~ 
c0dee34a:	6802 9645 d629 b56e b5a0 3a60 46d6 4a8a     .hE.).n...`:.F.J
c0dee35a:	4904 848d 62df 39ee 6f4d a3c5 b1a7 9def     .I...b.9Mo......
c0dee36a:	cee0 88be 8e16 6f5d 1e77 1efc 15a3 8be7     ......]ow.......
c0dee37a:	cb83 0e2c 8ff8 7e16 70e1 fddf 9adb a5ca     ..,....~.p......
c0dee38a:	38df f10a 03f8 7453 6a6b 3055 fdc9 45e8     .8....StkjU0...E
c0dee39a:	ec8e b499 dc78 67c6 3632 77b2 1cc4 9ede     ....x..g26.w....
c0dee3aa:	58ba 986b 1408 cf6c 6fae bed8 d0a1 4f65     .Xk...l..o....eO
c0dee3ba:	ca65 58c7 b73a 0705 b111 22a3 dad8 6a6c     e..X:......"..lj
c0dee3ca:	16ad 8a60 5390 55a6 0d58 0166 c96f face     ..`..S.UX.f.o...
c0dee3da:	7fa1 fee0 08d5 bd0d aa4d 9296 67f9 2494     ........M....g.$
c0dee3ea:	283a 6713 d57a e142 64e1 a9ef 1b34 fdd0     :(.gz.B..d..4...
c0dee3fa:	95ba 1b6a 594b 1a4f fb70 143c d1ae 7b21     ..j.KYO.p.<...!{
c0dee40a:	1d86 74cb 569a 81b2 5d20 f57d 72d4 8fa0     ...t.V.. ]}..r..
c0dee41a:	76b3 5595 dd24 01a1 cc7b e88b 6857 1d19     .v.U$...{...Wh..
c0dee42a:	180e 0f57 f2a8 bd63 2a59 538d cf58 6a7f     ..W...c.Y*.SX..j
c0dee43a:	8ec2 660c 7647 f5ac 681b f29c 66e9 cb03     ...fGv...h...f..
c0dee44a:	e17d 7849 56cc 08f0 a219 b517 5eae 083c     }.Ix.V.......^<.
c0dee45a:	483c 5a7f c023 3979 7c73 d69e a5b2 041e     <H.Z#.y9s|......
c0dee46a:	9df3 69dc 56da 889b 4f05 47c6 0969 5680     ...i.V...O.Gi..V
c0dee47a:	35d8 7539 0c9d 87c4 11a7 5b12 3df7 f6e1     .59u.......[.=..
c0dee48a:	1667 f595 3663 5345 6c4e d3b2 6474 3c5c     g...c6ESNl..td\<
c0dee49a:	d39f 539c c447 2fb8 a4b1 fb52 13b6 3c7f     ...SG../..R....<
c0dee4aa:	0e47 fcb1 4072 c2a5 81a2 dda1 6745 0708     G...r@......Eg..
c0dee4ba:	2b55 0dcc 0a16 7567 dfb6 bceb 5068 b70e     U+....gu....hP..
c0dee4ca:	1e6e db96 a01c 14f3 c913 876f 4a35 07b7     n.........o.5J..
c0dee4da:	771c c986 7de6 640d 2876 d62b af76 fe23     .w...}.dv(+.v.#.
c0dee4ea:	71eb b727 4d86 a7ac 992f 854a 10bd f6f1     .q'..M../.J.....
c0dee4fa:	a16e 0824 f982 28b6 f195 0a9c d1aa 35cf     n.$....(.......5
c0dee50a:	a8cd 311b 9319 4d19 7397 d937 07a1 a728     ...1...M.s7...(.
c0dee51a:	d8f3 8d2c e37f d75c 7d04 3c23 fe8e 9b1d     ..,...\..}#<....
c0dee52a:	b266 8c82 589b c22d 60e4 8356 e6ac 76be     f....X-..`V....v
c0dee53a:	35ba 6d1b 1d7a 3ab2 8581 174d 60e9 7d1e     .5.mz..:..M..`.}
c0dee54a:	9bc6 aeea 2664 30ef 0073 8d50 4b20 3043     ....d&.0s.P. KC0
c0dee55a:	e026 4d53 f0d0 3b12 2506 2425 9f76 862f     &.SM...;.%%$v./.
c0dee56a:	1c77 f58c 82ee b3f0 01b3 2808 00a3 8857     w..........(..W.
c0dee57a:	af71 609b f331 4243 2dcb a45e 3c09 b650     q..`1.CB.-^..<P.
c0dee58a:	b121 4802 a3d0 1c2c 68d5 a54c 5f0b 8698     !..H..,..hL.._..
c0dee59a:	dfe2 ec6d 21a3 d53b 79cd 3bd6 c85d 6b26     ..m..!;..y.;].&k
c0dee5aa:	4deb be80 d8ee 9e2c 01e8 35ed a9c6 99f6     .M....,....5....
c0dee5ba:	e847 e706 1791 5b3b 3e88 1920 7325 5ee8     G.....;[.> .%s.^
c0dee5ca:	0370 9cf9 b45a e717 032f 3e56 3bb9 3f16     p...Z.../.V>.;.?
c0dee5da:	234c 6700 8c5e b91a 0cf8 2cf6 b188 6f87     L#.g^......,...o
c0dee5ea:	bdd0 5842 e0e0 da83 2e71 1f34 cebb 37ef     ..BX....q.4....7
c0dee5fa:	9ed5 0f09 ca6e b30c e6e8 feb7 7f1c c335     ....n.........5.
c0dee60a:	dba9 8c95 73d2 c5fc b281 e385 3c0e 7135     .....s.......<5q
c0dee61a:	014f edd2 06a3 e6a6 966d d409 88ae 8b24     O.......m.....$.
c0dee62a:	6af7 1a99 8bcb 3283 aa55 cbaf 4927 008d     .j.....2U...'I..
c0dee63a:	ff9e a50a 4e26 7418 7eb1 46b6 cedf 0747     ....&N.t.~.F..G.
c0dee64a:	bfe8 46b9 bfba f7a4 feaf 8c38 5606 dcb9     ...F......8..V..
c0dee65a:	8b4a 67bc 640e 26d4 db76 3c5b 17d0 6dce     J..g.d.&v.[<...m
c0dee66a:	e252 7d54 7443 665e 9bed a21c 8522 5494     R.T}Ct^f...."..T
c0dee67a:	4c6b 632c 526f de4e 5dc6 de9a a960 3bfd     kL,coRN..]..`..;
c0dee68a:	8625 16af da9a 5764 854d 4c59 acba 385f     %.....dWM.YL.._8
c0dee69a:	d327 31c4 517e 2c72 7f49 dc09 4baa 4f7c     '..1~Qr,I....K|O
c0dee6aa:	bd03 ef4f a83b d347 258d cc2f d7ec 07e2     ..O.;.G..%/.....
c0dee6ba:	0f83 d6e4 3307 95b4 b527 9ed2 d271 36b7     .....3..'...q..6
c0dee6ca:	7da9 349d 5f47 81b0 bcd0 1088 7f50 2a67     .}.4G_......P.g*
c0dee6da:	32e0 bc32 a332 713c 3f1a 8212 e16f 1f80     .22.2.<q.?..o...
c0dee6ea:	9640 6120 d3e3 ebfd 6833 1ee9 89ab da2c     @. a....3h....,.
c0dee6fa:	8fc1 060e 31a4 672e 45f4 8d57 afbe f554     .....1.g.EW...T.
c0dee70a:	cbc3 aedb b20a 84dd 5a52 2532 373b d820     ........RZ2%;7 .
c0dee71a:	9b3c 503e f0ec 4c55 d189 d35b b052 6b63     <.>P..UL..[.R.ck
c0dee72a:	b740 389d 5cfc 5eca 6c69 f01f 2fcd 3409     @..8.\.^il.../.4
c0dee73a:	3efb dcaa 1bcc 5f6d 55ac b644 5cfe 0a6e     .>....m_.UD..\n.
c0dee74a:	7c31 cf4f 2bff 701f 8b71 4e7e f37c 3bdb     1|O..+.pq.~N|..;
c0dee75a:	c0f1 0302 f51e 040c df9b 3bfc 3578 0b8e     ...........;x5..
c0dee76a:	0ee2 7eb5 1bd4 04ae d0cd 9190 efaf 57a4     ...~...........W
c0dee77a:	aea8 33bb 3776 e00e 7f4a d448 b744 17f1     ...3v7..J.H.D...
c0dee78a:	da0e 8eb6 970b 8f0e 85c2 7609 6c53 bbe3     ...........vSl..
c0dee79a:	5814 f06a ae6b 17ac 7812 e9a5 e049 f70a     .Xj.k....x..I...
c0dee7aa:	b0cd b8d4 2441 cc4c 79cc f37f 41fd 0787     ....A$L..y...A..
c0dee7ba:	4c7d 339d 3c87 0bab e6f6 5990 901b f821     }L.3.<.....Y..!.
c0dee7ca:	520c 74d4 0594 c11a 75ff 4b55 196b 9007     .R.t.....uUKk...
c0dee7da:	c53d ec30 426b 25d0 23f7 d4d7 39e5 2e22     =.0.kB.%.#...9".
c0dee7ea:	3e68 5347 4125 5ff2 b014 07c0 93b0 ccb7     h>GS%A._........
c0dee7fa:	c0bf 2e17 e578 5143 637f 4921 42d8 1a82     ....x.CQ.c!I.B..
c0dee80a:	412b 0d4d aab9 39c1 5e8b c299 ef69 304e     +AM....9.^..i.N0
c0dee81a:	133e f973 dfbc 1182 5cb5 ec65 f919 043a     >.s......\e...:.
c0dee82a:	a722 8c14 d4ab 11c3 1af1 ef49 57c7 4d53     ".........I..WSM
c0dee83a:	ca00 c8e3 b84c e949 1975 4531 8953 f817     ....L.I.u.1ES...
c0dee84a:	2512 96cc 7b45 a2c1 8fab 2aa7 85fa dc63     .%..E{.....*..c.
c0dee85a:	4731 ff66 9ad1 db10 da92 9abf 5606 6706     1Gf..........V.g
c0dee86a:	d328 f584 2298 a99f 904e 8a6b 2232 dfb0     (...."..N.k.2"..
c0dee87a:	64e1 d9af 16c1 1cf3 5e31 3fe5 0bfb 580d     .d......1^.?...X
c0dee88a:	e02e faab 59d2 b4f1 5c09 a300 6747 d43f     .....Y...\..Gg?.
c0dee89a:	7ee1 d8a7 74f9 f2db 90ed 1c31 67b1 1ad6     .~...t....1..g..
c0dee8aa:	eaeb 0b7b a317 5b4f 1f72 afec bccf ea3f     ..{...O[r.....?.
c0dee8ba:	09c7 811b 1f85 5b8a 1a05 8edd 4a72 3350     .......[....rJP3
c0dee8ca:	a586 703b 06d1 6ad8 8199 573d f79e 065a     ..;p...j..=W..Z.
c0dee8da:	f75c c10c 9dab c380 019a c5d3 6094 ef49     \............`I.
c0dee8ea:	8ded 384e 5c3b 58a6 a927 e0ce ba8c 2a79     ..N8;\.X'.....y*
c0dee8fa:	3390 f747 7a54 7464 8e5f d717 0d1a d740     .3G.Tzdt_.....@.
c0dee90a:	151d 4b48 689a c814 3062 05aa 9e53 7c90     ..HK.h..b0..S..|
c0dee91a:	dadd fb5e 6231 56c3 58f3 bc29 a232 c88b     ..^.1b.V.X).2...
c0dee92a:	c90e 4e45 fe5b 4ac2 d76d 7546 b9e3 6413     ..EN[..Jm.Fu...d
c0dee93a:	3d7f 6a17 7367 a0c1 0ee4 17dd d1ec ee3a     .=.jgs........:.
c0dee94a:	9334 0b71 5411 55f8 59f2 621e 70cc c673     4.q..T.U.Y.b.ps.
c0dee95a:	bb08 77aa 4e10 498d b693 f87c 651f 89af     ...w.N.I..|..e..
c0dee96a:	c9c8 691d 755f da60 8aa6 41d1 cb60 f47d     ...i_u`....A`.}.
c0dee97a:	a6e7 181b 2560 2053 b8db 6713 f16d 5c28     ....`%S ...gm.(\
c0dee98a:	5a01 99ec 7b4d cec0 7529 1614 1eb3 5bd1     .Z..M{..)u.....[
c0dee99a:	1769 6829 aadd 5651 b892 bcfe 4ecb 9832     i.)h..QV.....N2.
c0dee9aa:	bfe8 9c16 b920 9065 803b 6ff2 a620 bda3     .... .e.;..o ...
c0dee9ba:	ac5f bcd1 c638 17c8 3be2 51f3 ff87 f975     _...8....;.Q..u.
c0dee9ca:	ae82 d69e 435a 19f6 619b 84ae 3e68 ef1b     ....ZC...a..h>..
c0dee9da:	9ccf 7801 eab8 9028 6af9 086e 3dd3 c344     ...x..(..jn..=D.
c0dee9ea:	50ce ccd9 1cbd 96df 6bdf 5e2f 1c8f b06c     .P.......k/^..l.
c0dee9fa:	0043 f6f7 83d4 8310 ae90 eda8 b031 327b     C...........1.{2
c0deea0a:	7cc8 2a54 75b4 6d94 5e52 c124 2d6b fb0a     .|T*.u.mR^$.k-..
c0deea1a:	6886 477e e7cc b5ab fcb7 d641 95a9 593a     .h~G......A...:Y
c0deea2a:	b2a8 d021 b757 8493 fa5c 14b4 6b72 5337     ..!.W...\...rk7S
c0deea3a:	7cd8 0202 fb53 7293 6322 eece a693 cf6a     .|..S..r"c....j.
c0deea4a:	3c16 eb86 d67b 3621 0ef7 14c4 56b5 6228     .<..{.!6.....V(b
c0deea5a:	20f1 ee2d feb9 79af 4181 e26b 9ca0 7c0e     . -....y.Ak....|
c0deea6a:	181f 95ee 4b31 d054 7b49 29ac d986 9e0e     ....1KT.I{.)....
c0deea7a:	99d3 2002 6ae9 62e1 112e eef2 c191 61b1     ... .j.b.......a
c0deea8a:	e728 4a38 fa87 67bc c731 b0b0 b70b fd07     (.8J...g1.......
c0deea9a:	be1a 9203 5ec9 434c 6054 7db4 9921 9b82     .....^LCT`.}!...
c0deeaaa:	6b07 f64e 1ab1 28d3 ca25 57d8 a694 ee74     .kN....(%..W..t.
c0deeaba:	d6fd 3d17 39ca bfdc 7c39 951b 3831 720a     ...=.9..9|..18.r
c0deeaca:	42d1 d4b7 5d00 4f88 d5cb 1192 7882 fc20     .B...].O.....x .
c0deeada:	2b5b 05c6 c7e5 c317 121e d14c 71f5 d480     [+........L..q..
c0deeaea:	59ba 3388 97f0 6f05 9b80 2171 be4f 5fe2     .Y.3...o..q!O.._
c0deeafa:	e77f 4ef1 f83d 6bcb 6cbf 3d3f 28e8 f785     ...N=..k.l?=.(..
c0deeb0a:	fd1b 4e87 7a6b 1dd1 21b7 d70f 0c3c aacb     ...Nkz...!..<...
c0deeb1a:	f060 a808 596a 86a9 0c0c 1685 da72 b017     `...jY......r...
c0deeb2a:	d377 7759 2cc5 5bf3 6df0 0f45 c03e 9761     w.Yw.,.[.mE.>.a.
c0deeb3a:	627f 2473 5ac5 a3ad c661 b3ab 77de 28e8     .bs$.Z..a....w.(
c0deeb4a:	3aa6 6def 7cc3 0cdf 3baf c398 09a4 cde3     .:.m.|...;......
c0deeb5a:	d2bd d0ed 4fdc 1aeb de6e f78d 2c25 58b6     .....O..n...%,.X
c0deeb6a:	3f41 7222 4281 4d30 027d 6eb0 8b43 8110     A?"r.B0M}..nC...
c0deeb7a:	774f a431 e789 6b9b 6b8a ca0f 636b 9afe     Ow1....k.k..kc..
c0deeb8a:	ff61 9429 4b70 f9df e118 6aae df99 d307     a.).pK.....j....
c0deeb9a:	8ae1 6821 4690 9753 edb6 f4a5 d27a 16f2     ..!h.FS.....z...
c0deebaa:	7581 b844 0c84 f16a 4d70 719a 2ca0 b673     .uD...j.pM.q.,s.
c0deebba:	9fa2 fbb6 7817 977d 98a8 9047 47a3 0536     .....x}...G..G6.
c0deebca:	0706 3d09 553f 9b7d afa5 ceb8 d4d3 e1de     ...=?U}.........
c0deebda:	eee8 f8f1 01fc 4717 554f 968c b4b2 d6c2     .......GOU......
c0deebea:	f8d9 9143 aa98 cac0 d3d2 edea 1a0d 3d24     ..C...........$=
c0deebfa:	4544 8664 dccf e6e4 00f1 0000 0000 0000     DEd.............
	...
c0deec1a:	2215 392c 1cd8 8d4d 4f73 fbcb deea 3f3d     .",9..M.sO....=?
c0deec2a:	038a aa9f 2c2a 5799 35e8 55ad 2eb2 bf75     ....*,.W.5.U..u.
c0deec3a:	bb57 6a55                                    W.Uj.

c0deec3f <handler_cmd_verify_dilithium.pk>:
c0deec3f:	7bdc a2c9 b6e0 66dc 3a82 fbe4 97de 0c1c     .{.....f.:......
c0deec4f:	46fc d9f9 bf6b ebbe 47b3 e00a a0a5 9f13     .F..k....G......
c0deec5f:	6add e56c 76bc 4fe9 9eaa 5092 d4ab e0ce     .jl..v.O...P....
c0deec6f:	f12c 46ee e9a8 e19c 732d 7895 a71f 9051     ,..F....-s.x..Q.
c0deec7f:	2721 a33d 5536 7219 fb4e 79e2 d6ad 5fc3     !'=.6U.rN..y..._
c0deec8f:	c992 2bd4 2803 f132 29bf beeb 3ecd 7ac8     ...+.(2..)...>.z
c0deec9f:	f33a 33da 11c6 f3f7 a35f ca5a 74b1 4f02     :..3...._.Z..t.O
c0deecaf:	8911 e279 f23b 06fe 6992 eca2 fb45 b9c1     ..y.;....i..E...
c0deecbf:	fbc1 1f0e 4805 6a6a 3e83 8ab4 29dc 6460     .....Hjj.>...)`d
c0deeccf:	9a1d ebf6 738b b181 55ec 89d8 6bf2 4d08     .....s...U...k.M
c0deecdf:	a1df edc9 969b 342d 9426 dece 8283 0953     ......-4&.....S.
c0deecef:	dbd9 d66b 75ba 1382 3425 1e86 a044 8843     ..k..u..%4..D.C.
c0deecff:	94a6 2424 7611 341d c0e7 d285 b782 c623     ..$$.v.4......#.
c0deed0f:	4859 aca2 4d76 0297 8ebd fed7 3199 d8d7     YH..vM.......1..
c0deed1f:	4a70 e639 8850 f344 48f8 c343 5905 e64f     pJ9.P.D..HC..YO.
c0deed2f:	40e5 084e 8ef1 39d0 65ac cb63 34aa cab0     .@N....9.ec..4..
c0deed3f:	3238 9902 25d6 c06e 8df7 1f42 8108 d459     82...%n...B...Y.
c0deed4f:	c49d cb39 39c5 58a5 a384 4eeb 9cfc 90f1     ..9..9.X...N....
c0deed5f:	2fb4 3471 cb41 0097 4542 14d4 a337 7b9b     ./q4A...BE..7..{
c0deed6f:	fc77 2f60 fdbb 9a61 3642 1437 65b2 3c17     w.`/..a.B67..e.<
c0deed7f:	68ae 8afd 3c1b bda2 ae30 c560 563e 5704     .h...<..0.`.>V.W
c0deed8f:	4a7a 1f3b 0615 97e6 74c3 db32 83d8 3a55     zJ;......t2...U:
c0deed9f:	8dac 2a38 253d f50c 9eb2 1b4d cbe2 53cd     ..8*=%....M....S
c0deedaf:	f01f 7ee0 c189 dbf7 d4c8 9a52 beee b555     ...~......R...U.
c0deedbf:	4dce 1402 debf 9ec6 0b08 efd3 cc36 a5a6     .M..........6...
c0deedcf:	3349 eff1 372f 7c86 380d 58fd b865 2979     I3../7.|.8.Xe.y)
c0deeddf:	5811 c708 59e2 5854 93e9 ccba 5a6c 9f3b     .X...YTX....lZ;.
c0deedef:	2550 1e00 419b 7744 bf08 a0ba 2e46 63fa     P%...ADw....F..c
c0deedff:	6c87 f742 9069 438b 542f 5085 398a 2432     .lB.i..C/T.P.92$
c0deee0f:	0596 d751 ad7e f4fa 1c41 49bc fffd f246     ..Q.~...A..I..F.
c0deee1f:	55f1 d6dd 30ec 7986 b705 8809 a08c 0ff3     .U...0.y........
c0deee2f:	5f93 d7b8 80f4 fc3c 5f7a 9077 18ca 991d     ._....<.z_w.....
c0deee3f:	21ca 62f2 691d c6a5 9cd4 b476 9d96 27a6     .!.b.i....v....'
c0deee4f:	a340 4778 3203 09b3 ab47 cc31 9bdb c7a0     @.xG.2..G.1.....
c0deee5f:	25b6 9e87 4bec 1fd8 0002 23ba 4a50 c37d     .%...K.....#PJ}.
c0deee6f:	18b1 2abc 14b1 f15d f33a ccc8 f539 8777     ...*..].:...9.w.
c0deee7f:	843b 1b91 853d bffb b14c 4d9e b136 930a     ;...=...L..M6...
c0deee8f:	eb8e b578 dc99 6186 d65f c6ce 7beb 7a8f     ..x....a_....{.z
c0deee9f:	5ffa 6b6d 9ee1 16a8 d330 cf6c f4b2 de87     ._mk....0.l.....
c0deeeaf:	d050 46cf 8dda e33f 2851 0412 0e3c f23e     P..F..?.Q(..<.>.
c0deeebf:	23d7 b01f a3b0 0f5a 83b2 30be 24a1 8077     .#....Z....0.$w.
c0deeecf:	0af3 29e0 8b4e 586f 3897 db3e 5589 f595     ...)N.oX.8>..U..
c0deeedf:	5277 f54d 9345 f9cd b427 7696 ee16 1339     wRM.E...'..v..9.
c0deeeef:	d6e4 9bb2 bd0d 337c a4a2 4e5e b1f1 4e95     ......|3..^N...N
c0deeeff:	d9a5 e31c fc7e 0213 cee7 a902 9573 5d56     ....~.......s.V]
c0deef0f:	a5a2 d3c5 b0fd 76d8 e984 c0b1 07ad 33ec     .......v.......3
c0deef1f:	2ddf d5fa e228 09ea d266 7da4 eed5 e788     .-..(...f..}....
c0deef2f:	657d 0d3c 4f00 01ab f065 7c75 a44d f30a     }e<..O..e.u|M...
c0deef3f:	e727 2519 c736 4799 0aa8 7a82 10a2 ac7d     '..%6..G...z..}.
c0deef4f:	e3fa bfde fac8 d6d3 80e0 d976 c538 a210     ..........v.8...
c0deef5f:	bd76 72f6 1f1a 7c08 69b1 5051 ad28 e25c     v..r...|.iQP(.\.
c0deef6f:	107a ab47 28d9 9309 a64c 893b 713f a3f9     z.G..(..L.;.?q..
c0deef7f:	994a fdc0 3130 470c aae9 3937 0a4d 3bb7     J...01.G..79M..;
c0deef8f:	4d25 a63c 9c9d 4955 47c9 ae9a 2624 c54a     %M<...UI.G..$&J.
c0deef9f:	64ea fdd3 1c82 6239 77ec 09e7 d3f9 c70b     .d....9b.w......
c0deefaf:	5ab6 e452 168c 06e8 5503 ac8c 81a1 1114     .ZR......U......
c0deefbf:	15c3 1f5d 9f94 cfc9 a99a 5a38 9971 9be9     ..].......8Zq...
c0deefcf:	7ae7 fa66 eed7 12d9 de58 b255 c8c4 9a3f     .zf.....X.U...?.
c0deefdf:	0a05 bede f0a5 5897 0df4 4aac 391c e84e     .......X...J.9N.
c0deefef:	87d6 9187 d250 2664 5a89 93b1 148e 11ae     ....P.d&.Z......
c0deefff:	76b3 4c25 fc91 3061 6943 f896 43ed 27bd     .v%L..a0Ci...C.'
c0def00f:	20be 90ec 1167 111c c96e c24c 6cb0 1ac9     . ..g...n.L..l..
c0def01f:	c513 0bd1 7ebd eaec 9247 7bf1 772b 1e63     .....~..G..{+wc.
c0def02f:	45f1 fbe9 a841 aa3e c211 2ab7 fb48 fd90     .E..A.>....*H...
c0def03f:	88bd 4c64 df4e b28a ce0d 1831 4b36 6a27     ..dLN.....1.6K'j
c0def04f:	23c1 367b 92c8 346e ab6a 115a a01a 34bf     .#{6..n4j.Z....4
c0def05f:	511c 7b8b 9eff bb9d cb8b 2847 1b60 6037     .Q.{......G(`.7`
c0def06f:	3e66 6567 3103 fbe6 ac54 fc82 4c41 ddb8     f>ge.1..T...AL..
c0def07f:	16fc 250a 1e31 27c5 e42d 1762 f8fe 92b9     ...%1..'-.b.....
c0def08f:	89ff 4f75 e3be f251 b91b 6c0b 0797 518b     ..uO..Q....l...Q
c0def09f:	980c 5033 1268 c866 d1fe 58f0 513c e751     ..3Ph.f....X<QQ.
c0def0af:	feb8 723b 3192 9996 7c68 b6c6 fd41 68bd     ..;r.1..h|..A..h
c0def0bf:	2894 3b54 fac0 ac1f 09c1 65de 27b6 c284     .(T;.......e.'..
c0def0cf:	85d9 15ab 7dd7 f13a f62a 3ed0 188d a559     .....}:.*..>..Y.
c0def0df:	6853 8485 5ed7 73f6 dea1 0974 e13e c708     Sh...^.s..t.>...
c0def0ef:	ff61 2cf3 7c21 1b23 290e da53 21f5 9242     a..,!|#..)S..!B.
c0def0ff:	c064 3b96 a5c8 edcd 61dc 727a b985 ea34     d..;.....azr..4.
c0def10f:	dd51 cdb5 23ab edbc 6be8 6ee3 1b00 5cc6     Q....#...k.n...\
c0def11f:	e965 c9a1 af4b faf4 ebb8 8e5f 2ed4 77c3     e...K....._....w
c0def12f:	3642 fe33 0400 4291 7c46 c547 8ad5 0272     B63....BF|G...r.
c0def13f:	e9c8 4810 c141 f3f7 1480 6a5a 820a 578c     ...HA.....Zj...W
c0def14f:	3502 07e5 58ae a668 2f06 2b72 8fb9 bef6     .5...Xh../r+....
	...

c0def160 <settingContents>:
c0def160:	0000 0000 f17c c0de 0001 0000               ....|.......

c0def16c <infoList>:
c0def16c:	f1b4 c0de f1bc c0de 0000 0000 0002 0000     ................

c0def17c <contents>:
c0def17c:	0007 0000 13f4 da7a 0002 0000 0000 0000     ......z.........
	...
c0def1b0:	0b3d c0de                                   =...

c0def1b4 <INFO_TYPES>:
c0def1b4:	dd02 c0de db40 c0de                         ....@...

c0def1bc <INFO_CONTENTS>:
c0def1bc:	d9aa c0de dbfb c0de 0000 0000               ............

c0def1c8 <pqcrystals_dilithium_fips202_ref_KeccakF_RoundConstants>:
c0def1c8:	0001 0000 0000 0000 8082 0000 0000 0000     ................
c0def1d8:	808a 0000 0000 8000 8000 8000 0000 8000     ................
c0def1e8:	808b 0000 0000 0000 0001 8000 0000 0000     ................
c0def1f8:	8081 8000 0000 8000 8009 0000 0000 8000     ................
c0def208:	008a 0000 0000 0000 0088 0000 0000 0000     ................
c0def218:	8009 8000 0000 0000 000a 8000 0000 0000     ................
c0def228:	808b 8000 0000 0000 008b 0000 0000 8000     ................
c0def238:	8089 0000 0000 8000 8003 0000 0000 8000     ................
c0def248:	8002 0000 0000 8000 0080 0000 0000 8000     ................
c0def258:	800a 0000 0000 0000 000a 8000 0000 8000     ................
c0def268:	8081 8000 0000 8000 8080 0000 0000 8000     ................
c0def278:	0001 8000 0000 0000 8008 8000 0000 8000     ................

c0def288 <zetas>:
c0def288:	0000 0000 64f7 0000 3102 ffd8 1503 fff8     .....d...1......
c0def298:	9e44 0003 2118 fff4 a128 fff2 1e24 0007     D....!..(...$...
c0def2a8:	de2b 001b e92b 0023 84ad fffa 147f ffe0     +...+.#.........
c0def2b8:	9a75 002f fb09 ffd3 7a49 002f e527 0028     u./.....Iz/.'.(.
c0def2c8:	9658 0029 a070 000f 85a4 ffef b788 0036     X.).p.........6.
c0def2d8:	9d90 fff7 eaa0 ffee f968 0027 d37b ffdf     ........h.'.{...
c0def2e8:	add6 ffdf 1ae7 ffc5 a4f7 ffea fc98 ffcd     ................
c0def2f8:	d035 001a b422 ffff 3201 003d 45c5 0004     5..."....2=..E..
c0def308:	4a67 0029 7620 0001 f4cd 002e dec5 0035     gJ). v........5.
c0def318:	a503 ffe6 302c ffc9 47d4 ffd9 beaf 003b     ....,0...G....;.
c0def328:	1585 ffc5 8e7c ffd1 8a96 0036 3e41 ffd4     ....|.....6.A>..
c0def338:	0400 0036 6a4d fffb d69c 0023 c55d fff7     ..6.Mj....#.]...
c0def348:	123d ffe6 ead6 ffe6 7e1e 0035 af59 ffc5     =........~5.Y...
c0def358:	843f 0035 5617 ffdf 945c ffe7 738c 0038     ?.5..V..\....s8.
c0def368:	63a8 000c 1b9a 0008 8f76 000e 3853 003b     .c......v...S8;.
c0def378:	8534 003b fc30 ffd8 9d54 001f 4f2d ffd5     4.;.0...T...-O..
c0def388:	06e5 ffc4 ac81 ffe8 e1cf ffc7 9819 ffd1     ................
c0def398:	d65d ffe9 09ee 0035 35c7 0021 cfbb ffe7     ].....5..5!.....
c0def3a8:	cf75 ffec 9772 001d b072 ffc1 bcf6 fff0     u...r...r.......
c0def3b8:	5280 ffcf d2ae ffcf 90e0 ffc8 efca 0001     .R..............
c0def3c8:	10f2 0034 fe85 fff0 c638 0020 6e9f 0029     ..4.....8. ..n).
c0def3d8:	b7a3 ffd2 a44b ffc7 ba6d fff9 3409 ffda     ....K...m....4..
c0def3e8:	c282 fff5 4113 ffed a63b ffff 09f7 ffec     .....A..;.......
c0def3f8:	2bdd fffa 95d4 0014 4563 001c 2c62 ffea     .+......cE..b,..
c0def408:	fbe9 ffcc 0af0 0004 c417 0007 4588 002f     .............E/.
c0def418:	ad00 0000 36be ffef cd44 000d 675a 003c     .....6..D...Zg<.
c0def428:	2bca ffc7 de7e ffff 3948 0019 69c0 ffce     .+..~...H9...i..
c0def438:	756c 0024 c7df fffc 98a1 000b e808 ffeb     lu$.............
c0def448:	e46c 0002 c808 ffc9 36c2 0030 bff6 ffe3     l........60.....
c0def458:	3c93 ffdb 4ae0 fffd 1305 0014 7792 0014     .<...J.......w..
c0def468:	9e25 0013 d0e0 ffe7 9944 fff3 0802 ffea     %.......D.......
c0def478:	eea2 ffd1 c79c ffc4 a057 ffc8 97d9 003a     ........W.....:.
c0def488:	ea93 001f ff5a 0033 58d4 0023 41f8 003a     ....Z.3..X#..A:.
c0def498:	ff72 ffcc 3dfb 0022 ab9f ffda a422 ffc9     r....="....."...
c0def4a8:	12f5 0004 2587 0025 24f0 ffed 9b5d 0035     .....%%..$..].5.
c0def4b8:	48a0 ffca a2fc ffc6 bb56 ffed 45de ffcf     .H......V....E..
c0def4c8:	be5e 000d 5e1a 001c e0e6 000d 7f5a 000c     ^....^......Z...
c0def4d8:	8f83 0007 628a ffe7 5704 ffff 06fc fff8     .....b...W......
c0def4e8:	0021 fff6 5af6 ffd0 0084 001f ef86 0030     !....Z........0.
c0def4f8:	b97d ffc9 fcd6 fff7 4592 fff4 21c2 ffc9     }........E...!..
c0def508:	3919 0005 610c 0004 cd41 ffda b01b 003e     .9...a..A.....>.
c0def518:	72e7 0034 003b ffcd 7cc7 001a 1924 0003     .r4.;....|..$...
c0def528:	5ee5 002b 1199 0029 7a3a ffd8 4d71 0013     .^+...).:z..qM..
c0def538:	e11c 003d 0984 0013 f051 0025 5a46 0018     ..=.....Q.%.FZ..
c0def548:	8518 ffc6 14be 0013 3891 0028 db90 ffc9     .........8(.....
c0def558:	5089 ffd2 853f 001c 0b4b 001d f6a6 ffef     .P..?...K.......
c0def568:	a8be ffeb e11b 0012 5e3e ffcd 2d2f ffea     ........>^../-..
c0def578:	1de4 fff9 06c7 0014 7283 0032 0d6e ffe2     .........r2.n...
c0def588:	7953 ffec 4099 001d 2578 ffd9 05ad ffeb     Sy...@..x%......
c0def598:	e405 0016 dbe7 000b 1de8 0022 f8cf 0033     .........."...3.
c0def5a8:	b934 fff7 ca0c ffd4 7ff8 ffe6 d157 ffe3     4...........W...
c0def5b8:	911b ffd8 2c12 ffc7 10d8 0009 5e1f ffc6     .....,.......^..
c0def5c8:	4658 ffe1 1d8b 0025 73b7 0025 7c8f fffd     XF....%..s%..|..
c0def5d8:	dd98 001d 6898 0033 d4bb 0002 93a7 ffed     .....h3.........
c0def5e8:	6cbe ffcf 7c1c 0002 aa08 0018 fd71 002d     .l...|......q.-.
c0def5f8:	5ca5 000c 379a 0019 a167 ffc7 8c3d ffe4     .\...7..g...=...
c0def608:	a13c ffd1 c539 0035 0115 003b 1dc0 0004     <...9.5...;.....
c0def618:	c4f7 0021 1bf4 fff1 35e7 001a 340e 0007     ..!......5...4..
c0def628:	7d45 fff9 4cd0 001a 7cae ffe4 2668 001d     E}...L...|..h&..
c0def638:	8e98 ffe6 2633 ffef 05da fffc 7fdb ffc5     ....3&..........
c0def648:	2764 ffd3 e1af ffdd 93dd fff9 1d09 ffdd     d'..............
c0def658:	cc93 0002 1805 fff1 9c2a 0018 e5a9 ffc9     ........*.......
c0def668:	8a50 fff7 cf2c 003b 434e ffff 36df ffeb     P...,.;.NC...6..
c0def678:	15ca 003c 5e68 0015 16b6 fff3 29ce 001e     ..<.h^.......)..

c0def688 <small_zetas>:
c0def688:	fbec fd0a fe99 fa13 05d5 058e 011f 00ca     ................
c0def698:	ff55 026e 0629 00b6 03c2 fb4e fa3e 05bc     U.n.).....N.>...
c0def6a8:	023d fad3 0108 017f fcc3 05b2 f9be ff7e     =.............~.
c0def6b8:	fd57 03f9 02dc 0260 f9fa 019b ff33 f9dd     W.....`.....3...
c0def6c8:	04c7 028c fdd8 03f7 faf3 05d3 fee6 f9f8     ................
c0def6d8:	0204 fff8 fec0 fd66 f9ae fb76 007e 05bd     ......f...v.~...
c0def6e8:	fcab ffa6 fef1 033e 006b fa73 ff09 fc49     ......>.k.s...I.
c0def6f8:	fe72 03c1 fa1c fd2b 01c0 fbd7 02a5 fb05     r.....+.........
c0def708:	fbb1 01ae 022b 034b fb1d 0367 060e 0069     ....+.K...g...i.
c0def718:	01a6 024b 00b1 ff15 fedd fe34 0626 0675     ..K.......4.&.u.
c0def728:	ff0a 030a 0487 ff6d fcf7 05cb fda6 045f     ......m......._.
c0def738:	f9ca 0284 fc98 015d 01a2 0149 ff64 ffb5     ......]...I.d...
c0def748:	0331 0449 025b 0262 052a fafb fa47 0180     1.I.[.b.*...G...
c0def758:	fb41 ff78 04c2 fac9 fc96 00dc fb5d f985     A.x.........]...
c0def768:	fb5f fa06 fb02 031a fa1a fcaa fc9a 01de     _...............
c0def778:	ff94 fecc 03e4 03df 03be fa4c 05f2 065c     ..........L...\.

c0def788 <.L__const.nbgl_useCaseStatus.ticker>:
c0def788:	9705 c0de 0bb8 0000 0000 0000               ............

c0def794 <blindSigningWarning>:
c0def794:	0010 0000 0000 0000 0000 0000 0000 0000     ................
	...
c0def7bc:	6854 7369 6120 7070 6520 616e 6c62 7365     This app enables
c0def7cc:	7320 6769 696e 676e 740a 6172 736e 6361      signing.transac
c0def7dc:	6974 6e6f 2073 6e6f 6920 7374 6e20 7465     tions on its net
c0def7ec:	6f77 6b72 002e                              work..

c0def7f2 <nbMaxElementsPerContentType>:
c0def7f2:	0101 0101 0101 0301 0503 0005 0000          ..............

c0def800 <g_pcHex>:
c0def800:	3130 3332 3534 3736 3938 6261 6463 6665     0123456789abcdef
c0def810:	0000 0000 0040 0000 0000 0000 0000 0000     ....@...........
c0def820:	0101 0000 0000 0000 0000 0000 0916 0000     ................
c0def830:	0000 0000 0028 0000 0000 0000 0000 0000     ....(...........

c0def840 <g_pcHex_cap>:
c0def840:	3130 3332 3534 3736 3938 4241 4443 4645     0123456789ABCDEF

c0def850 <.L__const.displaySkipWarning.info>:
c0def850:	dd8d c0de df95 c0de 0000 0000 ce5e c0de     ............^...
c0def860:	0000 0000 db8e c0de e112 c0de 0005 0109     ................

c0def870 <securityReportItems>:
c0def870:	d90d c0de d96e c0de 0000 0000 d90d c0de     ....n...........
c0def880:	ddbb c0de e096 c0de d90d c0de de35 c0de     ............5...
c0def890:	dd4a c0de 0000 0000 e0ea c0de e237 c0de     J...........7...
c0def8a0:	d90d c0de dd9a c0de de5e c0de               ........^...

c0def8ac <.L__const.displayCustomizedSecurityReport.layoutDescription>:
c0def8ac:	0101 0000 0000 0000 0000 0000 acd9 c0de     ................
	...

c0def8c8 <.L__const.displayInfosListModal.info>:
c0def8c8:	0100 0113 0900 0000 0000 0000 0000 0000     ................
c0def8d8:	0100 0300 0000 0000 0000 0000               ............

c0def8e4 <.L__const.displayInitialWarning.buttonsInfo>:
c0def8e4:	dbc6 c0de e1e1 c0de 0000 0000 0014 0009     ................

c0def8f4 <_etext>:
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
c0defd60:	0080 2c00 0080 911f                         ...,....
