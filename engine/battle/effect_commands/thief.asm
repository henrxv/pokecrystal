BattleCommand_Thief: ; 37492
; thief

	ld a, [wKickCounter]
	and a
	ret z

	ld a, [hBattleTurn]
	and a
	jr nz, .enemy

; The player needs to be able to steal an item.

	call .playeritem
	ld a, [hl]
	and a
	jr nz, .knockoffenemyitem

	call .enemyitem
	ld a, [hl]
	ld [wd265], a
	xor a
	ld [hl], a
	ld [de], a

	call .playeritem
	jr .stole
	
.knockoffenemyitem
	call .enemyitem
	jr .knockedoffitem
	
.enemy

; The enemy can't already have an item.

	call .enemyitem
	ld a, [hl]
	and a
	jr nz, .knockoffplayeritem

; If the enemy steals your item,
; it's gone for good if you don't get it back.

	call .playeritem
	ld a, [hl]
	ld [wd265], a
	xor a
	ld [hl], a
	ld [de], a

	call .enemyitem
		
.stole
	ld a, [wd265]
	ld [hl], a
	ld [de], a
	call GetItemName
	ld hl, StoleText
	jp StdBattleTextBox
	
.knockoffplayeritem
	call .playeritem
	
.knockedoffitem
	ld a, [hl]
	ld [wd265], a
	xor a
	ld [hl], a
	ld [de], a
	call GetItemName
	ld hl, KnockedOffText
	jp StdBattleTextBox

.playeritem
	ld a, 1
	call BattlePartyAttr
	ld d, h
	ld e, l
	ld hl, wBattleMonItem
	ret

.enemyitem
	ld a, 1
	call OTPartyAttr
	ld d, h
	ld e, l
	ld hl, wEnemyMonItem
	ret
; 37517
