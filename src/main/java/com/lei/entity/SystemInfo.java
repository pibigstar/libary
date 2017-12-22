package com.lei.entity;

public class SystemInfo {
    private Integer id;

    private String cmsname;

    private String version;

    private String author;

    private String homepage;

    private String server;

    private String database;

    private String maxupload;

    private String userrights;

    private String keywords;

    private String powerby;

    private String description;

    private String record;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCmsname() {
        return cmsname;
    }

    public void setCmsname(String cmsname) {
        this.cmsname = cmsname == null ? null : cmsname.trim();
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version == null ? null : version.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public String getHomepage() {
        return homepage;
    }

    public void setHomepage(String homepage) {
        this.homepage = homepage == null ? null : homepage.trim();
    }

    public String getServer() {
        return server;
    }

    public void setServer(String server) {
        this.server = server == null ? null : server.trim();
    }

    public String getDatabase() {
        return database;
    }

    public void setDatabase(String database) {
        this.database = database == null ? null : database.trim();
    }

    public String getMaxupload() {
        return maxupload;
    }

    public void setMaxupload(String maxupload) {
        this.maxupload = maxupload == null ? null : maxupload.trim();
    }

    public String getUserrights() {
        return userrights;
    }

    public void setUserrights(String userrights) {
        this.userrights = userrights == null ? null : userrights.trim();
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords == null ? null : keywords.trim();
    }

    public String getPowerby() {
        return powerby;
    }

    public void setPowerby(String powerby) {
        this.powerby = powerby == null ? null : powerby.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getRecord() {
        return record;
    }

    public void setRecord(String record) {
        this.record = record == null ? null : record.trim();
    }
}