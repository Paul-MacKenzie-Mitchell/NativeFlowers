package model;

import java.util.ArrayList;
import java.util.List;

public enum EGermination {
    A("Seeds germinate after sowing in a warm location", "B"),
    B("Bring water to a boil; remove from heat. Pour over seed and allow the seed to soak for 24 hours " +
            "at room temp prior to planting or starting artificial treatment", "B"),
    C10("Seeds germinate after sitting out over winter or after a period of cold, moist stratification. " +
            "Sow seeds outdoors in the fall to over-winter naturally and see germination the following spring, " +
            "or artificially stratify seeds for the number of days in the parenthesis", "C10"),
    C30("Seeds germinate after sitting out over winter or after a period of cold, moist stratification. " +
            "Sow seeds outdoors in the fall to over-winter naturally and see germination the following spring, " +
            "or artificially stratify seeds for the number of days in the parenthesis", "C30"),
    C60("Seeds germinate after sitting out over winter or after a period of cold, moist stratification. " +
            "Sow seeds outdoors in the fall to over-winter naturally and see germination the following spring, " +
            "or artificially stratify seeds for the number of days in the parenthesis", "C60"),
    C120("Seeds germinate after sitting out over winter or after a period of cold, moist stratification. " +
            "Sow seeds outdoors in the fall to over-winter naturally and see germination the following spring, " +
            "or artificially stratify seeds for the number of days in the parenthesis", "C120"),
    D("Surface sow: Seeds are very small or need light to naturally break dormancy and germinate", "D"),
    E("In order to germinate, seeds need a warm, moist period (summer) followed by a cold, moist period " +
            "(winter). Sow seeds outdoors in spring and expect germination the following spring, one full year later. " +
            "To artificially mimic this stratification process, mix seeds with damp sand, place in a labeled, sealed " +
            "plastic bag and store in warm (about 80°F) location for 60–90 days. Then place in refrigerator (33–38°F)" +
            " for 60–90 days before sowing", "E"),
    F("Seeds have double dormancy and need a cold, moist period (winter) followed by a warm, moist period " +
            "(summer) followed by a 2nd cold, moist period. Sow seeds outdoors in the fall and expect germination " +
            "after 2 years. Artificially mimic this stratification process by following instructions for code C for" +
            " 60-90 days, then store in warm (about 80°F) place for 60-90 days, followed by a 2nd cold, moist period" +
            " for 60-90 days", "F"),
    G("Seeds germinate most successfully in cool soil. Sow seeds in late fall (after hard frost) or" +
            " early spring", "G"),
    H("Seeds need scarification: To scarify, lightly rub between two sheets of sandpaper before " +
            "artificial stratification", "H"),
    I("Legume: Rhizobium Inoculum may be added. Most legume species harbor beneficial bacteria called" +
            " rhizobia on their roots. Genus specific strains of this bacterium called inoculum can aid in the" +
            " fixation of atmospheric nitrogen and improve long-term health of native plant communities. Inoculum" +
            " is naturally-occurring in most soils and additional amendment is usually not needed ", "I"),
    L("Remove the hulls from these legume seeds", "L"),
    M("Hemiparasitic species which needs a host plant. Good hosts for many parasitic species include" +
            " low-growing grasses and sedges ", "M");
    private final String description;
    private final String code;



    EGermination(String description, String code) {
        this.description = description;
        this.code = code;
    }
}
