package com.qrattendance.model;

public class AttendanceRecord {
    private String studentId;
    private String time;
    private String status;

    public AttendanceRecord(String studentId, String time, String status) {
        this.studentId = studentId;
        this.time = time;
        this.status = status;
    }

    public String getStudentId() { return studentId; }
    public String getTime() { return time; }
    public String getStatus() { return status; }
}
