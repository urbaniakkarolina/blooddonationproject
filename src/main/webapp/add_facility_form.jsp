<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: urbaniak
  Date: 11.04.2023
  Time: 22:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <title>Krwiodawcy</title>
  <link rel="icon" type="image/x-icon" href="img/heartbeat.png">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link
          href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;500;600&family=DM+Serif+Display&family=Gloock&display=swap"
          rel="stylesheet">
  <script src="https://kit.fontawesome.com/f7b616ee3b.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
  <link rel="stylesheet" href="css/style_add_facility_form.css">
</head>

<body>
<header>
  <nav class="navbar navbar-expand-lg navbar-light py-2 fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#"><i class="bi bi-heart-pulse"></i> Krwiodawcy</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
              data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
              aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto ms-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <c:url var="homeListLink" value="AdminServlet">
              <c:param name="command" value="HOME_LIST"></c:param>
              <c:param name="facilityID" value="${tmpFacility.id}"></c:param>
            </c:url>
            <a class="nav-link active" aria-current="page" href="${homeListLink}">Home</a>
          </li>
          <li class="nav-item">
            <c:url var="listLink" value="AdminServlet">
              <c:param name="command" value="LIST"></c:param>
              <c:param name="facilityID" value="${tmpFacility.id}"></c:param>
            </c:url>
            <a class="nav-link active" aria-current="page" href="${listLink}">
              Dodaj stację
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="update-data.html">Aktualizuj dane</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="logging.html" id="navbarDropdown" role="button"
               data-bs-toggle="dropdown" aria-expanded="false">
              Zaloguj się
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="logging.html">Honorowy Dawca Krwi</a></li>
              <li>
                <hr class="dropdown-divider">
              </li>
              <li><a class="dropdown-item" href="logging.html">Administrator</a></li>
            </ul>
          </li>
        </ul>
        <form class="d-flex">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-secondary " type="submit">Search</button>

        </form>

      </div>
    </div>
  </nav>
</header>

<main>
  <section class="images">
    <img src="img/heart.png" id="heart" alt="heart and blood types">
    <img src="img/heart2.png" id="heart2" alt="heart and blood drop">
    <img src="img/drop.png" id="drop1" alt="blood drop">
    <img src="img/drop.png" id="drop2" alt="blood drop">
    <img src="img/drop.png" id="drop3" alt="blood drop">
    <img src="img/drop.png" id="drop4" alt="blood drop">
    <img src="img/drop.png" id="drop5" alt="blood drop">
    <img src="img/drop.png" id="drop6" alt="blood drop">
    <img src="img/drop.png" id="drop7" alt="blood drop">
    <img src="img/drop.png" id="drop8" alt="blood drop">
    <img src="img/drop.png" id="drop9" alt="blood drop">
  </section>

  <section class="contact py-5">
    <div class="container">

      <div class="text-center py-5">
        <p class="display-3 blood-color">Dodaj stację RCKiK</p>
      </div>

      <div class="row">

        <div class="col-md-4 col-lg-3">
          <div class="data border p-5 mb-4 text-center">
            <h2>Biuro główne</h2>
            <p>Dane kontaktowe</p>
            <p class="mt-4 fw-bold text-uppercase">adres</p>
            <p>ul. Długa 27</p>
            <p>40-301 Warszawa</p>
            <p class="mt-4 fw-bold text-uppercase">telefon</p>
            <p>+48 605 395 242</p>
            <p class="mt-4 fw-bold text-uppercase">e-mail</p>
            <p>biuro@krwiodawcy.pl</p>
            <div class="contact-logo mt-5 pt-4 mb-n3 border-top">
              <i class="bi bi-heart-pulse blood-color"></i> Krwiodawcy
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-9">
          <div class="new-station-form mt-5">
            <h2 class="form">Formularz dodania nowego punktu</h2>
            <form action="AdminServlet" method="get">
              <input type="hidden" name="command" value="ADD">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group mb-4">
                    <label>Nazwa</label>
                    <input type="text" class="form-control" name="nameInput">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group mb-4">
                    <label>Adres</label>
                    <input type="text" class="form-control" name="addressInput">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group mb-4">
                    <label>Kod pocztowy</label>
                    <input type="text" class="form-control" name="postCodeInput">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group mb-4">
                    <label>Miejscowość</label>
                    <input type="text" class="form-control" name="cityInput">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group mb-4">
                    <label>Telefon</label>
                    <input type="text" class="form-control" name="phoneNumberInput">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group mb-4">
                    <label>Strona www</label>
                    <input type="text" class="form-control" name="websiteInput">
                  </div>
                </div>
                <div class="mt-3 text-center">
                  <button type="submit" class="btn">Zapisz</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="contact-map pb-5">
    <p class="display-4 py-4 text-center blood-color">Mapa punktów krwiodawstwa</p>
    <div class="container d-flex flex column align-items-center">
      <iframe
              src="https://www.google.com/maps/d/embed?mid=142nqMIgmK3tCarABCmdvq8MHGlNZZPMB&ehbc=2E312F"></iframe>
    </div>


    <div class="container py-5">
      <div class="container py-5">

        <p class="display-3 blood-color text-center mb-5">Lista obiektów RCKiK:</p>
        <table class="table table-striped">
          <thead>
          <tr>
            <th scope="col">Nr</th>
            <th scope="col">RCKiK</th>
            <th scope="col">Adres</th>
            <th scope="col">Miejscowość</th>
            <th scope="col">Telefon</th>
            <th scope="col">Strona</th>
            <th scope="col"></th>
            <th scope="col"></th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="tmpFacility" items="${FACILITIES_LIST}">

            <%-- definiowanie linkow--%>
            <c:url var="updateLink" value="AdminServlet">
              <c:param name="command" value="LOAD"></c:param>
              <c:param name="facilityID" value="${tmpFacility.id}"></c:param>
            </c:url>

            <c:url var="deleteLink" value="AdminServlet">
              <c:param name="command" value="DELETE"></c:param>
              <c:param name="facilityID" value="${tmpFacility.id}"></c:param>
            </c:url>

            <tr>
              <th scope="row">${tmpFacility.id}</th>
              <td>${tmpFacility.rckikName}</td>
              <td>${tmpFacility.address}</td>
              <td>${tmpFacility.city} ${tmpFacility.postCode}</td>
              <td>${tmpFacility.phoneNumber}</td>
              <td>
                <a class="link" href="${tmpFacility.website}">${tmpFacility.website}</a>
              </td>
              <td>
                <a href="${updateLink}">
                  <i class="bi bi-pencil-square"></i>
                </a>
              </td>
              <td>
                <a href="${deleteLink}"
                     onclick="if(!(confirm('Czy na pewno chcesz usunąć obiekt? Ta operacja jest nieodwracalna.'))) return false">
                  <i class="bi bi-x-lg"></i>
                </a>
              </td>
            </tr>

          </c:forEach>
          </tbody>
        </table>

      </div>
    </div>
  </section>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>

</html>