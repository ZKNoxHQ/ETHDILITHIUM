
build/flex/bin/app.elf:     file format elf32-littlearm


Disassembly of section .text:

c0de0000 <main>:
c0de0000:	b510      	push	{r4, lr}
c0de0002:	4604      	mov	r4, r0
c0de0004:	b662      	cpsie	i
c0de0006:	f00b fd37 	bl	c0deba78 <os_boot>
c0de000a:	b90c      	cbnz	r4, c0de0010 <main+0x10>
c0de000c:	f00b fafe 	bl	c0deb60c <standalone_app_main>
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
c0de0022:	f00c f8e7 	bl	c0dec1f4 <__aeabi_memclr>
c0de0026:	b914      	cbnz	r4, c0de002e <address_from_pubkey+0x1a>
c0de0028:	2001      	movs	r0, #1
c0de002a:	f00b fca1 	bl	c0deb970 <assert_exit>
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
c0de0042:	f00b fc5d 	bl	c0deb900 <cx_keccak_256_hash_iovec>
c0de0046:	b108      	cbz	r0, c0de004c <address_from_pubkey+0x38>
c0de0048:	2000      	movs	r0, #0
c0de004a:	e006      	b.n	c0de005a <address_from_pubkey+0x46>
c0de004c:	f105 010c 	add.w	r1, r5, #12
c0de0050:	4620      	mov	r0, r4
c0de0052:	2214      	movs	r2, #20
c0de0054:	f00c f8c4 	bl	c0dec1e0 <__aeabi_memcpy>
c0de0058:	2001      	movs	r0, #1
c0de005a:	b00a      	add	sp, #40	@ 0x28
c0de005c:	bd70      	pop	{r4, r5, r6, pc}

c0de005e <apdu_dispatcher>:
c0de005e:	b51f      	push	{r0, r1, r2, r3, r4, lr}
c0de0060:	4604      	mov	r4, r0
c0de0062:	b910      	cbnz	r0, c0de006a <apdu_dispatcher+0xc>
c0de0064:	2001      	movs	r0, #1
c0de0066:	f00b fc83 	bl	c0deb970 <assert_exit>
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
c0de0104:	f000 fb74 	bl	c0de07f0 <handler_get_mldsa_seed>
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
c0de01d0:	f000 fa3c 	bl	c0de064c <handler_cmd_keygen_core_dilithium>
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
c0de01f4:	f000 fa56 	bl	c0de06a4 <handler_cmd_sign_dilithium>
c0de01f8:	e026      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de01fa:	78a0      	ldrb	r0, [r4, #2]
c0de01fc:	bbb8      	cbnz	r0, c0de026e <apdu_dispatcher+0x210>
c0de01fe:	78e0      	ldrb	r0, [r4, #3]
c0de0200:	bba8      	cbnz	r0, c0de026e <apdu_dispatcher+0x210>
c0de0202:	68a0      	ldr	r0, [r4, #8]
c0de0204:	f000 f844 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de0208:	a801      	add	r0, sp, #4
c0de020a:	f000 faaf 	bl	c0de076c <handler_cmd_verify_dilithium>
c0de020e:	e01b      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de0210:	78a0      	ldrb	r0, [r4, #2]
c0de0212:	bb60      	cbnz	r0, c0de026e <apdu_dispatcher+0x210>
c0de0214:	78e0      	ldrb	r0, [r4, #3]
c0de0216:	bb50      	cbnz	r0, c0de026e <apdu_dispatcher+0x210>
c0de0218:	68a0      	ldr	r0, [r4, #8]
c0de021a:	f000 f839 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de021e:	a801      	add	r0, sp, #4
c0de0220:	f000 fa2e 	bl	c0de0680 <handler_cmd_keygen_dilithium>
c0de0224:	e010      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de0226:	68a0      	ldr	r0, [r4, #8]
c0de0228:	78a1      	ldrb	r1, [r4, #2]
c0de022a:	78e2      	ldrb	r2, [r4, #3]
c0de022c:	f000 f830 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de0230:	a801      	add	r0, sp, #4
c0de0232:	f000 fabd 	bl	c0de07b0 <handler_cmd_get_sig_chunk>
c0de0236:	e007      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de0238:	68a0      	ldr	r0, [r4, #8]
c0de023a:	78a1      	ldrb	r1, [r4, #2]
c0de023c:	78e2      	ldrb	r2, [r4, #3]
c0de023e:	f000 f827 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de0242:	a801      	add	r0, sp, #4
c0de0244:	f000 fac4 	bl	c0de07d0 <handler_cmd_get_pk_chunk>
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
c0de028a:	f00b f97f 	bl	c0deb58c <io_send_response_buffers>
c0de028e:	bd80      	pop	{r7, pc}

c0de0290 <OUTLINED_FUNCTION_0>:
c0de0290:	9001      	str	r0, [sp, #4]
c0de0292:	7920      	ldrb	r0, [r4, #4]
c0de0294:	9002      	str	r0, [sp, #8]
c0de0296:	4770      	bx	lr

c0de0298 <app_main>:
c0de0298:	b5bf      	push	{r0, r1, r2, r3, r4, r5, r7, lr}
c0de029a:	f00b f959 	bl	c0deb550 <io_init>
c0de029e:	f000 fc3f 	bl	c0de0b20 <ui_menu_main>
c0de02a2:	481b      	ldr	r0, [pc, #108]	@ (c0de0310 <app_main+0x78>)
c0de02a4:	f44f 7136 	mov.w	r1, #728	@ 0x2d8
c0de02a8:	4448      	add	r0, r9
c0de02aa:	f00b ffb1 	bl	c0dec210 <explicit_bzero>
c0de02ae:	481a      	ldr	r0, [pc, #104]	@ (c0de0318 <app_main+0x80>)
c0de02b0:	4478      	add	r0, pc
c0de02b2:	f00b fd7d 	bl	c0debdb0 <pic>
c0de02b6:	7880      	ldrb	r0, [r0, #2]
c0de02b8:	2801      	cmp	r0, #1
c0de02ba:	d00d      	beq.n	c0de02d8 <app_main+0x40>
c0de02bc:	2001      	movs	r0, #1
c0de02be:	f88d 0002 	strb.w	r0, [sp, #2]
c0de02c2:	2000      	movs	r0, #0
c0de02c4:	f8ad 0000 	strh.w	r0, [sp]
c0de02c8:	4814      	ldr	r0, [pc, #80]	@ (c0de031c <app_main+0x84>)
c0de02ca:	4478      	add	r0, pc
c0de02cc:	f00b fd70 	bl	c0debdb0 <pic>
c0de02d0:	4669      	mov	r1, sp
c0de02d2:	2203      	movs	r2, #3
c0de02d4:	f00b fda6 	bl	c0debe24 <nvm_write>
c0de02d8:	4d0e      	ldr	r5, [pc, #56]	@ (c0de0314 <app_main+0x7c>)
c0de02da:	ac01      	add	r4, sp, #4
c0de02dc:	f00b f940 	bl	c0deb560 <io_recv_command>
c0de02e0:	2800      	cmp	r0, #0
c0de02e2:	d414      	bmi.n	c0de030e <app_main+0x76>
c0de02e4:	4602      	mov	r2, r0
c0de02e6:	eb09 0105 	add.w	r1, r9, r5
c0de02ea:	4620      	mov	r0, r4
c0de02ec:	f00b f9b5 	bl	c0deb65a <apdu_parser>
c0de02f0:	b130      	cbz	r0, c0de0300 <app_main+0x68>
c0de02f2:	4620      	mov	r0, r4
c0de02f4:	f7ff feb3 	bl	c0de005e <apdu_dispatcher>
c0de02f8:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0de02fc:	dcee      	bgt.n	c0de02dc <app_main+0x44>
c0de02fe:	e006      	b.n	c0de030e <app_main+0x76>
c0de0300:	2000      	movs	r0, #0
c0de0302:	2100      	movs	r1, #0
c0de0304:	f646 2287 	movw	r2, #27271	@ 0x6a87
c0de0308:	f00b f940 	bl	c0deb58c <io_send_response_buffers>
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
c0de0326:	f00b fd43 	bl	c0debdb0 <pic>
c0de032a:	2100      	movs	r1, #0
c0de032c:	f44f 4210 	mov.w	r2, #36864	@ 0x9000
c0de0330:	9103      	str	r1, [sp, #12]
c0de0332:	2105      	movs	r1, #5
c0de0334:	e9cd 0101 	strd	r0, r1, [sp, #4]
c0de0338:	a801      	add	r0, sp, #4
c0de033a:	2101      	movs	r1, #1
c0de033c:	f00b f926 	bl	c0deb58c <io_send_response_buffers>
c0de0340:	b004      	add	sp, #16
c0de0342:	bd80      	pop	{r7, pc}
c0de0344:	0000db1e 	.word	0x0000db1e

c0de0348 <handler_get_public_key>:
c0de0348:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de034a:	b085      	sub	sp, #20
c0de034c:	4f23      	ldr	r7, [pc, #140]	@ (c0de03dc <handler_get_public_key+0x94>)
c0de034e:	460c      	mov	r4, r1
c0de0350:	4605      	mov	r5, r0
c0de0352:	f44f 7136 	mov.w	r1, #728	@ 0x2d8
c0de0356:	eb09 0607 	add.w	r6, r9, r7
c0de035a:	4630      	mov	r0, r6
c0de035c:	f00b ff58 	bl	c0dec210 <explicit_bzero>
c0de0360:	2000      	movs	r0, #0
c0de0362:	f506 7135 	add.w	r1, r6, #724	@ 0x2d4
c0de0366:	f809 0007 	strb.w	r0, [r9, r7]
c0de036a:	f886 02a8 	strb.w	r0, [r6, #680]	@ 0x2a8
c0de036e:	4628      	mov	r0, r5
c0de0370:	f00a feb8 	bl	c0deb0e4 <buffer_read_u8>
c0de0374:	b308      	cbz	r0, c0de03ba <handler_get_public_key+0x72>
c0de0376:	eb09 0007 	add.w	r0, r9, r7
c0de037a:	f890 22d4 	ldrb.w	r2, [r0, #724]	@ 0x2d4
c0de037e:	f500 712b 	add.w	r1, r0, #684	@ 0x2ac
c0de0382:	4628      	mov	r0, r5
c0de0384:	f00a ff01 	bl	c0deb18a <buffer_read_bip32_path>
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
c0de03b0:	f00a ffac 	bl	c0deb30c <bip32_derive_with_seed_get_pubkey_256>
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
c0de03d2:	f000 ba75 	beq.w	c0de08c0 <helper_send_response_pubkey>
c0de03d6:	f000 bc8b 	b.w	c0de0cf0 <ui_display_address>
c0de03da:	bf00      	nop
c0de03dc:	00000000 	.word	0x00000000

c0de03e0 <io_send_sw>:
c0de03e0:	b580      	push	{r7, lr}
c0de03e2:	4602      	mov	r2, r0
c0de03e4:	2000      	movs	r0, #0
c0de03e6:	2100      	movs	r1, #0
c0de03e8:	f00b f8d0 	bl	c0deb58c <io_send_response_buffers>
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
c0de0414:	f00b f8ba 	bl	c0deb58c <io_send_response_buffers>
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
c0de0456:	f00b fedb 	bl	c0dec210 <explicit_bzero>
c0de045a:	2000      	movs	r0, #0
c0de045c:	f505 7135 	add.w	r1, r5, #724	@ 0x2d4
c0de0460:	f809 0006 	strb.w	r0, [r9, r6]
c0de0464:	2001      	movs	r0, #1
c0de0466:	f885 02a8 	strb.w	r0, [r5, #680]	@ 0x2a8
c0de046a:	4620      	mov	r0, r4
c0de046c:	f00a fe3a 	bl	c0deb0e4 <buffer_read_u8>
c0de0470:	b148      	cbz	r0, c0de0486 <handler_sign_tx+0x6a>
c0de0472:	eb09 0006 	add.w	r0, r9, r6
c0de0476:	f890 22d4 	ldrb.w	r2, [r0, #724]	@ 0x2d4
c0de047a:	f500 712b 	add.w	r1, r0, #684	@ 0x2ac
c0de047e:	4620      	mov	r0, r4
c0de0480:	f00a fe83 	bl	c0deb18a <buffer_read_bip32_path>
c0de0484:	b9b8      	cbnz	r0, c0de04b6 <handler_sign_tx+0x9a>
c0de0486:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de048a:	e019      	b.n	c0de04c0 <handler_sign_tx+0xa4>
c0de048c:	f24b 0007 	movw	r0, #45063	@ 0xb007
c0de0490:	e016      	b.n	c0de04c0 <handler_sign_tx+0xa4>
c0de0492:	eb09 0106 	add.w	r1, r9, r6
c0de0496:	4408      	add	r0, r1
c0de0498:	f100 0108 	add.w	r1, r0, #8
c0de049c:	4620      	mov	r0, r4
c0de049e:	f00a fe9e 	bl	c0deb1de <buffer_move>
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
c0de04e0:	f000 fa3e 	bl	c0de0960 <transaction_deserialize>
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
c0de0506:	f00b f9fb 	bl	c0deb900 <cx_keccak_256_hash_iovec>
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
c0de052a:	f00b feb5 	bl	c0dec298 <strcmp>
c0de052e:	b110      	cbz	r0, c0de0536 <handler_sign_tx+0x11a>
c0de0530:	f000 fd03 	bl	c0de0f3a <ui_display_transaction>
c0de0534:	e7f1      	b.n	c0de051a <handler_sign_tx+0xfe>
c0de0536:	f000 fcfd 	bl	c0de0f34 <ui_display_blind_signed_transaction>
c0de053a:	e7ee      	b.n	c0de051a <handler_sign_tx+0xfe>
c0de053c:	00000000 	.word	0x00000000
c0de0540:	0000d346 	.word	0x0000d346

c0de0544 <io_send_sw>:
c0de0544:	b580      	push	{r7, lr}
c0de0546:	4602      	mov	r2, r0
c0de0548:	2000      	movs	r0, #0
c0de054a:	2100      	movs	r1, #0
c0de054c:	f00b f81e 	bl	c0deb58c <io_send_response_buffers>
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
c0de0572:	f00b f80b 	bl	c0deb58c <io_send_response_buffers>
c0de0576:	bd8f      	pop	{r0, r1, r2, r3, r7, pc}

c0de0578 <io_send_sw>:
c0de0578:	b580      	push	{r7, lr}
c0de057a:	4602      	mov	r2, r0
c0de057c:	2000      	movs	r0, #0
c0de057e:	2100      	movs	r1, #0
c0de0580:	f00b f804 	bl	c0deb58c <io_send_response_buffers>
c0de0584:	bd80      	pop	{r7, pc}

c0de0586 <handler_cmd_keccakH>:
c0de0586:	b5b0      	push	{r4, r5, r7, lr}
c0de0588:	b0f2      	sub	sp, #456	@ 0x1c8
c0de058a:	466d      	mov	r5, sp
c0de058c:	4604      	mov	r4, r0
c0de058e:	4628      	mov	r0, r5
c0de0590:	f001 fde9 	bl	c0de2166 <keccak_init>
c0de0594:	88a2      	ldrh	r2, [r4, #4]
c0de0596:	6821      	ldr	r1, [r4, #0]
c0de0598:	4628      	mov	r0, r5
c0de059a:	f001 fde8 	bl	c0de216e <keccak_update>
c0de059e:	ac6a      	add	r4, sp, #424	@ 0x1a8
c0de05a0:	4628      	mov	r0, r5
c0de05a2:	4621      	mov	r1, r4
c0de05a4:	f001 fde5 	bl	c0de2172 <keccak_final>
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
c0de05ca:	f001 fdd4 	bl	c0de2176 <inner_keccak256_init>
c0de05ce:	e019      	b.n	c0de0604 <handler_cmd_keccak_prng+0x4c>
c0de05d0:	4c14      	ldr	r4, [pc, #80]	@ (c0de0624 <handler_cmd_keccak_prng+0x6c>)
c0de05d2:	eb09 0004 	add.w	r0, r9, r4
c0de05d6:	f001 fdf1 	bl	c0de21bc <inner_keccak256_flip>
c0de05da:	b9a0      	cbnz	r0, c0de0606 <handler_cmd_keccak_prng+0x4e>
c0de05dc:	eb09 0004 	add.w	r0, r9, r4
c0de05e0:	4669      	mov	r1, sp
c0de05e2:	2240      	movs	r2, #64	@ 0x40
c0de05e4:	f001 fe00 	bl	c0de21e8 <inner_keccak256_extract>
c0de05e8:	b968      	cbnz	r0, c0de0606 <handler_cmd_keccak_prng+0x4e>
c0de05ea:	4668      	mov	r0, sp
c0de05ec:	2140      	movs	r1, #64	@ 0x40
c0de05ee:	f7ff ffb8 	bl	c0de0562 <io_send_response_pointer>
c0de05f2:	e014      	b.n	c0de061e <handler_cmd_keccak_prng+0x66>
c0de05f4:	490b      	ldr	r1, [pc, #44]	@ (c0de0624 <handler_cmd_keccak_prng+0x6c>)
c0de05f6:	eb09 0301 	add.w	r3, r9, r1
c0de05fa:	e9d0 1200 	ldrd	r1, r2, [r0]
c0de05fe:	4618      	mov	r0, r3
c0de0600:	f001 fdca 	bl	c0de2198 <inner_keccak256_inject>
c0de0604:	b148      	cbz	r0, c0de061a <handler_cmd_keccak_prng+0x62>
c0de0606:	f000 f957 	bl	c0de08b8 <OUTLINED_FUNCTION_1>
c0de060a:	e009      	b.n	c0de0620 <handler_cmd_keccak_prng+0x68>
c0de060c:	f646 2086 	movw	r0, #27270	@ 0x6a86
c0de0610:	b010      	add	sp, #64	@ 0x40
c0de0612:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de0616:	f7ff bfaf 	b.w	c0de0578 <io_send_sw>
c0de061a:	f000 f949 	bl	c0de08b0 <OUTLINED_FUNCTION_0>
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
c0de0634:	f002 fd01 	bl	c0de303a <pqcrystals_dilithium2_lowram_poly_challenge>
c0de0638:	4620      	mov	r0, r4
c0de063a:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de063e:	f7ff ff90 	bl	c0de0562 <io_send_response_pointer>
c0de0642:	2000      	movs	r0, #0
c0de0644:	f50d 6d80 	add.w	sp, sp, #1024	@ 0x400
c0de0648:	bd10      	pop	{r4, pc}
	...

c0de064c <handler_cmd_keygen_core_dilithium>:
c0de064c:	b580      	push	{r7, lr}
c0de064e:	f5ad 6d72 	sub.w	sp, sp, #3872	@ 0xf20
c0de0652:	480a      	ldr	r0, [pc, #40]	@ (c0de067c <handler_cmd_keygen_core_dilithium+0x30>)
c0de0654:	f241 01f4 	movw	r1, #4340	@ 0x10f4
c0de0658:	4448      	add	r0, r9
c0de065a:	1842      	adds	r2, r0, r1
c0de065c:	f50d 6020 	add.w	r0, sp, #2560	@ 0xa00
c0de0660:	4669      	mov	r1, sp
c0de0662:	f002 fed5 	bl	c0de3410 <crypto_sign_keypair_core>
c0de0666:	b110      	cbz	r0, c0de066e <handler_cmd_keygen_core_dilithium+0x22>
c0de0668:	f000 f926 	bl	c0de08b8 <OUTLINED_FUNCTION_1>
c0de066c:	e002      	b.n	c0de0674 <handler_cmd_keygen_core_dilithium+0x28>
c0de066e:	f000 f91f 	bl	c0de08b0 <OUTLINED_FUNCTION_0>
c0de0672:	2000      	movs	r0, #0
c0de0674:	f50d 6d72 	add.w	sp, sp, #3872	@ 0xf20
c0de0678:	bd80      	pop	{r7, pc}
c0de067a:	bf00      	nop
c0de067c:	000002d8 	.word	0x000002d8

c0de0680 <handler_cmd_keygen_dilithium>:
c0de0680:	b580      	push	{r7, lr}
c0de0682:	f5ad 6d72 	sub.w	sp, sp, #3872	@ 0xf20
c0de0686:	f50d 6020 	add.w	r0, sp, #2560	@ 0xa00
c0de068a:	4669      	mov	r1, sp
c0de068c:	f002 feaf 	bl	c0de33ee <pqcrystals_dilithium2_lowram_keypair>
c0de0690:	b110      	cbz	r0, c0de0698 <handler_cmd_keygen_dilithium+0x18>
c0de0692:	f000 f911 	bl	c0de08b8 <OUTLINED_FUNCTION_1>
c0de0696:	e002      	b.n	c0de069e <handler_cmd_keygen_dilithium+0x1e>
c0de0698:	f000 f90a 	bl	c0de08b0 <OUTLINED_FUNCTION_0>
c0de069c:	2000      	movs	r0, #0
c0de069e:	f50d 6d72 	add.w	sp, sp, #3872	@ 0xf20
c0de06a2:	bd80      	pop	{r7, pc}

c0de06a4 <handler_cmd_sign_dilithium>:
c0de06a4:	b5b0      	push	{r4, r5, r7, lr}
c0de06a6:	f6ad 7d28 	subw	sp, sp, #3880	@ 0xf28
c0de06aa:	4604      	mov	r4, r0
c0de06ac:	2980      	cmp	r1, #128	@ 0x80
c0de06ae:	d016      	beq.n	c0de06de <handler_cmd_sign_dilithium+0x3a>
c0de06b0:	2901      	cmp	r1, #1
c0de06b2:	d026      	beq.n	c0de0702 <handler_cmd_sign_dilithium+0x5e>
c0de06b4:	bb69      	cbnz	r1, c0de0712 <handler_cmd_sign_dilithium+0x6e>
c0de06b6:	482c      	ldr	r0, [pc, #176]	@ (c0de0768 <handler_cmd_sign_dilithium+0xc4>)
c0de06b8:	f241 01f4 	movw	r1, #4340	@ 0x10f4
c0de06bc:	4448      	add	r0, r9
c0de06be:	1842      	adds	r2, r0, r1
c0de06c0:	f60d 2008 	addw	r0, sp, #2568	@ 0xa08
c0de06c4:	a902      	add	r1, sp, #8
c0de06c6:	f002 fea3 	bl	c0de3410 <crypto_sign_keypair_core>
c0de06ca:	4604      	mov	r4, r0
c0de06cc:	2800      	cmp	r0, #0
c0de06ce:	d141      	bne.n	c0de0754 <handler_cmd_sign_dilithium+0xb0>
c0de06d0:	2000      	movs	r0, #0
c0de06d2:	2100      	movs	r1, #0
c0de06d4:	f002 ff72 	bl	c0de35bc <crypto_sign_signature_init>
c0de06d8:	f000 f8ea 	bl	c0de08b0 <OUTLINED_FUNCTION_0>
c0de06dc:	e03a      	b.n	c0de0754 <handler_cmd_sign_dilithium+0xb0>
c0de06de:	4d22      	ldr	r5, [pc, #136]	@ (c0de0768 <handler_cmd_sign_dilithium+0xc4>)
c0de06e0:	f241 01f4 	movw	r1, #4340	@ 0x10f4
c0de06e4:	eb09 0005 	add.w	r0, r9, r5
c0de06e8:	1842      	adds	r2, r0, r1
c0de06ea:	f60d 2008 	addw	r0, sp, #2568	@ 0xa08
c0de06ee:	a902      	add	r1, sp, #8
c0de06f0:	f002 fe8e 	bl	c0de3410 <crypto_sign_keypair_core>
c0de06f4:	bb78      	cbnz	r0, c0de0756 <handler_cmd_sign_dilithium+0xb2>
c0de06f6:	6860      	ldr	r0, [r4, #4]
c0de06f8:	2801      	cmp	r0, #1
c0de06fa:	d812      	bhi.n	c0de0722 <handler_cmd_sign_dilithium+0x7e>
c0de06fc:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de0700:	e02b      	b.n	c0de075a <handler_cmd_sign_dilithium+0xb6>
c0de0702:	e9d4 0100 	ldrd	r0, r1, [r4]
c0de0706:	f002 ff85 	bl	c0de3614 <crypto_sign_signature_absorb>
c0de070a:	bb20      	cbnz	r0, c0de0756 <handler_cmd_sign_dilithium+0xb2>
c0de070c:	f000 f8d0 	bl	c0de08b0 <OUTLINED_FUNCTION_0>
c0de0710:	e026      	b.n	c0de0760 <handler_cmd_sign_dilithium+0xbc>
c0de0712:	f646 2086 	movw	r0, #27270	@ 0x6a86
c0de0716:	f60d 7d28 	addw	sp, sp, #3880	@ 0xf28
c0de071a:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
c0de071e:	f7ff bf2b 	b.w	c0de0578 <io_send_sw>
c0de0722:	3802      	subs	r0, #2
c0de0724:	6060      	str	r0, [r4, #4]
c0de0726:	6820      	ldr	r0, [r4, #0]
c0de0728:	3002      	adds	r0, #2
c0de072a:	6020      	str	r0, [r4, #0]
c0de072c:	2000      	movs	r0, #0
c0de072e:	9001      	str	r0, [sp, #4]
c0de0730:	eb09 0005 	add.w	r0, r9, r5
c0de0734:	a901      	add	r1, sp, #4
c0de0736:	aa02      	add	r2, sp, #8
c0de0738:	f500 60f0 	add.w	r0, r0, #1920	@ 0x780
c0de073c:	f002 ff76 	bl	c0de362c <crypto_sign_signature_core>
c0de0740:	4604      	mov	r4, r0
c0de0742:	b938      	cbnz	r0, c0de0754 <handler_cmd_sign_dilithium+0xb0>
c0de0744:	eb09 0005 	add.w	r0, r9, r5
c0de0748:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de074c:	f500 60f0 	add.w	r0, r0, #1920	@ 0x780
c0de0750:	f7ff ff07 	bl	c0de0562 <io_send_response_pointer>
c0de0754:	b124      	cbz	r4, c0de0760 <handler_cmd_sign_dilithium+0xbc>
c0de0756:	f24b 0005 	movw	r0, #45061	@ 0xb005
c0de075a:	f7ff ff0d 	bl	c0de0578 <io_send_sw>
c0de075e:	e000      	b.n	c0de0762 <handler_cmd_sign_dilithium+0xbe>
c0de0760:	2000      	movs	r0, #0
c0de0762:	f60d 7d28 	addw	sp, sp, #3880	@ 0xf28
c0de0766:	bdb0      	pop	{r4, r5, r7, pc}
c0de0768:	000002d8 	.word	0x000002d8

c0de076c <handler_cmd_verify_dilithium>:
c0de076c:	b580      	push	{r7, lr}
c0de076e:	b08e      	sub	sp, #56	@ 0x38
c0de0770:	480d      	ldr	r0, [pc, #52]	@ (c0de07a8 <handler_cmd_verify_dilithium+0x3c>)
c0de0772:	2100      	movs	r1, #0
c0de0774:	f640 1395 	movw	r3, #2453	@ 0x995
c0de0778:	e9cd 1100 	strd	r1, r1, [sp]
c0de077c:	4478      	add	r0, pc
c0de077e:	9002      	str	r0, [sp, #8]
c0de0780:	a904      	add	r1, sp, #16
c0de0782:	4a0a      	ldr	r2, [pc, #40]	@ (c0de07ac <handler_cmd_verify_dilithium+0x40>)
c0de0784:	f10d 0017 	add.w	r0, sp, #23
c0de0788:	447a      	add	r2, pc
c0de078a:	f003 f9f3 	bl	c0de3b74 <pqcrystals_dilithium2_lowram_open>
c0de078e:	b110      	cbz	r0, c0de0796 <handler_cmd_verify_dilithium+0x2a>
c0de0790:	f000 f892 	bl	c0de08b8 <OUTLINED_FUNCTION_1>
c0de0794:	e005      	b.n	c0de07a2 <handler_cmd_verify_dilithium+0x36>
c0de0796:	9904      	ldr	r1, [sp, #16]
c0de0798:	f10d 0017 	add.w	r0, sp, #23
c0de079c:	f7ff fee1 	bl	c0de0562 <io_send_response_pointer>
c0de07a0:	2000      	movs	r0, #0
c0de07a2:	b00e      	add	sp, #56	@ 0x38
c0de07a4:	bd80      	pop	{r7, pc}
c0de07a6:	bf00      	nop
c0de07a8:	0000e40e 	.word	0x0000e40e
c0de07ac:	0000da6d 	.word	0x0000da6d

c0de07b0 <handler_cmd_get_sig_chunk>:
c0de07b0:	b580      	push	{r7, lr}
c0de07b2:	4806      	ldr	r0, [pc, #24]	@ (c0de07cc <handler_cmd_get_sig_chunk+0x1c>)
c0de07b4:	ebc1 2101 	rsb	r1, r1, r1, lsl #8
c0de07b8:	4448      	add	r0, r9
c0de07ba:	4408      	add	r0, r1
c0de07bc:	4611      	mov	r1, r2
c0de07be:	f500 60f0 	add.w	r0, r0, #1920	@ 0x780
c0de07c2:	f7ff fece 	bl	c0de0562 <io_send_response_pointer>
c0de07c6:	2000      	movs	r0, #0
c0de07c8:	bd80      	pop	{r7, pc}
c0de07ca:	bf00      	nop
c0de07cc:	000002d8 	.word	0x000002d8

c0de07d0 <handler_cmd_get_pk_chunk>:
c0de07d0:	b580      	push	{r7, lr}
c0de07d2:	4806      	ldr	r0, [pc, #24]	@ (c0de07ec <handler_cmd_get_pk_chunk+0x1c>)
c0de07d4:	ebc1 2101 	rsb	r1, r1, r1, lsl #8
c0de07d8:	4448      	add	r0, r9
c0de07da:	4408      	add	r0, r1
c0de07dc:	4611      	mov	r1, r2
c0de07de:	f500 7018 	add.w	r0, r0, #608	@ 0x260
c0de07e2:	f7ff febe 	bl	c0de0562 <io_send_response_pointer>
c0de07e6:	2000      	movs	r0, #0
c0de07e8:	bd80      	pop	{r7, pc}
c0de07ea:	bf00      	nop
c0de07ec:	000002d8 	.word	0x000002d8

c0de07f0 <handler_get_mldsa_seed>:
c0de07f0:	b570      	push	{r4, r5, r6, lr}
c0de07f2:	b0f0      	sub	sp, #448	@ 0x1c0
c0de07f4:	4e2c      	ldr	r6, [pc, #176]	@ (c0de08a8 <handler_get_mldsa_seed+0xb8>)
c0de07f6:	4604      	mov	r4, r0
c0de07f8:	f44f 7136 	mov.w	r1, #728	@ 0x2d8
c0de07fc:	eb09 0506 	add.w	r5, r9, r6
c0de0800:	4628      	mov	r0, r5
c0de0802:	f00b fd05 	bl	c0dec210 <explicit_bzero>
c0de0806:	2000      	movs	r0, #0
c0de0808:	f505 7135 	add.w	r1, r5, #724	@ 0x2d4
c0de080c:	f809 0006 	strb.w	r0, [r9, r6]
c0de0810:	f885 02a8 	strb.w	r0, [r5, #680]	@ 0x2a8
c0de0814:	4620      	mov	r0, r4
c0de0816:	f00a fc65 	bl	c0deb0e4 <buffer_read_u8>
c0de081a:	b308      	cbz	r0, c0de0860 <handler_get_mldsa_seed+0x70>
c0de081c:	eb09 0006 	add.w	r0, r9, r6
c0de0820:	f890 22d4 	ldrb.w	r2, [r0, #724]	@ 0x2d4
c0de0824:	f500 712b 	add.w	r1, r0, #684	@ 0x2ac
c0de0828:	4620      	mov	r0, r4
c0de082a:	f00a fcae 	bl	c0deb18a <buffer_read_bip32_path>
c0de082e:	b1b8      	cbz	r0, c0de0860 <handler_get_mldsa_seed+0x70>
c0de0830:	eb09 0006 	add.w	r0, r9, r6
c0de0834:	2100      	movs	r1, #0
c0de0836:	2205      	movs	r2, #5
c0de0838:	f890 32d4 	ldrb.w	r3, [r0, #724]	@ 0x2d4
c0de083c:	e9cd 2102 	strd	r2, r1, [sp, #8]
c0de0840:	9104      	str	r1, [sp, #16]
c0de0842:	f100 0449 	add.w	r4, r0, #73	@ 0x49
c0de0846:	f100 0508 	add.w	r5, r0, #8
c0de084a:	f500 722b 	add.w	r2, r0, #684	@ 0x2ac
c0de084e:	2000      	movs	r0, #0
c0de0850:	2121      	movs	r1, #33	@ 0x21
c0de0852:	e9cd 5400 	strd	r5, r4, [sp]
c0de0856:	f00a fd59 	bl	c0deb30c <bip32_derive_with_seed_get_pubkey_256>
c0de085a:	b140      	cbz	r0, c0de086e <handler_get_mldsa_seed+0x7e>
c0de085c:	b280      	uxth	r0, r0
c0de085e:	e001      	b.n	c0de0864 <handler_get_mldsa_seed+0x74>
c0de0860:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de0864:	b070      	add	sp, #448	@ 0x1c0
c0de0866:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de086a:	f7ff be85 	b.w	c0de0578 <io_send_sw>
c0de086e:	ac06      	add	r4, sp, #24
c0de0870:	4620      	mov	r0, r4
c0de0872:	f001 fc78 	bl	c0de2166 <keccak_init>
c0de0876:	eb09 0006 	add.w	r0, r9, r6
c0de087a:	2241      	movs	r2, #65	@ 0x41
c0de087c:	f100 0108 	add.w	r1, r0, #8
c0de0880:	4620      	mov	r0, r4
c0de0882:	f001 fc74 	bl	c0de216e <keccak_update>
c0de0886:	4809      	ldr	r0, [pc, #36]	@ (c0de08ac <handler_get_mldsa_seed+0xbc>)
c0de0888:	f241 01f4 	movw	r1, #4340	@ 0x10f4
c0de088c:	4448      	add	r0, r9
c0de088e:	1845      	adds	r5, r0, r1
c0de0890:	4620      	mov	r0, r4
c0de0892:	4629      	mov	r1, r5
c0de0894:	f001 fc6d 	bl	c0de2172 <keccak_final>
c0de0898:	4628      	mov	r0, r5
c0de089a:	2120      	movs	r1, #32
c0de089c:	f7ff fe61 	bl	c0de0562 <io_send_response_pointer>
c0de08a0:	2000      	movs	r0, #0
c0de08a2:	b070      	add	sp, #448	@ 0x1c0
c0de08a4:	bd70      	pop	{r4, r5, r6, pc}
c0de08a6:	bf00      	nop
c0de08a8:	00000000 	.word	0x00000000
c0de08ac:	000002d8 	.word	0x000002d8

c0de08b0 <OUTLINED_FUNCTION_0>:
c0de08b0:	f44f 4010 	mov.w	r0, #36864	@ 0x9000
c0de08b4:	f7ff be60 	b.w	c0de0578 <io_send_sw>

c0de08b8 <OUTLINED_FUNCTION_1>:
c0de08b8:	f24b 0005 	movw	r0, #45061	@ 0xb005
c0de08bc:	f7ff be5c 	b.w	c0de0578 <io_send_sw>

c0de08c0 <helper_send_response_pubkey>:
c0de08c0:	b5b0      	push	{r4, r5, r7, lr}
c0de08c2:	b09a      	sub	sp, #104	@ 0x68
c0de08c4:	2041      	movs	r0, #65	@ 0x41
c0de08c6:	f10d 0405 	add.w	r4, sp, #5
c0de08ca:	2241      	movs	r2, #65	@ 0x41
c0de08cc:	f88d 0005 	strb.w	r0, [sp, #5]
c0de08d0:	480b      	ldr	r0, [pc, #44]	@ (c0de0900 <helper_send_response_pubkey+0x40>)
c0de08d2:	eb09 0500 	add.w	r5, r9, r0
c0de08d6:	1c60      	adds	r0, r4, #1
c0de08d8:	f105 0108 	add.w	r1, r5, #8
c0de08dc:	f00b fc80 	bl	c0dec1e0 <__aeabi_memcpy>
c0de08e0:	2020      	movs	r0, #32
c0de08e2:	f105 0149 	add.w	r1, r5, #73	@ 0x49
c0de08e6:	2220      	movs	r2, #32
c0de08e8:	f88d 0047 	strb.w	r0, [sp, #71]	@ 0x47
c0de08ec:	f104 0043 	add.w	r0, r4, #67	@ 0x43
c0de08f0:	f00b fc76 	bl	c0dec1e0 <__aeabi_memcpy>
c0de08f4:	4620      	mov	r0, r4
c0de08f6:	2163      	movs	r1, #99	@ 0x63
c0de08f8:	f000 f804 	bl	c0de0904 <io_send_response_pointer>
c0de08fc:	b01a      	add	sp, #104	@ 0x68
c0de08fe:	bdb0      	pop	{r4, r5, r7, pc}
c0de0900:	00000000 	.word	0x00000000

c0de0904 <io_send_response_pointer>:
c0de0904:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de0906:	2200      	movs	r2, #0
c0de0908:	ab01      	add	r3, sp, #4
c0de090a:	c307      	stmia	r3!, {r0, r1, r2}
c0de090c:	a801      	add	r0, sp, #4
c0de090e:	2101      	movs	r1, #1
c0de0910:	f44f 4210 	mov.w	r2, #36864	@ 0x9000
c0de0914:	f00a fe3a 	bl	c0deb58c <io_send_response_buffers>
c0de0918:	b004      	add	sp, #16
c0de091a:	bd80      	pop	{r7, pc}

c0de091c <helper_send_response_sig>:
c0de091c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de091e:	b093      	sub	sp, #76	@ 0x4c
c0de0920:	f10d 0402 	add.w	r4, sp, #2
c0de0924:	2149      	movs	r1, #73	@ 0x49
c0de0926:	1c65      	adds	r5, r4, #1
c0de0928:	4628      	mov	r0, r5
c0de092a:	f00b fc63 	bl	c0dec1f4 <__aeabi_memclr>
c0de092e:	480b      	ldr	r0, [pc, #44]	@ (c0de095c <helper_send_response_sig+0x40>)
c0de0930:	eb09 0700 	add.w	r7, r9, r0
c0de0934:	4628      	mov	r0, r5
c0de0936:	f897 62a0 	ldrb.w	r6, [r7, #672]	@ 0x2a0
c0de093a:	f507 7116 	add.w	r1, r7, #600	@ 0x258
c0de093e:	4632      	mov	r2, r6
c0de0940:	f88d 6002 	strb.w	r6, [sp, #2]
c0de0944:	f00b fc4c 	bl	c0dec1e0 <__aeabi_memcpy>
c0de0948:	f897 12a1 	ldrb.w	r1, [r7, #673]	@ 0x2a1
c0de094c:	1930      	adds	r0, r6, r4
c0de094e:	7041      	strb	r1, [r0, #1]
c0de0950:	1cb1      	adds	r1, r6, #2
c0de0952:	4620      	mov	r0, r4
c0de0954:	f7ff ffd6 	bl	c0de0904 <io_send_response_pointer>
c0de0958:	b013      	add	sp, #76	@ 0x4c
c0de095a:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de095c:	00000000 	.word	0x00000000

c0de0960 <transaction_deserialize>:
c0de0960:	b570      	push	{r4, r5, r6, lr}
c0de0962:	460d      	mov	r5, r1
c0de0964:	4604      	mov	r4, r0
c0de0966:	b910      	cbnz	r0, c0de096e <transaction_deserialize+0xe>
c0de0968:	2001      	movs	r0, #1
c0de096a:	f00b f801 	bl	c0deb970 <assert_exit>
c0de096e:	b915      	cbnz	r5, c0de0976 <transaction_deserialize+0x16>
c0de0970:	2001      	movs	r0, #1
c0de0972:	f00a fffd 	bl	c0deb970 <assert_exit>
c0de0976:	6860      	ldr	r0, [r4, #4]
c0de0978:	f5b0 7fff 	cmp.w	r0, #510	@ 0x1fe
c0de097c:	d901      	bls.n	c0de0982 <transaction_deserialize+0x22>
c0de097e:	20f9      	movs	r0, #249	@ 0xf9
c0de0980:	e04b      	b.n	c0de0a1a <transaction_deserialize+0xba>
c0de0982:	4620      	mov	r0, r4
c0de0984:	4629      	mov	r1, r5
c0de0986:	2200      	movs	r2, #0
c0de0988:	f00a fbc2 	bl	c0deb110 <buffer_read_u64>
c0de098c:	b330      	cbz	r0, c0de09dc <transaction_deserialize+0x7c>
c0de098e:	6820      	ldr	r0, [r4, #0]
c0de0990:	68a1      	ldr	r1, [r4, #8]
c0de0992:	4408      	add	r0, r1
c0de0994:	2114      	movs	r1, #20
c0de0996:	61a8      	str	r0, [r5, #24]
c0de0998:	4620      	mov	r0, r4
c0de099a:	f00a fb98 	bl	c0deb0ce <buffer_seek_cur>
c0de099e:	b1f8      	cbz	r0, c0de09e0 <transaction_deserialize+0x80>
c0de09a0:	f105 0108 	add.w	r1, r5, #8
c0de09a4:	4620      	mov	r0, r4
c0de09a6:	2200      	movs	r2, #0
c0de09a8:	2600      	movs	r6, #0
c0de09aa:	f00a fbb1 	bl	c0deb110 <buffer_read_u64>
c0de09ae:	b1c8      	cbz	r0, c0de09e4 <transaction_deserialize+0x84>
c0de09b0:	f105 0120 	add.w	r1, r5, #32
c0de09b4:	4620      	mov	r0, r4
c0de09b6:	e9c5 6604 	strd	r6, r6, [r5, #16]
c0de09ba:	f00a fbc9 	bl	c0deb150 <buffer_read_varint>
c0de09be:	6a29      	ldr	r1, [r5, #32]
c0de09c0:	b990      	cbnz	r0, c0de09e8 <transaction_deserialize+0x88>
c0de09c2:	6a68      	ldr	r0, [r5, #36]	@ 0x24
c0de09c4:	ea5f 0050 	movs.w	r0, r0, lsr #1
c0de09c8:	ea4f 0231 	mov.w	r2, r1, rrx
c0de09cc:	2300      	movs	r3, #0
c0de09ce:	f1d2 02e8 	rsbs	r2, r2, #232	@ 0xe8
c0de09d2:	eb73 0000 	sbcs.w	r0, r3, r0
c0de09d6:	d207      	bcs.n	c0de09e8 <transaction_deserialize+0x88>
c0de09d8:	20fc      	movs	r0, #252	@ 0xfc
c0de09da:	e01e      	b.n	c0de0a1a <transaction_deserialize+0xba>
c0de09dc:	20ff      	movs	r0, #255	@ 0xff
c0de09de:	e01c      	b.n	c0de0a1a <transaction_deserialize+0xba>
c0de09e0:	20fe      	movs	r0, #254	@ 0xfe
c0de09e2:	e01a      	b.n	c0de0a1a <transaction_deserialize+0xba>
c0de09e4:	20fd      	movs	r0, #253	@ 0xfd
c0de09e6:	e018      	b.n	c0de0a1a <transaction_deserialize+0xba>
c0de09e8:	6820      	ldr	r0, [r4, #0]
c0de09ea:	68a2      	ldr	r2, [r4, #8]
c0de09ec:	4410      	add	r0, r2
c0de09ee:	61e8      	str	r0, [r5, #28]
c0de09f0:	4620      	mov	r0, r4
c0de09f2:	f00a fb6c 	bl	c0deb0ce <buffer_seek_cur>
c0de09f6:	b168      	cbz	r0, c0de0a14 <transaction_deserialize+0xb4>
c0de09f8:	f105 031c 	add.w	r3, r5, #28
c0de09fc:	cb0d      	ldmia	r3, {r0, r2, r3}
c0de09fe:	f000 f80e 	bl	c0de0a1e <transaction_utils_check_encoding>
c0de0a02:	b148      	cbz	r0, c0de0a18 <transaction_deserialize+0xb8>
c0de0a04:	e9d4 1201 	ldrd	r1, r2, [r4, #4]
c0de0a08:	f06f 0006 	mvn.w	r0, #6
c0de0a0c:	428a      	cmp	r2, r1
c0de0a0e:	bf08      	it	eq
c0de0a10:	2001      	moveq	r0, #1
c0de0a12:	e002      	b.n	c0de0a1a <transaction_deserialize+0xba>
c0de0a14:	20fb      	movs	r0, #251	@ 0xfb
c0de0a16:	e000      	b.n	c0de0a1a <transaction_deserialize+0xba>
c0de0a18:	20fa      	movs	r0, #250	@ 0xfa
c0de0a1a:	b240      	sxtb	r0, r0
c0de0a1c:	bd70      	pop	{r4, r5, r6, pc}

c0de0a1e <transaction_utils_check_encoding>:
c0de0a1e:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de0a20:	461c      	mov	r4, r3
c0de0a22:	4615      	mov	r5, r2
c0de0a24:	4606      	mov	r6, r0
c0de0a26:	b910      	cbnz	r0, c0de0a2e <transaction_utils_check_encoding+0x10>
c0de0a28:	2001      	movs	r0, #1
c0de0a2a:	f00a ffa1 	bl	c0deb970 <assert_exit>
c0de0a2e:	2000      	movs	r0, #0
c0de0a30:	2300      	movs	r3, #0
c0de0a32:	4602      	mov	r2, r0
c0de0a34:	1b40      	subs	r0, r0, r5
c0de0a36:	4619      	mov	r1, r3
c0de0a38:	eb73 0004 	sbcs.w	r0, r3, r4
c0de0a3c:	d206      	bcs.n	c0de0a4c <transaction_utils_check_encoding+0x2e>
c0de0a3e:	56b7      	ldrsb	r7, [r6, r2]
c0de0a40:	1c50      	adds	r0, r2, #1
c0de0a42:	f141 0300 	adc.w	r3, r1, #0
c0de0a46:	f1b7 3fff 	cmp.w	r7, #4294967295	@ 0xffffffff
c0de0a4a:	dcf2      	bgt.n	c0de0a32 <transaction_utils_check_encoding+0x14>
c0de0a4c:	2000      	movs	r0, #0
c0de0a4e:	1b52      	subs	r2, r2, r5
c0de0a50:	41a1      	sbcs	r1, r4
c0de0a52:	bf28      	it	cs
c0de0a54:	2001      	movcs	r0, #1
c0de0a56:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0de0a58 <validate_pubkey>:
c0de0a58:	b108      	cbz	r0, c0de0a5e <validate_pubkey+0x6>
c0de0a5a:	f7ff bf31 	b.w	c0de08c0 <helper_send_response_pubkey>
c0de0a5e:	f646 1085 	movw	r0, #27013	@ 0x6985
c0de0a62:	f000 b800 	b.w	c0de0a66 <io_send_sw>

c0de0a66 <io_send_sw>:
c0de0a66:	b580      	push	{r7, lr}
c0de0a68:	4602      	mov	r2, r0
c0de0a6a:	2000      	movs	r0, #0
c0de0a6c:	2100      	movs	r1, #0
c0de0a6e:	f00a fd8d 	bl	c0deb58c <io_send_response_buffers>
c0de0a72:	bd80      	pop	{r7, pc}

c0de0a74 <validate_transaction>:
c0de0a74:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de0a78:	b08c      	sub	sp, #48	@ 0x30
c0de0a7a:	b378      	cbz	r0, c0de0adc <validate_transaction+0x68>
c0de0a7c:	f8df 8094 	ldr.w	r8, [pc, #148]	@ c0de0b14 <validate_transaction+0xa0>
c0de0a80:	2002      	movs	r0, #2
c0de0a82:	2500      	movs	r5, #0
c0de0a84:	2720      	movs	r7, #32
c0de0a86:	2203      	movs	r2, #3
c0de0a88:	f240 6401 	movw	r4, #1537	@ 0x601
c0de0a8c:	f10d 0c2c 	add.w	ip, sp, #44	@ 0x2c
c0de0a90:	f10d 0e28 	add.w	lr, sp, #40	@ 0x28
c0de0a94:	950b      	str	r5, [sp, #44]	@ 0x2c
c0de0a96:	f809 0008 	strb.w	r0, [r9, r8]
c0de0a9a:	2048      	movs	r0, #72	@ 0x48
c0de0a9c:	900a      	str	r0, [sp, #40]	@ 0x28
c0de0a9e:	eb09 0008 	add.w	r0, r9, r8
c0de0aa2:	f890 32d4 	ldrb.w	r3, [r0, #724]	@ 0x2d4
c0de0aa6:	f500 710e 	add.w	r1, r0, #568	@ 0x238
c0de0aaa:	f500 7616 	add.w	r6, r0, #600	@ 0x258
c0de0aae:	e9cd 4200 	strd	r4, r2, [sp]
c0de0ab2:	f500 722b 	add.w	r2, r0, #684	@ 0x2ac
c0de0ab6:	2000      	movs	r0, #0
c0de0ab8:	9508      	str	r5, [sp, #32]
c0de0aba:	e9cd c506 	strd	ip, r5, [sp, #24]
c0de0abe:	e9cd 1702 	strd	r1, r7, [sp, #8]
c0de0ac2:	2121      	movs	r1, #33	@ 0x21
c0de0ac4:	e9cd 6e04 	strd	r6, lr, [sp, #16]
c0de0ac8:	f00a fc54 	bl	c0deb374 <bip32_derive_with_seed_ecdsa_sign_hash_256>
c0de0acc:	b188      	cbz	r0, c0de0af2 <validate_transaction+0x7e>
c0de0ace:	f24b 0008 	movw	r0, #45064	@ 0xb008
c0de0ad2:	f809 5008 	strb.w	r5, [r9, r8]
c0de0ad6:	f7ff ffc6 	bl	c0de0a66 <io_send_sw>
c0de0ada:	e017      	b.n	c0de0b0c <validate_transaction+0x98>
c0de0adc:	480d      	ldr	r0, [pc, #52]	@ (c0de0b14 <validate_transaction+0xa0>)
c0de0ade:	2100      	movs	r1, #0
c0de0ae0:	f809 1000 	strb.w	r1, [r9, r0]
c0de0ae4:	f646 1085 	movw	r0, #27013	@ 0x6985
c0de0ae8:	b00c      	add	sp, #48	@ 0x30
c0de0aea:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de0aee:	f7ff bfba 	b.w	c0de0a66 <io_send_sw>
c0de0af2:	990a      	ldr	r1, [sp, #40]	@ 0x28
c0de0af4:	eb09 0008 	add.w	r0, r9, r8
c0de0af8:	f880 12a0 	strb.w	r1, [r0, #672]	@ 0x2a0
c0de0afc:	f89d 102c 	ldrb.w	r1, [sp, #44]	@ 0x2c
c0de0b00:	f001 0101 	and.w	r1, r1, #1
c0de0b04:	f880 12a1 	strb.w	r1, [r0, #673]	@ 0x2a1
c0de0b08:	f7ff ff08 	bl	c0de091c <helper_send_response_sig>
c0de0b0c:	b00c      	add	sp, #48	@ 0x30
c0de0b0e:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de0b12:	bf00      	nop
c0de0b14:	00000000 	.word	0x00000000

c0de0b18 <app_quit>:
c0de0b18:	20ff      	movs	r0, #255	@ 0xff
c0de0b1a:	f00b f9f7 	bl	c0debf0c <os_sched_exit>
	...

c0de0b20 <ui_menu_main>:
c0de0b20:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
c0de0b22:	4c1b      	ldr	r4, [pc, #108]	@ (c0de0b90 <ui_menu_main+0x70>)
c0de0b24:	4819      	ldr	r0, [pc, #100]	@ (c0de0b8c <ui_menu_main+0x6c>)
c0de0b26:	447c      	add	r4, pc
c0de0b28:	eb09 0500 	add.w	r5, r9, r0
c0de0b2c:	f000 f8dc 	bl	c0de0ce8 <OUTLINED_FUNCTION_0>
c0de0b30:	2609      	movs	r6, #9
c0de0b32:	2114      	movs	r1, #20
c0de0b34:	73ae      	strb	r6, [r5, #14]
c0de0b36:	7369      	strb	r1, [r5, #13]
c0de0b38:	4916      	ldr	r1, [pc, #88]	@ (c0de0b94 <ui_menu_main+0x74>)
c0de0b3a:	4a17      	ldr	r2, [pc, #92]	@ (c0de0b98 <ui_menu_main+0x78>)
c0de0b3c:	4479      	add	r1, pc
c0de0b3e:	447a      	add	r2, pc
c0de0b40:	e9c5 2101 	strd	r2, r1, [r5, #4]
c0de0b44:	7800      	ldrb	r0, [r0, #0]
c0de0b46:	7328      	strb	r0, [r5, #12]
c0de0b48:	f000 f8ce 	bl	c0de0ce8 <OUTLINED_FUNCTION_0>
c0de0b4c:	2115      	movs	r1, #21
c0de0b4e:	76ae      	strb	r6, [r5, #26]
c0de0b50:	7669      	strb	r1, [r5, #25]
c0de0b52:	4912      	ldr	r1, [pc, #72]	@ (c0de0b9c <ui_menu_main+0x7c>)
c0de0b54:	4a12      	ldr	r2, [pc, #72]	@ (c0de0ba0 <ui_menu_main+0x80>)
c0de0b56:	4479      	add	r1, pc
c0de0b58:	447a      	add	r2, pc
c0de0b5a:	e9c5 2104 	strd	r2, r1, [r5, #16]
c0de0b5e:	2100      	movs	r1, #0
c0de0b60:	7840      	ldrb	r0, [r0, #1]
c0de0b62:	7628      	strb	r0, [r5, #24]
c0de0b64:	480f      	ldr	r0, [pc, #60]	@ (c0de0ba4 <ui_menu_main+0x84>)
c0de0b66:	4a10      	ldr	r2, [pc, #64]	@ (c0de0ba8 <ui_menu_main+0x88>)
c0de0b68:	4b10      	ldr	r3, [pc, #64]	@ (c0de0bac <ui_menu_main+0x8c>)
c0de0b6a:	4478      	add	r0, pc
c0de0b6c:	447a      	add	r2, pc
c0de0b6e:	447b      	add	r3, pc
c0de0b70:	e9cd 3200 	strd	r3, r2, [sp]
c0de0b74:	e9cd 1002 	strd	r1, r0, [sp, #8]
c0de0b78:	2200      	movs	r2, #0
c0de0b7a:	23ff      	movs	r3, #255	@ 0xff
c0de0b7c:	480c      	ldr	r0, [pc, #48]	@ (c0de0bb0 <ui_menu_main+0x90>)
c0de0b7e:	490d      	ldr	r1, [pc, #52]	@ (c0de0bb4 <ui_menu_main+0x94>)
c0de0b80:	4478      	add	r0, pc
c0de0b82:	4479      	add	r1, pc
c0de0b84:	f008 fb16 	bl	c0de91b4 <nbgl_useCaseHomeAndSettings>
c0de0b88:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}
c0de0b8a:	bf00      	nop
c0de0b8c:	000013f0 	.word	0x000013f0
c0de0b90:	0000eed6 	.word	0x0000eed6
c0de0b94:	0000cf95 	.word	0x0000cf95
c0de0b98:	0000d463 	.word	0x0000d463
c0de0b9c:	0000d10c 	.word	0x0000d10c
c0de0ba0:	0000cc99 	.word	0x0000cc99
c0de0ba4:	ffffffab 	.word	0xffffffab
c0de0ba8:	0000e54c 	.word	0x0000e54c
c0de0bac:	0000e53e 	.word	0x0000e53e
c0de0bb0:	0000d2c2 	.word	0x0000d2c2
c0de0bb4:	0000b9ed 	.word	0x0000b9ed

c0de0bb8 <controls_callback>:
c0de0bb8:	b5bf      	push	{r0, r1, r2, r3, r4, r5, r7, lr}
c0de0bba:	4c22      	ldr	r4, [pc, #136]	@ (c0de0c44 <controls_callback+0x8c>)
c0de0bbc:	2815      	cmp	r0, #21
c0de0bbe:	f809 2004 	strb.w	r2, [r9, r4]
c0de0bc2:	d011      	beq.n	c0de0be8 <controls_callback+0x30>
c0de0bc4:	2814      	cmp	r0, #20
c0de0bc6:	d12a      	bne.n	c0de0c1e <controls_callback+0x66>
c0de0bc8:	eb09 0504 	add.w	r5, r9, r4
c0de0bcc:	4c1e      	ldr	r4, [pc, #120]	@ (c0de0c48 <controls_callback+0x90>)
c0de0bce:	447c      	add	r4, pc
c0de0bd0:	f000 f88a 	bl	c0de0ce8 <OUTLINED_FUNCTION_0>
c0de0bd4:	7800      	ldrb	r0, [r0, #0]
c0de0bd6:	fab0 f080 	clz	r0, r0
c0de0bda:	0940      	lsrs	r0, r0, #5
c0de0bdc:	7328      	strb	r0, [r5, #12]
c0de0bde:	f88d 000f 	strb.w	r0, [sp, #15]
c0de0be2:	f000 f881 	bl	c0de0ce8 <OUTLINED_FUNCTION_0>
c0de0be6:	e015      	b.n	c0de0c14 <controls_callback+0x5c>
c0de0be8:	4818      	ldr	r0, [pc, #96]	@ (c0de0c4c <controls_callback+0x94>)
c0de0bea:	4478      	add	r0, pc
c0de0bec:	f00b f8e0 	bl	c0debdb0 <pic>
c0de0bf0:	7840      	ldrb	r0, [r0, #1]
c0de0bf2:	b1a8      	cbz	r0, c0de0c20 <controls_callback+0x68>
c0de0bf4:	eb09 0504 	add.w	r5, r9, r4
c0de0bf8:	4c15      	ldr	r4, [pc, #84]	@ (c0de0c50 <controls_callback+0x98>)
c0de0bfa:	447c      	add	r4, pc
c0de0bfc:	f000 f874 	bl	c0de0ce8 <OUTLINED_FUNCTION_0>
c0de0c00:	7840      	ldrb	r0, [r0, #1]
c0de0c02:	fab0 f080 	clz	r0, r0
c0de0c06:	0940      	lsrs	r0, r0, #5
c0de0c08:	7628      	strb	r0, [r5, #24]
c0de0c0a:	f88d 000f 	strb.w	r0, [sp, #15]
c0de0c0e:	f000 f86b 	bl	c0de0ce8 <OUTLINED_FUNCTION_0>
c0de0c12:	3001      	adds	r0, #1
c0de0c14:	f10d 010f 	add.w	r1, sp, #15
c0de0c18:	2201      	movs	r2, #1
c0de0c1a:	f00b f903 	bl	c0debe24 <nvm_write>
c0de0c1e:	bdbf      	pop	{r0, r1, r2, r3, r4, r5, r7, pc}
c0de0c20:	480c      	ldr	r0, [pc, #48]	@ (c0de0c54 <controls_callback+0x9c>)
c0de0c22:	490d      	ldr	r1, [pc, #52]	@ (c0de0c58 <controls_callback+0xa0>)
c0de0c24:	4478      	add	r0, pc
c0de0c26:	4479      	add	r1, pc
c0de0c28:	e9cd 1000 	strd	r1, r0, [sp]
c0de0c2c:	480b      	ldr	r0, [pc, #44]	@ (c0de0c5c <controls_callback+0xa4>)
c0de0c2e:	490c      	ldr	r1, [pc, #48]	@ (c0de0c60 <controls_callback+0xa8>)
c0de0c30:	4a0c      	ldr	r2, [pc, #48]	@ (c0de0c64 <controls_callback+0xac>)
c0de0c32:	4b0d      	ldr	r3, [pc, #52]	@ (c0de0c68 <controls_callback+0xb0>)
c0de0c34:	4478      	add	r0, pc
c0de0c36:	4479      	add	r1, pc
c0de0c38:	447a      	add	r2, pc
c0de0c3a:	447b      	add	r3, pc
c0de0c3c:	f008 fd96 	bl	c0de976c <nbgl_useCaseChoice>
c0de0c40:	bdbf      	pop	{r0, r1, r2, r3, r4, r5, r7, pc}
c0de0c42:	bf00      	nop
c0de0c44:	000013f0 	.word	0x000013f0
c0de0c48:	0000ee2e 	.word	0x0000ee2e
c0de0c4c:	0000ee12 	.word	0x0000ee12
c0de0c50:	0000ee02 	.word	0x0000ee02
c0de0c54:	00000045 	.word	0x00000045
c0de0c58:	0000d09b 	.word	0x0000d09b
c0de0c5c:	0000c275 	.word	0x0000c275
c0de0c60:	0000cbbb 	.word	0x0000cbbb
c0de0c64:	0000ce0a 	.word	0x0000ce0a
c0de0c68:	0000d36f 	.word	0x0000d36f

c0de0c6c <review_warning_choice>:
c0de0c6c:	b5b0      	push	{r4, r5, r7, lr}
c0de0c6e:	b086      	sub	sp, #24
c0de0c70:	b1a8      	cbz	r0, c0de0c9e <review_warning_choice+0x32>
c0de0c72:	4c17      	ldr	r4, [pc, #92]	@ (c0de0cd0 <review_warning_choice+0x64>)
c0de0c74:	4815      	ldr	r0, [pc, #84]	@ (c0de0ccc <review_warning_choice+0x60>)
c0de0c76:	447c      	add	r4, pc
c0de0c78:	eb09 0500 	add.w	r5, r9, r0
c0de0c7c:	f000 f834 	bl	c0de0ce8 <OUTLINED_FUNCTION_0>
c0de0c80:	7840      	ldrb	r0, [r0, #1]
c0de0c82:	fab0 f080 	clz	r0, r0
c0de0c86:	0940      	lsrs	r0, r0, #5
c0de0c88:	7628      	strb	r0, [r5, #24]
c0de0c8a:	f88d 0017 	strb.w	r0, [sp, #23]
c0de0c8e:	f000 f82b 	bl	c0de0ce8 <OUTLINED_FUNCTION_0>
c0de0c92:	3001      	adds	r0, #1
c0de0c94:	f10d 0117 	add.w	r1, sp, #23
c0de0c98:	2201      	movs	r2, #1
c0de0c9a:	f00b f8c3 	bl	c0debe24 <nvm_write>
c0de0c9e:	480b      	ldr	r0, [pc, #44]	@ (c0de0ccc <review_warning_choice+0x60>)
c0de0ca0:	2100      	movs	r1, #0
c0de0ca2:	f819 3000 	ldrb.w	r3, [r9, r0]
c0de0ca6:	480b      	ldr	r0, [pc, #44]	@ (c0de0cd4 <review_warning_choice+0x68>)
c0de0ca8:	4a0b      	ldr	r2, [pc, #44]	@ (c0de0cd8 <review_warning_choice+0x6c>)
c0de0caa:	4c0c      	ldr	r4, [pc, #48]	@ (c0de0cdc <review_warning_choice+0x70>)
c0de0cac:	4478      	add	r0, pc
c0de0cae:	447a      	add	r2, pc
c0de0cb0:	447c      	add	r4, pc
c0de0cb2:	e9cd 4200 	strd	r4, r2, [sp]
c0de0cb6:	e9cd 1002 	strd	r1, r0, [sp, #8]
c0de0cba:	2200      	movs	r2, #0
c0de0cbc:	4808      	ldr	r0, [pc, #32]	@ (c0de0ce0 <review_warning_choice+0x74>)
c0de0cbe:	4909      	ldr	r1, [pc, #36]	@ (c0de0ce4 <review_warning_choice+0x78>)
c0de0cc0:	4478      	add	r0, pc
c0de0cc2:	4479      	add	r1, pc
c0de0cc4:	f008 fa76 	bl	c0de91b4 <nbgl_useCaseHomeAndSettings>
c0de0cc8:	b006      	add	sp, #24
c0de0cca:	bdb0      	pop	{r4, r5, r7, pc}
c0de0ccc:	000013f0 	.word	0x000013f0
c0de0cd0:	0000ed86 	.word	0x0000ed86
c0de0cd4:	fffffe69 	.word	0xfffffe69
c0de0cd8:	0000e40a 	.word	0x0000e40a
c0de0cdc:	0000e3fc 	.word	0x0000e3fc
c0de0ce0:	0000d182 	.word	0x0000d182
c0de0ce4:	0000b8ad 	.word	0x0000b8ad

c0de0ce8 <OUTLINED_FUNCTION_0>:
c0de0ce8:	4620      	mov	r0, r4
c0de0cea:	f00b b861 	b.w	c0debdb0 <pic>
	...

c0de0cf0 <ui_display_address>:
c0de0cf0:	b570      	push	{r4, r5, r6, lr}
c0de0cf2:	b088      	sub	sp, #32
c0de0cf4:	4e22      	ldr	r6, [pc, #136]	@ (c0de0d80 <ui_display_address+0x90>)
c0de0cf6:	eb09 0106 	add.w	r1, r9, r6
c0de0cfa:	f819 0006 	ldrb.w	r0, [r9, r6]
c0de0cfe:	f891 12a8 	ldrb.w	r1, [r1, #680]	@ 0x2a8
c0de0d02:	4308      	orrs	r0, r1
c0de0d04:	d12a      	bne.n	c0de0d5c <ui_display_address+0x6c>
c0de0d06:	4d1f      	ldr	r5, [pc, #124]	@ (c0de0d84 <ui_display_address+0x94>)
c0de0d08:	212b      	movs	r1, #43	@ 0x2b
c0de0d0a:	eb09 0005 	add.w	r0, r9, r5
c0de0d0e:	f00b fa71 	bl	c0dec1f4 <__aeabi_memclr>
c0de0d12:	ac03      	add	r4, sp, #12
c0de0d14:	2114      	movs	r1, #20
c0de0d16:	4620      	mov	r0, r4
c0de0d18:	f00b fa6c 	bl	c0dec1f4 <__aeabi_memclr>
c0de0d1c:	eb09 0006 	add.w	r0, r9, r6
c0de0d20:	4621      	mov	r1, r4
c0de0d22:	2214      	movs	r2, #20
c0de0d24:	3008      	adds	r0, #8
c0de0d26:	f7ff f975 	bl	c0de0014 <address_from_pubkey>
c0de0d2a:	b308      	cbz	r0, c0de0d70 <ui_display_address+0x80>
c0de0d2c:	eb09 0205 	add.w	r2, r9, r5
c0de0d30:	a803      	add	r0, sp, #12
c0de0d32:	2114      	movs	r1, #20
c0de0d34:	232b      	movs	r3, #43	@ 0x2b
c0de0d36:	f00a fbc7 	bl	c0deb4c8 <format_hex>
c0de0d3a:	3001      	adds	r0, #1
c0de0d3c:	d018      	beq.n	c0de0d70 <ui_display_address+0x80>
c0de0d3e:	4812      	ldr	r0, [pc, #72]	@ (c0de0d88 <ui_display_address+0x98>)
c0de0d40:	2400      	movs	r4, #0
c0de0d42:	2100      	movs	r1, #0
c0de0d44:	4478      	add	r0, pc
c0de0d46:	e9cd 4000 	strd	r4, r0, [sp]
c0de0d4a:	eb09 0005 	add.w	r0, r9, r5
c0de0d4e:	4a0f      	ldr	r2, [pc, #60]	@ (c0de0d8c <ui_display_address+0x9c>)
c0de0d50:	4b0f      	ldr	r3, [pc, #60]	@ (c0de0d90 <ui_display_address+0xa0>)
c0de0d52:	447a      	add	r2, pc
c0de0d54:	447b      	add	r3, pc
c0de0d56:	f009 fa7f 	bl	c0dea258 <nbgl_useCaseAddressReview>
c0de0d5a:	e00e      	b.n	c0de0d7a <ui_display_address+0x8a>
c0de0d5c:	2000      	movs	r0, #0
c0de0d5e:	f809 0006 	strb.w	r0, [r9, r6]
c0de0d62:	f24b 0007 	movw	r0, #45063	@ 0xb007
c0de0d66:	b008      	add	sp, #32
c0de0d68:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de0d6c:	f000 b812 	b.w	c0de0d94 <io_send_sw>
c0de0d70:	f24b 0002 	movw	r0, #45058	@ 0xb002
c0de0d74:	f000 f80e 	bl	c0de0d94 <io_send_sw>
c0de0d78:	4604      	mov	r4, r0
c0de0d7a:	4620      	mov	r0, r4
c0de0d7c:	b008      	add	sp, #32
c0de0d7e:	bd70      	pop	{r4, r5, r6, pc}
c0de0d80:	00000000 	.word	0x00000000
c0de0d84:	0000140c 	.word	0x0000140c
c0de0d88:	0000005d 	.word	0x0000005d
c0de0d8c:	0000b81d 	.word	0x0000b81d
c0de0d90:	0000d34f 	.word	0x0000d34f

c0de0d94 <io_send_sw>:
c0de0d94:	b580      	push	{r7, lr}
c0de0d96:	4602      	mov	r2, r0
c0de0d98:	2000      	movs	r0, #0
c0de0d9a:	2100      	movs	r1, #0
c0de0d9c:	f00a fbf6 	bl	c0deb58c <io_send_response_buffers>
c0de0da0:	bd80      	pop	{r7, pc}
	...

c0de0da4 <review_choice>:
c0de0da4:	b510      	push	{r4, lr}
c0de0da6:	4604      	mov	r4, r0
c0de0da8:	f7ff fe56 	bl	c0de0a58 <validate_pubkey>
c0de0dac:	2007      	movs	r0, #7
c0de0dae:	2c00      	cmp	r4, #0
c0de0db0:	bf18      	it	ne
c0de0db2:	2006      	movne	r0, #6
c0de0db4:	4902      	ldr	r1, [pc, #8]	@ (c0de0dc0 <review_choice+0x1c>)
c0de0db6:	4479      	add	r1, pc
c0de0db8:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de0dbc:	f008 bc8c 	b.w	c0de96d8 <nbgl_useCaseReviewStatus>
c0de0dc0:	fffffd67 	.word	0xfffffd67

c0de0dc4 <ui_display_transaction_bs_choice>:
c0de0dc4:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de0dc6:	b08d      	sub	sp, #52	@ 0x34
c0de0dc8:	4f44      	ldr	r7, [pc, #272]	@ (c0de0edc <ui_display_transaction_bs_choice+0x118>)
c0de0dca:	4604      	mov	r4, r0
c0de0dcc:	eb09 0007 	add.w	r0, r9, r7
c0de0dd0:	f890 02a8 	ldrb.w	r0, [r0, #680]	@ 0x2a8
c0de0dd4:	2801      	cmp	r0, #1
c0de0dd6:	d15f      	bne.n	c0de0e98 <ui_display_transaction_bs_choice+0xd4>
c0de0dd8:	f819 0007 	ldrb.w	r0, [r9, r7]
c0de0ddc:	2801      	cmp	r0, #1
c0de0dde:	d15b      	bne.n	c0de0e98 <ui_display_transaction_bs_choice+0xd4>
c0de0de0:	4e3f      	ldr	r6, [pc, #252]	@ (c0de0ee0 <ui_display_transaction_bs_choice+0x11c>)
c0de0de2:	211e      	movs	r1, #30
c0de0de4:	eb09 0006 	add.w	r0, r9, r6
c0de0de8:	3014      	adds	r0, #20
c0de0dea:	f00b fa03 	bl	c0dec1f4 <__aeabi_memclr>
c0de0dee:	ad05      	add	r5, sp, #20
c0de0df0:	211e      	movs	r1, #30
c0de0df2:	4628      	mov	r0, r5
c0de0df4:	f00b f9fe 	bl	c0dec1f4 <__aeabi_memclr>
c0de0df8:	eb09 0007 	add.w	r0, r9, r7
c0de0dfc:	211e      	movs	r1, #30
c0de0dfe:	e9d0 2386 	ldrd	r2, r3, [r0, #536]	@ 0x218
c0de0e02:	2003      	movs	r0, #3
c0de0e04:	9000      	str	r0, [sp, #0]
c0de0e06:	4628      	mov	r0, r5
c0de0e08:	f00a fb17 	bl	c0deb43a <format_fpu64>
c0de0e0c:	2800      	cmp	r0, #0
c0de0e0e:	d04d      	beq.n	c0de0eac <ui_display_transaction_bs_choice+0xe8>
c0de0e10:	9500      	str	r5, [sp, #0]
c0de0e12:	eb09 0506 	add.w	r5, r9, r6
c0de0e16:	211e      	movs	r1, #30
c0de0e18:	231e      	movs	r3, #30
c0de0e1a:	4a32      	ldr	r2, [pc, #200]	@ (c0de0ee4 <ui_display_transaction_bs_choice+0x120>)
c0de0e1c:	f105 0014 	add.w	r0, r5, #20
c0de0e20:	447a      	add	r2, pc
c0de0e22:	f00a fe33 	bl	c0deba8c <snprintf>
c0de0e26:	3554      	adds	r5, #84	@ 0x54
c0de0e28:	212b      	movs	r1, #43	@ 0x2b
c0de0e2a:	4628      	mov	r0, r5
c0de0e2c:	f00b f9e2 	bl	c0dec1f4 <__aeabi_memclr>
c0de0e30:	eb09 0007 	add.w	r0, r9, r7
c0de0e34:	2114      	movs	r1, #20
c0de0e36:	462a      	mov	r2, r5
c0de0e38:	232b      	movs	r3, #43	@ 0x2b
c0de0e3a:	f8d0 0228 	ldr.w	r0, [r0, #552]	@ 0x228
c0de0e3e:	f00a fb43 	bl	c0deb4c8 <format_hex>
c0de0e42:	3001      	adds	r0, #1
c0de0e44:	d035      	beq.n	c0de0eb2 <ui_display_transaction_bs_choice+0xee>
c0de0e46:	4928      	ldr	r1, [pc, #160]	@ (c0de0ee8 <ui_display_transaction_bs_choice+0x124>)
c0de0e48:	eb09 0006 	add.w	r0, r9, r6
c0de0e4c:	2500      	movs	r5, #0
c0de0e4e:	4602      	mov	r2, r0
c0de0e50:	4479      	add	r1, pc
c0de0e52:	f842 1f34 	str.w	r1, [r2, #52]!
c0de0e56:	f849 2006 	str.w	r2, [r9, r6]
c0de0e5a:	2202      	movs	r2, #2
c0de0e5c:	4923      	ldr	r1, [pc, #140]	@ (c0de0eec <ui_display_transaction_bs_choice+0x128>)
c0de0e5e:	7202      	strb	r2, [r0, #8]
c0de0e60:	f100 0254 	add.w	r2, r0, #84	@ 0x54
c0de0e64:	72c5      	strb	r5, [r0, #11]
c0de0e66:	4479      	add	r1, pc
c0de0e68:	e9c0 1211 	strd	r1, r2, [r0, #68]	@ 0x44
c0de0e6c:	f100 0114 	add.w	r1, r0, #20
c0de0e70:	6381      	str	r1, [r0, #56]	@ 0x38
c0de0e72:	481f      	ldr	r0, [pc, #124]	@ (c0de0ef0 <ui_display_transaction_bs_choice+0x12c>)
c0de0e74:	491f      	ldr	r1, [pc, #124]	@ (c0de0ef4 <ui_display_transaction_bs_choice+0x130>)
c0de0e76:	4478      	add	r0, pc
c0de0e78:	4479      	add	r1, pc
c0de0e7a:	b314      	cbz	r4, c0de0ec2 <ui_display_transaction_bs_choice+0xfe>
c0de0e7c:	e9cd 5100 	strd	r5, r1, [sp]
c0de0e80:	e9cd 5002 	strd	r5, r0, [sp, #8]
c0de0e84:	eb09 0106 	add.w	r1, r9, r6
c0de0e88:	2000      	movs	r0, #0
c0de0e8a:	4a1b      	ldr	r2, [pc, #108]	@ (c0de0ef8 <ui_display_transaction_bs_choice+0x134>)
c0de0e8c:	4b1b      	ldr	r3, [pc, #108]	@ (c0de0efc <ui_display_transaction_bs_choice+0x138>)
c0de0e8e:	447a      	add	r2, pc
c0de0e90:	447b      	add	r3, pc
c0de0e92:	f008 fedb 	bl	c0de9c4c <nbgl_useCaseReviewBlindSigning>
c0de0e96:	e011      	b.n	c0de0ebc <ui_display_transaction_bs_choice+0xf8>
c0de0e98:	2000      	movs	r0, #0
c0de0e9a:	f809 0007 	strb.w	r0, [r9, r7]
c0de0e9e:	f24b 0007 	movw	r0, #45063	@ 0xb007
c0de0ea2:	b00d      	add	sp, #52	@ 0x34
c0de0ea4:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de0ea8:	f000 b82e 	b.w	c0de0f08 <io_send_sw>
c0de0eac:	f24b 0003 	movw	r0, #45059	@ 0xb003
c0de0eb0:	e001      	b.n	c0de0eb6 <ui_display_transaction_bs_choice+0xf2>
c0de0eb2:	f24b 0002 	movw	r0, #45058	@ 0xb002
c0de0eb6:	f000 f827 	bl	c0de0f08 <io_send_sw>
c0de0eba:	4605      	mov	r5, r0
c0de0ebc:	4628      	mov	r0, r5
c0de0ebe:	b00d      	add	sp, #52	@ 0x34
c0de0ec0:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de0ec2:	e9cd 5100 	strd	r5, r1, [sp]
c0de0ec6:	9002      	str	r0, [sp, #8]
c0de0ec8:	eb09 0106 	add.w	r1, r9, r6
c0de0ecc:	2000      	movs	r0, #0
c0de0ece:	4a0c      	ldr	r2, [pc, #48]	@ (c0de0f00 <ui_display_transaction_bs_choice+0x13c>)
c0de0ed0:	4b0c      	ldr	r3, [pc, #48]	@ (c0de0f04 <ui_display_transaction_bs_choice+0x140>)
c0de0ed2:	447a      	add	r2, pc
c0de0ed4:	447b      	add	r3, pc
c0de0ed6:	f008 fe09 	bl	c0de9aec <nbgl_useCaseReview>
c0de0eda:	e7ef      	b.n	c0de0ebc <ui_display_transaction_bs_choice+0xf8>
c0de0edc:	00000000 	.word	0x00000000
c0de0ee0:	00001438 	.word	0x00001438
c0de0ee4:	0000d0e4 	.word	0x0000d0e4
c0de0ee8:	0000cb68 	.word	0x0000cb68
c0de0eec:	0000d0a7 	.word	0x0000d0a7
c0de0ef0:	0000009f 	.word	0x0000009f
c0de0ef4:	0000cc77 	.word	0x0000cc77
c0de0ef8:	0000b6e1 	.word	0x0000b6e1
c0de0efc:	0000c969 	.word	0x0000c969
c0de0f00:	0000b69d 	.word	0x0000b69d
c0de0f04:	0000c925 	.word	0x0000c925

c0de0f08 <io_send_sw>:
c0de0f08:	b580      	push	{r7, lr}
c0de0f0a:	4602      	mov	r2, r0
c0de0f0c:	2000      	movs	r0, #0
c0de0f0e:	2100      	movs	r1, #0
c0de0f10:	f00a fb3c 	bl	c0deb58c <io_send_response_buffers>
c0de0f14:	bd80      	pop	{r7, pc}
	...

c0de0f18 <review_choice>:
c0de0f18:	b510      	push	{r4, lr}
c0de0f1a:	4604      	mov	r4, r0
c0de0f1c:	f7ff fdaa 	bl	c0de0a74 <validate_transaction>
c0de0f20:	4903      	ldr	r1, [pc, #12]	@ (c0de0f30 <review_choice+0x18>)
c0de0f22:	f084 0001 	eor.w	r0, r4, #1
c0de0f26:	4479      	add	r1, pc
c0de0f28:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de0f2c:	f008 bbd4 	b.w	c0de96d8 <nbgl_useCaseReviewStatus>
c0de0f30:	fffffbf7 	.word	0xfffffbf7

c0de0f34 <ui_display_blind_signed_transaction>:
c0de0f34:	2001      	movs	r0, #1
c0de0f36:	f7ff bf45 	b.w	c0de0dc4 <ui_display_transaction_bs_choice>

c0de0f3a <ui_display_transaction>:
c0de0f3a:	2000      	movs	r0, #0
c0de0f3c:	f7ff bf42 	b.w	c0de0dc4 <ui_display_transaction_bs_choice>

c0de0f40 <pqcrystals_dilithium_fips202_ref_shake128_init>:
c0de0f40:	b510      	push	{r4, lr}
c0de0f42:	4604      	mov	r4, r0
c0de0f44:	f000 f804 	bl	c0de0f50 <keccak_init>
c0de0f48:	2000      	movs	r0, #0
c0de0f4a:	f8c4 00c8 	str.w	r0, [r4, #200]	@ 0xc8
c0de0f4e:	bd10      	pop	{r4, pc}

c0de0f50 <keccak_init>:
c0de0f50:	2100      	movs	r1, #0
c0de0f52:	2200      	movs	r2, #0
c0de0f54:	2ac8      	cmp	r2, #200	@ 0xc8
c0de0f56:	bf08      	it	eq
c0de0f58:	4770      	bxeq	lr
c0de0f5a:	1883      	adds	r3, r0, r2
c0de0f5c:	5081      	str	r1, [r0, r2]
c0de0f5e:	3208      	adds	r2, #8
c0de0f60:	6059      	str	r1, [r3, #4]
c0de0f62:	e7f7      	b.n	c0de0f54 <keccak_init+0x4>

c0de0f64 <pqcrystals_dilithium_fips202_ref_shake128_absorb>:
c0de0f64:	b51c      	push	{r2, r3, r4, lr}
c0de0f66:	460b      	mov	r3, r1
c0de0f68:	f8d0 10c8 	ldr.w	r1, [r0, #200]	@ 0xc8
c0de0f6c:	9200      	str	r2, [sp, #0]
c0de0f6e:	22a8      	movs	r2, #168	@ 0xa8
c0de0f70:	4604      	mov	r4, r0
c0de0f72:	f000 f802 	bl	c0de0f7a <keccak_absorb>
c0de0f76:	f001 b8f3 	b.w	c0de2160 <OUTLINED_FUNCTION_3>

c0de0f7a <keccak_absorb>:
c0de0f7a:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de0f7e:	f8dd 8020 	ldr.w	r8, [sp, #32]
c0de0f82:	461c      	mov	r4, r3
c0de0f84:	4693      	mov	fp, r2
c0de0f86:	468a      	mov	sl, r1
c0de0f88:	4606      	mov	r6, r0
c0de0f8a:	eb08 050a 	add.w	r5, r8, sl
c0de0f8e:	455d      	cmp	r5, fp
c0de0f90:	d31b      	bcc.n	c0de0fca <keccak_absorb+0x50>
c0de0f92:	ea4f 05ca 	mov.w	r5, sl, lsl #3
c0de0f96:	4657      	mov	r7, sl
c0de0f98:	455f      	cmp	r7, fp
c0de0f9a:	d20d      	bcs.n	c0de0fb8 <keccak_absorb+0x3e>
c0de0f9c:	f814 0b01 	ldrb.w	r0, [r4], #1
c0de0fa0:	f005 0238 	and.w	r2, r5, #56	@ 0x38
c0de0fa4:	2100      	movs	r1, #0
c0de0fa6:	f00b f813 	bl	c0debfd0 <__aeabi_llsl>
c0de0faa:	f027 0207 	bic.w	r2, r7, #7
c0de0fae:	3508      	adds	r5, #8
c0de0fb0:	3701      	adds	r7, #1
c0de0fb2:	f001 f8c5 	bl	c0de2140 <OUTLINED_FUNCTION_0>
c0de0fb6:	e7ef      	b.n	c0de0f98 <keccak_absorb+0x1e>
c0de0fb8:	4630      	mov	r0, r6
c0de0fba:	f000 f963 	bl	c0de1284 <KeccakF1600_StatePermute>
c0de0fbe:	ebaa 000b 	sub.w	r0, sl, fp
c0de0fc2:	f04f 0a00 	mov.w	sl, #0
c0de0fc6:	4480      	add	r8, r0
c0de0fc8:	e7df      	b.n	c0de0f8a <keccak_absorb+0x10>
c0de0fca:	ea4f 07ca 	mov.w	r7, sl, lsl #3
c0de0fce:	45aa      	cmp	sl, r5
c0de0fd0:	d20e      	bcs.n	c0de0ff0 <keccak_absorb+0x76>
c0de0fd2:	f814 0b01 	ldrb.w	r0, [r4], #1
c0de0fd6:	f007 0238 	and.w	r2, r7, #56	@ 0x38
c0de0fda:	2100      	movs	r1, #0
c0de0fdc:	f00a fff8 	bl	c0debfd0 <__aeabi_llsl>
c0de0fe0:	f02a 0207 	bic.w	r2, sl, #7
c0de0fe4:	3708      	adds	r7, #8
c0de0fe6:	f10a 0a01 	add.w	sl, sl, #1
c0de0fea:	f001 f8a9 	bl	c0de2140 <OUTLINED_FUNCTION_0>
c0de0fee:	e7ee      	b.n	c0de0fce <keccak_absorb+0x54>
c0de0ff0:	4650      	mov	r0, sl
c0de0ff2:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de0ff6 <pqcrystals_dilithium_fips202_ref_shake128_finalize>:
c0de0ff6:	b5b0      	push	{r4, r5, r7, lr}
c0de0ff8:	f8d0 10c8 	ldr.w	r1, [r0, #200]	@ 0xc8
c0de0ffc:	22a8      	movs	r2, #168	@ 0xa8
c0de0ffe:	4604      	mov	r4, r0
c0de1000:	25a8      	movs	r5, #168	@ 0xa8
c0de1002:	f000 f803 	bl	c0de100c <keccak_finalize>
c0de1006:	f8c4 50c8 	str.w	r5, [r4, #200]	@ 0xc8
c0de100a:	bdb0      	pop	{r4, r5, r7, pc}

c0de100c <keccak_finalize>:
c0de100c:	b570      	push	{r4, r5, r6, lr}
c0de100e:	4606      	mov	r6, r0
c0de1010:	2038      	movs	r0, #56	@ 0x38
c0de1012:	4614      	mov	r4, r2
c0de1014:	460d      	mov	r5, r1
c0de1016:	ea00 02c1 	and.w	r2, r0, r1, lsl #3
c0de101a:	201f      	movs	r0, #31
c0de101c:	2100      	movs	r1, #0
c0de101e:	f00a ffd7 	bl	c0debfd0 <__aeabi_llsl>
c0de1022:	f025 0207 	bic.w	r2, r5, #7
c0de1026:	f001 f88b 	bl	c0de2140 <OUTLINED_FUNCTION_0>
c0de102a:	f024 0007 	bic.w	r0, r4, #7
c0de102e:	4430      	add	r0, r6
c0de1030:	f850 1c04 	ldr.w	r1, [r0, #-4]
c0de1034:	f081 4100 	eor.w	r1, r1, #2147483648	@ 0x80000000
c0de1038:	f840 1c04 	str.w	r1, [r0, #-4]
c0de103c:	bd70      	pop	{r4, r5, r6, pc}

c0de103e <pqcrystals_dilithium_fips202_ref_shake128_squeeze>:
c0de103e:	b51c      	push	{r2, r3, r4, lr}
c0de1040:	4614      	mov	r4, r2
c0de1042:	f8d2 30c8 	ldr.w	r3, [r2, #200]	@ 0xc8
c0de1046:	22a8      	movs	r2, #168	@ 0xa8
c0de1048:	9200      	str	r2, [sp, #0]
c0de104a:	4622      	mov	r2, r4
c0de104c:	f000 f802 	bl	c0de1054 <keccak_squeeze>
c0de1050:	f001 b886 	b.w	c0de2160 <OUTLINED_FUNCTION_3>

c0de1054 <keccak_squeeze>:
c0de1054:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1058:	f8dd 8020 	ldr.w	r8, [sp, #32]
c0de105c:	461f      	mov	r7, r3
c0de105e:	4693      	mov	fp, r2
c0de1060:	460d      	mov	r5, r1
c0de1062:	4606      	mov	r6, r0
c0de1064:	b1e5      	cbz	r5, c0de10a0 <keccak_squeeze+0x4c>
c0de1066:	4547      	cmp	r7, r8
c0de1068:	d103      	bne.n	c0de1072 <keccak_squeeze+0x1e>
c0de106a:	4658      	mov	r0, fp
c0de106c:	f000 f90a 	bl	c0de1284 <KeccakF1600_StatePermute>
c0de1070:	2700      	movs	r7, #0
c0de1072:	eb07 0a05 	add.w	sl, r7, r5
c0de1076:	00fc      	lsls	r4, r7, #3
c0de1078:	4547      	cmp	r7, r8
c0de107a:	d2f3      	bcs.n	c0de1064 <keccak_squeeze+0x10>
c0de107c:	45ba      	cmp	sl, r7
c0de107e:	d9f1      	bls.n	c0de1064 <keccak_squeeze+0x10>
c0de1080:	f027 0107 	bic.w	r1, r7, #7
c0de1084:	f004 0238 	and.w	r2, r4, #56	@ 0x38
c0de1088:	f85b 0001 	ldr.w	r0, [fp, r1]
c0de108c:	4459      	add	r1, fp
c0de108e:	6849      	ldr	r1, [r1, #4]
c0de1090:	f00a ffb0 	bl	c0debff4 <__aeabi_llsr>
c0de1094:	f806 0b01 	strb.w	r0, [r6], #1
c0de1098:	3408      	adds	r4, #8
c0de109a:	3d01      	subs	r5, #1
c0de109c:	3701      	adds	r7, #1
c0de109e:	e7eb      	b.n	c0de1078 <keccak_squeeze+0x24>
c0de10a0:	4638      	mov	r0, r7
c0de10a2:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de10a6 <keccak_absorb_once>:
c0de10a6:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de10aa:	4688      	mov	r8, r1
c0de10ac:	4604      	mov	r4, r0
c0de10ae:	461f      	mov	r7, r3
c0de10b0:	2000      	movs	r0, #0
c0de10b2:	2100      	movs	r1, #0
c0de10b4:	9202      	str	r2, [sp, #8]
c0de10b6:	29c8      	cmp	r1, #200	@ 0xc8
c0de10b8:	d004      	beq.n	c0de10c4 <keccak_absorb_once+0x1e>
c0de10ba:	1862      	adds	r2, r4, r1
c0de10bc:	5060      	str	r0, [r4, r1]
c0de10be:	3108      	adds	r1, #8
c0de10c0:	6050      	str	r0, [r2, #4]
c0de10c2:	e7f8      	b.n	c0de10b6 <keccak_absorb_once+0x10>
c0de10c4:	ea4f 00d8 	mov.w	r0, r8, lsr #3
c0de10c8:	f8cd 8000 	str.w	r8, [sp]
c0de10cc:	9003      	str	r0, [sp, #12]
c0de10ce:	4547      	cmp	r7, r8
c0de10d0:	d335      	bcc.n	c0de113e <keccak_absorb_once+0x98>
c0de10d2:	9e02      	ldr	r6, [sp, #8]
c0de10d4:	f04f 0800 	mov.w	r8, #0
c0de10d8:	9701      	str	r7, [sp, #4]
c0de10da:	9803      	ldr	r0, [sp, #12]
c0de10dc:	4580      	cmp	r8, r0
c0de10de:	d023      	beq.n	c0de1128 <keccak_absorb_once+0x82>
c0de10e0:	2500      	movs	r5, #0
c0de10e2:	4637      	mov	r7, r6
c0de10e4:	f04f 0a00 	mov.w	sl, #0
c0de10e8:	f04f 0b00 	mov.w	fp, #0
c0de10ec:	2d40      	cmp	r5, #64	@ 0x40
c0de10ee:	d00b      	beq.n	c0de1108 <keccak_absorb_once+0x62>
c0de10f0:	f817 0b01 	ldrb.w	r0, [r7], #1
c0de10f4:	2100      	movs	r1, #0
c0de10f6:	462a      	mov	r2, r5
c0de10f8:	f00a ff6a 	bl	c0debfd0 <__aeabi_llsl>
c0de10fc:	ea4b 0b01 	orr.w	fp, fp, r1
c0de1100:	ea4a 0a00 	orr.w	sl, sl, r0
c0de1104:	3508      	adds	r5, #8
c0de1106:	e7f1      	b.n	c0de10ec <keccak_absorb_once+0x46>
c0de1108:	f854 0038 	ldr.w	r0, [r4, r8, lsl #3]
c0de110c:	3608      	adds	r6, #8
c0de110e:	ea80 000a 	eor.w	r0, r0, sl
c0de1112:	f844 0038 	str.w	r0, [r4, r8, lsl #3]
c0de1116:	eb04 00c8 	add.w	r0, r4, r8, lsl #3
c0de111a:	f108 0801 	add.w	r8, r8, #1
c0de111e:	6841      	ldr	r1, [r0, #4]
c0de1120:	ea81 010b 	eor.w	r1, r1, fp
c0de1124:	6041      	str	r1, [r0, #4]
c0de1126:	e7d8      	b.n	c0de10da <keccak_absorb_once+0x34>
c0de1128:	4620      	mov	r0, r4
c0de112a:	f000 f8ab 	bl	c0de1284 <KeccakF1600_StatePermute>
c0de112e:	e9dd 8700 	ldrd	r8, r7, [sp]
c0de1132:	9802      	ldr	r0, [sp, #8]
c0de1134:	4440      	add	r0, r8
c0de1136:	eba7 0708 	sub.w	r7, r7, r8
c0de113a:	9002      	str	r0, [sp, #8]
c0de113c:	e7c7      	b.n	c0de10ce <keccak_absorb_once+0x28>
c0de113e:	2500      	movs	r5, #0
c0de1140:	2600      	movs	r6, #0
c0de1142:	42b7      	cmp	r7, r6
c0de1144:	d00d      	beq.n	c0de1162 <keccak_absorb_once+0xbc>
c0de1146:	9802      	ldr	r0, [sp, #8]
c0de1148:	f005 0238 	and.w	r2, r5, #56	@ 0x38
c0de114c:	2100      	movs	r1, #0
c0de114e:	5d80      	ldrb	r0, [r0, r6]
c0de1150:	f00a ff3e 	bl	c0debfd0 <__aeabi_llsl>
c0de1154:	f026 0207 	bic.w	r2, r6, #7
c0de1158:	3508      	adds	r5, #8
c0de115a:	3601      	adds	r6, #1
c0de115c:	f000 fff8 	bl	c0de2150 <OUTLINED_FUNCTION_2>
c0de1160:	e7ef      	b.n	c0de1142 <keccak_absorb_once+0x9c>
c0de1162:	2038      	movs	r0, #56	@ 0x38
c0de1164:	2100      	movs	r1, #0
c0de1166:	ea00 02c7 	and.w	r2, r0, r7, lsl #3
c0de116a:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de116c:	f00a ff30 	bl	c0debfd0 <__aeabi_llsl>
c0de1170:	f027 0207 	bic.w	r2, r7, #7
c0de1174:	f000 ffec 	bl	c0de2150 <OUTLINED_FUNCTION_2>
c0de1178:	f1a8 0001 	sub.w	r0, r8, #1
c0de117c:	f020 0007 	bic.w	r0, r0, #7
c0de1180:	4420      	add	r0, r4
c0de1182:	6841      	ldr	r1, [r0, #4]
c0de1184:	f081 4100 	eor.w	r1, r1, #2147483648	@ 0x80000000
c0de1188:	6041      	str	r1, [r0, #4]
c0de118a:	e8bd 8dff 	ldmia.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de118e <pqcrystals_dilithium_fips202_ref_shake128_squeezeblocks>:
c0de118e:	23a8      	movs	r3, #168	@ 0xa8
c0de1190:	f000 b800 	b.w	c0de1194 <keccak_squeezeblocks>

c0de1194 <keccak_squeezeblocks>:
c0de1194:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1198:	4698      	mov	r8, r3
c0de119a:	4615      	mov	r5, r2
c0de119c:	468b      	mov	fp, r1
c0de119e:	4607      	mov	r7, r0
c0de11a0:	ea4f 0ad3 	mov.w	sl, r3, lsr #3
c0de11a4:	f1bb 0f00 	cmp.w	fp, #0
c0de11a8:	bf08      	it	eq
c0de11aa:	e8bd 8df0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de11ae:	4628      	mov	r0, r5
c0de11b0:	f000 f868 	bl	c0de1284 <KeccakF1600_StatePermute>
c0de11b4:	2400      	movs	r4, #0
c0de11b6:	4656      	mov	r6, sl
c0de11b8:	b146      	cbz	r6, c0de11cc <keccak_squeezeblocks+0x38>
c0de11ba:	1929      	adds	r1, r5, r4
c0de11bc:	592a      	ldr	r2, [r5, r4]
c0de11be:	1938      	adds	r0, r7, r4
c0de11c0:	684b      	ldr	r3, [r1, #4]
c0de11c2:	f000 ffac 	bl	c0de211e <store64>
c0de11c6:	3408      	adds	r4, #8
c0de11c8:	3e01      	subs	r6, #1
c0de11ca:	e7f5      	b.n	c0de11b8 <keccak_squeezeblocks+0x24>
c0de11cc:	4447      	add	r7, r8
c0de11ce:	f1ab 0b01 	sub.w	fp, fp, #1
c0de11d2:	e7e7      	b.n	c0de11a4 <keccak_squeezeblocks+0x10>

c0de11d4 <pqcrystals_dilithium_fips202_ref_shake256_init>:
c0de11d4:	b510      	push	{r4, lr}
c0de11d6:	4604      	mov	r4, r0
c0de11d8:	f7ff feba 	bl	c0de0f50 <keccak_init>
c0de11dc:	2000      	movs	r0, #0
c0de11de:	f8c4 00c8 	str.w	r0, [r4, #200]	@ 0xc8
c0de11e2:	bd10      	pop	{r4, pc}

c0de11e4 <pqcrystals_dilithium_fips202_ref_shake256_absorb>:
c0de11e4:	b51c      	push	{r2, r3, r4, lr}
c0de11e6:	460b      	mov	r3, r1
c0de11e8:	f8d0 10c8 	ldr.w	r1, [r0, #200]	@ 0xc8
c0de11ec:	9200      	str	r2, [sp, #0]
c0de11ee:	2288      	movs	r2, #136	@ 0x88
c0de11f0:	4604      	mov	r4, r0
c0de11f2:	f7ff fec2 	bl	c0de0f7a <keccak_absorb>
c0de11f6:	f000 bfb3 	b.w	c0de2160 <OUTLINED_FUNCTION_3>

c0de11fa <pqcrystals_dilithium_fips202_ref_shake256_finalize>:
c0de11fa:	b5b0      	push	{r4, r5, r7, lr}
c0de11fc:	f8d0 10c8 	ldr.w	r1, [r0, #200]	@ 0xc8
c0de1200:	2288      	movs	r2, #136	@ 0x88
c0de1202:	4604      	mov	r4, r0
c0de1204:	2588      	movs	r5, #136	@ 0x88
c0de1206:	f7ff ff01 	bl	c0de100c <keccak_finalize>
c0de120a:	f8c4 50c8 	str.w	r5, [r4, #200]	@ 0xc8
c0de120e:	bdb0      	pop	{r4, r5, r7, pc}

c0de1210 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>:
c0de1210:	b51c      	push	{r2, r3, r4, lr}
c0de1212:	4614      	mov	r4, r2
c0de1214:	f8d2 30c8 	ldr.w	r3, [r2, #200]	@ 0xc8
c0de1218:	2288      	movs	r2, #136	@ 0x88
c0de121a:	9200      	str	r2, [sp, #0]
c0de121c:	4622      	mov	r2, r4
c0de121e:	f7ff ff19 	bl	c0de1054 <keccak_squeeze>
c0de1222:	f000 bf9d 	b.w	c0de2160 <OUTLINED_FUNCTION_3>

c0de1226 <pqcrystals_dilithium_fips202_ref_shake256_absorb_once>:
c0de1226:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0de1228:	4604      	mov	r4, r0
c0de122a:	201f      	movs	r0, #31
c0de122c:	4613      	mov	r3, r2
c0de122e:	460a      	mov	r2, r1
c0de1230:	2188      	movs	r1, #136	@ 0x88
c0de1232:	2588      	movs	r5, #136	@ 0x88
c0de1234:	9000      	str	r0, [sp, #0]
c0de1236:	4620      	mov	r0, r4
c0de1238:	f7ff ff35 	bl	c0de10a6 <keccak_absorb_once>
c0de123c:	f8c4 50c8 	str.w	r5, [r4, #200]	@ 0xc8
c0de1240:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0de1242 <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>:
c0de1242:	2388      	movs	r3, #136	@ 0x88
c0de1244:	f7ff bfa6 	b.w	c0de1194 <keccak_squeezeblocks>

c0de1248 <pqcrystals_dilithium_fips202_ref_shake256>:
c0de1248:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de124a:	b0b5      	sub	sp, #212	@ 0xd4
c0de124c:	466e      	mov	r6, sp
c0de124e:	460c      	mov	r4, r1
c0de1250:	4605      	mov	r5, r0
c0de1252:	4611      	mov	r1, r2
c0de1254:	461a      	mov	r2, r3
c0de1256:	4630      	mov	r0, r6
c0de1258:	f7ff ffe5 	bl	c0de1226 <pqcrystals_dilithium_fips202_ref_shake256_absorb_once>
c0de125c:	2088      	movs	r0, #136	@ 0x88
c0de125e:	4632      	mov	r2, r6
c0de1260:	fbb4 f7f0 	udiv	r7, r4, r0
c0de1264:	4628      	mov	r0, r5
c0de1266:	4639      	mov	r1, r7
c0de1268:	f7ff ffeb 	bl	c0de1242 <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>
c0de126c:	eb07 1107 	add.w	r1, r7, r7, lsl #4
c0de1270:	4632      	mov	r2, r6
c0de1272:	eb05 00c1 	add.w	r0, r5, r1, lsl #3
c0de1276:	eba4 01c1 	sub.w	r1, r4, r1, lsl #3
c0de127a:	f7ff ffc9 	bl	c0de1210 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de127e:	b035      	add	sp, #212	@ 0xd4
c0de1280:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

c0de1284 <KeccakF1600_StatePermute>:
c0de1284:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1288:	b0de      	sub	sp, #376	@ 0x178
c0de128a:	e9d0 2130 	ldrd	r2, r1, [r0, #192]	@ 0xc0
c0de128e:	9000      	str	r0, [sp, #0]
c0de1290:	9156      	str	r1, [sp, #344]	@ 0x158
c0de1292:	f8d0 10a0 	ldr.w	r1, [r0, #160]	@ 0xa0
c0de1296:	9253      	str	r2, [sp, #332]	@ 0x14c
c0de1298:	e9d0 2302 	ldrd	r2, r3, [r0, #8]
c0de129c:	912a      	str	r1, [sp, #168]	@ 0xa8
c0de129e:	f8d0 10a4 	ldr.w	r1, [r0, #164]	@ 0xa4
c0de12a2:	912c      	str	r1, [sp, #176]	@ 0xb0
c0de12a4:	f8d0 10a8 	ldr.w	r1, [r0, #168]	@ 0xa8
c0de12a8:	9148      	str	r1, [sp, #288]	@ 0x120
c0de12aa:	f8d0 10ac 	ldr.w	r1, [r0, #172]	@ 0xac
c0de12ae:	914f      	str	r1, [sp, #316]	@ 0x13c
c0de12b0:	f8d0 10b0 	ldr.w	r1, [r0, #176]	@ 0xb0
c0de12b4:	9143      	str	r1, [sp, #268]	@ 0x10c
c0de12b6:	f8d0 10b4 	ldr.w	r1, [r0, #180]	@ 0xb4
c0de12ba:	914d      	str	r1, [sp, #308]	@ 0x134
c0de12bc:	f8d0 10b8 	ldr.w	r1, [r0, #184]	@ 0xb8
c0de12c0:	9151      	str	r1, [sp, #324]	@ 0x144
c0de12c2:	f8d0 10bc 	ldr.w	r1, [r0, #188]	@ 0xbc
c0de12c6:	9154      	str	r1, [sp, #336]	@ 0x150
c0de12c8:	f8d0 1080 	ldr.w	r1, [r0, #128]	@ 0x80
c0de12cc:	9136      	str	r1, [sp, #216]	@ 0xd8
c0de12ce:	f8d0 1084 	ldr.w	r1, [r0, #132]	@ 0x84
c0de12d2:	913e      	str	r1, [sp, #248]	@ 0xf8
c0de12d4:	f8d0 1088 	ldr.w	r1, [r0, #136]	@ 0x88
c0de12d8:	9142      	str	r1, [sp, #264]	@ 0x108
c0de12da:	f8d0 108c 	ldr.w	r1, [r0, #140]	@ 0x8c
c0de12de:	914a      	str	r1, [sp, #296]	@ 0x128
c0de12e0:	f8d0 1090 	ldr.w	r1, [r0, #144]	@ 0x90
c0de12e4:	913f      	str	r1, [sp, #252]	@ 0xfc
c0de12e6:	f8d0 1094 	ldr.w	r1, [r0, #148]	@ 0x94
c0de12ea:	9147      	str	r1, [sp, #284]	@ 0x11c
c0de12ec:	f8d0 1098 	ldr.w	r1, [r0, #152]	@ 0x98
c0de12f0:	9134      	str	r1, [sp, #208]	@ 0xd0
c0de12f2:	f8d0 109c 	ldr.w	r1, [r0, #156]	@ 0x9c
c0de12f6:	913a      	str	r1, [sp, #232]	@ 0xe8
c0de12f8:	6e01      	ldr	r1, [r0, #96]	@ 0x60
c0de12fa:	9141      	str	r1, [sp, #260]	@ 0x104
c0de12fc:	6e41      	ldr	r1, [r0, #100]	@ 0x64
c0de12fe:	9149      	str	r1, [sp, #292]	@ 0x124
c0de1300:	6e81      	ldr	r1, [r0, #104]	@ 0x68
c0de1302:	914e      	str	r1, [sp, #312]	@ 0x138
c0de1304:	6ec1      	ldr	r1, [r0, #108]	@ 0x6c
c0de1306:	9152      	str	r1, [sp, #328]	@ 0x148
c0de1308:	6f01      	ldr	r1, [r0, #112]	@ 0x70
c0de130a:	9150      	str	r1, [sp, #320]	@ 0x140
c0de130c:	6f41      	ldr	r1, [r0, #116]	@ 0x74
c0de130e:	9155      	str	r1, [sp, #340]	@ 0x154
c0de1310:	6f81      	ldr	r1, [r0, #120]	@ 0x78
c0de1312:	9135      	str	r1, [sp, #212]	@ 0xd4
c0de1314:	6fc1      	ldr	r1, [r0, #124]	@ 0x7c
c0de1316:	913c      	str	r1, [sp, #240]	@ 0xf0
c0de1318:	6c01      	ldr	r1, [r0, #64]	@ 0x40
c0de131a:	9145      	str	r1, [sp, #276]	@ 0x114
c0de131c:	6c41      	ldr	r1, [r0, #68]	@ 0x44
c0de131e:	914c      	str	r1, [sp, #304]	@ 0x130
c0de1320:	6c81      	ldr	r1, [r0, #72]	@ 0x48
c0de1322:	9139      	str	r1, [sp, #228]	@ 0xe4
c0de1324:	6cc1      	ldr	r1, [r0, #76]	@ 0x4c
c0de1326:	913b      	str	r1, [sp, #236]	@ 0xec
c0de1328:	6d01      	ldr	r1, [r0, #80]	@ 0x50
c0de132a:	9140      	str	r1, [sp, #256]	@ 0x100
c0de132c:	6d41      	ldr	r1, [r0, #84]	@ 0x54
c0de132e:	9146      	str	r1, [sp, #280]	@ 0x118
c0de1330:	6d81      	ldr	r1, [r0, #88]	@ 0x58
c0de1332:	9144      	str	r1, [sp, #272]	@ 0x110
c0de1334:	6dc1      	ldr	r1, [r0, #92]	@ 0x5c
c0de1336:	914b      	str	r1, [sp, #300]	@ 0x12c
c0de1338:	6a01      	ldr	r1, [r0, #32]
c0de133a:	9158      	str	r1, [sp, #352]	@ 0x160
c0de133c:	e9d0 e109 	ldrd	lr, r1, [r0, #36]	@ 0x24
c0de1340:	9133      	str	r1, [sp, #204]	@ 0xcc
c0de1342:	6ac1      	ldr	r1, [r0, #44]	@ 0x2c
c0de1344:	913d      	str	r1, [sp, #244]	@ 0xf4
c0de1346:	6b01      	ldr	r1, [r0, #48]	@ 0x30
c0de1348:	9131      	str	r1, [sp, #196]	@ 0xc4
c0de134a:	6b41      	ldr	r1, [r0, #52]	@ 0x34
c0de134c:	9132      	str	r1, [sp, #200]	@ 0xc8
c0de134e:	6b81      	ldr	r1, [r0, #56]	@ 0x38
c0de1350:	9137      	str	r1, [sp, #220]	@ 0xdc
c0de1352:	6bc1      	ldr	r1, [r0, #60]	@ 0x3c
c0de1354:	9138      	str	r1, [sp, #224]	@ 0xe0
c0de1356:	6801      	ldr	r1, [r0, #0]
c0de1358:	915a      	str	r1, [sp, #360]	@ 0x168
c0de135a:	6841      	ldr	r1, [r0, #4]
c0de135c:	915b      	str	r1, [sp, #364]	@ 0x16c
c0de135e:	6901      	ldr	r1, [r0, #16]
c0de1360:	9159      	str	r1, [sp, #356]	@ 0x164
c0de1362:	6941      	ldr	r1, [r0, #20]
c0de1364:	915c      	str	r1, [sp, #368]	@ 0x170
c0de1366:	6981      	ldr	r1, [r0, #24]
c0de1368:	69c0      	ldr	r0, [r0, #28]
c0de136a:	912e      	str	r1, [sp, #184]	@ 0xb8
c0de136c:	9030      	str	r0, [sp, #192]	@ 0xc0
c0de136e:	4803      	ldr	r0, [pc, #12]	@ (c0de137c <KeccakF1600_StatePermute+0xf8>)
c0de1370:	4478      	add	r0, pc
c0de1372:	3008      	adds	r0, #8
c0de1374:	905d      	str	r0, [sp, #372]	@ 0x174
c0de1376:	2000      	movs	r0, #0
c0de1378:	e002      	b.n	c0de1380 <KeccakF1600_StatePermute+0xfc>
c0de137a:	bf00      	nop
c0de137c:	0000dda4 	.word	0x0000dda4
c0de1380:	2817      	cmp	r0, #23
c0de1382:	f200 8654 	bhi.w	c0de202e <KeccakF1600_StatePermute+0xdaa>
c0de1386:	9027      	str	r0, [sp, #156]	@ 0x9c
c0de1388:	9848      	ldr	r0, [sp, #288]	@ 0x120
c0de138a:	9936      	ldr	r1, [sp, #216]	@ 0xd8
c0de138c:	469a      	mov	sl, r3
c0de138e:	9257      	str	r2, [sp, #348]	@ 0x15c
c0de1390:	f8cd e098 	str.w	lr, [sp, #152]	@ 0x98
c0de1394:	4048      	eors	r0, r1
c0de1396:	9944      	ldr	r1, [sp, #272]	@ 0x110
c0de1398:	4048      	eors	r0, r1
c0de139a:	9931      	ldr	r1, [sp, #196]	@ 0xc4
c0de139c:	4048      	eors	r0, r1
c0de139e:	993e      	ldr	r1, [sp, #248]	@ 0xf8
c0de13a0:	ea80 0402 	eor.w	r4, r0, r2
c0de13a4:	984f      	ldr	r0, [sp, #316]	@ 0x13c
c0de13a6:	9423      	str	r4, [sp, #140]	@ 0x8c
c0de13a8:	4048      	eors	r0, r1
c0de13aa:	994b      	ldr	r1, [sp, #300]	@ 0x12c
c0de13ac:	4048      	eors	r0, r1
c0de13ae:	9932      	ldr	r1, [sp, #200]	@ 0xc8
c0de13b0:	4048      	eors	r0, r1
c0de13b2:	993a      	ldr	r1, [sp, #232]	@ 0xe8
c0de13b4:	4058      	eors	r0, r3
c0de13b6:	0043      	lsls	r3, r0, #1
c0de13b8:	4606      	mov	r6, r0
c0de13ba:	9028      	str	r0, [sp, #160]	@ 0xa0
c0de13bc:	9856      	ldr	r0, [sp, #344]	@ 0x158
c0de13be:	ea43 75d4 	orr.w	r5, r3, r4, lsr #31
c0de13c2:	ea81 0300 	eor.w	r3, r1, r0
c0de13c6:	9855      	ldr	r0, [sp, #340]	@ 0x154
c0de13c8:	4043      	eors	r3, r0
c0de13ca:	983b      	ldr	r0, [sp, #236]	@ 0xec
c0de13cc:	4043      	eors	r3, r0
c0de13ce:	982c      	ldr	r0, [sp, #176]	@ 0xb0
c0de13d0:	ea83 0b0e 	eor.w	fp, r3, lr
c0de13d4:	9b34      	ldr	r3, [sp, #208]	@ 0xd0
c0de13d6:	ea85 010b 	eor.w	r1, r5, fp
c0de13da:	0065      	lsls	r5, r4, #1
c0de13dc:	ea81 0200 	eor.w	r2, r1, r0
c0de13e0:	912f      	str	r1, [sp, #188]	@ 0xbc
c0de13e2:	9953      	ldr	r1, [sp, #332]	@ 0x14c
c0de13e4:	ea45 76d6 	orr.w	r6, r5, r6, lsr #31
c0de13e8:	9222      	str	r2, [sp, #136]	@ 0x88
c0de13ea:	ea83 0501 	eor.w	r5, r3, r1
c0de13ee:	9950      	ldr	r1, [sp, #320]	@ 0x140
c0de13f0:	9b2a      	ldr	r3, [sp, #168]	@ 0xa8
c0de13f2:	404d      	eors	r5, r1
c0de13f4:	9939      	ldr	r1, [sp, #228]	@ 0xe4
c0de13f6:	404d      	eors	r5, r1
c0de13f8:	9958      	ldr	r1, [sp, #352]	@ 0x160
c0de13fa:	ea85 0801 	eor.w	r8, r5, r1
c0de13fe:	ea86 0108 	eor.w	r1, r6, r8
c0de1402:	ea81 0403 	eor.w	r4, r1, r3
c0de1406:	912b      	str	r1, [sp, #172]	@ 0xac
c0de1408:	04a6      	lsls	r6, r4, #18
c0de140a:	9425      	str	r4, [sp, #148]	@ 0x94
c0de140c:	ea46 3c92 	orr.w	ip, r6, r2, lsr #14
c0de1410:	e9dd 1242 	ldrd	r1, r2, [sp, #264]	@ 0x108
c0de1414:	f8cd c070 	str.w	ip, [sp, #112]	@ 0x70
c0de1418:	ea81 0602 	eor.w	r6, r1, r2
c0de141c:	9941      	ldr	r1, [sp, #260]	@ 0x104
c0de141e:	9a4d      	ldr	r2, [sp, #308]	@ 0x134
c0de1420:	404e      	eors	r6, r1
c0de1422:	9937      	ldr	r1, [sp, #220]	@ 0xdc
c0de1424:	404e      	eors	r6, r1
c0de1426:	9959      	ldr	r1, [sp, #356]	@ 0x164
c0de1428:	ea86 0e01 	eor.w	lr, r6, r1
c0de142c:	994a      	ldr	r1, [sp, #296]	@ 0x128
c0de142e:	9e30      	ldr	r6, [sp, #192]	@ 0xc0
c0de1430:	ea81 0702 	eor.w	r7, r1, r2
c0de1434:	9949      	ldr	r1, [sp, #292]	@ 0x124
c0de1436:	404f      	eors	r7, r1
c0de1438:	9938      	ldr	r1, [sp, #224]	@ 0xe0
c0de143a:	404f      	eors	r7, r1
c0de143c:	995c      	ldr	r1, [sp, #368]	@ 0x170
c0de143e:	404f      	eors	r7, r1
c0de1440:	993c      	ldr	r1, [sp, #240]	@ 0xf0
c0de1442:	007c      	lsls	r4, r7, #1
c0de1444:	ea81 0200 	eor.w	r2, r1, r0
c0de1448:	9846      	ldr	r0, [sp, #280]	@ 0x118
c0de144a:	ea44 74de 	orr.w	r4, r4, lr, lsr #31
c0de144e:	4042      	eors	r2, r0
c0de1450:	983d      	ldr	r0, [sp, #244]	@ 0xf4
c0de1452:	4042      	eors	r2, r0
c0de1454:	985b      	ldr	r0, [sp, #364]	@ 0x16c
c0de1456:	ea82 0100 	eor.w	r1, r2, r0
c0de145a:	ea4f 024e 	mov.w	r2, lr, lsl #1
c0de145e:	ea81 0004 	eor.w	r0, r1, r4
c0de1462:	ea42 72d7 	orr.w	r2, r2, r7, lsr #31
c0de1466:	ea80 050a 	eor.w	r5, r0, sl
c0de146a:	902d      	str	r0, [sp, #180]	@ 0xb4
c0de146c:	9835      	ldr	r0, [sp, #212]	@ 0xd4
c0de146e:	9520      	str	r5, [sp, #128]	@ 0x80
c0de1470:	ea80 0403 	eor.w	r4, r0, r3
c0de1474:	9840      	ldr	r0, [sp, #256]	@ 0x100
c0de1476:	4044      	eors	r4, r0
c0de1478:	9833      	ldr	r0, [sp, #204]	@ 0xcc
c0de147a:	4044      	eors	r4, r0
c0de147c:	985a      	ldr	r0, [sp, #360]	@ 0x168
c0de147e:	4044      	eors	r4, r0
c0de1480:	9857      	ldr	r0, [sp, #348]	@ 0x15c
c0de1482:	ea84 0a02 	eor.w	sl, r4, r2
c0de1486:	ea80 000a 	eor.w	r0, r0, sl
c0de148a:	f8cd a064 	str.w	sl, [sp, #100]	@ 0x64
c0de148e:	0042      	lsls	r2, r0, #1
c0de1490:	9021      	str	r0, [sp, #132]	@ 0x84
c0de1492:	9854      	ldr	r0, [sp, #336]	@ 0x150
c0de1494:	ea42 72d5 	orr.w	r2, r2, r5, lsr #31
c0de1498:	9257      	str	r2, [sp, #348]	@ 0x15c
c0de149a:	ea22 0c0c 	bic.w	ip, r2, ip
c0de149e:	004a      	lsls	r2, r1, #1
c0de14a0:	ea42 73d4 	orr.w	r3, r2, r4, lsr #31
c0de14a4:	9a47      	ldr	r2, [sp, #284]	@ 0x11c
c0de14a6:	4042      	eors	r2, r0
c0de14a8:	9852      	ldr	r0, [sp, #328]	@ 0x148
c0de14aa:	4042      	eors	r2, r0
c0de14ac:	984c      	ldr	r0, [sp, #304]	@ 0x130
c0de14ae:	4042      	eors	r2, r0
c0de14b0:	ea82 0506 	eor.w	r5, r2, r6
c0de14b4:	9a3a      	ldr	r2, [sp, #232]	@ 0xe8
c0de14b6:	ea83 0005 	eor.w	r0, r3, r5
c0de14ba:	0063      	lsls	r3, r4, #1
c0de14bc:	9c2e      	ldr	r4, [sp, #184]	@ 0xb8
c0de14be:	4042      	eors	r2, r0
c0de14c0:	902a      	str	r0, [sp, #168]	@ 0xa8
c0de14c2:	ea43 70d1 	orr.w	r0, r3, r1, lsr #31
c0de14c6:	9951      	ldr	r1, [sp, #324]	@ 0x144
c0de14c8:	9b3f      	ldr	r3, [sp, #252]	@ 0xfc
c0de14ca:	9212      	str	r2, [sp, #72]	@ 0x48
c0de14cc:	404b      	eors	r3, r1
c0de14ce:	994e      	ldr	r1, [sp, #312]	@ 0x138
c0de14d0:	404b      	eors	r3, r1
c0de14d2:	9945      	ldr	r1, [sp, #276]	@ 0x114
c0de14d4:	404b      	eors	r3, r1
c0de14d6:	4063      	eors	r3, r4
c0de14d8:	ea80 0103 	eor.w	r1, r0, r3
c0de14dc:	9834      	ldr	r0, [sp, #208]	@ 0xd0
c0de14de:	9129      	str	r1, [sp, #164]	@ 0xa4
c0de14e0:	4048      	eors	r0, r1
c0de14e2:	901d      	str	r0, [sp, #116]	@ 0x74
c0de14e4:	0200      	lsls	r0, r0, #8
c0de14e6:	ea40 6012 	orr.w	r0, r0, r2, lsr #24
c0de14ea:	ea8c 0c00 	eor.w	ip, ip, r0
c0de14ee:	9034      	str	r0, [sp, #208]	@ 0xd0
c0de14f0:	ea4f 004b 	mov.w	r0, fp, lsl #1
c0de14f4:	ea40 70d8 	orr.w	r0, r0, r8, lsr #31
c0de14f8:	f8cd c090 	str.w	ip, [sp, #144]	@ 0x90
c0de14fc:	4078      	eors	r0, r7
c0de14fe:	ea80 0106 	eor.w	r1, r0, r6
c0de1502:	902c      	str	r0, [sp, #176]	@ 0xb0
c0de1504:	ea4f 0048 	mov.w	r0, r8, lsl #1
c0de1508:	ea40 70db 	orr.w	r0, r0, fp, lsr #31
c0de150c:	9130      	str	r1, [sp, #192]	@ 0xc0
c0de150e:	ea80 000e 	eor.w	r0, r0, lr
c0de1512:	ea80 0204 	eor.w	r2, r0, r4
c0de1516:	4604      	mov	r4, r0
c0de1518:	0710      	lsls	r0, r2, #28
c0de151a:	922e      	str	r2, [sp, #184]	@ 0xb8
c0de151c:	9a23      	ldr	r2, [sp, #140]	@ 0x8c
c0de151e:	9413      	str	r4, [sp, #76]	@ 0x4c
c0de1520:	ea40 1111 	orr.w	r1, r0, r1, lsr #4
c0de1524:	0058      	lsls	r0, r3, #1
c0de1526:	ea40 70d5 	orr.w	r0, r0, r5, lsr #31
c0de152a:	913a      	str	r1, [sp, #232]	@ 0xe8
c0de152c:	ea82 0800 	eor.w	r8, r2, r0
c0de1530:	9a43      	ldr	r2, [sp, #268]	@ 0x10c
c0de1532:	0068      	lsls	r0, r5, #1
c0de1534:	ea40 70d3 	orr.w	r0, r0, r3, lsr #31
c0de1538:	9b2b      	ldr	r3, [sp, #172]	@ 0xac
c0de153a:	f8cd 802c 	str.w	r8, [sp, #44]	@ 0x2c
c0de153e:	ea88 0602 	eor.w	r6, r8, r2
c0de1542:	9a28      	ldr	r2, [sp, #160]	@ 0xa0
c0de1544:	9616      	str	r6, [sp, #88]	@ 0x58
c0de1546:	ea82 0e00 	eor.w	lr, r2, r0
c0de154a:	9a4d      	ldr	r2, [sp, #308]	@ 0x134
c0de154c:	f8cd e0a0 	str.w	lr, [sp, #160]	@ 0xa0
c0de1550:	ea82 020e 	eor.w	r2, r2, lr
c0de1554:	0750      	lsls	r0, r2, #29
c0de1556:	9214      	str	r2, [sp, #80]	@ 0x50
c0de1558:	9a2d      	ldr	r2, [sp, #180]	@ 0xb4
c0de155a:	ea40 00d6 	orr.w	r0, r0, r6, lsr #3
c0de155e:	901a      	str	r0, [sp, #104]	@ 0x68
c0de1560:	ea21 0000 	bic.w	r0, r1, r0
c0de1564:	9936      	ldr	r1, [sp, #216]	@ 0xd8
c0de1566:	ea8a 0501 	eor.w	r5, sl, r1
c0de156a:	993e      	ldr	r1, [sp, #248]	@ 0xf8
c0de156c:	950d      	str	r5, [sp, #52]	@ 0x34
c0de156e:	4051      	eors	r1, r2
c0de1570:	9117      	str	r1, [sp, #92]	@ 0x5c
c0de1572:	0349      	lsls	r1, r1, #13
c0de1574:	ea41 41d5 	orr.w	r1, r1, r5, lsr #19
c0de1578:	4048      	eors	r0, r1
c0de157a:	9143      	str	r1, [sp, #268]	@ 0x10c
c0de157c:	994f      	ldr	r1, [sp, #316]	@ 0x13c
c0de157e:	901b      	str	r0, [sp, #108]	@ 0x6c
c0de1580:	ea80 000c 	eor.w	r0, r0, ip
c0de1584:	404a      	eors	r2, r1
c0de1586:	9948      	ldr	r1, [sp, #288]	@ 0x120
c0de1588:	9211      	str	r2, [sp, #68]	@ 0x44
c0de158a:	ea81 010a 	eor.w	r1, r1, sl
c0de158e:	9148      	str	r1, [sp, #288]	@ 0x120
c0de1590:	0089      	lsls	r1, r1, #2
c0de1592:	ea41 7292 	orr.w	r2, r1, r2, lsr #30
c0de1596:	9959      	ldr	r1, [sp, #356]	@ 0x164
c0de1598:	923e      	str	r2, [sp, #248]	@ 0xf8
c0de159a:	ea88 0501 	eor.w	r5, r8, r1
c0de159e:	995c      	ldr	r1, [sp, #368]	@ 0x170
c0de15a0:	9510      	str	r5, [sp, #64]	@ 0x40
c0de15a2:	ea81 010e 	eor.w	r1, r1, lr
c0de15a6:	915c      	str	r1, [sp, #368]	@ 0x170
c0de15a8:	0789      	lsls	r1, r1, #30
c0de15aa:	ea41 0195 	orr.w	r1, r1, r5, lsr #2
c0de15ae:	9d3c      	ldr	r5, [sp, #240]	@ 0xf0
c0de15b0:	914f      	str	r1, [sp, #316]	@ 0x13c
c0de15b2:	4391      	bics	r1, r2
c0de15b4:	9a35      	ldr	r2, [sp, #212]	@ 0xd4
c0de15b6:	ea83 0602 	eor.w	r6, r3, r2
c0de15ba:	9a2f      	ldr	r2, [sp, #188]	@ 0xbc
c0de15bc:	960f      	str	r6, [sp, #60]	@ 0x3c
c0de15be:	406a      	eors	r2, r5
c0de15c0:	920e      	str	r2, [sp, #56]	@ 0x38
c0de15c2:	0252      	lsls	r2, r2, #9
c0de15c4:	ea42 52d6 	orr.w	r2, r2, r6, lsr #23
c0de15c8:	9e2c      	ldr	r6, [sp, #176]	@ 0xb0
c0de15ca:	4051      	eors	r1, r2
c0de15cc:	9236      	str	r2, [sp, #216]	@ 0xd8
c0de15ce:	ea80 0c01 	eor.w	ip, r0, r1
c0de15d2:	911f      	str	r1, [sp, #124]	@ 0x7c
c0de15d4:	993f      	ldr	r1, [sp, #252]	@ 0xfc
c0de15d6:	9847      	ldr	r0, [sp, #284]	@ 0x11c
c0de15d8:	4061      	eors	r1, r4
c0de15da:	ea86 0200 	eor.w	r2, r6, r0
c0de15de:	4620      	mov	r0, r4
c0de15e0:	9c29      	ldr	r4, [sp, #164]	@ 0xa4
c0de15e2:	910c      	str	r1, [sp, #48]	@ 0x30
c0de15e4:	0549      	lsls	r1, r1, #21
c0de15e6:	9247      	str	r2, [sp, #284]	@ 0x11c
c0de15e8:	ea41 25d2 	orr.w	r5, r1, r2, lsr #11
c0de15ec:	9a2a      	ldr	r2, [sp, #168]	@ 0xa8
c0de15ee:	9956      	ldr	r1, [sp, #344]	@ 0x158
c0de15f0:	9518      	str	r5, [sp, #96]	@ 0x60
c0de15f2:	ea82 0b01 	eor.w	fp, r2, r1
c0de15f6:	9953      	ldr	r1, [sp, #332]	@ 0x14c
c0de15f8:	4061      	eors	r1, r4
c0de15fa:	910a      	str	r1, [sp, #40]	@ 0x28
c0de15fc:	0389      	lsls	r1, r1, #14
c0de15fe:	ea41 479b 	orr.w	r7, r1, fp, lsr #18
c0de1602:	995a      	ldr	r1, [sp, #360]	@ 0x168
c0de1604:	971e      	str	r7, [sp, #120]	@ 0x78
c0de1606:	4059      	eors	r1, r3
c0de1608:	9156      	str	r1, [sp, #344]	@ 0x158
c0de160a:	43b9      	bics	r1, r7
c0de160c:	9f21      	ldr	r7, [sp, #132]	@ 0x84
c0de160e:	4069      	eors	r1, r5
c0de1610:	9123      	str	r1, [sp, #140]	@ 0x8c
c0de1612:	ea8c 0301 	eor.w	r3, ip, r1
c0de1616:	9926      	ldr	r1, [sp, #152]	@ 0x98
c0de1618:	ea82 0a01 	eor.w	sl, r2, r1
c0de161c:	9958      	ldr	r1, [sp, #352]	@ 0x160
c0de161e:	4061      	eors	r1, r4
c0de1620:	915a      	str	r1, [sp, #360]	@ 0x168
c0de1622:	06c9      	lsls	r1, r1, #27
c0de1624:	ea41 155a 	orr.w	r5, r1, sl, lsr #5
c0de1628:	9951      	ldr	r1, [sp, #324]	@ 0x144
c0de162a:	9535      	str	r5, [sp, #212]	@ 0xd4
c0de162c:	ea80 0401 	eor.w	r4, r0, r1
c0de1630:	9854      	ldr	r0, [sp, #336]	@ 0x150
c0de1632:	ea86 0100 	eor.w	r1, r6, r0
c0de1636:	9e2e      	ldr	r6, [sp, #184]	@ 0xb8
c0de1638:	060a      	lsls	r2, r1, #24
c0de163a:	ea42 2014 	orr.w	r0, r2, r4, lsr #8
c0de163e:	9a4a      	ldr	r2, [sp, #296]	@ 0x128
c0de1640:	9015      	str	r0, [sp, #84]	@ 0x54
c0de1642:	ea25 0000 	bic.w	r0, r5, r0
c0de1646:	9d42      	ldr	r5, [sp, #264]	@ 0x108
c0de1648:	ea82 020e 	eor.w	r2, r2, lr
c0de164c:	f8dd e0a4 	ldr.w	lr, [sp, #164]	@ 0xa4
c0de1650:	ea85 0508 	eor.w	r5, r5, r8
c0de1654:	ea4f 3cc5 	mov.w	ip, r5, lsl #15
c0de1658:	ea4c 4c52 	orr.w	ip, ip, r2, lsr #17
c0de165c:	03d2      	lsls	r2, r2, #15
c0de165e:	ea80 000c 	eor.w	r0, r0, ip
c0de1662:	f8cd c164 	str.w	ip, [sp, #356]	@ 0x164
c0de1666:	ea42 4255 	orr.w	r2, r2, r5, lsr #17
c0de166a:	9d19      	ldr	r5, [sp, #100]	@ 0x64
c0de166c:	ea83 0c00 	eor.w	ip, r3, r0
c0de1670:	9026      	str	r0, [sp, #152]	@ 0x98
c0de1672:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de1674:	9b14      	ldr	r3, [sp, #80]	@ 0x50
c0de1676:	f8cd c134 	str.w	ip, [sp, #308]	@ 0x134
c0de167a:	0740      	lsls	r0, r0, #29
c0de167c:	ea40 03d3 	orr.w	r3, r0, r3, lsr #3
c0de1680:	9830      	ldr	r0, [sp, #192]	@ 0xc0
c0de1682:	9316      	str	r3, [sp, #88]	@ 0x58
c0de1684:	0700      	lsls	r0, r0, #28
c0de1686:	ea40 1016 	orr.w	r0, r0, r6, lsr #4
c0de168a:	9e17      	ldr	r6, [sp, #92]	@ 0x5c
c0de168c:	9058      	str	r0, [sp, #352]	@ 0x160
c0de168e:	4398      	bics	r0, r3
c0de1690:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
c0de1692:	035b      	lsls	r3, r3, #13
c0de1694:	ea43 43d6 	orr.w	r3, r3, r6, lsr #19
c0de1698:	ea83 0600 	eor.w	r6, r3, r0
c0de169c:	9822      	ldr	r0, [sp, #136]	@ 0x88
c0de169e:	933c      	str	r3, [sp, #240]	@ 0xf0
c0de16a0:	9b25      	ldr	r3, [sp, #148]	@ 0x94
c0de16a2:	9617      	str	r6, [sp, #92]	@ 0x5c
c0de16a4:	0480      	lsls	r0, r0, #18
c0de16a6:	ea40 3393 	orr.w	r3, r0, r3, lsr #14
c0de16aa:	9820      	ldr	r0, [sp, #128]	@ 0x80
c0de16ac:	9314      	str	r3, [sp, #80]	@ 0x50
c0de16ae:	0040      	lsls	r0, r0, #1
c0de16b0:	ea40 70d7 	orr.w	r0, r0, r7, lsr #31
c0de16b4:	9f1d      	ldr	r7, [sp, #116]	@ 0x74
c0de16b6:	9054      	str	r0, [sp, #336]	@ 0x150
c0de16b8:	4398      	bics	r0, r3
c0de16ba:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de16bc:	021b      	lsls	r3, r3, #8
c0de16be:	ea43 6317 	orr.w	r3, r3, r7, lsr #24
c0de16c2:	4058      	eors	r0, r3
c0de16c4:	933f      	str	r3, [sp, #252]	@ 0xfc
c0de16c6:	9021      	str	r0, [sp, #132]	@ 0x84
c0de16c8:	ea80 0806 	eor.w	r8, r0, r6
c0de16cc:	9810      	ldr	r0, [sp, #64]	@ 0x40
c0de16ce:	0783      	lsls	r3, r0, #30
c0de16d0:	985c      	ldr	r0, [sp, #368]	@ 0x170
c0de16d2:	ea43 0690 	orr.w	r6, r3, r0, lsr #2
c0de16d6:	9811      	ldr	r0, [sp, #68]	@ 0x44
c0de16d8:	9653      	str	r6, [sp, #332]	@ 0x14c
c0de16da:	0083      	lsls	r3, r0, #2
c0de16dc:	9848      	ldr	r0, [sp, #288]	@ 0x120
c0de16de:	ea43 7090 	orr.w	r0, r3, r0, lsr #30
c0de16e2:	9012      	str	r0, [sp, #72]	@ 0x48
c0de16e4:	ea26 0300 	bic.w	r3, r6, r0
c0de16e8:	980f      	ldr	r0, [sp, #60]	@ 0x3c
c0de16ea:	0246      	lsls	r6, r0, #9
c0de16ec:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de16ee:	920e      	str	r2, [sp, #56]	@ 0x38
c0de16f0:	ea46 50d0 	orr.w	r0, r6, r0, lsr #23
c0de16f4:	9e0c      	ldr	r6, [sp, #48]	@ 0x30
c0de16f6:	4043      	eors	r3, r0
c0de16f8:	9030      	str	r0, [sp, #192]	@ 0xc0
c0de16fa:	ea88 0003 	eor.w	r0, r8, r3
c0de16fe:	931d      	str	r3, [sp, #116]	@ 0x74
c0de1700:	9b47      	ldr	r3, [sp, #284]	@ 0x11c
c0de1702:	f8dd 80bc 	ldr.w	r8, [sp, #188]	@ 0xbc
c0de1706:	055b      	lsls	r3, r3, #21
c0de1708:	ea43 27d6 	orr.w	r7, r3, r6, lsr #11
c0de170c:	9e0a      	ldr	r6, [sp, #40]	@ 0x28
c0de170e:	ea4f 338b 	mov.w	r3, fp, lsl #14
c0de1712:	4693      	mov	fp, r2
c0de1714:	970d      	str	r7, [sp, #52]	@ 0x34
c0de1716:	ea43 4696 	orr.w	r6, r3, r6, lsr #18
c0de171a:	9b5b      	ldr	r3, [sp, #364]	@ 0x16c
c0de171c:	962e      	str	r6, [sp, #184]	@ 0xb8
c0de171e:	ea83 0308 	eor.w	r3, r3, r8
c0de1722:	9351      	str	r3, [sp, #324]	@ 0x144
c0de1724:	43b3      	bics	r3, r6
c0de1726:	407b      	eors	r3, r7
c0de1728:	9320      	str	r3, [sp, #128]	@ 0x80
c0de172a:	4058      	eors	r0, r3
c0de172c:	0623      	lsls	r3, r4, #24
c0de172e:	9c5a      	ldr	r4, [sp, #360]	@ 0x168
c0de1730:	ea43 2311 	orr.w	r3, r3, r1, lsr #8
c0de1734:	ea4f 61ca 	mov.w	r1, sl, lsl #27
c0de1738:	f8dd a02c 	ldr.w	sl, [sp, #44]	@ 0x2c
c0de173c:	ea41 1154 	orr.w	r1, r1, r4, lsr #5
c0de1740:	935b      	str	r3, [sp, #364]	@ 0x16c
c0de1742:	9c2b      	ldr	r4, [sp, #172]	@ 0xac
c0de1744:	9148      	str	r1, [sp, #288]	@ 0x120
c0de1746:	4399      	bics	r1, r3
c0de1748:	4051      	eors	r1, r2
c0de174a:	4048      	eors	r0, r1
c0de174c:	9125      	str	r1, [sp, #148]	@ 0x94
c0de174e:	9928      	ldr	r1, [sp, #160]	@ 0xa0
c0de1750:	904a      	str	r0, [sp, #296]	@ 0x128
c0de1752:	0040      	lsls	r0, r0, #1
c0de1754:	ea40 70dc 	orr.w	r0, r0, ip, lsr #31
c0de1758:	f8dd c0a8 	ldr.w	ip, [sp, #168]	@ 0xa8
c0de175c:	905c      	str	r0, [sp, #368]	@ 0x170
c0de175e:	9849      	ldr	r0, [sp, #292]	@ 0x124
c0de1760:	4041      	eors	r1, r0
c0de1762:	9841      	ldr	r0, [sp, #260]	@ 0x104
c0de1764:	915a      	str	r1, [sp, #360]	@ 0x168
c0de1766:	ea80 000a 	eor.w	r0, r0, sl
c0de176a:	9011      	str	r0, [sp, #68]	@ 0x44
c0de176c:	02c0      	lsls	r0, r0, #11
c0de176e:	ea40 5051 	orr.w	r0, r0, r1, lsr #21
c0de1772:	9932      	ldr	r1, [sp, #200]	@ 0xc8
c0de1774:	9049      	str	r0, [sp, #292]	@ 0x124
c0de1776:	ea27 0000 	bic.w	r0, r7, r0
c0de177a:	9f2d      	ldr	r7, [sp, #180]	@ 0xb4
c0de177c:	ea87 0201 	eor.w	r2, r7, r1
c0de1780:	9931      	ldr	r1, [sp, #196]	@ 0xc4
c0de1782:	9232      	str	r2, [sp, #200]	@ 0xc8
c0de1784:	4069      	eors	r1, r5
c0de1786:	9110      	str	r1, [sp, #64]	@ 0x40
c0de1788:	0309      	lsls	r1, r1, #12
c0de178a:	ea41 5112 	orr.w	r1, r1, r2, lsr #20
c0de178e:	ea81 0300 	eor.w	r3, r1, r0
c0de1792:	9840      	ldr	r0, [sp, #256]	@ 0x100
c0de1794:	9147      	str	r1, [sp, #284]	@ 0x11c
c0de1796:	9341      	str	r3, [sp, #260]	@ 0x104
c0de1798:	ea84 0100 	eor.w	r1, r4, r0
c0de179c:	9846      	ldr	r0, [sp, #280]	@ 0x118
c0de179e:	910f      	str	r1, [sp, #60]	@ 0x3c
c0de17a0:	ea80 0008 	eor.w	r0, r0, r8
c0de17a4:	900c      	str	r0, [sp, #48]	@ 0x30
c0de17a6:	00c0      	lsls	r0, r0, #3
c0de17a8:	ea40 7051 	orr.w	r0, r0, r1, lsr #29
c0de17ac:	993c      	ldr	r1, [sp, #240]	@ 0xf0
c0de17ae:	9046      	str	r0, [sp, #280]	@ 0x118
c0de17b0:	ea21 0600 	bic.w	r6, r1, r0
c0de17b4:	9939      	ldr	r1, [sp, #228]	@ 0xe4
c0de17b6:	ea8e 0201 	eor.w	r2, lr, r1
c0de17ba:	993b      	ldr	r1, [sp, #236]	@ 0xec
c0de17bc:	9239      	str	r2, [sp, #228]	@ 0xe4
c0de17be:	ea8c 0001 	eor.w	r0, ip, r1
c0de17c2:	0501      	lsls	r1, r0, #20
c0de17c4:	903b      	str	r0, [sp, #236]	@ 0xec
c0de17c6:	ea41 3112 	orr.w	r1, r1, r2, lsr #12
c0de17ca:	ea81 0006 	eor.w	r0, r1, r6
c0de17ce:	9142      	str	r1, [sp, #264]	@ 0x108
c0de17d0:	9944      	ldr	r1, [sp, #272]	@ 0x110
c0de17d2:	9e49      	ldr	r6, [sp, #292]	@ 0x124
c0de17d4:	9022      	str	r0, [sp, #136]	@ 0x88
c0de17d6:	4058      	eors	r0, r3
c0de17d8:	ea85 0201 	eor.w	r2, r5, r1
c0de17dc:	994b      	ldr	r1, [sp, #300]	@ 0x12c
c0de17de:	9219      	str	r2, [sp, #100]	@ 0x64
c0de17e0:	4079      	eors	r1, r7
c0de17e2:	9f2c      	ldr	r7, [sp, #176]	@ 0xb0
c0de17e4:	9109      	str	r1, [sp, #36]	@ 0x24
c0de17e6:	0289      	lsls	r1, r1, #10
c0de17e8:	ea41 5192 	orr.w	r1, r1, r2, lsr #22
c0de17ec:	9a3d      	ldr	r2, [sp, #244]	@ 0xf4
c0de17ee:	914b      	str	r1, [sp, #300]	@ 0x12c
c0de17f0:	ea2b 0101 	bic.w	r1, fp, r1
c0de17f4:	ea88 0302 	eor.w	r3, r8, r2
c0de17f8:	9a33      	ldr	r2, [sp, #204]	@ 0xcc
c0de17fa:	9308      	str	r3, [sp, #32]
c0de17fc:	4062      	eors	r2, r4
c0de17fe:	9c28      	ldr	r4, [sp, #160]	@ 0xa0
c0de1800:	9233      	str	r2, [sp, #204]	@ 0xcc
c0de1802:	0112      	lsls	r2, r2, #4
c0de1804:	ea42 7213 	orr.w	r2, r2, r3, lsr #28
c0de1808:	9b13      	ldr	r3, [sp, #76]	@ 0x4c
c0de180a:	4051      	eors	r1, r2
c0de180c:	9244      	str	r2, [sp, #272]	@ 0x110
c0de180e:	913d      	str	r1, [sp, #244]	@ 0xf4
c0de1810:	4048      	eors	r0, r1
c0de1812:	994e      	ldr	r1, [sp, #312]	@ 0x138
c0de1814:	ea83 0201 	eor.w	r2, r3, r1
c0de1818:	9952      	ldr	r1, [sp, #328]	@ 0x148
c0de181a:	9206      	str	r2, [sp, #24]
c0de181c:	4079      	eors	r1, r7
c0de181e:	9105      	str	r1, [sp, #20]
c0de1820:	0649      	lsls	r1, r1, #25
c0de1822:	ea41 12d2 	orr.w	r2, r1, r2, lsr #7
c0de1826:	993f      	ldr	r1, [sp, #252]	@ 0xfc
c0de1828:	924e      	str	r2, [sp, #312]	@ 0x138
c0de182a:	4391      	bics	r1, r2
c0de182c:	9a37      	ldr	r2, [sp, #220]	@ 0xdc
c0de182e:	ea8a 0502 	eor.w	r5, sl, r2
c0de1832:	9a38      	ldr	r2, [sp, #224]	@ 0xe0
c0de1834:	9537      	str	r5, [sp, #220]	@ 0xdc
c0de1836:	4062      	eors	r2, r4
c0de1838:	9228      	str	r2, [sp, #160]	@ 0xa0
c0de183a:	0192      	lsls	r2, r2, #6
c0de183c:	ea42 6295 	orr.w	r2, r2, r5, lsr #26
c0de1840:	9d28      	ldr	r5, [sp, #160]	@ 0xa0
c0de1842:	4051      	eors	r1, r2
c0de1844:	9252      	str	r2, [sp, #328]	@ 0x148
c0de1846:	ea80 0201 	eor.w	r2, r0, r1
c0de184a:	9855      	ldr	r0, [sp, #340]	@ 0x154
c0de184c:	9140      	str	r1, [sp, #256]	@ 0x100
c0de184e:	ea8c 0400 	eor.w	r4, ip, r0
c0de1852:	9850      	ldr	r0, [sp, #320]	@ 0x140
c0de1854:	940b      	str	r4, [sp, #44]	@ 0x2c
c0de1856:	ea80 000e 	eor.w	r0, r0, lr
c0de185a:	01c1      	lsls	r1, r0, #7
c0de185c:	902a      	str	r0, [sp, #168]	@ 0xa8
c0de185e:	9830      	ldr	r0, [sp, #192]	@ 0xc0
c0de1860:	ea41 6154 	orr.w	r1, r1, r4, lsr #25
c0de1864:	9c10      	ldr	r4, [sp, #64]	@ 0x40
c0de1866:	9155      	str	r1, [sp, #340]	@ 0x154
c0de1868:	4388      	bics	r0, r1
c0de186a:	994c      	ldr	r1, [sp, #304]	@ 0x130
c0de186c:	ea87 0e01 	eor.w	lr, r7, r1
c0de1870:	9945      	ldr	r1, [sp, #276]	@ 0x114
c0de1872:	9f33      	ldr	r7, [sp, #204]	@ 0xcc
c0de1874:	ea83 0b01 	eor.w	fp, r3, r1
c0de1878:	ea4f 5acb 	mov.w	sl, fp, lsl #23
c0de187c:	ea4a 215e 	orr.w	r1, sl, lr, lsr #9
c0de1880:	4048      	eors	r0, r1
c0de1882:	9150      	str	r1, [sp, #320]	@ 0x140
c0de1884:	995c      	ldr	r1, [sp, #368]	@ 0x170
c0de1886:	902c      	str	r0, [sp, #176]	@ 0xb0
c0de1888:	4050      	eors	r0, r2
c0de188a:	ea81 0200 	eor.w	r2, r1, r0
c0de188e:	902d      	str	r0, [sp, #180]	@ 0xb4
c0de1890:	982e      	ldr	r0, [sp, #184]	@ 0xb8
c0de1892:	990d      	ldr	r1, [sp, #52]	@ 0x34
c0de1894:	925c      	str	r2, [sp, #368]	@ 0x170
c0de1896:	4388      	bics	r0, r1
c0de1898:	9911      	ldr	r1, [sp, #68]	@ 0x44
c0de189a:	4070      	eors	r0, r6
c0de189c:	9e09      	ldr	r6, [sp, #36]	@ 0x24
c0de189e:	ea82 0a00 	eor.w	sl, r2, r0
c0de18a2:	9031      	str	r0, [sp, #196]	@ 0xc4
c0de18a4:	984d      	ldr	r0, [sp, #308]	@ 0x134
c0de18a6:	9a4a      	ldr	r2, [sp, #296]	@ 0x128
c0de18a8:	f8cd a034 	str.w	sl, [sp, #52]	@ 0x34
c0de18ac:	0040      	lsls	r0, r0, #1
c0de18ae:	ea40 70d2 	orr.w	r0, r0, r2, lsr #31
c0de18b2:	9a32      	ldr	r2, [sp, #200]	@ 0xc8
c0de18b4:	904c      	str	r0, [sp, #304]	@ 0x130
c0de18b6:	985a      	ldr	r0, [sp, #360]	@ 0x168
c0de18b8:	0312      	lsls	r2, r2, #12
c0de18ba:	02c0      	lsls	r0, r0, #11
c0de18bc:	ea42 5c14 	orr.w	ip, r2, r4, lsr #20
c0de18c0:	9a0c      	ldr	r2, [sp, #48]	@ 0x30
c0de18c2:	9c3b      	ldr	r4, [sp, #236]	@ 0xec
c0de18c4:	ea40 5351 	orr.w	r3, r0, r1, lsr #21
c0de18c8:	9918      	ldr	r1, [sp, #96]	@ 0x60
c0de18ca:	f8cd c01c 	str.w	ip, [sp, #28]
c0de18ce:	930a      	str	r3, [sp, #40]	@ 0x28
c0de18d0:	ea21 0003 	bic.w	r0, r1, r3
c0de18d4:	ea8c 0800 	eor.w	r8, ip, r0
c0de18d8:	980f      	ldr	r0, [sp, #60]	@ 0x3c
c0de18da:	f8cd 80e0 	str.w	r8, [sp, #224]	@ 0xe0
c0de18de:	00c0      	lsls	r0, r0, #3
c0de18e0:	ea40 7252 	orr.w	r2, r0, r2, lsr #29
c0de18e4:	9843      	ldr	r0, [sp, #268]	@ 0x10c
c0de18e6:	922f      	str	r2, [sp, #188]	@ 0xbc
c0de18e8:	4390      	bics	r0, r2
c0de18ea:	9a39      	ldr	r2, [sp, #228]	@ 0xe4
c0de18ec:	0512      	lsls	r2, r2, #20
c0de18ee:	ea42 3414 	orr.w	r4, r2, r4, lsr #12
c0de18f2:	9a19      	ldr	r2, [sp, #100]	@ 0x64
c0de18f4:	4060      	eors	r0, r4
c0de18f6:	9404      	str	r4, [sp, #16]
c0de18f8:	0292      	lsls	r2, r2, #10
c0de18fa:	902b      	str	r0, [sp, #172]	@ 0xac
c0de18fc:	ea80 0008 	eor.w	r0, r0, r8
c0de1900:	ea42 5696 	orr.w	r6, r2, r6, lsr #22
c0de1904:	9a59      	ldr	r2, [sp, #356]	@ 0x164
c0de1906:	9609      	str	r6, [sp, #36]	@ 0x24
c0de1908:	43b2      	bics	r2, r6
c0de190a:	9e08      	ldr	r6, [sp, #32]
c0de190c:	0136      	lsls	r6, r6, #4
c0de190e:	ea46 7717 	orr.w	r7, r6, r7, lsr #28
c0de1912:	9e05      	ldr	r6, [sp, #20]
c0de1914:	407a      	eors	r2, r7
c0de1916:	9701      	str	r7, [sp, #4]
c0de1918:	9245      	str	r2, [sp, #276]	@ 0x114
c0de191a:	4050      	eors	r0, r2
c0de191c:	9a06      	ldr	r2, [sp, #24]
c0de191e:	0652      	lsls	r2, r2, #25
c0de1920:	ea42 16d6 	orr.w	r6, r2, r6, lsr #7
c0de1924:	9a34      	ldr	r2, [sp, #208]	@ 0xd0
c0de1926:	9633      	str	r6, [sp, #204]	@ 0xcc
c0de1928:	43b2      	bics	r2, r6
c0de192a:	9e37      	ldr	r6, [sp, #220]	@ 0xdc
c0de192c:	01b6      	lsls	r6, r6, #6
c0de192e:	ea46 6695 	orr.w	r6, r6, r5, lsr #26
c0de1932:	4072      	eors	r2, r6
c0de1934:	9603      	str	r6, [sp, #12]
c0de1936:	ea80 0802 	eor.w	r8, r0, r2
c0de193a:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de193c:	9219      	str	r2, [sp, #100]	@ 0x64
c0de193e:	9a2a      	ldr	r2, [sp, #168]	@ 0xa8
c0de1940:	01c0      	lsls	r0, r0, #7
c0de1942:	ea40 6252 	orr.w	r2, r0, r2, lsr #25
c0de1946:	9836      	ldr	r0, [sp, #216]	@ 0xd8
c0de1948:	9208      	str	r2, [sp, #32]
c0de194a:	ea20 0502 	bic.w	r5, r0, r2
c0de194e:	ea4f 50ce 	mov.w	r0, lr, lsl #23
c0de1952:	ea40 225b 	orr.w	r2, r0, fp, lsr #9
c0de1956:	f8dd b070 	ldr.w	fp, [sp, #112]	@ 0x70
c0de195a:	ea85 0002 	eor.w	r0, r5, r2
c0de195e:	9d1e      	ldr	r5, [sp, #120]	@ 0x78
c0de1960:	4696      	mov	lr, r2
c0de1962:	e9cd 200b 	strd	r2, r0, [sp, #44]	@ 0x2c
c0de1966:	9a4c      	ldr	r2, [sp, #304]	@ 0x130
c0de1968:	ea80 0008 	eor.w	r0, r0, r8
c0de196c:	f8dd 8054 	ldr.w	r8, [sp, #84]	@ 0x54
c0de1970:	ea25 0101 	bic.w	r1, r5, r1
c0de1974:	9010      	str	r0, [sp, #64]	@ 0x40
c0de1976:	4050      	eors	r0, r2
c0de1978:	4059      	eors	r1, r3
c0de197a:	905a      	str	r0, [sp, #360]	@ 0x168
c0de197c:	4048      	eors	r0, r1
c0de197e:	9105      	str	r1, [sp, #20]
c0de1980:	9912      	ldr	r1, [sp, #72]	@ 0x48
c0de1982:	0782      	lsls	r2, r0, #30
c0de1984:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de1986:	ea42 009a 	orr.w	r0, r2, sl, lsr #2
c0de198a:	9a4f      	ldr	r2, [sp, #316]	@ 0x13c
c0de198c:	f8dd a068 	ldr.w	sl, [sp, #104]	@ 0x68
c0de1990:	904c      	str	r0, [sp, #304]	@ 0x130
c0de1992:	983e      	ldr	r0, [sp, #248]	@ 0xf8
c0de1994:	ea2e 0202 	bic.w	r2, lr, r2
c0de1998:	ea80 0302 	eor.w	r3, r0, r2
c0de199c:	9a56      	ldr	r2, [sp, #344]	@ 0x158
c0de199e:	9329      	str	r3, [sp, #164]	@ 0xa4
c0de19a0:	ea2c 0202 	bic.w	r2, ip, r2
c0de19a4:	ea85 0002 	eor.w	r0, r5, r2
c0de19a8:	9d47      	ldr	r5, [sp, #284]	@ 0x11c
c0de19aa:	ea80 0203 	eor.w	r2, r0, r3
c0de19ae:	9b57      	ldr	r3, [sp, #348]	@ 0x15c
c0de19b0:	9013      	str	r0, [sp, #76]	@ 0x4c
c0de19b2:	ea26 0303 	bic.w	r3, r6, r3
c0de19b6:	9e44      	ldr	r6, [sp, #272]	@ 0x110
c0de19b8:	ea83 000b 	eor.w	r0, r3, fp
c0de19bc:	9b3a      	ldr	r3, [sp, #232]	@ 0xe8
c0de19be:	902a      	str	r0, [sp, #168]	@ 0xa8
c0de19c0:	4042      	eors	r2, r0
c0de19c2:	9835      	ldr	r0, [sp, #212]	@ 0xd4
c0de19c4:	ea24 0303 	bic.w	r3, r4, r3
c0de19c8:	9c14      	ldr	r4, [sp, #80]	@ 0x50
c0de19ca:	ea83 030a 	eor.w	r3, r3, sl
c0de19ce:	933b      	str	r3, [sp, #236]	@ 0xec
c0de19d0:	405a      	eors	r2, r3
c0de19d2:	ea27 0300 	bic.w	r3, r7, r0
c0de19d6:	9850      	ldr	r0, [sp, #320]	@ 0x140
c0de19d8:	ea83 0308 	eor.w	r3, r3, r8
c0de19dc:	ea82 0c03 	eor.w	ip, r2, r3
c0de19e0:	9a53      	ldr	r2, [sp, #332]	@ 0x14c
c0de19e2:	9332      	str	r3, [sp, #200]	@ 0xc8
c0de19e4:	4667      	mov	r7, ip
c0de19e6:	f8cd c018 	str.w	ip, [sp, #24]
c0de19ea:	ea20 0202 	bic.w	r2, r0, r2
c0de19ee:	982e      	ldr	r0, [sp, #184]	@ 0xb8
c0de19f0:	ea81 0302 	eor.w	r3, r1, r2
c0de19f4:	9a51      	ldr	r2, [sp, #324]	@ 0x144
c0de19f6:	931e      	str	r3, [sp, #120]	@ 0x78
c0de19f8:	ea25 0202 	bic.w	r2, r5, r2
c0de19fc:	9d42      	ldr	r5, [sp, #264]	@ 0x108
c0de19fe:	4050      	eors	r0, r2
c0de1a00:	ea80 0203 	eor.w	r2, r0, r3
c0de1a04:	9011      	str	r0, [sp, #68]	@ 0x44
c0de1a06:	9b54      	ldr	r3, [sp, #336]	@ 0x150
c0de1a08:	9852      	ldr	r0, [sp, #328]	@ 0x148
c0de1a0a:	ea20 0303 	bic.w	r3, r0, r3
c0de1a0e:	4063      	eors	r3, r4
c0de1a10:	932e      	str	r3, [sp, #184]	@ 0xb8
c0de1a12:	405a      	eors	r2, r3
c0de1a14:	9b58      	ldr	r3, [sp, #352]	@ 0x160
c0de1a16:	ea25 0303 	bic.w	r3, r5, r3
c0de1a1a:	9d16      	ldr	r5, [sp, #88]	@ 0x58
c0de1a1c:	406b      	eors	r3, r5
c0de1a1e:	9339      	str	r3, [sp, #228]	@ 0xe4
c0de1a20:	405a      	eors	r2, r3
c0de1a22:	9b48      	ldr	r3, [sp, #288]	@ 0x120
c0de1a24:	ea26 0303 	bic.w	r3, r6, r3
c0de1a28:	9e5b      	ldr	r6, [sp, #364]	@ 0x16c
c0de1a2a:	4073      	eors	r3, r6
c0de1a2c:	ea82 0003 	eor.w	r0, r2, r3
c0de1a30:	9318      	str	r3, [sp, #96]	@ 0x60
c0de1a32:	9b3c      	ldr	r3, [sp, #240]	@ 0xf0
c0de1a34:	0042      	lsls	r2, r0, #1
c0de1a36:	9002      	str	r0, [sp, #8]
c0de1a38:	ea25 0303 	bic.w	r3, r5, r3
c0de1a3c:	9d46      	ldr	r5, [sp, #280]	@ 0x118
c0de1a3e:	ea42 72dc 	orr.w	r2, r2, ip, lsr #31
c0de1a42:	f8dd c12c 	ldr.w	ip, [sp, #300]	@ 0x12c
c0de1a46:	405d      	eors	r5, r3
c0de1a48:	9b0e      	ldr	r3, [sp, #56]	@ 0x38
c0de1a4a:	9516      	str	r5, [sp, #88]	@ 0x58
c0de1a4c:	ea26 0303 	bic.w	r3, r6, r3
c0de1a50:	9e09      	ldr	r6, [sp, #36]	@ 0x24
c0de1a52:	ea83 030c 	eor.w	r3, r3, ip
c0de1a56:	933c      	str	r3, [sp, #240]	@ 0xf0
c0de1a58:	406b      	eors	r3, r5
c0de1a5a:	9d30      	ldr	r5, [sp, #192]	@ 0xc0
c0de1a5c:	ea21 0505 	bic.w	r5, r1, r5
c0de1a60:	9955      	ldr	r1, [sp, #340]	@ 0x154
c0de1a62:	404d      	eors	r5, r1
c0de1a64:	9931      	ldr	r1, [sp, #196]	@ 0xc4
c0de1a66:	406b      	eors	r3, r5
c0de1a68:	9537      	str	r5, [sp, #220]	@ 0xdc
c0de1a6a:	9d3f      	ldr	r5, [sp, #252]	@ 0xfc
c0de1a6c:	404b      	eors	r3, r1
c0de1a6e:	994e      	ldr	r1, [sp, #312]	@ 0x138
c0de1a70:	ea24 0505 	bic.w	r5, r4, r5
c0de1a74:	9c08      	ldr	r4, [sp, #32]
c0de1a76:	404d      	eors	r5, r1
c0de1a78:	ea83 0e05 	eor.w	lr, r3, r5
c0de1a7c:	9b17      	ldr	r3, [sp, #92]	@ 0x5c
c0de1a7e:	9528      	str	r5, [sp, #160]	@ 0xa0
c0de1a80:	9d2f      	ldr	r5, [sp, #188]	@ 0xbc
c0de1a82:	ea82 020e 	eor.w	r2, r2, lr
c0de1a86:	ea82 0c03 	eor.w	ip, r2, r3
c0de1a8a:	9b59      	ldr	r3, [sp, #356]	@ 0x164
c0de1a8c:	925b      	str	r2, [sp, #364]	@ 0x16c
c0de1a8e:	007a      	lsls	r2, r7, #1
c0de1a90:	ea42 72d0 	orr.w	r2, r2, r0, lsr #31
c0de1a94:	ea28 0303 	bic.w	r3, r8, r3
c0de1a98:	ea86 0103 	eor.w	r1, r6, r3
c0de1a9c:	9b43      	ldr	r3, [sp, #268]	@ 0x10c
c0de1a9e:	913f      	str	r1, [sp, #252]	@ 0xfc
c0de1aa0:	ea2a 0303 	bic.w	r3, sl, r3
c0de1aa4:	f8dd a130 	ldr.w	sl, [sp, #304]	@ 0x130
c0de1aa8:	ea83 0005 	eor.w	r0, r3, r5
c0de1aac:	ea80 0301 	eor.w	r3, r0, r1
c0de1ab0:	9015      	str	r0, [sp, #84]	@ 0x54
c0de1ab2:	9836      	ldr	r0, [sp, #216]	@ 0xd8
c0de1ab4:	993e      	ldr	r1, [sp, #248]	@ 0xf8
c0de1ab6:	ea21 0700 	bic.w	r7, r1, r0
c0de1aba:	9805      	ldr	r0, [sp, #20]
c0de1abc:	ea84 0107 	eor.w	r1, r4, r7
c0de1ac0:	9f33      	ldr	r7, [sp, #204]	@ 0xcc
c0de1ac2:	404b      	eors	r3, r1
c0de1ac4:	9131      	str	r1, [sp, #196]	@ 0xc4
c0de1ac6:	ea83 0100 	eor.w	r1, r3, r0
c0de1aca:	9b34      	ldr	r3, [sp, #208]	@ 0xd0
c0de1acc:	ea2b 0303 	bic.w	r3, fp, r3
c0de1ad0:	407b      	eors	r3, r7
c0de1ad2:	ea81 0b03 	eor.w	fp, r1, r3
c0de1ad6:	931c      	str	r3, [sp, #112]	@ 0x70
c0de1ad8:	9957      	ldr	r1, [sp, #348]	@ 0x15c
c0de1ada:	ea82 000b 	eor.w	r0, r2, fp
c0de1ade:	9a1b      	ldr	r2, [sp, #108]	@ 0x6c
c0de1ae0:	9059      	str	r0, [sp, #356]	@ 0x164
c0de1ae2:	ea80 0802 	eor.w	r8, r0, r2
c0de1ae6:	ea4f 52c8 	mov.w	r2, r8, lsl #23
c0de1aea:	ea42 205c 	orr.w	r0, r2, ip, lsr #9
c0de1aee:	ea4f 024b 	mov.w	r2, fp, lsl #1
c0de1af2:	9036      	str	r0, [sp, #216]	@ 0xd8
c0de1af4:	ea20 000a 	bic.w	r0, r0, sl
c0de1af8:	ea42 72de 	orr.w	r2, r2, lr, lsr #31
c0de1afc:	9034      	str	r0, [sp, #208]	@ 0xd0
c0de1afe:	9803      	ldr	r0, [sp, #12]
c0de1b00:	ea27 0300 	bic.w	r3, r7, r0
c0de1b04:	9801      	ldr	r0, [sp, #4]
c0de1b06:	4059      	eors	r1, r3
c0de1b08:	ea26 0300 	bic.w	r3, r6, r0
c0de1b0c:	9835      	ldr	r0, [sp, #212]	@ 0xd4
c0de1b0e:	9133      	str	r1, [sp, #204]	@ 0xcc
c0de1b10:	4058      	eors	r0, r3
c0de1b12:	9b07      	ldr	r3, [sp, #28]
c0de1b14:	ea80 0601 	eor.w	r6, r0, r1
c0de1b18:	9043      	str	r0, [sp, #268]	@ 0x10c
c0de1b1a:	9804      	ldr	r0, [sp, #16]
c0de1b1c:	993a      	ldr	r1, [sp, #232]	@ 0xe8
c0de1b1e:	ea25 0700 	bic.w	r7, r5, r0
c0de1b22:	ea87 0001 	eor.w	r0, r7, r1
c0de1b26:	994f      	ldr	r1, [sp, #316]	@ 0x13c
c0de1b28:	903e      	str	r0, [sp, #248]	@ 0xf8
c0de1b2a:	4046      	eors	r6, r0
c0de1b2c:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de1b2e:	ea24 0000 	bic.w	r0, r4, r0
c0de1b32:	4048      	eors	r0, r1
c0de1b34:	990a      	ldr	r1, [sp, #40]	@ 0x28
c0de1b36:	9014      	str	r0, [sp, #80]	@ 0x50
c0de1b38:	4070      	eors	r0, r6
c0de1b3a:	ea21 0403 	bic.w	r4, r1, r3
c0de1b3e:	9956      	ldr	r1, [sp, #344]	@ 0x158
c0de1b40:	9b44      	ldr	r3, [sp, #272]	@ 0x110
c0de1b42:	404c      	eors	r4, r1
c0de1b44:	995d      	ldr	r1, [sp, #372]	@ 0x174
c0de1b46:	e951 6702 	ldrd	r6, r7, [r1, #-8]
c0de1b4a:	ea84 0106 	eor.w	r1, r4, r6
c0de1b4e:	9e10      	ldr	r6, [sp, #64]	@ 0x40
c0de1b50:	4048      	eors	r0, r1
c0de1b52:	911b      	str	r1, [sp, #108]	@ 0x6c
c0de1b54:	990c      	ldr	r1, [sp, #48]	@ 0x30
c0de1b56:	904f      	str	r0, [sp, #316]	@ 0x13c
c0de1b58:	4050      	eors	r0, r2
c0de1b5a:	ea4f 024e 	mov.w	r2, lr, lsl #1
c0de1b5e:	f8dd e0b4 	ldr.w	lr, [sp, #180]	@ 0xb4
c0de1b62:	ea42 74db 	orr.w	r4, r2, fp, lsr #31
c0de1b66:	902f      	str	r0, [sp, #188]	@ 0xbc
c0de1b68:	4041      	eors	r1, r0
c0de1b6a:	9852      	ldr	r0, [sp, #328]	@ 0x148
c0de1b6c:	9a4e      	ldr	r2, [sp, #312]	@ 0x138
c0de1b6e:	4382      	bics	r2, r0
c0de1b70:	9854      	ldr	r0, [sp, #336]	@ 0x150
c0de1b72:	4050      	eors	r0, r2
c0de1b74:	9a4b      	ldr	r2, [sp, #300]	@ 0x12c
c0de1b76:	9017      	str	r0, [sp, #92]	@ 0x5c
c0de1b78:	439a      	bics	r2, r3
c0de1b7a:	9b48      	ldr	r3, [sp, #288]	@ 0x120
c0de1b7c:	ea83 0b02 	eor.w	fp, r3, r2
c0de1b80:	9b42      	ldr	r3, [sp, #264]	@ 0x108
c0de1b82:	ea8b 0200 	eor.w	r2, fp, r0
c0de1b86:	9846      	ldr	r0, [sp, #280]	@ 0x118
c0de1b88:	ea20 0503 	bic.w	r5, r0, r3
c0de1b8c:	9858      	ldr	r0, [sp, #352]	@ 0x160
c0de1b8e:	9b50      	ldr	r3, [sp, #320]	@ 0x140
c0de1b90:	4068      	eors	r0, r5
c0de1b92:	9052      	str	r0, [sp, #328]	@ 0x148
c0de1b94:	4042      	eors	r2, r0
c0de1b96:	9855      	ldr	r0, [sp, #340]	@ 0x154
c0de1b98:	ea20 0503 	bic.w	r5, r0, r3
c0de1b9c:	9853      	ldr	r0, [sp, #332]	@ 0x14c
c0de1b9e:	9b47      	ldr	r3, [sp, #284]	@ 0x11c
c0de1ba0:	4068      	eors	r0, r5
c0de1ba2:	9055      	str	r0, [sp, #340]	@ 0x154
c0de1ba4:	4042      	eors	r2, r0
c0de1ba6:	9849      	ldr	r0, [sp, #292]	@ 0x124
c0de1ba8:	ea20 0503 	bic.w	r5, r0, r3
c0de1bac:	9851      	ldr	r0, [sp, #324]	@ 0x144
c0de1bae:	9b2c      	ldr	r3, [sp, #176]	@ 0xb0
c0de1bb0:	4045      	eors	r5, r0
c0de1bb2:	ea85 0007 	eor.w	r0, r5, r7
c0de1bb6:	4042      	eors	r2, r0
c0de1bb8:	901a      	str	r0, [sp, #104]	@ 0x68
c0de1bba:	ea82 0004 	eor.w	r0, r2, r4
c0de1bbe:	ea80 0703 	eor.w	r7, r0, r3
c0de1bc2:	9b34      	ldr	r3, [sp, #208]	@ 0xd0
c0de1bc4:	9057      	str	r0, [sp, #348]	@ 0x15c
c0de1bc6:	00bc      	lsls	r4, r7, #2
c0de1bc8:	ea44 7091 	orr.w	r0, r4, r1, lsr #30
c0de1bcc:	ea4f 54cc 	mov.w	r4, ip, lsl #23
c0de1bd0:	0089      	lsls	r1, r1, #2
c0de1bd2:	4043      	eors	r3, r0
c0de1bd4:	ea44 2858 	orr.w	r8, r4, r8, lsr #9
c0de1bd8:	ea41 7797 	orr.w	r7, r1, r7, lsr #30
c0de1bdc:	9356      	str	r3, [sp, #344]	@ 0x158
c0de1bde:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
c0de1be0:	079d      	lsls	r5, r3, #30
c0de1be2:	9b0f      	ldr	r3, [sp, #60]	@ 0x3c
c0de1be4:	ea45 0c93 	orr.w	ip, r5, r3, lsr #2
c0de1be8:	9b02      	ldr	r3, [sp, #8]
c0de1bea:	9d06      	ldr	r5, [sp, #24]
c0de1bec:	ea28 040c 	bic.w	r4, r8, ip
c0de1bf0:	ea87 0104 	eor.w	r1, r7, r4
c0de1bf4:	ea4f 044e 	mov.w	r4, lr, lsl #1
c0de1bf8:	ea44 74d6 	orr.w	r4, r4, r6, lsr #31
c0de1bfc:	9153      	str	r1, [sp, #332]	@ 0x14c
c0de1bfe:	ea2a 0100 	bic.w	r1, sl, r0
c0de1c02:	ea83 0a04 	eor.w	sl, r3, r4
c0de1c06:	0073      	lsls	r3, r6, #1
c0de1c08:	ea43 73de 	orr.w	r3, r3, lr, lsr #31
c0de1c0c:	ea8a 040b 	eor.w	r4, sl, fp
c0de1c10:	f8cd a0c0 	str.w	sl, [sp, #192]	@ 0xc0
c0de1c14:	ea85 0b03 	eor.w	fp, r5, r3
c0de1c18:	9b43      	ldr	r3, [sp, #268]	@ 0x10c
c0de1c1a:	9d4f      	ldr	r5, [sp, #316]	@ 0x13c
c0de1c1c:	f8cd b160 	str.w	fp, [sp, #352]	@ 0x160
c0de1c20:	ea83 030b 	eor.w	r3, r3, fp
c0de1c24:	025e      	lsls	r6, r3, #9
c0de1c26:	ea46 56d4 	orr.w	r6, r6, r4, lsr #23
c0de1c2a:	0264      	lsls	r4, r4, #9
c0de1c2c:	4071      	eors	r1, r6
c0de1c2e:	ea44 53d3 	orr.w	r3, r4, r3, lsr #23
c0de1c32:	ea20 0406 	bic.w	r4, r0, r6
c0de1c36:	0050      	lsls	r0, r2, #1
c0de1c38:	9154      	str	r1, [sp, #336]	@ 0x150
c0de1c3a:	ea2c 0107 	bic.w	r1, ip, r7
c0de1c3e:	ea40 70d5 	orr.w	r0, r0, r5, lsr #31
c0de1c42:	4059      	eors	r1, r3
c0de1c44:	9151      	str	r1, [sp, #324]	@ 0x144
c0de1c46:	994a      	ldr	r1, [sp, #296]	@ 0x128
c0de1c48:	ea80 0e01 	eor.w	lr, r0, r1
c0de1c4c:	0068      	lsls	r0, r5, #1
c0de1c4e:	992e      	ldr	r1, [sp, #184]	@ 0xb8
c0de1c50:	ea40 70d2 	orr.w	r0, r0, r2, lsr #31
c0de1c54:	9a4d      	ldr	r2, [sp, #308]	@ 0x134
c0de1c56:	f8cd e0b4 	str.w	lr, [sp, #180]	@ 0xb4
c0de1c5a:	ea81 010e 	eor.w	r1, r1, lr
c0de1c5e:	4050      	eors	r0, r2
c0de1c60:	9a2a      	ldr	r2, [sp, #168]	@ 0xa8
c0de1c62:	4605      	mov	r5, r0
c0de1c64:	902e      	str	r0, [sp, #184]	@ 0xb8
c0de1c66:	4042      	eors	r2, r0
c0de1c68:	01d0      	lsls	r0, r2, #7
c0de1c6a:	ea40 6051 	orr.w	r0, r0, r1, lsr #25
c0de1c6e:	01c9      	lsls	r1, r1, #7
c0de1c70:	4044      	eors	r4, r0
c0de1c72:	ea41 6152 	orr.w	r1, r1, r2, lsr #25
c0de1c76:	944d      	str	r4, [sp, #308]	@ 0x134
c0de1c78:	ea27 0403 	bic.w	r4, r7, r3
c0de1c7c:	ea81 0204 	eor.w	r2, r1, r4
c0de1c80:	9c36      	ldr	r4, [sp, #216]	@ 0xd8
c0de1c82:	9243      	str	r2, [sp, #268]	@ 0x10c
c0de1c84:	ea26 0200 	bic.w	r2, r6, r0
c0de1c88:	4062      	eors	r2, r4
c0de1c8a:	43a0      	bics	r0, r4
c0de1c8c:	9c5b      	ldr	r4, [sp, #364]	@ 0x16c
c0de1c8e:	924f      	str	r2, [sp, #316]	@ 0x13c
c0de1c90:	ea23 0201 	bic.w	r2, r3, r1
c0de1c94:	ea82 0208 	eor.w	r2, r2, r8
c0de1c98:	9248      	str	r2, [sp, #288]	@ 0x120
c0de1c9a:	9a4c      	ldr	r2, [sp, #304]	@ 0x130
c0de1c9c:	4050      	eors	r0, r2
c0de1c9e:	902c      	str	r0, [sp, #176]	@ 0xb0
c0de1ca0:	ea21 0008 	bic.w	r0, r1, r8
c0de1ca4:	9911      	ldr	r1, [sp, #68]	@ 0x44
c0de1ca6:	f8dd 8170 	ldr.w	r8, [sp, #368]	@ 0x170
c0de1caa:	ea80 000c 	eor.w	r0, r0, ip
c0de1cae:	902a      	str	r0, [sp, #168]	@ 0xa8
c0de1cb0:	9813      	ldr	r0, [sp, #76]	@ 0x4c
c0de1cb2:	ea8e 0c01 	eor.w	ip, lr, r1
c0de1cb6:	f8dd e168 	ldr.w	lr, [sp, #360]	@ 0x168
c0de1cba:	ea4f 62cc 	mov.w	r2, ip, lsl #27
c0de1cbe:	4068      	eors	r0, r5
c0de1cc0:	ea42 1350 	orr.w	r3, r2, r0, lsr #5
c0de1cc4:	9a52      	ldr	r2, [sp, #328]	@ 0x148
c0de1cc6:	06c0      	lsls	r0, r0, #27
c0de1cc8:	461d      	mov	r5, r3
c0de1cca:	9350      	str	r3, [sp, #320]	@ 0x140
c0de1ccc:	ea8a 0102 	eor.w	r1, sl, r2
c0de1cd0:	9a3e      	ldr	r2, [sp, #248]	@ 0xf8
c0de1cd2:	ea40 1a5c 	orr.w	sl, r0, ip, lsr #5
c0de1cd6:	0108      	lsls	r0, r1, #4
c0de1cd8:	ea8b 0602 	eor.w	r6, fp, r2
c0de1cdc:	0132      	lsls	r2, r6, #4
c0de1cde:	ea40 7c16 	orr.w	ip, r0, r6, lsr #28
c0de1ce2:	ea42 7211 	orr.w	r2, r2, r1, lsr #28
c0de1ce6:	ea2c 000a 	bic.w	r0, ip, sl
c0de1cea:	9252      	str	r2, [sp, #328]	@ 0x148
c0de1cec:	439a      	bics	r2, r3
c0de1cee:	9b1d      	ldr	r3, [sp, #116]	@ 0x74
c0de1cf0:	ea84 0703 	eor.w	r7, r4, r3
c0de1cf4:	9b1f      	ldr	r3, [sp, #124]	@ 0x7c
c0de1cf6:	9c59      	ldr	r4, [sp, #356]	@ 0x164
c0de1cf8:	0639      	lsls	r1, r7, #24
c0de1cfa:	405c      	eors	r4, r3
c0de1cfc:	0623      	lsls	r3, r4, #24
c0de1cfe:	ea41 2114 	orr.w	r1, r1, r4, lsr #8
c0de1d02:	ea43 2317 	orr.w	r3, r3, r7, lsr #8
c0de1d06:	4048      	eors	r0, r1
c0de1d08:	405a      	eors	r2, r3
c0de1d0a:	9034      	str	r0, [sp, #208]	@ 0xd0
c0de1d0c:	ea25 0003 	bic.w	r0, r5, r3
c0de1d10:	9d2f      	ldr	r5, [sp, #188]	@ 0xbc
c0de1d12:	923a      	str	r2, [sp, #232]	@ 0xe8
c0de1d14:	9a3f      	ldr	r2, [sp, #252]	@ 0xfc
c0de1d16:	ea8e 0402 	eor.w	r4, lr, r2
c0de1d1a:	9a3c      	ldr	r2, [sp, #240]	@ 0xf0
c0de1d1c:	ea88 0602 	eor.w	r6, r8, r2
c0de1d20:	9a19      	ldr	r2, [sp, #100]	@ 0x64
c0de1d22:	03f7      	lsls	r7, r6, #15
c0de1d24:	ea47 4754 	orr.w	r7, r7, r4, lsr #17
c0de1d28:	03e4      	lsls	r4, r4, #15
c0de1d2a:	4078      	eors	r0, r7
c0de1d2c:	ea44 4456 	orr.w	r4, r4, r6, lsr #17
c0de1d30:	9e40      	ldr	r6, [sp, #256]	@ 0x100
c0de1d32:	9047      	str	r0, [sp, #284]	@ 0x11c
c0de1d34:	ea2a 0001 	bic.w	r0, sl, r1
c0de1d38:	4060      	eors	r0, r4
c0de1d3a:	903f      	str	r0, [sp, #252]	@ 0xfc
c0de1d3c:	ea23 0007 	bic.w	r0, r3, r7
c0de1d40:	ea85 0302 	eor.w	r3, r5, r2
c0de1d44:	9a57      	ldr	r2, [sp, #348]	@ 0x15c
c0de1d46:	4056      	eors	r6, r2
c0de1d48:	ea4f 2b86 	mov.w	fp, r6, lsl #10
c0de1d4c:	ea4b 5b93 	orr.w	fp, fp, r3, lsr #22
c0de1d50:	ea80 000b 	eor.w	r0, r0, fp
c0de1d54:	904a      	str	r0, [sp, #296]	@ 0x128
c0de1d56:	ea21 0004 	bic.w	r0, r1, r4
c0de1d5a:	0299      	lsls	r1, r3, #10
c0de1d5c:	9b52      	ldr	r3, [sp, #328]	@ 0x148
c0de1d5e:	ea41 5196 	orr.w	r1, r1, r6, lsr #22
c0de1d62:	4048      	eors	r0, r1
c0de1d64:	9042      	str	r0, [sp, #264]	@ 0x108
c0de1d66:	ea27 000b 	bic.w	r0, r7, fp
c0de1d6a:	4058      	eors	r0, r3
c0de1d6c:	903e      	str	r0, [sp, #248]	@ 0xf8
c0de1d6e:	ea24 0001 	bic.w	r0, r4, r1
c0de1d72:	9c14      	ldr	r4, [sp, #80]	@ 0x50
c0de1d74:	ea80 000c 	eor.w	r0, r0, ip
c0de1d78:	9036      	str	r0, [sp, #216]	@ 0xd8
c0de1d7a:	ea2b 0003 	bic.w	r0, fp, r3
c0de1d7e:	9b50      	ldr	r3, [sp, #320]	@ 0x140
c0de1d80:	f8dd b16c 	ldr.w	fp, [sp, #364]	@ 0x16c
c0de1d84:	4058      	eors	r0, r3
c0de1d86:	9b58      	ldr	r3, [sp, #352]	@ 0x160
c0de1d88:	903c      	str	r0, [sp, #240]	@ 0xf0
c0de1d8a:	ea21 000c 	bic.w	r0, r1, ip
c0de1d8e:	9941      	ldr	r1, [sp, #260]	@ 0x104
c0de1d90:	ea80 000a 	eor.w	r0, r0, sl
c0de1d94:	ea83 0704 	eor.w	r7, r3, r4
c0de1d98:	9b30      	ldr	r3, [sp, #192]	@ 0xc0
c0de1d9a:	9c55      	ldr	r4, [sp, #340]	@ 0x154
c0de1d9c:	9035      	str	r0, [sp, #212]	@ 0xd4
c0de1d9e:	9838      	ldr	r0, [sp, #224]	@ 0xe0
c0de1da0:	ea82 0c01 	eor.w	ip, r2, r1
c0de1da4:	ea4f 024c 	mov.w	r2, ip, lsl #1
c0de1da8:	4063      	eors	r3, r4
c0de1daa:	4068      	eors	r0, r5
c0de1dac:	049c      	lsls	r4, r3, #18
c0de1dae:	ea42 75d0 	orr.w	r5, r2, r0, lsr #31
c0de1db2:	9a15      	ldr	r2, [sp, #84]	@ 0x54
c0de1db4:	ea44 3497 	orr.w	r4, r4, r7, lsr #14
c0de1db8:	0040      	lsls	r0, r0, #1
c0de1dba:	ea40 7adc 	orr.w	sl, r0, ip, lsr #31
c0de1dbe:	f8dd c0b8 	ldr.w	ip, [sp, #184]	@ 0xb8
c0de1dc2:	9546      	str	r5, [sp, #280]	@ 0x118
c0de1dc4:	ea8e 0102 	eor.w	r1, lr, r2
c0de1dc8:	9a16      	ldr	r2, [sp, #88]	@ 0x58
c0de1dca:	0188      	lsls	r0, r1, #6
c0de1dcc:	ea88 0602 	eor.w	r6, r8, r2
c0de1dd0:	f8dd 80b4 	ldr.w	r8, [sp, #180]	@ 0xb4
c0de1dd4:	01b2      	lsls	r2, r6, #6
c0de1dd6:	ea40 6e96 	orr.w	lr, r0, r6, lsr #26
c0de1dda:	ea42 6291 	orr.w	r2, r2, r1, lsr #26
c0de1dde:	04b9      	lsls	r1, r7, #18
c0de1de0:	ea2e 000a 	bic.w	r0, lr, sl
c0de1de4:	924c      	str	r2, [sp, #304]	@ 0x130
c0de1de6:	43aa      	bics	r2, r5
c0de1de8:	ea41 3193 	orr.w	r1, r1, r3, lsr #14
c0de1dec:	4062      	eors	r2, r4
c0de1dee:	4048      	eors	r0, r1
c0de1df0:	9255      	str	r2, [sp, #340]	@ 0x154
c0de1df2:	9a32      	ldr	r2, [sp, #200]	@ 0xc8
c0de1df4:	9050      	str	r0, [sp, #320]	@ 0x140
c0de1df6:	ea25 0004 	bic.w	r0, r5, r4
c0de1dfa:	9d59      	ldr	r5, [sp, #356]	@ 0x164
c0de1dfc:	ea8c 0302 	eor.w	r3, ip, r2
c0de1e00:	9a18      	ldr	r2, [sp, #96]	@ 0x60
c0de1e02:	ea88 0602 	eor.w	r6, r8, r2
c0de1e06:	0237      	lsls	r7, r6, #8
c0de1e08:	ea47 6713 	orr.w	r7, r7, r3, lsr #24
c0de1e0c:	021b      	lsls	r3, r3, #8
c0de1e0e:	4078      	eors	r0, r7
c0de1e10:	ea43 6316 	orr.w	r3, r3, r6, lsr #24
c0de1e14:	ea24 0207 	bic.w	r2, r4, r7
c0de1e18:	9052      	str	r0, [sp, #328]	@ 0x148
c0de1e1a:	ea2a 0001 	bic.w	r0, sl, r1
c0de1e1e:	4399      	bics	r1, r3
c0de1e20:	4058      	eors	r0, r3
c0de1e22:	904e      	str	r0, [sp, #312]	@ 0x138
c0de1e24:	9824      	ldr	r0, [sp, #144]	@ 0x90
c0de1e26:	ea85 0400 	eor.w	r4, r5, r0
c0de1e2a:	9821      	ldr	r0, [sp, #132]	@ 0x84
c0de1e2c:	ea8b 0600 	eor.w	r6, fp, r0
c0de1e30:	0670      	lsls	r0, r6, #25
c0de1e32:	ea40 10d4 	orr.w	r0, r0, r4, lsr #7
c0de1e36:	0664      	lsls	r4, r4, #25
c0de1e38:	4042      	eors	r2, r0
c0de1e3a:	ea44 14d6 	orr.w	r4, r4, r6, lsr #7
c0de1e3e:	9249      	str	r2, [sp, #292]	@ 0x124
c0de1e40:	4061      	eors	r1, r4
c0de1e42:	9a4c      	ldr	r2, [sp, #304]	@ 0x130
c0de1e44:	9141      	str	r1, [sp, #260]	@ 0x104
c0de1e46:	ea27 0100 	bic.w	r1, r7, r0
c0de1e4a:	4051      	eors	r1, r2
c0de1e4c:	4390      	bics	r0, r2
c0de1e4e:	914b      	str	r1, [sp, #300]	@ 0x12c
c0de1e50:	ea23 0104 	bic.w	r1, r3, r4
c0de1e54:	9b37      	ldr	r3, [sp, #220]	@ 0xdc
c0de1e56:	ea81 010e 	eor.w	r1, r1, lr
c0de1e5a:	9144      	str	r1, [sp, #272]	@ 0x110
c0de1e5c:	9946      	ldr	r1, [sp, #280]	@ 0x118
c0de1e5e:	4048      	eors	r0, r1
c0de1e60:	9920      	ldr	r1, [sp, #128]	@ 0x80
c0de1e62:	9046      	str	r0, [sp, #280]	@ 0x118
c0de1e64:	ea24 000e 	bic.w	r0, r4, lr
c0de1e68:	9c5c      	ldr	r4, [sp, #368]	@ 0x170
c0de1e6a:	ea80 000a 	eor.w	r0, r0, sl
c0de1e6e:	ea8b 0e01 	eor.w	lr, fp, r1
c0de1e72:	9040      	str	r0, [sp, #256]	@ 0x100
c0de1e74:	9823      	ldr	r0, [sp, #140]	@ 0x8c
c0de1e76:	ea4f 720e 	mov.w	r2, lr, lsl #28
c0de1e7a:	ea84 0703 	eor.w	r7, r4, r3
c0de1e7e:	9b31      	ldr	r3, [sp, #196]	@ 0xc4
c0de1e80:	9c5a      	ldr	r4, [sp, #360]	@ 0x168
c0de1e82:	4068      	eors	r0, r5
c0de1e84:	4063      	eors	r3, r4
c0de1e86:	ea42 1610 	orr.w	r6, r2, r0, lsr #4
c0de1e8a:	9a3b      	ldr	r2, [sp, #236]	@ 0xec
c0de1e8c:	075c      	lsls	r4, r3, #29
c0de1e8e:	0700      	lsls	r0, r0, #28
c0de1e90:	ea44 04d7 	orr.w	r4, r4, r7, lsr #3
c0de1e94:	ea40 1e1e 	orr.w	lr, r0, lr, lsr #4
c0de1e98:	9624      	str	r6, [sp, #144]	@ 0x90
c0de1e9a:	ea8c 0502 	eor.w	r5, ip, r2
c0de1e9e:	9a39      	ldr	r2, [sp, #228]	@ 0xe4
c0de1ea0:	f8dd c0c0 	ldr.w	ip, [sp, #192]	@ 0xc0
c0de1ea4:	0528      	lsls	r0, r5, #20
c0de1ea6:	ea88 0102 	eor.w	r1, r8, r2
c0de1eaa:	f8dd 80bc 	ldr.w	r8, [sp, #188]	@ 0xbc
c0de1eae:	050a      	lsls	r2, r1, #20
c0de1eb0:	ea42 3a15 	orr.w	sl, r2, r5, lsr #12
c0de1eb4:	ea40 3511 	orr.w	r5, r0, r1, lsr #12
c0de1eb8:	0779      	lsls	r1, r7, #29
c0de1eba:	ea2a 0206 	bic.w	r2, sl, r6
c0de1ebe:	ea41 01d3 	orr.w	r1, r1, r3, lsr #3
c0de1ec2:	9b57      	ldr	r3, [sp, #348]	@ 0x15c
c0de1ec4:	ea25 000e 	bic.w	r0, r5, lr
c0de1ec8:	4062      	eors	r2, r4
c0de1eca:	4048      	eors	r0, r1
c0de1ecc:	923b      	str	r2, [sp, #236]	@ 0xec
c0de1ece:	9a3d      	ldr	r2, [sp, #244]	@ 0xf4
c0de1ed0:	9039      	str	r0, [sp, #228]	@ 0xe4
c0de1ed2:	ea26 0004 	bic.w	r0, r6, r4
c0de1ed6:	4053      	eors	r3, r2
c0de1ed8:	9a45      	ldr	r2, [sp, #276]	@ 0x114
c0de1eda:	ea88 0602 	eor.w	r6, r8, r2
c0de1ede:	9a58      	ldr	r2, [sp, #352]	@ 0x160
c0de1ee0:	0377      	lsls	r7, r6, #13
c0de1ee2:	ea47 47d3 	orr.w	r7, r7, r3, lsr #19
c0de1ee6:	035b      	lsls	r3, r3, #13
c0de1ee8:	4078      	eors	r0, r7
c0de1eea:	ea43 43d6 	orr.w	r3, r3, r6, lsr #19
c0de1eee:	ea24 0b07 	bic.w	fp, r4, r7
c0de1ef2:	904c      	str	r0, [sp, #304]	@ 0x130
c0de1ef4:	ea2e 0001 	bic.w	r0, lr, r1
c0de1ef8:	4399      	bics	r1, r3
c0de1efa:	4058      	eors	r0, r3
c0de1efc:	9045      	str	r0, [sp, #276]	@ 0x114
c0de1efe:	9833      	ldr	r0, [sp, #204]	@ 0xcc
c0de1f00:	ea82 0400 	eor.w	r4, r2, r0
c0de1f04:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de1f06:	ea8c 0600 	eor.w	r6, ip, r0
c0de1f0a:	00f0      	lsls	r0, r6, #3
c0de1f0c:	ea40 7054 	orr.w	r0, r0, r4, lsr #29
c0de1f10:	00e4      	lsls	r4, r4, #3
c0de1f12:	ea44 7456 	orr.w	r4, r4, r6, lsr #29
c0de1f16:	ea8b 0200 	eor.w	r2, fp, r0
c0de1f1a:	4061      	eors	r1, r4
c0de1f1c:	9238      	str	r2, [sp, #224]	@ 0xe0
c0de1f1e:	9137      	str	r1, [sp, #220]	@ 0xdc
c0de1f20:	ea27 0100 	bic.w	r1, r7, r0
c0de1f24:	ea20 000a 	bic.w	r0, r0, sl
c0de1f28:	ea81 010a 	eor.w	r1, r1, sl
c0de1f2c:	9132      	str	r1, [sp, #200]	@ 0xc8
c0de1f2e:	ea23 0104 	bic.w	r1, r3, r4
c0de1f32:	4069      	eors	r1, r5
c0de1f34:	9131      	str	r1, [sp, #196]	@ 0xc4
c0de1f36:	9924      	ldr	r1, [sp, #144]	@ 0x90
c0de1f38:	4048      	eors	r0, r1
c0de1f3a:	992e      	ldr	r1, [sp, #184]	@ 0xb8
c0de1f3c:	903d      	str	r0, [sp, #244]	@ 0xf4
c0de1f3e:	ea24 0005 	bic.w	r0, r4, r5
c0de1f42:	ea80 000e 	eor.w	r0, r0, lr
c0de1f46:	9033      	str	r0, [sp, #204]	@ 0xcc
c0de1f48:	9829      	ldr	r0, [sp, #164]	@ 0xa4
c0de1f4a:	ea81 0200 	eor.w	r2, r1, r0
c0de1f4e:	981e      	ldr	r0, [sp, #120]	@ 0x78
c0de1f50:	992d      	ldr	r1, [sp, #180]	@ 0xb4
c0de1f52:	ea81 0300 	eor.w	r3, r1, r0
c0de1f56:	9957      	ldr	r1, [sp, #348]	@ 0x15c
c0de1f58:	0398      	lsls	r0, r3, #14
c0de1f5a:	ea40 4492 	orr.w	r4, r0, r2, lsr #18
c0de1f5e:	9822      	ldr	r0, [sp, #136]	@ 0x88
c0de1f60:	0392      	lsls	r2, r2, #14
c0de1f62:	ea42 4293 	orr.w	r2, r2, r3, lsr #18
c0de1f66:	ea81 0500 	eor.w	r5, r1, r0
c0de1f6a:	982b      	ldr	r0, [sp, #172]	@ 0xac
c0de1f6c:	9958      	ldr	r1, [sp, #352]	@ 0x160
c0de1f6e:	032b      	lsls	r3, r5, #12
c0de1f70:	ea88 0600 	eor.w	r6, r8, r0
c0de1f74:	0330      	lsls	r0, r6, #12
c0de1f76:	ea40 5a15 	orr.w	sl, r0, r5, lsr #20
c0de1f7a:	981a      	ldr	r0, [sp, #104]	@ 0x68
c0de1f7c:	ea43 5516 	orr.w	r5, r3, r6, lsr #20
c0de1f80:	ea80 080c 	eor.w	r8, r0, ip
c0de1f84:	981b      	ldr	r0, [sp, #108]	@ 0x6c
c0de1f86:	ea2a 0708 	bic.w	r7, sl, r8
c0de1f8a:	ea80 0b01 	eor.w	fp, r0, r1
c0de1f8e:	9959      	ldr	r1, [sp, #356]	@ 0x164
c0de1f90:	ea84 0e07 	eor.w	lr, r4, r7
c0de1f94:	ea25 060b 	bic.w	r6, r5, fp
c0de1f98:	ea82 0006 	eor.w	r0, r2, r6
c0de1f9c:	9058      	str	r0, [sp, #352]	@ 0x160
c0de1f9e:	9826      	ldr	r0, [sp, #152]	@ 0x98
c0de1fa0:	ea81 0600 	eor.w	r6, r1, r0
c0de1fa4:	9825      	ldr	r0, [sp, #148]	@ 0x94
c0de1fa6:	995b      	ldr	r1, [sp, #364]	@ 0x16c
c0de1fa8:	ea81 0700 	eor.w	r7, r1, r0
c0de1fac:	ea28 0104 	bic.w	r1, r8, r4
c0de1fb0:	0578      	lsls	r0, r7, #21
c0de1fb2:	ea40 20d6 	orr.w	r0, r0, r6, lsr #11
c0de1fb6:	4041      	eors	r1, r0
c0de1fb8:	ea24 0c00 	bic.w	ip, r4, r0
c0de1fbc:	9c5c      	ldr	r4, [sp, #368]	@ 0x170
c0de1fbe:	9130      	str	r1, [sp, #192]	@ 0xc0
c0de1fc0:	0571      	lsls	r1, r6, #21
c0de1fc2:	ea2b 0602 	bic.w	r6, fp, r2
c0de1fc6:	ea41 21d7 	orr.w	r1, r1, r7, lsr #11
c0de1fca:	ea86 0301 	eor.w	r3, r6, r1
c0de1fce:	438a      	bics	r2, r1
c0de1fd0:	932e      	str	r3, [sp, #184]	@ 0xb8
c0de1fd2:	9b28      	ldr	r3, [sp, #160]	@ 0xa0
c0de1fd4:	ea84 0603 	eor.w	r6, r4, r3
c0de1fd8:	9b1c      	ldr	r3, [sp, #112]	@ 0x70
c0de1fda:	9c5a      	ldr	r4, [sp, #360]	@ 0x168
c0de1fdc:	ea84 0703 	eor.w	r7, r4, r3
c0de1fe0:	02fc      	lsls	r4, r7, #11
c0de1fe2:	ea44 5456 	orr.w	r4, r4, r6, lsr #21
c0de1fe6:	02f6      	lsls	r6, r6, #11
c0de1fe8:	ea8c 0304 	eor.w	r3, ip, r4
c0de1fec:	ea46 5657 	orr.w	r6, r6, r7, lsr #21
c0de1ff0:	43a0      	bics	r0, r4
c0de1ff2:	935c      	str	r3, [sp, #368]	@ 0x170
c0de1ff4:	4072      	eors	r2, r6
c0de1ff6:	ea8a 0300 	eor.w	r3, sl, r0
c0de1ffa:	ea21 0006 	bic.w	r0, r1, r6
c0de1ffe:	9259      	str	r2, [sp, #356]	@ 0x164
c0de2000:	ea85 0200 	eor.w	r2, r5, r0
c0de2004:	ea24 000a 	bic.w	r0, r4, sl
c0de2008:	9c5d      	ldr	r4, [sp, #372]	@ 0x174
c0de200a:	6861      	ldr	r1, [r4, #4]
c0de200c:	ea81 0108 	eor.w	r1, r1, r8
c0de2010:	4048      	eors	r0, r1
c0de2012:	f854 1b10 	ldr.w	r1, [r4], #16
c0de2016:	905b      	str	r0, [sp, #364]	@ 0x16c
c0de2018:	ea26 0005 	bic.w	r0, r6, r5
c0de201c:	ea81 010b 	eor.w	r1, r1, fp
c0de2020:	945d      	str	r4, [sp, #372]	@ 0x174
c0de2022:	4048      	eors	r0, r1
c0de2024:	905a      	str	r0, [sp, #360]	@ 0x168
c0de2026:	9827      	ldr	r0, [sp, #156]	@ 0x9c
c0de2028:	3002      	adds	r0, #2
c0de202a:	f7ff b9a9 	b.w	c0de1380 <KeccakF1600_StatePermute+0xfc>
c0de202e:	9800      	ldr	r0, [sp, #0]
c0de2030:	9953      	ldr	r1, [sp, #332]	@ 0x14c
c0de2032:	f8c0 10c0 	str.w	r1, [r0, #192]	@ 0xc0
c0de2036:	9951      	ldr	r1, [sp, #324]	@ 0x144
c0de2038:	6082      	str	r2, [r0, #8]
c0de203a:	f8c0 e024 	str.w	lr, [r0, #36]	@ 0x24
c0de203e:	60c3      	str	r3, [r0, #12]
c0de2040:	f8c0 10b8 	str.w	r1, [r0, #184]	@ 0xb8
c0de2044:	9943      	ldr	r1, [sp, #268]	@ 0x10c
c0de2046:	f8c0 10b0 	str.w	r1, [r0, #176]	@ 0xb0
c0de204a:	9948      	ldr	r1, [sp, #288]	@ 0x120
c0de204c:	f8c0 10a8 	str.w	r1, [r0, #168]	@ 0xa8
c0de2050:	992a      	ldr	r1, [sp, #168]	@ 0xa8
c0de2052:	f8c0 10a0 	str.w	r1, [r0, #160]	@ 0xa0
c0de2056:	9934      	ldr	r1, [sp, #208]	@ 0xd0
c0de2058:	f8c0 1098 	str.w	r1, [r0, #152]	@ 0x98
c0de205c:	993f      	ldr	r1, [sp, #252]	@ 0xfc
c0de205e:	f8c0 1090 	str.w	r1, [r0, #144]	@ 0x90
c0de2062:	9942      	ldr	r1, [sp, #264]	@ 0x108
c0de2064:	f8c0 1088 	str.w	r1, [r0, #136]	@ 0x88
c0de2068:	9936      	ldr	r1, [sp, #216]	@ 0xd8
c0de206a:	f8c0 1080 	str.w	r1, [r0, #128]	@ 0x80
c0de206e:	9935      	ldr	r1, [sp, #212]	@ 0xd4
c0de2070:	6781      	str	r1, [r0, #120]	@ 0x78
c0de2072:	9950      	ldr	r1, [sp, #320]	@ 0x140
c0de2074:	6701      	str	r1, [r0, #112]	@ 0x70
c0de2076:	994e      	ldr	r1, [sp, #312]	@ 0x138
c0de2078:	6681      	str	r1, [r0, #104]	@ 0x68
c0de207a:	9941      	ldr	r1, [sp, #260]	@ 0x104
c0de207c:	6601      	str	r1, [r0, #96]	@ 0x60
c0de207e:	9944      	ldr	r1, [sp, #272]	@ 0x110
c0de2080:	6581      	str	r1, [r0, #88]	@ 0x58
c0de2082:	9940      	ldr	r1, [sp, #256]	@ 0x100
c0de2084:	6501      	str	r1, [r0, #80]	@ 0x50
c0de2086:	9939      	ldr	r1, [sp, #228]	@ 0xe4
c0de2088:	6481      	str	r1, [r0, #72]	@ 0x48
c0de208a:	9945      	ldr	r1, [sp, #276]	@ 0x114
c0de208c:	6401      	str	r1, [r0, #64]	@ 0x40
c0de208e:	9937      	ldr	r1, [sp, #220]	@ 0xdc
c0de2090:	6381      	str	r1, [r0, #56]	@ 0x38
c0de2092:	9931      	ldr	r1, [sp, #196]	@ 0xc4
c0de2094:	6301      	str	r1, [r0, #48]	@ 0x30
c0de2096:	9933      	ldr	r1, [sp, #204]	@ 0xcc
c0de2098:	6281      	str	r1, [r0, #40]	@ 0x28
c0de209a:	9958      	ldr	r1, [sp, #352]	@ 0x160
c0de209c:	6201      	str	r1, [r0, #32]
c0de209e:	992e      	ldr	r1, [sp, #184]	@ 0xb8
c0de20a0:	6181      	str	r1, [r0, #24]
c0de20a2:	9959      	ldr	r1, [sp, #356]	@ 0x164
c0de20a4:	6101      	str	r1, [r0, #16]
c0de20a6:	995a      	ldr	r1, [sp, #360]	@ 0x168
c0de20a8:	6001      	str	r1, [r0, #0]
c0de20aa:	9956      	ldr	r1, [sp, #344]	@ 0x158
c0de20ac:	f8c0 10c4 	str.w	r1, [r0, #196]	@ 0xc4
c0de20b0:	9954      	ldr	r1, [sp, #336]	@ 0x150
c0de20b2:	f8c0 10bc 	str.w	r1, [r0, #188]	@ 0xbc
c0de20b6:	994d      	ldr	r1, [sp, #308]	@ 0x134
c0de20b8:	f8c0 10b4 	str.w	r1, [r0, #180]	@ 0xb4
c0de20bc:	994f      	ldr	r1, [sp, #316]	@ 0x13c
c0de20be:	f8c0 10ac 	str.w	r1, [r0, #172]	@ 0xac
c0de20c2:	992c      	ldr	r1, [sp, #176]	@ 0xb0
c0de20c4:	f8c0 10a4 	str.w	r1, [r0, #164]	@ 0xa4
c0de20c8:	993a      	ldr	r1, [sp, #232]	@ 0xe8
c0de20ca:	f8c0 109c 	str.w	r1, [r0, #156]	@ 0x9c
c0de20ce:	9947      	ldr	r1, [sp, #284]	@ 0x11c
c0de20d0:	f8c0 1094 	str.w	r1, [r0, #148]	@ 0x94
c0de20d4:	994a      	ldr	r1, [sp, #296]	@ 0x128
c0de20d6:	f8c0 108c 	str.w	r1, [r0, #140]	@ 0x8c
c0de20da:	993e      	ldr	r1, [sp, #248]	@ 0xf8
c0de20dc:	f8c0 1084 	str.w	r1, [r0, #132]	@ 0x84
c0de20e0:	993c      	ldr	r1, [sp, #240]	@ 0xf0
c0de20e2:	67c1      	str	r1, [r0, #124]	@ 0x7c
c0de20e4:	9955      	ldr	r1, [sp, #340]	@ 0x154
c0de20e6:	6741      	str	r1, [r0, #116]	@ 0x74
c0de20e8:	9952      	ldr	r1, [sp, #328]	@ 0x148
c0de20ea:	66c1      	str	r1, [r0, #108]	@ 0x6c
c0de20ec:	9949      	ldr	r1, [sp, #292]	@ 0x124
c0de20ee:	6641      	str	r1, [r0, #100]	@ 0x64
c0de20f0:	994b      	ldr	r1, [sp, #300]	@ 0x12c
c0de20f2:	65c1      	str	r1, [r0, #92]	@ 0x5c
c0de20f4:	9946      	ldr	r1, [sp, #280]	@ 0x118
c0de20f6:	6541      	str	r1, [r0, #84]	@ 0x54
c0de20f8:	993b      	ldr	r1, [sp, #236]	@ 0xec
c0de20fa:	64c1      	str	r1, [r0, #76]	@ 0x4c
c0de20fc:	994c      	ldr	r1, [sp, #304]	@ 0x130
c0de20fe:	6441      	str	r1, [r0, #68]	@ 0x44
c0de2100:	9938      	ldr	r1, [sp, #224]	@ 0xe0
c0de2102:	63c1      	str	r1, [r0, #60]	@ 0x3c
c0de2104:	9932      	ldr	r1, [sp, #200]	@ 0xc8
c0de2106:	6341      	str	r1, [r0, #52]	@ 0x34
c0de2108:	993d      	ldr	r1, [sp, #244]	@ 0xf4
c0de210a:	62c1      	str	r1, [r0, #44]	@ 0x2c
c0de210c:	9930      	ldr	r1, [sp, #192]	@ 0xc0
c0de210e:	61c1      	str	r1, [r0, #28]
c0de2110:	995c      	ldr	r1, [sp, #368]	@ 0x170
c0de2112:	6141      	str	r1, [r0, #20]
c0de2114:	995b      	ldr	r1, [sp, #364]	@ 0x16c
c0de2116:	6041      	str	r1, [r0, #4]
c0de2118:	b05e      	add	sp, #376	@ 0x178
c0de211a:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de211e <store64>:
c0de211e:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de2120:	461c      	mov	r4, r3
c0de2122:	4615      	mov	r5, r2
c0de2124:	4606      	mov	r6, r0
c0de2126:	2700      	movs	r7, #0
c0de2128:	2f40      	cmp	r7, #64	@ 0x40
c0de212a:	bf08      	it	eq
c0de212c:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de212e:	4628      	mov	r0, r5
c0de2130:	4621      	mov	r1, r4
c0de2132:	463a      	mov	r2, r7
c0de2134:	f009 ff5e 	bl	c0debff4 <__aeabi_llsr>
c0de2138:	f806 0b01 	strb.w	r0, [r6], #1
c0de213c:	3708      	adds	r7, #8
c0de213e:	e7f3      	b.n	c0de2128 <store64+0xa>

c0de2140 <OUTLINED_FUNCTION_0>:
c0de2140:	58b3      	ldr	r3, [r6, r2]
c0de2142:	4058      	eors	r0, r3
c0de2144:	50b0      	str	r0, [r6, r2]
c0de2146:	18b0      	adds	r0, r6, r2
c0de2148:	6842      	ldr	r2, [r0, #4]
c0de214a:	4051      	eors	r1, r2
c0de214c:	6041      	str	r1, [r0, #4]
c0de214e:	4770      	bx	lr

c0de2150 <OUTLINED_FUNCTION_2>:
c0de2150:	58a3      	ldr	r3, [r4, r2]
c0de2152:	4058      	eors	r0, r3
c0de2154:	50a0      	str	r0, [r4, r2]
c0de2156:	18a0      	adds	r0, r4, r2
c0de2158:	6842      	ldr	r2, [r0, #4]
c0de215a:	4051      	eors	r1, r2
c0de215c:	6041      	str	r1, [r0, #4]
c0de215e:	4770      	bx	lr

c0de2160 <OUTLINED_FUNCTION_3>:
c0de2160:	f8c4 00c8 	str.w	r0, [r4, #200]	@ 0xc8
c0de2164:	bd1c      	pop	{r2, r3, r4, pc}

c0de2166 <keccak_init>:
c0de2166:	2106      	movs	r1, #6
c0de2168:	2220      	movs	r2, #32
c0de216a:	f009 bbea 	b.w	c0deb942 <cx_hash_init_ex>

c0de216e <keccak_update>:
c0de216e:	f009 bbed 	b.w	c0deb94c <cx_hash_update>

c0de2172 <keccak_final>:
c0de2172:	f009 bbe1 	b.w	c0deb938 <cx_hash_final>

c0de2176 <inner_keccak256_init>:
c0de2176:	b160      	cbz	r0, c0de2192 <inner_keccak256_init+0x1c>
c0de2178:	b510      	push	{r4, lr}
c0de217a:	212c      	movs	r1, #44	@ 0x2c
c0de217c:	4604      	mov	r4, r0
c0de217e:	f00a f839 	bl	c0dec1f4 <__aeabi_memclr>
c0de2182:	f104 0030 	add.w	r0, r4, #48	@ 0x30
c0de2186:	f7ff ffee 	bl	c0de2166 <keccak_init>
c0de218a:	2000      	movs	r0, #0
c0de218c:	e9c4 007e 	strd	r0, r0, [r4, #504]	@ 0x1f8
c0de2190:	bd10      	pop	{r4, pc}
c0de2192:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de2196:	4770      	bx	lr

c0de2198 <inner_keccak256_inject>:
c0de2198:	b580      	push	{r7, lr}
c0de219a:	4603      	mov	r3, r0
c0de219c:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de21a0:	b15b      	cbz	r3, c0de21ba <inner_keccak256_inject+0x22>
c0de21a2:	b151      	cbz	r1, c0de21ba <inner_keccak256_inject+0x22>
c0de21a4:	6a98      	ldr	r0, [r3, #40]	@ 0x28
c0de21a6:	b110      	cbz	r0, c0de21ae <inner_keccak256_inject+0x16>
c0de21a8:	f06f 0001 	mvn.w	r0, #1
c0de21ac:	bd80      	pop	{r7, pc}
c0de21ae:	f103 0030 	add.w	r0, r3, #48	@ 0x30
c0de21b2:	b292      	uxth	r2, r2
c0de21b4:	f7ff ffdb 	bl	c0de216e <keccak_update>
c0de21b8:	2000      	movs	r0, #0
c0de21ba:	bd80      	pop	{r7, pc}

c0de21bc <inner_keccak256_flip>:
c0de21bc:	b510      	push	{r4, lr}
c0de21be:	b128      	cbz	r0, c0de21cc <inner_keccak256_flip+0x10>
c0de21c0:	4604      	mov	r4, r0
c0de21c2:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0de21c4:	b128      	cbz	r0, c0de21d2 <inner_keccak256_flip+0x16>
c0de21c6:	f06f 0001 	mvn.w	r0, #1
c0de21ca:	bd10      	pop	{r4, pc}
c0de21cc:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de21d0:	bd10      	pop	{r4, pc}
c0de21d2:	f104 0030 	add.w	r0, r4, #48	@ 0x30
c0de21d6:	4621      	mov	r1, r4
c0de21d8:	f7ff ffcb 	bl	c0de2172 <keccak_final>
c0de21dc:	2000      	movs	r0, #0
c0de21de:	2101      	movs	r1, #1
c0de21e0:	e9c4 007e 	strd	r0, r0, [r4, #504]	@ 0x1f8
c0de21e4:	62a1      	str	r1, [r4, #40]	@ 0x28
c0de21e6:	bd10      	pop	{r4, pc}

c0de21e8 <inner_keccak256_extract>:
c0de21e8:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de21ec:	b0f8      	sub	sp, #480	@ 0x1e0
c0de21ee:	4682      	mov	sl, r0
c0de21f0:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de21f4:	f1ba 0f00 	cmp.w	sl, #0
c0de21f8:	d020      	beq.n	c0de223c <inner_keccak256_extract+0x54>
c0de21fa:	460e      	mov	r6, r1
c0de21fc:	b1f1      	cbz	r1, c0de223c <inner_keccak256_extract+0x54>
c0de21fe:	f8da 0028 	ldr.w	r0, [sl, #40]	@ 0x28
c0de2202:	b1c8      	cbz	r0, c0de2238 <inner_keccak256_extract+0x50>
c0de2204:	e9da 017e 	ldrd	r0, r1, [sl, #504]	@ 0x1f8
c0de2208:	4615      	mov	r5, r2
c0de220a:	4281      	cmp	r1, r0
c0de220c:	d919      	bls.n	c0de2242 <inner_keccak256_extract+0x5a>
c0de220e:	1a0c      	subs	r4, r1, r0
c0de2210:	4450      	add	r0, sl
c0de2212:	46a3      	mov	fp, r4
c0de2214:	42ac      	cmp	r4, r5
c0de2216:	f500 71ec 	add.w	r1, r0, #472	@ 0x1d8
c0de221a:	4630      	mov	r0, r6
c0de221c:	bf88      	it	hi
c0de221e:	46ab      	movhi	fp, r5
c0de2220:	465a      	mov	r2, fp
c0de2222:	f009 ffdd 	bl	c0dec1e0 <__aeabi_memcpy>
c0de2226:	f8da 01f8 	ldr.w	r0, [sl, #504]	@ 0x1f8
c0de222a:	42ac      	cmp	r4, r5
c0de222c:	4458      	add	r0, fp
c0de222e:	f8ca 01f8 	str.w	r0, [sl, #504]	@ 0x1f8
c0de2232:	d308      	bcc.n	c0de2246 <inner_keccak256_extract+0x5e>
c0de2234:	2000      	movs	r0, #0
c0de2236:	e001      	b.n	c0de223c <inner_keccak256_extract+0x54>
c0de2238:	f06f 0001 	mvn.w	r0, #1
c0de223c:	b078      	add	sp, #480	@ 0x1e0
c0de223e:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de2242:	f04f 0b00 	mov.w	fp, #0
c0de2246:	ac6e      	add	r4, sp, #440	@ 0x1b8
c0de2248:	9503      	str	r5, [sp, #12]
c0de224a:	f104 0020 	add.w	r0, r4, #32
c0de224e:	9002      	str	r0, [sp, #8]
c0de2250:	f50a 70ec 	add.w	r0, sl, #472	@ 0x1d8
c0de2254:	e9cd 0600 	strd	r0, r6, [sp]
c0de2258:	45ab      	cmp	fp, r5
c0de225a:	d2eb      	bcs.n	c0de2234 <inner_keccak256_extract+0x4c>
c0de225c:	4620      	mov	r0, r4
c0de225e:	4651      	mov	r1, sl
c0de2260:	2220      	movs	r2, #32
c0de2262:	46a0      	mov	r8, r4
c0de2264:	f009 ffbc 	bl	c0dec1e0 <__aeabi_memcpy>
c0de2268:	e9da 5408 	ldrd	r5, r4, [sl, #32]
c0de226c:	9f02      	ldr	r7, [sp, #8]
c0de226e:	2638      	movs	r6, #56	@ 0x38
c0de2270:	f116 0008 	adds.w	r0, r6, #8
c0de2274:	d008      	beq.n	c0de2288 <inner_keccak256_extract+0xa0>
c0de2276:	4628      	mov	r0, r5
c0de2278:	4621      	mov	r1, r4
c0de227a:	4632      	mov	r2, r6
c0de227c:	f009 feba 	bl	c0debff4 <__aeabi_llsr>
c0de2280:	f807 0b01 	strb.w	r0, [r7], #1
c0de2284:	3e08      	subs	r6, #8
c0de2286:	e7f3      	b.n	c0de2270 <inner_keccak256_extract+0x88>
c0de2288:	af04      	add	r7, sp, #16
c0de228a:	4638      	mov	r0, r7
c0de228c:	f7ff ff6b 	bl	c0de2166 <keccak_init>
c0de2290:	4638      	mov	r0, r7
c0de2292:	4641      	mov	r1, r8
c0de2294:	2228      	movs	r2, #40	@ 0x28
c0de2296:	4644      	mov	r4, r8
c0de2298:	f7ff ff69 	bl	c0de216e <keccak_update>
c0de229c:	9d03      	ldr	r5, [sp, #12]
c0de229e:	eba5 080b 	sub.w	r8, r5, fp
c0de22a2:	f1b8 0f1f 	cmp.w	r8, #31
c0de22a6:	d90b      	bls.n	c0de22c0 <inner_keccak256_extract+0xd8>
c0de22a8:	9e01      	ldr	r6, [sp, #4]
c0de22aa:	4638      	mov	r0, r7
c0de22ac:	eb06 010b 	add.w	r1, r6, fp
c0de22b0:	f7ff ff5f 	bl	c0de2172 <keccak_final>
c0de22b4:	f10b 0b20 	add.w	fp, fp, #32
c0de22b8:	f04f 0800 	mov.w	r8, #0
c0de22bc:	2000      	movs	r0, #0
c0de22be:	e00d      	b.n	c0de22dc <inner_keccak256_extract+0xf4>
c0de22c0:	4638      	mov	r0, r7
c0de22c2:	9f00      	ldr	r7, [sp, #0]
c0de22c4:	4639      	mov	r1, r7
c0de22c6:	f7ff ff54 	bl	c0de2172 <keccak_final>
c0de22ca:	9e01      	ldr	r6, [sp, #4]
c0de22cc:	4639      	mov	r1, r7
c0de22ce:	4642      	mov	r2, r8
c0de22d0:	eb06 000b 	add.w	r0, r6, fp
c0de22d4:	f009 ff84 	bl	c0dec1e0 <__aeabi_memcpy>
c0de22d8:	2020      	movs	r0, #32
c0de22da:	46ab      	mov	fp, r5
c0de22dc:	e9ca 807e 	strd	r8, r0, [sl, #504]	@ 0x1f8
c0de22e0:	e9da 0108 	ldrd	r0, r1, [sl, #32]
c0de22e4:	3001      	adds	r0, #1
c0de22e6:	f141 0100 	adc.w	r1, r1, #0
c0de22ea:	e9ca 0108 	strd	r0, r1, [sl, #32]
c0de22ee:	e7b3      	b.n	c0de2258 <inner_keccak256_extract+0x70>

c0de22f0 <pqcrystals_dilithium2_lowram_pack_sig_h>:
c0de22f0:	b5b0      	push	{r4, r5, r7, lr}
c0de22f2:	f500 6012 	add.w	r0, r0, #2336	@ 0x920
c0de22f6:	2400      	movs	r4, #0
c0de22f8:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de22fc:	d009      	beq.n	c0de2312 <pqcrystals_dilithium2_lowram_pack_sig_h+0x22>
c0de22fe:	f851 5024 	ldr.w	r5, [r1, r4, lsl #2]
c0de2302:	b125      	cbz	r5, c0de230e <pqcrystals_dilithium2_lowram_pack_sig_h+0x1e>
c0de2304:	681d      	ldr	r5, [r3, #0]
c0de2306:	5544      	strb	r4, [r0, r5]
c0de2308:	681d      	ldr	r5, [r3, #0]
c0de230a:	3501      	adds	r5, #1
c0de230c:	601d      	str	r5, [r3, #0]
c0de230e:	3401      	adds	r4, #1
c0de2310:	e7f2      	b.n	c0de22f8 <pqcrystals_dilithium2_lowram_pack_sig_h+0x8>
c0de2312:	6819      	ldr	r1, [r3, #0]
c0de2314:	4410      	add	r0, r2
c0de2316:	f880 1050 	strb.w	r1, [r0, #80]	@ 0x50
c0de231a:	bdb0      	pop	{r4, r5, r7, pc}

c0de231c <pqcrystals_dilithium2_lowram_pack_sig_h_zero>:
c0de231c:	680a      	ldr	r2, [r1, #0]
c0de231e:	f500 6012 	add.w	r0, r0, #2336	@ 0x920
c0de2322:	2300      	movs	r3, #0
c0de2324:	2a4f      	cmp	r2, #79	@ 0x4f
c0de2326:	bf88      	it	hi
c0de2328:	4770      	bxhi	lr
c0de232a:	5483      	strb	r3, [r0, r2]
c0de232c:	680a      	ldr	r2, [r1, #0]
c0de232e:	3201      	adds	r2, #1
c0de2330:	600a      	str	r2, [r1, #0]
c0de2332:	e7f7      	b.n	c0de2324 <pqcrystals_dilithium2_lowram_pack_sig_h_zero+0x8>

c0de2334 <poly_challenge_compress>:
c0de2334:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de2338:	2200      	movs	r2, #0
c0de233a:	2300      	movs	r3, #0
c0de233c:	2b44      	cmp	r3, #68	@ 0x44
c0de233e:	d002      	beq.n	c0de2346 <poly_challenge_compress+0x12>
c0de2340:	54c2      	strb	r2, [r0, r3]
c0de2342:	3301      	adds	r3, #1
c0de2344:	e7fa      	b.n	c0de233c <poly_challenge_compress+0x8>
c0de2346:	2200      	movs	r2, #0
c0de2348:	2301      	movs	r3, #1
c0de234a:	2600      	movs	r6, #0
c0de234c:	f04f 0800 	mov.w	r8, #0
c0de2350:	2500      	movs	r5, #0
c0de2352:	2700      	movs	r7, #0
c0de2354:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de2358:	d011      	beq.n	c0de237e <poly_challenge_compress+0x4a>
c0de235a:	f851 4022 	ldr.w	r4, [r1, r2, lsl #2]
c0de235e:	b164      	cbz	r4, c0de237a <poly_challenge_compress+0x46>
c0de2360:	5582      	strb	r2, [r0, r6]
c0de2362:	f851 4022 	ldr.w	r4, [r1, r2, lsl #2]
c0de2366:	3401      	adds	r4, #1
c0de2368:	bf04      	itt	eq
c0de236a:	433d      	orreq	r5, r7
c0de236c:	ea48 0803 	orreq.w	r8, r8, r3
c0de2370:	007c      	lsls	r4, r7, #1
c0de2372:	3601      	adds	r6, #1
c0de2374:	ea44 77d3 	orr.w	r7, r4, r3, lsr #31
c0de2378:	005b      	lsls	r3, r3, #1
c0de237a:	3201      	adds	r2, #1
c0de237c:	e7ea      	b.n	c0de2354 <poly_challenge_compress+0x20>
c0de237e:	f100 073c 	add.w	r7, r0, #60	@ 0x3c
c0de2382:	2600      	movs	r6, #0
c0de2384:	2e40      	cmp	r6, #64	@ 0x40
c0de2386:	bf08      	it	eq
c0de2388:	e8bd 81f0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de238c:	4640      	mov	r0, r8
c0de238e:	4629      	mov	r1, r5
c0de2390:	4632      	mov	r2, r6
c0de2392:	f009 fe2f 	bl	c0debff4 <__aeabi_llsr>
c0de2396:	f807 0b01 	strb.w	r0, [r7], #1
c0de239a:	3608      	adds	r6, #8
c0de239c:	e7f2      	b.n	c0de2384 <poly_challenge_compress+0x50>

c0de239e <poly_challenge_decompress>:
c0de239e:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de23a2:	4688      	mov	r8, r1
c0de23a4:	4682      	mov	sl, r0
c0de23a6:	2000      	movs	r0, #0
c0de23a8:	2100      	movs	r1, #0
c0de23aa:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de23ae:	d003      	beq.n	c0de23b8 <poly_challenge_decompress+0x1a>
c0de23b0:	f84a 0021 	str.w	r0, [sl, r1, lsl #2]
c0de23b4:	3101      	adds	r1, #1
c0de23b6:	e7f8      	b.n	c0de23aa <poly_challenge_decompress+0xc>
c0de23b8:	f108 053c 	add.w	r5, r8, #60	@ 0x3c
c0de23bc:	2600      	movs	r6, #0
c0de23be:	2700      	movs	r7, #0
c0de23c0:	2400      	movs	r4, #0
c0de23c2:	2e40      	cmp	r6, #64	@ 0x40
c0de23c4:	d009      	beq.n	c0de23da <poly_challenge_decompress+0x3c>
c0de23c6:	f815 0b01 	ldrb.w	r0, [r5], #1
c0de23ca:	2100      	movs	r1, #0
c0de23cc:	4632      	mov	r2, r6
c0de23ce:	f009 fdff 	bl	c0debfd0 <__aeabi_llsl>
c0de23d2:	430c      	orrs	r4, r1
c0de23d4:	4307      	orrs	r7, r0
c0de23d6:	3608      	adds	r6, #8
c0de23d8:	e7f3      	b.n	c0de23c2 <poly_challenge_decompress+0x24>
c0de23da:	2000      	movs	r0, #0
c0de23dc:	2827      	cmp	r0, #39	@ 0x27
c0de23de:	bf08      	it	eq
c0de23e0:	e8bd 85f8 	ldmiaeq.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0de23e4:	07fa      	lsls	r2, r7, #31
c0de23e6:	f818 1000 	ldrb.w	r1, [r8, r0]
c0de23ea:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
c0de23ee:	bf08      	it	eq
c0de23f0:	2201      	moveq	r2, #1
c0de23f2:	ea5f 0454 	movs.w	r4, r4, lsr #1
c0de23f6:	f84a 2021 	str.w	r2, [sl, r1, lsl #2]
c0de23fa:	ea4f 0737 	mov.w	r7, r7, rrx
c0de23fe:	3001      	adds	r0, #1
c0de2400:	e7ec      	b.n	c0de23dc <poly_challenge_decompress+0x3e>

c0de2402 <poly_schoolbook>:
c0de2402:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de2406:	4614      	mov	r4, r2
c0de2408:	468a      	mov	sl, r1
c0de240a:	2200      	movs	r2, #0
c0de240c:	2100      	movs	r1, #0
c0de240e:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de2412:	d003      	beq.n	c0de241c <poly_schoolbook+0x1a>
c0de2414:	f840 2021 	str.w	r2, [r0, r1, lsl #2]
c0de2418:	3101      	adds	r1, #1
c0de241a:	e7f8      	b.n	c0de240e <poly_schoolbook+0xc>
c0de241c:	f10a 053c 	add.w	r5, sl, #60	@ 0x3c
c0de2420:	2700      	movs	r7, #0
c0de2422:	f04f 0b00 	mov.w	fp, #0
c0de2426:	2600      	movs	r6, #0
c0de2428:	9003      	str	r0, [sp, #12]
c0de242a:	2f40      	cmp	r7, #64	@ 0x40
c0de242c:	d006      	beq.n	c0de243c <poly_schoolbook+0x3a>
c0de242e:	f000 fc0a 	bl	c0de2c46 <OUTLINED_FUNCTION_2>
c0de2432:	430e      	orrs	r6, r1
c0de2434:	ea4b 0b00 	orr.w	fp, fp, r0
c0de2438:	3708      	adds	r7, #8
c0de243a:	e7f6      	b.n	c0de242a <poly_schoolbook+0x28>
c0de243c:	f04f 0800 	mov.w	r8, #0
c0de2440:	f8cd a004 	str.w	sl, [sp, #4]
c0de2444:	f1b8 0f27 	cmp.w	r8, #39	@ 0x27
c0de2448:	bf08      	it	eq
c0de244a:	e8bd 8dff 	ldmiaeq.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de244e:	f81a 0008 	ldrb.w	r0, [sl, r8]
c0de2452:	ea5f 71cb 	movs.w	r1, fp, lsl #31
c0de2456:	f5c0 7780 	rsb	r7, r0, #256	@ 0x100
c0de245a:	d111      	bne.n	c0de2480 <poly_schoolbook+0x7e>
c0de245c:	9903      	ldr	r1, [sp, #12]
c0de245e:	9602      	str	r6, [sp, #8]
c0de2460:	2500      	movs	r5, #0
c0de2462:	eb01 0680 	add.w	r6, r1, r0, lsl #2
c0de2466:	42af      	cmp	r7, r5
c0de2468:	d01b      	beq.n	c0de24a2 <poly_schoolbook+0xa0>
c0de246a:	4620      	mov	r0, r4
c0de246c:	4629      	mov	r1, r5
c0de246e:	f000 f842 	bl	c0de24f6 <polyt0_unpack_idx>
c0de2472:	f856 1025 	ldr.w	r1, [r6, r5, lsl #2]
c0de2476:	4408      	add	r0, r1
c0de2478:	f846 0025 	str.w	r0, [r6, r5, lsl #2]
c0de247c:	3501      	adds	r5, #1
c0de247e:	e7f2      	b.n	c0de2466 <poly_schoolbook+0x64>
c0de2480:	9903      	ldr	r1, [sp, #12]
c0de2482:	2500      	movs	r5, #0
c0de2484:	eb01 0a80 	add.w	sl, r1, r0, lsl #2
c0de2488:	42af      	cmp	r7, r5
c0de248a:	d01b      	beq.n	c0de24c4 <poly_schoolbook+0xc2>
c0de248c:	4620      	mov	r0, r4
c0de248e:	4629      	mov	r1, r5
c0de2490:	f000 f831 	bl	c0de24f6 <polyt0_unpack_idx>
c0de2494:	f85a 1025 	ldr.w	r1, [sl, r5, lsl #2]
c0de2498:	1a08      	subs	r0, r1, r0
c0de249a:	f84a 0025 	str.w	r0, [sl, r5, lsl #2]
c0de249e:	3501      	adds	r5, #1
c0de24a0:	e7f2      	b.n	c0de2488 <poly_schoolbook+0x86>
c0de24a2:	f5a6 6580 	sub.w	r5, r6, #1024	@ 0x400
c0de24a6:	9e02      	ldr	r6, [sp, #8]
c0de24a8:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de24ac:	d01c      	beq.n	c0de24e8 <poly_schoolbook+0xe6>
c0de24ae:	4620      	mov	r0, r4
c0de24b0:	4639      	mov	r1, r7
c0de24b2:	f000 f820 	bl	c0de24f6 <polyt0_unpack_idx>
c0de24b6:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de24ba:	1a08      	subs	r0, r1, r0
c0de24bc:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de24c0:	3701      	adds	r7, #1
c0de24c2:	e7f1      	b.n	c0de24a8 <poly_schoolbook+0xa6>
c0de24c4:	f5aa 6580 	sub.w	r5, sl, #1024	@ 0x400
c0de24c8:	f8dd a004 	ldr.w	sl, [sp, #4]
c0de24cc:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de24d0:	d00a      	beq.n	c0de24e8 <poly_schoolbook+0xe6>
c0de24d2:	4620      	mov	r0, r4
c0de24d4:	4639      	mov	r1, r7
c0de24d6:	f000 f80e 	bl	c0de24f6 <polyt0_unpack_idx>
c0de24da:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de24de:	4408      	add	r0, r1
c0de24e0:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de24e4:	3701      	adds	r7, #1
c0de24e6:	e7f1      	b.n	c0de24cc <poly_schoolbook+0xca>
c0de24e8:	ea5f 0656 	movs.w	r6, r6, lsr #1
c0de24ec:	f108 0801 	add.w	r8, r8, #1
c0de24f0:	ea4f 0b3b 	mov.w	fp, fp, rrx
c0de24f4:	e7a6      	b.n	c0de2444 <poly_schoolbook+0x42>

c0de24f6 <polyt0_unpack_idx>:
c0de24f6:	08ca      	lsrs	r2, r1, #3
c0de24f8:	230d      	movs	r3, #13
c0de24fa:	f001 0107 	and.w	r1, r1, #7
c0de24fe:	fb02 0003 	mla	r0, r2, r3, r0
c0de2502:	2906      	cmp	r1, #6
c0de2504:	d00e      	beq.n	c0de2524 <polyt0_unpack_idx+0x2e>
c0de2506:	2901      	cmp	r1, #1
c0de2508:	d014      	beq.n	c0de2534 <polyt0_unpack_idx+0x3e>
c0de250a:	2902      	cmp	r1, #2
c0de250c:	d01a      	beq.n	c0de2544 <polyt0_unpack_idx+0x4e>
c0de250e:	2903      	cmp	r1, #3
c0de2510:	d01d      	beq.n	c0de254e <polyt0_unpack_idx+0x58>
c0de2512:	2904      	cmp	r1, #4
c0de2514:	d023      	beq.n	c0de255e <polyt0_unpack_idx+0x68>
c0de2516:	2905      	cmp	r1, #5
c0de2518:	d029      	beq.n	c0de256e <polyt0_unpack_idx+0x78>
c0de251a:	bb69      	cbnz	r1, c0de2578 <polyt0_unpack_idx+0x82>
c0de251c:	7801      	ldrb	r1, [r0, #0]
c0de251e:	7840      	ldrb	r0, [r0, #1]
c0de2520:	0200      	lsls	r0, r0, #8
c0de2522:	e02d      	b.n	c0de2580 <polyt0_unpack_idx+0x8a>
c0de2524:	7a82      	ldrb	r2, [r0, #10]
c0de2526:	7a41      	ldrb	r1, [r0, #9]
c0de2528:	7ac3      	ldrb	r3, [r0, #11]
c0de252a:	0090      	lsls	r0, r2, #2
c0de252c:	ea40 1091 	orr.w	r0, r0, r1, lsr #6
c0de2530:	0299      	lsls	r1, r3, #10
c0de2532:	e025      	b.n	c0de2580 <polyt0_unpack_idx+0x8a>
c0de2534:	7882      	ldrb	r2, [r0, #2]
c0de2536:	7841      	ldrb	r1, [r0, #1]
c0de2538:	78c3      	ldrb	r3, [r0, #3]
c0de253a:	00d0      	lsls	r0, r2, #3
c0de253c:	ea40 1051 	orr.w	r0, r0, r1, lsr #5
c0de2540:	02d9      	lsls	r1, r3, #11
c0de2542:	e01d      	b.n	c0de2580 <polyt0_unpack_idx+0x8a>
c0de2544:	78c1      	ldrb	r1, [r0, #3]
c0de2546:	7900      	ldrb	r0, [r0, #4]
c0de2548:	0180      	lsls	r0, r0, #6
c0de254a:	0889      	lsrs	r1, r1, #2
c0de254c:	e018      	b.n	c0de2580 <polyt0_unpack_idx+0x8a>
c0de254e:	7942      	ldrb	r2, [r0, #5]
c0de2550:	7901      	ldrb	r1, [r0, #4]
c0de2552:	7983      	ldrb	r3, [r0, #6]
c0de2554:	0050      	lsls	r0, r2, #1
c0de2556:	ea40 10d1 	orr.w	r0, r0, r1, lsr #7
c0de255a:	0259      	lsls	r1, r3, #9
c0de255c:	e010      	b.n	c0de2580 <polyt0_unpack_idx+0x8a>
c0de255e:	79c2      	ldrb	r2, [r0, #7]
c0de2560:	7981      	ldrb	r1, [r0, #6]
c0de2562:	7a03      	ldrb	r3, [r0, #8]
c0de2564:	0110      	lsls	r0, r2, #4
c0de2566:	ea40 1011 	orr.w	r0, r0, r1, lsr #4
c0de256a:	0319      	lsls	r1, r3, #12
c0de256c:	e008      	b.n	c0de2580 <polyt0_unpack_idx+0x8a>
c0de256e:	7a01      	ldrb	r1, [r0, #8]
c0de2570:	7a40      	ldrb	r0, [r0, #9]
c0de2572:	01c0      	lsls	r0, r0, #7
c0de2574:	0849      	lsrs	r1, r1, #1
c0de2576:	e003      	b.n	c0de2580 <polyt0_unpack_idx+0x8a>
c0de2578:	7ac1      	ldrb	r1, [r0, #11]
c0de257a:	7b00      	ldrb	r0, [r0, #12]
c0de257c:	0140      	lsls	r0, r0, #5
c0de257e:	08c9      	lsrs	r1, r1, #3
c0de2580:	4308      	orrs	r0, r1
c0de2582:	f36f 305f 	bfc	r0, #13, #19
c0de2586:	f5c0 5080 	rsb	r0, r0, #4096	@ 0x1000
c0de258a:	4770      	bx	lr

c0de258c <poly_schoolbook_t1>:
c0de258c:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de2590:	4614      	mov	r4, r2
c0de2592:	468b      	mov	fp, r1
c0de2594:	2200      	movs	r2, #0
c0de2596:	2100      	movs	r1, #0
c0de2598:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de259c:	d003      	beq.n	c0de25a6 <poly_schoolbook_t1+0x1a>
c0de259e:	f840 2021 	str.w	r2, [r0, r1, lsl #2]
c0de25a2:	3101      	adds	r1, #1
c0de25a4:	e7f8      	b.n	c0de2598 <poly_schoolbook_t1+0xc>
c0de25a6:	f10b 053c 	add.w	r5, fp, #60	@ 0x3c
c0de25aa:	2700      	movs	r7, #0
c0de25ac:	f04f 0a00 	mov.w	sl, #0
c0de25b0:	2600      	movs	r6, #0
c0de25b2:	9002      	str	r0, [sp, #8]
c0de25b4:	2f40      	cmp	r7, #64	@ 0x40
c0de25b6:	d006      	beq.n	c0de25c6 <poly_schoolbook_t1+0x3a>
c0de25b8:	f000 fb45 	bl	c0de2c46 <OUTLINED_FUNCTION_2>
c0de25bc:	430e      	orrs	r6, r1
c0de25be:	ea4a 0a00 	orr.w	sl, sl, r0
c0de25c2:	3708      	adds	r7, #8
c0de25c4:	e7f6      	b.n	c0de25b4 <poly_schoolbook_t1+0x28>
c0de25c6:	4832      	ldr	r0, [pc, #200]	@ (c0de2690 <poly_schoolbook_t1+0x104>)
c0de25c8:	2200      	movs	r2, #0
c0de25ca:	f8cd b000 	str.w	fp, [sp]
c0de25ce:	4680      	mov	r8, r0
c0de25d0:	2a27      	cmp	r2, #39	@ 0x27
c0de25d2:	bf08      	it	eq
c0de25d4:	e8bd 8dff 	ldmiaeq.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de25d8:	f81b 0002 	ldrb.w	r0, [fp, r2]
c0de25dc:	ea5f 71ca 	movs.w	r1, sl, lsl #31
c0de25e0:	9203      	str	r2, [sp, #12]
c0de25e2:	f5c0 7780 	rsb	r7, r0, #256	@ 0x100
c0de25e6:	d112      	bne.n	c0de260e <poly_schoolbook_t1+0x82>
c0de25e8:	9902      	ldr	r1, [sp, #8]
c0de25ea:	9601      	str	r6, [sp, #4]
c0de25ec:	2500      	movs	r5, #0
c0de25ee:	eb01 0680 	add.w	r6, r1, r0, lsl #2
c0de25f2:	42af      	cmp	r7, r5
c0de25f4:	d01e      	beq.n	c0de2634 <poly_schoolbook_t1+0xa8>
c0de25f6:	4620      	mov	r0, r4
c0de25f8:	4629      	mov	r1, r5
c0de25fa:	f000 f84b 	bl	c0de2694 <polyt1_unpack_idx>
c0de25fe:	f856 1025 	ldr.w	r1, [r6, r5, lsl #2]
c0de2602:	eb01 3040 	add.w	r0, r1, r0, lsl #13
c0de2606:	f846 0025 	str.w	r0, [r6, r5, lsl #2]
c0de260a:	3501      	adds	r5, #1
c0de260c:	e7f1      	b.n	c0de25f2 <poly_schoolbook_t1+0x66>
c0de260e:	9902      	ldr	r1, [sp, #8]
c0de2610:	2500      	movs	r5, #0
c0de2612:	eb01 0b80 	add.w	fp, r1, r0, lsl #2
c0de2616:	42af      	cmp	r7, r5
c0de2618:	d01f      	beq.n	c0de265a <poly_schoolbook_t1+0xce>
c0de261a:	4620      	mov	r0, r4
c0de261c:	4629      	mov	r1, r5
c0de261e:	f000 f839 	bl	c0de2694 <polyt1_unpack_idx>
c0de2622:	f85b 1025 	ldr.w	r1, [fp, r5, lsl #2]
c0de2626:	4642      	mov	r2, r8
c0de2628:	fb00 1008 	mla	r0, r0, r8, r1
c0de262c:	f84b 0025 	str.w	r0, [fp, r5, lsl #2]
c0de2630:	3501      	adds	r5, #1
c0de2632:	e7f0      	b.n	c0de2616 <poly_schoolbook_t1+0x8a>
c0de2634:	f5a6 6580 	sub.w	r5, r6, #1024	@ 0x400
c0de2638:	9e01      	ldr	r6, [sp, #4]
c0de263a:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de263e:	d01f      	beq.n	c0de2680 <poly_schoolbook_t1+0xf4>
c0de2640:	4620      	mov	r0, r4
c0de2642:	4639      	mov	r1, r7
c0de2644:	f000 f826 	bl	c0de2694 <polyt1_unpack_idx>
c0de2648:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de264c:	4642      	mov	r2, r8
c0de264e:	fb00 1008 	mla	r0, r0, r8, r1
c0de2652:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de2656:	3701      	adds	r7, #1
c0de2658:	e7ef      	b.n	c0de263a <poly_schoolbook_t1+0xae>
c0de265a:	f5ab 6580 	sub.w	r5, fp, #1024	@ 0x400
c0de265e:	f8dd b000 	ldr.w	fp, [sp]
c0de2662:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de2666:	d00b      	beq.n	c0de2680 <poly_schoolbook_t1+0xf4>
c0de2668:	4620      	mov	r0, r4
c0de266a:	4639      	mov	r1, r7
c0de266c:	f000 f812 	bl	c0de2694 <polyt1_unpack_idx>
c0de2670:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de2674:	eb01 3040 	add.w	r0, r1, r0, lsl #13
c0de2678:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de267c:	3701      	adds	r7, #1
c0de267e:	e7f0      	b.n	c0de2662 <poly_schoolbook_t1+0xd6>
c0de2680:	9a03      	ldr	r2, [sp, #12]
c0de2682:	ea5f 0656 	movs.w	r6, r6, lsr #1
c0de2686:	ea4f 0a3a 	mov.w	sl, sl, rrx
c0de268a:	3201      	adds	r2, #1
c0de268c:	e7a0      	b.n	c0de25d0 <poly_schoolbook_t1+0x44>
c0de268e:	bf00      	nop
c0de2690:	ffffe000 	.word	0xffffe000

c0de2694 <polyt1_unpack_idx>:
c0de2694:	088a      	lsrs	r2, r1, #2
c0de2696:	f001 0103 	and.w	r1, r1, #3
c0de269a:	eb02 0282 	add.w	r2, r2, r2, lsl #2
c0de269e:	2902      	cmp	r1, #2
c0de26a0:	4410      	add	r0, r2
c0de26a2:	d006      	beq.n	c0de26b2 <polyt1_unpack_idx+0x1e>
c0de26a4:	2901      	cmp	r1, #1
c0de26a6:	d009      	beq.n	c0de26bc <polyt1_unpack_idx+0x28>
c0de26a8:	b969      	cbnz	r1, c0de26c6 <polyt1_unpack_idx+0x32>
c0de26aa:	7801      	ldrb	r1, [r0, #0]
c0de26ac:	2208      	movs	r2, #8
c0de26ae:	2301      	movs	r3, #1
c0de26b0:	e00d      	b.n	c0de26ce <polyt1_unpack_idx+0x3a>
c0de26b2:	7881      	ldrb	r1, [r0, #2]
c0de26b4:	2204      	movs	r2, #4
c0de26b6:	2303      	movs	r3, #3
c0de26b8:	0909      	lsrs	r1, r1, #4
c0de26ba:	e008      	b.n	c0de26ce <polyt1_unpack_idx+0x3a>
c0de26bc:	7841      	ldrb	r1, [r0, #1]
c0de26be:	2206      	movs	r2, #6
c0de26c0:	2302      	movs	r3, #2
c0de26c2:	0889      	lsrs	r1, r1, #2
c0de26c4:	e003      	b.n	c0de26ce <polyt1_unpack_idx+0x3a>
c0de26c6:	78c1      	ldrb	r1, [r0, #3]
c0de26c8:	2202      	movs	r2, #2
c0de26ca:	2304      	movs	r3, #4
c0de26cc:	0989      	lsrs	r1, r1, #6
c0de26ce:	5cc0      	ldrb	r0, [r0, r3]
c0de26d0:	4090      	lsls	r0, r2
c0de26d2:	f400 707f 	and.w	r0, r0, #1020	@ 0x3fc
c0de26d6:	4308      	orrs	r0, r1
c0de26d8:	4770      	bx	lr

c0de26da <polyw_pack>:
c0de26da:	b5b0      	push	{r4, r5, r7, lr}
c0de26dc:	4605      	mov	r5, r0
c0de26de:	4608      	mov	r0, r1
c0de26e0:	460c      	mov	r4, r1
c0de26e2:	f000 fb3d 	bl	c0de2d60 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de26e6:	4620      	mov	r0, r4
c0de26e8:	f000 fb49 	bl	c0de2d7e <pqcrystals_dilithium2_lowram_poly_caddq>
c0de26ec:	2000      	movs	r0, #0
c0de26ee:	f5b0 7f80 	cmp.w	r0, #256	@ 0x100
c0de26f2:	bf08      	it	eq
c0de26f4:	bdb0      	popeq	{r4, r5, r7, pc}
c0de26f6:	f854 1020 	ldr.w	r1, [r4, r0, lsl #2]
c0de26fa:	eb00 0240 	add.w	r2, r0, r0, lsl #1
c0de26fe:	54a9      	strb	r1, [r5, r2]
c0de2700:	18a9      	adds	r1, r5, r2
c0de2702:	f854 2020 	ldr.w	r2, [r4, r0, lsl #2]
c0de2706:	0a12      	lsrs	r2, r2, #8
c0de2708:	704a      	strb	r2, [r1, #1]
c0de270a:	eb04 0280 	add.w	r2, r4, r0, lsl #2
c0de270e:	3001      	adds	r0, #1
c0de2710:	8852      	ldrh	r2, [r2, #2]
c0de2712:	708a      	strb	r2, [r1, #2]
c0de2714:	e7eb      	b.n	c0de26ee <polyw_pack+0x14>

c0de2716 <polyw_unpack>:
c0de2716:	b5b0      	push	{r4, r5, r7, lr}
c0de2718:	2200      	movs	r2, #0
c0de271a:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de271e:	bf08      	it	eq
c0de2720:	bdb0      	popeq	{r4, r5, r7, pc}
c0de2722:	eb02 0342 	add.w	r3, r2, r2, lsl #1
c0de2726:	5ccc      	ldrb	r4, [r1, r3]
c0de2728:	440b      	add	r3, r1
c0de272a:	f840 4022 	str.w	r4, [r0, r2, lsl #2]
c0de272e:	785d      	ldrb	r5, [r3, #1]
c0de2730:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de2734:	f840 4022 	str.w	r4, [r0, r2, lsl #2]
c0de2738:	789b      	ldrb	r3, [r3, #2]
c0de273a:	ea44 4303 	orr.w	r3, r4, r3, lsl #16
c0de273e:	f840 3022 	str.w	r3, [r0, r2, lsl #2]
c0de2742:	3201      	adds	r2, #1
c0de2744:	e7e9      	b.n	c0de271a <polyw_unpack+0x4>

c0de2746 <polyw_sub>:
c0de2746:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2748:	3102      	adds	r1, #2
c0de274a:	2300      	movs	r3, #0
c0de274c:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
c0de2750:	bf08      	it	eq
c0de2752:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de2754:	f811 5c02 	ldrb.w	r5, [r1, #-2]
c0de2758:	f811 6c01 	ldrb.w	r6, [r1, #-1]
c0de275c:	f811 7b03 	ldrb.w	r7, [r1], #3
c0de2760:	f852 4023 	ldr.w	r4, [r2, r3, lsl #2]
c0de2764:	ea45 2506 	orr.w	r5, r5, r6, lsl #8
c0de2768:	ea45 4507 	orr.w	r5, r5, r7, lsl #16
c0de276c:	1b2c      	subs	r4, r5, r4
c0de276e:	f840 4023 	str.w	r4, [r0, r3, lsl #2]
c0de2772:	3301      	adds	r3, #1
c0de2774:	e7ea      	b.n	c0de274c <polyw_sub+0x6>

c0de2776 <poly_highbits>:
c0de2776:	b5b0      	push	{r4, r5, r7, lr}
c0de2778:	2200      	movs	r2, #0
c0de277a:	f642 430b 	movw	r3, #11275	@ 0x2c0b
c0de277e:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de2782:	bf08      	it	eq
c0de2784:	bdb0      	popeq	{r4, r5, r7, pc}
c0de2786:	f851 4022 	ldr.w	r4, [r1, r2, lsl #2]
c0de278a:	347f      	adds	r4, #127	@ 0x7f
c0de278c:	11e4      	asrs	r4, r4, #7
c0de278e:	435c      	muls	r4, r3
c0de2790:	f504 0500 	add.w	r5, r4, #8388608	@ 0x800000
c0de2794:	162d      	asrs	r5, r5, #24
c0de2796:	f1b4 5f2e 	cmp.w	r4, #729808896	@ 0x2b800000
c0de279a:	bfa8      	it	ge
c0de279c:	2500      	movge	r5, #0
c0de279e:	f840 5022 	str.w	r5, [r0, r2, lsl #2]
c0de27a2:	3201      	adds	r2, #1
c0de27a4:	e7eb      	b.n	c0de277e <poly_highbits+0x8>
	...

c0de27a8 <poly_lowbits>:
c0de27a8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de27ac:	4e13      	ldr	r6, [pc, #76]	@ (c0de27fc <poly_lowbits+0x54>)
c0de27ae:	4f15      	ldr	r7, [pc, #84]	@ (c0de2804 <poly_lowbits+0x5c>)
c0de27b0:	2200      	movs	r2, #0
c0de27b2:	f642 4c0b 	movw	ip, #11275	@ 0x2c0b
c0de27b6:	f06f 0e01 	mvn.w	lr, #1
c0de27ba:	46b0      	mov	r8, r6
c0de27bc:	4e10      	ldr	r6, [pc, #64]	@ (c0de2800 <poly_lowbits+0x58>)
c0de27be:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de27c2:	bf08      	it	eq
c0de27c4:	e8bd 81f0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de27c8:	f851 3022 	ldr.w	r3, [r1, r2, lsl #2]
c0de27cc:	f103 047f 	add.w	r4, r3, #127	@ 0x7f
c0de27d0:	11e4      	asrs	r4, r4, #7
c0de27d2:	fb04 f40c 	mul.w	r4, r4, ip
c0de27d6:	f504 0500 	add.w	r5, r4, #8388608	@ 0x800000
c0de27da:	f1b4 5f2e 	cmp.w	r4, #729808896	@ 0x2b800000
c0de27de:	4644      	mov	r4, r8
c0de27e0:	ea0e 55e5 	and.w	r5, lr, r5, asr #23
c0de27e4:	bfb8      	it	lt
c0de27e6:	fb05 3308 	mlalt	r3, r5, r8, r3
c0de27ea:	42bb      	cmp	r3, r7
c0de27ec:	4634      	mov	r4, r6
c0de27ee:	bfc8      	it	gt
c0de27f0:	4433      	addgt	r3, r6
c0de27f2:	f840 3022 	str.w	r3, [r0, r2, lsl #2]
c0de27f6:	3201      	adds	r2, #1
c0de27f8:	e7e1      	b.n	c0de27be <poly_lowbits+0x16>
c0de27fa:	bf00      	nop
c0de27fc:	fffe8c00 	.word	0xfffe8c00
c0de2800:	ff801fff 	.word	0xff801fff
c0de2804:	003ff000 	.word	0x003ff000

c0de2808 <unpack_sk_s1>:
c0de2808:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de280c:	eb01 1142 	add.w	r1, r1, r2, lsl #5
c0de2810:	3180      	adds	r1, #128	@ 0x80
c0de2812:	f001 bb18 	b.w	c0de3e46 <small_polyeta_unpack>

c0de2816 <unpack_sk_s2>:
c0de2816:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de281a:	eb01 1142 	add.w	r1, r1, r2, lsl #5
c0de281e:	f501 7100 	add.w	r1, r1, #512	@ 0x200
c0de2822:	f001 bb10 	b.w	c0de3e46 <small_polyeta_unpack>
	...

c0de2828 <poly_uniform_pointwise_montgomery_polywadd_lowram>:
c0de2828:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de282c:	f8dd 8030 	ldr.w	r8, [sp, #48]	@ 0x30
c0de2830:	468a      	mov	sl, r1
c0de2832:	4683      	mov	fp, r0
c0de2834:	4611      	mov	r1, r2
c0de2836:	461a      	mov	r2, r3
c0de2838:	4640      	mov	r0, r8
c0de283a:	f001 fb56 	bl	c0de3eea <pqcrystals_dilithium2_lowram_dilithium_shake128_stream_init>
c0de283e:	4c10      	ldr	r4, [pc, #64]	@ (c0de2880 <poly_uniform_pointwise_montgomery_polywadd_lowram+0x58>)
c0de2840:	2700      	movs	r7, #0
c0de2842:	f10d 0607 	add.w	r6, sp, #7
c0de2846:	4630      	mov	r0, r6
c0de2848:	2109      	movs	r1, #9
c0de284a:	4642      	mov	r2, r8
c0de284c:	f7fe fbf7 	bl	c0de103e <pqcrystals_dilithium_fips202_ref_shake128_squeeze>
c0de2850:	2500      	movs	r5, #0
c0de2852:	2d08      	cmp	r5, #8
c0de2854:	bf98      	it	ls
c0de2856:	f5b7 7f80 	cmpls.w	r7, #256	@ 0x100
c0de285a:	d20b      	bcs.n	c0de2874 <poly_uniform_pointwise_montgomery_polywadd_lowram+0x4c>
c0de285c:	f000 f9de 	bl	c0de2c1c <OUTLINED_FUNCTION_0>
c0de2860:	d806      	bhi.n	c0de2870 <poly_uniform_pointwise_montgomery_polywadd_lowram+0x48>
c0de2862:	f85a 1027 	ldr.w	r1, [sl, r7, lsl #2]
c0de2866:	f000 f9f4 	bl	c0de2c52 <OUTLINED_FUNCTION_3>
c0de286a:	f000 f9f6 	bl	c0de2c5a <OUTLINED_FUNCTION_4>
c0de286e:	3701      	adds	r7, #1
c0de2870:	3503      	adds	r5, #3
c0de2872:	e7ee      	b.n	c0de2852 <poly_uniform_pointwise_montgomery_polywadd_lowram+0x2a>
c0de2874:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de2878:	bf28      	it	cs
c0de287a:	e8bd 8dff 	ldmiacs.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de287e:	e7e2      	b.n	c0de2846 <poly_uniform_pointwise_montgomery_polywadd_lowram+0x1e>
c0de2880:	007fe000 	.word	0x007fe000

c0de2884 <polyw_add_idx>:
c0de2884:	b570      	push	{r4, r5, r6, lr}
c0de2886:	4604      	mov	r4, r0
c0de2888:	eb02 0542 	add.w	r5, r2, r2, lsl #1
c0de288c:	1966      	adds	r6, r4, r5
c0de288e:	5d40      	ldrb	r0, [r0, r5]
c0de2890:	7872      	ldrb	r2, [r6, #1]
c0de2892:	78b3      	ldrb	r3, [r6, #2]
c0de2894:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de2898:	ea40 4003 	orr.w	r0, r0, r3, lsl #16
c0de289c:	4408      	add	r0, r1
c0de289e:	f000 fd57 	bl	c0de3350 <pqcrystals_dilithium2_lowram_freeze>
c0de28a2:	0c01      	lsrs	r1, r0, #16
c0de28a4:	5560      	strb	r0, [r4, r5]
c0de28a6:	0a00      	lsrs	r0, r0, #8
c0de28a8:	70b1      	strb	r1, [r6, #2]
c0de28aa:	7070      	strb	r0, [r6, #1]
c0de28ac:	bd70      	pop	{r4, r5, r6, pc}

c0de28ae <poly_uniform_gamma1_lowram>:
c0de28ae:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de28b0:	b085      	sub	sp, #20
c0de28b2:	4605      	mov	r5, r0
c0de28b4:	4618      	mov	r0, r3
c0de28b6:	461c      	mov	r4, r3
c0de28b8:	f001 fb2b 	bl	c0de3f12 <pqcrystals_dilithium2_lowram_dilithium_shake256_stream_init>
c0de28bc:	2700      	movs	r7, #0
c0de28be:	ae01      	add	r6, sp, #4
c0de28c0:	2f40      	cmp	r7, #64	@ 0x40
c0de28c2:	bf04      	itt	eq
c0de28c4:	b005      	addeq	sp, #20
c0de28c6:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de28c8:	4630      	mov	r0, r6
c0de28ca:	2109      	movs	r1, #9
c0de28cc:	4622      	mov	r2, r4
c0de28ce:	f7fe fc9f 	bl	c0de1210 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de28d2:	4630      	mov	r0, r6
c0de28d4:	f000 f80c 	bl	c0de28f0 <polyz_unpack_inplace>
c0de28d8:	2000      	movs	r0, #0
c0de28da:	2804      	cmp	r0, #4
c0de28dc:	d005      	beq.n	c0de28ea <poly_uniform_gamma1_lowram+0x3c>
c0de28de:	f856 1020 	ldr.w	r1, [r6, r0, lsl #2]
c0de28e2:	f845 1020 	str.w	r1, [r5, r0, lsl #2]
c0de28e6:	3001      	adds	r0, #1
c0de28e8:	e7f7      	b.n	c0de28da <poly_uniform_gamma1_lowram+0x2c>
c0de28ea:	3510      	adds	r5, #16
c0de28ec:	3701      	adds	r7, #1
c0de28ee:	e7e7      	b.n	c0de28c0 <poly_uniform_gamma1_lowram+0x12>

c0de28f0 <polyz_unpack_inplace>:
c0de28f0:	b5b0      	push	{r4, r5, r7, lr}
c0de28f2:	7801      	ldrb	r1, [r0, #0]
c0de28f4:	7883      	ldrb	r3, [r0, #2]
c0de28f6:	7842      	ldrb	r2, [r0, #1]
c0de28f8:	78c4      	ldrb	r4, [r0, #3]
c0de28fa:	7a05      	ldrb	r5, [r0, #8]
c0de28fc:	f363 4111 	bfi	r1, r3, #16, #2
c0de2900:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de2904:	79c2      	ldrb	r2, [r0, #7]
c0de2906:	f5c1 3100 	rsb	r1, r1, #131072	@ 0x20000
c0de290a:	6001      	str	r1, [r0, #0]
c0de290c:	7981      	ldrb	r1, [r0, #6]
c0de290e:	0092      	lsls	r2, r2, #2
c0de2910:	ea42 1291 	orr.w	r2, r2, r1, lsr #6
c0de2914:	f001 013f 	and.w	r1, r1, #63	@ 0x3f
c0de2918:	ea42 2285 	orr.w	r2, r2, r5, lsl #10
c0de291c:	7945      	ldrb	r5, [r0, #5]
c0de291e:	f5c2 3200 	rsb	r2, r2, #131072	@ 0x20000
c0de2922:	60c2      	str	r2, [r0, #12]
c0de2924:	7902      	ldrb	r2, [r0, #4]
c0de2926:	012d      	lsls	r5, r5, #4
c0de2928:	ea45 1512 	orr.w	r5, r5, r2, lsr #4
c0de292c:	ea45 3101 	orr.w	r1, r5, r1, lsl #12
c0de2930:	f5c1 3100 	rsb	r1, r1, #131072	@ 0x20000
c0de2934:	6081      	str	r1, [r0, #8]
c0de2936:	0899      	lsrs	r1, r3, #2
c0de2938:	f362 3191 	bfi	r1, r2, #14, #4
c0de293c:	ea41 1184 	orr.w	r1, r1, r4, lsl #6
c0de2940:	f5c1 3100 	rsb	r1, r1, #131072	@ 0x20000
c0de2944:	6041      	str	r1, [r0, #4]
c0de2946:	bdb0      	pop	{r4, r5, r7, pc}

c0de2948 <poly_uniform_gamma1_add_lowram>:
c0de2948:	e92d 41ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
c0de294c:	f8dd 8028 	ldr.w	r8, [sp, #40]	@ 0x28
c0de2950:	460c      	mov	r4, r1
c0de2952:	4605      	mov	r5, r0
c0de2954:	4611      	mov	r1, r2
c0de2956:	461a      	mov	r2, r3
c0de2958:	4640      	mov	r0, r8
c0de295a:	f001 fada 	bl	c0de3f12 <pqcrystals_dilithium2_lowram_dilithium_shake256_stream_init>
c0de295e:	2600      	movs	r6, #0
c0de2960:	466f      	mov	r7, sp
c0de2962:	2e40      	cmp	r6, #64	@ 0x40
c0de2964:	bf08      	it	eq
c0de2966:	e8bd 81ff 	ldmiaeq.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, pc}
c0de296a:	4638      	mov	r0, r7
c0de296c:	2109      	movs	r1, #9
c0de296e:	4642      	mov	r2, r8
c0de2970:	f7fe fc4e 	bl	c0de1210 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de2974:	4638      	mov	r0, r7
c0de2976:	f7ff ffbb 	bl	c0de28f0 <polyz_unpack_inplace>
c0de297a:	2000      	movs	r0, #0
c0de297c:	2804      	cmp	r0, #4
c0de297e:	d002      	beq.n	c0de2986 <poly_uniform_gamma1_add_lowram+0x3e>
c0de2980:	f000 f958 	bl	c0de2c34 <OUTLINED_FUNCTION_1>
c0de2984:	e7fa      	b.n	c0de297c <poly_uniform_gamma1_add_lowram+0x34>
c0de2986:	3410      	adds	r4, #16
c0de2988:	3510      	adds	r5, #16
c0de298a:	3601      	adds	r6, #1
c0de298c:	e7e9      	b.n	c0de2962 <poly_uniform_gamma1_add_lowram+0x1a>
	...

c0de2990 <poly_make_hint_lowram>:
c0de2990:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de2994:	4686      	mov	lr, r0
c0de2996:	481a      	ldr	r0, [pc, #104]	@ (c0de2a00 <poly_make_hint_lowram+0x70>)
c0de2998:	1c93      	adds	r3, r2, #2
c0de299a:	468c      	mov	ip, r1
c0de299c:	2200      	movs	r2, #0
c0de299e:	f642 450b 	movw	r5, #11275	@ 0x2c0b
c0de29a2:	2600      	movs	r6, #0
c0de29a4:	4680      	mov	r8, r0
c0de29a6:	f5b6 7f80 	cmp.w	r6, #256	@ 0x100
c0de29aa:	d026      	beq.n	c0de29fa <poly_make_hint_lowram+0x6a>
c0de29ac:	f813 4c02 	ldrb.w	r4, [r3, #-2]
c0de29b0:	f813 1c01 	ldrb.w	r1, [r3, #-1]
c0de29b4:	f813 0b03 	ldrb.w	r0, [r3], #3
c0de29b8:	f85c 7026 	ldr.w	r7, [ip, r6, lsl #2]
c0de29bc:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
c0de29c0:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de29c4:	307f      	adds	r0, #127	@ 0x7f
c0de29c6:	19c1      	adds	r1, r0, r7
c0de29c8:	4647      	mov	r7, r8
c0de29ca:	11c9      	asrs	r1, r1, #7
c0de29cc:	4369      	muls	r1, r5
c0de29ce:	f501 0400 	add.w	r4, r1, #8388608	@ 0x800000
c0de29d2:	1624      	asrs	r4, r4, #24
c0de29d4:	4541      	cmp	r1, r8
c0de29d6:	bfc8      	it	gt
c0de29d8:	2400      	movgt	r4, #0
c0de29da:	09c0      	lsrs	r0, r0, #7
c0de29dc:	4368      	muls	r0, r5
c0de29de:	f500 0100 	add.w	r1, r0, #8388608	@ 0x800000
c0de29e2:	0e09      	lsrs	r1, r1, #24
c0de29e4:	4540      	cmp	r0, r8
c0de29e6:	bf88      	it	hi
c0de29e8:	2100      	movhi	r1, #0
c0de29ea:	1a60      	subs	r0, r4, r1
c0de29ec:	bf18      	it	ne
c0de29ee:	2001      	movne	r0, #1
c0de29f0:	f84e 0026 	str.w	r0, [lr, r6, lsl #2]
c0de29f4:	4402      	add	r2, r0
c0de29f6:	3601      	adds	r6, #1
c0de29f8:	e7d5      	b.n	c0de29a6 <poly_make_hint_lowram+0x16>
c0de29fa:	4610      	mov	r0, r2
c0de29fc:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de2a00:	2b7fffff 	.word	0x2b7fffff

c0de2a04 <unpack_sig_h_indices>:
c0de2a04:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de2a08:	f503 6c12 	add.w	ip, r3, #2336	@ 0x920
c0de2a0c:	b142      	cbz	r2, c0de2a20 <unpack_sig_h_indices+0x1c>
c0de2a0e:	eb02 0e0c 	add.w	lr, r2, ip
c0de2a12:	f81e 6f50 	ldrb.w	r6, [lr, #80]!
c0de2a16:	f81e 5c01 	ldrb.w	r5, [lr, #-1]
c0de2a1a:	42b5      	cmp	r5, r6
c0de2a1c:	d905      	bls.n	c0de2a2a <unpack_sig_h_indices+0x26>
c0de2a1e:	e006      	b.n	c0de2a2e <unpack_sig_h_indices+0x2a>
c0de2a20:	f893 6970 	ldrb.w	r6, [r3, #2416]	@ 0x970
c0de2a24:	f503 6e17 	add.w	lr, r3, #2416	@ 0x970
c0de2a28:	2500      	movs	r5, #0
c0de2a2a:	2e50      	cmp	r6, #80	@ 0x50
c0de2a2c:	d902      	bls.n	c0de2a34 <unpack_sig_h_indices+0x30>
c0de2a2e:	2001      	movs	r0, #1
c0de2a30:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de2a34:	eb03 0805 	add.w	r8, r3, r5
c0de2a38:	2700      	movs	r7, #0
c0de2a3a:	19ea      	adds	r2, r5, r7
c0de2a3c:	42b2      	cmp	r2, r6
c0de2a3e:	d20e      	bcs.n	c0de2a5e <unpack_sig_h_indices+0x5a>
c0de2a40:	eb08 0407 	add.w	r4, r8, r7
c0de2a44:	42aa      	cmp	r2, r5
c0de2a46:	f894 6920 	ldrb.w	r6, [r4, #2336]	@ 0x920
c0de2a4a:	d903      	bls.n	c0de2a54 <unpack_sig_h_indices+0x50>
c0de2a4c:	f894 291f 	ldrb.w	r2, [r4, #2335]	@ 0x91f
c0de2a50:	4296      	cmp	r6, r2
c0de2a52:	d9ec      	bls.n	c0de2a2e <unpack_sig_h_indices+0x2a>
c0de2a54:	55c6      	strb	r6, [r0, r7]
c0de2a56:	3701      	adds	r7, #1
c0de2a58:	f89e 6000 	ldrb.w	r6, [lr]
c0de2a5c:	e7ed      	b.n	c0de2a3a <unpack_sig_h_indices+0x36>
c0de2a5e:	600f      	str	r7, [r1, #0]
c0de2a60:	f893 0973 	ldrb.w	r0, [r3, #2419]	@ 0x973
c0de2a64:	4601      	mov	r1, r0
c0de2a66:	284f      	cmp	r0, #79	@ 0x4f
c0de2a68:	d804      	bhi.n	c0de2a74 <unpack_sig_h_indices+0x70>
c0de2a6a:	f81c 2001 	ldrb.w	r2, [ip, r1]
c0de2a6e:	1c48      	adds	r0, r1, #1
c0de2a70:	2a00      	cmp	r2, #0
c0de2a72:	d0f7      	beq.n	c0de2a64 <unpack_sig_h_indices+0x60>
c0de2a74:	2000      	movs	r0, #0
c0de2a76:	2950      	cmp	r1, #80	@ 0x50
c0de2a78:	bf38      	it	cc
c0de2a7a:	2001      	movcc	r0, #1
c0de2a7c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0de2a80 <poly_use_hint_lowram>:
c0de2a80:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de2a84:	4698      	mov	r8, r3
c0de2a86:	4615      	mov	r5, r2
c0de2a88:	460e      	mov	r6, r1
c0de2a8a:	4607      	mov	r7, r0
c0de2a8c:	2400      	movs	r4, #0
c0de2a8e:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de2a92:	bf08      	it	eq
c0de2a94:	e8bd 81f0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de2a98:	4628      	mov	r0, r5
c0de2a9a:	4641      	mov	r1, r8
c0de2a9c:	b131      	cbz	r1, c0de2aac <poly_use_hint_lowram+0x2c>
c0de2a9e:	f810 2b01 	ldrb.w	r2, [r0], #1
c0de2aa2:	3901      	subs	r1, #1
c0de2aa4:	4294      	cmp	r4, r2
c0de2aa6:	d1f9      	bne.n	c0de2a9c <poly_use_hint_lowram+0x1c>
c0de2aa8:	2101      	movs	r1, #1
c0de2aaa:	e000      	b.n	c0de2aae <poly_use_hint_lowram+0x2e>
c0de2aac:	2100      	movs	r1, #0
c0de2aae:	f856 0024 	ldr.w	r0, [r6, r4, lsl #2]
c0de2ab2:	f000 fc87 	bl	c0de33c4 <pqcrystals_dilithium2_lowram_use_hint>
c0de2ab6:	f847 0024 	str.w	r0, [r7, r4, lsl #2]
c0de2aba:	3401      	adds	r4, #1
c0de2abc:	e7e7      	b.n	c0de2a8e <poly_use_hint_lowram+0xe>

c0de2abe <pack_pk_rho>:
c0de2abe:	2200      	movs	r2, #0
c0de2ac0:	2a20      	cmp	r2, #32
c0de2ac2:	bf08      	it	eq
c0de2ac4:	4770      	bxeq	lr
c0de2ac6:	5c8b      	ldrb	r3, [r1, r2]
c0de2ac8:	5483      	strb	r3, [r0, r2]
c0de2aca:	3201      	adds	r2, #1
c0de2acc:	e7f8      	b.n	c0de2ac0 <pack_pk_rho+0x2>

c0de2ace <pack_pk_t1>:
c0de2ace:	eb02 0282 	add.w	r2, r2, r2, lsl #2
c0de2ad2:	eb00 1082 	add.w	r0, r0, r2, lsl #6
c0de2ad6:	3020      	adds	r0, #32
c0de2ad8:	f000 bb42 	b.w	c0de3160 <pqcrystals_dilithium2_lowram_polyt1_pack>

c0de2adc <pack_sk_s1>:
c0de2adc:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de2ae0:	eb00 1042 	add.w	r0, r0, r2, lsl #5
c0de2ae4:	3080      	adds	r0, #128	@ 0x80
c0de2ae6:	f000 bafd 	b.w	c0de30e4 <pqcrystals_dilithium2_lowram_polyeta_pack>

c0de2aea <pack_sk_s2>:
c0de2aea:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de2aee:	eb00 1042 	add.w	r0, r0, r2, lsl #5
c0de2af2:	f500 7000 	add.w	r0, r0, #512	@ 0x200
c0de2af6:	f000 baf5 	b.w	c0de30e4 <pqcrystals_dilithium2_lowram_polyeta_pack>

c0de2afa <pack_sk_t0>:
c0de2afa:	f44f 73d0 	mov.w	r3, #416	@ 0x1a0
c0de2afe:	fb02 0003 	mla	r0, r2, r3, r0
c0de2b02:	f500 7060 	add.w	r0, r0, #896	@ 0x380
c0de2b06:	f000 bb4f 	b.w	c0de31a8 <pqcrystals_dilithium2_lowram_polyt0_pack>

c0de2b0a <pack_sk_rho>:
c0de2b0a:	2200      	movs	r2, #0
c0de2b0c:	2a20      	cmp	r2, #32
c0de2b0e:	bf08      	it	eq
c0de2b10:	4770      	bxeq	lr
c0de2b12:	5c8b      	ldrb	r3, [r1, r2]
c0de2b14:	5483      	strb	r3, [r0, r2]
c0de2b16:	3201      	adds	r2, #1
c0de2b18:	e7f8      	b.n	c0de2b0c <pack_sk_rho+0x2>

c0de2b1a <pack_sk_key>:
c0de2b1a:	3020      	adds	r0, #32
c0de2b1c:	2200      	movs	r2, #0
c0de2b1e:	2a20      	cmp	r2, #32
c0de2b20:	bf08      	it	eq
c0de2b22:	4770      	bxeq	lr
c0de2b24:	5c8b      	ldrb	r3, [r1, r2]
c0de2b26:	5483      	strb	r3, [r0, r2]
c0de2b28:	3201      	adds	r2, #1
c0de2b2a:	e7f8      	b.n	c0de2b1e <pack_sk_key+0x4>

c0de2b2c <pack_sk_tr>:
c0de2b2c:	3040      	adds	r0, #64	@ 0x40
c0de2b2e:	2200      	movs	r2, #0
c0de2b30:	2a40      	cmp	r2, #64	@ 0x40
c0de2b32:	bf08      	it	eq
c0de2b34:	4770      	bxeq	lr
c0de2b36:	5c8b      	ldrb	r3, [r1, r2]
c0de2b38:	5483      	strb	r3, [r0, r2]
c0de2b3a:	3201      	adds	r2, #1
c0de2b3c:	e7f8      	b.n	c0de2b30 <pack_sk_tr+0x4>

c0de2b3e <poly_challenge_lowram>:
c0de2b3e:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2b42:	b0b6      	sub	sp, #216	@ 0xd8
c0de2b44:	466e      	mov	r6, sp
c0de2b46:	4680      	mov	r8, r0
c0de2b48:	460d      	mov	r5, r1
c0de2b4a:	4630      	mov	r0, r6
c0de2b4c:	f7fe fb42 	bl	c0de11d4 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de2b50:	4630      	mov	r0, r6
c0de2b52:	4629      	mov	r1, r5
c0de2b54:	2220      	movs	r2, #32
c0de2b56:	f7fe fb45 	bl	c0de11e4 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de2b5a:	4630      	mov	r0, r6
c0de2b5c:	f7fe fb4d 	bl	c0de11fa <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de2b60:	ad34      	add	r5, sp, #208	@ 0xd0
c0de2b62:	2108      	movs	r1, #8
c0de2b64:	4632      	mov	r2, r6
c0de2b66:	4628      	mov	r0, r5
c0de2b68:	f7fe fb52 	bl	c0de1210 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de2b6c:	2600      	movs	r6, #0
c0de2b6e:	462c      	mov	r4, r5
c0de2b70:	2700      	movs	r7, #0
c0de2b72:	f04f 0a00 	mov.w	sl, #0
c0de2b76:	2e40      	cmp	r6, #64	@ 0x40
c0de2b78:	d00a      	beq.n	c0de2b90 <poly_challenge_lowram+0x52>
c0de2b7a:	f814 0b01 	ldrb.w	r0, [r4], #1
c0de2b7e:	2100      	movs	r1, #0
c0de2b80:	4632      	mov	r2, r6
c0de2b82:	f009 fa25 	bl	c0debfd0 <__aeabi_llsl>
c0de2b86:	ea4a 0a01 	orr.w	sl, sl, r1
c0de2b8a:	4307      	orrs	r7, r0
c0de2b8c:	3608      	adds	r6, #8
c0de2b8e:	e7f2      	b.n	c0de2b76 <poly_challenge_lowram+0x38>
c0de2b90:	2000      	movs	r0, #0
c0de2b92:	2100      	movs	r1, #0
c0de2b94:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de2b98:	d003      	beq.n	c0de2ba2 <poly_challenge_lowram+0x64>
c0de2b9a:	f848 0021 	str.w	r0, [r8, r1, lsl #2]
c0de2b9e:	3101      	adds	r1, #1
c0de2ba0:	e7f8      	b.n	c0de2b94 <poly_challenge_lowram+0x56>
c0de2ba2:	2008      	movs	r0, #8
c0de2ba4:	24d9      	movs	r4, #217	@ 0xd9
c0de2ba6:	466e      	mov	r6, sp
c0de2ba8:	f04f 0b02 	mov.w	fp, #2
c0de2bac:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de2bb0:	d01b      	beq.n	c0de2bea <poly_challenge_lowram+0xac>
c0de2bb2:	2808      	cmp	r0, #8
c0de2bb4:	d305      	bcc.n	c0de2bc2 <poly_challenge_lowram+0x84>
c0de2bb6:	4628      	mov	r0, r5
c0de2bb8:	2108      	movs	r1, #8
c0de2bba:	4632      	mov	r2, r6
c0de2bbc:	f7fe fb28 	bl	c0de1210 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de2bc0:	2000      	movs	r0, #0
c0de2bc2:	5c29      	ldrb	r1, [r5, r0]
c0de2bc4:	3001      	adds	r0, #1
c0de2bc6:	428c      	cmp	r4, r1
c0de2bc8:	d3f3      	bcc.n	c0de2bb2 <poly_challenge_lowram+0x74>
c0de2bca:	f858 2021 	ldr.w	r2, [r8, r1, lsl #2]
c0de2bce:	ea5f 0a5a 	movs.w	sl, sl, lsr #1
c0de2bd2:	f848 2024 	str.w	r2, [r8, r4, lsl #2]
c0de2bd6:	ea0b 0247 	and.w	r2, fp, r7, lsl #1
c0de2bda:	ea4f 0737 	mov.w	r7, r7, rrx
c0de2bde:	3401      	adds	r4, #1
c0de2be0:	f1c2 0201 	rsb	r2, r2, #1
c0de2be4:	f848 2021 	str.w	r2, [r8, r1, lsl #2]
c0de2be8:	e7e0      	b.n	c0de2bac <poly_challenge_lowram+0x6e>
c0de2bea:	b036      	add	sp, #216	@ 0xd8
c0de2bec:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de2bf0 <pqcrystals_dilithium2_lowram_poly_pointwise_acc_montgomery>:
c0de2bf0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de2bf2:	4614      	mov	r4, r2
c0de2bf4:	460d      	mov	r5, r1
c0de2bf6:	4606      	mov	r6, r0
c0de2bf8:	2700      	movs	r7, #0
c0de2bfa:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de2bfe:	bf08      	it	eq
c0de2c00:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de2c02:	f855 0027 	ldr.w	r0, [r5, r7, lsl #2]
c0de2c06:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
c0de2c0a:	f000 f822 	bl	c0de2c52 <OUTLINED_FUNCTION_3>
c0de2c0e:	f856 1027 	ldr.w	r1, [r6, r7, lsl #2]
c0de2c12:	4408      	add	r0, r1
c0de2c14:	f846 0027 	str.w	r0, [r6, r7, lsl #2]
c0de2c18:	3701      	adds	r7, #1
c0de2c1a:	e7ee      	b.n	c0de2bfa <pqcrystals_dilithium2_lowram_poly_pointwise_acc_montgomery+0xa>

c0de2c1c <OUTLINED_FUNCTION_0>:
c0de2c1c:	1971      	adds	r1, r6, r5
c0de2c1e:	5d70      	ldrb	r0, [r6, r5]
c0de2c20:	784a      	ldrb	r2, [r1, #1]
c0de2c22:	7889      	ldrb	r1, [r1, #2]
c0de2c24:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de2c28:	f001 017f 	and.w	r1, r1, #127	@ 0x7f
c0de2c2c:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de2c30:	42a0      	cmp	r0, r4
c0de2c32:	4770      	bx	lr

c0de2c34 <OUTLINED_FUNCTION_1>:
c0de2c34:	f857 1020 	ldr.w	r1, [r7, r0, lsl #2]
c0de2c38:	f854 2020 	ldr.w	r2, [r4, r0, lsl #2]
c0de2c3c:	4411      	add	r1, r2
c0de2c3e:	f845 1020 	str.w	r1, [r5, r0, lsl #2]
c0de2c42:	3001      	adds	r0, #1
c0de2c44:	4770      	bx	lr

c0de2c46 <OUTLINED_FUNCTION_2>:
c0de2c46:	f815 0b01 	ldrb.w	r0, [r5], #1
c0de2c4a:	2100      	movs	r1, #0
c0de2c4c:	463a      	mov	r2, r7
c0de2c4e:	f009 b9bf 	b.w	c0debfd0 <__aeabi_llsl>

c0de2c52 <OUTLINED_FUNCTION_3>:
c0de2c52:	fb81 0100 	smull	r0, r1, r1, r0
c0de2c56:	f000 bb5d 	b.w	c0de3314 <pqcrystals_dilithium2_lowram_montgomery_reduce>

c0de2c5a <OUTLINED_FUNCTION_4>:
c0de2c5a:	4601      	mov	r1, r0
c0de2c5c:	4658      	mov	r0, fp
c0de2c5e:	463a      	mov	r2, r7
c0de2c60:	f7ff be10 	b.w	c0de2884 <polyw_add_idx>

c0de2c64 <pqcrystals_dilithium2_lowram_ntt>:
c0de2c64:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de2c68:	4604      	mov	r4, r0
c0de2c6a:	4817      	ldr	r0, [pc, #92]	@ (c0de2cc8 <pqcrystals_dilithium2_lowram_ntt+0x64>)
c0de2c6c:	f04f 0880 	mov.w	r8, #128	@ 0x80
c0de2c70:	f04f 0a00 	mov.w	sl, #0
c0de2c74:	4478      	add	r0, pc
c0de2c76:	9001      	str	r0, [sp, #4]
c0de2c78:	f1b8 0f00 	cmp.w	r8, #0
c0de2c7c:	bf08      	it	eq
c0de2c7e:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de2c82:	2700      	movs	r7, #0
c0de2c84:	2fff      	cmp	r7, #255	@ 0xff
c0de2c86:	d81c      	bhi.n	c0de2cc2 <pqcrystals_dilithium2_lowram_ntt+0x5e>
c0de2c88:	9801      	ldr	r0, [sp, #4]
c0de2c8a:	f10a 0a01 	add.w	sl, sl, #1
c0de2c8e:	eb07 0608 	add.w	r6, r7, r8
c0de2c92:	4635      	mov	r5, r6
c0de2c94:	f850 b02a 	ldr.w	fp, [r0, sl, lsl #2]
c0de2c98:	42b7      	cmp	r7, r6
c0de2c9a:	d210      	bcs.n	c0de2cbe <pqcrystals_dilithium2_lowram_ntt+0x5a>
c0de2c9c:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de2ca0:	fb80 010b 	smull	r0, r1, r0, fp
c0de2ca4:	f000 fb36 	bl	c0de3314 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de2ca8:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
c0de2cac:	180a      	adds	r2, r1, r0
c0de2cae:	1a08      	subs	r0, r1, r0
c0de2cb0:	f844 2027 	str.w	r2, [r4, r7, lsl #2]
c0de2cb4:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de2cb8:	3501      	adds	r5, #1
c0de2cba:	3701      	adds	r7, #1
c0de2cbc:	e7ec      	b.n	c0de2c98 <pqcrystals_dilithium2_lowram_ntt+0x34>
c0de2cbe:	462f      	mov	r7, r5
c0de2cc0:	e7e0      	b.n	c0de2c84 <pqcrystals_dilithium2_lowram_ntt+0x20>
c0de2cc2:	ea4f 0858 	mov.w	r8, r8, lsr #1
c0de2cc6:	e7d7      	b.n	c0de2c78 <pqcrystals_dilithium2_lowram_ntt+0x14>
c0de2cc8:	0000c560 	.word	0x0000c560

c0de2ccc <pqcrystals_dilithium2_lowram_invntt_tomont>:
c0de2ccc:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de2cd0:	4604      	mov	r4, r0
c0de2cd2:	4822      	ldr	r0, [pc, #136]	@ (c0de2d5c <pqcrystals_dilithium2_lowram_invntt_tomont+0x90>)
c0de2cd4:	f04f 0801 	mov.w	r8, #1
c0de2cd8:	f44f 7a80 	mov.w	sl, #256	@ 0x100
c0de2cdc:	4478      	add	r0, pc
c0de2cde:	9001      	str	r0, [sp, #4]
c0de2ce0:	f1b8 0fff 	cmp.w	r8, #255	@ 0xff
c0de2ce4:	d828      	bhi.n	c0de2d38 <pqcrystals_dilithium2_lowram_invntt_tomont+0x6c>
c0de2ce6:	2700      	movs	r7, #0
c0de2ce8:	2fff      	cmp	r7, #255	@ 0xff
c0de2cea:	d822      	bhi.n	c0de2d32 <pqcrystals_dilithium2_lowram_invntt_tomont+0x66>
c0de2cec:	9801      	ldr	r0, [sp, #4]
c0de2cee:	f1aa 0a01 	sub.w	sl, sl, #1
c0de2cf2:	eb07 0608 	add.w	r6, r7, r8
c0de2cf6:	4635      	mov	r5, r6
c0de2cf8:	f850 002a 	ldr.w	r0, [r0, sl, lsl #2]
c0de2cfc:	f1c0 0b00 	rsb	fp, r0, #0
c0de2d00:	42b7      	cmp	r7, r6
c0de2d02:	d214      	bcs.n	c0de2d2e <pqcrystals_dilithium2_lowram_invntt_tomont+0x62>
c0de2d04:	f854 0027 	ldr.w	r0, [r4, r7, lsl #2]
c0de2d08:	f854 1025 	ldr.w	r1, [r4, r5, lsl #2]
c0de2d0c:	4401      	add	r1, r0
c0de2d0e:	f844 1027 	str.w	r1, [r4, r7, lsl #2]
c0de2d12:	f854 1025 	ldr.w	r1, [r4, r5, lsl #2]
c0de2d16:	1a40      	subs	r0, r0, r1
c0de2d18:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de2d1c:	fb80 010b 	smull	r0, r1, r0, fp
c0de2d20:	f000 faf8 	bl	c0de3314 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de2d24:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de2d28:	3501      	adds	r5, #1
c0de2d2a:	3701      	adds	r7, #1
c0de2d2c:	e7e8      	b.n	c0de2d00 <pqcrystals_dilithium2_lowram_invntt_tomont+0x34>
c0de2d2e:	462f      	mov	r7, r5
c0de2d30:	e7da      	b.n	c0de2ce8 <pqcrystals_dilithium2_lowram_invntt_tomont+0x1c>
c0de2d32:	ea4f 0848 	mov.w	r8, r8, lsl #1
c0de2d36:	e7d3      	b.n	c0de2ce0 <pqcrystals_dilithium2_lowram_invntt_tomont+0x14>
c0de2d38:	2500      	movs	r5, #0
c0de2d3a:	f24a 36fa 	movw	r6, #41978	@ 0xa3fa
c0de2d3e:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
c0de2d42:	bf08      	it	eq
c0de2d44:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de2d48:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de2d4c:	fb80 0106 	smull	r0, r1, r0, r6
c0de2d50:	f000 fae0 	bl	c0de3314 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de2d54:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de2d58:	3501      	adds	r5, #1
c0de2d5a:	e7f0      	b.n	c0de2d3e <pqcrystals_dilithium2_lowram_invntt_tomont+0x72>
c0de2d5c:	0000c4f8 	.word	0x0000c4f8

c0de2d60 <pqcrystals_dilithium2_lowram_poly_reduce>:
c0de2d60:	b5b0      	push	{r4, r5, r7, lr}
c0de2d62:	4604      	mov	r4, r0
c0de2d64:	2500      	movs	r5, #0
c0de2d66:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
c0de2d6a:	bf08      	it	eq
c0de2d6c:	bdb0      	popeq	{r4, r5, r7, pc}
c0de2d6e:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de2d72:	f000 fadb 	bl	c0de332c <pqcrystals_dilithium2_lowram_reduce32>
c0de2d76:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de2d7a:	3501      	adds	r5, #1
c0de2d7c:	e7f3      	b.n	c0de2d66 <pqcrystals_dilithium2_lowram_poly_reduce+0x6>

c0de2d7e <pqcrystals_dilithium2_lowram_poly_caddq>:
c0de2d7e:	b5b0      	push	{r4, r5, r7, lr}
c0de2d80:	4604      	mov	r4, r0
c0de2d82:	2500      	movs	r5, #0
c0de2d84:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
c0de2d88:	bf08      	it	eq
c0de2d8a:	bdb0      	popeq	{r4, r5, r7, pc}
c0de2d8c:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de2d90:	f000 fad6 	bl	c0de3340 <pqcrystals_dilithium2_lowram_caddq>
c0de2d94:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de2d98:	3501      	adds	r5, #1
c0de2d9a:	e7f3      	b.n	c0de2d84 <pqcrystals_dilithium2_lowram_poly_caddq+0x6>

c0de2d9c <pqcrystals_dilithium2_lowram_poly_add>:
c0de2d9c:	b5b0      	push	{r4, r5, r7, lr}
c0de2d9e:	2300      	movs	r3, #0
c0de2da0:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
c0de2da4:	bf08      	it	eq
c0de2da6:	bdb0      	popeq	{r4, r5, r7, pc}
c0de2da8:	f851 4023 	ldr.w	r4, [r1, r3, lsl #2]
c0de2dac:	f852 5023 	ldr.w	r5, [r2, r3, lsl #2]
c0de2db0:	442c      	add	r4, r5
c0de2db2:	f840 4023 	str.w	r4, [r0, r3, lsl #2]
c0de2db6:	3301      	adds	r3, #1
c0de2db8:	e7f2      	b.n	c0de2da0 <pqcrystals_dilithium2_lowram_poly_add+0x4>

c0de2dba <pqcrystals_dilithium2_lowram_poly_ntt>:
c0de2dba:	f7ff bf53 	b.w	c0de2c64 <pqcrystals_dilithium2_lowram_ntt>

c0de2dbe <pqcrystals_dilithium2_lowram_poly_invntt_tomont>:
c0de2dbe:	f7ff bf85 	b.w	c0de2ccc <pqcrystals_dilithium2_lowram_invntt_tomont>

c0de2dc2 <pqcrystals_dilithium2_lowram_poly_pointwise_montgomery>:
c0de2dc2:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de2dc4:	f000 fa99 	bl	c0de32fa <OUTLINED_FUNCTION_0>
c0de2dc8:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de2dcc:	bf08      	it	eq
c0de2dce:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de2dd0:	f855 0027 	ldr.w	r0, [r5, r7, lsl #2]
c0de2dd4:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
c0de2dd8:	fb81 0100 	smull	r0, r1, r1, r0
c0de2ddc:	f000 fa9a 	bl	c0de3314 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de2de0:	f846 0027 	str.w	r0, [r6, r7, lsl #2]
c0de2de4:	3701      	adds	r7, #1
c0de2de6:	e7ef      	b.n	c0de2dc8 <pqcrystals_dilithium2_lowram_poly_pointwise_montgomery+0x6>

c0de2de8 <pqcrystals_dilithium2_lowram_poly_power2round>:
c0de2de8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de2dea:	f000 fa86 	bl	c0de32fa <OUTLINED_FUNCTION_0>
c0de2dee:	f5b7 6f80 	cmp.w	r7, #1024	@ 0x400
c0de2df2:	bf08      	it	eq
c0de2df4:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de2df6:	59e1      	ldr	r1, [r4, r7]
c0de2df8:	19e8      	adds	r0, r5, r7
c0de2dfa:	f000 fab9 	bl	c0de3370 <pqcrystals_dilithium2_lowram_power2round>
c0de2dfe:	51f0      	str	r0, [r6, r7]
c0de2e00:	3704      	adds	r7, #4
c0de2e02:	e7f4      	b.n	c0de2dee <pqcrystals_dilithium2_lowram_poly_power2round+0x6>

c0de2e04 <pqcrystals_dilithium2_lowram_poly_chknorm>:
c0de2e04:	4a09      	ldr	r2, [pc, #36]	@ (c0de2e2c <pqcrystals_dilithium2_lowram_poly_chknorm+0x28>)
c0de2e06:	4291      	cmp	r1, r2
c0de2e08:	dc0e      	bgt.n	c0de2e28 <pqcrystals_dilithium2_lowram_poly_chknorm+0x24>
c0de2e0a:	2200      	movs	r2, #0
c0de2e0c:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de2e10:	bf04      	itt	eq
c0de2e12:	2000      	moveq	r0, #0
c0de2e14:	4770      	bxeq	lr
c0de2e16:	f850 3022 	ldr.w	r3, [r0, r2, lsl #2]
c0de2e1a:	2b00      	cmp	r3, #0
c0de2e1c:	bf48      	it	mi
c0de2e1e:	eba3 0343 	submi.w	r3, r3, r3, lsl #1
c0de2e22:	3201      	adds	r2, #1
c0de2e24:	428b      	cmp	r3, r1
c0de2e26:	dbf1      	blt.n	c0de2e0c <pqcrystals_dilithium2_lowram_poly_chknorm+0x8>
c0de2e28:	2001      	movs	r0, #1
c0de2e2a:	4770      	bx	lr
c0de2e2c:	000ffc00 	.word	0x000ffc00

c0de2e30 <pqcrystals_dilithium2_lowram_poly_uniform>:
c0de2e30:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2e34:	f5ad 6d84 	sub.w	sp, sp, #1056	@ 0x420
c0de2e38:	46e8      	mov	r8, sp
c0de2e3a:	4683      	mov	fp, r0
c0de2e3c:	4640      	mov	r0, r8
c0de2e3e:	f001 f854 	bl	c0de3eea <pqcrystals_dilithium2_lowram_dilithium_shake128_stream_init>
c0de2e42:	f10d 06d6 	add.w	r6, sp, #214	@ 0xd6
c0de2e46:	2105      	movs	r1, #5
c0de2e48:	4642      	mov	r2, r8
c0de2e4a:	4630      	mov	r0, r6
c0de2e4c:	f7fe f99f 	bl	c0de118e <pqcrystals_dilithium_fips202_ref_shake128_squeezeblocks>
c0de2e50:	4658      	mov	r0, fp
c0de2e52:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de2e56:	4632      	mov	r2, r6
c0de2e58:	f44f 7352 	mov.w	r3, #840	@ 0x348
c0de2e5c:	f44f 7552 	mov.w	r5, #840	@ 0x348
c0de2e60:	f000 f828 	bl	c0de2eb4 <rej_uniform>
c0de2e64:	4607      	mov	r7, r0
c0de2e66:	f04f 0a03 	mov.w	sl, #3
c0de2e6a:	2fff      	cmp	r7, #255	@ 0xff
c0de2e6c:	d81d      	bhi.n	c0de2eaa <pqcrystals_dilithium2_lowram_poly_uniform+0x7a>
c0de2e6e:	fbb5 f0fa 	udiv	r0, r5, sl
c0de2e72:	4631      	mov	r1, r6
c0de2e74:	eb00 0040 	add.w	r0, r0, r0, lsl #1
c0de2e78:	1a2c      	subs	r4, r5, r0
c0de2e7a:	42a8      	cmp	r0, r5
c0de2e7c:	d004      	beq.n	c0de2e88 <pqcrystals_dilithium2_lowram_poly_uniform+0x58>
c0de2e7e:	5c0a      	ldrb	r2, [r1, r0]
c0de2e80:	3d01      	subs	r5, #1
c0de2e82:	700a      	strb	r2, [r1, #0]
c0de2e84:	3101      	adds	r1, #1
c0de2e86:	e7f8      	b.n	c0de2e7a <pqcrystals_dilithium2_lowram_poly_uniform+0x4a>
c0de2e88:	1930      	adds	r0, r6, r4
c0de2e8a:	2101      	movs	r1, #1
c0de2e8c:	4642      	mov	r2, r8
c0de2e8e:	f7fe f97e 	bl	c0de118e <pqcrystals_dilithium_fips202_ref_shake128_squeezeblocks>
c0de2e92:	f044 05a8 	orr.w	r5, r4, #168	@ 0xa8
c0de2e96:	eb0b 0087 	add.w	r0, fp, r7, lsl #2
c0de2e9a:	f5c7 7180 	rsb	r1, r7, #256	@ 0x100
c0de2e9e:	4632      	mov	r2, r6
c0de2ea0:	462b      	mov	r3, r5
c0de2ea2:	f000 f807 	bl	c0de2eb4 <rej_uniform>
c0de2ea6:	4407      	add	r7, r0
c0de2ea8:	e7df      	b.n	c0de2e6a <pqcrystals_dilithium2_lowram_poly_uniform+0x3a>
c0de2eaa:	f50d 6d84 	add.w	sp, sp, #1056	@ 0x420
c0de2eae:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
	...

c0de2eb4 <rej_uniform>:
c0de2eb4:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2eb6:	4c0f      	ldr	r4, [pc, #60]	@ (c0de2ef4 <rej_uniform+0x40>)
c0de2eb8:	4684      	mov	ip, r0
c0de2eba:	2000      	movs	r0, #0
c0de2ebc:	2700      	movs	r7, #0
c0de2ebe:	46a6      	mov	lr, r4
c0de2ec0:	4288      	cmp	r0, r1
c0de2ec2:	d215      	bcs.n	c0de2ef0 <rej_uniform+0x3c>
c0de2ec4:	1cfe      	adds	r6, r7, #3
c0de2ec6:	429e      	cmp	r6, r3
c0de2ec8:	d812      	bhi.n	c0de2ef0 <rej_uniform+0x3c>
c0de2eca:	5dd4      	ldrb	r4, [r2, r7]
c0de2ecc:	4417      	add	r7, r2
c0de2ece:	787d      	ldrb	r5, [r7, #1]
c0de2ed0:	78bf      	ldrb	r7, [r7, #2]
c0de2ed2:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de2ed6:	f007 057f 	and.w	r5, r7, #127	@ 0x7f
c0de2eda:	4637      	mov	r7, r6
c0de2edc:	ea44 4405 	orr.w	r4, r4, r5, lsl #16
c0de2ee0:	4675      	mov	r5, lr
c0de2ee2:	4574      	cmp	r4, lr
c0de2ee4:	d8ec      	bhi.n	c0de2ec0 <rej_uniform+0xc>
c0de2ee6:	f84c 4020 	str.w	r4, [ip, r0, lsl #2]
c0de2eea:	3001      	adds	r0, #1
c0de2eec:	4637      	mov	r7, r6
c0de2eee:	e7e7      	b.n	c0de2ec0 <rej_uniform+0xc>
c0de2ef0:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de2ef2:	bf00      	nop
c0de2ef4:	007fe000 	.word	0x007fe000

c0de2ef8 <pqcrystals_dilithium2_lowram_poly_uniform_eta>:
c0de2ef8:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2efa:	b0d7      	sub	sp, #348	@ 0x15c
c0de2efc:	466d      	mov	r5, sp
c0de2efe:	4604      	mov	r4, r0
c0de2f00:	4628      	mov	r0, r5
c0de2f02:	f001 f806 	bl	c0de3f12 <pqcrystals_dilithium2_lowram_dilithium_shake256_stream_init>
c0de2f06:	ae35      	add	r6, sp, #212	@ 0xd4
c0de2f08:	2101      	movs	r1, #1
c0de2f0a:	462a      	mov	r2, r5
c0de2f0c:	4630      	mov	r0, r6
c0de2f0e:	f7fe f998 	bl	c0de1242 <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>
c0de2f12:	4620      	mov	r0, r4
c0de2f14:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de2f18:	4632      	mov	r2, r6
c0de2f1a:	f000 f813 	bl	c0de2f44 <rej_eta>
c0de2f1e:	4607      	mov	r7, r0
c0de2f20:	2fff      	cmp	r7, #255	@ 0xff
c0de2f22:	bf84      	itt	hi
c0de2f24:	b057      	addhi	sp, #348	@ 0x15c
c0de2f26:	bdf0      	pophi	{r4, r5, r6, r7, pc}
c0de2f28:	4630      	mov	r0, r6
c0de2f2a:	2101      	movs	r1, #1
c0de2f2c:	462a      	mov	r2, r5
c0de2f2e:	f7fe f988 	bl	c0de1242 <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>
c0de2f32:	eb04 0087 	add.w	r0, r4, r7, lsl #2
c0de2f36:	f5c7 7180 	rsb	r1, r7, #256	@ 0x100
c0de2f3a:	4632      	mov	r2, r6
c0de2f3c:	f000 f802 	bl	c0de2f44 <rej_eta>
c0de2f40:	4407      	add	r7, r0
c0de2f42:	e7ed      	b.n	c0de2f20 <pqcrystals_dilithium2_lowram_poly_uniform_eta+0x28>

c0de2f44 <rej_eta>:
c0de2f44:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2f46:	4603      	mov	r3, r0
c0de2f48:	2000      	movs	r0, #0
c0de2f4a:	f04f 0ccd 	mov.w	ip, #205	@ 0xcd
c0de2f4e:	2500      	movs	r5, #0
c0de2f50:	4288      	cmp	r0, r1
c0de2f52:	d221      	bcs.n	c0de2f98 <rej_eta+0x54>
c0de2f54:	2d87      	cmp	r5, #135	@ 0x87
c0de2f56:	d81f      	bhi.n	c0de2f98 <rej_eta+0x54>
c0de2f58:	5d56      	ldrb	r6, [r2, r5]
c0de2f5a:	f006 070f 	and.w	r7, r6, #15
c0de2f5e:	2f0f      	cmp	r7, #15
c0de2f60:	d009      	beq.n	c0de2f76 <rej_eta+0x32>
c0de2f62:	fb07 f40c 	mul.w	r4, r7, ip
c0de2f66:	0aa4      	lsrs	r4, r4, #10
c0de2f68:	eb04 0484 	add.w	r4, r4, r4, lsl #2
c0de2f6c:	1be4      	subs	r4, r4, r7
c0de2f6e:	3402      	adds	r4, #2
c0de2f70:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
c0de2f74:	3001      	adds	r0, #1
c0de2f76:	0936      	lsrs	r6, r6, #4
c0de2f78:	2e0f      	cmp	r6, #15
c0de2f7a:	d00b      	beq.n	c0de2f94 <rej_eta+0x50>
c0de2f7c:	4288      	cmp	r0, r1
c0de2f7e:	d209      	bcs.n	c0de2f94 <rej_eta+0x50>
c0de2f80:	fb06 f40c 	mul.w	r4, r6, ip
c0de2f84:	0aa4      	lsrs	r4, r4, #10
c0de2f86:	eb04 0484 	add.w	r4, r4, r4, lsl #2
c0de2f8a:	1ba4      	subs	r4, r4, r6
c0de2f8c:	3402      	adds	r4, #2
c0de2f8e:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
c0de2f92:	3001      	adds	r0, #1
c0de2f94:	3501      	adds	r5, #1
c0de2f96:	e7db      	b.n	c0de2f50 <rej_eta+0xc>
c0de2f98:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de2f9a <pqcrystals_dilithium2_lowram_polyz_unpack>:
c0de2f9a:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2f9c:	3008      	adds	r0, #8
c0de2f9e:	f04f 0c00 	mov.w	ip, #0
c0de2fa2:	f5bc 7f10 	cmp.w	ip, #576	@ 0x240
c0de2fa6:	bf08      	it	eq
c0de2fa8:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de2faa:	f811 300c 	ldrb.w	r3, [r1, ip]
c0de2fae:	eb01 040c 	add.w	r4, r1, ip
c0de2fb2:	f10c 0c09 	add.w	ip, ip, #9
c0de2fb6:	f840 3c08 	str.w	r3, [r0, #-8]
c0de2fba:	7865      	ldrb	r5, [r4, #1]
c0de2fbc:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0de2fc0:	f840 3c08 	str.w	r3, [r0, #-8]
c0de2fc4:	78a5      	ldrb	r5, [r4, #2]
c0de2fc6:	f365 4311 	bfi	r3, r5, #16, #2
c0de2fca:	f840 3c08 	str.w	r3, [r0, #-8]
c0de2fce:	f5c3 3300 	rsb	r3, r3, #131072	@ 0x20000
c0de2fd2:	78a5      	ldrb	r5, [r4, #2]
c0de2fd4:	08ae      	lsrs	r6, r5, #2
c0de2fd6:	f840 6c04 	str.w	r6, [r0, #-4]
c0de2fda:	78e6      	ldrb	r6, [r4, #3]
c0de2fdc:	01b6      	lsls	r6, r6, #6
c0de2fde:	ea46 0595 	orr.w	r5, r6, r5, lsr #2
c0de2fe2:	f840 5c04 	str.w	r5, [r0, #-4]
c0de2fe6:	7926      	ldrb	r6, [r4, #4]
c0de2fe8:	f366 3591 	bfi	r5, r6, #14, #4
c0de2fec:	f840 5c04 	str.w	r5, [r0, #-4]
c0de2ff0:	f5c5 3500 	rsb	r5, r5, #131072	@ 0x20000
c0de2ff4:	7926      	ldrb	r6, [r4, #4]
c0de2ff6:	0937      	lsrs	r7, r6, #4
c0de2ff8:	6007      	str	r7, [r0, #0]
c0de2ffa:	7967      	ldrb	r7, [r4, #5]
c0de2ffc:	013f      	lsls	r7, r7, #4
c0de2ffe:	ea47 1616 	orr.w	r6, r7, r6, lsr #4
c0de3002:	6006      	str	r6, [r0, #0]
c0de3004:	79a7      	ldrb	r7, [r4, #6]
c0de3006:	f367 3611 	bfi	r6, r7, #12, #6
c0de300a:	6006      	str	r6, [r0, #0]
c0de300c:	f5c6 3600 	rsb	r6, r6, #131072	@ 0x20000
c0de3010:	79a7      	ldrb	r7, [r4, #6]
c0de3012:	09ba      	lsrs	r2, r7, #6
c0de3014:	6042      	str	r2, [r0, #4]
c0de3016:	79e2      	ldrb	r2, [r4, #7]
c0de3018:	0092      	lsls	r2, r2, #2
c0de301a:	ea42 1297 	orr.w	r2, r2, r7, lsr #6
c0de301e:	6042      	str	r2, [r0, #4]
c0de3020:	7a24      	ldrb	r4, [r4, #8]
c0de3022:	6006      	str	r6, [r0, #0]
c0de3024:	f840 5c04 	str.w	r5, [r0, #-4]
c0de3028:	f840 3c08 	str.w	r3, [r0, #-8]
c0de302c:	ea42 2284 	orr.w	r2, r2, r4, lsl #10
c0de3030:	f5c2 3200 	rsb	r2, r2, #131072	@ 0x20000
c0de3034:	6042      	str	r2, [r0, #4]
c0de3036:	3010      	adds	r0, #16
c0de3038:	e7b3      	b.n	c0de2fa2 <pqcrystals_dilithium2_lowram_polyz_unpack+0x8>

c0de303a <pqcrystals_dilithium2_lowram_poly_challenge>:
c0de303a:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de303e:	b0d6      	sub	sp, #344	@ 0x158
c0de3040:	466e      	mov	r6, sp
c0de3042:	4680      	mov	r8, r0
c0de3044:	460d      	mov	r5, r1
c0de3046:	4630      	mov	r0, r6
c0de3048:	f7fe f8c4 	bl	c0de11d4 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de304c:	4630      	mov	r0, r6
c0de304e:	4629      	mov	r1, r5
c0de3050:	2220      	movs	r2, #32
c0de3052:	f7fe f8c7 	bl	c0de11e4 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de3056:	4630      	mov	r0, r6
c0de3058:	f7fe f8cf 	bl	c0de11fa <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de305c:	ad34      	add	r5, sp, #208	@ 0xd0
c0de305e:	2101      	movs	r1, #1
c0de3060:	4632      	mov	r2, r6
c0de3062:	4628      	mov	r0, r5
c0de3064:	f7fe f8ed 	bl	c0de1242 <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>
c0de3068:	2600      	movs	r6, #0
c0de306a:	462c      	mov	r4, r5
c0de306c:	2700      	movs	r7, #0
c0de306e:	f04f 0a00 	mov.w	sl, #0
c0de3072:	2e40      	cmp	r6, #64	@ 0x40
c0de3074:	d006      	beq.n	c0de3084 <pqcrystals_dilithium2_lowram_poly_challenge+0x4a>
c0de3076:	f000 f945 	bl	c0de3304 <OUTLINED_FUNCTION_1>
c0de307a:	ea4a 0a01 	orr.w	sl, sl, r1
c0de307e:	4307      	orrs	r7, r0
c0de3080:	3608      	adds	r6, #8
c0de3082:	e7f6      	b.n	c0de3072 <pqcrystals_dilithium2_lowram_poly_challenge+0x38>
c0de3084:	2000      	movs	r0, #0
c0de3086:	2100      	movs	r1, #0
c0de3088:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de308c:	d003      	beq.n	c0de3096 <pqcrystals_dilithium2_lowram_poly_challenge+0x5c>
c0de308e:	f848 0021 	str.w	r0, [r8, r1, lsl #2]
c0de3092:	3101      	adds	r1, #1
c0de3094:	e7f8      	b.n	c0de3088 <pqcrystals_dilithium2_lowram_poly_challenge+0x4e>
c0de3096:	2008      	movs	r0, #8
c0de3098:	24d9      	movs	r4, #217	@ 0xd9
c0de309a:	466e      	mov	r6, sp
c0de309c:	f04f 0b02 	mov.w	fp, #2
c0de30a0:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de30a4:	d01b      	beq.n	c0de30de <pqcrystals_dilithium2_lowram_poly_challenge+0xa4>
c0de30a6:	2888      	cmp	r0, #136	@ 0x88
c0de30a8:	d305      	bcc.n	c0de30b6 <pqcrystals_dilithium2_lowram_poly_challenge+0x7c>
c0de30aa:	4628      	mov	r0, r5
c0de30ac:	2101      	movs	r1, #1
c0de30ae:	4632      	mov	r2, r6
c0de30b0:	f7fe f8c7 	bl	c0de1242 <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>
c0de30b4:	2000      	movs	r0, #0
c0de30b6:	5c29      	ldrb	r1, [r5, r0]
c0de30b8:	3001      	adds	r0, #1
c0de30ba:	428c      	cmp	r4, r1
c0de30bc:	d3f3      	bcc.n	c0de30a6 <pqcrystals_dilithium2_lowram_poly_challenge+0x6c>
c0de30be:	f858 2021 	ldr.w	r2, [r8, r1, lsl #2]
c0de30c2:	ea5f 0a5a 	movs.w	sl, sl, lsr #1
c0de30c6:	f848 2024 	str.w	r2, [r8, r4, lsl #2]
c0de30ca:	ea0b 0247 	and.w	r2, fp, r7, lsl #1
c0de30ce:	ea4f 0737 	mov.w	r7, r7, rrx
c0de30d2:	3401      	adds	r4, #1
c0de30d4:	f1c2 0201 	rsb	r2, r2, #1
c0de30d8:	f848 2021 	str.w	r2, [r8, r1, lsl #2]
c0de30dc:	e7e0      	b.n	c0de30a0 <pqcrystals_dilithium2_lowram_poly_challenge+0x66>
c0de30de:	b056      	add	sp, #344	@ 0x158
c0de30e0:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de30e4 <pqcrystals_dilithium2_lowram_polyeta_pack>:
c0de30e4:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de30e8:	3001      	adds	r0, #1
c0de30ea:	2200      	movs	r2, #0
c0de30ec:	2640      	movs	r6, #64	@ 0x40
c0de30ee:	f5b2 6f80 	cmp.w	r2, #1024	@ 0x400
c0de30f2:	bf08      	it	eq
c0de30f4:	e8bd 8df0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de30f8:	188b      	adds	r3, r1, r2
c0de30fa:	f851 8002 	ldr.w	r8, [r1, r2]
c0de30fe:	2710      	movs	r7, #16
c0de3100:	3220      	adds	r2, #32
c0de3102:	f103 0b04 	add.w	fp, r3, #4
c0de3106:	f103 0e10 	add.w	lr, r3, #16
c0de310a:	69db      	ldr	r3, [r3, #28]
c0de310c:	e89b 0830 	ldmia.w	fp, {r4, r5, fp}
c0de3110:	e89e 5400 	ldmia.w	lr, {sl, ip, lr}
c0de3114:	f1c5 0502 	rsb	r5, r5, #2
c0de3118:	eba6 1343 	sub.w	r3, r6, r3, lsl #5
c0de311c:	eba7 04c4 	sub.w	r4, r7, r4, lsl #3
c0de3120:	f1c8 0702 	rsb	r7, r8, #2
c0de3124:	b2ed      	uxtb	r5, r5
c0de3126:	433c      	orrs	r4, r7
c0de3128:	f1cc 0702 	rsb	r7, ip, #2
c0de312c:	ea44 1485 	orr.w	r4, r4, r5, lsl #6
c0de3130:	b2ff      	uxtb	r7, r7
c0de3132:	f800 4c01 	strb.w	r4, [r0, #-1]
c0de3136:	2408      	movs	r4, #8
c0de3138:	eba4 048e 	sub.w	r4, r4, lr, lsl #2
c0de313c:	ea44 0457 	orr.w	r4, r4, r7, lsr #1
c0de3140:	4323      	orrs	r3, r4
c0de3142:	2420      	movs	r4, #32
c0de3144:	7043      	strb	r3, [r0, #1]
c0de3146:	2304      	movs	r3, #4
c0de3148:	eba4 140a 	sub.w	r4, r4, sl, lsl #4
c0de314c:	eba3 034b 	sub.w	r3, r3, fp, lsl #1
c0de3150:	ea43 0395 	orr.w	r3, r3, r5, lsr #2
c0de3154:	4323      	orrs	r3, r4
c0de3156:	ea43 13c7 	orr.w	r3, r3, r7, lsl #7
c0de315a:	f800 3b03 	strb.w	r3, [r0], #3
c0de315e:	e7c6      	b.n	c0de30ee <pqcrystals_dilithium2_lowram_polyeta_pack+0xa>

c0de3160 <pqcrystals_dilithium2_lowram_polyt1_pack>:
c0de3160:	b5b0      	push	{r4, r5, r7, lr}
c0de3162:	3108      	adds	r1, #8
c0de3164:	2200      	movs	r2, #0
c0de3166:	f5b2 7fa0 	cmp.w	r2, #320	@ 0x140
c0de316a:	bf08      	it	eq
c0de316c:	bdb0      	popeq	{r4, r5, r7, pc}
c0de316e:	f851 3c08 	ldr.w	r3, [r1, #-8]
c0de3172:	5483      	strb	r3, [r0, r2]
c0de3174:	1883      	adds	r3, r0, r2
c0de3176:	3205      	adds	r2, #5
c0de3178:	e951 4502 	ldrd	r4, r5, [r1, #-8]
c0de317c:	00ad      	lsls	r5, r5, #2
c0de317e:	ea45 2414 	orr.w	r4, r5, r4, lsr #8
c0de3182:	705c      	strb	r4, [r3, #1]
c0de3184:	680d      	ldr	r5, [r1, #0]
c0de3186:	f851 4c04 	ldr.w	r4, [r1, #-4]
c0de318a:	012d      	lsls	r5, r5, #4
c0de318c:	ea45 1494 	orr.w	r4, r5, r4, lsr #6
c0de3190:	709c      	strb	r4, [r3, #2]
c0de3192:	e9d1 4500 	ldrd	r4, r5, [r1]
c0de3196:	01ad      	lsls	r5, r5, #6
c0de3198:	ea45 1414 	orr.w	r4, r5, r4, lsr #4
c0de319c:	70dc      	strb	r4, [r3, #3]
c0de319e:	684c      	ldr	r4, [r1, #4]
c0de31a0:	3110      	adds	r1, #16
c0de31a2:	08a4      	lsrs	r4, r4, #2
c0de31a4:	711c      	strb	r4, [r3, #4]
c0de31a6:	e7de      	b.n	c0de3166 <pqcrystals_dilithium2_lowram_polyt1_pack+0x6>

c0de31a8 <pqcrystals_dilithium2_lowram_polyt0_pack>:
c0de31a8:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de31ac:	311c      	adds	r1, #28
c0de31ae:	f04f 0c00 	mov.w	ip, #0
c0de31b2:	9000      	str	r0, [sp, #0]
c0de31b4:	f5bc 7fd0 	cmp.w	ip, #416	@ 0x1a0
c0de31b8:	bf08      	it	eq
c0de31ba:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de31be:	f851 0c14 	ldr.w	r0, [r1, #-20]
c0de31c2:	e951 a504 	ldrd	sl, r5, [r1, #-16]
c0de31c6:	e951 3807 	ldrd	r3, r8, [r1, #-28]
c0de31ca:	e951 e602 	ldrd	lr, r6, [r1, #-8]
c0de31ce:	f851 7b20 	ldr.w	r7, [r1], #32
c0de31d2:	9001      	str	r0, [sp, #4]
c0de31d4:	9800      	ldr	r0, [sp, #0]
c0de31d6:	f5c7 5780 	rsb	r7, r7, #4096	@ 0x1000
c0de31da:	f5c3 5b80 	rsb	fp, r3, #4096	@ 0x1000
c0de31de:	f5c5 5580 	rsb	r5, r5, #4096	@ 0x1000
c0de31e2:	097b      	lsrs	r3, r7, #5
c0de31e4:	eb00 040c 	add.w	r4, r0, ip
c0de31e8:	f800 b00c 	strb.w	fp, [r0, ip]
c0de31ec:	f10c 0c0d 	add.w	ip, ip, #13
c0de31f0:	7323      	strb	r3, [r4, #12]
c0de31f2:	f5c6 5380 	rsb	r3, r6, #4096	@ 0x1000
c0de31f6:	089e      	lsrs	r6, r3, #2
c0de31f8:	72a6      	strb	r6, [r4, #10]
c0de31fa:	092e      	lsrs	r6, r5, #4
c0de31fc:	71e6      	strb	r6, [r4, #7]
c0de31fe:	f5ca 5680 	rsb	r6, sl, #4096	@ 0x1000
c0de3202:	0872      	lsrs	r2, r6, #1
c0de3204:	7162      	strb	r2, [r4, #5]
c0de3206:	f5c8 5280 	rsb	r2, r8, #4096	@ 0x1000
c0de320a:	08d0      	lsrs	r0, r2, #3
c0de320c:	70a0      	strb	r0, [r4, #2]
c0de320e:	00f8      	lsls	r0, r7, #3
c0de3210:	ea40 2093 	orr.w	r0, r0, r3, lsr #10
c0de3214:	019b      	lsls	r3, r3, #6
c0de3216:	72e0      	strb	r0, [r4, #11]
c0de3218:	f5ce 5080 	rsb	r0, lr, #4096	@ 0x1000
c0de321c:	ea43 13d0 	orr.w	r3, r3, r0, lsr #7
c0de3220:	0040      	lsls	r0, r0, #1
c0de3222:	ea40 3015 	orr.w	r0, r0, r5, lsr #12
c0de3226:	7263      	strb	r3, [r4, #9]
c0de3228:	01f3      	lsls	r3, r6, #7
c0de322a:	7220      	strb	r0, [r4, #8]
c0de322c:	0128      	lsls	r0, r5, #4
c0de322e:	ea40 2056 	orr.w	r0, r0, r6, lsr #9
c0de3232:	71a0      	strb	r0, [r4, #6]
c0de3234:	9801      	ldr	r0, [sp, #4]
c0de3236:	f5c0 5080 	rsb	r0, r0, #4096	@ 0x1000
c0de323a:	ea43 1390 	orr.w	r3, r3, r0, lsr #6
c0de323e:	0080      	lsls	r0, r0, #2
c0de3240:	ea40 20d2 	orr.w	r0, r0, r2, lsr #11
c0de3244:	7123      	strb	r3, [r4, #4]
c0de3246:	70e0      	strb	r0, [r4, #3]
c0de3248:	0150      	lsls	r0, r2, #5
c0de324a:	ea40 201b 	orr.w	r0, r0, fp, lsr #8
c0de324e:	7060      	strb	r0, [r4, #1]
c0de3250:	e7b0      	b.n	c0de31b4 <pqcrystals_dilithium2_lowram_polyt0_pack+0xc>

c0de3252 <pqcrystals_dilithium2_lowram_polyz_pack>:
c0de3252:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de3254:	3108      	adds	r1, #8
c0de3256:	f04f 0e00 	mov.w	lr, #0
c0de325a:	f5be 7f10 	cmp.w	lr, #576	@ 0x240
c0de325e:	bf08      	it	eq
c0de3260:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de3262:	e951 3c02 	ldrd	r3, ip, [r1, #-8]
c0de3266:	e8f1 5604 	ldrd	r5, r6, [r1], #16
c0de326a:	eb00 070e 	add.w	r7, r0, lr
c0de326e:	f5c6 3600 	rsb	r6, r6, #131072	@ 0x20000
c0de3272:	f5c3 3300 	rsb	r3, r3, #131072	@ 0x20000
c0de3276:	0ab4      	lsrs	r4, r6, #10
c0de3278:	f800 300e 	strb.w	r3, [r0, lr]
c0de327c:	f10e 0e09 	add.w	lr, lr, #9
c0de3280:	723c      	strb	r4, [r7, #8]
c0de3282:	08b4      	lsrs	r4, r6, #2
c0de3284:	71fc      	strb	r4, [r7, #7]
c0de3286:	f5c5 3400 	rsb	r4, r5, #131072	@ 0x20000
c0de328a:	0925      	lsrs	r5, r4, #4
c0de328c:	717d      	strb	r5, [r7, #5]
c0de328e:	f5cc 3500 	rsb	r5, ip, #131072	@ 0x20000
c0de3292:	09aa      	lsrs	r2, r5, #6
c0de3294:	70fa      	strb	r2, [r7, #3]
c0de3296:	0a1a      	lsrs	r2, r3, #8
c0de3298:	707a      	strb	r2, [r7, #1]
c0de329a:	01b2      	lsls	r2, r6, #6
c0de329c:	ea42 3214 	orr.w	r2, r2, r4, lsr #12
c0de32a0:	71ba      	strb	r2, [r7, #6]
c0de32a2:	0122      	lsls	r2, r4, #4
c0de32a4:	ea42 3295 	orr.w	r2, r2, r5, lsr #14
c0de32a8:	713a      	strb	r2, [r7, #4]
c0de32aa:	00aa      	lsls	r2, r5, #2
c0de32ac:	ea42 4213 	orr.w	r2, r2, r3, lsr #16
c0de32b0:	70ba      	strb	r2, [r7, #2]
c0de32b2:	e7d2      	b.n	c0de325a <pqcrystals_dilithium2_lowram_polyz_pack+0x8>

c0de32b4 <pqcrystals_dilithium2_lowram_polyw1_pack>:
c0de32b4:	b5b0      	push	{r4, r5, r7, lr}
c0de32b6:	3001      	adds	r0, #1
c0de32b8:	2200      	movs	r2, #0
c0de32ba:	f5b2 6f80 	cmp.w	r2, #1024	@ 0x400
c0de32be:	bf08      	it	eq
c0de32c0:	bdb0      	popeq	{r4, r5, r7, pc}
c0de32c2:	588b      	ldr	r3, [r1, r2]
c0de32c4:	188c      	adds	r4, r1, r2
c0de32c6:	3210      	adds	r2, #16
c0de32c8:	f800 3c01 	strb.w	r3, [r0, #-1]
c0de32cc:	6865      	ldr	r5, [r4, #4]
c0de32ce:	ea43 1385 	orr.w	r3, r3, r5, lsl #6
c0de32d2:	f800 3c01 	strb.w	r3, [r0, #-1]
c0de32d6:	6863      	ldr	r3, [r4, #4]
c0de32d8:	089d      	lsrs	r5, r3, #2
c0de32da:	7005      	strb	r5, [r0, #0]
c0de32dc:	68a5      	ldr	r5, [r4, #8]
c0de32de:	012d      	lsls	r5, r5, #4
c0de32e0:	ea45 0393 	orr.w	r3, r5, r3, lsr #2
c0de32e4:	7003      	strb	r3, [r0, #0]
c0de32e6:	68a3      	ldr	r3, [r4, #8]
c0de32e8:	091d      	lsrs	r5, r3, #4
c0de32ea:	7045      	strb	r5, [r0, #1]
c0de32ec:	68e4      	ldr	r4, [r4, #12]
c0de32ee:	00a4      	lsls	r4, r4, #2
c0de32f0:	ea44 1313 	orr.w	r3, r4, r3, lsr #4
c0de32f4:	7043      	strb	r3, [r0, #1]
c0de32f6:	3003      	adds	r0, #3
c0de32f8:	e7df      	b.n	c0de32ba <pqcrystals_dilithium2_lowram_polyw1_pack+0x6>

c0de32fa <OUTLINED_FUNCTION_0>:
c0de32fa:	4614      	mov	r4, r2
c0de32fc:	460d      	mov	r5, r1
c0de32fe:	4606      	mov	r6, r0
c0de3300:	2700      	movs	r7, #0
c0de3302:	4770      	bx	lr

c0de3304 <OUTLINED_FUNCTION_1>:
c0de3304:	f814 0b01 	ldrb.w	r0, [r4], #1
c0de3308:	2100      	movs	r1, #0
c0de330a:	4632      	mov	r2, r6
c0de330c:	f008 be60 	b.w	c0debfd0 <__aeabi_llsl>

c0de3310 <randombytes>:
c0de3310:	f008 bb21 	b.w	c0deb956 <cx_rng_no_throw>

c0de3314 <pqcrystals_dilithium2_lowram_montgomery_reduce>:
c0de3314:	4a03      	ldr	r2, [pc, #12]	@ (c0de3324 <pqcrystals_dilithium2_lowram_montgomery_reduce+0x10>)
c0de3316:	4b04      	ldr	r3, [pc, #16]	@ (c0de3328 <pqcrystals_dilithium2_lowram_montgomery_reduce+0x14>)
c0de3318:	4342      	muls	r2, r0
c0de331a:	fbc2 0103 	smlal	r0, r1, r2, r3
c0de331e:	4608      	mov	r0, r1
c0de3320:	4770      	bx	lr
c0de3322:	bf00      	nop
c0de3324:	03802001 	.word	0x03802001
c0de3328:	ff801fff 	.word	0xff801fff

c0de332c <pqcrystals_dilithium2_lowram_reduce32>:
c0de332c:	f500 0180 	add.w	r1, r0, #4194304	@ 0x400000
c0de3330:	4a02      	ldr	r2, [pc, #8]	@ (c0de333c <pqcrystals_dilithium2_lowram_reduce32+0x10>)
c0de3332:	15c9      	asrs	r1, r1, #23
c0de3334:	fb01 0002 	mla	r0, r1, r2, r0
c0de3338:	4770      	bx	lr
c0de333a:	bf00      	nop
c0de333c:	ff801fff 	.word	0xff801fff

c0de3340 <pqcrystals_dilithium2_lowram_caddq>:
c0de3340:	4902      	ldr	r1, [pc, #8]	@ (c0de334c <pqcrystals_dilithium2_lowram_caddq+0xc>)
c0de3342:	2800      	cmp	r0, #0
c0de3344:	bf48      	it	mi
c0de3346:	4408      	addmi	r0, r1
c0de3348:	4770      	bx	lr
c0de334a:	bf00      	nop
c0de334c:	007fe001 	.word	0x007fe001

c0de3350 <pqcrystals_dilithium2_lowram_freeze>:
c0de3350:	f500 0180 	add.w	r1, r0, #4194304	@ 0x400000
c0de3354:	4a04      	ldr	r2, [pc, #16]	@ (c0de3368 <pqcrystals_dilithium2_lowram_freeze+0x18>)
c0de3356:	15c9      	asrs	r1, r1, #23
c0de3358:	fb01 0002 	mla	r0, r1, r2, r0
c0de335c:	4903      	ldr	r1, [pc, #12]	@ (c0de336c <pqcrystals_dilithium2_lowram_freeze+0x1c>)
c0de335e:	2800      	cmp	r0, #0
c0de3360:	bf48      	it	mi
c0de3362:	4408      	addmi	r0, r1
c0de3364:	4770      	bx	lr
c0de3366:	bf00      	nop
c0de3368:	ff801fff 	.word	0xff801fff
c0de336c:	007fe001 	.word	0x007fe001

c0de3370 <pqcrystals_dilithium2_lowram_power2round>:
c0de3370:	f601 72ff 	addw	r2, r1, #4095	@ 0xfff
c0de3374:	f641 73ff 	movw	r3, #8191	@ 0x1fff
c0de3378:	ea22 0303 	bic.w	r3, r2, r3
c0de337c:	1ac9      	subs	r1, r1, r3
c0de337e:	6001      	str	r1, [r0, #0]
c0de3380:	1350      	asrs	r0, r2, #13
c0de3382:	4770      	bx	lr

c0de3384 <pqcrystals_dilithium2_lowram_decompose>:
c0de3384:	b510      	push	{r4, lr}
c0de3386:	f101 027f 	add.w	r2, r1, #127	@ 0x7f
c0de338a:	f642 430b 	movw	r3, #11275	@ 0x2c0b
c0de338e:	4c0c      	ldr	r4, [pc, #48]	@ (c0de33c0 <pqcrystals_dilithium2_lowram_decompose+0x3c>)
c0de3390:	11d2      	asrs	r2, r2, #7
c0de3392:	4353      	muls	r3, r2
c0de3394:	f503 0200 	add.w	r2, r3, #8388608	@ 0x800000
c0de3398:	1612      	asrs	r2, r2, #24
c0de339a:	f1b3 5f2e 	cmp.w	r3, #729808896	@ 0x2b800000
c0de339e:	4b06      	ldr	r3, [pc, #24]	@ (c0de33b8 <pqcrystals_dilithium2_lowram_decompose+0x34>)
c0de33a0:	bfa8      	it	ge
c0de33a2:	2200      	movge	r2, #0
c0de33a4:	fb02 1103 	mla	r1, r2, r3, r1
c0de33a8:	4b04      	ldr	r3, [pc, #16]	@ (c0de33bc <pqcrystals_dilithium2_lowram_decompose+0x38>)
c0de33aa:	42a1      	cmp	r1, r4
c0de33ac:	bfc8      	it	gt
c0de33ae:	4419      	addgt	r1, r3
c0de33b0:	6001      	str	r1, [r0, #0]
c0de33b2:	4610      	mov	r0, r2
c0de33b4:	bd10      	pop	{r4, pc}
c0de33b6:	bf00      	nop
c0de33b8:	fffd1800 	.word	0xfffd1800
c0de33bc:	ff801fff 	.word	0xff801fff
c0de33c0:	003ff000 	.word	0x003ff000

c0de33c4 <pqcrystals_dilithium2_lowram_use_hint>:
c0de33c4:	b51c      	push	{r2, r3, r4, lr}
c0de33c6:	460c      	mov	r4, r1
c0de33c8:	4601      	mov	r1, r0
c0de33ca:	a801      	add	r0, sp, #4
c0de33cc:	f7ff ffda 	bl	c0de3384 <pqcrystals_dilithium2_lowram_decompose>
c0de33d0:	b164      	cbz	r4, c0de33ec <pqcrystals_dilithium2_lowram_use_hint+0x28>
c0de33d2:	9901      	ldr	r1, [sp, #4]
c0de33d4:	2901      	cmp	r1, #1
c0de33d6:	db04      	blt.n	c0de33e2 <pqcrystals_dilithium2_lowram_use_hint+0x1e>
c0de33d8:	f1b0 012b 	subs.w	r1, r0, #43	@ 0x2b
c0de33dc:	bf18      	it	ne
c0de33de:	1c41      	addne	r1, r0, #1
c0de33e0:	e003      	b.n	c0de33ea <pqcrystals_dilithium2_lowram_use_hint+0x26>
c0de33e2:	1e41      	subs	r1, r0, #1
c0de33e4:	2800      	cmp	r0, #0
c0de33e6:	bf08      	it	eq
c0de33e8:	212b      	moveq	r1, #43	@ 0x2b
c0de33ea:	4608      	mov	r0, r1
c0de33ec:	bd1c      	pop	{r2, r3, r4, pc}

c0de33ee <pqcrystals_dilithium2_lowram_keypair>:
c0de33ee:	b570      	push	{r4, r5, r6, lr}
c0de33f0:	b088      	sub	sp, #32
c0de33f2:	466e      	mov	r6, sp
c0de33f4:	460c      	mov	r4, r1
c0de33f6:	4605      	mov	r5, r0
c0de33f8:	2120      	movs	r1, #32
c0de33fa:	4630      	mov	r0, r6
c0de33fc:	f7ff ff88 	bl	c0de3310 <randombytes>
c0de3400:	4628      	mov	r0, r5
c0de3402:	4621      	mov	r1, r4
c0de3404:	4632      	mov	r2, r6
c0de3406:	f000 f803 	bl	c0de3410 <crypto_sign_keypair_core>
c0de340a:	2000      	movs	r0, #0
c0de340c:	b008      	add	sp, #32
c0de340e:	bd70      	pop	{r4, r5, r6, pc}

c0de3410 <crypto_sign_keypair_core>:
c0de3410:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3414:	f6ad 4d88 	subw	sp, sp, #3208	@ 0xc88
c0de3418:	f60d 4608 	addw	r6, sp, #3080	@ 0xc08
c0de341c:	460c      	mov	r4, r1
c0de341e:	4605      	mov	r5, r0
c0de3420:	4611      	mov	r1, r2
c0de3422:	2220      	movs	r2, #32
c0de3424:	4630      	mov	r0, r6
c0de3426:	f008 fedb 	bl	c0dec1e0 <__aeabi_memcpy>
c0de342a:	f240 4004 	movw	r0, #1028	@ 0x404
c0de342e:	f8ad 0c28 	strh.w	r0, [sp, #3112]	@ 0xc28
c0de3432:	af02      	add	r7, sp, #8
c0de3434:	4638      	mov	r0, r7
c0de3436:	f7fd fecd 	bl	c0de11d4 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de343a:	4638      	mov	r0, r7
c0de343c:	4631      	mov	r1, r6
c0de343e:	2222      	movs	r2, #34	@ 0x22
c0de3440:	f7fd fed0 	bl	c0de11e4 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de3444:	4638      	mov	r0, r7
c0de3446:	f7fd fed8 	bl	c0de11fa <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de344a:	4630      	mov	r0, r6
c0de344c:	2180      	movs	r1, #128	@ 0x80
c0de344e:	463a      	mov	r2, r7
c0de3450:	f7fd fede 	bl	c0de1210 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de3454:	4620      	mov	r0, r4
c0de3456:	4631      	mov	r1, r6
c0de3458:	f7ff fb57 	bl	c0de2b0a <pack_sk_rho>
c0de345c:	f106 0160 	add.w	r1, r6, #96	@ 0x60
c0de3460:	4620      	mov	r0, r4
c0de3462:	9401      	str	r4, [sp, #4]
c0de3464:	f7ff fb59 	bl	c0de2b1a <pack_sk_key>
c0de3468:	4628      	mov	r0, r5
c0de346a:	4631      	mov	r1, r6
c0de346c:	9500      	str	r5, [sp, #0]
c0de346e:	f7ff fb26 	bl	c0de2abe <pack_pk_rho>
c0de3472:	f106 0520 	add.w	r5, r6, #32
c0de3476:	f04f 0b00 	mov.w	fp, #0
c0de347a:	f50d 6481 	add.w	r4, sp, #1032	@ 0x408
c0de347e:	f60d 0608 	addw	r6, sp, #2056	@ 0x808
c0de3482:	f04f 0800 	mov.w	r8, #0
c0de3486:	f1b8 0f04 	cmp.w	r8, #4
c0de348a:	d072      	beq.n	c0de3572 <crypto_sign_keypair_core+0x162>
c0de348c:	4638      	mov	r0, r7
c0de348e:	4629      	mov	r1, r5
c0de3490:	2200      	movs	r2, #0
c0de3492:	f7ff fd31 	bl	c0de2ef8 <pqcrystals_dilithium2_lowram_poly_uniform_eta>
c0de3496:	f1b8 0f00 	cmp.w	r8, #0
c0de349a:	d104      	bne.n	c0de34a6 <crypto_sign_keypair_core+0x96>
c0de349c:	9801      	ldr	r0, [sp, #4]
c0de349e:	4639      	mov	r1, r7
c0de34a0:	2200      	movs	r2, #0
c0de34a2:	f7ff fb1b 	bl	c0de2adc <pack_sk_s1>
c0de34a6:	4638      	mov	r0, r7
c0de34a8:	f7ff fc87 	bl	c0de2dba <pqcrystals_dilithium2_lowram_poly_ntt>
c0de34ac:	ea4f 2008 	mov.w	r0, r8, lsl #8
c0de34b0:	f60d 4108 	addw	r1, sp, #3080	@ 0xc08
c0de34b4:	b282      	uxth	r2, r0
c0de34b6:	4620      	mov	r0, r4
c0de34b8:	f7ff fcba 	bl	c0de2e30 <pqcrystals_dilithium2_lowram_poly_uniform>
c0de34bc:	4630      	mov	r0, r6
c0de34be:	4621      	mov	r1, r4
c0de34c0:	463a      	mov	r2, r7
c0de34c2:	f7ff fc7e 	bl	c0de2dc2 <pqcrystals_dilithium2_lowram_poly_pointwise_montgomery>
c0de34c6:	f04f 0a01 	mov.w	sl, #1
c0de34ca:	f1ba 0f04 	cmp.w	sl, #4
c0de34ce:	d020      	beq.n	c0de3512 <crypto_sign_keypair_core+0x102>
c0de34d0:	fa1f f28a 	uxth.w	r2, sl
c0de34d4:	4638      	mov	r0, r7
c0de34d6:	4629      	mov	r1, r5
c0de34d8:	f7ff fd0e 	bl	c0de2ef8 <pqcrystals_dilithium2_lowram_poly_uniform_eta>
c0de34dc:	f1b8 0f00 	cmp.w	r8, #0
c0de34e0:	d104      	bne.n	c0de34ec <crypto_sign_keypair_core+0xdc>
c0de34e2:	9801      	ldr	r0, [sp, #4]
c0de34e4:	4639      	mov	r1, r7
c0de34e6:	4652      	mov	r2, sl
c0de34e8:	f7ff faf8 	bl	c0de2adc <pack_sk_s1>
c0de34ec:	4638      	mov	r0, r7
c0de34ee:	f7ff fc64 	bl	c0de2dba <pqcrystals_dilithium2_lowram_poly_ntt>
c0de34f2:	eb0b 000a 	add.w	r0, fp, sl
c0de34f6:	f60d 4108 	addw	r1, sp, #3080	@ 0xc08
c0de34fa:	b282      	uxth	r2, r0
c0de34fc:	4620      	mov	r0, r4
c0de34fe:	f7ff fc97 	bl	c0de2e30 <pqcrystals_dilithium2_lowram_poly_uniform>
c0de3502:	4630      	mov	r0, r6
c0de3504:	4621      	mov	r1, r4
c0de3506:	463a      	mov	r2, r7
c0de3508:	f7ff fb72 	bl	c0de2bf0 <pqcrystals_dilithium2_lowram_poly_pointwise_acc_montgomery>
c0de350c:	f10a 0a01 	add.w	sl, sl, #1
c0de3510:	e7db      	b.n	c0de34ca <crypto_sign_keypair_core+0xba>
c0de3512:	4630      	mov	r0, r6
c0de3514:	f7ff fc24 	bl	c0de2d60 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de3518:	4630      	mov	r0, r6
c0de351a:	f7ff fc50 	bl	c0de2dbe <pqcrystals_dilithium2_lowram_poly_invntt_tomont>
c0de351e:	f108 0004 	add.w	r0, r8, #4
c0de3522:	4629      	mov	r1, r5
c0de3524:	b282      	uxth	r2, r0
c0de3526:	4620      	mov	r0, r4
c0de3528:	f7ff fce6 	bl	c0de2ef8 <pqcrystals_dilithium2_lowram_poly_uniform_eta>
c0de352c:	f8dd a004 	ldr.w	sl, [sp, #4]
c0de3530:	4621      	mov	r1, r4
c0de3532:	4642      	mov	r2, r8
c0de3534:	4650      	mov	r0, sl
c0de3536:	f7ff fad8 	bl	c0de2aea <pack_sk_s2>
c0de353a:	4630      	mov	r0, r6
c0de353c:	4631      	mov	r1, r6
c0de353e:	4622      	mov	r2, r4
c0de3540:	f7ff fc2c 	bl	c0de2d9c <pqcrystals_dilithium2_lowram_poly_add>
c0de3544:	4630      	mov	r0, r6
c0de3546:	f7ff fc1a 	bl	c0de2d7e <pqcrystals_dilithium2_lowram_poly_caddq>
c0de354a:	4638      	mov	r0, r7
c0de354c:	4621      	mov	r1, r4
c0de354e:	4632      	mov	r2, r6
c0de3550:	f7ff fc4a 	bl	c0de2de8 <pqcrystals_dilithium2_lowram_poly_power2round>
c0de3554:	4650      	mov	r0, sl
c0de3556:	4621      	mov	r1, r4
c0de3558:	4642      	mov	r2, r8
c0de355a:	f7ff face 	bl	c0de2afa <pack_sk_t0>
c0de355e:	9800      	ldr	r0, [sp, #0]
c0de3560:	4639      	mov	r1, r7
c0de3562:	4642      	mov	r2, r8
c0de3564:	f7ff fab3 	bl	c0de2ace <pack_pk_t1>
c0de3568:	f50b 7b80 	add.w	fp, fp, #256	@ 0x100
c0de356c:	f108 0801 	add.w	r8, r8, #1
c0de3570:	e789      	b.n	c0de3486 <crypto_sign_keypair_core+0x76>
c0de3572:	ac02      	add	r4, sp, #8
c0de3574:	9e00      	ldr	r6, [sp, #0]
c0de3576:	2140      	movs	r1, #64	@ 0x40
c0de3578:	f44f 63a4 	mov.w	r3, #1312	@ 0x520
c0de357c:	4620      	mov	r0, r4
c0de357e:	4632      	mov	r2, r6
c0de3580:	f7fd fe62 	bl	c0de1248 <pqcrystals_dilithium_fips202_ref_shake256>
c0de3584:	480c      	ldr	r0, [pc, #48]	@ (c0de35b8 <crypto_sign_keypair_core+0x1a8>)
c0de3586:	4621      	mov	r1, r4
c0de3588:	2240      	movs	r2, #64	@ 0x40
c0de358a:	eb09 0500 	add.w	r5, r9, r0
c0de358e:	f505 7008 	add.w	r0, r5, #544	@ 0x220
c0de3592:	f008 fe25 	bl	c0dec1e0 <__aeabi_memcpy>
c0de3596:	f505 7018 	add.w	r0, r5, #608	@ 0x260
c0de359a:	4631      	mov	r1, r6
c0de359c:	f44f 62a4 	mov.w	r2, #1312	@ 0x520
c0de35a0:	f008 fe1e 	bl	c0dec1e0 <__aeabi_memcpy>
c0de35a4:	9801      	ldr	r0, [sp, #4]
c0de35a6:	4621      	mov	r1, r4
c0de35a8:	f7ff fac0 	bl	c0de2b2c <pack_sk_tr>
c0de35ac:	2000      	movs	r0, #0
c0de35ae:	f60d 4d88 	addw	sp, sp, #3208	@ 0xc88
c0de35b2:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de35b6:	bf00      	nop
c0de35b8:	000002d8 	.word	0x000002d8

c0de35bc <crypto_sign_signature_init>:
c0de35bc:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de35c0:	29ff      	cmp	r1, #255	@ 0xff
c0de35c2:	d902      	bls.n	c0de35ca <crypto_sign_signature_init+0xe>
c0de35c4:	f04f 34ff 	mov.w	r4, #4294967295	@ 0xffffffff
c0de35c8:	e01c      	b.n	c0de3604 <crypto_sign_signature_init+0x48>
c0de35ca:	4680      	mov	r8, r0
c0de35cc:	480f      	ldr	r0, [pc, #60]	@ (c0de360c <crypto_sign_signature_init+0x50>)
c0de35ce:	2400      	movs	r4, #0
c0de35d0:	460d      	mov	r5, r1
c0de35d2:	eb09 0700 	add.w	r7, r9, r0
c0de35d6:	4638      	mov	r0, r7
c0de35d8:	f887 11a1 	strb.w	r1, [r7, #417]	@ 0x1a1
c0de35dc:	f887 41a0 	strb.w	r4, [r7, #416]	@ 0x1a0
c0de35e0:	f7fd fdf8 	bl	c0de11d4 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de35e4:	4e0a      	ldr	r6, [pc, #40]	@ (c0de3610 <crypto_sign_signature_init+0x54>)
c0de35e6:	f507 7108 	add.w	r1, r7, #544	@ 0x220
c0de35ea:	4638      	mov	r0, r7
c0de35ec:	2240      	movs	r2, #64	@ 0x40
c0de35ee:	447e      	add	r6, pc
c0de35f0:	47b0      	blx	r6
c0de35f2:	f507 71d0 	add.w	r1, r7, #416	@ 0x1a0
c0de35f6:	4638      	mov	r0, r7
c0de35f8:	2202      	movs	r2, #2
c0de35fa:	47b0      	blx	r6
c0de35fc:	4638      	mov	r0, r7
c0de35fe:	4641      	mov	r1, r8
c0de3600:	462a      	mov	r2, r5
c0de3602:	47b0      	blx	r6
c0de3604:	4620      	mov	r0, r4
c0de3606:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de360a:	bf00      	nop
c0de360c:	000002d8 	.word	0x000002d8
c0de3610:	ffffdbf3 	.word	0xffffdbf3

c0de3614 <crypto_sign_signature_absorb>:
c0de3614:	b580      	push	{r7, lr}
c0de3616:	460a      	mov	r2, r1
c0de3618:	4601      	mov	r1, r0
c0de361a:	4803      	ldr	r0, [pc, #12]	@ (c0de3628 <crypto_sign_signature_absorb+0x14>)
c0de361c:	4448      	add	r0, r9
c0de361e:	f7fd fde1 	bl	c0de11e4 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de3622:	2000      	movs	r0, #0
c0de3624:	bd80      	pop	{r7, pc}
c0de3626:	bf00      	nop
c0de3628:	000002d8 	.word	0x000002d8

c0de362c <crypto_sign_signature_core>:
c0de362c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3630:	f5ad 5d83 	sub.w	sp, sp, #4192	@ 0x1060
c0de3634:	b086      	sub	sp, #24
c0de3636:	f8df 8300 	ldr.w	r8, [pc, #768]	@ c0de3938 <crypto_sign_signature_core+0x30c>
c0de363a:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de363c:	4616      	mov	r6, r2
c0de363e:	9102      	str	r1, [sp, #8]
c0de3640:	eb09 0408 	add.w	r4, r9, r8
c0de3644:	4620      	mov	r0, r4
c0de3646:	f7fd fdd8 	bl	c0de11fa <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de364a:	f504 70d0 	add.w	r0, r4, #416	@ 0x1a0
c0de364e:	2140      	movs	r1, #64	@ 0x40
c0de3650:	4622      	mov	r2, r4
c0de3652:	f7fd fddd 	bl	c0de1210 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de3656:	a80d      	add	r0, sp, #52	@ 0x34
c0de3658:	2100      	movs	r1, #0
c0de365a:	f500 7000 	add.w	r0, r0, #512	@ 0x200
c0de365e:	9009      	str	r0, [sp, #36]	@ 0x24
c0de3660:	2000      	movs	r0, #0
c0de3662:	2920      	cmp	r1, #32
c0de3664:	d006      	beq.n	c0de3674 <crypto_sign_signature_core+0x48>
c0de3666:	eb09 0208 	add.w	r2, r9, r8
c0de366a:	440a      	add	r2, r1
c0de366c:	3101      	adds	r1, #1
c0de366e:	f882 01e0 	strb.w	r0, [r2, #480]	@ 0x1e0
c0de3672:	e7f6      	b.n	c0de3662 <crypto_sign_signature_core+0x36>
c0de3674:	eb09 0408 	add.w	r4, r9, r8
c0de3678:	4620      	mov	r0, r4
c0de367a:	f7fd fdab 	bl	c0de11d4 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de367e:	4fb0      	ldr	r7, [pc, #704]	@ (c0de3940 <crypto_sign_signature_core+0x314>)
c0de3680:	f106 0120 	add.w	r1, r6, #32
c0de3684:	4620      	mov	r0, r4
c0de3686:	2220      	movs	r2, #32
c0de3688:	447f      	add	r7, pc
c0de368a:	47b8      	blx	r7
c0de368c:	f504 75f0 	add.w	r5, r4, #480	@ 0x1e0
c0de3690:	4620      	mov	r0, r4
c0de3692:	2220      	movs	r2, #32
c0de3694:	4629      	mov	r1, r5
c0de3696:	47b8      	blx	r7
c0de3698:	f504 71d0 	add.w	r1, r4, #416	@ 0x1a0
c0de369c:	4620      	mov	r0, r4
c0de369e:	2240      	movs	r2, #64	@ 0x40
c0de36a0:	47b8      	blx	r7
c0de36a2:	4620      	mov	r0, r4
c0de36a4:	f7fd fda9 	bl	c0de11fa <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de36a8:	4628      	mov	r0, r5
c0de36aa:	2140      	movs	r1, #64	@ 0x40
c0de36ac:	4622      	mov	r2, r4
c0de36ae:	f7fd fdaf 	bl	c0de1210 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de36b2:	f506 7060 	add.w	r0, r6, #896	@ 0x380
c0de36b6:	2100      	movs	r1, #0
c0de36b8:	f04f 0b00 	mov.w	fp, #0
c0de36bc:	9003      	str	r0, [sp, #12]
c0de36be:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de36c0:	3020      	adds	r0, #32
c0de36c2:	9004      	str	r0, [sp, #16]
c0de36c4:	ac0d      	add	r4, sp, #52	@ 0x34
c0de36c6:	2001      	movs	r0, #1
c0de36c8:	9106      	str	r1, [sp, #24]
c0de36ca:	9005      	str	r0, [sp, #20]
c0de36cc:	b280      	uxth	r0, r0
c0de36ce:	f64f 71fc 	movw	r1, #65532	@ 0xfffc
c0de36d2:	eb01 0080 	add.w	r0, r1, r0, lsl #2
c0de36d6:	f50d 618f 	add.w	r1, sp, #1144	@ 0x478
c0de36da:	9008      	str	r0, [sp, #32]
c0de36dc:	2000      	movs	r0, #0
c0de36de:	2804      	cmp	r0, #4
c0de36e0:	d00b      	beq.n	c0de36fa <crypto_sign_signature_core+0xce>
c0de36e2:	2200      	movs	r2, #0
c0de36e4:	f5b2 7f40 	cmp.w	r2, #768	@ 0x300
c0de36e8:	d003      	beq.n	c0de36f2 <crypto_sign_signature_core+0xc6>
c0de36ea:	f801 b002 	strb.w	fp, [r1, r2]
c0de36ee:	3201      	adds	r2, #1
c0de36f0:	e7f8      	b.n	c0de36e4 <crypto_sign_signature_core+0xb8>
c0de36f2:	f501 7140 	add.w	r1, r1, #768	@ 0x300
c0de36f6:	3001      	adds	r0, #1
c0de36f8:	e7f1      	b.n	c0de36de <crypto_sign_signature_core+0xb2>
c0de36fa:	9806      	ldr	r0, [sp, #24]
c0de36fc:	f04f 0a00 	mov.w	sl, #0
c0de3700:	b280      	uxth	r0, r0
c0de3702:	0080      	lsls	r0, r0, #2
c0de3704:	900a      	str	r0, [sp, #40]	@ 0x28
c0de3706:	f1ba 0f04 	cmp.w	sl, #4
c0de370a:	d026      	beq.n	c0de375a <crypto_sign_signature_core+0x12e>
c0de370c:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de370e:	eb09 0308 	add.w	r3, r9, r8
c0de3712:	f503 71f0 	add.w	r1, r3, #480	@ 0x1e0
c0de3716:	4450      	add	r0, sl
c0de3718:	b282      	uxth	r2, r0
c0de371a:	4620      	mov	r0, r4
c0de371c:	f7ff f8c7 	bl	c0de28ae <poly_uniform_gamma1_lowram>
c0de3720:	4620      	mov	r0, r4
c0de3722:	f7ff fb4a 	bl	c0de2dba <pqcrystals_dilithium2_lowram_poly_ntt>
c0de3726:	2700      	movs	r7, #0
c0de3728:	f50d 658f 	add.w	r5, sp, #1144	@ 0x478
c0de372c:	f5b7 6f80 	cmp.w	r7, #1024	@ 0x400
c0de3730:	d010      	beq.n	c0de3754 <crypto_sign_signature_core+0x128>
c0de3732:	eb09 0008 	add.w	r0, r9, r8
c0de3736:	4621      	mov	r1, r4
c0de3738:	4632      	mov	r2, r6
c0de373a:	30d0      	adds	r0, #208	@ 0xd0
c0de373c:	9000      	str	r0, [sp, #0]
c0de373e:	eb0a 0007 	add.w	r0, sl, r7
c0de3742:	b283      	uxth	r3, r0
c0de3744:	4628      	mov	r0, r5
c0de3746:	f7ff f86f 	bl	c0de2828 <poly_uniform_pointwise_montgomery_polywadd_lowram>
c0de374a:	f505 7540 	add.w	r5, r5, #768	@ 0x300
c0de374e:	f507 7780 	add.w	r7, r7, #256	@ 0x100
c0de3752:	e7eb      	b.n	c0de372c <crypto_sign_signature_core+0x100>
c0de3754:	f10a 0a01 	add.w	sl, sl, #1
c0de3758:	e7d5      	b.n	c0de3706 <crypto_sign_signature_core+0xda>
c0de375a:	2700      	movs	r7, #0
c0de375c:	f50d 658f 	add.w	r5, sp, #1144	@ 0x478
c0de3760:	f5b7 7f40 	cmp.w	r7, #768	@ 0x300
c0de3764:	d01a      	beq.n	c0de379c <crypto_sign_signature_core+0x170>
c0de3766:	4620      	mov	r0, r4
c0de3768:	4629      	mov	r1, r5
c0de376a:	f7fe ffd4 	bl	c0de2716 <polyw_unpack>
c0de376e:	4620      	mov	r0, r4
c0de3770:	f7ff fb25 	bl	c0de2dbe <pqcrystals_dilithium2_lowram_poly_invntt_tomont>
c0de3774:	4620      	mov	r0, r4
c0de3776:	f7ff fb02 	bl	c0de2d7e <pqcrystals_dilithium2_lowram_poly_caddq>
c0de377a:	4628      	mov	r0, r5
c0de377c:	4621      	mov	r1, r4
c0de377e:	f7fe ffac 	bl	c0de26da <polyw_pack>
c0de3782:	4620      	mov	r0, r4
c0de3784:	4621      	mov	r1, r4
c0de3786:	f7fe fff6 	bl	c0de2776 <poly_highbits>
c0de378a:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de378c:	4621      	mov	r1, r4
c0de378e:	4438      	add	r0, r7
c0de3790:	f7ff fd90 	bl	c0de32b4 <pqcrystals_dilithium2_lowram_polyw1_pack>
c0de3794:	f505 7540 	add.w	r5, r5, #768	@ 0x300
c0de3798:	37c0      	adds	r7, #192	@ 0xc0
c0de379a:	e7e1      	b.n	c0de3760 <crypto_sign_signature_core+0x134>
c0de379c:	eb09 0508 	add.w	r5, r9, r8
c0de37a0:	4628      	mov	r0, r5
c0de37a2:	f7fd fd17 	bl	c0de11d4 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de37a6:	f505 71d0 	add.w	r1, r5, #416	@ 0x1a0
c0de37aa:	4628      	mov	r0, r5
c0de37ac:	2240      	movs	r2, #64	@ 0x40
c0de37ae:	f7fd fd19 	bl	c0de11e4 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de37b2:	9f0b      	ldr	r7, [sp, #44]	@ 0x2c
c0de37b4:	4628      	mov	r0, r5
c0de37b6:	f44f 7240 	mov.w	r2, #768	@ 0x300
c0de37ba:	4639      	mov	r1, r7
c0de37bc:	f7fd fd12 	bl	c0de11e4 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de37c0:	4628      	mov	r0, r5
c0de37c2:	f7fd fd1a 	bl	c0de11fa <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de37c6:	4638      	mov	r0, r7
c0de37c8:	2120      	movs	r1, #32
c0de37ca:	462a      	mov	r2, r5
c0de37cc:	f7fd fd20 	bl	c0de1210 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de37d0:	4620      	mov	r0, r4
c0de37d2:	4639      	mov	r1, r7
c0de37d4:	f7ff fc31 	bl	c0de303a <pqcrystals_dilithium2_lowram_poly_challenge>
c0de37d8:	f20d 4034 	addw	r0, sp, #1076	@ 0x434
c0de37dc:	4621      	mov	r1, r4
c0de37de:	f7fe fda9 	bl	c0de2334 <poly_challenge_compress>
c0de37e2:	9806      	ldr	r0, [sp, #24]
c0de37e4:	f8dd a010 	ldr.w	sl, [sp, #16]
c0de37e8:	2500      	movs	r5, #0
c0de37ea:	3001      	adds	r0, #1
c0de37ec:	9006      	str	r0, [sp, #24]
c0de37ee:	b135      	cbz	r5, c0de37fe <crypto_sign_signature_core+0x1d2>
c0de37f0:	2d04      	cmp	r5, #4
c0de37f2:	d032      	beq.n	c0de385a <crypto_sign_signature_core+0x22e>
c0de37f4:	4620      	mov	r0, r4
c0de37f6:	f20d 4134 	addw	r1, sp, #1076	@ 0x434
c0de37fa:	f7fe fdd0 	bl	c0de239e <poly_challenge_decompress>
c0de37fe:	f000 f9e7 	bl	c0de3bd0 <OUTLINED_FUNCTION_0>
c0de3802:	4620      	mov	r0, r4
c0de3804:	4631      	mov	r1, r6
c0de3806:	462a      	mov	r2, r5
c0de3808:	f7fe fffe 	bl	c0de2808 <unpack_sk_s1>
c0de380c:	4620      	mov	r0, r4
c0de380e:	f000 f9e5 	bl	c0de3bdc <small_ntt>
c0de3812:	4620      	mov	r0, r4
c0de3814:	4639      	mov	r1, r7
c0de3816:	4622      	mov	r2, r4
c0de3818:	f000 fb04 	bl	c0de3e24 <poly_small_basemul_invntt>
c0de381c:	eb09 0008 	add.w	r0, r9, r8
c0de3820:	4621      	mov	r1, r4
c0de3822:	9000      	str	r0, [sp, #0]
c0de3824:	f500 72f0 	add.w	r2, r0, #480	@ 0x1e0
c0de3828:	9808      	ldr	r0, [sp, #32]
c0de382a:	4428      	add	r0, r5
c0de382c:	b283      	uxth	r3, r0
c0de382e:	4620      	mov	r0, r4
c0de3830:	f7ff f88a 	bl	c0de2948 <poly_uniform_gamma1_add_lowram>
c0de3834:	4620      	mov	r0, r4
c0de3836:	f7ff fa93 	bl	c0de2d60 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de383a:	4840      	ldr	r0, [pc, #256]	@ (c0de393c <crypto_sign_signature_core+0x310>)
c0de383c:	f500 410c 	add.w	r1, r0, #35840	@ 0x8c00
c0de3840:	4620      	mov	r0, r4
c0de3842:	f7ff fadf 	bl	c0de2e04 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de3846:	2800      	cmp	r0, #0
c0de3848:	d165      	bne.n	c0de3916 <crypto_sign_signature_core+0x2ea>
c0de384a:	4650      	mov	r0, sl
c0de384c:	4621      	mov	r1, r4
c0de384e:	f7ff fd00 	bl	c0de3252 <pqcrystals_dilithium2_lowram_polyz_pack>
c0de3852:	f50a 7a10 	add.w	sl, sl, #576	@ 0x240
c0de3856:	3501      	adds	r5, #1
c0de3858:	e7c9      	b.n	c0de37ee <crypto_sign_signature_core+0x1c2>
c0de385a:	f8dd a00c 	ldr.w	sl, [sp, #12]
c0de385e:	2100      	movs	r1, #0
c0de3860:	2000      	movs	r0, #0
c0de3862:	f50d 658f 	add.w	r5, sp, #1144	@ 0x478
c0de3866:	2700      	movs	r7, #0
c0de3868:	9008      	str	r0, [sp, #32]
c0de386a:	910c      	str	r1, [sp, #48]	@ 0x30
c0de386c:	2f04      	cmp	r7, #4
c0de386e:	d055      	beq.n	c0de391c <crypto_sign_signature_core+0x2f0>
c0de3870:	4620      	mov	r0, r4
c0de3872:	f20d 4134 	addw	r1, sp, #1076	@ 0x434
c0de3876:	f7fe fd92 	bl	c0de239e <poly_challenge_decompress>
c0de387a:	950a      	str	r5, [sp, #40]	@ 0x28
c0de387c:	463d      	mov	r5, r7
c0de387e:	f000 f9a7 	bl	c0de3bd0 <OUTLINED_FUNCTION_0>
c0de3882:	4620      	mov	r0, r4
c0de3884:	4631      	mov	r1, r6
c0de3886:	462a      	mov	r2, r5
c0de3888:	9507      	str	r5, [sp, #28]
c0de388a:	f7fe ffc4 	bl	c0de2816 <unpack_sk_s2>
c0de388e:	4620      	mov	r0, r4
c0de3890:	f000 f9a4 	bl	c0de3bdc <small_ntt>
c0de3894:	4620      	mov	r0, r4
c0de3896:	4639      	mov	r1, r7
c0de3898:	9d0a      	ldr	r5, [sp, #40]	@ 0x28
c0de389a:	4622      	mov	r2, r4
c0de389c:	f000 fac2 	bl	c0de3e24 <poly_small_basemul_invntt>
c0de38a0:	4620      	mov	r0, r4
c0de38a2:	4629      	mov	r1, r5
c0de38a4:	4622      	mov	r2, r4
c0de38a6:	f7fe ff4e 	bl	c0de2746 <polyw_sub>
c0de38aa:	4620      	mov	r0, r4
c0de38ac:	f7ff fa58 	bl	c0de2d60 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de38b0:	4628      	mov	r0, r5
c0de38b2:	4621      	mov	r1, r4
c0de38b4:	f7fe ff11 	bl	c0de26da <polyw_pack>
c0de38b8:	4620      	mov	r0, r4
c0de38ba:	4621      	mov	r1, r4
c0de38bc:	f7fe ff74 	bl	c0de27a8 <poly_lowbits>
c0de38c0:	4620      	mov	r0, r4
c0de38c2:	f7ff fa4d 	bl	c0de2d60 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de38c6:	491d      	ldr	r1, [pc, #116]	@ (c0de393c <crypto_sign_signature_core+0x310>)
c0de38c8:	4620      	mov	r0, r4
c0de38ca:	f7ff fa9b 	bl	c0de2e04 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de38ce:	bb10      	cbnz	r0, c0de3916 <crypto_sign_signature_core+0x2ea>
c0de38d0:	4620      	mov	r0, r4
c0de38d2:	f20d 4134 	addw	r1, sp, #1076	@ 0x434
c0de38d6:	4652      	mov	r2, sl
c0de38d8:	f7fe fd93 	bl	c0de2402 <poly_schoolbook>
c0de38dc:	4620      	mov	r0, r4
c0de38de:	f44f 31ba 	mov.w	r1, #95232	@ 0x17400
c0de38e2:	f7ff fa8f 	bl	c0de2e04 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de38e6:	b9b0      	cbnz	r0, c0de3916 <crypto_sign_signature_core+0x2ea>
c0de38e8:	4620      	mov	r0, r4
c0de38ea:	4621      	mov	r1, r4
c0de38ec:	462a      	mov	r2, r5
c0de38ee:	f7ff f84f 	bl	c0de2990 <poly_make_hint_lowram>
c0de38f2:	9908      	ldr	r1, [sp, #32]
c0de38f4:	4401      	add	r1, r0
c0de38f6:	2950      	cmp	r1, #80	@ 0x50
c0de38f8:	9108      	str	r1, [sp, #32]
c0de38fa:	d80c      	bhi.n	c0de3916 <crypto_sign_signature_core+0x2ea>
c0de38fc:	9f07      	ldr	r7, [sp, #28]
c0de38fe:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de3900:	4621      	mov	r1, r4
c0de3902:	ab0c      	add	r3, sp, #48	@ 0x30
c0de3904:	463a      	mov	r2, r7
c0de3906:	f7fe fcf3 	bl	c0de22f0 <pqcrystals_dilithium2_lowram_pack_sig_h>
c0de390a:	f50a 7ad0 	add.w	sl, sl, #416	@ 0x1a0
c0de390e:	f505 7540 	add.w	r5, r5, #768	@ 0x300
c0de3912:	3701      	adds	r7, #1
c0de3914:	e7aa      	b.n	c0de386c <crypto_sign_signature_core+0x240>
c0de3916:	9805      	ldr	r0, [sp, #20]
c0de3918:	3001      	adds	r0, #1
c0de391a:	e6d6      	b.n	c0de36ca <crypto_sign_signature_core+0x9e>
c0de391c:	a90c      	add	r1, sp, #48	@ 0x30
c0de391e:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de3920:	f7fe fcfc 	bl	c0de231c <pqcrystals_dilithium2_lowram_pack_sig_h_zero>
c0de3924:	9902      	ldr	r1, [sp, #8]
c0de3926:	f640 1074 	movw	r0, #2420	@ 0x974
c0de392a:	6008      	str	r0, [r1, #0]
c0de392c:	2000      	movs	r0, #0
c0de392e:	f50d 5d83 	add.w	sp, sp, #4192	@ 0x1060
c0de3932:	b006      	add	sp, #24
c0de3934:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de3938:	000002d8 	.word	0x000002d8
c0de393c:	000173b2 	.word	0x000173b2
c0de3940:	ffffdb59 	.word	0xffffdb59

c0de3944 <pqcrystals_dilithium2_lowram_verify>:
c0de3944:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3948:	f5ad 6d10 	sub.w	sp, sp, #2304	@ 0x900
c0de394c:	4615      	mov	r5, r2
c0de394e:	f640 1274 	movw	r2, #2420	@ 0x974
c0de3952:	4604      	mov	r4, r0
c0de3954:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de3958:	4291      	cmp	r1, r2
c0de395a:	f040 80ea 	bne.w	c0de3b32 <pqcrystals_dilithium2_lowram_verify+0x1ee>
c0de395e:	f8dd a924 	ldr.w	sl, [sp, #2340]	@ 0x924
c0de3962:	f1ba 0fff 	cmp.w	sl, #255	@ 0xff
c0de3966:	f200 80e4 	bhi.w	c0de3b32 <pqcrystals_dilithium2_lowram_verify+0x1ee>
c0de396a:	4f80      	ldr	r7, [pc, #512]	@ (c0de3b6c <pqcrystals_dilithium2_lowram_verify+0x228>)
c0de396c:	f10d 0be8 	add.w	fp, sp, #232	@ 0xe8
c0de3970:	f8dd 6928 	ldr.w	r6, [sp, #2344]	@ 0x928
c0de3974:	9305      	str	r3, [sp, #20]
c0de3976:	4658      	mov	r0, fp
c0de3978:	447f      	add	r7, pc
c0de397a:	47b8      	blx	r7
c0de397c:	9504      	str	r5, [sp, #16]
c0de397e:	4658      	mov	r0, fp
c0de3980:	4631      	mov	r1, r6
c0de3982:	f44f 62a4 	mov.w	r2, #1312	@ 0x520
c0de3986:	4d7a      	ldr	r5, [pc, #488]	@ (c0de3b70 <pqcrystals_dilithium2_lowram_verify+0x22c>)
c0de3988:	447d      	add	r5, pc
c0de398a:	47a8      	blx	r5
c0de398c:	4658      	mov	r0, fp
c0de398e:	f7fd fc34 	bl	c0de11fa <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de3992:	f50d 78dc 	add.w	r8, sp, #440	@ 0x1b8
c0de3996:	2140      	movs	r1, #64	@ 0x40
c0de3998:	465a      	mov	r2, fp
c0de399a:	4640      	mov	r0, r8
c0de399c:	f7fd fc38 	bl	c0de1210 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de39a0:	4658      	mov	r0, fp
c0de39a2:	47b8      	blx	r7
c0de39a4:	4658      	mov	r0, fp
c0de39a6:	4641      	mov	r1, r8
c0de39a8:	2240      	movs	r2, #64	@ 0x40
c0de39aa:	47a8      	blx	r5
c0de39ac:	f88d a1b9 	strb.w	sl, [sp, #441]	@ 0x1b9
c0de39b0:	4656      	mov	r6, sl
c0de39b2:	f04f 0a00 	mov.w	sl, #0
c0de39b6:	4658      	mov	r0, fp
c0de39b8:	4641      	mov	r1, r8
c0de39ba:	2202      	movs	r2, #2
c0de39bc:	f88d a1b8 	strb.w	sl, [sp, #440]	@ 0x1b8
c0de39c0:	47a8      	blx	r5
c0de39c2:	f8dd 1920 	ldr.w	r1, [sp, #2336]	@ 0x920
c0de39c6:	4658      	mov	r0, fp
c0de39c8:	4632      	mov	r2, r6
c0de39ca:	47a8      	blx	r5
c0de39cc:	e9dd 1204 	ldrd	r1, r2, [sp, #16]
c0de39d0:	4658      	mov	r0, fp
c0de39d2:	47a8      	blx	r5
c0de39d4:	4658      	mov	r0, fp
c0de39d6:	f7fd fc10 	bl	c0de11fa <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de39da:	4640      	mov	r0, r8
c0de39dc:	2140      	movs	r1, #64	@ 0x40
c0de39de:	465a      	mov	r2, fp
c0de39e0:	f7fd fc16 	bl	c0de1210 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de39e4:	4658      	mov	r0, fp
c0de39e6:	47b8      	blx	r7
c0de39e8:	4658      	mov	r0, fp
c0de39ea:	4641      	mov	r1, r8
c0de39ec:	2240      	movs	r2, #64	@ 0x40
c0de39ee:	47a8      	blx	r5
c0de39f0:	f20d 46fc 	addw	r6, sp, #1276	@ 0x4fc
c0de39f4:	4621      	mov	r1, r4
c0de39f6:	4630      	mov	r0, r6
c0de39f8:	f7ff f8a1 	bl	c0de2b3e <poly_challenge_lowram>
c0de39fc:	4640      	mov	r0, r8
c0de39fe:	4631      	mov	r1, r6
c0de3a00:	f7fe fc98 	bl	c0de2334 <poly_challenge_compress>
c0de3a04:	f8dd 0928 	ldr.w	r0, [sp, #2344]	@ 0x928
c0de3a08:	f104 0520 	add.w	r5, r4, #32
c0de3a0c:	f10d 0b18 	add.w	fp, sp, #24
c0de3a10:	f50d 78fe 	add.w	r8, sp, #508	@ 0x1fc
c0de3a14:	2700      	movs	r7, #0
c0de3a16:	9502      	str	r5, [sp, #8]
c0de3a18:	3020      	adds	r0, #32
c0de3a1a:	9003      	str	r0, [sp, #12]
c0de3a1c:	2001      	movs	r0, #1
c0de3a1e:	9005      	str	r0, [sp, #20]
c0de3a20:	2f04      	cmp	r7, #4
c0de3a22:	f000 808a 	beq.w	c0de3b3a <pqcrystals_dilithium2_lowram_verify+0x1f6>
c0de3a26:	2000      	movs	r0, #0
c0de3a28:	f5b0 7f40 	cmp.w	r0, #768	@ 0x300
c0de3a2c:	d003      	beq.n	c0de3a36 <pqcrystals_dilithium2_lowram_verify+0xf2>
c0de3a2e:	f808 a000 	strb.w	sl, [r8, r0]
c0de3a32:	3001      	adds	r0, #1
c0de3a34:	e7f8      	b.n	c0de3a28 <pqcrystals_dilithium2_lowram_verify+0xe4>
c0de3a36:	4630      	mov	r0, r6
c0de3a38:	4629      	mov	r1, r5
c0de3a3a:	f7ff faae 	bl	c0de2f9a <pqcrystals_dilithium2_lowram_polyz_unpack>
c0de3a3e:	494a      	ldr	r1, [pc, #296]	@ (c0de3b68 <pqcrystals_dilithium2_lowram_verify+0x224>)
c0de3a40:	4630      	mov	r0, r6
c0de3a42:	f7ff f9df 	bl	c0de2e04 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de3a46:	2800      	cmp	r0, #0
c0de3a48:	d171      	bne.n	c0de3b2e <pqcrystals_dilithium2_lowram_verify+0x1ea>
c0de3a4a:	4630      	mov	r0, r6
c0de3a4c:	f7ff f9b5 	bl	c0de2dba <pqcrystals_dilithium2_lowram_poly_ntt>
c0de3a50:	0238      	lsls	r0, r7, #8
c0de3a52:	f8dd 2928 	ldr.w	r2, [sp, #2344]	@ 0x928
c0de3a56:	4631      	mov	r1, r6
c0de3a58:	465d      	mov	r5, fp
c0de3a5a:	f8cd b000 	str.w	fp, [sp]
c0de3a5e:	9704      	str	r7, [sp, #16]
c0de3a60:	b283      	uxth	r3, r0
c0de3a62:	4640      	mov	r0, r8
c0de3a64:	f7fe fee0 	bl	c0de2828 <poly_uniform_pointwise_montgomery_polywadd_lowram>
c0de3a68:	9f05      	ldr	r7, [sp, #20]
c0de3a6a:	f44f 7b18 	mov.w	fp, #608	@ 0x260
c0de3a6e:	f5bb 6f12 	cmp.w	fp, #2336	@ 0x920
c0de3a72:	d019      	beq.n	c0de3aa8 <pqcrystals_dilithium2_lowram_verify+0x164>
c0de3a74:	eb04 010b 	add.w	r1, r4, fp
c0de3a78:	4630      	mov	r0, r6
c0de3a7a:	f7ff fa8e 	bl	c0de2f9a <pqcrystals_dilithium2_lowram_polyz_unpack>
c0de3a7e:	493a      	ldr	r1, [pc, #232]	@ (c0de3b68 <pqcrystals_dilithium2_lowram_verify+0x224>)
c0de3a80:	4630      	mov	r0, r6
c0de3a82:	f7ff f9bf 	bl	c0de2e04 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de3a86:	2800      	cmp	r0, #0
c0de3a88:	d151      	bne.n	c0de3b2e <pqcrystals_dilithium2_lowram_verify+0x1ea>
c0de3a8a:	4630      	mov	r0, r6
c0de3a8c:	f7ff f995 	bl	c0de2dba <pqcrystals_dilithium2_lowram_poly_ntt>
c0de3a90:	f8dd 2928 	ldr.w	r2, [sp, #2344]	@ 0x928
c0de3a94:	b2bb      	uxth	r3, r7
c0de3a96:	4640      	mov	r0, r8
c0de3a98:	4631      	mov	r1, r6
c0de3a9a:	9500      	str	r5, [sp, #0]
c0de3a9c:	f7fe fec4 	bl	c0de2828 <poly_uniform_pointwise_montgomery_polywadd_lowram>
c0de3aa0:	3701      	adds	r7, #1
c0de3aa2:	f50b 7b10 	add.w	fp, fp, #576	@ 0x240
c0de3aa6:	e7e2      	b.n	c0de3a6e <pqcrystals_dilithium2_lowram_verify+0x12a>
c0de3aa8:	4630      	mov	r0, r6
c0de3aaa:	4641      	mov	r1, r8
c0de3aac:	f7fe fe33 	bl	c0de2716 <polyw_unpack>
c0de3ab0:	4630      	mov	r0, r6
c0de3ab2:	f7ff f955 	bl	c0de2d60 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de3ab6:	4630      	mov	r0, r6
c0de3ab8:	f7ff f981 	bl	c0de2dbe <pqcrystals_dilithium2_lowram_poly_invntt_tomont>
c0de3abc:	4640      	mov	r0, r8
c0de3abe:	4631      	mov	r1, r6
c0de3ac0:	f7fe fe0b 	bl	c0de26da <polyw_pack>
c0de3ac4:	9f04      	ldr	r7, [sp, #16]
c0de3ac6:	9903      	ldr	r1, [sp, #12]
c0de3ac8:	eb07 0087 	add.w	r0, r7, r7, lsl #2
c0de3acc:	eb01 1280 	add.w	r2, r1, r0, lsl #6
c0de3ad0:	4630      	mov	r0, r6
c0de3ad2:	a96e      	add	r1, sp, #440	@ 0x1b8
c0de3ad4:	f7fe fd5a 	bl	c0de258c <poly_schoolbook_t1>
c0de3ad8:	4630      	mov	r0, r6
c0de3ada:	4641      	mov	r1, r8
c0de3adc:	4632      	mov	r2, r6
c0de3ade:	f7fe fe32 	bl	c0de2746 <polyw_sub>
c0de3ae2:	4630      	mov	r0, r6
c0de3ae4:	f7ff f93c 	bl	c0de2d60 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de3ae8:	4630      	mov	r0, r6
c0de3aea:	f7ff f948 	bl	c0de2d7e <pqcrystals_dilithium2_lowram_poly_caddq>
c0de3aee:	4628      	mov	r0, r5
c0de3af0:	f60d 01fc 	addw	r1, sp, #2300	@ 0x8fc
c0de3af4:	463a      	mov	r2, r7
c0de3af6:	4623      	mov	r3, r4
c0de3af8:	46ab      	mov	fp, r5
c0de3afa:	f7fe ff83 	bl	c0de2a04 <unpack_sig_h_indices>
c0de3afe:	b9b0      	cbnz	r0, c0de3b2e <pqcrystals_dilithium2_lowram_verify+0x1ea>
c0de3b00:	f8dd 38fc 	ldr.w	r3, [sp, #2300]	@ 0x8fc
c0de3b04:	4630      	mov	r0, r6
c0de3b06:	4631      	mov	r1, r6
c0de3b08:	465a      	mov	r2, fp
c0de3b0a:	f7fe ffb9 	bl	c0de2a80 <poly_use_hint_lowram>
c0de3b0e:	4640      	mov	r0, r8
c0de3b10:	4631      	mov	r1, r6
c0de3b12:	f7ff fbcf 	bl	c0de32b4 <pqcrystals_dilithium2_lowram_polyw1_pack>
c0de3b16:	a83a      	add	r0, sp, #232	@ 0xe8
c0de3b18:	4641      	mov	r1, r8
c0de3b1a:	22c0      	movs	r2, #192	@ 0xc0
c0de3b1c:	f7fd fb62 	bl	c0de11e4 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de3b20:	9805      	ldr	r0, [sp, #20]
c0de3b22:	9d02      	ldr	r5, [sp, #8]
c0de3b24:	3701      	adds	r7, #1
c0de3b26:	f500 7080 	add.w	r0, r0, #256	@ 0x100
c0de3b2a:	9005      	str	r0, [sp, #20]
c0de3b2c:	e778      	b.n	c0de3a20 <pqcrystals_dilithium2_lowram_verify+0xdc>
c0de3b2e:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de3b32:	f50d 6d10 	add.w	sp, sp, #2304	@ 0x900
c0de3b36:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de3b3a:	ad3a      	add	r5, sp, #232	@ 0xe8
c0de3b3c:	4628      	mov	r0, r5
c0de3b3e:	f7fd fb5c 	bl	c0de11fa <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de3b42:	4658      	mov	r0, fp
c0de3b44:	2120      	movs	r1, #32
c0de3b46:	462a      	mov	r2, r5
c0de3b48:	f7fd fb62 	bl	c0de1210 <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de3b4c:	2100      	movs	r1, #0
c0de3b4e:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de3b52:	2920      	cmp	r1, #32
c0de3b54:	d006      	beq.n	c0de3b64 <pqcrystals_dilithium2_lowram_verify+0x220>
c0de3b56:	f81b 2001 	ldrb.w	r2, [fp, r1]
c0de3b5a:	5c63      	ldrb	r3, [r4, r1]
c0de3b5c:	3101      	adds	r1, #1
c0de3b5e:	4293      	cmp	r3, r2
c0de3b60:	d0f7      	beq.n	c0de3b52 <pqcrystals_dilithium2_lowram_verify+0x20e>
c0de3b62:	e7e6      	b.n	c0de3b32 <pqcrystals_dilithium2_lowram_verify+0x1ee>
c0de3b64:	2000      	movs	r0, #0
c0de3b66:	e7e4      	b.n	c0de3b32 <pqcrystals_dilithium2_lowram_verify+0x1ee>
c0de3b68:	0001ffb2 	.word	0x0001ffb2
c0de3b6c:	ffffd859 	.word	0xffffd859
c0de3b70:	ffffd859 	.word	0xffffd859

c0de3b74 <pqcrystals_dilithium2_lowram_open>:
c0de3b74:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de3b76:	4604      	mov	r4, r0
c0de3b78:	f640 1074 	movw	r0, #2420	@ 0x974
c0de3b7c:	461d      	mov	r5, r3
c0de3b7e:	460e      	mov	r6, r1
c0de3b80:	4283      	cmp	r3, r0
c0de3b82:	d311      	bcc.n	c0de3ba8 <pqcrystals_dilithium2_lowram_open+0x34>
c0de3b84:	e9dd 7108 	ldrd	r7, r1, [sp, #32]
c0de3b88:	f6a5 1374 	subw	r3, r5, #2420	@ 0x974
c0de3b8c:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de3b8e:	6033      	str	r3, [r6, #0]
c0de3b90:	e9cd 7100 	strd	r7, r1, [sp]
c0de3b94:	f602 1774 	addw	r7, r2, #2420	@ 0x974
c0de3b98:	9002      	str	r0, [sp, #8]
c0de3b9a:	4610      	mov	r0, r2
c0de3b9c:	f640 1174 	movw	r1, #2420	@ 0x974
c0de3ba0:	463a      	mov	r2, r7
c0de3ba2:	f7ff fecf 	bl	c0de3944 <pqcrystals_dilithium2_lowram_verify>
c0de3ba6:	b148      	cbz	r0, c0de3bbc <pqcrystals_dilithium2_lowram_open+0x48>
c0de3ba8:	2000      	movs	r0, #0
c0de3baa:	6030      	str	r0, [r6, #0]
c0de3bac:	b11d      	cbz	r5, c0de3bb6 <pqcrystals_dilithium2_lowram_open+0x42>
c0de3bae:	f804 0b01 	strb.w	r0, [r4], #1
c0de3bb2:	3d01      	subs	r5, #1
c0de3bb4:	e7fa      	b.n	c0de3bac <pqcrystals_dilithium2_lowram_open+0x38>
c0de3bb6:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de3bba:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
c0de3bbc:	2000      	movs	r0, #0
c0de3bbe:	6831      	ldr	r1, [r6, #0]
c0de3bc0:	4288      	cmp	r0, r1
c0de3bc2:	bf24      	itt	cs
c0de3bc4:	2000      	movcs	r0, #0
c0de3bc6:	bdfe      	popcs	{r1, r2, r3, r4, r5, r6, r7, pc}
c0de3bc8:	5c39      	ldrb	r1, [r7, r0]
c0de3bca:	5421      	strb	r1, [r4, r0]
c0de3bcc:	3001      	adds	r0, #1
c0de3bce:	e7f6      	b.n	c0de3bbe <pqcrystals_dilithium2_lowram_open+0x4a>

c0de3bd0 <OUTLINED_FUNCTION_0>:
c0de3bd0:	9f09      	ldr	r7, [sp, #36]	@ 0x24
c0de3bd2:	4621      	mov	r1, r4
c0de3bd4:	4638      	mov	r0, r7
c0de3bd6:	f000 b8ed 	b.w	c0de3db4 <poly_small_ntt_copy>
	...

c0de3bdc <small_ntt>:
c0de3bdc:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3be0:	491c      	ldr	r1, [pc, #112]	@ (c0de3c54 <small_ntt+0x78>)
c0de3be2:	f04f 0c80 	mov.w	ip, #128	@ 0x80
c0de3be6:	f04f 0e01 	mov.w	lr, #1
c0de3bea:	f46f 6850 	mvn.w	r8, #3328	@ 0xd00
c0de3bee:	4479      	add	r1, pc
c0de3bf0:	468a      	mov	sl, r1
c0de3bf2:	4917      	ldr	r1, [pc, #92]	@ (c0de3c50 <small_ntt+0x74>)
c0de3bf4:	468b      	mov	fp, r1
c0de3bf6:	f1bc 0f02 	cmp.w	ip, #2
c0de3bfa:	bf38      	it	cc
c0de3bfc:	e8bd 8df0 	ldmiacc.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de3c00:	2600      	movs	r6, #0
c0de3c02:	2eff      	cmp	r6, #255	@ 0xff
c0de3c04:	d821      	bhi.n	c0de3c4a <small_ntt+0x6e>
c0de3c06:	4651      	mov	r1, sl
c0de3c08:	f93a 301e 	ldrsh.w	r3, [sl, lr, lsl #1]
c0de3c0c:	eb06 010c 	add.w	r1, r6, ip
c0de3c10:	460f      	mov	r7, r1
c0de3c12:	428e      	cmp	r6, r1
c0de3c14:	d215      	bcs.n	c0de3c42 <small_ntt+0x66>
c0de3c16:	f930 2017 	ldrsh.w	r2, [r0, r7, lsl #1]
c0de3c1a:	465c      	mov	r4, fp
c0de3c1c:	435a      	muls	r2, r3
c0de3c1e:	fb02 f40b 	mul.w	r4, r2, fp
c0de3c22:	1424      	asrs	r4, r4, #16
c0de3c24:	fb04 2208 	mla	r2, r4, r8, r2
c0de3c28:	f830 4016 	ldrh.w	r4, [r0, r6, lsl #1]
c0de3c2c:	eba4 4512 	sub.w	r5, r4, r2, lsr #16
c0de3c30:	eb04 4212 	add.w	r2, r4, r2, lsr #16
c0de3c34:	f820 5017 	strh.w	r5, [r0, r7, lsl #1]
c0de3c38:	f820 2016 	strh.w	r2, [r0, r6, lsl #1]
c0de3c3c:	3701      	adds	r7, #1
c0de3c3e:	3601      	adds	r6, #1
c0de3c40:	e7e7      	b.n	c0de3c12 <small_ntt+0x36>
c0de3c42:	f10e 0e01 	add.w	lr, lr, #1
c0de3c46:	463e      	mov	r6, r7
c0de3c48:	e7db      	b.n	c0de3c02 <small_ntt+0x26>
c0de3c4a:	ea4f 0c5c 	mov.w	ip, ip, lsr #1
c0de3c4e:	e7d2      	b.n	c0de3bf6 <small_ntt+0x1a>
c0de3c50:	f3010000 	.word	0xf3010000
c0de3c54:	0000b9e6 	.word	0x0000b9e6

c0de3c58 <small_invntt_tomont>:
c0de3c58:	e92d 4dfe 	stmdb	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de3c5c:	4934      	ldr	r1, [pc, #208]	@ (c0de3d30 <small_invntt_tomont+0xd8>)
c0de3c5e:	4b36      	ldr	r3, [pc, #216]	@ (c0de3d38 <small_invntt_tomont+0xe0>)
c0de3c60:	2202      	movs	r2, #2
c0de3c62:	247f      	movs	r4, #127	@ 0x7f
c0de3c64:	f644 68bf 	movw	r8, #20159	@ 0x4ebf
c0de3c68:	f46f 6a50 	mvn.w	sl, #3328	@ 0xd00
c0de3c6c:	468e      	mov	lr, r1
c0de3c6e:	4931      	ldr	r1, [pc, #196]	@ (c0de3d34 <small_invntt_tomont+0xdc>)
c0de3c70:	447b      	add	r3, pc
c0de3c72:	9300      	str	r3, [sp, #0]
c0de3c74:	f101 5bd3 	add.w	fp, r1, #442499072	@ 0x1a600000
c0de3c78:	2a80      	cmp	r2, #128	@ 0x80
c0de3c7a:	d834      	bhi.n	c0de3ce6 <small_invntt_tomont+0x8e>
c0de3c7c:	2300      	movs	r3, #0
c0de3c7e:	9201      	str	r2, [sp, #4]
c0de3c80:	2bff      	cmp	r3, #255	@ 0xff
c0de3c82:	d82e      	bhi.n	c0de3ce2 <small_invntt_tomont+0x8a>
c0de3c84:	9900      	ldr	r1, [sp, #0]
c0de3c86:	9402      	str	r4, [sp, #8]
c0de3c88:	f931 4014 	ldrsh.w	r4, [r1, r4, lsl #1]
c0de3c8c:	1899      	adds	r1, r3, r2
c0de3c8e:	460d      	mov	r5, r1
c0de3c90:	428b      	cmp	r3, r1
c0de3c92:	d221      	bcs.n	c0de3cd8 <small_invntt_tomont+0x80>
c0de3c94:	f830 6013 	ldrh.w	r6, [r0, r3, lsl #1]
c0de3c98:	f830 2015 	ldrh.w	r2, [r0, r5, lsl #1]
c0de3c9c:	46f4      	mov	ip, lr
c0de3c9e:	4432      	add	r2, r6
c0de3ca0:	b217      	sxth	r7, r2
c0de3ca2:	fb07 f708 	mul.w	r7, r7, r8
c0de3ca6:	f107 7700 	add.w	r7, r7, #33554432	@ 0x2000000
c0de3caa:	16bf      	asrs	r7, r7, #26
c0de3cac:	fb07 f70e 	mul.w	r7, r7, lr
c0de3cb0:	eba2 4217 	sub.w	r2, r2, r7, lsr #16
c0de3cb4:	f820 2013 	strh.w	r2, [r0, r3, lsl #1]
c0de3cb8:	3301      	adds	r3, #1
c0de3cba:	f830 2015 	ldrh.w	r2, [r0, r5, lsl #1]
c0de3cbe:	1b92      	subs	r2, r2, r6
c0de3cc0:	b212      	sxth	r2, r2
c0de3cc2:	4362      	muls	r2, r4
c0de3cc4:	fb02 f60b 	mul.w	r6, r2, fp
c0de3cc8:	1436      	asrs	r6, r6, #16
c0de3cca:	fb06 220a 	mla	r2, r6, sl, r2
c0de3cce:	0c12      	lsrs	r2, r2, #16
c0de3cd0:	f820 2015 	strh.w	r2, [r0, r5, lsl #1]
c0de3cd4:	3501      	adds	r5, #1
c0de3cd6:	e7db      	b.n	c0de3c90 <small_invntt_tomont+0x38>
c0de3cd8:	9c02      	ldr	r4, [sp, #8]
c0de3cda:	9a01      	ldr	r2, [sp, #4]
c0de3cdc:	462b      	mov	r3, r5
c0de3cde:	3c01      	subs	r4, #1
c0de3ce0:	e7ce      	b.n	c0de3c80 <small_invntt_tomont+0x28>
c0de3ce2:	0052      	lsls	r2, r2, #1
c0de3ce4:	e7c8      	b.n	c0de3c78 <small_invntt_tomont+0x20>
c0de3ce6:	2100      	movs	r1, #0
c0de3ce8:	f240 52a1 	movw	r2, #1441	@ 0x5a1
c0de3cec:	f46f 6350 	mvn.w	r3, #3328	@ 0xd00
c0de3cf0:	f644 64bf 	movw	r4, #20159	@ 0x4ebf
c0de3cf4:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de3cf8:	bf08      	it	eq
c0de3cfa:	e8bd 8dfe 	ldmiaeq.w	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de3cfe:	f930 5011 	ldrsh.w	r5, [r0, r1, lsl #1]
c0de3d02:	4f0c      	ldr	r7, [pc, #48]	@ (c0de3d34 <small_invntt_tomont+0xdc>)
c0de3d04:	fb05 f602 	mul.w	r6, r5, r2
c0de3d08:	437d      	muls	r5, r7
c0de3d0a:	4677      	mov	r7, lr
c0de3d0c:	142d      	asrs	r5, r5, #16
c0de3d0e:	fb05 6503 	mla	r5, r5, r3, r6
c0de3d12:	142e      	asrs	r6, r5, #16
c0de3d14:	0c2d      	lsrs	r5, r5, #16
c0de3d16:	4366      	muls	r6, r4
c0de3d18:	f106 7600 	add.w	r6, r6, #33554432	@ 0x2000000
c0de3d1c:	16b6      	asrs	r6, r6, #26
c0de3d1e:	fb06 f60e 	mul.w	r6, r6, lr
c0de3d22:	eba5 4516 	sub.w	r5, r5, r6, lsr #16
c0de3d26:	f820 5011 	strh.w	r5, [r0, r1, lsl #1]
c0de3d2a:	3101      	adds	r1, #1
c0de3d2c:	e7e2      	b.n	c0de3cf4 <small_invntt_tomont+0x9c>
c0de3d2e:	bf00      	nop
c0de3d30:	0d010000 	.word	0x0d010000
c0de3d34:	d8a10000 	.word	0xd8a10000
c0de3d38:	0000b964 	.word	0x0000b964

c0de3d3c <small_basemul>:
c0de3d3c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de3d3e:	f9b1 c000 	ldrsh.w	ip, [r1]
c0de3d42:	f9b1 5002 	ldrsh.w	r5, [r1, #2]
c0de3d46:	f9b2 1002 	ldrsh.w	r1, [r2, #2]
c0de3d4a:	f46f 6e50 	mvn.w	lr, #3328	@ 0xd00
c0de3d4e:	f9b2 6000 	ldrsh.w	r6, [r2]
c0de3d52:	fb01 f705 	mul.w	r7, r1, r5
c0de3d56:	4916      	ldr	r1, [pc, #88]	@ (c0de3db0 <small_basemul+0x74>)
c0de3d58:	fb07 f401 	mul.w	r4, r7, r1
c0de3d5c:	1424      	asrs	r4, r4, #16
c0de3d5e:	fb04 740e 	mla	r4, r4, lr, r7
c0de3d62:	1424      	asrs	r4, r4, #16
c0de3d64:	4363      	muls	r3, r4
c0de3d66:	fb03 f401 	mul.w	r4, r3, r1
c0de3d6a:	1424      	asrs	r4, r4, #16
c0de3d6c:	fb04 330e 	mla	r3, r4, lr, r3
c0de3d70:	fb06 f40c 	mul.w	r4, r6, ip
c0de3d74:	fb04 f701 	mul.w	r7, r4, r1
c0de3d78:	143f      	asrs	r7, r7, #16
c0de3d7a:	0c1b      	lsrs	r3, r3, #16
c0de3d7c:	fb07 440e 	mla	r4, r7, lr, r4
c0de3d80:	eb03 4314 	add.w	r3, r3, r4, lsr #16
c0de3d84:	8003      	strh	r3, [r0, #0]
c0de3d86:	fb06 f305 	mul.w	r3, r6, r5
c0de3d8a:	f9b2 2002 	ldrsh.w	r2, [r2, #2]
c0de3d8e:	fb03 f401 	mul.w	r4, r3, r1
c0de3d92:	1424      	asrs	r4, r4, #16
c0de3d94:	fb02 f20c 	mul.w	r2, r2, ip
c0de3d98:	fb04 330e 	mla	r3, r4, lr, r3
c0de3d9c:	4351      	muls	r1, r2
c0de3d9e:	1409      	asrs	r1, r1, #16
c0de3da0:	fb01 210e 	mla	r1, r1, lr, r2
c0de3da4:	0c09      	lsrs	r1, r1, #16
c0de3da6:	eb01 4113 	add.w	r1, r1, r3, lsr #16
c0de3daa:	8041      	strh	r1, [r0, #2]
c0de3dac:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de3dae:	bf00      	nop
c0de3db0:	f3010000 	.word	0xf3010000

c0de3db4 <poly_small_ntt_copy>:
c0de3db4:	22ff      	movs	r2, #255	@ 0xff
c0de3db6:	f1b2 3fff 	cmp.w	r2, #4294967295	@ 0xffffffff
c0de3dba:	bfd8      	it	le
c0de3dbc:	f7ff bf0e 	ble.w	c0de3bdc <small_ntt>
c0de3dc0:	f851 3022 	ldr.w	r3, [r1, r2, lsl #2]
c0de3dc4:	f820 3012 	strh.w	r3, [r0, r2, lsl #1]
c0de3dc8:	3a01      	subs	r2, #1
c0de3dca:	e7f4      	b.n	c0de3db6 <poly_small_ntt_copy+0x2>

c0de3dcc <poly_small_basemul>:
c0de3dcc:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de3dd0:	e9cd 1200 	strd	r1, r2, [sp]
c0de3dd4:	4683      	mov	fp, r0
c0de3dd6:	f04f 0a00 	mov.w	sl, #0
c0de3dda:	4811      	ldr	r0, [pc, #68]	@ (c0de3e20 <poly_small_basemul+0x54>)
c0de3ddc:	4478      	add	r0, pc
c0de3dde:	f100 0880 	add.w	r8, r0, #128	@ 0x80
c0de3de2:	f5ba 7f00 	cmp.w	sl, #512	@ 0x200
c0de3de6:	bf08      	it	eq
c0de3de8:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de3dec:	9800      	ldr	r0, [sp, #0]
c0de3dee:	f938 6b02 	ldrsh.w	r6, [r8], #2
c0de3df2:	eb0b 070a 	add.w	r7, fp, sl
c0de3df6:	eb00 040a 	add.w	r4, r0, sl
c0de3dfa:	9801      	ldr	r0, [sp, #4]
c0de3dfc:	4633      	mov	r3, r6
c0de3dfe:	4621      	mov	r1, r4
c0de3e00:	eb00 050a 	add.w	r5, r0, sl
c0de3e04:	4638      	mov	r0, r7
c0de3e06:	462a      	mov	r2, r5
c0de3e08:	f7ff ff98 	bl	c0de3d3c <small_basemul>
c0de3e0c:	4273      	negs	r3, r6
c0de3e0e:	1d38      	adds	r0, r7, #4
c0de3e10:	1d21      	adds	r1, r4, #4
c0de3e12:	1d2a      	adds	r2, r5, #4
c0de3e14:	b21b      	sxth	r3, r3
c0de3e16:	f7ff ff91 	bl	c0de3d3c <small_basemul>
c0de3e1a:	f10a 0a08 	add.w	sl, sl, #8
c0de3e1e:	e7e0      	b.n	c0de3de2 <poly_small_basemul+0x16>
c0de3e20:	0000b7f8 	.word	0x0000b7f8

c0de3e24 <poly_small_basemul_invntt>:
c0de3e24:	b510      	push	{r4, lr}
c0de3e26:	4604      	mov	r4, r0
c0de3e28:	f7ff ffd0 	bl	c0de3dcc <poly_small_basemul>
c0de3e2c:	4620      	mov	r0, r4
c0de3e2e:	f7ff ff13 	bl	c0de3c58 <small_invntt_tomont>
c0de3e32:	20ff      	movs	r0, #255	@ 0xff
c0de3e34:	2800      	cmp	r0, #0
c0de3e36:	d405      	bmi.n	c0de3e44 <poly_small_basemul_invntt+0x20>
c0de3e38:	f934 1010 	ldrsh.w	r1, [r4, r0, lsl #1]
c0de3e3c:	f844 1020 	str.w	r1, [r4, r0, lsl #2]
c0de3e40:	3801      	subs	r0, #1
c0de3e42:	e7f7      	b.n	c0de3e34 <poly_small_basemul_invntt+0x10>
c0de3e44:	bd10      	pop	{r4, pc}

c0de3e46 <small_polyeta_unpack>:
c0de3e46:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3e4a:	3101      	adds	r1, #1
c0de3e4c:	f04f 0c00 	mov.w	ip, #0
c0de3e50:	f5bc 7f00 	cmp.w	ip, #512	@ 0x200
c0de3e54:	bf08      	it	eq
c0de3e56:	e8bd 8df0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de3e5a:	f811 4c01 	ldrb.w	r4, [r1, #-1]
c0de3e5e:	f004 0807 	and.w	r8, r4, #7
c0de3e62:	eb00 040c 	add.w	r4, r0, ip
c0de3e66:	f820 800c 	strh.w	r8, [r0, ip]
c0de3e6a:	f1c8 0202 	rsb	r2, r8, #2
c0de3e6e:	f811 5c01 	ldrb.w	r5, [r1, #-1]
c0de3e72:	f3c5 0ec2 	ubfx	lr, r5, #3, #3
c0de3e76:	f8a4 e002 	strh.w	lr, [r4, #2]
c0de3e7a:	f811 6c01 	ldrb.w	r6, [r1, #-1]
c0de3e7e:	780b      	ldrb	r3, [r1, #0]
c0de3e80:	09b6      	lsrs	r6, r6, #6
c0de3e82:	f363 0682 	bfi	r6, r3, #2, #1
c0de3e86:	80a6      	strh	r6, [r4, #4]
c0de3e88:	780b      	ldrb	r3, [r1, #0]
c0de3e8a:	f3c3 0a42 	ubfx	sl, r3, #1, #3
c0de3e8e:	f8a4 a006 	strh.w	sl, [r4, #6]
c0de3e92:	780d      	ldrb	r5, [r1, #0]
c0de3e94:	f3c5 1502 	ubfx	r5, r5, #4, #3
c0de3e98:	8125      	strh	r5, [r4, #8]
c0de3e9a:	780f      	ldrb	r7, [r1, #0]
c0de3e9c:	784b      	ldrb	r3, [r1, #1]
c0de3e9e:	09ff      	lsrs	r7, r7, #7
c0de3ea0:	f363 0742 	bfi	r7, r3, #1, #2
c0de3ea4:	8167      	strh	r7, [r4, #10]
c0de3ea6:	784b      	ldrb	r3, [r1, #1]
c0de3ea8:	f3c3 0382 	ubfx	r3, r3, #2, #3
c0de3eac:	81a3      	strh	r3, [r4, #12]
c0de3eae:	f891 b001 	ldrb.w	fp, [r1, #1]
c0de3eb2:	f820 200c 	strh.w	r2, [r0, ip]
c0de3eb6:	f1c3 0202 	rsb	r2, r3, #2
c0de3eba:	3103      	adds	r1, #3
c0de3ebc:	f10c 0c10 	add.w	ip, ip, #16
c0de3ec0:	81a2      	strh	r2, [r4, #12]
c0de3ec2:	f1c7 0202 	rsb	r2, r7, #2
c0de3ec6:	8162      	strh	r2, [r4, #10]
c0de3ec8:	f1c5 0202 	rsb	r2, r5, #2
c0de3ecc:	8122      	strh	r2, [r4, #8]
c0de3ece:	f1ca 0202 	rsb	r2, sl, #2
c0de3ed2:	80e2      	strh	r2, [r4, #6]
c0de3ed4:	f1c6 0202 	rsb	r2, r6, #2
c0de3ed8:	80a2      	strh	r2, [r4, #4]
c0de3eda:	f1ce 0202 	rsb	r2, lr, #2
c0de3ede:	8062      	strh	r2, [r4, #2]
c0de3ee0:	2202      	movs	r2, #2
c0de3ee2:	eba2 125b 	sub.w	r2, r2, fp, lsr #5
c0de3ee6:	81e2      	strh	r2, [r4, #14]
c0de3ee8:	e7b2      	b.n	c0de3e50 <small_polyeta_unpack+0xa>

c0de3eea <pqcrystals_dilithium2_lowram_dilithium_shake128_stream_init>:
c0de3eea:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0de3eec:	f000 f825 	bl	c0de3f3a <OUTLINED_FUNCTION_0>
c0de3ef0:	f7fd f826 	bl	c0de0f40 <pqcrystals_dilithium_fips202_ref_shake128_init>
c0de3ef4:	4628      	mov	r0, r5
c0de3ef6:	4621      	mov	r1, r4
c0de3ef8:	2220      	movs	r2, #32
c0de3efa:	f7fd f833 	bl	c0de0f64 <pqcrystals_dilithium_fips202_ref_shake128_absorb>
c0de3efe:	f10d 0106 	add.w	r1, sp, #6
c0de3f02:	4628      	mov	r0, r5
c0de3f04:	2202      	movs	r2, #2
c0de3f06:	f7fd f82d 	bl	c0de0f64 <pqcrystals_dilithium_fips202_ref_shake128_absorb>
c0de3f0a:	4628      	mov	r0, r5
c0de3f0c:	f7fd f873 	bl	c0de0ff6 <pqcrystals_dilithium_fips202_ref_shake128_finalize>
c0de3f10:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0de3f12 <pqcrystals_dilithium2_lowram_dilithium_shake256_stream_init>:
c0de3f12:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0de3f14:	f000 f811 	bl	c0de3f3a <OUTLINED_FUNCTION_0>
c0de3f18:	f7fd f95c 	bl	c0de11d4 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de3f1c:	4628      	mov	r0, r5
c0de3f1e:	4621      	mov	r1, r4
c0de3f20:	2240      	movs	r2, #64	@ 0x40
c0de3f22:	f7fd f95f 	bl	c0de11e4 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de3f26:	f10d 0106 	add.w	r1, sp, #6
c0de3f2a:	4628      	mov	r0, r5
c0de3f2c:	2202      	movs	r2, #2
c0de3f2e:	f7fd f959 	bl	c0de11e4 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de3f32:	4628      	mov	r0, r5
c0de3f34:	f7fd f961 	bl	c0de11fa <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de3f38:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0de3f3a <OUTLINED_FUNCTION_0>:
c0de3f3a:	4605      	mov	r5, r0
c0de3f3c:	0a10      	lsrs	r0, r2, #8
c0de3f3e:	460c      	mov	r4, r1
c0de3f40:	f88d 2006 	strb.w	r2, [sp, #6]
c0de3f44:	f88d 0007 	strb.w	r0, [sp, #7]
c0de3f48:	4628      	mov	r0, r5
c0de3f4a:	4770      	bx	lr

c0de3f4c <os_io_handle_default_apdu>:
c0de3f4c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de3f4e:	b09d      	sub	sp, #116	@ 0x74
c0de3f50:	4615      	mov	r5, r2
c0de3f52:	9a22      	ldr	r2, [sp, #136]	@ 0x88
c0de3f54:	b3c8      	cbz	r0, c0de3fca <os_io_handle_default_apdu+0x7e>
c0de3f56:	b3c1      	cbz	r1, c0de3fca <os_io_handle_default_apdu+0x7e>
c0de3f58:	b3bd      	cbz	r5, c0de3fca <os_io_handle_default_apdu+0x7e>
c0de3f5a:	461c      	mov	r4, r3
c0de3f5c:	b3ab      	cbz	r3, c0de3fca <os_io_handle_default_apdu+0x7e>
c0de3f5e:	b10a      	cbz	r2, c0de3f64 <os_io_handle_default_apdu+0x18>
c0de3f60:	2100      	movs	r1, #0
c0de3f62:	7011      	strb	r1, [r2, #0]
c0de3f64:	7801      	ldrb	r1, [r0, #0]
c0de3f66:	29b0      	cmp	r1, #176	@ 0xb0
c0de3f68:	d131      	bne.n	c0de3fce <os_io_handle_default_apdu+0x82>
c0de3f6a:	7841      	ldrb	r1, [r0, #1]
c0de3f6c:	29a7      	cmp	r1, #167	@ 0xa7
c0de3f6e:	d031      	beq.n	c0de3fd4 <os_io_handle_default_apdu+0x88>
c0de3f70:	2906      	cmp	r1, #6
c0de3f72:	d036      	beq.n	c0de3fe2 <os_io_handle_default_apdu+0x96>
c0de3f74:	2901      	cmp	r1, #1
c0de3f76:	d131      	bne.n	c0de3fdc <os_io_handle_default_apdu+0x90>
c0de3f78:	7881      	ldrb	r1, [r0, #2]
c0de3f7a:	bb79      	cbnz	r1, c0de3fdc <os_io_handle_default_apdu+0x90>
c0de3f7c:	78c0      	ldrb	r0, [r0, #3]
c0de3f7e:	bb68      	cbnz	r0, c0de3fdc <os_io_handle_default_apdu+0x90>
c0de3f80:	6820      	ldr	r0, [r4, #0]
c0de3f82:	2100      	movs	r1, #0
c0de3f84:	6021      	str	r1, [r4, #0]
c0de3f86:	2803      	cmp	r0, #3
c0de3f88:	d321      	bcc.n	c0de3fce <os_io_handle_default_apdu+0x82>
c0de3f8a:	2601      	movs	r6, #1
c0de3f8c:	1ec7      	subs	r7, r0, #3
c0de3f8e:	6026      	str	r6, [r4, #0]
c0de3f90:	702e      	strb	r6, [r5, #0]
c0de3f92:	6820      	ldr	r0, [r4, #0]
c0de3f94:	1a3a      	subs	r2, r7, r0
c0de3f96:	4428      	add	r0, r5
c0de3f98:	1c41      	adds	r1, r0, #1
c0de3f9a:	2001      	movs	r0, #1
c0de3f9c:	f007 ffaa 	bl	c0debef4 <os_registry_get_current_app_tag>
c0de3fa0:	f000 f83f 	bl	c0de4022 <OUTLINED_FUNCTION_0>
c0de3fa4:	6020      	str	r0, [r4, #0]
c0de3fa6:	1a3a      	subs	r2, r7, r0
c0de3fa8:	4428      	add	r0, r5
c0de3faa:	1c41      	adds	r1, r0, #1
c0de3fac:	2002      	movs	r0, #2
c0de3fae:	f007 ffa1 	bl	c0debef4 <os_registry_get_current_app_tag>
c0de3fb2:	f000 f836 	bl	c0de4022 <OUTLINED_FUNCTION_0>
c0de3fb6:	1c41      	adds	r1, r0, #1
c0de3fb8:	6021      	str	r1, [r4, #0]
c0de3fba:	542e      	strb	r6, [r5, r0]
c0de3fbc:	f007 ff86 	bl	c0debecc <os_flags>
c0de3fc0:	6821      	ldr	r1, [r4, #0]
c0de3fc2:	1c4a      	adds	r2, r1, #1
c0de3fc4:	6022      	str	r2, [r4, #0]
c0de3fc6:	5468      	strb	r0, [r5, r1]
c0de3fc8:	e028      	b.n	c0de401c <os_io_handle_default_apdu+0xd0>
c0de3fca:	7814      	ldrb	r4, [r2, #0]
c0de3fcc:	e01e      	b.n	c0de400c <os_io_handle_default_apdu+0xc0>
c0de3fce:	f646 1485 	movw	r4, #27013	@ 0x6985
c0de3fd2:	e01b      	b.n	c0de400c <os_io_handle_default_apdu+0xc0>
c0de3fd4:	7881      	ldrb	r1, [r0, #2]
c0de3fd6:	b909      	cbnz	r1, c0de3fdc <os_io_handle_default_apdu+0x90>
c0de3fd8:	78c0      	ldrb	r0, [r0, #3]
c0de3fda:	b1d0      	cbz	r0, c0de4012 <os_io_handle_default_apdu+0xc6>
c0de3fdc:	f44f 44dc 	mov.w	r4, #28160	@ 0x6e00
c0de3fe0:	e014      	b.n	c0de400c <os_io_handle_default_apdu+0xc0>
c0de3fe2:	2100      	movs	r1, #0
c0de3fe4:	6021      	str	r1, [r4, #0]
c0de3fe6:	7883      	ldrb	r3, [r0, #2]
c0de3fe8:	7902      	ldrb	r2, [r0, #4]
c0de3fea:	ad02      	add	r5, sp, #8
c0de3fec:	e9cd 1500 	strd	r1, r5, [sp]
c0de3ff0:	1d41      	adds	r1, r0, #5
c0de3ff2:	4618      	mov	r0, r3
c0de3ff4:	2300      	movs	r3, #0
c0de3ff6:	f007 ff3d 	bl	c0debe74 <os_pki_load_certificate>
c0de3ffa:	4604      	mov	r4, r0
c0de3ffc:	4628      	mov	r0, r5
c0de3ffe:	216c      	movs	r1, #108	@ 0x6c
c0de4000:	f008 f906 	bl	c0dec210 <explicit_bzero>
c0de4004:	2c00      	cmp	r4, #0
c0de4006:	bf08      	it	eq
c0de4008:	f44f 4410 	moveq.w	r4, #36864	@ 0x9000
c0de400c:	4620      	mov	r0, r4
c0de400e:	b01d      	add	sp, #116	@ 0x74
c0de4010:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de4012:	2000      	movs	r0, #0
c0de4014:	6020      	str	r0, [r4, #0]
c0de4016:	b10a      	cbz	r2, c0de401c <os_io_handle_default_apdu+0xd0>
c0de4018:	2001      	movs	r0, #1
c0de401a:	7010      	strb	r0, [r2, #0]
c0de401c:	f44f 4410 	mov.w	r4, #36864	@ 0x9000
c0de4020:	e7f4      	b.n	c0de400c <os_io_handle_default_apdu+0xc0>

c0de4022 <OUTLINED_FUNCTION_0>:
c0de4022:	6821      	ldr	r1, [r4, #0]
c0de4024:	1c4a      	adds	r2, r1, #1
c0de4026:	6022      	str	r2, [r4, #0]
c0de4028:	5468      	strb	r0, [r5, r1]
c0de402a:	6821      	ldr	r1, [r4, #0]
c0de402c:	4408      	add	r0, r1
c0de402e:	4770      	bx	lr

c0de4030 <os_io_seph_cmd_piezo_play_tune>:
c0de4030:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0de4032:	280b      	cmp	r0, #11
c0de4034:	d902      	bls.n	c0de403c <os_io_seph_cmd_piezo_play_tune+0xc>
c0de4036:	f06f 0415 	mvn.w	r4, #21
c0de403a:	e021      	b.n	c0de4080 <os_io_seph_cmd_piezo_play_tune+0x50>
c0de403c:	4605      	mov	r5, r0
c0de403e:	2009      	movs	r0, #9
c0de4040:	2100      	movs	r1, #0
c0de4042:	2200      	movs	r2, #0
c0de4044:	2400      	movs	r4, #0
c0de4046:	f007 ff49 	bl	c0debedc <os_setting_get>
c0de404a:	2d08      	cmp	r5, #8
c0de404c:	d802      	bhi.n	c0de4054 <os_io_seph_cmd_piezo_play_tune+0x24>
c0de404e:	f010 0102 	ands.w	r1, r0, #2
c0de4052:	d115      	bne.n	c0de4080 <os_io_seph_cmd_piezo_play_tune+0x50>
c0de4054:	2400      	movs	r4, #0
c0de4056:	2d09      	cmp	r5, #9
c0de4058:	d302      	bcc.n	c0de4060 <os_io_seph_cmd_piezo_play_tune+0x30>
c0de405a:	f010 0001 	ands.w	r0, r0, #1
c0de405e:	d10f      	bne.n	c0de4080 <os_io_seph_cmd_piezo_play_tune+0x50>
c0de4060:	2056      	movs	r0, #86	@ 0x56
c0de4062:	f88d 5007 	strb.w	r5, [sp, #7]
c0de4066:	f88d 4005 	strb.w	r4, [sp, #5]
c0de406a:	2204      	movs	r2, #4
c0de406c:	2300      	movs	r3, #0
c0de406e:	f88d 0004 	strb.w	r0, [sp, #4]
c0de4072:	2001      	movs	r0, #1
c0de4074:	f88d 0006 	strb.w	r0, [sp, #6]
c0de4078:	a901      	add	r1, sp, #4
c0de407a:	f000 f803 	bl	c0de4084 <OUTLINED_FUNCTION_1>
c0de407e:	4604      	mov	r4, r0
c0de4080:	4620      	mov	r0, r4
c0de4082:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0de4084 <OUTLINED_FUNCTION_1>:
c0de4084:	2001      	movs	r0, #1
c0de4086:	f007 bf5f 	b.w	c0debf48 <os_io_tx_cmd>
	...

c0de408c <io_process_itc_ux_event>:
c0de408c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de408e:	4605      	mov	r5, r0
c0de4090:	78c0      	ldrb	r0, [r0, #3]
c0de4092:	2820      	cmp	r0, #32
c0de4094:	d023      	beq.n	c0de40de <io_process_itc_ux_event+0x52>
c0de4096:	2823      	cmp	r0, #35	@ 0x23
c0de4098:	d029      	beq.n	c0de40ee <io_process_itc_ux_event+0x62>
c0de409a:	460c      	mov	r4, r1
c0de409c:	2822      	cmp	r0, #34	@ 0x22
c0de409e:	d132      	bne.n	c0de4106 <io_process_itc_ux_event+0x7a>
c0de40a0:	4e1f      	ldr	r6, [pc, #124]	@ (c0de4120 <io_process_itc_ux_event+0x94>)
c0de40a2:	2006      	movs	r0, #6
c0de40a4:	2118      	movs	r1, #24
c0de40a6:	f809 0006 	strb.w	r0, [r9, r6]
c0de40aa:	eb09 0706 	add.w	r7, r9, r6
c0de40ae:	2018      	movs	r0, #24
c0de40b0:	6078      	str	r0, [r7, #4]
c0de40b2:	f107 0008 	add.w	r0, r7, #8
c0de40b6:	f008 f89d 	bl	c0dec1f4 <__aeabi_memclr>
c0de40ba:	7928      	ldrb	r0, [r5, #4]
c0de40bc:	7238      	strb	r0, [r7, #8]
c0de40be:	7868      	ldrb	r0, [r5, #1]
c0de40c0:	78a9      	ldrb	r1, [r5, #2]
c0de40c2:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de40c6:	3802      	subs	r0, #2
c0de40c8:	0401      	lsls	r1, r0, #16
c0de40ca:	d005      	beq.n	c0de40d8 <io_process_itc_ux_event+0x4c>
c0de40cc:	b282      	uxth	r2, r0
c0de40ce:	2a10      	cmp	r2, #16
c0de40d0:	d802      	bhi.n	c0de40d8 <io_process_itc_ux_event+0x4c>
c0de40d2:	1f60      	subs	r0, r4, #5
c0de40d4:	4290      	cmp	r0, r2
c0de40d6:	d218      	bcs.n	c0de410a <io_process_itc_ux_event+0x7e>
c0de40d8:	f06f 0415 	mvn.w	r4, #21
c0de40dc:	e013      	b.n	c0de4106 <io_process_itc_ux_event+0x7a>
c0de40de:	2001      	movs	r0, #1
c0de40e0:	f007 fc62 	bl	c0deb9a8 <nbgl_objAllowDrawing>
c0de40e4:	f007 fc6f 	bl	c0deb9c6 <nbgl_screenRedraw>
c0de40e8:	f007 fc45 	bl	c0deb976 <nbgl_refresh>
c0de40ec:	e00a      	b.n	c0de4104 <io_process_itc_ux_event+0x78>
c0de40ee:	480c      	ldr	r0, [pc, #48]	@ (c0de4120 <io_process_itc_ux_event+0x94>)
c0de40f0:	2107      	movs	r1, #7
c0de40f2:	f809 1000 	strb.w	r1, [r9, r0]
c0de40f6:	4448      	add	r0, r9
c0de40f8:	2101      	movs	r1, #1
c0de40fa:	6041      	str	r1, [r0, #4]
c0de40fc:	7929      	ldrb	r1, [r5, #4]
c0de40fe:	7201      	strb	r1, [r0, #8]
c0de4100:	f007 feda 	bl	c0debeb8 <os_ux>
c0de4104:	2400      	movs	r4, #0
c0de4106:	4620      	mov	r0, r4
c0de4108:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de410a:	eb09 0406 	add.w	r4, r9, r6
c0de410e:	1d69      	adds	r1, r5, #5
c0de4110:	f104 0010 	add.w	r0, r4, #16
c0de4114:	60e2      	str	r2, [r4, #12]
c0de4116:	f008 f863 	bl	c0dec1e0 <__aeabi_memcpy>
c0de411a:	4620      	mov	r0, r4
c0de411c:	e7f0      	b.n	c0de4100 <io_process_itc_ux_event+0x74>
c0de411e:	bf00      	nop
c0de4120:	00001dc4 	.word	0x00001dc4

c0de4124 <io_legacy_apdu_tx>:
c0de4124:	b5b0      	push	{r4, r5, r7, lr}
c0de4126:	460a      	mov	r2, r1
c0de4128:	4601      	mov	r1, r0
c0de412a:	4808      	ldr	r0, [pc, #32]	@ (c0de414c <io_legacy_apdu_tx+0x28>)
c0de412c:	2300      	movs	r3, #0
c0de412e:	2500      	movs	r5, #0
c0de4130:	eb09 0400 	add.w	r4, r9, r0
c0de4134:	7860      	ldrb	r0, [r4, #1]
c0de4136:	f007 ff07 	bl	c0debf48 <os_io_tx_cmd>
c0de413a:	4905      	ldr	r1, [pc, #20]	@ (c0de4150 <io_legacy_apdu_tx+0x2c>)
c0de413c:	7065      	strb	r5, [r4, #1]
c0de413e:	f809 5001 	strb.w	r5, [r9, r1]
c0de4142:	4904      	ldr	r1, [pc, #16]	@ (c0de4154 <io_legacy_apdu_tx+0x30>)
c0de4144:	4449      	add	r1, r9
c0de4146:	718d      	strb	r5, [r1, #6]
c0de4148:	bdb0      	pop	{r4, r5, r7, pc}
c0de414a:	bf00      	nop
c0de414c:	000016e8 	.word	0x000016e8
c0de4150:	00001de4 	.word	0x00001de4
c0de4154:	000016dc 	.word	0x000016dc

c0de4158 <io_legacy_apdu_rx>:
c0de4158:	e92d 41ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
c0de415c:	4e8c      	ldr	r6, [pc, #560]	@ (c0de4390 <io_legacy_apdu_rx+0x238>)
c0de415e:	2100      	movs	r1, #0
c0de4160:	4605      	mov	r5, r0
c0de4162:	2200      	movs	r2, #0
c0de4164:	2301      	movs	r3, #1
c0de4166:	f88d 100f 	strb.w	r1, [sp, #15]
c0de416a:	f240 1111 	movw	r1, #273	@ 0x111
c0de416e:	eb09 0006 	add.w	r0, r9, r6
c0de4172:	f007 fef5 	bl	c0debf60 <os_io_rx_evt>
c0de4176:	4604      	mov	r4, r0
c0de4178:	2801      	cmp	r0, #1
c0de417a:	f2c0 80f9 	blt.w	c0de4370 <io_legacy_apdu_rx+0x218>
c0de417e:	f819 0006 	ldrb.w	r0, [r9, r6]
c0de4182:	f1a0 0110 	sub.w	r1, r0, #16
c0de4186:	2916      	cmp	r1, #22
c0de4188:	d805      	bhi.n	c0de4196 <io_legacy_apdu_rx+0x3e>
c0de418a:	2201      	movs	r2, #1
c0de418c:	fa02 f101 	lsl.w	r1, r2, r1
c0de4190:	4a80      	ldr	r2, [pc, #512]	@ (c0de4394 <io_legacy_apdu_rx+0x23c>)
c0de4192:	4211      	tst	r1, r2
c0de4194:	d107      	bne.n	c0de41a6 <io_legacy_apdu_rx+0x4e>
c0de4196:	1e41      	subs	r1, r0, #1
c0de4198:	2902      	cmp	r1, #2
c0de419a:	d379      	bcc.n	c0de4290 <io_legacy_apdu_rx+0x138>
c0de419c:	2830      	cmp	r0, #48	@ 0x30
c0de419e:	bf18      	it	ne
c0de41a0:	2840      	cmpne	r0, #64	@ 0x40
c0de41a2:	f040 8089 	bne.w	c0de42b8 <io_legacy_apdu_rx+0x160>
c0de41a6:	4f7c      	ldr	r7, [pc, #496]	@ (c0de4398 <io_legacy_apdu_rx+0x240>)
c0de41a8:	eb09 0107 	add.w	r1, r9, r7
c0de41ac:	7048      	strb	r0, [r1, #1]
c0de41ae:	f007 fe71 	bl	c0debe94 <os_perso_is_pin_set>
c0de41b2:	28aa      	cmp	r0, #170	@ 0xaa
c0de41b4:	d103      	bne.n	c0de41be <io_legacy_apdu_rx+0x66>
c0de41b6:	f007 fe76 	bl	c0debea6 <os_global_pin_is_validated>
c0de41ba:	28aa      	cmp	r0, #170	@ 0xaa
c0de41bc:	d156      	bne.n	c0de426c <io_legacy_apdu_rx+0x114>
c0de41be:	eb09 0006 	add.w	r0, r9, r6
c0de41c2:	7840      	ldrb	r0, [r0, #1]
c0de41c4:	28b0      	cmp	r0, #176	@ 0xb0
c0de41c6:	d12d      	bne.n	c0de4224 <io_legacy_apdu_rx+0xcc>
c0de41c8:	f240 1011 	movw	r0, #273	@ 0x111
c0de41cc:	1e61      	subs	r1, r4, #1
c0de41ce:	9002      	str	r0, [sp, #8]
c0de41d0:	f10d 000f 	add.w	r0, sp, #15
c0de41d4:	9000      	str	r0, [sp, #0]
c0de41d6:	4871      	ldr	r0, [pc, #452]	@ (c0de439c <io_legacy_apdu_rx+0x244>)
c0de41d8:	ab02      	add	r3, sp, #8
c0de41da:	eb09 0500 	add.w	r5, r9, r0
c0de41de:	eb09 0006 	add.w	r0, r9, r6
c0de41e2:	3001      	adds	r0, #1
c0de41e4:	462a      	mov	r2, r5
c0de41e6:	f7ff feb1 	bl	c0de3f4c <os_io_handle_default_apdu>
c0de41ea:	2400      	movs	r4, #0
c0de41ec:	9902      	ldr	r1, [sp, #8]
c0de41ee:	eb09 0607 	add.w	r6, r9, r7
c0de41f2:	f5b0 4f10 	cmp.w	r0, #36864	@ 0x9000
c0de41f6:	bf18      	it	ne
c0de41f8:	4621      	movne	r1, r4
c0de41fa:	0a02      	lsrs	r2, r0, #8
c0de41fc:	2300      	movs	r3, #0
c0de41fe:	546a      	strb	r2, [r5, r1]
c0de4200:	186a      	adds	r2, r5, r1
c0de4202:	7050      	strb	r0, [r2, #1]
c0de4204:	1c88      	adds	r0, r1, #2
c0de4206:	4629      	mov	r1, r5
c0de4208:	9002      	str	r0, [sp, #8]
c0de420a:	b282      	uxth	r2, r0
c0de420c:	7870      	ldrb	r0, [r6, #1]
c0de420e:	f007 fe9b 	bl	c0debf48 <os_io_tx_cmd>
c0de4212:	f89d 100f 	ldrb.w	r1, [sp, #15]
c0de4216:	7074      	strb	r4, [r6, #1]
c0de4218:	2901      	cmp	r1, #1
c0de421a:	f000 80b5 	beq.w	c0de4388 <io_legacy_apdu_rx+0x230>
c0de421e:	ea00 74e0 	and.w	r4, r0, r0, asr #31
c0de4222:	e0a5      	b.n	c0de4370 <io_legacy_apdu_rx+0x218>
c0de4224:	eb09 0007 	add.w	r0, r9, r7
c0de4228:	7847      	ldrb	r7, [r0, #1]
c0de422a:	2f10      	cmp	r7, #16
c0de422c:	d05f      	beq.n	c0de42ee <io_legacy_apdu_rx+0x196>
c0de422e:	2f40      	cmp	r7, #64	@ 0x40
c0de4230:	d05f      	beq.n	c0de42f2 <io_legacy_apdu_rx+0x19a>
c0de4232:	2f21      	cmp	r7, #33	@ 0x21
c0de4234:	d06f      	beq.n	c0de4316 <io_legacy_apdu_rx+0x1be>
c0de4236:	2f22      	cmp	r7, #34	@ 0x22
c0de4238:	d048      	beq.n	c0de42cc <io_legacy_apdu_rx+0x174>
c0de423a:	2f23      	cmp	r7, #35	@ 0x23
c0de423c:	d048      	beq.n	c0de42d0 <io_legacy_apdu_rx+0x178>
c0de423e:	2f30      	cmp	r7, #48	@ 0x30
c0de4240:	d053      	beq.n	c0de42ea <io_legacy_apdu_rx+0x192>
c0de4242:	2f20      	cmp	r7, #32
c0de4244:	d171      	bne.n	c0de432a <io_legacy_apdu_rx+0x1d2>
c0de4246:	4d56      	ldr	r5, [pc, #344]	@ (c0de43a0 <io_legacy_apdu_rx+0x248>)
c0de4248:	2701      	movs	r7, #1
c0de424a:	eb09 0106 	add.w	r1, r9, r6
c0de424e:	3c01      	subs	r4, #1
c0de4250:	3101      	adds	r1, #1
c0de4252:	4622      	mov	r2, r4
c0de4254:	eb09 0005 	add.w	r0, r9, r5
c0de4258:	7187      	strb	r7, [r0, #6]
c0de425a:	4850      	ldr	r0, [pc, #320]	@ (c0de439c <io_legacy_apdu_rx+0x244>)
c0de425c:	4448      	add	r0, r9
c0de425e:	f007 ffbf 	bl	c0dec1e0 <__aeabi_memcpy>
c0de4262:	4850      	ldr	r0, [pc, #320]	@ (c0de43a4 <io_legacy_apdu_rx+0x24c>)
c0de4264:	f809 7000 	strb.w	r7, [r9, r0]
c0de4268:	2008      	movs	r0, #8
c0de426a:	e051      	b.n	c0de4310 <io_legacy_apdu_rx+0x1b8>
c0de426c:	484b      	ldr	r0, [pc, #300]	@ (c0de439c <io_legacy_apdu_rx+0x244>)
c0de426e:	2155      	movs	r1, #85	@ 0x55
c0de4270:	2202      	movs	r2, #2
c0de4272:	2300      	movs	r3, #0
c0de4274:	f809 1000 	strb.w	r1, [r9, r0]
c0de4278:	eb09 0100 	add.w	r1, r9, r0
c0de427c:	2015      	movs	r0, #21
c0de427e:	7048      	strb	r0, [r1, #1]
c0de4280:	eb09 0007 	add.w	r0, r9, r7
c0de4284:	7840      	ldrb	r0, [r0, #1]
c0de4286:	b004      	add	sp, #16
c0de4288:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de428c:	f007 be5c 	b.w	c0debf48 <os_io_tx_cmd>
c0de4290:	4f45      	ldr	r7, [pc, #276]	@ (c0de43a8 <io_legacy_apdu_rx+0x250>)
c0de4292:	444e      	add	r6, r9
c0de4294:	3c01      	subs	r4, #1
c0de4296:	1c71      	adds	r1, r6, #1
c0de4298:	4622      	mov	r2, r4
c0de429a:	eb09 0007 	add.w	r0, r9, r7
c0de429e:	f007 ff9f 	bl	c0dec1e0 <__aeabi_memcpy>
c0de42a2:	7870      	ldrb	r0, [r6, #1]
c0de42a4:	281a      	cmp	r0, #26
c0de42a6:	d10a      	bne.n	c0de42be <io_legacy_apdu_rx+0x166>
c0de42a8:	eb09 0007 	add.w	r0, r9, r7
c0de42ac:	4621      	mov	r1, r4
c0de42ae:	b004      	add	sp, #16
c0de42b0:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de42b4:	f7ff beea 	b.w	c0de408c <io_process_itc_ux_event>
c0de42b8:	2842      	cmp	r0, #66	@ 0x42
c0de42ba:	d158      	bne.n	c0de436e <io_legacy_apdu_rx+0x216>
c0de42bc:	e058      	b.n	c0de4370 <io_legacy_apdu_rx+0x218>
c0de42be:	2d00      	cmp	r5, #0
c0de42c0:	d04b      	beq.n	c0de435a <io_legacy_apdu_rx+0x202>
c0de42c2:	2000      	movs	r0, #0
c0de42c4:	2400      	movs	r4, #0
c0de42c6:	f007 f929 	bl	c0deb51c <io_event>
c0de42ca:	e051      	b.n	c0de4370 <io_legacy_apdu_rx+0x218>
c0de42cc:	2004      	movs	r0, #4
c0de42ce:	e023      	b.n	c0de4318 <io_legacy_apdu_rx+0x1c0>
c0de42d0:	4d33      	ldr	r5, [pc, #204]	@ (c0de43a0 <io_legacy_apdu_rx+0x248>)
c0de42d2:	2107      	movs	r1, #7
c0de42d4:	3c01      	subs	r4, #1
c0de42d6:	4622      	mov	r2, r4
c0de42d8:	eb09 0005 	add.w	r0, r9, r5
c0de42dc:	7181      	strb	r1, [r0, #6]
c0de42de:	482f      	ldr	r0, [pc, #188]	@ (c0de439c <io_legacy_apdu_rx+0x244>)
c0de42e0:	f000 f886 	bl	c0de43f0 <OUTLINED_FUNCTION_0>
c0de42e4:	482f      	ldr	r0, [pc, #188]	@ (c0de43a4 <io_legacy_apdu_rx+0x24c>)
c0de42e6:	2101      	movs	r1, #1
c0de42e8:	e00f      	b.n	c0de430a <io_legacy_apdu_rx+0x1b2>
c0de42ea:	2002      	movs	r0, #2
c0de42ec:	e014      	b.n	c0de4318 <io_legacy_apdu_rx+0x1c0>
c0de42ee:	2006      	movs	r0, #6
c0de42f0:	e012      	b.n	c0de4318 <io_legacy_apdu_rx+0x1c0>
c0de42f2:	4d2b      	ldr	r5, [pc, #172]	@ (c0de43a0 <io_legacy_apdu_rx+0x248>)
c0de42f4:	2103      	movs	r1, #3
c0de42f6:	3c01      	subs	r4, #1
c0de42f8:	4622      	mov	r2, r4
c0de42fa:	eb09 0005 	add.w	r0, r9, r5
c0de42fe:	7181      	strb	r1, [r0, #6]
c0de4300:	4826      	ldr	r0, [pc, #152]	@ (c0de439c <io_legacy_apdu_rx+0x244>)
c0de4302:	f000 f875 	bl	c0de43f0 <OUTLINED_FUNCTION_0>
c0de4306:	4827      	ldr	r0, [pc, #156]	@ (c0de43a4 <io_legacy_apdu_rx+0x24c>)
c0de4308:	2102      	movs	r1, #2
c0de430a:	f809 1000 	strb.w	r1, [r9, r0]
c0de430e:	200a      	movs	r0, #10
c0de4310:	f809 0005 	strb.w	r0, [r9, r5]
c0de4314:	e02c      	b.n	c0de4370 <io_legacy_apdu_rx+0x218>
c0de4316:	2005      	movs	r0, #5
c0de4318:	4921      	ldr	r1, [pc, #132]	@ (c0de43a0 <io_legacy_apdu_rx+0x248>)
c0de431a:	3c01      	subs	r4, #1
c0de431c:	4622      	mov	r2, r4
c0de431e:	4449      	add	r1, r9
c0de4320:	7188      	strb	r0, [r1, #6]
c0de4322:	481e      	ldr	r0, [pc, #120]	@ (c0de439c <io_legacy_apdu_rx+0x244>)
c0de4324:	f000 f864 	bl	c0de43f0 <OUTLINED_FUNCTION_0>
c0de4328:	e022      	b.n	c0de4370 <io_legacy_apdu_rx+0x218>
c0de432a:	f8df 8074 	ldr.w	r8, [pc, #116]	@ c0de43a0 <io_legacy_apdu_rx+0x248>
c0de432e:	2100      	movs	r1, #0
c0de4330:	1e65      	subs	r5, r4, #1
c0de4332:	462a      	mov	r2, r5
c0de4334:	eb09 0008 	add.w	r0, r9, r8
c0de4338:	7181      	strb	r1, [r0, #6]
c0de433a:	4818      	ldr	r0, [pc, #96]	@ (c0de439c <io_legacy_apdu_rx+0x244>)
c0de433c:	f000 f858 	bl	c0de43f0 <OUTLINED_FUNCTION_0>
c0de4340:	2f25      	cmp	r7, #37	@ 0x25
c0de4342:	d019      	beq.n	c0de4378 <io_legacy_apdu_rx+0x220>
c0de4344:	2f24      	cmp	r7, #36	@ 0x24
c0de4346:	d106      	bne.n	c0de4356 <io_legacy_apdu_rx+0x1fe>
c0de4348:	200b      	movs	r0, #11
c0de434a:	2101      	movs	r1, #1
c0de434c:	f809 0008 	strb.w	r0, [r9, r8]
c0de4350:	4814      	ldr	r0, [pc, #80]	@ (c0de43a4 <io_legacy_apdu_rx+0x24c>)
c0de4352:	f809 1000 	strb.w	r1, [r9, r0]
c0de4356:	462c      	mov	r4, r5
c0de4358:	e00a      	b.n	c0de4370 <io_legacy_apdu_rx+0x218>
c0de435a:	f819 0007 	ldrb.w	r0, [r9, r7]
c0de435e:	2815      	cmp	r0, #21
c0de4360:	d8af      	bhi.n	c0de42c2 <io_legacy_apdu_rx+0x16a>
c0de4362:	2101      	movs	r1, #1
c0de4364:	fa01 f000 	lsl.w	r0, r1, r0
c0de4368:	4910      	ldr	r1, [pc, #64]	@ (c0de43ac <io_legacy_apdu_rx+0x254>)
c0de436a:	4208      	tst	r0, r1
c0de436c:	d0a9      	beq.n	c0de42c2 <io_legacy_apdu_rx+0x16a>
c0de436e:	2400      	movs	r4, #0
c0de4370:	4620      	mov	r0, r4
c0de4372:	b004      	add	sp, #16
c0de4374:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de4378:	200c      	movs	r0, #12
c0de437a:	2101      	movs	r1, #1
c0de437c:	f809 0008 	strb.w	r0, [r9, r8]
c0de4380:	4808      	ldr	r0, [pc, #32]	@ (c0de43a4 <io_legacy_apdu_rx+0x24c>)
c0de4382:	f809 1000 	strb.w	r1, [r9, r0]
c0de4386:	e7f3      	b.n	c0de4370 <io_legacy_apdu_rx+0x218>
c0de4388:	20ff      	movs	r0, #255	@ 0xff
c0de438a:	f007 fdbf 	bl	c0debf0c <os_sched_exit>
c0de438e:	bf00      	nop
c0de4390:	000015c8 	.word	0x000015c8
c0de4394:	007f0001 	.word	0x007f0001
c0de4398:	000016e8 	.word	0x000016e8
c0de439c:	000014b7 	.word	0x000014b7
c0de43a0:	000016dc 	.word	0x000016dc
c0de43a4:	00001de4 	.word	0x00001de4
c0de43a8:	00001cb0 	.word	0x00001cb0
c0de43ac:	00205020 	.word	0x00205020

c0de43b0 <io_seproxyhal_init>:
c0de43b0:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de43b2:	b089      	sub	sp, #36	@ 0x24
c0de43b4:	4d0c      	ldr	r5, [pc, #48]	@ (c0de43e8 <io_seproxyhal_init+0x38>)
c0de43b6:	2600      	movs	r6, #0
c0de43b8:	466c      	mov	r4, sp
c0de43ba:	2118      	movs	r1, #24
c0de43bc:	eb09 0005 	add.w	r0, r9, r5
c0de43c0:	7046      	strb	r6, [r0, #1]
c0de43c2:	4620      	mov	r0, r4
c0de43c4:	f007 ff16 	bl	c0dec1f4 <__aeabi_memclr>
c0de43c8:	4808      	ldr	r0, [pc, #32]	@ (c0de43ec <io_seproxyhal_init+0x3c>)
c0de43ca:	2701      	movs	r7, #1
c0de43cc:	f88d 601e 	strb.w	r6, [sp, #30]
c0de43d0:	f8ad 7020 	strh.w	r7, [sp, #32]
c0de43d4:	f8ad 701c 	strh.w	r7, [sp, #28]
c0de43d8:	9006      	str	r0, [sp, #24]
c0de43da:	4620      	mov	r0, r4
c0de43dc:	f007 fda0 	bl	c0debf20 <os_io_init>
c0de43e0:	f809 7005 	strb.w	r7, [r9, r5]
c0de43e4:	b009      	add	sp, #36	@ 0x24
c0de43e6:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de43e8:	000016e8 	.word	0x000016e8
c0de43ec:	00020015 	.word	0x00020015

c0de43f0 <OUTLINED_FUNCTION_0>:
c0de43f0:	eb09 0106 	add.w	r1, r9, r6
c0de43f4:	3101      	adds	r1, #1
c0de43f6:	4448      	add	r0, r9
c0de43f8:	f007 bef2 	b.w	c0dec1e0 <__aeabi_memcpy>

c0de43fc <layoutAddCallbackObj>:
c0de43fc:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de43fe:	f890 40ad 	ldrb.w	r4, [r0, #173]	@ 0xad
c0de4402:	f890 50ae 	ldrb.w	r5, [r0, #174]	@ 0xae
c0de4406:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de440a:	f3c4 2505 	ubfx	r5, r4, #8, #6
c0de440e:	2d0e      	cmp	r5, #14
c0de4410:	bf84      	itt	hi
c0de4412:	2000      	movhi	r0, #0
c0de4414:	bdf0      	pophi	{r4, r5, r6, r7, pc}
c0de4416:	0a26      	lsrs	r6, r4, #8
c0de4418:	f404 4740 	and.w	r7, r4, #49152	@ 0xc000
c0de441c:	f880 40ad 	strb.w	r4, [r0, #173]	@ 0xad
c0de4420:	3601      	adds	r6, #1
c0de4422:	f006 063f 	and.w	r6, r6, #63	@ 0x3f
c0de4426:	ea47 2606 	orr.w	r6, r7, r6, lsl #8
c0de442a:	0a36      	lsrs	r6, r6, #8
c0de442c:	f880 60ae 	strb.w	r6, [r0, #174]	@ 0xae
c0de4430:	eb00 00c5 	add.w	r0, r0, r5, lsl #3
c0de4434:	f840 1f20 	str.w	r1, [r0, #32]!
c0de4438:	7102      	strb	r2, [r0, #4]
c0de443a:	7183      	strb	r3, [r0, #6]
c0de443c:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

c0de4440 <nbgl_layoutGet>:
c0de4440:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de4444:	b085      	sub	sp, #20
c0de4446:	4605      	mov	r5, r0
c0de4448:	7800      	ldrb	r0, [r0, #0]
c0de444a:	b190      	cbz	r0, c0de4472 <nbgl_layoutGet+0x32>
c0de444c:	486c      	ldr	r0, [pc, #432]	@ (c0de4600 <nbgl_layoutGet+0x1c0>)
c0de444e:	496d      	ldr	r1, [pc, #436]	@ (c0de4604 <nbgl_layoutGet+0x1c4>)
c0de4450:	2400      	movs	r4, #0
c0de4452:	b158      	cbz	r0, c0de446c <nbgl_layoutGet+0x2c>
c0de4454:	eb09 0201 	add.w	r2, r9, r1
c0de4458:	4402      	add	r2, r0
c0de445a:	f892 32ca 	ldrb.w	r3, [r2, #714]	@ 0x2ca
c0de445e:	021b      	lsls	r3, r3, #8
c0de4460:	045b      	lsls	r3, r3, #17
c0de4462:	bf58      	it	pl
c0de4464:	f502 7407 	addpl.w	r4, r2, #540	@ 0x21c
c0de4468:	30b4      	adds	r0, #180	@ 0xb4
c0de446a:	e7f2      	b.n	c0de4452 <nbgl_layoutGet+0x12>
c0de446c:	b974      	cbnz	r4, c0de448c <nbgl_layoutGet+0x4c>
c0de446e:	2400      	movs	r4, #0
c0de4470:	e0c2      	b.n	c0de45f8 <nbgl_layoutGet+0x1b8>
c0de4472:	4965      	ldr	r1, [pc, #404]	@ (c0de4608 <nbgl_layoutGet+0x1c8>)
c0de4474:	4863      	ldr	r0, [pc, #396]	@ (c0de4604 <nbgl_layoutGet+0x1c4>)
c0de4476:	eb09 0201 	add.w	r2, r9, r1
c0de447a:	6852      	ldr	r2, [r2, #4]
c0de447c:	b112      	cbz	r2, c0de4484 <nbgl_layoutGet+0x44>
c0de447e:	eb09 0400 	add.w	r4, r9, r0
c0de4482:	e003      	b.n	c0de448c <nbgl_layoutGet+0x4c>
c0de4484:	eb09 0400 	add.w	r4, r9, r0
c0de4488:	4449      	add	r1, r9
c0de448a:	604c      	str	r4, [r1, #4]
c0de448c:	4e5d      	ldr	r6, [pc, #372]	@ (c0de4604 <nbgl_layoutGet+0x1c4>)
c0de448e:	4620      	mov	r0, r4
c0de4490:	21b4      	movs	r1, #180	@ 0xb4
c0de4492:	f859 7006 	ldr.w	r7, [r9, r6]
c0de4496:	f007 fead 	bl	c0dec1f4 <__aeabi_memclr>
c0de449a:	7828      	ldrb	r0, [r5, #0]
c0de449c:	b150      	cbz	r0, c0de44b4 <nbgl_layoutGet+0x74>
c0de449e:	485a      	ldr	r0, [pc, #360]	@ (c0de4608 <nbgl_layoutGet+0x1c8>)
c0de44a0:	4448      	add	r0, r9
c0de44a2:	6841      	ldr	r1, [r0, #4]
c0de44a4:	2900      	cmp	r1, #0
c0de44a6:	bf08      	it	eq
c0de44a8:	eb09 0106 	addeq.w	r1, r9, r6
c0de44ac:	600c      	str	r4, [r1, #0]
c0de44ae:	6061      	str	r1, [r4, #4]
c0de44b0:	6044      	str	r4, [r0, #4]
c0de44b2:	e001      	b.n	c0de44b8 <nbgl_layoutGet+0x78>
c0de44b4:	f849 7006 	str.w	r7, [r9, r6]
c0de44b8:	4853      	ldr	r0, [pc, #332]	@ (c0de4608 <nbgl_layoutGet+0x1c8>)
c0de44ba:	2100      	movs	r1, #0
c0de44bc:	f809 1000 	strb.w	r1, [r9, r0]
c0de44c0:	68e8      	ldr	r0, [r5, #12]
c0de44c2:	f007 fc75 	bl	c0debdb0 <pic>
c0de44c6:	4621      	mov	r1, r4
c0de44c8:	782e      	ldrb	r6, [r5, #0]
c0de44ca:	f811 2fad 	ldrb.w	r2, [r1, #173]!
c0de44ce:	784b      	ldrb	r3, [r1, #1]
c0de44d0:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de44d4:	f022 0201 	bic.w	r2, r2, #1
c0de44d8:	4332      	orrs	r2, r6
c0de44da:	700a      	strb	r2, [r1, #0]
c0de44dc:	f002 02fd 	and.w	r2, r2, #253	@ 0xfd
c0de44e0:	786e      	ldrb	r6, [r5, #1]
c0de44e2:	f841 0c91 	str.w	r0, [r1, #-145]
c0de44e6:	704b      	strb	r3, [r1, #1]
c0de44e8:	f1a1 00a5 	sub.w	r0, r1, #165	@ 0xa5
c0de44ec:	ea42 0246 	orr.w	r2, r2, r6, lsl #1
c0de44f0:	700a      	strb	r2, [r1, #0]
c0de44f2:	f105 0210 	add.w	r2, r5, #16
c0de44f6:	7829      	ldrb	r1, [r5, #0]
c0de44f8:	4b44      	ldr	r3, [pc, #272]	@ (c0de460c <nbgl_layoutGet+0x1cc>)
c0de44fa:	447b      	add	r3, pc
c0de44fc:	b159      	cbz	r1, c0de4516 <nbgl_layoutGet+0xd6>
c0de44fe:	2106      	movs	r1, #6
c0de4500:	f007 fa5c 	bl	c0deb9bc <nbgl_screenPush>
c0de4504:	f894 10ad 	ldrb.w	r1, [r4, #173]	@ 0xad
c0de4508:	f894 20ae 	ldrb.w	r2, [r4, #174]	@ 0xae
c0de450c:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de4510:	f360 01c7 	bfi	r1, r0, #3, #5
c0de4514:	e00a      	b.n	c0de452c <nbgl_layoutGet+0xec>
c0de4516:	2106      	movs	r1, #6
c0de4518:	f007 fa4b 	bl	c0deb9b2 <nbgl_screenSet>
c0de451c:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4520:	f894 10ae 	ldrb.w	r1, [r4, #174]	@ 0xae
c0de4524:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de4528:	f020 01f8 	bic.w	r1, r0, #248	@ 0xf8
c0de452c:	4627      	mov	r7, r4
c0de452e:	0a08      	lsrs	r0, r1, #8
c0de4530:	f04f 0a01 	mov.w	sl, #1
c0de4534:	f807 1fad 	strb.w	r1, [r7, #173]!
c0de4538:	7078      	strb	r0, [r7, #1]
c0de453a:	b2c8      	uxtb	r0, r1
c0de453c:	f003 f9f0 	bl	c0de7920 <OUTLINED_FUNCTION_19>
c0de4540:	2102      	movs	r1, #2
c0de4542:	f04f 0800 	mov.w	r8, #0
c0de4546:	f880 a005 	strb.w	sl, [r0, #5]
c0de454a:	71c1      	strb	r1, [r0, #7]
c0de454c:	2158      	movs	r1, #88	@ 0x58
c0de454e:	f880 801f 	strb.w	r8, [r0, #31]
c0de4552:	7181      	strb	r1, [r0, #6]
c0de4554:	21e0      	movs	r1, #224	@ 0xe0
c0de4556:	7101      	strb	r1, [r0, #4]
c0de4558:	f847 0c0d 	str.w	r0, [r7, #-13]
c0de455c:	7838      	ldrb	r0, [r7, #0]
c0de455e:	08c1      	lsrs	r1, r0, #3
c0de4560:	2014      	movs	r0, #20
c0de4562:	f007 fa49 	bl	c0deb9f8 <nbgl_containerPoolGet>
c0de4566:	f857 2c0d 	ldr.w	r2, [r7, #-13]
c0de456a:	0a03      	lsrs	r3, r0, #8
c0de456c:	f857 1ca5 	ldr.w	r1, [r7, #-165]
c0de4570:	0e06      	lsrs	r6, r0, #24
c0de4572:	f882 3023 	strb.w	r3, [r2, #35]	@ 0x23
c0de4576:	4613      	mov	r3, r2
c0de4578:	f882 a016 	strb.w	sl, [r2, #22]
c0de457c:	f803 0f22 	strb.w	r0, [r3, #34]!
c0de4580:	0c00      	lsrs	r0, r0, #16
c0de4582:	70de      	strb	r6, [r3, #3]
c0de4584:	7098      	strb	r0, [r3, #2]
c0de4586:	604a      	str	r2, [r1, #4]
c0de4588:	7878      	ldrb	r0, [r7, #1]
c0de458a:	f040 0040 	orr.w	r0, r0, #64	@ 0x40
c0de458e:	7078      	strb	r0, [r7, #1]
c0de4590:	6868      	ldr	r0, [r5, #4]
c0de4592:	b388      	cbz	r0, c0de45f8 <nbgl_layoutGet+0x1b8>
c0de4594:	f007 fc0c 	bl	c0debdb0 <pic>
c0de4598:	4621      	mov	r1, r4
c0de459a:	f44f 4640 	mov.w	r6, #49152	@ 0xc000
c0de459e:	f811 2fad 	ldrb.w	r2, [r1, #173]!
c0de45a2:	784b      	ldrb	r3, [r1, #1]
c0de45a4:	700a      	strb	r2, [r1, #0]
c0de45a6:	1c5f      	adds	r7, r3, #1
c0de45a8:	ea06 2603 	and.w	r6, r6, r3, lsl #8
c0de45ac:	f003 023f 	and.w	r2, r3, #63	@ 0x3f
c0de45b0:	f007 073f 	and.w	r7, r7, #63	@ 0x3f
c0de45b4:	ea46 2607 	orr.w	r6, r6, r7, lsl #8
c0de45b8:	eb04 07c2 	add.w	r7, r4, r2, lsl #3
c0de45bc:	0a36      	lsrs	r6, r6, #8
c0de45be:	704e      	strb	r6, [r1, #1]
c0de45c0:	f8d4 60a0 	ldr.w	r6, [r4, #160]	@ 0xa0
c0de45c4:	2104      	movs	r1, #4
c0de45c6:	77b1      	strb	r1, [r6, #30]
c0de45c8:	7a2a      	ldrb	r2, [r5, #8]
c0de45ca:	7a6b      	ldrb	r3, [r5, #9]
c0de45cc:	623e      	str	r6, [r7, #32]
c0de45ce:	f887 3026 	strb.w	r3, [r7, #38]	@ 0x26
c0de45d2:	f886 a01c 	strb.w	sl, [r6, #28]
c0de45d6:	f886 801d 	strb.w	r8, [r6, #29]
c0de45da:	f887 2024 	strb.w	r2, [r7, #36]	@ 0x24
c0de45de:	7805      	ldrb	r5, [r0, #0]
c0de45e0:	b155      	cbz	r5, c0de45f8 <nbgl_layoutGet+0x1b8>
c0de45e2:	9001      	str	r0, [sp, #4]
c0de45e4:	f88d 1000 	strb.w	r1, [sp]
c0de45e8:	4669      	mov	r1, sp
c0de45ea:	4620      	mov	r0, r4
c0de45ec:	f88d 3009 	strb.w	r3, [sp, #9]
c0de45f0:	f88d 2008 	strb.w	r2, [sp, #8]
c0de45f4:	f000 f992 	bl	c0de491c <nbgl_layoutAddUpFooter>
c0de45f8:	4620      	mov	r0, r4
c0de45fa:	b005      	add	sp, #20
c0de45fc:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de4600:	fffffe98 	.word	0xfffffe98
c0de4604:	000016ec 	.word	0x000016ec
c0de4608:	00001908 	.word	0x00001908
c0de460c:	00000113 	.word	0x00000113

c0de4610 <touchCallback>:
c0de4610:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de4614:	2800      	cmp	r0, #0
c0de4616:	f000 817e 	beq.w	c0de4916 <touchCallback+0x306>
c0de461a:	460d      	mov	r5, r1
c0de461c:	a901      	add	r1, sp, #4
c0de461e:	466a      	mov	r2, sp
c0de4620:	4604      	mov	r4, r0
c0de4622:	f002 ffcd 	bl	c0de75c0 <getLayoutAndLayoutObj>
c0de4626:	b968      	cbnz	r0, c0de4644 <touchCallback+0x34>
c0de4628:	4620      	mov	r0, r4
c0de462a:	f810 1f0e 	ldrb.w	r1, [r0, #14]!
c0de462e:	f003 f997 	bl	c0de7960 <OUTLINED_FUNCTION_23>
c0de4632:	466a      	mov	r2, sp
c0de4634:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de4638:	a901      	add	r1, sp, #4
c0de463a:	f002 ffc1 	bl	c0de75c0 <getLayoutAndLayoutObj>
c0de463e:	2800      	cmp	r0, #0
c0de4640:	f000 8169 	beq.w	c0de4916 <touchCallback+0x306>
c0de4644:	1fe8      	subs	r0, r5, #7
c0de4646:	b2c0      	uxtb	r0, r0
c0de4648:	2803      	cmp	r0, #3
c0de464a:	d833      	bhi.n	c0de46b4 <touchCallback+0xa4>
c0de464c:	7ee0      	ldrb	r0, [r4, #27]
c0de464e:	2801      	cmp	r0, #1
c0de4650:	d130      	bne.n	c0de46b4 <touchCallback+0xa4>
c0de4652:	9901      	ldr	r1, [sp, #4]
c0de4654:	4628      	mov	r0, r5
c0de4656:	f891 20b0 	ldrb.w	r2, [r1, #176]	@ 0xb0
c0de465a:	2a01      	cmp	r2, #1
c0de465c:	d028      	beq.n	c0de46b0 <touchCallback+0xa0>
c0de465e:	bb4a      	cbnz	r2, c0de46b4 <touchCallback+0xa4>
c0de4660:	f8d1 00a0 	ldr.w	r0, [r1, #160]	@ 0xa0
c0de4664:	42a0      	cmp	r0, r4
c0de4666:	d125      	bne.n	c0de46b4 <touchCallback+0xa4>
c0de4668:	f891 00ab 	ldrb.w	r0, [r1, #171]	@ 0xab
c0de466c:	2803      	cmp	r0, #3
c0de466e:	d005      	beq.n	c0de467c <touchCallback+0x6c>
c0de4670:	2804      	cmp	r0, #4
c0de4672:	f040 8150 	bne.w	c0de4916 <touchCallback+0x306>
c0de4676:	f101 0010 	add.w	r0, r1, #16
c0de467a:	e00c      	b.n	c0de4696 <touchCallback+0x86>
c0de467c:	6908      	ldr	r0, [r1, #16]
c0de467e:	f810 2f22 	ldrb.w	r2, [r0, #34]!
c0de4682:	7843      	ldrb	r3, [r0, #1]
c0de4684:	7886      	ldrb	r6, [r0, #2]
c0de4686:	78c0      	ldrb	r0, [r0, #3]
c0de4688:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de468c:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de4690:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de4694:	3004      	adds	r0, #4
c0de4696:	f101 06a9 	add.w	r6, r1, #169	@ 0xa9
c0de469a:	f891 20a8 	ldrb.w	r2, [r1, #168]	@ 0xa8
c0de469e:	6800      	ldr	r0, [r0, #0]
c0de46a0:	4629      	mov	r1, r5
c0de46a2:	4633      	mov	r3, r6
c0de46a4:	f003 fadc 	bl	c0de7c60 <layoutNavigationCallback>
c0de46a8:	2800      	cmp	r0, #0
c0de46aa:	f000 8134 	beq.w	c0de4916 <touchCallback+0x306>
c0de46ae:	7830      	ldrb	r0, [r6, #0]
c0de46b0:	9900      	ldr	r1, [sp, #0]
c0de46b2:	7148      	strb	r0, [r1, #5]
c0de46b4:	4620      	mov	r0, r4
c0de46b6:	9f01      	ldr	r7, [sp, #4]
c0de46b8:	f810 1f0e 	ldrb.w	r1, [r0, #14]!
c0de46bc:	f003 fa1c 	bl	c0de7af8 <OUTLINED_FUNCTION_45>
c0de46c0:	6938      	ldr	r0, [r7, #16]
c0de46c2:	4281      	cmp	r1, r0
c0de46c4:	d103      	bne.n	c0de46ce <touchCallback+0xbe>
c0de46c6:	f897 20ab 	ldrb.w	r2, [r7, #171]	@ 0xab
c0de46ca:	2a04      	cmp	r2, #4
c0de46cc:	d00c      	beq.n	c0de46e8 <touchCallback+0xd8>
c0de46ce:	7eca      	ldrb	r2, [r1, #27]
c0de46d0:	2a01      	cmp	r2, #1
c0de46d2:	d118      	bne.n	c0de4706 <touchCallback+0xf6>
c0de46d4:	f811 2f0e 	ldrb.w	r2, [r1, #14]!
c0de46d8:	f003 f89e 	bl	c0de7818 <OUTLINED_FUNCTION_9>
c0de46dc:	4281      	cmp	r1, r0
c0de46de:	d112      	bne.n	c0de4706 <touchCallback+0xf6>
c0de46e0:	f897 00ab 	ldrb.w	r0, [r7, #171]	@ 0xab
c0de46e4:	2803      	cmp	r0, #3
c0de46e6:	d10e      	bne.n	c0de4706 <touchCallback+0xf6>
c0de46e8:	f107 06a9 	add.w	r6, r7, #169	@ 0xa9
c0de46ec:	f897 20a8 	ldrb.w	r2, [r7, #168]	@ 0xa8
c0de46f0:	4620      	mov	r0, r4
c0de46f2:	4629      	mov	r1, r5
c0de46f4:	4633      	mov	r3, r6
c0de46f6:	f003 fab3 	bl	c0de7c60 <layoutNavigationCallback>
c0de46fa:	2800      	cmp	r0, #0
c0de46fc:	f000 810b 	beq.w	c0de4916 <touchCallback+0x306>
c0de4700:	7830      	ldrb	r0, [r6, #0]
c0de4702:	9900      	ldr	r1, [sp, #0]
c0de4704:	7148      	strb	r0, [r1, #5]
c0de4706:	7ee0      	ldrb	r0, [r4, #27]
c0de4708:	2801      	cmp	r0, #1
c0de470a:	f040 80ac 	bne.w	c0de4866 <touchCallback+0x256>
c0de470e:	f894 0020 	ldrb.w	r0, [r4, #32]
c0de4712:	2802      	cmp	r0, #2
c0de4714:	f0c0 80a7 	bcc.w	c0de4866 <touchCallback+0x256>
c0de4718:	4621      	mov	r1, r4
c0de471a:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de471e:	f003 f87b 	bl	c0de7818 <OUTLINED_FUNCTION_9>
c0de4722:	684e      	ldr	r6, [r1, #4]
c0de4724:	b196      	cbz	r6, c0de474c <touchCallback+0x13c>
c0de4726:	7ef1      	ldrb	r1, [r6, #27]
c0de4728:	2906      	cmp	r1, #6
c0de472a:	d10f      	bne.n	c0de474c <touchCallback+0x13c>
c0de472c:	f896 0021 	ldrb.w	r0, [r6, #33]	@ 0x21
c0de4730:	3801      	subs	r0, #1
c0de4732:	bf18      	it	ne
c0de4734:	2001      	movne	r0, #1
c0de4736:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de473a:	4630      	mov	r0, r6
c0de473c:	f007 f92f 	bl	c0deb99e <nbgl_objDraw>
c0de4740:	f896 0021 	ldrb.w	r0, [r6, #33]	@ 0x21
c0de4744:	9900      	ldr	r1, [sp, #0]
c0de4746:	2401      	movs	r4, #1
c0de4748:	7148      	strb	r0, [r1, #5]
c0de474a:	e08d      	b.n	c0de4868 <touchCallback+0x258>
c0de474c:	2804      	cmp	r0, #4
c0de474e:	d064      	beq.n	c0de481a <touchCallback+0x20a>
c0de4750:	2802      	cmp	r0, #2
c0de4752:	f040 8088 	bne.w	c0de4866 <touchCallback+0x256>
c0de4756:	4620      	mov	r0, r4
c0de4758:	f003 f8d6 	bl	c0de7908 <OUTLINED_FUNCTION_18>
c0de475c:	6840      	ldr	r0, [r0, #4]
c0de475e:	2800      	cmp	r0, #0
c0de4760:	f000 8081 	beq.w	c0de4866 <touchCallback+0x256>
c0de4764:	7ec0      	ldrb	r0, [r0, #27]
c0de4766:	2809      	cmp	r0, #9
c0de4768:	d17d      	bne.n	c0de4866 <touchCallback+0x256>
c0de476a:	2d00      	cmp	r5, #0
c0de476c:	f040 80d3 	bne.w	c0de4916 <touchCallback+0x306>
c0de4770:	f04f 0aff 	mov.w	sl, #255	@ 0xff
c0de4774:	2500      	movs	r5, #0
c0de4776:	f04f 0800 	mov.w	r8, #0
c0de477a:	f897 10ae 	ldrb.w	r1, [r7, #174]	@ 0xae
c0de477e:	fa5f f088 	uxtb.w	r0, r8
c0de4782:	f001 013f 	and.w	r1, r1, #63	@ 0x3f
c0de4786:	4281      	cmp	r1, r0
c0de4788:	f240 8085 	bls.w	c0de4896 <touchCallback+0x286>
c0de478c:	eb07 00c0 	add.w	r0, r7, r0, lsl #3
c0de4790:	6a00      	ldr	r0, [r0, #32]
c0de4792:	42a0      	cmp	r0, r4
c0de4794:	d117      	bne.n	c0de47c6 <touchCallback+0x1b6>
c0de4796:	7ee1      	ldrb	r1, [r4, #27]
c0de4798:	2901      	cmp	r1, #1
c0de479a:	d114      	bne.n	c0de47c6 <touchCallback+0x1b6>
c0de479c:	4620      	mov	r0, r4
c0de479e:	46ab      	mov	fp, r5
c0de47a0:	46c2      	mov	sl, r8
c0de47a2:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de47a6:	f003 f8db 	bl	c0de7960 <OUTLINED_FUNCTION_23>
c0de47aa:	220c      	movs	r2, #12
c0de47ac:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de47b0:	e9d0 1000 	ldrd	r1, r0, [r0]
c0de47b4:	f881 2022 	strb.w	r2, [r1, #34]	@ 0x22
c0de47b8:	2200      	movs	r2, #0
c0de47ba:	77ca      	strb	r2, [r1, #31]
c0de47bc:	2101      	movs	r1, #1
c0de47be:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de47c2:	4620      	mov	r0, r4
c0de47c4:	e024      	b.n	c0de4810 <touchCallback+0x200>
c0de47c6:	7ec1      	ldrb	r1, [r0, #27]
c0de47c8:	2901      	cmp	r1, #1
c0de47ca:	d123      	bne.n	c0de4814 <touchCallback+0x204>
c0de47cc:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de47d0:	2902      	cmp	r1, #2
c0de47d2:	d11f      	bne.n	c0de4814 <touchCallback+0x204>
c0de47d4:	4601      	mov	r1, r0
c0de47d6:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de47da:	784b      	ldrb	r3, [r1, #1]
c0de47dc:	788e      	ldrb	r6, [r1, #2]
c0de47de:	78c9      	ldrb	r1, [r1, #3]
c0de47e0:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de47e4:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de47e8:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
c0de47ec:	6851      	ldr	r1, [r2, #4]
c0de47ee:	7ecb      	ldrb	r3, [r1, #27]
c0de47f0:	2b09      	cmp	r3, #9
c0de47f2:	d10f      	bne.n	c0de4814 <touchCallback+0x204>
c0de47f4:	f891 3021 	ldrb.w	r3, [r1, #33]	@ 0x21
c0de47f8:	3501      	adds	r5, #1
c0de47fa:	2b01      	cmp	r3, #1
c0de47fc:	d10a      	bne.n	c0de4814 <touchCallback+0x204>
c0de47fe:	6812      	ldr	r2, [r2, #0]
c0de4800:	230b      	movs	r3, #11
c0de4802:	f882 3022 	strb.w	r3, [r2, #34]	@ 0x22
c0de4806:	2301      	movs	r3, #1
c0de4808:	77d3      	strb	r3, [r2, #31]
c0de480a:	2200      	movs	r2, #0
c0de480c:	f881 2021 	strb.w	r2, [r1, #33]	@ 0x21
c0de4810:	f007 f8c5 	bl	c0deb99e <nbgl_objDraw>
c0de4814:	f108 0801 	add.w	r8, r8, #1
c0de4818:	e7af      	b.n	c0de477a <touchCallback+0x16a>
c0de481a:	4620      	mov	r0, r4
c0de481c:	f003 f874 	bl	c0de7908 <OUTLINED_FUNCTION_18>
c0de4820:	68c6      	ldr	r6, [r0, #12]
c0de4822:	b306      	cbz	r6, c0de4866 <touchCallback+0x256>
c0de4824:	7ef0      	ldrb	r0, [r6, #27]
c0de4826:	2808      	cmp	r0, #8
c0de4828:	d11d      	bne.n	c0de4866 <touchCallback+0x256>
c0de482a:	2d0a      	cmp	r5, #10
c0de482c:	d873      	bhi.n	c0de4916 <touchCallback+0x306>
c0de482e:	2001      	movs	r0, #1
c0de4830:	40a8      	lsls	r0, r5
c0de4832:	f410 6fc5 	tst.w	r0, #1576	@ 0x628
c0de4836:	d045      	beq.n	c0de48c4 <touchCallback+0x2b4>
c0de4838:	f007 faea 	bl	c0debe10 <nbgl_wait_pipeline>
c0de483c:	2000      	movs	r0, #0
c0de483e:	f003 f916 	bl	c0de7a6e <OUTLINED_FUNCTION_35>
c0de4842:	f814 0f22 	ldrb.w	r0, [r4, #34]!
c0de4846:	7861      	ldrb	r1, [r4, #1]
c0de4848:	78a2      	ldrb	r2, [r4, #2]
c0de484a:	78e3      	ldrb	r3, [r4, #3]
c0de484c:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de4850:	f003 f91d 	bl	c0de7a8e <OUTLINED_FUNCTION_37>
c0de4854:	6880      	ldr	r0, [r0, #8]
c0de4856:	f007 f8a2 	bl	c0deb99e <nbgl_objDraw>
c0de485a:	2003      	movs	r0, #3
c0de485c:	2100      	movs	r1, #0
c0de485e:	e8bd 4dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de4862:	f007 b892 	b.w	c0deb98a <nbgl_refreshSpecialWithPostRefresh>
c0de4866:	2400      	movs	r4, #0
c0de4868:	69f8      	ldr	r0, [r7, #28]
c0de486a:	2800      	cmp	r0, #0
c0de486c:	d053      	beq.n	c0de4916 <touchCallback+0x306>
c0de486e:	9d00      	ldr	r5, [sp, #0]
c0de4870:	7928      	ldrb	r0, [r5, #4]
c0de4872:	28ff      	cmp	r0, #255	@ 0xff
c0de4874:	d04f      	beq.n	c0de4916 <touchCallback+0x306>
c0de4876:	79a8      	ldrb	r0, [r5, #6]
c0de4878:	280b      	cmp	r0, #11
c0de487a:	bf98      	it	ls
c0de487c:	f7ff fbd8 	blls	c0de4030 <os_io_seph_cmd_piezo_play_tune>
c0de4880:	b114      	cbz	r4, c0de4888 <touchCallback+0x278>
c0de4882:	2001      	movs	r0, #1
c0de4884:	f007 f87c 	bl	c0deb980 <nbgl_refreshSpecial>
c0de4888:	7928      	ldrb	r0, [r5, #4]
c0de488a:	7969      	ldrb	r1, [r5, #5]
c0de488c:	69fa      	ldr	r2, [r7, #28]
c0de488e:	b002      	add	sp, #8
c0de4890:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de4894:	4710      	bx	r2
c0de4896:	fa5f f08a 	uxtb.w	r0, sl
c0de489a:	28ff      	cmp	r0, #255	@ 0xff
c0de489c:	d03b      	beq.n	c0de4916 <touchCallback+0x306>
c0de489e:	69f9      	ldr	r1, [r7, #28]
c0de48a0:	b3c9      	cbz	r1, c0de4916 <touchCallback+0x306>
c0de48a2:	eb07 04c0 	add.w	r4, r7, r0, lsl #3
c0de48a6:	f894 0026 	ldrb.w	r0, [r4, #38]	@ 0x26
c0de48aa:	280b      	cmp	r0, #11
c0de48ac:	bf98      	it	ls
c0de48ae:	f7ff fbbf 	blls	c0de4030 <os_io_seph_cmd_piezo_play_tune>
c0de48b2:	2001      	movs	r0, #1
c0de48b4:	f007 f864 	bl	c0deb980 <nbgl_refreshSpecial>
c0de48b8:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de48bc:	69fa      	ldr	r2, [r7, #28]
c0de48be:	fa5f f18b 	uxtb.w	r1, fp
c0de48c2:	e7e4      	b.n	c0de488e <touchCallback+0x27e>
c0de48c4:	2d02      	cmp	r5, #2
c0de48c6:	d126      	bne.n	c0de4916 <touchCallback+0x306>
c0de48c8:	9d00      	ldr	r5, [sp, #0]
c0de48ca:	4620      	mov	r0, r4
c0de48cc:	f007 f8c6 	bl	c0deba5c <nbgl_touchGetTouchDuration>
c0de48d0:	f896 1021 	ldrb.w	r1, [r6, #33]	@ 0x21
c0de48d4:	2200      	movs	r2, #0
c0de48d6:	2300      	movs	r3, #0
c0de48d8:	2964      	cmp	r1, #100	@ 0x64
c0de48da:	bf38      	it	cc
c0de48dc:	2301      	movcc	r3, #1
c0de48de:	2464      	movs	r4, #100	@ 0x64
c0de48e0:	fbb0 f0f4 	udiv	r0, r0, r4
c0de48e4:	ebc0 00c0 	rsb	r0, r0, r0, lsl #3
c0de48e8:	b2c4      	uxtb	r4, r0
c0de48ea:	2c63      	cmp	r4, #99	@ 0x63
c0de48ec:	bf88      	it	hi
c0de48ee:	2201      	movhi	r2, #1
c0de48f0:	ea02 0403 	and.w	r4, r2, r3
c0de48f4:	bf88      	it	hi
c0de48f6:	2064      	movhi	r0, #100	@ 0x64
c0de48f8:	b2c2      	uxtb	r2, r0
c0de48fa:	428a      	cmp	r2, r1
c0de48fc:	d005      	beq.n	c0de490a <touchCallback+0x2fa>
c0de48fe:	f003 f8b6 	bl	c0de7a6e <OUTLINED_FUNCTION_35>
c0de4902:	2004      	movs	r0, #4
c0de4904:	2102      	movs	r1, #2
c0de4906:	f007 f840 	bl	c0deb98a <nbgl_refreshSpecialWithPostRefresh>
c0de490a:	b124      	cbz	r4, c0de4916 <touchCallback+0x306>
c0de490c:	69fa      	ldr	r2, [r7, #28]
c0de490e:	b112      	cbz	r2, c0de4916 <touchCallback+0x306>
c0de4910:	7928      	ldrb	r0, [r5, #4]
c0de4912:	7969      	ldrb	r1, [r5, #5]
c0de4914:	e7bb      	b.n	c0de488e <touchCallback+0x27e>
c0de4916:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
	...

c0de491c <nbgl_layoutAddUpFooter>:
c0de491c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de4920:	2800      	cmp	r0, #0
c0de4922:	f000 826c 	beq.w	c0de4dfe <nbgl_layoutAddUpFooter+0x4e2>
c0de4926:	460d      	mov	r5, r1
c0de4928:	b119      	cbz	r1, c0de4932 <nbgl_layoutAddUpFooter+0x16>
c0de492a:	4604      	mov	r4, r0
c0de492c:	7828      	ldrb	r0, [r5, #0]
c0de492e:	2804      	cmp	r0, #4
c0de4930:	d903      	bls.n	c0de493a <nbgl_layoutAddUpFooter+0x1e>
c0de4932:	f06f 0001 	mvn.w	r0, #1
c0de4936:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de493a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de493e:	2601      	movs	r6, #1
c0de4940:	f002 ffee 	bl	c0de7920 <OUTLINED_FUNCTION_19>
c0de4944:	f003 f8fd 	bl	c0de7b42 <OUTLINED_FUNCTION_51>
c0de4948:	6160      	str	r0, [r4, #20]
c0de494a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de494e:	f003 f915 	bl	c0de7b7c <OUTLINED_FUNCTION_56>
c0de4952:	6961      	ldr	r1, [r4, #20]
c0de4954:	0a02      	lsrs	r2, r0, #8
c0de4956:	f8d4 30a0 	ldr.w	r3, [r4, #160]	@ 0xa0
c0de495a:	0e06      	lsrs	r6, r0, #24
c0de495c:	f881 2023 	strb.w	r2, [r1, #35]	@ 0x23
c0de4960:	2208      	movs	r2, #8
c0de4962:	f003 f936 	bl	c0de7bd2 <OUTLINED_FUNCTION_65>
c0de4966:	4608      	mov	r0, r1
c0de4968:	70d6      	strb	r6, [r2, #3]
c0de496a:	0e1a      	lsrs	r2, r3, #24
c0de496c:	f800 3f12 	strb.w	r3, [r0, #18]!
c0de4970:	70c2      	strb	r2, [r0, #3]
c0de4972:	0c1a      	lsrs	r2, r3, #16
c0de4974:	7082      	strb	r2, [r0, #2]
c0de4976:	0a18      	lsrs	r0, r3, #8
c0de4978:	74c8      	strb	r0, [r1, #19]
c0de497a:	7828      	ldrb	r0, [r5, #0]
c0de497c:	2804      	cmp	r0, #4
c0de497e:	f000 80ba 	beq.w	c0de4af6 <nbgl_layoutAddUpFooter+0x1da>
c0de4982:	2801      	cmp	r0, #1
c0de4984:	f000 80e9 	beq.w	c0de4b5a <nbgl_layoutAddUpFooter+0x23e>
c0de4988:	2802      	cmp	r0, #2
c0de498a:	f000 814b 	beq.w	c0de4c24 <nbgl_layoutAddUpFooter+0x308>
c0de498e:	2803      	cmp	r0, #3
c0de4990:	f000 81d2 	beq.w	c0de4d38 <nbgl_layoutAddUpFooter+0x41c>
c0de4994:	2800      	cmp	r0, #0
c0de4996:	d1cc      	bne.n	c0de4932 <nbgl_layoutAddUpFooter+0x16>
c0de4998:	f003 f956 	bl	c0de7c48 <OUTLINED_FUNCTION_74>
c0de499c:	2800      	cmp	r0, #0
c0de499e:	f000 822e 	beq.w	c0de4dfe <nbgl_layoutAddUpFooter+0x4e2>
c0de49a2:	6960      	ldr	r0, [r4, #20]
c0de49a4:	2112      	movs	r1, #18
c0de49a6:	f04f 0804 	mov.w	r8, #4
c0de49aa:	f04f 0a00 	mov.w	sl, #0
c0de49ae:	2706      	movs	r7, #6
c0de49b0:	7781      	strb	r1, [r0, #30]
c0de49b2:	2198      	movs	r1, #152	@ 0x98
c0de49b4:	f880 8020 	strb.w	r8, [r0, #32]
c0de49b8:	f880 a007 	strb.w	sl, [r0, #7]
c0de49bc:	7747      	strb	r7, [r0, #29]
c0de49be:	7181      	strb	r1, [r0, #6]
c0de49c0:	212c      	movs	r1, #44	@ 0x2c
c0de49c2:	7701      	strb	r1, [r0, #28]
c0de49c4:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de49c8:	4ed9      	ldr	r6, [pc, #868]	@ (c0de4d30 <nbgl_layoutAddUpFooter+0x414>)
c0de49ca:	08c1      	lsrs	r1, r0, #3
c0de49cc:	447e      	add	r6, pc
c0de49ce:	2005      	movs	r0, #5
c0de49d0:	47b0      	blx	r6
c0de49d2:	46b3      	mov	fp, r6
c0de49d4:	4606      	mov	r6, r0
c0de49d6:	f880 a018 	strb.w	sl, [r0, #24]
c0de49da:	2020      	movs	r0, #32
c0de49dc:	2103      	movs	r1, #3
c0de49de:	75f0      	strb	r0, [r6, #23]
c0de49e0:	2058      	movs	r0, #88	@ 0x58
c0de49e2:	75b7      	strb	r7, [r6, #22]
c0de49e4:	4637      	mov	r7, r6
c0de49e6:	f886 a007 	strb.w	sl, [r6, #7]
c0de49ea:	f886 1021 	strb.w	r1, [r6, #33]	@ 0x21
c0de49ee:	f886 a01f 	strb.w	sl, [r6, #31]
c0de49f2:	f886 a020 	strb.w	sl, [r6, #32]
c0de49f6:	f886 8022 	strb.w	r8, [r6, #34]	@ 0x22
c0de49fa:	f807 0f04 	strb.w	r0, [r7, #4]!
c0de49fe:	71b0      	strb	r0, [r6, #6]
c0de4a00:	f887 a001 	strb.w	sl, [r7, #1]
c0de4a04:	48cb      	ldr	r0, [pc, #812]	@ (c0de4d34 <nbgl_layoutAddUpFooter+0x418>)
c0de4a06:	4478      	add	r0, pc
c0de4a08:	f007 f9d2 	bl	c0debdb0 <pic>
c0de4a0c:	4631      	mov	r1, r6
c0de4a0e:	0e02      	lsrs	r2, r0, #24
c0de4a10:	f002 ffea 	bl	c0de79e8 <OUTLINED_FUNCTION_29>
c0de4a14:	6960      	ldr	r0, [r4, #20]
c0de4a16:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de4a1a:	7842      	ldrb	r2, [r0, #1]
c0de4a1c:	7883      	ldrb	r3, [r0, #2]
c0de4a1e:	78c0      	ldrb	r0, [r0, #3]
c0de4a20:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de4a24:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de4a28:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de4a2c:	6006      	str	r6, [r0, #0]
c0de4a2e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4a32:	08c1      	lsrs	r1, r0, #3
c0de4a34:	2004      	movs	r0, #4
c0de4a36:	47d8      	blx	fp
c0de4a38:	f880 a01f 	strb.w	sl, [r0, #31]
c0de4a3c:	4606      	mov	r6, r0
c0de4a3e:	f002 ff8c 	bl	c0de795a <OUTLINED_FUNCTION_22>
c0de4a42:	4601      	mov	r1, r0
c0de4a44:	f896 0024 	ldrb.w	r0, [r6, #36]	@ 0x24
c0de4a48:	2301      	movs	r3, #1
c0de4a4a:	f886 8020 	strb.w	r8, [r6, #32]
c0de4a4e:	0e0a      	lsrs	r2, r1, #24
c0de4a50:	f040 0001 	orr.w	r0, r0, #1
c0de4a54:	f886 0024 	strb.w	r0, [r6, #36]	@ 0x24
c0de4a58:	200d      	movs	r0, #13
c0de4a5a:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de4a5e:	f003 f837 	bl	c0de7ad0 <OUTLINED_FUNCTION_43>
c0de4a62:	7838      	ldrb	r0, [r7, #0]
c0de4a64:	787a      	ldrb	r2, [r7, #1]
c0de4a66:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de4a6a:	f5c0 70c0 	rsb	r0, r0, #384	@ 0x180
c0de4a6e:	0a02      	lsrs	r2, r0, #8
c0de4a70:	7130      	strb	r0, [r6, #4]
c0de4a72:	7172      	strb	r2, [r6, #5]
c0de4a74:	b282      	uxth	r2, r0
c0de4a76:	f003 f8a5 	bl	c0de7bc4 <OUTLINED_FUNCTION_62>
c0de4a7a:	2120      	movs	r1, #32
c0de4a7c:	71b0      	strb	r0, [r6, #6]
c0de4a7e:	0a00      	lsrs	r0, r0, #8
c0de4a80:	f886 a021 	strb.w	sl, [r6, #33]	@ 0x21
c0de4a84:	f003 f8cd 	bl	c0de7c22 <OUTLINED_FUNCTION_71>
c0de4a88:	75f1      	strb	r1, [r6, #23]
c0de4a8a:	71f0      	strb	r0, [r6, #7]
c0de4a8c:	6960      	ldr	r0, [r4, #20]
c0de4a8e:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de4a92:	7842      	ldrb	r2, [r0, #1]
c0de4a94:	7883      	ldrb	r3, [r0, #2]
c0de4a96:	78c0      	ldrb	r0, [r0, #3]
c0de4a98:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de4a9c:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de4aa0:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de4aa4:	6046      	str	r6, [r0, #4]
c0de4aa6:	f002 ff53 	bl	c0de7950 <OUTLINED_FUNCTION_21>
c0de4aaa:	6961      	ldr	r1, [r4, #20]
c0de4aac:	2602      	movs	r6, #2
c0de4aae:	7586      	strb	r6, [r0, #22]
c0de4ab0:	f003 f818 	bl	c0de7ae4 <OUTLINED_FUNCTION_44>
c0de4ab4:	2708      	movs	r7, #8
c0de4ab6:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de4aba:	6088      	str	r0, [r1, #8]
c0de4abc:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4ac0:	08c1      	lsrs	r1, r0, #3
c0de4ac2:	2008      	movs	r0, #8
c0de4ac4:	47d8      	blx	fp
c0de4ac6:	f890 1022 	ldrb.w	r1, [r0, #34]	@ 0x22
c0de4aca:	7187      	strb	r7, [r0, #6]
c0de4acc:	7586      	strb	r6, [r0, #22]
c0de4ace:	f880 a01a 	strb.w	sl, [r0, #26]
c0de4ad2:	f880 a007 	strb.w	sl, [r0, #7]
c0de4ad6:	f041 0105 	orr.w	r1, r1, #5
c0de4ada:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de4ade:	2101      	movs	r1, #1
c0de4ae0:	7641      	strb	r1, [r0, #25]
c0de4ae2:	7141      	strb	r1, [r0, #5]
c0de4ae4:	21e0      	movs	r1, #224	@ 0xe0
c0de4ae6:	7101      	strb	r1, [r0, #4]
c0de4ae8:	6961      	ldr	r1, [r4, #20]
c0de4aea:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de4aee:	f002 fe93 	bl	c0de7818 <OUTLINED_FUNCTION_9>
c0de4af2:	60c8      	str	r0, [r1, #12]
c0de4af4:	e1f0      	b.n	c0de4ed8 <nbgl_layoutAddUpFooter+0x5bc>
c0de4af6:	f003 f8a7 	bl	c0de7c48 <OUTLINED_FUNCTION_74>
c0de4afa:	2800      	cmp	r0, #0
c0de4afc:	f000 817f 	beq.w	c0de4dfe <nbgl_layoutAddUpFooter+0x4e2>
c0de4b00:	6960      	ldr	r0, [r4, #20]
c0de4b02:	2104      	movs	r1, #4
c0de4b04:	2701      	movs	r7, #1
c0de4b06:	2260      	movs	r2, #96	@ 0x60
c0de4b08:	7781      	strb	r1, [r0, #30]
c0de4b0a:	2100      	movs	r1, #0
c0de4b0c:	f880 7020 	strb.w	r7, [r0, #32]
c0de4b10:	7182      	strb	r2, [r0, #6]
c0de4b12:	7707      	strb	r7, [r0, #28]
c0de4b14:	71c1      	strb	r1, [r0, #7]
c0de4b16:	7741      	strb	r1, [r0, #29]
c0de4b18:	f002 ff1f 	bl	c0de795a <OUTLINED_FUNCTION_22>
c0de4b1c:	7800      	ldrb	r0, [r0, #0]
c0de4b1e:	2800      	cmp	r0, #0
c0de4b20:	f000 81da 	beq.w	c0de4ed8 <nbgl_layoutAddUpFooter+0x5bc>
c0de4b24:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4b28:	f002 fdf8 	bl	c0de771c <OUTLINED_FUNCTION_1>
c0de4b2c:	77c7      	strb	r7, [r0, #31]
c0de4b2e:	4606      	mov	r6, r0
c0de4b30:	f002 ff13 	bl	c0de795a <OUTLINED_FUNCTION_22>
c0de4b34:	4601      	mov	r1, r0
c0de4b36:	20a0      	movs	r0, #160	@ 0xa0
c0de4b38:	7177      	strb	r7, [r6, #5]
c0de4b3a:	2705      	movs	r7, #5
c0de4b3c:	2301      	movs	r3, #1
c0de4b3e:	7130      	strb	r0, [r6, #4]
c0de4b40:	200b      	movs	r0, #11
c0de4b42:	0e0a      	lsrs	r2, r1, #24
c0de4b44:	f886 7020 	strb.w	r7, [r6, #32]
c0de4b48:	f002 fec4 	bl	c0de78d4 <OUTLINED_FUNCTION_16>
c0de4b4c:	f006 ff68 	bl	c0deba20 <nbgl_getTextHeightInWidth>
c0de4b50:	71b0      	strb	r0, [r6, #6]
c0de4b52:	0a00      	lsrs	r0, r0, #8
c0de4b54:	75b7      	strb	r7, [r6, #22]
c0de4b56:	71f0      	strb	r0, [r6, #7]
c0de4b58:	e056      	b.n	c0de4c08 <nbgl_layoutAddUpFooter+0x2ec>
c0de4b5a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4b5e:	2705      	movs	r7, #5
c0de4b60:	f002 fe9a 	bl	c0de7898 <OUTLINED_FUNCTION_13>
c0de4b64:	4606      	mov	r6, r0
c0de4b66:	7b2a      	ldrb	r2, [r5, #12]
c0de4b68:	7c2b      	ldrb	r3, [r5, #16]
c0de4b6a:	f002 feaf 	bl	c0de78cc <OUTLINED_FUNCTION_15>
c0de4b6e:	2800      	cmp	r0, #0
c0de4b70:	f000 8145 	beq.w	c0de4dfe <nbgl_layoutAddUpFooter+0x4e2>
c0de4b74:	6960      	ldr	r0, [r4, #20]
c0de4b76:	75b7      	strb	r7, [r6, #22]
c0de4b78:	f04f 0801 	mov.w	r8, #1
c0de4b7c:	2700      	movs	r7, #0
c0de4b7e:	2188      	movs	r1, #136	@ 0x88
c0de4b80:	f880 8020 	strb.w	r8, [r0, #32]
c0de4b84:	71c7      	strb	r7, [r0, #7]
c0de4b86:	7181      	strb	r1, [r0, #6]
c0de4b88:	7b68      	ldrb	r0, [r5, #13]
c0de4b8a:	2800      	cmp	r0, #0
c0de4b8c:	bf18      	it	ne
c0de4b8e:	2003      	movne	r0, #3
c0de4b90:	77f0      	strb	r0, [r6, #31]
c0de4b92:	f04f 0000 	mov.w	r0, #0
c0de4b96:	bf08      	it	eq
c0de4b98:	2003      	moveq	r0, #3
c0de4b9a:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de4b9e:	7b68      	ldrb	r0, [r5, #13]
c0de4ba0:	4601      	mov	r1, r0
c0de4ba2:	2800      	cmp	r0, #0
c0de4ba4:	bf18      	it	ne
c0de4ba6:	2101      	movne	r1, #1
c0de4ba8:	0049      	lsls	r1, r1, #1
c0de4baa:	2802      	cmp	r0, #2
c0de4bac:	bf08      	it	eq
c0de4bae:	2103      	moveq	r1, #3
c0de4bb0:	f886 1020 	strb.w	r1, [r6, #32]
c0de4bb4:	f002 fed1 	bl	c0de795a <OUTLINED_FUNCTION_22>
c0de4bb8:	210c      	movs	r1, #12
c0de4bba:	0e02      	lsrs	r2, r0, #24
c0de4bbc:	f886 1023 	strb.w	r1, [r6, #35]	@ 0x23
c0de4bc0:	4631      	mov	r1, r6
c0de4bc2:	f002 ff23 	bl	c0de7a0c <OUTLINED_FUNCTION_31>
c0de4bc6:	f002 ffa1 	bl	c0de7b0c <OUTLINED_FUNCTION_46>
c0de4bca:	4631      	mov	r1, r6
c0de4bcc:	0e02      	lsrs	r2, r0, #24
c0de4bce:	74f7      	strb	r7, [r6, #19]
c0de4bd0:	71f7      	strb	r7, [r6, #7]
c0de4bd2:	f886 8005 	strb.w	r8, [r6, #5]
c0de4bd6:	7777      	strb	r7, [r6, #29]
c0de4bd8:	f886 801c 	strb.w	r8, [r6, #28]
c0de4bdc:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de4be0:	70ca      	strb	r2, [r1, #3]
c0de4be2:	0c02      	lsrs	r2, r0, #16
c0de4be4:	0a00      	lsrs	r0, r0, #8
c0de4be6:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de4bea:	4630      	mov	r0, r6
c0de4bec:	708a      	strb	r2, [r1, #2]
c0de4bee:	f800 7f12 	strb.w	r7, [r0, #18]!
c0de4bf2:	70c7      	strb	r7, [r0, #3]
c0de4bf4:	7087      	strb	r7, [r0, #2]
c0de4bf6:	2058      	movs	r0, #88	@ 0x58
c0de4bf8:	71b0      	strb	r0, [r6, #6]
c0de4bfa:	20a0      	movs	r0, #160	@ 0xa0
c0de4bfc:	7130      	strb	r0, [r6, #4]
c0de4bfe:	2004      	movs	r0, #4
c0de4c00:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de4c04:	2007      	movs	r0, #7
c0de4c06:	77b0      	strb	r0, [r6, #30]
c0de4c08:	6960      	ldr	r0, [r4, #20]
c0de4c0a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de4c0e:	7842      	ldrb	r2, [r0, #1]
c0de4c10:	7883      	ldrb	r3, [r0, #2]
c0de4c12:	78c0      	ldrb	r0, [r0, #3]
c0de4c14:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de4c18:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de4c1c:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de4c20:	6006      	str	r6, [r0, #0]
c0de4c22:	e159      	b.n	c0de4ed8 <nbgl_layoutAddUpFooter+0x5bc>
c0de4c24:	6868      	ldr	r0, [r5, #4]
c0de4c26:	2800      	cmp	r0, #0
c0de4c28:	f000 80e9 	beq.w	c0de4dfe <nbgl_layoutAddUpFooter+0x4e2>
c0de4c2c:	68a8      	ldr	r0, [r5, #8]
c0de4c2e:	2800      	cmp	r0, #0
c0de4c30:	f000 80e5 	beq.w	c0de4dfe <nbgl_layoutAddUpFooter+0x4e2>
c0de4c34:	f04f 0b00 	mov.w	fp, #0
c0de4c38:	2088      	movs	r0, #136	@ 0x88
c0de4c3a:	2702      	movs	r7, #2
c0de4c3c:	f881 b007 	strb.w	fp, [r1, #7]
c0de4c40:	7188      	strb	r0, [r1, #6]
c0de4c42:	f881 7020 	strb.w	r7, [r1, #32]
c0de4c46:	f002 fde1 	bl	c0de780c <OUTLINED_FUNCTION_8>
c0de4c4a:	4606      	mov	r6, r0
c0de4c4c:	7b2a      	ldrb	r2, [r5, #12]
c0de4c4e:	7bab      	ldrb	r3, [r5, #14]
c0de4c50:	f002 fe3c 	bl	c0de78cc <OUTLINED_FUNCTION_15>
c0de4c54:	2800      	cmp	r0, #0
c0de4c56:	f000 80d2 	beq.w	c0de4dfe <nbgl_layoutAddUpFooter+0x4e2>
c0de4c5a:	2120      	movs	r1, #32
c0de4c5c:	f04f 0804 	mov.w	r8, #4
c0de4c60:	f886 7020 	strb.w	r7, [r6, #32]
c0de4c64:	2703      	movs	r7, #3
c0de4c66:	f04f 0a58 	mov.w	sl, #88	@ 0x58
c0de4c6a:	f886 b018 	strb.w	fp, [r6, #24]
c0de4c6e:	f886 b021 	strb.w	fp, [r6, #33]	@ 0x21
c0de4c72:	f886 b007 	strb.w	fp, [r6, #7]
c0de4c76:	f886 b005 	strb.w	fp, [r6, #5]
c0de4c7a:	75f1      	strb	r1, [r6, #23]
c0de4c7c:	2101      	movs	r1, #1
c0de4c7e:	f886 8016 	strb.w	r8, [r6, #22]
c0de4c82:	77f7      	strb	r7, [r6, #31]
c0de4c84:	f886 8022 	strb.w	r8, [r6, #34]	@ 0x22
c0de4c88:	7141      	strb	r1, [r0, #5]
c0de4c8a:	f886 a006 	strb.w	sl, [r6, #6]
c0de4c8e:	f886 a004 	strb.w	sl, [r6, #4]
c0de4c92:	f002 fe62 	bl	c0de795a <OUTLINED_FUNCTION_22>
c0de4c96:	4631      	mov	r1, r6
c0de4c98:	0e02      	lsrs	r2, r0, #24
c0de4c9a:	f886 b01d 	strb.w	fp, [r6, #29]
c0de4c9e:	f04f 0b01 	mov.w	fp, #1
c0de4ca2:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de4ca6:	f886 b01c 	strb.w	fp, [r6, #28]
c0de4caa:	70ca      	strb	r2, [r1, #3]
c0de4cac:	0c02      	lsrs	r2, r0, #16
c0de4cae:	0a00      	lsrs	r0, r0, #8
c0de4cb0:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de4cb4:	200c      	movs	r0, #12
c0de4cb6:	708a      	strb	r2, [r1, #2]
c0de4cb8:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de4cbc:	200a      	movs	r0, #10
c0de4cbe:	f002 feba 	bl	c0de7a36 <OUTLINED_FUNCTION_33>
c0de4cc2:	6006      	str	r6, [r0, #0]
c0de4cc4:	f002 fda2 	bl	c0de780c <OUTLINED_FUNCTION_8>
c0de4cc8:	4606      	mov	r6, r0
c0de4cca:	7b6a      	ldrb	r2, [r5, #13]
c0de4ccc:	7bab      	ldrb	r3, [r5, #14]
c0de4cce:	f002 fdfd 	bl	c0de78cc <OUTLINED_FUNCTION_15>
c0de4cd2:	2800      	cmp	r0, #0
c0de4cd4:	f000 8093 	beq.w	c0de4dfe <nbgl_layoutAddUpFooter+0x4e2>
c0de4cd8:	f886 7021 	strb.w	r7, [r6, #33]	@ 0x21
c0de4cdc:	2700      	movs	r7, #0
c0de4cde:	2120      	movs	r1, #32
c0de4ce0:	f886 8022 	strb.w	r8, [r6, #34]	@ 0x22
c0de4ce4:	f886 b005 	strb.w	fp, [r6, #5]
c0de4ce8:	75f1      	strb	r1, [r6, #23]
c0de4cea:	7147      	strb	r7, [r0, #5]
c0de4cec:	2106      	movs	r1, #6
c0de4cee:	2038      	movs	r0, #56	@ 0x38
c0de4cf0:	f886 7020 	strb.w	r7, [r6, #32]
c0de4cf4:	77f7      	strb	r7, [r6, #31]
c0de4cf6:	7637      	strb	r7, [r6, #24]
c0de4cf8:	71f7      	strb	r7, [r6, #7]
c0de4cfa:	f886 a006 	strb.w	sl, [r6, #6]
c0de4cfe:	75b1      	strb	r1, [r6, #22]
c0de4d00:	7130      	strb	r0, [r6, #4]
c0de4d02:	f002 ff03 	bl	c0de7b0c <OUTLINED_FUNCTION_46>
c0de4d06:	4631      	mov	r1, r6
c0de4d08:	0e02      	lsrs	r2, r0, #24
c0de4d0a:	f886 b01c 	strb.w	fp, [r6, #28]
c0de4d0e:	7777      	strb	r7, [r6, #29]
c0de4d10:	f801 0f25 	strb.w	r0, [r1, #37]!
c0de4d14:	70ca      	strb	r2, [r1, #3]
c0de4d16:	0c02      	lsrs	r2, r0, #16
c0de4d18:	0a00      	lsrs	r0, r0, #8
c0de4d1a:	f886 0026 	strb.w	r0, [r6, #38]	@ 0x26
c0de4d1e:	200c      	movs	r0, #12
c0de4d20:	708a      	strb	r2, [r1, #2]
c0de4d22:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de4d26:	2009      	movs	r0, #9
c0de4d28:	f002 fe85 	bl	c0de7a36 <OUTLINED_FUNCTION_33>
c0de4d2c:	6046      	str	r6, [r0, #4]
c0de4d2e:	e0d3      	b.n	c0de4ed8 <nbgl_layoutAddUpFooter+0x5bc>
c0de4d30:	0000701f 	.word	0x0000701f
c0de4d34:	000085a7 	.word	0x000085a7
c0de4d38:	6868      	ldr	r0, [r5, #4]
c0de4d3a:	2800      	cmp	r0, #0
c0de4d3c:	d05f      	beq.n	c0de4dfe <nbgl_layoutAddUpFooter+0x4e2>
c0de4d3e:	7b2a      	ldrb	r2, [r5, #12]
c0de4d40:	7b6b      	ldrb	r3, [r5, #13]
c0de4d42:	4620      	mov	r0, r4
c0de4d44:	f7ff fb5a 	bl	c0de43fc <layoutAddCallbackObj>
c0de4d48:	2800      	cmp	r0, #0
c0de4d4a:	d058      	beq.n	c0de4dfe <nbgl_layoutAddUpFooter+0x4e2>
c0de4d4c:	6960      	ldr	r0, [r4, #20]
c0de4d4e:	2103      	movs	r1, #3
c0de4d50:	f04f 0a00 	mov.w	sl, #0
c0de4d54:	2701      	movs	r7, #1
c0de4d56:	f04f 0804 	mov.w	r8, #4
c0de4d5a:	f880 1020 	strb.w	r1, [r0, #32]
c0de4d5e:	2113      	movs	r1, #19
c0de4d60:	f880 a01d 	strb.w	sl, [r0, #29]
c0de4d64:	7707      	strb	r7, [r0, #28]
c0de4d66:	7781      	strb	r1, [r0, #30]
c0de4d68:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4d6c:	f002 fcd6 	bl	c0de771c <OUTLINED_FUNCTION_1>
c0de4d70:	f880 a01f 	strb.w	sl, [r0, #31]
c0de4d74:	4606      	mov	r6, r0
c0de4d76:	f002 fdf0 	bl	c0de795a <OUTLINED_FUNCTION_22>
c0de4d7a:	22a0      	movs	r2, #160	@ 0xa0
c0de4d7c:	4601      	mov	r1, r0
c0de4d7e:	200b      	movs	r0, #11
c0de4d80:	f886 8020 	strb.w	r8, [r6, #32]
c0de4d84:	7177      	strb	r7, [r6, #5]
c0de4d86:	7132      	strb	r2, [r6, #4]
c0de4d88:	4632      	mov	r2, r6
c0de4d8a:	0e0b      	lsrs	r3, r1, #24
c0de4d8c:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de4d90:	f802 1f26 	strb.w	r1, [r2, #38]!
c0de4d94:	70d3      	strb	r3, [r2, #3]
c0de4d96:	0c0b      	lsrs	r3, r1, #16
c0de4d98:	7093      	strb	r3, [r2, #2]
c0de4d9a:	0a0a      	lsrs	r2, r1, #8
c0de4d9c:	f886 2027 	strb.w	r2, [r6, #39]	@ 0x27
c0de4da0:	f896 2024 	ldrb.w	r2, [r6, #36]	@ 0x24
c0de4da4:	f042 0301 	orr.w	r3, r2, #1
c0de4da8:	f886 3024 	strb.w	r3, [r6, #36]	@ 0x24
c0de4dac:	68aa      	ldr	r2, [r5, #8]
c0de4dae:	b352      	cbz	r2, c0de4e06 <nbgl_layoutAddUpFooter+0x4ea>
c0de4db0:	4610      	mov	r0, r2
c0de4db2:	f006 fffd 	bl	c0debdb0 <pic>
c0de4db6:	4637      	mov	r7, r6
c0de4db8:	4601      	mov	r1, r0
c0de4dba:	f817 cf26 	ldrb.w	ip, [r7, #38]!
c0de4dbe:	f817 ed22 	ldrb.w	lr, [r7, #-34]!
c0de4dc2:	787a      	ldrb	r2, [r7, #1]
c0de4dc4:	7fb8      	ldrb	r0, [r7, #30]
c0de4dc6:	f897 3020 	ldrb.w	r3, [r7, #32]
c0de4dca:	f897 b023 	ldrb.w	fp, [r7, #35]	@ 0x23
c0de4dce:	ea4e 2e02 	orr.w	lr, lr, r2, lsl #8
c0de4dd2:	780a      	ldrb	r2, [r1, #0]
c0de4dd4:	7849      	ldrb	r1, [r1, #1]
c0de4dd6:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de4dda:	ebae 0101 	sub.w	r1, lr, r1
c0de4dde:	f1a1 0220 	sub.w	r2, r1, #32
c0de4de2:	0a11      	lsrs	r1, r2, #8
c0de4de4:	703a      	strb	r2, [r7, #0]
c0de4de6:	7079      	strb	r1, [r7, #1]
c0de4de8:	f897 1025 	ldrb.w	r1, [r7, #37]	@ 0x25
c0de4dec:	f897 7024 	ldrb.w	r7, [r7, #36]	@ 0x24
c0de4df0:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de4df4:	ea4c 270b 	orr.w	r7, ip, fp, lsl #8
c0de4df8:	ea47 4101 	orr.w	r1, r7, r1, lsl #16
c0de4dfc:	e005      	b.n	c0de4e0a <nbgl_layoutAddUpFooter+0x4ee>
c0de4dfe:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de4e02:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de4e06:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de4e0a:	b292      	uxth	r2, r2
c0de4e0c:	f003 0301 	and.w	r3, r3, #1
c0de4e10:	f006 fe06 	bl	c0deba20 <nbgl_getTextHeightInWidth>
c0de4e14:	6961      	ldr	r1, [r4, #20]
c0de4e16:	f002 ff04 	bl	c0de7c22 <OUTLINED_FUNCTION_71>
c0de4e1a:	f002 fe63 	bl	c0de7ae4 <OUTLINED_FUNCTION_44>
c0de4e1e:	2720      	movs	r7, #32
c0de4e20:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de4e24:	600e      	str	r6, [r1, #0]
c0de4e26:	75f7      	strb	r7, [r6, #23]
c0de4e28:	71b0      	strb	r0, [r6, #6]
c0de4e2a:	0a01      	lsrs	r1, r0, #8
c0de4e2c:	6962      	ldr	r2, [r4, #20]
c0de4e2e:	71f1      	strb	r1, [r6, #7]
c0de4e30:	71d1      	strb	r1, [r2, #7]
c0de4e32:	7190      	strb	r0, [r2, #6]
c0de4e34:	f002 fd8c 	bl	c0de7950 <OUTLINED_FUNCTION_21>
c0de4e38:	2102      	movs	r1, #2
c0de4e3a:	7581      	strb	r1, [r0, #22]
c0de4e3c:	6961      	ldr	r1, [r4, #20]
c0de4e3e:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de4e42:	f002 fce9 	bl	c0de7818 <OUTLINED_FUNCTION_9>
c0de4e46:	6048      	str	r0, [r1, #4]
c0de4e48:	68a8      	ldr	r0, [r5, #8]
c0de4e4a:	b3e0      	cbz	r0, c0de4ec6 <nbgl_layoutAddUpFooter+0x5aa>
c0de4e4c:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4e50:	f002 fda8 	bl	c0de79a4 <OUTLINED_FUNCTION_26>
c0de4e54:	4606      	mov	r6, r0
c0de4e56:	2000      	movs	r0, #0
c0de4e58:	7630      	strb	r0, [r6, #24]
c0de4e5a:	77f0      	strb	r0, [r6, #31]
c0de4e5c:	2006      	movs	r0, #6
c0de4e5e:	75f7      	strb	r7, [r6, #23]
c0de4e60:	75b0      	strb	r0, [r6, #22]
c0de4e62:	f002 fe53 	bl	c0de7b0c <OUTLINED_FUNCTION_46>
c0de4e66:	4631      	mov	r1, r6
c0de4e68:	0e02      	lsrs	r2, r0, #24
c0de4e6a:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de4e6e:	f002 fd46 	bl	c0de78fe <OUTLINED_FUNCTION_17>
c0de4e72:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de4e76:	6960      	ldr	r0, [r4, #20]
c0de4e78:	f810 2f22 	ldrb.w	r2, [r0, #34]!
c0de4e7c:	7843      	ldrb	r3, [r0, #1]
c0de4e7e:	7887      	ldrb	r7, [r0, #2]
c0de4e80:	78c0      	ldrb	r0, [r0, #3]
c0de4e82:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de4e86:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de4e8a:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de4e8e:	6086      	str	r6, [r0, #8]
c0de4e90:	f896 0022 	ldrb.w	r0, [r6, #34]	@ 0x22
c0de4e94:	780a      	ldrb	r2, [r1, #0]
c0de4e96:	788b      	ldrb	r3, [r1, #2]
c0de4e98:	78c9      	ldrb	r1, [r1, #3]
c0de4e9a:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de4e9e:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de4ea2:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de4ea6:	7881      	ldrb	r1, [r0, #2]
c0de4ea8:	78c0      	ldrb	r0, [r0, #3]
c0de4eaa:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
c0de4eae:	6960      	ldr	r0, [r4, #20]
c0de4eb0:	7982      	ldrb	r2, [r0, #6]
c0de4eb2:	79c3      	ldrb	r3, [r0, #7]
c0de4eb4:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de4eb8:	428a      	cmp	r2, r1
c0de4eba:	bf2f      	iteee	cs
c0de4ebc:	4611      	movcs	r1, r2
c0de4ebe:	7181      	strbcc	r1, [r0, #6]
c0de4ec0:	0a0a      	lsrcc	r2, r1, #8
c0de4ec2:	71c2      	strbcc	r2, [r0, #7]
c0de4ec4:	e004      	b.n	c0de4ed0 <nbgl_layoutAddUpFooter+0x5b4>
c0de4ec6:	6960      	ldr	r0, [r4, #20]
c0de4ec8:	7981      	ldrb	r1, [r0, #6]
c0de4eca:	79c2      	ldrb	r2, [r0, #7]
c0de4ecc:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de4ed0:	3130      	adds	r1, #48	@ 0x30
c0de4ed2:	7181      	strb	r1, [r0, #6]
c0de4ed4:	0a09      	lsrs	r1, r1, #8
c0de4ed6:	71c1      	strb	r1, [r0, #7]
c0de4ed8:	f8d4 20a0 	ldr.w	r2, [r4, #160]	@ 0xa0
c0de4edc:	6961      	ldr	r1, [r4, #20]
c0de4ede:	68a0      	ldr	r0, [r4, #8]
c0de4ee0:	f812 3f06 	ldrb.w	r3, [r2, #6]!
c0de4ee4:	79cf      	ldrb	r7, [r1, #7]
c0de4ee6:	7856      	ldrb	r6, [r2, #1]
c0de4ee8:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de4eec:	798e      	ldrb	r6, [r1, #6]
c0de4eee:	ea46 2607 	orr.w	r6, r6, r7, lsl #8
c0de4ef2:	1b9b      	subs	r3, r3, r6
c0de4ef4:	7013      	strb	r3, [r2, #0]
c0de4ef6:	6101      	str	r1, [r0, #16]
c0de4ef8:	0a1b      	lsrs	r3, r3, #8
c0de4efa:	6960      	ldr	r0, [r4, #20]
c0de4efc:	7053      	strb	r3, [r2, #1]
c0de4efe:	782a      	ldrb	r2, [r5, #0]
c0de4f00:	7981      	ldrb	r1, [r0, #6]
c0de4f02:	79c0      	ldrb	r0, [r0, #7]
c0de4f04:	f884 20ac 	strb.w	r2, [r4, #172]	@ 0xac
c0de4f08:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de4f0c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de4f10 <nbgl_layoutAddSwipe>:
c0de4f10:	b3e8      	cbz	r0, c0de4f8e <nbgl_layoutAddSwipe+0x7e>
c0de4f12:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de4f16:	f8dd 8020 	ldr.w	r8, [sp, #32]
c0de4f1a:	461c      	mov	r4, r3
c0de4f1c:	4617      	mov	r7, r2
c0de4f1e:	460d      	mov	r5, r1
c0de4f20:	4606      	mov	r6, r0
c0de4f22:	b352      	cbz	r2, c0de4f7a <nbgl_layoutAddSwipe+0x6a>
c0de4f24:	2004      	movs	r0, #4
c0de4f26:	2100      	movs	r1, #0
c0de4f28:	f04f 0a00 	mov.w	sl, #0
c0de4f2c:	f006 fd5f 	bl	c0deb9ee <nbgl_objPoolGet>
c0de4f30:	61b0      	str	r0, [r6, #24]
c0de4f32:	4638      	mov	r0, r7
c0de4f34:	f006 ff3c 	bl	c0debdb0 <pic>
c0de4f38:	69b1      	ldr	r1, [r6, #24]
c0de4f3a:	0e02      	lsrs	r2, r0, #24
c0de4f3c:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de4f40:	f002 fe0b 	bl	c0de7b5a <OUTLINED_FUNCTION_53>
c0de4f44:	2001      	movs	r0, #1
c0de4f46:	22a0      	movs	r2, #160	@ 0xa0
c0de4f48:	f801 2c22 	strb.w	r2, [r1, #-34]
c0de4f4c:	220b      	movs	r2, #11
c0de4f4e:	f801 0c21 	strb.w	r0, [r1, #-33]
c0de4f52:	f801 0c07 	strb.w	r0, [r1, #-7]
c0de4f56:	200b      	movs	r0, #11
c0de4f58:	f801 2c04 	strb.w	r2, [r1, #-4]
c0de4f5c:	f006 fd5b 	bl	c0deba16 <nbgl_getFontLineHeight>
c0de4f60:	69b1      	ldr	r1, [r6, #24]
c0de4f62:	7188      	strb	r0, [r1, #6]
c0de4f64:	201e      	movs	r0, #30
c0de4f66:	f881 a007 	strb.w	sl, [r1, #7]
c0de4f6a:	f881 a01a 	strb.w	sl, [r1, #26]
c0de4f6e:	7648      	strb	r0, [r1, #25]
c0de4f70:	2005      	movs	r0, #5
c0de4f72:	f881 0020 	strb.w	r0, [r1, #32]
c0de4f76:	2008      	movs	r0, #8
c0de4f78:	7588      	strb	r0, [r1, #22]
c0de4f7a:	4630      	mov	r0, r6
c0de4f7c:	4629      	mov	r1, r5
c0de4f7e:	2201      	movs	r2, #1
c0de4f80:	4623      	mov	r3, r4
c0de4f82:	f8cd 8000 	str.w	r8, [sp]
c0de4f86:	f000 f804 	bl	c0de4f92 <addSwipeInternal>
c0de4f8a:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0de4f8e:	f002 bd8a 	b.w	c0de7aa6 <OUTLINED_FUNCTION_40>

c0de4f92 <addSwipeInternal>:
c0de4f92:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de4f94:	f411 6ff0 	tst.w	r1, #1920	@ 0x780
c0de4f98:	d013      	beq.n	c0de4fc2 <addSwipeInternal+0x30>
c0de4f9a:	9f06      	ldr	r7, [sp, #24]
c0de4f9c:	460c      	mov	r4, r1
c0de4f9e:	f8d0 10a0 	ldr.w	r1, [r0, #160]	@ 0xa0
c0de4fa2:	4615      	mov	r5, r2
c0de4fa4:	461a      	mov	r2, r3
c0de4fa6:	4606      	mov	r6, r0
c0de4fa8:	463b      	mov	r3, r7
c0de4faa:	f7ff fa27 	bl	c0de43fc <layoutAddCallbackObj>
c0de4fae:	b140      	cbz	r0, c0de4fc2 <addSwipeInternal+0x30>
c0de4fb0:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de4fb4:	0a21      	lsrs	r1, r4, #8
c0de4fb6:	f886 50b0 	strb.w	r5, [r6, #176]	@ 0xb0
c0de4fba:	7741      	strb	r1, [r0, #29]
c0de4fbc:	7704      	strb	r4, [r0, #28]
c0de4fbe:	2000      	movs	r0, #0
c0de4fc0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de4fc2:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de4fc6:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0de4fc8 <nbgl_layoutAddTopRightButton>:
c0de4fc8:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de4fcc:	b3a8      	cbz	r0, c0de503a <nbgl_layoutAddTopRightButton+0x72>
c0de4fce:	f002 fdfc 	bl	c0de7bca <OUTLINED_FUNCTION_64>
c0de4fd2:	4688      	mov	r8, r1
c0de4fd4:	461f      	mov	r7, r3
c0de4fd6:	4615      	mov	r5, r2
c0de4fd8:	f04f 0a05 	mov.w	sl, #5
c0de4fdc:	f002 fc5c 	bl	c0de7898 <OUTLINED_FUNCTION_13>
c0de4fe0:	4606      	mov	r6, r0
c0de4fe2:	4620      	mov	r0, r4
c0de4fe4:	462a      	mov	r2, r5
c0de4fe6:	463b      	mov	r3, r7
c0de4fe8:	4631      	mov	r1, r6
c0de4fea:	f7ff fa07 	bl	c0de43fc <layoutAddCallbackObj>
c0de4fee:	b320      	cbz	r0, c0de503a <nbgl_layoutAddTopRightButton+0x72>
c0de4ff0:	2058      	movs	r0, #88	@ 0x58
c0de4ff2:	2700      	movs	r7, #0
c0de4ff4:	2503      	movs	r5, #3
c0de4ff6:	f886 a01e 	strb.w	sl, [r6, #30]
c0de4ffa:	71b0      	strb	r0, [r6, #6]
c0de4ffc:	7130      	strb	r0, [r6, #4]
c0de4ffe:	2020      	movs	r0, #32
c0de5000:	71f7      	strb	r7, [r6, #7]
c0de5002:	7177      	strb	r7, [r6, #5]
c0de5004:	76b7      	strb	r7, [r6, #26]
c0de5006:	7637      	strb	r7, [r6, #24]
c0de5008:	7777      	strb	r7, [r6, #29]
c0de500a:	f886 7021 	strb.w	r7, [r6, #33]	@ 0x21
c0de500e:	77f5      	strb	r5, [r6, #31]
c0de5010:	7670      	strb	r0, [r6, #25]
c0de5012:	75f0      	strb	r0, [r6, #23]
c0de5014:	2001      	movs	r0, #1
c0de5016:	7730      	strb	r0, [r6, #28]
c0de5018:	2004      	movs	r0, #4
c0de501a:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de501e:	2002      	movs	r0, #2
c0de5020:	f886 0020 	strb.w	r0, [r6, #32]
c0de5024:	4640      	mov	r0, r8
c0de5026:	f006 fec3 	bl	c0debdb0 <pic>
c0de502a:	4631      	mov	r1, r6
c0de502c:	0e02      	lsrs	r2, r0, #24
c0de502e:	75b5      	strb	r5, [r6, #22]
c0de5030:	f002 fcda 	bl	c0de79e8 <OUTLINED_FUNCTION_29>
c0de5034:	68a0      	ldr	r0, [r4, #8]
c0de5036:	6086      	str	r6, [r0, #8]
c0de5038:	e001      	b.n	c0de503e <nbgl_layoutAddTopRightButton+0x76>
c0de503a:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de503e:	4638      	mov	r0, r7
c0de5040:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}

c0de5044 <nbgl_layoutAddExtendedFooter>:
c0de5044:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de5048:	2800      	cmp	r0, #0
c0de504a:	f000 834d 	beq.w	c0de56e8 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de504e:	460d      	mov	r5, r1
c0de5050:	b119      	cbz	r1, c0de505a <nbgl_layoutAddExtendedFooter+0x16>
c0de5052:	4604      	mov	r4, r0
c0de5054:	7828      	ldrb	r0, [r5, #0]
c0de5056:	2806      	cmp	r0, #6
c0de5058:	d902      	bls.n	c0de5060 <nbgl_layoutAddExtendedFooter+0x1c>
c0de505a:	f06f 0701 	mvn.w	r7, #1
c0de505e:	e345      	b.n	c0de56ec <nbgl_layoutAddExtendedFooter+0x6a8>
c0de5060:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5064:	2601      	movs	r6, #1
c0de5066:	f002 fc5b 	bl	c0de7920 <OUTLINED_FUNCTION_19>
c0de506a:	f002 fd6a 	bl	c0de7b42 <OUTLINED_FUNCTION_51>
c0de506e:	6120      	str	r0, [r4, #16]
c0de5070:	f002 fd88 	bl	c0de7b84 <OUTLINED_FUNCTION_57>
c0de5074:	4601      	mov	r1, r0
c0de5076:	0a02      	lsrs	r2, r0, #8
c0de5078:	6920      	ldr	r0, [r4, #16]
c0de507a:	0e0b      	lsrs	r3, r1, #24
c0de507c:	f880 2023 	strb.w	r2, [r0, #35]	@ 0x23
c0de5080:	2208      	movs	r2, #8
c0de5082:	7582      	strb	r2, [r0, #22]
c0de5084:	4602      	mov	r2, r0
c0de5086:	f802 1f22 	strb.w	r1, [r2, #34]!
c0de508a:	0c09      	lsrs	r1, r1, #16
c0de508c:	7091      	strb	r1, [r2, #2]
c0de508e:	70d3      	strb	r3, [r2, #3]
c0de5090:	7829      	ldrb	r1, [r5, #0]
c0de5092:	2906      	cmp	r1, #6
c0de5094:	d017      	beq.n	c0de50c6 <nbgl_layoutAddExtendedFooter+0x82>
c0de5096:	2901      	cmp	r1, #1
c0de5098:	f000 80bd 	beq.w	c0de5216 <nbgl_layoutAddExtendedFooter+0x1d2>
c0de509c:	2902      	cmp	r1, #2
c0de509e:	f000 80f6 	beq.w	c0de528e <nbgl_layoutAddExtendedFooter+0x24a>
c0de50a2:	2903      	cmp	r1, #3
c0de50a4:	f000 8188 	beq.w	c0de53b8 <nbgl_layoutAddExtendedFooter+0x374>
c0de50a8:	2904      	cmp	r1, #4
c0de50aa:	f000 824c 	beq.w	c0de5546 <nbgl_layoutAddExtendedFooter+0x502>
c0de50ae:	2905      	cmp	r1, #5
c0de50b0:	f000 8268 	beq.w	c0de5584 <nbgl_layoutAddExtendedFooter+0x540>
c0de50b4:	2900      	cmp	r1, #0
c0de50b6:	d1d0      	bne.n	c0de505a <nbgl_layoutAddExtendedFooter+0x16>
c0de50b8:	88a9      	ldrh	r1, [r5, #4]
c0de50ba:	f04f 0800 	mov.w	r8, #0
c0de50be:	7181      	strb	r1, [r0, #6]
c0de50c0:	0a09      	lsrs	r1, r1, #8
c0de50c2:	71c1      	strb	r1, [r0, #7]
c0de50c4:	e2de      	b.n	c0de5684 <nbgl_layoutAddExtendedFooter+0x640>
c0de50c6:	68a8      	ldr	r0, [r5, #8]
c0de50c8:	2800      	cmp	r0, #0
c0de50ca:	f000 830d 	beq.w	c0de56e8 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de50ce:	6868      	ldr	r0, [r5, #4]
c0de50d0:	2800      	cmp	r0, #0
c0de50d2:	f000 8309 	beq.w	c0de56e8 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de50d6:	f002 fb99 	bl	c0de780c <OUTLINED_FUNCTION_8>
c0de50da:	4606      	mov	r6, r0
c0de50dc:	7c2a      	ldrb	r2, [r5, #16]
c0de50de:	7cab      	ldrb	r3, [r5, #18]
c0de50e0:	f002 fbf4 	bl	c0de78cc <OUTLINED_FUNCTION_15>
c0de50e4:	2800      	cmp	r0, #0
c0de50e6:	f000 82ff 	beq.w	c0de56e8 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de50ea:	2103      	movs	r1, #3
c0de50ec:	2208      	movs	r2, #8
c0de50ee:	f04f 0801 	mov.w	r8, #1
c0de50f2:	f04f 0a00 	mov.w	sl, #0
c0de50f6:	23a0      	movs	r3, #160	@ 0xa0
c0de50f8:	75b2      	strb	r2, [r6, #22]
c0de50fa:	77f1      	strb	r1, [r6, #31]
c0de50fc:	f880 8005 	strb.w	r8, [r0, #5]
c0de5100:	2258      	movs	r2, #88	@ 0x58
c0de5102:	7c68      	ldrb	r0, [r5, #17]
c0de5104:	71b2      	strb	r2, [r6, #6]
c0de5106:	2204      	movs	r2, #4
c0de5108:	f886 a01a 	strb.w	sl, [r6, #26]
c0de510c:	f886 a021 	strb.w	sl, [r6, #33]	@ 0x21
c0de5110:	f886 a007 	strb.w	sl, [r6, #7]
c0de5114:	f886 8005 	strb.w	r8, [r6, #5]
c0de5118:	7133      	strb	r3, [r6, #4]
c0de511a:	f886 2022 	strb.w	r2, [r6, #34]	@ 0x22
c0de511e:	2803      	cmp	r0, #3
c0de5120:	bf08      	it	eq
c0de5122:	2102      	moveq	r1, #2
c0de5124:	f886 1020 	strb.w	r1, [r6, #32]
c0de5128:	bf08      	it	eq
c0de512a:	2218      	moveq	r2, #24
c0de512c:	7672      	strb	r2, [r6, #25]
c0de512e:	f002 fced 	bl	c0de7b0c <OUTLINED_FUNCTION_46>
c0de5132:	f002 fd18 	bl	c0de7b66 <OUTLINED_FUNCTION_54>
c0de5136:	f002 fc69 	bl	c0de7a0c <OUTLINED_FUNCTION_31>
c0de513a:	f002 fbb1 	bl	c0de78a0 <OUTLINED_FUNCTION_14>
c0de513e:	200a      	movs	r0, #10
c0de5140:	77b0      	strb	r0, [r6, #30]
c0de5142:	6920      	ldr	r0, [r4, #16]
c0de5144:	f002 fae4 	bl	c0de7710 <OUTLINED_FUNCTION_0>
c0de5148:	7c68      	ldrb	r0, [r5, #17]
c0de514a:	b308      	cbz	r0, c0de5190 <nbgl_layoutAddExtendedFooter+0x14c>
c0de514c:	2803      	cmp	r0, #3
c0de514e:	d01f      	beq.n	c0de5190 <nbgl_layoutAddExtendedFooter+0x14c>
c0de5150:	f002 fbfe 	bl	c0de7950 <OUTLINED_FUNCTION_21>
c0de5154:	0a31      	lsrs	r1, r6, #8
c0de5156:	0e32      	lsrs	r2, r6, #24
c0de5158:	74c1      	strb	r1, [r0, #19]
c0de515a:	4601      	mov	r1, r0
c0de515c:	f801 6f12 	strb.w	r6, [r1, #18]!
c0de5160:	70ca      	strb	r2, [r1, #3]
c0de5162:	0c32      	lsrs	r2, r6, #16
c0de5164:	708a      	strb	r2, [r1, #2]
c0de5166:	6921      	ldr	r1, [r4, #16]
c0de5168:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de516c:	784e      	ldrb	r6, [r1, #1]
c0de516e:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de5172:	788f      	ldrb	r7, [r1, #2]
c0de5174:	78c9      	ldrb	r1, [r1, #3]
c0de5176:	ea42 2206 	orr.w	r2, r2, r6, lsl #8
c0de517a:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de517e:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de5182:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
c0de5186:	2102      	movs	r1, #2
c0de5188:	7581      	strb	r1, [r0, #22]
c0de518a:	6920      	ldr	r0, [r4, #16]
c0de518c:	f002 fac0 	bl	c0de7710 <OUTLINED_FUNCTION_0>
c0de5190:	f002 fb3c 	bl	c0de780c <OUTLINED_FUNCTION_8>
c0de5194:	4606      	mov	r6, r0
c0de5196:	7c2a      	ldrb	r2, [r5, #16]
c0de5198:	7cab      	ldrb	r3, [r5, #18]
c0de519a:	f002 fb97 	bl	c0de78cc <OUTLINED_FUNCTION_15>
c0de519e:	2800      	cmp	r0, #0
c0de51a0:	f000 82a2 	beq.w	c0de56e8 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de51a4:	2118      	movs	r1, #24
c0de51a6:	f04f 0a00 	mov.w	sl, #0
c0de51aa:	f04f 0801 	mov.w	r8, #1
c0de51ae:	7671      	strb	r1, [r6, #25]
c0de51b0:	2102      	movs	r1, #2
c0de51b2:	f886 a01a 	strb.w	sl, [r6, #26]
c0de51b6:	f880 a005 	strb.w	sl, [r0, #5]
c0de51ba:	75b1      	strb	r1, [r6, #22]
c0de51bc:	2104      	movs	r1, #4
c0de51be:	7c68      	ldrb	r0, [r5, #17]
c0de51c0:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de51c4:	2158      	movs	r1, #88	@ 0x58
c0de51c6:	f886 8005 	strb.w	r8, [r6, #5]
c0de51ca:	f886 a007 	strb.w	sl, [r6, #7]
c0de51ce:	71b1      	strb	r1, [r6, #6]
c0de51d0:	21a0      	movs	r1, #160	@ 0xa0
c0de51d2:	7131      	strb	r1, [r6, #4]
c0de51d4:	2100      	movs	r1, #0
c0de51d6:	2802      	cmp	r0, #2
c0de51d8:	bf08      	it	eq
c0de51da:	2103      	moveq	r1, #3
c0de51dc:	77f1      	strb	r1, [r6, #31]
c0de51de:	1e81      	subs	r1, r0, #2
c0de51e0:	bf18      	it	ne
c0de51e2:	2103      	movne	r1, #3
c0de51e4:	3802      	subs	r0, #2
c0de51e6:	f886 1021 	strb.w	r1, [r6, #33]	@ 0x21
c0de51ea:	fab0 f080 	clz	r0, r0
c0de51ee:	0940      	lsrs	r0, r0, #5
c0de51f0:	0040      	lsls	r0, r0, #1
c0de51f2:	f886 0020 	strb.w	r0, [r6, #32]
c0de51f6:	f002 fbb0 	bl	c0de795a <OUTLINED_FUNCTION_22>
c0de51fa:	4631      	mov	r1, r6
c0de51fc:	0e02      	lsrs	r2, r0, #24
c0de51fe:	f801 0f25 	strb.w	r0, [r1, #37]!
c0de5202:	f002 fcaa 	bl	c0de7b5a <OUTLINED_FUNCTION_53>
c0de5206:	7c68      	ldrb	r0, [r5, #17]
c0de5208:	2800      	cmp	r0, #0
c0de520a:	f000 828e 	beq.w	c0de572a <nbgl_layoutAddExtendedFooter+0x6e6>
c0de520e:	68e8      	ldr	r0, [r5, #12]
c0de5210:	f006 fdce 	bl	c0debdb0 <pic>
c0de5214:	e28a      	b.n	c0de572c <nbgl_layoutAddExtendedFooter+0x6e8>
c0de5216:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de521a:	f002 fa7f 	bl	c0de771c <OUTLINED_FUNCTION_1>
c0de521e:	4606      	mov	r6, r0
c0de5220:	7a6a      	ldrb	r2, [r5, #9]
c0de5222:	7aab      	ldrb	r3, [r5, #10]
c0de5224:	f002 fb52 	bl	c0de78cc <OUTLINED_FUNCTION_15>
c0de5228:	2800      	cmp	r0, #0
c0de522a:	f000 825d 	beq.w	c0de56e8 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de522e:	2008      	movs	r0, #8
c0de5230:	4637      	mov	r7, r6
c0de5232:	f04f 0a01 	mov.w	sl, #1
c0de5236:	21a0      	movs	r1, #160	@ 0xa0
c0de5238:	f04f 0800 	mov.w	r8, #0
c0de523c:	75b0      	strb	r0, [r6, #22]
c0de523e:	7a28      	ldrb	r0, [r5, #8]
c0de5240:	f886 a005 	strb.w	sl, [r6, #5]
c0de5244:	7131      	strb	r1, [r6, #4]
c0de5246:	77f0      	strb	r0, [r6, #31]
c0de5248:	2060      	movs	r0, #96	@ 0x60
c0de524a:	f807 0f06 	strb.w	r0, [r7, #6]!
c0de524e:	f887 8001 	strb.w	r8, [r7, #1]
c0de5252:	f002 fb82 	bl	c0de795a <OUTLINED_FUNCTION_22>
c0de5256:	4631      	mov	r1, r6
c0de5258:	0e02      	lsrs	r2, r0, #24
c0de525a:	f002 fb06 	bl	c0de786a <OUTLINED_FUNCTION_12>
c0de525e:	7a29      	ldrb	r1, [r5, #8]
c0de5260:	f886 801d 	strb.w	r8, [r6, #29]
c0de5264:	f886 a01e 	strb.w	sl, [r6, #30]
c0de5268:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de526c:	2005      	movs	r0, #5
c0de526e:	f886 a01c 	strb.w	sl, [r6, #28]
c0de5272:	f886 0020 	strb.w	r0, [r6, #32]
c0de5276:	200b      	movs	r0, #11
c0de5278:	2900      	cmp	r1, #0
c0de527a:	bf08      	it	eq
c0de527c:	200c      	moveq	r0, #12
c0de527e:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de5282:	6922      	ldr	r2, [r4, #16]
c0de5284:	7879      	ldrb	r1, [r7, #1]
c0de5286:	7838      	ldrb	r0, [r7, #0]
c0de5288:	f002 fc88 	bl	c0de7b9c <OUTLINED_FUNCTION_59>
c0de528c:	e1fa      	b.n	c0de5684 <nbgl_layoutAddExtendedFooter+0x640>
c0de528e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5292:	f002 fa43 	bl	c0de771c <OUTLINED_FUNCTION_1>
c0de5296:	4606      	mov	r6, r0
c0de5298:	7b2a      	ldrb	r2, [r5, #12]
c0de529a:	7bab      	ldrb	r3, [r5, #14]
c0de529c:	f002 fb16 	bl	c0de78cc <OUTLINED_FUNCTION_15>
c0de52a0:	2800      	cmp	r0, #0
c0de52a2:	f000 8221 	beq.w	c0de56e8 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de52a6:	2007      	movs	r0, #7
c0de52a8:	f04f 0a00 	mov.w	sl, #0
c0de52ac:	f04f 08d0 	mov.w	r8, #208	@ 0xd0
c0de52b0:	75b0      	strb	r0, [r6, #22]
c0de52b2:	2060      	movs	r0, #96	@ 0x60
c0de52b4:	f886 a01f 	strb.w	sl, [r6, #31]
c0de52b8:	f886 a007 	strb.w	sl, [r6, #7]
c0de52bc:	f886 a005 	strb.w	sl, [r6, #5]
c0de52c0:	f886 8004 	strb.w	r8, [r6, #4]
c0de52c4:	71b0      	strb	r0, [r6, #6]
c0de52c6:	f002 fb48 	bl	c0de795a <OUTLINED_FUNCTION_22>
c0de52ca:	4631      	mov	r1, r6
c0de52cc:	0e02      	lsrs	r2, r0, #24
c0de52ce:	f04f 0b01 	mov.w	fp, #1
c0de52d2:	f886 a01d 	strb.w	sl, [r6, #29]
c0de52d6:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de52da:	f886 b01e 	strb.w	fp, [r6, #30]
c0de52de:	f002 fb74 	bl	c0de79ca <OUTLINED_FUNCTION_28>
c0de52e2:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de52e6:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de52ea:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de52ee:	f840 6022 	str.w	r6, [r0, r2, lsl #2]
c0de52f2:	f002 fbdb 	bl	c0de7aac <OUTLINED_FUNCTION_41>
c0de52f6:	f886 0020 	strb.w	r0, [r6, #32]
c0de52fa:	6920      	ldr	r0, [r4, #16]
c0de52fc:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de5300:	3101      	adds	r1, #1
c0de5302:	f880 1020 	strb.w	r1, [r0, #32]
c0de5306:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de530a:	f002 fa07 	bl	c0de771c <OUTLINED_FUNCTION_1>
c0de530e:	4606      	mov	r6, r0
c0de5310:	7b6a      	ldrb	r2, [r5, #13]
c0de5312:	7bab      	ldrb	r3, [r5, #14]
c0de5314:	f002 fada 	bl	c0de78cc <OUTLINED_FUNCTION_15>
c0de5318:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de531c:	2800      	cmp	r0, #0
c0de531e:	f000 81e5 	beq.w	c0de56ec <nbgl_layoutAddExtendedFooter+0x6a8>
c0de5322:	2009      	movs	r0, #9
c0de5324:	f886 8004 	strb.w	r8, [r6, #4]
c0de5328:	46b0      	mov	r8, r6
c0de532a:	f886 a01f 	strb.w	sl, [r6, #31]
c0de532e:	f886 a005 	strb.w	sl, [r6, #5]
c0de5332:	75b0      	strb	r0, [r6, #22]
c0de5334:	2060      	movs	r0, #96	@ 0x60
c0de5336:	f808 0f06 	strb.w	r0, [r8, #6]!
c0de533a:	f888 a001 	strb.w	sl, [r8, #1]
c0de533e:	f002 fbe5 	bl	c0de7b0c <OUTLINED_FUNCTION_46>
c0de5342:	f002 fc10 	bl	c0de7b66 <OUTLINED_FUNCTION_54>
c0de5346:	f002 fa90 	bl	c0de786a <OUTLINED_FUNCTION_12>
c0de534a:	f898 1001 	ldrb.w	r1, [r8, #1]
c0de534e:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de5352:	f002 fbab 	bl	c0de7aac <OUTLINED_FUNCTION_41>
c0de5356:	6922      	ldr	r2, [r4, #16]
c0de5358:	f886 0020 	strb.w	r0, [r6, #32]
c0de535c:	2003      	movs	r0, #3
c0de535e:	77b0      	strb	r0, [r6, #30]
c0de5360:	f898 0000 	ldrb.w	r0, [r8]
c0de5364:	f002 fc1a 	bl	c0de7b9c <OUTLINED_FUNCTION_59>
c0de5368:	f002 fc12 	bl	c0de7b90 <OUTLINED_FUNCTION_58>
c0de536c:	4680      	mov	r8, r0
c0de536e:	f880 a005 	strb.w	sl, [r0, #5]
c0de5372:	f880 b004 	strb.w	fp, [r0, #4]
c0de5376:	20ff      	movs	r0, #255	@ 0xff
c0de5378:	0e31      	lsrs	r1, r6, #24
c0de537a:	f888 0018 	strb.w	r0, [r8, #24]
c0de537e:	0a30      	lsrs	r0, r6, #8
c0de5380:	f888 7017 	strb.w	r7, [r8, #23]
c0de5384:	f888 b021 	strb.w	fp, [r8, #33]	@ 0x21
c0de5388:	f888 a01f 	strb.w	sl, [r8, #31]
c0de538c:	f888 0013 	strb.w	r0, [r8, #19]
c0de5390:	2002      	movs	r0, #2
c0de5392:	f888 0020 	strb.w	r0, [r8, #32]
c0de5396:	2004      	movs	r0, #4
c0de5398:	f888 0016 	strb.w	r0, [r8, #22]
c0de539c:	4640      	mov	r0, r8
c0de539e:	f800 6f12 	strb.w	r6, [r0, #18]!
c0de53a2:	70c1      	strb	r1, [r0, #3]
c0de53a4:	0c31      	lsrs	r1, r6, #16
c0de53a6:	7081      	strb	r1, [r0, #2]
c0de53a8:	6920      	ldr	r0, [r4, #16]
c0de53aa:	7981      	ldrb	r1, [r0, #6]
c0de53ac:	79c0      	ldrb	r0, [r0, #7]
c0de53ae:	f888 0007 	strb.w	r0, [r8, #7]
c0de53b2:	f888 1006 	strb.w	r1, [r8, #6]
c0de53b6:	e165      	b.n	c0de5684 <nbgl_layoutAddExtendedFooter+0x640>
c0de53b8:	f04f 0b00 	mov.w	fp, #0
c0de53bc:	2760      	movs	r7, #96	@ 0x60
c0de53be:	f880 b007 	strb.w	fp, [r0, #7]
c0de53c2:	7187      	strb	r7, [r0, #6]
c0de53c4:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de53c8:	f002 f9a8 	bl	c0de771c <OUTLINED_FUNCTION_1>
c0de53cc:	4606      	mov	r6, r0
c0de53ce:	7d2a      	ldrb	r2, [r5, #20]
c0de53d0:	7d6b      	ldrb	r3, [r5, #21]
c0de53d2:	f002 fa7b 	bl	c0de78cc <OUTLINED_FUNCTION_15>
c0de53d6:	2800      	cmp	r0, #0
c0de53d8:	f000 8186 	beq.w	c0de56e8 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de53dc:	1d28      	adds	r0, r5, #4
c0de53de:	46b0      	mov	r8, r6
c0de53e0:	f886 b01f 	strb.w	fp, [r6, #31]
c0de53e4:	f886 b007 	strb.w	fp, [r6, #7]
c0de53e8:	71b7      	strb	r7, [r6, #6]
c0de53ea:	9001      	str	r0, [sp, #4]
c0de53ec:	2007      	movs	r0, #7
c0de53ee:	75b0      	strb	r0, [r6, #22]
c0de53f0:	20c0      	movs	r0, #192	@ 0xc0
c0de53f2:	f808 0f04 	strb.w	r0, [r8, #4]!
c0de53f6:	f888 b001 	strb.w	fp, [r8, #1]
c0de53fa:	6928      	ldr	r0, [r5, #16]
c0de53fc:	f006 fcd8 	bl	c0debdb0 <pic>
c0de5400:	4631      	mov	r1, r6
c0de5402:	0e02      	lsrs	r2, r0, #24
c0de5404:	f886 b01d 	strb.w	fp, [r6, #29]
c0de5408:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de540c:	f002 fadd 	bl	c0de79ca <OUTLINED_FUNCTION_28>
c0de5410:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de5414:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de5418:	2701      	movs	r7, #1
c0de541a:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de541e:	77b7      	strb	r7, [r6, #30]
c0de5420:	f840 6022 	str.w	r6, [r0, r2, lsl #2]
c0de5424:	200c      	movs	r0, #12
c0de5426:	7737      	strb	r7, [r6, #28]
c0de5428:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de542c:	2005      	movs	r0, #5
c0de542e:	f886 0020 	strb.w	r0, [r6, #32]
c0de5432:	6920      	ldr	r0, [r4, #16]
c0de5434:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de5438:	3101      	adds	r1, #1
c0de543a:	f880 1020 	strb.w	r1, [r0, #32]
c0de543e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5442:	f002 fa6d 	bl	c0de7920 <OUTLINED_FUNCTION_19>
c0de5446:	4682      	mov	sl, r0
c0de5448:	2004      	movs	r0, #4
c0de544a:	f88a 0020 	strb.w	r0, [sl, #32]
c0de544e:	20a0      	movs	r0, #160	@ 0xa0
c0de5450:	4656      	mov	r6, sl
c0de5452:	f88a b01f 	strb.w	fp, [sl, #31]
c0de5456:	f806 0f04 	strb.w	r0, [r6, #4]!
c0de545a:	7077      	strb	r7, [r6, #1]
c0de545c:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5460:	f002 fb8c 	bl	c0de7b7c <OUTLINED_FUNCTION_56>
c0de5464:	2109      	movs	r1, #9
c0de5466:	0e02      	lsrs	r2, r0, #24
c0de5468:	f88a b007 	strb.w	fp, [sl, #7]
c0de546c:	f88a 1016 	strb.w	r1, [sl, #22]
c0de5470:	2160      	movs	r1, #96	@ 0x60
c0de5472:	f88a 1006 	strb.w	r1, [sl, #6]
c0de5476:	4651      	mov	r1, sl
c0de5478:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de547c:	f002 fa3f 	bl	c0de78fe <OUTLINED_FUNCTION_17>
c0de5480:	f88a 0023 	strb.w	r0, [sl, #35]	@ 0x23
c0de5484:	f898 0000 	ldrb.w	r0, [r8]
c0de5488:	f898 1001 	ldrb.w	r1, [r8, #1]
c0de548c:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de5490:	9901      	ldr	r1, [sp, #4]
c0de5492:	f5c0 70f0 	rsb	r0, r0, #480	@ 0x1e0
c0de5496:	7030      	strb	r0, [r6, #0]
c0de5498:	0a00      	lsrs	r0, r0, #8
c0de549a:	7070      	strb	r0, [r6, #1]
c0de549c:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de54a0:	08c2      	lsrs	r2, r0, #3
c0de54a2:	4650      	mov	r0, sl
c0de54a4:	f002 fc50 	bl	c0de7d48 <layoutNavigationPopulate>
c0de54a8:	792a      	ldrb	r2, [r5, #4]
c0de54aa:	7b2b      	ldrb	r3, [r5, #12]
c0de54ac:	4620      	mov	r0, r4
c0de54ae:	4651      	mov	r1, sl
c0de54b0:	f7fe ffa4 	bl	c0de43fc <layoutAddCallbackObj>
c0de54b4:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de54b8:	2800      	cmp	r0, #0
c0de54ba:	f000 8117 	beq.w	c0de56ec <nbgl_layoutAddExtendedFooter+0x6a8>
c0de54be:	f002 fb67 	bl	c0de7b90 <OUTLINED_FUNCTION_58>
c0de54c2:	4680      	mov	r8, r0
c0de54c4:	2002      	movs	r0, #2
c0de54c6:	2101      	movs	r1, #1
c0de54c8:	f888 0020 	strb.w	r0, [r8, #32]
c0de54cc:	2000      	movs	r0, #0
c0de54ce:	f888 1004 	strb.w	r1, [r8, #4]
c0de54d2:	f888 1021 	strb.w	r1, [r8, #33]	@ 0x21
c0de54d6:	ea4f 611a 	mov.w	r1, sl, lsr #24
c0de54da:	f888 7017 	strb.w	r7, [r8, #23]
c0de54de:	f888 0005 	strb.w	r0, [r8, #5]
c0de54e2:	f888 001f 	strb.w	r0, [r8, #31]
c0de54e6:	2004      	movs	r0, #4
c0de54e8:	f888 0016 	strb.w	r0, [r8, #22]
c0de54ec:	20ff      	movs	r0, #255	@ 0xff
c0de54ee:	f888 0018 	strb.w	r0, [r8, #24]
c0de54f2:	ea4f 201a 	mov.w	r0, sl, lsr #8
c0de54f6:	f888 0013 	strb.w	r0, [r8, #19]
c0de54fa:	4640      	mov	r0, r8
c0de54fc:	f800 af12 	strb.w	sl, [r0, #18]!
c0de5500:	70c1      	strb	r1, [r0, #3]
c0de5502:	ea4f 411a 	mov.w	r1, sl, lsr #16
c0de5506:	7081      	strb	r1, [r0, #2]
c0de5508:	6920      	ldr	r0, [r4, #16]
c0de550a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de550e:	f810 3c1b 	ldrb.w	r3, [r0, #-27]
c0de5512:	f810 2c1c 	ldrb.w	r2, [r0, #-28]
c0de5516:	7847      	ldrb	r7, [r0, #1]
c0de5518:	f810 6c02 	ldrb.w	r6, [r0, #-2]
c0de551c:	f888 3007 	strb.w	r3, [r8, #7]
c0de5520:	f888 2006 	strb.w	r2, [r8, #6]
c0de5524:	ea41 2107 	orr.w	r1, r1, r7, lsl #8
c0de5528:	79aa      	ldrb	r2, [r5, #6]
c0de552a:	f884 20a9 	strb.w	r2, [r4, #169]	@ 0xa9
c0de552e:	78c2      	ldrb	r2, [r0, #3]
c0de5530:	7880      	ldrb	r0, [r0, #2]
c0de5532:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de5536:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de553a:	7969      	ldrb	r1, [r5, #5]
c0de553c:	f840 a026 	str.w	sl, [r0, r6, lsl #2]
c0de5540:	f884 10a8 	strb.w	r1, [r4, #168]	@ 0xa8
c0de5544:	e09b      	b.n	c0de567e <nbgl_layoutAddExtendedFooter+0x63a>
c0de5546:	2100      	movs	r1, #0
c0de5548:	71c1      	strb	r1, [r0, #7]
c0de554a:	2160      	movs	r1, #96	@ 0x60
c0de554c:	7181      	strb	r1, [r0, #6]
c0de554e:	1d29      	adds	r1, r5, #4
c0de5550:	f894 20ad 	ldrb.w	r2, [r4, #173]	@ 0xad
c0de5554:	08d2      	lsrs	r2, r2, #3
c0de5556:	f002 fbf7 	bl	c0de7d48 <layoutNavigationPopulate>
c0de555a:	6921      	ldr	r1, [r4, #16]
c0de555c:	2004      	movs	r0, #4
c0de555e:	f881 0020 	strb.w	r0, [r1, #32]
c0de5562:	4620      	mov	r0, r4
c0de5564:	792a      	ldrb	r2, [r5, #4]
c0de5566:	7b2b      	ldrb	r3, [r5, #12]
c0de5568:	f7fe ff48 	bl	c0de43fc <layoutAddCallbackObj>
c0de556c:	2800      	cmp	r0, #0
c0de556e:	f000 80bb 	beq.w	c0de56e8 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de5572:	79a8      	ldrb	r0, [r5, #6]
c0de5574:	f04f 0800 	mov.w	r8, #0
c0de5578:	f884 00a9 	strb.w	r0, [r4, #169]	@ 0xa9
c0de557c:	7968      	ldrb	r0, [r5, #5]
c0de557e:	f884 00a8 	strb.w	r0, [r4, #168]	@ 0xa8
c0de5582:	e07f      	b.n	c0de5684 <nbgl_layoutAddExtendedFooter+0x640>
c0de5584:	f002 f942 	bl	c0de780c <OUTLINED_FUNCTION_8>
c0de5588:	4607      	mov	r7, r0
c0de558a:	7b2a      	ldrb	r2, [r5, #12]
c0de558c:	7c2b      	ldrb	r3, [r5, #16]
c0de558e:	4620      	mov	r0, r4
c0de5590:	4639      	mov	r1, r7
c0de5592:	f7fe ff33 	bl	c0de43fc <layoutAddCallbackObj>
c0de5596:	2800      	cmp	r0, #0
c0de5598:	f000 80a6 	beq.w	c0de56e8 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de559c:	2018      	movs	r0, #24
c0de559e:	f04f 0800 	mov.w	r8, #0
c0de55a2:	2100      	movs	r1, #0
c0de55a4:	7678      	strb	r0, [r7, #25]
c0de55a6:	2008      	movs	r0, #8
c0de55a8:	f887 801a 	strb.w	r8, [r7, #26]
c0de55ac:	75b8      	strb	r0, [r7, #22]
c0de55ae:	7b68      	ldrb	r0, [r5, #13]
c0de55b0:	2800      	cmp	r0, #0
c0de55b2:	bf08      	it	eq
c0de55b4:	2103      	moveq	r1, #3
c0de55b6:	f887 1021 	strb.w	r1, [r7, #33]	@ 0x21
c0de55ba:	bf18      	it	ne
c0de55bc:	2003      	movne	r0, #3
c0de55be:	77f8      	strb	r0, [r7, #31]
c0de55c0:	7b68      	ldrb	r0, [r5, #13]
c0de55c2:	4601      	mov	r1, r0
c0de55c4:	2800      	cmp	r0, #0
c0de55c6:	bf18      	it	ne
c0de55c8:	2101      	movne	r1, #1
c0de55ca:	0049      	lsls	r1, r1, #1
c0de55cc:	2802      	cmp	r0, #2
c0de55ce:	bf08      	it	eq
c0de55d0:	2103      	moveq	r1, #3
c0de55d2:	f887 1020 	strb.w	r1, [r7, #32]
c0de55d6:	f002 f9c0 	bl	c0de795a <OUTLINED_FUNCTION_22>
c0de55da:	463e      	mov	r6, r7
c0de55dc:	210c      	movs	r1, #12
c0de55de:	f887 1023 	strb.w	r1, [r7, #35]	@ 0x23
c0de55e2:	f806 0f25 	strb.w	r0, [r6, #37]!
c0de55e6:	0e01      	lsrs	r1, r0, #24
c0de55e8:	70f1      	strb	r1, [r6, #3]
c0de55ea:	0c01      	lsrs	r1, r0, #16
c0de55ec:	0a00      	lsrs	r0, r0, #8
c0de55ee:	70b1      	strb	r1, [r6, #2]
c0de55f0:	f887 0026 	strb.w	r0, [r7, #38]	@ 0x26
c0de55f4:	f002 fa8a 	bl	c0de7b0c <OUTLINED_FUNCTION_46>
c0de55f8:	2104      	movs	r1, #4
c0de55fa:	0e02      	lsrs	r2, r0, #24
c0de55fc:	f887 8007 	strb.w	r8, [r7, #7]
c0de5600:	f887 1022 	strb.w	r1, [r7, #34]	@ 0x22
c0de5604:	2158      	movs	r1, #88	@ 0x58
c0de5606:	71b9      	strb	r1, [r7, #6]
c0de5608:	4639      	mov	r1, r7
c0de560a:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de560e:	f002 f976 	bl	c0de78fe <OUTLINED_FUNCTION_17>
c0de5612:	f887 002f 	strb.w	r0, [r7, #47]	@ 0x2f
c0de5616:	2188      	movs	r1, #136	@ 0x88
c0de5618:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de561c:	6920      	ldr	r0, [r4, #16]
c0de561e:	f880 8007 	strb.w	r8, [r0, #7]
c0de5622:	7181      	strb	r1, [r0, #6]
c0de5624:	6869      	ldr	r1, [r5, #4]
c0de5626:	2900      	cmp	r1, #0
c0de5628:	bf08      	it	eq
c0de562a:	2258      	moveq	r2, #88	@ 0x58
c0de562c:	713a      	strb	r2, [r7, #4]
c0de562e:	f896 c000 	ldrb.w	ip, [r6]
c0de5632:	f896 e002 	ldrb.w	lr, [r6, #2]
c0de5636:	f896 a003 	ldrb.w	sl, [r6, #3]
c0de563a:	f887 801d 	strb.w	r8, [r7, #29]
c0de563e:	0a11      	lsrs	r1, r2, #8
c0de5640:	7179      	strb	r1, [r7, #5]
c0de5642:	f810 6f22 	ldrb.w	r6, [r0, #34]!
c0de5646:	7842      	ldrb	r2, [r0, #1]
c0de5648:	f810 1c02 	ldrb.w	r1, [r0, #-2]
c0de564c:	7883      	ldrb	r3, [r0, #2]
c0de564e:	78c0      	ldrb	r0, [r0, #3]
c0de5650:	ea46 2202 	orr.w	r2, r6, r2, lsl #8
c0de5654:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de5658:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de565c:	f897 2026 	ldrb.w	r2, [r7, #38]	@ 0x26
c0de5660:	f840 7021 	str.w	r7, [r0, r1, lsl #2]
c0de5664:	2001      	movs	r0, #1
c0de5666:	ea4e 210a 	orr.w	r1, lr, sl, lsl #8
c0de566a:	7738      	strb	r0, [r7, #28]
c0de566c:	ea4c 2002 	orr.w	r0, ip, r2, lsl #8
c0de5670:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de5674:	2107      	movs	r1, #7
c0de5676:	2800      	cmp	r0, #0
c0de5678:	bf08      	it	eq
c0de567a:	2101      	moveq	r1, #1
c0de567c:	77b9      	strb	r1, [r7, #30]
c0de567e:	6920      	ldr	r0, [r4, #16]
c0de5680:	f002 f846 	bl	c0de7710 <OUTLINED_FUNCTION_0>
c0de5684:	7828      	ldrb	r0, [r5, #0]
c0de5686:	3803      	subs	r0, #3
c0de5688:	2801      	cmp	r0, #1
c0de568a:	d808      	bhi.n	c0de569e <nbgl_layoutAddExtendedFooter+0x65a>
c0de568c:	7b28      	ldrb	r0, [r5, #12]
c0de568e:	792b      	ldrb	r3, [r5, #4]
c0de5690:	f44f 61c0 	mov.w	r1, #1536	@ 0x600
c0de5694:	2200      	movs	r2, #0
c0de5696:	9000      	str	r0, [sp, #0]
c0de5698:	4620      	mov	r0, r4
c0de569a:	f7ff fc7a 	bl	c0de4f92 <addSwipeInternal>
c0de569e:	7868      	ldrb	r0, [r5, #1]
c0de56a0:	b1b0      	cbz	r0, c0de56d0 <nbgl_layoutAddExtendedFooter+0x68c>
c0de56a2:	f002 f955 	bl	c0de7950 <OUTLINED_FUNCTION_21>
c0de56a6:	6921      	ldr	r1, [r4, #16]
c0de56a8:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de56ac:	784e      	ldrb	r6, [r1, #1]
c0de56ae:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de56b2:	788f      	ldrb	r7, [r1, #2]
c0de56b4:	78c9      	ldrb	r1, [r1, #3]
c0de56b6:	ea42 2206 	orr.w	r2, r2, r6, lsl #8
c0de56ba:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de56be:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de56c2:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
c0de56c6:	2102      	movs	r1, #2
c0de56c8:	7581      	strb	r1, [r0, #22]
c0de56ca:	6920      	ldr	r0, [r4, #16]
c0de56cc:	f002 f820 	bl	c0de7710 <OUTLINED_FUNCTION_0>
c0de56d0:	f1b8 0f00 	cmp.w	r8, #0
c0de56d4:	d00d      	beq.n	c0de56f2 <nbgl_layoutAddExtendedFooter+0x6ae>
c0de56d6:	6920      	ldr	r0, [r4, #16]
c0de56d8:	f002 f874 	bl	c0de77c4 <OUTLINED_FUNCTION_6>
c0de56dc:	f840 8022 	str.w	r8, [r0, r2, lsl #2]
c0de56e0:	6920      	ldr	r0, [r4, #16]
c0de56e2:	f002 f815 	bl	c0de7710 <OUTLINED_FUNCTION_0>
c0de56e6:	e005      	b.n	c0de56f4 <nbgl_layoutAddExtendedFooter+0x6b0>
c0de56e8:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de56ec:	4638      	mov	r0, r7
c0de56ee:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de56f2:	6920      	ldr	r0, [r4, #16]
c0de56f4:	68a1      	ldr	r1, [r4, #8]
c0de56f6:	60c8      	str	r0, [r1, #12]
c0de56f8:	6920      	ldr	r0, [r4, #16]
c0de56fa:	f8d4 10a0 	ldr.w	r1, [r4, #160]	@ 0xa0
c0de56fe:	f810 2f06 	ldrb.w	r2, [r0, #6]!
c0de5702:	7843      	ldrb	r3, [r0, #1]
c0de5704:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5708:	f811 3f06 	ldrb.w	r3, [r1, #6]!
c0de570c:	784e      	ldrb	r6, [r1, #1]
c0de570e:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de5712:	1a9a      	subs	r2, r3, r2
c0de5714:	700a      	strb	r2, [r1, #0]
c0de5716:	0a12      	lsrs	r2, r2, #8
c0de5718:	704a      	strb	r2, [r1, #1]
c0de571a:	7829      	ldrb	r1, [r5, #0]
c0de571c:	f884 10ab 	strb.w	r1, [r4, #171]	@ 0xab
c0de5720:	7801      	ldrb	r1, [r0, #0]
c0de5722:	7840      	ldrb	r0, [r0, #1]
c0de5724:	ea41 2700 	orr.w	r7, r1, r0, lsl #8
c0de5728:	e7e0      	b.n	c0de56ec <nbgl_layoutAddExtendedFooter+0x6a8>
c0de572a:	2000      	movs	r0, #0
c0de572c:	f002 fa1b 	bl	c0de7b66 <OUTLINED_FUNCTION_54>
c0de5730:	f002 f95a 	bl	c0de79e8 <OUTLINED_FUNCTION_29>
c0de5734:	f002 f8b4 	bl	c0de78a0 <OUTLINED_FUNCTION_14>
c0de5738:	2009      	movs	r0, #9
c0de573a:	77b0      	strb	r0, [r6, #30]
c0de573c:	6920      	ldr	r0, [r4, #16]
c0de573e:	f001 ffe7 	bl	c0de7710 <OUTLINED_FUNCTION_0>
c0de5742:	7c69      	ldrb	r1, [r5, #17]
c0de5744:	2903      	cmp	r1, #3
c0de5746:	d004      	beq.n	c0de5752 <nbgl_layoutAddExtendedFooter+0x70e>
c0de5748:	b919      	cbnz	r1, c0de5752 <nbgl_layoutAddExtendedFooter+0x70e>
c0de574a:	f04f 0800 	mov.w	r8, #0
c0de574e:	21d0      	movs	r1, #208	@ 0xd0
c0de5750:	e002      	b.n	c0de5758 <nbgl_layoutAddExtendedFooter+0x714>
c0de5752:	f04f 0800 	mov.w	r8, #0
c0de5756:	21e8      	movs	r1, #232	@ 0xe8
c0de5758:	f880 8007 	strb.w	r8, [r0, #7]
c0de575c:	7181      	strb	r1, [r0, #6]
c0de575e:	e791      	b.n	c0de5684 <nbgl_layoutAddExtendedFooter+0x640>

c0de5760 <nbgl_layoutAddBottomButton>:
c0de5760:	b570      	push	{r4, r5, r6, lr}
c0de5762:	b086      	sub	sp, #24
c0de5764:	4605      	mov	r5, r0
c0de5766:	2005      	movs	r0, #5
c0de5768:	2600      	movs	r6, #0
c0de576a:	4614      	mov	r4, r2
c0de576c:	f88d 3001 	strb.w	r3, [sp, #1]
c0de5770:	f88d 0000 	strb.w	r0, [sp]
c0de5774:	4608      	mov	r0, r1
c0de5776:	f88d 600e 	strb.w	r6, [sp, #14]
c0de577a:	f006 fb19 	bl	c0debdb0 <pic>
c0de577e:	9002      	str	r0, [sp, #8]
c0de5780:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de5782:	4669      	mov	r1, sp
c0de5784:	f88d 400c 	strb.w	r4, [sp, #12]
c0de5788:	9601      	str	r6, [sp, #4]
c0de578a:	f88d 0010 	strb.w	r0, [sp, #16]
c0de578e:	2001      	movs	r0, #1
c0de5790:	f88d 000d 	strb.w	r0, [sp, #13]
c0de5794:	4628      	mov	r0, r5
c0de5796:	f7ff fc55 	bl	c0de5044 <nbgl_layoutAddExtendedFooter>
c0de579a:	b006      	add	sp, #24
c0de579c:	bd70      	pop	{r4, r5, r6, pc}

c0de579e <nbgl_layoutAddTouchableBar>:
c0de579e:	b5b0      	push	{r4, r5, r7, lr}
c0de57a0:	b088      	sub	sp, #32
c0de57a2:	460d      	mov	r5, r1
c0de57a4:	4604      	mov	r4, r0
c0de57a6:	a801      	add	r0, sp, #4
c0de57a8:	211c      	movs	r1, #28
c0de57aa:	f006 fd23 	bl	c0dec1f4 <__aeabi_memclr>
c0de57ae:	b1dc      	cbz	r4, c0de57e8 <nbgl_layoutAddTouchableBar+0x4a>
c0de57b0:	e895 000f 	ldmia.w	r5, {r0, r1, r2, r3}
c0de57b4:	e9cd 1304 	strd	r1, r3, [sp, #16]
c0de57b8:	e9cd 0202 	strd	r0, r2, [sp, #8]
c0de57bc:	7c68      	ldrb	r0, [r5, #17]
c0de57be:	f88d 0018 	strb.w	r0, [sp, #24]
c0de57c2:	7d28      	ldrb	r0, [r5, #20]
c0de57c4:	f88d 001c 	strb.w	r0, [sp, #28]
c0de57c8:	7c28      	ldrb	r0, [r5, #16]
c0de57ca:	f88d 001a 	strb.w	r0, [sp, #26]
c0de57ce:	7ca8      	ldrb	r0, [r5, #18]
c0de57d0:	f080 0001 	eor.w	r0, r0, #1
c0de57d4:	f88d 0019 	strb.w	r0, [sp, #25]
c0de57d8:	a901      	add	r1, sp, #4
c0de57da:	4620      	mov	r0, r4
c0de57dc:	f000 f808 	bl	c0de57f0 <addListItem>
c0de57e0:	b110      	cbz	r0, c0de57e8 <nbgl_layoutAddTouchableBar+0x4a>
c0de57e2:	f002 f94f 	bl	c0de7a84 <OUTLINED_FUNCTION_36>
c0de57e6:	e001      	b.n	c0de57ec <nbgl_layoutAddTouchableBar+0x4e>
c0de57e8:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de57ec:	b008      	add	sp, #32
c0de57ee:	bdb0      	pop	{r4, r5, r7, pc}

c0de57f0 <addListItem>:
c0de57f0:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de57f4:	4680      	mov	r8, r0
c0de57f6:	7808      	ldrb	r0, [r1, #0]
c0de57f8:	468a      	mov	sl, r1
c0de57fa:	b108      	cbz	r0, c0de5800 <addListItem+0x10>
c0de57fc:	2600      	movs	r6, #0
c0de57fe:	e005      	b.n	c0de580c <addListItem+0x1c>
c0de5800:	f89a 0015 	ldrb.w	r0, [sl, #21]
c0de5804:	fab0 f080 	clz	r0, r0
c0de5808:	0940      	lsrs	r0, r0, #5
c0de580a:	0046      	lsls	r6, r0, #1
c0de580c:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de5810:	2401      	movs	r4, #1
c0de5812:	f002 f885 	bl	c0de7920 <OUTLINED_FUNCTION_19>
c0de5816:	4683      	mov	fp, r0
c0de5818:	f89a 2014 	ldrb.w	r2, [sl, #20]
c0de581c:	f89a 3018 	ldrb.w	r3, [sl, #24]
c0de5820:	4640      	mov	r0, r8
c0de5822:	4659      	mov	r1, fp
c0de5824:	f7fe fdea 	bl	c0de43fc <layoutAddCallbackObj>
c0de5828:	2700      	movs	r7, #0
c0de582a:	2800      	cmp	r0, #0
c0de582c:	f000 8088 	beq.w	c0de5940 <addListItem+0x150>
c0de5830:	f89a 1017 	ldrb.w	r1, [sl, #23]
c0de5834:	7141      	strb	r1, [r0, #5]
c0de5836:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de583a:	f002 f99f 	bl	c0de7b7c <OUTLINED_FUNCTION_56>
c0de583e:	4659      	mov	r1, fp
c0de5840:	0e02      	lsrs	r2, r0, #24
c0de5842:	2364      	movs	r3, #100	@ 0x64
c0de5844:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de5848:	f801 7d10 	strb.w	r7, [r1, #-16]!
c0de584c:	74ca      	strb	r2, [r1, #19]
c0de584e:	0c02      	lsrs	r2, r0, #16
c0de5850:	0a00      	lsrs	r0, r0, #8
c0de5852:	f801 4c0d 	strb.w	r4, [r1, #-13]
c0de5856:	f801 7c0b 	strb.w	r7, [r1, #-11]
c0de585a:	7448      	strb	r0, [r1, #17]
c0de585c:	20a0      	movs	r0, #160	@ 0xa0
c0de585e:	748a      	strb	r2, [r1, #18]
c0de5860:	f801 0c0e 	strb.w	r0, [r1, #-14]
c0de5864:	f89a 2016 	ldrb.w	r2, [sl, #22]
c0de5868:	f89a 0000 	ldrb.w	r0, [sl]
c0de586c:	2a00      	cmp	r2, #0
c0de586e:	bf08      	it	eq
c0de5870:	235c      	moveq	r3, #92	@ 0x5c
c0de5872:	f801 3c0c 	strb.w	r3, [r1, #-12]
c0de5876:	718f      	strb	r7, [r1, #6]
c0de5878:	70cf      	strb	r7, [r1, #3]
c0de587a:	708f      	strb	r7, [r1, #2]
c0de587c:	704f      	strb	r7, [r1, #1]
c0de587e:	738f      	strb	r7, [r1, #14]
c0de5880:	734c      	strb	r4, [r1, #13]
c0de5882:	710f      	strb	r7, [r1, #4]
c0de5884:	2220      	movs	r2, #32
c0de5886:	2801      	cmp	r0, #1
c0de5888:	714a      	strb	r2, [r1, #5]
c0de588a:	d004      	beq.n	c0de5896 <addListItem+0xa6>
c0de588c:	b9a0      	cbnz	r0, c0de58b8 <addListItem+0xc8>
c0de588e:	f89a 0015 	ldrb.w	r0, [sl, #21]
c0de5892:	2801      	cmp	r0, #1
c0de5894:	d110      	bne.n	c0de58b8 <addListItem+0xc8>
c0de5896:	f8df 040c 	ldr.w	r0, [pc, #1036]	@ c0de5ca4 <addListItem+0x4b4>
c0de589a:	f819 1000 	ldrb.w	r1, [r9, r0]
c0de589e:	1c4a      	adds	r2, r1, #1
c0de58a0:	f809 2000 	strb.w	r2, [r9, r0]
c0de58a4:	2000      	movs	r0, #0
c0de58a6:	f88b 001d 	strb.w	r0, [fp, #29]
c0de58aa:	2001      	movs	r0, #1
c0de58ac:	f88b 001c 	strb.w	r0, [fp, #28]
c0de58b0:	f101 0014 	add.w	r0, r1, #20
c0de58b4:	f88b 001e 	strb.w	r0, [fp, #30]
c0de58b8:	f8da 000c 	ldr.w	r0, [sl, #12]
c0de58bc:	2400      	movs	r4, #0
c0de58be:	2800      	cmp	r0, #0
c0de58c0:	d041      	beq.n	c0de5946 <addListItem+0x156>
c0de58c2:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de58c6:	f001 ff29 	bl	c0de771c <OUTLINED_FUNCTION_1>
c0de58ca:	4607      	mov	r7, r0
c0de58cc:	77c6      	strb	r6, [r0, #31]
c0de58ce:	f8da 000c 	ldr.w	r0, [sl, #12]
c0de58d2:	f006 fa6d 	bl	c0debdb0 <pic>
c0de58d6:	f897 1024 	ldrb.w	r1, [r7, #36]	@ 0x24
c0de58da:	0e02      	lsrs	r2, r0, #24
c0de58dc:	f887 402d 	strb.w	r4, [r7, #45]	@ 0x2d
c0de58e0:	f041 0101 	orr.w	r1, r1, #1
c0de58e4:	f887 1024 	strb.w	r1, [r7, #36]	@ 0x24
c0de58e8:	210c      	movs	r1, #12
c0de58ea:	f887 1022 	strb.w	r1, [r7, #34]	@ 0x22
c0de58ee:	4639      	mov	r1, r7
c0de58f0:	f801 4f2c 	strb.w	r4, [r1, #44]!
c0de58f4:	70cc      	strb	r4, [r1, #3]
c0de58f6:	708c      	strb	r4, [r1, #2]
c0de58f8:	4639      	mov	r1, r7
c0de58fa:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de58fe:	f001 fffe 	bl	c0de78fe <OUTLINED_FUNCTION_17>
c0de5902:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de5906:	f89b 1004 	ldrb.w	r1, [fp, #4]
c0de590a:	f89b 2005 	ldrb.w	r2, [fp, #5]
c0de590e:	7139      	strb	r1, [r7, #4]
c0de5910:	717a      	strb	r2, [r7, #5]
c0de5912:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de5916:	b1c0      	cbz	r0, c0de594a <addListItem+0x15a>
c0de5918:	f006 fa4a 	bl	c0debdb0 <pic>
c0de591c:	4639      	mov	r1, r7
c0de591e:	f811 2f04 	ldrb.w	r2, [r1, #4]!
c0de5922:	784b      	ldrb	r3, [r1, #1]
c0de5924:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5928:	7803      	ldrb	r3, [r0, #0]
c0de592a:	7840      	ldrb	r0, [r0, #1]
c0de592c:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de5930:	f64f 73f0 	movw	r3, #65520	@ 0xfff0
c0de5934:	1a18      	subs	r0, r3, r0
c0de5936:	4402      	add	r2, r0
c0de5938:	0a10      	lsrs	r0, r2, #8
c0de593a:	700a      	strb	r2, [r1, #0]
c0de593c:	7048      	strb	r0, [r1, #1]
c0de593e:	e006      	b.n	c0de594e <addListItem+0x15e>
c0de5940:	f04f 0b00 	mov.w	fp, #0
c0de5944:	e1ab      	b.n	c0de5c9e <addListItem+0x4ae>
c0de5946:	2700      	movs	r7, #0
c0de5948:	e074      	b.n	c0de5a34 <addListItem+0x244>
c0de594a:	ea41 2202 	orr.w	r2, r1, r2, lsl #8
c0de594e:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de5952:	9601      	str	r6, [sp, #4]
c0de5954:	b130      	cbz	r0, c0de5964 <addListItem+0x174>
c0de5956:	f006 fa2b 	bl	c0debdb0 <pic>
c0de595a:	7939      	ldrb	r1, [r7, #4]
c0de595c:	797a      	ldrb	r2, [r7, #5]
c0de595e:	ea41 2202 	orr.w	r2, r1, r2, lsl #8
c0de5962:	e005      	b.n	c0de5970 <addListItem+0x180>
c0de5964:	f89a 0000 	ldrb.w	r0, [sl]
c0de5968:	2801      	cmp	r0, #1
c0de596a:	d107      	bne.n	c0de597c <addListItem+0x18c>
c0de596c:	48ce      	ldr	r0, [pc, #824]	@ (c0de5ca8 <addListItem+0x4b8>)
c0de596e:	4478      	add	r0, pc
c0de5970:	f002 f91c 	bl	c0de7bac <OUTLINED_FUNCTION_60>
c0de5974:	4402      	add	r2, r0
c0de5976:	0a10      	lsrs	r0, r2, #8
c0de5978:	713a      	strb	r2, [r7, #4]
c0de597a:	7178      	strb	r0, [r7, #5]
c0de597c:	4639      	mov	r1, r7
c0de597e:	b292      	uxth	r2, r2
c0de5980:	f811 3f26 	ldrb.w	r3, [r1, #38]!
c0de5984:	784e      	ldrb	r6, [r1, #1]
c0de5986:	78cc      	ldrb	r4, [r1, #3]
c0de5988:	f811 0c04 	ldrb.w	r0, [r1, #-4]
c0de598c:	f811 5c02 	ldrb.w	r5, [r1, #-2]
c0de5990:	7889      	ldrb	r1, [r1, #2]
c0de5992:	ea41 2104 	orr.w	r1, r1, r4, lsl #8
c0de5996:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de599a:	ea43 4101 	orr.w	r1, r3, r1, lsl #16
c0de599e:	f002 f90d 	bl	c0de7bbc <OUTLINED_FUNCTION_61>
c0de59a2:	2828      	cmp	r0, #40	@ 0x28
c0de59a4:	d201      	bcs.n	c0de59aa <addListItem+0x1ba>
c0de59a6:	2028      	movs	r0, #40	@ 0x28
c0de59a8:	e017      	b.n	c0de59da <addListItem+0x1ea>
c0de59aa:	463a      	mov	r2, r7
c0de59ac:	f812 0f26 	ldrb.w	r0, [r2, #38]!
c0de59b0:	78d1      	ldrb	r1, [r2, #3]
c0de59b2:	7893      	ldrb	r3, [r2, #2]
c0de59b4:	f812 4c21 	ldrb.w	r4, [r2, #-33]
c0de59b8:	f812 5c02 	ldrb.w	r5, [r2, #-2]
c0de59bc:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de59c0:	7853      	ldrb	r3, [r2, #1]
c0de59c2:	ea40 2003 	orr.w	r0, r0, r3, lsl #8
c0de59c6:	f812 3c22 	ldrb.w	r3, [r2, #-34]
c0de59ca:	ea40 4101 	orr.w	r1, r0, r1, lsl #16
c0de59ce:	f812 0c04 	ldrb.w	r0, [r2, #-4]
c0de59d2:	ea43 2204 	orr.w	r2, r3, r4, lsl #8
c0de59d6:	f002 f8f1 	bl	c0de7bbc <OUTLINED_FUNCTION_61>
c0de59da:	4659      	mov	r1, fp
c0de59dc:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de59e0:	784c      	ldrb	r4, [r1, #1]
c0de59e2:	788d      	ldrb	r5, [r1, #2]
c0de59e4:	78ce      	ldrb	r6, [r1, #3]
c0de59e6:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de59ea:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de59ee:	ea45 2406 	orr.w	r4, r5, r6, lsl #8
c0de59f2:	ea42 4204 	orr.w	r2, r2, r4, lsl #16
c0de59f6:	f842 7023 	str.w	r7, [r2, r3, lsl #2]
c0de59fa:	2200      	movs	r2, #0
c0de59fc:	71b8      	strb	r0, [r7, #6]
c0de59fe:	f887 2021 	strb.w	r2, [r7, #33]	@ 0x21
c0de5a02:	2201      	movs	r2, #1
c0de5a04:	75ba      	strb	r2, [r7, #22]
c0de5a06:	2204      	movs	r2, #4
c0de5a08:	f887 2020 	strb.w	r2, [r7, #32]
c0de5a0c:	0a02      	lsrs	r2, r0, #8
c0de5a0e:	71fa      	strb	r2, [r7, #7]
c0de5a10:	1c5a      	adds	r2, r3, #1
c0de5a12:	f801 2c02 	strb.w	r2, [r1, #-2]
c0de5a16:	f89a 1016 	ldrb.w	r1, [sl, #22]
c0de5a1a:	221e      	movs	r2, #30
c0de5a1c:	2900      	cmp	r1, #0
c0de5a1e:	bf08      	it	eq
c0de5a20:	221a      	moveq	r2, #26
c0de5a22:	3828      	subs	r0, #40	@ 0x28
c0de5a24:	b280      	uxth	r0, r0
c0de5a26:	bf88      	it	hi
c0de5a28:	eba2 0250 	subhi.w	r2, r2, r0, lsr #1
c0de5a2c:	9e01      	ldr	r6, [sp, #4]
c0de5a2e:	767a      	strb	r2, [r7, #25]
c0de5a30:	0a10      	lsrs	r0, r2, #8
c0de5a32:	76b8      	strb	r0, [r7, #26]
c0de5a34:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de5a38:	2800      	cmp	r0, #0
c0de5a3a:	d046      	beq.n	c0de5aca <addListItem+0x2da>
c0de5a3c:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de5a40:	f001 ffb0 	bl	c0de79a4 <OUTLINED_FUNCTION_26>
c0de5a44:	4604      	mov	r4, r0
c0de5a46:	77c6      	strb	r6, [r0, #31]
c0de5a48:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de5a4c:	f006 f9b0 	bl	c0debdb0 <pic>
c0de5a50:	0a39      	lsrs	r1, r7, #8
c0de5a52:	0e02      	lsrs	r2, r0, #24
c0de5a54:	4635      	mov	r5, r6
c0de5a56:	74e1      	strb	r1, [r4, #19]
c0de5a58:	4621      	mov	r1, r4
c0de5a5a:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de5a5e:	70ca      	strb	r2, [r1, #3]
c0de5a60:	0c02      	lsrs	r2, r0, #16
c0de5a62:	0a00      	lsrs	r0, r0, #8
c0de5a64:	f884 0022 	strb.w	r0, [r4, #34]	@ 0x22
c0de5a68:	4620      	mov	r0, r4
c0de5a6a:	708a      	strb	r2, [r1, #2]
c0de5a6c:	0e39      	lsrs	r1, r7, #24
c0de5a6e:	f800 7f12 	strb.w	r7, [r0, #18]!
c0de5a72:	70c1      	strb	r1, [r0, #3]
c0de5a74:	0c39      	lsrs	r1, r7, #16
c0de5a76:	7081      	strb	r1, [r0, #2]
c0de5a78:	4658      	mov	r0, fp
c0de5a7a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de5a7e:	7843      	ldrb	r3, [r0, #1]
c0de5a80:	f890 c002 	ldrb.w	ip, [r0, #2]
c0de5a84:	78c6      	ldrb	r6, [r0, #3]
c0de5a86:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de5a8a:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de5a8e:	ea4c 2306 	orr.w	r3, ip, r6, lsl #8
c0de5a92:	462e      	mov	r6, r5
c0de5a94:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
c0de5a98:	f002 f8db 	bl	c0de7c52 <OUTLINED_FUNCTION_75>
c0de5a9c:	2104      	movs	r1, #4
c0de5a9e:	75a1      	strb	r1, [r4, #22]
c0de5aa0:	1c51      	adds	r1, r2, #1
c0de5aa2:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de5aa6:	b187      	cbz	r7, c0de5aca <addListItem+0x2da>
c0de5aa8:	f814 0f21 	ldrb.w	r0, [r4, #33]!
c0de5aac:	7861      	ldrb	r1, [r4, #1]
c0de5aae:	78a2      	ldrb	r2, [r4, #2]
c0de5ab0:	78e3      	ldrb	r3, [r4, #3]
c0de5ab2:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de5ab6:	f001 ffea 	bl	c0de7a8e <OUTLINED_FUNCTION_37>
c0de5aba:	7801      	ldrb	r1, [r0, #0]
c0de5abc:	7840      	ldrb	r0, [r0, #1]
c0de5abe:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de5ac2:	3010      	adds	r0, #16
c0de5ac4:	75f8      	strb	r0, [r7, #23]
c0de5ac6:	0a00      	lsrs	r0, r0, #8
c0de5ac8:	7638      	strb	r0, [r7, #24]
c0de5aca:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de5ace:	b190      	cbz	r0, c0de5af6 <addListItem+0x306>
c0de5ad0:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de5ad4:	f001 ff66 	bl	c0de79a4 <OUTLINED_FUNCTION_26>
c0de5ad8:	4604      	mov	r4, r0
c0de5ada:	77c6      	strb	r6, [r0, #31]
c0de5adc:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de5ae0:	f006 f966 	bl	c0debdb0 <pic>
c0de5ae4:	4621      	mov	r1, r4
c0de5ae6:	0e02      	lsrs	r2, r0, #24
c0de5ae8:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de5aec:	f001 ff07 	bl	c0de78fe <OUTLINED_FUNCTION_17>
c0de5af0:	f884 0022 	strb.w	r0, [r4, #34]	@ 0x22
c0de5af4:	e013      	b.n	c0de5b1e <addListItem+0x32e>
c0de5af6:	f89a 0000 	ldrb.w	r0, [sl]
c0de5afa:	2801      	cmp	r0, #1
c0de5afc:	d12d      	bne.n	c0de5b5a <addListItem+0x36a>
c0de5afe:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de5b02:	08c1      	lsrs	r1, r0, #3
c0de5b04:	2006      	movs	r0, #6
c0de5b06:	f005 ff72 	bl	c0deb9ee <nbgl_objPoolGet>
c0de5b0a:	4604      	mov	r4, r0
c0de5b0c:	2002      	movs	r0, #2
c0de5b0e:	f884 0020 	strb.w	r0, [r4, #32]
c0de5b12:	2000      	movs	r0, #0
c0de5b14:	77e0      	strb	r0, [r4, #31]
c0de5b16:	f89a 0015 	ldrb.w	r0, [sl, #21]
c0de5b1a:	f884 0021 	strb.w	r0, [r4, #33]	@ 0x21
c0de5b1e:	2006      	movs	r0, #6
c0de5b20:	0e39      	lsrs	r1, r7, #24
c0de5b22:	75a0      	strb	r0, [r4, #22]
c0de5b24:	4620      	mov	r0, r4
c0de5b26:	f800 7f12 	strb.w	r7, [r0, #18]!
c0de5b2a:	70c1      	strb	r1, [r0, #3]
c0de5b2c:	0c39      	lsrs	r1, r7, #16
c0de5b2e:	7081      	strb	r1, [r0, #2]
c0de5b30:	0a38      	lsrs	r0, r7, #8
c0de5b32:	74e0      	strb	r0, [r4, #19]
c0de5b34:	4658      	mov	r0, fp
c0de5b36:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de5b3a:	7842      	ldrb	r2, [r0, #1]
c0de5b3c:	7883      	ldrb	r3, [r0, #2]
c0de5b3e:	78c5      	ldrb	r5, [r0, #3]
c0de5b40:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de5b44:	ea43 2205 	orr.w	r2, r3, r5, lsl #8
c0de5b48:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de5b4c:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de5b50:	f002 f87f 	bl	c0de7c52 <OUTLINED_FUNCTION_75>
c0de5b54:	1c51      	adds	r1, r2, #1
c0de5b56:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de5b5a:	f8da 0010 	ldr.w	r0, [sl, #16]
c0de5b5e:	2800      	cmp	r0, #0
c0de5b60:	f000 8088 	beq.w	c0de5c74 <addListItem+0x484>
c0de5b64:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de5b68:	2504      	movs	r5, #4
c0de5b6a:	f001 fdd7 	bl	c0de771c <OUTLINED_FUNCTION_1>
c0de5b6e:	4604      	mov	r4, r0
c0de5b70:	77c6      	strb	r6, [r0, #31]
c0de5b72:	f8da 0010 	ldr.w	r0, [sl, #16]
c0de5b76:	f006 f91b 	bl	c0debdb0 <pic>
c0de5b7a:	4601      	mov	r1, r0
c0de5b7c:	4622      	mov	r2, r4
c0de5b7e:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de5b82:	f884 5020 	strb.w	r5, [r4, #32]
c0de5b86:	f802 1f26 	strb.w	r1, [r2, #38]!
c0de5b8a:	0e0b      	lsrs	r3, r1, #24
c0de5b8c:	70d3      	strb	r3, [r2, #3]
c0de5b8e:	0c0b      	lsrs	r3, r1, #16
c0de5b90:	f040 0001 	orr.w	r0, r0, #1
c0de5b94:	7093      	strb	r3, [r2, #2]
c0de5b96:	0a0a      	lsrs	r2, r1, #8
c0de5b98:	f884 0024 	strb.w	r0, [r4, #36]	@ 0x24
c0de5b9c:	200b      	movs	r0, #11
c0de5b9e:	f884 2027 	strb.w	r2, [r4, #39]	@ 0x27
c0de5ba2:	f884 0022 	strb.w	r0, [r4, #34]	@ 0x22
c0de5ba6:	2000      	movs	r0, #0
c0de5ba8:	f8da 200c 	ldr.w	r2, [sl, #12]
c0de5bac:	f884 0021 	strb.w	r0, [r4, #33]	@ 0x21
c0de5bb0:	b15a      	cbz	r2, c0de5bca <addListItem+0x3da>
c0de5bb2:	4620      	mov	r0, r4
c0de5bb4:	0e3a      	lsrs	r2, r7, #24
c0de5bb6:	f800 7f12 	strb.w	r7, [r0, #18]!
c0de5bba:	70c2      	strb	r2, [r0, #3]
c0de5bbc:	0c3a      	lsrs	r2, r7, #16
c0de5bbe:	7082      	strb	r2, [r0, #2]
c0de5bc0:	0a3a      	lsrs	r2, r7, #8
c0de5bc2:	7042      	strb	r2, [r0, #1]
c0de5bc4:	200c      	movs	r0, #12
c0de5bc6:	2207      	movs	r2, #7
c0de5bc8:	e005      	b.n	c0de5bd6 <addListItem+0x3e6>
c0de5bca:	f88b 0007 	strb.w	r0, [fp, #7]
c0de5bce:	201c      	movs	r0, #28
c0de5bd0:	2201      	movs	r2, #1
c0de5bd2:	f88b 0006 	strb.w	r0, [fp, #6]
c0de5bd6:	2300      	movs	r3, #0
c0de5bd8:	7660      	strb	r0, [r4, #25]
c0de5bda:	75a2      	strb	r2, [r4, #22]
c0de5bdc:	76a3      	strb	r3, [r4, #26]
c0de5bde:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de5be2:	b1b8      	cbz	r0, c0de5c14 <addListItem+0x424>
c0de5be4:	f006 f8e4 	bl	c0debdb0 <pic>
c0de5be8:	f001 ffe0 	bl	c0de7bac <OUTLINED_FUNCTION_60>
c0de5bec:	4621      	mov	r1, r4
c0de5bee:	f811 2f26 	ldrb.w	r2, [r1, #38]!
c0de5bf2:	f801 0c0f 	strb.w	r0, [r1, #-15]
c0de5bf6:	0a00      	lsrs	r0, r0, #8
c0de5bf8:	784b      	ldrb	r3, [r1, #1]
c0de5bfa:	788d      	ldrb	r5, [r1, #2]
c0de5bfc:	f801 0c0e 	strb.w	r0, [r1, #-14]
c0de5c00:	f811 0c04 	ldrb.w	r0, [r1, #-4]
c0de5c04:	78c9      	ldrb	r1, [r1, #3]
c0de5c06:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5c0a:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de5c0e:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de5c12:	e000      	b.n	c0de5c16 <addListItem+0x426>
c0de5c14:	200b      	movs	r0, #11
c0de5c16:	f89b 3005 	ldrb.w	r3, [fp, #5]
c0de5c1a:	f89b 2004 	ldrb.w	r2, [fp, #4]
c0de5c1e:	f894 5024 	ldrb.w	r5, [r4, #36]	@ 0x24
c0de5c22:	7122      	strb	r2, [r4, #4]
c0de5c24:	7163      	strb	r3, [r4, #5]
c0de5c26:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5c2a:	f001 ffc7 	bl	c0de7bbc <OUTLINED_FUNCTION_61>
c0de5c2e:	4659      	mov	r1, fp
c0de5c30:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de5c34:	f811 cd1c 	ldrb.w	ip, [r1, #-28]!
c0de5c38:	7f4b      	ldrb	r3, [r1, #29]
c0de5c3a:	7fcd      	ldrb	r5, [r1, #31]
c0de5c3c:	7f8e      	ldrb	r6, [r1, #30]
c0de5c3e:	7e8f      	ldrb	r7, [r1, #26]
c0de5c40:	f891 e001 	ldrb.w	lr, [r1, #1]
c0de5c44:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5c48:	ea46 2505 	orr.w	r5, r6, r5, lsl #8
c0de5c4c:	7ea3      	ldrb	r3, [r4, #26]
c0de5c4e:	ea42 4205 	orr.w	r2, r2, r5, lsl #16
c0de5c52:	f842 4027 	str.w	r4, [r2, r7, lsl #2]
c0de5c56:	0a02      	lsrs	r2, r0, #8
c0de5c58:	71a0      	strb	r0, [r4, #6]
c0de5c5a:	71e2      	strb	r2, [r4, #7]
c0de5c5c:	1c7a      	adds	r2, r7, #1
c0de5c5e:	768a      	strb	r2, [r1, #26]
c0de5c60:	7e62      	ldrb	r2, [r4, #25]
c0de5c62:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5c66:	4410      	add	r0, r2
c0de5c68:	ea4c 220e 	orr.w	r2, ip, lr, lsl #8
c0de5c6c:	4410      	add	r0, r2
c0de5c6e:	7008      	strb	r0, [r1, #0]
c0de5c70:	0a00      	lsrs	r0, r0, #8
c0de5c72:	7048      	strb	r0, [r1, #1]
c0de5c74:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de5c78:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de5c7c:	7843      	ldrb	r3, [r0, #1]
c0de5c7e:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de5c82:	7884      	ldrb	r4, [r0, #2]
c0de5c84:	78c0      	ldrb	r0, [r0, #3]
c0de5c86:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de5c8a:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de5c8e:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de5c92:	f840 b022 	str.w	fp, [r0, r2, lsl #2]
c0de5c96:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de5c9a:	f001 fd39 	bl	c0de7710 <OUTLINED_FUNCTION_0>
c0de5c9e:	4658      	mov	r0, fp
c0de5ca0:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de5ca4:	00001908 	.word	0x00001908
c0de5ca8:	00006d37 	.word	0x00006d37

c0de5cac <nbgl_layoutAddSwitch>:
c0de5cac:	b5b0      	push	{r4, r5, r7, lr}
c0de5cae:	b088      	sub	sp, #32
c0de5cb0:	460d      	mov	r5, r1
c0de5cb2:	4604      	mov	r4, r0
c0de5cb4:	a801      	add	r0, sp, #4
c0de5cb6:	211c      	movs	r1, #28
c0de5cb8:	f006 fa9c 	bl	c0dec1f4 <__aeabi_memclr>
c0de5cbc:	b1bc      	cbz	r4, c0de5cee <nbgl_layoutAddSwitch+0x42>
c0de5cbe:	2001      	movs	r0, #1
c0de5cc0:	f88d 0004 	strb.w	r0, [sp, #4]
c0de5cc4:	e9d5 0100 	ldrd	r0, r1, [r5]
c0de5cc8:	e9cd 0104 	strd	r0, r1, [sp, #16]
c0de5ccc:	7a68      	ldrb	r0, [r5, #9]
c0de5cce:	f88d 0018 	strb.w	r0, [sp, #24]
c0de5cd2:	7aa8      	ldrb	r0, [r5, #10]
c0de5cd4:	f88d 001c 	strb.w	r0, [sp, #28]
c0de5cd8:	7a28      	ldrb	r0, [r5, #8]
c0de5cda:	f88d 0019 	strb.w	r0, [sp, #25]
c0de5cde:	a901      	add	r1, sp, #4
c0de5ce0:	4620      	mov	r0, r4
c0de5ce2:	f7ff fd85 	bl	c0de57f0 <addListItem>
c0de5ce6:	b110      	cbz	r0, c0de5cee <nbgl_layoutAddSwitch+0x42>
c0de5ce8:	f001 fecc 	bl	c0de7a84 <OUTLINED_FUNCTION_36>
c0de5cec:	e001      	b.n	c0de5cf2 <nbgl_layoutAddSwitch+0x46>
c0de5cee:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de5cf2:	b008      	add	sp, #32
c0de5cf4:	bdb0      	pop	{r4, r5, r7, pc}

c0de5cf6 <nbgl_layoutAddText>:
c0de5cf6:	b570      	push	{r4, r5, r6, lr}
c0de5cf8:	b088      	sub	sp, #32
c0de5cfa:	460d      	mov	r5, r1
c0de5cfc:	4604      	mov	r4, r0
c0de5cfe:	a801      	add	r0, sp, #4
c0de5d00:	211c      	movs	r1, #28
c0de5d02:	4616      	mov	r6, r2
c0de5d04:	f006 fa76 	bl	c0dec1f4 <__aeabi_memclr>
c0de5d08:	b194      	cbz	r4, c0de5d30 <nbgl_layoutAddText+0x3a>
c0de5d0a:	200c      	movs	r0, #12
c0de5d0c:	e9cd 5604 	strd	r5, r6, [sp, #16]
c0de5d10:	f88d 001c 	strb.w	r0, [sp, #28]
c0de5d14:	20ff      	movs	r0, #255	@ 0xff
c0de5d16:	f88d 0018 	strb.w	r0, [sp, #24]
c0de5d1a:	2002      	movs	r0, #2
c0de5d1c:	f88d 0004 	strb.w	r0, [sp, #4]
c0de5d20:	a901      	add	r1, sp, #4
c0de5d22:	4620      	mov	r0, r4
c0de5d24:	f7ff fd64 	bl	c0de57f0 <addListItem>
c0de5d28:	b110      	cbz	r0, c0de5d30 <nbgl_layoutAddText+0x3a>
c0de5d2a:	f001 feab 	bl	c0de7a84 <OUTLINED_FUNCTION_36>
c0de5d2e:	e001      	b.n	c0de5d34 <nbgl_layoutAddText+0x3e>
c0de5d30:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de5d34:	b008      	add	sp, #32
c0de5d36:	bd70      	pop	{r4, r5, r6, pc}

c0de5d38 <nbgl_layoutAddTextWithAlias>:
c0de5d38:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de5d3a:	b087      	sub	sp, #28
c0de5d3c:	460e      	mov	r6, r1
c0de5d3e:	4604      	mov	r4, r0
c0de5d40:	4668      	mov	r0, sp
c0de5d42:	211c      	movs	r1, #28
c0de5d44:	461d      	mov	r5, r3
c0de5d46:	4617      	mov	r7, r2
c0de5d48:	f006 fa54 	bl	c0dec1f4 <__aeabi_memclr>
c0de5d4c:	b1bc      	cbz	r4, c0de5d7e <nbgl_layoutAddTextWithAlias+0x46>
c0de5d4e:	210c      	movs	r1, #12
c0de5d50:	e9cd 6703 	strd	r6, r7, [sp, #12]
c0de5d54:	f88d 5014 	strb.w	r5, [sp, #20]
c0de5d58:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de5d5a:	f88d 1018 	strb.w	r1, [sp, #24]
c0de5d5e:	490a      	ldr	r1, [pc, #40]	@ (c0de5d88 <nbgl_layoutAddTextWithAlias+0x50>)
c0de5d60:	f88d 0017 	strb.w	r0, [sp, #23]
c0de5d64:	2001      	movs	r0, #1
c0de5d66:	f88d 0015 	strb.w	r0, [sp, #21]
c0de5d6a:	4620      	mov	r0, r4
c0de5d6c:	4479      	add	r1, pc
c0de5d6e:	9102      	str	r1, [sp, #8]
c0de5d70:	4669      	mov	r1, sp
c0de5d72:	f7ff fd3d 	bl	c0de57f0 <addListItem>
c0de5d76:	b110      	cbz	r0, c0de5d7e <nbgl_layoutAddTextWithAlias+0x46>
c0de5d78:	f001 fe84 	bl	c0de7a84 <OUTLINED_FUNCTION_36>
c0de5d7c:	e001      	b.n	c0de5d82 <nbgl_layoutAddTextWithAlias+0x4a>
c0de5d7e:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de5d82:	b007      	add	sp, #28
c0de5d84:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de5d86:	bf00      	nop
c0de5d88:	00007574 	.word	0x00007574

c0de5d8c <nbgl_layoutAddTextContent>:
c0de5d8c:	2800      	cmp	r0, #0
c0de5d8e:	f000 80ab 	beq.w	c0de5ee8 <nbgl_layoutAddTextContent+0x15c>
c0de5d92:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de5d96:	4680      	mov	r8, r0
c0de5d98:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de5d9c:	4e53      	ldr	r6, [pc, #332]	@ (c0de5eec <nbgl_layoutAddTextContent+0x160>)
c0de5d9e:	460d      	mov	r5, r1
c0de5da0:	e9cd 2300 	strd	r2, r3, [sp]
c0de5da4:	08c1      	lsrs	r1, r0, #3
c0de5da6:	447e      	add	r6, pc
c0de5da8:	2004      	movs	r0, #4
c0de5daa:	47b0      	blx	r6
c0de5dac:	f04f 0b00 	mov.w	fp, #0
c0de5db0:	4607      	mov	r7, r0
c0de5db2:	f880 b01f 	strb.w	fp, [r0, #31]
c0de5db6:	4628      	mov	r0, r5
c0de5db8:	4c4d      	ldr	r4, [pc, #308]	@ (c0de5ef0 <nbgl_layoutAddTextContent+0x164>)
c0de5dba:	447c      	add	r4, pc
c0de5dbc:	47a0      	blx	r4
c0de5dbe:	4601      	mov	r1, r0
c0de5dc0:	2010      	movs	r0, #16
c0de5dc2:	f887 b01a 	strb.w	fp, [r7, #26]
c0de5dc6:	f887 b018 	strb.w	fp, [r7, #24]
c0de5dca:	f887 b021 	strb.w	fp, [r7, #33]	@ 0x21
c0de5dce:	f887 b016 	strb.w	fp, [r7, #22]
c0de5dd2:	2301      	movs	r3, #1
c0de5dd4:	46a2      	mov	sl, r4
c0de5dd6:	7678      	strb	r0, [r7, #25]
c0de5dd8:	2020      	movs	r0, #32
c0de5dda:	0e0a      	lsrs	r2, r1, #24
c0de5ddc:	75f8      	strb	r0, [r7, #23]
c0de5dde:	2001      	movs	r0, #1
c0de5de0:	7178      	strb	r0, [r7, #5]
c0de5de2:	20a0      	movs	r0, #160	@ 0xa0
c0de5de4:	7138      	strb	r0, [r7, #4]
c0de5de6:	200d      	movs	r0, #13
c0de5de8:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de5dec:	2004      	movs	r0, #4
c0de5dee:	f001 fd9b 	bl	c0de7928 <OUTLINED_FUNCTION_20>
c0de5df2:	200d      	movs	r0, #13
c0de5df4:	4d3f      	ldr	r5, [pc, #252]	@ (c0de5ef4 <nbgl_layoutAddTextContent+0x168>)
c0de5df6:	447d      	add	r5, pc
c0de5df8:	47a8      	blx	r5
c0de5dfa:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de5dfe:	f001 fdc1 	bl	c0de7984 <OUTLINED_FUNCTION_25>
c0de5e02:	71b8      	strb	r0, [r7, #6]
c0de5e04:	0a00      	lsrs	r0, r0, #8
c0de5e06:	71f8      	strb	r0, [r7, #7]
c0de5e08:	f001 fe09 	bl	c0de7a1e <OUTLINED_FUNCTION_32>
c0de5e0c:	4607      	mov	r7, r0
c0de5e0e:	f880 b01f 	strb.w	fp, [r0, #31]
c0de5e12:	9800      	ldr	r0, [sp, #0]
c0de5e14:	47d0      	blx	sl
c0de5e16:	4601      	mov	r1, r0
c0de5e18:	2001      	movs	r0, #1
c0de5e1a:	2301      	movs	r3, #1
c0de5e1c:	f887 b021 	strb.w	fp, [r7, #33]	@ 0x21
c0de5e20:	7178      	strb	r0, [r7, #5]
c0de5e22:	20a0      	movs	r0, #160	@ 0xa0
c0de5e24:	0e0a      	lsrs	r2, r1, #24
c0de5e26:	7138      	strb	r0, [r7, #4]
c0de5e28:	200b      	movs	r0, #11
c0de5e2a:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de5e2e:	4638      	mov	r0, r7
c0de5e30:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de5e34:	70c2      	strb	r2, [r0, #3]
c0de5e36:	0c0a      	lsrs	r2, r1, #16
c0de5e38:	7082      	strb	r2, [r0, #2]
c0de5e3a:	0a08      	lsrs	r0, r1, #8
c0de5e3c:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de5e40:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de5e44:	f897 0024 	ldrb.w	r0, [r7, #36]	@ 0x24
c0de5e48:	f040 0001 	orr.w	r0, r0, #1
c0de5e4c:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de5e50:	200b      	movs	r0, #11
c0de5e52:	47a8      	blx	r5
c0de5e54:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de5e58:	f887 b01a 	strb.w	fp, [r7, #26]
c0de5e5c:	f887 b018 	strb.w	fp, [r7, #24]
c0de5e60:	f887 b016 	strb.w	fp, [r7, #22]
c0de5e64:	f001 fd8e 	bl	c0de7984 <OUTLINED_FUNCTION_25>
c0de5e68:	2104      	movs	r1, #4
c0de5e6a:	71b8      	strb	r0, [r7, #6]
c0de5e6c:	0a00      	lsrs	r0, r0, #8
c0de5e6e:	f887 1020 	strb.w	r1, [r7, #32]
c0de5e72:	2118      	movs	r1, #24
c0de5e74:	71f8      	strb	r0, [r7, #7]
c0de5e76:	7679      	strb	r1, [r7, #25]
c0de5e78:	2120      	movs	r1, #32
c0de5e7a:	75f9      	strb	r1, [r7, #23]
c0de5e7c:	f001 fdcf 	bl	c0de7a1e <OUTLINED_FUNCTION_32>
c0de5e80:	2401      	movs	r4, #1
c0de5e82:	4606      	mov	r6, r0
c0de5e84:	77c4      	strb	r4, [r0, #31]
c0de5e86:	9801      	ldr	r0, [sp, #4]
c0de5e88:	47d0      	blx	sl
c0de5e8a:	4601      	mov	r1, r0
c0de5e8c:	20a0      	movs	r0, #160	@ 0xa0
c0de5e8e:	2301      	movs	r3, #1
c0de5e90:	7174      	strb	r4, [r6, #5]
c0de5e92:	f886 b021 	strb.w	fp, [r6, #33]	@ 0x21
c0de5e96:	7130      	strb	r0, [r6, #4]
c0de5e98:	200b      	movs	r0, #11
c0de5e9a:	0e0a      	lsrs	r2, r1, #24
c0de5e9c:	f001 fd1a 	bl	c0de78d4 <OUTLINED_FUNCTION_16>
c0de5ea0:	47a8      	blx	r5
c0de5ea2:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de5ea6:	f886 b01a 	strb.w	fp, [r6, #26]
c0de5eaa:	f886 b018 	strb.w	fp, [r6, #24]
c0de5eae:	f001 fc61 	bl	c0de7774 <OUTLINED_FUNCTION_4>
c0de5eb2:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
c0de5eb6:	2128      	movs	r1, #40	@ 0x28
c0de5eb8:	71b0      	strb	r0, [r6, #6]
c0de5eba:	0a00      	lsrs	r0, r0, #8
c0de5ebc:	7671      	strb	r1, [r6, #25]
c0de5ebe:	2120      	movs	r1, #32
c0de5ec0:	71f0      	strb	r0, [r6, #7]
c0de5ec2:	75f1      	strb	r1, [r6, #23]
c0de5ec4:	2104      	movs	r1, #4
c0de5ec6:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de5eca:	f886 1020 	strb.w	r1, [r6, #32]
c0de5ece:	2107      	movs	r1, #7
c0de5ed0:	75b1      	strb	r1, [r6, #22]
c0de5ed2:	f890 3020 	ldrb.w	r3, [r0, #32]
c0de5ed6:	7981      	ldrb	r1, [r0, #6]
c0de5ed8:	79c2      	ldrb	r2, [r0, #7]
c0de5eda:	3301      	adds	r3, #1
c0de5edc:	f880 3020 	strb.w	r3, [r0, #32]
c0de5ee0:	ea41 2002 	orr.w	r0, r1, r2, lsl #8
c0de5ee4:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de5ee8:	f001 bddd 	b.w	c0de7aa6 <OUTLINED_FUNCTION_40>
c0de5eec:	00005c45 	.word	0x00005c45
c0de5ef0:	00005ff3 	.word	0x00005ff3
c0de5ef4:	00005c27 	.word	0x00005c27

c0de5ef8 <nbgl_layoutAddRadioChoice>:
c0de5ef8:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de5efc:	2800      	cmp	r0, #0
c0de5efe:	f000 80ff 	beq.w	c0de6100 <nbgl_layoutAddRadioChoice+0x208>
c0de5f02:	4605      	mov	r5, r0
c0de5f04:	4883      	ldr	r0, [pc, #524]	@ (c0de6114 <nbgl_layoutAddRadioChoice+0x21c>)
c0de5f06:	468a      	mov	sl, r1
c0de5f08:	f04f 0800 	mov.w	r8, #0
c0de5f0c:	e9cd 1501 	strd	r1, r5, [sp, #4]
c0de5f10:	4478      	add	r0, pc
c0de5f12:	9003      	str	r0, [sp, #12]
c0de5f14:	f89a 0005 	ldrb.w	r0, [sl, #5]
c0de5f18:	4580      	cmp	r8, r0
c0de5f1a:	f080 80f4 	bcs.w	c0de6106 <nbgl_layoutAddRadioChoice+0x20e>
c0de5f1e:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de5f22:	9c03      	ldr	r4, [sp, #12]
c0de5f24:	08c1      	lsrs	r1, r0, #3
c0de5f26:	2001      	movs	r0, #1
c0de5f28:	47a0      	blx	r4
c0de5f2a:	4606      	mov	r6, r0
c0de5f2c:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de5f30:	08c1      	lsrs	r1, r0, #3
c0de5f32:	2004      	movs	r0, #4
c0de5f34:	47a0      	blx	r4
c0de5f36:	4607      	mov	r7, r0
c0de5f38:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de5f3c:	08c1      	lsrs	r1, r0, #3
c0de5f3e:	2009      	movs	r0, #9
c0de5f40:	47a0      	blx	r4
c0de5f42:	f89a 2007 	ldrb.w	r2, [sl, #7]
c0de5f46:	f89a 3008 	ldrb.w	r3, [sl, #8]
c0de5f4a:	4604      	mov	r4, r0
c0de5f4c:	4628      	mov	r0, r5
c0de5f4e:	4631      	mov	r1, r6
c0de5f50:	f7fe fa54 	bl	c0de43fc <layoutAddCallbackObj>
c0de5f54:	2800      	cmp	r0, #0
c0de5f56:	f000 80d3 	beq.w	c0de6100 <nbgl_layoutAddRadioChoice+0x208>
c0de5f5a:	2002      	movs	r0, #2
c0de5f5c:	f886 0020 	strb.w	r0, [r6, #32]
c0de5f60:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de5f64:	08c1      	lsrs	r1, r0, #3
c0de5f66:	2002      	movs	r0, #2
c0de5f68:	f005 fd46 	bl	c0deb9f8 <nbgl_containerPoolGet>
c0de5f6c:	2300      	movs	r3, #0
c0de5f6e:	ea4f 2c16 	mov.w	ip, r6, lsr #8
c0de5f72:	4631      	mov	r1, r6
c0de5f74:	0e02      	lsrs	r2, r0, #24
c0de5f76:	4655      	mov	r5, sl
c0de5f78:	ea4f 6a16 	mov.w	sl, r6, lsr #24
c0de5f7c:	ea4f 4b16 	mov.w	fp, r6, lsr #16
c0de5f80:	74f3      	strb	r3, [r6, #19]
c0de5f82:	f884 c013 	strb.w	ip, [r4, #19]
c0de5f86:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de5f8a:	70ca      	strb	r2, [r1, #3]
c0de5f8c:	0c02      	lsrs	r2, r0, #16
c0de5f8e:	708a      	strb	r2, [r1, #2]
c0de5f90:	0a01      	lsrs	r1, r0, #8
c0de5f92:	f886 1023 	strb.w	r1, [r6, #35]	@ 0x23
c0de5f96:	4631      	mov	r1, r6
c0de5f98:	f801 3f12 	strb.w	r3, [r1, #18]!
c0de5f9c:	70cb      	strb	r3, [r1, #3]
c0de5f9e:	708b      	strb	r3, [r1, #2]
c0de5fa0:	4621      	mov	r1, r4
c0de5fa2:	f801 6f12 	strb.w	r6, [r1, #18]!
c0de5fa6:	f881 b002 	strb.w	fp, [r1, #2]
c0de5faa:	f881 a003 	strb.w	sl, [r1, #3]
c0de5fae:	2120      	movs	r1, #32
c0de5fb0:	7633      	strb	r3, [r6, #24]
c0de5fb2:	71f3      	strb	r3, [r6, #7]
c0de5fb4:	75b3      	strb	r3, [r6, #22]
c0de5fb6:	75f1      	strb	r1, [r6, #23]
c0de5fb8:	215c      	movs	r1, #92	@ 0x5c
c0de5fba:	71b1      	strb	r1, [r6, #6]
c0de5fbc:	2101      	movs	r1, #1
c0de5fbe:	7171      	strb	r1, [r6, #5]
c0de5fc0:	21a0      	movs	r1, #160	@ 0xa0
c0de5fc2:	7131      	strb	r1, [r6, #4]
c0de5fc4:	2102      	movs	r1, #2
c0de5fc6:	6044      	str	r4, [r0, #4]
c0de5fc8:	77e3      	strb	r3, [r4, #31]
c0de5fca:	f884 3021 	strb.w	r3, [r4, #33]	@ 0x21
c0de5fce:	7928      	ldrb	r0, [r5, #4]
c0de5fd0:	f884 1020 	strb.w	r1, [r4, #32]
c0de5fd4:	2106      	movs	r1, #6
c0de5fd6:	75a1      	strb	r1, [r4, #22]
c0de5fd8:	b110      	cbz	r0, c0de5fe0 <nbgl_layoutAddRadioChoice+0xe8>
c0de5fda:	f44f 70d0 	mov.w	r0, #416	@ 0x1a0
c0de5fde:	e014      	b.n	c0de600a <nbgl_layoutAddRadioChoice+0x112>
c0de5fe0:	6828      	ldr	r0, [r5, #0]
c0de5fe2:	4665      	mov	r5, ip
c0de5fe4:	f850 0028 	ldr.w	r0, [r0, r8, lsl #2]
c0de5fe8:	f005 fee2 	bl	c0debdb0 <pic>
c0de5fec:	4639      	mov	r1, r7
c0de5fee:	0e02      	lsrs	r2, r0, #24
c0de5ff0:	46ac      	mov	ip, r5
c0de5ff2:	9d01      	ldr	r5, [sp, #4]
c0de5ff4:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de5ff8:	70ca      	strb	r2, [r1, #3]
c0de5ffa:	0c02      	lsrs	r2, r0, #16
c0de5ffc:	0a00      	lsrs	r0, r0, #8
c0de5ffe:	708a      	strb	r2, [r1, #2]
c0de6000:	7048      	strb	r0, [r1, #1]
c0de6002:	7930      	ldrb	r0, [r6, #4]
c0de6004:	7971      	ldrb	r1, [r6, #5]
c0de6006:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de600a:	4639      	mov	r1, r7
c0de600c:	f887 c013 	strb.w	ip, [r7, #19]
c0de6010:	4632      	mov	r2, r6
c0de6012:	3828      	subs	r0, #40	@ 0x28
c0de6014:	f801 6f12 	strb.w	r6, [r1, #18]!
c0de6018:	f881 b002 	strb.w	fp, [r1, #2]
c0de601c:	f881 a003 	strb.w	sl, [r1, #3]
c0de6020:	f04f 0b00 	mov.w	fp, #0
c0de6024:	46aa      	mov	sl, r5
c0de6026:	f896 1023 	ldrb.w	r1, [r6, #35]	@ 0x23
c0de602a:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de602e:	f886 b01d 	strb.w	fp, [r6, #29]
c0de6032:	f001 fdd5 	bl	c0de7be0 <OUTLINED_FUNCTION_66>
c0de6036:	4b36      	ldr	r3, [pc, #216]	@ (c0de6110 <nbgl_layoutAddRadioChoice+0x218>)
c0de6038:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de603c:	600f      	str	r7, [r1, #0]
c0de603e:	f819 1003 	ldrb.w	r1, [r9, r3]
c0de6042:	1c4a      	adds	r2, r1, #1
c0de6044:	3114      	adds	r1, #20
c0de6046:	f809 2003 	strb.w	r2, [r9, r3]
c0de604a:	2201      	movs	r2, #1
c0de604c:	77b1      	strb	r1, [r6, #30]
c0de604e:	2104      	movs	r1, #4
c0de6050:	7732      	strb	r2, [r6, #28]
c0de6052:	f887 b021 	strb.w	fp, [r7, #33]	@ 0x21
c0de6056:	f887 1020 	strb.w	r1, [r7, #32]
c0de605a:	75b9      	strb	r1, [r7, #22]
c0de605c:	79aa      	ldrb	r2, [r5, #6]
c0de605e:	eba8 0302 	sub.w	r3, r8, r2
c0de6062:	fab3 f383 	clz	r3, r3
c0de6066:	095b      	lsrs	r3, r3, #5
c0de6068:	f884 3021 	strb.w	r3, [r4, #33]	@ 0x21
c0de606c:	7138      	strb	r0, [r7, #4]
c0de606e:	0a00      	lsrs	r0, r0, #8
c0de6070:	7178      	strb	r0, [r7, #5]
c0de6072:	ebb8 0002 	subs.w	r0, r8, r2
c0de6076:	bf18      	it	ne
c0de6078:	2001      	movne	r0, #1
c0de607a:	77f8      	strb	r0, [r7, #31]
c0de607c:	4590      	cmp	r8, r2
c0de607e:	f04f 000b 	mov.w	r0, #11
c0de6082:	bf08      	it	eq
c0de6084:	200c      	moveq	r0, #12
c0de6086:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de608a:	f005 fcbf 	bl	c0deba0c <nbgl_getFontHeight>
c0de608e:	9d02      	ldr	r5, [sp, #8]
c0de6090:	f887 b007 	strb.w	fp, [r7, #7]
c0de6094:	71b8      	strb	r0, [r7, #6]
c0de6096:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de609a:	08c0      	lsrs	r0, r0, #3
c0de609c:	f000 f83c 	bl	c0de6118 <createHorizontalLine>
c0de60a0:	f8d5 10a0 	ldr.w	r1, [r5, #160]	@ 0xa0
c0de60a4:	f108 0801 	add.w	r8, r8, #1
c0de60a8:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de60ac:	784c      	ldrb	r4, [r1, #1]
c0de60ae:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de60b2:	788f      	ldrb	r7, [r1, #2]
c0de60b4:	78c9      	ldrb	r1, [r1, #3]
c0de60b6:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de60ba:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de60be:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de60c2:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
c0de60c6:	f8d5 10a0 	ldr.w	r1, [r5, #160]	@ 0xa0
c0de60ca:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de60ce:	784b      	ldrb	r3, [r1, #1]
c0de60d0:	788c      	ldrb	r4, [r1, #2]
c0de60d2:	78ce      	ldrb	r6, [r1, #3]
c0de60d4:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de60d8:	ea44 2306 	orr.w	r3, r4, r6, lsl #8
c0de60dc:	ea42 4203 	orr.w	r2, r2, r3, lsl #16
c0de60e0:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de60e4:	3301      	adds	r3, #1
c0de60e6:	b2dc      	uxtb	r4, r3
c0de60e8:	f801 3c02 	strb.w	r3, [r1, #-2]
c0de60ec:	21ff      	movs	r1, #255	@ 0xff
c0de60ee:	f842 0024 	str.w	r0, [r2, r4, lsl #2]
c0de60f2:	7641      	strb	r1, [r0, #25]
c0de60f4:	7681      	strb	r1, [r0, #26]
c0de60f6:	f8d5 00a0 	ldr.w	r0, [r5, #160]	@ 0xa0
c0de60fa:	f001 fb09 	bl	c0de7710 <OUTLINED_FUNCTION_0>
c0de60fe:	e709      	b.n	c0de5f14 <nbgl_layoutAddRadioChoice+0x1c>
c0de6100:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de6104:	e000      	b.n	c0de6108 <nbgl_layoutAddRadioChoice+0x210>
c0de6106:	2000      	movs	r0, #0
c0de6108:	b004      	add	sp, #16
c0de610a:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de610e:	bf00      	nop
c0de6110:	00001908 	.word	0x00001908
c0de6114:	00005adb 	.word	0x00005adb

c0de6118 <createHorizontalLine>:
c0de6118:	b580      	push	{r7, lr}
c0de611a:	4601      	mov	r1, r0
c0de611c:	2003      	movs	r0, #3
c0de611e:	f005 fc66 	bl	c0deb9ee <nbgl_objPoolGet>
c0de6122:	2100      	movs	r1, #0
c0de6124:	22e0      	movs	r2, #224	@ 0xe0
c0de6126:	71c1      	strb	r1, [r0, #7]
c0de6128:	2101      	movs	r1, #1
c0de612a:	7102      	strb	r2, [r0, #4]
c0de612c:	2202      	movs	r2, #2
c0de612e:	7181      	strb	r1, [r0, #6]
c0de6130:	7141      	strb	r1, [r0, #5]
c0de6132:	f880 2020 	strb.w	r2, [r0, #32]
c0de6136:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de613a:	77c1      	strb	r1, [r0, #31]
c0de613c:	bd80      	pop	{r7, pc}

c0de613e <nbgl_layoutAddCenteredInfo>:
c0de613e:	b570      	push	{r4, r5, r6, lr}
c0de6140:	b08a      	sub	sp, #40	@ 0x28
c0de6142:	ae01      	add	r6, sp, #4
c0de6144:	460c      	mov	r4, r1
c0de6146:	4605      	mov	r5, r0
c0de6148:	2124      	movs	r1, #36	@ 0x24
c0de614a:	4630      	mov	r0, r6
c0de614c:	f006 f852 	bl	c0dec1f4 <__aeabi_memclr>
c0de6150:	b33d      	cbz	r5, c0de61a2 <nbgl_layoutAddCenteredInfo+0x64>
c0de6152:	6820      	ldr	r0, [r4, #0]
c0de6154:	68e1      	ldr	r1, [r4, #12]
c0de6156:	9102      	str	r1, [sp, #8]
c0de6158:	b128      	cbz	r0, c0de6166 <nbgl_layoutAddCenteredInfo+0x28>
c0de615a:	7c61      	ldrb	r1, [r4, #17]
c0de615c:	2210      	movs	r2, #16
c0de615e:	2903      	cmp	r1, #3
c0de6160:	bf08      	it	eq
c0de6162:	2214      	moveq	r2, #20
c0de6164:	50b0      	str	r0, [r6, r2]
c0de6166:	6860      	ldr	r0, [r4, #4]
c0de6168:	b128      	cbz	r0, c0de6176 <nbgl_layoutAddCenteredInfo+0x38>
c0de616a:	7c61      	ldrb	r1, [r4, #17]
c0de616c:	2218      	movs	r2, #24
c0de616e:	2901      	cmp	r1, #1
c0de6170:	bf08      	it	eq
c0de6172:	2214      	moveq	r2, #20
c0de6174:	50b0      	str	r0, [r6, r2]
c0de6176:	68a0      	ldr	r0, [r4, #8]
c0de6178:	b128      	cbz	r0, c0de6186 <nbgl_layoutAddCenteredInfo+0x48>
c0de617a:	7c61      	ldrb	r1, [r4, #17]
c0de617c:	2218      	movs	r2, #24
c0de617e:	2902      	cmp	r1, #2
c0de6180:	bf08      	it	eq
c0de6182:	221c      	moveq	r2, #28
c0de6184:	50b0      	str	r0, [r6, r2]
c0de6186:	a901      	add	r1, sp, #4
c0de6188:	4628      	mov	r0, r5
c0de618a:	f000 f815 	bl	c0de61b8 <addContentCenter>
c0de618e:	7c21      	ldrb	r1, [r4, #16]
c0de6190:	b151      	cbz	r1, c0de61a8 <nbgl_layoutAddCenteredInfo+0x6a>
c0de6192:	2100      	movs	r1, #0
c0de6194:	2220      	movs	r2, #32
c0de6196:	7601      	strb	r1, [r0, #24]
c0de6198:	75c2      	strb	r2, [r0, #23]
c0de619a:	7581      	strb	r1, [r0, #22]
c0de619c:	8a61      	ldrh	r1, [r4, #18]
c0de619e:	3120      	adds	r1, #32
c0de61a0:	e003      	b.n	c0de61aa <nbgl_layoutAddCenteredInfo+0x6c>
c0de61a2:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de61a6:	e005      	b.n	c0de61b4 <nbgl_layoutAddCenteredInfo+0x76>
c0de61a8:	8a61      	ldrh	r1, [r4, #18]
c0de61aa:	7641      	strb	r1, [r0, #25]
c0de61ac:	0a09      	lsrs	r1, r1, #8
c0de61ae:	7681      	strb	r1, [r0, #26]
c0de61b0:	f001 fc68 	bl	c0de7a84 <OUTLINED_FUNCTION_36>
c0de61b4:	b00a      	add	sp, #40	@ 0x28
c0de61b6:	bd70      	pop	{r4, r5, r6, pc}

c0de61b8 <addContentCenter>:
c0de61b8:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de61bc:	4682      	mov	sl, r0
c0de61be:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de61c2:	4688      	mov	r8, r1
c0de61c4:	f001 fbac 	bl	c0de7920 <OUTLINED_FUNCTION_19>
c0de61c8:	2700      	movs	r7, #0
c0de61ca:	4683      	mov	fp, r0
c0de61cc:	f880 7020 	strb.w	r7, [r0, #32]
c0de61d0:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de61d4:	08c1      	lsrs	r1, r0, #3
c0de61d6:	2006      	movs	r0, #6
c0de61d8:	f005 fc0e 	bl	c0deb9f8 <nbgl_containerPoolGet>
c0de61dc:	4659      	mov	r1, fp
c0de61de:	0e02      	lsrs	r2, r0, #24
c0de61e0:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de61e4:	f001 fb8b 	bl	c0de78fe <OUTLINED_FUNCTION_17>
c0de61e8:	f88b 0023 	strb.w	r0, [fp, #35]	@ 0x23
c0de61ec:	f8d8 0004 	ldr.w	r0, [r8, #4]
c0de61f0:	2800      	cmp	r0, #0
c0de61f2:	f000 8093 	beq.w	c0de631c <addContentCenter+0x164>
c0de61f6:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de61fa:	f001 fbd3 	bl	c0de79a4 <OUTLINED_FUNCTION_26>
c0de61fe:	4607      	mov	r7, r0
c0de6200:	f001 fc5b 	bl	c0de7aba <OUTLINED_FUNCTION_42>
c0de6204:	bfc8      	it	gt
c0de6206:	2000      	movgt	r0, #0
c0de6208:	77f8      	strb	r0, [r7, #31]
c0de620a:	f8d8 0004 	ldr.w	r0, [r8, #4]
c0de620e:	f005 fdcf 	bl	c0debdb0 <pic>
c0de6212:	4639      	mov	r1, r7
c0de6214:	0e02      	lsrs	r2, r0, #24
c0de6216:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de621a:	70ca      	strb	r2, [r1, #3]
c0de621c:	0c02      	lsrs	r2, r0, #16
c0de621e:	708a      	strb	r2, [r1, #2]
c0de6220:	0a01      	lsrs	r1, r0, #8
c0de6222:	f887 1022 	strb.w	r1, [r7, #34]	@ 0x22
c0de6226:	4659      	mov	r1, fp
c0de6228:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de622c:	784e      	ldrb	r6, [r1, #1]
c0de622e:	788c      	ldrb	r4, [r1, #2]
c0de6230:	78cd      	ldrb	r5, [r1, #3]
c0de6232:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de6236:	ea42 2206 	orr.w	r2, r2, r6, lsl #8
c0de623a:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de623e:	ea42 4204 	orr.w	r2, r2, r4, lsl #16
c0de6242:	f842 7023 	str.w	r7, [r2, r3, lsl #2]
c0de6246:	2202      	movs	r2, #2
c0de6248:	3301      	adds	r3, #1
c0de624a:	75ba      	strb	r2, [r7, #22]
c0de624c:	f8b8 2020 	ldrh.w	r2, [r8, #32]
c0de6250:	767a      	strb	r2, [r7, #25]
c0de6252:	f801 3c02 	strb.w	r3, [r1, #-2]
c0de6256:	0a14      	lsrs	r4, r2, #8
c0de6258:	7881      	ldrb	r1, [r0, #2]
c0de625a:	78c0      	ldrb	r0, [r0, #3]
c0de625c:	76bc      	strb	r4, [r7, #26]
c0de625e:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de6262:	1881      	adds	r1, r0, r2
c0de6264:	f898 0000 	ldrb.w	r0, [r8]
c0de6268:	2801      	cmp	r0, #1
c0de626a:	d158      	bne.n	c0de631e <addContentCenter+0x166>
c0de626c:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de6270:	9100      	str	r1, [sp, #0]
c0de6272:	f001 fb97 	bl	c0de79a4 <OUTLINED_FUNCTION_26>
c0de6276:	4606      	mov	r6, r0
c0de6278:	f001 fc1f 	bl	c0de7aba <OUTLINED_FUNCTION_42>
c0de627c:	bfc8      	it	gt
c0de627e:	2000      	movgt	r0, #0
c0de6280:	77f0      	strb	r0, [r6, #31]
c0de6282:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de6286:	6800      	ldr	r0, [r0, #0]
c0de6288:	6800      	ldr	r0, [r0, #0]
c0de628a:	f005 fd91 	bl	c0debdb0 <pic>
c0de628e:	4631      	mov	r1, r6
c0de6290:	0e02      	lsrs	r2, r0, #24
c0de6292:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de6296:	70ca      	strb	r2, [r1, #3]
c0de6298:	0c02      	lsrs	r2, r0, #16
c0de629a:	0a00      	lsrs	r0, r0, #8
c0de629c:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de62a0:	708a      	strb	r2, [r1, #2]
c0de62a2:	4658      	mov	r0, fp
c0de62a4:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de62a8:	7843      	ldrb	r3, [r0, #1]
c0de62aa:	7885      	ldrb	r5, [r0, #2]
c0de62ac:	78c4      	ldrb	r4, [r0, #3]
c0de62ae:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de62b2:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de62b6:	ea45 2304 	orr.w	r3, r5, r4, lsl #8
c0de62ba:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
c0de62be:	f841 6022 	str.w	r6, [r1, r2, lsl #2]
c0de62c2:	2102      	movs	r1, #2
c0de62c4:	75b1      	strb	r1, [r6, #22]
c0de62c6:	f8b8 100c 	ldrh.w	r1, [r8, #12]
c0de62ca:	75f1      	strb	r1, [r6, #23]
c0de62cc:	0a09      	lsrs	r1, r1, #8
c0de62ce:	f8b8 3020 	ldrh.w	r3, [r8, #32]
c0de62d2:	f8b8 400e 	ldrh.w	r4, [r8, #14]
c0de62d6:	7631      	strb	r1, [r6, #24]
c0de62d8:	1c51      	adds	r1, r2, #1
c0de62da:	4423      	add	r3, r4
c0de62dc:	7673      	strb	r3, [r6, #25]
c0de62de:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de62e2:	0a18      	lsrs	r0, r3, #8
c0de62e4:	76b0      	strb	r0, [r6, #26]
c0de62e6:	2000      	movs	r0, #0
c0de62e8:	f88a 00af 	strb.w	r0, [sl, #175]	@ 0xaf
c0de62ec:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de62f0:	f8ca 00a4 	str.w	r0, [sl, #164]	@ 0xa4
c0de62f4:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de62f8:	f040 0104 	orr.w	r1, r0, #4
c0de62fc:	08c0      	lsrs	r0, r0, #3
c0de62fe:	f88a 10ad 	strb.w	r1, [sl, #173]	@ 0xad
c0de6302:	49bb      	ldr	r1, [pc, #748]	@ (c0de65f0 <addContentCenter+0x438>)
c0de6304:	4479      	add	r1, pc
c0de6306:	9101      	str	r1, [sp, #4]
c0de6308:	f8d8 1008 	ldr.w	r1, [r8, #8]
c0de630c:	88c9      	ldrh	r1, [r1, #6]
c0de630e:	e9cd 1102 	strd	r1, r1, [sp, #8]
c0de6312:	a901      	add	r1, sp, #4
c0de6314:	f005 fb61 	bl	c0deb9da <nbgl_screenUpdateTicker>
c0de6318:	9900      	ldr	r1, [sp, #0]
c0de631a:	e000      	b.n	c0de631e <addContentCenter+0x166>
c0de631c:	2100      	movs	r1, #0
c0de631e:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de6322:	2800      	cmp	r0, #0
c0de6324:	d05f      	beq.n	c0de63e6 <addContentCenter+0x22e>
c0de6326:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de632a:	9100      	str	r1, [sp, #0]
c0de632c:	f001 f9f6 	bl	c0de771c <OUTLINED_FUNCTION_1>
c0de6330:	4606      	mov	r6, r0
c0de6332:	f001 fb1d 	bl	c0de7970 <OUTLINED_FUNCTION_24>
c0de6336:	bfc8      	it	gt
c0de6338:	2100      	movgt	r1, #0
c0de633a:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de633e:	77f1      	strb	r1, [r6, #31]
c0de6340:	f005 fd36 	bl	c0debdb0 <pic>
c0de6344:	4601      	mov	r1, r0
c0de6346:	2001      	movs	r0, #1
c0de6348:	2301      	movs	r3, #1
c0de634a:	7170      	strb	r0, [r6, #5]
c0de634c:	20a0      	movs	r0, #160	@ 0xa0
c0de634e:	0e0a      	lsrs	r2, r1, #24
c0de6350:	7130      	strb	r0, [r6, #4]
c0de6352:	200d      	movs	r0, #13
c0de6354:	f001 fbfb 	bl	c0de7b4e <OUTLINED_FUNCTION_52>
c0de6358:	4630      	mov	r0, r6
c0de635a:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de635e:	70c2      	strb	r2, [r0, #3]
c0de6360:	0c0a      	lsrs	r2, r1, #16
c0de6362:	7082      	strb	r2, [r0, #2]
c0de6364:	0a08      	lsrs	r0, r1, #8
c0de6366:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de636a:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de636e:	f896 0024 	ldrb.w	r0, [r6, #36]	@ 0x24
c0de6372:	f040 0001 	orr.w	r0, r0, #1
c0de6376:	f886 0024 	strb.w	r0, [r6, #36]	@ 0x24
c0de637a:	f001 fc23 	bl	c0de7bc4 <OUTLINED_FUNCTION_62>
c0de637e:	71b0      	strb	r0, [r6, #6]
c0de6380:	0a01      	lsrs	r1, r0, #8
c0de6382:	f89b c020 	ldrb.w	ip, [fp, #32]
c0de6386:	71f1      	strb	r1, [r6, #7]
c0de6388:	f1bc 0f00 	cmp.w	ip, #0
c0de638c:	d010      	beq.n	c0de63b0 <addContentCenter+0x1f8>
c0de638e:	4633      	mov	r3, r6
c0de6390:	0e3a      	lsrs	r2, r7, #24
c0de6392:	f803 7f12 	strb.w	r7, [r3, #18]!
c0de6396:	70da      	strb	r2, [r3, #3]
c0de6398:	0c3a      	lsrs	r2, r7, #16
c0de639a:	709a      	strb	r2, [r3, #2]
c0de639c:	0a3a      	lsrs	r2, r7, #8
c0de639e:	705a      	strb	r2, [r3, #1]
c0de63a0:	f8b8 2020 	ldrh.w	r2, [r8, #32]
c0de63a4:	3218      	adds	r2, #24
c0de63a6:	0a14      	lsrs	r4, r2, #8
c0de63a8:	71da      	strb	r2, [r3, #7]
c0de63aa:	721c      	strb	r4, [r3, #8]
c0de63ac:	2308      	movs	r3, #8
c0de63ae:	e004      	b.n	c0de63ba <addContentCenter+0x202>
c0de63b0:	7e72      	ldrb	r2, [r6, #25]
c0de63b2:	7eb3      	ldrb	r3, [r6, #26]
c0de63b4:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de63b8:	2302      	movs	r3, #2
c0de63ba:	75b3      	strb	r3, [r6, #22]
c0de63bc:	465b      	mov	r3, fp
c0de63be:	f813 4f22 	ldrb.w	r4, [r3, #34]!
c0de63c2:	785d      	ldrb	r5, [r3, #1]
c0de63c4:	789f      	ldrb	r7, [r3, #2]
c0de63c6:	78d9      	ldrb	r1, [r3, #3]
c0de63c8:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de63cc:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de63d0:	ea44 4101 	orr.w	r1, r4, r1, lsl #16
c0de63d4:	f841 602c 	str.w	r6, [r1, ip, lsl #2]
c0de63d8:	f10c 0101 	add.w	r1, ip, #1
c0de63dc:	f803 1c02 	strb.w	r1, [r3, #-2]
c0de63e0:	9900      	ldr	r1, [sp, #0]
c0de63e2:	4408      	add	r0, r1
c0de63e4:	1881      	adds	r1, r0, r2
c0de63e6:	f8d8 0014 	ldr.w	r0, [r8, #20]
c0de63ea:	b3e8      	cbz	r0, c0de6468 <addContentCenter+0x2b0>
c0de63ec:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de63f0:	9100      	str	r1, [sp, #0]
c0de63f2:	f001 f993 	bl	c0de771c <OUTLINED_FUNCTION_1>
c0de63f6:	4607      	mov	r7, r0
c0de63f8:	f001 faba 	bl	c0de7970 <OUTLINED_FUNCTION_24>
c0de63fc:	bfc8      	it	gt
c0de63fe:	2100      	movgt	r1, #0
c0de6400:	f8d8 0014 	ldr.w	r0, [r8, #20]
c0de6404:	77f9      	strb	r1, [r7, #31]
c0de6406:	f005 fcd3 	bl	c0debdb0 <pic>
c0de640a:	4601      	mov	r1, r0
c0de640c:	2001      	movs	r0, #1
c0de640e:	f001 fbaf 	bl	c0de7b70 <OUTLINED_FUNCTION_55>
c0de6412:	200c      	movs	r0, #12
c0de6414:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de6418:	2005      	movs	r0, #5
c0de641a:	f001 fa85 	bl	c0de7928 <OUTLINED_FUNCTION_20>
c0de641e:	200c      	movs	r0, #12
c0de6420:	f005 fafe 	bl	c0deba20 <nbgl_getTextHeightInWidth>
c0de6424:	f001 fb38 	bl	c0de7a98 <OUTLINED_FUNCTION_39>
c0de6428:	d01a      	beq.n	c0de6460 <addContentCenter+0x2a8>
c0de642a:	f001 f9ff 	bl	c0de782c <OUTLINED_FUNCTION_10>
c0de642e:	70ae      	strb	r6, [r5, #2]
c0de6430:	2618      	movs	r6, #24
c0de6432:	706b      	strb	r3, [r5, #1]
c0de6434:	2300      	movs	r3, #0
c0de6436:	71ee      	strb	r6, [r5, #7]
c0de6438:	2608      	movs	r6, #8
c0de643a:	722b      	strb	r3, [r5, #8]
c0de643c:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de6440:	712e      	strb	r6, [r5, #4]
c0de6442:	460e      	mov	r6, r1
c0de6444:	7ee4      	ldrb	r4, [r4, #27]
c0de6446:	2c02      	cmp	r4, #2
c0de6448:	bf1d      	ittte	ne
c0de644a:	76bb      	strbne	r3, [r7, #26]
c0de644c:	2310      	movne	r3, #16
c0de644e:	767b      	strbne	r3, [r7, #25]
c0de6450:	f8b8 3020 	ldrheq.w	r3, [r8, #32]
c0de6454:	bf01      	itttt	eq
c0de6456:	3318      	addeq	r3, #24
c0de6458:	767b      	strbeq	r3, [r7, #25]
c0de645a:	0a1c      	lsreq	r4, r3, #8
c0de645c:	76bc      	strbeq	r4, [r7, #26]
c0de645e:	e001      	b.n	c0de6464 <addContentCenter+0x2ac>
c0de6460:	f001 f974 	bl	c0de774c <OUTLINED_FUNCTION_3>
c0de6464:	f001 fac9 	bl	c0de79fa <OUTLINED_FUNCTION_30>
c0de6468:	f8d8 0018 	ldr.w	r0, [r8, #24]
c0de646c:	2800      	cmp	r0, #0
c0de646e:	d04f      	beq.n	c0de6510 <addContentCenter+0x358>
c0de6470:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de6474:	9100      	str	r1, [sp, #0]
c0de6476:	f001 f951 	bl	c0de771c <OUTLINED_FUNCTION_1>
c0de647a:	4607      	mov	r7, r0
c0de647c:	f001 fa78 	bl	c0de7970 <OUTLINED_FUNCTION_24>
c0de6480:	bfc8      	it	gt
c0de6482:	2100      	movgt	r1, #0
c0de6484:	f8d8 0018 	ldr.w	r0, [r8, #24]
c0de6488:	77f9      	strb	r1, [r7, #31]
c0de648a:	f005 fc91 	bl	c0debdb0 <pic>
c0de648e:	4601      	mov	r1, r0
c0de6490:	2001      	movs	r0, #1
c0de6492:	f001 fb6d 	bl	c0de7b70 <OUTLINED_FUNCTION_55>
c0de6496:	200b      	movs	r0, #11
c0de6498:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de649c:	2005      	movs	r0, #5
c0de649e:	f887 0020 	strb.w	r0, [r7, #32]
c0de64a2:	f001 f93f 	bl	c0de7724 <OUTLINED_FUNCTION_2>
c0de64a6:	f001 faf7 	bl	c0de7a98 <OUTLINED_FUNCTION_39>
c0de64aa:	d02d      	beq.n	c0de6508 <addContentCenter+0x350>
c0de64ac:	465a      	mov	r2, fp
c0de64ae:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de64b2:	7854      	ldrb	r4, [r2, #1]
c0de64b4:	7895      	ldrb	r5, [r2, #2]
c0de64b6:	78d2      	ldrb	r2, [r2, #3]
c0de64b8:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0de64bc:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de64c0:	463d      	mov	r5, r7
c0de64c2:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de64c6:	eb02 0381 	add.w	r3, r2, r1, lsl #2
c0de64ca:	f853 4c04 	ldr.w	r4, [r3, #-4]
c0de64ce:	f805 4f12 	strb.w	r4, [r5, #18]!
c0de64d2:	0e26      	lsrs	r6, r4, #24
c0de64d4:	70ee      	strb	r6, [r5, #3]
c0de64d6:	0c26      	lsrs	r6, r4, #16
c0de64d8:	0a24      	lsrs	r4, r4, #8
c0de64da:	70ae      	strb	r6, [r5, #2]
c0de64dc:	706c      	strb	r4, [r5, #1]
c0de64de:	2408      	movs	r4, #8
c0de64e0:	460e      	mov	r6, r1
c0de64e2:	f853 3c04 	ldr.w	r3, [r3, #-4]
c0de64e6:	712c      	strb	r4, [r5, #4]
c0de64e8:	7edb      	ldrb	r3, [r3, #27]
c0de64ea:	2b04      	cmp	r3, #4
c0de64ec:	bf01      	itttt	eq
c0de64ee:	2300      	moveq	r3, #0
c0de64f0:	76bb      	strbeq	r3, [r7, #26]
c0de64f2:	2310      	moveq	r3, #16
c0de64f4:	767b      	strbeq	r3, [r7, #25]
c0de64f6:	bf1f      	itttt	ne
c0de64f8:	f8b8 3020 	ldrhne.w	r3, [r8, #32]
c0de64fc:	3318      	addne	r3, #24
c0de64fe:	767b      	strbne	r3, [r7, #25]
c0de6500:	0a1c      	lsrne	r4, r3, #8
c0de6502:	bf18      	it	ne
c0de6504:	76bc      	strbne	r4, [r7, #26]
c0de6506:	e001      	b.n	c0de650c <addContentCenter+0x354>
c0de6508:	f001 f920 	bl	c0de774c <OUTLINED_FUNCTION_3>
c0de650c:	f001 fa75 	bl	c0de79fa <OUTLINED_FUNCTION_30>
c0de6510:	f8d8 001c 	ldr.w	r0, [r8, #28]
c0de6514:	b3c0      	cbz	r0, c0de6588 <addContentCenter+0x3d0>
c0de6516:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de651a:	9100      	str	r1, [sp, #0]
c0de651c:	f001 f8fe 	bl	c0de771c <OUTLINED_FUNCTION_1>
c0de6520:	2401      	movs	r4, #1
c0de6522:	4607      	mov	r7, r0
c0de6524:	77c4      	strb	r4, [r0, #31]
c0de6526:	f8d8 001c 	ldr.w	r0, [r8, #28]
c0de652a:	f005 fc41 	bl	c0debdb0 <pic>
c0de652e:	4601      	mov	r1, r0
c0de6530:	20a0      	movs	r0, #160	@ 0xa0
c0de6532:	2301      	movs	r3, #1
c0de6534:	717c      	strb	r4, [r7, #5]
c0de6536:	7138      	strb	r0, [r7, #4]
c0de6538:	200b      	movs	r0, #11
c0de653a:	0e0a      	lsrs	r2, r1, #24
c0de653c:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de6540:	2005      	movs	r0, #5
c0de6542:	f887 0020 	strb.w	r0, [r7, #32]
c0de6546:	f001 f8ed 	bl	c0de7724 <OUTLINED_FUNCTION_2>
c0de654a:	3010      	adds	r0, #16
c0de654c:	f001 faa4 	bl	c0de7a98 <OUTLINED_FUNCTION_39>
c0de6550:	d016      	beq.n	c0de6580 <addContentCenter+0x3c8>
c0de6552:	f001 f96b 	bl	c0de782c <OUTLINED_FUNCTION_10>
c0de6556:	706b      	strb	r3, [r5, #1]
c0de6558:	2300      	movs	r3, #0
c0de655a:	70ae      	strb	r6, [r5, #2]
c0de655c:	2608      	movs	r6, #8
c0de655e:	722b      	strb	r3, [r5, #8]
c0de6560:	2310      	movs	r3, #16
c0de6562:	712e      	strb	r6, [r5, #4]
c0de6564:	71eb      	strb	r3, [r5, #7]
c0de6566:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de656a:	7ee4      	ldrb	r4, [r4, #27]
c0de656c:	2c02      	cmp	r4, #2
c0de656e:	d105      	bne.n	c0de657c <addContentCenter+0x3c4>
c0de6570:	f8b8 3020 	ldrh.w	r3, [r8, #32]
c0de6574:	3310      	adds	r3, #16
c0de6576:	0a1c      	lsrs	r4, r3, #8
c0de6578:	767b      	strb	r3, [r7, #25]
c0de657a:	76bc      	strb	r4, [r7, #26]
c0de657c:	460e      	mov	r6, r1
c0de657e:	e001      	b.n	c0de6584 <addContentCenter+0x3cc>
c0de6580:	f001 f8e4 	bl	c0de774c <OUTLINED_FUNCTION_3>
c0de6584:	f001 fa39 	bl	c0de79fa <OUTLINED_FUNCTION_30>
c0de6588:	2001      	movs	r0, #1
c0de658a:	f88b 1006 	strb.w	r1, [fp, #6]
c0de658e:	f88b 0005 	strb.w	r0, [fp, #5]
c0de6592:	20a0      	movs	r0, #160	@ 0xa0
c0de6594:	f88b 0004 	strb.w	r0, [fp, #4]
c0de6598:	2005      	movs	r0, #5
c0de659a:	f88b 0016 	strb.w	r0, [fp, #22]
c0de659e:	2000      	movs	r0, #0
c0de65a0:	f88b 001f 	strb.w	r0, [fp, #31]
c0de65a4:	0a08      	lsrs	r0, r1, #8
c0de65a6:	f88b 0007 	strb.w	r0, [fp, #7]
c0de65aa:	f898 0022 	ldrb.w	r0, [r8, #34]	@ 0x22
c0de65ae:	b130      	cbz	r0, c0de65be <addContentCenter+0x406>
c0de65b0:	f101 0028 	add.w	r0, r1, #40	@ 0x28
c0de65b4:	f88b 0006 	strb.w	r0, [fp, #6]
c0de65b8:	0a00      	lsrs	r0, r0, #8
c0de65ba:	f88b 0007 	strb.w	r0, [fp, #7]
c0de65be:	f8da 00a0 	ldr.w	r0, [sl, #160]	@ 0xa0
c0de65c2:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de65c6:	7843      	ldrb	r3, [r0, #1]
c0de65c8:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de65cc:	7884      	ldrb	r4, [r0, #2]
c0de65ce:	78c0      	ldrb	r0, [r0, #3]
c0de65d0:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de65d4:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de65d8:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de65dc:	f840 b022 	str.w	fp, [r0, r2, lsl #2]
c0de65e0:	f8da 00a0 	ldr.w	r0, [sl, #160]	@ 0xa0
c0de65e4:	f001 f894 	bl	c0de7710 <OUTLINED_FUNCTION_0>
c0de65e8:	4658      	mov	r0, fp
c0de65ea:	b004      	add	sp, #16
c0de65ec:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de65f0:	00001305 	.word	0x00001305

c0de65f4 <nbgl_layoutAddContentCenter>:
c0de65f4:	b128      	cbz	r0, c0de6602 <nbgl_layoutAddContentCenter+0xe>
c0de65f6:	b580      	push	{r7, lr}
c0de65f8:	f7ff fdde 	bl	c0de61b8 <addContentCenter>
c0de65fc:	f001 fa42 	bl	c0de7a84 <OUTLINED_FUNCTION_36>
c0de6600:	bd80      	pop	{r7, pc}
c0de6602:	f001 ba50 	b.w	c0de7aa6 <OUTLINED_FUNCTION_40>

c0de6606 <nbgl_layoutAddQRCode>:
c0de6606:	2800      	cmp	r0, #0
c0de6608:	f000 810a 	beq.w	c0de6820 <nbgl_layoutAddQRCode+0x21a>
c0de660c:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de6610:	4680      	mov	r8, r0
c0de6612:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de6616:	460e      	mov	r6, r1
c0de6618:	f001 f982 	bl	c0de7920 <OUTLINED_FUNCTION_19>
c0de661c:	4682      	mov	sl, r0
c0de661e:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de6622:	08c1      	lsrs	r1, r0, #3
c0de6624:	2003      	movs	r0, #3
c0de6626:	f005 f9e7 	bl	c0deb9f8 <nbgl_containerPoolGet>
c0de662a:	4655      	mov	r5, sl
c0de662c:	0e01      	lsrs	r1, r0, #24
c0de662e:	2400      	movs	r4, #0
c0de6630:	f805 0f22 	strb.w	r0, [r5, #34]!
c0de6634:	f88a 4020 	strb.w	r4, [sl, #32]
c0de6638:	f001 fae5 	bl	c0de7c06 <OUTLINED_FUNCTION_69>
c0de663c:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de6640:	08c1      	lsrs	r1, r0, #3
c0de6642:	200a      	movs	r0, #10
c0de6644:	f005 f9d3 	bl	c0deb9ee <nbgl_objPoolGet>
c0de6648:	4683      	mov	fp, r0
c0de664a:	6830      	ldr	r0, [r6, #0]
c0de664c:	f005 fbb0 	bl	c0debdb0 <pic>
c0de6650:	f005 fe2c 	bl	c0dec2ac <strlen>
c0de6654:	283e      	cmp	r0, #62	@ 0x3e
c0de6656:	f04f 0000 	mov.w	r0, #0
c0de665a:	465f      	mov	r7, fp
c0de665c:	bf88      	it	hi
c0de665e:	2001      	movhi	r0, #1
c0de6660:	f88b 0020 	strb.w	r0, [fp, #32]
c0de6664:	f88b 401f 	strb.w	r4, [fp, #31]
c0de6668:	f44f 7084 	mov.w	r0, #264	@ 0x108
c0de666c:	bf88      	it	hi
c0de666e:	20e4      	movhi	r0, #228	@ 0xe4
c0de6670:	f88b 0004 	strb.w	r0, [fp, #4]
c0de6674:	f807 0f06 	strb.w	r0, [r7, #6]!
c0de6678:	0a00      	lsrs	r0, r0, #8
c0de667a:	7078      	strb	r0, [r7, #1]
c0de667c:	f88b 0005 	strb.w	r0, [fp, #5]
c0de6680:	6830      	ldr	r0, [r6, #0]
c0de6682:	f005 fb95 	bl	c0debdb0 <pic>
c0de6686:	4659      	mov	r1, fp
c0de6688:	0e02      	lsrs	r2, r0, #24
c0de668a:	f88b 4009 	strb.w	r4, [fp, #9]
c0de668e:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de6692:	f001 f934 	bl	c0de78fe <OUTLINED_FUNCTION_17>
c0de6696:	f88b 0022 	strb.w	r0, [fp, #34]	@ 0x22
c0de669a:	7828      	ldrb	r0, [r5, #0]
c0de669c:	78a9      	ldrb	r1, [r5, #2]
c0de669e:	78ea      	ldrb	r2, [r5, #3]
c0de66a0:	f89a 5023 	ldrb.w	r5, [sl, #35]	@ 0x23
c0de66a4:	f89a 3020 	ldrb.w	r3, [sl, #32]
c0de66a8:	ea40 2005 	orr.w	r0, r0, r5, lsl #8
c0de66ac:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de66b0:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de66b4:	7879      	ldrb	r1, [r7, #1]
c0de66b6:	f840 b023 	str.w	fp, [r0, r3, lsl #2]
c0de66ba:	2002      	movs	r0, #2
c0de66bc:	f88b 0016 	strb.w	r0, [fp, #22]
c0de66c0:	1c58      	adds	r0, r3, #1
c0de66c2:	f88a 0020 	strb.w	r0, [sl, #32]
c0de66c6:	7838      	ldrb	r0, [r7, #0]
c0de66c8:	ea40 2701 	orr.w	r7, r0, r1, lsl #8
c0de66cc:	6870      	ldr	r0, [r6, #4]
c0de66ce:	2800      	cmp	r0, #0
c0de66d0:	d057      	beq.n	c0de6782 <nbgl_layoutAddQRCode+0x17c>
c0de66d2:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de66d6:	f001 f821 	bl	c0de771c <OUTLINED_FUNCTION_1>
c0de66da:	4605      	mov	r5, r0
c0de66dc:	77c4      	strb	r4, [r0, #31]
c0de66de:	6870      	ldr	r0, [r6, #4]
c0de66e0:	f005 fb66 	bl	c0debdb0 <pic>
c0de66e4:	4601      	mov	r1, r0
c0de66e6:	2001      	movs	r0, #1
c0de66e8:	7168      	strb	r0, [r5, #5]
c0de66ea:	20a0      	movs	r0, #160	@ 0xa0
c0de66ec:	0e0a      	lsrs	r2, r1, #24
c0de66ee:	7128      	strb	r0, [r5, #4]
c0de66f0:	2005      	movs	r0, #5
c0de66f2:	f885 0020 	strb.w	r0, [r5, #32]
c0de66f6:	4628      	mov	r0, r5
c0de66f8:	f001 f8b0 	bl	c0de785c <OUTLINED_FUNCTION_11>
c0de66fc:	f885 0027 	strb.w	r0, [r5, #39]	@ 0x27
c0de6700:	f895 0024 	ldrb.w	r0, [r5, #36]	@ 0x24
c0de6704:	7bf2      	ldrb	r2, [r6, #15]
c0de6706:	f040 0001 	orr.w	r0, r0, #1
c0de670a:	f885 0024 	strb.w	r0, [r5, #36]	@ 0x24
c0de670e:	200d      	movs	r0, #13
c0de6710:	2a00      	cmp	r2, #0
c0de6712:	bf08      	it	eq
c0de6714:	200b      	moveq	r0, #11
c0de6716:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de671a:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de671e:	2301      	movs	r3, #1
c0de6720:	f005 f97e 	bl	c0deba20 <nbgl_getTextHeightInWidth>
c0de6724:	4651      	mov	r1, sl
c0de6726:	46be      	mov	lr, r7
c0de6728:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de672c:	784f      	ldrb	r7, [r1, #1]
c0de672e:	788c      	ldrb	r4, [r1, #2]
c0de6730:	78ca      	ldrb	r2, [r1, #3]
c0de6732:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de6736:	ea4c 2707 	orr.w	r7, ip, r7, lsl #8
c0de673a:	ea44 2202 	orr.w	r2, r4, r2, lsl #8
c0de673e:	46b4      	mov	ip, r6
c0de6740:	ea47 4202 	orr.w	r2, r7, r2, lsl #16
c0de6744:	462f      	mov	r7, r5
c0de6746:	eb02 0483 	add.w	r4, r2, r3, lsl #2
c0de674a:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de674e:	f807 4f12 	strb.w	r4, [r7, #18]!
c0de6752:	0e26      	lsrs	r6, r4, #24
c0de6754:	70fe      	strb	r6, [r7, #3]
c0de6756:	0c26      	lsrs	r6, r4, #16
c0de6758:	0a24      	lsrs	r4, r4, #8
c0de675a:	70be      	strb	r6, [r7, #2]
c0de675c:	74ec      	strb	r4, [r5, #19]
c0de675e:	f842 5023 	str.w	r5, [r2, r3, lsl #2]
c0de6762:	2200      	movs	r2, #0
c0de6764:	71a8      	strb	r0, [r5, #6]
c0de6766:	4666      	mov	r6, ip
c0de6768:	76aa      	strb	r2, [r5, #26]
c0de676a:	2218      	movs	r2, #24
c0de676c:	766a      	strb	r2, [r5, #25]
c0de676e:	2208      	movs	r2, #8
c0de6770:	75aa      	strb	r2, [r5, #22]
c0de6772:	0a02      	lsrs	r2, r0, #8
c0de6774:	4470      	add	r0, lr
c0de6776:	71ea      	strb	r2, [r5, #7]
c0de6778:	1c5a      	adds	r2, r3, #1
c0de677a:	f100 0718 	add.w	r7, r0, #24
c0de677e:	f801 2c02 	strb.w	r2, [r1, #-2]
c0de6782:	68b0      	ldr	r0, [r6, #8]
c0de6784:	2800      	cmp	r0, #0
c0de6786:	d04d      	beq.n	c0de6824 <nbgl_layoutAddQRCode+0x21e>
c0de6788:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de678c:	f000 ffc6 	bl	c0de771c <OUTLINED_FUNCTION_1>
c0de6790:	2401      	movs	r4, #1
c0de6792:	4605      	mov	r5, r0
c0de6794:	77c4      	strb	r4, [r0, #31]
c0de6796:	68b0      	ldr	r0, [r6, #8]
c0de6798:	f005 fb0a 	bl	c0debdb0 <pic>
c0de679c:	4601      	mov	r1, r0
c0de679e:	20a0      	movs	r0, #160	@ 0xa0
c0de67a0:	2301      	movs	r3, #1
c0de67a2:	716c      	strb	r4, [r5, #5]
c0de67a4:	7128      	strb	r0, [r5, #4]
c0de67a6:	200b      	movs	r0, #11
c0de67a8:	0e0a      	lsrs	r2, r1, #24
c0de67aa:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de67ae:	2005      	movs	r0, #5
c0de67b0:	f001 f816 	bl	c0de77e0 <OUTLINED_FUNCTION_7>
c0de67b4:	4651      	mov	r1, sl
c0de67b6:	9701      	str	r7, [sp, #4]
c0de67b8:	46b6      	mov	lr, r6
c0de67ba:	6876      	ldr	r6, [r6, #4]
c0de67bc:	f811 3f22 	ldrb.w	r3, [r1, #34]!
c0de67c0:	784c      	ldrb	r4, [r1, #1]
c0de67c2:	f891 c002 	ldrb.w	ip, [r1, #2]
c0de67c6:	78cf      	ldrb	r7, [r1, #3]
c0de67c8:	f811 2c02 	ldrb.w	r2, [r1, #-2]
c0de67cc:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de67d0:	ea4c 2407 	orr.w	r4, ip, r7, lsl #8
c0de67d4:	2700      	movs	r7, #0
c0de67d6:	ea43 4c04 	orr.w	ip, r3, r4, lsl #16
c0de67da:	eb0c 0482 	add.w	r4, ip, r2, lsl #2
c0de67de:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de67e2:	76af      	strb	r7, [r5, #26]
c0de67e4:	271c      	movs	r7, #28
c0de67e6:	2e00      	cmp	r6, #0
c0de67e8:	462e      	mov	r6, r5
c0de67ea:	bf08      	it	eq
c0de67ec:	2720      	moveq	r7, #32
c0de67ee:	766f      	strb	r7, [r5, #25]
c0de67f0:	f806 4f12 	strb.w	r4, [r6, #18]!
c0de67f4:	0e23      	lsrs	r3, r4, #24
c0de67f6:	70f3      	strb	r3, [r6, #3]
c0de67f8:	0c23      	lsrs	r3, r4, #16
c0de67fa:	70b3      	strb	r3, [r6, #2]
c0de67fc:	0a23      	lsrs	r3, r4, #8
c0de67fe:	74eb      	strb	r3, [r5, #19]
c0de6800:	f84c 5022 	str.w	r5, [ip, r2, lsl #2]
c0de6804:	3201      	adds	r2, #1
c0de6806:	71a8      	strb	r0, [r5, #6]
c0de6808:	2308      	movs	r3, #8
c0de680a:	f801 2c02 	strb.w	r2, [r1, #-2]
c0de680e:	9901      	ldr	r1, [sp, #4]
c0de6810:	75ab      	strb	r3, [r5, #22]
c0de6812:	0a03      	lsrs	r3, r0, #8
c0de6814:	71eb      	strb	r3, [r5, #7]
c0de6816:	4408      	add	r0, r1
c0de6818:	4438      	add	r0, r7
c0de681a:	f100 0708 	add.w	r7, r0, #8
c0de681e:	e002      	b.n	c0de6826 <nbgl_layoutAddQRCode+0x220>
c0de6820:	f001 b941 	b.w	c0de7aa6 <OUTLINED_FUNCTION_40>
c0de6824:	46b6      	mov	lr, r6
c0de6826:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de682a:	b2b9      	uxth	r1, r7
c0de682c:	7982      	ldrb	r2, [r0, #6]
c0de682e:	79c3      	ldrb	r3, [r0, #7]
c0de6830:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6834:	3a10      	subs	r2, #16
c0de6836:	428a      	cmp	r2, r1
c0de6838:	dd01      	ble.n	c0de683e <nbgl_layoutAddQRCode+0x238>
c0de683a:	4675      	mov	r5, lr
c0de683c:	e011      	b.n	c0de6862 <nbgl_layoutAddQRCode+0x25c>
c0de683e:	f89b 1020 	ldrb.w	r1, [fp, #32]
c0de6842:	4675      	mov	r5, lr
c0de6844:	b969      	cbnz	r1, c0de6862 <nbgl_layoutAddQRCode+0x25c>
c0de6846:	2100      	movs	r1, #0
c0de6848:	2284      	movs	r2, #132	@ 0x84
c0de684a:	3f84      	subs	r7, #132	@ 0x84
c0de684c:	f88b 1007 	strb.w	r1, [fp, #7]
c0de6850:	f88b 1005 	strb.w	r1, [fp, #5]
c0de6854:	2102      	movs	r1, #2
c0de6856:	f88b 2006 	strb.w	r2, [fp, #6]
c0de685a:	f88b 2004 	strb.w	r2, [fp, #4]
c0de685e:	f88b 1020 	strb.w	r1, [fp, #32]
c0de6862:	2100      	movs	r1, #0
c0de6864:	f88a 7006 	strb.w	r7, [sl, #6]
c0de6868:	f88a 101f 	strb.w	r1, [sl, #31]
c0de686c:	0a39      	lsrs	r1, r7, #8
c0de686e:	f88a 1007 	strb.w	r1, [sl, #7]
c0de6872:	7ba9      	ldrb	r1, [r5, #14]
c0de6874:	b109      	cbz	r1, c0de687a <nbgl_layoutAddQRCode+0x274>
c0de6876:	2005      	movs	r0, #5
c0de6878:	e00f      	b.n	c0de689a <nbgl_layoutAddQRCode+0x294>
c0de687a:	f001 f8ea 	bl	c0de7a52 <OUTLINED_FUNCTION_34>
c0de687e:	4651      	mov	r1, sl
c0de6880:	eb00 0082 	add.w	r0, r0, r2, lsl #2
c0de6884:	f850 0c04 	ldr.w	r0, [r0, #-4]
c0de6888:	f801 0f12 	strb.w	r0, [r1, #18]!
c0de688c:	0e02      	lsrs	r2, r0, #24
c0de688e:	70ca      	strb	r2, [r1, #3]
c0de6890:	0c02      	lsrs	r2, r0, #16
c0de6892:	0a00      	lsrs	r0, r0, #8
c0de6894:	7048      	strb	r0, [r1, #1]
c0de6896:	2008      	movs	r0, #8
c0de6898:	708a      	strb	r2, [r1, #2]
c0de689a:	f88a 0016 	strb.w	r0, [sl, #22]
c0de689e:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de68a2:	f001 f8d6 	bl	c0de7a52 <OUTLINED_FUNCTION_34>
c0de68a6:	f840 a022 	str.w	sl, [r0, r2, lsl #2]
c0de68aa:	2001      	movs	r0, #1
c0de68ac:	f88a 0005 	strb.w	r0, [sl, #5]
c0de68b0:	20a0      	movs	r0, #160	@ 0xa0
c0de68b2:	f88a 0004 	strb.w	r0, [sl, #4]
c0de68b6:	89a8      	ldrh	r0, [r5, #12]
c0de68b8:	f88a 0019 	strb.w	r0, [sl, #25]
c0de68bc:	0a00      	lsrs	r0, r0, #8
c0de68be:	f88a 001a 	strb.w	r0, [sl, #26]
c0de68c2:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de68c6:	f000 ff23 	bl	c0de7710 <OUTLINED_FUNCTION_0>
c0de68ca:	b2b8      	uxth	r0, r7
c0de68cc:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de68d0 <nbgl_layoutAddChoiceButtons>:
c0de68d0:	b510      	push	{r4, lr}
c0de68d2:	b086      	sub	sp, #24
c0de68d4:	2206      	movs	r2, #6
c0de68d6:	f10d 0c04 	add.w	ip, sp, #4
c0de68da:	f8ad 2000 	strh.w	r2, [sp]
c0de68de:	e891 001c 	ldmia.w	r1, {r2, r3, r4}
c0de68e2:	e8ac 001c 	stmia.w	ip!, {r2, r3, r4}
c0de68e6:	898a      	ldrh	r2, [r1, #12]
c0de68e8:	7b89      	ldrb	r1, [r1, #14]
c0de68ea:	f88d 1012 	strb.w	r1, [sp, #18]
c0de68ee:	4669      	mov	r1, sp
c0de68f0:	f8ad 2010 	strh.w	r2, [sp, #16]
c0de68f4:	f7fe fba6 	bl	c0de5044 <nbgl_layoutAddExtendedFooter>
c0de68f8:	b006      	add	sp, #24
c0de68fa:	bd10      	pop	{r4, pc}

c0de68fc <nbgl_layoutAddHorizontalButtons>:
c0de68fc:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de68fe:	2202      	movs	r2, #2
c0de6900:	f88d 2004 	strb.w	r2, [sp, #4]
c0de6904:	e9d1 2300 	ldrd	r2, r3, [r1]
c0de6908:	e9cd 2302 	strd	r2, r3, [sp, #8]
c0de690c:	890a      	ldrh	r2, [r1, #8]
c0de690e:	7a89      	ldrb	r1, [r1, #10]
c0de6910:	f8ad 2010 	strh.w	r2, [sp, #16]
c0de6914:	f88d 1012 	strb.w	r1, [sp, #18]
c0de6918:	a901      	add	r1, sp, #4
c0de691a:	f7fd ffff 	bl	c0de491c <nbgl_layoutAddUpFooter>
c0de691e:	b006      	add	sp, #24
c0de6920:	bd80      	pop	{r7, pc}
	...

c0de6924 <nbgl_layoutAddTagValueList>:
c0de6924:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de6928:	b088      	sub	sp, #32
c0de692a:	2800      	cmp	r0, #0
c0de692c:	9007      	str	r0, [sp, #28]
c0de692e:	f000 819f 	beq.w	c0de6c70 <nbgl_layoutAddTagValueList+0x34c>
c0de6932:	48d2      	ldr	r0, [pc, #840]	@ (c0de6c7c <nbgl_layoutAddTagValueList+0x358>)
c0de6934:	4688      	mov	r8, r1
c0de6936:	2100      	movs	r1, #0
c0de6938:	2700      	movs	r7, #0
c0de693a:	f8cd 8000 	str.w	r8, [sp]
c0de693e:	4478      	add	r0, pc
c0de6940:	9001      	str	r0, [sp, #4]
c0de6942:	f898 0008 	ldrb.w	r0, [r8, #8]
c0de6946:	4287      	cmp	r7, r0
c0de6948:	f080 8190 	bcs.w	c0de6c6c <nbgl_layoutAddTagValueList+0x348>
c0de694c:	f8d8 0000 	ldr.w	r0, [r8]
c0de6950:	e9cd 7104 	strd	r7, r1, [sp, #16]
c0de6954:	b110      	cbz	r0, c0de695c <nbgl_layoutAddTagValueList+0x38>
c0de6956:	eb00 0a01 	add.w	sl, r0, r1
c0de695a:	e007      	b.n	c0de696c <nbgl_layoutAddTagValueList+0x48>
c0de695c:	f898 0009 	ldrb.w	r0, [r8, #9]
c0de6960:	f8d8 1004 	ldr.w	r1, [r8, #4]
c0de6964:	4438      	add	r0, r7
c0de6966:	b2c0      	uxtb	r0, r0
c0de6968:	4788      	blx	r1
c0de696a:	4682      	mov	sl, r0
c0de696c:	9f07      	ldr	r7, [sp, #28]
c0de696e:	9c01      	ldr	r4, [sp, #4]
c0de6970:	f897 00ad 	ldrb.w	r0, [r7, #173]	@ 0xad
c0de6974:	08c1      	lsrs	r1, r0, #3
c0de6976:	2001      	movs	r0, #1
c0de6978:	47a0      	blx	r4
c0de697a:	4683      	mov	fp, r0
c0de697c:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de6980:	2800      	cmp	r0, #0
c0de6982:	f04f 0003 	mov.w	r0, #3
c0de6986:	bf08      	it	eq
c0de6988:	2002      	moveq	r0, #2
c0de698a:	f897 10ad 	ldrb.w	r1, [r7, #173]	@ 0xad
c0de698e:	08c9      	lsrs	r1, r1, #3
c0de6990:	f005 f832 	bl	c0deb9f8 <nbgl_containerPoolGet>
c0de6994:	465e      	mov	r6, fp
c0de6996:	0e01      	lsrs	r1, r0, #24
c0de6998:	f806 0f22 	strb.w	r0, [r6, #34]!
c0de699c:	f001 f94d 	bl	c0de7c3a <OUTLINED_FUNCTION_73>
c0de69a0:	f001 f92c 	bl	c0de7bfc <OUTLINED_FUNCTION_68>
c0de69a4:	4605      	mov	r5, r0
c0de69a6:	f001 f929 	bl	c0de7bfc <OUTLINED_FUNCTION_68>
c0de69aa:	4607      	mov	r7, r0
c0de69ac:	f8da 0000 	ldr.w	r0, [sl]
c0de69b0:	f04f 0801 	mov.w	r8, #1
c0de69b4:	f885 801f 	strb.w	r8, [r5, #31]
c0de69b8:	f005 f9fa 	bl	c0debdb0 <pic>
c0de69bc:	4601      	mov	r1, r0
c0de69be:	20a0      	movs	r0, #160	@ 0xa0
c0de69c0:	2301      	movs	r3, #1
c0de69c2:	f885 8005 	strb.w	r8, [r5, #5]
c0de69c6:	7128      	strb	r0, [r5, #4]
c0de69c8:	200b      	movs	r0, #11
c0de69ca:	0e0a      	lsrs	r2, r1, #24
c0de69cc:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de69d0:	2004      	movs	r0, #4
c0de69d2:	f000 ff05 	bl	c0de77e0 <OUTLINED_FUNCTION_7>
c0de69d6:	4680      	mov	r8, r0
c0de69d8:	71a8      	strb	r0, [r5, #6]
c0de69da:	0a00      	lsrs	r0, r0, #8
c0de69dc:	2400      	movs	r4, #0
c0de69de:	2109      	movs	r1, #9
c0de69e0:	71e8      	strb	r0, [r5, #7]
c0de69e2:	f105 0012 	add.w	r0, r5, #18
c0de69e6:	f885 4021 	strb.w	r4, [r5, #33]	@ 0x21
c0de69ea:	f005 fc03 	bl	c0dec1f4 <__aeabi_memclr>
c0de69ee:	f89b 1023 	ldrb.w	r1, [fp, #35]	@ 0x23
c0de69f2:	7832      	ldrb	r2, [r6, #0]
c0de69f4:	78b3      	ldrb	r3, [r6, #2]
c0de69f6:	78f6      	ldrb	r6, [r6, #3]
c0de69f8:	f89b 0020 	ldrb.w	r0, [fp, #32]
c0de69fc:	77fc      	strb	r4, [r7, #31]
c0de69fe:	f001 f909 	bl	c0de7c14 <OUTLINED_FUNCTION_70>
c0de6a02:	f841 5020 	str.w	r5, [r1, r0, lsl #2]
c0de6a06:	3001      	adds	r0, #1
c0de6a08:	f88b 0020 	strb.w	r0, [fp, #32]
c0de6a0c:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de6a10:	f005 f9ce 	bl	c0debdb0 <pic>
c0de6a14:	4601      	mov	r1, r0
c0de6a16:	2004      	movs	r0, #4
c0de6a18:	9e00      	ldr	r6, [sp, #0]
c0de6a1a:	f887 0020 	strb.w	r0, [r7, #32]
c0de6a1e:	4638      	mov	r0, r7
c0de6a20:	0e0a      	lsrs	r2, r1, #24
c0de6a22:	f000 ff1b 	bl	c0de785c <OUTLINED_FUNCTION_11>
c0de6a26:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de6a2a:	7b70      	ldrb	r0, [r6, #13]
c0de6a2c:	2800      	cmp	r0, #0
c0de6a2e:	f04f 000c 	mov.w	r0, #12
c0de6a32:	bf08      	it	eq
c0de6a34:	200d      	moveq	r0, #13
c0de6a36:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de6a3a:	f89a 200c 	ldrb.w	r2, [sl, #12]
c0de6a3e:	0752      	lsls	r2, r2, #29
c0de6a40:	d418      	bmi.n	c0de6a74 <nbgl_layoutAddTagValueList+0x150>
c0de6a42:	f8da 2008 	ldr.w	r2, [sl, #8]
c0de6a46:	2a00      	cmp	r2, #0
c0de6a48:	f000 810c 	beq.w	c0de6c64 <nbgl_layoutAddTagValueList+0x340>
c0de6a4c:	4610      	mov	r0, r2
c0de6a4e:	f005 f9af 	bl	c0debdb0 <pic>
c0de6a52:	4639      	mov	r1, r7
c0de6a54:	4604      	mov	r4, r0
c0de6a56:	f811 2f26 	ldrb.w	r2, [r1, #38]!
c0de6a5a:	784b      	ldrb	r3, [r1, #1]
c0de6a5c:	f811 0c04 	ldrb.w	r0, [r1, #-4]
c0de6a60:	f891 c002 	ldrb.w	ip, [r1, #2]
c0de6a64:	78c9      	ldrb	r1, [r1, #3]
c0de6a66:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6a6a:	ea4c 2101 	orr.w	r1, ip, r1, lsl #8
c0de6a6e:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6a72:	e001      	b.n	c0de6a78 <nbgl_layoutAddTagValueList+0x154>
c0de6a74:	4c82      	ldr	r4, [pc, #520]	@ (c0de6c80 <nbgl_layoutAddTagValueList+0x35c>)
c0de6a76:	447c      	add	r4, pc
c0de6a78:	7822      	ldrb	r2, [r4, #0]
c0de6a7a:	7863      	ldrb	r3, [r4, #1]
c0de6a7c:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6a80:	f5c2 72ca 	rsb	r2, r2, #404	@ 0x194
c0de6a84:	0a13      	lsrs	r3, r2, #8
c0de6a86:	713a      	strb	r2, [r7, #4]
c0de6a88:	b292      	uxth	r2, r2
c0de6a8a:	717b      	strb	r3, [r7, #5]
c0de6a8c:	7bb3      	ldrb	r3, [r6, #14]
c0de6a8e:	f004 ffcc 	bl	c0deba2a <nbgl_getTextNbLinesInWidth>
c0de6a92:	7af3      	ldrb	r3, [r6, #11]
c0de6a94:	f8cd 800c 	str.w	r8, [sp, #12]
c0de6a98:	b16b      	cbz	r3, c0de6ab6 <nbgl_layoutAddTagValueList+0x192>
c0de6a9a:	4298      	cmp	r0, r3
c0de6a9c:	d90b      	bls.n	c0de6ab6 <nbgl_layoutAddTagValueList+0x192>
c0de6a9e:	f897 2024 	ldrb.w	r2, [r7, #36]	@ 0x24
c0de6aa2:	7ab1      	ldrb	r1, [r6, #10]
c0de6aa4:	4618      	mov	r0, r3
c0de6aa6:	f887 3025 	strb.w	r3, [r7, #37]	@ 0x25
c0de6aaa:	f002 02fd 	and.w	r2, r2, #253	@ 0xfd
c0de6aae:	ea42 0141 	orr.w	r1, r2, r1, lsl #1
c0de6ab2:	f887 1024 	strb.w	r1, [r7, #36]	@ 0x24
c0de6ab6:	9006      	str	r0, [sp, #24]
c0de6ab8:	f897 0022 	ldrb.w	r0, [r7, #34]	@ 0x22
c0de6abc:	f004 ffa1 	bl	c0deba02 <nbgl_getFont>
c0de6ac0:	f897 2024 	ldrb.w	r2, [r7, #36]	@ 0x24
c0de6ac4:	7bb1      	ldrb	r1, [r6, #14]
c0de6ac6:	f890 c007 	ldrb.w	ip, [r0, #7]
c0de6aca:	0a28      	lsrs	r0, r5, #8
c0de6acc:	46b2      	mov	sl, r6
c0de6ace:	f8dd 8010 	ldr.w	r8, [sp, #16]
c0de6ad2:	74f8      	strb	r0, [r7, #19]
c0de6ad4:	4638      	mov	r0, r7
c0de6ad6:	f002 02fe 	and.w	r2, r2, #254	@ 0xfe
c0de6ada:	f800 5f12 	strb.w	r5, [r0, #18]!
c0de6ade:	4311      	orrs	r1, r2
c0de6ae0:	f887 1024 	strb.w	r1, [r7, #36]	@ 0x24
c0de6ae4:	0e29      	lsrs	r1, r5, #24
c0de6ae6:	70c1      	strb	r1, [r0, #3]
c0de6ae8:	0c29      	lsrs	r1, r5, #16
c0de6aea:	7081      	strb	r1, [r0, #2]
c0de6aec:	4658      	mov	r0, fp
c0de6aee:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6af2:	7843      	ldrb	r3, [r0, #1]
c0de6af4:	7885      	ldrb	r5, [r0, #2]
c0de6af6:	78c6      	ldrb	r6, [r0, #3]
c0de6af8:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de6afc:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de6b00:	ea45 2306 	orr.w	r3, r5, r6, lsl #8
c0de6b04:	2600      	movs	r6, #0
c0de6b06:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
c0de6b0a:	9b06      	ldr	r3, [sp, #24]
c0de6b0c:	76be      	strb	r6, [r7, #26]
c0de6b0e:	f887 6021 	strb.w	r6, [r7, #33]	@ 0x21
c0de6b12:	f841 7022 	str.w	r7, [r1, r2, lsl #2]
c0de6b16:	2104      	movs	r1, #4
c0de6b18:	7679      	strb	r1, [r7, #25]
c0de6b1a:	2107      	movs	r1, #7
c0de6b1c:	75b9      	strb	r1, [r7, #22]
c0de6b1e:	fb03 f10c 	mul.w	r1, r3, ip
c0de6b22:	71b9      	strb	r1, [r7, #6]
c0de6b24:	0a09      	lsrs	r1, r1, #8
c0de6b26:	71f9      	strb	r1, [r7, #7]
c0de6b28:	1c51      	adds	r1, r2, #1
c0de6b2a:	2201      	movs	r2, #1
c0de6b2c:	2c00      	cmp	r4, #0
c0de6b2e:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de6b32:	d048      	beq.n	c0de6bc6 <nbgl_layoutAddTagValueList+0x2a2>
c0de6b34:	9e07      	ldr	r6, [sp, #28]
c0de6b36:	f8cd c008 	str.w	ip, [sp, #8]
c0de6b3a:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de6b3e:	f000 ff31 	bl	c0de79a4 <OUTLINED_FUNCTION_26>
c0de6b42:	f89a 200c 	ldrb.w	r2, [sl, #12]
c0de6b46:	4605      	mov	r5, r0
c0de6b48:	4630      	mov	r0, r6
c0de6b4a:	4659      	mov	r1, fp
c0de6b4c:	2309      	movs	r3, #9
c0de6b4e:	f7fd fc55 	bl	c0de43fc <layoutAddCallbackObj>
c0de6b52:	0a21      	lsrs	r1, r4, #8
c0de6b54:	0e22      	lsrs	r2, r4, #24
c0de6b56:	f8dd c008 	ldr.w	ip, [sp, #8]
c0de6b5a:	f885 1022 	strb.w	r1, [r5, #34]	@ 0x22
c0de6b5e:	0a39      	lsrs	r1, r7, #8
c0de6b60:	74e9      	strb	r1, [r5, #19]
c0de6b62:	4629      	mov	r1, r5
c0de6b64:	f801 4f21 	strb.w	r4, [r1, #33]!
c0de6b68:	70ca      	strb	r2, [r1, #3]
c0de6b6a:	0c22      	lsrs	r2, r4, #16
c0de6b6c:	708a      	strb	r2, [r1, #2]
c0de6b6e:	4629      	mov	r1, r5
c0de6b70:	0e3a      	lsrs	r2, r7, #24
c0de6b72:	f801 7f12 	strb.w	r7, [r1, #18]!
c0de6b76:	70ca      	strb	r2, [r1, #3]
c0de6b78:	0c3a      	lsrs	r2, r7, #16
c0de6b7a:	708a      	strb	r2, [r1, #2]
c0de6b7c:	4659      	mov	r1, fp
c0de6b7e:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6b82:	784c      	ldrb	r4, [r1, #1]
c0de6b84:	788e      	ldrb	r6, [r1, #2]
c0de6b86:	78cf      	ldrb	r7, [r1, #3]
c0de6b88:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de6b8c:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de6b90:	ea46 2407 	orr.w	r4, r6, r7, lsl #8
c0de6b94:	2600      	movs	r6, #0
c0de6b96:	ea42 4204 	orr.w	r2, r2, r4, lsl #16
c0de6b9a:	762e      	strb	r6, [r5, #24]
c0de6b9c:	77ee      	strb	r6, [r5, #31]
c0de6b9e:	f842 5023 	str.w	r5, [r2, r3, lsl #2]
c0de6ba2:	220c      	movs	r2, #12
c0de6ba4:	75ea      	strb	r2, [r5, #23]
c0de6ba6:	f880 8005 	strb.w	r8, [r0, #5]
c0de6baa:	f108 000f 	add.w	r0, r8, #15
c0de6bae:	75aa      	strb	r2, [r5, #22]
c0de6bb0:	2201      	movs	r2, #1
c0de6bb2:	f801 6c05 	strb.w	r6, [r1, #-5]
c0de6bb6:	f801 0c04 	strb.w	r0, [r1, #-4]
c0de6bba:	1c58      	adds	r0, r3, #1
c0de6bbc:	9b06      	ldr	r3, [sp, #24]
c0de6bbe:	f801 2c06 	strb.w	r2, [r1, #-6]
c0de6bc2:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de6bc6:	9803      	ldr	r0, [sp, #12]
c0de6bc8:	f88b 2005 	strb.w	r2, [fp, #5]
c0de6bcc:	22a0      	movs	r2, #160	@ 0xa0
c0de6bce:	4647      	mov	r7, r8
c0de6bd0:	f88b 6018 	strb.w	r6, [fp, #24]
c0de6bd4:	f88b 601f 	strb.w	r6, [fp, #31]
c0de6bd8:	f88b 2004 	strb.w	r2, [fp, #4]
c0de6bdc:	2220      	movs	r2, #32
c0de6bde:	fb03 000c 	mla	r0, r3, ip, r0
c0de6be2:	f04f 0c00 	mov.w	ip, #0
c0de6be6:	f88b 2017 	strb.w	r2, [fp, #23]
c0de6bea:	3004      	adds	r0, #4
c0de6bec:	f88b 0006 	strb.w	r0, [fp, #6]
c0de6bf0:	0a00      	lsrs	r0, r0, #8
c0de6bf2:	f1b8 0f00 	cmp.w	r8, #0
c0de6bf6:	f88b 0007 	strb.w	r0, [fp, #7]
c0de6bfa:	d002      	beq.n	c0de6c02 <nbgl_layoutAddTagValueList+0x2de>
c0de6bfc:	2018      	movs	r0, #24
c0de6bfe:	46d0      	mov	r8, sl
c0de6c00:	e01b      	b.n	c0de6c3a <nbgl_layoutAddTagValueList+0x316>
c0de6c02:	9807      	ldr	r0, [sp, #28]
c0de6c04:	46d0      	mov	r8, sl
c0de6c06:	68c0      	ldr	r0, [r0, #12]
c0de6c08:	b1b0      	cbz	r0, c0de6c38 <nbgl_layoutAddTagValueList+0x314>
c0de6c0a:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de6c0e:	b199      	cbz	r1, c0de6c38 <nbgl_layoutAddTagValueList+0x314>
c0de6c10:	f810 2f22 	ldrb.w	r2, [r0, #34]!
c0de6c14:	7843      	ldrb	r3, [r0, #1]
c0de6c16:	7884      	ldrb	r4, [r0, #2]
c0de6c18:	78c0      	ldrb	r0, [r0, #3]
c0de6c1a:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6c1e:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de6c22:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de6c26:	eb00 0081 	add.w	r0, r0, r1, lsl #2
c0de6c2a:	f850 0c04 	ldr.w	r0, [r0, #-4]
c0de6c2e:	7ec0      	ldrb	r0, [r0, #27]
c0de6c30:	2803      	cmp	r0, #3
c0de6c32:	d101      	bne.n	c0de6c38 <nbgl_layoutAddTagValueList+0x314>
c0de6c34:	2018      	movs	r0, #24
c0de6c36:	e000      	b.n	c0de6c3a <nbgl_layoutAddTagValueList+0x316>
c0de6c38:	2000      	movs	r0, #0
c0de6c3a:	9e07      	ldr	r6, [sp, #28]
c0de6c3c:	f88b c01a 	strb.w	ip, [fp, #26]
c0de6c40:	f88b c016 	strb.w	ip, [fp, #22]
c0de6c44:	3701      	adds	r7, #1
c0de6c46:	f8d6 10a0 	ldr.w	r1, [r6, #160]	@ 0xa0
c0de6c4a:	f000 fd93 	bl	c0de7774 <OUTLINED_FUNCTION_4>
c0de6c4e:	f841 b023 	str.w	fp, [r1, r3, lsl #2]
c0de6c52:	f88b 0019 	strb.w	r0, [fp, #25]
c0de6c56:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de6c5a:	f000 fd59 	bl	c0de7710 <OUTLINED_FUNCTION_0>
c0de6c5e:	9905      	ldr	r1, [sp, #20]
c0de6c60:	3110      	adds	r1, #16
c0de6c62:	e66e      	b.n	c0de6942 <nbgl_layoutAddTagValueList+0x1e>
c0de6c64:	2400      	movs	r4, #0
c0de6c66:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de6c6a:	e70b      	b.n	c0de6a84 <nbgl_layoutAddTagValueList+0x160>
c0de6c6c:	2000      	movs	r0, #0
c0de6c6e:	e001      	b.n	c0de6c74 <nbgl_layoutAddTagValueList+0x350>
c0de6c70:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de6c74:	b008      	add	sp, #32
c0de6c76:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de6c7a:	bf00      	nop
c0de6c7c:	000050ad 	.word	0x000050ad
c0de6c80:	0000686a 	.word	0x0000686a

c0de6c84 <nbgl_layoutAddSeparationLine>:
c0de6c84:	b570      	push	{r4, r5, r6, lr}
c0de6c86:	f000 ffa0 	bl	c0de7bca <OUTLINED_FUNCTION_64>
c0de6c8a:	08c0      	lsrs	r0, r0, #3
c0de6c8c:	f7ff fa44 	bl	c0de6118 <createHorizontalLine>
c0de6c90:	f8d4 10a0 	ldr.w	r1, [r4, #160]	@ 0xa0
c0de6c94:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6c98:	784d      	ldrb	r5, [r1, #1]
c0de6c9a:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de6c9e:	788e      	ldrb	r6, [r1, #2]
c0de6ca0:	78c9      	ldrb	r1, [r1, #3]
c0de6ca2:	ea42 2205 	orr.w	r2, r2, r5, lsl #8
c0de6ca6:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de6caa:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6cae:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
c0de6cb2:	21ff      	movs	r1, #255	@ 0xff
c0de6cb4:	7641      	strb	r1, [r0, #25]
c0de6cb6:	7681      	strb	r1, [r0, #26]
c0de6cb8:	f000 ff2b 	bl	c0de7b12 <OUTLINED_FUNCTION_48>
c0de6cbc:	bd70      	pop	{r4, r5, r6, pc}

c0de6cbe <nbgl_layoutAddButton>:
c0de6cbe:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de6cc2:	b086      	sub	sp, #24
c0de6cc4:	b318      	cbz	r0, c0de6d0e <nbgl_layoutAddButton+0x50>
c0de6cc6:	4680      	mov	r8, r0
c0de6cc8:	7ac8      	ldrb	r0, [r1, #11]
c0de6cca:	460d      	mov	r5, r1
c0de6ccc:	b108      	cbz	r0, c0de6cd2 <nbgl_layoutAddButton+0x14>
c0de6cce:	7aa8      	ldrb	r0, [r5, #10]
c0de6cd0:	b300      	cbz	r0, c0de6d14 <nbgl_layoutAddButton+0x56>
c0de6cd2:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de6cd6:	f000 fddf 	bl	c0de7898 <OUTLINED_FUNCTION_13>
c0de6cda:	4606      	mov	r6, r0
c0de6cdc:	7a2a      	ldrb	r2, [r5, #8]
c0de6cde:	7b2b      	ldrb	r3, [r5, #12]
c0de6ce0:	4640      	mov	r0, r8
c0de6ce2:	4631      	mov	r1, r6
c0de6ce4:	f7fd fb8a 	bl	c0de43fc <layoutAddCallbackObj>
c0de6ce8:	b188      	cbz	r0, c0de6d0e <nbgl_layoutAddButton+0x50>
c0de6cea:	210c      	movs	r1, #12
c0de6cec:	2000      	movs	r0, #0
c0de6cee:	7671      	strb	r1, [r6, #25]
c0de6cf0:	2120      	movs	r1, #32
c0de6cf2:	76b0      	strb	r0, [r6, #26]
c0de6cf4:	7630      	strb	r0, [r6, #24]
c0de6cf6:	75b0      	strb	r0, [r6, #22]
c0de6cf8:	75f1      	strb	r1, [r6, #23]
c0de6cfa:	7a69      	ldrb	r1, [r5, #9]
c0de6cfc:	b1e9      	cbz	r1, c0de6d3a <nbgl_layoutAddButton+0x7c>
c0de6cfe:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de6d02:	2003      	movs	r0, #3
c0de6d04:	77f0      	strb	r0, [r6, #31]
c0de6d06:	2902      	cmp	r1, #2
c0de6d08:	bf18      	it	ne
c0de6d0a:	2002      	movne	r0, #2
c0de6d0c:	e019      	b.n	c0de6d42 <nbgl_layoutAddButton+0x84>
c0de6d0e:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de6d12:	e09f      	b.n	c0de6e54 <nbgl_layoutAddButton+0x196>
c0de6d14:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de6d18:	2800      	cmp	r0, #0
c0de6d1a:	f000 809e 	beq.w	c0de6e5a <nbgl_layoutAddButton+0x19c>
c0de6d1e:	2001      	movs	r0, #1
c0de6d20:	f88d 0000 	strb.w	r0, [sp]
c0de6d24:	e9d5 0100 	ldrd	r0, r1, [r5]
c0de6d28:	9001      	str	r0, [sp, #4]
c0de6d2a:	7b28      	ldrb	r0, [r5, #12]
c0de6d2c:	9102      	str	r1, [sp, #8]
c0de6d2e:	4669      	mov	r1, sp
c0de6d30:	f000 ff5d 	bl	c0de7bee <OUTLINED_FUNCTION_67>
c0de6d34:	f7fd fdf2 	bl	c0de491c <nbgl_layoutAddUpFooter>
c0de6d38:	e08c      	b.n	c0de6e54 <nbgl_layoutAddButton+0x196>
c0de6d3a:	2103      	movs	r1, #3
c0de6d3c:	77f0      	strb	r0, [r6, #31]
c0de6d3e:	f886 1021 	strb.w	r1, [r6, #33]	@ 0x21
c0de6d42:	f886 0020 	strb.w	r0, [r6, #32]
c0de6d46:	6828      	ldr	r0, [r5, #0]
c0de6d48:	f005 f832 	bl	c0debdb0 <pic>
c0de6d4c:	210c      	movs	r1, #12
c0de6d4e:	0e02      	lsrs	r2, r0, #24
c0de6d50:	f886 1023 	strb.w	r1, [r6, #35]	@ 0x23
c0de6d54:	4631      	mov	r1, r6
c0de6d56:	f000 fe59 	bl	c0de7a0c <OUTLINED_FUNCTION_31>
c0de6d5a:	f000 fdfe 	bl	c0de795a <OUTLINED_FUNCTION_22>
c0de6d5e:	4631      	mov	r1, r6
c0de6d60:	0e02      	lsrs	r2, r0, #24
c0de6d62:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de6d66:	f000 fef8 	bl	c0de7b5a <OUTLINED_FUNCTION_53>
c0de6d6a:	7aa8      	ldrb	r0, [r5, #10]
c0de6d6c:	b308      	cbz	r0, c0de6db2 <nbgl_layoutAddButton+0xf4>
c0de6d6e:	4632      	mov	r2, r6
c0de6d70:	f896 1026 	ldrb.w	r1, [r6, #38]	@ 0x26
c0de6d74:	f896 0023 	ldrb.w	r0, [r6, #35]	@ 0x23
c0de6d78:	f812 3f25 	ldrb.w	r3, [r2, #37]!
c0de6d7c:	f000 ff30 	bl	c0de7be0 <OUTLINED_FUNCTION_66>
c0de6d80:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de6d84:	f004 fe56 	bl	c0deba34 <nbgl_getTextWidth>
c0de6d88:	4631      	mov	r1, r6
c0de6d8a:	3040      	adds	r0, #64	@ 0x40
c0de6d8c:	f811 2f2e 	ldrb.w	r2, [r1, #46]!
c0de6d90:	784b      	ldrb	r3, [r1, #1]
c0de6d92:	788f      	ldrb	r7, [r1, #2]
c0de6d94:	78c9      	ldrb	r1, [r1, #3]
c0de6d96:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6d9a:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de6d9e:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
c0de6da2:	2100      	movs	r1, #0
c0de6da4:	b18a      	cbz	r2, c0de6dca <nbgl_layoutAddButton+0x10c>
c0de6da6:	7813      	ldrb	r3, [r2, #0]
c0de6da8:	7852      	ldrb	r2, [r2, #1]
c0de6daa:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de6dae:	320c      	adds	r2, #12
c0de6db0:	e00c      	b.n	c0de6dcc <nbgl_layoutAddButton+0x10e>
c0de6db2:	2000      	movs	r0, #0
c0de6db4:	71f0      	strb	r0, [r6, #7]
c0de6db6:	2058      	movs	r0, #88	@ 0x58
c0de6db8:	71b0      	strb	r0, [r6, #6]
c0de6dba:	2001      	movs	r0, #1
c0de6dbc:	7170      	strb	r0, [r6, #5]
c0de6dbe:	20a0      	movs	r0, #160	@ 0xa0
c0de6dc0:	7130      	strb	r0, [r6, #4]
c0de6dc2:	2004      	movs	r0, #4
c0de6dc4:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de6dc8:	e01c      	b.n	c0de6e04 <nbgl_layoutAddButton+0x146>
c0de6dca:	2200      	movs	r2, #0
c0de6dcc:	4410      	add	r0, r2
c0de6dce:	71f1      	strb	r1, [r6, #7]
c0de6dd0:	2140      	movs	r1, #64	@ 0x40
c0de6dd2:	71b1      	strb	r1, [r6, #6]
c0de6dd4:	2102      	movs	r1, #2
c0de6dd6:	0a02      	lsrs	r2, r0, #8
c0de6dd8:	7130      	strb	r0, [r6, #4]
c0de6dda:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de6dde:	7172      	strb	r2, [r6, #5]
c0de6de0:	7aea      	ldrb	r2, [r5, #11]
c0de6de2:	2a01      	cmp	r2, #1
c0de6de4:	d00e      	beq.n	c0de6e04 <nbgl_layoutAddButton+0x146>
c0de6de6:	b280      	uxth	r0, r0
c0de6de8:	f5c0 70d0 	rsb	r0, r0, #416	@ 0x1a0
c0de6dec:	fb90 f0f1 	sdiv	r0, r0, r1
c0de6df0:	4631      	mov	r1, r6
c0de6df2:	f811 2f17 	ldrb.w	r2, [r1, #23]!
c0de6df6:	784b      	ldrb	r3, [r1, #1]
c0de6df8:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6dfc:	4410      	add	r0, r2
c0de6dfe:	7008      	strb	r0, [r1, #0]
c0de6e00:	0a00      	lsrs	r0, r0, #8
c0de6e02:	7048      	strb	r0, [r1, #1]
c0de6e04:	2000      	movs	r0, #0
c0de6e06:	4631      	mov	r1, r6
c0de6e08:	f801 0f12 	strb.w	r0, [r1, #18]!
c0de6e0c:	74f0      	strb	r0, [r6, #19]
c0de6e0e:	70c8      	strb	r0, [r1, #3]
c0de6e10:	7088      	strb	r0, [r1, #2]
c0de6e12:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de6e16:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6e1a:	784f      	ldrb	r7, [r1, #1]
c0de6e1c:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de6e20:	788c      	ldrb	r4, [r1, #2]
c0de6e22:	78c9      	ldrb	r1, [r1, #3]
c0de6e24:	ea42 2207 	orr.w	r2, r2, r7, lsl #8
c0de6e28:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
c0de6e2c:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6e30:	2208      	movs	r2, #8
c0de6e32:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
c0de6e36:	2101      	movs	r1, #1
c0de6e38:	7770      	strb	r0, [r6, #29]
c0de6e3a:	7731      	strb	r1, [r6, #28]
c0de6e3c:	7aa9      	ldrb	r1, [r5, #10]
c0de6e3e:	2900      	cmp	r1, #0
c0de6e40:	bf08      	it	eq
c0de6e42:	2207      	moveq	r2, #7
c0de6e44:	77b2      	strb	r2, [r6, #30]
c0de6e46:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de6e4a:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de6e4e:	3201      	adds	r2, #1
c0de6e50:	f881 2020 	strb.w	r2, [r1, #32]
c0de6e54:	b006      	add	sp, #24
c0de6e56:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de6e5a:	2005      	movs	r0, #5
c0de6e5c:	f8ad 0000 	strh.w	r0, [sp]
c0de6e60:	e9d5 0100 	ldrd	r0, r1, [r5]
c0de6e64:	9001      	str	r0, [sp, #4]
c0de6e66:	7b28      	ldrb	r0, [r5, #12]
c0de6e68:	9102      	str	r1, [sp, #8]
c0de6e6a:	4669      	mov	r1, sp
c0de6e6c:	f000 febf 	bl	c0de7bee <OUTLINED_FUNCTION_67>
c0de6e70:	f7fe f8e8 	bl	c0de5044 <nbgl_layoutAddExtendedFooter>
c0de6e74:	e7ee      	b.n	c0de6e54 <nbgl_layoutAddButton+0x196>

c0de6e76 <nbgl_layoutAddLongPressButton>:
c0de6e76:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de6e78:	9102      	str	r1, [sp, #8]
c0de6e7a:	2100      	movs	r1, #0
c0de6e7c:	f88d 300d 	strb.w	r3, [sp, #13]
c0de6e80:	f88d 200c 	strb.w	r2, [sp, #12]
c0de6e84:	f88d 1004 	strb.w	r1, [sp, #4]
c0de6e88:	b118      	cbz	r0, c0de6e92 <nbgl_layoutAddLongPressButton+0x1c>
c0de6e8a:	a901      	add	r1, sp, #4
c0de6e8c:	f7fd fd46 	bl	c0de491c <nbgl_layoutAddUpFooter>
c0de6e90:	e001      	b.n	c0de6e96 <nbgl_layoutAddLongPressButton+0x20>
c0de6e92:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de6e96:	b006      	add	sp, #24
c0de6e98:	bd80      	pop	{r7, pc}

c0de6e9a <nbgl_layoutAddFooter>:
c0de6e9a:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de6e9c:	9101      	str	r1, [sp, #4]
c0de6e9e:	f240 1101 	movw	r1, #257	@ 0x101
c0de6ea2:	f88d 2009 	strb.w	r2, [sp, #9]
c0de6ea6:	2200      	movs	r2, #0
c0de6ea8:	f88d 300a 	strb.w	r3, [sp, #10]
c0de6eac:	f8ad 1000 	strh.w	r1, [sp]
c0de6eb0:	4669      	mov	r1, sp
c0de6eb2:	f88d 2008 	strb.w	r2, [sp, #8]
c0de6eb6:	f7fe f8c5 	bl	c0de5044 <nbgl_layoutAddExtendedFooter>
c0de6eba:	b006      	add	sp, #24
c0de6ebc:	bd80      	pop	{r7, pc}

c0de6ebe <nbgl_layoutAddSplitFooter>:
c0de6ebe:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de6ec0:	9101      	str	r1, [sp, #4]
c0de6ec2:	f44f 7181 	mov.w	r1, #258	@ 0x102
c0de6ec6:	f88d 200c 	strb.w	r2, [sp, #12]
c0de6eca:	9302      	str	r3, [sp, #8]
c0de6ecc:	f8ad 1000 	strh.w	r1, [sp]
c0de6ed0:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0de6ed2:	f88d 100e 	strb.w	r1, [sp, #14]
c0de6ed6:	9908      	ldr	r1, [sp, #32]
c0de6ed8:	f88d 100d 	strb.w	r1, [sp, #13]
c0de6edc:	4669      	mov	r1, sp
c0de6ede:	f7fe f8b1 	bl	c0de5044 <nbgl_layoutAddExtendedFooter>
c0de6ee2:	b006      	add	sp, #24
c0de6ee4:	bd80      	pop	{r7, pc}
	...

c0de6ee8 <nbgl_layoutAddHeader>:
c0de6ee8:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de6eec:	2800      	cmp	r0, #0
c0de6eee:	f000 822c 	beq.w	c0de734a <nbgl_layoutAddHeader+0x462>
c0de6ef2:	460d      	mov	r5, r1
c0de6ef4:	b119      	cbz	r1, c0de6efe <nbgl_layoutAddHeader+0x16>
c0de6ef6:	4604      	mov	r4, r0
c0de6ef8:	7828      	ldrb	r0, [r5, #0]
c0de6efa:	2806      	cmp	r0, #6
c0de6efc:	d903      	bls.n	c0de6f06 <nbgl_layoutAddHeader+0x1e>
c0de6efe:	f06f 0001 	mvn.w	r0, #1
c0de6f02:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de6f06:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de6f0a:	2601      	movs	r6, #1
c0de6f0c:	f000 fd08 	bl	c0de7920 <OUTLINED_FUNCTION_19>
c0de6f10:	f000 fe17 	bl	c0de7b42 <OUTLINED_FUNCTION_51>
c0de6f14:	60e0      	str	r0, [r4, #12]
c0de6f16:	f000 fe35 	bl	c0de7b84 <OUTLINED_FUNCTION_57>
c0de6f1a:	68e1      	ldr	r1, [r4, #12]
c0de6f1c:	0a02      	lsrs	r2, r0, #8
c0de6f1e:	0e03      	lsrs	r3, r0, #24
c0de6f20:	f881 2023 	strb.w	r2, [r1, #35]	@ 0x23
c0de6f24:	2202      	movs	r2, #2
c0de6f26:	f000 fe54 	bl	c0de7bd2 <OUTLINED_FUNCTION_65>
c0de6f2a:	70d3      	strb	r3, [r2, #3]
c0de6f2c:	7828      	ldrb	r0, [r5, #0]
c0de6f2e:	1e42      	subs	r2, r0, #1
c0de6f30:	2a02      	cmp	r2, #2
c0de6f32:	d311      	bcc.n	c0de6f58 <nbgl_layoutAddHeader+0x70>
c0de6f34:	2806      	cmp	r0, #6
c0de6f36:	f000 80b9 	beq.w	c0de70ac <nbgl_layoutAddHeader+0x1c4>
c0de6f3a:	2803      	cmp	r0, #3
c0de6f3c:	f000 8210 	beq.w	c0de7360 <nbgl_layoutAddHeader+0x478>
c0de6f40:	2804      	cmp	r0, #4
c0de6f42:	f000 80e4 	beq.w	c0de710e <nbgl_layoutAddHeader+0x226>
c0de6f46:	2805      	cmp	r0, #5
c0de6f48:	d006      	beq.n	c0de6f58 <nbgl_layoutAddHeader+0x70>
c0de6f4a:	2800      	cmp	r0, #0
c0de6f4c:	d1d7      	bne.n	c0de6efe <nbgl_layoutAddHeader+0x16>
c0de6f4e:	88a8      	ldrh	r0, [r5, #4]
c0de6f50:	7188      	strb	r0, [r1, #6]
c0de6f52:	0a00      	lsrs	r0, r0, #8
c0de6f54:	71c8      	strb	r0, [r1, #7]
c0de6f56:	e203      	b.n	c0de7360 <nbgl_layoutAddHeader+0x478>
c0de6f58:	f000 fdd8 	bl	c0de7b0c <OUTLINED_FUNCTION_46>
c0de6f5c:	9001      	str	r0, [sp, #4]
c0de6f5e:	7828      	ldrb	r0, [r5, #0]
c0de6f60:	210c      	movs	r1, #12
c0de6f62:	2805      	cmp	r0, #5
c0de6f64:	bf08      	it	eq
c0de6f66:	2111      	moveq	r1, #17
c0de6f68:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de6f6c:	f815 a001 	ldrb.w	sl, [r5, r1]
c0de6f70:	f000 fc92 	bl	c0de7898 <OUTLINED_FUNCTION_13>
c0de6f74:	4683      	mov	fp, r0
c0de6f76:	f04f 0803 	mov.w	r8, #3
c0de6f7a:	f1ba 0fff 	cmp.w	sl, #255	@ 0xff
c0de6f7e:	d00f      	beq.n	c0de6fa0 <nbgl_layoutAddHeader+0xb8>
c0de6f80:	7828      	ldrb	r0, [r5, #0]
c0de6f82:	210d      	movs	r1, #13
c0de6f84:	4652      	mov	r2, sl
c0de6f86:	2805      	cmp	r0, #5
c0de6f88:	bf08      	it	eq
c0de6f8a:	2113      	moveq	r1, #19
c0de6f8c:	5c6b      	ldrb	r3, [r5, r1]
c0de6f8e:	4620      	mov	r0, r4
c0de6f90:	4659      	mov	r1, fp
c0de6f92:	f7fd fa33 	bl	c0de43fc <layoutAddCallbackObj>
c0de6f96:	2800      	cmp	r0, #0
c0de6f98:	f000 81d7 	beq.w	c0de734a <nbgl_layoutAddHeader+0x462>
c0de6f9c:	2000      	movs	r0, #0
c0de6f9e:	e000      	b.n	c0de6fa2 <nbgl_layoutAddHeader+0xba>
c0de6fa0:	2003      	movs	r0, #3
c0de6fa2:	f88b 0021 	strb.w	r0, [fp, #33]	@ 0x21
c0de6fa6:	2004      	movs	r0, #4
c0de6fa8:	2600      	movs	r6, #0
c0de6faa:	2160      	movs	r1, #96	@ 0x60
c0de6fac:	f88b 801f 	strb.w	r8, [fp, #31]
c0de6fb0:	f88b 8020 	strb.w	r8, [fp, #32]
c0de6fb4:	f88b 0016 	strb.w	r0, [fp, #22]
c0de6fb8:	4658      	mov	r0, fp
c0de6fba:	f88b 1006 	strb.w	r1, [fp, #6]
c0de6fbe:	2168      	movs	r1, #104	@ 0x68
c0de6fc0:	f88b 6026 	strb.w	r6, [fp, #38]	@ 0x26
c0de6fc4:	f88b 6007 	strb.w	r6, [fp, #7]
c0de6fc8:	f88b 6005 	strb.w	r6, [fp, #5]
c0de6fcc:	f800 6f25 	strb.w	r6, [r0, #37]!
c0de6fd0:	f88b 1004 	strb.w	r1, [fp, #4]
c0de6fd4:	70c6      	strb	r6, [r0, #3]
c0de6fd6:	7086      	strb	r6, [r0, #2]
c0de6fd8:	48de      	ldr	r0, [pc, #888]	@ (c0de7354 <nbgl_layoutAddHeader+0x46c>)
c0de6fda:	4478      	add	r0, pc
c0de6fdc:	f004 fee8 	bl	c0debdb0 <pic>
c0de6fe0:	4659      	mov	r1, fp
c0de6fe2:	0e02      	lsrs	r2, r0, #24
c0de6fe4:	f88b 601d 	strb.w	r6, [fp, #29]
c0de6fe8:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de6fec:	f000 fc87 	bl	c0de78fe <OUTLINED_FUNCTION_17>
c0de6ff0:	f88b 002f 	strb.w	r0, [fp, #47]	@ 0x2f
c0de6ff4:	68e0      	ldr	r0, [r4, #12]
c0de6ff6:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6ffa:	7843      	ldrb	r3, [r0, #1]
c0de6ffc:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de7000:	7887      	ldrb	r7, [r0, #2]
c0de7002:	78c0      	ldrb	r0, [r0, #3]
c0de7004:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de7008:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de700c:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7010:	f840 b022 	str.w	fp, [r0, r2, lsl #2]
c0de7014:	f1ba 00ff 	subs.w	r0, sl, #255	@ 0xff
c0de7018:	bf18      	it	ne
c0de701a:	2001      	movne	r0, #1
c0de701c:	f88b 001c 	strb.w	r0, [fp, #28]
c0de7020:	68e1      	ldr	r1, [r4, #12]
c0de7022:	2006      	movs	r0, #6
c0de7024:	f88b 001e 	strb.w	r0, [fp, #30]
c0de7028:	f000 fd85 	bl	c0de7b36 <OUTLINED_FUNCTION_50>
c0de702c:	9801      	ldr	r0, [sp, #4]
c0de702e:	2800      	cmp	r0, #0
c0de7030:	f000 8093 	beq.w	c0de715a <nbgl_layoutAddHeader+0x272>
c0de7034:	7828      	ldrb	r0, [r5, #0]
c0de7036:	f04f 0a00 	mov.w	sl, #0
c0de703a:	2802      	cmp	r0, #2
c0de703c:	d11b      	bne.n	c0de7076 <nbgl_layoutAddHeader+0x18e>
c0de703e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7042:	f000 fcaf 	bl	c0de79a4 <OUTLINED_FUNCTION_26>
c0de7046:	4607      	mov	r7, r0
c0de7048:	f000 fc87 	bl	c0de795a <OUTLINED_FUNCTION_22>
c0de704c:	4639      	mov	r1, r7
c0de704e:	0e02      	lsrs	r2, r0, #24
c0de7050:	f887 a01f 	strb.w	sl, [r7, #31]
c0de7054:	46ba      	mov	sl, r7
c0de7056:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de705a:	f000 fc50 	bl	c0de78fe <OUTLINED_FUNCTION_17>
c0de705e:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de7062:	68e0      	ldr	r0, [r4, #12]
c0de7064:	f000 fbae 	bl	c0de77c4 <OUTLINED_FUNCTION_6>
c0de7068:	f840 7022 	str.w	r7, [r0, r2, lsl #2]
c0de706c:	2005      	movs	r0, #5
c0de706e:	75b8      	strb	r0, [r7, #22]
c0de7070:	68e0      	ldr	r0, [r4, #12]
c0de7072:	f000 fb4d 	bl	c0de7710 <OUTLINED_FUNCTION_0>
c0de7076:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de707a:	f000 fb4f 	bl	c0de771c <OUTLINED_FUNCTION_1>
c0de707e:	782b      	ldrb	r3, [r5, #0]
c0de7080:	4680      	mov	r8, r0
c0de7082:	2b05      	cmp	r3, #5
c0de7084:	d16e      	bne.n	c0de7164 <nbgl_layoutAddHeader+0x27c>
c0de7086:	7c2a      	ldrb	r2, [r5, #16]
c0de7088:	2aff      	cmp	r2, #255	@ 0xff
c0de708a:	d06a      	beq.n	c0de7162 <nbgl_layoutAddHeader+0x27a>
c0de708c:	7ceb      	ldrb	r3, [r5, #19]
c0de708e:	4620      	mov	r0, r4
c0de7090:	4641      	mov	r1, r8
c0de7092:	f7fd f9b3 	bl	c0de43fc <layoutAddCallbackObj>
c0de7096:	2800      	cmp	r0, #0
c0de7098:	f000 8157 	beq.w	c0de734a <nbgl_layoutAddHeader+0x462>
c0de709c:	2000      	movs	r0, #0
c0de709e:	f888 001d 	strb.w	r0, [r8, #29]
c0de70a2:	2001      	movs	r0, #1
c0de70a4:	f888 001c 	strb.w	r0, [r8, #28]
c0de70a8:	782b      	ldrb	r3, [r5, #0]
c0de70aa:	e05b      	b.n	c0de7164 <nbgl_layoutAddHeader+0x27c>
c0de70ac:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de70b0:	f000 fb34 	bl	c0de771c <OUTLINED_FUNCTION_1>
c0de70b4:	4606      	mov	r6, r0
c0de70b6:	7a2a      	ldrb	r2, [r5, #8]
c0de70b8:	7a6b      	ldrb	r3, [r5, #9]
c0de70ba:	f000 fc07 	bl	c0de78cc <OUTLINED_FUNCTION_15>
c0de70be:	2800      	cmp	r0, #0
c0de70c0:	f000 8143 	beq.w	c0de734a <nbgl_layoutAddHeader+0x462>
c0de70c4:	2020      	movs	r0, #32
c0de70c6:	4637      	mov	r7, r6
c0de70c8:	f04f 0a00 	mov.w	sl, #0
c0de70cc:	f04f 0806 	mov.w	r8, #6
c0de70d0:	f04f 0b01 	mov.w	fp, #1
c0de70d4:	75f0      	strb	r0, [r6, #23]
c0de70d6:	20a0      	movs	r0, #160	@ 0xa0
c0de70d8:	f886 a01f 	strb.w	sl, [r6, #31]
c0de70dc:	f000 fda1 	bl	c0de7c22 <OUTLINED_FUNCTION_71>
c0de70e0:	f886 b005 	strb.w	fp, [r6, #5]
c0de70e4:	7130      	strb	r0, [r6, #4]
c0de70e6:	2060      	movs	r0, #96	@ 0x60
c0de70e8:	f807 0f06 	strb.w	r0, [r7, #6]!
c0de70ec:	f887 a001 	strb.w	sl, [r7, #1]
c0de70f0:	f000 fc33 	bl	c0de795a <OUTLINED_FUNCTION_22>
c0de70f4:	f000 fd37 	bl	c0de7b66 <OUTLINED_FUNCTION_54>
c0de70f8:	f886 8020 	strb.w	r8, [r6, #32]
c0de70fc:	f000 fb48 	bl	c0de7790 <OUTLINED_FUNCTION_5>
c0de7100:	f886 b01c 	strb.w	fp, [r6, #28]
c0de7104:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de7108:	2005      	movs	r0, #5
c0de710a:	77b0      	strb	r0, [r6, #30]
c0de710c:	e01d      	b.n	c0de714a <nbgl_layoutAddHeader+0x262>
c0de710e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7112:	f000 fb03 	bl	c0de771c <OUTLINED_FUNCTION_1>
c0de7116:	4606      	mov	r6, r0
c0de7118:	2101      	movs	r1, #1
c0de711a:	2000      	movs	r0, #0
c0de711c:	7171      	strb	r1, [r6, #5]
c0de711e:	21a0      	movs	r1, #160	@ 0xa0
c0de7120:	4637      	mov	r7, r6
c0de7122:	77f0      	strb	r0, [r6, #31]
c0de7124:	7131      	strb	r1, [r6, #4]
c0de7126:	2160      	movs	r1, #96	@ 0x60
c0de7128:	f807 1f06 	strb.w	r1, [r7, #6]!
c0de712c:	7078      	strb	r0, [r7, #1]
c0de712e:	f000 fc14 	bl	c0de795a <OUTLINED_FUNCTION_22>
c0de7132:	f896 1024 	ldrb.w	r1, [r6, #36]	@ 0x24
c0de7136:	0e02      	lsrs	r2, r0, #24
c0de7138:	f041 0101 	orr.w	r1, r1, #1
c0de713c:	f886 1024 	strb.w	r1, [r6, #36]	@ 0x24
c0de7140:	4631      	mov	r1, r6
c0de7142:	f000 fb25 	bl	c0de7790 <OUTLINED_FUNCTION_5>
c0de7146:	f000 fd02 	bl	c0de7b4e <OUTLINED_FUNCTION_52>
c0de714a:	68e1      	ldr	r1, [r4, #12]
c0de714c:	787a      	ldrb	r2, [r7, #1]
c0de714e:	7838      	ldrb	r0, [r7, #0]
c0de7150:	71ca      	strb	r2, [r1, #7]
c0de7152:	7188      	strb	r0, [r1, #6]
c0de7154:	f000 fcef 	bl	c0de7b36 <OUTLINED_FUNCTION_50>
c0de7158:	e102      	b.n	c0de7360 <nbgl_layoutAddHeader+0x478>
c0de715a:	7828      	ldrb	r0, [r5, #0]
c0de715c:	f04f 0800 	mov.w	r8, #0
c0de7160:	e098      	b.n	c0de7294 <nbgl_layoutAddHeader+0x3ac>
c0de7162:	2305      	movs	r3, #5
c0de7164:	68e2      	ldr	r2, [r4, #12]
c0de7166:	f04f 0e00 	mov.w	lr, #0
c0de716a:	f04f 0c05 	mov.w	ip, #5
c0de716e:	f888 e01f 	strb.w	lr, [r8, #31]
c0de7172:	f888 c016 	strb.w	ip, [r8, #22]
c0de7176:	7916      	ldrb	r6, [r2, #4]
c0de7178:	7952      	ldrb	r2, [r2, #5]
c0de717a:	ea46 2702 	orr.w	r7, r6, r2, lsl #8
c0de717e:	f1a7 02d0 	sub.w	r2, r7, #208	@ 0xd0
c0de7182:	0a16      	lsrs	r6, r2, #8
c0de7184:	f888 2004 	strb.w	r2, [r8, #4]
c0de7188:	2b02      	cmp	r3, #2
c0de718a:	f888 6005 	strb.w	r6, [r8, #5]
c0de718e:	d117      	bne.n	c0de71c0 <nbgl_layoutAddHeader+0x2d8>
c0de7190:	4652      	mov	r2, sl
c0de7192:	f812 3f21 	ldrb.w	r3, [r2, #33]!
c0de7196:	7856      	ldrb	r6, [r2, #1]
c0de7198:	7890      	ldrb	r0, [r2, #2]
c0de719a:	78d2      	ldrb	r2, [r2, #3]
c0de719c:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de71a0:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de71a4:	ea43 4000 	orr.w	r0, r3, r0, lsl #16
c0de71a8:	7802      	ldrb	r2, [r0, #0]
c0de71aa:	7840      	ldrb	r0, [r0, #1]
c0de71ac:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de71b0:	1a38      	subs	r0, r7, r0
c0de71b2:	f1a0 02e0 	sub.w	r2, r0, #224	@ 0xe0
c0de71b6:	0a10      	lsrs	r0, r2, #8
c0de71b8:	f888 2004 	strb.w	r2, [r8, #4]
c0de71bc:	f888 0005 	strb.w	r0, [r8, #5]
c0de71c0:	9901      	ldr	r1, [sp, #4]
c0de71c2:	4640      	mov	r0, r8
c0de71c4:	b292      	uxth	r2, r2
c0de71c6:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de71ca:	0e0b      	lsrs	r3, r1, #24
c0de71cc:	70c3      	strb	r3, [r0, #3]
c0de71ce:	0c0b      	lsrs	r3, r1, #16
c0de71d0:	f800 ec1f 	strb.w	lr, [r0, #-31]
c0de71d4:	f800 cc06 	strb.w	ip, [r0, #-6]
c0de71d8:	7083      	strb	r3, [r0, #2]
c0de71da:	0a0b      	lsrs	r3, r1, #8
c0de71dc:	7043      	strb	r3, [r0, #1]
c0de71de:	2360      	movs	r3, #96	@ 0x60
c0de71e0:	f800 3c20 	strb.w	r3, [r0, #-32]
c0de71e4:	230c      	movs	r3, #12
c0de71e6:	f800 3c04 	strb.w	r3, [r0, #-4]
c0de71ea:	f810 3c02 	ldrb.w	r3, [r0, #-2]
c0de71ee:	f043 0301 	orr.w	r3, r3, #1
c0de71f2:	f800 3c02 	strb.w	r3, [r0, #-2]
c0de71f6:	200c      	movs	r0, #12
c0de71f8:	2301      	movs	r3, #1
c0de71fa:	f004 fc16 	bl	c0deba2a <nbgl_getTextNbLinesInWidth>
c0de71fe:	7828      	ldrb	r0, [r5, #0]
c0de7200:	2802      	cmp	r0, #2
c0de7202:	d115      	bne.n	c0de7230 <nbgl_layoutAddHeader+0x348>
c0de7204:	4646      	mov	r6, r8
c0de7206:	f816 1f26 	ldrb.w	r1, [r6, #38]!
c0de720a:	7872      	ldrb	r2, [r6, #1]
c0de720c:	78b3      	ldrb	r3, [r6, #2]
c0de720e:	78f7      	ldrb	r7, [r6, #3]
c0de7210:	f816 0c04 	ldrb.w	r0, [r6, #-4]
c0de7214:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7218:	ea43 2207 	orr.w	r2, r3, r7, lsl #8
c0de721c:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de7220:	f004 fc08 	bl	c0deba34 <nbgl_getTextWidth>
c0de7224:	f806 0c22 	strb.w	r0, [r6, #-34]
c0de7228:	0a00      	lsrs	r0, r0, #8
c0de722a:	f806 0c21 	strb.w	r0, [r6, #-33]
c0de722e:	7828      	ldrb	r0, [r5, #0]
c0de7230:	f000 fbbc 	bl	c0de79ac <OUTLINED_FUNCTION_27>
c0de7234:	f841 8023 	str.w	r8, [r1, r3, lsl #2]
c0de7238:	68e1      	ldr	r1, [r4, #12]
c0de723a:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de723e:	3201      	adds	r2, #1
c0de7240:	2802      	cmp	r0, #2
c0de7242:	f881 2020 	strb.w	r2, [r1, #32]
c0de7246:	d125      	bne.n	c0de7294 <nbgl_layoutAddHeader+0x3ac>
c0de7248:	f898 0004 	ldrb.w	r0, [r8, #4]
c0de724c:	f898 2005 	ldrb.w	r2, [r8, #5]
c0de7250:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de7254:	f06f 0207 	mvn.w	r2, #7
c0de7258:	eba2 0050 	sub.w	r0, r2, r0, lsr #1
c0de725c:	f81a 2f21 	ldrb.w	r2, [sl, #33]!
c0de7260:	f80a 0c0a 	strb.w	r0, [sl, #-10]
c0de7264:	0a00      	lsrs	r0, r0, #8
c0de7266:	f89a 3002 	ldrb.w	r3, [sl, #2]
c0de726a:	f89a 6003 	ldrb.w	r6, [sl, #3]
c0de726e:	f80a 0c09 	strb.w	r0, [sl, #-9]
c0de7272:	f89a 0001 	ldrb.w	r0, [sl, #1]
c0de7276:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de727a:	ea43 2206 	orr.w	r2, r3, r6, lsl #8
c0de727e:	f000 fcd5 	bl	c0de7c2c <OUTLINED_FUNCTION_72>
c0de7282:	2208      	movs	r2, #8
c0de7284:	eb02 0050 	add.w	r0, r2, r0, lsr #1
c0de7288:	f888 0017 	strb.w	r0, [r8, #23]
c0de728c:	0a00      	lsrs	r0, r0, #8
c0de728e:	f888 0018 	strb.w	r0, [r8, #24]
c0de7292:	e061      	b.n	c0de7358 <nbgl_layoutAddHeader+0x470>
c0de7294:	2805      	cmp	r0, #5
c0de7296:	d15f      	bne.n	c0de7358 <nbgl_layoutAddHeader+0x470>
c0de7298:	6868      	ldr	r0, [r5, #4]
c0de729a:	2800      	cmp	r0, #0
c0de729c:	f000 8094 	beq.w	c0de73c8 <nbgl_layoutAddHeader+0x4e0>
c0de72a0:	f000 fab4 	bl	c0de780c <OUTLINED_FUNCTION_8>
c0de72a4:	7caa      	ldrb	r2, [r5, #18]
c0de72a6:	4682      	mov	sl, r0
c0de72a8:	2aff      	cmp	r2, #255	@ 0xff
c0de72aa:	d00c      	beq.n	c0de72c6 <nbgl_layoutAddHeader+0x3de>
c0de72ac:	7ceb      	ldrb	r3, [r5, #19]
c0de72ae:	4620      	mov	r0, r4
c0de72b0:	4651      	mov	r1, sl
c0de72b2:	f7fd f8a3 	bl	c0de43fc <layoutAddCallbackObj>
c0de72b6:	2800      	cmp	r0, #0
c0de72b8:	d047      	beq.n	c0de734a <nbgl_layoutAddHeader+0x462>
c0de72ba:	2000      	movs	r0, #0
c0de72bc:	f88a 001d 	strb.w	r0, [sl, #29]
c0de72c0:	2001      	movs	r0, #1
c0de72c2:	f88a 001c 	strb.w	r0, [sl, #28]
c0de72c6:	2003      	movs	r0, #3
c0de72c8:	2106      	movs	r1, #6
c0de72ca:	2700      	movs	r7, #0
c0de72cc:	f88a 001f 	strb.w	r0, [sl, #31]
c0de72d0:	f88a 1016 	strb.w	r1, [sl, #22]
c0de72d4:	7ca9      	ldrb	r1, [r5, #18]
c0de72d6:	f88a 0020 	strb.w	r0, [sl, #32]
c0de72da:	2060      	movs	r0, #96	@ 0x60
c0de72dc:	f88a 7026 	strb.w	r7, [sl, #38]	@ 0x26
c0de72e0:	f88a 7007 	strb.w	r7, [sl, #7]
c0de72e4:	f88a 7005 	strb.w	r7, [sl, #5]
c0de72e8:	f88a 0006 	strb.w	r0, [sl, #6]
c0de72ec:	2068      	movs	r0, #104	@ 0x68
c0de72ee:	f88a 0004 	strb.w	r0, [sl, #4]
c0de72f2:	4650      	mov	r0, sl
c0de72f4:	f800 7f25 	strb.w	r7, [r0, #37]!
c0de72f8:	70c7      	strb	r7, [r0, #3]
c0de72fa:	7087      	strb	r7, [r0, #2]
c0de72fc:	f1a1 00ff 	sub.w	r0, r1, #255	@ 0xff
c0de7300:	fab0 f080 	clz	r0, r0
c0de7304:	0940      	lsrs	r0, r0, #5
c0de7306:	0040      	lsls	r0, r0, #1
c0de7308:	f88b 0021 	strb.w	r0, [fp, #33]	@ 0x21
c0de730c:	f000 fb25 	bl	c0de795a <OUTLINED_FUNCTION_22>
c0de7310:	4651      	mov	r1, sl
c0de7312:	0e02      	lsrs	r2, r0, #24
c0de7314:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de7318:	f000 faf1 	bl	c0de78fe <OUTLINED_FUNCTION_17>
c0de731c:	f88a 002f 	strb.w	r0, [sl, #47]	@ 0x2f
c0de7320:	68e0      	ldr	r0, [r4, #12]
c0de7322:	f000 fa4f 	bl	c0de77c4 <OUTLINED_FUNCTION_6>
c0de7326:	f840 a022 	str.w	sl, [r0, r2, lsl #2]
c0de732a:	2008      	movs	r0, #8
c0de732c:	68e1      	ldr	r1, [r4, #12]
c0de732e:	f88a 001e 	strb.w	r0, [sl, #30]
c0de7332:	2060      	movs	r0, #96	@ 0x60
c0de7334:	7188      	strb	r0, [r1, #6]
c0de7336:	f891 0020 	ldrb.w	r0, [r1, #32]
c0de733a:	71cf      	strb	r7, [r1, #7]
c0de733c:	3001      	adds	r0, #1
c0de733e:	f881 0020 	strb.w	r0, [r1, #32]
c0de7342:	7828      	ldrb	r0, [r5, #0]
c0de7344:	2805      	cmp	r0, #5
c0de7346:	d10b      	bne.n	c0de7360 <nbgl_layoutAddHeader+0x478>
c0de7348:	e044      	b.n	c0de73d4 <nbgl_layoutAddHeader+0x4ec>
c0de734a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de734e:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de7352:	bf00      	nop
c0de7354:	00005f6d 	.word	0x00005f6d
c0de7358:	2000      	movs	r0, #0
c0de735a:	71c8      	strb	r0, [r1, #7]
c0de735c:	2060      	movs	r0, #96	@ 0x60
c0de735e:	7188      	strb	r0, [r1, #6]
c0de7360:	7868      	ldrb	r0, [r5, #1]
c0de7362:	b150      	cbz	r0, c0de737a <nbgl_layoutAddHeader+0x492>
c0de7364:	f000 faf4 	bl	c0de7950 <OUTLINED_FUNCTION_21>
c0de7368:	f000 fb20 	bl	c0de79ac <OUTLINED_FUNCTION_27>
c0de736c:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
c0de7370:	2108      	movs	r1, #8
c0de7372:	7581      	strb	r1, [r0, #22]
c0de7374:	68e1      	ldr	r1, [r4, #12]
c0de7376:	f000 fbde 	bl	c0de7b36 <OUTLINED_FUNCTION_50>
c0de737a:	68a0      	ldr	r0, [r4, #8]
c0de737c:	6001      	str	r1, [r0, #0]
c0de737e:	68e0      	ldr	r0, [r4, #12]
c0de7380:	f8d4 10a0 	ldr.w	r1, [r4, #160]	@ 0xa0
c0de7384:	4602      	mov	r2, r0
c0de7386:	f812 3f06 	ldrb.w	r3, [r2, #6]!
c0de738a:	7856      	ldrb	r6, [r2, #1]
c0de738c:	f801 0f12 	strb.w	r0, [r1, #18]!
c0de7390:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de7394:	f811 6d0c 	ldrb.w	r6, [r1, #-12]!
c0de7398:	784f      	ldrb	r7, [r1, #1]
c0de739a:	ea46 2607 	orr.w	r6, r6, r7, lsl #8
c0de739e:	1af3      	subs	r3, r6, r3
c0de73a0:	700b      	strb	r3, [r1, #0]
c0de73a2:	0a1b      	lsrs	r3, r3, #8
c0de73a4:	704b      	strb	r3, [r1, #1]
c0de73a6:	782b      	ldrb	r3, [r5, #0]
c0de73a8:	f884 30aa 	strb.w	r3, [r4, #170]	@ 0xaa
c0de73ac:	0e03      	lsrs	r3, r0, #24
c0de73ae:	73cb      	strb	r3, [r1, #15]
c0de73b0:	0c03      	lsrs	r3, r0, #16
c0de73b2:	0a00      	lsrs	r0, r0, #8
c0de73b4:	7348      	strb	r0, [r1, #13]
c0de73b6:	2007      	movs	r0, #7
c0de73b8:	738b      	strb	r3, [r1, #14]
c0de73ba:	7408      	strb	r0, [r1, #16]
c0de73bc:	7810      	ldrb	r0, [r2, #0]
c0de73be:	7851      	ldrb	r1, [r2, #1]
c0de73c0:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de73c4:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de73c8:	f04f 0a00 	mov.w	sl, #0
c0de73cc:	2060      	movs	r0, #96	@ 0x60
c0de73ce:	f881 a007 	strb.w	sl, [r1, #7]
c0de73d2:	7188      	strb	r0, [r1, #6]
c0de73d4:	68e8      	ldr	r0, [r5, #12]
c0de73d6:	2800      	cmp	r0, #0
c0de73d8:	d0c2      	beq.n	c0de7360 <nbgl_layoutAddHeader+0x478>
c0de73da:	f000 fab9 	bl	c0de7950 <OUTLINED_FUNCTION_21>
c0de73de:	68e1      	ldr	r1, [r4, #12]
c0de73e0:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de73e4:	784e      	ldrb	r6, [r1, #1]
c0de73e6:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de73ea:	788f      	ldrb	r7, [r1, #2]
c0de73ec:	78c9      	ldrb	r1, [r1, #3]
c0de73ee:	ea42 2206 	orr.w	r2, r2, r6, lsl #8
c0de73f2:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de73f6:	2600      	movs	r6, #0
c0de73f8:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de73fc:	7686      	strb	r6, [r0, #26]
c0de73fe:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
c0de7402:	2160      	movs	r1, #96	@ 0x60
c0de7404:	7641      	strb	r1, [r0, #25]
c0de7406:	2102      	movs	r1, #2
c0de7408:	7581      	strb	r1, [r0, #22]
c0de740a:	68e0      	ldr	r0, [r4, #12]
c0de740c:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de7410:	3101      	adds	r1, #1
c0de7412:	f880 1020 	strb.w	r1, [r0, #32]
c0de7416:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de741a:	f000 f97f 	bl	c0de771c <OUTLINED_FUNCTION_1>
c0de741e:	77c6      	strb	r6, [r0, #31]
c0de7420:	4607      	mov	r7, r0
c0de7422:	68e8      	ldr	r0, [r5, #12]
c0de7424:	f004 fcc4 	bl	c0debdb0 <pic>
c0de7428:	4601      	mov	r1, r0
c0de742a:	201c      	movs	r0, #28
c0de742c:	2301      	movs	r3, #1
c0de742e:	76be      	strb	r6, [r7, #26]
c0de7430:	7678      	strb	r0, [r7, #25]
c0de7432:	f000 fb77 	bl	c0de7b24 <OUTLINED_FUNCTION_49>
c0de7436:	2004      	movs	r0, #4
c0de7438:	f887 0020 	strb.w	r0, [r7, #32]
c0de743c:	2008      	movs	r0, #8
c0de743e:	75b8      	strb	r0, [r7, #22]
c0de7440:	f000 f970 	bl	c0de7724 <OUTLINED_FUNCTION_2>
c0de7444:	68e1      	ldr	r1, [r4, #12]
c0de7446:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de744a:	784e      	ldrb	r6, [r1, #1]
c0de744c:	f811 cc02 	ldrb.w	ip, [r1, #-2]
c0de7450:	788b      	ldrb	r3, [r1, #2]
c0de7452:	78c9      	ldrb	r1, [r1, #3]
c0de7454:	ea42 2206 	orr.w	r2, r2, r6, lsl #8
c0de7458:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de745c:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de7460:	f100 0238 	add.w	r2, r0, #56	@ 0x38
c0de7464:	f841 702c 	str.w	r7, [r1, ip, lsl #2]
c0de7468:	0a01      	lsrs	r1, r0, #8
c0de746a:	71b8      	strb	r0, [r7, #6]
c0de746c:	71f9      	strb	r1, [r7, #7]
c0de746e:	f81b 1f19 	ldrb.w	r1, [fp, #25]!
c0de7472:	f89b 3001 	ldrb.w	r3, [fp, #1]
c0de7476:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de747a:	eba1 0152 	sub.w	r1, r1, r2, lsr #1
c0de747e:	f88b 1000 	strb.w	r1, [fp]
c0de7482:	0a09      	lsrs	r1, r1, #8
c0de7484:	f88b 1001 	strb.w	r1, [fp, #1]
c0de7488:	68e1      	ldr	r1, [r4, #12]
c0de748a:	f891 3020 	ldrb.w	r3, [r1, #32]
c0de748e:	3301      	adds	r3, #1
c0de7490:	f881 3020 	strb.w	r3, [r1, #32]
c0de7494:	460b      	mov	r3, r1
c0de7496:	f813 6f06 	ldrb.w	r6, [r3, #6]!
c0de749a:	785f      	ldrb	r7, [r3, #1]
c0de749c:	ea46 2607 	orr.w	r6, r6, r7, lsl #8
c0de74a0:	4430      	add	r0, r6
c0de74a2:	3038      	adds	r0, #56	@ 0x38
c0de74a4:	7018      	strb	r0, [r3, #0]
c0de74a6:	0a00      	lsrs	r0, r0, #8
c0de74a8:	7058      	strb	r0, [r3, #1]
c0de74aa:	0850      	lsrs	r0, r2, #1
c0de74ac:	f1b8 0f00 	cmp.w	r8, #0
c0de74b0:	d00b      	beq.n	c0de74ca <nbgl_layoutAddHeader+0x5e2>
c0de74b2:	f818 2f19 	ldrb.w	r2, [r8, #25]!
c0de74b6:	f898 3001 	ldrb.w	r3, [r8, #1]
c0de74ba:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de74be:	1a12      	subs	r2, r2, r0
c0de74c0:	f888 2000 	strb.w	r2, [r8]
c0de74c4:	0a12      	lsrs	r2, r2, #8
c0de74c6:	f888 2001 	strb.w	r2, [r8, #1]
c0de74ca:	f1ba 0f00 	cmp.w	sl, #0
c0de74ce:	f43f af47 	beq.w	c0de7360 <nbgl_layoutAddHeader+0x478>
c0de74d2:	f81a 2f19 	ldrb.w	r2, [sl, #25]!
c0de74d6:	f89a 3001 	ldrb.w	r3, [sl, #1]
c0de74da:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de74de:	1a10      	subs	r0, r2, r0
c0de74e0:	f88a 0000 	strb.w	r0, [sl]
c0de74e4:	0a00      	lsrs	r0, r0, #8
c0de74e6:	f88a 0001 	strb.w	r0, [sl, #1]
c0de74ea:	e739      	b.n	c0de7360 <nbgl_layoutAddHeader+0x478>

c0de74ec <nbgl_layoutAddProgressIndicator>:
c0de74ec:	b510      	push	{r4, lr}
c0de74ee:	b086      	sub	sp, #24
c0de74f0:	9c09      	ldr	r4, [sp, #36]	@ 0x24
c0de74f2:	f88d 100c 	strb.w	r1, [sp, #12]
c0de74f6:	2100      	movs	r1, #0
c0de74f8:	f88d 300e 	strb.w	r3, [sp, #14]
c0de74fc:	f88d 200d 	strb.w	r2, [sp, #13]
c0de7500:	9102      	str	r1, [sp, #8]
c0de7502:	2103      	movs	r1, #3
c0de7504:	f88d 4011 	strb.w	r4, [sp, #17]
c0de7508:	24ff      	movs	r4, #255	@ 0xff
c0de750a:	f8ad 1004 	strh.w	r1, [sp, #4]
c0de750e:	f88d 4010 	strb.w	r4, [sp, #16]
c0de7512:	9c08      	ldr	r4, [sp, #32]
c0de7514:	f88d 400f 	strb.w	r4, [sp, #15]
c0de7518:	a901      	add	r1, sp, #4
c0de751a:	f7ff fce5 	bl	c0de6ee8 <nbgl_layoutAddHeader>
c0de751e:	b006      	add	sp, #24
c0de7520:	bd10      	pop	{r4, pc}

c0de7522 <nbgl_layoutDraw>:
c0de7522:	b1d8      	cbz	r0, c0de755c <nbgl_layoutDraw+0x3a>
c0de7524:	b570      	push	{r4, r5, r6, lr}
c0de7526:	6981      	ldr	r1, [r0, #24]
c0de7528:	b1a1      	cbz	r1, c0de7554 <nbgl_layoutDraw+0x32>
c0de752a:	f8d0 20a0 	ldr.w	r2, [r0, #160]	@ 0xa0
c0de752e:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de7532:	7855      	ldrb	r5, [r2, #1]
c0de7534:	f812 4c02 	ldrb.w	r4, [r2, #-2]
c0de7538:	7896      	ldrb	r6, [r2, #2]
c0de753a:	78d2      	ldrb	r2, [r2, #3]
c0de753c:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0de7540:	ea46 2202 	orr.w	r2, r6, r2, lsl #8
c0de7544:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de7548:	f842 1024 	str.w	r1, [r2, r4, lsl #2]
c0de754c:	f8d0 00a0 	ldr.w	r0, [r0, #160]	@ 0xa0
c0de7550:	f000 f8de 	bl	c0de7710 <OUTLINED_FUNCTION_0>
c0de7554:	f004 fa37 	bl	c0deb9c6 <nbgl_screenRedraw>
c0de7558:	2000      	movs	r0, #0
c0de755a:	bd70      	pop	{r4, r5, r6, pc}
c0de755c:	f000 baa3 	b.w	c0de7aa6 <OUTLINED_FUNCTION_40>

c0de7560 <nbgl_layoutRelease>:
c0de7560:	b510      	push	{r4, lr}
c0de7562:	b138      	cbz	r0, c0de7574 <nbgl_layoutRelease+0x14>
c0de7564:	f000 fb31 	bl	c0de7bca <OUTLINED_FUNCTION_64>
c0de7568:	f894 10ae 	ldrb.w	r1, [r4, #174]	@ 0xae
c0de756c:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de7570:	0441      	lsls	r1, r0, #17
c0de7572:	d402      	bmi.n	c0de757a <nbgl_layoutRelease+0x1a>
c0de7574:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de7578:	bd10      	pop	{r4, pc}
c0de757a:	07c1      	lsls	r1, r0, #31
c0de757c:	d014      	beq.n	c0de75a8 <nbgl_layoutRelease+0x48>
c0de757e:	b2c0      	uxtb	r0, r0
c0de7580:	08c0      	lsrs	r0, r0, #3
c0de7582:	f004 fa25 	bl	c0deb9d0 <nbgl_screenPop>
c0de7586:	480d      	ldr	r0, [pc, #52]	@ (c0de75bc <nbgl_layoutRelease+0x5c>)
c0de7588:	eb09 0100 	add.w	r1, r9, r0
c0de758c:	6849      	ldr	r1, [r1, #4]
c0de758e:	42a1      	cmp	r1, r4
c0de7590:	d005      	beq.n	c0de759e <nbgl_layoutRelease+0x3e>
c0de7592:	e9d4 0100 	ldrd	r0, r1, [r4]
c0de7596:	6008      	str	r0, [r1, #0]
c0de7598:	6820      	ldr	r0, [r4, #0]
c0de759a:	6041      	str	r1, [r0, #4]
c0de759c:	e004      	b.n	c0de75a8 <nbgl_layoutRelease+0x48>
c0de759e:	6861      	ldr	r1, [r4, #4]
c0de75a0:	4448      	add	r0, r9
c0de75a2:	6041      	str	r1, [r0, #4]
c0de75a4:	2000      	movs	r0, #0
c0de75a6:	6008      	str	r0, [r1, #0]
c0de75a8:	f814 0fad 	ldrb.w	r0, [r4, #173]!
c0de75ac:	7861      	ldrb	r1, [r4, #1]
c0de75ae:	7020      	strb	r0, [r4, #0]
c0de75b0:	2000      	movs	r0, #0
c0de75b2:	f001 01bf 	and.w	r1, r1, #191	@ 0xbf
c0de75b6:	7061      	strb	r1, [r4, #1]
c0de75b8:	bd10      	pop	{r4, pc}
c0de75ba:	bf00      	nop
c0de75bc:	00001908 	.word	0x00001908

c0de75c0 <getLayoutAndLayoutObj>:
c0de75c0:	b570      	push	{r4, r5, r6, lr}
c0de75c2:	4c11      	ldr	r4, [pc, #68]	@ (c0de7608 <getLayoutAndLayoutObj+0x48>)
c0de75c4:	2300      	movs	r3, #0
c0de75c6:	600b      	str	r3, [r1, #0]
c0de75c8:	444c      	add	r4, r9
c0de75ca:	6864      	ldr	r4, [r4, #4]
c0de75cc:	b1d4      	cbz	r4, c0de7604 <getLayoutAndLayoutObj+0x44>
c0de75ce:	f894 30ad 	ldrb.w	r3, [r4, #173]	@ 0xad
c0de75d2:	f894 50ae 	ldrb.w	r5, [r4, #174]	@ 0xae
c0de75d6:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0de75da:	045d      	lsls	r5, r3, #17
c0de75dc:	d401      	bmi.n	c0de75e2 <getLayoutAndLayoutObj+0x22>
c0de75de:	2300      	movs	r3, #0
c0de75e0:	e010      	b.n	c0de7604 <getLayoutAndLayoutObj+0x44>
c0de75e2:	f44f 75fc 	mov.w	r5, #504	@ 0x1f8
c0de75e6:	ea05 1553 	and.w	r5, r5, r3, lsr #5
c0de75ea:	2300      	movs	r3, #0
c0de75ec:	429d      	cmp	r5, r3
c0de75ee:	d0f6      	beq.n	c0de75de <getLayoutAndLayoutObj+0x1e>
c0de75f0:	18e6      	adds	r6, r4, r3
c0de75f2:	3308      	adds	r3, #8
c0de75f4:	6a36      	ldr	r6, [r6, #32]
c0de75f6:	4286      	cmp	r6, r0
c0de75f8:	d1f8      	bne.n	c0de75ec <getLayoutAndLayoutObj+0x2c>
c0de75fa:	18e0      	adds	r0, r4, r3
c0de75fc:	2301      	movs	r3, #1
c0de75fe:	600c      	str	r4, [r1, #0]
c0de7600:	3018      	adds	r0, #24
c0de7602:	6010      	str	r0, [r2, #0]
c0de7604:	4618      	mov	r0, r3
c0de7606:	bd70      	pop	{r4, r5, r6, pc}
c0de7608:	00001908 	.word	0x00001908

c0de760c <animTickerCallback>:
c0de760c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de760e:	483f      	ldr	r0, [pc, #252]	@ (c0de770c <animTickerCallback+0x100>)
c0de7610:	4448      	add	r0, r9
c0de7612:	6842      	ldr	r2, [r0, #4]
c0de7614:	b3b2      	cbz	r2, c0de7684 <animTickerCallback+0x78>
c0de7616:	f892 00ad 	ldrb.w	r0, [r2, #173]	@ 0xad
c0de761a:	f892 10ae 	ldrb.w	r1, [r2, #174]	@ 0xae
c0de761e:	ea40 2e01 	orr.w	lr, r0, r1, lsl #8
c0de7622:	ea5f 404e 	movs.w	r0, lr, lsl #17
c0de7626:	d52d      	bpl.n	c0de7684 <animTickerCallback+0x78>
c0de7628:	f8d2 c0a4 	ldr.w	ip, [r2, #164]	@ 0xa4
c0de762c:	f1bc 0f00 	cmp.w	ip, #0
c0de7630:	d028      	beq.n	c0de7684 <animTickerCallback+0x78>
c0de7632:	f8d2 40a0 	ldr.w	r4, [r2, #160]	@ 0xa0
c0de7636:	2600      	movs	r6, #0
c0de7638:	f894 5020 	ldrb.w	r5, [r4, #32]
c0de763c:	42b5      	cmp	r5, r6
c0de763e:	d021      	beq.n	c0de7684 <animTickerCallback+0x78>
c0de7640:	4620      	mov	r0, r4
c0de7642:	f810 7f22 	ldrb.w	r7, [r0, #34]!
c0de7646:	7841      	ldrb	r1, [r0, #1]
c0de7648:	7883      	ldrb	r3, [r0, #2]
c0de764a:	78c0      	ldrb	r0, [r0, #3]
c0de764c:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de7650:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de7654:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7658:	f850 0026 	ldr.w	r0, [r0, r6, lsl #2]
c0de765c:	7ec1      	ldrb	r1, [r0, #27]
c0de765e:	2901      	cmp	r1, #1
c0de7660:	d10e      	bne.n	c0de7680 <animTickerCallback+0x74>
c0de7662:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7666:	7843      	ldrb	r3, [r0, #1]
c0de7668:	7887      	ldrb	r7, [r0, #2]
c0de766a:	78c0      	ldrb	r0, [r0, #3]
c0de766c:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de7670:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de7674:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7678:	6840      	ldr	r0, [r0, #4]
c0de767a:	7ec1      	ldrb	r1, [r0, #27]
c0de767c:	2902      	cmp	r1, #2
c0de767e:	d002      	beq.n	c0de7686 <animTickerCallback+0x7a>
c0de7680:	3601      	adds	r6, #1
c0de7682:	e7db      	b.n	c0de763c <animTickerCallback+0x30>
c0de7684:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de7686:	f89c 1005 	ldrb.w	r1, [ip, #5]
c0de768a:	b171      	cbz	r1, c0de76aa <animTickerCallback+0x9e>
c0de768c:	f892 40af 	ldrb.w	r4, [r2, #175]	@ 0xaf
c0de7690:	ea5f 714e 	movs.w	r1, lr, lsl #29
c0de7694:	d504      	bpl.n	c0de76a0 <animTickerCallback+0x94>
c0de7696:	f89c 1004 	ldrb.w	r1, [ip, #4]
c0de769a:	3901      	subs	r1, #1
c0de769c:	42a1      	cmp	r1, r4
c0de769e:	dd0e      	ble.n	c0de76be <animTickerCallback+0xb2>
c0de76a0:	b9ac      	cbnz	r4, c0de76ce <animTickerCallback+0xc2>
c0de76a2:	f04e 0e04 	orr.w	lr, lr, #4
c0de76a6:	2400      	movs	r4, #0
c0de76a8:	e00b      	b.n	c0de76c2 <animTickerCallback+0xb6>
c0de76aa:	f89c 1004 	ldrb.w	r1, [ip, #4]
c0de76ae:	f892 30af 	ldrb.w	r3, [r2, #175]	@ 0xaf
c0de76b2:	3901      	subs	r1, #1
c0de76b4:	4299      	cmp	r1, r3
c0de76b6:	bf14      	ite	ne
c0de76b8:	3301      	addne	r3, #1
c0de76ba:	2300      	moveq	r3, #0
c0de76bc:	e00c      	b.n	c0de76d8 <animTickerCallback+0xcc>
c0de76be:	f02e 0e04 	bic.w	lr, lr, #4
c0de76c2:	ea4f 211e 	mov.w	r1, lr, lsr #8
c0de76c6:	f882 e0ad 	strb.w	lr, [r2, #173]	@ 0xad
c0de76ca:	f882 10ae 	strb.w	r1, [r2, #174]	@ 0xae
c0de76ce:	ea5f 714e 	movs.w	r1, lr, lsl #29
c0de76d2:	bf54      	ite	pl
c0de76d4:	1e63      	subpl	r3, r4, #1
c0de76d6:	1c63      	addmi	r3, r4, #1
c0de76d8:	f882 30af 	strb.w	r3, [r2, #175]	@ 0xaf
c0de76dc:	f8dc 2000 	ldr.w	r2, [ip]
c0de76e0:	b2d9      	uxtb	r1, r3
c0de76e2:	f852 1021 	ldr.w	r1, [r2, r1, lsl #2]
c0de76e6:	4602      	mov	r2, r0
c0de76e8:	f802 1f21 	strb.w	r1, [r2, #33]!
c0de76ec:	0e0b      	lsrs	r3, r1, #24
c0de76ee:	70d3      	strb	r3, [r2, #3]
c0de76f0:	0c0b      	lsrs	r3, r1, #16
c0de76f2:	0a09      	lsrs	r1, r1, #8
c0de76f4:	7093      	strb	r3, [r2, #2]
c0de76f6:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de76fa:	f004 f950 	bl	c0deb99e <nbgl_objDraw>
c0de76fe:	2004      	movs	r0, #4
c0de7700:	2101      	movs	r1, #1
c0de7702:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de7706:	f004 b940 	b.w	c0deb98a <nbgl_refreshSpecialWithPostRefresh>
c0de770a:	bf00      	nop
c0de770c:	00001908 	.word	0x00001908

c0de7710 <OUTLINED_FUNCTION_0>:
c0de7710:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de7714:	3101      	adds	r1, #1
c0de7716:	f880 1020 	strb.w	r1, [r0, #32]
c0de771a:	4770      	bx	lr

c0de771c <OUTLINED_FUNCTION_1>:
c0de771c:	08c1      	lsrs	r1, r0, #3
c0de771e:	2004      	movs	r0, #4
c0de7720:	f004 b965 	b.w	c0deb9ee <nbgl_objPoolGet>

c0de7724 <OUTLINED_FUNCTION_2>:
c0de7724:	4638      	mov	r0, r7
c0de7726:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de772a:	70c2      	strb	r2, [r0, #3]
c0de772c:	0c0a      	lsrs	r2, r1, #16
c0de772e:	7082      	strb	r2, [r0, #2]
c0de7730:	0a08      	lsrs	r0, r1, #8
c0de7732:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de7736:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de773a:	f897 0024 	ldrb.w	r0, [r7, #36]	@ 0x24
c0de773e:	f040 0001 	orr.w	r0, r0, #1
c0de7742:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de7746:	200b      	movs	r0, #11
c0de7748:	f004 b96a 	b.w	c0deba20 <nbgl_getTextHeightInWidth>

c0de774c <OUTLINED_FUNCTION_3>:
c0de774c:	2202      	movs	r2, #2
c0de774e:	2600      	movs	r6, #0
c0de7750:	75ba      	strb	r2, [r7, #22]
c0de7752:	465a      	mov	r2, fp
c0de7754:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de7758:	7854      	ldrb	r4, [r2, #1]
c0de775a:	7895      	ldrb	r5, [r2, #2]
c0de775c:	78d2      	ldrb	r2, [r2, #3]
c0de775e:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de7762:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0de7766:	7ebc      	ldrb	r4, [r7, #26]
c0de7768:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de776c:	7e7b      	ldrb	r3, [r7, #25]
c0de776e:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de7772:	4770      	bx	lr

c0de7774 <OUTLINED_FUNCTION_4>:
c0de7774:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de7778:	784c      	ldrb	r4, [r1, #1]
c0de777a:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de777e:	788d      	ldrb	r5, [r1, #2]
c0de7780:	78c9      	ldrb	r1, [r1, #3]
c0de7782:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de7786:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de778a:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de778e:	4770      	bx	lr

c0de7790 <OUTLINED_FUNCTION_5>:
c0de7790:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de7794:	70ca      	strb	r2, [r1, #3]
c0de7796:	0c02      	lsrs	r2, r0, #16
c0de7798:	0a00      	lsrs	r0, r0, #8
c0de779a:	708a      	strb	r2, [r1, #2]
c0de779c:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de77a0:	68e0      	ldr	r0, [r4, #12]
c0de77a2:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de77a6:	7843      	ldrb	r3, [r0, #1]
c0de77a8:	f810 cc02 	ldrb.w	ip, [r0, #-2]
c0de77ac:	7882      	ldrb	r2, [r0, #2]
c0de77ae:	78c0      	ldrb	r0, [r0, #3]
c0de77b0:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de77b4:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de77b8:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de77bc:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de77c0:	200c      	movs	r0, #12
c0de77c2:	4770      	bx	lr

c0de77c4 <OUTLINED_FUNCTION_6>:
c0de77c4:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de77c8:	7843      	ldrb	r3, [r0, #1]
c0de77ca:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de77ce:	7886      	ldrb	r6, [r0, #2]
c0de77d0:	78c0      	ldrb	r0, [r0, #3]
c0de77d2:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de77d6:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de77da:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de77de:	4770      	bx	lr

c0de77e0 <OUTLINED_FUNCTION_7>:
c0de77e0:	f885 0020 	strb.w	r0, [r5, #32]
c0de77e4:	4628      	mov	r0, r5
c0de77e6:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de77ea:	70c2      	strb	r2, [r0, #3]
c0de77ec:	0c0a      	lsrs	r2, r1, #16
c0de77ee:	7082      	strb	r2, [r0, #2]
c0de77f0:	0a08      	lsrs	r0, r1, #8
c0de77f2:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de77f6:	f885 0027 	strb.w	r0, [r5, #39]	@ 0x27
c0de77fa:	f895 0024 	ldrb.w	r0, [r5, #36]	@ 0x24
c0de77fe:	f040 0001 	orr.w	r0, r0, #1
c0de7802:	f885 0024 	strb.w	r0, [r5, #36]	@ 0x24
c0de7806:	200b      	movs	r0, #11
c0de7808:	f004 b90a 	b.w	c0deba20 <nbgl_getTextHeightInWidth>

c0de780c <OUTLINED_FUNCTION_8>:
c0de780c:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7810:	08c1      	lsrs	r1, r0, #3
c0de7812:	2005      	movs	r0, #5
c0de7814:	f004 b8eb 	b.w	c0deb9ee <nbgl_objPoolGet>

c0de7818 <OUTLINED_FUNCTION_9>:
c0de7818:	784b      	ldrb	r3, [r1, #1]
c0de781a:	788e      	ldrb	r6, [r1, #2]
c0de781c:	78c9      	ldrb	r1, [r1, #3]
c0de781e:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de7822:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de7826:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de782a:	4770      	bx	lr

c0de782c <OUTLINED_FUNCTION_10>:
c0de782c:	465a      	mov	r2, fp
c0de782e:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de7832:	7854      	ldrb	r4, [r2, #1]
c0de7834:	7895      	ldrb	r5, [r2, #2]
c0de7836:	78d2      	ldrb	r2, [r2, #3]
c0de7838:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0de783c:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de7840:	463d      	mov	r5, r7
c0de7842:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de7846:	eb02 0481 	add.w	r4, r2, r1, lsl #2
c0de784a:	f854 3c04 	ldr.w	r3, [r4, #-4]
c0de784e:	f805 3f12 	strb.w	r3, [r5, #18]!
c0de7852:	0e1e      	lsrs	r6, r3, #24
c0de7854:	70ee      	strb	r6, [r5, #3]
c0de7856:	0c1e      	lsrs	r6, r3, #16
c0de7858:	0a1b      	lsrs	r3, r3, #8
c0de785a:	4770      	bx	lr

c0de785c <OUTLINED_FUNCTION_11>:
c0de785c:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de7860:	70c2      	strb	r2, [r0, #3]
c0de7862:	0c0a      	lsrs	r2, r1, #16
c0de7864:	7082      	strb	r2, [r0, #2]
c0de7866:	0a08      	lsrs	r0, r1, #8
c0de7868:	4770      	bx	lr

c0de786a <OUTLINED_FUNCTION_12>:
c0de786a:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de786e:	70ca      	strb	r2, [r1, #3]
c0de7870:	0c02      	lsrs	r2, r0, #16
c0de7872:	0a00      	lsrs	r0, r0, #8
c0de7874:	708a      	strb	r2, [r1, #2]
c0de7876:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de787a:	6920      	ldr	r0, [r4, #16]
c0de787c:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7880:	7843      	ldrb	r3, [r0, #1]
c0de7882:	f810 cc02 	ldrb.w	ip, [r0, #-2]
c0de7886:	7882      	ldrb	r2, [r0, #2]
c0de7888:	78c0      	ldrb	r0, [r0, #3]
c0de788a:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de788e:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de7892:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7896:	4770      	bx	lr

c0de7898 <OUTLINED_FUNCTION_13>:
c0de7898:	08c1      	lsrs	r1, r0, #3
c0de789a:	2005      	movs	r0, #5
c0de789c:	f004 b8a7 	b.w	c0deb9ee <nbgl_objPoolGet>

c0de78a0 <OUTLINED_FUNCTION_14>:
c0de78a0:	6920      	ldr	r0, [r4, #16]
c0de78a2:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de78a6:	7843      	ldrb	r3, [r0, #1]
c0de78a8:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de78ac:	7887      	ldrb	r7, [r0, #2]
c0de78ae:	78c0      	ldrb	r0, [r0, #3]
c0de78b0:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de78b4:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de78b8:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de78bc:	f840 6022 	str.w	r6, [r0, r2, lsl #2]
c0de78c0:	200c      	movs	r0, #12
c0de78c2:	f886 801c 	strb.w	r8, [r6, #28]
c0de78c6:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de78ca:	4770      	bx	lr

c0de78cc <OUTLINED_FUNCTION_15>:
c0de78cc:	4620      	mov	r0, r4
c0de78ce:	4631      	mov	r1, r6
c0de78d0:	f7fc bd94 	b.w	c0de43fc <layoutAddCallbackObj>

c0de78d4 <OUTLINED_FUNCTION_16>:
c0de78d4:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de78d8:	4630      	mov	r0, r6
c0de78da:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de78de:	70c2      	strb	r2, [r0, #3]
c0de78e0:	0c0a      	lsrs	r2, r1, #16
c0de78e2:	7082      	strb	r2, [r0, #2]
c0de78e4:	0a08      	lsrs	r0, r1, #8
c0de78e6:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de78ea:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de78ee:	f896 0024 	ldrb.w	r0, [r6, #36]	@ 0x24
c0de78f2:	f040 0001 	orr.w	r0, r0, #1
c0de78f6:	f886 0024 	strb.w	r0, [r6, #36]	@ 0x24
c0de78fa:	200b      	movs	r0, #11
c0de78fc:	4770      	bx	lr

c0de78fe <OUTLINED_FUNCTION_17>:
c0de78fe:	70ca      	strb	r2, [r1, #3]
c0de7900:	0c02      	lsrs	r2, r0, #16
c0de7902:	0a00      	lsrs	r0, r0, #8
c0de7904:	708a      	strb	r2, [r1, #2]
c0de7906:	4770      	bx	lr

c0de7908 <OUTLINED_FUNCTION_18>:
c0de7908:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de790c:	7842      	ldrb	r2, [r0, #1]
c0de790e:	7883      	ldrb	r3, [r0, #2]
c0de7910:	78c0      	ldrb	r0, [r0, #3]
c0de7912:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7916:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de791a:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de791e:	4770      	bx	lr

c0de7920 <OUTLINED_FUNCTION_19>:
c0de7920:	08c1      	lsrs	r1, r0, #3
c0de7922:	2001      	movs	r0, #1
c0de7924:	f004 b863 	b.w	c0deb9ee <nbgl_objPoolGet>

c0de7928 <OUTLINED_FUNCTION_20>:
c0de7928:	f887 0020 	strb.w	r0, [r7, #32]
c0de792c:	4638      	mov	r0, r7
c0de792e:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de7932:	70c2      	strb	r2, [r0, #3]
c0de7934:	0c0a      	lsrs	r2, r1, #16
c0de7936:	7082      	strb	r2, [r0, #2]
c0de7938:	0a08      	lsrs	r0, r1, #8
c0de793a:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de793e:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de7942:	f897 0024 	ldrb.w	r0, [r7, #36]	@ 0x24
c0de7946:	f040 0001 	orr.w	r0, r0, #1
c0de794a:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de794e:	4770      	bx	lr

c0de7950 <OUTLINED_FUNCTION_21>:
c0de7950:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7954:	08c0      	lsrs	r0, r0, #3
c0de7956:	f7fe bbdf 	b.w	c0de6118 <createHorizontalLine>

c0de795a <OUTLINED_FUNCTION_22>:
c0de795a:	6868      	ldr	r0, [r5, #4]
c0de795c:	f004 ba28 	b.w	c0debdb0 <pic>

c0de7960 <OUTLINED_FUNCTION_23>:
c0de7960:	7842      	ldrb	r2, [r0, #1]
c0de7962:	7883      	ldrb	r3, [r0, #2]
c0de7964:	78c0      	ldrb	r0, [r0, #3]
c0de7966:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de796a:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de796e:	4770      	bx	lr

c0de7970 <OUTLINED_FUNCTION_24>:
c0de7970:	f99a 00ae 	ldrsb.w	r0, [sl, #174]	@ 0xae
c0de7974:	f89a 10ad 	ldrb.w	r1, [sl, #173]	@ 0xad
c0de7978:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de797c:	2103      	movs	r1, #3
c0de797e:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0de7982:	4770      	bx	lr

c0de7984 <OUTLINED_FUNCTION_25>:
c0de7984:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de7988:	784c      	ldrb	r4, [r1, #1]
c0de798a:	f811 cc02 	ldrb.w	ip, [r1, #-2]
c0de798e:	788b      	ldrb	r3, [r1, #2]
c0de7990:	78c9      	ldrb	r1, [r1, #3]
c0de7992:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de7996:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de799a:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de799e:	f841 702c 	str.w	r7, [r1, ip, lsl #2]
c0de79a2:	4770      	bx	lr

c0de79a4 <OUTLINED_FUNCTION_26>:
c0de79a4:	08c1      	lsrs	r1, r0, #3
c0de79a6:	2002      	movs	r0, #2
c0de79a8:	f004 b821 	b.w	c0deb9ee <nbgl_objPoolGet>

c0de79ac <OUTLINED_FUNCTION_27>:
c0de79ac:	68e1      	ldr	r1, [r4, #12]
c0de79ae:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de79b2:	784e      	ldrb	r6, [r1, #1]
c0de79b4:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de79b8:	788f      	ldrb	r7, [r1, #2]
c0de79ba:	78c9      	ldrb	r1, [r1, #3]
c0de79bc:	ea42 2206 	orr.w	r2, r2, r6, lsl #8
c0de79c0:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de79c4:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de79c8:	4770      	bx	lr

c0de79ca <OUTLINED_FUNCTION_28>:
c0de79ca:	70ca      	strb	r2, [r1, #3]
c0de79cc:	0c02      	lsrs	r2, r0, #16
c0de79ce:	0a00      	lsrs	r0, r0, #8
c0de79d0:	708a      	strb	r2, [r1, #2]
c0de79d2:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de79d6:	6920      	ldr	r0, [r4, #16]
c0de79d8:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de79dc:	7843      	ldrb	r3, [r0, #1]
c0de79de:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de79e2:	7887      	ldrb	r7, [r0, #2]
c0de79e4:	78c0      	ldrb	r0, [r0, #3]
c0de79e6:	4770      	bx	lr

c0de79e8 <OUTLINED_FUNCTION_29>:
c0de79e8:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de79ec:	70ca      	strb	r2, [r1, #3]
c0de79ee:	0c02      	lsrs	r2, r0, #16
c0de79f0:	0a00      	lsrs	r0, r0, #8
c0de79f2:	708a      	strb	r2, [r1, #2]
c0de79f4:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de79f8:	4770      	bx	lr

c0de79fa <OUTLINED_FUNCTION_30>:
c0de79fa:	3101      	adds	r1, #1
c0de79fc:	f842 7026 	str.w	r7, [r2, r6, lsl #2]
c0de7a00:	f88b 1020 	strb.w	r1, [fp, #32]
c0de7a04:	9900      	ldr	r1, [sp, #0]
c0de7a06:	4408      	add	r0, r1
c0de7a08:	18c1      	adds	r1, r0, r3
c0de7a0a:	4770      	bx	lr

c0de7a0c <OUTLINED_FUNCTION_31>:
c0de7a0c:	f801 0f25 	strb.w	r0, [r1, #37]!
c0de7a10:	70ca      	strb	r2, [r1, #3]
c0de7a12:	0c02      	lsrs	r2, r0, #16
c0de7a14:	0a00      	lsrs	r0, r0, #8
c0de7a16:	708a      	strb	r2, [r1, #2]
c0de7a18:	f886 0026 	strb.w	r0, [r6, #38]	@ 0x26
c0de7a1c:	4770      	bx	lr

c0de7a1e <OUTLINED_FUNCTION_32>:
c0de7a1e:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de7a22:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de7a26:	3101      	adds	r1, #1
c0de7a28:	f880 1020 	strb.w	r1, [r0, #32]
c0de7a2c:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de7a30:	08c1      	lsrs	r1, r0, #3
c0de7a32:	2004      	movs	r0, #4
c0de7a34:	4730      	bx	r6

c0de7a36 <OUTLINED_FUNCTION_33>:
c0de7a36:	77b0      	strb	r0, [r6, #30]
c0de7a38:	6960      	ldr	r0, [r4, #20]
c0de7a3a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7a3e:	7842      	ldrb	r2, [r0, #1]
c0de7a40:	7883      	ldrb	r3, [r0, #2]
c0de7a42:	78c0      	ldrb	r0, [r0, #3]
c0de7a44:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7a48:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de7a4c:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7a50:	4770      	bx	lr

c0de7a52 <OUTLINED_FUNCTION_34>:
c0de7a52:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7a56:	7843      	ldrb	r3, [r0, #1]
c0de7a58:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de7a5c:	7884      	ldrb	r4, [r0, #2]
c0de7a5e:	78c0      	ldrb	r0, [r0, #3]
c0de7a60:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de7a64:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de7a68:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7a6c:	4770      	bx	lr

c0de7a6e <OUTLINED_FUNCTION_35>:
c0de7a6e:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de7a72:	f896 0022 	ldrb.w	r0, [r6, #34]	@ 0x22
c0de7a76:	f040 0001 	orr.w	r0, r0, #1
c0de7a7a:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de7a7e:	4630      	mov	r0, r6
c0de7a80:	f003 bf8d 	b.w	c0deb99e <nbgl_objDraw>

c0de7a84 <OUTLINED_FUNCTION_36>:
c0de7a84:	7981      	ldrb	r1, [r0, #6]
c0de7a86:	79c0      	ldrb	r0, [r0, #7]
c0de7a88:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de7a8c:	4770      	bx	lr

c0de7a8e <OUTLINED_FUNCTION_37>:
c0de7a8e:	ea42 2103 	orr.w	r1, r2, r3, lsl #8
c0de7a92:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de7a96:	4770      	bx	lr

c0de7a98 <OUTLINED_FUNCTION_39>:
c0de7a98:	0a01      	lsrs	r1, r0, #8
c0de7a9a:	71b8      	strb	r0, [r7, #6]
c0de7a9c:	71f9      	strb	r1, [r7, #7]
c0de7a9e:	f89b 1020 	ldrb.w	r1, [fp, #32]
c0de7aa2:	2900      	cmp	r1, #0
c0de7aa4:	4770      	bx	lr

c0de7aa6 <OUTLINED_FUNCTION_40>:
c0de7aa6:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de7aaa:	4770      	bx	lr

c0de7aac <OUTLINED_FUNCTION_41>:
c0de7aac:	200c      	movs	r0, #12
c0de7aae:	f886 b01c 	strb.w	fp, [r6, #28]
c0de7ab2:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de7ab6:	2005      	movs	r0, #5
c0de7ab8:	4770      	bx	lr

c0de7aba <OUTLINED_FUNCTION_42>:
c0de7aba:	f99a 00ae 	ldrsb.w	r0, [sl, #174]	@ 0xae
c0de7abe:	f89a 10ad 	ldrb.w	r1, [sl, #173]	@ 0xad
c0de7ac2:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de7ac6:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0de7aca:	f04f 0003 	mov.w	r0, #3
c0de7ace:	4770      	bx	lr

c0de7ad0 <OUTLINED_FUNCTION_43>:
c0de7ad0:	4630      	mov	r0, r6
c0de7ad2:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de7ad6:	70c2      	strb	r2, [r0, #3]
c0de7ad8:	0c0a      	lsrs	r2, r1, #16
c0de7ada:	7082      	strb	r2, [r0, #2]
c0de7adc:	0a08      	lsrs	r0, r1, #8
c0de7ade:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de7ae2:	4770      	bx	lr

c0de7ae4 <OUTLINED_FUNCTION_44>:
c0de7ae4:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de7ae8:	784b      	ldrb	r3, [r1, #1]
c0de7aea:	788f      	ldrb	r7, [r1, #2]
c0de7aec:	78c9      	ldrb	r1, [r1, #3]
c0de7aee:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de7af2:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de7af6:	4770      	bx	lr

c0de7af8 <OUTLINED_FUNCTION_45>:
c0de7af8:	7842      	ldrb	r2, [r0, #1]
c0de7afa:	7883      	ldrb	r3, [r0, #2]
c0de7afc:	78c0      	ldrb	r0, [r0, #3]
c0de7afe:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7b02:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de7b06:	ea41 4100 	orr.w	r1, r1, r0, lsl #16
c0de7b0a:	4770      	bx	lr

c0de7b0c <OUTLINED_FUNCTION_46>:
c0de7b0c:	68a8      	ldr	r0, [r5, #8]
c0de7b0e:	f004 b94f 	b.w	c0debdb0 <pic>

c0de7b12 <OUTLINED_FUNCTION_48>:
c0de7b12:	f8d4 00a0 	ldr.w	r0, [r4, #160]	@ 0xa0
c0de7b16:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de7b1a:	3101      	adds	r1, #1
c0de7b1c:	f880 1020 	strb.w	r1, [r0, #32]
c0de7b20:	2000      	movs	r0, #0
c0de7b22:	4770      	bx	lr

c0de7b24 <OUTLINED_FUNCTION_49>:
c0de7b24:	2001      	movs	r0, #1
c0de7b26:	0e0a      	lsrs	r2, r1, #24
c0de7b28:	7178      	strb	r0, [r7, #5]
c0de7b2a:	20a0      	movs	r0, #160	@ 0xa0
c0de7b2c:	7138      	strb	r0, [r7, #4]
c0de7b2e:	200b      	movs	r0, #11
c0de7b30:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de7b34:	4770      	bx	lr

c0de7b36 <OUTLINED_FUNCTION_50>:
c0de7b36:	f891 0020 	ldrb.w	r0, [r1, #32]
c0de7b3a:	3001      	adds	r0, #1
c0de7b3c:	f881 0020 	strb.w	r0, [r1, #32]
c0de7b40:	4770      	bx	lr

c0de7b42 <OUTLINED_FUNCTION_51>:
c0de7b42:	2100      	movs	r1, #0
c0de7b44:	7146      	strb	r6, [r0, #5]
c0de7b46:	77c1      	strb	r1, [r0, #31]
c0de7b48:	21e0      	movs	r1, #224	@ 0xe0
c0de7b4a:	7101      	strb	r1, [r0, #4]
c0de7b4c:	4770      	bx	lr

c0de7b4e <OUTLINED_FUNCTION_52>:
c0de7b4e:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de7b52:	2005      	movs	r0, #5
c0de7b54:	f886 0020 	strb.w	r0, [r6, #32]
c0de7b58:	4770      	bx	lr

c0de7b5a <OUTLINED_FUNCTION_53>:
c0de7b5a:	70ca      	strb	r2, [r1, #3]
c0de7b5c:	0c02      	lsrs	r2, r0, #16
c0de7b5e:	0a00      	lsrs	r0, r0, #8
c0de7b60:	708a      	strb	r2, [r1, #2]
c0de7b62:	7048      	strb	r0, [r1, #1]
c0de7b64:	4770      	bx	lr

c0de7b66 <OUTLINED_FUNCTION_54>:
c0de7b66:	4631      	mov	r1, r6
c0de7b68:	0e02      	lsrs	r2, r0, #24
c0de7b6a:	f886 a01d 	strb.w	sl, [r6, #29]
c0de7b6e:	4770      	bx	lr

c0de7b70 <OUTLINED_FUNCTION_55>:
c0de7b70:	2301      	movs	r3, #1
c0de7b72:	7178      	strb	r0, [r7, #5]
c0de7b74:	20a0      	movs	r0, #160	@ 0xa0
c0de7b76:	0e0a      	lsrs	r2, r1, #24
c0de7b78:	7138      	strb	r0, [r7, #4]
c0de7b7a:	4770      	bx	lr

c0de7b7c <OUTLINED_FUNCTION_56>:
c0de7b7c:	08c1      	lsrs	r1, r0, #3
c0de7b7e:	2004      	movs	r0, #4
c0de7b80:	f003 bf3a 	b.w	c0deb9f8 <nbgl_containerPoolGet>

c0de7b84 <OUTLINED_FUNCTION_57>:
c0de7b84:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7b88:	08c1      	lsrs	r1, r0, #3
c0de7b8a:	2005      	movs	r0, #5
c0de7b8c:	f003 bf34 	b.w	c0deb9f8 <nbgl_containerPoolGet>

c0de7b90 <OUTLINED_FUNCTION_58>:
c0de7b90:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7b94:	08c1      	lsrs	r1, r0, #3
c0de7b96:	2003      	movs	r0, #3
c0de7b98:	f003 bf29 	b.w	c0deb9ee <nbgl_objPoolGet>

c0de7b9c <OUTLINED_FUNCTION_59>:
c0de7b9c:	71d1      	strb	r1, [r2, #7]
c0de7b9e:	7190      	strb	r0, [r2, #6]
c0de7ba0:	f892 0020 	ldrb.w	r0, [r2, #32]
c0de7ba4:	3001      	adds	r0, #1
c0de7ba6:	f882 0020 	strb.w	r0, [r2, #32]
c0de7baa:	4770      	bx	lr

c0de7bac <OUTLINED_FUNCTION_60>:
c0de7bac:	7801      	ldrb	r1, [r0, #0]
c0de7bae:	7840      	ldrb	r0, [r0, #1]
c0de7bb0:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de7bb4:	f64f 71f0 	movw	r1, #65520	@ 0xfff0
c0de7bb8:	1a08      	subs	r0, r1, r0
c0de7bba:	4770      	bx	lr

c0de7bbc <OUTLINED_FUNCTION_61>:
c0de7bbc:	f005 0301 	and.w	r3, r5, #1
c0de7bc0:	f003 bf2e 	b.w	c0deba20 <nbgl_getTextHeightInWidth>

c0de7bc4 <OUTLINED_FUNCTION_62>:
c0de7bc4:	200d      	movs	r0, #13
c0de7bc6:	f003 bf2b 	b.w	c0deba20 <nbgl_getTextHeightInWidth>

c0de7bca <OUTLINED_FUNCTION_64>:
c0de7bca:	4604      	mov	r4, r0
c0de7bcc:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de7bd0:	4770      	bx	lr

c0de7bd2 <OUTLINED_FUNCTION_65>:
c0de7bd2:	758a      	strb	r2, [r1, #22]
c0de7bd4:	460a      	mov	r2, r1
c0de7bd6:	f802 0f22 	strb.w	r0, [r2, #34]!
c0de7bda:	0c00      	lsrs	r0, r0, #16
c0de7bdc:	7090      	strb	r0, [r2, #2]
c0de7bde:	4770      	bx	lr

c0de7be0 <OUTLINED_FUNCTION_66>:
c0de7be0:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de7be4:	7893      	ldrb	r3, [r2, #2]
c0de7be6:	78d2      	ldrb	r2, [r2, #3]
c0de7be8:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de7bec:	4770      	bx	lr

c0de7bee <OUTLINED_FUNCTION_67>:
c0de7bee:	f88d 0010 	strb.w	r0, [sp, #16]
c0de7bf2:	8928      	ldrh	r0, [r5, #8]
c0de7bf4:	f8ad 000c 	strh.w	r0, [sp, #12]
c0de7bf8:	4640      	mov	r0, r8
c0de7bfa:	4770      	bx	lr

c0de7bfc <OUTLINED_FUNCTION_68>:
c0de7bfc:	f897 00ad 	ldrb.w	r0, [r7, #173]	@ 0xad
c0de7c00:	08c1      	lsrs	r1, r0, #3
c0de7c02:	2004      	movs	r0, #4
c0de7c04:	4720      	bx	r4

c0de7c06 <OUTLINED_FUNCTION_69>:
c0de7c06:	70e9      	strb	r1, [r5, #3]
c0de7c08:	0c01      	lsrs	r1, r0, #16
c0de7c0a:	0a00      	lsrs	r0, r0, #8
c0de7c0c:	70a9      	strb	r1, [r5, #2]
c0de7c0e:	f88a 0023 	strb.w	r0, [sl, #35]	@ 0x23
c0de7c12:	4770      	bx	lr

c0de7c14 <OUTLINED_FUNCTION_70>:
c0de7c14:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de7c18:	ea43 2206 	orr.w	r2, r3, r6, lsl #8
c0de7c1c:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de7c20:	4770      	bx	lr

c0de7c22 <OUTLINED_FUNCTION_71>:
c0de7c22:	f886 a018 	strb.w	sl, [r6, #24]
c0de7c26:	f886 8016 	strb.w	r8, [r6, #22]
c0de7c2a:	4770      	bx	lr

c0de7c2c <OUTLINED_FUNCTION_72>:
c0de7c2c:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
c0de7c30:	7802      	ldrb	r2, [r0, #0]
c0de7c32:	7840      	ldrb	r0, [r0, #1]
c0de7c34:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de7c38:	4770      	bx	lr

c0de7c3a <OUTLINED_FUNCTION_73>:
c0de7c3a:	70f1      	strb	r1, [r6, #3]
c0de7c3c:	0c01      	lsrs	r1, r0, #16
c0de7c3e:	0a00      	lsrs	r0, r0, #8
c0de7c40:	70b1      	strb	r1, [r6, #2]
c0de7c42:	f88b 0023 	strb.w	r0, [fp, #35]	@ 0x23
c0de7c46:	4770      	bx	lr

c0de7c48 <OUTLINED_FUNCTION_74>:
c0de7c48:	7a2a      	ldrb	r2, [r5, #8]
c0de7c4a:	7a6b      	ldrb	r3, [r5, #9]
c0de7c4c:	4620      	mov	r0, r4
c0de7c4e:	f7fc bbd5 	b.w	c0de43fc <layoutAddCallbackObj>

c0de7c52 <OUTLINED_FUNCTION_75>:
c0de7c52:	f841 4022 	str.w	r4, [r1, r2, lsl #2]
c0de7c56:	2100      	movs	r1, #0
c0de7c58:	7621      	strb	r1, [r4, #24]
c0de7c5a:	2110      	movs	r1, #16
c0de7c5c:	75e1      	strb	r1, [r4, #23]
c0de7c5e:	4770      	bx	lr

c0de7c60 <layoutNavigationCallback>:
c0de7c60:	b570      	push	{r4, r5, r6, lr}
c0de7c62:	290a      	cmp	r1, #10
c0de7c64:	d029      	beq.n	c0de7cba <layoutNavigationCallback+0x5a>
c0de7c66:	2909      	cmp	r1, #9
c0de7c68:	d02b      	beq.n	c0de7cc2 <layoutNavigationCallback+0x62>
c0de7c6a:	2900      	cmp	r1, #0
c0de7c6c:	d14a      	bne.n	c0de7d04 <layoutNavigationCallback+0xa4>
c0de7c6e:	4604      	mov	r4, r0
c0de7c70:	7bc1      	ldrb	r1, [r0, #15]
c0de7c72:	f814 5f0e 	ldrb.w	r5, [r4, #14]!
c0de7c76:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de7c7a:	78a5      	ldrb	r5, [r4, #2]
c0de7c7c:	78e4      	ldrb	r4, [r4, #3]
c0de7c7e:	ea45 2404 	orr.w	r4, r5, r4, lsl #8
c0de7c82:	ea41 4104 	orr.w	r1, r1, r4, lsl #16
c0de7c86:	460d      	mov	r5, r1
c0de7c88:	f891 4023 	ldrb.w	r4, [r1, #35]	@ 0x23
c0de7c8c:	f815 6f22 	ldrb.w	r6, [r5, #34]!
c0de7c90:	ea46 2404 	orr.w	r4, r6, r4, lsl #8
c0de7c94:	78ae      	ldrb	r6, [r5, #2]
c0de7c96:	78ed      	ldrb	r5, [r5, #3]
c0de7c98:	ea46 2505 	orr.w	r5, r6, r5, lsl #8
c0de7c9c:	ea44 4405 	orr.w	r4, r4, r5, lsl #16
c0de7ca0:	6825      	ldr	r5, [r4, #0]
c0de7ca2:	4285      	cmp	r5, r0
c0de7ca4:	d01e      	beq.n	c0de7ce4 <layoutNavigationCallback+0x84>
c0de7ca6:	6865      	ldr	r5, [r4, #4]
c0de7ca8:	4285      	cmp	r5, r0
c0de7caa:	d01e      	beq.n	c0de7cea <layoutNavigationCallback+0x8a>
c0de7cac:	68a4      	ldr	r4, [r4, #8]
c0de7cae:	4284      	cmp	r4, r0
c0de7cb0:	d128      	bne.n	c0de7d04 <layoutNavigationCallback+0xa4>
c0de7cb2:	2a01      	cmp	r2, #1
c0de7cb4:	d81d      	bhi.n	c0de7cf2 <layoutNavigationCallback+0x92>
c0de7cb6:	7818      	ldrb	r0, [r3, #0]
c0de7cb8:	e01f      	b.n	c0de7cfa <layoutNavigationCallback+0x9a>
c0de7cba:	2a01      	cmp	r2, #1
c0de7cbc:	d805      	bhi.n	c0de7cca <layoutNavigationCallback+0x6a>
c0de7cbe:	7819      	ldrb	r1, [r3, #0]
c0de7cc0:	e007      	b.n	c0de7cd2 <layoutNavigationCallback+0x72>
c0de7cc2:	7819      	ldrb	r1, [r3, #0]
c0de7cc4:	b1f1      	cbz	r1, c0de7d04 <layoutNavigationCallback+0xa4>
c0de7cc6:	3901      	subs	r1, #1
c0de7cc8:	e004      	b.n	c0de7cd4 <layoutNavigationCallback+0x74>
c0de7cca:	7819      	ldrb	r1, [r3, #0]
c0de7ccc:	1e54      	subs	r4, r2, #1
c0de7cce:	428c      	cmp	r4, r1
c0de7cd0:	d918      	bls.n	c0de7d04 <layoutNavigationCallback+0xa4>
c0de7cd2:	3101      	adds	r1, #1
c0de7cd4:	7019      	strb	r1, [r3, #0]
c0de7cd6:	b2cb      	uxtb	r3, r1
c0de7cd8:	4611      	mov	r1, r2
c0de7cda:	461a      	mov	r2, r3
c0de7cdc:	f000 f814 	bl	c0de7d08 <configButtons>
c0de7ce0:	2001      	movs	r0, #1
c0de7ce2:	bd70      	pop	{r4, r5, r6, pc}
c0de7ce4:	20ff      	movs	r0, #255	@ 0xff
c0de7ce6:	7018      	strb	r0, [r3, #0]
c0de7ce8:	e7fa      	b.n	c0de7ce0 <layoutNavigationCallback+0x80>
c0de7cea:	7818      	ldrb	r0, [r3, #0]
c0de7cec:	b150      	cbz	r0, c0de7d04 <layoutNavigationCallback+0xa4>
c0de7cee:	3801      	subs	r0, #1
c0de7cf0:	e004      	b.n	c0de7cfc <layoutNavigationCallback+0x9c>
c0de7cf2:	7818      	ldrb	r0, [r3, #0]
c0de7cf4:	1e54      	subs	r4, r2, #1
c0de7cf6:	4284      	cmp	r4, r0
c0de7cf8:	d904      	bls.n	c0de7d04 <layoutNavigationCallback+0xa4>
c0de7cfa:	3001      	adds	r0, #1
c0de7cfc:	7018      	strb	r0, [r3, #0]
c0de7cfe:	b2c3      	uxtb	r3, r0
c0de7d00:	4608      	mov	r0, r1
c0de7d02:	e7e9      	b.n	c0de7cd8 <layoutNavigationCallback+0x78>
c0de7d04:	2000      	movs	r0, #0
c0de7d06:	bd70      	pop	{r4, r5, r6, pc}

c0de7d08 <configButtons>:
c0de7d08:	b5b0      	push	{r4, r5, r7, lr}
c0de7d0a:	f810 3f22 	ldrb.w	r3, [r0, #34]!
c0de7d0e:	7844      	ldrb	r4, [r0, #1]
c0de7d10:	7885      	ldrb	r5, [r0, #2]
c0de7d12:	78c0      	ldrb	r0, [r0, #3]
c0de7d14:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de7d18:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
c0de7d1c:	ea43 4000 	orr.w	r0, r3, r0, lsl #16
c0de7d20:	e9d0 3001 	ldrd	r3, r0, [r0, #4]
c0de7d24:	b12b      	cbz	r3, c0de7d32 <configButtons+0x2a>
c0de7d26:	fab2 f482 	clz	r4, r2
c0de7d2a:	0964      	lsrs	r4, r4, #5
c0de7d2c:	0064      	lsls	r4, r4, #1
c0de7d2e:	f883 4021 	strb.w	r4, [r3, #33]	@ 0x21
c0de7d32:	2902      	cmp	r1, #2
c0de7d34:	d307      	bcc.n	c0de7d46 <configButtons+0x3e>
c0de7d36:	43d2      	mvns	r2, r2
c0de7d38:	4411      	add	r1, r2
c0de7d3a:	fab1 f181 	clz	r1, r1
c0de7d3e:	0949      	lsrs	r1, r1, #5
c0de7d40:	0049      	lsls	r1, r1, #1
c0de7d42:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de7d46:	bdb0      	pop	{r4, r5, r7, pc}

c0de7d48 <layoutNavigationPopulate>:
c0de7d48:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de7d4c:	4680      	mov	r8, r0
c0de7d4e:	78c8      	ldrb	r0, [r1, #3]
c0de7d50:	4616      	mov	r6, r2
c0de7d52:	460d      	mov	r5, r1
c0de7d54:	b340      	cbz	r0, c0de7da8 <layoutNavigationPopulate+0x60>
c0de7d56:	2005      	movs	r0, #5
c0de7d58:	4631      	mov	r1, r6
c0de7d5a:	2405      	movs	r4, #5
c0de7d5c:	f003 fe47 	bl	c0deb9ee <nbgl_objPoolGet>
c0de7d60:	4978      	ldr	r1, [pc, #480]	@ (c0de7f44 <layoutNavigationPopulate+0x1fc>)
c0de7d62:	4479      	add	r1, pc
c0de7d64:	f000 f903 	bl	c0de7f6e <OUTLINED_FUNCTION_1>
c0de7d68:	70d3      	strb	r3, [r2, #3]
c0de7d6a:	7091      	strb	r1, [r2, #2]
c0de7d6c:	2258      	movs	r2, #88	@ 0x58
c0de7d6e:	2303      	movs	r3, #3
c0de7d70:	2100      	movs	r1, #0
c0de7d72:	7182      	strb	r2, [r0, #6]
c0de7d74:	7102      	strb	r2, [r0, #4]
c0de7d76:	2201      	movs	r2, #1
c0de7d78:	f880 3020 	strb.w	r3, [r0, #32]
c0de7d7c:	77c3      	strb	r3, [r0, #31]
c0de7d7e:	2304      	movs	r3, #4
c0de7d80:	71c1      	strb	r1, [r0, #7]
c0de7d82:	7141      	strb	r1, [r0, #5]
c0de7d84:	7601      	strb	r1, [r0, #24]
c0de7d86:	7741      	strb	r1, [r0, #29]
c0de7d88:	7702      	strb	r2, [r0, #28]
c0de7d8a:	7782      	strb	r2, [r0, #30]
c0de7d8c:	f880 3022 	strb.w	r3, [r0, #34]	@ 0x22
c0de7d90:	786a      	ldrb	r2, [r5, #1]
c0de7d92:	2a01      	cmp	r2, #1
c0de7d94:	bf88      	it	hi
c0de7d96:	2404      	movhi	r4, #4
c0de7d98:	7584      	strb	r4, [r0, #22]
c0de7d9a:	bf88      	it	hi
c0de7d9c:	2101      	movhi	r1, #1
c0de7d9e:	00c9      	lsls	r1, r1, #3
c0de7da0:	75c1      	strb	r1, [r0, #23]
c0de7da2:	f000 f8d7 	bl	c0de7f54 <OUTLINED_FUNCTION_0>
c0de7da6:	6008      	str	r0, [r1, #0]
c0de7da8:	7928      	ldrb	r0, [r5, #4]
c0de7daa:	b318      	cbz	r0, c0de7df4 <layoutNavigationPopulate+0xac>
c0de7dac:	2005      	movs	r0, #5
c0de7dae:	4631      	mov	r1, r6
c0de7db0:	f003 fe1d 	bl	c0deb9ee <nbgl_objPoolGet>
c0de7db4:	4964      	ldr	r1, [pc, #400]	@ (c0de7f48 <layoutNavigationPopulate+0x200>)
c0de7db6:	4479      	add	r1, pc
c0de7db8:	f000 f8d9 	bl	c0de7f6e <OUTLINED_FUNCTION_1>
c0de7dbc:	7091      	strb	r1, [r2, #2]
c0de7dbe:	2100      	movs	r1, #0
c0de7dc0:	70d3      	strb	r3, [r2, #3]
c0de7dc2:	2260      	movs	r2, #96	@ 0x60
c0de7dc4:	2301      	movs	r3, #1
c0de7dc6:	71c1      	strb	r1, [r0, #7]
c0de7dc8:	7141      	strb	r1, [r0, #5]
c0de7dca:	7741      	strb	r1, [r0, #29]
c0de7dcc:	7601      	strb	r1, [r0, #24]
c0de7dce:	2103      	movs	r1, #3
c0de7dd0:	7182      	strb	r2, [r0, #6]
c0de7dd2:	2268      	movs	r2, #104	@ 0x68
c0de7dd4:	7703      	strb	r3, [r0, #28]
c0de7dd6:	f880 1020 	strb.w	r1, [r0, #32]
c0de7dda:	77c1      	strb	r1, [r0, #31]
c0de7ddc:	2104      	movs	r1, #4
c0de7dde:	7102      	strb	r2, [r0, #4]
c0de7de0:	75c2      	strb	r2, [r0, #23]
c0de7de2:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de7de6:	2102      	movs	r1, #2
c0de7de8:	7781      	strb	r1, [r0, #30]
c0de7dea:	2106      	movs	r1, #6
c0de7dec:	7581      	strb	r1, [r0, #22]
c0de7dee:	f000 f8b1 	bl	c0de7f54 <OUTLINED_FUNCTION_0>
c0de7df2:	6048      	str	r0, [r1, #4]
c0de7df4:	2005      	movs	r0, #5
c0de7df6:	4631      	mov	r1, r6
c0de7df8:	f003 fdf9 	bl	c0deb9ee <nbgl_objPoolGet>
c0de7dfc:	4c53      	ldr	r4, [pc, #332]	@ (c0de7f4c <layoutNavigationPopulate+0x204>)
c0de7dfe:	447c      	add	r4, pc
c0de7e00:	0a21      	lsrs	r1, r4, #8
c0de7e02:	0e22      	lsrs	r2, r4, #24
c0de7e04:	f880 102f 	strb.w	r1, [r0, #47]	@ 0x2f
c0de7e08:	4601      	mov	r1, r0
c0de7e0a:	f801 4f2e 	strb.w	r4, [r1, #46]!
c0de7e0e:	70ca      	strb	r2, [r1, #3]
c0de7e10:	0c22      	lsrs	r2, r4, #16
c0de7e12:	708a      	strb	r2, [r1, #2]
c0de7e14:	2100      	movs	r1, #0
c0de7e16:	2260      	movs	r2, #96	@ 0x60
c0de7e18:	7182      	strb	r2, [r0, #6]
c0de7e1a:	2268      	movs	r2, #104	@ 0x68
c0de7e1c:	71c1      	strb	r1, [r0, #7]
c0de7e1e:	7141      	strb	r1, [r0, #5]
c0de7e20:	7741      	strb	r1, [r0, #29]
c0de7e22:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de7e26:	2103      	movs	r1, #3
c0de7e28:	7102      	strb	r2, [r0, #4]
c0de7e2a:	2201      	movs	r2, #1
c0de7e2c:	f880 1020 	strb.w	r1, [r0, #32]
c0de7e30:	77c1      	strb	r1, [r0, #31]
c0de7e32:	7781      	strb	r1, [r0, #30]
c0de7e34:	2106      	movs	r1, #6
c0de7e36:	7702      	strb	r2, [r0, #28]
c0de7e38:	2204      	movs	r2, #4
c0de7e3a:	7581      	strb	r1, [r0, #22]
c0de7e3c:	4641      	mov	r1, r8
c0de7e3e:	f880 2022 	strb.w	r2, [r0, #34]	@ 0x22
c0de7e42:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de7e46:	784b      	ldrb	r3, [r1, #1]
c0de7e48:	788f      	ldrb	r7, [r1, #2]
c0de7e4a:	78c9      	ldrb	r1, [r1, #3]
c0de7e4c:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de7e50:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de7e54:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de7e58:	6088      	str	r0, [r1, #8]
c0de7e5a:	79a8      	ldrb	r0, [r5, #6]
c0de7e5c:	2800      	cmp	r0, #0
c0de7e5e:	d067      	beq.n	c0de7f30 <layoutNavigationPopulate+0x1e8>
c0de7e60:	79e8      	ldrb	r0, [r5, #7]
c0de7e62:	2800      	cmp	r0, #0
c0de7e64:	d04c      	beq.n	c0de7f00 <layoutNavigationPopulate+0x1b8>
c0de7e66:	2004      	movs	r0, #4
c0de7e68:	4631      	mov	r1, r6
c0de7e6a:	f003 fdc0 	bl	c0deb9ee <nbgl_objPoolGet>
c0de7e6e:	4606      	mov	r6, r0
c0de7e70:	7868      	ldrb	r0, [r5, #1]
c0de7e72:	78a9      	ldrb	r1, [r5, #2]
c0de7e74:	f04f 0a0b 	mov.w	sl, #11
c0de7e78:	9000      	str	r0, [sp, #0]
c0de7e7a:	4831      	ldr	r0, [pc, #196]	@ (c0de7f40 <layoutNavigationPopulate+0x1f8>)
c0de7e7c:	1c4b      	adds	r3, r1, #1
c0de7e7e:	210b      	movs	r1, #11
c0de7e80:	4a33      	ldr	r2, [pc, #204]	@ (c0de7f50 <layoutNavigationPopulate+0x208>)
c0de7e82:	eb09 0700 	add.w	r7, r9, r0
c0de7e86:	447a      	add	r2, pc
c0de7e88:	4638      	mov	r0, r7
c0de7e8a:	f003 fdff 	bl	c0deba8c <snprintf>
c0de7e8e:	0a38      	lsrs	r0, r7, #8
c0de7e90:	0e39      	lsrs	r1, r7, #24
c0de7e92:	f06f 0201 	mvn.w	r2, #1
c0de7e96:	f886 a022 	strb.w	sl, [r6, #34]	@ 0x22
c0de7e9a:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de7e9e:	4630      	mov	r0, r6
c0de7ea0:	f800 7f26 	strb.w	r7, [r0, #38]!
c0de7ea4:	70c1      	strb	r1, [r0, #3]
c0de7ea6:	0c39      	lsrs	r1, r7, #16
c0de7ea8:	7081      	strb	r1, [r0, #2]
c0de7eaa:	2000      	movs	r0, #0
c0de7eac:	7861      	ldrb	r1, [r4, #1]
c0de7eae:	71f0      	strb	r0, [r6, #7]
c0de7eb0:	2060      	movs	r0, #96	@ 0x60
c0de7eb2:	71b0      	strb	r0, [r6, #6]
c0de7eb4:	2001      	movs	r0, #1
c0de7eb6:	77f0      	strb	r0, [r6, #31]
c0de7eb8:	2005      	movs	r0, #5
c0de7eba:	f886 0020 	strb.w	r0, [r6, #32]
c0de7ebe:	75b0      	strb	r0, [r6, #22]
c0de7ec0:	7820      	ldrb	r0, [r4, #0]
c0de7ec2:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de7ec6:	f1c0 0168 	rsb	r1, r0, #104	@ 0x68
c0de7eca:	fb91 f1f2 	sdiv	r1, r1, r2
c0de7ece:	1a08      	subs	r0, r1, r0
c0de7ed0:	4641      	mov	r1, r8
c0de7ed2:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de7ed6:	f811 3c1e 	ldrb.w	r3, [r1, #-30]
c0de7eda:	f811 4c1d 	ldrb.w	r4, [r1, #-29]
c0de7ede:	784f      	ldrb	r7, [r1, #1]
c0de7ee0:	788a      	ldrb	r2, [r1, #2]
c0de7ee2:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de7ee6:	eb03 0040 	add.w	r0, r3, r0, lsl #1
c0de7eea:	7130      	strb	r0, [r6, #4]
c0de7eec:	0a00      	lsrs	r0, r0, #8
c0de7eee:	78c9      	ldrb	r1, [r1, #3]
c0de7ef0:	7170      	strb	r0, [r6, #5]
c0de7ef2:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de7ef6:	ea4c 2207 	orr.w	r2, ip, r7, lsl #8
c0de7efa:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de7efe:	60ce      	str	r6, [r1, #12]
c0de7f00:	7928      	ldrb	r0, [r5, #4]
c0de7f02:	b1a8      	cbz	r0, c0de7f30 <layoutNavigationPopulate+0x1e8>
c0de7f04:	4640      	mov	r0, r8
c0de7f06:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7f0a:	7842      	ldrb	r2, [r0, #1]
c0de7f0c:	7883      	ldrb	r3, [r0, #2]
c0de7f0e:	78c0      	ldrb	r0, [r0, #3]
c0de7f10:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7f14:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de7f18:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7f1c:	6840      	ldr	r0, [r0, #4]
c0de7f1e:	f810 1f17 	ldrb.w	r1, [r0, #23]!
c0de7f22:	7842      	ldrb	r2, [r0, #1]
c0de7f24:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7f28:	314f      	adds	r1, #79	@ 0x4f
c0de7f2a:	7001      	strb	r1, [r0, #0]
c0de7f2c:	0a09      	lsrs	r1, r1, #8
c0de7f2e:	7041      	strb	r1, [r0, #1]
c0de7f30:	7869      	ldrb	r1, [r5, #1]
c0de7f32:	78aa      	ldrb	r2, [r5, #2]
c0de7f34:	4640      	mov	r0, r8
c0de7f36:	e8bd 45f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de7f3a:	f7ff bee5 	b.w	c0de7d08 <configButtons>
c0de7f3e:	bf00      	nop
c0de7f40:	00001910 	.word	0x00001910
c0de7f44:	0000545b 	.word	0x0000545b
c0de7f48:	000052ed 	.word	0x000052ed
c0de7f4c:	00005328 	.word	0x00005328
c0de7f50:	00005e7c 	.word	0x00005e7c

c0de7f54 <OUTLINED_FUNCTION_0>:
c0de7f54:	4641      	mov	r1, r8
c0de7f56:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de7f5a:	784b      	ldrb	r3, [r1, #1]
c0de7f5c:	788c      	ldrb	r4, [r1, #2]
c0de7f5e:	78c9      	ldrb	r1, [r1, #3]
c0de7f60:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de7f64:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
c0de7f68:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de7f6c:	4770      	bx	lr

c0de7f6e <OUTLINED_FUNCTION_1>:
c0de7f6e:	0a0a      	lsrs	r2, r1, #8
c0de7f70:	0e0b      	lsrs	r3, r1, #24
c0de7f72:	f880 202f 	strb.w	r2, [r0, #47]	@ 0x2f
c0de7f76:	4602      	mov	r2, r0
c0de7f78:	f802 1f2e 	strb.w	r1, [r2, #46]!
c0de7f7c:	0c09      	lsrs	r1, r1, #16
c0de7f7e:	4770      	bx	lr

c0de7f80 <nbgl_pageDrawInfo>:
c0de7f80:	b570      	push	{r4, r5, r6, lr}
c0de7f82:	b08c      	sub	sp, #48	@ 0x30
c0de7f84:	460d      	mov	r5, r1
c0de7f86:	4606      	mov	r6, r0
c0de7f88:	a805      	add	r0, sp, #20
c0de7f8a:	211c      	movs	r1, #28
c0de7f8c:	4614      	mov	r4, r2
c0de7f8e:	f004 f931 	bl	c0dec1f4 <__aeabi_memclr>
c0de7f92:	2001      	movs	r0, #1
c0de7f94:	9608      	str	r6, [sp, #32]
c0de7f96:	f88d 0015 	strb.w	r0, [sp, #21]
c0de7f9a:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de7f9e:	b948      	cbnz	r0, c0de7fb4 <nbgl_pageDrawInfo+0x34>
c0de7fa0:	6a20      	ldr	r0, [r4, #32]
c0de7fa2:	9006      	str	r0, [sp, #24]
c0de7fa4:	f894 0025 	ldrb.w	r0, [r4, #37]	@ 0x25
c0de7fa8:	f88d 001c 	strb.w	r0, [sp, #28]
c0de7fac:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de7fb0:	f88d 001d 	strb.w	r0, [sp, #29]
c0de7fb4:	b1f5      	cbz	r5, c0de7ff4 <nbgl_pageDrawInfo+0x74>
c0de7fb6:	4629      	mov	r1, r5
c0de7fb8:	7a68      	ldrb	r0, [r5, #9]
c0de7fba:	78eb      	ldrb	r3, [r5, #3]
c0de7fbc:	f811 2f08 	ldrb.w	r2, [r1, #8]!
c0de7fc0:	f000 fb4f 	bl	c0de8662 <OUTLINED_FUNCTION_1>
c0de7fc4:	4629      	mov	r1, r5
c0de7fc6:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de7fc8:	7968      	ldrb	r0, [r5, #5]
c0de7fca:	f811 2f04 	ldrb.w	r2, [r1, #4]!
c0de7fce:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de7fd2:	788a      	ldrb	r2, [r1, #2]
c0de7fd4:	78c9      	ldrb	r1, [r1, #3]
c0de7fd6:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de7fda:	78aa      	ldrb	r2, [r5, #2]
c0de7fdc:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de7fe0:	7869      	ldrb	r1, [r5, #1]
c0de7fe2:	900a      	str	r0, [sp, #40]	@ 0x28
c0de7fe4:	7828      	ldrb	r0, [r5, #0]
c0de7fe6:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de7fea:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de7fee:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
c0de7ff2:	e000      	b.n	c0de7ff6 <nbgl_pageDrawInfo+0x76>
c0de7ff4:	2000      	movs	r0, #0
c0de7ff6:	9009      	str	r0, [sp, #36]	@ 0x24
c0de7ff8:	a805      	add	r0, sp, #20
c0de7ffa:	f7fc fa21 	bl	c0de4440 <nbgl_layoutGet>
c0de7ffe:	4605      	mov	r5, r0
c0de8000:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de8004:	b150      	cbz	r0, c0de801c <nbgl_pageDrawInfo+0x9c>
c0de8006:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de800a:	f894 3025 	ldrb.w	r3, [r4, #37]	@ 0x25
c0de800e:	6a22      	ldr	r2, [r4, #32]
c0de8010:	f44f 61c0 	mov.w	r1, #1536	@ 0x600
c0de8014:	9000      	str	r0, [sp, #0]
c0de8016:	4628      	mov	r0, r5
c0de8018:	f7fc ff7a 	bl	c0de4f10 <nbgl_layoutAddSwipe>
c0de801c:	7d20      	ldrb	r0, [r4, #20]
c0de801e:	b3b8      	cbz	r0, c0de8090 <nbgl_pageDrawInfo+0x110>
c0de8020:	4628      	mov	r0, r5
c0de8022:	2128      	movs	r1, #40	@ 0x28
c0de8024:	f000 f8a6 	bl	c0de8174 <addEmptyHeader>
c0de8028:	4628      	mov	r0, r5
c0de802a:	4621      	mov	r1, r4
c0de802c:	f7fe f887 	bl	c0de613e <nbgl_layoutAddCenteredInfo>
c0de8030:	6aa0      	ldr	r0, [r4, #40]	@ 0x28
c0de8032:	b1b8      	cbz	r0, c0de8064 <nbgl_pageDrawInfo+0xe4>
c0de8034:	7d61      	ldrb	r1, [r4, #21]
c0de8036:	2904      	cmp	r1, #4
c0de8038:	d014      	beq.n	c0de8064 <nbgl_pageDrawInfo+0xe4>
c0de803a:	9001      	str	r0, [sp, #4]
c0de803c:	2001      	movs	r0, #1
c0de803e:	f8ad 000e 	strh.w	r0, [sp, #14]
c0de8042:	6ae0      	ldr	r0, [r4, #44]	@ 0x2c
c0de8044:	9002      	str	r0, [sp, #8]
c0de8046:	7de0      	ldrb	r0, [r4, #23]
c0de8048:	f88d 000c 	strb.w	r0, [sp, #12]
c0de804c:	f894 0030 	ldrb.w	r0, [r4, #48]	@ 0x30
c0de8050:	f88d 000d 	strb.w	r0, [sp, #13]
c0de8054:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de8058:	f88d 0010 	strb.w	r0, [sp, #16]
c0de805c:	a901      	add	r1, sp, #4
c0de805e:	4628      	mov	r0, r5
c0de8060:	f7fe fe2d 	bl	c0de6cbe <nbgl_layoutAddButton>
c0de8064:	69a0      	ldr	r0, [r4, #24]
c0de8066:	b140      	cbz	r0, c0de807a <nbgl_pageDrawInfo+0xfa>
c0de8068:	f003 fea2 	bl	c0debdb0 <pic>
c0de806c:	7f22      	ldrb	r2, [r4, #28]
c0de806e:	f894 3031 	ldrb.w	r3, [r4, #49]	@ 0x31
c0de8072:	4601      	mov	r1, r0
c0de8074:	4628      	mov	r0, r5
c0de8076:	f7fe ff10 	bl	c0de6e9a <nbgl_layoutAddFooter>
c0de807a:	7d20      	ldrb	r0, [r4, #20]
c0de807c:	b1f8      	cbz	r0, c0de80be <nbgl_pageDrawInfo+0x13e>
c0de807e:	2801      	cmp	r0, #1
c0de8080:	d00f      	beq.n	c0de80a2 <nbgl_pageDrawInfo+0x122>
c0de8082:	2802      	cmp	r0, #2
c0de8084:	d010      	beq.n	c0de80a8 <nbgl_pageDrawInfo+0x128>
c0de8086:	2803      	cmp	r0, #3
c0de8088:	d13f      	bne.n	c0de810a <nbgl_pageDrawInfo+0x18a>
c0de808a:	4833      	ldr	r0, [pc, #204]	@ (c0de8158 <nbgl_pageDrawInfo+0x1d8>)
c0de808c:	4478      	add	r0, pc
c0de808e:	e00d      	b.n	c0de80ac <nbgl_pageDrawInfo+0x12c>
c0de8090:	6a20      	ldr	r0, [r4, #32]
c0de8092:	2800      	cmp	r0, #0
c0de8094:	d0c8      	beq.n	c0de8028 <nbgl_pageDrawInfo+0xa8>
c0de8096:	f003 fe8b 	bl	c0debdb0 <pic>
c0de809a:	7800      	ldrb	r0, [r0, #0]
c0de809c:	2800      	cmp	r0, #0
c0de809e:	d1bf      	bne.n	c0de8020 <nbgl_pageDrawInfo+0xa0>
c0de80a0:	e7c2      	b.n	c0de8028 <nbgl_pageDrawInfo+0xa8>
c0de80a2:	482c      	ldr	r0, [pc, #176]	@ (c0de8154 <nbgl_pageDrawInfo+0x1d4>)
c0de80a4:	4478      	add	r0, pc
c0de80a6:	e001      	b.n	c0de80ac <nbgl_pageDrawInfo+0x12c>
c0de80a8:	482c      	ldr	r0, [pc, #176]	@ (c0de815c <nbgl_pageDrawInfo+0x1dc>)
c0de80aa:	4478      	add	r0, pc
c0de80ac:	f003 fe80 	bl	c0debdb0 <pic>
c0de80b0:	7da2      	ldrb	r2, [r4, #22]
c0de80b2:	f894 3031 	ldrb.w	r3, [r4, #49]	@ 0x31
c0de80b6:	4601      	mov	r1, r0
c0de80b8:	4628      	mov	r0, r5
c0de80ba:	f7fc ff85 	bl	c0de4fc8 <nbgl_layoutAddTopRightButton>
c0de80be:	7d60      	ldrb	r0, [r4, #21]
c0de80c0:	b3c0      	cbz	r0, c0de8134 <nbgl_pageDrawInfo+0x1b4>
c0de80c2:	2801      	cmp	r0, #1
c0de80c4:	d023      	beq.n	c0de810e <nbgl_pageDrawInfo+0x18e>
c0de80c6:	2802      	cmp	r0, #2
c0de80c8:	d024      	beq.n	c0de8114 <nbgl_pageDrawInfo+0x194>
c0de80ca:	2803      	cmp	r0, #3
c0de80cc:	d025      	beq.n	c0de811a <nbgl_pageDrawInfo+0x19a>
c0de80ce:	2804      	cmp	r0, #4
c0de80d0:	d11b      	bne.n	c0de810a <nbgl_pageDrawInfo+0x18a>
c0de80d2:	6aa0      	ldr	r0, [r4, #40]	@ 0x28
c0de80d4:	b3a0      	cbz	r0, c0de8140 <nbgl_pageDrawInfo+0x1c0>
c0de80d6:	4923      	ldr	r1, [pc, #140]	@ (c0de8164 <nbgl_pageDrawInfo+0x1e4>)
c0de80d8:	4479      	add	r1, pc
c0de80da:	e9cd 0101 	strd	r0, r1, [sp, #4]
c0de80de:	6ae0      	ldr	r0, [r4, #44]	@ 0x2c
c0de80e0:	2102      	movs	r1, #2
c0de80e2:	9003      	str	r0, [sp, #12]
c0de80e4:	7de0      	ldrb	r0, [r4, #23]
c0de80e6:	f88d 0010 	strb.w	r0, [sp, #16]
c0de80ea:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de80ee:	f88d 0012 	strb.w	r0, [sp, #18]
c0de80f2:	f894 0030 	ldrb.w	r0, [r4, #48]	@ 0x30
c0de80f6:	2800      	cmp	r0, #0
c0de80f8:	bf08      	it	eq
c0de80fa:	2101      	moveq	r1, #1
c0de80fc:	f88d 1011 	strb.w	r1, [sp, #17]
c0de8100:	4628      	mov	r0, r5
c0de8102:	a901      	add	r1, sp, #4
c0de8104:	f7fe fbe4 	bl	c0de68d0 <nbgl_layoutAddChoiceButtons>
c0de8108:	e014      	b.n	c0de8134 <nbgl_pageDrawInfo+0x1b4>
c0de810a:	2500      	movs	r5, #0
c0de810c:	e015      	b.n	c0de813a <nbgl_pageDrawInfo+0x1ba>
c0de810e:	4814      	ldr	r0, [pc, #80]	@ (c0de8160 <nbgl_pageDrawInfo+0x1e0>)
c0de8110:	4478      	add	r0, pc
c0de8112:	e004      	b.n	c0de811e <nbgl_pageDrawInfo+0x19e>
c0de8114:	4816      	ldr	r0, [pc, #88]	@ (c0de8170 <nbgl_pageDrawInfo+0x1f0>)
c0de8116:	4478      	add	r0, pc
c0de8118:	e001      	b.n	c0de811e <nbgl_pageDrawInfo+0x19e>
c0de811a:	4814      	ldr	r0, [pc, #80]	@ (c0de816c <nbgl_pageDrawInfo+0x1ec>)
c0de811c:	4478      	add	r0, pc
c0de811e:	f003 fe47 	bl	c0debdb0 <pic>
c0de8122:	4601      	mov	r1, r0
c0de8124:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de8128:	7de2      	ldrb	r2, [r4, #23]
c0de812a:	2300      	movs	r3, #0
c0de812c:	9000      	str	r0, [sp, #0]
c0de812e:	4628      	mov	r0, r5
c0de8130:	f7fd fb16 	bl	c0de5760 <nbgl_layoutAddBottomButton>
c0de8134:	4628      	mov	r0, r5
c0de8136:	f7ff f9f4 	bl	c0de7522 <nbgl_layoutDraw>
c0de813a:	4628      	mov	r0, r5
c0de813c:	b00c      	add	sp, #48	@ 0x30
c0de813e:	bd70      	pop	{r4, r5, r6, pc}
c0de8140:	7de2      	ldrb	r2, [r4, #23]
c0de8142:	f894 3031 	ldrb.w	r3, [r4, #49]	@ 0x31
c0de8146:	4908      	ldr	r1, [pc, #32]	@ (c0de8168 <nbgl_pageDrawInfo+0x1e8>)
c0de8148:	4628      	mov	r0, r5
c0de814a:	4479      	add	r1, pc
c0de814c:	f7fe fea5 	bl	c0de6e9a <nbgl_layoutAddFooter>
c0de8150:	e7f0      	b.n	c0de8134 <nbgl_pageDrawInfo+0x1b4>
c0de8152:	bf00      	nop
c0de8154:	0000564a 	.word	0x0000564a
c0de8158:	00005174 	.word	0x00005174
c0de815c:	00005113 	.word	0x00005113
c0de8160:	000055de 	.word	0x000055de
c0de8164:	00005fee 	.word	0x00005fee
c0de8168:	00005f7c 	.word	0x00005f7c
c0de816c:	000050e4 	.word	0x000050e4
c0de8170:	000050a7 	.word	0x000050a7

c0de8174 <addEmptyHeader>:
c0de8174:	b570      	push	{r4, r5, r6, lr}
c0de8176:	b086      	sub	sp, #24
c0de8178:	ae01      	add	r6, sp, #4
c0de817a:	460c      	mov	r4, r1
c0de817c:	4605      	mov	r5, r0
c0de817e:	2114      	movs	r1, #20
c0de8180:	f000 fa85 	bl	c0de868e <OUTLINED_FUNCTION_4>
c0de8184:	4628      	mov	r0, r5
c0de8186:	4631      	mov	r1, r6
c0de8188:	f8ad 4008 	strh.w	r4, [sp, #8]
c0de818c:	f7fe feac 	bl	c0de6ee8 <nbgl_layoutAddHeader>
c0de8190:	b006      	add	sp, #24
c0de8192:	bd70      	pop	{r4, r5, r6, pc}

c0de8194 <nbgl_pageDrawConfirmation>:
c0de8194:	b5b0      	push	{r4, r5, r7, lr}
c0de8196:	b08c      	sub	sp, #48	@ 0x30
c0de8198:	4605      	mov	r5, r0
c0de819a:	6948      	ldr	r0, [r1, #20]
c0de819c:	460c      	mov	r4, r1
c0de819e:	f003 fe07 	bl	c0debdb0 <pic>
c0de81a2:	9001      	str	r0, [sp, #4]
c0de81a4:	69a0      	ldr	r0, [r4, #24]
c0de81a6:	b110      	cbz	r0, c0de81ae <nbgl_pageDrawConfirmation+0x1a>
c0de81a8:	f003 fe02 	bl	c0debdb0 <pic>
c0de81ac:	e001      	b.n	c0de81b2 <nbgl_pageDrawConfirmation+0x1e>
c0de81ae:	4815      	ldr	r0, [pc, #84]	@ (c0de8204 <nbgl_pageDrawConfirmation+0x70>)
c0de81b0:	4478      	add	r0, pc
c0de81b2:	2100      	movs	r1, #0
c0de81b4:	7fe2      	ldrb	r2, [r4, #31]
c0de81b6:	9508      	str	r5, [sp, #32]
c0de81b8:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de81bc:	2001      	movs	r0, #1
c0de81be:	f88d 1011 	strb.w	r1, [sp, #17]
c0de81c2:	9109      	str	r1, [sp, #36]	@ 0x24
c0de81c4:	9106      	str	r1, [sp, #24]
c0de81c6:	7fa1      	ldrb	r1, [r4, #30]
c0de81c8:	f88d 0015 	strb.w	r0, [sp, #21]
c0de81cc:	7f20      	ldrb	r0, [r4, #28]
c0de81ce:	f88d 2014 	strb.w	r2, [sp, #20]
c0de81d2:	f88d 1012 	strb.w	r1, [sp, #18]
c0de81d6:	f88d 0010 	strb.w	r0, [sp, #16]
c0de81da:	a805      	add	r0, sp, #20
c0de81dc:	f7fc f930 	bl	c0de4440 <nbgl_layoutGet>
c0de81e0:	2140      	movs	r1, #64	@ 0x40
c0de81e2:	4605      	mov	r5, r0
c0de81e4:	f7ff ffc6 	bl	c0de8174 <addEmptyHeader>
c0de81e8:	a901      	add	r1, sp, #4
c0de81ea:	4628      	mov	r0, r5
c0de81ec:	f7fe fb70 	bl	c0de68d0 <nbgl_layoutAddChoiceButtons>
c0de81f0:	4628      	mov	r0, r5
c0de81f2:	4621      	mov	r1, r4
c0de81f4:	f7fd ffa3 	bl	c0de613e <nbgl_layoutAddCenteredInfo>
c0de81f8:	4628      	mov	r0, r5
c0de81fa:	f7ff f992 	bl	c0de7522 <nbgl_layoutDraw>
c0de81fe:	4628      	mov	r0, r5
c0de8200:	b00c      	add	sp, #48	@ 0x30
c0de8202:	bdb0      	pop	{r4, r5, r7, pc}
c0de8204:	00005b11 	.word	0x00005b11

c0de8208 <nbgl_pageDrawGenericContentExt>:
c0de8208:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de820c:	b096      	sub	sp, #88	@ 0x58
c0de820e:	460e      	mov	r6, r1
c0de8210:	2100      	movs	r1, #0
c0de8212:	4615      	mov	r5, r2
c0de8214:	f88d 3008 	strb.w	r3, [sp, #8]
c0de8218:	e9cd 0105 	strd	r0, r1, [sp, #20]
c0de821c:	2001      	movs	r0, #1
c0de821e:	f88d 0009 	strb.w	r0, [sp, #9]
c0de8222:	b10e      	cbz	r6, c0de8228 <nbgl_pageDrawGenericContentExt+0x20>
c0de8224:	78f0      	ldrb	r0, [r6, #3]
c0de8226:	b108      	cbz	r0, c0de822c <nbgl_pageDrawGenericContentExt+0x24>
c0de8228:	9103      	str	r1, [sp, #12]
c0de822a:	e007      	b.n	c0de823c <nbgl_pageDrawGenericContentExt+0x34>
c0de822c:	6970      	ldr	r0, [r6, #20]
c0de822e:	7cb1      	ldrb	r1, [r6, #18]
c0de8230:	9003      	str	r0, [sp, #12]
c0de8232:	7970      	ldrb	r0, [r6, #5]
c0de8234:	f88d 1010 	strb.w	r1, [sp, #16]
c0de8238:	f88d 0011 	strb.w	r0, [sp, #17]
c0de823c:	a802      	add	r0, sp, #8
c0de823e:	f7fc f8ff 	bl	c0de4440 <nbgl_layoutGet>
c0de8242:	4682      	mov	sl, r0
c0de8244:	b17e      	cbz	r6, c0de8266 <nbgl_pageDrawGenericContentExt+0x5e>
c0de8246:	78f0      	ldrb	r0, [r6, #3]
c0de8248:	2801      	cmp	r0, #1
c0de824a:	d011      	beq.n	c0de8270 <nbgl_pageDrawGenericContentExt+0x68>
c0de824c:	b958      	cbnz	r0, c0de8266 <nbgl_pageDrawGenericContentExt+0x5e>
c0de824e:	68b3      	ldr	r3, [r6, #8]
c0de8250:	78b2      	ldrb	r2, [r6, #2]
c0de8252:	69b1      	ldr	r1, [r6, #24]
c0de8254:	b323      	cbz	r3, c0de82a0 <nbgl_pageDrawGenericContentExt+0x98>
c0de8256:	7970      	ldrb	r0, [r6, #5]
c0de8258:	7b34      	ldrb	r4, [r6, #12]
c0de825a:	e9cd 4000 	strd	r4, r0, [sp]
c0de825e:	4650      	mov	r0, sl
c0de8260:	f7fe fe2d 	bl	c0de6ebe <nbgl_layoutAddSplitFooter>
c0de8264:	e020      	b.n	c0de82a8 <nbgl_pageDrawGenericContentExt+0xa0>
c0de8266:	f04f 0800 	mov.w	r8, #0
c0de826a:	f44f 7716 	mov.w	r7, #600	@ 0x258
c0de826e:	e07e      	b.n	c0de836e <nbgl_pageDrawGenericContentExt+0x166>
c0de8270:	68b0      	ldr	r0, [r6, #8]
c0de8272:	2800      	cmp	r0, #0
c0de8274:	4680      	mov	r8, r0
c0de8276:	bf18      	it	ne
c0de8278:	f04f 0801 	movne.w	r8, #1
c0de827c:	d027      	beq.n	c0de82ce <nbgl_pageDrawGenericContentExt+0xc6>
c0de827e:	900e      	str	r0, [sp, #56]	@ 0x38
c0de8280:	2006      	movs	r0, #6
c0de8282:	7b31      	ldrb	r1, [r6, #12]
c0de8284:	f8ad 0034 	strh.w	r0, [sp, #52]	@ 0x34
c0de8288:	7970      	ldrb	r0, [r6, #5]
c0de828a:	f88d 103c 	strb.w	r1, [sp, #60]	@ 0x3c
c0de828e:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de8292:	a90d      	add	r1, sp, #52	@ 0x34
c0de8294:	4650      	mov	r0, sl
c0de8296:	f7fe fe27 	bl	c0de6ee8 <nbgl_layoutAddHeader>
c0de829a:	f5c0 7716 	rsb	r7, r0, #600	@ 0x258
c0de829e:	e018      	b.n	c0de82d2 <nbgl_pageDrawGenericContentExt+0xca>
c0de82a0:	7973      	ldrb	r3, [r6, #5]
c0de82a2:	4650      	mov	r0, sl
c0de82a4:	f7fe fdf9 	bl	c0de6e9a <nbgl_layoutAddFooter>
c0de82a8:	f5c0 7716 	rsb	r7, r0, #600	@ 0x258
c0de82ac:	7930      	ldrb	r0, [r6, #4]
c0de82ae:	2800      	cmp	r0, #0
c0de82b0:	d042      	beq.n	c0de8338 <nbgl_pageDrawGenericContentExt+0x130>
c0de82b2:	7c70      	ldrb	r0, [r6, #17]
c0de82b4:	7974      	ldrb	r4, [r6, #5]
c0de82b6:	7831      	ldrb	r1, [r6, #0]
c0de82b8:	7872      	ldrb	r2, [r6, #1]
c0de82ba:	7c33      	ldrb	r3, [r6, #16]
c0de82bc:	e9cd 0400 	strd	r0, r4, [sp]
c0de82c0:	4650      	mov	r0, sl
c0de82c2:	f7ff f913 	bl	c0de74ec <nbgl_layoutAddProgressIndicator>
c0de82c6:	1a3f      	subs	r7, r7, r0
c0de82c8:	f04f 0801 	mov.w	r8, #1
c0de82cc:	e04f      	b.n	c0de836e <nbgl_pageDrawGenericContentExt+0x166>
c0de82ce:	f44f 7716 	mov.w	r7, #600	@ 0x258
c0de82d2:	2001      	movs	r0, #1
c0de82d4:	f88d 0035 	strb.w	r0, [sp, #53]	@ 0x35
c0de82d8:	7870      	ldrb	r0, [r6, #1]
c0de82da:	2802      	cmp	r0, #2
c0de82dc:	d31c      	bcc.n	c0de8318 <nbgl_pageDrawGenericContentExt+0x110>
c0de82de:	6971      	ldr	r1, [r6, #20]
c0de82e0:	b369      	cbz	r1, c0de833e <nbgl_pageDrawGenericContentExt+0x136>
c0de82e2:	f88d 0039 	strb.w	r0, [sp, #57]	@ 0x39
c0de82e6:	2001      	movs	r0, #1
c0de82e8:	9111      	str	r1, [sp, #68]	@ 0x44
c0de82ea:	2103      	movs	r1, #3
c0de82ec:	7972      	ldrb	r2, [r6, #5]
c0de82ee:	f000 f9c7 	bl	c0de8680 <OUTLINED_FUNCTION_3>
c0de82f2:	2100      	movs	r1, #0
c0de82f4:	f88d 103b 	strb.w	r1, [sp, #59]	@ 0x3b
c0de82f8:	78b1      	ldrb	r1, [r6, #2]
c0de82fa:	f88d 2049 	strb.w	r2, [sp, #73]	@ 0x49
c0de82fe:	f88d 303c 	strb.w	r3, [sp, #60]	@ 0x3c
c0de8302:	f88d 2040 	strb.w	r2, [sp, #64]	@ 0x40
c0de8306:	f88d 003a 	strb.w	r0, [sp, #58]	@ 0x3a
c0de830a:	7cb0      	ldrb	r0, [r6, #18]
c0de830c:	f88d 1048 	strb.w	r1, [sp, #72]	@ 0x48
c0de8310:	f88d 003f 	strb.w	r0, [sp, #63]	@ 0x3f
c0de8314:	7cf0      	ldrb	r0, [r6, #19]
c0de8316:	e023      	b.n	c0de8360 <nbgl_pageDrawGenericContentExt+0x158>
c0de8318:	6970      	ldr	r0, [r6, #20]
c0de831a:	b340      	cbz	r0, c0de836e <nbgl_pageDrawGenericContentExt+0x166>
c0de831c:	2100      	movs	r1, #0
c0de831e:	900e      	str	r0, [sp, #56]	@ 0x38
c0de8320:	2001      	movs	r0, #1
c0de8322:	f88d 103c 	strb.w	r1, [sp, #60]	@ 0x3c
c0de8326:	f88d 0034 	strb.w	r0, [sp, #52]	@ 0x34
c0de832a:	78b0      	ldrb	r0, [r6, #2]
c0de832c:	7971      	ldrb	r1, [r6, #5]
c0de832e:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de8332:	f88d 103e 	strb.w	r1, [sp, #62]	@ 0x3e
c0de8336:	e015      	b.n	c0de8364 <nbgl_pageDrawGenericContentExt+0x15c>
c0de8338:	f04f 0800 	mov.w	r8, #0
c0de833c:	e017      	b.n	c0de836e <nbgl_pageDrawGenericContentExt+0x166>
c0de833e:	f88d 0039 	strb.w	r0, [sp, #57]	@ 0x39
c0de8342:	2000      	movs	r0, #0
c0de8344:	2104      	movs	r1, #4
c0de8346:	7c32      	ldrb	r2, [r6, #16]
c0de8348:	f000 f99a 	bl	c0de8680 <OUTLINED_FUNCTION_3>
c0de834c:	7971      	ldrb	r1, [r6, #5]
c0de834e:	f88d 203b 	strb.w	r2, [sp, #59]	@ 0x3b
c0de8352:	f88d 303c 	strb.w	r3, [sp, #60]	@ 0x3c
c0de8356:	f88d 003a 	strb.w	r0, [sp, #58]	@ 0x3a
c0de835a:	7cf0      	ldrb	r0, [r6, #19]
c0de835c:	f88d 1040 	strb.w	r1, [sp, #64]	@ 0x40
c0de8360:	f88d 0038 	strb.w	r0, [sp, #56]	@ 0x38
c0de8364:	a90d      	add	r1, sp, #52	@ 0x34
c0de8366:	4650      	mov	r0, sl
c0de8368:	f7fc fe6c 	bl	c0de5044 <nbgl_layoutAddExtendedFooter>
c0de836c:	1a3f      	subs	r7, r7, r0
c0de836e:	6828      	ldr	r0, [r5, #0]
c0de8370:	b190      	cbz	r0, c0de8398 <nbgl_pageDrawGenericContentExt+0x190>
c0de8372:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de8374:	2000      	movs	r0, #0
c0de8376:	79a9      	ldrb	r1, [r5, #6]
c0de8378:	900e      	str	r0, [sp, #56]	@ 0x38
c0de837a:	f240 1001 	movw	r0, #257	@ 0x101
c0de837e:	f8ad 0034 	strh.w	r0, [sp, #52]	@ 0x34
c0de8382:	7968      	ldrb	r0, [r5, #5]
c0de8384:	f88d 1041 	strb.w	r1, [sp, #65]	@ 0x41
c0de8388:	f88d 0040 	strb.w	r0, [sp, #64]	@ 0x40
c0de838c:	a90d      	add	r1, sp, #52	@ 0x34
c0de838e:	4650      	mov	r0, sl
c0de8390:	f7fe fdaa 	bl	c0de6ee8 <nbgl_layoutAddHeader>
c0de8394:	f04f 0801 	mov.w	r8, #1
c0de8398:	68a9      	ldr	r1, [r5, #8]
c0de839a:	b121      	cbz	r1, c0de83a6 <nbgl_pageDrawGenericContentExt+0x19e>
c0de839c:	79ab      	ldrb	r3, [r5, #6]
c0de839e:	79ea      	ldrb	r2, [r5, #7]
c0de83a0:	4650      	mov	r0, sl
c0de83a2:	f7fc fe11 	bl	c0de4fc8 <nbgl_layoutAddTopRightButton>
c0de83a6:	7b28      	ldrb	r0, [r5, #12]
c0de83a8:	2800      	cmp	r0, #0
c0de83aa:	d044      	beq.n	c0de8436 <nbgl_pageDrawGenericContentExt+0x22e>
c0de83ac:	2801      	cmp	r0, #1
c0de83ae:	d04d      	beq.n	c0de844c <nbgl_pageDrawGenericContentExt+0x244>
c0de83b0:	2802      	cmp	r0, #2
c0de83b2:	d067      	beq.n	c0de8484 <nbgl_pageDrawGenericContentExt+0x27c>
c0de83b4:	2803      	cmp	r0, #3
c0de83b6:	d074      	beq.n	c0de84a2 <nbgl_pageDrawGenericContentExt+0x29a>
c0de83b8:	2804      	cmp	r0, #4
c0de83ba:	f000 808e 	beq.w	c0de84da <nbgl_pageDrawGenericContentExt+0x2d2>
c0de83be:	2805      	cmp	r0, #5
c0de83c0:	f000 8093 	beq.w	c0de84ea <nbgl_pageDrawGenericContentExt+0x2e2>
c0de83c4:	2806      	cmp	r0, #6
c0de83c6:	f000 80a9 	beq.w	c0de851c <nbgl_pageDrawGenericContentExt+0x314>
c0de83ca:	2807      	cmp	r0, #7
c0de83cc:	f000 80d9 	beq.w	c0de8582 <nbgl_pageDrawGenericContentExt+0x37a>
c0de83d0:	2808      	cmp	r0, #8
c0de83d2:	f000 80ea 	beq.w	c0de85aa <nbgl_pageDrawGenericContentExt+0x3a2>
c0de83d6:	2809      	cmp	r0, #9
c0de83d8:	f000 8112 	beq.w	c0de8600 <nbgl_pageDrawGenericContentExt+0x3f8>
c0de83dc:	280a      	cmp	r0, #10
c0de83de:	f040 8114 	bne.w	c0de860a <nbgl_pageDrawGenericContentExt+0x402>
c0de83e2:	489a      	ldr	r0, [pc, #616]	@ (c0de864c <nbgl_pageDrawGenericContentExt+0x444>)
c0de83e4:	2400      	movs	r4, #0
c0de83e6:	f10d 0834 	add.w	r8, sp, #52	@ 0x34
c0de83ea:	2600      	movs	r6, #0
c0de83ec:	4478      	add	r0, pc
c0de83ee:	4683      	mov	fp, r0
c0de83f0:	7e28      	ldrb	r0, [r5, #24]
c0de83f2:	4286      	cmp	r6, r0
c0de83f4:	f080 8109 	bcs.w	c0de860a <nbgl_pageDrawGenericContentExt+0x402>
c0de83f8:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de83fc:	f850 0026 	ldr.w	r0, [r0, r6, lsl #2]
c0de8400:	e9cd b40f 	strd	fp, r4, [sp, #60]	@ 0x3c
c0de8404:	e9cd 400d 	strd	r4, r0, [sp, #52]	@ 0x34
c0de8408:	5d88      	ldrb	r0, [r1, r6]
c0de840a:	4641      	mov	r1, r8
c0de840c:	f88d 4046 	strb.w	r4, [sp, #70]	@ 0x46
c0de8410:	f88d 4044 	strb.w	r4, [sp, #68]	@ 0x44
c0de8414:	f88d 0045 	strb.w	r0, [sp, #69]	@ 0x45
c0de8418:	7e68      	ldrb	r0, [r5, #25]
c0de841a:	f88d 0048 	strb.w	r0, [sp, #72]	@ 0x48
c0de841e:	4650      	mov	r0, sl
c0de8420:	f7fd f9bd 	bl	c0de579e <nbgl_layoutAddTouchableBar>
c0de8424:	1a3f      	subs	r7, r7, r0
c0de8426:	b2b8      	uxth	r0, r7
c0de8428:	280b      	cmp	r0, #11
c0de842a:	d302      	bcc.n	c0de8432 <nbgl_pageDrawGenericContentExt+0x22a>
c0de842c:	4650      	mov	r0, sl
c0de842e:	f7fe fc29 	bl	c0de6c84 <nbgl_layoutAddSeparationLine>
c0de8432:	3601      	adds	r6, #1
c0de8434:	e7dc      	b.n	c0de83f0 <nbgl_pageDrawGenericContentExt+0x1e8>
c0de8436:	f1b8 0f00 	cmp.w	r8, #0
c0de843a:	d101      	bne.n	c0de8440 <nbgl_pageDrawGenericContentExt+0x238>
c0de843c:	f000 f90d 	bl	c0de865a <OUTLINED_FUNCTION_0>
c0de8440:	f105 0110 	add.w	r1, r5, #16
c0de8444:	4650      	mov	r0, sl
c0de8446:	f7fd fe7a 	bl	c0de613e <nbgl_layoutAddCenteredInfo>
c0de844a:	e0de      	b.n	c0de860a <nbgl_pageDrawGenericContentExt+0x402>
c0de844c:	f1b8 0f00 	cmp.w	r8, #0
c0de8450:	d101      	bne.n	c0de8456 <nbgl_pageDrawGenericContentExt+0x24e>
c0de8452:	f000 f902 	bl	c0de865a <OUTLINED_FUNCTION_0>
c0de8456:	f105 0110 	add.w	r1, r5, #16
c0de845a:	4650      	mov	r0, sl
c0de845c:	f7fe f8ca 	bl	c0de65f4 <nbgl_layoutAddContentCenter>
c0de8460:	6b68      	ldr	r0, [r5, #52]	@ 0x34
c0de8462:	2800      	cmp	r0, #0
c0de8464:	f000 80d1 	beq.w	c0de860a <nbgl_pageDrawGenericContentExt+0x402>
c0de8468:	900e      	str	r0, [sp, #56]	@ 0x38
c0de846a:	2003      	movs	r0, #3
c0de846c:	f88d 0034 	strb.w	r0, [sp, #52]	@ 0x34
c0de8470:	6ba8      	ldr	r0, [r5, #56]	@ 0x38
c0de8472:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de8474:	8fa8      	ldrh	r0, [r5, #60]	@ 0x3c
c0de8476:	f8ad 0040 	strh.w	r0, [sp, #64]	@ 0x40
c0de847a:	a90d      	add	r1, sp, #52	@ 0x34
c0de847c:	4650      	mov	r0, sl
c0de847e:	f7fc fa4d 	bl	c0de491c <nbgl_layoutAddUpFooter>
c0de8482:	e0c2      	b.n	c0de860a <nbgl_pageDrawGenericContentExt+0x402>
c0de8484:	ae0d      	add	r6, sp, #52	@ 0x34
c0de8486:	2124      	movs	r1, #36	@ 0x24
c0de8488:	f000 f901 	bl	c0de868e <OUTLINED_FUNCTION_4>
c0de848c:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de8490:	f000 f8f0 	bl	c0de8674 <OUTLINED_FUNCTION_2>
c0de8494:	69a9      	ldr	r1, [r5, #24]
c0de8496:	7f6b      	ldrb	r3, [r5, #29]
c0de8498:	7f2a      	ldrb	r2, [r5, #28]
c0de849a:	4650      	mov	r0, sl
c0de849c:	f7fe fceb 	bl	c0de6e76 <nbgl_layoutAddLongPressButton>
c0de84a0:	e0b3      	b.n	c0de860a <nbgl_pageDrawGenericContentExt+0x402>
c0de84a2:	ae0d      	add	r6, sp, #52	@ 0x34
c0de84a4:	2124      	movs	r1, #36	@ 0x24
c0de84a6:	f000 f8f2 	bl	c0de868e <OUTLINED_FUNCTION_4>
c0de84aa:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de84ae:	2400      	movs	r4, #0
c0de84b0:	f88d 4034 	strb.w	r4, [sp, #52]	@ 0x34
c0de84b4:	f000 f8de 	bl	c0de8674 <OUTLINED_FUNCTION_2>
c0de84b8:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0de84bc:	940a      	str	r4, [sp, #40]	@ 0x28
c0de84be:	f88d 402d 	strb.w	r4, [sp, #45]	@ 0x2d
c0de84c2:	f8ad 002e 	strh.w	r0, [sp, #46]	@ 0x2e
c0de84c6:	69a8      	ldr	r0, [r5, #24]
c0de84c8:	9009      	str	r0, [sp, #36]	@ 0x24
c0de84ca:	7f28      	ldrb	r0, [r5, #28]
c0de84cc:	f88d 002c 	strb.w	r0, [sp, #44]	@ 0x2c
c0de84d0:	7f68      	ldrb	r0, [r5, #29]
c0de84d2:	f88d 0030 	strb.w	r0, [sp, #48]	@ 0x30
c0de84d6:	a909      	add	r1, sp, #36	@ 0x24
c0de84d8:	e04f      	b.n	c0de857a <nbgl_pageDrawGenericContentExt+0x372>
c0de84da:	f1b8 0f00 	cmp.w	r8, #0
c0de84de:	d101      	bne.n	c0de84e4 <nbgl_pageDrawGenericContentExt+0x2dc>
c0de84e0:	f000 f8bb 	bl	c0de865a <OUTLINED_FUNCTION_0>
c0de84e4:	f000 f8dd 	bl	c0de86a2 <OUTLINED_FUNCTION_6>
c0de84e8:	e08f      	b.n	c0de860a <nbgl_pageDrawGenericContentExt+0x402>
c0de84ea:	f1b8 0f00 	cmp.w	r8, #0
c0de84ee:	d101      	bne.n	c0de84f4 <nbgl_pageDrawGenericContentExt+0x2ec>
c0de84f0:	f000 f8b3 	bl	c0de865a <OUTLINED_FUNCTION_0>
c0de84f4:	7ee8      	ldrb	r0, [r5, #27]
c0de84f6:	f105 0110 	add.w	r1, r5, #16
c0de84fa:	3803      	subs	r0, #3
c0de84fc:	76e8      	strb	r0, [r5, #27]
c0de84fe:	4650      	mov	r0, sl
c0de8500:	f7fe fa10 	bl	c0de6924 <nbgl_layoutAddTagValueList>
c0de8504:	2001      	movs	r0, #1
c0de8506:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de850a:	f8ad 003e 	strh.w	r0, [sp, #62]	@ 0x3e
c0de850e:	e9d5 0109 	ldrd	r0, r1, [r5, #36]	@ 0x24
c0de8512:	e9cd 100d 	strd	r1, r0, [sp, #52]	@ 0x34
c0de8516:	f000 f8bd 	bl	c0de8694 <OUTLINED_FUNCTION_5>
c0de851a:	e02b      	b.n	c0de8574 <nbgl_pageDrawGenericContentExt+0x36c>
c0de851c:	f1b8 0f00 	cmp.w	r8, #0
c0de8520:	d101      	bne.n	c0de8526 <nbgl_pageDrawGenericContentExt+0x31e>
c0de8522:	f000 f89a 	bl	c0de865a <OUTLINED_FUNCTION_0>
c0de8526:	f000 f8bc 	bl	c0de86a2 <OUTLINED_FUNCTION_6>
c0de852a:	6aa8      	ldr	r0, [r5, #40]	@ 0x28
c0de852c:	2800      	cmp	r0, #0
c0de852e:	d073      	beq.n	c0de8618 <nbgl_pageDrawGenericContentExt+0x410>
c0de8530:	900d      	str	r0, [sp, #52]	@ 0x34
c0de8532:	6a68      	ldr	r0, [r5, #36]	@ 0x24
c0de8534:	2101      	movs	r1, #1
c0de8536:	f8ad 103e 	strh.w	r1, [sp, #62]	@ 0x3e
c0de853a:	f88d 103d 	strb.w	r1, [sp, #61]	@ 0x3d
c0de853e:	900e      	str	r0, [sp, #56]	@ 0x38
c0de8540:	f000 f8a8 	bl	c0de8694 <OUTLINED_FUNCTION_5>
c0de8544:	f88d 0040 	strb.w	r0, [sp, #64]	@ 0x40
c0de8548:	a90d      	add	r1, sp, #52	@ 0x34
c0de854a:	4650      	mov	r0, sl
c0de854c:	f7fe fbb7 	bl	c0de6cbe <nbgl_layoutAddButton>
c0de8550:	6b28      	ldr	r0, [r5, #48]	@ 0x30
c0de8552:	2800      	cmp	r0, #0
c0de8554:	d059      	beq.n	c0de860a <nbgl_pageDrawGenericContentExt+0x402>
c0de8556:	2100      	movs	r1, #0
c0de8558:	900d      	str	r0, [sp, #52]	@ 0x34
c0de855a:	f895 002d 	ldrb.w	r0, [r5, #45]	@ 0x2d
c0de855e:	f88d 103d 	strb.w	r1, [sp, #61]	@ 0x3d
c0de8562:	910e      	str	r1, [sp, #56]	@ 0x38
c0de8564:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de8568:	f8ad 103e 	strh.w	r1, [sp, #62]	@ 0x3e
c0de856c:	f895 1038 	ldrb.w	r1, [r5, #56]	@ 0x38
c0de8570:	f88d 103c 	strb.w	r1, [sp, #60]	@ 0x3c
c0de8574:	f88d 0040 	strb.w	r0, [sp, #64]	@ 0x40
c0de8578:	a90d      	add	r1, sp, #52	@ 0x34
c0de857a:	4650      	mov	r0, sl
c0de857c:	f7fe fb9f 	bl	c0de6cbe <nbgl_layoutAddButton>
c0de8580:	e043      	b.n	c0de860a <nbgl_pageDrawGenericContentExt+0x402>
c0de8582:	2400      	movs	r4, #0
c0de8584:	2600      	movs	r6, #0
c0de8586:	7d28      	ldrb	r0, [r5, #20]
c0de8588:	4286      	cmp	r6, r0
c0de858a:	d23e      	bcs.n	c0de860a <nbgl_pageDrawGenericContentExt+0x402>
c0de858c:	6928      	ldr	r0, [r5, #16]
c0de858e:	1901      	adds	r1, r0, r4
c0de8590:	4650      	mov	r0, sl
c0de8592:	f7fd fb8b 	bl	c0de5cac <nbgl_layoutAddSwitch>
c0de8596:	1a3f      	subs	r7, r7, r0
c0de8598:	b2b8      	uxth	r0, r7
c0de859a:	280b      	cmp	r0, #11
c0de859c:	d302      	bcc.n	c0de85a4 <nbgl_pageDrawGenericContentExt+0x39c>
c0de859e:	4650      	mov	r0, sl
c0de85a0:	f7fe fb70 	bl	c0de6c84 <nbgl_layoutAddSeparationLine>
c0de85a4:	340c      	adds	r4, #12
c0de85a6:	3601      	adds	r6, #1
c0de85a8:	e7ed      	b.n	c0de8586 <nbgl_pageDrawGenericContentExt+0x37e>
c0de85aa:	2600      	movs	r6, #0
c0de85ac:	2400      	movs	r4, #0
c0de85ae:	7f28      	ldrb	r0, [r5, #28]
c0de85b0:	4284      	cmp	r4, r0
c0de85b2:	d22a      	bcs.n	c0de860a <nbgl_pageDrawGenericContentExt+0x402>
c0de85b4:	7fa8      	ldrb	r0, [r5, #30]
c0de85b6:	b180      	cbz	r0, c0de85da <nbgl_pageDrawGenericContentExt+0x3d2>
c0de85b8:	69a8      	ldr	r0, [r5, #24]
c0de85ba:	b170      	cbz	r0, c0de85da <nbgl_pageDrawGenericContentExt+0x3d2>
c0de85bc:	5980      	ldr	r0, [r0, r6]
c0de85be:	b160      	cbz	r0, c0de85da <nbgl_pageDrawGenericContentExt+0x3d2>
c0de85c0:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de85c4:	7f6b      	ldrb	r3, [r5, #29]
c0de85c6:	f851 2024 	ldr.w	r2, [r1, r4, lsl #2]
c0de85ca:	f850 1024 	ldr.w	r1, [r0, r4, lsl #2]
c0de85ce:	b2e0      	uxtb	r0, r4
c0de85d0:	9000      	str	r0, [sp, #0]
c0de85d2:	4650      	mov	r0, sl
c0de85d4:	f7fd fbb0 	bl	c0de5d38 <nbgl_layoutAddTextWithAlias>
c0de85d8:	e008      	b.n	c0de85ec <nbgl_pageDrawGenericContentExt+0x3e4>
c0de85da:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de85de:	f851 2024 	ldr.w	r2, [r1, r4, lsl #2]
c0de85e2:	f850 1024 	ldr.w	r1, [r0, r4, lsl #2]
c0de85e6:	4650      	mov	r0, sl
c0de85e8:	f7fd fb85 	bl	c0de5cf6 <nbgl_layoutAddText>
c0de85ec:	1a3f      	subs	r7, r7, r0
c0de85ee:	b2b8      	uxth	r0, r7
c0de85f0:	280b      	cmp	r0, #11
c0de85f2:	d302      	bcc.n	c0de85fa <nbgl_pageDrawGenericContentExt+0x3f2>
c0de85f4:	4650      	mov	r0, sl
c0de85f6:	f7fe fb45 	bl	c0de6c84 <nbgl_layoutAddSeparationLine>
c0de85fa:	3618      	adds	r6, #24
c0de85fc:	3401      	adds	r4, #1
c0de85fe:	e7d6      	b.n	c0de85ae <nbgl_pageDrawGenericContentExt+0x3a6>
c0de8600:	f105 0110 	add.w	r1, r5, #16
c0de8604:	4650      	mov	r0, sl
c0de8606:	f7fd fc77 	bl	c0de5ef8 <nbgl_layoutAddRadioChoice>
c0de860a:	4650      	mov	r0, sl
c0de860c:	f7fe ff89 	bl	c0de7522 <nbgl_layoutDraw>
c0de8610:	4650      	mov	r0, sl
c0de8612:	b016      	add	sp, #88	@ 0x58
c0de8614:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de8618:	6a68      	ldr	r0, [r5, #36]	@ 0x24
c0de861a:	2800      	cmp	r0, #0
c0de861c:	d098      	beq.n	c0de8550 <nbgl_pageDrawGenericContentExt+0x348>
c0de861e:	6b29      	ldr	r1, [r5, #48]	@ 0x30
c0de8620:	2900      	cmp	r1, #0
c0de8622:	d095      	beq.n	c0de8550 <nbgl_pageDrawGenericContentExt+0x348>
c0de8624:	e9cd 010d 	strd	r0, r1, [sp, #52]	@ 0x34
c0de8628:	f895 002c 	ldrb.w	r0, [r5, #44]	@ 0x2c
c0de862c:	f895 102d 	ldrb.w	r1, [r5, #45]	@ 0x2d
c0de8630:	f895 2038 	ldrb.w	r2, [r5, #56]	@ 0x38
c0de8634:	f88d 003c 	strb.w	r0, [sp, #60]	@ 0x3c
c0de8638:	f88d 203d 	strb.w	r2, [sp, #61]	@ 0x3d
c0de863c:	f88d 103e 	strb.w	r1, [sp, #62]	@ 0x3e
c0de8640:	a90d      	add	r1, sp, #52	@ 0x34
c0de8642:	4650      	mov	r0, sl
c0de8644:	f7fe f95a 	bl	c0de68fc <nbgl_layoutAddHorizontalButtons>
c0de8648:	e7df      	b.n	c0de860a <nbgl_pageDrawGenericContentExt+0x402>
c0de864a:	bf00      	nop
c0de864c:	00004c2f 	.word	0x00004c2f

c0de8650 <nbgl_pageDrawGenericContent>:
c0de8650:	2300      	movs	r3, #0
c0de8652:	f7ff bdd9 	b.w	c0de8208 <nbgl_pageDrawGenericContentExt>

c0de8656 <nbgl_pageRelease>:
c0de8656:	f7fe bf83 	b.w	c0de7560 <nbgl_layoutRelease>

c0de865a <OUTLINED_FUNCTION_0>:
c0de865a:	4650      	mov	r0, sl
c0de865c:	2128      	movs	r1, #40	@ 0x28
c0de865e:	f7ff bd89 	b.w	c0de8174 <addEmptyHeader>

c0de8662 <OUTLINED_FUNCTION_1>:
c0de8662:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de8666:	788a      	ldrb	r2, [r1, #2]
c0de8668:	78c9      	ldrb	r1, [r1, #3]
c0de866a:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de866e:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de8672:	4770      	bx	lr

c0de8674 <OUTLINED_FUNCTION_2>:
c0de8674:	910e      	str	r1, [sp, #56]	@ 0x38
c0de8676:	9011      	str	r0, [sp, #68]	@ 0x44
c0de8678:	4650      	mov	r0, sl
c0de867a:	4631      	mov	r1, r6
c0de867c:	f7fd bfba 	b.w	c0de65f4 <nbgl_layoutAddContentCenter>

c0de8680 <OUTLINED_FUNCTION_3>:
c0de8680:	7c73      	ldrb	r3, [r6, #17]
c0de8682:	f88d 003e 	strb.w	r0, [sp, #62]	@ 0x3e
c0de8686:	7830      	ldrb	r0, [r6, #0]
c0de8688:	f88d 1034 	strb.w	r1, [sp, #52]	@ 0x34
c0de868c:	4770      	bx	lr

c0de868e <OUTLINED_FUNCTION_4>:
c0de868e:	4630      	mov	r0, r6
c0de8690:	f003 bdb0 	b.w	c0dec1f4 <__aeabi_memclr>

c0de8694 <OUTLINED_FUNCTION_5>:
c0de8694:	f895 002c 	ldrb.w	r0, [r5, #44]	@ 0x2c
c0de8698:	f88d 003c 	strb.w	r0, [sp, #60]	@ 0x3c
c0de869c:	f895 002d 	ldrb.w	r0, [r5, #45]	@ 0x2d
c0de86a0:	4770      	bx	lr

c0de86a2 <OUTLINED_FUNCTION_6>:
c0de86a2:	f105 0110 	add.w	r1, r5, #16
c0de86a6:	4650      	mov	r0, sl
c0de86a8:	f7fe b93c 	b.w	c0de6924 <nbgl_layoutAddTagValueList>

c0de86ac <getNbTagValuesInPage>:
c0de86ac:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de86b0:	4604      	mov	r4, r0
c0de86b2:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de86b4:	f04f 0800 	mov.w	r8, #0
c0de86b8:	2b00      	cmp	r3, #0
c0de86ba:	460e      	mov	r6, r1
c0de86bc:	f04f 0b00 	mov.w	fp, #0
c0de86c0:	f880 8000 	strb.w	r8, [r0]
c0de86c4:	f44f 70e8 	mov.w	r0, #464	@ 0x1d0
c0de86c8:	bf18      	it	ne
c0de86ca:	f44f 70cc 	movne.w	r0, #408	@ 0x198
c0de86ce:	0111      	lsls	r1, r2, #4
c0de86d0:	e9cd 2001 	strd	r2, r0, [sp, #4]
c0de86d4:	4544      	cmp	r4, r8
c0de86d6:	d052      	beq.n	c0de877e <getNbTagValuesInPage+0xd2>
c0de86d8:	465d      	mov	r5, fp
c0de86da:	f10b 0a18 	add.w	sl, fp, #24
c0de86de:	f1b8 0f00 	cmp.w	r8, #0
c0de86e2:	bf18      	it	ne
c0de86e4:	4655      	movne	r5, sl
c0de86e6:	6830      	ldr	r0, [r6, #0]
c0de86e8:	9103      	str	r1, [sp, #12]
c0de86ea:	b108      	cbz	r0, c0de86f0 <getNbTagValuesInPage+0x44>
c0de86ec:	4408      	add	r0, r1
c0de86ee:	e004      	b.n	c0de86fa <getNbTagValuesInPage+0x4e>
c0de86f0:	9801      	ldr	r0, [sp, #4]
c0de86f2:	6871      	ldr	r1, [r6, #4]
c0de86f4:	4440      	add	r0, r8
c0de86f6:	b2c0      	uxtb	r0, r0
c0de86f8:	4788      	blx	r1
c0de86fa:	f003 fb59 	bl	c0debdb0 <pic>
c0de86fe:	4607      	mov	r7, r0
c0de8700:	7b00      	ldrb	r0, [r0, #12]
c0de8702:	07c1      	lsls	r1, r0, #31
c0de8704:	bf18      	it	ne
c0de8706:	f1b8 0f00 	cmpne.w	r8, #0
c0de870a:	d13b      	bne.n	c0de8784 <getNbTagValuesInPage+0xd8>
c0de870c:	0780      	lsls	r0, r0, #30
c0de870e:	d45d      	bmi.n	c0de87cc <getNbTagValuesInPage+0x120>
c0de8710:	7bb3      	ldrb	r3, [r6, #14]
c0de8712:	6839      	ldr	r1, [r7, #0]
c0de8714:	200b      	movs	r0, #11
c0de8716:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de871a:	46a2      	mov	sl, r4
c0de871c:	f003 f980 	bl	c0deba20 <nbgl_getTextHeightInWidth>
c0de8720:	182c      	adds	r4, r5, r0
c0de8722:	7b70      	ldrb	r0, [r6, #13]
c0de8724:	250b      	movs	r5, #11
c0de8726:	7bb3      	ldrb	r3, [r6, #14]
c0de8728:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de872c:	2800      	cmp	r0, #0
c0de872e:	bf08      	it	eq
c0de8730:	250d      	moveq	r5, #13
c0de8732:	6879      	ldr	r1, [r7, #4]
c0de8734:	4628      	mov	r0, r5
c0de8736:	f003 f973 	bl	c0deba20 <nbgl_getTextHeightInWidth>
c0de873a:	4420      	add	r0, r4
c0de873c:	6879      	ldr	r1, [r7, #4]
c0de873e:	7bb3      	ldrb	r3, [r6, #14]
c0de8740:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de8744:	f100 0b04 	add.w	fp, r0, #4
c0de8748:	4628      	mov	r0, r5
c0de874a:	fa1f f48b 	uxth.w	r4, fp
c0de874e:	f003 f96c 	bl	c0deba2a <nbgl_getTextNbLinesInWidth>
c0de8752:	9902      	ldr	r1, [sp, #8]
c0de8754:	428c      	cmp	r4, r1
c0de8756:	bf38      	it	cc
c0de8758:	280a      	cmpcc	r0, #10
c0de875a:	d205      	bcs.n	c0de8768 <getNbTagValuesInPage+0xbc>
c0de875c:	9903      	ldr	r1, [sp, #12]
c0de875e:	f108 0801 	add.w	r8, r8, #1
c0de8762:	4654      	mov	r4, sl
c0de8764:	3110      	adds	r1, #16
c0de8766:	e7b5      	b.n	c0de86d4 <getNbTagValuesInPage+0x28>
c0de8768:	ea5f 6008 	movs.w	r0, r8, lsl #24
c0de876c:	d104      	bne.n	c0de8778 <getNbTagValuesInPage+0xcc>
c0de876e:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de8770:	f04f 0801 	mov.w	r8, #1
c0de8774:	f880 8000 	strb.w	r8, [r0]
c0de8778:	4654      	mov	r4, sl
c0de877a:	46da      	mov	sl, fp
c0de877c:	e003      	b.n	c0de8786 <getNbTagValuesInPage+0xda>
c0de877e:	46da      	mov	sl, fp
c0de8780:	46a0      	mov	r8, r4
c0de8782:	e000      	b.n	c0de8786 <getNbTagValuesInPage+0xda>
c0de8784:	46aa      	mov	sl, r5
c0de8786:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de8788:	b170      	cbz	r0, c0de87a8 <getNbTagValuesInPage+0xfc>
c0de878a:	fa5f f088 	uxtb.w	r0, r8
c0de878e:	42a0      	cmp	r0, r4
c0de8790:	d10a      	bne.n	c0de87a8 <getNbTagValuesInPage+0xfc>
c0de8792:	9902      	ldr	r1, [sp, #8]
c0de8794:	fa1f f08a 	uxth.w	r0, sl
c0de8798:	f501 71bc 	add.w	r1, r1, #376	@ 0x178
c0de879c:	f401 71ac 	and.w	r1, r1, #344	@ 0x158
c0de87a0:	4281      	cmp	r1, r0
c0de87a2:	bf38      	it	cc
c0de87a4:	3c01      	subcc	r4, #1
c0de87a6:	e00d      	b.n	c0de87c4 <getNbTagValuesInPage+0x118>
c0de87a8:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de87aa:	b150      	cbz	r0, c0de87c2 <getNbTagValuesInPage+0x116>
c0de87ac:	9902      	ldr	r1, [sp, #8]
c0de87ae:	fa1f f08a 	uxth.w	r0, sl
c0de87b2:	f501 71e0 	add.w	r1, r1, #448	@ 0x1c0
c0de87b6:	f401 71ec 	and.w	r1, r1, #472	@ 0x1d8
c0de87ba:	4281      	cmp	r1, r0
c0de87bc:	bf38      	it	cc
c0de87be:	f1a8 0801 	subcc.w	r8, r8, #1
c0de87c2:	4644      	mov	r4, r8
c0de87c4:	b2e0      	uxtb	r0, r4
c0de87c6:	b004      	add	sp, #16
c0de87c8:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de87cc:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de87ce:	f1b8 0f00 	cmp.w	r8, #0
c0de87d2:	d1d9      	bne.n	c0de8788 <getNbTagValuesInPage+0xdc>
c0de87d4:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de87d6:	f04f 0801 	mov.w	r8, #1
c0de87da:	46da      	mov	sl, fp
c0de87dc:	f881 8000 	strb.w	r8, [r1]
c0de87e0:	e7d2      	b.n	c0de8788 <getNbTagValuesInPage+0xdc>

c0de87e2 <nbgl_useCaseGetNbInfosInPage>:
c0de87e2:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de87e6:	f002 fc25 	bl	c0deb034 <OUTLINED_FUNCTION_11>
c0de87ea:	bf18      	it	ne
c0de87ec:	f44f 7bcc 	movne.w	fp, #408	@ 0x198
c0de87f0:	6848      	ldr	r0, [r1, #4]
c0de87f2:	f003 fadd 	bl	c0debdb0 <pic>
c0de87f6:	eb00 0486 	add.w	r4, r0, r6, lsl #2
c0de87fa:	2600      	movs	r6, #0
c0de87fc:	2500      	movs	r5, #0
c0de87fe:	2700      	movs	r7, #0
c0de8800:	45b2      	cmp	sl, r6
c0de8802:	d011      	beq.n	c0de8828 <nbgl_useCaseGetNbInfosInPage+0x46>
c0de8804:	f854 0026 	ldr.w	r0, [r4, r6, lsl #2]
c0de8808:	f003 fad2 	bl	c0debdb0 <pic>
c0de880c:	4601      	mov	r1, r0
c0de880e:	200b      	movs	r0, #11
c0de8810:	f002 fbe6 	bl	c0deafe0 <OUTLINED_FUNCTION_1>
c0de8814:	f107 0168 	add.w	r1, r7, #104	@ 0x68
c0de8818:	b289      	uxth	r1, r1
c0de881a:	180f      	adds	r7, r1, r0
c0de881c:	b2b8      	uxth	r0, r7
c0de881e:	4558      	cmp	r0, fp
c0de8820:	d204      	bcs.n	c0de882c <nbgl_useCaseGetNbInfosInPage+0x4a>
c0de8822:	3601      	adds	r6, #1
c0de8824:	4605      	mov	r5, r0
c0de8826:	e7eb      	b.n	c0de8800 <nbgl_useCaseGetNbInfosInPage+0x1e>
c0de8828:	4656      	mov	r6, sl
c0de882a:	e006      	b.n	c0de883a <nbgl_useCaseGetNbInfosInPage+0x58>
c0de882c:	f1b8 0f00 	cmp.w	r8, #0
c0de8830:	d103      	bne.n	c0de883a <nbgl_useCaseGetNbInfosInPage+0x58>
c0de8832:	08e8      	lsrs	r0, r5, #3
c0de8834:	2832      	cmp	r0, #50	@ 0x32
c0de8836:	bf88      	it	hi
c0de8838:	3e01      	subhi	r6, #1
c0de883a:	b2f0      	uxtb	r0, r6
c0de883c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de8840 <nbgl_useCaseGetNbSwitchesInPage>:
c0de8840:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8844:	f002 fbf6 	bl	c0deb034 <OUTLINED_FUNCTION_11>
c0de8848:	bf18      	it	ne
c0de884a:	f44f 7bcc 	movne.w	fp, #408	@ 0x198
c0de884e:	6808      	ldr	r0, [r1, #0]
c0de8850:	f003 faae 	bl	c0debdb0 <pic>
c0de8854:	eb06 0146 	add.w	r1, r6, r6, lsl #1
c0de8858:	2600      	movs	r6, #0
c0de885a:	2500      	movs	r5, #0
c0de885c:	eb00 0081 	add.w	r0, r0, r1, lsl #2
c0de8860:	1d04      	adds	r4, r0, #4
c0de8862:	462f      	mov	r7, r5
c0de8864:	45b2      	cmp	sl, r6
c0de8866:	d01f      	beq.n	c0de88a8 <nbgl_useCaseGetNbSwitchesInPage+0x68>
c0de8868:	f854 1c04 	ldr.w	r1, [r4, #-4]
c0de886c:	200c      	movs	r0, #12
c0de886e:	f002 fbb7 	bl	c0deafe0 <OUTLINED_FUNCTION_1>
c0de8872:	2828      	cmp	r0, #40	@ 0x28
c0de8874:	d201      	bcs.n	c0de887a <nbgl_useCaseGetNbSwitchesInPage+0x3a>
c0de8876:	2028      	movs	r0, #40	@ 0x28
c0de8878:	e004      	b.n	c0de8884 <nbgl_useCaseGetNbSwitchesInPage+0x44>
c0de887a:	f854 1c04 	ldr.w	r1, [r4, #-4]
c0de887e:	200c      	movs	r0, #12
c0de8880:	f002 fbae 	bl	c0deafe0 <OUTLINED_FUNCTION_1>
c0de8884:	6821      	ldr	r1, [r4, #0]
c0de8886:	4438      	add	r0, r7
c0de8888:	f100 0534 	add.w	r5, r0, #52	@ 0x34
c0de888c:	b129      	cbz	r1, c0de889a <nbgl_useCaseGetNbSwitchesInPage+0x5a>
c0de888e:	200b      	movs	r0, #11
c0de8890:	f002 fba6 	bl	c0deafe0 <OUTLINED_FUNCTION_1>
c0de8894:	4428      	add	r0, r5
c0de8896:	f100 050c 	add.w	r5, r0, #12
c0de889a:	340c      	adds	r4, #12
c0de889c:	3601      	adds	r6, #1
c0de889e:	b2a8      	uxth	r0, r5
c0de88a0:	4583      	cmp	fp, r0
c0de88a2:	d8de      	bhi.n	c0de8862 <nbgl_useCaseGetNbSwitchesInPage+0x22>
c0de88a4:	f1a6 0a01 	sub.w	sl, r6, #1
c0de88a8:	b2b8      	uxth	r0, r7
c0de88aa:	2100      	movs	r1, #0
c0de88ac:	08c0      	lsrs	r0, r0, #3
c0de88ae:	2832      	cmp	r0, #50	@ 0x32
c0de88b0:	bf88      	it	hi
c0de88b2:	2101      	movhi	r1, #1
c0de88b4:	ea21 0008 	bic.w	r0, r1, r8
c0de88b8:	ebaa 0000 	sub.w	r0, sl, r0
c0de88bc:	b2c0      	uxtb	r0, r0
c0de88be:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de88c2 <nbgl_useCaseGetNbBarsInPage>:
c0de88c2:	b570      	push	{r4, r5, r6, lr}
c0de88c4:	f44f 71fc 	mov.w	r1, #504	@ 0x1f8
c0de88c8:	2b00      	cmp	r3, #0
c0de88ca:	bf18      	it	ne
c0de88cc:	f44f 71cc 	movne.w	r1, #408	@ 0x198
c0de88d0:	2200      	movs	r2, #0
c0de88d2:	2400      	movs	r4, #0
c0de88d4:	2500      	movs	r5, #0
c0de88d6:	b2ee      	uxtb	r6, r5
c0de88d8:	4286      	cmp	r6, r0
c0de88da:	d208      	bcs.n	c0de88ee <nbgl_useCaseGetNbBarsInPage+0x2c>
c0de88dc:	b292      	uxth	r2, r2
c0de88de:	325c      	adds	r2, #92	@ 0x5c
c0de88e0:	b296      	uxth	r6, r2
c0de88e2:	428e      	cmp	r6, r1
c0de88e4:	d202      	bcs.n	c0de88ec <nbgl_useCaseGetNbBarsInPage+0x2a>
c0de88e6:	3501      	adds	r5, #1
c0de88e8:	4634      	mov	r4, r6
c0de88ea:	e7f4      	b.n	c0de88d6 <nbgl_useCaseGetNbBarsInPage+0x14>
c0de88ec:	4628      	mov	r0, r5
c0de88ee:	08e1      	lsrs	r1, r4, #3
c0de88f0:	2200      	movs	r2, #0
c0de88f2:	2932      	cmp	r1, #50	@ 0x32
c0de88f4:	bf88      	it	hi
c0de88f6:	2201      	movhi	r2, #1
c0de88f8:	ea22 0103 	bic.w	r1, r2, r3
c0de88fc:	1a40      	subs	r0, r0, r1
c0de88fe:	b2c0      	uxtb	r0, r0
c0de8900:	bd70      	pop	{r4, r5, r6, pc}

c0de8902 <nbgl_useCaseGetNbChoicesInPage>:
c0de8902:	b570      	push	{r4, r5, r6, lr}
c0de8904:	f44f 72fc 	mov.w	r2, #504	@ 0x1f8
c0de8908:	2b00      	cmp	r3, #0
c0de890a:	bf18      	it	ne
c0de890c:	f44f 72cc 	movne.w	r2, #408	@ 0x198
c0de8910:	2400      	movs	r4, #0
c0de8912:	2500      	movs	r5, #0
c0de8914:	2100      	movs	r1, #0
c0de8916:	b2ce      	uxtb	r6, r1
c0de8918:	4286      	cmp	r6, r0
c0de891a:	d207      	bcs.n	c0de892c <nbgl_useCaseGetNbChoicesInPage+0x2a>
c0de891c:	b2a4      	uxth	r4, r4
c0de891e:	345c      	adds	r4, #92	@ 0x5c
c0de8920:	b2a6      	uxth	r6, r4
c0de8922:	4296      	cmp	r6, r2
c0de8924:	d204      	bcs.n	c0de8930 <nbgl_useCaseGetNbChoicesInPage+0x2e>
c0de8926:	3101      	adds	r1, #1
c0de8928:	4635      	mov	r5, r6
c0de892a:	e7f4      	b.n	c0de8916 <nbgl_useCaseGetNbChoicesInPage+0x14>
c0de892c:	4601      	mov	r1, r0
c0de892e:	e004      	b.n	c0de893a <nbgl_useCaseGetNbChoicesInPage+0x38>
c0de8930:	b91b      	cbnz	r3, c0de893a <nbgl_useCaseGetNbChoicesInPage+0x38>
c0de8932:	08e8      	lsrs	r0, r5, #3
c0de8934:	2832      	cmp	r0, #50	@ 0x32
c0de8936:	bf88      	it	hi
c0de8938:	3901      	subhi	r1, #1
c0de893a:	b2c8      	uxtb	r0, r1
c0de893c:	bd70      	pop	{r4, r5, r6, pc}
	...

c0de8940 <useCaseHomeExt>:
c0de8940:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de8944:	b08f      	sub	sp, #60	@ 0x3c
c0de8946:	4604      	mov	r4, r0
c0de8948:	a802      	add	r0, sp, #8
c0de894a:	460f      	mov	r7, r1
c0de894c:	2130      	movs	r1, #48	@ 0x30
c0de894e:	461e      	mov	r6, r3
c0de8950:	4615      	mov	r5, r2
c0de8952:	3004      	adds	r0, #4
c0de8954:	f003 fc4e 	bl	c0dec1f4 <__aeabi_memclr>
c0de8958:	2009      	movs	r0, #9
c0de895a:	f88d 0039 	strb.w	r0, [sp, #57]	@ 0x39
c0de895e:	2006      	movs	r0, #6
c0de8960:	f88d 001e 	strb.w	r0, [sp, #30]
c0de8964:	2004      	movs	r0, #4
c0de8966:	f88d 001d 	strb.w	r0, [sp, #29]
c0de896a:	2003      	movs	r0, #3
c0de896c:	2e00      	cmp	r6, #0
c0de896e:	bf18      	it	ne
c0de8970:	2001      	movne	r0, #1
c0de8972:	f88d 001c 	strb.w	r0, [sp, #28]
c0de8976:	9705      	str	r7, [sp, #20]
c0de8978:	9402      	str	r4, [sp, #8]
c0de897a:	f000 f87b 	bl	c0de8a74 <reset_callbacks_and_context>
c0de897e:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de8980:	e9d0 1200 	ldrd	r1, r2, [r0]
c0de8984:	b951      	cbnz	r1, c0de899c <useCaseHomeExt+0x5c>
c0de8986:	b94a      	cbnz	r2, c0de899c <useCaseHomeExt+0x5c>
c0de8988:	4831      	ldr	r0, [pc, #196]	@ (c0de8a50 <useCaseHomeExt+0x110>)
c0de898a:	2100      	movs	r1, #0
c0de898c:	e9cd 110c 	strd	r1, r1, [sp, #48]	@ 0x30
c0de8990:	4448      	add	r0, r9
c0de8992:	6241      	str	r1, [r0, #36]	@ 0x24
c0de8994:	2002      	movs	r0, #2
c0de8996:	f88d 001f 	strb.w	r0, [sp, #31]
c0de899a:	e00e      	b.n	c0de89ba <useCaseHomeExt+0x7a>
c0de899c:	4b2c      	ldr	r3, [pc, #176]	@ (c0de8a50 <useCaseHomeExt+0x110>)
c0de899e:	6886      	ldr	r6, [r0, #8]
c0de89a0:	e9cd 120c 	strd	r1, r2, [sp, #48]	@ 0x30
c0de89a4:	444b      	add	r3, r9
c0de89a6:	625e      	str	r6, [r3, #36]	@ 0x24
c0de89a8:	2308      	movs	r3, #8
c0de89aa:	7b00      	ldrb	r0, [r0, #12]
c0de89ac:	f88d 301f 	strb.w	r3, [sp, #31]
c0de89b0:	2800      	cmp	r0, #0
c0de89b2:	bf18      	it	ne
c0de89b4:	2001      	movne	r0, #1
c0de89b6:	f88d 0038 	strb.w	r0, [sp, #56]	@ 0x38
c0de89ba:	e9dd a817 	ldrd	sl, r8, [sp, #92]	@ 0x5c
c0de89be:	bb8d      	cbnz	r5, c0de8a24 <useCaseHomeExt+0xe4>
c0de89c0:	4620      	mov	r0, r4
c0de89c2:	f003 fc73 	bl	c0dec2ac <strlen>
c0de89c6:	4e24      	ldr	r6, [pc, #144]	@ (c0de8a58 <useCaseHomeExt+0x118>)
c0de89c8:	2814      	cmp	r0, #20
c0de89ca:	447e      	add	r6, pc
c0de89cc:	d307      	bcc.n	c0de89de <useCaseHomeExt+0x9e>
c0de89ce:	4821      	ldr	r0, [pc, #132]	@ (c0de8a54 <useCaseHomeExt+0x114>)
c0de89d0:	4922      	ldr	r1, [pc, #136]	@ (c0de8a5c <useCaseHomeExt+0x11c>)
c0de89d2:	2236      	movs	r2, #54	@ 0x36
c0de89d4:	4448      	add	r0, r9
c0de89d6:	4479      	add	r1, pc
c0de89d8:	f003 fc02 	bl	c0dec1e0 <__aeabi_memcpy>
c0de89dc:	e00a      	b.n	c0de89f4 <useCaseHomeExt+0xb4>
c0de89de:	e9cd 4600 	strd	r4, r6, [sp]
c0de89e2:	481c      	ldr	r0, [pc, #112]	@ (c0de8a54 <useCaseHomeExt+0x114>)
c0de89e4:	214a      	movs	r1, #74	@ 0x4a
c0de89e6:	4a1e      	ldr	r2, [pc, #120]	@ (c0de8a60 <useCaseHomeExt+0x120>)
c0de89e8:	4b1e      	ldr	r3, [pc, #120]	@ (c0de8a64 <useCaseHomeExt+0x124>)
c0de89ea:	4448      	add	r0, r9
c0de89ec:	447a      	add	r2, pc
c0de89ee:	447b      	add	r3, pc
c0de89f0:	f003 f84c 	bl	c0deba8c <snprintf>
c0de89f4:	4f17      	ldr	r7, [pc, #92]	@ (c0de8a54 <useCaseHomeExt+0x114>)
c0de89f6:	200b      	movs	r0, #11
c0de89f8:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de89fc:	2300      	movs	r3, #0
c0de89fe:	eb09 0507 	add.w	r5, r9, r7
c0de8a02:	4629      	mov	r1, r5
c0de8a04:	f003 f811 	bl	c0deba2a <nbgl_getTextNbLinesInWidth>
c0de8a08:	2804      	cmp	r0, #4
c0de8a0a:	d30b      	bcc.n	c0de8a24 <useCaseHomeExt+0xe4>
c0de8a0c:	e9cd 4600 	strd	r4, r6, [sp]
c0de8a10:	eb09 0507 	add.w	r5, r9, r7
c0de8a14:	214a      	movs	r1, #74	@ 0x4a
c0de8a16:	4a14      	ldr	r2, [pc, #80]	@ (c0de8a68 <useCaseHomeExt+0x128>)
c0de8a18:	4b14      	ldr	r3, [pc, #80]	@ (c0de8a6c <useCaseHomeExt+0x12c>)
c0de8a1a:	4628      	mov	r0, r5
c0de8a1c:	447a      	add	r2, pc
c0de8a1e:	447b      	add	r3, pc
c0de8a20:	f003 f834 	bl	c0deba8c <snprintf>
c0de8a24:	480a      	ldr	r0, [pc, #40]	@ (c0de8a50 <useCaseHomeExt+0x110>)
c0de8a26:	9503      	str	r5, [sp, #12]
c0de8a28:	2100      	movs	r1, #0
c0de8a2a:	eb09 0400 	add.w	r4, r9, r0
c0de8a2e:	f8c4 a028 	str.w	sl, [r4, #40]	@ 0x28
c0de8a32:	f8c4 8004 	str.w	r8, [r4, #4]
c0de8a36:	480e      	ldr	r0, [pc, #56]	@ (c0de8a70 <useCaseHomeExt+0x130>)
c0de8a38:	aa02      	add	r2, sp, #8
c0de8a3a:	4478      	add	r0, pc
c0de8a3c:	f7ff faa0 	bl	c0de7f80 <nbgl_pageDrawInfo>
c0de8a40:	6160      	str	r0, [r4, #20]
c0de8a42:	2002      	movs	r0, #2
c0de8a44:	f002 ff9c 	bl	c0deb980 <nbgl_refreshSpecial>
c0de8a48:	b00f      	add	sp, #60	@ 0x3c
c0de8a4a:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de8a4e:	bf00      	nop
c0de8a50:	00001bd4 	.word	0x00001bd4
c0de8a54:	00001a54 	.word	0x00001a54
c0de8a58:	00005531 	.word	0x00005531
c0de8a5c:	00006d36 	.word	0x00006d36
c0de8a60:	00005042 	.word	0x00005042
c0de8a64:	000056f1 	.word	0x000056f1
c0de8a68:	000050ac 	.word	0x000050ac
c0de8a6c:	000056c1 	.word	0x000056c1
c0de8a70:	000008ef 	.word	0x000008ef

c0de8a74 <reset_callbacks_and_context>:
c0de8a74:	b580      	push	{r7, lr}
c0de8a76:	4808      	ldr	r0, [pc, #32]	@ (c0de8a98 <reset_callbacks_and_context+0x24>)
c0de8a78:	2100      	movs	r1, #0
c0de8a7a:	4448      	add	r0, r9
c0de8a7c:	e9c0 1109 	strd	r1, r1, [r0, #36]	@ 0x24
c0de8a80:	62c1      	str	r1, [r0, #44]	@ 0x2c
c0de8a82:	e9c0 1101 	strd	r1, r1, [r0, #4]
c0de8a86:	60c1      	str	r1, [r0, #12]
c0de8a88:	6181      	str	r1, [r0, #24]
c0de8a8a:	4804      	ldr	r0, [pc, #16]	@ (c0de8a9c <reset_callbacks_and_context+0x28>)
c0de8a8c:	2190      	movs	r1, #144	@ 0x90
c0de8a8e:	4448      	add	r0, r9
c0de8a90:	f003 fbb0 	bl	c0dec1f4 <__aeabi_memclr>
c0de8a94:	bd80      	pop	{r7, pc}
c0de8a96:	bf00      	nop
c0de8a98:	00001bd4 	.word	0x00001bd4
c0de8a9c:	0000191c 	.word	0x0000191c

c0de8aa0 <prepareNavInfo>:
c0de8aa0:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de8aa4:	4f1b      	ldr	r7, [pc, #108]	@ (c0de8b14 <prepareNavInfo+0x74>)
c0de8aa6:	460c      	mov	r4, r1
c0de8aa8:	4606      	mov	r6, r0
c0de8aaa:	211c      	movs	r1, #28
c0de8aac:	4690      	mov	r8, r2
c0de8aae:	eb09 0507 	add.w	r5, r9, r7
c0de8ab2:	f105 0060 	add.w	r0, r5, #96	@ 0x60
c0de8ab6:	f003 fb9d 	bl	c0dec1f4 <__aeabi_memclr>
c0de8aba:	2009      	movs	r0, #9
c0de8abc:	f885 4061 	strb.w	r4, [r5, #97]	@ 0x61
c0de8ac0:	f885 0065 	strb.w	r0, [r5, #101]	@ 0x65
c0de8ac4:	2001      	movs	r0, #1
c0de8ac6:	f885 0063 	strb.w	r0, [r5, #99]	@ 0x63
c0de8aca:	b1ce      	cbz	r6, c0de8b00 <prepareNavInfo+0x60>
c0de8acc:	eb09 0007 	add.w	r0, r9, r7
c0de8ad0:	210c      	movs	r1, #12
c0de8ad2:	f880 1062 	strb.w	r1, [r0, #98]	@ 0x62
c0de8ad6:	2103      	movs	r1, #3
c0de8ad8:	f8c0 8074 	str.w	r8, [r0, #116]	@ 0x74
c0de8adc:	f880 1073 	strb.w	r1, [r0, #115]	@ 0x73
c0de8ae0:	f819 1007 	ldrb.w	r1, [r9, r7]
c0de8ae4:	3903      	subs	r1, #3
c0de8ae6:	bf18      	it	ne
c0de8ae8:	2101      	movne	r1, #1
c0de8aea:	2200      	movs	r2, #0
c0de8aec:	f880 1072 	strb.w	r1, [r0, #114]	@ 0x72
c0de8af0:	2c01      	cmp	r4, #1
c0de8af2:	bf88      	it	hi
c0de8af4:	2201      	movhi	r2, #1
c0de8af6:	4311      	orrs	r1, r2
c0de8af8:	f880 1071 	strb.w	r1, [r0, #113]	@ 0x71
c0de8afc:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de8b00:	eb09 0107 	add.w	r1, r9, r7
c0de8b04:	f881 0071 	strb.w	r0, [r1, #113]	@ 0x71
c0de8b08:	2003      	movs	r0, #3
c0de8b0a:	f881 0073 	strb.w	r0, [r1, #115]	@ 0x73
c0de8b0e:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de8b12:	bf00      	nop
c0de8b14:	00001bd4 	.word	0x00001bd4

c0de8b18 <displaySettingsPage>:
c0de8b18:	b570      	push	{r4, r5, r6, lr}
c0de8b1a:	b090      	sub	sp, #64	@ 0x40
c0de8b1c:	460c      	mov	r4, r1
c0de8b1e:	4605      	mov	r5, r0
c0de8b20:	4668      	mov	r0, sp
c0de8b22:	2140      	movs	r1, #64	@ 0x40
c0de8b24:	f003 fb66 	bl	c0dec1f4 <__aeabi_memclr>
c0de8b28:	4e12      	ldr	r6, [pc, #72]	@ (c0de8b74 <displaySettingsPage+0x5c>)
c0de8b2a:	eb09 0006 	add.w	r0, r9, r6
c0de8b2e:	6882      	ldr	r2, [r0, #8]
c0de8b30:	b1f2      	cbz	r2, c0de8b70 <displaySettingsPage+0x58>
c0de8b32:	4669      	mov	r1, sp
c0de8b34:	4628      	mov	r0, r5
c0de8b36:	4790      	blx	r2
c0de8b38:	b1d0      	cbz	r0, c0de8b70 <displaySettingsPage+0x58>
c0de8b3a:	444e      	add	r6, r9
c0de8b3c:	2009      	movs	r0, #9
c0de8b3e:	466a      	mov	r2, sp
c0de8b40:	f88d 0006 	strb.w	r0, [sp, #6]
c0de8b44:	f240 2001 	movw	r0, #513	@ 0x201
c0de8b48:	f806 5f60 	strb.w	r5, [r6, #96]!
c0de8b4c:	f8ad 0004 	strh.w	r0, [sp, #4]
c0de8b50:	f856 0c50 	ldr.w	r0, [r6, #-80]
c0de8b54:	4631      	mov	r1, r6
c0de8b56:	9000      	str	r0, [sp, #0]
c0de8b58:	4807      	ldr	r0, [pc, #28]	@ (c0de8b78 <displaySettingsPage+0x60>)
c0de8b5a:	4478      	add	r0, pc
c0de8b5c:	f7ff fd78 	bl	c0de8650 <nbgl_pageDrawGenericContent>
c0de8b60:	f846 0c4c 	str.w	r0, [r6, #-76]
c0de8b64:	2001      	movs	r0, #1
c0de8b66:	2c00      	cmp	r4, #0
c0de8b68:	bf18      	it	ne
c0de8b6a:	2002      	movne	r0, #2
c0de8b6c:	f002 ff08 	bl	c0deb980 <nbgl_refreshSpecial>
c0de8b70:	b010      	add	sp, #64	@ 0x40
c0de8b72:	bd70      	pop	{r4, r5, r6, pc}
c0de8b74:	00001bd4 	.word	0x00001bd4
c0de8b78:	000007cf 	.word	0x000007cf

c0de8b7c <nbgl_useCaseGenericSettings>:
c0de8b7c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de8b80:	461d      	mov	r5, r3
c0de8b82:	4616      	mov	r6, r2
c0de8b84:	4688      	mov	r8, r1
c0de8b86:	4607      	mov	r7, r0
c0de8b88:	f7ff ff74 	bl	c0de8a74 <reset_callbacks_and_context>
c0de8b8c:	4c25      	ldr	r4, [pc, #148]	@ (c0de8c24 <nbgl_useCaseGenericSettings+0xa8>)
c0de8b8e:	2002      	movs	r0, #2
c0de8b90:	f809 0004 	strb.w	r0, [r9, r4]
c0de8b94:	eb09 0004 	add.w	r0, r9, r4
c0de8b98:	6107      	str	r7, [r0, #16]
c0de8b9a:	9906      	ldr	r1, [sp, #24]
c0de8b9c:	6041      	str	r1, [r0, #4]
c0de8b9e:	b12e      	cbz	r6, c0de8bac <nbgl_useCaseGenericSettings+0x30>
c0de8ba0:	4821      	ldr	r0, [pc, #132]	@ (c0de8c28 <nbgl_useCaseGenericSettings+0xac>)
c0de8ba2:	e896 000e 	ldmia.w	r6, {r1, r2, r3}
c0de8ba6:	4448      	add	r0, r9
c0de8ba8:	3004      	adds	r0, #4
c0de8baa:	c00e      	stmia	r0!, {r1, r2, r3}
c0de8bac:	b1a5      	cbz	r5, c0de8bd8 <nbgl_useCaseGenericSettings+0x5c>
c0de8bae:	481e      	ldr	r0, [pc, #120]	@ (c0de8c28 <nbgl_useCaseGenericSettings+0xac>)
c0de8bb0:	2101      	movs	r1, #1
c0de8bb2:	4448      	add	r0, r9
c0de8bb4:	7501      	strb	r1, [r0, #20]
c0de8bb6:	481d      	ldr	r0, [pc, #116]	@ (c0de8c2c <nbgl_useCaseGenericSettings+0xb0>)
c0de8bb8:	2138      	movs	r1, #56	@ 0x38
c0de8bba:	eb09 0600 	add.w	r6, r9, r0
c0de8bbe:	f106 0038 	add.w	r0, r6, #56	@ 0x38
c0de8bc2:	f003 fb17 	bl	c0dec1f4 <__aeabi_memclr>
c0de8bc6:	2008      	movs	r0, #8
c0de8bc8:	4629      	mov	r1, r5
c0de8bca:	2230      	movs	r2, #48	@ 0x30
c0de8bcc:	f886 0038 	strb.w	r0, [r6, #56]	@ 0x38
c0de8bd0:	f106 003c 	add.w	r0, r6, #60	@ 0x3c
c0de8bd4:	f003 fb04 	bl	c0dec1e0 <__aeabi_memcpy>
c0de8bd8:	f002 fa10 	bl	c0deaffc <OUTLINED_FUNCTION_4>
c0de8bdc:	4606      	mov	r6, r0
c0de8bde:	b145      	cbz	r5, c0de8bf2 <nbgl_useCaseGenericSettings+0x76>
c0de8be0:	4812      	ldr	r0, [pc, #72]	@ (c0de8c2c <nbgl_useCaseGenericSettings+0xb0>)
c0de8be2:	4631      	mov	r1, r6
c0de8be4:	2201      	movs	r2, #1
c0de8be6:	2300      	movs	r3, #0
c0de8be8:	4448      	add	r0, r9
c0de8bea:	3038      	adds	r0, #56	@ 0x38
c0de8bec:	f000 f848 	bl	c0de8c80 <getNbPagesForContent>
c0de8bf0:	4406      	add	r6, r0
c0de8bf2:	444c      	add	r4, r9
c0de8bf4:	211c      	movs	r1, #28
c0de8bf6:	f104 0060 	add.w	r0, r4, #96	@ 0x60
c0de8bfa:	f003 fafb 	bl	c0dec1f4 <__aeabi_memclr>
c0de8bfe:	2009      	movs	r0, #9
c0de8c00:	f884 6061 	strb.w	r6, [r4, #97]	@ 0x61
c0de8c04:	2101      	movs	r1, #1
c0de8c06:	f884 0065 	strb.w	r0, [r4, #101]	@ 0x65
c0de8c0a:	2003      	movs	r0, #3
c0de8c0c:	f884 0073 	strb.w	r0, [r4, #115]	@ 0x73
c0de8c10:	2001      	movs	r0, #1
c0de8c12:	f884 0063 	strb.w	r0, [r4, #99]	@ 0x63
c0de8c16:	f884 0071 	strb.w	r0, [r4, #113]	@ 0x71
c0de8c1a:	4640      	mov	r0, r8
c0de8c1c:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de8c20:	f000 b8c0 	b.w	c0de8da4 <displayGenericContextPage>
c0de8c24:	00001bd4 	.word	0x00001bd4
c0de8c28:	0000191c 	.word	0x0000191c
c0de8c2c:	000019ac 	.word	0x000019ac

c0de8c30 <getNbPagesForGenericContents>:
c0de8c30:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de8c34:	b08e      	sub	sp, #56	@ 0x38
c0de8c36:	4f11      	ldr	r7, [pc, #68]	@ (c0de8c7c <getNbPagesForGenericContents+0x4c>)
c0de8c38:	4604      	mov	r4, r0
c0de8c3a:	2600      	movs	r6, #0
c0de8c3c:	46e8      	mov	r8, sp
c0de8c3e:	2500      	movs	r5, #0
c0de8c40:	eb09 0007 	add.w	r0, r9, r7
c0de8c44:	7b00      	ldrb	r0, [r0, #12]
c0de8c46:	4285      	cmp	r5, r0
c0de8c48:	d214      	bcs.n	c0de8c74 <getNbPagesForGenericContents+0x44>
c0de8c4a:	b268      	sxtb	r0, r5
c0de8c4c:	4641      	mov	r1, r8
c0de8c4e:	f001 fb6d 	bl	c0dea32c <getContentAtIdx>
c0de8c52:	b170      	cbz	r0, c0de8c72 <getNbPagesForGenericContents+0x42>
c0de8c54:	eb09 0107 	add.w	r1, r9, r7
c0de8c58:	4623      	mov	r3, r4
c0de8c5a:	7b09      	ldrb	r1, [r1, #12]
c0de8c5c:	1a69      	subs	r1, r5, r1
c0de8c5e:	3101      	adds	r1, #1
c0de8c60:	fab1 f181 	clz	r1, r1
c0de8c64:	094a      	lsrs	r2, r1, #5
c0de8c66:	b2f1      	uxtb	r1, r6
c0de8c68:	f000 f80a 	bl	c0de8c80 <getNbPagesForContent>
c0de8c6c:	4406      	add	r6, r0
c0de8c6e:	3501      	adds	r5, #1
c0de8c70:	e7e6      	b.n	c0de8c40 <getNbPagesForGenericContents+0x10>
c0de8c72:	2600      	movs	r6, #0
c0de8c74:	b2f0      	uxtb	r0, r6
c0de8c76:	b00e      	add	sp, #56	@ 0x38
c0de8c78:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de8c7c:	0000191c 	.word	0x0000191c

c0de8c80 <getNbPagesForContent>:
c0de8c80:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8c84:	b08c      	sub	sp, #48	@ 0x30
c0de8c86:	4606      	mov	r6, r0
c0de8c88:	fab1 f081 	clz	r0, r1
c0de8c8c:	9306      	str	r3, [sp, #24]
c0de8c8e:	4614      	mov	r4, r2
c0de8c90:	9109      	str	r1, [sp, #36]	@ 0x24
c0de8c92:	0940      	lsrs	r0, r0, #5
c0de8c94:	4010      	ands	r0, r2
c0de8c96:	900a      	str	r0, [sp, #40]	@ 0x28
c0de8c98:	4630      	mov	r0, r6
c0de8c9a:	f001 fb71 	bl	c0dea380 <getContentNbElement>
c0de8c9e:	4605      	mov	r5, r0
c0de8ca0:	f084 0001 	eor.w	r0, r4, #1
c0de8ca4:	f04f 0800 	mov.w	r8, #0
c0de8ca8:	f04f 0a00 	mov.w	sl, #0
c0de8cac:	f04f 0b00 	mov.w	fp, #0
c0de8cb0:	270f      	movs	r7, #15
c0de8cb2:	9405      	str	r4, [sp, #20]
c0de8cb4:	9608      	str	r6, [sp, #32]
c0de8cb6:	9004      	str	r0, [sp, #16]
c0de8cb8:	1d30      	adds	r0, r6, #4
c0de8cba:	9007      	str	r0, [sp, #28]
c0de8cbc:	0628      	lsls	r0, r5, #24
c0de8cbe:	d068      	beq.n	c0de8d92 <getNbPagesForContent+0x112>
c0de8cc0:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de8cc2:	f88d 802f 	strb.w	r8, [sp, #47]	@ 0x2f
c0de8cc6:	b128      	cbz	r0, c0de8cd4 <getNbPagesForContent+0x54>
c0de8cc8:	fa5f f38b 	uxtb.w	r3, fp
c0de8ccc:	2b00      	cmp	r3, #0
c0de8cce:	bf18      	it	ne
c0de8cd0:	2301      	movne	r3, #1
c0de8cd2:	e000      	b.n	c0de8cd6 <getNbPagesForContent+0x56>
c0de8cd4:	2301      	movs	r3, #1
c0de8cd6:	9808      	ldr	r0, [sp, #32]
c0de8cd8:	7800      	ldrb	r0, [r0, #0]
c0de8cda:	280a      	cmp	r0, #10
c0de8cdc:	d00e      	beq.n	c0de8cfc <getNbPagesForContent+0x7c>
c0de8cde:	2806      	cmp	r0, #6
c0de8ce0:	d011      	beq.n	c0de8d06 <getNbPagesForContent+0x86>
c0de8ce2:	2807      	cmp	r0, #7
c0de8ce4:	d01e      	beq.n	c0de8d24 <getNbPagesForContent+0xa4>
c0de8ce6:	2808      	cmp	r0, #8
c0de8ce8:	d023      	beq.n	c0de8d32 <getNbPagesForContent+0xb2>
c0de8cea:	2809      	cmp	r0, #9
c0de8cec:	d028      	beq.n	c0de8d40 <getNbPagesForContent+0xc0>
c0de8cee:	2804      	cmp	r0, #4
c0de8cf0:	d12b      	bne.n	c0de8d4a <getNbPagesForContent+0xca>
c0de8cf2:	2000      	movs	r0, #0
c0de8cf4:	f04f 0800 	mov.w	r8, #0
c0de8cf8:	9000      	str	r0, [sp, #0]
c0de8cfa:	e007      	b.n	c0de8d0c <getNbPagesForContent+0x8c>
c0de8cfc:	b2e8      	uxtb	r0, r5
c0de8cfe:	2200      	movs	r2, #0
c0de8d00:	f7ff fddf 	bl	c0de88c2 <nbgl_useCaseGetNbBarsInPage>
c0de8d04:	e028      	b.n	c0de8d58 <getNbPagesForContent+0xd8>
c0de8d06:	9805      	ldr	r0, [sp, #20]
c0de8d08:	9000      	str	r0, [sp, #0]
c0de8d0a:	9804      	ldr	r0, [sp, #16]
c0de8d0c:	9001      	str	r0, [sp, #4]
c0de8d0e:	f10d 002f 	add.w	r0, sp, #47	@ 0x2f
c0de8d12:	e9dd 3106 	ldrd	r3, r1, [sp, #24]
c0de8d16:	fa5f f28b 	uxtb.w	r2, fp
c0de8d1a:	9002      	str	r0, [sp, #8]
c0de8d1c:	b2e8      	uxtb	r0, r5
c0de8d1e:	f7ff fcc5 	bl	c0de86ac <getNbTagValuesInPage>
c0de8d22:	e019      	b.n	c0de8d58 <getNbPagesForContent+0xd8>
c0de8d24:	9907      	ldr	r1, [sp, #28]
c0de8d26:	b2e8      	uxtb	r0, r5
c0de8d28:	fa5f f28b 	uxtb.w	r2, fp
c0de8d2c:	f7ff fd88 	bl	c0de8840 <nbgl_useCaseGetNbSwitchesInPage>
c0de8d30:	e012      	b.n	c0de8d58 <getNbPagesForContent+0xd8>
c0de8d32:	9907      	ldr	r1, [sp, #28]
c0de8d34:	b2e8      	uxtb	r0, r5
c0de8d36:	fa5f f28b 	uxtb.w	r2, fp
c0de8d3a:	f7ff fd52 	bl	c0de87e2 <nbgl_useCaseGetNbInfosInPage>
c0de8d3e:	e00b      	b.n	c0de8d58 <getNbPagesForContent+0xd8>
c0de8d40:	b2e8      	uxtb	r0, r5
c0de8d42:	2200      	movs	r2, #0
c0de8d44:	f7ff fddd 	bl	c0de8902 <nbgl_useCaseGetNbChoicesInPage>
c0de8d48:	e006      	b.n	c0de8d58 <getNbPagesForContent+0xd8>
c0de8d4a:	4915      	ldr	r1, [pc, #84]	@ (c0de8da0 <getNbPagesForContent+0x120>)
c0de8d4c:	4479      	add	r1, pc
c0de8d4e:	5c08      	ldrb	r0, [r1, r0]
c0de8d50:	b2e9      	uxtb	r1, r5
c0de8d52:	4288      	cmp	r0, r1
c0de8d54:	bf28      	it	cs
c0de8d56:	4628      	movcs	r0, r5
c0de8d58:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0de8d5a:	f89d 402f 	ldrb.w	r4, [sp, #47]	@ 0x2f
c0de8d5e:	f000 0307 	and.w	r3, r0, #7
c0de8d62:	2204      	movs	r2, #4
c0de8d64:	1a2d      	subs	r5, r5, r0
c0de8d66:	4483      	add	fp, r0
c0de8d68:	4451      	add	r1, sl
c0de8d6a:	ea43 03c4 	orr.w	r3, r3, r4, lsl #3
c0de8d6e:	4c0b      	ldr	r4, [pc, #44]	@ (c0de8d9c <getNbPagesForContent+0x11c>)
c0de8d70:	f10a 0a01 	add.w	sl, sl, #1
c0de8d74:	b2c9      	uxtb	r1, r1
c0de8d76:	b2db      	uxtb	r3, r3
c0de8d78:	ea02 0281 	and.w	r2, r2, r1, lsl #2
c0de8d7c:	444c      	add	r4, r9
c0de8d7e:	0849      	lsrs	r1, r1, #1
c0de8d80:	5c66      	ldrb	r6, [r4, r1]
c0de8d82:	4093      	lsls	r3, r2
c0de8d84:	fa07 f202 	lsl.w	r2, r7, r2
c0de8d88:	ea26 0202 	bic.w	r2, r6, r2
c0de8d8c:	431a      	orrs	r2, r3
c0de8d8e:	5462      	strb	r2, [r4, r1]
c0de8d90:	e794      	b.n	c0de8cbc <getNbPagesForContent+0x3c>
c0de8d92:	fa5f f08a 	uxtb.w	r0, sl
c0de8d96:	b00c      	add	sp, #48	@ 0x30
c0de8d98:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de8d9c:	00001ad4 	.word	0x00001ad4
c0de8da0:	000069f6 	.word	0x000069f6

c0de8da4 <displayGenericContextPage>:
c0de8da4:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8da8:	b0a0      	sub	sp, #128	@ 0x80
c0de8daa:	f8df 33e4 	ldr.w	r3, [pc, #996]	@ c0de9190 <displayGenericContextPage+0x3ec>
c0de8dae:	4683      	mov	fp, r0
c0de8db0:	f819 0003 	ldrb.w	r0, [r9, r3]
c0de8db4:	2803      	cmp	r0, #3
c0de8db6:	d110      	bne.n	c0de8dda <displayGenericContextPage+0x36>
c0de8db8:	f8df 03d8 	ldr.w	r0, [pc, #984]	@ c0de9194 <displayGenericContextPage+0x3f0>
c0de8dbc:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de8dc0:	d060      	beq.n	c0de8e84 <displayGenericContextPage+0xe0>
c0de8dc2:	eb09 0200 	add.w	r2, r9, r0
c0de8dc6:	7c12      	ldrb	r2, [r2, #16]
c0de8dc8:	455a      	cmp	r2, fp
c0de8dca:	d80f      	bhi.n	c0de8dec <displayGenericContextPage+0x48>
c0de8dcc:	4448      	add	r0, r9
c0de8dce:	6841      	ldr	r1, [r0, #4]
c0de8dd0:	2001      	movs	r0, #1
c0de8dd2:	b020      	add	sp, #128	@ 0x80
c0de8dd4:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8dd8:	4708      	bx	r1
c0de8dda:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de8dde:	d105      	bne.n	c0de8dec <displayGenericContextPage+0x48>
c0de8de0:	eb09 0003 	add.w	r0, r9, r3
c0de8de4:	f890 0061 	ldrb.w	r0, [r0, #97]	@ 0x61
c0de8de8:	f1a0 0b01 	sub.w	fp, r0, #1
c0de8dec:	eb09 0003 	add.w	r0, r9, r3
c0de8df0:	fa5f f78b 	uxtb.w	r7, fp
c0de8df4:	9100      	str	r1, [sp, #0]
c0de8df6:	f890 8060 	ldrb.w	r8, [r0, #96]	@ 0x60
c0de8dfa:	4547      	cmp	r7, r8
c0de8dfc:	d12d      	bne.n	c0de8e5a <displayGenericContextPage+0xb6>
c0de8dfe:	a912      	add	r1, sp, #72	@ 0x48
c0de8e00:	f10d 0247 	add.w	r2, sp, #71	@ 0x47
c0de8e04:	f10d 0346 	add.w	r3, sp, #70	@ 0x46
c0de8e08:	4638      	mov	r0, r7
c0de8e0a:	f001 fad1 	bl	c0dea3b0 <genericContextComputeNextPageParams>
c0de8e0e:	4682      	mov	sl, r0
c0de8e10:	f1ba 0f00 	cmp.w	sl, #0
c0de8e14:	f000 81b8 	beq.w	c0de9188 <displayGenericContextPage+0x3e4>
c0de8e18:	f8df 8374 	ldr.w	r8, [pc, #884]	@ c0de9190 <displayGenericContextPage+0x3ec>
c0de8e1c:	f819 0008 	ldrb.w	r0, [r9, r8]
c0de8e20:	2803      	cmp	r0, #3
c0de8e22:	d041      	beq.n	c0de8ea8 <displayGenericContextPage+0x104>
c0de8e24:	48db      	ldr	r0, [pc, #876]	@ (c0de9194 <displayGenericContextPage+0x3f0>)
c0de8e26:	f819 0000 	ldrb.w	r0, [r9, r0]
c0de8e2a:	06c0      	lsls	r0, r0, #27
c0de8e2c:	d53c      	bpl.n	c0de8ea8 <displayGenericContextPage+0x104>
c0de8e2e:	ea5f 600b 	movs.w	r0, fp, lsl #24
c0de8e32:	d035      	beq.n	c0de8ea0 <displayGenericContextPage+0xfc>
c0de8e34:	eb09 0008 	add.w	r0, r9, r8
c0de8e38:	f890 0061 	ldrb.w	r0, [r0, #97]	@ 0x61
c0de8e3c:	3801      	subs	r0, #1
c0de8e3e:	42b8      	cmp	r0, r7
c0de8e40:	dd2e      	ble.n	c0de8ea0 <displayGenericContextPage+0xfc>
c0de8e42:	eb09 0008 	add.w	r0, r9, r8
c0de8e46:	2105      	movs	r1, #5
c0de8e48:	f880 106c 	strb.w	r1, [r0, #108]	@ 0x6c
c0de8e4c:	49d3      	ldr	r1, [pc, #844]	@ (c0de919c <displayGenericContextPage+0x3f8>)
c0de8e4e:	4479      	add	r1, pc
c0de8e50:	6681      	str	r1, [r0, #104]	@ 0x68
c0de8e52:	2100      	movs	r1, #0
c0de8e54:	f880 1064 	strb.w	r1, [r0, #100]	@ 0x64
c0de8e58:	e026      	b.n	c0de8ea8 <displayGenericContextPage+0x104>
c0de8e5a:	d91c      	bls.n	c0de8e96 <displayGenericContextPage+0xf2>
c0de8e5c:	f04f 0a00 	mov.w	sl, #0
c0de8e60:	ac12      	add	r4, sp, #72	@ 0x48
c0de8e62:	f10d 0547 	add.w	r5, sp, #71	@ 0x47
c0de8e66:	f10d 0646 	add.w	r6, sp, #70	@ 0x46
c0de8e6a:	4547      	cmp	r7, r8
c0de8e6c:	d0d0      	beq.n	c0de8e10 <displayGenericContextPage+0x6c>
c0de8e6e:	f108 0801 	add.w	r8, r8, #1
c0de8e72:	4621      	mov	r1, r4
c0de8e74:	462a      	mov	r2, r5
c0de8e76:	4633      	mov	r3, r6
c0de8e78:	fa5f f088 	uxtb.w	r0, r8
c0de8e7c:	f001 fa98 	bl	c0dea3b0 <genericContextComputeNextPageParams>
c0de8e80:	4682      	mov	sl, r0
c0de8e82:	e7f2      	b.n	c0de8e6a <displayGenericContextPage+0xc6>
c0de8e84:	4448      	add	r0, r9
c0de8e86:	6880      	ldr	r0, [r0, #8]
c0de8e88:	2800      	cmp	r0, #0
c0de8e8a:	f000 817d 	beq.w	c0de9188 <displayGenericContextPage+0x3e4>
c0de8e8e:	b020      	add	sp, #128	@ 0x80
c0de8e90:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8e94:	4700      	bx	r0
c0de8e96:	eba7 0008 	sub.w	r0, r7, r8
c0de8e9a:	2801      	cmp	r0, #1
c0de8e9c:	ddaf      	ble.n	c0de8dfe <displayGenericContextPage+0x5a>
c0de8e9e:	e173      	b.n	c0de9188 <displayGenericContextPage+0x3e4>
c0de8ea0:	eb09 0008 	add.w	r0, r9, r8
c0de8ea4:	2100      	movs	r1, #0
c0de8ea6:	6681      	str	r1, [r0, #104]	@ 0x68
c0de8ea8:	ad01      	add	r5, sp, #4
c0de8eaa:	213c      	movs	r1, #60	@ 0x3c
c0de8eac:	1d28      	adds	r0, r5, #4
c0de8eae:	f003 f9a1 	bl	c0dec1f4 <__aeabi_memclr>
c0de8eb2:	2009      	movs	r0, #9
c0de8eb4:	f8df b2e0 	ldr.w	fp, [pc, #736]	@ c0de9198 <displayGenericContextPage+0x3f4>
c0de8eb8:	f89d 7047 	ldrb.w	r7, [sp, #71]	@ 0x47
c0de8ebc:	f88d 000a 	strb.w	r0, [sp, #10]
c0de8ec0:	2002      	movs	r0, #2
c0de8ec2:	f88d 0009 	strb.w	r0, [sp, #9]
c0de8ec6:	eb09 0008 	add.w	r0, r9, r8
c0de8eca:	eb09 010b 	add.w	r1, r9, fp
c0de8ece:	6900      	ldr	r0, [r0, #16]
c0de8ed0:	7c8e      	ldrb	r6, [r1, #18]
c0de8ed2:	9001      	str	r0, [sp, #4]
c0de8ed4:	f89a 0000 	ldrb.w	r0, [sl]
c0de8ed8:	280a      	cmp	r0, #10
c0de8eda:	f88d 0010 	strb.w	r0, [sp, #16]
c0de8ede:	d01e      	beq.n	c0de8f1e <displayGenericContextPage+0x17a>
c0de8ee0:	2801      	cmp	r0, #1
c0de8ee2:	d02c      	beq.n	c0de8f3e <displayGenericContextPage+0x19a>
c0de8ee4:	2802      	cmp	r0, #2
c0de8ee6:	d014      	beq.n	c0de8f12 <displayGenericContextPage+0x16e>
c0de8ee8:	2803      	cmp	r0, #3
c0de8eea:	d012      	beq.n	c0de8f12 <displayGenericContextPage+0x16e>
c0de8eec:	2804      	cmp	r0, #4
c0de8eee:	d02e      	beq.n	c0de8f4e <displayGenericContextPage+0x1aa>
c0de8ef0:	2806      	cmp	r0, #6
c0de8ef2:	d040      	beq.n	c0de8f76 <displayGenericContextPage+0x1d2>
c0de8ef4:	2807      	cmp	r0, #7
c0de8ef6:	d04c      	beq.n	c0de8f92 <displayGenericContextPage+0x1ee>
c0de8ef8:	2808      	cmp	r0, #8
c0de8efa:	d056      	beq.n	c0de8faa <displayGenericContextPage+0x206>
c0de8efc:	2809      	cmp	r0, #9
c0de8efe:	d061      	beq.n	c0de8fc4 <displayGenericContextPage+0x220>
c0de8f00:	2800      	cmp	r0, #0
c0de8f02:	f040 8141 	bne.w	c0de9188 <displayGenericContextPage+0x3e4>
c0de8f06:	f002 f8b1 	bl	c0deb06c <OUTLINED_FUNCTION_18>
c0de8f0a:	e890 007c 	ldmia.w	r0, {r2, r3, r4, r5, r6}
c0de8f0e:	c17c      	stmia	r1!, {r2, r3, r4, r5, r6}
c0de8f10:	e103      	b.n	c0de911a <displayGenericContextPage+0x376>
c0de8f12:	f002 f8ab 	bl	c0deb06c <OUTLINED_FUNCTION_18>
c0de8f16:	e890 003c 	ldmia.w	r0, {r2, r3, r4, r5}
c0de8f1a:	c13c      	stmia	r1!, {r2, r3, r4, r5}
c0de8f1c:	e0fd      	b.n	c0de911a <displayGenericContextPage+0x376>
c0de8f1e:	f88d 701c 	strb.w	r7, [sp, #28]
c0de8f22:	f002 f862 	bl	c0deafea <OUTLINED_FUNCTION_2>
c0de8f26:	9005      	str	r0, [sp, #20]
c0de8f28:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de8f2c:	4430      	add	r0, r6
c0de8f2e:	f002 ff3f 	bl	c0debdb0 <pic>
c0de8f32:	9006      	str	r0, [sp, #24]
c0de8f34:	f89a 000d 	ldrb.w	r0, [sl, #13]
c0de8f38:	f88d 001d 	strb.w	r0, [sp, #29]
c0de8f3c:	e0ed      	b.n	c0de911a <displayGenericContextPage+0x376>
c0de8f3e:	f105 0010 	add.w	r0, r5, #16
c0de8f42:	f10a 0104 	add.w	r1, sl, #4
c0de8f46:	2230      	movs	r2, #48	@ 0x30
c0de8f48:	f003 f94a 	bl	c0dec1e0 <__aeabi_memcpy>
c0de8f4c:	e0e5      	b.n	c0de911a <displayGenericContextPage+0x376>
c0de8f4e:	f8da 2004 	ldr.w	r2, [sl, #4]
c0de8f52:	eb09 010b 	add.w	r1, r9, fp
c0de8f56:	f89d 0046 	ldrb.w	r0, [sp, #70]	@ 0x46
c0de8f5a:	624a      	str	r2, [r1, #36]	@ 0x24
c0de8f5c:	2800      	cmp	r0, #0
c0de8f5e:	f8da 2008 	ldr.w	r2, [sl, #8]
c0de8f62:	628a      	str	r2, [r1, #40]	@ 0x28
c0de8f64:	f000 8087 	beq.w	c0de9076 <displayGenericContextPage+0x2d2>
c0de8f68:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de8f6c:	2800      	cmp	r0, #0
c0de8f6e:	d064      	beq.n	c0de903a <displayGenericContextPage+0x296>
c0de8f70:	eb00 1006 	add.w	r0, r0, r6, lsl #4
c0de8f74:	e065      	b.n	c0de9042 <displayGenericContextPage+0x29e>
c0de8f76:	f89a 100c 	ldrb.w	r1, [sl, #12]
c0de8f7a:	19f0      	adds	r0, r6, r7
c0de8f7c:	f10a 0404 	add.w	r4, sl, #4
c0de8f80:	4288      	cmp	r0, r1
c0de8f82:	d134      	bne.n	c0de8fee <displayGenericContextPage+0x24a>
c0de8f84:	3510      	adds	r5, #16
c0de8f86:	4621      	mov	r1, r4
c0de8f88:	222c      	movs	r2, #44	@ 0x2c
c0de8f8a:	4628      	mov	r0, r5
c0de8f8c:	f003 f928 	bl	c0dec1e0 <__aeabi_memcpy>
c0de8f90:	e031      	b.n	c0de8ff6 <displayGenericContextPage+0x252>
c0de8f92:	f88d 7018 	strb.w	r7, [sp, #24]
c0de8f96:	eb06 0046 	add.w	r0, r6, r6, lsl #1
c0de8f9a:	f8da 1004 	ldr.w	r1, [sl, #4]
c0de8f9e:	eb01 0080 	add.w	r0, r1, r0, lsl #2
c0de8fa2:	f002 ff05 	bl	c0debdb0 <pic>
c0de8fa6:	9005      	str	r0, [sp, #20]
c0de8fa8:	e0b7      	b.n	c0de911a <displayGenericContextPage+0x376>
c0de8faa:	f88d 7020 	strb.w	r7, [sp, #32]
c0de8fae:	f002 f81c 	bl	c0deafea <OUTLINED_FUNCTION_2>
c0de8fb2:	9005      	str	r0, [sp, #20]
c0de8fb4:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de8fb8:	eb00 0086 	add.w	r0, r0, r6, lsl #2
c0de8fbc:	f002 fef8 	bl	c0debdb0 <pic>
c0de8fc0:	9006      	str	r0, [sp, #24]
c0de8fc2:	e0aa      	b.n	c0de911a <displayGenericContextPage+0x376>
c0de8fc4:	f002 f852 	bl	c0deb06c <OUTLINED_FUNCTION_18>
c0de8fc8:	e890 001c 	ldmia.w	r0, {r2, r3, r4}
c0de8fcc:	c11c      	stmia	r1!, {r2, r3, r4}
c0de8fce:	f88d 7019 	strb.w	r7, [sp, #25]
c0de8fd2:	f002 f80a 	bl	c0deafea <OUTLINED_FUNCTION_2>
c0de8fd6:	9005      	str	r0, [sp, #20]
c0de8fd8:	f89a 000a 	ldrb.w	r0, [sl, #10]
c0de8fdc:	42b0      	cmp	r0, r6
c0de8fde:	d329      	bcc.n	c0de9034 <displayGenericContextPage+0x290>
c0de8fe0:	19f1      	adds	r1, r6, r7
c0de8fe2:	4281      	cmp	r1, r0
c0de8fe4:	d926      	bls.n	c0de9034 <displayGenericContextPage+0x290>
c0de8fe6:	1b80      	subs	r0, r0, r6
c0de8fe8:	f88d 001a 	strb.w	r0, [sp, #26]
c0de8fec:	e095      	b.n	c0de911a <displayGenericContextPage+0x376>
c0de8fee:	2004      	movs	r0, #4
c0de8ff0:	3510      	adds	r5, #16
c0de8ff2:	f88d 0010 	strb.w	r0, [sp, #16]
c0de8ff6:	f88d 701c 	strb.w	r7, [sp, #28]
c0de8ffa:	6820      	ldr	r0, [r4, #0]
c0de8ffc:	eb00 1006 	add.w	r0, r0, r6, lsl #4
c0de9000:	f002 fed6 	bl	c0debdb0 <pic>
c0de9004:	2110      	movs	r1, #16
c0de9006:	6028      	str	r0, [r5, #0]
c0de9008:	9d00      	ldr	r5, [sp, #0]
c0de900a:	2200      	movs	r2, #0
c0de900c:	eb01 1107 	add.w	r1, r1, r7, lsl #4
c0de9010:	f102 0310 	add.w	r3, r2, #16
c0de9014:	4299      	cmp	r1, r3
c0de9016:	d007      	beq.n	c0de9028 <displayGenericContextPage+0x284>
c0de9018:	4402      	add	r2, r0
c0de901a:	7b12      	ldrb	r2, [r2, #12]
c0de901c:	0752      	lsls	r2, r2, #29
c0de901e:	461a      	mov	r2, r3
c0de9020:	d5f6      	bpl.n	c0de9010 <displayGenericContextPage+0x26c>
c0de9022:	210d      	movs	r1, #13
c0de9024:	f88d 1020 	strb.w	r1, [sp, #32]
c0de9028:	9a06      	ldr	r2, [sp, #24]
c0de902a:	eb09 010b 	add.w	r1, r9, fp
c0de902e:	e9c1 0209 	strd	r0, r2, [r1, #36]	@ 0x24
c0de9032:	e073      	b.n	c0de911c <displayGenericContextPage+0x378>
c0de9034:	f88d 701a 	strb.w	r7, [sp, #26]
c0de9038:	e06f      	b.n	c0de911a <displayGenericContextPage+0x376>
c0de903a:	f8da 1008 	ldr.w	r1, [sl, #8]
c0de903e:	4630      	mov	r0, r6
c0de9040:	4788      	blx	r1
c0de9042:	f002 feb5 	bl	c0debdb0 <pic>
c0de9046:	7b01      	ldrb	r1, [r0, #12]
c0de9048:	0789      	lsls	r1, r1, #30
c0de904a:	d42e      	bmi.n	c0de90aa <displayGenericContextPage+0x306>
c0de904c:	4954      	ldr	r1, [pc, #336]	@ (c0de91a0 <displayGenericContextPage+0x3fc>)
c0de904e:	4479      	add	r1, pc
c0de9050:	910b      	str	r1, [sp, #44]	@ 0x2c
c0de9052:	210a      	movs	r1, #10
c0de9054:	f88d 1030 	strb.w	r1, [sp, #48]	@ 0x30
c0de9058:	2100      	movs	r1, #0
c0de905a:	910a      	str	r1, [sp, #40]	@ 0x28
c0de905c:	eb09 010b 	add.w	r1, r9, fp
c0de9060:	e9d0 2000 	ldrd	r2, r0, [r0]
c0de9064:	e9c1 2006 	strd	r2, r0, [r1, #24]
c0de9068:	f89a 0012 	ldrb.w	r0, [sl, #18]
c0de906c:	f881 0020 	strb.w	r0, [r1, #32]
c0de9070:	2005      	movs	r0, #5
c0de9072:	f88d 0010 	strb.w	r0, [sp, #16]
c0de9076:	f88d 701c 	strb.w	r7, [sp, #28]
c0de907a:	f89a 0010 	ldrb.w	r0, [sl, #16]
c0de907e:	f88d 0020 	strb.w	r0, [sp, #32]
c0de9082:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de9086:	b328      	cbz	r0, c0de90d4 <displayGenericContextPage+0x330>
c0de9088:	eb00 1006 	add.w	r0, r0, r6, lsl #4
c0de908c:	f002 fe90 	bl	c0debdb0 <pic>
c0de9090:	9005      	str	r0, [sp, #20]
c0de9092:	f100 010c 	add.w	r1, r0, #12
c0de9096:	1c78      	adds	r0, r7, #1
c0de9098:	3801      	subs	r0, #1
c0de909a:	d033      	beq.n	c0de9104 <displayGenericContextPage+0x360>
c0de909c:	f101 0210 	add.w	r2, r1, #16
c0de90a0:	7809      	ldrb	r1, [r1, #0]
c0de90a2:	0749      	lsls	r1, r1, #29
c0de90a4:	4611      	mov	r1, r2
c0de90a6:	d5f7      	bpl.n	c0de9098 <displayGenericContextPage+0x2f4>
c0de90a8:	e029      	b.n	c0de90fe <displayGenericContextPage+0x35a>
c0de90aa:	2101      	movs	r1, #1
c0de90ac:	f88d 1010 	strb.w	r1, [sp, #16]
c0de90b0:	6881      	ldr	r1, [r0, #8]
c0de90b2:	4a3f      	ldr	r2, [pc, #252]	@ (c0de91b0 <displayGenericContextPage+0x40c>)
c0de90b4:	447a      	add	r2, pc
c0de90b6:	920c      	str	r2, [sp, #48]	@ 0x30
c0de90b8:	e9d0 2000 	ldrd	r2, r0, [r0]
c0de90bc:	9106      	str	r1, [sp, #24]
c0de90be:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de90c0:	2000      	movs	r0, #0
c0de90c2:	9209      	str	r2, [sp, #36]	@ 0x24
c0de90c4:	f88d 0036 	strb.w	r0, [sp, #54]	@ 0x36
c0de90c8:	f8ad 0034 	strh.w	r0, [sp, #52]	@ 0x34
c0de90cc:	900a      	str	r0, [sp, #40]	@ 0x28
c0de90ce:	f88d 0014 	strb.w	r0, [sp, #20]
c0de90d2:	e022      	b.n	c0de911a <displayGenericContextPage+0x376>
c0de90d4:	2400      	movs	r4, #0
c0de90d6:	9405      	str	r4, [sp, #20]
c0de90d8:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de90dc:	f88d 601d 	strb.w	r6, [sp, #29]
c0de90e0:	9006      	str	r0, [sp, #24]
c0de90e2:	b2e0      	uxtb	r0, r4
c0de90e4:	42b8      	cmp	r0, r7
c0de90e6:	d20d      	bcs.n	c0de9104 <displayGenericContextPage+0x360>
c0de90e8:	19a0      	adds	r0, r4, r6
c0de90ea:	f8da 1008 	ldr.w	r1, [sl, #8]
c0de90ee:	b2c0      	uxtb	r0, r0
c0de90f0:	4788      	blx	r1
c0de90f2:	f002 fe5d 	bl	c0debdb0 <pic>
c0de90f6:	7b00      	ldrb	r0, [r0, #12]
c0de90f8:	3401      	adds	r4, #1
c0de90fa:	0740      	lsls	r0, r0, #29
c0de90fc:	d5f1      	bpl.n	c0de90e2 <displayGenericContextPage+0x33e>
c0de90fe:	200d      	movs	r0, #13
c0de9100:	f88d 0020 	strb.w	r0, [sp, #32]
c0de9104:	2000      	movs	r0, #0
c0de9106:	f88d 0021 	strb.w	r0, [sp, #33]	@ 0x21
c0de910a:	f640 1001 	movw	r0, #2305	@ 0x901
c0de910e:	f8ad 001e 	strh.w	r0, [sp, #30]
c0de9112:	f89a 0012 	ldrb.w	r0, [sl, #18]
c0de9116:	f88d 0022 	strb.w	r0, [sp, #34]	@ 0x22
c0de911a:	9d00      	ldr	r5, [sp, #0]
c0de911c:	481d      	ldr	r0, [pc, #116]	@ (c0de9194 <displayGenericContextPage+0x3f0>)
c0de911e:	f819 1008 	ldrb.w	r1, [r9, r8]
c0de9122:	f001 01fe 	and.w	r1, r1, #254	@ 0xfe
c0de9126:	f859 0000 	ldr.w	r0, [r9, r0]
c0de912a:	2902      	cmp	r1, #2
c0de912c:	bf18      	it	ne
c0de912e:	2000      	movne	r0, #0
c0de9130:	f89a 1000 	ldrb.w	r1, [sl]
c0de9134:	2902      	cmp	r1, #2
c0de9136:	d817      	bhi.n	c0de9168 <displayGenericContextPage+0x3c4>
c0de9138:	f010 0fe0 	tst.w	r0, #224	@ 0xe0
c0de913c:	d014      	beq.n	c0de9168 <displayGenericContextPage+0x3c4>
c0de913e:	0601      	lsls	r1, r0, #24
c0de9140:	d508      	bpl.n	c0de9154 <displayGenericContextPage+0x3b0>
c0de9142:	eb09 010b 	add.w	r1, r9, fp
c0de9146:	6f89      	ldr	r1, [r1, #120]	@ 0x78
c0de9148:	7809      	ldrb	r1, [r1, #0]
c0de914a:	06c9      	lsls	r1, r1, #27
c0de914c:	d402      	bmi.n	c0de9154 <displayGenericContextPage+0x3b0>
c0de914e:	4915      	ldr	r1, [pc, #84]	@ (c0de91a4 <displayGenericContextPage+0x400>)
c0de9150:	4479      	add	r1, pc
c0de9152:	e001      	b.n	c0de9158 <displayGenericContextPage+0x3b4>
c0de9154:	4914      	ldr	r1, [pc, #80]	@ (c0de91a8 <displayGenericContextPage+0x404>)
c0de9156:	4479      	add	r1, pc
c0de9158:	0680      	lsls	r0, r0, #26
c0de915a:	9103      	str	r1, [sp, #12]
c0de915c:	f04f 0010 	mov.w	r0, #16
c0de9160:	bf58      	it	pl
c0de9162:	2011      	movpl	r0, #17
c0de9164:	f88d 000b 	strb.w	r0, [sp, #11]
c0de9168:	4810      	ldr	r0, [pc, #64]	@ (c0de91ac <displayGenericContextPage+0x408>)
c0de916a:	eb09 0408 	add.w	r4, r9, r8
c0de916e:	aa01      	add	r2, sp, #4
c0de9170:	f104 0160 	add.w	r1, r4, #96	@ 0x60
c0de9174:	4478      	add	r0, pc
c0de9176:	f7ff fa6b 	bl	c0de8650 <nbgl_pageDrawGenericContent>
c0de917a:	6160      	str	r0, [r4, #20]
c0de917c:	2001      	movs	r0, #1
c0de917e:	2d00      	cmp	r5, #0
c0de9180:	bf18      	it	ne
c0de9182:	2002      	movne	r0, #2
c0de9184:	f002 fbfc 	bl	c0deb980 <nbgl_refreshSpecial>
c0de9188:	b020      	add	sp, #128	@ 0x80
c0de918a:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de918e:	bf00      	nop
c0de9190:	00001bd4 	.word	0x00001bd4
c0de9194:	00001c50 	.word	0x00001c50
c0de9198:	0000191c 	.word	0x0000191c
c0de919c:	000051e4 	.word	0x000051e4
c0de91a0:	00004c3a 	.word	0x00004c3a
c0de91a4:	0000434e 	.word	0x0000434e
c0de91a8:	00004691 	.word	0x00004691
c0de91ac:	000001b5 	.word	0x000001b5
c0de91b0:	0000501b 	.word	0x0000501b

c0de91b4 <nbgl_useCaseHomeAndSettings>:
c0de91b4:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de91b8:	4698      	mov	r8, r3
c0de91ba:	4615      	mov	r5, r2
c0de91bc:	460e      	mov	r6, r1
c0de91be:	4607      	mov	r7, r0
c0de91c0:	f7ff fc58 	bl	c0de8a74 <reset_callbacks_and_context>
c0de91c4:	4814      	ldr	r0, [pc, #80]	@ (c0de9218 <nbgl_useCaseHomeAndSettings+0x64>)
c0de91c6:	f849 7000 	str.w	r7, [r9, r0]
c0de91ca:	eb09 0100 	add.w	r1, r9, r0
c0de91ce:	9a07      	ldr	r2, [sp, #28]
c0de91d0:	610a      	str	r2, [r1, #16]
c0de91d2:	9a06      	ldr	r2, [sp, #24]
c0de91d4:	e9c1 6501 	strd	r6, r5, [r1, #4]
c0de91d8:	60ca      	str	r2, [r1, #12]
c0de91da:	e9dd 2108 	ldrd	r2, r1, [sp, #32]
c0de91de:	b132      	cbz	r2, c0de91ee <nbgl_useCaseHomeAndSettings+0x3a>
c0de91e0:	eb09 0300 	add.w	r3, r9, r0
c0de91e4:	e892 00f0 	ldmia.w	r2, {r4, r5, r6, r7}
c0de91e8:	3314      	adds	r3, #20
c0de91ea:	c3f0      	stmia	r3!, {r4, r5, r6, r7}
c0de91ec:	e006      	b.n	c0de91fc <nbgl_useCaseHomeAndSettings+0x48>
c0de91ee:	eb09 0200 	add.w	r2, r9, r0
c0de91f2:	2300      	movs	r3, #0
c0de91f4:	e9c2 3305 	strd	r3, r3, [r2, #20]
c0de91f8:	e9c2 3307 	strd	r3, r3, [r2, #28]
c0de91fc:	4448      	add	r0, r9
c0de91fe:	f1b8 0fff 	cmp.w	r8, #255	@ 0xff
c0de9202:	6241      	str	r1, [r0, #36]	@ 0x24
c0de9204:	d004      	beq.n	c0de9210 <nbgl_useCaseHomeAndSettings+0x5c>
c0de9206:	4640      	mov	r0, r8
c0de9208:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de920c:	f000 b806 	b.w	c0de921c <bundleNavStartSettingsAtPage>
c0de9210:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de9214:	f000 b816 	b.w	c0de9244 <bundleNavStartHome>
c0de9218:	00001c50 	.word	0x00001c50

c0de921c <bundleNavStartSettingsAtPage>:
c0de921c:	b51c      	push	{r2, r3, r4, lr}
c0de921e:	4a07      	ldr	r2, [pc, #28]	@ (c0de923c <bundleNavStartSettingsAtPage+0x20>)
c0de9220:	4601      	mov	r1, r0
c0de9222:	eb09 0302 	add.w	r3, r9, r2
c0de9226:	f859 0002 	ldr.w	r0, [r9, r2]
c0de922a:	e9d3 2303 	ldrd	r2, r3, [r3, #12]
c0de922e:	4c04      	ldr	r4, [pc, #16]	@ (c0de9240 <bundleNavStartSettingsAtPage+0x24>)
c0de9230:	447c      	add	r4, pc
c0de9232:	9400      	str	r4, [sp, #0]
c0de9234:	f7ff fca2 	bl	c0de8b7c <nbgl_useCaseGenericSettings>
c0de9238:	bd1c      	pop	{r2, r3, r4, pc}
c0de923a:	bf00      	nop
c0de923c:	00001c50 	.word	0x00001c50
c0de9240:	00000011 	.word	0x00000011

c0de9244 <bundleNavStartHome>:
c0de9244:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
c0de9246:	490a      	ldr	r1, [pc, #40]	@ (c0de9270 <bundleNavStartHome+0x2c>)
c0de9248:	eb09 0401 	add.w	r4, r9, r1
c0de924c:	f859 0001 	ldr.w	r0, [r9, r1]
c0de9250:	1d23      	adds	r3, r4, #4
c0de9252:	6a65      	ldr	r5, [r4, #36]	@ 0x24
c0de9254:	3414      	adds	r4, #20
c0de9256:	cb0e      	ldmia	r3, {r1, r2, r3}
c0de9258:	4e06      	ldr	r6, [pc, #24]	@ (c0de9274 <bundleNavStartHome+0x30>)
c0de925a:	2b00      	cmp	r3, #0
c0de925c:	9502      	str	r5, [sp, #8]
c0de925e:	447e      	add	r6, pc
c0de9260:	e9cd 4600 	strd	r4, r6, [sp]
c0de9264:	bf18      	it	ne
c0de9266:	2301      	movne	r3, #1
c0de9268:	f7ff fb6a 	bl	c0de8940 <useCaseHomeExt>
c0de926c:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}
c0de926e:	bf00      	nop
c0de9270:	00001c50 	.word	0x00001c50
c0de9274:	0000129b 	.word	0x0000129b

c0de9278 <nbgl_useCaseStatus>:
c0de9278:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de927c:	b090      	sub	sp, #64	@ 0x40
c0de927e:	4604      	mov	r4, r0
c0de9280:	481d      	ldr	r0, [pc, #116]	@ (c0de92f8 <nbgl_useCaseStatus+0x80>)
c0de9282:	460e      	mov	r6, r1
c0de9284:	4615      	mov	r5, r2
c0de9286:	a90d      	add	r1, sp, #52	@ 0x34
c0de9288:	4478      	add	r0, pc
c0de928a:	e890 008c 	ldmia.w	r0, {r2, r3, r7}
c0de928e:	4668      	mov	r0, sp
c0de9290:	3004      	adds	r0, #4
c0de9292:	c18c      	stmia	r1!, {r2, r3, r7}
c0de9294:	2130      	movs	r1, #48	@ 0x30
c0de9296:	f002 ffad 	bl	c0dec1f4 <__aeabi_memclr>
c0de929a:	f8df 8058 	ldr.w	r8, [pc, #88]	@ c0de92f4 <nbgl_useCaseStatus+0x7c>
c0de929e:	eb09 0708 	add.w	r7, r9, r8
c0de92a2:	f7ff fbe7 	bl	c0de8a74 <reset_callbacks_and_context>
c0de92a6:	607d      	str	r5, [r7, #4]
c0de92a8:	b12e      	cbz	r6, c0de92b6 <nbgl_useCaseStatus+0x3e>
c0de92aa:	2003      	movs	r0, #3
c0de92ac:	f7fa fec0 	bl	c0de4030 <os_io_seph_cmd_piezo_play_tune>
c0de92b0:	4813      	ldr	r0, [pc, #76]	@ (c0de9300 <nbgl_useCaseStatus+0x88>)
c0de92b2:	4478      	add	r0, pc
c0de92b4:	e001      	b.n	c0de92ba <nbgl_useCaseStatus+0x42>
c0de92b6:	4811      	ldr	r0, [pc, #68]	@ (c0de92fc <nbgl_useCaseStatus+0x84>)
c0de92b8:	4478      	add	r0, pc
c0de92ba:	9003      	str	r0, [sp, #12]
c0de92bc:	2009      	movs	r0, #9
c0de92be:	2100      	movs	r1, #0
c0de92c0:	466a      	mov	r2, sp
c0de92c2:	f88d 0031 	strb.w	r0, [sp, #49]	@ 0x31
c0de92c6:	2002      	movs	r0, #2
c0de92c8:	f88d 1011 	strb.w	r1, [sp, #17]
c0de92cc:	f88d 0025 	strb.w	r0, [sp, #37]	@ 0x25
c0de92d0:	480c      	ldr	r0, [pc, #48]	@ (c0de9304 <nbgl_useCaseStatus+0x8c>)
c0de92d2:	9400      	str	r4, [sp, #0]
c0de92d4:	4478      	add	r0, pc
c0de92d6:	9008      	str	r0, [sp, #32]
c0de92d8:	480b      	ldr	r0, [pc, #44]	@ (c0de9308 <nbgl_useCaseStatus+0x90>)
c0de92da:	a90d      	add	r1, sp, #52	@ 0x34
c0de92dc:	4478      	add	r0, pc
c0de92de:	f7fe fe4f 	bl	c0de7f80 <nbgl_pageDrawInfo>
c0de92e2:	eb09 0108 	add.w	r1, r9, r8
c0de92e6:	6148      	str	r0, [r1, #20]
c0de92e8:	f001 fe85 	bl	c0deaff6 <OUTLINED_FUNCTION_3>
c0de92ec:	b010      	add	sp, #64	@ 0x40
c0de92ee:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de92f2:	bf00      	nop
c0de92f4:	00001bd4 	.word	0x00001bd4
c0de92f8:	0000644c 	.word	0x0000644c
c0de92fc:	00003874 	.word	0x00003874
c0de9300:	00003638 	.word	0x00003638
c0de9304:	00004d5d 	.word	0x00004d5d
c0de9308:	0000004d 	.word	0x0000004d

c0de930c <tickerCallback>:
c0de930c:	b510      	push	{r4, lr}
c0de930e:	4806      	ldr	r0, [pc, #24]	@ (c0de9328 <tickerCallback+0x1c>)
c0de9310:	eb09 0400 	add.w	r4, r9, r0
c0de9314:	6960      	ldr	r0, [r4, #20]
c0de9316:	f7ff f99e 	bl	c0de8656 <nbgl_pageRelease>
c0de931a:	6860      	ldr	r0, [r4, #4]
c0de931c:	b110      	cbz	r0, c0de9324 <tickerCallback+0x18>
c0de931e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de9322:	4700      	bx	r0
c0de9324:	bd10      	pop	{r4, pc}
c0de9326:	bf00      	nop
c0de9328:	00001bd4 	.word	0x00001bd4

c0de932c <pageCallback>:
c0de932c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9330:	b094      	sub	sp, #80	@ 0x50
c0de9332:	b350      	cbz	r0, c0de938a <pageCallback+0x5e>
c0de9334:	4605      	mov	r5, r0
c0de9336:	2801      	cmp	r0, #1
c0de9338:	d034      	beq.n	c0de93a4 <pageCallback+0x78>
c0de933a:	2d13      	cmp	r5, #19
c0de933c:	d043      	beq.n	c0de93c6 <pageCallback+0x9a>
c0de933e:	460c      	mov	r4, r1
c0de9340:	2d03      	cmp	r5, #3
c0de9342:	d055      	beq.n	c0de93f0 <pageCallback+0xc4>
c0de9344:	2d05      	cmp	r5, #5
c0de9346:	d05f      	beq.n	c0de9408 <pageCallback+0xdc>
c0de9348:	2d06      	cmp	r5, #6
c0de934a:	d075      	beq.n	c0de9438 <pageCallback+0x10c>
c0de934c:	2d07      	cmp	r5, #7
c0de934e:	d077      	beq.n	c0de9440 <pageCallback+0x114>
c0de9350:	2d08      	cmp	r5, #8
c0de9352:	f000 809f 	beq.w	c0de9494 <pageCallback+0x168>
c0de9356:	2d09      	cmp	r5, #9
c0de9358:	f000 80aa 	beq.w	c0de94b0 <pageCallback+0x184>
c0de935c:	2d0a      	cmp	r5, #10
c0de935e:	f000 80b1 	beq.w	c0de94c4 <pageCallback+0x198>
c0de9362:	2d0b      	cmp	r5, #11
c0de9364:	f000 80fb 	beq.w	c0de955e <pageCallback+0x232>
c0de9368:	2d0c      	cmp	r5, #12
c0de936a:	f000 8100 	beq.w	c0de956e <pageCallback+0x242>
c0de936e:	2d0d      	cmp	r5, #13
c0de9370:	f000 8107 	beq.w	c0de9582 <pageCallback+0x256>
c0de9374:	2d10      	cmp	r5, #16
c0de9376:	f000 8110 	beq.w	c0de959a <pageCallback+0x26e>
c0de937a:	2d11      	cmp	r5, #17
c0de937c:	f000 8115 	beq.w	c0de95aa <pageCallback+0x27e>
c0de9380:	2d02      	cmp	r5, #2
c0de9382:	f040 811e 	bne.w	c0de95c2 <pageCallback+0x296>
c0de9386:	48cc      	ldr	r0, [pc, #816]	@ (c0de96b8 <pageCallback+0x38c>)
c0de9388:	e165      	b.n	c0de9656 <pageCallback+0x32a>
c0de938a:	48cb      	ldr	r0, [pc, #812]	@ (c0de96b8 <pageCallback+0x38c>)
c0de938c:	eb09 0100 	add.w	r1, r9, r0
c0de9390:	f891 0060 	ldrb.w	r0, [r1, #96]	@ 0x60
c0de9394:	6889      	ldr	r1, [r1, #8]
c0de9396:	3801      	subs	r0, #1
c0de9398:	2900      	cmp	r1, #0
c0de939a:	f000 8129 	beq.w	c0de95f0 <pageCallback+0x2c4>
c0de939e:	b2c0      	uxtb	r0, r0
c0de93a0:	2101      	movs	r1, #1
c0de93a2:	e00b      	b.n	c0de93bc <pageCallback+0x90>
c0de93a4:	48c4      	ldr	r0, [pc, #784]	@ (c0de96b8 <pageCallback+0x38c>)
c0de93a6:	eb09 0100 	add.w	r1, r9, r0
c0de93aa:	f891 0060 	ldrb.w	r0, [r1, #96]	@ 0x60
c0de93ae:	6889      	ldr	r1, [r1, #8]
c0de93b0:	3001      	adds	r0, #1
c0de93b2:	2900      	cmp	r1, #0
c0de93b4:	f000 811c 	beq.w	c0de95f0 <pageCallback+0x2c4>
c0de93b8:	b2c0      	uxtb	r0, r0
c0de93ba:	2100      	movs	r1, #0
c0de93bc:	b014      	add	sp, #80	@ 0x50
c0de93be:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de93c2:	f000 bb35 	b.w	c0de9a30 <displayReviewPage>
c0de93c6:	48bb      	ldr	r0, [pc, #748]	@ (c0de96b4 <pageCallback+0x388>)
c0de93c8:	eb09 0100 	add.w	r1, r9, r0
c0de93cc:	f891 1021 	ldrb.w	r1, [r1, #33]	@ 0x21
c0de93d0:	2900      	cmp	r1, #0
c0de93d2:	f000 8114 	beq.w	c0de95fe <pageCallback+0x2d2>
c0de93d6:	eb09 0100 	add.w	r1, r9, r0
c0de93da:	6f89      	ldr	r1, [r1, #120]	@ 0x78
c0de93dc:	680a      	ldr	r2, [r1, #0]
c0de93de:	2a00      	cmp	r2, #0
c0de93e0:	f000 810d 	beq.w	c0de95fe <pageCallback+0x2d2>
c0de93e4:	4448      	add	r0, r9
c0de93e6:	2201      	movs	r2, #1
c0de93e8:	f880 2088 	strb.w	r2, [r0, #136]	@ 0x88
c0de93ec:	6808      	ldr	r0, [r1, #0]
c0de93ee:	e0e3      	b.n	c0de95b8 <pageCallback+0x28c>
c0de93f0:	48b1      	ldr	r0, [pc, #708]	@ (c0de96b8 <pageCallback+0x38c>)
c0de93f2:	2cff      	cmp	r4, #255	@ 0xff
c0de93f4:	f000 812f 	beq.w	c0de9656 <pageCallback+0x32a>
c0de93f8:	f819 0000 	ldrb.w	r0, [r9, r0]
c0de93fc:	1e81      	subs	r1, r0, #2
c0de93fe:	2902      	cmp	r1, #2
c0de9400:	f080 8148 	bcs.w	c0de9694 <pageCallback+0x368>
c0de9404:	4620      	mov	r0, r4
c0de9406:	e0f4      	b.n	c0de95f2 <pageCallback+0x2c6>
c0de9408:	a80c      	add	r0, sp, #48	@ 0x30
c0de940a:	49b1      	ldr	r1, [pc, #708]	@ (c0de96d0 <pageCallback+0x3a4>)
c0de940c:	2220      	movs	r2, #32
c0de940e:	4479      	add	r1, pc
c0de9410:	f002 fee6 	bl	c0dec1e0 <__aeabi_memcpy>
c0de9414:	4ca8      	ldr	r4, [pc, #672]	@ (c0de96b8 <pageCallback+0x38c>)
c0de9416:	eb09 0004 	add.w	r0, r9, r4
c0de941a:	6a00      	ldr	r0, [r0, #32]
c0de941c:	b108      	cbz	r0, c0de9422 <pageCallback+0xf6>
c0de941e:	f7ff f91a 	bl	c0de8656 <nbgl_pageRelease>
c0de9422:	48ac      	ldr	r0, [pc, #688]	@ (c0de96d4 <pageCallback+0x3a8>)
c0de9424:	a90c      	add	r1, sp, #48	@ 0x30
c0de9426:	4478      	add	r0, pc
c0de9428:	f7fe feb4 	bl	c0de8194 <nbgl_pageDrawConfirmation>
c0de942c:	eb09 0104 	add.w	r1, r9, r4
c0de9430:	6208      	str	r0, [r1, #32]
c0de9432:	f001 fde0 	bl	c0deaff6 <OUTLINED_FUNCTION_3>
c0de9436:	e115      	b.n	c0de9664 <pageCallback+0x338>
c0de9438:	489f      	ldr	r0, [pc, #636]	@ (c0de96b8 <pageCallback+0x38c>)
c0de943a:	4448      	add	r0, r9
c0de943c:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0de943e:	e10c      	b.n	c0de965a <pageCallback+0x32e>
c0de9440:	49a0      	ldr	r1, [pc, #640]	@ (c0de96c4 <pageCallback+0x398>)
c0de9442:	f10d 0830 	add.w	r8, sp, #48	@ 0x30
c0de9446:	221c      	movs	r2, #28
c0de9448:	4640      	mov	r0, r8
c0de944a:	4479      	add	r1, pc
c0de944c:	f002 fec8 	bl	c0dec1e0 <__aeabi_memcpy>
c0de9450:	489d      	ldr	r0, [pc, #628]	@ (c0de96c8 <pageCallback+0x39c>)
c0de9452:	ad07      	add	r5, sp, #28
c0de9454:	4629      	mov	r1, r5
c0de9456:	4478      	add	r0, pc
c0de9458:	e890 00dc 	ldmia.w	r0, {r2, r3, r4, r6, r7}
c0de945c:	f44f 3080 	mov.w	r0, #65536	@ 0x10000
c0de9460:	c1dc      	stmia	r1!, {r2, r3, r4, r6, r7}
c0de9462:	4e96      	ldr	r6, [pc, #600]	@ (c0de96bc <pageCallback+0x390>)
c0de9464:	9006      	str	r0, [sp, #24]
c0de9466:	eb09 0706 	add.w	r7, r9, r6
c0de946a:	6af8      	ldr	r0, [r7, #44]	@ 0x2c
c0de946c:	9003      	str	r0, [sp, #12]
c0de946e:	2000      	movs	r0, #0
c0de9470:	9004      	str	r0, [sp, #16]
c0de9472:	4640      	mov	r0, r8
c0de9474:	f7fa ffe4 	bl	c0de4440 <nbgl_layoutGet>
c0de9478:	4629      	mov	r1, r5
c0de947a:	65b8      	str	r0, [r7, #88]	@ 0x58
c0de947c:	f7fd fd34 	bl	c0de6ee8 <nbgl_layoutAddHeader>
c0de9480:	6af9      	ldr	r1, [r7, #44]	@ 0x2c
c0de9482:	200b      	movs	r0, #11
c0de9484:	f001 fde5 	bl	c0deb052 <OUTLINED_FUNCTION_15>
c0de9488:	6af9      	ldr	r1, [r7, #44]	@ 0x2c
c0de948a:	2804      	cmp	r0, #4
c0de948c:	f080 80c1 	bcs.w	c0de9612 <pageCallback+0x2e6>
c0de9490:	460c      	mov	r4, r1
c0de9492:	e0ca      	b.n	c0de962a <pageCallback+0x2fe>
c0de9494:	4888      	ldr	r0, [pc, #544]	@ (c0de96b8 <pageCallback+0x38c>)
c0de9496:	2c00      	cmp	r4, #0
c0de9498:	f040 80db 	bne.w	c0de9652 <pageCallback+0x326>
c0de949c:	eb09 0100 	add.w	r1, r9, r0
c0de94a0:	6a49      	ldr	r1, [r1, #36]	@ 0x24
c0de94a2:	2900      	cmp	r1, #0
c0de94a4:	f000 80d5 	beq.w	c0de9652 <pageCallback+0x326>
c0de94a8:	b014      	add	sp, #80	@ 0x50
c0de94aa:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de94ae:	4708      	bx	r1
c0de94b0:	4881      	ldr	r0, [pc, #516]	@ (c0de96b8 <pageCallback+0x38c>)
c0de94b2:	4448      	add	r0, r9
c0de94b4:	6981      	ldr	r1, [r0, #24]
c0de94b6:	2900      	cmp	r1, #0
c0de94b8:	f000 80d4 	beq.w	c0de9664 <pageCallback+0x338>
c0de94bc:	fab4 f084 	clz	r0, r4
c0de94c0:	0940      	lsrs	r0, r0, #5
c0de94c2:	e05a      	b.n	c0de957a <pageCallback+0x24e>
c0de94c4:	487b      	ldr	r0, [pc, #492]	@ (c0de96b4 <pageCallback+0x388>)
c0de94c6:	f8df 81f0 	ldr.w	r8, [pc, #496]	@ c0de96b8 <pageCallback+0x38c>
c0de94ca:	2700      	movs	r7, #0
c0de94cc:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de94d0:	f04f 0a0b 	mov.w	sl, #11
c0de94d4:	4448      	add	r0, r9
c0de94d6:	eb09 0608 	add.w	r6, r9, r8
c0de94da:	f890 4020 	ldrb.w	r4, [r0, #32]
c0de94de:	e9d0 b506 	ldrd	fp, r5, [r0, #24]
c0de94e2:	200b      	movs	r0, #11
c0de94e4:	e9c6 770c 	strd	r7, r7, [r6, #48]	@ 0x30
c0de94e8:	e9c6 770e 	strd	r7, r7, [r6, #56]	@ 0x38
c0de94ec:	4629      	mov	r1, r5
c0de94ee:	4623      	mov	r3, r4
c0de94f0:	f002 fa9b 	bl	c0deba2a <nbgl_getTextNbLinesInWidth>
c0de94f4:	f100 010a 	add.w	r1, r0, #10
c0de94f8:	e9c6 b50d 	strd	fp, r5, [r6, #52]	@ 0x34
c0de94fc:	f886 4033 	strb.w	r4, [r6, #51]	@ 0x33
c0de9500:	f886 7031 	strb.w	r7, [r6, #49]	@ 0x31
c0de9504:	fbb1 f1fa 	udiv	r1, r1, sl
c0de9508:	b2ca      	uxtb	r2, r1
c0de950a:	f886 1030 	strb.w	r1, [r6, #48]	@ 0x30
c0de950e:	2a02      	cmp	r2, #2
c0de9510:	d31e      	bcc.n	c0de9550 <pageCallback+0x224>
c0de9512:	3a01      	subs	r2, #1
c0de9514:	241a      	movs	r4, #26
c0de9516:	eb02 0342 	add.w	r3, r2, r2, lsl #1
c0de951a:	3319      	adds	r3, #25
c0de951c:	b29b      	uxth	r3, r3
c0de951e:	fbb3 f4f4 	udiv	r4, r3, r4
c0de9522:	b2e4      	uxtb	r4, r4
c0de9524:	fbb4 f5fa 	udiv	r5, r4, sl
c0de9528:	fb05 441a 	mls	r4, r5, sl, r4
c0de952c:	f06f 050a 	mvn.w	r5, #10
c0de9530:	fb02 0005 	mla	r0, r2, r5, r0
c0de9534:	f44f 728f 	mov.w	r2, #286	@ 0x11e
c0de9538:	fbb3 f2f2 	udiv	r2, r3, r2
c0de953c:	b2c0      	uxtb	r0, r0
c0de953e:	4420      	add	r0, r4
c0de9540:	4411      	add	r1, r2
c0de9542:	280b      	cmp	r0, #11
c0de9544:	eb09 0008 	add.w	r0, r9, r8
c0de9548:	bf88      	it	hi
c0de954a:	3101      	addhi	r1, #1
c0de954c:	f880 1030 	strb.w	r1, [r0, #48]	@ 0x30
c0de9550:	2000      	movs	r0, #0
c0de9552:	2101      	movs	r1, #1
c0de9554:	b014      	add	sp, #80	@ 0x50
c0de9556:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de955a:	f001 bb31 	b.w	c0deabc0 <displayDetailsPage>
c0de955e:	4856      	ldr	r0, [pc, #344]	@ (c0de96b8 <pageCallback+0x38c>)
c0de9560:	4448      	add	r0, r9
c0de9562:	6981      	ldr	r1, [r0, #24]
c0de9564:	2900      	cmp	r1, #0
c0de9566:	f000 807d 	beq.w	c0de9664 <pageCallback+0x338>
c0de956a:	2001      	movs	r0, #1
c0de956c:	e005      	b.n	c0de957a <pageCallback+0x24e>
c0de956e:	4852      	ldr	r0, [pc, #328]	@ (c0de96b8 <pageCallback+0x38c>)
c0de9570:	4448      	add	r0, r9
c0de9572:	6981      	ldr	r1, [r0, #24]
c0de9574:	2900      	cmp	r1, #0
c0de9576:	d075      	beq.n	c0de9664 <pageCallback+0x338>
c0de9578:	2000      	movs	r0, #0
c0de957a:	b014      	add	sp, #80	@ 0x50
c0de957c:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9580:	4708      	bx	r1
c0de9582:	484c      	ldr	r0, [pc, #304]	@ (c0de96b4 <pageCallback+0x388>)
c0de9584:	eb09 0100 	add.w	r1, r9, r0
c0de9588:	4448      	add	r0, r9
c0de958a:	6a49      	ldr	r1, [r1, #36]	@ 0x24
c0de958c:	2900      	cmp	r1, #0
c0de958e:	d06c      	beq.n	c0de966a <pageCallback+0x33e>
c0de9590:	7c80      	ldrb	r0, [r0, #18]
c0de9592:	4420      	add	r0, r4
c0de9594:	eb01 1000 	add.w	r0, r1, r0, lsl #4
c0de9598:	e06c      	b.n	c0de9674 <pageCallback+0x348>
c0de959a:	4846      	ldr	r0, [pc, #280]	@ (c0de96b4 <pageCallback+0x388>)
c0de959c:	2100      	movs	r1, #0
c0de959e:	4448      	add	r0, r9
c0de95a0:	6781      	str	r1, [r0, #120]	@ 0x78
c0de95a2:	f880 1089 	strb.w	r1, [r0, #137]	@ 0x89
c0de95a6:	2010      	movs	r0, #16
c0de95a8:	e006      	b.n	c0de95b8 <pageCallback+0x28c>
c0de95aa:	4a42      	ldr	r2, [pc, #264]	@ (c0de96b4 <pageCallback+0x388>)
c0de95ac:	2101      	movs	r1, #1
c0de95ae:	eb09 0002 	add.w	r0, r9, r2
c0de95b2:	f001 fd29 	bl	c0deb008 <OUTLINED_FUNCTION_6>
c0de95b6:	d066      	beq.n	c0de9686 <pageCallback+0x35a>
c0de95b8:	b014      	add	sp, #80	@ 0x50
c0de95ba:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de95be:	f001 b87f 	b.w	c0dea6c0 <displaySecurityReport>
c0de95c2:	4e3d      	ldr	r6, [pc, #244]	@ (c0de96b8 <pageCallback+0x38c>)
c0de95c4:	eb09 0006 	add.w	r0, r9, r6
c0de95c8:	6ac3      	ldr	r3, [r0, #44]	@ 0x2c
c0de95ca:	b133      	cbz	r3, c0de95da <pageCallback+0x2ae>
c0de95cc:	eb09 0006 	add.w	r0, r9, r6
c0de95d0:	4621      	mov	r1, r4
c0de95d2:	f890 2060 	ldrb.w	r2, [r0, #96]	@ 0x60
c0de95d6:	4628      	mov	r0, r5
c0de95d8:	4798      	blx	r3
c0de95da:	eb09 0006 	add.w	r0, r9, r6
c0de95de:	68c2      	ldr	r2, [r0, #12]
c0de95e0:	2a00      	cmp	r2, #0
c0de95e2:	d03f      	beq.n	c0de9664 <pageCallback+0x338>
c0de95e4:	4628      	mov	r0, r5
c0de95e6:	4621      	mov	r1, r4
c0de95e8:	b014      	add	sp, #80	@ 0x50
c0de95ea:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de95ee:	4710      	bx	r2
c0de95f0:	b2c0      	uxtb	r0, r0
c0de95f2:	2100      	movs	r1, #0
c0de95f4:	b014      	add	sp, #80	@ 0x50
c0de95f6:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de95fa:	f7ff bbd3 	b.w	c0de8da4 <displayGenericContextPage>
c0de95fe:	eb09 0100 	add.w	r1, r9, r0
c0de9602:	2200      	movs	r2, #0
c0de9604:	6c48      	ldr	r0, [r1, #68]	@ 0x44
c0de9606:	314c      	adds	r1, #76	@ 0x4c
c0de9608:	b014      	add	sp, #80	@ 0x50
c0de960a:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de960e:	f001 b973 	b.w	c0dea8f8 <displayInfosListModal>
c0de9612:	2080      	movs	r0, #128	@ 0x80
c0de9614:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de9618:	2303      	movs	r3, #3
c0de961a:	9001      	str	r0, [sp, #4]
c0de961c:	4828      	ldr	r0, [pc, #160]	@ (c0de96c0 <pageCallback+0x394>)
c0de961e:	eb09 0400 	add.w	r4, r9, r0
c0de9622:	200b      	movs	r0, #11
c0de9624:	9400      	str	r4, [sp, #0]
c0de9626:	f002 fa0f 	bl	c0deba48 <nbgl_textReduceOnNbLines>
c0de962a:	9405      	str	r4, [sp, #20]
c0de962c:	eb09 0406 	add.w	r4, r9, r6
c0de9630:	6da0      	ldr	r0, [r4, #88]	@ 0x58
c0de9632:	a903      	add	r1, sp, #12
c0de9634:	f7fc ffe7 	bl	c0de6606 <nbgl_layoutAddQRCode>
c0de9638:	6da0      	ldr	r0, [r4, #88]	@ 0x58
c0de963a:	4924      	ldr	r1, [pc, #144]	@ (c0de96cc <pageCallback+0x3a0>)
c0de963c:	2216      	movs	r2, #22
c0de963e:	2309      	movs	r3, #9
c0de9640:	4479      	add	r1, pc
c0de9642:	f7fd fc2a 	bl	c0de6e9a <nbgl_layoutAddFooter>
c0de9646:	6da0      	ldr	r0, [r4, #88]	@ 0x58
c0de9648:	f7fd ff6b 	bl	c0de7522 <nbgl_layoutDraw>
c0de964c:	f002 f993 	bl	c0deb976 <nbgl_refresh>
c0de9650:	e008      	b.n	c0de9664 <pageCallback+0x338>
c0de9652:	2c01      	cmp	r4, #1
c0de9654:	d106      	bne.n	c0de9664 <pageCallback+0x338>
c0de9656:	4448      	add	r0, r9
c0de9658:	6840      	ldr	r0, [r0, #4]
c0de965a:	b118      	cbz	r0, c0de9664 <pageCallback+0x338>
c0de965c:	b014      	add	sp, #80	@ 0x50
c0de965e:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9662:	4700      	bx	r0
c0de9664:	b014      	add	sp, #80	@ 0x50
c0de9666:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de966a:	6a81      	ldr	r1, [r0, #40]	@ 0x28
c0de966c:	7c80      	ldrb	r0, [r0, #18]
c0de966e:	4420      	add	r0, r4
c0de9670:	b2c0      	uxtb	r0, r0
c0de9672:	4788      	blx	r1
c0de9674:	e9d0 3100 	ldrd	r3, r1, [r0]
c0de9678:	6882      	ldr	r2, [r0, #8]
c0de967a:	4618      	mov	r0, r3
c0de967c:	b014      	add	sp, #80	@ 0x50
c0de967e:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9682:	f000 bf3f 	b.w	c0dea504 <displayFullValuePage>
c0de9686:	eb09 0002 	add.w	r0, r9, r2
c0de968a:	f890 0089 	ldrb.w	r0, [r0, #137]	@ 0x89
c0de968e:	b120      	cbz	r0, c0de969a <pageCallback+0x36e>
c0de9690:	6948      	ldr	r0, [r1, #20]
c0de9692:	e003      	b.n	c0de969c <pageCallback+0x370>
c0de9694:	b938      	cbnz	r0, c0de96a6 <pageCallback+0x37a>
c0de9696:	4620      	mov	r0, r4
c0de9698:	e68f      	b.n	c0de93ba <pageCallback+0x8e>
c0de969a:	6988      	ldr	r0, [r1, #24]
c0de969c:	b014      	add	sp, #80	@ 0x50
c0de969e:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de96a2:	f001 b91d 	b.w	c0dea8e0 <displayCustomizedSecurityReport>
c0de96a6:	4620      	mov	r0, r4
c0de96a8:	2100      	movs	r1, #0
c0de96aa:	b014      	add	sp, #80	@ 0x50
c0de96ac:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de96b0:	f7ff ba32 	b.w	c0de8b18 <displaySettingsPage>
c0de96b4:	0000191c 	.word	0x0000191c
c0de96b8:	00001bd4 	.word	0x00001bd4
c0de96bc:	00001c50 	.word	0x00001c50
c0de96c0:	00001b54 	.word	0x00001b54
c0de96c4:	0000633a 	.word	0x0000633a
c0de96c8:	000062fa 	.word	0x000062fa
c0de96cc:	00004522 	.word	0x00004522
c0de96d0:	00006356 	.word	0x00006356
c0de96d4:	00000527 	.word	0x00000527

c0de96d8 <nbgl_useCaseReviewStatus>:
c0de96d8:	460a      	mov	r2, r1
c0de96da:	b198      	cbz	r0, c0de9704 <nbgl_useCaseReviewStatus+0x2c>
c0de96dc:	2801      	cmp	r0, #1
c0de96de:	d016      	beq.n	c0de970e <nbgl_useCaseReviewStatus+0x36>
c0de96e0:	2802      	cmp	r0, #2
c0de96e2:	d019      	beq.n	c0de9718 <nbgl_useCaseReviewStatus+0x40>
c0de96e4:	2803      	cmp	r0, #3
c0de96e6:	d01c      	beq.n	c0de9722 <nbgl_useCaseReviewStatus+0x4a>
c0de96e8:	2804      	cmp	r0, #4
c0de96ea:	d01f      	beq.n	c0de972c <nbgl_useCaseReviewStatus+0x54>
c0de96ec:	2807      	cmp	r0, #7
c0de96ee:	d022      	beq.n	c0de9736 <nbgl_useCaseReviewStatus+0x5e>
c0de96f0:	2806      	cmp	r0, #6
c0de96f2:	d025      	beq.n	c0de9740 <nbgl_useCaseReviewStatus+0x68>
c0de96f4:	2805      	cmp	r0, #5
c0de96f6:	bf18      	it	ne
c0de96f8:	4770      	bxne	lr
c0de96fa:	4815      	ldr	r0, [pc, #84]	@ (c0de9750 <nbgl_useCaseReviewStatus+0x78>)
c0de96fc:	2100      	movs	r1, #0
c0de96fe:	4478      	add	r0, pc
c0de9700:	f7ff bdba 	b.w	c0de9278 <nbgl_useCaseStatus>
c0de9704:	4813      	ldr	r0, [pc, #76]	@ (c0de9754 <nbgl_useCaseReviewStatus+0x7c>)
c0de9706:	2101      	movs	r1, #1
c0de9708:	4478      	add	r0, pc
c0de970a:	f7ff bdb5 	b.w	c0de9278 <nbgl_useCaseStatus>
c0de970e:	4812      	ldr	r0, [pc, #72]	@ (c0de9758 <nbgl_useCaseReviewStatus+0x80>)
c0de9710:	2100      	movs	r1, #0
c0de9712:	4478      	add	r0, pc
c0de9714:	f7ff bdb0 	b.w	c0de9278 <nbgl_useCaseStatus>
c0de9718:	4810      	ldr	r0, [pc, #64]	@ (c0de975c <nbgl_useCaseReviewStatus+0x84>)
c0de971a:	2101      	movs	r1, #1
c0de971c:	4478      	add	r0, pc
c0de971e:	f7ff bdab 	b.w	c0de9278 <nbgl_useCaseStatus>
c0de9722:	480f      	ldr	r0, [pc, #60]	@ (c0de9760 <nbgl_useCaseReviewStatus+0x88>)
c0de9724:	2100      	movs	r1, #0
c0de9726:	4478      	add	r0, pc
c0de9728:	f7ff bda6 	b.w	c0de9278 <nbgl_useCaseStatus>
c0de972c:	4807      	ldr	r0, [pc, #28]	@ (c0de974c <nbgl_useCaseReviewStatus+0x74>)
c0de972e:	2101      	movs	r1, #1
c0de9730:	4478      	add	r0, pc
c0de9732:	f7ff bda1 	b.w	c0de9278 <nbgl_useCaseStatus>
c0de9736:	480c      	ldr	r0, [pc, #48]	@ (c0de9768 <nbgl_useCaseReviewStatus+0x90>)
c0de9738:	2100      	movs	r1, #0
c0de973a:	4478      	add	r0, pc
c0de973c:	f7ff bd9c 	b.w	c0de9278 <nbgl_useCaseStatus>
c0de9740:	4808      	ldr	r0, [pc, #32]	@ (c0de9764 <nbgl_useCaseReviewStatus+0x8c>)
c0de9742:	2101      	movs	r1, #1
c0de9744:	4478      	add	r0, pc
c0de9746:	f7ff bd97 	b.w	c0de9278 <nbgl_useCaseStatus>
c0de974a:	bf00      	nop
c0de974c:	000040e8 	.word	0x000040e8
c0de9750:	0000418e 	.word	0x0000418e
c0de9754:	00004369 	.word	0x00004369
c0de9758:	000048c0 	.word	0x000048c0
c0de975c:	00004437 	.word	0x00004437
c0de9760:	000047a1 	.word	0x000047a1
c0de9764:	000042c7 	.word	0x000042c7
c0de9768:	000040ef 	.word	0x000040ef

c0de976c <nbgl_useCaseChoice>:
c0de976c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9770:	b088      	sub	sp, #32
c0de9772:	4683      	mov	fp, r0
c0de9774:	4668      	mov	r0, sp
c0de9776:	460e      	mov	r6, r1
c0de9778:	2118      	movs	r1, #24
c0de977a:	461c      	mov	r4, r3
c0de977c:	4617      	mov	r7, r2
c0de977e:	3008      	adds	r0, #8
c0de9780:	f002 fd38 	bl	c0dec1f4 <__aeabi_memclr>
c0de9784:	b324      	cbz	r4, c0de97d0 <nbgl_useCaseChoice+0x64>
c0de9786:	f8dd 8040 	ldr.w	r8, [sp, #64]	@ 0x40
c0de978a:	f1b8 0f00 	cmp.w	r8, #0
c0de978e:	d01f      	beq.n	c0de97d0 <nbgl_useCaseChoice+0x64>
c0de9790:	4811      	ldr	r0, [pc, #68]	@ (c0de97d8 <nbgl_useCaseChoice+0x6c>)
c0de9792:	f8dd a044 	ldr.w	sl, [sp, #68]	@ 0x44
c0de9796:	eb09 0500 	add.w	r5, r9, r0
c0de979a:	f7ff f96b 	bl	c0de8a74 <reset_callbacks_and_context>
c0de979e:	2000      	movs	r0, #0
c0de97a0:	f8c5 a018 	str.w	sl, [r5, #24]
c0de97a4:	e9cd 6700 	strd	r6, r7, [sp]
c0de97a8:	f8cd 8018 	str.w	r8, [sp, #24]
c0de97ac:	9405      	str	r4, [sp, #20]
c0de97ae:	f8cd b00c 	str.w	fp, [sp, #12]
c0de97b2:	4669      	mov	r1, sp
c0de97b4:	f88d 0011 	strb.w	r0, [sp, #17]
c0de97b8:	2009      	movs	r0, #9
c0de97ba:	f88d 001e 	strb.w	r0, [sp, #30]
c0de97be:	f88d 001c 	strb.w	r0, [sp, #28]
c0de97c2:	4806      	ldr	r0, [pc, #24]	@ (c0de97dc <nbgl_useCaseChoice+0x70>)
c0de97c4:	4478      	add	r0, pc
c0de97c6:	f7fe fce5 	bl	c0de8194 <nbgl_pageDrawConfirmation>
c0de97ca:	6168      	str	r0, [r5, #20]
c0de97cc:	f001 fc13 	bl	c0deaff6 <OUTLINED_FUNCTION_3>
c0de97d0:	b008      	add	sp, #32
c0de97d2:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de97d6:	bf00      	nop
c0de97d8:	00001bd4 	.word	0x00001bd4
c0de97dc:	fffffb65 	.word	0xfffffb65

c0de97e0 <layoutTouchCallback>:
c0de97e0:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de97e2:	b087      	sub	sp, #28
c0de97e4:	2811      	cmp	r0, #17
c0de97e6:	d01d      	beq.n	c0de9824 <layoutTouchCallback+0x44>
c0de97e8:	2812      	cmp	r0, #18
c0de97ea:	d027      	beq.n	c0de983c <layoutTouchCallback+0x5c>
c0de97ec:	2819      	cmp	r0, #25
c0de97ee:	d02e      	beq.n	c0de984e <layoutTouchCallback+0x6e>
c0de97f0:	2815      	cmp	r0, #21
c0de97f2:	d13c      	bne.n	c0de986e <layoutTouchCallback+0x8e>
c0de97f4:	2900      	cmp	r1, #0
c0de97f6:	d047      	beq.n	c0de9888 <layoutTouchCallback+0xa8>
c0de97f8:	493e      	ldr	r1, [pc, #248]	@ (c0de98f4 <layoutTouchCallback+0x114>)
c0de97fa:	2400      	movs	r4, #0
c0de97fc:	eb09 0201 	add.w	r2, r9, r1
c0de9800:	eb09 0501 	add.w	r5, r9, r1
c0de9804:	f882 4089 	strb.w	r4, [r2, #137]	@ 0x89
c0de9808:	6e10      	ldr	r0, [r2, #96]	@ 0x60
c0de980a:	f892 205c 	ldrb.w	r2, [r2, #92]	@ 0x5c
c0de980e:	2a00      	cmp	r2, #0
c0de9810:	d05f      	beq.n	c0de98d2 <layoutTouchCallback+0xf2>
c0de9812:	f105 0368 	add.w	r3, r5, #104	@ 0x68
c0de9816:	6fed      	ldr	r5, [r5, #124]	@ 0x7c
c0de9818:	cb0e      	ldmia	r3, {r1, r2, r3}
c0de981a:	e9cd 5400 	strd	r5, r4, [sp]
c0de981e:	f000 fbd7 	bl	c0de9fd0 <useCaseReviewStreamingStart>
c0de9822:	e064      	b.n	c0de98ee <layoutTouchCallback+0x10e>
c0de9824:	4a33      	ldr	r2, [pc, #204]	@ (c0de98f4 <layoutTouchCallback+0x114>)
c0de9826:	2101      	movs	r1, #1
c0de9828:	eb09 0002 	add.w	r0, r9, r2
c0de982c:	f001 fbec 	bl	c0deb008 <OUTLINED_FUNCTION_6>
c0de9830:	d032      	beq.n	c0de9898 <layoutTouchCallback+0xb8>
c0de9832:	b007      	add	sp, #28
c0de9834:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de9838:	f000 bf42 	b.w	c0dea6c0 <displaySecurityReport>
c0de983c:	482d      	ldr	r0, [pc, #180]	@ (c0de98f4 <layoutTouchCallback+0x114>)
c0de983e:	2118      	movs	r1, #24
c0de9840:	eb09 0400 	add.w	r4, r9, r0
c0de9844:	2001      	movs	r0, #1
c0de9846:	f001 fc16 	bl	c0deb076 <OUTLINED_FUNCTION_19>
c0de984a:	6660      	str	r0, [r4, #100]	@ 0x64
c0de984c:	e04f      	b.n	c0de98ee <layoutTouchCallback+0x10e>
c0de984e:	4a29      	ldr	r2, [pc, #164]	@ (c0de98f4 <layoutTouchCallback+0x114>)
c0de9850:	eb09 0002 	add.w	r0, r9, r2
c0de9854:	6f80      	ldr	r0, [r0, #120]	@ 0x78
c0de9856:	b349      	cbz	r1, c0de98ac <layoutTouchCallback+0xcc>
c0de9858:	7801      	ldrb	r1, [r0, #0]
c0de985a:	f011 0f16 	tst.w	r1, #22
c0de985e:	d101      	bne.n	c0de9864 <layoutTouchCallback+0x84>
c0de9860:	6940      	ldr	r0, [r0, #20]
c0de9862:	b350      	cbz	r0, c0de98ba <layoutTouchCallback+0xda>
c0de9864:	b007      	add	sp, #28
c0de9866:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de986a:	f000 bac9 	b.w	c0de9e00 <displayInitialWarning>
c0de986e:	2809      	cmp	r0, #9
c0de9870:	d13d      	bne.n	c0de98ee <layoutTouchCallback+0x10e>
c0de9872:	4821      	ldr	r0, [pc, #132]	@ (c0de98f8 <layoutTouchCallback+0x118>)
c0de9874:	4448      	add	r0, r9
c0de9876:	6982      	ldr	r2, [r0, #24]
c0de9878:	b3ca      	cbz	r2, c0de98ee <layoutTouchCallback+0x10e>
c0de987a:	fab1 f081 	clz	r0, r1
c0de987e:	0940      	lsrs	r0, r0, #5
c0de9880:	b007      	add	sp, #28
c0de9882:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de9886:	4710      	bx	r2
c0de9888:	481a      	ldr	r0, [pc, #104]	@ (c0de98f4 <layoutTouchCallback+0x114>)
c0de988a:	4448      	add	r0, r9
c0de988c:	6fc1      	ldr	r1, [r0, #124]	@ 0x7c
c0de988e:	2000      	movs	r0, #0
c0de9890:	b007      	add	sp, #28
c0de9892:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de9896:	4708      	bx	r1
c0de9898:	eb09 0002 	add.w	r0, r9, r2
c0de989c:	2214      	movs	r2, #20
c0de989e:	f890 0089 	ldrb.w	r0, [r0, #137]	@ 0x89
c0de98a2:	2800      	cmp	r0, #0
c0de98a4:	bf08      	it	eq
c0de98a6:	2218      	moveq	r2, #24
c0de98a8:	5888      	ldr	r0, [r1, r2]
c0de98aa:	e001      	b.n	c0de98b0 <layoutTouchCallback+0xd0>
c0de98ac:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0de98ae:	6940      	ldr	r0, [r0, #20]
c0de98b0:	b007      	add	sp, #28
c0de98b2:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de98b6:	f001 b813 	b.w	c0dea8e0 <displayCustomizedSecurityReport>
c0de98ba:	eb09 0102 	add.w	r1, r9, r2
c0de98be:	2400      	movs	r4, #0
c0de98c0:	eb09 0502 	add.w	r5, r9, r2
c0de98c4:	f881 4089 	strb.w	r4, [r1, #137]	@ 0x89
c0de98c8:	6e08      	ldr	r0, [r1, #96]	@ 0x60
c0de98ca:	f891 105c 	ldrb.w	r1, [r1, #92]	@ 0x5c
c0de98ce:	2900      	cmp	r1, #0
c0de98d0:	d19f      	bne.n	c0de9812 <layoutTouchCallback+0x32>
c0de98d2:	f105 0764 	add.w	r7, r5, #100	@ 0x64
c0de98d6:	f8d5 c07c 	ldr.w	ip, [r5, #124]	@ 0x7c
c0de98da:	353c      	adds	r5, #60	@ 0x3c
c0de98dc:	cfce      	ldmia	r7, {r1, r2, r3, r6, r7}
c0de98de:	e9cd 6700 	strd	r6, r7, [sp]
c0de98e2:	e9cd 4404 	strd	r4, r4, [sp, #16]
c0de98e6:	e9cd 5c02 	strd	r5, ip, [sp, #8]
c0de98ea:	f000 f913 	bl	c0de9b14 <useCaseReview>
c0de98ee:	b007      	add	sp, #28
c0de98f0:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de98f2:	bf00      	nop
c0de98f4:	0000191c 	.word	0x0000191c
c0de98f8:	00001bd4 	.word	0x00001bd4

c0de98fc <nbgl_useCaseConfirm>:
c0de98fc:	b570      	push	{r4, r5, r6, lr}
c0de98fe:	b088      	sub	sp, #32
c0de9900:	4c0f      	ldr	r4, [pc, #60]	@ (c0de9940 <nbgl_useCaseConfirm+0x44>)
c0de9902:	9e0c      	ldr	r6, [sp, #48]	@ 0x30
c0de9904:	f10d 0c14 	add.w	ip, sp, #20
c0de9908:	eb09 0504 	add.w	r5, r9, r4
c0de990c:	61ee      	str	r6, [r5, #28]
c0de990e:	4e0d      	ldr	r6, [pc, #52]	@ (c0de9944 <nbgl_useCaseConfirm+0x48>)
c0de9910:	e8ac 004c 	stmia.w	ip!, {r2, r3, r6}
c0de9914:	2200      	movs	r2, #0
c0de9916:	9204      	str	r2, [sp, #16]
c0de9918:	4b0b      	ldr	r3, [pc, #44]	@ (c0de9948 <nbgl_useCaseConfirm+0x4c>)
c0de991a:	447b      	add	r3, pc
c0de991c:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0de9920:	6a28      	ldr	r0, [r5, #32]
c0de9922:	b108      	cbz	r0, c0de9928 <nbgl_useCaseConfirm+0x2c>
c0de9924:	f7fe fe97 	bl	c0de8656 <nbgl_pageRelease>
c0de9928:	4808      	ldr	r0, [pc, #32]	@ (c0de994c <nbgl_useCaseConfirm+0x50>)
c0de992a:	4669      	mov	r1, sp
c0de992c:	4478      	add	r0, pc
c0de992e:	f7fe fc31 	bl	c0de8194 <nbgl_pageDrawConfirmation>
c0de9932:	eb09 0104 	add.w	r1, r9, r4
c0de9936:	6208      	str	r0, [r1, #32]
c0de9938:	f001 fb5d 	bl	c0deaff6 <OUTLINED_FUNCTION_3>
c0de993c:	b008      	add	sp, #32
c0de993e:	bd70      	pop	{r4, r5, r6, pc}
c0de9940:	00001bd4 	.word	0x00001bd4
c0de9944:	01090009 	.word	0x01090009
c0de9948:	0000341e 	.word	0x0000341e
c0de994c:	00000021 	.word	0x00000021

c0de9950 <pageModalCallback>:
c0de9950:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de9952:	460c      	mov	r4, r1
c0de9954:	280e      	cmp	r0, #14
c0de9956:	d008      	beq.n	c0de996a <pageModalCallback+0x1a>
c0de9958:	4605      	mov	r5, r0
c0de995a:	280f      	cmp	r0, #15
c0de995c:	d117      	bne.n	c0de998e <pageModalCallback+0x3e>
c0de995e:	4832      	ldr	r0, [pc, #200]	@ (c0de9a28 <pageModalCallback+0xd8>)
c0de9960:	4448      	add	r0, r9
c0de9962:	e9d0 2113 	ldrd	r2, r1, [r0, #76]	@ 0x4c
c0de9966:	6d43      	ldr	r3, [r0, #84]	@ 0x54
c0de9968:	e005      	b.n	c0de9976 <pageModalCallback+0x26>
c0de996a:	482f      	ldr	r0, [pc, #188]	@ (c0de9a28 <pageModalCallback+0xd8>)
c0de996c:	4448      	add	r0, r9
c0de996e:	6b40      	ldr	r0, [r0, #52]	@ 0x34
c0de9970:	e9d0 2100 	ldrd	r2, r1, [r0]
c0de9974:	6883      	ldr	r3, [r0, #8]
c0de9976:	f852 0024 	ldr.w	r0, [r2, r4, lsl #2]
c0de997a:	eb04 0244 	add.w	r2, r4, r4, lsl #1
c0de997e:	f851 1024 	ldr.w	r1, [r1, r4, lsl #2]
c0de9982:	eb03 02c2 	add.w	r2, r3, r2, lsl #3
c0de9986:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de998a:	f000 bdbb 	b.w	c0dea504 <displayFullValuePage>
c0de998e:	4e27      	ldr	r6, [pc, #156]	@ (c0de9a2c <pageModalCallback+0xdc>)
c0de9990:	eb09 0706 	add.w	r7, r9, r6
c0de9994:	6a38      	ldr	r0, [r7, #32]
c0de9996:	f7fe fe5e 	bl	c0de8656 <nbgl_pageRelease>
c0de999a:	2000      	movs	r0, #0
c0de999c:	2d02      	cmp	r5, #2
c0de999e:	6238      	str	r0, [r7, #32]
c0de99a0:	d032      	beq.n	c0de9a08 <pageModalCallback+0xb8>
c0de99a2:	2d14      	cmp	r5, #20
c0de99a4:	d00f      	beq.n	c0de99c6 <pageModalCallback+0x76>
c0de99a6:	2d04      	cmp	r5, #4
c0de99a8:	d01e      	beq.n	c0de99e8 <pageModalCallback+0x98>
c0de99aa:	2d05      	cmp	r5, #5
c0de99ac:	d024      	beq.n	c0de99f8 <pageModalCallback+0xa8>
c0de99ae:	2d09      	cmp	r5, #9
c0de99b0:	d029      	beq.n	c0de9a06 <pageModalCallback+0xb6>
c0de99b2:	2d03      	cmp	r5, #3
c0de99b4:	d137      	bne.n	c0de9a26 <pageModalCallback+0xd6>
c0de99b6:	2cff      	cmp	r4, #255	@ 0xff
c0de99b8:	d026      	beq.n	c0de9a08 <pageModalCallback+0xb8>
c0de99ba:	4620      	mov	r0, r4
c0de99bc:	2100      	movs	r1, #0
c0de99be:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de99c2:	f001 b8fd 	b.w	c0deabc0 <displayDetailsPage>
c0de99c6:	4818      	ldr	r0, [pc, #96]	@ (c0de9a28 <pageModalCallback+0xd8>)
c0de99c8:	eb09 0100 	add.w	r1, r9, r0
c0de99cc:	f891 1088 	ldrb.w	r1, [r1, #136]	@ 0x88
c0de99d0:	2902      	cmp	r1, #2
c0de99d2:	d119      	bne.n	c0de9a08 <pageModalCallback+0xb8>
c0de99d4:	4448      	add	r0, r9
c0de99d6:	2101      	movs	r1, #1
c0de99d8:	f880 1088 	strb.w	r1, [r0, #136]	@ 0x88
c0de99dc:	6f80      	ldr	r0, [r0, #120]	@ 0x78
c0de99de:	6800      	ldr	r0, [r0, #0]
c0de99e0:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de99e4:	f000 be6c 	b.w	c0dea6c0 <displaySecurityReport>
c0de99e8:	2cff      	cmp	r4, #255	@ 0xff
c0de99ea:	d00d      	beq.n	c0de9a08 <pageModalCallback+0xb8>
c0de99ec:	4620      	mov	r0, r4
c0de99ee:	2100      	movs	r1, #0
c0de99f0:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de99f4:	f001 b9b6 	b.w	c0dead64 <displayTagValueListModalPage>
c0de99f8:	b934      	cbnz	r4, c0de9a08 <pageModalCallback+0xb8>
c0de99fa:	20ff      	movs	r0, #255	@ 0xff
c0de99fc:	2101      	movs	r1, #1
c0de99fe:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de9a02:	f7ff b9cf 	b.w	c0de8da4 <displayGenericContextPage>
c0de9a06:	b12c      	cbz	r4, c0de9a14 <pageModalCallback+0xc4>
c0de9a08:	f001 ffdd 	bl	c0deb9c6 <nbgl_screenRedraw>
c0de9a0c:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de9a10:	f001 bfb1 	b.w	c0deb976 <nbgl_refresh>
c0de9a14:	eb09 0006 	add.w	r0, r9, r6
c0de9a18:	69c0      	ldr	r0, [r0, #28]
c0de9a1a:	b120      	cbz	r0, c0de9a26 <pageModalCallback+0xd6>
c0de9a1c:	4780      	blx	r0
c0de9a1e:	eb09 0006 	add.w	r0, r9, r6
c0de9a22:	2100      	movs	r1, #0
c0de9a24:	61c1      	str	r1, [r0, #28]
c0de9a26:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de9a28:	0000191c 	.word	0x0000191c
c0de9a2c:	00001bd4 	.word	0x00001bd4

c0de9a30 <displayReviewPage>:
c0de9a30:	b570      	push	{r4, r5, r6, lr}
c0de9a32:	b090      	sub	sp, #64	@ 0x40
c0de9a34:	460c      	mov	r4, r1
c0de9a36:	4605      	mov	r5, r0
c0de9a38:	4668      	mov	r0, sp
c0de9a3a:	2140      	movs	r1, #64	@ 0x40
c0de9a3c:	f002 fbda 	bl	c0dec1f4 <__aeabi_memclr>
c0de9a40:	4e28      	ldr	r6, [pc, #160]	@ (c0de9ae4 <displayReviewPage+0xb4>)
c0de9a42:	eb09 0006 	add.w	r0, r9, r6
c0de9a46:	f890 0061 	ldrb.w	r0, [r0, #97]	@ 0x61
c0de9a4a:	b108      	cbz	r0, c0de9a50 <displayReviewPage+0x20>
c0de9a4c:	42a8      	cmp	r0, r5
c0de9a4e:	d947      	bls.n	c0de9ae0 <displayReviewPage+0xb0>
c0de9a50:	eb09 0006 	add.w	r0, r9, r6
c0de9a54:	6882      	ldr	r2, [r0, #8]
c0de9a56:	f880 5060 	strb.w	r5, [r0, #96]	@ 0x60
c0de9a5a:	2a00      	cmp	r2, #0
c0de9a5c:	d040      	beq.n	c0de9ae0 <displayReviewPage+0xb0>
c0de9a5e:	4669      	mov	r1, sp
c0de9a60:	4628      	mov	r0, r5
c0de9a62:	4790      	blx	r2
c0de9a64:	b3e0      	cbz	r0, c0de9ae0 <displayReviewPage+0xb0>
c0de9a66:	2009      	movs	r0, #9
c0de9a68:	2100      	movs	r1, #0
c0de9a6a:	f88d 0006 	strb.w	r0, [sp, #6]
c0de9a6e:	f89d 000c 	ldrb.w	r0, [sp, #12]
c0de9a72:	f88d 1004 	strb.w	r1, [sp, #4]
c0de9a76:	9100      	str	r1, [sp, #0]
c0de9a78:	2806      	cmp	r0, #6
c0de9a7a:	d010      	beq.n	c0de9a9e <displayReviewPage+0x6e>
c0de9a7c:	2804      	cmp	r0, #4
c0de9a7e:	d014      	beq.n	c0de9aaa <displayReviewPage+0x7a>
c0de9a80:	2805      	cmp	r0, #5
c0de9a82:	d016      	beq.n	c0de9ab2 <displayReviewPage+0x82>
c0de9a84:	2802      	cmp	r0, #2
c0de9a86:	d11b      	bne.n	c0de9ac0 <displayReviewPage+0x90>
c0de9a88:	eb09 0006 	add.w	r0, r9, r6
c0de9a8c:	f890 1060 	ldrb.w	r1, [r0, #96]	@ 0x60
c0de9a90:	3101      	adds	r1, #1
c0de9a92:	f880 1061 	strb.w	r1, [r0, #97]	@ 0x61
c0de9a96:	200b      	movs	r0, #11
c0de9a98:	f88d 001c 	strb.w	r0, [sp, #28]
c0de9a9c:	e010      	b.n	c0de9ac0 <displayReviewPage+0x90>
c0de9a9e:	200b      	movs	r0, #11
c0de9aa0:	f88d 101d 	strb.w	r1, [sp, #29]
c0de9aa4:	f88d 0038 	strb.w	r0, [sp, #56]	@ 0x38
c0de9aa8:	e00a      	b.n	c0de9ac0 <displayReviewPage+0x90>
c0de9aaa:	2000      	movs	r0, #0
c0de9aac:	f88d 001d 	strb.w	r0, [sp, #29]
c0de9ab0:	e006      	b.n	c0de9ac0 <displayReviewPage+0x90>
c0de9ab2:	2000      	movs	r0, #0
c0de9ab4:	f88d 001d 	strb.w	r0, [sp, #29]
c0de9ab8:	f640 1001 	movw	r0, #2305	@ 0x901
c0de9abc:	f8ad 001a 	strh.w	r0, [sp, #26]
c0de9ac0:	4809      	ldr	r0, [pc, #36]	@ (c0de9ae8 <displayReviewPage+0xb8>)
c0de9ac2:	eb09 0506 	add.w	r5, r9, r6
c0de9ac6:	466a      	mov	r2, sp
c0de9ac8:	f105 0160 	add.w	r1, r5, #96	@ 0x60
c0de9acc:	4478      	add	r0, pc
c0de9ace:	f7fe fdbf 	bl	c0de8650 <nbgl_pageDrawGenericContent>
c0de9ad2:	6168      	str	r0, [r5, #20]
c0de9ad4:	2001      	movs	r0, #1
c0de9ad6:	2c00      	cmp	r4, #0
c0de9ad8:	bf18      	it	ne
c0de9ada:	2002      	movne	r0, #2
c0de9adc:	f001 ff50 	bl	c0deb980 <nbgl_refreshSpecial>
c0de9ae0:	b010      	add	sp, #64	@ 0x40
c0de9ae2:	bd70      	pop	{r4, r5, r6, pc}
c0de9ae4:	00001bd4 	.word	0x00001bd4
c0de9ae8:	fffff85d 	.word	0xfffff85d

c0de9aec <nbgl_useCaseReview>:
c0de9aec:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de9aee:	b087      	sub	sp, #28
c0de9af0:	f001 fa70 	bl	c0deafd4 <OUTLINED_FUNCTION_0>
c0de9af4:	2001      	movs	r0, #1
c0de9af6:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de9af8:	462a      	mov	r2, r5
c0de9afa:	4623      	mov	r3, r4
c0de9afc:	9005      	str	r0, [sp, #20]
c0de9afe:	2000      	movs	r0, #0
c0de9b00:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de9b04:	9004      	str	r0, [sp, #16]
c0de9b06:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de9b08:	4631      	mov	r1, r6
c0de9b0a:	f001 fa83 	bl	c0deb014 <OUTLINED_FUNCTION_8>
c0de9b0e:	b007      	add	sp, #28
c0de9b10:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

c0de9b14 <useCaseReview>:
c0de9b14:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de9b18:	4688      	mov	r8, r1
c0de9b1a:	4682      	mov	sl, r0
c0de9b1c:	4840      	ldr	r0, [pc, #256]	@ (c0de9c20 <useCaseReview+0x10c>)
c0de9b1e:	4941      	ldr	r1, [pc, #260]	@ (c0de9c24 <useCaseReview+0x110>)
c0de9b20:	4614      	mov	r4, r2
c0de9b22:	2202      	movs	r2, #2
c0de9b24:	f04f 0b00 	mov.w	fp, #0
c0de9b28:	4e40      	ldr	r6, [pc, #256]	@ (c0de9c2c <useCaseReview+0x118>)
c0de9b2a:	461f      	mov	r7, r3
c0de9b2c:	f849 a000 	str.w	sl, [r9, r0]
c0de9b30:	f809 2001 	strb.w	r2, [r9, r1]
c0de9b34:	4448      	add	r0, r9
c0de9b36:	eb09 0506 	add.w	r5, r9, r6
c0de9b3a:	9a0d      	ldr	r2, [sp, #52]	@ 0x34
c0de9b3c:	6042      	str	r2, [r0, #4]
c0de9b3e:	eb09 0001 	add.w	r0, r9, r1
c0de9b42:	493b      	ldr	r1, [pc, #236]	@ (c0de9c30 <useCaseReview+0x11c>)
c0de9b44:	f8c0 b010 	str.w	fp, [r0, #16]
c0de9b48:	4479      	add	r1, pc
c0de9b4a:	6181      	str	r1, [r0, #24]
c0de9b4c:	4836      	ldr	r0, [pc, #216]	@ (c0de9c28 <useCaseReview+0x114>)
c0de9b4e:	2103      	movs	r1, #3
c0de9b50:	4448      	add	r0, r9
c0de9b52:	7301      	strb	r1, [r0, #12]
c0de9b54:	6085      	str	r5, [r0, #8]
c0de9b56:	4628      	mov	r0, r5
c0de9b58:	21a8      	movs	r1, #168	@ 0xa8
c0de9b5a:	f002 fb4b 	bl	c0dec1f4 <__aeabi_memclr>
c0de9b5e:	2001      	movs	r0, #1
c0de9b60:	f8a5 b024 	strh.w	fp, [r5, #36]	@ 0x24
c0de9b64:	f809 0006 	strb.w	r0, [r9, r6]
c0de9b68:	4832      	ldr	r0, [pc, #200]	@ (c0de9c34 <useCaseReview+0x120>)
c0de9b6a:	4478      	add	r0, pc
c0de9b6c:	6228      	str	r0, [r5, #32]
c0de9b6e:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de9b70:	616f      	str	r7, [r5, #20]
c0de9b72:	9401      	str	r4, [sp, #4]
c0de9b74:	60ac      	str	r4, [r5, #8]
c0de9b76:	f885 b004 	strb.w	fp, [r5, #4]
c0de9b7a:	61e8      	str	r0, [r5, #28]
c0de9b7c:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de9b7e:	f001 f995 	bl	c0deaeac <initWarningTipBox>
c0de9b82:	2004      	movs	r0, #4
c0de9b84:	4641      	mov	r1, r8
c0de9b86:	f885 0038 	strb.w	r0, [r5, #56]	@ 0x38
c0de9b8a:	f105 003c 	add.w	r0, r5, #60	@ 0x3c
c0de9b8e:	e891 00dc 	ldmia.w	r1, {r2, r3, r4, r6, r7}
c0de9b92:	c0dc      	stmia	r0!, {r2, r3, r4, r6, r7}
c0de9b94:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de9b98:	66e8      	str	r0, [r5, #108]	@ 0x6c
c0de9b9a:	e9dd 050e 	ldrd	r0, r5, [sp, #56]	@ 0x38
c0de9b9e:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
c0de9ba0:	b190      	cbz	r0, c0de9bc8 <useCaseReview+0xb4>
c0de9ba2:	4922      	ldr	r1, [pc, #136]	@ (c0de9c2c <useCaseReview+0x118>)
c0de9ba4:	2203      	movs	r2, #3
c0de9ba6:	eb09 0001 	add.w	r0, r9, r1
c0de9baa:	f880 2070 	strb.w	r2, [r0, #112]	@ 0x70
c0de9bae:	9a01      	ldr	r2, [sp, #4]
c0de9bb0:	b343      	cbz	r3, c0de9c04 <useCaseReview+0xf0>
c0de9bb2:	eb09 0001 	add.w	r0, r9, r1
c0de9bb6:	210b      	movs	r1, #11
c0de9bb8:	f880 1080 	strb.w	r1, [r0, #128]	@ 0x80
c0de9bbc:	4921      	ldr	r1, [pc, #132]	@ (c0de9c44 <useCaseReview+0x130>)
c0de9bbe:	e9c0 321d 	strd	r3, r2, [r0, #116]	@ 0x74
c0de9bc2:	4479      	add	r1, pc
c0de9bc4:	67c1      	str	r1, [r0, #124]	@ 0x7c
c0de9bc6:	e00a      	b.n	c0de9bde <useCaseReview+0xca>
c0de9bc8:	4818      	ldr	r0, [pc, #96]	@ (c0de9c2c <useCaseReview+0x118>)
c0de9bca:	2102      	movs	r1, #2
c0de9bcc:	9a01      	ldr	r2, [sp, #4]
c0de9bce:	4448      	add	r0, r9
c0de9bd0:	f880 1070 	strb.w	r1, [r0, #112]	@ 0x70
c0de9bd4:	f100 0174 	add.w	r1, r0, #116	@ 0x74
c0de9bd8:	4650      	mov	r0, sl
c0de9bda:	f000 fa69 	bl	c0dea0b0 <prepareReviewLastPage>
c0de9bde:	f3ca 1000 	ubfx	r0, sl, #4, #1
c0de9be2:	f7ff f825 	bl	c0de8c30 <getNbPagesForGenericContents>
c0de9be6:	4a18      	ldr	r2, [pc, #96]	@ (c0de9c48 <useCaseReview+0x134>)
c0de9be8:	4601      	mov	r1, r0
c0de9bea:	2001      	movs	r0, #1
c0de9bec:	447a      	add	r2, pc
c0de9bee:	f7fe ff57 	bl	c0de8aa0 <prepareNavInfo>
c0de9bf2:	b10d      	cbz	r5, c0de9bf8 <useCaseReview+0xe4>
c0de9bf4:	f001 fa05 	bl	c0deb002 <OUTLINED_FUNCTION_5>
c0de9bf8:	2000      	movs	r0, #0
c0de9bfa:	2101      	movs	r1, #1
c0de9bfc:	e8bd 4dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de9c00:	f7ff b8d0 	b.w	c0de8da4 <displayGenericContextPage>
c0de9c04:	f01a 0007 	ands.w	r0, sl, #7
c0de9c08:	d004      	beq.n	c0de9c14 <useCaseReview+0x100>
c0de9c0a:	2801      	cmp	r0, #1
c0de9c0c:	d105      	bne.n	c0de9c1a <useCaseReview+0x106>
c0de9c0e:	4b0b      	ldr	r3, [pc, #44]	@ (c0de9c3c <useCaseReview+0x128>)
c0de9c10:	447b      	add	r3, pc
c0de9c12:	e7ce      	b.n	c0de9bb2 <useCaseReview+0x9e>
c0de9c14:	4b08      	ldr	r3, [pc, #32]	@ (c0de9c38 <useCaseReview+0x124>)
c0de9c16:	447b      	add	r3, pc
c0de9c18:	e7cb      	b.n	c0de9bb2 <useCaseReview+0x9e>
c0de9c1a:	4b09      	ldr	r3, [pc, #36]	@ (c0de9c40 <useCaseReview+0x12c>)
c0de9c1c:	447b      	add	r3, pc
c0de9c1e:	e7c8      	b.n	c0de9bb2 <useCaseReview+0x9e>
c0de9c20:	00001c50 	.word	0x00001c50
c0de9c24:	00001bd4 	.word	0x00001bd4
c0de9c28:	0000191c 	.word	0x0000191c
c0de9c2c:	000019ac 	.word	0x000019ac
c0de9c30:	00001341 	.word	0x00001341
c0de9c34:	00004565 	.word	0x00004565
c0de9c38:	00003f52 	.word	0x00003f52
c0de9c3c:	00003f27 	.word	0x00003f27
c0de9c40:	000043f7 	.word	0x000043f7
c0de9c44:	00003ca4 	.word	0x00003ca4
c0de9c48:	00003cb3 	.word	0x00003cb3

c0de9c4c <nbgl_useCaseReviewBlindSigning>:
c0de9c4c:	b510      	push	{r4, lr}
c0de9c4e:	b086      	sub	sp, #24
c0de9c50:	9c0b      	ldr	r4, [sp, #44]	@ 0x2c
c0de9c52:	9404      	str	r4, [sp, #16]
c0de9c54:	4c06      	ldr	r4, [pc, #24]	@ (c0de9c70 <nbgl_useCaseReviewBlindSigning+0x24>)
c0de9c56:	447c      	add	r4, pc
c0de9c58:	9403      	str	r4, [sp, #12]
c0de9c5a:	9c0a      	ldr	r4, [sp, #40]	@ 0x28
c0de9c5c:	9402      	str	r4, [sp, #8]
c0de9c5e:	9c09      	ldr	r4, [sp, #36]	@ 0x24
c0de9c60:	9401      	str	r4, [sp, #4]
c0de9c62:	9c08      	ldr	r4, [sp, #32]
c0de9c64:	9400      	str	r4, [sp, #0]
c0de9c66:	f000 f805 	bl	c0de9c74 <nbgl_useCaseAdvancedReview>
c0de9c6a:	b006      	add	sp, #24
c0de9c6c:	bd10      	pop	{r4, pc}
c0de9c6e:	bf00      	nop
c0de9c70:	00005a8a 	.word	0x00005a8a

c0de9c74 <nbgl_useCaseAdvancedReview>:
c0de9c74:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9c78:	b088      	sub	sp, #32
c0de9c7a:	e9cd 2306 	strd	r2, r3, [sp, #24]
c0de9c7e:	4688      	mov	r8, r1
c0de9c80:	4606      	mov	r6, r0
c0de9c82:	f7fe fef7 	bl	c0de8a74 <reset_callbacks_and_context>
c0de9c86:	e9dd ba12 	ldrd	fp, sl, [sp, #72]	@ 0x48
c0de9c8a:	9f14      	ldr	r7, [sp, #80]	@ 0x50
c0de9c8c:	e9dd e410 	ldrd	lr, r4, [sp, #64]	@ 0x40
c0de9c90:	f1bb 0f00 	cmp.w	fp, #0
c0de9c94:	d008      	beq.n	c0de9ca8 <nbgl_useCaseAdvancedReview+0x34>
c0de9c96:	482b      	ldr	r0, [pc, #172]	@ (c0de9d44 <nbgl_useCaseAdvancedReview+0xd0>)
c0de9c98:	4659      	mov	r1, fp
c0de9c9a:	2220      	movs	r2, #32
c0de9c9c:	4675      	mov	r5, lr
c0de9c9e:	4448      	add	r0, r9
c0de9ca0:	303c      	adds	r0, #60	@ 0x3c
c0de9ca2:	f002 fa9d 	bl	c0dec1e0 <__aeabi_memcpy>
c0de9ca6:	46ae      	mov	lr, r5
c0de9ca8:	e9dd 2306 	ldrd	r2, r3, [sp, #24]
c0de9cac:	f1ba 0f00 	cmp.w	sl, #0
c0de9cb0:	d039      	beq.n	c0de9d26 <nbgl_useCaseAdvancedReview+0xb2>
c0de9cb2:	f8da 0000 	ldr.w	r0, [sl]
c0de9cb6:	2808      	cmp	r0, #8
c0de9cb8:	d00a      	beq.n	c0de9cd0 <nbgl_useCaseAdvancedReview+0x5c>
c0de9cba:	b960      	cbnz	r0, c0de9cd6 <nbgl_useCaseAdvancedReview+0x62>
c0de9cbc:	f8da 0014 	ldr.w	r0, [sl, #20]
c0de9cc0:	b958      	cbnz	r0, c0de9cda <nbgl_useCaseAdvancedReview+0x66>
c0de9cc2:	f8da 0018 	ldr.w	r0, [sl, #24]
c0de9cc6:	b940      	cbnz	r0, c0de9cda <nbgl_useCaseAdvancedReview+0x66>
c0de9cc8:	f8da 0028 	ldr.w	r0, [sl, #40]	@ 0x28
c0de9ccc:	b928      	cbnz	r0, c0de9cda <nbgl_useCaseAdvancedReview+0x66>
c0de9cce:	e02a      	b.n	c0de9d26 <nbgl_useCaseAdvancedReview+0xb2>
c0de9cd0:	f046 0680 	orr.w	r6, r6, #128	@ 0x80
c0de9cd4:	e001      	b.n	c0de9cda <nbgl_useCaseAdvancedReview+0x66>
c0de9cd6:	f046 0640 	orr.w	r6, r6, #64	@ 0x40
c0de9cda:	481a      	ldr	r0, [pc, #104]	@ (c0de9d44 <nbgl_useCaseAdvancedReview+0xd0>)
c0de9cdc:	2500      	movs	r5, #0
c0de9cde:	4448      	add	r0, r9
c0de9ce0:	f100 0168 	add.w	r1, r0, #104	@ 0x68
c0de9ce4:	f880 505c 	strb.w	r5, [r0, #92]	@ 0x5c
c0de9ce8:	2501      	movs	r5, #1
c0de9cea:	e9c0 6818 	strd	r6, r8, [r0, #96]	@ 0x60
c0de9cee:	e9c0 4a1d 	strd	r4, sl, [r0, #116]	@ 0x74
c0de9cf2:	67c7      	str	r7, [r0, #124]	@ 0x7c
c0de9cf4:	e8a1 400c 	stmia.w	r1!, {r2, r3, lr}
c0de9cf8:	f880 508c 	strb.w	r5, [r0, #140]	@ 0x8c
c0de9cfc:	f8da 0028 	ldr.w	r0, [sl, #40]	@ 0x28
c0de9d00:	b120      	cbz	r0, c0de9d0c <nbgl_useCaseAdvancedReview+0x98>
c0de9d02:	b008      	add	sp, #32
c0de9d04:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9d08:	f000 b81e 	b.w	c0de9d48 <displayPrelude>
c0de9d0c:	f89a 0000 	ldrb.w	r0, [sl]
c0de9d10:	f010 0f16 	tst.w	r0, #22
c0de9d14:	d102      	bne.n	c0de9d1c <nbgl_useCaseAdvancedReview+0xa8>
c0de9d16:	f8da 0014 	ldr.w	r0, [sl, #20]
c0de9d1a:	b120      	cbz	r0, c0de9d26 <nbgl_useCaseAdvancedReview+0xb2>
c0de9d1c:	b008      	add	sp, #32
c0de9d1e:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9d22:	f000 b86d 	b.w	c0de9e00 <displayInitialWarning>
c0de9d26:	2001      	movs	r0, #1
c0de9d28:	2500      	movs	r5, #0
c0de9d2a:	4641      	mov	r1, r8
c0de9d2c:	e9cd e400 	strd	lr, r4, [sp]
c0de9d30:	e9cd b702 	strd	fp, r7, [sp, #8]
c0de9d34:	e9cd 5004 	strd	r5, r0, [sp, #16]
c0de9d38:	4630      	mov	r0, r6
c0de9d3a:	f7ff feeb 	bl	c0de9b14 <useCaseReview>
c0de9d3e:	b008      	add	sp, #32
c0de9d40:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de9d44:	0000191c 	.word	0x0000191c

c0de9d48 <displayPrelude>:
c0de9d48:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de9d4c:	b09a      	sub	sp, #104	@ 0x68
c0de9d4e:	4929      	ldr	r1, [pc, #164]	@ (c0de9df4 <displayPrelude+0xac>)
c0de9d50:	2009      	movs	r0, #9
c0de9d52:	f04f 0c00 	mov.w	ip, #0
c0de9d56:	f10d 0828 	add.w	r8, sp, #40	@ 0x28
c0de9d5a:	f88d 004a 	strb.w	r0, [sp, #74]	@ 0x4a
c0de9d5e:	2019      	movs	r0, #25
c0de9d60:	f8cd c044 	str.w	ip, [sp, #68]	@ 0x44
c0de9d64:	eb09 0501 	add.w	r5, r9, r1
c0de9d68:	f8ad 0048 	strh.w	r0, [sp, #72]	@ 0x48
c0de9d6c:	6fa9      	ldr	r1, [r5, #120]	@ 0x78
c0de9d6e:	6a89      	ldr	r1, [r1, #40]	@ 0x28
c0de9d70:	e9d1 2103 	ldrd	r2, r1, [r1, #12]
c0de9d74:	e9cd 210f 	strd	r2, r1, [sp, #60]	@ 0x3c
c0de9d78:	4642      	mov	r2, r8
c0de9d7a:	491f      	ldr	r1, [pc, #124]	@ (c0de9df8 <displayPrelude+0xb0>)
c0de9d7c:	4479      	add	r1, pc
c0de9d7e:	e891 00d9 	ldmia.w	r1, {r0, r3, r4, r6, r7}
c0de9d82:	c2d9      	stmia	r2!, {r0, r3, r4, r6, r7}
c0de9d84:	2001      	movs	r0, #1
c0de9d86:	f885 0089 	strb.w	r0, [r5, #137]	@ 0x89
c0de9d8a:	481c      	ldr	r0, [pc, #112]	@ (c0de9dfc <displayPrelude+0xb4>)
c0de9d8c:	f8cd c05c 	str.w	ip, [sp, #92]	@ 0x5c
c0de9d90:	f8cd c050 	str.w	ip, [sp, #80]	@ 0x50
c0de9d94:	4478      	add	r0, pc
c0de9d96:	9016      	str	r0, [sp, #88]	@ 0x58
c0de9d98:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0de9d9c:	f8ad 004c 	strh.w	r0, [sp, #76]	@ 0x4c
c0de9da0:	a813      	add	r0, sp, #76	@ 0x4c
c0de9da2:	f7fa fb4d 	bl	c0de4440 <nbgl_layoutGet>
c0de9da6:	4641      	mov	r1, r8
c0de9da8:	f8c5 0080 	str.w	r0, [r5, #128]	@ 0x80
c0de9dac:	f7fd f89c 	bl	c0de6ee8 <nbgl_layoutAddHeader>
c0de9db0:	ac01      	add	r4, sp, #4
c0de9db2:	2124      	movs	r1, #36	@ 0x24
c0de9db4:	4620      	mov	r0, r4
c0de9db6:	f002 fa1d 	bl	c0dec1f4 <__aeabi_memclr>
c0de9dba:	6fa9      	ldr	r1, [r5, #120]	@ 0x78
c0de9dbc:	f8d5 0080 	ldr.w	r0, [r5, #128]	@ 0x80
c0de9dc0:	6a89      	ldr	r1, [r1, #40]	@ 0x28
c0de9dc2:	e9d1 2300 	ldrd	r2, r3, [r1]
c0de9dc6:	6889      	ldr	r1, [r1, #8]
c0de9dc8:	9107      	str	r1, [sp, #28]
c0de9dca:	4621      	mov	r1, r4
c0de9dcc:	9202      	str	r2, [sp, #8]
c0de9dce:	9305      	str	r3, [sp, #20]
c0de9dd0:	f7fc fc10 	bl	c0de65f4 <nbgl_layoutAddContentCenter>
c0de9dd4:	f8d5 0080 	ldr.w	r0, [r5, #128]	@ 0x80
c0de9dd8:	a90f      	add	r1, sp, #60	@ 0x3c
c0de9dda:	f7fc fd79 	bl	c0de68d0 <nbgl_layoutAddChoiceButtons>
c0de9dde:	f001 f910 	bl	c0deb002 <OUTLINED_FUNCTION_5>
c0de9de2:	f8d5 0080 	ldr.w	r0, [r5, #128]	@ 0x80
c0de9de6:	f7fd fb9c 	bl	c0de7522 <nbgl_layoutDraw>
c0de9dea:	f001 fdc4 	bl	c0deb976 <nbgl_refresh>
c0de9dee:	b01a      	add	sp, #104	@ 0x68
c0de9df0:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de9df4:	0000191c 	.word	0x0000191c
c0de9df8:	00005aac 	.word	0x00005aac
c0de9dfc:	fffffa49 	.word	0xfffffa49

c0de9e00 <displayInitialWarning>:
c0de9e00:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de9e02:	b099      	sub	sp, #100	@ 0x64
c0de9e04:	4860      	ldr	r0, [pc, #384]	@ (c0de9f88 <displayInitialWarning+0x188>)
c0de9e06:	a90e      	add	r1, sp, #56	@ 0x38
c0de9e08:	4478      	add	r0, pc
c0de9e0a:	e890 003c 	ldmia.w	r0, {r2, r3, r4, r5}
c0de9e0e:	c13c      	stmia	r1!, {r2, r3, r4, r5}
c0de9e10:	485e      	ldr	r0, [pc, #376]	@ (c0de9f8c <displayInitialWarning+0x18c>)
c0de9e12:	ac09      	add	r4, sp, #36	@ 0x24
c0de9e14:	4621      	mov	r1, r4
c0de9e16:	4478      	add	r0, pc
c0de9e18:	e890 00ec 	ldmia.w	r0, {r2, r3, r5, r6, r7}
c0de9e1c:	c1ec      	stmia	r1!, {r2, r3, r5, r6, r7}
c0de9e1e:	4d58      	ldr	r5, [pc, #352]	@ (c0de9f80 <displayInitialWarning+0x180>)
c0de9e20:	eb09 0705 	add.w	r7, r9, r5
c0de9e24:	6fb8      	ldr	r0, [r7, #120]	@ 0x78
c0de9e26:	6806      	ldr	r6, [r0, #0]
c0de9e28:	2001      	movs	r0, #1
c0de9e2a:	f887 0089 	strb.w	r0, [r7, #137]	@ 0x89
c0de9e2e:	4858      	ldr	r0, [pc, #352]	@ (c0de9f90 <displayInitialWarning+0x190>)
c0de9e30:	4478      	add	r0, pc
c0de9e32:	9015      	str	r0, [sp, #84]	@ 0x54
c0de9e34:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0de9e38:	f8ad 0048 	strh.w	r0, [sp, #72]	@ 0x48
c0de9e3c:	2000      	movs	r0, #0
c0de9e3e:	9016      	str	r0, [sp, #88]	@ 0x58
c0de9e40:	9013      	str	r0, [sp, #76]	@ 0x4c
c0de9e42:	a812      	add	r0, sp, #72	@ 0x48
c0de9e44:	f7fa fafc 	bl	c0de4440 <nbgl_layoutGet>
c0de9e48:	4621      	mov	r1, r4
c0de9e4a:	f8c7 0080 	str.w	r0, [r7, #128]	@ 0x80
c0de9e4e:	f7fd f84b 	bl	c0de6ee8 <nbgl_layoutAddHeader>
c0de9e52:	f026 0139 	bic.w	r1, r6, #57	@ 0x39
c0de9e56:	f026 0009 	bic.w	r0, r6, #9
c0de9e5a:	2800      	cmp	r0, #0
c0de9e5c:	fab1 f181 	clz	r1, r1
c0de9e60:	bf18      	it	ne
c0de9e62:	2001      	movne	r0, #1
c0de9e64:	0949      	lsrs	r1, r1, #5
c0de9e66:	ea00 0401 	and.w	r4, r0, r1
c0de9e6a:	6fb8      	ldr	r0, [r7, #120]	@ 0x78
c0de9e6c:	6801      	ldr	r1, [r0, #0]
c0de9e6e:	b139      	cbz	r1, c0de9e80 <displayInitialWarning+0x80>
c0de9e70:	4848      	ldr	r0, [pc, #288]	@ (c0de9f94 <displayInitialWarning+0x194>)
c0de9e72:	4949      	ldr	r1, [pc, #292]	@ (c0de9f98 <displayInitialWarning+0x198>)
c0de9e74:	2c00      	cmp	r4, #0
c0de9e76:	4479      	add	r1, pc
c0de9e78:	4478      	add	r0, pc
c0de9e7a:	bf18      	it	ne
c0de9e7c:	4601      	movne	r1, r0
c0de9e7e:	e001      	b.n	c0de9e84 <displayInitialWarning+0x84>
c0de9e80:	6a01      	ldr	r1, [r0, #32]
c0de9e82:	b139      	cbz	r1, c0de9e94 <displayInitialWarning+0x94>
c0de9e84:	eb09 0005 	add.w	r0, r9, r5
c0de9e88:	2211      	movs	r2, #17
c0de9e8a:	2309      	movs	r3, #9
c0de9e8c:	f8d0 0080 	ldr.w	r0, [r0, #128]	@ 0x80
c0de9e90:	f7fb f89a 	bl	c0de4fc8 <nbgl_layoutAddTopRightButton>
c0de9e94:	eb09 0005 	add.w	r0, r9, r5
c0de9e98:	6f87      	ldr	r7, [r0, #120]	@ 0x78
c0de9e9a:	6838      	ldr	r0, [r7, #0]
c0de9e9c:	b198      	cbz	r0, c0de9ec6 <displayInitialWarning+0xc6>
c0de9e9e:	4668      	mov	r0, sp
c0de9ea0:	2124      	movs	r1, #36	@ 0x24
c0de9ea2:	f002 f9a7 	bl	c0dec1f4 <__aeabi_memclr>
c0de9ea6:	483d      	ldr	r0, [pc, #244]	@ (c0de9f9c <displayInitialWarning+0x19c>)
c0de9ea8:	4478      	add	r0, pc
c0de9eaa:	9001      	str	r0, [sp, #4]
c0de9eac:	b19c      	cbz	r4, c0de9ed6 <displayInitialWarning+0xd6>
c0de9eae:	483c      	ldr	r0, [pc, #240]	@ (c0de9fa0 <displayInitialWarning+0x1a0>)
c0de9eb0:	4478      	add	r0, pc
c0de9eb2:	9004      	str	r0, [sp, #16]
c0de9eb4:	06b0      	lsls	r0, r6, #26
c0de9eb6:	d422      	bmi.n	c0de9efe <displayInitialWarning+0xfe>
c0de9eb8:	483c      	ldr	r0, [pc, #240]	@ (c0de9fac <displayInitialWarning+0x1ac>)
c0de9eba:	2405      	movs	r4, #5
c0de9ebc:	4478      	add	r0, pc
c0de9ebe:	9006      	str	r0, [sp, #24]
c0de9ec0:	483b      	ldr	r0, [pc, #236]	@ (c0de9fb0 <displayInitialWarning+0x1b0>)
c0de9ec2:	4478      	add	r0, pc
c0de9ec4:	e042      	b.n	c0de9f4c <displayInitialWarning+0x14c>
c0de9ec6:	69f9      	ldr	r1, [r7, #28]
c0de9ec8:	b371      	cbz	r1, c0de9f28 <displayInitialWarning+0x128>
c0de9eca:	f001 f8ae 	bl	c0deb02a <OUTLINED_FUNCTION_10>
c0de9ece:	f7fc fb91 	bl	c0de65f4 <nbgl_layoutAddContentCenter>
c0de9ed2:	2408      	movs	r4, #8
c0de9ed4:	e042      	b.n	c0de9f5c <displayInitialWarning+0x15c>
c0de9ed6:	482b      	ldr	r0, [pc, #172]	@ (c0de9f84 <displayInitialWarning+0x184>)
c0de9ed8:	4448      	add	r0, r9
c0de9eda:	9005      	str	r0, [sp, #20]
c0de9edc:	68f9      	ldr	r1, [r7, #12]
c0de9ede:	4b35      	ldr	r3, [pc, #212]	@ (c0de9fb4 <displayInitialWarning+0x1b4>)
c0de9ee0:	447b      	add	r3, pc
c0de9ee2:	2900      	cmp	r1, #0
c0de9ee4:	bf18      	it	ne
c0de9ee6:	460b      	movne	r3, r1
c0de9ee8:	4a33      	ldr	r2, [pc, #204]	@ (c0de9fb8 <displayInitialWarning+0x1b8>)
c0de9eea:	2180      	movs	r1, #128	@ 0x80
c0de9eec:	447a      	add	r2, pc
c0de9eee:	f001 fdcd 	bl	c0deba8c <snprintf>
c0de9ef2:	07b0      	lsls	r0, r6, #30
c0de9ef4:	d407      	bmi.n	c0de9f06 <displayInitialWarning+0x106>
c0de9ef6:	0770      	lsls	r0, r6, #29
c0de9ef8:	d418      	bmi.n	c0de9f2c <displayInitialWarning+0x12c>
c0de9efa:	2400      	movs	r4, #0
c0de9efc:	e027      	b.n	c0de9f4e <displayInitialWarning+0x14e>
c0de9efe:	4829      	ldr	r0, [pc, #164]	@ (c0de9fa4 <displayInitialWarning+0x1a4>)
c0de9f00:	4478      	add	r0, pc
c0de9f02:	9006      	str	r0, [sp, #24]
c0de9f04:	e00c      	b.n	c0de9f20 <displayInitialWarning+0x120>
c0de9f06:	482d      	ldr	r0, [pc, #180]	@ (c0de9fbc <displayInitialWarning+0x1bc>)
c0de9f08:	4478      	add	r0, pc
c0de9f0a:	9004      	str	r0, [sp, #16]
c0de9f0c:	eb09 0005 	add.w	r0, r9, r5
c0de9f10:	6f80      	ldr	r0, [r0, #120]	@ 0x78
c0de9f12:	6900      	ldr	r0, [r0, #16]
c0de9f14:	492a      	ldr	r1, [pc, #168]	@ (c0de9fc0 <displayInitialWarning+0x1c0>)
c0de9f16:	4479      	add	r1, pc
c0de9f18:	2800      	cmp	r0, #0
c0de9f1a:	bf18      	it	ne
c0de9f1c:	4601      	movne	r1, r0
c0de9f1e:	9106      	str	r1, [sp, #24]
c0de9f20:	4821      	ldr	r0, [pc, #132]	@ (c0de9fa8 <displayInitialWarning+0x1a8>)
c0de9f22:	2405      	movs	r4, #5
c0de9f24:	4478      	add	r0, pc
c0de9f26:	e011      	b.n	c0de9f4c <displayInitialWarning+0x14c>
c0de9f28:	2400      	movs	r4, #0
c0de9f2a:	e017      	b.n	c0de9f5c <displayInitialWarning+0x15c>
c0de9f2c:	4825      	ldr	r0, [pc, #148]	@ (c0de9fc4 <displayInitialWarning+0x1c4>)
c0de9f2e:	4478      	add	r0, pc
c0de9f30:	9004      	str	r0, [sp, #16]
c0de9f32:	eb09 0005 	add.w	r0, r9, r5
c0de9f36:	6f80      	ldr	r0, [r0, #120]	@ 0x78
c0de9f38:	6900      	ldr	r0, [r0, #16]
c0de9f3a:	4923      	ldr	r1, [pc, #140]	@ (c0de9fc8 <displayInitialWarning+0x1c8>)
c0de9f3c:	4479      	add	r1, pc
c0de9f3e:	2800      	cmp	r0, #0
c0de9f40:	bf18      	it	ne
c0de9f42:	4601      	movne	r1, r0
c0de9f44:	9106      	str	r1, [sp, #24]
c0de9f46:	2404      	movs	r4, #4
c0de9f48:	4820      	ldr	r0, [pc, #128]	@ (c0de9fcc <displayInitialWarning+0x1cc>)
c0de9f4a:	4478      	add	r0, pc
c0de9f4c:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de9f4e:	eb09 0005 	add.w	r0, r9, r5
c0de9f52:	4669      	mov	r1, sp
c0de9f54:	f8d0 0080 	ldr.w	r0, [r0, #128]	@ 0x80
c0de9f58:	f7fc fb4c 	bl	c0de65f4 <nbgl_layoutAddContentCenter>
c0de9f5c:	f001 f865 	bl	c0deb02a <OUTLINED_FUNCTION_10>
c0de9f60:	a90e      	add	r1, sp, #56	@ 0x38
c0de9f62:	f7fc fcb5 	bl	c0de68d0 <nbgl_layoutAddChoiceButtons>
c0de9f66:	b114      	cbz	r4, c0de9f6e <displayInitialWarning+0x16e>
c0de9f68:	4620      	mov	r0, r4
c0de9f6a:	f7fa f861 	bl	c0de4030 <os_io_seph_cmd_piezo_play_tune>
c0de9f6e:	f001 f85c 	bl	c0deb02a <OUTLINED_FUNCTION_10>
c0de9f72:	f7fd fad6 	bl	c0de7522 <nbgl_layoutDraw>
c0de9f76:	f001 fcfe 	bl	c0deb976 <nbgl_refresh>
c0de9f7a:	b019      	add	sp, #100	@ 0x64
c0de9f7c:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de9f7e:	bf00      	nop
c0de9f80:	0000191c 	.word	0x0000191c
c0de9f84:	00001a54 	.word	0x00001a54
c0de9f88:	00005a10 	.word	0x00005a10
c0de9f8c:	00005a12 	.word	0x00005a12
c0de9f90:	fffff9ad 	.word	0xfffff9ad
c0de9f94:	00003388 	.word	0x00003388
c0de9f98:	000036d3 	.word	0x000036d3
c0de9f9c:	00003001 	.word	0x00003001
c0de9fa0:	00004003 	.word	0x00004003
c0de9fa4:	0000427f 	.word	0x0000427f
c0de9fa8:	00003e5f 	.word	0x00003e5f
c0de9fac:	00003ee0 	.word	0x00003ee0
c0de9fb0:	000041f4 	.word	0x000041f4
c0de9fb4:	00003e4f 	.word	0x00003e4f
c0de9fb8:	00004136 	.word	0x00004136
c0de9fbc:	0000418c 	.word	0x0000418c
c0de9fc0:	00003a85 	.word	0x00003a85
c0de9fc4:	00003e45 	.word	0x00003e45
c0de9fc8:	00003e23 	.word	0x00003e23
c0de9fcc:	00003cfd 	.word	0x00003cfd

c0de9fd0 <useCaseReviewStreamingStart>:
c0de9fd0:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de9fd4:	4604      	mov	r4, r0
c0de9fd6:	4827      	ldr	r0, [pc, #156]	@ (c0dea074 <useCaseReviewStreamingStart+0xa4>)
c0de9fd8:	460d      	mov	r5, r1
c0de9fda:	4927      	ldr	r1, [pc, #156]	@ (c0dea078 <useCaseReviewStreamingStart+0xa8>)
c0de9fdc:	e9cd 3200 	strd	r3, r2, [sp]
c0de9fe0:	2203      	movs	r2, #3
c0de9fe2:	f8df b09c 	ldr.w	fp, [pc, #156]	@ c0dea080 <useCaseReviewStreamingStart+0xb0>
c0de9fe6:	f04f 0a01 	mov.w	sl, #1
c0de9fea:	eb09 0800 	add.w	r8, r9, r0
c0de9fee:	f849 4000 	str.w	r4, [r9, r0]
c0de9ff2:	f809 2001 	strb.w	r2, [r9, r1]
c0de9ff6:	eb09 0701 	add.w	r7, r9, r1
c0de9ffa:	eb09 060b 	add.w	r6, r9, fp
c0de9ffe:	2138      	movs	r1, #56	@ 0x38
c0dea000:	f8c8 500c 	str.w	r5, [r8, #12]
c0dea004:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0dea006:	f8c8 0004 	str.w	r0, [r8, #4]
c0dea00a:	481e      	ldr	r0, [pc, #120]	@ (c0dea084 <useCaseReviewStreamingStart+0xb4>)
c0dea00c:	4478      	add	r0, pc
c0dea00e:	61b8      	str	r0, [r7, #24]
c0dea010:	2000      	movs	r0, #0
c0dea012:	6138      	str	r0, [r7, #16]
c0dea014:	4819      	ldr	r0, [pc, #100]	@ (c0dea07c <useCaseReviewStreamingStart+0xac>)
c0dea016:	4448      	add	r0, r9
c0dea018:	f880 a00c 	strb.w	sl, [r0, #12]
c0dea01c:	6086      	str	r6, [r0, #8]
c0dea01e:	f001 f822 	bl	c0deb066 <OUTLINED_FUNCTION_17>
c0dea022:	2100      	movs	r1, #0
c0dea024:	f809 a00b 	strb.w	sl, [r9, fp]
c0dea028:	84b1      	strh	r1, [r6, #36]	@ 0x24
c0dea02a:	4817      	ldr	r0, [pc, #92]	@ (c0dea088 <useCaseReviewStreamingStart+0xb8>)
c0dea02c:	9a00      	ldr	r2, [sp, #0]
c0dea02e:	60b5      	str	r5, [r6, #8]
c0dea030:	7131      	strb	r1, [r6, #4]
c0dea032:	2500      	movs	r5, #0
c0dea034:	4478      	add	r0, pc
c0dea036:	e9c6 2007 	strd	r2, r0, [r6, #28]
c0dea03a:	9801      	ldr	r0, [sp, #4]
c0dea03c:	6170      	str	r0, [r6, #20]
c0dea03e:	2000      	movs	r0, #0
c0dea040:	f000 ff34 	bl	c0deaeac <initWarningTipBox>
c0dea044:	f3c4 1000 	ubfx	r0, r4, #4, #1
c0dea048:	f7fe fdf2 	bl	c0de8c30 <getNbPagesForGenericContents>
c0dea04c:	f888 0010 	strb.w	r0, [r8, #16]
c0dea050:	2001      	movs	r0, #1
c0dea052:	21ff      	movs	r1, #255	@ 0xff
c0dea054:	4a0d      	ldr	r2, [pc, #52]	@ (c0dea08c <useCaseReviewStreamingStart+0xbc>)
c0dea056:	447a      	add	r2, pc
c0dea058:	f7fe fd22 	bl	c0de8aa0 <prepareNavInfo>
c0dea05c:	f887 5071 	strb.w	r5, [r7, #113]	@ 0x71
c0dea060:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0dea062:	b108      	cbz	r0, c0dea068 <useCaseReviewStreamingStart+0x98>
c0dea064:	f000 ffcd 	bl	c0deb002 <OUTLINED_FUNCTION_5>
c0dea068:	2000      	movs	r0, #0
c0dea06a:	2101      	movs	r1, #1
c0dea06c:	e8bd 4dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0dea070:	f7fe be98 	b.w	c0de8da4 <displayGenericContextPage>
c0dea074:	00001c50 	.word	0x00001c50
c0dea078:	00001bd4 	.word	0x00001bd4
c0dea07c:	0000191c 	.word	0x0000191c
c0dea080:	000019ac 	.word	0x000019ac
c0dea084:	00000081 	.word	0x00000081
c0dea088:	0000409b 	.word	0x0000409b
c0dea08c:	00003849 	.word	0x00003849

c0dea090 <bundleNavReviewStreamingChoice>:
c0dea090:	b110      	cbz	r0, c0dea098 <bundleNavReviewStreamingChoice+0x8>
c0dea092:	4805      	ldr	r0, [pc, #20]	@ (c0dea0a8 <bundleNavReviewStreamingChoice+0x18>)
c0dea094:	f000 bfd9 	b.w	c0deb04a <OUTLINED_FUNCTION_13>
c0dea098:	4803      	ldr	r0, [pc, #12]	@ (c0dea0a8 <bundleNavReviewStreamingChoice+0x18>)
c0dea09a:	f859 0000 	ldr.w	r0, [r9, r0]
c0dea09e:	4903      	ldr	r1, [pc, #12]	@ (c0dea0ac <bundleNavReviewStreamingChoice+0x1c>)
c0dea0a0:	4479      	add	r1, pc
c0dea0a2:	f000 bf61 	b.w	c0deaf68 <bundleNavReviewAskRejectionConfirmation>
c0dea0a6:	bf00      	nop
c0dea0a8:	00001c50 	.word	0x00001c50
c0dea0ac:	00000f25 	.word	0x00000f25

c0dea0b0 <prepareReviewLastPage>:
c0dea0b0:	b13b      	cbz	r3, c0dea0c2 <prepareReviewLastPage+0x12>
c0dea0b2:	200b      	movs	r0, #11
c0dea0b4:	7308      	strb	r0, [r1, #12]
c0dea0b6:	480d      	ldr	r0, [pc, #52]	@ (c0dea0ec <prepareReviewLastPage+0x3c>)
c0dea0b8:	e9c1 3200 	strd	r3, r2, [r1]
c0dea0bc:	4478      	add	r0, pc
c0dea0be:	6088      	str	r0, [r1, #8]
c0dea0c0:	4770      	bx	lr
c0dea0c2:	f010 0007 	ands.w	r0, r0, #7
c0dea0c6:	d004      	beq.n	c0dea0d2 <prepareReviewLastPage+0x22>
c0dea0c8:	2801      	cmp	r0, #1
c0dea0ca:	d105      	bne.n	c0dea0d8 <prepareReviewLastPage+0x28>
c0dea0cc:	4b05      	ldr	r3, [pc, #20]	@ (c0dea0e4 <prepareReviewLastPage+0x34>)
c0dea0ce:	447b      	add	r3, pc
c0dea0d0:	e7ef      	b.n	c0dea0b2 <prepareReviewLastPage+0x2>
c0dea0d2:	4b03      	ldr	r3, [pc, #12]	@ (c0dea0e0 <prepareReviewLastPage+0x30>)
c0dea0d4:	447b      	add	r3, pc
c0dea0d6:	e7ec      	b.n	c0dea0b2 <prepareReviewLastPage+0x2>
c0dea0d8:	4b03      	ldr	r3, [pc, #12]	@ (c0dea0e8 <prepareReviewLastPage+0x38>)
c0dea0da:	447b      	add	r3, pc
c0dea0dc:	e7e9      	b.n	c0dea0b2 <prepareReviewLastPage+0x2>
c0dea0de:	bf00      	nop
c0dea0e0:	00003a94 	.word	0x00003a94
c0dea0e4:	00003a69 	.word	0x00003a69
c0dea0e8:	00003f39 	.word	0x00003f39
c0dea0ec:	000037c3 	.word	0x000037c3

c0dea0f0 <prepareAddressConfirmationPages>:
c0dea0f0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea0f4:	b08a      	sub	sp, #40	@ 0x28
c0dea0f6:	4688      	mov	r8, r1
c0dea0f8:	4952      	ldr	r1, [pc, #328]	@ (c0dea244 <prepareAddressConfirmationPages+0x154>)
c0dea0fa:	f8df a144 	ldr.w	sl, [pc, #324]	@ c0dea240 <prepareAddressConfirmationPages+0x150>
c0dea0fe:	4693      	mov	fp, r2
c0dea100:	4479      	add	r1, pc
c0dea102:	6191      	str	r1, [r2, #24]
c0dea104:	2106      	movs	r1, #6
c0dea106:	7011      	strb	r1, [r2, #0]
c0dea108:	2201      	movs	r2, #1
c0dea10a:	eb09 010a 	add.w	r1, r9, sl
c0dea10e:	f881 205c 	strb.w	r2, [r1, #92]	@ 0x5c
c0dea112:	f1b8 0f00 	cmp.w	r8, #0
c0dea116:	4a4c      	ldr	r2, [pc, #304]	@ (c0dea248 <prepareAddressConfirmationPages+0x158>)
c0dea118:	447a      	add	r2, pc
c0dea11a:	e9c1 200a 	strd	r2, r0, [r1, #40]	@ 0x28
c0dea11e:	d01f      	beq.n	c0dea160 <prepareAddressConfirmationPages+0x70>
c0dea120:	f898 2008 	ldrb.w	r2, [r8, #8]
c0dea124:	2a02      	cmp	r2, #2
c0dea126:	d81b      	bhi.n	c0dea160 <prepareAddressConfirmationPages+0x70>
c0dea128:	2001      	movs	r0, #1
c0dea12a:	2100      	movs	r1, #0
c0dea12c:	f04f 0c00 	mov.w	ip, #0
c0dea130:	9303      	str	r3, [sp, #12]
c0dea132:	4594      	cmp	ip, r2
c0dea134:	d219      	bcs.n	c0dea16a <prepareAddressConfirmationPages+0x7a>
c0dea136:	f8d8 0000 	ldr.w	r0, [r8]
c0dea13a:	eb09 030a 	add.w	r3, r9, sl
c0dea13e:	f10c 0c01 	add.w	ip, ip, #1
c0dea142:	185c      	adds	r4, r3, r1
c0dea144:	4408      	add	r0, r1
c0dea146:	3438      	adds	r4, #56	@ 0x38
c0dea148:	3110      	adds	r1, #16
c0dea14a:	e890 00e4 	ldmia.w	r0, {r2, r5, r6, r7}
c0dea14e:	c4e4      	stmia	r4!, {r2, r5, r6, r7}
c0dea150:	f893 005c 	ldrb.w	r0, [r3, #92]	@ 0x5c
c0dea154:	3001      	adds	r0, #1
c0dea156:	f883 005c 	strb.w	r0, [r3, #92]	@ 0x5c
c0dea15a:	f898 2008 	ldrb.w	r2, [r8, #8]
c0dea15e:	e7e8      	b.n	c0dea132 <prepareAddressConfirmationPages+0x42>
c0dea160:	2000      	movs	r0, #0
c0dea162:	f8cb 001c 	str.w	r0, [fp, #28]
c0dea166:	2001      	movs	r0, #1
c0dea168:	e01e      	b.n	c0dea1a8 <prepareAddressConfirmationPages+0xb8>
c0dea16a:	46c4      	mov	ip, r8
c0dea16c:	a905      	add	r1, sp, #20
c0dea16e:	e89c 00f4 	ldmia.w	ip, {r2, r4, r5, r6, r7}
c0dea172:	460b      	mov	r3, r1
c0dea174:	c3f4      	stmia	r3!, {r2, r4, r5, r6, r7}
c0dea176:	eb09 040a 	add.w	r4, r9, sl
c0dea17a:	b2c7      	uxtb	r7, r0
c0dea17c:	f88d 001c 	strb.w	r0, [sp, #28]
c0dea180:	f104 0228 	add.w	r2, r4, #40	@ 0x28
c0dea184:	2301      	movs	r3, #1
c0dea186:	4638      	mov	r0, r7
c0dea188:	9205      	str	r2, [sp, #20]
c0dea18a:	f10d 0213 	add.w	r2, sp, #19
c0dea18e:	e9cd 3300 	strd	r3, r3, [sp]
c0dea192:	2300      	movs	r3, #0
c0dea194:	9202      	str	r2, [sp, #8]
c0dea196:	2200      	movs	r2, #0
c0dea198:	f7fe fa88 	bl	c0de86ac <getNbTagValuesInPage>
c0dea19c:	4287      	cmp	r7, r0
c0dea19e:	bf88      	it	hi
c0dea1a0:	2001      	movhi	r0, #1
c0dea1a2:	9b03      	ldr	r3, [sp, #12]
c0dea1a4:	f884 005c 	strb.w	r0, [r4, #92]	@ 0x5c
c0dea1a8:	f640 1107 	movw	r1, #2311	@ 0x907
c0dea1ac:	f88b 000c 	strb.w	r0, [fp, #12]
c0dea1b0:	f8ab 1020 	strh.w	r1, [fp, #32]
c0dea1b4:	2100      	movs	r1, #0
c0dea1b6:	f88b 1011 	strb.w	r1, [fp, #17]
c0dea1ba:	f88b 1012 	strb.w	r1, [fp, #18]
c0dea1be:	f88b 100f 	strb.w	r1, [fp, #15]
c0dea1c2:	eb09 010a 	add.w	r1, r9, sl
c0dea1c6:	3128      	adds	r1, #40	@ 0x28
c0dea1c8:	f1b8 0f00 	cmp.w	r8, #0
c0dea1cc:	f8cb 1004 	str.w	r1, [fp, #4]
c0dea1d0:	d003      	beq.n	c0dea1da <prepareAddressConfirmationPages+0xea>
c0dea1d2:	f898 1008 	ldrb.w	r1, [r8, #8]
c0dea1d6:	4288      	cmp	r0, r1
c0dea1d8:	d907      	bls.n	c0dea1ea <prepareAddressConfirmationPages+0xfa>
c0dea1da:	200b      	movs	r0, #11
c0dea1dc:	f88b 002c 	strb.w	r0, [fp, #44]	@ 0x2c
c0dea1e0:	481c      	ldr	r0, [pc, #112]	@ (c0dea254 <prepareAddressConfirmationPages+0x164>)
c0dea1e2:	4478      	add	r0, pc
c0dea1e4:	f8cb 0024 	str.w	r0, [fp, #36]	@ 0x24
c0dea1e8:	e027      	b.n	c0dea23a <prepareAddressConfirmationPages+0x14a>
c0dea1ea:	2000      	movs	r0, #0
c0dea1ec:	f8cb 0024 	str.w	r0, [fp, #36]	@ 0x24
c0dea1f0:	4916      	ldr	r1, [pc, #88]	@ (c0dea24c <prepareAddressConfirmationPages+0x15c>)
c0dea1f2:	4479      	add	r1, pc
c0dea1f4:	f8cb 101c 	str.w	r1, [fp, #28]
c0dea1f8:	210b      	movs	r1, #11
c0dea1fa:	f883 102c 	strb.w	r1, [r3, #44]	@ 0x2c
c0dea1fe:	2106      	movs	r1, #6
c0dea200:	7019      	strb	r1, [r3, #0]
c0dea202:	2109      	movs	r1, #9
c0dea204:	f883 1021 	strb.w	r1, [r3, #33]	@ 0x21
c0dea208:	4911      	ldr	r1, [pc, #68]	@ (c0dea250 <prepareAddressConfirmationPages+0x160>)
c0dea20a:	e9c3 0006 	strd	r0, r0, [r3, #24]
c0dea20e:	1d18      	adds	r0, r3, #4
c0dea210:	4479      	add	r1, pc
c0dea212:	6259      	str	r1, [r3, #36]	@ 0x24
c0dea214:	4641      	mov	r1, r8
c0dea216:	e891 00f4 	ldmia.w	r1, {r2, r4, r5, r6, r7}
c0dea21a:	c0f4      	stmia	r0!, {r2, r4, r5, r6, r7}
c0dea21c:	eb09 000a 	add.w	r0, r9, sl
c0dea220:	f898 1008 	ldrb.w	r1, [r8, #8]
c0dea224:	f890 005c 	ldrb.w	r0, [r0, #92]	@ 0x5c
c0dea228:	1a09      	subs	r1, r1, r0
c0dea22a:	3101      	adds	r1, #1
c0dea22c:	7319      	strb	r1, [r3, #12]
c0dea22e:	f8d8 1000 	ldr.w	r1, [r8]
c0dea232:	eb01 1000 	add.w	r0, r1, r0, lsl #4
c0dea236:	3810      	subs	r0, #16
c0dea238:	6058      	str	r0, [r3, #4]
c0dea23a:	b00a      	add	sp, #40	@ 0x28
c0dea23c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0dea240:	00001c50 	.word	0x00001c50
c0dea244:	00003449 	.word	0x00003449
c0dea248:	00003df5 	.word	0x00003df5
c0dea24c:	000037bb 	.word	0x000037bb
c0dea250:	00003f57 	.word	0x00003f57
c0dea254:	00003f85 	.word	0x00003f85

c0dea258 <nbgl_useCaseAddressReview>:
c0dea258:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0dea25c:	4c2d      	ldr	r4, [pc, #180]	@ (c0dea314 <nbgl_useCaseAddressReview+0xbc>)
c0dea25e:	9301      	str	r3, [sp, #4]
c0dea260:	4692      	mov	sl, r2
c0dea262:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0dea266:	eb09 0504 	add.w	r5, r9, r4
c0dea26a:	f7fe fc03 	bl	c0de8a74 <reset_callbacks_and_context>
c0dea26e:	6da8      	ldr	r0, [r5, #88]	@ 0x58
c0dea270:	e9dd 570c 	ldrd	r5, r7, [sp, #48]	@ 0x30
c0dea274:	b108      	cbz	r0, c0dea27a <nbgl_useCaseAddressReview+0x22>
c0dea276:	f7fd f973 	bl	c0de7560 <nbgl_layoutRelease>
c0dea27a:	eb09 0004 	add.w	r0, r9, r4
c0dea27e:	2138      	movs	r1, #56	@ 0x38
c0dea280:	3028      	adds	r0, #40	@ 0x28
c0dea282:	f001 ffb7 	bl	c0dec1f4 <__aeabi_memclr>
c0dea286:	4824      	ldr	r0, [pc, #144]	@ (c0dea318 <nbgl_useCaseAddressReview+0xc0>)
c0dea288:	2602      	movs	r6, #2
c0dea28a:	f04f 0b00 	mov.w	fp, #0
c0dea28e:	21a8      	movs	r1, #168	@ 0xa8
c0dea290:	f849 6004 	str.w	r6, [r9, r4]
c0dea294:	f809 6000 	strb.w	r6, [r9, r0]
c0dea298:	4448      	add	r0, r9
c0dea29a:	6187      	str	r7, [r0, #24]
c0dea29c:	4f20      	ldr	r7, [pc, #128]	@ (c0dea320 <nbgl_useCaseAddressReview+0xc8>)
c0dea29e:	f8c0 b010 	str.w	fp, [r0, #16]
c0dea2a2:	481e      	ldr	r0, [pc, #120]	@ (c0dea31c <nbgl_useCaseAddressReview+0xc4>)
c0dea2a4:	eb09 0407 	add.w	r4, r9, r7
c0dea2a8:	eb09 0800 	add.w	r8, r9, r0
c0dea2ac:	4620      	mov	r0, r4
c0dea2ae:	f8c8 4008 	str.w	r4, [r8, #8]
c0dea2b2:	f001 ff9f 	bl	c0dec1f4 <__aeabi_memclr>
c0dea2b6:	2001      	movs	r0, #1
c0dea2b8:	f8c4 a008 	str.w	sl, [r4, #8]
c0dea2bc:	f884 b026 	strb.w	fp, [r4, #38]	@ 0x26
c0dea2c0:	f104 0238 	add.w	r2, r4, #56	@ 0x38
c0dea2c4:	f104 0370 	add.w	r3, r4, #112	@ 0x70
c0dea2c8:	f809 0007 	strb.w	r0, [r9, r7]
c0dea2cc:	4815      	ldr	r0, [pc, #84]	@ (c0dea324 <nbgl_useCaseAddressReview+0xcc>)
c0dea2ce:	9901      	ldr	r1, [sp, #4]
c0dea2d0:	4478      	add	r0, pc
c0dea2d2:	e9c4 1b05 	strd	r1, fp, [r4, #20]
c0dea2d6:	e9c4 5007 	strd	r5, r0, [r4, #28]
c0dea2da:	e9dd 0102 	ldrd	r0, r1, [sp, #8]
c0dea2de:	f7ff ff07 	bl	c0dea0f0 <prepareAddressConfirmationPages>
c0dea2e2:	f894 0070 	ldrb.w	r0, [r4, #112]	@ 0x70
c0dea2e6:	2806      	cmp	r0, #6
c0dea2e8:	bf08      	it	eq
c0dea2ea:	2603      	moveq	r6, #3
c0dea2ec:	f888 600c 	strb.w	r6, [r8, #12]
c0dea2f0:	f000 fe84 	bl	c0deaffc <OUTLINED_FUNCTION_4>
c0dea2f4:	4a0c      	ldr	r2, [pc, #48]	@ (c0dea328 <nbgl_useCaseAddressReview+0xd0>)
c0dea2f6:	4601      	mov	r1, r0
c0dea2f8:	2001      	movs	r0, #1
c0dea2fa:	447a      	add	r2, pc
c0dea2fc:	f7fe fbd0 	bl	c0de8aa0 <prepareNavInfo>
c0dea300:	f000 fe7f 	bl	c0deb002 <OUTLINED_FUNCTION_5>
c0dea304:	2000      	movs	r0, #0
c0dea306:	2101      	movs	r1, #1
c0dea308:	b004      	add	sp, #16
c0dea30a:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea30e:	f7fe bd49 	b.w	c0de8da4 <displayGenericContextPage>
c0dea312:	bf00      	nop
c0dea314:	00001c50 	.word	0x00001c50
c0dea318:	00001bd4 	.word	0x00001bd4
c0dea31c:	0000191c 	.word	0x0000191c
c0dea320:	000019ac 	.word	0x000019ac
c0dea324:	0000374c 	.word	0x0000374c
c0dea328:	000039c7 	.word	0x000039c7

c0dea32c <getContentAtIdx>:
c0dea32c:	b570      	push	{r4, r5, r6, lr}
c0dea32e:	4605      	mov	r5, r0
c0dea330:	2000      	movs	r0, #0
c0dea332:	2d00      	cmp	r5, #0
c0dea334:	d415      	bmi.n	c0dea362 <getContentAtIdx+0x36>
c0dea336:	4e11      	ldr	r6, [pc, #68]	@ (c0dea37c <getContentAtIdx+0x50>)
c0dea338:	460c      	mov	r4, r1
c0dea33a:	eb09 0106 	add.w	r1, r9, r6
c0dea33e:	7b09      	ldrb	r1, [r1, #12]
c0dea340:	428d      	cmp	r5, r1
c0dea342:	da0e      	bge.n	c0dea362 <getContentAtIdx+0x36>
c0dea344:	eb09 0006 	add.w	r0, r9, r6
c0dea348:	7900      	ldrb	r0, [r0, #4]
c0dea34a:	b158      	cbz	r0, c0dea364 <getContentAtIdx+0x38>
c0dea34c:	4620      	mov	r0, r4
c0dea34e:	2138      	movs	r1, #56	@ 0x38
c0dea350:	f001 ff50 	bl	c0dec1f4 <__aeabi_memclr>
c0dea354:	eb09 0006 	add.w	r0, r9, r6
c0dea358:	4621      	mov	r1, r4
c0dea35a:	6882      	ldr	r2, [r0, #8]
c0dea35c:	b2e8      	uxtb	r0, r5
c0dea35e:	4790      	blx	r2
c0dea360:	4620      	mov	r0, r4
c0dea362:	bd70      	pop	{r4, r5, r6, pc}
c0dea364:	eb09 0006 	add.w	r0, r9, r6
c0dea368:	ebc5 01c5 	rsb	r1, r5, r5, lsl #3
c0dea36c:	6880      	ldr	r0, [r0, #8]
c0dea36e:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
c0dea372:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0dea376:	f001 bd1b 	b.w	c0debdb0 <pic>
c0dea37a:	bf00      	nop
c0dea37c:	0000191c 	.word	0x0000191c

c0dea380 <getContentNbElement>:
c0dea380:	7801      	ldrb	r1, [r0, #0]
c0dea382:	290a      	cmp	r1, #10
c0dea384:	d00b      	beq.n	c0dea39e <getContentNbElement+0x1e>
c0dea386:	2906      	cmp	r1, #6
c0dea388:	d009      	beq.n	c0dea39e <getContentNbElement+0x1e>
c0dea38a:	2907      	cmp	r1, #7
c0dea38c:	d009      	beq.n	c0dea3a2 <getContentNbElement+0x22>
c0dea38e:	2908      	cmp	r1, #8
c0dea390:	d009      	beq.n	c0dea3a6 <getContentNbElement+0x26>
c0dea392:	2909      	cmp	r1, #9
c0dea394:	d009      	beq.n	c0dea3aa <getContentNbElement+0x2a>
c0dea396:	2904      	cmp	r1, #4
c0dea398:	bf1c      	itt	ne
c0dea39a:	2001      	movne	r0, #1
c0dea39c:	4770      	bxne	lr
c0dea39e:	7b00      	ldrb	r0, [r0, #12]
c0dea3a0:	4770      	bx	lr
c0dea3a2:	7a00      	ldrb	r0, [r0, #8]
c0dea3a4:	4770      	bx	lr
c0dea3a6:	7c00      	ldrb	r0, [r0, #16]
c0dea3a8:	4770      	bx	lr
c0dea3aa:	7a40      	ldrb	r0, [r0, #9]
c0dea3ac:	4770      	bx	lr
	...

c0dea3b0 <genericContextComputeNextPageParams>:
c0dea3b0:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0dea3b4:	f8df 810c 	ldr.w	r8, [pc, #268]	@ c0dea4c4 <genericContextComputeNextPageParams+0x114>
c0dea3b8:	4682      	mov	sl, r0
c0dea3ba:	4616      	mov	r6, r2
c0dea3bc:	460d      	mov	r5, r1
c0dea3be:	f10d 0107 	add.w	r1, sp, #7
c0dea3c2:	461a      	mov	r2, r3
c0dea3c4:	eb09 0008 	add.w	r0, r9, r8
c0dea3c8:	7c04      	ldrb	r4, [r0, #16]
c0dea3ca:	7c87      	ldrb	r7, [r0, #18]
c0dea3cc:	4650      	mov	r0, sl
c0dea3ce:	f000 f881 	bl	c0dea4d4 <genericContextGetPageInfo>
c0dea3d2:	f89d 0007 	ldrb.w	r0, [sp, #7]
c0dea3d6:	f8df b0f0 	ldr.w	fp, [pc, #240]	@ c0dea4c8 <genericContextComputeNextPageParams+0x118>
c0dea3da:	7030      	strb	r0, [r6, #0]
c0dea3dc:	eb09 010b 	add.w	r1, r9, fp
c0dea3e0:	f891 1060 	ldrb.w	r1, [r1, #96]	@ 0x60
c0dea3e4:	4551      	cmp	r1, sl
c0dea3e6:	d219      	bcs.n	c0dea41c <genericContextComputeNextPageParams+0x6c>
c0dea3e8:	4b38      	ldr	r3, [pc, #224]	@ (c0dea4cc <genericContextComputeNextPageParams+0x11c>)
c0dea3ea:	084e      	lsrs	r6, r1, #1
c0dea3ec:	2204      	movs	r2, #4
c0dea3ee:	ea02 0281 	and.w	r2, r2, r1, lsl #2
c0dea3f2:	444b      	add	r3, r9
c0dea3f4:	5d9b      	ldrb	r3, [r3, r6]
c0dea3f6:	fa23 f202 	lsr.w	r2, r3, r2
c0dea3fa:	2300      	movs	r3, #0
c0dea3fc:	f002 0207 	and.w	r2, r2, #7
c0dea400:	4417      	add	r7, r2
c0dea402:	eb09 0208 	add.w	r2, r9, r8
c0dea406:	7c52      	ldrb	r2, [r2, #17]
c0dea408:	4297      	cmp	r7, r2
c0dea40a:	bf28      	it	cs
c0dea40c:	2301      	movcs	r3, #1
c0dea40e:	2a00      	cmp	r2, #0
c0dea410:	bf18      	it	ne
c0dea412:	2201      	movne	r2, #1
c0dea414:	401a      	ands	r2, r3
c0dea416:	bf18      	it	ne
c0dea418:	2700      	movne	r7, #0
c0dea41a:	4414      	add	r4, r2
c0dea41c:	4551      	cmp	r1, sl
c0dea41e:	d905      	bls.n	c0dea42c <genericContextComputeNextPageParams+0x7c>
c0dea420:	1a3f      	subs	r7, r7, r0
c0dea422:	f1b7 3fff 	cmp.w	r7, #4294967295	@ 0xffffffff
c0dea426:	bfdc      	itt	le
c0dea428:	4247      	negle	r7, r0
c0dea42a:	3c01      	suble	r4, #1
c0dea42c:	b2e6      	uxtb	r6, r4
c0dea42e:	2eff      	cmp	r6, #255	@ 0xff
c0dea430:	d014      	beq.n	c0dea45c <genericContextComputeNextPageParams+0xac>
c0dea432:	eb09 0108 	add.w	r1, r9, r8
c0dea436:	b260      	sxtb	r0, r4
c0dea438:	7b09      	ldrb	r1, [r1, #12]
c0dea43a:	4288      	cmp	r0, r1
c0dea43c:	d108      	bne.n	c0dea450 <genericContextComputeNextPageParams+0xa0>
c0dea43e:	eb09 0108 	add.w	r1, r9, r8
c0dea442:	7d09      	ldrb	r1, [r1, #20]
c0dea444:	b121      	cbz	r1, c0dea450 <genericContextComputeNextPageParams+0xa0>
c0dea446:	4822      	ldr	r0, [pc, #136]	@ (c0dea4d0 <genericContextComputeNextPageParams+0x120>)
c0dea448:	4448      	add	r0, r9
c0dea44a:	f100 0538 	add.w	r5, r0, #56	@ 0x38
c0dea44e:	e00d      	b.n	c0dea46c <genericContextComputeNextPageParams+0xbc>
c0dea450:	4629      	mov	r1, r5
c0dea452:	f7ff ff6b 	bl	c0dea32c <getContentAtIdx>
c0dea456:	4605      	mov	r5, r0
c0dea458:	b940      	cbnz	r0, c0dea46c <genericContextComputeNextPageParams+0xbc>
c0dea45a:	e02e      	b.n	c0dea4ba <genericContextComputeNextPageParams+0x10a>
c0dea45c:	eb09 0008 	add.w	r0, r9, r8
c0dea460:	7cc0      	ldrb	r0, [r0, #19]
c0dea462:	2800      	cmp	r0, #0
c0dea464:	d0e5      	beq.n	c0dea432 <genericContextComputeNextPageParams+0x82>
c0dea466:	481a      	ldr	r0, [pc, #104]	@ (c0dea4d0 <genericContextComputeNextPageParams+0x120>)
c0dea468:	eb09 0500 	add.w	r5, r9, r0
c0dea46c:	eb09 0008 	add.w	r0, r9, r8
c0dea470:	7c00      	ldrb	r0, [r0, #16]
c0dea472:	4286      	cmp	r6, r0
c0dea474:	d103      	bne.n	c0dea47e <genericContextComputeNextPageParams+0xce>
c0dea476:	eb09 0008 	add.w	r0, r9, r8
c0dea47a:	7c40      	ldrb	r0, [r0, #17]
c0dea47c:	b988      	cbnz	r0, c0dea4a2 <genericContextComputeNextPageParams+0xf2>
c0dea47e:	eb09 0608 	add.w	r6, r9, r8
c0dea482:	4628      	mov	r0, r5
c0dea484:	7434      	strb	r4, [r6, #16]
c0dea486:	f7ff ff7b 	bl	c0dea380 <getContentNbElement>
c0dea48a:	7470      	strb	r0, [r6, #17]
c0dea48c:	6b68      	ldr	r0, [r5, #52]	@ 0x34
c0dea48e:	eb09 040b 	add.w	r4, r9, fp
c0dea492:	f001 fc8d 	bl	c0debdb0 <pic>
c0dea496:	62e0      	str	r0, [r4, #44]	@ 0x2c
c0dea498:	7c70      	ldrb	r0, [r6, #17]
c0dea49a:	f1b7 3fff 	cmp.w	r7, #4294967295	@ 0xffffffff
c0dea49e:	dc02      	bgt.n	c0dea4a6 <genericContextComputeNextPageParams+0xf6>
c0dea4a0:	4407      	add	r7, r0
c0dea4a2:	2f00      	cmp	r7, #0
c0dea4a4:	d409      	bmi.n	c0dea4ba <genericContextComputeNextPageParams+0x10a>
c0dea4a6:	4287      	cmp	r7, r0
c0dea4a8:	d207      	bcs.n	c0dea4ba <genericContextComputeNextPageParams+0x10a>
c0dea4aa:	eb09 000b 	add.w	r0, r9, fp
c0dea4ae:	f880 a060 	strb.w	sl, [r0, #96]	@ 0x60
c0dea4b2:	eb09 0008 	add.w	r0, r9, r8
c0dea4b6:	7487      	strb	r7, [r0, #18]
c0dea4b8:	e000      	b.n	c0dea4bc <genericContextComputeNextPageParams+0x10c>
c0dea4ba:	2500      	movs	r5, #0
c0dea4bc:	4628      	mov	r0, r5
c0dea4be:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0dea4c2:	bf00      	nop
c0dea4c4:	0000191c 	.word	0x0000191c
c0dea4c8:	00001bd4 	.word	0x00001bd4
c0dea4cc:	00001ad4 	.word	0x00001ad4
c0dea4d0:	000019ac 	.word	0x000019ac

c0dea4d4 <genericContextGetPageInfo>:
c0dea4d4:	b510      	push	{r4, lr}
c0dea4d6:	4c08      	ldr	r4, [pc, #32]	@ (c0dea4f8 <genericContextGetPageInfo+0x24>)
c0dea4d8:	2304      	movs	r3, #4
c0dea4da:	ea03 0380 	and.w	r3, r3, r0, lsl #2
c0dea4de:	0840      	lsrs	r0, r0, #1
c0dea4e0:	444c      	add	r4, r9
c0dea4e2:	5c20      	ldrb	r0, [r4, r0]
c0dea4e4:	40d8      	lsrs	r0, r3
c0dea4e6:	b111      	cbz	r1, c0dea4ee <genericContextGetPageInfo+0x1a>
c0dea4e8:	f000 0307 	and.w	r3, r0, #7
c0dea4ec:	700b      	strb	r3, [r1, #0]
c0dea4ee:	b112      	cbz	r2, c0dea4f6 <genericContextGetPageInfo+0x22>
c0dea4f0:	f3c0 00c0 	ubfx	r0, r0, #3, #1
c0dea4f4:	7010      	strb	r0, [r2, #0]
c0dea4f6:	bd10      	pop	{r4, pc}
c0dea4f8:	00001ad4 	.word	0x00001ad4

c0dea4fc <bundleNavStartSettings>:
c0dea4fc:	2000      	movs	r0, #0
c0dea4fe:	f7fe be8d 	b.w	c0de921c <bundleNavStartSettingsAtPage>
	...

c0dea504 <displayFullValuePage>:
c0dea504:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea508:	b092      	sub	sp, #72	@ 0x48
c0dea50a:	460d      	mov	r5, r1
c0dea50c:	68d1      	ldr	r1, [r2, #12]
c0dea50e:	4614      	mov	r4, r2
c0dea510:	b101      	cbz	r1, c0dea514 <displayFullValuePage+0x10>
c0dea512:	4608      	mov	r0, r1
c0dea514:	f001 fc4c 	bl	c0debdb0 <pic>
c0dea518:	4606      	mov	r6, r0
c0dea51a:	7d20      	ldrb	r0, [r4, #20]
c0dea51c:	2805      	cmp	r0, #5
c0dea51e:	d00d      	beq.n	c0dea53c <displayFullValuePage+0x38>
c0dea520:	2804      	cmp	r0, #4
c0dea522:	d170      	bne.n	c0dea606 <displayFullValuePage+0x102>
c0dea524:	4861      	ldr	r0, [pc, #388]	@ (c0dea6ac <displayFullValuePage+0x1a8>)
c0dea526:	6921      	ldr	r1, [r4, #16]
c0dea528:	2201      	movs	r2, #1
c0dea52a:	4448      	add	r0, r9
c0dea52c:	6341      	str	r1, [r0, #52]	@ 0x34
c0dea52e:	4630      	mov	r0, r6
c0dea530:	6921      	ldr	r1, [r4, #16]
c0dea532:	b012      	add	sp, #72	@ 0x48
c0dea534:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea538:	f000 b9de 	b.w	c0dea8f8 <displayInfosListModal>
c0dea53c:	485b      	ldr	r0, [pc, #364]	@ (c0dea6ac <displayFullValuePage+0x1a8>)
c0dea53e:	6921      	ldr	r1, [r4, #16]
c0dea540:	2200      	movs	r2, #0
c0dea542:	4448      	add	r0, r9
c0dea544:	6381      	str	r1, [r0, #56]	@ 0x38
c0dea546:	485a      	ldr	r0, [pc, #360]	@ (c0dea6b0 <displayFullValuePage+0x1ac>)
c0dea548:	2100      	movs	r1, #0
c0dea54a:	6927      	ldr	r7, [r4, #16]
c0dea54c:	9101      	str	r1, [sp, #4]
c0dea54e:	4448      	add	r0, r9
c0dea550:	e9c0 220c 	strd	r2, r2, [r0, #48]	@ 0x30
c0dea554:	6382      	str	r2, [r0, #56]	@ 0x38
c0dea556:	63c2      	str	r2, [r0, #60]	@ 0x3c
c0dea558:	7a3d      	ldrb	r5, [r7, #8]
c0dea55a:	0628      	lsls	r0, r5, #24
c0dea55c:	f000 8087 	beq.w	c0dea66e <displayFullValuePage+0x16a>
c0dea560:	9500      	str	r5, [sp, #0]
c0dea562:	fa5f fb85 	uxtb.w	fp, r5
c0dea566:	f04f 0800 	mov.w	r8, #0
c0dea56a:	2600      	movs	r6, #0
c0dea56c:	9801      	ldr	r0, [sp, #4]
c0dea56e:	b2c0      	uxtb	r0, r0
c0dea570:	ea4f 1a00 	mov.w	sl, r0, lsl #4
c0dea574:	45c3      	cmp	fp, r8
c0dea576:	d027      	beq.n	c0dea5c8 <displayFullValuePage+0xc4>
c0dea578:	f1b8 0f00 	cmp.w	r8, #0
c0dea57c:	bf18      	it	ne
c0dea57e:	3618      	addne	r6, #24
c0dea580:	6838      	ldr	r0, [r7, #0]
c0dea582:	b108      	cbz	r0, c0dea588 <displayFullValuePage+0x84>
c0dea584:	4450      	add	r0, sl
c0dea586:	e004      	b.n	c0dea592 <displayFullValuePage+0x8e>
c0dea588:	9801      	ldr	r0, [sp, #4]
c0dea58a:	6879      	ldr	r1, [r7, #4]
c0dea58c:	4440      	add	r0, r8
c0dea58e:	b2c0      	uxtb	r0, r0
c0dea590:	4788      	blx	r1
c0dea592:	f001 fc0d 	bl	c0debdb0 <pic>
c0dea596:	7bbb      	ldrb	r3, [r7, #14]
c0dea598:	6801      	ldr	r1, [r0, #0]
c0dea59a:	4604      	mov	r4, r0
c0dea59c:	f000 fd5e 	bl	c0deb05c <OUTLINED_FUNCTION_16>
c0dea5a0:	6861      	ldr	r1, [r4, #4]
c0dea5a2:	7bbb      	ldrb	r3, [r7, #14]
c0dea5a4:	4605      	mov	r5, r0
c0dea5a6:	f000 fd59 	bl	c0deb05c <OUTLINED_FUNCTION_16>
c0dea5aa:	1971      	adds	r1, r6, r5
c0dea5ac:	f10a 0a10 	add.w	sl, sl, #16
c0dea5b0:	f108 0801 	add.w	r8, r8, #1
c0dea5b4:	4408      	add	r0, r1
c0dea5b6:	1d06      	adds	r6, r0, #4
c0dea5b8:	b2b0      	uxth	r0, r6
c0dea5ba:	f5b0 7fe8 	cmp.w	r0, #464	@ 0x1d0
c0dea5be:	d3d9      	bcc.n	c0dea574 <displayFullValuePage+0x70>
c0dea5c0:	9d00      	ldr	r5, [sp, #0]
c0dea5c2:	f1a8 0001 	sub.w	r0, r8, #1
c0dea5c6:	e001      	b.n	c0dea5cc <displayFullValuePage+0xc8>
c0dea5c8:	9d00      	ldr	r5, [sp, #0]
c0dea5ca:	4628      	mov	r0, r5
c0dea5cc:	4938      	ldr	r1, [pc, #224]	@ (c0dea6b0 <displayFullValuePage+0x1ac>)
c0dea5ce:	2404      	movs	r4, #4
c0dea5d0:	1a2d      	subs	r5, r5, r0
c0dea5d2:	4449      	add	r1, r9
c0dea5d4:	f891 2030 	ldrb.w	r2, [r1, #48]	@ 0x30
c0dea5d8:	1c53      	adds	r3, r2, #1
c0dea5da:	f881 3030 	strb.w	r3, [r1, #48]	@ 0x30
c0dea5de:	eb01 0152 	add.w	r1, r1, r2, lsr #1
c0dea5e2:	ea04 0282 	and.w	r2, r4, r2, lsl #2
c0dea5e6:	240f      	movs	r4, #15
c0dea5e8:	f891 3050 	ldrb.w	r3, [r1, #80]	@ 0x50
c0dea5ec:	4094      	lsls	r4, r2
c0dea5ee:	43a3      	bics	r3, r4
c0dea5f0:	f000 0407 	and.w	r4, r0, #7
c0dea5f4:	fa04 f202 	lsl.w	r2, r4, r2
c0dea5f8:	431a      	orrs	r2, r3
c0dea5fa:	f881 2050 	strb.w	r2, [r1, #80]	@ 0x50
c0dea5fe:	9901      	ldr	r1, [sp, #4]
c0dea600:	4401      	add	r1, r0
c0dea602:	9101      	str	r1, [sp, #4]
c0dea604:	e7a9      	b.n	c0dea55a <displayFullValuePage+0x56>
c0dea606:	af0b      	add	r7, sp, #44	@ 0x2c
c0dea608:	492a      	ldr	r1, [pc, #168]	@ (c0dea6b4 <displayFullValuePage+0x1b0>)
c0dea60a:	221c      	movs	r2, #28
c0dea60c:	4638      	mov	r0, r7
c0dea60e:	4479      	add	r1, pc
c0dea610:	f001 fde6 	bl	c0dec1e0 <__aeabi_memcpy>
c0dea614:	f44f 6010 	mov.w	r0, #2304	@ 0x900
c0dea618:	f8df 8090 	ldr.w	r8, [pc, #144]	@ c0dea6ac <displayFullValuePage+0x1a8>
c0dea61c:	9608      	str	r6, [sp, #32]
c0dea61e:	f8ad 0024 	strh.w	r0, [sp, #36]	@ 0x24
c0dea622:	2000      	movs	r0, #0
c0dea624:	9007      	str	r0, [sp, #28]
c0dea626:	2001      	movs	r0, #1
c0dea628:	eb09 0608 	add.w	r6, r9, r8
c0dea62c:	f8ad 0018 	strh.w	r0, [sp, #24]
c0dea630:	4638      	mov	r0, r7
c0dea632:	f7f9 ff05 	bl	c0de4440 <nbgl_layoutGet>
c0dea636:	62f0      	str	r0, [r6, #44]	@ 0x2c
c0dea638:	a906      	add	r1, sp, #24
c0dea63a:	f7fc fc55 	bl	c0de6ee8 <nbgl_layoutAddHeader>
c0dea63e:	7d20      	ldrb	r0, [r4, #20]
c0dea640:	2801      	cmp	r0, #1
c0dea642:	d01b      	beq.n	c0dea67c <displayFullValuePage+0x178>
c0dea644:	2802      	cmp	r0, #2
c0dea646:	d01c      	beq.n	c0dea682 <displayFullValuePage+0x17e>
c0dea648:	2803      	cmp	r0, #3
c0dea64a:	d11d      	bne.n	c0dea688 <displayFullValuePage+0x184>
c0dea64c:	f44f 3080 	mov.w	r0, #65536	@ 0x10000
c0dea650:	9005      	str	r0, [sp, #20]
c0dea652:	cc07      	ldmia	r4!, {r0, r1, r2}
c0dea654:	9104      	str	r1, [sp, #16]
c0dea656:	2a00      	cmp	r2, #0
c0dea658:	9002      	str	r0, [sp, #8]
c0dea65a:	bf08      	it	eq
c0dea65c:	4602      	moveq	r2, r0
c0dea65e:	eb09 0008 	add.w	r0, r9, r8
c0dea662:	9203      	str	r2, [sp, #12]
c0dea664:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0dea666:	a902      	add	r1, sp, #8
c0dea668:	f7fb ffcd 	bl	c0de6606 <nbgl_layoutAddQRCode>
c0dea66c:	e014      	b.n	c0dea698 <displayFullValuePage+0x194>
c0dea66e:	2000      	movs	r0, #0
c0dea670:	2101      	movs	r1, #1
c0dea672:	b012      	add	sp, #72	@ 0x48
c0dea674:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea678:	f000 bb74 	b.w	c0dead64 <displayTagValueListModalPage>
c0dea67c:	4b0e      	ldr	r3, [pc, #56]	@ (c0dea6b8 <displayFullValuePage+0x1b4>)
c0dea67e:	447b      	add	r3, pc
c0dea680:	e003      	b.n	c0dea68a <displayFullValuePage+0x186>
c0dea682:	4b0e      	ldr	r3, [pc, #56]	@ (c0dea6bc <displayFullValuePage+0x1b8>)
c0dea684:	447b      	add	r3, pc
c0dea686:	e000      	b.n	c0dea68a <displayFullValuePage+0x186>
c0dea688:	6863      	ldr	r3, [r4, #4]
c0dea68a:	eb09 0008 	add.w	r0, r9, r8
c0dea68e:	6822      	ldr	r2, [r4, #0]
c0dea690:	4629      	mov	r1, r5
c0dea692:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0dea694:	f7fb fb7a 	bl	c0de5d8c <nbgl_layoutAddTextContent>
c0dea698:	eb09 0008 	add.w	r0, r9, r8
c0dea69c:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0dea69e:	f7fc ff40 	bl	c0de7522 <nbgl_layoutDraw>
c0dea6a2:	f001 f968 	bl	c0deb976 <nbgl_refresh>
c0dea6a6:	b012      	add	sp, #72	@ 0x48
c0dea6a8:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0dea6ac:	0000191c 	.word	0x0000191c
c0dea6b0:	00001bd4 	.word	0x00001bd4
c0dea6b4:	00005176 	.word	0x00005176
c0dea6b8:	00003406 	.word	0x00003406
c0dea6bc:	000037c4 	.word	0x000037c4

c0dea6c0 <displaySecurityReport>:
c0dea6c0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea6c4:	b09c      	sub	sp, #112	@ 0x70
c0dea6c6:	ac15      	add	r4, sp, #84	@ 0x54
c0dea6c8:	4977      	ldr	r1, [pc, #476]	@ (c0dea8a8 <displaySecurityReport+0x1e8>)
c0dea6ca:	4680      	mov	r8, r0
c0dea6cc:	221c      	movs	r2, #28
c0dea6ce:	4620      	mov	r0, r4
c0dea6d0:	4479      	add	r1, pc
c0dea6d2:	f001 fd85 	bl	c0dec1e0 <__aeabi_memcpy>
c0dea6d6:	4875      	ldr	r0, [pc, #468]	@ (c0dea8ac <displaySecurityReport+0x1ec>)
c0dea6d8:	a910      	add	r1, sp, #64	@ 0x40
c0dea6da:	4478      	add	r0, pc
c0dea6dc:	e890 00ec 	ldmia.w	r0, {r2, r3, r5, r6, r7}
c0dea6e0:	c1ec      	stmia	r1!, {r2, r3, r5, r6, r7}
c0dea6e2:	a80a      	add	r0, sp, #40	@ 0x28
c0dea6e4:	2118      	movs	r1, #24
c0dea6e6:	f001 fd85 	bl	c0dec1f4 <__aeabi_memclr>
c0dea6ea:	f8df b1b4 	ldr.w	fp, [pc, #436]	@ c0dea8a0 <displaySecurityReport+0x1e0>
c0dea6ee:	4620      	mov	r0, r4
c0dea6f0:	eb09 060b 	add.w	r6, r9, fp
c0dea6f4:	f7f9 fea4 	bl	c0de4440 <nbgl_layoutGet>
c0dea6f8:	4604      	mov	r4, r0
c0dea6fa:	f8c6 0084 	str.w	r0, [r6, #132]	@ 0x84
c0dea6fe:	f896 0088 	ldrb.w	r0, [r6, #136]	@ 0x88
c0dea702:	2801      	cmp	r0, #1
c0dea704:	d14f      	bne.n	c0dea7a6 <displaySecurityReport+0xe6>
c0dea706:	f896 0089 	ldrb.w	r0, [r6, #137]	@ 0x89
c0dea70a:	2800      	cmp	r0, #0
c0dea70c:	d14b      	bne.n	c0dea7a6 <displaySecurityReport+0xe6>
c0dea70e:	4868      	ldr	r0, [pc, #416]	@ (c0dea8b0 <displaySecurityReport+0x1f0>)
c0dea710:	2600      	movs	r6, #0
c0dea712:	ac01      	add	r4, sp, #4
c0dea714:	f04f 0800 	mov.w	r8, #0
c0dea718:	4478      	add	r0, pc
c0dea71a:	1d05      	adds	r5, r0, #4
c0dea71c:	2e05      	cmp	r6, #5
c0dea71e:	d038      	beq.n	c0dea792 <displaySecurityReport+0xd2>
c0dea720:	2e06      	cmp	r6, #6
c0dea722:	d076      	beq.n	c0dea812 <displaySecurityReport+0x152>
c0dea724:	eb09 000b 	add.w	r0, r9, fp
c0dea728:	f8d0 a078 	ldr.w	sl, [r0, #120]	@ 0x78
c0dea72c:	f8da 0000 	ldr.w	r0, [sl]
c0dea730:	40f0      	lsrs	r0, r6
c0dea732:	07c0      	lsls	r0, r0, #31
c0dea734:	d02d      	beq.n	c0dea792 <displaySecurityReport+0xd2>
c0dea736:	4620      	mov	r0, r4
c0dea738:	2118      	movs	r1, #24
c0dea73a:	f001 fd5b 	bl	c0dec1f4 <__aeabi_memclr>
c0dea73e:	f008 007f 	and.w	r0, r8, #127	@ 0x7f
c0dea742:	2804      	cmp	r0, #4
c0dea744:	d82a      	bhi.n	c0dea79c <displaySecurityReport+0xdc>
c0dea746:	2101      	movs	r1, #1
c0dea748:	fa01 f000 	lsl.w	r0, r1, r0
c0dea74c:	f010 0f19 	tst.w	r0, #25
c0dea750:	d024      	beq.n	c0dea79c <displaySecurityReport+0xdc>
c0dea752:	6868      	ldr	r0, [r5, #4]
c0dea754:	9004      	str	r0, [sp, #16]
c0dea756:	6828      	ldr	r0, [r5, #0]
c0dea758:	2e03      	cmp	r6, #3
c0dea75a:	9002      	str	r0, [sp, #8]
c0dea75c:	d101      	bne.n	c0dea762 <displaySecurityReport+0xa2>
c0dea75e:	20ff      	movs	r0, #255	@ 0xff
c0dea760:	e007      	b.n	c0dea772 <displaySecurityReport+0xb2>
c0dea762:	2009      	movs	r0, #9
c0dea764:	f88d 0018 	strb.w	r0, [sp, #24]
c0dea768:	4852      	ldr	r0, [pc, #328]	@ (c0dea8b4 <displaySecurityReport+0x1f4>)
c0dea76a:	4478      	add	r0, pc
c0dea76c:	9003      	str	r0, [sp, #12]
c0dea76e:	f106 001a 	add.w	r0, r6, #26
c0dea772:	f88d 0015 	strb.w	r0, [sp, #21]
c0dea776:	f855 0c04 	ldr.w	r0, [r5, #-4]
c0dea77a:	eb09 070b 	add.w	r7, r9, fp
c0dea77e:	4621      	mov	r1, r4
c0dea780:	9001      	str	r0, [sp, #4]
c0dea782:	f8d7 0084 	ldr.w	r0, [r7, #132]	@ 0x84
c0dea786:	f7fb f80a 	bl	c0de579e <nbgl_layoutAddTouchableBar>
c0dea78a:	f8d7 0084 	ldr.w	r0, [r7, #132]	@ 0x84
c0dea78e:	f7fc fa79 	bl	c0de6c84 <nbgl_layoutAddSeparationLine>
c0dea792:	350c      	adds	r5, #12
c0dea794:	f108 0801 	add.w	r8, r8, #1
c0dea798:	3601      	adds	r6, #1
c0dea79a:	e7bf      	b.n	c0dea71c <displaySecurityReport+0x5c>
c0dea79c:	f8da 0010 	ldr.w	r0, [sl, #16]
c0dea7a0:	2800      	cmp	r0, #0
c0dea7a2:	d1d7      	bne.n	c0dea754 <displaySecurityReport+0x94>
c0dea7a4:	e7d5      	b.n	c0dea752 <displaySecurityReport+0x92>
c0dea7a6:	eb09 000b 	add.w	r0, r9, fp
c0dea7aa:	6f80      	ldr	r0, [r0, #120]	@ 0x78
c0dea7ac:	b108      	cbz	r0, c0dea7b2 <displaySecurityReport+0xf2>
c0dea7ae:	68c6      	ldr	r6, [r0, #12]
c0dea7b0:	b90e      	cbnz	r6, c0dea7b6 <displaySecurityReport+0xf6>
c0dea7b2:	4e41      	ldr	r6, [pc, #260]	@ (c0dea8b8 <displaySecurityReport+0x1f8>)
c0dea7b4:	447e      	add	r6, pc
c0dea7b6:	f018 0f06 	tst.w	r8, #6
c0dea7ba:	d033      	beq.n	c0dea824 <displaySecurityReport+0x164>
c0dea7bc:	f44f 3180 	mov.w	r1, #65536	@ 0x10000
c0dea7c0:	9104      	str	r1, [sp, #16]
c0dea7c2:	493e      	ldr	r1, [pc, #248]	@ (c0dea8bc <displaySecurityReport+0x1fc>)
c0dea7c4:	4479      	add	r1, pc
c0dea7c6:	9103      	str	r1, [sp, #12]
c0dea7c8:	2140      	movs	r1, #64	@ 0x40
c0dea7ca:	6883      	ldr	r3, [r0, #8]
c0dea7cc:	4835      	ldr	r0, [pc, #212]	@ (c0dea8a4 <displaySecurityReport+0x1e4>)
c0dea7ce:	4448      	add	r0, r9
c0dea7d0:	9302      	str	r3, [sp, #8]
c0dea7d2:	f100 0440 	add.w	r4, r0, #64	@ 0x40
c0dea7d6:	9401      	str	r4, [sp, #4]
c0dea7d8:	4620      	mov	r0, r4
c0dea7da:	4a39      	ldr	r2, [pc, #228]	@ (c0dea8c0 <displaySecurityReport+0x200>)
c0dea7dc:	447a      	add	r2, pc
c0dea7de:	f001 f955 	bl	c0deba8c <snprintf>
c0dea7e2:	4620      	mov	r0, r4
c0dea7e4:	f001 fd62 	bl	c0dec2ac <strlen>
c0dea7e8:	4605      	mov	r5, r0
c0dea7ea:	f000 fc19 	bl	c0deb020 <OUTLINED_FUNCTION_9>
c0dea7ee:	a901      	add	r1, sp, #4
c0dea7f0:	f7fb ff09 	bl	c0de6606 <nbgl_layoutAddQRCode>
c0dea7f4:	2018      	movs	r0, #24
c0dea7f6:	f1c5 013f 	rsb	r1, r5, #63	@ 0x3f
c0dea7fa:	4633      	mov	r3, r6
c0dea7fc:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0dea800:	1928      	adds	r0, r5, r4
c0dea802:	4a30      	ldr	r2, [pc, #192]	@ (c0dea8c4 <displaySecurityReport+0x204>)
c0dea804:	1c44      	adds	r4, r0, #1
c0dea806:	4620      	mov	r0, r4
c0dea808:	447a      	add	r2, pc
c0dea80a:	f001 f93f 	bl	c0deba8c <snprintf>
c0dea80e:	9412      	str	r4, [sp, #72]	@ 0x48
c0dea810:	e031      	b.n	c0dea876 <displaySecurityReport+0x1b6>
c0dea812:	4832      	ldr	r0, [pc, #200]	@ (c0dea8dc <displaySecurityReport+0x21c>)
c0dea814:	4478      	add	r0, pc
c0dea816:	9012      	str	r0, [sp, #72]	@ 0x48
c0dea818:	f000 fc02 	bl	c0deb020 <OUTLINED_FUNCTION_9>
c0dea81c:	a910      	add	r1, sp, #64	@ 0x40
c0dea81e:	f7fc fb63 	bl	c0de6ee8 <nbgl_layoutAddHeader>
c0dea822:	e034      	b.n	c0dea88e <displaySecurityReport+0x1ce>
c0dea824:	ea5f 60c8 	movs.w	r0, r8, lsl #27
c0dea828:	d40d      	bmi.n	c0dea846 <displaySecurityReport+0x186>
c0dea82a:	ea5f 70c8 	movs.w	r0, r8, lsl #31
c0dea82e:	d0f3      	beq.n	c0dea818 <displaySecurityReport+0x158>
c0dea830:	ad01      	add	r5, sp, #4
c0dea832:	2124      	movs	r1, #36	@ 0x24
c0dea834:	4628      	mov	r0, r5
c0dea836:	f001 fcdd 	bl	c0dec1f4 <__aeabi_memclr>
c0dea83a:	4826      	ldr	r0, [pc, #152]	@ (c0dea8d4 <displaySecurityReport+0x214>)
c0dea83c:	4478      	add	r0, pc
c0dea83e:	9007      	str	r0, [sp, #28]
c0dea840:	4825      	ldr	r0, [pc, #148]	@ (c0dea8d8 <displaySecurityReport+0x218>)
c0dea842:	4478      	add	r0, pc
c0dea844:	e009      	b.n	c0dea85a <displaySecurityReport+0x19a>
c0dea846:	ad01      	add	r5, sp, #4
c0dea848:	2124      	movs	r1, #36	@ 0x24
c0dea84a:	4628      	mov	r0, r5
c0dea84c:	f001 fcd2 	bl	c0dec1f4 <__aeabi_memclr>
c0dea850:	481d      	ldr	r0, [pc, #116]	@ (c0dea8c8 <displaySecurityReport+0x208>)
c0dea852:	4478      	add	r0, pc
c0dea854:	9007      	str	r0, [sp, #28]
c0dea856:	481d      	ldr	r0, [pc, #116]	@ (c0dea8cc <displaySecurityReport+0x20c>)
c0dea858:	4478      	add	r0, pc
c0dea85a:	9005      	str	r0, [sp, #20]
c0dea85c:	4629      	mov	r1, r5
c0dea85e:	481c      	ldr	r0, [pc, #112]	@ (c0dea8d0 <displaySecurityReport+0x210>)
c0dea860:	4478      	add	r0, pc
c0dea862:	9002      	str	r0, [sp, #8]
c0dea864:	4620      	mov	r0, r4
c0dea866:	f7fb fec5 	bl	c0de65f4 <nbgl_layoutAddContentCenter>
c0dea86a:	2028      	movs	r0, #40	@ 0x28
c0dea86c:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0dea870:	2000      	movs	r0, #0
c0dea872:	f88d 0041 	strb.w	r0, [sp, #65]	@ 0x41
c0dea876:	eb09 040b 	add.w	r4, r9, fp
c0dea87a:	f8d4 0084 	ldr.w	r0, [r4, #132]	@ 0x84
c0dea87e:	a910      	add	r1, sp, #64	@ 0x40
c0dea880:	f7fc fb32 	bl	c0de6ee8 <nbgl_layoutAddHeader>
c0dea884:	f8d4 0084 	ldr.w	r0, [r4, #132]	@ 0x84
c0dea888:	a90a      	add	r1, sp, #40	@ 0x28
c0dea88a:	f7fa fbdb 	bl	c0de5044 <nbgl_layoutAddExtendedFooter>
c0dea88e:	f000 fbc7 	bl	c0deb020 <OUTLINED_FUNCTION_9>
c0dea892:	f7fc fe46 	bl	c0de7522 <nbgl_layoutDraw>
c0dea896:	f001 f86e 	bl	c0deb976 <nbgl_refresh>
c0dea89a:	b01c      	add	sp, #112	@ 0x70
c0dea89c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0dea8a0:	0000191c 	.word	0x0000191c
c0dea8a4:	00001a54 	.word	0x00001a54
c0dea8a8:	000050b4 	.word	0x000050b4
c0dea8ac:	000050c6 	.word	0x000050c6
c0dea8b0:	0000509c 	.word	0x0000509c
c0dea8b4:	000028b1 	.word	0x000028b1
c0dea8b8:	0000357b 	.word	0x0000357b
c0dea8bc:	000033bc 	.word	0x000033bc
c0dea8c0:	0000325b 	.word	0x0000325b
c0dea8c4:	0000330e 	.word	0x0000330e
c0dea8c8:	00003347 	.word	0x00003347
c0dea8cc:	00003435 	.word	0x00003435
c0dea8d0:	00002649 	.word	0x00002649
c0dea8d4:	0000306a 	.word	0x0000306a
c0dea8d8:	00003006 	.word	0x00003006
c0dea8dc:	0000329a 	.word	0x0000329a

c0dea8e0 <displayCustomizedSecurityReport>:
c0dea8e0:	b580      	push	{r7, lr}
c0dea8e2:	2117      	movs	r1, #23
c0dea8e4:	f000 f8f2 	bl	c0deaacc <displayModalDetails>
c0dea8e8:	4902      	ldr	r1, [pc, #8]	@ (c0dea8f4 <displayCustomizedSecurityReport+0x14>)
c0dea8ea:	4449      	add	r1, r9
c0dea8ec:	f8c1 0084 	str.w	r0, [r1, #132]	@ 0x84
c0dea8f0:	bd80      	pop	{r7, pc}
c0dea8f2:	bf00      	nop
c0dea8f4:	0000191c 	.word	0x0000191c

c0dea8f8 <displayInfosListModal>:
c0dea8f8:	b570      	push	{r4, r5, r6, lr}
c0dea8fa:	b098      	sub	sp, #96	@ 0x60
c0dea8fc:	4606      	mov	r6, r0
c0dea8fe:	460c      	mov	r4, r1
c0dea900:	a811      	add	r0, sp, #68	@ 0x44
c0dea902:	491c      	ldr	r1, [pc, #112]	@ (c0dea974 <displayInfosListModal+0x7c>)
c0dea904:	4615      	mov	r5, r2
c0dea906:	221c      	movs	r2, #28
c0dea908:	4479      	add	r1, pc
c0dea90a:	f001 fc69 	bl	c0dec1e0 <__aeabi_memcpy>
c0dea90e:	2008      	movs	r0, #8
c0dea910:	f88d 0010 	strb.w	r0, [sp, #16]
c0dea914:	2000      	movs	r0, #0
c0dea916:	9003      	str	r0, [sp, #12]
c0dea918:	4814      	ldr	r0, [pc, #80]	@ (c0dea96c <displayInfosListModal+0x74>)
c0dea91a:	e9cd 6001 	strd	r6, r0, [sp, #4]
c0dea91e:	200f      	movs	r0, #15
c0dea920:	2d00      	cmp	r5, #0
c0dea922:	bf18      	it	ne
c0dea924:	200e      	movne	r0, #14
c0dea926:	f88d 0021 	strb.w	r0, [sp, #33]	@ 0x21
c0dea92a:	e894 0007 	ldmia.w	r4, {r0, r1, r2}
c0dea92e:	ab05      	add	r3, sp, #20
c0dea930:	c307      	stmia	r3!, {r0, r1, r2}
c0dea932:	7b20      	ldrb	r0, [r4, #12]
c0dea934:	f88d 0020 	strb.w	r0, [sp, #32]
c0dea938:	7ba0      	ldrb	r0, [r4, #14]
c0dea93a:	4c0d      	ldr	r4, [pc, #52]	@ (c0dea970 <displayInfosListModal+0x78>)
c0dea93c:	f88d 0022 	strb.w	r0, [sp, #34]	@ 0x22
c0dea940:	eb09 0004 	add.w	r0, r9, r4
c0dea944:	6a00      	ldr	r0, [r0, #32]
c0dea946:	b108      	cbz	r0, c0dea94c <displayInfosListModal+0x54>
c0dea948:	f7fd fe85 	bl	c0de8656 <nbgl_pageRelease>
c0dea94c:	480a      	ldr	r0, [pc, #40]	@ (c0dea978 <displayInfosListModal+0x80>)
c0dea94e:	a911      	add	r1, sp, #68	@ 0x44
c0dea950:	aa01      	add	r2, sp, #4
c0dea952:	2301      	movs	r3, #1
c0dea954:	4478      	add	r0, pc
c0dea956:	f7fd fc57 	bl	c0de8208 <nbgl_pageDrawGenericContentExt>
c0dea95a:	eb09 0104 	add.w	r1, r9, r4
c0dea95e:	6208      	str	r0, [r1, #32]
c0dea960:	2002      	movs	r0, #2
c0dea962:	f001 f80d 	bl	c0deb980 <nbgl_refreshSpecial>
c0dea966:	b018      	add	sp, #96	@ 0x60
c0dea968:	bd70      	pop	{r4, r5, r6, pc}
c0dea96a:	bf00      	nop
c0dea96c:	00091400 	.word	0x00091400
c0dea970:	00001bd4 	.word	0x00001bd4
c0dea974:	00004ef4 	.word	0x00004ef4
c0dea978:	ffffeff9 	.word	0xffffeff9

c0dea97c <modalLayoutTouchCallback>:
c0dea97c:	b570      	push	{r4, r5, r6, lr}
c0dea97e:	2818      	cmp	r0, #24
c0dea980:	d00c      	beq.n	c0dea99c <modalLayoutTouchCallback+0x20>
c0dea982:	2817      	cmp	r0, #23
c0dea984:	d019      	beq.n	c0dea9ba <modalLayoutTouchCallback+0x3e>
c0dea986:	2816      	cmp	r0, #22
c0dea988:	d128      	bne.n	c0dea9dc <modalLayoutTouchCallback+0x60>
c0dea98a:	484f      	ldr	r0, [pc, #316]	@ (c0deaac8 <modalLayoutTouchCallback+0x14c>)
c0dea98c:	eb09 0400 	add.w	r4, r9, r0
c0dea990:	6da0      	ldr	r0, [r4, #88]	@ 0x58
c0dea992:	f7fc fde5 	bl	c0de7560 <nbgl_layoutRelease>
c0dea996:	2000      	movs	r0, #0
c0dea998:	65a0      	str	r0, [r4, #88]	@ 0x58
c0dea99a:	e055      	b.n	c0deaa48 <modalLayoutTouchCallback+0xcc>
c0dea99c:	4c49      	ldr	r4, [pc, #292]	@ (c0deaac4 <modalLayoutTouchCallback+0x148>)
c0dea99e:	eb09 0504 	add.w	r5, r9, r4
c0dea9a2:	6e68      	ldr	r0, [r5, #100]	@ 0x64
c0dea9a4:	f7fc fddc 	bl	c0de7560 <nbgl_layoutRelease>
c0dea9a8:	f895 0068 	ldrb.w	r0, [r5, #104]	@ 0x68
c0dea9ac:	2801      	cmp	r0, #1
c0dea9ae:	d832      	bhi.n	c0deaa16 <modalLayoutTouchCallback+0x9a>
c0dea9b0:	eb09 0004 	add.w	r0, r9, r4
c0dea9b4:	2100      	movs	r1, #0
c0dea9b6:	6641      	str	r1, [r0, #100]	@ 0x64
c0dea9b8:	e046      	b.n	c0deaa48 <modalLayoutTouchCallback+0xcc>
c0dea9ba:	4c42      	ldr	r4, [pc, #264]	@ (c0deaac4 <modalLayoutTouchCallback+0x148>)
c0dea9bc:	eb09 0504 	add.w	r5, r9, r4
c0dea9c0:	f8d5 0084 	ldr.w	r0, [r5, #132]	@ 0x84
c0dea9c4:	f7fc fdcc 	bl	c0de7560 <nbgl_layoutRelease>
c0dea9c8:	f895 0088 	ldrb.w	r0, [r5, #136]	@ 0x88
c0dea9cc:	2801      	cmp	r0, #1
c0dea9ce:	d829      	bhi.n	c0deaa24 <modalLayoutTouchCallback+0xa8>
c0dea9d0:	eb09 0004 	add.w	r0, r9, r4
c0dea9d4:	2100      	movs	r1, #0
c0dea9d6:	f8c0 1084 	str.w	r1, [r0, #132]	@ 0x84
c0dea9da:	e035      	b.n	c0deaa48 <modalLayoutTouchCallback+0xcc>
c0dea9dc:	f1a0 041a 	sub.w	r4, r0, #26
c0dea9e0:	2c05      	cmp	r4, #5
c0dea9e2:	d829      	bhi.n	c0deaa38 <modalLayoutTouchCallback+0xbc>
c0dea9e4:	4d37      	ldr	r5, [pc, #220]	@ (c0deaac4 <modalLayoutTouchCallback+0x148>)
c0dea9e6:	eb09 0005 	add.w	r0, r9, r5
c0dea9ea:	f890 008c 	ldrb.w	r0, [r0, #140]	@ 0x8c
c0dea9ee:	2802      	cmp	r0, #2
c0dea9f0:	d03d      	beq.n	c0deaa6e <modalLayoutTouchCallback+0xf2>
c0dea9f2:	2801      	cmp	r0, #1
c0dea9f4:	d164      	bne.n	c0deaac0 <modalLayoutTouchCallback+0x144>
c0dea9f6:	eb09 0605 	add.w	r6, r9, r5
c0dea9fa:	f8d6 0084 	ldr.w	r0, [r6, #132]	@ 0x84
c0dea9fe:	f7fc fdaf 	bl	c0de7560 <nbgl_layoutRelease>
c0deaa02:	2002      	movs	r0, #2
c0deaa04:	f886 0088 	strb.w	r0, [r6, #136]	@ 0x88
c0deaa08:	6fb0      	ldr	r0, [r6, #120]	@ 0x78
c0deaa0a:	6801      	ldr	r1, [r0, #0]
c0deaa0c:	2900      	cmp	r1, #0
c0deaa0e:	d046      	beq.n	c0deaa9e <modalLayoutTouchCallback+0x122>
c0deaa10:	2001      	movs	r0, #1
c0deaa12:	40a0      	lsls	r0, r4
c0deaa14:	e00c      	b.n	c0deaa30 <modalLayoutTouchCallback+0xb4>
c0deaa16:	444c      	add	r4, r9
c0deaa18:	2001      	movs	r0, #1
c0deaa1a:	2118      	movs	r1, #24
c0deaa1c:	f000 fb2b 	bl	c0deb076 <OUTLINED_FUNCTION_19>
c0deaa20:	6660      	str	r0, [r4, #100]	@ 0x64
c0deaa22:	e013      	b.n	c0deaa4c <modalLayoutTouchCallback+0xd0>
c0deaa24:	eb09 0004 	add.w	r0, r9, r4
c0deaa28:	2101      	movs	r1, #1
c0deaa2a:	f000 faed 	bl	c0deb008 <OUTLINED_FUNCTION_6>
c0deaa2e:	d011      	beq.n	c0deaa54 <modalLayoutTouchCallback+0xd8>
c0deaa30:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0deaa34:	f7ff be44 	b.w	c0dea6c0 <displaySecurityReport>
c0deaa38:	4822      	ldr	r0, [pc, #136]	@ (c0deaac4 <modalLayoutTouchCallback+0x148>)
c0deaa3a:	eb09 0400 	add.w	r4, r9, r0
c0deaa3e:	6ae0      	ldr	r0, [r4, #44]	@ 0x2c
c0deaa40:	f7fc fd8e 	bl	c0de7560 <nbgl_layoutRelease>
c0deaa44:	2000      	movs	r0, #0
c0deaa46:	62e0      	str	r0, [r4, #44]	@ 0x2c
c0deaa48:	f000 ffbd 	bl	c0deb9c6 <nbgl_screenRedraw>
c0deaa4c:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0deaa50:	f000 bf91 	b.w	c0deb976 <nbgl_refresh>
c0deaa54:	eb09 0004 	add.w	r0, r9, r4
c0deaa58:	2214      	movs	r2, #20
c0deaa5a:	f890 0089 	ldrb.w	r0, [r0, #137]	@ 0x89
c0deaa5e:	2800      	cmp	r0, #0
c0deaa60:	bf08      	it	eq
c0deaa62:	2218      	moveq	r2, #24
c0deaa64:	5888      	ldr	r0, [r1, r2]
c0deaa66:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0deaa6a:	f7ff bf39 	b.w	c0dea8e0 <displayCustomizedSecurityReport>
c0deaa6e:	eb09 0105 	add.w	r1, r9, r5
c0deaa72:	202c      	movs	r0, #44	@ 0x2c
c0deaa74:	6dc9      	ldr	r1, [r1, #92]	@ 0x5c
c0deaa76:	fb04 f200 	mul.w	r2, r4, r0
c0deaa7a:	6989      	ldr	r1, [r1, #24]
c0deaa7c:	588a      	ldr	r2, [r1, r2]
c0deaa7e:	b1fa      	cbz	r2, c0deaac0 <modalLayoutTouchCallback+0x144>
c0deaa80:	444d      	add	r5, r9
c0deaa82:	fb04 1400 	mla	r4, r4, r0, r1
c0deaa86:	6e68      	ldr	r0, [r5, #100]	@ 0x64
c0deaa88:	f7fc fd6a 	bl	c0de7560 <nbgl_layoutRelease>
c0deaa8c:	2002      	movs	r0, #2
c0deaa8e:	2118      	movs	r1, #24
c0deaa90:	f885 0068 	strb.w	r0, [r5, #104]	@ 0x68
c0deaa94:	4620      	mov	r0, r4
c0deaa96:	f000 f819 	bl	c0deaacc <displayModalDetails>
c0deaa9a:	6668      	str	r0, [r5, #100]	@ 0x64
c0deaa9c:	e010      	b.n	c0deaac0 <modalLayoutTouchCallback+0x144>
c0deaa9e:	eb09 0105 	add.w	r1, r9, r5
c0deaaa2:	2214      	movs	r2, #20
c0deaaa4:	f891 1089 	ldrb.w	r1, [r1, #137]	@ 0x89
c0deaaa8:	2900      	cmp	r1, #0
c0deaaaa:	bf08      	it	eq
c0deaaac:	2218      	moveq	r2, #24
c0deaaae:	5880      	ldr	r0, [r0, r2]
c0deaab0:	7901      	ldrb	r1, [r0, #4]
c0deaab2:	2903      	cmp	r1, #3
c0deaab4:	d104      	bne.n	c0deaac0 <modalLayoutTouchCallback+0x144>
c0deaab6:	6980      	ldr	r0, [r0, #24]
c0deaab8:	212c      	movs	r1, #44	@ 0x2c
c0deaaba:	fb04 0001 	mla	r0, r4, r1, r0
c0deaabe:	e7d2      	b.n	c0deaa66 <modalLayoutTouchCallback+0xea>
c0deaac0:	bd70      	pop	{r4, r5, r6, pc}
c0deaac2:	bf00      	nop
c0deaac4:	0000191c 	.word	0x0000191c
c0deaac8:	00001c50 	.word	0x00001c50

c0deaacc <displayModalDetails>:
c0deaacc:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0deaad0:	b092      	sub	sp, #72	@ 0x48
c0deaad2:	460d      	mov	r5, r1
c0deaad4:	ae0b      	add	r6, sp, #44	@ 0x2c
c0deaad6:	4938      	ldr	r1, [pc, #224]	@ (c0deabb8 <displayModalDetails+0xec>)
c0deaad8:	4604      	mov	r4, r0
c0deaada:	221c      	movs	r2, #28
c0deaadc:	4630      	mov	r0, r6
c0deaade:	4479      	add	r1, pc
c0deaae0:	f001 fb7e 	bl	c0dec1e0 <__aeabi_memcpy>
c0deaae4:	af06      	add	r7, sp, #24
c0deaae6:	2114      	movs	r1, #20
c0deaae8:	4638      	mov	r0, r7
c0deaaea:	f001 fb83 	bl	c0dec1f4 <__aeabi_memclr>
c0deaaee:	2009      	movs	r0, #9
c0deaaf0:	f88d 5024 	strb.w	r5, [sp, #36]	@ 0x24
c0deaaf4:	f88d 0025 	strb.w	r0, [sp, #37]	@ 0x25
c0deaaf8:	f240 1001 	movw	r0, #257	@ 0x101
c0deaafc:	f8ad 0018 	strh.w	r0, [sp, #24]
c0deab00:	4630      	mov	r0, r6
c0deab02:	f7f9 fc9d 	bl	c0de4440 <nbgl_layoutGet>
c0deab06:	4605      	mov	r5, r0
c0deab08:	6820      	ldr	r0, [r4, #0]
c0deab0a:	4639      	mov	r1, r7
c0deab0c:	9008      	str	r0, [sp, #32]
c0deab0e:	4628      	mov	r0, r5
c0deab10:	f7fc f9ea 	bl	c0de6ee8 <nbgl_layoutAddHeader>
c0deab14:	7920      	ldrb	r0, [r4, #4]
c0deab16:	2801      	cmp	r0, #1
c0deab18:	d035      	beq.n	c0deab86 <displayModalDetails+0xba>
c0deab1a:	2802      	cmp	r0, #2
c0deab1c:	d03c      	beq.n	c0deab98 <displayModalDetails+0xcc>
c0deab1e:	2803      	cmp	r0, #3
c0deab20:	d141      	bne.n	c0deaba6 <displayModalDetails+0xda>
c0deab22:	4f26      	ldr	r7, [pc, #152]	@ (c0deabbc <displayModalDetails+0xf0>)
c0deab24:	f04f 0a00 	mov.w	sl, #0
c0deab28:	2604      	movs	r6, #4
c0deab2a:	46e8      	mov	r8, sp
c0deab2c:	f04f 0b00 	mov.w	fp, #0
c0deab30:	447f      	add	r7, pc
c0deab32:	7a20      	ldrb	r0, [r4, #8]
c0deab34:	4583      	cmp	fp, r0
c0deab36:	d236      	bcs.n	c0deaba6 <displayModalDetails+0xda>
c0deab38:	f104 030c 	add.w	r3, r4, #12
c0deab3c:	cb0f      	ldmia	r3, {r0, r1, r2, r3}
c0deab3e:	f850 002b 	ldr.w	r0, [r0, fp, lsl #2]
c0deab42:	9001      	str	r0, [sp, #4]
c0deab44:	f851 002b 	ldr.w	r0, [r1, fp, lsl #2]
c0deab48:	4641      	mov	r1, r8
c0deab4a:	9003      	str	r0, [sp, #12]
c0deab4c:	5d98      	ldrb	r0, [r3, r6]
c0deab4e:	2800      	cmp	r0, #0
c0deab50:	bf18      	it	ne
c0deab52:	4638      	movne	r0, r7
c0deab54:	9002      	str	r0, [sp, #8]
c0deab56:	f88d a012 	strb.w	sl, [sp, #18]
c0deab5a:	f88d a010 	strb.w	sl, [sp, #16]
c0deab5e:	2009      	movs	r0, #9
c0deab60:	f88d 0014 	strb.w	r0, [sp, #20]
c0deab64:	f10b 001a 	add.w	r0, fp, #26
c0deab68:	f88d 0011 	strb.w	r0, [sp, #17]
c0deab6c:	f852 002b 	ldr.w	r0, [r2, fp, lsl #2]
c0deab70:	9000      	str	r0, [sp, #0]
c0deab72:	4628      	mov	r0, r5
c0deab74:	f7fa fe13 	bl	c0de579e <nbgl_layoutAddTouchableBar>
c0deab78:	4628      	mov	r0, r5
c0deab7a:	f7fc f883 	bl	c0de6c84 <nbgl_layoutAddSeparationLine>
c0deab7e:	362c      	adds	r6, #44	@ 0x2c
c0deab80:	f10b 0b01 	add.w	fp, fp, #1
c0deab84:	e7d5      	b.n	c0deab32 <displayModalDetails+0x66>
c0deab86:	f104 0108 	add.w	r1, r4, #8
c0deab8a:	4628      	mov	r0, r5
c0deab8c:	f7fb fd32 	bl	c0de65f4 <nbgl_layoutAddContentCenter>
c0deab90:	2000      	movs	r0, #0
c0deab92:	f88d 0019 	strb.w	r0, [sp, #25]
c0deab96:	e006      	b.n	c0deaba6 <displayModalDetails+0xda>
c0deab98:	f104 0108 	add.w	r1, r4, #8
c0deab9c:	4628      	mov	r0, r5
c0deab9e:	f7fb fd32 	bl	c0de6606 <nbgl_layoutAddQRCode>
c0deaba2:	6820      	ldr	r0, [r4, #0]
c0deaba4:	9008      	str	r0, [sp, #32]
c0deaba6:	4628      	mov	r0, r5
c0deaba8:	f7fc fcbb 	bl	c0de7522 <nbgl_layoutDraw>
c0deabac:	f000 fee3 	bl	c0deb976 <nbgl_refresh>
c0deabb0:	4628      	mov	r0, r5
c0deabb2:	b012      	add	sp, #72	@ 0x48
c0deabb4:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0deabb8:	00004ca6 	.word	0x00004ca6
c0deabbc:	000024eb 	.word	0x000024eb

c0deabc0 <displayDetailsPage>:
c0deabc0:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0deabc4:	b09b      	sub	sp, #108	@ 0x6c
c0deabc6:	f8df a190 	ldr.w	sl, [pc, #400]	@ c0dead58 <displayDetailsPage+0x198>
c0deabca:	4604      	mov	r4, r0
c0deabcc:	f88d 004c 	strb.w	r0, [sp, #76]	@ 0x4c
c0deabd0:	2000      	movs	r0, #0
c0deabd2:	460e      	mov	r6, r1
c0deabd4:	495f      	ldr	r1, [pc, #380]	@ (c0dead54 <displayDetailsPage+0x194>)
c0deabd6:	9018      	str	r0, [sp, #96]	@ 0x60
c0deabd8:	f88d 0058 	strb.w	r0, [sp, #88]	@ 0x58
c0deabdc:	9015      	str	r0, [sp, #84]	@ 0x54
c0deabde:	f44f 6010 	mov.w	r0, #2304	@ 0x900
c0deabe2:	eb09 050a 	add.w	r5, r9, sl
c0deabe6:	f8ad 0050 	strh.w	r0, [sp, #80]	@ 0x50
c0deabea:	f44f 7081 	mov.w	r0, #258	@ 0x102
c0deabee:	9117      	str	r1, [sp, #92]	@ 0x5c
c0deabf0:	2140      	movs	r1, #64	@ 0x40
c0deabf2:	f895 8030 	ldrb.w	r8, [r5, #48]	@ 0x30
c0deabf6:	f8ad 004e 	strh.w	r0, [sp, #78]	@ 0x4e
c0deabfa:	f88d 804d 	strb.w	r8, [sp, #77]	@ 0x4d
c0deabfe:	a803      	add	r0, sp, #12
c0deac00:	f001 faf8 	bl	c0dec1f4 <__aeabi_memclr>
c0deac04:	2001      	movs	r0, #1
c0deac06:	f88d 0029 	strb.w	r0, [sp, #41]	@ 0x29
c0deac0a:	f88d 0024 	strb.w	r0, [sp, #36]	@ 0x24
c0deac0e:	f105 0040 	add.w	r0, r5, #64	@ 0x40
c0deac12:	9007      	str	r0, [sp, #28]
c0deac14:	2004      	movs	r0, #4
c0deac16:	f88d 0018 	strb.w	r0, [sp, #24]
c0deac1a:	f895 0033 	ldrb.w	r0, [r5, #51]	@ 0x33
c0deac1e:	f88d 002a 	strb.w	r0, [sp, #42]	@ 0x2a
c0deac22:	6a28      	ldr	r0, [r5, #32]
c0deac24:	b108      	cbz	r0, c0deac2a <displayDetailsPage+0x6a>
c0deac26:	f7fd fd16 	bl	c0de8656 <nbgl_pageRelease>
c0deac2a:	eb09 000a 	add.w	r0, r9, sl
c0deac2e:	6b41      	ldr	r1, [r0, #52]	@ 0x34
c0deac30:	6401      	str	r1, [r0, #64]	@ 0x40
c0deac32:	f890 0031 	ldrb.w	r0, [r0, #49]	@ 0x31
c0deac36:	42a0      	cmp	r0, r4
c0deac38:	d207      	bcs.n	c0deac4a <displayDetailsPage+0x8a>
c0deac3a:	2501      	movs	r5, #1
c0deac3c:	eb09 000a 	add.w	r0, r9, sl
c0deac40:	2e00      	cmp	r6, #0
c0deac42:	bf18      	it	ne
c0deac44:	2502      	movne	r5, #2
c0deac46:	6bc6      	ldr	r6, [r0, #60]	@ 0x3c
c0deac48:	e02d      	b.n	c0deaca6 <displayDetailsPage+0xe6>
c0deac4a:	eb09 000a 	add.w	r0, r9, sl
c0deac4e:	2500      	movs	r5, #0
c0deac50:	f10d 076a 	add.w	r7, sp, #106	@ 0x6a
c0deac54:	6b86      	ldr	r6, [r0, #56]	@ 0x38
c0deac56:	42a5      	cmp	r5, r4
c0deac58:	d224      	bcs.n	c0deaca4 <displayDetailsPage+0xe4>
c0deac5a:	200c      	movs	r0, #12
c0deac5c:	4631      	mov	r1, r6
c0deac5e:	f000 f9f8 	bl	c0deb052 <OUTLINED_FUNCTION_15>
c0deac62:	280c      	cmp	r0, #12
c0deac64:	d31c      	bcc.n	c0deaca0 <displayDetailsPage+0xe0>
c0deac66:	eb09 000a 	add.w	r0, r9, sl
c0deac6a:	4631      	mov	r1, r6
c0deac6c:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0deac70:	230b      	movs	r3, #11
c0deac72:	f890 0033 	ldrb.w	r0, [r0, #51]	@ 0x33
c0deac76:	e9cd 7000 	strd	r7, r0, [sp]
c0deac7a:	200c      	movs	r0, #12
c0deac7c:	f000 fedf 	bl	c0deba3e <nbgl_getTextMaxLenInNbLines>
c0deac80:	f8bd 006a 	ldrh.w	r0, [sp, #106]	@ 0x6a
c0deac84:	5c31      	ldrb	r1, [r6, r0]
c0deac86:	290a      	cmp	r1, #10
c0deac88:	d101      	bne.n	c0deac8e <displayDetailsPage+0xce>
c0deac8a:	3001      	adds	r0, #1
c0deac8c:	e006      	b.n	c0deac9c <displayDetailsPage+0xdc>
c0deac8e:	eb09 010a 	add.w	r1, r9, sl
c0deac92:	f891 1033 	ldrb.w	r1, [r1, #51]	@ 0x33
c0deac96:	2900      	cmp	r1, #0
c0deac98:	bf08      	it	eq
c0deac9a:	3803      	subeq	r0, #3
c0deac9c:	b280      	uxth	r0, r0
c0deac9e:	4406      	add	r6, r0
c0deaca0:	3501      	adds	r5, #1
c0deaca2:	e7d8      	b.n	c0deac56 <displayDetailsPage+0x96>
c0deaca4:	2502      	movs	r5, #2
c0deaca6:	eb09 000a 	add.w	r0, r9, sl
c0deacaa:	4631      	mov	r1, r6
c0deacac:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0deacb0:	f890 3033 	ldrb.w	r3, [r0, #51]	@ 0x33
c0deacb4:	f880 4031 	strb.w	r4, [r0, #49]	@ 0x31
c0deacb8:	6446      	str	r6, [r0, #68]	@ 0x44
c0deacba:	200c      	movs	r0, #12
c0deacbc:	f000 feb5 	bl	c0deba2a <nbgl_getTextNbLinesInWidth>
c0deacc0:	280c      	cmp	r0, #12
c0deacc2:	d319      	bcc.n	c0deacf8 <displayDetailsPage+0x138>
c0deacc4:	eb09 040a 	add.w	r4, r9, sl
c0deacc8:	f10d 026a 	add.w	r2, sp, #106	@ 0x6a
c0deaccc:	230b      	movs	r3, #11
c0deacce:	f894 0033 	ldrb.w	r0, [r4, #51]	@ 0x33
c0deacd2:	6c61      	ldr	r1, [r4, #68]	@ 0x44
c0deacd4:	e9cd 2000 	strd	r2, r0, [sp]
c0deacd8:	200c      	movs	r0, #12
c0deacda:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0deacde:	f000 feae 	bl	c0deba3e <nbgl_getTextMaxLenInNbLines>
c0deace2:	2000      	movs	r0, #0
c0deace4:	f8bd 106a 	ldrh.w	r1, [sp, #106]	@ 0x6a
c0deace8:	f88d 0026 	strb.w	r0, [sp, #38]	@ 0x26
c0deacec:	6c60      	ldr	r0, [r4, #68]	@ 0x44
c0deacee:	5c42      	ldrb	r2, [r0, r1]
c0deacf0:	2a0a      	cmp	r2, #10
c0deacf2:	d108      	bne.n	c0dead06 <displayDetailsPage+0x146>
c0deacf4:	3101      	adds	r1, #1
c0deacf6:	e00f      	b.n	c0dead18 <displayDetailsPage+0x158>
c0deacf8:	2100      	movs	r1, #0
c0deacfa:	eb09 000a 	add.w	r0, r9, sl
c0deacfe:	63c1      	str	r1, [r0, #60]	@ 0x3c
c0dead00:	f88d 1027 	strb.w	r1, [sp, #39]	@ 0x27
c0dead04:	e010      	b.n	c0dead28 <displayDetailsPage+0x168>
c0dead06:	eb09 020a 	add.w	r2, r9, sl
c0dead0a:	f892 2033 	ldrb.w	r2, [r2, #51]	@ 0x33
c0dead0e:	b91a      	cbnz	r2, c0dead18 <displayDetailsPage+0x158>
c0dead10:	2201      	movs	r2, #1
c0dead12:	3903      	subs	r1, #3
c0dead14:	f88d 2026 	strb.w	r2, [sp, #38]	@ 0x26
c0dead18:	b289      	uxth	r1, r1
c0dead1a:	eb09 020a 	add.w	r2, r9, sl
c0dead1e:	4408      	add	r0, r1
c0dead20:	63d0      	str	r0, [r2, #60]	@ 0x3c
c0dead22:	200b      	movs	r0, #11
c0dead24:	f88d 0027 	strb.w	r0, [sp, #39]	@ 0x27
c0dead28:	f1b8 0f01 	cmp.w	r8, #1
c0dead2c:	d102      	bne.n	c0dead34 <displayDetailsPage+0x174>
c0dead2e:	480b      	ldr	r0, [pc, #44]	@ (c0dead5c <displayDetailsPage+0x19c>)
c0dead30:	4478      	add	r0, pc
c0dead32:	9018      	str	r0, [sp, #96]	@ 0x60
c0dead34:	480a      	ldr	r0, [pc, #40]	@ (c0dead60 <displayDetailsPage+0x1a0>)
c0dead36:	a913      	add	r1, sp, #76	@ 0x4c
c0dead38:	aa03      	add	r2, sp, #12
c0dead3a:	2301      	movs	r3, #1
c0dead3c:	4478      	add	r0, pc
c0dead3e:	f7fd fa63 	bl	c0de8208 <nbgl_pageDrawGenericContentExt>
c0dead42:	eb09 010a 	add.w	r1, r9, sl
c0dead46:	6208      	str	r0, [r1, #32]
c0dead48:	4628      	mov	r0, r5
c0dead4a:	f000 fe19 	bl	c0deb980 <nbgl_refreshSpecial>
c0dead4e:	b01b      	add	sp, #108	@ 0x6c
c0dead50:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0dead54:	03000101 	.word	0x03000101
c0dead58:	00001bd4 	.word	0x00001bd4
c0dead5c:	00002e32 	.word	0x00002e32
c0dead60:	ffffec11 	.word	0xffffec11

c0dead64 <displayTagValueListModalPage>:
c0dead64:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0dead68:	b098      	sub	sp, #96	@ 0x60
c0dead6a:	4e44      	ldr	r6, [pc, #272]	@ (c0deae7c <displayTagValueListModalPage+0x118>)
c0dead6c:	4605      	mov	r5, r0
c0dead6e:	f88d 0044 	strb.w	r0, [sp, #68]	@ 0x44
c0dead72:	2000      	movs	r0, #0
c0dead74:	4688      	mov	r8, r1
c0dead76:	4940      	ldr	r1, [pc, #256]	@ (c0deae78 <displayTagValueListModalPage+0x114>)
c0dead78:	9016      	str	r0, [sp, #88]	@ 0x58
c0dead7a:	f88d 0050 	strb.w	r0, [sp, #80]	@ 0x50
c0dead7e:	9013      	str	r0, [sp, #76]	@ 0x4c
c0dead80:	f44f 6010 	mov.w	r0, #2304	@ 0x900
c0dead84:	eb09 0406 	add.w	r4, r9, r6
c0dead88:	f8ad 0048 	strh.w	r0, [sp, #72]	@ 0x48
c0dead8c:	f44f 7081 	mov.w	r0, #258	@ 0x102
c0dead90:	9115      	str	r1, [sp, #84]	@ 0x54
c0dead92:	2140      	movs	r1, #64	@ 0x40
c0dead94:	f894 7030 	ldrb.w	r7, [r4, #48]	@ 0x30
c0dead98:	f8ad 0046 	strh.w	r0, [sp, #70]	@ 0x46
c0dead9c:	f88d 7045 	strb.w	r7, [sp, #69]	@ 0x45
c0deada0:	a801      	add	r0, sp, #4
c0deada2:	f001 fa27 	bl	c0dec1f4 <__aeabi_memclr>
c0deada6:	2001      	movs	r0, #1
c0deada8:	f894 1031 	ldrb.w	r1, [r4, #49]	@ 0x31
c0deadac:	f894 2033 	ldrb.w	r2, [r4, #51]	@ 0x33
c0deadb0:	f88d 0021 	strb.w	r0, [sp, #33]	@ 0x21
c0deadb4:	2004      	movs	r0, #4
c0deadb6:	42a9      	cmp	r1, r5
c0deadb8:	f88d 0010 	strb.w	r0, [sp, #16]
c0deadbc:	f88d 2022 	strb.w	r2, [sp, #34]	@ 0x22
c0deadc0:	d91b      	bls.n	c0deadfa <displayTagValueListModalPage+0x96>
c0deadc2:	1c69      	adds	r1, r5, #1
c0deadc4:	eb09 0306 	add.w	r3, r9, r6
c0deadc8:	ea00 0281 	and.w	r2, r0, r1, lsl #2
c0deadcc:	b2c9      	uxtb	r1, r1
c0deadce:	f103 0450 	add.w	r4, r3, #80	@ 0x50
c0deadd2:	ea00 0085 	and.w	r0, r0, r5, lsl #2
c0deadd6:	0849      	lsrs	r1, r1, #1
c0deadd8:	5c61      	ldrb	r1, [r4, r1]
c0deadda:	40d1      	lsrs	r1, r2
c0deaddc:	f893 2032 	ldrb.w	r2, [r3, #50]	@ 0x32
c0deade0:	f001 0107 	and.w	r1, r1, #7
c0deade4:	1a52      	subs	r2, r2, r1
c0deade6:	0869      	lsrs	r1, r5, #1
c0deade8:	5c61      	ldrb	r1, [r4, r1]
c0deadea:	f883 2032 	strb.w	r2, [r3, #50]	@ 0x32
c0deadee:	fa21 f000 	lsr.w	r0, r1, r0
c0deadf2:	f000 0107 	and.w	r1, r0, #7
c0deadf6:	1a50      	subs	r0, r2, r1
c0deadf8:	e00d      	b.n	c0deae16 <displayTagValueListModalPage+0xb2>
c0deadfa:	eb09 0206 	add.w	r2, r9, r6
c0deadfe:	ea00 0085 	and.w	r0, r0, r5, lsl #2
c0deae02:	eb02 0155 	add.w	r1, r2, r5, lsr #1
c0deae06:	f891 1050 	ldrb.w	r1, [r1, #80]	@ 0x50
c0deae0a:	fa21 f000 	lsr.w	r0, r1, r0
c0deae0e:	f000 0107 	and.w	r1, r0, #7
c0deae12:	f892 0032 	ldrb.w	r0, [r2, #50]	@ 0x32
c0deae16:	4b1a      	ldr	r3, [pc, #104]	@ (c0deae80 <displayTagValueListModalPage+0x11c>)
c0deae18:	eb09 0206 	add.w	r2, r9, r6
c0deae1c:	2f01      	cmp	r7, #1
c0deae1e:	f882 5031 	strb.w	r5, [r2, #49]	@ 0x31
c0deae22:	444b      	add	r3, r9
c0deae24:	6b9b      	ldr	r3, [r3, #56]	@ 0x38
c0deae26:	681b      	ldr	r3, [r3, #0]
c0deae28:	f88d 101c 	strb.w	r1, [sp, #28]
c0deae2c:	4401      	add	r1, r0
c0deae2e:	b2c0      	uxtb	r0, r0
c0deae30:	f882 1032 	strb.w	r1, [r2, #50]	@ 0x32
c0deae34:	eb03 1000 	add.w	r0, r3, r0, lsl #4
c0deae38:	9005      	str	r0, [sp, #20]
c0deae3a:	d102      	bne.n	c0deae42 <displayTagValueListModalPage+0xde>
c0deae3c:	4811      	ldr	r0, [pc, #68]	@ (c0deae84 <displayTagValueListModalPage+0x120>)
c0deae3e:	4478      	add	r0, pc
c0deae40:	9016      	str	r0, [sp, #88]	@ 0x58
c0deae42:	eb09 0006 	add.w	r0, r9, r6
c0deae46:	6a00      	ldr	r0, [r0, #32]
c0deae48:	b108      	cbz	r0, c0deae4e <displayTagValueListModalPage+0xea>
c0deae4a:	f7fd fc04 	bl	c0de8656 <nbgl_pageRelease>
c0deae4e:	480e      	ldr	r0, [pc, #56]	@ (c0deae88 <displayTagValueListModalPage+0x124>)
c0deae50:	a911      	add	r1, sp, #68	@ 0x44
c0deae52:	aa01      	add	r2, sp, #4
c0deae54:	2301      	movs	r3, #1
c0deae56:	2501      	movs	r5, #1
c0deae58:	4478      	add	r0, pc
c0deae5a:	f7fd f9d5 	bl	c0de8208 <nbgl_pageDrawGenericContentExt>
c0deae5e:	eb09 0106 	add.w	r1, r9, r6
c0deae62:	f1b8 0f00 	cmp.w	r8, #0
c0deae66:	6208      	str	r0, [r1, #32]
c0deae68:	bf18      	it	ne
c0deae6a:	2502      	movne	r5, #2
c0deae6c:	4628      	mov	r0, r5
c0deae6e:	f000 fd87 	bl	c0deb980 <nbgl_refreshSpecial>
c0deae72:	b018      	add	sp, #96	@ 0x60
c0deae74:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0deae78:	04000101 	.word	0x04000101
c0deae7c:	00001bd4 	.word	0x00001bd4
c0deae80:	0000191c 	.word	0x0000191c
c0deae84:	00002d24 	.word	0x00002d24
c0deae88:	ffffeaf5 	.word	0xffffeaf5

c0deae8c <bundleNavReviewChoice>:
c0deae8c:	b110      	cbz	r0, c0deae94 <bundleNavReviewChoice+0x8>
c0deae8e:	4805      	ldr	r0, [pc, #20]	@ (c0deaea4 <bundleNavReviewChoice+0x18>)
c0deae90:	f000 b8db 	b.w	c0deb04a <OUTLINED_FUNCTION_13>
c0deae94:	4803      	ldr	r0, [pc, #12]	@ (c0deaea4 <bundleNavReviewChoice+0x18>)
c0deae96:	f859 0000 	ldr.w	r0, [r9, r0]
c0deae9a:	4903      	ldr	r1, [pc, #12]	@ (c0deaea8 <bundleNavReviewChoice+0x1c>)
c0deae9c:	4479      	add	r1, pc
c0deae9e:	f000 b863 	b.w	c0deaf68 <bundleNavReviewAskRejectionConfirmation>
c0deaea2:	bf00      	nop
c0deaea4:	00001c50 	.word	0x00001c50
c0deaea8:	0000011d 	.word	0x0000011d

c0deaeac <initWarningTipBox>:
c0deaeac:	4923      	ldr	r1, [pc, #140]	@ (c0deaf3c <initWarningTipBox+0x90>)
c0deaeae:	eb09 0201 	add.w	r2, r9, r1
c0deaeb2:	6f92      	ldr	r2, [r2, #120]	@ 0x78
c0deaeb4:	b15a      	cbz	r2, c0deaece <initWarningTipBox+0x22>
c0deaeb6:	6812      	ldr	r2, [r2, #0]
c0deaeb8:	07d3      	lsls	r3, r2, #31
c0deaeba:	d111      	bne.n	c0deaee0 <initWarningTipBox+0x34>
c0deaebc:	0753      	lsls	r3, r2, #29
c0deaebe:	d415      	bmi.n	c0deaeec <initWarningTipBox+0x40>
c0deaec0:	0793      	lsls	r3, r2, #30
c0deaec2:	d419      	bmi.n	c0deaef8 <initWarningTipBox+0x4c>
c0deaec4:	f002 0310 	and.w	r3, r2, #16
c0deaec8:	0712      	lsls	r2, r2, #28
c0deaeca:	d42c      	bmi.n	c0deaf26 <initWarningTipBox+0x7a>
c0deaecc:	bb9b      	cbnz	r3, c0deaf36 <initWarningTipBox+0x8a>
c0deaece:	b348      	cbz	r0, c0deaf24 <initWarningTipBox+0x78>
c0deaed0:	491b      	ldr	r1, [pc, #108]	@ (c0deaf40 <initWarningTipBox+0x94>)
c0deaed2:	2200      	movs	r2, #0
c0deaed4:	4449      	add	r1, r9
c0deaed6:	620a      	str	r2, [r1, #32]
c0deaed8:	6842      	ldr	r2, [r0, #4]
c0deaeda:	62ca      	str	r2, [r1, #44]	@ 0x2c
c0deaedc:	6800      	ldr	r0, [r0, #0]
c0deaede:	e01b      	b.n	c0deaf18 <initWarningTipBox+0x6c>
c0deaee0:	06d0      	lsls	r0, r2, #27
c0deaee2:	4a18      	ldr	r2, [pc, #96]	@ (c0deaf44 <initWarningTipBox+0x98>)
c0deaee4:	4818      	ldr	r0, [pc, #96]	@ (c0deaf48 <initWarningTipBox+0x9c>)
c0deaee6:	447a      	add	r2, pc
c0deaee8:	4478      	add	r0, pc
c0deaeea:	e00a      	b.n	c0deaf02 <initWarningTipBox+0x56>
c0deaeec:	06d0      	lsls	r0, r2, #27
c0deaeee:	4a17      	ldr	r2, [pc, #92]	@ (c0deaf4c <initWarningTipBox+0xa0>)
c0deaef0:	4817      	ldr	r0, [pc, #92]	@ (c0deaf50 <initWarningTipBox+0xa4>)
c0deaef2:	447a      	add	r2, pc
c0deaef4:	4478      	add	r0, pc
c0deaef6:	e004      	b.n	c0deaf02 <initWarningTipBox+0x56>
c0deaef8:	06d0      	lsls	r0, r2, #27
c0deaefa:	4a16      	ldr	r2, [pc, #88]	@ (c0deaf54 <initWarningTipBox+0xa8>)
c0deaefc:	4816      	ldr	r0, [pc, #88]	@ (c0deaf58 <initWarningTipBox+0xac>)
c0deaefe:	447a      	add	r2, pc
c0deaf00:	4478      	add	r0, pc
c0deaf02:	bf58      	it	pl
c0deaf04:	4610      	movpl	r0, r2
c0deaf06:	4449      	add	r1, r9
c0deaf08:	2201      	movs	r2, #1
c0deaf0a:	f881 2021 	strb.w	r2, [r1, #33]	@ 0x21
c0deaf0e:	490c      	ldr	r1, [pc, #48]	@ (c0deaf40 <initWarningTipBox+0x94>)
c0deaf10:	2200      	movs	r2, #0
c0deaf12:	4449      	add	r1, r9
c0deaf14:	620a      	str	r2, [r1, #32]
c0deaf16:	62ca      	str	r2, [r1, #44]	@ 0x2c
c0deaf18:	4909      	ldr	r1, [pc, #36]	@ (c0deaf40 <initWarningTipBox+0x94>)
c0deaf1a:	f640 1213 	movw	r2, #2323	@ 0x913
c0deaf1e:	4449      	add	r1, r9
c0deaf20:	860a      	strh	r2, [r1, #48]	@ 0x30
c0deaf22:	6288      	str	r0, [r1, #40]	@ 0x28
c0deaf24:	4770      	bx	lr
c0deaf26:	4a0d      	ldr	r2, [pc, #52]	@ (c0deaf5c <initWarningTipBox+0xb0>)
c0deaf28:	480d      	ldr	r0, [pc, #52]	@ (c0deaf60 <initWarningTipBox+0xb4>)
c0deaf2a:	2b00      	cmp	r3, #0
c0deaf2c:	4478      	add	r0, pc
c0deaf2e:	447a      	add	r2, pc
c0deaf30:	bf08      	it	eq
c0deaf32:	4610      	moveq	r0, r2
c0deaf34:	e7e7      	b.n	c0deaf06 <initWarningTipBox+0x5a>
c0deaf36:	480b      	ldr	r0, [pc, #44]	@ (c0deaf64 <initWarningTipBox+0xb8>)
c0deaf38:	4478      	add	r0, pc
c0deaf3a:	e7e4      	b.n	c0deaf06 <initWarningTipBox+0x5a>
c0deaf3c:	0000191c 	.word	0x0000191c
c0deaf40:	000019ac 	.word	0x000019ac
c0deaf44:	00002962 	.word	0x00002962
c0deaf48:	00002aec 	.word	0x00002aec
c0deaf4c:	00003107 	.word	0x00003107
c0deaf50:	00002a75 	.word	0x00002a75
c0deaf54:	00003139 	.word	0x00003139
c0deaf58:	00002f11 	.word	0x00002f11
c0deaf5c:	00002f5c 	.word	0x00002f5c
c0deaf60:	00003124 	.word	0x00003124
c0deaf64:	00002e0f 	.word	0x00002e0f

c0deaf68 <bundleNavReviewAskRejectionConfirmation>:
c0deaf68:	f020 00f0 	bic.w	r0, r0, #240	@ 0xf0
c0deaf6c:	b130      	cbz	r0, c0deaf7c <bundleNavReviewAskRejectionConfirmation+0x14>
c0deaf6e:	2801      	cmp	r0, #1
c0deaf70:	d109      	bne.n	c0deaf86 <bundleNavReviewAskRejectionConfirmation+0x1e>
c0deaf72:	4b0d      	ldr	r3, [pc, #52]	@ (c0deafa8 <bundleNavReviewAskRejectionConfirmation+0x40>)
c0deaf74:	480d      	ldr	r0, [pc, #52]	@ (c0deafac <bundleNavReviewAskRejectionConfirmation+0x44>)
c0deaf76:	447b      	add	r3, pc
c0deaf78:	4478      	add	r0, pc
c0deaf7a:	e008      	b.n	c0deaf8e <bundleNavReviewAskRejectionConfirmation+0x26>
c0deaf7c:	4b08      	ldr	r3, [pc, #32]	@ (c0deafa0 <bundleNavReviewAskRejectionConfirmation+0x38>)
c0deaf7e:	4809      	ldr	r0, [pc, #36]	@ (c0deafa4 <bundleNavReviewAskRejectionConfirmation+0x3c>)
c0deaf80:	447b      	add	r3, pc
c0deaf82:	4478      	add	r0, pc
c0deaf84:	e003      	b.n	c0deaf8e <bundleNavReviewAskRejectionConfirmation+0x26>
c0deaf86:	4b0a      	ldr	r3, [pc, #40]	@ (c0deafb0 <bundleNavReviewAskRejectionConfirmation+0x48>)
c0deaf88:	480a      	ldr	r0, [pc, #40]	@ (c0deafb4 <bundleNavReviewAskRejectionConfirmation+0x4c>)
c0deaf8a:	447b      	add	r3, pc
c0deaf8c:	4478      	add	r0, pc
c0deaf8e:	b5e0      	push	{r5, r6, r7, lr}
c0deaf90:	9100      	str	r1, [sp, #0]
c0deaf92:	2100      	movs	r1, #0
c0deaf94:	4a08      	ldr	r2, [pc, #32]	@ (c0deafb8 <bundleNavReviewAskRejectionConfirmation+0x50>)
c0deaf96:	447a      	add	r2, pc
c0deaf98:	f7fe fcb0 	bl	c0de98fc <nbgl_useCaseConfirm>
c0deaf9c:	bd8c      	pop	{r2, r3, r7, pc}
c0deaf9e:	bf00      	nop
c0deafa0:	00002ba0 	.word	0x00002ba0
c0deafa4:	000029d3 	.word	0x000029d3
c0deafa8:	00002e88 	.word	0x00002e88
c0deafac:	000031f7 	.word	0x000031f7
c0deafb0:	00002a35 	.word	0x00002a35
c0deafb4:	00002f4c 	.word	0x00002f4c
c0deafb8:	00002d1f 	.word	0x00002d1f

c0deafbc <bundleNavReviewConfirmRejection>:
c0deafbc:	4801      	ldr	r0, [pc, #4]	@ (c0deafc4 <bundleNavReviewConfirmRejection+0x8>)
c0deafbe:	f000 b840 	b.w	c0deb042 <OUTLINED_FUNCTION_12>
c0deafc2:	bf00      	nop
c0deafc4:	00001c50 	.word	0x00001c50

c0deafc8 <bundleNavReviewStreamingConfirmRejection>:
c0deafc8:	4801      	ldr	r0, [pc, #4]	@ (c0deafd0 <bundleNavReviewStreamingConfirmRejection+0x8>)
c0deafca:	f000 b83a 	b.w	c0deb042 <OUTLINED_FUNCTION_12>
c0deafce:	bf00      	nop
c0deafd0:	00001c50 	.word	0x00001c50

c0deafd4 <OUTLINED_FUNCTION_0>:
c0deafd4:	461c      	mov	r4, r3
c0deafd6:	4615      	mov	r5, r2
c0deafd8:	460e      	mov	r6, r1
c0deafda:	4607      	mov	r7, r0
c0deafdc:	f7fd bd4a 	b.w	c0de8a74 <reset_callbacks_and_context>

c0deafe0 <OUTLINED_FUNCTION_1>:
c0deafe0:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0deafe4:	2301      	movs	r3, #1
c0deafe6:	f000 bd1b 	b.w	c0deba20 <nbgl_getTextHeightInWidth>

c0deafea <OUTLINED_FUNCTION_2>:
c0deafea:	f8da 0004 	ldr.w	r0, [sl, #4]
c0deafee:	eb00 0086 	add.w	r0, r0, r6, lsl #2
c0deaff2:	f000 bedd 	b.w	c0debdb0 <pic>

c0deaff6 <OUTLINED_FUNCTION_3>:
c0deaff6:	2001      	movs	r0, #1
c0deaff8:	f000 bcc2 	b.w	c0deb980 <nbgl_refreshSpecial>

c0deaffc <OUTLINED_FUNCTION_4>:
c0deaffc:	2000      	movs	r0, #0
c0deaffe:	f7fd be17 	b.w	c0de8c30 <getNbPagesForGenericContents>

c0deb002 <OUTLINED_FUNCTION_5>:
c0deb002:	2008      	movs	r0, #8
c0deb004:	f7f9 b814 	b.w	c0de4030 <os_io_seph_cmd_piezo_play_tune>

c0deb008 <OUTLINED_FUNCTION_6>:
c0deb008:	f880 1088 	strb.w	r1, [r0, #136]	@ 0x88
c0deb00c:	6f81      	ldr	r1, [r0, #120]	@ 0x78
c0deb00e:	6808      	ldr	r0, [r1, #0]
c0deb010:	2800      	cmp	r0, #0
c0deb012:	4770      	bx	lr

c0deb014 <OUTLINED_FUNCTION_8>:
c0deb014:	9001      	str	r0, [sp, #4]
c0deb016:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0deb018:	9000      	str	r0, [sp, #0]
c0deb01a:	4638      	mov	r0, r7
c0deb01c:	f7fe bd7a 	b.w	c0de9b14 <useCaseReview>

c0deb020 <OUTLINED_FUNCTION_9>:
c0deb020:	eb09 000b 	add.w	r0, r9, fp
c0deb024:	f8d0 0084 	ldr.w	r0, [r0, #132]	@ 0x84
c0deb028:	4770      	bx	lr

c0deb02a <OUTLINED_FUNCTION_10>:
c0deb02a:	eb09 0005 	add.w	r0, r9, r5
c0deb02e:	f8d0 0080 	ldr.w	r0, [r0, #128]	@ 0x80
c0deb032:	4770      	bx	lr

c0deb034 <OUTLINED_FUNCTION_11>:
c0deb034:	f44f 7bfc 	mov.w	fp, #504	@ 0x1f8
c0deb038:	2b00      	cmp	r3, #0
c0deb03a:	4682      	mov	sl, r0
c0deb03c:	4698      	mov	r8, r3
c0deb03e:	4616      	mov	r6, r2
c0deb040:	4770      	bx	lr

c0deb042 <OUTLINED_FUNCTION_12>:
c0deb042:	4448      	add	r0, r9
c0deb044:	6841      	ldr	r1, [r0, #4]
c0deb046:	2000      	movs	r0, #0
c0deb048:	4708      	bx	r1

c0deb04a <OUTLINED_FUNCTION_13>:
c0deb04a:	4448      	add	r0, r9
c0deb04c:	6841      	ldr	r1, [r0, #4]
c0deb04e:	2001      	movs	r0, #1
c0deb050:	4708      	bx	r1

c0deb052 <OUTLINED_FUNCTION_15>:
c0deb052:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0deb056:	2300      	movs	r3, #0
c0deb058:	f000 bce7 	b.w	c0deba2a <nbgl_getTextNbLinesInWidth>

c0deb05c <OUTLINED_FUNCTION_16>:
c0deb05c:	200b      	movs	r0, #11
c0deb05e:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0deb062:	f000 bcdd 	b.w	c0deba20 <nbgl_getTextHeightInWidth>

c0deb066 <OUTLINED_FUNCTION_17>:
c0deb066:	4630      	mov	r0, r6
c0deb068:	f001 b8c4 	b.w	c0dec1f4 <__aeabi_memclr>

c0deb06c <OUTLINED_FUNCTION_18>:
c0deb06c:	f10a 0004 	add.w	r0, sl, #4
c0deb070:	f105 0110 	add.w	r1, r5, #16
c0deb074:	4770      	bx	lr

c0deb076 <OUTLINED_FUNCTION_19>:
c0deb076:	f884 0068 	strb.w	r0, [r4, #104]	@ 0x68
c0deb07a:	6de0      	ldr	r0, [r4, #92]	@ 0x5c
c0deb07c:	f7ff bd26 	b.w	c0deaacc <displayModalDetails>

c0deb080 <bip32_path_read>:
c0deb080:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0deb084:	b10b      	cbz	r3, c0deb08a <bip32_path_read+0xa>
c0deb086:	2b0a      	cmp	r3, #10
c0deb088:	d902      	bls.n	c0deb090 <bip32_path_read+0x10>
c0deb08a:	2000      	movs	r0, #0
c0deb08c:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0deb090:	4692      	mov	sl, r2
c0deb092:	460e      	mov	r6, r1
c0deb094:	4683      	mov	fp, r0
c0deb096:	425f      	negs	r7, r3
c0deb098:	2500      	movs	r5, #0
c0deb09a:	f04f 0800 	mov.w	r8, #0
c0deb09e:	9301      	str	r3, [sp, #4]
c0deb0a0:	42af      	cmp	r7, r5
c0deb0a2:	d00c      	beq.n	c0deb0be <bip32_path_read+0x3e>
c0deb0a4:	f108 0404 	add.w	r4, r8, #4
c0deb0a8:	42b4      	cmp	r4, r6
c0deb0aa:	d808      	bhi.n	c0deb0be <bip32_path_read+0x3e>
c0deb0ac:	4658      	mov	r0, fp
c0deb0ae:	4641      	mov	r1, r8
c0deb0b0:	f000 faee 	bl	c0deb690 <read_u32_be>
c0deb0b4:	f84a 0008 	str.w	r0, [sl, r8]
c0deb0b8:	3d01      	subs	r5, #1
c0deb0ba:	46a0      	mov	r8, r4
c0deb0bc:	e7f0      	b.n	c0deb0a0 <bip32_path_read+0x20>
c0deb0be:	9a01      	ldr	r2, [sp, #4]
c0deb0c0:	4269      	negs	r1, r5
c0deb0c2:	2000      	movs	r0, #0
c0deb0c4:	4291      	cmp	r1, r2
c0deb0c6:	bf28      	it	cs
c0deb0c8:	2001      	movcs	r0, #1
c0deb0ca:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0deb0ce <buffer_seek_cur>:
c0deb0ce:	6882      	ldr	r2, [r0, #8]
c0deb0d0:	1889      	adds	r1, r1, r2
c0deb0d2:	d205      	bcs.n	c0deb0e0 <buffer_seek_cur+0x12>
c0deb0d4:	6842      	ldr	r2, [r0, #4]
c0deb0d6:	4291      	cmp	r1, r2
c0deb0d8:	bf9e      	ittt	ls
c0deb0da:	6081      	strls	r1, [r0, #8]
c0deb0dc:	2001      	movls	r0, #1
c0deb0de:	4770      	bxls	lr
c0deb0e0:	2000      	movs	r0, #0
c0deb0e2:	4770      	bx	lr

c0deb0e4 <buffer_read_u8>:
c0deb0e4:	b510      	push	{r4, lr}
c0deb0e6:	e9d0 2301 	ldrd	r2, r3, [r0, #4]
c0deb0ea:	429a      	cmp	r2, r3
c0deb0ec:	d00a      	beq.n	c0deb104 <buffer_read_u8+0x20>
c0deb0ee:	6804      	ldr	r4, [r0, #0]
c0deb0f0:	5ce4      	ldrb	r4, [r4, r3]
c0deb0f2:	700c      	strb	r4, [r1, #0]
c0deb0f4:	6881      	ldr	r1, [r0, #8]
c0deb0f6:	3101      	adds	r1, #1
c0deb0f8:	d206      	bcs.n	c0deb108 <buffer_read_u8+0x24>
c0deb0fa:	6844      	ldr	r4, [r0, #4]
c0deb0fc:	42a1      	cmp	r1, r4
c0deb0fe:	bf98      	it	ls
c0deb100:	6081      	strls	r1, [r0, #8]
c0deb102:	e001      	b.n	c0deb108 <buffer_read_u8+0x24>
c0deb104:	2000      	movs	r0, #0
c0deb106:	7008      	strb	r0, [r1, #0]
c0deb108:	1ad0      	subs	r0, r2, r3
c0deb10a:	bf18      	it	ne
c0deb10c:	2001      	movne	r0, #1
c0deb10e:	bd10      	pop	{r4, pc}

c0deb110 <buffer_read_u64>:
c0deb110:	b570      	push	{r4, r5, r6, lr}
c0deb112:	f000 f87d 	bl	c0deb210 <OUTLINED_FUNCTION_0>
c0deb116:	2e07      	cmp	r6, #7
c0deb118:	d904      	bls.n	c0deb124 <buffer_read_u64+0x14>
c0deb11a:	6820      	ldr	r0, [r4, #0]
c0deb11c:	b132      	cbz	r2, c0deb12c <buffer_read_u64+0x1c>
c0deb11e:	f000 faee 	bl	c0deb6fe <read_u64_le>
c0deb122:	e005      	b.n	c0deb130 <buffer_read_u64+0x20>
c0deb124:	2000      	movs	r0, #0
c0deb126:	e9c5 0000 	strd	r0, r0, [r5]
c0deb12a:	e00c      	b.n	c0deb146 <buffer_read_u64+0x36>
c0deb12c:	f000 fabc 	bl	c0deb6a8 <read_u64_be>
c0deb130:	e9c5 0100 	strd	r0, r1, [r5]
c0deb134:	68a0      	ldr	r0, [r4, #8]
c0deb136:	f110 0f09 	cmn.w	r0, #9
c0deb13a:	d804      	bhi.n	c0deb146 <buffer_read_u64+0x36>
c0deb13c:	6861      	ldr	r1, [r4, #4]
c0deb13e:	3008      	adds	r0, #8
c0deb140:	4288      	cmp	r0, r1
c0deb142:	bf98      	it	ls
c0deb144:	60a0      	strls	r0, [r4, #8]
c0deb146:	2000      	movs	r0, #0
c0deb148:	2e07      	cmp	r6, #7
c0deb14a:	bf88      	it	hi
c0deb14c:	2001      	movhi	r0, #1
c0deb14e:	bd70      	pop	{r4, r5, r6, pc}

c0deb150 <buffer_read_varint>:
c0deb150:	b5b0      	push	{r4, r5, r7, lr}
c0deb152:	4604      	mov	r4, r0
c0deb154:	460d      	mov	r5, r1
c0deb156:	6800      	ldr	r0, [r0, #0]
c0deb158:	e9d4 1201 	ldrd	r1, r2, [r4, #4]
c0deb15c:	4410      	add	r0, r2
c0deb15e:	1a89      	subs	r1, r1, r2
c0deb160:	462a      	mov	r2, r5
c0deb162:	f000 fae3 	bl	c0deb72c <varint_read>
c0deb166:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0deb16a:	dd0a      	ble.n	c0deb182 <buffer_read_varint+0x32>
c0deb16c:	68a1      	ldr	r1, [r4, #8]
c0deb16e:	1840      	adds	r0, r0, r1
c0deb170:	d205      	bcs.n	c0deb17e <buffer_read_varint+0x2e>
c0deb172:	6861      	ldr	r1, [r4, #4]
c0deb174:	4288      	cmp	r0, r1
c0deb176:	bf9e      	ittt	ls
c0deb178:	60a0      	strls	r0, [r4, #8]
c0deb17a:	2001      	movls	r0, #1
c0deb17c:	bdb0      	popls	{r4, r5, r7, pc}
c0deb17e:	2000      	movs	r0, #0
c0deb180:	bdb0      	pop	{r4, r5, r7, pc}
c0deb182:	2000      	movs	r0, #0
c0deb184:	e9c5 0000 	strd	r0, r0, [r5]
c0deb188:	bdb0      	pop	{r4, r5, r7, pc}

c0deb18a <buffer_read_bip32_path>:
c0deb18a:	b5b0      	push	{r4, r5, r7, lr}
c0deb18c:	4604      	mov	r4, r0
c0deb18e:	4615      	mov	r5, r2
c0deb190:	460a      	mov	r2, r1
c0deb192:	6800      	ldr	r0, [r0, #0]
c0deb194:	e9d4 1301 	ldrd	r1, r3, [r4, #4]
c0deb198:	4418      	add	r0, r3
c0deb19a:	1ac9      	subs	r1, r1, r3
c0deb19c:	462b      	mov	r3, r5
c0deb19e:	f7ff ff6f 	bl	c0deb080 <bip32_path_read>
c0deb1a2:	b140      	cbz	r0, c0deb1b6 <buffer_read_bip32_path+0x2c>
c0deb1a4:	68a2      	ldr	r2, [r4, #8]
c0deb1a6:	eb02 0185 	add.w	r1, r2, r5, lsl #2
c0deb1aa:	4291      	cmp	r1, r2
c0deb1ac:	d303      	bcc.n	c0deb1b6 <buffer_read_bip32_path+0x2c>
c0deb1ae:	6862      	ldr	r2, [r4, #4]
c0deb1b0:	4291      	cmp	r1, r2
c0deb1b2:	bf98      	it	ls
c0deb1b4:	60a1      	strls	r1, [r4, #8]
c0deb1b6:	bdb0      	pop	{r4, r5, r7, pc}

c0deb1b8 <buffer_copy>:
c0deb1b8:	b5b0      	push	{r4, r5, r7, lr}
c0deb1ba:	4614      	mov	r4, r2
c0deb1bc:	e9d0 3201 	ldrd	r3, r2, [r0, #4]
c0deb1c0:	1a9d      	subs	r5, r3, r2
c0deb1c2:	42a5      	cmp	r5, r4
c0deb1c4:	d806      	bhi.n	c0deb1d4 <buffer_copy+0x1c>
c0deb1c6:	6800      	ldr	r0, [r0, #0]
c0deb1c8:	4402      	add	r2, r0
c0deb1ca:	4608      	mov	r0, r1
c0deb1cc:	4611      	mov	r1, r2
c0deb1ce:	462a      	mov	r2, r5
c0deb1d0:	f001 f808 	bl	c0dec1e4 <__aeabi_memmove>
c0deb1d4:	2000      	movs	r0, #0
c0deb1d6:	42a5      	cmp	r5, r4
c0deb1d8:	bf98      	it	ls
c0deb1da:	2001      	movls	r0, #1
c0deb1dc:	bdb0      	pop	{r4, r5, r7, pc}

c0deb1de <buffer_move>:
c0deb1de:	b5b0      	push	{r4, r5, r7, lr}
c0deb1e0:	4615      	mov	r5, r2
c0deb1e2:	4604      	mov	r4, r0
c0deb1e4:	e9d0 2001 	ldrd	r2, r0, [r0, #4]
c0deb1e8:	1a12      	subs	r2, r2, r0
c0deb1ea:	42aa      	cmp	r2, r5
c0deb1ec:	bf84      	itt	hi
c0deb1ee:	2000      	movhi	r0, #0
c0deb1f0:	bdb0      	pophi	{r4, r5, r7, pc}
c0deb1f2:	6823      	ldr	r3, [r4, #0]
c0deb1f4:	4403      	add	r3, r0
c0deb1f6:	4608      	mov	r0, r1
c0deb1f8:	4619      	mov	r1, r3
c0deb1fa:	f000 fff3 	bl	c0dec1e4 <__aeabi_memmove>
c0deb1fe:	68a0      	ldr	r0, [r4, #8]
c0deb200:	1940      	adds	r0, r0, r5
c0deb202:	d203      	bcs.n	c0deb20c <buffer_move+0x2e>
c0deb204:	6861      	ldr	r1, [r4, #4]
c0deb206:	4288      	cmp	r0, r1
c0deb208:	bf98      	it	ls
c0deb20a:	60a0      	strls	r0, [r4, #8]
c0deb20c:	2001      	movs	r0, #1
c0deb20e:	bdb0      	pop	{r4, r5, r7, pc}

c0deb210 <OUTLINED_FUNCTION_0>:
c0deb210:	4604      	mov	r4, r0
c0deb212:	460d      	mov	r5, r1
c0deb214:	6840      	ldr	r0, [r0, #4]
c0deb216:	68a1      	ldr	r1, [r4, #8]
c0deb218:	1a46      	subs	r6, r0, r1
c0deb21a:	4770      	bx	lr

c0deb21c <bip32_derive_with_seed_init_privkey_256>:
c0deb21c:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0deb220:	b095      	sub	sp, #84	@ 0x54
c0deb222:	460d      	mov	r5, r1
c0deb224:	4607      	mov	r7, r0
c0deb226:	a904      	add	r1, sp, #16
c0deb228:	469a      	mov	sl, r3
c0deb22a:	4614      	mov	r4, r2
c0deb22c:	4628      	mov	r0, r5
c0deb22e:	f000 fe03 	bl	c0debe38 <cx_ecdomain_parameters_length>
c0deb232:	f8dd 8070 	ldr.w	r8, [sp, #112]	@ 0x70
c0deb236:	4606      	mov	r6, r0
c0deb238:	b9e0      	cbnz	r0, c0deb274 <bip32_derive_with_seed_init_privkey_256+0x58>
c0deb23a:	9804      	ldr	r0, [sp, #16]
c0deb23c:	2820      	cmp	r0, #32
c0deb23e:	d117      	bne.n	c0deb270 <bip32_derive_with_seed_init_privkey_256+0x54>
c0deb240:	981f      	ldr	r0, [sp, #124]	@ 0x7c
c0deb242:	e9dd 211d 	ldrd	r2, r1, [sp, #116]	@ 0x74
c0deb246:	ab05      	add	r3, sp, #20
c0deb248:	e9cd 3200 	strd	r3, r2, [sp]
c0deb24c:	e9cd 1002 	strd	r1, r0, [sp, #8]
c0deb250:	4638      	mov	r0, r7
c0deb252:	4629      	mov	r1, r5
c0deb254:	4622      	mov	r2, r4
c0deb256:	4653      	mov	r3, sl
c0deb258:	f000 f818 	bl	c0deb28c <os_derive_bip32_with_seed_no_throw>
c0deb25c:	4606      	mov	r6, r0
c0deb25e:	b948      	cbnz	r0, c0deb274 <bip32_derive_with_seed_init_privkey_256+0x58>
c0deb260:	9a04      	ldr	r2, [sp, #16]
c0deb262:	a905      	add	r1, sp, #20
c0deb264:	4628      	mov	r0, r5
c0deb266:	4643      	mov	r3, r8
c0deb268:	f000 fb61 	bl	c0deb92e <cx_ecfp_init_private_key_no_throw>
c0deb26c:	4606      	mov	r6, r0
c0deb26e:	e001      	b.n	c0deb274 <bip32_derive_with_seed_init_privkey_256+0x58>
c0deb270:	f06f 065c 	mvn.w	r6, #92	@ 0x5c
c0deb274:	a805      	add	r0, sp, #20
c0deb276:	2140      	movs	r1, #64	@ 0x40
c0deb278:	f000 ffca 	bl	c0dec210 <explicit_bzero>
c0deb27c:	b116      	cbz	r6, c0deb284 <bip32_derive_with_seed_init_privkey_256+0x68>
c0deb27e:	4640      	mov	r0, r8
c0deb280:	f000 f89f 	bl	c0deb3c2 <OUTLINED_FUNCTION_0>
c0deb284:	4630      	mov	r0, r6
c0deb286:	b015      	add	sp, #84	@ 0x54
c0deb288:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}

c0deb28c <os_derive_bip32_with_seed_no_throw>:
c0deb28c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0deb290:	b090      	sub	sp, #64	@ 0x40
c0deb292:	f10d 0810 	add.w	r8, sp, #16
c0deb296:	4607      	mov	r7, r0
c0deb298:	469b      	mov	fp, r3
c0deb29a:	4616      	mov	r6, r2
c0deb29c:	460c      	mov	r4, r1
c0deb29e:	4640      	mov	r0, r8
c0deb2a0:	f000 ffec 	bl	c0dec27c <setjmp>
c0deb2a4:	b285      	uxth	r5, r0
c0deb2a6:	f8dd a060 	ldr.w	sl, [sp, #96]	@ 0x60
c0deb2aa:	f8ad 003c 	strh.w	r0, [sp, #60]	@ 0x3c
c0deb2ae:	b155      	cbz	r5, c0deb2c6 <os_derive_bip32_with_seed_no_throw+0x3a>
c0deb2b0:	2000      	movs	r0, #0
c0deb2b2:	f8ad 003c 	strh.w	r0, [sp, #60]	@ 0x3c
c0deb2b6:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0deb2b8:	f000 fe66 	bl	c0debf88 <try_context_set>
c0deb2bc:	2140      	movs	r1, #64	@ 0x40
c0deb2be:	4650      	mov	r0, sl
c0deb2c0:	f000 ffa6 	bl	c0dec210 <explicit_bzero>
c0deb2c4:	e012      	b.n	c0deb2ec <os_derive_bip32_with_seed_no_throw+0x60>
c0deb2c6:	a804      	add	r0, sp, #16
c0deb2c8:	f000 fe5e 	bl	c0debf88 <try_context_set>
c0deb2cc:	9919      	ldr	r1, [sp, #100]	@ 0x64
c0deb2ce:	900e      	str	r0, [sp, #56]	@ 0x38
c0deb2d0:	4668      	mov	r0, sp
c0deb2d2:	4632      	mov	r2, r6
c0deb2d4:	465b      	mov	r3, fp
c0deb2d6:	f8c0 a000 	str.w	sl, [r0]
c0deb2da:	6041      	str	r1, [r0, #4]
c0deb2dc:	991a      	ldr	r1, [sp, #104]	@ 0x68
c0deb2de:	6081      	str	r1, [r0, #8]
c0deb2e0:	991b      	ldr	r1, [sp, #108]	@ 0x6c
c0deb2e2:	60c1      	str	r1, [r0, #12]
c0deb2e4:	4638      	mov	r0, r7
c0deb2e6:	4621      	mov	r1, r4
c0deb2e8:	f000 fdb0 	bl	c0debe4c <os_perso_derive_node_with_seed_key>
c0deb2ec:	f000 fe44 	bl	c0debf78 <try_context_get>
c0deb2f0:	4540      	cmp	r0, r8
c0deb2f2:	d102      	bne.n	c0deb2fa <os_derive_bip32_with_seed_no_throw+0x6e>
c0deb2f4:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0deb2f6:	f000 fe47 	bl	c0debf88 <try_context_set>
c0deb2fa:	f8bd 003c 	ldrh.w	r0, [sp, #60]	@ 0x3c
c0deb2fe:	b918      	cbnz	r0, c0deb308 <os_derive_bip32_with_seed_no_throw+0x7c>
c0deb300:	4628      	mov	r0, r5
c0deb302:	b010      	add	sp, #64	@ 0x40
c0deb304:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0deb308:	f000 fbb9 	bl	c0deba7e <os_longjmp>

c0deb30c <bip32_derive_with_seed_get_pubkey_256>:
c0deb30c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0deb30e:	b0a1      	sub	sp, #132	@ 0x84
c0deb310:	460e      	mov	r6, r1
c0deb312:	992a      	ldr	r1, [sp, #168]	@ 0xa8
c0deb314:	9103      	str	r1, [sp, #12]
c0deb316:	9929      	ldr	r1, [sp, #164]	@ 0xa4
c0deb318:	9102      	str	r1, [sp, #8]
c0deb31a:	9927      	ldr	r1, [sp, #156]	@ 0x9c
c0deb31c:	9101      	str	r1, [sp, #4]
c0deb31e:	a917      	add	r1, sp, #92	@ 0x5c
c0deb320:	9100      	str	r1, [sp, #0]
c0deb322:	4631      	mov	r1, r6
c0deb324:	f7ff ff7a 	bl	c0deb21c <bip32_derive_with_seed_init_privkey_256>
c0deb328:	9c26      	ldr	r4, [sp, #152]	@ 0x98
c0deb32a:	4605      	mov	r5, r0
c0deb32c:	b9b8      	cbnz	r0, c0deb35e <bip32_derive_with_seed_get_pubkey_256+0x52>
c0deb32e:	9828      	ldr	r0, [sp, #160]	@ 0xa0
c0deb330:	2301      	movs	r3, #1
c0deb332:	9000      	str	r0, [sp, #0]
c0deb334:	af04      	add	r7, sp, #16
c0deb336:	aa17      	add	r2, sp, #92	@ 0x5c
c0deb338:	4630      	mov	r0, r6
c0deb33a:	4639      	mov	r1, r7
c0deb33c:	f000 faf2 	bl	c0deb924 <cx_ecfp_generate_pair2_no_throw>
c0deb340:	4605      	mov	r5, r0
c0deb342:	b960      	cbnz	r0, c0deb35e <bip32_derive_with_seed_get_pubkey_256+0x52>
c0deb344:	9805      	ldr	r0, [sp, #20]
c0deb346:	2841      	cmp	r0, #65	@ 0x41
c0deb348:	d107      	bne.n	c0deb35a <bip32_derive_with_seed_get_pubkey_256+0x4e>
c0deb34a:	f107 0108 	add.w	r1, r7, #8
c0deb34e:	4620      	mov	r0, r4
c0deb350:	2241      	movs	r2, #65	@ 0x41
c0deb352:	f000 ff45 	bl	c0dec1e0 <__aeabi_memcpy>
c0deb356:	2500      	movs	r5, #0
c0deb358:	e001      	b.n	c0deb35e <bip32_derive_with_seed_get_pubkey_256+0x52>
c0deb35a:	f06f 055c 	mvn.w	r5, #92	@ 0x5c
c0deb35e:	a817      	add	r0, sp, #92	@ 0x5c
c0deb360:	f000 f82f 	bl	c0deb3c2 <OUTLINED_FUNCTION_0>
c0deb364:	b11d      	cbz	r5, c0deb36e <bip32_derive_with_seed_get_pubkey_256+0x62>
c0deb366:	4620      	mov	r0, r4
c0deb368:	2141      	movs	r1, #65	@ 0x41
c0deb36a:	f000 ff51 	bl	c0dec210 <explicit_bzero>
c0deb36e:	4628      	mov	r0, r5
c0deb370:	b021      	add	sp, #132	@ 0x84
c0deb372:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0deb374 <bip32_derive_with_seed_ecdsa_sign_hash_256>:
c0deb374:	b5f0      	push	{r4, r5, r6, r7, lr}
c0deb376:	b08f      	sub	sp, #60	@ 0x3c
c0deb378:	9f19      	ldr	r7, [sp, #100]	@ 0x64
c0deb37a:	9d1c      	ldr	r5, [sp, #112]	@ 0x70
c0deb37c:	683c      	ldr	r4, [r7, #0]
c0deb37e:	9503      	str	r5, [sp, #12]
c0deb380:	9d1b      	ldr	r5, [sp, #108]	@ 0x6c
c0deb382:	9502      	str	r5, [sp, #8]
c0deb384:	2500      	movs	r5, #0
c0deb386:	9501      	str	r5, [sp, #4]
c0deb388:	ad05      	add	r5, sp, #20
c0deb38a:	9500      	str	r5, [sp, #0]
c0deb38c:	f7ff ff46 	bl	c0deb21c <bip32_derive_with_seed_init_privkey_256>
c0deb390:	9d18      	ldr	r5, [sp, #96]	@ 0x60
c0deb392:	4606      	mov	r6, r0
c0deb394:	b950      	cbnz	r0, c0deb3ac <bip32_derive_with_seed_ecdsa_sign_hash_256+0x38>
c0deb396:	ae14      	add	r6, sp, #80	@ 0x50
c0deb398:	981a      	ldr	r0, [sp, #104]	@ 0x68
c0deb39a:	ce4e      	ldmia	r6, {r1, r2, r3, r6}
c0deb39c:	e9cd 6500 	strd	r6, r5, [sp]
c0deb3a0:	e9cd 7002 	strd	r7, r0, [sp, #8]
c0deb3a4:	a805      	add	r0, sp, #20
c0deb3a6:	f000 fab8 	bl	c0deb91a <cx_ecdsa_sign_no_throw>
c0deb3aa:	4606      	mov	r6, r0
c0deb3ac:	a805      	add	r0, sp, #20
c0deb3ae:	f000 f808 	bl	c0deb3c2 <OUTLINED_FUNCTION_0>
c0deb3b2:	b11e      	cbz	r6, c0deb3bc <bip32_derive_with_seed_ecdsa_sign_hash_256+0x48>
c0deb3b4:	4628      	mov	r0, r5
c0deb3b6:	4621      	mov	r1, r4
c0deb3b8:	f000 ff2a 	bl	c0dec210 <explicit_bzero>
c0deb3bc:	4630      	mov	r0, r6
c0deb3be:	b00f      	add	sp, #60	@ 0x3c
c0deb3c0:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0deb3c2 <OUTLINED_FUNCTION_0>:
c0deb3c2:	2128      	movs	r1, #40	@ 0x28
c0deb3c4:	f000 bf24 	b.w	c0dec210 <explicit_bzero>

c0deb3c8 <format_u64>:
c0deb3c8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0deb3cc:	b1f9      	cbz	r1, c0deb40e <format_u64+0x46>
c0deb3ce:	4615      	mov	r5, r2
c0deb3d0:	4604      	mov	r4, r0
c0deb3d2:	f1a1 0801 	sub.w	r8, r1, #1
c0deb3d6:	2700      	movs	r7, #0
c0deb3d8:	2600      	movs	r6, #0
c0deb3da:	f1b5 000a 	subs.w	r0, r5, #10
c0deb3de:	f173 0000 	sbcs.w	r0, r3, #0
c0deb3e2:	d316      	bcc.n	c0deb412 <format_u64+0x4a>
c0deb3e4:	4619      	mov	r1, r3
c0deb3e6:	4628      	mov	r0, r5
c0deb3e8:	220a      	movs	r2, #10
c0deb3ea:	2300      	movs	r3, #0
c0deb3ec:	f000 ff06 	bl	c0dec1fc <__aeabi_uldivmod>
c0deb3f0:	460b      	mov	r3, r1
c0deb3f2:	eb00 0180 	add.w	r1, r0, r0, lsl #2
c0deb3f6:	1cba      	adds	r2, r7, #2
c0deb3f8:	eba5 0141 	sub.w	r1, r5, r1, lsl #1
c0deb3fc:	4605      	mov	r5, r0
c0deb3fe:	f041 0130 	orr.w	r1, r1, #48	@ 0x30
c0deb402:	55e1      	strb	r1, [r4, r7]
c0deb404:	1c79      	adds	r1, r7, #1
c0deb406:	4542      	cmp	r2, r8
c0deb408:	460f      	mov	r7, r1
c0deb40a:	d9e6      	bls.n	c0deb3da <format_u64+0x12>
c0deb40c:	e012      	b.n	c0deb434 <format_u64+0x6c>
c0deb40e:	2600      	movs	r6, #0
c0deb410:	e010      	b.n	c0deb434 <format_u64+0x6c>
c0deb412:	f105 0030 	add.w	r0, r5, #48	@ 0x30
c0deb416:	19e1      	adds	r1, r4, r7
c0deb418:	55e0      	strb	r0, [r4, r7]
c0deb41a:	2000      	movs	r0, #0
c0deb41c:	7048      	strb	r0, [r1, #1]
c0deb41e:	b2c1      	uxtb	r1, r0
c0deb420:	428f      	cmp	r7, r1
c0deb422:	d906      	bls.n	c0deb432 <format_u64+0x6a>
c0deb424:	5c62      	ldrb	r2, [r4, r1]
c0deb426:	5de3      	ldrb	r3, [r4, r7]
c0deb428:	3001      	adds	r0, #1
c0deb42a:	5463      	strb	r3, [r4, r1]
c0deb42c:	55e2      	strb	r2, [r4, r7]
c0deb42e:	3f01      	subs	r7, #1
c0deb430:	e7f5      	b.n	c0deb41e <format_u64+0x56>
c0deb432:	2601      	movs	r6, #1
c0deb434:	4630      	mov	r0, r6
c0deb436:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0deb43a <format_fpu64>:
c0deb43a:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0deb43e:	b086      	sub	sp, #24
c0deb440:	466c      	mov	r4, sp
c0deb442:	4688      	mov	r8, r1
c0deb444:	4605      	mov	r5, r0
c0deb446:	2115      	movs	r1, #21
c0deb448:	461e      	mov	r6, r3
c0deb44a:	4617      	mov	r7, r2
c0deb44c:	4620      	mov	r0, r4
c0deb44e:	f000 fed1 	bl	c0dec1f4 <__aeabi_memclr>
c0deb452:	4620      	mov	r0, r4
c0deb454:	2115      	movs	r1, #21
c0deb456:	463a      	mov	r2, r7
c0deb458:	4633      	mov	r3, r6
c0deb45a:	f7ff ffb5 	bl	c0deb3c8 <format_u64>
c0deb45e:	b340      	cbz	r0, c0deb4b2 <format_fpu64+0x78>
c0deb460:	466f      	mov	r7, sp
c0deb462:	9e0c      	ldr	r6, [sp, #48]	@ 0x30
c0deb464:	4638      	mov	r0, r7
c0deb466:	f000 ff21 	bl	c0dec2ac <strlen>
c0deb46a:	42b0      	cmp	r0, r6
c0deb46c:	d910      	bls.n	c0deb490 <format_fpu64+0x56>
c0deb46e:	1831      	adds	r1, r6, r0
c0deb470:	3101      	adds	r1, #1
c0deb472:	4541      	cmp	r1, r8
c0deb474:	d21d      	bcs.n	c0deb4b2 <format_fpu64+0x78>
c0deb476:	1b84      	subs	r4, r0, r6
c0deb478:	4628      	mov	r0, r5
c0deb47a:	4639      	mov	r1, r7
c0deb47c:	4622      	mov	r2, r4
c0deb47e:	f000 feaf 	bl	c0dec1e0 <__aeabi_memcpy>
c0deb482:	1928      	adds	r0, r5, r4
c0deb484:	212e      	movs	r1, #46	@ 0x2e
c0deb486:	4632      	mov	r2, r6
c0deb488:	f800 1b01 	strb.w	r1, [r0], #1
c0deb48c:	1939      	adds	r1, r7, r4
c0deb48e:	e015      	b.n	c0deb4bc <format_fpu64+0x82>
c0deb490:	1a32      	subs	r2, r6, r0
c0deb492:	1c91      	adds	r1, r2, #2
c0deb494:	4541      	cmp	r1, r8
c0deb496:	d20c      	bcs.n	c0deb4b2 <format_fpu64+0x78>
c0deb498:	202e      	movs	r0, #46	@ 0x2e
c0deb49a:	2330      	movs	r3, #48	@ 0x30
c0deb49c:	2400      	movs	r4, #0
c0deb49e:	7068      	strb	r0, [r5, #1]
c0deb4a0:	1ca8      	adds	r0, r5, #2
c0deb4a2:	702b      	strb	r3, [r5, #0]
c0deb4a4:	b2a5      	uxth	r5, r4
c0deb4a6:	42aa      	cmp	r2, r5
c0deb4a8:	d905      	bls.n	c0deb4b6 <format_fpu64+0x7c>
c0deb4aa:	f800 3b01 	strb.w	r3, [r0], #1
c0deb4ae:	3401      	adds	r4, #1
c0deb4b0:	e7f8      	b.n	c0deb4a4 <format_fpu64+0x6a>
c0deb4b2:	2000      	movs	r0, #0
c0deb4b4:	e005      	b.n	c0deb4c2 <format_fpu64+0x88>
c0deb4b6:	eba8 0201 	sub.w	r2, r8, r1
c0deb4ba:	4669      	mov	r1, sp
c0deb4bc:	f000 fefe 	bl	c0dec2bc <strncpy>
c0deb4c0:	2001      	movs	r0, #1
c0deb4c2:	b006      	add	sp, #24
c0deb4c4:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0deb4c8 <format_hex>:
c0deb4c8:	b5f0      	push	{r4, r5, r6, r7, lr}
c0deb4ca:	4604      	mov	r4, r0
c0deb4cc:	0048      	lsls	r0, r1, #1
c0deb4ce:	f100 0c01 	add.w	ip, r0, #1
c0deb4d2:	459c      	cmp	ip, r3
c0deb4d4:	d902      	bls.n	c0deb4dc <format_hex+0x14>
c0deb4d6:	f04f 3cff 	mov.w	ip, #4294967295	@ 0xffffffff
c0deb4da:	e018      	b.n	c0deb50e <format_hex+0x46>
c0deb4dc:	480d      	ldr	r0, [pc, #52]	@ (c0deb514 <format_hex+0x4c>)
c0deb4de:	2500      	movs	r5, #0
c0deb4e0:	4478      	add	r0, pc
c0deb4e2:	b191      	cbz	r1, c0deb50a <format_hex+0x42>
c0deb4e4:	1cef      	adds	r7, r5, #3
c0deb4e6:	429f      	cmp	r7, r3
c0deb4e8:	d80d      	bhi.n	c0deb506 <format_hex+0x3e>
c0deb4ea:	7827      	ldrb	r7, [r4, #0]
c0deb4ec:	3901      	subs	r1, #1
c0deb4ee:	093f      	lsrs	r7, r7, #4
c0deb4f0:	5dc7      	ldrb	r7, [r0, r7]
c0deb4f2:	5557      	strb	r7, [r2, r5]
c0deb4f4:	1957      	adds	r7, r2, r5
c0deb4f6:	3502      	adds	r5, #2
c0deb4f8:	f814 6b01 	ldrb.w	r6, [r4], #1
c0deb4fc:	f006 060f 	and.w	r6, r6, #15
c0deb500:	5d86      	ldrb	r6, [r0, r6]
c0deb502:	707e      	strb	r6, [r7, #1]
c0deb504:	e7ed      	b.n	c0deb4e2 <format_hex+0x1a>
c0deb506:	f105 0c01 	add.w	ip, r5, #1
c0deb50a:	2000      	movs	r0, #0
c0deb50c:	5550      	strb	r0, [r2, r5]
c0deb50e:	4660      	mov	r0, ip
c0deb510:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0deb512:	bf00      	nop
c0deb514:	00002a0a 	.word	0x00002a0a

c0deb518 <app_ticker_event_callback>:
c0deb518:	4770      	bx	lr
	...

c0deb51c <io_event>:
c0deb51c:	b580      	push	{r7, lr}
c0deb51e:	480b      	ldr	r0, [pc, #44]	@ (c0deb54c <io_event+0x30>)
c0deb520:	f819 1000 	ldrb.w	r1, [r9, r0]
c0deb524:	2905      	cmp	r1, #5
c0deb526:	d00e      	beq.n	c0deb546 <io_event+0x2a>
c0deb528:	290e      	cmp	r1, #14
c0deb52a:	d005      	beq.n	c0deb538 <io_event+0x1c>
c0deb52c:	290c      	cmp	r1, #12
c0deb52e:	d108      	bne.n	c0deb542 <io_event+0x26>
c0deb530:	4448      	add	r0, r9
c0deb532:	f000 f92f 	bl	c0deb794 <ux_process_finger_event>
c0deb536:	e006      	b.n	c0deb546 <io_event+0x2a>
c0deb538:	f7ff ffee 	bl	c0deb518 <app_ticker_event_callback>
c0deb53c:	f000 f980 	bl	c0deb840 <ux_process_ticker_event>
c0deb540:	e001      	b.n	c0deb546 <io_event+0x2a>
c0deb542:	f000 f9b3 	bl	c0deb8ac <ux_process_default_event>
c0deb546:	2001      	movs	r0, #1
c0deb548:	bd80      	pop	{r7, pc}
c0deb54a:	bf00      	nop
c0deb54c:	00001cb0 	.word	0x00001cb0

c0deb550 <io_init>:
c0deb550:	4802      	ldr	r0, [pc, #8]	@ (c0deb55c <io_init+0xc>)
c0deb552:	2101      	movs	r1, #1
c0deb554:	f809 1000 	strb.w	r1, [r9, r0]
c0deb558:	4770      	bx	lr
c0deb55a:	bf00      	nop
c0deb55c:	00001dc0 	.word	0x00001dc0

c0deb560 <io_recv_command>:
c0deb560:	b510      	push	{r4, lr}
c0deb562:	4c09      	ldr	r4, [pc, #36]	@ (c0deb588 <io_recv_command+0x28>)
c0deb564:	f819 0004 	ldrb.w	r0, [r9, r4]
c0deb568:	2801      	cmp	r0, #1
c0deb56a:	d104      	bne.n	c0deb576 <io_recv_command+0x16>
c0deb56c:	f000 fce2 	bl	c0debf34 <os_io_start>
c0deb570:	2000      	movs	r0, #0
c0deb572:	f809 0004 	strb.w	r0, [r9, r4]
c0deb576:	2000      	movs	r0, #0
c0deb578:	2800      	cmp	r0, #0
c0deb57a:	dc03      	bgt.n	c0deb584 <io_recv_command+0x24>
c0deb57c:	2001      	movs	r0, #1
c0deb57e:	f7f8 fdeb 	bl	c0de4158 <io_legacy_apdu_rx>
c0deb582:	e7f9      	b.n	c0deb578 <io_recv_command+0x18>
c0deb584:	bd10      	pop	{r4, pc}
c0deb586:	bf00      	nop
c0deb588:	00001dc0 	.word	0x00001dc0

c0deb58c <io_send_response_buffers>:
c0deb58c:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0deb590:	f8df a060 	ldr.w	sl, [pc, #96]	@ c0deb5f4 <io_send_response_buffers+0x68>
c0deb594:	4690      	mov	r8, r2
c0deb596:	460f      	mov	r7, r1
c0deb598:	4605      	mov	r5, r0
c0deb59a:	f240 140f 	movw	r4, #271	@ 0x10f
c0deb59e:	2600      	movs	r6, #0
c0deb5a0:	b1b5      	cbz	r5, c0deb5d0 <io_send_response_buffers+0x44>
c0deb5a2:	b1af      	cbz	r7, c0deb5d0 <io_send_response_buffers+0x44>
c0deb5a4:	2600      	movs	r6, #0
c0deb5a6:	b19f      	cbz	r7, c0deb5d0 <io_send_response_buffers+0x44>
c0deb5a8:	eb09 000a 	add.w	r0, r9, sl
c0deb5ac:	1ba2      	subs	r2, r4, r6
c0deb5ae:	1981      	adds	r1, r0, r6
c0deb5b0:	4628      	mov	r0, r5
c0deb5b2:	f7ff fe01 	bl	c0deb1b8 <buffer_copy>
c0deb5b6:	b130      	cbz	r0, c0deb5c6 <io_send_response_buffers+0x3a>
c0deb5b8:	e9d5 0101 	ldrd	r0, r1, [r5, #4]
c0deb5bc:	350c      	adds	r5, #12
c0deb5be:	3f01      	subs	r7, #1
c0deb5c0:	4430      	add	r0, r6
c0deb5c2:	1a46      	subs	r6, r0, r1
c0deb5c4:	e7ef      	b.n	c0deb5a6 <io_send_response_buffers+0x1a>
c0deb5c6:	f646 2884 	movw	r8, #27268	@ 0x6a84
c0deb5ca:	2500      	movs	r5, #0
c0deb5cc:	2700      	movs	r7, #0
c0deb5ce:	e7e6      	b.n	c0deb59e <io_send_response_buffers+0x12>
c0deb5d0:	eb09 050a 	add.w	r5, r9, sl
c0deb5d4:	fa1f f288 	uxth.w	r2, r8
c0deb5d8:	4631      	mov	r1, r6
c0deb5da:	4628      	mov	r0, r5
c0deb5dc:	f000 f8d4 	bl	c0deb788 <write_u16_be>
c0deb5e0:	1cb0      	adds	r0, r6, #2
c0deb5e2:	b281      	uxth	r1, r0
c0deb5e4:	4628      	mov	r0, r5
c0deb5e6:	f7f8 fd9d 	bl	c0de4124 <io_legacy_apdu_tx>
c0deb5ea:	ea40 70e0 	orr.w	r0, r0, r0, asr #31
c0deb5ee:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0deb5f2:	bf00      	nop
c0deb5f4:	000014b7 	.word	0x000014b7

c0deb5f8 <app_exit>:
c0deb5f8:	20ff      	movs	r0, #255	@ 0xff
c0deb5fa:	f000 fc87 	bl	c0debf0c <os_sched_exit>

c0deb5fe <common_app_init>:
c0deb5fe:	b580      	push	{r7, lr}
c0deb600:	f000 f9c8 	bl	c0deb994 <nbgl_objInit>
c0deb604:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0deb608:	f7f8 bed2 	b.w	c0de43b0 <io_seproxyhal_init>

c0deb60c <standalone_app_main>:
c0deb60c:	b510      	push	{r4, lr}
c0deb60e:	b08c      	sub	sp, #48	@ 0x30
c0deb610:	466c      	mov	r4, sp
c0deb612:	4620      	mov	r0, r4
c0deb614:	f000 fe32 	bl	c0dec27c <setjmp>
c0deb618:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0deb61c:	0400      	lsls	r0, r0, #16
c0deb61e:	d108      	bne.n	c0deb632 <standalone_app_main+0x26>
c0deb620:	4668      	mov	r0, sp
c0deb622:	f000 fcb1 	bl	c0debf88 <try_context_set>
c0deb626:	900a      	str	r0, [sp, #40]	@ 0x28
c0deb628:	f7ff ffe9 	bl	c0deb5fe <common_app_init>
c0deb62c:	f7f4 fe34 	bl	c0de0298 <app_main>
c0deb630:	e005      	b.n	c0deb63e <standalone_app_main+0x32>
c0deb632:	2000      	movs	r0, #0
c0deb634:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0deb638:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0deb63a:	f000 fca5 	bl	c0debf88 <try_context_set>
c0deb63e:	f000 fc9b 	bl	c0debf78 <try_context_get>
c0deb642:	42a0      	cmp	r0, r4
c0deb644:	d102      	bne.n	c0deb64c <standalone_app_main+0x40>
c0deb646:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0deb648:	f000 fc9e 	bl	c0debf88 <try_context_set>
c0deb64c:	f8bd 002c 	ldrh.w	r0, [sp, #44]	@ 0x2c
c0deb650:	b908      	cbnz	r0, c0deb656 <standalone_app_main+0x4a>
c0deb652:	f7ff ffd1 	bl	c0deb5f8 <app_exit>
c0deb656:	f000 fa12 	bl	c0deba7e <os_longjmp>

c0deb65a <apdu_parser>:
c0deb65a:	2a04      	cmp	r2, #4
c0deb65c:	d316      	bcc.n	c0deb68c <apdu_parser+0x32>
c0deb65e:	d102      	bne.n	c0deb666 <apdu_parser+0xc>
c0deb660:	2300      	movs	r3, #0
c0deb662:	7103      	strb	r3, [r0, #4]
c0deb664:	e004      	b.n	c0deb670 <apdu_parser+0x16>
c0deb666:	790b      	ldrb	r3, [r1, #4]
c0deb668:	3a05      	subs	r2, #5
c0deb66a:	429a      	cmp	r2, r3
c0deb66c:	7103      	strb	r3, [r0, #4]
c0deb66e:	d10d      	bne.n	c0deb68c <apdu_parser+0x32>
c0deb670:	780a      	ldrb	r2, [r1, #0]
c0deb672:	2b00      	cmp	r3, #0
c0deb674:	7002      	strb	r2, [r0, #0]
c0deb676:	784a      	ldrb	r2, [r1, #1]
c0deb678:	7042      	strb	r2, [r0, #1]
c0deb67a:	788a      	ldrb	r2, [r1, #2]
c0deb67c:	7082      	strb	r2, [r0, #2]
c0deb67e:	bf18      	it	ne
c0deb680:	1d4b      	addne	r3, r1, #5
c0deb682:	78c9      	ldrb	r1, [r1, #3]
c0deb684:	6083      	str	r3, [r0, #8]
c0deb686:	70c1      	strb	r1, [r0, #3]
c0deb688:	2001      	movs	r0, #1
c0deb68a:	4770      	bx	lr
c0deb68c:	2000      	movs	r0, #0
c0deb68e:	4770      	bx	lr

c0deb690 <read_u32_be>:
c0deb690:	5c42      	ldrb	r2, [r0, r1]
c0deb692:	4408      	add	r0, r1
c0deb694:	7841      	ldrb	r1, [r0, #1]
c0deb696:	7883      	ldrb	r3, [r0, #2]
c0deb698:	78c0      	ldrb	r0, [r0, #3]
c0deb69a:	0409      	lsls	r1, r1, #16
c0deb69c:	ea41 6102 	orr.w	r1, r1, r2, lsl #24
c0deb6a0:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0deb6a4:	4408      	add	r0, r1
c0deb6a6:	4770      	bx	lr

c0deb6a8 <read_u64_be>:
c0deb6a8:	b5f0      	push	{r4, r5, r6, r7, lr}
c0deb6aa:	1842      	adds	r2, r0, r1
c0deb6ac:	5c40      	ldrb	r0, [r0, r1]
c0deb6ae:	7917      	ldrb	r7, [r2, #4]
c0deb6b0:	7953      	ldrb	r3, [r2, #5]
c0deb6b2:	7854      	ldrb	r4, [r2, #1]
c0deb6b4:	7895      	ldrb	r5, [r2, #2]
c0deb6b6:	78d6      	ldrb	r6, [r2, #3]
c0deb6b8:	063f      	lsls	r7, r7, #24
c0deb6ba:	0421      	lsls	r1, r4, #16
c0deb6bc:	ea47 4303 	orr.w	r3, r7, r3, lsl #16
c0deb6c0:	7997      	ldrb	r7, [r2, #6]
c0deb6c2:	79d2      	ldrb	r2, [r2, #7]
c0deb6c4:	ea41 6000 	orr.w	r0, r1, r0, lsl #24
c0deb6c8:	ea40 2005 	orr.w	r0, r0, r5, lsl #8
c0deb6cc:	ea43 2307 	orr.w	r3, r3, r7, lsl #8
c0deb6d0:	1981      	adds	r1, r0, r6
c0deb6d2:	441a      	add	r2, r3
c0deb6d4:	4610      	mov	r0, r2
c0deb6d6:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0deb6d8 <read_u16_le>:
c0deb6d8:	5c42      	ldrb	r2, [r0, r1]
c0deb6da:	4408      	add	r0, r1
c0deb6dc:	7840      	ldrb	r0, [r0, #1]
c0deb6de:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0deb6e2:	b280      	uxth	r0, r0
c0deb6e4:	4770      	bx	lr

c0deb6e6 <read_u32_le>:
c0deb6e6:	5c42      	ldrb	r2, [r0, r1]
c0deb6e8:	4408      	add	r0, r1
c0deb6ea:	7841      	ldrb	r1, [r0, #1]
c0deb6ec:	7883      	ldrb	r3, [r0, #2]
c0deb6ee:	78c0      	ldrb	r0, [r0, #3]
c0deb6f0:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0deb6f4:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
c0deb6f8:	ea41 6000 	orr.w	r0, r1, r0, lsl #24
c0deb6fc:	4770      	bx	lr

c0deb6fe <read_u64_le>:
c0deb6fe:	b5b0      	push	{r4, r5, r7, lr}
c0deb700:	5c42      	ldrb	r2, [r0, r1]
c0deb702:	4401      	add	r1, r0
c0deb704:	7848      	ldrb	r0, [r1, #1]
c0deb706:	788b      	ldrb	r3, [r1, #2]
c0deb708:	790d      	ldrb	r5, [r1, #4]
c0deb70a:	78cc      	ldrb	r4, [r1, #3]
c0deb70c:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0deb710:	794a      	ldrb	r2, [r1, #5]
c0deb712:	ea40 4003 	orr.w	r0, r0, r3, lsl #16
c0deb716:	798b      	ldrb	r3, [r1, #6]
c0deb718:	79c9      	ldrb	r1, [r1, #7]
c0deb71a:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0deb71e:	ea40 6004 	orr.w	r0, r0, r4, lsl #24
c0deb722:	ea42 4203 	orr.w	r2, r2, r3, lsl #16
c0deb726:	ea42 6101 	orr.w	r1, r2, r1, lsl #24
c0deb72a:	bdb0      	pop	{r4, r5, r7, pc}

c0deb72c <varint_read>:
c0deb72c:	b510      	push	{r4, lr}
c0deb72e:	b1d9      	cbz	r1, c0deb768 <varint_read+0x3c>
c0deb730:	4614      	mov	r4, r2
c0deb732:	4602      	mov	r2, r0
c0deb734:	7800      	ldrb	r0, [r0, #0]
c0deb736:	28ff      	cmp	r0, #255	@ 0xff
c0deb738:	d00c      	beq.n	c0deb754 <varint_read+0x28>
c0deb73a:	28fe      	cmp	r0, #254	@ 0xfe
c0deb73c:	d012      	beq.n	c0deb764 <varint_read+0x38>
c0deb73e:	28fd      	cmp	r0, #253	@ 0xfd
c0deb740:	d115      	bne.n	c0deb76e <varint_read+0x42>
c0deb742:	2903      	cmp	r1, #3
c0deb744:	d310      	bcc.n	c0deb768 <varint_read+0x3c>
c0deb746:	4610      	mov	r0, r2
c0deb748:	2101      	movs	r1, #1
c0deb74a:	f7ff ffc5 	bl	c0deb6d8 <read_u16_le>
c0deb74e:	2100      	movs	r1, #0
c0deb750:	2203      	movs	r2, #3
c0deb752:	e015      	b.n	c0deb780 <varint_read+0x54>
c0deb754:	2909      	cmp	r1, #9
c0deb756:	d307      	bcc.n	c0deb768 <varint_read+0x3c>
c0deb758:	4610      	mov	r0, r2
c0deb75a:	2101      	movs	r1, #1
c0deb75c:	f7ff ffcf 	bl	c0deb6fe <read_u64_le>
c0deb760:	2209      	movs	r2, #9
c0deb762:	e00d      	b.n	c0deb780 <varint_read+0x54>
c0deb764:	2905      	cmp	r1, #5
c0deb766:	d205      	bcs.n	c0deb774 <varint_read+0x48>
c0deb768:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
c0deb76c:	e00a      	b.n	c0deb784 <varint_read+0x58>
c0deb76e:	2100      	movs	r1, #0
c0deb770:	2201      	movs	r2, #1
c0deb772:	e005      	b.n	c0deb780 <varint_read+0x54>
c0deb774:	4610      	mov	r0, r2
c0deb776:	2101      	movs	r1, #1
c0deb778:	f7ff ffb5 	bl	c0deb6e6 <read_u32_le>
c0deb77c:	2100      	movs	r1, #0
c0deb77e:	2205      	movs	r2, #5
c0deb780:	e9c4 0100 	strd	r0, r1, [r4]
c0deb784:	4610      	mov	r0, r2
c0deb786:	bd10      	pop	{r4, pc}

c0deb788 <write_u16_be>:
c0deb788:	0a13      	lsrs	r3, r2, #8
c0deb78a:	5443      	strb	r3, [r0, r1]
c0deb78c:	4408      	add	r0, r1
c0deb78e:	7042      	strb	r2, [r0, #1]
c0deb790:	4770      	bx	lr
	...

c0deb794 <ux_process_finger_event>:
c0deb794:	b5b0      	push	{r4, r5, r7, lr}
c0deb796:	4604      	mov	r4, r0
c0deb798:	2001      	movs	r0, #1
c0deb79a:	f000 f827 	bl	c0deb7ec <ux_forward_event>
c0deb79e:	4605      	mov	r5, r0
c0deb7a0:	f000 f902 	bl	c0deb9a8 <nbgl_objAllowDrawing>
c0deb7a4:	b1fd      	cbz	r5, c0deb7e6 <ux_process_finger_event+0x52>
c0deb7a6:	78e1      	ldrb	r1, [r4, #3]
c0deb7a8:	480f      	ldr	r0, [pc, #60]	@ (c0deb7e8 <ux_process_finger_event+0x54>)
c0deb7aa:	7963      	ldrb	r3, [r4, #5]
c0deb7ac:	3901      	subs	r1, #1
c0deb7ae:	eb09 0200 	add.w	r2, r9, r0
c0deb7b2:	f859 0000 	ldr.w	r0, [r9, r0]
c0deb7b6:	fab1 f181 	clz	r1, r1
c0deb7ba:	094d      	lsrs	r5, r1, #5
c0deb7bc:	4611      	mov	r1, r2
c0deb7be:	f801 5f04 	strb.w	r5, [r1, #4]!
c0deb7c2:	7925      	ldrb	r5, [r4, #4]
c0deb7c4:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0deb7c8:	80d3      	strh	r3, [r2, #6]
c0deb7ca:	79a3      	ldrb	r3, [r4, #6]
c0deb7cc:	79e4      	ldrb	r4, [r4, #7]
c0deb7ce:	ea44 2303 	orr.w	r3, r4, r3, lsl #8
c0deb7d2:	8113      	strh	r3, [r2, #8]
c0deb7d4:	2264      	movs	r2, #100	@ 0x64
c0deb7d6:	4342      	muls	r2, r0
c0deb7d8:	2000      	movs	r0, #0
c0deb7da:	f000 f93a 	bl	c0deba52 <nbgl_touchHandler>
c0deb7de:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
c0deb7e2:	f000 b8c8 	b.w	c0deb976 <nbgl_refresh>
c0deb7e6:	bdb0      	pop	{r4, r5, r7, pc}
c0deb7e8:	00001de8 	.word	0x00001de8

c0deb7ec <ux_forward_event>:
c0deb7ec:	b5b0      	push	{r4, r5, r7, lr}
c0deb7ee:	4604      	mov	r4, r0
c0deb7f0:	4812      	ldr	r0, [pc, #72]	@ (c0deb83c <ux_forward_event+0x50>)
c0deb7f2:	2101      	movs	r1, #1
c0deb7f4:	f809 1000 	strb.w	r1, [r9, r0]
c0deb7f8:	eb09 0500 	add.w	r5, r9, r0
c0deb7fc:	2000      	movs	r0, #0
c0deb7fe:	6068      	str	r0, [r5, #4]
c0deb800:	4628      	mov	r0, r5
c0deb802:	f000 fb59 	bl	c0debeb8 <os_ux>
c0deb806:	2004      	movs	r0, #4
c0deb808:	f000 fbc8 	bl	c0debf9c <os_sched_last_status>
c0deb80c:	2869      	cmp	r0, #105	@ 0x69
c0deb80e:	6068      	str	r0, [r5, #4]
c0deb810:	d108      	bne.n	c0deb824 <ux_forward_event+0x38>
c0deb812:	2001      	movs	r0, #1
c0deb814:	f000 f8c8 	bl	c0deb9a8 <nbgl_objAllowDrawing>
c0deb818:	f000 f8d5 	bl	c0deb9c6 <nbgl_screenRedraw>
c0deb81c:	f000 f8ab 	bl	c0deb976 <nbgl_refresh>
c0deb820:	2000      	movs	r0, #0
c0deb822:	bdb0      	pop	{r4, r5, r7, pc}
c0deb824:	b144      	cbz	r4, c0deb838 <ux_forward_event+0x4c>
c0deb826:	f1b0 0197 	subs.w	r1, r0, #151	@ 0x97
c0deb82a:	bf18      	it	ne
c0deb82c:	2101      	movne	r1, #1
c0deb82e:	2800      	cmp	r0, #0
c0deb830:	bf18      	it	ne
c0deb832:	2001      	movne	r0, #1
c0deb834:	4008      	ands	r0, r1
c0deb836:	bdb0      	pop	{r4, r5, r7, pc}
c0deb838:	2001      	movs	r0, #1
c0deb83a:	bdb0      	pop	{r4, r5, r7, pc}
c0deb83c:	00001dc4 	.word	0x00001dc4

c0deb840 <ux_process_ticker_event>:
c0deb840:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0deb842:	4d19      	ldr	r5, [pc, #100]	@ (c0deb8a8 <ux_process_ticker_event+0x68>)
c0deb844:	f859 0005 	ldr.w	r0, [r9, r5]
c0deb848:	3001      	adds	r0, #1
c0deb84a:	f849 0005 	str.w	r0, [r9, r5]
c0deb84e:	2001      	movs	r0, #1
c0deb850:	f7ff ffcc 	bl	c0deb7ec <ux_forward_event>
c0deb854:	4604      	mov	r4, r0
c0deb856:	f000 f8a7 	bl	c0deb9a8 <nbgl_objAllowDrawing>
c0deb85a:	b324      	cbz	r4, c0deb8a6 <ux_process_ticker_event+0x66>
c0deb85c:	2064      	movs	r0, #100	@ 0x64
c0deb85e:	2464      	movs	r4, #100	@ 0x64
c0deb860:	f000 f8c0 	bl	c0deb9e4 <nbgl_screenHandler>
c0deb864:	eb09 0005 	add.w	r0, r9, r5
c0deb868:	7900      	ldrb	r0, [r0, #4]
c0deb86a:	2801      	cmp	r0, #1
c0deb86c:	d119      	bne.n	c0deb8a2 <ux_process_ticker_event+0x62>
c0deb86e:	4668      	mov	r0, sp
c0deb870:	f000 fba0 	bl	c0debfb4 <touch_get_last_info>
c0deb874:	f8bd 0000 	ldrh.w	r0, [sp]
c0deb878:	eb09 0105 	add.w	r1, r9, r5
c0deb87c:	80c8      	strh	r0, [r1, #6]
c0deb87e:	f8bd 0002 	ldrh.w	r0, [sp, #2]
c0deb882:	8108      	strh	r0, [r1, #8]
c0deb884:	f89d 0004 	ldrb.w	r0, [sp, #4]
c0deb888:	3801      	subs	r0, #1
c0deb88a:	fab0 f080 	clz	r0, r0
c0deb88e:	0940      	lsrs	r0, r0, #5
c0deb890:	f801 0f04 	strb.w	r0, [r1, #4]!
c0deb894:	f859 0005 	ldr.w	r0, [r9, r5]
c0deb898:	fb00 f204 	mul.w	r2, r0, r4
c0deb89c:	2000      	movs	r0, #0
c0deb89e:	f000 f8d8 	bl	c0deba52 <nbgl_touchHandler>
c0deb8a2:	f000 f868 	bl	c0deb976 <nbgl_refresh>
c0deb8a6:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}
c0deb8a8:	00001de8 	.word	0x00001de8

c0deb8ac <ux_process_default_event>:
c0deb8ac:	2000      	movs	r0, #0
c0deb8ae:	f7ff bf9d 	b.w	c0deb7ec <ux_forward_event>

c0deb8b2 <hash_iovec_ex>:
c0deb8b2:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0deb8b6:	468a      	mov	sl, r1
c0deb8b8:	4611      	mov	r1, r2
c0deb8ba:	461a      	mov	r2, r3
c0deb8bc:	4605      	mov	r5, r0
c0deb8be:	f000 f840 	bl	c0deb942 <cx_hash_init_ex>
c0deb8c2:	4607      	mov	r7, r0
c0deb8c4:	b9a8      	cbnz	r0, c0deb8f2 <hash_iovec_ex+0x40>
c0deb8c6:	f10d 0820 	add.w	r8, sp, #32
c0deb8ca:	e898 0141 	ldmia.w	r8, {r0, r6, r8}
c0deb8ce:	1d04      	adds	r4, r0, #4
c0deb8d0:	b156      	cbz	r6, c0deb8e8 <hash_iovec_ex+0x36>
c0deb8d2:	f854 1c04 	ldr.w	r1, [r4, #-4]
c0deb8d6:	f854 2b08 	ldr.w	r2, [r4], #8
c0deb8da:	4628      	mov	r0, r5
c0deb8dc:	f000 f836 	bl	c0deb94c <cx_hash_update>
c0deb8e0:	3e01      	subs	r6, #1
c0deb8e2:	2800      	cmp	r0, #0
c0deb8e4:	d0f4      	beq.n	c0deb8d0 <hash_iovec_ex+0x1e>
c0deb8e6:	e003      	b.n	c0deb8f0 <hash_iovec_ex+0x3e>
c0deb8e8:	4628      	mov	r0, r5
c0deb8ea:	4641      	mov	r1, r8
c0deb8ec:	f000 f824 	bl	c0deb938 <cx_hash_final>
c0deb8f0:	4607      	mov	r7, r0
c0deb8f2:	4628      	mov	r0, r5
c0deb8f4:	4651      	mov	r1, sl
c0deb8f6:	f000 fc8b 	bl	c0dec210 <explicit_bzero>
c0deb8fa:	4638      	mov	r0, r7
c0deb8fc:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}

c0deb900 <cx_keccak_256_hash_iovec>:
c0deb900:	b580      	push	{r7, lr}
c0deb902:	b0ee      	sub	sp, #440	@ 0x1b8
c0deb904:	e88d 0007 	stmia.w	sp, {r0, r1, r2}
c0deb908:	a804      	add	r0, sp, #16
c0deb90a:	f44f 71d4 	mov.w	r1, #424	@ 0x1a8
c0deb90e:	2206      	movs	r2, #6
c0deb910:	2320      	movs	r3, #32
c0deb912:	f7ff ffce 	bl	c0deb8b2 <hash_iovec_ex>
c0deb916:	b06e      	add	sp, #440	@ 0x1b8
c0deb918:	bd80      	pop	{r7, pc}

c0deb91a <cx_ecdsa_sign_no_throw>:
c0deb91a:	b403      	push	{r0, r1}
c0deb91c:	f04f 002c 	mov.w	r0, #44	@ 0x2c
c0deb920:	f000 b822 	b.w	c0deb968 <cx_trampoline_helper>

c0deb924 <cx_ecfp_generate_pair2_no_throw>:
c0deb924:	b403      	push	{r0, r1}
c0deb926:	f04f 0031 	mov.w	r0, #49	@ 0x31
c0deb92a:	f000 b81d 	b.w	c0deb968 <cx_trampoline_helper>

c0deb92e <cx_ecfp_init_private_key_no_throw>:
c0deb92e:	b403      	push	{r0, r1}
c0deb930:	f04f 0033 	mov.w	r0, #51	@ 0x33
c0deb934:	f000 b818 	b.w	c0deb968 <cx_trampoline_helper>

c0deb938 <cx_hash_final>:
c0deb938:	b403      	push	{r0, r1}
c0deb93a:	f04f 003f 	mov.w	r0, #63	@ 0x3f
c0deb93e:	f000 b813 	b.w	c0deb968 <cx_trampoline_helper>

c0deb942 <cx_hash_init_ex>:
c0deb942:	b403      	push	{r0, r1}
c0deb944:	f04f 0043 	mov.w	r0, #67	@ 0x43
c0deb948:	f000 b80e 	b.w	c0deb968 <cx_trampoline_helper>

c0deb94c <cx_hash_update>:
c0deb94c:	b403      	push	{r0, r1}
c0deb94e:	f04f 0048 	mov.w	r0, #72	@ 0x48
c0deb952:	f000 b809 	b.w	c0deb968 <cx_trampoline_helper>

c0deb956 <cx_rng_no_throw>:
c0deb956:	b403      	push	{r0, r1}
c0deb958:	f04f 006a 	mov.w	r0, #106	@ 0x6a
c0deb95c:	f000 b804 	b.w	c0deb968 <cx_trampoline_helper>

c0deb960 <cx_aes_siv_reset>:
c0deb960:	b403      	push	{r0, r1}
c0deb962:	f04f 0090 	mov.w	r0, #144	@ 0x90
c0deb966:	e7ff      	b.n	c0deb968 <cx_trampoline_helper>

c0deb968 <cx_trampoline_helper>:
c0deb968:	4900      	ldr	r1, [pc, #0]	@ (c0deb96c <cx_trampoline_helper+0x4>)
c0deb96a:	4708      	bx	r1
c0deb96c:	00808001 	.word	0x00808001

c0deb970 <assert_exit>:
c0deb970:	20ff      	movs	r0, #255	@ 0xff
c0deb972:	f000 facb 	bl	c0debf0c <os_sched_exit>

c0deb976 <nbgl_refresh>:
c0deb976:	b403      	push	{r0, r1}
c0deb978:	f04f 0091 	mov.w	r0, #145	@ 0x91
c0deb97c:	f000 b878 	b.w	c0deba70 <nbgl_trampoline_helper>

c0deb980 <nbgl_refreshSpecial>:
c0deb980:	b403      	push	{r0, r1}
c0deb982:	f04f 0092 	mov.w	r0, #146	@ 0x92
c0deb986:	f000 b873 	b.w	c0deba70 <nbgl_trampoline_helper>

c0deb98a <nbgl_refreshSpecialWithPostRefresh>:
c0deb98a:	b403      	push	{r0, r1}
c0deb98c:	f04f 0093 	mov.w	r0, #147	@ 0x93
c0deb990:	f000 b86e 	b.w	c0deba70 <nbgl_trampoline_helper>

c0deb994 <nbgl_objInit>:
c0deb994:	b403      	push	{r0, r1}
c0deb996:	f04f 0096 	mov.w	r0, #150	@ 0x96
c0deb99a:	f000 b869 	b.w	c0deba70 <nbgl_trampoline_helper>

c0deb99e <nbgl_objDraw>:
c0deb99e:	b403      	push	{r0, r1}
c0deb9a0:	f04f 0097 	mov.w	r0, #151	@ 0x97
c0deb9a4:	f000 b864 	b.w	c0deba70 <nbgl_trampoline_helper>

c0deb9a8 <nbgl_objAllowDrawing>:
c0deb9a8:	b403      	push	{r0, r1}
c0deb9aa:	f04f 0098 	mov.w	r0, #152	@ 0x98
c0deb9ae:	f000 b85f 	b.w	c0deba70 <nbgl_trampoline_helper>

c0deb9b2 <nbgl_screenSet>:
c0deb9b2:	b403      	push	{r0, r1}
c0deb9b4:	f04f 009b 	mov.w	r0, #155	@ 0x9b
c0deb9b8:	f000 b85a 	b.w	c0deba70 <nbgl_trampoline_helper>

c0deb9bc <nbgl_screenPush>:
c0deb9bc:	b403      	push	{r0, r1}
c0deb9be:	f04f 009c 	mov.w	r0, #156	@ 0x9c
c0deb9c2:	f000 b855 	b.w	c0deba70 <nbgl_trampoline_helper>

c0deb9c6 <nbgl_screenRedraw>:
c0deb9c6:	b403      	push	{r0, r1}
c0deb9c8:	f04f 009d 	mov.w	r0, #157	@ 0x9d
c0deb9cc:	f000 b850 	b.w	c0deba70 <nbgl_trampoline_helper>

c0deb9d0 <nbgl_screenPop>:
c0deb9d0:	b403      	push	{r0, r1}
c0deb9d2:	f04f 009e 	mov.w	r0, #158	@ 0x9e
c0deb9d6:	f000 b84b 	b.w	c0deba70 <nbgl_trampoline_helper>

c0deb9da <nbgl_screenUpdateTicker>:
c0deb9da:	b403      	push	{r0, r1}
c0deb9dc:	f04f 00a4 	mov.w	r0, #164	@ 0xa4
c0deb9e0:	f000 b846 	b.w	c0deba70 <nbgl_trampoline_helper>

c0deb9e4 <nbgl_screenHandler>:
c0deb9e4:	b403      	push	{r0, r1}
c0deb9e6:	f04f 00a7 	mov.w	r0, #167	@ 0xa7
c0deb9ea:	f000 b841 	b.w	c0deba70 <nbgl_trampoline_helper>

c0deb9ee <nbgl_objPoolGet>:
c0deb9ee:	b403      	push	{r0, r1}
c0deb9f0:	f04f 00a8 	mov.w	r0, #168	@ 0xa8
c0deb9f4:	f000 b83c 	b.w	c0deba70 <nbgl_trampoline_helper>

c0deb9f8 <nbgl_containerPoolGet>:
c0deb9f8:	b403      	push	{r0, r1}
c0deb9fa:	f04f 00aa 	mov.w	r0, #170	@ 0xaa
c0deb9fe:	f000 b837 	b.w	c0deba70 <nbgl_trampoline_helper>

c0deba02 <nbgl_getFont>:
c0deba02:	b403      	push	{r0, r1}
c0deba04:	f04f 00ac 	mov.w	r0, #172	@ 0xac
c0deba08:	f000 b832 	b.w	c0deba70 <nbgl_trampoline_helper>

c0deba0c <nbgl_getFontHeight>:
c0deba0c:	b403      	push	{r0, r1}
c0deba0e:	f04f 00ad 	mov.w	r0, #173	@ 0xad
c0deba12:	f000 b82d 	b.w	c0deba70 <nbgl_trampoline_helper>

c0deba16 <nbgl_getFontLineHeight>:
c0deba16:	b403      	push	{r0, r1}
c0deba18:	f04f 00ae 	mov.w	r0, #174	@ 0xae
c0deba1c:	f000 b828 	b.w	c0deba70 <nbgl_trampoline_helper>

c0deba20 <nbgl_getTextHeightInWidth>:
c0deba20:	b403      	push	{r0, r1}
c0deba22:	f04f 00b2 	mov.w	r0, #178	@ 0xb2
c0deba26:	f000 b823 	b.w	c0deba70 <nbgl_trampoline_helper>

c0deba2a <nbgl_getTextNbLinesInWidth>:
c0deba2a:	b403      	push	{r0, r1}
c0deba2c:	f04f 00b4 	mov.w	r0, #180	@ 0xb4
c0deba30:	f000 b81e 	b.w	c0deba70 <nbgl_trampoline_helper>

c0deba34 <nbgl_getTextWidth>:
c0deba34:	b403      	push	{r0, r1}
c0deba36:	f04f 00b6 	mov.w	r0, #182	@ 0xb6
c0deba3a:	f000 b819 	b.w	c0deba70 <nbgl_trampoline_helper>

c0deba3e <nbgl_getTextMaxLenInNbLines>:
c0deba3e:	b403      	push	{r0, r1}
c0deba40:	f04f 00b7 	mov.w	r0, #183	@ 0xb7
c0deba44:	f000 b814 	b.w	c0deba70 <nbgl_trampoline_helper>

c0deba48 <nbgl_textReduceOnNbLines>:
c0deba48:	b403      	push	{r0, r1}
c0deba4a:	f04f 00b8 	mov.w	r0, #184	@ 0xb8
c0deba4e:	f000 b80f 	b.w	c0deba70 <nbgl_trampoline_helper>

c0deba52 <nbgl_touchHandler>:
c0deba52:	b403      	push	{r0, r1}
c0deba54:	f04f 00bb 	mov.w	r0, #187	@ 0xbb
c0deba58:	f000 b80a 	b.w	c0deba70 <nbgl_trampoline_helper>

c0deba5c <nbgl_touchGetTouchDuration>:
c0deba5c:	b403      	push	{r0, r1}
c0deba5e:	f04f 00bc 	mov.w	r0, #188	@ 0xbc
c0deba62:	f000 b805 	b.w	c0deba70 <nbgl_trampoline_helper>
	...

c0deba68 <pic_init>:
c0deba68:	b403      	push	{r0, r1}
c0deba6a:	f04f 00c4 	mov.w	r0, #196	@ 0xc4
c0deba6e:	e7ff      	b.n	c0deba70 <nbgl_trampoline_helper>

c0deba70 <nbgl_trampoline_helper>:
c0deba70:	4900      	ldr	r1, [pc, #0]	@ (c0deba74 <nbgl_trampoline_helper+0x4>)
c0deba72:	4708      	bx	r1
c0deba74:	00808001 	.word	0x00808001

c0deba78 <os_boot>:
c0deba78:	2000      	movs	r0, #0
c0deba7a:	f000 ba85 	b.w	c0debf88 <try_context_set>

c0deba7e <os_longjmp>:
c0deba7e:	4604      	mov	r4, r0
c0deba80:	f000 fa7a 	bl	c0debf78 <try_context_get>
c0deba84:	4621      	mov	r1, r4
c0deba86:	f000 fbff 	bl	c0dec288 <longjmp>
	...

c0deba8c <snprintf>:
c0deba8c:	b081      	sub	sp, #4
c0deba8e:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0deba92:	b087      	sub	sp, #28
c0deba94:	2800      	cmp	r0, #0
c0deba96:	930f      	str	r3, [sp, #60]	@ 0x3c
c0deba98:	f000 817a 	beq.w	c0debd90 <snprintf+0x304>
c0deba9c:	460d      	mov	r5, r1
c0deba9e:	2900      	cmp	r1, #0
c0debaa0:	f000 8176 	beq.w	c0debd90 <snprintf+0x304>
c0debaa4:	4629      	mov	r1, r5
c0debaa6:	4616      	mov	r6, r2
c0debaa8:	4604      	mov	r4, r0
c0debaaa:	f000 fba3 	bl	c0dec1f4 <__aeabi_memclr>
c0debaae:	f1b5 0801 	subs.w	r8, r5, #1
c0debab2:	f000 816d 	beq.w	c0debd90 <snprintf+0x304>
c0debab6:	a80f      	add	r0, sp, #60	@ 0x3c
c0debab8:	9002      	str	r0, [sp, #8]
c0debaba:	7830      	ldrb	r0, [r6, #0]
c0debabc:	2800      	cmp	r0, #0
c0debabe:	f000 8167 	beq.w	c0debd90 <snprintf+0x304>
c0debac2:	2700      	movs	r7, #0
c0debac4:	b128      	cbz	r0, c0debad2 <snprintf+0x46>
c0debac6:	2825      	cmp	r0, #37	@ 0x25
c0debac8:	d003      	beq.n	c0debad2 <snprintf+0x46>
c0debaca:	19f0      	adds	r0, r6, r7
c0debacc:	3701      	adds	r7, #1
c0debace:	7840      	ldrb	r0, [r0, #1]
c0debad0:	e7f8      	b.n	c0debac4 <snprintf+0x38>
c0debad2:	4547      	cmp	r7, r8
c0debad4:	bf28      	it	cs
c0debad6:	4647      	movcs	r7, r8
c0debad8:	4620      	mov	r0, r4
c0debada:	4631      	mov	r1, r6
c0debadc:	463a      	mov	r2, r7
c0debade:	f000 fb81 	bl	c0dec1e4 <__aeabi_memmove>
c0debae2:	ebb8 0807 	subs.w	r8, r8, r7
c0debae6:	f000 8153 	beq.w	c0debd90 <snprintf+0x304>
c0debaea:	5df1      	ldrb	r1, [r6, r7]
c0debaec:	19f0      	adds	r0, r6, r7
c0debaee:	443c      	add	r4, r7
c0debaf0:	4606      	mov	r6, r0
c0debaf2:	2925      	cmp	r1, #37	@ 0x25
c0debaf4:	d1e1      	bne.n	c0debaba <snprintf+0x2e>
c0debaf6:	1c41      	adds	r1, r0, #1
c0debaf8:	f04f 0b00 	mov.w	fp, #0
c0debafc:	f04f 0e20 	mov.w	lr, #32
c0debb00:	2500      	movs	r5, #0
c0debb02:	2600      	movs	r6, #0
c0debb04:	3101      	adds	r1, #1
c0debb06:	f811 3c01 	ldrb.w	r3, [r1, #-1]
c0debb0a:	4632      	mov	r2, r6
c0debb0c:	3101      	adds	r1, #1
c0debb0e:	2600      	movs	r6, #0
c0debb10:	2b2d      	cmp	r3, #45	@ 0x2d
c0debb12:	d0f8      	beq.n	c0debb06 <snprintf+0x7a>
c0debb14:	f1a3 0630 	sub.w	r6, r3, #48	@ 0x30
c0debb18:	2e0a      	cmp	r6, #10
c0debb1a:	d313      	bcc.n	c0debb44 <snprintf+0xb8>
c0debb1c:	2b25      	cmp	r3, #37	@ 0x25
c0debb1e:	d046      	beq.n	c0debbae <snprintf+0x122>
c0debb20:	2b2a      	cmp	r3, #42	@ 0x2a
c0debb22:	d01f      	beq.n	c0debb64 <snprintf+0xd8>
c0debb24:	2b2e      	cmp	r3, #46	@ 0x2e
c0debb26:	d129      	bne.n	c0debb7c <snprintf+0xf0>
c0debb28:	f811 2c01 	ldrb.w	r2, [r1, #-1]
c0debb2c:	2a2a      	cmp	r2, #42	@ 0x2a
c0debb2e:	d13c      	bne.n	c0debbaa <snprintf+0x11e>
c0debb30:	780a      	ldrb	r2, [r1, #0]
c0debb32:	2a48      	cmp	r2, #72	@ 0x48
c0debb34:	d003      	beq.n	c0debb3e <snprintf+0xb2>
c0debb36:	2a73      	cmp	r2, #115	@ 0x73
c0debb38:	d001      	beq.n	c0debb3e <snprintf+0xb2>
c0debb3a:	2a68      	cmp	r2, #104	@ 0x68
c0debb3c:	d135      	bne.n	c0debbaa <snprintf+0x11e>
c0debb3e:	9a02      	ldr	r2, [sp, #8]
c0debb40:	2601      	movs	r6, #1
c0debb42:	e017      	b.n	c0debb74 <snprintf+0xe8>
c0debb44:	f083 0630 	eor.w	r6, r3, #48	@ 0x30
c0debb48:	ea56 060b 	orrs.w	r6, r6, fp
c0debb4c:	bf08      	it	eq
c0debb4e:	f04f 0e30 	moveq.w	lr, #48	@ 0x30
c0debb52:	eb0b 068b 	add.w	r6, fp, fp, lsl #2
c0debb56:	3901      	subs	r1, #1
c0debb58:	eb03 0346 	add.w	r3, r3, r6, lsl #1
c0debb5c:	4616      	mov	r6, r2
c0debb5e:	f1a3 0b30 	sub.w	fp, r3, #48	@ 0x30
c0debb62:	e7cf      	b.n	c0debb04 <snprintf+0x78>
c0debb64:	460b      	mov	r3, r1
c0debb66:	f813 2d01 	ldrb.w	r2, [r3, #-1]!
c0debb6a:	2a73      	cmp	r2, #115	@ 0x73
c0debb6c:	d11d      	bne.n	c0debbaa <snprintf+0x11e>
c0debb6e:	9a02      	ldr	r2, [sp, #8]
c0debb70:	2602      	movs	r6, #2
c0debb72:	4619      	mov	r1, r3
c0debb74:	1d13      	adds	r3, r2, #4
c0debb76:	9302      	str	r3, [sp, #8]
c0debb78:	6815      	ldr	r5, [r2, #0]
c0debb7a:	e7c3      	b.n	c0debb04 <snprintf+0x78>
c0debb7c:	2b48      	cmp	r3, #72	@ 0x48
c0debb7e:	d018      	beq.n	c0debbb2 <snprintf+0x126>
c0debb80:	2b58      	cmp	r3, #88	@ 0x58
c0debb82:	d019      	beq.n	c0debbb8 <snprintf+0x12c>
c0debb84:	2b63      	cmp	r3, #99	@ 0x63
c0debb86:	d020      	beq.n	c0debbca <snprintf+0x13e>
c0debb88:	2b64      	cmp	r3, #100	@ 0x64
c0debb8a:	d02a      	beq.n	c0debbe2 <snprintf+0x156>
c0debb8c:	2b68      	cmp	r3, #104	@ 0x68
c0debb8e:	d036      	beq.n	c0debbfe <snprintf+0x172>
c0debb90:	2b70      	cmp	r3, #112	@ 0x70
c0debb92:	d006      	beq.n	c0debba2 <snprintf+0x116>
c0debb94:	2b73      	cmp	r3, #115	@ 0x73
c0debb96:	d037      	beq.n	c0debc08 <snprintf+0x17c>
c0debb98:	2b75      	cmp	r3, #117	@ 0x75
c0debb9a:	f000 8081 	beq.w	c0debca0 <snprintf+0x214>
c0debb9e:	2b78      	cmp	r3, #120	@ 0x78
c0debba0:	d103      	bne.n	c0debbaa <snprintf+0x11e>
c0debba2:	9400      	str	r4, [sp, #0]
c0debba4:	f04f 0c00 	mov.w	ip, #0
c0debba8:	e009      	b.n	c0debbbe <snprintf+0x132>
c0debbaa:	1e4e      	subs	r6, r1, #1
c0debbac:	e785      	b.n	c0debaba <snprintf+0x2e>
c0debbae:	2025      	movs	r0, #37	@ 0x25
c0debbb0:	e00f      	b.n	c0debbd2 <snprintf+0x146>
c0debbb2:	487b      	ldr	r0, [pc, #492]	@ (c0debda0 <snprintf+0x314>)
c0debbb4:	4478      	add	r0, pc
c0debbb6:	e024      	b.n	c0debc02 <snprintf+0x176>
c0debbb8:	f04f 0c01 	mov.w	ip, #1
c0debbbc:	9400      	str	r4, [sp, #0]
c0debbbe:	9a02      	ldr	r2, [sp, #8]
c0debbc0:	2400      	movs	r4, #0
c0debbc2:	1d13      	adds	r3, r2, #4
c0debbc4:	9302      	str	r3, [sp, #8]
c0debbc6:	2310      	movs	r3, #16
c0debbc8:	e072      	b.n	c0debcb0 <snprintf+0x224>
c0debbca:	9802      	ldr	r0, [sp, #8]
c0debbcc:	1d02      	adds	r2, r0, #4
c0debbce:	9202      	str	r2, [sp, #8]
c0debbd0:	6800      	ldr	r0, [r0, #0]
c0debbd2:	1e4e      	subs	r6, r1, #1
c0debbd4:	f804 0b01 	strb.w	r0, [r4], #1
c0debbd8:	f1b8 0801 	subs.w	r8, r8, #1
c0debbdc:	f47f af6d 	bne.w	c0debaba <snprintf+0x2e>
c0debbe0:	e0d6      	b.n	c0debd90 <snprintf+0x304>
c0debbe2:	9a02      	ldr	r2, [sp, #8]
c0debbe4:	9400      	str	r4, [sp, #0]
c0debbe6:	1d13      	adds	r3, r2, #4
c0debbe8:	9302      	str	r3, [sp, #8]
c0debbea:	6813      	ldr	r3, [r2, #0]
c0debbec:	2b00      	cmp	r3, #0
c0debbee:	461a      	mov	r2, r3
c0debbf0:	d500      	bpl.n	c0debbf4 <snprintf+0x168>
c0debbf2:	425a      	negs	r2, r3
c0debbf4:	0fdc      	lsrs	r4, r3, #31
c0debbf6:	f04f 0c00 	mov.w	ip, #0
c0debbfa:	230a      	movs	r3, #10
c0debbfc:	e059      	b.n	c0debcb2 <snprintf+0x226>
c0debbfe:	4869      	ldr	r0, [pc, #420]	@ (c0debda4 <snprintf+0x318>)
c0debc00:	4478      	add	r0, pc
c0debc02:	f04f 0c01 	mov.w	ip, #1
c0debc06:	e003      	b.n	c0debc10 <snprintf+0x184>
c0debc08:	4864      	ldr	r0, [pc, #400]	@ (c0debd9c <snprintf+0x310>)
c0debc0a:	f04f 0c00 	mov.w	ip, #0
c0debc0e:	4478      	add	r0, pc
c0debc10:	9b02      	ldr	r3, [sp, #8]
c0debc12:	b2d2      	uxtb	r2, r2
c0debc14:	1d1e      	adds	r6, r3, #4
c0debc16:	9602      	str	r6, [sp, #8]
c0debc18:	1e4e      	subs	r6, r1, #1
c0debc1a:	6819      	ldr	r1, [r3, #0]
c0debc1c:	2a02      	cmp	r2, #2
c0debc1e:	f000 80a7 	beq.w	c0debd70 <snprintf+0x2e4>
c0debc22:	2a01      	cmp	r2, #1
c0debc24:	d007      	beq.n	c0debc36 <snprintf+0x1aa>
c0debc26:	463d      	mov	r5, r7
c0debc28:	b92a      	cbnz	r2, c0debc36 <snprintf+0x1aa>
c0debc2a:	2200      	movs	r2, #0
c0debc2c:	5c8b      	ldrb	r3, [r1, r2]
c0debc2e:	3201      	adds	r2, #1
c0debc30:	2b00      	cmp	r3, #0
c0debc32:	d1fb      	bne.n	c0debc2c <snprintf+0x1a0>
c0debc34:	1e55      	subs	r5, r2, #1
c0debc36:	f1bc 0f00 	cmp.w	ip, #0
c0debc3a:	d016      	beq.n	c0debc6a <snprintf+0x1de>
c0debc3c:	2d00      	cmp	r5, #0
c0debc3e:	f43f af3c 	beq.w	c0debaba <snprintf+0x2e>
c0debc42:	f1b8 0f02 	cmp.w	r8, #2
c0debc46:	f0c0 80a3 	bcc.w	c0debd90 <snprintf+0x304>
c0debc4a:	780a      	ldrb	r2, [r1, #0]
c0debc4c:	0913      	lsrs	r3, r2, #4
c0debc4e:	f002 020f 	and.w	r2, r2, #15
c0debc52:	5cc3      	ldrb	r3, [r0, r3]
c0debc54:	f1b8 0802 	subs.w	r8, r8, #2
c0debc58:	7023      	strb	r3, [r4, #0]
c0debc5a:	5c82      	ldrb	r2, [r0, r2]
c0debc5c:	7062      	strb	r2, [r4, #1]
c0debc5e:	f000 8097 	beq.w	c0debd90 <snprintf+0x304>
c0debc62:	3101      	adds	r1, #1
c0debc64:	3d01      	subs	r5, #1
c0debc66:	3402      	adds	r4, #2
c0debc68:	e7e8      	b.n	c0debc3c <snprintf+0x1b0>
c0debc6a:	4545      	cmp	r5, r8
c0debc6c:	bf28      	it	cs
c0debc6e:	4645      	movcs	r5, r8
c0debc70:	4620      	mov	r0, r4
c0debc72:	462a      	mov	r2, r5
c0debc74:	f000 fab6 	bl	c0dec1e4 <__aeabi_memmove>
c0debc78:	ebb8 0805 	subs.w	r8, r8, r5
c0debc7c:	f000 8088 	beq.w	c0debd90 <snprintf+0x304>
c0debc80:	462f      	mov	r7, r5
c0debc82:	442c      	add	r4, r5
c0debc84:	45bb      	cmp	fp, r7
c0debc86:	f67f af18 	bls.w	c0debaba <snprintf+0x2e>
c0debc8a:	ebab 0507 	sub.w	r5, fp, r7
c0debc8e:	4620      	mov	r0, r4
c0debc90:	4545      	cmp	r5, r8
c0debc92:	bf28      	it	cs
c0debc94:	4645      	movcs	r5, r8
c0debc96:	4629      	mov	r1, r5
c0debc98:	2220      	movs	r2, #32
c0debc9a:	f000 faa5 	bl	c0dec1e8 <__aeabi_memset>
c0debc9e:	e061      	b.n	c0debd64 <snprintf+0x2d8>
c0debca0:	9a02      	ldr	r2, [sp, #8]
c0debca2:	9400      	str	r4, [sp, #0]
c0debca4:	2400      	movs	r4, #0
c0debca6:	f04f 0c00 	mov.w	ip, #0
c0debcaa:	1d13      	adds	r3, r2, #4
c0debcac:	9302      	str	r3, [sp, #8]
c0debcae:	230a      	movs	r3, #10
c0debcb0:	6812      	ldr	r2, [r2, #0]
c0debcb2:	483d      	ldr	r0, [pc, #244]	@ (c0debda8 <snprintf+0x31c>)
c0debcb4:	1e4e      	subs	r6, r1, #1
c0debcb6:	f04f 0a01 	mov.w	sl, #1
c0debcba:	4478      	add	r0, pc
c0debcbc:	9001      	str	r0, [sp, #4]
c0debcbe:	fba3 570a 	umull	r5, r7, r3, sl
c0debcc2:	2f00      	cmp	r7, #0
c0debcc4:	bf18      	it	ne
c0debcc6:	2701      	movne	r7, #1
c0debcc8:	4295      	cmp	r5, r2
c0debcca:	d804      	bhi.n	c0debcd6 <snprintf+0x24a>
c0debccc:	b91f      	cbnz	r7, c0debcd6 <snprintf+0x24a>
c0debcce:	f1ab 0b01 	sub.w	fp, fp, #1
c0debcd2:	46aa      	mov	sl, r5
c0debcd4:	e7f3      	b.n	c0debcbe <snprintf+0x232>
c0debcd6:	2c00      	cmp	r4, #0
c0debcd8:	4627      	mov	r7, r4
c0debcda:	f04f 0500 	mov.w	r5, #0
c0debcde:	bf18      	it	ne
c0debce0:	f04f 37ff 	movne.w	r7, #4294967295	@ 0xffffffff
c0debce4:	d00d      	beq.n	c0debd02 <snprintf+0x276>
c0debce6:	4660      	mov	r0, ip
c0debce8:	fa5f fc8e 	uxtb.w	ip, lr
c0debcec:	a903      	add	r1, sp, #12
c0debcee:	f1bc 0f30 	cmp.w	ip, #48	@ 0x30
c0debcf2:	4684      	mov	ip, r0
c0debcf4:	d106      	bne.n	c0debd04 <snprintf+0x278>
c0debcf6:	202d      	movs	r0, #45	@ 0x2d
c0debcf8:	2400      	movs	r4, #0
c0debcfa:	2501      	movs	r5, #1
c0debcfc:	f88d 000c 	strb.w	r0, [sp, #12]
c0debd00:	e000      	b.n	c0debd04 <snprintf+0x278>
c0debd02:	a903      	add	r1, sp, #12
c0debd04:	eb07 000b 	add.w	r0, r7, fp
c0debd08:	3802      	subs	r0, #2
c0debd0a:	280d      	cmp	r0, #13
c0debd0c:	d808      	bhi.n	c0debd20 <snprintf+0x294>
c0debd0e:	f1c7 0701 	rsb	r7, r7, #1
c0debd12:	45bb      	cmp	fp, r7
c0debd14:	d004      	beq.n	c0debd20 <snprintf+0x294>
c0debd16:	f801 e005 	strb.w	lr, [r1, r5]
c0debd1a:	3701      	adds	r7, #1
c0debd1c:	3501      	adds	r5, #1
c0debd1e:	e7f8      	b.n	c0debd12 <snprintf+0x286>
c0debd20:	9f01      	ldr	r7, [sp, #4]
c0debd22:	b114      	cbz	r4, c0debd2a <snprintf+0x29e>
c0debd24:	202d      	movs	r0, #45	@ 0x2d
c0debd26:	5548      	strb	r0, [r1, r5]
c0debd28:	3501      	adds	r5, #1
c0debd2a:	4820      	ldr	r0, [pc, #128]	@ (c0debdac <snprintf+0x320>)
c0debd2c:	f1bc 0f00 	cmp.w	ip, #0
c0debd30:	4478      	add	r0, pc
c0debd32:	bf08      	it	eq
c0debd34:	4638      	moveq	r0, r7
c0debd36:	f1ba 0f00 	cmp.w	sl, #0
c0debd3a:	d00b      	beq.n	c0debd54 <snprintf+0x2c8>
c0debd3c:	fbb2 f7fa 	udiv	r7, r2, sl
c0debd40:	fbba faf3 	udiv	sl, sl, r3
c0debd44:	fbb7 f4f3 	udiv	r4, r7, r3
c0debd48:	fb04 7413 	mls	r4, r4, r3, r7
c0debd4c:	5d04      	ldrb	r4, [r0, r4]
c0debd4e:	554c      	strb	r4, [r1, r5]
c0debd50:	3501      	adds	r5, #1
c0debd52:	e7f0      	b.n	c0debd36 <snprintf+0x2aa>
c0debd54:	4545      	cmp	r5, r8
c0debd56:	bf28      	it	cs
c0debd58:	4645      	movcs	r5, r8
c0debd5a:	9c00      	ldr	r4, [sp, #0]
c0debd5c:	462a      	mov	r2, r5
c0debd5e:	4620      	mov	r0, r4
c0debd60:	f000 fa40 	bl	c0dec1e4 <__aeabi_memmove>
c0debd64:	ebb8 0805 	subs.w	r8, r8, r5
c0debd68:	442c      	add	r4, r5
c0debd6a:	f47f aea6 	bne.w	c0debaba <snprintf+0x2e>
c0debd6e:	e00f      	b.n	c0debd90 <snprintf+0x304>
c0debd70:	7808      	ldrb	r0, [r1, #0]
c0debd72:	2800      	cmp	r0, #0
c0debd74:	f47f aea1 	bne.w	c0debaba <snprintf+0x2e>
c0debd78:	4545      	cmp	r5, r8
c0debd7a:	bf28      	it	cs
c0debd7c:	4645      	movcs	r5, r8
c0debd7e:	4620      	mov	r0, r4
c0debd80:	4629      	mov	r1, r5
c0debd82:	2220      	movs	r2, #32
c0debd84:	f000 fa30 	bl	c0dec1e8 <__aeabi_memset>
c0debd88:	ebb8 0805 	subs.w	r8, r8, r5
c0debd8c:	f47f af79 	bne.w	c0debc82 <snprintf+0x1f6>
c0debd90:	2000      	movs	r0, #0
c0debd92:	b007      	add	sp, #28
c0debd94:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0debd98:	b001      	add	sp, #4
c0debd9a:	4770      	bx	lr
c0debd9c:	00003c2e 	.word	0x00003c2e
c0debda0:	00003c98 	.word	0x00003c98
c0debda4:	00003c3c 	.word	0x00003c3c
c0debda8:	00003b82 	.word	0x00003b82
c0debdac:	00003b1c 	.word	0x00003b1c

c0debdb0 <pic>:
c0debdb0:	4a0a      	ldr	r2, [pc, #40]	@ (c0debddc <pic+0x2c>)
c0debdb2:	4282      	cmp	r2, r0
c0debdb4:	490a      	ldr	r1, [pc, #40]	@ (c0debde0 <pic+0x30>)
c0debdb6:	d806      	bhi.n	c0debdc6 <pic+0x16>
c0debdb8:	4281      	cmp	r1, r0
c0debdba:	d304      	bcc.n	c0debdc6 <pic+0x16>
c0debdbc:	b580      	push	{r7, lr}
c0debdbe:	f000 f815 	bl	c0debdec <pic_internal>
c0debdc2:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0debdc6:	4907      	ldr	r1, [pc, #28]	@ (c0debde4 <pic+0x34>)
c0debdc8:	4288      	cmp	r0, r1
c0debdca:	4a07      	ldr	r2, [pc, #28]	@ (c0debde8 <pic+0x38>)
c0debdcc:	d304      	bcc.n	c0debdd8 <pic+0x28>
c0debdce:	4290      	cmp	r0, r2
c0debdd0:	d802      	bhi.n	c0debdd8 <pic+0x28>
c0debdd2:	1a40      	subs	r0, r0, r1
c0debdd4:	4649      	mov	r1, r9
c0debdd6:	4408      	add	r0, r1
c0debdd8:	4770      	bx	lr
c0debdda:	0000      	movs	r0, r0
c0debddc:	c0de0000 	.word	0xc0de0000
c0debde0:	c0defd68 	.word	0xc0defd68
c0debde4:	da7a0000 	.word	0xda7a0000
c0debde8:	da7a9000 	.word	0xda7a9000

c0debdec <pic_internal>:
c0debdec:	467a      	mov	r2, pc
c0debdee:	4902      	ldr	r1, [pc, #8]	@ (c0debdf8 <pic_internal+0xc>)
c0debdf0:	1cc9      	adds	r1, r1, #3
c0debdf2:	1a89      	subs	r1, r1, r2
c0debdf4:	1a40      	subs	r0, r0, r1
c0debdf6:	4770      	bx	lr
c0debdf8:	c0debded 	.word	0xc0debded

c0debdfc <SVC_Call>:
c0debdfc:	df01      	svc	1
c0debdfe:	2900      	cmp	r1, #0
c0debe00:	d100      	bne.n	c0debe04 <exception>
c0debe02:	4770      	bx	lr

c0debe04 <exception>:
c0debe04:	4608      	mov	r0, r1
c0debe06:	f7ff fe3a 	bl	c0deba7e <os_longjmp>
	...

c0debe0c <SVC_cx_call>:
c0debe0c:	df01      	svc	1
c0debe0e:	4770      	bx	lr

c0debe10 <nbgl_wait_pipeline>:
c0debe10:	b5e0      	push	{r5, r6, r7, lr}
c0debe12:	2000      	movs	r0, #0
c0debe14:	9001      	str	r0, [sp, #4]
c0debe16:	4802      	ldr	r0, [pc, #8]	@ (c0debe20 <nbgl_wait_pipeline+0x10>)
c0debe18:	a901      	add	r1, sp, #4
c0debe1a:	f7ff ffef 	bl	c0debdfc <SVC_Call>
c0debe1e:	bd8c      	pop	{r2, r3, r7, pc}
c0debe20:	00fa0011 	.word	0x00fa0011

c0debe24 <nvm_write>:
c0debe24:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0debe26:	ab01      	add	r3, sp, #4
c0debe28:	c307      	stmia	r3!, {r0, r1, r2}
c0debe2a:	4802      	ldr	r0, [pc, #8]	@ (c0debe34 <nvm_write+0x10>)
c0debe2c:	a901      	add	r1, sp, #4
c0debe2e:	f7ff ffe5 	bl	c0debdfc <SVC_Call>
c0debe32:	bd8f      	pop	{r0, r1, r2, r3, r7, pc}
c0debe34:	03000003 	.word	0x03000003

c0debe38 <cx_ecdomain_parameters_length>:
c0debe38:	b5e0      	push	{r5, r6, r7, lr}
c0debe3a:	e9cd 0100 	strd	r0, r1, [sp]
c0debe3e:	4802      	ldr	r0, [pc, #8]	@ (c0debe48 <cx_ecdomain_parameters_length+0x10>)
c0debe40:	4669      	mov	r1, sp
c0debe42:	f7ff ffe3 	bl	c0debe0c <SVC_cx_call>
c0debe46:	bd8c      	pop	{r2, r3, r7, pc}
c0debe48:	0200012f 	.word	0x0200012f

c0debe4c <os_perso_derive_node_with_seed_key>:
c0debe4c:	b510      	push	{r4, lr}
c0debe4e:	b088      	sub	sp, #32
c0debe50:	9c0d      	ldr	r4, [sp, #52]	@ 0x34
c0debe52:	9407      	str	r4, [sp, #28]
c0debe54:	9c0c      	ldr	r4, [sp, #48]	@ 0x30
c0debe56:	9406      	str	r4, [sp, #24]
c0debe58:	9c0b      	ldr	r4, [sp, #44]	@ 0x2c
c0debe5a:	9405      	str	r4, [sp, #20]
c0debe5c:	9c0a      	ldr	r4, [sp, #40]	@ 0x28
c0debe5e:	e88d 001f 	stmia.w	sp, {r0, r1, r2, r3, r4}
c0debe62:	4803      	ldr	r0, [pc, #12]	@ (c0debe70 <os_perso_derive_node_with_seed_key+0x24>)
c0debe64:	4669      	mov	r1, sp
c0debe66:	f7ff ffc9 	bl	c0debdfc <SVC_Call>
c0debe6a:	b008      	add	sp, #32
c0debe6c:	bd10      	pop	{r4, pc}
c0debe6e:	bf00      	nop
c0debe70:	080000a6 	.word	0x080000a6

c0debe74 <os_pki_load_certificate>:
c0debe74:	b510      	push	{r4, lr}
c0debe76:	b086      	sub	sp, #24
c0debe78:	9c09      	ldr	r4, [sp, #36]	@ 0x24
c0debe7a:	9405      	str	r4, [sp, #20]
c0debe7c:	9c08      	ldr	r4, [sp, #32]
c0debe7e:	e88d 001f 	stmia.w	sp, {r0, r1, r2, r3, r4}
c0debe82:	4803      	ldr	r0, [pc, #12]	@ (c0debe90 <os_pki_load_certificate+0x1c>)
c0debe84:	4669      	mov	r1, sp
c0debe86:	f7ff ffb9 	bl	c0debdfc <SVC_Call>
c0debe8a:	b006      	add	sp, #24
c0debe8c:	bd10      	pop	{r4, pc}
c0debe8e:	bf00      	nop
c0debe90:	060000aa 	.word	0x060000aa

c0debe94 <os_perso_is_pin_set>:
c0debe94:	b5e0      	push	{r5, r6, r7, lr}
c0debe96:	2000      	movs	r0, #0
c0debe98:	4669      	mov	r1, sp
c0debe9a:	9001      	str	r0, [sp, #4]
c0debe9c:	209e      	movs	r0, #158	@ 0x9e
c0debe9e:	f7ff ffad 	bl	c0debdfc <SVC_Call>
c0debea2:	b2c0      	uxtb	r0, r0
c0debea4:	bd8c      	pop	{r2, r3, r7, pc}

c0debea6 <os_global_pin_is_validated>:
c0debea6:	b5e0      	push	{r5, r6, r7, lr}
c0debea8:	2000      	movs	r0, #0
c0debeaa:	4669      	mov	r1, sp
c0debeac:	9001      	str	r0, [sp, #4]
c0debeae:	20a0      	movs	r0, #160	@ 0xa0
c0debeb0:	f7ff ffa4 	bl	c0debdfc <SVC_Call>
c0debeb4:	b2c0      	uxtb	r0, r0
c0debeb6:	bd8c      	pop	{r2, r3, r7, pc}

c0debeb8 <os_ux>:
c0debeb8:	b5e0      	push	{r5, r6, r7, lr}
c0debeba:	f000 f885 	bl	c0debfc8 <OUTLINED_FUNCTION_0>
c0debebe:	4802      	ldr	r0, [pc, #8]	@ (c0debec8 <os_ux+0x10>)
c0debec0:	4669      	mov	r1, sp
c0debec2:	f7ff ff9b 	bl	c0debdfc <SVC_Call>
c0debec6:	bd8c      	pop	{r2, r3, r7, pc}
c0debec8:	01000064 	.word	0x01000064

c0debecc <os_flags>:
c0debecc:	b5e0      	push	{r5, r6, r7, lr}
c0debece:	2000      	movs	r0, #0
c0debed0:	4669      	mov	r1, sp
c0debed2:	9001      	str	r0, [sp, #4]
c0debed4:	206a      	movs	r0, #106	@ 0x6a
c0debed6:	f7ff ff91 	bl	c0debdfc <SVC_Call>
c0debeda:	bd8c      	pop	{r2, r3, r7, pc}

c0debedc <os_setting_get>:
c0debedc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0debede:	ab01      	add	r3, sp, #4
c0debee0:	c307      	stmia	r3!, {r0, r1, r2}
c0debee2:	4803      	ldr	r0, [pc, #12]	@ (c0debef0 <os_setting_get+0x14>)
c0debee4:	a901      	add	r1, sp, #4
c0debee6:	f7ff ff89 	bl	c0debdfc <SVC_Call>
c0debeea:	b004      	add	sp, #16
c0debeec:	bd80      	pop	{r7, pc}
c0debeee:	bf00      	nop
c0debef0:	03000070 	.word	0x03000070

c0debef4 <os_registry_get_current_app_tag>:
c0debef4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0debef6:	ab01      	add	r3, sp, #4
c0debef8:	c307      	stmia	r3!, {r0, r1, r2}
c0debefa:	4803      	ldr	r0, [pc, #12]	@ (c0debf08 <os_registry_get_current_app_tag+0x14>)
c0debefc:	a901      	add	r1, sp, #4
c0debefe:	f7ff ff7d 	bl	c0debdfc <SVC_Call>
c0debf02:	b004      	add	sp, #16
c0debf04:	bd80      	pop	{r7, pc}
c0debf06:	bf00      	nop
c0debf08:	03000074 	.word	0x03000074

c0debf0c <os_sched_exit>:
c0debf0c:	b082      	sub	sp, #8
c0debf0e:	f000 f85b 	bl	c0debfc8 <OUTLINED_FUNCTION_0>
c0debf12:	4802      	ldr	r0, [pc, #8]	@ (c0debf1c <os_sched_exit+0x10>)
c0debf14:	4669      	mov	r1, sp
c0debf16:	f7ff ff71 	bl	c0debdfc <SVC_Call>
c0debf1a:	deff      	udf	#255	@ 0xff
c0debf1c:	0100009a 	.word	0x0100009a

c0debf20 <os_io_init>:
c0debf20:	b5e0      	push	{r5, r6, r7, lr}
c0debf22:	9001      	str	r0, [sp, #4]
c0debf24:	4802      	ldr	r0, [pc, #8]	@ (c0debf30 <os_io_init+0x10>)
c0debf26:	a901      	add	r1, sp, #4
c0debf28:	f7ff ff68 	bl	c0debdfc <SVC_Call>
c0debf2c:	bd8c      	pop	{r2, r3, r7, pc}
c0debf2e:	bf00      	nop
c0debf30:	01000084 	.word	0x01000084

c0debf34 <os_io_start>:
c0debf34:	b5e0      	push	{r5, r6, r7, lr}
c0debf36:	2000      	movs	r0, #0
c0debf38:	4669      	mov	r1, sp
c0debf3a:	9001      	str	r0, [sp, #4]
c0debf3c:	4801      	ldr	r0, [pc, #4]	@ (c0debf44 <os_io_start+0x10>)
c0debf3e:	f7ff ff5d 	bl	c0debdfc <SVC_Call>
c0debf42:	bd8c      	pop	{r2, r3, r7, pc}
c0debf44:	01000085 	.word	0x01000085

c0debf48 <os_io_tx_cmd>:
c0debf48:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0debf4a:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0debf4e:	4803      	ldr	r0, [pc, #12]	@ (c0debf5c <os_io_tx_cmd+0x14>)
c0debf50:	4669      	mov	r1, sp
c0debf52:	f7ff ff53 	bl	c0debdfc <SVC_Call>
c0debf56:	b004      	add	sp, #16
c0debf58:	bd80      	pop	{r7, pc}
c0debf5a:	bf00      	nop
c0debf5c:	04000088 	.word	0x04000088

c0debf60 <os_io_rx_evt>:
c0debf60:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0debf62:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0debf66:	4803      	ldr	r0, [pc, #12]	@ (c0debf74 <os_io_rx_evt+0x14>)
c0debf68:	4669      	mov	r1, sp
c0debf6a:	f7ff ff47 	bl	c0debdfc <SVC_Call>
c0debf6e:	b004      	add	sp, #16
c0debf70:	bd80      	pop	{r7, pc}
c0debf72:	bf00      	nop
c0debf74:	03000089 	.word	0x03000089

c0debf78 <try_context_get>:
c0debf78:	b5e0      	push	{r5, r6, r7, lr}
c0debf7a:	2000      	movs	r0, #0
c0debf7c:	4669      	mov	r1, sp
c0debf7e:	9001      	str	r0, [sp, #4]
c0debf80:	2087      	movs	r0, #135	@ 0x87
c0debf82:	f7ff ff3b 	bl	c0debdfc <SVC_Call>
c0debf86:	bd8c      	pop	{r2, r3, r7, pc}

c0debf88 <try_context_set>:
c0debf88:	b5e0      	push	{r5, r6, r7, lr}
c0debf8a:	f000 f81d 	bl	c0debfc8 <OUTLINED_FUNCTION_0>
c0debf8e:	4802      	ldr	r0, [pc, #8]	@ (c0debf98 <try_context_set+0x10>)
c0debf90:	4669      	mov	r1, sp
c0debf92:	f7ff ff33 	bl	c0debdfc <SVC_Call>
c0debf96:	bd8c      	pop	{r2, r3, r7, pc}
c0debf98:	0100010b 	.word	0x0100010b

c0debf9c <os_sched_last_status>:
c0debf9c:	b5e0      	push	{r5, r6, r7, lr}
c0debf9e:	f000 f813 	bl	c0debfc8 <OUTLINED_FUNCTION_0>
c0debfa2:	4803      	ldr	r0, [pc, #12]	@ (c0debfb0 <os_sched_last_status+0x14>)
c0debfa4:	4669      	mov	r1, sp
c0debfa6:	f7ff ff29 	bl	c0debdfc <SVC_Call>
c0debfaa:	b2c0      	uxtb	r0, r0
c0debfac:	bd8c      	pop	{r2, r3, r7, pc}
c0debfae:	bf00      	nop
c0debfb0:	0100009c 	.word	0x0100009c

c0debfb4 <touch_get_last_info>:
c0debfb4:	b5e0      	push	{r5, r6, r7, lr}
c0debfb6:	9001      	str	r0, [sp, #4]
c0debfb8:	4802      	ldr	r0, [pc, #8]	@ (c0debfc4 <touch_get_last_info+0x10>)
c0debfba:	a901      	add	r1, sp, #4
c0debfbc:	f7ff ff1e 	bl	c0debdfc <SVC_Call>
c0debfc0:	bd8c      	pop	{r2, r3, r7, pc}
c0debfc2:	bf00      	nop
c0debfc4:	01fa000b 	.word	0x01fa000b

c0debfc8 <OUTLINED_FUNCTION_0>:
c0debfc8:	2100      	movs	r1, #0
c0debfca:	e9cd 0100 	strd	r0, r1, [sp]
c0debfce:	4770      	bx	lr

c0debfd0 <__aeabi_llsl>:
c0debfd0:	0693      	lsls	r3, r2, #26
c0debfd2:	d408      	bmi.n	c0debfe6 <__aeabi_llsl+0x16>
c0debfd4:	b132      	cbz	r2, c0debfe4 <__aeabi_llsl+0x14>
c0debfd6:	f1c2 0320 	rsb	r3, r2, #32
c0debfda:	4091      	lsls	r1, r2
c0debfdc:	fa20 f303 	lsr.w	r3, r0, r3
c0debfe0:	4090      	lsls	r0, r2
c0debfe2:	4319      	orrs	r1, r3
c0debfe4:	4770      	bx	lr
c0debfe6:	f1a2 0120 	sub.w	r1, r2, #32
c0debfea:	fa00 f101 	lsl.w	r1, r0, r1
c0debfee:	2000      	movs	r0, #0
c0debff0:	4770      	bx	lr
	...

c0debff4 <__aeabi_llsr>:
c0debff4:	0693      	lsls	r3, r2, #26
c0debff6:	d408      	bmi.n	c0dec00a <__aeabi_llsr+0x16>
c0debff8:	b132      	cbz	r2, c0dec008 <__aeabi_llsr+0x14>
c0debffa:	f1c2 0320 	rsb	r3, r2, #32
c0debffe:	40d0      	lsrs	r0, r2
c0dec000:	fa01 f303 	lsl.w	r3, r1, r3
c0dec004:	40d1      	lsrs	r1, r2
c0dec006:	4318      	orrs	r0, r3
c0dec008:	4770      	bx	lr
c0dec00a:	f1a2 0020 	sub.w	r0, r2, #32
c0dec00e:	fa21 f000 	lsr.w	r0, r1, r0
c0dec012:	2100      	movs	r1, #0
c0dec014:	4770      	bx	lr
	...

c0dec018 <__udivmoddi4>:
c0dec018:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dec01c:	f8dd c020 	ldr.w	ip, [sp, #32]
c0dec020:	4604      	mov	r4, r0
c0dec022:	b179      	cbz	r1, c0dec044 <__udivmoddi4+0x2c>
c0dec024:	b1ba      	cbz	r2, c0dec056 <__udivmoddi4+0x3e>
c0dec026:	b35b      	cbz	r3, c0dec080 <__udivmoddi4+0x68>
c0dec028:	fab1 f581 	clz	r5, r1
c0dec02c:	fab3 f683 	clz	r6, r3
c0dec030:	1b75      	subs	r5, r6, r5
c0dec032:	2d20      	cmp	r5, #32
c0dec034:	d34a      	bcc.n	c0dec0cc <__udivmoddi4+0xb4>
c0dec036:	f1bc 0f00 	cmp.w	ip, #0
c0dec03a:	bf18      	it	ne
c0dec03c:	e9cc 4100 	strdne	r4, r1, [ip]
c0dec040:	2400      	movs	r4, #0
c0dec042:	e066      	b.n	c0dec112 <__udivmoddi4+0xfa>
c0dec044:	b3cb      	cbz	r3, c0dec0ba <__udivmoddi4+0xa2>
c0dec046:	2100      	movs	r1, #0
c0dec048:	f1bc 0f00 	cmp.w	ip, #0
c0dec04c:	bf18      	it	ne
c0dec04e:	e9cc 4100 	strdne	r4, r1, [ip]
c0dec052:	2400      	movs	r4, #0
c0dec054:	e0a6      	b.n	c0dec1a4 <__udivmoddi4+0x18c>
c0dec056:	2b00      	cmp	r3, #0
c0dec058:	d03e      	beq.n	c0dec0d8 <__udivmoddi4+0xc0>
c0dec05a:	2800      	cmp	r0, #0
c0dec05c:	d04f      	beq.n	c0dec0fe <__udivmoddi4+0xe6>
c0dec05e:	1e5d      	subs	r5, r3, #1
c0dec060:	422b      	tst	r3, r5
c0dec062:	d158      	bne.n	c0dec116 <__udivmoddi4+0xfe>
c0dec064:	f1bc 0f00 	cmp.w	ip, #0
c0dec068:	bf1c      	itt	ne
c0dec06a:	ea05 0001 	andne.w	r0, r5, r1
c0dec06e:	e9cc 4000 	strdne	r4, r0, [ip]
c0dec072:	fa93 f0a3 	rbit	r0, r3
c0dec076:	fab0 f080 	clz	r0, r0
c0dec07a:	fa21 f400 	lsr.w	r4, r1, r0
c0dec07e:	e048      	b.n	c0dec112 <__udivmoddi4+0xfa>
c0dec080:	1e55      	subs	r5, r2, #1
c0dec082:	422a      	tst	r2, r5
c0dec084:	d129      	bne.n	c0dec0da <__udivmoddi4+0xc2>
c0dec086:	f1bc 0f00 	cmp.w	ip, #0
c0dec08a:	bf1e      	ittt	ne
c0dec08c:	2300      	movne	r3, #0
c0dec08e:	4005      	andne	r5, r0
c0dec090:	e9cc 5300 	strdne	r5, r3, [ip]
c0dec094:	2a01      	cmp	r2, #1
c0dec096:	f000 8085 	beq.w	c0dec1a4 <__udivmoddi4+0x18c>
c0dec09a:	fa92 f2a2 	rbit	r2, r2
c0dec09e:	004c      	lsls	r4, r1, #1
c0dec0a0:	fab2 f282 	clz	r2, r2
c0dec0a4:	f002 031f 	and.w	r3, r2, #31
c0dec0a8:	40d1      	lsrs	r1, r2
c0dec0aa:	40d8      	lsrs	r0, r3
c0dec0ac:	231f      	movs	r3, #31
c0dec0ae:	4393      	bics	r3, r2
c0dec0b0:	fa04 f303 	lsl.w	r3, r4, r3
c0dec0b4:	ea43 0400 	orr.w	r4, r3, r0
c0dec0b8:	e074      	b.n	c0dec1a4 <__udivmoddi4+0x18c>
c0dec0ba:	fbb0 f4f2 	udiv	r4, r0, r2
c0dec0be:	f1bc 0f00 	cmp.w	ip, #0
c0dec0c2:	d026      	beq.n	c0dec112 <__udivmoddi4+0xfa>
c0dec0c4:	fb04 0012 	mls	r0, r4, r2, r0
c0dec0c8:	2100      	movs	r1, #0
c0dec0ca:	e020      	b.n	c0dec10e <__udivmoddi4+0xf6>
c0dec0cc:	f105 0e01 	add.w	lr, r5, #1
c0dec0d0:	f1be 0f20 	cmp.w	lr, #32
c0dec0d4:	d00b      	beq.n	c0dec0ee <__udivmoddi4+0xd6>
c0dec0d6:	e028      	b.n	c0dec12a <__udivmoddi4+0x112>
c0dec0d8:	e064      	b.n	c0dec1a4 <__udivmoddi4+0x18c>
c0dec0da:	fab1 f481 	clz	r4, r1
c0dec0de:	fab2 f582 	clz	r5, r2
c0dec0e2:	1b2c      	subs	r4, r5, r4
c0dec0e4:	f104 0e21 	add.w	lr, r4, #33	@ 0x21
c0dec0e8:	f1be 0f20 	cmp.w	lr, #32
c0dec0ec:	d15d      	bne.n	c0dec1aa <__udivmoddi4+0x192>
c0dec0ee:	f04f 0e20 	mov.w	lr, #32
c0dec0f2:	f04f 0a00 	mov.w	sl, #0
c0dec0f6:	f04f 0b00 	mov.w	fp, #0
c0dec0fa:	460e      	mov	r6, r1
c0dec0fc:	e021      	b.n	c0dec142 <__udivmoddi4+0x12a>
c0dec0fe:	fbb1 f4f3 	udiv	r4, r1, r3
c0dec102:	f1bc 0f00 	cmp.w	ip, #0
c0dec106:	d004      	beq.n	c0dec112 <__udivmoddi4+0xfa>
c0dec108:	2000      	movs	r0, #0
c0dec10a:	fb04 1113 	mls	r1, r4, r3, r1
c0dec10e:	e9cc 0100 	strd	r0, r1, [ip]
c0dec112:	2100      	movs	r1, #0
c0dec114:	e046      	b.n	c0dec1a4 <__udivmoddi4+0x18c>
c0dec116:	fab1 f581 	clz	r5, r1
c0dec11a:	fab3 f683 	clz	r6, r3
c0dec11e:	1b75      	subs	r5, r6, r5
c0dec120:	2d1f      	cmp	r5, #31
c0dec122:	f4bf af88 	bcs.w	c0dec036 <__udivmoddi4+0x1e>
c0dec126:	f105 0e01 	add.w	lr, r5, #1
c0dec12a:	fa20 f40e 	lsr.w	r4, r0, lr
c0dec12e:	f1c5 051f 	rsb	r5, r5, #31
c0dec132:	fa01 f605 	lsl.w	r6, r1, r5
c0dec136:	fa21 fb0e 	lsr.w	fp, r1, lr
c0dec13a:	40a8      	lsls	r0, r5
c0dec13c:	f04f 0a00 	mov.w	sl, #0
c0dec140:	4326      	orrs	r6, r4
c0dec142:	f04f 0800 	mov.w	r8, #0
c0dec146:	f1be 0f00 	cmp.w	lr, #0
c0dec14a:	d01c      	beq.n	c0dec186 <__udivmoddi4+0x16e>
c0dec14c:	ea4f 014b 	mov.w	r1, fp, lsl #1
c0dec150:	f1ae 0e01 	sub.w	lr, lr, #1
c0dec154:	ea41 71d6 	orr.w	r1, r1, r6, lsr #31
c0dec158:	0076      	lsls	r6, r6, #1
c0dec15a:	ea46 75d0 	orr.w	r5, r6, r0, lsr #31
c0dec15e:	1aae      	subs	r6, r5, r2
c0dec160:	eb61 0b03 	sbc.w	fp, r1, r3
c0dec164:	43cf      	mvns	r7, r1
c0dec166:	43ec      	mvns	r4, r5
c0dec168:	18a4      	adds	r4, r4, r2
c0dec16a:	eb57 0403 	adcs.w	r4, r7, r3
c0dec16e:	bf5c      	itt	pl
c0dec170:	468b      	movpl	fp, r1
c0dec172:	462e      	movpl	r6, r5
c0dec174:	0040      	lsls	r0, r0, #1
c0dec176:	0fe1      	lsrs	r1, r4, #31
c0dec178:	ea48 044a 	orr.w	r4, r8, sl, lsl #1
c0dec17c:	ea40 70da 	orr.w	r0, r0, sl, lsr #31
c0dec180:	46a2      	mov	sl, r4
c0dec182:	4688      	mov	r8, r1
c0dec184:	e7df      	b.n	c0dec146 <__udivmoddi4+0x12e>
c0dec186:	ea4f 71da 	mov.w	r1, sl, lsr #31
c0dec18a:	f1bc 0f00 	cmp.w	ip, #0
c0dec18e:	bf18      	it	ne
c0dec190:	e9cc 6b00 	strdne	r6, fp, [ip]
c0dec194:	ea41 0140 	orr.w	r1, r1, r0, lsl #1
c0dec198:	ea4f 004a 	mov.w	r0, sl, lsl #1
c0dec19c:	f020 0001 	bic.w	r0, r0, #1
c0dec1a0:	ea40 0408 	orr.w	r4, r0, r8
c0dec1a4:	4620      	mov	r0, r4
c0dec1a6:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0dec1aa:	f1be 0f1f 	cmp.w	lr, #31
c0dec1ae:	d804      	bhi.n	c0dec1ba <__udivmoddi4+0x1a2>
c0dec1b0:	fa20 f40e 	lsr.w	r4, r0, lr
c0dec1b4:	f1ce 0520 	rsb	r5, lr, #32
c0dec1b8:	e7bb      	b.n	c0dec132 <__udivmoddi4+0x11a>
c0dec1ba:	f1ce 0740 	rsb	r7, lr, #64	@ 0x40
c0dec1be:	f1ae 0420 	sub.w	r4, lr, #32
c0dec1c2:	f04f 0b00 	mov.w	fp, #0
c0dec1c6:	fa20 f504 	lsr.w	r5, r0, r4
c0dec1ca:	fa01 f607 	lsl.w	r6, r1, r7
c0dec1ce:	fa00 fa07 	lsl.w	sl, r0, r7
c0dec1d2:	ea46 0805 	orr.w	r8, r6, r5
c0dec1d6:	fa21 f604 	lsr.w	r6, r1, r4
c0dec1da:	4640      	mov	r0, r8
c0dec1dc:	e7b1      	b.n	c0dec142 <__udivmoddi4+0x12a>
	...

c0dec1e0 <__aeabi_memcpy>:
c0dec1e0:	f000 b81c 	b.w	c0dec21c <memcpy>

c0dec1e4 <__aeabi_memmove>:
c0dec1e4:	f000 b828 	b.w	c0dec238 <memmove>

c0dec1e8 <__aeabi_memset>:
c0dec1e8:	460b      	mov	r3, r1
c0dec1ea:	4611      	mov	r1, r2
c0dec1ec:	461a      	mov	r2, r3
c0dec1ee:	f000 b83d 	b.w	c0dec26c <memset>
c0dec1f2:	bf00      	nop

c0dec1f4 <__aeabi_memclr>:
c0dec1f4:	460a      	mov	r2, r1
c0dec1f6:	2100      	movs	r1, #0
c0dec1f8:	f000 b838 	b.w	c0dec26c <memset>

c0dec1fc <__aeabi_uldivmod>:
c0dec1fc:	b540      	push	{r6, lr}
c0dec1fe:	b084      	sub	sp, #16
c0dec200:	ae02      	add	r6, sp, #8
c0dec202:	9600      	str	r6, [sp, #0]
c0dec204:	f7ff ff08 	bl	c0dec018 <__udivmoddi4>
c0dec208:	9a02      	ldr	r2, [sp, #8]
c0dec20a:	9b03      	ldr	r3, [sp, #12]
c0dec20c:	b004      	add	sp, #16
c0dec20e:	bd40      	pop	{r6, pc}

c0dec210 <explicit_bzero>:
c0dec210:	f000 b800 	b.w	c0dec214 <bzero>

c0dec214 <bzero>:
c0dec214:	460a      	mov	r2, r1
c0dec216:	2100      	movs	r1, #0
c0dec218:	f000 b828 	b.w	c0dec26c <memset>

c0dec21c <memcpy>:
c0dec21c:	440a      	add	r2, r1
c0dec21e:	4291      	cmp	r1, r2
c0dec220:	f100 33ff 	add.w	r3, r0, #4294967295	@ 0xffffffff
c0dec224:	d100      	bne.n	c0dec228 <memcpy+0xc>
c0dec226:	4770      	bx	lr
c0dec228:	b510      	push	{r4, lr}
c0dec22a:	f811 4b01 	ldrb.w	r4, [r1], #1
c0dec22e:	4291      	cmp	r1, r2
c0dec230:	f803 4f01 	strb.w	r4, [r3, #1]!
c0dec234:	d1f9      	bne.n	c0dec22a <memcpy+0xe>
c0dec236:	bd10      	pop	{r4, pc}

c0dec238 <memmove>:
c0dec238:	4288      	cmp	r0, r1
c0dec23a:	b510      	push	{r4, lr}
c0dec23c:	eb01 0402 	add.w	r4, r1, r2
c0dec240:	d902      	bls.n	c0dec248 <memmove+0x10>
c0dec242:	4284      	cmp	r4, r0
c0dec244:	4623      	mov	r3, r4
c0dec246:	d807      	bhi.n	c0dec258 <memmove+0x20>
c0dec248:	1e43      	subs	r3, r0, #1
c0dec24a:	42a1      	cmp	r1, r4
c0dec24c:	d008      	beq.n	c0dec260 <memmove+0x28>
c0dec24e:	f811 2b01 	ldrb.w	r2, [r1], #1
c0dec252:	f803 2f01 	strb.w	r2, [r3, #1]!
c0dec256:	e7f8      	b.n	c0dec24a <memmove+0x12>
c0dec258:	4601      	mov	r1, r0
c0dec25a:	4402      	add	r2, r0
c0dec25c:	428a      	cmp	r2, r1
c0dec25e:	d100      	bne.n	c0dec262 <memmove+0x2a>
c0dec260:	bd10      	pop	{r4, pc}
c0dec262:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
c0dec266:	f802 4d01 	strb.w	r4, [r2, #-1]!
c0dec26a:	e7f7      	b.n	c0dec25c <memmove+0x24>

c0dec26c <memset>:
c0dec26c:	4603      	mov	r3, r0
c0dec26e:	4402      	add	r2, r0
c0dec270:	4293      	cmp	r3, r2
c0dec272:	d100      	bne.n	c0dec276 <memset+0xa>
c0dec274:	4770      	bx	lr
c0dec276:	f803 1b01 	strb.w	r1, [r3], #1
c0dec27a:	e7f9      	b.n	c0dec270 <memset+0x4>

c0dec27c <setjmp>:
c0dec27c:	46ec      	mov	ip, sp
c0dec27e:	e8a0 5ff0 	stmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
c0dec282:	f04f 0000 	mov.w	r0, #0
c0dec286:	4770      	bx	lr

c0dec288 <longjmp>:
c0dec288:	e8b0 5ff0 	ldmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
c0dec28c:	46e5      	mov	sp, ip
c0dec28e:	0008      	movs	r0, r1
c0dec290:	bf08      	it	eq
c0dec292:	2001      	moveq	r0, #1
c0dec294:	4770      	bx	lr
c0dec296:	bf00      	nop

c0dec298 <strcmp>:
c0dec298:	f810 2b01 	ldrb.w	r2, [r0], #1
c0dec29c:	f811 3b01 	ldrb.w	r3, [r1], #1
c0dec2a0:	2a01      	cmp	r2, #1
c0dec2a2:	bf28      	it	cs
c0dec2a4:	429a      	cmpcs	r2, r3
c0dec2a6:	d0f7      	beq.n	c0dec298 <strcmp>
c0dec2a8:	1ad0      	subs	r0, r2, r3
c0dec2aa:	4770      	bx	lr

c0dec2ac <strlen>:
c0dec2ac:	4603      	mov	r3, r0
c0dec2ae:	f813 2b01 	ldrb.w	r2, [r3], #1
c0dec2b2:	2a00      	cmp	r2, #0
c0dec2b4:	d1fb      	bne.n	c0dec2ae <strlen+0x2>
c0dec2b6:	1a18      	subs	r0, r3, r0
c0dec2b8:	3801      	subs	r0, #1
c0dec2ba:	4770      	bx	lr

c0dec2bc <strncpy>:
c0dec2bc:	4603      	mov	r3, r0
c0dec2be:	b510      	push	{r4, lr}
c0dec2c0:	3901      	subs	r1, #1
c0dec2c2:	b132      	cbz	r2, c0dec2d2 <strncpy+0x16>
c0dec2c4:	f811 4f01 	ldrb.w	r4, [r1, #1]!
c0dec2c8:	3a01      	subs	r2, #1
c0dec2ca:	f803 4b01 	strb.w	r4, [r3], #1
c0dec2ce:	2c00      	cmp	r4, #0
c0dec2d0:	d1f7      	bne.n	c0dec2c2 <strncpy+0x6>
c0dec2d2:	2100      	movs	r1, #0
c0dec2d4:	441a      	add	r2, r3
c0dec2d6:	4293      	cmp	r3, r2
c0dec2d8:	d100      	bne.n	c0dec2dc <strncpy+0x20>
c0dec2da:	bd10      	pop	{r4, pc}
c0dec2dc:	f803 1b01 	strb.w	r1, [r3], #1
c0dec2e0:	e7f9      	b.n	c0dec2d6 <strncpy+0x1a>

c0dec2e2 <C_app_zknox_64px_bitmap>:
c0dec2e2:	0040 0040 8922 0002 ffff ffff ffff ffff     @.@."...........
c0dec2f2:	ffff ffff 0ed7 f55d a39d 3010 8311 f0ad     ......]....0....
c0dec302:	030b 0110 0070 4c81 0dec 2005 0001 7031     ....p..L... ..1p
c0dec312:	0d04 0be9 7231 5011 0a01 99e7 2001 7223     ....1r.P..... #r
c0dec322:	1102 8140 e47e 1287 4315 2162 0450 e20e     ..@.~....Cb!P...
c0dec332:	13b8 4065 5263 4031 e106 13ab 1485 0373     ..e@cR1@......s.
c0dec342:	2142 0750 addf 6513 5364 2142 0b50 96de     B!P....edSB!P...
c0dec352:	6027 0474 5243 4021 0d01 9bdc 8015 5325     '`t.CR!@......%S
c0dec362:	4304 3152 0640 b6dc 6549 b530 a989 0680     .CR1@...Ie0.....
c0dec372:	4312 3142 0140 da0d 010c 8417 c57c c79e     .CB1@.......|...
c0dec382:	3310 4142 0540 a8da 4b48 8ec9 33a4 4132     .3BA@...HK...32A
c0dec392:	0140 c60e cd4e 7691 ccc0 330b 1122 3182     @...N..v...3"..1
c0dec3a2:	0b60 0bc5 0231 9dcc c026 09ce 1302 0422     `...1...&.....".
c0dec3b2:	1c0a 728b 0540 0bc5 0130 8bcc c748 c51e     ...r@...0...H...
c0dec3c2:	060e 1213 0d04 ad1e a2ed 1440 c10d 030e     ..........@.....
c0dec3d2:	0130 88cc c55d 68bc b075 09c4 1302 ce92     0...]..hu.......
c0dec3e2:	13a0 ed9a 1090 1a08 6489 0617 0140 cb0c     .........d..@...
c0dec3f2:	c515 080d 9d1e d0c6 0dc3 8623 31ed dc8c     ..........#..1..
c0dec402:	0a15 0c1d 150b 8364 ca2d 0a02 06c5 c20e     ......d.-.......
c0dec412:	b68e 0ec3 1305 ca88 0931 4d1e 3b6c 319a     ........1..Ml;.1
c0dec422:	c9b0 0d04 0ec4 c407 040c 08c4 0113 0210     ................
c0dec432:	0821 7d2e 6c0d 0308 07ca c40d 060e 0cc4     !..}.l..........
c0dec442:	c405 23ba 705a 0931 2d2e 1d0e 2d4c a39c     ...#Zp1..-..L-..
c0dec452:	cad0 0c08 08c5 c30c 0b09 bcc4 4e23 b5d0     ............#N..
c0dec462:	3d01 0ce0 b220 d66e ab70 9858 0419 cb0d     .=.. .n.p.X.....
c0dec472:	c01a c30e 5a8e 081d c509 060e 8912 1afd     .....Z..........
c0dec482:	edad 1061 39aa c183 49be 30b7 cc07 7f8c     ..a..9...I.0....
c0dec492:	c22e a8ae c79c 220b 3e09 818d 8710 1dc4     .......".>......
c0dec4a2:	c20e 6b87 ce18 5e02 0eca 8ec1 1281 1a06     ...k...^........
c0dec4b2:	4189 0610 190c b7c4 b516 ceb0 cf86 8f3e     .A............>.
c0dec4c2:	1eef 3ec4 d89f 5120 a810 6ddc bbc4 a19c     ...>.. Q...m....
c0dec4d2:	cec0 6f8a 7e7e 8b4e 2062 6c81 0b1d c505     ...o~~N.b .l....
c0dec4e2:	8abb d091 01cf 7e0d 5e7e 0c0d 3d2a 6b8c     .......~~^..*=.k
c0dec4f2:	0dc5 d039 7f8a 7e7e 2e7e 0a2d dd05 0c01     ..9...~~~.-.....
c0dec502:	7e7e 0e7e 8c3d dd5d 040b 7e7e 0e7e 8c2d     ~~~.=.]...~~~.-.
c0dec512:	df7a 0807 7e7e 3d6e 0609 8ee0 7e39 5e7e     z...~~n=....9~~^
c0dec522:	0a2d e206 398e 7e7e 2d3e 0609 8ee4 7e38     -....9~~>-....8~
c0dec532:	0e7e 083d e607 76be e0cf 7e0d 0e0d 9e2d     ~.=....v...~..-.
c0dec542:	90b5 aae9 df29 7d1e 0c1e 0e17 beeb 6b80     ....)..}.......k
c0dec552:	0ed0 4ec0 a5ad f03c 72ab 1836 52b7 d039     ...N..<..r6..R9.
c0dec562:	1df5 1a0b 0e0d ffff ffff ffff ffff ffff     ................
c0dec572:	                                             .

c0dec573 <C_app_zknox_64px>:
c0dec573:	0040 0040 0102 c2e2 c0de                    @.@.......

c0dec57d <C_switch_60_40_bitmap>:
c0dec57d:	0000 00ff 0000 ff07 00e0 1f00 f8ff 0000     ................
c0dec58d:	ff3f 00fc ff00 ffff 0100 ffff 80ff ff03     ?...............
c0dec59d:	ffff 03c0 ffff c0ff ff07 ffff 0fe0 ffff     ................
c0dec5ad:	f0ff ff0f ffff 1ff0 ffff f8ff ff1f ffff     ................
c0dec5bd:	1ff8 ffff f8ff ff3f ffff 3ffc ffff fcff     ......?....?....
c0dec5cd:	ff3f ffff 3ffc ffff fcff ff3f ffff 3ffc     ?....?....?....?
c0dec5dd:	ffff fcff ff3f ffff 3ffc ffff fcff ff3f     ....?....?....?.
c0dec5ed:	ffff 3ffc ffff fcff ff3f ffff 3ffc ffff     ...?....?....?..
c0dec5fd:	fcff ff3f ffff 3ffc 00ff fcff f83f 1f00     ..?....?....?...
c0dec60d:	3ffc 00f0 fc0f c03f 0300 3ffc 0080 fc01     .?....?....?....
c0dec61d:	003f 0000 3ffc 0000 fc00 003e 0000 3c7c     ?....?....>...|<
c0dec62d:	0000 3c00 003c 0000 3c3c 0000 3c00 0038     ...<<...<<...<8.
c0dec63d:	0000 381c 0000 1c00 0038 0000 381c 0000     ...8....8....8..
c0dec64d:	1c00 0038 0000 381c 0000 1c00 0038 0000     ..8....8....8...
c0dec65d:	381c 0000 1c00 001c 0000 1c38 0000 3800     .8........8....8
c0dec66d:	001c 0000 0e38 0000 7000 000f 0000 07f0     ....8....p......
c0dec67d:	0000 e000 8003 0100 03c0 00c0 c003 f001     ................
c0dec68d:	0f00 0080 00f8 001f 3f00 fc00 0000 ff1f     .........?......
c0dec69d:	00f8 0700 e0ff 0000 ff00 0000               ............

c0dec6a9 <C_switch_60_40>:
c0dec6a9:	003c 0028 0000 c57d c0de                    <.(...}...

c0dec6b3 <C_Check_Circle_64px_bitmap>:
c0dec6b3:	0040 0040 3321 0002 0231 8b1f 0008 0000     @.@.!3..1.......
c0dec6c3:	0000 0302 55ad 4e39 3103 fd14 6124 4b5f     .....U9N.1..$a_K
c0dec6d3:	8028 a091 2401 b888 4640 2054 4121 3949     (....$..@FT !AI9
c0dec6e3:	152d 00dc a090 1166 05a2 0171 1710 0a48     -.....f...q...H.
c0dec6f3:	026a 6017 41ab 8961 2404 9f21 65ef be66     j..`.Aa..$!..ef.
c0dec703:	0e3d c48b 9914 9fb1 fcfd fcfc 8cf3 7ff8     =...............
c0dec713:	f54f 1a60 7460 d8a9 de00 fd04 95cc 681c     O.`.`t.........h
c0dec723:	87cd c9e8 bf14 0185 7952 ae0b 301b 8b40     ........Ry...0@.
c0dec733:	c4b5 9cae 7cb5 f88d e070 ef89 0371 137e     .....|..p...q.~.
c0dec743:	fd5d 4e7a 4f7d d6b4 9e38 8ea5 b8f9 4c79     ].zN}O..8.....yL
c0dec753:	34cd e15b da9e 7c13 18bc 1930 a38b 5b15     .4[....|..0....[
c0dec763:	b94d a901 5a89 34af d0fa fbd4 5d41 b0b9     M....Z.4....A]..
c0dec773:	0ab1 6830 71fb 5315 0056 6e9a fc6c 2fb3     ..0h.q.SV..nl../
c0dec783:	24e2 dd75 bf49 012f d486 1057 ac8e 0a5a     .$u.I./...W...Z.
c0dec793:	aa32 dc97 5d54 3947 803e c954 7a63 b709     2...T]G9>.T.cz..
c0dec7a3:	815a c734 7fa9 bc41 000b 6a27 db3a e292     Z.4...A...'j:...
c0dec7b3:	12ed 3f6f 8274 64b6 f810 4052 a01d de23     ..o?t..d..R@..#.
c0dec7c3:	2712 6220 73a5 9d0a cf04 db00 e588 5bd8     .' b.s.........[
c0dec7d3:	e08b 0a5d 027c a128 8093 ee56 ab15 0ca4     ..].|.(...V.....
c0dec7e3:	1953 0781 889d a1eb 493b 0082 11da c517     S.......;I......
c0dec7f3:	9b8f 4760 f54c 0b95 822e f14b 41ed 360f     ..`GL.....K..A.6
c0dec803:	b820 d215 48a4 c137 3093 c2c8 8139 e70b      ....H7..0..9...
c0dec813:	4e04 105c 30ac d4dc 08a7 9856 acbe 7c5d     .N\..0....V...]|
c0dec823:	5e31 0710 701c 347f 5aff 4fe8 36b3 adc9     1^...p.4.Z.O.6..
c0dec833:	802f c436 7653 d63e 3cfe 2d61 5f3f ba73     /.6.Sv>..<a-?_s.
c0dec843:	df3a acb2 d712 0ff4 1f59 2554 6ec3 5f7b     :.......Y.T%.n{_
c0dec853:	6554 3b01 e340 8e78 cad4 febe e91f 4c92     Te.;@.x........L
c0dec863:	f2b3 e8c9 ce32 92b3 a68c 3457 3971 702e     ....2.....W4q9.p
c0dec873:	b6aa 0f34 d91d e35f f2e1 639e a7d5 fd79     ..4..._....c..y.
c0dec883:	ba44 dde8 6369 1aef c3e5 3464 9dd2 272f     D...ic....d4../'
c0dec893:	cbbf 1fa7 8df3 b09c 9b03 5328 2325 8d5f     ..........(S%#_.
c0dec8a3:	3ec0 f233 eb15 7359 39c0 5158 f322 2c7d     .>3...Ys.9XQ".},
c0dec8b3:	f7cc 448d cbbe a6c0 e1fb f102 dd51 030f     ...D........Q...
c0dec8c3:	0898 fe6c ec64 ac2b 19ea f170 f7af 2d1b     ..l.d.+...p....-
c0dec8d3:	1fb1 b3c2 2e0d dad0 0cd6 c8c0 fe72 af1f     ............r...
c0dec8e3:	fc6c 2402 5a14 00c5 0008                     l..$.Z.....

c0dec8ee <C_Check_Circle_64px>:
c0dec8ee:	0040 0040 0102 c6b3 c0de                    @.@.......

c0dec8f8 <C_Denied_Circle_64px_bitmap>:
c0dec8f8:	0040 0040 3021 0002 022e 8b1f 0008 0000     @.@.!0..........
c0dec908:	0000 0302 55ad 2f4b 4104 2e10 bd6b 479f     .....UK/.A..k..G
c0dec918:	d80e 4884 ac90 3f8d e260 2244 e8e1 71b8     ...H...?`.D"...q
c0dec928:	e273 201f ece1 7111 fe25 f100 d607 d9c1     s.. ...q%.......
c0dec938:	07f2 e63c d64c e363 a6b9 f554 a663 67a7     ..<.L.c...T.c..g
c0dec948:	9766 1f44 b676 babb beaa eafe 6aeb ffc4     f.D.v........j..
c0dec958:	5f1b 13fb 4300 c50b f304 a806 5331 b18a     ._...C......1S..
c0dec968:	1c56 47f0 58ba 0cd5 2a90 6658 642f 6806     V..G.X...*Xf/d.h
c0dec978:	52b4 08ec a5af c46b fdfb ff0c 0d1f df99     .R....k.........
c0dec988:	a978 f947 bb78 5b3c ed35 5a39 0d98 47a6     x.G.x.<[5.9Z...G
c0dec998:	ad34 3237 34b8 331f f3f7 6c86 8e00 3632     4.72.4.3...l..26
c0dec9a8:	e185 09e6 3f8d a17b 07dd bc61 b41f a934     .....?{...a...4.
c0dec9b8:	2b27 7d00 1f36 4157 4fc8 ba80 db1b ddfe     '+.}6.WA.O......
c0dec9c8:	c7ed 7424 511d 2fbe fa01 bfe5 247c 42bb     ..$t.Q./....|$.B
c0dec9d8:	9690 2555 e336 49ca 44a8 9e99 a3cd 831a     ..U%6..I.D......
c0dec9e8:	e7d6 7bf8 7006 0f2c a96d a005 bf9d 668e     ...{.p,.m......f
c0dec9f8:	5162 3ff3 bf2c 008e 01e0 8ab4 abe9 e34e     bQ.?,.........N.
c0deca08:	32c2 c0aa e712 3ab8 aa46 d8a4 7896 009f     .2.....:F....x..
c0deca18:	10b6 facb 1974 9385 90e8 df1b c005 8047     ....t.........G.
c0deca28:	1a12 9eeb c7de bb99 4b38 a82a d662 e770     ........8K*.b.p.
c0deca38:	6d88 6b88 3b3e 12c2 33b8 16a2 79c4 09fe     .m.k>;...3...y..
c0deca48:	1802 b8ee aecd 648e 0741 dc30 44a9 9cf5     .......dA.0..D..
c0deca58:	d3a4 91d4 8ee1 0cb7 804d 7434 1468 91e3     ........M.4th...
c0deca68:	3209 1ced 7020 bbff 2e3d 2d7e b97c 7c40     .2.. p..=.~-|.@|
c0deca78:	f9f6 b8ce f9c0 fc6a 2834 9292 6df8 3c46     ......j.4(...mF<
c0deca88:	56a9 f69f f5da 0b2d 1895 aeeb 9abe 421f     .V....-........B
c0deca98:	a41f 8192 7d78 4b3d 2965 4719 79f5 3328     ....x}=Ke).G.y(3
c0decaa8:	ea3b 451e 9df4 0691 b192 cdd5 fa4a 8b5a     ;..E........J.Z.
c0decab8:	65c0 702d b86b bd6a 3762 9f17 151d 49d7     .e-pk.j.b7.....I
c0decac8:	dfba d88a a4bb 90fe 77f5 f7c6 e397 f5df     .........w......
c0decad8:	9aa7 8dfd a6af b0d5 4257 7442 86ed 1a7d     ........WBBt..}.
c0decae8:	21d2 b97a 86f0 ee73 91cf 3efe f9a2 8f5f     .!z...s....>.._.
c0decaf8:	77f4 b0d1 7de9 40b8 907c 43ef 462f b61a     .w...}.@|..C/F..
c0decb08:	d239 13f6 95f6 9909 7f8b df7d c528 369e     9.........}.(..6
c0decb18:	274f a03c cd95 8029 a5c1 3fc2 d93e 03f8     O'<...)....?>...
c0decb28:	a770 8485 0800 0000                         p.......

c0decb30 <C_Denied_Circle_64px>:
c0decb30:	0040 0040 0102 c8f8 c0de                    @.@.......

c0decb3a <C_Important_Circle_64px_bitmap>:
c0decb3a:	0040 0040 fa21 0001 01f8 8b1f 0008 0000     @.@.!...........
c0decb4a:	0000 0302 55b5 4ecd 40c2 1e10 fea1 cfe3     .....U.N.@......
c0decb5a:	0f51 892a d45e 8904 602f 49e3 1313 7a3c     Q.*.^.../`.I..<z
c0decb6a:	cae4 37cd 1350 a33d 70c6 f8d5 1802 005f     ...7P.=..p...._.
c0decb7a:	9e0f 5f05 1fc0 1ace 4910 c054 b38e b6ed     ..._.....IT.....
c0decb8a:	db74 d059 e704 76d0 dbf6 7cee 76fd 2dfa     t.Y....v...|.v.-
c0decb9a:	ef62 99a2 055b d858 6a29 43e0 b190 6159     b...[.X.)j.C..Ya
c0decbaa:	96d0 5e09 c518 308e a440 8010 052d 1806     ...^...0@...-...
c0decbba:	9408 b138 cadf 203c e4be e2e2 4979 3f81     ..8...< ....yI.?
c0decbca:	d0c4 7c94 3ac7 d915 1f9e d24f 56c0 bd3b     ...|.:....O..V;.
c0decbda:	34a4 abea a650 d97c 5f3f 484c c9b4 c551     .4..P.|.?_LH..Q.
c0decbea:	9541 9a6e 78d8 3bd9 3ecd f957 d17e 9ad0     A.n..x.;.>W.~...
c0decbfa:	ec9b cc02 f504 6fb8 d92f e800 0c7b dfe2     .......o/...{...
c0decc0a:	de93 c49a 2c6e 77ac 6009 79d6 874a 4baa     ....n,.w.`.yJ..K
c0decc1a:	8606 abb3 26a4 9db7 cac4 a6de ff9a 7d53     .....&........S}
c0decc2a:	e341 7129 01bf b3c8 02dd 1310 d377 84a7     A.)q........w...
c0decc3a:	a612 c04d 1802 71e1 d85a b9e1 e3c2 006f     ..M....qZ.....o.
c0decc4a:	c459 fb3a 2275 6d3e 5582 0a80 538f 09e5     Y.:.u">m.U...S..
c0decc5a:	2551 eba2 38f7 228c f3ee 38ea 0ec2 6e23     Q%...8."...8..#n
c0decc6a:	0b8b c71f 55e2 51d3 8b81 4412 9145 3b71     .....U.Q...DE.q;
c0decc7a:	f769 20b6 159e 4f43 9a82 924d abc7 a042     i.. ..CO..M...B.
c0decc8a:	c6ff f1bb 724b e7cd a06e 4521 e9d2 2fd3     ....Kr..n.!E.../
c0decc9a:	d245 3be9 7884 69d5 627f f7dd 2eb7 b2c9     E..;.x.i.b......
c0deccaa:	407f eeca 3992 af1e 9d39 ba05 bc0d 2a70     .@...9..9.....p*
c0deccba:	f29b 623f 19e8 8db2 1c0b 90dc d70b 0d35     ..?b..........5.
c0deccca:	965e ade3 b9a0 ea78 75c8 dd4d 2dff 7d85     ^.....x..uM..-.}
c0deccda:	f9d6 c243 c99b 4bfb 77fe d4fe dfd5 8948     ..C....K.w....H.
c0deccea:	61a0 92d3 8a91 afe2 618a 2b5f 8afe 5256     .a.......a_+..VR
c0deccfa:	709d fc2b e439 8bef bfae 841f ddfc 6c36     .p+.9.........6l
c0decd0a:	1f3a 10ee 9d5f 61f3 431a ed86 230f 53d8     :..._..a.C...#.S
c0decd1a:	b8cd 1702 7aff 51be 3389 de17 f4d0 eb73     .....z.Q.3....s.
c0decd2a:	1d68 3e60 e853 91e1 3f8d c10e e439 0800     h.`>S....?..9...
	...

c0decd3c <C_Important_Circle_64px>:
c0decd3c:	0040 0040 0102 cb3a c0de                    @.@...:...

c0decd46 <C_Warning_64px_bitmap>:
c0decd46:	0040 0040 5f21 0001 015d 8b1f 0008 0000     @.@.!_..].......
c0decd56:	0000 0302 d585 4e31 40c3 0510 8dd0 0885     ......1N.@......
c0decd66:	454a 9149 25c2 52b2 08e4 4039 19c4 8272     JEI..%.R..9@..r.
c0decd76:	815c 0384 b880 c441 7205 0a04 e7d2 6908     \.....A..r.....i
c0decd86:	a202 a50b a113 ec1d 5d99 f6b3 1fee fb6f     .........]....o.
c0decd96:	96c6 febc 4333 4f84 27b9 5ced ebf2 c293     ....3C.O.'.\....
c0decda6:	53bf 2663 cf0a 318c 9d23 5bb1 e866 5176     .Sc&...1#..[f.vQ
c0decdb6:	60e1 7d06 3f5d b8fc ce41 24bc cce4 4273     .`.}]?..A..$..sB
c0decdc6:	eafe f818 e79b efb4 966a 4b7b 7339 c841     ........j.{K9sA.
c0decdd6:	ef99 f908 e431 bfd8 1c5a 7979 f15b 9090     ....1...Z.yy[...
c0decde6:	8733 6891 f33b 1855 96a9 239f f96e 8f25     3..h;.U....#n.%.
c0decdf6:	7438 4b8e c9d6 bfeb 6f0b 3809 e0f3 8085     8t.K.....o.8....
c0dece06:	34db 977b c5b0 5dec 46c2 5dc8 90d8 9baf     .4{....].F.]....
c0dece16:	94b8 9fc6 fa1b 4631 36dc 7d8c ba4e 3d17     ......1F.6.}N..=
c0dece26:	bdae e25f c4bc 9f6e eff4 eb93 164b f784     .._...n.....K...
c0dece36:	2a9b fe68 5d4f 3d90 7743 5b05 7de8 70f9     .*h.O].=Cw.[.}.p
c0dece46:	ebf1 4416 ccf9 a1de 00bb a01f 39d3 b4ef     ...D.........9..
c0dece56:	b74f bebf fef5 ed72 141b fba4 787b 2e82     O.....r.....{x..
c0dece66:	f705 e9d8 1833 c93f f4f9 cfa1 9727 0297     ....3.?.....'...
c0dece76:	14bb b04c c14b 7603 89f2 6e43 fa57 f77c     ..L.K..v..CnW.|.
c0dece86:	db89 fbe8 4cc5 fd95 50b4 93f7 605f 6523     .....L...P.._`#e
c0dece96:	e63f 73ba c6a0 fb3d f499 5e05 cbcd e43f     ?..s..=....^..?.
c0decea6:	7b2a 0024 0008                               *{$....

c0decead <C_Warning_64px>:
c0decead:	0040 0040 0102 cd46 c0de                    @.@...F...

c0deceb7 <C_Back_40px_bitmap>:
c0deceb7:	0028 0028 8c21 0000 008a 8b1f 0008 0000     (.(.!...........
c0decec7:	0000 0302 d3ed 09cd 20c0 800c d0d1 0e53     ......... ....S.
c0deced7:	a21d 39a3 364a 9570 d26e c46d c143 c7e6     ...9J6p.n.m.C...
c0decee7:	a8d6 73d0 f50f e110 81e3 b010 9794 f843     ...s..........C.
c0decef7:	efb7 c3b6 53b7 4667 28df dcca b621 6196     .....SgF.(..!..a
c0decf07:	2b95 b601 0646 d04a 5b5b fa86 4192 376d     .+..F.J.[[...Am7
c0decf17:	50ab c3da 942a 98d6 6e41 198e e6e4 4299     .P..*...An.....B
c0decf27:	8ec2 2429 99ec 6dc0 6181 0933 c4f8 5561     ..)$...m.a3...aU
c0decf37:	6001 605a 199a 7c43 01fb 02e5 04e6 e43a     .`Z`..C|......:.
c0decf47:	0320 0000                                    ...

c0decf4b <C_Back_40px>:
c0decf4b:	0028 0028 0102 ceb7 c0de                    (.(.......

c0decf55 <C_Check_40px_bitmap>:
c0decf55:	0028 0028 5401 0000 0052 8b1f 0008 0000     (.(..T..R.......
c0decf65:	0000 0302 6063 05c0 4078 1c84 9088 1307     ....c`..x@......
c0decf75:	400d ff82 9000 7f60 2400 3f98 0900 1fc6     .@....`..$.?....
c0decf85:	9920 203f 0ea2 d844 57e3 2608 602a b02c      .? ..D..W.&*`,.
c0decf95:	5818 ac16 ac0e ac03 1ed7 5e6e 5c0d 0183     .X........n^.\..
c0decfa5:	0103 0000 8363 77dc 00c8 0000               ....c..w....

c0decfb1 <C_Check_40px>:
c0decfb1:	0028 0028 0100 cf55 c0de                    (.(...U...

c0decfbb <C_Chevron_40px_bitmap>:
c0decfbb:	0028 0028 5c22 0000 ffff ffff ffff ffff     (.(."\..........
c0decfcb:	1cda 03e4 0310 03e2 0330 03e0 0350 03de     ........0...P...
c0decfdb:	1820 0320 03dc 0820 08c1 0320 03da 0820      . ... ... ... .
c0decfeb:	08c3 0320 03d8 0820 08c5 0320 03d6 0820     .. ... ... ... .
c0decffb:	08c7 0320 05d4 0820 08c9 0520 9ed3 8020     .. ... ... ... .
c0ded00b:	98cb e002 0ed4 cd09 0e09 ffff ffff ffff     ................
c0ded01b:	ffff e2ff                                   ....

c0ded01f <C_Chevron_40px>:
c0ded01f:	0028 0028 0102 cfbb c0de                    (.(.......

c0ded029 <C_Chevron_Back_40px_bitmap>:
c0ded029:	0028 0028 7621 0000 0074 8b1f 0008 0000     (.(.!v..t.......
c0ded039:	0000 0302 d2ed 0dc1 3080 0508 8e50 383d     .........0..P.=8
c0ded049:	a3a4 41b0 7157 6e93 3863 d498 1042 eb7e     ...AWq.nc8..B.~.
c0ded059:	4606 340e bfe5 0b84 ffbd aa35 e7e1 2eb2     .F.4......5.....
c0ded069:	6705 b55c 541f 2473 e9b4 1273 7640 27b0     .g\..Ts$..s.@v.'
c0ded079:	2794 c807 0711 4c94 3203 73ac b828 21cd     .'.....L.2.s(..!
c0ded089:	8732 7313 3338 0b83 b833 8532 532b 62f8     2..s83..3.2.+S.b
c0ded099:	9603 1dcf 0dc6 8ef2 7343 0320 0000          ........Cs ...

c0ded0a7 <C_Chevron_Back_40px>:
c0ded0a7:	0028 0028 0102 d029 c0de                    (.(...)...

c0ded0b1 <C_Chevron_Next_40px_bitmap>:
c0ded0b1:	0028 0028 7121 0000 006f 8b1f 0008 0000     (.(.!q..o.......
c0ded0c1:	0000 0302 ceed 0dbb 3080 450c 5751 0a51     .........0.EQWQ.
c0ded0d1:	cc86 ac06 0d90 0918 42a6 1448 c48f 8e44     .........BH...D.
c0ded0e1:	1b3f 6e20 74f9 1964 58f8 8735 22e9 02da     ?. n.td..X5.."..
c0ded0f1:	ca23 a581 61e2 f5a5 b074 c031 c6c1 0b00     #....a..t.1.....
c0ded101:	3999 ccc8 c1c2 1c0c 434c 0a61 9b0a 3150     .9......LCa...P1
c0ded111:	c781 1d64 ec2e fe92 bcbe 7707 ddbd ebf8     ..d........w....
c0ded121:	383d be09 209b 0003                          =8... ...

c0ded12a <C_Chevron_Next_40px>:
c0ded12a:	0028 0028 0102 d0b1 c0de                    (.(.......

c0ded134 <C_Close_40px_bitmap>:
c0ded134:	0028 0028 8521 0000 0083 8b1f 0008 0000     (.(.!...........
c0ded144:	0000 0302 fffb c07f bfc0 08f9 cff6 10f7     ................
c0ded154:	11fa 4207 41ac 420f 604f 87e8 fd09 e060     ...B.A.BO`....`.
c0ded164:	3184 0ae0 e01b 70d2 9216 9c2c 5089 6706     .1.....p..,..P.g
c0ded174:	2923 7383 9590 7941 ca28 5ca0 6554 3e60     #).s..Ay(..\Te`>
c0ded184:	329a 42b0 6574 8520 cae8 0a40 9431 1561     .2.Bte ...@.1.a.
c0ded194:	a2c3 9b17 581d 82dc cdcd fc58 2d86 b00c     .....X....X..-..
c0ded1a4:	1584 30b6 12c5 d8f6 08e2 5c5b 8b62 6c73     ...0......[\b.sl
c0ded1b4:	6369 0040 b400 b40b 2014 0003                ic@...... ...

c0ded1c1 <C_Close_40px>:
c0ded1c1:	0028 0028 0102 d134 c0de                    (.(...4...

c0ded1cb <C_Info_40px_bitmap>:
c0ded1cb:	0028 0028 3121 0000 002f 8b1f 0008 0000     (.(.!1../.......
c0ded1db:	0000 0302 fffb 147f 0bd0 f030 67ff 0180     ..........0..g..
c0ded1eb:	2a7e 7189 5a60 80d3 ec45 cf57 f068 0593     ~*.q`Z..E.W.h...
c0ded1fb:	d900 c99e 2019 0003                          ..... ...

c0ded204 <C_Info_40px>:
c0ded204:	0028 0028 0102 d1cb c0de                    (.(.......

c0ded20e <C_Mini_Push_40px_bitmap>:
c0ded20e:	0028 0028 ce21 0000 00cc 8b1f 0008 0000     (.(.!...........
c0ded21e:	0000 0302 936d 0dcd 30c2 460c 2123 4ea4     ....m....0.F#!.N
c0ded22e:	ba83 2b01 5230 6037 4604 0762 b006 5c0f     ...+0R7`.Fb....\
c0ded23e:	4240 4936 2f9c f6bf c9a5 b3d3 3913 aaae     @B6I./.......9..
c0ded24e:	1085 0eb1 4911 1e0a 7710 829f 6ab0 5a90     .....I...w...j.Z
c0ded25e:	9606 3ac2 08a7 a7f5 a2d1 4761 b5e3 d168     ...:......aG..h.
c0ded26e:	2f6c 053a a92f f019 a4cc fb95 6b3d cac1     l/:./.......=k..
c0ded27e:	53f6 6563 0ef5 8ae1 c043 10f6 3220 db41     .Sce....C... 2A.
c0ded28e:	880e d044 1fee 8588 4d45 6215 5161 8553     ..D.....EM.baQS.
c0ded29e:	2c68 556b 7634 5a4b cf12 e599 bcbb ab36     h,kU4vKZ......6.
c0ded2ae:	5c7e fdda 61e4 cbec d6c6 b81e ebcc db95     ~\...a..........
c0ded2be:	af53 def7 791b e96f f9be 9628 eac9 b147     S....yo...(...G.
c0ded2ce:	3926 e6b3 a4ce bb37 8cee ff4f 1fc2 8764     &9....7...O...d.
c0ded2de:	9d98 0320 0000                              .. ...

c0ded2e4 <C_Mini_Push_40px>:
c0ded2e4:	0028 0028 0102 d20e c0de                    (.(.......

c0ded2ee <C_Privacy_40px_bitmap>:
c0ded2ee:	0028 0028 ac21 0001 01aa 8b1f 0008 0000     (.(.!...........
c0ded2fe:	0000 0302 927d 4bbf 50c3 c710 e9af 8b4f     ....}..K.P....O.
c0ded30e:	1768 0741 b335 fe88 6609 1d28 2c44 1fe2     h.A.5....f(.D,..
c0ded31e:	2ea0 cdd2 2e0a 6082 a45c b4b8 0ff8 4418     .......`\......D
c0ded32e:	1c50 b3b4 dd28 60a5 8777 38a2 10e9 b56b     P...(..`w..8..k.
c0ded33e:	dac6 bce6 97bb 2da6 378a 25e4 f79f f7de     .......-.7.%....
c0ded34e:	77be c439 a3bf ba75 ca9e f75c 26a1 8448     .w9...u...\..&H.
c0ded35e:	7a2e 23d8 b178 1f40 5e4e 6ad8 7320 7b7e     .z.#x.@.N^.j s~{
c0ded36e:	4cb6 1a70 8cd1 7231 2e21 cf5b 8c06 03a3     .Lp...1r!.[.....
c0ded37e:	1ac2 a730 dc34 2ab5 4166 beee c941 6e97     ..0.4..*fA..A..n
c0ded38e:	63a8 6968 74dd d859 d595 fb88 81c8 5288     .chi.tY........R
c0ded39e:	2181 90c9 a1bb 74a4 16cc 69c7 9e7a 9390     .!.....t...iz...
c0ded3ae:	4e29 1eda d913 c423 f127 53ac 07d2 22a8     )N....#.'..S..."
c0ded3be:	e1d6 5d0e 461d 4b72 49c0 30eb f88b 880a     ...].FrK.I.0....
c0ded3ce:	10ef 6125 8d93 09ba a8da c904 5c0e 328a     ..%a.........\.2
c0ded3de:	283b 1004 218b 5d44 cd39 2bd2 c9dd 15a3     ;(...!D]9..+....
c0ded3ee:	36c1 084c 01ab 6919 24c1 e237 561b 7d84     .6L....i.$7..V.}
c0ded3fe:	8488 c031 51cc 7b85 216b 9bf4 c259 fe9a     ..1..Q.{k!..Y...
c0ded40e:	92dd 9faa b872 cb24 3521 a8b4 62fe b698     ....r.$.!5...b..
c0ded41e:	c2a2 4d4c 6cbc 4560 f7eb 916c 5521 cc5b     ..LM.l`E..l.!U[.
c0ded42e:	86e6 8752 3d5c adc2 7bf7 d9a0 a6dc be99     ..R.\=...{......
c0ded43e:	2d5e 26b2 a8cb 1e9e 9a13 8b17 3a52 f30c     ^-.&........R:..
c0ded44e:	3ef3 a327 ca61 ae09 8fcf 084f 5aca f908     .>'.a.....O..Z..
c0ded45e:	35c8 ffbc a35f 5ec4 41ec f3b8 d353 3a1e     .5.._..^.A..S..:
c0ded46e:	f604 9120 5418 b993 8329 5e85 db99 f2e5     .. ..T..)..^....
c0ded47e:	56d5 6002 57d4 75ae b266 f08b 114b a76d     .V.`.W.uf...K.m.
c0ded48e:	a077 f65f c993 81d4 ff8d 0fc5 af18 4ccb     w._............L
c0ded49e:	0320 0000                                    ...

c0ded4a2 <C_Privacy_40px>:
c0ded4a2:	0028 0028 0102 d2ee c0de                    (.(.......

c0ded4ac <C_QRCode_40px_bitmap>:
c0ded4ac:	0028 0028 9921 0000 0097 8b1f 0008 0000     (.(.!...........
c0ded4bc:	0000 0302 fffb da9f 11e0 0803 bd30 00ff     ............0...
c0ded4cc:	fea2 607f 8900 8029 18c5 91f4 20c5 0c42     ...`..)...... B.
c0ded4dc:	28fc fc62 1230 c2c2 f62d a3a7 4307 07ec     .(b.0...-....C..
c0ded4ec:	0703 ff84 6101 b11e 1062 c0f3 903c 9073     .....a..b...<.s.
c0ded4fc:	25ec 8628 07f0 cc3f 4839 85fe 218b 0b85     .%(...?.9H...!..
c0ded50c:	923f 49b3 d30a 107f f583 ed90 04f8 99a1     ?..I............
c0ded51c:	c230 9b14 d19b 19c2 0c55 061e 3a27 a3ce     0.......U...':..
c0ded52c:	1586 d790 d0c0 aa4f 3618 88f3 0b74 7f16     ......O..6..t...
c0ded53c:	f360 b62f a170 002e 5b00 1eb2 20fb 0003     `./.p....[... ..
	...

c0ded54d <C_QRCode_40px>:
c0ded54d:	0028 0028 0102 d4ac c0de                    (.(.......

c0ded557 <C_Settings_40px_bitmap>:
c0ded557:	0028 0028 9321 0001 0191 8b1f 0008 0000     (.(.!...........
c0ded567:	0000 0302 5275 52b1 40c2 7d10 88c9 9841     ....uR.R.@.}..A.
c0ded577:	8c91 8e56 10ce 5e87 3e46 ec40 93b0 4e8e     ..V....^F>@....N
c0ded587:	03fd 4053 850d 1695 9d62 4a42 b03b 8a93     ..S@....b.BJ;...
c0ded597:	0bf1 04fc 1c1c 40eb a202 3920 2f77 1738     .......@.. 9w/8.
c0ded5a7:	d818 6f62 e5ef eef2 bbed 6215 8c7d ad4d     ..bo.......b}.M.
c0ded5b7:	8cba 81d5 25ad 8028 6b61 45dd 87ac 8fac     .....%(.ak.E....
c0ded5c7:	daac 764f 4e0b 7751 3303 aed6 761c ac42     ..Ov.NQw.3...vB.
c0ded5d7:	8a01 1084 f9ad 314a 12e5 74f7 2cb5 8c9a     ......J1...t.,..
c0ded5e7:	300d 976b 5c73 4ae5 8b8e 5734 5c1e 3dc5     .0k.s\.J..4W.\.=
c0ded5f7:	9e43 1197 0a3a e29b 765c 4780 fd85 1aa0     C...:...\v.G....
c0ded607:	9e59 5cee 6075 4b8a 57ca 26c0 c381 6890     Y..\u`.K.W.&...h
c0ded617:	fac4 2c7b 48e3 1f08 7c17 4593 0557 0a16     ..{,.H...|.EW...
c0ded627:	d037 8459 a74e 601f f108 0385 9e21 2d71     7.Y.N..`....!.q-
c0ded637:	8d44 19ec 2343 7786 f9a6 8a45 b79a 1d50     D...C#.w..E...P.
c0ded647:	84e0 5a08 cc1b 9a7c 0e90 fba5 ef06 716a     ...Z..|.......jq
c0ded657:	76ce 5398 2c73 25fa 6035 a205 fe11 a49b     .v.Ss,.%5`......
c0ded667:	81f4 18f4 b93a c7d3 8b1b a6df 5264 755b     ....:.......dR[u
c0ded677:	59c4 becb af10 c5ac 9ec6 b960 87d4 b385     .Y........`.....
c0ded687:	cb32 a1f5 4bf3 b27d ff65 79bd f9b2 b2d0     2....K}.e..y....
c0ded697:	3d80 6650 5e86 2f05 11b7 5733 3a79 f45c     .=Pf.^./..3Wy:\.
c0ded6a7:	f25e e8f9 6746 1b24 65be aed0 b864 14ca     ^...Fg$..e..d...
c0ded6b7:	6e9c 96f8 f913 44d4 2df3 8e8b 8d9a 9aa4     .n.....D.-......
c0ded6c7:	c911 53bb 8a72 1b9a b158 f976 a9b8 3db8     ...Sr...X.v....=
c0ded6d7:	3de4 50e9 6624 61a6 6747 dd64 aeec f19c     .=.P$f.aGgd.....
c0ded6e7:	fc68 4701 f51a 207f 0003                     h..G... ...

c0ded6f2 <C_Settings_40px>:
c0ded6f2:	0028 0028 0102 d557 c0de                    (.(...W...

c0ded6fc <C_Warning_40px_bitmap>:
c0ded6fc:	0028 0028 e721 0000 00e5 8b1f 0008 0000     (.(.!...........
c0ded70c:	0000 0302 d36d 0db1 40c2 850c 47e1 2284     ....m....@...G."
c0ded71c:	283a d511 88d5 1182 0032 8662 904c 0815     :(......2.b.L...
c0ded72c:	3013 2c03 0ec0 9e88 1025 526d 8450 9d10     .0.,....%.mRP...
c0ded73c:	73b9 8842 b87d aafc 675f 911f 4b1c 34c1     .sB.}..._g...K.4
c0ded74c:	0b26 c128 5b44 c08a c0f6 d95a d811 d2e6     &.(.D[....Z.....
c0ded75c:	c0ae a486 81dd 4905 80ab 4939 66ab 4988     .......I..9I.f.I
c0ded76c:	635a be30 7349 11ad c0d3 8c52 240e b5cd     Zc0.Is....R..$..
c0ded77c:	d476 6f9b 6925 2adc 6dad d615 0eb5 c5ed     v..o%i.*.m......
c0ded78c:	25ad 4cfc b04b b93d b035 db42 20db 942e     .%.LK.=.5.B.. ..
c0ded79c:	43d1 773e e2db a970 2e8d 4ac0 9d1b 4c80     .C>w..p....J...L
c0ded7ac:	e51b ec3f a6cd ce88 c8ca 5f26 bc1c 6d7d     ..?.......&_..}m
c0ded7bc:	5db8 a8ee 76e6 cbb5 5dae bcee 576d c1b7     .]...v...]..mW..
c0ded7cc:	caed 5db8 6f9b da37 9fec f49b 81ed ccb9     ...].o7.........
c0ded7dc:	785d fef8 7c2f 1300 b8d8 2006 0003           ]x../|..... ...

c0ded7eb <C_Warning_40px>:
c0ded7eb:	0028 0028 0102 d6fc c0de 7544 6d6d 2079     (.(.......Dummy 
c0ded7fb:	0032 6552 6976 7765 7420 6172 736e 6361     2.Review transac
c0ded80b:	6974 6e6f 740a 206f 6573 646e 4220 4c4f     tion.to send BOL
c0ded81b:	4f00 6570 6172 6974 6e6f 7320 6769 656e     .Operation signe
c0ded82b:	0064 6441 7264 7365 2073 6576 6972 6966     d.Address verifi
c0ded83b:	6163 6974 6e6f 630a 6e61 6563 6c6c 6465     cation.cancelled
c0ded84b:	5400 6172 736e 6361 6974 6e6f 4320 6568     .Transaction Che
c0ded85b:	6b63 7520 616e 6176 6c69 6261 656c 4100     ck unavailable.A
c0ded86b:	7070 6f72 6576 4200 696c 646e 732d 6769     pprove.Blind-sig
c0ded87b:	006e 2e30 2e30 0031 6f48 646c 7420 206f     n.0.0.1.Hold to 
c0ded88b:	6973 6e67 4f00 6570 6172 6974 6e6f 7220     sign.Operation r
c0ded89b:	6a65 6365 6574 0064 6552 656a 7463 4900     ejected.Reject.I
c0ded8ab:	2066 6f79 2775 6572 6e20 746f 7520 6973     f you're not usi
c0ded8bb:	676e 7420 6568 4c20 6465 6567 2072 6157     ng the Ledger Wa
c0ded8cb:	6c6c 7465 6120 7070 202c 7254 6e61 6173     llet app, Transa
c0ded8db:	7463 6f69 206e 6843 6365 206b 696d 6867     ction Check migh
c0ded8eb:	2074 6f6e 2074 6f77 6b72 202e 6649 7920     t not work. If y
c0ded8fb:	756f 6120 6572 7520 6973 676e 4c20 6465     ou are using Led
c0ded90b:	6567 2072 6157 6c6c 7465 202c 6572 656a     ger Wallet, reje
c0ded91b:	7463 7420 6568 7420 6172 736e 6361 6974     ct the transacti
c0ded92b:	6e6f 6120 646e 7420 7972 6120 6167 6e69     on and try again
c0ded93b:	0a2e 470a 7465 6820 6c65 2070 7461 6c20     ...Get help at l
c0ded94b:	6465 6567 2e72 6f63 2f6d 3165 0031 6552     edger.com/e11.Re
c0ded95b:	656a 7463 7420 6172 736e 6361 6974 6e6f     ject transaction
c0ded96b:	003f 7243 7469 6369 6c61 7420 7268 6165     ?.Critical threa
c0ded97b:	2074 6564 6574 7463 6465 0a2e 6c42 6e69     t detected..Blin
c0ded98b:	2064 6973 6e67 6e69 2067 6572 7571 7269     d signing requir
c0ded99b:	6465 002e 6e55 6469 6e65 6974 6966 6465     ed..Unidentified
c0ded9ab:	7220 7369 006b 6853 776f 6120 2073 5251      risk.Show as QR
c0ded9bb:	4100 6f6d 6e75 0074 6f47 6220 6361 206b     .Amount.Go back 
c0ded9cb:	6f74 6f20 6570 6172 6974 6e6f 5400 6172     to operation.Tra
c0ded9db:	736e 6361 6974 6e6f 4320 6568 6b63 7520     nsaction Check u
c0ded9eb:	616e 6176 6c69 6261 656c 0a2e 6c42 6e69     navailable..Blin
c0ded9fb:	2064 6973 6e67 6e69 2067 6572 7571 7269     d signing requir
c0deda0b:	6465 002e 6441 7264 7365 2073 6576 6972     ed..Address veri
c0deda1b:	6966 6465 5300 6977 6570 7420 206f 6f63     fied.Swipe to co
c0deda2b:	746e 6e69 6575 2500 2073 7325 250a 0073     ntinue.%s %s.%s.
c0deda3b:	7468 7074 3a73 2f2f 7325 4100 6572 7920     https://%s.Are y
c0deda4b:	756f 7320 7275 2065 6f74 610a 6c6c 776f     ou sure to.allow
c0deda5b:	6420 6d75 796d 3220 690a 206e 7274 6e61      dummy 2.in tran
c0deda6b:	6173 7463 6f69 736e 003f 7254 6e61 6173     sactions?.Transa
c0deda7b:	7463 6f69 206e 6973 6e67 6465 4500 534e     ction signed.ENS
c0deda8b:	6e20 6d61 7365 6120 6572 7220 7365 6c6f      names are resol
c0deda9b:	6576 2064 7962 4c20 6465 6567 2072 6162     ved by Ledger ba
c0dedaab:	6b63 6e65 2e64 5300 6365 7275 7469 2079     ckend..Security 
c0dedabb:	6572 6f70 7472 4400 7665 6c65 706f 7265     report.Developer
c0dedacb:	2500 0a73 7325 2520 0073 6c41 6f6c 2077     .%s.%s %s.Allow 
c0dedadb:	7564 6d6d 2079 0a31 6e69 7420 6172 736e     dummy 1.in trans
c0dedaeb:	6361 6974 6e6f 0073 6953 6e67 7420 6172     actions.Sign tra
c0dedafb:	736e 6361 6974 6e6f 740a 206f 6573 646e     nsaction.to send
c0dedb0b:	4220 4c4f 5900 7365 202c 6b73 7069 2500      BOL.Yes, skip.%
c0dedb1b:	2073 6572 6f70 7472 4700 206f 6162 6b63     s report.Go back
c0dedb2b:	7420 206f 7274 6e61 6173 7463 6f69 006e      to transaction.
c0dedb3b:	6953 6e67 6d20 7365 6173 6567 4200 6361     Sign message.Bac
c0dedb4b:	206b 6f74 7320 6661 7465 0079 654d 7373     k to safety.Mess
c0dedb5b:	6761 2065 6973 6e67 6465 4300 6f6c 6573     age signed.Close
c0dedb6b:	5300 6769 206e 7274 6e61 6173 7463 6f69     .Sign transactio
c0dedb7b:	006e 654c 6764 7265 5300 6163 206e 6f74     n.Ledger.Scan to
c0dedb8b:	7620 6569 2077 7566 6c6c 7220 7065 726f      view full repor
c0dedb9b:	0074 6854 7369 7420 6172 736e 6361 6974     t.This transacti
c0dedbab:	6e6f 6f20 2072 656d 7373 6761 2065 6163     on or message ca
c0dedbbb:	6e6e 746f 6220 2065 6564 6f63 6564 2064     nnot be decoded 
c0dedbcb:	7566 6c6c 2e79 4920 2066 6f79 2075 6863     fully. If you ch
c0dedbdb:	6f6f 6573 7420 206f 6973 6e67 202c 6f79     oose to sign, yo
c0dedbeb:	2075 6f63 6c75 2064 6562 6120 7475 6f68     u could be autho
c0dedbfb:	6972 697a 676e 6d20 6c61 6369 6f69 7375     rizing malicious
c0dedc0b:	6120 7463 6f69 736e 7420 6168 2074 6163      actions that ca
c0dedc1b:	206e 7264 6961 206e 6f79 7275 7720 6c61     n drain your wal
c0dedc2b:	656c 2e74 0a0a 654c 7261 206e 6f6d 6572     let...Learn more
c0dedc3b:	203a 656c 6764 7265 632e 6d6f 652f 0038     : ledger.com/e8.
c0dedc4b:	6341 6563 7470 7420 7268 6165 2074 6e61     Accept threat an
c0dedc5b:	2064 6f63 746e 6e69 6575 4100 6c6c 776f     d continue.Allow
c0dedc6b:	6420 6d75 796d 3220 690a 206e 7274 6e61      dummy 2.in tran
c0dedc7b:	6173 7463 6f69 736e 5600 7265 6973 6e6f     sactions.Version
c0dedc8b:	4d00 726f 0065 6854 7369 7420 6172 736e     .More.This trans
c0dedc9b:	6361 6974 6e6f 6320 6e61 6f6e 2074 6562     action cannot be
c0dedcab:	4320 656c 7261 5320 6769 656e 0064 6559      Clear Signed.Ye
c0dedcbb:	2c73 7220 6a65 6365 0074 6143 636e 6c65     s, reject.Cancel
c0dedccb:	5400 6968 2073 7274 6e61 6173 7463 6f69     .This transactio
c0dedcdb:	206e 6177 2073 6373 6e61 656e 2064 7361     n was scanned as
c0dedceb:	6d20 6c61 6369 6f69 7375 6220 2079 6557      malicious by We
c0dedcfb:	3362 4320 6568 6b63 2e73 2500 2064 666f     b3 Checks..%d of
c0dedd0b:	2520 0064 6b53 7069 7220 7665 6569 3f77      %d.Skip review?
c0dedd1b:	4200 696c 646e 7320 6769 696e 676e 7220     .Blind signing r
c0dedd2b:	7165 6975 6572 0064 755b 6b6e 6f6e 6e77     equired.[unknown
c0dedd3b:	005d 6952 6b73 6420 7465 6365 6574 0064     ].Risk detected.
c0dedd4b:	6c42 6e69 2064 6973 6e67 6e69 2067 6572     Blind signing re
c0dedd5b:	7571 7269 6465 002e 6e55 6469 6e65 6974     quired..Unidenti
c0dedd6b:	6966 6465 7420 7268 6165 0074 7243 7469     fied threat.Crit
c0dedd7b:	6369 6c61 7420 7268 6165 0074 6341 6563     ical threat.Acce
c0dedd8b:	7470 7220 7369 206b 6e61 2064 6f63 746e     pt risk and cont
c0dedd9b:	6e69 6575 5400 6968 2073 7274 6e61 6173     inue.This transa
c0deddab:	7463 6f69 276e 2073 6564 6174 6c69 2073     ction's details 
c0deddbb:	7261 2065 6f6e 2074 7566 6c6c 2079 6576     are not fully ve
c0deddcb:	6972 6966 6261 656c 202e 6649 7920 756f     rifiable. If you
c0dedddb:	7320 6769 2c6e 7920 756f 6320 756f 646c      sign, you could
c0deddeb:	6c20 736f 2065 6c61 206c 6f79 7275 6120      lose all your a
c0deddfb:	7373 7465 2e73 4700 206f 6162 6b63 7420     ssets..Go back t
c0dede0b:	206f 656d 7373 6761 0065 6f50 6574 746e     o message.Potent
c0dede1b:	6169 206c 6972 6b73 6420 7465 6365 6574     ial risk detecte
c0dede2b:	2e64 420a 696c 646e 7320 6769 696e 676e     d..Blind signing
c0dede3b:	7220 7165 6975 6572 2e64 4d00 444c 4153      required..MLDSA
c0dede4b:	5400 6968 2073 6361 6f63 6e75 2074 616c     .This account la
c0dede5b:	6562 206c 6f63 656d 2073 7266 6d6f 7920     bel comes from y
c0dede6b:	756f 2072 6441 7264 7365 2073 6f42 6b6f     our Address Book
c0dede7b:	6920 206e 654c 6764 7265 5720 6c61 656c      in Ledger Walle
c0dede8b:	2e74 4e00 206f 6874 6572 7461 6420 7465     t..No threat det
c0dede9b:	6365 6574 2064 7962 5420 6172 736e 6361     ected by Transac
c0dedeab:	6974 6e6f 4320 6568 6b63 002e 6c42 6e69     tion Check..Blin
c0dedebb:	2064 6973 6e67 6e69 2067 6861 6165 0064     d signing ahead.
c0dedecb:	654d 7373 6761 2065 6572 656a 7463 6465     Message rejected
c0dededb:	5200 6a65 6365 2074 706f 7265 7461 6f69     .Reject operatio
c0dedeeb:	3f6e 3000 3231 3433 3635 3837 4139 4342     n?.0123456789ABC
c0dedefb:	4544 0046 656e 7774 726f 2e6b 4200 4c4f     DEF.network..BOL
c0dedf0b:	2520 2a2e 0073 6441 7264 7365 0073 6649      %.*s.Address.If
c0dedf1b:	7920 756f 7227 2065 7573 6572 7920 756f      you're sure you
c0dedf2b:	6420 6e6f 7427 6e20 6565 2064 6f74 7220      don't need to r
c0dedf3b:	7665 6569 2077 6c61 206c 6966 6c65 7364     eview all fields
c0dedf4b:	202c 6f79 2075 6163 206e 6b73 7069 7320     , you can skip s
c0dedf5b:	7274 6961 6867 2074 6f74 7320 6769 696e     traight to signi
c0dedf6b:	676e 002e 6854 7369 7420 6172 736e 6361     ng..This transac
c0dedf7b:	6974 6e6f 7720 7361 7320 6163 6e6e 6465     tion was scanned
c0dedf8b:	6120 2073 6972 6b73 2079 7962 5720 6265      as risky by Web
c0dedf9b:	2033 6843 6365 736b 002e 7544 6d6d 2079     3 Checks..Dummy 
c0dedfab:	0031 2049 6e75 6564 7372 6174 646e 202c     1.I understand, 
c0dedfbb:	6f63 666e 7269 006d 6f4e 7420 7268 6165     confirm.No threa
c0dedfcb:	2074 6564 6574 7463 6465 5400 6172 736e     t detected.Trans
c0dedfdb:	6361 6974 6e6f 7220 6a65 6365 6574 0064     action rejected.
c0dedfeb:	6f47 6220 6361 206b 6f74 7220 7665 6569     Go back to revie
c0dedffb:	0077 7243 7469 6369 6c61 7420 7268 6165     w.Critical threa
c0dee00b:	2074 6564 6574 7463 6465 002e 6953 6e67     t detected..Sign
c0dee01b:	6f20 6570 6172 6974 6e6f 4400 7465 6365      operation.Detec
c0dee02b:	6574 2064 7962 2520 0073 5300 696b 0070     ted by %s..Skip.
c0dee03b:	6f50 6574 746e 6169 206c 6972 6b73 6420     Potential risk d
c0dee04b:	7465 6365 6574 2e64 4e00 206f 6874 6572     etected..No thre
c0dee05b:	7461 6420 7465 6365 6574 2064 7962 5420     at detected by T
c0dee06b:	6172 736e 6361 6974 6e6f 4320 6568 6b63     ransaction Check
c0dee07b:	6220 7475 6220 696c 646e 7320 6769 696e      but blind signi
c0dee08b:	676e 7220 7165 6975 6572 2e64 5000 746f     ng required..Pot
c0dee09b:	6e65 6974 6c61 7220 7369 006b 6556 6972     ential risk.Veri
c0dee0ab:	7966 4220 4c4f 6120 6464 6572 7373 4300     fy BOL address.C
c0dee0bb:	6e6f 6974 756e 2065 6e61 7779 7961 5100     ontinue anyway.Q
c0dee0cb:	6975 2074 7061 0070 7753 7069 2065 6f74     uit app.Swipe to
c0dee0db:	7220 7665 6569 0077 6854 7369 6120 7070      review.This app
c0dee0eb:	6520 616e 6c62 7365 7320 6769 696e 676e      enables signing
c0dee0fb:	740a 6172 736e 6361 6974 6e6f 2073 6e6f     .transactions on
c0dee10b:	7420 6568 5400 6172 736e 6361 6974 6e6f      the.Transaction
c0dee11b:	4320 6568 6b63 6420 6469 276e 2074 6966      Check didn't fi
c0dee12b:	646e 6120 796e 7420 7268 6165 2c74 6220     nd any threat, b
c0dee13b:	7475 6120 776c 7961 2073 6572 6976 7765     ut always review
c0dee14b:	7420 6172 736e 6361 6974 6e6f 6420 7465      transaction det
c0dee15b:	6961 736c 6320 7261 6665 6c75 796c 002e     ails carefully..
c0dee16b:	6f43 666e 7269 006d 6552 656a 7463 6d20     Confirm.Reject m
c0dee17b:	7365 6173 6567 003f 6649 7920 756f 7320     essage?.If you s
c0dee18b:	6769 206e 6874 7369 7420 6172 736e 6361     ign this transac
c0dee19b:	6974 6e6f 202c 6f79 2075 6f63 6c75 2064     tion, you could 
c0dee1ab:	6f6c 736f 2065 6c61 206c 6f79 7275 6120     loose all your a
c0dee1bb:	7373 7465 2e73 4520 7078 6f6c 6572 7320     ssets. Explore s
c0dee1cb:	6661 7265 6120 746c 7265 616e 6974 6576     afer alternative
c0dee1db:	3a73 6c20 6465 6567 2e72 6f63 2f6d 6e69     s: ledger.com/in
c0dee1eb:	6574 7267 7461 6465 612d 7070 0073          tegrated-apps.

c0dee1f9 <handler_cmd_verify_dilithium.sig>:
c0dee1f9:	7c23 887b 7320 2c3d 53f3 f845 51a8 6099     #|{. s=,.SE..Q.`
c0dee209:	6761 7055 42ce 3e92 cde2 7e43 b441 b3a9     agUp.B.>..C~A...
c0dee219:	4891 711f e9ec b6e0 584c 734a 0d71 688d     .H.q....LXJsq..h
c0dee229:	938a c00a 02bf f5ab 6e7c 0947 24e7 e4a9     ........|nG..$..
c0dee239:	8c17 9062 bc18 730b 7ab3 7d08 e7d3 8dea     ..b....s.z.}....
c0dee249:	5ba6 4511 febc 1aed 127c 6023 af7e ef0a     .[.E....|.#`~...
c0dee259:	ab04 602b 74d4 9460 625c 4f1a 5693 0b13     ..+`.t`.\b.O.V..
c0dee269:	5ecb f094 710c 1c0d 99fe 5ec0 cfa0 079e     .^...q.....^....
c0dee279:	5779 367f 5671 1603 24bf 9cec 57f2 132b     yW.6qV...$...W+.
c0dee289:	a5e9 5f0d cabc dc4d 81e4 40f7 1ddb 207e     ..._..M....@..~ 
c0dee299:	6802 9645 d629 b56e b5a0 3a60 46d6 4a8a     .hE.).n...`:.F.J
c0dee2a9:	4904 848d 62df 39ee 6f4d a3c5 b1a7 9def     .I...b.9Mo......
c0dee2b9:	cee0 88be 8e16 6f5d 1e77 1efc 15a3 8be7     ......]ow.......
c0dee2c9:	cb83 0e2c 8ff8 7e16 70e1 fddf 9adb a5ca     ..,....~.p......
c0dee2d9:	38df f10a 03f8 7453 6a6b 3055 fdc9 45e8     .8....StkjU0...E
c0dee2e9:	ec8e b499 dc78 67c6 3632 77b2 1cc4 9ede     ....x..g26.w....
c0dee2f9:	58ba 986b 1408 cf6c 6fae bed8 d0a1 4f65     .Xk...l..o....eO
c0dee309:	ca65 58c7 b73a 0705 b111 22a3 dad8 6a6c     e..X:......"..lj
c0dee319:	16ad 8a60 5390 55a6 0d58 0166 c96f face     ..`..S.UX.f.o...
c0dee329:	7fa1 fee0 08d5 bd0d aa4d 9296 67f9 2494     ........M....g.$
c0dee339:	283a 6713 d57a e142 64e1 a9ef 1b34 fdd0     :(.gz.B..d..4...
c0dee349:	95ba 1b6a 594b 1a4f fb70 143c d1ae 7b21     ..j.KYO.p.<...!{
c0dee359:	1d86 74cb 569a 81b2 5d20 f57d 72d4 8fa0     ...t.V.. ]}..r..
c0dee369:	76b3 5595 dd24 01a1 cc7b e88b 6857 1d19     .v.U$...{...Wh..
c0dee379:	180e 0f57 f2a8 bd63 2a59 538d cf58 6a7f     ..W...c.Y*.SX..j
c0dee389:	8ec2 660c 7647 f5ac 681b f29c 66e9 cb03     ...fGv...h...f..
c0dee399:	e17d 7849 56cc 08f0 a219 b517 5eae 083c     }.Ix.V.......^<.
c0dee3a9:	483c 5a7f c023 3979 7c73 d69e a5b2 041e     <H.Z#.y9s|......
c0dee3b9:	9df3 69dc 56da 889b 4f05 47c6 0969 5680     ...i.V...O.Gi..V
c0dee3c9:	35d8 7539 0c9d 87c4 11a7 5b12 3df7 f6e1     .59u.......[.=..
c0dee3d9:	1667 f595 3663 5345 6c4e d3b2 6474 3c5c     g...c6ESNl..td\<
c0dee3e9:	d39f 539c c447 2fb8 a4b1 fb52 13b6 3c7f     ...SG../..R....<
c0dee3f9:	0e47 fcb1 4072 c2a5 81a2 dda1 6745 0708     G...r@......Eg..
c0dee409:	2b55 0dcc 0a16 7567 dfb6 bceb 5068 b70e     U+....gu....hP..
c0dee419:	1e6e db96 a01c 14f3 c913 876f 4a35 07b7     n.........o.5J..
c0dee429:	771c c986 7de6 640d 2876 d62b af76 fe23     .w...}.dv(+.v.#.
c0dee439:	71eb b727 4d86 a7ac 992f 854a 10bd f6f1     .q'..M../.J.....
c0dee449:	a16e 0824 f982 28b6 f195 0a9c d1aa 35cf     n.$....(.......5
c0dee459:	a8cd 311b 9319 4d19 7397 d937 07a1 a728     ...1...M.s7...(.
c0dee469:	d8f3 8d2c e37f d75c 7d04 3c23 fe8e 9b1d     ..,...\..}#<....
c0dee479:	b266 8c82 589b c22d 60e4 8356 e6ac 76be     f....X-..`V....v
c0dee489:	35ba 6d1b 1d7a 3ab2 8581 174d 60e9 7d1e     .5.mz..:..M..`.}
c0dee499:	9bc6 aeea 2664 30ef 0073 8d50 4b20 3043     ....d&.0s.P. KC0
c0dee4a9:	e026 4d53 f0d0 3b12 2506 2425 9f76 862f     &.SM...;.%%$v./.
c0dee4b9:	1c77 f58c 82ee b3f0 01b3 2808 00a3 8857     w..........(..W.
c0dee4c9:	af71 609b f331 4243 2dcb a45e 3c09 b650     q..`1.CB.-^..<P.
c0dee4d9:	b121 4802 a3d0 1c2c 68d5 a54c 5f0b 8698     !..H..,..hL.._..
c0dee4e9:	dfe2 ec6d 21a3 d53b 79cd 3bd6 c85d 6b26     ..m..!;..y.;].&k
c0dee4f9:	4deb be80 d8ee 9e2c 01e8 35ed a9c6 99f6     .M....,....5....
c0dee509:	e847 e706 1791 5b3b 3e88 1920 7325 5ee8     G.....;[.> .%s.^
c0dee519:	0370 9cf9 b45a e717 032f 3e56 3bb9 3f16     p...Z.../.V>.;.?
c0dee529:	234c 6700 8c5e b91a 0cf8 2cf6 b188 6f87     L#.g^......,...o
c0dee539:	bdd0 5842 e0e0 da83 2e71 1f34 cebb 37ef     ..BX....q.4....7
c0dee549:	9ed5 0f09 ca6e b30c e6e8 feb7 7f1c c335     ....n.........5.
c0dee559:	dba9 8c95 73d2 c5fc b281 e385 3c0e 7135     .....s.......<5q
c0dee569:	014f edd2 06a3 e6a6 966d d409 88ae 8b24     O.......m.....$.
c0dee579:	6af7 1a99 8bcb 3283 aa55 cbaf 4927 008d     .j.....2U...'I..
c0dee589:	ff9e a50a 4e26 7418 7eb1 46b6 cedf 0747     ....&N.t.~.F..G.
c0dee599:	bfe8 46b9 bfba f7a4 feaf 8c38 5606 dcb9     ...F......8..V..
c0dee5a9:	8b4a 67bc 640e 26d4 db76 3c5b 17d0 6dce     J..g.d.&v.[<...m
c0dee5b9:	e252 7d54 7443 665e 9bed a21c 8522 5494     R.T}Ct^f...."..T
c0dee5c9:	4c6b 632c 526f de4e 5dc6 de9a a960 3bfd     kL,coRN..]..`..;
c0dee5d9:	8625 16af da9a 5764 854d 4c59 acba 385f     %.....dWM.YL.._8
c0dee5e9:	d327 31c4 517e 2c72 7f49 dc09 4baa 4f7c     '..1~Qr,I....K|O
c0dee5f9:	bd03 ef4f a83b d347 258d cc2f d7ec 07e2     ..O.;.G..%/.....
c0dee609:	0f83 d6e4 3307 95b4 b527 9ed2 d271 36b7     .....3..'...q..6
c0dee619:	7da9 349d 5f47 81b0 bcd0 1088 7f50 2a67     .}.4G_......P.g*
c0dee629:	32e0 bc32 a332 713c 3f1a 8212 e16f 1f80     .22.2.<q.?..o...
c0dee639:	9640 6120 d3e3 ebfd 6833 1ee9 89ab da2c     @. a....3h....,.
c0dee649:	8fc1 060e 31a4 672e 45f4 8d57 afbe f554     .....1.g.EW...T.
c0dee659:	cbc3 aedb b20a 84dd 5a52 2532 373b d820     ........RZ2%;7 .
c0dee669:	9b3c 503e f0ec 4c55 d189 d35b b052 6b63     <.>P..UL..[.R.ck
c0dee679:	b740 389d 5cfc 5eca 6c69 f01f 2fcd 3409     @..8.\.^il.../.4
c0dee689:	3efb dcaa 1bcc 5f6d 55ac b644 5cfe 0a6e     .>....m_.UD..\n.
c0dee699:	7c31 cf4f 2bff 701f 8b71 4e7e f37c 3bdb     1|O..+.pq.~N|..;
c0dee6a9:	c0f1 0302 f51e 040c df9b 3bfc 3578 0b8e     ...........;x5..
c0dee6b9:	0ee2 7eb5 1bd4 04ae d0cd 9190 efaf 57a4     ...~...........W
c0dee6c9:	aea8 33bb 3776 e00e 7f4a d448 b744 17f1     ...3v7..J.H.D...
c0dee6d9:	da0e 8eb6 970b 8f0e 85c2 7609 6c53 bbe3     ...........vSl..
c0dee6e9:	5814 f06a ae6b 17ac 7812 e9a5 e049 f70a     .Xj.k....x..I...
c0dee6f9:	b0cd b8d4 2441 cc4c 79cc f37f 41fd 0787     ....A$L..y...A..
c0dee709:	4c7d 339d 3c87 0bab e6f6 5990 901b f821     }L.3.<.....Y..!.
c0dee719:	520c 74d4 0594 c11a 75ff 4b55 196b 9007     .R.t.....uUKk...
c0dee729:	c53d ec30 426b 25d0 23f7 d4d7 39e5 2e22     =.0.kB.%.#...9".
c0dee739:	3e68 5347 4125 5ff2 b014 07c0 93b0 ccb7     h>GS%A._........
c0dee749:	c0bf 2e17 e578 5143 637f 4921 42d8 1a82     ....x.CQ.c!I.B..
c0dee759:	412b 0d4d aab9 39c1 5e8b c299 ef69 304e     +AM....9.^..i.N0
c0dee769:	133e f973 dfbc 1182 5cb5 ec65 f919 043a     >.s......\e...:.
c0dee779:	a722 8c14 d4ab 11c3 1af1 ef49 57c7 4d53     ".........I..WSM
c0dee789:	ca00 c8e3 b84c e949 1975 4531 8953 f817     ....L.I.u.1ES...
c0dee799:	2512 96cc 7b45 a2c1 8fab 2aa7 85fa dc63     .%..E{.....*..c.
c0dee7a9:	4731 ff66 9ad1 db10 da92 9abf 5606 6706     1Gf..........V.g
c0dee7b9:	d328 f584 2298 a99f 904e 8a6b 2232 dfb0     (...."..N.k.2"..
c0dee7c9:	64e1 d9af 16c1 1cf3 5e31 3fe5 0bfb 580d     .d......1^.?...X
c0dee7d9:	e02e faab 59d2 b4f1 5c09 a300 6747 d43f     .....Y...\..Gg?.
c0dee7e9:	7ee1 d8a7 74f9 f2db 90ed 1c31 67b1 1ad6     .~...t....1..g..
c0dee7f9:	eaeb 0b7b a317 5b4f 1f72 afec bccf ea3f     ..{...O[r.....?.
c0dee809:	09c7 811b 1f85 5b8a 1a05 8edd 4a72 3350     .......[....rJP3
c0dee819:	a586 703b 06d1 6ad8 8199 573d f79e 065a     ..;p...j..=W..Z.
c0dee829:	f75c c10c 9dab c380 019a c5d3 6094 ef49     \............`I.
c0dee839:	8ded 384e 5c3b 58a6 a927 e0ce ba8c 2a79     ..N8;\.X'.....y*
c0dee849:	3390 f747 7a54 7464 8e5f d717 0d1a d740     .3G.Tzdt_.....@.
c0dee859:	151d 4b48 689a c814 3062 05aa 9e53 7c90     ..HK.h..b0..S..|
c0dee869:	dadd fb5e 6231 56c3 58f3 bc29 a232 c88b     ..^.1b.V.X).2...
c0dee879:	c90e 4e45 fe5b 4ac2 d76d 7546 b9e3 6413     ..EN[..Jm.Fu...d
c0dee889:	3d7f 6a17 7367 a0c1 0ee4 17dd d1ec ee3a     .=.jgs........:.
c0dee899:	9334 0b71 5411 55f8 59f2 621e 70cc c673     4.q..T.U.Y.b.ps.
c0dee8a9:	bb08 77aa 4e10 498d b693 f87c 651f 89af     ...w.N.I..|..e..
c0dee8b9:	c9c8 691d 755f da60 8aa6 41d1 cb60 f47d     ...i_u`....A`.}.
c0dee8c9:	a6e7 181b 2560 2053 b8db 6713 f16d 5c28     ....`%S ...gm.(\
c0dee8d9:	5a01 99ec 7b4d cec0 7529 1614 1eb3 5bd1     .Z..M{..)u.....[
c0dee8e9:	1769 6829 aadd 5651 b892 bcfe 4ecb 9832     i.)h..QV.....N2.
c0dee8f9:	bfe8 9c16 b920 9065 803b 6ff2 a620 bda3     .... .e.;..o ...
c0dee909:	ac5f bcd1 c638 17c8 3be2 51f3 ff87 f975     _...8....;.Q..u.
c0dee919:	ae82 d69e 435a 19f6 619b 84ae 3e68 ef1b     ....ZC...a..h>..
c0dee929:	9ccf 7801 eab8 9028 6af9 086e 3dd3 c344     ...x..(..jn..=D.
c0dee939:	50ce ccd9 1cbd 96df 6bdf 5e2f 1c8f b06c     .P.......k/^..l.
c0dee949:	0043 f6f7 83d4 8310 ae90 eda8 b031 327b     C...........1.{2
c0dee959:	7cc8 2a54 75b4 6d94 5e52 c124 2d6b fb0a     .|T*.u.mR^$.k-..
c0dee969:	6886 477e e7cc b5ab fcb7 d641 95a9 593a     .h~G......A...:Y
c0dee979:	b2a8 d021 b757 8493 fa5c 14b4 6b72 5337     ..!.W...\...rk7S
c0dee989:	7cd8 0202 fb53 7293 6322 eece a693 cf6a     .|..S..r"c....j.
c0dee999:	3c16 eb86 d67b 3621 0ef7 14c4 56b5 6228     .<..{.!6.....V(b
c0dee9a9:	20f1 ee2d feb9 79af 4181 e26b 9ca0 7c0e     . -....y.Ak....|
c0dee9b9:	181f 95ee 4b31 d054 7b49 29ac d986 9e0e     ....1KT.I{.)....
c0dee9c9:	99d3 2002 6ae9 62e1 112e eef2 c191 61b1     ... .j.b.......a
c0dee9d9:	e728 4a38 fa87 67bc c731 b0b0 b70b fd07     (.8J...g1.......
c0dee9e9:	be1a 9203 5ec9 434c 6054 7db4 9921 9b82     .....^LCT`.}!...
c0dee9f9:	6b07 f64e 1ab1 28d3 ca25 57d8 a694 ee74     .kN....(%..W..t.
c0deea09:	d6fd 3d17 39ca bfdc 7c39 951b 3831 720a     ...=.9..9|..18.r
c0deea19:	42d1 d4b7 5d00 4f88 d5cb 1192 7882 fc20     .B...].O.....x .
c0deea29:	2b5b 05c6 c7e5 c317 121e d14c 71f5 d480     [+........L..q..
c0deea39:	59ba 3388 97f0 6f05 9b80 2171 be4f 5fe2     .Y.3...o..q!O.._
c0deea49:	e77f 4ef1 f83d 6bcb 6cbf 3d3f 28e8 f785     ...N=..k.l?=.(..
c0deea59:	fd1b 4e87 7a6b 1dd1 21b7 d70f 0c3c aacb     ...Nkz...!..<...
c0deea69:	f060 a808 596a 86a9 0c0c 1685 da72 b017     `...jY......r...
c0deea79:	d377 7759 2cc5 5bf3 6df0 0f45 c03e 9761     w.Yw.,.[.mE.>.a.
c0deea89:	627f 2473 5ac5 a3ad c661 b3ab 77de 28e8     .bs$.Z..a....w.(
c0deea99:	3aa6 6def 7cc3 0cdf 3baf c398 09a4 cde3     .:.m.|...;......
c0deeaa9:	d2bd d0ed 4fdc 1aeb de6e f78d 2c25 58b6     .....O..n...%,.X
c0deeab9:	3f41 7222 4281 4d30 027d 6eb0 8b43 8110     A?"r.B0M}..nC...
c0deeac9:	774f a431 e789 6b9b 6b8a ca0f 636b 9afe     Ow1....k.k..kc..
c0deead9:	ff61 9429 4b70 f9df e118 6aae df99 d307     a.).pK.....j....
c0deeae9:	8ae1 6821 4690 9753 edb6 f4a5 d27a 16f2     ..!h.FS.....z...
c0deeaf9:	7581 b844 0c84 f16a 4d70 719a 2ca0 b673     .uD...j.pM.q.,s.
c0deeb09:	9fa2 fbb6 7817 977d 98a8 9047 47a3 0536     .....x}...G..G6.
c0deeb19:	0706 3d09 553f 9b7d afa5 ceb8 d4d3 e1de     ...=?U}.........
c0deeb29:	eee8 f8f1 01fc 4717 554f 968c b4b2 d6c2     .......GOU......
c0deeb39:	f8d9 9143 aa98 cac0 d3d2 edea 1a0d 3d24     ..C...........$=
c0deeb49:	4544 8664 dccf e6e4 00f1 0000 0000 0000     DEd.............
	...
c0deeb69:	2215 392c 1cd8 8d4d 4f73 fbcb deea 3f3d     .",9..M.sO....=?
c0deeb79:	038a aa9f 2c2a 5799 35e8 55ad 2eb2 bf75     ....*,.W.5.U..u.
c0deeb89:	bb57 6a55                                    W.Uj.

c0deeb8e <handler_cmd_verify_dilithium.pk>:
c0deeb8e:	7bdc a2c9 b6e0 66dc 3a82 fbe4 97de 0c1c     .{.....f.:......
c0deeb9e:	46fc d9f9 bf6b ebbe 47b3 e00a a0a5 9f13     .F..k....G......
c0deebae:	6add e56c 76bc 4fe9 9eaa 5092 d4ab e0ce     .jl..v.O...P....
c0deebbe:	f12c 46ee e9a8 e19c 732d 7895 a71f 9051     ,..F....-s.x..Q.
c0deebce:	2721 a33d 5536 7219 fb4e 79e2 d6ad 5fc3     !'=.6U.rN..y..._
c0deebde:	c992 2bd4 2803 f132 29bf beeb 3ecd 7ac8     ...+.(2..)...>.z
c0deebee:	f33a 33da 11c6 f3f7 a35f ca5a 74b1 4f02     :..3...._.Z..t.O
c0deebfe:	8911 e279 f23b 06fe 6992 eca2 fb45 b9c1     ..y.;....i..E...
c0deec0e:	fbc1 1f0e 4805 6a6a 3e83 8ab4 29dc 6460     .....Hjj.>...)`d
c0deec1e:	9a1d ebf6 738b b181 55ec 89d8 6bf2 4d08     .....s...U...k.M
c0deec2e:	a1df edc9 969b 342d 9426 dece 8283 0953     ......-4&.....S.
c0deec3e:	dbd9 d66b 75ba 1382 3425 1e86 a044 8843     ..k..u..%4..D.C.
c0deec4e:	94a6 2424 7611 341d c0e7 d285 b782 c623     ..$$.v.4......#.
c0deec5e:	4859 aca2 4d76 0297 8ebd fed7 3199 d8d7     YH..vM.......1..
c0deec6e:	4a70 e639 8850 f344 48f8 c343 5905 e64f     pJ9.P.D..HC..YO.
c0deec7e:	40e5 084e 8ef1 39d0 65ac cb63 34aa cab0     .@N....9.ec..4..
c0deec8e:	3238 9902 25d6 c06e 8df7 1f42 8108 d459     82...%n...B...Y.
c0deec9e:	c49d cb39 39c5 58a5 a384 4eeb 9cfc 90f1     ..9..9.X...N....
c0deecae:	2fb4 3471 cb41 0097 4542 14d4 a337 7b9b     ./q4A...BE..7..{
c0deecbe:	fc77 2f60 fdbb 9a61 3642 1437 65b2 3c17     w.`/..a.B67..e.<
c0deecce:	68ae 8afd 3c1b bda2 ae30 c560 563e 5704     .h...<..0.`.>V.W
c0deecde:	4a7a 1f3b 0615 97e6 74c3 db32 83d8 3a55     zJ;......t2...U:
c0deecee:	8dac 2a38 253d f50c 9eb2 1b4d cbe2 53cd     ..8*=%....M....S
c0deecfe:	f01f 7ee0 c189 dbf7 d4c8 9a52 beee b555     ...~......R...U.
c0deed0e:	4dce 1402 debf 9ec6 0b08 efd3 cc36 a5a6     .M..........6...
c0deed1e:	3349 eff1 372f 7c86 380d 58fd b865 2979     I3../7.|.8.Xe.y)
c0deed2e:	5811 c708 59e2 5854 93e9 ccba 5a6c 9f3b     .X...YTX....lZ;.
c0deed3e:	2550 1e00 419b 7744 bf08 a0ba 2e46 63fa     P%...ADw....F..c
c0deed4e:	6c87 f742 9069 438b 542f 5085 398a 2432     .lB.i..C/T.P.92$
c0deed5e:	0596 d751 ad7e f4fa 1c41 49bc fffd f246     ..Q.~...A..I..F.
c0deed6e:	55f1 d6dd 30ec 7986 b705 8809 a08c 0ff3     .U...0.y........
c0deed7e:	5f93 d7b8 80f4 fc3c 5f7a 9077 18ca 991d     ._....<.z_w.....
c0deed8e:	21ca 62f2 691d c6a5 9cd4 b476 9d96 27a6     .!.b.i....v....'
c0deed9e:	a340 4778 3203 09b3 ab47 cc31 9bdb c7a0     @.xG.2..G.1.....
c0deedae:	25b6 9e87 4bec 1fd8 0002 23ba 4a50 c37d     .%...K.....#PJ}.
c0deedbe:	18b1 2abc 14b1 f15d f33a ccc8 f539 8777     ...*..].:...9.w.
c0deedce:	843b 1b91 853d bffb b14c 4d9e b136 930a     ;...=...L..M6...
c0deedde:	eb8e b578 dc99 6186 d65f c6ce 7beb 7a8f     ..x....a_....{.z
c0deedee:	5ffa 6b6d 9ee1 16a8 d330 cf6c f4b2 de87     ._mk....0.l.....
c0deedfe:	d050 46cf 8dda e33f 2851 0412 0e3c f23e     P..F..?.Q(..<.>.
c0deee0e:	23d7 b01f a3b0 0f5a 83b2 30be 24a1 8077     .#....Z....0.$w.
c0deee1e:	0af3 29e0 8b4e 586f 3897 db3e 5589 f595     ...)N.oX.8>..U..
c0deee2e:	5277 f54d 9345 f9cd b427 7696 ee16 1339     wRM.E...'..v..9.
c0deee3e:	d6e4 9bb2 bd0d 337c a4a2 4e5e b1f1 4e95     ......|3..^N...N
c0deee4e:	d9a5 e31c fc7e 0213 cee7 a902 9573 5d56     ....~.......s.V]
c0deee5e:	a5a2 d3c5 b0fd 76d8 e984 c0b1 07ad 33ec     .......v.......3
c0deee6e:	2ddf d5fa e228 09ea d266 7da4 eed5 e788     .-..(...f..}....
c0deee7e:	657d 0d3c 4f00 01ab f065 7c75 a44d f30a     }e<..O..e.u|M...
c0deee8e:	e727 2519 c736 4799 0aa8 7a82 10a2 ac7d     '..%6..G...z..}.
c0deee9e:	e3fa bfde fac8 d6d3 80e0 d976 c538 a210     ..........v.8...
c0deeeae:	bd76 72f6 1f1a 7c08 69b1 5051 ad28 e25c     v..r...|.iQP(.\.
c0deeebe:	107a ab47 28d9 9309 a64c 893b 713f a3f9     z.G..(..L.;.?q..
c0deeece:	994a fdc0 3130 470c aae9 3937 0a4d 3bb7     J...01.G..79M..;
c0deeede:	4d25 a63c 9c9d 4955 47c9 ae9a 2624 c54a     %M<...UI.G..$&J.
c0deeeee:	64ea fdd3 1c82 6239 77ec 09e7 d3f9 c70b     .d....9b.w......
c0deeefe:	5ab6 e452 168c 06e8 5503 ac8c 81a1 1114     .ZR......U......
c0deef0e:	15c3 1f5d 9f94 cfc9 a99a 5a38 9971 9be9     ..].......8Zq...
c0deef1e:	7ae7 fa66 eed7 12d9 de58 b255 c8c4 9a3f     .zf.....X.U...?.
c0deef2e:	0a05 bede f0a5 5897 0df4 4aac 391c e84e     .......X...J.9N.
c0deef3e:	87d6 9187 d250 2664 5a89 93b1 148e 11ae     ....P.d&.Z......
c0deef4e:	76b3 4c25 fc91 3061 6943 f896 43ed 27bd     .v%L..a0Ci...C.'
c0deef5e:	20be 90ec 1167 111c c96e c24c 6cb0 1ac9     . ..g...n.L..l..
c0deef6e:	c513 0bd1 7ebd eaec 9247 7bf1 772b 1e63     .....~..G..{+wc.
c0deef7e:	45f1 fbe9 a841 aa3e c211 2ab7 fb48 fd90     .E..A.>....*H...
c0deef8e:	88bd 4c64 df4e b28a ce0d 1831 4b36 6a27     ..dLN.....1.6K'j
c0deef9e:	23c1 367b 92c8 346e ab6a 115a a01a 34bf     .#{6..n4j.Z....4
c0deefae:	511c 7b8b 9eff bb9d cb8b 2847 1b60 6037     .Q.{......G(`.7`
c0deefbe:	3e66 6567 3103 fbe6 ac54 fc82 4c41 ddb8     f>ge.1..T...AL..
c0deefce:	16fc 250a 1e31 27c5 e42d 1762 f8fe 92b9     ...%1..'-.b.....
c0deefde:	89ff 4f75 e3be f251 b91b 6c0b 0797 518b     ..uO..Q....l...Q
c0deefee:	980c 5033 1268 c866 d1fe 58f0 513c e751     ..3Ph.f....X<QQ.
c0deeffe:	feb8 723b 3192 9996 7c68 b6c6 fd41 68bd     ..;r.1..h|..A..h
c0def00e:	2894 3b54 fac0 ac1f 09c1 65de 27b6 c284     .(T;.......e.'..
c0def01e:	85d9 15ab 7dd7 f13a f62a 3ed0 188d a559     .....}:.*..>..Y.
c0def02e:	6853 8485 5ed7 73f6 dea1 0974 e13e c708     Sh...^.s..t.>...
c0def03e:	ff61 2cf3 7c21 1b23 290e da53 21f5 9242     a..,!|#..)S..!B.
c0def04e:	c064 3b96 a5c8 edcd 61dc 727a b985 ea34     d..;.....azr..4.
c0def05e:	dd51 cdb5 23ab edbc 6be8 6ee3 1b00 5cc6     Q....#...k.n...\
c0def06e:	e965 c9a1 af4b faf4 ebb8 8e5f 2ed4 77c3     e...K....._....w
c0def07e:	3642 fe33 0400 4291 7c46 c547 8ad5 0272     B63....BF|G...r.
c0def08e:	e9c8 4810 c141 f3f7 1480 6a5a 820a 578c     ...HA.....Zj...W
c0def09e:	3502 07e5 58ae a668 2f06 2b72 8fb9 bef6     .5...Xh../r+....
	...

c0def0b0 <settingContents>:
c0def0b0:	0000 0000 f0cc c0de 0001 0000               ............

c0def0bc <infoList>:
c0def0bc:	f104 c0de f10c c0de 0000 0000 0002 0000     ................

c0def0cc <contents>:
c0def0cc:	0007 0000 13f4 da7a 0002 0000 0000 0000     ......z.........
	...
c0def100:	0bb9 c0de                                   ....

c0def104 <INFO_TYPES>:
c0def104:	dc84 c0de dac2 c0de                         ........

c0def10c <INFO_CONTENTS>:
c0def10c:	d87d c0de db7d c0de 0000 0000               }...}.......

c0def118 <pqcrystals_dilithium_fips202_ref_KeccakF_RoundConstants>:
c0def118:	0001 0000 0000 0000 8082 0000 0000 0000     ................
c0def128:	808a 0000 0000 8000 8000 8000 0000 8000     ................
c0def138:	808b 0000 0000 0000 0001 8000 0000 0000     ................
c0def148:	8081 8000 0000 8000 8009 0000 0000 8000     ................
c0def158:	008a 0000 0000 0000 0088 0000 0000 0000     ................
c0def168:	8009 8000 0000 0000 000a 8000 0000 0000     ................
c0def178:	808b 8000 0000 0000 008b 0000 0000 8000     ................
c0def188:	8089 0000 0000 8000 8003 0000 0000 8000     ................
c0def198:	8002 0000 0000 8000 0080 0000 0000 8000     ................
c0def1a8:	800a 0000 0000 0000 000a 8000 0000 8000     ................
c0def1b8:	8081 8000 0000 8000 8080 0000 0000 8000     ................
c0def1c8:	0001 8000 0000 0000 8008 8000 0000 8000     ................

c0def1d8 <zetas>:
c0def1d8:	0000 0000 64f7 0000 3102 ffd8 1503 fff8     .....d...1......
c0def1e8:	9e44 0003 2118 fff4 a128 fff2 1e24 0007     D....!..(...$...
c0def1f8:	de2b 001b e92b 0023 84ad fffa 147f ffe0     +...+.#.........
c0def208:	9a75 002f fb09 ffd3 7a49 002f e527 0028     u./.....Iz/.'.(.
c0def218:	9658 0029 a070 000f 85a4 ffef b788 0036     X.).p.........6.
c0def228:	9d90 fff7 eaa0 ffee f968 0027 d37b ffdf     ........h.'.{...
c0def238:	add6 ffdf 1ae7 ffc5 a4f7 ffea fc98 ffcd     ................
c0def248:	d035 001a b422 ffff 3201 003d 45c5 0004     5..."....2=..E..
c0def258:	4a67 0029 7620 0001 f4cd 002e dec5 0035     gJ). v........5.
c0def268:	a503 ffe6 302c ffc9 47d4 ffd9 beaf 003b     ....,0...G....;.
c0def278:	1585 ffc5 8e7c ffd1 8a96 0036 3e41 ffd4     ....|.....6.A>..
c0def288:	0400 0036 6a4d fffb d69c 0023 c55d fff7     ..6.Mj....#.]...
c0def298:	123d ffe6 ead6 ffe6 7e1e 0035 af59 ffc5     =........~5.Y...
c0def2a8:	843f 0035 5617 ffdf 945c ffe7 738c 0038     ?.5..V..\....s8.
c0def2b8:	63a8 000c 1b9a 0008 8f76 000e 3853 003b     .c......v...S8;.
c0def2c8:	8534 003b fc30 ffd8 9d54 001f 4f2d ffd5     4.;.0...T...-O..
c0def2d8:	06e5 ffc4 ac81 ffe8 e1cf ffc7 9819 ffd1     ................
c0def2e8:	d65d ffe9 09ee 0035 35c7 0021 cfbb ffe7     ].....5..5!.....
c0def2f8:	cf75 ffec 9772 001d b072 ffc1 bcf6 fff0     u...r...r.......
c0def308:	5280 ffcf d2ae ffcf 90e0 ffc8 efca 0001     .R..............
c0def318:	10f2 0034 fe85 fff0 c638 0020 6e9f 0029     ..4.....8. ..n).
c0def328:	b7a3 ffd2 a44b ffc7 ba6d fff9 3409 ffda     ....K...m....4..
c0def338:	c282 fff5 4113 ffed a63b ffff 09f7 ffec     .....A..;.......
c0def348:	2bdd fffa 95d4 0014 4563 001c 2c62 ffea     .+......cE..b,..
c0def358:	fbe9 ffcc 0af0 0004 c417 0007 4588 002f     .............E/.
c0def368:	ad00 0000 36be ffef cd44 000d 675a 003c     .....6..D...Zg<.
c0def378:	2bca ffc7 de7e ffff 3948 0019 69c0 ffce     .+..~...H9...i..
c0def388:	756c 0024 c7df fffc 98a1 000b e808 ffeb     lu$.............
c0def398:	e46c 0002 c808 ffc9 36c2 0030 bff6 ffe3     l........60.....
c0def3a8:	3c93 ffdb 4ae0 fffd 1305 0014 7792 0014     .<...J.......w..
c0def3b8:	9e25 0013 d0e0 ffe7 9944 fff3 0802 ffea     %.......D.......
c0def3c8:	eea2 ffd1 c79c ffc4 a057 ffc8 97d9 003a     ........W.....:.
c0def3d8:	ea93 001f ff5a 0033 58d4 0023 41f8 003a     ....Z.3..X#..A:.
c0def3e8:	ff72 ffcc 3dfb 0022 ab9f ffda a422 ffc9     r....="....."...
c0def3f8:	12f5 0004 2587 0025 24f0 ffed 9b5d 0035     .....%%..$..].5.
c0def408:	48a0 ffca a2fc ffc6 bb56 ffed 45de ffcf     .H......V....E..
c0def418:	be5e 000d 5e1a 001c e0e6 000d 7f5a 000c     ^....^......Z...
c0def428:	8f83 0007 628a ffe7 5704 ffff 06fc fff8     .....b...W......
c0def438:	0021 fff6 5af6 ffd0 0084 001f ef86 0030     !....Z........0.
c0def448:	b97d ffc9 fcd6 fff7 4592 fff4 21c2 ffc9     }........E...!..
c0def458:	3919 0005 610c 0004 cd41 ffda b01b 003e     .9...a..A.....>.
c0def468:	72e7 0034 003b ffcd 7cc7 001a 1924 0003     .r4.;....|..$...
c0def478:	5ee5 002b 1199 0029 7a3a ffd8 4d71 0013     .^+...).:z..qM..
c0def488:	e11c 003d 0984 0013 f051 0025 5a46 0018     ..=.....Q.%.FZ..
c0def498:	8518 ffc6 14be 0013 3891 0028 db90 ffc9     .........8(.....
c0def4a8:	5089 ffd2 853f 001c 0b4b 001d f6a6 ffef     .P..?...K.......
c0def4b8:	a8be ffeb e11b 0012 5e3e ffcd 2d2f ffea     ........>^../-..
c0def4c8:	1de4 fff9 06c7 0014 7283 0032 0d6e ffe2     .........r2.n...
c0def4d8:	7953 ffec 4099 001d 2578 ffd9 05ad ffeb     Sy...@..x%......
c0def4e8:	e405 0016 dbe7 000b 1de8 0022 f8cf 0033     .........."...3.
c0def4f8:	b934 fff7 ca0c ffd4 7ff8 ffe6 d157 ffe3     4...........W...
c0def508:	911b ffd8 2c12 ffc7 10d8 0009 5e1f ffc6     .....,.......^..
c0def518:	4658 ffe1 1d8b 0025 73b7 0025 7c8f fffd     XF....%..s%..|..
c0def528:	dd98 001d 6898 0033 d4bb 0002 93a7 ffed     .....h3.........
c0def538:	6cbe ffcf 7c1c 0002 aa08 0018 fd71 002d     .l...|......q.-.
c0def548:	5ca5 000c 379a 0019 a167 ffc7 8c3d ffe4     .\...7..g...=...
c0def558:	a13c ffd1 c539 0035 0115 003b 1dc0 0004     <...9.5...;.....
c0def568:	c4f7 0021 1bf4 fff1 35e7 001a 340e 0007     ..!......5...4..
c0def578:	7d45 fff9 4cd0 001a 7cae ffe4 2668 001d     E}...L...|..h&..
c0def588:	8e98 ffe6 2633 ffef 05da fffc 7fdb ffc5     ....3&..........
c0def598:	2764 ffd3 e1af ffdd 93dd fff9 1d09 ffdd     d'..............
c0def5a8:	cc93 0002 1805 fff1 9c2a 0018 e5a9 ffc9     ........*.......
c0def5b8:	8a50 fff7 cf2c 003b 434e ffff 36df ffeb     P...,.;.NC...6..
c0def5c8:	15ca 003c 5e68 0015 16b6 fff3 29ce 001e     ..<.h^.......)..

c0def5d8 <small_zetas>:
c0def5d8:	fbec fd0a fe99 fa13 05d5 058e 011f 00ca     ................
c0def5e8:	ff55 026e 0629 00b6 03c2 fb4e fa3e 05bc     U.n.).....N.>...
c0def5f8:	023d fad3 0108 017f fcc3 05b2 f9be ff7e     =.............~.
c0def608:	fd57 03f9 02dc 0260 f9fa 019b ff33 f9dd     W.....`.....3...
c0def618:	04c7 028c fdd8 03f7 faf3 05d3 fee6 f9f8     ................
c0def628:	0204 fff8 fec0 fd66 f9ae fb76 007e 05bd     ......f...v.~...
c0def638:	fcab ffa6 fef1 033e 006b fa73 ff09 fc49     ......>.k.s...I.
c0def648:	fe72 03c1 fa1c fd2b 01c0 fbd7 02a5 fb05     r.....+.........
c0def658:	fbb1 01ae 022b 034b fb1d 0367 060e 0069     ....+.K...g...i.
c0def668:	01a6 024b 00b1 ff15 fedd fe34 0626 0675     ..K.......4.&.u.
c0def678:	ff0a 030a 0487 ff6d fcf7 05cb fda6 045f     ......m......._.
c0def688:	f9ca 0284 fc98 015d 01a2 0149 ff64 ffb5     ......]...I.d...
c0def698:	0331 0449 025b 0262 052a fafb fa47 0180     1.I.[.b.*...G...
c0def6a8:	fb41 ff78 04c2 fac9 fc96 00dc fb5d f985     A.x.........]...
c0def6b8:	fb5f fa06 fb02 031a fa1a fcaa fc9a 01de     _...............
c0def6c8:	ff94 fecc 03e4 03df 03be fa4c 05f2 065c     ..........L...\.

c0def6d8 <.L__const.nbgl_useCaseStatus.ticker>:
c0def6d8:	930d c0de 0bb8 0000 0000 0000               ............

c0def6e4 <blindSigningWarning>:
c0def6e4:	0010 0000 0000 0000 0000 0000 0000 0000     ................
	...
c0def710:	6854 7369 6120 7070 6520 616e 6c62 7365     This app enables
c0def720:	7320 6769 696e 676e 740a 6172 736e 6361      signing.transac
c0def730:	6974 6e6f 2073 6e6f 6920 7374 6e20 7465     tions on its net
c0def740:	6f77 6b72 002e                              work..

c0def746 <nbMaxElementsPerContentType>:
c0def746:	0101 0101 0101 0301 0503 0005 0000          ..............

c0def754 <.L__const.displayAddressQRCode.headerDesc>:
c0def754:	0000 0000 0028 0000 0000 0000 0000 0000     ....(...........
c0def764:	0000 0000                                   ....

c0def768 <.L__const.displaySkipWarning.info>:
c0def768:	dd0f c0de df19 c0de 0000 0000 cd3c c0de     ............<...
c0def778:	0000 0000 db10 c0de dfeb c0de 0005 0109     ................

c0def788 <.L__const.displaySecurityReport.layoutDescription>:
c0def788:	0101 0000 0000 0000 0000 0000 a97d c0de     ............}...
	...

c0def7a4 <.L__const.displaySecurityReport.headerDesc>:
c0def7a4:	0101 0000 0000 0000 0000 0000 0917 0000     ................
c0def7b4:	0000 0000                                   ....

c0def7b8 <securityReportItems>:
c0def7b8:	d7eb c0de d84c c0de 0000 0000 d7eb c0de     ....L...........
c0def7c8:	dd3d c0de df6f c0de d7eb c0de dd77 c0de     =...o.......w...
c0def7d8:	dccc c0de 0000 0000 dfc3 c0de e110 c0de     ................
c0def7e8:	d7eb c0de dd1c c0de dda0 c0de 0000 0000     ................
	...

c0def800 <.L__const.displayInfosListModal.info>:
c0def800:	0100 0114 0900 0000 0000 0000 0000 0000     ................
c0def810:	0100 0300 0000 0000 0000 0000               ............

c0def81c <.L__const.displayInitialWarning.buttonsInfo>:
c0def81c:	db48 c0de e0ba c0de 0000 0000 0015 0009     H...............

c0def82c <.L__const.displayInitialWarning.headerDesc>:
c0def82c:	0000 0000 0040 0000 0000 0000 0000 0000     ....@...........
c0def83c:	0000 0000                                   ....

c0def840 <g_pcHex>:
c0def840:	3130 3332 3534 3736 3938 6261 6463 6665     0123456789abcdef

c0def850 <g_pcHex_cap>:
c0def850:	3130 3332 3534 3736 3938 4241 4443 4645     0123456789ABCDEF

c0def860 <_etext>:
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
