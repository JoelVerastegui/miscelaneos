class PokeapiPokemonResponse {
    final int id;
    final String name;
    final int baseExperience;
    final int height;
    final bool isDefault;
    final int order;
    final int weight;
    final List<Ability> abilities;
    final List<Species> forms;
    final List<GameIndex> gameIndices;
    final List<HeldItem> heldItems;
    final String locationAreaEncounters;
    final List<Move> moves;
    final Species species;
    final Sprites sprites;
    final Cries cries;
    final List<Stat> stats;
    final List<Type> types;
    final List<PastType> pastTypes;
    final List<PastAbility> pastAbilities;

    PokeapiPokemonResponse({
        required this.id,
        required this.name,
        required this.baseExperience,
        required this.height,
        required this.isDefault,
        required this.order,
        required this.weight,
        required this.abilities,
        required this.forms,
        required this.gameIndices,
        required this.heldItems,
        required this.locationAreaEncounters,
        required this.moves,
        required this.species,
        required this.sprites,
        required this.cries,
        required this.stats,
        required this.types,
        required this.pastTypes,
        required this.pastAbilities,
    });

    factory PokeapiPokemonResponse.fromJson(Map<String, dynamic> json) => PokeapiPokemonResponse(
        id: json["id"],
        name: json["name"],
        baseExperience: json["base_experience"],
        height: json["height"],
        isDefault: json["is_default"],
        order: json["order"],
        weight: json["weight"],
        abilities: List<Ability>.from(json["abilities"].map((x) => Ability.fromJson(x))),
        forms: List<Species>.from(json["forms"].map((x) => Species.fromJson(x))),
        gameIndices: List<GameIndex>.from(json["game_indices"].map((x) => GameIndex.fromJson(x))),
        heldItems: List<HeldItem>.from(json["held_items"].map((x) => HeldItem.fromJson(x))),
        locationAreaEncounters: json["location_area_encounters"],
        moves: List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
        species: Species.fromJson(json["species"]),
        sprites: Sprites.fromJson(json["sprites"]),
        cries: Cries.fromJson(json["cries"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        pastTypes: List<PastType>.from(json["past_types"].map((x) => PastType.fromJson(x))),
        pastAbilities: List<PastAbility>.from(json["past_abilities"].map((x) => PastAbility.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "base_experience": baseExperience,
        "height": height,
        "is_default": isDefault,
        "order": order,
        "weight": weight,
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        "forms": List<dynamic>.from(forms.map((x) => x.toJson())),
        "game_indices": List<dynamic>.from(gameIndices.map((x) => x.toJson())),
        "held_items": List<dynamic>.from(heldItems.map((x) => x.toJson())),
        "location_area_encounters": locationAreaEncounters,
        "moves": List<dynamic>.from(moves.map((x) => x.toJson())),
        "species": species.toJson(),
        "sprites": sprites.toJson(),
        "cries": cries.toJson(),
        "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "past_types": List<dynamic>.from(pastTypes.map((x) => x.toJson())),
        "past_abilities": List<dynamic>.from(pastAbilities.map((x) => x.toJson())),
    };
}

class Ability {
    final bool isHidden;
    final int slot;
    final Species? ability;

    Ability({
        required this.isHidden,
        required this.slot,
        required this.ability,
    });

    factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        isHidden: json["is_hidden"],
        slot: json["slot"],
        ability: json["ability"] == null ? null : Species.fromJson(json["ability"]),
    );

    Map<String, dynamic> toJson() => {
        "is_hidden": isHidden,
        "slot": slot,
        "ability": ability?.toJson(),
    };
}

class Species {
    final String name;
    final String url;

    Species({
        required this.name,
        required this.url,
    });

    factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}

class Cries {
    final String latest;
    final String legacy;

    Cries({
        required this.latest,
        required this.legacy,
    });

    factory Cries.fromJson(Map<String, dynamic> json) => Cries(
        latest: json["latest"],
        legacy: json["legacy"],
    );

    Map<String, dynamic> toJson() => {
        "latest": latest,
        "legacy": legacy,
    };
}

class GameIndex {
    final int gameIndex;
    final Species version;

    GameIndex({
        required this.gameIndex,
        required this.version,
    });

    factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        version: Species.fromJson(json["version"]),
    );

    Map<String, dynamic> toJson() => {
        "game_index": gameIndex,
        "version": version.toJson(),
    };
}

class HeldItem {
    final Species item;
    final List<VersionDetail> versionDetails;

    HeldItem({
        required this.item,
        required this.versionDetails,
    });

    factory HeldItem.fromJson(Map<String, dynamic> json) => HeldItem(
        item: Species.fromJson(json["item"]),
        versionDetails: List<VersionDetail>.from(json["version_details"].map((x) => VersionDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "item": item.toJson(),
        "version_details": List<dynamic>.from(versionDetails.map((x) => x.toJson())),
    };
}

class VersionDetail {
    final int rarity;
    final Species version;

    VersionDetail({
        required this.rarity,
        required this.version,
    });

    factory VersionDetail.fromJson(Map<String, dynamic> json) => VersionDetail(
        rarity: json["rarity"],
        version: Species.fromJson(json["version"]),
    );

    Map<String, dynamic> toJson() => {
        "rarity": rarity,
        "version": version.toJson(),
    };
}

class Move {
    final Species move;
    final List<VersionGroupDetail> versionGroupDetails;

    Move({
        required this.move,
        required this.versionGroupDetails,
    });

    factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: Species.fromJson(json["move"]),
        versionGroupDetails: List<VersionGroupDetail>.from(json["version_group_details"].map((x) => VersionGroupDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "move": move.toJson(),
        "version_group_details": List<dynamic>.from(versionGroupDetails.map((x) => x.toJson())),
    };
}

class VersionGroupDetail {
    final int levelLearnedAt;
    final Species versionGroup;
    final Species moveLearnMethod;
    final int order;

    VersionGroupDetail({
        required this.levelLearnedAt,
        required this.versionGroup,
        required this.moveLearnMethod,
        required this.order,
    });

    factory VersionGroupDetail.fromJson(Map<String, dynamic> json) => VersionGroupDetail(
        levelLearnedAt: json["level_learned_at"],
        versionGroup: Species.fromJson(json["version_group"]),
        moveLearnMethod: Species.fromJson(json["move_learn_method"]),
        order: json["order"] ?? 0,
    );

    Map<String, dynamic> toJson() => {
        "level_learned_at": levelLearnedAt,
        "version_group": versionGroup.toJson(),
        "move_learn_method": moveLearnMethod.toJson(),
        "order": order,
    };
}

class PastAbility {
    final Species generation;
    final List<Ability> abilities;

    PastAbility({
        required this.generation,
        required this.abilities,
    });

    factory PastAbility.fromJson(Map<String, dynamic> json) => PastAbility(
        generation: Species.fromJson(json["generation"]),
        abilities: List<Ability>.from(json["abilities"].map((x) => Ability.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "generation": generation.toJson(),
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
    };
}

class PastType {
    final Species generation;
    final List<Type> types;

    PastType({
        required this.generation,
        required this.types,
    });

    factory PastType.fromJson(Map<String, dynamic> json) => PastType(
        generation: Species.fromJson(json["generation"]),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "generation": generation.toJson(),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
    };
}

class Type {
    final int slot;
    final Species type;

    Type({
        required this.slot,
        required this.type,
    });

    factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Species.fromJson(json["type"]),
    );

    Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
    };
}

class GenerationV {
    final Sprites blackWhite;

    GenerationV({
        required this.blackWhite,
    });

    factory GenerationV.fromJson(Map<String, dynamic> json) => GenerationV(
        blackWhite: Sprites.fromJson(json["black-white"]),
    );

    Map<String, dynamic> toJson() => {
        "black-white": blackWhite.toJson(),
    };
}

class GenerationIv {
    final Sprites diamondPearl;
    final Sprites heartgoldSoulsilver;
    final Sprites platinum;

    GenerationIv({
        required this.diamondPearl,
        required this.heartgoldSoulsilver,
        required this.platinum,
    });

    factory GenerationIv.fromJson(Map<String, dynamic> json) => GenerationIv(
        diamondPearl: Sprites.fromJson(json["diamond-pearl"]),
        heartgoldSoulsilver: Sprites.fromJson(json["heartgold-soulsilver"]),
        platinum: Sprites.fromJson(json["platinum"]),
    );

    Map<String, dynamic> toJson() => {
        "diamond-pearl": diamondPearl.toJson(),
        "heartgold-soulsilver": heartgoldSoulsilver.toJson(),
        "platinum": platinum.toJson(),
    };
}

class Versions {
    final GenerationI generationI;
    final GenerationIi generationIi;
    final GenerationIii generationIii;
    final GenerationIv generationIv;
    final GenerationV generationV;
    final Map<String, Home> generationVi;
    final GenerationVii generationVii;
    final GenerationViii generationViii;

    Versions({
        required this.generationI,
        required this.generationIi,
        required this.generationIii,
        required this.generationIv,
        required this.generationV,
        required this.generationVi,
        required this.generationVii,
        required this.generationViii,
    });

    factory Versions.fromJson(Map<String, dynamic> json) => Versions(
        generationI: GenerationI.fromJson(json["generation-i"]),
        generationIi: GenerationIi.fromJson(json["generation-ii"]),
        generationIii: GenerationIii.fromJson(json["generation-iii"]),
        generationIv: GenerationIv.fromJson(json["generation-iv"]),
        generationV: GenerationV.fromJson(json["generation-v"]),
        generationVi: Map.from(json["generation-vi"]).map((k, v) => MapEntry<String, Home>(k, Home.fromJson(v))),
        generationVii: GenerationVii.fromJson(json["generation-vii"]),
        generationViii: GenerationViii.fromJson(json["generation-viii"]),
    );

    Map<String, dynamic> toJson() => {
        "generation-i": generationI.toJson(),
        "generation-ii": generationIi.toJson(),
        "generation-iii": generationIii.toJson(),
        "generation-iv": generationIv.toJson(),
        "generation-v": generationV.toJson(),
        "generation-vi": Map.from(generationVi).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "generation-vii": generationVii.toJson(),
        "generation-viii": generationViii.toJson(),
    };
}

class Other {
    final DreamWorld dreamWorld;
    final Home home;
    final OfficialArtwork officialArtwork;
    final Sprites showdown;

    Other({
        required this.dreamWorld,
        required this.home,
        required this.officialArtwork,
        required this.showdown,
    });

    factory Other.fromJson(Map<String, dynamic> json) => Other(
        dreamWorld: DreamWorld.fromJson(json["dream_world"]),
        home: Home.fromJson(json["home"]),
        officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
        showdown: Sprites.fromJson(json["showdown"]),
    );

    Map<String, dynamic> toJson() => {
        "dream_world": dreamWorld.toJson(),
        "home": home.toJson(),
        "official-artwork": officialArtwork.toJson(),
        "showdown": showdown.toJson(),
    };
}

class Sprites {
    final String backDefault;
    final dynamic backFemale;
    final String backShiny;
    final dynamic backShinyFemale;
    final String frontDefault;
    final dynamic frontFemale;
    final String frontShiny;
    final dynamic frontShinyFemale;
    final Other? other;
    final Versions? versions;
    final Sprites? animated;

    Sprites({
        required this.backDefault,
        required this.backFemale,
        required this.backShiny,
        required this.backShinyFemale,
        required this.frontDefault,
        required this.frontFemale,
        required this.frontShiny,
        required this.frontShinyFemale,
        this.other,
        this.versions,
        this.animated,
    });

    factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        other: json["other"] == null ? null : Other.fromJson(json["other"]),
        versions: json["versions"] == null ? null : Versions.fromJson(json["versions"]),
        animated: json["animated"] == null ? null : Sprites.fromJson(json["animated"]),
    );

    Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
        "other": other?.toJson(),
        "versions": versions?.toJson(),
        "animated": animated?.toJson(),
    };
}

class GenerationI {
    final RedBlue redBlue;
    final RedBlue yellow;

    GenerationI({
        required this.redBlue,
        required this.yellow,
    });

    factory GenerationI.fromJson(Map<String, dynamic> json) => GenerationI(
        redBlue: RedBlue.fromJson(json["red-blue"]),
        yellow: RedBlue.fromJson(json["yellow"]),
    );

    Map<String, dynamic> toJson() => {
        "red-blue": redBlue.toJson(),
        "yellow": yellow.toJson(),
    };
}

class RedBlue {
    final String backDefault;
    final String backGray;
    final String frontDefault;
    final String frontGray;

    RedBlue({
        required this.backDefault,
        required this.backGray,
        required this.frontDefault,
        required this.frontGray,
    });

    factory RedBlue.fromJson(Map<String, dynamic> json) => RedBlue(
        backDefault: json["back_default"],
        backGray: json["back_gray"],
        frontDefault: json["front_default"],
        frontGray: json["front_gray"],
    );

    Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_gray": backGray,
        "front_default": frontDefault,
        "front_gray": frontGray,
    };
}

class GenerationIi {
    final Crystal crystal;
    final Crystal gold;
    final Crystal silver;

    GenerationIi({
        required this.crystal,
        required this.gold,
        required this.silver,
    });

    factory GenerationIi.fromJson(Map<String, dynamic> json) => GenerationIi(
        crystal: Crystal.fromJson(json["crystal"]),
        gold: Crystal.fromJson(json["gold"]),
        silver: Crystal.fromJson(json["silver"]),
    );

    Map<String, dynamic> toJson() => {
        "crystal": crystal.toJson(),
        "gold": gold.toJson(),
        "silver": silver.toJson(),
    };
}

class Crystal {
    final String backDefault;
    final String backShiny;
    final String frontDefault;
    final String frontShiny;

    Crystal({
        required this.backDefault,
        required this.backShiny,
        required this.frontDefault,
        required this.frontShiny,
    });

    factory Crystal.fromJson(Map<String, dynamic> json) => Crystal(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
    );

    Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
    };
}

class GenerationIii {
    final OfficialArtwork emerald;
    final Crystal fireredLeafgreen;
    final Crystal rubySapphire;

    GenerationIii({
        required this.emerald,
        required this.fireredLeafgreen,
        required this.rubySapphire,
    });

    factory GenerationIii.fromJson(Map<String, dynamic> json) => GenerationIii(
        emerald: OfficialArtwork.fromJson(json["emerald"]),
        fireredLeafgreen: Crystal.fromJson(json["firered-leafgreen"]),
        rubySapphire: Crystal.fromJson(json["ruby-sapphire"]),
    );

    Map<String, dynamic> toJson() => {
        "emerald": emerald.toJson(),
        "firered-leafgreen": fireredLeafgreen.toJson(),
        "ruby-sapphire": rubySapphire.toJson(),
    };
}

class OfficialArtwork {
    final String frontDefault;
    final String frontShiny;

    OfficialArtwork({
        required this.frontDefault,
        required this.frontShiny,
    });

    factory OfficialArtwork.fromJson(Map<String, dynamic> json) => OfficialArtwork(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
    );

    Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
    };
}

