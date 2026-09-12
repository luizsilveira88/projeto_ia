<div class="d-flex">
        <!-- Sidebar -->
        <nav class="sidebar d-none d-lg-block" style="width: 250px;">
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="/clientes/">
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