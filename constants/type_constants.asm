; TypeNames indexes (see data/types/names.asm)
; also used in:
; - PokedexTypeSearchConversionTable (see data/types/search_types.asm)
; - PokedexTypeSearchStrings (see data/types/search_strings.asm)
; - TypeMatchups (see data/battle/type_matchups.asm)
	const_def
	const NORMAL
	const FIGHTING
	const FLYING
	const POISON
	const GROUND
	const ROCK
	const BUG
	const GHOST
	const STEEL
	const FIRE
	const WATER
	const GRASS
	const ELECTRIC
	const PSYCHIC
	const ICE
	const DRAGON
	const DARK
	const FAE
TYPES_END EQU const_value

NUM_TYPES EQU TYPES_END

	enum_start (1 << 6), (1 << 6)
	enum PHYSICAL
	enum SPECIAL
	enum STATUS
