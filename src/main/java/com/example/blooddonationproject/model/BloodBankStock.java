package com.example.blooddonationproject.model;
public class BloodBankStock {
    private int facilityId;
    private int bloodId;
    private int amountOfBlood;

    public BloodBankStock() {
    }

    public BloodBankStock(int facilityId, int bloodId, int amountOfBlood) {
        this.facilityId = facilityId;
        this.bloodId = bloodId;
        this.amountOfBlood = amountOfBlood;
    }

    public int getFacilityId() {
        return facilityId;
    }

    public void setFacilityId(int facilityId) {
        this.facilityId = facilityId;
    }

    public int getBloodId() {
        return bloodId;
    }

    public void setBloodId(int bloodId) {
        this.bloodId = bloodId;
    }

    public int getAmountOfBlood() {
        return amountOfBlood;
    }

    public void setAmountOfBlood(int amountOfBlood) {
        this.amountOfBlood = amountOfBlood;
    }
}
