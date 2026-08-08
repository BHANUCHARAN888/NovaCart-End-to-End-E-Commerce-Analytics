// =========================================
// NOVACART CASE STUDY
// =========================================


// =========================================
// SECTION 1 — DASHBOARD REVEAL
// =========================================

const dashboard = document.querySelector(".hero-dashboard");

if (dashboard) {

    const dashboardObserver = new IntersectionObserver(
        (entries) => {

            entries.forEach((entry) => {

                if (entry.isIntersecting) {

                    dashboard.classList.add("show");

                    dashboardObserver.unobserve(dashboard);

                }

            });

        },
        {
            threshold: 0.15
        }
    );

    dashboardObserver.observe(dashboard);
}



// =========================================
// SECTION 2 — BUSINESS PROBLEM REVEAL
// =========================================

const problemElements = document.querySelectorAll(
    ".reveal-problem"
);

if (problemElements.length > 0) {

    const problemObserver = new IntersectionObserver(
        (entries) => {

            entries.forEach((entry) => {

                if (entry.isIntersecting) {

                    entry.target.classList.add("visible");

                }

            });

        },
        {
            threshold: 0.12
        }
    );


    problemElements.forEach((element) => {

        problemObserver.observe(element);

    });

}

// =========================================
// SECTION 3
// =========================================


const workflowElements = document.querySelectorAll(
    ".reveal-workflow"
);

if (workflowElements.length > 0) {

    const workflowObserver = new IntersectionObserver(
        (entries) => {

            entries.forEach((entry) => {

                if (entry.isIntersecting) {

                    entry.target.classList.add("visible");

                    workflowObserver.unobserve(entry.target);

                }

            });

        },
        {
            threshold: 0.12
        }
    );

    workflowElements.forEach((element) => {

        workflowObserver.observe(element);

    });

}

// =========================================
// SECTION 4 — SQL REVEAL
// =========================================

const sqlElements = document.querySelectorAll(".reveal-sql");

if (sqlElements.length > 0) {

    const sqlObserver = new IntersectionObserver(
        (entries) => {

            entries.forEach((entry) => {

                if (entry.isIntersecting) {

                    entry.target.classList.add("visible");

                    sqlObserver.unobserve(entry.target);

                }

            });

        },
        {
            threshold: 0.08
        }
    );


    sqlElements.forEach((element) => {

        sqlObserver.observe(element);

    });

}
// =========================================
// SECTION 5 — INSIGHT REVEAL
// =========================================

const insightElements = document.querySelectorAll(".insight-reveal");

if (insightElements.length > 0) {

    const insightObserver = new IntersectionObserver(
        (entries) => {

            entries.forEach((entry) => {

                if (entry.isIntersecting) {

                    entry.target.classList.add("visible");

                    insightObserver.unobserve(entry.target);

                }

            });

        },
        {
            threshold: 0.08
        }
    );


    insightElements.forEach((element) => {

        insightObserver.observe(element);

    });

}
// =========================================
// SECTION 6 — REVEAL ANIMATION
// =========================================

const decisionElements =
    document.querySelectorAll(".decision-reveal");

if (decisionElements.length > 0) {

    const decisionObserver = new IntersectionObserver(
        (entries) => {

            entries.forEach((entry) => {

                if (entry.isIntersecting) {

                    entry.target.classList.add("visible");

                    decisionObserver.unobserve(entry.target);

                }

            });

        },
        {
            threshold: 0.08
        }
    );


    decisionElements.forEach((element) => {

        decisionObserver.observe(element);

    });

}
// =========================================
// SECTION 7 — POWER BI REVEAL
// =========================================

const powerbiElements =
    document.querySelectorAll(".powerbi-reveal");

if (powerbiElements.length > 0) {

    const powerbiObserver = new IntersectionObserver(
        (entries) => {

            entries.forEach((entry) => {

                if (entry.isIntersecting) {

                    entry.target.classList.add("visible");

                    powerbiObserver.unobserve(entry.target);

                }

            });

        },
        {
            threshold: 0.08
        }
    );


    powerbiElements.forEach((element) => {

        powerbiObserver.observe(element);

    });

}
// =========================================
// SECTION 8 — RECOMMENDATION REVEAL
// =========================================

const recommendationElements =
    document.querySelectorAll(".recommendation-reveal");

if (recommendationElements.length > 0) {

    const recommendationObserver = new IntersectionObserver(
        (entries) => {

            entries.forEach((entry) => {

                if (entry.isIntersecting) {

                    entry.target.classList.add("visible");

                    recommendationObserver.unobserve(entry.target);

                }

            });

        },
        {
            threshold: 0.08
        }
    );


    recommendationElements.forEach((element) => {

        recommendationObserver.observe(element);

    });

}
// =========================================
// SECTION 9 — CONTACT REVEAL
// =========================================

const contactElements =
    document.querySelectorAll(".contact-reveal");

if (contactElements.length > 0) {

    const contactObserver = new IntersectionObserver(
        (entries) => {

            entries.forEach((entry) => {

                if (entry.isIntersecting) {

                    entry.target.classList.add("visible");

                    contactObserver.unobserve(entry.target);

                }

            });

        },
        {
            threshold: 0.08
        }
    );


    contactElements.forEach((element) => {

        contactObserver.observe(element);

    });

}