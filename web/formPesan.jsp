<%@ page import="java.util.*, inputan.Film" %>
<%
    String judul = request.getParameter("judul");
    ArrayList<Film> filmList = (ArrayList<Film>) session.getAttribute("filmList");
    Film selectedFilm = null;

    for (Film f : filmList) {
        if (f.judul.equals(judul)) {
            selectedFilm = f;
            break;
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Pemesanan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #1e1e2f;
            color: white;
        }
        .form-container {
            background-color: #2c2f4a;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.3);
        }
        .form-label {
            color: #ccc;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center mb-4">Form Pemesanan Tiket</h2>
    <div class="row justify-content-center">
        <div class="col-md-6 form-container">
            <form action="struk.jsp" method="post">
                <div class="mb-3">
                    <label class="form-label">Nama</label>
                    <input type="text" name="nama" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Judul Film</label>
                    <input type="text" name="judul" class="form-control" value="<%= selectedFilm.judul %>" readonly>
                </div>

                <div class="mb-3">
                    <label class="form-label">Jam Tayang</label>
                    <select name="jam" class="form-select" required>
                        <% for (String jam : selectedFilm.jamTayang) { %>
                            <option value="<%= jam %>"><%= jam %></option>
                        <% } %>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">Jumlah Tiket</label>
                    <input type="number" name="jumlah" class="form-control" min="1" required>
                </div>

                <input type="hidden" name="harga" value="<%= selectedFilm.harga %>">

                <div class="text-center">
                    <button type="submit" class="btn btn-primary w-100">Pesan</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
