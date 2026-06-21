package com.qrattendance.servlet;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.client.j2se.MatrixToImageWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/qrcode")
public class QRCodeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String studentId = req.getParameter("studentId");

        if (studentId == null || studentId.isEmpty()) {
            return;
        }

        QRCodeWriter qrWriter = new QRCodeWriter();

        try {
            BitMatrix bitMatrix = qrWriter.encode(studentId, BarcodeFormat.QR_CODE, 300, 300);

            resp.setContentType("image/png");
            OutputStream out = resp.getOutputStream();
            MatrixToImageWriter.writeToStream(bitMatrix, "PNG", out);
            out.close();

        } catch (WriterException e) {
            e.printStackTrace();
        }
    }
}
