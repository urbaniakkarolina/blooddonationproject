<!DOCTYPE html>
<html lang="pl">
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
    <link rel="stylesheet" href="css/style_update_facility.css">
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
                        <a class="nav-link active" aria-current="page" href="update_blood_bank.html">Aktualizuj
                            dane</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Konto
                        </a>

                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href=ClientServlet>Wyloguj się</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
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

                <div class="col-md-4 col-lg-2">
                    <div class="data p-5 mb-4 text-center">
                        <div class="back">
                            <a class="active" aria-current="page" href="add_facility_form.jsp"><button class="btn btn-lg"><span><i class="fa fa-arrow-left fa-3x"></i></span></button></a>

                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-9">
                    <div class="new-station-form mt-5">
                        <h2 class="form">Formularz edycji danych obiektu</h2>
                        <form action="AdminServlet" method="get">
                            <input type="hidden" name="command" value="UPDATE">
                            <input type="hidden" name="facilityID" value="${FACILITY.id}" />
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-4">
                                        <label>Nazwa RCKiK</label>
                                        <input type="text" class="form-control" name="nameInput"
                                               value="${FACILITY.rckikName}">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-4">
                                        <label>Adres (ulica i nr budynku)</label>
                                        <input type="text" class="form-control" name="addressInput"
                                               value="${FACILITY.address}">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-4">
                                        <label>Kod pocztowy</label>
                                        <input type="text" class="form-control" name="postCodeInput"
                                               value="${FACILITY.postCode}">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-4">
                                        <label>Miejscowość</label>
                                        <input type="text" class="form-control" name="cityInput"
                                               value="${FACILITY.city}">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-4">
                                        <label>Telefon</label>
                                        <input type="text" class="form-control" name="phoneNumberInput"
                                               value="${FACILITY.phoneNumber}">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-4">
                                        <label>Strona www</label>
                                        <input type="text" class="form-control" name="websiteInput"
                                               value="${FACILITY.website}">
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
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>

</html>