class Home {
    final String frontDefault;
    final dynamic frontFemale;
    final String frontShiny;
    final dynamic frontShinyFemale;

    Home({
        required this.frontDefault,
        required this.frontFemale,
        required this.frontShiny,
        required this.frontShinyFemale,
    });

    factory Home.fromJson(Map<String, dynamic> json) => Home(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
    );

    Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
    };
}

class GenerationVii {
    final DreamWorld icons;
    final Home ultraSunUltraMoon;

    GenerationVii({
        required this.icons,
        required this.ultraSunUltraMoon,
    });

    factory GenerationVii.fromJson(Map<String, dynamic> json) => GenerationVii(
        icons: DreamWorld.fromJson(json["icons"]),
        ultraSunUltraMoon: Home.fromJson(json["ultra-sun-ultra-moon"]),
    );

    Map<String, dynamic> toJson() => {
        "icons": icons.toJson(),
        "ultra-sun-ultra-moon": ultraSunUltraMoon.toJson(),
    };
}

class DreamWorld {
    final String frontDefault;
    final dynamic frontFemale;

    DreamWorld({
        required this.frontDefault,
        required this.frontFemale,
    });

    factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
    );

    Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
    };
}

class GenerationViii {
    final DreamWorld icons;

    GenerationViii({
        required this.icons,
    });

    factory GenerationViii.fromJson(Map<String, dynamic> json) => GenerationViii(
        icons: DreamWorld.fromJson(json["icons"]),
    );

    Map<String, dynamic> toJson() => {
        "icons": icons.toJson(),
    };
}

class Stat {
    final int baseStat;
    final int effort;
    final Species stat;

    Stat({
        required this.baseStat,
        required this.effort,
        required this.stat,
    });

    factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Species.fromJson(json["stat"]),
    );

    Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toJson(),
    };
}
