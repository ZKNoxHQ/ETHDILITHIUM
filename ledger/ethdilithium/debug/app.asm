
build/flex/bin/app.elf:     file format elf32-littlearm


Disassembly of section .text:

c0de0000 <main>:
c0de0000:	b510      	push	{r4, lr}
c0de0002:	4604      	mov	r4, r0
c0de0004:	b662      	cpsie	i
c0de0006:	f00a fd15 	bl	c0deaa34 <os_boot>
c0de000a:	b90c      	cbnz	r4, c0de0010 <main+0x10>
c0de000c:	f00a fadc 	bl	c0dea5c8 <standalone_app_main>
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
c0de0022:	f00b f8c5 	bl	c0deb1b0 <__aeabi_memclr>
c0de0026:	b914      	cbnz	r4, c0de002e <address_from_pubkey+0x1a>
c0de0028:	2001      	movs	r0, #1
c0de002a:	f00a fc7f 	bl	c0dea92c <assert_exit>
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
c0de0042:	f00a fc3b 	bl	c0dea8bc <cx_keccak_256_hash_iovec>
c0de0046:	b108      	cbz	r0, c0de004c <address_from_pubkey+0x38>
c0de0048:	2000      	movs	r0, #0
c0de004a:	e006      	b.n	c0de005a <address_from_pubkey+0x46>
c0de004c:	f105 010c 	add.w	r1, r5, #12
c0de0050:	4620      	mov	r0, r4
c0de0052:	2214      	movs	r2, #20
c0de0054:	f00b f8a2 	bl	c0deb19c <__aeabi_memcpy>
c0de0058:	2001      	movs	r0, #1
c0de005a:	b00a      	add	sp, #40	@ 0x28
c0de005c:	bd70      	pop	{r4, r5, r6, pc}

c0de005e <apdu_dispatcher>:
c0de005e:	b51f      	push	{r0, r1, r2, r3, r4, lr}
c0de0060:	4604      	mov	r4, r0
c0de0062:	b910      	cbnz	r0, c0de006a <apdu_dispatcher+0xc>
c0de0064:	2001      	movs	r0, #1
c0de0066:	f00a fc61 	bl	c0dea92c <assert_exit>
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
c0de028a:	f00a f95d 	bl	c0dea548 <io_send_response_buffers>
c0de028e:	bd80      	pop	{r7, pc}

c0de0290 <OUTLINED_FUNCTION_0>:
c0de0290:	9001      	str	r0, [sp, #4]
c0de0292:	7920      	ldrb	r0, [r4, #4]
c0de0294:	9002      	str	r0, [sp, #8]
c0de0296:	4770      	bx	lr

c0de0298 <app_main>:
c0de0298:	b5bf      	push	{r0, r1, r2, r3, r4, r5, r7, lr}
c0de029a:	f00a f937 	bl	c0dea50c <io_init>
c0de029e:	f000 fc01 	bl	c0de0aa4 <ui_menu_main>
c0de02a2:	481b      	ldr	r0, [pc, #108]	@ (c0de0310 <app_main+0x78>)
c0de02a4:	f44f 7136 	mov.w	r1, #728	@ 0x2d8
c0de02a8:	4448      	add	r0, r9
c0de02aa:	f00a ff8f 	bl	c0deb1cc <explicit_bzero>
c0de02ae:	481a      	ldr	r0, [pc, #104]	@ (c0de0318 <app_main+0x80>)
c0de02b0:	4478      	add	r0, pc
c0de02b2:	f00a fd5b 	bl	c0dead6c <pic>
c0de02b6:	7880      	ldrb	r0, [r0, #2]
c0de02b8:	2801      	cmp	r0, #1
c0de02ba:	d00d      	beq.n	c0de02d8 <app_main+0x40>
c0de02bc:	2001      	movs	r0, #1
c0de02be:	f88d 0002 	strb.w	r0, [sp, #2]
c0de02c2:	2000      	movs	r0, #0
c0de02c4:	f8ad 0000 	strh.w	r0, [sp]
c0de02c8:	4814      	ldr	r0, [pc, #80]	@ (c0de031c <app_main+0x84>)
c0de02ca:	4478      	add	r0, pc
c0de02cc:	f00a fd4e 	bl	c0dead6c <pic>
c0de02d0:	4669      	mov	r1, sp
c0de02d2:	2203      	movs	r2, #3
c0de02d4:	f00a fd84 	bl	c0deade0 <nvm_write>
c0de02d8:	4d0e      	ldr	r5, [pc, #56]	@ (c0de0314 <app_main+0x7c>)
c0de02da:	ac01      	add	r4, sp, #4
c0de02dc:	f00a f91e 	bl	c0dea51c <io_recv_command>
c0de02e0:	2800      	cmp	r0, #0
c0de02e2:	d414      	bmi.n	c0de030e <app_main+0x76>
c0de02e4:	4602      	mov	r2, r0
c0de02e6:	eb09 0105 	add.w	r1, r9, r5
c0de02ea:	4620      	mov	r0, r4
c0de02ec:	f00a f993 	bl	c0dea616 <apdu_parser>
c0de02f0:	b130      	cbz	r0, c0de0300 <app_main+0x68>
c0de02f2:	4620      	mov	r0, r4
c0de02f4:	f7ff feb3 	bl	c0de005e <apdu_dispatcher>
c0de02f8:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0de02fc:	dcee      	bgt.n	c0de02dc <app_main+0x44>
c0de02fe:	e006      	b.n	c0de030e <app_main+0x76>
c0de0300:	2000      	movs	r0, #0
c0de0302:	2100      	movs	r1, #0
c0de0304:	f646 2287 	movw	r2, #27271	@ 0x6a87
c0de0308:	f00a f91e 	bl	c0dea548 <io_send_response_buffers>
c0de030c:	e7e6      	b.n	c0de02dc <app_main+0x44>
c0de030e:	bdbf      	pop	{r0, r1, r2, r3, r4, r5, r7, pc}
c0de0310:	00000000 	.word	0x00000000
c0de0314:	00001517 	.word	0x00001517
c0de0318:	0000e34c 	.word	0x0000e34c
c0de031c:	0000e332 	.word	0x0000e332

c0de0320 <handler_get_app_name>:
c0de0320:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de0322:	4808      	ldr	r0, [pc, #32]	@ (c0de0344 <handler_get_app_name+0x24>)
c0de0324:	4478      	add	r0, pc
c0de0326:	f00a fd21 	bl	c0dead6c <pic>
c0de032a:	2100      	movs	r1, #0
c0de032c:	f44f 4210 	mov.w	r2, #36864	@ 0x9000
c0de0330:	9103      	str	r1, [sp, #12]
c0de0332:	2108      	movs	r1, #8
c0de0334:	e9cd 0101 	strd	r0, r1, [sp, #4]
c0de0338:	a801      	add	r0, sp, #4
c0de033a:	2101      	movs	r1, #1
c0de033c:	f00a f904 	bl	c0dea548 <io_send_response_buffers>
c0de0340:	b004      	add	sp, #16
c0de0342:	bd80      	pop	{r7, pc}
c0de0344:	0000cba3 	.word	0x0000cba3

c0de0348 <handler_get_public_key>:
c0de0348:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de034a:	b085      	sub	sp, #20
c0de034c:	4f23      	ldr	r7, [pc, #140]	@ (c0de03dc <handler_get_public_key+0x94>)
c0de034e:	460c      	mov	r4, r1
c0de0350:	4605      	mov	r5, r0
c0de0352:	f44f 7136 	mov.w	r1, #728	@ 0x2d8
c0de0356:	eb09 0607 	add.w	r6, r9, r7
c0de035a:	4630      	mov	r0, r6
c0de035c:	f00a ff36 	bl	c0deb1cc <explicit_bzero>
c0de0360:	2000      	movs	r0, #0
c0de0362:	f506 7135 	add.w	r1, r6, #724	@ 0x2d4
c0de0366:	f809 0007 	strb.w	r0, [r9, r7]
c0de036a:	f886 02a8 	strb.w	r0, [r6, #680]	@ 0x2a8
c0de036e:	4628      	mov	r0, r5
c0de0370:	f009 fe96 	bl	c0dea0a0 <buffer_read_u8>
c0de0374:	b308      	cbz	r0, c0de03ba <handler_get_public_key+0x72>
c0de0376:	eb09 0007 	add.w	r0, r9, r7
c0de037a:	f890 22d4 	ldrb.w	r2, [r0, #724]	@ 0x2d4
c0de037e:	f500 712b 	add.w	r1, r0, #684	@ 0x2ac
c0de0382:	4628      	mov	r0, r5
c0de0384:	f009 fedf 	bl	c0dea146 <buffer_read_bip32_path>
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
c0de03b0:	f009 ff8a 	bl	c0dea2c8 <bip32_derive_with_seed_get_pubkey_256>
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
c0de03e8:	f00a f8ae 	bl	c0dea548 <io_send_response_buffers>
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
c0de0414:	f00a f898 	bl	c0dea548 <io_send_response_buffers>
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
c0de0456:	f00a feb9 	bl	c0deb1cc <explicit_bzero>
c0de045a:	2000      	movs	r0, #0
c0de045c:	f505 7135 	add.w	r1, r5, #724	@ 0x2d4
c0de0460:	f809 0006 	strb.w	r0, [r9, r6]
c0de0464:	2001      	movs	r0, #1
c0de0466:	f885 02a8 	strb.w	r0, [r5, #680]	@ 0x2a8
c0de046a:	4620      	mov	r0, r4
c0de046c:	f009 fe18 	bl	c0dea0a0 <buffer_read_u8>
c0de0470:	b148      	cbz	r0, c0de0486 <handler_sign_tx+0x6a>
c0de0472:	eb09 0006 	add.w	r0, r9, r6
c0de0476:	f890 22d4 	ldrb.w	r2, [r0, #724]	@ 0x2d4
c0de047a:	f500 712b 	add.w	r1, r0, #684	@ 0x2ac
c0de047e:	4620      	mov	r0, r4
c0de0480:	f009 fe61 	bl	c0dea146 <buffer_read_bip32_path>
c0de0484:	b9b8      	cbnz	r0, c0de04b6 <handler_sign_tx+0x9a>
c0de0486:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de048a:	e019      	b.n	c0de04c0 <handler_sign_tx+0xa4>
c0de048c:	f24b 0007 	movw	r0, #45063	@ 0xb007
c0de0490:	e016      	b.n	c0de04c0 <handler_sign_tx+0xa4>
c0de0492:	eb09 0106 	add.w	r1, r9, r6
c0de0496:	4408      	add	r0, r1
c0de0498:	f100 0108 	add.w	r1, r0, #8
c0de049c:	4620      	mov	r0, r4
c0de049e:	f009 fe7c 	bl	c0dea19a <buffer_move>
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
c0de0506:	f00a f9d9 	bl	c0dea8bc <cx_keccak_256_hash_iovec>
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
c0de052a:	f00a fea3 	bl	c0deb274 <strcmp>
c0de052e:	b110      	cbz	r0, c0de0536 <handler_sign_tx+0x11a>
c0de0530:	f000 fcc5 	bl	c0de0ebe <ui_display_transaction>
c0de0534:	e7f1      	b.n	c0de051a <handler_sign_tx+0xfe>
c0de0536:	f000 fcbf 	bl	c0de0eb8 <ui_display_blind_signed_transaction>
c0de053a:	e7ee      	b.n	c0de051a <handler_sign_tx+0xfe>
c0de053c:	00000000 	.word	0x00000000
c0de0540:	0000c1f7 	.word	0x0000c1f7

c0de0544 <io_send_sw>:
c0de0544:	b580      	push	{r7, lr}
c0de0546:	4602      	mov	r2, r0
c0de0548:	2000      	movs	r0, #0
c0de054a:	2100      	movs	r1, #0
c0de054c:	f009 fffc 	bl	c0dea548 <io_send_response_buffers>
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
c0de0572:	f009 ffe9 	bl	c0dea548 <io_send_response_buffers>
c0de0576:	bd8f      	pop	{r0, r1, r2, r3, r7, pc}

c0de0578 <io_send_sw>:
c0de0578:	b580      	push	{r7, lr}
c0de057a:	4602      	mov	r2, r0
c0de057c:	2000      	movs	r0, #0
c0de057e:	2100      	movs	r1, #0
c0de0580:	f009 ffe2 	bl	c0dea548 <io_send_response_buffers>
c0de0584:	bd80      	pop	{r7, pc}

c0de0586 <handler_cmd_keccakH>:
c0de0586:	b5b0      	push	{r4, r5, r7, lr}
c0de0588:	b0f2      	sub	sp, #456	@ 0x1c8
c0de058a:	466d      	mov	r5, sp
c0de058c:	4604      	mov	r4, r0
c0de058e:	4628      	mov	r0, r5
c0de0590:	f000 fc98 	bl	c0de0ec4 <keccak_init>
c0de0594:	88a2      	ldrh	r2, [r4, #4]
c0de0596:	6821      	ldr	r1, [r4, #0]
c0de0598:	4628      	mov	r0, r5
c0de059a:	f000 fc97 	bl	c0de0ecc <keccak_update>
c0de059e:	ac6a      	add	r4, sp, #424	@ 0x1a8
c0de05a0:	4628      	mov	r0, r5
c0de05a2:	4621      	mov	r1, r4
c0de05a4:	f000 fc94 	bl	c0de0ed0 <keccak_final>
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
c0de05ca:	f000 fc83 	bl	c0de0ed4 <inner_keccak256_init>
c0de05ce:	e019      	b.n	c0de0604 <handler_cmd_keccak_prng+0x4c>
c0de05d0:	4c14      	ldr	r4, [pc, #80]	@ (c0de0624 <handler_cmd_keccak_prng+0x6c>)
c0de05d2:	eb09 0004 	add.w	r0, r9, r4
c0de05d6:	f000 fca0 	bl	c0de0f1a <inner_keccak256_flip>
c0de05da:	b9a0      	cbnz	r0, c0de0606 <handler_cmd_keccak_prng+0x4e>
c0de05dc:	eb09 0004 	add.w	r0, r9, r4
c0de05e0:	4669      	mov	r1, sp
c0de05e2:	2240      	movs	r2, #64	@ 0x40
c0de05e4:	f000 fcaf 	bl	c0de0f46 <inner_keccak256_extract>
c0de05e8:	b968      	cbnz	r0, c0de0606 <handler_cmd_keccak_prng+0x4e>
c0de05ea:	4668      	mov	r0, sp
c0de05ec:	2140      	movs	r1, #64	@ 0x40
c0de05ee:	f7ff ffb8 	bl	c0de0562 <io_send_response_pointer>
c0de05f2:	e014      	b.n	c0de061e <handler_cmd_keccak_prng+0x66>
c0de05f4:	490b      	ldr	r1, [pc, #44]	@ (c0de0624 <handler_cmd_keccak_prng+0x6c>)
c0de05f6:	eb09 0301 	add.w	r3, r9, r1
c0de05fa:	e9d0 1200 	ldrd	r1, r2, [r0]
c0de05fe:	4618      	mov	r0, r3
c0de0600:	f000 fc79 	bl	c0de0ef6 <inner_keccak256_inject>
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
c0de0634:	f001 fbeb 	bl	c0de1e0e <pqcrystals_dilithium2_lowram_poly_challenge_eth>
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
c0de0654:	f001 fd8e 	bl	c0de2174 <crypto_sign_keypair_core>
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
c0de067a:	f001 fd6a 	bl	c0de2152 <pqcrystals_dilithium2_lowram_keypair>
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
c0de06a8:	f241 1154 	movw	r1, #4436	@ 0x1154
c0de06ac:	4448      	add	r0, r9
c0de06ae:	1842      	adds	r2, r0, r1
c0de06b0:	f60d 2008 	addw	r0, sp, #2568	@ 0xa08
c0de06b4:	a902      	add	r1, sp, #8
c0de06b6:	f001 fd5d 	bl	c0de2174 <crypto_sign_keypair_core>
c0de06ba:	4604      	mov	r4, r0
c0de06bc:	2800      	cmp	r0, #0
c0de06be:	d141      	bne.n	c0de0744 <handler_cmd_sign_dilithium+0xb0>
c0de06c0:	2000      	movs	r0, #0
c0de06c2:	2100      	movs	r1, #0
c0de06c4:	f001 fe34 	bl	c0de2330 <crypto_sign_signature_init>
c0de06c8:	f000 f8b8 	bl	c0de083c <OUTLINED_FUNCTION_2>
c0de06cc:	e03a      	b.n	c0de0744 <handler_cmd_sign_dilithium+0xb0>
c0de06ce:	4d22      	ldr	r5, [pc, #136]	@ (c0de0758 <handler_cmd_sign_dilithium+0xc4>)
c0de06d0:	f241 1154 	movw	r1, #4436	@ 0x1154
c0de06d4:	eb09 0005 	add.w	r0, r9, r5
c0de06d8:	1842      	adds	r2, r0, r1
c0de06da:	f60d 2008 	addw	r0, sp, #2568	@ 0xa08
c0de06de:	a902      	add	r1, sp, #8
c0de06e0:	f001 fd48 	bl	c0de2174 <crypto_sign_keypair_core>
c0de06e4:	bb78      	cbnz	r0, c0de0746 <handler_cmd_sign_dilithium+0xb2>
c0de06e6:	6860      	ldr	r0, [r4, #4]
c0de06e8:	2801      	cmp	r0, #1
c0de06ea:	d812      	bhi.n	c0de0712 <handler_cmd_sign_dilithium+0x7e>
c0de06ec:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de06f0:	e02b      	b.n	c0de074a <handler_cmd_sign_dilithium+0xb6>
c0de06f2:	e9d4 0100 	ldrd	r0, r1, [r4]
c0de06f6:	f001 fe47 	bl	c0de2388 <crypto_sign_signature_absorb>
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
c0de0728:	f500 60fc 	add.w	r0, r0, #2016	@ 0x7e0
c0de072c:	f001 fe34 	bl	c0de2398 <crypto_sign_signature_core>
c0de0730:	4604      	mov	r4, r0
c0de0732:	b938      	cbnz	r0, c0de0744 <handler_cmd_sign_dilithium+0xb0>
c0de0734:	eb09 0005 	add.w	r0, r9, r5
c0de0738:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de073c:	f500 60fc 	add.w	r0, r0, #2016	@ 0x7e0
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
c0de077a:	f002 f8b3 	bl	c0de28e4 <pqcrystals_dilithium2_lowram_open>
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
c0de0798:	0000d256 	.word	0x0000d256
c0de079c:	0000c8b5 	.word	0x0000c8b5

c0de07a0 <handler_cmd_get_sig_chunk>:
c0de07a0:	b580      	push	{r7, lr}
c0de07a2:	4806      	ldr	r0, [pc, #24]	@ (c0de07bc <handler_cmd_get_sig_chunk+0x1c>)
c0de07a4:	ebc1 2101 	rsb	r1, r1, r1, lsl #8
c0de07a8:	4448      	add	r0, r9
c0de07aa:	4408      	add	r0, r1
c0de07ac:	4611      	mov	r1, r2
c0de07ae:	f500 60fc 	add.w	r0, r0, #2016	@ 0x7e0
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
c0de07ce:	f500 7030 	add.w	r0, r0, #704	@ 0x2c0
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
c0de07ee:	f000 fb69 	bl	c0de0ec4 <keccak_init>
c0de07f2:	480c      	ldr	r0, [pc, #48]	@ (c0de0824 <handler_get_mldsa_seed+0x44>)
c0de07f4:	2241      	movs	r2, #65	@ 0x41
c0de07f6:	4448      	add	r0, r9
c0de07f8:	f100 0108 	add.w	r1, r0, #8
c0de07fc:	4620      	mov	r0, r4
c0de07fe:	f000 fb65 	bl	c0de0ecc <keccak_update>
c0de0802:	4809      	ldr	r0, [pc, #36]	@ (c0de0828 <handler_get_mldsa_seed+0x48>)
c0de0804:	f241 1154 	movw	r1, #4436	@ 0x1154
c0de0808:	4448      	add	r0, r9
c0de080a:	1845      	adds	r5, r0, r1
c0de080c:	4620      	mov	r0, r4
c0de080e:	4629      	mov	r1, r5
c0de0810:	f000 fb5e 	bl	c0de0ed0 <keccak_final>
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
c0de0860:	f00a fc9c 	bl	c0deb19c <__aeabi_memcpy>
c0de0864:	2020      	movs	r0, #32
c0de0866:	f105 0149 	add.w	r1, r5, #73	@ 0x49
c0de086a:	2220      	movs	r2, #32
c0de086c:	f88d 0047 	strb.w	r0, [sp, #71]	@ 0x47
c0de0870:	f104 0043 	add.w	r0, r4, #67	@ 0x43
c0de0874:	f00a fc92 	bl	c0deb19c <__aeabi_memcpy>
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
c0de0898:	f009 fe56 	bl	c0dea548 <io_send_response_buffers>
c0de089c:	b004      	add	sp, #16
c0de089e:	bd80      	pop	{r7, pc}

c0de08a0 <helper_send_response_sig>:
c0de08a0:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de08a2:	b093      	sub	sp, #76	@ 0x4c
c0de08a4:	f10d 0402 	add.w	r4, sp, #2
c0de08a8:	2149      	movs	r1, #73	@ 0x49
c0de08aa:	1c65      	adds	r5, r4, #1
c0de08ac:	4628      	mov	r0, r5
c0de08ae:	f00a fc7f 	bl	c0deb1b0 <__aeabi_memclr>
c0de08b2:	480b      	ldr	r0, [pc, #44]	@ (c0de08e0 <helper_send_response_sig+0x40>)
c0de08b4:	eb09 0700 	add.w	r7, r9, r0
c0de08b8:	4628      	mov	r0, r5
c0de08ba:	f897 62a0 	ldrb.w	r6, [r7, #672]	@ 0x2a0
c0de08be:	f507 7116 	add.w	r1, r7, #600	@ 0x258
c0de08c2:	4632      	mov	r2, r6
c0de08c4:	f88d 6002 	strb.w	r6, [sp, #2]
c0de08c8:	f00a fc68 	bl	c0deb19c <__aeabi_memcpy>
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
c0de08ee:	f00a f81d 	bl	c0dea92c <assert_exit>
c0de08f2:	b915      	cbnz	r5, c0de08fa <transaction_deserialize+0x16>
c0de08f4:	2001      	movs	r0, #1
c0de08f6:	f00a f819 	bl	c0dea92c <assert_exit>
c0de08fa:	6860      	ldr	r0, [r4, #4]
c0de08fc:	f5b0 7fff 	cmp.w	r0, #510	@ 0x1fe
c0de0900:	d901      	bls.n	c0de0906 <transaction_deserialize+0x22>
c0de0902:	20f9      	movs	r0, #249	@ 0xf9
c0de0904:	e04b      	b.n	c0de099e <transaction_deserialize+0xba>
c0de0906:	4620      	mov	r0, r4
c0de0908:	4629      	mov	r1, r5
c0de090a:	2200      	movs	r2, #0
c0de090c:	f009 fbde 	bl	c0dea0cc <buffer_read_u64>
c0de0910:	b330      	cbz	r0, c0de0960 <transaction_deserialize+0x7c>
c0de0912:	6820      	ldr	r0, [r4, #0]
c0de0914:	68a1      	ldr	r1, [r4, #8]
c0de0916:	4408      	add	r0, r1
c0de0918:	2114      	movs	r1, #20
c0de091a:	61a8      	str	r0, [r5, #24]
c0de091c:	4620      	mov	r0, r4
c0de091e:	f009 fbb4 	bl	c0dea08a <buffer_seek_cur>
c0de0922:	b1f8      	cbz	r0, c0de0964 <transaction_deserialize+0x80>
c0de0924:	f105 0108 	add.w	r1, r5, #8
c0de0928:	4620      	mov	r0, r4
c0de092a:	2200      	movs	r2, #0
c0de092c:	2600      	movs	r6, #0
c0de092e:	f009 fbcd 	bl	c0dea0cc <buffer_read_u64>
c0de0932:	b1c8      	cbz	r0, c0de0968 <transaction_deserialize+0x84>
c0de0934:	f105 0120 	add.w	r1, r5, #32
c0de0938:	4620      	mov	r0, r4
c0de093a:	e9c5 6604 	strd	r6, r6, [r5, #16]
c0de093e:	f009 fbe5 	bl	c0dea10c <buffer_read_varint>
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
c0de0976:	f009 fb88 	bl	c0dea08a <buffer_seek_cur>
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
c0de09ae:	f009 ffbd 	bl	c0dea92c <assert_exit>
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
c0de09f2:	f009 fda9 	bl	c0dea548 <io_send_response_buffers>
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
c0de0a4c:	f009 fc70 	bl	c0dea330 <bip32_derive_with_seed_ecdsa_sign_hash_256>
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
c0de0a9e:	f00a fa13 	bl	c0deaec8 <os_sched_exit>
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
c0de0b08:	f007 fc0a 	bl	c0de8320 <nbgl_useCaseHomeAndSettings>
c0de0b0c:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}
c0de0b0e:	bf00      	nop
c0de0b10:	00001450 	.word	0x00001450
c0de0b14:	0000db52 	.word	0x0000db52
c0de0b18:	0000be13 	.word	0x0000be13
c0de0b1c:	0000c384 	.word	0x0000c384
c0de0b20:	0000bf8a 	.word	0x0000bf8a
c0de0b24:	0000bbbb 	.word	0x0000bbbb
c0de0b28:	ffffffab 	.word	0xffffffab
c0de0b2c:	0000d400 	.word	0x0000d400
c0de0b30:	0000d3f2 	.word	0x0000d3f2
c0de0b34:	0000c3c3 	.word	0x0000c3c3
c0de0b38:	0000aa45 	.word	0x0000aa45

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
c0de0b70:	f00a f8fc 	bl	c0dead6c <pic>
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
c0de0b9e:	f00a f91f 	bl	c0deade0 <nvm_write>
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
c0de0bc0:	f007 fe90 	bl	c0de88e4 <nbgl_useCaseChoice>
c0de0bc4:	bdbf      	pop	{r0, r1, r2, r3, r4, r5, r7, pc}
c0de0bc6:	bf00      	nop
c0de0bc8:	00001450 	.word	0x00001450
c0de0bcc:	0000daaa 	.word	0x0000daaa
c0de0bd0:	0000da8e 	.word	0x0000da8e
c0de0bd4:	0000da7e 	.word	0x0000da7e
c0de0bd8:	00000045 	.word	0x00000045
c0de0bdc:	0000bf19 	.word	0x0000bf19
c0de0be0:	0000b197 	.word	0x0000b197
c0de0be4:	0000badd 	.word	0x0000badd
c0de0be8:	0000bc88 	.word	0x0000bc88
c0de0bec:	0000c290 	.word	0x0000c290

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
c0de0c1e:	f00a f8df 	bl	c0deade0 <nvm_write>
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
c0de0c48:	f007 fb6a 	bl	c0de8320 <nbgl_useCaseHomeAndSettings>
c0de0c4c:	b006      	add	sp, #24
c0de0c4e:	bdb0      	pop	{r4, r5, r7, pc}
c0de0c50:	00001450 	.word	0x00001450
c0de0c54:	0000da02 	.word	0x0000da02
c0de0c58:	fffffe69 	.word	0xfffffe69
c0de0c5c:	0000d2be 	.word	0x0000d2be
c0de0c60:	0000d2b0 	.word	0x0000d2b0
c0de0c64:	0000c283 	.word	0x0000c283
c0de0c68:	0000a905 	.word	0x0000a905

c0de0c6c <OUTLINED_FUNCTION_0>:
c0de0c6c:	4620      	mov	r0, r4
c0de0c6e:	f00a b87d 	b.w	c0dead6c <pic>
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
c0de0c92:	f00a fa8d 	bl	c0deb1b0 <__aeabi_memclr>
c0de0c96:	ac03      	add	r4, sp, #12
c0de0c98:	2114      	movs	r1, #20
c0de0c9a:	4620      	mov	r0, r4
c0de0c9c:	f00a fa88 	bl	c0deb1b0 <__aeabi_memclr>
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
c0de0cba:	f009 fbe3 	bl	c0dea484 <format_hex>
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
c0de0cda:	f008 fa7d 	bl	c0de91d8 <nbgl_useCaseAddressReview>
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
c0de0d08:	0000146c 	.word	0x0000146c
c0de0d0c:	0000005d 	.word	0x0000005d
c0de0d10:	0000a875 	.word	0x0000a875
c0de0d14:	0000c279 	.word	0x0000c279

c0de0d18 <io_send_sw>:
c0de0d18:	b580      	push	{r7, lr}
c0de0d1a:	4602      	mov	r2, r0
c0de0d1c:	2000      	movs	r0, #0
c0de0d1e:	2100      	movs	r1, #0
c0de0d20:	f009 fc12 	bl	c0dea548 <io_send_response_buffers>
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
c0de0d40:	f007 bd86 	b.w	c0de8850 <nbgl_useCaseReviewStatus>
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
c0de0d6e:	f00a fa1f 	bl	c0deb1b0 <__aeabi_memclr>
c0de0d72:	ad05      	add	r5, sp, #20
c0de0d74:	211e      	movs	r1, #30
c0de0d76:	4628      	mov	r0, r5
c0de0d78:	f00a fa1a 	bl	c0deb1b0 <__aeabi_memclr>
c0de0d7c:	eb09 0007 	add.w	r0, r9, r7
c0de0d80:	211e      	movs	r1, #30
c0de0d82:	e9d0 2386 	ldrd	r2, r3, [r0, #536]	@ 0x218
c0de0d86:	2003      	movs	r0, #3
c0de0d88:	9000      	str	r0, [sp, #0]
c0de0d8a:	4628      	mov	r0, r5
c0de0d8c:	f009 fb33 	bl	c0dea3f6 <format_fpu64>
c0de0d90:	2800      	cmp	r0, #0
c0de0d92:	d04d      	beq.n	c0de0e30 <ui_display_transaction_bs_choice+0xe8>
c0de0d94:	9500      	str	r5, [sp, #0]
c0de0d96:	eb09 0506 	add.w	r5, r9, r6
c0de0d9a:	211e      	movs	r1, #30
c0de0d9c:	231e      	movs	r3, #30
c0de0d9e:	4a32      	ldr	r2, [pc, #200]	@ (c0de0e68 <ui_display_transaction_bs_choice+0x120>)
c0de0da0:	f105 0014 	add.w	r0, r5, #20
c0de0da4:	447a      	add	r2, pc
c0de0da6:	f009 fe4f 	bl	c0deaa48 <snprintf>
c0de0daa:	3554      	adds	r5, #84	@ 0x54
c0de0dac:	212b      	movs	r1, #43	@ 0x2b
c0de0dae:	4628      	mov	r0, r5
c0de0db0:	f00a f9fe 	bl	c0deb1b0 <__aeabi_memclr>
c0de0db4:	eb09 0007 	add.w	r0, r9, r7
c0de0db8:	2114      	movs	r1, #20
c0de0dba:	462a      	mov	r2, r5
c0de0dbc:	232b      	movs	r3, #43	@ 0x2b
c0de0dbe:	f8d0 0228 	ldr.w	r0, [r0, #552]	@ 0x228
c0de0dc2:	f009 fb5f 	bl	c0dea484 <format_hex>
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
c0de0e16:	f007 ff3f 	bl	c0de8c98 <nbgl_useCaseReviewBlindSigning>
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
c0de0e5a:	f007 fe6f 	bl	c0de8b3c <nbgl_useCaseReview>
c0de0e5e:	e7ef      	b.n	c0de0e40 <ui_display_transaction_bs_choice+0xf8>
c0de0e60:	00000000 	.word	0x00000000
c0de0e64:	00001498 	.word	0x00001498
c0de0e68:	0000bf5a 	.word	0x0000bf5a
c0de0e6c:	0000b9e6 	.word	0x0000b9e6
c0de0e70:	0000bf1d 	.word	0x0000bf1d
c0de0e74:	0000009f 	.word	0x0000009f
c0de0e78:	0000baf5 	.word	0x0000baf5
c0de0e7c:	0000a739 	.word	0x0000a739
c0de0e80:	0000b88b 	.word	0x0000b88b
c0de0e84:	0000a6f5 	.word	0x0000a6f5
c0de0e88:	0000b847 	.word	0x0000b847

c0de0e8c <io_send_sw>:
c0de0e8c:	b580      	push	{r7, lr}
c0de0e8e:	4602      	mov	r2, r0
c0de0e90:	2000      	movs	r0, #0
c0de0e92:	2100      	movs	r1, #0
c0de0e94:	f009 fb58 	bl	c0dea548 <io_send_response_buffers>
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
c0de0eb0:	f007 bcce 	b.w	c0de8850 <nbgl_useCaseReviewStatus>
c0de0eb4:	fffffbf7 	.word	0xfffffbf7

c0de0eb8 <ui_display_blind_signed_transaction>:
c0de0eb8:	2001      	movs	r0, #1
c0de0eba:	f7ff bf45 	b.w	c0de0d48 <ui_display_transaction_bs_choice>

c0de0ebe <ui_display_transaction>:
c0de0ebe:	2000      	movs	r0, #0
c0de0ec0:	f7ff bf42 	b.w	c0de0d48 <ui_display_transaction_bs_choice>

c0de0ec4 <keccak_init>:
c0de0ec4:	2106      	movs	r1, #6
c0de0ec6:	2220      	movs	r2, #32
c0de0ec8:	f009 bd19 	b.w	c0dea8fe <cx_hash_init_ex>

c0de0ecc <keccak_update>:
c0de0ecc:	f009 bd1c 	b.w	c0dea908 <cx_hash_update>

c0de0ed0 <keccak_final>:
c0de0ed0:	f009 bd10 	b.w	c0dea8f4 <cx_hash_final>

c0de0ed4 <inner_keccak256_init>:
c0de0ed4:	b160      	cbz	r0, c0de0ef0 <inner_keccak256_init+0x1c>
c0de0ed6:	b510      	push	{r4, lr}
c0de0ed8:	212c      	movs	r1, #44	@ 0x2c
c0de0eda:	4604      	mov	r4, r0
c0de0edc:	f00a f968 	bl	c0deb1b0 <__aeabi_memclr>
c0de0ee0:	f104 0030 	add.w	r0, r4, #48	@ 0x30
c0de0ee4:	f7ff ffee 	bl	c0de0ec4 <keccak_init>
c0de0ee8:	2000      	movs	r0, #0
c0de0eea:	e9c4 007e 	strd	r0, r0, [r4, #504]	@ 0x1f8
c0de0eee:	bd10      	pop	{r4, pc}
c0de0ef0:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de0ef4:	4770      	bx	lr

c0de0ef6 <inner_keccak256_inject>:
c0de0ef6:	b580      	push	{r7, lr}
c0de0ef8:	4603      	mov	r3, r0
c0de0efa:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de0efe:	b15b      	cbz	r3, c0de0f18 <inner_keccak256_inject+0x22>
c0de0f00:	b151      	cbz	r1, c0de0f18 <inner_keccak256_inject+0x22>
c0de0f02:	6a98      	ldr	r0, [r3, #40]	@ 0x28
c0de0f04:	b110      	cbz	r0, c0de0f0c <inner_keccak256_inject+0x16>
c0de0f06:	f06f 0001 	mvn.w	r0, #1
c0de0f0a:	bd80      	pop	{r7, pc}
c0de0f0c:	f103 0030 	add.w	r0, r3, #48	@ 0x30
c0de0f10:	b292      	uxth	r2, r2
c0de0f12:	f7ff ffdb 	bl	c0de0ecc <keccak_update>
c0de0f16:	2000      	movs	r0, #0
c0de0f18:	bd80      	pop	{r7, pc}

c0de0f1a <inner_keccak256_flip>:
c0de0f1a:	b510      	push	{r4, lr}
c0de0f1c:	b128      	cbz	r0, c0de0f2a <inner_keccak256_flip+0x10>
c0de0f1e:	4604      	mov	r4, r0
c0de0f20:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0de0f22:	b128      	cbz	r0, c0de0f30 <inner_keccak256_flip+0x16>
c0de0f24:	f06f 0001 	mvn.w	r0, #1
c0de0f28:	bd10      	pop	{r4, pc}
c0de0f2a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de0f2e:	bd10      	pop	{r4, pc}
c0de0f30:	f104 0030 	add.w	r0, r4, #48	@ 0x30
c0de0f34:	4621      	mov	r1, r4
c0de0f36:	f7ff ffcb 	bl	c0de0ed0 <keccak_final>
c0de0f3a:	2000      	movs	r0, #0
c0de0f3c:	2101      	movs	r1, #1
c0de0f3e:	e9c4 007e 	strd	r0, r0, [r4, #504]	@ 0x1f8
c0de0f42:	62a1      	str	r1, [r4, #40]	@ 0x28
c0de0f44:	bd10      	pop	{r4, pc}

c0de0f46 <inner_keccak256_extract>:
c0de0f46:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de0f4a:	b0f8      	sub	sp, #480	@ 0x1e0
c0de0f4c:	4682      	mov	sl, r0
c0de0f4e:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de0f52:	f1ba 0f00 	cmp.w	sl, #0
c0de0f56:	d020      	beq.n	c0de0f9a <inner_keccak256_extract+0x54>
c0de0f58:	460e      	mov	r6, r1
c0de0f5a:	b1f1      	cbz	r1, c0de0f9a <inner_keccak256_extract+0x54>
c0de0f5c:	f8da 0028 	ldr.w	r0, [sl, #40]	@ 0x28
c0de0f60:	b1c8      	cbz	r0, c0de0f96 <inner_keccak256_extract+0x50>
c0de0f62:	e9da 017e 	ldrd	r0, r1, [sl, #504]	@ 0x1f8
c0de0f66:	4615      	mov	r5, r2
c0de0f68:	4281      	cmp	r1, r0
c0de0f6a:	d919      	bls.n	c0de0fa0 <inner_keccak256_extract+0x5a>
c0de0f6c:	1a0c      	subs	r4, r1, r0
c0de0f6e:	4450      	add	r0, sl
c0de0f70:	46a3      	mov	fp, r4
c0de0f72:	42ac      	cmp	r4, r5
c0de0f74:	f500 71ec 	add.w	r1, r0, #472	@ 0x1d8
c0de0f78:	4630      	mov	r0, r6
c0de0f7a:	bf88      	it	hi
c0de0f7c:	46ab      	movhi	fp, r5
c0de0f7e:	465a      	mov	r2, fp
c0de0f80:	f00a f90c 	bl	c0deb19c <__aeabi_memcpy>
c0de0f84:	f8da 01f8 	ldr.w	r0, [sl, #504]	@ 0x1f8
c0de0f88:	42ac      	cmp	r4, r5
c0de0f8a:	4458      	add	r0, fp
c0de0f8c:	f8ca 01f8 	str.w	r0, [sl, #504]	@ 0x1f8
c0de0f90:	d308      	bcc.n	c0de0fa4 <inner_keccak256_extract+0x5e>
c0de0f92:	2000      	movs	r0, #0
c0de0f94:	e001      	b.n	c0de0f9a <inner_keccak256_extract+0x54>
c0de0f96:	f06f 0001 	mvn.w	r0, #1
c0de0f9a:	b078      	add	sp, #480	@ 0x1e0
c0de0f9c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de0fa0:	f04f 0b00 	mov.w	fp, #0
c0de0fa4:	ac6e      	add	r4, sp, #440	@ 0x1b8
c0de0fa6:	9503      	str	r5, [sp, #12]
c0de0fa8:	f104 0020 	add.w	r0, r4, #32
c0de0fac:	9002      	str	r0, [sp, #8]
c0de0fae:	f50a 70ec 	add.w	r0, sl, #472	@ 0x1d8
c0de0fb2:	e9cd 0600 	strd	r0, r6, [sp]
c0de0fb6:	45ab      	cmp	fp, r5
c0de0fb8:	d2eb      	bcs.n	c0de0f92 <inner_keccak256_extract+0x4c>
c0de0fba:	4620      	mov	r0, r4
c0de0fbc:	4651      	mov	r1, sl
c0de0fbe:	2220      	movs	r2, #32
c0de0fc0:	46a0      	mov	r8, r4
c0de0fc2:	f00a f8eb 	bl	c0deb19c <__aeabi_memcpy>
c0de0fc6:	e9da 5408 	ldrd	r5, r4, [sl, #32]
c0de0fca:	9f02      	ldr	r7, [sp, #8]
c0de0fcc:	2638      	movs	r6, #56	@ 0x38
c0de0fce:	f116 0008 	adds.w	r0, r6, #8
c0de0fd2:	d008      	beq.n	c0de0fe6 <inner_keccak256_extract+0xa0>
c0de0fd4:	4628      	mov	r0, r5
c0de0fd6:	4621      	mov	r1, r4
c0de0fd8:	4632      	mov	r2, r6
c0de0fda:	f009 ffe9 	bl	c0deafb0 <__aeabi_llsr>
c0de0fde:	f807 0b01 	strb.w	r0, [r7], #1
c0de0fe2:	3e08      	subs	r6, #8
c0de0fe4:	e7f3      	b.n	c0de0fce <inner_keccak256_extract+0x88>
c0de0fe6:	af04      	add	r7, sp, #16
c0de0fe8:	4638      	mov	r0, r7
c0de0fea:	f7ff ff6b 	bl	c0de0ec4 <keccak_init>
c0de0fee:	4638      	mov	r0, r7
c0de0ff0:	4641      	mov	r1, r8
c0de0ff2:	2228      	movs	r2, #40	@ 0x28
c0de0ff4:	4644      	mov	r4, r8
c0de0ff6:	f7ff ff69 	bl	c0de0ecc <keccak_update>
c0de0ffa:	9d03      	ldr	r5, [sp, #12]
c0de0ffc:	eba5 080b 	sub.w	r8, r5, fp
c0de1000:	f1b8 0f1f 	cmp.w	r8, #31
c0de1004:	d90b      	bls.n	c0de101e <inner_keccak256_extract+0xd8>
c0de1006:	9e01      	ldr	r6, [sp, #4]
c0de1008:	4638      	mov	r0, r7
c0de100a:	eb06 010b 	add.w	r1, r6, fp
c0de100e:	f7ff ff5f 	bl	c0de0ed0 <keccak_final>
c0de1012:	f10b 0b20 	add.w	fp, fp, #32
c0de1016:	f04f 0800 	mov.w	r8, #0
c0de101a:	2000      	movs	r0, #0
c0de101c:	e00d      	b.n	c0de103a <inner_keccak256_extract+0xf4>
c0de101e:	4638      	mov	r0, r7
c0de1020:	9f00      	ldr	r7, [sp, #0]
c0de1022:	4639      	mov	r1, r7
c0de1024:	f7ff ff54 	bl	c0de0ed0 <keccak_final>
c0de1028:	9e01      	ldr	r6, [sp, #4]
c0de102a:	4639      	mov	r1, r7
c0de102c:	4642      	mov	r2, r8
c0de102e:	eb06 000b 	add.w	r0, r6, fp
c0de1032:	f00a f8b3 	bl	c0deb19c <__aeabi_memcpy>
c0de1036:	2020      	movs	r0, #32
c0de1038:	46ab      	mov	fp, r5
c0de103a:	e9ca 807e 	strd	r8, r0, [sl, #504]	@ 0x1f8
c0de103e:	e9da 0108 	ldrd	r0, r1, [sl, #32]
c0de1042:	3001      	adds	r0, #1
c0de1044:	f141 0100 	adc.w	r1, r1, #0
c0de1048:	e9ca 0108 	strd	r0, r1, [sl, #32]
c0de104c:	e7b3      	b.n	c0de0fb6 <inner_keccak256_extract+0x70>

c0de104e <pqcrystals_dilithium2_lowram_pack_sig_h>:
c0de104e:	b5b0      	push	{r4, r5, r7, lr}
c0de1050:	f500 6012 	add.w	r0, r0, #2336	@ 0x920
c0de1054:	2400      	movs	r4, #0
c0de1056:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de105a:	d009      	beq.n	c0de1070 <pqcrystals_dilithium2_lowram_pack_sig_h+0x22>
c0de105c:	f851 5024 	ldr.w	r5, [r1, r4, lsl #2]
c0de1060:	b125      	cbz	r5, c0de106c <pqcrystals_dilithium2_lowram_pack_sig_h+0x1e>
c0de1062:	681d      	ldr	r5, [r3, #0]
c0de1064:	5544      	strb	r4, [r0, r5]
c0de1066:	681d      	ldr	r5, [r3, #0]
c0de1068:	3501      	adds	r5, #1
c0de106a:	601d      	str	r5, [r3, #0]
c0de106c:	3401      	adds	r4, #1
c0de106e:	e7f2      	b.n	c0de1056 <pqcrystals_dilithium2_lowram_pack_sig_h+0x8>
c0de1070:	6819      	ldr	r1, [r3, #0]
c0de1072:	4410      	add	r0, r2
c0de1074:	f880 1050 	strb.w	r1, [r0, #80]	@ 0x50
c0de1078:	bdb0      	pop	{r4, r5, r7, pc}

c0de107a <pqcrystals_dilithium2_lowram_pack_sig_h_zero>:
c0de107a:	680a      	ldr	r2, [r1, #0]
c0de107c:	f500 6012 	add.w	r0, r0, #2336	@ 0x920
c0de1080:	2300      	movs	r3, #0
c0de1082:	2a4f      	cmp	r2, #79	@ 0x4f
c0de1084:	bf88      	it	hi
c0de1086:	4770      	bxhi	lr
c0de1088:	5483      	strb	r3, [r0, r2]
c0de108a:	680a      	ldr	r2, [r1, #0]
c0de108c:	3201      	adds	r2, #1
c0de108e:	600a      	str	r2, [r1, #0]
c0de1090:	e7f7      	b.n	c0de1082 <pqcrystals_dilithium2_lowram_pack_sig_h_zero+0x8>

c0de1092 <poly_challenge_compress>:
c0de1092:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de1096:	2200      	movs	r2, #0
c0de1098:	2300      	movs	r3, #0
c0de109a:	2b44      	cmp	r3, #68	@ 0x44
c0de109c:	d002      	beq.n	c0de10a4 <poly_challenge_compress+0x12>
c0de109e:	54c2      	strb	r2, [r0, r3]
c0de10a0:	3301      	adds	r3, #1
c0de10a2:	e7fa      	b.n	c0de109a <poly_challenge_compress+0x8>
c0de10a4:	2200      	movs	r2, #0
c0de10a6:	2301      	movs	r3, #1
c0de10a8:	2600      	movs	r6, #0
c0de10aa:	f04f 0800 	mov.w	r8, #0
c0de10ae:	2500      	movs	r5, #0
c0de10b0:	2700      	movs	r7, #0
c0de10b2:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de10b6:	d011      	beq.n	c0de10dc <poly_challenge_compress+0x4a>
c0de10b8:	f851 4022 	ldr.w	r4, [r1, r2, lsl #2]
c0de10bc:	b164      	cbz	r4, c0de10d8 <poly_challenge_compress+0x46>
c0de10be:	5582      	strb	r2, [r0, r6]
c0de10c0:	f851 4022 	ldr.w	r4, [r1, r2, lsl #2]
c0de10c4:	3401      	adds	r4, #1
c0de10c6:	bf04      	itt	eq
c0de10c8:	433d      	orreq	r5, r7
c0de10ca:	ea48 0803 	orreq.w	r8, r8, r3
c0de10ce:	007c      	lsls	r4, r7, #1
c0de10d0:	3601      	adds	r6, #1
c0de10d2:	ea44 77d3 	orr.w	r7, r4, r3, lsr #31
c0de10d6:	005b      	lsls	r3, r3, #1
c0de10d8:	3201      	adds	r2, #1
c0de10da:	e7ea      	b.n	c0de10b2 <poly_challenge_compress+0x20>
c0de10dc:	f100 073c 	add.w	r7, r0, #60	@ 0x3c
c0de10e0:	2600      	movs	r6, #0
c0de10e2:	2e40      	cmp	r6, #64	@ 0x40
c0de10e4:	bf08      	it	eq
c0de10e6:	e8bd 81f0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de10ea:	4640      	mov	r0, r8
c0de10ec:	4629      	mov	r1, r5
c0de10ee:	4632      	mov	r2, r6
c0de10f0:	f009 ff5e 	bl	c0deafb0 <__aeabi_llsr>
c0de10f4:	f807 0b01 	strb.w	r0, [r7], #1
c0de10f8:	3608      	adds	r6, #8
c0de10fa:	e7f2      	b.n	c0de10e2 <poly_challenge_compress+0x50>

c0de10fc <poly_challenge_decompress>:
c0de10fc:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de1100:	4688      	mov	r8, r1
c0de1102:	4682      	mov	sl, r0
c0de1104:	2000      	movs	r0, #0
c0de1106:	2100      	movs	r1, #0
c0de1108:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de110c:	d003      	beq.n	c0de1116 <poly_challenge_decompress+0x1a>
c0de110e:	f84a 0021 	str.w	r0, [sl, r1, lsl #2]
c0de1112:	3101      	adds	r1, #1
c0de1114:	e7f8      	b.n	c0de1108 <poly_challenge_decompress+0xc>
c0de1116:	f108 053c 	add.w	r5, r8, #60	@ 0x3c
c0de111a:	2600      	movs	r6, #0
c0de111c:	2700      	movs	r7, #0
c0de111e:	2400      	movs	r4, #0
c0de1120:	2e40      	cmp	r6, #64	@ 0x40
c0de1122:	d009      	beq.n	c0de1138 <poly_challenge_decompress+0x3c>
c0de1124:	f815 0b01 	ldrb.w	r0, [r5], #1
c0de1128:	2100      	movs	r1, #0
c0de112a:	4632      	mov	r2, r6
c0de112c:	f009 ff2e 	bl	c0deaf8c <__aeabi_llsl>
c0de1130:	430c      	orrs	r4, r1
c0de1132:	4307      	orrs	r7, r0
c0de1134:	3608      	adds	r6, #8
c0de1136:	e7f3      	b.n	c0de1120 <poly_challenge_decompress+0x24>
c0de1138:	2000      	movs	r0, #0
c0de113a:	2827      	cmp	r0, #39	@ 0x27
c0de113c:	bf08      	it	eq
c0de113e:	e8bd 85f8 	ldmiaeq.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0de1142:	07fa      	lsls	r2, r7, #31
c0de1144:	f818 1000 	ldrb.w	r1, [r8, r0]
c0de1148:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
c0de114c:	bf08      	it	eq
c0de114e:	2201      	moveq	r2, #1
c0de1150:	ea5f 0454 	movs.w	r4, r4, lsr #1
c0de1154:	f84a 2021 	str.w	r2, [sl, r1, lsl #2]
c0de1158:	ea4f 0737 	mov.w	r7, r7, rrx
c0de115c:	3001      	adds	r0, #1
c0de115e:	e7ec      	b.n	c0de113a <poly_challenge_decompress+0x3e>

c0de1160 <poly_schoolbook>:
c0de1160:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de1164:	4614      	mov	r4, r2
c0de1166:	468a      	mov	sl, r1
c0de1168:	2200      	movs	r2, #0
c0de116a:	2100      	movs	r1, #0
c0de116c:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de1170:	d003      	beq.n	c0de117a <poly_schoolbook+0x1a>
c0de1172:	f840 2021 	str.w	r2, [r0, r1, lsl #2]
c0de1176:	3101      	adds	r1, #1
c0de1178:	e7f8      	b.n	c0de116c <poly_schoolbook+0xc>
c0de117a:	f10a 053c 	add.w	r5, sl, #60	@ 0x3c
c0de117e:	2700      	movs	r7, #0
c0de1180:	f04f 0b00 	mov.w	fp, #0
c0de1184:	2600      	movs	r6, #0
c0de1186:	9003      	str	r0, [sp, #12]
c0de1188:	2f40      	cmp	r7, #64	@ 0x40
c0de118a:	d006      	beq.n	c0de119a <poly_schoolbook+0x3a>
c0de118c:	f000 fbf0 	bl	c0de1970 <OUTLINED_FUNCTION_2>
c0de1190:	430e      	orrs	r6, r1
c0de1192:	ea4b 0b00 	orr.w	fp, fp, r0
c0de1196:	3708      	adds	r7, #8
c0de1198:	e7f6      	b.n	c0de1188 <poly_schoolbook+0x28>
c0de119a:	f04f 0800 	mov.w	r8, #0
c0de119e:	f8cd a004 	str.w	sl, [sp, #4]
c0de11a2:	f1b8 0f27 	cmp.w	r8, #39	@ 0x27
c0de11a6:	bf08      	it	eq
c0de11a8:	e8bd 8dff 	ldmiaeq.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de11ac:	f81a 0008 	ldrb.w	r0, [sl, r8]
c0de11b0:	ea5f 71cb 	movs.w	r1, fp, lsl #31
c0de11b4:	f5c0 7780 	rsb	r7, r0, #256	@ 0x100
c0de11b8:	d111      	bne.n	c0de11de <poly_schoolbook+0x7e>
c0de11ba:	9903      	ldr	r1, [sp, #12]
c0de11bc:	9602      	str	r6, [sp, #8]
c0de11be:	2500      	movs	r5, #0
c0de11c0:	eb01 0680 	add.w	r6, r1, r0, lsl #2
c0de11c4:	42af      	cmp	r7, r5
c0de11c6:	d01b      	beq.n	c0de1200 <poly_schoolbook+0xa0>
c0de11c8:	4620      	mov	r0, r4
c0de11ca:	4629      	mov	r1, r5
c0de11cc:	f000 f842 	bl	c0de1254 <polyt0_unpack_idx>
c0de11d0:	f856 1025 	ldr.w	r1, [r6, r5, lsl #2]
c0de11d4:	4408      	add	r0, r1
c0de11d6:	f846 0025 	str.w	r0, [r6, r5, lsl #2]
c0de11da:	3501      	adds	r5, #1
c0de11dc:	e7f2      	b.n	c0de11c4 <poly_schoolbook+0x64>
c0de11de:	9903      	ldr	r1, [sp, #12]
c0de11e0:	2500      	movs	r5, #0
c0de11e2:	eb01 0a80 	add.w	sl, r1, r0, lsl #2
c0de11e6:	42af      	cmp	r7, r5
c0de11e8:	d01b      	beq.n	c0de1222 <poly_schoolbook+0xc2>
c0de11ea:	4620      	mov	r0, r4
c0de11ec:	4629      	mov	r1, r5
c0de11ee:	f000 f831 	bl	c0de1254 <polyt0_unpack_idx>
c0de11f2:	f85a 1025 	ldr.w	r1, [sl, r5, lsl #2]
c0de11f6:	1a08      	subs	r0, r1, r0
c0de11f8:	f84a 0025 	str.w	r0, [sl, r5, lsl #2]
c0de11fc:	3501      	adds	r5, #1
c0de11fe:	e7f2      	b.n	c0de11e6 <poly_schoolbook+0x86>
c0de1200:	f5a6 6580 	sub.w	r5, r6, #1024	@ 0x400
c0de1204:	9e02      	ldr	r6, [sp, #8]
c0de1206:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de120a:	d01c      	beq.n	c0de1246 <poly_schoolbook+0xe6>
c0de120c:	4620      	mov	r0, r4
c0de120e:	4639      	mov	r1, r7
c0de1210:	f000 f820 	bl	c0de1254 <polyt0_unpack_idx>
c0de1214:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de1218:	1a08      	subs	r0, r1, r0
c0de121a:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de121e:	3701      	adds	r7, #1
c0de1220:	e7f1      	b.n	c0de1206 <poly_schoolbook+0xa6>
c0de1222:	f5aa 6580 	sub.w	r5, sl, #1024	@ 0x400
c0de1226:	f8dd a004 	ldr.w	sl, [sp, #4]
c0de122a:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de122e:	d00a      	beq.n	c0de1246 <poly_schoolbook+0xe6>
c0de1230:	4620      	mov	r0, r4
c0de1232:	4639      	mov	r1, r7
c0de1234:	f000 f80e 	bl	c0de1254 <polyt0_unpack_idx>
c0de1238:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de123c:	4408      	add	r0, r1
c0de123e:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de1242:	3701      	adds	r7, #1
c0de1244:	e7f1      	b.n	c0de122a <poly_schoolbook+0xca>
c0de1246:	ea5f 0656 	movs.w	r6, r6, lsr #1
c0de124a:	f108 0801 	add.w	r8, r8, #1
c0de124e:	ea4f 0b3b 	mov.w	fp, fp, rrx
c0de1252:	e7a6      	b.n	c0de11a2 <poly_schoolbook+0x42>

c0de1254 <polyt0_unpack_idx>:
c0de1254:	08ca      	lsrs	r2, r1, #3
c0de1256:	230d      	movs	r3, #13
c0de1258:	f001 0107 	and.w	r1, r1, #7
c0de125c:	fb02 0003 	mla	r0, r2, r3, r0
c0de1260:	2906      	cmp	r1, #6
c0de1262:	d00e      	beq.n	c0de1282 <polyt0_unpack_idx+0x2e>
c0de1264:	2901      	cmp	r1, #1
c0de1266:	d014      	beq.n	c0de1292 <polyt0_unpack_idx+0x3e>
c0de1268:	2902      	cmp	r1, #2
c0de126a:	d01a      	beq.n	c0de12a2 <polyt0_unpack_idx+0x4e>
c0de126c:	2903      	cmp	r1, #3
c0de126e:	d01d      	beq.n	c0de12ac <polyt0_unpack_idx+0x58>
c0de1270:	2904      	cmp	r1, #4
c0de1272:	d023      	beq.n	c0de12bc <polyt0_unpack_idx+0x68>
c0de1274:	2905      	cmp	r1, #5
c0de1276:	d029      	beq.n	c0de12cc <polyt0_unpack_idx+0x78>
c0de1278:	bb69      	cbnz	r1, c0de12d6 <polyt0_unpack_idx+0x82>
c0de127a:	7801      	ldrb	r1, [r0, #0]
c0de127c:	7840      	ldrb	r0, [r0, #1]
c0de127e:	0200      	lsls	r0, r0, #8
c0de1280:	e02d      	b.n	c0de12de <polyt0_unpack_idx+0x8a>
c0de1282:	7a82      	ldrb	r2, [r0, #10]
c0de1284:	7a41      	ldrb	r1, [r0, #9]
c0de1286:	7ac3      	ldrb	r3, [r0, #11]
c0de1288:	0090      	lsls	r0, r2, #2
c0de128a:	ea40 1091 	orr.w	r0, r0, r1, lsr #6
c0de128e:	0299      	lsls	r1, r3, #10
c0de1290:	e025      	b.n	c0de12de <polyt0_unpack_idx+0x8a>
c0de1292:	7882      	ldrb	r2, [r0, #2]
c0de1294:	7841      	ldrb	r1, [r0, #1]
c0de1296:	78c3      	ldrb	r3, [r0, #3]
c0de1298:	00d0      	lsls	r0, r2, #3
c0de129a:	ea40 1051 	orr.w	r0, r0, r1, lsr #5
c0de129e:	02d9      	lsls	r1, r3, #11
c0de12a0:	e01d      	b.n	c0de12de <polyt0_unpack_idx+0x8a>
c0de12a2:	78c1      	ldrb	r1, [r0, #3]
c0de12a4:	7900      	ldrb	r0, [r0, #4]
c0de12a6:	0180      	lsls	r0, r0, #6
c0de12a8:	0889      	lsrs	r1, r1, #2
c0de12aa:	e018      	b.n	c0de12de <polyt0_unpack_idx+0x8a>
c0de12ac:	7942      	ldrb	r2, [r0, #5]
c0de12ae:	7901      	ldrb	r1, [r0, #4]
c0de12b0:	7983      	ldrb	r3, [r0, #6]
c0de12b2:	0050      	lsls	r0, r2, #1
c0de12b4:	ea40 10d1 	orr.w	r0, r0, r1, lsr #7
c0de12b8:	0259      	lsls	r1, r3, #9
c0de12ba:	e010      	b.n	c0de12de <polyt0_unpack_idx+0x8a>
c0de12bc:	79c2      	ldrb	r2, [r0, #7]
c0de12be:	7981      	ldrb	r1, [r0, #6]
c0de12c0:	7a03      	ldrb	r3, [r0, #8]
c0de12c2:	0110      	lsls	r0, r2, #4
c0de12c4:	ea40 1011 	orr.w	r0, r0, r1, lsr #4
c0de12c8:	0319      	lsls	r1, r3, #12
c0de12ca:	e008      	b.n	c0de12de <polyt0_unpack_idx+0x8a>
c0de12cc:	7a01      	ldrb	r1, [r0, #8]
c0de12ce:	7a40      	ldrb	r0, [r0, #9]
c0de12d0:	01c0      	lsls	r0, r0, #7
c0de12d2:	0849      	lsrs	r1, r1, #1
c0de12d4:	e003      	b.n	c0de12de <polyt0_unpack_idx+0x8a>
c0de12d6:	7ac1      	ldrb	r1, [r0, #11]
c0de12d8:	7b00      	ldrb	r0, [r0, #12]
c0de12da:	0140      	lsls	r0, r0, #5
c0de12dc:	08c9      	lsrs	r1, r1, #3
c0de12de:	4308      	orrs	r0, r1
c0de12e0:	f36f 305f 	bfc	r0, #13, #19
c0de12e4:	f5c0 5080 	rsb	r0, r0, #4096	@ 0x1000
c0de12e8:	4770      	bx	lr
	...

c0de12ec <poly_schoolbook_t1>:
c0de12ec:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de12f0:	4614      	mov	r4, r2
c0de12f2:	468b      	mov	fp, r1
c0de12f4:	2200      	movs	r2, #0
c0de12f6:	2100      	movs	r1, #0
c0de12f8:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de12fc:	d003      	beq.n	c0de1306 <poly_schoolbook_t1+0x1a>
c0de12fe:	f840 2021 	str.w	r2, [r0, r1, lsl #2]
c0de1302:	3101      	adds	r1, #1
c0de1304:	e7f8      	b.n	c0de12f8 <poly_schoolbook_t1+0xc>
c0de1306:	f10b 053c 	add.w	r5, fp, #60	@ 0x3c
c0de130a:	2700      	movs	r7, #0
c0de130c:	f04f 0a00 	mov.w	sl, #0
c0de1310:	2600      	movs	r6, #0
c0de1312:	9002      	str	r0, [sp, #8]
c0de1314:	2f40      	cmp	r7, #64	@ 0x40
c0de1316:	d006      	beq.n	c0de1326 <poly_schoolbook_t1+0x3a>
c0de1318:	f000 fb2a 	bl	c0de1970 <OUTLINED_FUNCTION_2>
c0de131c:	430e      	orrs	r6, r1
c0de131e:	ea4a 0a00 	orr.w	sl, sl, r0
c0de1322:	3708      	adds	r7, #8
c0de1324:	e7f6      	b.n	c0de1314 <poly_schoolbook_t1+0x28>
c0de1326:	4832      	ldr	r0, [pc, #200]	@ (c0de13f0 <poly_schoolbook_t1+0x104>)
c0de1328:	2200      	movs	r2, #0
c0de132a:	f8cd b000 	str.w	fp, [sp]
c0de132e:	4680      	mov	r8, r0
c0de1330:	2a27      	cmp	r2, #39	@ 0x27
c0de1332:	bf08      	it	eq
c0de1334:	e8bd 8dff 	ldmiaeq.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de1338:	f81b 0002 	ldrb.w	r0, [fp, r2]
c0de133c:	ea5f 71ca 	movs.w	r1, sl, lsl #31
c0de1340:	9203      	str	r2, [sp, #12]
c0de1342:	f5c0 7780 	rsb	r7, r0, #256	@ 0x100
c0de1346:	d112      	bne.n	c0de136e <poly_schoolbook_t1+0x82>
c0de1348:	9902      	ldr	r1, [sp, #8]
c0de134a:	9601      	str	r6, [sp, #4]
c0de134c:	2500      	movs	r5, #0
c0de134e:	eb01 0680 	add.w	r6, r1, r0, lsl #2
c0de1352:	42af      	cmp	r7, r5
c0de1354:	d01e      	beq.n	c0de1394 <poly_schoolbook_t1+0xa8>
c0de1356:	4620      	mov	r0, r4
c0de1358:	4629      	mov	r1, r5
c0de135a:	f000 f84b 	bl	c0de13f4 <polyt1_unpack_idx>
c0de135e:	f856 1025 	ldr.w	r1, [r6, r5, lsl #2]
c0de1362:	eb01 3040 	add.w	r0, r1, r0, lsl #13
c0de1366:	f846 0025 	str.w	r0, [r6, r5, lsl #2]
c0de136a:	3501      	adds	r5, #1
c0de136c:	e7f1      	b.n	c0de1352 <poly_schoolbook_t1+0x66>
c0de136e:	9902      	ldr	r1, [sp, #8]
c0de1370:	2500      	movs	r5, #0
c0de1372:	eb01 0b80 	add.w	fp, r1, r0, lsl #2
c0de1376:	42af      	cmp	r7, r5
c0de1378:	d01f      	beq.n	c0de13ba <poly_schoolbook_t1+0xce>
c0de137a:	4620      	mov	r0, r4
c0de137c:	4629      	mov	r1, r5
c0de137e:	f000 f839 	bl	c0de13f4 <polyt1_unpack_idx>
c0de1382:	f85b 1025 	ldr.w	r1, [fp, r5, lsl #2]
c0de1386:	4642      	mov	r2, r8
c0de1388:	fb00 1008 	mla	r0, r0, r8, r1
c0de138c:	f84b 0025 	str.w	r0, [fp, r5, lsl #2]
c0de1390:	3501      	adds	r5, #1
c0de1392:	e7f0      	b.n	c0de1376 <poly_schoolbook_t1+0x8a>
c0de1394:	f5a6 6580 	sub.w	r5, r6, #1024	@ 0x400
c0de1398:	9e01      	ldr	r6, [sp, #4]
c0de139a:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de139e:	d01f      	beq.n	c0de13e0 <poly_schoolbook_t1+0xf4>
c0de13a0:	4620      	mov	r0, r4
c0de13a2:	4639      	mov	r1, r7
c0de13a4:	f000 f826 	bl	c0de13f4 <polyt1_unpack_idx>
c0de13a8:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de13ac:	4642      	mov	r2, r8
c0de13ae:	fb00 1008 	mla	r0, r0, r8, r1
c0de13b2:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de13b6:	3701      	adds	r7, #1
c0de13b8:	e7ef      	b.n	c0de139a <poly_schoolbook_t1+0xae>
c0de13ba:	f5ab 6580 	sub.w	r5, fp, #1024	@ 0x400
c0de13be:	f8dd b000 	ldr.w	fp, [sp]
c0de13c2:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de13c6:	d00b      	beq.n	c0de13e0 <poly_schoolbook_t1+0xf4>
c0de13c8:	4620      	mov	r0, r4
c0de13ca:	4639      	mov	r1, r7
c0de13cc:	f000 f812 	bl	c0de13f4 <polyt1_unpack_idx>
c0de13d0:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de13d4:	eb01 3040 	add.w	r0, r1, r0, lsl #13
c0de13d8:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de13dc:	3701      	adds	r7, #1
c0de13de:	e7f0      	b.n	c0de13c2 <poly_schoolbook_t1+0xd6>
c0de13e0:	9a03      	ldr	r2, [sp, #12]
c0de13e2:	ea5f 0656 	movs.w	r6, r6, lsr #1
c0de13e6:	ea4f 0a3a 	mov.w	sl, sl, rrx
c0de13ea:	3201      	adds	r2, #1
c0de13ec:	e7a0      	b.n	c0de1330 <poly_schoolbook_t1+0x44>
c0de13ee:	bf00      	nop
c0de13f0:	ffffe000 	.word	0xffffe000

c0de13f4 <polyt1_unpack_idx>:
c0de13f4:	088a      	lsrs	r2, r1, #2
c0de13f6:	f001 0103 	and.w	r1, r1, #3
c0de13fa:	eb02 0282 	add.w	r2, r2, r2, lsl #2
c0de13fe:	2902      	cmp	r1, #2
c0de1400:	4410      	add	r0, r2
c0de1402:	d006      	beq.n	c0de1412 <polyt1_unpack_idx+0x1e>
c0de1404:	2901      	cmp	r1, #1
c0de1406:	d009      	beq.n	c0de141c <polyt1_unpack_idx+0x28>
c0de1408:	b969      	cbnz	r1, c0de1426 <polyt1_unpack_idx+0x32>
c0de140a:	7801      	ldrb	r1, [r0, #0]
c0de140c:	2208      	movs	r2, #8
c0de140e:	2301      	movs	r3, #1
c0de1410:	e00d      	b.n	c0de142e <polyt1_unpack_idx+0x3a>
c0de1412:	7881      	ldrb	r1, [r0, #2]
c0de1414:	2204      	movs	r2, #4
c0de1416:	2303      	movs	r3, #3
c0de1418:	0909      	lsrs	r1, r1, #4
c0de141a:	e008      	b.n	c0de142e <polyt1_unpack_idx+0x3a>
c0de141c:	7841      	ldrb	r1, [r0, #1]
c0de141e:	2206      	movs	r2, #6
c0de1420:	2302      	movs	r3, #2
c0de1422:	0889      	lsrs	r1, r1, #2
c0de1424:	e003      	b.n	c0de142e <polyt1_unpack_idx+0x3a>
c0de1426:	78c1      	ldrb	r1, [r0, #3]
c0de1428:	2202      	movs	r2, #2
c0de142a:	2304      	movs	r3, #4
c0de142c:	0989      	lsrs	r1, r1, #6
c0de142e:	5cc0      	ldrb	r0, [r0, r3]
c0de1430:	4090      	lsls	r0, r2
c0de1432:	f400 707f 	and.w	r0, r0, #1020	@ 0x3fc
c0de1436:	4308      	orrs	r0, r1
c0de1438:	4770      	bx	lr

c0de143a <polyw_pack>:
c0de143a:	b5b0      	push	{r4, r5, r7, lr}
c0de143c:	4605      	mov	r5, r0
c0de143e:	4608      	mov	r0, r1
c0de1440:	460c      	mov	r4, r1
c0de1442:	f000 fb23 	bl	c0de1a8c <pqcrystals_dilithium2_lowram_poly_reduce>
c0de1446:	4620      	mov	r0, r4
c0de1448:	f000 fb2f 	bl	c0de1aaa <pqcrystals_dilithium2_lowram_poly_caddq>
c0de144c:	2000      	movs	r0, #0
c0de144e:	f5b0 7f80 	cmp.w	r0, #256	@ 0x100
c0de1452:	bf08      	it	eq
c0de1454:	bdb0      	popeq	{r4, r5, r7, pc}
c0de1456:	f854 1020 	ldr.w	r1, [r4, r0, lsl #2]
c0de145a:	eb00 0240 	add.w	r2, r0, r0, lsl #1
c0de145e:	54a9      	strb	r1, [r5, r2]
c0de1460:	18a9      	adds	r1, r5, r2
c0de1462:	f854 2020 	ldr.w	r2, [r4, r0, lsl #2]
c0de1466:	0a12      	lsrs	r2, r2, #8
c0de1468:	704a      	strb	r2, [r1, #1]
c0de146a:	eb04 0280 	add.w	r2, r4, r0, lsl #2
c0de146e:	3001      	adds	r0, #1
c0de1470:	8852      	ldrh	r2, [r2, #2]
c0de1472:	708a      	strb	r2, [r1, #2]
c0de1474:	e7eb      	b.n	c0de144e <polyw_pack+0x14>

c0de1476 <polyw_unpack>:
c0de1476:	b5b0      	push	{r4, r5, r7, lr}
c0de1478:	2200      	movs	r2, #0
c0de147a:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de147e:	bf08      	it	eq
c0de1480:	bdb0      	popeq	{r4, r5, r7, pc}
c0de1482:	eb02 0342 	add.w	r3, r2, r2, lsl #1
c0de1486:	5ccc      	ldrb	r4, [r1, r3]
c0de1488:	440b      	add	r3, r1
c0de148a:	f840 4022 	str.w	r4, [r0, r2, lsl #2]
c0de148e:	785d      	ldrb	r5, [r3, #1]
c0de1490:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de1494:	f840 4022 	str.w	r4, [r0, r2, lsl #2]
c0de1498:	789b      	ldrb	r3, [r3, #2]
c0de149a:	ea44 4303 	orr.w	r3, r4, r3, lsl #16
c0de149e:	f840 3022 	str.w	r3, [r0, r2, lsl #2]
c0de14a2:	3201      	adds	r2, #1
c0de14a4:	e7e9      	b.n	c0de147a <polyw_unpack+0x4>

c0de14a6 <polyw_sub>:
c0de14a6:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de14a8:	3102      	adds	r1, #2
c0de14aa:	2300      	movs	r3, #0
c0de14ac:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
c0de14b0:	bf08      	it	eq
c0de14b2:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de14b4:	f811 5c02 	ldrb.w	r5, [r1, #-2]
c0de14b8:	f811 6c01 	ldrb.w	r6, [r1, #-1]
c0de14bc:	f811 7b03 	ldrb.w	r7, [r1], #3
c0de14c0:	f852 4023 	ldr.w	r4, [r2, r3, lsl #2]
c0de14c4:	ea45 2506 	orr.w	r5, r5, r6, lsl #8
c0de14c8:	ea45 4507 	orr.w	r5, r5, r7, lsl #16
c0de14cc:	1b2c      	subs	r4, r5, r4
c0de14ce:	f840 4023 	str.w	r4, [r0, r3, lsl #2]
c0de14d2:	3301      	adds	r3, #1
c0de14d4:	e7ea      	b.n	c0de14ac <polyw_sub+0x6>

c0de14d6 <poly_highbits>:
c0de14d6:	b5b0      	push	{r4, r5, r7, lr}
c0de14d8:	2200      	movs	r2, #0
c0de14da:	f642 430b 	movw	r3, #11275	@ 0x2c0b
c0de14de:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de14e2:	bf08      	it	eq
c0de14e4:	bdb0      	popeq	{r4, r5, r7, pc}
c0de14e6:	f851 4022 	ldr.w	r4, [r1, r2, lsl #2]
c0de14ea:	347f      	adds	r4, #127	@ 0x7f
c0de14ec:	11e4      	asrs	r4, r4, #7
c0de14ee:	435c      	muls	r4, r3
c0de14f0:	f504 0500 	add.w	r5, r4, #8388608	@ 0x800000
c0de14f4:	162d      	asrs	r5, r5, #24
c0de14f6:	f1b4 5f2e 	cmp.w	r4, #729808896	@ 0x2b800000
c0de14fa:	bfa8      	it	ge
c0de14fc:	2500      	movge	r5, #0
c0de14fe:	f840 5022 	str.w	r5, [r0, r2, lsl #2]
c0de1502:	3201      	adds	r2, #1
c0de1504:	e7eb      	b.n	c0de14de <poly_highbits+0x8>
	...

c0de1508 <poly_lowbits>:
c0de1508:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de150c:	4e13      	ldr	r6, [pc, #76]	@ (c0de155c <poly_lowbits+0x54>)
c0de150e:	4f15      	ldr	r7, [pc, #84]	@ (c0de1564 <poly_lowbits+0x5c>)
c0de1510:	2200      	movs	r2, #0
c0de1512:	f642 4c0b 	movw	ip, #11275	@ 0x2c0b
c0de1516:	f06f 0e01 	mvn.w	lr, #1
c0de151a:	46b0      	mov	r8, r6
c0de151c:	4e10      	ldr	r6, [pc, #64]	@ (c0de1560 <poly_lowbits+0x58>)
c0de151e:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de1522:	bf08      	it	eq
c0de1524:	e8bd 81f0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de1528:	f851 3022 	ldr.w	r3, [r1, r2, lsl #2]
c0de152c:	f103 047f 	add.w	r4, r3, #127	@ 0x7f
c0de1530:	11e4      	asrs	r4, r4, #7
c0de1532:	fb04 f40c 	mul.w	r4, r4, ip
c0de1536:	f504 0500 	add.w	r5, r4, #8388608	@ 0x800000
c0de153a:	f1b4 5f2e 	cmp.w	r4, #729808896	@ 0x2b800000
c0de153e:	4644      	mov	r4, r8
c0de1540:	ea0e 55e5 	and.w	r5, lr, r5, asr #23
c0de1544:	bfb8      	it	lt
c0de1546:	fb05 3308 	mlalt	r3, r5, r8, r3
c0de154a:	42bb      	cmp	r3, r7
c0de154c:	4634      	mov	r4, r6
c0de154e:	bfc8      	it	gt
c0de1550:	4433      	addgt	r3, r6
c0de1552:	f840 3022 	str.w	r3, [r0, r2, lsl #2]
c0de1556:	3201      	adds	r2, #1
c0de1558:	e7e1      	b.n	c0de151e <poly_lowbits+0x16>
c0de155a:	bf00      	nop
c0de155c:	fffe8c00 	.word	0xfffe8c00
c0de1560:	ff801fff 	.word	0xff801fff
c0de1564:	003ff000 	.word	0x003ff000

c0de1568 <unpack_sk_s1>:
c0de1568:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de156c:	eb01 1142 	add.w	r1, r1, r2, lsl #5
c0de1570:	3180      	adds	r1, #128	@ 0x80
c0de1572:	f001 bb1e 	b.w	c0de2bb2 <small_polyeta_unpack>

c0de1576 <unpack_sk_s2>:
c0de1576:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de157a:	eb01 1142 	add.w	r1, r1, r2, lsl #5
c0de157e:	f501 7100 	add.w	r1, r1, #512	@ 0x200
c0de1582:	f001 bb16 	b.w	c0de2bb2 <small_polyeta_unpack>

c0de1586 <polyw_add_idx>:
c0de1586:	b570      	push	{r4, r5, r6, lr}
c0de1588:	4604      	mov	r4, r0
c0de158a:	eb02 0542 	add.w	r5, r2, r2, lsl #1
c0de158e:	1966      	adds	r6, r4, r5
c0de1590:	5d40      	ldrb	r0, [r0, r5]
c0de1592:	7872      	ldrb	r2, [r6, #1]
c0de1594:	78b3      	ldrb	r3, [r6, #2]
c0de1596:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de159a:	ea40 4003 	orr.w	r0, r0, r3, lsl #16
c0de159e:	4408      	add	r0, r1
c0de15a0:	f000 fd88 	bl	c0de20b4 <pqcrystals_dilithium2_lowram_freeze>
c0de15a4:	0c01      	lsrs	r1, r0, #16
c0de15a6:	5560      	strb	r0, [r4, r5]
c0de15a8:	0a00      	lsrs	r0, r0, #8
c0de15aa:	70b1      	strb	r1, [r6, #2]
c0de15ac:	7070      	strb	r0, [r6, #1]
c0de15ae:	bd70      	pop	{r4, r5, r6, pc}

c0de15b0 <poly_uniform_pointwise_montgomery_polywadd_lowram_eth>:
c0de15b0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de15b4:	f5ad 7d06 	sub.w	sp, sp, #536	@ 0x218
c0de15b8:	f10d 0808 	add.w	r8, sp, #8
c0de15bc:	4683      	mov	fp, r0
c0de15be:	461e      	mov	r6, r3
c0de15c0:	4617      	mov	r7, r2
c0de15c2:	468a      	mov	sl, r1
c0de15c4:	4640      	mov	r0, r8
c0de15c6:	f7ff fc85 	bl	c0de0ed4 <inner_keccak256_init>
c0de15ca:	4640      	mov	r0, r8
c0de15cc:	4639      	mov	r1, r7
c0de15ce:	2220      	movs	r2, #32
c0de15d0:	f7ff fc91 	bl	c0de0ef6 <inner_keccak256_inject>
c0de15d4:	0a30      	lsrs	r0, r6, #8
c0de15d6:	f10d 0106 	add.w	r1, sp, #6
c0de15da:	2202      	movs	r2, #2
c0de15dc:	f88d 6006 	strb.w	r6, [sp, #6]
c0de15e0:	f88d 0007 	strb.w	r0, [sp, #7]
c0de15e4:	4640      	mov	r0, r8
c0de15e6:	f7ff fc86 	bl	c0de0ef6 <inner_keccak256_inject>
c0de15ea:	4640      	mov	r0, r8
c0de15ec:	f7ff fc95 	bl	c0de0f1a <inner_keccak256_flip>
c0de15f0:	4c10      	ldr	r4, [pc, #64]	@ (c0de1634 <poly_uniform_pointwise_montgomery_polywadd_lowram_eth+0x84>)
c0de15f2:	2700      	movs	r7, #0
c0de15f4:	f20d 260f 	addw	r6, sp, #527	@ 0x20f
c0de15f8:	4640      	mov	r0, r8
c0de15fa:	4631      	mov	r1, r6
c0de15fc:	2209      	movs	r2, #9
c0de15fe:	f7ff fca2 	bl	c0de0f46 <inner_keccak256_extract>
c0de1602:	2500      	movs	r5, #0
c0de1604:	2d06      	cmp	r5, #6
c0de1606:	bf98      	it	ls
c0de1608:	f5b7 7f80 	cmpls.w	r7, #256	@ 0x100
c0de160c:	d20b      	bcs.n	c0de1626 <poly_uniform_pointwise_montgomery_polywadd_lowram_eth+0x76>
c0de160e:	f000 f99a 	bl	c0de1946 <OUTLINED_FUNCTION_0>
c0de1612:	d806      	bhi.n	c0de1622 <poly_uniform_pointwise_montgomery_polywadd_lowram_eth+0x72>
c0de1614:	f85a 1027 	ldr.w	r1, [sl, r7, lsl #2]
c0de1618:	f000 f9b0 	bl	c0de197c <OUTLINED_FUNCTION_3>
c0de161c:	f000 f9b2 	bl	c0de1984 <OUTLINED_FUNCTION_4>
c0de1620:	3701      	adds	r7, #1
c0de1622:	3503      	adds	r5, #3
c0de1624:	e7ee      	b.n	c0de1604 <poly_uniform_pointwise_montgomery_polywadd_lowram_eth+0x54>
c0de1626:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de162a:	d3e5      	bcc.n	c0de15f8 <poly_uniform_pointwise_montgomery_polywadd_lowram_eth+0x48>
c0de162c:	f50d 7d06 	add.w	sp, sp, #536	@ 0x218
c0de1630:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de1634:	007fe000 	.word	0x007fe000

c0de1638 <polyz_unpack_inplace>:
c0de1638:	b5b0      	push	{r4, r5, r7, lr}
c0de163a:	7801      	ldrb	r1, [r0, #0]
c0de163c:	7883      	ldrb	r3, [r0, #2]
c0de163e:	7842      	ldrb	r2, [r0, #1]
c0de1640:	78c4      	ldrb	r4, [r0, #3]
c0de1642:	7a05      	ldrb	r5, [r0, #8]
c0de1644:	f363 4111 	bfi	r1, r3, #16, #2
c0de1648:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de164c:	79c2      	ldrb	r2, [r0, #7]
c0de164e:	f5c1 3100 	rsb	r1, r1, #131072	@ 0x20000
c0de1652:	6001      	str	r1, [r0, #0]
c0de1654:	7981      	ldrb	r1, [r0, #6]
c0de1656:	0092      	lsls	r2, r2, #2
c0de1658:	ea42 1291 	orr.w	r2, r2, r1, lsr #6
c0de165c:	f001 013f 	and.w	r1, r1, #63	@ 0x3f
c0de1660:	ea42 2285 	orr.w	r2, r2, r5, lsl #10
c0de1664:	7945      	ldrb	r5, [r0, #5]
c0de1666:	f5c2 3200 	rsb	r2, r2, #131072	@ 0x20000
c0de166a:	60c2      	str	r2, [r0, #12]
c0de166c:	7902      	ldrb	r2, [r0, #4]
c0de166e:	012d      	lsls	r5, r5, #4
c0de1670:	ea45 1512 	orr.w	r5, r5, r2, lsr #4
c0de1674:	ea45 3101 	orr.w	r1, r5, r1, lsl #12
c0de1678:	f5c1 3100 	rsb	r1, r1, #131072	@ 0x20000
c0de167c:	6081      	str	r1, [r0, #8]
c0de167e:	0899      	lsrs	r1, r3, #2
c0de1680:	f362 3191 	bfi	r1, r2, #14, #4
c0de1684:	ea41 1184 	orr.w	r1, r1, r4, lsl #6
c0de1688:	f5c1 3100 	rsb	r1, r1, #131072	@ 0x20000
c0de168c:	6041      	str	r1, [r0, #4]
c0de168e:	bdb0      	pop	{r4, r5, r7, pc}

c0de1690 <poly_uniform_gamma1_lowram_eth>:
c0de1690:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de1692:	b085      	sub	sp, #20
c0de1694:	4605      	mov	r5, r0
c0de1696:	4618      	mov	r0, r3
c0de1698:	461c      	mov	r4, r3
c0de169a:	4616      	mov	r6, r2
c0de169c:	460f      	mov	r7, r1
c0de169e:	f7ff fc19 	bl	c0de0ed4 <inner_keccak256_init>
c0de16a2:	4620      	mov	r0, r4
c0de16a4:	4639      	mov	r1, r7
c0de16a6:	2240      	movs	r2, #64	@ 0x40
c0de16a8:	f7ff fc25 	bl	c0de0ef6 <inner_keccak256_inject>
c0de16ac:	0a30      	lsrs	r0, r6, #8
c0de16ae:	f10d 0102 	add.w	r1, sp, #2
c0de16b2:	2202      	movs	r2, #2
c0de16b4:	f88d 6002 	strb.w	r6, [sp, #2]
c0de16b8:	f88d 0003 	strb.w	r0, [sp, #3]
c0de16bc:	4620      	mov	r0, r4
c0de16be:	f7ff fc1a 	bl	c0de0ef6 <inner_keccak256_inject>
c0de16c2:	4620      	mov	r0, r4
c0de16c4:	f7ff fc29 	bl	c0de0f1a <inner_keccak256_flip>
c0de16c8:	2700      	movs	r7, #0
c0de16ca:	ae01      	add	r6, sp, #4
c0de16cc:	2f40      	cmp	r7, #64	@ 0x40
c0de16ce:	bf04      	itt	eq
c0de16d0:	b005      	addeq	sp, #20
c0de16d2:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de16d4:	4620      	mov	r0, r4
c0de16d6:	4631      	mov	r1, r6
c0de16d8:	2209      	movs	r2, #9
c0de16da:	f7ff fc34 	bl	c0de0f46 <inner_keccak256_extract>
c0de16de:	4630      	mov	r0, r6
c0de16e0:	f7ff ffaa 	bl	c0de1638 <polyz_unpack_inplace>
c0de16e4:	2000      	movs	r0, #0
c0de16e6:	2804      	cmp	r0, #4
c0de16e8:	d005      	beq.n	c0de16f6 <poly_uniform_gamma1_lowram_eth+0x66>
c0de16ea:	f856 1020 	ldr.w	r1, [r6, r0, lsl #2]
c0de16ee:	f845 1020 	str.w	r1, [r5, r0, lsl #2]
c0de16f2:	3001      	adds	r0, #1
c0de16f4:	e7f7      	b.n	c0de16e6 <poly_uniform_gamma1_lowram_eth+0x56>
c0de16f6:	3510      	adds	r5, #16
c0de16f8:	3701      	adds	r7, #1
c0de16fa:	e7e7      	b.n	c0de16cc <poly_uniform_gamma1_lowram_eth+0x3c>

c0de16fc <poly_uniform_gamma1_add_lowram_eth>:
c0de16fc:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de1700:	b085      	sub	sp, #20
c0de1702:	f8dd a030 	ldr.w	sl, [sp, #48]	@ 0x30
c0de1706:	4605      	mov	r5, r0
c0de1708:	461f      	mov	r7, r3
c0de170a:	4690      	mov	r8, r2
c0de170c:	460c      	mov	r4, r1
c0de170e:	4650      	mov	r0, sl
c0de1710:	f7ff fbe0 	bl	c0de0ed4 <inner_keccak256_init>
c0de1714:	4650      	mov	r0, sl
c0de1716:	4641      	mov	r1, r8
c0de1718:	2240      	movs	r2, #64	@ 0x40
c0de171a:	f7ff fbec 	bl	c0de0ef6 <inner_keccak256_inject>
c0de171e:	0a38      	lsrs	r0, r7, #8
c0de1720:	f10d 0102 	add.w	r1, sp, #2
c0de1724:	2202      	movs	r2, #2
c0de1726:	f88d 7002 	strb.w	r7, [sp, #2]
c0de172a:	f88d 0003 	strb.w	r0, [sp, #3]
c0de172e:	4650      	mov	r0, sl
c0de1730:	f7ff fbe1 	bl	c0de0ef6 <inner_keccak256_inject>
c0de1734:	4650      	mov	r0, sl
c0de1736:	f7ff fbf0 	bl	c0de0f1a <inner_keccak256_flip>
c0de173a:	2600      	movs	r6, #0
c0de173c:	af01      	add	r7, sp, #4
c0de173e:	2e40      	cmp	r6, #64	@ 0x40
c0de1740:	d011      	beq.n	c0de1766 <poly_uniform_gamma1_add_lowram_eth+0x6a>
c0de1742:	4650      	mov	r0, sl
c0de1744:	4639      	mov	r1, r7
c0de1746:	2209      	movs	r2, #9
c0de1748:	f7ff fbfd 	bl	c0de0f46 <inner_keccak256_extract>
c0de174c:	4638      	mov	r0, r7
c0de174e:	f7ff ff73 	bl	c0de1638 <polyz_unpack_inplace>
c0de1752:	2000      	movs	r0, #0
c0de1754:	2804      	cmp	r0, #4
c0de1756:	d002      	beq.n	c0de175e <poly_uniform_gamma1_add_lowram_eth+0x62>
c0de1758:	f000 f901 	bl	c0de195e <OUTLINED_FUNCTION_1>
c0de175c:	e7fa      	b.n	c0de1754 <poly_uniform_gamma1_add_lowram_eth+0x58>
c0de175e:	3410      	adds	r4, #16
c0de1760:	3510      	adds	r5, #16
c0de1762:	3601      	adds	r6, #1
c0de1764:	e7eb      	b.n	c0de173e <poly_uniform_gamma1_add_lowram_eth+0x42>
c0de1766:	b005      	add	sp, #20
c0de1768:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}

c0de176c <poly_make_hint_lowram>:
c0de176c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de1770:	4686      	mov	lr, r0
c0de1772:	481a      	ldr	r0, [pc, #104]	@ (c0de17dc <poly_make_hint_lowram+0x70>)
c0de1774:	1c93      	adds	r3, r2, #2
c0de1776:	468c      	mov	ip, r1
c0de1778:	2200      	movs	r2, #0
c0de177a:	f642 450b 	movw	r5, #11275	@ 0x2c0b
c0de177e:	2600      	movs	r6, #0
c0de1780:	4680      	mov	r8, r0
c0de1782:	f5b6 7f80 	cmp.w	r6, #256	@ 0x100
c0de1786:	d026      	beq.n	c0de17d6 <poly_make_hint_lowram+0x6a>
c0de1788:	f813 4c02 	ldrb.w	r4, [r3, #-2]
c0de178c:	f813 1c01 	ldrb.w	r1, [r3, #-1]
c0de1790:	f813 0b03 	ldrb.w	r0, [r3], #3
c0de1794:	f85c 7026 	ldr.w	r7, [ip, r6, lsl #2]
c0de1798:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
c0de179c:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de17a0:	307f      	adds	r0, #127	@ 0x7f
c0de17a2:	19c1      	adds	r1, r0, r7
c0de17a4:	4647      	mov	r7, r8
c0de17a6:	11c9      	asrs	r1, r1, #7
c0de17a8:	4369      	muls	r1, r5
c0de17aa:	f501 0400 	add.w	r4, r1, #8388608	@ 0x800000
c0de17ae:	1624      	asrs	r4, r4, #24
c0de17b0:	4541      	cmp	r1, r8
c0de17b2:	bfc8      	it	gt
c0de17b4:	2400      	movgt	r4, #0
c0de17b6:	09c0      	lsrs	r0, r0, #7
c0de17b8:	4368      	muls	r0, r5
c0de17ba:	f500 0100 	add.w	r1, r0, #8388608	@ 0x800000
c0de17be:	0e09      	lsrs	r1, r1, #24
c0de17c0:	4540      	cmp	r0, r8
c0de17c2:	bf88      	it	hi
c0de17c4:	2100      	movhi	r1, #0
c0de17c6:	1a60      	subs	r0, r4, r1
c0de17c8:	bf18      	it	ne
c0de17ca:	2001      	movne	r0, #1
c0de17cc:	f84e 0026 	str.w	r0, [lr, r6, lsl #2]
c0de17d0:	4402      	add	r2, r0
c0de17d2:	3601      	adds	r6, #1
c0de17d4:	e7d5      	b.n	c0de1782 <poly_make_hint_lowram+0x16>
c0de17d6:	4610      	mov	r0, r2
c0de17d8:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de17dc:	2b7fffff 	.word	0x2b7fffff

c0de17e0 <unpack_sig_h_indices>:
c0de17e0:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de17e4:	f503 6c12 	add.w	ip, r3, #2336	@ 0x920
c0de17e8:	b142      	cbz	r2, c0de17fc <unpack_sig_h_indices+0x1c>
c0de17ea:	eb02 0e0c 	add.w	lr, r2, ip
c0de17ee:	f81e 6f50 	ldrb.w	r6, [lr, #80]!
c0de17f2:	f81e 5c01 	ldrb.w	r5, [lr, #-1]
c0de17f6:	42b5      	cmp	r5, r6
c0de17f8:	d905      	bls.n	c0de1806 <unpack_sig_h_indices+0x26>
c0de17fa:	e006      	b.n	c0de180a <unpack_sig_h_indices+0x2a>
c0de17fc:	f893 6970 	ldrb.w	r6, [r3, #2416]	@ 0x970
c0de1800:	f503 6e17 	add.w	lr, r3, #2416	@ 0x970
c0de1804:	2500      	movs	r5, #0
c0de1806:	2e50      	cmp	r6, #80	@ 0x50
c0de1808:	d902      	bls.n	c0de1810 <unpack_sig_h_indices+0x30>
c0de180a:	2001      	movs	r0, #1
c0de180c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de1810:	eb03 0805 	add.w	r8, r3, r5
c0de1814:	2700      	movs	r7, #0
c0de1816:	19ea      	adds	r2, r5, r7
c0de1818:	42b2      	cmp	r2, r6
c0de181a:	d20e      	bcs.n	c0de183a <unpack_sig_h_indices+0x5a>
c0de181c:	eb08 0407 	add.w	r4, r8, r7
c0de1820:	42aa      	cmp	r2, r5
c0de1822:	f894 6920 	ldrb.w	r6, [r4, #2336]	@ 0x920
c0de1826:	d903      	bls.n	c0de1830 <unpack_sig_h_indices+0x50>
c0de1828:	f894 291f 	ldrb.w	r2, [r4, #2335]	@ 0x91f
c0de182c:	4296      	cmp	r6, r2
c0de182e:	d9ec      	bls.n	c0de180a <unpack_sig_h_indices+0x2a>
c0de1830:	55c6      	strb	r6, [r0, r7]
c0de1832:	3701      	adds	r7, #1
c0de1834:	f89e 6000 	ldrb.w	r6, [lr]
c0de1838:	e7ed      	b.n	c0de1816 <unpack_sig_h_indices+0x36>
c0de183a:	600f      	str	r7, [r1, #0]
c0de183c:	f893 0973 	ldrb.w	r0, [r3, #2419]	@ 0x973
c0de1840:	4601      	mov	r1, r0
c0de1842:	284f      	cmp	r0, #79	@ 0x4f
c0de1844:	d804      	bhi.n	c0de1850 <unpack_sig_h_indices+0x70>
c0de1846:	f81c 2001 	ldrb.w	r2, [ip, r1]
c0de184a:	1c48      	adds	r0, r1, #1
c0de184c:	2a00      	cmp	r2, #0
c0de184e:	d0f7      	beq.n	c0de1840 <unpack_sig_h_indices+0x60>
c0de1850:	2000      	movs	r0, #0
c0de1852:	2950      	cmp	r1, #80	@ 0x50
c0de1854:	bf38      	it	cc
c0de1856:	2001      	movcc	r0, #1
c0de1858:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0de185c <poly_use_hint_lowram>:
c0de185c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de1860:	4698      	mov	r8, r3
c0de1862:	4615      	mov	r5, r2
c0de1864:	460e      	mov	r6, r1
c0de1866:	4607      	mov	r7, r0
c0de1868:	2400      	movs	r4, #0
c0de186a:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de186e:	bf08      	it	eq
c0de1870:	e8bd 81f0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de1874:	4628      	mov	r0, r5
c0de1876:	4641      	mov	r1, r8
c0de1878:	b131      	cbz	r1, c0de1888 <poly_use_hint_lowram+0x2c>
c0de187a:	f810 2b01 	ldrb.w	r2, [r0], #1
c0de187e:	3901      	subs	r1, #1
c0de1880:	4294      	cmp	r4, r2
c0de1882:	d1f9      	bne.n	c0de1878 <poly_use_hint_lowram+0x1c>
c0de1884:	2101      	movs	r1, #1
c0de1886:	e000      	b.n	c0de188a <poly_use_hint_lowram+0x2e>
c0de1888:	2100      	movs	r1, #0
c0de188a:	f856 0024 	ldr.w	r0, [r6, r4, lsl #2]
c0de188e:	f000 fc4b 	bl	c0de2128 <pqcrystals_dilithium2_lowram_use_hint>
c0de1892:	f847 0024 	str.w	r0, [r7, r4, lsl #2]
c0de1896:	3401      	adds	r4, #1
c0de1898:	e7e7      	b.n	c0de186a <poly_use_hint_lowram+0xe>

c0de189a <pack_pk_rho>:
c0de189a:	2200      	movs	r2, #0
c0de189c:	2a20      	cmp	r2, #32
c0de189e:	bf08      	it	eq
c0de18a0:	4770      	bxeq	lr
c0de18a2:	5c8b      	ldrb	r3, [r1, r2]
c0de18a4:	5483      	strb	r3, [r0, r2]
c0de18a6:	3201      	adds	r2, #1
c0de18a8:	e7f8      	b.n	c0de189c <pack_pk_rho+0x2>

c0de18aa <pack_pk_t1>:
c0de18aa:	eb02 0282 	add.w	r2, r2, r2, lsl #2
c0de18ae:	eb00 1082 	add.w	r0, r0, r2, lsl #6
c0de18b2:	3020      	adds	r0, #32
c0de18b4:	f000 bb06 	b.w	c0de1ec4 <pqcrystals_dilithium2_lowram_polyt1_pack>

c0de18b8 <pack_sk_s1>:
c0de18b8:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de18bc:	eb00 1042 	add.w	r0, r0, r2, lsl #5
c0de18c0:	3080      	adds	r0, #128	@ 0x80
c0de18c2:	f000 ba66 	b.w	c0de1d92 <pqcrystals_dilithium2_lowram_polyeta_pack>

c0de18c6 <pack_sk_s2>:
c0de18c6:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de18ca:	eb00 1042 	add.w	r0, r0, r2, lsl #5
c0de18ce:	f500 7000 	add.w	r0, r0, #512	@ 0x200
c0de18d2:	f000 ba5e 	b.w	c0de1d92 <pqcrystals_dilithium2_lowram_polyeta_pack>

c0de18d6 <pack_sk_t0>:
c0de18d6:	f44f 73d0 	mov.w	r3, #416	@ 0x1a0
c0de18da:	fb02 0003 	mla	r0, r2, r3, r0
c0de18de:	f500 7060 	add.w	r0, r0, #896	@ 0x380
c0de18e2:	f000 bb13 	b.w	c0de1f0c <pqcrystals_dilithium2_lowram_polyt0_pack>

c0de18e6 <pack_sk_rho>:
c0de18e6:	2200      	movs	r2, #0
c0de18e8:	2a20      	cmp	r2, #32
c0de18ea:	bf08      	it	eq
c0de18ec:	4770      	bxeq	lr
c0de18ee:	5c8b      	ldrb	r3, [r1, r2]
c0de18f0:	5483      	strb	r3, [r0, r2]
c0de18f2:	3201      	adds	r2, #1
c0de18f4:	e7f8      	b.n	c0de18e8 <pack_sk_rho+0x2>

c0de18f6 <pack_sk_key>:
c0de18f6:	3020      	adds	r0, #32
c0de18f8:	2200      	movs	r2, #0
c0de18fa:	2a20      	cmp	r2, #32
c0de18fc:	bf08      	it	eq
c0de18fe:	4770      	bxeq	lr
c0de1900:	5c8b      	ldrb	r3, [r1, r2]
c0de1902:	5483      	strb	r3, [r0, r2]
c0de1904:	3201      	adds	r2, #1
c0de1906:	e7f8      	b.n	c0de18fa <pack_sk_key+0x4>

c0de1908 <pack_sk_tr>:
c0de1908:	3040      	adds	r0, #64	@ 0x40
c0de190a:	2200      	movs	r2, #0
c0de190c:	2a40      	cmp	r2, #64	@ 0x40
c0de190e:	bf08      	it	eq
c0de1910:	4770      	bxeq	lr
c0de1912:	5c8b      	ldrb	r3, [r1, r2]
c0de1914:	5483      	strb	r3, [r0, r2]
c0de1916:	3201      	adds	r2, #1
c0de1918:	e7f8      	b.n	c0de190c <pack_sk_tr+0x4>

c0de191a <pqcrystals_dilithium2_lowram_poly_pointwise_acc_montgomery>:
c0de191a:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de191c:	4614      	mov	r4, r2
c0de191e:	460d      	mov	r5, r1
c0de1920:	4606      	mov	r6, r0
c0de1922:	2700      	movs	r7, #0
c0de1924:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de1928:	bf08      	it	eq
c0de192a:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de192c:	f855 0027 	ldr.w	r0, [r5, r7, lsl #2]
c0de1930:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
c0de1934:	f000 f822 	bl	c0de197c <OUTLINED_FUNCTION_3>
c0de1938:	f856 1027 	ldr.w	r1, [r6, r7, lsl #2]
c0de193c:	4408      	add	r0, r1
c0de193e:	f846 0027 	str.w	r0, [r6, r7, lsl #2]
c0de1942:	3701      	adds	r7, #1
c0de1944:	e7ee      	b.n	c0de1924 <pqcrystals_dilithium2_lowram_poly_pointwise_acc_montgomery+0xa>

c0de1946 <OUTLINED_FUNCTION_0>:
c0de1946:	1971      	adds	r1, r6, r5
c0de1948:	5d70      	ldrb	r0, [r6, r5]
c0de194a:	784a      	ldrb	r2, [r1, #1]
c0de194c:	7889      	ldrb	r1, [r1, #2]
c0de194e:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de1952:	f001 017f 	and.w	r1, r1, #127	@ 0x7f
c0de1956:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de195a:	42a0      	cmp	r0, r4
c0de195c:	4770      	bx	lr

c0de195e <OUTLINED_FUNCTION_1>:
c0de195e:	f857 1020 	ldr.w	r1, [r7, r0, lsl #2]
c0de1962:	f854 2020 	ldr.w	r2, [r4, r0, lsl #2]
c0de1966:	4411      	add	r1, r2
c0de1968:	f845 1020 	str.w	r1, [r5, r0, lsl #2]
c0de196c:	3001      	adds	r0, #1
c0de196e:	4770      	bx	lr

c0de1970 <OUTLINED_FUNCTION_2>:
c0de1970:	f815 0b01 	ldrb.w	r0, [r5], #1
c0de1974:	2100      	movs	r1, #0
c0de1976:	463a      	mov	r2, r7
c0de1978:	f009 bb08 	b.w	c0deaf8c <__aeabi_llsl>

c0de197c <OUTLINED_FUNCTION_3>:
c0de197c:	fb81 0100 	smull	r0, r1, r1, r0
c0de1980:	f000 bb7a 	b.w	c0de2078 <pqcrystals_dilithium2_lowram_montgomery_reduce>

c0de1984 <OUTLINED_FUNCTION_4>:
c0de1984:	4601      	mov	r1, r0
c0de1986:	4658      	mov	r0, fp
c0de1988:	463a      	mov	r2, r7
c0de198a:	f7ff bdfc 	b.w	c0de1586 <polyw_add_idx>
	...

c0de1990 <pqcrystals_dilithium2_lowram_ntt>:
c0de1990:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de1994:	4604      	mov	r4, r0
c0de1996:	4817      	ldr	r0, [pc, #92]	@ (c0de19f4 <pqcrystals_dilithium2_lowram_ntt+0x64>)
c0de1998:	f04f 0880 	mov.w	r8, #128	@ 0x80
c0de199c:	f04f 0a00 	mov.w	sl, #0
c0de19a0:	4478      	add	r0, pc
c0de19a2:	9001      	str	r0, [sp, #4]
c0de19a4:	f1b8 0f00 	cmp.w	r8, #0
c0de19a8:	bf08      	it	eq
c0de19aa:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de19ae:	2700      	movs	r7, #0
c0de19b0:	2fff      	cmp	r7, #255	@ 0xff
c0de19b2:	d81c      	bhi.n	c0de19ee <pqcrystals_dilithium2_lowram_ntt+0x5e>
c0de19b4:	9801      	ldr	r0, [sp, #4]
c0de19b6:	f10a 0a01 	add.w	sl, sl, #1
c0de19ba:	eb07 0608 	add.w	r6, r7, r8
c0de19be:	4635      	mov	r5, r6
c0de19c0:	f850 b02a 	ldr.w	fp, [r0, sl, lsl #2]
c0de19c4:	42b7      	cmp	r7, r6
c0de19c6:	d210      	bcs.n	c0de19ea <pqcrystals_dilithium2_lowram_ntt+0x5a>
c0de19c8:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de19cc:	fb80 010b 	smull	r0, r1, r0, fp
c0de19d0:	f000 fb52 	bl	c0de2078 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de19d4:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
c0de19d8:	180a      	adds	r2, r1, r0
c0de19da:	1a08      	subs	r0, r1, r0
c0de19dc:	f844 2027 	str.w	r2, [r4, r7, lsl #2]
c0de19e0:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de19e4:	3501      	adds	r5, #1
c0de19e6:	3701      	adds	r7, #1
c0de19e8:	e7ec      	b.n	c0de19c4 <pqcrystals_dilithium2_lowram_ntt+0x34>
c0de19ea:	462f      	mov	r7, r5
c0de19ec:	e7e0      	b.n	c0de19b0 <pqcrystals_dilithium2_lowram_ntt+0x20>
c0de19ee:	ea4f 0858 	mov.w	r8, r8, lsr #1
c0de19f2:	e7d7      	b.n	c0de19a4 <pqcrystals_dilithium2_lowram_ntt+0x14>
c0de19f4:	0000c5a8 	.word	0x0000c5a8

c0de19f8 <pqcrystals_dilithium2_lowram_invntt_tomont>:
c0de19f8:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de19fc:	4604      	mov	r4, r0
c0de19fe:	4822      	ldr	r0, [pc, #136]	@ (c0de1a88 <pqcrystals_dilithium2_lowram_invntt_tomont+0x90>)
c0de1a00:	f04f 0801 	mov.w	r8, #1
c0de1a04:	f44f 7a80 	mov.w	sl, #256	@ 0x100
c0de1a08:	4478      	add	r0, pc
c0de1a0a:	9001      	str	r0, [sp, #4]
c0de1a0c:	f1b8 0fff 	cmp.w	r8, #255	@ 0xff
c0de1a10:	d828      	bhi.n	c0de1a64 <pqcrystals_dilithium2_lowram_invntt_tomont+0x6c>
c0de1a12:	2700      	movs	r7, #0
c0de1a14:	2fff      	cmp	r7, #255	@ 0xff
c0de1a16:	d822      	bhi.n	c0de1a5e <pqcrystals_dilithium2_lowram_invntt_tomont+0x66>
c0de1a18:	9801      	ldr	r0, [sp, #4]
c0de1a1a:	f1aa 0a01 	sub.w	sl, sl, #1
c0de1a1e:	eb07 0608 	add.w	r6, r7, r8
c0de1a22:	4635      	mov	r5, r6
c0de1a24:	f850 002a 	ldr.w	r0, [r0, sl, lsl #2]
c0de1a28:	f1c0 0b00 	rsb	fp, r0, #0
c0de1a2c:	42b7      	cmp	r7, r6
c0de1a2e:	d214      	bcs.n	c0de1a5a <pqcrystals_dilithium2_lowram_invntt_tomont+0x62>
c0de1a30:	f854 0027 	ldr.w	r0, [r4, r7, lsl #2]
c0de1a34:	f854 1025 	ldr.w	r1, [r4, r5, lsl #2]
c0de1a38:	4401      	add	r1, r0
c0de1a3a:	f844 1027 	str.w	r1, [r4, r7, lsl #2]
c0de1a3e:	f854 1025 	ldr.w	r1, [r4, r5, lsl #2]
c0de1a42:	1a40      	subs	r0, r0, r1
c0de1a44:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de1a48:	fb80 010b 	smull	r0, r1, r0, fp
c0de1a4c:	f000 fb14 	bl	c0de2078 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de1a50:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de1a54:	3501      	adds	r5, #1
c0de1a56:	3701      	adds	r7, #1
c0de1a58:	e7e8      	b.n	c0de1a2c <pqcrystals_dilithium2_lowram_invntt_tomont+0x34>
c0de1a5a:	462f      	mov	r7, r5
c0de1a5c:	e7da      	b.n	c0de1a14 <pqcrystals_dilithium2_lowram_invntt_tomont+0x1c>
c0de1a5e:	ea4f 0848 	mov.w	r8, r8, lsl #1
c0de1a62:	e7d3      	b.n	c0de1a0c <pqcrystals_dilithium2_lowram_invntt_tomont+0x14>
c0de1a64:	2500      	movs	r5, #0
c0de1a66:	f24a 36fa 	movw	r6, #41978	@ 0xa3fa
c0de1a6a:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
c0de1a6e:	bf08      	it	eq
c0de1a70:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de1a74:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de1a78:	fb80 0106 	smull	r0, r1, r0, r6
c0de1a7c:	f000 fafc 	bl	c0de2078 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de1a80:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de1a84:	3501      	adds	r5, #1
c0de1a86:	e7f0      	b.n	c0de1a6a <pqcrystals_dilithium2_lowram_invntt_tomont+0x72>
c0de1a88:	0000c540 	.word	0x0000c540

c0de1a8c <pqcrystals_dilithium2_lowram_poly_reduce>:
c0de1a8c:	b5b0      	push	{r4, r5, r7, lr}
c0de1a8e:	4604      	mov	r4, r0
c0de1a90:	2500      	movs	r5, #0
c0de1a92:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
c0de1a96:	bf08      	it	eq
c0de1a98:	bdb0      	popeq	{r4, r5, r7, pc}
c0de1a9a:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de1a9e:	f000 faf7 	bl	c0de2090 <pqcrystals_dilithium2_lowram_reduce32>
c0de1aa2:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de1aa6:	3501      	adds	r5, #1
c0de1aa8:	e7f3      	b.n	c0de1a92 <pqcrystals_dilithium2_lowram_poly_reduce+0x6>

c0de1aaa <pqcrystals_dilithium2_lowram_poly_caddq>:
c0de1aaa:	b5b0      	push	{r4, r5, r7, lr}
c0de1aac:	4604      	mov	r4, r0
c0de1aae:	2500      	movs	r5, #0
c0de1ab0:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
c0de1ab4:	bf08      	it	eq
c0de1ab6:	bdb0      	popeq	{r4, r5, r7, pc}
c0de1ab8:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de1abc:	f000 faf2 	bl	c0de20a4 <pqcrystals_dilithium2_lowram_caddq>
c0de1ac0:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de1ac4:	3501      	adds	r5, #1
c0de1ac6:	e7f3      	b.n	c0de1ab0 <pqcrystals_dilithium2_lowram_poly_caddq+0x6>

c0de1ac8 <pqcrystals_dilithium2_lowram_poly_add>:
c0de1ac8:	b5b0      	push	{r4, r5, r7, lr}
c0de1aca:	2300      	movs	r3, #0
c0de1acc:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
c0de1ad0:	bf08      	it	eq
c0de1ad2:	bdb0      	popeq	{r4, r5, r7, pc}
c0de1ad4:	f851 4023 	ldr.w	r4, [r1, r3, lsl #2]
c0de1ad8:	f852 5023 	ldr.w	r5, [r2, r3, lsl #2]
c0de1adc:	442c      	add	r4, r5
c0de1ade:	f840 4023 	str.w	r4, [r0, r3, lsl #2]
c0de1ae2:	3301      	adds	r3, #1
c0de1ae4:	e7f2      	b.n	c0de1acc <pqcrystals_dilithium2_lowram_poly_add+0x4>

c0de1ae6 <pqcrystals_dilithium2_lowram_poly_ntt>:
c0de1ae6:	f7ff bf53 	b.w	c0de1990 <pqcrystals_dilithium2_lowram_ntt>

c0de1aea <pqcrystals_dilithium2_lowram_poly_invntt_tomont>:
c0de1aea:	f7ff bf85 	b.w	c0de19f8 <pqcrystals_dilithium2_lowram_invntt_tomont>

c0de1aee <pqcrystals_dilithium2_lowram_poly_pointwise_montgomery>:
c0de1aee:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de1af0:	f000 fab5 	bl	c0de205e <OUTLINED_FUNCTION_0>
c0de1af4:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de1af8:	bf08      	it	eq
c0de1afa:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de1afc:	f855 0027 	ldr.w	r0, [r5, r7, lsl #2]
c0de1b00:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
c0de1b04:	fb81 0100 	smull	r0, r1, r1, r0
c0de1b08:	f000 fab6 	bl	c0de2078 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de1b0c:	f846 0027 	str.w	r0, [r6, r7, lsl #2]
c0de1b10:	3701      	adds	r7, #1
c0de1b12:	e7ef      	b.n	c0de1af4 <pqcrystals_dilithium2_lowram_poly_pointwise_montgomery+0x6>

c0de1b14 <pqcrystals_dilithium2_lowram_poly_power2round>:
c0de1b14:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de1b16:	f000 faa2 	bl	c0de205e <OUTLINED_FUNCTION_0>
c0de1b1a:	f5b7 6f80 	cmp.w	r7, #1024	@ 0x400
c0de1b1e:	bf08      	it	eq
c0de1b20:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de1b22:	59e1      	ldr	r1, [r4, r7]
c0de1b24:	19e8      	adds	r0, r5, r7
c0de1b26:	f000 fad5 	bl	c0de20d4 <pqcrystals_dilithium2_lowram_power2round>
c0de1b2a:	51f0      	str	r0, [r6, r7]
c0de1b2c:	3704      	adds	r7, #4
c0de1b2e:	e7f4      	b.n	c0de1b1a <pqcrystals_dilithium2_lowram_poly_power2round+0x6>

c0de1b30 <pqcrystals_dilithium2_lowram_poly_chknorm>:
c0de1b30:	4a09      	ldr	r2, [pc, #36]	@ (c0de1b58 <pqcrystals_dilithium2_lowram_poly_chknorm+0x28>)
c0de1b32:	4291      	cmp	r1, r2
c0de1b34:	dc0e      	bgt.n	c0de1b54 <pqcrystals_dilithium2_lowram_poly_chknorm+0x24>
c0de1b36:	2200      	movs	r2, #0
c0de1b38:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de1b3c:	bf04      	itt	eq
c0de1b3e:	2000      	moveq	r0, #0
c0de1b40:	4770      	bxeq	lr
c0de1b42:	f850 3022 	ldr.w	r3, [r0, r2, lsl #2]
c0de1b46:	2b00      	cmp	r3, #0
c0de1b48:	bf48      	it	mi
c0de1b4a:	eba3 0343 	submi.w	r3, r3, r3, lsl #1
c0de1b4e:	3201      	adds	r2, #1
c0de1b50:	428b      	cmp	r3, r1
c0de1b52:	dbf1      	blt.n	c0de1b38 <pqcrystals_dilithium2_lowram_poly_chknorm+0x8>
c0de1b54:	2001      	movs	r0, #1
c0de1b56:	4770      	bx	lr
c0de1b58:	000ffc00 	.word	0x000ffc00

c0de1b5c <pqcrystals_dilithium2_lowram_poly_uniform>:
c0de1b5c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1b60:	f5ad 6daa 	sub.w	sp, sp, #1360	@ 0x550
c0de1b64:	46e8      	mov	r8, sp
c0de1b66:	4683      	mov	fp, r0
c0de1b68:	460d      	mov	r5, r1
c0de1b6a:	f8ad 254e 	strh.w	r2, [sp, #1358]	@ 0x54e
c0de1b6e:	4640      	mov	r0, r8
c0de1b70:	f7ff f9b0 	bl	c0de0ed4 <inner_keccak256_init>
c0de1b74:	4640      	mov	r0, r8
c0de1b76:	4629      	mov	r1, r5
c0de1b78:	2220      	movs	r2, #32
c0de1b7a:	f7ff f9bc 	bl	c0de0ef6 <inner_keccak256_inject>
c0de1b7e:	f20d 514e 	addw	r1, sp, #1358	@ 0x54e
c0de1b82:	4640      	mov	r0, r8
c0de1b84:	2202      	movs	r2, #2
c0de1b86:	f7ff f9b6 	bl	c0de0ef6 <inner_keccak256_inject>
c0de1b8a:	4640      	mov	r0, r8
c0de1b8c:	f7ff f9c5 	bl	c0de0f1a <inner_keccak256_flip>
c0de1b90:	ae81      	add	r6, sp, #516	@ 0x204
c0de1b92:	4640      	mov	r0, r8
c0de1b94:	f44f 7252 	mov.w	r2, #840	@ 0x348
c0de1b98:	f44f 7752 	mov.w	r7, #840	@ 0x348
c0de1b9c:	4631      	mov	r1, r6
c0de1b9e:	f7ff f9d2 	bl	c0de0f46 <inner_keccak256_extract>
c0de1ba2:	4658      	mov	r0, fp
c0de1ba4:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de1ba8:	4632      	mov	r2, r6
c0de1baa:	f44f 7352 	mov.w	r3, #840	@ 0x348
c0de1bae:	f000 f827 	bl	c0de1c00 <rej_uniform>
c0de1bb2:	4605      	mov	r5, r0
c0de1bb4:	f04f 0a03 	mov.w	sl, #3
c0de1bb8:	2dff      	cmp	r5, #255	@ 0xff
c0de1bba:	d81d      	bhi.n	c0de1bf8 <pqcrystals_dilithium2_lowram_poly_uniform+0x9c>
c0de1bbc:	fbb7 f0fa 	udiv	r0, r7, sl
c0de1bc0:	4631      	mov	r1, r6
c0de1bc2:	eb00 0040 	add.w	r0, r0, r0, lsl #1
c0de1bc6:	1a3c      	subs	r4, r7, r0
c0de1bc8:	42b8      	cmp	r0, r7
c0de1bca:	d004      	beq.n	c0de1bd6 <pqcrystals_dilithium2_lowram_poly_uniform+0x7a>
c0de1bcc:	5c0a      	ldrb	r2, [r1, r0]
c0de1bce:	3f01      	subs	r7, #1
c0de1bd0:	700a      	strb	r2, [r1, #0]
c0de1bd2:	3101      	adds	r1, #1
c0de1bd4:	e7f8      	b.n	c0de1bc8 <pqcrystals_dilithium2_lowram_poly_uniform+0x6c>
c0de1bd6:	1931      	adds	r1, r6, r4
c0de1bd8:	4640      	mov	r0, r8
c0de1bda:	22a8      	movs	r2, #168	@ 0xa8
c0de1bdc:	f7ff f9b3 	bl	c0de0f46 <inner_keccak256_extract>
c0de1be0:	f044 07a8 	orr.w	r7, r4, #168	@ 0xa8
c0de1be4:	eb0b 0085 	add.w	r0, fp, r5, lsl #2
c0de1be8:	f5c5 7180 	rsb	r1, r5, #256	@ 0x100
c0de1bec:	4632      	mov	r2, r6
c0de1bee:	463b      	mov	r3, r7
c0de1bf0:	f000 f806 	bl	c0de1c00 <rej_uniform>
c0de1bf4:	4405      	add	r5, r0
c0de1bf6:	e7df      	b.n	c0de1bb8 <pqcrystals_dilithium2_lowram_poly_uniform+0x5c>
c0de1bf8:	f50d 6daa 	add.w	sp, sp, #1360	@ 0x550
c0de1bfc:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de1c00 <rej_uniform>:
c0de1c00:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de1c02:	4c0f      	ldr	r4, [pc, #60]	@ (c0de1c40 <rej_uniform+0x40>)
c0de1c04:	4684      	mov	ip, r0
c0de1c06:	2000      	movs	r0, #0
c0de1c08:	2700      	movs	r7, #0
c0de1c0a:	46a6      	mov	lr, r4
c0de1c0c:	4288      	cmp	r0, r1
c0de1c0e:	d215      	bcs.n	c0de1c3c <rej_uniform+0x3c>
c0de1c10:	1cfe      	adds	r6, r7, #3
c0de1c12:	429e      	cmp	r6, r3
c0de1c14:	d812      	bhi.n	c0de1c3c <rej_uniform+0x3c>
c0de1c16:	5dd4      	ldrb	r4, [r2, r7]
c0de1c18:	4417      	add	r7, r2
c0de1c1a:	787d      	ldrb	r5, [r7, #1]
c0de1c1c:	78bf      	ldrb	r7, [r7, #2]
c0de1c1e:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de1c22:	f007 057f 	and.w	r5, r7, #127	@ 0x7f
c0de1c26:	4637      	mov	r7, r6
c0de1c28:	ea44 4405 	orr.w	r4, r4, r5, lsl #16
c0de1c2c:	4675      	mov	r5, lr
c0de1c2e:	4574      	cmp	r4, lr
c0de1c30:	d8ec      	bhi.n	c0de1c0c <rej_uniform+0xc>
c0de1c32:	f84c 4020 	str.w	r4, [ip, r0, lsl #2]
c0de1c36:	3001      	adds	r0, #1
c0de1c38:	4637      	mov	r7, r6
c0de1c3a:	e7e7      	b.n	c0de1c0c <rej_uniform+0xc>
c0de1c3c:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de1c3e:	bf00      	nop
c0de1c40:	007fe000 	.word	0x007fe000

c0de1c44 <pqcrystals_dilithium2_lowram_poly_uniform_eta>:
c0de1c44:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1c48:	f5ad 7d0a 	sub.w	sp, sp, #552	@ 0x228
c0de1c4c:	f8ad 2226 	strh.w	r2, [sp, #550]	@ 0x226
c0de1c50:	ac08      	add	r4, sp, #32
c0de1c52:	4682      	mov	sl, r0
c0de1c54:	460e      	mov	r6, r1
c0de1c56:	4620      	mov	r0, r4
c0de1c58:	f7ff f93c 	bl	c0de0ed4 <inner_keccak256_init>
c0de1c5c:	4620      	mov	r0, r4
c0de1c5e:	4631      	mov	r1, r6
c0de1c60:	2240      	movs	r2, #64	@ 0x40
c0de1c62:	f7ff f948 	bl	c0de0ef6 <inner_keccak256_inject>
c0de1c66:	f20d 2126 	addw	r1, sp, #550	@ 0x226
c0de1c6a:	4620      	mov	r0, r4
c0de1c6c:	2202      	movs	r2, #2
c0de1c6e:	f7ff f942 	bl	c0de0ef6 <inner_keccak256_inject>
c0de1c72:	4620      	mov	r0, r4
c0de1c74:	f7ff f951 	bl	c0de0f1a <inner_keccak256_flip>
c0de1c78:	f04f 0b00 	mov.w	fp, #0
c0de1c7c:	466e      	mov	r6, sp
c0de1c7e:	f04f 08cd 	mov.w	r8, #205	@ 0xcd
c0de1c82:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de1c86:	d830      	bhi.n	c0de1cea <pqcrystals_dilithium2_lowram_poly_uniform_eta+0xa6>
c0de1c88:	a808      	add	r0, sp, #32
c0de1c8a:	4631      	mov	r1, r6
c0de1c8c:	2220      	movs	r2, #32
c0de1c8e:	f7ff f95a 	bl	c0de0f46 <inner_keccak256_extract>
c0de1c92:	eb0a 008b 	add.w	r0, sl, fp, lsl #2
c0de1c96:	f5cb 7280 	rsb	r2, fp, #256	@ 0x100
c0de1c9a:	2100      	movs	r1, #0
c0de1c9c:	2300      	movs	r3, #0
c0de1c9e:	4291      	cmp	r1, r2
c0de1ca0:	d221      	bcs.n	c0de1ce6 <pqcrystals_dilithium2_lowram_poly_uniform_eta+0xa2>
c0de1ca2:	2b1f      	cmp	r3, #31
c0de1ca4:	d81f      	bhi.n	c0de1ce6 <pqcrystals_dilithium2_lowram_poly_uniform_eta+0xa2>
c0de1ca6:	5cf4      	ldrb	r4, [r6, r3]
c0de1ca8:	f004 070f 	and.w	r7, r4, #15
c0de1cac:	2f0f      	cmp	r7, #15
c0de1cae:	d009      	beq.n	c0de1cc4 <pqcrystals_dilithium2_lowram_poly_uniform_eta+0x80>
c0de1cb0:	fb07 f508 	mul.w	r5, r7, r8
c0de1cb4:	0aad      	lsrs	r5, r5, #10
c0de1cb6:	eb05 0585 	add.w	r5, r5, r5, lsl #2
c0de1cba:	1bed      	subs	r5, r5, r7
c0de1cbc:	3502      	adds	r5, #2
c0de1cbe:	f840 5021 	str.w	r5, [r0, r1, lsl #2]
c0de1cc2:	3101      	adds	r1, #1
c0de1cc4:	0924      	lsrs	r4, r4, #4
c0de1cc6:	2c0f      	cmp	r4, #15
c0de1cc8:	d00b      	beq.n	c0de1ce2 <pqcrystals_dilithium2_lowram_poly_uniform_eta+0x9e>
c0de1cca:	4291      	cmp	r1, r2
c0de1ccc:	d209      	bcs.n	c0de1ce2 <pqcrystals_dilithium2_lowram_poly_uniform_eta+0x9e>
c0de1cce:	fb04 f508 	mul.w	r5, r4, r8
c0de1cd2:	0aad      	lsrs	r5, r5, #10
c0de1cd4:	eb05 0585 	add.w	r5, r5, r5, lsl #2
c0de1cd8:	1b2c      	subs	r4, r5, r4
c0de1cda:	3402      	adds	r4, #2
c0de1cdc:	f840 4021 	str.w	r4, [r0, r1, lsl #2]
c0de1ce0:	3101      	adds	r1, #1
c0de1ce2:	3301      	adds	r3, #1
c0de1ce4:	e7db      	b.n	c0de1c9e <pqcrystals_dilithium2_lowram_poly_uniform_eta+0x5a>
c0de1ce6:	448b      	add	fp, r1
c0de1ce8:	e7cb      	b.n	c0de1c82 <pqcrystals_dilithium2_lowram_poly_uniform_eta+0x3e>
c0de1cea:	f50d 7d0a 	add.w	sp, sp, #552	@ 0x228
c0de1cee:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de1cf2 <pqcrystals_dilithium2_lowram_polyz_unpack>:
c0de1cf2:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de1cf4:	3008      	adds	r0, #8
c0de1cf6:	f04f 0c00 	mov.w	ip, #0
c0de1cfa:	f5bc 7f10 	cmp.w	ip, #576	@ 0x240
c0de1cfe:	bf08      	it	eq
c0de1d00:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de1d02:	f811 300c 	ldrb.w	r3, [r1, ip]
c0de1d06:	eb01 040c 	add.w	r4, r1, ip
c0de1d0a:	f10c 0c09 	add.w	ip, ip, #9
c0de1d0e:	f840 3c08 	str.w	r3, [r0, #-8]
c0de1d12:	7865      	ldrb	r5, [r4, #1]
c0de1d14:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0de1d18:	f840 3c08 	str.w	r3, [r0, #-8]
c0de1d1c:	78a5      	ldrb	r5, [r4, #2]
c0de1d1e:	f365 4311 	bfi	r3, r5, #16, #2
c0de1d22:	f840 3c08 	str.w	r3, [r0, #-8]
c0de1d26:	f5c3 3300 	rsb	r3, r3, #131072	@ 0x20000
c0de1d2a:	78a5      	ldrb	r5, [r4, #2]
c0de1d2c:	08ae      	lsrs	r6, r5, #2
c0de1d2e:	f840 6c04 	str.w	r6, [r0, #-4]
c0de1d32:	78e6      	ldrb	r6, [r4, #3]
c0de1d34:	01b6      	lsls	r6, r6, #6
c0de1d36:	ea46 0595 	orr.w	r5, r6, r5, lsr #2
c0de1d3a:	f840 5c04 	str.w	r5, [r0, #-4]
c0de1d3e:	7926      	ldrb	r6, [r4, #4]
c0de1d40:	f366 3591 	bfi	r5, r6, #14, #4
c0de1d44:	f840 5c04 	str.w	r5, [r0, #-4]
c0de1d48:	f5c5 3500 	rsb	r5, r5, #131072	@ 0x20000
c0de1d4c:	7926      	ldrb	r6, [r4, #4]
c0de1d4e:	0937      	lsrs	r7, r6, #4
c0de1d50:	6007      	str	r7, [r0, #0]
c0de1d52:	7967      	ldrb	r7, [r4, #5]
c0de1d54:	013f      	lsls	r7, r7, #4
c0de1d56:	ea47 1616 	orr.w	r6, r7, r6, lsr #4
c0de1d5a:	6006      	str	r6, [r0, #0]
c0de1d5c:	79a7      	ldrb	r7, [r4, #6]
c0de1d5e:	f367 3611 	bfi	r6, r7, #12, #6
c0de1d62:	6006      	str	r6, [r0, #0]
c0de1d64:	f5c6 3600 	rsb	r6, r6, #131072	@ 0x20000
c0de1d68:	79a7      	ldrb	r7, [r4, #6]
c0de1d6a:	09ba      	lsrs	r2, r7, #6
c0de1d6c:	6042      	str	r2, [r0, #4]
c0de1d6e:	79e2      	ldrb	r2, [r4, #7]
c0de1d70:	0092      	lsls	r2, r2, #2
c0de1d72:	ea42 1297 	orr.w	r2, r2, r7, lsr #6
c0de1d76:	6042      	str	r2, [r0, #4]
c0de1d78:	7a24      	ldrb	r4, [r4, #8]
c0de1d7a:	6006      	str	r6, [r0, #0]
c0de1d7c:	f840 5c04 	str.w	r5, [r0, #-4]
c0de1d80:	f840 3c08 	str.w	r3, [r0, #-8]
c0de1d84:	ea42 2284 	orr.w	r2, r2, r4, lsl #10
c0de1d88:	f5c2 3200 	rsb	r2, r2, #131072	@ 0x20000
c0de1d8c:	6042      	str	r2, [r0, #4]
c0de1d8e:	3010      	adds	r0, #16
c0de1d90:	e7b3      	b.n	c0de1cfa <pqcrystals_dilithium2_lowram_polyz_unpack+0x8>

c0de1d92 <pqcrystals_dilithium2_lowram_polyeta_pack>:
c0de1d92:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1d96:	3001      	adds	r0, #1
c0de1d98:	2200      	movs	r2, #0
c0de1d9a:	2640      	movs	r6, #64	@ 0x40
c0de1d9c:	f5b2 6f80 	cmp.w	r2, #1024	@ 0x400
c0de1da0:	bf08      	it	eq
c0de1da2:	e8bd 8df0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de1da6:	188b      	adds	r3, r1, r2
c0de1da8:	f851 8002 	ldr.w	r8, [r1, r2]
c0de1dac:	2710      	movs	r7, #16
c0de1dae:	3220      	adds	r2, #32
c0de1db0:	f103 0b04 	add.w	fp, r3, #4
c0de1db4:	f103 0e10 	add.w	lr, r3, #16
c0de1db8:	69db      	ldr	r3, [r3, #28]
c0de1dba:	e89b 0830 	ldmia.w	fp, {r4, r5, fp}
c0de1dbe:	e89e 5400 	ldmia.w	lr, {sl, ip, lr}
c0de1dc2:	f1c5 0502 	rsb	r5, r5, #2
c0de1dc6:	eba6 1343 	sub.w	r3, r6, r3, lsl #5
c0de1dca:	eba7 04c4 	sub.w	r4, r7, r4, lsl #3
c0de1dce:	f1c8 0702 	rsb	r7, r8, #2
c0de1dd2:	b2ed      	uxtb	r5, r5
c0de1dd4:	433c      	orrs	r4, r7
c0de1dd6:	f1cc 0702 	rsb	r7, ip, #2
c0de1dda:	ea44 1485 	orr.w	r4, r4, r5, lsl #6
c0de1dde:	b2ff      	uxtb	r7, r7
c0de1de0:	f800 4c01 	strb.w	r4, [r0, #-1]
c0de1de4:	2408      	movs	r4, #8
c0de1de6:	eba4 048e 	sub.w	r4, r4, lr, lsl #2
c0de1dea:	ea44 0457 	orr.w	r4, r4, r7, lsr #1
c0de1dee:	4323      	orrs	r3, r4
c0de1df0:	2420      	movs	r4, #32
c0de1df2:	7043      	strb	r3, [r0, #1]
c0de1df4:	2304      	movs	r3, #4
c0de1df6:	eba4 140a 	sub.w	r4, r4, sl, lsl #4
c0de1dfa:	eba3 034b 	sub.w	r3, r3, fp, lsl #1
c0de1dfe:	ea43 0395 	orr.w	r3, r3, r5, lsr #2
c0de1e02:	4323      	orrs	r3, r4
c0de1e04:	ea43 13c7 	orr.w	r3, r3, r7, lsl #7
c0de1e08:	f800 3b03 	strb.w	r3, [r0], #3
c0de1e0c:	e7c6      	b.n	c0de1d9c <pqcrystals_dilithium2_lowram_polyeta_pack+0xa>

c0de1e0e <pqcrystals_dilithium2_lowram_poly_challenge_eth>:
c0de1e0e:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1e12:	f5ad 7d10 	sub.w	sp, sp, #576	@ 0x240
c0de1e16:	466e      	mov	r6, sp
c0de1e18:	4680      	mov	r8, r0
c0de1e1a:	460d      	mov	r5, r1
c0de1e1c:	4630      	mov	r0, r6
c0de1e1e:	f7ff f859 	bl	c0de0ed4 <inner_keccak256_init>
c0de1e22:	4630      	mov	r0, r6
c0de1e24:	4629      	mov	r1, r5
c0de1e26:	2220      	movs	r2, #32
c0de1e28:	f7ff f865 	bl	c0de0ef6 <inner_keccak256_inject>
c0de1e2c:	4630      	mov	r0, r6
c0de1e2e:	f7ff f874 	bl	c0de0f1a <inner_keccak256_flip>
c0de1e32:	ad80      	add	r5, sp, #512	@ 0x200
c0de1e34:	4630      	mov	r0, r6
c0de1e36:	2208      	movs	r2, #8
c0de1e38:	4629      	mov	r1, r5
c0de1e3a:	f7ff f884 	bl	c0de0f46 <inner_keccak256_extract>
c0de1e3e:	2600      	movs	r6, #0
c0de1e40:	462c      	mov	r4, r5
c0de1e42:	f04f 0b00 	mov.w	fp, #0
c0de1e46:	f04f 0a00 	mov.w	sl, #0
c0de1e4a:	2e40      	cmp	r6, #64	@ 0x40
c0de1e4c:	d007      	beq.n	c0de1e5e <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x50>
c0de1e4e:	f000 f90b 	bl	c0de2068 <OUTLINED_FUNCTION_1>
c0de1e52:	ea4a 0a01 	orr.w	sl, sl, r1
c0de1e56:	ea4b 0b00 	orr.w	fp, fp, r0
c0de1e5a:	3608      	adds	r6, #8
c0de1e5c:	e7f5      	b.n	c0de1e4a <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x3c>
c0de1e5e:	2000      	movs	r0, #0
c0de1e60:	2100      	movs	r1, #0
c0de1e62:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de1e66:	d003      	beq.n	c0de1e70 <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x62>
c0de1e68:	f848 0021 	str.w	r0, [r8, r1, lsl #2]
c0de1e6c:	3101      	adds	r1, #1
c0de1e6e:	e7f8      	b.n	c0de1e62 <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x54>
c0de1e70:	2000      	movs	r0, #0
c0de1e72:	24d9      	movs	r4, #217	@ 0xd9
c0de1e74:	466e      	mov	r6, sp
c0de1e76:	2700      	movs	r7, #0
c0de1e78:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de1e7c:	d01e      	beq.n	c0de1ebc <pqcrystals_dilithium2_lowram_poly_challenge_eth+0xae>
c0de1e7e:	42b8      	cmp	r0, r7
c0de1e80:	d306      	bcc.n	c0de1e90 <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x82>
c0de1e82:	4630      	mov	r0, r6
c0de1e84:	4629      	mov	r1, r5
c0de1e86:	2240      	movs	r2, #64	@ 0x40
c0de1e88:	2740      	movs	r7, #64	@ 0x40
c0de1e8a:	f7ff f85c 	bl	c0de0f46 <inner_keccak256_extract>
c0de1e8e:	2000      	movs	r0, #0
c0de1e90:	5c29      	ldrb	r1, [r5, r0]
c0de1e92:	3001      	adds	r0, #1
c0de1e94:	428c      	cmp	r4, r1
c0de1e96:	d3f2      	bcc.n	c0de1e7e <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x70>
c0de1e98:	f858 2021 	ldr.w	r2, [r8, r1, lsl #2]
c0de1e9c:	f848 2024 	str.w	r2, [r8, r4, lsl #2]
c0de1ea0:	ea5f 72cb 	movs.w	r2, fp, lsl #31
c0de1ea4:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
c0de1ea8:	bf08      	it	eq
c0de1eaa:	2201      	moveq	r2, #1
c0de1eac:	ea5f 0a5a 	movs.w	sl, sl, lsr #1
c0de1eb0:	f848 2021 	str.w	r2, [r8, r1, lsl #2]
c0de1eb4:	ea4f 0b3b 	mov.w	fp, fp, rrx
c0de1eb8:	3401      	adds	r4, #1
c0de1eba:	e7dd      	b.n	c0de1e78 <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x6a>
c0de1ebc:	f50d 7d10 	add.w	sp, sp, #576	@ 0x240
c0de1ec0:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de1ec4 <pqcrystals_dilithium2_lowram_polyt1_pack>:
c0de1ec4:	b5b0      	push	{r4, r5, r7, lr}
c0de1ec6:	3108      	adds	r1, #8
c0de1ec8:	2200      	movs	r2, #0
c0de1eca:	f5b2 7fa0 	cmp.w	r2, #320	@ 0x140
c0de1ece:	bf08      	it	eq
c0de1ed0:	bdb0      	popeq	{r4, r5, r7, pc}
c0de1ed2:	f851 3c08 	ldr.w	r3, [r1, #-8]
c0de1ed6:	5483      	strb	r3, [r0, r2]
c0de1ed8:	1883      	adds	r3, r0, r2
c0de1eda:	3205      	adds	r2, #5
c0de1edc:	e951 4502 	ldrd	r4, r5, [r1, #-8]
c0de1ee0:	00ad      	lsls	r5, r5, #2
c0de1ee2:	ea45 2414 	orr.w	r4, r5, r4, lsr #8
c0de1ee6:	705c      	strb	r4, [r3, #1]
c0de1ee8:	680d      	ldr	r5, [r1, #0]
c0de1eea:	f851 4c04 	ldr.w	r4, [r1, #-4]
c0de1eee:	012d      	lsls	r5, r5, #4
c0de1ef0:	ea45 1494 	orr.w	r4, r5, r4, lsr #6
c0de1ef4:	709c      	strb	r4, [r3, #2]
c0de1ef6:	e9d1 4500 	ldrd	r4, r5, [r1]
c0de1efa:	01ad      	lsls	r5, r5, #6
c0de1efc:	ea45 1414 	orr.w	r4, r5, r4, lsr #4
c0de1f00:	70dc      	strb	r4, [r3, #3]
c0de1f02:	684c      	ldr	r4, [r1, #4]
c0de1f04:	3110      	adds	r1, #16
c0de1f06:	08a4      	lsrs	r4, r4, #2
c0de1f08:	711c      	strb	r4, [r3, #4]
c0de1f0a:	e7de      	b.n	c0de1eca <pqcrystals_dilithium2_lowram_polyt1_pack+0x6>

c0de1f0c <pqcrystals_dilithium2_lowram_polyt0_pack>:
c0de1f0c:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de1f10:	311c      	adds	r1, #28
c0de1f12:	f04f 0c00 	mov.w	ip, #0
c0de1f16:	9000      	str	r0, [sp, #0]
c0de1f18:	f5bc 7fd0 	cmp.w	ip, #416	@ 0x1a0
c0de1f1c:	bf08      	it	eq
c0de1f1e:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de1f22:	f851 0c14 	ldr.w	r0, [r1, #-20]
c0de1f26:	e951 a504 	ldrd	sl, r5, [r1, #-16]
c0de1f2a:	e951 3807 	ldrd	r3, r8, [r1, #-28]
c0de1f2e:	e951 e602 	ldrd	lr, r6, [r1, #-8]
c0de1f32:	f851 7b20 	ldr.w	r7, [r1], #32
c0de1f36:	9001      	str	r0, [sp, #4]
c0de1f38:	9800      	ldr	r0, [sp, #0]
c0de1f3a:	f5c7 5780 	rsb	r7, r7, #4096	@ 0x1000
c0de1f3e:	f5c3 5b80 	rsb	fp, r3, #4096	@ 0x1000
c0de1f42:	f5c5 5580 	rsb	r5, r5, #4096	@ 0x1000
c0de1f46:	097b      	lsrs	r3, r7, #5
c0de1f48:	eb00 040c 	add.w	r4, r0, ip
c0de1f4c:	f800 b00c 	strb.w	fp, [r0, ip]
c0de1f50:	f10c 0c0d 	add.w	ip, ip, #13
c0de1f54:	7323      	strb	r3, [r4, #12]
c0de1f56:	f5c6 5380 	rsb	r3, r6, #4096	@ 0x1000
c0de1f5a:	089e      	lsrs	r6, r3, #2
c0de1f5c:	72a6      	strb	r6, [r4, #10]
c0de1f5e:	092e      	lsrs	r6, r5, #4
c0de1f60:	71e6      	strb	r6, [r4, #7]
c0de1f62:	f5ca 5680 	rsb	r6, sl, #4096	@ 0x1000
c0de1f66:	0872      	lsrs	r2, r6, #1
c0de1f68:	7162      	strb	r2, [r4, #5]
c0de1f6a:	f5c8 5280 	rsb	r2, r8, #4096	@ 0x1000
c0de1f6e:	08d0      	lsrs	r0, r2, #3
c0de1f70:	70a0      	strb	r0, [r4, #2]
c0de1f72:	00f8      	lsls	r0, r7, #3
c0de1f74:	ea40 2093 	orr.w	r0, r0, r3, lsr #10
c0de1f78:	019b      	lsls	r3, r3, #6
c0de1f7a:	72e0      	strb	r0, [r4, #11]
c0de1f7c:	f5ce 5080 	rsb	r0, lr, #4096	@ 0x1000
c0de1f80:	ea43 13d0 	orr.w	r3, r3, r0, lsr #7
c0de1f84:	0040      	lsls	r0, r0, #1
c0de1f86:	ea40 3015 	orr.w	r0, r0, r5, lsr #12
c0de1f8a:	7263      	strb	r3, [r4, #9]
c0de1f8c:	01f3      	lsls	r3, r6, #7
c0de1f8e:	7220      	strb	r0, [r4, #8]
c0de1f90:	0128      	lsls	r0, r5, #4
c0de1f92:	ea40 2056 	orr.w	r0, r0, r6, lsr #9
c0de1f96:	71a0      	strb	r0, [r4, #6]
c0de1f98:	9801      	ldr	r0, [sp, #4]
c0de1f9a:	f5c0 5080 	rsb	r0, r0, #4096	@ 0x1000
c0de1f9e:	ea43 1390 	orr.w	r3, r3, r0, lsr #6
c0de1fa2:	0080      	lsls	r0, r0, #2
c0de1fa4:	ea40 20d2 	orr.w	r0, r0, r2, lsr #11
c0de1fa8:	7123      	strb	r3, [r4, #4]
c0de1faa:	70e0      	strb	r0, [r4, #3]
c0de1fac:	0150      	lsls	r0, r2, #5
c0de1fae:	ea40 201b 	orr.w	r0, r0, fp, lsr #8
c0de1fb2:	7060      	strb	r0, [r4, #1]
c0de1fb4:	e7b0      	b.n	c0de1f18 <pqcrystals_dilithium2_lowram_polyt0_pack+0xc>

c0de1fb6 <pqcrystals_dilithium2_lowram_polyz_pack>:
c0de1fb6:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de1fb8:	3108      	adds	r1, #8
c0de1fba:	f04f 0e00 	mov.w	lr, #0
c0de1fbe:	f5be 7f10 	cmp.w	lr, #576	@ 0x240
c0de1fc2:	bf08      	it	eq
c0de1fc4:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de1fc6:	e951 3c02 	ldrd	r3, ip, [r1, #-8]
c0de1fca:	e8f1 5604 	ldrd	r5, r6, [r1], #16
c0de1fce:	eb00 070e 	add.w	r7, r0, lr
c0de1fd2:	f5c6 3600 	rsb	r6, r6, #131072	@ 0x20000
c0de1fd6:	f5c3 3300 	rsb	r3, r3, #131072	@ 0x20000
c0de1fda:	0ab4      	lsrs	r4, r6, #10
c0de1fdc:	f800 300e 	strb.w	r3, [r0, lr]
c0de1fe0:	f10e 0e09 	add.w	lr, lr, #9
c0de1fe4:	723c      	strb	r4, [r7, #8]
c0de1fe6:	08b4      	lsrs	r4, r6, #2
c0de1fe8:	71fc      	strb	r4, [r7, #7]
c0de1fea:	f5c5 3400 	rsb	r4, r5, #131072	@ 0x20000
c0de1fee:	0925      	lsrs	r5, r4, #4
c0de1ff0:	717d      	strb	r5, [r7, #5]
c0de1ff2:	f5cc 3500 	rsb	r5, ip, #131072	@ 0x20000
c0de1ff6:	09aa      	lsrs	r2, r5, #6
c0de1ff8:	70fa      	strb	r2, [r7, #3]
c0de1ffa:	0a1a      	lsrs	r2, r3, #8
c0de1ffc:	707a      	strb	r2, [r7, #1]
c0de1ffe:	01b2      	lsls	r2, r6, #6
c0de2000:	ea42 3214 	orr.w	r2, r2, r4, lsr #12
c0de2004:	71ba      	strb	r2, [r7, #6]
c0de2006:	0122      	lsls	r2, r4, #4
c0de2008:	ea42 3295 	orr.w	r2, r2, r5, lsr #14
c0de200c:	713a      	strb	r2, [r7, #4]
c0de200e:	00aa      	lsls	r2, r5, #2
c0de2010:	ea42 4213 	orr.w	r2, r2, r3, lsr #16
c0de2014:	70ba      	strb	r2, [r7, #2]
c0de2016:	e7d2      	b.n	c0de1fbe <pqcrystals_dilithium2_lowram_polyz_pack+0x8>

c0de2018 <pqcrystals_dilithium2_lowram_polyw1_pack>:
c0de2018:	b5b0      	push	{r4, r5, r7, lr}
c0de201a:	3001      	adds	r0, #1
c0de201c:	2200      	movs	r2, #0
c0de201e:	f5b2 6f80 	cmp.w	r2, #1024	@ 0x400
c0de2022:	bf08      	it	eq
c0de2024:	bdb0      	popeq	{r4, r5, r7, pc}
c0de2026:	588b      	ldr	r3, [r1, r2]
c0de2028:	188c      	adds	r4, r1, r2
c0de202a:	3210      	adds	r2, #16
c0de202c:	f800 3c01 	strb.w	r3, [r0, #-1]
c0de2030:	6865      	ldr	r5, [r4, #4]
c0de2032:	ea43 1385 	orr.w	r3, r3, r5, lsl #6
c0de2036:	f800 3c01 	strb.w	r3, [r0, #-1]
c0de203a:	6863      	ldr	r3, [r4, #4]
c0de203c:	089d      	lsrs	r5, r3, #2
c0de203e:	7005      	strb	r5, [r0, #0]
c0de2040:	68a5      	ldr	r5, [r4, #8]
c0de2042:	012d      	lsls	r5, r5, #4
c0de2044:	ea45 0393 	orr.w	r3, r5, r3, lsr #2
c0de2048:	7003      	strb	r3, [r0, #0]
c0de204a:	68a3      	ldr	r3, [r4, #8]
c0de204c:	091d      	lsrs	r5, r3, #4
c0de204e:	7045      	strb	r5, [r0, #1]
c0de2050:	68e4      	ldr	r4, [r4, #12]
c0de2052:	00a4      	lsls	r4, r4, #2
c0de2054:	ea44 1313 	orr.w	r3, r4, r3, lsr #4
c0de2058:	7043      	strb	r3, [r0, #1]
c0de205a:	3003      	adds	r0, #3
c0de205c:	e7df      	b.n	c0de201e <pqcrystals_dilithium2_lowram_polyw1_pack+0x6>

c0de205e <OUTLINED_FUNCTION_0>:
c0de205e:	4614      	mov	r4, r2
c0de2060:	460d      	mov	r5, r1
c0de2062:	4606      	mov	r6, r0
c0de2064:	2700      	movs	r7, #0
c0de2066:	4770      	bx	lr

c0de2068 <OUTLINED_FUNCTION_1>:
c0de2068:	f814 0b01 	ldrb.w	r0, [r4], #1
c0de206c:	2100      	movs	r1, #0
c0de206e:	4632      	mov	r2, r6
c0de2070:	f008 bf8c 	b.w	c0deaf8c <__aeabi_llsl>

c0de2074 <randombytes>:
c0de2074:	f008 bc4d 	b.w	c0dea912 <cx_rng_no_throw>

c0de2078 <pqcrystals_dilithium2_lowram_montgomery_reduce>:
c0de2078:	4a03      	ldr	r2, [pc, #12]	@ (c0de2088 <pqcrystals_dilithium2_lowram_montgomery_reduce+0x10>)
c0de207a:	4b04      	ldr	r3, [pc, #16]	@ (c0de208c <pqcrystals_dilithium2_lowram_montgomery_reduce+0x14>)
c0de207c:	4342      	muls	r2, r0
c0de207e:	fbc2 0103 	smlal	r0, r1, r2, r3
c0de2082:	4608      	mov	r0, r1
c0de2084:	4770      	bx	lr
c0de2086:	bf00      	nop
c0de2088:	03802001 	.word	0x03802001
c0de208c:	ff801fff 	.word	0xff801fff

c0de2090 <pqcrystals_dilithium2_lowram_reduce32>:
c0de2090:	f500 0180 	add.w	r1, r0, #4194304	@ 0x400000
c0de2094:	4a02      	ldr	r2, [pc, #8]	@ (c0de20a0 <pqcrystals_dilithium2_lowram_reduce32+0x10>)
c0de2096:	15c9      	asrs	r1, r1, #23
c0de2098:	fb01 0002 	mla	r0, r1, r2, r0
c0de209c:	4770      	bx	lr
c0de209e:	bf00      	nop
c0de20a0:	ff801fff 	.word	0xff801fff

c0de20a4 <pqcrystals_dilithium2_lowram_caddq>:
c0de20a4:	4902      	ldr	r1, [pc, #8]	@ (c0de20b0 <pqcrystals_dilithium2_lowram_caddq+0xc>)
c0de20a6:	2800      	cmp	r0, #0
c0de20a8:	bf48      	it	mi
c0de20aa:	4408      	addmi	r0, r1
c0de20ac:	4770      	bx	lr
c0de20ae:	bf00      	nop
c0de20b0:	007fe001 	.word	0x007fe001

c0de20b4 <pqcrystals_dilithium2_lowram_freeze>:
c0de20b4:	f500 0180 	add.w	r1, r0, #4194304	@ 0x400000
c0de20b8:	4a04      	ldr	r2, [pc, #16]	@ (c0de20cc <pqcrystals_dilithium2_lowram_freeze+0x18>)
c0de20ba:	15c9      	asrs	r1, r1, #23
c0de20bc:	fb01 0002 	mla	r0, r1, r2, r0
c0de20c0:	4903      	ldr	r1, [pc, #12]	@ (c0de20d0 <pqcrystals_dilithium2_lowram_freeze+0x1c>)
c0de20c2:	2800      	cmp	r0, #0
c0de20c4:	bf48      	it	mi
c0de20c6:	4408      	addmi	r0, r1
c0de20c8:	4770      	bx	lr
c0de20ca:	bf00      	nop
c0de20cc:	ff801fff 	.word	0xff801fff
c0de20d0:	007fe001 	.word	0x007fe001

c0de20d4 <pqcrystals_dilithium2_lowram_power2round>:
c0de20d4:	f601 72ff 	addw	r2, r1, #4095	@ 0xfff
c0de20d8:	f641 73ff 	movw	r3, #8191	@ 0x1fff
c0de20dc:	ea22 0303 	bic.w	r3, r2, r3
c0de20e0:	1ac9      	subs	r1, r1, r3
c0de20e2:	6001      	str	r1, [r0, #0]
c0de20e4:	1350      	asrs	r0, r2, #13
c0de20e6:	4770      	bx	lr

c0de20e8 <pqcrystals_dilithium2_lowram_decompose>:
c0de20e8:	b510      	push	{r4, lr}
c0de20ea:	f101 027f 	add.w	r2, r1, #127	@ 0x7f
c0de20ee:	f642 430b 	movw	r3, #11275	@ 0x2c0b
c0de20f2:	4c0c      	ldr	r4, [pc, #48]	@ (c0de2124 <pqcrystals_dilithium2_lowram_decompose+0x3c>)
c0de20f4:	11d2      	asrs	r2, r2, #7
c0de20f6:	4353      	muls	r3, r2
c0de20f8:	f503 0200 	add.w	r2, r3, #8388608	@ 0x800000
c0de20fc:	1612      	asrs	r2, r2, #24
c0de20fe:	f1b3 5f2e 	cmp.w	r3, #729808896	@ 0x2b800000
c0de2102:	4b06      	ldr	r3, [pc, #24]	@ (c0de211c <pqcrystals_dilithium2_lowram_decompose+0x34>)
c0de2104:	bfa8      	it	ge
c0de2106:	2200      	movge	r2, #0
c0de2108:	fb02 1103 	mla	r1, r2, r3, r1
c0de210c:	4b04      	ldr	r3, [pc, #16]	@ (c0de2120 <pqcrystals_dilithium2_lowram_decompose+0x38>)
c0de210e:	42a1      	cmp	r1, r4
c0de2110:	bfc8      	it	gt
c0de2112:	4419      	addgt	r1, r3
c0de2114:	6001      	str	r1, [r0, #0]
c0de2116:	4610      	mov	r0, r2
c0de2118:	bd10      	pop	{r4, pc}
c0de211a:	bf00      	nop
c0de211c:	fffd1800 	.word	0xfffd1800
c0de2120:	ff801fff 	.word	0xff801fff
c0de2124:	003ff000 	.word	0x003ff000

c0de2128 <pqcrystals_dilithium2_lowram_use_hint>:
c0de2128:	b51c      	push	{r2, r3, r4, lr}
c0de212a:	460c      	mov	r4, r1
c0de212c:	4601      	mov	r1, r0
c0de212e:	a801      	add	r0, sp, #4
c0de2130:	f7ff ffda 	bl	c0de20e8 <pqcrystals_dilithium2_lowram_decompose>
c0de2134:	b164      	cbz	r4, c0de2150 <pqcrystals_dilithium2_lowram_use_hint+0x28>
c0de2136:	9901      	ldr	r1, [sp, #4]
c0de2138:	2901      	cmp	r1, #1
c0de213a:	db04      	blt.n	c0de2146 <pqcrystals_dilithium2_lowram_use_hint+0x1e>
c0de213c:	f1b0 012b 	subs.w	r1, r0, #43	@ 0x2b
c0de2140:	bf18      	it	ne
c0de2142:	1c41      	addne	r1, r0, #1
c0de2144:	e003      	b.n	c0de214e <pqcrystals_dilithium2_lowram_use_hint+0x26>
c0de2146:	1e41      	subs	r1, r0, #1
c0de2148:	2800      	cmp	r0, #0
c0de214a:	bf08      	it	eq
c0de214c:	212b      	moveq	r1, #43	@ 0x2b
c0de214e:	4608      	mov	r0, r1
c0de2150:	bd1c      	pop	{r2, r3, r4, pc}

c0de2152 <pqcrystals_dilithium2_lowram_keypair>:
c0de2152:	b570      	push	{r4, r5, r6, lr}
c0de2154:	b088      	sub	sp, #32
c0de2156:	466e      	mov	r6, sp
c0de2158:	460c      	mov	r4, r1
c0de215a:	4605      	mov	r5, r0
c0de215c:	2120      	movs	r1, #32
c0de215e:	4630      	mov	r0, r6
c0de2160:	f7ff ff88 	bl	c0de2074 <randombytes>
c0de2164:	4628      	mov	r0, r5
c0de2166:	4621      	mov	r1, r4
c0de2168:	4632      	mov	r2, r6
c0de216a:	f000 f803 	bl	c0de2174 <crypto_sign_keypair_core>
c0de216e:	2000      	movs	r0, #0
c0de2170:	b008      	add	sp, #32
c0de2172:	bd70      	pop	{r4, r5, r6, pc}

c0de2174 <crypto_sign_keypair_core>:
c0de2174:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2178:	f6ad 6d88 	subw	sp, sp, #3720	@ 0xe88
c0de217c:	f60d 6708 	addw	r7, sp, #3592	@ 0xe08
c0de2180:	460d      	mov	r5, r1
c0de2182:	4606      	mov	r6, r0
c0de2184:	4611      	mov	r1, r2
c0de2186:	2220      	movs	r2, #32
c0de2188:	4638      	mov	r0, r7
c0de218a:	f009 f807 	bl	c0deb19c <__aeabi_memcpy>
c0de218e:	f240 4004 	movw	r0, #1028	@ 0x404
c0de2192:	f8ad 0e28 	strh.w	r0, [sp, #3624]	@ 0xe28
c0de2196:	ac02      	add	r4, sp, #8
c0de2198:	4620      	mov	r0, r4
c0de219a:	f7fe fe9b 	bl	c0de0ed4 <inner_keccak256_init>
c0de219e:	4620      	mov	r0, r4
c0de21a0:	4639      	mov	r1, r7
c0de21a2:	2222      	movs	r2, #34	@ 0x22
c0de21a4:	f7fe fea7 	bl	c0de0ef6 <inner_keccak256_inject>
c0de21a8:	f000 fbca 	bl	c0de2940 <OUTLINED_FUNCTION_0>
c0de21ac:	4620      	mov	r0, r4
c0de21ae:	4639      	mov	r1, r7
c0de21b0:	2280      	movs	r2, #128	@ 0x80
c0de21b2:	f7fe fec8 	bl	c0de0f46 <inner_keccak256_extract>
c0de21b6:	4628      	mov	r0, r5
c0de21b8:	4639      	mov	r1, r7
c0de21ba:	f7ff fb94 	bl	c0de18e6 <pack_sk_rho>
c0de21be:	f107 0160 	add.w	r1, r7, #96	@ 0x60
c0de21c2:	4628      	mov	r0, r5
c0de21c4:	9501      	str	r5, [sp, #4]
c0de21c6:	f7ff fb96 	bl	c0de18f6 <pack_sk_key>
c0de21ca:	4630      	mov	r0, r6
c0de21cc:	4639      	mov	r1, r7
c0de21ce:	9600      	str	r6, [sp, #0]
c0de21d0:	f7ff fb63 	bl	c0de189a <pack_pk_rho>
c0de21d4:	3720      	adds	r7, #32
c0de21d6:	f04f 0b00 	mov.w	fp, #0
c0de21da:	ad82      	add	r5, sp, #520	@ 0x208
c0de21dc:	f50d 64c1 	add.w	r4, sp, #1544	@ 0x608
c0de21e0:	f60d 2608 	addw	r6, sp, #2568	@ 0xa08
c0de21e4:	f04f 0800 	mov.w	r8, #0
c0de21e8:	f1b8 0f04 	cmp.w	r8, #4
c0de21ec:	d072      	beq.n	c0de22d4 <crypto_sign_keypair_core+0x160>
c0de21ee:	4628      	mov	r0, r5
c0de21f0:	4639      	mov	r1, r7
c0de21f2:	2200      	movs	r2, #0
c0de21f4:	f7ff fd26 	bl	c0de1c44 <pqcrystals_dilithium2_lowram_poly_uniform_eta>
c0de21f8:	f1b8 0f00 	cmp.w	r8, #0
c0de21fc:	d104      	bne.n	c0de2208 <crypto_sign_keypair_core+0x94>
c0de21fe:	9801      	ldr	r0, [sp, #4]
c0de2200:	4629      	mov	r1, r5
c0de2202:	2200      	movs	r2, #0
c0de2204:	f7ff fb58 	bl	c0de18b8 <pack_sk_s1>
c0de2208:	4628      	mov	r0, r5
c0de220a:	f7ff fc6c 	bl	c0de1ae6 <pqcrystals_dilithium2_lowram_poly_ntt>
c0de220e:	ea4f 2008 	mov.w	r0, r8, lsl #8
c0de2212:	f60d 6108 	addw	r1, sp, #3592	@ 0xe08
c0de2216:	b282      	uxth	r2, r0
c0de2218:	4620      	mov	r0, r4
c0de221a:	f7ff fc9f 	bl	c0de1b5c <pqcrystals_dilithium2_lowram_poly_uniform>
c0de221e:	4630      	mov	r0, r6
c0de2220:	4621      	mov	r1, r4
c0de2222:	462a      	mov	r2, r5
c0de2224:	f7ff fc63 	bl	c0de1aee <pqcrystals_dilithium2_lowram_poly_pointwise_montgomery>
c0de2228:	f04f 0a01 	mov.w	sl, #1
c0de222c:	f1ba 0f04 	cmp.w	sl, #4
c0de2230:	d020      	beq.n	c0de2274 <crypto_sign_keypair_core+0x100>
c0de2232:	fa1f f28a 	uxth.w	r2, sl
c0de2236:	4628      	mov	r0, r5
c0de2238:	4639      	mov	r1, r7
c0de223a:	f7ff fd03 	bl	c0de1c44 <pqcrystals_dilithium2_lowram_poly_uniform_eta>
c0de223e:	f1b8 0f00 	cmp.w	r8, #0
c0de2242:	d104      	bne.n	c0de224e <crypto_sign_keypair_core+0xda>
c0de2244:	9801      	ldr	r0, [sp, #4]
c0de2246:	4629      	mov	r1, r5
c0de2248:	4652      	mov	r2, sl
c0de224a:	f7ff fb35 	bl	c0de18b8 <pack_sk_s1>
c0de224e:	4628      	mov	r0, r5
c0de2250:	f7ff fc49 	bl	c0de1ae6 <pqcrystals_dilithium2_lowram_poly_ntt>
c0de2254:	eb0b 000a 	add.w	r0, fp, sl
c0de2258:	f60d 6108 	addw	r1, sp, #3592	@ 0xe08
c0de225c:	b282      	uxth	r2, r0
c0de225e:	4620      	mov	r0, r4
c0de2260:	f7ff fc7c 	bl	c0de1b5c <pqcrystals_dilithium2_lowram_poly_uniform>
c0de2264:	4630      	mov	r0, r6
c0de2266:	4621      	mov	r1, r4
c0de2268:	462a      	mov	r2, r5
c0de226a:	f7ff fb56 	bl	c0de191a <pqcrystals_dilithium2_lowram_poly_pointwise_acc_montgomery>
c0de226e:	f10a 0a01 	add.w	sl, sl, #1
c0de2272:	e7db      	b.n	c0de222c <crypto_sign_keypair_core+0xb8>
c0de2274:	4630      	mov	r0, r6
c0de2276:	f7ff fc09 	bl	c0de1a8c <pqcrystals_dilithium2_lowram_poly_reduce>
c0de227a:	4630      	mov	r0, r6
c0de227c:	f7ff fc35 	bl	c0de1aea <pqcrystals_dilithium2_lowram_poly_invntt_tomont>
c0de2280:	f108 0004 	add.w	r0, r8, #4
c0de2284:	4639      	mov	r1, r7
c0de2286:	b282      	uxth	r2, r0
c0de2288:	4620      	mov	r0, r4
c0de228a:	f7ff fcdb 	bl	c0de1c44 <pqcrystals_dilithium2_lowram_poly_uniform_eta>
c0de228e:	f8dd a004 	ldr.w	sl, [sp, #4]
c0de2292:	4621      	mov	r1, r4
c0de2294:	4642      	mov	r2, r8
c0de2296:	4650      	mov	r0, sl
c0de2298:	f7ff fb15 	bl	c0de18c6 <pack_sk_s2>
c0de229c:	4630      	mov	r0, r6
c0de229e:	4631      	mov	r1, r6
c0de22a0:	4622      	mov	r2, r4
c0de22a2:	f7ff fc11 	bl	c0de1ac8 <pqcrystals_dilithium2_lowram_poly_add>
c0de22a6:	4630      	mov	r0, r6
c0de22a8:	f7ff fbff 	bl	c0de1aaa <pqcrystals_dilithium2_lowram_poly_caddq>
c0de22ac:	4628      	mov	r0, r5
c0de22ae:	4621      	mov	r1, r4
c0de22b0:	4632      	mov	r2, r6
c0de22b2:	f7ff fc2f 	bl	c0de1b14 <pqcrystals_dilithium2_lowram_poly_power2round>
c0de22b6:	4650      	mov	r0, sl
c0de22b8:	4621      	mov	r1, r4
c0de22ba:	4642      	mov	r2, r8
c0de22bc:	f7ff fb0b 	bl	c0de18d6 <pack_sk_t0>
c0de22c0:	9800      	ldr	r0, [sp, #0]
c0de22c2:	4629      	mov	r1, r5
c0de22c4:	4642      	mov	r2, r8
c0de22c6:	f7ff faf0 	bl	c0de18aa <pack_pk_t1>
c0de22ca:	f50b 7b80 	add.w	fp, fp, #256	@ 0x100
c0de22ce:	f108 0801 	add.w	r8, r8, #1
c0de22d2:	e789      	b.n	c0de21e8 <crypto_sign_keypair_core+0x74>
c0de22d4:	ac02      	add	r4, sp, #8
c0de22d6:	4620      	mov	r0, r4
c0de22d8:	f7fe fdfc 	bl	c0de0ed4 <inner_keccak256_init>
c0de22dc:	9e00      	ldr	r6, [sp, #0]
c0de22de:	4620      	mov	r0, r4
c0de22e0:	f44f 62a4 	mov.w	r2, #1312	@ 0x520
c0de22e4:	4631      	mov	r1, r6
c0de22e6:	f7fe fe06 	bl	c0de0ef6 <inner_keccak256_inject>
c0de22ea:	f000 fb29 	bl	c0de2940 <OUTLINED_FUNCTION_0>
c0de22ee:	ad82      	add	r5, sp, #520	@ 0x208
c0de22f0:	4620      	mov	r0, r4
c0de22f2:	2240      	movs	r2, #64	@ 0x40
c0de22f4:	4629      	mov	r1, r5
c0de22f6:	f7fe fe26 	bl	c0de0f46 <inner_keccak256_extract>
c0de22fa:	480c      	ldr	r0, [pc, #48]	@ (c0de232c <crypto_sign_keypair_core+0x1b8>)
c0de22fc:	4629      	mov	r1, r5
c0de22fe:	2240      	movs	r2, #64	@ 0x40
c0de2300:	eb09 0400 	add.w	r4, r9, r0
c0de2304:	f504 7020 	add.w	r0, r4, #640	@ 0x280
c0de2308:	f008 ff48 	bl	c0deb19c <__aeabi_memcpy>
c0de230c:	f504 7030 	add.w	r0, r4, #704	@ 0x2c0
c0de2310:	4631      	mov	r1, r6
c0de2312:	f44f 62a4 	mov.w	r2, #1312	@ 0x520
c0de2316:	f008 ff41 	bl	c0deb19c <__aeabi_memcpy>
c0de231a:	9801      	ldr	r0, [sp, #4]
c0de231c:	4629      	mov	r1, r5
c0de231e:	f7ff faf3 	bl	c0de1908 <pack_sk_tr>
c0de2322:	2000      	movs	r0, #0
c0de2324:	f60d 6d88 	addw	sp, sp, #3720	@ 0xe88
c0de2328:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de232c:	000002d8 	.word	0x000002d8

c0de2330 <crypto_sign_signature_init>:
c0de2330:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de2334:	29ff      	cmp	r1, #255	@ 0xff
c0de2336:	d902      	bls.n	c0de233e <crypto_sign_signature_init+0xe>
c0de2338:	f04f 34ff 	mov.w	r4, #4294967295	@ 0xffffffff
c0de233c:	e01c      	b.n	c0de2378 <crypto_sign_signature_init+0x48>
c0de233e:	4680      	mov	r8, r0
c0de2340:	480f      	ldr	r0, [pc, #60]	@ (c0de2380 <crypto_sign_signature_init+0x50>)
c0de2342:	2400      	movs	r4, #0
c0de2344:	460d      	mov	r5, r1
c0de2346:	eb09 0700 	add.w	r7, r9, r0
c0de234a:	4638      	mov	r0, r7
c0de234c:	f887 1201 	strb.w	r1, [r7, #513]	@ 0x201
c0de2350:	f887 4200 	strb.w	r4, [r7, #512]	@ 0x200
c0de2354:	f7fe fdbe 	bl	c0de0ed4 <inner_keccak256_init>
c0de2358:	4e0a      	ldr	r6, [pc, #40]	@ (c0de2384 <crypto_sign_signature_init+0x54>)
c0de235a:	f507 7120 	add.w	r1, r7, #640	@ 0x280
c0de235e:	4638      	mov	r0, r7
c0de2360:	2240      	movs	r2, #64	@ 0x40
c0de2362:	447e      	add	r6, pc
c0de2364:	47b0      	blx	r6
c0de2366:	f507 7100 	add.w	r1, r7, #512	@ 0x200
c0de236a:	4638      	mov	r0, r7
c0de236c:	2202      	movs	r2, #2
c0de236e:	47b0      	blx	r6
c0de2370:	4638      	mov	r0, r7
c0de2372:	4641      	mov	r1, r8
c0de2374:	462a      	mov	r2, r5
c0de2376:	47b0      	blx	r6
c0de2378:	4620      	mov	r0, r4
c0de237a:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de237e:	bf00      	nop
c0de2380:	000002d8 	.word	0x000002d8
c0de2384:	ffffeb91 	.word	0xffffeb91

c0de2388 <crypto_sign_signature_absorb>:
c0de2388:	460a      	mov	r2, r1
c0de238a:	4601      	mov	r1, r0
c0de238c:	4801      	ldr	r0, [pc, #4]	@ (c0de2394 <crypto_sign_signature_absorb+0xc>)
c0de238e:	4448      	add	r0, r9
c0de2390:	f7fe bdb1 	b.w	c0de0ef6 <inner_keccak256_inject>
c0de2394:	000002d8 	.word	0x000002d8

c0de2398 <crypto_sign_signature_core>:
c0de2398:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de239c:	f5ad 5d83 	sub.w	sp, sp, #4192	@ 0x1060
c0de23a0:	b086      	sub	sp, #24
c0de23a2:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de23a4:	48bf      	ldr	r0, [pc, #764]	@ (c0de26a4 <crypto_sign_signature_core+0x30c>)
c0de23a6:	4616      	mov	r6, r2
c0de23a8:	9103      	str	r1, [sp, #12]
c0de23aa:	eb09 0400 	add.w	r4, r9, r0
c0de23ae:	f000 fac7 	bl	c0de2940 <OUTLINED_FUNCTION_0>
c0de23b2:	f504 7100 	add.w	r1, r4, #512	@ 0x200
c0de23b6:	4620      	mov	r0, r4
c0de23b8:	2240      	movs	r2, #64	@ 0x40
c0de23ba:	f7fe fdc4 	bl	c0de0f46 <inner_keccak256_extract>
c0de23be:	a80d      	add	r0, sp, #52	@ 0x34
c0de23c0:	2100      	movs	r1, #0
c0de23c2:	f500 7000 	add.w	r0, r0, #512	@ 0x200
c0de23c6:	900a      	str	r0, [sp, #40]	@ 0x28
c0de23c8:	2000      	movs	r0, #0
c0de23ca:	2920      	cmp	r1, #32
c0de23cc:	d006      	beq.n	c0de23dc <crypto_sign_signature_core+0x44>
c0de23ce:	4ab5      	ldr	r2, [pc, #724]	@ (c0de26a4 <crypto_sign_signature_core+0x30c>)
c0de23d0:	444a      	add	r2, r9
c0de23d2:	440a      	add	r2, r1
c0de23d4:	3101      	adds	r1, #1
c0de23d6:	f882 0240 	strb.w	r0, [r2, #576]	@ 0x240
c0de23da:	e7f6      	b.n	c0de23ca <crypto_sign_signature_core+0x32>
c0de23dc:	48b1      	ldr	r0, [pc, #708]	@ (c0de26a4 <crypto_sign_signature_core+0x30c>)
c0de23de:	eb09 0400 	add.w	r4, r9, r0
c0de23e2:	4620      	mov	r0, r4
c0de23e4:	f7fe fd76 	bl	c0de0ed4 <inner_keccak256_init>
c0de23e8:	4fb0      	ldr	r7, [pc, #704]	@ (c0de26ac <crypto_sign_signature_core+0x314>)
c0de23ea:	f106 0120 	add.w	r1, r6, #32
c0de23ee:	4620      	mov	r0, r4
c0de23f0:	2220      	movs	r2, #32
c0de23f2:	447f      	add	r7, pc
c0de23f4:	47b8      	blx	r7
c0de23f6:	f504 7510 	add.w	r5, r4, #576	@ 0x240
c0de23fa:	4620      	mov	r0, r4
c0de23fc:	2220      	movs	r2, #32
c0de23fe:	4629      	mov	r1, r5
c0de2400:	47b8      	blx	r7
c0de2402:	f504 7100 	add.w	r1, r4, #512	@ 0x200
c0de2406:	4620      	mov	r0, r4
c0de2408:	2240      	movs	r2, #64	@ 0x40
c0de240a:	47b8      	blx	r7
c0de240c:	f000 fa98 	bl	c0de2940 <OUTLINED_FUNCTION_0>
c0de2410:	4620      	mov	r0, r4
c0de2412:	4629      	mov	r1, r5
c0de2414:	2240      	movs	r2, #64	@ 0x40
c0de2416:	f7fe fd96 	bl	c0de0f46 <inner_keccak256_extract>
c0de241a:	f506 7060 	add.w	r0, r6, #896	@ 0x380
c0de241e:	2100      	movs	r1, #0
c0de2420:	f04f 0800 	mov.w	r8, #0
c0de2424:	9004      	str	r0, [sp, #16]
c0de2426:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de2428:	3020      	adds	r0, #32
c0de242a:	9005      	str	r0, [sp, #20]
c0de242c:	ac0d      	add	r4, sp, #52	@ 0x34
c0de242e:	2001      	movs	r0, #1
c0de2430:	9107      	str	r1, [sp, #28]
c0de2432:	9006      	str	r0, [sp, #24]
c0de2434:	b280      	uxth	r0, r0
c0de2436:	f64f 71fc 	movw	r1, #65532	@ 0xfffc
c0de243a:	eb01 0380 	add.w	r3, r1, r0, lsl #2
c0de243e:	2000      	movs	r0, #0
c0de2440:	f50d 618f 	add.w	r1, sp, #1144	@ 0x478
c0de2444:	2804      	cmp	r0, #4
c0de2446:	d00b      	beq.n	c0de2460 <crypto_sign_signature_core+0xc8>
c0de2448:	2200      	movs	r2, #0
c0de244a:	f5b2 7f40 	cmp.w	r2, #768	@ 0x300
c0de244e:	d003      	beq.n	c0de2458 <crypto_sign_signature_core+0xc0>
c0de2450:	f801 8002 	strb.w	r8, [r1, r2]
c0de2454:	3201      	adds	r2, #1
c0de2456:	e7f8      	b.n	c0de244a <crypto_sign_signature_core+0xb2>
c0de2458:	f501 7140 	add.w	r1, r1, #768	@ 0x300
c0de245c:	3001      	adds	r0, #1
c0de245e:	e7f1      	b.n	c0de2444 <crypto_sign_signature_core+0xac>
c0de2460:	9807      	ldr	r0, [sp, #28]
c0de2462:	2700      	movs	r7, #0
c0de2464:	9309      	str	r3, [sp, #36]	@ 0x24
c0de2466:	b280      	uxth	r0, r0
c0de2468:	ea4f 0b80 	mov.w	fp, r0, lsl #2
c0de246c:	2f04      	cmp	r7, #4
c0de246e:	d023      	beq.n	c0de24b8 <crypto_sign_signature_core+0x120>
c0de2470:	488c      	ldr	r0, [pc, #560]	@ (c0de26a4 <crypto_sign_signature_core+0x30c>)
c0de2472:	eb09 0300 	add.w	r3, r9, r0
c0de2476:	eb07 000b 	add.w	r0, r7, fp
c0de247a:	b282      	uxth	r2, r0
c0de247c:	f503 7110 	add.w	r1, r3, #576	@ 0x240
c0de2480:	4620      	mov	r0, r4
c0de2482:	f7ff f905 	bl	c0de1690 <poly_uniform_gamma1_lowram_eth>
c0de2486:	4620      	mov	r0, r4
c0de2488:	f7ff fb2d 	bl	c0de1ae6 <pqcrystals_dilithium2_lowram_poly_ntt>
c0de248c:	f04f 0a00 	mov.w	sl, #0
c0de2490:	f50d 658f 	add.w	r5, sp, #1144	@ 0x478
c0de2494:	f5ba 6f80 	cmp.w	sl, #1024	@ 0x400
c0de2498:	d00c      	beq.n	c0de24b4 <crypto_sign_signature_core+0x11c>
c0de249a:	eb07 000a 	add.w	r0, r7, sl
c0de249e:	4621      	mov	r1, r4
c0de24a0:	4632      	mov	r2, r6
c0de24a2:	b283      	uxth	r3, r0
c0de24a4:	4628      	mov	r0, r5
c0de24a6:	f7ff f883 	bl	c0de15b0 <poly_uniform_pointwise_montgomery_polywadd_lowram_eth>
c0de24aa:	f505 7540 	add.w	r5, r5, #768	@ 0x300
c0de24ae:	f50a 7a80 	add.w	sl, sl, #256	@ 0x100
c0de24b2:	e7ef      	b.n	c0de2494 <crypto_sign_signature_core+0xfc>
c0de24b4:	3701      	adds	r7, #1
c0de24b6:	e7d9      	b.n	c0de246c <crypto_sign_signature_core+0xd4>
c0de24b8:	f8dd b024 	ldr.w	fp, [sp, #36]	@ 0x24
c0de24bc:	2700      	movs	r7, #0
c0de24be:	f50d 658f 	add.w	r5, sp, #1144	@ 0x478
c0de24c2:	f5b7 7f40 	cmp.w	r7, #768	@ 0x300
c0de24c6:	d01a      	beq.n	c0de24fe <crypto_sign_signature_core+0x166>
c0de24c8:	4620      	mov	r0, r4
c0de24ca:	4629      	mov	r1, r5
c0de24cc:	f7fe ffd3 	bl	c0de1476 <polyw_unpack>
c0de24d0:	4620      	mov	r0, r4
c0de24d2:	f7ff fb0a 	bl	c0de1aea <pqcrystals_dilithium2_lowram_poly_invntt_tomont>
c0de24d6:	4620      	mov	r0, r4
c0de24d8:	f7ff fae7 	bl	c0de1aaa <pqcrystals_dilithium2_lowram_poly_caddq>
c0de24dc:	4628      	mov	r0, r5
c0de24de:	4621      	mov	r1, r4
c0de24e0:	f7fe ffab 	bl	c0de143a <polyw_pack>
c0de24e4:	4620      	mov	r0, r4
c0de24e6:	4621      	mov	r1, r4
c0de24e8:	f7fe fff5 	bl	c0de14d6 <poly_highbits>
c0de24ec:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de24ee:	4621      	mov	r1, r4
c0de24f0:	4438      	add	r0, r7
c0de24f2:	f7ff fd91 	bl	c0de2018 <pqcrystals_dilithium2_lowram_polyw1_pack>
c0de24f6:	f505 7540 	add.w	r5, r5, #768	@ 0x300
c0de24fa:	37c0      	adds	r7, #192	@ 0xc0
c0de24fc:	e7e1      	b.n	c0de24c2 <crypto_sign_signature_core+0x12a>
c0de24fe:	4869      	ldr	r0, [pc, #420]	@ (c0de26a4 <crypto_sign_signature_core+0x30c>)
c0de2500:	eb09 0500 	add.w	r5, r9, r0
c0de2504:	4628      	mov	r0, r5
c0de2506:	f7fe fce5 	bl	c0de0ed4 <inner_keccak256_init>
c0de250a:	f505 7100 	add.w	r1, r5, #512	@ 0x200
c0de250e:	4628      	mov	r0, r5
c0de2510:	2240      	movs	r2, #64	@ 0x40
c0de2512:	f7fe fcf0 	bl	c0de0ef6 <inner_keccak256_inject>
c0de2516:	9f0b      	ldr	r7, [sp, #44]	@ 0x2c
c0de2518:	4628      	mov	r0, r5
c0de251a:	f44f 7240 	mov.w	r2, #768	@ 0x300
c0de251e:	4639      	mov	r1, r7
c0de2520:	f7fe fce9 	bl	c0de0ef6 <inner_keccak256_inject>
c0de2524:	4628      	mov	r0, r5
c0de2526:	f7fe fcf8 	bl	c0de0f1a <inner_keccak256_flip>
c0de252a:	4628      	mov	r0, r5
c0de252c:	4639      	mov	r1, r7
c0de252e:	2220      	movs	r2, #32
c0de2530:	f7fe fd09 	bl	c0de0f46 <inner_keccak256_extract>
c0de2534:	4620      	mov	r0, r4
c0de2536:	4639      	mov	r1, r7
c0de2538:	f7ff fc69 	bl	c0de1e0e <pqcrystals_dilithium2_lowram_poly_challenge_eth>
c0de253c:	f20d 4034 	addw	r0, sp, #1076	@ 0x434
c0de2540:	4621      	mov	r1, r4
c0de2542:	f7fe fda6 	bl	c0de1092 <poly_challenge_compress>
c0de2546:	9807      	ldr	r0, [sp, #28]
c0de2548:	f8dd a014 	ldr.w	sl, [sp, #20]
c0de254c:	2500      	movs	r5, #0
c0de254e:	3001      	adds	r0, #1
c0de2550:	9007      	str	r0, [sp, #28]
c0de2552:	b135      	cbz	r5, c0de2562 <crypto_sign_signature_core+0x1ca>
c0de2554:	2d04      	cmp	r5, #4
c0de2556:	d035      	beq.n	c0de25c4 <crypto_sign_signature_core+0x22c>
c0de2558:	4620      	mov	r0, r4
c0de255a:	f20d 4134 	addw	r1, sp, #1076	@ 0x434
c0de255e:	f7fe fdcd 	bl	c0de10fc <poly_challenge_decompress>
c0de2562:	9f0a      	ldr	r7, [sp, #40]	@ 0x28
c0de2564:	4621      	mov	r1, r4
c0de2566:	4638      	mov	r0, r7
c0de2568:	f000 fada 	bl	c0de2b20 <poly_small_ntt_copy>
c0de256c:	4620      	mov	r0, r4
c0de256e:	4631      	mov	r1, r6
c0de2570:	462a      	mov	r2, r5
c0de2572:	f7fe fff9 	bl	c0de1568 <unpack_sk_s1>
c0de2576:	4620      	mov	r0, r4
c0de2578:	f000 f9e6 	bl	c0de2948 <small_ntt>
c0de257c:	4620      	mov	r0, r4
c0de257e:	4639      	mov	r1, r7
c0de2580:	4622      	mov	r2, r4
c0de2582:	f000 fb05 	bl	c0de2b90 <poly_small_basemul_invntt>
c0de2586:	4847      	ldr	r0, [pc, #284]	@ (c0de26a4 <crypto_sign_signature_core+0x30c>)
c0de2588:	4621      	mov	r1, r4
c0de258a:	4448      	add	r0, r9
c0de258c:	9000      	str	r0, [sp, #0]
c0de258e:	f500 7210 	add.w	r2, r0, #576	@ 0x240
c0de2592:	eb0b 0005 	add.w	r0, fp, r5
c0de2596:	b283      	uxth	r3, r0
c0de2598:	4620      	mov	r0, r4
c0de259a:	f7ff f8af 	bl	c0de16fc <poly_uniform_gamma1_add_lowram_eth>
c0de259e:	4620      	mov	r0, r4
c0de25a0:	f7ff fa74 	bl	c0de1a8c <pqcrystals_dilithium2_lowram_poly_reduce>
c0de25a4:	4840      	ldr	r0, [pc, #256]	@ (c0de26a8 <crypto_sign_signature_core+0x310>)
c0de25a6:	f500 410c 	add.w	r1, r0, #35840	@ 0x8c00
c0de25aa:	4620      	mov	r0, r4
c0de25ac:	f7ff fac0 	bl	c0de1b30 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de25b0:	2800      	cmp	r0, #0
c0de25b2:	d166      	bne.n	c0de2682 <crypto_sign_signature_core+0x2ea>
c0de25b4:	4650      	mov	r0, sl
c0de25b6:	4621      	mov	r1, r4
c0de25b8:	f7ff fcfd 	bl	c0de1fb6 <pqcrystals_dilithium2_lowram_polyz_pack>
c0de25bc:	f50a 7a10 	add.w	sl, sl, #576	@ 0x240
c0de25c0:	3501      	adds	r5, #1
c0de25c2:	e7c6      	b.n	c0de2552 <crypto_sign_signature_core+0x1ba>
c0de25c4:	9d04      	ldr	r5, [sp, #16]
c0de25c6:	2100      	movs	r1, #0
c0de25c8:	2000      	movs	r0, #0
c0de25ca:	f50d 6a8f 	add.w	sl, sp, #1144	@ 0x478
c0de25ce:	2700      	movs	r7, #0
c0de25d0:	9009      	str	r0, [sp, #36]	@ 0x24
c0de25d2:	910c      	str	r1, [sp, #48]	@ 0x30
c0de25d4:	2f04      	cmp	r7, #4
c0de25d6:	d057      	beq.n	c0de2688 <crypto_sign_signature_core+0x2f0>
c0de25d8:	4620      	mov	r0, r4
c0de25da:	f20d 4134 	addw	r1, sp, #1076	@ 0x434
c0de25de:	f7fe fd8d 	bl	c0de10fc <poly_challenge_decompress>
c0de25e2:	46ab      	mov	fp, r5
c0de25e4:	9d0a      	ldr	r5, [sp, #40]	@ 0x28
c0de25e6:	4621      	mov	r1, r4
c0de25e8:	4628      	mov	r0, r5
c0de25ea:	f000 fa99 	bl	c0de2b20 <poly_small_ntt_copy>
c0de25ee:	4620      	mov	r0, r4
c0de25f0:	4631      	mov	r1, r6
c0de25f2:	463a      	mov	r2, r7
c0de25f4:	9708      	str	r7, [sp, #32]
c0de25f6:	f7fe ffbe 	bl	c0de1576 <unpack_sk_s2>
c0de25fa:	4620      	mov	r0, r4
c0de25fc:	f000 f9a4 	bl	c0de2948 <small_ntt>
c0de2600:	4629      	mov	r1, r5
c0de2602:	4620      	mov	r0, r4
c0de2604:	4622      	mov	r2, r4
c0de2606:	465d      	mov	r5, fp
c0de2608:	f000 fac2 	bl	c0de2b90 <poly_small_basemul_invntt>
c0de260c:	4620      	mov	r0, r4
c0de260e:	4651      	mov	r1, sl
c0de2610:	4622      	mov	r2, r4
c0de2612:	f7fe ff48 	bl	c0de14a6 <polyw_sub>
c0de2616:	4620      	mov	r0, r4
c0de2618:	f7ff fa38 	bl	c0de1a8c <pqcrystals_dilithium2_lowram_poly_reduce>
c0de261c:	4650      	mov	r0, sl
c0de261e:	4621      	mov	r1, r4
c0de2620:	f7fe ff0b 	bl	c0de143a <polyw_pack>
c0de2624:	4620      	mov	r0, r4
c0de2626:	4621      	mov	r1, r4
c0de2628:	f7fe ff6e 	bl	c0de1508 <poly_lowbits>
c0de262c:	4620      	mov	r0, r4
c0de262e:	f7ff fa2d 	bl	c0de1a8c <pqcrystals_dilithium2_lowram_poly_reduce>
c0de2632:	491d      	ldr	r1, [pc, #116]	@ (c0de26a8 <crypto_sign_signature_core+0x310>)
c0de2634:	4620      	mov	r0, r4
c0de2636:	f7ff fa7b 	bl	c0de1b30 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de263a:	bb10      	cbnz	r0, c0de2682 <crypto_sign_signature_core+0x2ea>
c0de263c:	4620      	mov	r0, r4
c0de263e:	f20d 4134 	addw	r1, sp, #1076	@ 0x434
c0de2642:	462a      	mov	r2, r5
c0de2644:	f7fe fd8c 	bl	c0de1160 <poly_schoolbook>
c0de2648:	4620      	mov	r0, r4
c0de264a:	f44f 31ba 	mov.w	r1, #95232	@ 0x17400
c0de264e:	f7ff fa6f 	bl	c0de1b30 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de2652:	b9b0      	cbnz	r0, c0de2682 <crypto_sign_signature_core+0x2ea>
c0de2654:	4620      	mov	r0, r4
c0de2656:	4621      	mov	r1, r4
c0de2658:	4652      	mov	r2, sl
c0de265a:	f7ff f887 	bl	c0de176c <poly_make_hint_lowram>
c0de265e:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0de2660:	4401      	add	r1, r0
c0de2662:	2950      	cmp	r1, #80	@ 0x50
c0de2664:	9109      	str	r1, [sp, #36]	@ 0x24
c0de2666:	d80c      	bhi.n	c0de2682 <crypto_sign_signature_core+0x2ea>
c0de2668:	9f08      	ldr	r7, [sp, #32]
c0de266a:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de266c:	4621      	mov	r1, r4
c0de266e:	ab0c      	add	r3, sp, #48	@ 0x30
c0de2670:	463a      	mov	r2, r7
c0de2672:	f7fe fcec 	bl	c0de104e <pqcrystals_dilithium2_lowram_pack_sig_h>
c0de2676:	f505 75d0 	add.w	r5, r5, #416	@ 0x1a0
c0de267a:	f50a 7a40 	add.w	sl, sl, #768	@ 0x300
c0de267e:	3701      	adds	r7, #1
c0de2680:	e7a8      	b.n	c0de25d4 <crypto_sign_signature_core+0x23c>
c0de2682:	9806      	ldr	r0, [sp, #24]
c0de2684:	3001      	adds	r0, #1
c0de2686:	e6d4      	b.n	c0de2432 <crypto_sign_signature_core+0x9a>
c0de2688:	a90c      	add	r1, sp, #48	@ 0x30
c0de268a:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de268c:	f7fe fcf5 	bl	c0de107a <pqcrystals_dilithium2_lowram_pack_sig_h_zero>
c0de2690:	9903      	ldr	r1, [sp, #12]
c0de2692:	f640 1074 	movw	r0, #2420	@ 0x974
c0de2696:	6008      	str	r0, [r1, #0]
c0de2698:	2000      	movs	r0, #0
c0de269a:	f50d 5d83 	add.w	sp, sp, #4192	@ 0x1060
c0de269e:	b006      	add	sp, #24
c0de26a0:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de26a4:	000002d8 	.word	0x000002d8
c0de26a8:	000173b2 	.word	0x000173b2
c0de26ac:	ffffeb01 	.word	0xffffeb01

c0de26b0 <pqcrystals_dilithium2_lowram_verify>:
c0de26b0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de26b4:	f6ad 3d58 	subw	sp, sp, #2904	@ 0xb58
c0de26b8:	4692      	mov	sl, r2
c0de26ba:	f640 1274 	movw	r2, #2420	@ 0x974
c0de26be:	4604      	mov	r4, r0
c0de26c0:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de26c4:	4291      	cmp	r1, r2
c0de26c6:	f040 80eb 	bne.w	c0de28a0 <pqcrystals_dilithium2_lowram_verify+0x1f0>
c0de26ca:	f8dd 1b7c 	ldr.w	r1, [sp, #2940]	@ 0xb7c
c0de26ce:	29ff      	cmp	r1, #255	@ 0xff
c0de26d0:	f200 80e6 	bhi.w	c0de28a0 <pqcrystals_dilithium2_lowram_verify+0x1f0>
c0de26d4:	ad84      	add	r5, sp, #528	@ 0x210
c0de26d6:	4e81      	ldr	r6, [pc, #516]	@ (c0de28dc <pqcrystals_dilithium2_lowram_verify+0x22c>)
c0de26d8:	f8dd 8b80 	ldr.w	r8, [sp, #2944]	@ 0xb80
c0de26dc:	9303      	str	r3, [sp, #12]
c0de26de:	4628      	mov	r0, r5
c0de26e0:	447e      	add	r6, pc
c0de26e2:	47b0      	blx	r6
c0de26e4:	4f7e      	ldr	r7, [pc, #504]	@ (c0de28e0 <pqcrystals_dilithium2_lowram_verify+0x230>)
c0de26e6:	4628      	mov	r0, r5
c0de26e8:	4641      	mov	r1, r8
c0de26ea:	f44f 62a4 	mov.w	r2, #1312	@ 0x520
c0de26ee:	447f      	add	r7, pc
c0de26f0:	47b8      	blx	r7
c0de26f2:	4628      	mov	r0, r5
c0de26f4:	f7fe fc11 	bl	c0de0f1a <inner_keccak256_flip>
c0de26f8:	f50d 6b82 	add.w	fp, sp, #1040	@ 0x410
c0de26fc:	4628      	mov	r0, r5
c0de26fe:	2240      	movs	r2, #64	@ 0x40
c0de2700:	4659      	mov	r1, fp
c0de2702:	f7fe fc20 	bl	c0de0f46 <inner_keccak256_extract>
c0de2706:	4628      	mov	r0, r5
c0de2708:	47b0      	blx	r6
c0de270a:	4628      	mov	r0, r5
c0de270c:	4659      	mov	r1, fp
c0de270e:	2240      	movs	r2, #64	@ 0x40
c0de2710:	47b8      	blx	r7
c0de2712:	f8dd 0b7c 	ldr.w	r0, [sp, #2940]	@ 0xb7c
c0de2716:	f04f 0800 	mov.w	r8, #0
c0de271a:	4659      	mov	r1, fp
c0de271c:	2202      	movs	r2, #2
c0de271e:	f88d 8410 	strb.w	r8, [sp, #1040]	@ 0x410
c0de2722:	f88d 0411 	strb.w	r0, [sp, #1041]	@ 0x411
c0de2726:	4628      	mov	r0, r5
c0de2728:	47b8      	blx	r7
c0de272a:	f8dd 1b78 	ldr.w	r1, [sp, #2936]	@ 0xb78
c0de272e:	f8dd 2b7c 	ldr.w	r2, [sp, #2940]	@ 0xb7c
c0de2732:	4628      	mov	r0, r5
c0de2734:	47b8      	blx	r7
c0de2736:	9a03      	ldr	r2, [sp, #12]
c0de2738:	4628      	mov	r0, r5
c0de273a:	4651      	mov	r1, sl
c0de273c:	47b8      	blx	r7
c0de273e:	4628      	mov	r0, r5
c0de2740:	f7fe fbeb 	bl	c0de0f1a <inner_keccak256_flip>
c0de2744:	4628      	mov	r0, r5
c0de2746:	4659      	mov	r1, fp
c0de2748:	2240      	movs	r2, #64	@ 0x40
c0de274a:	f7fe fbfc 	bl	c0de0f46 <inner_keccak256_extract>
c0de274e:	4628      	mov	r0, r5
c0de2750:	47b0      	blx	r6
c0de2752:	4628      	mov	r0, r5
c0de2754:	4659      	mov	r1, fp
c0de2756:	2240      	movs	r2, #64	@ 0x40
c0de2758:	47b8      	blx	r7
c0de275a:	f20d 7754 	addw	r7, sp, #1876	@ 0x754
c0de275e:	4621      	mov	r1, r4
c0de2760:	4638      	mov	r0, r7
c0de2762:	f7ff fb54 	bl	c0de1e0e <pqcrystals_dilithium2_lowram_poly_challenge_eth>
c0de2766:	4658      	mov	r0, fp
c0de2768:	4639      	mov	r1, r7
c0de276a:	f7fe fc92 	bl	c0de1092 <poly_challenge_compress>
c0de276e:	f8dd 0b80 	ldr.w	r0, [sp, #2944]	@ 0xb80
c0de2772:	4e59      	ldr	r6, [pc, #356]	@ (c0de28d8 <pqcrystals_dilithium2_lowram_verify+0x228>)
c0de2774:	f104 0520 	add.w	r5, r4, #32
c0de2778:	f20d 4b54 	addw	fp, sp, #1108	@ 0x454
c0de277c:	f04f 0a00 	mov.w	sl, #0
c0de2780:	9500      	str	r5, [sp, #0]
c0de2782:	3020      	adds	r0, #32
c0de2784:	9001      	str	r0, [sp, #4]
c0de2786:	2001      	movs	r0, #1
c0de2788:	9003      	str	r0, [sp, #12]
c0de278a:	f1ba 0f04 	cmp.w	sl, #4
c0de278e:	f000 808b 	beq.w	c0de28a8 <pqcrystals_dilithium2_lowram_verify+0x1f8>
c0de2792:	2000      	movs	r0, #0
c0de2794:	f5b0 7f40 	cmp.w	r0, #768	@ 0x300
c0de2798:	d003      	beq.n	c0de27a2 <pqcrystals_dilithium2_lowram_verify+0xf2>
c0de279a:	f80b 8000 	strb.w	r8, [fp, r0]
c0de279e:	3001      	adds	r0, #1
c0de27a0:	e7f8      	b.n	c0de2794 <pqcrystals_dilithium2_lowram_verify+0xe4>
c0de27a2:	4638      	mov	r0, r7
c0de27a4:	4629      	mov	r1, r5
c0de27a6:	f8cd a008 	str.w	sl, [sp, #8]
c0de27aa:	f7ff faa2 	bl	c0de1cf2 <pqcrystals_dilithium2_lowram_polyz_unpack>
c0de27ae:	4638      	mov	r0, r7
c0de27b0:	4631      	mov	r1, r6
c0de27b2:	f7ff f9bd 	bl	c0de1b30 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de27b6:	2800      	cmp	r0, #0
c0de27b8:	d170      	bne.n	c0de289c <pqcrystals_dilithium2_lowram_verify+0x1ec>
c0de27ba:	4638      	mov	r0, r7
c0de27bc:	f7ff f993 	bl	c0de1ae6 <pqcrystals_dilithium2_lowram_poly_ntt>
c0de27c0:	9802      	ldr	r0, [sp, #8]
c0de27c2:	f8dd 2b80 	ldr.w	r2, [sp, #2944]	@ 0xb80
c0de27c6:	4639      	mov	r1, r7
c0de27c8:	0200      	lsls	r0, r0, #8
c0de27ca:	b283      	uxth	r3, r0
c0de27cc:	4658      	mov	r0, fp
c0de27ce:	f7fe feef 	bl	c0de15b0 <poly_uniform_pointwise_montgomery_polywadd_lowram_eth>
c0de27d2:	9d03      	ldr	r5, [sp, #12]
c0de27d4:	f44f 7a18 	mov.w	sl, #608	@ 0x260
c0de27d8:	f5ba 6f12 	cmp.w	sl, #2336	@ 0x920
c0de27dc:	d018      	beq.n	c0de2810 <pqcrystals_dilithium2_lowram_verify+0x160>
c0de27de:	eb04 010a 	add.w	r1, r4, sl
c0de27e2:	4638      	mov	r0, r7
c0de27e4:	f7ff fa85 	bl	c0de1cf2 <pqcrystals_dilithium2_lowram_polyz_unpack>
c0de27e8:	4638      	mov	r0, r7
c0de27ea:	4631      	mov	r1, r6
c0de27ec:	f7ff f9a0 	bl	c0de1b30 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de27f0:	2800      	cmp	r0, #0
c0de27f2:	d153      	bne.n	c0de289c <pqcrystals_dilithium2_lowram_verify+0x1ec>
c0de27f4:	4638      	mov	r0, r7
c0de27f6:	f7ff f976 	bl	c0de1ae6 <pqcrystals_dilithium2_lowram_poly_ntt>
c0de27fa:	f8dd 2b80 	ldr.w	r2, [sp, #2944]	@ 0xb80
c0de27fe:	b2ab      	uxth	r3, r5
c0de2800:	4658      	mov	r0, fp
c0de2802:	4639      	mov	r1, r7
c0de2804:	f7fe fed4 	bl	c0de15b0 <poly_uniform_pointwise_montgomery_polywadd_lowram_eth>
c0de2808:	3501      	adds	r5, #1
c0de280a:	f50a 7a10 	add.w	sl, sl, #576	@ 0x240
c0de280e:	e7e3      	b.n	c0de27d8 <pqcrystals_dilithium2_lowram_verify+0x128>
c0de2810:	4638      	mov	r0, r7
c0de2812:	4659      	mov	r1, fp
c0de2814:	f7fe fe2f 	bl	c0de1476 <polyw_unpack>
c0de2818:	4638      	mov	r0, r7
c0de281a:	f7ff f937 	bl	c0de1a8c <pqcrystals_dilithium2_lowram_poly_reduce>
c0de281e:	4638      	mov	r0, r7
c0de2820:	f7ff f963 	bl	c0de1aea <pqcrystals_dilithium2_lowram_poly_invntt_tomont>
c0de2824:	4658      	mov	r0, fp
c0de2826:	4639      	mov	r1, r7
c0de2828:	f7fe fe07 	bl	c0de143a <polyw_pack>
c0de282c:	f8dd a008 	ldr.w	sl, [sp, #8]
c0de2830:	9901      	ldr	r1, [sp, #4]
c0de2832:	eb0a 008a 	add.w	r0, sl, sl, lsl #2
c0de2836:	eb01 1280 	add.w	r2, r1, r0, lsl #6
c0de283a:	4638      	mov	r0, r7
c0de283c:	f50d 6182 	add.w	r1, sp, #1040	@ 0x410
c0de2840:	f7fe fd54 	bl	c0de12ec <poly_schoolbook_t1>
c0de2844:	4638      	mov	r0, r7
c0de2846:	4659      	mov	r1, fp
c0de2848:	463a      	mov	r2, r7
c0de284a:	f7fe fe2c 	bl	c0de14a6 <polyw_sub>
c0de284e:	4638      	mov	r0, r7
c0de2850:	f7ff f91c 	bl	c0de1a8c <pqcrystals_dilithium2_lowram_poly_reduce>
c0de2854:	4638      	mov	r0, r7
c0de2856:	f7ff f928 	bl	c0de1aaa <pqcrystals_dilithium2_lowram_poly_caddq>
c0de285a:	ad04      	add	r5, sp, #16
c0de285c:	f60d 3154 	addw	r1, sp, #2900	@ 0xb54
c0de2860:	4652      	mov	r2, sl
c0de2862:	4623      	mov	r3, r4
c0de2864:	4628      	mov	r0, r5
c0de2866:	f7fe ffbb 	bl	c0de17e0 <unpack_sig_h_indices>
c0de286a:	b9b8      	cbnz	r0, c0de289c <pqcrystals_dilithium2_lowram_verify+0x1ec>
c0de286c:	f8dd 3b54 	ldr.w	r3, [sp, #2900]	@ 0xb54
c0de2870:	4638      	mov	r0, r7
c0de2872:	4639      	mov	r1, r7
c0de2874:	462a      	mov	r2, r5
c0de2876:	f7fe fff1 	bl	c0de185c <poly_use_hint_lowram>
c0de287a:	4658      	mov	r0, fp
c0de287c:	4639      	mov	r1, r7
c0de287e:	f7ff fbcb 	bl	c0de2018 <pqcrystals_dilithium2_lowram_polyw1_pack>
c0de2882:	a884      	add	r0, sp, #528	@ 0x210
c0de2884:	4659      	mov	r1, fp
c0de2886:	22c0      	movs	r2, #192	@ 0xc0
c0de2888:	f7fe fb35 	bl	c0de0ef6 <inner_keccak256_inject>
c0de288c:	9803      	ldr	r0, [sp, #12]
c0de288e:	9d00      	ldr	r5, [sp, #0]
c0de2890:	f10a 0a01 	add.w	sl, sl, #1
c0de2894:	f500 7080 	add.w	r0, r0, #256	@ 0x100
c0de2898:	9003      	str	r0, [sp, #12]
c0de289a:	e776      	b.n	c0de278a <pqcrystals_dilithium2_lowram_verify+0xda>
c0de289c:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de28a0:	f60d 3d58 	addw	sp, sp, #2904	@ 0xb58
c0de28a4:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de28a8:	ae84      	add	r6, sp, #528	@ 0x210
c0de28aa:	4630      	mov	r0, r6
c0de28ac:	f7fe fb35 	bl	c0de0f1a <inner_keccak256_flip>
c0de28b0:	ad04      	add	r5, sp, #16
c0de28b2:	4630      	mov	r0, r6
c0de28b4:	2220      	movs	r2, #32
c0de28b6:	4629      	mov	r1, r5
c0de28b8:	f7fe fb45 	bl	c0de0f46 <inner_keccak256_extract>
c0de28bc:	2100      	movs	r1, #0
c0de28be:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de28c2:	2920      	cmp	r1, #32
c0de28c4:	d005      	beq.n	c0de28d2 <pqcrystals_dilithium2_lowram_verify+0x222>
c0de28c6:	5c6a      	ldrb	r2, [r5, r1]
c0de28c8:	5c63      	ldrb	r3, [r4, r1]
c0de28ca:	3101      	adds	r1, #1
c0de28cc:	4293      	cmp	r3, r2
c0de28ce:	d0f8      	beq.n	c0de28c2 <pqcrystals_dilithium2_lowram_verify+0x212>
c0de28d0:	e7e6      	b.n	c0de28a0 <pqcrystals_dilithium2_lowram_verify+0x1f0>
c0de28d2:	2000      	movs	r0, #0
c0de28d4:	e7e4      	b.n	c0de28a0 <pqcrystals_dilithium2_lowram_verify+0x1f0>
c0de28d6:	bf00      	nop
c0de28d8:	0001ffb2 	.word	0x0001ffb2
c0de28dc:	ffffe7f1 	.word	0xffffe7f1
c0de28e0:	ffffe805 	.word	0xffffe805

c0de28e4 <pqcrystals_dilithium2_lowram_open>:
c0de28e4:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de28e6:	4604      	mov	r4, r0
c0de28e8:	f640 1074 	movw	r0, #2420	@ 0x974
c0de28ec:	461d      	mov	r5, r3
c0de28ee:	460e      	mov	r6, r1
c0de28f0:	4283      	cmp	r3, r0
c0de28f2:	d311      	bcc.n	c0de2918 <pqcrystals_dilithium2_lowram_open+0x34>
c0de28f4:	e9dd 7108 	ldrd	r7, r1, [sp, #32]
c0de28f8:	f6a5 1374 	subw	r3, r5, #2420	@ 0x974
c0de28fc:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de28fe:	6033      	str	r3, [r6, #0]
c0de2900:	e9cd 7100 	strd	r7, r1, [sp]
c0de2904:	f602 1774 	addw	r7, r2, #2420	@ 0x974
c0de2908:	9002      	str	r0, [sp, #8]
c0de290a:	4610      	mov	r0, r2
c0de290c:	f640 1174 	movw	r1, #2420	@ 0x974
c0de2910:	463a      	mov	r2, r7
c0de2912:	f7ff fecd 	bl	c0de26b0 <pqcrystals_dilithium2_lowram_verify>
c0de2916:	b148      	cbz	r0, c0de292c <pqcrystals_dilithium2_lowram_open+0x48>
c0de2918:	2000      	movs	r0, #0
c0de291a:	6030      	str	r0, [r6, #0]
c0de291c:	b11d      	cbz	r5, c0de2926 <pqcrystals_dilithium2_lowram_open+0x42>
c0de291e:	f804 0b01 	strb.w	r0, [r4], #1
c0de2922:	3d01      	subs	r5, #1
c0de2924:	e7fa      	b.n	c0de291c <pqcrystals_dilithium2_lowram_open+0x38>
c0de2926:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de292a:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
c0de292c:	2000      	movs	r0, #0
c0de292e:	6831      	ldr	r1, [r6, #0]
c0de2930:	4288      	cmp	r0, r1
c0de2932:	bf24      	itt	cs
c0de2934:	2000      	movcs	r0, #0
c0de2936:	bdfe      	popcs	{r1, r2, r3, r4, r5, r6, r7, pc}
c0de2938:	5c39      	ldrb	r1, [r7, r0]
c0de293a:	5421      	strb	r1, [r4, r0]
c0de293c:	3001      	adds	r0, #1
c0de293e:	e7f6      	b.n	c0de292e <pqcrystals_dilithium2_lowram_open+0x4a>

c0de2940 <OUTLINED_FUNCTION_0>:
c0de2940:	4620      	mov	r0, r4
c0de2942:	f7fe baea 	b.w	c0de0f1a <inner_keccak256_flip>
	...

c0de2948 <small_ntt>:
c0de2948:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de294c:	491c      	ldr	r1, [pc, #112]	@ (c0de29c0 <small_ntt+0x78>)
c0de294e:	f04f 0c80 	mov.w	ip, #128	@ 0x80
c0de2952:	f04f 0e01 	mov.w	lr, #1
c0de2956:	f46f 6850 	mvn.w	r8, #3328	@ 0xd00
c0de295a:	4479      	add	r1, pc
c0de295c:	468a      	mov	sl, r1
c0de295e:	4917      	ldr	r1, [pc, #92]	@ (c0de29bc <small_ntt+0x74>)
c0de2960:	468b      	mov	fp, r1
c0de2962:	f1bc 0f02 	cmp.w	ip, #2
c0de2966:	bf38      	it	cc
c0de2968:	e8bd 8df0 	ldmiacc.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de296c:	2600      	movs	r6, #0
c0de296e:	2eff      	cmp	r6, #255	@ 0xff
c0de2970:	d821      	bhi.n	c0de29b6 <small_ntt+0x6e>
c0de2972:	4651      	mov	r1, sl
c0de2974:	f93a 301e 	ldrsh.w	r3, [sl, lr, lsl #1]
c0de2978:	eb06 010c 	add.w	r1, r6, ip
c0de297c:	460f      	mov	r7, r1
c0de297e:	428e      	cmp	r6, r1
c0de2980:	d215      	bcs.n	c0de29ae <small_ntt+0x66>
c0de2982:	f930 2017 	ldrsh.w	r2, [r0, r7, lsl #1]
c0de2986:	465c      	mov	r4, fp
c0de2988:	435a      	muls	r2, r3
c0de298a:	fb02 f40b 	mul.w	r4, r2, fp
c0de298e:	1424      	asrs	r4, r4, #16
c0de2990:	fb04 2208 	mla	r2, r4, r8, r2
c0de2994:	f830 4016 	ldrh.w	r4, [r0, r6, lsl #1]
c0de2998:	eba4 4512 	sub.w	r5, r4, r2, lsr #16
c0de299c:	eb04 4212 	add.w	r2, r4, r2, lsr #16
c0de29a0:	f820 5017 	strh.w	r5, [r0, r7, lsl #1]
c0de29a4:	f820 2016 	strh.w	r2, [r0, r6, lsl #1]
c0de29a8:	3701      	adds	r7, #1
c0de29aa:	3601      	adds	r6, #1
c0de29ac:	e7e7      	b.n	c0de297e <small_ntt+0x36>
c0de29ae:	f10e 0e01 	add.w	lr, lr, #1
c0de29b2:	463e      	mov	r6, r7
c0de29b4:	e7db      	b.n	c0de296e <small_ntt+0x26>
c0de29b6:	ea4f 0c5c 	mov.w	ip, ip, lsr #1
c0de29ba:	e7d2      	b.n	c0de2962 <small_ntt+0x1a>
c0de29bc:	f3010000 	.word	0xf3010000
c0de29c0:	0000b9ee 	.word	0x0000b9ee

c0de29c4 <small_invntt_tomont>:
c0de29c4:	e92d 4dfe 	stmdb	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de29c8:	4934      	ldr	r1, [pc, #208]	@ (c0de2a9c <small_invntt_tomont+0xd8>)
c0de29ca:	4b36      	ldr	r3, [pc, #216]	@ (c0de2aa4 <small_invntt_tomont+0xe0>)
c0de29cc:	2202      	movs	r2, #2
c0de29ce:	247f      	movs	r4, #127	@ 0x7f
c0de29d0:	f644 68bf 	movw	r8, #20159	@ 0x4ebf
c0de29d4:	f46f 6a50 	mvn.w	sl, #3328	@ 0xd00
c0de29d8:	468e      	mov	lr, r1
c0de29da:	4931      	ldr	r1, [pc, #196]	@ (c0de2aa0 <small_invntt_tomont+0xdc>)
c0de29dc:	447b      	add	r3, pc
c0de29de:	9300      	str	r3, [sp, #0]
c0de29e0:	f101 5bd3 	add.w	fp, r1, #442499072	@ 0x1a600000
c0de29e4:	2a80      	cmp	r2, #128	@ 0x80
c0de29e6:	d834      	bhi.n	c0de2a52 <small_invntt_tomont+0x8e>
c0de29e8:	2300      	movs	r3, #0
c0de29ea:	9201      	str	r2, [sp, #4]
c0de29ec:	2bff      	cmp	r3, #255	@ 0xff
c0de29ee:	d82e      	bhi.n	c0de2a4e <small_invntt_tomont+0x8a>
c0de29f0:	9900      	ldr	r1, [sp, #0]
c0de29f2:	9402      	str	r4, [sp, #8]
c0de29f4:	f931 4014 	ldrsh.w	r4, [r1, r4, lsl #1]
c0de29f8:	1899      	adds	r1, r3, r2
c0de29fa:	460d      	mov	r5, r1
c0de29fc:	428b      	cmp	r3, r1
c0de29fe:	d221      	bcs.n	c0de2a44 <small_invntt_tomont+0x80>
c0de2a00:	f830 6013 	ldrh.w	r6, [r0, r3, lsl #1]
c0de2a04:	f830 2015 	ldrh.w	r2, [r0, r5, lsl #1]
c0de2a08:	46f4      	mov	ip, lr
c0de2a0a:	4432      	add	r2, r6
c0de2a0c:	b217      	sxth	r7, r2
c0de2a0e:	fb07 f708 	mul.w	r7, r7, r8
c0de2a12:	f107 7700 	add.w	r7, r7, #33554432	@ 0x2000000
c0de2a16:	16bf      	asrs	r7, r7, #26
c0de2a18:	fb07 f70e 	mul.w	r7, r7, lr
c0de2a1c:	eba2 4217 	sub.w	r2, r2, r7, lsr #16
c0de2a20:	f820 2013 	strh.w	r2, [r0, r3, lsl #1]
c0de2a24:	3301      	adds	r3, #1
c0de2a26:	f830 2015 	ldrh.w	r2, [r0, r5, lsl #1]
c0de2a2a:	1b92      	subs	r2, r2, r6
c0de2a2c:	b212      	sxth	r2, r2
c0de2a2e:	4362      	muls	r2, r4
c0de2a30:	fb02 f60b 	mul.w	r6, r2, fp
c0de2a34:	1436      	asrs	r6, r6, #16
c0de2a36:	fb06 220a 	mla	r2, r6, sl, r2
c0de2a3a:	0c12      	lsrs	r2, r2, #16
c0de2a3c:	f820 2015 	strh.w	r2, [r0, r5, lsl #1]
c0de2a40:	3501      	adds	r5, #1
c0de2a42:	e7db      	b.n	c0de29fc <small_invntt_tomont+0x38>
c0de2a44:	9c02      	ldr	r4, [sp, #8]
c0de2a46:	9a01      	ldr	r2, [sp, #4]
c0de2a48:	462b      	mov	r3, r5
c0de2a4a:	3c01      	subs	r4, #1
c0de2a4c:	e7ce      	b.n	c0de29ec <small_invntt_tomont+0x28>
c0de2a4e:	0052      	lsls	r2, r2, #1
c0de2a50:	e7c8      	b.n	c0de29e4 <small_invntt_tomont+0x20>
c0de2a52:	2100      	movs	r1, #0
c0de2a54:	f240 52a1 	movw	r2, #1441	@ 0x5a1
c0de2a58:	f46f 6350 	mvn.w	r3, #3328	@ 0xd00
c0de2a5c:	f644 64bf 	movw	r4, #20159	@ 0x4ebf
c0de2a60:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de2a64:	bf08      	it	eq
c0de2a66:	e8bd 8dfe 	ldmiaeq.w	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de2a6a:	f930 5011 	ldrsh.w	r5, [r0, r1, lsl #1]
c0de2a6e:	4f0c      	ldr	r7, [pc, #48]	@ (c0de2aa0 <small_invntt_tomont+0xdc>)
c0de2a70:	fb05 f602 	mul.w	r6, r5, r2
c0de2a74:	437d      	muls	r5, r7
c0de2a76:	4677      	mov	r7, lr
c0de2a78:	142d      	asrs	r5, r5, #16
c0de2a7a:	fb05 6503 	mla	r5, r5, r3, r6
c0de2a7e:	142e      	asrs	r6, r5, #16
c0de2a80:	0c2d      	lsrs	r5, r5, #16
c0de2a82:	4366      	muls	r6, r4
c0de2a84:	f106 7600 	add.w	r6, r6, #33554432	@ 0x2000000
c0de2a88:	16b6      	asrs	r6, r6, #26
c0de2a8a:	fb06 f60e 	mul.w	r6, r6, lr
c0de2a8e:	eba5 4516 	sub.w	r5, r5, r6, lsr #16
c0de2a92:	f820 5011 	strh.w	r5, [r0, r1, lsl #1]
c0de2a96:	3101      	adds	r1, #1
c0de2a98:	e7e2      	b.n	c0de2a60 <small_invntt_tomont+0x9c>
c0de2a9a:	bf00      	nop
c0de2a9c:	0d010000 	.word	0x0d010000
c0de2aa0:	d8a10000 	.word	0xd8a10000
c0de2aa4:	0000b96c 	.word	0x0000b96c

c0de2aa8 <small_basemul>:
c0de2aa8:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2aaa:	f9b1 c000 	ldrsh.w	ip, [r1]
c0de2aae:	f9b1 5002 	ldrsh.w	r5, [r1, #2]
c0de2ab2:	f9b2 1002 	ldrsh.w	r1, [r2, #2]
c0de2ab6:	f46f 6e50 	mvn.w	lr, #3328	@ 0xd00
c0de2aba:	f9b2 6000 	ldrsh.w	r6, [r2]
c0de2abe:	fb01 f705 	mul.w	r7, r1, r5
c0de2ac2:	4916      	ldr	r1, [pc, #88]	@ (c0de2b1c <small_basemul+0x74>)
c0de2ac4:	fb07 f401 	mul.w	r4, r7, r1
c0de2ac8:	1424      	asrs	r4, r4, #16
c0de2aca:	fb04 740e 	mla	r4, r4, lr, r7
c0de2ace:	1424      	asrs	r4, r4, #16
c0de2ad0:	4363      	muls	r3, r4
c0de2ad2:	fb03 f401 	mul.w	r4, r3, r1
c0de2ad6:	1424      	asrs	r4, r4, #16
c0de2ad8:	fb04 330e 	mla	r3, r4, lr, r3
c0de2adc:	fb06 f40c 	mul.w	r4, r6, ip
c0de2ae0:	fb04 f701 	mul.w	r7, r4, r1
c0de2ae4:	143f      	asrs	r7, r7, #16
c0de2ae6:	0c1b      	lsrs	r3, r3, #16
c0de2ae8:	fb07 440e 	mla	r4, r7, lr, r4
c0de2aec:	eb03 4314 	add.w	r3, r3, r4, lsr #16
c0de2af0:	8003      	strh	r3, [r0, #0]
c0de2af2:	fb06 f305 	mul.w	r3, r6, r5
c0de2af6:	f9b2 2002 	ldrsh.w	r2, [r2, #2]
c0de2afa:	fb03 f401 	mul.w	r4, r3, r1
c0de2afe:	1424      	asrs	r4, r4, #16
c0de2b00:	fb02 f20c 	mul.w	r2, r2, ip
c0de2b04:	fb04 330e 	mla	r3, r4, lr, r3
c0de2b08:	4351      	muls	r1, r2
c0de2b0a:	1409      	asrs	r1, r1, #16
c0de2b0c:	fb01 210e 	mla	r1, r1, lr, r2
c0de2b10:	0c09      	lsrs	r1, r1, #16
c0de2b12:	eb01 4113 	add.w	r1, r1, r3, lsr #16
c0de2b16:	8041      	strh	r1, [r0, #2]
c0de2b18:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de2b1a:	bf00      	nop
c0de2b1c:	f3010000 	.word	0xf3010000

c0de2b20 <poly_small_ntt_copy>:
c0de2b20:	22ff      	movs	r2, #255	@ 0xff
c0de2b22:	f1b2 3fff 	cmp.w	r2, #4294967295	@ 0xffffffff
c0de2b26:	bfd8      	it	le
c0de2b28:	f7ff bf0e 	ble.w	c0de2948 <small_ntt>
c0de2b2c:	f851 3022 	ldr.w	r3, [r1, r2, lsl #2]
c0de2b30:	f820 3012 	strh.w	r3, [r0, r2, lsl #1]
c0de2b34:	3a01      	subs	r2, #1
c0de2b36:	e7f4      	b.n	c0de2b22 <poly_small_ntt_copy+0x2>

c0de2b38 <poly_small_basemul>:
c0de2b38:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de2b3c:	e9cd 1200 	strd	r1, r2, [sp]
c0de2b40:	4683      	mov	fp, r0
c0de2b42:	f04f 0a00 	mov.w	sl, #0
c0de2b46:	4811      	ldr	r0, [pc, #68]	@ (c0de2b8c <poly_small_basemul+0x54>)
c0de2b48:	4478      	add	r0, pc
c0de2b4a:	f100 0880 	add.w	r8, r0, #128	@ 0x80
c0de2b4e:	f5ba 7f00 	cmp.w	sl, #512	@ 0x200
c0de2b52:	bf08      	it	eq
c0de2b54:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de2b58:	9800      	ldr	r0, [sp, #0]
c0de2b5a:	f938 6b02 	ldrsh.w	r6, [r8], #2
c0de2b5e:	eb0b 070a 	add.w	r7, fp, sl
c0de2b62:	eb00 040a 	add.w	r4, r0, sl
c0de2b66:	9801      	ldr	r0, [sp, #4]
c0de2b68:	4633      	mov	r3, r6
c0de2b6a:	4621      	mov	r1, r4
c0de2b6c:	eb00 050a 	add.w	r5, r0, sl
c0de2b70:	4638      	mov	r0, r7
c0de2b72:	462a      	mov	r2, r5
c0de2b74:	f7ff ff98 	bl	c0de2aa8 <small_basemul>
c0de2b78:	4273      	negs	r3, r6
c0de2b7a:	1d38      	adds	r0, r7, #4
c0de2b7c:	1d21      	adds	r1, r4, #4
c0de2b7e:	1d2a      	adds	r2, r5, #4
c0de2b80:	b21b      	sxth	r3, r3
c0de2b82:	f7ff ff91 	bl	c0de2aa8 <small_basemul>
c0de2b86:	f10a 0a08 	add.w	sl, sl, #8
c0de2b8a:	e7e0      	b.n	c0de2b4e <poly_small_basemul+0x16>
c0de2b8c:	0000b800 	.word	0x0000b800

c0de2b90 <poly_small_basemul_invntt>:
c0de2b90:	b510      	push	{r4, lr}
c0de2b92:	4604      	mov	r4, r0
c0de2b94:	f7ff ffd0 	bl	c0de2b38 <poly_small_basemul>
c0de2b98:	4620      	mov	r0, r4
c0de2b9a:	f7ff ff13 	bl	c0de29c4 <small_invntt_tomont>
c0de2b9e:	20ff      	movs	r0, #255	@ 0xff
c0de2ba0:	2800      	cmp	r0, #0
c0de2ba2:	d405      	bmi.n	c0de2bb0 <poly_small_basemul_invntt+0x20>
c0de2ba4:	f934 1010 	ldrsh.w	r1, [r4, r0, lsl #1]
c0de2ba8:	f844 1020 	str.w	r1, [r4, r0, lsl #2]
c0de2bac:	3801      	subs	r0, #1
c0de2bae:	e7f7      	b.n	c0de2ba0 <poly_small_basemul_invntt+0x10>
c0de2bb0:	bd10      	pop	{r4, pc}

c0de2bb2 <small_polyeta_unpack>:
c0de2bb2:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2bb6:	3101      	adds	r1, #1
c0de2bb8:	f04f 0c00 	mov.w	ip, #0
c0de2bbc:	f5bc 7f00 	cmp.w	ip, #512	@ 0x200
c0de2bc0:	bf08      	it	eq
c0de2bc2:	e8bd 8df0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de2bc6:	f811 4c01 	ldrb.w	r4, [r1, #-1]
c0de2bca:	f004 0807 	and.w	r8, r4, #7
c0de2bce:	eb00 040c 	add.w	r4, r0, ip
c0de2bd2:	f820 800c 	strh.w	r8, [r0, ip]
c0de2bd6:	f1c8 0202 	rsb	r2, r8, #2
c0de2bda:	f811 5c01 	ldrb.w	r5, [r1, #-1]
c0de2bde:	f3c5 0ec2 	ubfx	lr, r5, #3, #3
c0de2be2:	f8a4 e002 	strh.w	lr, [r4, #2]
c0de2be6:	f811 6c01 	ldrb.w	r6, [r1, #-1]
c0de2bea:	780b      	ldrb	r3, [r1, #0]
c0de2bec:	09b6      	lsrs	r6, r6, #6
c0de2bee:	f363 0682 	bfi	r6, r3, #2, #1
c0de2bf2:	80a6      	strh	r6, [r4, #4]
c0de2bf4:	780b      	ldrb	r3, [r1, #0]
c0de2bf6:	f3c3 0a42 	ubfx	sl, r3, #1, #3
c0de2bfa:	f8a4 a006 	strh.w	sl, [r4, #6]
c0de2bfe:	780d      	ldrb	r5, [r1, #0]
c0de2c00:	f3c5 1502 	ubfx	r5, r5, #4, #3
c0de2c04:	8125      	strh	r5, [r4, #8]
c0de2c06:	780f      	ldrb	r7, [r1, #0]
c0de2c08:	784b      	ldrb	r3, [r1, #1]
c0de2c0a:	09ff      	lsrs	r7, r7, #7
c0de2c0c:	f363 0742 	bfi	r7, r3, #1, #2
c0de2c10:	8167      	strh	r7, [r4, #10]
c0de2c12:	784b      	ldrb	r3, [r1, #1]
c0de2c14:	f3c3 0382 	ubfx	r3, r3, #2, #3
c0de2c18:	81a3      	strh	r3, [r4, #12]
c0de2c1a:	f891 b001 	ldrb.w	fp, [r1, #1]
c0de2c1e:	f820 200c 	strh.w	r2, [r0, ip]
c0de2c22:	f1c3 0202 	rsb	r2, r3, #2
c0de2c26:	3103      	adds	r1, #3
c0de2c28:	f10c 0c10 	add.w	ip, ip, #16
c0de2c2c:	81a2      	strh	r2, [r4, #12]
c0de2c2e:	f1c7 0202 	rsb	r2, r7, #2
c0de2c32:	8162      	strh	r2, [r4, #10]
c0de2c34:	f1c5 0202 	rsb	r2, r5, #2
c0de2c38:	8122      	strh	r2, [r4, #8]
c0de2c3a:	f1ca 0202 	rsb	r2, sl, #2
c0de2c3e:	80e2      	strh	r2, [r4, #6]
c0de2c40:	f1c6 0202 	rsb	r2, r6, #2
c0de2c44:	80a2      	strh	r2, [r4, #4]
c0de2c46:	f1ce 0202 	rsb	r2, lr, #2
c0de2c4a:	8062      	strh	r2, [r4, #2]
c0de2c4c:	2202      	movs	r2, #2
c0de2c4e:	eba2 125b 	sub.w	r2, r2, fp, lsr #5
c0de2c52:	81e2      	strh	r2, [r4, #14]
c0de2c54:	e7b2      	b.n	c0de2bbc <small_polyeta_unpack+0xa>

c0de2c56 <os_io_handle_default_apdu>:
c0de2c56:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2c58:	b09d      	sub	sp, #116	@ 0x74
c0de2c5a:	4615      	mov	r5, r2
c0de2c5c:	9a22      	ldr	r2, [sp, #136]	@ 0x88
c0de2c5e:	b3c8      	cbz	r0, c0de2cd4 <os_io_handle_default_apdu+0x7e>
c0de2c60:	b3c1      	cbz	r1, c0de2cd4 <os_io_handle_default_apdu+0x7e>
c0de2c62:	b3bd      	cbz	r5, c0de2cd4 <os_io_handle_default_apdu+0x7e>
c0de2c64:	461c      	mov	r4, r3
c0de2c66:	b3ab      	cbz	r3, c0de2cd4 <os_io_handle_default_apdu+0x7e>
c0de2c68:	b10a      	cbz	r2, c0de2c6e <os_io_handle_default_apdu+0x18>
c0de2c6a:	2100      	movs	r1, #0
c0de2c6c:	7011      	strb	r1, [r2, #0]
c0de2c6e:	7801      	ldrb	r1, [r0, #0]
c0de2c70:	29b0      	cmp	r1, #176	@ 0xb0
c0de2c72:	d131      	bne.n	c0de2cd8 <os_io_handle_default_apdu+0x82>
c0de2c74:	7841      	ldrb	r1, [r0, #1]
c0de2c76:	29a7      	cmp	r1, #167	@ 0xa7
c0de2c78:	d031      	beq.n	c0de2cde <os_io_handle_default_apdu+0x88>
c0de2c7a:	2906      	cmp	r1, #6
c0de2c7c:	d036      	beq.n	c0de2cec <os_io_handle_default_apdu+0x96>
c0de2c7e:	2901      	cmp	r1, #1
c0de2c80:	d131      	bne.n	c0de2ce6 <os_io_handle_default_apdu+0x90>
c0de2c82:	7881      	ldrb	r1, [r0, #2]
c0de2c84:	bb79      	cbnz	r1, c0de2ce6 <os_io_handle_default_apdu+0x90>
c0de2c86:	78c0      	ldrb	r0, [r0, #3]
c0de2c88:	bb68      	cbnz	r0, c0de2ce6 <os_io_handle_default_apdu+0x90>
c0de2c8a:	6820      	ldr	r0, [r4, #0]
c0de2c8c:	2100      	movs	r1, #0
c0de2c8e:	6021      	str	r1, [r4, #0]
c0de2c90:	2803      	cmp	r0, #3
c0de2c92:	d321      	bcc.n	c0de2cd8 <os_io_handle_default_apdu+0x82>
c0de2c94:	2601      	movs	r6, #1
c0de2c96:	1ec7      	subs	r7, r0, #3
c0de2c98:	6026      	str	r6, [r4, #0]
c0de2c9a:	702e      	strb	r6, [r5, #0]
c0de2c9c:	6820      	ldr	r0, [r4, #0]
c0de2c9e:	1a3a      	subs	r2, r7, r0
c0de2ca0:	4428      	add	r0, r5
c0de2ca2:	1c41      	adds	r1, r0, #1
c0de2ca4:	2001      	movs	r0, #1
c0de2ca6:	f008 f903 	bl	c0deaeb0 <os_registry_get_current_app_tag>
c0de2caa:	f000 f83f 	bl	c0de2d2c <OUTLINED_FUNCTION_0>
c0de2cae:	6020      	str	r0, [r4, #0]
c0de2cb0:	1a3a      	subs	r2, r7, r0
c0de2cb2:	4428      	add	r0, r5
c0de2cb4:	1c41      	adds	r1, r0, #1
c0de2cb6:	2002      	movs	r0, #2
c0de2cb8:	f008 f8fa 	bl	c0deaeb0 <os_registry_get_current_app_tag>
c0de2cbc:	f000 f836 	bl	c0de2d2c <OUTLINED_FUNCTION_0>
c0de2cc0:	1c41      	adds	r1, r0, #1
c0de2cc2:	6021      	str	r1, [r4, #0]
c0de2cc4:	542e      	strb	r6, [r5, r0]
c0de2cc6:	f008 f8df 	bl	c0deae88 <os_flags>
c0de2cca:	6821      	ldr	r1, [r4, #0]
c0de2ccc:	1c4a      	adds	r2, r1, #1
c0de2cce:	6022      	str	r2, [r4, #0]
c0de2cd0:	5468      	strb	r0, [r5, r1]
c0de2cd2:	e028      	b.n	c0de2d26 <os_io_handle_default_apdu+0xd0>
c0de2cd4:	7814      	ldrb	r4, [r2, #0]
c0de2cd6:	e01e      	b.n	c0de2d16 <os_io_handle_default_apdu+0xc0>
c0de2cd8:	f646 1485 	movw	r4, #27013	@ 0x6985
c0de2cdc:	e01b      	b.n	c0de2d16 <os_io_handle_default_apdu+0xc0>
c0de2cde:	7881      	ldrb	r1, [r0, #2]
c0de2ce0:	b909      	cbnz	r1, c0de2ce6 <os_io_handle_default_apdu+0x90>
c0de2ce2:	78c0      	ldrb	r0, [r0, #3]
c0de2ce4:	b1d0      	cbz	r0, c0de2d1c <os_io_handle_default_apdu+0xc6>
c0de2ce6:	f44f 44dc 	mov.w	r4, #28160	@ 0x6e00
c0de2cea:	e014      	b.n	c0de2d16 <os_io_handle_default_apdu+0xc0>
c0de2cec:	2100      	movs	r1, #0
c0de2cee:	6021      	str	r1, [r4, #0]
c0de2cf0:	7883      	ldrb	r3, [r0, #2]
c0de2cf2:	7902      	ldrb	r2, [r0, #4]
c0de2cf4:	ad02      	add	r5, sp, #8
c0de2cf6:	e9cd 1500 	strd	r1, r5, [sp]
c0de2cfa:	1d41      	adds	r1, r0, #5
c0de2cfc:	4618      	mov	r0, r3
c0de2cfe:	2300      	movs	r3, #0
c0de2d00:	f008 f896 	bl	c0deae30 <os_pki_load_certificate>
c0de2d04:	4604      	mov	r4, r0
c0de2d06:	4628      	mov	r0, r5
c0de2d08:	216c      	movs	r1, #108	@ 0x6c
c0de2d0a:	f008 fa5f 	bl	c0deb1cc <explicit_bzero>
c0de2d0e:	2c00      	cmp	r4, #0
c0de2d10:	bf08      	it	eq
c0de2d12:	f44f 4410 	moveq.w	r4, #36864	@ 0x9000
c0de2d16:	4620      	mov	r0, r4
c0de2d18:	b01d      	add	sp, #116	@ 0x74
c0de2d1a:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de2d1c:	2000      	movs	r0, #0
c0de2d1e:	6020      	str	r0, [r4, #0]
c0de2d20:	b10a      	cbz	r2, c0de2d26 <os_io_handle_default_apdu+0xd0>
c0de2d22:	2001      	movs	r0, #1
c0de2d24:	7010      	strb	r0, [r2, #0]
c0de2d26:	f44f 4410 	mov.w	r4, #36864	@ 0x9000
c0de2d2a:	e7f4      	b.n	c0de2d16 <os_io_handle_default_apdu+0xc0>

c0de2d2c <OUTLINED_FUNCTION_0>:
c0de2d2c:	6821      	ldr	r1, [r4, #0]
c0de2d2e:	1c4a      	adds	r2, r1, #1
c0de2d30:	6022      	str	r2, [r4, #0]
c0de2d32:	5468      	strb	r0, [r5, r1]
c0de2d34:	6821      	ldr	r1, [r4, #0]
c0de2d36:	4408      	add	r0, r1
c0de2d38:	4770      	bx	lr

c0de2d3a <os_io_seph_cmd_piezo_play_tune>:
c0de2d3a:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0de2d3c:	280b      	cmp	r0, #11
c0de2d3e:	d902      	bls.n	c0de2d46 <os_io_seph_cmd_piezo_play_tune+0xc>
c0de2d40:	f06f 0415 	mvn.w	r4, #21
c0de2d44:	e021      	b.n	c0de2d8a <os_io_seph_cmd_piezo_play_tune+0x50>
c0de2d46:	4605      	mov	r5, r0
c0de2d48:	2009      	movs	r0, #9
c0de2d4a:	2100      	movs	r1, #0
c0de2d4c:	2200      	movs	r2, #0
c0de2d4e:	2400      	movs	r4, #0
c0de2d50:	f008 f8a2 	bl	c0deae98 <os_setting_get>
c0de2d54:	2d08      	cmp	r5, #8
c0de2d56:	d802      	bhi.n	c0de2d5e <os_io_seph_cmd_piezo_play_tune+0x24>
c0de2d58:	f010 0102 	ands.w	r1, r0, #2
c0de2d5c:	d115      	bne.n	c0de2d8a <os_io_seph_cmd_piezo_play_tune+0x50>
c0de2d5e:	2400      	movs	r4, #0
c0de2d60:	2d09      	cmp	r5, #9
c0de2d62:	d302      	bcc.n	c0de2d6a <os_io_seph_cmd_piezo_play_tune+0x30>
c0de2d64:	f010 0001 	ands.w	r0, r0, #1
c0de2d68:	d10f      	bne.n	c0de2d8a <os_io_seph_cmd_piezo_play_tune+0x50>
c0de2d6a:	2056      	movs	r0, #86	@ 0x56
c0de2d6c:	f88d 5007 	strb.w	r5, [sp, #7]
c0de2d70:	f88d 4005 	strb.w	r4, [sp, #5]
c0de2d74:	2204      	movs	r2, #4
c0de2d76:	2300      	movs	r3, #0
c0de2d78:	f88d 0004 	strb.w	r0, [sp, #4]
c0de2d7c:	2001      	movs	r0, #1
c0de2d7e:	f88d 0006 	strb.w	r0, [sp, #6]
c0de2d82:	a901      	add	r1, sp, #4
c0de2d84:	f000 f803 	bl	c0de2d8e <OUTLINED_FUNCTION_1>
c0de2d88:	4604      	mov	r4, r0
c0de2d8a:	4620      	mov	r0, r4
c0de2d8c:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0de2d8e <OUTLINED_FUNCTION_1>:
c0de2d8e:	2001      	movs	r0, #1
c0de2d90:	f008 b8b8 	b.w	c0deaf04 <os_io_tx_cmd>

c0de2d94 <io_process_itc_ux_event>:
c0de2d94:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de2d96:	4605      	mov	r5, r0
c0de2d98:	78c0      	ldrb	r0, [r0, #3]
c0de2d9a:	2820      	cmp	r0, #32
c0de2d9c:	d023      	beq.n	c0de2de6 <io_process_itc_ux_event+0x52>
c0de2d9e:	2823      	cmp	r0, #35	@ 0x23
c0de2da0:	d029      	beq.n	c0de2df6 <io_process_itc_ux_event+0x62>
c0de2da2:	460c      	mov	r4, r1
c0de2da4:	2822      	cmp	r0, #34	@ 0x22
c0de2da6:	d132      	bne.n	c0de2e0e <io_process_itc_ux_event+0x7a>
c0de2da8:	4e1f      	ldr	r6, [pc, #124]	@ (c0de2e28 <io_process_itc_ux_event+0x94>)
c0de2daa:	2006      	movs	r0, #6
c0de2dac:	2118      	movs	r1, #24
c0de2dae:	f809 0006 	strb.w	r0, [r9, r6]
c0de2db2:	eb09 0706 	add.w	r7, r9, r6
c0de2db6:	2018      	movs	r0, #24
c0de2db8:	6078      	str	r0, [r7, #4]
c0de2dba:	f107 0008 	add.w	r0, r7, #8
c0de2dbe:	f008 f9f7 	bl	c0deb1b0 <__aeabi_memclr>
c0de2dc2:	7928      	ldrb	r0, [r5, #4]
c0de2dc4:	7238      	strb	r0, [r7, #8]
c0de2dc6:	7868      	ldrb	r0, [r5, #1]
c0de2dc8:	78a9      	ldrb	r1, [r5, #2]
c0de2dca:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de2dce:	3802      	subs	r0, #2
c0de2dd0:	0401      	lsls	r1, r0, #16
c0de2dd2:	d005      	beq.n	c0de2de0 <io_process_itc_ux_event+0x4c>
c0de2dd4:	b282      	uxth	r2, r0
c0de2dd6:	2a10      	cmp	r2, #16
c0de2dd8:	d802      	bhi.n	c0de2de0 <io_process_itc_ux_event+0x4c>
c0de2dda:	1f60      	subs	r0, r4, #5
c0de2ddc:	4290      	cmp	r0, r2
c0de2dde:	d218      	bcs.n	c0de2e12 <io_process_itc_ux_event+0x7e>
c0de2de0:	f06f 0415 	mvn.w	r4, #21
c0de2de4:	e013      	b.n	c0de2e0e <io_process_itc_ux_event+0x7a>
c0de2de6:	2001      	movs	r0, #1
c0de2de8:	f007 fdbc 	bl	c0dea964 <nbgl_objAllowDrawing>
c0de2dec:	f007 fdc9 	bl	c0dea982 <nbgl_screenRedraw>
c0de2df0:	f007 fd9f 	bl	c0dea932 <nbgl_refresh>
c0de2df4:	e00a      	b.n	c0de2e0c <io_process_itc_ux_event+0x78>
c0de2df6:	480c      	ldr	r0, [pc, #48]	@ (c0de2e28 <io_process_itc_ux_event+0x94>)
c0de2df8:	2107      	movs	r1, #7
c0de2dfa:	f809 1000 	strb.w	r1, [r9, r0]
c0de2dfe:	4448      	add	r0, r9
c0de2e00:	2101      	movs	r1, #1
c0de2e02:	6041      	str	r1, [r0, #4]
c0de2e04:	7929      	ldrb	r1, [r5, #4]
c0de2e06:	7201      	strb	r1, [r0, #8]
c0de2e08:	f008 f834 	bl	c0deae74 <os_ux>
c0de2e0c:	2400      	movs	r4, #0
c0de2e0e:	4620      	mov	r0, r4
c0de2e10:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de2e12:	eb09 0406 	add.w	r4, r9, r6
c0de2e16:	1d69      	adds	r1, r5, #5
c0de2e18:	f104 0010 	add.w	r0, r4, #16
c0de2e1c:	60e2      	str	r2, [r4, #12]
c0de2e1e:	f008 f9bd 	bl	c0deb19c <__aeabi_memcpy>
c0de2e22:	4620      	mov	r0, r4
c0de2e24:	e7f0      	b.n	c0de2e08 <io_process_itc_ux_event+0x74>
c0de2e26:	bf00      	nop
c0de2e28:	00001e20 	.word	0x00001e20

c0de2e2c <io_legacy_apdu_tx>:
c0de2e2c:	b5b0      	push	{r4, r5, r7, lr}
c0de2e2e:	460a      	mov	r2, r1
c0de2e30:	4601      	mov	r1, r0
c0de2e32:	4808      	ldr	r0, [pc, #32]	@ (c0de2e54 <io_legacy_apdu_tx+0x28>)
c0de2e34:	2300      	movs	r3, #0
c0de2e36:	2500      	movs	r5, #0
c0de2e38:	eb09 0400 	add.w	r4, r9, r0
c0de2e3c:	7860      	ldrb	r0, [r4, #1]
c0de2e3e:	f008 f861 	bl	c0deaf04 <os_io_tx_cmd>
c0de2e42:	4905      	ldr	r1, [pc, #20]	@ (c0de2e58 <io_legacy_apdu_tx+0x2c>)
c0de2e44:	7065      	strb	r5, [r4, #1]
c0de2e46:	f809 5001 	strb.w	r5, [r9, r1]
c0de2e4a:	4904      	ldr	r1, [pc, #16]	@ (c0de2e5c <io_legacy_apdu_tx+0x30>)
c0de2e4c:	4449      	add	r1, r9
c0de2e4e:	718d      	strb	r5, [r1, #6]
c0de2e50:	bdb0      	pop	{r4, r5, r7, pc}
c0de2e52:	bf00      	nop
c0de2e54:	00001748 	.word	0x00001748
c0de2e58:	00001e40 	.word	0x00001e40
c0de2e5c:	0000173c 	.word	0x0000173c

c0de2e60 <io_legacy_apdu_rx>:
c0de2e60:	e92d 41ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
c0de2e64:	4e8c      	ldr	r6, [pc, #560]	@ (c0de3098 <io_legacy_apdu_rx+0x238>)
c0de2e66:	2100      	movs	r1, #0
c0de2e68:	4605      	mov	r5, r0
c0de2e6a:	2200      	movs	r2, #0
c0de2e6c:	2301      	movs	r3, #1
c0de2e6e:	f88d 100f 	strb.w	r1, [sp, #15]
c0de2e72:	f240 1111 	movw	r1, #273	@ 0x111
c0de2e76:	eb09 0006 	add.w	r0, r9, r6
c0de2e7a:	f008 f84f 	bl	c0deaf1c <os_io_rx_evt>
c0de2e7e:	4604      	mov	r4, r0
c0de2e80:	2801      	cmp	r0, #1
c0de2e82:	f2c0 8100 	blt.w	c0de3086 <io_legacy_apdu_rx+0x226>
c0de2e86:	f819 0006 	ldrb.w	r0, [r9, r6]
c0de2e8a:	f1a0 0110 	sub.w	r1, r0, #16
c0de2e8e:	2916      	cmp	r1, #22
c0de2e90:	d844      	bhi.n	c0de2f1c <io_legacy_apdu_rx+0xbc>
c0de2e92:	2201      	movs	r2, #1
c0de2e94:	fa02 f101 	lsl.w	r1, r2, r1
c0de2e98:	4a80      	ldr	r2, [pc, #512]	@ (c0de309c <io_legacy_apdu_rx+0x23c>)
c0de2e9a:	4211      	tst	r1, r2
c0de2e9c:	d03e      	beq.n	c0de2f1c <io_legacy_apdu_rx+0xbc>
c0de2e9e:	4f80      	ldr	r7, [pc, #512]	@ (c0de30a0 <io_legacy_apdu_rx+0x240>)
c0de2ea0:	eb09 0107 	add.w	r1, r9, r7
c0de2ea4:	7048      	strb	r0, [r1, #1]
c0de2ea6:	f007 ffd3 	bl	c0deae50 <os_perso_is_pin_set>
c0de2eaa:	28aa      	cmp	r0, #170	@ 0xaa
c0de2eac:	d103      	bne.n	c0de2eb6 <io_legacy_apdu_rx+0x56>
c0de2eae:	f007 ffd8 	bl	c0deae62 <os_global_pin_is_validated>
c0de2eb2:	28aa      	cmp	r0, #170	@ 0xaa
c0de2eb4:	d161      	bne.n	c0de2f7a <io_legacy_apdu_rx+0x11a>
c0de2eb6:	eb09 0006 	add.w	r0, r9, r6
c0de2eba:	7840      	ldrb	r0, [r0, #1]
c0de2ebc:	28b0      	cmp	r0, #176	@ 0xb0
c0de2ebe:	d135      	bne.n	c0de2f2c <io_legacy_apdu_rx+0xcc>
c0de2ec0:	f240 1011 	movw	r0, #273	@ 0x111
c0de2ec4:	1e61      	subs	r1, r4, #1
c0de2ec6:	9002      	str	r0, [sp, #8]
c0de2ec8:	f10d 000f 	add.w	r0, sp, #15
c0de2ecc:	9000      	str	r0, [sp, #0]
c0de2ece:	4875      	ldr	r0, [pc, #468]	@ (c0de30a4 <io_legacy_apdu_rx+0x244>)
c0de2ed0:	ab02      	add	r3, sp, #8
c0de2ed2:	eb09 0500 	add.w	r5, r9, r0
c0de2ed6:	eb09 0006 	add.w	r0, r9, r6
c0de2eda:	3001      	adds	r0, #1
c0de2edc:	462a      	mov	r2, r5
c0de2ede:	f7ff feba 	bl	c0de2c56 <os_io_handle_default_apdu>
c0de2ee2:	2400      	movs	r4, #0
c0de2ee4:	9902      	ldr	r1, [sp, #8]
c0de2ee6:	eb09 0607 	add.w	r6, r9, r7
c0de2eea:	f5b0 4f10 	cmp.w	r0, #36864	@ 0x9000
c0de2eee:	bf18      	it	ne
c0de2ef0:	4621      	movne	r1, r4
c0de2ef2:	0a02      	lsrs	r2, r0, #8
c0de2ef4:	2300      	movs	r3, #0
c0de2ef6:	546a      	strb	r2, [r5, r1]
c0de2ef8:	186a      	adds	r2, r5, r1
c0de2efa:	7050      	strb	r0, [r2, #1]
c0de2efc:	1c88      	adds	r0, r1, #2
c0de2efe:	4629      	mov	r1, r5
c0de2f00:	9002      	str	r0, [sp, #8]
c0de2f02:	b282      	uxth	r2, r0
c0de2f04:	7870      	ldrb	r0, [r6, #1]
c0de2f06:	f007 fffd 	bl	c0deaf04 <os_io_tx_cmd>
c0de2f0a:	f89d 100f 	ldrb.w	r1, [sp, #15]
c0de2f0e:	7074      	strb	r4, [r6, #1]
c0de2f10:	2901      	cmp	r1, #1
c0de2f12:	f000 80bd 	beq.w	c0de3090 <io_legacy_apdu_rx+0x230>
c0de2f16:	ea00 75e0 	and.w	r5, r0, r0, asr #31
c0de2f1a:	e0b5      	b.n	c0de3088 <io_legacy_apdu_rx+0x228>
c0de2f1c:	1e41      	subs	r1, r0, #1
c0de2f1e:	2902      	cmp	r1, #2
c0de2f20:	d33d      	bcc.n	c0de2f9e <io_legacy_apdu_rx+0x13e>
c0de2f22:	2830      	cmp	r0, #48	@ 0x30
c0de2f24:	d0bb      	beq.n	c0de2e9e <io_legacy_apdu_rx+0x3e>
c0de2f26:	2840      	cmp	r0, #64	@ 0x40
c0de2f28:	d0b9      	beq.n	c0de2e9e <io_legacy_apdu_rx+0x3e>
c0de2f2a:	e0a3      	b.n	c0de3074 <io_legacy_apdu_rx+0x214>
c0de2f2c:	eb09 0007 	add.w	r0, r9, r7
c0de2f30:	7847      	ldrb	r7, [r0, #1]
c0de2f32:	2f10      	cmp	r7, #16
c0de2f34:	d05f      	beq.n	c0de2ff6 <io_legacy_apdu_rx+0x196>
c0de2f36:	2f40      	cmp	r7, #64	@ 0x40
c0de2f38:	d05f      	beq.n	c0de2ffa <io_legacy_apdu_rx+0x19a>
c0de2f3a:	2f21      	cmp	r7, #33	@ 0x21
c0de2f3c:	d06f      	beq.n	c0de301e <io_legacy_apdu_rx+0x1be>
c0de2f3e:	2f22      	cmp	r7, #34	@ 0x22
c0de2f40:	d048      	beq.n	c0de2fd4 <io_legacy_apdu_rx+0x174>
c0de2f42:	2f23      	cmp	r7, #35	@ 0x23
c0de2f44:	d048      	beq.n	c0de2fd8 <io_legacy_apdu_rx+0x178>
c0de2f46:	2f30      	cmp	r7, #48	@ 0x30
c0de2f48:	d053      	beq.n	c0de2ff2 <io_legacy_apdu_rx+0x192>
c0de2f4a:	f8df 815c 	ldr.w	r8, [pc, #348]	@ c0de30a8 <io_legacy_apdu_rx+0x248>
c0de2f4e:	2f20      	cmp	r7, #32
c0de2f50:	eb09 0008 	add.w	r0, r9, r8
c0de2f54:	d16d      	bne.n	c0de3032 <io_legacy_apdu_rx+0x1d2>
c0de2f56:	2701      	movs	r7, #1
c0de2f58:	eb09 0106 	add.w	r1, r9, r6
c0de2f5c:	1e65      	subs	r5, r4, #1
c0de2f5e:	7187      	strb	r7, [r0, #6]
c0de2f60:	4850      	ldr	r0, [pc, #320]	@ (c0de30a4 <io_legacy_apdu_rx+0x244>)
c0de2f62:	3101      	adds	r1, #1
c0de2f64:	462a      	mov	r2, r5
c0de2f66:	4448      	add	r0, r9
c0de2f68:	f008 f918 	bl	c0deb19c <__aeabi_memcpy>
c0de2f6c:	484f      	ldr	r0, [pc, #316]	@ (c0de30ac <io_legacy_apdu_rx+0x24c>)
c0de2f6e:	f809 7000 	strb.w	r7, [r9, r0]
c0de2f72:	2008      	movs	r0, #8
c0de2f74:	f809 0008 	strb.w	r0, [r9, r8]
c0de2f78:	e086      	b.n	c0de3088 <io_legacy_apdu_rx+0x228>
c0de2f7a:	484a      	ldr	r0, [pc, #296]	@ (c0de30a4 <io_legacy_apdu_rx+0x244>)
c0de2f7c:	2155      	movs	r1, #85	@ 0x55
c0de2f7e:	2202      	movs	r2, #2
c0de2f80:	2300      	movs	r3, #0
c0de2f82:	f809 1000 	strb.w	r1, [r9, r0]
c0de2f86:	eb09 0100 	add.w	r1, r9, r0
c0de2f8a:	2015      	movs	r0, #21
c0de2f8c:	7048      	strb	r0, [r1, #1]
c0de2f8e:	eb09 0007 	add.w	r0, r9, r7
c0de2f92:	7840      	ldrb	r0, [r0, #1]
c0de2f94:	b004      	add	sp, #16
c0de2f96:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de2f9a:	f007 bfb3 	b.w	c0deaf04 <os_io_tx_cmd>
c0de2f9e:	4f44      	ldr	r7, [pc, #272]	@ (c0de30b0 <io_legacy_apdu_rx+0x250>)
c0de2fa0:	444e      	add	r6, r9
c0de2fa2:	3c01      	subs	r4, #1
c0de2fa4:	1c71      	adds	r1, r6, #1
c0de2fa6:	4622      	mov	r2, r4
c0de2fa8:	eb09 0007 	add.w	r0, r9, r7
c0de2fac:	f008 f8f6 	bl	c0deb19c <__aeabi_memcpy>
c0de2fb0:	7870      	ldrb	r0, [r6, #1]
c0de2fb2:	281a      	cmp	r0, #26
c0de2fb4:	d107      	bne.n	c0de2fc6 <io_legacy_apdu_rx+0x166>
c0de2fb6:	eb09 0007 	add.w	r0, r9, r7
c0de2fba:	4621      	mov	r1, r4
c0de2fbc:	b004      	add	sp, #16
c0de2fbe:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de2fc2:	f7ff bee7 	b.w	c0de2d94 <io_process_itc_ux_event>
c0de2fc6:	2d00      	cmp	r5, #0
c0de2fc8:	d04a      	beq.n	c0de3060 <io_legacy_apdu_rx+0x200>
c0de2fca:	2000      	movs	r0, #0
c0de2fcc:	2500      	movs	r5, #0
c0de2fce:	f007 fa83 	bl	c0dea4d8 <io_event>
c0de2fd2:	e059      	b.n	c0de3088 <io_legacy_apdu_rx+0x228>
c0de2fd4:	2004      	movs	r0, #4
c0de2fd6:	e023      	b.n	c0de3020 <io_legacy_apdu_rx+0x1c0>
c0de2fd8:	4f33      	ldr	r7, [pc, #204]	@ (c0de30a8 <io_legacy_apdu_rx+0x248>)
c0de2fda:	2107      	movs	r1, #7
c0de2fdc:	1e65      	subs	r5, r4, #1
c0de2fde:	462a      	mov	r2, r5
c0de2fe0:	eb09 0007 	add.w	r0, r9, r7
c0de2fe4:	7181      	strb	r1, [r0, #6]
c0de2fe6:	482f      	ldr	r0, [pc, #188]	@ (c0de30a4 <io_legacy_apdu_rx+0x244>)
c0de2fe8:	f000 f886 	bl	c0de30f8 <OUTLINED_FUNCTION_0>
c0de2fec:	482f      	ldr	r0, [pc, #188]	@ (c0de30ac <io_legacy_apdu_rx+0x24c>)
c0de2fee:	2101      	movs	r1, #1
c0de2ff0:	e00f      	b.n	c0de3012 <io_legacy_apdu_rx+0x1b2>
c0de2ff2:	2002      	movs	r0, #2
c0de2ff4:	e014      	b.n	c0de3020 <io_legacy_apdu_rx+0x1c0>
c0de2ff6:	2006      	movs	r0, #6
c0de2ff8:	e012      	b.n	c0de3020 <io_legacy_apdu_rx+0x1c0>
c0de2ffa:	4f2b      	ldr	r7, [pc, #172]	@ (c0de30a8 <io_legacy_apdu_rx+0x248>)
c0de2ffc:	2103      	movs	r1, #3
c0de2ffe:	1e65      	subs	r5, r4, #1
c0de3000:	462a      	mov	r2, r5
c0de3002:	eb09 0007 	add.w	r0, r9, r7
c0de3006:	7181      	strb	r1, [r0, #6]
c0de3008:	4826      	ldr	r0, [pc, #152]	@ (c0de30a4 <io_legacy_apdu_rx+0x244>)
c0de300a:	f000 f875 	bl	c0de30f8 <OUTLINED_FUNCTION_0>
c0de300e:	4827      	ldr	r0, [pc, #156]	@ (c0de30ac <io_legacy_apdu_rx+0x24c>)
c0de3010:	2102      	movs	r1, #2
c0de3012:	f809 1000 	strb.w	r1, [r9, r0]
c0de3016:	200a      	movs	r0, #10
c0de3018:	f809 0007 	strb.w	r0, [r9, r7]
c0de301c:	e034      	b.n	c0de3088 <io_legacy_apdu_rx+0x228>
c0de301e:	2005      	movs	r0, #5
c0de3020:	4921      	ldr	r1, [pc, #132]	@ (c0de30a8 <io_legacy_apdu_rx+0x248>)
c0de3022:	1e65      	subs	r5, r4, #1
c0de3024:	462a      	mov	r2, r5
c0de3026:	4449      	add	r1, r9
c0de3028:	7188      	strb	r0, [r1, #6]
c0de302a:	481e      	ldr	r0, [pc, #120]	@ (c0de30a4 <io_legacy_apdu_rx+0x244>)
c0de302c:	f000 f864 	bl	c0de30f8 <OUTLINED_FUNCTION_0>
c0de3030:	e02a      	b.n	c0de3088 <io_legacy_apdu_rx+0x228>
c0de3032:	2100      	movs	r1, #0
c0de3034:	1e65      	subs	r5, r4, #1
c0de3036:	7181      	strb	r1, [r0, #6]
c0de3038:	481a      	ldr	r0, [pc, #104]	@ (c0de30a4 <io_legacy_apdu_rx+0x244>)
c0de303a:	eb09 0106 	add.w	r1, r9, r6
c0de303e:	462a      	mov	r2, r5
c0de3040:	3101      	adds	r1, #1
c0de3042:	4448      	add	r0, r9
c0de3044:	f008 f8aa 	bl	c0deb19c <__aeabi_memcpy>
c0de3048:	2f25      	cmp	r7, #37	@ 0x25
c0de304a:	d015      	beq.n	c0de3078 <io_legacy_apdu_rx+0x218>
c0de304c:	2f24      	cmp	r7, #36	@ 0x24
c0de304e:	d11b      	bne.n	c0de3088 <io_legacy_apdu_rx+0x228>
c0de3050:	200b      	movs	r0, #11
c0de3052:	2101      	movs	r1, #1
c0de3054:	f809 0008 	strb.w	r0, [r9, r8]
c0de3058:	4814      	ldr	r0, [pc, #80]	@ (c0de30ac <io_legacy_apdu_rx+0x24c>)
c0de305a:	f809 1000 	strb.w	r1, [r9, r0]
c0de305e:	e013      	b.n	c0de3088 <io_legacy_apdu_rx+0x228>
c0de3060:	f819 0007 	ldrb.w	r0, [r9, r7]
c0de3064:	2815      	cmp	r0, #21
c0de3066:	d8b0      	bhi.n	c0de2fca <io_legacy_apdu_rx+0x16a>
c0de3068:	2101      	movs	r1, #1
c0de306a:	fa01 f000 	lsl.w	r0, r1, r0
c0de306e:	4911      	ldr	r1, [pc, #68]	@ (c0de30b4 <io_legacy_apdu_rx+0x254>)
c0de3070:	4208      	tst	r0, r1
c0de3072:	d0aa      	beq.n	c0de2fca <io_legacy_apdu_rx+0x16a>
c0de3074:	2500      	movs	r5, #0
c0de3076:	e007      	b.n	c0de3088 <io_legacy_apdu_rx+0x228>
c0de3078:	200c      	movs	r0, #12
c0de307a:	2101      	movs	r1, #1
c0de307c:	f809 0008 	strb.w	r0, [r9, r8]
c0de3080:	480a      	ldr	r0, [pc, #40]	@ (c0de30ac <io_legacy_apdu_rx+0x24c>)
c0de3082:	f809 1000 	strb.w	r1, [r9, r0]
c0de3086:	4625      	mov	r5, r4
c0de3088:	4628      	mov	r0, r5
c0de308a:	b004      	add	sp, #16
c0de308c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de3090:	20ff      	movs	r0, #255	@ 0xff
c0de3092:	f007 ff19 	bl	c0deaec8 <os_sched_exit>
c0de3096:	bf00      	nop
c0de3098:	00001628 	.word	0x00001628
c0de309c:	007f0001 	.word	0x007f0001
c0de30a0:	00001748 	.word	0x00001748
c0de30a4:	00001517 	.word	0x00001517
c0de30a8:	0000173c 	.word	0x0000173c
c0de30ac:	00001e40 	.word	0x00001e40
c0de30b0:	00001d0c 	.word	0x00001d0c
c0de30b4:	00205020 	.word	0x00205020

c0de30b8 <io_seproxyhal_init>:
c0de30b8:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de30ba:	b089      	sub	sp, #36	@ 0x24
c0de30bc:	4d0c      	ldr	r5, [pc, #48]	@ (c0de30f0 <io_seproxyhal_init+0x38>)
c0de30be:	2600      	movs	r6, #0
c0de30c0:	466c      	mov	r4, sp
c0de30c2:	2118      	movs	r1, #24
c0de30c4:	eb09 0005 	add.w	r0, r9, r5
c0de30c8:	7046      	strb	r6, [r0, #1]
c0de30ca:	4620      	mov	r0, r4
c0de30cc:	f008 f870 	bl	c0deb1b0 <__aeabi_memclr>
c0de30d0:	4808      	ldr	r0, [pc, #32]	@ (c0de30f4 <io_seproxyhal_init+0x3c>)
c0de30d2:	2701      	movs	r7, #1
c0de30d4:	f88d 601e 	strb.w	r6, [sp, #30]
c0de30d8:	f8ad 7020 	strh.w	r7, [sp, #32]
c0de30dc:	f8ad 701c 	strh.w	r7, [sp, #28]
c0de30e0:	9006      	str	r0, [sp, #24]
c0de30e2:	4620      	mov	r0, r4
c0de30e4:	f007 fefa 	bl	c0deaedc <os_io_init>
c0de30e8:	f809 7005 	strb.w	r7, [r9, r5]
c0de30ec:	b009      	add	sp, #36	@ 0x24
c0de30ee:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de30f0:	00001748 	.word	0x00001748
c0de30f4:	00020015 	.word	0x00020015

c0de30f8 <OUTLINED_FUNCTION_0>:
c0de30f8:	eb09 0106 	add.w	r1, r9, r6
c0de30fc:	3101      	adds	r1, #1
c0de30fe:	4448      	add	r0, r9
c0de3100:	f008 b84c 	b.w	c0deb19c <__aeabi_memcpy>

c0de3104 <layoutAddCallbackObj>:
c0de3104:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de3106:	f890 40ad 	ldrb.w	r4, [r0, #173]	@ 0xad
c0de310a:	f890 50ae 	ldrb.w	r5, [r0, #174]	@ 0xae
c0de310e:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de3112:	f3c4 2505 	ubfx	r5, r4, #8, #6
c0de3116:	2d0e      	cmp	r5, #14
c0de3118:	bf84      	itt	hi
c0de311a:	2000      	movhi	r0, #0
c0de311c:	bdf0      	pophi	{r4, r5, r6, r7, pc}
c0de311e:	0a26      	lsrs	r6, r4, #8
c0de3120:	f404 4740 	and.w	r7, r4, #49152	@ 0xc000
c0de3124:	f880 40ad 	strb.w	r4, [r0, #173]	@ 0xad
c0de3128:	3601      	adds	r6, #1
c0de312a:	f006 063f 	and.w	r6, r6, #63	@ 0x3f
c0de312e:	ea47 2606 	orr.w	r6, r7, r6, lsl #8
c0de3132:	0a36      	lsrs	r6, r6, #8
c0de3134:	f880 60ae 	strb.w	r6, [r0, #174]	@ 0xae
c0de3138:	eb00 00c5 	add.w	r0, r0, r5, lsl #3
c0de313c:	f840 1f20 	str.w	r1, [r0, #32]!
c0de3140:	7102      	strb	r2, [r0, #4]
c0de3142:	7183      	strb	r3, [r0, #6]
c0de3144:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

c0de3148 <nbgl_layoutGet>:
c0de3148:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de314c:	b085      	sub	sp, #20
c0de314e:	4604      	mov	r4, r0
c0de3150:	7800      	ldrb	r0, [r0, #0]
c0de3152:	b190      	cbz	r0, c0de317a <nbgl_layoutGet+0x32>
c0de3154:	486c      	ldr	r0, [pc, #432]	@ (c0de3308 <nbgl_layoutGet+0x1c0>)
c0de3156:	496d      	ldr	r1, [pc, #436]	@ (c0de330c <nbgl_layoutGet+0x1c4>)
c0de3158:	2500      	movs	r5, #0
c0de315a:	b158      	cbz	r0, c0de3174 <nbgl_layoutGet+0x2c>
c0de315c:	eb09 0201 	add.w	r2, r9, r1
c0de3160:	4402      	add	r2, r0
c0de3162:	f892 32ca 	ldrb.w	r3, [r2, #714]	@ 0x2ca
c0de3166:	021b      	lsls	r3, r3, #8
c0de3168:	045b      	lsls	r3, r3, #17
c0de316a:	bf58      	it	pl
c0de316c:	f502 7507 	addpl.w	r5, r2, #540	@ 0x21c
c0de3170:	30b4      	adds	r0, #180	@ 0xb4
c0de3172:	e7f2      	b.n	c0de315a <nbgl_layoutGet+0x12>
c0de3174:	b975      	cbnz	r5, c0de3194 <nbgl_layoutGet+0x4c>
c0de3176:	2500      	movs	r5, #0
c0de3178:	e0c1      	b.n	c0de32fe <nbgl_layoutGet+0x1b6>
c0de317a:	4965      	ldr	r1, [pc, #404]	@ (c0de3310 <nbgl_layoutGet+0x1c8>)
c0de317c:	4863      	ldr	r0, [pc, #396]	@ (c0de330c <nbgl_layoutGet+0x1c4>)
c0de317e:	eb09 0201 	add.w	r2, r9, r1
c0de3182:	6852      	ldr	r2, [r2, #4]
c0de3184:	b112      	cbz	r2, c0de318c <nbgl_layoutGet+0x44>
c0de3186:	eb09 0500 	add.w	r5, r9, r0
c0de318a:	e003      	b.n	c0de3194 <nbgl_layoutGet+0x4c>
c0de318c:	eb09 0500 	add.w	r5, r9, r0
c0de3190:	4449      	add	r1, r9
c0de3192:	604d      	str	r5, [r1, #4]
c0de3194:	4e5d      	ldr	r6, [pc, #372]	@ (c0de330c <nbgl_layoutGet+0x1c4>)
c0de3196:	4628      	mov	r0, r5
c0de3198:	21b4      	movs	r1, #180	@ 0xb4
c0de319a:	f859 7006 	ldr.w	r7, [r9, r6]
c0de319e:	f008 f807 	bl	c0deb1b0 <__aeabi_memclr>
c0de31a2:	7820      	ldrb	r0, [r4, #0]
c0de31a4:	b150      	cbz	r0, c0de31bc <nbgl_layoutGet+0x74>
c0de31a6:	485a      	ldr	r0, [pc, #360]	@ (c0de3310 <nbgl_layoutGet+0x1c8>)
c0de31a8:	4448      	add	r0, r9
c0de31aa:	6841      	ldr	r1, [r0, #4]
c0de31ac:	2900      	cmp	r1, #0
c0de31ae:	bf08      	it	eq
c0de31b0:	eb09 0106 	addeq.w	r1, r9, r6
c0de31b4:	600d      	str	r5, [r1, #0]
c0de31b6:	6069      	str	r1, [r5, #4]
c0de31b8:	6045      	str	r5, [r0, #4]
c0de31ba:	e001      	b.n	c0de31c0 <nbgl_layoutGet+0x78>
c0de31bc:	f849 7006 	str.w	r7, [r9, r6]
c0de31c0:	4853      	ldr	r0, [pc, #332]	@ (c0de3310 <nbgl_layoutGet+0x1c8>)
c0de31c2:	2100      	movs	r1, #0
c0de31c4:	f809 1000 	strb.w	r1, [r9, r0]
c0de31c8:	68e0      	ldr	r0, [r4, #12]
c0de31ca:	f007 fdcf 	bl	c0dead6c <pic>
c0de31ce:	4629      	mov	r1, r5
c0de31d0:	7826      	ldrb	r6, [r4, #0]
c0de31d2:	f811 2fad 	ldrb.w	r2, [r1, #173]!
c0de31d6:	784b      	ldrb	r3, [r1, #1]
c0de31d8:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de31dc:	f022 0201 	bic.w	r2, r2, #1
c0de31e0:	4332      	orrs	r2, r6
c0de31e2:	700a      	strb	r2, [r1, #0]
c0de31e4:	f002 02fd 	and.w	r2, r2, #253	@ 0xfd
c0de31e8:	7866      	ldrb	r6, [r4, #1]
c0de31ea:	f841 0c91 	str.w	r0, [r1, #-145]
c0de31ee:	704b      	strb	r3, [r1, #1]
c0de31f0:	f1a1 00a5 	sub.w	r0, r1, #165	@ 0xa5
c0de31f4:	ea42 0246 	orr.w	r2, r2, r6, lsl #1
c0de31f8:	700a      	strb	r2, [r1, #0]
c0de31fa:	f104 0210 	add.w	r2, r4, #16
c0de31fe:	7821      	ldrb	r1, [r4, #0]
c0de3200:	4b44      	ldr	r3, [pc, #272]	@ (c0de3314 <nbgl_layoutGet+0x1cc>)
c0de3202:	447b      	add	r3, pc
c0de3204:	b159      	cbz	r1, c0de321e <nbgl_layoutGet+0xd6>
c0de3206:	2106      	movs	r1, #6
c0de3208:	f007 fbb6 	bl	c0dea978 <nbgl_screenPush>
c0de320c:	f895 10ad 	ldrb.w	r1, [r5, #173]	@ 0xad
c0de3210:	f895 20ae 	ldrb.w	r2, [r5, #174]	@ 0xae
c0de3214:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de3218:	f360 01c7 	bfi	r1, r0, #3, #5
c0de321c:	e00a      	b.n	c0de3234 <nbgl_layoutGet+0xec>
c0de321e:	2106      	movs	r1, #6
c0de3220:	f007 fba5 	bl	c0dea96e <nbgl_screenSet>
c0de3224:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de3228:	f895 10ae 	ldrb.w	r1, [r5, #174]	@ 0xae
c0de322c:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de3230:	f020 01f8 	bic.w	r1, r0, #248	@ 0xf8
c0de3234:	462f      	mov	r7, r5
c0de3236:	0a08      	lsrs	r0, r1, #8
c0de3238:	f04f 0a01 	mov.w	sl, #1
c0de323c:	f807 1fad 	strb.w	r1, [r7, #173]!
c0de3240:	7078      	strb	r0, [r7, #1]
c0de3242:	b2c8      	uxtb	r0, r1
c0de3244:	f003 fb69 	bl	c0de691a <OUTLINED_FUNCTION_16>
c0de3248:	2102      	movs	r1, #2
c0de324a:	f04f 0800 	mov.w	r8, #0
c0de324e:	f880 a005 	strb.w	sl, [r0, #5]
c0de3252:	71c1      	strb	r1, [r0, #7]
c0de3254:	2158      	movs	r1, #88	@ 0x58
c0de3256:	f880 801f 	strb.w	r8, [r0, #31]
c0de325a:	7181      	strb	r1, [r0, #6]
c0de325c:	21e0      	movs	r1, #224	@ 0xe0
c0de325e:	7101      	strb	r1, [r0, #4]
c0de3260:	f847 0c0d 	str.w	r0, [r7, #-13]
c0de3264:	7838      	ldrb	r0, [r7, #0]
c0de3266:	08c1      	lsrs	r1, r0, #3
c0de3268:	2014      	movs	r0, #20
c0de326a:	f007 fba3 	bl	c0dea9b4 <nbgl_containerPoolGet>
c0de326e:	f857 2c0d 	ldr.w	r2, [r7, #-13]
c0de3272:	0a03      	lsrs	r3, r0, #8
c0de3274:	f857 1ca5 	ldr.w	r1, [r7, #-165]
c0de3278:	0e06      	lsrs	r6, r0, #24
c0de327a:	f882 3023 	strb.w	r3, [r2, #35]	@ 0x23
c0de327e:	4613      	mov	r3, r2
c0de3280:	f882 a016 	strb.w	sl, [r2, #22]
c0de3284:	f803 0f22 	strb.w	r0, [r3, #34]!
c0de3288:	0c00      	lsrs	r0, r0, #16
c0de328a:	70de      	strb	r6, [r3, #3]
c0de328c:	7098      	strb	r0, [r3, #2]
c0de328e:	604a      	str	r2, [r1, #4]
c0de3290:	7838      	ldrb	r0, [r7, #0]
c0de3292:	7879      	ldrb	r1, [r7, #1]
c0de3294:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de3298:	f440 4180 	orr.w	r1, r0, #16384	@ 0x4000
c0de329c:	0a0a      	lsrs	r2, r1, #8
c0de329e:	707a      	strb	r2, [r7, #1]
c0de32a0:	6862      	ldr	r2, [r4, #4]
c0de32a2:	b362      	cbz	r2, c0de32fe <nbgl_layoutGet+0x1b6>
c0de32a4:	eb0a 2210 	add.w	r2, sl, r0, lsr #8
c0de32a8:	f885 10ad 	strb.w	r1, [r5, #173]	@ 0xad
c0de32ac:	f401 4140 	and.w	r1, r1, #49152	@ 0xc000
c0de32b0:	f3c0 2005 	ubfx	r0, r0, #8, #6
c0de32b4:	f002 023f 	and.w	r2, r2, #63	@ 0x3f
c0de32b8:	eb05 00c0 	add.w	r0, r5, r0, lsl #3
c0de32bc:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de32c0:	2204      	movs	r2, #4
c0de32c2:	0a09      	lsrs	r1, r1, #8
c0de32c4:	f885 10ae 	strb.w	r1, [r5, #174]	@ 0xae
c0de32c8:	f8d5 10a0 	ldr.w	r1, [r5, #160]	@ 0xa0
c0de32cc:	6201      	str	r1, [r0, #32]
c0de32ce:	f881 801d 	strb.w	r8, [r1, #29]
c0de32d2:	f881 a01c 	strb.w	sl, [r1, #28]
c0de32d6:	778a      	strb	r2, [r1, #30]
c0de32d8:	7a21      	ldrb	r1, [r4, #8]
c0de32da:	7a63      	ldrb	r3, [r4, #9]
c0de32dc:	f880 3026 	strb.w	r3, [r0, #38]	@ 0x26
c0de32e0:	f880 1024 	strb.w	r1, [r0, #36]	@ 0x24
c0de32e4:	f88d 2000 	strb.w	r2, [sp]
c0de32e8:	6860      	ldr	r0, [r4, #4]
c0de32ea:	f007 fd3f 	bl	c0dead6c <pic>
c0de32ee:	9001      	str	r0, [sp, #4]
c0de32f0:	8920      	ldrh	r0, [r4, #8]
c0de32f2:	4669      	mov	r1, sp
c0de32f4:	f8ad 0008 	strh.w	r0, [sp, #8]
c0de32f8:	4628      	mov	r0, r5
c0de32fa:	f000 f981 	bl	c0de3600 <nbgl_layoutAddUpFooter>
c0de32fe:	4628      	mov	r0, r5
c0de3300:	b005      	add	sp, #20
c0de3302:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de3306:	bf00      	nop
c0de3308:	fffffe98 	.word	0xfffffe98
c0de330c:	0000174c 	.word	0x0000174c
c0de3310:	00001968 	.word	0x00001968
c0de3314:	00000113 	.word	0x00000113

c0de3318 <touchCallback>:
c0de3318:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de331c:	2800      	cmp	r0, #0
c0de331e:	f000 816d 	beq.w	c0de35fc <touchCallback+0x2e4>
c0de3322:	460d      	mov	r5, r1
c0de3324:	a901      	add	r1, sp, #4
c0de3326:	466a      	mov	r2, sp
c0de3328:	4604      	mov	r4, r0
c0de332a:	f003 f965 	bl	c0de65f8 <getLayoutAndLayoutObj>
c0de332e:	b968      	cbnz	r0, c0de334c <touchCallback+0x34>
c0de3330:	4620      	mov	r0, r4
c0de3332:	f810 1f0e 	ldrb.w	r1, [r0, #14]!
c0de3336:	f003 fad1 	bl	c0de68dc <OUTLINED_FUNCTION_14>
c0de333a:	466a      	mov	r2, sp
c0de333c:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de3340:	a901      	add	r1, sp, #4
c0de3342:	f003 f959 	bl	c0de65f8 <getLayoutAndLayoutObj>
c0de3346:	2800      	cmp	r0, #0
c0de3348:	f000 8158 	beq.w	c0de35fc <touchCallback+0x2e4>
c0de334c:	1fe8      	subs	r0, r5, #7
c0de334e:	b2c0      	uxtb	r0, r0
c0de3350:	2803      	cmp	r0, #3
c0de3352:	d833      	bhi.n	c0de33bc <touchCallback+0xa4>
c0de3354:	7ee0      	ldrb	r0, [r4, #27]
c0de3356:	2801      	cmp	r0, #1
c0de3358:	d130      	bne.n	c0de33bc <touchCallback+0xa4>
c0de335a:	9901      	ldr	r1, [sp, #4]
c0de335c:	4628      	mov	r0, r5
c0de335e:	f891 20b0 	ldrb.w	r2, [r1, #176]	@ 0xb0
c0de3362:	2a01      	cmp	r2, #1
c0de3364:	d028      	beq.n	c0de33b8 <touchCallback+0xa0>
c0de3366:	bb4a      	cbnz	r2, c0de33bc <touchCallback+0xa4>
c0de3368:	f8d1 00a0 	ldr.w	r0, [r1, #160]	@ 0xa0
c0de336c:	42a0      	cmp	r0, r4
c0de336e:	d125      	bne.n	c0de33bc <touchCallback+0xa4>
c0de3370:	f891 00ab 	ldrb.w	r0, [r1, #171]	@ 0xab
c0de3374:	2803      	cmp	r0, #3
c0de3376:	d005      	beq.n	c0de3384 <touchCallback+0x6c>
c0de3378:	2804      	cmp	r0, #4
c0de337a:	f040 813f 	bne.w	c0de35fc <touchCallback+0x2e4>
c0de337e:	f101 0010 	add.w	r0, r1, #16
c0de3382:	e00c      	b.n	c0de339e <touchCallback+0x86>
c0de3384:	6908      	ldr	r0, [r1, #16]
c0de3386:	f810 2f22 	ldrb.w	r2, [r0, #34]!
c0de338a:	7843      	ldrb	r3, [r0, #1]
c0de338c:	7886      	ldrb	r6, [r0, #2]
c0de338e:	78c0      	ldrb	r0, [r0, #3]
c0de3390:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de3394:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de3398:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de339c:	3004      	adds	r0, #4
c0de339e:	f101 06a9 	add.w	r6, r1, #169	@ 0xa9
c0de33a2:	f891 20a8 	ldrb.w	r2, [r1, #168]	@ 0xa8
c0de33a6:	6800      	ldr	r0, [r0, #0]
c0de33a8:	4629      	mov	r1, r5
c0de33aa:	4633      	mov	r3, r6
c0de33ac:	f003 fccc 	bl	c0de6d48 <layoutNavigationCallback>
c0de33b0:	2800      	cmp	r0, #0
c0de33b2:	f000 8123 	beq.w	c0de35fc <touchCallback+0x2e4>
c0de33b6:	7830      	ldrb	r0, [r6, #0]
c0de33b8:	9900      	ldr	r1, [sp, #0]
c0de33ba:	7148      	strb	r0, [r1, #5]
c0de33bc:	4620      	mov	r0, r4
c0de33be:	9f01      	ldr	r7, [sp, #4]
c0de33c0:	f810 1f0e 	ldrb.w	r1, [r0, #14]!
c0de33c4:	f003 fc15 	bl	c0de6bf2 <OUTLINED_FUNCTION_53>
c0de33c8:	6938      	ldr	r0, [r7, #16]
c0de33ca:	4281      	cmp	r1, r0
c0de33cc:	d103      	bne.n	c0de33d6 <touchCallback+0xbe>
c0de33ce:	f897 20ab 	ldrb.w	r2, [r7, #171]	@ 0xab
c0de33d2:	2a04      	cmp	r2, #4
c0de33d4:	d00c      	beq.n	c0de33f0 <touchCallback+0xd8>
c0de33d6:	7eca      	ldrb	r2, [r1, #27]
c0de33d8:	2a01      	cmp	r2, #1
c0de33da:	d118      	bne.n	c0de340e <touchCallback+0xf6>
c0de33dc:	f811 2f0e 	ldrb.w	r2, [r1, #14]!
c0de33e0:	f003 fa53 	bl	c0de688a <OUTLINED_FUNCTION_11>
c0de33e4:	4281      	cmp	r1, r0
c0de33e6:	d112      	bne.n	c0de340e <touchCallback+0xf6>
c0de33e8:	f897 00ab 	ldrb.w	r0, [r7, #171]	@ 0xab
c0de33ec:	2803      	cmp	r0, #3
c0de33ee:	d10e      	bne.n	c0de340e <touchCallback+0xf6>
c0de33f0:	f107 06a9 	add.w	r6, r7, #169	@ 0xa9
c0de33f4:	f897 20a8 	ldrb.w	r2, [r7, #168]	@ 0xa8
c0de33f8:	4620      	mov	r0, r4
c0de33fa:	4629      	mov	r1, r5
c0de33fc:	4633      	mov	r3, r6
c0de33fe:	f003 fca3 	bl	c0de6d48 <layoutNavigationCallback>
c0de3402:	2800      	cmp	r0, #0
c0de3404:	f000 80fa 	beq.w	c0de35fc <touchCallback+0x2e4>
c0de3408:	7830      	ldrb	r0, [r6, #0]
c0de340a:	9900      	ldr	r1, [sp, #0]
c0de340c:	7148      	strb	r0, [r1, #5]
c0de340e:	7ee0      	ldrb	r0, [r4, #27]
c0de3410:	2801      	cmp	r0, #1
c0de3412:	f040 809b 	bne.w	c0de354c <touchCallback+0x234>
c0de3416:	f894 0020 	ldrb.w	r0, [r4, #32]
c0de341a:	2802      	cmp	r0, #2
c0de341c:	f0c0 8096 	bcc.w	c0de354c <touchCallback+0x234>
c0de3420:	4621      	mov	r1, r4
c0de3422:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de3426:	f003 fa30 	bl	c0de688a <OUTLINED_FUNCTION_11>
c0de342a:	684e      	ldr	r6, [r1, #4]
c0de342c:	b196      	cbz	r6, c0de3454 <touchCallback+0x13c>
c0de342e:	7ef1      	ldrb	r1, [r6, #27]
c0de3430:	2906      	cmp	r1, #6
c0de3432:	d10f      	bne.n	c0de3454 <touchCallback+0x13c>
c0de3434:	f896 0021 	ldrb.w	r0, [r6, #33]	@ 0x21
c0de3438:	3801      	subs	r0, #1
c0de343a:	bf18      	it	ne
c0de343c:	2001      	movne	r0, #1
c0de343e:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de3442:	4630      	mov	r0, r6
c0de3444:	f007 fa89 	bl	c0dea95a <nbgl_objDraw>
c0de3448:	f896 0021 	ldrb.w	r0, [r6, #33]	@ 0x21
c0de344c:	9900      	ldr	r1, [sp, #0]
c0de344e:	2401      	movs	r4, #1
c0de3450:	7148      	strb	r0, [r1, #5]
c0de3452:	e07c      	b.n	c0de354e <touchCallback+0x236>
c0de3454:	2804      	cmp	r0, #4
c0de3456:	d060      	beq.n	c0de351a <touchCallback+0x202>
c0de3458:	2802      	cmp	r0, #2
c0de345a:	d177      	bne.n	c0de354c <touchCallback+0x234>
c0de345c:	f003 fb68 	bl	c0de6b30 <OUTLINED_FUNCTION_40>
c0de3460:	6840      	ldr	r0, [r0, #4]
c0de3462:	2800      	cmp	r0, #0
c0de3464:	d072      	beq.n	c0de354c <touchCallback+0x234>
c0de3466:	7ec0      	ldrb	r0, [r0, #27]
c0de3468:	2809      	cmp	r0, #9
c0de346a:	d16f      	bne.n	c0de354c <touchCallback+0x234>
c0de346c:	2d00      	cmp	r5, #0
c0de346e:	f040 80c5 	bne.w	c0de35fc <touchCallback+0x2e4>
c0de3472:	f04f 0aff 	mov.w	sl, #255	@ 0xff
c0de3476:	2500      	movs	r5, #0
c0de3478:	f04f 0800 	mov.w	r8, #0
c0de347c:	f897 10ae 	ldrb.w	r1, [r7, #174]	@ 0xae
c0de3480:	fa5f f088 	uxtb.w	r0, r8
c0de3484:	f001 013f 	and.w	r1, r1, #63	@ 0x3f
c0de3488:	4281      	cmp	r1, r0
c0de348a:	d977      	bls.n	c0de357c <touchCallback+0x264>
c0de348c:	eb07 00c0 	add.w	r0, r7, r0, lsl #3
c0de3490:	6a00      	ldr	r0, [r0, #32]
c0de3492:	42a0      	cmp	r0, r4
c0de3494:	d117      	bne.n	c0de34c6 <touchCallback+0x1ae>
c0de3496:	7ee1      	ldrb	r1, [r4, #27]
c0de3498:	2901      	cmp	r1, #1
c0de349a:	d114      	bne.n	c0de34c6 <touchCallback+0x1ae>
c0de349c:	4620      	mov	r0, r4
c0de349e:	46ab      	mov	fp, r5
c0de34a0:	46c2      	mov	sl, r8
c0de34a2:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de34a6:	f003 fa19 	bl	c0de68dc <OUTLINED_FUNCTION_14>
c0de34aa:	220c      	movs	r2, #12
c0de34ac:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de34b0:	e9d0 1000 	ldrd	r1, r0, [r0]
c0de34b4:	f881 2022 	strb.w	r2, [r1, #34]	@ 0x22
c0de34b8:	2200      	movs	r2, #0
c0de34ba:	77ca      	strb	r2, [r1, #31]
c0de34bc:	2101      	movs	r1, #1
c0de34be:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de34c2:	4620      	mov	r0, r4
c0de34c4:	e024      	b.n	c0de3510 <touchCallback+0x1f8>
c0de34c6:	7ec1      	ldrb	r1, [r0, #27]
c0de34c8:	2901      	cmp	r1, #1
c0de34ca:	d123      	bne.n	c0de3514 <touchCallback+0x1fc>
c0de34cc:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de34d0:	2902      	cmp	r1, #2
c0de34d2:	d11f      	bne.n	c0de3514 <touchCallback+0x1fc>
c0de34d4:	4601      	mov	r1, r0
c0de34d6:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de34da:	784b      	ldrb	r3, [r1, #1]
c0de34dc:	788e      	ldrb	r6, [r1, #2]
c0de34de:	78c9      	ldrb	r1, [r1, #3]
c0de34e0:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de34e4:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de34e8:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
c0de34ec:	6851      	ldr	r1, [r2, #4]
c0de34ee:	7ecb      	ldrb	r3, [r1, #27]
c0de34f0:	2b09      	cmp	r3, #9
c0de34f2:	d10f      	bne.n	c0de3514 <touchCallback+0x1fc>
c0de34f4:	f891 3021 	ldrb.w	r3, [r1, #33]	@ 0x21
c0de34f8:	3501      	adds	r5, #1
c0de34fa:	2b01      	cmp	r3, #1
c0de34fc:	d10a      	bne.n	c0de3514 <touchCallback+0x1fc>
c0de34fe:	6812      	ldr	r2, [r2, #0]
c0de3500:	230b      	movs	r3, #11
c0de3502:	f882 3022 	strb.w	r3, [r2, #34]	@ 0x22
c0de3506:	2301      	movs	r3, #1
c0de3508:	77d3      	strb	r3, [r2, #31]
c0de350a:	2200      	movs	r2, #0
c0de350c:	f881 2021 	strb.w	r2, [r1, #33]	@ 0x21
c0de3510:	f007 fa23 	bl	c0dea95a <nbgl_objDraw>
c0de3514:	f108 0801 	add.w	r8, r8, #1
c0de3518:	e7b0      	b.n	c0de347c <touchCallback+0x164>
c0de351a:	f003 fb09 	bl	c0de6b30 <OUTLINED_FUNCTION_40>
c0de351e:	68c6      	ldr	r6, [r0, #12]
c0de3520:	b1a6      	cbz	r6, c0de354c <touchCallback+0x234>
c0de3522:	7ef0      	ldrb	r0, [r6, #27]
c0de3524:	2808      	cmp	r0, #8
c0de3526:	d111      	bne.n	c0de354c <touchCallback+0x234>
c0de3528:	2d0a      	cmp	r5, #10
c0de352a:	d867      	bhi.n	c0de35fc <touchCallback+0x2e4>
c0de352c:	2001      	movs	r0, #1
c0de352e:	40a8      	lsls	r0, r5
c0de3530:	f410 6fc5 	tst.w	r0, #1576	@ 0x628
c0de3534:	d039      	beq.n	c0de35aa <touchCallback+0x292>
c0de3536:	f007 fc49 	bl	c0deadcc <nbgl_wait_pipeline>
c0de353a:	2000      	movs	r0, #0
c0de353c:	f003 faed 	bl	c0de6b1a <OUTLINED_FUNCTION_39>
c0de3540:	2003      	movs	r0, #3
c0de3542:	2100      	movs	r1, #0
c0de3544:	e8bd 4dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de3548:	f007 b9fd 	b.w	c0dea946 <nbgl_refreshSpecialWithPostRefresh>
c0de354c:	2400      	movs	r4, #0
c0de354e:	69f8      	ldr	r0, [r7, #28]
c0de3550:	2800      	cmp	r0, #0
c0de3552:	d053      	beq.n	c0de35fc <touchCallback+0x2e4>
c0de3554:	9d00      	ldr	r5, [sp, #0]
c0de3556:	7928      	ldrb	r0, [r5, #4]
c0de3558:	28ff      	cmp	r0, #255	@ 0xff
c0de355a:	d04f      	beq.n	c0de35fc <touchCallback+0x2e4>
c0de355c:	79a8      	ldrb	r0, [r5, #6]
c0de355e:	280b      	cmp	r0, #11
c0de3560:	bf98      	it	ls
c0de3562:	f7ff fbea 	blls	c0de2d3a <os_io_seph_cmd_piezo_play_tune>
c0de3566:	b114      	cbz	r4, c0de356e <touchCallback+0x256>
c0de3568:	2001      	movs	r0, #1
c0de356a:	f007 f9e7 	bl	c0dea93c <nbgl_refreshSpecial>
c0de356e:	7928      	ldrb	r0, [r5, #4]
c0de3570:	7969      	ldrb	r1, [r5, #5]
c0de3572:	69fa      	ldr	r2, [r7, #28]
c0de3574:	b002      	add	sp, #8
c0de3576:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de357a:	4710      	bx	r2
c0de357c:	fa5f f08a 	uxtb.w	r0, sl
c0de3580:	28ff      	cmp	r0, #255	@ 0xff
c0de3582:	d03b      	beq.n	c0de35fc <touchCallback+0x2e4>
c0de3584:	69f9      	ldr	r1, [r7, #28]
c0de3586:	b3c9      	cbz	r1, c0de35fc <touchCallback+0x2e4>
c0de3588:	eb07 04c0 	add.w	r4, r7, r0, lsl #3
c0de358c:	f894 0026 	ldrb.w	r0, [r4, #38]	@ 0x26
c0de3590:	280b      	cmp	r0, #11
c0de3592:	bf98      	it	ls
c0de3594:	f7ff fbd1 	blls	c0de2d3a <os_io_seph_cmd_piezo_play_tune>
c0de3598:	2001      	movs	r0, #1
c0de359a:	f007 f9cf 	bl	c0dea93c <nbgl_refreshSpecial>
c0de359e:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de35a2:	69fa      	ldr	r2, [r7, #28]
c0de35a4:	fa5f f18b 	uxtb.w	r1, fp
c0de35a8:	e7e4      	b.n	c0de3574 <touchCallback+0x25c>
c0de35aa:	2d02      	cmp	r5, #2
c0de35ac:	d126      	bne.n	c0de35fc <touchCallback+0x2e4>
c0de35ae:	9d00      	ldr	r5, [sp, #0]
c0de35b0:	4620      	mov	r0, r4
c0de35b2:	f007 fa31 	bl	c0deaa18 <nbgl_touchGetTouchDuration>
c0de35b6:	f896 1021 	ldrb.w	r1, [r6, #33]	@ 0x21
c0de35ba:	2200      	movs	r2, #0
c0de35bc:	2300      	movs	r3, #0
c0de35be:	2964      	cmp	r1, #100	@ 0x64
c0de35c0:	bf38      	it	cc
c0de35c2:	2301      	movcc	r3, #1
c0de35c4:	2464      	movs	r4, #100	@ 0x64
c0de35c6:	fbb0 f0f4 	udiv	r0, r0, r4
c0de35ca:	ebc0 00c0 	rsb	r0, r0, r0, lsl #3
c0de35ce:	b2c4      	uxtb	r4, r0
c0de35d0:	2c63      	cmp	r4, #99	@ 0x63
c0de35d2:	bf88      	it	hi
c0de35d4:	2201      	movhi	r2, #1
c0de35d6:	ea02 0403 	and.w	r4, r2, r3
c0de35da:	bf88      	it	hi
c0de35dc:	2064      	movhi	r0, #100	@ 0x64
c0de35de:	b2c2      	uxtb	r2, r0
c0de35e0:	428a      	cmp	r2, r1
c0de35e2:	d005      	beq.n	c0de35f0 <touchCallback+0x2d8>
c0de35e4:	f003 fa99 	bl	c0de6b1a <OUTLINED_FUNCTION_39>
c0de35e8:	2004      	movs	r0, #4
c0de35ea:	2102      	movs	r1, #2
c0de35ec:	f007 f9ab 	bl	c0dea946 <nbgl_refreshSpecialWithPostRefresh>
c0de35f0:	b124      	cbz	r4, c0de35fc <touchCallback+0x2e4>
c0de35f2:	69fa      	ldr	r2, [r7, #28]
c0de35f4:	b112      	cbz	r2, c0de35fc <touchCallback+0x2e4>
c0de35f6:	7928      	ldrb	r0, [r5, #4]
c0de35f8:	7969      	ldrb	r1, [r5, #5]
c0de35fa:	e7bb      	b.n	c0de3574 <touchCallback+0x25c>
c0de35fc:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de3600 <nbgl_layoutAddUpFooter>:
c0de3600:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3604:	2800      	cmp	r0, #0
c0de3606:	f000 827e 	beq.w	c0de3b06 <nbgl_layoutAddUpFooter+0x506>
c0de360a:	460d      	mov	r5, r1
c0de360c:	b119      	cbz	r1, c0de3616 <nbgl_layoutAddUpFooter+0x16>
c0de360e:	4604      	mov	r4, r0
c0de3610:	7828      	ldrb	r0, [r5, #0]
c0de3612:	2804      	cmp	r0, #4
c0de3614:	d903      	bls.n	c0de361e <nbgl_layoutAddUpFooter+0x1e>
c0de3616:	f06f 0001 	mvn.w	r0, #1
c0de361a:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de361e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3622:	2601      	movs	r6, #1
c0de3624:	f003 f979 	bl	c0de691a <OUTLINED_FUNCTION_16>
c0de3628:	2100      	movs	r1, #0
c0de362a:	7146      	strb	r6, [r0, #5]
c0de362c:	77c1      	strb	r1, [r0, #31]
c0de362e:	21e0      	movs	r1, #224	@ 0xe0
c0de3630:	7101      	strb	r1, [r0, #4]
c0de3632:	6160      	str	r0, [r4, #20]
c0de3634:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3638:	f003 fb1a 	bl	c0de6c70 <OUTLINED_FUNCTION_62>
c0de363c:	6961      	ldr	r1, [r4, #20]
c0de363e:	0a02      	lsrs	r2, r0, #8
c0de3640:	f8d4 30a0 	ldr.w	r3, [r4, #160]	@ 0xa0
c0de3644:	0e06      	lsrs	r6, r0, #24
c0de3646:	f881 2023 	strb.w	r2, [r1, #35]	@ 0x23
c0de364a:	2208      	movs	r2, #8
c0de364c:	f003 fb3c 	bl	c0de6cc8 <OUTLINED_FUNCTION_70>
c0de3650:	4608      	mov	r0, r1
c0de3652:	70d6      	strb	r6, [r2, #3]
c0de3654:	0e1a      	lsrs	r2, r3, #24
c0de3656:	f800 3f12 	strb.w	r3, [r0, #18]!
c0de365a:	70c2      	strb	r2, [r0, #3]
c0de365c:	0c1a      	lsrs	r2, r3, #16
c0de365e:	7082      	strb	r2, [r0, #2]
c0de3660:	0a18      	lsrs	r0, r3, #8
c0de3662:	74c8      	strb	r0, [r1, #19]
c0de3664:	7828      	ldrb	r0, [r5, #0]
c0de3666:	2804      	cmp	r0, #4
c0de3668:	f000 80c6 	beq.w	c0de37f8 <nbgl_layoutAddUpFooter+0x1f8>
c0de366c:	2801      	cmp	r0, #1
c0de366e:	f000 80f1 	beq.w	c0de3854 <nbgl_layoutAddUpFooter+0x254>
c0de3672:	2802      	cmp	r0, #2
c0de3674:	f000 8153 	beq.w	c0de391e <nbgl_layoutAddUpFooter+0x31e>
c0de3678:	2803      	cmp	r0, #3
c0de367a:	f000 81df 	beq.w	c0de3a3c <nbgl_layoutAddUpFooter+0x43c>
c0de367e:	2800      	cmp	r0, #0
c0de3680:	d1c9      	bne.n	c0de3616 <nbgl_layoutAddUpFooter+0x16>
c0de3682:	f003 fb13 	bl	c0de6cac <OUTLINED_FUNCTION_67>
c0de3686:	2800      	cmp	r0, #0
c0de3688:	f000 823d 	beq.w	c0de3b06 <nbgl_layoutAddUpFooter+0x506>
c0de368c:	6960      	ldr	r0, [r4, #20]
c0de368e:	2104      	movs	r1, #4
c0de3690:	2700      	movs	r7, #0
c0de3692:	f04f 0806 	mov.w	r8, #6
c0de3696:	f880 1020 	strb.w	r1, [r0, #32]
c0de369a:	2112      	movs	r1, #18
c0de369c:	71c7      	strb	r7, [r0, #7]
c0de369e:	f880 801d 	strb.w	r8, [r0, #29]
c0de36a2:	7781      	strb	r1, [r0, #30]
c0de36a4:	2198      	movs	r1, #152	@ 0x98
c0de36a6:	7181      	strb	r1, [r0, #6]
c0de36a8:	212c      	movs	r1, #44	@ 0x2c
c0de36aa:	7701      	strb	r1, [r0, #28]
c0de36ac:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de36b0:	4ee0      	ldr	r6, [pc, #896]	@ (c0de3a34 <nbgl_layoutAddUpFooter+0x434>)
c0de36b2:	08c1      	lsrs	r1, r0, #3
c0de36b4:	447e      	add	r6, pc
c0de36b6:	2005      	movs	r0, #5
c0de36b8:	47b0      	blx	r6
c0de36ba:	46b2      	mov	sl, r6
c0de36bc:	4606      	mov	r6, r0
c0de36be:	7607      	strb	r7, [r0, #24]
c0de36c0:	2020      	movs	r0, #32
c0de36c2:	2103      	movs	r1, #3
c0de36c4:	75f0      	strb	r0, [r6, #23]
c0de36c6:	2058      	movs	r0, #88	@ 0x58
c0de36c8:	f886 8016 	strb.w	r8, [r6, #22]
c0de36cc:	46b0      	mov	r8, r6
c0de36ce:	71f7      	strb	r7, [r6, #7]
c0de36d0:	f886 1021 	strb.w	r1, [r6, #33]	@ 0x21
c0de36d4:	77f7      	strb	r7, [r6, #31]
c0de36d6:	f886 7020 	strb.w	r7, [r6, #32]
c0de36da:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de36de:	f808 0f04 	strb.w	r0, [r8, #4]!
c0de36e2:	71b0      	strb	r0, [r6, #6]
c0de36e4:	f888 7001 	strb.w	r7, [r8, #1]
c0de36e8:	48d3      	ldr	r0, [pc, #844]	@ (c0de3a38 <nbgl_layoutAddUpFooter+0x438>)
c0de36ea:	4478      	add	r0, pc
c0de36ec:	f007 fb3e 	bl	c0dead6c <pic>
c0de36f0:	4631      	mov	r1, r6
c0de36f2:	0e02      	lsrs	r2, r0, #24
c0de36f4:	f003 f9b3 	bl	c0de6a5e <OUTLINED_FUNCTION_31>
c0de36f8:	6960      	ldr	r0, [r4, #20]
c0de36fa:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de36fe:	7842      	ldrb	r2, [r0, #1]
c0de3700:	7883      	ldrb	r3, [r0, #2]
c0de3702:	78c0      	ldrb	r0, [r0, #3]
c0de3704:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de3708:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de370c:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de3710:	6006      	str	r6, [r0, #0]
c0de3712:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3716:	08c1      	lsrs	r1, r0, #3
c0de3718:	2004      	movs	r0, #4
c0de371a:	47d0      	blx	sl
c0de371c:	77c7      	strb	r7, [r0, #31]
c0de371e:	4606      	mov	r6, r0
c0de3720:	f003 f944 	bl	c0de69ac <OUTLINED_FUNCTION_23>
c0de3724:	4601      	mov	r1, r0
c0de3726:	2001      	movs	r0, #1
c0de3728:	f04f 0b04 	mov.w	fp, #4
c0de372c:	2301      	movs	r3, #1
c0de372e:	f886 0024 	strb.w	r0, [r6, #36]	@ 0x24
c0de3732:	200d      	movs	r0, #13
c0de3734:	0e0a      	lsrs	r2, r1, #24
c0de3736:	f886 b020 	strb.w	fp, [r6, #32]
c0de373a:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de373e:	f003 fa40 	bl	c0de6bc2 <OUTLINED_FUNCTION_50>
c0de3742:	f898 0000 	ldrb.w	r0, [r8]
c0de3746:	f898 2001 	ldrb.w	r2, [r8, #1]
c0de374a:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de374e:	f5c0 70c0 	rsb	r0, r0, #384	@ 0x180
c0de3752:	0a02      	lsrs	r2, r0, #8
c0de3754:	7130      	strb	r0, [r6, #4]
c0de3756:	7172      	strb	r2, [r6, #5]
c0de3758:	b282      	uxth	r2, r0
c0de375a:	f003 fae2 	bl	c0de6d22 <OUTLINED_FUNCTION_78>
c0de375e:	2120      	movs	r1, #32
c0de3760:	71b0      	strb	r0, [r6, #6]
c0de3762:	0a00      	lsrs	r0, r0, #8
c0de3764:	f886 b016 	strb.w	fp, [r6, #22]
c0de3768:	f886 7021 	strb.w	r7, [r6, #33]	@ 0x21
c0de376c:	7637      	strb	r7, [r6, #24]
c0de376e:	f04f 0b04 	mov.w	fp, #4
c0de3772:	75f1      	strb	r1, [r6, #23]
c0de3774:	71f0      	strb	r0, [r6, #7]
c0de3776:	6960      	ldr	r0, [r4, #20]
c0de3778:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de377c:	7842      	ldrb	r2, [r0, #1]
c0de377e:	7883      	ldrb	r3, [r0, #2]
c0de3780:	78c0      	ldrb	r0, [r0, #3]
c0de3782:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de3786:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de378a:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de378e:	6046      	str	r6, [r0, #4]
c0de3790:	f003 f91f 	bl	c0de69d2 <OUTLINED_FUNCTION_25>
c0de3794:	2103      	movs	r1, #3
c0de3796:	f04f 0802 	mov.w	r8, #2
c0de379a:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de379e:	6961      	ldr	r1, [r4, #20]
c0de37a0:	f880 8016 	strb.w	r8, [r0, #22]
c0de37a4:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de37a8:	784b      	ldrb	r3, [r1, #1]
c0de37aa:	788e      	ldrb	r6, [r1, #2]
c0de37ac:	78c9      	ldrb	r1, [r1, #3]
c0de37ae:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de37b2:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de37b6:	2608      	movs	r6, #8
c0de37b8:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de37bc:	6088      	str	r0, [r1, #8]
c0de37be:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de37c2:	08c1      	lsrs	r1, r0, #3
c0de37c4:	2008      	movs	r0, #8
c0de37c6:	47d0      	blx	sl
c0de37c8:	f890 1022 	ldrb.w	r1, [r0, #34]	@ 0x22
c0de37cc:	f880 b019 	strb.w	fp, [r0, #25]
c0de37d0:	7186      	strb	r6, [r0, #6]
c0de37d2:	7687      	strb	r7, [r0, #26]
c0de37d4:	71c7      	strb	r7, [r0, #7]
c0de37d6:	f880 8016 	strb.w	r8, [r0, #22]
c0de37da:	f041 0104 	orr.w	r1, r1, #4
c0de37de:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de37e2:	2101      	movs	r1, #1
c0de37e4:	7141      	strb	r1, [r0, #5]
c0de37e6:	21e0      	movs	r1, #224	@ 0xe0
c0de37e8:	7101      	strb	r1, [r0, #4]
c0de37ea:	6961      	ldr	r1, [r4, #20]
c0de37ec:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de37f0:	f003 f84b 	bl	c0de688a <OUTLINED_FUNCTION_11>
c0de37f4:	60c8      	str	r0, [r1, #12]
c0de37f6:	e1f9      	b.n	c0de3bec <nbgl_layoutAddUpFooter+0x5ec>
c0de37f8:	f003 fa58 	bl	c0de6cac <OUTLINED_FUNCTION_67>
c0de37fc:	2800      	cmp	r0, #0
c0de37fe:	f000 8182 	beq.w	c0de3b06 <nbgl_layoutAddUpFooter+0x506>
c0de3802:	6960      	ldr	r0, [r4, #20]
c0de3804:	2104      	movs	r1, #4
c0de3806:	2701      	movs	r7, #1
c0de3808:	2260      	movs	r2, #96	@ 0x60
c0de380a:	7781      	strb	r1, [r0, #30]
c0de380c:	2100      	movs	r1, #0
c0de380e:	f880 7020 	strb.w	r7, [r0, #32]
c0de3812:	7182      	strb	r2, [r0, #6]
c0de3814:	7707      	strb	r7, [r0, #28]
c0de3816:	71c1      	strb	r1, [r0, #7]
c0de3818:	7741      	strb	r1, [r0, #29]
c0de381a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de381e:	f002 ff93 	bl	c0de6748 <OUTLINED_FUNCTION_0>
c0de3822:	77c7      	strb	r7, [r0, #31]
c0de3824:	4606      	mov	r6, r0
c0de3826:	f003 f8c1 	bl	c0de69ac <OUTLINED_FUNCTION_23>
c0de382a:	4601      	mov	r1, r0
c0de382c:	20a0      	movs	r0, #160	@ 0xa0
c0de382e:	7177      	strb	r7, [r6, #5]
c0de3830:	f886 7024 	strb.w	r7, [r6, #36]	@ 0x24
c0de3834:	2705      	movs	r7, #5
c0de3836:	2301      	movs	r3, #1
c0de3838:	7130      	strb	r0, [r6, #4]
c0de383a:	200b      	movs	r0, #11
c0de383c:	0e0a      	lsrs	r2, r1, #24
c0de383e:	f886 7020 	strb.w	r7, [r6, #32]
c0de3842:	f003 f8fd 	bl	c0de6a40 <OUTLINED_FUNCTION_30>
c0de3846:	f007 f8c9 	bl	c0dea9dc <nbgl_getTextHeightInWidth>
c0de384a:	71b0      	strb	r0, [r6, #6]
c0de384c:	0a00      	lsrs	r0, r0, #8
c0de384e:	75b7      	strb	r7, [r6, #22]
c0de3850:	71f0      	strb	r0, [r6, #7]
c0de3852:	e056      	b.n	c0de3902 <nbgl_layoutAddUpFooter+0x302>
c0de3854:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3858:	2705      	movs	r7, #5
c0de385a:	f003 f862 	bl	c0de6922 <OUTLINED_FUNCTION_17>
c0de385e:	4606      	mov	r6, r0
c0de3860:	7b2a      	ldrb	r2, [r5, #12]
c0de3862:	7c2b      	ldrb	r3, [r5, #16]
c0de3864:	f002 ffbe 	bl	c0de67e4 <OUTLINED_FUNCTION_6>
c0de3868:	2800      	cmp	r0, #0
c0de386a:	f000 814c 	beq.w	c0de3b06 <nbgl_layoutAddUpFooter+0x506>
c0de386e:	6960      	ldr	r0, [r4, #20]
c0de3870:	75b7      	strb	r7, [r6, #22]
c0de3872:	f04f 0801 	mov.w	r8, #1
c0de3876:	2700      	movs	r7, #0
c0de3878:	2188      	movs	r1, #136	@ 0x88
c0de387a:	f880 8020 	strb.w	r8, [r0, #32]
c0de387e:	71c7      	strb	r7, [r0, #7]
c0de3880:	7181      	strb	r1, [r0, #6]
c0de3882:	7b68      	ldrb	r0, [r5, #13]
c0de3884:	2800      	cmp	r0, #0
c0de3886:	bf18      	it	ne
c0de3888:	2003      	movne	r0, #3
c0de388a:	77f0      	strb	r0, [r6, #31]
c0de388c:	f04f 0000 	mov.w	r0, #0
c0de3890:	bf08      	it	eq
c0de3892:	2003      	moveq	r0, #3
c0de3894:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de3898:	7b68      	ldrb	r0, [r5, #13]
c0de389a:	4601      	mov	r1, r0
c0de389c:	2800      	cmp	r0, #0
c0de389e:	bf18      	it	ne
c0de38a0:	2101      	movne	r1, #1
c0de38a2:	0049      	lsls	r1, r1, #1
c0de38a4:	2802      	cmp	r0, #2
c0de38a6:	bf08      	it	eq
c0de38a8:	2103      	moveq	r1, #3
c0de38aa:	f886 1020 	strb.w	r1, [r6, #32]
c0de38ae:	f003 f87d 	bl	c0de69ac <OUTLINED_FUNCTION_23>
c0de38b2:	210c      	movs	r1, #12
c0de38b4:	0e02      	lsrs	r2, r0, #24
c0de38b6:	f886 1023 	strb.w	r1, [r6, #35]	@ 0x23
c0de38ba:	4631      	mov	r1, r6
c0de38bc:	f003 f8ae 	bl	c0de6a1c <OUTLINED_FUNCTION_28>
c0de38c0:	f003 f97c 	bl	c0de6bbc <OUTLINED_FUNCTION_49>
c0de38c4:	4631      	mov	r1, r6
c0de38c6:	0e02      	lsrs	r2, r0, #24
c0de38c8:	74f7      	strb	r7, [r6, #19]
c0de38ca:	71f7      	strb	r7, [r6, #7]
c0de38cc:	f886 8005 	strb.w	r8, [r6, #5]
c0de38d0:	7777      	strb	r7, [r6, #29]
c0de38d2:	f886 801c 	strb.w	r8, [r6, #28]
c0de38d6:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de38da:	70ca      	strb	r2, [r1, #3]
c0de38dc:	0c02      	lsrs	r2, r0, #16
c0de38de:	0a00      	lsrs	r0, r0, #8
c0de38e0:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de38e4:	4630      	mov	r0, r6
c0de38e6:	708a      	strb	r2, [r1, #2]
c0de38e8:	f800 7f12 	strb.w	r7, [r0, #18]!
c0de38ec:	70c7      	strb	r7, [r0, #3]
c0de38ee:	7087      	strb	r7, [r0, #2]
c0de38f0:	2058      	movs	r0, #88	@ 0x58
c0de38f2:	71b0      	strb	r0, [r6, #6]
c0de38f4:	20a0      	movs	r0, #160	@ 0xa0
c0de38f6:	7130      	strb	r0, [r6, #4]
c0de38f8:	2003      	movs	r0, #3
c0de38fa:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de38fe:	2007      	movs	r0, #7
c0de3900:	77b0      	strb	r0, [r6, #30]
c0de3902:	6960      	ldr	r0, [r4, #20]
c0de3904:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de3908:	7842      	ldrb	r2, [r0, #1]
c0de390a:	7883      	ldrb	r3, [r0, #2]
c0de390c:	78c0      	ldrb	r0, [r0, #3]
c0de390e:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de3912:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de3916:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de391a:	6006      	str	r6, [r0, #0]
c0de391c:	e166      	b.n	c0de3bec <nbgl_layoutAddUpFooter+0x5ec>
c0de391e:	6868      	ldr	r0, [r5, #4]
c0de3920:	2800      	cmp	r0, #0
c0de3922:	f000 80f0 	beq.w	c0de3b06 <nbgl_layoutAddUpFooter+0x506>
c0de3926:	68a8      	ldr	r0, [r5, #8]
c0de3928:	2800      	cmp	r0, #0
c0de392a:	f000 80ec 	beq.w	c0de3b06 <nbgl_layoutAddUpFooter+0x506>
c0de392e:	f04f 0b00 	mov.w	fp, #0
c0de3932:	2088      	movs	r0, #136	@ 0x88
c0de3934:	2702      	movs	r7, #2
c0de3936:	f881 b007 	strb.w	fp, [r1, #7]
c0de393a:	7188      	strb	r0, [r1, #6]
c0de393c:	f881 7020 	strb.w	r7, [r1, #32]
c0de3940:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3944:	f002 ffed 	bl	c0de6922 <OUTLINED_FUNCTION_17>
c0de3948:	4606      	mov	r6, r0
c0de394a:	7b2a      	ldrb	r2, [r5, #12]
c0de394c:	7bab      	ldrb	r3, [r5, #14]
c0de394e:	f002 ff49 	bl	c0de67e4 <OUTLINED_FUNCTION_6>
c0de3952:	2800      	cmp	r0, #0
c0de3954:	f000 80d7 	beq.w	c0de3b06 <nbgl_layoutAddUpFooter+0x506>
c0de3958:	2120      	movs	r1, #32
c0de395a:	f04f 0a03 	mov.w	sl, #3
c0de395e:	f04f 0858 	mov.w	r8, #88	@ 0x58
c0de3962:	f886 7020 	strb.w	r7, [r6, #32]
c0de3966:	f886 b018 	strb.w	fp, [r6, #24]
c0de396a:	f886 b021 	strb.w	fp, [r6, #33]	@ 0x21
c0de396e:	f886 b007 	strb.w	fp, [r6, #7]
c0de3972:	f886 b005 	strb.w	fp, [r6, #5]
c0de3976:	75f1      	strb	r1, [r6, #23]
c0de3978:	2104      	movs	r1, #4
c0de397a:	f886 a01f 	strb.w	sl, [r6, #31]
c0de397e:	f886 a022 	strb.w	sl, [r6, #34]	@ 0x22
c0de3982:	75b1      	strb	r1, [r6, #22]
c0de3984:	2101      	movs	r1, #1
c0de3986:	7141      	strb	r1, [r0, #5]
c0de3988:	f886 8006 	strb.w	r8, [r6, #6]
c0de398c:	f886 8004 	strb.w	r8, [r6, #4]
c0de3990:	f003 f80c 	bl	c0de69ac <OUTLINED_FUNCTION_23>
c0de3994:	4631      	mov	r1, r6
c0de3996:	0e02      	lsrs	r2, r0, #24
c0de3998:	f886 b01d 	strb.w	fp, [r6, #29]
c0de399c:	f04f 0b01 	mov.w	fp, #1
c0de39a0:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de39a4:	f886 b01c 	strb.w	fp, [r6, #28]
c0de39a8:	70ca      	strb	r2, [r1, #3]
c0de39aa:	0c02      	lsrs	r2, r0, #16
c0de39ac:	0a00      	lsrs	r0, r0, #8
c0de39ae:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de39b2:	200c      	movs	r0, #12
c0de39b4:	708a      	strb	r2, [r1, #2]
c0de39b6:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de39ba:	200a      	movs	r0, #10
c0de39bc:	f003 f883 	bl	c0de6ac6 <OUTLINED_FUNCTION_36>
c0de39c0:	6006      	str	r6, [r0, #0]
c0de39c2:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de39c6:	f002 ffac 	bl	c0de6922 <OUTLINED_FUNCTION_17>
c0de39ca:	4606      	mov	r6, r0
c0de39cc:	7b6a      	ldrb	r2, [r5, #13]
c0de39ce:	7bab      	ldrb	r3, [r5, #14]
c0de39d0:	f002 ff08 	bl	c0de67e4 <OUTLINED_FUNCTION_6>
c0de39d4:	2800      	cmp	r0, #0
c0de39d6:	f000 8096 	beq.w	c0de3b06 <nbgl_layoutAddUpFooter+0x506>
c0de39da:	2700      	movs	r7, #0
c0de39dc:	2120      	movs	r1, #32
c0de39de:	f886 a021 	strb.w	sl, [r6, #33]	@ 0x21
c0de39e2:	f886 a022 	strb.w	sl, [r6, #34]	@ 0x22
c0de39e6:	f886 b005 	strb.w	fp, [r6, #5]
c0de39ea:	75f1      	strb	r1, [r6, #23]
c0de39ec:	7147      	strb	r7, [r0, #5]
c0de39ee:	2106      	movs	r1, #6
c0de39f0:	2038      	movs	r0, #56	@ 0x38
c0de39f2:	f886 7020 	strb.w	r7, [r6, #32]
c0de39f6:	77f7      	strb	r7, [r6, #31]
c0de39f8:	7637      	strb	r7, [r6, #24]
c0de39fa:	71f7      	strb	r7, [r6, #7]
c0de39fc:	f886 8006 	strb.w	r8, [r6, #6]
c0de3a00:	75b1      	strb	r1, [r6, #22]
c0de3a02:	7130      	strb	r0, [r6, #4]
c0de3a04:	f003 f8da 	bl	c0de6bbc <OUTLINED_FUNCTION_49>
c0de3a08:	4631      	mov	r1, r6
c0de3a0a:	0e02      	lsrs	r2, r0, #24
c0de3a0c:	f886 b01c 	strb.w	fp, [r6, #28]
c0de3a10:	7777      	strb	r7, [r6, #29]
c0de3a12:	f801 0f25 	strb.w	r0, [r1, #37]!
c0de3a16:	70ca      	strb	r2, [r1, #3]
c0de3a18:	0c02      	lsrs	r2, r0, #16
c0de3a1a:	0a00      	lsrs	r0, r0, #8
c0de3a1c:	f886 0026 	strb.w	r0, [r6, #38]	@ 0x26
c0de3a20:	200c      	movs	r0, #12
c0de3a22:	708a      	strb	r2, [r1, #2]
c0de3a24:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de3a28:	2009      	movs	r0, #9
c0de3a2a:	f003 f84c 	bl	c0de6ac6 <OUTLINED_FUNCTION_36>
c0de3a2e:	6046      	str	r6, [r0, #4]
c0de3a30:	e0dc      	b.n	c0de3bec <nbgl_layoutAddUpFooter+0x5ec>
c0de3a32:	bf00      	nop
c0de3a34:	000072f3 	.word	0x000072f3
c0de3a38:	00008769 	.word	0x00008769
c0de3a3c:	6868      	ldr	r0, [r5, #4]
c0de3a3e:	2800      	cmp	r0, #0
c0de3a40:	d061      	beq.n	c0de3b06 <nbgl_layoutAddUpFooter+0x506>
c0de3a42:	7b2a      	ldrb	r2, [r5, #12]
c0de3a44:	7b6b      	ldrb	r3, [r5, #13]
c0de3a46:	4620      	mov	r0, r4
c0de3a48:	f7ff fb5c 	bl	c0de3104 <layoutAddCallbackObj>
c0de3a4c:	2800      	cmp	r0, #0
c0de3a4e:	d05a      	beq.n	c0de3b06 <nbgl_layoutAddUpFooter+0x506>
c0de3a50:	6960      	ldr	r0, [r4, #20]
c0de3a52:	f04f 0803 	mov.w	r8, #3
c0de3a56:	2113      	movs	r1, #19
c0de3a58:	f04f 0a00 	mov.w	sl, #0
c0de3a5c:	2701      	movs	r7, #1
c0de3a5e:	f04f 0b04 	mov.w	fp, #4
c0de3a62:	f880 8020 	strb.w	r8, [r0, #32]
c0de3a66:	7781      	strb	r1, [r0, #30]
c0de3a68:	f880 a01d 	strb.w	sl, [r0, #29]
c0de3a6c:	7707      	strb	r7, [r0, #28]
c0de3a6e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3a72:	f002 fe69 	bl	c0de6748 <OUTLINED_FUNCTION_0>
c0de3a76:	f880 a01f 	strb.w	sl, [r0, #31]
c0de3a7a:	4606      	mov	r6, r0
c0de3a7c:	f002 ff96 	bl	c0de69ac <OUTLINED_FUNCTION_23>
c0de3a80:	22a0      	movs	r2, #160	@ 0xa0
c0de3a82:	4601      	mov	r1, r0
c0de3a84:	200b      	movs	r0, #11
c0de3a86:	f886 7024 	strb.w	r7, [r6, #36]	@ 0x24
c0de3a8a:	f886 b020 	strb.w	fp, [r6, #32]
c0de3a8e:	7177      	strb	r7, [r6, #5]
c0de3a90:	7132      	strb	r2, [r6, #4]
c0de3a92:	4632      	mov	r2, r6
c0de3a94:	0e0b      	lsrs	r3, r1, #24
c0de3a96:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de3a9a:	f802 1f26 	strb.w	r1, [r2, #38]!
c0de3a9e:	70d3      	strb	r3, [r2, #3]
c0de3aa0:	0c0b      	lsrs	r3, r1, #16
c0de3aa2:	7093      	strb	r3, [r2, #2]
c0de3aa4:	0a0a      	lsrs	r2, r1, #8
c0de3aa6:	f886 2027 	strb.w	r2, [r6, #39]	@ 0x27
c0de3aaa:	68aa      	ldr	r2, [r5, #8]
c0de3aac:	b37a      	cbz	r2, c0de3b0e <nbgl_layoutAddUpFooter+0x50e>
c0de3aae:	4610      	mov	r0, r2
c0de3ab0:	f007 f95c 	bl	c0dead6c <pic>
c0de3ab4:	4633      	mov	r3, r6
c0de3ab6:	4601      	mov	r1, r0
c0de3ab8:	f813 cf26 	ldrb.w	ip, [r3, #38]!
c0de3abc:	f813 ed22 	ldrb.w	lr, [r3, #-34]!
c0de3ac0:	785a      	ldrb	r2, [r3, #1]
c0de3ac2:	7f98      	ldrb	r0, [r3, #30]
c0de3ac4:	f893 7020 	ldrb.w	r7, [r3, #32]
c0de3ac8:	f893 8023 	ldrb.w	r8, [r3, #35]	@ 0x23
c0de3acc:	ea4e 2e02 	orr.w	lr, lr, r2, lsl #8
c0de3ad0:	780a      	ldrb	r2, [r1, #0]
c0de3ad2:	7849      	ldrb	r1, [r1, #1]
c0de3ad4:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de3ad8:	ebae 0101 	sub.w	r1, lr, r1
c0de3adc:	f1a1 0220 	sub.w	r2, r1, #32
c0de3ae0:	0a11      	lsrs	r1, r2, #8
c0de3ae2:	701a      	strb	r2, [r3, #0]
c0de3ae4:	7059      	strb	r1, [r3, #1]
c0de3ae6:	f893 1025 	ldrb.w	r1, [r3, #37]	@ 0x25
c0de3aea:	f893 3024 	ldrb.w	r3, [r3, #36]	@ 0x24
c0de3aee:	2f00      	cmp	r7, #0
c0de3af0:	bf18      	it	ne
c0de3af2:	2701      	movne	r7, #1
c0de3af4:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de3af8:	ea4c 2308 	orr.w	r3, ip, r8, lsl #8
c0de3afc:	f04f 0803 	mov.w	r8, #3
c0de3b00:	ea43 4101 	orr.w	r1, r3, r1, lsl #16
c0de3b04:	e005      	b.n	c0de3b12 <nbgl_layoutAddUpFooter+0x512>
c0de3b06:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de3b0a:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de3b0e:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de3b12:	b292      	uxth	r2, r2
c0de3b14:	463b      	mov	r3, r7
c0de3b16:	f006 ff61 	bl	c0dea9dc <nbgl_getTextHeightInWidth>
c0de3b1a:	6961      	ldr	r1, [r4, #20]
c0de3b1c:	f886 a018 	strb.w	sl, [r6, #24]
c0de3b20:	f886 b016 	strb.w	fp, [r6, #22]
c0de3b24:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de3b28:	784b      	ldrb	r3, [r1, #1]
c0de3b2a:	788f      	ldrb	r7, [r1, #2]
c0de3b2c:	78c9      	ldrb	r1, [r1, #3]
c0de3b2e:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de3b32:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de3b36:	2720      	movs	r7, #32
c0de3b38:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de3b3c:	600e      	str	r6, [r1, #0]
c0de3b3e:	75f7      	strb	r7, [r6, #23]
c0de3b40:	71b0      	strb	r0, [r6, #6]
c0de3b42:	0a01      	lsrs	r1, r0, #8
c0de3b44:	6962      	ldr	r2, [r4, #20]
c0de3b46:	71f1      	strb	r1, [r6, #7]
c0de3b48:	71d1      	strb	r1, [r2, #7]
c0de3b4a:	7190      	strb	r0, [r2, #6]
c0de3b4c:	f002 ff41 	bl	c0de69d2 <OUTLINED_FUNCTION_25>
c0de3b50:	2102      	movs	r1, #2
c0de3b52:	f880 8022 	strb.w	r8, [r0, #34]	@ 0x22
c0de3b56:	7581      	strb	r1, [r0, #22]
c0de3b58:	6961      	ldr	r1, [r4, #20]
c0de3b5a:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de3b5e:	f002 fe94 	bl	c0de688a <OUTLINED_FUNCTION_11>
c0de3b62:	6048      	str	r0, [r1, #4]
c0de3b64:	68a8      	ldr	r0, [r5, #8]
c0de3b66:	b3c0      	cbz	r0, c0de3bda <nbgl_layoutAddUpFooter+0x5da>
c0de3b68:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3b6c:	f002 ff08 	bl	c0de6980 <OUTLINED_FUNCTION_21>
c0de3b70:	4606      	mov	r6, r0
c0de3b72:	2000      	movs	r0, #0
c0de3b74:	7630      	strb	r0, [r6, #24]
c0de3b76:	77f0      	strb	r0, [r6, #31]
c0de3b78:	2006      	movs	r0, #6
c0de3b7a:	75f7      	strb	r7, [r6, #23]
c0de3b7c:	75b0      	strb	r0, [r6, #22]
c0de3b7e:	f003 f81d 	bl	c0de6bbc <OUTLINED_FUNCTION_49>
c0de3b82:	4631      	mov	r1, r6
c0de3b84:	0e02      	lsrs	r2, r0, #24
c0de3b86:	f003 f84b 	bl	c0de6c20 <OUTLINED_FUNCTION_56>
c0de3b8a:	6960      	ldr	r0, [r4, #20]
c0de3b8c:	f810 2f22 	ldrb.w	r2, [r0, #34]!
c0de3b90:	7843      	ldrb	r3, [r0, #1]
c0de3b92:	7887      	ldrb	r7, [r0, #2]
c0de3b94:	78c0      	ldrb	r0, [r0, #3]
c0de3b96:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de3b9a:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de3b9e:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de3ba2:	6086      	str	r6, [r0, #8]
c0de3ba4:	f896 0022 	ldrb.w	r0, [r6, #34]	@ 0x22
c0de3ba8:	780a      	ldrb	r2, [r1, #0]
c0de3baa:	788b      	ldrb	r3, [r1, #2]
c0de3bac:	78c9      	ldrb	r1, [r1, #3]
c0de3bae:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de3bb2:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de3bb6:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de3bba:	7881      	ldrb	r1, [r0, #2]
c0de3bbc:	78c0      	ldrb	r0, [r0, #3]
c0de3bbe:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
c0de3bc2:	6960      	ldr	r0, [r4, #20]
c0de3bc4:	7982      	ldrb	r2, [r0, #6]
c0de3bc6:	79c3      	ldrb	r3, [r0, #7]
c0de3bc8:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de3bcc:	428a      	cmp	r2, r1
c0de3bce:	bf2f      	iteee	cs
c0de3bd0:	4611      	movcs	r1, r2
c0de3bd2:	7181      	strbcc	r1, [r0, #6]
c0de3bd4:	0a0a      	lsrcc	r2, r1, #8
c0de3bd6:	71c2      	strbcc	r2, [r0, #7]
c0de3bd8:	e004      	b.n	c0de3be4 <nbgl_layoutAddUpFooter+0x5e4>
c0de3bda:	6960      	ldr	r0, [r4, #20]
c0de3bdc:	7981      	ldrb	r1, [r0, #6]
c0de3bde:	79c2      	ldrb	r2, [r0, #7]
c0de3be0:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de3be4:	3130      	adds	r1, #48	@ 0x30
c0de3be6:	7181      	strb	r1, [r0, #6]
c0de3be8:	0a09      	lsrs	r1, r1, #8
c0de3bea:	71c1      	strb	r1, [r0, #7]
c0de3bec:	f8d4 20a0 	ldr.w	r2, [r4, #160]	@ 0xa0
c0de3bf0:	6961      	ldr	r1, [r4, #20]
c0de3bf2:	68a0      	ldr	r0, [r4, #8]
c0de3bf4:	f812 3f06 	ldrb.w	r3, [r2, #6]!
c0de3bf8:	79cf      	ldrb	r7, [r1, #7]
c0de3bfa:	7856      	ldrb	r6, [r2, #1]
c0de3bfc:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de3c00:	798e      	ldrb	r6, [r1, #6]
c0de3c02:	ea46 2607 	orr.w	r6, r6, r7, lsl #8
c0de3c06:	1b9b      	subs	r3, r3, r6
c0de3c08:	7013      	strb	r3, [r2, #0]
c0de3c0a:	6101      	str	r1, [r0, #16]
c0de3c0c:	0a1b      	lsrs	r3, r3, #8
c0de3c0e:	6960      	ldr	r0, [r4, #20]
c0de3c10:	7053      	strb	r3, [r2, #1]
c0de3c12:	782a      	ldrb	r2, [r5, #0]
c0de3c14:	7981      	ldrb	r1, [r0, #6]
c0de3c16:	79c0      	ldrb	r0, [r0, #7]
c0de3c18:	f884 20ac 	strb.w	r2, [r4, #172]	@ 0xac
c0de3c1c:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de3c20:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de3c24 <nbgl_layoutAddSwipe>:
c0de3c24:	b3d8      	cbz	r0, c0de3c9e <nbgl_layoutAddSwipe+0x7a>
c0de3c26:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de3c2a:	f8dd 8020 	ldr.w	r8, [sp, #32]
c0de3c2e:	461c      	mov	r4, r3
c0de3c30:	4617      	mov	r7, r2
c0de3c32:	460d      	mov	r5, r1
c0de3c34:	4606      	mov	r6, r0
c0de3c36:	b342      	cbz	r2, c0de3c8a <nbgl_layoutAddSwipe+0x66>
c0de3c38:	2004      	movs	r0, #4
c0de3c3a:	2100      	movs	r1, #0
c0de3c3c:	f04f 0a00 	mov.w	sl, #0
c0de3c40:	f006 feb3 	bl	c0dea9aa <nbgl_objPoolGet>
c0de3c44:	61b0      	str	r0, [r6, #24]
c0de3c46:	4638      	mov	r0, r7
c0de3c48:	f007 f890 	bl	c0dead6c <pic>
c0de3c4c:	69b1      	ldr	r1, [r6, #24]
c0de3c4e:	f002 ff7c 	bl	c0de6b4a <OUTLINED_FUNCTION_41>
c0de3c52:	7048      	strb	r0, [r1, #1]
c0de3c54:	2001      	movs	r0, #1
c0de3c56:	22a0      	movs	r2, #160	@ 0xa0
c0de3c58:	f801 2c22 	strb.w	r2, [r1, #-34]
c0de3c5c:	220b      	movs	r2, #11
c0de3c5e:	f801 0c21 	strb.w	r0, [r1, #-33]
c0de3c62:	f801 0c07 	strb.w	r0, [r1, #-7]
c0de3c66:	200b      	movs	r0, #11
c0de3c68:	f801 2c04 	strb.w	r2, [r1, #-4]
c0de3c6c:	f006 feb1 	bl	c0dea9d2 <nbgl_getFontLineHeight>
c0de3c70:	69b1      	ldr	r1, [r6, #24]
c0de3c72:	7188      	strb	r0, [r1, #6]
c0de3c74:	201e      	movs	r0, #30
c0de3c76:	f881 a007 	strb.w	sl, [r1, #7]
c0de3c7a:	f881 a01a 	strb.w	sl, [r1, #26]
c0de3c7e:	7648      	strb	r0, [r1, #25]
c0de3c80:	2005      	movs	r0, #5
c0de3c82:	f881 0020 	strb.w	r0, [r1, #32]
c0de3c86:	2008      	movs	r0, #8
c0de3c88:	7588      	strb	r0, [r1, #22]
c0de3c8a:	4630      	mov	r0, r6
c0de3c8c:	4629      	mov	r1, r5
c0de3c8e:	2201      	movs	r2, #1
c0de3c90:	4623      	mov	r3, r4
c0de3c92:	f8cd 8000 	str.w	r8, [sp]
c0de3c96:	f000 f804 	bl	c0de3ca2 <addSwipeInternal>
c0de3c9a:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0de3c9e:	f002 bf0f 	b.w	c0de6ac0 <OUTLINED_FUNCTION_35>

c0de3ca2 <addSwipeInternal>:
c0de3ca2:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de3ca4:	f411 6ff0 	tst.w	r1, #1920	@ 0x780
c0de3ca8:	d013      	beq.n	c0de3cd2 <addSwipeInternal+0x30>
c0de3caa:	9f06      	ldr	r7, [sp, #24]
c0de3cac:	460c      	mov	r4, r1
c0de3cae:	f8d0 10a0 	ldr.w	r1, [r0, #160]	@ 0xa0
c0de3cb2:	4615      	mov	r5, r2
c0de3cb4:	461a      	mov	r2, r3
c0de3cb6:	4606      	mov	r6, r0
c0de3cb8:	463b      	mov	r3, r7
c0de3cba:	f7ff fa23 	bl	c0de3104 <layoutAddCallbackObj>
c0de3cbe:	b140      	cbz	r0, c0de3cd2 <addSwipeInternal+0x30>
c0de3cc0:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de3cc4:	0a21      	lsrs	r1, r4, #8
c0de3cc6:	f886 50b0 	strb.w	r5, [r6, #176]	@ 0xb0
c0de3cca:	7741      	strb	r1, [r0, #29]
c0de3ccc:	7704      	strb	r4, [r0, #28]
c0de3cce:	2000      	movs	r0, #0
c0de3cd0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de3cd2:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de3cd6:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0de3cd8 <nbgl_layoutAddTopRightButton>:
c0de3cd8:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de3cdc:	b398      	cbz	r0, c0de3d46 <nbgl_layoutAddTopRightButton+0x6e>
c0de3cde:	f003 f823 	bl	c0de6d28 <OUTLINED_FUNCTION_79>
c0de3ce2:	4688      	mov	r8, r1
c0de3ce4:	461f      	mov	r7, r3
c0de3ce6:	4615      	mov	r5, r2
c0de3ce8:	f04f 0a05 	mov.w	sl, #5
c0de3cec:	f002 fe19 	bl	c0de6922 <OUTLINED_FUNCTION_17>
c0de3cf0:	4606      	mov	r6, r0
c0de3cf2:	4620      	mov	r0, r4
c0de3cf4:	462a      	mov	r2, r5
c0de3cf6:	463b      	mov	r3, r7
c0de3cf8:	f002 fe3f 	bl	c0de697a <OUTLINED_FUNCTION_20>
c0de3cfc:	b318      	cbz	r0, c0de3d46 <nbgl_layoutAddTopRightButton+0x6e>
c0de3cfe:	2058      	movs	r0, #88	@ 0x58
c0de3d00:	2700      	movs	r7, #0
c0de3d02:	2503      	movs	r5, #3
c0de3d04:	f886 a01e 	strb.w	sl, [r6, #30]
c0de3d08:	71b0      	strb	r0, [r6, #6]
c0de3d0a:	7130      	strb	r0, [r6, #4]
c0de3d0c:	2020      	movs	r0, #32
c0de3d0e:	71f7      	strb	r7, [r6, #7]
c0de3d10:	7177      	strb	r7, [r6, #5]
c0de3d12:	76b7      	strb	r7, [r6, #26]
c0de3d14:	7637      	strb	r7, [r6, #24]
c0de3d16:	7777      	strb	r7, [r6, #29]
c0de3d18:	f886 5022 	strb.w	r5, [r6, #34]	@ 0x22
c0de3d1c:	f886 7021 	strb.w	r7, [r6, #33]	@ 0x21
c0de3d20:	77f5      	strb	r5, [r6, #31]
c0de3d22:	7670      	strb	r0, [r6, #25]
c0de3d24:	75f0      	strb	r0, [r6, #23]
c0de3d26:	2001      	movs	r0, #1
c0de3d28:	7730      	strb	r0, [r6, #28]
c0de3d2a:	2002      	movs	r0, #2
c0de3d2c:	f886 0020 	strb.w	r0, [r6, #32]
c0de3d30:	4640      	mov	r0, r8
c0de3d32:	f007 f81b 	bl	c0dead6c <pic>
c0de3d36:	4631      	mov	r1, r6
c0de3d38:	0e02      	lsrs	r2, r0, #24
c0de3d3a:	75b5      	strb	r5, [r6, #22]
c0de3d3c:	f002 fe8f 	bl	c0de6a5e <OUTLINED_FUNCTION_31>
c0de3d40:	68a0      	ldr	r0, [r4, #8]
c0de3d42:	6086      	str	r6, [r0, #8]
c0de3d44:	e001      	b.n	c0de3d4a <nbgl_layoutAddTopRightButton+0x72>
c0de3d46:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de3d4a:	4638      	mov	r0, r7
c0de3d4c:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}

c0de3d50 <nbgl_layoutAddExtendedFooter>:
c0de3d50:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de3d54:	2800      	cmp	r0, #0
c0de3d56:	f000 834b 	beq.w	c0de43f0 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de3d5a:	460d      	mov	r5, r1
c0de3d5c:	b119      	cbz	r1, c0de3d66 <nbgl_layoutAddExtendedFooter+0x16>
c0de3d5e:	4604      	mov	r4, r0
c0de3d60:	7828      	ldrb	r0, [r5, #0]
c0de3d62:	2806      	cmp	r0, #6
c0de3d64:	d902      	bls.n	c0de3d6c <nbgl_layoutAddExtendedFooter+0x1c>
c0de3d66:	f06f 0701 	mvn.w	r7, #1
c0de3d6a:	e343      	b.n	c0de43f4 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de3d6c:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3d70:	2601      	movs	r6, #1
c0de3d72:	f002 fdd2 	bl	c0de691a <OUTLINED_FUNCTION_16>
c0de3d76:	2100      	movs	r1, #0
c0de3d78:	7146      	strb	r6, [r0, #5]
c0de3d7a:	77c1      	strb	r1, [r0, #31]
c0de3d7c:	21a0      	movs	r1, #160	@ 0xa0
c0de3d7e:	7101      	strb	r1, [r0, #4]
c0de3d80:	6120      	str	r0, [r4, #16]
c0de3d82:	f002 ff7d 	bl	c0de6c80 <OUTLINED_FUNCTION_64>
c0de3d86:	4601      	mov	r1, r0
c0de3d88:	0a02      	lsrs	r2, r0, #8
c0de3d8a:	6920      	ldr	r0, [r4, #16]
c0de3d8c:	0e0b      	lsrs	r3, r1, #24
c0de3d8e:	f880 2023 	strb.w	r2, [r0, #35]	@ 0x23
c0de3d92:	2208      	movs	r2, #8
c0de3d94:	7582      	strb	r2, [r0, #22]
c0de3d96:	4602      	mov	r2, r0
c0de3d98:	f802 1f22 	strb.w	r1, [r2, #34]!
c0de3d9c:	0c09      	lsrs	r1, r1, #16
c0de3d9e:	7091      	strb	r1, [r2, #2]
c0de3da0:	70d3      	strb	r3, [r2, #3]
c0de3da2:	7829      	ldrb	r1, [r5, #0]
c0de3da4:	2906      	cmp	r1, #6
c0de3da6:	d017      	beq.n	c0de3dd8 <nbgl_layoutAddExtendedFooter+0x88>
c0de3da8:	2901      	cmp	r1, #1
c0de3daa:	f000 80be 	beq.w	c0de3f2a <nbgl_layoutAddExtendedFooter+0x1da>
c0de3dae:	2902      	cmp	r1, #2
c0de3db0:	f000 80f7 	beq.w	c0de3fa2 <nbgl_layoutAddExtendedFooter+0x252>
c0de3db4:	2903      	cmp	r1, #3
c0de3db6:	f000 8184 	beq.w	c0de40c2 <nbgl_layoutAddExtendedFooter+0x372>
c0de3dba:	2904      	cmp	r1, #4
c0de3dbc:	f000 8249 	beq.w	c0de4252 <nbgl_layoutAddExtendedFooter+0x502>
c0de3dc0:	2905      	cmp	r1, #5
c0de3dc2:	f000 8269 	beq.w	c0de4298 <nbgl_layoutAddExtendedFooter+0x548>
c0de3dc6:	2900      	cmp	r1, #0
c0de3dc8:	d1cd      	bne.n	c0de3d66 <nbgl_layoutAddExtendedFooter+0x16>
c0de3dca:	88a9      	ldrh	r1, [r5, #4]
c0de3dcc:	f04f 0800 	mov.w	r8, #0
c0de3dd0:	7181      	strb	r1, [r0, #6]
c0de3dd2:	0a09      	lsrs	r1, r1, #8
c0de3dd4:	71c1      	strb	r1, [r0, #7]
c0de3dd6:	e2db      	b.n	c0de4390 <nbgl_layoutAddExtendedFooter+0x640>
c0de3dd8:	68a8      	ldr	r0, [r5, #8]
c0de3dda:	2800      	cmp	r0, #0
c0de3ddc:	f000 8308 	beq.w	c0de43f0 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de3de0:	6868      	ldr	r0, [r5, #4]
c0de3de2:	2800      	cmp	r0, #0
c0de3de4:	f000 8304 	beq.w	c0de43f0 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de3de8:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3dec:	f002 fd99 	bl	c0de6922 <OUTLINED_FUNCTION_17>
c0de3df0:	4606      	mov	r6, r0
c0de3df2:	7c2a      	ldrb	r2, [r5, #16]
c0de3df4:	7cab      	ldrb	r3, [r5, #18]
c0de3df6:	f002 fcf5 	bl	c0de67e4 <OUTLINED_FUNCTION_6>
c0de3dfa:	2800      	cmp	r0, #0
c0de3dfc:	f000 82f8 	beq.w	c0de43f0 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de3e00:	2103      	movs	r1, #3
c0de3e02:	2208      	movs	r2, #8
c0de3e04:	f04f 0801 	mov.w	r8, #1
c0de3e08:	f04f 0a00 	mov.w	sl, #0
c0de3e0c:	75b2      	strb	r2, [r6, #22]
c0de3e0e:	77f1      	strb	r1, [r6, #31]
c0de3e10:	f880 8005 	strb.w	r8, [r0, #5]
c0de3e14:	2258      	movs	r2, #88	@ 0x58
c0de3e16:	7c68      	ldrb	r0, [r5, #17]
c0de3e18:	71b2      	strb	r2, [r6, #6]
c0de3e1a:	22a0      	movs	r2, #160	@ 0xa0
c0de3e1c:	f886 a021 	strb.w	sl, [r6, #33]	@ 0x21
c0de3e20:	f886 a01a 	strb.w	sl, [r6, #26]
c0de3e24:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de3e28:	f886 a007 	strb.w	sl, [r6, #7]
c0de3e2c:	f886 8005 	strb.w	r8, [r6, #5]
c0de3e30:	7132      	strb	r2, [r6, #4]
c0de3e32:	2803      	cmp	r0, #3
c0de3e34:	f04f 0004 	mov.w	r0, #4
c0de3e38:	bf08      	it	eq
c0de3e3a:	2102      	moveq	r1, #2
c0de3e3c:	f886 1020 	strb.w	r1, [r6, #32]
c0de3e40:	bf08      	it	eq
c0de3e42:	2018      	moveq	r0, #24
c0de3e44:	7670      	strb	r0, [r6, #25]
c0de3e46:	f002 feb9 	bl	c0de6bbc <OUTLINED_FUNCTION_49>
c0de3e4a:	f002 fefb 	bl	c0de6c44 <OUTLINED_FUNCTION_58>
c0de3e4e:	f002 fde5 	bl	c0de6a1c <OUTLINED_FUNCTION_28>
c0de3e52:	f002 fd6a 	bl	c0de692a <OUTLINED_FUNCTION_18>
c0de3e56:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de3e5a:	200a      	movs	r0, #10
c0de3e5c:	77b0      	strb	r0, [r6, #30]
c0de3e5e:	6920      	ldr	r0, [r4, #16]
c0de3e60:	f002 fc76 	bl	c0de6750 <OUTLINED_FUNCTION_1>
c0de3e64:	7c68      	ldrb	r0, [r5, #17]
c0de3e66:	b1c0      	cbz	r0, c0de3e9a <nbgl_layoutAddExtendedFooter+0x14a>
c0de3e68:	2803      	cmp	r0, #3
c0de3e6a:	d016      	beq.n	c0de3e9a <nbgl_layoutAddExtendedFooter+0x14a>
c0de3e6c:	f002 fdb1 	bl	c0de69d2 <OUTLINED_FUNCTION_25>
c0de3e70:	0a31      	lsrs	r1, r6, #8
c0de3e72:	0e32      	lsrs	r2, r6, #24
c0de3e74:	74c1      	strb	r1, [r0, #19]
c0de3e76:	4601      	mov	r1, r0
c0de3e78:	f801 6f12 	strb.w	r6, [r1, #18]!
c0de3e7c:	70ca      	strb	r2, [r1, #3]
c0de3e7e:	0c32      	lsrs	r2, r6, #16
c0de3e80:	708a      	strb	r2, [r1, #2]
c0de3e82:	6921      	ldr	r1, [r4, #16]
c0de3e84:	f002 fc91 	bl	c0de67aa <OUTLINED_FUNCTION_4>
c0de3e88:	2100      	movs	r1, #0
c0de3e8a:	7681      	strb	r1, [r0, #26]
c0de3e8c:	2104      	movs	r1, #4
c0de3e8e:	7641      	strb	r1, [r0, #25]
c0de3e90:	2102      	movs	r1, #2
c0de3e92:	7581      	strb	r1, [r0, #22]
c0de3e94:	6920      	ldr	r0, [r4, #16]
c0de3e96:	f002 fc5b 	bl	c0de6750 <OUTLINED_FUNCTION_1>
c0de3e9a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3e9e:	f002 fd40 	bl	c0de6922 <OUTLINED_FUNCTION_17>
c0de3ea2:	4606      	mov	r6, r0
c0de3ea4:	7c2a      	ldrb	r2, [r5, #16]
c0de3ea6:	7cab      	ldrb	r3, [r5, #18]
c0de3ea8:	f002 fc9c 	bl	c0de67e4 <OUTLINED_FUNCTION_6>
c0de3eac:	2800      	cmp	r0, #0
c0de3eae:	f000 829f 	beq.w	c0de43f0 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de3eb2:	2118      	movs	r1, #24
c0de3eb4:	f04f 0a00 	mov.w	sl, #0
c0de3eb8:	f04f 0801 	mov.w	r8, #1
c0de3ebc:	7671      	strb	r1, [r6, #25]
c0de3ebe:	2102      	movs	r1, #2
c0de3ec0:	f886 a01a 	strb.w	sl, [r6, #26]
c0de3ec4:	f880 a005 	strb.w	sl, [r0, #5]
c0de3ec8:	75b1      	strb	r1, [r6, #22]
c0de3eca:	2103      	movs	r1, #3
c0de3ecc:	7c68      	ldrb	r0, [r5, #17]
c0de3ece:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de3ed2:	2158      	movs	r1, #88	@ 0x58
c0de3ed4:	f886 8005 	strb.w	r8, [r6, #5]
c0de3ed8:	f886 a007 	strb.w	sl, [r6, #7]
c0de3edc:	71b1      	strb	r1, [r6, #6]
c0de3ede:	21a0      	movs	r1, #160	@ 0xa0
c0de3ee0:	7131      	strb	r1, [r6, #4]
c0de3ee2:	2100      	movs	r1, #0
c0de3ee4:	2802      	cmp	r0, #2
c0de3ee6:	bf08      	it	eq
c0de3ee8:	2103      	moveq	r1, #3
c0de3eea:	77f1      	strb	r1, [r6, #31]
c0de3eec:	1e81      	subs	r1, r0, #2
c0de3eee:	bf18      	it	ne
c0de3ef0:	2103      	movne	r1, #3
c0de3ef2:	3802      	subs	r0, #2
c0de3ef4:	f886 1021 	strb.w	r1, [r6, #33]	@ 0x21
c0de3ef8:	fab0 f080 	clz	r0, r0
c0de3efc:	0940      	lsrs	r0, r0, #5
c0de3efe:	0040      	lsls	r0, r0, #1
c0de3f00:	f886 0020 	strb.w	r0, [r6, #32]
c0de3f04:	f002 fd52 	bl	c0de69ac <OUTLINED_FUNCTION_23>
c0de3f08:	4631      	mov	r1, r6
c0de3f0a:	0e02      	lsrs	r2, r0, #24
c0de3f0c:	f801 0f25 	strb.w	r0, [r1, #37]!
c0de3f10:	70ca      	strb	r2, [r1, #3]
c0de3f12:	0c02      	lsrs	r2, r0, #16
c0de3f14:	0a00      	lsrs	r0, r0, #8
c0de3f16:	708a      	strb	r2, [r1, #2]
c0de3f18:	7048      	strb	r0, [r1, #1]
c0de3f1a:	7c68      	ldrb	r0, [r5, #17]
c0de3f1c:	2800      	cmp	r0, #0
c0de3f1e:	f000 8288 	beq.w	c0de4432 <nbgl_layoutAddExtendedFooter+0x6e2>
c0de3f22:	68e8      	ldr	r0, [r5, #12]
c0de3f24:	f006 ff22 	bl	c0dead6c <pic>
c0de3f28:	e284      	b.n	c0de4434 <nbgl_layoutAddExtendedFooter+0x6e4>
c0de3f2a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3f2e:	f002 fc0b 	bl	c0de6748 <OUTLINED_FUNCTION_0>
c0de3f32:	4606      	mov	r6, r0
c0de3f34:	7a6a      	ldrb	r2, [r5, #9]
c0de3f36:	7aab      	ldrb	r3, [r5, #10]
c0de3f38:	f002 fc54 	bl	c0de67e4 <OUTLINED_FUNCTION_6>
c0de3f3c:	2800      	cmp	r0, #0
c0de3f3e:	f000 8257 	beq.w	c0de43f0 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de3f42:	2008      	movs	r0, #8
c0de3f44:	4637      	mov	r7, r6
c0de3f46:	f04f 0a01 	mov.w	sl, #1
c0de3f4a:	21a0      	movs	r1, #160	@ 0xa0
c0de3f4c:	f04f 0800 	mov.w	r8, #0
c0de3f50:	75b0      	strb	r0, [r6, #22]
c0de3f52:	7a28      	ldrb	r0, [r5, #8]
c0de3f54:	f886 a005 	strb.w	sl, [r6, #5]
c0de3f58:	7131      	strb	r1, [r6, #4]
c0de3f5a:	77f0      	strb	r0, [r6, #31]
c0de3f5c:	2060      	movs	r0, #96	@ 0x60
c0de3f5e:	f807 0f06 	strb.w	r0, [r7, #6]!
c0de3f62:	f887 8001 	strb.w	r8, [r7, #1]
c0de3f66:	f002 fd21 	bl	c0de69ac <OUTLINED_FUNCTION_23>
c0de3f6a:	4631      	mov	r1, r6
c0de3f6c:	0e02      	lsrs	r2, r0, #24
c0de3f6e:	f002 fcbd 	bl	c0de68ec <OUTLINED_FUNCTION_15>
c0de3f72:	7a29      	ldrb	r1, [r5, #8]
c0de3f74:	f886 801d 	strb.w	r8, [r6, #29]
c0de3f78:	f886 a01e 	strb.w	sl, [r6, #30]
c0de3f7c:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de3f80:	2005      	movs	r0, #5
c0de3f82:	f886 a01c 	strb.w	sl, [r6, #28]
c0de3f86:	f886 0020 	strb.w	r0, [r6, #32]
c0de3f8a:	200b      	movs	r0, #11
c0de3f8c:	2900      	cmp	r1, #0
c0de3f8e:	bf08      	it	eq
c0de3f90:	200c      	moveq	r0, #12
c0de3f92:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de3f96:	6922      	ldr	r2, [r4, #16]
c0de3f98:	7879      	ldrb	r1, [r7, #1]
c0de3f9a:	7838      	ldrb	r0, [r7, #0]
c0de3f9c:	f002 fe76 	bl	c0de6c8c <OUTLINED_FUNCTION_65>
c0de3fa0:	e1f6      	b.n	c0de4390 <nbgl_layoutAddExtendedFooter+0x640>
c0de3fa2:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3fa6:	f002 fbcf 	bl	c0de6748 <OUTLINED_FUNCTION_0>
c0de3faa:	4606      	mov	r6, r0
c0de3fac:	7b2a      	ldrb	r2, [r5, #12]
c0de3fae:	7bab      	ldrb	r3, [r5, #14]
c0de3fb0:	f002 fc18 	bl	c0de67e4 <OUTLINED_FUNCTION_6>
c0de3fb4:	2800      	cmp	r0, #0
c0de3fb6:	f000 821b 	beq.w	c0de43f0 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de3fba:	2007      	movs	r0, #7
c0de3fbc:	f04f 0a00 	mov.w	sl, #0
c0de3fc0:	f04f 08d0 	mov.w	r8, #208	@ 0xd0
c0de3fc4:	75b0      	strb	r0, [r6, #22]
c0de3fc6:	2060      	movs	r0, #96	@ 0x60
c0de3fc8:	f886 a01f 	strb.w	sl, [r6, #31]
c0de3fcc:	f886 a007 	strb.w	sl, [r6, #7]
c0de3fd0:	f886 a005 	strb.w	sl, [r6, #5]
c0de3fd4:	f886 8004 	strb.w	r8, [r6, #4]
c0de3fd8:	71b0      	strb	r0, [r6, #6]
c0de3fda:	f002 fce7 	bl	c0de69ac <OUTLINED_FUNCTION_23>
c0de3fde:	4631      	mov	r1, r6
c0de3fe0:	0e02      	lsrs	r2, r0, #24
c0de3fe2:	f04f 0b01 	mov.w	fp, #1
c0de3fe6:	f886 a01d 	strb.w	sl, [r6, #29]
c0de3fea:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de3fee:	f886 b01e 	strb.w	fp, [r6, #30]
c0de3ff2:	f002 fc54 	bl	c0de689e <OUTLINED_FUNCTION_12>
c0de3ff6:	f002 fe2a 	bl	c0de6c4e <OUTLINED_FUNCTION_59>
c0de3ffa:	f886 0020 	strb.w	r0, [r6, #32]
c0de3ffe:	6920      	ldr	r0, [r4, #16]
c0de4000:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de4004:	3101      	adds	r1, #1
c0de4006:	f880 1020 	strb.w	r1, [r0, #32]
c0de400a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de400e:	f002 fb9b 	bl	c0de6748 <OUTLINED_FUNCTION_0>
c0de4012:	4606      	mov	r6, r0
c0de4014:	7b6a      	ldrb	r2, [r5, #13]
c0de4016:	7bab      	ldrb	r3, [r5, #14]
c0de4018:	f002 fbe4 	bl	c0de67e4 <OUTLINED_FUNCTION_6>
c0de401c:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de4020:	2800      	cmp	r0, #0
c0de4022:	f000 81e7 	beq.w	c0de43f4 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de4026:	2009      	movs	r0, #9
c0de4028:	f886 8004 	strb.w	r8, [r6, #4]
c0de402c:	46b0      	mov	r8, r6
c0de402e:	f886 a01f 	strb.w	sl, [r6, #31]
c0de4032:	f886 a005 	strb.w	sl, [r6, #5]
c0de4036:	75b0      	strb	r0, [r6, #22]
c0de4038:	2060      	movs	r0, #96	@ 0x60
c0de403a:	f808 0f06 	strb.w	r0, [r8, #6]!
c0de403e:	f888 a001 	strb.w	sl, [r8, #1]
c0de4042:	f002 fdbb 	bl	c0de6bbc <OUTLINED_FUNCTION_49>
c0de4046:	f002 fdfd 	bl	c0de6c44 <OUTLINED_FUNCTION_58>
c0de404a:	f002 fc4f 	bl	c0de68ec <OUTLINED_FUNCTION_15>
c0de404e:	f898 1001 	ldrb.w	r1, [r8, #1]
c0de4052:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de4056:	200c      	movs	r0, #12
c0de4058:	f002 fdf9 	bl	c0de6c4e <OUTLINED_FUNCTION_59>
c0de405c:	6922      	ldr	r2, [r4, #16]
c0de405e:	f886 0020 	strb.w	r0, [r6, #32]
c0de4062:	2003      	movs	r0, #3
c0de4064:	77b0      	strb	r0, [r6, #30]
c0de4066:	f898 0000 	ldrb.w	r0, [r8]
c0de406a:	f002 fe0f 	bl	c0de6c8c <OUTLINED_FUNCTION_65>
c0de406e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4072:	f002 fe01 	bl	c0de6c78 <OUTLINED_FUNCTION_63>
c0de4076:	4680      	mov	r8, r0
c0de4078:	f880 a005 	strb.w	sl, [r0, #5]
c0de407c:	f880 b004 	strb.w	fp, [r0, #4]
c0de4080:	20ff      	movs	r0, #255	@ 0xff
c0de4082:	0e31      	lsrs	r1, r6, #24
c0de4084:	f888 0018 	strb.w	r0, [r8, #24]
c0de4088:	0a30      	lsrs	r0, r6, #8
c0de408a:	f888 7017 	strb.w	r7, [r8, #23]
c0de408e:	f888 b021 	strb.w	fp, [r8, #33]	@ 0x21
c0de4092:	f888 a01f 	strb.w	sl, [r8, #31]
c0de4096:	f888 0013 	strb.w	r0, [r8, #19]
c0de409a:	2002      	movs	r0, #2
c0de409c:	f888 0020 	strb.w	r0, [r8, #32]
c0de40a0:	2004      	movs	r0, #4
c0de40a2:	f888 0016 	strb.w	r0, [r8, #22]
c0de40a6:	4640      	mov	r0, r8
c0de40a8:	f800 6f12 	strb.w	r6, [r0, #18]!
c0de40ac:	70c1      	strb	r1, [r0, #3]
c0de40ae:	0c31      	lsrs	r1, r6, #16
c0de40b0:	7081      	strb	r1, [r0, #2]
c0de40b2:	6920      	ldr	r0, [r4, #16]
c0de40b4:	7981      	ldrb	r1, [r0, #6]
c0de40b6:	79c0      	ldrb	r0, [r0, #7]
c0de40b8:	f888 0007 	strb.w	r0, [r8, #7]
c0de40bc:	f888 1006 	strb.w	r1, [r8, #6]
c0de40c0:	e166      	b.n	c0de4390 <nbgl_layoutAddExtendedFooter+0x640>
c0de40c2:	f04f 0b00 	mov.w	fp, #0
c0de40c6:	2760      	movs	r7, #96	@ 0x60
c0de40c8:	f04f 0a01 	mov.w	sl, #1
c0de40cc:	21e0      	movs	r1, #224	@ 0xe0
c0de40ce:	f880 b007 	strb.w	fp, [r0, #7]
c0de40d2:	7187      	strb	r7, [r0, #6]
c0de40d4:	f880 a005 	strb.w	sl, [r0, #5]
c0de40d8:	7101      	strb	r1, [r0, #4]
c0de40da:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de40de:	f002 fb33 	bl	c0de6748 <OUTLINED_FUNCTION_0>
c0de40e2:	4606      	mov	r6, r0
c0de40e4:	7d2a      	ldrb	r2, [r5, #20]
c0de40e6:	7d6b      	ldrb	r3, [r5, #21]
c0de40e8:	f002 fb7c 	bl	c0de67e4 <OUTLINED_FUNCTION_6>
c0de40ec:	2800      	cmp	r0, #0
c0de40ee:	f000 817f 	beq.w	c0de43f0 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de40f2:	1d28      	adds	r0, r5, #4
c0de40f4:	46b0      	mov	r8, r6
c0de40f6:	f886 b01f 	strb.w	fp, [r6, #31]
c0de40fa:	f886 b007 	strb.w	fp, [r6, #7]
c0de40fe:	71b7      	strb	r7, [r6, #6]
c0de4100:	9001      	str	r0, [sp, #4]
c0de4102:	2007      	movs	r0, #7
c0de4104:	75b0      	strb	r0, [r6, #22]
c0de4106:	20c0      	movs	r0, #192	@ 0xc0
c0de4108:	f808 0f04 	strb.w	r0, [r8, #4]!
c0de410c:	f888 b001 	strb.w	fp, [r8, #1]
c0de4110:	6928      	ldr	r0, [r5, #16]
c0de4112:	f006 fe2b 	bl	c0dead6c <pic>
c0de4116:	4631      	mov	r1, r6
c0de4118:	0e02      	lsrs	r2, r0, #24
c0de411a:	f886 a01e 	strb.w	sl, [r6, #30]
c0de411e:	f886 b01d 	strb.w	fp, [r6, #29]
c0de4122:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de4126:	f002 fbba 	bl	c0de689e <OUTLINED_FUNCTION_12>
c0de412a:	f886 a01c 	strb.w	sl, [r6, #28]
c0de412e:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de4132:	2005      	movs	r0, #5
c0de4134:	f886 0020 	strb.w	r0, [r6, #32]
c0de4138:	6920      	ldr	r0, [r4, #16]
c0de413a:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de413e:	3101      	adds	r1, #1
c0de4140:	f880 1020 	strb.w	r1, [r0, #32]
c0de4144:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4148:	f002 fbe7 	bl	c0de691a <OUTLINED_FUNCTION_16>
c0de414c:	4682      	mov	sl, r0
c0de414e:	2004      	movs	r0, #4
c0de4150:	2101      	movs	r1, #1
c0de4152:	f88a 0020 	strb.w	r0, [sl, #32]
c0de4156:	20a0      	movs	r0, #160	@ 0xa0
c0de4158:	4656      	mov	r6, sl
c0de415a:	f88a b01f 	strb.w	fp, [sl, #31]
c0de415e:	f806 0f04 	strb.w	r0, [r6, #4]!
c0de4162:	7071      	strb	r1, [r6, #1]
c0de4164:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4168:	f002 fd82 	bl	c0de6c70 <OUTLINED_FUNCTION_62>
c0de416c:	2109      	movs	r1, #9
c0de416e:	0e02      	lsrs	r2, r0, #24
c0de4170:	f88a b007 	strb.w	fp, [sl, #7]
c0de4174:	f88a 1016 	strb.w	r1, [sl, #22]
c0de4178:	2160      	movs	r1, #96	@ 0x60
c0de417a:	f88a 1006 	strb.w	r1, [sl, #6]
c0de417e:	4651      	mov	r1, sl
c0de4180:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de4184:	f002 fd0e 	bl	c0de6ba4 <OUTLINED_FUNCTION_47>
c0de4188:	f88a 0023 	strb.w	r0, [sl, #35]	@ 0x23
c0de418c:	f898 0000 	ldrb.w	r0, [r8]
c0de4190:	f898 1001 	ldrb.w	r1, [r8, #1]
c0de4194:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de4198:	9901      	ldr	r1, [sp, #4]
c0de419a:	f5c0 70f0 	rsb	r0, r0, #480	@ 0x1e0
c0de419e:	7030      	strb	r0, [r6, #0]
c0de41a0:	0a00      	lsrs	r0, r0, #8
c0de41a2:	7070      	strb	r0, [r6, #1]
c0de41a4:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de41a8:	08c2      	lsrs	r2, r0, #3
c0de41aa:	4650      	mov	r0, sl
c0de41ac:	f002 fe40 	bl	c0de6e30 <layoutNavigationPopulate>
c0de41b0:	792a      	ldrb	r2, [r5, #4]
c0de41b2:	7b2b      	ldrb	r3, [r5, #12]
c0de41b4:	4620      	mov	r0, r4
c0de41b6:	4651      	mov	r1, sl
c0de41b8:	f7fe ffa4 	bl	c0de3104 <layoutAddCallbackObj>
c0de41bc:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de41c0:	2800      	cmp	r0, #0
c0de41c2:	f000 8117 	beq.w	c0de43f4 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de41c6:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de41ca:	f002 fd55 	bl	c0de6c78 <OUTLINED_FUNCTION_63>
c0de41ce:	4680      	mov	r8, r0
c0de41d0:	2002      	movs	r0, #2
c0de41d2:	2101      	movs	r1, #1
c0de41d4:	f888 0020 	strb.w	r0, [r8, #32]
c0de41d8:	2000      	movs	r0, #0
c0de41da:	f888 1004 	strb.w	r1, [r8, #4]
c0de41de:	f888 1021 	strb.w	r1, [r8, #33]	@ 0x21
c0de41e2:	ea4f 611a 	mov.w	r1, sl, lsr #24
c0de41e6:	f888 7017 	strb.w	r7, [r8, #23]
c0de41ea:	f888 0005 	strb.w	r0, [r8, #5]
c0de41ee:	f888 001f 	strb.w	r0, [r8, #31]
c0de41f2:	2004      	movs	r0, #4
c0de41f4:	f888 0016 	strb.w	r0, [r8, #22]
c0de41f8:	20ff      	movs	r0, #255	@ 0xff
c0de41fa:	f888 0018 	strb.w	r0, [r8, #24]
c0de41fe:	ea4f 201a 	mov.w	r0, sl, lsr #8
c0de4202:	f888 0013 	strb.w	r0, [r8, #19]
c0de4206:	4640      	mov	r0, r8
c0de4208:	f800 af12 	strb.w	sl, [r0, #18]!
c0de420c:	70c1      	strb	r1, [r0, #3]
c0de420e:	ea4f 411a 	mov.w	r1, sl, lsr #16
c0de4212:	7081      	strb	r1, [r0, #2]
c0de4214:	6920      	ldr	r0, [r4, #16]
c0de4216:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de421a:	f810 3c1b 	ldrb.w	r3, [r0, #-27]
c0de421e:	f810 2c1c 	ldrb.w	r2, [r0, #-28]
c0de4222:	7847      	ldrb	r7, [r0, #1]
c0de4224:	f810 6c02 	ldrb.w	r6, [r0, #-2]
c0de4228:	f888 3007 	strb.w	r3, [r8, #7]
c0de422c:	f888 2006 	strb.w	r2, [r8, #6]
c0de4230:	ea41 2107 	orr.w	r1, r1, r7, lsl #8
c0de4234:	79aa      	ldrb	r2, [r5, #6]
c0de4236:	f884 20a9 	strb.w	r2, [r4, #169]	@ 0xa9
c0de423a:	78c2      	ldrb	r2, [r0, #3]
c0de423c:	7880      	ldrb	r0, [r0, #2]
c0de423e:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de4242:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de4246:	7969      	ldrb	r1, [r5, #5]
c0de4248:	f840 a026 	str.w	sl, [r0, r6, lsl #2]
c0de424c:	f884 10a8 	strb.w	r1, [r4, #168]	@ 0xa8
c0de4250:	e09b      	b.n	c0de438a <nbgl_layoutAddExtendedFooter+0x63a>
c0de4252:	2100      	movs	r1, #0
c0de4254:	71c1      	strb	r1, [r0, #7]
c0de4256:	2160      	movs	r1, #96	@ 0x60
c0de4258:	7181      	strb	r1, [r0, #6]
c0de425a:	2101      	movs	r1, #1
c0de425c:	7141      	strb	r1, [r0, #5]
c0de425e:	21e0      	movs	r1, #224	@ 0xe0
c0de4260:	7101      	strb	r1, [r0, #4]
c0de4262:	1d29      	adds	r1, r5, #4
c0de4264:	f894 20ad 	ldrb.w	r2, [r4, #173]	@ 0xad
c0de4268:	08d2      	lsrs	r2, r2, #3
c0de426a:	f002 fde1 	bl	c0de6e30 <layoutNavigationPopulate>
c0de426e:	6921      	ldr	r1, [r4, #16]
c0de4270:	2004      	movs	r0, #4
c0de4272:	f881 0020 	strb.w	r0, [r1, #32]
c0de4276:	4620      	mov	r0, r4
c0de4278:	792a      	ldrb	r2, [r5, #4]
c0de427a:	7b2b      	ldrb	r3, [r5, #12]
c0de427c:	f7fe ff42 	bl	c0de3104 <layoutAddCallbackObj>
c0de4280:	2800      	cmp	r0, #0
c0de4282:	f000 80b5 	beq.w	c0de43f0 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de4286:	79a8      	ldrb	r0, [r5, #6]
c0de4288:	f04f 0800 	mov.w	r8, #0
c0de428c:	f884 00a9 	strb.w	r0, [r4, #169]	@ 0xa9
c0de4290:	7968      	ldrb	r0, [r5, #5]
c0de4292:	f884 00a8 	strb.w	r0, [r4, #168]	@ 0xa8
c0de4296:	e07b      	b.n	c0de4390 <nbgl_layoutAddExtendedFooter+0x640>
c0de4298:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de429c:	2605      	movs	r6, #5
c0de429e:	f002 fb40 	bl	c0de6922 <OUTLINED_FUNCTION_17>
c0de42a2:	4607      	mov	r7, r0
c0de42a4:	7b2a      	ldrb	r2, [r5, #12]
c0de42a6:	7c2b      	ldrb	r3, [r5, #16]
c0de42a8:	4620      	mov	r0, r4
c0de42aa:	4639      	mov	r1, r7
c0de42ac:	f7fe ff2a 	bl	c0de3104 <layoutAddCallbackObj>
c0de42b0:	2800      	cmp	r0, #0
c0de42b2:	f000 809d 	beq.w	c0de43f0 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de42b6:	75be      	strb	r6, [r7, #22]
c0de42b8:	2100      	movs	r1, #0
c0de42ba:	f04f 0800 	mov.w	r8, #0
c0de42be:	7b68      	ldrb	r0, [r5, #13]
c0de42c0:	2800      	cmp	r0, #0
c0de42c2:	bf08      	it	eq
c0de42c4:	2103      	moveq	r1, #3
c0de42c6:	f887 1021 	strb.w	r1, [r7, #33]	@ 0x21
c0de42ca:	bf18      	it	ne
c0de42cc:	2003      	movne	r0, #3
c0de42ce:	77f8      	strb	r0, [r7, #31]
c0de42d0:	7b68      	ldrb	r0, [r5, #13]
c0de42d2:	4601      	mov	r1, r0
c0de42d4:	2800      	cmp	r0, #0
c0de42d6:	bf18      	it	ne
c0de42d8:	2101      	movne	r1, #1
c0de42da:	0049      	lsls	r1, r1, #1
c0de42dc:	2802      	cmp	r0, #2
c0de42de:	bf08      	it	eq
c0de42e0:	2103      	moveq	r1, #3
c0de42e2:	f887 1020 	strb.w	r1, [r7, #32]
c0de42e6:	f002 fb61 	bl	c0de69ac <OUTLINED_FUNCTION_23>
c0de42ea:	463e      	mov	r6, r7
c0de42ec:	210c      	movs	r1, #12
c0de42ee:	f887 1023 	strb.w	r1, [r7, #35]	@ 0x23
c0de42f2:	f806 0f25 	strb.w	r0, [r6, #37]!
c0de42f6:	0e01      	lsrs	r1, r0, #24
c0de42f8:	f002 fcaf 	bl	c0de6c5a <OUTLINED_FUNCTION_60>
c0de42fc:	f887 0026 	strb.w	r0, [r7, #38]	@ 0x26
c0de4300:	f002 fc5c 	bl	c0de6bbc <OUTLINED_FUNCTION_49>
c0de4304:	2103      	movs	r1, #3
c0de4306:	0e02      	lsrs	r2, r0, #24
c0de4308:	f887 8007 	strb.w	r8, [r7, #7]
c0de430c:	f887 1022 	strb.w	r1, [r7, #34]	@ 0x22
c0de4310:	2158      	movs	r1, #88	@ 0x58
c0de4312:	71b9      	strb	r1, [r7, #6]
c0de4314:	4639      	mov	r1, r7
c0de4316:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de431a:	f002 fc43 	bl	c0de6ba4 <OUTLINED_FUNCTION_47>
c0de431e:	f887 002f 	strb.w	r0, [r7, #47]	@ 0x2f
c0de4322:	2188      	movs	r1, #136	@ 0x88
c0de4324:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de4328:	6920      	ldr	r0, [r4, #16]
c0de432a:	f880 8007 	strb.w	r8, [r0, #7]
c0de432e:	7181      	strb	r1, [r0, #6]
c0de4330:	6869      	ldr	r1, [r5, #4]
c0de4332:	2900      	cmp	r1, #0
c0de4334:	bf08      	it	eq
c0de4336:	2258      	moveq	r2, #88	@ 0x58
c0de4338:	713a      	strb	r2, [r7, #4]
c0de433a:	f896 c000 	ldrb.w	ip, [r6]
c0de433e:	f896 e002 	ldrb.w	lr, [r6, #2]
c0de4342:	f896 a003 	ldrb.w	sl, [r6, #3]
c0de4346:	f887 801d 	strb.w	r8, [r7, #29]
c0de434a:	0a11      	lsrs	r1, r2, #8
c0de434c:	7179      	strb	r1, [r7, #5]
c0de434e:	f810 6f22 	ldrb.w	r6, [r0, #34]!
c0de4352:	7842      	ldrb	r2, [r0, #1]
c0de4354:	f810 1c02 	ldrb.w	r1, [r0, #-2]
c0de4358:	7883      	ldrb	r3, [r0, #2]
c0de435a:	78c0      	ldrb	r0, [r0, #3]
c0de435c:	ea46 2202 	orr.w	r2, r6, r2, lsl #8
c0de4360:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de4364:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de4368:	f897 2026 	ldrb.w	r2, [r7, #38]	@ 0x26
c0de436c:	f840 7021 	str.w	r7, [r0, r1, lsl #2]
c0de4370:	2001      	movs	r0, #1
c0de4372:	ea4e 210a 	orr.w	r1, lr, sl, lsl #8
c0de4376:	7738      	strb	r0, [r7, #28]
c0de4378:	ea4c 2002 	orr.w	r0, ip, r2, lsl #8
c0de437c:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de4380:	2107      	movs	r1, #7
c0de4382:	2800      	cmp	r0, #0
c0de4384:	bf08      	it	eq
c0de4386:	2101      	moveq	r1, #1
c0de4388:	77b9      	strb	r1, [r7, #30]
c0de438a:	6920      	ldr	r0, [r4, #16]
c0de438c:	f002 f9e0 	bl	c0de6750 <OUTLINED_FUNCTION_1>
c0de4390:	7828      	ldrb	r0, [r5, #0]
c0de4392:	3803      	subs	r0, #3
c0de4394:	2801      	cmp	r0, #1
c0de4396:	d808      	bhi.n	c0de43aa <nbgl_layoutAddExtendedFooter+0x65a>
c0de4398:	7b28      	ldrb	r0, [r5, #12]
c0de439a:	792b      	ldrb	r3, [r5, #4]
c0de439c:	f44f 61c0 	mov.w	r1, #1536	@ 0x600
c0de43a0:	2200      	movs	r2, #0
c0de43a2:	9000      	str	r0, [sp, #0]
c0de43a4:	4620      	mov	r0, r4
c0de43a6:	f7ff fc7c 	bl	c0de3ca2 <addSwipeInternal>
c0de43aa:	7868      	ldrb	r0, [r5, #1]
c0de43ac:	b148      	cbz	r0, c0de43c2 <nbgl_layoutAddExtendedFooter+0x672>
c0de43ae:	f002 fb10 	bl	c0de69d2 <OUTLINED_FUNCTION_25>
c0de43b2:	6921      	ldr	r1, [r4, #16]
c0de43b4:	f002 f9f9 	bl	c0de67aa <OUTLINED_FUNCTION_4>
c0de43b8:	2102      	movs	r1, #2
c0de43ba:	7581      	strb	r1, [r0, #22]
c0de43bc:	6920      	ldr	r0, [r4, #16]
c0de43be:	f002 f9c7 	bl	c0de6750 <OUTLINED_FUNCTION_1>
c0de43c2:	f1b8 0f00 	cmp.w	r8, #0
c0de43c6:	d018      	beq.n	c0de43fa <nbgl_layoutAddExtendedFooter+0x6aa>
c0de43c8:	6920      	ldr	r0, [r4, #16]
c0de43ca:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de43ce:	7843      	ldrb	r3, [r0, #1]
c0de43d0:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de43d4:	7886      	ldrb	r6, [r0, #2]
c0de43d6:	78c0      	ldrb	r0, [r0, #3]
c0de43d8:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de43dc:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de43e0:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de43e4:	f840 8022 	str.w	r8, [r0, r2, lsl #2]
c0de43e8:	6920      	ldr	r0, [r4, #16]
c0de43ea:	f002 f9b1 	bl	c0de6750 <OUTLINED_FUNCTION_1>
c0de43ee:	e005      	b.n	c0de43fc <nbgl_layoutAddExtendedFooter+0x6ac>
c0de43f0:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de43f4:	4638      	mov	r0, r7
c0de43f6:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de43fa:	6920      	ldr	r0, [r4, #16]
c0de43fc:	68a1      	ldr	r1, [r4, #8]
c0de43fe:	60c8      	str	r0, [r1, #12]
c0de4400:	6920      	ldr	r0, [r4, #16]
c0de4402:	f8d4 10a0 	ldr.w	r1, [r4, #160]	@ 0xa0
c0de4406:	f810 2f06 	ldrb.w	r2, [r0, #6]!
c0de440a:	7843      	ldrb	r3, [r0, #1]
c0de440c:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de4410:	f811 3f06 	ldrb.w	r3, [r1, #6]!
c0de4414:	784e      	ldrb	r6, [r1, #1]
c0de4416:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de441a:	1a9a      	subs	r2, r3, r2
c0de441c:	700a      	strb	r2, [r1, #0]
c0de441e:	0a12      	lsrs	r2, r2, #8
c0de4420:	704a      	strb	r2, [r1, #1]
c0de4422:	7829      	ldrb	r1, [r5, #0]
c0de4424:	f884 10ab 	strb.w	r1, [r4, #171]	@ 0xab
c0de4428:	7801      	ldrb	r1, [r0, #0]
c0de442a:	7840      	ldrb	r0, [r0, #1]
c0de442c:	ea41 2700 	orr.w	r7, r1, r0, lsl #8
c0de4430:	e7e0      	b.n	c0de43f4 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de4432:	2000      	movs	r0, #0
c0de4434:	f002 fc06 	bl	c0de6c44 <OUTLINED_FUNCTION_58>
c0de4438:	f002 fb11 	bl	c0de6a5e <OUTLINED_FUNCTION_31>
c0de443c:	f002 fa75 	bl	c0de692a <OUTLINED_FUNCTION_18>
c0de4440:	f04f 0800 	mov.w	r8, #0
c0de4444:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de4448:	2009      	movs	r0, #9
c0de444a:	77b0      	strb	r0, [r6, #30]
c0de444c:	6920      	ldr	r0, [r4, #16]
c0de444e:	f002 f97f 	bl	c0de6750 <OUTLINED_FUNCTION_1>
c0de4452:	7c69      	ldrb	r1, [r5, #17]
c0de4454:	f880 8007 	strb.w	r8, [r0, #7]
c0de4458:	2900      	cmp	r1, #0
c0de445a:	bf0c      	ite	eq
c0de445c:	21d0      	moveq	r1, #208	@ 0xd0
c0de445e:	21e8      	movne	r1, #232	@ 0xe8
c0de4460:	7181      	strb	r1, [r0, #6]
c0de4462:	e795      	b.n	c0de4390 <nbgl_layoutAddExtendedFooter+0x640>

c0de4464 <nbgl_layoutAddBottomButton>:
c0de4464:	b570      	push	{r4, r5, r6, lr}
c0de4466:	b086      	sub	sp, #24
c0de4468:	4605      	mov	r5, r0
c0de446a:	2005      	movs	r0, #5
c0de446c:	2600      	movs	r6, #0
c0de446e:	4614      	mov	r4, r2
c0de4470:	f88d 3001 	strb.w	r3, [sp, #1]
c0de4474:	f88d 0000 	strb.w	r0, [sp]
c0de4478:	4608      	mov	r0, r1
c0de447a:	f88d 600e 	strb.w	r6, [sp, #14]
c0de447e:	f006 fc75 	bl	c0dead6c <pic>
c0de4482:	9002      	str	r0, [sp, #8]
c0de4484:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de4486:	4669      	mov	r1, sp
c0de4488:	f88d 400c 	strb.w	r4, [sp, #12]
c0de448c:	9601      	str	r6, [sp, #4]
c0de448e:	f88d 0010 	strb.w	r0, [sp, #16]
c0de4492:	2001      	movs	r0, #1
c0de4494:	f88d 000d 	strb.w	r0, [sp, #13]
c0de4498:	4628      	mov	r0, r5
c0de449a:	f7ff fc59 	bl	c0de3d50 <nbgl_layoutAddExtendedFooter>
c0de449e:	b006      	add	sp, #24
c0de44a0:	bd70      	pop	{r4, r5, r6, pc}

c0de44a2 <nbgl_layoutAddTouchableBar>:
c0de44a2:	b5b0      	push	{r4, r5, r7, lr}
c0de44a4:	b086      	sub	sp, #24
c0de44a6:	b1e8      	cbz	r0, c0de44e4 <nbgl_layoutAddTouchableBar+0x42>
c0de44a8:	2200      	movs	r2, #0
c0de44aa:	f88d 2000 	strb.w	r2, [sp]
c0de44ae:	e891 003c 	ldmia.w	r1, {r2, r3, r4, r5}
c0de44b2:	e9cd 3503 	strd	r3, r5, [sp, #12]
c0de44b6:	e9cd 2401 	strd	r2, r4, [sp, #4]
c0de44ba:	7c4a      	ldrb	r2, [r1, #17]
c0de44bc:	f88d 2014 	strb.w	r2, [sp, #20]
c0de44c0:	7d0a      	ldrb	r2, [r1, #20]
c0de44c2:	f88d 2017 	strb.w	r2, [sp, #23]
c0de44c6:	7c0a      	ldrb	r2, [r1, #16]
c0de44c8:	7c89      	ldrb	r1, [r1, #18]
c0de44ca:	f081 0101 	eor.w	r1, r1, #1
c0de44ce:	f88d 2016 	strb.w	r2, [sp, #22]
c0de44d2:	f88d 1015 	strb.w	r1, [sp, #21]
c0de44d6:	4669      	mov	r1, sp
c0de44d8:	f000 f808 	bl	c0de44ec <addListItem>
c0de44dc:	b110      	cbz	r0, c0de44e4 <nbgl_layoutAddTouchableBar+0x42>
c0de44de:	f002 fb9a 	bl	c0de6c16 <OUTLINED_FUNCTION_55>
c0de44e2:	e001      	b.n	c0de44e8 <nbgl_layoutAddTouchableBar+0x46>
c0de44e4:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de44e8:	b006      	add	sp, #24
c0de44ea:	bdb0      	pop	{r4, r5, r7, pc}

c0de44ec <addListItem>:
c0de44ec:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de44f0:	4682      	mov	sl, r0
c0de44f2:	7808      	ldrb	r0, [r1, #0]
c0de44f4:	4688      	mov	r8, r1
c0de44f6:	b110      	cbz	r0, c0de44fe <addListItem+0x12>
c0de44f8:	f04f 0b00 	mov.w	fp, #0
c0de44fc:	e006      	b.n	c0de450c <addListItem+0x20>
c0de44fe:	f898 0015 	ldrb.w	r0, [r8, #21]
c0de4502:	fab0 f080 	clz	r0, r0
c0de4506:	0940      	lsrs	r0, r0, #5
c0de4508:	ea4f 0b40 	mov.w	fp, r0, lsl #1
c0de450c:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de4510:	2401      	movs	r4, #1
c0de4512:	f002 fa02 	bl	c0de691a <OUTLINED_FUNCTION_16>
c0de4516:	4606      	mov	r6, r0
c0de4518:	f898 2014 	ldrb.w	r2, [r8, #20]
c0de451c:	f898 3017 	ldrb.w	r3, [r8, #23]
c0de4520:	4650      	mov	r0, sl
c0de4522:	f002 fa2a 	bl	c0de697a <OUTLINED_FUNCTION_20>
c0de4526:	2500      	movs	r5, #0
c0de4528:	2800      	cmp	r0, #0
c0de452a:	d075      	beq.n	c0de4618 <addListItem+0x12c>
c0de452c:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de4530:	f002 fb9e 	bl	c0de6c70 <OUTLINED_FUNCTION_62>
c0de4534:	4631      	mov	r1, r6
c0de4536:	0e02      	lsrs	r2, r0, #24
c0de4538:	2364      	movs	r3, #100	@ 0x64
c0de453a:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de453e:	f801 5d10 	strb.w	r5, [r1, #-16]!
c0de4542:	74ca      	strb	r2, [r1, #19]
c0de4544:	0c02      	lsrs	r2, r0, #16
c0de4546:	0a00      	lsrs	r0, r0, #8
c0de4548:	f801 4c0d 	strb.w	r4, [r1, #-13]
c0de454c:	f801 5c0b 	strb.w	r5, [r1, #-11]
c0de4550:	7448      	strb	r0, [r1, #17]
c0de4552:	20a0      	movs	r0, #160	@ 0xa0
c0de4554:	748a      	strb	r2, [r1, #18]
c0de4556:	f801 0c0e 	strb.w	r0, [r1, #-14]
c0de455a:	f898 2016 	ldrb.w	r2, [r8, #22]
c0de455e:	f898 0000 	ldrb.w	r0, [r8]
c0de4562:	2a00      	cmp	r2, #0
c0de4564:	bf08      	it	eq
c0de4566:	235c      	moveq	r3, #92	@ 0x5c
c0de4568:	f801 3c0c 	strb.w	r3, [r1, #-12]
c0de456c:	718d      	strb	r5, [r1, #6]
c0de456e:	70cd      	strb	r5, [r1, #3]
c0de4570:	708d      	strb	r5, [r1, #2]
c0de4572:	704d      	strb	r5, [r1, #1]
c0de4574:	738d      	strb	r5, [r1, #14]
c0de4576:	734c      	strb	r4, [r1, #13]
c0de4578:	710d      	strb	r5, [r1, #4]
c0de457a:	2220      	movs	r2, #32
c0de457c:	2801      	cmp	r0, #1
c0de457e:	714a      	strb	r2, [r1, #5]
c0de4580:	d004      	beq.n	c0de458c <addListItem+0xa0>
c0de4582:	b980      	cbnz	r0, c0de45a6 <addListItem+0xba>
c0de4584:	f898 0015 	ldrb.w	r0, [r8, #21]
c0de4588:	2801      	cmp	r0, #1
c0de458a:	d10c      	bne.n	c0de45a6 <addListItem+0xba>
c0de458c:	48c4      	ldr	r0, [pc, #784]	@ (c0de48a0 <addListItem+0x3b4>)
c0de458e:	f819 1000 	ldrb.w	r1, [r9, r0]
c0de4592:	1c4a      	adds	r2, r1, #1
c0de4594:	f809 2000 	strb.w	r2, [r9, r0]
c0de4598:	2000      	movs	r0, #0
c0de459a:	7770      	strb	r0, [r6, #29]
c0de459c:	2001      	movs	r0, #1
c0de459e:	7730      	strb	r0, [r6, #28]
c0de45a0:	f101 0014 	add.w	r0, r1, #20
c0de45a4:	77b0      	strb	r0, [r6, #30]
c0de45a6:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de45aa:	f002 f8cd 	bl	c0de6748 <OUTLINED_FUNCTION_0>
c0de45ae:	4607      	mov	r7, r0
c0de45b0:	f880 b01f 	strb.w	fp, [r0, #31]
c0de45b4:	f8d8 000c 	ldr.w	r0, [r8, #12]
c0de45b8:	f006 fbd8 	bl	c0dead6c <pic>
c0de45bc:	2201      	movs	r2, #1
c0de45be:	2100      	movs	r1, #0
c0de45c0:	f64f 74f0 	movw	r4, #65520	@ 0xfff0
c0de45c4:	f887 2024 	strb.w	r2, [r7, #36]	@ 0x24
c0de45c8:	220c      	movs	r2, #12
c0de45ca:	f887 102d 	strb.w	r1, [r7, #45]	@ 0x2d
c0de45ce:	f887 2022 	strb.w	r2, [r7, #34]	@ 0x22
c0de45d2:	463a      	mov	r2, r7
c0de45d4:	f802 1f2c 	strb.w	r1, [r2, #44]!
c0de45d8:	70d1      	strb	r1, [r2, #3]
c0de45da:	7091      	strb	r1, [r2, #2]
c0de45dc:	4639      	mov	r1, r7
c0de45de:	f002 fab4 	bl	c0de6b4a <OUTLINED_FUNCTION_41>
c0de45e2:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de45e6:	7931      	ldrb	r1, [r6, #4]
c0de45e8:	7972      	ldrb	r2, [r6, #5]
c0de45ea:	7139      	strb	r1, [r7, #4]
c0de45ec:	717a      	strb	r2, [r7, #5]
c0de45ee:	f8d8 0004 	ldr.w	r0, [r8, #4]
c0de45f2:	b198      	cbz	r0, c0de461c <addListItem+0x130>
c0de45f4:	f006 fbba 	bl	c0dead6c <pic>
c0de45f8:	4639      	mov	r1, r7
c0de45fa:	f811 2f04 	ldrb.w	r2, [r1, #4]!
c0de45fe:	784b      	ldrb	r3, [r1, #1]
c0de4600:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de4604:	7803      	ldrb	r3, [r0, #0]
c0de4606:	7840      	ldrb	r0, [r0, #1]
c0de4608:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de460c:	1a20      	subs	r0, r4, r0
c0de460e:	4402      	add	r2, r0
c0de4610:	0a10      	lsrs	r0, r2, #8
c0de4612:	700a      	strb	r2, [r1, #0]
c0de4614:	7048      	strb	r0, [r1, #1]
c0de4616:	e003      	b.n	c0de4620 <addListItem+0x134>
c0de4618:	2000      	movs	r0, #0
c0de461a:	e13e      	b.n	c0de489a <addListItem+0x3ae>
c0de461c:	ea41 2202 	orr.w	r2, r1, r2, lsl #8
c0de4620:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de4624:	f8cd b00c 	str.w	fp, [sp, #12]
c0de4628:	b160      	cbz	r0, c0de4644 <addListItem+0x158>
c0de462a:	f006 fb9f 	bl	c0dead6c <pic>
c0de462e:	7801      	ldrb	r1, [r0, #0]
c0de4630:	7840      	ldrb	r0, [r0, #1]
c0de4632:	797a      	ldrb	r2, [r7, #5]
c0de4634:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de4638:	7939      	ldrb	r1, [r7, #4]
c0de463a:	1a20      	subs	r0, r4, r0
c0de463c:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de4640:	1842      	adds	r2, r0, r1
c0de4642:	e004      	b.n	c0de464e <addListItem+0x162>
c0de4644:	f898 0000 	ldrb.w	r0, [r8]
c0de4648:	2801      	cmp	r0, #1
c0de464a:	d103      	bne.n	c0de4654 <addListItem+0x168>
c0de464c:	3a4c      	subs	r2, #76	@ 0x4c
c0de464e:	0a10      	lsrs	r0, r2, #8
c0de4650:	713a      	strb	r2, [r7, #4]
c0de4652:	7178      	strb	r0, [r7, #5]
c0de4654:	463c      	mov	r4, r7
c0de4656:	f897 1027 	ldrb.w	r1, [r7, #39]	@ 0x27
c0de465a:	f897 0022 	ldrb.w	r0, [r7, #34]	@ 0x22
c0de465e:	f897 3024 	ldrb.w	r3, [r7, #36]	@ 0x24
c0de4662:	b292      	uxth	r2, r2
c0de4664:	f814 5f26 	ldrb.w	r5, [r4, #38]!
c0de4668:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de466c:	78a5      	ldrb	r5, [r4, #2]
c0de466e:	78e4      	ldrb	r4, [r4, #3]
c0de4670:	ea45 2404 	orr.w	r4, r5, r4, lsl #8
c0de4674:	ea41 4104 	orr.w	r1, r1, r4, lsl #16
c0de4678:	f006 f9b0 	bl	c0dea9dc <nbgl_getTextHeightInWidth>
c0de467c:	4683      	mov	fp, r0
c0de467e:	4630      	mov	r0, r6
c0de4680:	4634      	mov	r4, r6
c0de4682:	f002 fa3c 	bl	c0de6afe <OUTLINED_FUNCTION_38>
c0de4686:	f841 7022 	str.w	r7, [r1, r2, lsl #2]
c0de468a:	2100      	movs	r1, #0
c0de468c:	f887 b006 	strb.w	fp, [r7, #6]
c0de4690:	f887 1021 	strb.w	r1, [r7, #33]	@ 0x21
c0de4694:	2104      	movs	r1, #4
c0de4696:	f887 1020 	strb.w	r1, [r7, #32]
c0de469a:	75b9      	strb	r1, [r7, #22]
c0de469c:	ea4f 211b 	mov.w	r1, fp, lsr #8
c0de46a0:	71f9      	strb	r1, [r7, #7]
c0de46a2:	1c51      	adds	r1, r2, #1
c0de46a4:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de46a8:	f1bb 0f28 	cmp.w	fp, #40	@ 0x28
c0de46ac:	bf98      	it	ls
c0de46ae:	f04f 0b28 	movls.w	fp, #40	@ 0x28
c0de46b2:	f8d8 0004 	ldr.w	r0, [r8, #4]
c0de46b6:	9402      	str	r4, [sp, #8]
c0de46b8:	b358      	cbz	r0, c0de4712 <addListItem+0x226>
c0de46ba:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de46be:	f002 f95f 	bl	c0de6980 <OUTLINED_FUNCTION_21>
c0de46c2:	4605      	mov	r5, r0
c0de46c4:	9803      	ldr	r0, [sp, #12]
c0de46c6:	77e8      	strb	r0, [r5, #31]
c0de46c8:	f8d8 0004 	ldr.w	r0, [r8, #4]
c0de46cc:	f006 fb4e 	bl	c0dead6c <pic>
c0de46d0:	f002 f93f 	bl	c0de6952 <OUTLINED_FUNCTION_19>
c0de46d4:	4620      	mov	r0, r4
c0de46d6:	f810 cf22 	ldrb.w	ip, [r0, #34]!
c0de46da:	7846      	ldrb	r6, [r0, #1]
c0de46dc:	7884      	ldrb	r4, [r0, #2]
c0de46de:	78c2      	ldrb	r2, [r0, #3]
c0de46e0:	f810 3c02 	ldrb.w	r3, [r0, #-2]
c0de46e4:	ea4c 2606 	orr.w	r6, ip, r6, lsl #8
c0de46e8:	ea44 2202 	orr.w	r2, r4, r2, lsl #8
c0de46ec:	ea46 4202 	orr.w	r2, r6, r2, lsl #16
c0de46f0:	f002 faf8 	bl	c0de6ce4 <OUTLINED_FUNCTION_72>
c0de46f4:	2204      	movs	r2, #4
c0de46f6:	f002 f971 	bl	c0de69dc <OUTLINED_FUNCTION_26>
c0de46fa:	7801      	ldrb	r1, [r0, #0]
c0de46fc:	f002 f8ee 	bl	c0de68dc <OUTLINED_FUNCTION_14>
c0de4700:	3110      	adds	r1, #16
c0de4702:	75f9      	strb	r1, [r7, #23]
c0de4704:	0a09      	lsrs	r1, r1, #8
c0de4706:	7639      	strb	r1, [r7, #24]
c0de4708:	fa0f f18b 	sxth.w	r1, fp
c0de470c:	4281      	cmp	r1, r0
c0de470e:	bfd8      	it	le
c0de4710:	4683      	movle	fp, r0
c0de4712:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de4716:	f8cd a004 	str.w	sl, [sp, #4]
c0de471a:	b348      	cbz	r0, c0de4770 <addListItem+0x284>
c0de471c:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de4720:	f002 f92e 	bl	c0de6980 <OUTLINED_FUNCTION_21>
c0de4724:	4605      	mov	r5, r0
c0de4726:	9803      	ldr	r0, [sp, #12]
c0de4728:	77e8      	strb	r0, [r5, #31]
c0de472a:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de472e:	f006 fb1d 	bl	c0dead6c <pic>
c0de4732:	f002 f90e 	bl	c0de6952 <OUTLINED_FUNCTION_19>
c0de4736:	9802      	ldr	r0, [sp, #8]
c0de4738:	f810 cf22 	ldrb.w	ip, [r0, #34]!
c0de473c:	7844      	ldrb	r4, [r0, #1]
c0de473e:	7886      	ldrb	r6, [r0, #2]
c0de4740:	78c2      	ldrb	r2, [r0, #3]
c0de4742:	f810 3c02 	ldrb.w	r3, [r0, #-2]
c0de4746:	ea4c 2404 	orr.w	r4, ip, r4, lsl #8
c0de474a:	ea46 2202 	orr.w	r2, r6, r2, lsl #8
c0de474e:	ea44 4202 	orr.w	r2, r4, r2, lsl #16
c0de4752:	f002 fac7 	bl	c0de6ce4 <OUTLINED_FUNCTION_72>
c0de4756:	2206      	movs	r2, #6
c0de4758:	f002 f940 	bl	c0de69dc <OUTLINED_FUNCTION_26>
c0de475c:	7881      	ldrb	r1, [r0, #2]
c0de475e:	78c0      	ldrb	r0, [r0, #3]
c0de4760:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
c0de4764:	fa0f f08b 	sxth.w	r0, fp
c0de4768:	4288      	cmp	r0, r1
c0de476a:	bfc8      	it	gt
c0de476c:	4659      	movgt	r1, fp
c0de476e:	e028      	b.n	c0de47c2 <addListItem+0x2d6>
c0de4770:	f898 0000 	ldrb.w	r0, [r8]
c0de4774:	2801      	cmp	r0, #1
c0de4776:	d123      	bne.n	c0de47c0 <addListItem+0x2d4>
c0de4778:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de477c:	f04f 0a06 	mov.w	sl, #6
c0de4780:	08c1      	lsrs	r1, r0, #3
c0de4782:	2006      	movs	r0, #6
c0de4784:	f006 f911 	bl	c0dea9aa <nbgl_objPoolGet>
c0de4788:	0a39      	lsrs	r1, r7, #8
c0de478a:	0e3a      	lsrs	r2, r7, #24
c0de478c:	f880 a016 	strb.w	sl, [r0, #22]
c0de4790:	74c1      	strb	r1, [r0, #19]
c0de4792:	4601      	mov	r1, r0
c0de4794:	f002 fa92 	bl	c0de6cbc <OUTLINED_FUNCTION_69>
c0de4798:	9902      	ldr	r1, [sp, #8]
c0de479a:	f002 f977 	bl	c0de6a8c <OUTLINED_FUNCTION_33>
c0de479e:	2410      	movs	r4, #16
c0de47a0:	f842 0023 	str.w	r0, [r2, r3, lsl #2]
c0de47a4:	2200      	movs	r2, #0
c0de47a6:	75c4      	strb	r4, [r0, #23]
c0de47a8:	2402      	movs	r4, #2
c0de47aa:	7602      	strb	r2, [r0, #24]
c0de47ac:	77c2      	strb	r2, [r0, #31]
c0de47ae:	f898 2015 	ldrb.w	r2, [r8, #21]
c0de47b2:	f880 4020 	strb.w	r4, [r0, #32]
c0de47b6:	f880 2021 	strb.w	r2, [r0, #33]	@ 0x21
c0de47ba:	1c58      	adds	r0, r3, #1
c0de47bc:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de47c0:	4659      	mov	r1, fp
c0de47c2:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de47c6:	e9dd 5a01 	ldrd	r5, sl, [sp, #4]
c0de47ca:	2800      	cmp	r0, #0
c0de47cc:	d05c      	beq.n	c0de4888 <addListItem+0x39c>
c0de47ce:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de47d2:	9100      	str	r1, [sp, #0]
c0de47d4:	2604      	movs	r6, #4
c0de47d6:	f001 ffb7 	bl	c0de6748 <OUTLINED_FUNCTION_0>
c0de47da:	4604      	mov	r4, r0
c0de47dc:	9803      	ldr	r0, [sp, #12]
c0de47de:	77e0      	strb	r0, [r4, #31]
c0de47e0:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de47e4:	f006 fac2 	bl	c0dead6c <pic>
c0de47e8:	4601      	mov	r1, r0
c0de47ea:	200b      	movs	r0, #11
c0de47ec:	2301      	movs	r3, #1
c0de47ee:	f884 6020 	strb.w	r6, [r4, #32]
c0de47f2:	75a6      	strb	r6, [r4, #22]
c0de47f4:	f884 0022 	strb.w	r0, [r4, #34]	@ 0x22
c0de47f8:	2001      	movs	r0, #1
c0de47fa:	0e0a      	lsrs	r2, r1, #24
c0de47fc:	f884 0024 	strb.w	r0, [r4, #36]	@ 0x24
c0de4800:	2000      	movs	r0, #0
c0de4802:	f884 0021 	strb.w	r0, [r4, #33]	@ 0x21
c0de4806:	4620      	mov	r0, r4
c0de4808:	f002 f861 	bl	c0de68ce <OUTLINED_FUNCTION_13>
c0de480c:	f884 0027 	strb.w	r0, [r4, #39]	@ 0x27
c0de4810:	f89a 2005 	ldrb.w	r2, [sl, #5]
c0de4814:	f89a 0004 	ldrb.w	r0, [sl, #4]
c0de4818:	7162      	strb	r2, [r4, #5]
c0de481a:	7120      	strb	r0, [r4, #4]
c0de481c:	ea40 2202 	orr.w	r2, r0, r2, lsl #8
c0de4820:	f002 f9a3 	bl	c0de6b6a <OUTLINED_FUNCTION_43>
c0de4824:	4651      	mov	r1, sl
c0de4826:	46ac      	mov	ip, r5
c0de4828:	f811 bf22 	ldrb.w	fp, [r1, #34]!
c0de482c:	f811 8d1c 	ldrb.w	r8, [r1, #-28]!
c0de4830:	7f4d      	ldrb	r5, [r1, #29]
c0de4832:	7fce      	ldrb	r6, [r1, #31]
c0de4834:	7f8b      	ldrb	r3, [r1, #30]
c0de4836:	7e8a      	ldrb	r2, [r1, #26]
c0de4838:	f891 e001 	ldrb.w	lr, [r1, #1]
c0de483c:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de4840:	ea4b 2505 	orr.w	r5, fp, r5, lsl #8
c0de4844:	ea45 4303 	orr.w	r3, r5, r3, lsl #16
c0de4848:	2500      	movs	r5, #0
c0de484a:	f843 4022 	str.w	r4, [r3, r2, lsl #2]
c0de484e:	f100 030c 	add.w	r3, r0, #12
c0de4852:	3201      	adds	r2, #1
c0de4854:	eba5 0353 	sub.w	r3, r5, r3, lsr #1
c0de4858:	2502      	movs	r5, #2
c0de485a:	767b      	strb	r3, [r7, #25]
c0de485c:	0a1b      	lsrs	r3, r3, #8
c0de485e:	76bb      	strb	r3, [r7, #26]
c0de4860:	0a03      	lsrs	r3, r0, #8
c0de4862:	71a0      	strb	r0, [r4, #6]
c0de4864:	71e3      	strb	r3, [r4, #7]
c0de4866:	9b00      	ldr	r3, [sp, #0]
c0de4868:	b21b      	sxth	r3, r3
c0de486a:	330c      	adds	r3, #12
c0de486c:	fb93 f3f5 	sdiv	r3, r3, r5
c0de4870:	7663      	strb	r3, [r4, #25]
c0de4872:	768a      	strb	r2, [r1, #26]
c0de4874:	ea48 220e 	orr.w	r2, r8, lr, lsl #8
c0de4878:	0a1d      	lsrs	r5, r3, #8
c0de487a:	4410      	add	r0, r2
c0de487c:	76a5      	strb	r5, [r4, #26]
c0de487e:	4665      	mov	r5, ip
c0de4880:	300c      	adds	r0, #12
c0de4882:	7008      	strb	r0, [r1, #0]
c0de4884:	0a00      	lsrs	r0, r0, #8
c0de4886:	7048      	strb	r0, [r1, #1]
c0de4888:	f8d5 00a0 	ldr.w	r0, [r5, #160]	@ 0xa0
c0de488c:	f002 f8b6 	bl	c0de69fc <OUTLINED_FUNCTION_27>
c0de4890:	f8d5 00a0 	ldr.w	r0, [r5, #160]	@ 0xa0
c0de4894:	f001 ff5c 	bl	c0de6750 <OUTLINED_FUNCTION_1>
c0de4898:	4650      	mov	r0, sl
c0de489a:	b004      	add	sp, #16
c0de489c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de48a0:	00001968 	.word	0x00001968

c0de48a4 <nbgl_layoutAddSwitch>:
c0de48a4:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de48a6:	b1d8      	cbz	r0, c0de48e0 <nbgl_layoutAddSwitch+0x3c>
c0de48a8:	2200      	movs	r2, #0
c0de48aa:	e9cd 2201 	strd	r2, r2, [sp, #4]
c0de48ae:	f88d 2016 	strb.w	r2, [sp, #22]
c0de48b2:	2201      	movs	r2, #1
c0de48b4:	f88d 2000 	strb.w	r2, [sp]
c0de48b8:	e9d1 2300 	ldrd	r2, r3, [r1]
c0de48bc:	e9cd 2303 	strd	r2, r3, [sp, #12]
c0de48c0:	7a4a      	ldrb	r2, [r1, #9]
c0de48c2:	f88d 2014 	strb.w	r2, [sp, #20]
c0de48c6:	7a8a      	ldrb	r2, [r1, #10]
c0de48c8:	7a09      	ldrb	r1, [r1, #8]
c0de48ca:	f88d 1015 	strb.w	r1, [sp, #21]
c0de48ce:	4669      	mov	r1, sp
c0de48d0:	f88d 2017 	strb.w	r2, [sp, #23]
c0de48d4:	f7ff fe0a 	bl	c0de44ec <addListItem>
c0de48d8:	b110      	cbz	r0, c0de48e0 <nbgl_layoutAddSwitch+0x3c>
c0de48da:	f002 f99c 	bl	c0de6c16 <OUTLINED_FUNCTION_55>
c0de48de:	e001      	b.n	c0de48e4 <nbgl_layoutAddSwitch+0x40>
c0de48e0:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de48e4:	b006      	add	sp, #24
c0de48e6:	bd80      	pop	{r7, pc}

c0de48e8 <nbgl_layoutAddText>:
c0de48e8:	b5e0      	push	{r5, r6, r7, lr}
c0de48ea:	2300      	movs	r3, #0
c0de48ec:	e9cd 3300 	strd	r3, r3, [sp]
c0de48f0:	2300      	movs	r3, #0
c0de48f2:	f000 f801 	bl	c0de48f8 <addText>
c0de48f6:	bd8c      	pop	{r2, r3, r7, pc}

c0de48f8 <addText>:
c0de48f8:	2800      	cmp	r0, #0
c0de48fa:	f000 8115 	beq.w	c0de4b28 <addText+0x230>
c0de48fe:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de4902:	4683      	mov	fp, r0
c0de4904:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de4908:	460c      	mov	r4, r1
c0de490a:	9e0d      	ldr	r6, [sp, #52]	@ 0x34
c0de490c:	461f      	mov	r7, r3
c0de490e:	9203      	str	r2, [sp, #12]
c0de4910:	f04f 0a01 	mov.w	sl, #1
c0de4914:	f002 f801 	bl	c0de691a <OUTLINED_FUNCTION_16>
c0de4918:	4605      	mov	r5, r0
c0de491a:	2002      	movs	r0, #2
c0de491c:	2e00      	cmp	r6, #0
c0de491e:	bf18      	it	ne
c0de4920:	2003      	movne	r0, #3
c0de4922:	f89b 10ad 	ldrb.w	r1, [fp, #173]	@ 0xad
c0de4926:	f002 f9eb 	bl	c0de6d00 <OUTLINED_FUNCTION_74>
c0de492a:	21a0      	movs	r1, #160	@ 0xa0
c0de492c:	0e02      	lsrs	r2, r0, #24
c0de492e:	f04f 0800 	mov.w	r8, #0
c0de4932:	f885 a005 	strb.w	sl, [r5, #5]
c0de4936:	7129      	strb	r1, [r5, #4]
c0de4938:	4629      	mov	r1, r5
c0de493a:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de493e:	70ca      	strb	r2, [r1, #3]
c0de4940:	0c02      	lsrs	r2, r0, #16
c0de4942:	0a00      	lsrs	r0, r0, #8
c0de4944:	2c00      	cmp	r4, #0
c0de4946:	708a      	strb	r2, [r1, #2]
c0de4948:	f885 0023 	strb.w	r0, [r5, #35]	@ 0x23
c0de494c:	f000 809f 	beq.w	c0de4a8e <addText+0x196>
c0de4950:	f89b 00ad 	ldrb.w	r0, [fp, #173]	@ 0xad
c0de4954:	9701      	str	r7, [sp, #4]
c0de4956:	2604      	movs	r6, #4
c0de4958:	f001 fef6 	bl	c0de6748 <OUTLINED_FUNCTION_0>
c0de495c:	4607      	mov	r7, r0
c0de495e:	f880 801f 	strb.w	r8, [r0, #31]
c0de4962:	4620      	mov	r0, r4
c0de4964:	9402      	str	r4, [sp, #8]
c0de4966:	f006 fa01 	bl	c0dead6c <pic>
c0de496a:	4601      	mov	r1, r0
c0de496c:	201c      	movs	r0, #28
c0de496e:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
c0de4970:	f887 a024 	strb.w	sl, [r7, #36]	@ 0x24
c0de4974:	f887 801a 	strb.w	r8, [r7, #26]
c0de4978:	f887 6020 	strb.w	r6, [r7, #32]
c0de497c:	f887 8021 	strb.w	r8, [r7, #33]	@ 0x21
c0de4980:	f887 8016 	strb.w	r8, [r7, #22]
c0de4984:	7678      	strb	r0, [r7, #25]
c0de4986:	200c      	movs	r0, #12
c0de4988:	0e0a      	lsrs	r2, r1, #24
c0de498a:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de498e:	4638      	mov	r0, r7
c0de4990:	469a      	mov	sl, r3
c0de4992:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de4996:	f002 f8f7 	bl	c0de6b88 <OUTLINED_FUNCTION_45>
c0de499a:	796a      	ldrb	r2, [r5, #5]
c0de499c:	7928      	ldrb	r0, [r5, #4]
c0de499e:	7138      	strb	r0, [r7, #4]
c0de49a0:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de49a4:	717a      	strb	r2, [r7, #5]
c0de49a6:	b153      	cbz	r3, c0de49be <addText+0xc6>
c0de49a8:	4a71      	ldr	r2, [pc, #452]	@ (c0de4b70 <addText+0x278>)
c0de49aa:	447a      	add	r2, pc
c0de49ac:	7813      	ldrb	r3, [r2, #0]
c0de49ae:	7852      	ldrb	r2, [r2, #1]
c0de49b0:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de49b4:	1a80      	subs	r0, r0, r2
c0de49b6:	380c      	subs	r0, #12
c0de49b8:	0a02      	lsrs	r2, r0, #8
c0de49ba:	7138      	strb	r0, [r7, #4]
c0de49bc:	717a      	strb	r2, [r7, #5]
c0de49be:	b282      	uxth	r2, r0
c0de49c0:	200c      	movs	r0, #12
c0de49c2:	2301      	movs	r3, #1
c0de49c4:	f006 f80a 	bl	c0dea9dc <nbgl_getTextHeightInWidth>
c0de49c8:	4629      	mov	r1, r5
c0de49ca:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de49ce:	784e      	ldrb	r6, [r1, #1]
c0de49d0:	788c      	ldrb	r4, [r1, #2]
c0de49d2:	78ca      	ldrb	r2, [r1, #3]
c0de49d4:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de49d8:	ea4c 2606 	orr.w	r6, ip, r6, lsl #8
c0de49dc:	ea44 2202 	orr.w	r2, r4, r2, lsl #8
c0de49e0:	ea46 4202 	orr.w	r2, r6, r2, lsl #16
c0de49e4:	f842 7023 	str.w	r7, [r2, r3, lsl #2]
c0de49e8:	0a02      	lsrs	r2, r0, #8
c0de49ea:	71b8      	strb	r0, [r7, #6]
c0de49ec:	71fa      	strb	r2, [r7, #7]
c0de49ee:	1c5a      	adds	r2, r3, #1
c0de49f0:	f801 2c02 	strb.w	r2, [r1, #-2]
c0de49f4:	7e79      	ldrb	r1, [r7, #25]
c0de49f6:	7eba      	ldrb	r2, [r7, #26]
c0de49f8:	f1ba 0f00 	cmp.w	sl, #0
c0de49fc:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de4a00:	eb01 0800 	add.w	r8, r1, r0
c0de4a04:	d042      	beq.n	c0de4a8c <addText+0x194>
c0de4a06:	f89b 00ad 	ldrb.w	r0, [fp, #173]	@ 0xad
c0de4a0a:	f8dd a030 	ldr.w	sl, [sp, #48]	@ 0x30
c0de4a0e:	f001 ffb7 	bl	c0de6980 <OUTLINED_FUNCTION_21>
c0de4a12:	9a01      	ldr	r2, [sp, #4]
c0de4a14:	4606      	mov	r6, r0
c0de4a16:	4658      	mov	r0, fp
c0de4a18:	4629      	mov	r1, r5
c0de4a1a:	2309      	movs	r3, #9
c0de4a1c:	f7fe fb72 	bl	c0de3104 <layoutAddCallbackObj>
c0de4a20:	4954      	ldr	r1, [pc, #336]	@ (c0de4b74 <addText+0x27c>)
c0de4a22:	4479      	add	r1, pc
c0de4a24:	0a0a      	lsrs	r2, r1, #8
c0de4a26:	0e0b      	lsrs	r3, r1, #24
c0de4a28:	f886 2022 	strb.w	r2, [r6, #34]	@ 0x22
c0de4a2c:	0a3a      	lsrs	r2, r7, #8
c0de4a2e:	74f2      	strb	r2, [r6, #19]
c0de4a30:	4632      	mov	r2, r6
c0de4a32:	f802 1f21 	strb.w	r1, [r2, #33]!
c0de4a36:	0c09      	lsrs	r1, r1, #16
c0de4a38:	7091      	strb	r1, [r2, #2]
c0de4a3a:	4631      	mov	r1, r6
c0de4a3c:	70d3      	strb	r3, [r2, #3]
c0de4a3e:	0e3a      	lsrs	r2, r7, #24
c0de4a40:	f002 f93c 	bl	c0de6cbc <OUTLINED_FUNCTION_69>
c0de4a44:	4629      	mov	r1, r5
c0de4a46:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de4a4a:	784c      	ldrb	r4, [r1, #1]
c0de4a4c:	788f      	ldrb	r7, [r1, #2]
c0de4a4e:	78ca      	ldrb	r2, [r1, #3]
c0de4a50:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de4a54:	ea4c 2404 	orr.w	r4, ip, r4, lsl #8
c0de4a58:	ea47 2202 	orr.w	r2, r7, r2, lsl #8
c0de4a5c:	ea44 4202 	orr.w	r2, r4, r2, lsl #16
c0de4a60:	240c      	movs	r4, #12
c0de4a62:	f842 6023 	str.w	r6, [r2, r3, lsl #2]
c0de4a66:	2200      	movs	r2, #0
c0de4a68:	75f4      	strb	r4, [r6, #23]
c0de4a6a:	f880 a005 	strb.w	sl, [r0, #5]
c0de4a6e:	2001      	movs	r0, #1
c0de4a70:	75b4      	strb	r4, [r6, #22]
c0de4a72:	7632      	strb	r2, [r6, #24]
c0de4a74:	77f2      	strb	r2, [r6, #31]
c0de4a76:	f801 0c06 	strb.w	r0, [r1, #-6]
c0de4a7a:	f10a 000f 	add.w	r0, sl, #15
c0de4a7e:	f801 2c05 	strb.w	r2, [r1, #-5]
c0de4a82:	f801 0c04 	strb.w	r0, [r1, #-4]
c0de4a86:	1c58      	adds	r0, r3, #1
c0de4a88:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de4a8c:	9c02      	ldr	r4, [sp, #8]
c0de4a8e:	9e03      	ldr	r6, [sp, #12]
c0de4a90:	2e00      	cmp	r6, #0
c0de4a92:	d04b      	beq.n	c0de4b2c <addText+0x234>
c0de4a94:	f89b 00ad 	ldrb.w	r0, [fp, #173]	@ 0xad
c0de4a98:	f001 fe56 	bl	c0de6748 <OUTLINED_FUNCTION_0>
c0de4a9c:	f04f 0a00 	mov.w	sl, #0
c0de4aa0:	4607      	mov	r7, r0
c0de4aa2:	f880 a01f 	strb.w	sl, [r0, #31]
c0de4aa6:	f002 f906 	bl	c0de6cb6 <OUTLINED_FUNCTION_68>
c0de4aaa:	4601      	mov	r1, r0
c0de4aac:	200b      	movs	r0, #11
c0de4aae:	2301      	movs	r3, #1
c0de4ab0:	f887 a021 	strb.w	sl, [r7, #33]	@ 0x21
c0de4ab4:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de4ab8:	2001      	movs	r0, #1
c0de4aba:	0e0a      	lsrs	r2, r1, #24
c0de4abc:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de4ac0:	4638      	mov	r0, r7
c0de4ac2:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de4ac6:	f002 f85f 	bl	c0de6b88 <OUTLINED_FUNCTION_45>
c0de4aca:	796a      	ldrb	r2, [r5, #5]
c0de4acc:	7928      	ldrb	r0, [r5, #4]
c0de4ace:	717a      	strb	r2, [r7, #5]
c0de4ad0:	7138      	strb	r0, [r7, #4]
c0de4ad2:	ea40 2202 	orr.w	r2, r0, r2, lsl #8
c0de4ad6:	f002 f848 	bl	c0de6b6a <OUTLINED_FUNCTION_43>
c0de4ada:	210e      	movs	r1, #14
c0de4adc:	f887 a01a 	strb.w	sl, [r7, #26]
c0de4ae0:	462a      	mov	r2, r5
c0de4ae2:	2c00      	cmp	r4, #0
c0de4ae4:	bf08      	it	eq
c0de4ae6:	211a      	moveq	r1, #26
c0de4ae8:	7679      	strb	r1, [r7, #25]
c0de4aea:	f887 a016 	strb.w	sl, [r7, #22]
c0de4aee:	f812 cf22 	ldrb.w	ip, [r2, #34]!
c0de4af2:	7856      	ldrb	r6, [r2, #1]
c0de4af4:	f892 e002 	ldrb.w	lr, [r2, #2]
c0de4af8:	78d3      	ldrb	r3, [r2, #3]
c0de4afa:	f812 4c02 	ldrb.w	r4, [r2, #-2]
c0de4afe:	ea4c 2606 	orr.w	r6, ip, r6, lsl #8
c0de4b02:	ea4e 2303 	orr.w	r3, lr, r3, lsl #8
c0de4b06:	ea46 4303 	orr.w	r3, r6, r3, lsl #16
c0de4b0a:	f843 7024 	str.w	r7, [r3, r4, lsl #2]
c0de4b0e:	2304      	movs	r3, #4
c0de4b10:	71b8      	strb	r0, [r7, #6]
c0de4b12:	f887 3020 	strb.w	r3, [r7, #32]
c0de4b16:	0a03      	lsrs	r3, r0, #8
c0de4b18:	4440      	add	r0, r8
c0de4b1a:	4408      	add	r0, r1
c0de4b1c:	71fb      	strb	r3, [r7, #7]
c0de4b1e:	1c63      	adds	r3, r4, #1
c0de4b20:	f802 3c02 	strb.w	r3, [r2, #-2]
c0de4b24:	301a      	adds	r0, #26
c0de4b26:	e003      	b.n	c0de4b30 <addText+0x238>
c0de4b28:	f001 bfca 	b.w	c0de6ac0 <OUTLINED_FUNCTION_35>
c0de4b2c:	f108 001c 	add.w	r0, r8, #28
c0de4b30:	f8db 10a0 	ldr.w	r1, [fp, #160]	@ 0xa0
c0de4b34:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de4b38:	784c      	ldrb	r4, [r1, #1]
c0de4b3a:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de4b3e:	788e      	ldrb	r6, [r1, #2]
c0de4b40:	78c9      	ldrb	r1, [r1, #3]
c0de4b42:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de4b46:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de4b4a:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de4b4e:	2220      	movs	r2, #32
c0de4b50:	f841 5023 	str.w	r5, [r1, r3, lsl #2]
c0de4b54:	2100      	movs	r1, #0
c0de4b56:	71a8      	strb	r0, [r5, #6]
c0de4b58:	75ea      	strb	r2, [r5, #23]
c0de4b5a:	7629      	strb	r1, [r5, #24]
c0de4b5c:	77e9      	strb	r1, [r5, #31]
c0de4b5e:	75a9      	strb	r1, [r5, #22]
c0de4b60:	0a01      	lsrs	r1, r0, #8
c0de4b62:	b280      	uxth	r0, r0
c0de4b64:	71e9      	strb	r1, [r5, #7]
c0de4b66:	f8db 10a0 	ldr.w	r1, [fp, #160]	@ 0xa0
c0de4b6a:	f002 b84c 	b.w	c0de6c06 <OUTLINED_FUNCTION_54>
c0de4b6e:	bf00      	nop
c0de4b70:	000077dc 	.word	0x000077dc
c0de4b74:	0000749f 	.word	0x0000749f

c0de4b78 <nbgl_layoutAddTextWithAlias>:
c0de4b78:	b51c      	push	{r2, r3, r4, lr}
c0de4b7a:	2401      	movs	r4, #1
c0de4b7c:	9401      	str	r4, [sp, #4]
c0de4b7e:	9c04      	ldr	r4, [sp, #16]
c0de4b80:	9400      	str	r4, [sp, #0]
c0de4b82:	f7ff feb9 	bl	c0de48f8 <addText>
c0de4b86:	bd1c      	pop	{r2, r3, r4, pc}

c0de4b88 <nbgl_layoutAddTextContent>:
c0de4b88:	2800      	cmp	r0, #0
c0de4b8a:	f000 80b5 	beq.w	c0de4cf8 <nbgl_layoutAddTextContent+0x170>
c0de4b8e:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de4b92:	4682      	mov	sl, r0
c0de4b94:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de4b98:	4e58      	ldr	r6, [pc, #352]	@ (c0de4cfc <nbgl_layoutAddTextContent+0x174>)
c0de4b9a:	460d      	mov	r5, r1
c0de4b9c:	e9cd 2302 	strd	r2, r3, [sp, #8]
c0de4ba0:	08c1      	lsrs	r1, r0, #3
c0de4ba2:	447e      	add	r6, pc
c0de4ba4:	2004      	movs	r0, #4
c0de4ba6:	47b0      	blx	r6
c0de4ba8:	f04f 0b00 	mov.w	fp, #0
c0de4bac:	4607      	mov	r7, r0
c0de4bae:	f880 b01f 	strb.w	fp, [r0, #31]
c0de4bb2:	4628      	mov	r0, r5
c0de4bb4:	4c52      	ldr	r4, [pc, #328]	@ (c0de4d00 <nbgl_layoutAddTextContent+0x178>)
c0de4bb6:	447c      	add	r4, pc
c0de4bb8:	47a0      	blx	r4
c0de4bba:	4601      	mov	r1, r0
c0de4bbc:	2010      	movs	r0, #16
c0de4bbe:	2201      	movs	r2, #1
c0de4bc0:	9401      	str	r4, [sp, #4]
c0de4bc2:	f887 b01a 	strb.w	fp, [r7, #26]
c0de4bc6:	f887 b018 	strb.w	fp, [r7, #24]
c0de4bca:	f887 b021 	strb.w	fp, [r7, #33]	@ 0x21
c0de4bce:	f887 b016 	strb.w	fp, [r7, #22]
c0de4bd2:	2301      	movs	r3, #1
c0de4bd4:	46a0      	mov	r8, r4
c0de4bd6:	7678      	strb	r0, [r7, #25]
c0de4bd8:	2020      	movs	r0, #32
c0de4bda:	717a      	strb	r2, [r7, #5]
c0de4bdc:	f887 2024 	strb.w	r2, [r7, #36]	@ 0x24
c0de4be0:	0e0a      	lsrs	r2, r1, #24
c0de4be2:	75f8      	strb	r0, [r7, #23]
c0de4be4:	20a0      	movs	r0, #160	@ 0xa0
c0de4be6:	7138      	strb	r0, [r7, #4]
c0de4be8:	200d      	movs	r0, #13
c0de4bea:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de4bee:	2004      	movs	r0, #4
c0de4bf0:	f887 0020 	strb.w	r0, [r7, #32]
c0de4bf4:	4638      	mov	r0, r7
c0de4bf6:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de4bfa:	70c2      	strb	r2, [r0, #3]
c0de4bfc:	0c0a      	lsrs	r2, r1, #16
c0de4bfe:	7082      	strb	r2, [r0, #2]
c0de4c00:	0a08      	lsrs	r0, r1, #8
c0de4c02:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de4c06:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de4c0a:	200d      	movs	r0, #13
c0de4c0c:	4d3d      	ldr	r5, [pc, #244]	@ (c0de4d04 <nbgl_layoutAddTextContent+0x17c>)
c0de4c0e:	447d      	add	r5, pc
c0de4c10:	47a8      	blx	r5
c0de4c12:	f8da 10a0 	ldr.w	r1, [sl, #160]	@ 0xa0
c0de4c16:	f001 fecc 	bl	c0de69b2 <OUTLINED_FUNCTION_24>
c0de4c1a:	71b8      	strb	r0, [r7, #6]
c0de4c1c:	0a00      	lsrs	r0, r0, #8
c0de4c1e:	71f8      	strb	r0, [r7, #7]
c0de4c20:	f001 ff42 	bl	c0de6aa8 <OUTLINED_FUNCTION_34>
c0de4c24:	4607      	mov	r7, r0
c0de4c26:	f880 b01f 	strb.w	fp, [r0, #31]
c0de4c2a:	9802      	ldr	r0, [sp, #8]
c0de4c2c:	47c0      	blx	r8
c0de4c2e:	4601      	mov	r1, r0
c0de4c30:	2001      	movs	r0, #1
c0de4c32:	22a0      	movs	r2, #160	@ 0xa0
c0de4c34:	2301      	movs	r3, #1
c0de4c36:	f04f 0801 	mov.w	r8, #1
c0de4c3a:	f887 b021 	strb.w	fp, [r7, #33]	@ 0x21
c0de4c3e:	713a      	strb	r2, [r7, #4]
c0de4c40:	220b      	movs	r2, #11
c0de4c42:	7178      	strb	r0, [r7, #5]
c0de4c44:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de4c48:	4638      	mov	r0, r7
c0de4c4a:	f887 2022 	strb.w	r2, [r7, #34]	@ 0x22
c0de4c4e:	f001 ffc6 	bl	c0de6bde <OUTLINED_FUNCTION_52>
c0de4c52:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de4c56:	200b      	movs	r0, #11
c0de4c58:	47a8      	blx	r5
c0de4c5a:	f8da 10a0 	ldr.w	r1, [sl, #160]	@ 0xa0
c0de4c5e:	f887 b01a 	strb.w	fp, [r7, #26]
c0de4c62:	f887 b018 	strb.w	fp, [r7, #24]
c0de4c66:	f887 b016 	strb.w	fp, [r7, #22]
c0de4c6a:	f001 fea2 	bl	c0de69b2 <OUTLINED_FUNCTION_24>
c0de4c6e:	2104      	movs	r1, #4
c0de4c70:	71b8      	strb	r0, [r7, #6]
c0de4c72:	0a00      	lsrs	r0, r0, #8
c0de4c74:	f887 1020 	strb.w	r1, [r7, #32]
c0de4c78:	2118      	movs	r1, #24
c0de4c7a:	71f8      	strb	r0, [r7, #7]
c0de4c7c:	7679      	strb	r1, [r7, #25]
c0de4c7e:	2120      	movs	r1, #32
c0de4c80:	75f9      	strb	r1, [r7, #23]
c0de4c82:	f001 ff11 	bl	c0de6aa8 <OUTLINED_FUNCTION_34>
c0de4c86:	4606      	mov	r6, r0
c0de4c88:	f880 801f 	strb.w	r8, [r0, #31]
c0de4c8c:	9803      	ldr	r0, [sp, #12]
c0de4c8e:	9901      	ldr	r1, [sp, #4]
c0de4c90:	4788      	blx	r1
c0de4c92:	4601      	mov	r1, r0
c0de4c94:	20a0      	movs	r0, #160	@ 0xa0
c0de4c96:	2301      	movs	r3, #1
c0de4c98:	f886 8005 	strb.w	r8, [r6, #5]
c0de4c9c:	f886 8024 	strb.w	r8, [r6, #36]	@ 0x24
c0de4ca0:	f886 b021 	strb.w	fp, [r6, #33]	@ 0x21
c0de4ca4:	7130      	strb	r0, [r6, #4]
c0de4ca6:	200b      	movs	r0, #11
c0de4ca8:	0e0a      	lsrs	r2, r1, #24
c0de4caa:	f001 fec9 	bl	c0de6a40 <OUTLINED_FUNCTION_30>
c0de4cae:	47a8      	blx	r5
c0de4cb0:	f8da 10a0 	ldr.w	r1, [sl, #160]	@ 0xa0
c0de4cb4:	f886 b01a 	strb.w	fp, [r6, #26]
c0de4cb8:	f886 b018 	strb.w	fp, [r6, #24]
c0de4cbc:	f001 fdb0 	bl	c0de6820 <OUTLINED_FUNCTION_8>
c0de4cc0:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
c0de4cc4:	2128      	movs	r1, #40	@ 0x28
c0de4cc6:	71b0      	strb	r0, [r6, #6]
c0de4cc8:	0a00      	lsrs	r0, r0, #8
c0de4cca:	7671      	strb	r1, [r6, #25]
c0de4ccc:	2120      	movs	r1, #32
c0de4cce:	71f0      	strb	r0, [r6, #7]
c0de4cd0:	75f1      	strb	r1, [r6, #23]
c0de4cd2:	2104      	movs	r1, #4
c0de4cd4:	f8da 00a0 	ldr.w	r0, [sl, #160]	@ 0xa0
c0de4cd8:	f886 1020 	strb.w	r1, [r6, #32]
c0de4cdc:	2107      	movs	r1, #7
c0de4cde:	75b1      	strb	r1, [r6, #22]
c0de4ce0:	f890 3020 	ldrb.w	r3, [r0, #32]
c0de4ce4:	7981      	ldrb	r1, [r0, #6]
c0de4ce6:	79c2      	ldrb	r2, [r0, #7]
c0de4ce8:	3301      	adds	r3, #1
c0de4cea:	f880 3020 	strb.w	r3, [r0, #32]
c0de4cee:	ea41 2002 	orr.w	r0, r1, r2, lsl #8
c0de4cf2:	b004      	add	sp, #16
c0de4cf4:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de4cf8:	f001 bee2 	b.w	c0de6ac0 <OUTLINED_FUNCTION_35>
c0de4cfc:	00005e05 	.word	0x00005e05
c0de4d00:	000061b3 	.word	0x000061b3
c0de4d04:	00005dcb 	.word	0x00005dcb

c0de4d08 <nbgl_layoutAddRadioChoice>:
c0de4d08:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de4d0c:	2800      	cmp	r0, #0
c0de4d0e:	f000 8102 	beq.w	c0de4f16 <nbgl_layoutAddRadioChoice+0x20e>
c0de4d12:	4605      	mov	r5, r0
c0de4d14:	4884      	ldr	r0, [pc, #528]	@ (c0de4f28 <nbgl_layoutAddRadioChoice+0x220>)
c0de4d16:	468a      	mov	sl, r1
c0de4d18:	f04f 0800 	mov.w	r8, #0
c0de4d1c:	e9cd 1501 	strd	r1, r5, [sp, #4]
c0de4d20:	4478      	add	r0, pc
c0de4d22:	9003      	str	r0, [sp, #12]
c0de4d24:	f89a 0005 	ldrb.w	r0, [sl, #5]
c0de4d28:	4580      	cmp	r8, r0
c0de4d2a:	f080 80f7 	bcs.w	c0de4f1c <nbgl_layoutAddRadioChoice+0x214>
c0de4d2e:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de4d32:	9c03      	ldr	r4, [sp, #12]
c0de4d34:	08c1      	lsrs	r1, r0, #3
c0de4d36:	2001      	movs	r0, #1
c0de4d38:	47a0      	blx	r4
c0de4d3a:	4606      	mov	r6, r0
c0de4d3c:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de4d40:	08c1      	lsrs	r1, r0, #3
c0de4d42:	2004      	movs	r0, #4
c0de4d44:	47a0      	blx	r4
c0de4d46:	4607      	mov	r7, r0
c0de4d48:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de4d4c:	08c1      	lsrs	r1, r0, #3
c0de4d4e:	2009      	movs	r0, #9
c0de4d50:	47a0      	blx	r4
c0de4d52:	f89a 2007 	ldrb.w	r2, [sl, #7]
c0de4d56:	f89a 3008 	ldrb.w	r3, [sl, #8]
c0de4d5a:	4604      	mov	r4, r0
c0de4d5c:	4628      	mov	r0, r5
c0de4d5e:	f001 fe0c 	bl	c0de697a <OUTLINED_FUNCTION_20>
c0de4d62:	2800      	cmp	r0, #0
c0de4d64:	f000 80d7 	beq.w	c0de4f16 <nbgl_layoutAddRadioChoice+0x20e>
c0de4d68:	2002      	movs	r0, #2
c0de4d6a:	f886 0020 	strb.w	r0, [r6, #32]
c0de4d6e:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de4d72:	08c1      	lsrs	r1, r0, #3
c0de4d74:	2002      	movs	r0, #2
c0de4d76:	f005 fe1d 	bl	c0dea9b4 <nbgl_containerPoolGet>
c0de4d7a:	2300      	movs	r3, #0
c0de4d7c:	ea4f 2c16 	mov.w	ip, r6, lsr #8
c0de4d80:	4631      	mov	r1, r6
c0de4d82:	0e02      	lsrs	r2, r0, #24
c0de4d84:	4655      	mov	r5, sl
c0de4d86:	ea4f 6a16 	mov.w	sl, r6, lsr #24
c0de4d8a:	ea4f 4b16 	mov.w	fp, r6, lsr #16
c0de4d8e:	74f3      	strb	r3, [r6, #19]
c0de4d90:	f884 c013 	strb.w	ip, [r4, #19]
c0de4d94:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de4d98:	70ca      	strb	r2, [r1, #3]
c0de4d9a:	0c02      	lsrs	r2, r0, #16
c0de4d9c:	708a      	strb	r2, [r1, #2]
c0de4d9e:	0a01      	lsrs	r1, r0, #8
c0de4da0:	f886 1023 	strb.w	r1, [r6, #35]	@ 0x23
c0de4da4:	4631      	mov	r1, r6
c0de4da6:	f801 3f12 	strb.w	r3, [r1, #18]!
c0de4daa:	70cb      	strb	r3, [r1, #3]
c0de4dac:	708b      	strb	r3, [r1, #2]
c0de4dae:	4621      	mov	r1, r4
c0de4db0:	f801 6f12 	strb.w	r6, [r1, #18]!
c0de4db4:	f881 b002 	strb.w	fp, [r1, #2]
c0de4db8:	f881 a003 	strb.w	sl, [r1, #3]
c0de4dbc:	2120      	movs	r1, #32
c0de4dbe:	7633      	strb	r3, [r6, #24]
c0de4dc0:	71f3      	strb	r3, [r6, #7]
c0de4dc2:	75b3      	strb	r3, [r6, #22]
c0de4dc4:	75f1      	strb	r1, [r6, #23]
c0de4dc6:	215c      	movs	r1, #92	@ 0x5c
c0de4dc8:	71b1      	strb	r1, [r6, #6]
c0de4dca:	2101      	movs	r1, #1
c0de4dcc:	7171      	strb	r1, [r6, #5]
c0de4dce:	21a0      	movs	r1, #160	@ 0xa0
c0de4dd0:	7131      	strb	r1, [r6, #4]
c0de4dd2:	2102      	movs	r1, #2
c0de4dd4:	6044      	str	r4, [r0, #4]
c0de4dd6:	77e3      	strb	r3, [r4, #31]
c0de4dd8:	f884 3021 	strb.w	r3, [r4, #33]	@ 0x21
c0de4ddc:	7928      	ldrb	r0, [r5, #4]
c0de4dde:	f884 1020 	strb.w	r1, [r4, #32]
c0de4de2:	2106      	movs	r1, #6
c0de4de4:	75a1      	strb	r1, [r4, #22]
c0de4de6:	b110      	cbz	r0, c0de4dee <nbgl_layoutAddRadioChoice+0xe6>
c0de4de8:	f44f 70d0 	mov.w	r0, #416	@ 0x1a0
c0de4dec:	e014      	b.n	c0de4e18 <nbgl_layoutAddRadioChoice+0x110>
c0de4dee:	6828      	ldr	r0, [r5, #0]
c0de4df0:	4665      	mov	r5, ip
c0de4df2:	f850 0028 	ldr.w	r0, [r0, r8, lsl #2]
c0de4df6:	f005 ffb9 	bl	c0dead6c <pic>
c0de4dfa:	4639      	mov	r1, r7
c0de4dfc:	0e02      	lsrs	r2, r0, #24
c0de4dfe:	46ac      	mov	ip, r5
c0de4e00:	9d01      	ldr	r5, [sp, #4]
c0de4e02:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de4e06:	70ca      	strb	r2, [r1, #3]
c0de4e08:	0c02      	lsrs	r2, r0, #16
c0de4e0a:	0a00      	lsrs	r0, r0, #8
c0de4e0c:	708a      	strb	r2, [r1, #2]
c0de4e0e:	7048      	strb	r0, [r1, #1]
c0de4e10:	7930      	ldrb	r0, [r6, #4]
c0de4e12:	7971      	ldrb	r1, [r6, #5]
c0de4e14:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de4e18:	4639      	mov	r1, r7
c0de4e1a:	f887 c013 	strb.w	ip, [r7, #19]
c0de4e1e:	4632      	mov	r2, r6
c0de4e20:	3828      	subs	r0, #40	@ 0x28
c0de4e22:	f801 6f12 	strb.w	r6, [r1, #18]!
c0de4e26:	f881 b002 	strb.w	fp, [r1, #2]
c0de4e2a:	f881 a003 	strb.w	sl, [r1, #3]
c0de4e2e:	f04f 0b00 	mov.w	fp, #0
c0de4e32:	46aa      	mov	sl, r5
c0de4e34:	f896 1023 	ldrb.w	r1, [r6, #35]	@ 0x23
c0de4e38:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de4e3c:	f886 b01d 	strb.w	fp, [r6, #29]
c0de4e40:	f001 ff61 	bl	c0de6d06 <OUTLINED_FUNCTION_75>
c0de4e44:	4b37      	ldr	r3, [pc, #220]	@ (c0de4f24 <nbgl_layoutAddRadioChoice+0x21c>)
c0de4e46:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de4e4a:	600f      	str	r7, [r1, #0]
c0de4e4c:	f819 1003 	ldrb.w	r1, [r9, r3]
c0de4e50:	1c4a      	adds	r2, r1, #1
c0de4e52:	3114      	adds	r1, #20
c0de4e54:	f809 2003 	strb.w	r2, [r9, r3]
c0de4e58:	2201      	movs	r2, #1
c0de4e5a:	77b1      	strb	r1, [r6, #30]
c0de4e5c:	2104      	movs	r1, #4
c0de4e5e:	7732      	strb	r2, [r6, #28]
c0de4e60:	f887 b021 	strb.w	fp, [r7, #33]	@ 0x21
c0de4e64:	f887 1020 	strb.w	r1, [r7, #32]
c0de4e68:	75b9      	strb	r1, [r7, #22]
c0de4e6a:	79aa      	ldrb	r2, [r5, #6]
c0de4e6c:	eba8 0302 	sub.w	r3, r8, r2
c0de4e70:	fab3 f383 	clz	r3, r3
c0de4e74:	095b      	lsrs	r3, r3, #5
c0de4e76:	f884 3021 	strb.w	r3, [r4, #33]	@ 0x21
c0de4e7a:	7138      	strb	r0, [r7, #4]
c0de4e7c:	0a00      	lsrs	r0, r0, #8
c0de4e7e:	7178      	strb	r0, [r7, #5]
c0de4e80:	ebb8 0002 	subs.w	r0, r8, r2
c0de4e84:	bf18      	it	ne
c0de4e86:	2001      	movne	r0, #1
c0de4e88:	77f8      	strb	r0, [r7, #31]
c0de4e8a:	4590      	cmp	r8, r2
c0de4e8c:	f04f 000b 	mov.w	r0, #11
c0de4e90:	bf08      	it	eq
c0de4e92:	200c      	moveq	r0, #12
c0de4e94:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de4e98:	f005 fd96 	bl	c0dea9c8 <nbgl_getFontHeight>
c0de4e9c:	9d02      	ldr	r5, [sp, #8]
c0de4e9e:	f887 b007 	strb.w	fp, [r7, #7]
c0de4ea2:	71b8      	strb	r0, [r7, #6]
c0de4ea4:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de4ea8:	08c0      	lsrs	r0, r0, #3
c0de4eaa:	f000 f83f 	bl	c0de4f2c <createHorizontalLine>
c0de4eae:	f8d5 10a0 	ldr.w	r1, [r5, #160]	@ 0xa0
c0de4eb2:	f108 0801 	add.w	r8, r8, #1
c0de4eb6:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de4eba:	784c      	ldrb	r4, [r1, #1]
c0de4ebc:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de4ec0:	788f      	ldrb	r7, [r1, #2]
c0de4ec2:	78c9      	ldrb	r1, [r1, #3]
c0de4ec4:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de4ec8:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de4ecc:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de4ed0:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
c0de4ed4:	f8d5 10a0 	ldr.w	r1, [r5, #160]	@ 0xa0
c0de4ed8:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de4edc:	784b      	ldrb	r3, [r1, #1]
c0de4ede:	788c      	ldrb	r4, [r1, #2]
c0de4ee0:	78ce      	ldrb	r6, [r1, #3]
c0de4ee2:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de4ee6:	ea44 2306 	orr.w	r3, r4, r6, lsl #8
c0de4eea:	ea42 4203 	orr.w	r2, r2, r3, lsl #16
c0de4eee:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de4ef2:	3301      	adds	r3, #1
c0de4ef4:	f801 3c02 	strb.w	r3, [r1, #-2]
c0de4ef8:	21ff      	movs	r1, #255	@ 0xff
c0de4efa:	b2dc      	uxtb	r4, r3
c0de4efc:	7681      	strb	r1, [r0, #26]
c0de4efe:	21fc      	movs	r1, #252	@ 0xfc
c0de4f00:	f842 0024 	str.w	r0, [r2, r4, lsl #2]
c0de4f04:	7641      	strb	r1, [r0, #25]
c0de4f06:	2103      	movs	r1, #3
c0de4f08:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de4f0c:	f8d5 00a0 	ldr.w	r0, [r5, #160]	@ 0xa0
c0de4f10:	f001 fc1e 	bl	c0de6750 <OUTLINED_FUNCTION_1>
c0de4f14:	e706      	b.n	c0de4d24 <nbgl_layoutAddRadioChoice+0x1c>
c0de4f16:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de4f1a:	e000      	b.n	c0de4f1e <nbgl_layoutAddRadioChoice+0x216>
c0de4f1c:	2000      	movs	r0, #0
c0de4f1e:	b004      	add	sp, #16
c0de4f20:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de4f24:	00001968 	.word	0x00001968
c0de4f28:	00005c87 	.word	0x00005c87

c0de4f2c <createHorizontalLine>:
c0de4f2c:	b580      	push	{r7, lr}
c0de4f2e:	4601      	mov	r1, r0
c0de4f30:	2003      	movs	r0, #3
c0de4f32:	f005 fd3a 	bl	c0dea9aa <nbgl_objPoolGet>
c0de4f36:	2100      	movs	r1, #0
c0de4f38:	22e0      	movs	r2, #224	@ 0xe0
c0de4f3a:	71c1      	strb	r1, [r0, #7]
c0de4f3c:	2104      	movs	r1, #4
c0de4f3e:	7102      	strb	r2, [r0, #4]
c0de4f40:	2202      	movs	r2, #2
c0de4f42:	7181      	strb	r1, [r0, #6]
c0de4f44:	2101      	movs	r1, #1
c0de4f46:	f880 2020 	strb.w	r2, [r0, #32]
c0de4f4a:	7141      	strb	r1, [r0, #5]
c0de4f4c:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de4f50:	77c1      	strb	r1, [r0, #31]
c0de4f52:	bd80      	pop	{r7, pc}

c0de4f54 <nbgl_layoutAddCenteredInfo>:
c0de4f54:	b570      	push	{r4, r5, r6, lr}
c0de4f56:	b08a      	sub	sp, #40	@ 0x28
c0de4f58:	ae01      	add	r6, sp, #4
c0de4f5a:	460c      	mov	r4, r1
c0de4f5c:	4605      	mov	r5, r0
c0de4f5e:	2124      	movs	r1, #36	@ 0x24
c0de4f60:	4630      	mov	r0, r6
c0de4f62:	f006 f925 	bl	c0deb1b0 <__aeabi_memclr>
c0de4f66:	b33d      	cbz	r5, c0de4fb8 <nbgl_layoutAddCenteredInfo+0x64>
c0de4f68:	6820      	ldr	r0, [r4, #0]
c0de4f6a:	68e1      	ldr	r1, [r4, #12]
c0de4f6c:	9102      	str	r1, [sp, #8]
c0de4f6e:	b128      	cbz	r0, c0de4f7c <nbgl_layoutAddCenteredInfo+0x28>
c0de4f70:	7c61      	ldrb	r1, [r4, #17]
c0de4f72:	2210      	movs	r2, #16
c0de4f74:	2903      	cmp	r1, #3
c0de4f76:	bf08      	it	eq
c0de4f78:	2214      	moveq	r2, #20
c0de4f7a:	50b0      	str	r0, [r6, r2]
c0de4f7c:	6860      	ldr	r0, [r4, #4]
c0de4f7e:	b128      	cbz	r0, c0de4f8c <nbgl_layoutAddCenteredInfo+0x38>
c0de4f80:	7c61      	ldrb	r1, [r4, #17]
c0de4f82:	2218      	movs	r2, #24
c0de4f84:	2901      	cmp	r1, #1
c0de4f86:	bf08      	it	eq
c0de4f88:	2214      	moveq	r2, #20
c0de4f8a:	50b0      	str	r0, [r6, r2]
c0de4f8c:	68a0      	ldr	r0, [r4, #8]
c0de4f8e:	b128      	cbz	r0, c0de4f9c <nbgl_layoutAddCenteredInfo+0x48>
c0de4f90:	7c61      	ldrb	r1, [r4, #17]
c0de4f92:	2218      	movs	r2, #24
c0de4f94:	2902      	cmp	r1, #2
c0de4f96:	bf08      	it	eq
c0de4f98:	221c      	moveq	r2, #28
c0de4f9a:	50b0      	str	r0, [r6, r2]
c0de4f9c:	a901      	add	r1, sp, #4
c0de4f9e:	4628      	mov	r0, r5
c0de4fa0:	f000 f816 	bl	c0de4fd0 <addContentCenter>
c0de4fa4:	7c21      	ldrb	r1, [r4, #16]
c0de4fa6:	b151      	cbz	r1, c0de4fbe <nbgl_layoutAddCenteredInfo+0x6a>
c0de4fa8:	2100      	movs	r1, #0
c0de4faa:	2220      	movs	r2, #32
c0de4fac:	7601      	strb	r1, [r0, #24]
c0de4fae:	75c2      	strb	r2, [r0, #23]
c0de4fb0:	7581      	strb	r1, [r0, #22]
c0de4fb2:	8a61      	ldrh	r1, [r4, #18]
c0de4fb4:	3120      	adds	r1, #32
c0de4fb6:	e003      	b.n	c0de4fc0 <nbgl_layoutAddCenteredInfo+0x6c>
c0de4fb8:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de4fbc:	e005      	b.n	c0de4fca <nbgl_layoutAddCenteredInfo+0x76>
c0de4fbe:	8a61      	ldrh	r1, [r4, #18]
c0de4fc0:	7641      	strb	r1, [r0, #25]
c0de4fc2:	0a09      	lsrs	r1, r1, #8
c0de4fc4:	7681      	strb	r1, [r0, #26]
c0de4fc6:	f001 fe26 	bl	c0de6c16 <OUTLINED_FUNCTION_55>
c0de4fca:	b00a      	add	sp, #40	@ 0x28
c0de4fcc:	bd70      	pop	{r4, r5, r6, pc}
	...

c0de4fd0 <addContentCenter>:
c0de4fd0:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de4fd4:	4606      	mov	r6, r0
c0de4fd6:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de4fda:	468b      	mov	fp, r1
c0de4fdc:	f001 fc9d 	bl	c0de691a <OUTLINED_FUNCTION_16>
c0de4fe0:	2400      	movs	r4, #0
c0de4fe2:	4680      	mov	r8, r0
c0de4fe4:	f880 4020 	strb.w	r4, [r0, #32]
c0de4fe8:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de4fec:	08c1      	lsrs	r1, r0, #3
c0de4fee:	2006      	movs	r0, #6
c0de4ff0:	f005 fce0 	bl	c0dea9b4 <nbgl_containerPoolGet>
c0de4ff4:	4641      	mov	r1, r8
c0de4ff6:	0e02      	lsrs	r2, r0, #24
c0de4ff8:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de4ffc:	f001 fdd2 	bl	c0de6ba4 <OUTLINED_FUNCTION_47>
c0de5000:	f888 0023 	strb.w	r0, [r8, #35]	@ 0x23
c0de5004:	f8db 0004 	ldr.w	r0, [fp, #4]
c0de5008:	2800      	cmp	r0, #0
c0de500a:	d079      	beq.n	c0de5100 <addContentCenter+0x130>
c0de500c:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de5010:	f001 fcb6 	bl	c0de6980 <OUTLINED_FUNCTION_21>
c0de5014:	4607      	mov	r7, r0
c0de5016:	77c4      	strb	r4, [r0, #31]
c0de5018:	f8db 0004 	ldr.w	r0, [fp, #4]
c0de501c:	f005 fea6 	bl	c0dead6c <pic>
c0de5020:	4639      	mov	r1, r7
c0de5022:	0e02      	lsrs	r2, r0, #24
c0de5024:	46b2      	mov	sl, r6
c0de5026:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de502a:	70ca      	strb	r2, [r1, #3]
c0de502c:	0c02      	lsrs	r2, r0, #16
c0de502e:	708a      	strb	r2, [r1, #2]
c0de5030:	0a01      	lsrs	r1, r0, #8
c0de5032:	f887 1022 	strb.w	r1, [r7, #34]	@ 0x22
c0de5036:	4641      	mov	r1, r8
c0de5038:	f001 fd28 	bl	c0de6a8c <OUTLINED_FUNCTION_33>
c0de503c:	f842 7023 	str.w	r7, [r2, r3, lsl #2]
c0de5040:	2202      	movs	r2, #2
c0de5042:	3301      	adds	r3, #1
c0de5044:	75ba      	strb	r2, [r7, #22]
c0de5046:	f8bb 2020 	ldrh.w	r2, [fp, #32]
c0de504a:	767a      	strb	r2, [r7, #25]
c0de504c:	f801 3c02 	strb.w	r3, [r1, #-2]
c0de5050:	0a14      	lsrs	r4, r2, #8
c0de5052:	7881      	ldrb	r1, [r0, #2]
c0de5054:	78c0      	ldrb	r0, [r0, #3]
c0de5056:	76bc      	strb	r4, [r7, #26]
c0de5058:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de505c:	4410      	add	r0, r2
c0de505e:	9000      	str	r0, [sp, #0]
c0de5060:	f89b 0000 	ldrb.w	r0, [fp]
c0de5064:	2801      	cmp	r0, #1
c0de5066:	d146      	bne.n	c0de50f6 <addContentCenter+0x126>
c0de5068:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de506c:	f001 fc88 	bl	c0de6980 <OUTLINED_FUNCTION_21>
c0de5070:	4604      	mov	r4, r0
c0de5072:	2000      	movs	r0, #0
c0de5074:	77e0      	strb	r0, [r4, #31]
c0de5076:	f8db 0008 	ldr.w	r0, [fp, #8]
c0de507a:	6800      	ldr	r0, [r0, #0]
c0de507c:	6800      	ldr	r0, [r0, #0]
c0de507e:	f005 fe75 	bl	c0dead6c <pic>
c0de5082:	4621      	mov	r1, r4
c0de5084:	0e02      	lsrs	r2, r0, #24
c0de5086:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de508a:	70ca      	strb	r2, [r1, #3]
c0de508c:	0c02      	lsrs	r2, r0, #16
c0de508e:	0a00      	lsrs	r0, r0, #8
c0de5090:	f884 0022 	strb.w	r0, [r4, #34]	@ 0x22
c0de5094:	708a      	strb	r2, [r1, #2]
c0de5096:	4640      	mov	r0, r8
c0de5098:	f001 fd31 	bl	c0de6afe <OUTLINED_FUNCTION_38>
c0de509c:	f841 4022 	str.w	r4, [r1, r2, lsl #2]
c0de50a0:	2102      	movs	r1, #2
c0de50a2:	75a1      	strb	r1, [r4, #22]
c0de50a4:	f8bb 100c 	ldrh.w	r1, [fp, #12]
c0de50a8:	75e1      	strb	r1, [r4, #23]
c0de50aa:	0a09      	lsrs	r1, r1, #8
c0de50ac:	f8bb 3020 	ldrh.w	r3, [fp, #32]
c0de50b0:	f8bb 500e 	ldrh.w	r5, [fp, #14]
c0de50b4:	7621      	strb	r1, [r4, #24]
c0de50b6:	1c51      	adds	r1, r2, #1
c0de50b8:	442b      	add	r3, r5
c0de50ba:	7663      	strb	r3, [r4, #25]
c0de50bc:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de50c0:	0a18      	lsrs	r0, r3, #8
c0de50c2:	76a0      	strb	r0, [r4, #26]
c0de50c4:	2000      	movs	r0, #0
c0de50c6:	f88a 00af 	strb.w	r0, [sl, #175]	@ 0xaf
c0de50ca:	f8db 0008 	ldr.w	r0, [fp, #8]
c0de50ce:	f8ca 00a4 	str.w	r0, [sl, #164]	@ 0xa4
c0de50d2:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de50d6:	f040 0104 	orr.w	r1, r0, #4
c0de50da:	08c0      	lsrs	r0, r0, #3
c0de50dc:	f88a 10ad 	strb.w	r1, [sl, #173]	@ 0xad
c0de50e0:	49b2      	ldr	r1, [pc, #712]	@ (c0de53ac <addContentCenter+0x3dc>)
c0de50e2:	4479      	add	r1, pc
c0de50e4:	9101      	str	r1, [sp, #4]
c0de50e6:	f8db 1008 	ldr.w	r1, [fp, #8]
c0de50ea:	88c9      	ldrh	r1, [r1, #6]
c0de50ec:	e9cd 1102 	strd	r1, r1, [sp, #8]
c0de50f0:	a901      	add	r1, sp, #4
c0de50f2:	f005 fc50 	bl	c0dea996 <nbgl_screenUpdateTicker>
c0de50f6:	4656      	mov	r6, sl
c0de50f8:	f8dd a000 	ldr.w	sl, [sp]
c0de50fc:	463c      	mov	r4, r7
c0de50fe:	e001      	b.n	c0de5104 <addContentCenter+0x134>
c0de5100:	f04f 0a00 	mov.w	sl, #0
c0de5104:	f8db 0010 	ldr.w	r0, [fp, #16]
c0de5108:	9600      	str	r6, [sp, #0]
c0de510a:	2800      	cmp	r0, #0
c0de510c:	d046      	beq.n	c0de519c <addContentCenter+0x1cc>
c0de510e:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de5112:	f001 fb19 	bl	c0de6748 <OUTLINED_FUNCTION_0>
c0de5116:	4607      	mov	r7, r0
c0de5118:	2000      	movs	r0, #0
c0de511a:	77f8      	strb	r0, [r7, #31]
c0de511c:	f8db 0010 	ldr.w	r0, [fp, #16]
c0de5120:	f005 fe24 	bl	c0dead6c <pic>
c0de5124:	f001 fd19 	bl	c0de6b5a <OUTLINED_FUNCTION_42>
c0de5128:	200d      	movs	r0, #13
c0de512a:	f001 fb2b 	bl	c0de6784 <OUTLINED_FUNCTION_3>
c0de512e:	f001 fdf8 	bl	c0de6d22 <OUTLINED_FUNCTION_78>
c0de5132:	71b8      	strb	r0, [r7, #6]
c0de5134:	0a01      	lsrs	r1, r0, #8
c0de5136:	f898 c020 	ldrb.w	ip, [r8, #32]
c0de513a:	71f9      	strb	r1, [r7, #7]
c0de513c:	f1bc 0f00 	cmp.w	ip, #0
c0de5140:	d010      	beq.n	c0de5164 <addContentCenter+0x194>
c0de5142:	463b      	mov	r3, r7
c0de5144:	0e22      	lsrs	r2, r4, #24
c0de5146:	f803 4f12 	strb.w	r4, [r3, #18]!
c0de514a:	70da      	strb	r2, [r3, #3]
c0de514c:	0c22      	lsrs	r2, r4, #16
c0de514e:	709a      	strb	r2, [r3, #2]
c0de5150:	0a22      	lsrs	r2, r4, #8
c0de5152:	705a      	strb	r2, [r3, #1]
c0de5154:	f8bb 2020 	ldrh.w	r2, [fp, #32]
c0de5158:	3218      	adds	r2, #24
c0de515a:	0a14      	lsrs	r4, r2, #8
c0de515c:	71da      	strb	r2, [r3, #7]
c0de515e:	721c      	strb	r4, [r3, #8]
c0de5160:	2308      	movs	r3, #8
c0de5162:	e004      	b.n	c0de516e <addContentCenter+0x19e>
c0de5164:	7e7a      	ldrb	r2, [r7, #25]
c0de5166:	7ebb      	ldrb	r3, [r7, #26]
c0de5168:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de516c:	2302      	movs	r3, #2
c0de516e:	75bb      	strb	r3, [r7, #22]
c0de5170:	4643      	mov	r3, r8
c0de5172:	4450      	add	r0, sl
c0de5174:	f813 4f22 	ldrb.w	r4, [r3, #34]!
c0de5178:	eb00 0a02 	add.w	sl, r0, r2
c0de517c:	785d      	ldrb	r5, [r3, #1]
c0de517e:	789e      	ldrb	r6, [r3, #2]
c0de5180:	78d9      	ldrb	r1, [r3, #3]
c0de5182:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de5186:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de518a:	9e00      	ldr	r6, [sp, #0]
c0de518c:	ea44 4101 	orr.w	r1, r4, r1, lsl #16
c0de5190:	f841 702c 	str.w	r7, [r1, ip, lsl #2]
c0de5194:	f10c 0101 	add.w	r1, ip, #1
c0de5198:	f803 1c02 	strb.w	r1, [r3, #-2]
c0de519c:	f8db 0014 	ldr.w	r0, [fp, #20]
c0de51a0:	2800      	cmp	r0, #0
c0de51a2:	d049      	beq.n	c0de5238 <addContentCenter+0x268>
c0de51a4:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de51a8:	f001 face 	bl	c0de6748 <OUTLINED_FUNCTION_0>
c0de51ac:	4607      	mov	r7, r0
c0de51ae:	2000      	movs	r0, #0
c0de51b0:	77f8      	strb	r0, [r7, #31]
c0de51b2:	f8db 0014 	ldr.w	r0, [fp, #20]
c0de51b6:	f005 fdd9 	bl	c0dead6c <pic>
c0de51ba:	f001 fcce 	bl	c0de6b5a <OUTLINED_FUNCTION_42>
c0de51be:	200c      	movs	r0, #12
c0de51c0:	f001 fae0 	bl	c0de6784 <OUTLINED_FUNCTION_3>
c0de51c4:	200c      	movs	r0, #12
c0de51c6:	f005 fc09 	bl	c0dea9dc <nbgl_getTextHeightInWidth>
c0de51ca:	f001 fce4 	bl	c0de6b96 <OUTLINED_FUNCTION_46>
c0de51ce:	d028      	beq.n	c0de5222 <addContentCenter+0x252>
c0de51d0:	4642      	mov	r2, r8
c0de51d2:	f04f 0c00 	mov.w	ip, #0
c0de51d6:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de51da:	7855      	ldrb	r5, [r2, #1]
c0de51dc:	7896      	ldrb	r6, [r2, #2]
c0de51de:	78d2      	ldrb	r2, [r2, #3]
c0de51e0:	ea46 2202 	orr.w	r2, r6, r2, lsl #8
c0de51e4:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0de51e8:	463e      	mov	r6, r7
c0de51ea:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de51ee:	eb02 0381 	add.w	r3, r2, r1, lsl #2
c0de51f2:	f853 5c04 	ldr.w	r5, [r3, #-4]
c0de51f6:	f806 5f12 	strb.w	r5, [r6, #18]!
c0de51fa:	0e2c      	lsrs	r4, r5, #24
c0de51fc:	70f4      	strb	r4, [r6, #3]
c0de51fe:	0c2c      	lsrs	r4, r5, #16
c0de5200:	f886 c008 	strb.w	ip, [r6, #8]
c0de5204:	70b4      	strb	r4, [r6, #2]
c0de5206:	0a2c      	lsrs	r4, r5, #8
c0de5208:	7074      	strb	r4, [r6, #1]
c0de520a:	2418      	movs	r4, #24
c0de520c:	71f4      	strb	r4, [r6, #7]
c0de520e:	2408      	movs	r4, #8
c0de5210:	f853 3c04 	ldr.w	r3, [r3, #-4]
c0de5214:	7134      	strb	r4, [r6, #4]
c0de5216:	7edb      	ldrb	r3, [r3, #27]
c0de5218:	2b02      	cmp	r3, #2
c0de521a:	d105      	bne.n	c0de5228 <addContentCenter+0x258>
c0de521c:	f001 fd5b 	bl	c0de6cd6 <OUTLINED_FUNCTION_71>
c0de5220:	e006      	b.n	c0de5230 <addContentCenter+0x260>
c0de5222:	f001 fa9b 	bl	c0de675c <OUTLINED_FUNCTION_2>
c0de5226:	e005      	b.n	c0de5234 <addContentCenter+0x264>
c0de5228:	2300      	movs	r3, #0
c0de522a:	76bb      	strb	r3, [r7, #26]
c0de522c:	2310      	movs	r3, #16
c0de522e:	767b      	strb	r3, [r7, #25]
c0de5230:	9e00      	ldr	r6, [sp, #0]
c0de5232:	460c      	mov	r4, r1
c0de5234:	f001 fbfb 	bl	c0de6a2e <OUTLINED_FUNCTION_29>
c0de5238:	f8db 0018 	ldr.w	r0, [fp, #24]
c0de523c:	b3b8      	cbz	r0, c0de52ae <addContentCenter+0x2de>
c0de523e:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de5242:	f001 fa81 	bl	c0de6748 <OUTLINED_FUNCTION_0>
c0de5246:	4607      	mov	r7, r0
c0de5248:	2000      	movs	r0, #0
c0de524a:	77f8      	strb	r0, [r7, #31]
c0de524c:	f8db 0018 	ldr.w	r0, [fp, #24]
c0de5250:	f005 fd8c 	bl	c0dead6c <pic>
c0de5254:	f001 fc81 	bl	c0de6b5a <OUTLINED_FUNCTION_42>
c0de5258:	200b      	movs	r0, #11
c0de525a:	f001 fa93 	bl	c0de6784 <OUTLINED_FUNCTION_3>
c0de525e:	f001 fc84 	bl	c0de6b6a <OUTLINED_FUNCTION_43>
c0de5262:	f001 fc98 	bl	c0de6b96 <OUTLINED_FUNCTION_46>
c0de5266:	d019      	beq.n	c0de529c <addContentCenter+0x2cc>
c0de5268:	f001 fc3b 	bl	c0de6ae2 <OUTLINED_FUNCTION_37>
c0de526c:	eb02 0381 	add.w	r3, r2, r1, lsl #2
c0de5270:	f853 4c04 	ldr.w	r4, [r3, #-4]
c0de5274:	f805 4f12 	strb.w	r4, [r5, #18]!
c0de5278:	0e26      	lsrs	r6, r4, #24
c0de527a:	70ee      	strb	r6, [r5, #3]
c0de527c:	0c26      	lsrs	r6, r4, #16
c0de527e:	0a24      	lsrs	r4, r4, #8
c0de5280:	706c      	strb	r4, [r5, #1]
c0de5282:	70ae      	strb	r6, [r5, #2]
c0de5284:	2408      	movs	r4, #8
c0de5286:	f853 3c04 	ldr.w	r3, [r3, #-4]
c0de528a:	712c      	strb	r4, [r5, #4]
c0de528c:	7edb      	ldrb	r3, [r3, #27]
c0de528e:	2b04      	cmp	r3, #4
c0de5290:	d107      	bne.n	c0de52a2 <addContentCenter+0x2d2>
c0de5292:	2300      	movs	r3, #0
c0de5294:	76bb      	strb	r3, [r7, #26]
c0de5296:	2310      	movs	r3, #16
c0de5298:	767b      	strb	r3, [r7, #25]
c0de529a:	e004      	b.n	c0de52a6 <addContentCenter+0x2d6>
c0de529c:	f001 fa5e 	bl	c0de675c <OUTLINED_FUNCTION_2>
c0de52a0:	e003      	b.n	c0de52aa <addContentCenter+0x2da>
c0de52a2:	f001 fd18 	bl	c0de6cd6 <OUTLINED_FUNCTION_71>
c0de52a6:	9e00      	ldr	r6, [sp, #0]
c0de52a8:	460c      	mov	r4, r1
c0de52aa:	f001 fbc0 	bl	c0de6a2e <OUTLINED_FUNCTION_29>
c0de52ae:	f8db 001c 	ldr.w	r0, [fp, #28]
c0de52b2:	2800      	cmp	r0, #0
c0de52b4:	d04f      	beq.n	c0de5356 <addContentCenter+0x386>
c0de52b6:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de52ba:	f001 fa45 	bl	c0de6748 <OUTLINED_FUNCTION_0>
c0de52be:	2401      	movs	r4, #1
c0de52c0:	4607      	mov	r7, r0
c0de52c2:	77c4      	strb	r4, [r0, #31]
c0de52c4:	f8db 001c 	ldr.w	r0, [fp, #28]
c0de52c8:	f005 fd50 	bl	c0dead6c <pic>
c0de52cc:	4601      	mov	r1, r0
c0de52ce:	20a0      	movs	r0, #160	@ 0xa0
c0de52d0:	2301      	movs	r3, #1
c0de52d2:	717c      	strb	r4, [r7, #5]
c0de52d4:	f887 4024 	strb.w	r4, [r7, #36]	@ 0x24
c0de52d8:	7138      	strb	r0, [r7, #4]
c0de52da:	200b      	movs	r0, #11
c0de52dc:	0e0a      	lsrs	r2, r1, #24
c0de52de:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de52e2:	2005      	movs	r0, #5
c0de52e4:	f887 0020 	strb.w	r0, [r7, #32]
c0de52e8:	4638      	mov	r0, r7
c0de52ea:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de52ee:	70c2      	strb	r2, [r0, #3]
c0de52f0:	0c0a      	lsrs	r2, r1, #16
c0de52f2:	7082      	strb	r2, [r0, #2]
c0de52f4:	0a08      	lsrs	r0, r1, #8
c0de52f6:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de52fa:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de52fe:	f001 fc34 	bl	c0de6b6a <OUTLINED_FUNCTION_43>
c0de5302:	3010      	adds	r0, #16
c0de5304:	f001 fc47 	bl	c0de6b96 <OUTLINED_FUNCTION_46>
c0de5308:	d021      	beq.n	c0de534e <addContentCenter+0x37e>
c0de530a:	f001 fbea 	bl	c0de6ae2 <OUTLINED_FUNCTION_37>
c0de530e:	eb02 0481 	add.w	r4, r2, r1, lsl #2
c0de5312:	f854 3c04 	ldr.w	r3, [r4, #-4]
c0de5316:	f805 3f12 	strb.w	r3, [r5, #18]!
c0de531a:	0e1e      	lsrs	r6, r3, #24
c0de531c:	70ee      	strb	r6, [r5, #3]
c0de531e:	0c1e      	lsrs	r6, r3, #16
c0de5320:	0a1b      	lsrs	r3, r3, #8
c0de5322:	706b      	strb	r3, [r5, #1]
c0de5324:	2300      	movs	r3, #0
c0de5326:	70ae      	strb	r6, [r5, #2]
c0de5328:	2608      	movs	r6, #8
c0de532a:	722b      	strb	r3, [r5, #8]
c0de532c:	2310      	movs	r3, #16
c0de532e:	712e      	strb	r6, [r5, #4]
c0de5330:	71eb      	strb	r3, [r5, #7]
c0de5332:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de5336:	7ee4      	ldrb	r4, [r4, #27]
c0de5338:	2c02      	cmp	r4, #2
c0de533a:	d105      	bne.n	c0de5348 <addContentCenter+0x378>
c0de533c:	f8bb 3020 	ldrh.w	r3, [fp, #32]
c0de5340:	3310      	adds	r3, #16
c0de5342:	0a1c      	lsrs	r4, r3, #8
c0de5344:	767b      	strb	r3, [r7, #25]
c0de5346:	76bc      	strb	r4, [r7, #26]
c0de5348:	9e00      	ldr	r6, [sp, #0]
c0de534a:	460c      	mov	r4, r1
c0de534c:	e001      	b.n	c0de5352 <addContentCenter+0x382>
c0de534e:	f001 fa05 	bl	c0de675c <OUTLINED_FUNCTION_2>
c0de5352:	f001 fb6c 	bl	c0de6a2e <OUTLINED_FUNCTION_29>
c0de5356:	2001      	movs	r0, #1
c0de5358:	f888 a006 	strb.w	sl, [r8, #6]
c0de535c:	f888 0005 	strb.w	r0, [r8, #5]
c0de5360:	20a0      	movs	r0, #160	@ 0xa0
c0de5362:	f888 0004 	strb.w	r0, [r8, #4]
c0de5366:	2005      	movs	r0, #5
c0de5368:	f888 0016 	strb.w	r0, [r8, #22]
c0de536c:	2000      	movs	r0, #0
c0de536e:	f888 001f 	strb.w	r0, [r8, #31]
c0de5372:	ea4f 201a 	mov.w	r0, sl, lsr #8
c0de5376:	f888 0007 	strb.w	r0, [r8, #7]
c0de537a:	f89b 0022 	ldrb.w	r0, [fp, #34]	@ 0x22
c0de537e:	b130      	cbz	r0, c0de538e <addContentCenter+0x3be>
c0de5380:	f10a 0028 	add.w	r0, sl, #40	@ 0x28
c0de5384:	f888 0006 	strb.w	r0, [r8, #6]
c0de5388:	0a00      	lsrs	r0, r0, #8
c0de538a:	f888 0007 	strb.w	r0, [r8, #7]
c0de538e:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de5392:	f001 fa6c 	bl	c0de686e <OUTLINED_FUNCTION_10>
c0de5396:	f840 8022 	str.w	r8, [r0, r2, lsl #2]
c0de539a:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de539e:	f001 f9d7 	bl	c0de6750 <OUTLINED_FUNCTION_1>
c0de53a2:	4640      	mov	r0, r8
c0de53a4:	b004      	add	sp, #16
c0de53a6:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de53aa:	bf00      	nop
c0de53ac:	0000155f 	.word	0x0000155f

c0de53b0 <nbgl_layoutAddContentCenter>:
c0de53b0:	b128      	cbz	r0, c0de53be <nbgl_layoutAddContentCenter+0xe>
c0de53b2:	b580      	push	{r7, lr}
c0de53b4:	f7ff fe0c 	bl	c0de4fd0 <addContentCenter>
c0de53b8:	f001 fc2d 	bl	c0de6c16 <OUTLINED_FUNCTION_55>
c0de53bc:	bd80      	pop	{r7, pc}
c0de53be:	f001 bb7f 	b.w	c0de6ac0 <OUTLINED_FUNCTION_35>

c0de53c2 <nbgl_layoutAddQRCode>:
c0de53c2:	2800      	cmp	r0, #0
c0de53c4:	f000 8116 	beq.w	c0de55f4 <nbgl_layoutAddQRCode+0x232>
c0de53c8:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de53cc:	4606      	mov	r6, r0
c0de53ce:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de53d2:	460f      	mov	r7, r1
c0de53d4:	f001 faa1 	bl	c0de691a <OUTLINED_FUNCTION_16>
c0de53d8:	4682      	mov	sl, r0
c0de53da:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de53de:	08c1      	lsrs	r1, r0, #3
c0de53e0:	2003      	movs	r0, #3
c0de53e2:	f005 fae7 	bl	c0dea9b4 <nbgl_containerPoolGet>
c0de53e6:	4654      	mov	r4, sl
c0de53e8:	0e01      	lsrs	r1, r0, #24
c0de53ea:	f04f 0b00 	mov.w	fp, #0
c0de53ee:	f804 0f22 	strb.w	r0, [r4, #34]!
c0de53f2:	f88a b020 	strb.w	fp, [sl, #32]
c0de53f6:	70e1      	strb	r1, [r4, #3]
c0de53f8:	0c01      	lsrs	r1, r0, #16
c0de53fa:	0a00      	lsrs	r0, r0, #8
c0de53fc:	70a1      	strb	r1, [r4, #2]
c0de53fe:	f88a 0023 	strb.w	r0, [sl, #35]	@ 0x23
c0de5402:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de5406:	08c1      	lsrs	r1, r0, #3
c0de5408:	200a      	movs	r0, #10
c0de540a:	f005 face 	bl	c0dea9aa <nbgl_objPoolGet>
c0de540e:	4680      	mov	r8, r0
c0de5410:	6838      	ldr	r0, [r7, #0]
c0de5412:	f005 fcab 	bl	c0dead6c <pic>
c0de5416:	f005 ff37 	bl	c0deb288 <strlen>
c0de541a:	283e      	cmp	r0, #62	@ 0x3e
c0de541c:	f04f 0000 	mov.w	r0, #0
c0de5420:	4645      	mov	r5, r8
c0de5422:	bf88      	it	hi
c0de5424:	2001      	movhi	r0, #1
c0de5426:	f888 0020 	strb.w	r0, [r8, #32]
c0de542a:	f888 b01f 	strb.w	fp, [r8, #31]
c0de542e:	f44f 7084 	mov.w	r0, #264	@ 0x108
c0de5432:	bf88      	it	hi
c0de5434:	20e4      	movhi	r0, #228	@ 0xe4
c0de5436:	f888 0004 	strb.w	r0, [r8, #4]
c0de543a:	f805 0f06 	strb.w	r0, [r5, #6]!
c0de543e:	0a00      	lsrs	r0, r0, #8
c0de5440:	7068      	strb	r0, [r5, #1]
c0de5442:	f888 0005 	strb.w	r0, [r8, #5]
c0de5446:	6838      	ldr	r0, [r7, #0]
c0de5448:	f005 fc90 	bl	c0dead6c <pic>
c0de544c:	4641      	mov	r1, r8
c0de544e:	0e02      	lsrs	r2, r0, #24
c0de5450:	f888 b009 	strb.w	fp, [r8, #9]
c0de5454:	9601      	str	r6, [sp, #4]
c0de5456:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de545a:	f001 fba3 	bl	c0de6ba4 <OUTLINED_FUNCTION_47>
c0de545e:	f888 0022 	strb.w	r0, [r8, #34]	@ 0x22
c0de5462:	7820      	ldrb	r0, [r4, #0]
c0de5464:	78a1      	ldrb	r1, [r4, #2]
c0de5466:	78e2      	ldrb	r2, [r4, #3]
c0de5468:	f89a 4023 	ldrb.w	r4, [sl, #35]	@ 0x23
c0de546c:	f89a 3020 	ldrb.w	r3, [sl, #32]
c0de5470:	ea40 2004 	orr.w	r0, r0, r4, lsl #8
c0de5474:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de5478:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de547c:	7869      	ldrb	r1, [r5, #1]
c0de547e:	f840 8023 	str.w	r8, [r0, r3, lsl #2]
c0de5482:	2002      	movs	r0, #2
c0de5484:	f888 0016 	strb.w	r0, [r8, #22]
c0de5488:	1c58      	adds	r0, r3, #1
c0de548a:	f88a 0020 	strb.w	r0, [sl, #32]
c0de548e:	7828      	ldrb	r0, [r5, #0]
c0de5490:	ea40 2b01 	orr.w	fp, r0, r1, lsl #8
c0de5494:	6878      	ldr	r0, [r7, #4]
c0de5496:	2800      	cmp	r0, #0
c0de5498:	d053      	beq.n	c0de5542 <nbgl_layoutAddQRCode+0x180>
c0de549a:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de549e:	f001 f953 	bl	c0de6748 <OUTLINED_FUNCTION_0>
c0de54a2:	4605      	mov	r5, r0
c0de54a4:	2000      	movs	r0, #0
c0de54a6:	77e8      	strb	r0, [r5, #31]
c0de54a8:	6878      	ldr	r0, [r7, #4]
c0de54aa:	f005 fc5f 	bl	c0dead6c <pic>
c0de54ae:	4601      	mov	r1, r0
c0de54b0:	20a0      	movs	r0, #160	@ 0xa0
c0de54b2:	2201      	movs	r2, #1
c0de54b4:	7128      	strb	r0, [r5, #4]
c0de54b6:	2005      	movs	r0, #5
c0de54b8:	716a      	strb	r2, [r5, #5]
c0de54ba:	f885 2024 	strb.w	r2, [r5, #36]	@ 0x24
c0de54be:	0e0a      	lsrs	r2, r1, #24
c0de54c0:	f885 0020 	strb.w	r0, [r5, #32]
c0de54c4:	4628      	mov	r0, r5
c0de54c6:	f001 fa02 	bl	c0de68ce <OUTLINED_FUNCTION_13>
c0de54ca:	f885 0027 	strb.w	r0, [r5, #39]	@ 0x27
c0de54ce:	200d      	movs	r0, #13
c0de54d0:	7bfa      	ldrb	r2, [r7, #15]
c0de54d2:	2a00      	cmp	r2, #0
c0de54d4:	bf08      	it	eq
c0de54d6:	200b      	moveq	r0, #11
c0de54d8:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de54dc:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de54e0:	2301      	movs	r3, #1
c0de54e2:	f005 fa7b 	bl	c0dea9dc <nbgl_getTextHeightInWidth>
c0de54e6:	4651      	mov	r1, sl
c0de54e8:	46be      	mov	lr, r7
c0de54ea:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de54ee:	784c      	ldrb	r4, [r1, #1]
c0de54f0:	788a      	ldrb	r2, [r1, #2]
c0de54f2:	78cf      	ldrb	r7, [r1, #3]
c0de54f4:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de54f8:	ea42 2207 	orr.w	r2, r2, r7, lsl #8
c0de54fc:	ea4c 2404 	orr.w	r4, ip, r4, lsl #8
c0de5500:	462f      	mov	r7, r5
c0de5502:	ea44 4202 	orr.w	r2, r4, r2, lsl #16
c0de5506:	eb02 0483 	add.w	r4, r2, r3, lsl #2
c0de550a:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de550e:	f807 4f12 	strb.w	r4, [r7, #18]!
c0de5512:	0e26      	lsrs	r6, r4, #24
c0de5514:	70fe      	strb	r6, [r7, #3]
c0de5516:	0c26      	lsrs	r6, r4, #16
c0de5518:	0a24      	lsrs	r4, r4, #8
c0de551a:	70be      	strb	r6, [r7, #2]
c0de551c:	74ec      	strb	r4, [r5, #19]
c0de551e:	f842 5023 	str.w	r5, [r2, r3, lsl #2]
c0de5522:	2200      	movs	r2, #0
c0de5524:	71a8      	strb	r0, [r5, #6]
c0de5526:	4677      	mov	r7, lr
c0de5528:	76aa      	strb	r2, [r5, #26]
c0de552a:	2218      	movs	r2, #24
c0de552c:	766a      	strb	r2, [r5, #25]
c0de552e:	2208      	movs	r2, #8
c0de5530:	75aa      	strb	r2, [r5, #22]
c0de5532:	0a02      	lsrs	r2, r0, #8
c0de5534:	4458      	add	r0, fp
c0de5536:	71ea      	strb	r2, [r5, #7]
c0de5538:	1c5a      	adds	r2, r3, #1
c0de553a:	f100 0b18 	add.w	fp, r0, #24
c0de553e:	f801 2c02 	strb.w	r2, [r1, #-2]
c0de5542:	68b8      	ldr	r0, [r7, #8]
c0de5544:	9700      	str	r7, [sp, #0]
c0de5546:	2800      	cmp	r0, #0
c0de5548:	d056      	beq.n	c0de55f8 <nbgl_layoutAddQRCode+0x236>
c0de554a:	9801      	ldr	r0, [sp, #4]
c0de554c:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de5550:	f001 f8fa 	bl	c0de6748 <OUTLINED_FUNCTION_0>
c0de5554:	2401      	movs	r4, #1
c0de5556:	4605      	mov	r5, r0
c0de5558:	77c4      	strb	r4, [r0, #31]
c0de555a:	68b8      	ldr	r0, [r7, #8]
c0de555c:	f005 fc06 	bl	c0dead6c <pic>
c0de5560:	4601      	mov	r1, r0
c0de5562:	20a0      	movs	r0, #160	@ 0xa0
c0de5564:	2301      	movs	r3, #1
c0de5566:	716c      	strb	r4, [r5, #5]
c0de5568:	f885 4024 	strb.w	r4, [r5, #36]	@ 0x24
c0de556c:	7128      	strb	r0, [r5, #4]
c0de556e:	200b      	movs	r0, #11
c0de5570:	0e0a      	lsrs	r2, r1, #24
c0de5572:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de5576:	2005      	movs	r0, #5
c0de5578:	f885 0020 	strb.w	r0, [r5, #32]
c0de557c:	4628      	mov	r0, r5
c0de557e:	f001 f924 	bl	c0de67ca <OUTLINED_FUNCTION_5>
c0de5582:	4651      	mov	r1, sl
c0de5584:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de5588:	784b      	ldrb	r3, [r1, #1]
c0de558a:	788e      	ldrb	r6, [r1, #2]
c0de558c:	78cc      	ldrb	r4, [r1, #3]
c0de558e:	f811 2c02 	ldrb.w	r2, [r1, #-2]
c0de5592:	ea4c 2303 	orr.w	r3, ip, r3, lsl #8
c0de5596:	ea46 2404 	orr.w	r4, r6, r4, lsl #8
c0de559a:	f8d7 c004 	ldr.w	ip, [r7, #4]
c0de559e:	2700      	movs	r7, #0
c0de55a0:	462e      	mov	r6, r5
c0de55a2:	ea43 4e04 	orr.w	lr, r3, r4, lsl #16
c0de55a6:	eb0e 0482 	add.w	r4, lr, r2, lsl #2
c0de55aa:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de55ae:	76af      	strb	r7, [r5, #26]
c0de55b0:	271c      	movs	r7, #28
c0de55b2:	f1bc 0f00 	cmp.w	ip, #0
c0de55b6:	bf08      	it	eq
c0de55b8:	2720      	moveq	r7, #32
c0de55ba:	766f      	strb	r7, [r5, #25]
c0de55bc:	f806 4f12 	strb.w	r4, [r6, #18]!
c0de55c0:	0e23      	lsrs	r3, r4, #24
c0de55c2:	70f3      	strb	r3, [r6, #3]
c0de55c4:	0c23      	lsrs	r3, r4, #16
c0de55c6:	70b3      	strb	r3, [r6, #2]
c0de55c8:	0a23      	lsrs	r3, r4, #8
c0de55ca:	9e01      	ldr	r6, [sp, #4]
c0de55cc:	74eb      	strb	r3, [r5, #19]
c0de55ce:	2308      	movs	r3, #8
c0de55d0:	f84e 5022 	str.w	r5, [lr, r2, lsl #2]
c0de55d4:	3201      	adds	r2, #1
c0de55d6:	71a8      	strb	r0, [r5, #6]
c0de55d8:	75ab      	strb	r3, [r5, #22]
c0de55da:	0a03      	lsrs	r3, r0, #8
c0de55dc:	f801 2c02 	strb.w	r2, [r1, #-2]
c0de55e0:	71eb      	strb	r3, [r5, #7]
c0de55e2:	f1bc 0f00 	cmp.w	ip, #0
c0de55e6:	bf08      	it	eq
c0de55e8:	f10b 0b08 	addeq.w	fp, fp, #8
c0de55ec:	4458      	add	r0, fp
c0de55ee:	eb00 0b07 	add.w	fp, r0, r7
c0de55f2:	e002      	b.n	c0de55fa <nbgl_layoutAddQRCode+0x238>
c0de55f4:	f001 ba64 	b.w	c0de6ac0 <OUTLINED_FUNCTION_35>
c0de55f8:	9e01      	ldr	r6, [sp, #4]
c0de55fa:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de55fe:	fa1f f18b 	uxth.w	r1, fp
c0de5602:	7982      	ldrb	r2, [r0, #6]
c0de5604:	79c3      	ldrb	r3, [r0, #7]
c0de5606:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de560a:	3a10      	subs	r2, #16
c0de560c:	428a      	cmp	r2, r1
c0de560e:	dd01      	ble.n	c0de5614 <nbgl_layoutAddQRCode+0x252>
c0de5610:	9d00      	ldr	r5, [sp, #0]
c0de5612:	e012      	b.n	c0de563a <nbgl_layoutAddQRCode+0x278>
c0de5614:	f898 1020 	ldrb.w	r1, [r8, #32]
c0de5618:	9d00      	ldr	r5, [sp, #0]
c0de561a:	b971      	cbnz	r1, c0de563a <nbgl_layoutAddQRCode+0x278>
c0de561c:	2100      	movs	r1, #0
c0de561e:	2284      	movs	r2, #132	@ 0x84
c0de5620:	f1ab 0b84 	sub.w	fp, fp, #132	@ 0x84
c0de5624:	f888 1007 	strb.w	r1, [r8, #7]
c0de5628:	f888 1005 	strb.w	r1, [r8, #5]
c0de562c:	2102      	movs	r1, #2
c0de562e:	f888 2006 	strb.w	r2, [r8, #6]
c0de5632:	f888 2004 	strb.w	r2, [r8, #4]
c0de5636:	f888 1020 	strb.w	r1, [r8, #32]
c0de563a:	2100      	movs	r1, #0
c0de563c:	f88a b006 	strb.w	fp, [sl, #6]
c0de5640:	f88a 101f 	strb.w	r1, [sl, #31]
c0de5644:	ea4f 211b 	mov.w	r1, fp, lsr #8
c0de5648:	f88a 1007 	strb.w	r1, [sl, #7]
c0de564c:	7ba9      	ldrb	r1, [r5, #14]
c0de564e:	b109      	cbz	r1, c0de5654 <nbgl_layoutAddQRCode+0x292>
c0de5650:	2005      	movs	r0, #5
c0de5652:	e00f      	b.n	c0de5674 <nbgl_layoutAddQRCode+0x2b2>
c0de5654:	f001 f90b 	bl	c0de686e <OUTLINED_FUNCTION_10>
c0de5658:	4651      	mov	r1, sl
c0de565a:	eb00 0082 	add.w	r0, r0, r2, lsl #2
c0de565e:	f850 0c04 	ldr.w	r0, [r0, #-4]
c0de5662:	f801 0f12 	strb.w	r0, [r1, #18]!
c0de5666:	0e02      	lsrs	r2, r0, #24
c0de5668:	70ca      	strb	r2, [r1, #3]
c0de566a:	0c02      	lsrs	r2, r0, #16
c0de566c:	0a00      	lsrs	r0, r0, #8
c0de566e:	7048      	strb	r0, [r1, #1]
c0de5670:	2008      	movs	r0, #8
c0de5672:	708a      	strb	r2, [r1, #2]
c0de5674:	f88a 0016 	strb.w	r0, [sl, #22]
c0de5678:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de567c:	f001 f9be 	bl	c0de69fc <OUTLINED_FUNCTION_27>
c0de5680:	2001      	movs	r0, #1
c0de5682:	f88a 0005 	strb.w	r0, [sl, #5]
c0de5686:	20a0      	movs	r0, #160	@ 0xa0
c0de5688:	f88a 0004 	strb.w	r0, [sl, #4]
c0de568c:	89a8      	ldrh	r0, [r5, #12]
c0de568e:	f88a 0019 	strb.w	r0, [sl, #25]
c0de5692:	0a00      	lsrs	r0, r0, #8
c0de5694:	f88a 001a 	strb.w	r0, [sl, #26]
c0de5698:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de569c:	f001 f858 	bl	c0de6750 <OUTLINED_FUNCTION_1>
c0de56a0:	fa1f f08b 	uxth.w	r0, fp
c0de56a4:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de56a8 <nbgl_layoutAddChoiceButtons>:
c0de56a8:	b510      	push	{r4, lr}
c0de56aa:	b086      	sub	sp, #24
c0de56ac:	2206      	movs	r2, #6
c0de56ae:	f10d 0c04 	add.w	ip, sp, #4
c0de56b2:	f8ad 2000 	strh.w	r2, [sp]
c0de56b6:	e891 001c 	ldmia.w	r1, {r2, r3, r4}
c0de56ba:	e8ac 001c 	stmia.w	ip!, {r2, r3, r4}
c0de56be:	898a      	ldrh	r2, [r1, #12]
c0de56c0:	7b89      	ldrb	r1, [r1, #14]
c0de56c2:	f88d 1012 	strb.w	r1, [sp, #18]
c0de56c6:	4669      	mov	r1, sp
c0de56c8:	f8ad 2010 	strh.w	r2, [sp, #16]
c0de56cc:	f7fe fb40 	bl	c0de3d50 <nbgl_layoutAddExtendedFooter>
c0de56d0:	b006      	add	sp, #24
c0de56d2:	bd10      	pop	{r4, pc}

c0de56d4 <nbgl_layoutAddHorizontalButtons>:
c0de56d4:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de56d6:	2202      	movs	r2, #2
c0de56d8:	f88d 2004 	strb.w	r2, [sp, #4]
c0de56dc:	e9d1 2300 	ldrd	r2, r3, [r1]
c0de56e0:	e9cd 2302 	strd	r2, r3, [sp, #8]
c0de56e4:	890a      	ldrh	r2, [r1, #8]
c0de56e6:	7a89      	ldrb	r1, [r1, #10]
c0de56e8:	f8ad 2010 	strh.w	r2, [sp, #16]
c0de56ec:	f88d 1012 	strb.w	r1, [sp, #18]
c0de56f0:	a901      	add	r1, sp, #4
c0de56f2:	f7fd ff85 	bl	c0de3600 <nbgl_layoutAddUpFooter>
c0de56f6:	b006      	add	sp, #24
c0de56f8:	bd80      	pop	{r7, pc}
	...

c0de56fc <nbgl_layoutAddTagValueList>:
c0de56fc:	2800      	cmp	r0, #0
c0de56fe:	f000 818a 	beq.w	c0de5a16 <nbgl_layoutAddTagValueList+0x31a>
c0de5702:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de5706:	b088      	sub	sp, #32
c0de5708:	4680      	mov	r8, r0
c0de570a:	48c4      	ldr	r0, [pc, #784]	@ (c0de5a1c <nbgl_layoutAddTagValueList+0x320>)
c0de570c:	460c      	mov	r4, r1
c0de570e:	2100      	movs	r1, #0
c0de5710:	f04f 0b00 	mov.w	fp, #0
c0de5714:	f8cd 8004 	str.w	r8, [sp, #4]
c0de5718:	9406      	str	r4, [sp, #24]
c0de571a:	4478      	add	r0, pc
c0de571c:	9000      	str	r0, [sp, #0]
c0de571e:	7a20      	ldrb	r0, [r4, #8]
c0de5720:	4583      	cmp	fp, r0
c0de5722:	f080 8174 	bcs.w	c0de5a0e <nbgl_layoutAddTagValueList+0x312>
c0de5726:	6820      	ldr	r0, [r4, #0]
c0de5728:	e9cd b104 	strd	fp, r1, [sp, #16]
c0de572c:	b110      	cbz	r0, c0de5734 <nbgl_layoutAddTagValueList+0x38>
c0de572e:	eb00 0b01 	add.w	fp, r0, r1
c0de5732:	e005      	b.n	c0de5740 <nbgl_layoutAddTagValueList+0x44>
c0de5734:	7a60      	ldrb	r0, [r4, #9]
c0de5736:	6861      	ldr	r1, [r4, #4]
c0de5738:	4458      	add	r0, fp
c0de573a:	b2c0      	uxtb	r0, r0
c0de573c:	4788      	blx	r1
c0de573e:	4683      	mov	fp, r0
c0de5740:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de5744:	9c00      	ldr	r4, [sp, #0]
c0de5746:	08c1      	lsrs	r1, r0, #3
c0de5748:	2001      	movs	r0, #1
c0de574a:	47a0      	blx	r4
c0de574c:	4682      	mov	sl, r0
c0de574e:	f8db 0008 	ldr.w	r0, [fp, #8]
c0de5752:	2800      	cmp	r0, #0
c0de5754:	f04f 0003 	mov.w	r0, #3
c0de5758:	bf08      	it	eq
c0de575a:	2002      	moveq	r0, #2
c0de575c:	f898 10ad 	ldrb.w	r1, [r8, #173]	@ 0xad
c0de5760:	f001 face 	bl	c0de6d00 <OUTLINED_FUNCTION_74>
c0de5764:	4656      	mov	r6, sl
c0de5766:	0e01      	lsrs	r1, r0, #24
c0de5768:	f806 0f22 	strb.w	r0, [r6, #34]!
c0de576c:	f001 fa75 	bl	c0de6c5a <OUTLINED_FUNCTION_60>
c0de5770:	f88a 0023 	strb.w	r0, [sl, #35]	@ 0x23
c0de5774:	f001 fadc 	bl	c0de6d30 <OUTLINED_FUNCTION_80>
c0de5778:	4605      	mov	r5, r0
c0de577a:	f001 fad9 	bl	c0de6d30 <OUTLINED_FUNCTION_80>
c0de577e:	4607      	mov	r7, r0
c0de5780:	f8db 0000 	ldr.w	r0, [fp]
c0de5784:	2401      	movs	r4, #1
c0de5786:	77ec      	strb	r4, [r5, #31]
c0de5788:	f005 faf0 	bl	c0dead6c <pic>
c0de578c:	4601      	mov	r1, r0
c0de578e:	20a0      	movs	r0, #160	@ 0xa0
c0de5790:	716c      	strb	r4, [r5, #5]
c0de5792:	f885 4024 	strb.w	r4, [r5, #36]	@ 0x24
c0de5796:	2404      	movs	r4, #4
c0de5798:	2301      	movs	r3, #1
c0de579a:	7128      	strb	r0, [r5, #4]
c0de579c:	200b      	movs	r0, #11
c0de579e:	0e0a      	lsrs	r2, r1, #24
c0de57a0:	f885 4020 	strb.w	r4, [r5, #32]
c0de57a4:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de57a8:	4628      	mov	r0, r5
c0de57aa:	f001 f80e 	bl	c0de67ca <OUTLINED_FUNCTION_5>
c0de57ae:	71a8      	strb	r0, [r5, #6]
c0de57b0:	9003      	str	r0, [sp, #12]
c0de57b2:	0a00      	lsrs	r0, r0, #8
c0de57b4:	f04f 0800 	mov.w	r8, #0
c0de57b8:	2109      	movs	r1, #9
c0de57ba:	71e8      	strb	r0, [r5, #7]
c0de57bc:	f105 0012 	add.w	r0, r5, #18
c0de57c0:	f885 8021 	strb.w	r8, [r5, #33]	@ 0x21
c0de57c4:	f005 fcf4 	bl	c0deb1b0 <__aeabi_memclr>
c0de57c8:	f89a 1023 	ldrb.w	r1, [sl, #35]	@ 0x23
c0de57cc:	7832      	ldrb	r2, [r6, #0]
c0de57ce:	78b3      	ldrb	r3, [r6, #2]
c0de57d0:	78f6      	ldrb	r6, [r6, #3]
c0de57d2:	f89a 0020 	ldrb.w	r0, [sl, #32]
c0de57d6:	f887 801f 	strb.w	r8, [r7, #31]
c0de57da:	f001 fa9b 	bl	c0de6d14 <OUTLINED_FUNCTION_76>
c0de57de:	f841 5020 	str.w	r5, [r1, r0, lsl #2]
c0de57e2:	3001      	adds	r0, #1
c0de57e4:	f88a 0020 	strb.w	r0, [sl, #32]
c0de57e8:	f8db 0004 	ldr.w	r0, [fp, #4]
c0de57ec:	f005 fabe 	bl	c0dead6c <pic>
c0de57f0:	4601      	mov	r1, r0
c0de57f2:	4638      	mov	r0, r7
c0de57f4:	f887 4020 	strb.w	r4, [r7, #32]
c0de57f8:	9c06      	ldr	r4, [sp, #24]
c0de57fa:	260c      	movs	r6, #12
c0de57fc:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de5800:	0e0a      	lsrs	r2, r1, #24
c0de5802:	f001 f9c1 	bl	c0de6b88 <OUTLINED_FUNCTION_45>
c0de5806:	7b20      	ldrb	r0, [r4, #12]
c0de5808:	2800      	cmp	r0, #0
c0de580a:	bf08      	it	eq
c0de580c:	260d      	moveq	r6, #13
c0de580e:	f887 6022 	strb.w	r6, [r7, #34]	@ 0x22
c0de5812:	f89b 200c 	ldrb.w	r2, [fp, #12]
c0de5816:	0752      	lsls	r2, r2, #29
c0de5818:	d417      	bmi.n	c0de584a <nbgl_layoutAddTagValueList+0x14e>
c0de581a:	f8db 2008 	ldr.w	r2, [fp, #8]
c0de581e:	2a00      	cmp	r2, #0
c0de5820:	f000 80f0 	beq.w	c0de5a04 <nbgl_layoutAddTagValueList+0x308>
c0de5824:	4610      	mov	r0, r2
c0de5826:	f005 faa1 	bl	c0dead6c <pic>
c0de582a:	4639      	mov	r1, r7
c0de582c:	f811 2f26 	ldrb.w	r2, [r1, #38]!
c0de5830:	784b      	ldrb	r3, [r1, #1]
c0de5832:	f811 6c04 	ldrb.w	r6, [r1, #-4]
c0de5836:	f891 c002 	ldrb.w	ip, [r1, #2]
c0de583a:	78c9      	ldrb	r1, [r1, #3]
c0de583c:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5840:	ea4c 2101 	orr.w	r1, ip, r1, lsl #8
c0de5844:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de5848:	e001      	b.n	c0de584e <nbgl_layoutAddTagValueList+0x152>
c0de584a:	4875      	ldr	r0, [pc, #468]	@ (c0de5a20 <nbgl_layoutAddTagValueList+0x324>)
c0de584c:	4478      	add	r0, pc
c0de584e:	7802      	ldrb	r2, [r0, #0]
c0de5850:	7843      	ldrb	r3, [r0, #1]
c0de5852:	4680      	mov	r8, r0
c0de5854:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5858:	f5c2 72ca 	rsb	r2, r2, #404	@ 0x194
c0de585c:	0a13      	lsrs	r3, r2, #8
c0de585e:	713a      	strb	r2, [r7, #4]
c0de5860:	b292      	uxth	r2, r2
c0de5862:	4630      	mov	r0, r6
c0de5864:	717b      	strb	r3, [r7, #5]
c0de5866:	7b63      	ldrb	r3, [r4, #13]
c0de5868:	f005 f8bd 	bl	c0dea9e6 <nbgl_getTextNbLinesInWidth>
c0de586c:	7aa1      	ldrb	r1, [r4, #10]
c0de586e:	46a3      	mov	fp, r4
c0de5870:	b121      	cbz	r1, c0de587c <nbgl_layoutAddTagValueList+0x180>
c0de5872:	4288      	cmp	r0, r1
c0de5874:	bf84      	itt	hi
c0de5876:	f887 1025 	strbhi.w	r1, [r7, #37]	@ 0x25
c0de587a:	4608      	movhi	r0, r1
c0de587c:	9007      	str	r0, [sp, #28]
c0de587e:	f897 0022 	ldrb.w	r0, [r7, #34]	@ 0x22
c0de5882:	f005 f89c 	bl	c0dea9be <nbgl_getFont>
c0de5886:	0a29      	lsrs	r1, r5, #8
c0de5888:	0e2a      	lsrs	r2, r5, #24
c0de588a:	46dc      	mov	ip, fp
c0de588c:	f04f 0e01 	mov.w	lr, #1
c0de5890:	74f9      	strb	r1, [r7, #19]
c0de5892:	4639      	mov	r1, r7
c0de5894:	f801 5f12 	strb.w	r5, [r1, #18]!
c0de5898:	70ca      	strb	r2, [r1, #3]
c0de589a:	0c2a      	lsrs	r2, r5, #16
c0de589c:	708a      	strb	r2, [r1, #2]
c0de589e:	4651      	mov	r1, sl
c0de58a0:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de58a4:	784d      	ldrb	r5, [r1, #1]
c0de58a6:	788e      	ldrb	r6, [r1, #2]
c0de58a8:	78cc      	ldrb	r4, [r1, #3]
c0de58aa:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de58ae:	ea46 2404 	orr.w	r4, r6, r4, lsl #8
c0de58b2:	ea42 2205 	orr.w	r2, r2, r5, lsl #8
c0de58b6:	2600      	movs	r6, #0
c0de58b8:	ea42 4204 	orr.w	r2, r2, r4, lsl #16
c0de58bc:	4644      	mov	r4, r8
c0de58be:	76be      	strb	r6, [r7, #26]
c0de58c0:	f887 6021 	strb.w	r6, [r7, #33]	@ 0x21
c0de58c4:	f842 7023 	str.w	r7, [r2, r3, lsl #2]
c0de58c8:	2204      	movs	r2, #4
c0de58ca:	767a      	strb	r2, [r7, #25]
c0de58cc:	2207      	movs	r2, #7
c0de58ce:	75ba      	strb	r2, [r7, #22]
c0de58d0:	f89b 200d 	ldrb.w	r2, [fp, #13]
c0de58d4:	79c5      	ldrb	r5, [r0, #7]
c0de58d6:	f8dd b010 	ldr.w	fp, [sp, #16]
c0de58da:	f887 2024 	strb.w	r2, [r7, #36]	@ 0x24
c0de58de:	9a07      	ldr	r2, [sp, #28]
c0de58e0:	fb02 f005 	mul.w	r0, r2, r5
c0de58e4:	71b8      	strb	r0, [r7, #6]
c0de58e6:	0a00      	lsrs	r0, r0, #8
c0de58e8:	71f8      	strb	r0, [r7, #7]
c0de58ea:	1c58      	adds	r0, r3, #1
c0de58ec:	f1b8 0f00 	cmp.w	r8, #0
c0de58f0:	f8dd 8004 	ldr.w	r8, [sp, #4]
c0de58f4:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de58f8:	d048      	beq.n	c0de598c <nbgl_layoutAddTagValueList+0x290>
c0de58fa:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de58fe:	f001 f83f 	bl	c0de6980 <OUTLINED_FUNCTION_21>
c0de5902:	9502      	str	r5, [sp, #8]
c0de5904:	4605      	mov	r5, r0
c0de5906:	9806      	ldr	r0, [sp, #24]
c0de5908:	4651      	mov	r1, sl
c0de590a:	2309      	movs	r3, #9
c0de590c:	7ac2      	ldrb	r2, [r0, #11]
c0de590e:	4640      	mov	r0, r8
c0de5910:	f7fd fbf8 	bl	c0de3104 <layoutAddCallbackObj>
c0de5914:	0a21      	lsrs	r1, r4, #8
c0de5916:	0e22      	lsrs	r2, r4, #24
c0de5918:	2600      	movs	r6, #0
c0de591a:	f04f 0e01 	mov.w	lr, #1
c0de591e:	f885 1022 	strb.w	r1, [r5, #34]	@ 0x22
c0de5922:	0a39      	lsrs	r1, r7, #8
c0de5924:	762e      	strb	r6, [r5, #24]
c0de5926:	77ee      	strb	r6, [r5, #31]
c0de5928:	74e9      	strb	r1, [r5, #19]
c0de592a:	4629      	mov	r1, r5
c0de592c:	f801 4f21 	strb.w	r4, [r1, #33]!
c0de5930:	70ca      	strb	r2, [r1, #3]
c0de5932:	0c22      	lsrs	r2, r4, #16
c0de5934:	708a      	strb	r2, [r1, #2]
c0de5936:	4629      	mov	r1, r5
c0de5938:	0e3a      	lsrs	r2, r7, #24
c0de593a:	4673      	mov	r3, lr
c0de593c:	f001 f9be 	bl	c0de6cbc <OUTLINED_FUNCTION_69>
c0de5940:	469e      	mov	lr, r3
c0de5942:	4651      	mov	r1, sl
c0de5944:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de5948:	784c      	ldrb	r4, [r1, #1]
c0de594a:	788f      	ldrb	r7, [r1, #2]
c0de594c:	78cb      	ldrb	r3, [r1, #3]
c0de594e:	f811 cc02 	ldrb.w	ip, [r1, #-2]
c0de5952:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de5956:	ea47 2403 	orr.w	r4, r7, r3, lsl #8
c0de595a:	ea42 4204 	orr.w	r2, r2, r4, lsl #16
c0de595e:	f842 502c 	str.w	r5, [r2, ip, lsl #2]
c0de5962:	220c      	movs	r2, #12
c0de5964:	75ea      	strb	r2, [r5, #23]
c0de5966:	f880 b005 	strb.w	fp, [r0, #5]
c0de596a:	f10b 000f 	add.w	r0, fp, #15
c0de596e:	75aa      	strb	r2, [r5, #22]
c0de5970:	9d02      	ldr	r5, [sp, #8]
c0de5972:	9a07      	ldr	r2, [sp, #28]
c0de5974:	f801 6c05 	strb.w	r6, [r1, #-5]
c0de5978:	f801 ec06 	strb.w	lr, [r1, #-6]
c0de597c:	f801 0c04 	strb.w	r0, [r1, #-4]
c0de5980:	f10c 0001 	add.w	r0, ip, #1
c0de5984:	f8dd c018 	ldr.w	ip, [sp, #24]
c0de5988:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de598c:	9803      	ldr	r0, [sp, #12]
c0de598e:	4659      	mov	r1, fp
c0de5990:	fb02 0005 	mla	r0, r2, r5, r0
c0de5994:	3004      	adds	r0, #4
c0de5996:	f1bb 0f00 	cmp.w	fp, #0
c0de599a:	bf18      	it	ne
c0de599c:	2118      	movne	r1, #24
c0de599e:	f88a 1019 	strb.w	r1, [sl, #25]
c0de59a2:	f88a e005 	strb.w	lr, [sl, #5]
c0de59a6:	f88a 6018 	strb.w	r6, [sl, #24]
c0de59aa:	f88a 601f 	strb.w	r6, [sl, #31]
c0de59ae:	f88a 6016 	strb.w	r6, [sl, #22]
c0de59b2:	f10b 0b01 	add.w	fp, fp, #1
c0de59b6:	0a09      	lsrs	r1, r1, #8
c0de59b8:	f88a 101a 	strb.w	r1, [sl, #26]
c0de59bc:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de59c0:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de59c4:	784c      	ldrb	r4, [r1, #1]
c0de59c6:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de59ca:	788d      	ldrb	r5, [r1, #2]
c0de59cc:	78c9      	ldrb	r1, [r1, #3]
c0de59ce:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de59d2:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de59d6:	4664      	mov	r4, ip
c0de59d8:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de59dc:	f841 a023 	str.w	sl, [r1, r3, lsl #2]
c0de59e0:	21a0      	movs	r1, #160	@ 0xa0
c0de59e2:	f88a 0006 	strb.w	r0, [sl, #6]
c0de59e6:	0a00      	lsrs	r0, r0, #8
c0de59e8:	f88a 1004 	strb.w	r1, [sl, #4]
c0de59ec:	2120      	movs	r1, #32
c0de59ee:	f88a 0007 	strb.w	r0, [sl, #7]
c0de59f2:	f88a 1017 	strb.w	r1, [sl, #23]
c0de59f6:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de59fa:	f000 fea9 	bl	c0de6750 <OUTLINED_FUNCTION_1>
c0de59fe:	9905      	ldr	r1, [sp, #20]
c0de5a00:	3110      	adds	r1, #16
c0de5a02:	e68c      	b.n	c0de571e <nbgl_layoutAddTagValueList+0x22>
c0de5a04:	f04f 0800 	mov.w	r8, #0
c0de5a08:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de5a0c:	e726      	b.n	c0de585c <nbgl_layoutAddTagValueList+0x160>
c0de5a0e:	2000      	movs	r0, #0
c0de5a10:	b008      	add	sp, #32
c0de5a12:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de5a16:	f001 b853 	b.w	c0de6ac0 <OUTLINED_FUNCTION_35>
c0de5a1a:	bf00      	nop
c0de5a1c:	0000528d 	.word	0x0000528d
c0de5a20:	0000693a 	.word	0x0000693a

c0de5a24 <nbgl_layoutAddSeparationLine>:
c0de5a24:	b570      	push	{r4, r5, r6, lr}
c0de5a26:	f001 f97f 	bl	c0de6d28 <OUTLINED_FUNCTION_79>
c0de5a2a:	08c0      	lsrs	r0, r0, #3
c0de5a2c:	f7ff fa7e 	bl	c0de4f2c <createHorizontalLine>
c0de5a30:	f000 ffaa 	bl	c0de6988 <OUTLINED_FUNCTION_22>
c0de5a34:	21ff      	movs	r1, #255	@ 0xff
c0de5a36:	7681      	strb	r1, [r0, #26]
c0de5a38:	21fc      	movs	r1, #252	@ 0xfc
c0de5a3a:	7641      	strb	r1, [r0, #25]
c0de5a3c:	2103      	movs	r1, #3
c0de5a3e:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de5a42:	f001 f8f6 	bl	c0de6c32 <OUTLINED_FUNCTION_57>
c0de5a46:	bd70      	pop	{r4, r5, r6, pc}

c0de5a48 <nbgl_layoutAddButton>:
c0de5a48:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de5a4c:	b086      	sub	sp, #24
c0de5a4e:	b310      	cbz	r0, c0de5a96 <nbgl_layoutAddButton+0x4e>
c0de5a50:	4680      	mov	r8, r0
c0de5a52:	7ac8      	ldrb	r0, [r1, #11]
c0de5a54:	460d      	mov	r5, r1
c0de5a56:	b108      	cbz	r0, c0de5a5c <nbgl_layoutAddButton+0x14>
c0de5a58:	7aa8      	ldrb	r0, [r5, #10]
c0de5a5a:	b1f8      	cbz	r0, c0de5a9c <nbgl_layoutAddButton+0x54>
c0de5a5c:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de5a60:	f000 ff5f 	bl	c0de6922 <OUTLINED_FUNCTION_17>
c0de5a64:	4606      	mov	r6, r0
c0de5a66:	7a2a      	ldrb	r2, [r5, #8]
c0de5a68:	7b2b      	ldrb	r3, [r5, #12]
c0de5a6a:	4640      	mov	r0, r8
c0de5a6c:	f000 ff85 	bl	c0de697a <OUTLINED_FUNCTION_20>
c0de5a70:	b188      	cbz	r0, c0de5a96 <nbgl_layoutAddButton+0x4e>
c0de5a72:	210c      	movs	r1, #12
c0de5a74:	2000      	movs	r0, #0
c0de5a76:	7671      	strb	r1, [r6, #25]
c0de5a78:	2120      	movs	r1, #32
c0de5a7a:	76b0      	strb	r0, [r6, #26]
c0de5a7c:	7630      	strb	r0, [r6, #24]
c0de5a7e:	75b0      	strb	r0, [r6, #22]
c0de5a80:	75f1      	strb	r1, [r6, #23]
c0de5a82:	7a69      	ldrb	r1, [r5, #9]
c0de5a84:	b1e9      	cbz	r1, c0de5ac2 <nbgl_layoutAddButton+0x7a>
c0de5a86:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de5a8a:	2003      	movs	r0, #3
c0de5a8c:	77f0      	strb	r0, [r6, #31]
c0de5a8e:	2902      	cmp	r1, #2
c0de5a90:	bf18      	it	ne
c0de5a92:	2002      	movne	r0, #2
c0de5a94:	e019      	b.n	c0de5aca <nbgl_layoutAddButton+0x82>
c0de5a96:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de5a9a:	e0a3      	b.n	c0de5be4 <nbgl_layoutAddButton+0x19c>
c0de5a9c:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de5aa0:	2800      	cmp	r0, #0
c0de5aa2:	f000 80a2 	beq.w	c0de5bea <nbgl_layoutAddButton+0x1a2>
c0de5aa6:	2001      	movs	r0, #1
c0de5aa8:	f88d 0000 	strb.w	r0, [sp]
c0de5aac:	e9d5 0100 	ldrd	r0, r1, [r5]
c0de5ab0:	9001      	str	r0, [sp, #4]
c0de5ab2:	7b28      	ldrb	r0, [r5, #12]
c0de5ab4:	9102      	str	r1, [sp, #8]
c0de5ab6:	4669      	mov	r1, sp
c0de5ab8:	f001 f91b 	bl	c0de6cf2 <OUTLINED_FUNCTION_73>
c0de5abc:	f7fd fda0 	bl	c0de3600 <nbgl_layoutAddUpFooter>
c0de5ac0:	e090      	b.n	c0de5be4 <nbgl_layoutAddButton+0x19c>
c0de5ac2:	2103      	movs	r1, #3
c0de5ac4:	77f0      	strb	r0, [r6, #31]
c0de5ac6:	f886 1021 	strb.w	r1, [r6, #33]	@ 0x21
c0de5aca:	f886 0020 	strb.w	r0, [r6, #32]
c0de5ace:	6828      	ldr	r0, [r5, #0]
c0de5ad0:	f005 f94c 	bl	c0dead6c <pic>
c0de5ad4:	210c      	movs	r1, #12
c0de5ad6:	0e02      	lsrs	r2, r0, #24
c0de5ad8:	f886 1023 	strb.w	r1, [r6, #35]	@ 0x23
c0de5adc:	4631      	mov	r1, r6
c0de5ade:	f000 ff9d 	bl	c0de6a1c <OUTLINED_FUNCTION_28>
c0de5ae2:	f000 ff63 	bl	c0de69ac <OUTLINED_FUNCTION_23>
c0de5ae6:	4631      	mov	r1, r6
c0de5ae8:	0e02      	lsrs	r2, r0, #24
c0de5aea:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de5aee:	70ca      	strb	r2, [r1, #3]
c0de5af0:	0c02      	lsrs	r2, r0, #16
c0de5af2:	0a00      	lsrs	r0, r0, #8
c0de5af4:	708a      	strb	r2, [r1, #2]
c0de5af6:	7048      	strb	r0, [r1, #1]
c0de5af8:	7aa8      	ldrb	r0, [r5, #10]
c0de5afa:	b308      	cbz	r0, c0de5b40 <nbgl_layoutAddButton+0xf8>
c0de5afc:	4632      	mov	r2, r6
c0de5afe:	f896 1026 	ldrb.w	r1, [r6, #38]	@ 0x26
c0de5b02:	f896 0023 	ldrb.w	r0, [r6, #35]	@ 0x23
c0de5b06:	f812 3f25 	ldrb.w	r3, [r2, #37]!
c0de5b0a:	f001 f8fc 	bl	c0de6d06 <OUTLINED_FUNCTION_75>
c0de5b0e:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de5b12:	f004 ff6d 	bl	c0dea9f0 <nbgl_getTextWidth>
c0de5b16:	4631      	mov	r1, r6
c0de5b18:	3040      	adds	r0, #64	@ 0x40
c0de5b1a:	f811 2f2e 	ldrb.w	r2, [r1, #46]!
c0de5b1e:	784b      	ldrb	r3, [r1, #1]
c0de5b20:	788f      	ldrb	r7, [r1, #2]
c0de5b22:	78c9      	ldrb	r1, [r1, #3]
c0de5b24:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5b28:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de5b2c:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
c0de5b30:	2100      	movs	r1, #0
c0de5b32:	b18a      	cbz	r2, c0de5b58 <nbgl_layoutAddButton+0x110>
c0de5b34:	7813      	ldrb	r3, [r2, #0]
c0de5b36:	7852      	ldrb	r2, [r2, #1]
c0de5b38:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de5b3c:	320c      	adds	r2, #12
c0de5b3e:	e00c      	b.n	c0de5b5a <nbgl_layoutAddButton+0x112>
c0de5b40:	2000      	movs	r0, #0
c0de5b42:	71f0      	strb	r0, [r6, #7]
c0de5b44:	2058      	movs	r0, #88	@ 0x58
c0de5b46:	71b0      	strb	r0, [r6, #6]
c0de5b48:	2001      	movs	r0, #1
c0de5b4a:	7170      	strb	r0, [r6, #5]
c0de5b4c:	20a0      	movs	r0, #160	@ 0xa0
c0de5b4e:	7130      	strb	r0, [r6, #4]
c0de5b50:	2003      	movs	r0, #3
c0de5b52:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de5b56:	e01d      	b.n	c0de5b94 <nbgl_layoutAddButton+0x14c>
c0de5b58:	2200      	movs	r2, #0
c0de5b5a:	71f1      	strb	r1, [r6, #7]
c0de5b5c:	2140      	movs	r1, #64	@ 0x40
c0de5b5e:	4410      	add	r0, r2
c0de5b60:	71b1      	strb	r1, [r6, #6]
c0de5b62:	2101      	movs	r1, #1
c0de5b64:	7130      	strb	r0, [r6, #4]
c0de5b66:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de5b6a:	0a01      	lsrs	r1, r0, #8
c0de5b6c:	7171      	strb	r1, [r6, #5]
c0de5b6e:	7ae9      	ldrb	r1, [r5, #11]
c0de5b70:	2901      	cmp	r1, #1
c0de5b72:	d00f      	beq.n	c0de5b94 <nbgl_layoutAddButton+0x14c>
c0de5b74:	b280      	uxth	r0, r0
c0de5b76:	2102      	movs	r1, #2
c0de5b78:	f5c0 70d0 	rsb	r0, r0, #416	@ 0x1a0
c0de5b7c:	fb90 f0f1 	sdiv	r0, r0, r1
c0de5b80:	4631      	mov	r1, r6
c0de5b82:	f811 2f17 	ldrb.w	r2, [r1, #23]!
c0de5b86:	784b      	ldrb	r3, [r1, #1]
c0de5b88:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5b8c:	4410      	add	r0, r2
c0de5b8e:	7008      	strb	r0, [r1, #0]
c0de5b90:	0a00      	lsrs	r0, r0, #8
c0de5b92:	7048      	strb	r0, [r1, #1]
c0de5b94:	2000      	movs	r0, #0
c0de5b96:	4631      	mov	r1, r6
c0de5b98:	f801 0f12 	strb.w	r0, [r1, #18]!
c0de5b9c:	74f0      	strb	r0, [r6, #19]
c0de5b9e:	70c8      	strb	r0, [r1, #3]
c0de5ba0:	7088      	strb	r0, [r1, #2]
c0de5ba2:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de5ba6:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de5baa:	784f      	ldrb	r7, [r1, #1]
c0de5bac:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de5bb0:	788c      	ldrb	r4, [r1, #2]
c0de5bb2:	78c9      	ldrb	r1, [r1, #3]
c0de5bb4:	ea42 2207 	orr.w	r2, r2, r7, lsl #8
c0de5bb8:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
c0de5bbc:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de5bc0:	2208      	movs	r2, #8
c0de5bc2:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
c0de5bc6:	2101      	movs	r1, #1
c0de5bc8:	7770      	strb	r0, [r6, #29]
c0de5bca:	7731      	strb	r1, [r6, #28]
c0de5bcc:	7aa9      	ldrb	r1, [r5, #10]
c0de5bce:	2900      	cmp	r1, #0
c0de5bd0:	bf08      	it	eq
c0de5bd2:	2207      	moveq	r2, #7
c0de5bd4:	77b2      	strb	r2, [r6, #30]
c0de5bd6:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de5bda:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de5bde:	3201      	adds	r2, #1
c0de5be0:	f881 2020 	strb.w	r2, [r1, #32]
c0de5be4:	b006      	add	sp, #24
c0de5be6:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de5bea:	2005      	movs	r0, #5
c0de5bec:	f8ad 0000 	strh.w	r0, [sp]
c0de5bf0:	e9d5 0100 	ldrd	r0, r1, [r5]
c0de5bf4:	9001      	str	r0, [sp, #4]
c0de5bf6:	7b28      	ldrb	r0, [r5, #12]
c0de5bf8:	9102      	str	r1, [sp, #8]
c0de5bfa:	4669      	mov	r1, sp
c0de5bfc:	f001 f879 	bl	c0de6cf2 <OUTLINED_FUNCTION_73>
c0de5c00:	f7fe f8a6 	bl	c0de3d50 <nbgl_layoutAddExtendedFooter>
c0de5c04:	e7ee      	b.n	c0de5be4 <nbgl_layoutAddButton+0x19c>

c0de5c06 <nbgl_layoutAddLongPressButton>:
c0de5c06:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de5c08:	9102      	str	r1, [sp, #8]
c0de5c0a:	2100      	movs	r1, #0
c0de5c0c:	f88d 300d 	strb.w	r3, [sp, #13]
c0de5c10:	f88d 200c 	strb.w	r2, [sp, #12]
c0de5c14:	f88d 1004 	strb.w	r1, [sp, #4]
c0de5c18:	b118      	cbz	r0, c0de5c22 <nbgl_layoutAddLongPressButton+0x1c>
c0de5c1a:	a901      	add	r1, sp, #4
c0de5c1c:	f7fd fcf0 	bl	c0de3600 <nbgl_layoutAddUpFooter>
c0de5c20:	e001      	b.n	c0de5c26 <nbgl_layoutAddLongPressButton+0x20>
c0de5c22:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de5c26:	b006      	add	sp, #24
c0de5c28:	bd80      	pop	{r7, pc}

c0de5c2a <nbgl_layoutAddFooter>:
c0de5c2a:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de5c2c:	9101      	str	r1, [sp, #4]
c0de5c2e:	f240 1101 	movw	r1, #257	@ 0x101
c0de5c32:	f88d 2009 	strb.w	r2, [sp, #9]
c0de5c36:	2200      	movs	r2, #0
c0de5c38:	f88d 300a 	strb.w	r3, [sp, #10]
c0de5c3c:	f8ad 1000 	strh.w	r1, [sp]
c0de5c40:	4669      	mov	r1, sp
c0de5c42:	f88d 2008 	strb.w	r2, [sp, #8]
c0de5c46:	f7fe f883 	bl	c0de3d50 <nbgl_layoutAddExtendedFooter>
c0de5c4a:	b006      	add	sp, #24
c0de5c4c:	bd80      	pop	{r7, pc}

c0de5c4e <nbgl_layoutAddSplitFooter>:
c0de5c4e:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de5c50:	9101      	str	r1, [sp, #4]
c0de5c52:	f44f 7181 	mov.w	r1, #258	@ 0x102
c0de5c56:	f88d 200c 	strb.w	r2, [sp, #12]
c0de5c5a:	9302      	str	r3, [sp, #8]
c0de5c5c:	f8ad 1000 	strh.w	r1, [sp]
c0de5c60:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0de5c62:	f88d 100e 	strb.w	r1, [sp, #14]
c0de5c66:	9908      	ldr	r1, [sp, #32]
c0de5c68:	f88d 100d 	strb.w	r1, [sp, #13]
c0de5c6c:	4669      	mov	r1, sp
c0de5c6e:	f7fe f86f 	bl	c0de3d50 <nbgl_layoutAddExtendedFooter>
c0de5c72:	b006      	add	sp, #24
c0de5c74:	bd80      	pop	{r7, pc}
	...

c0de5c78 <nbgl_layoutAddHeader>:
c0de5c78:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de5c7c:	2800      	cmp	r0, #0
c0de5c7e:	f000 8239 	beq.w	c0de60f4 <nbgl_layoutAddHeader+0x47c>
c0de5c82:	460d      	mov	r5, r1
c0de5c84:	b119      	cbz	r1, c0de5c8e <nbgl_layoutAddHeader+0x16>
c0de5c86:	4604      	mov	r4, r0
c0de5c88:	7828      	ldrb	r0, [r5, #0]
c0de5c8a:	2806      	cmp	r0, #6
c0de5c8c:	d903      	bls.n	c0de5c96 <nbgl_layoutAddHeader+0x1e>
c0de5c8e:	f06f 0001 	mvn.w	r0, #1
c0de5c92:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de5c96:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5c9a:	2601      	movs	r6, #1
c0de5c9c:	f000 fe3d 	bl	c0de691a <OUTLINED_FUNCTION_16>
c0de5ca0:	2100      	movs	r1, #0
c0de5ca2:	7146      	strb	r6, [r0, #5]
c0de5ca4:	77c1      	strb	r1, [r0, #31]
c0de5ca6:	21e0      	movs	r1, #224	@ 0xe0
c0de5ca8:	7101      	strb	r1, [r0, #4]
c0de5caa:	60e0      	str	r0, [r4, #12]
c0de5cac:	f000 ffe8 	bl	c0de6c80 <OUTLINED_FUNCTION_64>
c0de5cb0:	68e1      	ldr	r1, [r4, #12]
c0de5cb2:	0a02      	lsrs	r2, r0, #8
c0de5cb4:	0e03      	lsrs	r3, r0, #24
c0de5cb6:	f881 2023 	strb.w	r2, [r1, #35]	@ 0x23
c0de5cba:	2202      	movs	r2, #2
c0de5cbc:	f001 f804 	bl	c0de6cc8 <OUTLINED_FUNCTION_70>
c0de5cc0:	70d3      	strb	r3, [r2, #3]
c0de5cc2:	7828      	ldrb	r0, [r5, #0]
c0de5cc4:	1e42      	subs	r2, r0, #1
c0de5cc6:	2a02      	cmp	r2, #2
c0de5cc8:	d311      	bcc.n	c0de5cee <nbgl_layoutAddHeader+0x76>
c0de5cca:	2806      	cmp	r0, #6
c0de5ccc:	f000 80ab 	beq.w	c0de5e26 <nbgl_layoutAddHeader+0x1ae>
c0de5cd0:	2803      	cmp	r0, #3
c0de5cd2:	f000 81d9 	beq.w	c0de6088 <nbgl_layoutAddHeader+0x410>
c0de5cd6:	2804      	cmp	r0, #4
c0de5cd8:	f000 80d5 	beq.w	c0de5e86 <nbgl_layoutAddHeader+0x20e>
c0de5cdc:	2805      	cmp	r0, #5
c0de5cde:	d006      	beq.n	c0de5cee <nbgl_layoutAddHeader+0x76>
c0de5ce0:	2800      	cmp	r0, #0
c0de5ce2:	d1d4      	bne.n	c0de5c8e <nbgl_layoutAddHeader+0x16>
c0de5ce4:	88a8      	ldrh	r0, [r5, #4]
c0de5ce6:	7188      	strb	r0, [r1, #6]
c0de5ce8:	0a00      	lsrs	r0, r0, #8
c0de5cea:	71c8      	strb	r0, [r1, #7]
c0de5cec:	e1cc      	b.n	c0de6088 <nbgl_layoutAddHeader+0x410>
c0de5cee:	f000 ff65 	bl	c0de6bbc <OUTLINED_FUNCTION_49>
c0de5cf2:	9001      	str	r0, [sp, #4]
c0de5cf4:	7828      	ldrb	r0, [r5, #0]
c0de5cf6:	210c      	movs	r1, #12
c0de5cf8:	2805      	cmp	r0, #5
c0de5cfa:	bf08      	it	eq
c0de5cfc:	210d      	moveq	r1, #13
c0de5cfe:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5d02:	f815 b001 	ldrb.w	fp, [r5, r1]
c0de5d06:	f000 fe0c 	bl	c0de6922 <OUTLINED_FUNCTION_17>
c0de5d0a:	4606      	mov	r6, r0
c0de5d0c:	f04f 0a03 	mov.w	sl, #3
c0de5d10:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de5d14:	d00d      	beq.n	c0de5d32 <nbgl_layoutAddHeader+0xba>
c0de5d16:	7828      	ldrb	r0, [r5, #0]
c0de5d18:	210d      	movs	r1, #13
c0de5d1a:	465a      	mov	r2, fp
c0de5d1c:	2805      	cmp	r0, #5
c0de5d1e:	bf08      	it	eq
c0de5d20:	210f      	moveq	r1, #15
c0de5d22:	5c6b      	ldrb	r3, [r5, r1]
c0de5d24:	f000 fd5e 	bl	c0de67e4 <OUTLINED_FUNCTION_6>
c0de5d28:	2800      	cmp	r0, #0
c0de5d2a:	f000 81e3 	beq.w	c0de60f4 <nbgl_layoutAddHeader+0x47c>
c0de5d2e:	2000      	movs	r0, #0
c0de5d30:	e000      	b.n	c0de5d34 <nbgl_layoutAddHeader+0xbc>
c0de5d32:	2003      	movs	r0, #3
c0de5d34:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de5d38:	2004      	movs	r0, #4
c0de5d3a:	f04f 0800 	mov.w	r8, #0
c0de5d3e:	2160      	movs	r1, #96	@ 0x60
c0de5d40:	f886 a01f 	strb.w	sl, [r6, #31]
c0de5d44:	f886 a020 	strb.w	sl, [r6, #32]
c0de5d48:	75b0      	strb	r0, [r6, #22]
c0de5d4a:	4630      	mov	r0, r6
c0de5d4c:	71b1      	strb	r1, [r6, #6]
c0de5d4e:	2168      	movs	r1, #104	@ 0x68
c0de5d50:	f886 8026 	strb.w	r8, [r6, #38]	@ 0x26
c0de5d54:	f886 8007 	strb.w	r8, [r6, #7]
c0de5d58:	f886 8005 	strb.w	r8, [r6, #5]
c0de5d5c:	f800 8f25 	strb.w	r8, [r0, #37]!
c0de5d60:	7131      	strb	r1, [r6, #4]
c0de5d62:	f880 8003 	strb.w	r8, [r0, #3]
c0de5d66:	f880 8002 	strb.w	r8, [r0, #2]
c0de5d6a:	48e4      	ldr	r0, [pc, #912]	@ (c0de60fc <nbgl_layoutAddHeader+0x484>)
c0de5d6c:	4478      	add	r0, pc
c0de5d6e:	f004 fffd 	bl	c0dead6c <pic>
c0de5d72:	4631      	mov	r1, r6
c0de5d74:	0e02      	lsrs	r2, r0, #24
c0de5d76:	f886 801d 	strb.w	r8, [r6, #29]
c0de5d7a:	f000 fd5f 	bl	c0de683c <OUTLINED_FUNCTION_9>
c0de5d7e:	f1bb 00ff 	subs.w	r0, fp, #255	@ 0xff
c0de5d82:	bf18      	it	ne
c0de5d84:	2001      	movne	r0, #1
c0de5d86:	7730      	strb	r0, [r6, #28]
c0de5d88:	9f01      	ldr	r7, [sp, #4]
c0de5d8a:	68e1      	ldr	r1, [r4, #12]
c0de5d8c:	2006      	movs	r0, #6
c0de5d8e:	77b0      	strb	r0, [r6, #30]
c0de5d90:	f891 0020 	ldrb.w	r0, [r1, #32]
c0de5d94:	3001      	adds	r0, #1
c0de5d96:	2f00      	cmp	r7, #0
c0de5d98:	f881 0020 	strb.w	r0, [r1, #32]
c0de5d9c:	f000 809a 	beq.w	c0de5ed4 <nbgl_layoutAddHeader+0x25c>
c0de5da0:	7828      	ldrb	r0, [r5, #0]
c0de5da2:	f04f 0a00 	mov.w	sl, #0
c0de5da6:	2802      	cmp	r0, #2
c0de5da8:	d122      	bne.n	c0de5df0 <nbgl_layoutAddHeader+0x178>
c0de5daa:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5dae:	f000 fde7 	bl	c0de6980 <OUTLINED_FUNCTION_21>
c0de5db2:	4606      	mov	r6, r0
c0de5db4:	f000 fdfa 	bl	c0de69ac <OUTLINED_FUNCTION_23>
c0de5db8:	4631      	mov	r1, r6
c0de5dba:	0e02      	lsrs	r2, r0, #24
c0de5dbc:	f886 a01f 	strb.w	sl, [r6, #31]
c0de5dc0:	46b2      	mov	sl, r6
c0de5dc2:	f000 ff2d 	bl	c0de6c20 <OUTLINED_FUNCTION_56>
c0de5dc6:	68e0      	ldr	r0, [r4, #12]
c0de5dc8:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de5dcc:	7843      	ldrb	r3, [r0, #1]
c0de5dce:	f810 cc02 	ldrb.w	ip, [r0, #-2]
c0de5dd2:	7882      	ldrb	r2, [r0, #2]
c0de5dd4:	78c0      	ldrb	r0, [r0, #3]
c0de5dd6:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de5dda:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de5dde:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de5de2:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de5de6:	2005      	movs	r0, #5
c0de5de8:	75b0      	strb	r0, [r6, #22]
c0de5dea:	68e0      	ldr	r0, [r4, #12]
c0de5dec:	f000 fcb0 	bl	c0de6750 <OUTLINED_FUNCTION_1>
c0de5df0:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5df4:	f000 fca8 	bl	c0de6748 <OUTLINED_FUNCTION_0>
c0de5df8:	782b      	ldrb	r3, [r5, #0]
c0de5dfa:	4680      	mov	r8, r0
c0de5dfc:	2b05      	cmp	r3, #5
c0de5dfe:	d16c      	bne.n	c0de5eda <nbgl_layoutAddHeader+0x262>
c0de5e00:	7b2a      	ldrb	r2, [r5, #12]
c0de5e02:	2aff      	cmp	r2, #255	@ 0xff
c0de5e04:	d068      	beq.n	c0de5ed8 <nbgl_layoutAddHeader+0x260>
c0de5e06:	7beb      	ldrb	r3, [r5, #15]
c0de5e08:	4620      	mov	r0, r4
c0de5e0a:	4641      	mov	r1, r8
c0de5e0c:	f7fd f97a 	bl	c0de3104 <layoutAddCallbackObj>
c0de5e10:	2800      	cmp	r0, #0
c0de5e12:	f000 816f 	beq.w	c0de60f4 <nbgl_layoutAddHeader+0x47c>
c0de5e16:	2000      	movs	r0, #0
c0de5e18:	f888 001d 	strb.w	r0, [r8, #29]
c0de5e1c:	2001      	movs	r0, #1
c0de5e1e:	f888 001c 	strb.w	r0, [r8, #28]
c0de5e22:	782b      	ldrb	r3, [r5, #0]
c0de5e24:	e059      	b.n	c0de5eda <nbgl_layoutAddHeader+0x262>
c0de5e26:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5e2a:	f000 fc8d 	bl	c0de6748 <OUTLINED_FUNCTION_0>
c0de5e2e:	4606      	mov	r6, r0
c0de5e30:	7a2a      	ldrb	r2, [r5, #8]
c0de5e32:	7a6b      	ldrb	r3, [r5, #9]
c0de5e34:	f000 fcd6 	bl	c0de67e4 <OUTLINED_FUNCTION_6>
c0de5e38:	2800      	cmp	r0, #0
c0de5e3a:	f000 815b 	beq.w	c0de60f4 <nbgl_layoutAddHeader+0x47c>
c0de5e3e:	2020      	movs	r0, #32
c0de5e40:	4637      	mov	r7, r6
c0de5e42:	f04f 0a00 	mov.w	sl, #0
c0de5e46:	f04f 0806 	mov.w	r8, #6
c0de5e4a:	f04f 0b01 	mov.w	fp, #1
c0de5e4e:	75f0      	strb	r0, [r6, #23]
c0de5e50:	20a0      	movs	r0, #160	@ 0xa0
c0de5e52:	f886 a01f 	strb.w	sl, [r6, #31]
c0de5e56:	f886 a018 	strb.w	sl, [r6, #24]
c0de5e5a:	f886 8016 	strb.w	r8, [r6, #22]
c0de5e5e:	f886 b005 	strb.w	fp, [r6, #5]
c0de5e62:	7130      	strb	r0, [r6, #4]
c0de5e64:	2060      	movs	r0, #96	@ 0x60
c0de5e66:	f807 0f06 	strb.w	r0, [r7, #6]!
c0de5e6a:	f887 a001 	strb.w	sl, [r7, #1]
c0de5e6e:	f000 fd9d 	bl	c0de69ac <OUTLINED_FUNCTION_23>
c0de5e72:	f000 fee7 	bl	c0de6c44 <OUTLINED_FUNCTION_58>
c0de5e76:	f886 8020 	strb.w	r8, [r6, #32]
c0de5e7a:	f000 fcb7 	bl	c0de67ec <OUTLINED_FUNCTION_7>
c0de5e7e:	f000 fee6 	bl	c0de6c4e <OUTLINED_FUNCTION_59>
c0de5e82:	77b0      	strb	r0, [r6, #30]
c0de5e84:	e01e      	b.n	c0de5ec4 <nbgl_layoutAddHeader+0x24c>
c0de5e86:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5e8a:	f000 fc5d 	bl	c0de6748 <OUTLINED_FUNCTION_0>
c0de5e8e:	4606      	mov	r6, r0
c0de5e90:	21a0      	movs	r1, #160	@ 0xa0
c0de5e92:	2000      	movs	r0, #0
c0de5e94:	f04f 0801 	mov.w	r8, #1
c0de5e98:	7131      	strb	r1, [r6, #4]
c0de5e9a:	2160      	movs	r1, #96	@ 0x60
c0de5e9c:	4637      	mov	r7, r6
c0de5e9e:	77f0      	strb	r0, [r6, #31]
c0de5ea0:	f886 8005 	strb.w	r8, [r6, #5]
c0de5ea4:	f807 1f06 	strb.w	r1, [r7, #6]!
c0de5ea8:	7078      	strb	r0, [r7, #1]
c0de5eaa:	f000 fd7f 	bl	c0de69ac <OUTLINED_FUNCTION_23>
c0de5eae:	4631      	mov	r1, r6
c0de5eb0:	0e02      	lsrs	r2, r0, #24
c0de5eb2:	f886 8024 	strb.w	r8, [r6, #36]	@ 0x24
c0de5eb6:	f000 fc99 	bl	c0de67ec <OUTLINED_FUNCTION_7>
c0de5eba:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de5ebe:	2005      	movs	r0, #5
c0de5ec0:	f886 0020 	strb.w	r0, [r6, #32]
c0de5ec4:	68e1      	ldr	r1, [r4, #12]
c0de5ec6:	787a      	ldrb	r2, [r7, #1]
c0de5ec8:	7838      	ldrb	r0, [r7, #0]
c0de5eca:	71ca      	strb	r2, [r1, #7]
c0de5ecc:	7188      	strb	r0, [r1, #6]
c0de5ece:	f000 fec9 	bl	c0de6c64 <OUTLINED_FUNCTION_61>
c0de5ed2:	e0d9      	b.n	c0de6088 <nbgl_layoutAddHeader+0x410>
c0de5ed4:	7828      	ldrb	r0, [r5, #0]
c0de5ed6:	e096      	b.n	c0de6006 <nbgl_layoutAddHeader+0x38e>
c0de5ed8:	2305      	movs	r3, #5
c0de5eda:	68e2      	ldr	r2, [r4, #12]
c0de5edc:	f04f 0e00 	mov.w	lr, #0
c0de5ee0:	f04f 0c05 	mov.w	ip, #5
c0de5ee4:	f888 e01f 	strb.w	lr, [r8, #31]
c0de5ee8:	f888 c016 	strb.w	ip, [r8, #22]
c0de5eec:	7916      	ldrb	r6, [r2, #4]
c0de5eee:	7952      	ldrb	r2, [r2, #5]
c0de5ef0:	ea46 2602 	orr.w	r6, r6, r2, lsl #8
c0de5ef4:	f1a6 02d0 	sub.w	r2, r6, #208	@ 0xd0
c0de5ef8:	0a10      	lsrs	r0, r2, #8
c0de5efa:	f888 2004 	strb.w	r2, [r8, #4]
c0de5efe:	2b02      	cmp	r3, #2
c0de5f00:	f888 0005 	strb.w	r0, [r8, #5]
c0de5f04:	d117      	bne.n	c0de5f36 <nbgl_layoutAddHeader+0x2be>
c0de5f06:	4650      	mov	r0, sl
c0de5f08:	f810 2f21 	ldrb.w	r2, [r0, #33]!
c0de5f0c:	7843      	ldrb	r3, [r0, #1]
c0de5f0e:	7881      	ldrb	r1, [r0, #2]
c0de5f10:	78c0      	ldrb	r0, [r0, #3]
c0de5f12:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5f16:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de5f1a:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de5f1e:	7801      	ldrb	r1, [r0, #0]
c0de5f20:	7840      	ldrb	r0, [r0, #1]
c0de5f22:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de5f26:	1a30      	subs	r0, r6, r0
c0de5f28:	f1a0 02e0 	sub.w	r2, r0, #224	@ 0xe0
c0de5f2c:	0a10      	lsrs	r0, r2, #8
c0de5f2e:	f888 2004 	strb.w	r2, [r8, #4]
c0de5f32:	f888 0005 	strb.w	r0, [r8, #5]
c0de5f36:	4640      	mov	r0, r8
c0de5f38:	0e39      	lsrs	r1, r7, #24
c0de5f3a:	b292      	uxth	r2, r2
c0de5f3c:	2301      	movs	r3, #1
c0de5f3e:	f800 7f26 	strb.w	r7, [r0, #38]!
c0de5f42:	70c1      	strb	r1, [r0, #3]
c0de5f44:	0c39      	lsrs	r1, r7, #16
c0de5f46:	f800 ec1f 	strb.w	lr, [r0, #-31]
c0de5f4a:	f800 cc06 	strb.w	ip, [r0, #-6]
c0de5f4e:	7081      	strb	r1, [r0, #2]
c0de5f50:	0a39      	lsrs	r1, r7, #8
c0de5f52:	7041      	strb	r1, [r0, #1]
c0de5f54:	2160      	movs	r1, #96	@ 0x60
c0de5f56:	f800 1c20 	strb.w	r1, [r0, #-32]
c0de5f5a:	210c      	movs	r1, #12
c0de5f5c:	f800 1c04 	strb.w	r1, [r0, #-4]
c0de5f60:	2101      	movs	r1, #1
c0de5f62:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de5f66:	200c      	movs	r0, #12
c0de5f68:	4639      	mov	r1, r7
c0de5f6a:	f004 fd3c 	bl	c0dea9e6 <nbgl_getTextNbLinesInWidth>
c0de5f6e:	7828      	ldrb	r0, [r5, #0]
c0de5f70:	2802      	cmp	r0, #2
c0de5f72:	d115      	bne.n	c0de5fa0 <nbgl_layoutAddHeader+0x328>
c0de5f74:	4646      	mov	r6, r8
c0de5f76:	f816 cf26 	ldrb.w	ip, [r6, #38]!
c0de5f7a:	7872      	ldrb	r2, [r6, #1]
c0de5f7c:	78b3      	ldrb	r3, [r6, #2]
c0de5f7e:	78f1      	ldrb	r1, [r6, #3]
c0de5f80:	f816 0c04 	ldrb.w	r0, [r6, #-4]
c0de5f84:	ea4c 2202 	orr.w	r2, ip, r2, lsl #8
c0de5f88:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de5f8c:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de5f90:	f004 fd2e 	bl	c0dea9f0 <nbgl_getTextWidth>
c0de5f94:	f806 0c22 	strb.w	r0, [r6, #-34]
c0de5f98:	0a00      	lsrs	r0, r0, #8
c0de5f9a:	f806 0c21 	strb.w	r0, [r6, #-33]
c0de5f9e:	7828      	ldrb	r0, [r5, #0]
c0de5fa0:	68e1      	ldr	r1, [r4, #12]
c0de5fa2:	f000 fd65 	bl	c0de6a70 <OUTLINED_FUNCTION_32>
c0de5fa6:	f841 8023 	str.w	r8, [r1, r3, lsl #2]
c0de5faa:	68e1      	ldr	r1, [r4, #12]
c0de5fac:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de5fb0:	3201      	adds	r2, #1
c0de5fb2:	2802      	cmp	r0, #2
c0de5fb4:	f881 2020 	strb.w	r2, [r1, #32]
c0de5fb8:	d125      	bne.n	c0de6006 <nbgl_layoutAddHeader+0x38e>
c0de5fba:	f898 0004 	ldrb.w	r0, [r8, #4]
c0de5fbe:	f898 2005 	ldrb.w	r2, [r8, #5]
c0de5fc2:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de5fc6:	f06f 0207 	mvn.w	r2, #7
c0de5fca:	eba2 0050 	sub.w	r0, r2, r0, lsr #1
c0de5fce:	f81a 2f21 	ldrb.w	r2, [sl, #33]!
c0de5fd2:	f80a 0c0a 	strb.w	r0, [sl, #-10]
c0de5fd6:	0a00      	lsrs	r0, r0, #8
c0de5fd8:	f89a 3002 	ldrb.w	r3, [sl, #2]
c0de5fdc:	f89a 6003 	ldrb.w	r6, [sl, #3]
c0de5fe0:	f80a 0c09 	strb.w	r0, [sl, #-9]
c0de5fe4:	f89a 0001 	ldrb.w	r0, [sl, #1]
c0de5fe8:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de5fec:	ea43 2206 	orr.w	r2, r3, r6, lsl #8
c0de5ff0:	f000 fea3 	bl	c0de6d3a <OUTLINED_FUNCTION_81>
c0de5ff4:	2208      	movs	r2, #8
c0de5ff6:	eb02 0050 	add.w	r0, r2, r0, lsr #1
c0de5ffa:	f888 0017 	strb.w	r0, [r8, #23]
c0de5ffe:	0a00      	lsrs	r0, r0, #8
c0de6000:	f888 0018 	strb.w	r0, [r8, #24]
c0de6004:	e03c      	b.n	c0de6080 <nbgl_layoutAddHeader+0x408>
c0de6006:	2805      	cmp	r0, #5
c0de6008:	d13a      	bne.n	c0de6080 <nbgl_layoutAddHeader+0x408>
c0de600a:	6868      	ldr	r0, [r5, #4]
c0de600c:	b3c0      	cbz	r0, c0de6080 <nbgl_layoutAddHeader+0x408>
c0de600e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de6012:	f000 fc86 	bl	c0de6922 <OUTLINED_FUNCTION_17>
c0de6016:	7baa      	ldrb	r2, [r5, #14]
c0de6018:	4606      	mov	r6, r0
c0de601a:	2aff      	cmp	r2, #255	@ 0xff
c0de601c:	d008      	beq.n	c0de6030 <nbgl_layoutAddHeader+0x3b8>
c0de601e:	7beb      	ldrb	r3, [r5, #15]
c0de6020:	f000 fbe0 	bl	c0de67e4 <OUTLINED_FUNCTION_6>
c0de6024:	2800      	cmp	r0, #0
c0de6026:	d065      	beq.n	c0de60f4 <nbgl_layoutAddHeader+0x47c>
c0de6028:	2000      	movs	r0, #0
c0de602a:	7770      	strb	r0, [r6, #29]
c0de602c:	2001      	movs	r0, #1
c0de602e:	7730      	strb	r0, [r6, #28]
c0de6030:	2003      	movs	r0, #3
c0de6032:	2106      	movs	r1, #6
c0de6034:	2260      	movs	r2, #96	@ 0x60
c0de6036:	77f0      	strb	r0, [r6, #31]
c0de6038:	75b1      	strb	r1, [r6, #22]
c0de603a:	7ba9      	ldrb	r1, [r5, #14]
c0de603c:	71b2      	strb	r2, [r6, #6]
c0de603e:	2268      	movs	r2, #104	@ 0x68
c0de6040:	f886 0020 	strb.w	r0, [r6, #32]
c0de6044:	2000      	movs	r0, #0
c0de6046:	7132      	strb	r2, [r6, #4]
c0de6048:	4632      	mov	r2, r6
c0de604a:	f886 0026 	strb.w	r0, [r6, #38]	@ 0x26
c0de604e:	71f0      	strb	r0, [r6, #7]
c0de6050:	7170      	strb	r0, [r6, #5]
c0de6052:	f802 0f25 	strb.w	r0, [r2, #37]!
c0de6056:	70d0      	strb	r0, [r2, #3]
c0de6058:	7090      	strb	r0, [r2, #2]
c0de605a:	f1a1 00ff 	sub.w	r0, r1, #255	@ 0xff
c0de605e:	fab0 f080 	clz	r0, r0
c0de6062:	0940      	lsrs	r0, r0, #5
c0de6064:	0040      	lsls	r0, r0, #1
c0de6066:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de606a:	f000 fc9f 	bl	c0de69ac <OUTLINED_FUNCTION_23>
c0de606e:	4631      	mov	r1, r6
c0de6070:	0e02      	lsrs	r2, r0, #24
c0de6072:	f000 fbe3 	bl	c0de683c <OUTLINED_FUNCTION_9>
c0de6076:	2008      	movs	r0, #8
c0de6078:	68e1      	ldr	r1, [r4, #12]
c0de607a:	77b0      	strb	r0, [r6, #30]
c0de607c:	f000 fdf2 	bl	c0de6c64 <OUTLINED_FUNCTION_61>
c0de6080:	2000      	movs	r0, #0
c0de6082:	71c8      	strb	r0, [r1, #7]
c0de6084:	2060      	movs	r0, #96	@ 0x60
c0de6086:	7188      	strb	r0, [r1, #6]
c0de6088:	7868      	ldrb	r0, [r5, #1]
c0de608a:	b160      	cbz	r0, c0de60a6 <nbgl_layoutAddHeader+0x42e>
c0de608c:	f000 fca1 	bl	c0de69d2 <OUTLINED_FUNCTION_25>
c0de6090:	68e1      	ldr	r1, [r4, #12]
c0de6092:	f000 fb8a 	bl	c0de67aa <OUTLINED_FUNCTION_4>
c0de6096:	2103      	movs	r1, #3
c0de6098:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de609c:	2108      	movs	r1, #8
c0de609e:	7581      	strb	r1, [r0, #22]
c0de60a0:	68e1      	ldr	r1, [r4, #12]
c0de60a2:	f000 fddf 	bl	c0de6c64 <OUTLINED_FUNCTION_61>
c0de60a6:	68a0      	ldr	r0, [r4, #8]
c0de60a8:	6001      	str	r1, [r0, #0]
c0de60aa:	68e0      	ldr	r0, [r4, #12]
c0de60ac:	f8d4 10a0 	ldr.w	r1, [r4, #160]	@ 0xa0
c0de60b0:	4602      	mov	r2, r0
c0de60b2:	f812 3f06 	ldrb.w	r3, [r2, #6]!
c0de60b6:	7856      	ldrb	r6, [r2, #1]
c0de60b8:	f801 0f12 	strb.w	r0, [r1, #18]!
c0de60bc:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de60c0:	f811 6d0c 	ldrb.w	r6, [r1, #-12]!
c0de60c4:	784f      	ldrb	r7, [r1, #1]
c0de60c6:	ea46 2607 	orr.w	r6, r6, r7, lsl #8
c0de60ca:	1af3      	subs	r3, r6, r3
c0de60cc:	700b      	strb	r3, [r1, #0]
c0de60ce:	0a1b      	lsrs	r3, r3, #8
c0de60d0:	704b      	strb	r3, [r1, #1]
c0de60d2:	782b      	ldrb	r3, [r5, #0]
c0de60d4:	f884 30aa 	strb.w	r3, [r4, #170]	@ 0xaa
c0de60d8:	0e03      	lsrs	r3, r0, #24
c0de60da:	73cb      	strb	r3, [r1, #15]
c0de60dc:	0c03      	lsrs	r3, r0, #16
c0de60de:	0a00      	lsrs	r0, r0, #8
c0de60e0:	7348      	strb	r0, [r1, #13]
c0de60e2:	2007      	movs	r0, #7
c0de60e4:	738b      	strb	r3, [r1, #14]
c0de60e6:	7408      	strb	r0, [r1, #16]
c0de60e8:	7810      	ldrb	r0, [r2, #0]
c0de60ea:	7851      	ldrb	r1, [r2, #1]
c0de60ec:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de60f0:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de60f4:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de60f8:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de60fc:	00006081 	.word	0x00006081

c0de6100 <nbgl_layoutAddProgressIndicator>:
c0de6100:	b51f      	push	{r0, r1, r2, r3, r4, lr}
c0de6102:	9c07      	ldr	r4, [sp, #28]
c0de6104:	f88d 1008 	strb.w	r1, [sp, #8]
c0de6108:	2100      	movs	r1, #0
c0de610a:	f88d 300a 	strb.w	r3, [sp, #10]
c0de610e:	f88d 2009 	strb.w	r2, [sp, #9]
c0de6112:	9101      	str	r1, [sp, #4]
c0de6114:	2103      	movs	r1, #3
c0de6116:	f88d 400d 	strb.w	r4, [sp, #13]
c0de611a:	24ff      	movs	r4, #255	@ 0xff
c0de611c:	f8ad 1000 	strh.w	r1, [sp]
c0de6120:	4669      	mov	r1, sp
c0de6122:	f88d 400c 	strb.w	r4, [sp, #12]
c0de6126:	9c06      	ldr	r4, [sp, #24]
c0de6128:	f88d 400b 	strb.w	r4, [sp, #11]
c0de612c:	f7ff fda4 	bl	c0de5c78 <nbgl_layoutAddHeader>
c0de6130:	b004      	add	sp, #16
c0de6132:	bd10      	pop	{r4, pc}

c0de6134 <nbgl_layoutAddSpinner>:
c0de6134:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de6138:	b088      	sub	sp, #32
c0de613a:	2800      	cmp	r0, #0
c0de613c:	f000 811a 	beq.w	c0de6374 <nbgl_layoutAddSpinner+0x240>
c0de6140:	9101      	str	r1, [sp, #4]
c0de6142:	f000 fdf1 	bl	c0de6d28 <OUTLINED_FUNCTION_79>
c0de6146:	469a      	mov	sl, r3
c0de6148:	2601      	movs	r6, #1
c0de614a:	4f8d      	ldr	r7, [pc, #564]	@ (c0de6380 <nbgl_layoutAddSpinner+0x24c>)
c0de614c:	9203      	str	r2, [sp, #12]
c0de614e:	08c1      	lsrs	r1, r0, #3
c0de6150:	2001      	movs	r0, #1
c0de6152:	447f      	add	r7, pc
c0de6154:	47b8      	blx	r7
c0de6156:	4683      	mov	fp, r0
c0de6158:	2003      	movs	r0, #3
c0de615a:	463d      	mov	r5, r7
c0de615c:	f88b 0020 	strb.w	r0, [fp, #32]
c0de6160:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de6164:	08c1      	lsrs	r1, r0, #3
c0de6166:	2003      	movs	r0, #3
c0de6168:	f004 fc24 	bl	c0dea9b4 <nbgl_containerPoolGet>
c0de616c:	2100      	movs	r1, #0
c0de616e:	f88b 6005 	strb.w	r6, [fp, #5]
c0de6172:	465e      	mov	r6, fp
c0de6174:	270d      	movs	r7, #13
c0de6176:	f88b 101f 	strb.w	r1, [fp, #31]
c0de617a:	21a0      	movs	r1, #160	@ 0xa0
c0de617c:	f806 0f22 	strb.w	r0, [r6, #34]!
c0de6180:	f88b 1004 	strb.w	r1, [fp, #4]
c0de6184:	2105      	movs	r1, #5
c0de6186:	f88b 1016 	strb.w	r1, [fp, #22]
c0de618a:	0e01      	lsrs	r1, r0, #24
c0de618c:	f000 fd65 	bl	c0de6c5a <OUTLINED_FUNCTION_60>
c0de6190:	f88b 0023 	strb.w	r0, [fp, #35]	@ 0x23
c0de6194:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de6198:	08c1      	lsrs	r1, r0, #3
c0de619a:	200d      	movs	r0, #13
c0de619c:	47a8      	blx	r5
c0de619e:	4680      	mov	r8, r0
c0de61a0:	f880 a01f 	strb.w	sl, [r0, #31]
c0de61a4:	2002      	movs	r0, #2
c0de61a6:	7831      	ldrb	r1, [r6, #0]
c0de61a8:	78b2      	ldrb	r2, [r6, #2]
c0de61aa:	78f3      	ldrb	r3, [r6, #3]
c0de61ac:	f8cd a008 	str.w	sl, [sp, #8]
c0de61b0:	46da      	mov	sl, fp
c0de61b2:	9404      	str	r4, [sp, #16]
c0de61b4:	f888 0016 	strb.w	r0, [r8, #22]
c0de61b8:	f89b 0023 	ldrb.w	r0, [fp, #35]	@ 0x23
c0de61bc:	f000 fcf7 	bl	c0de6bae <OUTLINED_FUNCTION_48>
c0de61c0:	f8c0 8000 	str.w	r8, [r0]
c0de61c4:	f81a 0f06 	ldrb.w	r0, [sl, #6]!
c0de61c8:	f89a 1001 	ldrb.w	r1, [sl, #1]
c0de61cc:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de61d0:	3030      	adds	r0, #48	@ 0x30
c0de61d2:	f88a 0000 	strb.w	r0, [sl]
c0de61d6:	0a00      	lsrs	r0, r0, #8
c0de61d8:	f88a 0001 	strb.w	r0, [sl, #1]
c0de61dc:	9804      	ldr	r0, [sp, #16]
c0de61de:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de61e2:	08c1      	lsrs	r1, r0, #3
c0de61e4:	2004      	movs	r0, #4
c0de61e6:	47a8      	blx	r5
c0de61e8:	4605      	mov	r5, r0
c0de61ea:	2000      	movs	r0, #0
c0de61ec:	ea4f 2418 	mov.w	r4, r8, lsr #8
c0de61f0:	77e8      	strb	r0, [r5, #31]
c0de61f2:	9801      	ldr	r0, [sp, #4]
c0de61f4:	f004 fdba 	bl	c0dead6c <pic>
c0de61f8:	4601      	mov	r1, r0
c0de61fa:	2001      	movs	r0, #1
c0de61fc:	22a0      	movs	r2, #160	@ 0xa0
c0de61fe:	74ec      	strb	r4, [r5, #19]
c0de6200:	462c      	mov	r4, r5
c0de6202:	7168      	strb	r0, [r5, #5]
c0de6204:	f885 0024 	strb.w	r0, [r5, #36]	@ 0x24
c0de6208:	9803      	ldr	r0, [sp, #12]
c0de620a:	712a      	strb	r2, [r5, #4]
c0de620c:	2800      	cmp	r0, #0
c0de620e:	bf08      	it	eq
c0de6210:	270b      	moveq	r7, #11
c0de6212:	f885 7022 	strb.w	r7, [r5, #34]	@ 0x22
c0de6216:	2005      	movs	r0, #5
c0de6218:	0e0a      	lsrs	r2, r1, #24
c0de621a:	2301      	movs	r3, #1
c0de621c:	f885 0020 	strb.w	r0, [r5, #32]
c0de6220:	2008      	movs	r0, #8
c0de6222:	75a8      	strb	r0, [r5, #22]
c0de6224:	4628      	mov	r0, r5
c0de6226:	f000 fb52 	bl	c0de68ce <OUTLINED_FUNCTION_13>
c0de622a:	ea4f 6218 	mov.w	r2, r8, lsr #24
c0de622e:	f885 0027 	strb.w	r0, [r5, #39]	@ 0x27
c0de6232:	2018      	movs	r0, #24
c0de6234:	f804 0f19 	strb.w	r0, [r4, #25]!
c0de6238:	2000      	movs	r0, #0
c0de623a:	7060      	strb	r0, [r4, #1]
c0de623c:	4628      	mov	r0, r5
c0de623e:	f800 8f12 	strb.w	r8, [r0, #18]!
c0de6242:	70c2      	strb	r2, [r0, #3]
c0de6244:	ea4f 4218 	mov.w	r2, r8, lsr #16
c0de6248:	f8dd 8010 	ldr.w	r8, [sp, #16]
c0de624c:	7082      	strb	r2, [r0, #2]
c0de624e:	4638      	mov	r0, r7
c0de6250:	f000 fcc1 	bl	c0de6bd6 <OUTLINED_FUNCTION_51>
c0de6254:	2100      	movs	r1, #0
c0de6256:	71a8      	strb	r0, [r5, #6]
c0de6258:	f885 1021 	strb.w	r1, [r5, #33]	@ 0x21
c0de625c:	0a01      	lsrs	r1, r0, #8
c0de625e:	7832      	ldrb	r2, [r6, #0]
c0de6260:	78b3      	ldrb	r3, [r6, #2]
c0de6262:	78f6      	ldrb	r6, [r6, #3]
c0de6264:	71e9      	strb	r1, [r5, #7]
c0de6266:	f89b 1023 	ldrb.w	r1, [fp, #35]	@ 0x23
c0de626a:	f000 fd53 	bl	c0de6d14 <OUTLINED_FUNCTION_76>
c0de626e:	7862      	ldrb	r2, [r4, #1]
c0de6270:	604d      	str	r5, [r1, #4]
c0de6272:	7821      	ldrb	r1, [r4, #0]
c0de6274:	9c03      	ldr	r4, [sp, #12]
c0de6276:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de627a:	f89a 2001 	ldrb.w	r2, [sl, #1]
c0de627e:	4408      	add	r0, r1
c0de6280:	f89a 1000 	ldrb.w	r1, [sl]
c0de6284:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de6288:	4408      	add	r0, r1
c0de628a:	f88a 0000 	strb.w	r0, [sl]
c0de628e:	0a00      	lsrs	r0, r0, #8
c0de6290:	2c00      	cmp	r4, #0
c0de6292:	f88a 0001 	strb.w	r0, [sl, #1]
c0de6296:	d051      	beq.n	c0de633c <nbgl_layoutAddSpinner+0x208>
c0de6298:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de629c:	f000 fa54 	bl	c0de6748 <OUTLINED_FUNCTION_0>
c0de62a0:	2600      	movs	r6, #0
c0de62a2:	4607      	mov	r7, r0
c0de62a4:	77c6      	strb	r6, [r0, #31]
c0de62a6:	4620      	mov	r0, r4
c0de62a8:	f004 fd60 	bl	c0dead6c <pic>
c0de62ac:	4601      	mov	r1, r0
c0de62ae:	0a28      	lsrs	r0, r5, #8
c0de62b0:	22a0      	movs	r2, #160	@ 0xa0
c0de62b2:	463c      	mov	r4, r7
c0de62b4:	2301      	movs	r3, #1
c0de62b6:	74f8      	strb	r0, [r7, #19]
c0de62b8:	2001      	movs	r0, #1
c0de62ba:	713a      	strb	r2, [r7, #4]
c0de62bc:	0e0a      	lsrs	r2, r1, #24
c0de62be:	7178      	strb	r0, [r7, #5]
c0de62c0:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de62c4:	200b      	movs	r0, #11
c0de62c6:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de62ca:	2005      	movs	r0, #5
c0de62cc:	f887 0020 	strb.w	r0, [r7, #32]
c0de62d0:	2008      	movs	r0, #8
c0de62d2:	75b8      	strb	r0, [r7, #22]
c0de62d4:	4638      	mov	r0, r7
c0de62d6:	f000 fafa 	bl	c0de68ce <OUTLINED_FUNCTION_13>
c0de62da:	0e2a      	lsrs	r2, r5, #24
c0de62dc:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de62e0:	2010      	movs	r0, #16
c0de62e2:	f804 0f19 	strb.w	r0, [r4, #25]!
c0de62e6:	4638      	mov	r0, r7
c0de62e8:	f800 5f12 	strb.w	r5, [r0, #18]!
c0de62ec:	7066      	strb	r6, [r4, #1]
c0de62ee:	70c2      	strb	r2, [r0, #3]
c0de62f0:	0c2a      	lsrs	r2, r5, #16
c0de62f2:	7082      	strb	r2, [r0, #2]
c0de62f4:	200b      	movs	r0, #11
c0de62f6:	f000 fc6e 	bl	c0de6bd6 <OUTLINED_FUNCTION_51>
c0de62fa:	0a01      	lsrs	r1, r0, #8
c0de62fc:	7862      	ldrb	r2, [r4, #1]
c0de62fe:	71b8      	strb	r0, [r7, #6]
c0de6300:	f887 6021 	strb.w	r6, [r7, #33]	@ 0x21
c0de6304:	71f9      	strb	r1, [r7, #7]
c0de6306:	7821      	ldrb	r1, [r4, #0]
c0de6308:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de630c:	eb01 0c00 	add.w	ip, r1, r0
c0de6310:	4659      	mov	r1, fp
c0de6312:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6316:	f811 3d1c 	ldrb.w	r3, [r1, #-28]!
c0de631a:	784c      	ldrb	r4, [r1, #1]
c0de631c:	7f4d      	ldrb	r5, [r1, #29]
c0de631e:	7f8e      	ldrb	r6, [r1, #30]
c0de6320:	7fc8      	ldrb	r0, [r1, #31]
c0de6322:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de6326:	ea42 2205 	orr.w	r2, r2, r5, lsl #8
c0de632a:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de632e:	4463      	add	r3, ip
c0de6330:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de6334:	700b      	strb	r3, [r1, #0]
c0de6336:	6087      	str	r7, [r0, #8]
c0de6338:	0a18      	lsrs	r0, r3, #8
c0de633a:	7048      	strb	r0, [r1, #1]
c0de633c:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de6340:	f000 fa95 	bl	c0de686e <OUTLINED_FUNCTION_10>
c0de6344:	f840 b022 	str.w	fp, [r0, r2, lsl #2]
c0de6348:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de634c:	f000 fa00 	bl	c0de6750 <OUTLINED_FUNCTION_1>
c0de6350:	9802      	ldr	r0, [sp, #8]
c0de6352:	28ff      	cmp	r0, #255	@ 0xff
c0de6354:	d00c      	beq.n	c0de6370 <nbgl_layoutAddSpinner+0x23c>
c0de6356:	f44f 70c8 	mov.w	r0, #400	@ 0x190
c0de635a:	e9cd 0006 	strd	r0, r0, [sp, #24]
c0de635e:	4809      	ldr	r0, [pc, #36]	@ (c0de6384 <nbgl_layoutAddSpinner+0x250>)
c0de6360:	4478      	add	r0, pc
c0de6362:	9005      	str	r0, [sp, #20]
c0de6364:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de6368:	a905      	add	r1, sp, #20
c0de636a:	08c0      	lsrs	r0, r0, #3
c0de636c:	f004 fb13 	bl	c0dea996 <nbgl_screenUpdateTicker>
c0de6370:	2000      	movs	r0, #0
c0de6372:	e001      	b.n	c0de6378 <nbgl_layoutAddSpinner+0x244>
c0de6374:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de6378:	b008      	add	sp, #32
c0de637a:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de637e:	bf00      	nop
c0de6380:	00004855 	.word	0x00004855
c0de6384:	00000025 	.word	0x00000025

c0de6388 <spinnerTickerCallback>:
c0de6388:	b570      	push	{r4, r5, r6, lr}
c0de638a:	4819      	ldr	r0, [pc, #100]	@ (c0de63f0 <spinnerTickerCallback+0x68>)
c0de638c:	4448      	add	r0, r9
c0de638e:	6840      	ldr	r0, [r0, #4]
c0de6390:	b120      	cbz	r0, c0de639c <spinnerTickerCallback+0x14>
c0de6392:	f890 10ae 	ldrb.w	r1, [r0, #174]	@ 0xae
c0de6396:	0209      	lsls	r1, r1, #8
c0de6398:	0449      	lsls	r1, r1, #17
c0de639a:	d400      	bmi.n	c0de639e <spinnerTickerCallback+0x16>
c0de639c:	bd70      	pop	{r4, r5, r6, pc}
c0de639e:	f8d0 10a0 	ldr.w	r1, [r0, #160]	@ 0xa0
c0de63a2:	2300      	movs	r3, #0
c0de63a4:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de63a8:	429a      	cmp	r2, r3
c0de63aa:	d0f7      	beq.n	c0de639c <spinnerTickerCallback+0x14>
c0de63ac:	4608      	mov	r0, r1
c0de63ae:	f000 fbdf 	bl	c0de6b70 <OUTLINED_FUNCTION_44>
c0de63b2:	f850 0023 	ldr.w	r0, [r0, r3, lsl #2]
c0de63b6:	7ec4      	ldrb	r4, [r0, #27]
c0de63b8:	2c01      	cmp	r4, #1
c0de63ba:	d108      	bne.n	c0de63ce <spinnerTickerCallback+0x46>
c0de63bc:	f890 4020 	ldrb.w	r4, [r0, #32]
c0de63c0:	b12c      	cbz	r4, c0de63ce <spinnerTickerCallback+0x46>
c0de63c2:	f000 fbd5 	bl	c0de6b70 <OUTLINED_FUNCTION_44>
c0de63c6:	6800      	ldr	r0, [r0, #0]
c0de63c8:	7ec4      	ldrb	r4, [r0, #27]
c0de63ca:	2c0d      	cmp	r4, #13
c0de63cc:	d001      	beq.n	c0de63d2 <spinnerTickerCallback+0x4a>
c0de63ce:	3301      	adds	r3, #1
c0de63d0:	e7ea      	b.n	c0de63a8 <spinnerTickerCallback+0x20>
c0de63d2:	7fc1      	ldrb	r1, [r0, #31]
c0de63d4:	3101      	adds	r1, #1
c0de63d6:	b2ca      	uxtb	r2, r1
c0de63d8:	3a04      	subs	r2, #4
c0de63da:	bf18      	it	ne
c0de63dc:	460a      	movne	r2, r1
c0de63de:	77c2      	strb	r2, [r0, #31]
c0de63e0:	f004 fabb 	bl	c0dea95a <nbgl_objDraw>
c0de63e4:	2004      	movs	r0, #4
c0de63e6:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de63ea:	f004 baa7 	b.w	c0dea93c <nbgl_refreshSpecial>
c0de63ee:	bf00      	nop
c0de63f0:	00001968 	.word	0x00001968

c0de63f4 <nbgl_layoutUpdateSpinner>:
c0de63f4:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de63f8:	2800      	cmp	r0, #0
c0de63fa:	f000 809a 	beq.w	c0de6532 <nbgl_layoutUpdateSpinner+0x13e>
c0de63fe:	f8d0 00a0 	ldr.w	r0, [r0, #160]	@ 0xa0
c0de6402:	460e      	mov	r6, r1
c0de6404:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de6408:	2900      	cmp	r1, #0
c0de640a:	f000 8092 	beq.w	c0de6532 <nbgl_layoutUpdateSpinner+0x13e>
c0de640e:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6412:	4615      	mov	r5, r2
c0de6414:	f000 fc42 	bl	c0de6c9c <OUTLINED_FUNCTION_66>
c0de6418:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de641c:	6807      	ldr	r7, [r0, #0]
c0de641e:	7ef8      	ldrb	r0, [r7, #27]
c0de6420:	2801      	cmp	r0, #1
c0de6422:	f040 8086 	bne.w	c0de6532 <nbgl_layoutUpdateSpinner+0x13e>
c0de6426:	f897 0020 	ldrb.w	r0, [r7, #32]
c0de642a:	2802      	cmp	r0, #2
c0de642c:	f0c0 8081 	bcc.w	c0de6532 <nbgl_layoutUpdateSpinner+0x13e>
c0de6430:	4638      	mov	r0, r7
c0de6432:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6436:	f000 fc31 	bl	c0de6c9c <OUTLINED_FUNCTION_66>
c0de643a:	ea41 4100 	orr.w	r1, r1, r0, lsl #16
c0de643e:	6808      	ldr	r0, [r1, #0]
c0de6440:	7ec2      	ldrb	r2, [r0, #27]
c0de6442:	2a0d      	cmp	r2, #13
c0de6444:	d175      	bne.n	c0de6532 <nbgl_layoutUpdateSpinner+0x13e>
c0de6446:	7fc2      	ldrb	r2, [r0, #31]
c0de6448:	429a      	cmp	r2, r3
c0de644a:	d101      	bne.n	c0de6450 <nbgl_layoutUpdateSpinner+0x5c>
c0de644c:	2400      	movs	r4, #0
c0de644e:	e008      	b.n	c0de6462 <nbgl_layoutUpdateSpinner+0x6e>
c0de6450:	77c3      	strb	r3, [r0, #31]
c0de6452:	f004 fa82 	bl	c0dea95a <nbgl_objDraw>
c0de6456:	4638      	mov	r0, r7
c0de6458:	2401      	movs	r4, #1
c0de645a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de645e:	f000 fbc8 	bl	c0de6bf2 <OUTLINED_FUNCTION_53>
c0de6462:	f8d1 b004 	ldr.w	fp, [r1, #4]
c0de6466:	f89b 001b 	ldrb.w	r0, [fp, #27]
c0de646a:	2804      	cmp	r0, #4
c0de646c:	d161      	bne.n	c0de6532 <nbgl_layoutUpdateSpinner+0x13e>
c0de646e:	f000 fc22 	bl	c0de6cb6 <OUTLINED_FUNCTION_68>
c0de6472:	4606      	mov	r6, r0
c0de6474:	f004 ff08 	bl	c0deb288 <strlen>
c0de6478:	4680      	mov	r8, r0
c0de647a:	4658      	mov	r0, fp
c0de647c:	f810 1f26 	ldrb.w	r1, [r0, #38]!
c0de6480:	f000 fa2c 	bl	c0de68dc <OUTLINED_FUNCTION_14>
c0de6484:	ea41 4a00 	orr.w	sl, r1, r0, lsl #16
c0de6488:	4650      	mov	r0, sl
c0de648a:	f004 fefd 	bl	c0deb288 <strlen>
c0de648e:	4580      	cmp	r8, r0
c0de6490:	d105      	bne.n	c0de649e <nbgl_layoutUpdateSpinner+0xaa>
c0de6492:	4650      	mov	r0, sl
c0de6494:	4631      	mov	r1, r6
c0de6496:	4642      	mov	r2, r8
c0de6498:	f004 fe9e 	bl	c0deb1d8 <memcmp>
c0de649c:	b168      	cbz	r0, c0de64ba <nbgl_layoutUpdateSpinner+0xc6>
c0de649e:	4658      	mov	r0, fp
c0de64a0:	0e31      	lsrs	r1, r6, #24
c0de64a2:	f800 6f26 	strb.w	r6, [r0, #38]!
c0de64a6:	70c1      	strb	r1, [r0, #3]
c0de64a8:	0c31      	lsrs	r1, r6, #16
c0de64aa:	7081      	strb	r1, [r0, #2]
c0de64ac:	0a30      	lsrs	r0, r6, #8
c0de64ae:	f88b 0027 	strb.w	r0, [fp, #39]	@ 0x27
c0de64b2:	4658      	mov	r0, fp
c0de64b4:	f004 fa51 	bl	c0dea95a <nbgl_objDraw>
c0de64b8:	2402      	movs	r4, #2
c0de64ba:	b3e5      	cbz	r5, c0de6536 <nbgl_layoutUpdateSpinner+0x142>
c0de64bc:	f897 0020 	ldrb.w	r0, [r7, #32]
c0de64c0:	2803      	cmp	r0, #3
c0de64c2:	d136      	bne.n	c0de6532 <nbgl_layoutUpdateSpinner+0x13e>
c0de64c4:	f817 0f22 	ldrb.w	r0, [r7, #34]!
c0de64c8:	7879      	ldrb	r1, [r7, #1]
c0de64ca:	78ba      	ldrb	r2, [r7, #2]
c0de64cc:	78fb      	ldrb	r3, [r7, #3]
c0de64ce:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de64d2:	ea42 2103 	orr.w	r1, r2, r3, lsl #8
c0de64d6:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de64da:	6886      	ldr	r6, [r0, #8]
c0de64dc:	7ef0      	ldrb	r0, [r6, #27]
c0de64de:	2804      	cmp	r0, #4
c0de64e0:	d127      	bne.n	c0de6532 <nbgl_layoutUpdateSpinner+0x13e>
c0de64e2:	4628      	mov	r0, r5
c0de64e4:	f004 fc42 	bl	c0dead6c <pic>
c0de64e8:	4605      	mov	r5, r0
c0de64ea:	f004 fecd 	bl	c0deb288 <strlen>
c0de64ee:	4680      	mov	r8, r0
c0de64f0:	4630      	mov	r0, r6
c0de64f2:	f810 1f26 	ldrb.w	r1, [r0, #38]!
c0de64f6:	f000 f9f1 	bl	c0de68dc <OUTLINED_FUNCTION_14>
c0de64fa:	ea41 4700 	orr.w	r7, r1, r0, lsl #16
c0de64fe:	4638      	mov	r0, r7
c0de6500:	f004 fec2 	bl	c0deb288 <strlen>
c0de6504:	4580      	cmp	r8, r0
c0de6506:	d105      	bne.n	c0de6514 <nbgl_layoutUpdateSpinner+0x120>
c0de6508:	4638      	mov	r0, r7
c0de650a:	4629      	mov	r1, r5
c0de650c:	4642      	mov	r2, r8
c0de650e:	f004 fe63 	bl	c0deb1d8 <memcmp>
c0de6512:	b180      	cbz	r0, c0de6536 <nbgl_layoutUpdateSpinner+0x142>
c0de6514:	4630      	mov	r0, r6
c0de6516:	0e29      	lsrs	r1, r5, #24
c0de6518:	f800 5f26 	strb.w	r5, [r0, #38]!
c0de651c:	70c1      	strb	r1, [r0, #3]
c0de651e:	0c29      	lsrs	r1, r5, #16
c0de6520:	7081      	strb	r1, [r0, #2]
c0de6522:	0a28      	lsrs	r0, r5, #8
c0de6524:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de6528:	4630      	mov	r0, r6
c0de652a:	f004 fa16 	bl	c0dea95a <nbgl_objDraw>
c0de652e:	2402      	movs	r4, #2
c0de6530:	e001      	b.n	c0de6536 <nbgl_layoutUpdateSpinner+0x142>
c0de6532:	f04f 34ff 	mov.w	r4, #4294967295	@ 0xffffffff
c0de6536:	4620      	mov	r0, r4
c0de6538:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de653c <nbgl_layoutDraw>:
c0de653c:	b348      	cbz	r0, c0de6592 <nbgl_layoutDraw+0x56>
c0de653e:	b570      	push	{r4, r5, r6, lr}
c0de6540:	4604      	mov	r4, r0
c0de6542:	6980      	ldr	r0, [r0, #24]
c0de6544:	b128      	cbz	r0, c0de6552 <nbgl_layoutDraw+0x16>
c0de6546:	f000 fa1f 	bl	c0de6988 <OUTLINED_FUNCTION_22>
c0de654a:	f8d4 00a0 	ldr.w	r0, [r4, #160]	@ 0xa0
c0de654e:	f000 f8ff 	bl	c0de6750 <OUTLINED_FUNCTION_1>
c0de6552:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de6556:	f894 10ae 	ldrb.w	r1, [r4, #174]	@ 0xae
c0de655a:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de655e:	0781      	lsls	r1, r0, #30
c0de6560:	d513      	bpl.n	c0de658a <nbgl_layoutDraw+0x4e>
c0de6562:	b2c0      	uxtb	r0, r0
c0de6564:	f000 fb88 	bl	c0de6c78 <OUTLINED_FUNCTION_63>
c0de6568:	2102      	movs	r1, #2
c0de656a:	2301      	movs	r3, #1
c0de656c:	2258      	movs	r2, #88	@ 0x58
c0de656e:	7182      	strb	r2, [r0, #6]
c0de6570:	71c1      	strb	r1, [r0, #7]
c0de6572:	f880 1020 	strb.w	r1, [r0, #32]
c0de6576:	2104      	movs	r1, #4
c0de6578:	7103      	strb	r3, [r0, #4]
c0de657a:	2200      	movs	r2, #0
c0de657c:	f880 3021 	strb.w	r3, [r0, #33]	@ 0x21
c0de6580:	7581      	strb	r1, [r0, #22]
c0de6582:	68a1      	ldr	r1, [r4, #8]
c0de6584:	7142      	strb	r2, [r0, #5]
c0de6586:	77c2      	strb	r2, [r0, #31]
c0de6588:	6148      	str	r0, [r1, #20]
c0de658a:	f004 f9fa 	bl	c0dea982 <nbgl_screenRedraw>
c0de658e:	2000      	movs	r0, #0
c0de6590:	bd70      	pop	{r4, r5, r6, pc}
c0de6592:	f000 ba95 	b.w	c0de6ac0 <OUTLINED_FUNCTION_35>
	...

c0de6598 <nbgl_layoutRelease>:
c0de6598:	b510      	push	{r4, lr}
c0de659a:	b138      	cbz	r0, c0de65ac <nbgl_layoutRelease+0x14>
c0de659c:	f000 fbc4 	bl	c0de6d28 <OUTLINED_FUNCTION_79>
c0de65a0:	f894 10ae 	ldrb.w	r1, [r4, #174]	@ 0xae
c0de65a4:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de65a8:	0441      	lsls	r1, r0, #17
c0de65aa:	d402      	bmi.n	c0de65b2 <nbgl_layoutRelease+0x1a>
c0de65ac:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de65b0:	bd10      	pop	{r4, pc}
c0de65b2:	07c1      	lsls	r1, r0, #31
c0de65b4:	d014      	beq.n	c0de65e0 <nbgl_layoutRelease+0x48>
c0de65b6:	b2c0      	uxtb	r0, r0
c0de65b8:	08c0      	lsrs	r0, r0, #3
c0de65ba:	f004 f9e7 	bl	c0dea98c <nbgl_screenPop>
c0de65be:	480d      	ldr	r0, [pc, #52]	@ (c0de65f4 <nbgl_layoutRelease+0x5c>)
c0de65c0:	eb09 0100 	add.w	r1, r9, r0
c0de65c4:	6849      	ldr	r1, [r1, #4]
c0de65c6:	42a1      	cmp	r1, r4
c0de65c8:	d005      	beq.n	c0de65d6 <nbgl_layoutRelease+0x3e>
c0de65ca:	e9d4 0100 	ldrd	r0, r1, [r4]
c0de65ce:	6008      	str	r0, [r1, #0]
c0de65d0:	6820      	ldr	r0, [r4, #0]
c0de65d2:	6041      	str	r1, [r0, #4]
c0de65d4:	e004      	b.n	c0de65e0 <nbgl_layoutRelease+0x48>
c0de65d6:	6861      	ldr	r1, [r4, #4]
c0de65d8:	4448      	add	r0, r9
c0de65da:	6041      	str	r1, [r0, #4]
c0de65dc:	2000      	movs	r0, #0
c0de65de:	6008      	str	r0, [r1, #0]
c0de65e0:	f814 0fad 	ldrb.w	r0, [r4, #173]!
c0de65e4:	7861      	ldrb	r1, [r4, #1]
c0de65e6:	7020      	strb	r0, [r4, #0]
c0de65e8:	2000      	movs	r0, #0
c0de65ea:	f001 01bf 	and.w	r1, r1, #191	@ 0xbf
c0de65ee:	7061      	strb	r1, [r4, #1]
c0de65f0:	bd10      	pop	{r4, pc}
c0de65f2:	bf00      	nop
c0de65f4:	00001968 	.word	0x00001968

c0de65f8 <getLayoutAndLayoutObj>:
c0de65f8:	b570      	push	{r4, r5, r6, lr}
c0de65fa:	4c11      	ldr	r4, [pc, #68]	@ (c0de6640 <getLayoutAndLayoutObj+0x48>)
c0de65fc:	2300      	movs	r3, #0
c0de65fe:	600b      	str	r3, [r1, #0]
c0de6600:	444c      	add	r4, r9
c0de6602:	6864      	ldr	r4, [r4, #4]
c0de6604:	b1d4      	cbz	r4, c0de663c <getLayoutAndLayoutObj+0x44>
c0de6606:	f894 30ad 	ldrb.w	r3, [r4, #173]	@ 0xad
c0de660a:	f894 50ae 	ldrb.w	r5, [r4, #174]	@ 0xae
c0de660e:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0de6612:	045d      	lsls	r5, r3, #17
c0de6614:	d401      	bmi.n	c0de661a <getLayoutAndLayoutObj+0x22>
c0de6616:	2300      	movs	r3, #0
c0de6618:	e010      	b.n	c0de663c <getLayoutAndLayoutObj+0x44>
c0de661a:	f44f 75fc 	mov.w	r5, #504	@ 0x1f8
c0de661e:	ea05 1553 	and.w	r5, r5, r3, lsr #5
c0de6622:	2300      	movs	r3, #0
c0de6624:	429d      	cmp	r5, r3
c0de6626:	d0f6      	beq.n	c0de6616 <getLayoutAndLayoutObj+0x1e>
c0de6628:	18e6      	adds	r6, r4, r3
c0de662a:	3308      	adds	r3, #8
c0de662c:	6a36      	ldr	r6, [r6, #32]
c0de662e:	4286      	cmp	r6, r0
c0de6630:	d1f8      	bne.n	c0de6624 <getLayoutAndLayoutObj+0x2c>
c0de6632:	18e0      	adds	r0, r4, r3
c0de6634:	2301      	movs	r3, #1
c0de6636:	600c      	str	r4, [r1, #0]
c0de6638:	3018      	adds	r0, #24
c0de663a:	6010      	str	r0, [r2, #0]
c0de663c:	4618      	mov	r0, r3
c0de663e:	bd70      	pop	{r4, r5, r6, pc}
c0de6640:	00001968 	.word	0x00001968

c0de6644 <animTickerCallback>:
c0de6644:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de6646:	483f      	ldr	r0, [pc, #252]	@ (c0de6744 <animTickerCallback+0x100>)
c0de6648:	4448      	add	r0, r9
c0de664a:	6842      	ldr	r2, [r0, #4]
c0de664c:	b3b2      	cbz	r2, c0de66bc <animTickerCallback+0x78>
c0de664e:	f892 00ad 	ldrb.w	r0, [r2, #173]	@ 0xad
c0de6652:	f892 10ae 	ldrb.w	r1, [r2, #174]	@ 0xae
c0de6656:	ea40 2e01 	orr.w	lr, r0, r1, lsl #8
c0de665a:	ea5f 404e 	movs.w	r0, lr, lsl #17
c0de665e:	d52d      	bpl.n	c0de66bc <animTickerCallback+0x78>
c0de6660:	f8d2 c0a4 	ldr.w	ip, [r2, #164]	@ 0xa4
c0de6664:	f1bc 0f00 	cmp.w	ip, #0
c0de6668:	d028      	beq.n	c0de66bc <animTickerCallback+0x78>
c0de666a:	f8d2 40a0 	ldr.w	r4, [r2, #160]	@ 0xa0
c0de666e:	2600      	movs	r6, #0
c0de6670:	f894 5020 	ldrb.w	r5, [r4, #32]
c0de6674:	42b5      	cmp	r5, r6
c0de6676:	d021      	beq.n	c0de66bc <animTickerCallback+0x78>
c0de6678:	4620      	mov	r0, r4
c0de667a:	f810 7f22 	ldrb.w	r7, [r0, #34]!
c0de667e:	7841      	ldrb	r1, [r0, #1]
c0de6680:	7883      	ldrb	r3, [r0, #2]
c0de6682:	78c0      	ldrb	r0, [r0, #3]
c0de6684:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de6688:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de668c:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de6690:	f850 0026 	ldr.w	r0, [r0, r6, lsl #2]
c0de6694:	7ec1      	ldrb	r1, [r0, #27]
c0de6696:	2901      	cmp	r1, #1
c0de6698:	d10e      	bne.n	c0de66b8 <animTickerCallback+0x74>
c0de669a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de669e:	7843      	ldrb	r3, [r0, #1]
c0de66a0:	7887      	ldrb	r7, [r0, #2]
c0de66a2:	78c0      	ldrb	r0, [r0, #3]
c0de66a4:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de66a8:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de66ac:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de66b0:	6840      	ldr	r0, [r0, #4]
c0de66b2:	7ec1      	ldrb	r1, [r0, #27]
c0de66b4:	2902      	cmp	r1, #2
c0de66b6:	d002      	beq.n	c0de66be <animTickerCallback+0x7a>
c0de66b8:	3601      	adds	r6, #1
c0de66ba:	e7db      	b.n	c0de6674 <animTickerCallback+0x30>
c0de66bc:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de66be:	f89c 1005 	ldrb.w	r1, [ip, #5]
c0de66c2:	b171      	cbz	r1, c0de66e2 <animTickerCallback+0x9e>
c0de66c4:	f892 40af 	ldrb.w	r4, [r2, #175]	@ 0xaf
c0de66c8:	ea5f 714e 	movs.w	r1, lr, lsl #29
c0de66cc:	d504      	bpl.n	c0de66d8 <animTickerCallback+0x94>
c0de66ce:	f89c 1004 	ldrb.w	r1, [ip, #4]
c0de66d2:	3901      	subs	r1, #1
c0de66d4:	42a1      	cmp	r1, r4
c0de66d6:	dd0e      	ble.n	c0de66f6 <animTickerCallback+0xb2>
c0de66d8:	b9ac      	cbnz	r4, c0de6706 <animTickerCallback+0xc2>
c0de66da:	f04e 0e04 	orr.w	lr, lr, #4
c0de66de:	2400      	movs	r4, #0
c0de66e0:	e00b      	b.n	c0de66fa <animTickerCallback+0xb6>
c0de66e2:	f89c 1004 	ldrb.w	r1, [ip, #4]
c0de66e6:	f892 30af 	ldrb.w	r3, [r2, #175]	@ 0xaf
c0de66ea:	3901      	subs	r1, #1
c0de66ec:	4299      	cmp	r1, r3
c0de66ee:	bf14      	ite	ne
c0de66f0:	3301      	addne	r3, #1
c0de66f2:	2300      	moveq	r3, #0
c0de66f4:	e00c      	b.n	c0de6710 <animTickerCallback+0xcc>
c0de66f6:	f02e 0e04 	bic.w	lr, lr, #4
c0de66fa:	ea4f 211e 	mov.w	r1, lr, lsr #8
c0de66fe:	f882 e0ad 	strb.w	lr, [r2, #173]	@ 0xad
c0de6702:	f882 10ae 	strb.w	r1, [r2, #174]	@ 0xae
c0de6706:	ea5f 714e 	movs.w	r1, lr, lsl #29
c0de670a:	bf54      	ite	pl
c0de670c:	1e63      	subpl	r3, r4, #1
c0de670e:	1c63      	addmi	r3, r4, #1
c0de6710:	f882 30af 	strb.w	r3, [r2, #175]	@ 0xaf
c0de6714:	f8dc 2000 	ldr.w	r2, [ip]
c0de6718:	b2d9      	uxtb	r1, r3
c0de671a:	f852 1021 	ldr.w	r1, [r2, r1, lsl #2]
c0de671e:	4602      	mov	r2, r0
c0de6720:	f802 1f21 	strb.w	r1, [r2, #33]!
c0de6724:	0e0b      	lsrs	r3, r1, #24
c0de6726:	70d3      	strb	r3, [r2, #3]
c0de6728:	0c0b      	lsrs	r3, r1, #16
c0de672a:	0a09      	lsrs	r1, r1, #8
c0de672c:	7093      	strb	r3, [r2, #2]
c0de672e:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de6732:	f004 f912 	bl	c0dea95a <nbgl_objDraw>
c0de6736:	2004      	movs	r0, #4
c0de6738:	2101      	movs	r1, #1
c0de673a:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de673e:	f004 b902 	b.w	c0dea946 <nbgl_refreshSpecialWithPostRefresh>
c0de6742:	bf00      	nop
c0de6744:	00001968 	.word	0x00001968

c0de6748 <OUTLINED_FUNCTION_0>:
c0de6748:	08c1      	lsrs	r1, r0, #3
c0de674a:	2004      	movs	r0, #4
c0de674c:	f004 b92d 	b.w	c0dea9aa <nbgl_objPoolGet>

c0de6750 <OUTLINED_FUNCTION_1>:
c0de6750:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de6754:	3101      	adds	r1, #1
c0de6756:	f880 1020 	strb.w	r1, [r0, #32]
c0de675a:	4770      	bx	lr

c0de675c <OUTLINED_FUNCTION_2>:
c0de675c:	2202      	movs	r2, #2
c0de675e:	75ba      	strb	r2, [r7, #22]
c0de6760:	4642      	mov	r2, r8
c0de6762:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de6766:	7854      	ldrb	r4, [r2, #1]
c0de6768:	7895      	ldrb	r5, [r2, #2]
c0de676a:	78d2      	ldrb	r2, [r2, #3]
c0de676c:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de6770:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0de6774:	7ebc      	ldrb	r4, [r7, #26]
c0de6776:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de677a:	7e7b      	ldrb	r3, [r7, #25]
c0de677c:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de6780:	2400      	movs	r4, #0
c0de6782:	4770      	bx	lr

c0de6784 <OUTLINED_FUNCTION_3>:
c0de6784:	713a      	strb	r2, [r7, #4]
c0de6786:	0e0a      	lsrs	r2, r1, #24
c0de6788:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de678c:	2005      	movs	r0, #5
c0de678e:	f887 0020 	strb.w	r0, [r7, #32]
c0de6792:	4638      	mov	r0, r7
c0de6794:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de6798:	70c2      	strb	r2, [r0, #3]
c0de679a:	0c0a      	lsrs	r2, r1, #16
c0de679c:	7082      	strb	r2, [r0, #2]
c0de679e:	0a08      	lsrs	r0, r1, #8
c0de67a0:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de67a4:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de67a8:	4770      	bx	lr

c0de67aa <OUTLINED_FUNCTION_4>:
c0de67aa:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de67ae:	784e      	ldrb	r6, [r1, #1]
c0de67b0:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de67b4:	788f      	ldrb	r7, [r1, #2]
c0de67b6:	78c9      	ldrb	r1, [r1, #3]
c0de67b8:	ea42 2206 	orr.w	r2, r2, r6, lsl #8
c0de67bc:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de67c0:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de67c4:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
c0de67c8:	4770      	bx	lr

c0de67ca <OUTLINED_FUNCTION_5>:
c0de67ca:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de67ce:	70c2      	strb	r2, [r0, #3]
c0de67d0:	0c0a      	lsrs	r2, r1, #16
c0de67d2:	7082      	strb	r2, [r0, #2]
c0de67d4:	0a08      	lsrs	r0, r1, #8
c0de67d6:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de67da:	f885 0027 	strb.w	r0, [r5, #39]	@ 0x27
c0de67de:	200b      	movs	r0, #11
c0de67e0:	f004 b8fc 	b.w	c0dea9dc <nbgl_getTextHeightInWidth>

c0de67e4 <OUTLINED_FUNCTION_6>:
c0de67e4:	4620      	mov	r0, r4
c0de67e6:	4631      	mov	r1, r6
c0de67e8:	f7fc bc8c 	b.w	c0de3104 <layoutAddCallbackObj>

c0de67ec <OUTLINED_FUNCTION_7>:
c0de67ec:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de67f0:	70ca      	strb	r2, [r1, #3]
c0de67f2:	0c02      	lsrs	r2, r0, #16
c0de67f4:	0a00      	lsrs	r0, r0, #8
c0de67f6:	708a      	strb	r2, [r1, #2]
c0de67f8:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de67fc:	68e0      	ldr	r0, [r4, #12]
c0de67fe:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6802:	7843      	ldrb	r3, [r0, #1]
c0de6804:	f810 cc02 	ldrb.w	ip, [r0, #-2]
c0de6808:	7882      	ldrb	r2, [r0, #2]
c0de680a:	78c0      	ldrb	r0, [r0, #3]
c0de680c:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de6810:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de6814:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de6818:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de681c:	200c      	movs	r0, #12
c0de681e:	4770      	bx	lr

c0de6820 <OUTLINED_FUNCTION_8>:
c0de6820:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6824:	784c      	ldrb	r4, [r1, #1]
c0de6826:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de682a:	788d      	ldrb	r5, [r1, #2]
c0de682c:	78c9      	ldrb	r1, [r1, #3]
c0de682e:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de6832:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de6836:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de683a:	4770      	bx	lr

c0de683c <OUTLINED_FUNCTION_9>:
c0de683c:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de6840:	70ca      	strb	r2, [r1, #3]
c0de6842:	0c02      	lsrs	r2, r0, #16
c0de6844:	0a00      	lsrs	r0, r0, #8
c0de6846:	708a      	strb	r2, [r1, #2]
c0de6848:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de684c:	68e0      	ldr	r0, [r4, #12]
c0de684e:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6852:	7843      	ldrb	r3, [r0, #1]
c0de6854:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de6858:	7887      	ldrb	r7, [r0, #2]
c0de685a:	78c0      	ldrb	r0, [r0, #3]
c0de685c:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de6860:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de6864:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de6868:	f840 6022 	str.w	r6, [r0, r2, lsl #2]
c0de686c:	4770      	bx	lr

c0de686e <OUTLINED_FUNCTION_10>:
c0de686e:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6872:	7843      	ldrb	r3, [r0, #1]
c0de6874:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de6878:	7884      	ldrb	r4, [r0, #2]
c0de687a:	78c0      	ldrb	r0, [r0, #3]
c0de687c:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de6880:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de6884:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de6888:	4770      	bx	lr

c0de688a <OUTLINED_FUNCTION_11>:
c0de688a:	784b      	ldrb	r3, [r1, #1]
c0de688c:	788e      	ldrb	r6, [r1, #2]
c0de688e:	78c9      	ldrb	r1, [r1, #3]
c0de6890:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6894:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de6898:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de689c:	4770      	bx	lr

c0de689e <OUTLINED_FUNCTION_12>:
c0de689e:	70ca      	strb	r2, [r1, #3]
c0de68a0:	0c02      	lsrs	r2, r0, #16
c0de68a2:	0a00      	lsrs	r0, r0, #8
c0de68a4:	708a      	strb	r2, [r1, #2]
c0de68a6:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de68aa:	6920      	ldr	r0, [r4, #16]
c0de68ac:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de68b0:	7843      	ldrb	r3, [r0, #1]
c0de68b2:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de68b6:	7887      	ldrb	r7, [r0, #2]
c0de68b8:	78c0      	ldrb	r0, [r0, #3]
c0de68ba:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de68be:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de68c2:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de68c6:	f840 6022 	str.w	r6, [r0, r2, lsl #2]
c0de68ca:	200c      	movs	r0, #12
c0de68cc:	4770      	bx	lr

c0de68ce <OUTLINED_FUNCTION_13>:
c0de68ce:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de68d2:	70c2      	strb	r2, [r0, #3]
c0de68d4:	0c0a      	lsrs	r2, r1, #16
c0de68d6:	7082      	strb	r2, [r0, #2]
c0de68d8:	0a08      	lsrs	r0, r1, #8
c0de68da:	4770      	bx	lr

c0de68dc <OUTLINED_FUNCTION_14>:
c0de68dc:	7842      	ldrb	r2, [r0, #1]
c0de68de:	7883      	ldrb	r3, [r0, #2]
c0de68e0:	78c0      	ldrb	r0, [r0, #3]
c0de68e2:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de68e6:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de68ea:	4770      	bx	lr

c0de68ec <OUTLINED_FUNCTION_15>:
c0de68ec:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de68f0:	70ca      	strb	r2, [r1, #3]
c0de68f2:	0c02      	lsrs	r2, r0, #16
c0de68f4:	0a00      	lsrs	r0, r0, #8
c0de68f6:	708a      	strb	r2, [r1, #2]
c0de68f8:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de68fc:	6920      	ldr	r0, [r4, #16]
c0de68fe:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6902:	7843      	ldrb	r3, [r0, #1]
c0de6904:	f810 cc02 	ldrb.w	ip, [r0, #-2]
c0de6908:	7882      	ldrb	r2, [r0, #2]
c0de690a:	78c0      	ldrb	r0, [r0, #3]
c0de690c:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de6910:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de6914:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de6918:	4770      	bx	lr

c0de691a <OUTLINED_FUNCTION_16>:
c0de691a:	08c1      	lsrs	r1, r0, #3
c0de691c:	2001      	movs	r0, #1
c0de691e:	f004 b844 	b.w	c0dea9aa <nbgl_objPoolGet>

c0de6922 <OUTLINED_FUNCTION_17>:
c0de6922:	08c1      	lsrs	r1, r0, #3
c0de6924:	2005      	movs	r0, #5
c0de6926:	f004 b840 	b.w	c0dea9aa <nbgl_objPoolGet>

c0de692a <OUTLINED_FUNCTION_18>:
c0de692a:	6920      	ldr	r0, [r4, #16]
c0de692c:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6930:	7843      	ldrb	r3, [r0, #1]
c0de6932:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de6936:	7887      	ldrb	r7, [r0, #2]
c0de6938:	78c0      	ldrb	r0, [r0, #3]
c0de693a:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de693e:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de6942:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de6946:	f840 6022 	str.w	r6, [r0, r2, lsl #2]
c0de694a:	200c      	movs	r0, #12
c0de694c:	f886 801c 	strb.w	r8, [r6, #28]
c0de6950:	4770      	bx	lr

c0de6952 <OUTLINED_FUNCTION_19>:
c0de6952:	0a39      	lsrs	r1, r7, #8
c0de6954:	0e02      	lsrs	r2, r0, #24
c0de6956:	74e9      	strb	r1, [r5, #19]
c0de6958:	4629      	mov	r1, r5
c0de695a:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de695e:	70ca      	strb	r2, [r1, #3]
c0de6960:	0c02      	lsrs	r2, r0, #16
c0de6962:	0a00      	lsrs	r0, r0, #8
c0de6964:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de6968:	4628      	mov	r0, r5
c0de696a:	708a      	strb	r2, [r1, #2]
c0de696c:	0e3a      	lsrs	r2, r7, #24
c0de696e:	f800 7f12 	strb.w	r7, [r0, #18]!
c0de6972:	70c2      	strb	r2, [r0, #3]
c0de6974:	0c3a      	lsrs	r2, r7, #16
c0de6976:	7082      	strb	r2, [r0, #2]
c0de6978:	4770      	bx	lr

c0de697a <OUTLINED_FUNCTION_20>:
c0de697a:	4631      	mov	r1, r6
c0de697c:	f7fc bbc2 	b.w	c0de3104 <layoutAddCallbackObj>

c0de6980 <OUTLINED_FUNCTION_21>:
c0de6980:	08c1      	lsrs	r1, r0, #3
c0de6982:	2002      	movs	r0, #2
c0de6984:	f004 b811 	b.w	c0dea9aa <nbgl_objPoolGet>

c0de6988 <OUTLINED_FUNCTION_22>:
c0de6988:	f8d4 10a0 	ldr.w	r1, [r4, #160]	@ 0xa0
c0de698c:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6990:	784d      	ldrb	r5, [r1, #1]
c0de6992:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de6996:	788e      	ldrb	r6, [r1, #2]
c0de6998:	78c9      	ldrb	r1, [r1, #3]
c0de699a:	ea42 2205 	orr.w	r2, r2, r5, lsl #8
c0de699e:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de69a2:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de69a6:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
c0de69aa:	4770      	bx	lr

c0de69ac <OUTLINED_FUNCTION_23>:
c0de69ac:	6868      	ldr	r0, [r5, #4]
c0de69ae:	f004 b9dd 	b.w	c0dead6c <pic>

c0de69b2 <OUTLINED_FUNCTION_24>:
c0de69b2:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de69b6:	784c      	ldrb	r4, [r1, #1]
c0de69b8:	f811 cc02 	ldrb.w	ip, [r1, #-2]
c0de69bc:	788b      	ldrb	r3, [r1, #2]
c0de69be:	78c9      	ldrb	r1, [r1, #3]
c0de69c0:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de69c4:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de69c8:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de69cc:	f841 702c 	str.w	r7, [r1, ip, lsl #2]
c0de69d0:	4770      	bx	lr

c0de69d2 <OUTLINED_FUNCTION_25>:
c0de69d2:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de69d6:	08c0      	lsrs	r0, r0, #3
c0de69d8:	f7fe baa8 	b.w	c0de4f2c <createHorizontalLine>

c0de69dc <OUTLINED_FUNCTION_26>:
c0de69dc:	75aa      	strb	r2, [r5, #22]
c0de69de:	1c5a      	adds	r2, r3, #1
c0de69e0:	788b      	ldrb	r3, [r1, #2]
c0de69e2:	f800 2c02 	strb.w	r2, [r0, #-2]
c0de69e6:	780a      	ldrb	r2, [r1, #0]
c0de69e8:	f895 0022 	ldrb.w	r0, [r5, #34]	@ 0x22
c0de69ec:	78c9      	ldrb	r1, [r1, #3]
c0de69ee:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de69f2:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de69f6:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de69fa:	4770      	bx	lr

c0de69fc <OUTLINED_FUNCTION_27>:
c0de69fc:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6a00:	7843      	ldrb	r3, [r0, #1]
c0de6a02:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de6a06:	7884      	ldrb	r4, [r0, #2]
c0de6a08:	78c0      	ldrb	r0, [r0, #3]
c0de6a0a:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de6a0e:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de6a12:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de6a16:	f840 a022 	str.w	sl, [r0, r2, lsl #2]
c0de6a1a:	4770      	bx	lr

c0de6a1c <OUTLINED_FUNCTION_28>:
c0de6a1c:	f801 0f25 	strb.w	r0, [r1, #37]!
c0de6a20:	70ca      	strb	r2, [r1, #3]
c0de6a22:	0c02      	lsrs	r2, r0, #16
c0de6a24:	0a00      	lsrs	r0, r0, #8
c0de6a26:	708a      	strb	r2, [r1, #2]
c0de6a28:	f886 0026 	strb.w	r0, [r6, #38]	@ 0x26
c0de6a2c:	4770      	bx	lr

c0de6a2e <OUTLINED_FUNCTION_29>:
c0de6a2e:	4450      	add	r0, sl
c0de6a30:	3101      	adds	r1, #1
c0de6a32:	f842 7024 	str.w	r7, [r2, r4, lsl #2]
c0de6a36:	eb00 0a03 	add.w	sl, r0, r3
c0de6a3a:	f888 1020 	strb.w	r1, [r8, #32]
c0de6a3e:	4770      	bx	lr

c0de6a40 <OUTLINED_FUNCTION_30>:
c0de6a40:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de6a44:	4630      	mov	r0, r6
c0de6a46:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de6a4a:	70c2      	strb	r2, [r0, #3]
c0de6a4c:	0c0a      	lsrs	r2, r1, #16
c0de6a4e:	7082      	strb	r2, [r0, #2]
c0de6a50:	0a08      	lsrs	r0, r1, #8
c0de6a52:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de6a56:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de6a5a:	200b      	movs	r0, #11
c0de6a5c:	4770      	bx	lr

c0de6a5e <OUTLINED_FUNCTION_31>:
c0de6a5e:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de6a62:	70ca      	strb	r2, [r1, #3]
c0de6a64:	0c02      	lsrs	r2, r0, #16
c0de6a66:	0a00      	lsrs	r0, r0, #8
c0de6a68:	708a      	strb	r2, [r1, #2]
c0de6a6a:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de6a6e:	4770      	bx	lr

c0de6a70 <OUTLINED_FUNCTION_32>:
c0de6a70:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6a74:	784e      	ldrb	r6, [r1, #1]
c0de6a76:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de6a7a:	788f      	ldrb	r7, [r1, #2]
c0de6a7c:	78c9      	ldrb	r1, [r1, #3]
c0de6a7e:	ea42 2206 	orr.w	r2, r2, r6, lsl #8
c0de6a82:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de6a86:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6a8a:	4770      	bx	lr

c0de6a8c <OUTLINED_FUNCTION_33>:
c0de6a8c:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6a90:	784c      	ldrb	r4, [r1, #1]
c0de6a92:	788e      	ldrb	r6, [r1, #2]
c0de6a94:	78cd      	ldrb	r5, [r1, #3]
c0de6a96:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de6a9a:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de6a9e:	ea46 2405 	orr.w	r4, r6, r5, lsl #8
c0de6aa2:	ea42 4204 	orr.w	r2, r2, r4, lsl #16
c0de6aa6:	4770      	bx	lr

c0de6aa8 <OUTLINED_FUNCTION_34>:
c0de6aa8:	f8da 00a0 	ldr.w	r0, [sl, #160]	@ 0xa0
c0de6aac:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de6ab0:	3101      	adds	r1, #1
c0de6ab2:	f880 1020 	strb.w	r1, [r0, #32]
c0de6ab6:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de6aba:	08c1      	lsrs	r1, r0, #3
c0de6abc:	2004      	movs	r0, #4
c0de6abe:	4730      	bx	r6

c0de6ac0 <OUTLINED_FUNCTION_35>:
c0de6ac0:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de6ac4:	4770      	bx	lr

c0de6ac6 <OUTLINED_FUNCTION_36>:
c0de6ac6:	77b0      	strb	r0, [r6, #30]
c0de6ac8:	6960      	ldr	r0, [r4, #20]
c0de6aca:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6ace:	7842      	ldrb	r2, [r0, #1]
c0de6ad0:	7883      	ldrb	r3, [r0, #2]
c0de6ad2:	78c0      	ldrb	r0, [r0, #3]
c0de6ad4:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de6ad8:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de6adc:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de6ae0:	4770      	bx	lr

c0de6ae2 <OUTLINED_FUNCTION_37>:
c0de6ae2:	4642      	mov	r2, r8
c0de6ae4:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de6ae8:	7854      	ldrb	r4, [r2, #1]
c0de6aea:	7895      	ldrb	r5, [r2, #2]
c0de6aec:	78d2      	ldrb	r2, [r2, #3]
c0de6aee:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0de6af2:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de6af6:	463d      	mov	r5, r7
c0de6af8:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de6afc:	4770      	bx	lr

c0de6afe <OUTLINED_FUNCTION_38>:
c0de6afe:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6b02:	7843      	ldrb	r3, [r0, #1]
c0de6b04:	7885      	ldrb	r5, [r0, #2]
c0de6b06:	78c6      	ldrb	r6, [r0, #3]
c0de6b08:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de6b0c:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de6b10:	ea45 2306 	orr.w	r3, r5, r6, lsl #8
c0de6b14:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
c0de6b18:	4770      	bx	lr

c0de6b1a <OUTLINED_FUNCTION_39>:
c0de6b1a:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de6b1e:	f896 0022 	ldrb.w	r0, [r6, #34]	@ 0x22
c0de6b22:	f040 0001 	orr.w	r0, r0, #1
c0de6b26:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de6b2a:	4630      	mov	r0, r6
c0de6b2c:	f003 bf15 	b.w	c0dea95a <nbgl_objDraw>

c0de6b30 <OUTLINED_FUNCTION_40>:
c0de6b30:	4620      	mov	r0, r4
c0de6b32:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6b36:	7842      	ldrb	r2, [r0, #1]
c0de6b38:	7883      	ldrb	r3, [r0, #2]
c0de6b3a:	78c0      	ldrb	r0, [r0, #3]
c0de6b3c:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de6b40:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de6b44:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de6b48:	4770      	bx	lr

c0de6b4a <OUTLINED_FUNCTION_41>:
c0de6b4a:	0e02      	lsrs	r2, r0, #24
c0de6b4c:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de6b50:	70ca      	strb	r2, [r1, #3]
c0de6b52:	0c02      	lsrs	r2, r0, #16
c0de6b54:	0a00      	lsrs	r0, r0, #8
c0de6b56:	708a      	strb	r2, [r1, #2]
c0de6b58:	4770      	bx	lr

c0de6b5a <OUTLINED_FUNCTION_42>:
c0de6b5a:	4601      	mov	r1, r0
c0de6b5c:	2001      	movs	r0, #1
c0de6b5e:	22a0      	movs	r2, #160	@ 0xa0
c0de6b60:	2301      	movs	r3, #1
c0de6b62:	7178      	strb	r0, [r7, #5]
c0de6b64:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de6b68:	4770      	bx	lr

c0de6b6a <OUTLINED_FUNCTION_43>:
c0de6b6a:	200b      	movs	r0, #11
c0de6b6c:	f003 bf36 	b.w	c0dea9dc <nbgl_getTextHeightInWidth>

c0de6b70 <OUTLINED_FUNCTION_44>:
c0de6b70:	f810 4f22 	ldrb.w	r4, [r0, #34]!
c0de6b74:	7845      	ldrb	r5, [r0, #1]
c0de6b76:	7886      	ldrb	r6, [r0, #2]
c0de6b78:	78c0      	ldrb	r0, [r0, #3]
c0de6b7a:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de6b7e:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de6b82:	ea44 4000 	orr.w	r0, r4, r0, lsl #16
c0de6b86:	4770      	bx	lr

c0de6b88 <OUTLINED_FUNCTION_45>:
c0de6b88:	70c2      	strb	r2, [r0, #3]
c0de6b8a:	0c0a      	lsrs	r2, r1, #16
c0de6b8c:	7082      	strb	r2, [r0, #2]
c0de6b8e:	0a08      	lsrs	r0, r1, #8
c0de6b90:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de6b94:	4770      	bx	lr

c0de6b96 <OUTLINED_FUNCTION_46>:
c0de6b96:	0a01      	lsrs	r1, r0, #8
c0de6b98:	71b8      	strb	r0, [r7, #6]
c0de6b9a:	71f9      	strb	r1, [r7, #7]
c0de6b9c:	f898 1020 	ldrb.w	r1, [r8, #32]
c0de6ba0:	2900      	cmp	r1, #0
c0de6ba2:	4770      	bx	lr

c0de6ba4 <OUTLINED_FUNCTION_47>:
c0de6ba4:	70ca      	strb	r2, [r1, #3]
c0de6ba6:	0c02      	lsrs	r2, r0, #16
c0de6ba8:	0a00      	lsrs	r0, r0, #8
c0de6baa:	708a      	strb	r2, [r1, #2]
c0de6bac:	4770      	bx	lr

c0de6bae <OUTLINED_FUNCTION_48>:
c0de6bae:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de6bb2:	ea42 2103 	orr.w	r1, r2, r3, lsl #8
c0de6bb6:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de6bba:	4770      	bx	lr

c0de6bbc <OUTLINED_FUNCTION_49>:
c0de6bbc:	68a8      	ldr	r0, [r5, #8]
c0de6bbe:	f004 b8d5 	b.w	c0dead6c <pic>

c0de6bc2 <OUTLINED_FUNCTION_50>:
c0de6bc2:	4630      	mov	r0, r6
c0de6bc4:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de6bc8:	70c2      	strb	r2, [r0, #3]
c0de6bca:	0c0a      	lsrs	r2, r1, #16
c0de6bcc:	7082      	strb	r2, [r0, #2]
c0de6bce:	0a08      	lsrs	r0, r1, #8
c0de6bd0:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de6bd4:	4770      	bx	lr

c0de6bd6 <OUTLINED_FUNCTION_51>:
c0de6bd6:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de6bda:	f003 beff 	b.w	c0dea9dc <nbgl_getTextHeightInWidth>

c0de6bde <OUTLINED_FUNCTION_52>:
c0de6bde:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de6be2:	0e0a      	lsrs	r2, r1, #24
c0de6be4:	70c2      	strb	r2, [r0, #3]
c0de6be6:	0c0a      	lsrs	r2, r1, #16
c0de6be8:	7082      	strb	r2, [r0, #2]
c0de6bea:	0a08      	lsrs	r0, r1, #8
c0de6bec:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de6bf0:	4770      	bx	lr

c0de6bf2 <OUTLINED_FUNCTION_53>:
c0de6bf2:	7842      	ldrb	r2, [r0, #1]
c0de6bf4:	7883      	ldrb	r3, [r0, #2]
c0de6bf6:	78c0      	ldrb	r0, [r0, #3]
c0de6bf8:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de6bfc:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de6c00:	ea41 4100 	orr.w	r1, r1, r0, lsl #16
c0de6c04:	4770      	bx	lr

c0de6c06 <OUTLINED_FUNCTION_54>:
c0de6c06:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de6c0a:	3201      	adds	r2, #1
c0de6c0c:	f881 2020 	strb.w	r2, [r1, #32]
c0de6c10:	b004      	add	sp, #16
c0de6c12:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de6c16 <OUTLINED_FUNCTION_55>:
c0de6c16:	7981      	ldrb	r1, [r0, #6]
c0de6c18:	79c0      	ldrb	r0, [r0, #7]
c0de6c1a:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de6c1e:	4770      	bx	lr

c0de6c20 <OUTLINED_FUNCTION_56>:
c0de6c20:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de6c24:	70ca      	strb	r2, [r1, #3]
c0de6c26:	0c02      	lsrs	r2, r0, #16
c0de6c28:	0a00      	lsrs	r0, r0, #8
c0de6c2a:	708a      	strb	r2, [r1, #2]
c0de6c2c:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de6c30:	4770      	bx	lr

c0de6c32 <OUTLINED_FUNCTION_57>:
c0de6c32:	f8d4 00a0 	ldr.w	r0, [r4, #160]	@ 0xa0
c0de6c36:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de6c3a:	3101      	adds	r1, #1
c0de6c3c:	f880 1020 	strb.w	r1, [r0, #32]
c0de6c40:	2000      	movs	r0, #0
c0de6c42:	4770      	bx	lr

c0de6c44 <OUTLINED_FUNCTION_58>:
c0de6c44:	4631      	mov	r1, r6
c0de6c46:	0e02      	lsrs	r2, r0, #24
c0de6c48:	f886 a01d 	strb.w	sl, [r6, #29]
c0de6c4c:	4770      	bx	lr

c0de6c4e <OUTLINED_FUNCTION_59>:
c0de6c4e:	f886 b01c 	strb.w	fp, [r6, #28]
c0de6c52:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de6c56:	2005      	movs	r0, #5
c0de6c58:	4770      	bx	lr

c0de6c5a <OUTLINED_FUNCTION_60>:
c0de6c5a:	70f1      	strb	r1, [r6, #3]
c0de6c5c:	0c01      	lsrs	r1, r0, #16
c0de6c5e:	0a00      	lsrs	r0, r0, #8
c0de6c60:	70b1      	strb	r1, [r6, #2]
c0de6c62:	4770      	bx	lr

c0de6c64 <OUTLINED_FUNCTION_61>:
c0de6c64:	f891 0020 	ldrb.w	r0, [r1, #32]
c0de6c68:	3001      	adds	r0, #1
c0de6c6a:	f881 0020 	strb.w	r0, [r1, #32]
c0de6c6e:	4770      	bx	lr

c0de6c70 <OUTLINED_FUNCTION_62>:
c0de6c70:	08c1      	lsrs	r1, r0, #3
c0de6c72:	2004      	movs	r0, #4
c0de6c74:	f003 be9e 	b.w	c0dea9b4 <nbgl_containerPoolGet>

c0de6c78 <OUTLINED_FUNCTION_63>:
c0de6c78:	08c1      	lsrs	r1, r0, #3
c0de6c7a:	2003      	movs	r0, #3
c0de6c7c:	f003 be95 	b.w	c0dea9aa <nbgl_objPoolGet>

c0de6c80 <OUTLINED_FUNCTION_64>:
c0de6c80:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de6c84:	08c1      	lsrs	r1, r0, #3
c0de6c86:	2005      	movs	r0, #5
c0de6c88:	f003 be94 	b.w	c0dea9b4 <nbgl_containerPoolGet>

c0de6c8c <OUTLINED_FUNCTION_65>:
c0de6c8c:	71d1      	strb	r1, [r2, #7]
c0de6c8e:	7190      	strb	r0, [r2, #6]
c0de6c90:	f892 0020 	ldrb.w	r0, [r2, #32]
c0de6c94:	3001      	adds	r0, #1
c0de6c96:	f882 0020 	strb.w	r0, [r2, #32]
c0de6c9a:	4770      	bx	lr

c0de6c9c <OUTLINED_FUNCTION_66>:
c0de6c9c:	7842      	ldrb	r2, [r0, #1]
c0de6c9e:	7884      	ldrb	r4, [r0, #2]
c0de6ca0:	78c0      	ldrb	r0, [r0, #3]
c0de6ca2:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de6ca6:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de6caa:	4770      	bx	lr

c0de6cac <OUTLINED_FUNCTION_67>:
c0de6cac:	7a2a      	ldrb	r2, [r5, #8]
c0de6cae:	7a6b      	ldrb	r3, [r5, #9]
c0de6cb0:	4620      	mov	r0, r4
c0de6cb2:	f7fc ba27 	b.w	c0de3104 <layoutAddCallbackObj>

c0de6cb6 <OUTLINED_FUNCTION_68>:
c0de6cb6:	4630      	mov	r0, r6
c0de6cb8:	f004 b858 	b.w	c0dead6c <pic>

c0de6cbc <OUTLINED_FUNCTION_69>:
c0de6cbc:	f801 7f12 	strb.w	r7, [r1, #18]!
c0de6cc0:	70ca      	strb	r2, [r1, #3]
c0de6cc2:	0c3a      	lsrs	r2, r7, #16
c0de6cc4:	708a      	strb	r2, [r1, #2]
c0de6cc6:	4770      	bx	lr

c0de6cc8 <OUTLINED_FUNCTION_70>:
c0de6cc8:	758a      	strb	r2, [r1, #22]
c0de6cca:	460a      	mov	r2, r1
c0de6ccc:	f802 0f22 	strb.w	r0, [r2, #34]!
c0de6cd0:	0c00      	lsrs	r0, r0, #16
c0de6cd2:	7090      	strb	r0, [r2, #2]
c0de6cd4:	4770      	bx	lr

c0de6cd6 <OUTLINED_FUNCTION_71>:
c0de6cd6:	f8bb 3020 	ldrh.w	r3, [fp, #32]
c0de6cda:	3318      	adds	r3, #24
c0de6cdc:	0a1c      	lsrs	r4, r3, #8
c0de6cde:	767b      	strb	r3, [r7, #25]
c0de6ce0:	76bc      	strb	r4, [r7, #26]
c0de6ce2:	4770      	bx	lr

c0de6ce4 <OUTLINED_FUNCTION_72>:
c0de6ce4:	f842 5023 	str.w	r5, [r2, r3, lsl #2]
c0de6ce8:	2200      	movs	r2, #0
c0de6cea:	762a      	strb	r2, [r5, #24]
c0de6cec:	2210      	movs	r2, #16
c0de6cee:	75ea      	strb	r2, [r5, #23]
c0de6cf0:	4770      	bx	lr

c0de6cf2 <OUTLINED_FUNCTION_73>:
c0de6cf2:	f88d 0010 	strb.w	r0, [sp, #16]
c0de6cf6:	8928      	ldrh	r0, [r5, #8]
c0de6cf8:	f8ad 000c 	strh.w	r0, [sp, #12]
c0de6cfc:	4640      	mov	r0, r8
c0de6cfe:	4770      	bx	lr

c0de6d00 <OUTLINED_FUNCTION_74>:
c0de6d00:	08c9      	lsrs	r1, r1, #3
c0de6d02:	f003 be57 	b.w	c0dea9b4 <nbgl_containerPoolGet>

c0de6d06 <OUTLINED_FUNCTION_75>:
c0de6d06:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de6d0a:	7893      	ldrb	r3, [r2, #2]
c0de6d0c:	78d2      	ldrb	r2, [r2, #3]
c0de6d0e:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de6d12:	4770      	bx	lr

c0de6d14 <OUTLINED_FUNCTION_76>:
c0de6d14:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de6d18:	ea43 2206 	orr.w	r2, r3, r6, lsl #8
c0de6d1c:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de6d20:	4770      	bx	lr

c0de6d22 <OUTLINED_FUNCTION_78>:
c0de6d22:	200d      	movs	r0, #13
c0de6d24:	f003 be5a 	b.w	c0dea9dc <nbgl_getTextHeightInWidth>

c0de6d28 <OUTLINED_FUNCTION_79>:
c0de6d28:	4604      	mov	r4, r0
c0de6d2a:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de6d2e:	4770      	bx	lr

c0de6d30 <OUTLINED_FUNCTION_80>:
c0de6d30:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de6d34:	08c1      	lsrs	r1, r0, #3
c0de6d36:	2004      	movs	r0, #4
c0de6d38:	4720      	bx	r4

c0de6d3a <OUTLINED_FUNCTION_81>:
c0de6d3a:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
c0de6d3e:	7802      	ldrb	r2, [r0, #0]
c0de6d40:	7840      	ldrb	r0, [r0, #1]
c0de6d42:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de6d46:	4770      	bx	lr

c0de6d48 <layoutNavigationCallback>:
c0de6d48:	b570      	push	{r4, r5, r6, lr}
c0de6d4a:	290a      	cmp	r1, #10
c0de6d4c:	d029      	beq.n	c0de6da2 <layoutNavigationCallback+0x5a>
c0de6d4e:	2909      	cmp	r1, #9
c0de6d50:	d02b      	beq.n	c0de6daa <layoutNavigationCallback+0x62>
c0de6d52:	2900      	cmp	r1, #0
c0de6d54:	d14a      	bne.n	c0de6dec <layoutNavigationCallback+0xa4>
c0de6d56:	4604      	mov	r4, r0
c0de6d58:	7bc1      	ldrb	r1, [r0, #15]
c0de6d5a:	f814 5f0e 	ldrb.w	r5, [r4, #14]!
c0de6d5e:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de6d62:	78a5      	ldrb	r5, [r4, #2]
c0de6d64:	78e4      	ldrb	r4, [r4, #3]
c0de6d66:	ea45 2404 	orr.w	r4, r5, r4, lsl #8
c0de6d6a:	ea41 4104 	orr.w	r1, r1, r4, lsl #16
c0de6d6e:	460d      	mov	r5, r1
c0de6d70:	f891 4023 	ldrb.w	r4, [r1, #35]	@ 0x23
c0de6d74:	f815 6f22 	ldrb.w	r6, [r5, #34]!
c0de6d78:	ea46 2404 	orr.w	r4, r6, r4, lsl #8
c0de6d7c:	78ae      	ldrb	r6, [r5, #2]
c0de6d7e:	78ed      	ldrb	r5, [r5, #3]
c0de6d80:	ea46 2505 	orr.w	r5, r6, r5, lsl #8
c0de6d84:	ea44 4405 	orr.w	r4, r4, r5, lsl #16
c0de6d88:	6825      	ldr	r5, [r4, #0]
c0de6d8a:	4285      	cmp	r5, r0
c0de6d8c:	d01e      	beq.n	c0de6dcc <layoutNavigationCallback+0x84>
c0de6d8e:	6865      	ldr	r5, [r4, #4]
c0de6d90:	4285      	cmp	r5, r0
c0de6d92:	d01e      	beq.n	c0de6dd2 <layoutNavigationCallback+0x8a>
c0de6d94:	68a4      	ldr	r4, [r4, #8]
c0de6d96:	4284      	cmp	r4, r0
c0de6d98:	d128      	bne.n	c0de6dec <layoutNavigationCallback+0xa4>
c0de6d9a:	2a01      	cmp	r2, #1
c0de6d9c:	d81d      	bhi.n	c0de6dda <layoutNavigationCallback+0x92>
c0de6d9e:	7818      	ldrb	r0, [r3, #0]
c0de6da0:	e01f      	b.n	c0de6de2 <layoutNavigationCallback+0x9a>
c0de6da2:	2a01      	cmp	r2, #1
c0de6da4:	d805      	bhi.n	c0de6db2 <layoutNavigationCallback+0x6a>
c0de6da6:	7819      	ldrb	r1, [r3, #0]
c0de6da8:	e007      	b.n	c0de6dba <layoutNavigationCallback+0x72>
c0de6daa:	7819      	ldrb	r1, [r3, #0]
c0de6dac:	b1f1      	cbz	r1, c0de6dec <layoutNavigationCallback+0xa4>
c0de6dae:	3901      	subs	r1, #1
c0de6db0:	e004      	b.n	c0de6dbc <layoutNavigationCallback+0x74>
c0de6db2:	7819      	ldrb	r1, [r3, #0]
c0de6db4:	1e54      	subs	r4, r2, #1
c0de6db6:	428c      	cmp	r4, r1
c0de6db8:	d918      	bls.n	c0de6dec <layoutNavigationCallback+0xa4>
c0de6dba:	3101      	adds	r1, #1
c0de6dbc:	7019      	strb	r1, [r3, #0]
c0de6dbe:	b2cb      	uxtb	r3, r1
c0de6dc0:	4611      	mov	r1, r2
c0de6dc2:	461a      	mov	r2, r3
c0de6dc4:	f000 f814 	bl	c0de6df0 <configButtons>
c0de6dc8:	2001      	movs	r0, #1
c0de6dca:	bd70      	pop	{r4, r5, r6, pc}
c0de6dcc:	20ff      	movs	r0, #255	@ 0xff
c0de6dce:	7018      	strb	r0, [r3, #0]
c0de6dd0:	e7fa      	b.n	c0de6dc8 <layoutNavigationCallback+0x80>
c0de6dd2:	7818      	ldrb	r0, [r3, #0]
c0de6dd4:	b150      	cbz	r0, c0de6dec <layoutNavigationCallback+0xa4>
c0de6dd6:	3801      	subs	r0, #1
c0de6dd8:	e004      	b.n	c0de6de4 <layoutNavigationCallback+0x9c>
c0de6dda:	7818      	ldrb	r0, [r3, #0]
c0de6ddc:	1e54      	subs	r4, r2, #1
c0de6dde:	4284      	cmp	r4, r0
c0de6de0:	d904      	bls.n	c0de6dec <layoutNavigationCallback+0xa4>
c0de6de2:	3001      	adds	r0, #1
c0de6de4:	7018      	strb	r0, [r3, #0]
c0de6de6:	b2c3      	uxtb	r3, r0
c0de6de8:	4608      	mov	r0, r1
c0de6dea:	e7e9      	b.n	c0de6dc0 <layoutNavigationCallback+0x78>
c0de6dec:	2000      	movs	r0, #0
c0de6dee:	bd70      	pop	{r4, r5, r6, pc}

c0de6df0 <configButtons>:
c0de6df0:	b5b0      	push	{r4, r5, r7, lr}
c0de6df2:	f810 3f22 	ldrb.w	r3, [r0, #34]!
c0de6df6:	7844      	ldrb	r4, [r0, #1]
c0de6df8:	7885      	ldrb	r5, [r0, #2]
c0de6dfa:	78c0      	ldrb	r0, [r0, #3]
c0de6dfc:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de6e00:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
c0de6e04:	ea43 4000 	orr.w	r0, r3, r0, lsl #16
c0de6e08:	e9d0 3001 	ldrd	r3, r0, [r0, #4]
c0de6e0c:	b12b      	cbz	r3, c0de6e1a <configButtons+0x2a>
c0de6e0e:	fab2 f482 	clz	r4, r2
c0de6e12:	0964      	lsrs	r4, r4, #5
c0de6e14:	0064      	lsls	r4, r4, #1
c0de6e16:	f883 4021 	strb.w	r4, [r3, #33]	@ 0x21
c0de6e1a:	2902      	cmp	r1, #2
c0de6e1c:	d307      	bcc.n	c0de6e2e <configButtons+0x3e>
c0de6e1e:	43d2      	mvns	r2, r2
c0de6e20:	4411      	add	r1, r2
c0de6e22:	fab1 f181 	clz	r1, r1
c0de6e26:	0949      	lsrs	r1, r1, #5
c0de6e28:	0049      	lsls	r1, r1, #1
c0de6e2a:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de6e2e:	bdb0      	pop	{r4, r5, r7, pc}

c0de6e30 <layoutNavigationPopulate>:
c0de6e30:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de6e34:	4680      	mov	r8, r0
c0de6e36:	78c8      	ldrb	r0, [r1, #3]
c0de6e38:	4616      	mov	r6, r2
c0de6e3a:	460d      	mov	r5, r1
c0de6e3c:	b338      	cbz	r0, c0de6e8e <layoutNavigationPopulate+0x5e>
c0de6e3e:	2005      	movs	r0, #5
c0de6e40:	4631      	mov	r1, r6
c0de6e42:	2405      	movs	r4, #5
c0de6e44:	f003 fdb1 	bl	c0dea9aa <nbgl_objPoolGet>
c0de6e48:	4976      	ldr	r1, [pc, #472]	@ (c0de7024 <layoutNavigationPopulate+0x1f4>)
c0de6e4a:	4479      	add	r1, pc
c0de6e4c:	f000 f8ff 	bl	c0de704e <OUTLINED_FUNCTION_1>
c0de6e50:	70d3      	strb	r3, [r2, #3]
c0de6e52:	7091      	strb	r1, [r2, #2]
c0de6e54:	2258      	movs	r2, #88	@ 0x58
c0de6e56:	2100      	movs	r1, #0
c0de6e58:	2303      	movs	r3, #3
c0de6e5a:	7182      	strb	r2, [r0, #6]
c0de6e5c:	7102      	strb	r2, [r0, #4]
c0de6e5e:	2201      	movs	r2, #1
c0de6e60:	71c1      	strb	r1, [r0, #7]
c0de6e62:	7141      	strb	r1, [r0, #5]
c0de6e64:	7601      	strb	r1, [r0, #24]
c0de6e66:	7741      	strb	r1, [r0, #29]
c0de6e68:	f880 3020 	strb.w	r3, [r0, #32]
c0de6e6c:	77c3      	strb	r3, [r0, #31]
c0de6e6e:	f880 3022 	strb.w	r3, [r0, #34]	@ 0x22
c0de6e72:	7702      	strb	r2, [r0, #28]
c0de6e74:	7782      	strb	r2, [r0, #30]
c0de6e76:	786a      	ldrb	r2, [r5, #1]
c0de6e78:	2a01      	cmp	r2, #1
c0de6e7a:	bf88      	it	hi
c0de6e7c:	2404      	movhi	r4, #4
c0de6e7e:	7584      	strb	r4, [r0, #22]
c0de6e80:	bf88      	it	hi
c0de6e82:	2101      	movhi	r1, #1
c0de6e84:	00c9      	lsls	r1, r1, #3
c0de6e86:	75c1      	strb	r1, [r0, #23]
c0de6e88:	f000 f8d4 	bl	c0de7034 <OUTLINED_FUNCTION_0>
c0de6e8c:	6008      	str	r0, [r1, #0]
c0de6e8e:	7928      	ldrb	r0, [r5, #4]
c0de6e90:	b310      	cbz	r0, c0de6ed8 <layoutNavigationPopulate+0xa8>
c0de6e92:	2005      	movs	r0, #5
c0de6e94:	4631      	mov	r1, r6
c0de6e96:	f003 fd88 	bl	c0dea9aa <nbgl_objPoolGet>
c0de6e9a:	4963      	ldr	r1, [pc, #396]	@ (c0de7028 <layoutNavigationPopulate+0x1f8>)
c0de6e9c:	4479      	add	r1, pc
c0de6e9e:	f000 f8d6 	bl	c0de704e <OUTLINED_FUNCTION_1>
c0de6ea2:	7091      	strb	r1, [r2, #2]
c0de6ea4:	2100      	movs	r1, #0
c0de6ea6:	70d3      	strb	r3, [r2, #3]
c0de6ea8:	2260      	movs	r2, #96	@ 0x60
c0de6eaa:	2301      	movs	r3, #1
c0de6eac:	71c1      	strb	r1, [r0, #7]
c0de6eae:	7141      	strb	r1, [r0, #5]
c0de6eb0:	7741      	strb	r1, [r0, #29]
c0de6eb2:	7601      	strb	r1, [r0, #24]
c0de6eb4:	2103      	movs	r1, #3
c0de6eb6:	7182      	strb	r2, [r0, #6]
c0de6eb8:	2268      	movs	r2, #104	@ 0x68
c0de6eba:	7703      	strb	r3, [r0, #28]
c0de6ebc:	f880 1020 	strb.w	r1, [r0, #32]
c0de6ec0:	77c1      	strb	r1, [r0, #31]
c0de6ec2:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de6ec6:	2102      	movs	r1, #2
c0de6ec8:	7102      	strb	r2, [r0, #4]
c0de6eca:	75c2      	strb	r2, [r0, #23]
c0de6ecc:	7781      	strb	r1, [r0, #30]
c0de6ece:	2106      	movs	r1, #6
c0de6ed0:	7581      	strb	r1, [r0, #22]
c0de6ed2:	f000 f8af 	bl	c0de7034 <OUTLINED_FUNCTION_0>
c0de6ed6:	6048      	str	r0, [r1, #4]
c0de6ed8:	2005      	movs	r0, #5
c0de6eda:	4631      	mov	r1, r6
c0de6edc:	f003 fd65 	bl	c0dea9aa <nbgl_objPoolGet>
c0de6ee0:	4c52      	ldr	r4, [pc, #328]	@ (c0de702c <layoutNavigationPopulate+0x1fc>)
c0de6ee2:	447c      	add	r4, pc
c0de6ee4:	0a21      	lsrs	r1, r4, #8
c0de6ee6:	0e22      	lsrs	r2, r4, #24
c0de6ee8:	f880 102f 	strb.w	r1, [r0, #47]	@ 0x2f
c0de6eec:	4601      	mov	r1, r0
c0de6eee:	f801 4f2e 	strb.w	r4, [r1, #46]!
c0de6ef2:	70ca      	strb	r2, [r1, #3]
c0de6ef4:	0c22      	lsrs	r2, r4, #16
c0de6ef6:	708a      	strb	r2, [r1, #2]
c0de6ef8:	2100      	movs	r1, #0
c0de6efa:	2260      	movs	r2, #96	@ 0x60
c0de6efc:	7182      	strb	r2, [r0, #6]
c0de6efe:	2268      	movs	r2, #104	@ 0x68
c0de6f00:	71c1      	strb	r1, [r0, #7]
c0de6f02:	7141      	strb	r1, [r0, #5]
c0de6f04:	7741      	strb	r1, [r0, #29]
c0de6f06:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de6f0a:	2103      	movs	r1, #3
c0de6f0c:	7102      	strb	r2, [r0, #4]
c0de6f0e:	2201      	movs	r2, #1
c0de6f10:	f880 1020 	strb.w	r1, [r0, #32]
c0de6f14:	77c1      	strb	r1, [r0, #31]
c0de6f16:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de6f1a:	7781      	strb	r1, [r0, #30]
c0de6f1c:	2106      	movs	r1, #6
c0de6f1e:	7581      	strb	r1, [r0, #22]
c0de6f20:	7702      	strb	r2, [r0, #28]
c0de6f22:	4641      	mov	r1, r8
c0de6f24:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6f28:	784b      	ldrb	r3, [r1, #1]
c0de6f2a:	788f      	ldrb	r7, [r1, #2]
c0de6f2c:	78c9      	ldrb	r1, [r1, #3]
c0de6f2e:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6f32:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de6f36:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6f3a:	6088      	str	r0, [r1, #8]
c0de6f3c:	79a8      	ldrb	r0, [r5, #6]
c0de6f3e:	2800      	cmp	r0, #0
c0de6f40:	d067      	beq.n	c0de7012 <layoutNavigationPopulate+0x1e2>
c0de6f42:	79e8      	ldrb	r0, [r5, #7]
c0de6f44:	2800      	cmp	r0, #0
c0de6f46:	d04c      	beq.n	c0de6fe2 <layoutNavigationPopulate+0x1b2>
c0de6f48:	2004      	movs	r0, #4
c0de6f4a:	4631      	mov	r1, r6
c0de6f4c:	f003 fd2d 	bl	c0dea9aa <nbgl_objPoolGet>
c0de6f50:	4606      	mov	r6, r0
c0de6f52:	7868      	ldrb	r0, [r5, #1]
c0de6f54:	78a9      	ldrb	r1, [r5, #2]
c0de6f56:	f04f 0a0b 	mov.w	sl, #11
c0de6f5a:	9000      	str	r0, [sp, #0]
c0de6f5c:	4830      	ldr	r0, [pc, #192]	@ (c0de7020 <layoutNavigationPopulate+0x1f0>)
c0de6f5e:	1c4b      	adds	r3, r1, #1
c0de6f60:	210b      	movs	r1, #11
c0de6f62:	4a33      	ldr	r2, [pc, #204]	@ (c0de7030 <layoutNavigationPopulate+0x200>)
c0de6f64:	eb09 0700 	add.w	r7, r9, r0
c0de6f68:	447a      	add	r2, pc
c0de6f6a:	4638      	mov	r0, r7
c0de6f6c:	f003 fd6c 	bl	c0deaa48 <snprintf>
c0de6f70:	0a38      	lsrs	r0, r7, #8
c0de6f72:	0e39      	lsrs	r1, r7, #24
c0de6f74:	f06f 0201 	mvn.w	r2, #1
c0de6f78:	f886 a022 	strb.w	sl, [r6, #34]	@ 0x22
c0de6f7c:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de6f80:	4630      	mov	r0, r6
c0de6f82:	f800 7f26 	strb.w	r7, [r0, #38]!
c0de6f86:	70c1      	strb	r1, [r0, #3]
c0de6f88:	0c39      	lsrs	r1, r7, #16
c0de6f8a:	7081      	strb	r1, [r0, #2]
c0de6f8c:	2000      	movs	r0, #0
c0de6f8e:	7861      	ldrb	r1, [r4, #1]
c0de6f90:	71f0      	strb	r0, [r6, #7]
c0de6f92:	2060      	movs	r0, #96	@ 0x60
c0de6f94:	71b0      	strb	r0, [r6, #6]
c0de6f96:	2001      	movs	r0, #1
c0de6f98:	77f0      	strb	r0, [r6, #31]
c0de6f9a:	2005      	movs	r0, #5
c0de6f9c:	f886 0020 	strb.w	r0, [r6, #32]
c0de6fa0:	75b0      	strb	r0, [r6, #22]
c0de6fa2:	7820      	ldrb	r0, [r4, #0]
c0de6fa4:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de6fa8:	f1c0 0168 	rsb	r1, r0, #104	@ 0x68
c0de6fac:	fb91 f1f2 	sdiv	r1, r1, r2
c0de6fb0:	1a08      	subs	r0, r1, r0
c0de6fb2:	4641      	mov	r1, r8
c0de6fb4:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de6fb8:	f811 3c1e 	ldrb.w	r3, [r1, #-30]
c0de6fbc:	f811 4c1d 	ldrb.w	r4, [r1, #-29]
c0de6fc0:	784f      	ldrb	r7, [r1, #1]
c0de6fc2:	788a      	ldrb	r2, [r1, #2]
c0de6fc4:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de6fc8:	eb03 0040 	add.w	r0, r3, r0, lsl #1
c0de6fcc:	7130      	strb	r0, [r6, #4]
c0de6fce:	0a00      	lsrs	r0, r0, #8
c0de6fd0:	78c9      	ldrb	r1, [r1, #3]
c0de6fd2:	7170      	strb	r0, [r6, #5]
c0de6fd4:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de6fd8:	ea4c 2207 	orr.w	r2, ip, r7, lsl #8
c0de6fdc:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6fe0:	60ce      	str	r6, [r1, #12]
c0de6fe2:	7928      	ldrb	r0, [r5, #4]
c0de6fe4:	b1a8      	cbz	r0, c0de7012 <layoutNavigationPopulate+0x1e2>
c0de6fe6:	4640      	mov	r0, r8
c0de6fe8:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6fec:	7842      	ldrb	r2, [r0, #1]
c0de6fee:	7883      	ldrb	r3, [r0, #2]
c0de6ff0:	78c0      	ldrb	r0, [r0, #3]
c0de6ff2:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de6ff6:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de6ffa:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de6ffe:	6840      	ldr	r0, [r0, #4]
c0de7000:	f810 1f17 	ldrb.w	r1, [r0, #23]!
c0de7004:	7842      	ldrb	r2, [r0, #1]
c0de7006:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de700a:	314f      	adds	r1, #79	@ 0x4f
c0de700c:	7001      	strb	r1, [r0, #0]
c0de700e:	0a09      	lsrs	r1, r1, #8
c0de7010:	7041      	strb	r1, [r0, #1]
c0de7012:	7869      	ldrb	r1, [r5, #1]
c0de7014:	78aa      	ldrb	r2, [r5, #2]
c0de7016:	4640      	mov	r0, r8
c0de7018:	e8bd 45f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de701c:	f7ff bee8 	b.w	c0de6df0 <configButtons>
c0de7020:	00001970 	.word	0x00001970
c0de7024:	00005219 	.word	0x00005219
c0de7028:	000050ad 	.word	0x000050ad
c0de702c:	000050ea 	.word	0x000050ea
c0de7030:	00005b9c 	.word	0x00005b9c

c0de7034 <OUTLINED_FUNCTION_0>:
c0de7034:	4641      	mov	r1, r8
c0de7036:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de703a:	784b      	ldrb	r3, [r1, #1]
c0de703c:	788c      	ldrb	r4, [r1, #2]
c0de703e:	78c9      	ldrb	r1, [r1, #3]
c0de7040:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de7044:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
c0de7048:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de704c:	4770      	bx	lr

c0de704e <OUTLINED_FUNCTION_1>:
c0de704e:	0a0a      	lsrs	r2, r1, #8
c0de7050:	0e0b      	lsrs	r3, r1, #24
c0de7052:	f880 202f 	strb.w	r2, [r0, #47]	@ 0x2f
c0de7056:	4602      	mov	r2, r0
c0de7058:	f802 1f2e 	strb.w	r1, [r2, #46]!
c0de705c:	0c09      	lsrs	r1, r1, #16
c0de705e:	4770      	bx	lr

c0de7060 <nbgl_pageDrawLedgerInfo>:
c0de7060:	b510      	push	{r4, lr}
c0de7062:	b08c      	sub	sp, #48	@ 0x30
c0de7064:	9008      	str	r0, [sp, #32]
c0de7066:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0de706a:	f88d 301c 	strb.w	r3, [sp, #28]
c0de706e:	f8ad 0014 	strh.w	r0, [sp, #20]
c0de7072:	2009      	movs	r0, #9
c0de7074:	f88d 001d 	strb.w	r0, [sp, #29]
c0de7078:	481c      	ldr	r0, [pc, #112]	@ (c0de70ec <nbgl_pageDrawLedgerInfo+0x8c>)
c0de707a:	4478      	add	r0, pc
c0de707c:	9006      	str	r0, [sp, #24]
c0de707e:	2000      	movs	r0, #0
c0de7080:	9004      	str	r0, [sp, #16]
c0de7082:	4b1b      	ldr	r3, [pc, #108]	@ (c0de70f0 <nbgl_pageDrawLedgerInfo+0x90>)
c0de7084:	e9cd 2000 	strd	r2, r0, [sp]
c0de7088:	784a      	ldrb	r2, [r1, #1]
c0de708a:	78cc      	ldrb	r4, [r1, #3]
c0de708c:	447b      	add	r3, pc
c0de708e:	e9cd 0302 	strd	r0, r3, [sp, #8]
c0de7092:	7808      	ldrb	r0, [r1, #0]
c0de7094:	788b      	ldrb	r3, [r1, #2]
c0de7096:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de709a:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de709e:	460a      	mov	r2, r1
c0de70a0:	ea40 4003 	orr.w	r0, r0, r3, lsl #16
c0de70a4:	f812 3f08 	ldrb.w	r3, [r2, #8]!
c0de70a8:	9009      	str	r0, [sp, #36]	@ 0x24
c0de70aa:	7a48      	ldrb	r0, [r1, #9]
c0de70ac:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de70b0:	7893      	ldrb	r3, [r2, #2]
c0de70b2:	78d2      	ldrb	r2, [r2, #3]
c0de70b4:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de70b8:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
c0de70bc:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de70be:	7948      	ldrb	r0, [r1, #5]
c0de70c0:	f811 2f04 	ldrb.w	r2, [r1, #4]!
c0de70c4:	f000 fb79 	bl	c0de77ba <OUTLINED_FUNCTION_1>
c0de70c8:	900a      	str	r0, [sp, #40]	@ 0x28
c0de70ca:	a805      	add	r0, sp, #20
c0de70cc:	f7fc f83c 	bl	c0de3148 <nbgl_layoutGet>
c0de70d0:	2160      	movs	r1, #96	@ 0x60
c0de70d2:	4604      	mov	r4, r0
c0de70d4:	f000 f80e 	bl	c0de70f4 <addEmptyHeader>
c0de70d8:	4669      	mov	r1, sp
c0de70da:	4620      	mov	r0, r4
c0de70dc:	f7fd ff3a 	bl	c0de4f54 <nbgl_layoutAddCenteredInfo>
c0de70e0:	4620      	mov	r0, r4
c0de70e2:	f7ff fa2b 	bl	c0de653c <nbgl_layoutDraw>
c0de70e6:	4620      	mov	r0, r4
c0de70e8:	b00c      	add	sp, #48	@ 0x30
c0de70ea:	bd10      	pop	{r4, pc}
c0de70ec:	00005e65 	.word	0x00005e65
c0de70f0:	00004704 	.word	0x00004704

c0de70f4 <addEmptyHeader>:
c0de70f4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de70f6:	f8ad 1004 	strh.w	r1, [sp, #4]
c0de70fa:	2100      	movs	r1, #0
c0de70fc:	f8ad 1000 	strh.w	r1, [sp]
c0de7100:	4669      	mov	r1, sp
c0de7102:	f7fe fdb9 	bl	c0de5c78 <nbgl_layoutAddHeader>
c0de7106:	bd8f      	pop	{r0, r1, r2, r3, r7, pc}

c0de7108 <nbgl_pageDrawInfo>:
c0de7108:	b570      	push	{r4, r5, r6, lr}
c0de710a:	b08c      	sub	sp, #48	@ 0x30
c0de710c:	460d      	mov	r5, r1
c0de710e:	4606      	mov	r6, r0
c0de7110:	a805      	add	r0, sp, #20
c0de7112:	211c      	movs	r1, #28
c0de7114:	4614      	mov	r4, r2
c0de7116:	f004 f84b 	bl	c0deb1b0 <__aeabi_memclr>
c0de711a:	2001      	movs	r0, #1
c0de711c:	9608      	str	r6, [sp, #32]
c0de711e:	f88d 0015 	strb.w	r0, [sp, #21]
c0de7122:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de7126:	b948      	cbnz	r0, c0de713c <nbgl_pageDrawInfo+0x34>
c0de7128:	6a20      	ldr	r0, [r4, #32]
c0de712a:	9006      	str	r0, [sp, #24]
c0de712c:	f894 0025 	ldrb.w	r0, [r4, #37]	@ 0x25
c0de7130:	f88d 001c 	strb.w	r0, [sp, #28]
c0de7134:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de7138:	f88d 001d 	strb.w	r0, [sp, #29]
c0de713c:	b1f5      	cbz	r5, c0de717c <nbgl_pageDrawInfo+0x74>
c0de713e:	4629      	mov	r1, r5
c0de7140:	7a68      	ldrb	r0, [r5, #9]
c0de7142:	78eb      	ldrb	r3, [r5, #3]
c0de7144:	f811 2f08 	ldrb.w	r2, [r1, #8]!
c0de7148:	f000 fb37 	bl	c0de77ba <OUTLINED_FUNCTION_1>
c0de714c:	4629      	mov	r1, r5
c0de714e:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de7150:	7968      	ldrb	r0, [r5, #5]
c0de7152:	f811 2f04 	ldrb.w	r2, [r1, #4]!
c0de7156:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de715a:	788a      	ldrb	r2, [r1, #2]
c0de715c:	78c9      	ldrb	r1, [r1, #3]
c0de715e:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de7162:	78aa      	ldrb	r2, [r5, #2]
c0de7164:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de7168:	7869      	ldrb	r1, [r5, #1]
c0de716a:	900a      	str	r0, [sp, #40]	@ 0x28
c0de716c:	7828      	ldrb	r0, [r5, #0]
c0de716e:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de7172:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de7176:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
c0de717a:	e000      	b.n	c0de717e <nbgl_pageDrawInfo+0x76>
c0de717c:	2000      	movs	r0, #0
c0de717e:	9009      	str	r0, [sp, #36]	@ 0x24
c0de7180:	a805      	add	r0, sp, #20
c0de7182:	f7fb ffe1 	bl	c0de3148 <nbgl_layoutGet>
c0de7186:	4605      	mov	r5, r0
c0de7188:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de718c:	b150      	cbz	r0, c0de71a4 <nbgl_pageDrawInfo+0x9c>
c0de718e:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de7192:	f894 3025 	ldrb.w	r3, [r4, #37]	@ 0x25
c0de7196:	6a22      	ldr	r2, [r4, #32]
c0de7198:	f44f 61c0 	mov.w	r1, #1536	@ 0x600
c0de719c:	9000      	str	r0, [sp, #0]
c0de719e:	4628      	mov	r0, r5
c0de71a0:	f7fc fd40 	bl	c0de3c24 <nbgl_layoutAddSwipe>
c0de71a4:	7d20      	ldrb	r0, [r4, #20]
c0de71a6:	b118      	cbz	r0, c0de71b0 <nbgl_pageDrawInfo+0xa8>
c0de71a8:	4628      	mov	r0, r5
c0de71aa:	2128      	movs	r1, #40	@ 0x28
c0de71ac:	f7ff ffa2 	bl	c0de70f4 <addEmptyHeader>
c0de71b0:	4628      	mov	r0, r5
c0de71b2:	4621      	mov	r1, r4
c0de71b4:	f7fd fece 	bl	c0de4f54 <nbgl_layoutAddCenteredInfo>
c0de71b8:	6aa0      	ldr	r0, [r4, #40]	@ 0x28
c0de71ba:	b1b8      	cbz	r0, c0de71ec <nbgl_pageDrawInfo+0xe4>
c0de71bc:	7d61      	ldrb	r1, [r4, #21]
c0de71be:	2904      	cmp	r1, #4
c0de71c0:	d014      	beq.n	c0de71ec <nbgl_pageDrawInfo+0xe4>
c0de71c2:	9001      	str	r0, [sp, #4]
c0de71c4:	2001      	movs	r0, #1
c0de71c6:	f8ad 000e 	strh.w	r0, [sp, #14]
c0de71ca:	6ae0      	ldr	r0, [r4, #44]	@ 0x2c
c0de71cc:	9002      	str	r0, [sp, #8]
c0de71ce:	7de0      	ldrb	r0, [r4, #23]
c0de71d0:	f88d 000c 	strb.w	r0, [sp, #12]
c0de71d4:	f894 0030 	ldrb.w	r0, [r4, #48]	@ 0x30
c0de71d8:	f88d 000d 	strb.w	r0, [sp, #13]
c0de71dc:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de71e0:	f88d 0010 	strb.w	r0, [sp, #16]
c0de71e4:	a901      	add	r1, sp, #4
c0de71e6:	4628      	mov	r0, r5
c0de71e8:	f7fe fc2e 	bl	c0de5a48 <nbgl_layoutAddButton>
c0de71ec:	69a0      	ldr	r0, [r4, #24]
c0de71ee:	b140      	cbz	r0, c0de7202 <nbgl_pageDrawInfo+0xfa>
c0de71f0:	f003 fdbc 	bl	c0dead6c <pic>
c0de71f4:	7f22      	ldrb	r2, [r4, #28]
c0de71f6:	f894 3031 	ldrb.w	r3, [r4, #49]	@ 0x31
c0de71fa:	4601      	mov	r1, r0
c0de71fc:	4628      	mov	r0, r5
c0de71fe:	f7fe fd14 	bl	c0de5c2a <nbgl_layoutAddFooter>
c0de7202:	7d20      	ldrb	r0, [r4, #20]
c0de7204:	b1b0      	cbz	r0, c0de7234 <nbgl_pageDrawInfo+0x12c>
c0de7206:	2801      	cmp	r0, #1
c0de7208:	d006      	beq.n	c0de7218 <nbgl_pageDrawInfo+0x110>
c0de720a:	2802      	cmp	r0, #2
c0de720c:	d007      	beq.n	c0de721e <nbgl_pageDrawInfo+0x116>
c0de720e:	2803      	cmp	r0, #3
c0de7210:	d136      	bne.n	c0de7280 <nbgl_pageDrawInfo+0x178>
c0de7212:	482e      	ldr	r0, [pc, #184]	@ (c0de72cc <nbgl_pageDrawInfo+0x1c4>)
c0de7214:	4478      	add	r0, pc
c0de7216:	e004      	b.n	c0de7222 <nbgl_pageDrawInfo+0x11a>
c0de7218:	482b      	ldr	r0, [pc, #172]	@ (c0de72c8 <nbgl_pageDrawInfo+0x1c0>)
c0de721a:	4478      	add	r0, pc
c0de721c:	e001      	b.n	c0de7222 <nbgl_pageDrawInfo+0x11a>
c0de721e:	482c      	ldr	r0, [pc, #176]	@ (c0de72d0 <nbgl_pageDrawInfo+0x1c8>)
c0de7220:	4478      	add	r0, pc
c0de7222:	f003 fda3 	bl	c0dead6c <pic>
c0de7226:	7da2      	ldrb	r2, [r4, #22]
c0de7228:	f894 3031 	ldrb.w	r3, [r4, #49]	@ 0x31
c0de722c:	4601      	mov	r1, r0
c0de722e:	4628      	mov	r0, r5
c0de7230:	f7fc fd52 	bl	c0de3cd8 <nbgl_layoutAddTopRightButton>
c0de7234:	7d60      	ldrb	r0, [r4, #21]
c0de7236:	b3c0      	cbz	r0, c0de72aa <nbgl_pageDrawInfo+0x1a2>
c0de7238:	2801      	cmp	r0, #1
c0de723a:	d023      	beq.n	c0de7284 <nbgl_pageDrawInfo+0x17c>
c0de723c:	2802      	cmp	r0, #2
c0de723e:	d024      	beq.n	c0de728a <nbgl_pageDrawInfo+0x182>
c0de7240:	2803      	cmp	r0, #3
c0de7242:	d025      	beq.n	c0de7290 <nbgl_pageDrawInfo+0x188>
c0de7244:	2804      	cmp	r0, #4
c0de7246:	d11b      	bne.n	c0de7280 <nbgl_pageDrawInfo+0x178>
c0de7248:	6aa0      	ldr	r0, [r4, #40]	@ 0x28
c0de724a:	b3a0      	cbz	r0, c0de72b6 <nbgl_pageDrawInfo+0x1ae>
c0de724c:	4922      	ldr	r1, [pc, #136]	@ (c0de72d8 <nbgl_pageDrawInfo+0x1d0>)
c0de724e:	4479      	add	r1, pc
c0de7250:	e9cd 0101 	strd	r0, r1, [sp, #4]
c0de7254:	6ae0      	ldr	r0, [r4, #44]	@ 0x2c
c0de7256:	2102      	movs	r1, #2
c0de7258:	9003      	str	r0, [sp, #12]
c0de725a:	7de0      	ldrb	r0, [r4, #23]
c0de725c:	f88d 0010 	strb.w	r0, [sp, #16]
c0de7260:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de7264:	f88d 0012 	strb.w	r0, [sp, #18]
c0de7268:	f894 0030 	ldrb.w	r0, [r4, #48]	@ 0x30
c0de726c:	2800      	cmp	r0, #0
c0de726e:	bf08      	it	eq
c0de7270:	2101      	moveq	r1, #1
c0de7272:	f88d 1011 	strb.w	r1, [sp, #17]
c0de7276:	4628      	mov	r0, r5
c0de7278:	a901      	add	r1, sp, #4
c0de727a:	f7fe fa15 	bl	c0de56a8 <nbgl_layoutAddChoiceButtons>
c0de727e:	e014      	b.n	c0de72aa <nbgl_pageDrawInfo+0x1a2>
c0de7280:	2500      	movs	r5, #0
c0de7282:	e015      	b.n	c0de72b0 <nbgl_pageDrawInfo+0x1a8>
c0de7284:	4813      	ldr	r0, [pc, #76]	@ (c0de72d4 <nbgl_pageDrawInfo+0x1cc>)
c0de7286:	4478      	add	r0, pc
c0de7288:	e004      	b.n	c0de7294 <nbgl_pageDrawInfo+0x18c>
c0de728a:	4816      	ldr	r0, [pc, #88]	@ (c0de72e4 <nbgl_pageDrawInfo+0x1dc>)
c0de728c:	4478      	add	r0, pc
c0de728e:	e001      	b.n	c0de7294 <nbgl_pageDrawInfo+0x18c>
c0de7290:	4813      	ldr	r0, [pc, #76]	@ (c0de72e0 <nbgl_pageDrawInfo+0x1d8>)
c0de7292:	4478      	add	r0, pc
c0de7294:	f003 fd6a 	bl	c0dead6c <pic>
c0de7298:	4601      	mov	r1, r0
c0de729a:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de729e:	7de2      	ldrb	r2, [r4, #23]
c0de72a0:	2300      	movs	r3, #0
c0de72a2:	9000      	str	r0, [sp, #0]
c0de72a4:	4628      	mov	r0, r5
c0de72a6:	f7fd f8dd 	bl	c0de4464 <nbgl_layoutAddBottomButton>
c0de72aa:	4628      	mov	r0, r5
c0de72ac:	f7ff f946 	bl	c0de653c <nbgl_layoutDraw>
c0de72b0:	4628      	mov	r0, r5
c0de72b2:	b00c      	add	sp, #48	@ 0x30
c0de72b4:	bd70      	pop	{r4, r5, r6, pc}
c0de72b6:	7de2      	ldrb	r2, [r4, #23]
c0de72b8:	f894 3031 	ldrb.w	r3, [r4, #49]	@ 0x31
c0de72bc:	4907      	ldr	r1, [pc, #28]	@ (c0de72dc <nbgl_pageDrawInfo+0x1d4>)
c0de72be:	4628      	mov	r0, r5
c0de72c0:	4479      	add	r1, pc
c0de72c2:	f7fe fcb2 	bl	c0de5c2a <nbgl_layoutAddFooter>
c0de72c6:	e7f0      	b.n	c0de72aa <nbgl_pageDrawInfo+0x1a2>
c0de72c8:	0000537a 	.word	0x0000537a
c0de72cc:	00004e92 	.word	0x00004e92
c0de72d0:	00004e43 	.word	0x00004e43
c0de72d4:	0000530e 	.word	0x0000530e
c0de72d8:	00005d26 	.word	0x00005d26
c0de72dc:	00005cb4 	.word	0x00005cb4
c0de72e0:	00004e14 	.word	0x00004e14
c0de72e4:	00004dd7 	.word	0x00004dd7

c0de72e8 <nbgl_pageDrawConfirmation>:
c0de72e8:	b5b0      	push	{r4, r5, r7, lr}
c0de72ea:	b08c      	sub	sp, #48	@ 0x30
c0de72ec:	4605      	mov	r5, r0
c0de72ee:	6948      	ldr	r0, [r1, #20]
c0de72f0:	460c      	mov	r4, r1
c0de72f2:	f003 fd3b 	bl	c0dead6c <pic>
c0de72f6:	9001      	str	r0, [sp, #4]
c0de72f8:	69a0      	ldr	r0, [r4, #24]
c0de72fa:	b110      	cbz	r0, c0de7302 <nbgl_pageDrawConfirmation+0x1a>
c0de72fc:	f003 fd36 	bl	c0dead6c <pic>
c0de7300:	e001      	b.n	c0de7306 <nbgl_pageDrawConfirmation+0x1e>
c0de7302:	4815      	ldr	r0, [pc, #84]	@ (c0de7358 <nbgl_pageDrawConfirmation+0x70>)
c0de7304:	4478      	add	r0, pc
c0de7306:	2100      	movs	r1, #0
c0de7308:	7fe2      	ldrb	r2, [r4, #31]
c0de730a:	9508      	str	r5, [sp, #32]
c0de730c:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de7310:	2001      	movs	r0, #1
c0de7312:	f88d 1011 	strb.w	r1, [sp, #17]
c0de7316:	9109      	str	r1, [sp, #36]	@ 0x24
c0de7318:	9106      	str	r1, [sp, #24]
c0de731a:	7fa1      	ldrb	r1, [r4, #30]
c0de731c:	f88d 0015 	strb.w	r0, [sp, #21]
c0de7320:	7f20      	ldrb	r0, [r4, #28]
c0de7322:	f88d 2014 	strb.w	r2, [sp, #20]
c0de7326:	f88d 1012 	strb.w	r1, [sp, #18]
c0de732a:	f88d 0010 	strb.w	r0, [sp, #16]
c0de732e:	a805      	add	r0, sp, #20
c0de7330:	f7fb ff0a 	bl	c0de3148 <nbgl_layoutGet>
c0de7334:	2140      	movs	r1, #64	@ 0x40
c0de7336:	4605      	mov	r5, r0
c0de7338:	f7ff fedc 	bl	c0de70f4 <addEmptyHeader>
c0de733c:	a901      	add	r1, sp, #4
c0de733e:	4628      	mov	r0, r5
c0de7340:	f7fe f9b2 	bl	c0de56a8 <nbgl_layoutAddChoiceButtons>
c0de7344:	4628      	mov	r0, r5
c0de7346:	4621      	mov	r1, r4
c0de7348:	f7fd fe04 	bl	c0de4f54 <nbgl_layoutAddCenteredInfo>
c0de734c:	4628      	mov	r0, r5
c0de734e:	f7ff f8f5 	bl	c0de653c <nbgl_layoutDraw>
c0de7352:	4628      	mov	r0, r5
c0de7354:	b00c      	add	sp, #48	@ 0x30
c0de7356:	bdb0      	pop	{r4, r5, r7, pc}
c0de7358:	000057bf 	.word	0x000057bf

c0de735c <nbgl_pageDrawGenericContentExt>:
c0de735c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de7360:	b096      	sub	sp, #88	@ 0x58
c0de7362:	460e      	mov	r6, r1
c0de7364:	2100      	movs	r1, #0
c0de7366:	4615      	mov	r5, r2
c0de7368:	f88d 3008 	strb.w	r3, [sp, #8]
c0de736c:	e9cd 0105 	strd	r0, r1, [sp, #20]
c0de7370:	2001      	movs	r0, #1
c0de7372:	f88d 0009 	strb.w	r0, [sp, #9]
c0de7376:	b10e      	cbz	r6, c0de737c <nbgl_pageDrawGenericContentExt+0x20>
c0de7378:	78f0      	ldrb	r0, [r6, #3]
c0de737a:	b108      	cbz	r0, c0de7380 <nbgl_pageDrawGenericContentExt+0x24>
c0de737c:	9103      	str	r1, [sp, #12]
c0de737e:	e007      	b.n	c0de7390 <nbgl_pageDrawGenericContentExt+0x34>
c0de7380:	6970      	ldr	r0, [r6, #20]
c0de7382:	7cb1      	ldrb	r1, [r6, #18]
c0de7384:	9003      	str	r0, [sp, #12]
c0de7386:	7970      	ldrb	r0, [r6, #5]
c0de7388:	f88d 1010 	strb.w	r1, [sp, #16]
c0de738c:	f88d 0011 	strb.w	r0, [sp, #17]
c0de7390:	a802      	add	r0, sp, #8
c0de7392:	f7fb fed9 	bl	c0de3148 <nbgl_layoutGet>
c0de7396:	4682      	mov	sl, r0
c0de7398:	b17e      	cbz	r6, c0de73ba <nbgl_pageDrawGenericContentExt+0x5e>
c0de739a:	78f0      	ldrb	r0, [r6, #3]
c0de739c:	2801      	cmp	r0, #1
c0de739e:	d011      	beq.n	c0de73c4 <nbgl_pageDrawGenericContentExt+0x68>
c0de73a0:	b958      	cbnz	r0, c0de73ba <nbgl_pageDrawGenericContentExt+0x5e>
c0de73a2:	68b3      	ldr	r3, [r6, #8]
c0de73a4:	78b2      	ldrb	r2, [r6, #2]
c0de73a6:	69b1      	ldr	r1, [r6, #24]
c0de73a8:	b323      	cbz	r3, c0de73f4 <nbgl_pageDrawGenericContentExt+0x98>
c0de73aa:	7970      	ldrb	r0, [r6, #5]
c0de73ac:	7b34      	ldrb	r4, [r6, #12]
c0de73ae:	e9cd 4000 	strd	r4, r0, [sp]
c0de73b2:	4650      	mov	r0, sl
c0de73b4:	f7fe fc4b 	bl	c0de5c4e <nbgl_layoutAddSplitFooter>
c0de73b8:	e020      	b.n	c0de73fc <nbgl_pageDrawGenericContentExt+0xa0>
c0de73ba:	f04f 0800 	mov.w	r8, #0
c0de73be:	f44f 7716 	mov.w	r7, #600	@ 0x258
c0de73c2:	e07e      	b.n	c0de74c2 <nbgl_pageDrawGenericContentExt+0x166>
c0de73c4:	68b0      	ldr	r0, [r6, #8]
c0de73c6:	2800      	cmp	r0, #0
c0de73c8:	4680      	mov	r8, r0
c0de73ca:	bf18      	it	ne
c0de73cc:	f04f 0801 	movne.w	r8, #1
c0de73d0:	d027      	beq.n	c0de7422 <nbgl_pageDrawGenericContentExt+0xc6>
c0de73d2:	900e      	str	r0, [sp, #56]	@ 0x38
c0de73d4:	2006      	movs	r0, #6
c0de73d6:	7b31      	ldrb	r1, [r6, #12]
c0de73d8:	f8ad 0034 	strh.w	r0, [sp, #52]	@ 0x34
c0de73dc:	7970      	ldrb	r0, [r6, #5]
c0de73de:	f88d 103c 	strb.w	r1, [sp, #60]	@ 0x3c
c0de73e2:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de73e6:	a90d      	add	r1, sp, #52	@ 0x34
c0de73e8:	4650      	mov	r0, sl
c0de73ea:	f7fe fc45 	bl	c0de5c78 <nbgl_layoutAddHeader>
c0de73ee:	f5c0 7716 	rsb	r7, r0, #600	@ 0x258
c0de73f2:	e018      	b.n	c0de7426 <nbgl_pageDrawGenericContentExt+0xca>
c0de73f4:	7973      	ldrb	r3, [r6, #5]
c0de73f6:	4650      	mov	r0, sl
c0de73f8:	f7fe fc17 	bl	c0de5c2a <nbgl_layoutAddFooter>
c0de73fc:	f5c0 7716 	rsb	r7, r0, #600	@ 0x258
c0de7400:	7930      	ldrb	r0, [r6, #4]
c0de7402:	2800      	cmp	r0, #0
c0de7404:	d042      	beq.n	c0de748c <nbgl_pageDrawGenericContentExt+0x130>
c0de7406:	7c70      	ldrb	r0, [r6, #17]
c0de7408:	7974      	ldrb	r4, [r6, #5]
c0de740a:	7831      	ldrb	r1, [r6, #0]
c0de740c:	7872      	ldrb	r2, [r6, #1]
c0de740e:	7c33      	ldrb	r3, [r6, #16]
c0de7410:	e9cd 0400 	strd	r0, r4, [sp]
c0de7414:	4650      	mov	r0, sl
c0de7416:	f7fe fe73 	bl	c0de6100 <nbgl_layoutAddProgressIndicator>
c0de741a:	1a3f      	subs	r7, r7, r0
c0de741c:	f04f 0801 	mov.w	r8, #1
c0de7420:	e04f      	b.n	c0de74c2 <nbgl_pageDrawGenericContentExt+0x166>
c0de7422:	f44f 7716 	mov.w	r7, #600	@ 0x258
c0de7426:	2001      	movs	r0, #1
c0de7428:	f88d 0035 	strb.w	r0, [sp, #53]	@ 0x35
c0de742c:	7870      	ldrb	r0, [r6, #1]
c0de742e:	2802      	cmp	r0, #2
c0de7430:	d31c      	bcc.n	c0de746c <nbgl_pageDrawGenericContentExt+0x110>
c0de7432:	6971      	ldr	r1, [r6, #20]
c0de7434:	b369      	cbz	r1, c0de7492 <nbgl_pageDrawGenericContentExt+0x136>
c0de7436:	f88d 0039 	strb.w	r0, [sp, #57]	@ 0x39
c0de743a:	2001      	movs	r0, #1
c0de743c:	9111      	str	r1, [sp, #68]	@ 0x44
c0de743e:	2103      	movs	r1, #3
c0de7440:	7972      	ldrb	r2, [r6, #5]
c0de7442:	f000 f9c9 	bl	c0de77d8 <OUTLINED_FUNCTION_3>
c0de7446:	2100      	movs	r1, #0
c0de7448:	f88d 103b 	strb.w	r1, [sp, #59]	@ 0x3b
c0de744c:	78b1      	ldrb	r1, [r6, #2]
c0de744e:	f88d 2049 	strb.w	r2, [sp, #73]	@ 0x49
c0de7452:	f88d 303c 	strb.w	r3, [sp, #60]	@ 0x3c
c0de7456:	f88d 2040 	strb.w	r2, [sp, #64]	@ 0x40
c0de745a:	f88d 003a 	strb.w	r0, [sp, #58]	@ 0x3a
c0de745e:	7cb0      	ldrb	r0, [r6, #18]
c0de7460:	f88d 1048 	strb.w	r1, [sp, #72]	@ 0x48
c0de7464:	f88d 003f 	strb.w	r0, [sp, #63]	@ 0x3f
c0de7468:	7cf0      	ldrb	r0, [r6, #19]
c0de746a:	e023      	b.n	c0de74b4 <nbgl_pageDrawGenericContentExt+0x158>
c0de746c:	6970      	ldr	r0, [r6, #20]
c0de746e:	b340      	cbz	r0, c0de74c2 <nbgl_pageDrawGenericContentExt+0x166>
c0de7470:	2100      	movs	r1, #0
c0de7472:	900e      	str	r0, [sp, #56]	@ 0x38
c0de7474:	2001      	movs	r0, #1
c0de7476:	f88d 103c 	strb.w	r1, [sp, #60]	@ 0x3c
c0de747a:	f88d 0034 	strb.w	r0, [sp, #52]	@ 0x34
c0de747e:	78b0      	ldrb	r0, [r6, #2]
c0de7480:	7971      	ldrb	r1, [r6, #5]
c0de7482:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de7486:	f88d 103e 	strb.w	r1, [sp, #62]	@ 0x3e
c0de748a:	e015      	b.n	c0de74b8 <nbgl_pageDrawGenericContentExt+0x15c>
c0de748c:	f04f 0800 	mov.w	r8, #0
c0de7490:	e017      	b.n	c0de74c2 <nbgl_pageDrawGenericContentExt+0x166>
c0de7492:	f88d 0039 	strb.w	r0, [sp, #57]	@ 0x39
c0de7496:	2000      	movs	r0, #0
c0de7498:	2104      	movs	r1, #4
c0de749a:	7c32      	ldrb	r2, [r6, #16]
c0de749c:	f000 f99c 	bl	c0de77d8 <OUTLINED_FUNCTION_3>
c0de74a0:	7971      	ldrb	r1, [r6, #5]
c0de74a2:	f88d 203b 	strb.w	r2, [sp, #59]	@ 0x3b
c0de74a6:	f88d 303c 	strb.w	r3, [sp, #60]	@ 0x3c
c0de74aa:	f88d 003a 	strb.w	r0, [sp, #58]	@ 0x3a
c0de74ae:	7cf0      	ldrb	r0, [r6, #19]
c0de74b0:	f88d 1040 	strb.w	r1, [sp, #64]	@ 0x40
c0de74b4:	f88d 0038 	strb.w	r0, [sp, #56]	@ 0x38
c0de74b8:	a90d      	add	r1, sp, #52	@ 0x34
c0de74ba:	4650      	mov	r0, sl
c0de74bc:	f7fc fc48 	bl	c0de3d50 <nbgl_layoutAddExtendedFooter>
c0de74c0:	1a3f      	subs	r7, r7, r0
c0de74c2:	6828      	ldr	r0, [r5, #0]
c0de74c4:	b190      	cbz	r0, c0de74ec <nbgl_pageDrawGenericContentExt+0x190>
c0de74c6:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de74c8:	2000      	movs	r0, #0
c0de74ca:	79a9      	ldrb	r1, [r5, #6]
c0de74cc:	900e      	str	r0, [sp, #56]	@ 0x38
c0de74ce:	f240 1001 	movw	r0, #257	@ 0x101
c0de74d2:	f8ad 0034 	strh.w	r0, [sp, #52]	@ 0x34
c0de74d6:	7968      	ldrb	r0, [r5, #5]
c0de74d8:	f88d 1041 	strb.w	r1, [sp, #65]	@ 0x41
c0de74dc:	f88d 0040 	strb.w	r0, [sp, #64]	@ 0x40
c0de74e0:	a90d      	add	r1, sp, #52	@ 0x34
c0de74e2:	4650      	mov	r0, sl
c0de74e4:	f7fe fbc8 	bl	c0de5c78 <nbgl_layoutAddHeader>
c0de74e8:	f04f 0801 	mov.w	r8, #1
c0de74ec:	68a9      	ldr	r1, [r5, #8]
c0de74ee:	b121      	cbz	r1, c0de74fa <nbgl_pageDrawGenericContentExt+0x19e>
c0de74f0:	79ab      	ldrb	r3, [r5, #6]
c0de74f2:	79ea      	ldrb	r2, [r5, #7]
c0de74f4:	4650      	mov	r0, sl
c0de74f6:	f7fc fbef 	bl	c0de3cd8 <nbgl_layoutAddTopRightButton>
c0de74fa:	7b28      	ldrb	r0, [r5, #12]
c0de74fc:	2800      	cmp	r0, #0
c0de74fe:	d044      	beq.n	c0de758a <nbgl_pageDrawGenericContentExt+0x22e>
c0de7500:	2801      	cmp	r0, #1
c0de7502:	d04d      	beq.n	c0de75a0 <nbgl_pageDrawGenericContentExt+0x244>
c0de7504:	2802      	cmp	r0, #2
c0de7506:	d067      	beq.n	c0de75d8 <nbgl_pageDrawGenericContentExt+0x27c>
c0de7508:	2803      	cmp	r0, #3
c0de750a:	d075      	beq.n	c0de75f8 <nbgl_pageDrawGenericContentExt+0x29c>
c0de750c:	2804      	cmp	r0, #4
c0de750e:	f000 8090 	beq.w	c0de7632 <nbgl_pageDrawGenericContentExt+0x2d6>
c0de7512:	2805      	cmp	r0, #5
c0de7514:	f000 8095 	beq.w	c0de7642 <nbgl_pageDrawGenericContentExt+0x2e6>
c0de7518:	2806      	cmp	r0, #6
c0de751a:	f000 80ab 	beq.w	c0de7674 <nbgl_pageDrawGenericContentExt+0x318>
c0de751e:	2807      	cmp	r0, #7
c0de7520:	f000 80db 	beq.w	c0de76da <nbgl_pageDrawGenericContentExt+0x37e>
c0de7524:	2808      	cmp	r0, #8
c0de7526:	f000 80ec 	beq.w	c0de7702 <nbgl_pageDrawGenericContentExt+0x3a6>
c0de752a:	2809      	cmp	r0, #9
c0de752c:	f000 8114 	beq.w	c0de7758 <nbgl_pageDrawGenericContentExt+0x3fc>
c0de7530:	280a      	cmp	r0, #10
c0de7532:	f040 8116 	bne.w	c0de7762 <nbgl_pageDrawGenericContentExt+0x406>
c0de7536:	489b      	ldr	r0, [pc, #620]	@ (c0de77a4 <nbgl_pageDrawGenericContentExt+0x448>)
c0de7538:	2400      	movs	r4, #0
c0de753a:	f10d 0834 	add.w	r8, sp, #52	@ 0x34
c0de753e:	2600      	movs	r6, #0
c0de7540:	4478      	add	r0, pc
c0de7542:	4683      	mov	fp, r0
c0de7544:	7e28      	ldrb	r0, [r5, #24]
c0de7546:	4286      	cmp	r6, r0
c0de7548:	f080 810b 	bcs.w	c0de7762 <nbgl_pageDrawGenericContentExt+0x406>
c0de754c:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de7550:	f850 0026 	ldr.w	r0, [r0, r6, lsl #2]
c0de7554:	e9cd b40f 	strd	fp, r4, [sp, #60]	@ 0x3c
c0de7558:	e9cd 400d 	strd	r4, r0, [sp, #52]	@ 0x34
c0de755c:	5d88      	ldrb	r0, [r1, r6]
c0de755e:	4641      	mov	r1, r8
c0de7560:	f88d 4046 	strb.w	r4, [sp, #70]	@ 0x46
c0de7564:	f88d 4044 	strb.w	r4, [sp, #68]	@ 0x44
c0de7568:	f88d 0045 	strb.w	r0, [sp, #69]	@ 0x45
c0de756c:	7e68      	ldrb	r0, [r5, #25]
c0de756e:	f88d 0048 	strb.w	r0, [sp, #72]	@ 0x48
c0de7572:	4650      	mov	r0, sl
c0de7574:	f7fc ff95 	bl	c0de44a2 <nbgl_layoutAddTouchableBar>
c0de7578:	1a3f      	subs	r7, r7, r0
c0de757a:	b2b8      	uxth	r0, r7
c0de757c:	280b      	cmp	r0, #11
c0de757e:	d302      	bcc.n	c0de7586 <nbgl_pageDrawGenericContentExt+0x22a>
c0de7580:	4650      	mov	r0, sl
c0de7582:	f7fe fa4f 	bl	c0de5a24 <nbgl_layoutAddSeparationLine>
c0de7586:	3601      	adds	r6, #1
c0de7588:	e7dc      	b.n	c0de7544 <nbgl_pageDrawGenericContentExt+0x1e8>
c0de758a:	f1b8 0f00 	cmp.w	r8, #0
c0de758e:	d101      	bne.n	c0de7594 <nbgl_pageDrawGenericContentExt+0x238>
c0de7590:	f000 f90f 	bl	c0de77b2 <OUTLINED_FUNCTION_0>
c0de7594:	f105 0110 	add.w	r1, r5, #16
c0de7598:	4650      	mov	r0, sl
c0de759a:	f7fd fcdb 	bl	c0de4f54 <nbgl_layoutAddCenteredInfo>
c0de759e:	e0e0      	b.n	c0de7762 <nbgl_pageDrawGenericContentExt+0x406>
c0de75a0:	f1b8 0f00 	cmp.w	r8, #0
c0de75a4:	d101      	bne.n	c0de75aa <nbgl_pageDrawGenericContentExt+0x24e>
c0de75a6:	f000 f904 	bl	c0de77b2 <OUTLINED_FUNCTION_0>
c0de75aa:	f105 0110 	add.w	r1, r5, #16
c0de75ae:	4650      	mov	r0, sl
c0de75b0:	f7fd fefe 	bl	c0de53b0 <nbgl_layoutAddContentCenter>
c0de75b4:	6b68      	ldr	r0, [r5, #52]	@ 0x34
c0de75b6:	2800      	cmp	r0, #0
c0de75b8:	f000 80d3 	beq.w	c0de7762 <nbgl_pageDrawGenericContentExt+0x406>
c0de75bc:	900e      	str	r0, [sp, #56]	@ 0x38
c0de75be:	2003      	movs	r0, #3
c0de75c0:	f88d 0034 	strb.w	r0, [sp, #52]	@ 0x34
c0de75c4:	6ba8      	ldr	r0, [r5, #56]	@ 0x38
c0de75c6:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de75c8:	8fa8      	ldrh	r0, [r5, #60]	@ 0x3c
c0de75ca:	f8ad 0040 	strh.w	r0, [sp, #64]	@ 0x40
c0de75ce:	a90d      	add	r1, sp, #52	@ 0x34
c0de75d0:	4650      	mov	r0, sl
c0de75d2:	f7fc f815 	bl	c0de3600 <nbgl_layoutAddUpFooter>
c0de75d6:	e0c4      	b.n	c0de7762 <nbgl_pageDrawGenericContentExt+0x406>
c0de75d8:	ae0d      	add	r6, sp, #52	@ 0x34
c0de75da:	2124      	movs	r1, #36	@ 0x24
c0de75dc:	4630      	mov	r0, r6
c0de75de:	f003 fde7 	bl	c0deb1b0 <__aeabi_memclr>
c0de75e2:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de75e6:	f000 f8f1 	bl	c0de77cc <OUTLINED_FUNCTION_2>
c0de75ea:	69a9      	ldr	r1, [r5, #24]
c0de75ec:	7f6b      	ldrb	r3, [r5, #29]
c0de75ee:	7f2a      	ldrb	r2, [r5, #28]
c0de75f0:	4650      	mov	r0, sl
c0de75f2:	f7fe fb08 	bl	c0de5c06 <nbgl_layoutAddLongPressButton>
c0de75f6:	e0b4      	b.n	c0de7762 <nbgl_pageDrawGenericContentExt+0x406>
c0de75f8:	ae0d      	add	r6, sp, #52	@ 0x34
c0de75fa:	2124      	movs	r1, #36	@ 0x24
c0de75fc:	4630      	mov	r0, r6
c0de75fe:	f003 fdd7 	bl	c0deb1b0 <__aeabi_memclr>
c0de7602:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de7606:	2400      	movs	r4, #0
c0de7608:	f88d 4034 	strb.w	r4, [sp, #52]	@ 0x34
c0de760c:	f000 f8de 	bl	c0de77cc <OUTLINED_FUNCTION_2>
c0de7610:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0de7614:	940a      	str	r4, [sp, #40]	@ 0x28
c0de7616:	f88d 402d 	strb.w	r4, [sp, #45]	@ 0x2d
c0de761a:	f8ad 002e 	strh.w	r0, [sp, #46]	@ 0x2e
c0de761e:	69a8      	ldr	r0, [r5, #24]
c0de7620:	9009      	str	r0, [sp, #36]	@ 0x24
c0de7622:	7f28      	ldrb	r0, [r5, #28]
c0de7624:	f88d 002c 	strb.w	r0, [sp, #44]	@ 0x2c
c0de7628:	7f68      	ldrb	r0, [r5, #29]
c0de762a:	f88d 0030 	strb.w	r0, [sp, #48]	@ 0x30
c0de762e:	a909      	add	r1, sp, #36	@ 0x24
c0de7630:	e04f      	b.n	c0de76d2 <nbgl_pageDrawGenericContentExt+0x376>
c0de7632:	f1b8 0f00 	cmp.w	r8, #0
c0de7636:	d101      	bne.n	c0de763c <nbgl_pageDrawGenericContentExt+0x2e0>
c0de7638:	f000 f8bb 	bl	c0de77b2 <OUTLINED_FUNCTION_0>
c0de763c:	f000 f8da 	bl	c0de77f4 <OUTLINED_FUNCTION_5>
c0de7640:	e08f      	b.n	c0de7762 <nbgl_pageDrawGenericContentExt+0x406>
c0de7642:	f1b8 0f00 	cmp.w	r8, #0
c0de7646:	d101      	bne.n	c0de764c <nbgl_pageDrawGenericContentExt+0x2f0>
c0de7648:	f000 f8b3 	bl	c0de77b2 <OUTLINED_FUNCTION_0>
c0de764c:	7ea8      	ldrb	r0, [r5, #26]
c0de764e:	f105 0110 	add.w	r1, r5, #16
c0de7652:	3803      	subs	r0, #3
c0de7654:	76a8      	strb	r0, [r5, #26]
c0de7656:	4650      	mov	r0, sl
c0de7658:	f7fe f850 	bl	c0de56fc <nbgl_layoutAddTagValueList>
c0de765c:	2001      	movs	r0, #1
c0de765e:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de7662:	f8ad 003e 	strh.w	r0, [sp, #62]	@ 0x3e
c0de7666:	e9d5 0109 	ldrd	r0, r1, [r5, #36]	@ 0x24
c0de766a:	e9cd 100d 	strd	r1, r0, [sp, #52]	@ 0x34
c0de766e:	f000 f8ba 	bl	c0de77e6 <OUTLINED_FUNCTION_4>
c0de7672:	e02b      	b.n	c0de76cc <nbgl_pageDrawGenericContentExt+0x370>
c0de7674:	f1b8 0f00 	cmp.w	r8, #0
c0de7678:	d101      	bne.n	c0de767e <nbgl_pageDrawGenericContentExt+0x322>
c0de767a:	f000 f89a 	bl	c0de77b2 <OUTLINED_FUNCTION_0>
c0de767e:	f000 f8b9 	bl	c0de77f4 <OUTLINED_FUNCTION_5>
c0de7682:	6aa8      	ldr	r0, [r5, #40]	@ 0x28
c0de7684:	2800      	cmp	r0, #0
c0de7686:	d073      	beq.n	c0de7770 <nbgl_pageDrawGenericContentExt+0x414>
c0de7688:	900d      	str	r0, [sp, #52]	@ 0x34
c0de768a:	6a68      	ldr	r0, [r5, #36]	@ 0x24
c0de768c:	2101      	movs	r1, #1
c0de768e:	f8ad 103e 	strh.w	r1, [sp, #62]	@ 0x3e
c0de7692:	f88d 103d 	strb.w	r1, [sp, #61]	@ 0x3d
c0de7696:	900e      	str	r0, [sp, #56]	@ 0x38
c0de7698:	f000 f8a5 	bl	c0de77e6 <OUTLINED_FUNCTION_4>
c0de769c:	f88d 0040 	strb.w	r0, [sp, #64]	@ 0x40
c0de76a0:	a90d      	add	r1, sp, #52	@ 0x34
c0de76a2:	4650      	mov	r0, sl
c0de76a4:	f7fe f9d0 	bl	c0de5a48 <nbgl_layoutAddButton>
c0de76a8:	6b28      	ldr	r0, [r5, #48]	@ 0x30
c0de76aa:	2800      	cmp	r0, #0
c0de76ac:	d059      	beq.n	c0de7762 <nbgl_pageDrawGenericContentExt+0x406>
c0de76ae:	2100      	movs	r1, #0
c0de76b0:	900d      	str	r0, [sp, #52]	@ 0x34
c0de76b2:	f895 002d 	ldrb.w	r0, [r5, #45]	@ 0x2d
c0de76b6:	f88d 103d 	strb.w	r1, [sp, #61]	@ 0x3d
c0de76ba:	910e      	str	r1, [sp, #56]	@ 0x38
c0de76bc:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de76c0:	f8ad 103e 	strh.w	r1, [sp, #62]	@ 0x3e
c0de76c4:	f895 1038 	ldrb.w	r1, [r5, #56]	@ 0x38
c0de76c8:	f88d 103c 	strb.w	r1, [sp, #60]	@ 0x3c
c0de76cc:	f88d 0040 	strb.w	r0, [sp, #64]	@ 0x40
c0de76d0:	a90d      	add	r1, sp, #52	@ 0x34
c0de76d2:	4650      	mov	r0, sl
c0de76d4:	f7fe f9b8 	bl	c0de5a48 <nbgl_layoutAddButton>
c0de76d8:	e043      	b.n	c0de7762 <nbgl_pageDrawGenericContentExt+0x406>
c0de76da:	2400      	movs	r4, #0
c0de76dc:	2600      	movs	r6, #0
c0de76de:	7d28      	ldrb	r0, [r5, #20]
c0de76e0:	4286      	cmp	r6, r0
c0de76e2:	d23e      	bcs.n	c0de7762 <nbgl_pageDrawGenericContentExt+0x406>
c0de76e4:	6928      	ldr	r0, [r5, #16]
c0de76e6:	1901      	adds	r1, r0, r4
c0de76e8:	4650      	mov	r0, sl
c0de76ea:	f7fd f8db 	bl	c0de48a4 <nbgl_layoutAddSwitch>
c0de76ee:	1a3f      	subs	r7, r7, r0
c0de76f0:	b2b8      	uxth	r0, r7
c0de76f2:	280b      	cmp	r0, #11
c0de76f4:	d302      	bcc.n	c0de76fc <nbgl_pageDrawGenericContentExt+0x3a0>
c0de76f6:	4650      	mov	r0, sl
c0de76f8:	f7fe f994 	bl	c0de5a24 <nbgl_layoutAddSeparationLine>
c0de76fc:	340c      	adds	r4, #12
c0de76fe:	3601      	adds	r6, #1
c0de7700:	e7ed      	b.n	c0de76de <nbgl_pageDrawGenericContentExt+0x382>
c0de7702:	2600      	movs	r6, #0
c0de7704:	2400      	movs	r4, #0
c0de7706:	7f28      	ldrb	r0, [r5, #28]
c0de7708:	4284      	cmp	r4, r0
c0de770a:	d22a      	bcs.n	c0de7762 <nbgl_pageDrawGenericContentExt+0x406>
c0de770c:	7fa8      	ldrb	r0, [r5, #30]
c0de770e:	b180      	cbz	r0, c0de7732 <nbgl_pageDrawGenericContentExt+0x3d6>
c0de7710:	69a8      	ldr	r0, [r5, #24]
c0de7712:	b170      	cbz	r0, c0de7732 <nbgl_pageDrawGenericContentExt+0x3d6>
c0de7714:	5980      	ldr	r0, [r0, r6]
c0de7716:	b160      	cbz	r0, c0de7732 <nbgl_pageDrawGenericContentExt+0x3d6>
c0de7718:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de771c:	7f6b      	ldrb	r3, [r5, #29]
c0de771e:	f851 2024 	ldr.w	r2, [r1, r4, lsl #2]
c0de7722:	f850 1024 	ldr.w	r1, [r0, r4, lsl #2]
c0de7726:	b2e0      	uxtb	r0, r4
c0de7728:	9000      	str	r0, [sp, #0]
c0de772a:	4650      	mov	r0, sl
c0de772c:	f7fd fa24 	bl	c0de4b78 <nbgl_layoutAddTextWithAlias>
c0de7730:	e008      	b.n	c0de7744 <nbgl_pageDrawGenericContentExt+0x3e8>
c0de7732:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de7736:	f851 2024 	ldr.w	r2, [r1, r4, lsl #2]
c0de773a:	f850 1024 	ldr.w	r1, [r0, r4, lsl #2]
c0de773e:	4650      	mov	r0, sl
c0de7740:	f7fd f8d2 	bl	c0de48e8 <nbgl_layoutAddText>
c0de7744:	1a3f      	subs	r7, r7, r0
c0de7746:	b2b8      	uxth	r0, r7
c0de7748:	280b      	cmp	r0, #11
c0de774a:	d302      	bcc.n	c0de7752 <nbgl_pageDrawGenericContentExt+0x3f6>
c0de774c:	4650      	mov	r0, sl
c0de774e:	f7fe f969 	bl	c0de5a24 <nbgl_layoutAddSeparationLine>
c0de7752:	3618      	adds	r6, #24
c0de7754:	3401      	adds	r4, #1
c0de7756:	e7d6      	b.n	c0de7706 <nbgl_pageDrawGenericContentExt+0x3aa>
c0de7758:	f105 0110 	add.w	r1, r5, #16
c0de775c:	4650      	mov	r0, sl
c0de775e:	f7fd fad3 	bl	c0de4d08 <nbgl_layoutAddRadioChoice>
c0de7762:	4650      	mov	r0, sl
c0de7764:	f7fe feea 	bl	c0de653c <nbgl_layoutDraw>
c0de7768:	4650      	mov	r0, sl
c0de776a:	b016      	add	sp, #88	@ 0x58
c0de776c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de7770:	6a68      	ldr	r0, [r5, #36]	@ 0x24
c0de7772:	2800      	cmp	r0, #0
c0de7774:	d098      	beq.n	c0de76a8 <nbgl_pageDrawGenericContentExt+0x34c>
c0de7776:	6b29      	ldr	r1, [r5, #48]	@ 0x30
c0de7778:	2900      	cmp	r1, #0
c0de777a:	d095      	beq.n	c0de76a8 <nbgl_pageDrawGenericContentExt+0x34c>
c0de777c:	e9cd 010d 	strd	r0, r1, [sp, #52]	@ 0x34
c0de7780:	f895 002c 	ldrb.w	r0, [r5, #44]	@ 0x2c
c0de7784:	f895 102d 	ldrb.w	r1, [r5, #45]	@ 0x2d
c0de7788:	f895 2038 	ldrb.w	r2, [r5, #56]	@ 0x38
c0de778c:	f88d 003c 	strb.w	r0, [sp, #60]	@ 0x3c
c0de7790:	f88d 203d 	strb.w	r2, [sp, #61]	@ 0x3d
c0de7794:	f88d 103e 	strb.w	r1, [sp, #62]	@ 0x3e
c0de7798:	a90d      	add	r1, sp, #52	@ 0x34
c0de779a:	4650      	mov	r0, sl
c0de779c:	f7fd ff9a 	bl	c0de56d4 <nbgl_layoutAddHorizontalButtons>
c0de77a0:	e7df      	b.n	c0de7762 <nbgl_pageDrawGenericContentExt+0x406>
c0de77a2:	bf00      	nop
c0de77a4:	00004981 	.word	0x00004981

c0de77a8 <nbgl_pageDrawGenericContent>:
c0de77a8:	2300      	movs	r3, #0
c0de77aa:	f7ff bdd7 	b.w	c0de735c <nbgl_pageDrawGenericContentExt>

c0de77ae <nbgl_pageRelease>:
c0de77ae:	f7fe bef3 	b.w	c0de6598 <nbgl_layoutRelease>

c0de77b2 <OUTLINED_FUNCTION_0>:
c0de77b2:	4650      	mov	r0, sl
c0de77b4:	2128      	movs	r1, #40	@ 0x28
c0de77b6:	f7ff bc9d 	b.w	c0de70f4 <addEmptyHeader>

c0de77ba <OUTLINED_FUNCTION_1>:
c0de77ba:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de77be:	788a      	ldrb	r2, [r1, #2]
c0de77c0:	78c9      	ldrb	r1, [r1, #3]
c0de77c2:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de77c6:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de77ca:	4770      	bx	lr

c0de77cc <OUTLINED_FUNCTION_2>:
c0de77cc:	910e      	str	r1, [sp, #56]	@ 0x38
c0de77ce:	9011      	str	r0, [sp, #68]	@ 0x44
c0de77d0:	4650      	mov	r0, sl
c0de77d2:	4631      	mov	r1, r6
c0de77d4:	f7fd bdec 	b.w	c0de53b0 <nbgl_layoutAddContentCenter>

c0de77d8 <OUTLINED_FUNCTION_3>:
c0de77d8:	7c73      	ldrb	r3, [r6, #17]
c0de77da:	f88d 003e 	strb.w	r0, [sp, #62]	@ 0x3e
c0de77de:	7830      	ldrb	r0, [r6, #0]
c0de77e0:	f88d 1034 	strb.w	r1, [sp, #52]	@ 0x34
c0de77e4:	4770      	bx	lr

c0de77e6 <OUTLINED_FUNCTION_4>:
c0de77e6:	f895 002c 	ldrb.w	r0, [r5, #44]	@ 0x2c
c0de77ea:	f88d 003c 	strb.w	r0, [sp, #60]	@ 0x3c
c0de77ee:	f895 002d 	ldrb.w	r0, [r5, #45]	@ 0x2d
c0de77f2:	4770      	bx	lr

c0de77f4 <OUTLINED_FUNCTION_5>:
c0de77f4:	f105 0110 	add.w	r1, r5, #16
c0de77f8:	4650      	mov	r0, sl
c0de77fa:	f7fd bf7f 	b.w	c0de56fc <nbgl_layoutAddTagValueList>

c0de77fe <getNbTagValuesInPage>:
c0de77fe:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de7802:	4604      	mov	r4, r0
c0de7804:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de7806:	f04f 0800 	mov.w	r8, #0
c0de780a:	2b00      	cmp	r3, #0
c0de780c:	460e      	mov	r6, r1
c0de780e:	f04f 0b00 	mov.w	fp, #0
c0de7812:	f880 8000 	strb.w	r8, [r0]
c0de7816:	f44f 70e8 	mov.w	r0, #464	@ 0x1d0
c0de781a:	bf18      	it	ne
c0de781c:	f44f 70cc 	movne.w	r0, #408	@ 0x198
c0de7820:	0111      	lsls	r1, r2, #4
c0de7822:	e9cd 2001 	strd	r2, r0, [sp, #4]
c0de7826:	4544      	cmp	r4, r8
c0de7828:	d052      	beq.n	c0de78d0 <getNbTagValuesInPage+0xd2>
c0de782a:	465d      	mov	r5, fp
c0de782c:	f10b 0a18 	add.w	sl, fp, #24
c0de7830:	f1b8 0f00 	cmp.w	r8, #0
c0de7834:	bf18      	it	ne
c0de7836:	4655      	movne	r5, sl
c0de7838:	6830      	ldr	r0, [r6, #0]
c0de783a:	9103      	str	r1, [sp, #12]
c0de783c:	b108      	cbz	r0, c0de7842 <getNbTagValuesInPage+0x44>
c0de783e:	4408      	add	r0, r1
c0de7840:	e004      	b.n	c0de784c <getNbTagValuesInPage+0x4e>
c0de7842:	9801      	ldr	r0, [sp, #4]
c0de7844:	6871      	ldr	r1, [r6, #4]
c0de7846:	4440      	add	r0, r8
c0de7848:	b2c0      	uxtb	r0, r0
c0de784a:	4788      	blx	r1
c0de784c:	f003 fa8e 	bl	c0dead6c <pic>
c0de7850:	4607      	mov	r7, r0
c0de7852:	7b00      	ldrb	r0, [r0, #12]
c0de7854:	07c1      	lsls	r1, r0, #31
c0de7856:	bf18      	it	ne
c0de7858:	f1b8 0f00 	cmpne.w	r8, #0
c0de785c:	d13b      	bne.n	c0de78d6 <getNbTagValuesInPage+0xd8>
c0de785e:	0780      	lsls	r0, r0, #30
c0de7860:	d45d      	bmi.n	c0de791e <getNbTagValuesInPage+0x120>
c0de7862:	7b73      	ldrb	r3, [r6, #13]
c0de7864:	6839      	ldr	r1, [r7, #0]
c0de7866:	200b      	movs	r0, #11
c0de7868:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de786c:	46a2      	mov	sl, r4
c0de786e:	f003 f8b5 	bl	c0dea9dc <nbgl_getTextHeightInWidth>
c0de7872:	182c      	adds	r4, r5, r0
c0de7874:	7b30      	ldrb	r0, [r6, #12]
c0de7876:	250b      	movs	r5, #11
c0de7878:	7b73      	ldrb	r3, [r6, #13]
c0de787a:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de787e:	2800      	cmp	r0, #0
c0de7880:	bf08      	it	eq
c0de7882:	250d      	moveq	r5, #13
c0de7884:	6879      	ldr	r1, [r7, #4]
c0de7886:	4628      	mov	r0, r5
c0de7888:	f003 f8a8 	bl	c0dea9dc <nbgl_getTextHeightInWidth>
c0de788c:	4420      	add	r0, r4
c0de788e:	6879      	ldr	r1, [r7, #4]
c0de7890:	7b73      	ldrb	r3, [r6, #13]
c0de7892:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de7896:	f100 0b04 	add.w	fp, r0, #4
c0de789a:	4628      	mov	r0, r5
c0de789c:	fa1f f48b 	uxth.w	r4, fp
c0de78a0:	f003 f8a1 	bl	c0dea9e6 <nbgl_getTextNbLinesInWidth>
c0de78a4:	9902      	ldr	r1, [sp, #8]
c0de78a6:	428c      	cmp	r4, r1
c0de78a8:	bf38      	it	cc
c0de78aa:	280a      	cmpcc	r0, #10
c0de78ac:	d205      	bcs.n	c0de78ba <getNbTagValuesInPage+0xbc>
c0de78ae:	9903      	ldr	r1, [sp, #12]
c0de78b0:	f108 0801 	add.w	r8, r8, #1
c0de78b4:	4654      	mov	r4, sl
c0de78b6:	3110      	adds	r1, #16
c0de78b8:	e7b5      	b.n	c0de7826 <getNbTagValuesInPage+0x28>
c0de78ba:	ea5f 6008 	movs.w	r0, r8, lsl #24
c0de78be:	d104      	bne.n	c0de78ca <getNbTagValuesInPage+0xcc>
c0de78c0:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de78c2:	f04f 0801 	mov.w	r8, #1
c0de78c6:	f880 8000 	strb.w	r8, [r0]
c0de78ca:	4654      	mov	r4, sl
c0de78cc:	46da      	mov	sl, fp
c0de78ce:	e003      	b.n	c0de78d8 <getNbTagValuesInPage+0xda>
c0de78d0:	46da      	mov	sl, fp
c0de78d2:	46a0      	mov	r8, r4
c0de78d4:	e000      	b.n	c0de78d8 <getNbTagValuesInPage+0xda>
c0de78d6:	46aa      	mov	sl, r5
c0de78d8:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de78da:	b170      	cbz	r0, c0de78fa <getNbTagValuesInPage+0xfc>
c0de78dc:	fa5f f088 	uxtb.w	r0, r8
c0de78e0:	42a0      	cmp	r0, r4
c0de78e2:	d10a      	bne.n	c0de78fa <getNbTagValuesInPage+0xfc>
c0de78e4:	9902      	ldr	r1, [sp, #8]
c0de78e6:	fa1f f08a 	uxth.w	r0, sl
c0de78ea:	f501 71bc 	add.w	r1, r1, #376	@ 0x178
c0de78ee:	f401 71ac 	and.w	r1, r1, #344	@ 0x158
c0de78f2:	4281      	cmp	r1, r0
c0de78f4:	bf38      	it	cc
c0de78f6:	3c01      	subcc	r4, #1
c0de78f8:	e00d      	b.n	c0de7916 <getNbTagValuesInPage+0x118>
c0de78fa:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de78fc:	b150      	cbz	r0, c0de7914 <getNbTagValuesInPage+0x116>
c0de78fe:	9902      	ldr	r1, [sp, #8]
c0de7900:	fa1f f08a 	uxth.w	r0, sl
c0de7904:	f501 71e0 	add.w	r1, r1, #448	@ 0x1c0
c0de7908:	f401 71ec 	and.w	r1, r1, #472	@ 0x1d8
c0de790c:	4281      	cmp	r1, r0
c0de790e:	bf38      	it	cc
c0de7910:	f1a8 0801 	subcc.w	r8, r8, #1
c0de7914:	4644      	mov	r4, r8
c0de7916:	b2e0      	uxtb	r0, r4
c0de7918:	b004      	add	sp, #16
c0de791a:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de791e:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de7920:	f1b8 0f00 	cmp.w	r8, #0
c0de7924:	d1d9      	bne.n	c0de78da <getNbTagValuesInPage+0xdc>
c0de7926:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de7928:	f04f 0801 	mov.w	r8, #1
c0de792c:	46da      	mov	sl, fp
c0de792e:	f881 8000 	strb.w	r8, [r1]
c0de7932:	e7d2      	b.n	c0de78da <getNbTagValuesInPage+0xdc>

c0de7934 <nbgl_useCaseGetNbInfosInPage>:
c0de7934:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de7938:	f44f 74fc 	mov.w	r4, #504	@ 0x1f8
c0de793c:	9001      	str	r0, [sp, #4]
c0de793e:	9300      	str	r3, [sp, #0]
c0de7940:	2b00      	cmp	r3, #0
c0de7942:	4616      	mov	r6, r2
c0de7944:	460f      	mov	r7, r1
c0de7946:	bf18      	it	ne
c0de7948:	f44f 74cc 	movne.w	r4, #408	@ 0x198
c0de794c:	6808      	ldr	r0, [r1, #0]
c0de794e:	f003 fa0d 	bl	c0dead6c <pic>
c0de7952:	eb00 0b86 	add.w	fp, r0, r6, lsl #2
c0de7956:	6878      	ldr	r0, [r7, #4]
c0de7958:	f003 fa08 	bl	c0dead6c <pic>
c0de795c:	eb00 0586 	add.w	r5, r0, r6, lsl #2
c0de7960:	2700      	movs	r7, #0
c0de7962:	f04f 0800 	mov.w	r8, #0
c0de7966:	f04f 0a00 	mov.w	sl, #0
c0de796a:	9801      	ldr	r0, [sp, #4]
c0de796c:	42b8      	cmp	r0, r7
c0de796e:	d01e      	beq.n	c0de79ae <nbgl_useCaseGetNbInfosInPage+0x7a>
c0de7970:	f85b 0027 	ldr.w	r0, [fp, r7, lsl #2]
c0de7974:	f003 f9fa 	bl	c0dead6c <pic>
c0de7978:	4601      	mov	r1, r0
c0de797a:	200c      	movs	r0, #12
c0de797c:	f002 fb2b 	bl	c0de9fd6 <OUTLINED_FUNCTION_2>
c0de7980:	4606      	mov	r6, r0
c0de7982:	f855 0027 	ldr.w	r0, [r5, r7, lsl #2]
c0de7986:	f003 f9f1 	bl	c0dead6c <pic>
c0de798a:	4601      	mov	r1, r0
c0de798c:	200b      	movs	r0, #11
c0de798e:	f002 fb22 	bl	c0de9fd6 <OUTLINED_FUNCTION_2>
c0de7992:	eb0a 0106 	add.w	r1, sl, r6
c0de7996:	4408      	add	r0, r1
c0de7998:	302a      	adds	r0, #42	@ 0x2a
c0de799a:	b280      	uxth	r0, r0
c0de799c:	f100 0a1a 	add.w	sl, r0, #26
c0de79a0:	fa1f f08a 	uxth.w	r0, sl
c0de79a4:	42a0      	cmp	r0, r4
c0de79a6:	d204      	bcs.n	c0de79b2 <nbgl_useCaseGetNbInfosInPage+0x7e>
c0de79a8:	3701      	adds	r7, #1
c0de79aa:	4680      	mov	r8, r0
c0de79ac:	e7dd      	b.n	c0de796a <nbgl_useCaseGetNbInfosInPage+0x36>
c0de79ae:	9f01      	ldr	r7, [sp, #4]
c0de79b0:	e006      	b.n	c0de79c0 <nbgl_useCaseGetNbInfosInPage+0x8c>
c0de79b2:	9800      	ldr	r0, [sp, #0]
c0de79b4:	b920      	cbnz	r0, c0de79c0 <nbgl_useCaseGetNbInfosInPage+0x8c>
c0de79b6:	ea4f 00d8 	mov.w	r0, r8, lsr #3
c0de79ba:	2832      	cmp	r0, #50	@ 0x32
c0de79bc:	bf88      	it	hi
c0de79be:	3f01      	subhi	r7, #1
c0de79c0:	b2f8      	uxtb	r0, r7
c0de79c2:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de79c6 <nbgl_useCaseGetNbSwitchesInPage>:
c0de79c6:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de79ca:	f44f 77fc 	mov.w	r7, #504	@ 0x1f8
c0de79ce:	2b00      	cmp	r3, #0
c0de79d0:	4682      	mov	sl, r0
c0de79d2:	4698      	mov	r8, r3
c0de79d4:	4616      	mov	r6, r2
c0de79d6:	bf18      	it	ne
c0de79d8:	f44f 77cc 	movne.w	r7, #408	@ 0x198
c0de79dc:	6808      	ldr	r0, [r1, #0]
c0de79de:	f003 f9c5 	bl	c0dead6c <pic>
c0de79e2:	eb06 0146 	add.w	r1, r6, r6, lsl #1
c0de79e6:	2600      	movs	r6, #0
c0de79e8:	eb00 0081 	add.w	r0, r0, r1, lsl #2
c0de79ec:	1d04      	adds	r4, r0, #4
c0de79ee:	2000      	movs	r0, #0
c0de79f0:	4605      	mov	r5, r0
c0de79f2:	45b2      	cmp	sl, r6
c0de79f4:	d010      	beq.n	c0de7a18 <nbgl_useCaseGetNbSwitchesInPage+0x52>
c0de79f6:	6821      	ldr	r1, [r4, #0]
c0de79f8:	b129      	cbz	r1, c0de7a06 <nbgl_useCaseGetNbSwitchesInPage+0x40>
c0de79fa:	200b      	movs	r0, #11
c0de79fc:	f002 faeb 	bl	c0de9fd6 <OUTLINED_FUNCTION_2>
c0de7a00:	4428      	add	r0, r5
c0de7a02:	3068      	adds	r0, #104	@ 0x68
c0de7a04:	e001      	b.n	c0de7a0a <nbgl_useCaseGetNbSwitchesInPage+0x44>
c0de7a06:	f105 005c 	add.w	r0, r5, #92	@ 0x5c
c0de7a0a:	340c      	adds	r4, #12
c0de7a0c:	3601      	adds	r6, #1
c0de7a0e:	b281      	uxth	r1, r0
c0de7a10:	428f      	cmp	r7, r1
c0de7a12:	d8ed      	bhi.n	c0de79f0 <nbgl_useCaseGetNbSwitchesInPage+0x2a>
c0de7a14:	f1a6 0a01 	sub.w	sl, r6, #1
c0de7a18:	b2a8      	uxth	r0, r5
c0de7a1a:	2100      	movs	r1, #0
c0de7a1c:	08c0      	lsrs	r0, r0, #3
c0de7a1e:	2832      	cmp	r0, #50	@ 0x32
c0de7a20:	bf88      	it	hi
c0de7a22:	2101      	movhi	r1, #1
c0de7a24:	ea21 0008 	bic.w	r0, r1, r8
c0de7a28:	ebaa 0000 	sub.w	r0, sl, r0
c0de7a2c:	b2c0      	uxtb	r0, r0
c0de7a2e:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}

c0de7a32 <nbgl_useCaseGetNbBarsInPage>:
c0de7a32:	b570      	push	{r4, r5, r6, lr}
c0de7a34:	f44f 71fc 	mov.w	r1, #504	@ 0x1f8
c0de7a38:	2b00      	cmp	r3, #0
c0de7a3a:	bf18      	it	ne
c0de7a3c:	f44f 71cc 	movne.w	r1, #408	@ 0x198
c0de7a40:	2200      	movs	r2, #0
c0de7a42:	2400      	movs	r4, #0
c0de7a44:	2500      	movs	r5, #0
c0de7a46:	b2ee      	uxtb	r6, r5
c0de7a48:	4286      	cmp	r6, r0
c0de7a4a:	d208      	bcs.n	c0de7a5e <nbgl_useCaseGetNbBarsInPage+0x2c>
c0de7a4c:	b292      	uxth	r2, r2
c0de7a4e:	325c      	adds	r2, #92	@ 0x5c
c0de7a50:	b296      	uxth	r6, r2
c0de7a52:	428e      	cmp	r6, r1
c0de7a54:	d202      	bcs.n	c0de7a5c <nbgl_useCaseGetNbBarsInPage+0x2a>
c0de7a56:	3501      	adds	r5, #1
c0de7a58:	4634      	mov	r4, r6
c0de7a5a:	e7f4      	b.n	c0de7a46 <nbgl_useCaseGetNbBarsInPage+0x14>
c0de7a5c:	4628      	mov	r0, r5
c0de7a5e:	08e1      	lsrs	r1, r4, #3
c0de7a60:	2200      	movs	r2, #0
c0de7a62:	2932      	cmp	r1, #50	@ 0x32
c0de7a64:	bf88      	it	hi
c0de7a66:	2201      	movhi	r2, #1
c0de7a68:	ea22 0103 	bic.w	r1, r2, r3
c0de7a6c:	1a40      	subs	r0, r0, r1
c0de7a6e:	b2c0      	uxtb	r0, r0
c0de7a70:	bd70      	pop	{r4, r5, r6, pc}

c0de7a72 <nbgl_useCaseGetNbChoicesInPage>:
c0de7a72:	b570      	push	{r4, r5, r6, lr}
c0de7a74:	f44f 72fc 	mov.w	r2, #504	@ 0x1f8
c0de7a78:	2b00      	cmp	r3, #0
c0de7a7a:	bf18      	it	ne
c0de7a7c:	f44f 72cc 	movne.w	r2, #408	@ 0x198
c0de7a80:	2400      	movs	r4, #0
c0de7a82:	2500      	movs	r5, #0
c0de7a84:	2100      	movs	r1, #0
c0de7a86:	b2ce      	uxtb	r6, r1
c0de7a88:	4286      	cmp	r6, r0
c0de7a8a:	d207      	bcs.n	c0de7a9c <nbgl_useCaseGetNbChoicesInPage+0x2a>
c0de7a8c:	b2a4      	uxth	r4, r4
c0de7a8e:	345c      	adds	r4, #92	@ 0x5c
c0de7a90:	b2a6      	uxth	r6, r4
c0de7a92:	4296      	cmp	r6, r2
c0de7a94:	d204      	bcs.n	c0de7aa0 <nbgl_useCaseGetNbChoicesInPage+0x2e>
c0de7a96:	3101      	adds	r1, #1
c0de7a98:	4635      	mov	r5, r6
c0de7a9a:	e7f4      	b.n	c0de7a86 <nbgl_useCaseGetNbChoicesInPage+0x14>
c0de7a9c:	4601      	mov	r1, r0
c0de7a9e:	e004      	b.n	c0de7aaa <nbgl_useCaseGetNbChoicesInPage+0x38>
c0de7aa0:	b91b      	cbnz	r3, c0de7aaa <nbgl_useCaseGetNbChoicesInPage+0x38>
c0de7aa2:	08e8      	lsrs	r0, r5, #3
c0de7aa4:	2832      	cmp	r0, #50	@ 0x32
c0de7aa6:	bf88      	it	hi
c0de7aa8:	3901      	subhi	r1, #1
c0de7aaa:	b2c8      	uxtb	r0, r1
c0de7aac:	bd70      	pop	{r4, r5, r6, pc}
	...

c0de7ab0 <useCaseHomeExt>:
c0de7ab0:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de7ab4:	b08f      	sub	sp, #60	@ 0x3c
c0de7ab6:	4604      	mov	r4, r0
c0de7ab8:	a802      	add	r0, sp, #8
c0de7aba:	460f      	mov	r7, r1
c0de7abc:	2130      	movs	r1, #48	@ 0x30
c0de7abe:	461e      	mov	r6, r3
c0de7ac0:	4615      	mov	r5, r2
c0de7ac2:	3004      	adds	r0, #4
c0de7ac4:	f003 fb74 	bl	c0deb1b0 <__aeabi_memclr>
c0de7ac8:	2009      	movs	r0, #9
c0de7aca:	f88d 0039 	strb.w	r0, [sp, #57]	@ 0x39
c0de7ace:	2006      	movs	r0, #6
c0de7ad0:	f88d 001e 	strb.w	r0, [sp, #30]
c0de7ad4:	2004      	movs	r0, #4
c0de7ad6:	f88d 001d 	strb.w	r0, [sp, #29]
c0de7ada:	2003      	movs	r0, #3
c0de7adc:	2e00      	cmp	r6, #0
c0de7ade:	bf18      	it	ne
c0de7ae0:	2001      	movne	r0, #1
c0de7ae2:	f88d 001c 	strb.w	r0, [sp, #28]
c0de7ae6:	9705      	str	r7, [sp, #20]
c0de7ae8:	9402      	str	r4, [sp, #8]
c0de7aea:	f000 f87b 	bl	c0de7be4 <reset_callbacks_and_context>
c0de7aee:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de7af0:	e9d0 1200 	ldrd	r1, r2, [r0]
c0de7af4:	b951      	cbnz	r1, c0de7b0c <useCaseHomeExt+0x5c>
c0de7af6:	b94a      	cbnz	r2, c0de7b0c <useCaseHomeExt+0x5c>
c0de7af8:	4831      	ldr	r0, [pc, #196]	@ (c0de7bc0 <useCaseHomeExt+0x110>)
c0de7afa:	2100      	movs	r1, #0
c0de7afc:	e9cd 110c 	strd	r1, r1, [sp, #48]	@ 0x30
c0de7b00:	4448      	add	r0, r9
c0de7b02:	6241      	str	r1, [r0, #36]	@ 0x24
c0de7b04:	2002      	movs	r0, #2
c0de7b06:	f88d 001f 	strb.w	r0, [sp, #31]
c0de7b0a:	e00e      	b.n	c0de7b2a <useCaseHomeExt+0x7a>
c0de7b0c:	4b2c      	ldr	r3, [pc, #176]	@ (c0de7bc0 <useCaseHomeExt+0x110>)
c0de7b0e:	6886      	ldr	r6, [r0, #8]
c0de7b10:	e9cd 120c 	strd	r1, r2, [sp, #48]	@ 0x30
c0de7b14:	444b      	add	r3, r9
c0de7b16:	625e      	str	r6, [r3, #36]	@ 0x24
c0de7b18:	2308      	movs	r3, #8
c0de7b1a:	7b00      	ldrb	r0, [r0, #12]
c0de7b1c:	f88d 301f 	strb.w	r3, [sp, #31]
c0de7b20:	2800      	cmp	r0, #0
c0de7b22:	bf18      	it	ne
c0de7b24:	2001      	movne	r0, #1
c0de7b26:	f88d 0038 	strb.w	r0, [sp, #56]	@ 0x38
c0de7b2a:	e9dd a817 	ldrd	sl, r8, [sp, #92]	@ 0x5c
c0de7b2e:	bb8d      	cbnz	r5, c0de7b94 <useCaseHomeExt+0xe4>
c0de7b30:	4620      	mov	r0, r4
c0de7b32:	f003 fba9 	bl	c0deb288 <strlen>
c0de7b36:	4e24      	ldr	r6, [pc, #144]	@ (c0de7bc8 <useCaseHomeExt+0x118>)
c0de7b38:	2814      	cmp	r0, #20
c0de7b3a:	447e      	add	r6, pc
c0de7b3c:	d307      	bcc.n	c0de7b4e <useCaseHomeExt+0x9e>
c0de7b3e:	4821      	ldr	r0, [pc, #132]	@ (c0de7bc4 <useCaseHomeExt+0x114>)
c0de7b40:	4922      	ldr	r1, [pc, #136]	@ (c0de7bcc <useCaseHomeExt+0x11c>)
c0de7b42:	2236      	movs	r2, #54	@ 0x36
c0de7b44:	4448      	add	r0, r9
c0de7b46:	4479      	add	r1, pc
c0de7b48:	f003 fb28 	bl	c0deb19c <__aeabi_memcpy>
c0de7b4c:	e00a      	b.n	c0de7b64 <useCaseHomeExt+0xb4>
c0de7b4e:	e9cd 4600 	strd	r4, r6, [sp]
c0de7b52:	481c      	ldr	r0, [pc, #112]	@ (c0de7bc4 <useCaseHomeExt+0x114>)
c0de7b54:	214a      	movs	r1, #74	@ 0x4a
c0de7b56:	4a1e      	ldr	r2, [pc, #120]	@ (c0de7bd0 <useCaseHomeExt+0x120>)
c0de7b58:	4b1e      	ldr	r3, [pc, #120]	@ (c0de7bd4 <useCaseHomeExt+0x124>)
c0de7b5a:	4448      	add	r0, r9
c0de7b5c:	447a      	add	r2, pc
c0de7b5e:	447b      	add	r3, pc
c0de7b60:	f002 ff72 	bl	c0deaa48 <snprintf>
c0de7b64:	4f17      	ldr	r7, [pc, #92]	@ (c0de7bc4 <useCaseHomeExt+0x114>)
c0de7b66:	200b      	movs	r0, #11
c0de7b68:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de7b6c:	2300      	movs	r3, #0
c0de7b6e:	eb09 0507 	add.w	r5, r9, r7
c0de7b72:	4629      	mov	r1, r5
c0de7b74:	f002 ff37 	bl	c0dea9e6 <nbgl_getTextNbLinesInWidth>
c0de7b78:	2804      	cmp	r0, #4
c0de7b7a:	d30b      	bcc.n	c0de7b94 <useCaseHomeExt+0xe4>
c0de7b7c:	e9cd 4600 	strd	r4, r6, [sp]
c0de7b80:	eb09 0507 	add.w	r5, r9, r7
c0de7b84:	214a      	movs	r1, #74	@ 0x4a
c0de7b86:	4a14      	ldr	r2, [pc, #80]	@ (c0de7bd8 <useCaseHomeExt+0x128>)
c0de7b88:	4b14      	ldr	r3, [pc, #80]	@ (c0de7bdc <useCaseHomeExt+0x12c>)
c0de7b8a:	4628      	mov	r0, r5
c0de7b8c:	447a      	add	r2, pc
c0de7b8e:	447b      	add	r3, pc
c0de7b90:	f002 ff5a 	bl	c0deaa48 <snprintf>
c0de7b94:	480a      	ldr	r0, [pc, #40]	@ (c0de7bc0 <useCaseHomeExt+0x110>)
c0de7b96:	9503      	str	r5, [sp, #12]
c0de7b98:	2100      	movs	r1, #0
c0de7b9a:	eb09 0400 	add.w	r4, r9, r0
c0de7b9e:	f8c4 a028 	str.w	sl, [r4, #40]	@ 0x28
c0de7ba2:	f8c4 8004 	str.w	r8, [r4, #4]
c0de7ba6:	480e      	ldr	r0, [pc, #56]	@ (c0de7be0 <useCaseHomeExt+0x130>)
c0de7ba8:	aa02      	add	r2, sp, #8
c0de7baa:	4478      	add	r0, pc
c0de7bac:	f7ff faac 	bl	c0de7108 <nbgl_pageDrawInfo>
c0de7bb0:	6160      	str	r0, [r4, #20]
c0de7bb2:	2002      	movs	r0, #2
c0de7bb4:	f002 fec2 	bl	c0dea93c <nbgl_refreshSpecial>
c0de7bb8:	b00f      	add	sp, #60	@ 0x3c
c0de7bba:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de7bbe:	bf00      	nop
c0de7bc0:	00001c48 	.word	0x00001c48
c0de7bc4:	00001ac8 	.word	0x00001ac8
c0de7bc8:	000051bb 	.word	0x000051bb
c0de7bcc:	00006936 	.word	0x00006936
c0de7bd0:	00004cd4 	.word	0x00004cd4
c0de7bd4:	0000542f 	.word	0x0000542f
c0de7bd8:	00004d3e 	.word	0x00004d3e
c0de7bdc:	000053ff 	.word	0x000053ff
c0de7be0:	000008fb 	.word	0x000008fb

c0de7be4 <reset_callbacks_and_context>:
c0de7be4:	b580      	push	{r7, lr}
c0de7be6:	4808      	ldr	r0, [pc, #32]	@ (c0de7c08 <reset_callbacks_and_context+0x24>)
c0de7be8:	2100      	movs	r1, #0
c0de7bea:	4448      	add	r0, r9
c0de7bec:	e9c0 1109 	strd	r1, r1, [r0, #36]	@ 0x24
c0de7bf0:	62c1      	str	r1, [r0, #44]	@ 0x2c
c0de7bf2:	e9c0 1101 	strd	r1, r1, [r0, #4]
c0de7bf6:	60c1      	str	r1, [r0, #12]
c0de7bf8:	6181      	str	r1, [r0, #24]
c0de7bfa:	4804      	ldr	r0, [pc, #16]	@ (c0de7c0c <reset_callbacks_and_context+0x28>)
c0de7bfc:	216c      	movs	r1, #108	@ 0x6c
c0de7bfe:	4448      	add	r0, r9
c0de7c00:	f003 fad6 	bl	c0deb1b0 <__aeabi_memclr>
c0de7c04:	bd80      	pop	{r7, pc}
c0de7c06:	bf00      	nop
c0de7c08:	00001c48 	.word	0x00001c48
c0de7c0c:	0000197c 	.word	0x0000197c

c0de7c10 <prepareNavInfo>:
c0de7c10:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de7c14:	4f1b      	ldr	r7, [pc, #108]	@ (c0de7c84 <prepareNavInfo+0x74>)
c0de7c16:	460c      	mov	r4, r1
c0de7c18:	4606      	mov	r6, r0
c0de7c1a:	211c      	movs	r1, #28
c0de7c1c:	4690      	mov	r8, r2
c0de7c1e:	eb09 0507 	add.w	r5, r9, r7
c0de7c22:	f105 0060 	add.w	r0, r5, #96	@ 0x60
c0de7c26:	f003 fac3 	bl	c0deb1b0 <__aeabi_memclr>
c0de7c2a:	2009      	movs	r0, #9
c0de7c2c:	f885 4061 	strb.w	r4, [r5, #97]	@ 0x61
c0de7c30:	f885 0065 	strb.w	r0, [r5, #101]	@ 0x65
c0de7c34:	2001      	movs	r0, #1
c0de7c36:	f885 0063 	strb.w	r0, [r5, #99]	@ 0x63
c0de7c3a:	b1ce      	cbz	r6, c0de7c70 <prepareNavInfo+0x60>
c0de7c3c:	eb09 0007 	add.w	r0, r9, r7
c0de7c40:	210c      	movs	r1, #12
c0de7c42:	f880 1062 	strb.w	r1, [r0, #98]	@ 0x62
c0de7c46:	2103      	movs	r1, #3
c0de7c48:	f8c0 8074 	str.w	r8, [r0, #116]	@ 0x74
c0de7c4c:	f880 1073 	strb.w	r1, [r0, #115]	@ 0x73
c0de7c50:	f819 1007 	ldrb.w	r1, [r9, r7]
c0de7c54:	3903      	subs	r1, #3
c0de7c56:	bf18      	it	ne
c0de7c58:	2101      	movne	r1, #1
c0de7c5a:	2200      	movs	r2, #0
c0de7c5c:	f880 1072 	strb.w	r1, [r0, #114]	@ 0x72
c0de7c60:	2c01      	cmp	r4, #1
c0de7c62:	bf88      	it	hi
c0de7c64:	2201      	movhi	r2, #1
c0de7c66:	4311      	orrs	r1, r2
c0de7c68:	f880 1071 	strb.w	r1, [r0, #113]	@ 0x71
c0de7c6c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de7c70:	eb09 0107 	add.w	r1, r9, r7
c0de7c74:	f881 0071 	strb.w	r0, [r1, #113]	@ 0x71
c0de7c78:	2003      	movs	r0, #3
c0de7c7a:	f881 0073 	strb.w	r0, [r1, #115]	@ 0x73
c0de7c7e:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de7c82:	bf00      	nop
c0de7c84:	00001c48 	.word	0x00001c48

c0de7c88 <displaySettingsPage>:
c0de7c88:	b570      	push	{r4, r5, r6, lr}
c0de7c8a:	b090      	sub	sp, #64	@ 0x40
c0de7c8c:	460c      	mov	r4, r1
c0de7c8e:	4605      	mov	r5, r0
c0de7c90:	4668      	mov	r0, sp
c0de7c92:	2140      	movs	r1, #64	@ 0x40
c0de7c94:	f003 fa8c 	bl	c0deb1b0 <__aeabi_memclr>
c0de7c98:	4e12      	ldr	r6, [pc, #72]	@ (c0de7ce4 <displaySettingsPage+0x5c>)
c0de7c9a:	eb09 0006 	add.w	r0, r9, r6
c0de7c9e:	6882      	ldr	r2, [r0, #8]
c0de7ca0:	b1f2      	cbz	r2, c0de7ce0 <displaySettingsPage+0x58>
c0de7ca2:	4669      	mov	r1, sp
c0de7ca4:	4628      	mov	r0, r5
c0de7ca6:	4790      	blx	r2
c0de7ca8:	b1d0      	cbz	r0, c0de7ce0 <displaySettingsPage+0x58>
c0de7caa:	444e      	add	r6, r9
c0de7cac:	2009      	movs	r0, #9
c0de7cae:	466a      	mov	r2, sp
c0de7cb0:	f88d 0006 	strb.w	r0, [sp, #6]
c0de7cb4:	f240 2001 	movw	r0, #513	@ 0x201
c0de7cb8:	f806 5f60 	strb.w	r5, [r6, #96]!
c0de7cbc:	f8ad 0004 	strh.w	r0, [sp, #4]
c0de7cc0:	f856 0c50 	ldr.w	r0, [r6, #-80]
c0de7cc4:	4631      	mov	r1, r6
c0de7cc6:	9000      	str	r0, [sp, #0]
c0de7cc8:	4807      	ldr	r0, [pc, #28]	@ (c0de7ce8 <displaySettingsPage+0x60>)
c0de7cca:	4478      	add	r0, pc
c0de7ccc:	f7ff fd6c 	bl	c0de77a8 <nbgl_pageDrawGenericContent>
c0de7cd0:	f846 0c4c 	str.w	r0, [r6, #-76]
c0de7cd4:	2001      	movs	r0, #1
c0de7cd6:	2c00      	cmp	r4, #0
c0de7cd8:	bf18      	it	ne
c0de7cda:	2002      	movne	r0, #2
c0de7cdc:	f002 fe2e 	bl	c0dea93c <nbgl_refreshSpecial>
c0de7ce0:	b010      	add	sp, #64	@ 0x40
c0de7ce2:	bd70      	pop	{r4, r5, r6, pc}
c0de7ce4:	00001c48 	.word	0x00001c48
c0de7ce8:	000007db 	.word	0x000007db

c0de7cec <nbgl_useCaseGenericSettings>:
c0de7cec:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de7cf0:	461d      	mov	r5, r3
c0de7cf2:	4616      	mov	r6, r2
c0de7cf4:	4688      	mov	r8, r1
c0de7cf6:	4607      	mov	r7, r0
c0de7cf8:	f7ff ff74 	bl	c0de7be4 <reset_callbacks_and_context>
c0de7cfc:	4c25      	ldr	r4, [pc, #148]	@ (c0de7d94 <nbgl_useCaseGenericSettings+0xa8>)
c0de7cfe:	2002      	movs	r0, #2
c0de7d00:	f809 0004 	strb.w	r0, [r9, r4]
c0de7d04:	eb09 0004 	add.w	r0, r9, r4
c0de7d08:	6107      	str	r7, [r0, #16]
c0de7d0a:	9906      	ldr	r1, [sp, #24]
c0de7d0c:	6041      	str	r1, [r0, #4]
c0de7d0e:	b12e      	cbz	r6, c0de7d1c <nbgl_useCaseGenericSettings+0x30>
c0de7d10:	4821      	ldr	r0, [pc, #132]	@ (c0de7d98 <nbgl_useCaseGenericSettings+0xac>)
c0de7d12:	e896 000e 	ldmia.w	r6, {r1, r2, r3}
c0de7d16:	4448      	add	r0, r9
c0de7d18:	3004      	adds	r0, #4
c0de7d1a:	c00e      	stmia	r0!, {r1, r2, r3}
c0de7d1c:	b1a5      	cbz	r5, c0de7d48 <nbgl_useCaseGenericSettings+0x5c>
c0de7d1e:	481e      	ldr	r0, [pc, #120]	@ (c0de7d98 <nbgl_useCaseGenericSettings+0xac>)
c0de7d20:	2101      	movs	r1, #1
c0de7d22:	4448      	add	r0, r9
c0de7d24:	7501      	strb	r1, [r0, #20]
c0de7d26:	481d      	ldr	r0, [pc, #116]	@ (c0de7d9c <nbgl_useCaseGenericSettings+0xb0>)
c0de7d28:	2138      	movs	r1, #56	@ 0x38
c0de7d2a:	eb09 0600 	add.w	r6, r9, r0
c0de7d2e:	f106 0038 	add.w	r0, r6, #56	@ 0x38
c0de7d32:	f003 fa3d 	bl	c0deb1b0 <__aeabi_memclr>
c0de7d36:	2008      	movs	r0, #8
c0de7d38:	4629      	mov	r1, r5
c0de7d3a:	2230      	movs	r2, #48	@ 0x30
c0de7d3c:	f886 0038 	strb.w	r0, [r6, #56]	@ 0x38
c0de7d40:	f106 003c 	add.w	r0, r6, #60	@ 0x3c
c0de7d44:	f003 fa2a 	bl	c0deb19c <__aeabi_memcpy>
c0de7d48:	f002 f956 	bl	c0de9ff8 <OUTLINED_FUNCTION_5>
c0de7d4c:	4606      	mov	r6, r0
c0de7d4e:	b145      	cbz	r5, c0de7d62 <nbgl_useCaseGenericSettings+0x76>
c0de7d50:	4812      	ldr	r0, [pc, #72]	@ (c0de7d9c <nbgl_useCaseGenericSettings+0xb0>)
c0de7d52:	4631      	mov	r1, r6
c0de7d54:	2201      	movs	r2, #1
c0de7d56:	2300      	movs	r3, #0
c0de7d58:	4448      	add	r0, r9
c0de7d5a:	3038      	adds	r0, #56	@ 0x38
c0de7d5c:	f000 f848 	bl	c0de7df0 <getNbPagesForContent>
c0de7d60:	4406      	add	r6, r0
c0de7d62:	444c      	add	r4, r9
c0de7d64:	211c      	movs	r1, #28
c0de7d66:	f104 0060 	add.w	r0, r4, #96	@ 0x60
c0de7d6a:	f003 fa21 	bl	c0deb1b0 <__aeabi_memclr>
c0de7d6e:	2009      	movs	r0, #9
c0de7d70:	f884 6061 	strb.w	r6, [r4, #97]	@ 0x61
c0de7d74:	2101      	movs	r1, #1
c0de7d76:	f884 0065 	strb.w	r0, [r4, #101]	@ 0x65
c0de7d7a:	2003      	movs	r0, #3
c0de7d7c:	f884 0073 	strb.w	r0, [r4, #115]	@ 0x73
c0de7d80:	2001      	movs	r0, #1
c0de7d82:	f884 0063 	strb.w	r0, [r4, #99]	@ 0x63
c0de7d86:	f884 0071 	strb.w	r0, [r4, #113]	@ 0x71
c0de7d8a:	4640      	mov	r0, r8
c0de7d8c:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de7d90:	f000 b8c0 	b.w	c0de7f14 <displayGenericContextPage>
c0de7d94:	00001c48 	.word	0x00001c48
c0de7d98:	0000197c 	.word	0x0000197c
c0de7d9c:	000019e8 	.word	0x000019e8

c0de7da0 <getNbPagesForGenericContents>:
c0de7da0:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de7da4:	b08e      	sub	sp, #56	@ 0x38
c0de7da6:	4f11      	ldr	r7, [pc, #68]	@ (c0de7dec <getNbPagesForGenericContents+0x4c>)
c0de7da8:	4604      	mov	r4, r0
c0de7daa:	2600      	movs	r6, #0
c0de7dac:	46e8      	mov	r8, sp
c0de7dae:	2500      	movs	r5, #0
c0de7db0:	eb09 0007 	add.w	r0, r9, r7
c0de7db4:	7b00      	ldrb	r0, [r0, #12]
c0de7db6:	4285      	cmp	r5, r0
c0de7db8:	d214      	bcs.n	c0de7de4 <getNbPagesForGenericContents+0x44>
c0de7dba:	b268      	sxtb	r0, r5
c0de7dbc:	4641      	mov	r1, r8
c0de7dbe:	f001 fabb 	bl	c0de9338 <getContentAtIdx>
c0de7dc2:	b170      	cbz	r0, c0de7de2 <getNbPagesForGenericContents+0x42>
c0de7dc4:	eb09 0107 	add.w	r1, r9, r7
c0de7dc8:	4623      	mov	r3, r4
c0de7dca:	7b09      	ldrb	r1, [r1, #12]
c0de7dcc:	1a69      	subs	r1, r5, r1
c0de7dce:	3101      	adds	r1, #1
c0de7dd0:	fab1 f181 	clz	r1, r1
c0de7dd4:	094a      	lsrs	r2, r1, #5
c0de7dd6:	b2f1      	uxtb	r1, r6
c0de7dd8:	f000 f80a 	bl	c0de7df0 <getNbPagesForContent>
c0de7ddc:	4406      	add	r6, r0
c0de7dde:	3501      	adds	r5, #1
c0de7de0:	e7e6      	b.n	c0de7db0 <getNbPagesForGenericContents+0x10>
c0de7de2:	2600      	movs	r6, #0
c0de7de4:	b2f0      	uxtb	r0, r6
c0de7de6:	b00e      	add	sp, #56	@ 0x38
c0de7de8:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de7dec:	0000197c 	.word	0x0000197c

c0de7df0 <getNbPagesForContent>:
c0de7df0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de7df4:	b08c      	sub	sp, #48	@ 0x30
c0de7df6:	4606      	mov	r6, r0
c0de7df8:	fab1 f081 	clz	r0, r1
c0de7dfc:	9306      	str	r3, [sp, #24]
c0de7dfe:	4614      	mov	r4, r2
c0de7e00:	9109      	str	r1, [sp, #36]	@ 0x24
c0de7e02:	0940      	lsrs	r0, r0, #5
c0de7e04:	4010      	ands	r0, r2
c0de7e06:	900a      	str	r0, [sp, #40]	@ 0x28
c0de7e08:	4630      	mov	r0, r6
c0de7e0a:	f001 fabf 	bl	c0de938c <getContentNbElement>
c0de7e0e:	4605      	mov	r5, r0
c0de7e10:	f084 0001 	eor.w	r0, r4, #1
c0de7e14:	f04f 0800 	mov.w	r8, #0
c0de7e18:	f04f 0a00 	mov.w	sl, #0
c0de7e1c:	f04f 0b00 	mov.w	fp, #0
c0de7e20:	270f      	movs	r7, #15
c0de7e22:	9405      	str	r4, [sp, #20]
c0de7e24:	9608      	str	r6, [sp, #32]
c0de7e26:	9004      	str	r0, [sp, #16]
c0de7e28:	1d30      	adds	r0, r6, #4
c0de7e2a:	9007      	str	r0, [sp, #28]
c0de7e2c:	0628      	lsls	r0, r5, #24
c0de7e2e:	d068      	beq.n	c0de7f02 <getNbPagesForContent+0x112>
c0de7e30:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de7e32:	f88d 802f 	strb.w	r8, [sp, #47]	@ 0x2f
c0de7e36:	b128      	cbz	r0, c0de7e44 <getNbPagesForContent+0x54>
c0de7e38:	fa5f f38b 	uxtb.w	r3, fp
c0de7e3c:	2b00      	cmp	r3, #0
c0de7e3e:	bf18      	it	ne
c0de7e40:	2301      	movne	r3, #1
c0de7e42:	e000      	b.n	c0de7e46 <getNbPagesForContent+0x56>
c0de7e44:	2301      	movs	r3, #1
c0de7e46:	9808      	ldr	r0, [sp, #32]
c0de7e48:	7800      	ldrb	r0, [r0, #0]
c0de7e4a:	280a      	cmp	r0, #10
c0de7e4c:	d00e      	beq.n	c0de7e6c <getNbPagesForContent+0x7c>
c0de7e4e:	2806      	cmp	r0, #6
c0de7e50:	d011      	beq.n	c0de7e76 <getNbPagesForContent+0x86>
c0de7e52:	2807      	cmp	r0, #7
c0de7e54:	d01e      	beq.n	c0de7e94 <getNbPagesForContent+0xa4>
c0de7e56:	2808      	cmp	r0, #8
c0de7e58:	d023      	beq.n	c0de7ea2 <getNbPagesForContent+0xb2>
c0de7e5a:	2809      	cmp	r0, #9
c0de7e5c:	d028      	beq.n	c0de7eb0 <getNbPagesForContent+0xc0>
c0de7e5e:	2804      	cmp	r0, #4
c0de7e60:	d12b      	bne.n	c0de7eba <getNbPagesForContent+0xca>
c0de7e62:	2000      	movs	r0, #0
c0de7e64:	f04f 0800 	mov.w	r8, #0
c0de7e68:	9000      	str	r0, [sp, #0]
c0de7e6a:	e007      	b.n	c0de7e7c <getNbPagesForContent+0x8c>
c0de7e6c:	b2e8      	uxtb	r0, r5
c0de7e6e:	2200      	movs	r2, #0
c0de7e70:	f7ff fddf 	bl	c0de7a32 <nbgl_useCaseGetNbBarsInPage>
c0de7e74:	e028      	b.n	c0de7ec8 <getNbPagesForContent+0xd8>
c0de7e76:	9805      	ldr	r0, [sp, #20]
c0de7e78:	9000      	str	r0, [sp, #0]
c0de7e7a:	9804      	ldr	r0, [sp, #16]
c0de7e7c:	9001      	str	r0, [sp, #4]
c0de7e7e:	f10d 002f 	add.w	r0, sp, #47	@ 0x2f
c0de7e82:	e9dd 3106 	ldrd	r3, r1, [sp, #24]
c0de7e86:	fa5f f28b 	uxtb.w	r2, fp
c0de7e8a:	9002      	str	r0, [sp, #8]
c0de7e8c:	b2e8      	uxtb	r0, r5
c0de7e8e:	f7ff fcb6 	bl	c0de77fe <getNbTagValuesInPage>
c0de7e92:	e019      	b.n	c0de7ec8 <getNbPagesForContent+0xd8>
c0de7e94:	9907      	ldr	r1, [sp, #28]
c0de7e96:	b2e8      	uxtb	r0, r5
c0de7e98:	fa5f f28b 	uxtb.w	r2, fp
c0de7e9c:	f7ff fd93 	bl	c0de79c6 <nbgl_useCaseGetNbSwitchesInPage>
c0de7ea0:	e012      	b.n	c0de7ec8 <getNbPagesForContent+0xd8>
c0de7ea2:	9907      	ldr	r1, [sp, #28]
c0de7ea4:	b2e8      	uxtb	r0, r5
c0de7ea6:	fa5f f28b 	uxtb.w	r2, fp
c0de7eaa:	f7ff fd43 	bl	c0de7934 <nbgl_useCaseGetNbInfosInPage>
c0de7eae:	e00b      	b.n	c0de7ec8 <getNbPagesForContent+0xd8>
c0de7eb0:	b2e8      	uxtb	r0, r5
c0de7eb2:	2200      	movs	r2, #0
c0de7eb4:	f7ff fddd 	bl	c0de7a72 <nbgl_useCaseGetNbChoicesInPage>
c0de7eb8:	e006      	b.n	c0de7ec8 <getNbPagesForContent+0xd8>
c0de7eba:	4915      	ldr	r1, [pc, #84]	@ (c0de7f10 <getNbPagesForContent+0x120>)
c0de7ebc:	4479      	add	r1, pc
c0de7ebe:	5c08      	ldrb	r0, [r1, r0]
c0de7ec0:	b2e9      	uxtb	r1, r5
c0de7ec2:	4288      	cmp	r0, r1
c0de7ec4:	bf28      	it	cs
c0de7ec6:	4628      	movcs	r0, r5
c0de7ec8:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0de7eca:	f89d 402f 	ldrb.w	r4, [sp, #47]	@ 0x2f
c0de7ece:	f000 0307 	and.w	r3, r0, #7
c0de7ed2:	2204      	movs	r2, #4
c0de7ed4:	1a2d      	subs	r5, r5, r0
c0de7ed6:	4483      	add	fp, r0
c0de7ed8:	4451      	add	r1, sl
c0de7eda:	ea43 03c4 	orr.w	r3, r3, r4, lsl #3
c0de7ede:	4c0b      	ldr	r4, [pc, #44]	@ (c0de7f0c <getNbPagesForContent+0x11c>)
c0de7ee0:	f10a 0a01 	add.w	sl, sl, #1
c0de7ee4:	b2c9      	uxtb	r1, r1
c0de7ee6:	b2db      	uxtb	r3, r3
c0de7ee8:	ea02 0281 	and.w	r2, r2, r1, lsl #2
c0de7eec:	444c      	add	r4, r9
c0de7eee:	0849      	lsrs	r1, r1, #1
c0de7ef0:	5c66      	ldrb	r6, [r4, r1]
c0de7ef2:	4093      	lsls	r3, r2
c0de7ef4:	fa07 f202 	lsl.w	r2, r7, r2
c0de7ef8:	ea26 0202 	bic.w	r2, r6, r2
c0de7efc:	431a      	orrs	r2, r3
c0de7efe:	5462      	strb	r2, [r4, r1]
c0de7f00:	e794      	b.n	c0de7e2c <getNbPagesForContent+0x3c>
c0de7f02:	fa5f f08a 	uxtb.w	r0, sl
c0de7f06:	b00c      	add	sp, #48	@ 0x30
c0de7f08:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de7f0c:	00001b48 	.word	0x00001b48
c0de7f10:	000065f6 	.word	0x000065f6

c0de7f14 <displayGenericContextPage>:
c0de7f14:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de7f18:	b0a0      	sub	sp, #128	@ 0x80
c0de7f1a:	f8df 23e0 	ldr.w	r2, [pc, #992]	@ c0de82fc <displayGenericContextPage+0x3e8>
c0de7f1e:	4683      	mov	fp, r0
c0de7f20:	f819 0002 	ldrb.w	r0, [r9, r2]
c0de7f24:	2803      	cmp	r0, #3
c0de7f26:	d10f      	bne.n	c0de7f48 <displayGenericContextPage+0x34>
c0de7f28:	f8df 03d4 	ldr.w	r0, [pc, #980]	@ c0de8300 <displayGenericContextPage+0x3ec>
c0de7f2c:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de7f30:	4448      	add	r0, r9
c0de7f32:	d05f      	beq.n	c0de7ff4 <displayGenericContextPage+0xe0>
c0de7f34:	f890 0030 	ldrb.w	r0, [r0, #48]	@ 0x30
c0de7f38:	4558      	cmp	r0, fp
c0de7f3a:	d80e      	bhi.n	c0de7f5a <displayGenericContextPage+0x46>
c0de7f3c:	2001      	movs	r0, #1
c0de7f3e:	b020      	add	sp, #128	@ 0x80
c0de7f40:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de7f44:	f001 b854 	b.w	c0de8ff0 <bundleNavReviewStreamingChoice>
c0de7f48:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de7f4c:	d105      	bne.n	c0de7f5a <displayGenericContextPage+0x46>
c0de7f4e:	eb09 0002 	add.w	r0, r9, r2
c0de7f52:	f890 0061 	ldrb.w	r0, [r0, #97]	@ 0x61
c0de7f56:	f1a0 0b01 	sub.w	fp, r0, #1
c0de7f5a:	eb09 0002 	add.w	r0, r9, r2
c0de7f5e:	fa5f f78b 	uxtb.w	r7, fp
c0de7f62:	9100      	str	r1, [sp, #0]
c0de7f64:	f890 8060 	ldrb.w	r8, [r0, #96]	@ 0x60
c0de7f68:	4547      	cmp	r7, r8
c0de7f6a:	d12e      	bne.n	c0de7fca <displayGenericContextPage+0xb6>
c0de7f6c:	a912      	add	r1, sp, #72	@ 0x48
c0de7f6e:	f10d 0247 	add.w	r2, sp, #71	@ 0x47
c0de7f72:	f10d 0346 	add.w	r3, sp, #70	@ 0x46
c0de7f76:	4638      	mov	r0, r7
c0de7f78:	f001 fa20 	bl	c0de93bc <genericContextComputeNextPageParams>
c0de7f7c:	4682      	mov	sl, r0
c0de7f7e:	f1ba 0f00 	cmp.w	sl, #0
c0de7f82:	f000 8147 	beq.w	c0de8214 <displayGenericContextPage+0x300>
c0de7f86:	f8df 8374 	ldr.w	r8, [pc, #884]	@ c0de82fc <displayGenericContextPage+0x3e8>
c0de7f8a:	f819 0008 	ldrb.w	r0, [r9, r8]
c0de7f8e:	2803      	cmp	r0, #3
c0de7f90:	d041      	beq.n	c0de8016 <displayGenericContextPage+0x102>
c0de7f92:	48db      	ldr	r0, [pc, #876]	@ (c0de8300 <displayGenericContextPage+0x3ec>)
c0de7f94:	4448      	add	r0, r9
c0de7f96:	f890 0020 	ldrb.w	r0, [r0, #32]
c0de7f9a:	06c0      	lsls	r0, r0, #27
c0de7f9c:	d53b      	bpl.n	c0de8016 <displayGenericContextPage+0x102>
c0de7f9e:	ea5f 600b 	movs.w	r0, fp, lsl #24
c0de7fa2:	d034      	beq.n	c0de800e <displayGenericContextPage+0xfa>
c0de7fa4:	eb09 0008 	add.w	r0, r9, r8
c0de7fa8:	f890 0061 	ldrb.w	r0, [r0, #97]	@ 0x61
c0de7fac:	3801      	subs	r0, #1
c0de7fae:	42b8      	cmp	r0, r7
c0de7fb0:	dd2d      	ble.n	c0de800e <displayGenericContextPage+0xfa>
c0de7fb2:	eb09 0008 	add.w	r0, r9, r8
c0de7fb6:	2105      	movs	r1, #5
c0de7fb8:	f880 106c 	strb.w	r1, [r0, #108]	@ 0x6c
c0de7fbc:	49d2      	ldr	r1, [pc, #840]	@ (c0de8308 <displayGenericContextPage+0x3f4>)
c0de7fbe:	4479      	add	r1, pc
c0de7fc0:	6681      	str	r1, [r0, #104]	@ 0x68
c0de7fc2:	2100      	movs	r1, #0
c0de7fc4:	f880 1064 	strb.w	r1, [r0, #100]	@ 0x64
c0de7fc8:	e025      	b.n	c0de8016 <displayGenericContextPage+0x102>
c0de7fca:	d91b      	bls.n	c0de8004 <displayGenericContextPage+0xf0>
c0de7fcc:	f04f 0a00 	mov.w	sl, #0
c0de7fd0:	ac12      	add	r4, sp, #72	@ 0x48
c0de7fd2:	f10d 0547 	add.w	r5, sp, #71	@ 0x47
c0de7fd6:	f10d 0646 	add.w	r6, sp, #70	@ 0x46
c0de7fda:	4547      	cmp	r7, r8
c0de7fdc:	d0cf      	beq.n	c0de7f7e <displayGenericContextPage+0x6a>
c0de7fde:	f108 0801 	add.w	r8, r8, #1
c0de7fe2:	4621      	mov	r1, r4
c0de7fe4:	462a      	mov	r2, r5
c0de7fe6:	4633      	mov	r3, r6
c0de7fe8:	fa5f f088 	uxtb.w	r0, r8
c0de7fec:	f001 f9e6 	bl	c0de93bc <genericContextComputeNextPageParams>
c0de7ff0:	4682      	mov	sl, r0
c0de7ff2:	e7f2      	b.n	c0de7fda <displayGenericContextPage+0xc6>
c0de7ff4:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0de7ff6:	2800      	cmp	r0, #0
c0de7ff8:	f000 810c 	beq.w	c0de8214 <displayGenericContextPage+0x300>
c0de7ffc:	b020      	add	sp, #128	@ 0x80
c0de7ffe:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8002:	4700      	bx	r0
c0de8004:	eba7 0008 	sub.w	r0, r7, r8
c0de8008:	2801      	cmp	r0, #1
c0de800a:	ddaf      	ble.n	c0de7f6c <displayGenericContextPage+0x58>
c0de800c:	e102      	b.n	c0de8214 <displayGenericContextPage+0x300>
c0de800e:	eb09 0008 	add.w	r0, r9, r8
c0de8012:	2100      	movs	r1, #0
c0de8014:	6681      	str	r1, [r0, #104]	@ 0x68
c0de8016:	af01      	add	r7, sp, #4
c0de8018:	213c      	movs	r1, #60	@ 0x3c
c0de801a:	1d38      	adds	r0, r7, #4
c0de801c:	f003 f8c8 	bl	c0deb1b0 <__aeabi_memclr>
c0de8020:	2009      	movs	r0, #9
c0de8022:	f8df b2e0 	ldr.w	fp, [pc, #736]	@ c0de8304 <displayGenericContextPage+0x3f0>
c0de8026:	f89d 5047 	ldrb.w	r5, [sp, #71]	@ 0x47
c0de802a:	f88d 000a 	strb.w	r0, [sp, #10]
c0de802e:	2002      	movs	r0, #2
c0de8030:	f88d 0009 	strb.w	r0, [sp, #9]
c0de8034:	eb09 0008 	add.w	r0, r9, r8
c0de8038:	eb09 010b 	add.w	r1, r9, fp
c0de803c:	6900      	ldr	r0, [r0, #16]
c0de803e:	7c8e      	ldrb	r6, [r1, #18]
c0de8040:	9001      	str	r0, [sp, #4]
c0de8042:	f89a 0000 	ldrb.w	r0, [sl]
c0de8046:	280a      	cmp	r0, #10
c0de8048:	f88d 0010 	strb.w	r0, [sp, #16]
c0de804c:	d01e      	beq.n	c0de808c <displayGenericContextPage+0x178>
c0de804e:	2801      	cmp	r0, #1
c0de8050:	d02c      	beq.n	c0de80ac <displayGenericContextPage+0x198>
c0de8052:	2802      	cmp	r0, #2
c0de8054:	d014      	beq.n	c0de8080 <displayGenericContextPage+0x16c>
c0de8056:	2803      	cmp	r0, #3
c0de8058:	d012      	beq.n	c0de8080 <displayGenericContextPage+0x16c>
c0de805a:	2804      	cmp	r0, #4
c0de805c:	d02e      	beq.n	c0de80bc <displayGenericContextPage+0x1a8>
c0de805e:	2806      	cmp	r0, #6
c0de8060:	d042      	beq.n	c0de80e8 <displayGenericContextPage+0x1d4>
c0de8062:	2807      	cmp	r0, #7
c0de8064:	d04e      	beq.n	c0de8104 <displayGenericContextPage+0x1f0>
c0de8066:	2808      	cmp	r0, #8
c0de8068:	d058      	beq.n	c0de811c <displayGenericContextPage+0x208>
c0de806a:	2809      	cmp	r0, #9
c0de806c:	d063      	beq.n	c0de8136 <displayGenericContextPage+0x222>
c0de806e:	2800      	cmp	r0, #0
c0de8070:	f040 80d0 	bne.w	c0de8214 <displayGenericContextPage+0x300>
c0de8074:	f001 ffdd 	bl	c0dea032 <OUTLINED_FUNCTION_14>
c0de8078:	e890 007c 	ldmia.w	r0, {r2, r3, r4, r5, r6}
c0de807c:	c17c      	stmia	r1!, {r2, r3, r4, r5, r6}
c0de807e:	e092      	b.n	c0de81a6 <displayGenericContextPage+0x292>
c0de8080:	f001 ffd7 	bl	c0dea032 <OUTLINED_FUNCTION_14>
c0de8084:	e890 003c 	ldmia.w	r0, {r2, r3, r4, r5}
c0de8088:	c13c      	stmia	r1!, {r2, r3, r4, r5}
c0de808a:	e08c      	b.n	c0de81a6 <displayGenericContextPage+0x292>
c0de808c:	f88d 501c 	strb.w	r5, [sp, #28]
c0de8090:	f001 ff9b 	bl	c0de9fca <OUTLINED_FUNCTION_1>
c0de8094:	9005      	str	r0, [sp, #20]
c0de8096:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de809a:	4430      	add	r0, r6
c0de809c:	f002 fe66 	bl	c0dead6c <pic>
c0de80a0:	9006      	str	r0, [sp, #24]
c0de80a2:	f89a 000d 	ldrb.w	r0, [sl, #13]
c0de80a6:	f88d 001d 	strb.w	r0, [sp, #29]
c0de80aa:	e07c      	b.n	c0de81a6 <displayGenericContextPage+0x292>
c0de80ac:	f107 0010 	add.w	r0, r7, #16
c0de80b0:	f10a 0104 	add.w	r1, sl, #4
c0de80b4:	2230      	movs	r2, #48	@ 0x30
c0de80b6:	f003 f871 	bl	c0deb19c <__aeabi_memcpy>
c0de80ba:	e074      	b.n	c0de81a6 <displayGenericContextPage+0x292>
c0de80bc:	f8da 2004 	ldr.w	r2, [sl, #4]
c0de80c0:	eb09 010b 	add.w	r1, r9, fp
c0de80c4:	f89d 0046 	ldrb.w	r0, [sp, #70]	@ 0x46
c0de80c8:	9f00      	ldr	r7, [sp, #0]
c0de80ca:	624a      	str	r2, [r1, #36]	@ 0x24
c0de80cc:	2800      	cmp	r0, #0
c0de80ce:	f8da 2008 	ldr.w	r2, [sl, #8]
c0de80d2:	628a      	str	r2, [r1, #40]	@ 0x28
c0de80d4:	f000 80bf 	beq.w	c0de8256 <displayGenericContextPage+0x342>
c0de80d8:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de80dc:	2800      	cmp	r0, #0
c0de80de:	f000 809c 	beq.w	c0de821a <displayGenericContextPage+0x306>
c0de80e2:	eb00 1006 	add.w	r0, r0, r6, lsl #4
c0de80e6:	e09c      	b.n	c0de8222 <displayGenericContextPage+0x30e>
c0de80e8:	f89a 100c 	ldrb.w	r1, [sl, #12]
c0de80ec:	1970      	adds	r0, r6, r5
c0de80ee:	f10a 0404 	add.w	r4, sl, #4
c0de80f2:	4288      	cmp	r0, r1
c0de80f4:	d134      	bne.n	c0de8160 <displayGenericContextPage+0x24c>
c0de80f6:	3710      	adds	r7, #16
c0de80f8:	4621      	mov	r1, r4
c0de80fa:	222c      	movs	r2, #44	@ 0x2c
c0de80fc:	4638      	mov	r0, r7
c0de80fe:	f003 f84d 	bl	c0deb19c <__aeabi_memcpy>
c0de8102:	e031      	b.n	c0de8168 <displayGenericContextPage+0x254>
c0de8104:	f88d 5018 	strb.w	r5, [sp, #24]
c0de8108:	eb06 0046 	add.w	r0, r6, r6, lsl #1
c0de810c:	f8da 1004 	ldr.w	r1, [sl, #4]
c0de8110:	eb01 0080 	add.w	r0, r1, r0, lsl #2
c0de8114:	f002 fe2a 	bl	c0dead6c <pic>
c0de8118:	9005      	str	r0, [sp, #20]
c0de811a:	e044      	b.n	c0de81a6 <displayGenericContextPage+0x292>
c0de811c:	f88d 5020 	strb.w	r5, [sp, #32]
c0de8120:	f001 ff53 	bl	c0de9fca <OUTLINED_FUNCTION_1>
c0de8124:	9005      	str	r0, [sp, #20]
c0de8126:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de812a:	eb00 0086 	add.w	r0, r0, r6, lsl #2
c0de812e:	f002 fe1d 	bl	c0dead6c <pic>
c0de8132:	9006      	str	r0, [sp, #24]
c0de8134:	e037      	b.n	c0de81a6 <displayGenericContextPage+0x292>
c0de8136:	f001 ff7c 	bl	c0dea032 <OUTLINED_FUNCTION_14>
c0de813a:	e890 001c 	ldmia.w	r0, {r2, r3, r4}
c0de813e:	c11c      	stmia	r1!, {r2, r3, r4}
c0de8140:	f88d 5019 	strb.w	r5, [sp, #25]
c0de8144:	f001 ff41 	bl	c0de9fca <OUTLINED_FUNCTION_1>
c0de8148:	9005      	str	r0, [sp, #20]
c0de814a:	f89a 000a 	ldrb.w	r0, [sl, #10]
c0de814e:	42b0      	cmp	r0, r6
c0de8150:	d327      	bcc.n	c0de81a2 <displayGenericContextPage+0x28e>
c0de8152:	1971      	adds	r1, r6, r5
c0de8154:	4281      	cmp	r1, r0
c0de8156:	d924      	bls.n	c0de81a2 <displayGenericContextPage+0x28e>
c0de8158:	1b80      	subs	r0, r0, r6
c0de815a:	f88d 001a 	strb.w	r0, [sp, #26]
c0de815e:	e022      	b.n	c0de81a6 <displayGenericContextPage+0x292>
c0de8160:	2004      	movs	r0, #4
c0de8162:	3710      	adds	r7, #16
c0de8164:	f88d 0010 	strb.w	r0, [sp, #16]
c0de8168:	f88d 501c 	strb.w	r5, [sp, #28]
c0de816c:	6820      	ldr	r0, [r4, #0]
c0de816e:	eb00 1006 	add.w	r0, r0, r6, lsl #4
c0de8172:	f002 fdfb 	bl	c0dead6c <pic>
c0de8176:	2110      	movs	r1, #16
c0de8178:	2200      	movs	r2, #0
c0de817a:	6038      	str	r0, [r7, #0]
c0de817c:	eb01 1105 	add.w	r1, r1, r5, lsl #4
c0de8180:	f102 0310 	add.w	r3, r2, #16
c0de8184:	4299      	cmp	r1, r3
c0de8186:	d006      	beq.n	c0de8196 <displayGenericContextPage+0x282>
c0de8188:	4402      	add	r2, r0
c0de818a:	7b12      	ldrb	r2, [r2, #12]
c0de818c:	0752      	lsls	r2, r2, #29
c0de818e:	461a      	mov	r2, r3
c0de8190:	d5f6      	bpl.n	c0de8180 <displayGenericContextPage+0x26c>
c0de8192:	210d      	movs	r1, #13
c0de8194:	72f9      	strb	r1, [r7, #11]
c0de8196:	9a06      	ldr	r2, [sp, #24]
c0de8198:	eb09 010b 	add.w	r1, r9, fp
c0de819c:	e9c1 0209 	strd	r0, r2, [r1, #36]	@ 0x24
c0de81a0:	e001      	b.n	c0de81a6 <displayGenericContextPage+0x292>
c0de81a2:	f88d 501a 	strb.w	r5, [sp, #26]
c0de81a6:	9f00      	ldr	r7, [sp, #0]
c0de81a8:	f819 0008 	ldrb.w	r0, [r9, r8]
c0de81ac:	f000 01fe 	and.w	r1, r0, #254	@ 0xfe
c0de81b0:	4853      	ldr	r0, [pc, #332]	@ (c0de8300 <displayGenericContextPage+0x3ec>)
c0de81b2:	2902      	cmp	r1, #2
c0de81b4:	4448      	add	r0, r9
c0de81b6:	6a00      	ldr	r0, [r0, #32]
c0de81b8:	bf18      	it	ne
c0de81ba:	2000      	movne	r0, #0
c0de81bc:	f89a 1000 	ldrb.w	r1, [sl]
c0de81c0:	2902      	cmp	r1, #2
c0de81c2:	d817      	bhi.n	c0de81f4 <displayGenericContextPage+0x2e0>
c0de81c4:	f010 0fe0 	tst.w	r0, #224	@ 0xe0
c0de81c8:	d014      	beq.n	c0de81f4 <displayGenericContextPage+0x2e0>
c0de81ca:	0601      	lsls	r1, r0, #24
c0de81cc:	d508      	bpl.n	c0de81e0 <displayGenericContextPage+0x2cc>
c0de81ce:	eb09 010b 	add.w	r1, r9, fp
c0de81d2:	6d89      	ldr	r1, [r1, #88]	@ 0x58
c0de81d4:	7809      	ldrb	r1, [r1, #0]
c0de81d6:	06c9      	lsls	r1, r1, #27
c0de81d8:	d402      	bmi.n	c0de81e0 <displayGenericContextPage+0x2cc>
c0de81da:	494d      	ldr	r1, [pc, #308]	@ (c0de8310 <displayGenericContextPage+0x3fc>)
c0de81dc:	4479      	add	r1, pc
c0de81de:	e001      	b.n	c0de81e4 <displayGenericContextPage+0x2d0>
c0de81e0:	494c      	ldr	r1, [pc, #304]	@ (c0de8314 <displayGenericContextPage+0x400>)
c0de81e2:	4479      	add	r1, pc
c0de81e4:	0680      	lsls	r0, r0, #26
c0de81e6:	9103      	str	r1, [sp, #12]
c0de81e8:	f04f 0010 	mov.w	r0, #16
c0de81ec:	bf58      	it	pl
c0de81ee:	2011      	movpl	r0, #17
c0de81f0:	f88d 000b 	strb.w	r0, [sp, #11]
c0de81f4:	4848      	ldr	r0, [pc, #288]	@ (c0de8318 <displayGenericContextPage+0x404>)
c0de81f6:	eb09 0408 	add.w	r4, r9, r8
c0de81fa:	aa01      	add	r2, sp, #4
c0de81fc:	f104 0160 	add.w	r1, r4, #96	@ 0x60
c0de8200:	4478      	add	r0, pc
c0de8202:	f7ff fad1 	bl	c0de77a8 <nbgl_pageDrawGenericContent>
c0de8206:	6160      	str	r0, [r4, #20]
c0de8208:	2001      	movs	r0, #1
c0de820a:	2f00      	cmp	r7, #0
c0de820c:	bf18      	it	ne
c0de820e:	2002      	movne	r0, #2
c0de8210:	f002 fb94 	bl	c0dea93c <nbgl_refreshSpecial>
c0de8214:	b020      	add	sp, #128	@ 0x80
c0de8216:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de821a:	f8da 1008 	ldr.w	r1, [sl, #8]
c0de821e:	4630      	mov	r0, r6
c0de8220:	4788      	blx	r1
c0de8222:	f002 fda3 	bl	c0dead6c <pic>
c0de8226:	7b01      	ldrb	r1, [r0, #12]
c0de8228:	0789      	lsls	r1, r1, #30
c0de822a:	d42e      	bmi.n	c0de828a <displayGenericContextPage+0x376>
c0de822c:	4937      	ldr	r1, [pc, #220]	@ (c0de830c <displayGenericContextPage+0x3f8>)
c0de822e:	4479      	add	r1, pc
c0de8230:	910b      	str	r1, [sp, #44]	@ 0x2c
c0de8232:	210a      	movs	r1, #10
c0de8234:	f88d 1030 	strb.w	r1, [sp, #48]	@ 0x30
c0de8238:	2100      	movs	r1, #0
c0de823a:	910a      	str	r1, [sp, #40]	@ 0x28
c0de823c:	eb09 010b 	add.w	r1, r9, fp
c0de8240:	e9d0 2000 	ldrd	r2, r0, [r0]
c0de8244:	e9c1 2006 	strd	r2, r0, [r1, #24]
c0de8248:	f89a 0011 	ldrb.w	r0, [sl, #17]
c0de824c:	f881 0020 	strb.w	r0, [r1, #32]
c0de8250:	2005      	movs	r0, #5
c0de8252:	f88d 0010 	strb.w	r0, [sp, #16]
c0de8256:	f88d 501c 	strb.w	r5, [sp, #28]
c0de825a:	f89a 000f 	ldrb.w	r0, [sl, #15]
c0de825e:	f88d 001f 	strb.w	r0, [sp, #31]
c0de8262:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de8266:	b328      	cbz	r0, c0de82b4 <displayGenericContextPage+0x3a0>
c0de8268:	eb00 1006 	add.w	r0, r0, r6, lsl #4
c0de826c:	f002 fd7e 	bl	c0dead6c <pic>
c0de8270:	9005      	str	r0, [sp, #20]
c0de8272:	f100 010c 	add.w	r1, r0, #12
c0de8276:	1c68      	adds	r0, r5, #1
c0de8278:	3801      	subs	r0, #1
c0de827a:	d033      	beq.n	c0de82e4 <displayGenericContextPage+0x3d0>
c0de827c:	f101 0210 	add.w	r2, r1, #16
c0de8280:	7809      	ldrb	r1, [r1, #0]
c0de8282:	0749      	lsls	r1, r1, #29
c0de8284:	4611      	mov	r1, r2
c0de8286:	d5f7      	bpl.n	c0de8278 <displayGenericContextPage+0x364>
c0de8288:	e029      	b.n	c0de82de <displayGenericContextPage+0x3ca>
c0de828a:	2101      	movs	r1, #1
c0de828c:	f88d 1010 	strb.w	r1, [sp, #16]
c0de8290:	6881      	ldr	r1, [r0, #8]
c0de8292:	4a22      	ldr	r2, [pc, #136]	@ (c0de831c <displayGenericContextPage+0x408>)
c0de8294:	447a      	add	r2, pc
c0de8296:	920c      	str	r2, [sp, #48]	@ 0x30
c0de8298:	e9d0 2000 	ldrd	r2, r0, [r0]
c0de829c:	9106      	str	r1, [sp, #24]
c0de829e:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de82a0:	2000      	movs	r0, #0
c0de82a2:	9209      	str	r2, [sp, #36]	@ 0x24
c0de82a4:	f88d 0036 	strb.w	r0, [sp, #54]	@ 0x36
c0de82a8:	f8ad 0034 	strh.w	r0, [sp, #52]	@ 0x34
c0de82ac:	900a      	str	r0, [sp, #40]	@ 0x28
c0de82ae:	f88d 0014 	strb.w	r0, [sp, #20]
c0de82b2:	e779      	b.n	c0de81a8 <displayGenericContextPage+0x294>
c0de82b4:	2400      	movs	r4, #0
c0de82b6:	9405      	str	r4, [sp, #20]
c0de82b8:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de82bc:	f88d 601d 	strb.w	r6, [sp, #29]
c0de82c0:	9006      	str	r0, [sp, #24]
c0de82c2:	b2e0      	uxtb	r0, r4
c0de82c4:	42a8      	cmp	r0, r5
c0de82c6:	d20d      	bcs.n	c0de82e4 <displayGenericContextPage+0x3d0>
c0de82c8:	19a0      	adds	r0, r4, r6
c0de82ca:	f8da 1008 	ldr.w	r1, [sl, #8]
c0de82ce:	b2c0      	uxtb	r0, r0
c0de82d0:	4788      	blx	r1
c0de82d2:	f002 fd4b 	bl	c0dead6c <pic>
c0de82d6:	7b00      	ldrb	r0, [r0, #12]
c0de82d8:	3401      	adds	r4, #1
c0de82da:	0740      	lsls	r0, r0, #29
c0de82dc:	d5f1      	bpl.n	c0de82c2 <displayGenericContextPage+0x3ae>
c0de82de:	200d      	movs	r0, #13
c0de82e0:	f88d 001f 	strb.w	r0, [sp, #31]
c0de82e4:	2009      	movs	r0, #9
c0de82e6:	f88d 001e 	strb.w	r0, [sp, #30]
c0de82ea:	2000      	movs	r0, #0
c0de82ec:	f88d 0020 	strb.w	r0, [sp, #32]
c0de82f0:	f89a 0011 	ldrb.w	r0, [sl, #17]
c0de82f4:	f88d 0021 	strb.w	r0, [sp, #33]	@ 0x21
c0de82f8:	e756      	b.n	c0de81a8 <displayGenericContextPage+0x294>
c0de82fa:	bf00      	nop
c0de82fc:	00001c48 	.word	0x00001c48
c0de8300:	00001cc4 	.word	0x00001cc4
c0de8304:	0000197c 	.word	0x0000197c
c0de8308:	00004f22 	.word	0x00004f22
c0de830c:	0000485c 	.word	0x0000485c
c0de8310:	00004168 	.word	0x00004168
c0de8314:	000044ab 	.word	0x000044ab
c0de8318:	000002a5 	.word	0x000002a5
c0de831c:	00004ce9 	.word	0x00004ce9

c0de8320 <nbgl_useCaseHomeAndSettings>:
c0de8320:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de8324:	f8df 8060 	ldr.w	r8, [pc, #96]	@ c0de8388 <nbgl_useCaseHomeAndSettings+0x68>
c0de8328:	469a      	mov	sl, r3
c0de832a:	4615      	mov	r5, r2
c0de832c:	460e      	mov	r6, r1
c0de832e:	4607      	mov	r7, r0
c0de8330:	eb09 0408 	add.w	r4, r9, r8
c0de8334:	f7ff fc56 	bl	c0de7be4 <reset_callbacks_and_context>
c0de8338:	9809      	ldr	r0, [sp, #36]	@ 0x24
c0de833a:	6320      	str	r0, [r4, #48]	@ 0x30
c0de833c:	9808      	ldr	r0, [sp, #32]
c0de833e:	e9c4 7608 	strd	r7, r6, [r4, #32]
c0de8342:	e9c4 500a 	strd	r5, r0, [r4, #40]	@ 0x28
c0de8346:	e9dd 100a 	ldrd	r1, r0, [sp, #40]	@ 0x28
c0de834a:	b131      	cbz	r1, c0de835a <nbgl_useCaseHomeAndSettings+0x3a>
c0de834c:	eb09 0208 	add.w	r2, r9, r8
c0de8350:	e891 0078 	ldmia.w	r1, {r3, r4, r5, r6}
c0de8354:	3234      	adds	r2, #52	@ 0x34
c0de8356:	c278      	stmia	r2!, {r3, r4, r5, r6}
c0de8358:	e006      	b.n	c0de8368 <nbgl_useCaseHomeAndSettings+0x48>
c0de835a:	eb09 0108 	add.w	r1, r9, r8
c0de835e:	2200      	movs	r2, #0
c0de8360:	e9c1 220d 	strd	r2, r2, [r1, #52]	@ 0x34
c0de8364:	e9c1 220f 	strd	r2, r2, [r1, #60]	@ 0x3c
c0de8368:	eb09 0108 	add.w	r1, r9, r8
c0de836c:	f1ba 0fff 	cmp.w	sl, #255	@ 0xff
c0de8370:	6448      	str	r0, [r1, #68]	@ 0x44
c0de8372:	d004      	beq.n	c0de837e <nbgl_useCaseHomeAndSettings+0x5e>
c0de8374:	4650      	mov	r0, sl
c0de8376:	e8bd 45f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de837a:	f000 b807 	b.w	c0de838c <bundleNavStartSettingsAtPage>
c0de837e:	e8bd 45f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de8382:	f000 b815 	b.w	c0de83b0 <bundleNavStartHome>
c0de8386:	bf00      	nop
c0de8388:	00001cc4 	.word	0x00001cc4

c0de838c <bundleNavStartSettingsAtPage>:
c0de838c:	b51c      	push	{r2, r3, r4, lr}
c0de838e:	4601      	mov	r1, r0
c0de8390:	4805      	ldr	r0, [pc, #20]	@ (c0de83a8 <bundleNavStartSettingsAtPage+0x1c>)
c0de8392:	eb09 0300 	add.w	r3, r9, r0
c0de8396:	6a18      	ldr	r0, [r3, #32]
c0de8398:	e9d3 230b 	ldrd	r2, r3, [r3, #44]	@ 0x2c
c0de839c:	4c03      	ldr	r4, [pc, #12]	@ (c0de83ac <bundleNavStartSettingsAtPage+0x20>)
c0de839e:	447c      	add	r4, pc
c0de83a0:	9400      	str	r4, [sp, #0]
c0de83a2:	f7ff fca3 	bl	c0de7cec <nbgl_useCaseGenericSettings>
c0de83a6:	bd1c      	pop	{r2, r3, r4, pc}
c0de83a8:	00001cc4 	.word	0x00001cc4
c0de83ac:	0000000f 	.word	0x0000000f

c0de83b0 <bundleNavStartHome>:
c0de83b0:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
c0de83b2:	4809      	ldr	r0, [pc, #36]	@ (c0de83d8 <bundleNavStartHome+0x28>)
c0de83b4:	eb09 0400 	add.w	r4, r9, r0
c0de83b8:	f104 0320 	add.w	r3, r4, #32
c0de83bc:	6c65      	ldr	r5, [r4, #68]	@ 0x44
c0de83be:	3434      	adds	r4, #52	@ 0x34
c0de83c0:	cb0f      	ldmia	r3, {r0, r1, r2, r3}
c0de83c2:	4e06      	ldr	r6, [pc, #24]	@ (c0de83dc <bundleNavStartHome+0x2c>)
c0de83c4:	2b00      	cmp	r3, #0
c0de83c6:	9502      	str	r5, [sp, #8]
c0de83c8:	447e      	add	r6, pc
c0de83ca:	e9cd 4600 	strd	r4, r6, [sp]
c0de83ce:	bf18      	it	ne
c0de83d0:	2301      	movne	r3, #1
c0de83d2:	f7ff fb6d 	bl	c0de7ab0 <useCaseHomeExt>
c0de83d6:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}
c0de83d8:	00001cc4 	.word	0x00001cc4
c0de83dc:	0000113d 	.word	0x0000113d

c0de83e0 <nbgl_useCaseStatus>:
c0de83e0:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de83e4:	b090      	sub	sp, #64	@ 0x40
c0de83e6:	4604      	mov	r4, r0
c0de83e8:	4822      	ldr	r0, [pc, #136]	@ (c0de8474 <nbgl_useCaseStatus+0x94>)
c0de83ea:	460e      	mov	r6, r1
c0de83ec:	4615      	mov	r5, r2
c0de83ee:	a90d      	add	r1, sp, #52	@ 0x34
c0de83f0:	f8df 807c 	ldr.w	r8, [pc, #124]	@ c0de8470 <nbgl_useCaseStatus+0x90>
c0de83f4:	4478      	add	r0, pc
c0de83f6:	e890 008c 	ldmia.w	r0, {r2, r3, r7}
c0de83fa:	c18c      	stmia	r1!, {r2, r3, r7}
c0de83fc:	eb09 0708 	add.w	r7, r9, r8
c0de8400:	f7ff fbf0 	bl	c0de7be4 <reset_callbacks_and_context>
c0de8404:	607d      	str	r5, [r7, #4]
c0de8406:	b156      	cbz	r6, c0de841e <nbgl_useCaseStatus+0x3e>
c0de8408:	2003      	movs	r0, #3
c0de840a:	f7fa fc96 	bl	c0de2d3a <os_io_seph_cmd_piezo_play_tune>
c0de840e:	481a      	ldr	r0, [pc, #104]	@ (c0de8478 <nbgl_useCaseStatus+0x98>)
c0de8410:	a90d      	add	r1, sp, #52	@ 0x34
c0de8412:	4622      	mov	r2, r4
c0de8414:	2302      	movs	r3, #2
c0de8416:	4478      	add	r0, pc
c0de8418:	f7fe fe22 	bl	c0de7060 <nbgl_pageDrawLedgerInfo>
c0de841c:	e020      	b.n	c0de8460 <nbgl_useCaseStatus+0x80>
c0de841e:	2000      	movs	r0, #0
c0de8420:	f44f 1140 	mov.w	r1, #3145728	@ 0x300000
c0de8424:	466a      	mov	r2, sp
c0de8426:	9005      	str	r0, [sp, #20]
c0de8428:	9104      	str	r1, [sp, #16]
c0de842a:	4914      	ldr	r1, [pc, #80]	@ (c0de847c <nbgl_useCaseStatus+0x9c>)
c0de842c:	e9cd 4000 	strd	r4, r0, [sp]
c0de8430:	9006      	str	r0, [sp, #24]
c0de8432:	f88d 001c 	strb.w	r0, [sp, #28]
c0de8436:	e9cd 000a 	strd	r0, r0, [sp, #40]	@ 0x28
c0de843a:	4479      	add	r1, pc
c0de843c:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de8440:	f44f 6110 	mov.w	r1, #2304	@ 0x900
c0de8444:	f44f 7000 	mov.w	r0, #512	@ 0x200
c0de8448:	f8ad 1030 	strh.w	r1, [sp, #48]	@ 0x30
c0de844c:	f8ad 0024 	strh.w	r0, [sp, #36]	@ 0x24
c0de8450:	480b      	ldr	r0, [pc, #44]	@ (c0de8480 <nbgl_useCaseStatus+0xa0>)
c0de8452:	4478      	add	r0, pc
c0de8454:	9008      	str	r0, [sp, #32]
c0de8456:	480b      	ldr	r0, [pc, #44]	@ (c0de8484 <nbgl_useCaseStatus+0xa4>)
c0de8458:	a90d      	add	r1, sp, #52	@ 0x34
c0de845a:	4478      	add	r0, pc
c0de845c:	f7fe fe54 	bl	c0de7108 <nbgl_pageDrawInfo>
c0de8460:	eb09 0108 	add.w	r1, r9, r8
c0de8464:	6148      	str	r0, [r1, #20]
c0de8466:	f001 fdbb 	bl	c0de9fe0 <OUTLINED_FUNCTION_3>
c0de846a:	b010      	add	sp, #64	@ 0x40
c0de846c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de8470:	00001c48 	.word	0x00001c48
c0de8474:	00006054 	.word	0x00006054
c0de8478:	0000008f 	.word	0x0000008f
c0de847c:	00003598 	.word	0x00003598
c0de8480:	00004a8d 	.word	0x00004a8d
c0de8484:	0000004b 	.word	0x0000004b

c0de8488 <tickerCallback>:
c0de8488:	b510      	push	{r4, lr}
c0de848a:	4806      	ldr	r0, [pc, #24]	@ (c0de84a4 <tickerCallback+0x1c>)
c0de848c:	eb09 0400 	add.w	r4, r9, r0
c0de8490:	6960      	ldr	r0, [r4, #20]
c0de8492:	f7ff f98c 	bl	c0de77ae <nbgl_pageRelease>
c0de8496:	6860      	ldr	r0, [r4, #4]
c0de8498:	b110      	cbz	r0, c0de84a0 <tickerCallback+0x18>
c0de849a:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de849e:	4700      	bx	r0
c0de84a0:	bd10      	pop	{r4, pc}
c0de84a2:	bf00      	nop
c0de84a4:	00001c48 	.word	0x00001c48

c0de84a8 <pageCallback>:
c0de84a8:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de84ac:	b092      	sub	sp, #72	@ 0x48
c0de84ae:	b350      	cbz	r0, c0de8506 <pageCallback+0x5e>
c0de84b0:	4605      	mov	r5, r0
c0de84b2:	2801      	cmp	r0, #1
c0de84b4:	d034      	beq.n	c0de8520 <pageCallback+0x78>
c0de84b6:	2d12      	cmp	r5, #18
c0de84b8:	d043      	beq.n	c0de8542 <pageCallback+0x9a>
c0de84ba:	460c      	mov	r4, r1
c0de84bc:	2d03      	cmp	r5, #3
c0de84be:	d055      	beq.n	c0de856c <pageCallback+0xc4>
c0de84c0:	2d05      	cmp	r5, #5
c0de84c2:	d05f      	beq.n	c0de8584 <pageCallback+0xdc>
c0de84c4:	2d06      	cmp	r5, #6
c0de84c6:	d075      	beq.n	c0de85b4 <pageCallback+0x10c>
c0de84c8:	2d07      	cmp	r5, #7
c0de84ca:	d077      	beq.n	c0de85bc <pageCallback+0x114>
c0de84cc:	2d08      	cmp	r5, #8
c0de84ce:	f000 809e 	beq.w	c0de860e <pageCallback+0x166>
c0de84d2:	2d09      	cmp	r5, #9
c0de84d4:	f000 80a9 	beq.w	c0de862a <pageCallback+0x182>
c0de84d8:	2d0a      	cmp	r5, #10
c0de84da:	f000 80b0 	beq.w	c0de863e <pageCallback+0x196>
c0de84de:	2d0b      	cmp	r5, #11
c0de84e0:	f000 80fa 	beq.w	c0de86d8 <pageCallback+0x230>
c0de84e4:	2d0c      	cmp	r5, #12
c0de84e6:	f000 80fe 	beq.w	c0de86e6 <pageCallback+0x23e>
c0de84ea:	2d0d      	cmp	r5, #13
c0de84ec:	f000 8105 	beq.w	c0de86fa <pageCallback+0x252>
c0de84f0:	2d10      	cmp	r5, #16
c0de84f2:	f000 810e 	beq.w	c0de8712 <pageCallback+0x26a>
c0de84f6:	2d11      	cmp	r5, #17
c0de84f8:	f000 8113 	beq.w	c0de8722 <pageCallback+0x27a>
c0de84fc:	2d02      	cmp	r5, #2
c0de84fe:	f040 8119 	bne.w	c0de8734 <pageCallback+0x28c>
c0de8502:	48cb      	ldr	r0, [pc, #812]	@ (c0de8830 <pageCallback+0x388>)
c0de8504:	e161      	b.n	c0de87ca <pageCallback+0x322>
c0de8506:	48ca      	ldr	r0, [pc, #808]	@ (c0de8830 <pageCallback+0x388>)
c0de8508:	eb09 0100 	add.w	r1, r9, r0
c0de850c:	f891 0060 	ldrb.w	r0, [r1, #96]	@ 0x60
c0de8510:	6889      	ldr	r1, [r1, #8]
c0de8512:	3801      	subs	r0, #1
c0de8514:	2900      	cmp	r1, #0
c0de8516:	f000 8124 	beq.w	c0de8762 <pageCallback+0x2ba>
c0de851a:	b2c0      	uxtb	r0, r0
c0de851c:	2101      	movs	r1, #1
c0de851e:	e00b      	b.n	c0de8538 <pageCallback+0x90>
c0de8520:	48c3      	ldr	r0, [pc, #780]	@ (c0de8830 <pageCallback+0x388>)
c0de8522:	eb09 0100 	add.w	r1, r9, r0
c0de8526:	f891 0060 	ldrb.w	r0, [r1, #96]	@ 0x60
c0de852a:	6889      	ldr	r1, [r1, #8]
c0de852c:	3001      	adds	r0, #1
c0de852e:	2900      	cmp	r1, #0
c0de8530:	f000 8117 	beq.w	c0de8762 <pageCallback+0x2ba>
c0de8534:	b2c0      	uxtb	r0, r0
c0de8536:	2100      	movs	r1, #0
c0de8538:	b012      	add	sp, #72	@ 0x48
c0de853a:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de853e:	f000 baa7 	b.w	c0de8a90 <displayReviewPage>
c0de8542:	48b9      	ldr	r0, [pc, #740]	@ (c0de8828 <pageCallback+0x380>)
c0de8544:	eb09 0100 	add.w	r1, r9, r0
c0de8548:	f891 1021 	ldrb.w	r1, [r1, #33]	@ 0x21
c0de854c:	2900      	cmp	r1, #0
c0de854e:	f000 810f 	beq.w	c0de8770 <pageCallback+0x2c8>
c0de8552:	eb09 0100 	add.w	r1, r9, r0
c0de8556:	6d89      	ldr	r1, [r1, #88]	@ 0x58
c0de8558:	680a      	ldr	r2, [r1, #0]
c0de855a:	2a00      	cmp	r2, #0
c0de855c:	f000 8108 	beq.w	c0de8770 <pageCallback+0x2c8>
c0de8560:	4448      	add	r0, r9
c0de8562:	2201      	movs	r2, #1
c0de8564:	f880 2068 	strb.w	r2, [r0, #104]	@ 0x68
c0de8568:	6808      	ldr	r0, [r1, #0]
c0de856a:	e0de      	b.n	c0de872a <pageCallback+0x282>
c0de856c:	48b0      	ldr	r0, [pc, #704]	@ (c0de8830 <pageCallback+0x388>)
c0de856e:	2cff      	cmp	r4, #255	@ 0xff
c0de8570:	f000 812b 	beq.w	c0de87ca <pageCallback+0x322>
c0de8574:	f819 0000 	ldrb.w	r0, [r9, r0]
c0de8578:	1e81      	subs	r1, r0, #2
c0de857a:	2902      	cmp	r1, #2
c0de857c:	f080 8144 	bcs.w	c0de8808 <pageCallback+0x360>
c0de8580:	4620      	mov	r0, r4
c0de8582:	e0ef      	b.n	c0de8764 <pageCallback+0x2bc>
c0de8584:	a80a      	add	r0, sp, #40	@ 0x28
c0de8586:	49b0      	ldr	r1, [pc, #704]	@ (c0de8848 <pageCallback+0x3a0>)
c0de8588:	2220      	movs	r2, #32
c0de858a:	4479      	add	r1, pc
c0de858c:	f002 fe06 	bl	c0deb19c <__aeabi_memcpy>
c0de8590:	4ca7      	ldr	r4, [pc, #668]	@ (c0de8830 <pageCallback+0x388>)
c0de8592:	eb09 0004 	add.w	r0, r9, r4
c0de8596:	6a00      	ldr	r0, [r0, #32]
c0de8598:	b108      	cbz	r0, c0de859e <pageCallback+0xf6>
c0de859a:	f7ff f908 	bl	c0de77ae <nbgl_pageRelease>
c0de859e:	48ab      	ldr	r0, [pc, #684]	@ (c0de884c <pageCallback+0x3a4>)
c0de85a0:	a90a      	add	r1, sp, #40	@ 0x28
c0de85a2:	4478      	add	r0, pc
c0de85a4:	f7fe fea0 	bl	c0de72e8 <nbgl_pageDrawConfirmation>
c0de85a8:	eb09 0104 	add.w	r1, r9, r4
c0de85ac:	6208      	str	r0, [r1, #32]
c0de85ae:	f001 fd17 	bl	c0de9fe0 <OUTLINED_FUNCTION_3>
c0de85b2:	e111      	b.n	c0de87d8 <pageCallback+0x330>
c0de85b4:	489e      	ldr	r0, [pc, #632]	@ (c0de8830 <pageCallback+0x388>)
c0de85b6:	4448      	add	r0, r9
c0de85b8:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0de85ba:	e108      	b.n	c0de87ce <pageCallback+0x326>
c0de85bc:	ac0a      	add	r4, sp, #40	@ 0x28
c0de85be:	499f      	ldr	r1, [pc, #636]	@ (c0de883c <pageCallback+0x394>)
c0de85c0:	221c      	movs	r2, #28
c0de85c2:	4620      	mov	r0, r4
c0de85c4:	4479      	add	r1, pc
c0de85c6:	f002 fde9 	bl	c0deb19c <__aeabi_memcpy>
c0de85ca:	489d      	ldr	r0, [pc, #628]	@ (c0de8840 <pageCallback+0x398>)
c0de85cc:	ad06      	add	r5, sp, #24
c0de85ce:	4629      	mov	r1, r5
c0de85d0:	4478      	add	r0, pc
c0de85d2:	e890 00cc 	ldmia.w	r0, {r2, r3, r6, r7}
c0de85d6:	f44f 3080 	mov.w	r0, #65536	@ 0x10000
c0de85da:	c1cc      	stmia	r1!, {r2, r3, r6, r7}
c0de85dc:	4e95      	ldr	r6, [pc, #596]	@ (c0de8834 <pageCallback+0x38c>)
c0de85de:	9005      	str	r0, [sp, #20]
c0de85e0:	eb09 0706 	add.w	r7, r9, r6
c0de85e4:	6878      	ldr	r0, [r7, #4]
c0de85e6:	9002      	str	r0, [sp, #8]
c0de85e8:	2000      	movs	r0, #0
c0de85ea:	9003      	str	r0, [sp, #12]
c0de85ec:	4620      	mov	r0, r4
c0de85ee:	f7fa fdab 	bl	c0de3148 <nbgl_layoutGet>
c0de85f2:	4629      	mov	r1, r5
c0de85f4:	6338      	str	r0, [r7, #48]	@ 0x30
c0de85f6:	f7fd fb3f 	bl	c0de5c78 <nbgl_layoutAddHeader>
c0de85fa:	6879      	ldr	r1, [r7, #4]
c0de85fc:	200b      	movs	r0, #11
c0de85fe:	f001 fd0b 	bl	c0dea018 <OUTLINED_FUNCTION_11>
c0de8602:	6879      	ldr	r1, [r7, #4]
c0de8604:	2804      	cmp	r0, #4
c0de8606:	f080 80be 	bcs.w	c0de8786 <pageCallback+0x2de>
c0de860a:	460c      	mov	r4, r1
c0de860c:	e0c7      	b.n	c0de879e <pageCallback+0x2f6>
c0de860e:	4888      	ldr	r0, [pc, #544]	@ (c0de8830 <pageCallback+0x388>)
c0de8610:	2c00      	cmp	r4, #0
c0de8612:	f040 80d8 	bne.w	c0de87c6 <pageCallback+0x31e>
c0de8616:	eb09 0100 	add.w	r1, r9, r0
c0de861a:	6a49      	ldr	r1, [r1, #36]	@ 0x24
c0de861c:	2900      	cmp	r1, #0
c0de861e:	f000 80d2 	beq.w	c0de87c6 <pageCallback+0x31e>
c0de8622:	b012      	add	sp, #72	@ 0x48
c0de8624:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8628:	4708      	bx	r1
c0de862a:	4881      	ldr	r0, [pc, #516]	@ (c0de8830 <pageCallback+0x388>)
c0de862c:	4448      	add	r0, r9
c0de862e:	6981      	ldr	r1, [r0, #24]
c0de8630:	2900      	cmp	r1, #0
c0de8632:	f000 80d1 	beq.w	c0de87d8 <pageCallback+0x330>
c0de8636:	fab4 f084 	clz	r0, r4
c0de863a:	0940      	lsrs	r0, r0, #5
c0de863c:	e059      	b.n	c0de86f2 <pageCallback+0x24a>
c0de863e:	487a      	ldr	r0, [pc, #488]	@ (c0de8828 <pageCallback+0x380>)
c0de8640:	f8df 81ec 	ldr.w	r8, [pc, #492]	@ c0de8830 <pageCallback+0x388>
c0de8644:	2700      	movs	r7, #0
c0de8646:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de864a:	f04f 0a0b 	mov.w	sl, #11
c0de864e:	4448      	add	r0, r9
c0de8650:	eb09 0608 	add.w	r6, r9, r8
c0de8654:	f890 4020 	ldrb.w	r4, [r0, #32]
c0de8658:	e9d0 b506 	ldrd	fp, r5, [r0, #24]
c0de865c:	200b      	movs	r0, #11
c0de865e:	e9c6 770c 	strd	r7, r7, [r6, #48]	@ 0x30
c0de8662:	e9c6 770e 	strd	r7, r7, [r6, #56]	@ 0x38
c0de8666:	4629      	mov	r1, r5
c0de8668:	4623      	mov	r3, r4
c0de866a:	f002 f9bc 	bl	c0dea9e6 <nbgl_getTextNbLinesInWidth>
c0de866e:	f100 010a 	add.w	r1, r0, #10
c0de8672:	e9c6 b50d 	strd	fp, r5, [r6, #52]	@ 0x34
c0de8676:	f886 4033 	strb.w	r4, [r6, #51]	@ 0x33
c0de867a:	f886 7031 	strb.w	r7, [r6, #49]	@ 0x31
c0de867e:	fbb1 f1fa 	udiv	r1, r1, sl
c0de8682:	b2ca      	uxtb	r2, r1
c0de8684:	f886 1030 	strb.w	r1, [r6, #48]	@ 0x30
c0de8688:	2a02      	cmp	r2, #2
c0de868a:	d31e      	bcc.n	c0de86ca <pageCallback+0x222>
c0de868c:	3a01      	subs	r2, #1
c0de868e:	241a      	movs	r4, #26
c0de8690:	eb02 0342 	add.w	r3, r2, r2, lsl #1
c0de8694:	3319      	adds	r3, #25
c0de8696:	b29b      	uxth	r3, r3
c0de8698:	fbb3 f4f4 	udiv	r4, r3, r4
c0de869c:	b2e4      	uxtb	r4, r4
c0de869e:	fbb4 f5fa 	udiv	r5, r4, sl
c0de86a2:	fb05 441a 	mls	r4, r5, sl, r4
c0de86a6:	f06f 050a 	mvn.w	r5, #10
c0de86aa:	fb02 0005 	mla	r0, r2, r5, r0
c0de86ae:	f44f 728f 	mov.w	r2, #286	@ 0x11e
c0de86b2:	fbb3 f2f2 	udiv	r2, r3, r2
c0de86b6:	b2c0      	uxtb	r0, r0
c0de86b8:	4420      	add	r0, r4
c0de86ba:	4411      	add	r1, r2
c0de86bc:	280b      	cmp	r0, #11
c0de86be:	eb09 0008 	add.w	r0, r9, r8
c0de86c2:	bf88      	it	hi
c0de86c4:	3101      	addhi	r1, #1
c0de86c6:	f880 1030 	strb.w	r1, [r0, #48]	@ 0x30
c0de86ca:	2000      	movs	r0, #0
c0de86cc:	2101      	movs	r1, #1
c0de86ce:	b012      	add	sp, #72	@ 0x48
c0de86d0:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de86d4:	f001 ba30 	b.w	c0de9b38 <displayDetailsPage>
c0de86d8:	4855      	ldr	r0, [pc, #340]	@ (c0de8830 <pageCallback+0x388>)
c0de86da:	4448      	add	r0, r9
c0de86dc:	6981      	ldr	r1, [r0, #24]
c0de86de:	2900      	cmp	r1, #0
c0de86e0:	d07a      	beq.n	c0de87d8 <pageCallback+0x330>
c0de86e2:	2001      	movs	r0, #1
c0de86e4:	e005      	b.n	c0de86f2 <pageCallback+0x24a>
c0de86e6:	4852      	ldr	r0, [pc, #328]	@ (c0de8830 <pageCallback+0x388>)
c0de86e8:	4448      	add	r0, r9
c0de86ea:	6981      	ldr	r1, [r0, #24]
c0de86ec:	2900      	cmp	r1, #0
c0de86ee:	d073      	beq.n	c0de87d8 <pageCallback+0x330>
c0de86f0:	2000      	movs	r0, #0
c0de86f2:	b012      	add	sp, #72	@ 0x48
c0de86f4:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de86f8:	4708      	bx	r1
c0de86fa:	484b      	ldr	r0, [pc, #300]	@ (c0de8828 <pageCallback+0x380>)
c0de86fc:	eb09 0100 	add.w	r1, r9, r0
c0de8700:	4448      	add	r0, r9
c0de8702:	6a49      	ldr	r1, [r1, #36]	@ 0x24
c0de8704:	2900      	cmp	r1, #0
c0de8706:	d06a      	beq.n	c0de87de <pageCallback+0x336>
c0de8708:	7c80      	ldrb	r0, [r0, #18]
c0de870a:	4420      	add	r0, r4
c0de870c:	eb01 1000 	add.w	r0, r1, r0, lsl #4
c0de8710:	e06a      	b.n	c0de87e8 <pageCallback+0x340>
c0de8712:	4845      	ldr	r0, [pc, #276]	@ (c0de8828 <pageCallback+0x380>)
c0de8714:	2100      	movs	r1, #0
c0de8716:	4448      	add	r0, r9
c0de8718:	6581      	str	r1, [r0, #88]	@ 0x58
c0de871a:	f880 1069 	strb.w	r1, [r0, #105]	@ 0x69
c0de871e:	2010      	movs	r0, #16
c0de8720:	e003      	b.n	c0de872a <pageCallback+0x282>
c0de8722:	4a41      	ldr	r2, [pc, #260]	@ (c0de8828 <pageCallback+0x380>)
c0de8724:	f001 fc5f 	bl	c0de9fe6 <OUTLINED_FUNCTION_4>
c0de8728:	d067      	beq.n	c0de87fa <pageCallback+0x352>
c0de872a:	b012      	add	sp, #72	@ 0x48
c0de872c:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8730:	f000 bfcc 	b.w	c0de96cc <displaySecurityReport>
c0de8734:	4e3e      	ldr	r6, [pc, #248]	@ (c0de8830 <pageCallback+0x388>)
c0de8736:	eb09 0006 	add.w	r0, r9, r6
c0de873a:	6ac3      	ldr	r3, [r0, #44]	@ 0x2c
c0de873c:	b133      	cbz	r3, c0de874c <pageCallback+0x2a4>
c0de873e:	eb09 0006 	add.w	r0, r9, r6
c0de8742:	4621      	mov	r1, r4
c0de8744:	f890 2060 	ldrb.w	r2, [r0, #96]	@ 0x60
c0de8748:	4628      	mov	r0, r5
c0de874a:	4798      	blx	r3
c0de874c:	eb09 0006 	add.w	r0, r9, r6
c0de8750:	68c2      	ldr	r2, [r0, #12]
c0de8752:	2a00      	cmp	r2, #0
c0de8754:	d040      	beq.n	c0de87d8 <pageCallback+0x330>
c0de8756:	4628      	mov	r0, r5
c0de8758:	4621      	mov	r1, r4
c0de875a:	b012      	add	sp, #72	@ 0x48
c0de875c:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8760:	4710      	bx	r2
c0de8762:	b2c0      	uxtb	r0, r0
c0de8764:	2100      	movs	r1, #0
c0de8766:	b012      	add	sp, #72	@ 0x48
c0de8768:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de876c:	f7ff bbd2 	b.w	c0de7f14 <displayGenericContextPage>
c0de8770:	482e      	ldr	r0, [pc, #184]	@ (c0de882c <pageCallback+0x384>)
c0de8772:	2200      	movs	r2, #0
c0de8774:	eb09 0100 	add.w	r1, r9, r0
c0de8778:	6888      	ldr	r0, [r1, #8]
c0de877a:	3110      	adds	r1, #16
c0de877c:	b012      	add	sp, #72	@ 0x48
c0de877e:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8782:	f001 b929 	b.w	c0de99d8 <displayInfosListModal>
c0de8786:	2080      	movs	r0, #128	@ 0x80
c0de8788:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de878c:	2303      	movs	r3, #3
c0de878e:	9001      	str	r0, [sp, #4]
c0de8790:	4829      	ldr	r0, [pc, #164]	@ (c0de8838 <pageCallback+0x390>)
c0de8792:	eb09 0400 	add.w	r4, r9, r0
c0de8796:	200b      	movs	r0, #11
c0de8798:	9400      	str	r4, [sp, #0]
c0de879a:	f002 f933 	bl	c0deaa04 <nbgl_textReduceOnNbLines>
c0de879e:	9404      	str	r4, [sp, #16]
c0de87a0:	eb09 0406 	add.w	r4, r9, r6
c0de87a4:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0de87a6:	a902      	add	r1, sp, #8
c0de87a8:	f7fc fe0b 	bl	c0de53c2 <nbgl_layoutAddQRCode>
c0de87ac:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0de87ae:	4925      	ldr	r1, [pc, #148]	@ (c0de8844 <pageCallback+0x39c>)
c0de87b0:	2215      	movs	r2, #21
c0de87b2:	2309      	movs	r3, #9
c0de87b4:	4479      	add	r1, pc
c0de87b6:	f7fd fa38 	bl	c0de5c2a <nbgl_layoutAddFooter>
c0de87ba:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0de87bc:	f7fd febe 	bl	c0de653c <nbgl_layoutDraw>
c0de87c0:	f002 f8b7 	bl	c0dea932 <nbgl_refresh>
c0de87c4:	e008      	b.n	c0de87d8 <pageCallback+0x330>
c0de87c6:	2c01      	cmp	r4, #1
c0de87c8:	d106      	bne.n	c0de87d8 <pageCallback+0x330>
c0de87ca:	4448      	add	r0, r9
c0de87cc:	6840      	ldr	r0, [r0, #4]
c0de87ce:	b118      	cbz	r0, c0de87d8 <pageCallback+0x330>
c0de87d0:	b012      	add	sp, #72	@ 0x48
c0de87d2:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de87d6:	4700      	bx	r0
c0de87d8:	b012      	add	sp, #72	@ 0x48
c0de87da:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de87de:	6a81      	ldr	r1, [r0, #40]	@ 0x28
c0de87e0:	7c80      	ldrb	r0, [r0, #18]
c0de87e2:	4420      	add	r0, r4
c0de87e4:	b2c0      	uxtb	r0, r0
c0de87e6:	4788      	blx	r1
c0de87e8:	e9d0 3100 	ldrd	r3, r1, [r0]
c0de87ec:	6882      	ldr	r2, [r0, #8]
c0de87ee:	4618      	mov	r0, r3
c0de87f0:	b012      	add	sp, #72	@ 0x48
c0de87f2:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de87f6:	f000 be8b 	b.w	c0de9510 <displayFullValuePage>
c0de87fa:	eb09 0002 	add.w	r0, r9, r2
c0de87fe:	f890 0069 	ldrb.w	r0, [r0, #105]	@ 0x69
c0de8802:	b120      	cbz	r0, c0de880e <pageCallback+0x366>
c0de8804:	6948      	ldr	r0, [r1, #20]
c0de8806:	e003      	b.n	c0de8810 <pageCallback+0x368>
c0de8808:	b938      	cbnz	r0, c0de881a <pageCallback+0x372>
c0de880a:	4620      	mov	r0, r4
c0de880c:	e693      	b.n	c0de8536 <pageCallback+0x8e>
c0de880e:	6988      	ldr	r0, [r1, #24]
c0de8810:	b012      	add	sp, #72	@ 0x48
c0de8812:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8816:	f001 b863 	b.w	c0de98e0 <displayCustomizedSecurityReport>
c0de881a:	4620      	mov	r0, r4
c0de881c:	2100      	movs	r1, #0
c0de881e:	b012      	add	sp, #72	@ 0x48
c0de8820:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8824:	f7ff ba30 	b.w	c0de7c88 <displaySettingsPage>
c0de8828:	0000197c 	.word	0x0000197c
c0de882c:	00001cc4 	.word	0x00001cc4
c0de8830:	00001c48 	.word	0x00001c48
c0de8834:	00001a90 	.word	0x00001a90
c0de8838:	00001bc8 	.word	0x00001bc8
c0de883c:	00005fa8 	.word	0x00005fa8
c0de8840:	00005f20 	.word	0x00005f20
c0de8844:	000041b0 	.word	0x000041b0
c0de8848:	00005f86 	.word	0x00005f86
c0de884c:	00000407 	.word	0x00000407

c0de8850 <nbgl_useCaseReviewStatus>:
c0de8850:	460a      	mov	r2, r1
c0de8852:	b198      	cbz	r0, c0de887c <nbgl_useCaseReviewStatus+0x2c>
c0de8854:	2801      	cmp	r0, #1
c0de8856:	d016      	beq.n	c0de8886 <nbgl_useCaseReviewStatus+0x36>
c0de8858:	2802      	cmp	r0, #2
c0de885a:	d019      	beq.n	c0de8890 <nbgl_useCaseReviewStatus+0x40>
c0de885c:	2803      	cmp	r0, #3
c0de885e:	d01c      	beq.n	c0de889a <nbgl_useCaseReviewStatus+0x4a>
c0de8860:	2804      	cmp	r0, #4
c0de8862:	d01f      	beq.n	c0de88a4 <nbgl_useCaseReviewStatus+0x54>
c0de8864:	2807      	cmp	r0, #7
c0de8866:	d022      	beq.n	c0de88ae <nbgl_useCaseReviewStatus+0x5e>
c0de8868:	2806      	cmp	r0, #6
c0de886a:	d025      	beq.n	c0de88b8 <nbgl_useCaseReviewStatus+0x68>
c0de886c:	2805      	cmp	r0, #5
c0de886e:	bf18      	it	ne
c0de8870:	4770      	bxne	lr
c0de8872:	4815      	ldr	r0, [pc, #84]	@ (c0de88c8 <nbgl_useCaseReviewStatus+0x78>)
c0de8874:	2100      	movs	r1, #0
c0de8876:	4478      	add	r0, pc
c0de8878:	f7ff bdb2 	b.w	c0de83e0 <nbgl_useCaseStatus>
c0de887c:	4813      	ldr	r0, [pc, #76]	@ (c0de88cc <nbgl_useCaseReviewStatus+0x7c>)
c0de887e:	2101      	movs	r1, #1
c0de8880:	4478      	add	r0, pc
c0de8882:	f7ff bdad 	b.w	c0de83e0 <nbgl_useCaseStatus>
c0de8886:	4812      	ldr	r0, [pc, #72]	@ (c0de88d0 <nbgl_useCaseReviewStatus+0x80>)
c0de8888:	2100      	movs	r1, #0
c0de888a:	4478      	add	r0, pc
c0de888c:	f7ff bda8 	b.w	c0de83e0 <nbgl_useCaseStatus>
c0de8890:	4810      	ldr	r0, [pc, #64]	@ (c0de88d4 <nbgl_useCaseReviewStatus+0x84>)
c0de8892:	2101      	movs	r1, #1
c0de8894:	4478      	add	r0, pc
c0de8896:	f7ff bda3 	b.w	c0de83e0 <nbgl_useCaseStatus>
c0de889a:	480f      	ldr	r0, [pc, #60]	@ (c0de88d8 <nbgl_useCaseReviewStatus+0x88>)
c0de889c:	2100      	movs	r1, #0
c0de889e:	4478      	add	r0, pc
c0de88a0:	f7ff bd9e 	b.w	c0de83e0 <nbgl_useCaseStatus>
c0de88a4:	4807      	ldr	r0, [pc, #28]	@ (c0de88c4 <nbgl_useCaseReviewStatus+0x74>)
c0de88a6:	2101      	movs	r1, #1
c0de88a8:	4478      	add	r0, pc
c0de88aa:	f7ff bd99 	b.w	c0de83e0 <nbgl_useCaseStatus>
c0de88ae:	480c      	ldr	r0, [pc, #48]	@ (c0de88e0 <nbgl_useCaseReviewStatus+0x90>)
c0de88b0:	2100      	movs	r1, #0
c0de88b2:	4478      	add	r0, pc
c0de88b4:	f7ff bd94 	b.w	c0de83e0 <nbgl_useCaseStatus>
c0de88b8:	4808      	ldr	r0, [pc, #32]	@ (c0de88dc <nbgl_useCaseReviewStatus+0x8c>)
c0de88ba:	2101      	movs	r1, #1
c0de88bc:	4478      	add	r0, pc
c0de88be:	f7ff bd8f 	b.w	c0de83e0 <nbgl_useCaseStatus>
c0de88c2:	bf00      	nop
c0de88c4:	00003e16 	.word	0x00003e16
c0de88c8:	00003ec7 	.word	0x00003ec7
c0de88cc:	00003ff3 	.word	0x00003ff3
c0de88d0:	000045ed 	.word	0x000045ed
c0de88d4:	000040c1 	.word	0x000040c1
c0de88d8:	00004423 	.word	0x00004423
c0de88dc:	00003f51 	.word	0x00003f51
c0de88e0:	00003e1d 	.word	0x00003e1d

c0de88e4 <nbgl_useCaseChoice>:
c0de88e4:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de88e8:	b088      	sub	sp, #32
c0de88ea:	4683      	mov	fp, r0
c0de88ec:	4668      	mov	r0, sp
c0de88ee:	460e      	mov	r6, r1
c0de88f0:	2118      	movs	r1, #24
c0de88f2:	461c      	mov	r4, r3
c0de88f4:	4617      	mov	r7, r2
c0de88f6:	3008      	adds	r0, #8
c0de88f8:	f002 fc5a 	bl	c0deb1b0 <__aeabi_memclr>
c0de88fc:	b324      	cbz	r4, c0de8948 <nbgl_useCaseChoice+0x64>
c0de88fe:	f8dd 8040 	ldr.w	r8, [sp, #64]	@ 0x40
c0de8902:	f1b8 0f00 	cmp.w	r8, #0
c0de8906:	d01f      	beq.n	c0de8948 <nbgl_useCaseChoice+0x64>
c0de8908:	4811      	ldr	r0, [pc, #68]	@ (c0de8950 <nbgl_useCaseChoice+0x6c>)
c0de890a:	f8dd a044 	ldr.w	sl, [sp, #68]	@ 0x44
c0de890e:	eb09 0500 	add.w	r5, r9, r0
c0de8912:	f7ff f967 	bl	c0de7be4 <reset_callbacks_and_context>
c0de8916:	2000      	movs	r0, #0
c0de8918:	f8c5 a018 	str.w	sl, [r5, #24]
c0de891c:	e9cd 6700 	strd	r6, r7, [sp]
c0de8920:	f8cd 8018 	str.w	r8, [sp, #24]
c0de8924:	9405      	str	r4, [sp, #20]
c0de8926:	f8cd b00c 	str.w	fp, [sp, #12]
c0de892a:	4669      	mov	r1, sp
c0de892c:	f88d 0011 	strb.w	r0, [sp, #17]
c0de8930:	2009      	movs	r0, #9
c0de8932:	f88d 001e 	strb.w	r0, [sp, #30]
c0de8936:	f88d 001c 	strb.w	r0, [sp, #28]
c0de893a:	4806      	ldr	r0, [pc, #24]	@ (c0de8954 <nbgl_useCaseChoice+0x70>)
c0de893c:	4478      	add	r0, pc
c0de893e:	f7fe fcd3 	bl	c0de72e8 <nbgl_pageDrawConfirmation>
c0de8942:	6168      	str	r0, [r5, #20]
c0de8944:	f001 fb4c 	bl	c0de9fe0 <OUTLINED_FUNCTION_3>
c0de8948:	b008      	add	sp, #32
c0de894a:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de894e:	bf00      	nop
c0de8950:	00001c48 	.word	0x00001c48
c0de8954:	fffffb69 	.word	0xfffffb69

c0de8958 <nbgl_useCaseConfirm>:
c0de8958:	b570      	push	{r4, r5, r6, lr}
c0de895a:	b088      	sub	sp, #32
c0de895c:	4c0f      	ldr	r4, [pc, #60]	@ (c0de899c <nbgl_useCaseConfirm+0x44>)
c0de895e:	9e0c      	ldr	r6, [sp, #48]	@ 0x30
c0de8960:	f10d 0c14 	add.w	ip, sp, #20
c0de8964:	eb09 0504 	add.w	r5, r9, r4
c0de8968:	61ee      	str	r6, [r5, #28]
c0de896a:	4e0d      	ldr	r6, [pc, #52]	@ (c0de89a0 <nbgl_useCaseConfirm+0x48>)
c0de896c:	e8ac 004c 	stmia.w	ip!, {r2, r3, r6}
c0de8970:	2200      	movs	r2, #0
c0de8972:	9204      	str	r2, [sp, #16]
c0de8974:	4b0b      	ldr	r3, [pc, #44]	@ (c0de89a4 <nbgl_useCaseConfirm+0x4c>)
c0de8976:	447b      	add	r3, pc
c0de8978:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0de897c:	6a28      	ldr	r0, [r5, #32]
c0de897e:	b108      	cbz	r0, c0de8984 <nbgl_useCaseConfirm+0x2c>
c0de8980:	f7fe ff15 	bl	c0de77ae <nbgl_pageRelease>
c0de8984:	4808      	ldr	r0, [pc, #32]	@ (c0de89a8 <nbgl_useCaseConfirm+0x50>)
c0de8986:	4669      	mov	r1, sp
c0de8988:	4478      	add	r0, pc
c0de898a:	f7fe fcad 	bl	c0de72e8 <nbgl_pageDrawConfirmation>
c0de898e:	eb09 0104 	add.w	r1, r9, r4
c0de8992:	6208      	str	r0, [r1, #32]
c0de8994:	f001 fb24 	bl	c0de9fe0 <OUTLINED_FUNCTION_3>
c0de8998:	b008      	add	sp, #32
c0de899a:	bd70      	pop	{r4, r5, r6, pc}
c0de899c:	00001c48 	.word	0x00001c48
c0de89a0:	01090009 	.word	0x01090009
c0de89a4:	00003268 	.word	0x00003268
c0de89a8:	00000021 	.word	0x00000021

c0de89ac <pageModalCallback>:
c0de89ac:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de89ae:	460c      	mov	r4, r1
c0de89b0:	280e      	cmp	r0, #14
c0de89b2:	d008      	beq.n	c0de89c6 <pageModalCallback+0x1a>
c0de89b4:	4605      	mov	r5, r0
c0de89b6:	280f      	cmp	r0, #15
c0de89b8:	d117      	bne.n	c0de89ea <pageModalCallback+0x3e>
c0de89ba:	4833      	ldr	r0, [pc, #204]	@ (c0de8a88 <pageModalCallback+0xdc>)
c0de89bc:	4448      	add	r0, r9
c0de89be:	e9d0 2104 	ldrd	r2, r1, [r0, #16]
c0de89c2:	6983      	ldr	r3, [r0, #24]
c0de89c4:	e005      	b.n	c0de89d2 <pageModalCallback+0x26>
c0de89c6:	482f      	ldr	r0, [pc, #188]	@ (c0de8a84 <pageModalCallback+0xd8>)
c0de89c8:	4448      	add	r0, r9
c0de89ca:	6b40      	ldr	r0, [r0, #52]	@ 0x34
c0de89cc:	e9d0 2100 	ldrd	r2, r1, [r0]
c0de89d0:	6883      	ldr	r3, [r0, #8]
c0de89d2:	f852 0024 	ldr.w	r0, [r2, r4, lsl #2]
c0de89d6:	eb04 0244 	add.w	r2, r4, r4, lsl #1
c0de89da:	f851 1024 	ldr.w	r1, [r1, r4, lsl #2]
c0de89de:	eb03 02c2 	add.w	r2, r3, r2, lsl #3
c0de89e2:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de89e6:	f000 bd93 	b.w	c0de9510 <displayFullValuePage>
c0de89ea:	4e28      	ldr	r6, [pc, #160]	@ (c0de8a8c <pageModalCallback+0xe0>)
c0de89ec:	eb09 0706 	add.w	r7, r9, r6
c0de89f0:	6a38      	ldr	r0, [r7, #32]
c0de89f2:	f7fe fedc 	bl	c0de77ae <nbgl_pageRelease>
c0de89f6:	2000      	movs	r0, #0
c0de89f8:	2d02      	cmp	r5, #2
c0de89fa:	6238      	str	r0, [r7, #32]
c0de89fc:	d032      	beq.n	c0de8a64 <pageModalCallback+0xb8>
c0de89fe:	2d13      	cmp	r5, #19
c0de8a00:	d00f      	beq.n	c0de8a22 <pageModalCallback+0x76>
c0de8a02:	2d04      	cmp	r5, #4
c0de8a04:	d01e      	beq.n	c0de8a44 <pageModalCallback+0x98>
c0de8a06:	2d05      	cmp	r5, #5
c0de8a08:	d024      	beq.n	c0de8a54 <pageModalCallback+0xa8>
c0de8a0a:	2d09      	cmp	r5, #9
c0de8a0c:	d029      	beq.n	c0de8a62 <pageModalCallback+0xb6>
c0de8a0e:	2d03      	cmp	r5, #3
c0de8a10:	d137      	bne.n	c0de8a82 <pageModalCallback+0xd6>
c0de8a12:	2cff      	cmp	r4, #255	@ 0xff
c0de8a14:	d026      	beq.n	c0de8a64 <pageModalCallback+0xb8>
c0de8a16:	4620      	mov	r0, r4
c0de8a18:	2100      	movs	r1, #0
c0de8a1a:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de8a1e:	f001 b88b 	b.w	c0de9b38 <displayDetailsPage>
c0de8a22:	4818      	ldr	r0, [pc, #96]	@ (c0de8a84 <pageModalCallback+0xd8>)
c0de8a24:	eb09 0100 	add.w	r1, r9, r0
c0de8a28:	f891 1068 	ldrb.w	r1, [r1, #104]	@ 0x68
c0de8a2c:	2902      	cmp	r1, #2
c0de8a2e:	d119      	bne.n	c0de8a64 <pageModalCallback+0xb8>
c0de8a30:	4448      	add	r0, r9
c0de8a32:	2101      	movs	r1, #1
c0de8a34:	f880 1068 	strb.w	r1, [r0, #104]	@ 0x68
c0de8a38:	6d80      	ldr	r0, [r0, #88]	@ 0x58
c0de8a3a:	6800      	ldr	r0, [r0, #0]
c0de8a3c:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de8a40:	f000 be44 	b.w	c0de96cc <displaySecurityReport>
c0de8a44:	2cff      	cmp	r4, #255	@ 0xff
c0de8a46:	d00d      	beq.n	c0de8a64 <pageModalCallback+0xb8>
c0de8a48:	4620      	mov	r0, r4
c0de8a4a:	2100      	movs	r1, #0
c0de8a4c:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de8a50:	f001 b92c 	b.w	c0de9cac <displayTagValueListModalPage>
c0de8a54:	b934      	cbnz	r4, c0de8a64 <pageModalCallback+0xb8>
c0de8a56:	20ff      	movs	r0, #255	@ 0xff
c0de8a58:	2101      	movs	r1, #1
c0de8a5a:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de8a5e:	f7ff ba59 	b.w	c0de7f14 <displayGenericContextPage>
c0de8a62:	b12c      	cbz	r4, c0de8a70 <pageModalCallback+0xc4>
c0de8a64:	f001 ff8d 	bl	c0dea982 <nbgl_screenRedraw>
c0de8a68:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de8a6c:	f001 bf61 	b.w	c0dea932 <nbgl_refresh>
c0de8a70:	eb09 0006 	add.w	r0, r9, r6
c0de8a74:	69c0      	ldr	r0, [r0, #28]
c0de8a76:	b120      	cbz	r0, c0de8a82 <pageModalCallback+0xd6>
c0de8a78:	4780      	blx	r0
c0de8a7a:	eb09 0006 	add.w	r0, r9, r6
c0de8a7e:	2100      	movs	r1, #0
c0de8a80:	61c1      	str	r1, [r0, #28]
c0de8a82:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de8a84:	0000197c 	.word	0x0000197c
c0de8a88:	00001cc4 	.word	0x00001cc4
c0de8a8c:	00001c48 	.word	0x00001c48

c0de8a90 <displayReviewPage>:
c0de8a90:	b570      	push	{r4, r5, r6, lr}
c0de8a92:	b090      	sub	sp, #64	@ 0x40
c0de8a94:	460c      	mov	r4, r1
c0de8a96:	4605      	mov	r5, r0
c0de8a98:	4668      	mov	r0, sp
c0de8a9a:	2140      	movs	r1, #64	@ 0x40
c0de8a9c:	f002 fb88 	bl	c0deb1b0 <__aeabi_memclr>
c0de8aa0:	4e24      	ldr	r6, [pc, #144]	@ (c0de8b34 <displayReviewPage+0xa4>)
c0de8aa2:	eb09 0006 	add.w	r0, r9, r6
c0de8aa6:	f890 0061 	ldrb.w	r0, [r0, #97]	@ 0x61
c0de8aaa:	b108      	cbz	r0, c0de8ab0 <displayReviewPage+0x20>
c0de8aac:	42a8      	cmp	r0, r5
c0de8aae:	d93f      	bls.n	c0de8b30 <displayReviewPage+0xa0>
c0de8ab0:	eb09 0006 	add.w	r0, r9, r6
c0de8ab4:	6882      	ldr	r2, [r0, #8]
c0de8ab6:	f880 5060 	strb.w	r5, [r0, #96]	@ 0x60
c0de8aba:	b3ca      	cbz	r2, c0de8b30 <displayReviewPage+0xa0>
c0de8abc:	4669      	mov	r1, sp
c0de8abe:	4628      	mov	r0, r5
c0de8ac0:	4790      	blx	r2
c0de8ac2:	b3a8      	cbz	r0, c0de8b30 <displayReviewPage+0xa0>
c0de8ac4:	2009      	movs	r0, #9
c0de8ac6:	2100      	movs	r1, #0
c0de8ac8:	f88d 0006 	strb.w	r0, [sp, #6]
c0de8acc:	f89d 000c 	ldrb.w	r0, [sp, #12]
c0de8ad0:	f88d 1004 	strb.w	r1, [sp, #4]
c0de8ad4:	9100      	str	r1, [sp, #0]
c0de8ad6:	2806      	cmp	r0, #6
c0de8ad8:	d00e      	beq.n	c0de8af8 <displayReviewPage+0x68>
c0de8ada:	2804      	cmp	r0, #4
c0de8adc:	d015      	beq.n	c0de8b0a <displayReviewPage+0x7a>
c0de8ade:	2805      	cmp	r0, #5
c0de8ae0:	d010      	beq.n	c0de8b04 <displayReviewPage+0x74>
c0de8ae2:	2802      	cmp	r0, #2
c0de8ae4:	d114      	bne.n	c0de8b10 <displayReviewPage+0x80>
c0de8ae6:	eb09 0006 	add.w	r0, r9, r6
c0de8aea:	f890 1060 	ldrb.w	r1, [r0, #96]	@ 0x60
c0de8aee:	3101      	adds	r1, #1
c0de8af0:	f880 1061 	strb.w	r1, [r0, #97]	@ 0x61
c0de8af4:	200b      	movs	r0, #11
c0de8af6:	e009      	b.n	c0de8b0c <displayReviewPage+0x7c>
c0de8af8:	200b      	movs	r0, #11
c0de8afa:	f88d 101c 	strb.w	r1, [sp, #28]
c0de8afe:	f88d 0038 	strb.w	r0, [sp, #56]	@ 0x38
c0de8b02:	e005      	b.n	c0de8b10 <displayReviewPage+0x80>
c0de8b04:	2009      	movs	r0, #9
c0de8b06:	f88d 001a 	strb.w	r0, [sp, #26]
c0de8b0a:	2000      	movs	r0, #0
c0de8b0c:	f88d 001c 	strb.w	r0, [sp, #28]
c0de8b10:	4809      	ldr	r0, [pc, #36]	@ (c0de8b38 <displayReviewPage+0xa8>)
c0de8b12:	eb09 0506 	add.w	r5, r9, r6
c0de8b16:	466a      	mov	r2, sp
c0de8b18:	f105 0160 	add.w	r1, r5, #96	@ 0x60
c0de8b1c:	4478      	add	r0, pc
c0de8b1e:	f7fe fe43 	bl	c0de77a8 <nbgl_pageDrawGenericContent>
c0de8b22:	6168      	str	r0, [r5, #20]
c0de8b24:	2001      	movs	r0, #1
c0de8b26:	2c00      	cmp	r4, #0
c0de8b28:	bf18      	it	ne
c0de8b2a:	2002      	movne	r0, #2
c0de8b2c:	f001 ff06 	bl	c0dea93c <nbgl_refreshSpecial>
c0de8b30:	b010      	add	sp, #64	@ 0x40
c0de8b32:	bd70      	pop	{r4, r5, r6, pc}
c0de8b34:	00001c48 	.word	0x00001c48
c0de8b38:	fffff989 	.word	0xfffff989

c0de8b3c <nbgl_useCaseReview>:
c0de8b3c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de8b3e:	b087      	sub	sp, #28
c0de8b40:	461c      	mov	r4, r3
c0de8b42:	f001 fa3d 	bl	c0de9fc0 <OUTLINED_FUNCTION_0>
c0de8b46:	2001      	movs	r0, #1
c0de8b48:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de8b4a:	462a      	mov	r2, r5
c0de8b4c:	4623      	mov	r3, r4
c0de8b4e:	9005      	str	r0, [sp, #20]
c0de8b50:	2000      	movs	r0, #0
c0de8b52:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de8b56:	9004      	str	r0, [sp, #16]
c0de8b58:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de8b5a:	4631      	mov	r1, r6
c0de8b5c:	f001 fa52 	bl	c0dea004 <OUTLINED_FUNCTION_7>
c0de8b60:	b007      	add	sp, #28
c0de8b62:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de8b64 <useCaseReview>:
c0de8b64:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de8b68:	4682      	mov	sl, r0
c0de8b6a:	4840      	ldr	r0, [pc, #256]	@ (c0de8c6c <useCaseReview+0x108>)
c0de8b6c:	4688      	mov	r8, r1
c0de8b6e:	2102      	movs	r1, #2
c0de8b70:	4614      	mov	r4, r2
c0de8b72:	f04f 0b00 	mov.w	fp, #0
c0de8b76:	4e40      	ldr	r6, [pc, #256]	@ (c0de8c78 <useCaseReview+0x114>)
c0de8b78:	461f      	mov	r7, r3
c0de8b7a:	f809 1000 	strb.w	r1, [r9, r0]
c0de8b7e:	493c      	ldr	r1, [pc, #240]	@ (c0de8c70 <useCaseReview+0x10c>)
c0de8b80:	4448      	add	r0, r9
c0de8b82:	eb09 0506 	add.w	r5, r9, r6
c0de8b86:	9a0d      	ldr	r2, [sp, #52]	@ 0x34
c0de8b88:	4449      	add	r1, r9
c0de8b8a:	e9c1 a208 	strd	sl, r2, [r1, #32]
c0de8b8e:	493b      	ldr	r1, [pc, #236]	@ (c0de8c7c <useCaseReview+0x118>)
c0de8b90:	f8c0 b010 	str.w	fp, [r0, #16]
c0de8b94:	4479      	add	r1, pc
c0de8b96:	6181      	str	r1, [r0, #24]
c0de8b98:	4836      	ldr	r0, [pc, #216]	@ (c0de8c74 <useCaseReview+0x110>)
c0de8b9a:	2103      	movs	r1, #3
c0de8b9c:	4448      	add	r0, r9
c0de8b9e:	7301      	strb	r1, [r0, #12]
c0de8ba0:	6085      	str	r5, [r0, #8]
c0de8ba2:	4628      	mov	r0, r5
c0de8ba4:	21a8      	movs	r1, #168	@ 0xa8
c0de8ba6:	f002 fb03 	bl	c0deb1b0 <__aeabi_memclr>
c0de8baa:	2001      	movs	r0, #1
c0de8bac:	f8a5 b024 	strh.w	fp, [r5, #36]	@ 0x24
c0de8bb0:	f809 0006 	strb.w	r0, [r9, r6]
c0de8bb4:	4832      	ldr	r0, [pc, #200]	@ (c0de8c80 <useCaseReview+0x11c>)
c0de8bb6:	4478      	add	r0, pc
c0de8bb8:	6228      	str	r0, [r5, #32]
c0de8bba:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de8bbc:	616f      	str	r7, [r5, #20]
c0de8bbe:	9401      	str	r4, [sp, #4]
c0de8bc0:	60ac      	str	r4, [r5, #8]
c0de8bc2:	f885 b004 	strb.w	fp, [r5, #4]
c0de8bc6:	61e8      	str	r0, [r5, #28]
c0de8bc8:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de8bca:	f001 f915 	bl	c0de9df8 <initWarningTipBox>
c0de8bce:	2004      	movs	r0, #4
c0de8bd0:	4641      	mov	r1, r8
c0de8bd2:	f885 0038 	strb.w	r0, [r5, #56]	@ 0x38
c0de8bd6:	f105 003c 	add.w	r0, r5, #60	@ 0x3c
c0de8bda:	e891 00dc 	ldmia.w	r1, {r2, r3, r4, r6, r7}
c0de8bde:	c0dc      	stmia	r0!, {r2, r3, r4, r6, r7}
c0de8be0:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de8be4:	66e8      	str	r0, [r5, #108]	@ 0x6c
c0de8be6:	e9dd 050e 	ldrd	r0, r5, [sp, #56]	@ 0x38
c0de8bea:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
c0de8bec:	b190      	cbz	r0, c0de8c14 <useCaseReview+0xb0>
c0de8bee:	4922      	ldr	r1, [pc, #136]	@ (c0de8c78 <useCaseReview+0x114>)
c0de8bf0:	2203      	movs	r2, #3
c0de8bf2:	eb09 0001 	add.w	r0, r9, r1
c0de8bf6:	f880 2070 	strb.w	r2, [r0, #112]	@ 0x70
c0de8bfa:	9a01      	ldr	r2, [sp, #4]
c0de8bfc:	b343      	cbz	r3, c0de8c50 <useCaseReview+0xec>
c0de8bfe:	eb09 0001 	add.w	r0, r9, r1
c0de8c02:	210b      	movs	r1, #11
c0de8c04:	f880 1080 	strb.w	r1, [r0, #128]	@ 0x80
c0de8c08:	4921      	ldr	r1, [pc, #132]	@ (c0de8c90 <useCaseReview+0x12c>)
c0de8c0a:	e9c0 321d 	strd	r3, r2, [r0, #116]	@ 0x74
c0de8c0e:	4479      	add	r1, pc
c0de8c10:	67c1      	str	r1, [r0, #124]	@ 0x7c
c0de8c12:	e00a      	b.n	c0de8c2a <useCaseReview+0xc6>
c0de8c14:	4818      	ldr	r0, [pc, #96]	@ (c0de8c78 <useCaseReview+0x114>)
c0de8c16:	2102      	movs	r1, #2
c0de8c18:	9a01      	ldr	r2, [sp, #4]
c0de8c1a:	4448      	add	r0, r9
c0de8c1c:	f880 1070 	strb.w	r1, [r0, #112]	@ 0x70
c0de8c20:	f100 0174 	add.w	r1, r0, #116	@ 0x74
c0de8c24:	4650      	mov	r0, sl
c0de8c26:	f000 fa07 	bl	c0de9038 <prepareReviewLastPage>
c0de8c2a:	f3ca 1000 	ubfx	r0, sl, #4, #1
c0de8c2e:	f7ff f8b7 	bl	c0de7da0 <getNbPagesForGenericContents>
c0de8c32:	4a18      	ldr	r2, [pc, #96]	@ (c0de8c94 <useCaseReview+0x130>)
c0de8c34:	4601      	mov	r1, r0
c0de8c36:	2001      	movs	r0, #1
c0de8c38:	447a      	add	r2, pc
c0de8c3a:	f7fe ffe9 	bl	c0de7c10 <prepareNavInfo>
c0de8c3e:	b10d      	cbz	r5, c0de8c44 <useCaseReview+0xe0>
c0de8c40:	f001 f9dd 	bl	c0de9ffe <OUTLINED_FUNCTION_6>
c0de8c44:	2000      	movs	r0, #0
c0de8c46:	2101      	movs	r1, #1
c0de8c48:	e8bd 4dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de8c4c:	f7ff b962 	b.w	c0de7f14 <displayGenericContextPage>
c0de8c50:	f01a 0007 	ands.w	r0, sl, #7
c0de8c54:	d004      	beq.n	c0de8c60 <useCaseReview+0xfc>
c0de8c56:	2801      	cmp	r0, #1
c0de8c58:	d105      	bne.n	c0de8c66 <useCaseReview+0x102>
c0de8c5a:	4b0b      	ldr	r3, [pc, #44]	@ (c0de8c88 <useCaseReview+0x124>)
c0de8c5c:	447b      	add	r3, pc
c0de8c5e:	e7ce      	b.n	c0de8bfe <useCaseReview+0x9a>
c0de8c60:	4b08      	ldr	r3, [pc, #32]	@ (c0de8c84 <useCaseReview+0x120>)
c0de8c62:	447b      	add	r3, pc
c0de8c64:	e7cb      	b.n	c0de8bfe <useCaseReview+0x9a>
c0de8c66:	4b09      	ldr	r3, [pc, #36]	@ (c0de8c8c <useCaseReview+0x128>)
c0de8c68:	447b      	add	r3, pc
c0de8c6a:	e7c8      	b.n	c0de8bfe <useCaseReview+0x9a>
c0de8c6c:	00001c48 	.word	0x00001c48
c0de8c70:	00001cc4 	.word	0x00001cc4
c0de8c74:	0000197c 	.word	0x0000197c
c0de8c78:	000019e8 	.word	0x000019e8
c0de8c7c:	0000123d 	.word	0x0000123d
c0de8c80:	000043c7 	.word	0x000043c7
c0de8c84:	00003d08 	.word	0x00003d08
c0de8c88:	00003cdd 	.word	0x00003cdd
c0de8c8c:	00004250 	.word	0x00004250
c0de8c90:	00003afe 	.word	0x00003afe
c0de8c94:	00003b18 	.word	0x00003b18

c0de8c98 <nbgl_useCaseReviewBlindSigning>:
c0de8c98:	b510      	push	{r4, lr}
c0de8c9a:	b086      	sub	sp, #24
c0de8c9c:	9c0b      	ldr	r4, [sp, #44]	@ 0x2c
c0de8c9e:	9404      	str	r4, [sp, #16]
c0de8ca0:	4c06      	ldr	r4, [pc, #24]	@ (c0de8cbc <nbgl_useCaseReviewBlindSigning+0x24>)
c0de8ca2:	447c      	add	r4, pc
c0de8ca4:	9403      	str	r4, [sp, #12]
c0de8ca6:	9c0a      	ldr	r4, [sp, #40]	@ 0x28
c0de8ca8:	9402      	str	r4, [sp, #8]
c0de8caa:	9c09      	ldr	r4, [sp, #36]	@ 0x24
c0de8cac:	9401      	str	r4, [sp, #4]
c0de8cae:	9c08      	ldr	r4, [sp, #32]
c0de8cb0:	9400      	str	r4, [sp, #0]
c0de8cb2:	f000 f805 	bl	c0de8cc0 <nbgl_useCaseAdvancedReview>
c0de8cb6:	b006      	add	sp, #24
c0de8cb8:	bd10      	pop	{r4, pc}
c0de8cba:	bf00      	nop
c0de8cbc:	000057b2 	.word	0x000057b2

c0de8cc0 <nbgl_useCaseAdvancedReview>:
c0de8cc0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8cc4:	b088      	sub	sp, #32
c0de8cc6:	e9cd 2306 	strd	r2, r3, [sp, #24]
c0de8cca:	460e      	mov	r6, r1
c0de8ccc:	4605      	mov	r5, r0
c0de8cce:	f7fe ff89 	bl	c0de7be4 <reset_callbacks_and_context>
c0de8cd2:	f10d 0b48 	add.w	fp, sp, #72	@ 0x48
c0de8cd6:	482b      	ldr	r0, [pc, #172]	@ (c0de8d84 <nbgl_useCaseAdvancedReview+0xc4>)
c0de8cd8:	e9dd 4810 	ldrd	r4, r8, [sp, #64]	@ 0x40
c0de8cdc:	e89b 0c80 	ldmia.w	fp, {r7, sl, fp}
c0de8ce0:	4448      	add	r0, r9
c0de8ce2:	b127      	cbz	r7, c0de8cee <nbgl_useCaseAdvancedReview+0x2e>
c0de8ce4:	4639      	mov	r1, r7
c0de8ce6:	2220      	movs	r2, #32
c0de8ce8:	f002 fa58 	bl	c0deb19c <__aeabi_memcpy>
c0de8cec:	e002      	b.n	c0de8cf4 <nbgl_useCaseAdvancedReview+0x34>
c0de8cee:	2120      	movs	r1, #32
c0de8cf0:	f002 fa5e 	bl	c0deb1b0 <__aeabi_memclr>
c0de8cf4:	f1ba 0f00 	cmp.w	sl, #0
c0de8cf8:	d028      	beq.n	c0de8d4c <nbgl_useCaseAdvancedReview+0x8c>
c0de8cfa:	f8da 0000 	ldr.w	r0, [sl]
c0de8cfe:	b928      	cbnz	r0, c0de8d0c <nbgl_useCaseAdvancedReview+0x4c>
c0de8d00:	f8da 1014 	ldr.w	r1, [sl, #20]
c0de8d04:	b911      	cbnz	r1, c0de8d0c <nbgl_useCaseAdvancedReview+0x4c>
c0de8d06:	f8da 1018 	ldr.w	r1, [sl, #24]
c0de8d0a:	b1f9      	cbz	r1, c0de8d4c <nbgl_useCaseAdvancedReview+0x8c>
c0de8d0c:	491e      	ldr	r1, [pc, #120]	@ (c0de8d88 <nbgl_useCaseAdvancedReview+0xc8>)
c0de8d0e:	2200      	movs	r2, #0
c0de8d10:	4449      	add	r1, r9
c0de8d12:	f881 203c 	strb.w	r2, [r1, #60]	@ 0x3c
c0de8d16:	2240      	movs	r2, #64	@ 0x40
c0de8d18:	2808      	cmp	r0, #8
c0de8d1a:	bf08      	it	eq
c0de8d1c:	2280      	moveq	r2, #128	@ 0x80
c0de8d1e:	ea42 0005 	orr.w	r0, r2, r5
c0de8d22:	9d06      	ldr	r5, [sp, #24]
c0de8d24:	9b07      	ldr	r3, [sp, #28]
c0de8d26:	e9c1 0610 	strd	r0, r6, [r1, #64]	@ 0x40
c0de8d2a:	648d      	str	r5, [r1, #72]	@ 0x48
c0de8d2c:	314c      	adds	r1, #76	@ 0x4c
c0de8d2e:	e881 0d18 	stmia.w	r1, {r3, r4, r8, sl, fp}
c0de8d32:	f89a 1000 	ldrb.w	r1, [sl]
c0de8d36:	f011 0f16 	tst.w	r1, #22
c0de8d3a:	d102      	bne.n	c0de8d42 <nbgl_useCaseAdvancedReview+0x82>
c0de8d3c:	f8da 1014 	ldr.w	r1, [sl, #20]
c0de8d40:	b1a9      	cbz	r1, c0de8d6e <nbgl_useCaseAdvancedReview+0xae>
c0de8d42:	b008      	add	sp, #32
c0de8d44:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8d48:	f000 b820 	b.w	c0de8d8c <displayInitialWarning>
c0de8d4c:	2001      	movs	r0, #1
c0de8d4e:	2100      	movs	r1, #0
c0de8d50:	e9cd 4800 	strd	r4, r8, [sp]
c0de8d54:	e9cd 7b02 	strd	r7, fp, [sp, #8]
c0de8d58:	e9cd 1004 	strd	r1, r0, [sp, #16]
c0de8d5c:	4628      	mov	r0, r5
c0de8d5e:	4631      	mov	r1, r6
c0de8d60:	e9dd 2306 	ldrd	r2, r3, [sp, #24]
c0de8d64:	f7ff fefe 	bl	c0de8b64 <useCaseReview>
c0de8d68:	b008      	add	sp, #32
c0de8d6a:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de8d6e:	2101      	movs	r1, #1
c0de8d70:	2200      	movs	r2, #0
c0de8d72:	e9cd 4800 	strd	r4, r8, [sp]
c0de8d76:	e9cd 7b02 	strd	r7, fp, [sp, #8]
c0de8d7a:	e9cd 2104 	strd	r2, r1, [sp, #16]
c0de8d7e:	4631      	mov	r1, r6
c0de8d80:	462a      	mov	r2, r5
c0de8d82:	e7ef      	b.n	c0de8d64 <nbgl_useCaseAdvancedReview+0xa4>
c0de8d84:	00001cc4 	.word	0x00001cc4
c0de8d88:	0000197c 	.word	0x0000197c

c0de8d8c <displayInitialWarning>:
c0de8d8c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de8d8e:	b099      	sub	sp, #100	@ 0x64
c0de8d90:	4857      	ldr	r0, [pc, #348]	@ (c0de8ef0 <displayInitialWarning+0x164>)
c0de8d92:	a90e      	add	r1, sp, #56	@ 0x38
c0de8d94:	4478      	add	r0, pc
c0de8d96:	e890 003c 	ldmia.w	r0, {r2, r3, r4, r5}
c0de8d9a:	c13c      	stmia	r1!, {r2, r3, r4, r5}
c0de8d9c:	4855      	ldr	r0, [pc, #340]	@ (c0de8ef4 <displayInitialWarning+0x168>)
c0de8d9e:	ac0a      	add	r4, sp, #40	@ 0x28
c0de8da0:	4621      	mov	r1, r4
c0de8da2:	4478      	add	r0, pc
c0de8da4:	e890 006c 	ldmia.w	r0, {r2, r3, r5, r6}
c0de8da8:	c16c      	stmia	r1!, {r2, r3, r5, r6}
c0de8daa:	4d4f      	ldr	r5, [pc, #316]	@ (c0de8ee8 <displayInitialWarning+0x15c>)
c0de8dac:	eb09 0705 	add.w	r7, r9, r5
c0de8db0:	6db8      	ldr	r0, [r7, #88]	@ 0x58
c0de8db2:	6806      	ldr	r6, [r0, #0]
c0de8db4:	2001      	movs	r0, #1
c0de8db6:	f887 0069 	strb.w	r0, [r7, #105]	@ 0x69
c0de8dba:	484f      	ldr	r0, [pc, #316]	@ (c0de8ef8 <displayInitialWarning+0x16c>)
c0de8dbc:	4478      	add	r0, pc
c0de8dbe:	9015      	str	r0, [sp, #84]	@ 0x54
c0de8dc0:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0de8dc4:	f8ad 0048 	strh.w	r0, [sp, #72]	@ 0x48
c0de8dc8:	2000      	movs	r0, #0
c0de8dca:	9016      	str	r0, [sp, #88]	@ 0x58
c0de8dcc:	9013      	str	r0, [sp, #76]	@ 0x4c
c0de8dce:	a812      	add	r0, sp, #72	@ 0x48
c0de8dd0:	f7fa f9ba 	bl	c0de3148 <nbgl_layoutGet>
c0de8dd4:	4621      	mov	r1, r4
c0de8dd6:	6638      	str	r0, [r7, #96]	@ 0x60
c0de8dd8:	f7fc ff4e 	bl	c0de5c78 <nbgl_layoutAddHeader>
c0de8ddc:	6db8      	ldr	r0, [r7, #88]	@ 0x58
c0de8dde:	f026 0409 	bic.w	r4, r6, #9
c0de8de2:	6801      	ldr	r1, [r0, #0]
c0de8de4:	b139      	cbz	r1, c0de8df6 <displayInitialWarning+0x6a>
c0de8de6:	4845      	ldr	r0, [pc, #276]	@ (c0de8efc <displayInitialWarning+0x170>)
c0de8de8:	4945      	ldr	r1, [pc, #276]	@ (c0de8f00 <displayInitialWarning+0x174>)
c0de8dea:	2c10      	cmp	r4, #16
c0de8dec:	4479      	add	r1, pc
c0de8dee:	4478      	add	r0, pc
c0de8df0:	bf08      	it	eq
c0de8df2:	4601      	moveq	r1, r0
c0de8df4:	e001      	b.n	c0de8dfa <displayInitialWarning+0x6e>
c0de8df6:	6a01      	ldr	r1, [r0, #32]
c0de8df8:	b131      	cbz	r1, c0de8e08 <displayInitialWarning+0x7c>
c0de8dfa:	eb09 0005 	add.w	r0, r9, r5
c0de8dfe:	2211      	movs	r2, #17
c0de8e00:	2309      	movs	r3, #9
c0de8e02:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0de8e04:	f7fa ff68 	bl	c0de3cd8 <nbgl_layoutAddTopRightButton>
c0de8e08:	eb09 0005 	add.w	r0, r9, r5
c0de8e0c:	6d87      	ldr	r7, [r0, #88]	@ 0x58
c0de8e0e:	6838      	ldr	r0, [r7, #0]
c0de8e10:	b188      	cbz	r0, c0de8e36 <displayInitialWarning+0xaa>
c0de8e12:	a801      	add	r0, sp, #4
c0de8e14:	2124      	movs	r1, #36	@ 0x24
c0de8e16:	f002 f9cb 	bl	c0deb1b0 <__aeabi_memclr>
c0de8e1a:	483a      	ldr	r0, [pc, #232]	@ (c0de8f04 <displayInitialWarning+0x178>)
c0de8e1c:	2c10      	cmp	r4, #16
c0de8e1e:	4478      	add	r0, pc
c0de8e20:	9002      	str	r0, [sp, #8]
c0de8e22:	d111      	bne.n	c0de8e48 <displayInitialWarning+0xbc>
c0de8e24:	4840      	ldr	r0, [pc, #256]	@ (c0de8f28 <displayInitialWarning+0x19c>)
c0de8e26:	2405      	movs	r4, #5
c0de8e28:	4478      	add	r0, pc
c0de8e2a:	9005      	str	r0, [sp, #20]
c0de8e2c:	493f      	ldr	r1, [pc, #252]	@ (c0de8f2c <displayInitialWarning+0x1a0>)
c0de8e2e:	4840      	ldr	r0, [pc, #256]	@ (c0de8f30 <displayInitialWarning+0x1a4>)
c0de8e30:	4479      	add	r1, pc
c0de8e32:	4478      	add	r0, pc
c0de8e34:	e03d      	b.n	c0de8eb2 <displayInitialWarning+0x126>
c0de8e36:	69f9      	ldr	r1, [r7, #28]
c0de8e38:	b351      	cbz	r1, c0de8e90 <displayInitialWarning+0x104>
c0de8e3a:	eb09 0005 	add.w	r0, r9, r5
c0de8e3e:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0de8e40:	f7fc fab6 	bl	c0de53b0 <nbgl_layoutAddContentCenter>
c0de8e44:	2408      	movs	r4, #8
c0de8e46:	e03c      	b.n	c0de8ec2 <displayInitialWarning+0x136>
c0de8e48:	4828      	ldr	r0, [pc, #160]	@ (c0de8eec <displayInitialWarning+0x160>)
c0de8e4a:	4448      	add	r0, r9
c0de8e4c:	9006      	str	r0, [sp, #24]
c0de8e4e:	68f9      	ldr	r1, [r7, #12]
c0de8e50:	4b2d      	ldr	r3, [pc, #180]	@ (c0de8f08 <displayInitialWarning+0x17c>)
c0de8e52:	447b      	add	r3, pc
c0de8e54:	2900      	cmp	r1, #0
c0de8e56:	bf18      	it	ne
c0de8e58:	460b      	movne	r3, r1
c0de8e5a:	4a2c      	ldr	r2, [pc, #176]	@ (c0de8f0c <displayInitialWarning+0x180>)
c0de8e5c:	2180      	movs	r1, #128	@ 0x80
c0de8e5e:	447a      	add	r2, pc
c0de8e60:	f001 fdf2 	bl	c0deaa48 <snprintf>
c0de8e64:	07b0      	lsls	r0, r6, #30
c0de8e66:	d403      	bmi.n	c0de8e70 <displayInitialWarning+0xe4>
c0de8e68:	0770      	lsls	r0, r6, #29
c0de8e6a:	d413      	bmi.n	c0de8e94 <displayInitialWarning+0x108>
c0de8e6c:	2400      	movs	r4, #0
c0de8e6e:	e022      	b.n	c0de8eb6 <displayInitialWarning+0x12a>
c0de8e70:	4827      	ldr	r0, [pc, #156]	@ (c0de8f10 <displayInitialWarning+0x184>)
c0de8e72:	4478      	add	r0, pc
c0de8e74:	9005      	str	r0, [sp, #20]
c0de8e76:	eb09 0005 	add.w	r0, r9, r5
c0de8e7a:	6d80      	ldr	r0, [r0, #88]	@ 0x58
c0de8e7c:	6901      	ldr	r1, [r0, #16]
c0de8e7e:	4825      	ldr	r0, [pc, #148]	@ (c0de8f14 <displayInitialWarning+0x188>)
c0de8e80:	4478      	add	r0, pc
c0de8e82:	2900      	cmp	r1, #0
c0de8e84:	bf18      	it	ne
c0de8e86:	4608      	movne	r0, r1
c0de8e88:	4923      	ldr	r1, [pc, #140]	@ (c0de8f18 <displayInitialWarning+0x18c>)
c0de8e8a:	2405      	movs	r4, #5
c0de8e8c:	4479      	add	r1, pc
c0de8e8e:	e010      	b.n	c0de8eb2 <displayInitialWarning+0x126>
c0de8e90:	2400      	movs	r4, #0
c0de8e92:	e016      	b.n	c0de8ec2 <displayInitialWarning+0x136>
c0de8e94:	4821      	ldr	r0, [pc, #132]	@ (c0de8f1c <displayInitialWarning+0x190>)
c0de8e96:	4478      	add	r0, pc
c0de8e98:	9005      	str	r0, [sp, #20]
c0de8e9a:	eb09 0005 	add.w	r0, r9, r5
c0de8e9e:	6d80      	ldr	r0, [r0, #88]	@ 0x58
c0de8ea0:	6901      	ldr	r1, [r0, #16]
c0de8ea2:	481f      	ldr	r0, [pc, #124]	@ (c0de8f20 <displayInitialWarning+0x194>)
c0de8ea4:	4478      	add	r0, pc
c0de8ea6:	2900      	cmp	r1, #0
c0de8ea8:	bf18      	it	ne
c0de8eaa:	4608      	movne	r0, r1
c0de8eac:	491d      	ldr	r1, [pc, #116]	@ (c0de8f24 <displayInitialWarning+0x198>)
c0de8eae:	2404      	movs	r4, #4
c0de8eb0:	4479      	add	r1, pc
c0de8eb2:	910f      	str	r1, [sp, #60]	@ 0x3c
c0de8eb4:	9007      	str	r0, [sp, #28]
c0de8eb6:	eb09 0005 	add.w	r0, r9, r5
c0de8eba:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0de8ebc:	a901      	add	r1, sp, #4
c0de8ebe:	f7fc fa77 	bl	c0de53b0 <nbgl_layoutAddContentCenter>
c0de8ec2:	eb09 0005 	add.w	r0, r9, r5
c0de8ec6:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0de8ec8:	a90e      	add	r1, sp, #56	@ 0x38
c0de8eca:	f7fc fbed 	bl	c0de56a8 <nbgl_layoutAddChoiceButtons>
c0de8ece:	b114      	cbz	r4, c0de8ed6 <displayInitialWarning+0x14a>
c0de8ed0:	4620      	mov	r0, r4
c0de8ed2:	f7f9 ff32 	bl	c0de2d3a <os_io_seph_cmd_piezo_play_tune>
c0de8ed6:	eb09 0005 	add.w	r0, r9, r5
c0de8eda:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0de8edc:	f7fd fb2e 	bl	c0de653c <nbgl_layoutDraw>
c0de8ee0:	f001 fd27 	bl	c0dea932 <nbgl_refresh>
c0de8ee4:	b019      	add	sp, #100	@ 0x64
c0de8ee6:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de8ee8:	0000197c 	.word	0x0000197c
c0de8eec:	00001ac8 	.word	0x00001ac8
c0de8ef0:	00005810 	.word	0x00005810
c0de8ef4:	0000572e 	.word	0x0000572e
c0de8ef8:	00001155 	.word	0x00001155
c0de8efc:	000032b8 	.word	0x000032b8
c0de8f00:	00003603 	.word	0x00003603
c0de8f04:	00002f31 	.word	0x00002f31
c0de8f08:	00003cdf 	.word	0x00003cdf
c0de8f0c:	00004072 	.word	0x00004072
c0de8f10:	000040d0 	.word	0x000040d0
c0de8f14:	0000391d 	.word	0x0000391d
c0de8f18:	00003d39 	.word	0x00003d39
c0de8f1c:	00003d1f 	.word	0x00003d1f
c0de8f20:	00003cbd 	.word	0x00003cbd
c0de8f24:	00003b99 	.word	0x00003b99
c0de8f28:	00003e85 	.word	0x00003e85
c0de8f2c:	00004134 	.word	0x00004134
c0de8f30:	00003dac 	.word	0x00003dac

c0de8f34 <useCaseReviewStreamingStart>:
c0de8f34:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de8f38:	4604      	mov	r4, r0
c0de8f3a:	4826      	ldr	r0, [pc, #152]	@ (c0de8fd4 <useCaseReviewStreamingStart+0xa0>)
c0de8f3c:	460d      	mov	r5, r1
c0de8f3e:	2103      	movs	r1, #3
c0de8f40:	e9cd 3200 	strd	r3, r2, [sp]
c0de8f44:	f8df b098 	ldr.w	fp, [pc, #152]	@ c0de8fe0 <useCaseReviewStreamingStart+0xac>
c0de8f48:	f04f 0a01 	mov.w	sl, #1
c0de8f4c:	f809 1000 	strb.w	r1, [r9, r0]
c0de8f50:	4921      	ldr	r1, [pc, #132]	@ (c0de8fd8 <useCaseReviewStreamingStart+0xa4>)
c0de8f52:	eb09 0700 	add.w	r7, r9, r0
c0de8f56:	eb09 060b 	add.w	r6, r9, fp
c0de8f5a:	eb09 0801 	add.w	r8, r9, r1
c0de8f5e:	f8c8 502c 	str.w	r5, [r8, #44]	@ 0x2c
c0de8f62:	990a      	ldr	r1, [sp, #40]	@ 0x28
c0de8f64:	e9c8 4108 	strd	r4, r1, [r8, #32]
c0de8f68:	2138      	movs	r1, #56	@ 0x38
c0de8f6a:	481e      	ldr	r0, [pc, #120]	@ (c0de8fe4 <useCaseReviewStreamingStart+0xb0>)
c0de8f6c:	4478      	add	r0, pc
c0de8f6e:	61b8      	str	r0, [r7, #24]
c0de8f70:	2000      	movs	r0, #0
c0de8f72:	6138      	str	r0, [r7, #16]
c0de8f74:	4819      	ldr	r0, [pc, #100]	@ (c0de8fdc <useCaseReviewStreamingStart+0xa8>)
c0de8f76:	4448      	add	r0, r9
c0de8f78:	f880 a00c 	strb.w	sl, [r0, #12]
c0de8f7c:	6086      	str	r6, [r0, #8]
c0de8f7e:	f001 f855 	bl	c0dea02c <OUTLINED_FUNCTION_13>
c0de8f82:	2100      	movs	r1, #0
c0de8f84:	f809 a00b 	strb.w	sl, [r9, fp]
c0de8f88:	84b1      	strh	r1, [r6, #36]	@ 0x24
c0de8f8a:	4817      	ldr	r0, [pc, #92]	@ (c0de8fe8 <useCaseReviewStreamingStart+0xb4>)
c0de8f8c:	9a00      	ldr	r2, [sp, #0]
c0de8f8e:	60b5      	str	r5, [r6, #8]
c0de8f90:	7131      	strb	r1, [r6, #4]
c0de8f92:	2500      	movs	r5, #0
c0de8f94:	4478      	add	r0, pc
c0de8f96:	e9c6 2007 	strd	r2, r0, [r6, #28]
c0de8f9a:	9801      	ldr	r0, [sp, #4]
c0de8f9c:	6170      	str	r0, [r6, #20]
c0de8f9e:	2000      	movs	r0, #0
c0de8fa0:	f000 ff2a 	bl	c0de9df8 <initWarningTipBox>
c0de8fa4:	f3c4 1000 	ubfx	r0, r4, #4, #1
c0de8fa8:	f7fe fefa 	bl	c0de7da0 <getNbPagesForGenericContents>
c0de8fac:	f888 0030 	strb.w	r0, [r8, #48]	@ 0x30
c0de8fb0:	2001      	movs	r0, #1
c0de8fb2:	21ff      	movs	r1, #255	@ 0xff
c0de8fb4:	4a0d      	ldr	r2, [pc, #52]	@ (c0de8fec <useCaseReviewStreamingStart+0xb8>)
c0de8fb6:	447a      	add	r2, pc
c0de8fb8:	f7fe fe2a 	bl	c0de7c10 <prepareNavInfo>
c0de8fbc:	f887 5071 	strb.w	r5, [r7, #113]	@ 0x71
c0de8fc0:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de8fc2:	b108      	cbz	r0, c0de8fc8 <useCaseReviewStreamingStart+0x94>
c0de8fc4:	f001 f81b 	bl	c0de9ffe <OUTLINED_FUNCTION_6>
c0de8fc8:	2000      	movs	r0, #0
c0de8fca:	2101      	movs	r1, #1
c0de8fcc:	e8bd 4dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de8fd0:	f7fe bfa0 	b.w	c0de7f14 <displayGenericContextPage>
c0de8fd4:	00001c48 	.word	0x00001c48
c0de8fd8:	00001cc4 	.word	0x00001cc4
c0de8fdc:	0000197c 	.word	0x0000197c
c0de8fe0:	000019e8 	.word	0x000019e8
c0de8fe4:	00000081 	.word	0x00000081
c0de8fe8:	00003fe9 	.word	0x00003fe9
c0de8fec:	0000379a 	.word	0x0000379a

c0de8ff0 <bundleNavReviewStreamingChoice>:
c0de8ff0:	b580      	push	{r7, lr}
c0de8ff2:	b178      	cbz	r0, c0de9014 <bundleNavReviewStreamingChoice+0x24>
c0de8ff4:	480d      	ldr	r0, [pc, #52]	@ (c0de902c <bundleNavReviewStreamingChoice+0x3c>)
c0de8ff6:	f819 0000 	ldrb.w	r0, [r9, r0]
c0de8ffa:	2802      	cmp	r0, #2
c0de8ffc:	d003      	beq.n	c0de9006 <bundleNavReviewStreamingChoice+0x16>
c0de8ffe:	480c      	ldr	r0, [pc, #48]	@ (c0de9030 <bundleNavReviewStreamingChoice+0x40>)
c0de9000:	4478      	add	r0, pc
c0de9002:	f000 f955 	bl	c0de92b0 <nbgl_useCaseSpinner>
c0de9006:	4808      	ldr	r0, [pc, #32]	@ (c0de9028 <bundleNavReviewStreamingChoice+0x38>)
c0de9008:	4448      	add	r0, r9
c0de900a:	6a41      	ldr	r1, [r0, #36]	@ 0x24
c0de900c:	2001      	movs	r0, #1
c0de900e:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de9012:	4708      	bx	r1
c0de9014:	4804      	ldr	r0, [pc, #16]	@ (c0de9028 <bundleNavReviewStreamingChoice+0x38>)
c0de9016:	4448      	add	r0, r9
c0de9018:	6a00      	ldr	r0, [r0, #32]
c0de901a:	4906      	ldr	r1, [pc, #24]	@ (c0de9034 <bundleNavReviewStreamingChoice+0x44>)
c0de901c:	4479      	add	r1, pc
c0de901e:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de9022:	f000 bf47 	b.w	c0de9eb4 <bundleNavReviewAskRejectionConfirmation>
c0de9026:	bf00      	nop
c0de9028:	00001cc4 	.word	0x00001cc4
c0de902c:	000019e8 	.word	0x000019e8
c0de9030:	00003714 	.word	0x00003714
c0de9034:	00000f95 	.word	0x00000f95

c0de9038 <prepareReviewLastPage>:
c0de9038:	b13b      	cbz	r3, c0de904a <prepareReviewLastPage+0x12>
c0de903a:	200b      	movs	r0, #11
c0de903c:	7308      	strb	r0, [r1, #12]
c0de903e:	480d      	ldr	r0, [pc, #52]	@ (c0de9074 <prepareReviewLastPage+0x3c>)
c0de9040:	e9c1 3200 	strd	r3, r2, [r1]
c0de9044:	4478      	add	r0, pc
c0de9046:	6088      	str	r0, [r1, #8]
c0de9048:	4770      	bx	lr
c0de904a:	f010 0007 	ands.w	r0, r0, #7
c0de904e:	d004      	beq.n	c0de905a <prepareReviewLastPage+0x22>
c0de9050:	2801      	cmp	r0, #1
c0de9052:	d105      	bne.n	c0de9060 <prepareReviewLastPage+0x28>
c0de9054:	4b05      	ldr	r3, [pc, #20]	@ (c0de906c <prepareReviewLastPage+0x34>)
c0de9056:	447b      	add	r3, pc
c0de9058:	e7ef      	b.n	c0de903a <prepareReviewLastPage+0x2>
c0de905a:	4b03      	ldr	r3, [pc, #12]	@ (c0de9068 <prepareReviewLastPage+0x30>)
c0de905c:	447b      	add	r3, pc
c0de905e:	e7ec      	b.n	c0de903a <prepareReviewLastPage+0x2>
c0de9060:	4b03      	ldr	r3, [pc, #12]	@ (c0de9070 <prepareReviewLastPage+0x38>)
c0de9062:	447b      	add	r3, pc
c0de9064:	e7e9      	b.n	c0de903a <prepareReviewLastPage+0x2>
c0de9066:	bf00      	nop
c0de9068:	0000390e 	.word	0x0000390e
c0de906c:	000038e3 	.word	0x000038e3
c0de9070:	00003e56 	.word	0x00003e56
c0de9074:	000036ec 	.word	0x000036ec

c0de9078 <prepareAddressConfirmationPages>:
c0de9078:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de907c:	b08a      	sub	sp, #40	@ 0x28
c0de907e:	4688      	mov	r8, r1
c0de9080:	4950      	ldr	r1, [pc, #320]	@ (c0de91c4 <prepareAddressConfirmationPages+0x14c>)
c0de9082:	f8df a13c 	ldr.w	sl, [pc, #316]	@ c0de91c0 <prepareAddressConfirmationPages+0x148>
c0de9086:	4693      	mov	fp, r2
c0de9088:	4479      	add	r1, pc
c0de908a:	f849 100a 	str.w	r1, [r9, sl]
c0de908e:	494e      	ldr	r1, [pc, #312]	@ (c0de91c8 <prepareAddressConfirmationPages+0x150>)
c0de9090:	4479      	add	r1, pc
c0de9092:	6191      	str	r1, [r2, #24]
c0de9094:	2106      	movs	r1, #6
c0de9096:	7011      	strb	r1, [r2, #0]
c0de9098:	2201      	movs	r2, #1
c0de909a:	eb09 010a 	add.w	r1, r9, sl
c0de909e:	f1b8 0f00 	cmp.w	r8, #0
c0de90a2:	f881 2034 	strb.w	r2, [r1, #52]	@ 0x34
c0de90a6:	6048      	str	r0, [r1, #4]
c0de90a8:	d01f      	beq.n	c0de90ea <prepareAddressConfirmationPages+0x72>
c0de90aa:	f898 2008 	ldrb.w	r2, [r8, #8]
c0de90ae:	2a02      	cmp	r2, #2
c0de90b0:	d81b      	bhi.n	c0de90ea <prepareAddressConfirmationPages+0x72>
c0de90b2:	2001      	movs	r0, #1
c0de90b4:	2100      	movs	r1, #0
c0de90b6:	f04f 0c00 	mov.w	ip, #0
c0de90ba:	9303      	str	r3, [sp, #12]
c0de90bc:	4594      	cmp	ip, r2
c0de90be:	d219      	bcs.n	c0de90f4 <prepareAddressConfirmationPages+0x7c>
c0de90c0:	f8d8 0000 	ldr.w	r0, [r8]
c0de90c4:	eb09 030a 	add.w	r3, r9, sl
c0de90c8:	f10c 0c01 	add.w	ip, ip, #1
c0de90cc:	185c      	adds	r4, r3, r1
c0de90ce:	4408      	add	r0, r1
c0de90d0:	3410      	adds	r4, #16
c0de90d2:	3110      	adds	r1, #16
c0de90d4:	e890 00e4 	ldmia.w	r0, {r2, r5, r6, r7}
c0de90d8:	c4e4      	stmia	r4!, {r2, r5, r6, r7}
c0de90da:	f893 0034 	ldrb.w	r0, [r3, #52]	@ 0x34
c0de90de:	3001      	adds	r0, #1
c0de90e0:	f883 0034 	strb.w	r0, [r3, #52]	@ 0x34
c0de90e4:	f898 2008 	ldrb.w	r2, [r8, #8]
c0de90e8:	e7e8      	b.n	c0de90bc <prepareAddressConfirmationPages+0x44>
c0de90ea:	2000      	movs	r0, #0
c0de90ec:	f8cb 001c 	str.w	r0, [fp, #28]
c0de90f0:	2001      	movs	r0, #1
c0de90f2:	e01c      	b.n	c0de912e <prepareAddressConfirmationPages+0xb6>
c0de90f4:	46c4      	mov	ip, r8
c0de90f6:	a905      	add	r1, sp, #20
c0de90f8:	e89c 00f4 	ldmia.w	ip, {r2, r4, r5, r6, r7}
c0de90fc:	460b      	mov	r3, r1
c0de90fe:	c3f4      	stmia	r3!, {r2, r4, r5, r6, r7}
c0de9100:	f10d 0213 	add.w	r2, sp, #19
c0de9104:	b2c7      	uxtb	r7, r0
c0de9106:	eb09 040a 	add.w	r4, r9, sl
c0de910a:	f88d 001c 	strb.w	r0, [sp, #28]
c0de910e:	2301      	movs	r3, #1
c0de9110:	9202      	str	r2, [sp, #8]
c0de9112:	4638      	mov	r0, r7
c0de9114:	2200      	movs	r2, #0
c0de9116:	9405      	str	r4, [sp, #20]
c0de9118:	e9cd 3300 	strd	r3, r3, [sp]
c0de911c:	2300      	movs	r3, #0
c0de911e:	f7fe fb6e 	bl	c0de77fe <getNbTagValuesInPage>
c0de9122:	4287      	cmp	r7, r0
c0de9124:	bf88      	it	hi
c0de9126:	2001      	movhi	r0, #1
c0de9128:	9b03      	ldr	r3, [sp, #12]
c0de912a:	f884 0034 	strb.w	r0, [r4, #52]	@ 0x34
c0de912e:	f640 1107 	movw	r1, #2311	@ 0x907
c0de9132:	f88b 000c 	strb.w	r0, [fp, #12]
c0de9136:	f8ab 1020 	strh.w	r1, [fp, #32]
c0de913a:	2100      	movs	r1, #0
c0de913c:	f1b8 0f00 	cmp.w	r8, #0
c0de9140:	f8ab 1010 	strh.w	r1, [fp, #16]
c0de9144:	f88b 100e 	strb.w	r1, [fp, #14]
c0de9148:	eb09 010a 	add.w	r1, r9, sl
c0de914c:	f8cb 1004 	str.w	r1, [fp, #4]
c0de9150:	d003      	beq.n	c0de915a <prepareAddressConfirmationPages+0xe2>
c0de9152:	f898 1008 	ldrb.w	r1, [r8, #8]
c0de9156:	4288      	cmp	r0, r1
c0de9158:	d907      	bls.n	c0de916a <prepareAddressConfirmationPages+0xf2>
c0de915a:	200b      	movs	r0, #11
c0de915c:	f88b 002c 	strb.w	r0, [fp, #44]	@ 0x2c
c0de9160:	481c      	ldr	r0, [pc, #112]	@ (c0de91d4 <prepareAddressConfirmationPages+0x15c>)
c0de9162:	4478      	add	r0, pc
c0de9164:	f8cb 0024 	str.w	r0, [fp, #36]	@ 0x24
c0de9168:	e027      	b.n	c0de91ba <prepareAddressConfirmationPages+0x142>
c0de916a:	2000      	movs	r0, #0
c0de916c:	f8cb 0024 	str.w	r0, [fp, #36]	@ 0x24
c0de9170:	4916      	ldr	r1, [pc, #88]	@ (c0de91cc <prepareAddressConfirmationPages+0x154>)
c0de9172:	4479      	add	r1, pc
c0de9174:	f8cb 101c 	str.w	r1, [fp, #28]
c0de9178:	210b      	movs	r1, #11
c0de917a:	f883 102c 	strb.w	r1, [r3, #44]	@ 0x2c
c0de917e:	2106      	movs	r1, #6
c0de9180:	7019      	strb	r1, [r3, #0]
c0de9182:	2109      	movs	r1, #9
c0de9184:	f883 1021 	strb.w	r1, [r3, #33]	@ 0x21
c0de9188:	4911      	ldr	r1, [pc, #68]	@ (c0de91d0 <prepareAddressConfirmationPages+0x158>)
c0de918a:	e9c3 0006 	strd	r0, r0, [r3, #24]
c0de918e:	1d18      	adds	r0, r3, #4
c0de9190:	4479      	add	r1, pc
c0de9192:	6259      	str	r1, [r3, #36]	@ 0x24
c0de9194:	4641      	mov	r1, r8
c0de9196:	e891 00f4 	ldmia.w	r1, {r2, r4, r5, r6, r7}
c0de919a:	c0f4      	stmia	r0!, {r2, r4, r5, r6, r7}
c0de919c:	eb09 000a 	add.w	r0, r9, sl
c0de91a0:	f898 1008 	ldrb.w	r1, [r8, #8]
c0de91a4:	f890 0034 	ldrb.w	r0, [r0, #52]	@ 0x34
c0de91a8:	1a09      	subs	r1, r1, r0
c0de91aa:	3101      	adds	r1, #1
c0de91ac:	7319      	strb	r1, [r3, #12]
c0de91ae:	f8d8 1000 	ldr.w	r1, [r8]
c0de91b2:	eb01 1000 	add.w	r0, r1, r0, lsl #4
c0de91b6:	3810      	subs	r0, #16
c0de91b8:	6058      	str	r0, [r3, #4]
c0de91ba:	b00a      	add	sp, #40	@ 0x28
c0de91bc:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de91c0:	00001a90 	.word	0x00001a90
c0de91c4:	00003c7f 	.word	0x00003c7f
c0de91c8:	0000335f 	.word	0x0000335f
c0de91cc:	0000363d 	.word	0x0000363d
c0de91d0:	00003e85 	.word	0x00003e85
c0de91d4:	00003eb3 	.word	0x00003eb3

c0de91d8 <nbgl_useCaseAddressReview>:
c0de91d8:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de91dc:	4e2d      	ldr	r6, [pc, #180]	@ (c0de9294 <nbgl_useCaseAddressReview+0xbc>)
c0de91de:	9301      	str	r3, [sp, #4]
c0de91e0:	4617      	mov	r7, r2
c0de91e2:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de91e6:	eb09 0406 	add.w	r4, r9, r6
c0de91ea:	f7fe fcfb 	bl	c0de7be4 <reset_callbacks_and_context>
c0de91ee:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0de91f0:	e9dd 540c 	ldrd	r5, r4, [sp, #48]	@ 0x30
c0de91f4:	b108      	cbz	r0, c0de91fa <nbgl_useCaseAddressReview+0x22>
c0de91f6:	f7fd f9cf 	bl	c0de6598 <nbgl_layoutRelease>
c0de91fa:	eb09 0006 	add.w	r0, r9, r6
c0de91fe:	2138      	movs	r1, #56	@ 0x38
c0de9200:	f001 ffd6 	bl	c0deb1b0 <__aeabi_memclr>
c0de9204:	4824      	ldr	r0, [pc, #144]	@ (c0de9298 <nbgl_useCaseAddressReview+0xc0>)
c0de9206:	2602      	movs	r6, #2
c0de9208:	f04f 0a00 	mov.w	sl, #0
c0de920c:	f8df b094 	ldr.w	fp, [pc, #148]	@ c0de92a4 <nbgl_useCaseAddressReview+0xcc>
c0de9210:	21a8      	movs	r1, #168	@ 0xa8
c0de9212:	f809 6000 	strb.w	r6, [r9, r0]
c0de9216:	4448      	add	r0, r9
c0de9218:	6184      	str	r4, [r0, #24]
c0de921a:	f8c0 a010 	str.w	sl, [r0, #16]
c0de921e:	481f      	ldr	r0, [pc, #124]	@ (c0de929c <nbgl_useCaseAddressReview+0xc4>)
c0de9220:	eb09 040b 	add.w	r4, r9, fp
c0de9224:	4448      	add	r0, r9
c0de9226:	6206      	str	r6, [r0, #32]
c0de9228:	481d      	ldr	r0, [pc, #116]	@ (c0de92a0 <nbgl_useCaseAddressReview+0xc8>)
c0de922a:	eb09 0800 	add.w	r8, r9, r0
c0de922e:	4620      	mov	r0, r4
c0de9230:	f8c8 4008 	str.w	r4, [r8, #8]
c0de9234:	f001 ffbc 	bl	c0deb1b0 <__aeabi_memclr>
c0de9238:	2001      	movs	r0, #1
c0de923a:	60a7      	str	r7, [r4, #8]
c0de923c:	f884 a026 	strb.w	sl, [r4, #38]	@ 0x26
c0de9240:	f104 0238 	add.w	r2, r4, #56	@ 0x38
c0de9244:	f104 0370 	add.w	r3, r4, #112	@ 0x70
c0de9248:	f809 000b 	strb.w	r0, [r9, fp]
c0de924c:	4816      	ldr	r0, [pc, #88]	@ (c0de92a8 <nbgl_useCaseAddressReview+0xd0>)
c0de924e:	9901      	ldr	r1, [sp, #4]
c0de9250:	4478      	add	r0, pc
c0de9252:	e9c4 1a05 	strd	r1, sl, [r4, #20]
c0de9256:	e9c4 5007 	strd	r5, r0, [r4, #28]
c0de925a:	e9dd 0102 	ldrd	r0, r1, [sp, #8]
c0de925e:	f7ff ff0b 	bl	c0de9078 <prepareAddressConfirmationPages>
c0de9262:	f894 0070 	ldrb.w	r0, [r4, #112]	@ 0x70
c0de9266:	2806      	cmp	r0, #6
c0de9268:	bf08      	it	eq
c0de926a:	2603      	moveq	r6, #3
c0de926c:	f888 600c 	strb.w	r6, [r8, #12]
c0de9270:	f000 fec2 	bl	c0de9ff8 <OUTLINED_FUNCTION_5>
c0de9274:	4a0d      	ldr	r2, [pc, #52]	@ (c0de92ac <nbgl_useCaseAddressReview+0xd4>)
c0de9276:	4601      	mov	r1, r0
c0de9278:	2001      	movs	r0, #1
c0de927a:	447a      	add	r2, pc
c0de927c:	f7fe fcc8 	bl	c0de7c10 <prepareNavInfo>
c0de9280:	f000 febd 	bl	c0de9ffe <OUTLINED_FUNCTION_6>
c0de9284:	2000      	movs	r0, #0
c0de9286:	2101      	movs	r1, #1
c0de9288:	b004      	add	sp, #16
c0de928a:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de928e:	f7fe be41 	b.w	c0de7f14 <displayGenericContextPage>
c0de9292:	bf00      	nop
c0de9294:	00001a90 	.word	0x00001a90
c0de9298:	00001c48 	.word	0x00001c48
c0de929c:	00001cc4 	.word	0x00001cc4
c0de92a0:	0000197c 	.word	0x0000197c
c0de92a4:	000019e8 	.word	0x000019e8
c0de92a8:	000035ce 	.word	0x000035ce
c0de92ac:	00003849 	.word	0x00003849

c0de92b0 <nbgl_useCaseSpinner>:
c0de92b0:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de92b2:	b087      	sub	sp, #28
c0de92b4:	4e1f      	ldr	r6, [pc, #124]	@ (c0de9334 <nbgl_useCaseSpinner+0x84>)
c0de92b6:	4604      	mov	r4, r0
c0de92b8:	f819 0006 	ldrb.w	r0, [r9, r6]
c0de92bc:	2801      	cmp	r0, #1
c0de92be:	d114      	bne.n	c0de92ea <nbgl_useCaseSpinner+0x3a>
c0de92c0:	eb09 0006 	add.w	r0, r9, r6
c0de92c4:	7841      	ldrb	r1, [r0, #1]
c0de92c6:	3101      	adds	r1, #1
c0de92c8:	b2ca      	uxtb	r2, r1
c0de92ca:	3a04      	subs	r2, #4
c0de92cc:	bf18      	it	ne
c0de92ce:	460a      	movne	r2, r1
c0de92d0:	7042      	strb	r2, [r0, #1]
c0de92d2:	6b00      	ldr	r0, [r0, #48]	@ 0x30
c0de92d4:	b2d3      	uxtb	r3, r2
c0de92d6:	4621      	mov	r1, r4
c0de92d8:	2200      	movs	r2, #0
c0de92da:	f7fd f88b 	bl	c0de63f4 <nbgl_layoutUpdateSpinner>
c0de92de:	2802      	cmp	r0, #2
c0de92e0:	d022      	beq.n	c0de9328 <nbgl_useCaseSpinner+0x78>
c0de92e2:	2801      	cmp	r0, #1
c0de92e4:	d11e      	bne.n	c0de9324 <nbgl_useCaseSpinner+0x74>
c0de92e6:	2004      	movs	r0, #4
c0de92e8:	e01f      	b.n	c0de932a <nbgl_useCaseSpinner+0x7a>
c0de92ea:	eb09 0506 	add.w	r5, r9, r6
c0de92ee:	216c      	movs	r1, #108	@ 0x6c
c0de92f0:	4628      	mov	r0, r5
c0de92f2:	f001 ff5d 	bl	c0deb1b0 <__aeabi_memclr>
c0de92f6:	2701      	movs	r7, #1
c0de92f8:	211c      	movs	r1, #28
c0de92fa:	f809 7006 	strb.w	r7, [r9, r6]
c0de92fe:	466e      	mov	r6, sp
c0de9300:	f000 fe94 	bl	c0dea02c <OUTLINED_FUNCTION_13>
c0de9304:	4630      	mov	r0, r6
c0de9306:	f88d 7001 	strb.w	r7, [sp, #1]
c0de930a:	f7f9 ff1d 	bl	c0de3148 <nbgl_layoutGet>
c0de930e:	786b      	ldrb	r3, [r5, #1]
c0de9310:	4621      	mov	r1, r4
c0de9312:	2200      	movs	r2, #0
c0de9314:	6328      	str	r0, [r5, #48]	@ 0x30
c0de9316:	f7fc ff0d 	bl	c0de6134 <nbgl_layoutAddSpinner>
c0de931a:	6b28      	ldr	r0, [r5, #48]	@ 0x30
c0de931c:	f7fd f90e 	bl	c0de653c <nbgl_layoutDraw>
c0de9320:	f000 fe5e 	bl	c0de9fe0 <OUTLINED_FUNCTION_3>
c0de9324:	b007      	add	sp, #28
c0de9326:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de9328:	2001      	movs	r0, #1
c0de932a:	b007      	add	sp, #28
c0de932c:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de9330:	f001 bb04 	b.w	c0dea93c <nbgl_refreshSpecial>
c0de9334:	0000197c 	.word	0x0000197c

c0de9338 <getContentAtIdx>:
c0de9338:	b570      	push	{r4, r5, r6, lr}
c0de933a:	4605      	mov	r5, r0
c0de933c:	2000      	movs	r0, #0
c0de933e:	2d00      	cmp	r5, #0
c0de9340:	d415      	bmi.n	c0de936e <getContentAtIdx+0x36>
c0de9342:	4e11      	ldr	r6, [pc, #68]	@ (c0de9388 <getContentAtIdx+0x50>)
c0de9344:	460c      	mov	r4, r1
c0de9346:	eb09 0106 	add.w	r1, r9, r6
c0de934a:	7b09      	ldrb	r1, [r1, #12]
c0de934c:	428d      	cmp	r5, r1
c0de934e:	da0e      	bge.n	c0de936e <getContentAtIdx+0x36>
c0de9350:	eb09 0006 	add.w	r0, r9, r6
c0de9354:	7900      	ldrb	r0, [r0, #4]
c0de9356:	b158      	cbz	r0, c0de9370 <getContentAtIdx+0x38>
c0de9358:	4620      	mov	r0, r4
c0de935a:	2138      	movs	r1, #56	@ 0x38
c0de935c:	f001 ff28 	bl	c0deb1b0 <__aeabi_memclr>
c0de9360:	eb09 0006 	add.w	r0, r9, r6
c0de9364:	4621      	mov	r1, r4
c0de9366:	6882      	ldr	r2, [r0, #8]
c0de9368:	b2e8      	uxtb	r0, r5
c0de936a:	4790      	blx	r2
c0de936c:	4620      	mov	r0, r4
c0de936e:	bd70      	pop	{r4, r5, r6, pc}
c0de9370:	eb09 0006 	add.w	r0, r9, r6
c0de9374:	ebc5 01c5 	rsb	r1, r5, r5, lsl #3
c0de9378:	6880      	ldr	r0, [r0, #8]
c0de937a:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
c0de937e:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de9382:	f001 bcf3 	b.w	c0dead6c <pic>
c0de9386:	bf00      	nop
c0de9388:	0000197c 	.word	0x0000197c

c0de938c <getContentNbElement>:
c0de938c:	7801      	ldrb	r1, [r0, #0]
c0de938e:	290a      	cmp	r1, #10
c0de9390:	d00b      	beq.n	c0de93aa <getContentNbElement+0x1e>
c0de9392:	2906      	cmp	r1, #6
c0de9394:	d009      	beq.n	c0de93aa <getContentNbElement+0x1e>
c0de9396:	2907      	cmp	r1, #7
c0de9398:	d009      	beq.n	c0de93ae <getContentNbElement+0x22>
c0de939a:	2908      	cmp	r1, #8
c0de939c:	d009      	beq.n	c0de93b2 <getContentNbElement+0x26>
c0de939e:	2909      	cmp	r1, #9
c0de93a0:	d009      	beq.n	c0de93b6 <getContentNbElement+0x2a>
c0de93a2:	2904      	cmp	r1, #4
c0de93a4:	bf1c      	itt	ne
c0de93a6:	2001      	movne	r0, #1
c0de93a8:	4770      	bxne	lr
c0de93aa:	7b00      	ldrb	r0, [r0, #12]
c0de93ac:	4770      	bx	lr
c0de93ae:	7a00      	ldrb	r0, [r0, #8]
c0de93b0:	4770      	bx	lr
c0de93b2:	7c00      	ldrb	r0, [r0, #16]
c0de93b4:	4770      	bx	lr
c0de93b6:	7a40      	ldrb	r0, [r0, #9]
c0de93b8:	4770      	bx	lr
	...

c0de93bc <genericContextComputeNextPageParams>:
c0de93bc:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de93c0:	f8df 810c 	ldr.w	r8, [pc, #268]	@ c0de94d0 <genericContextComputeNextPageParams+0x114>
c0de93c4:	4682      	mov	sl, r0
c0de93c6:	4616      	mov	r6, r2
c0de93c8:	460d      	mov	r5, r1
c0de93ca:	f10d 0107 	add.w	r1, sp, #7
c0de93ce:	461a      	mov	r2, r3
c0de93d0:	eb09 0008 	add.w	r0, r9, r8
c0de93d4:	7c04      	ldrb	r4, [r0, #16]
c0de93d6:	7c87      	ldrb	r7, [r0, #18]
c0de93d8:	4650      	mov	r0, sl
c0de93da:	f000 f881 	bl	c0de94e0 <genericContextGetPageInfo>
c0de93de:	f89d 0007 	ldrb.w	r0, [sp, #7]
c0de93e2:	f8df b0f0 	ldr.w	fp, [pc, #240]	@ c0de94d4 <genericContextComputeNextPageParams+0x118>
c0de93e6:	7030      	strb	r0, [r6, #0]
c0de93e8:	eb09 010b 	add.w	r1, r9, fp
c0de93ec:	f891 1060 	ldrb.w	r1, [r1, #96]	@ 0x60
c0de93f0:	4551      	cmp	r1, sl
c0de93f2:	d219      	bcs.n	c0de9428 <genericContextComputeNextPageParams+0x6c>
c0de93f4:	4b38      	ldr	r3, [pc, #224]	@ (c0de94d8 <genericContextComputeNextPageParams+0x11c>)
c0de93f6:	084e      	lsrs	r6, r1, #1
c0de93f8:	2204      	movs	r2, #4
c0de93fa:	ea02 0281 	and.w	r2, r2, r1, lsl #2
c0de93fe:	444b      	add	r3, r9
c0de9400:	5d9b      	ldrb	r3, [r3, r6]
c0de9402:	fa23 f202 	lsr.w	r2, r3, r2
c0de9406:	2300      	movs	r3, #0
c0de9408:	f002 0207 	and.w	r2, r2, #7
c0de940c:	4417      	add	r7, r2
c0de940e:	eb09 0208 	add.w	r2, r9, r8
c0de9412:	7c52      	ldrb	r2, [r2, #17]
c0de9414:	4297      	cmp	r7, r2
c0de9416:	bf28      	it	cs
c0de9418:	2301      	movcs	r3, #1
c0de941a:	2a00      	cmp	r2, #0
c0de941c:	bf18      	it	ne
c0de941e:	2201      	movne	r2, #1
c0de9420:	401a      	ands	r2, r3
c0de9422:	bf18      	it	ne
c0de9424:	2700      	movne	r7, #0
c0de9426:	4414      	add	r4, r2
c0de9428:	4551      	cmp	r1, sl
c0de942a:	d905      	bls.n	c0de9438 <genericContextComputeNextPageParams+0x7c>
c0de942c:	1a3f      	subs	r7, r7, r0
c0de942e:	f1b7 3fff 	cmp.w	r7, #4294967295	@ 0xffffffff
c0de9432:	bfdc      	itt	le
c0de9434:	4247      	negle	r7, r0
c0de9436:	3c01      	suble	r4, #1
c0de9438:	b2e6      	uxtb	r6, r4
c0de943a:	2eff      	cmp	r6, #255	@ 0xff
c0de943c:	d014      	beq.n	c0de9468 <genericContextComputeNextPageParams+0xac>
c0de943e:	eb09 0108 	add.w	r1, r9, r8
c0de9442:	b260      	sxtb	r0, r4
c0de9444:	7b09      	ldrb	r1, [r1, #12]
c0de9446:	4288      	cmp	r0, r1
c0de9448:	d108      	bne.n	c0de945c <genericContextComputeNextPageParams+0xa0>
c0de944a:	eb09 0108 	add.w	r1, r9, r8
c0de944e:	7d09      	ldrb	r1, [r1, #20]
c0de9450:	b121      	cbz	r1, c0de945c <genericContextComputeNextPageParams+0xa0>
c0de9452:	4822      	ldr	r0, [pc, #136]	@ (c0de94dc <genericContextComputeNextPageParams+0x120>)
c0de9454:	4448      	add	r0, r9
c0de9456:	f100 0538 	add.w	r5, r0, #56	@ 0x38
c0de945a:	e00d      	b.n	c0de9478 <genericContextComputeNextPageParams+0xbc>
c0de945c:	4629      	mov	r1, r5
c0de945e:	f7ff ff6b 	bl	c0de9338 <getContentAtIdx>
c0de9462:	4605      	mov	r5, r0
c0de9464:	b940      	cbnz	r0, c0de9478 <genericContextComputeNextPageParams+0xbc>
c0de9466:	e02e      	b.n	c0de94c6 <genericContextComputeNextPageParams+0x10a>
c0de9468:	eb09 0008 	add.w	r0, r9, r8
c0de946c:	7cc0      	ldrb	r0, [r0, #19]
c0de946e:	2800      	cmp	r0, #0
c0de9470:	d0e5      	beq.n	c0de943e <genericContextComputeNextPageParams+0x82>
c0de9472:	481a      	ldr	r0, [pc, #104]	@ (c0de94dc <genericContextComputeNextPageParams+0x120>)
c0de9474:	eb09 0500 	add.w	r5, r9, r0
c0de9478:	eb09 0008 	add.w	r0, r9, r8
c0de947c:	7c00      	ldrb	r0, [r0, #16]
c0de947e:	4286      	cmp	r6, r0
c0de9480:	d103      	bne.n	c0de948a <genericContextComputeNextPageParams+0xce>
c0de9482:	eb09 0008 	add.w	r0, r9, r8
c0de9486:	7c40      	ldrb	r0, [r0, #17]
c0de9488:	b988      	cbnz	r0, c0de94ae <genericContextComputeNextPageParams+0xf2>
c0de948a:	eb09 0608 	add.w	r6, r9, r8
c0de948e:	4628      	mov	r0, r5
c0de9490:	7434      	strb	r4, [r6, #16]
c0de9492:	f7ff ff7b 	bl	c0de938c <getContentNbElement>
c0de9496:	7470      	strb	r0, [r6, #17]
c0de9498:	6b68      	ldr	r0, [r5, #52]	@ 0x34
c0de949a:	eb09 040b 	add.w	r4, r9, fp
c0de949e:	f001 fc65 	bl	c0dead6c <pic>
c0de94a2:	62e0      	str	r0, [r4, #44]	@ 0x2c
c0de94a4:	7c70      	ldrb	r0, [r6, #17]
c0de94a6:	f1b7 3fff 	cmp.w	r7, #4294967295	@ 0xffffffff
c0de94aa:	dc02      	bgt.n	c0de94b2 <genericContextComputeNextPageParams+0xf6>
c0de94ac:	4407      	add	r7, r0
c0de94ae:	2f00      	cmp	r7, #0
c0de94b0:	d409      	bmi.n	c0de94c6 <genericContextComputeNextPageParams+0x10a>
c0de94b2:	4287      	cmp	r7, r0
c0de94b4:	d207      	bcs.n	c0de94c6 <genericContextComputeNextPageParams+0x10a>
c0de94b6:	eb09 000b 	add.w	r0, r9, fp
c0de94ba:	f880 a060 	strb.w	sl, [r0, #96]	@ 0x60
c0de94be:	eb09 0008 	add.w	r0, r9, r8
c0de94c2:	7487      	strb	r7, [r0, #18]
c0de94c4:	e000      	b.n	c0de94c8 <genericContextComputeNextPageParams+0x10c>
c0de94c6:	2500      	movs	r5, #0
c0de94c8:	4628      	mov	r0, r5
c0de94ca:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de94ce:	bf00      	nop
c0de94d0:	0000197c 	.word	0x0000197c
c0de94d4:	00001c48 	.word	0x00001c48
c0de94d8:	00001b48 	.word	0x00001b48
c0de94dc:	000019e8 	.word	0x000019e8

c0de94e0 <genericContextGetPageInfo>:
c0de94e0:	b510      	push	{r4, lr}
c0de94e2:	4c08      	ldr	r4, [pc, #32]	@ (c0de9504 <genericContextGetPageInfo+0x24>)
c0de94e4:	2304      	movs	r3, #4
c0de94e6:	ea03 0380 	and.w	r3, r3, r0, lsl #2
c0de94ea:	0840      	lsrs	r0, r0, #1
c0de94ec:	444c      	add	r4, r9
c0de94ee:	5c20      	ldrb	r0, [r4, r0]
c0de94f0:	40d8      	lsrs	r0, r3
c0de94f2:	b111      	cbz	r1, c0de94fa <genericContextGetPageInfo+0x1a>
c0de94f4:	f000 0307 	and.w	r3, r0, #7
c0de94f8:	700b      	strb	r3, [r1, #0]
c0de94fa:	b112      	cbz	r2, c0de9502 <genericContextGetPageInfo+0x22>
c0de94fc:	f3c0 00c0 	ubfx	r0, r0, #3, #1
c0de9500:	7010      	strb	r0, [r2, #0]
c0de9502:	bd10      	pop	{r4, pc}
c0de9504:	00001b48 	.word	0x00001b48

c0de9508 <bundleNavStartSettings>:
c0de9508:	2000      	movs	r0, #0
c0de950a:	f7fe bf3f 	b.w	c0de838c <bundleNavStartSettingsAtPage>
	...

c0de9510 <displayFullValuePage>:
c0de9510:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9514:	b092      	sub	sp, #72	@ 0x48
c0de9516:	460d      	mov	r5, r1
c0de9518:	68d1      	ldr	r1, [r2, #12]
c0de951a:	4614      	mov	r4, r2
c0de951c:	b101      	cbz	r1, c0de9520 <displayFullValuePage+0x10>
c0de951e:	4608      	mov	r0, r1
c0de9520:	f001 fc24 	bl	c0dead6c <pic>
c0de9524:	4606      	mov	r6, r0
c0de9526:	7d20      	ldrb	r0, [r4, #20]
c0de9528:	2805      	cmp	r0, #5
c0de952a:	d00d      	beq.n	c0de9548 <displayFullValuePage+0x38>
c0de952c:	2804      	cmp	r0, #4
c0de952e:	d170      	bne.n	c0de9612 <displayFullValuePage+0x102>
c0de9530:	4861      	ldr	r0, [pc, #388]	@ (c0de96b8 <displayFullValuePage+0x1a8>)
c0de9532:	6921      	ldr	r1, [r4, #16]
c0de9534:	2201      	movs	r2, #1
c0de9536:	4448      	add	r0, r9
c0de9538:	6341      	str	r1, [r0, #52]	@ 0x34
c0de953a:	4630      	mov	r0, r6
c0de953c:	6921      	ldr	r1, [r4, #16]
c0de953e:	b012      	add	sp, #72	@ 0x48
c0de9540:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9544:	f000 ba48 	b.w	c0de99d8 <displayInfosListModal>
c0de9548:	485b      	ldr	r0, [pc, #364]	@ (c0de96b8 <displayFullValuePage+0x1a8>)
c0de954a:	6921      	ldr	r1, [r4, #16]
c0de954c:	2200      	movs	r2, #0
c0de954e:	4448      	add	r0, r9
c0de9550:	6381      	str	r1, [r0, #56]	@ 0x38
c0de9552:	485a      	ldr	r0, [pc, #360]	@ (c0de96bc <displayFullValuePage+0x1ac>)
c0de9554:	2100      	movs	r1, #0
c0de9556:	6927      	ldr	r7, [r4, #16]
c0de9558:	9102      	str	r1, [sp, #8]
c0de955a:	4448      	add	r0, r9
c0de955c:	e9c0 220c 	strd	r2, r2, [r0, #48]	@ 0x30
c0de9560:	6382      	str	r2, [r0, #56]	@ 0x38
c0de9562:	63c2      	str	r2, [r0, #60]	@ 0x3c
c0de9564:	7a3d      	ldrb	r5, [r7, #8]
c0de9566:	0628      	lsls	r0, r5, #24
c0de9568:	f000 8087 	beq.w	c0de967a <displayFullValuePage+0x16a>
c0de956c:	9501      	str	r5, [sp, #4]
c0de956e:	fa5f fb85 	uxtb.w	fp, r5
c0de9572:	f04f 0800 	mov.w	r8, #0
c0de9576:	2600      	movs	r6, #0
c0de9578:	9802      	ldr	r0, [sp, #8]
c0de957a:	b2c0      	uxtb	r0, r0
c0de957c:	ea4f 1a00 	mov.w	sl, r0, lsl #4
c0de9580:	45c3      	cmp	fp, r8
c0de9582:	d027      	beq.n	c0de95d4 <displayFullValuePage+0xc4>
c0de9584:	f1b8 0f00 	cmp.w	r8, #0
c0de9588:	bf18      	it	ne
c0de958a:	3618      	addne	r6, #24
c0de958c:	6838      	ldr	r0, [r7, #0]
c0de958e:	b108      	cbz	r0, c0de9594 <displayFullValuePage+0x84>
c0de9590:	4450      	add	r0, sl
c0de9592:	e004      	b.n	c0de959e <displayFullValuePage+0x8e>
c0de9594:	9802      	ldr	r0, [sp, #8]
c0de9596:	6879      	ldr	r1, [r7, #4]
c0de9598:	4440      	add	r0, r8
c0de959a:	b2c0      	uxtb	r0, r0
c0de959c:	4788      	blx	r1
c0de959e:	f001 fbe5 	bl	c0dead6c <pic>
c0de95a2:	7b7b      	ldrb	r3, [r7, #13]
c0de95a4:	6801      	ldr	r1, [r0, #0]
c0de95a6:	4604      	mov	r4, r0
c0de95a8:	f000 fd3b 	bl	c0dea022 <OUTLINED_FUNCTION_12>
c0de95ac:	6861      	ldr	r1, [r4, #4]
c0de95ae:	7b7b      	ldrb	r3, [r7, #13]
c0de95b0:	4605      	mov	r5, r0
c0de95b2:	f000 fd36 	bl	c0dea022 <OUTLINED_FUNCTION_12>
c0de95b6:	1971      	adds	r1, r6, r5
c0de95b8:	f10a 0a10 	add.w	sl, sl, #16
c0de95bc:	f108 0801 	add.w	r8, r8, #1
c0de95c0:	4408      	add	r0, r1
c0de95c2:	1d06      	adds	r6, r0, #4
c0de95c4:	b2b0      	uxth	r0, r6
c0de95c6:	f5b0 7fe8 	cmp.w	r0, #464	@ 0x1d0
c0de95ca:	d3d9      	bcc.n	c0de9580 <displayFullValuePage+0x70>
c0de95cc:	9d01      	ldr	r5, [sp, #4]
c0de95ce:	f1a8 0001 	sub.w	r0, r8, #1
c0de95d2:	e001      	b.n	c0de95d8 <displayFullValuePage+0xc8>
c0de95d4:	9d01      	ldr	r5, [sp, #4]
c0de95d6:	4628      	mov	r0, r5
c0de95d8:	4938      	ldr	r1, [pc, #224]	@ (c0de96bc <displayFullValuePage+0x1ac>)
c0de95da:	2404      	movs	r4, #4
c0de95dc:	1a2d      	subs	r5, r5, r0
c0de95de:	4449      	add	r1, r9
c0de95e0:	f891 2030 	ldrb.w	r2, [r1, #48]	@ 0x30
c0de95e4:	1c53      	adds	r3, r2, #1
c0de95e6:	f881 3030 	strb.w	r3, [r1, #48]	@ 0x30
c0de95ea:	eb01 0152 	add.w	r1, r1, r2, lsr #1
c0de95ee:	ea04 0282 	and.w	r2, r4, r2, lsl #2
c0de95f2:	240f      	movs	r4, #15
c0de95f4:	f891 3050 	ldrb.w	r3, [r1, #80]	@ 0x50
c0de95f8:	4094      	lsls	r4, r2
c0de95fa:	43a3      	bics	r3, r4
c0de95fc:	f000 0407 	and.w	r4, r0, #7
c0de9600:	fa04 f202 	lsl.w	r2, r4, r2
c0de9604:	431a      	orrs	r2, r3
c0de9606:	f881 2050 	strb.w	r2, [r1, #80]	@ 0x50
c0de960a:	9902      	ldr	r1, [sp, #8]
c0de960c:	4401      	add	r1, r0
c0de960e:	9102      	str	r1, [sp, #8]
c0de9610:	e7a9      	b.n	c0de9566 <displayFullValuePage+0x56>
c0de9612:	af0b      	add	r7, sp, #44	@ 0x2c
c0de9614:	492a      	ldr	r1, [pc, #168]	@ (c0de96c0 <displayFullValuePage+0x1b0>)
c0de9616:	221c      	movs	r2, #28
c0de9618:	4638      	mov	r0, r7
c0de961a:	4479      	add	r1, pc
c0de961c:	f001 fdbe 	bl	c0deb19c <__aeabi_memcpy>
c0de9620:	f44f 6010 	mov.w	r0, #2304	@ 0x900
c0de9624:	f8df 8090 	ldr.w	r8, [pc, #144]	@ c0de96b8 <displayFullValuePage+0x1a8>
c0de9628:	9609      	str	r6, [sp, #36]	@ 0x24
c0de962a:	f8ad 0028 	strh.w	r0, [sp, #40]	@ 0x28
c0de962e:	2000      	movs	r0, #0
c0de9630:	9008      	str	r0, [sp, #32]
c0de9632:	2001      	movs	r0, #1
c0de9634:	eb09 0608 	add.w	r6, r9, r8
c0de9638:	f8ad 001c 	strh.w	r0, [sp, #28]
c0de963c:	4638      	mov	r0, r7
c0de963e:	f7f9 fd83 	bl	c0de3148 <nbgl_layoutGet>
c0de9642:	62f0      	str	r0, [r6, #44]	@ 0x2c
c0de9644:	a907      	add	r1, sp, #28
c0de9646:	f7fc fb17 	bl	c0de5c78 <nbgl_layoutAddHeader>
c0de964a:	7d20      	ldrb	r0, [r4, #20]
c0de964c:	2801      	cmp	r0, #1
c0de964e:	d01b      	beq.n	c0de9688 <displayFullValuePage+0x178>
c0de9650:	2802      	cmp	r0, #2
c0de9652:	d01c      	beq.n	c0de968e <displayFullValuePage+0x17e>
c0de9654:	2803      	cmp	r0, #3
c0de9656:	d11d      	bne.n	c0de9694 <displayFullValuePage+0x184>
c0de9658:	f44f 3080 	mov.w	r0, #65536	@ 0x10000
c0de965c:	9006      	str	r0, [sp, #24]
c0de965e:	cc07      	ldmia	r4!, {r0, r1, r2}
c0de9660:	9105      	str	r1, [sp, #20]
c0de9662:	2a00      	cmp	r2, #0
c0de9664:	9003      	str	r0, [sp, #12]
c0de9666:	bf08      	it	eq
c0de9668:	4602      	moveq	r2, r0
c0de966a:	eb09 0008 	add.w	r0, r9, r8
c0de966e:	9204      	str	r2, [sp, #16]
c0de9670:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0de9672:	a903      	add	r1, sp, #12
c0de9674:	f7fb fea5 	bl	c0de53c2 <nbgl_layoutAddQRCode>
c0de9678:	e014      	b.n	c0de96a4 <displayFullValuePage+0x194>
c0de967a:	2000      	movs	r0, #0
c0de967c:	2101      	movs	r1, #1
c0de967e:	b012      	add	sp, #72	@ 0x48
c0de9680:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9684:	f000 bb12 	b.w	c0de9cac <displayTagValueListModalPage>
c0de9688:	4b0e      	ldr	r3, [pc, #56]	@ (c0de96c4 <displayFullValuePage+0x1b4>)
c0de968a:	447b      	add	r3, pc
c0de968c:	e003      	b.n	c0de9696 <displayFullValuePage+0x186>
c0de968e:	4b0e      	ldr	r3, [pc, #56]	@ (c0de96c8 <displayFullValuePage+0x1b8>)
c0de9690:	447b      	add	r3, pc
c0de9692:	e000      	b.n	c0de9696 <displayFullValuePage+0x186>
c0de9694:	6863      	ldr	r3, [r4, #4]
c0de9696:	eb09 0008 	add.w	r0, r9, r8
c0de969a:	6822      	ldr	r2, [r4, #0]
c0de969c:	4629      	mov	r1, r5
c0de969e:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0de96a0:	f7fb fa72 	bl	c0de4b88 <nbgl_layoutAddTextContent>
c0de96a4:	eb09 0008 	add.w	r0, r9, r8
c0de96a8:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0de96aa:	f7fc ff47 	bl	c0de653c <nbgl_layoutDraw>
c0de96ae:	f001 f940 	bl	c0dea932 <nbgl_refresh>
c0de96b2:	b012      	add	sp, #72	@ 0x48
c0de96b4:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de96b8:	0000197c 	.word	0x0000197c
c0de96bc:	00001c48 	.word	0x00001c48
c0de96c0:	00004f52 	.word	0x00004f52
c0de96c4:	000031fc 	.word	0x000031fc
c0de96c8:	000034e5 	.word	0x000034e5

c0de96cc <displaySecurityReport>:
c0de96cc:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de96d0:	b09a      	sub	sp, #104	@ 0x68
c0de96d2:	ac13      	add	r4, sp, #76	@ 0x4c
c0de96d4:	4974      	ldr	r1, [pc, #464]	@ (c0de98a8 <displaySecurityReport+0x1dc>)
c0de96d6:	4605      	mov	r5, r0
c0de96d8:	221c      	movs	r2, #28
c0de96da:	4620      	mov	r0, r4
c0de96dc:	4479      	add	r1, pc
c0de96de:	f001 fd5d 	bl	c0deb19c <__aeabi_memcpy>
c0de96e2:	4872      	ldr	r0, [pc, #456]	@ (c0de98ac <displaySecurityReport+0x1e0>)
c0de96e4:	a90f      	add	r1, sp, #60	@ 0x3c
c0de96e6:	4478      	add	r0, pc
c0de96e8:	e890 00cc 	ldmia.w	r0, {r2, r3, r6, r7}
c0de96ec:	c1cc      	stmia	r1!, {r2, r3, r6, r7}
c0de96ee:	a809      	add	r0, sp, #36	@ 0x24
c0de96f0:	2118      	movs	r1, #24
c0de96f2:	f001 fd5d 	bl	c0deb1b0 <__aeabi_memclr>
c0de96f6:	f8df b1a8 	ldr.w	fp, [pc, #424]	@ c0de98a0 <displaySecurityReport+0x1d4>
c0de96fa:	4620      	mov	r0, r4
c0de96fc:	eb09 060b 	add.w	r6, r9, fp
c0de9700:	f7f9 fd22 	bl	c0de3148 <nbgl_layoutGet>
c0de9704:	4604      	mov	r4, r0
c0de9706:	6670      	str	r0, [r6, #100]	@ 0x64
c0de9708:	f896 0068 	ldrb.w	r0, [r6, #104]	@ 0x68
c0de970c:	2801      	cmp	r0, #1
c0de970e:	d14b      	bne.n	c0de97a8 <displaySecurityReport+0xdc>
c0de9710:	f896 0069 	ldrb.w	r0, [r6, #105]	@ 0x69
c0de9714:	2800      	cmp	r0, #0
c0de9716:	d147      	bne.n	c0de97a8 <displaySecurityReport+0xdc>
c0de9718:	4865      	ldr	r0, [pc, #404]	@ (c0de98b0 <displaySecurityReport+0x1e4>)
c0de971a:	2600      	movs	r6, #0
c0de971c:	466c      	mov	r4, sp
c0de971e:	f04f 0800 	mov.w	r8, #0
c0de9722:	4478      	add	r0, pc
c0de9724:	1d05      	adds	r5, r0, #4
c0de9726:	2e05      	cmp	r6, #5
c0de9728:	d075      	beq.n	c0de9816 <displaySecurityReport+0x14a>
c0de972a:	eb09 000b 	add.w	r0, r9, fp
c0de972e:	f8d0 a058 	ldr.w	sl, [r0, #88]	@ 0x58
c0de9732:	f8da 0000 	ldr.w	r0, [sl]
c0de9736:	40f0      	lsrs	r0, r6
c0de9738:	07c0      	lsls	r0, r0, #31
c0de973a:	d02b      	beq.n	c0de9794 <displaySecurityReport+0xc8>
c0de973c:	4620      	mov	r0, r4
c0de973e:	2118      	movs	r1, #24
c0de9740:	f001 fd36 	bl	c0deb1b0 <__aeabi_memclr>
c0de9744:	f008 007f 	and.w	r0, r8, #127	@ 0x7f
c0de9748:	2804      	cmp	r0, #4
c0de974a:	d828      	bhi.n	c0de979e <displaySecurityReport+0xd2>
c0de974c:	2101      	movs	r1, #1
c0de974e:	fa01 f000 	lsl.w	r0, r1, r0
c0de9752:	f010 0f19 	tst.w	r0, #25
c0de9756:	d022      	beq.n	c0de979e <displaySecurityReport+0xd2>
c0de9758:	6868      	ldr	r0, [r5, #4]
c0de975a:	9003      	str	r0, [sp, #12]
c0de975c:	6828      	ldr	r0, [r5, #0]
c0de975e:	2e03      	cmp	r6, #3
c0de9760:	9001      	str	r0, [sp, #4]
c0de9762:	d101      	bne.n	c0de9768 <displaySecurityReport+0x9c>
c0de9764:	20ff      	movs	r0, #255	@ 0xff
c0de9766:	e007      	b.n	c0de9778 <displaySecurityReport+0xac>
c0de9768:	2009      	movs	r0, #9
c0de976a:	f88d 0014 	strb.w	r0, [sp, #20]
c0de976e:	4851      	ldr	r0, [pc, #324]	@ (c0de98b4 <displaySecurityReport+0x1e8>)
c0de9770:	4478      	add	r0, pc
c0de9772:	9002      	str	r0, [sp, #8]
c0de9774:	f106 0017 	add.w	r0, r6, #23
c0de9778:	f88d 0011 	strb.w	r0, [sp, #17]
c0de977c:	f855 0c04 	ldr.w	r0, [r5, #-4]
c0de9780:	eb09 070b 	add.w	r7, r9, fp
c0de9784:	4621      	mov	r1, r4
c0de9786:	9000      	str	r0, [sp, #0]
c0de9788:	6e78      	ldr	r0, [r7, #100]	@ 0x64
c0de978a:	f7fa fe8a 	bl	c0de44a2 <nbgl_layoutAddTouchableBar>
c0de978e:	6e78      	ldr	r0, [r7, #100]	@ 0x64
c0de9790:	f7fc f948 	bl	c0de5a24 <nbgl_layoutAddSeparationLine>
c0de9794:	350c      	adds	r5, #12
c0de9796:	f108 0801 	add.w	r8, r8, #1
c0de979a:	3601      	adds	r6, #1
c0de979c:	e7c3      	b.n	c0de9726 <displaySecurityReport+0x5a>
c0de979e:	f8da 0010 	ldr.w	r0, [sl, #16]
c0de97a2:	2800      	cmp	r0, #0
c0de97a4:	d1d9      	bne.n	c0de975a <displaySecurityReport+0x8e>
c0de97a6:	e7d7      	b.n	c0de9758 <displaySecurityReport+0x8c>
c0de97a8:	eb09 000b 	add.w	r0, r9, fp
c0de97ac:	6d80      	ldr	r0, [r0, #88]	@ 0x58
c0de97ae:	b108      	cbz	r0, c0de97b4 <displaySecurityReport+0xe8>
c0de97b0:	68c6      	ldr	r6, [r0, #12]
c0de97b2:	b90e      	cbnz	r6, c0de97b8 <displaySecurityReport+0xec>
c0de97b4:	4e40      	ldr	r6, [pc, #256]	@ (c0de98b8 <displaySecurityReport+0x1ec>)
c0de97b6:	447e      	add	r6, pc
c0de97b8:	f015 0f06 	tst.w	r5, #6
c0de97bc:	d035      	beq.n	c0de982a <displaySecurityReport+0x15e>
c0de97be:	f44f 3180 	mov.w	r1, #65536	@ 0x10000
c0de97c2:	9103      	str	r1, [sp, #12]
c0de97c4:	493d      	ldr	r1, [pc, #244]	@ (c0de98bc <displaySecurityReport+0x1f0>)
c0de97c6:	4479      	add	r1, pc
c0de97c8:	9102      	str	r1, [sp, #8]
c0de97ca:	2140      	movs	r1, #64	@ 0x40
c0de97cc:	6883      	ldr	r3, [r0, #8]
c0de97ce:	4835      	ldr	r0, [pc, #212]	@ (c0de98a4 <displaySecurityReport+0x1d8>)
c0de97d0:	4448      	add	r0, r9
c0de97d2:	9301      	str	r3, [sp, #4]
c0de97d4:	f100 0440 	add.w	r4, r0, #64	@ 0x40
c0de97d8:	9400      	str	r4, [sp, #0]
c0de97da:	4620      	mov	r0, r4
c0de97dc:	4a38      	ldr	r2, [pc, #224]	@ (c0de98c0 <displaySecurityReport+0x1f4>)
c0de97de:	447a      	add	r2, pc
c0de97e0:	f001 f932 	bl	c0deaa48 <snprintf>
c0de97e4:	4620      	mov	r0, r4
c0de97e6:	f001 fd4f 	bl	c0deb288 <strlen>
c0de97ea:	4605      	mov	r5, r0
c0de97ec:	eb09 000b 	add.w	r0, r9, fp
c0de97f0:	4669      	mov	r1, sp
c0de97f2:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0de97f4:	f7fb fde5 	bl	c0de53c2 <nbgl_layoutAddQRCode>
c0de97f8:	2018      	movs	r0, #24
c0de97fa:	f1c5 013f 	rsb	r1, r5, #63	@ 0x3f
c0de97fe:	4633      	mov	r3, r6
c0de9800:	f8ad 0028 	strh.w	r0, [sp, #40]	@ 0x28
c0de9804:	1928      	adds	r0, r5, r4
c0de9806:	4a2f      	ldr	r2, [pc, #188]	@ (c0de98c4 <displaySecurityReport+0x1f8>)
c0de9808:	1c44      	adds	r4, r0, #1
c0de980a:	4620      	mov	r0, r4
c0de980c:	447a      	add	r2, pc
c0de980e:	f001 f91b 	bl	c0deaa48 <snprintf>
c0de9812:	9411      	str	r4, [sp, #68]	@ 0x44
c0de9814:	e030      	b.n	c0de9878 <displaySecurityReport+0x1ac>
c0de9816:	4831      	ldr	r0, [pc, #196]	@ (c0de98dc <displaySecurityReport+0x210>)
c0de9818:	4478      	add	r0, pc
c0de981a:	9011      	str	r0, [sp, #68]	@ 0x44
c0de981c:	eb09 000b 	add.w	r0, r9, fp
c0de9820:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0de9822:	a90f      	add	r1, sp, #60	@ 0x3c
c0de9824:	f7fc fa28 	bl	c0de5c78 <nbgl_layoutAddHeader>
c0de9828:	e030      	b.n	c0de988c <displaySecurityReport+0x1c0>
c0de982a:	06e8      	lsls	r0, r5, #27
c0de982c:	d40c      	bmi.n	c0de9848 <displaySecurityReport+0x17c>
c0de982e:	07e8      	lsls	r0, r5, #31
c0de9830:	d0f4      	beq.n	c0de981c <displaySecurityReport+0x150>
c0de9832:	466d      	mov	r5, sp
c0de9834:	2124      	movs	r1, #36	@ 0x24
c0de9836:	4628      	mov	r0, r5
c0de9838:	f001 fcba 	bl	c0deb1b0 <__aeabi_memclr>
c0de983c:	4825      	ldr	r0, [pc, #148]	@ (c0de98d4 <displaySecurityReport+0x208>)
c0de983e:	4478      	add	r0, pc
c0de9840:	9006      	str	r0, [sp, #24]
c0de9842:	4825      	ldr	r0, [pc, #148]	@ (c0de98d8 <displaySecurityReport+0x20c>)
c0de9844:	4478      	add	r0, pc
c0de9846:	e009      	b.n	c0de985c <displaySecurityReport+0x190>
c0de9848:	466d      	mov	r5, sp
c0de984a:	2124      	movs	r1, #36	@ 0x24
c0de984c:	4628      	mov	r0, r5
c0de984e:	f001 fcaf 	bl	c0deb1b0 <__aeabi_memclr>
c0de9852:	481d      	ldr	r0, [pc, #116]	@ (c0de98c8 <displaySecurityReport+0x1fc>)
c0de9854:	4478      	add	r0, pc
c0de9856:	9006      	str	r0, [sp, #24]
c0de9858:	481c      	ldr	r0, [pc, #112]	@ (c0de98cc <displaySecurityReport+0x200>)
c0de985a:	4478      	add	r0, pc
c0de985c:	9004      	str	r0, [sp, #16]
c0de985e:	4629      	mov	r1, r5
c0de9860:	481b      	ldr	r0, [pc, #108]	@ (c0de98d0 <displaySecurityReport+0x204>)
c0de9862:	4478      	add	r0, pc
c0de9864:	9001      	str	r0, [sp, #4]
c0de9866:	4620      	mov	r0, r4
c0de9868:	f7fb fda2 	bl	c0de53b0 <nbgl_layoutAddContentCenter>
c0de986c:	2040      	movs	r0, #64	@ 0x40
c0de986e:	f8ad 0028 	strh.w	r0, [sp, #40]	@ 0x28
c0de9872:	2000      	movs	r0, #0
c0de9874:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de9878:	eb09 040b 	add.w	r4, r9, fp
c0de987c:	6e60      	ldr	r0, [r4, #100]	@ 0x64
c0de987e:	a90f      	add	r1, sp, #60	@ 0x3c
c0de9880:	f7fc f9fa 	bl	c0de5c78 <nbgl_layoutAddHeader>
c0de9884:	6e60      	ldr	r0, [r4, #100]	@ 0x64
c0de9886:	a909      	add	r1, sp, #36	@ 0x24
c0de9888:	f7fa fa62 	bl	c0de3d50 <nbgl_layoutAddExtendedFooter>
c0de988c:	eb09 000b 	add.w	r0, r9, fp
c0de9890:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0de9892:	f7fc fe53 	bl	c0de653c <nbgl_layoutDraw>
c0de9896:	f001 f84c 	bl	c0dea932 <nbgl_refresh>
c0de989a:	b01a      	add	sp, #104	@ 0x68
c0de989c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de98a0:	0000197c 	.word	0x0000197c
c0de98a4:	00001ac8 	.word	0x00001ac8
c0de98a8:	00004e90 	.word	0x00004e90
c0de98ac:	00004dfa 	.word	0x00004dfa
c0de98b0:	00004e0e 	.word	0x00004e0e
c0de98b4:	00002751 	.word	0x00002751
c0de98b8:	0000337b 	.word	0x0000337b
c0de98bc:	000031bc 	.word	0x000031bc
c0de98c0:	0000305b 	.word	0x0000305b
c0de98c4:	0000310c 	.word	0x0000310c
c0de98c8:	00003147 	.word	0x00003147
c0de98cc:	00003235 	.word	0x00003235
c0de98d0:	000024ed 	.word	0x000024ed
c0de98d4:	00003527 	.word	0x00003527
c0de98d8:	00002eaa 	.word	0x00002eaa
c0de98dc:	00003098 	.word	0x00003098

c0de98e0 <displayCustomizedSecurityReport>:
c0de98e0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de98e4:	b092      	sub	sp, #72	@ 0x48
c0de98e6:	4939      	ldr	r1, [pc, #228]	@ (c0de99cc <displayCustomizedSecurityReport+0xec>)
c0de98e8:	f10d 0a2c 	add.w	sl, sp, #44	@ 0x2c
c0de98ec:	4604      	mov	r4, r0
c0de98ee:	221c      	movs	r2, #28
c0de98f0:	4650      	mov	r0, sl
c0de98f2:	4479      	add	r1, pc
c0de98f4:	f001 fc52 	bl	c0deb19c <__aeabi_memcpy>
c0de98f8:	4835      	ldr	r0, [pc, #212]	@ (c0de99d0 <displayCustomizedSecurityReport+0xf0>)
c0de98fa:	ae07      	add	r6, sp, #28
c0de98fc:	4631      	mov	r1, r6
c0de98fe:	4478      	add	r0, pc
c0de9900:	e890 00ac 	ldmia.w	r0, {r2, r3, r5, r7}
c0de9904:	4830      	ldr	r0, [pc, #192]	@ (c0de99c8 <displayCustomizedSecurityReport+0xe8>)
c0de9906:	c1ac      	stmia	r1!, {r2, r3, r5, r7}
c0de9908:	eb09 0500 	add.w	r5, r9, r0
c0de990c:	4650      	mov	r0, sl
c0de990e:	f7f9 fc1b 	bl	c0de3148 <nbgl_layoutGet>
c0de9912:	6668      	str	r0, [r5, #100]	@ 0x64
c0de9914:	6821      	ldr	r1, [r4, #0]
c0de9916:	9109      	str	r1, [sp, #36]	@ 0x24
c0de9918:	4631      	mov	r1, r6
c0de991a:	f7fc f9ad 	bl	c0de5c78 <nbgl_layoutAddHeader>
c0de991e:	7920      	ldrb	r0, [r4, #4]
c0de9920:	b398      	cbz	r0, c0de998a <displayCustomizedSecurityReport+0xaa>
c0de9922:	2801      	cmp	r0, #1
c0de9924:	d03c      	beq.n	c0de99a0 <displayCustomizedSecurityReport+0xc0>
c0de9926:	2802      	cmp	r0, #2
c0de9928:	d143      	bne.n	c0de99b2 <displayCustomizedSecurityReport+0xd2>
c0de992a:	4f2a      	ldr	r7, [pc, #168]	@ (c0de99d4 <displayCustomizedSecurityReport+0xf4>)
c0de992c:	2600      	movs	r6, #0
c0de992e:	f04f 0a09 	mov.w	sl, #9
c0de9932:	f10d 0b04 	add.w	fp, sp, #4
c0de9936:	2500      	movs	r5, #0
c0de9938:	447f      	add	r7, pc
c0de993a:	7a20      	ldrb	r0, [r4, #8]
c0de993c:	4285      	cmp	r5, r0
c0de993e:	d238      	bcs.n	c0de99b2 <displayCustomizedSecurityReport+0xd2>
c0de9940:	f104 020c 	add.w	r2, r4, #12
c0de9944:	ca07      	ldmia	r2, {r0, r1, r2}
c0de9946:	f850 0025 	ldr.w	r0, [r0, r5, lsl #2]
c0de994a:	9002      	str	r0, [sp, #8]
c0de994c:	f851 0025 	ldr.w	r0, [r1, r5, lsl #2]
c0de9950:	f88d a018 	strb.w	sl, [sp, #24]
c0de9954:	f88d 6016 	strb.w	r6, [sp, #22]
c0de9958:	f88d 6014 	strb.w	r6, [sp, #20]
c0de995c:	4659      	mov	r1, fp
c0de995e:	e9cd 7003 	strd	r7, r0, [sp, #12]
c0de9962:	f105 0017 	add.w	r0, r5, #23
c0de9966:	f88d 0015 	strb.w	r0, [sp, #21]
c0de996a:	f852 0025 	ldr.w	r0, [r2, r5, lsl #2]
c0de996e:	9001      	str	r0, [sp, #4]
c0de9970:	4815      	ldr	r0, [pc, #84]	@ (c0de99c8 <displayCustomizedSecurityReport+0xe8>)
c0de9972:	eb09 0800 	add.w	r8, r9, r0
c0de9976:	f8d8 0064 	ldr.w	r0, [r8, #100]	@ 0x64
c0de997a:	f7fa fd92 	bl	c0de44a2 <nbgl_layoutAddTouchableBar>
c0de997e:	f8d8 0064 	ldr.w	r0, [r8, #100]	@ 0x64
c0de9982:	f7fc f84f 	bl	c0de5a24 <nbgl_layoutAddSeparationLine>
c0de9986:	3501      	adds	r5, #1
c0de9988:	e7d7      	b.n	c0de993a <displayCustomizedSecurityReport+0x5a>
c0de998a:	480f      	ldr	r0, [pc, #60]	@ (c0de99c8 <displayCustomizedSecurityReport+0xe8>)
c0de998c:	f104 0108 	add.w	r1, r4, #8
c0de9990:	4448      	add	r0, r9
c0de9992:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0de9994:	f7fb fd0c 	bl	c0de53b0 <nbgl_layoutAddContentCenter>
c0de9998:	2000      	movs	r0, #0
c0de999a:	f88d 001d 	strb.w	r0, [sp, #29]
c0de999e:	e008      	b.n	c0de99b2 <displayCustomizedSecurityReport+0xd2>
c0de99a0:	4809      	ldr	r0, [pc, #36]	@ (c0de99c8 <displayCustomizedSecurityReport+0xe8>)
c0de99a2:	f104 0108 	add.w	r1, r4, #8
c0de99a6:	4448      	add	r0, r9
c0de99a8:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0de99aa:	f7fb fd0a 	bl	c0de53c2 <nbgl_layoutAddQRCode>
c0de99ae:	6820      	ldr	r0, [r4, #0]
c0de99b0:	9009      	str	r0, [sp, #36]	@ 0x24
c0de99b2:	4805      	ldr	r0, [pc, #20]	@ (c0de99c8 <displayCustomizedSecurityReport+0xe8>)
c0de99b4:	4448      	add	r0, r9
c0de99b6:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0de99b8:	f7fc fdc0 	bl	c0de653c <nbgl_layoutDraw>
c0de99bc:	f000 ffb9 	bl	c0dea932 <nbgl_refresh>
c0de99c0:	b012      	add	sp, #72	@ 0x48
c0de99c2:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de99c6:	bf00      	nop
c0de99c8:	0000197c 	.word	0x0000197c
c0de99cc:	00004c7a 	.word	0x00004c7a
c0de99d0:	00004be2 	.word	0x00004be2
c0de99d4:	00002589 	.word	0x00002589

c0de99d8 <displayInfosListModal>:
c0de99d8:	b570      	push	{r4, r5, r6, lr}
c0de99da:	b098      	sub	sp, #96	@ 0x60
c0de99dc:	4606      	mov	r6, r0
c0de99de:	460c      	mov	r4, r1
c0de99e0:	a811      	add	r0, sp, #68	@ 0x44
c0de99e2:	491c      	ldr	r1, [pc, #112]	@ (c0de9a54 <displayInfosListModal+0x7c>)
c0de99e4:	4615      	mov	r5, r2
c0de99e6:	221c      	movs	r2, #28
c0de99e8:	4479      	add	r1, pc
c0de99ea:	f001 fbd7 	bl	c0deb19c <__aeabi_memcpy>
c0de99ee:	2008      	movs	r0, #8
c0de99f0:	f88d 0010 	strb.w	r0, [sp, #16]
c0de99f4:	2000      	movs	r0, #0
c0de99f6:	9003      	str	r0, [sp, #12]
c0de99f8:	4814      	ldr	r0, [pc, #80]	@ (c0de9a4c <displayInfosListModal+0x74>)
c0de99fa:	e9cd 6001 	strd	r6, r0, [sp, #4]
c0de99fe:	200f      	movs	r0, #15
c0de9a00:	2d00      	cmp	r5, #0
c0de9a02:	bf18      	it	ne
c0de9a04:	200e      	movne	r0, #14
c0de9a06:	f88d 0021 	strb.w	r0, [sp, #33]	@ 0x21
c0de9a0a:	e894 0007 	ldmia.w	r4, {r0, r1, r2}
c0de9a0e:	ab05      	add	r3, sp, #20
c0de9a10:	c307      	stmia	r3!, {r0, r1, r2}
c0de9a12:	7b20      	ldrb	r0, [r4, #12]
c0de9a14:	f88d 0020 	strb.w	r0, [sp, #32]
c0de9a18:	7ba0      	ldrb	r0, [r4, #14]
c0de9a1a:	4c0d      	ldr	r4, [pc, #52]	@ (c0de9a50 <displayInfosListModal+0x78>)
c0de9a1c:	f88d 0022 	strb.w	r0, [sp, #34]	@ 0x22
c0de9a20:	eb09 0004 	add.w	r0, r9, r4
c0de9a24:	6a00      	ldr	r0, [r0, #32]
c0de9a26:	b108      	cbz	r0, c0de9a2c <displayInfosListModal+0x54>
c0de9a28:	f7fd fec1 	bl	c0de77ae <nbgl_pageRelease>
c0de9a2c:	480a      	ldr	r0, [pc, #40]	@ (c0de9a58 <displayInfosListModal+0x80>)
c0de9a2e:	a911      	add	r1, sp, #68	@ 0x44
c0de9a30:	aa01      	add	r2, sp, #4
c0de9a32:	2301      	movs	r3, #1
c0de9a34:	4478      	add	r0, pc
c0de9a36:	f7fd fc91 	bl	c0de735c <nbgl_pageDrawGenericContentExt>
c0de9a3a:	eb09 0104 	add.w	r1, r9, r4
c0de9a3e:	6208      	str	r0, [r1, #32]
c0de9a40:	2002      	movs	r0, #2
c0de9a42:	f000 ff7b 	bl	c0dea93c <nbgl_refreshSpecial>
c0de9a46:	b018      	add	sp, #96	@ 0x60
c0de9a48:	bd70      	pop	{r4, r5, r6, pc}
c0de9a4a:	bf00      	nop
c0de9a4c:	00091300 	.word	0x00091300
c0de9a50:	00001c48 	.word	0x00001c48
c0de9a54:	00004ba0 	.word	0x00004ba0
c0de9a58:	ffffef75 	.word	0xffffef75

c0de9a5c <modalLayoutTouchCallback>:
c0de9a5c:	b570      	push	{r4, r5, r6, lr}
c0de9a5e:	2816      	cmp	r0, #22
c0de9a60:	d00a      	beq.n	c0de9a78 <modalLayoutTouchCallback+0x1c>
c0de9a62:	2815      	cmp	r0, #21
c0de9a64:	d117      	bne.n	c0de9a96 <modalLayoutTouchCallback+0x3a>
c0de9a66:	4833      	ldr	r0, [pc, #204]	@ (c0de9b34 <modalLayoutTouchCallback+0xd8>)
c0de9a68:	eb09 0400 	add.w	r4, r9, r0
c0de9a6c:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0de9a6e:	f7fc fd93 	bl	c0de6598 <nbgl_layoutRelease>
c0de9a72:	2000      	movs	r0, #0
c0de9a74:	6320      	str	r0, [r4, #48]	@ 0x30
c0de9a76:	e035      	b.n	c0de9ae4 <modalLayoutTouchCallback+0x88>
c0de9a78:	4c2d      	ldr	r4, [pc, #180]	@ (c0de9b30 <modalLayoutTouchCallback+0xd4>)
c0de9a7a:	eb09 0504 	add.w	r5, r9, r4
c0de9a7e:	6e68      	ldr	r0, [r5, #100]	@ 0x64
c0de9a80:	f7fc fd8a 	bl	c0de6598 <nbgl_layoutRelease>
c0de9a84:	f895 0068 	ldrb.w	r0, [r5, #104]	@ 0x68
c0de9a88:	2801      	cmp	r0, #1
c0de9a8a:	d817      	bhi.n	c0de9abc <modalLayoutTouchCallback+0x60>
c0de9a8c:	eb09 0004 	add.w	r0, r9, r4
c0de9a90:	2100      	movs	r1, #0
c0de9a92:	6641      	str	r1, [r0, #100]	@ 0x64
c0de9a94:	e026      	b.n	c0de9ae4 <modalLayoutTouchCallback+0x88>
c0de9a96:	f1a0 0417 	sub.w	r4, r0, #23
c0de9a9a:	2c04      	cmp	r4, #4
c0de9a9c:	d81a      	bhi.n	c0de9ad4 <modalLayoutTouchCallback+0x78>
c0de9a9e:	4d24      	ldr	r5, [pc, #144]	@ (c0de9b30 <modalLayoutTouchCallback+0xd4>)
c0de9aa0:	eb09 0605 	add.w	r6, r9, r5
c0de9aa4:	6e70      	ldr	r0, [r6, #100]	@ 0x64
c0de9aa6:	f7fc fd77 	bl	c0de6598 <nbgl_layoutRelease>
c0de9aaa:	2002      	movs	r0, #2
c0de9aac:	f886 0068 	strb.w	r0, [r6, #104]	@ 0x68
c0de9ab0:	6db0      	ldr	r0, [r6, #88]	@ 0x58
c0de9ab2:	6801      	ldr	r1, [r0, #0]
c0de9ab4:	b331      	cbz	r1, c0de9b04 <modalLayoutTouchCallback+0xa8>
c0de9ab6:	2001      	movs	r0, #1
c0de9ab8:	40a0      	lsls	r0, r4
c0de9aba:	e007      	b.n	c0de9acc <modalLayoutTouchCallback+0x70>
c0de9abc:	eb09 0004 	add.w	r0, r9, r4
c0de9ac0:	2101      	movs	r1, #1
c0de9ac2:	f880 1068 	strb.w	r1, [r0, #104]	@ 0x68
c0de9ac6:	6d81      	ldr	r1, [r0, #88]	@ 0x58
c0de9ac8:	6808      	ldr	r0, [r1, #0]
c0de9aca:	b188      	cbz	r0, c0de9af0 <modalLayoutTouchCallback+0x94>
c0de9acc:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de9ad0:	f7ff bdfc 	b.w	c0de96cc <displaySecurityReport>
c0de9ad4:	4816      	ldr	r0, [pc, #88]	@ (c0de9b30 <modalLayoutTouchCallback+0xd4>)
c0de9ad6:	eb09 0400 	add.w	r4, r9, r0
c0de9ada:	6ae0      	ldr	r0, [r4, #44]	@ 0x2c
c0de9adc:	f7fc fd5c 	bl	c0de6598 <nbgl_layoutRelease>
c0de9ae0:	2000      	movs	r0, #0
c0de9ae2:	62e0      	str	r0, [r4, #44]	@ 0x2c
c0de9ae4:	f000 ff4d 	bl	c0dea982 <nbgl_screenRedraw>
c0de9ae8:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de9aec:	f000 bf21 	b.w	c0dea932 <nbgl_refresh>
c0de9af0:	eb09 0004 	add.w	r0, r9, r4
c0de9af4:	2214      	movs	r2, #20
c0de9af6:	f890 0069 	ldrb.w	r0, [r0, #105]	@ 0x69
c0de9afa:	2800      	cmp	r0, #0
c0de9afc:	bf08      	it	eq
c0de9afe:	2218      	moveq	r2, #24
c0de9b00:	5888      	ldr	r0, [r1, r2]
c0de9b02:	e010      	b.n	c0de9b26 <modalLayoutTouchCallback+0xca>
c0de9b04:	eb09 0105 	add.w	r1, r9, r5
c0de9b08:	2214      	movs	r2, #20
c0de9b0a:	f891 1069 	ldrb.w	r1, [r1, #105]	@ 0x69
c0de9b0e:	2900      	cmp	r1, #0
c0de9b10:	bf08      	it	eq
c0de9b12:	2218      	moveq	r2, #24
c0de9b14:	5880      	ldr	r0, [r0, r2]
c0de9b16:	7901      	ldrb	r1, [r0, #4]
c0de9b18:	2902      	cmp	r1, #2
c0de9b1a:	bf18      	it	ne
c0de9b1c:	bd70      	popne	{r4, r5, r6, pc}
c0de9b1e:	6980      	ldr	r0, [r0, #24]
c0de9b20:	212c      	movs	r1, #44	@ 0x2c
c0de9b22:	fb04 0001 	mla	r0, r4, r1, r0
c0de9b26:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de9b2a:	f7ff bed9 	b.w	c0de98e0 <displayCustomizedSecurityReport>
c0de9b2e:	bf00      	nop
c0de9b30:	0000197c 	.word	0x0000197c
c0de9b34:	00001a90 	.word	0x00001a90

c0de9b38 <displayDetailsPage>:
c0de9b38:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de9b3c:	b09b      	sub	sp, #108	@ 0x6c
c0de9b3e:	f8df a160 	ldr.w	sl, [pc, #352]	@ c0de9ca0 <displayDetailsPage+0x168>
c0de9b42:	4604      	mov	r4, r0
c0de9b44:	f88d 004c 	strb.w	r0, [sp, #76]	@ 0x4c
c0de9b48:	2000      	movs	r0, #0
c0de9b4a:	460e      	mov	r6, r1
c0de9b4c:	4953      	ldr	r1, [pc, #332]	@ (c0de9c9c <displayDetailsPage+0x164>)
c0de9b4e:	9018      	str	r0, [sp, #96]	@ 0x60
c0de9b50:	f88d 0058 	strb.w	r0, [sp, #88]	@ 0x58
c0de9b54:	9015      	str	r0, [sp, #84]	@ 0x54
c0de9b56:	f44f 6010 	mov.w	r0, #2304	@ 0x900
c0de9b5a:	eb09 050a 	add.w	r5, r9, sl
c0de9b5e:	f8ad 0050 	strh.w	r0, [sp, #80]	@ 0x50
c0de9b62:	f44f 7081 	mov.w	r0, #258	@ 0x102
c0de9b66:	9117      	str	r1, [sp, #92]	@ 0x5c
c0de9b68:	2140      	movs	r1, #64	@ 0x40
c0de9b6a:	f895 8030 	ldrb.w	r8, [r5, #48]	@ 0x30
c0de9b6e:	f8ad 004e 	strh.w	r0, [sp, #78]	@ 0x4e
c0de9b72:	f88d 804d 	strb.w	r8, [sp, #77]	@ 0x4d
c0de9b76:	a803      	add	r0, sp, #12
c0de9b78:	f001 fb1a 	bl	c0deb1b0 <__aeabi_memclr>
c0de9b7c:	2001      	movs	r0, #1
c0de9b7e:	f88d 0028 	strb.w	r0, [sp, #40]	@ 0x28
c0de9b82:	f88d 0024 	strb.w	r0, [sp, #36]	@ 0x24
c0de9b86:	f105 0040 	add.w	r0, r5, #64	@ 0x40
c0de9b8a:	9007      	str	r0, [sp, #28]
c0de9b8c:	2004      	movs	r0, #4
c0de9b8e:	f88d 0018 	strb.w	r0, [sp, #24]
c0de9b92:	f895 0033 	ldrb.w	r0, [r5, #51]	@ 0x33
c0de9b96:	f88d 0029 	strb.w	r0, [sp, #41]	@ 0x29
c0de9b9a:	6a28      	ldr	r0, [r5, #32]
c0de9b9c:	b108      	cbz	r0, c0de9ba2 <displayDetailsPage+0x6a>
c0de9b9e:	f7fd fe06 	bl	c0de77ae <nbgl_pageRelease>
c0de9ba2:	eb09 000a 	add.w	r0, r9, sl
c0de9ba6:	6b41      	ldr	r1, [r0, #52]	@ 0x34
c0de9ba8:	6401      	str	r1, [r0, #64]	@ 0x40
c0de9baa:	f890 0031 	ldrb.w	r0, [r0, #49]	@ 0x31
c0de9bae:	42a0      	cmp	r0, r4
c0de9bb0:	d207      	bcs.n	c0de9bc2 <displayDetailsPage+0x8a>
c0de9bb2:	2501      	movs	r5, #1
c0de9bb4:	eb09 000a 	add.w	r0, r9, sl
c0de9bb8:	2e00      	cmp	r6, #0
c0de9bba:	bf18      	it	ne
c0de9bbc:	2502      	movne	r5, #2
c0de9bbe:	6bc6      	ldr	r6, [r0, #60]	@ 0x3c
c0de9bc0:	e022      	b.n	c0de9c08 <displayDetailsPage+0xd0>
c0de9bc2:	eb09 000a 	add.w	r0, r9, sl
c0de9bc6:	2500      	movs	r5, #0
c0de9bc8:	f10d 076a 	add.w	r7, sp, #106	@ 0x6a
c0de9bcc:	6b86      	ldr	r6, [r0, #56]	@ 0x38
c0de9bce:	42a5      	cmp	r5, r4
c0de9bd0:	d219      	bcs.n	c0de9c06 <displayDetailsPage+0xce>
c0de9bd2:	200c      	movs	r0, #12
c0de9bd4:	4631      	mov	r1, r6
c0de9bd6:	f000 fa1f 	bl	c0dea018 <OUTLINED_FUNCTION_11>
c0de9bda:	280c      	cmp	r0, #12
c0de9bdc:	d311      	bcc.n	c0de9c02 <displayDetailsPage+0xca>
c0de9bde:	eb09 000a 	add.w	r0, r9, sl
c0de9be2:	4631      	mov	r1, r6
c0de9be4:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de9be8:	230b      	movs	r3, #11
c0de9bea:	f890 0033 	ldrb.w	r0, [r0, #51]	@ 0x33
c0de9bee:	e9cd 7000 	strd	r7, r0, [sp]
c0de9bf2:	200c      	movs	r0, #12
c0de9bf4:	f000 ff01 	bl	c0dea9fa <nbgl_getTextMaxLenInNbLines>
c0de9bf8:	f8bd 006a 	ldrh.w	r0, [sp, #106]	@ 0x6a
c0de9bfc:	3803      	subs	r0, #3
c0de9bfe:	b280      	uxth	r0, r0
c0de9c00:	4406      	add	r6, r0
c0de9c02:	3501      	adds	r5, #1
c0de9c04:	e7e3      	b.n	c0de9bce <displayDetailsPage+0x96>
c0de9c06:	2502      	movs	r5, #2
c0de9c08:	eb09 000a 	add.w	r0, r9, sl
c0de9c0c:	4631      	mov	r1, r6
c0de9c0e:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de9c12:	f890 3033 	ldrb.w	r3, [r0, #51]	@ 0x33
c0de9c16:	f880 4031 	strb.w	r4, [r0, #49]	@ 0x31
c0de9c1a:	6446      	str	r6, [r0, #68]	@ 0x44
c0de9c1c:	200c      	movs	r0, #12
c0de9c1e:	f000 fee2 	bl	c0dea9e6 <nbgl_getTextNbLinesInWidth>
c0de9c22:	280c      	cmp	r0, #12
c0de9c24:	d31e      	bcc.n	c0de9c64 <displayDetailsPage+0x12c>
c0de9c26:	eb09 040a 	add.w	r4, r9, sl
c0de9c2a:	f10d 026a 	add.w	r2, sp, #106	@ 0x6a
c0de9c2e:	230b      	movs	r3, #11
c0de9c30:	260b      	movs	r6, #11
c0de9c32:	f894 0033 	ldrb.w	r0, [r4, #51]	@ 0x33
c0de9c36:	6c61      	ldr	r1, [r4, #68]	@ 0x44
c0de9c38:	e9cd 2000 	strd	r2, r0, [sp]
c0de9c3c:	200c      	movs	r0, #12
c0de9c3e:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de9c42:	f000 feda 	bl	c0dea9fa <nbgl_getTextMaxLenInNbLines>
c0de9c46:	f8bd 106a 	ldrh.w	r1, [sp, #106]	@ 0x6a
c0de9c4a:	6c60      	ldr	r0, [r4, #68]	@ 0x44
c0de9c4c:	1eca      	subs	r2, r1, #3
c0de9c4e:	4401      	add	r1, r0
c0de9c50:	f811 3b01 	ldrb.w	r3, [r1], #1
c0de9c54:	b292      	uxth	r2, r2
c0de9c56:	2b0a      	cmp	r3, #10
c0de9c58:	bf18      	it	ne
c0de9c5a:	1881      	addne	r1, r0, r2
c0de9c5c:	63e1      	str	r1, [r4, #60]	@ 0x3c
c0de9c5e:	f88d 6026 	strb.w	r6, [sp, #38]	@ 0x26
c0de9c62:	e005      	b.n	c0de9c70 <displayDetailsPage+0x138>
c0de9c64:	2100      	movs	r1, #0
c0de9c66:	eb09 000a 	add.w	r0, r9, sl
c0de9c6a:	63c1      	str	r1, [r0, #60]	@ 0x3c
c0de9c6c:	f88d 1026 	strb.w	r1, [sp, #38]	@ 0x26
c0de9c70:	f1b8 0f01 	cmp.w	r8, #1
c0de9c74:	d102      	bne.n	c0de9c7c <displayDetailsPage+0x144>
c0de9c76:	480b      	ldr	r0, [pc, #44]	@ (c0de9ca4 <displayDetailsPage+0x16c>)
c0de9c78:	4478      	add	r0, pc
c0de9c7a:	9018      	str	r0, [sp, #96]	@ 0x60
c0de9c7c:	480a      	ldr	r0, [pc, #40]	@ (c0de9ca8 <displayDetailsPage+0x170>)
c0de9c7e:	a913      	add	r1, sp, #76	@ 0x4c
c0de9c80:	aa03      	add	r2, sp, #12
c0de9c82:	2301      	movs	r3, #1
c0de9c84:	4478      	add	r0, pc
c0de9c86:	f7fd fb69 	bl	c0de735c <nbgl_pageDrawGenericContentExt>
c0de9c8a:	eb09 010a 	add.w	r1, r9, sl
c0de9c8e:	6208      	str	r0, [r1, #32]
c0de9c90:	4628      	mov	r0, r5
c0de9c92:	f000 fe53 	bl	c0dea93c <nbgl_refreshSpecial>
c0de9c96:	b01b      	add	sp, #108	@ 0x6c
c0de9c98:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de9c9c:	03000101 	.word	0x03000101
c0de9ca0:	00001c48 	.word	0x00001c48
c0de9ca4:	00002cec 	.word	0x00002cec
c0de9ca8:	ffffed25 	.word	0xffffed25

c0de9cac <displayTagValueListModalPage>:
c0de9cac:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de9cb0:	b098      	sub	sp, #96	@ 0x60
c0de9cb2:	4e44      	ldr	r6, [pc, #272]	@ (c0de9dc4 <displayTagValueListModalPage+0x118>)
c0de9cb4:	4605      	mov	r5, r0
c0de9cb6:	f88d 0044 	strb.w	r0, [sp, #68]	@ 0x44
c0de9cba:	2000      	movs	r0, #0
c0de9cbc:	4688      	mov	r8, r1
c0de9cbe:	4940      	ldr	r1, [pc, #256]	@ (c0de9dc0 <displayTagValueListModalPage+0x114>)
c0de9cc0:	9016      	str	r0, [sp, #88]	@ 0x58
c0de9cc2:	f88d 0050 	strb.w	r0, [sp, #80]	@ 0x50
c0de9cc6:	9013      	str	r0, [sp, #76]	@ 0x4c
c0de9cc8:	f44f 6010 	mov.w	r0, #2304	@ 0x900
c0de9ccc:	eb09 0406 	add.w	r4, r9, r6
c0de9cd0:	f8ad 0048 	strh.w	r0, [sp, #72]	@ 0x48
c0de9cd4:	f44f 7081 	mov.w	r0, #258	@ 0x102
c0de9cd8:	9115      	str	r1, [sp, #84]	@ 0x54
c0de9cda:	2140      	movs	r1, #64	@ 0x40
c0de9cdc:	f894 7030 	ldrb.w	r7, [r4, #48]	@ 0x30
c0de9ce0:	f8ad 0046 	strh.w	r0, [sp, #70]	@ 0x46
c0de9ce4:	f88d 7045 	strb.w	r7, [sp, #69]	@ 0x45
c0de9ce8:	a801      	add	r0, sp, #4
c0de9cea:	f001 fa61 	bl	c0deb1b0 <__aeabi_memclr>
c0de9cee:	2001      	movs	r0, #1
c0de9cf0:	f894 1031 	ldrb.w	r1, [r4, #49]	@ 0x31
c0de9cf4:	f894 2033 	ldrb.w	r2, [r4, #51]	@ 0x33
c0de9cf8:	f88d 0020 	strb.w	r0, [sp, #32]
c0de9cfc:	2004      	movs	r0, #4
c0de9cfe:	42a9      	cmp	r1, r5
c0de9d00:	f88d 0010 	strb.w	r0, [sp, #16]
c0de9d04:	f88d 2021 	strb.w	r2, [sp, #33]	@ 0x21
c0de9d08:	d91b      	bls.n	c0de9d42 <displayTagValueListModalPage+0x96>
c0de9d0a:	1c69      	adds	r1, r5, #1
c0de9d0c:	eb09 0306 	add.w	r3, r9, r6
c0de9d10:	ea00 0281 	and.w	r2, r0, r1, lsl #2
c0de9d14:	b2c9      	uxtb	r1, r1
c0de9d16:	f103 0450 	add.w	r4, r3, #80	@ 0x50
c0de9d1a:	ea00 0085 	and.w	r0, r0, r5, lsl #2
c0de9d1e:	0849      	lsrs	r1, r1, #1
c0de9d20:	5c61      	ldrb	r1, [r4, r1]
c0de9d22:	40d1      	lsrs	r1, r2
c0de9d24:	f893 2032 	ldrb.w	r2, [r3, #50]	@ 0x32
c0de9d28:	f001 0107 	and.w	r1, r1, #7
c0de9d2c:	1a52      	subs	r2, r2, r1
c0de9d2e:	0869      	lsrs	r1, r5, #1
c0de9d30:	5c61      	ldrb	r1, [r4, r1]
c0de9d32:	f883 2032 	strb.w	r2, [r3, #50]	@ 0x32
c0de9d36:	fa21 f000 	lsr.w	r0, r1, r0
c0de9d3a:	f000 0107 	and.w	r1, r0, #7
c0de9d3e:	1a50      	subs	r0, r2, r1
c0de9d40:	e00d      	b.n	c0de9d5e <displayTagValueListModalPage+0xb2>
c0de9d42:	eb09 0206 	add.w	r2, r9, r6
c0de9d46:	ea00 0085 	and.w	r0, r0, r5, lsl #2
c0de9d4a:	eb02 0155 	add.w	r1, r2, r5, lsr #1
c0de9d4e:	f891 1050 	ldrb.w	r1, [r1, #80]	@ 0x50
c0de9d52:	fa21 f000 	lsr.w	r0, r1, r0
c0de9d56:	f000 0107 	and.w	r1, r0, #7
c0de9d5a:	f892 0032 	ldrb.w	r0, [r2, #50]	@ 0x32
c0de9d5e:	4b1a      	ldr	r3, [pc, #104]	@ (c0de9dc8 <displayTagValueListModalPage+0x11c>)
c0de9d60:	eb09 0206 	add.w	r2, r9, r6
c0de9d64:	2f01      	cmp	r7, #1
c0de9d66:	f882 5031 	strb.w	r5, [r2, #49]	@ 0x31
c0de9d6a:	444b      	add	r3, r9
c0de9d6c:	6b9b      	ldr	r3, [r3, #56]	@ 0x38
c0de9d6e:	681b      	ldr	r3, [r3, #0]
c0de9d70:	f88d 101c 	strb.w	r1, [sp, #28]
c0de9d74:	4401      	add	r1, r0
c0de9d76:	b2c0      	uxtb	r0, r0
c0de9d78:	f882 1032 	strb.w	r1, [r2, #50]	@ 0x32
c0de9d7c:	eb03 1000 	add.w	r0, r3, r0, lsl #4
c0de9d80:	9005      	str	r0, [sp, #20]
c0de9d82:	d102      	bne.n	c0de9d8a <displayTagValueListModalPage+0xde>
c0de9d84:	4811      	ldr	r0, [pc, #68]	@ (c0de9dcc <displayTagValueListModalPage+0x120>)
c0de9d86:	4478      	add	r0, pc
c0de9d88:	9016      	str	r0, [sp, #88]	@ 0x58
c0de9d8a:	eb09 0006 	add.w	r0, r9, r6
c0de9d8e:	6a00      	ldr	r0, [r0, #32]
c0de9d90:	b108      	cbz	r0, c0de9d96 <displayTagValueListModalPage+0xea>
c0de9d92:	f7fd fd0c 	bl	c0de77ae <nbgl_pageRelease>
c0de9d96:	480e      	ldr	r0, [pc, #56]	@ (c0de9dd0 <displayTagValueListModalPage+0x124>)
c0de9d98:	a911      	add	r1, sp, #68	@ 0x44
c0de9d9a:	aa01      	add	r2, sp, #4
c0de9d9c:	2301      	movs	r3, #1
c0de9d9e:	2501      	movs	r5, #1
c0de9da0:	4478      	add	r0, pc
c0de9da2:	f7fd fadb 	bl	c0de735c <nbgl_pageDrawGenericContentExt>
c0de9da6:	eb09 0106 	add.w	r1, r9, r6
c0de9daa:	f1b8 0f00 	cmp.w	r8, #0
c0de9dae:	6208      	str	r0, [r1, #32]
c0de9db0:	bf18      	it	ne
c0de9db2:	2502      	movne	r5, #2
c0de9db4:	4628      	mov	r0, r5
c0de9db6:	f000 fdc1 	bl	c0dea93c <nbgl_refreshSpecial>
c0de9dba:	b018      	add	sp, #96	@ 0x60
c0de9dbc:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de9dc0:	04000101 	.word	0x04000101
c0de9dc4:	00001c48 	.word	0x00001c48
c0de9dc8:	0000197c 	.word	0x0000197c
c0de9dcc:	00002bde 	.word	0x00002bde
c0de9dd0:	ffffec09 	.word	0xffffec09

c0de9dd4 <bundleNavReviewChoice>:
c0de9dd4:	b120      	cbz	r0, c0de9de0 <bundleNavReviewChoice+0xc>
c0de9dd6:	4806      	ldr	r0, [pc, #24]	@ (c0de9df0 <bundleNavReviewChoice+0x1c>)
c0de9dd8:	4448      	add	r0, r9
c0de9dda:	6a41      	ldr	r1, [r0, #36]	@ 0x24
c0de9ddc:	2001      	movs	r0, #1
c0de9dde:	4708      	bx	r1
c0de9de0:	4803      	ldr	r0, [pc, #12]	@ (c0de9df0 <bundleNavReviewChoice+0x1c>)
c0de9de2:	4448      	add	r0, r9
c0de9de4:	6a00      	ldr	r0, [r0, #32]
c0de9de6:	4903      	ldr	r1, [pc, #12]	@ (c0de9df4 <bundleNavReviewChoice+0x20>)
c0de9de8:	4479      	add	r1, pc
c0de9dea:	f000 b863 	b.w	c0de9eb4 <bundleNavReviewAskRejectionConfirmation>
c0de9dee:	bf00      	nop
c0de9df0:	00001cc4 	.word	0x00001cc4
c0de9df4:	0000011d 	.word	0x0000011d

c0de9df8 <initWarningTipBox>:
c0de9df8:	4923      	ldr	r1, [pc, #140]	@ (c0de9e88 <initWarningTipBox+0x90>)
c0de9dfa:	eb09 0201 	add.w	r2, r9, r1
c0de9dfe:	6d92      	ldr	r2, [r2, #88]	@ 0x58
c0de9e00:	b15a      	cbz	r2, c0de9e1a <initWarningTipBox+0x22>
c0de9e02:	6812      	ldr	r2, [r2, #0]
c0de9e04:	07d3      	lsls	r3, r2, #31
c0de9e06:	d111      	bne.n	c0de9e2c <initWarningTipBox+0x34>
c0de9e08:	0753      	lsls	r3, r2, #29
c0de9e0a:	d415      	bmi.n	c0de9e38 <initWarningTipBox+0x40>
c0de9e0c:	0793      	lsls	r3, r2, #30
c0de9e0e:	d419      	bmi.n	c0de9e44 <initWarningTipBox+0x4c>
c0de9e10:	f002 0310 	and.w	r3, r2, #16
c0de9e14:	0712      	lsls	r2, r2, #28
c0de9e16:	d42c      	bmi.n	c0de9e72 <initWarningTipBox+0x7a>
c0de9e18:	bb9b      	cbnz	r3, c0de9e82 <initWarningTipBox+0x8a>
c0de9e1a:	b348      	cbz	r0, c0de9e70 <initWarningTipBox+0x78>
c0de9e1c:	491b      	ldr	r1, [pc, #108]	@ (c0de9e8c <initWarningTipBox+0x94>)
c0de9e1e:	2200      	movs	r2, #0
c0de9e20:	4449      	add	r1, r9
c0de9e22:	620a      	str	r2, [r1, #32]
c0de9e24:	6842      	ldr	r2, [r0, #4]
c0de9e26:	62ca      	str	r2, [r1, #44]	@ 0x2c
c0de9e28:	6800      	ldr	r0, [r0, #0]
c0de9e2a:	e01b      	b.n	c0de9e64 <initWarningTipBox+0x6c>
c0de9e2c:	06d0      	lsls	r0, r2, #27
c0de9e2e:	4a18      	ldr	r2, [pc, #96]	@ (c0de9e90 <initWarningTipBox+0x98>)
c0de9e30:	4818      	ldr	r0, [pc, #96]	@ (c0de9e94 <initWarningTipBox+0x9c>)
c0de9e32:	447a      	add	r2, pc
c0de9e34:	4478      	add	r0, pc
c0de9e36:	e00a      	b.n	c0de9e4e <initWarningTipBox+0x56>
c0de9e38:	06d0      	lsls	r0, r2, #27
c0de9e3a:	4a17      	ldr	r2, [pc, #92]	@ (c0de9e98 <initWarningTipBox+0xa0>)
c0de9e3c:	4817      	ldr	r0, [pc, #92]	@ (c0de9e9c <initWarningTipBox+0xa4>)
c0de9e3e:	447a      	add	r2, pc
c0de9e40:	4478      	add	r0, pc
c0de9e42:	e004      	b.n	c0de9e4e <initWarningTipBox+0x56>
c0de9e44:	06d0      	lsls	r0, r2, #27
c0de9e46:	4a16      	ldr	r2, [pc, #88]	@ (c0de9ea0 <initWarningTipBox+0xa8>)
c0de9e48:	4816      	ldr	r0, [pc, #88]	@ (c0de9ea4 <initWarningTipBox+0xac>)
c0de9e4a:	447a      	add	r2, pc
c0de9e4c:	4478      	add	r0, pc
c0de9e4e:	bf58      	it	pl
c0de9e50:	4610      	movpl	r0, r2
c0de9e52:	4449      	add	r1, r9
c0de9e54:	2201      	movs	r2, #1
c0de9e56:	f881 2021 	strb.w	r2, [r1, #33]	@ 0x21
c0de9e5a:	490c      	ldr	r1, [pc, #48]	@ (c0de9e8c <initWarningTipBox+0x94>)
c0de9e5c:	2200      	movs	r2, #0
c0de9e5e:	4449      	add	r1, r9
c0de9e60:	620a      	str	r2, [r1, #32]
c0de9e62:	62ca      	str	r2, [r1, #44]	@ 0x2c
c0de9e64:	4909      	ldr	r1, [pc, #36]	@ (c0de9e8c <initWarningTipBox+0x94>)
c0de9e66:	f640 1212 	movw	r2, #2322	@ 0x912
c0de9e6a:	4449      	add	r1, r9
c0de9e6c:	860a      	strh	r2, [r1, #48]	@ 0x30
c0de9e6e:	6288      	str	r0, [r1, #40]	@ 0x28
c0de9e70:	4770      	bx	lr
c0de9e72:	4a0d      	ldr	r2, [pc, #52]	@ (c0de9ea8 <initWarningTipBox+0xb0>)
c0de9e74:	480d      	ldr	r0, [pc, #52]	@ (c0de9eac <initWarningTipBox+0xb4>)
c0de9e76:	2b00      	cmp	r3, #0
c0de9e78:	4478      	add	r0, pc
c0de9e7a:	447a      	add	r2, pc
c0de9e7c:	bf08      	it	eq
c0de9e7e:	4610      	moveq	r0, r2
c0de9e80:	e7e7      	b.n	c0de9e52 <initWarningTipBox+0x5a>
c0de9e82:	480b      	ldr	r0, [pc, #44]	@ (c0de9eb0 <initWarningTipBox+0xb8>)
c0de9e84:	4478      	add	r0, pc
c0de9e86:	e7e4      	b.n	c0de9e52 <initWarningTipBox+0x5a>
c0de9e88:	0000197c 	.word	0x0000197c
c0de9e8c:	000019e8 	.word	0x000019e8
c0de9e90:	000028bc 	.word	0x000028bc
c0de9e94:	000029a2 	.word	0x000029a2
c0de9e98:	00003060 	.word	0x00003060
c0de9e9c:	0000292b 	.word	0x0000292b
c0de9ea0:	0000309b 	.word	0x0000309b
c0de9ea4:	00002e07 	.word	0x00002e07
c0de9ea8:	00002e0a 	.word	0x00002e0a
c0de9eac:	00003086 	.word	0x00003086
c0de9eb0:	00002cc5 	.word	0x00002cc5

c0de9eb4 <bundleNavReviewAskRejectionConfirmation>:
c0de9eb4:	f020 00f0 	bic.w	r0, r0, #240	@ 0xf0
c0de9eb8:	b130      	cbz	r0, c0de9ec8 <bundleNavReviewAskRejectionConfirmation+0x14>
c0de9eba:	2801      	cmp	r0, #1
c0de9ebc:	d109      	bne.n	c0de9ed2 <bundleNavReviewAskRejectionConfirmation+0x1e>
c0de9ebe:	4b0d      	ldr	r3, [pc, #52]	@ (c0de9ef4 <bundleNavReviewAskRejectionConfirmation+0x40>)
c0de9ec0:	480d      	ldr	r0, [pc, #52]	@ (c0de9ef8 <bundleNavReviewAskRejectionConfirmation+0x44>)
c0de9ec2:	447b      	add	r3, pc
c0de9ec4:	4478      	add	r0, pc
c0de9ec6:	e008      	b.n	c0de9eda <bundleNavReviewAskRejectionConfirmation+0x26>
c0de9ec8:	4b08      	ldr	r3, [pc, #32]	@ (c0de9eec <bundleNavReviewAskRejectionConfirmation+0x38>)
c0de9eca:	4809      	ldr	r0, [pc, #36]	@ (c0de9ef0 <bundleNavReviewAskRejectionConfirmation+0x3c>)
c0de9ecc:	447b      	add	r3, pc
c0de9ece:	4478      	add	r0, pc
c0de9ed0:	e003      	b.n	c0de9eda <bundleNavReviewAskRejectionConfirmation+0x26>
c0de9ed2:	4b0a      	ldr	r3, [pc, #40]	@ (c0de9efc <bundleNavReviewAskRejectionConfirmation+0x48>)
c0de9ed4:	480a      	ldr	r0, [pc, #40]	@ (c0de9f00 <bundleNavReviewAskRejectionConfirmation+0x4c>)
c0de9ed6:	447b      	add	r3, pc
c0de9ed8:	4478      	add	r0, pc
c0de9eda:	b5e0      	push	{r5, r6, r7, lr}
c0de9edc:	9100      	str	r1, [sp, #0]
c0de9ede:	2100      	movs	r1, #0
c0de9ee0:	4a08      	ldr	r2, [pc, #32]	@ (c0de9f04 <bundleNavReviewAskRejectionConfirmation+0x50>)
c0de9ee2:	447a      	add	r2, pc
c0de9ee4:	f7fe fd38 	bl	c0de8958 <nbgl_useCaseConfirm>
c0de9ee8:	bd8c      	pop	{r2, r3, r7, pc}
c0de9eea:	bf00      	nop
c0de9eec:	00002a56 	.word	0x00002a56
c0de9ef0:	00002889 	.word	0x00002889
c0de9ef4:	00002d7e 	.word	0x00002d7e
c0de9ef8:	00003159 	.word	0x00003159
c0de9efc:	000028eb 	.word	0x000028eb
c0de9f00:	00002dfa 	.word	0x00002dfa
c0de9f04:	00002bd5 	.word	0x00002bd5

c0de9f08 <bundleNavReviewConfirmRejection>:
c0de9f08:	4801      	ldr	r0, [pc, #4]	@ (c0de9f10 <bundleNavReviewConfirmRejection+0x8>)
c0de9f0a:	f000 b881 	b.w	c0dea010 <OUTLINED_FUNCTION_9>
c0de9f0e:	bf00      	nop
c0de9f10:	00001cc4 	.word	0x00001cc4

c0de9f14 <layoutTouchCallback>:
c0de9f14:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de9f16:	b087      	sub	sp, #28
c0de9f18:	2811      	cmp	r0, #17
c0de9f1a:	d017      	beq.n	c0de9f4c <layoutTouchCallback+0x38>
c0de9f1c:	2814      	cmp	r0, #20
c0de9f1e:	d142      	bne.n	c0de9fa6 <layoutTouchCallback+0x92>
c0de9f20:	b1e9      	cbz	r1, c0de9f5e <layoutTouchCallback+0x4a>
c0de9f22:	4922      	ldr	r1, [pc, #136]	@ (c0de9fac <layoutTouchCallback+0x98>)
c0de9f24:	2400      	movs	r4, #0
c0de9f26:	eb09 0201 	add.w	r2, r9, r1
c0de9f2a:	eb09 0501 	add.w	r5, r9, r1
c0de9f2e:	f882 4069 	strb.w	r4, [r2, #105]	@ 0x69
c0de9f32:	6c10      	ldr	r0, [r2, #64]	@ 0x40
c0de9f34:	f892 203c 	ldrb.w	r2, [r2, #60]	@ 0x3c
c0de9f38:	b33a      	cbz	r2, c0de9f8a <layoutTouchCallback+0x76>
c0de9f3a:	f105 0348 	add.w	r3, r5, #72	@ 0x48
c0de9f3e:	6ded      	ldr	r5, [r5, #92]	@ 0x5c
c0de9f40:	cb0e      	ldmia	r3, {r1, r2, r3}
c0de9f42:	e9cd 5400 	strd	r5, r4, [sp]
c0de9f46:	f7fe fff5 	bl	c0de8f34 <useCaseReviewStreamingStart>
c0de9f4a:	e02c      	b.n	c0de9fa6 <layoutTouchCallback+0x92>
c0de9f4c:	4a17      	ldr	r2, [pc, #92]	@ (c0de9fac <layoutTouchCallback+0x98>)
c0de9f4e:	f000 f84a 	bl	c0de9fe6 <OUTLINED_FUNCTION_4>
c0de9f52:	d00c      	beq.n	c0de9f6e <layoutTouchCallback+0x5a>
c0de9f54:	b007      	add	sp, #28
c0de9f56:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de9f5a:	f7ff bbb7 	b.w	c0de96cc <displaySecurityReport>
c0de9f5e:	4813      	ldr	r0, [pc, #76]	@ (c0de9fac <layoutTouchCallback+0x98>)
c0de9f60:	4448      	add	r0, r9
c0de9f62:	6dc1      	ldr	r1, [r0, #92]	@ 0x5c
c0de9f64:	2000      	movs	r0, #0
c0de9f66:	b007      	add	sp, #28
c0de9f68:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de9f6c:	4708      	bx	r1
c0de9f6e:	eb09 0002 	add.w	r0, r9, r2
c0de9f72:	2214      	movs	r2, #20
c0de9f74:	f890 0069 	ldrb.w	r0, [r0, #105]	@ 0x69
c0de9f78:	2800      	cmp	r0, #0
c0de9f7a:	bf08      	it	eq
c0de9f7c:	2218      	moveq	r2, #24
c0de9f7e:	5888      	ldr	r0, [r1, r2]
c0de9f80:	b007      	add	sp, #28
c0de9f82:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de9f86:	f7ff bcab 	b.w	c0de98e0 <displayCustomizedSecurityReport>
c0de9f8a:	f105 0744 	add.w	r7, r5, #68	@ 0x44
c0de9f8e:	6ded      	ldr	r5, [r5, #92]	@ 0x5c
c0de9f90:	cfce      	ldmia	r7, {r1, r2, r3, r6, r7}
c0de9f92:	9405      	str	r4, [sp, #20]
c0de9f94:	e9cd 6700 	strd	r6, r7, [sp]
c0de9f98:	e9cd 5403 	strd	r5, r4, [sp, #12]
c0de9f9c:	4c04      	ldr	r4, [pc, #16]	@ (c0de9fb0 <layoutTouchCallback+0x9c>)
c0de9f9e:	444c      	add	r4, r9
c0de9fa0:	9402      	str	r4, [sp, #8]
c0de9fa2:	f7fe fddf 	bl	c0de8b64 <useCaseReview>
c0de9fa6:	b007      	add	sp, #28
c0de9fa8:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de9faa:	bf00      	nop
c0de9fac:	0000197c 	.word	0x0000197c
c0de9fb0:	00001cc4 	.word	0x00001cc4

c0de9fb4 <bundleNavReviewStreamingConfirmRejection>:
c0de9fb4:	4801      	ldr	r0, [pc, #4]	@ (c0de9fbc <bundleNavReviewStreamingConfirmRejection+0x8>)
c0de9fb6:	f000 b82b 	b.w	c0dea010 <OUTLINED_FUNCTION_9>
c0de9fba:	bf00      	nop
c0de9fbc:	00001cc4 	.word	0x00001cc4

c0de9fc0 <OUTLINED_FUNCTION_0>:
c0de9fc0:	4615      	mov	r5, r2
c0de9fc2:	460e      	mov	r6, r1
c0de9fc4:	4607      	mov	r7, r0
c0de9fc6:	f7fd be0d 	b.w	c0de7be4 <reset_callbacks_and_context>

c0de9fca <OUTLINED_FUNCTION_1>:
c0de9fca:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de9fce:	eb00 0086 	add.w	r0, r0, r6, lsl #2
c0de9fd2:	f000 becb 	b.w	c0dead6c <pic>

c0de9fd6 <OUTLINED_FUNCTION_2>:
c0de9fd6:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de9fda:	2301      	movs	r3, #1
c0de9fdc:	f000 bcfe 	b.w	c0dea9dc <nbgl_getTextHeightInWidth>

c0de9fe0 <OUTLINED_FUNCTION_3>:
c0de9fe0:	2001      	movs	r0, #1
c0de9fe2:	f000 bcab 	b.w	c0dea93c <nbgl_refreshSpecial>

c0de9fe6 <OUTLINED_FUNCTION_4>:
c0de9fe6:	2101      	movs	r1, #1
c0de9fe8:	eb09 0002 	add.w	r0, r9, r2
c0de9fec:	f880 1068 	strb.w	r1, [r0, #104]	@ 0x68
c0de9ff0:	6d81      	ldr	r1, [r0, #88]	@ 0x58
c0de9ff2:	6808      	ldr	r0, [r1, #0]
c0de9ff4:	2800      	cmp	r0, #0
c0de9ff6:	4770      	bx	lr

c0de9ff8 <OUTLINED_FUNCTION_5>:
c0de9ff8:	2000      	movs	r0, #0
c0de9ffa:	f7fd bed1 	b.w	c0de7da0 <getNbPagesForGenericContents>

c0de9ffe <OUTLINED_FUNCTION_6>:
c0de9ffe:	2008      	movs	r0, #8
c0dea000:	f7f8 be9b 	b.w	c0de2d3a <os_io_seph_cmd_piezo_play_tune>

c0dea004 <OUTLINED_FUNCTION_7>:
c0dea004:	9001      	str	r0, [sp, #4]
c0dea006:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0dea008:	9000      	str	r0, [sp, #0]
c0dea00a:	4638      	mov	r0, r7
c0dea00c:	f7fe bdaa 	b.w	c0de8b64 <useCaseReview>

c0dea010 <OUTLINED_FUNCTION_9>:
c0dea010:	4448      	add	r0, r9
c0dea012:	6a41      	ldr	r1, [r0, #36]	@ 0x24
c0dea014:	2000      	movs	r0, #0
c0dea016:	4708      	bx	r1

c0dea018 <OUTLINED_FUNCTION_11>:
c0dea018:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0dea01c:	2300      	movs	r3, #0
c0dea01e:	f000 bce2 	b.w	c0dea9e6 <nbgl_getTextNbLinesInWidth>

c0dea022 <OUTLINED_FUNCTION_12>:
c0dea022:	200b      	movs	r0, #11
c0dea024:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0dea028:	f000 bcd8 	b.w	c0dea9dc <nbgl_getTextHeightInWidth>

c0dea02c <OUTLINED_FUNCTION_13>:
c0dea02c:	4630      	mov	r0, r6
c0dea02e:	f001 b8bf 	b.w	c0deb1b0 <__aeabi_memclr>

c0dea032 <OUTLINED_FUNCTION_14>:
c0dea032:	f10a 0004 	add.w	r0, sl, #4
c0dea036:	f107 0110 	add.w	r1, r7, #16
c0dea03a:	4770      	bx	lr

c0dea03c <bip32_path_read>:
c0dea03c:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0dea040:	b10b      	cbz	r3, c0dea046 <bip32_path_read+0xa>
c0dea042:	2b0a      	cmp	r3, #10
c0dea044:	d902      	bls.n	c0dea04c <bip32_path_read+0x10>
c0dea046:	2000      	movs	r0, #0
c0dea048:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0dea04c:	4692      	mov	sl, r2
c0dea04e:	460e      	mov	r6, r1
c0dea050:	4683      	mov	fp, r0
c0dea052:	425f      	negs	r7, r3
c0dea054:	2500      	movs	r5, #0
c0dea056:	f04f 0800 	mov.w	r8, #0
c0dea05a:	9301      	str	r3, [sp, #4]
c0dea05c:	42af      	cmp	r7, r5
c0dea05e:	d00c      	beq.n	c0dea07a <bip32_path_read+0x3e>
c0dea060:	f108 0404 	add.w	r4, r8, #4
c0dea064:	42b4      	cmp	r4, r6
c0dea066:	d808      	bhi.n	c0dea07a <bip32_path_read+0x3e>
c0dea068:	4658      	mov	r0, fp
c0dea06a:	4641      	mov	r1, r8
c0dea06c:	f000 faee 	bl	c0dea64c <read_u32_be>
c0dea070:	f84a 0008 	str.w	r0, [sl, r8]
c0dea074:	3d01      	subs	r5, #1
c0dea076:	46a0      	mov	r8, r4
c0dea078:	e7f0      	b.n	c0dea05c <bip32_path_read+0x20>
c0dea07a:	9a01      	ldr	r2, [sp, #4]
c0dea07c:	4269      	negs	r1, r5
c0dea07e:	2000      	movs	r0, #0
c0dea080:	4291      	cmp	r1, r2
c0dea082:	bf28      	it	cs
c0dea084:	2001      	movcs	r0, #1
c0dea086:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0dea08a <buffer_seek_cur>:
c0dea08a:	6882      	ldr	r2, [r0, #8]
c0dea08c:	1889      	adds	r1, r1, r2
c0dea08e:	d205      	bcs.n	c0dea09c <buffer_seek_cur+0x12>
c0dea090:	6842      	ldr	r2, [r0, #4]
c0dea092:	4291      	cmp	r1, r2
c0dea094:	bf9e      	ittt	ls
c0dea096:	6081      	strls	r1, [r0, #8]
c0dea098:	2001      	movls	r0, #1
c0dea09a:	4770      	bxls	lr
c0dea09c:	2000      	movs	r0, #0
c0dea09e:	4770      	bx	lr

c0dea0a0 <buffer_read_u8>:
c0dea0a0:	b510      	push	{r4, lr}
c0dea0a2:	e9d0 2301 	ldrd	r2, r3, [r0, #4]
c0dea0a6:	429a      	cmp	r2, r3
c0dea0a8:	d00a      	beq.n	c0dea0c0 <buffer_read_u8+0x20>
c0dea0aa:	6804      	ldr	r4, [r0, #0]
c0dea0ac:	5ce4      	ldrb	r4, [r4, r3]
c0dea0ae:	700c      	strb	r4, [r1, #0]
c0dea0b0:	6881      	ldr	r1, [r0, #8]
c0dea0b2:	3101      	adds	r1, #1
c0dea0b4:	d206      	bcs.n	c0dea0c4 <buffer_read_u8+0x24>
c0dea0b6:	6844      	ldr	r4, [r0, #4]
c0dea0b8:	42a1      	cmp	r1, r4
c0dea0ba:	bf98      	it	ls
c0dea0bc:	6081      	strls	r1, [r0, #8]
c0dea0be:	e001      	b.n	c0dea0c4 <buffer_read_u8+0x24>
c0dea0c0:	2000      	movs	r0, #0
c0dea0c2:	7008      	strb	r0, [r1, #0]
c0dea0c4:	1ad0      	subs	r0, r2, r3
c0dea0c6:	bf18      	it	ne
c0dea0c8:	2001      	movne	r0, #1
c0dea0ca:	bd10      	pop	{r4, pc}

c0dea0cc <buffer_read_u64>:
c0dea0cc:	b570      	push	{r4, r5, r6, lr}
c0dea0ce:	f000 f87d 	bl	c0dea1cc <OUTLINED_FUNCTION_0>
c0dea0d2:	2e07      	cmp	r6, #7
c0dea0d4:	d904      	bls.n	c0dea0e0 <buffer_read_u64+0x14>
c0dea0d6:	6820      	ldr	r0, [r4, #0]
c0dea0d8:	b132      	cbz	r2, c0dea0e8 <buffer_read_u64+0x1c>
c0dea0da:	f000 faee 	bl	c0dea6ba <read_u64_le>
c0dea0de:	e005      	b.n	c0dea0ec <buffer_read_u64+0x20>
c0dea0e0:	2000      	movs	r0, #0
c0dea0e2:	e9c5 0000 	strd	r0, r0, [r5]
c0dea0e6:	e00c      	b.n	c0dea102 <buffer_read_u64+0x36>
c0dea0e8:	f000 fabc 	bl	c0dea664 <read_u64_be>
c0dea0ec:	e9c5 0100 	strd	r0, r1, [r5]
c0dea0f0:	68a0      	ldr	r0, [r4, #8]
c0dea0f2:	f110 0f09 	cmn.w	r0, #9
c0dea0f6:	d804      	bhi.n	c0dea102 <buffer_read_u64+0x36>
c0dea0f8:	6861      	ldr	r1, [r4, #4]
c0dea0fa:	3008      	adds	r0, #8
c0dea0fc:	4288      	cmp	r0, r1
c0dea0fe:	bf98      	it	ls
c0dea100:	60a0      	strls	r0, [r4, #8]
c0dea102:	2000      	movs	r0, #0
c0dea104:	2e07      	cmp	r6, #7
c0dea106:	bf88      	it	hi
c0dea108:	2001      	movhi	r0, #1
c0dea10a:	bd70      	pop	{r4, r5, r6, pc}

c0dea10c <buffer_read_varint>:
c0dea10c:	b5b0      	push	{r4, r5, r7, lr}
c0dea10e:	4604      	mov	r4, r0
c0dea110:	460d      	mov	r5, r1
c0dea112:	6800      	ldr	r0, [r0, #0]
c0dea114:	e9d4 1201 	ldrd	r1, r2, [r4, #4]
c0dea118:	4410      	add	r0, r2
c0dea11a:	1a89      	subs	r1, r1, r2
c0dea11c:	462a      	mov	r2, r5
c0dea11e:	f000 fae3 	bl	c0dea6e8 <varint_read>
c0dea122:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0dea126:	dd0a      	ble.n	c0dea13e <buffer_read_varint+0x32>
c0dea128:	68a1      	ldr	r1, [r4, #8]
c0dea12a:	1840      	adds	r0, r0, r1
c0dea12c:	d205      	bcs.n	c0dea13a <buffer_read_varint+0x2e>
c0dea12e:	6861      	ldr	r1, [r4, #4]
c0dea130:	4288      	cmp	r0, r1
c0dea132:	bf9e      	ittt	ls
c0dea134:	60a0      	strls	r0, [r4, #8]
c0dea136:	2001      	movls	r0, #1
c0dea138:	bdb0      	popls	{r4, r5, r7, pc}
c0dea13a:	2000      	movs	r0, #0
c0dea13c:	bdb0      	pop	{r4, r5, r7, pc}
c0dea13e:	2000      	movs	r0, #0
c0dea140:	e9c5 0000 	strd	r0, r0, [r5]
c0dea144:	bdb0      	pop	{r4, r5, r7, pc}

c0dea146 <buffer_read_bip32_path>:
c0dea146:	b5b0      	push	{r4, r5, r7, lr}
c0dea148:	4604      	mov	r4, r0
c0dea14a:	4615      	mov	r5, r2
c0dea14c:	460a      	mov	r2, r1
c0dea14e:	6800      	ldr	r0, [r0, #0]
c0dea150:	e9d4 1301 	ldrd	r1, r3, [r4, #4]
c0dea154:	4418      	add	r0, r3
c0dea156:	1ac9      	subs	r1, r1, r3
c0dea158:	462b      	mov	r3, r5
c0dea15a:	f7ff ff6f 	bl	c0dea03c <bip32_path_read>
c0dea15e:	b140      	cbz	r0, c0dea172 <buffer_read_bip32_path+0x2c>
c0dea160:	68a2      	ldr	r2, [r4, #8]
c0dea162:	eb02 0185 	add.w	r1, r2, r5, lsl #2
c0dea166:	4291      	cmp	r1, r2
c0dea168:	d303      	bcc.n	c0dea172 <buffer_read_bip32_path+0x2c>
c0dea16a:	6862      	ldr	r2, [r4, #4]
c0dea16c:	4291      	cmp	r1, r2
c0dea16e:	bf98      	it	ls
c0dea170:	60a1      	strls	r1, [r4, #8]
c0dea172:	bdb0      	pop	{r4, r5, r7, pc}

c0dea174 <buffer_copy>:
c0dea174:	b5b0      	push	{r4, r5, r7, lr}
c0dea176:	4614      	mov	r4, r2
c0dea178:	e9d0 3201 	ldrd	r3, r2, [r0, #4]
c0dea17c:	1a9d      	subs	r5, r3, r2
c0dea17e:	42a5      	cmp	r5, r4
c0dea180:	d806      	bhi.n	c0dea190 <buffer_copy+0x1c>
c0dea182:	6800      	ldr	r0, [r0, #0]
c0dea184:	4402      	add	r2, r0
c0dea186:	4608      	mov	r0, r1
c0dea188:	4611      	mov	r1, r2
c0dea18a:	462a      	mov	r2, r5
c0dea18c:	f001 f808 	bl	c0deb1a0 <__aeabi_memmove>
c0dea190:	2000      	movs	r0, #0
c0dea192:	42a5      	cmp	r5, r4
c0dea194:	bf98      	it	ls
c0dea196:	2001      	movls	r0, #1
c0dea198:	bdb0      	pop	{r4, r5, r7, pc}

c0dea19a <buffer_move>:
c0dea19a:	b5b0      	push	{r4, r5, r7, lr}
c0dea19c:	4615      	mov	r5, r2
c0dea19e:	4604      	mov	r4, r0
c0dea1a0:	e9d0 2001 	ldrd	r2, r0, [r0, #4]
c0dea1a4:	1a12      	subs	r2, r2, r0
c0dea1a6:	42aa      	cmp	r2, r5
c0dea1a8:	bf84      	itt	hi
c0dea1aa:	2000      	movhi	r0, #0
c0dea1ac:	bdb0      	pophi	{r4, r5, r7, pc}
c0dea1ae:	6823      	ldr	r3, [r4, #0]
c0dea1b0:	4403      	add	r3, r0
c0dea1b2:	4608      	mov	r0, r1
c0dea1b4:	4619      	mov	r1, r3
c0dea1b6:	f000 fff3 	bl	c0deb1a0 <__aeabi_memmove>
c0dea1ba:	68a0      	ldr	r0, [r4, #8]
c0dea1bc:	1940      	adds	r0, r0, r5
c0dea1be:	d203      	bcs.n	c0dea1c8 <buffer_move+0x2e>
c0dea1c0:	6861      	ldr	r1, [r4, #4]
c0dea1c2:	4288      	cmp	r0, r1
c0dea1c4:	bf98      	it	ls
c0dea1c6:	60a0      	strls	r0, [r4, #8]
c0dea1c8:	2001      	movs	r0, #1
c0dea1ca:	bdb0      	pop	{r4, r5, r7, pc}

c0dea1cc <OUTLINED_FUNCTION_0>:
c0dea1cc:	4604      	mov	r4, r0
c0dea1ce:	460d      	mov	r5, r1
c0dea1d0:	6840      	ldr	r0, [r0, #4]
c0dea1d2:	68a1      	ldr	r1, [r4, #8]
c0dea1d4:	1a46      	subs	r6, r0, r1
c0dea1d6:	4770      	bx	lr

c0dea1d8 <bip32_derive_with_seed_init_privkey_256>:
c0dea1d8:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0dea1dc:	b095      	sub	sp, #84	@ 0x54
c0dea1de:	460d      	mov	r5, r1
c0dea1e0:	4607      	mov	r7, r0
c0dea1e2:	a904      	add	r1, sp, #16
c0dea1e4:	469a      	mov	sl, r3
c0dea1e6:	4614      	mov	r4, r2
c0dea1e8:	4628      	mov	r0, r5
c0dea1ea:	f000 fe03 	bl	c0deadf4 <cx_ecdomain_parameters_length>
c0dea1ee:	f8dd 8070 	ldr.w	r8, [sp, #112]	@ 0x70
c0dea1f2:	4606      	mov	r6, r0
c0dea1f4:	b9e0      	cbnz	r0, c0dea230 <bip32_derive_with_seed_init_privkey_256+0x58>
c0dea1f6:	9804      	ldr	r0, [sp, #16]
c0dea1f8:	2820      	cmp	r0, #32
c0dea1fa:	d117      	bne.n	c0dea22c <bip32_derive_with_seed_init_privkey_256+0x54>
c0dea1fc:	981f      	ldr	r0, [sp, #124]	@ 0x7c
c0dea1fe:	e9dd 211d 	ldrd	r2, r1, [sp, #116]	@ 0x74
c0dea202:	ab05      	add	r3, sp, #20
c0dea204:	e9cd 3200 	strd	r3, r2, [sp]
c0dea208:	e9cd 1002 	strd	r1, r0, [sp, #8]
c0dea20c:	4638      	mov	r0, r7
c0dea20e:	4629      	mov	r1, r5
c0dea210:	4622      	mov	r2, r4
c0dea212:	4653      	mov	r3, sl
c0dea214:	f000 f818 	bl	c0dea248 <os_derive_bip32_with_seed_no_throw>
c0dea218:	4606      	mov	r6, r0
c0dea21a:	b948      	cbnz	r0, c0dea230 <bip32_derive_with_seed_init_privkey_256+0x58>
c0dea21c:	9a04      	ldr	r2, [sp, #16]
c0dea21e:	a905      	add	r1, sp, #20
c0dea220:	4628      	mov	r0, r5
c0dea222:	4643      	mov	r3, r8
c0dea224:	f000 fb61 	bl	c0dea8ea <cx_ecfp_init_private_key_no_throw>
c0dea228:	4606      	mov	r6, r0
c0dea22a:	e001      	b.n	c0dea230 <bip32_derive_with_seed_init_privkey_256+0x58>
c0dea22c:	f06f 065c 	mvn.w	r6, #92	@ 0x5c
c0dea230:	a805      	add	r0, sp, #20
c0dea232:	2140      	movs	r1, #64	@ 0x40
c0dea234:	f000 ffca 	bl	c0deb1cc <explicit_bzero>
c0dea238:	b116      	cbz	r6, c0dea240 <bip32_derive_with_seed_init_privkey_256+0x68>
c0dea23a:	4640      	mov	r0, r8
c0dea23c:	f000 f89f 	bl	c0dea37e <OUTLINED_FUNCTION_0>
c0dea240:	4630      	mov	r0, r6
c0dea242:	b015      	add	sp, #84	@ 0x54
c0dea244:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}

c0dea248 <os_derive_bip32_with_seed_no_throw>:
c0dea248:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea24c:	b090      	sub	sp, #64	@ 0x40
c0dea24e:	f10d 0810 	add.w	r8, sp, #16
c0dea252:	4607      	mov	r7, r0
c0dea254:	469b      	mov	fp, r3
c0dea256:	4616      	mov	r6, r2
c0dea258:	460c      	mov	r4, r1
c0dea25a:	4640      	mov	r0, r8
c0dea25c:	f000 fffc 	bl	c0deb258 <setjmp>
c0dea260:	b285      	uxth	r5, r0
c0dea262:	f8dd a060 	ldr.w	sl, [sp, #96]	@ 0x60
c0dea266:	f8ad 003c 	strh.w	r0, [sp, #60]	@ 0x3c
c0dea26a:	b155      	cbz	r5, c0dea282 <os_derive_bip32_with_seed_no_throw+0x3a>
c0dea26c:	2000      	movs	r0, #0
c0dea26e:	f8ad 003c 	strh.w	r0, [sp, #60]	@ 0x3c
c0dea272:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0dea274:	f000 fe66 	bl	c0deaf44 <try_context_set>
c0dea278:	2140      	movs	r1, #64	@ 0x40
c0dea27a:	4650      	mov	r0, sl
c0dea27c:	f000 ffa6 	bl	c0deb1cc <explicit_bzero>
c0dea280:	e012      	b.n	c0dea2a8 <os_derive_bip32_with_seed_no_throw+0x60>
c0dea282:	a804      	add	r0, sp, #16
c0dea284:	f000 fe5e 	bl	c0deaf44 <try_context_set>
c0dea288:	9919      	ldr	r1, [sp, #100]	@ 0x64
c0dea28a:	900e      	str	r0, [sp, #56]	@ 0x38
c0dea28c:	4668      	mov	r0, sp
c0dea28e:	4632      	mov	r2, r6
c0dea290:	465b      	mov	r3, fp
c0dea292:	f8c0 a000 	str.w	sl, [r0]
c0dea296:	6041      	str	r1, [r0, #4]
c0dea298:	991a      	ldr	r1, [sp, #104]	@ 0x68
c0dea29a:	6081      	str	r1, [r0, #8]
c0dea29c:	991b      	ldr	r1, [sp, #108]	@ 0x6c
c0dea29e:	60c1      	str	r1, [r0, #12]
c0dea2a0:	4638      	mov	r0, r7
c0dea2a2:	4621      	mov	r1, r4
c0dea2a4:	f000 fdb0 	bl	c0deae08 <os_perso_derive_node_with_seed_key>
c0dea2a8:	f000 fe44 	bl	c0deaf34 <try_context_get>
c0dea2ac:	4540      	cmp	r0, r8
c0dea2ae:	d102      	bne.n	c0dea2b6 <os_derive_bip32_with_seed_no_throw+0x6e>
c0dea2b0:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0dea2b2:	f000 fe47 	bl	c0deaf44 <try_context_set>
c0dea2b6:	f8bd 003c 	ldrh.w	r0, [sp, #60]	@ 0x3c
c0dea2ba:	b918      	cbnz	r0, c0dea2c4 <os_derive_bip32_with_seed_no_throw+0x7c>
c0dea2bc:	4628      	mov	r0, r5
c0dea2be:	b010      	add	sp, #64	@ 0x40
c0dea2c0:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0dea2c4:	f000 fbb9 	bl	c0deaa3a <os_longjmp>

c0dea2c8 <bip32_derive_with_seed_get_pubkey_256>:
c0dea2c8:	b5f0      	push	{r4, r5, r6, r7, lr}
c0dea2ca:	b0a1      	sub	sp, #132	@ 0x84
c0dea2cc:	460e      	mov	r6, r1
c0dea2ce:	992a      	ldr	r1, [sp, #168]	@ 0xa8
c0dea2d0:	9103      	str	r1, [sp, #12]
c0dea2d2:	9929      	ldr	r1, [sp, #164]	@ 0xa4
c0dea2d4:	9102      	str	r1, [sp, #8]
c0dea2d6:	9927      	ldr	r1, [sp, #156]	@ 0x9c
c0dea2d8:	9101      	str	r1, [sp, #4]
c0dea2da:	a917      	add	r1, sp, #92	@ 0x5c
c0dea2dc:	9100      	str	r1, [sp, #0]
c0dea2de:	4631      	mov	r1, r6
c0dea2e0:	f7ff ff7a 	bl	c0dea1d8 <bip32_derive_with_seed_init_privkey_256>
c0dea2e4:	9c26      	ldr	r4, [sp, #152]	@ 0x98
c0dea2e6:	4605      	mov	r5, r0
c0dea2e8:	b9b8      	cbnz	r0, c0dea31a <bip32_derive_with_seed_get_pubkey_256+0x52>
c0dea2ea:	9828      	ldr	r0, [sp, #160]	@ 0xa0
c0dea2ec:	2301      	movs	r3, #1
c0dea2ee:	9000      	str	r0, [sp, #0]
c0dea2f0:	af04      	add	r7, sp, #16
c0dea2f2:	aa17      	add	r2, sp, #92	@ 0x5c
c0dea2f4:	4630      	mov	r0, r6
c0dea2f6:	4639      	mov	r1, r7
c0dea2f8:	f000 faf2 	bl	c0dea8e0 <cx_ecfp_generate_pair2_no_throw>
c0dea2fc:	4605      	mov	r5, r0
c0dea2fe:	b960      	cbnz	r0, c0dea31a <bip32_derive_with_seed_get_pubkey_256+0x52>
c0dea300:	9805      	ldr	r0, [sp, #20]
c0dea302:	2841      	cmp	r0, #65	@ 0x41
c0dea304:	d107      	bne.n	c0dea316 <bip32_derive_with_seed_get_pubkey_256+0x4e>
c0dea306:	f107 0108 	add.w	r1, r7, #8
c0dea30a:	4620      	mov	r0, r4
c0dea30c:	2241      	movs	r2, #65	@ 0x41
c0dea30e:	f000 ff45 	bl	c0deb19c <__aeabi_memcpy>
c0dea312:	2500      	movs	r5, #0
c0dea314:	e001      	b.n	c0dea31a <bip32_derive_with_seed_get_pubkey_256+0x52>
c0dea316:	f06f 055c 	mvn.w	r5, #92	@ 0x5c
c0dea31a:	a817      	add	r0, sp, #92	@ 0x5c
c0dea31c:	f000 f82f 	bl	c0dea37e <OUTLINED_FUNCTION_0>
c0dea320:	b11d      	cbz	r5, c0dea32a <bip32_derive_with_seed_get_pubkey_256+0x62>
c0dea322:	4620      	mov	r0, r4
c0dea324:	2141      	movs	r1, #65	@ 0x41
c0dea326:	f000 ff51 	bl	c0deb1cc <explicit_bzero>
c0dea32a:	4628      	mov	r0, r5
c0dea32c:	b021      	add	sp, #132	@ 0x84
c0dea32e:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0dea330 <bip32_derive_with_seed_ecdsa_sign_hash_256>:
c0dea330:	b5f0      	push	{r4, r5, r6, r7, lr}
c0dea332:	b08f      	sub	sp, #60	@ 0x3c
c0dea334:	9f19      	ldr	r7, [sp, #100]	@ 0x64
c0dea336:	9d1c      	ldr	r5, [sp, #112]	@ 0x70
c0dea338:	683c      	ldr	r4, [r7, #0]
c0dea33a:	9503      	str	r5, [sp, #12]
c0dea33c:	9d1b      	ldr	r5, [sp, #108]	@ 0x6c
c0dea33e:	9502      	str	r5, [sp, #8]
c0dea340:	2500      	movs	r5, #0
c0dea342:	9501      	str	r5, [sp, #4]
c0dea344:	ad05      	add	r5, sp, #20
c0dea346:	9500      	str	r5, [sp, #0]
c0dea348:	f7ff ff46 	bl	c0dea1d8 <bip32_derive_with_seed_init_privkey_256>
c0dea34c:	9d18      	ldr	r5, [sp, #96]	@ 0x60
c0dea34e:	4606      	mov	r6, r0
c0dea350:	b950      	cbnz	r0, c0dea368 <bip32_derive_with_seed_ecdsa_sign_hash_256+0x38>
c0dea352:	ae14      	add	r6, sp, #80	@ 0x50
c0dea354:	981a      	ldr	r0, [sp, #104]	@ 0x68
c0dea356:	ce4e      	ldmia	r6, {r1, r2, r3, r6}
c0dea358:	e9cd 6500 	strd	r6, r5, [sp]
c0dea35c:	e9cd 7002 	strd	r7, r0, [sp, #8]
c0dea360:	a805      	add	r0, sp, #20
c0dea362:	f000 fab8 	bl	c0dea8d6 <cx_ecdsa_sign_no_throw>
c0dea366:	4606      	mov	r6, r0
c0dea368:	a805      	add	r0, sp, #20
c0dea36a:	f000 f808 	bl	c0dea37e <OUTLINED_FUNCTION_0>
c0dea36e:	b11e      	cbz	r6, c0dea378 <bip32_derive_with_seed_ecdsa_sign_hash_256+0x48>
c0dea370:	4628      	mov	r0, r5
c0dea372:	4621      	mov	r1, r4
c0dea374:	f000 ff2a 	bl	c0deb1cc <explicit_bzero>
c0dea378:	4630      	mov	r0, r6
c0dea37a:	b00f      	add	sp, #60	@ 0x3c
c0dea37c:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0dea37e <OUTLINED_FUNCTION_0>:
c0dea37e:	2128      	movs	r1, #40	@ 0x28
c0dea380:	f000 bf24 	b.w	c0deb1cc <explicit_bzero>

c0dea384 <format_u64>:
c0dea384:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0dea388:	b1f9      	cbz	r1, c0dea3ca <format_u64+0x46>
c0dea38a:	4615      	mov	r5, r2
c0dea38c:	4604      	mov	r4, r0
c0dea38e:	f1a1 0801 	sub.w	r8, r1, #1
c0dea392:	2700      	movs	r7, #0
c0dea394:	2600      	movs	r6, #0
c0dea396:	f1b5 000a 	subs.w	r0, r5, #10
c0dea39a:	f173 0000 	sbcs.w	r0, r3, #0
c0dea39e:	d316      	bcc.n	c0dea3ce <format_u64+0x4a>
c0dea3a0:	4619      	mov	r1, r3
c0dea3a2:	4628      	mov	r0, r5
c0dea3a4:	220a      	movs	r2, #10
c0dea3a6:	2300      	movs	r3, #0
c0dea3a8:	f000 ff06 	bl	c0deb1b8 <__aeabi_uldivmod>
c0dea3ac:	460b      	mov	r3, r1
c0dea3ae:	eb00 0180 	add.w	r1, r0, r0, lsl #2
c0dea3b2:	1cba      	adds	r2, r7, #2
c0dea3b4:	eba5 0141 	sub.w	r1, r5, r1, lsl #1
c0dea3b8:	4605      	mov	r5, r0
c0dea3ba:	f041 0130 	orr.w	r1, r1, #48	@ 0x30
c0dea3be:	55e1      	strb	r1, [r4, r7]
c0dea3c0:	1c79      	adds	r1, r7, #1
c0dea3c2:	4542      	cmp	r2, r8
c0dea3c4:	460f      	mov	r7, r1
c0dea3c6:	d9e6      	bls.n	c0dea396 <format_u64+0x12>
c0dea3c8:	e012      	b.n	c0dea3f0 <format_u64+0x6c>
c0dea3ca:	2600      	movs	r6, #0
c0dea3cc:	e010      	b.n	c0dea3f0 <format_u64+0x6c>
c0dea3ce:	f105 0030 	add.w	r0, r5, #48	@ 0x30
c0dea3d2:	19e1      	adds	r1, r4, r7
c0dea3d4:	55e0      	strb	r0, [r4, r7]
c0dea3d6:	2000      	movs	r0, #0
c0dea3d8:	7048      	strb	r0, [r1, #1]
c0dea3da:	b2c1      	uxtb	r1, r0
c0dea3dc:	428f      	cmp	r7, r1
c0dea3de:	d906      	bls.n	c0dea3ee <format_u64+0x6a>
c0dea3e0:	5c62      	ldrb	r2, [r4, r1]
c0dea3e2:	5de3      	ldrb	r3, [r4, r7]
c0dea3e4:	3001      	adds	r0, #1
c0dea3e6:	5463      	strb	r3, [r4, r1]
c0dea3e8:	55e2      	strb	r2, [r4, r7]
c0dea3ea:	3f01      	subs	r7, #1
c0dea3ec:	e7f5      	b.n	c0dea3da <format_u64+0x56>
c0dea3ee:	2601      	movs	r6, #1
c0dea3f0:	4630      	mov	r0, r6
c0dea3f2:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0dea3f6 <format_fpu64>:
c0dea3f6:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0dea3fa:	b086      	sub	sp, #24
c0dea3fc:	466c      	mov	r4, sp
c0dea3fe:	4688      	mov	r8, r1
c0dea400:	4605      	mov	r5, r0
c0dea402:	2115      	movs	r1, #21
c0dea404:	461e      	mov	r6, r3
c0dea406:	4617      	mov	r7, r2
c0dea408:	4620      	mov	r0, r4
c0dea40a:	f000 fed1 	bl	c0deb1b0 <__aeabi_memclr>
c0dea40e:	4620      	mov	r0, r4
c0dea410:	2115      	movs	r1, #21
c0dea412:	463a      	mov	r2, r7
c0dea414:	4633      	mov	r3, r6
c0dea416:	f7ff ffb5 	bl	c0dea384 <format_u64>
c0dea41a:	b340      	cbz	r0, c0dea46e <format_fpu64+0x78>
c0dea41c:	466f      	mov	r7, sp
c0dea41e:	9e0c      	ldr	r6, [sp, #48]	@ 0x30
c0dea420:	4638      	mov	r0, r7
c0dea422:	f000 ff31 	bl	c0deb288 <strlen>
c0dea426:	42b0      	cmp	r0, r6
c0dea428:	d910      	bls.n	c0dea44c <format_fpu64+0x56>
c0dea42a:	1831      	adds	r1, r6, r0
c0dea42c:	3101      	adds	r1, #1
c0dea42e:	4541      	cmp	r1, r8
c0dea430:	d21d      	bcs.n	c0dea46e <format_fpu64+0x78>
c0dea432:	1b84      	subs	r4, r0, r6
c0dea434:	4628      	mov	r0, r5
c0dea436:	4639      	mov	r1, r7
c0dea438:	4622      	mov	r2, r4
c0dea43a:	f000 feaf 	bl	c0deb19c <__aeabi_memcpy>
c0dea43e:	1928      	adds	r0, r5, r4
c0dea440:	212e      	movs	r1, #46	@ 0x2e
c0dea442:	4632      	mov	r2, r6
c0dea444:	f800 1b01 	strb.w	r1, [r0], #1
c0dea448:	1939      	adds	r1, r7, r4
c0dea44a:	e015      	b.n	c0dea478 <format_fpu64+0x82>
c0dea44c:	1a32      	subs	r2, r6, r0
c0dea44e:	1c91      	adds	r1, r2, #2
c0dea450:	4541      	cmp	r1, r8
c0dea452:	d20c      	bcs.n	c0dea46e <format_fpu64+0x78>
c0dea454:	202e      	movs	r0, #46	@ 0x2e
c0dea456:	2330      	movs	r3, #48	@ 0x30
c0dea458:	2400      	movs	r4, #0
c0dea45a:	7068      	strb	r0, [r5, #1]
c0dea45c:	1ca8      	adds	r0, r5, #2
c0dea45e:	702b      	strb	r3, [r5, #0]
c0dea460:	b2a5      	uxth	r5, r4
c0dea462:	42aa      	cmp	r2, r5
c0dea464:	d905      	bls.n	c0dea472 <format_fpu64+0x7c>
c0dea466:	f800 3b01 	strb.w	r3, [r0], #1
c0dea46a:	3401      	adds	r4, #1
c0dea46c:	e7f8      	b.n	c0dea460 <format_fpu64+0x6a>
c0dea46e:	2000      	movs	r0, #0
c0dea470:	e005      	b.n	c0dea47e <format_fpu64+0x88>
c0dea472:	eba8 0201 	sub.w	r2, r8, r1
c0dea476:	4669      	mov	r1, sp
c0dea478:	f000 ff0e 	bl	c0deb298 <strncpy>
c0dea47c:	2001      	movs	r0, #1
c0dea47e:	b006      	add	sp, #24
c0dea480:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0dea484 <format_hex>:
c0dea484:	b5f0      	push	{r4, r5, r6, r7, lr}
c0dea486:	4604      	mov	r4, r0
c0dea488:	0048      	lsls	r0, r1, #1
c0dea48a:	f100 0c01 	add.w	ip, r0, #1
c0dea48e:	459c      	cmp	ip, r3
c0dea490:	d902      	bls.n	c0dea498 <format_hex+0x14>
c0dea492:	f04f 3cff 	mov.w	ip, #4294967295	@ 0xffffffff
c0dea496:	e018      	b.n	c0dea4ca <format_hex+0x46>
c0dea498:	480d      	ldr	r0, [pc, #52]	@ (c0dea4d0 <format_hex+0x4c>)
c0dea49a:	2500      	movs	r5, #0
c0dea49c:	4478      	add	r0, pc
c0dea49e:	b191      	cbz	r1, c0dea4c6 <format_hex+0x42>
c0dea4a0:	1cef      	adds	r7, r5, #3
c0dea4a2:	429f      	cmp	r7, r3
c0dea4a4:	d80d      	bhi.n	c0dea4c2 <format_hex+0x3e>
c0dea4a6:	7827      	ldrb	r7, [r4, #0]
c0dea4a8:	3901      	subs	r1, #1
c0dea4aa:	093f      	lsrs	r7, r7, #4
c0dea4ac:	5dc7      	ldrb	r7, [r0, r7]
c0dea4ae:	5557      	strb	r7, [r2, r5]
c0dea4b0:	1957      	adds	r7, r2, r5
c0dea4b2:	3502      	adds	r5, #2
c0dea4b4:	f814 6b01 	ldrb.w	r6, [r4], #1
c0dea4b8:	f006 060f 	and.w	r6, r6, #15
c0dea4bc:	5d86      	ldrb	r6, [r0, r6]
c0dea4be:	707e      	strb	r6, [r7, #1]
c0dea4c0:	e7ed      	b.n	c0dea49e <format_hex+0x1a>
c0dea4c2:	f105 0c01 	add.w	ip, r5, #1
c0dea4c6:	2000      	movs	r0, #0
c0dea4c8:	5550      	strb	r0, [r2, r5]
c0dea4ca:	4660      	mov	r0, ip
c0dea4cc:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0dea4ce:	bf00      	nop
c0dea4d0:	00002848 	.word	0x00002848

c0dea4d4 <app_ticker_event_callback>:
c0dea4d4:	4770      	bx	lr
	...

c0dea4d8 <io_event>:
c0dea4d8:	b580      	push	{r7, lr}
c0dea4da:	480b      	ldr	r0, [pc, #44]	@ (c0dea508 <io_event+0x30>)
c0dea4dc:	f819 1000 	ldrb.w	r1, [r9, r0]
c0dea4e0:	2905      	cmp	r1, #5
c0dea4e2:	d00e      	beq.n	c0dea502 <io_event+0x2a>
c0dea4e4:	290e      	cmp	r1, #14
c0dea4e6:	d005      	beq.n	c0dea4f4 <io_event+0x1c>
c0dea4e8:	290c      	cmp	r1, #12
c0dea4ea:	d108      	bne.n	c0dea4fe <io_event+0x26>
c0dea4ec:	4448      	add	r0, r9
c0dea4ee:	f000 f92f 	bl	c0dea750 <ux_process_finger_event>
c0dea4f2:	e006      	b.n	c0dea502 <io_event+0x2a>
c0dea4f4:	f7ff ffee 	bl	c0dea4d4 <app_ticker_event_callback>
c0dea4f8:	f000 f980 	bl	c0dea7fc <ux_process_ticker_event>
c0dea4fc:	e001      	b.n	c0dea502 <io_event+0x2a>
c0dea4fe:	f000 f9b3 	bl	c0dea868 <ux_process_default_event>
c0dea502:	2001      	movs	r0, #1
c0dea504:	bd80      	pop	{r7, pc}
c0dea506:	bf00      	nop
c0dea508:	00001d0c 	.word	0x00001d0c

c0dea50c <io_init>:
c0dea50c:	4802      	ldr	r0, [pc, #8]	@ (c0dea518 <io_init+0xc>)
c0dea50e:	2101      	movs	r1, #1
c0dea510:	f809 1000 	strb.w	r1, [r9, r0]
c0dea514:	4770      	bx	lr
c0dea516:	bf00      	nop
c0dea518:	00001e1c 	.word	0x00001e1c

c0dea51c <io_recv_command>:
c0dea51c:	b510      	push	{r4, lr}
c0dea51e:	4c09      	ldr	r4, [pc, #36]	@ (c0dea544 <io_recv_command+0x28>)
c0dea520:	f819 0004 	ldrb.w	r0, [r9, r4]
c0dea524:	2801      	cmp	r0, #1
c0dea526:	d104      	bne.n	c0dea532 <io_recv_command+0x16>
c0dea528:	f000 fce2 	bl	c0deaef0 <os_io_start>
c0dea52c:	2000      	movs	r0, #0
c0dea52e:	f809 0004 	strb.w	r0, [r9, r4]
c0dea532:	2000      	movs	r0, #0
c0dea534:	2800      	cmp	r0, #0
c0dea536:	dc03      	bgt.n	c0dea540 <io_recv_command+0x24>
c0dea538:	2001      	movs	r0, #1
c0dea53a:	f7f8 fc91 	bl	c0de2e60 <io_legacy_apdu_rx>
c0dea53e:	e7f9      	b.n	c0dea534 <io_recv_command+0x18>
c0dea540:	bd10      	pop	{r4, pc}
c0dea542:	bf00      	nop
c0dea544:	00001e1c 	.word	0x00001e1c

c0dea548 <io_send_response_buffers>:
c0dea548:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0dea54c:	f8df a060 	ldr.w	sl, [pc, #96]	@ c0dea5b0 <io_send_response_buffers+0x68>
c0dea550:	4690      	mov	r8, r2
c0dea552:	460f      	mov	r7, r1
c0dea554:	4605      	mov	r5, r0
c0dea556:	f240 140f 	movw	r4, #271	@ 0x10f
c0dea55a:	2600      	movs	r6, #0
c0dea55c:	b1b5      	cbz	r5, c0dea58c <io_send_response_buffers+0x44>
c0dea55e:	b1af      	cbz	r7, c0dea58c <io_send_response_buffers+0x44>
c0dea560:	2600      	movs	r6, #0
c0dea562:	b19f      	cbz	r7, c0dea58c <io_send_response_buffers+0x44>
c0dea564:	eb09 000a 	add.w	r0, r9, sl
c0dea568:	1ba2      	subs	r2, r4, r6
c0dea56a:	1981      	adds	r1, r0, r6
c0dea56c:	4628      	mov	r0, r5
c0dea56e:	f7ff fe01 	bl	c0dea174 <buffer_copy>
c0dea572:	b130      	cbz	r0, c0dea582 <io_send_response_buffers+0x3a>
c0dea574:	e9d5 0101 	ldrd	r0, r1, [r5, #4]
c0dea578:	350c      	adds	r5, #12
c0dea57a:	3f01      	subs	r7, #1
c0dea57c:	4430      	add	r0, r6
c0dea57e:	1a46      	subs	r6, r0, r1
c0dea580:	e7ef      	b.n	c0dea562 <io_send_response_buffers+0x1a>
c0dea582:	f44f 4830 	mov.w	r8, #45056	@ 0xb000
c0dea586:	2500      	movs	r5, #0
c0dea588:	2700      	movs	r7, #0
c0dea58a:	e7e6      	b.n	c0dea55a <io_send_response_buffers+0x12>
c0dea58c:	eb09 050a 	add.w	r5, r9, sl
c0dea590:	fa1f f288 	uxth.w	r2, r8
c0dea594:	4631      	mov	r1, r6
c0dea596:	4628      	mov	r0, r5
c0dea598:	f000 f8d4 	bl	c0dea744 <write_u16_be>
c0dea59c:	1cb0      	adds	r0, r6, #2
c0dea59e:	b281      	uxth	r1, r0
c0dea5a0:	4628      	mov	r0, r5
c0dea5a2:	f7f8 fc43 	bl	c0de2e2c <io_legacy_apdu_tx>
c0dea5a6:	ea40 70e0 	orr.w	r0, r0, r0, asr #31
c0dea5aa:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0dea5ae:	bf00      	nop
c0dea5b0:	00001517 	.word	0x00001517

c0dea5b4 <app_exit>:
c0dea5b4:	20ff      	movs	r0, #255	@ 0xff
c0dea5b6:	f000 fc87 	bl	c0deaec8 <os_sched_exit>

c0dea5ba <common_app_init>:
c0dea5ba:	b580      	push	{r7, lr}
c0dea5bc:	f000 f9c8 	bl	c0dea950 <nbgl_objInit>
c0dea5c0:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0dea5c4:	f7f8 bd78 	b.w	c0de30b8 <io_seproxyhal_init>

c0dea5c8 <standalone_app_main>:
c0dea5c8:	b510      	push	{r4, lr}
c0dea5ca:	b08c      	sub	sp, #48	@ 0x30
c0dea5cc:	466c      	mov	r4, sp
c0dea5ce:	4620      	mov	r0, r4
c0dea5d0:	f000 fe42 	bl	c0deb258 <setjmp>
c0dea5d4:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0dea5d8:	0400      	lsls	r0, r0, #16
c0dea5da:	d108      	bne.n	c0dea5ee <standalone_app_main+0x26>
c0dea5dc:	4668      	mov	r0, sp
c0dea5de:	f000 fcb1 	bl	c0deaf44 <try_context_set>
c0dea5e2:	900a      	str	r0, [sp, #40]	@ 0x28
c0dea5e4:	f7ff ffe9 	bl	c0dea5ba <common_app_init>
c0dea5e8:	f7f5 fe56 	bl	c0de0298 <app_main>
c0dea5ec:	e005      	b.n	c0dea5fa <standalone_app_main+0x32>
c0dea5ee:	2000      	movs	r0, #0
c0dea5f0:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0dea5f4:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0dea5f6:	f000 fca5 	bl	c0deaf44 <try_context_set>
c0dea5fa:	f000 fc9b 	bl	c0deaf34 <try_context_get>
c0dea5fe:	42a0      	cmp	r0, r4
c0dea600:	d102      	bne.n	c0dea608 <standalone_app_main+0x40>
c0dea602:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0dea604:	f000 fc9e 	bl	c0deaf44 <try_context_set>
c0dea608:	f8bd 002c 	ldrh.w	r0, [sp, #44]	@ 0x2c
c0dea60c:	b908      	cbnz	r0, c0dea612 <standalone_app_main+0x4a>
c0dea60e:	f7ff ffd1 	bl	c0dea5b4 <app_exit>
c0dea612:	f000 fa12 	bl	c0deaa3a <os_longjmp>

c0dea616 <apdu_parser>:
c0dea616:	2a04      	cmp	r2, #4
c0dea618:	d316      	bcc.n	c0dea648 <apdu_parser+0x32>
c0dea61a:	d102      	bne.n	c0dea622 <apdu_parser+0xc>
c0dea61c:	2300      	movs	r3, #0
c0dea61e:	7103      	strb	r3, [r0, #4]
c0dea620:	e004      	b.n	c0dea62c <apdu_parser+0x16>
c0dea622:	790b      	ldrb	r3, [r1, #4]
c0dea624:	3a05      	subs	r2, #5
c0dea626:	429a      	cmp	r2, r3
c0dea628:	7103      	strb	r3, [r0, #4]
c0dea62a:	d10d      	bne.n	c0dea648 <apdu_parser+0x32>
c0dea62c:	780a      	ldrb	r2, [r1, #0]
c0dea62e:	2b00      	cmp	r3, #0
c0dea630:	7002      	strb	r2, [r0, #0]
c0dea632:	784a      	ldrb	r2, [r1, #1]
c0dea634:	7042      	strb	r2, [r0, #1]
c0dea636:	788a      	ldrb	r2, [r1, #2]
c0dea638:	7082      	strb	r2, [r0, #2]
c0dea63a:	bf18      	it	ne
c0dea63c:	1d4b      	addne	r3, r1, #5
c0dea63e:	78c9      	ldrb	r1, [r1, #3]
c0dea640:	6083      	str	r3, [r0, #8]
c0dea642:	70c1      	strb	r1, [r0, #3]
c0dea644:	2001      	movs	r0, #1
c0dea646:	4770      	bx	lr
c0dea648:	2000      	movs	r0, #0
c0dea64a:	4770      	bx	lr

c0dea64c <read_u32_be>:
c0dea64c:	5c42      	ldrb	r2, [r0, r1]
c0dea64e:	4408      	add	r0, r1
c0dea650:	7841      	ldrb	r1, [r0, #1]
c0dea652:	7883      	ldrb	r3, [r0, #2]
c0dea654:	78c0      	ldrb	r0, [r0, #3]
c0dea656:	0409      	lsls	r1, r1, #16
c0dea658:	ea41 6102 	orr.w	r1, r1, r2, lsl #24
c0dea65c:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0dea660:	4408      	add	r0, r1
c0dea662:	4770      	bx	lr

c0dea664 <read_u64_be>:
c0dea664:	b5f0      	push	{r4, r5, r6, r7, lr}
c0dea666:	1842      	adds	r2, r0, r1
c0dea668:	5c40      	ldrb	r0, [r0, r1]
c0dea66a:	7917      	ldrb	r7, [r2, #4]
c0dea66c:	7953      	ldrb	r3, [r2, #5]
c0dea66e:	7854      	ldrb	r4, [r2, #1]
c0dea670:	7895      	ldrb	r5, [r2, #2]
c0dea672:	78d6      	ldrb	r6, [r2, #3]
c0dea674:	063f      	lsls	r7, r7, #24
c0dea676:	0421      	lsls	r1, r4, #16
c0dea678:	ea47 4303 	orr.w	r3, r7, r3, lsl #16
c0dea67c:	7997      	ldrb	r7, [r2, #6]
c0dea67e:	79d2      	ldrb	r2, [r2, #7]
c0dea680:	ea41 6000 	orr.w	r0, r1, r0, lsl #24
c0dea684:	ea40 2005 	orr.w	r0, r0, r5, lsl #8
c0dea688:	ea43 2307 	orr.w	r3, r3, r7, lsl #8
c0dea68c:	1981      	adds	r1, r0, r6
c0dea68e:	441a      	add	r2, r3
c0dea690:	4610      	mov	r0, r2
c0dea692:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0dea694 <read_u16_le>:
c0dea694:	5c42      	ldrb	r2, [r0, r1]
c0dea696:	4408      	add	r0, r1
c0dea698:	7840      	ldrb	r0, [r0, #1]
c0dea69a:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0dea69e:	b280      	uxth	r0, r0
c0dea6a0:	4770      	bx	lr

c0dea6a2 <read_u32_le>:
c0dea6a2:	5c42      	ldrb	r2, [r0, r1]
c0dea6a4:	4408      	add	r0, r1
c0dea6a6:	7841      	ldrb	r1, [r0, #1]
c0dea6a8:	7883      	ldrb	r3, [r0, #2]
c0dea6aa:	78c0      	ldrb	r0, [r0, #3]
c0dea6ac:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0dea6b0:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
c0dea6b4:	ea41 6000 	orr.w	r0, r1, r0, lsl #24
c0dea6b8:	4770      	bx	lr

c0dea6ba <read_u64_le>:
c0dea6ba:	b5b0      	push	{r4, r5, r7, lr}
c0dea6bc:	5c42      	ldrb	r2, [r0, r1]
c0dea6be:	4401      	add	r1, r0
c0dea6c0:	7848      	ldrb	r0, [r1, #1]
c0dea6c2:	788b      	ldrb	r3, [r1, #2]
c0dea6c4:	790d      	ldrb	r5, [r1, #4]
c0dea6c6:	78cc      	ldrb	r4, [r1, #3]
c0dea6c8:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0dea6cc:	794a      	ldrb	r2, [r1, #5]
c0dea6ce:	ea40 4003 	orr.w	r0, r0, r3, lsl #16
c0dea6d2:	798b      	ldrb	r3, [r1, #6]
c0dea6d4:	79c9      	ldrb	r1, [r1, #7]
c0dea6d6:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0dea6da:	ea40 6004 	orr.w	r0, r0, r4, lsl #24
c0dea6de:	ea42 4203 	orr.w	r2, r2, r3, lsl #16
c0dea6e2:	ea42 6101 	orr.w	r1, r2, r1, lsl #24
c0dea6e6:	bdb0      	pop	{r4, r5, r7, pc}

c0dea6e8 <varint_read>:
c0dea6e8:	b510      	push	{r4, lr}
c0dea6ea:	b1d9      	cbz	r1, c0dea724 <varint_read+0x3c>
c0dea6ec:	4614      	mov	r4, r2
c0dea6ee:	4602      	mov	r2, r0
c0dea6f0:	7800      	ldrb	r0, [r0, #0]
c0dea6f2:	28ff      	cmp	r0, #255	@ 0xff
c0dea6f4:	d00c      	beq.n	c0dea710 <varint_read+0x28>
c0dea6f6:	28fe      	cmp	r0, #254	@ 0xfe
c0dea6f8:	d012      	beq.n	c0dea720 <varint_read+0x38>
c0dea6fa:	28fd      	cmp	r0, #253	@ 0xfd
c0dea6fc:	d115      	bne.n	c0dea72a <varint_read+0x42>
c0dea6fe:	2903      	cmp	r1, #3
c0dea700:	d310      	bcc.n	c0dea724 <varint_read+0x3c>
c0dea702:	4610      	mov	r0, r2
c0dea704:	2101      	movs	r1, #1
c0dea706:	f7ff ffc5 	bl	c0dea694 <read_u16_le>
c0dea70a:	2100      	movs	r1, #0
c0dea70c:	2203      	movs	r2, #3
c0dea70e:	e015      	b.n	c0dea73c <varint_read+0x54>
c0dea710:	2909      	cmp	r1, #9
c0dea712:	d307      	bcc.n	c0dea724 <varint_read+0x3c>
c0dea714:	4610      	mov	r0, r2
c0dea716:	2101      	movs	r1, #1
c0dea718:	f7ff ffcf 	bl	c0dea6ba <read_u64_le>
c0dea71c:	2209      	movs	r2, #9
c0dea71e:	e00d      	b.n	c0dea73c <varint_read+0x54>
c0dea720:	2905      	cmp	r1, #5
c0dea722:	d205      	bcs.n	c0dea730 <varint_read+0x48>
c0dea724:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
c0dea728:	e00a      	b.n	c0dea740 <varint_read+0x58>
c0dea72a:	2100      	movs	r1, #0
c0dea72c:	2201      	movs	r2, #1
c0dea72e:	e005      	b.n	c0dea73c <varint_read+0x54>
c0dea730:	4610      	mov	r0, r2
c0dea732:	2101      	movs	r1, #1
c0dea734:	f7ff ffb5 	bl	c0dea6a2 <read_u32_le>
c0dea738:	2100      	movs	r1, #0
c0dea73a:	2205      	movs	r2, #5
c0dea73c:	e9c4 0100 	strd	r0, r1, [r4]
c0dea740:	4610      	mov	r0, r2
c0dea742:	bd10      	pop	{r4, pc}

c0dea744 <write_u16_be>:
c0dea744:	0a13      	lsrs	r3, r2, #8
c0dea746:	5443      	strb	r3, [r0, r1]
c0dea748:	4408      	add	r0, r1
c0dea74a:	7042      	strb	r2, [r0, #1]
c0dea74c:	4770      	bx	lr
	...

c0dea750 <ux_process_finger_event>:
c0dea750:	b5b0      	push	{r4, r5, r7, lr}
c0dea752:	4604      	mov	r4, r0
c0dea754:	2001      	movs	r0, #1
c0dea756:	f000 f827 	bl	c0dea7a8 <ux_forward_event>
c0dea75a:	4605      	mov	r5, r0
c0dea75c:	f000 f902 	bl	c0dea964 <nbgl_objAllowDrawing>
c0dea760:	b1fd      	cbz	r5, c0dea7a2 <ux_process_finger_event+0x52>
c0dea762:	78e1      	ldrb	r1, [r4, #3]
c0dea764:	480f      	ldr	r0, [pc, #60]	@ (c0dea7a4 <ux_process_finger_event+0x54>)
c0dea766:	7963      	ldrb	r3, [r4, #5]
c0dea768:	3901      	subs	r1, #1
c0dea76a:	eb09 0200 	add.w	r2, r9, r0
c0dea76e:	f859 0000 	ldr.w	r0, [r9, r0]
c0dea772:	fab1 f181 	clz	r1, r1
c0dea776:	094d      	lsrs	r5, r1, #5
c0dea778:	4611      	mov	r1, r2
c0dea77a:	f801 5f04 	strb.w	r5, [r1, #4]!
c0dea77e:	7925      	ldrb	r5, [r4, #4]
c0dea780:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0dea784:	80d3      	strh	r3, [r2, #6]
c0dea786:	79a3      	ldrb	r3, [r4, #6]
c0dea788:	79e4      	ldrb	r4, [r4, #7]
c0dea78a:	ea44 2303 	orr.w	r3, r4, r3, lsl #8
c0dea78e:	8113      	strh	r3, [r2, #8]
c0dea790:	2264      	movs	r2, #100	@ 0x64
c0dea792:	4342      	muls	r2, r0
c0dea794:	2000      	movs	r0, #0
c0dea796:	f000 f93a 	bl	c0deaa0e <nbgl_touchHandler>
c0dea79a:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
c0dea79e:	f000 b8c8 	b.w	c0dea932 <nbgl_refresh>
c0dea7a2:	bdb0      	pop	{r4, r5, r7, pc}
c0dea7a4:	00001e44 	.word	0x00001e44

c0dea7a8 <ux_forward_event>:
c0dea7a8:	b5b0      	push	{r4, r5, r7, lr}
c0dea7aa:	4604      	mov	r4, r0
c0dea7ac:	4812      	ldr	r0, [pc, #72]	@ (c0dea7f8 <ux_forward_event+0x50>)
c0dea7ae:	2101      	movs	r1, #1
c0dea7b0:	f809 1000 	strb.w	r1, [r9, r0]
c0dea7b4:	eb09 0500 	add.w	r5, r9, r0
c0dea7b8:	2000      	movs	r0, #0
c0dea7ba:	6068      	str	r0, [r5, #4]
c0dea7bc:	4628      	mov	r0, r5
c0dea7be:	f000 fb59 	bl	c0deae74 <os_ux>
c0dea7c2:	2004      	movs	r0, #4
c0dea7c4:	f000 fbc8 	bl	c0deaf58 <os_sched_last_status>
c0dea7c8:	2869      	cmp	r0, #105	@ 0x69
c0dea7ca:	6068      	str	r0, [r5, #4]
c0dea7cc:	d108      	bne.n	c0dea7e0 <ux_forward_event+0x38>
c0dea7ce:	2001      	movs	r0, #1
c0dea7d0:	f000 f8c8 	bl	c0dea964 <nbgl_objAllowDrawing>
c0dea7d4:	f000 f8d5 	bl	c0dea982 <nbgl_screenRedraw>
c0dea7d8:	f000 f8ab 	bl	c0dea932 <nbgl_refresh>
c0dea7dc:	2000      	movs	r0, #0
c0dea7de:	bdb0      	pop	{r4, r5, r7, pc}
c0dea7e0:	b144      	cbz	r4, c0dea7f4 <ux_forward_event+0x4c>
c0dea7e2:	f1b0 0197 	subs.w	r1, r0, #151	@ 0x97
c0dea7e6:	bf18      	it	ne
c0dea7e8:	2101      	movne	r1, #1
c0dea7ea:	2800      	cmp	r0, #0
c0dea7ec:	bf18      	it	ne
c0dea7ee:	2001      	movne	r0, #1
c0dea7f0:	4008      	ands	r0, r1
c0dea7f2:	bdb0      	pop	{r4, r5, r7, pc}
c0dea7f4:	2001      	movs	r0, #1
c0dea7f6:	bdb0      	pop	{r4, r5, r7, pc}
c0dea7f8:	00001e20 	.word	0x00001e20

c0dea7fc <ux_process_ticker_event>:
c0dea7fc:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0dea7fe:	4d19      	ldr	r5, [pc, #100]	@ (c0dea864 <ux_process_ticker_event+0x68>)
c0dea800:	f859 0005 	ldr.w	r0, [r9, r5]
c0dea804:	3001      	adds	r0, #1
c0dea806:	f849 0005 	str.w	r0, [r9, r5]
c0dea80a:	2001      	movs	r0, #1
c0dea80c:	f7ff ffcc 	bl	c0dea7a8 <ux_forward_event>
c0dea810:	4604      	mov	r4, r0
c0dea812:	f000 f8a7 	bl	c0dea964 <nbgl_objAllowDrawing>
c0dea816:	b324      	cbz	r4, c0dea862 <ux_process_ticker_event+0x66>
c0dea818:	2064      	movs	r0, #100	@ 0x64
c0dea81a:	2464      	movs	r4, #100	@ 0x64
c0dea81c:	f000 f8c0 	bl	c0dea9a0 <nbgl_screenHandler>
c0dea820:	eb09 0005 	add.w	r0, r9, r5
c0dea824:	7900      	ldrb	r0, [r0, #4]
c0dea826:	2801      	cmp	r0, #1
c0dea828:	d119      	bne.n	c0dea85e <ux_process_ticker_event+0x62>
c0dea82a:	4668      	mov	r0, sp
c0dea82c:	f000 fba0 	bl	c0deaf70 <touch_get_last_info>
c0dea830:	f8bd 0000 	ldrh.w	r0, [sp]
c0dea834:	eb09 0105 	add.w	r1, r9, r5
c0dea838:	80c8      	strh	r0, [r1, #6]
c0dea83a:	f8bd 0002 	ldrh.w	r0, [sp, #2]
c0dea83e:	8108      	strh	r0, [r1, #8]
c0dea840:	f89d 0004 	ldrb.w	r0, [sp, #4]
c0dea844:	3801      	subs	r0, #1
c0dea846:	fab0 f080 	clz	r0, r0
c0dea84a:	0940      	lsrs	r0, r0, #5
c0dea84c:	f801 0f04 	strb.w	r0, [r1, #4]!
c0dea850:	f859 0005 	ldr.w	r0, [r9, r5]
c0dea854:	fb00 f204 	mul.w	r2, r0, r4
c0dea858:	2000      	movs	r0, #0
c0dea85a:	f000 f8d8 	bl	c0deaa0e <nbgl_touchHandler>
c0dea85e:	f000 f868 	bl	c0dea932 <nbgl_refresh>
c0dea862:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}
c0dea864:	00001e44 	.word	0x00001e44

c0dea868 <ux_process_default_event>:
c0dea868:	2000      	movs	r0, #0
c0dea86a:	f7ff bf9d 	b.w	c0dea7a8 <ux_forward_event>

c0dea86e <hash_iovec_ex>:
c0dea86e:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0dea872:	468a      	mov	sl, r1
c0dea874:	4611      	mov	r1, r2
c0dea876:	461a      	mov	r2, r3
c0dea878:	4605      	mov	r5, r0
c0dea87a:	f000 f840 	bl	c0dea8fe <cx_hash_init_ex>
c0dea87e:	4607      	mov	r7, r0
c0dea880:	b9a8      	cbnz	r0, c0dea8ae <hash_iovec_ex+0x40>
c0dea882:	f10d 0820 	add.w	r8, sp, #32
c0dea886:	e898 0141 	ldmia.w	r8, {r0, r6, r8}
c0dea88a:	1d04      	adds	r4, r0, #4
c0dea88c:	b156      	cbz	r6, c0dea8a4 <hash_iovec_ex+0x36>
c0dea88e:	f854 1c04 	ldr.w	r1, [r4, #-4]
c0dea892:	f854 2b08 	ldr.w	r2, [r4], #8
c0dea896:	4628      	mov	r0, r5
c0dea898:	f000 f836 	bl	c0dea908 <cx_hash_update>
c0dea89c:	3e01      	subs	r6, #1
c0dea89e:	2800      	cmp	r0, #0
c0dea8a0:	d0f4      	beq.n	c0dea88c <hash_iovec_ex+0x1e>
c0dea8a2:	e003      	b.n	c0dea8ac <hash_iovec_ex+0x3e>
c0dea8a4:	4628      	mov	r0, r5
c0dea8a6:	4641      	mov	r1, r8
c0dea8a8:	f000 f824 	bl	c0dea8f4 <cx_hash_final>
c0dea8ac:	4607      	mov	r7, r0
c0dea8ae:	4628      	mov	r0, r5
c0dea8b0:	4651      	mov	r1, sl
c0dea8b2:	f000 fc8b 	bl	c0deb1cc <explicit_bzero>
c0dea8b6:	4638      	mov	r0, r7
c0dea8b8:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}

c0dea8bc <cx_keccak_256_hash_iovec>:
c0dea8bc:	b580      	push	{r7, lr}
c0dea8be:	b0ee      	sub	sp, #440	@ 0x1b8
c0dea8c0:	e88d 0007 	stmia.w	sp, {r0, r1, r2}
c0dea8c4:	a804      	add	r0, sp, #16
c0dea8c6:	f44f 71d4 	mov.w	r1, #424	@ 0x1a8
c0dea8ca:	2206      	movs	r2, #6
c0dea8cc:	2320      	movs	r3, #32
c0dea8ce:	f7ff ffce 	bl	c0dea86e <hash_iovec_ex>
c0dea8d2:	b06e      	add	sp, #440	@ 0x1b8
c0dea8d4:	bd80      	pop	{r7, pc}

c0dea8d6 <cx_ecdsa_sign_no_throw>:
c0dea8d6:	b403      	push	{r0, r1}
c0dea8d8:	f04f 002c 	mov.w	r0, #44	@ 0x2c
c0dea8dc:	f000 b822 	b.w	c0dea924 <cx_trampoline_helper>

c0dea8e0 <cx_ecfp_generate_pair2_no_throw>:
c0dea8e0:	b403      	push	{r0, r1}
c0dea8e2:	f04f 0031 	mov.w	r0, #49	@ 0x31
c0dea8e6:	f000 b81d 	b.w	c0dea924 <cx_trampoline_helper>

c0dea8ea <cx_ecfp_init_private_key_no_throw>:
c0dea8ea:	b403      	push	{r0, r1}
c0dea8ec:	f04f 0033 	mov.w	r0, #51	@ 0x33
c0dea8f0:	f000 b818 	b.w	c0dea924 <cx_trampoline_helper>

c0dea8f4 <cx_hash_final>:
c0dea8f4:	b403      	push	{r0, r1}
c0dea8f6:	f04f 003f 	mov.w	r0, #63	@ 0x3f
c0dea8fa:	f000 b813 	b.w	c0dea924 <cx_trampoline_helper>

c0dea8fe <cx_hash_init_ex>:
c0dea8fe:	b403      	push	{r0, r1}
c0dea900:	f04f 0043 	mov.w	r0, #67	@ 0x43
c0dea904:	f000 b80e 	b.w	c0dea924 <cx_trampoline_helper>

c0dea908 <cx_hash_update>:
c0dea908:	b403      	push	{r0, r1}
c0dea90a:	f04f 0048 	mov.w	r0, #72	@ 0x48
c0dea90e:	f000 b809 	b.w	c0dea924 <cx_trampoline_helper>

c0dea912 <cx_rng_no_throw>:
c0dea912:	b403      	push	{r0, r1}
c0dea914:	f04f 006a 	mov.w	r0, #106	@ 0x6a
c0dea918:	f000 b804 	b.w	c0dea924 <cx_trampoline_helper>

c0dea91c <cx_aes_siv_reset>:
c0dea91c:	b403      	push	{r0, r1}
c0dea91e:	f04f 0090 	mov.w	r0, #144	@ 0x90
c0dea922:	e7ff      	b.n	c0dea924 <cx_trampoline_helper>

c0dea924 <cx_trampoline_helper>:
c0dea924:	4900      	ldr	r1, [pc, #0]	@ (c0dea928 <cx_trampoline_helper+0x4>)
c0dea926:	4708      	bx	r1
c0dea928:	00808001 	.word	0x00808001

c0dea92c <assert_exit>:
c0dea92c:	20ff      	movs	r0, #255	@ 0xff
c0dea92e:	f000 facb 	bl	c0deaec8 <os_sched_exit>

c0dea932 <nbgl_refresh>:
c0dea932:	b403      	push	{r0, r1}
c0dea934:	f04f 0091 	mov.w	r0, #145	@ 0x91
c0dea938:	f000 b878 	b.w	c0deaa2c <nbgl_trampoline_helper>

c0dea93c <nbgl_refreshSpecial>:
c0dea93c:	b403      	push	{r0, r1}
c0dea93e:	f04f 0092 	mov.w	r0, #146	@ 0x92
c0dea942:	f000 b873 	b.w	c0deaa2c <nbgl_trampoline_helper>

c0dea946 <nbgl_refreshSpecialWithPostRefresh>:
c0dea946:	b403      	push	{r0, r1}
c0dea948:	f04f 0093 	mov.w	r0, #147	@ 0x93
c0dea94c:	f000 b86e 	b.w	c0deaa2c <nbgl_trampoline_helper>

c0dea950 <nbgl_objInit>:
c0dea950:	b403      	push	{r0, r1}
c0dea952:	f04f 0096 	mov.w	r0, #150	@ 0x96
c0dea956:	f000 b869 	b.w	c0deaa2c <nbgl_trampoline_helper>

c0dea95a <nbgl_objDraw>:
c0dea95a:	b403      	push	{r0, r1}
c0dea95c:	f04f 0097 	mov.w	r0, #151	@ 0x97
c0dea960:	f000 b864 	b.w	c0deaa2c <nbgl_trampoline_helper>

c0dea964 <nbgl_objAllowDrawing>:
c0dea964:	b403      	push	{r0, r1}
c0dea966:	f04f 0098 	mov.w	r0, #152	@ 0x98
c0dea96a:	f000 b85f 	b.w	c0deaa2c <nbgl_trampoline_helper>

c0dea96e <nbgl_screenSet>:
c0dea96e:	b403      	push	{r0, r1}
c0dea970:	f04f 009b 	mov.w	r0, #155	@ 0x9b
c0dea974:	f000 b85a 	b.w	c0deaa2c <nbgl_trampoline_helper>

c0dea978 <nbgl_screenPush>:
c0dea978:	b403      	push	{r0, r1}
c0dea97a:	f04f 009c 	mov.w	r0, #156	@ 0x9c
c0dea97e:	f000 b855 	b.w	c0deaa2c <nbgl_trampoline_helper>

c0dea982 <nbgl_screenRedraw>:
c0dea982:	b403      	push	{r0, r1}
c0dea984:	f04f 009d 	mov.w	r0, #157	@ 0x9d
c0dea988:	f000 b850 	b.w	c0deaa2c <nbgl_trampoline_helper>

c0dea98c <nbgl_screenPop>:
c0dea98c:	b403      	push	{r0, r1}
c0dea98e:	f04f 009e 	mov.w	r0, #158	@ 0x9e
c0dea992:	f000 b84b 	b.w	c0deaa2c <nbgl_trampoline_helper>

c0dea996 <nbgl_screenUpdateTicker>:
c0dea996:	b403      	push	{r0, r1}
c0dea998:	f04f 00a4 	mov.w	r0, #164	@ 0xa4
c0dea99c:	f000 b846 	b.w	c0deaa2c <nbgl_trampoline_helper>

c0dea9a0 <nbgl_screenHandler>:
c0dea9a0:	b403      	push	{r0, r1}
c0dea9a2:	f04f 00a7 	mov.w	r0, #167	@ 0xa7
c0dea9a6:	f000 b841 	b.w	c0deaa2c <nbgl_trampoline_helper>

c0dea9aa <nbgl_objPoolGet>:
c0dea9aa:	b403      	push	{r0, r1}
c0dea9ac:	f04f 00a8 	mov.w	r0, #168	@ 0xa8
c0dea9b0:	f000 b83c 	b.w	c0deaa2c <nbgl_trampoline_helper>

c0dea9b4 <nbgl_containerPoolGet>:
c0dea9b4:	b403      	push	{r0, r1}
c0dea9b6:	f04f 00aa 	mov.w	r0, #170	@ 0xaa
c0dea9ba:	f000 b837 	b.w	c0deaa2c <nbgl_trampoline_helper>

c0dea9be <nbgl_getFont>:
c0dea9be:	b403      	push	{r0, r1}
c0dea9c0:	f04f 00ac 	mov.w	r0, #172	@ 0xac
c0dea9c4:	f000 b832 	b.w	c0deaa2c <nbgl_trampoline_helper>

c0dea9c8 <nbgl_getFontHeight>:
c0dea9c8:	b403      	push	{r0, r1}
c0dea9ca:	f04f 00ad 	mov.w	r0, #173	@ 0xad
c0dea9ce:	f000 b82d 	b.w	c0deaa2c <nbgl_trampoline_helper>

c0dea9d2 <nbgl_getFontLineHeight>:
c0dea9d2:	b403      	push	{r0, r1}
c0dea9d4:	f04f 00ae 	mov.w	r0, #174	@ 0xae
c0dea9d8:	f000 b828 	b.w	c0deaa2c <nbgl_trampoline_helper>

c0dea9dc <nbgl_getTextHeightInWidth>:
c0dea9dc:	b403      	push	{r0, r1}
c0dea9de:	f04f 00b2 	mov.w	r0, #178	@ 0xb2
c0dea9e2:	f000 b823 	b.w	c0deaa2c <nbgl_trampoline_helper>

c0dea9e6 <nbgl_getTextNbLinesInWidth>:
c0dea9e6:	b403      	push	{r0, r1}
c0dea9e8:	f04f 00b4 	mov.w	r0, #180	@ 0xb4
c0dea9ec:	f000 b81e 	b.w	c0deaa2c <nbgl_trampoline_helper>

c0dea9f0 <nbgl_getTextWidth>:
c0dea9f0:	b403      	push	{r0, r1}
c0dea9f2:	f04f 00b6 	mov.w	r0, #182	@ 0xb6
c0dea9f6:	f000 b819 	b.w	c0deaa2c <nbgl_trampoline_helper>

c0dea9fa <nbgl_getTextMaxLenInNbLines>:
c0dea9fa:	b403      	push	{r0, r1}
c0dea9fc:	f04f 00b7 	mov.w	r0, #183	@ 0xb7
c0deaa00:	f000 b814 	b.w	c0deaa2c <nbgl_trampoline_helper>

c0deaa04 <nbgl_textReduceOnNbLines>:
c0deaa04:	b403      	push	{r0, r1}
c0deaa06:	f04f 00b8 	mov.w	r0, #184	@ 0xb8
c0deaa0a:	f000 b80f 	b.w	c0deaa2c <nbgl_trampoline_helper>

c0deaa0e <nbgl_touchHandler>:
c0deaa0e:	b403      	push	{r0, r1}
c0deaa10:	f04f 00bb 	mov.w	r0, #187	@ 0xbb
c0deaa14:	f000 b80a 	b.w	c0deaa2c <nbgl_trampoline_helper>

c0deaa18 <nbgl_touchGetTouchDuration>:
c0deaa18:	b403      	push	{r0, r1}
c0deaa1a:	f04f 00bc 	mov.w	r0, #188	@ 0xbc
c0deaa1e:	f000 b805 	b.w	c0deaa2c <nbgl_trampoline_helper>
	...

c0deaa24 <pic_init>:
c0deaa24:	b403      	push	{r0, r1}
c0deaa26:	f04f 00c4 	mov.w	r0, #196	@ 0xc4
c0deaa2a:	e7ff      	b.n	c0deaa2c <nbgl_trampoline_helper>

c0deaa2c <nbgl_trampoline_helper>:
c0deaa2c:	4900      	ldr	r1, [pc, #0]	@ (c0deaa30 <nbgl_trampoline_helper+0x4>)
c0deaa2e:	4708      	bx	r1
c0deaa30:	00808001 	.word	0x00808001

c0deaa34 <os_boot>:
c0deaa34:	2000      	movs	r0, #0
c0deaa36:	f000 ba85 	b.w	c0deaf44 <try_context_set>

c0deaa3a <os_longjmp>:
c0deaa3a:	4604      	mov	r4, r0
c0deaa3c:	f000 fa7a 	bl	c0deaf34 <try_context_get>
c0deaa40:	4621      	mov	r1, r4
c0deaa42:	f000 fc0f 	bl	c0deb264 <longjmp>
	...

c0deaa48 <snprintf>:
c0deaa48:	b081      	sub	sp, #4
c0deaa4a:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0deaa4e:	b087      	sub	sp, #28
c0deaa50:	2800      	cmp	r0, #0
c0deaa52:	930f      	str	r3, [sp, #60]	@ 0x3c
c0deaa54:	f000 817a 	beq.w	c0dead4c <snprintf+0x304>
c0deaa58:	460d      	mov	r5, r1
c0deaa5a:	2900      	cmp	r1, #0
c0deaa5c:	f000 8176 	beq.w	c0dead4c <snprintf+0x304>
c0deaa60:	4629      	mov	r1, r5
c0deaa62:	4616      	mov	r6, r2
c0deaa64:	4604      	mov	r4, r0
c0deaa66:	f000 fba3 	bl	c0deb1b0 <__aeabi_memclr>
c0deaa6a:	f1b5 0801 	subs.w	r8, r5, #1
c0deaa6e:	f000 816d 	beq.w	c0dead4c <snprintf+0x304>
c0deaa72:	a80f      	add	r0, sp, #60	@ 0x3c
c0deaa74:	9002      	str	r0, [sp, #8]
c0deaa76:	7830      	ldrb	r0, [r6, #0]
c0deaa78:	2800      	cmp	r0, #0
c0deaa7a:	f000 8167 	beq.w	c0dead4c <snprintf+0x304>
c0deaa7e:	2700      	movs	r7, #0
c0deaa80:	b128      	cbz	r0, c0deaa8e <snprintf+0x46>
c0deaa82:	2825      	cmp	r0, #37	@ 0x25
c0deaa84:	d003      	beq.n	c0deaa8e <snprintf+0x46>
c0deaa86:	19f0      	adds	r0, r6, r7
c0deaa88:	3701      	adds	r7, #1
c0deaa8a:	7840      	ldrb	r0, [r0, #1]
c0deaa8c:	e7f8      	b.n	c0deaa80 <snprintf+0x38>
c0deaa8e:	4547      	cmp	r7, r8
c0deaa90:	bf28      	it	cs
c0deaa92:	4647      	movcs	r7, r8
c0deaa94:	4620      	mov	r0, r4
c0deaa96:	4631      	mov	r1, r6
c0deaa98:	463a      	mov	r2, r7
c0deaa9a:	f000 fb81 	bl	c0deb1a0 <__aeabi_memmove>
c0deaa9e:	ebb8 0807 	subs.w	r8, r8, r7
c0deaaa2:	f000 8153 	beq.w	c0dead4c <snprintf+0x304>
c0deaaa6:	5df1      	ldrb	r1, [r6, r7]
c0deaaa8:	19f0      	adds	r0, r6, r7
c0deaaaa:	443c      	add	r4, r7
c0deaaac:	4606      	mov	r6, r0
c0deaaae:	2925      	cmp	r1, #37	@ 0x25
c0deaab0:	d1e1      	bne.n	c0deaa76 <snprintf+0x2e>
c0deaab2:	1c41      	adds	r1, r0, #1
c0deaab4:	f04f 0b00 	mov.w	fp, #0
c0deaab8:	f04f 0e20 	mov.w	lr, #32
c0deaabc:	2500      	movs	r5, #0
c0deaabe:	2600      	movs	r6, #0
c0deaac0:	3101      	adds	r1, #1
c0deaac2:	f811 3c01 	ldrb.w	r3, [r1, #-1]
c0deaac6:	4632      	mov	r2, r6
c0deaac8:	3101      	adds	r1, #1
c0deaaca:	2600      	movs	r6, #0
c0deaacc:	2b2d      	cmp	r3, #45	@ 0x2d
c0deaace:	d0f8      	beq.n	c0deaac2 <snprintf+0x7a>
c0deaad0:	f1a3 0630 	sub.w	r6, r3, #48	@ 0x30
c0deaad4:	2e0a      	cmp	r6, #10
c0deaad6:	d313      	bcc.n	c0deab00 <snprintf+0xb8>
c0deaad8:	2b25      	cmp	r3, #37	@ 0x25
c0deaada:	d046      	beq.n	c0deab6a <snprintf+0x122>
c0deaadc:	2b2a      	cmp	r3, #42	@ 0x2a
c0deaade:	d01f      	beq.n	c0deab20 <snprintf+0xd8>
c0deaae0:	2b2e      	cmp	r3, #46	@ 0x2e
c0deaae2:	d129      	bne.n	c0deab38 <snprintf+0xf0>
c0deaae4:	f811 2c01 	ldrb.w	r2, [r1, #-1]
c0deaae8:	2a2a      	cmp	r2, #42	@ 0x2a
c0deaaea:	d13c      	bne.n	c0deab66 <snprintf+0x11e>
c0deaaec:	780a      	ldrb	r2, [r1, #0]
c0deaaee:	2a48      	cmp	r2, #72	@ 0x48
c0deaaf0:	d003      	beq.n	c0deaafa <snprintf+0xb2>
c0deaaf2:	2a73      	cmp	r2, #115	@ 0x73
c0deaaf4:	d001      	beq.n	c0deaafa <snprintf+0xb2>
c0deaaf6:	2a68      	cmp	r2, #104	@ 0x68
c0deaaf8:	d135      	bne.n	c0deab66 <snprintf+0x11e>
c0deaafa:	9a02      	ldr	r2, [sp, #8]
c0deaafc:	2601      	movs	r6, #1
c0deaafe:	e017      	b.n	c0deab30 <snprintf+0xe8>
c0deab00:	f083 0630 	eor.w	r6, r3, #48	@ 0x30
c0deab04:	ea56 060b 	orrs.w	r6, r6, fp
c0deab08:	bf08      	it	eq
c0deab0a:	f04f 0e30 	moveq.w	lr, #48	@ 0x30
c0deab0e:	eb0b 068b 	add.w	r6, fp, fp, lsl #2
c0deab12:	3901      	subs	r1, #1
c0deab14:	eb03 0346 	add.w	r3, r3, r6, lsl #1
c0deab18:	4616      	mov	r6, r2
c0deab1a:	f1a3 0b30 	sub.w	fp, r3, #48	@ 0x30
c0deab1e:	e7cf      	b.n	c0deaac0 <snprintf+0x78>
c0deab20:	460b      	mov	r3, r1
c0deab22:	f813 2d01 	ldrb.w	r2, [r3, #-1]!
c0deab26:	2a73      	cmp	r2, #115	@ 0x73
c0deab28:	d11d      	bne.n	c0deab66 <snprintf+0x11e>
c0deab2a:	9a02      	ldr	r2, [sp, #8]
c0deab2c:	2602      	movs	r6, #2
c0deab2e:	4619      	mov	r1, r3
c0deab30:	1d13      	adds	r3, r2, #4
c0deab32:	9302      	str	r3, [sp, #8]
c0deab34:	6815      	ldr	r5, [r2, #0]
c0deab36:	e7c3      	b.n	c0deaac0 <snprintf+0x78>
c0deab38:	2b48      	cmp	r3, #72	@ 0x48
c0deab3a:	d018      	beq.n	c0deab6e <snprintf+0x126>
c0deab3c:	2b58      	cmp	r3, #88	@ 0x58
c0deab3e:	d019      	beq.n	c0deab74 <snprintf+0x12c>
c0deab40:	2b63      	cmp	r3, #99	@ 0x63
c0deab42:	d020      	beq.n	c0deab86 <snprintf+0x13e>
c0deab44:	2b64      	cmp	r3, #100	@ 0x64
c0deab46:	d02a      	beq.n	c0deab9e <snprintf+0x156>
c0deab48:	2b68      	cmp	r3, #104	@ 0x68
c0deab4a:	d036      	beq.n	c0deabba <snprintf+0x172>
c0deab4c:	2b70      	cmp	r3, #112	@ 0x70
c0deab4e:	d006      	beq.n	c0deab5e <snprintf+0x116>
c0deab50:	2b73      	cmp	r3, #115	@ 0x73
c0deab52:	d037      	beq.n	c0deabc4 <snprintf+0x17c>
c0deab54:	2b75      	cmp	r3, #117	@ 0x75
c0deab56:	f000 8081 	beq.w	c0deac5c <snprintf+0x214>
c0deab5a:	2b78      	cmp	r3, #120	@ 0x78
c0deab5c:	d103      	bne.n	c0deab66 <snprintf+0x11e>
c0deab5e:	9400      	str	r4, [sp, #0]
c0deab60:	f04f 0c00 	mov.w	ip, #0
c0deab64:	e009      	b.n	c0deab7a <snprintf+0x132>
c0deab66:	1e4e      	subs	r6, r1, #1
c0deab68:	e785      	b.n	c0deaa76 <snprintf+0x2e>
c0deab6a:	2025      	movs	r0, #37	@ 0x25
c0deab6c:	e00f      	b.n	c0deab8e <snprintf+0x146>
c0deab6e:	487b      	ldr	r0, [pc, #492]	@ (c0dead5c <snprintf+0x314>)
c0deab70:	4478      	add	r0, pc
c0deab72:	e024      	b.n	c0deabbe <snprintf+0x176>
c0deab74:	f04f 0c01 	mov.w	ip, #1
c0deab78:	9400      	str	r4, [sp, #0]
c0deab7a:	9a02      	ldr	r2, [sp, #8]
c0deab7c:	2400      	movs	r4, #0
c0deab7e:	1d13      	adds	r3, r2, #4
c0deab80:	9302      	str	r3, [sp, #8]
c0deab82:	2310      	movs	r3, #16
c0deab84:	e072      	b.n	c0deac6c <snprintf+0x224>
c0deab86:	9802      	ldr	r0, [sp, #8]
c0deab88:	1d02      	adds	r2, r0, #4
c0deab8a:	9202      	str	r2, [sp, #8]
c0deab8c:	6800      	ldr	r0, [r0, #0]
c0deab8e:	1e4e      	subs	r6, r1, #1
c0deab90:	f804 0b01 	strb.w	r0, [r4], #1
c0deab94:	f1b8 0801 	subs.w	r8, r8, #1
c0deab98:	f47f af6d 	bne.w	c0deaa76 <snprintf+0x2e>
c0deab9c:	e0d6      	b.n	c0dead4c <snprintf+0x304>
c0deab9e:	9a02      	ldr	r2, [sp, #8]
c0deaba0:	9400      	str	r4, [sp, #0]
c0deaba2:	1d13      	adds	r3, r2, #4
c0deaba4:	9302      	str	r3, [sp, #8]
c0deaba6:	6813      	ldr	r3, [r2, #0]
c0deaba8:	2b00      	cmp	r3, #0
c0deabaa:	461a      	mov	r2, r3
c0deabac:	d500      	bpl.n	c0deabb0 <snprintf+0x168>
c0deabae:	425a      	negs	r2, r3
c0deabb0:	0fdc      	lsrs	r4, r3, #31
c0deabb2:	f04f 0c00 	mov.w	ip, #0
c0deabb6:	230a      	movs	r3, #10
c0deabb8:	e059      	b.n	c0deac6e <snprintf+0x226>
c0deabba:	4869      	ldr	r0, [pc, #420]	@ (c0dead60 <snprintf+0x318>)
c0deabbc:	4478      	add	r0, pc
c0deabbe:	f04f 0c01 	mov.w	ip, #1
c0deabc2:	e003      	b.n	c0deabcc <snprintf+0x184>
c0deabc4:	4864      	ldr	r0, [pc, #400]	@ (c0dead58 <snprintf+0x310>)
c0deabc6:	f04f 0c00 	mov.w	ip, #0
c0deabca:	4478      	add	r0, pc
c0deabcc:	9b02      	ldr	r3, [sp, #8]
c0deabce:	b2d2      	uxtb	r2, r2
c0deabd0:	1d1e      	adds	r6, r3, #4
c0deabd2:	9602      	str	r6, [sp, #8]
c0deabd4:	1e4e      	subs	r6, r1, #1
c0deabd6:	6819      	ldr	r1, [r3, #0]
c0deabd8:	2a02      	cmp	r2, #2
c0deabda:	f000 80a7 	beq.w	c0dead2c <snprintf+0x2e4>
c0deabde:	2a01      	cmp	r2, #1
c0deabe0:	d007      	beq.n	c0deabf2 <snprintf+0x1aa>
c0deabe2:	463d      	mov	r5, r7
c0deabe4:	b92a      	cbnz	r2, c0deabf2 <snprintf+0x1aa>
c0deabe6:	2200      	movs	r2, #0
c0deabe8:	5c8b      	ldrb	r3, [r1, r2]
c0deabea:	3201      	adds	r2, #1
c0deabec:	2b00      	cmp	r3, #0
c0deabee:	d1fb      	bne.n	c0deabe8 <snprintf+0x1a0>
c0deabf0:	1e55      	subs	r5, r2, #1
c0deabf2:	f1bc 0f00 	cmp.w	ip, #0
c0deabf6:	d016      	beq.n	c0deac26 <snprintf+0x1de>
c0deabf8:	2d00      	cmp	r5, #0
c0deabfa:	f43f af3c 	beq.w	c0deaa76 <snprintf+0x2e>
c0deabfe:	f1b8 0f02 	cmp.w	r8, #2
c0deac02:	f0c0 80a3 	bcc.w	c0dead4c <snprintf+0x304>
c0deac06:	780a      	ldrb	r2, [r1, #0]
c0deac08:	0913      	lsrs	r3, r2, #4
c0deac0a:	f002 020f 	and.w	r2, r2, #15
c0deac0e:	5cc3      	ldrb	r3, [r0, r3]
c0deac10:	f1b8 0802 	subs.w	r8, r8, #2
c0deac14:	7023      	strb	r3, [r4, #0]
c0deac16:	5c82      	ldrb	r2, [r0, r2]
c0deac18:	7062      	strb	r2, [r4, #1]
c0deac1a:	f000 8097 	beq.w	c0dead4c <snprintf+0x304>
c0deac1e:	3101      	adds	r1, #1
c0deac20:	3d01      	subs	r5, #1
c0deac22:	3402      	adds	r4, #2
c0deac24:	e7e8      	b.n	c0deabf8 <snprintf+0x1b0>
c0deac26:	4545      	cmp	r5, r8
c0deac28:	bf28      	it	cs
c0deac2a:	4645      	movcs	r5, r8
c0deac2c:	4620      	mov	r0, r4
c0deac2e:	462a      	mov	r2, r5
c0deac30:	f000 fab6 	bl	c0deb1a0 <__aeabi_memmove>
c0deac34:	ebb8 0805 	subs.w	r8, r8, r5
c0deac38:	f000 8088 	beq.w	c0dead4c <snprintf+0x304>
c0deac3c:	462f      	mov	r7, r5
c0deac3e:	442c      	add	r4, r5
c0deac40:	45bb      	cmp	fp, r7
c0deac42:	f67f af18 	bls.w	c0deaa76 <snprintf+0x2e>
c0deac46:	ebab 0507 	sub.w	r5, fp, r7
c0deac4a:	4620      	mov	r0, r4
c0deac4c:	4545      	cmp	r5, r8
c0deac4e:	bf28      	it	cs
c0deac50:	4645      	movcs	r5, r8
c0deac52:	4629      	mov	r1, r5
c0deac54:	2220      	movs	r2, #32
c0deac56:	f000 faa5 	bl	c0deb1a4 <__aeabi_memset>
c0deac5a:	e061      	b.n	c0dead20 <snprintf+0x2d8>
c0deac5c:	9a02      	ldr	r2, [sp, #8]
c0deac5e:	9400      	str	r4, [sp, #0]
c0deac60:	2400      	movs	r4, #0
c0deac62:	f04f 0c00 	mov.w	ip, #0
c0deac66:	1d13      	adds	r3, r2, #4
c0deac68:	9302      	str	r3, [sp, #8]
c0deac6a:	230a      	movs	r3, #10
c0deac6c:	6812      	ldr	r2, [r2, #0]
c0deac6e:	483d      	ldr	r0, [pc, #244]	@ (c0dead64 <snprintf+0x31c>)
c0deac70:	1e4e      	subs	r6, r1, #1
c0deac72:	f04f 0a01 	mov.w	sl, #1
c0deac76:	4478      	add	r0, pc
c0deac78:	9001      	str	r0, [sp, #4]
c0deac7a:	fba3 570a 	umull	r5, r7, r3, sl
c0deac7e:	2f00      	cmp	r7, #0
c0deac80:	bf18      	it	ne
c0deac82:	2701      	movne	r7, #1
c0deac84:	4295      	cmp	r5, r2
c0deac86:	d804      	bhi.n	c0deac92 <snprintf+0x24a>
c0deac88:	b91f      	cbnz	r7, c0deac92 <snprintf+0x24a>
c0deac8a:	f1ab 0b01 	sub.w	fp, fp, #1
c0deac8e:	46aa      	mov	sl, r5
c0deac90:	e7f3      	b.n	c0deac7a <snprintf+0x232>
c0deac92:	2c00      	cmp	r4, #0
c0deac94:	4627      	mov	r7, r4
c0deac96:	f04f 0500 	mov.w	r5, #0
c0deac9a:	bf18      	it	ne
c0deac9c:	f04f 37ff 	movne.w	r7, #4294967295	@ 0xffffffff
c0deaca0:	d00d      	beq.n	c0deacbe <snprintf+0x276>
c0deaca2:	4660      	mov	r0, ip
c0deaca4:	fa5f fc8e 	uxtb.w	ip, lr
c0deaca8:	a903      	add	r1, sp, #12
c0deacaa:	f1bc 0f30 	cmp.w	ip, #48	@ 0x30
c0deacae:	4684      	mov	ip, r0
c0deacb0:	d106      	bne.n	c0deacc0 <snprintf+0x278>
c0deacb2:	202d      	movs	r0, #45	@ 0x2d
c0deacb4:	2400      	movs	r4, #0
c0deacb6:	2501      	movs	r5, #1
c0deacb8:	f88d 000c 	strb.w	r0, [sp, #12]
c0deacbc:	e000      	b.n	c0deacc0 <snprintf+0x278>
c0deacbe:	a903      	add	r1, sp, #12
c0deacc0:	eb07 000b 	add.w	r0, r7, fp
c0deacc4:	3802      	subs	r0, #2
c0deacc6:	280d      	cmp	r0, #13
c0deacc8:	d808      	bhi.n	c0deacdc <snprintf+0x294>
c0deacca:	f1c7 0701 	rsb	r7, r7, #1
c0deacce:	45bb      	cmp	fp, r7
c0deacd0:	d004      	beq.n	c0deacdc <snprintf+0x294>
c0deacd2:	f801 e005 	strb.w	lr, [r1, r5]
c0deacd6:	3701      	adds	r7, #1
c0deacd8:	3501      	adds	r5, #1
c0deacda:	e7f8      	b.n	c0deacce <snprintf+0x286>
c0deacdc:	9f01      	ldr	r7, [sp, #4]
c0deacde:	b114      	cbz	r4, c0deace6 <snprintf+0x29e>
c0deace0:	202d      	movs	r0, #45	@ 0x2d
c0deace2:	5548      	strb	r0, [r1, r5]
c0deace4:	3501      	adds	r5, #1
c0deace6:	4820      	ldr	r0, [pc, #128]	@ (c0dead68 <snprintf+0x320>)
c0deace8:	f1bc 0f00 	cmp.w	ip, #0
c0deacec:	4478      	add	r0, pc
c0deacee:	bf08      	it	eq
c0deacf0:	4638      	moveq	r0, r7
c0deacf2:	f1ba 0f00 	cmp.w	sl, #0
c0deacf6:	d00b      	beq.n	c0dead10 <snprintf+0x2c8>
c0deacf8:	fbb2 f7fa 	udiv	r7, r2, sl
c0deacfc:	fbba faf3 	udiv	sl, sl, r3
c0dead00:	fbb7 f4f3 	udiv	r4, r7, r3
c0dead04:	fb04 7413 	mls	r4, r4, r3, r7
c0dead08:	5d04      	ldrb	r4, [r0, r4]
c0dead0a:	554c      	strb	r4, [r1, r5]
c0dead0c:	3501      	adds	r5, #1
c0dead0e:	e7f0      	b.n	c0deacf2 <snprintf+0x2aa>
c0dead10:	4545      	cmp	r5, r8
c0dead12:	bf28      	it	cs
c0dead14:	4645      	movcs	r5, r8
c0dead16:	9c00      	ldr	r4, [sp, #0]
c0dead18:	462a      	mov	r2, r5
c0dead1a:	4620      	mov	r0, r4
c0dead1c:	f000 fa40 	bl	c0deb1a0 <__aeabi_memmove>
c0dead20:	ebb8 0805 	subs.w	r8, r8, r5
c0dead24:	442c      	add	r4, r5
c0dead26:	f47f aea6 	bne.w	c0deaa76 <snprintf+0x2e>
c0dead2a:	e00f      	b.n	c0dead4c <snprintf+0x304>
c0dead2c:	7808      	ldrb	r0, [r1, #0]
c0dead2e:	2800      	cmp	r0, #0
c0dead30:	f47f aea1 	bne.w	c0deaa76 <snprintf+0x2e>
c0dead34:	4545      	cmp	r5, r8
c0dead36:	bf28      	it	cs
c0dead38:	4645      	movcs	r5, r8
c0dead3a:	4620      	mov	r0, r4
c0dead3c:	4629      	mov	r1, r5
c0dead3e:	2220      	movs	r2, #32
c0dead40:	f000 fa30 	bl	c0deb1a4 <__aeabi_memset>
c0dead44:	ebb8 0805 	subs.w	r8, r8, r5
c0dead48:	f47f af79 	bne.w	c0deac3e <snprintf+0x1f6>
c0dead4c:	2000      	movs	r0, #0
c0dead4e:	b007      	add	sp, #28
c0dead50:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dead54:	b001      	add	sp, #4
c0dead56:	4770      	bx	lr
c0dead58:	000038f6 	.word	0x000038f6
c0dead5c:	00003990 	.word	0x00003990
c0dead60:	00003904 	.word	0x00003904
c0dead64:	0000384a 	.word	0x0000384a
c0dead68:	00003814 	.word	0x00003814

c0dead6c <pic>:
c0dead6c:	4a0a      	ldr	r2, [pc, #40]	@ (c0dead98 <pic+0x2c>)
c0dead6e:	4282      	cmp	r2, r0
c0dead70:	490a      	ldr	r1, [pc, #40]	@ (c0dead9c <pic+0x30>)
c0dead72:	d806      	bhi.n	c0dead82 <pic+0x16>
c0dead74:	4281      	cmp	r1, r0
c0dead76:	d304      	bcc.n	c0dead82 <pic+0x16>
c0dead78:	b580      	push	{r7, lr}
c0dead7a:	f000 f815 	bl	c0deada8 <pic_internal>
c0dead7e:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0dead82:	4907      	ldr	r1, [pc, #28]	@ (c0deada0 <pic+0x34>)
c0dead84:	4288      	cmp	r0, r1
c0dead86:	4a07      	ldr	r2, [pc, #28]	@ (c0deada4 <pic+0x38>)
c0dead88:	d304      	bcc.n	c0dead94 <pic+0x28>
c0dead8a:	4290      	cmp	r0, r2
c0dead8c:	d802      	bhi.n	c0dead94 <pic+0x28>
c0dead8e:	1a40      	subs	r0, r0, r1
c0dead90:	4649      	mov	r1, r9
c0dead92:	4408      	add	r0, r1
c0dead94:	4770      	bx	lr
c0dead96:	0000      	movs	r0, r0
c0dead98:	c0de0000 	.word	0xc0de0000
c0dead9c:	c0dee96b 	.word	0xc0dee96b
c0deada0:	da7a0000 	.word	0xda7a0000
c0deada4:	da7a9000 	.word	0xda7a9000

c0deada8 <pic_internal>:
c0deada8:	467a      	mov	r2, pc
c0deadaa:	4902      	ldr	r1, [pc, #8]	@ (c0deadb4 <pic_internal+0xc>)
c0deadac:	1cc9      	adds	r1, r1, #3
c0deadae:	1a89      	subs	r1, r1, r2
c0deadb0:	1a40      	subs	r0, r0, r1
c0deadb2:	4770      	bx	lr
c0deadb4:	c0deada9 	.word	0xc0deada9

c0deadb8 <SVC_Call>:
c0deadb8:	df01      	svc	1
c0deadba:	2900      	cmp	r1, #0
c0deadbc:	d100      	bne.n	c0deadc0 <exception>
c0deadbe:	4770      	bx	lr

c0deadc0 <exception>:
c0deadc0:	4608      	mov	r0, r1
c0deadc2:	f7ff fe3a 	bl	c0deaa3a <os_longjmp>
	...

c0deadc8 <SVC_cx_call>:
c0deadc8:	df01      	svc	1
c0deadca:	4770      	bx	lr

c0deadcc <nbgl_wait_pipeline>:
c0deadcc:	b5e0      	push	{r5, r6, r7, lr}
c0deadce:	2000      	movs	r0, #0
c0deadd0:	9001      	str	r0, [sp, #4]
c0deadd2:	4802      	ldr	r0, [pc, #8]	@ (c0deaddc <nbgl_wait_pipeline+0x10>)
c0deadd4:	a901      	add	r1, sp, #4
c0deadd6:	f7ff ffef 	bl	c0deadb8 <SVC_Call>
c0deadda:	bd8c      	pop	{r2, r3, r7, pc}
c0deaddc:	00fa0011 	.word	0x00fa0011

c0deade0 <nvm_write>:
c0deade0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deade2:	ab01      	add	r3, sp, #4
c0deade4:	c307      	stmia	r3!, {r0, r1, r2}
c0deade6:	4802      	ldr	r0, [pc, #8]	@ (c0deadf0 <nvm_write+0x10>)
c0deade8:	a901      	add	r1, sp, #4
c0deadea:	f7ff ffe5 	bl	c0deadb8 <SVC_Call>
c0deadee:	bd8f      	pop	{r0, r1, r2, r3, r7, pc}
c0deadf0:	03000003 	.word	0x03000003

c0deadf4 <cx_ecdomain_parameters_length>:
c0deadf4:	b5e0      	push	{r5, r6, r7, lr}
c0deadf6:	e9cd 0100 	strd	r0, r1, [sp]
c0deadfa:	4802      	ldr	r0, [pc, #8]	@ (c0deae04 <cx_ecdomain_parameters_length+0x10>)
c0deadfc:	4669      	mov	r1, sp
c0deadfe:	f7ff ffe3 	bl	c0deadc8 <SVC_cx_call>
c0deae02:	bd8c      	pop	{r2, r3, r7, pc}
c0deae04:	0200012f 	.word	0x0200012f

c0deae08 <os_perso_derive_node_with_seed_key>:
c0deae08:	b510      	push	{r4, lr}
c0deae0a:	b088      	sub	sp, #32
c0deae0c:	9c0d      	ldr	r4, [sp, #52]	@ 0x34
c0deae0e:	9407      	str	r4, [sp, #28]
c0deae10:	9c0c      	ldr	r4, [sp, #48]	@ 0x30
c0deae12:	9406      	str	r4, [sp, #24]
c0deae14:	9c0b      	ldr	r4, [sp, #44]	@ 0x2c
c0deae16:	9405      	str	r4, [sp, #20]
c0deae18:	9c0a      	ldr	r4, [sp, #40]	@ 0x28
c0deae1a:	e88d 001f 	stmia.w	sp, {r0, r1, r2, r3, r4}
c0deae1e:	4803      	ldr	r0, [pc, #12]	@ (c0deae2c <os_perso_derive_node_with_seed_key+0x24>)
c0deae20:	4669      	mov	r1, sp
c0deae22:	f7ff ffc9 	bl	c0deadb8 <SVC_Call>
c0deae26:	b008      	add	sp, #32
c0deae28:	bd10      	pop	{r4, pc}
c0deae2a:	bf00      	nop
c0deae2c:	080000a6 	.word	0x080000a6

c0deae30 <os_pki_load_certificate>:
c0deae30:	b510      	push	{r4, lr}
c0deae32:	b086      	sub	sp, #24
c0deae34:	9c09      	ldr	r4, [sp, #36]	@ 0x24
c0deae36:	9405      	str	r4, [sp, #20]
c0deae38:	9c08      	ldr	r4, [sp, #32]
c0deae3a:	e88d 001f 	stmia.w	sp, {r0, r1, r2, r3, r4}
c0deae3e:	4803      	ldr	r0, [pc, #12]	@ (c0deae4c <os_pki_load_certificate+0x1c>)
c0deae40:	4669      	mov	r1, sp
c0deae42:	f7ff ffb9 	bl	c0deadb8 <SVC_Call>
c0deae46:	b006      	add	sp, #24
c0deae48:	bd10      	pop	{r4, pc}
c0deae4a:	bf00      	nop
c0deae4c:	060000aa 	.word	0x060000aa

c0deae50 <os_perso_is_pin_set>:
c0deae50:	b5e0      	push	{r5, r6, r7, lr}
c0deae52:	2000      	movs	r0, #0
c0deae54:	4669      	mov	r1, sp
c0deae56:	9001      	str	r0, [sp, #4]
c0deae58:	209e      	movs	r0, #158	@ 0x9e
c0deae5a:	f7ff ffad 	bl	c0deadb8 <SVC_Call>
c0deae5e:	b2c0      	uxtb	r0, r0
c0deae60:	bd8c      	pop	{r2, r3, r7, pc}

c0deae62 <os_global_pin_is_validated>:
c0deae62:	b5e0      	push	{r5, r6, r7, lr}
c0deae64:	2000      	movs	r0, #0
c0deae66:	4669      	mov	r1, sp
c0deae68:	9001      	str	r0, [sp, #4]
c0deae6a:	20a0      	movs	r0, #160	@ 0xa0
c0deae6c:	f7ff ffa4 	bl	c0deadb8 <SVC_Call>
c0deae70:	b2c0      	uxtb	r0, r0
c0deae72:	bd8c      	pop	{r2, r3, r7, pc}

c0deae74 <os_ux>:
c0deae74:	b5e0      	push	{r5, r6, r7, lr}
c0deae76:	f000 f885 	bl	c0deaf84 <OUTLINED_FUNCTION_0>
c0deae7a:	4802      	ldr	r0, [pc, #8]	@ (c0deae84 <os_ux+0x10>)
c0deae7c:	4669      	mov	r1, sp
c0deae7e:	f7ff ff9b 	bl	c0deadb8 <SVC_Call>
c0deae82:	bd8c      	pop	{r2, r3, r7, pc}
c0deae84:	01000064 	.word	0x01000064

c0deae88 <os_flags>:
c0deae88:	b5e0      	push	{r5, r6, r7, lr}
c0deae8a:	2000      	movs	r0, #0
c0deae8c:	4669      	mov	r1, sp
c0deae8e:	9001      	str	r0, [sp, #4]
c0deae90:	206a      	movs	r0, #106	@ 0x6a
c0deae92:	f7ff ff91 	bl	c0deadb8 <SVC_Call>
c0deae96:	bd8c      	pop	{r2, r3, r7, pc}

c0deae98 <os_setting_get>:
c0deae98:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deae9a:	ab01      	add	r3, sp, #4
c0deae9c:	c307      	stmia	r3!, {r0, r1, r2}
c0deae9e:	4803      	ldr	r0, [pc, #12]	@ (c0deaeac <os_setting_get+0x14>)
c0deaea0:	a901      	add	r1, sp, #4
c0deaea2:	f7ff ff89 	bl	c0deadb8 <SVC_Call>
c0deaea6:	b004      	add	sp, #16
c0deaea8:	bd80      	pop	{r7, pc}
c0deaeaa:	bf00      	nop
c0deaeac:	03000070 	.word	0x03000070

c0deaeb0 <os_registry_get_current_app_tag>:
c0deaeb0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deaeb2:	ab01      	add	r3, sp, #4
c0deaeb4:	c307      	stmia	r3!, {r0, r1, r2}
c0deaeb6:	4803      	ldr	r0, [pc, #12]	@ (c0deaec4 <os_registry_get_current_app_tag+0x14>)
c0deaeb8:	a901      	add	r1, sp, #4
c0deaeba:	f7ff ff7d 	bl	c0deadb8 <SVC_Call>
c0deaebe:	b004      	add	sp, #16
c0deaec0:	bd80      	pop	{r7, pc}
c0deaec2:	bf00      	nop
c0deaec4:	03000074 	.word	0x03000074

c0deaec8 <os_sched_exit>:
c0deaec8:	b082      	sub	sp, #8
c0deaeca:	f000 f85b 	bl	c0deaf84 <OUTLINED_FUNCTION_0>
c0deaece:	4802      	ldr	r0, [pc, #8]	@ (c0deaed8 <os_sched_exit+0x10>)
c0deaed0:	4669      	mov	r1, sp
c0deaed2:	f7ff ff71 	bl	c0deadb8 <SVC_Call>
c0deaed6:	deff      	udf	#255	@ 0xff
c0deaed8:	0100009a 	.word	0x0100009a

c0deaedc <os_io_init>:
c0deaedc:	b5e0      	push	{r5, r6, r7, lr}
c0deaede:	9001      	str	r0, [sp, #4]
c0deaee0:	4802      	ldr	r0, [pc, #8]	@ (c0deaeec <os_io_init+0x10>)
c0deaee2:	a901      	add	r1, sp, #4
c0deaee4:	f7ff ff68 	bl	c0deadb8 <SVC_Call>
c0deaee8:	bd8c      	pop	{r2, r3, r7, pc}
c0deaeea:	bf00      	nop
c0deaeec:	01000084 	.word	0x01000084

c0deaef0 <os_io_start>:
c0deaef0:	b5e0      	push	{r5, r6, r7, lr}
c0deaef2:	2000      	movs	r0, #0
c0deaef4:	4669      	mov	r1, sp
c0deaef6:	9001      	str	r0, [sp, #4]
c0deaef8:	4801      	ldr	r0, [pc, #4]	@ (c0deaf00 <os_io_start+0x10>)
c0deaefa:	f7ff ff5d 	bl	c0deadb8 <SVC_Call>
c0deaefe:	bd8c      	pop	{r2, r3, r7, pc}
c0deaf00:	01000085 	.word	0x01000085

c0deaf04 <os_io_tx_cmd>:
c0deaf04:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deaf06:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0deaf0a:	4803      	ldr	r0, [pc, #12]	@ (c0deaf18 <os_io_tx_cmd+0x14>)
c0deaf0c:	4669      	mov	r1, sp
c0deaf0e:	f7ff ff53 	bl	c0deadb8 <SVC_Call>
c0deaf12:	b004      	add	sp, #16
c0deaf14:	bd80      	pop	{r7, pc}
c0deaf16:	bf00      	nop
c0deaf18:	04000088 	.word	0x04000088

c0deaf1c <os_io_rx_evt>:
c0deaf1c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deaf1e:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0deaf22:	4803      	ldr	r0, [pc, #12]	@ (c0deaf30 <os_io_rx_evt+0x14>)
c0deaf24:	4669      	mov	r1, sp
c0deaf26:	f7ff ff47 	bl	c0deadb8 <SVC_Call>
c0deaf2a:	b004      	add	sp, #16
c0deaf2c:	bd80      	pop	{r7, pc}
c0deaf2e:	bf00      	nop
c0deaf30:	03000089 	.word	0x03000089

c0deaf34 <try_context_get>:
c0deaf34:	b5e0      	push	{r5, r6, r7, lr}
c0deaf36:	2000      	movs	r0, #0
c0deaf38:	4669      	mov	r1, sp
c0deaf3a:	9001      	str	r0, [sp, #4]
c0deaf3c:	2087      	movs	r0, #135	@ 0x87
c0deaf3e:	f7ff ff3b 	bl	c0deadb8 <SVC_Call>
c0deaf42:	bd8c      	pop	{r2, r3, r7, pc}

c0deaf44 <try_context_set>:
c0deaf44:	b5e0      	push	{r5, r6, r7, lr}
c0deaf46:	f000 f81d 	bl	c0deaf84 <OUTLINED_FUNCTION_0>
c0deaf4a:	4802      	ldr	r0, [pc, #8]	@ (c0deaf54 <try_context_set+0x10>)
c0deaf4c:	4669      	mov	r1, sp
c0deaf4e:	f7ff ff33 	bl	c0deadb8 <SVC_Call>
c0deaf52:	bd8c      	pop	{r2, r3, r7, pc}
c0deaf54:	0100010b 	.word	0x0100010b

c0deaf58 <os_sched_last_status>:
c0deaf58:	b5e0      	push	{r5, r6, r7, lr}
c0deaf5a:	f000 f813 	bl	c0deaf84 <OUTLINED_FUNCTION_0>
c0deaf5e:	4803      	ldr	r0, [pc, #12]	@ (c0deaf6c <os_sched_last_status+0x14>)
c0deaf60:	4669      	mov	r1, sp
c0deaf62:	f7ff ff29 	bl	c0deadb8 <SVC_Call>
c0deaf66:	b2c0      	uxtb	r0, r0
c0deaf68:	bd8c      	pop	{r2, r3, r7, pc}
c0deaf6a:	bf00      	nop
c0deaf6c:	0100009c 	.word	0x0100009c

c0deaf70 <touch_get_last_info>:
c0deaf70:	b5e0      	push	{r5, r6, r7, lr}
c0deaf72:	9001      	str	r0, [sp, #4]
c0deaf74:	4802      	ldr	r0, [pc, #8]	@ (c0deaf80 <touch_get_last_info+0x10>)
c0deaf76:	a901      	add	r1, sp, #4
c0deaf78:	f7ff ff1e 	bl	c0deadb8 <SVC_Call>
c0deaf7c:	bd8c      	pop	{r2, r3, r7, pc}
c0deaf7e:	bf00      	nop
c0deaf80:	01fa000b 	.word	0x01fa000b

c0deaf84 <OUTLINED_FUNCTION_0>:
c0deaf84:	2100      	movs	r1, #0
c0deaf86:	e9cd 0100 	strd	r0, r1, [sp]
c0deaf8a:	4770      	bx	lr

c0deaf8c <__aeabi_llsl>:
c0deaf8c:	0693      	lsls	r3, r2, #26
c0deaf8e:	d408      	bmi.n	c0deafa2 <__aeabi_llsl+0x16>
c0deaf90:	b132      	cbz	r2, c0deafa0 <__aeabi_llsl+0x14>
c0deaf92:	f1c2 0320 	rsb	r3, r2, #32
c0deaf96:	4091      	lsls	r1, r2
c0deaf98:	fa20 f303 	lsr.w	r3, r0, r3
c0deaf9c:	4090      	lsls	r0, r2
c0deaf9e:	4319      	orrs	r1, r3
c0deafa0:	4770      	bx	lr
c0deafa2:	f1a2 0120 	sub.w	r1, r2, #32
c0deafa6:	fa00 f101 	lsl.w	r1, r0, r1
c0deafaa:	2000      	movs	r0, #0
c0deafac:	4770      	bx	lr
	...

c0deafb0 <__aeabi_llsr>:
c0deafb0:	0693      	lsls	r3, r2, #26
c0deafb2:	d408      	bmi.n	c0deafc6 <__aeabi_llsr+0x16>
c0deafb4:	b132      	cbz	r2, c0deafc4 <__aeabi_llsr+0x14>
c0deafb6:	f1c2 0320 	rsb	r3, r2, #32
c0deafba:	40d0      	lsrs	r0, r2
c0deafbc:	fa01 f303 	lsl.w	r3, r1, r3
c0deafc0:	40d1      	lsrs	r1, r2
c0deafc2:	4318      	orrs	r0, r3
c0deafc4:	4770      	bx	lr
c0deafc6:	f1a2 0020 	sub.w	r0, r2, #32
c0deafca:	fa21 f000 	lsr.w	r0, r1, r0
c0deafce:	2100      	movs	r1, #0
c0deafd0:	4770      	bx	lr
	...

c0deafd4 <__udivmoddi4>:
c0deafd4:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0deafd8:	f8dd c020 	ldr.w	ip, [sp, #32]
c0deafdc:	4604      	mov	r4, r0
c0deafde:	b179      	cbz	r1, c0deb000 <__udivmoddi4+0x2c>
c0deafe0:	b1ba      	cbz	r2, c0deb012 <__udivmoddi4+0x3e>
c0deafe2:	b35b      	cbz	r3, c0deb03c <__udivmoddi4+0x68>
c0deafe4:	fab1 f581 	clz	r5, r1
c0deafe8:	fab3 f683 	clz	r6, r3
c0deafec:	1b75      	subs	r5, r6, r5
c0deafee:	2d20      	cmp	r5, #32
c0deaff0:	d34a      	bcc.n	c0deb088 <__udivmoddi4+0xb4>
c0deaff2:	f1bc 0f00 	cmp.w	ip, #0
c0deaff6:	bf18      	it	ne
c0deaff8:	e9cc 4100 	strdne	r4, r1, [ip]
c0deaffc:	2400      	movs	r4, #0
c0deaffe:	e066      	b.n	c0deb0ce <__udivmoddi4+0xfa>
c0deb000:	b3cb      	cbz	r3, c0deb076 <__udivmoddi4+0xa2>
c0deb002:	2100      	movs	r1, #0
c0deb004:	f1bc 0f00 	cmp.w	ip, #0
c0deb008:	bf18      	it	ne
c0deb00a:	e9cc 4100 	strdne	r4, r1, [ip]
c0deb00e:	2400      	movs	r4, #0
c0deb010:	e0a6      	b.n	c0deb160 <__udivmoddi4+0x18c>
c0deb012:	2b00      	cmp	r3, #0
c0deb014:	d03e      	beq.n	c0deb094 <__udivmoddi4+0xc0>
c0deb016:	2800      	cmp	r0, #0
c0deb018:	d04f      	beq.n	c0deb0ba <__udivmoddi4+0xe6>
c0deb01a:	1e5d      	subs	r5, r3, #1
c0deb01c:	422b      	tst	r3, r5
c0deb01e:	d158      	bne.n	c0deb0d2 <__udivmoddi4+0xfe>
c0deb020:	f1bc 0f00 	cmp.w	ip, #0
c0deb024:	bf1c      	itt	ne
c0deb026:	ea05 0001 	andne.w	r0, r5, r1
c0deb02a:	e9cc 4000 	strdne	r4, r0, [ip]
c0deb02e:	fa93 f0a3 	rbit	r0, r3
c0deb032:	fab0 f080 	clz	r0, r0
c0deb036:	fa21 f400 	lsr.w	r4, r1, r0
c0deb03a:	e048      	b.n	c0deb0ce <__udivmoddi4+0xfa>
c0deb03c:	1e55      	subs	r5, r2, #1
c0deb03e:	422a      	tst	r2, r5
c0deb040:	d129      	bne.n	c0deb096 <__udivmoddi4+0xc2>
c0deb042:	f1bc 0f00 	cmp.w	ip, #0
c0deb046:	bf1e      	ittt	ne
c0deb048:	2300      	movne	r3, #0
c0deb04a:	4005      	andne	r5, r0
c0deb04c:	e9cc 5300 	strdne	r5, r3, [ip]
c0deb050:	2a01      	cmp	r2, #1
c0deb052:	f000 8085 	beq.w	c0deb160 <__udivmoddi4+0x18c>
c0deb056:	fa92 f2a2 	rbit	r2, r2
c0deb05a:	004c      	lsls	r4, r1, #1
c0deb05c:	fab2 f282 	clz	r2, r2
c0deb060:	f002 031f 	and.w	r3, r2, #31
c0deb064:	40d1      	lsrs	r1, r2
c0deb066:	40d8      	lsrs	r0, r3
c0deb068:	231f      	movs	r3, #31
c0deb06a:	4393      	bics	r3, r2
c0deb06c:	fa04 f303 	lsl.w	r3, r4, r3
c0deb070:	ea43 0400 	orr.w	r4, r3, r0
c0deb074:	e074      	b.n	c0deb160 <__udivmoddi4+0x18c>
c0deb076:	fbb0 f4f2 	udiv	r4, r0, r2
c0deb07a:	f1bc 0f00 	cmp.w	ip, #0
c0deb07e:	d026      	beq.n	c0deb0ce <__udivmoddi4+0xfa>
c0deb080:	fb04 0012 	mls	r0, r4, r2, r0
c0deb084:	2100      	movs	r1, #0
c0deb086:	e020      	b.n	c0deb0ca <__udivmoddi4+0xf6>
c0deb088:	f105 0e01 	add.w	lr, r5, #1
c0deb08c:	f1be 0f20 	cmp.w	lr, #32
c0deb090:	d00b      	beq.n	c0deb0aa <__udivmoddi4+0xd6>
c0deb092:	e028      	b.n	c0deb0e6 <__udivmoddi4+0x112>
c0deb094:	e064      	b.n	c0deb160 <__udivmoddi4+0x18c>
c0deb096:	fab1 f481 	clz	r4, r1
c0deb09a:	fab2 f582 	clz	r5, r2
c0deb09e:	1b2c      	subs	r4, r5, r4
c0deb0a0:	f104 0e21 	add.w	lr, r4, #33	@ 0x21
c0deb0a4:	f1be 0f20 	cmp.w	lr, #32
c0deb0a8:	d15d      	bne.n	c0deb166 <__udivmoddi4+0x192>
c0deb0aa:	f04f 0e20 	mov.w	lr, #32
c0deb0ae:	f04f 0a00 	mov.w	sl, #0
c0deb0b2:	f04f 0b00 	mov.w	fp, #0
c0deb0b6:	460e      	mov	r6, r1
c0deb0b8:	e021      	b.n	c0deb0fe <__udivmoddi4+0x12a>
c0deb0ba:	fbb1 f4f3 	udiv	r4, r1, r3
c0deb0be:	f1bc 0f00 	cmp.w	ip, #0
c0deb0c2:	d004      	beq.n	c0deb0ce <__udivmoddi4+0xfa>
c0deb0c4:	2000      	movs	r0, #0
c0deb0c6:	fb04 1113 	mls	r1, r4, r3, r1
c0deb0ca:	e9cc 0100 	strd	r0, r1, [ip]
c0deb0ce:	2100      	movs	r1, #0
c0deb0d0:	e046      	b.n	c0deb160 <__udivmoddi4+0x18c>
c0deb0d2:	fab1 f581 	clz	r5, r1
c0deb0d6:	fab3 f683 	clz	r6, r3
c0deb0da:	1b75      	subs	r5, r6, r5
c0deb0dc:	2d1f      	cmp	r5, #31
c0deb0de:	f4bf af88 	bcs.w	c0deaff2 <__udivmoddi4+0x1e>
c0deb0e2:	f105 0e01 	add.w	lr, r5, #1
c0deb0e6:	fa20 f40e 	lsr.w	r4, r0, lr
c0deb0ea:	f1c5 051f 	rsb	r5, r5, #31
c0deb0ee:	fa01 f605 	lsl.w	r6, r1, r5
c0deb0f2:	fa21 fb0e 	lsr.w	fp, r1, lr
c0deb0f6:	40a8      	lsls	r0, r5
c0deb0f8:	f04f 0a00 	mov.w	sl, #0
c0deb0fc:	4326      	orrs	r6, r4
c0deb0fe:	f04f 0800 	mov.w	r8, #0
c0deb102:	f1be 0f00 	cmp.w	lr, #0
c0deb106:	d01c      	beq.n	c0deb142 <__udivmoddi4+0x16e>
c0deb108:	ea4f 014b 	mov.w	r1, fp, lsl #1
c0deb10c:	f1ae 0e01 	sub.w	lr, lr, #1
c0deb110:	ea41 71d6 	orr.w	r1, r1, r6, lsr #31
c0deb114:	0076      	lsls	r6, r6, #1
c0deb116:	ea46 75d0 	orr.w	r5, r6, r0, lsr #31
c0deb11a:	1aae      	subs	r6, r5, r2
c0deb11c:	eb61 0b03 	sbc.w	fp, r1, r3
c0deb120:	43cf      	mvns	r7, r1
c0deb122:	43ec      	mvns	r4, r5
c0deb124:	18a4      	adds	r4, r4, r2
c0deb126:	eb57 0403 	adcs.w	r4, r7, r3
c0deb12a:	bf5c      	itt	pl
c0deb12c:	468b      	movpl	fp, r1
c0deb12e:	462e      	movpl	r6, r5
c0deb130:	0040      	lsls	r0, r0, #1
c0deb132:	0fe1      	lsrs	r1, r4, #31
c0deb134:	ea48 044a 	orr.w	r4, r8, sl, lsl #1
c0deb138:	ea40 70da 	orr.w	r0, r0, sl, lsr #31
c0deb13c:	46a2      	mov	sl, r4
c0deb13e:	4688      	mov	r8, r1
c0deb140:	e7df      	b.n	c0deb102 <__udivmoddi4+0x12e>
c0deb142:	ea4f 71da 	mov.w	r1, sl, lsr #31
c0deb146:	f1bc 0f00 	cmp.w	ip, #0
c0deb14a:	bf18      	it	ne
c0deb14c:	e9cc 6b00 	strdne	r6, fp, [ip]
c0deb150:	ea41 0140 	orr.w	r1, r1, r0, lsl #1
c0deb154:	ea4f 004a 	mov.w	r0, sl, lsl #1
c0deb158:	f020 0001 	bic.w	r0, r0, #1
c0deb15c:	ea40 0408 	orr.w	r4, r0, r8
c0deb160:	4620      	mov	r0, r4
c0deb162:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0deb166:	f1be 0f1f 	cmp.w	lr, #31
c0deb16a:	d804      	bhi.n	c0deb176 <__udivmoddi4+0x1a2>
c0deb16c:	fa20 f40e 	lsr.w	r4, r0, lr
c0deb170:	f1ce 0520 	rsb	r5, lr, #32
c0deb174:	e7bb      	b.n	c0deb0ee <__udivmoddi4+0x11a>
c0deb176:	f1ce 0740 	rsb	r7, lr, #64	@ 0x40
c0deb17a:	f1ae 0420 	sub.w	r4, lr, #32
c0deb17e:	f04f 0b00 	mov.w	fp, #0
c0deb182:	fa20 f504 	lsr.w	r5, r0, r4
c0deb186:	fa01 f607 	lsl.w	r6, r1, r7
c0deb18a:	fa00 fa07 	lsl.w	sl, r0, r7
c0deb18e:	ea46 0805 	orr.w	r8, r6, r5
c0deb192:	fa21 f604 	lsr.w	r6, r1, r4
c0deb196:	4640      	mov	r0, r8
c0deb198:	e7b1      	b.n	c0deb0fe <__udivmoddi4+0x12a>
	...

c0deb19c <__aeabi_memcpy>:
c0deb19c:	f000 b82c 	b.w	c0deb1f8 <memcpy>

c0deb1a0 <__aeabi_memmove>:
c0deb1a0:	f000 b838 	b.w	c0deb214 <memmove>

c0deb1a4 <__aeabi_memset>:
c0deb1a4:	460b      	mov	r3, r1
c0deb1a6:	4611      	mov	r1, r2
c0deb1a8:	461a      	mov	r2, r3
c0deb1aa:	f000 b84d 	b.w	c0deb248 <memset>
c0deb1ae:	bf00      	nop

c0deb1b0 <__aeabi_memclr>:
c0deb1b0:	460a      	mov	r2, r1
c0deb1b2:	2100      	movs	r1, #0
c0deb1b4:	f000 b848 	b.w	c0deb248 <memset>

c0deb1b8 <__aeabi_uldivmod>:
c0deb1b8:	b540      	push	{r6, lr}
c0deb1ba:	b084      	sub	sp, #16
c0deb1bc:	ae02      	add	r6, sp, #8
c0deb1be:	9600      	str	r6, [sp, #0]
c0deb1c0:	f7ff ff08 	bl	c0deafd4 <__udivmoddi4>
c0deb1c4:	9a02      	ldr	r2, [sp, #8]
c0deb1c6:	9b03      	ldr	r3, [sp, #12]
c0deb1c8:	b004      	add	sp, #16
c0deb1ca:	bd40      	pop	{r6, pc}

c0deb1cc <explicit_bzero>:
c0deb1cc:	f000 b800 	b.w	c0deb1d0 <bzero>

c0deb1d0 <bzero>:
c0deb1d0:	460a      	mov	r2, r1
c0deb1d2:	2100      	movs	r1, #0
c0deb1d4:	f000 b838 	b.w	c0deb248 <memset>

c0deb1d8 <memcmp>:
c0deb1d8:	b510      	push	{r4, lr}
c0deb1da:	3901      	subs	r1, #1
c0deb1dc:	4402      	add	r2, r0
c0deb1de:	4290      	cmp	r0, r2
c0deb1e0:	d101      	bne.n	c0deb1e6 <memcmp+0xe>
c0deb1e2:	2000      	movs	r0, #0
c0deb1e4:	e005      	b.n	c0deb1f2 <memcmp+0x1a>
c0deb1e6:	7803      	ldrb	r3, [r0, #0]
c0deb1e8:	f811 4f01 	ldrb.w	r4, [r1, #1]!
c0deb1ec:	42a3      	cmp	r3, r4
c0deb1ee:	d001      	beq.n	c0deb1f4 <memcmp+0x1c>
c0deb1f0:	1b18      	subs	r0, r3, r4
c0deb1f2:	bd10      	pop	{r4, pc}
c0deb1f4:	3001      	adds	r0, #1
c0deb1f6:	e7f2      	b.n	c0deb1de <memcmp+0x6>

c0deb1f8 <memcpy>:
c0deb1f8:	440a      	add	r2, r1
c0deb1fa:	4291      	cmp	r1, r2
c0deb1fc:	f100 33ff 	add.w	r3, r0, #4294967295	@ 0xffffffff
c0deb200:	d100      	bne.n	c0deb204 <memcpy+0xc>
c0deb202:	4770      	bx	lr
c0deb204:	b510      	push	{r4, lr}
c0deb206:	f811 4b01 	ldrb.w	r4, [r1], #1
c0deb20a:	4291      	cmp	r1, r2
c0deb20c:	f803 4f01 	strb.w	r4, [r3, #1]!
c0deb210:	d1f9      	bne.n	c0deb206 <memcpy+0xe>
c0deb212:	bd10      	pop	{r4, pc}

c0deb214 <memmove>:
c0deb214:	4288      	cmp	r0, r1
c0deb216:	b510      	push	{r4, lr}
c0deb218:	eb01 0402 	add.w	r4, r1, r2
c0deb21c:	d902      	bls.n	c0deb224 <memmove+0x10>
c0deb21e:	4284      	cmp	r4, r0
c0deb220:	4623      	mov	r3, r4
c0deb222:	d807      	bhi.n	c0deb234 <memmove+0x20>
c0deb224:	1e43      	subs	r3, r0, #1
c0deb226:	42a1      	cmp	r1, r4
c0deb228:	d008      	beq.n	c0deb23c <memmove+0x28>
c0deb22a:	f811 2b01 	ldrb.w	r2, [r1], #1
c0deb22e:	f803 2f01 	strb.w	r2, [r3, #1]!
c0deb232:	e7f8      	b.n	c0deb226 <memmove+0x12>
c0deb234:	4601      	mov	r1, r0
c0deb236:	4402      	add	r2, r0
c0deb238:	428a      	cmp	r2, r1
c0deb23a:	d100      	bne.n	c0deb23e <memmove+0x2a>
c0deb23c:	bd10      	pop	{r4, pc}
c0deb23e:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
c0deb242:	f802 4d01 	strb.w	r4, [r2, #-1]!
c0deb246:	e7f7      	b.n	c0deb238 <memmove+0x24>

c0deb248 <memset>:
c0deb248:	4603      	mov	r3, r0
c0deb24a:	4402      	add	r2, r0
c0deb24c:	4293      	cmp	r3, r2
c0deb24e:	d100      	bne.n	c0deb252 <memset+0xa>
c0deb250:	4770      	bx	lr
c0deb252:	f803 1b01 	strb.w	r1, [r3], #1
c0deb256:	e7f9      	b.n	c0deb24c <memset+0x4>

c0deb258 <setjmp>:
c0deb258:	46ec      	mov	ip, sp
c0deb25a:	e8a0 5ff0 	stmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
c0deb25e:	f04f 0000 	mov.w	r0, #0
c0deb262:	4770      	bx	lr

c0deb264 <longjmp>:
c0deb264:	e8b0 5ff0 	ldmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
c0deb268:	46e5      	mov	sp, ip
c0deb26a:	0008      	movs	r0, r1
c0deb26c:	bf08      	it	eq
c0deb26e:	2001      	moveq	r0, #1
c0deb270:	4770      	bx	lr
c0deb272:	bf00      	nop

c0deb274 <strcmp>:
c0deb274:	f810 2b01 	ldrb.w	r2, [r0], #1
c0deb278:	f811 3b01 	ldrb.w	r3, [r1], #1
c0deb27c:	2a01      	cmp	r2, #1
c0deb27e:	bf28      	it	cs
c0deb280:	429a      	cmpcs	r2, r3
c0deb282:	d0f7      	beq.n	c0deb274 <strcmp>
c0deb284:	1ad0      	subs	r0, r2, r3
c0deb286:	4770      	bx	lr

c0deb288 <strlen>:
c0deb288:	4603      	mov	r3, r0
c0deb28a:	f813 2b01 	ldrb.w	r2, [r3], #1
c0deb28e:	2a00      	cmp	r2, #0
c0deb290:	d1fb      	bne.n	c0deb28a <strlen+0x2>
c0deb292:	1a18      	subs	r0, r3, r0
c0deb294:	3801      	subs	r0, #1
c0deb296:	4770      	bx	lr

c0deb298 <strncpy>:
c0deb298:	4603      	mov	r3, r0
c0deb29a:	b510      	push	{r4, lr}
c0deb29c:	3901      	subs	r1, #1
c0deb29e:	b132      	cbz	r2, c0deb2ae <strncpy+0x16>
c0deb2a0:	f811 4f01 	ldrb.w	r4, [r1, #1]!
c0deb2a4:	3a01      	subs	r2, #1
c0deb2a6:	f803 4b01 	strb.w	r4, [r3], #1
c0deb2aa:	2c00      	cmp	r4, #0
c0deb2ac:	d1f7      	bne.n	c0deb29e <strncpy+0x6>
c0deb2ae:	2100      	movs	r1, #0
c0deb2b0:	441a      	add	r2, r3
c0deb2b2:	4293      	cmp	r3, r2
c0deb2b4:	d100      	bne.n	c0deb2b8 <strncpy+0x20>
c0deb2b6:	bd10      	pop	{r4, pc}
c0deb2b8:	f803 1b01 	strb.w	r1, [r3], #1
c0deb2bc:	e7f9      	b.n	c0deb2b2 <strncpy+0x1a>

c0deb2be <C_app_zknox_64px_bitmap>:
c0deb2be:	0040 0040 8922 0002 ffff ffff ffff ffff     @.@."...........
c0deb2ce:	ffff ffff 0ed7 f55d a39d 3010 8311 f0ad     ......]....0....
c0deb2de:	030b 0110 0070 4c81 0dec 2005 0001 7031     ....p..L... ..1p
c0deb2ee:	0d04 0be9 7231 5011 0a01 99e7 2001 7223     ....1r.P..... #r
c0deb2fe:	1102 8140 e47e 1287 4315 2162 0450 e20e     ..@.~....Cb!P...
c0deb30e:	13b8 4065 5263 4031 e106 13ab 1485 0373     ..e@cR1@......s.
c0deb31e:	2142 0750 addf 6513 5364 2142 0b50 96de     B!P....edSB!P...
c0deb32e:	6027 0474 5243 4021 0d01 9bdc 8015 5325     '`t.CR!@......%S
c0deb33e:	4304 3152 0640 b6dc 6549 b530 a989 0680     .CR1@...Ie0.....
c0deb34e:	4312 3142 0140 da0d 010c 8417 c57c c79e     .CB1@.......|...
c0deb35e:	3310 4142 0540 a8da 4b48 8ec9 33a4 4132     .3BA@...HK...32A
c0deb36e:	0140 c60e cd4e 7691 ccc0 330b 1122 3182     @...N..v...3"..1
c0deb37e:	0b60 0bc5 0231 9dcc c026 09ce 1302 0422     `...1...&.....".
c0deb38e:	1c0a 728b 0540 0bc5 0130 8bcc c748 c51e     ...r@...0...H...
c0deb39e:	060e 1213 0d04 ad1e a2ed 1440 c10d 030e     ..........@.....
c0deb3ae:	0130 88cc c55d 68bc b075 09c4 1302 ce92     0...]..hu.......
c0deb3be:	13a0 ed9a 1090 1a08 6489 0617 0140 cb0c     .........d..@...
c0deb3ce:	c515 080d 9d1e d0c6 0dc3 8623 31ed dc8c     ..........#..1..
c0deb3de:	0a15 0c1d 150b 8364 ca2d 0a02 06c5 c20e     ......d.-.......
c0deb3ee:	b68e 0ec3 1305 ca88 0931 4d1e 3b6c 319a     ........1..Ml;.1
c0deb3fe:	c9b0 0d04 0ec4 c407 040c 08c4 0113 0210     ................
c0deb40e:	0821 7d2e 6c0d 0308 07ca c40d 060e 0cc4     !..}.l..........
c0deb41e:	c405 23ba 705a 0931 2d2e 1d0e 2d4c a39c     ...#Zp1..-..L-..
c0deb42e:	cad0 0c08 08c5 c30c 0b09 bcc4 4e23 b5d0     ............#N..
c0deb43e:	3d01 0ce0 b220 d66e ab70 9858 0419 cb0d     .=.. .n.p.X.....
c0deb44e:	c01a c30e 5a8e 081d c509 060e 8912 1afd     .....Z..........
c0deb45e:	edad 1061 39aa c183 49be 30b7 cc07 7f8c     ..a..9...I.0....
c0deb46e:	c22e a8ae c79c 220b 3e09 818d 8710 1dc4     .......".>......
c0deb47e:	c20e 6b87 ce18 5e02 0eca 8ec1 1281 1a06     ...k...^........
c0deb48e:	4189 0610 190c b7c4 b516 ceb0 cf86 8f3e     .A............>.
c0deb49e:	1eef 3ec4 d89f 5120 a810 6ddc bbc4 a19c     ...>.. Q...m....
c0deb4ae:	cec0 6f8a 7e7e 8b4e 2062 6c81 0b1d c505     ...o~~N.b .l....
c0deb4be:	8abb d091 01cf 7e0d 5e7e 0c0d 3d2a 6b8c     .......~~^..*=.k
c0deb4ce:	0dc5 d039 7f8a 7e7e 2e7e 0a2d dd05 0c01     ..9...~~~.-.....
c0deb4de:	7e7e 0e7e 8c3d dd5d 040b 7e7e 0e7e 8c2d     ~~~.=.]...~~~.-.
c0deb4ee:	df7a 0807 7e7e 3d6e 0609 8ee0 7e39 5e7e     z...~~n=....9~~^
c0deb4fe:	0a2d e206 398e 7e7e 2d3e 0609 8ee4 7e38     -....9~~>-....8~
c0deb50e:	0e7e 083d e607 76be e0cf 7e0d 0e0d 9e2d     ~.=....v...~..-.
c0deb51e:	90b5 aae9 df29 7d1e 0c1e 0e17 beeb 6b80     ....)..}.......k
c0deb52e:	0ed0 4ec0 a5ad f03c 72ab 1836 52b7 d039     ...N..<..r6..R9.
c0deb53e:	1df5 1a0b 0e0d ffff ffff ffff ffff ffff     ................
c0deb54e:	                                             .

c0deb54f <C_app_zknox_64px>:
c0deb54f:	0040 0040 0102 b2be c0de                    @.@.......

c0deb559 <C_Check_Circle_64px_bitmap>:
c0deb559:	0040 0040 3321 0002 0231 8b1f 0008 0000     @.@.!3..1.......
c0deb569:	0000 0302 55ad 4e39 3103 fd14 6124 4b5f     .....U9N.1..$a_K
c0deb579:	8028 a091 2401 b888 4640 2054 4121 3949     (....$..@FT !AI9
c0deb589:	152d 00dc a090 1166 05a2 0171 1710 0a48     -.....f...q...H.
c0deb599:	026a 6017 41ab 8961 2404 9f21 65ef be66     j..`.Aa..$!..ef.
c0deb5a9:	0e3d c48b 9914 9fb1 fcfd fcfc 8cf3 7ff8     =...............
c0deb5b9:	f54f 1a60 7460 d8a9 de00 fd04 95cc 681c     O.`.`t.........h
c0deb5c9:	87cd c9e8 bf14 0185 7952 ae0b 301b 8b40     ........Ry...0@.
c0deb5d9:	c4b5 9cae 7cb5 f88d e070 ef89 0371 137e     .....|..p...q.~.
c0deb5e9:	fd5d 4e7a 4f7d d6b4 9e38 8ea5 b8f9 4c79     ].zN}O..8.....yL
c0deb5f9:	34cd e15b da9e 7c13 18bc 1930 a38b 5b15     .4[....|..0....[
c0deb609:	b94d a901 5a89 34af d0fa fbd4 5d41 b0b9     M....Z.4....A]..
c0deb619:	0ab1 6830 71fb 5315 0056 6e9a fc6c 2fb3     ..0h.q.SV..nl../
c0deb629:	24e2 dd75 bf49 012f d486 1057 ac8e 0a5a     .$u.I./...W...Z.
c0deb639:	aa32 dc97 5d54 3947 803e c954 7a63 b709     2...T]G9>.T.cz..
c0deb649:	815a c734 7fa9 bc41 000b 6a27 db3a e292     Z.4...A...'j:...
c0deb659:	12ed 3f6f 8274 64b6 f810 4052 a01d de23     ..o?t..d..R@..#.
c0deb669:	2712 6220 73a5 9d0a cf04 db00 e588 5bd8     .' b.s.........[
c0deb679:	e08b 0a5d 027c a128 8093 ee56 ab15 0ca4     ..].|.(...V.....
c0deb689:	1953 0781 889d a1eb 493b 0082 11da c517     S.......;I......
c0deb699:	9b8f 4760 f54c 0b95 822e f14b 41ed 360f     ..`GL.....K..A.6
c0deb6a9:	b820 d215 48a4 c137 3093 c2c8 8139 e70b      ....H7..0..9...
c0deb6b9:	4e04 105c 30ac d4dc 08a7 9856 acbe 7c5d     .N\..0....V...]|
c0deb6c9:	5e31 0710 701c 347f 5aff 4fe8 36b3 adc9     1^...p.4.Z.O.6..
c0deb6d9:	802f c436 7653 d63e 3cfe 2d61 5f3f ba73     /.6.Sv>..<a-?_s.
c0deb6e9:	df3a acb2 d712 0ff4 1f59 2554 6ec3 5f7b     :.......Y.T%.n{_
c0deb6f9:	6554 3b01 e340 8e78 cad4 febe e91f 4c92     Te.;@.x........L
c0deb709:	f2b3 e8c9 ce32 92b3 a68c 3457 3971 702e     ....2.....W4q9.p
c0deb719:	b6aa 0f34 d91d e35f f2e1 639e a7d5 fd79     ..4..._....c..y.
c0deb729:	ba44 dde8 6369 1aef c3e5 3464 9dd2 272f     D...ic....d4../'
c0deb739:	cbbf 1fa7 8df3 b09c 9b03 5328 2325 8d5f     ..........(S%#_.
c0deb749:	3ec0 f233 eb15 7359 39c0 5158 f322 2c7d     .>3...Ys.9XQ".},
c0deb759:	f7cc 448d cbbe a6c0 e1fb f102 dd51 030f     ...D........Q...
c0deb769:	0898 fe6c ec64 ac2b 19ea f170 f7af 2d1b     ..l.d.+...p....-
c0deb779:	1fb1 b3c2 2e0d dad0 0cd6 c8c0 fe72 af1f     ............r...
c0deb789:	fc6c 2402 5a14 00c5 0008                     l..$.Z.....

c0deb794 <C_Check_Circle_64px>:
c0deb794:	0040 0040 0102 b559 c0de                    @.@...Y...

c0deb79e <C_Denied_Circle_64px_bitmap>:
c0deb79e:	0040 0040 3021 0002 022e 8b1f 0008 0000     @.@.!0..........
c0deb7ae:	0000 0302 55ad 2f4b 4104 2e10 bd6b 479f     .....UK/.A..k..G
c0deb7be:	d80e 4884 ac90 3f8d e260 2244 e8e1 71b8     ...H...?`.D"...q
c0deb7ce:	e273 201f ece1 7111 fe25 f100 d607 d9c1     s.. ...q%.......
c0deb7de:	07f2 e63c d64c e363 a6b9 f554 a663 67a7     ..<.L.c...T.c..g
c0deb7ee:	9766 1f44 b676 babb beaa eafe 6aeb ffc4     f.D.v........j..
c0deb7fe:	5f1b 13fb 4300 c50b f304 a806 5331 b18a     ._...C......1S..
c0deb80e:	1c56 47f0 58ba 0cd5 2a90 6658 642f 6806     V..G.X...*Xf/d.h
c0deb81e:	52b4 08ec a5af c46b fdfb ff0c 0d1f df99     .R....k.........
c0deb82e:	a978 f947 bb78 5b3c ed35 5a39 0d98 47a6     x.G.x.<[5.9Z...G
c0deb83e:	ad34 3237 34b8 331f f3f7 6c86 8e00 3632     4.72.4.3...l..26
c0deb84e:	e185 09e6 3f8d a17b 07dd bc61 b41f a934     .....?{...a...4.
c0deb85e:	2b27 7d00 1f36 4157 4fc8 ba80 db1b ddfe     '+.}6.WA.O......
c0deb86e:	c7ed 7424 511d 2fbe fa01 bfe5 247c 42bb     ..$t.Q./....|$.B
c0deb87e:	9690 2555 e336 49ca 44a8 9e99 a3cd 831a     ..U%6..I.D......
c0deb88e:	e7d6 7bf8 7006 0f2c a96d a005 bf9d 668e     ...{.p,.m......f
c0deb89e:	5162 3ff3 bf2c 008e 01e0 8ab4 abe9 e34e     bQ.?,.........N.
c0deb8ae:	32c2 c0aa e712 3ab8 aa46 d8a4 7896 009f     .2.....:F....x..
c0deb8be:	10b6 facb 1974 9385 90e8 df1b c005 8047     ....t.........G.
c0deb8ce:	1a12 9eeb c7de bb99 4b38 a82a d662 e770     ........8K*.b.p.
c0deb8de:	6d88 6b88 3b3e 12c2 33b8 16a2 79c4 09fe     .m.k>;...3...y..
c0deb8ee:	1802 b8ee aecd 648e 0741 dc30 44a9 9cf5     .......dA.0..D..
c0deb8fe:	d3a4 91d4 8ee1 0cb7 804d 7434 1468 91e3     ........M.4th...
c0deb90e:	3209 1ced 7020 bbff 2e3d 2d7e b97c 7c40     .2.. p..=.~-|.@|
c0deb91e:	f9f6 b8ce f9c0 fc6a 2834 9292 6df8 3c46     ......j.4(...mF<
c0deb92e:	56a9 f69f f5da 0b2d 1895 aeeb 9abe 421f     .V....-........B
c0deb93e:	a41f 8192 7d78 4b3d 2965 4719 79f5 3328     ....x}=Ke).G.y(3
c0deb94e:	ea3b 451e 9df4 0691 b192 cdd5 fa4a 8b5a     ;..E........J.Z.
c0deb95e:	65c0 702d b86b bd6a 3762 9f17 151d 49d7     .e-pk.j.b7.....I
c0deb96e:	dfba d88a a4bb 90fe 77f5 f7c6 e397 f5df     .........w......
c0deb97e:	9aa7 8dfd a6af b0d5 4257 7442 86ed 1a7d     ........WBBt..}.
c0deb98e:	21d2 b97a 86f0 ee73 91cf 3efe f9a2 8f5f     .!z...s....>.._.
c0deb99e:	77f4 b0d1 7de9 40b8 907c 43ef 462f b61a     .w...}.@|..C/F..
c0deb9ae:	d239 13f6 95f6 9909 7f8b df7d c528 369e     9.........}.(..6
c0deb9be:	274f a03c cd95 8029 a5c1 3fc2 d93e 03f8     O'<...)....?>...
c0deb9ce:	a770 8485 0800 0000                         p.......

c0deb9d6 <C_Denied_Circle_64px>:
c0deb9d6:	0040 0040 0102 b79e c0de                    @.@.......

c0deb9e0 <C_Important_Circle_64px_bitmap>:
c0deb9e0:	0040 0040 fa21 0001 01f8 8b1f 0008 0000     @.@.!...........
c0deb9f0:	0000 0302 55b5 4ecd 40c2 1e10 fea1 cfe3     .....U.N.@......
c0deba00:	0f51 892a d45e 8904 602f 49e3 1313 7a3c     Q.*.^.../`.I..<z
c0deba10:	cae4 37cd 1350 a33d 70c6 f8d5 1802 005f     ...7P.=..p...._.
c0deba20:	9e0f 5f05 1fc0 1ace 4910 c054 b38e b6ed     ..._.....IT.....
c0deba30:	db74 d059 e704 76d0 dbf6 7cee 76fd 2dfa     t.Y....v...|.v.-
c0deba40:	ef62 99a2 055b d858 6a29 43e0 b190 6159     b...[.X.)j.C..Ya
c0deba50:	96d0 5e09 c518 308e a440 8010 052d 1806     ...^...0@...-...
c0deba60:	9408 b138 cadf 203c e4be e2e2 4979 3f81     ..8...< ....yI.?
c0deba70:	d0c4 7c94 3ac7 d915 1f9e d24f 56c0 bd3b     ...|.:....O..V;.
c0deba80:	34a4 abea a650 d97c 5f3f 484c c9b4 c551     .4..P.|.?_LH..Q.
c0deba90:	9541 9a6e 78d8 3bd9 3ecd f957 d17e 9ad0     A.n..x.;.>W.~...
c0debaa0:	ec9b cc02 f504 6fb8 d92f e800 0c7b dfe2     .......o/...{...
c0debab0:	de93 c49a 2c6e 77ac 6009 79d6 874a 4baa     ....n,.w.`.yJ..K
c0debac0:	8606 abb3 26a4 9db7 cac4 a6de ff9a 7d53     .....&........S}
c0debad0:	e341 7129 01bf b3c8 02dd 1310 d377 84a7     A.)q........w...
c0debae0:	a612 c04d 1802 71e1 d85a b9e1 e3c2 006f     ..M....qZ.....o.
c0debaf0:	c459 fb3a 2275 6d3e 5582 0a80 538f 09e5     Y.:.u">m.U...S..
c0debb00:	2551 eba2 38f7 228c f3ee 38ea 0ec2 6e23     Q%...8."...8..#n
c0debb10:	0b8b c71f 55e2 51d3 8b81 4412 9145 3b71     .....U.Q...DE.q;
c0debb20:	f769 20b6 159e 4f43 9a82 924d abc7 a042     i.. ..CO..M...B.
c0debb30:	c6ff f1bb 724b e7cd a06e 4521 e9d2 2fd3     ....Kr..n.!E.../
c0debb40:	d245 3be9 7884 69d5 627f f7dd 2eb7 b2c9     E..;.x.i.b......
c0debb50:	407f eeca 3992 af1e 9d39 ba05 bc0d 2a70     .@...9..9.....p*
c0debb60:	f29b 623f 19e8 8db2 1c0b 90dc d70b 0d35     ..?b..........5.
c0debb70:	965e ade3 b9a0 ea78 75c8 dd4d 2dff 7d85     ^.....x..uM..-.}
c0debb80:	f9d6 c243 c99b 4bfb 77fe d4fe dfd5 8948     ..C....K.w....H.
c0debb90:	61a0 92d3 8a91 afe2 618a 2b5f 8afe 5256     .a.......a_+..VR
c0debba0:	709d fc2b e439 8bef bfae 841f ddfc 6c36     .p+.9.........6l
c0debbb0:	1f3a 10ee 9d5f 61f3 431a ed86 230f 53d8     :..._..a.C...#.S
c0debbc0:	b8cd 1702 7aff 51be 3389 de17 f4d0 eb73     .....z.Q.3....s.
c0debbd0:	1d68 3e60 e853 91e1 3f8d c10e e439 0800     h.`>S....?..9...
	...

c0debbe2 <C_Important_Circle_64px>:
c0debbe2:	0040 0040 0102 b9e0 c0de                    @.@.......

c0debbec <C_Warning_64px_bitmap>:
c0debbec:	0040 0040 5f21 0001 015d 8b1f 0008 0000     @.@.!_..].......
c0debbfc:	0000 0302 d585 4e31 40c3 0510 8dd0 0885     ......1N.@......
c0debc0c:	454a 9149 25c2 52b2 08e4 4039 19c4 8272     JEI..%.R..9@..r.
c0debc1c:	815c 0384 b880 c441 7205 0a04 e7d2 6908     \.....A..r.....i
c0debc2c:	a202 a50b a113 ec1d 5d99 f6b3 1fee fb6f     .........]....o.
c0debc3c:	96c6 febc 4333 4f84 27b9 5ced ebf2 c293     ....3C.O.'.\....
c0debc4c:	53bf 2663 cf0a 318c 9d23 5bb1 e866 5176     .Sc&...1#..[f.vQ
c0debc5c:	60e1 7d06 3f5d b8fc ce41 24bc cce4 4273     .`.}]?..A..$..sB
c0debc6c:	eafe f818 e79b efb4 966a 4b7b 7339 c841     ........j.{K9sA.
c0debc7c:	ef99 f908 e431 bfd8 1c5a 7979 f15b 9090     ....1...Z.yy[...
c0debc8c:	8733 6891 f33b 1855 96a9 239f f96e 8f25     3..h;.U....#n.%.
c0debc9c:	7438 4b8e c9d6 bfeb 6f0b 3809 e0f3 8085     8t.K.....o.8....
c0debcac:	34db 977b c5b0 5dec 46c2 5dc8 90d8 9baf     .4{....].F.]....
c0debcbc:	94b8 9fc6 fa1b 4631 36dc 7d8c ba4e 3d17     ......1F.6.}N..=
c0debccc:	bdae e25f c4bc 9f6e eff4 eb93 164b f784     .._...n.....K...
c0debcdc:	2a9b fe68 5d4f 3d90 7743 5b05 7de8 70f9     .*h.O].=Cw.[.}.p
c0debcec:	ebf1 4416 ccf9 a1de 00bb a01f 39d3 b4ef     ...D.........9..
c0debcfc:	b74f bebf fef5 ed72 141b fba4 787b 2e82     O.....r.....{x..
c0debd0c:	f705 e9d8 1833 c93f f4f9 cfa1 9727 0297     ....3.?.....'...
c0debd1c:	14bb b04c c14b 7603 89f2 6e43 fa57 f77c     ..L.K..v..CnW.|.
c0debd2c:	db89 fbe8 4cc5 fd95 50b4 93f7 605f 6523     .....L...P.._`#e
c0debd3c:	e63f 73ba c6a0 fb3d f499 5e05 cbcd e43f     ?..s..=....^..?.
c0debd4c:	7b2a 0024 0008                               *{$....

c0debd53 <C_Warning_64px>:
c0debd53:	0040 0040 0102 bbec c0de                    @.@.......

c0debd5d <C_Back_40px_bitmap>:
c0debd5d:	0028 0028 8c21 0000 008a 8b1f 0008 0000     (.(.!...........
c0debd6d:	0000 0302 d3ed 09cd 20c0 800c d0d1 0e53     ......... ....S.
c0debd7d:	a21d 39a3 364a 9570 d26e c46d c143 c7e6     ...9J6p.n.m.C...
c0debd8d:	a8d6 73d0 f50f e110 81e3 b010 9794 f843     ...s..........C.
c0debd9d:	efb7 c3b6 53b7 4667 28df dcca b621 6196     .....SgF.(..!..a
c0debdad:	2b95 b601 0646 d04a 5b5b fa86 4192 376d     .+..F.J.[[...Am7
c0debdbd:	50ab c3da 942a 98d6 6e41 198e e6e4 4299     .P..*...An.....B
c0debdcd:	8ec2 2429 99ec 6dc0 6181 0933 c4f8 5561     ..)$...m.a3...aU
c0debddd:	6001 605a 199a 7c43 01fb 02e5 04e6 e43a     .`Z`..C|......:.
c0debded:	0320 0000                                    ...

c0debdf1 <C_Back_40px>:
c0debdf1:	0028 0028 0102 bd5d c0de                    (.(...]...

c0debdfb <C_Check_40px_bitmap>:
c0debdfb:	0028 0028 5401 0000 0052 8b1f 0008 0000     (.(..T..R.......
c0debe0b:	0000 0302 6063 05c0 4078 1c84 9088 1307     ....c`..x@......
c0debe1b:	400d ff82 9000 7f60 2400 3f98 0900 1fc6     .@....`..$.?....
c0debe2b:	9920 203f 0ea2 d844 57e3 2608 602a b02c      .? ..D..W.&*`,.
c0debe3b:	5818 ac16 ac0e ac03 1ed7 5e6e 5c0d 0183     .X........n^.\..
c0debe4b:	0103 0000 8363 77dc 00c8 0000               ....c..w....

c0debe57 <C_Check_40px>:
c0debe57:	0028 0028 0100 bdfb c0de                    (.(.......

c0debe61 <C_Chevron_40px_bitmap>:
c0debe61:	0028 0028 5c22 0000 ffff ffff ffff ffff     (.(."\..........
c0debe71:	1cda 03e4 0310 03e2 0330 03e0 0350 03de     ........0...P...
c0debe81:	1820 0320 03dc 0820 08c1 0320 03da 0820      . ... ... ... .
c0debe91:	08c3 0320 03d8 0820 08c5 0320 03d6 0820     .. ... ... ... .
c0debea1:	08c7 0320 05d4 0820 08c9 0520 9ed3 8020     .. ... ... ... .
c0debeb1:	98cb e002 0ed4 cd09 0e09 ffff ffff ffff     ................
c0debec1:	ffff e2ff                                   ....

c0debec5 <C_Chevron_40px>:
c0debec5:	0028 0028 0102 be61 c0de                    (.(...a...

c0debecf <C_Chevron_Back_40px_bitmap>:
c0debecf:	0028 0028 7621 0000 0074 8b1f 0008 0000     (.(.!v..t.......
c0debedf:	0000 0302 d2ed 0dc1 3080 0508 8e50 383d     .........0..P.=8
c0debeef:	a3a4 41b0 7157 6e93 3863 d498 1042 eb7e     ...AWq.nc8..B.~.
c0debeff:	4606 340e bfe5 0b84 ffbd aa35 e7e1 2eb2     .F.4......5.....
c0debf0f:	6705 b55c 541f 2473 e9b4 1273 7640 27b0     .g\..Ts$..s.@v.'
c0debf1f:	2794 c807 0711 4c94 3203 73ac b828 21cd     .'.....L.2.s(..!
c0debf2f:	8732 7313 3338 0b83 b833 8532 532b 62f8     2..s83..3.2.+S.b
c0debf3f:	9603 1dcf 0dc6 8ef2 7343 0320 0000          ........Cs ...

c0debf4d <C_Chevron_Back_40px>:
c0debf4d:	0028 0028 0102 becf c0de                    (.(.......

c0debf57 <C_Chevron_Next_40px_bitmap>:
c0debf57:	0028 0028 7121 0000 006f 8b1f 0008 0000     (.(.!q..o.......
c0debf67:	0000 0302 ceed 0dbb 3080 450c 5751 0a51     .........0.EQWQ.
c0debf77:	cc86 ac06 0d90 0918 42a6 1448 c48f 8e44     .........BH...D.
c0debf87:	1b3f 6e20 74f9 1964 58f8 8735 22e9 02da     ?. n.td..X5.."..
c0debf97:	ca23 a581 61e2 f5a5 b074 c031 c6c1 0b00     #....a..t.1.....
c0debfa7:	3999 ccc8 c1c2 1c0c 434c 0a61 9b0a 3150     .9......LCa...P1
c0debfb7:	c781 1d64 ec2e fe92 bcbe 7707 ddbd ebf8     ..d........w....
c0debfc7:	383d be09 209b 0003                          =8... ...

c0debfd0 <C_Chevron_Next_40px>:
c0debfd0:	0028 0028 0102 bf57 c0de                    (.(...W...

c0debfda <C_Close_40px_bitmap>:
c0debfda:	0028 0028 8521 0000 0083 8b1f 0008 0000     (.(.!...........
c0debfea:	0000 0302 fffb c07f bfc0 08f9 cff6 10f7     ................
c0debffa:	11fa 4207 41ac 420f 604f 87e8 fd09 e060     ...B.A.BO`....`.
c0dec00a:	3184 0ae0 e01b 70d2 9216 9c2c 5089 6706     .1.....p..,..P.g
c0dec01a:	2923 7383 9590 7941 ca28 5ca0 6554 3e60     #).s..Ay(..\Te`>
c0dec02a:	329a 42b0 6574 8520 cae8 0a40 9431 1561     .2.Bte ...@.1.a.
c0dec03a:	a2c3 9b17 581d 82dc cdcd fc58 2d86 b00c     .....X....X..-..
c0dec04a:	1584 30b6 12c5 d8f6 08e2 5c5b 8b62 6c73     ...0......[\b.sl
c0dec05a:	6369 0040 b400 b40b 2014 0003                ic@...... ...

c0dec067 <C_Close_40px>:
c0dec067:	0028 0028 0102 bfda c0de                    (.(.......

c0dec071 <C_Info_40px_bitmap>:
c0dec071:	0028 0028 3121 0000 002f 8b1f 0008 0000     (.(.!1../.......
c0dec081:	0000 0302 fffb 147f 0bd0 f030 67ff 0180     ..........0..g..
c0dec091:	2a7e 7189 5a60 80d3 ec45 cf57 f068 0593     ~*.q`Z..E.W.h...
c0dec0a1:	d900 c99e 2019 0003                          ..... ...

c0dec0aa <C_Info_40px>:
c0dec0aa:	0028 0028 0102 c071 c0de                    (.(...q...

c0dec0b4 <C_Mini_Push_40px_bitmap>:
c0dec0b4:	0028 0028 ce21 0000 00cc 8b1f 0008 0000     (.(.!...........
c0dec0c4:	0000 0302 936d 0dcd 30c2 460c 2123 4ea4     ....m....0.F#!.N
c0dec0d4:	ba83 2b01 5230 6037 4604 0762 b006 5c0f     ...+0R7`.Fb....\
c0dec0e4:	4240 4936 2f9c f6bf c9a5 b3d3 3913 aaae     @B6I./.......9..
c0dec0f4:	1085 0eb1 4911 1e0a 7710 829f 6ab0 5a90     .....I...w...j.Z
c0dec104:	9606 3ac2 08a7 a7f5 a2d1 4761 b5e3 d168     ...:......aG..h.
c0dec114:	2f6c 053a a92f f019 a4cc fb95 6b3d cac1     l/:./.......=k..
c0dec124:	53f6 6563 0ef5 8ae1 c043 10f6 3220 db41     .Sce....C... 2A.
c0dec134:	880e d044 1fee 8588 4d45 6215 5161 8553     ..D.....EM.baQS.
c0dec144:	2c68 556b 7634 5a4b cf12 e599 bcbb ab36     h,kU4vKZ......6.
c0dec154:	5c7e fdda 61e4 cbec d6c6 b81e ebcc db95     ~\...a..........
c0dec164:	af53 def7 791b e96f f9be 9628 eac9 b147     S....yo...(...G.
c0dec174:	3926 e6b3 a4ce bb37 8cee ff4f 1fc2 8764     &9....7...O...d.
c0dec184:	9d98 0320 0000                              .. ...

c0dec18a <C_Mini_Push_40px>:
c0dec18a:	0028 0028 0102 c0b4 c0de                    (.(.......

c0dec194 <C_Privacy_40px_bitmap>:
c0dec194:	0028 0028 ac21 0001 01aa 8b1f 0008 0000     (.(.!...........
c0dec1a4:	0000 0302 927d 4bbf 50c3 c710 e9af 8b4f     ....}..K.P....O.
c0dec1b4:	1768 0741 b335 fe88 6609 1d28 2c44 1fe2     h.A.5....f(.D,..
c0dec1c4:	2ea0 cdd2 2e0a 6082 a45c b4b8 0ff8 4418     .......`\......D
c0dec1d4:	1c50 b3b4 dd28 60a5 8777 38a2 10e9 b56b     P...(..`w..8..k.
c0dec1e4:	dac6 bce6 97bb 2da6 378a 25e4 f79f f7de     .......-.7.%....
c0dec1f4:	77be c439 a3bf ba75 ca9e f75c 26a1 8448     .w9...u...\..&H.
c0dec204:	7a2e 23d8 b178 1f40 5e4e 6ad8 7320 7b7e     .z.#x.@.N^.j s~{
c0dec214:	4cb6 1a70 8cd1 7231 2e21 cf5b 8c06 03a3     .Lp...1r!.[.....
c0dec224:	1ac2 a730 dc34 2ab5 4166 beee c941 6e97     ..0.4..*fA..A..n
c0dec234:	63a8 6968 74dd d859 d595 fb88 81c8 5288     .chi.tY........R
c0dec244:	2181 90c9 a1bb 74a4 16cc 69c7 9e7a 9390     .!.....t...iz...
c0dec254:	4e29 1eda d913 c423 f127 53ac 07d2 22a8     )N....#.'..S..."
c0dec264:	e1d6 5d0e 461d 4b72 49c0 30eb f88b 880a     ...].FrK.I.0....
c0dec274:	10ef 6125 8d93 09ba a8da c904 5c0e 328a     ..%a.........\.2
c0dec284:	283b 1004 218b 5d44 cd39 2bd2 c9dd 15a3     ;(...!D]9..+....
c0dec294:	36c1 084c 01ab 6919 24c1 e237 561b 7d84     .6L....i.$7..V.}
c0dec2a4:	8488 c031 51cc 7b85 216b 9bf4 c259 fe9a     ..1..Q.{k!..Y...
c0dec2b4:	92dd 9faa b872 cb24 3521 a8b4 62fe b698     ....r.$.!5...b..
c0dec2c4:	c2a2 4d4c 6cbc 4560 f7eb 916c 5521 cc5b     ..LM.l`E..l.!U[.
c0dec2d4:	86e6 8752 3d5c adc2 7bf7 d9a0 a6dc be99     ..R.\=...{......
c0dec2e4:	2d5e 26b2 a8cb 1e9e 9a13 8b17 3a52 f30c     ^-.&........R:..
c0dec2f4:	3ef3 a327 ca61 ae09 8fcf 084f 5aca f908     .>'.a.....O..Z..
c0dec304:	35c8 ffbc a35f 5ec4 41ec f3b8 d353 3a1e     .5.._..^.A..S..:
c0dec314:	f604 9120 5418 b993 8329 5e85 db99 f2e5     .. ..T..)..^....
c0dec324:	56d5 6002 57d4 75ae b266 f08b 114b a76d     .V.`.W.uf...K.m.
c0dec334:	a077 f65f c993 81d4 ff8d 0fc5 af18 4ccb     w._............L
c0dec344:	0320 0000                                    ...

c0dec348 <C_Privacy_40px>:
c0dec348:	0028 0028 0102 c194 c0de                    (.(.......

c0dec352 <C_QRCode_40px_bitmap>:
c0dec352:	0028 0028 9921 0000 0097 8b1f 0008 0000     (.(.!...........
c0dec362:	0000 0302 fffb da9f 11e0 0803 bd30 00ff     ............0...
c0dec372:	fea2 607f 8900 8029 18c5 91f4 20c5 0c42     ...`..)...... B.
c0dec382:	28fc fc62 1230 c2c2 f62d a3a7 4307 07ec     .(b.0...-....C..
c0dec392:	0703 ff84 6101 b11e 1062 c0f3 903c 9073     .....a..b...<.s.
c0dec3a2:	25ec 8628 07f0 cc3f 4839 85fe 218b 0b85     .%(...?.9H...!..
c0dec3b2:	923f 49b3 d30a 107f f583 ed90 04f8 99a1     ?..I............
c0dec3c2:	c230 9b14 d19b 19c2 0c55 061e 3a27 a3ce     0.......U...':..
c0dec3d2:	1586 d790 d0c0 aa4f 3618 88f3 0b74 7f16     ......O..6..t...
c0dec3e2:	f360 b62f a170 002e 5b00 1eb2 20fb 0003     `./.p....[... ..
	...

c0dec3f3 <C_QRCode_40px>:
c0dec3f3:	0028 0028 0102 c352 c0de                    (.(...R...

c0dec3fd <C_Settings_40px_bitmap>:
c0dec3fd:	0028 0028 9321 0001 0191 8b1f 0008 0000     (.(.!...........
c0dec40d:	0000 0302 5275 52b1 40c2 7d10 88c9 9841     ....uR.R.@.}..A.
c0dec41d:	8c91 8e56 10ce 5e87 3e46 ec40 93b0 4e8e     ..V....^F>@....N
c0dec42d:	03fd 4053 850d 1695 9d62 4a42 b03b 8a93     ..S@....b.BJ;...
c0dec43d:	0bf1 04fc 1c1c 40eb a202 3920 2f77 1738     .......@.. 9w/8.
c0dec44d:	d818 6f62 e5ef eef2 bbed 6215 8c7d ad4d     ..bo.......b}.M.
c0dec45d:	8cba 81d5 25ad 8028 6b61 45dd 87ac 8fac     .....%(.ak.E....
c0dec46d:	daac 764f 4e0b 7751 3303 aed6 761c ac42     ..Ov.NQw.3...vB.
c0dec47d:	8a01 1084 f9ad 314a 12e5 74f7 2cb5 8c9a     ......J1...t.,..
c0dec48d:	300d 976b 5c73 4ae5 8b8e 5734 5c1e 3dc5     .0k.s\.J..4W.\.=
c0dec49d:	9e43 1197 0a3a e29b 765c 4780 fd85 1aa0     C...:...\v.G....
c0dec4ad:	9e59 5cee 6075 4b8a 57ca 26c0 c381 6890     Y..\u`.K.W.&...h
c0dec4bd:	fac4 2c7b 48e3 1f08 7c17 4593 0557 0a16     ..{,.H...|.EW...
c0dec4cd:	d037 8459 a74e 601f f108 0385 9e21 2d71     7.Y.N..`....!.q-
c0dec4dd:	8d44 19ec 2343 7786 f9a6 8a45 b79a 1d50     D...C#.w..E...P.
c0dec4ed:	84e0 5a08 cc1b 9a7c 0e90 fba5 ef06 716a     ...Z..|.......jq
c0dec4fd:	76ce 5398 2c73 25fa 6035 a205 fe11 a49b     .v.Ss,.%5`......
c0dec50d:	81f4 18f4 b93a c7d3 8b1b a6df 5264 755b     ....:.......dR[u
c0dec51d:	59c4 becb af10 c5ac 9ec6 b960 87d4 b385     .Y........`.....
c0dec52d:	cb32 a1f5 4bf3 b27d ff65 79bd f9b2 b2d0     2....K}.e..y....
c0dec53d:	3d80 6650 5e86 2f05 11b7 5733 3a79 f45c     .=Pf.^./..3Wy:\.
c0dec54d:	f25e e8f9 6746 1b24 65be aed0 b864 14ca     ^...Fg$..e..d...
c0dec55d:	6e9c 96f8 f913 44d4 2df3 8e8b 8d9a 9aa4     .n.....D.-......
c0dec56d:	c911 53bb 8a72 1b9a b158 f976 a9b8 3db8     ...Sr...X.v....=
c0dec57d:	3de4 50e9 6624 61a6 6747 dd64 aeec f19c     .=.P$f.aGgd.....
c0dec58d:	fc68 4701 f51a 207f 0003                     h..G... ...

c0dec598 <C_Settings_40px>:
c0dec598:	0028 0028 0102 c3fd c0de                    (.(.......

c0dec5a2 <C_Warning_40px_bitmap>:
c0dec5a2:	0028 0028 e721 0000 00e5 8b1f 0008 0000     (.(.!...........
c0dec5b2:	0000 0302 d36d 0db1 40c2 850c 47e1 2284     ....m....@...G."
c0dec5c2:	283a d511 88d5 1182 0032 8662 904c 0815     :(......2.b.L...
c0dec5d2:	3013 2c03 0ec0 9e88 1025 526d 8450 9d10     .0.,....%.mRP...
c0dec5e2:	73b9 8842 b87d aafc 675f 911f 4b1c 34c1     .sB.}..._g...K.4
c0dec5f2:	0b26 c128 5b44 c08a c0f6 d95a d811 d2e6     &.(.D[....Z.....
c0dec602:	c0ae a486 81dd 4905 80ab 4939 66ab 4988     .......I..9I.f.I
c0dec612:	635a be30 7349 11ad c0d3 8c52 240e b5cd     Zc0.Is....R..$..
c0dec622:	d476 6f9b 6925 2adc 6dad d615 0eb5 c5ed     v..o%i.*.m......
c0dec632:	25ad 4cfc b04b b93d b035 db42 20db 942e     .%.LK.=.5.B.. ..
c0dec642:	43d1 773e e2db a970 2e8d 4ac0 9d1b 4c80     .C>w..p....J...L
c0dec652:	e51b ec3f a6cd ce88 c8ca 5f26 bc1c 6d7d     ..?.......&_..}m
c0dec662:	5db8 a8ee 76e6 cbb5 5dae bcee 576d c1b7     .]...v...]..mW..
c0dec672:	caed 5db8 6f9b da37 9fec f49b 81ed ccb9     ...].o7.........
c0dec682:	785d fef8 7c2f 1300 b8d8 2006 0003           ]x../|..... ...

c0dec691 <C_Warning_40px>:
c0dec691:	0028 0028 0102 c5a2 c0de 7544 6d6d 2079     (.(.......Dummy 
c0dec6a1:	0032 6552 6976 7765 7420 6172 736e 6361     2.Review transac
c0dec6b1:	6974 6e6f 740a 206f 6573 646e 4220 4c4f     tion.to send BOL
c0dec6c1:	4f00 6570 6172 6974 6e6f 7320 6769 656e     .Operation signe
c0dec6d1:	0064 6441 7264 7365 2073 6576 6972 6966     d.Address verifi
c0dec6e1:	6163 6974 6e6f 630a 6e61 6563 6c6c 6465     cation.cancelled
c0dec6f1:	5400 6172 736e 6361 6974 6e6f 4320 6568     .Transaction Che
c0dec701:	6b63 7520 616e 6176 6c69 6261 656c 4100     ck unavailable.A
c0dec711:	7070 6f72 6576 5000 6f72 6563 7373 6e69     pprove.Processin
c0dec721:	0067 6c42 6e69 2d64 6973 6e67 3000 302e     g.Blind-sign.0.0
c0dec731:	312e 4800 6c6f 2064 6f74 7320 6769 006e     .1.Hold to sign.
c0dec741:	704f 7265 7461 6f69 206e 6572 656a 7463     Operation reject
c0dec751:	6465 5200 6a65 6365 0074 6552 656a 7463     ed.Reject.Reject
c0dec761:	7420 6172 736e 6361 6974 6e6f 003f 7243      transaction?.Cr
c0dec771:	7469 6369 6c61 7420 7268 6165 2074 6564     itical threat de
c0dec781:	6574 7463 6465 0a2e 6c42 6e69 2064 6973     tected..Blind si
c0dec791:	6e67 6e69 2067 6572 7571 7269 6465 002e     gning required..
c0dec7a1:	6e55 6469 6e65 6974 6966 6465 7220 7369     Unidentified ris
c0dec7b1:	006b 6853 776f 6120 2073 5251 4100 6f6d     k.Show as QR.Amo
c0dec7c1:	6e75 0074 6f47 6220 6361 206b 6f74 6f20     unt.Go back to o
c0dec7d1:	6570 6172 6974 6e6f 5400 6172 736e 6361     peration.Transac
c0dec7e1:	6974 6e6f 4320 6568 6b63 7520 616e 6176     tion Check unava
c0dec7f1:	6c69 6261 656c 0a2e 6c42 6e69 2064 6973     ilable..Blind si
c0dec801:	6e67 6e69 2067 6572 7571 7269 6465 002e     gning required..
c0dec811:	6441 7264 7365 2073 6576 6972 6966 6465     Address verified
c0dec821:	5300 6977 6570 7420 206f 6f63 746e 6e69     .Swipe to contin
c0dec831:	6575 2500 2073 7325 250a 0073 7468 7074     ue.%s %s.%s.http
c0dec841:	3a73 2f2f 7325 4100 6572 7920 756f 7320     s://%s.Are you s
c0dec851:	7275 2065 6f74 610a 6c6c 776f 6420 6d75     ure to.allow dum
c0dec861:	796d 3220 690a 206e 7274 6e61 6173 7463     my 2.in transact
c0dec871:	6f69 736e 003f 7254 6e61 6173 7463 6f69     ions?.Transactio
c0dec881:	206e 6973 6e67 6465 4500 534e 6e20 6d61     n signed.ENS nam
c0dec891:	7365 6120 6572 7220 7365 6c6f 6576 2064     es are resolved 
c0dec8a1:	7962 4c20 6465 6567 2072 6162 6b63 6e65     by Ledger backen
c0dec8b1:	2e64 5300 6365 7275 7469 2079 6572 6f70     d..Security repo
c0dec8c1:	7472 4400 7665 6c65 706f 7265 2500 0a73     rt.Developer.%s.
c0dec8d1:	7325 2520 0073 6c41 6f6c 2077 7564 6d6d     %s %s.Allow dumm
c0dec8e1:	2079 0a31 6e69 7420 6172 736e 6361 6974     y 1.in transacti
c0dec8f1:	6e6f 0073 6953 6e67 7420 6172 736e 6361     ons.Sign transac
c0dec901:	6974 6e6f 740a 206f 6573 646e 4220 4c4f     tion.to send BOL
c0dec911:	5900 7365 202c 6b73 7069 2500 2073 6572     .Yes, skip.%s re
c0dec921:	6f70 7472 4700 206f 6162 6b63 7420 206f     port.Go back to 
c0dec931:	7274 6e61 6173 7463 6f69 006e 6953 6e67     transaction.Sign
c0dec941:	6d20 7365 6173 6567 4200 6361 206b 6f74      message.Back to
c0dec951:	7320 6661 7465 0079 654d 7373 6761 2065      safety.Message 
c0dec961:	6973 6e67 6465 4300 6f6c 6573 5300 6769     signed.Close.Sig
c0dec971:	206e 7274 6e61 6173 7463 6f69 006e 654c     n transaction.Le
c0dec981:	6764 7265 5300 6163 206e 6f74 7620 6569     dger.Scan to vie
c0dec991:	2077 7566 6c6c 7220 7065 726f 0074 6854     w full report.Th
c0dec9a1:	7369 7420 6172 736e 6361 6974 6e6f 6f20     is transaction o
c0dec9b1:	2072 656d 7373 6761 2065 6163 6e6e 746f     r message cannot
c0dec9c1:	6220 2065 6564 6f63 6564 2064 7566 6c6c      be decoded full
c0dec9d1:	2e79 4920 2066 6f79 2075 6863 6f6f 6573     y. If you choose
c0dec9e1:	7420 206f 6973 6e67 202c 6f79 2075 6f63      to sign, you co
c0dec9f1:	6c75 2064 6562 6120 7475 6f68 6972 697a     uld be authorizi
c0deca01:	676e 6d20 6c61 6369 6f69 7375 6120 7463     ng malicious act
c0deca11:	6f69 736e 7420 6168 2074 6163 206e 7264     ions that can dr
c0deca21:	6961 206e 6f79 7275 7720 6c61 656c 2e74     ain your wallet.
c0deca31:	0a0a 654c 7261 206e 6f6d 6572 203a 656c     ..Learn more: le
c0deca41:	6764 7265 632e 6d6f 652f 0038 6341 6563     dger.com/e8.Acce
c0deca51:	7470 7420 7268 6165 2074 6e61 2064 6f63     pt threat and co
c0deca61:	746e 6e69 6575 4100 6c6c 776f 6420 6d75     ntinue.Allow dum
c0deca71:	796d 3220 690a 206e 7274 6e61 6173 7463     my 2.in transact
c0deca81:	6f69 736e 5600 7265 6973 6e6f 4d00 726f     ions.Version.Mor
c0deca91:	0065 6854 7369 7420 6172 736e 6361 6974     e.This transacti
c0decaa1:	6e6f 6320 6e61 6f6e 2074 6562 4320 656c     on cannot be Cle
c0decab1:	7261 5320 6769 656e 0064 6559 2c73 7220     ar Signed.Yes, r
c0decac1:	6a65 6365 0074 6143 636e 6c65 5400 6968     eject.Cancel.Thi
c0decad1:	2073 7274 6e61 6173 7463 6f69 206e 6177     s transaction wa
c0decae1:	2073 6373 6e61 656e 2064 7361 6d20 6c61     s scanned as mal
c0decaf1:	6369 6f69 7375 6220 2079 6557 3362 4320     icious by Web3 C
c0decb01:	6568 6b63 2e73 2500 2064 666f 2520 0064     hecks..%d of %d.
c0decb11:	6b53 7069 7220 7665 6569 3f77 4200 696c     Skip review?.Bli
c0decb21:	646e 7320 6769 696e 676e 7220 7165 6975     nd signing requi
c0decb31:	6572 0064 755b 6b6e 6f6e 6e77 005d 6952     red.[unknown].Ri
c0decb41:	6b73 6420 7465 6365 6574 0064 6c42 6e69     sk detected.Blin
c0decb51:	2064 6973 6e67 6e69 2067 6572 7571 7269     d signing requir
c0decb61:	6465 002e 6e55 6469 6e65 6974 6966 6465     ed..Unidentified
c0decb71:	7420 7268 6165 0074 6854 7369 6120 6363      threat.This acc
c0decb81:	756f 746e 6c20 6261 6c65 6320 6d6f 7365     ount label comes
c0decb91:	6620 6f72 206d 6f79 7275 4120 6464 6572      from your Addre
c0decba1:	7373 4220 6f6f 206b 6e69 4c20 6465 6567     ss Book in Ledge
c0decbb1:	2072 694c 6576 002e 7243 7469 6369 6c61     r Live..Critical
c0decbc1:	7420 7268 6165 0074 6341 6563 7470 7220      threat.Accept r
c0decbd1:	7369 206b 6e61 2064 6f63 746e 6e69 6575     isk and continue
c0decbe1:	5400 6968 2073 7274 6e61 6173 7463 6f69     .This transactio
c0decbf1:	276e 2073 6564 6174 6c69 2073 7261 2065     n's details are 
c0decc01:	6f6e 2074 7566 6c6c 2079 6576 6972 6966     not fully verifi
c0decc11:	6261 656c 202e 6649 7920 756f 7320 6769     able. If you sig
c0decc21:	2c6e 7920 756f 6320 756f 646c 6c20 736f     n, you could los
c0decc31:	2065 6c61 206c 6f79 7275 6120 7373 7465     e all your asset
c0decc41:	2e73 4700 206f 6162 6b63 7420 206f 656d     s..Go back to me
c0decc51:	7373 6761 0065 6f50 6574 746e 6169 206c     ssage.Potential 
c0decc61:	6972 6b73 6420 7465 6365 6574 2e64 420a     risk detected..B
c0decc71:	696c 646e 7320 6769 696e 676e 7220 7165     lind signing req
c0decc81:	6975 6572 2e64 4e00 206f 6874 6572 7461     uired..No threat
c0decc91:	6420 7465 6365 6574 2064 7962 5420 6172      detected by Tra
c0decca1:	736e 6361 6974 6e6f 4320 6568 6b63 002e     nsaction Check..
c0deccb1:	6c42 6e69 2064 6973 6e67 6e69 2067 6861     Blind signing ah
c0deccc1:	6165 0064 654d 7373 6761 2065 6572 656a     ead.Message reje
c0deccd1:	7463 6465 5200 6a65 6365 2074 706f 7265     cted.Reject oper
c0decce1:	7461 6f69 3f6e 3000 3231 3433 3635 3837     ation?.012345678
c0deccf1:	4139 4342 4544 0046 656e 7774 726f 2e6b     9ABCDEF.network.
c0decd01:	4200 4c4f 2520 2a2e 0073 6441 7264 7365     .BOL %.*s.Addres
c0decd11:	0073 6649 7920 756f 7227 2065 7573 6572     s.If you're sure
c0decd21:	7920 756f 6420 6e6f 7427 6e20 6565 2064      you don't need 
c0decd31:	6f74 7220 7665 6569 2077 6c61 206c 6966     to review all fi
c0decd41:	6c65 7364 202c 6f79 2075 6163 206e 6b73     elds, you can sk
c0decd51:	7069 7320 7274 6961 6867 2074 6f74 7320     ip straight to s
c0decd61:	6769 696e 676e 002e 6649 7920 756f 7227     igning..If you'r
c0decd71:	2065 6f6e 2074 7375 6e69 2067 6874 0a65     e not using the.
c0decd81:	654c 6764 7265 4c20 7669 2065 7061 2c70     Ledger Live app,
c0decd91:	5420 6172 736e 6361 6974 6e6f 4320 6568      Transaction Che
c0decda1:	6b63 6d20 6769 7468 6e20 746f 7720 726f     ck might not wor
c0decdb1:	2e6b 4920 2066 6f79 2075 7261 2065 7375     k. If you are us
c0decdc1:	6e69 2067 654c 6764 7265 4c20 7669 2c65     ing Ledger Live,
c0decdd1:	7220 6a65 6365 2074 6874 2065 7274 6e61      reject the tran
c0decde1:	6173 7463 6f69 206e 6e61 2064 7274 2079     saction and try 
c0decdf1:	6761 6961 2e6e 0a0a 6547 2074 6568 706c     again...Get help
c0dece01:	6120 2074 656c 6764 7265 632e 6d6f 652f      at ledger.com/e
c0dece11:	3131 5400 6968 2073 7274 6e61 6173 7463     11.This transact
c0dece21:	6f69 206e 6177 2073 6373 6e61 656e 2064     ion was scanned 
c0dece31:	7361 7220 7369 796b 6220 2079 6557 3362     as risky by Web3
c0dece41:	4320 6568 6b63 2e73 4400 6d75 796d 3120      Checks..Dummy 1
c0dece51:	4900 7520 646e 7265 7473 6e61 2c64 6320     .I understand, c
c0dece61:	6e6f 6966 6d72 4e00 206f 6874 6572 7461     onfirm.No threat
c0dece71:	6420 7465 6365 6574 0064 7254 6e61 6173      detected.Transa
c0dece81:	7463 6f69 206e 6572 656a 7463 6465 4700     ction rejected.G
c0dece91:	206f 6162 6b63 7420 206f 6572 6976 7765     o back to review
c0decea1:	4300 6972 6974 6163 206c 6874 6572 7461     .Critical threat
c0deceb1:	6420 7465 6365 6574 2e64 5300 6769 206e      detected..Sign 
c0decec1:	706f 7265 7461 6f69 006e 4c4d 5344 4541     operation.MLDSAE
c0deced1:	4854 4400 7465 6365 6574 2064 7962 2520     TH.Detected by %
c0decee1:	0073 5300 696b 0070 6f50 6574 746e 6169     s..Skip.Potentia
c0decef1:	206c 6972 6b73 6420 7465 6365 6574 2e64     l risk detected.
c0decf01:	4e00 206f 6874 6572 7461 6420 7465 6365     .No threat detec
c0decf11:	6574 2064 7962 5420 6172 736e 6361 6974     ted by Transacti
c0decf21:	6e6f 4320 6568 6b63 6220 7475 6220 696c     on Check but bli
c0decf31:	646e 7320 6769 696e 676e 7220 7165 6975     nd signing requi
c0decf41:	6572 2e64 5000 746f 6e65 6974 6c61 7220     red..Potential r
c0decf51:	7369 006b 6556 6972 7966 4220 4c4f 6120     isk.Verify BOL a
c0decf61:	6464 6572 7373 4300 6e6f 6974 756e 2065     ddress.Continue 
c0decf71:	6e61 7779 7961 5100 6975 2074 7061 0070     anyway.Quit app.
c0decf81:	7753 7069 2065 6f74 7220 7665 6569 0077     Swipe to review.
c0decf91:	6854 7369 6120 7070 6520 616e 6c62 7365     This app enables
c0decfa1:	7320 6769 696e 676e 740a 6172 736e 6361      signing.transac
c0decfb1:	6974 6e6f 2073 6e6f 7420 6568 5400 6172     tions on the.Tra
c0decfc1:	736e 6361 6974 6e6f 4320 6568 6b63 6420     nsaction Check d
c0decfd1:	6469 276e 2074 6966 646e 6120 796e 7420     idn't find any t
c0decfe1:	7268 6165 2c74 6220 7475 6120 776c 7961     hreat, but alway
c0decff1:	2073 6572 6976 7765 7420 6172 736e 6361     s review transac
c0ded001:	6974 6e6f 6420 7465 6961 736c 6320 7261     tion details car
c0ded011:	6665 6c75 796c 002e 6f43 666e 7269 006d     efully..Confirm.
c0ded021:	6552 656a 7463 6d20 7365 6173 6567 003f     Reject message?.

c0ded031 <handler_cmd_verify_dilithium.sig>:
c0ded031:	6193 b128 b2a6 c9f2 9a4b 7ee4 4896 d274     .a(.....K..~.Ht.
c0ded041:	9592 59da 1be5 29ef 8b95 55f8 26d9 af6d     ...Y...)...U.&m.
c0ded051:	2425 e843 c1a1 f5cd badc 27aa a1db bf64     %$C........'..d.
c0ded061:	6d79 a5ac 1d33 009a 18e5 4002 3ecb b67a     ym..3......@.>z.
c0ded071:	2569 3e5c 2fe1 81dd 868f a3fd 6914 e0e8     i%\>./.......i..
c0ded081:	df2d 0573 dc39 ddd3 1fc5 6442 1648 ef86     -.s.9.....BdH...
c0ded091:	f283 c300 077b 1f7b 4610 28ed 694b 6818     ....{.{..F.(Ki.h
c0ded0a1:	c39e 454e ea20 db7d 4315 fe5c b291 a47f     ..NE .}..C\.....
c0ded0b1:	fb91 5e8f 2c01 3a19 364f fedd 4558 a9db     ...^.,.:O6..XE..
c0ded0c1:	3f4b dd84 e2da ea56 2d53 0e29 5d8f 3823     K?....V.S-)..]#8
c0ded0d1:	e6a8 371c 0f4f 90aa 4fe6 cca9 7d0a b976     ...7O....O...}v.
c0ded0e1:	ed6c 46be 2679 7d6b 7d53 07e3 2b95 e42c     l..Fy&k}S}...+,.
c0ded0f1:	7061 60cf ab4c 2add 2046 af90 2803 32dd     ap.`L..*F ...(.2
c0ded101:	f998 f506 5bc4 0a97 961f f2d7 bbc5 5aa0     .....[.........Z
c0ded111:	d546 d49d f992 5905 749b e49b 7a8b 6fbd     F......Y.t...z.o
c0ded121:	34cc bae3 74ac 7391 4ff7 1a93 59d8 5b23     .4...t.s.O...Y#[
c0ded131:	4e01 bc5f 5030 3d13 8cfb 8486 ee78 5116     .N_.0P.=....x..Q
c0ded141:	55f2 1291 fc05 eead 5f18 3653 6f1d e98b     .U......._S6.o..
c0ded151:	31ae cf90 313d 252e 8d8f 6235 b8e3 cb93     .1..=1.%..5b....
c0ded161:	19f9 48e4 69e7 f329 85c7 3a96 57b0 002f     ...H.i)....:.W/.
c0ded171:	e050 f38b ab81 1c21 cb78 43ec 811a b1e6     P.....!.x..C....
c0ded181:	9f07 07ca f452 6d94 1448 e297 3f00 9507     ....R..mH....?..
c0ded191:	1a47 98f9 2cb0 f817 d14f 5d5f 9873 aa15     G....,..O._]s...
c0ded1a1:	5dfb ae6d 3b65 c833 835b 2ca8 98b5 7906     .]m.e;3.[..,...y
c0ded1b1:	b571 b358 12bb 5f9b b015 4180 e145 2b65     q.X...._...AE.e+
c0ded1c1:	ea61 ea65 37e8 ab75 fec1 a358 6b36 f83e     a.e..7u...X.6k>.
c0ded1d1:	f8db bbb4 f57d 0fe6 745d a532 dcdf 8690     ....}...]t2.....
c0ded1e1:	b217 71fa 7848 146e 85bb 341e 7d95 4190     ...qHxn....4.}.A
c0ded1f1:	e2be faac 55b4 8892 9936 64d0 58cc 0383     .....U..6..d.X..
c0ded201:	9204 291e 0304 1f30 fad8 f66e d5f2 7f6f     ...)..0...n...o.
c0ded211:	3b52 ca90 41b9 f55e ef0c aa1e 3e75 98bc     R;...A^.....u>..
c0ded221:	749f 8391 0c9f 9dbe 0ff3 8cfc b65f e18e     .t.........._...
c0ded231:	4a62 6072 d27f 9af9 a434 c6c6 eb02 0042     bJr`....4.....B.
c0ded241:	403c 83a6 36c3 fbf8 b30d bd78 01b6 2d67     <@...6....x...g-
c0ded251:	0ee9 2092 2cd8 4817 5a26 e648 8d9a a192     ... .,.H&ZH.....
c0ded261:	5bc4 f31d 2cee deeb ef1c cfe7 2566 7e7f     .[...,......f%.~
c0ded271:	ad82 d4ff 4b6a 9e9f 4856 6301 4aa6 9ea6     ....jK..VH.c.J..
c0ded281:	7ca0 93e7 08be f9ac 0ba4 59a9 cb9f 19df     .|.........Y....
c0ded291:	6c1c d1a7 c1b0 0a10 fc11 a572 948d e0f7     .l........r.....
c0ded2a1:	0bd4 dfcd c753 3105 701e d8b5 d9a8 951a     ....S..1.p......
c0ded2b1:	154f 6fcb 2787 ee3a eadc 4175 49ad db69     O..o.':...uA.Ii.
c0ded2c1:	df94 d71c 827f 9b84 eabb 064d 85ad 5461     ..........M...aT
c0ded2d1:	057d 6271 a419 fccf 755c 819c d1ed 04cc     }.qb....\u......
c0ded2e1:	5439 3156 a2c1 074d b296 29d9 16b9 d5f4     9TV1..M....)....
c0ded2f1:	a443 38ff 6670 38e9 208b 7127 aa41 a76f     C..8pf.8. 'qA.o.
c0ded301:	f413 9f5d 8897 edf5 9722 0e01 f915 468d     ..]....."......F
c0ded311:	6e66 d1ef d73e be07 debe 9347 9d23 52df     fn..>.....G.#..R
c0ded321:	37be 6705 db1d 47cd a661 4864 847e 593c     .7.g...Ga.dH~.<Y
c0ded331:	99ac 7676 1d66 78ae ee05 85fd 12b8 d181     ..vvf..x........
c0ded341:	11ed f771 8111 fa3b 9931 6e0d cd4d a811     ..q...;.1..nM...
c0ded351:	0f92 81e6 e0ff c365 b563 b4bf 4616 c54a     ......e.c....FJ.
c0ded361:	5822 8994 8dd7 eff4 95f0 66e8 c9a9 12b7     "X.........f....
c0ded371:	a7d4 495d 15c8 93e9 db31 35ca 33b7 d019     ..]I....1..5.3..
c0ded381:	1bc3 ce8c 913d 4c9e d2b5 280f 1618 8f32     ....=..L...(..2.
c0ded391:	7715 1dd3 6e18 75f5 cfe6 ec0a 5502 c85c     .w...n.u.....U\.
c0ded3a1:	b370 2d30 a23f 03df 0c3b 60f6 b1dd 5ecf     p.0-?...;..`...^
c0ded3b1:	38da 89b4 30ed 89fc 26c9 3494 4ab6 de0b     .8...0...&.4.J..
c0ded3c1:	590b 1c65 94f6 12ac 1165 da50 420e 018d     .Ye.....e.P..B..
c0ded3d1:	5ef4 d262 3b80 bbd6 d7ef 8066 c599 c4f8     .^b..;....f.....
c0ded3e1:	65aa 20c0 cf86 fc24 91c9 07e4 3a1a 6cec     .e. ..$......:.l
c0ded3f1:	8787 aa6f 033f ee54 7645 96b6 08bc eecf     ..o.?.T.Ev......
c0ded401:	29ef 2607 2e6c 0590 2b97 0fff 49f2 2d87     .).&l....+...I.-
c0ded411:	606b a11d ff02 e4c8 927b e3a0 ac84 f695     k`......{.......
c0ded421:	4ec5 aba6 960a c26b 51a6 a5ac e920 fbba     .N....k..Q.. ...
c0ded431:	b66b 8502 3c1c 0c50 66c0 0062 8d53 5c61     k....<P..fb.S.a\
c0ded441:	2de7 a8ef 2202 ebd6 25bf fe39 6bbd a978     .-..."...%9..kx.
c0ded451:	f4d1 7bbf cf6a 9233 55e5 2f1d d976 c956     ...{j.3..U./v.V.
c0ded461:	1445 18ae c006 a110 b11f 82f6 de41 24f4     E...........A..$
c0ded471:	33e6 ae85 46b1 703d 81f6 b34f ab6d e013     .3...F=p..O.m...
c0ded481:	fb77 84b2 927d d346 e751 f7b6 63b1 5e8e     w...}.F.Q....c.^
c0ded491:	8605 3e12 a1e7 ac74 ab29 eb69 f033 c2a7     ...>..t.).i.3...
c0ded4a1:	208a 48f1 76b1 5513 b1f1 53be 9f78 bf46     . .H.v.U...Sx.F.
c0ded4b1:	62f6 8901 ff95 9fad 8e87 7c56 318d 02f2     .b........V|.1..
c0ded4c1:	265a 4f39 eae9 f1ad bd9e 30b6 1712 931f     Z&9O.......0....
c0ded4d1:	d19c 897e 85ee 1370 7ed5 9b91 6d0d 4a77     ..~...p..~...mwJ
c0ded4e1:	2542 9544 8796 344b ff23 3c22 fdc5 1912     B%D...K4#."<....
c0ded4f1:	b7f9 8228 15aa 7bc8 7b9f 1dbf e790 93e9     ..(....{.{......
c0ded501:	e263 8083 7602 630c 86bd 8997 073b 62b7     c....v.c....;..b
c0ded511:	3107 2633 10f5 6133 0987 ce50 f71f 4af3     .13&..3a..P....J
c0ded521:	2922 e325 96d0 64a2 3503 3669 8f95 1bce     ")%....d.5i6....
c0ded531:	6ede a80d d0fa 9d41 80c5 4680 bc47 1ff7     .n....A....FG...
c0ded541:	01e9 5c8f 48e3 0417 5ca4 479f 7fae cc19     ...\.H...\.G....
c0ded551:	3205 43a5 f783 dc00 e1ef a83a ccd7 f47f     .2.C......:.....
c0ded561:	5d58 18a3 8c32 e723 7e29 2ded 0a60 7a8a     X]..2.#.)~.-`..z
c0ded571:	9fef 5134 4caa 1853 6aeb 4531 0af7 0d1b     ..4Q.LS..j1E....
c0ded581:	6391 63c7 d3af 462e 4887 d0ca 5e2e 7a1c     .c.c...F.H...^.z
c0ded591:	2675 fd69 29ed 5dd3 06fb d43f d2db 0502     u&i..).]..?.....
c0ded5a1:	ad21 1cbb 1a20 238a c229 28ac 973d 0a15     !... ..#)..(=...
c0ded5b1:	96c2 fe60 7268 0e64 96d7 56eb be4b 2aa1     ..`.hrd....VK..*
c0ded5c1:	a6f5 756f 4f64 e0cf 1632 1145 2eac 7d6d     ..oudO..2.E...m}
c0ded5d1:	b724 dbef e1b1 09c2 961e 439f 73df 9763     $..........C.sc.
c0ded5e1:	3dbd 2198 3583 c086 3859 bea6 2141 c4f2     .=.!.5..Y8..A!..
c0ded5f1:	aff8 98ae 7e86 caee 09a5 840a 3ea1 890b     .....~.......>..
c0ded601:	f904 5fe9 9cc6 b0f2 ea77 3111 7d1f d5f1     ..._....w..1.}..
c0ded611:	d3a3 96ae ef16 5f94 1e3c e269 f00c 1a4b     ......._<.i...K.
c0ded621:	7e9a 2aab d1b5 b4f1 0604 314d 0774 6639     .~.*......M1t.9f
c0ded631:	2e43 d646 21db ef98 d8d0 6dbf dbd9 39c5     C.F..!.....m...9
c0ded641:	4531 1d25 8f41 78f8 d3af 673d ed94 20ed     1E%.A..x..=g... 
c0ded651:	50ed 3e00 972d 600b 2d5a 63bf e5d3 e3be     .P.>-..`Z-.c....
c0ded661:	7d5c 65bc 9421 2756 ee83 3343 4fff d3c0     \}.e!.V'..C3.O..
c0ded671:	c382 841c 608a f196 fbd4 1f78 9720 676f     .....`....x. .og
c0ded681:	6b7c d2db e092 4dfd 16d7 de8d cb5e 375f     |k.....M....^._7
c0ded691:	e98f 9cf4 99f7 ba6d 747a 004b 03e7 d21b     ......m.ztK.....
c0ded6a1:	4290 5df8 f84d f3cd b9f7 f727 fd31 51c9     .B.]M.....'.1..Q
c0ded6b1:	da82 aa7f 23f4 60d7 e619 527e cca3 e96f     .....#.`..~R..o.
c0ded6c1:	3bdb ce43 46b3 2328 04a0 43e9 8f63 2ec1     .;C..F(#...Cc...
c0ded6d1:	e5db 3eba 5f7f 994b 16c2 ae8d edfc 7060     ...>._K.......`p
c0ded6e1:	8dd9 a673 75e1 b64d 0cf3 658e 7672 2dac     ..s..uM....erv.-
c0ded6f1:	e95f 54f7 3097 9119 5ee6 8d6f 2fb9 696e     _..T.0...^o../ni
c0ded701:	ca01 bc42 ad99 fab0 3a15 80a1 5d0c 3741     ..B......:...]A7
c0ded711:	13db 1855 0849 dc1d 9305 e7b1 9ab0 26fd     ..U.I..........&
c0ded721:	345b b19b c16f b905 8358 a609 de0a e699     [4..o...X.......
c0ded731:	a16e d490 5bc3 7a1f ddc2 dc8c 4210 a442     n....[.z.....BB.
c0ded741:	0b0b a3d1 297d 4c35 0274 a399 4a18 1cd0     ....})5Lt....J..
c0ded751:	50e9 1744 26b8 7d3e e8a8 ee32 8828 d05e     .PD..&>}..2.(.^.
c0ded761:	8185 44d9 13b8 9ff1 1d9e add2 3b40 b24e     ...D........@;N.
c0ded771:	10ec dce9 8119 19f2 beb8 e1bf fdc3 034e     ..............N.
c0ded781:	2afa aab9 36a6 fa54 d005 654c 0426 cd95     .*...6T...Le&...
c0ded791:	685a 2141 59ee e89f dbf3 d401 4f37 d820     ZhA!.Y......7O .
c0ded7a1:	f7a9 5322 5f4e b0a4 b8dc 99a7 d7a1 85b8     .."SN_..........
c0ded7b1:	079e 67f9 bc1d 86e1 60a5 fbff 1074 91b2     ...g.....`..t...
c0ded7c1:	e203 850f 6c23 99ff ae43 6054 0f59 c585     ....#l..C.T`Y...
c0ded7d1:	f196 d72b 0e54 6ac0 3105 9dc3 9b21 e89d     ..+.T..j.1..!...
c0ded7e1:	5383 5f8e 6860 a3d0 7132 433c b19f 3722     .S._`h..2q<C.."7
c0ded7f1:	2177 e9ae 8584 0985 4d83 bfc1 461f c991     w!.......M...F..
c0ded801:	3d7f 26b7 60ff 2eb2 142b cf17 02a9 2cd9     .=.&.`..+......,
c0ded811:	3120 f1a7 d4bb b1bc 6fec eaaa 3722 a36f      1.......o.."7o.
c0ded821:	da49 009f 1682 1154 5020 5855 6044 2c4a     I.....T. PUXD`J,
c0ded831:	0d53 8ec7 cc40 366e f143 88cf d075 c778     S...@.n6C...u.x.
c0ded841:	faac 028f 8b0e ad24 cf5e 04a0 f0b7 4a5a     ......$.^.....ZJ
c0ded851:	34d5 6ffc 40cd e590 4ad1 9348 2f64 5395     .4.o.@...JH.d/.S
c0ded861:	207c d634 966a 2571 1bbb 9e52 0a9a 29eb     | 4.j.q%..R....)
c0ded871:	bbf2 06a8 a498 68e3 4195 b6ce a78e 7a1c     .......h.A.....z
c0ded881:	226e a567 9168 9825 defd ece9 d3b8 3585     n"g.h.%........5
c0ded891:	0c74 8edd 873d ad66 5cdb 5ce9 4c24 74e4     t...=.f..\.\$L.t
c0ded8a1:	e76c b702 26e6 cea2 d100 25ad 8de4 6ae3     l....&.....%...j
c0ded8b1:	a50e cb49 8758 b01e f9bb ddd7 15ab 8503     ..I.X...........
c0ded8c1:	d36d 45be 19ba c1d6 f082 0adb 5ace 350c     m..E.........Z.5
c0ded8d1:	6955 ab0a 5737 5260 9a64 6565 f739 99cd     Ui..7W`Rd.ee9...
c0ded8e1:	0c61 fa68 436d ed67 f2d4 3b7c df96 9fcd     a.h.mCg...|;....
c0ded8f1:	471f 5ca4 e60d e7a7 a991 8e13 d019 9318     .G.\............
c0ded901:	54ee 86b9 92cc 6fb0 319c f9c9 aac9 e2bb     .T.....o.1......
c0ded911:	49a7 4aa4 ad39 a666 472a f872 ab21 689b     .I.J9.f.*Gr.!..h
c0ded921:	48c1 bd53 2f19 f4c7 5739 9c10 30d9 d354     .HS../..9W...0T.
c0ded931:	cf67 c1e4 4e3a 8715 9b55 c2cd 7050 41fa     g...:N..U...Pp.A
c0ded941:	2f71 7207 3072 2c5e ec40 f9cc 7de9 ff02     q/.rr0^,@....}..
c0ded951:	300d 5740 7570 807d 9f90 c7a8 d6ce eae8     .0@Wpu}.........
c0ded961:	fcf0 1e18 3929 3f3e 7244 8783 9488 e5c6     ....)9>?Dr......
c0ded971:	e9e6 f8f3 1c07 1e1d 5326 5b54 7e72 8e86     ........&ST[r~..
c0ded981:	ae97 c3c2 d7c7 e5dc f0ee 1508 211c 6924     .............!$i
c0ded991:	857c aea2 c1c0 f4cd 0000 0000 0000 0000     |...............
c0ded9a1:	2412 483a 1cd8 8d4d 4f73 fbcb deea 3f3d     .$:H..M.sO....=?
c0ded9b1:	038a aa9f 2c2a 5799 35e8 55ad 2eb2 bf75     ....*,.W.5.U..u.
c0ded9c1:	bb57 6a55                                    W.Uj.

c0ded9c6 <handler_cmd_verify_dilithium.pk>:
c0ded9c6:	327a 5741 a941 7c35 07db 85a5 803f 8ad1     z2AWA.5|....?...
c0ded9d6:	2a7a bcaa 44de 441b 3aa0 3f0e 4d84 194a     z*...D.D.:.?.MJ.
c0ded9e6:	d32a 5df5 437d ad53 4cba 3b91 9cdd 55a7     *..]}CS..L.;...U
c0ded9f6:	9a70 9b10 4592 c2f9 c6cb b1ae bdde 6661     p....E........af
c0deda06:	3851 912d 01c8 ad7c 13aa 7db3 cc14 4ca2     Q8-...|....}...L
c0deda16:	7cb3 e01f 08d1 69e5 1d94 cde9 f744 4948     .|.....i....D.HI
c0deda26:	9241 9af1 8421 a34e 4a74 75af d752 d710     A...!.N.tJ.uR...
c0deda36:	865c 4baa e604 72b1 61e9 108b ffef 08e7     \..K...r.a......
c0deda46:	4b0e aca6 f1de f372 22cd 2d04 aa53 134d     .K....r..".-S.M.
c0deda56:	4545 e081 21fa 30d9 deae 7b8d 59ff 38ca     EE...!.0...{.Y.8
c0deda66:	4870 de91 19f7 e87e f00a f7dd c702 6ea3     pH....~........n
c0deda76:	2095 a999 5aca aaef 51c9 3a78 7fa1 7244     . ...Z...Qx:..Dr
c0deda86:	046e ec79 19fd a0c9 013a fdfe 0399 0fd4     n.y.....:.......
c0deda96:	04d1 afae 1316 9f4b efef ef96 7dae 679d     ......K......}.g
c0dedaa6:	9f84 0bac 3f2c 03a1 7020 849e 5bac 5859     ....,?.. p...[YX
c0dedab6:	5da1 8c97 6a5a 764a 9339 e684 c356 634b     .]..ZjJv9...V.Kc
c0dedac6:	78af 25ba ec71 a999 3adc 1e0c b932 79f2     .x.%q....:..2..y
c0dedad6:	5552 9a5f 2428 8dd4 ac6e a97a 03d9 6a71     RU_.($..n.z...qj
c0dedae6:	347c b956 4264 d69d a454 d917 a9b1 5df1     |4V.dB..T......]
c0dedaf6:	ad2a c3cf f802 726b d86f d60a 0295 7a48     *.....kro.....Hz
c0dedb06:	b72a eb2f b497 6e3b fb57 b5a0 be54 4a08     *./...;nW...T..J
c0dedb16:	4e64 511e 66e2 239d da96 aad4 6d1c add2     dN.Q.f.#.....m..
c0dedb26:	4e23 0891 c269 9a65 ea74 4559 52b4 39a1     #N..i.e.t.YE.R.9
c0dedb36:	3d14 aed7 2371 576b 2840 952d 9280 e187     .=..q#kW@(-.....
c0dedb46:	a52e 4e47 f12e 3aa9 315e 5e10 2826 2640     ..GN...:^1.^&(@&
c0dedb56:	18a0 71a4 6a75 1650 3904 53b7 f134 099e     ...qujP..9.S4...
c0dedb66:	30ec f718 800d cbb6 2c00 d883 5d0b c153     .0.......,...]S.
c0dedb76:	5169 396e f1e3 5585 c7dc 55b5 5fdb 18a4     iQn9...U...U._..
c0dedb86:	8ab3 78cb 11d0 1f02 dcea 43bf 5af3 6917     ...x.......C.Z.i
c0dedb96:	d8d2 bf9d d264 6ca6 1aef 4a41 8170 de2e     ....d..l..AJp...
c0dedba6:	7e3f 503a 969a c149 9b0c 5140 1364 54d5     ?~:P..I...@Qd..T
c0dedbb6:	2261 b31f 7f51 38aa c47c 3160 bf0e d6e0     a"..Q..8|.`1....
c0dedbc6:	caf9 6619 0453 7cdd 7dfa 80f9 9c3d 8dc8     ...fS..|.}..=...
c0dedbd6:	03dc fba1 9396 d980 90d8 c488 2b31 b6ef     ............1+..
c0dedbe6:	3fa6 7e45 cf83 53e0 f344 5461 e621 ba01     .?E~...SD.aT!...
c0dedbf6:	c295 a899 2c84 150b 7423 2dfe 0251 2f9e     .....,..#t.-Q../
c0dedc06:	97d2 97a6 b961 e363 ee3a bf98 3bef 810d     ....a.c.:....;..
c0dedc16:	377f a25a 7cf4 ac35 c4aa f11a 52e8 1367     .7Z..|5......Rg.
c0dedc26:	ca57 1a82 abe8 f901 85b4 6f3b 3869 ecbe     W.........;oi8..
c0dedc36:	9acd cf7a 4f61 67eb 6944 9164 d202 c923     ..z.aO.gDid...#.
c0dedc46:	f887 9e24 2924 d833 55ea f328 1c8f 89d5     ..$.$)3..U(.....
c0dedc56:	8367 8969 e721 0bd9 d97e ecac 3043 d9c4     g.i.!...~...C0..
c0dedc66:	12d9 17f5 5bf8 2462 690e 5358 0de6 114b     .....[b$.iXS..K.
c0dedc76:	4efa a889 522f 9396 982c 05a1 0c60 7912     .N../R..,...`..y
c0dedc86:	0178 1617 b82e e983 2282 90c0 d80f e32f     x........"..../.
c0dedc96:	0906 0bc3 03f1 a465 3814 6857 7870 db4d     ......e..8WhpxM.
c0dedca6:	f4cb 442c 630c d79e 15e0 675b 679c 7c98     ..,D.c....[g.g.|
c0dedcb6:	9e42 f7ac 1b33 3e5a 0ff1 1e1e 2ab1 aa1f     B...3.Z>.....*..
c0dedcc6:	94b4 0eb5 5d2a 9da6 29f4 4d0f 8b76 fb6f     ....*]...).Mv.o.
c0dedcd6:	8c3f 3046 1ab7 5215 ede8 b5fe 42e1 1fc5     ?.F0...R.....B..
c0dedce6:	0cf1 13b8 cdf3 394e 9f97 fef5 2700 bb42     ......N9.....'B.
c0dedcf6:	e96e 10c4 18c8 a829 b82c deb5 e6de e7a4     n.....).,.......
c0dedd06:	4c6b ab84 c102 1466 d85e 59fc f4f7 16b4     kL....f.^..Y....
c0dedd16:	39be ab0e fc8b 49dc 6f8d 3148 cf38 15a0     .9.....I.oH18...
c0dedd26:	0b2f c988 75de 901d 1107 6d59 d064 c3c6     /....u....Ymd...
c0dedd36:	a2bd c2d1 5545 fc1f 1bb8 3b5d b1bd 38a7     ....EU....];...8
c0dedd46:	622c dfd0 a24c dd3b 28d2 999a ff78 bc31     ,b..L.;..(..x.1.
c0dedd56:	995f ef25 d2f1 7984 8396 408c f4d2 0547     _.%....y...@..G.
c0dedd66:	37d7 aa35 d6ac a7c6 f196 1388 69f0 1534     .75..........i4.
c0dedd76:	5055 72df a339 2a6a 9200 8500 cceb ff37     UP.r9.j*......7.
c0dedd86:	1230 34bc 030a 4724 9529 9c3b 8dc1 bd2d     0..4..$G).;...-.
c0dedd96:	fd9b 36e8 7f6d 88f6 6c2c 99cf b40b d3da     ...6m...,l......
c0dedda6:	32ae 38b1 f347 475b 612e 7417 9df6 1c73     .2.8G.[G.a.t..s.
c0deddb6:	fd79 27f7 4aab 2140 daf4 9cc5 ff2e 57bc     y..'.J@!.......W
c0deddc6:	669c 08f2 2601 6d00 4a81 43d8 8831 1dde     .f...&.m.J.C1...
c0deddd6:	53b0 aafb f44d 52f7 a54f e800 dc9c 8a58     .S..M..RO.....X.
c0dedde6:	76e8 c12a 4c72 449a 0fac 9773 32f7 87c3     .v*.rL.D..s..2..
c0deddf6:	4b2f 40dc 2875 4d14 373b 49ac 2653 48a8     /K.@u(.M;7.IS&.H
c0dede06:	1045 dff6 8480 ea9b e8d5 5bf8 1f11 c9ff     E..........[....
c0dede16:	f401 be47 f9b6 f974 1438 356f d0b5 9bed     ..G...t.8.o5....
c0dede26:	9ec3 9b60 2cfb 3791 9646 8f80 701e 8bae     ..`..,.7F....p..
c0dede36:	673b b56a d4ce 44ec bf67 4c90 18bd ca70     ;gj....Dg..L..p.
c0dede46:	a9ab fbc5 923e f712 b4c3 2836 7e5a 276e     ....>.....6(Z~n'
c0dede56:	c32a f960 7e13 52bc 7352 8535 2a21 db91     *.`..~.RRs5.!*..
c0dede66:	9e4b de86 de4c f52a 1699 a8e6 5904 45f1     K...L.*......Y.E
c0dede76:	6b0e acad 14ee ea83 b1c5 295b 79d7 5554     .k........[).yTU
c0dede86:	547e eafb d73a a98f eba3 0b05 fb68 9695     ~T..:.......h...
c0dede96:	7369 4cb1 c91a aa56 4845 b981 d16a 92f4     is.L..V.EH..j...
c0dedea6:	83e1 1c09 ff31 41a2 f10b 842b 43bf 5a21     ....1..A..+..C!Z
c0dedeb6:	3f07 c916 41ef e919 6101 de5d 41b1 67de     .?...A...a]..A.g
c0dedec6:	919f 451e b0a3 89f1 2aa9 0f95 e22e 9d62     ...E.....*....b.
c0deded6:	014c 1dd4 1da3 081d 4712 6382 183f ee68     L........G.c?.h.
	...

c0dedee8 <settingContents>:
c0dedee8:	0000 0000 df04 c0de 0001 0000               ............

c0dedef4 <infoList>:
c0dedef4:	df3c c0de df44 c0de 0000 0000 0002 0000     <...D...........

c0dedf04 <contents>:
c0dedf04:	0007 0000 1454 da7a 0002 0000 0000 0000     ....T.z.........
	...
c0dedf38:	0b3d c0de                                   =...

c0dedf3c <INFO_TYPES>:
c0dedf3c:	ca86 c0de c8c4 c0de                         ........

c0dedf44 <INFO_CONTENTS>:
c0dedf44:	c72e c0de c97f c0de                         ........

c0dedf4c <zetas>:
c0dedf4c:	0000 0000 64f7 0000 3102 ffd8 1503 fff8     .....d...1......
c0dedf5c:	9e44 0003 2118 fff4 a128 fff2 1e24 0007     D....!..(...$...
c0dedf6c:	de2b 001b e92b 0023 84ad fffa 147f ffe0     +...+.#.........
c0dedf7c:	9a75 002f fb09 ffd3 7a49 002f e527 0028     u./.....Iz/.'.(.
c0dedf8c:	9658 0029 a070 000f 85a4 ffef b788 0036     X.).p.........6.
c0dedf9c:	9d90 fff7 eaa0 ffee f968 0027 d37b ffdf     ........h.'.{...
c0dedfac:	add6 ffdf 1ae7 ffc5 a4f7 ffea fc98 ffcd     ................
c0dedfbc:	d035 001a b422 ffff 3201 003d 45c5 0004     5..."....2=..E..
c0dedfcc:	4a67 0029 7620 0001 f4cd 002e dec5 0035     gJ). v........5.
c0dedfdc:	a503 ffe6 302c ffc9 47d4 ffd9 beaf 003b     ....,0...G....;.
c0dedfec:	1585 ffc5 8e7c ffd1 8a96 0036 3e41 ffd4     ....|.....6.A>..
c0dedffc:	0400 0036 6a4d fffb d69c 0023 c55d fff7     ..6.Mj....#.]...
c0dee00c:	123d ffe6 ead6 ffe6 7e1e 0035 af59 ffc5     =........~5.Y...
c0dee01c:	843f 0035 5617 ffdf 945c ffe7 738c 0038     ?.5..V..\....s8.
c0dee02c:	63a8 000c 1b9a 0008 8f76 000e 3853 003b     .c......v...S8;.
c0dee03c:	8534 003b fc30 ffd8 9d54 001f 4f2d ffd5     4.;.0...T...-O..
c0dee04c:	06e5 ffc4 ac81 ffe8 e1cf ffc7 9819 ffd1     ................
c0dee05c:	d65d ffe9 09ee 0035 35c7 0021 cfbb ffe7     ].....5..5!.....
c0dee06c:	cf75 ffec 9772 001d b072 ffc1 bcf6 fff0     u...r...r.......
c0dee07c:	5280 ffcf d2ae ffcf 90e0 ffc8 efca 0001     .R..............
c0dee08c:	10f2 0034 fe85 fff0 c638 0020 6e9f 0029     ..4.....8. ..n).
c0dee09c:	b7a3 ffd2 a44b ffc7 ba6d fff9 3409 ffda     ....K...m....4..
c0dee0ac:	c282 fff5 4113 ffed a63b ffff 09f7 ffec     .....A..;.......
c0dee0bc:	2bdd fffa 95d4 0014 4563 001c 2c62 ffea     .+......cE..b,..
c0dee0cc:	fbe9 ffcc 0af0 0004 c417 0007 4588 002f     .............E/.
c0dee0dc:	ad00 0000 36be ffef cd44 000d 675a 003c     .....6..D...Zg<.
c0dee0ec:	2bca ffc7 de7e ffff 3948 0019 69c0 ffce     .+..~...H9...i..
c0dee0fc:	756c 0024 c7df fffc 98a1 000b e808 ffeb     lu$.............
c0dee10c:	e46c 0002 c808 ffc9 36c2 0030 bff6 ffe3     l........60.....
c0dee11c:	3c93 ffdb 4ae0 fffd 1305 0014 7792 0014     .<...J.......w..
c0dee12c:	9e25 0013 d0e0 ffe7 9944 fff3 0802 ffea     %.......D.......
c0dee13c:	eea2 ffd1 c79c ffc4 a057 ffc8 97d9 003a     ........W.....:.
c0dee14c:	ea93 001f ff5a 0033 58d4 0023 41f8 003a     ....Z.3..X#..A:.
c0dee15c:	ff72 ffcc 3dfb 0022 ab9f ffda a422 ffc9     r....="....."...
c0dee16c:	12f5 0004 2587 0025 24f0 ffed 9b5d 0035     .....%%..$..].5.
c0dee17c:	48a0 ffca a2fc ffc6 bb56 ffed 45de ffcf     .H......V....E..
c0dee18c:	be5e 000d 5e1a 001c e0e6 000d 7f5a 000c     ^....^......Z...
c0dee19c:	8f83 0007 628a ffe7 5704 ffff 06fc fff8     .....b...W......
c0dee1ac:	0021 fff6 5af6 ffd0 0084 001f ef86 0030     !....Z........0.
c0dee1bc:	b97d ffc9 fcd6 fff7 4592 fff4 21c2 ffc9     }........E...!..
c0dee1cc:	3919 0005 610c 0004 cd41 ffda b01b 003e     .9...a..A.....>.
c0dee1dc:	72e7 0034 003b ffcd 7cc7 001a 1924 0003     .r4.;....|..$...
c0dee1ec:	5ee5 002b 1199 0029 7a3a ffd8 4d71 0013     .^+...).:z..qM..
c0dee1fc:	e11c 003d 0984 0013 f051 0025 5a46 0018     ..=.....Q.%.FZ..
c0dee20c:	8518 ffc6 14be 0013 3891 0028 db90 ffc9     .........8(.....
c0dee21c:	5089 ffd2 853f 001c 0b4b 001d f6a6 ffef     .P..?...K.......
c0dee22c:	a8be ffeb e11b 0012 5e3e ffcd 2d2f ffea     ........>^../-..
c0dee23c:	1de4 fff9 06c7 0014 7283 0032 0d6e ffe2     .........r2.n...
c0dee24c:	7953 ffec 4099 001d 2578 ffd9 05ad ffeb     Sy...@..x%......
c0dee25c:	e405 0016 dbe7 000b 1de8 0022 f8cf 0033     .........."...3.
c0dee26c:	b934 fff7 ca0c ffd4 7ff8 ffe6 d157 ffe3     4...........W...
c0dee27c:	911b ffd8 2c12 ffc7 10d8 0009 5e1f ffc6     .....,.......^..
c0dee28c:	4658 ffe1 1d8b 0025 73b7 0025 7c8f fffd     XF....%..s%..|..
c0dee29c:	dd98 001d 6898 0033 d4bb 0002 93a7 ffed     .....h3.........
c0dee2ac:	6cbe ffcf 7c1c 0002 aa08 0018 fd71 002d     .l...|......q.-.
c0dee2bc:	5ca5 000c 379a 0019 a167 ffc7 8c3d ffe4     .\...7..g...=...
c0dee2cc:	a13c ffd1 c539 0035 0115 003b 1dc0 0004     <...9.5...;.....
c0dee2dc:	c4f7 0021 1bf4 fff1 35e7 001a 340e 0007     ..!......5...4..
c0dee2ec:	7d45 fff9 4cd0 001a 7cae ffe4 2668 001d     E}...L...|..h&..
c0dee2fc:	8e98 ffe6 2633 ffef 05da fffc 7fdb ffc5     ....3&..........
c0dee30c:	2764 ffd3 e1af ffdd 93dd fff9 1d09 ffdd     d'..............
c0dee31c:	cc93 0002 1805 fff1 9c2a 0018 e5a9 ffc9     ........*.......
c0dee32c:	8a50 fff7 cf2c 003b 434e ffff 36df ffeb     P...,.;.NC...6..
c0dee33c:	15ca 003c 5e68 0015 16b6 fff3 29ce 001e     ..<.h^.......)..

c0dee34c <small_zetas>:
c0dee34c:	fbec fd0a fe99 fa13 05d5 058e 011f 00ca     ................
c0dee35c:	ff55 026e 0629 00b6 03c2 fb4e fa3e 05bc     U.n.).....N.>...
c0dee36c:	023d fad3 0108 017f fcc3 05b2 f9be ff7e     =.............~.
c0dee37c:	fd57 03f9 02dc 0260 f9fa 019b ff33 f9dd     W.....`.....3...
c0dee38c:	04c7 028c fdd8 03f7 faf3 05d3 fee6 f9f8     ................
c0dee39c:	0204 fff8 fec0 fd66 f9ae fb76 007e 05bd     ......f...v.~...
c0dee3ac:	fcab ffa6 fef1 033e 006b fa73 ff09 fc49     ......>.k.s...I.
c0dee3bc:	fe72 03c1 fa1c fd2b 01c0 fbd7 02a5 fb05     r.....+.........
c0dee3cc:	fbb1 01ae 022b 034b fb1d 0367 060e 0069     ....+.K...g...i.
c0dee3dc:	01a6 024b 00b1 ff15 fedd fe34 0626 0675     ..K.......4.&.u.
c0dee3ec:	ff0a 030a 0487 ff6d fcf7 05cb fda6 045f     ......m......._.
c0dee3fc:	f9ca 0284 fc98 015d 01a2 0149 ff64 ffb5     ......]...I.d...
c0dee40c:	0331 0449 025b 0262 052a fafb fa47 0180     1.I.[.b.*...G...
c0dee41c:	fb41 ff78 04c2 fac9 fc96 00dc fb5d f985     A.x.........]...
c0dee42c:	fb5f fa06 fb02 031a fa1a fcaa fc9a 01de     _...............
c0dee43c:	ff94 fecc 03e4 03df 03be fa4c 05f2 065c     ..........L...\.

c0dee44c <.L__const.nbgl_useCaseStatus.ticker>:
c0dee44c:	8489 c0de 0bb8 0000 0000 0000               ............

c0dee458 <blindSigningWarning>:
c0dee458:	0010 0000 0000 0000 0000 0000 0000 0000     ................
	...
c0dee480:	6854 7369 6120 7070 6520 616e 6c62 7365     This app enables
c0dee490:	7320 6769 696e 676e 740a 6172 736e 6361      signing.transac
c0dee4a0:	6974 6e6f 2073 6e6f 6920 7374 6e20 7465     tions on its net
c0dee4b0:	6f77 6b72 002e                              work..

c0dee4b6 <nbMaxElementsPerContentType>:
c0dee4b6:	0101 0101 0101 0301 0503 0005 0000          ..............

c0dee4c4 <g_pcHex>:
c0dee4c4:	3130 3332 3534 3736 3938 6261 6463 6665     0123456789abcdef
c0dee4d4:	0000 0000 0040 0000 0000 0000 0000 0000     ....@...........
c0dee4e4:	0101 0000 0000 0000 0000 0000 0916 0000     ................
c0dee4f4:	0000 0000 0028 0000 0000 0000 0000 0000     ....(...........

c0dee504 <g_pcHex_cap>:
c0dee504:	3130 3332 3534 3736 3938 4241 4443 4645     0123456789ABCDEF

c0dee514 <.L__const.displaySkipWarning.info>:
c0dee514:	cb11 c0de cd13 c0de 0000 0000 bbe2 c0de     ................
c0dee524:	0000 0000 c912 c0de ce90 c0de 0005 0109     ................

c0dee534 <securityReportItems>:
c0dee534:	c691 c0de c6f2 c0de 0000 0000 c691 c0de     ................
c0dee544:	cb3f c0de ce14 c0de c691 c0de cbb9 c0de     ?...............
c0dee554:	cace c0de 0000 0000 ce68 c0de cfbe c0de     ........h.......
c0dee564:	c691 c0de cb1e c0de cbe2 c0de               ............

c0dee570 <.L__const.displayCustomizedSecurityReport.layoutDescription>:
c0dee570:	0101 0000 0000 0000 0000 0000 9a5d c0de     ............]...
	...

c0dee58c <.L__const.displayInfosListModal.info>:
c0dee58c:	0100 0113 0900 0000 0000 0000 0000 0000     ................
c0dee59c:	0100 0300 0000 0000 0000 0000               ............

c0dee5a8 <.L__const.displayInitialWarning.buttonsInfo>:
c0dee5a8:	c94a c0de cf68 c0de 0000 0000 0014 0009     J...h...........

c0dee5b8 <_etext>:
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
c0dee960:	010a 8002 0000 802c 1f00                     ......,....
