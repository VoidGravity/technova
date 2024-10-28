<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Create New User</title>
  <style>
    :root {
      --primary: #FF7525;
      --primary-light: #FFF1EA;
      --background: #F8F9FB;
      --text-dark: #1A1A1A;
      --text-light: #6E7275;
      --error: #FF3B3B;
      --border: #E1E4E8;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Inter', system-ui, sans-serif;
    }

    body {
      background: var(--background);
      min-height: 100vh;
      display: flex;
      padding: 2rem 4rem;
    }

    .container {
      width: 100%;
      max-width: 1200px;
      margin: 0 auto;
    }

    .page-header {
      margin-bottom: 3rem;
    }

    .page-title {
      font-size: 3.5rem;
      font-weight: 800;
      color: var(--text-dark);
      line-height: 1.2;
      margin-bottom: 0.5rem;
    }

    .page-title span {
      display: block;
    }

    .title-accent {
      display: block;
      width: 80px;
      height: 4px;
      background: var(--primary);
      margin-top: 1rem;
    }

    .form-container {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 4rem;
    }

    .form-section {
      background: white;
      border-radius: 24px;
      padding: 2.5rem;
      box-shadow: 0 4px 25px rgba(0, 0, 0, 0.03);
    }

    .section-title {
      font-size: 1.75rem;
      font-weight: 700;
      color: var(--text-dark);
      margin-bottom: 2rem;
    }

    .form-group {
      margin-bottom: 1.5rem;
    }

    .form-label {
      display: block;
      font-size: 0.95rem;
      font-weight: 500;
      color: var(--text-light);
      margin-bottom: 0.75rem;
    }

    .required {
      color: var(--error);
      margin-left: 4px;
    }

    .form-control {
      width: 100%;
      padding: 1rem;
      border: 2px solid var(--border);
      border-radius: 12px;
      font-size: 1rem;
      transition: all 0.2s ease;
      background: white;
    }

    .form-control:focus {
      outline: none;
      border-color: var(--primary);
      box-shadow: 0 0 0 4px rgba(255, 117, 37, 0.1);
    }

    select.form-control {
      appearance: none;
      background-image: url("data:image/svg+xml,%3Csvg width='12' height='8' viewBox='0 0 12 8' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M1 1L6 6L11 1' stroke='%236E7275' stroke-width='2' stroke-linecap='round'/%3E%3C/svg%3E");
      background-repeat: no-repeat;
      background-position: right 1rem center;
      padding-right: 2.5rem;
    }

    .actions {
      grid-column: 1 / -1;
      padding: 2rem 0;
      display: flex;
      justify-content: flex-end;
      gap: 1rem;
    }

    .btn {
      padding: 1rem 2rem;
      border-radius: 12px;
      font-size: 1rem;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.2s ease;
      border: none;
    }

    .btn-primary {
      background: var(--primary);
      color: white;
    }

    .btn-primary:hover {
      background: #FF8A45;
      transform: translateY(-2px);
    }

    .btn-secondary {
      background: var(--primary-light);
      color: var(--primary);
    }

    .btn-secondary:hover {
      background: #FFE4D6;
    }

    .error-message {
      color: var(--error);
      font-size: 0.85rem;
      margin-top: 0.5rem;
    }

    @media (max-width: 1200px) {
      body {
        padding: 2rem;
      }

      .form-container {
        gap: 2rem;
      }
    }

    @media (max-width: 992px) {
      .form-container {
        grid-template-columns: 1fr;
        max-width: 700px;
        margin: 0 auto;
      }

      .page-title {
        font-size: 3rem;
      }
    }

    @media (max-width: 576px) {
      body {
        padding: 1rem;
      }

      .page-title {
        font-size: 2.5rem;
      }

      .form-section {
        padding: 1.5rem;
      }

      .actions {
        flex-direction: column;
      }

      .btn {
        width: 100%;
      }
    }
  </style>
</head>
<body>
<div class="container">
  <header class="page-header">
    <h1 class="page-title">
      <span>Create</span>
      <span>New</span>
      <span>User</span>
    </h1>
    <div class="title-accent"></div>
  </header>

  <form:form modelAttribute="user" action="${pageContext.request.contextPath}/users" method="post">
    <div class="form-container">
      <section class="form-section">
        <h2 class="section-title">Personal Information</h2>

        <div class="form-group">
          <label class="form-label">
            First Name
            <span class="required">*</span>
          </label>
          <form:input path="firstName" cssClass="form-control" required="true"/>
          <form:errors path="firstName" cssClass="error-message"/>
        </div>

        <div class="form-group">
          <label class="form-label">
            Last Name
            <span class="required">*</span>
          </label>
          <form:input path="lastName" cssClass="form-control" required="true"/>
          <form:errors path="lastName" cssClass="error-message"/>
        </div>

        <div class="form-group">
          <label class="form-label">
            Identification Number
            <span class="required">*</span>
          </label>
          <form:input path="identificationNumber" cssClass="form-control" required="true"/>
          <form:errors path="identificationNumber" cssClass="error-message"/>
        </div>

        <div class="form-group">
          <label class="form-label">
            Nationality
            <span class="required">*</span>
          </label>
          <form:select path="nationality" cssClass="form-control" required="true">
            <form:option value="" label="Select Nationality"/>
            <form:option value="US" label="United States"/>
            <form:option value="UK" label="United Kingdom"/>
            <form:option value="CA" label="Canada"/>
            <form:option value="AU" label="Australia"/>
          </form:select>
          <form:errors path="nationality" cssClass="error-message"/>
        </div>
      </section>

      <section class="form-section">
        <h2 class="section-title">Account Details</h2>

        <div class="form-group">
          <label class="form-label">
            Registration Date
            <span class="required">*</span>
          </label>
          <form:input path="registrationDate" type="date" cssClass="form-control" required="true"/>
          <form:errors path="registrationDate" cssClass="error-message"/>
        </div>

        <div class="form-group">
          <label class="form-label">
            Expiration Date
            <span class="required">*</span>
          </label>
          <form:input path="expirationDate" type="date" cssClass="form-control" required="true"/>
          <form:errors path="expirationDate" cssClass="error-message"/>
        </div>

        <div class="form-group">
          <label class="form-label">Status</label>
          <form:select path="active" cssClass="form-control">
            <form:option value="true" label="Active"/>
            <form:option value="false" label="Inactive"/>
          </form:select>
        </div>
      </section>

      <div class="actions">
        <button type="button" class="btn btn-secondary" onclick="window.location.href='${pageContext.request.contextPath}/users'">Cancel</button>
        <button type="submit" class="btn btn-primary">Create User</button>
      </div>
    </div>
  </form:form>
</div>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('form');
    const registrationDate = document.getElementById('registrationDate');
    const expirationDate = document.getElementById('expirationDate');

    registrationDate.valueAsDate = new Date();

    form.addEventListener('submit', function(e) {
      const regDate = new Date(registrationDate.value);
      const expDate = new Date(expirationDate.value);

      if (expDate <= regDate) {
        e.preventDefault();
        alert('Expiration date must be after registration date');
        return false;
      }
    });
  });
</script>
</body>
</html>