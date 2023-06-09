<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: urbaniak
  Date: 11.04.2023
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="pl" xmlns:c="http://java.sun.com/xml/ns/javaee">

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
    <link rel="stylesheet" href="./css/style.css">
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
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="ClientServlet">Home</a>
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

                <form class="d-flex" action="ClientServlet">
                    <input class="form-control me-2" type="search" placeholder="Search" name="searchTerm" aria-label="Search">
                    <input type="hidden" name="command" value="SEARCH">
                    <button class="btn btn-outline-secondary " type="submit">Search</button>

                </form>

            </div>
        </div>
    </nav>
    <div class="header-img">
        <div class="header-text">
            <h1>Centrum krwiodawstwa</h1>
            <p>Twoja krew, moje życie</p>
        </div>
        <div class="header-bg"></div>
    </div>
</header>

<main>
    <div class="nav3"></div>
    <div class="nav2">
        <ul>
            <li class="nav2-item"><a href=ClientServlet>Strona główna</a></li>
        </ul>
    </div>

    <section id="bloodstate">
        <div class="container py-5">
            <div class="container py-5">
                <div class="row m-0 align-items-center">
                    <div class="col-md-7">
                        <p class="display-3 blood-color text-center mb-4 py-5">Kim jesteśmy?</p>
                        <div class="aboutus">
                            Dostarczamy informacje o krwiodawstwie i krwiolecznictwie, szerząc
                            wiedzę na ich temat w całej Polsce. Nasza strona przeznaczona jest dla wszystkich
                            honorowych dawców krwi
                            oraz osób, które zastanawiają się nam dołączeniem do nich.
                        </div>
                        <p></p>
                        <div class="aboutus"><b>Jesteśmy</b> wdzięczni za każdą kroplę krwi.</div>
                    </div>
                    <div class="image-about col-md-5">
                        <img src="img/who1.jpg" alt="" class="img-fluid" style="float: right">
                    </div>
                </div>
            </div>

        </div>
        <div class="container py-5">
            <p class="display-3 blood-color text-center mb-4">Stan banku krwi</p>
            <p class="day display-3 text-center">na dzień
                <script>
                    date = new Date().toLocaleDateString();
                    document.write(date);
                </script>
            </p>
        </div>

        <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <c:set var="counter" value="0"/>
                <c:forEach items="${BLOOD_BANK_STOCKS}">
                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="${counter}" class="${counter == 0 ? 'active' : ''}"
                            aria-current="${counter == 0 ? 'true' : 'false'}" aria-label="Slide ${counter}"></button>
                    <c:set var="counter" value="${counter + 1}"/>
                </c:forEach>
            </div>

            <div class="carousel-inner">
                <c:set var="counter" value="0"/>
                <c:forEach items="${BLOOD_BANK_STOCKS}" var="tmpBloodBankStock">
                    <c:set var="counter" value="${counter + 1}"/>
                    <c:set var="city" value="${tmpBloodBankStock.getFacility().getRckikName()}"/>
                    <c:set var="bloodTypes" value="${tmpBloodBankStock.bloodTypes}"/>
                    <c:set var="zeroMinus" value="${bloodTypes.get('ZERO-').getAmountOfBlood()}"/>
                    <c:set var="zeroPlus" value="${bloodTypes.get('ZERO+').getAmountOfBlood()}"/>
                    <c:set var="aMinus" value="${bloodTypes.get('A-').getAmountOfBlood()}"/>
                    <c:set var="aPlus" value="${bloodTypes.get('A+').getAmountOfBlood()}"/>
                    <c:set var="bMinus" value="${bloodTypes.get('B-').getAmountOfBlood()}"/>
                    <c:set var="bPlus" value="${bloodTypes.get('B+').getAmountOfBlood()}"/>
                    <c:set var="abMinus" value="${bloodTypes.get('AB-').getAmountOfBlood()}"/>
                    <c:set var="abPlus" value="${bloodTypes.get('AB+').getAmountOfBlood()}"/>

                    <div class="carousel-item ${counter == 1 ? 'active' : ''}">
                        <div class="container py-5 bloodstate-boxes">
                            <div class="row text-center">
                                <div class="container ">
                                    <p class="city display-3 text-center"><c:out value="${city}"/></p>
                                </div>
                                <h2 class="types_blood_plus col-6 col-md-6 p-4">Krew RhD-</h2>
                                <h2 class="types_blood_minus col-6 col-md-6 p-4">Krew RhD+</h2>
                                <div class="col-12 col-md-6 col-lg-3">
                                    <div class="bloodstate-box m-3 p-4 p-lg-5 border text-dark">
                                        <c:choose>
                                            <c:when test="${zeroMinus < 50}">
                                                <i class="bi bi-droplet blood-color"></i>
                                            </c:when>
                                            <c:when test="${zeroMinus < 500}">
                                                <i class="bi bi-droplet-half blood-color"></i>
                                            </c:when>
                                            <c:otherwise>
                                                <i class="bi bi-droplet-fill blood-color"></i>
                                            </c:otherwise>
                                        </c:choose>
                                        0 RhD-
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-lg-3">
                                    <div class="bloodstate-box m-3 p-4 p-lg-5 border text-dark">
                                        <c:choose>
                                            <c:when test="${aMinus < 50}">
                                                <i class="bi bi-droplet blood-color"></i>
                                            </c:when>
                                            <c:when test="${aMinus < 500}">
                                                <i class="bi bi-droplet-half blood-color"></i>
                                            </c:when>
                                            <c:otherwise>
                                                <i class="bi bi-droplet-fill blood-color"></i>
                                            </c:otherwise>
                                        </c:choose>
                                        A RhD-
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-lg-3">
                                    <div class="bloodstate-box m-3 p-4 p-lg-5 border text-dark">
                                        <c:choose>
                                            <c:when test="${zeroPlus < 50}">
                                                <i class="bi bi-droplet blood-color"></i>
                                            </c:when>
                                            <c:when test="${zeroPlus < 500}">
                                                <i class="bi bi-droplet-half blood-color"></i>
                                            </c:when>
                                            <c:otherwise>
                                                <i class="bi bi-droplet-fill blood-color"></i>
                                            </c:otherwise>
                                        </c:choose>
                                        0 RhD+
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-lg-3">
                                    <div class="bloodstate-box m-3 p-4 p-lg-5 border text-dark">
                                        <c:choose>
                                            <c:when test="${aPlus < 50}">
                                                <i class="bi bi-droplet blood-color"></i>
                                            </c:when>
                                            <c:when test="${aPlus < 500}">
                                                <i class="bi bi-droplet-half blood-color"></i>
                                            </c:when>
                                            <c:otherwise>
                                                <i class="bi bi-droplet-fill blood-color"></i>
                                            </c:otherwise>
                                        </c:choose>
                                        A RhD+
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-lg-3">
                                    <div class="bloodstate-box m-3 p-4 p-lg-5 border text-light bg-dark">
                                        <c:choose>
                                            <c:when test="${bMinus < 50}">
                                                <i class="bi bi-droplet blood-color"></i>
                                            </c:when>
                                            <c:when test="${bMinus < 500}">
                                                <i class="bi bi-droplet-half blood-color"></i>
                                            </c:when>
                                            <c:otherwise>
                                                <i class="bi bi-droplet-fill blood-color"></i>
                                            </c:otherwise>
                                        </c:choose>
                                        B RhD-
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-lg-3">
                                    <div class="bloodstate-box m-3 p-4 p-lg-5 border text-light bg-dark">
                                        <c:choose>
                                            <c:when test="${abMinus < 50}">
                                                <i class="bi bi-droplet blood-color"></i>
                                            </c:when>
                                            <c:when test="${abMinus < 500}">
                                                <i class="bi bi-droplet-half blood-color"></i>
                                            </c:when>
                                            <c:otherwise>
                                                <i class="bi bi-droplet-fill blood-color"></i>
                                            </c:otherwise>
                                        </c:choose>
                                        AB RhD-
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-lg-3">
                                    <div class="bloodstate-box m-3 p-4 p-lg-5 border text-light bg-dark">
                                        <c:choose>
                                            <c:when test="${bPlus < 50}">
                                                <i class="bi bi-droplet blood-color"></i>
                                            </c:when>
                                            <c:when test="${bPlus < 500}">
                                                <i class="bi bi-droplet-half blood-color"></i>
                                            </c:when>
                                            <c:otherwise>
                                                <i class="bi bi-droplet-fill blood-color"></i>
                                            </c:otherwise>
                                        </c:choose>
                                        B RhD+
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-lg-3">
                                    <div class="bloodstate-box m-3 p-4 p-lg-5 border text-light bg-dark">
                                        <c:choose>
                                            <c:when test="${abPlus < 50}">
                                                <i class="bi bi-droplet blood-color"></i>
                                            </c:when>
                                            <c:when test="${abPlus < 500}">
                                                <i class="bi bi-droplet-half blood-color"></i>
                                            </c:when>
                                            <c:otherwise>
                                                <i class="bi bi-droplet-fill blood-color"></i>
                                            </c:otherwise>
                                        </c:choose>
                                        AB RhD+
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </section>

    <section>
        <div class="container py-5">
            <p class="display-3 blood-color text-center mb-4">Gdzie można oddać krew?</p>
            <div class="container py-5">
                <div class="container py-5">
                    <div class="row m-0 align-items-center">
                        <div class="col-md-5">
                            <div class="blood-stations-map">
                                W Polsce pobór krwi jest zarezerwowany tylko dla placówek wchodzących w skład
                                Publicznej Służby Krwi. Do pobierania krwi i oddzielania jej składników uprawnione
                                są wyłącznie: Regionalne Centra Krwiodawstwa i Krwiolecznictwa, Wojskowe Centrum
                                Krwiodawstwa i Krwiolecznictwa, Centrum Krwiodawstwa i Krwiolecznictwa MSWiA
                                (dawniej MSW) oraz ich oddziały i stacje terenowe. W Polsce jest 21 RCKiK oraz
                                wspomniane wyżej 2 centra resortowe. 16 z nich znajduje się w stolicach województw
                                kolejne 5 w miastach powiatowych (Słupsk, Kalisz, Radom, Wałbrzych, Racibórz).
                                Oprócz stałych punktów w postaci centrów oraz oddziałów terenowych krew pozyskiwana
                                jest na akcjach wyjazdowych (zarówno w mobilnych – krwiobusach jak i stałych
                                punktach). Na poniższej mapie zaznaczone zostały tylko stałe punkty poboru krwi.
                            </div>

                        </div>
                        <div class="map col-md-7">
                            <iframe
                                    src="https://www.google.com/maps/d/embed?mid=142nqMIgmK3tCarABCmdvq8MHGlNZZPMB&ehbc=2E312F"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section>
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
                        <tr>
                            <td class="counterCell"></td>
                            <td>${tmpFacility.rckikName}</td>
                            <td>${tmpFacility.address}</td>
                            <td>${tmpFacility.city} ${tmpFacility.postCode}</td>
                            <td>${tmpFacility.phoneNumber}</td>
                            <td>
                                <a class="link" id="website" onmouseover="mouseOver()" onmouseout="mouseOut()" style="color: #333333; text-decoration: none" href="${tmpFacility.website}" onmouseover="change(this)">${tmpFacility.website}
                                </a>
                                <script type="text/javascript" >
                                    function mouseOver() {
                                        document.getElementById("website").style.color = "rgba(140, 34, 34, 0.959)";
                                    }

                                    function mouseOut() {
                                        document.getElementById("website").style.color = "#333";
                                    }
                                    // function change (element) {
                                    //     var style = element.style;
                                    //     style.color = 'rgba(140, 34, 34, 0.959)';
                                    // }
                                </script>
                            </td>
                        </tr>

                    </c:forEach>
                    </tbody>
                </table>

            </div>
        </div>
    </section>
</main>
<footer>
    <p> &copy; Honorowe krwiodawstwo i krwiolecznictwo 2023 <span class="icon-box"><a href="#"><i
            class="fa-brands fa-square-twitter"></i></a>
                <a href="#"><i class="fa-brands fa-square-facebook"></i></a></span></p>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous">
</script>

</body>

</html>