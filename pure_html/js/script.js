// ============================================
// NAVIGATION & SCROLL EFFECTS
// ============================================

// Navbar scroll effect
const navbar = document.getElementById("navbar");
let lastScroll = 0;

window.addEventListener("scroll", () => {
  const currentScroll = window.pageYOffset;

  if (currentScroll > 100) {
    navbar.classList.add("scrolled");
  } else {
    navbar.classList.remove("scrolled");
  }

  lastScroll = currentScroll;
});

// Mobile menu toggle
const mobileMenuToggle = document.querySelector(".mobile-menu-toggle");
const navMenu = document.querySelector(".nav-menu");

mobileMenuToggle.addEventListener("click", () => {
  mobileMenuToggle.classList.toggle("active");
  navMenu.classList.toggle("active");
});

// Close mobile menu when clicking on a link
const navLinks = document.querySelectorAll(".nav-link");

navLinks.forEach((link) => {
  link.addEventListener("click", () => {
    mobileMenuToggle.classList.remove("active");
    navMenu.classList.remove("active");
  });
});

// Active navigation link on scroll
const sections = document.querySelectorAll("section[id]");

window.addEventListener("scroll", () => {
  const scrollY = window.pageYOffset;

  sections.forEach((section) => {
    const sectionHeight = section.offsetHeight;
    const sectionTop = section.offsetTop - 100;
    const sectionId = section.getAttribute("id");
    const navLink = document.querySelector(`.nav-link[href="#${sectionId}"]`);

    if (scrollY > sectionTop && scrollY <= sectionTop + sectionHeight) {
      navLinks.forEach((link) => link.classList.remove("active"));
      if (navLink) {
        navLink.classList.add("active");
      }
    }
  });
});

// ============================================
// TYPING ANIMATION
// ============================================

const typingText = document.querySelector(".typing-text");
const titles = [
  "Flutter Developer",
  "Team Lead",
  "Mobile Developer",
  "Clean Architecture Expert",
  "iOS & Android Developer",
];

let titleIndex = 0;
let charIndex = 0;
let isDeleting = false;
let typingSpeed = 100;

function typeTitle() {
  const currentTitle = titles[titleIndex];

  if (isDeleting) {
    typingText.textContent = currentTitle.substring(0, charIndex - 1);
    charIndex--;
    typingSpeed = 50;
  } else {
    typingText.textContent = currentTitle.substring(0, charIndex + 1);
    charIndex++;
    typingSpeed = 100;
  }

  if (!isDeleting && charIndex === currentTitle.length) {
    // Pause at end of word
    typingSpeed = 2000;
    isDeleting = true;
  } else if (isDeleting && charIndex === 0) {
    isDeleting = false;
    titleIndex = (titleIndex + 1) % titles.length;
    typingSpeed = 500;
  }

  setTimeout(typeTitle, typingSpeed);
}

// Start typing animation after page load
window.addEventListener("load", () => {
  setTimeout(typeTitle, 1000);
});

// ============================================
// SMOOTH SCROLLING
// ============================================

document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
  anchor.addEventListener("click", function (e) {
    e.preventDefault();
    const targetId = this.getAttribute("href");

    if (targetId === "#") return;

    const targetSection = document.querySelector(targetId);

    if (targetSection) {
      const offsetTop = targetSection.offsetTop - 80;

      window.scrollTo({
        top: offsetTop,
        behavior: "smooth",
      });
    }
  });
});

// ============================================
// SCROLL ANIMATIONS - INTERSECTION OBSERVER
// ============================================

const observerOptions = {
  threshold: 0.1,
  rootMargin: "0px 0px -100px 0px",
};

const observer = new IntersectionObserver((entries) => {
  entries.forEach((entry) => {
    if (entry.isIntersecting) {
      entry.target.style.opacity = "1";
      entry.target.style.transform = "translateY(0)";
    }
  });
}, observerOptions);

// Observe all animated elements
const animatedElements = document.querySelectorAll(`
    .about-content,
    .skill-category,
    .timeline-item,
    .project-card,
    .education-card,
    .contact-content
`);

animatedElements.forEach((el) => {
  el.style.opacity = "0";
  el.style.transform = "translateY(30px)";
  el.style.transition = "opacity 0.6s ease-out, transform 0.6s ease-out";
  observer.observe(el);
});

// ============================================
// CONTACT FORM HANDLING
// ============================================

const contactForm = document.getElementById("contactForm");

contactForm.addEventListener("submit", async (e) => {
  e.preventDefault();

  const formData = {
    name: document.getElementById("name").value,
    email: document.getElementById("email").value,
    subject: document.getElementById("subject").value,
    message: document.getElementById("message").value,
  };

  // Get the submit button
  const submitBtn = contactForm.querySelector('button[type="submit"]');
  const originalBtnText = submitBtn.innerHTML;

  // Show loading state
  submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Sending...';
  submitBtn.disabled = true;

  // Simulate form submission (replace with actual API call)
  setTimeout(() => {
    // Show success message
    showNotification(
      "Message sent successfully! I'll get back to you soon.",
      "success"
    );

    // Reset form
    contactForm.reset();

    // Reset button
    submitBtn.innerHTML = originalBtnText;
    submitBtn.disabled = false;
  }, 1500);
});

