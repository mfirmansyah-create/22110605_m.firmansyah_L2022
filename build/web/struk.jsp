<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String nama = request.getParameter("nama");
    String judul = request.getParameter("judul");
    String jam = request.getParameter("jam");
    int jumlah = Integer.parseInt(request.getParameter("jumlah"));
    int harga = Integer.parseInt(request.getParameter("harga"));
    int total = jumlah * harga;

    NumberFormat nf = NumberFormat.getCurrencyInstance(new java.util.Locale("in", "ID"));
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Struk Pemesanan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #1e1e2f;
            color: white;
        }
        .struk-container {
            background-color: #2c2f4a;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.3);
            max-width: 600px;
            margin: auto;
        }
        h2, h5 {
            color: #00bfff;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="struk-container text-center">
        <h2>🎟️ Struk Pemesanan</h2>
        <hr style="border-color: #555;">
        <h5>Nama Pemesan</h5>
        <p><strong><%= nama %></strong></p>

        <h5>Judul Film</h5>
        <p><%= judul %></p>

        <h5>Jam Tayang</h5>
        <p><%= jam %></p>

        <h5>Jumlah Tiket</h5>
        <p><%= jumlah %> tiket</p>

        <h5>Total Harga</h5>
        <p><strong><%= nf.format(total) %></strong></p>

        <hr style="border-color: #555;">
        <p>✅ Terima kasih telah memesan di <strong>Bioskop Online</strong>!</p>
        <a href="index.jsp" class="btn btn-primary mt-3">Kembali ke Beranda</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
