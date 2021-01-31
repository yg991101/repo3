package org.h7n9;

import alice.tuprolog.Int;
import alice.tuprolog.InvalidTheoryException;
import alice.tuprolog.MalformedGoalException;
import alice.tuprolog.NoMoreSolutionException;
import alice.tuprolog.NoSolutionException;
import alice.tuprolog.Prolog;
import alice.tuprolog.SolveInfo;
import alice.tuprolog.Struct;
import alice.tuprolog.Theory;
import alice.tuprolog.Var;

public class Test {

	public static void main(String[] args) throws MalformedGoalException,
			NoSolutionException, NoMoreSolutionException, InvalidTheoryException {
//		Struct clause1 = new Struct(":-", new Struct("p", new Var("X")),
//				new Struct("q", new Var("X")));
//		Struct clause2 = new Struct(":-", new Struct("q", new Int(0)),
//				new Struct("true"));
//		System.out.println(clause1 + " is a clause? " + clause1.isClause());
//		System.out.println(clause2 + " is a clause? " + clause2.isClause());
		Prolog engine = new Prolog();
//		Struct clauseList = new Struct(clause1, new Struct(clause2,
//				new Struct()));
//		System.out.println(clauseList + " is a list? " + clauseList.isList());
//		Theory t = new Theory(clauseList);
//		engine.addTheory(t);
//		SolveInfo info = engine.solve("p(X).");
//		while (info.isSuccess()) {
//			System.out.println("solution: " + info.getSolution()
//					+ " - bindings: " + info);
//			if (engine.hasOpenAlternatives()) {
//				info = engine.solveNext();
//			} else {
//				break;
//			}
//		}
		Theory t = new Theory("h7n9report(X,Y,U):-h7n9(X,U),h7n9(Y,U).\n"
				+ "h7n9(K,[K/T]):-true.\n"
				+ "h7n9(K,[K1/T]):-h7n9(K,K1).\n"
				+ "h7n9(rhinorrhoea,[rhinorrhoea,rhinobyon,pytexia,chill,fatigue,throatspain,limbspain,diarrhoea,vomit]).\n"
				+ "h7n9(rhinobyon,[rhinorrhoea,rhinobyon,pytexia,chill,fatigue,throatspain,limbspain,diarrhoea,vomit]).\n"
				+ "h7n9(pytexia,[rhinorrhoea,rhinobyon,pytexia,chill,fatigue,throatspain,limbspain,diarrhoea,vomit]).\n"
				+ "h7n9(chill,[rhinorrhoea,rhinobyon,pytexia,chill,fatigue,throatspain,limbspain,diarrhoea,vomit]).\n");
				//+ "h7n9(rhinobyon,[rhinorrhoea,rhinobyon,pytexia,chill,fatigue,throatspain,limbspain],true).");
		engine.addTheory(t);
		SolveInfo info = engine.solve("h7n9report([rhinorrhoea,rhinobyon,pytexia,chill,fatigue,throatspain,limbspain,diarrhoea,vomit], [rhinorrhoea,rhinobyon,pytexia,chill,fatigue,throatspain,limbspain,diarrhoea,vomit],pytexia).");
//		SolveInfo info = engine.solve("symptom(rhinobyon, X).");
//		SolveInfo info = engine.solve("append([3,5],[2,3],X).");
		
		System.out.println(info.getSolution());
	}
}