// Notification function
function showNotification(message, type = "success") {
  const notification = document.createElement("div");
  notification.className = `notification notification-${type}`;
  notification.innerHTML = `
        <i class="fas fa-${
          type === "success" ? "check-circle" : "exclamation-circle"
        }"></i>
        <span>${message}</span>
    `;

  // Add notification styles if not already added
  if (!document.getElementById("notification-styles")) {
    const style = document.createElement("style");
    style.id = "notification-styles";
    style.textContent = `
            .notification {
                position: fixed;
                top: 100px;
                right: 20px;
                padding: 1rem 1.5rem;
                background: rgba(10, 14, 39, 0.98);
                border: 1px solid rgba(255, 255, 255, 0.1);
                border-radius: 12px;
                backdrop-filter: blur(20px);
                display: flex;
                align-items: center;
                gap: 1rem;
                z-index: 10000;
                animation: slideInRight 0.3s ease-out, slideOutRight 0.3s ease-out 3s forwards;
                box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            }
            
            .notification-success {
                border-left: 4px solid #10b981;
            }
            
            .notification-success i {
                color: #10b981;
                font-size: 1.5rem;
            }
            
            .notification-error {
                border-left: 4px solid #ef4444;
            }
            
            .notification-error i {
                color: #ef4444;
                font-size: 1.5rem;
            }
            
            @keyframes slideInRight {
                from {
                    transform: translateX(400px);
                    opacity: 0;
                }
                to {
                    transform: translateX(0);
                    opacity: 1;
                }
            }
            
            @keyframes slideOutRight {
                from {
                    transform: translateX(0);
                    opacity: 1;
                }
                to {
                    transform: translateX(400px);
                    opacity: 0;
                }
            }
        `;
    document.head.appendChild(style);
  }

  document.body.appendChild(notification);

  setTimeout(() => {
    notification.remove();
  }, 3500);
}

// ============================================
// SCROLL INDICATOR - HIDE ON SCROLL
// ============================================

const scrollIndicator = document.querySelector(".scroll-indicator");

window.addEventListener("scroll", () => {
  if (window.pageYOffset > 300) {
    scrollIndicator.style.opacity = "0";
  } else {
    scrollIndicator.style.opacity = "1";
  }
});

// ============================================
// LAZY LOADING IMAGES (if needed)
// ============================================

if ("IntersectionObserver" in window) {
  const imageObserver = new IntersectionObserver((entries, observer) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        const img = entry.target;
        if (img.dataset.src) {
          img.src = img.dataset.src;
          img.removeAttribute("data-src");
          imageObserver.unobserve(img);
        }
      }
    });
  });

  document.querySelectorAll("img[data-src]").forEach((img) => {
    imageObserver.observe(img);
  });
}

// ============================================
// BACK TO TOP BUTTON (Optional Enhancement)
// ============================================

// Create back to top button
const backToTopButton = document.createElement("button");
backToTopButton.className = "back-to-top";
backToTopButton.innerHTML = '<i class="fas fa-arrow-up"></i>';
backToTopButton.setAttribute("aria-label", "Back to top");
document.body.appendChild(backToTopButton);

// Add styles for back to top button
const backToTopStyles = document.createElement("style");
backToTopStyles.textContent = `
    .back-to-top {
        position: fixed;
        bottom: 2rem;
        right: 2rem;
        width: 56px;
        height: 56px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        border: none;
        border-radius: 50%;
        font-size: 1.25rem;
        cursor: pointer;
        z-index: 999;
        opacity: 0;
        visibility: hidden;
        transition: all 0.3s ease-in-out;
        box-shadow: 0 4px 16px rgba(0, 0, 0, 0.2);
    }
    
    .back-to-top.visible {
        opacity: 1;
        visibility: visible;
    }
    
    .back-to-top:hover {
        transform: translateY(-4px);
        box-shadow: 0 8px 32px rgba(102, 126, 234, 0.4);
    }
    
    @media (max-width: 768px) {
        .back-to-top {
            bottom: 1.5rem;
            right: 1.5rem;
            width: 48px;
            height: 48px;
            font-size: 1.125rem;
        }
    }
`;
document.head.appendChild(backToTopStyles);

// Show/hide back to top button
window.addEventListener("scroll", () => {
  if (window.pageYOffset > 500) {
    backToTopButton.classList.add("visible");
  } else {
    backToTopButton.classList.remove("visible");
  }
});

// Scroll to top on click
backToTopButton.addEventListener("click", () => {
  window.scrollTo({
    top: 0,
    behavior: "smooth",
  });
});

// ============================================
// PAGE LOAD ANIMATIONS
// ============================================

window.addEventListener("load", () => {
  // Fade in hero content
  const heroContent = document.querySelector(".hero-content");
  if (heroContent) {
    heroContent.style.opacity = "1";
  }

  // Add loaded class to body for any CSS animations
  document.body.classList.add("loaded");
});

// ============================================
// PERFORMANCE OPTIMIZATION
// ============================================

// Debounce function for scroll events
function debounce(func, wait = 10) {
  let timeout;
  return function executedFunction(...args) {
    const later = () => {
      clearTimeout(timeout);
      func(...args);
    };
    clearTimeout(timeout);
    timeout = setTimeout(later, wait);
  };
}

// Apply debounce to scroll handlers if needed
const debouncedScroll = debounce(() => {
  // Any scroll-heavy operations can go here
}, 10);

// ============================================
// CONSOLE EASTER EGG (Optional Fun Touch)
// ============================================

console.log(
  "%c👋 Hi there!",
  "font-size: 24px; font-weight: bold; color: #667eea;"
);
console.log(
  "%cLooking for a talented Flutter Developer?",
  "font-size: 16px; color: #764ba2;"
);
console.log(
  "%cLet's connect: memocr426@gmail.com",
  "font-size: 14px; color: #4facfe;"
);
console.log(
  "%c💼 Check out my work above!",
  "font-size: 14px; color: #b8b9c7;"
);

// ============================================
// ANALYTICS (Placeholder - Add your tracking)
// ============================================

// Track page views, clicks, etc.
// Example: Google Analytics, Mixpanel, etc.

console.log("Portfolio website loaded successfully! 🎉");
