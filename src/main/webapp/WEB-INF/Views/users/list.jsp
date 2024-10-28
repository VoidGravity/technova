<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>User Management</title>
    <style>
        :root {
            --primary: #FF7525;
            --primary-light: #FFF1EA;
            --background: #F8F9FB;
            --text-dark: #1A1A1A;
            --text-light: #6E7275;
            --success: #4CAF50;
            --border: #E1E4E8;
            --error: #FF3B3B;
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
            padding: 2rem 4rem;
        }

        .container {
            width: 100%;
            max-width: 1400px;
            margin: 0 auto;
        }

        .page-header {
            margin-bottom: 3rem;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }

        .title-section {
            flex: 1;
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

        .add-user-btn {
            background: var(--primary);
            color: white;
            border: none;
            padding: 1rem 2rem;
            border-radius: 12px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .add-user-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(255, 117, 37, 0.2);
        }

        .add-user-btn::before {
            content: '+';
            font-size: 1.2rem;
            font-weight: 700;
        }

        .users-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(400px, 1fr));
            gap: 2rem;
        }

        .user-card {
            background: white;
            border-radius: 24px;
            overflow: hidden;
            transition: transform 0.2s ease;
        }

        .user-card:hover {
            transform: translateY(-4px);
        }

        .user-header {
            background: var(--primary-light);
            padding: 2rem;
            position: relative;
        }

        .user-name {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 0.5rem;
        }

        .user-id {
            font-size: 0.9rem;
            color: var(--text-light);
            display: inline-flex;
            align-items: center;
            padding: 0.25rem 0.75rem;
            background: rgba(0, 0, 0, 0.05);
            border-radius: 20px;
        }

        .status-indicator {
            position: absolute;
            top: 2rem;
            right: 2rem;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 600;
            background: #E8F5E9;
            color: var(--success);
        }

        .status-indicator::before {
            content: '●';
            display: inline-block;
            margin-right: 0.25rem;
            font-size: 0.8rem;
        }

        .user-details {
            padding: 2rem;
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 0;
            border-bottom: 1px solid var(--border);
        }

        .detail-row:last-child {
            border-bottom: none;
            padding-bottom: 0;
        }

        .detail-label {
            color: var(--text-light);
            font-size: 0.9rem;
        }

        .detail-value {
            color: var(--text-dark);
            font-weight: 500;
        }

        @media (max-width: 1200px) {
            body {
                padding: 2rem;
            }

            .users-grid {
                grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            }
        }

        @media (max-width: 768px) {
            .page-header {
                flex-direction: column;
                gap: 1.5rem;
            }

            .page-title {
                font-size: 2.5rem;
            }

            .add-user-btn {
                width: 100%;
                justify-content: center;
            }

            .users-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 576px) {
            body {
                padding: 1rem;
            }

            .user-header {
                padding: 1.5rem;
            }

            .user-details {
                padding: 1.5rem;
            }

            .user-name {
                font-size: 1.25rem;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <header class="page-header">
        <div class="title-section">
            <h1 class="page-title">
                <span>User</span>
                <span>Management</span>
            </h1>
            <div class="title-accent"></div>
        </div>
        <button class="add-user-btn" onclick="window.location.href = '/users/new'">Add New User</button>
    </header>

    <div class="users-grid">
        <c:forEach items="${users}" var="user">
            <div class="user-card">
                <div class="user-header">
                    <h2 class="user-name">${user.firstName} ${user.lastName}</h2>
                    <span class="user-id">#${user.id}</span>
                    <span class="status-indicator">${user.active}</span>
                </div>
                <div class="user-details">
                    <div class="detail-row">
                        <span class="detail-label">Identification Number</span>
                        <span class="detail-value">${user.identificationNumber}</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Nationality</span>
                        <span class="detail-value">${user.nationality}</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Registration Date</span>
                        <span class="detail-value">${user.registrationDate}</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Expiration Date</span>
                        <span class="detail-value">${user.expirationDate}</span>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>