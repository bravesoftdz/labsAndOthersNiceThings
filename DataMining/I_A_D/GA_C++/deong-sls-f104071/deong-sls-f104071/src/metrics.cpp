/*!
 * \file metrics.cpp
 *
 * the performance of a search algorithm can be characterised by
 * any of several performance metrics.  these classes define some
 * useful metrics for stochastic local search.
 *
 * Deon Garrett
 * deong@acm.org
 */

#include <iostream>
#include <string>
#include <list>
#include <vector>
#include <deque>
#include "metrics.h"
#include "chromosome.h"
#include "encoding.h"
#include "comparator.h"
#include "population.h"
#include "configuration.h"
#include "keywords.h"
#include "utilities.h"

using namespace std;

/*!
 * \brief constructor
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
metric<Chromosome,Encoding>::metric()
{
}

/*!
 * \brief destructor
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
metric<Chromosome,Encoding>::~metric()
{
}

/*!
 * \brief notify of new chromosome evaluation
 *
 * empty definition provided so that subclasses are required to implement the
 * method only if they need notification of chromosome evaluations
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
void metric<Chromosome,Encoding>::chromosome_evaluated(const Chromosome<Encoding>& sol)
{
}

/*!
 * \brief notify of generation completion
 *
 * empty method provided so that subclasses need only implement the method
 * if they require generation notification
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
void metric<Chromosome,Encoding>::generation_completed()
{
}

/*!
 * \brief notify of generation completion
 *
 * empty method provided so that subclasses need only implement the method
 * if they require generation notification
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
void metric<Chromosome,Encoding>::generation_completed(const population<Chromosome,Encoding>& pop)
{
}

/*!
 * \brief perform any required computation
 *
 * empty method provided because most subclasses will not require
 * computation
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
void metric<Chromosome,Encoding>::compute()
{
}

/*!
 * \brief constructor
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
evaluation_counter<Chromosome,Encoding>::evaluation_counter() :
    m_num_evals(0)
{
}

/*!
 * \brief destructor
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
evaluation_counter<Chromosome,Encoding>::~evaluation_counter()
{
}

/*!
 * \brief reset the eval counter
 *
 * \author deong
 * \date 07/06/2007
 */
template <template <typename> class Chromosome, typename Encoding>
void evaluation_counter<Chromosome,Encoding>::reset()
{
    m_num_evals=0;
}

/*!
 * \brief increment the evaluation count
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
void evaluation_counter<Chromosome,Encoding>::chromosome_evaluated(const Chromosome<Encoding>& sol)
{
    this->m_num_evals++;
}

/*!
 * \brief print number of evaluations used
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
void evaluation_counter<Chromosome,Encoding>::report(ostream& ostr) const
{
    ostr << "evaluations: " << this->m_num_evals << endl;
}

/*!
 * \brief constructor
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
best_solution<Chromosome,Encoding>::best_solution() :
    m_num_evals(0),
    m_evals_to_best(0)
{
}

/*!
 * \brief destructor
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
best_solution<Chromosome,Encoding>::~best_solution()
{
    delete m_comp;
}

/*!
 * \brief initialize comparator used to determine best solution
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
void best_solution<Chromosome,Encoding>::initialize(const string& prefix)
{
    comparator_factory<Chromosome,Encoding> cf;
    cf.set_prefix(prefix);
    m_comp = cf.construct();
}

/*!
 * \brief initialize with default (empty) prefix
 *
 * \author deong
 * \date 06/27/2007
 */
template <template <typename> class Chromosome, typename Encoding>
void best_solution<Chromosome,Encoding>::initialize()
{
    this->initialize("");
}

/*!
 * \brief reset the solution metric
 *
 * \author deong
 * \date 07/06/2007
 */
template <template <typename> class Chromosome, typename Encoding>
void best_solution<Chromosome,Encoding>::reset()
{
    m_num_evals=0;
    m_evals_to_best=0;
}

