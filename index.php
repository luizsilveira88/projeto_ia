<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema Administrativo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="/assets/css/app.css">
</head>
<body>
    <!-- Header -->
    <header class="header sticky-top">
        <div class="container-fluid">
            <div class="d-flex justify-content-between align-items-center">
                <!-- Logo e Toggle -->
                <div class="d-flex align-items-center gap-3">
                    <button class="btn btn-link d-lg-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#sidebar" aria-controls="sidebar">
                        <i class="fas fa-bars fs-5"></i>
                    </button>
                    <div class="logo-placeholder">
                        <i class="fas fa-image"></i>
                    </div>
                </div>
                
                <!-- User Info -->
                <div class="user-badge">
                    <i class="fas fa-user-circle"></i>
                    <span>João Silva</span>
                </div>
            </div>
        </div>
    </header>

    <div class="d-flex">
        <!-- Sidebar -->
        <nav class="sidebar d-none d-lg-block" style="width: 250px;">
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link active" href="/clientes/">
                        <i class="fas fa-users"></i> Clientes
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/pedidos/">
                        <i class="fas fa-shopping-cart"></i> Pedidos
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/produtos/">
                        <i class="fas fa-box"></i> Produtos
                    </a>
                </li>
            </ul>
        </nav>

        <!-- Offcanvas Sidebar para Mobile -->
        <div class="offcanvas offcanvas-start" tabindex="-1" id="sidebar" aria-labelledby="sidebarLabel">
            <div class="offcanvas-header border-bottom">
                <h5 class="offcanvas-title" id="sidebarLabel">Menu</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body p-0">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="/clientes/" data-bs-dismiss="offcanvas">
                            <i class="fas fa-users"></i> Clientes
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/pedidos/" data-bs-dismiss="offcanvas">
                            <i class="fas fa-shopping-cart"></i> Pedidos
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/produtos/" data-bs-dismiss="offcanvas">
                            <i class="fas fa-box"></i> Produtos
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- Main Content -->
        <main class="main-content flex-grow-1 w-100" id="main-content">
            <div class="container-fluid">
                <h1 class="mb-4">Bem-vindo ao Sistema Administrativo</h1>
                <div class="card border-0">
                    <div class="card-body">
                        <p>Selecione um módulo no menu para começar.</p>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/htmx.org"></script>
</body>
</html>