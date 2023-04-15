package com.example.blooddonationproject.model;


public class Facility {
    private int id;
    private String rckikName;
    private String address;
    private String postCode;
    private String city;
    private String phoneNumber;
    private String website;

    public Facility(int id, String rckikName, String address, String postCode, String city, String phoneNumber, String website) {
        this.id = id;
        this.rckikName = rckikName;
        this.address = address;
        this.postCode = postCode;
        this.city = city;
        this.phoneNumber = phoneNumber;
        this.website = website;
    }

    public Facility(String rckikName, String address, String postCode, String city, String phoneNumber, String website) {
        this.rckikName = rckikName;
        this.address = address;
        this.postCode = postCode;
        this.city = city;
        this.phoneNumber = phoneNumber;
        this.website = website;
    }

    public Facility() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRckikName() {
        return rckikName;
    }

    public void setRckikName(String rckikName) {
        this.rckikName = rckikName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPostCode() {
        return postCode;
    }

    public void setPostCode(String postCode) {
        this.postCode = postCode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    @Override
    public String toString() {
        return "Facility{" +
                "id=" + id +
                ", rckikName='" + rckikName + '\'' +
                ", address='" + address + '\'' +
                ", postCode='" + postCode + '\'' +
                ", city='" + city + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", website='" + website + '\'' +
                '}';
    }
}
