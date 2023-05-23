package model;

import java.util.ArrayList;
import java.util.List;

public class Plant {
    private int plantId;
    private String commName;
    private String latinName;
    private String plantDescription;
    private String plantAbout;
    private double plantSpacing;
    private int plantHeight;
    private int coldestUsdaZone;
    private int warmestUsdaZone;
    private int bloomColorId;
    private List<Germination> germinations = new ArrayList<>();
    private List<BloomTime> bloomMonths = new ArrayList<>();
    //TODO check out Image Class and see if this is appropriate to model `on
    private List<DisplayImage> images = new ArrayList<>();
    private List<Insect> insects = new ArrayList<>();
    private List<SunExposure> sunExposuress = new ArrayList<>();
    private List<SoilMoisture> soilMoistures = new ArrayList<>();
    private List<PlantLifeCycle> lifeCycles = new ArrayList<>();
}
