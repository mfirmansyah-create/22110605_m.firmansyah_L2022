<%@ page import="java.util.*, inputan.Film" %>
<%
    ArrayList<Film> filmList = new ArrayList<Film>();
    filmList.add(new Film("Fast and Furious 10", "Action", 145, 70000, new String[]{"10:00", "13:00", "16:00"}));
    filmList.add(new Film("Spiderman", "Superhero", 130, 65000, new String[]{"11:00", "14:00", "17:00"}));
    filmList.add(new Film("Mission Impossible", "Action", 150, 75000, new String[]{"09:00", "12:00", "15:00"}));

    session.setAttribute("filmList", filmList);
%>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Bioskop Online</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #1e1e2f;
      color: white;
    }
    .card {
      background-color: #2c2f4a;
      color: white;
      border: none;
      transition: transform 0.2s ease;
    }
    .card:hover {
      transform: scale(1.03);
      box-shadow: 0 0 15px rgba(255, 255, 255, 0.2);
    }
    .marquee {
      font-size: 1.5rem;
      font-weight: bold;
      color: #00bfff;
    }
    .card-img-top {
      height: 300px;
      object-fit: cover;
    }
  </style>
</head>
<body>

<!-- Judul Berjalan -->
<div class="bg-dark text-center py-2">
  <marquee class="marquee">SELAMAT DATANG DI BIOSKOP ONLINE</marquee>
</div>

<!-- Konten -->
<div class="container mt-4">
  <h2 class="text-center mb-4">Daftar Film</h2>
  <div class="row">
    <%
      for(Film f : filmList) {
        String imgFile = f.judul.replaceAll(" ", "").toLowerCase() + ".jpg";
    %>
    <div class="col-md-4 mb-4">
      <div class="card h-100">
        <img src="images/<%= imgFile %>" class="card-img-top" alt="<%= f.judul %>">
        <div class="card-body">
          <h5 class="card-title"><%= f.judul %></h5>
          <p class="card-text">Genre: <%= f.genre %></p>
          <p class="card-text">Durasi: <%= f.durasi %> menit</p>
          <p class="card-text">Harga: Rp<%= f.harga %></p>
          <p class="card-text">Jam Tayang:
            <ul>
              <% for(String jam : f.jamTayang) { %>
                <li><%= jam %></li>
              <% } %>
            </ul>
          </p>
          <a href="formPesan.jsp?judul=<%= f.judul %>" class="btn btn-primary">Pesan Sekarang</a>
        </div>
      </div>
    </div>
    <%
      }
    %>
  </div>
</div>

<!-- Footer -->
<footer class="text-center text-white mt-5 mb-3">
  &copy; 2025 Bioskop Online
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