/*!
 * \brief update best solution if necessary
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
void best_solution<Chromosome,Encoding>::chromosome_evaluated(const Chromosome<Encoding>& sol)
{
    if(this->m_num_evals == 0)
    {
        this->m_best = sol;
        this->m_num_evals++;
        return;
    }
    
    this->m_num_evals++;

    if(m_comp->compare(sol,this->m_best) == -1)
    {
        this->m_best = sol;
        this->m_evals_to_best = this->m_num_evals;
    }
}

/*!
 * \brief print best solution and number of evaluations required to find it
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
void best_solution<Chromosome,Encoding>::report(ostream& ostr) const
{
    ostr << "best_solution: " << endl << this->m_best << endl;
    ostr << "evaluations_to_best: " << this->m_evals_to_best << endl;
}

/*!
 * \brief constructor
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
generation_counter<Chromosome,Encoding>::generation_counter() :
    m_num_gens(0)
{
}

/*!
 * \brief destructor
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
generation_counter<Chromosome,Encoding>::~generation_counter()
{
}

/*!
 * \brief reset the generation count
 *
 * \author deong
 * \date 07/06/2007
 */
template <template <typename> class Chromosome, typename Encoding>
void generation_counter<Chromosome,Encoding>::reset()
{
    m_num_gens=0;
}

/*!
 * \brief increment generation count
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
void generation_counter<Chromosome,Encoding>::generation_completed(const population<Chromosome,Encoding>& pop)
{
    this->m_num_gens++;
}

/*!
 * \brief increment generation count
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
void generation_counter<Chromosome,Encoding>::generation_completed()
{
    this->m_num_gens++;
}

/*!
 * \brief print number of generations completed
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
void generation_counter<Chromosome,Encoding>::report(ostream& ostr) const
{
    ostr << "generations: " << this->m_num_gens << endl;
}

/*!
 * \brief constructor
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
hypervolume<Chromosome,Encoding>::hypervolume() :
    m_hypervolume(0)
{
}

/*!
 * \brief destructor
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
hypervolume<Chromosome,Encoding>::~hypervolume()
{
}

/*!
 * \brief read reference point from configuration database
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
void hypervolume<Chromosome,Encoding>::initialize(const string& prefix)
{
    configuration::vector_parameter<typename Encoding::FitnessType>(prefix+keywords::REFERENCE_POINT,
								    m_ref_point, true);
}

/*!
 * \brief initialize with default empty prefix
 *
 * \author deong
 * \date 06/27/2007
 */
template <template <typename> class Chromosome, typename Encoding>
void hypervolume<Chromosome,Encoding>::initialize()
{
    this->initialize("");
}

/*!
 * \brief reset the hypervolume metric
 *
 * \author deong
 * \date 07/06/2007
 */
template <template <typename> class Chromosome, typename Encoding>
void hypervolume<Chromosome,Encoding>::reset()
{
    m_hypervolume=0;
}

