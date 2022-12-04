# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
    #A continuación se detalla qué operaciones puede realizar cada rol:
    #
    #     Administrador puede:
    #         Visualizar los datos de su perfil de usuario.
    #         Modificar su contraseña.
    #         Gestionar todas las sucursales.
    #         Gestionar los horarios de atención de todas las sucursales.
    #         Gestionar todos los usuarios.
    #     Personal bancario puede:
    #         Visualizar los datos de su perfil de usuario.
    #         Modificar su contraseña.
    #         Visualizar la información de cualquier sucursal.
    #         Consultar y atender turnos de su sucursal (no puede acceder a ningún tipo de operación de los turnos de otras sucursales distintas de la propia). Al atender un turno, le deberá cargar al mismo un comentario que indique el resultado de la atención (requerido), y se cambiará el estado del turno a atendido, guardando la información que indique qué usuario Personal bancario fue el que atendió el turno.
    #         Visualizar la información de los usuarios con rol Cliente (no puede acceder a ningún tipo de operación de los usuarios con rol Administrador o Personal bancario).
    #     Cliente puede:
    #         Visualizar los datos de su perfil de usuario.
    #         Modificar su contraseña.
    #         Solicitar un turno para ser atendido en una sucursal (seleccionando la sucursal, el día y el horario de atención, y un motivo de la solicitud). Al solicitar un turno, el mismo deberá quedar en estado pendiente.
    #         Modificar un turno propio con estado pendiente.
    #         Cancelar un turno propio con estado pendiente, lo cual puede o bien cambiar el estado del mismo a cancelado, o bien eliminarlo por completo del sistema. Cualquiera sea el mecanismo de cancelación que elijas, el turno cancelado no deberá aparecer más en ninguna parte del sistema.
    #         Visualizar sus propios turnos (pasados y futuros), en los cuales podrá ver la información referente a la atención (qué usuario atendió el turno y el comentario de resultado que ingresó) en los turnos que hayan sido atendidos.
    #
    # Los usuarios con rol Administrador y Personal bancario solo deberán poder ser creados por un usuario con rol Administrador, desde la interfaz de gestión de usuarios; en cambio los usuarios con rol Cliente podrán registrarse desde la interfaz pública del sistema.
    # methods :index, :show, :create, :update, :destroy
    if user.present?
      if user.admin?
        can [:index, :show, :create, :update, :destroy], :all
      end
      if user.staff?
        can [:index, :show], Branch
        can [:index, :show], User, role: 'client'
        can [:index, :show, :update], Appointment, branch_id: user.branch_id, status: [0, 2], date: Date.today..Date.today+1.day

      end
      if user.client?
        can [:index], Branch

        can [:index, :show, :create, :destroy], Appointment, user_id: user.id
      end
    end

  end
end