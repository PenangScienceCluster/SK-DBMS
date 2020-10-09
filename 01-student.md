<DIV class="markdown-body" style="font-size: 1.25em;">

# Designing a Database · *Student’s Handout*

## Identifying Requirements

Based on the instructions, try to sketch the expected webpages your clients would access if they are going to use your system. You shall group your sketches according to use cases.

---

<DIV style="page-break-before: always;">

Based on the sketches you have made, identify all entities, their attributes and relationships among them. For a better visualisation purpose, construct **an ER model** for **each relationship**.

---

</div>

<DIV style="page-break-before: always;">

Review your ER diagrams. Make sure that the diagrams cover all the requirements listed in the instructions. Make your modification starting from the first step for anything which is unwanted/unnecessary or missed out.

---

</div>

<DIV style="page-break-before: always;">

## Forming a Master Table

Create a master table by fitting all identified attributes into the header of the table. Give an appropriate name that best fits the table. Then, create a few records with random data to the table. Despite the word “random”, each record must be sensible and applicable to the use case scenarios. Make sure all the scenarios are covered in the table.

---

</div>

<DIV style="page-break-before: always;">

## Normalisation

For 1NF: Keep spliting the table until the answers for the following are **absolutely no**.

1.  Do you see **any cell** that contains **multiple value**?
2.  Do you find **any repeating group**?

Give an appropriate name and assign a key (or composite keys) for each table.

---

</div>

<DIV style="page-break-before: always;">

For 2NF: Continue splitting the table(s) until the answer for the following is **absolutely no**.

1.  Is there any **non-key attribute** which is **independent** of **any of the key attribute(s)** in the same table?

Give an appropriate name and assign a key (or composite keys) for each table.

---

</div>

<DIV style="page-break-before: always;">

For 3NF: Split the table(s) until the answer for the following is **absolutely no**.

1.  Does any of the **non-key attribute** have a **functional dependency** with another **non-key attribute** in the same table?

Give an appropriate name and assign a key (or composite keys) for each table.

---

</div>

<DIV style="page-break-before: always;">

## Construct table

Based on your results in 3NF, construct an ER diagram that includes all the tables and cardinalities among them. In order to label the cardinalities correctly, you need to refer to the instructions (where your user requirements originate) and the ER models you have drawn under the ***Identifying Requirements*** section.

---

</div>

<div class="workaround" style="display: none;">

![WORKAROUND](./assets/entrel-view.svg)

</div>

</div>
