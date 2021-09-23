require_relative 'node.rb'

class LinkedList
    attr_reader :head, :tail

    def initialize
        @head = nil
        @tail = nil
    end

    def append(value)
        new_node = Node.new(value)

        @head ||= new_node
        if !@tail
            @tail = new_node
        else
            @tail.next_node = new_node
        end
        @tail = new_node
    end

    def prepend(value)
        new_node = Node.new(value, @head)

        @head = new_node
    end

    def size
        pointer = @head
        size = 1
        while pointer
            size += 1
            pointer = @head.next_node
        end
        return size
    end

    def at(index)
        counter = 0
        pointer = @head
        until counter == index do
            counter += 1
            pointer = pointer.next_node
        end
        return pointer
    end

    def pop
        pointer = @head
        pointer = pointer.next_node until pointer.next_node == @tail
        current_node.next_node = nil
        @tail = current_node
    end

    def contains?(value)
        pointer = @head
        pointer = pointer.next_node until pointer.node_value == value || pointer.next_node.nil?
        return true if pointer.node_value == value
        return false
    end

    def find(value)
        counter = 0
        pointer = @head
        pointer = pointer.next_node until pointer.node_value == value || pointer.next_node.nil?
        counter += 1
        return counter if pointer.node_value == value
        return nil
    end

    def to_s
        pointer = @head
        string_to_print = "( #{pointer.node_value} )"
        while !pointer.node_value.nil?
            pointer = pointer.next_node
            string_to_print += " -> ( #{pointer.node_value} )"
        end
        return string_to_print
    end

    def insert_at(value, index)
        pointer = @head
        counter = 0
        while counter != index
            pointer = pointer.next_node
            counter += 1
        end
        node_after = pointer.next_node
        pointer.next_node = value
        pointer = pointer.next_node
        pointer.next_node = node_after
    end

    def remove_at(index)
        pointer = @head
        counter = 1
        while counter != index
            pointer = pointer.next_node
            counter += 1
        end
        pointer.next_node = pointer.next_node.next_node
    end
end