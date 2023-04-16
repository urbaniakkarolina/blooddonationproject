<%--
  Created by IntelliJ IDEA.
  User: urban
  Date: 12.04.2023
  Time: 11:26
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
  <link rel="stylesheet" href="css/style_update_blood_bank.css">
</head>

<body>
<div class="background">
  <div class="shape"></div>
  <div class="shape"></div>
</div>

<img src="img/aboutus1.jpg" id="hands" alt="hands and blood drop">
<img src="img/donation.jpg" id="donation" alt="blood donation">


<form>
  <h3>Aktualizuj stan krwi</h3>

  <div class="form-group-small mb-4">
    <label>Grupa krwi</label>
    <select class="form-select">

      <option>0</option>
      <option>A</option>
      <option>B</option>
      <option>AB</option>
    </select>
  </div>
  <div class="form-group-small mb-4">
    <label>RhD</label>
    <select class="form-select">
      <option>- (minus)</option>
      <option>+ (plus)</option>
    </select>
  </div>
  <div class="form-group-small mb-4">
    <label>Operacja</label>
    <select class="form-select">
      <option>zmniejsz</option>
      <option>zwiększ</option>
    </select>
  </div>
  <div class="form-group-small mb-4">
    <label>RCKiK</label>
    <select class="form-select">
      <option>Bydgoszcz</option>
      <option>Gdańsk</option>
      <option>Kraków</option>
      <option>Warszawa</option>
      <option>Wrocław</option>
    </select>
  </div>

  <label for="amount">Ilość [l]</label>
  <input type="text" placeholder="0" id="amount">

  <button class="save" type="submit">Zapisz</button>


</form>
</body>

</html>
