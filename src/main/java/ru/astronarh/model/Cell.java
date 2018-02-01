package ru.astronarh.model;

import com.sun.istack.internal.NotNull;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "cell", schema = "public", catalog = "crossword")
public class Cell {

    @Id
    @Column(name = "id", columnDefinition = "serial")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator="cell_id_seq")
    @SequenceGenerator(name="cell_id_seq", sequenceName="cell_id_seq", allocationSize=1)
    @NotNull
    private int id;

    @Basic
    @Column(name = "letter")
    private Character letter;

    @Basic
    @Column(name = "arrow")
    private Integer arrow;

    @Basic
    @Column(name = "question")
    private String question;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Character getLetter() {
        return letter;
    }

    public void setLetter(Character letter) {
        this.letter = letter;
    }

    public Integer getArrow() {
        return arrow;
    }

    public void setArrow(Integer arrow) {
        this.arrow = arrow;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Cell that = (Cell) o;
        return id == that.id &&
                Objects.equals(letter, that.letter) &&
                Objects.equals(arrow, that.arrow) &&
                Objects.equals(question, that.question);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, letter, arrow, question);
    }

    @Override
    public String toString() {
        return "Cell{" +
                "id=" + id +
                ", letter='" + letter + '\'' +
                ", arrow=" + arrow +
                ", question='" + question + '\'' +
                '}';
    }
}
