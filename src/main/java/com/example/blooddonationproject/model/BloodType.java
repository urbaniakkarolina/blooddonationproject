package com.example.blooddonationproject.model;

public class BloodType {
    private int bloodId;
    private BasicBloodType basicBloodType;
    private String rhD;

    public BloodType() {
    }

    public BloodType(int bloodId, BasicBloodType basicBloodType, String rhD) {
        this.bloodId = bloodId;
        this.basicBloodType = basicBloodType;
        this.rhD = rhD;
    }

    public int getBloodId() {
        return bloodId;
    }

    public void setBloodId(int bloodId) {
        this.bloodId = bloodId;
    }

    public BasicBloodType getBasicBloodType() {
        return basicBloodType;
    }

    public void setBasicBloodType(BasicBloodType basicBloodType) {
        this.basicBloodType = basicBloodType;
    }

    public String getRhD() {
        return rhD;
    }

    public void setRhD(String rhD) {
        this.rhD = rhD;
    }
}
