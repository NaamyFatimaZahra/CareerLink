-- Création de la base de données
CREATE DATABASE careerLink;
USE careerLink;

-- Table des rôles
CREATE TABLE roles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

-- Table des utilisateurs
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number INT NOT NULL,
    password VARCHAR(255) NOT NULL,
    role_id INT NOT NULL,
    company_name VARCHAR(100),
    company_description TEXT,
    sector VARCHAR(100),
    position VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE
);

-- Table des catégories
CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table des tags
CREATE TABLE tags (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table des offres d'emploi
CREATE TABLE job_offers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    position VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    recruiter_id INT NOT NULL,
    category_id INT NOT NULL,
    location VARCHAR(100),
    salary DECIMAL(10,2),
    is_archived BOOLEAN DEFAULT FALSE,
    publication_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (recruiter_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
);

-- Table de liaison entre les offres d'emploi et les tags
CREATE TABLE job_tags (
    job_id INT NOT NULL,
    tag_id INT NOT NULL,
    PRIMARY KEY (job_id, tag_id),
    FOREIGN KEY (job_id) REFERENCES job_offers(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- Table des candidatures
CREATE TABLE applications (
    id INT PRIMARY KEY AUTO_INCREMENT,
    job_id INT NOT NULL,
    candidate_id INT NOT NULL,
    cover_letter TEXT NOT NULL,
    resume_path VARCHAR(255) NOT NULL,
    status ENUM('pending', 'reviewed', 'accepted', 'rejected') DEFAULT 'pending',
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (job_id) REFERENCES job_offers(id) ON DELETE CASCADE,
    FOREIGN KEY (candidate_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Insertion des données de test

-- Rôles
INSERT INTO roles (name) VALUES
('admin'),
('recruiter'),
('candidate');

-- Utilisateurs
-- Remarque : Les mots de passe sont hachés avec password_hash() en PHP
-- Tous les mots de passe ici sont "password123" à des fins de démonstration
INSERT INTO users (name, email, phone_number, password, role_id, company_name, company_description) VALUES
('Admin User', 'admin@careerlink.com', 1234567890, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, NULL, NULL),
('Tech Recruiter', 'recruiter@techcorp.com', 9876543210, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 2, 'TechCorp', 'Une entreprise leader en développement logiciel'),
('HR Manager', 'hr@innovatech.com', 4567891230, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 2, 'InnovaTech', 'Une startup innovante en pleine croissance'),
('John Doe', 'john@example.com', 1231231234, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 3, NULL, NULL),
('Jane Smith', 'jane@example.com', 3213214321, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 3, NULL, NULL);

-- Catégories
INSERT INTO categories (name) VALUES
('Développement Web'),
('Design'),
('Marketing Digital'),
('Gestion de Projet'),
('DevOps'),
('Science des Données'),
('Support Technique'),
('Ventes');

-- Tags
INSERT INTO tags (name) VALUES
('PHP'),
('JavaScript'),
('Python'),
('React'),
('Vue.js'),
('Docker'),
('AWS'),
('UI/UX'),
('SEO'),
('Agile'),
('Machine Learning'),
('SQL');

-- Offres d'emploi
INSERT INTO job_offers (position, description, recruiter_id, category_id, location, salary) VALUES
('Développeur Full Stack PHP/Vue.js', 'Nous recherchons un développeur Full Stack expérimenté pour rejoindre notre équipe...', 2, 1, 'Paris', 45000.00),
('Designer UX Senior', 'Poste de Designer UX Senior pour diriger la refonte de nos produits...', 3, 2, 'Lyon', 42000.00),
('Chef de Projet Digital', 'Gestion des projets web et mobile pour nos clients clés...', 2, 4, 'Paris', 48000.00),
('Ingénieur DevOps', 'Mise en place et maintenance de notre infrastructure cloud...', 3, 5, 'Bordeaux', 52000.00),
('Data Scientist', 'Analyse de données et création de modèles prédictifs...', 2, 6, 'Paris', 55000.00);

-- Associations entre offres d'emploi et tags
INSERT INTO job_tags (job_id, tag_id) VALUES
(1, 1), -- PHP pour Développeur Full Stack
(1, 2), -- JavaScript pour Développeur Full Stack
(1, 5), -- Vue.js pour Développeur Full Stack
(2, 8), -- UI/UX pour Designer UX Senior
(3, 10), -- Agile pour Chef de Projet Digital
(4, 6), -- Docker pour Ingénieur DevOps
(4, 7), -- AWS pour Ingénieur DevOps
(5, 3), -- Python pour Data Scientist
(5, 11), -- Machine Learning pour Data Scientist
(5, 12); -- SQL pour Data Scientist

-- Candidatures
INSERT INTO applications (job_id, candidate_id, cover_letter, resume_path, status) VALUES
(1, 4, 'Je suis très intéressé par le poste de Développeur Full Stack...', 'john_doe_cv.pdf', 'pending'),
(2, 5, 'Mon expérience en design correspond parfaitement à vos besoins...', 'jane_smith_cv.pdf', 'reviewed'),
(3, 4, 'Ma formation en gestion de projet et mon expérience...', 'john_doe_cv.pdf', 'accepted'),
(4, 5, 'Je suis passionné par DevOps et j''ai une solide expérience...', 'jane_smith_cv.pdf', 'rejected'),
(5, 4, 'Mon parcours en science des données et mes projets personnels...', 'john_doe_cv.pdf', 'pending');

-- Indexes pour optimiser les performances
CREATE INDEX idx_job_offers_category ON job_offers(category_id);
CREATE INDEX idx_job_offers_recruiter ON job_offers(recruiter_id);
CREATE INDEX idx_applications_job ON applications(job_id);
CREATE INDEX idx_applications_candidate ON applications(candidate_id);
CREATE INDEX idx_users_role ON users(role_id);