/*!
 * \brief update the current population
 *
 * Note: computation of hypervolume is expensive, so we only do it on demand,
 * when the compute method is called.
 * 
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
void hypervolume<Chromosome,Encoding>::generation_completed(const population<Chromosome,Encoding>& pop)
{
    m_pop = pop;
}

/*!
 * \brief print hypervolume of current nondominated set
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
void hypervolume<Chromosome,Encoding>::report(ostream& ostr) const
{
    ostr << "hypervolume: " << m_hypervolume << endl;
}

/*!
 * \brief compute the hypervolume of the nondominated set
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
void hypervolume<Chromosome,Encoding>::compute()
{
    m_hypervolume = 0;
    deque<vector<typename Encoding::FitnessType> > ps;

    // push all fitness vectors onto the stack
    for(unsigned int i=0; i<m_pop.size(); i++)
    {
        ps.push_front(m_pop[i].fitness);
    }
    
    while(!ps.empty())
    {
        vector<typename Encoding::FitnessType> p = ps.front();
        ps.pop_front();

        // for each point, compute the possible spawns
        vector<typename Encoding::FitnessType> oppcorner(p.size());
        for(unsigned int obj=0; obj<p.size(); obj++)
        {
            typename Encoding::FitnessType infimum = m_ref_point[obj];
            typename deque<vector<typename Encoding::FitnessType> >::iterator it;
            for(it=ps.begin(); it!=ps.end(); it++)
            {
                if((*it)[obj] >= p[obj] && (*it)[obj] < infimum)
                {
                    infimum = (*it)[obj];
                }
            }
            oppcorner[obj] = infimum;
        }
        
        // add the hypervolue of the hypercube bounded by the current
        // point and its opposite corner to the total hypervolume
        double curr_hv = 1;
        for(unsigned int i=0; i<p.size(); i++)
        {
            curr_hv *= (oppcorner[i] - p[i]);
        }
        m_hypervolume += curr_hv;

        // delete any weakly dominated individuals from the pareto set
        // NOTE: shouldn't need to do this after changing > to >= in the
        // loop above computing the opposite corner, but it doesn't hurt
        // anything to leave it here
        for(int i=int(ps.size()-1); i>=0; i--)
        {
            if(weakly_dominated(ps[i],p))
            {
                ps.erase(ps.begin()+i);
            }
        }
        
        
        // now we know the opposite corner, we can compute the possible spawns
        for(unsigned int i=0; i<oppcorner.size(); i++)
        {
            if(oppcorner[i] != m_ref_point[i])
            {
                vector<typename Encoding::FitnessType> pprime = p;
                pprime[i] = oppcorner[i];
                
                if(!weakly_dominated_by_archive(pprime,ps))
                {
                    ps.push_front(pprime);
                }
            }
        }
    }
}

/*!
 * \brief determine if a chromosome is weakly dominated by another
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
bool hypervolume<Chromosome,Encoding>::weakly_dominated(const vector<typename Encoding::FitnessType>& p1,
							const vector<typename Encoding::FitnessType>& p2) const
{
    for(unsigned int i=0; i<p1.size(); i++)
    {
        if(p1[i] < p2[i])
        {
            return false;
        }
    }
    return true;
}

/*!
 * \brief determine if a chromosome is weakly dominated by the current archive
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
bool hypervolume<Chromosome,Encoding>::weakly_dominated_by_archive(const vector<typename Encoding::FitnessType>& p,
                                                                        deque<vector<typename Encoding::FitnessType> >& ps) const
{
    for(typename deque<vector<typename Encoding::FitnessType> >::iterator it=ps.begin(); it!=ps.end(); it++)
    {
        if(weakly_dominated(p,*it))
        {
            return true;
        }
    }
    return false;
}

/*!
 * \brief create and initialize a list of metrics
 *
 * \author deong
 * \date 05/10/2007
 *
 * \code
 * Modification History
 * MM/DD/YYYY	DESCRIPTION
 * \endcode
 */
template <template <typename> class Chromosome, typename Encoding>
list<metric<Chromosome,Encoding>*> metric_factory<Chromosome,Encoding>::construct()
{
    list<metric<Chromosome,Encoding>*> metlist;
    list<string> mets;

    configuration::list_parameter(this->m_prefix+keywords::METRIC, mets, false);
    for(list<string>::iterator it=mets.begin(); it!=mets.end(); it++)
    {
        string curr = (*it);
        if(curr==keywords::EVALUATION_COUNTER)
        {
            evaluation_counter<Chromosome,Encoding>* m = new evaluation_counter<Chromosome,Encoding>;
            metlist.push_back(m);
        }
        else if(curr==keywords::GENERATION_COUNTER)
        {
            generation_counter<Chromosome,Encoding>* m = new generation_counter<Chromosome,Encoding>;
            metlist.push_back(m);
        }
        else if(curr==keywords::BEST_SOLUTION)
        {
            best_solution<Chromosome,Encoding>* m = new best_solution<Chromosome,Encoding>;
            m->initialize(this->m_prefix);
            metlist.push_back(m);
        }
        else if(curr==keywords::HYPERVOLUME)
        {
            hypervolume<Chromosome,Encoding>* lm = new hypervolume<Chromosome,Encoding>;
            lm->initialize(this->m_prefix);
            metlist.push_back(lm);
        }
        else
        {
            error("invalid metric specified: " + curr);
        }
    }
    return metlist;
}
