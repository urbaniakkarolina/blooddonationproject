package com.example.blooddonationproject.model;

import java.util.HashMap;

public class BloodBankStock {
    private Facility facility;
    private HashMap<String, BloodType> bloodTypes;

    public BloodBankStock() {
    }

    public BloodBankStock(Facility facility, HashMap<String, BloodType> bloodTypes) {
        this.facility = facility;
        this.bloodTypes = bloodTypes;
    }

    public Facility getFacility() {
        return facility;
    }

    public void setFacility(Facility facility) {
        this.facility = facility;
    }

    public HashMap<String, BloodType> getBloodTypes() {
        return bloodTypes;
    }

    public void setBloodTypes(HashMap<String, BloodType> bloodTypes) {
        this.bloodTypes = bloodTypes;
    }
}